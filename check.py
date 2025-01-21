import os
import json
import base64
import hashlib
import hmac
import uuid
import sys
# import tkinter as tk
from datetime import datetime, timedelta
from .external import pymysql
import glob

DB_HOST = 'server37.hosting.reg.ru'
DB_NAME = 'u2805911_default'
DB_USER = 'u2805911_default'
DB_PASSWORD = 'r1zUH8Wmqk1KPj09'

# LICENSE_STATUS определяет текущее состояние лицензии:
# 0 - не проверено
# 1 - лицензия действительна
# 2 - срок действия лицензии истёк
# 3 - повреждение / неправильные данные лицензии
# 4 - файл лицензии отсутствует
# 5 - несовпадение MAC-адреса
# 6 - ошибка подключения к бд

LICENSE_STATUS = 0
SOFTWARE_NAME = "additionmodulespack"
PRIVATE_KEY = b"rigstudio_s_key"

# root = tk.Tk()
# root.withdraw()
# blank_img = tk.PhotoImage(width=1, height=1)
# root.iconphoto(False, blank_img)


def set_license_status(status):
    global LICENSE_STATUS
    LICENSE_STATUS = status


def get_local_mac_address() -> str:
    local_mac_int = uuid.getnode()
    local_mac_str = ":".join(
        [f"{(local_mac_int >> i) & 0xFF:02x}" for i in range(0, 8 * 6, 8)][::-1]
    )
    return local_mac_str.lower()


def check_and_update_expiry_date_in_db(unique_key: str, mac_address: str, expiry_days: int) -> str:
    try:
        days = int(expiry_days)
    except ValueError:
        print("Ошибка: поле expiry_days не является числом.")
        set_license_status(6)
        return None

    new_expiry_date = (datetime.now().date() + timedelta(days=days)).strftime("%Y-%m-%d")
    connection = None
    try:
        connection = pymysql.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        with connection.cursor() as cursor:
            sql = """
                UPDATE licenses_custom 
                SET expiry_date = %s, mac_address = %s
                WHERE unique_key = %s
            """
            rows_affected = cursor.execute(sql, (new_expiry_date, mac_address, unique_key))
        connection.commit()

        if rows_affected == 0:
            print(f"Не найдена лицензия с unique_key={unique_key}.")
            set_license_status(6)
            return None

    except Exception as e:
        print(f"Ошибка при работе с БД: {e}")
        set_license_status(6)
        return None
    finally:
        if connection:
            connection.close()

    return new_expiry_date


def check_license(software_name):
    global LICENSE_STATUS

    rootPath = os.path.normpath(os.path.dirname(__file__))

    # Используем glob для поиска всех файлов, начинающихся на 'license' без расширения
    license_files = glob.glob(os.path.join(rootPath, "licenses", "license*"))
    print(2222, software_name)
    # for file in all_license_files:
    #     if os.path.isfile(file):  # Проверяем, что это файл
    #         _, file_extension = os.path.splitext(file)  # Разделяем имя файла и его расширение
    #         if file_extension == '':  # Проверяем, что расширение пустое
    #             license_files.append(file)
    # license_files = [f for f in glob.glob("license*") if os.path.isfile(f) and os.path.splitext(f)[1] == '']
    
    if not license_files:
        set_license_status(4)
        return LICENSE_STATUS

    # Изначально статус не проверен
    set_license_status(0)

    for LICENSE_FILE in license_files:
        try:
            with open(LICENSE_FILE, "r", encoding="utf-8") as f:
                j = json.load(f)
        except:
            continue  # Переходим к следующему файлу

        d = j.get("data")
        s = j.get("signature")
        if not d or not s:
            continue  # Неправильный формат, переходим к следующему файлу

        try:
            raw_data = base64.b64decode(d.encode("utf-8")).decode("utf-8")
        except:
            continue  # Неправильные данные, переходим к следующему файлу

        computed_sig = hmac.new(PRIVATE_KEY, raw_data.encode("utf-8"), hashlib.sha256).hexdigest()
        if not hmac.compare_digest(computed_sig, s):
            continue  # Неверная подпись, переходим к следующему файлу

        try:
            o = json.loads(raw_data)
        except:
            continue  # Неправильные данные, переходим к следующему файлу

        if "software_name" not in o or "expiry_days" not in o or "unique_key" not in o:
            continue  # Отсутствуют необходимые поля, переходим к следующему файлу

        if o["software_name"] != software_name:
            continue  # Несоответствие имени ПО, переходим к следующему файлу

        expiry_date_str = o.get("expiry_date")
        local_mac_str = get_local_mac_address()

        if not expiry_date_str:
            new_expiry_date_str = check_and_update_expiry_date_in_db(
                unique_key=o["unique_key"],
                mac_address=local_mac_str,
                expiry_days=o["expiry_days"]
            )

            if new_expiry_date_str is None:
                continue  # Ошибка при обновлении даты, переходим к следующему файлу

            o["expiry_date"] = new_expiry_date_str
            o["mac_address"] = local_mac_str

            updated_data = json.dumps(o, ensure_ascii=False)
            updated_sig = hmac.new(PRIVATE_KEY, updated_data.encode("utf-8"), hashlib.sha256).hexdigest()
            j["data"] = base64.b64encode(updated_data.encode("utf-8")).decode("utf-8")
            j["signature"] = updated_sig

            try:
                with open(LICENSE_FILE, "w", encoding="utf-8") as f:
                    json.dump(j, f, ensure_ascii=False)
            except:
                continue  # Не удалось записать файл, переходим к следующему

            set_license_status(1)
            return LICENSE_STATUS # Лицензия успешно обновлена

        try:
            expiry_dt = datetime.strptime(expiry_date_str, "%Y-%m-%d").date()
        except:
            continue  # Неправильный формат даты, переходим к следующему файлу
        
        if datetime.now().date() >= expiry_dt:
            set_license_status(2)
            return LICENSE_STATUS

        stored_mac = o.get("mac_address")
        if not stored_mac:
            o["mac_address"] = local_mac_str
            updated_data = json.dumps(o, ensure_ascii=False)
            updated_sig = hmac.new(PRIVATE_KEY, updated_data.encode("utf-8"), hashlib.sha256).hexdigest()
            j["data"] = base64.b64encode(updated_data.encode("utf-8")).decode("utf-8")
            j["signature"] = updated_sig

            try:
                with open(LICENSE_FILE, "w", encoding="utf-8") as f:
                    json.dump(j, f, ensure_ascii=False)
            except:
                continue  # Не удалось записать файл, переходим к следующему

            set_license_status(1)
        else:
            if stored_mac.lower() != local_mac_str.lower():
                set_license_status(5)
                return LICENSE_STATUS
            else:
                set_license_status(1)
                return LICENSE_STATUS

    # Если ни один файл не прошёл проверку
    if LICENSE_STATUS == 0:
        set_license_status(3)

    return LICENSE_STATUS
