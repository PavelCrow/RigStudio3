//Maya ASCII 2022 scene
//Name: fingers.ma
//Last modified: Tue, Jun 18, 2024 04:30:38 AM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 22631)";
fileInfo "UUID" "11E9B0E2-4A97-6D86-521D-66924DA18873";
createNode transform -n "mod";
	rename -uid "AEB94CF3-4469-D7D9-6076-95A1B694D245";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "D7853ADA-49F6-897E-4F12-E7AC1BAA48B4";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "F0F00D91-4B38-ECC4-B2EA-E083C23249F2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -k on ".globalSize" 0.1;
	setAttr -k on ".lineSize" 0.019999999999999907;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "0232B045-4B74-84F0-DFB3-BEAA77AFD825";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "EB14F3BF-4740-E797-AEEF-34B3A2F3B2AF";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		;
createNode transform -n "mainPoser_clusterHandle" -p "mainPoser";
	rename -uid "0D669623-4EB6-3FF2-21A6-A6947176D25F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "";
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "19A500E1-4653-D9E4-0C35-BD9F9B981FF9";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "thumbFinger_mainPoser" -p "mainPoser";
	rename -uid "BC63EDC4-41E3-327D-C2C9-179CF2EE6E29";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.28812560489975525 0 0.48826241970730738 ;
	setAttr ".r" -type "double3" 39.423518114671246 -45.000000000000114 -2.2489917831974772e-15 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode nurbsCurve -n "thumbFinger_mainPoserShape" -p "thumbFinger_mainPoser";
	rename -uid "E9EAE87B-4381-560A-71BD-2CB84008D3A4";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "thumbFinger_mainPoserShapeOrig" -p "thumbFinger_mainPoser";
	rename -uid "F4752012-4499-3F5E-6418-0E986E81ECBB";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		;
createNode transform -n "thumbFinger_mainPoser_clusterHandle" -p "thumbFinger_mainPoser";
	rename -uid "067DCC1D-4E32-25D0-3EA5-80BC432E0DE8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode clusterHandle -n "thumbFinger_mainPoser_clusterHandleShape" -p "thumbFinger_mainPoser_clusterHandle";
	rename -uid "769740C8-46FA-8B14-E5BA-FFB06D7BB19A";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "thumbFingerA_poser" -p "thumbFinger_mainPoser";
	rename -uid "7D77BF3F-4F59-D8A4-444D-D9B1FC58D857";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "thumbFingerA";
createNode nurbsSurface -n "thumbFingerA_poserNurbsShape" -p "thumbFingerA_poser";
	rename -uid "61298ADD-47F5-F360-3B93-1A879DE3B733";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "thumbFingerA_poser_locShape" -p "thumbFingerA_poser";
	rename -uid "93B8ADB5-400D-CF8F-C142-9FB2FF4D1BB0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerA_poserOrient" -p "thumbFingerA_poser";
	rename -uid "4F784EE3-482D-9C07-A4EE-A68615568B11";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerA";
createNode locator -n "thumbFingerA_poserOrientShape" -p "thumbFingerA_poserOrient";
	rename -uid "EB7CEBE9-451C-4391-995B-349D873D0DA7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "thumbFingerA_poserOrient_aimConstraint1" -p "thumbFingerA_poserOrient";
	rename -uid "A42626FD-4506-E866-887C-70BC77E47597";
	addAttr -ci true -sn "w0" -ln "thumbFingerB_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "thumbFinger_1_initLoc" -p "thumbFingerA_poserOrient";
	rename -uid "8FD9D52A-4543-0BC3-BC8E-B196EE9BE956";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 -4.163336342344337e-17 0 ;
	setAttr ".r" -type "double3" 1.5902773407317584e-15 6.3611093629270335e-15 -9.5416640443905503e-15 ;
createNode locator -n "thumbFinger_1_initLocShape" -p "thumbFinger_1_initLoc";
	rename -uid "8086A8F7-46FE-FA97-80B9-55A6B0C43A5A";
	setAttr -k off ".v";
createNode transform -n "thumbFingerB_poser" -p "thumbFinger_mainPoser";
	rename -uid "2A12EFC5-416E-ADD9-DDDF-0E81036237AA";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.21257868054011406 0 0.2798204759582601 ;
	setAttr -k on ".t";
	setAttr -l on ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "thumbFingerB";
createNode nurbsSurface -n "thumbFingerB_poserNurbsShape" -p "thumbFingerB_poser";
	rename -uid "F9C88A7A-42AF-6350-EE41-0C8AB223E263";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "thumbFingerB_poser_locShape" -p "thumbFingerB_poser";
	rename -uid "19D19CB4-4FF4-07B7-6D40-DEBF99A74B0E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerB_poserOrient" -p "thumbFingerB_poser";
	rename -uid "4312F284-46C1-FFF5-6CF6-5F994756B27A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerB";
createNode locator -n "thumbFingerB_poserOrientShape" -p "thumbFingerB_poserOrient";
	rename -uid "6D545275-4FB6-8215-D47B-A7898A696BF5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "thumbFingerB_poserOrient_aimConstraint1" -p "thumbFingerB_poserOrient";
	rename -uid "4AC77DF0-4BF1-AD7B-7150-E09EC1009E92";
	addAttr -ci true -sn "w0" -ln "thumbFingerC_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "thumbFinger_2_initLoc" -p "thumbFingerB_poserOrient";
	rename -uid "0A9564EB-4FFC-909E-A1DF-598B3DD7B47A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 -9.7144514654701197e-17 -8.3266726846886741e-17 ;
	setAttr ".r" -type "double3" 0 1.2722218725854064e-14 -6.361109362927032e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "thumbFinger_2_initLocShape" -p "thumbFinger_2_initLoc";
	rename -uid "4D2D31A9-46BE-8B40-3BF1-22BF331FD023";
	setAttr -k off ".v";
createNode transform -n "thumbFingerC_poser" -p "thumbFinger_mainPoser";
	rename -uid "A7A88EA3-43EE-2615-E8AA-C9B46A8D6685";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "thumbFingerC";
createNode nurbsSurface -n "thumbFingerC_poserNurbsShape" -p "thumbFingerC_poser";
	rename -uid "0549F5C4-4380-2668-7340-8ABFF3D56853";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "thumbFingerC_poser_locShape" -p "thumbFingerC_poser";
	rename -uid "0F83C397-423C-9C6C-DC71-E4A9BE1428EC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerC_poserOrient" -p "thumbFingerC_poser";
	rename -uid "341C4983-4E1E-0E36-4573-0495E6BD28A4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerC";
createNode locator -n "thumbFingerC_poserOrientShape" -p "thumbFingerC_poserOrient";
	rename -uid "DB468603-4DC2-690D-05E1-EBBC409FCD7C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "thumbFingerC_poserOrient_aimConstraint1" -p "thumbFingerC_poserOrient";
	rename -uid "0E811EEF-4587-CEB1-1774-0394292E1D24";
	addAttr -ci true -sn "w0" -ln "thumbFingerD_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "thumbFinger_3_initLoc" -p "thumbFingerC_poserOrient";
	rename -uid "6C575BFB-40E4-9FC0-000F-069BA39F0097";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 -6.9388939039072284e-17 -1.9428902930940239e-16 ;
	setAttr ".r" -type "double3" -3.1805546814635152e-15 1.2722218725854064e-14 -6.361109362927032e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000009 1.0000000000000004 ;
createNode locator -n "thumbFinger_3_initLocShape" -p "thumbFinger_3_initLoc";
	rename -uid "EE23313A-4646-A85A-36E3-DF8C27A75611";
	setAttr -k off ".v";
createNode transform -n "thumbFingerD_poser" -p "thumbFinger_mainPoser";
	rename -uid "D9DE08A2-429D-F4AD-9EB3-629F1505B78B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "thumbFingerD";
createNode nurbsSurface -n "thumbFingerD_poserNurbsShape" -p "thumbFingerD_poser";
	rename -uid "B5BCCE16-4A6A-591E-4638-A892AF6AD1E1";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "thumbFingerD_poser_locShape" -p "thumbFingerD_poser";
	rename -uid "7BF2194A-4E77-D319-A821-EF86276BB51A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerD_poserOrient" -p "thumbFingerD_poser";
	rename -uid "A9960256-4B4B-4D78-1555-C5B5BB5130DA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerD";
createNode locator -n "thumbFingerD_poserOrientShape" -p "thumbFingerD_poserOrient";
	rename -uid "BC401C1B-4BB9-6CBF-DCE5-5D9EFE66A656";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pinkyFingerRoot_poser" -p "mainPoser";
	rename -uid "E601D7AE-4452-7E32-45C5-4FAEB66A3BE3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.35665792465199897 4.4408920985006262e-16 -0.20358022444175916 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerRoot";
createNode nurbsSurface -n "pinkyFingerRoot_poserNurbsShape" -p "pinkyFingerRoot_poser";
	rename -uid "0F058823-4A78-F9AA-9A3E-3A9E530D5221";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "pinkyFingerRoot_poser_locShape" -p "pinkyFingerRoot_poser";
	rename -uid "B5F114A1-4BE6-9E4F-EF0A-6BA09AE6171B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerRoot_poserOrient" -p "pinkyFingerRoot_poser";
	rename -uid "CBE6CF7E-4EAD-DCE6-C1C6-759F021915BA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerRoot";
createNode locator -n "pinkyFingerRoot_poserOrientShape" -p "pinkyFingerRoot_poserOrient";
	rename -uid "5F31CF91-4D49-6543-364C-0185FB4A5137";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerRoot_poserOrient_aimConstraint1" -p "pinkyFingerRoot_poserOrient";
	rename -uid "3EA5B519-4924-A774-6652-B6BC9F797C3E";
	addAttr -ci true -sn "w0" -ln "pinkyFingerA_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" -2.6592300015262948e-15 4.7891053861249056 -6.3591809174144774e-14 ;
	setAttr -k on ".w0";
createNode transform -n "pinkyFingerRoot_initLoc" -p "pinkyFingerRoot_poserOrient";
	rename -uid "20B16585-41E5-0064-39DD-2D9354B3998F";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
createNode locator -n "pinkyFingerRoot_initLocShape" -p "pinkyFingerRoot_initLoc";
	rename -uid "B9BC640E-454D-9A88-80AE-CFA438EA4A0D";
	setAttr -k off ".v";
createNode transform -n "ringFingerRoot_poser" -p "mainPoser";
	rename -uid "8CEC2E30-4A82-6579-27D3-1BAFCA428C4F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.35665792465199897 0 -0.050675101633040009 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFingerRoot";
createNode nurbsSurface -n "ringFingerRoot_poserNurbsShape" -p "ringFingerRoot_poser";
	rename -uid "1928226C-410A-CF74-C75C-8EBA1398CFFA";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "ringFingerRoot_poser_locShape" -p "ringFingerRoot_poser";
	rename -uid "47D873DB-4ED1-92DF-EABA-80BC6D826B94";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerRoot_poserOrient" -p "ringFingerRoot_poser";
	rename -uid "6695E38F-41F2-CCB2-9420-A6A16FF77F2B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerRoot";
createNode locator -n "ringFingerRoot_poserOrientShape" -p "ringFingerRoot_poserOrient";
	rename -uid "7AF4416F-445B-BC53-DA7E-C99ED300F108";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerRoot_poserOrient_aimConstraint1" -p "ringFingerRoot_poserOrient";
	rename -uid "817C1283-43E5-1A59-1E03-A8A474FA321A";
	addAttr -ci true -sn "w0" -ln "ringFingerA_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 0 -2.5096743599507234 0 ;
	setAttr -k on ".w0";
createNode transform -n "ringFingerRoot_initLoc" -p "ringFingerRoot_poserOrient";
	rename -uid "78252686-46C0-03AF-319D-84993D9AE3BC";
	setAttr ".v" no;
createNode locator -n "ringFingerRoot_initLocShape" -p "ringFingerRoot_initLoc";
	rename -uid "44D785C3-4476-846A-15F0-61852803DCBE";
	setAttr -k off ".v";
createNode transform -n "middleFingerRoot_poser" -p "mainPoser";
	rename -uid "5947B20C-421D-FDC3-0E74-DB9257FC2077";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.35665792465199897 0 0.099044497783831398 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFingerRoot";
createNode nurbsSurface -n "middleFingerRoot_poserNurbsShape" -p "middleFingerRoot_poser";
	rename -uid "2861E353-4364-E9D8-9532-CB886A4E742D";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "middleFingerRoot_poserOrient" -p "middleFingerRoot_poser";
	rename -uid "D9451840-4504-C90C-1940-D482474C4BF1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerRoot";
createNode locator -n "middleFingerRoot_poserOrientShape" -p "middleFingerRoot_poserOrient";
	rename -uid "BAB27F3D-4C95-A18E-D3C8-1CBC136DA2B0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerRoot_poserOrient_aimConstraint1" -p "middleFingerRoot_poserOrient";
	rename -uid "8201F378-4EB4-C558-141C-D8BA251C54E1";
	addAttr -ci true -sn "w0" -ln "middleFingerA_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 0 -11.073486849769539 0 ;
	setAttr -k on ".w0";
createNode transform -n "middleFingerRoot_initLoc" -p "middleFingerRoot_poserOrient";
	rename -uid "2AC22A6F-4109-BC2E-12B4-6D919E37ABA3";
	setAttr ".v" no;
createNode locator -n "middleFingerRoot_initLocShape" -p "middleFingerRoot_initLoc";
	rename -uid "16187381-4447-08F7-4E91-5DB1092BF854";
	setAttr -k off ".v";
createNode transform -n "indexFingerRoot_poser" -p "mainPoser";
	rename -uid "B98728F7-4A54-0A63-D24C-47A5C6A756F0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.35665792465199897 0 0.26469171415994386 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFingerRoot";
createNode nurbsSurface -n "indexFingerRoot_poserNurbsShape" -p "indexFingerRoot_poser";
	rename -uid "99233B08-42C8-9FB3-EB6F-B6A224A54232";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "indexFingerRoot_poser_locShape" -p "indexFingerRoot_poser";
	rename -uid "9A007551-4C7F-C157-021C-A190EA372692";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerRoot_poserOrient" -p "indexFingerRoot_poser";
	rename -uid "C36B6E98-4C80-A10F-8CBE-CD98B8672892";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerRoot";
createNode locator -n "indexFingerRoot_poserOrientShape" -p "indexFingerRoot_poserOrient";
	rename -uid "DCF03518-4B70-F3B9-7AD5-7899BE3CEABF";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerRoot_poserOrient_aimConstraint1" -p "indexFingerRoot_poserOrient";
	rename -uid "74C33A2B-4FFD-4684-A987-E285274EB7B6";
	addAttr -ci true -sn "w0" -ln "indexFingerA_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 0 -20.624186162184753 0 ;
	setAttr -k on ".w0";
createNode transform -n "indexFingerRoot_initLoc" -p "indexFingerRoot_poserOrient";
	rename -uid "4C3C54BF-4E0F-A4BC-7B67-50BCA40029A4";
	setAttr ".v" no;
createNode locator -n "indexFingerRoot_initLocShape" -p "indexFingerRoot_initLoc";
	rename -uid "852C50C1-431B-DBAD-0E89-24BC0AE15434";
	setAttr -k off ".v";
createNode transform -n "indexFinger_mainPoser" -p "mainPoser";
	rename -uid "CDD139C7-4362-788D-D09E-388D433BBFB9";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.74951730318001086 0 0.32492759417655598 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode nurbsCurve -n "indexFinger_mainPoserShape" -p "indexFinger_mainPoser";
	rename -uid "A4162A80-48BE-11B4-67A8-4F8AB5864D78";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "indexFinger_mainPoserShapeOrig" -p "indexFinger_mainPoser";
	rename -uid "4A778AFD-4E09-97B7-B82C-319521B18576";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		;
createNode transform -n "indexFinger_mainPoser_clusterHandle" -p "indexFinger_mainPoser";
	rename -uid "CF60AE8F-4565-B3CA-0EDE-C2A5E73B1355";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode clusterHandle -n "indexFinger_mainPoser_clusterHandleShape" -p "indexFinger_mainPoser_clusterHandle";
	rename -uid "32424FFA-41E3-3C63-8983-7BAA99D37DC1";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "indexFingerA_poser" -p "indexFinger_mainPoser";
	rename -uid "5EBBB89C-468E-DF80-09B9-03BC02587CB7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFingerA";
createNode nurbsSurface -n "indexFingerA_poserNurbsShape" -p "indexFingerA_poser";
	rename -uid "3CD2FD30-4573-58C8-3647-9F81DBD8565F";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "indexFingerA_poser_locShape" -p "indexFingerA_poser";
	rename -uid "DA40E2F1-4C14-A8E9-D89B-95A705B36B26";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerA_poserOrient" -p "indexFingerA_poser";
	rename -uid "9C4BC783-48F1-A54F-F77C-38B94AF998F3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerA";
createNode locator -n "indexFingerA_poserOrientShape" -p "indexFingerA_poserOrient";
	rename -uid "64B8C665-49D3-4B1F-DD0A-CFB5F563A39C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerA_poserOrient_aimConstraint1" -p "indexFingerA_poserOrient";
	rename -uid "729BE50F-428D-1E2E-88D8-529992D21995";
	addAttr -ci true -sn "w0" -ln "indexFingerB_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "indexFinger_1_initLoc" -p "indexFingerA_poserOrient";
	rename -uid "87B25D9F-43D7-BB53-62B0-D5BC14970AD2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.1102230246251563e-16 0 0 ;
createNode locator -n "indexFinger_1_initLocShape" -p "indexFinger_1_initLoc";
	rename -uid "6F521624-4C9A-6F8D-4A90-DDAE51F23C7A";
	setAttr -k off ".v";
createNode transform -n "indexFingerB_poser" -p "indexFinger_mainPoser";
	rename -uid "89ADC0CD-494E-BE82-B3D5-1EBB4B2AFC1C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFingerB";
createNode nurbsSurface -n "indexFingerB_poserNurbsShape" -p "indexFingerB_poser";
	rename -uid "08104868-4610-E4DD-F455-67A4CAA8C446";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "indexFingerB_poser_locShape" -p "indexFingerB_poser";
	rename -uid "6BF3319F-48EA-7EB2-A9FD-BE82055E6218";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerB_poserOrient" -p "indexFingerB_poser";
	rename -uid "444A86C5-4EBF-B760-BE29-E294368DCE9D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerB";
createNode locator -n "indexFingerB_poserOrientShape" -p "indexFingerB_poserOrient";
	rename -uid "6A53A0FB-4811-455B-CFF0-C7953A3723A6";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerB_poserOrient_aimConstraint1" -p "indexFingerB_poserOrient";
	rename -uid "BC502837-41A5-C224-D3EB-39AA657859D5";
	addAttr -ci true -sn "w0" -ln "indexFingerC_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "indexFinger_2_initLoc" -p "indexFingerB_poserOrient";
	rename -uid "F246FBFA-4041-50E9-A50B-B0B325B91B7C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 0 0 ;
createNode locator -n "indexFinger_2_initLocShape" -p "indexFinger_2_initLoc";
	rename -uid "788657B8-44D4-F9A9-1DA3-C5AA890A491F";
	setAttr -k off ".v";
createNode transform -n "indexFingerC_poser" -p "indexFinger_mainPoser";
	rename -uid "26D4C7D5-4D5A-33BA-DB27-038C6D45A849";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFingerC";
createNode nurbsSurface -n "indexFingerC_poserNurbsShape" -p "indexFingerC_poser";
	rename -uid "BA2F44B1-453A-2998-BC44-F0BD97C2BBF0";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "indexFingerC_poser_locShape" -p "indexFingerC_poser";
	rename -uid "8322E87A-407D-F01B-A44F-43954F2DDE11";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerC_poserOrient" -p "indexFingerC_poser";
	rename -uid "5AC0A644-4253-B339-496A-B88D93C2479A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerC";
createNode locator -n "indexFingerC_poserOrientShape" -p "indexFingerC_poserOrient";
	rename -uid "67B46BEC-4F45-1DF5-29B2-ABB855F4C800";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerC_poserOrient_aimConstraint1" -p "indexFingerC_poserOrient";
	rename -uid "1ED8F196-4752-E7B4-4057-AEA4CF309FA3";
	addAttr -ci true -sn "w0" -ln "indexFingerD_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "indexFinger_3_initLoc" -p "indexFingerC_poserOrient";
	rename -uid "0A001BAF-421C-82A5-E3E0-1DAF179D3090";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 0 0 ;
createNode locator -n "indexFinger_3_initLocShape" -p "indexFinger_3_initLoc";
	rename -uid "049FE9EB-4545-6C93-B815-509D16EE676E";
	setAttr -k off ".v";
createNode transform -n "indexFingerD_poser" -p "indexFinger_mainPoser";
	rename -uid "44BC4534-4CC4-2754-5567-05960386026B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFingerD";
createNode nurbsSurface -n "indexFingerD_poserNurbsShape" -p "indexFingerD_poser";
	rename -uid "67361B7A-4C40-05B3-BD5C-85939C8D7B13";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "indexFingerD_poser_locShape" -p "indexFingerD_poser";
	rename -uid "C3516B1A-48B0-2C68-6F0E-2DA46281046F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerD_poserOrient" -p "indexFingerD_poser";
	rename -uid "874C0CAE-4CF1-8EF5-7DD8-548BBBB4DE4C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerD";
createNode locator -n "indexFingerD_poserOrientShape" -p "indexFingerD_poserOrient";
	rename -uid "660ED66A-49C9-8501-76F9-32A004F75775";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middleFinger_mainPoser" -p "mainPoser";
	rename -uid "220ACE95-4D55-D38F-F09F-54827BA98C66";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.7463470132132487 0 0.13489770064463968 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode nurbsCurve -n "middleFinger_mainPoserShape" -p "middleFinger_mainPoser";
	rename -uid "256E5963-4F77-4D12-07D6-DFA7683FD176";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "middleFinger_mainPoserShapeOrig" -p "middleFinger_mainPoser";
	rename -uid "D62F4DE7-448A-DB41-7A64-CAB57EFFFDD9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		;
createNode transform -n "middleFinger_mainPoser_clusterHandle" -p "middleFinger_mainPoser";
	rename -uid "A5655947-4D83-3788-F384-96B7881B61C6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode clusterHandle -n "middleFinger_mainPoser_clusterHandleShape" -p "middleFinger_mainPoser_clusterHandle";
	rename -uid "70ECC697-43FF-7E79-52D6-9397D61D53D9";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "middleFingerA_poser" -p "middleFinger_mainPoser";
	rename -uid "3C801BDF-47F4-85D0-746C-38AACD522FD7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFingerA";
createNode nurbsSurface -n "middleFingerA_poserNurbsShape" -p "middleFingerA_poser";
	rename -uid "4C2CBCA8-4758-6D9C-666D-919C575D2A6B";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "middleFingerA_poser_locShape" -p "middleFingerA_poser";
	rename -uid "899B1336-4378-3839-EBE8-E1AE3286364F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerA_poserOrient" -p "middleFingerA_poser";
	rename -uid "778FC680-41C8-1D03-0CF1-B7AAE7C1D51C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerA";
createNode locator -n "middleFingerA_poserOrientShape" -p "middleFingerA_poserOrient";
	rename -uid "BC722C3D-4638-52BC-A827-718D2769FFE6";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerA_poserOrient_aimConstraint1" -p "middleFingerA_poserOrient";
	rename -uid "60176852-4CA8-2030-FE31-F48C8624970E";
	addAttr -ci true -sn "w0" -ln "middleFingerB_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "middleFinger_1_initLoc" -p "middleFingerA_poserOrient";
	rename -uid "ACF319BA-405A-1E56-AC28-AAB9A6F340EB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 0 0 ;
createNode locator -n "middleFinger_1_initLocShape" -p "middleFinger_1_initLoc";
	rename -uid "721B0762-442C-E194-E5B4-65BE5B38034D";
	setAttr -k off ".v";
createNode transform -n "middleFingerB_poser" -p "middleFinger_mainPoser";
	rename -uid "A3FE7FED-412D-565F-5A0B-7987910D1F54";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFingerB";
createNode nurbsSurface -n "middleFingerB_poserNurbsShape" -p "middleFingerB_poser";
	rename -uid "E1B5ED38-4CEE-69D3-E77D-69AAF4FB0569";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "middleFingerB_poser_locShape" -p "middleFingerB_poser";
	rename -uid "33477120-4070-CCDD-513D-6B8F167632CE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerB_poserOrient" -p "middleFingerB_poser";
	rename -uid "23970415-4D06-3F4F-FF14-B388453CCEDF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerB";
createNode locator -n "middleFingerB_poserOrientShape" -p "middleFingerB_poserOrient";
	rename -uid "E1B2338F-4681-161C-AB33-C8A846172C55";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerB_poserOrient_aimConstraint1" -p "middleFingerB_poserOrient";
	rename -uid "29A657BE-4B91-0AC1-01D0-00AF3A389781";
	addAttr -ci true -sn "w0" -ln "middleFingerC_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "middleFinger_2_initLoc" -p "middleFingerB_poserOrient";
	rename -uid "E7FC859D-4147-F955-262A-FB9A8A206BA8";
	setAttr ".v" no;
createNode locator -n "middleFinger_2_initLocShape" -p "middleFinger_2_initLoc";
	rename -uid "C73EE09A-43F1-0E76-C117-C68DA844F49F";
	setAttr -k off ".v";
createNode transform -n "middleFingerC_poser" -p "middleFinger_mainPoser";
	rename -uid "B884C953-4CF2-F358-FEC6-8F95816DD337";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFingerC";
createNode nurbsSurface -n "middleFingerC_poserNurbsShape" -p "middleFingerC_poser";
	rename -uid "E7E26014-44BF-6237-72D5-26B46ADDF335";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "middleFingerC_poser_locShape" -p "middleFingerC_poser";
	rename -uid "584B1D0A-4630-AD57-2F45-92BDD8528DE1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerC_poserOrient" -p "middleFingerC_poser";
	rename -uid "1DB8D3FB-46AF-04D4-407A-66A9A1644439";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerC";
createNode locator -n "middleFingerC_poserOrientShape" -p "middleFingerC_poserOrient";
	rename -uid "BE39D8F4-43E8-5321-855F-5D90E19A6905";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerC_poserOrient_aimConstraint1" -p "middleFingerC_poserOrient";
	rename -uid "2113EF4F-4CB1-C44E-AA55-34996014E2D2";
	addAttr -ci true -sn "w0" -ln "middleFingerD_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "middleFinger_3_initLoc" -p "middleFingerC_poserOrient";
	rename -uid "E99A53E0-4CC4-1C71-6108-C190BED2187C";
	setAttr ".v" no;
createNode locator -n "middleFinger_3_initLocShape" -p "middleFinger_3_initLoc";
	rename -uid "C7548064-4A14-8F03-A2EF-82A0D3A97F37";
	setAttr -k off ".v";
createNode transform -n "middleFingerD_poser" -p "middleFinger_mainPoser";
	rename -uid "678B7613-4D13-A808-9977-C2B085944A67";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFingerD";
createNode nurbsSurface -n "middleFingerD_poserNurbsShape" -p "middleFingerD_poser";
	rename -uid "79DF21BB-49ED-1290-BD5C-60A896BB7752";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "middleFingerD_poser_locShape" -p "middleFingerD_poser";
	rename -uid "A8E658C9-46CB-9991-7077-84A73C536C43";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerD_poserOrient" -p "middleFingerD_poser";
	rename -uid "D43A525A-4D7A-E70D-E912-0CB3DF84BC5D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerD";
createNode locator -n "middleFingerD_poserOrientShape" -p "middleFingerD_poserOrient";
	rename -uid "283EBFE1-4189-3C78-1E67-41AC2C4527EA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ringFinger_mainPoser" -p "mainPoser";
	rename -uid "194895D0-4C28-0907-5524-D0931C1D0077";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.7438096035359113 0 -0.072370664127818451 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode nurbsCurve -n "ringFinger_mainPoserShape" -p "ringFinger_mainPoser";
	rename -uid "1A48C19C-4B5D-558D-3C4D-F1BFB4A132B9";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "ringFinger_mainPoserShapeOrig" -p "ringFinger_mainPoser";
	rename -uid "BE2D8090-46B5-5E2A-39DD-F99E6D9A8A1F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		;
createNode transform -n "ringFinger_mainPoser_clusterHandle" -p "ringFinger_mainPoser";
	rename -uid "5F4B2CCA-412E-A6AD-0438-AE86C74BB9BD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode clusterHandle -n "ringFinger_mainPoser_clusterHandleShape" -p "ringFinger_mainPoser_clusterHandle";
	rename -uid "4E9DFF6C-46B1-58C4-9C77-60AFAEF2F5F5";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "ringFingerA_poser" -p "ringFinger_mainPoser";
	rename -uid "A873FC4B-49BF-B3DB-F5DB-6CBD1D8F955F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFingerA";
createNode nurbsSurface -n "ringFingerA_poserNurbsShape" -p "ringFingerA_poser";
	rename -uid "0C1ABA65-41DC-78B6-2387-518588974E61";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "ringFingerA_poser_locShape" -p "ringFingerA_poser";
	rename -uid "E45CDAE8-4375-C399-256F-B497B0D15794";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerA_poserOrient" -p "ringFingerA_poser";
	rename -uid "6148F353-45A1-4FDF-8323-A597118B8F11";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerA";
createNode locator -n "ringFingerA_poserOrientShape" -p "ringFingerA_poserOrient";
	rename -uid "F5AEB1A2-43E8-A341-C3D8-C79EBC82A7BD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerA_poserOrient_aimConstraint1" -p "ringFingerA_poserOrient";
	rename -uid "61572FF6-4F78-93B2-96F2-9EB6B6F57F84";
	addAttr -ci true -sn "w0" -ln "ringFingerB_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "ringFinger_1_initLoc" -p "ringFingerA_poserOrient";
	rename -uid "94C42186-4A41-6B98-D407-4A9130880417";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 0 0 ;
createNode locator -n "ringFinger_1_initLocShape" -p "ringFinger_1_initLoc";
	rename -uid "026FDB1A-4680-F3DE-B7F2-4EB2E89711CE";
	setAttr -k off ".v";
createNode transform -n "ringFingerB_poser" -p "ringFinger_mainPoser";
	rename -uid "533164D4-4170-D6D4-68D4-14BDB0670F60";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFingerB";
createNode nurbsSurface -n "ringFingerB_poserNurbsShape" -p "ringFingerB_poser";
	rename -uid "7C24B9D1-48B5-5300-B78D-70A39FDC1264";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "ringFingerB_poser_locShape" -p "ringFingerB_poser";
	rename -uid "E46DC3D6-49C3-A415-0A63-D68C55B78E39";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerB_poserOrient" -p "ringFingerB_poser";
	rename -uid "CB9F9CBD-4F6A-A8C1-26FE-1DB58C3641C7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerB";
createNode locator -n "ringFingerB_poserOrientShape" -p "ringFingerB_poserOrient";
	rename -uid "D06D010A-4049-0F03-5113-5197A47F3B65";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerB_poserOrient_aimConstraint1" -p "ringFingerB_poserOrient";
	rename -uid "CF575994-435B-8002-9DD3-398A26B7EB74";
	addAttr -ci true -sn "w0" -ln "ringFingerC_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "ringFinger_2_initLoc" -p "ringFingerB_poserOrient";
	rename -uid "CC8A9BED-4C9A-E0EF-6D78-058861DB4E93";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode locator -n "ringFinger_2_initLocShape" -p "ringFinger_2_initLoc";
	rename -uid "63486990-437C-CFAA-0DC4-6781C7A090EF";
	setAttr -k off ".v";
createNode transform -n "ringFingerC_poser" -p "ringFinger_mainPoser";
	rename -uid "8646C57D-4CFA-2E0A-10C7-9B8F64A42A50";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFingerC";
createNode nurbsSurface -n "ringFingerC_poserNurbsShape" -p "ringFingerC_poser";
	rename -uid "B1639586-409F-97BC-3E5A-AC863151F0D5";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "ringFingerC_poser_locShape" -p "ringFingerC_poser";
	rename -uid "9D167A18-4B27-4F01-68A7-599E2E2C1343";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerC_poserOrient" -p "ringFingerC_poser";
	rename -uid "CA183E87-4964-F24F-C59D-BCB063F0170F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerC";
createNode locator -n "ringFingerC_poserOrientShape" -p "ringFingerC_poserOrient";
	rename -uid "5C1255E3-4004-B856-451B-9092F349062C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerC_poserOrient_aimConstraint1" -p "ringFingerC_poserOrient";
	rename -uid "80C9CF01-4A41-964B-05C6-64B76CB29329";
	addAttr -ci true -sn "w0" -ln "ringFingerD_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "ringFinger_3_initLoc" -p "ringFingerC_poserOrient";
	rename -uid "1091E868-4339-885E-5045-CCBA7B4263D1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode locator -n "ringFinger_3_initLocShape" -p "ringFinger_3_initLoc";
	rename -uid "3D8D0249-4C4E-FAA8-1466-27BC0099E723";
	setAttr -k off ".v";
createNode transform -n "ringFingerD_poser" -p "ringFinger_mainPoser";
	rename -uid "E5CEC348-4012-A995-B0B9-1BA2DED4DE65";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFingerD";
createNode nurbsSurface -n "ringFingerD_poserNurbsShape" -p "ringFingerD_poser";
	rename -uid "B9B52EE6-45E6-AF72-F6C9-6E8AF41C6C5D";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "ringFingerD_poser_locShape" -p "ringFingerD_poser";
	rename -uid "F780C4D9-45E5-EE5B-4A97-23A051B789C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerD_poserOrient" -p "ringFingerD_poser";
	rename -uid "A4A5C5A3-4980-6E18-72A3-E38F81DA34A2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerD";
createNode locator -n "ringFingerD_poserOrientShape" -p "ringFingerD_poserOrient";
	rename -uid "872C7868-4142-255A-A313-D3A81560C322";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pinkyFinger_mainPoser" -p "mainPoser";
	rename -uid "F8F5E742-4774-56B9-87FC-07BF9C403E2B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.7441693368767478 0 -0.27933681092588802 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode nurbsCurve -n "pinkyFinger_mainPoserShape" -p "pinkyFinger_mainPoser";
	rename -uid "DC8DE16F-47BA-9C13-1B79-3897DB962A19";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "pinkyFinger_mainPoserShapeOrig" -p "pinkyFinger_mainPoser";
	rename -uid "3E28F49E-48C4-8527-8AAB-6784ABCFA261";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		0.14006911006367309 0.14006933472115335 0.14006922260458046
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 0.14006933472115335 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 0.14006922260458046
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		-0.14006934744825167 0.14006933472115335 -0.14006923490734344
		-0.14006934744825167 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 0.14006933472115335 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 -0.14006923490734344
		0.14006911006367309 -0.14006912279077055 0.14006922260458046
		;
createNode transform -n "pinkyFinger_mainPoser_clusterHandle" -p "pinkyFinger_mainPoser";
	rename -uid "46114DE7-41CC-B239-7817-08A659D3D537";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode clusterHandle -n "pinkyFinger_mainPoser_clusterHandleShape" -p "pinkyFinger_mainPoser_clusterHandle";
	rename -uid "11D6E568-4F01-9BD8-BE78-499B3F054D7B";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "pinkyFingerA_poser" -p "pinkyFinger_mainPoser";
	rename -uid "97BBD40F-45D3-43C4-94BE-11B99164E8AE";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerA";
createNode nurbsSurface -n "pinkyFingerA_poserNurbsShape" -p "pinkyFingerA_poser";
	rename -uid "205A5247-4E4D-B8D0-ED01-F0A3EC50F1EE";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "pinkyFingerA_poser_locShape" -p "pinkyFingerA_poser";
	rename -uid "8733A5AB-4869-65A2-2752-BCB9A961F336";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerA_poserOrient" -p "pinkyFingerA_poser";
	rename -uid "86DC26A8-4FEB-2DDB-EA2D-F3B649A27F4E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerA";
createNode locator -n "pinkyFingerA_poserOrientShape" -p "pinkyFingerA_poserOrient";
	rename -uid "FC32F532-4204-DEBB-A8DA-878055AB9472";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerA_poserOrient_aimConstraint1" -p "pinkyFingerA_poserOrient";
	rename -uid "648223AF-454D-5BFC-A7A5-E38CAE9990F5";
	addAttr -ci true -sn "w0" -ln "pinkyFingerB_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "pinkyFinger_1_initLoc" -p "pinkyFingerA_poserOrient";
	rename -uid "191E7076-45E3-F491-486D-40AE77B117CD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode locator -n "pinkyFinger_1_initLocShape" -p "pinkyFinger_1_initLoc";
	rename -uid "38468847-47FB-5B7F-C402-DDADA116B284";
	setAttr -k off ".v";
createNode transform -n "pinkyFingerB_poser" -p "pinkyFinger_mainPoser";
	rename -uid "58F82BD7-4131-6C03-F07F-4D8C1EECC636";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerB";
createNode nurbsSurface -n "pinkyFingerB_poserNurbsShape" -p "pinkyFingerB_poser";
	rename -uid "2FA1BC2C-4132-A72B-C161-9DA54657AA43";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "pinkyFingerB_poser_locShape" -p "pinkyFingerB_poser";
	rename -uid "0D932573-4B04-97FD-035D-4B99A0F78C84";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerB_poserOrient" -p "pinkyFingerB_poser";
	rename -uid "092A6B1D-4408-67DB-0ABA-50BFD7B9BB72";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerB";
createNode locator -n "pinkyFingerB_poserOrientShape" -p "pinkyFingerB_poserOrient";
	rename -uid "A9C09F7F-4539-EDCE-18AD-6FB94708D6B3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerB_poserOrient_aimConstraint1" -p "pinkyFingerB_poserOrient";
	rename -uid "4E7198E4-4F9F-2FBC-FE74-0EB141E53F89";
	addAttr -ci true -sn "w0" -ln "pinkyFingerC_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "pinkyFinger_2_initLoc" -p "pinkyFingerB_poserOrient";
	rename -uid "185F8E80-4052-20DC-ACF8-1D973473FDD5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode locator -n "pinkyFinger_2_initLocShape" -p "pinkyFinger_2_initLoc";
	rename -uid "79C4FEDE-4F52-FD2D-9D3D-7ABEB997BED6";
	setAttr -k off ".v";
createNode transform -n "pinkyFingerC_poser" -p "pinkyFinger_mainPoser";
	rename -uid "BE73E439-47B0-654A-296C-C18AC28AD5A5";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerC";
createNode nurbsSurface -n "pinkyFingerC_poserNurbsShape" -p "pinkyFingerC_poser";
	rename -uid "3760C47D-432C-A017-A996-5A93505BE696";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "pinkyFingerC_poser_locShape" -p "pinkyFingerC_poser";
	rename -uid "88F585E9-4580-C290-17C9-BD8A773704D1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerC_poserOrient" -p "pinkyFingerC_poser";
	rename -uid "1D38538B-4C80-D88E-ABD3-2A9FE94E11B0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerC";
createNode locator -n "pinkyFingerC_poserOrientShape" -p "pinkyFingerC_poserOrient";
	rename -uid "EACB9D0D-437A-289E-0175-508193E51D1A";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerC_poserOrient_aimConstraint1" -p "pinkyFingerC_poserOrient";
	rename -uid "1ABF8AE0-405D-690E-7413-D89389906A05";
	addAttr -ci true -sn "w0" -ln "pinkyFingerD_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 4;
	setAttr -k on ".w0";
createNode transform -n "pinkyFinger_3_initLoc" -p "pinkyFingerC_poserOrient";
	rename -uid "7D553354-45B8-C332-F1D0-648B9D7BF5D3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode locator -n "pinkyFinger_3_initLocShape" -p "pinkyFinger_3_initLoc";
	rename -uid "5A1F2CD3-4644-9842-8ABD-A987F1D8B627";
	setAttr -k off ".v";
createNode transform -n "pinkyFingerD_poser" -p "pinkyFinger_mainPoser";
	rename -uid "CD1999AE-49AF-BC72-A32C-62AFBC48D929";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerD";
createNode nurbsSurface -n "pinkyFingerD_poserNurbsShape" -p "pinkyFingerD_poser";
	rename -uid "E64ACB7F-49A9-22AE-7188-0597586E5DA6";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "pinkyFingerD_poser_locShape" -p "pinkyFingerD_poser";
	rename -uid "567CCF81-4574-B7D4-8DB3-9081DBF9DE37";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerD_poserOrient" -p "pinkyFingerD_poser";
	rename -uid "B3403788-4C68-383F-1998-4C8828046AEB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerD";
createNode locator -n "pinkyFingerD_poserOrientShape" -p "pinkyFingerD_poserOrient";
	rename -uid "C484CAAE-42FC-10BC-016A-2EADCDD39D06";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "1D18C478-4B2D-8617-E226-68981AA82C76";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "root";
createNode nurbsSurface -n "root_poserNurbsShape" -p "root_poser";
	rename -uid "05EF3683-4D97-55E8-3A04-47BF42B967CF";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode locator -n "root_poser_locShape" -p "root_poser";
	rename -uid "CA58846E-41B5-4FCB-DF8D-ADA4F74C684F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "0E5D7518-46EC-5053-79C2-7E8814085954";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "B4DC59D4-44AF-AD6E-DC05-098324FE760E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "lines_group" -p "posers";
	rename -uid "CB5C5268-4C1E-0A9D-19D1-3A8A9AED8DCC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode transform -n "thumbFinger_posers_curve" -p "lines_group";
	rename -uid "39A322F2-46AE-8849-9816-B1BE126C84D5";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "thumbFinger_posers_curveShape" -p "thumbFinger_posers_curve";
	rename -uid "AA1DA3E2-40B9-DFEF-3EC4-2EA0B9058415";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0 0 0
		0.28812560489975525 0 0.48826241970730738
		0.28559764582329605 -0.17769933359172024 0.79142203187497295
		0.71238967361168293 0 0.91252648841923678
		0.92452170796764677 0 1.1246585227752015
		;
createNode transform -n "indexFinger_posers_curve" -p "lines_group";
	rename -uid "69CD81FF-4355-1B4C-B144-FCB5EBE95E36";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "indexFinger_posers_curveShape" -p "indexFinger_posers_curve";
	rename -uid "FCE166D0-4F8F-83CB-B115-C49AFAC9D979";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		-8.6736173798840355e-18 0 3.2092384305570931e-17
		0.35665792465199897 0 0.26469171415994386
		0.74951730318001086 0 0.32492759417655598
		1.0495173031800109 0 0.32492759417655598
		1.349517303180011 0 0.32492759417655598
		1.6495173031800108 0 0.32492759417655598
		;
createNode transform -n "middleFinger_posers_curve" -p "lines_group";
	rename -uid "E2654C8D-46ED-F2C8-2075-7DACF7A6214B";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "middleFinger_posers_curveShape" -p "middleFinger_posers_curve";
	rename -uid "B23A6D7A-49B6-374B-E2D1-E7A69558793E";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.35665792465199897 0 0.099044497783831398
		0.7463470132132487 0 0.13489770064463968
		1.0463470132132486 0 0.13489770064463968
		1.3463470132132487 0 0.13489770064463968
		1.6463470132132487 0 0.13489770064463968
		;
createNode transform -n "ringFinger_posers_curve" -p "lines_group";
	rename -uid "8108281F-47EB-E8E0-EA8E-68B6FB35BFEA";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "ringFinger_posers_curveShape" -p "ringFinger_posers_curve";
	rename -uid "333C2F50-45B4-5725-8C18-73AD5F30ACE2";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.35665792465199897 0 -0.050675101633040009
		0.7438096035359113 0 -0.072370664127818451
		1.0438096035359112 0 -0.072370664127818451
		1.3438096035359113 0 -0.072370664127818451
		1.6438096035359113 0 -0.072370664127818451
		;
createNode transform -n "pinkyFinger_posers_curve" -p "lines_group";
	rename -uid "6C102DD6-4D15-416D-8388-2389745117DB";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "pinkyFinger_posers_curveShape" -p "pinkyFinger_posers_curve";
	rename -uid "92A8128B-4F13-3422-7542-F69E28553B00";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.35665792465199897 4.4408920985006262e-16 -0.20358022444175916
		0.7441693368767478 0 -0.27933681092588802
		1.0441693368767477 0 -0.27933681092588802
		1.3441693368767478 0 -0.27933681092588802
		1.6441693368767478 0 -0.27933681092588802
		;
createNode transform -n "thumbFinger_posers_sweep" -p "lines_group";
	rename -uid "7BE25B70-4C4F-D8C1-7EA4-A6BEA4BE6C9E";
	setAttr ".it" no;
createNode mesh -n "thumbFinger_posers_sweepShape" -p "thumbFinger_posers_sweep";
	rename -uid "5AD573C1-4CC9-034F-AF15-FDAA68F8A544";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "indexFinger_posers_sweep" -p "lines_group";
	rename -uid "A090CBB2-4A1B-275B-E74C-19B1D978FDFE";
	setAttr ".it" no;
createNode mesh -n "indexFinger_posers_sweepShape" -p "indexFinger_posers_sweep";
	rename -uid "94D6C5F9-4A2A-6939-8CBB-308C2396961F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "middleFinger_posers_sweep" -p "lines_group";
	rename -uid "E578CAFB-42DA-D0AF-B831-64A63D0640A7";
	setAttr ".it" no;
createNode mesh -n "middleFinger_posers_sweepShape" -p "middleFinger_posers_sweep";
	rename -uid "7F2B2325-402E-30A6-5E99-AC8B4D1ECA7E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "ringFinger_posers_sweep" -p "lines_group";
	rename -uid "9B7A82BB-40F0-7FC2-373A-0FB3B0CBF015";
	setAttr ".it" no;
createNode mesh -n "ringFinger_posers_sweepShape" -p "ringFinger_posers_sweep";
	rename -uid "5CE428D7-4CEF-ABCC-57DD-DBA349AB1701";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pinkyFinger_posers_sweep" -p "lines_group";
	rename -uid "2E7FB292-497D-4057-7051-898D6E95FF37";
	setAttr ".it" no;
createNode mesh -n "pinkyFinger_posers_sweepShape" -p "pinkyFinger_posers_sweep";
	rename -uid "A20748AA-4873-61D6-62CE-8EB04BA327D4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "875CE9EB-4BB4-8A54-5E01-5988F8A5A1F9";
	setAttr ".v" no;
createNode transform -n "root_connector" -p "input";
	rename -uid "5FDB5291-4A84-F903-1E2B-E3B0322AF764";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "094C9909-4B98-D76E-583E-83B28E6099C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "controls" -p "mod";
	rename -uid "9539DD24-4F24-35FA-C82C-BBB48F2C166B";
	setAttr ".ove" yes;
createNode transform -n "thumbFinger_1_group" -p "controls";
	rename -uid "90799C8D-4B7B-1588-874D-338AD6DAE43E";
createNode transform -n "thumbFinger_1_group_2" -p "thumbFinger_1_group";
	rename -uid "B96EAC23-4D79-1A60-204E-63BB0C9A4190";
createNode transform -n "thumbFinger_1" -p "thumbFinger_1_group_2";
	rename -uid "7CDD038D-4DBB-1AD5-1594-6BA591A41ABA";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "thumbFinger_1";
createNode transform -n "thumbFinger_2_group" -p "thumbFinger_1";
	rename -uid "BF363C20-44B7-8F9A-5426-E681C70C1A11";
createNode transform -n "thumbFinger_2_group_2" -p "thumbFinger_2_group";
	rename -uid "26A30A21-43B0-AB4D-2EA8-24B8C490225F";
createNode transform -n "thumbFinger_2" -p "thumbFinger_2_group_2";
	rename -uid "BF1C967D-4C99-DA65-4A7F-AC839698410F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -5.5511151231257827e-17 -4.163336342344337e-17 ;
	setAttr ".r" -type "double3" 3.1805546814635168e-15 1.5902773407317584e-15 -3.1805546814635168e-15 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "thumbFinger_2";
createNode transform -n "thumbFinger_3_group" -p "thumbFinger_2";
	rename -uid "0BFB068F-4FB1-6E4C-1047-EB98CEF3C8EE";
createNode transform -n "thumbFinger_3_group_2" -p "thumbFinger_3_group";
	rename -uid "7E59D4BA-41E3-202F-B191-688FA87FBCE1";
createNode transform -n "thumbFinger_3" -p "thumbFinger_3_group_2";
	rename -uid "CAEE283A-4A92-54A4-C987-18A3945732F0";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 4.4408920985006262e-16 -5.5511151231257827e-17 -1.3877787807814457e-17 ;
	setAttr ".r" -type "double3" -1.5902773407317584e-15 3.180554681463516e-15 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "thumbFinger_3";
createNode nurbsCurve -n "thumbFinger_3Shape" -p "thumbFinger_3";
	rename -uid "837DD56E-4B03-7343-A89A-49B891C6FA49";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "thumbFinger_2Shape" -p "thumbFinger_2";
	rename -uid "98CDC7C9-401F-173B-10A4-A7B8FF2CEBAB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "thumbFinger_1Shape" -p "thumbFinger_1";
	rename -uid "8E8B7FD9-4ADD-7920-7C7F-A2ACC74CC6F2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-0.0039609515764305854 0.16992426379818187 0.16992426379818176
		-0.0039609515764305854 0.16992426379818193 -0.16992426379818118
		-0.0039609515764305134 -0.16992426379818187 -0.16992426379818176
		-0.0039609515764305134 -0.16992426379818193 0.16992426379818118
		-0.0039609515764305854 0.16992426379818187 0.16992426379818176
		;
createNode transform -n "indexFingerRoot_group" -p "controls";
	rename -uid "CC24D0FE-4B0F-E597-E18A-1D8D23AF3F1E";
createNode transform -n "indexFingerRoot_group_2" -p "indexFingerRoot_group";
	rename -uid "E5BE5CB7-4A2C-C1B0-E388-EFA5CC22F9F9";
createNode transform -n "indexFingerRoot" -p "indexFingerRoot_group_2";
	rename -uid "D181EB10-4AE4-9666-C89A-3DB4DEF2B301";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "indexFingerRoot";
createNode nurbsCurve -n "indexFingerRootShape" -p "indexFingerRoot";
	rename -uid "269A6308-4154-AD02-C7D7-BA99DC415908";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.14362484218821794 0.049212066822103114
		-2.4648898536773823e-17 0.14362484218821797 -0.04885383891428928
		2.4648898536773903e-17 -0.14362484218821794 -0.048853838914289502
		2.4648898536773823e-17 -0.14362484218821797 0.049212066822102947
		-2.4648898536773903e-17 0.14362484218821794 0.049212066822103114
		;
createNode transform -n "indexFinger_1_group" -p "indexFingerRoot";
	rename -uid "5A6FFDAA-4A33-807A-058D-408884B5802E";
createNode transform -n "indexFinger_1_group_2" -p "indexFinger_1_group";
	rename -uid "9613CC31-4D49-2DD5-F008-88BF16BB5B80";
createNode transform -n "indexFinger_1" -p "indexFinger_1_group_2";
	rename -uid "D2A8224C-42AA-EA1D-354C-3E907EB89F0C";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "indexFinger_1";
createNode transform -n "indexFinger_2_group" -p "indexFinger_1";
	rename -uid "D02931BB-4C41-2546-DED6-F9A658E22F21";
createNode transform -n "indexFinger_2_group_2" -p "indexFinger_2_group";
	rename -uid "843AA710-4E3E-0CF3-7FFF-64886CA772D6";
createNode transform -n "indexFinger_2" -p "indexFinger_2_group_2";
	rename -uid "F9A002EB-492E-1A58-ECAC-A4A0A693763D";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "indexFinger_2";
createNode transform -n "indexFinger_3_group" -p "indexFinger_2";
	rename -uid "472D5E22-4685-4D6C-F89D-138AD83A056B";
createNode transform -n "indexFinger_3_group_2" -p "indexFinger_3_group";
	rename -uid "594CFDA9-4552-20C3-6C7B-85968C85F3C1";
createNode transform -n "indexFinger_3" -p "indexFinger_3_group_2";
	rename -uid "A6B6F1C1-46CE-1031-4205-9DAC3E5C3E6F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
createNode nurbsCurve -n "indexFinger_3Shape" -p "indexFinger_3";
	rename -uid "5222F6C3-40CD-0504-0EB6-BFA829FBA6BC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "indexFinger_2Shape" -p "indexFinger_2";
	rename -uid "B8D8BEB8-4DD8-9E47-77E2-6DA71DCFA195";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "indexFinger_1Shape" -p "indexFinger_1";
	rename -uid "D5923381-4C19-3212-7425-B1B2EC1824C1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		-2.4648898536773823e-17 0.13743134052271699 -0.080787421580650165
		2.4648898536773903e-17 -0.13743134052271697 -0.080787421580650526
		2.4648898536773823e-17 -0.13743134052271699 0.080787421580650165
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		;
createNode transform -n "middleFingerRoot_group" -p "controls";
	rename -uid "B5CC0B8B-495F-A966-1815-6896457F080E";
createNode transform -n "middleFingerRoot_clenchGroup" -p "middleFingerRoot_group";
	rename -uid "8D21A7C4-4858-2D2E-CE76-799506ED624B";
createNode transform -n "middleFingerRoot_group_2" -p "middleFingerRoot_clenchGroup";
	rename -uid "0F9D1AE6-4C8E-C56E-C515-3395158DAA55";
createNode transform -n "middleFingerRoot" -p "middleFingerRoot_group_2";
	rename -uid "610CCD46-458D-C21C-66E2-E28F098D7EA3";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleFingerRoot";
createNode nurbsCurve -n "middleFingerRootShape" -p "middleFingerRoot";
	rename -uid "E9388997-4794-6DE6-291E-F09D26150F8D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.14362484218821794 0.04903295286819629
		-2.4648898536773823e-17 0.14362484218821797 -0.049032952868196082
		2.4648898536773903e-17 -0.14362484218821794 -0.04903295286819629
		2.4648898536773823e-17 -0.14362484218821797 0.049032952868196082
		-2.4648898536773903e-17 0.14362484218821794 0.04903295286819629
		;
createNode transform -n "middleFinger_1_group" -p "middleFingerRoot";
	rename -uid "3AF5CCC0-4922-7F70-2F9F-DD99988A177A";
createNode transform -n "middleFinger_1_group_2" -p "middleFinger_1_group";
	rename -uid "2406E8F8-4DC7-8872-4016-1F8A76F9EB3D";
createNode transform -n "middleFinger_1" -p "middleFinger_1_group_2";
	rename -uid "F023A976-43DE-7177-3FC5-B89D1EB95531";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleFinger_1";
createNode transform -n "middleFinger_2_group" -p "middleFinger_1";
	rename -uid "A26E80C5-4E78-A450-688A-1BA7816A0831";
createNode transform -n "middleFinger_2_group_2" -p "middleFinger_2_group";
	rename -uid "A136FB78-4E20-65F7-0621-2BAD46A547B2";
createNode transform -n "middleFinger_2" -p "middleFinger_2_group_2";
	rename -uid "284DAFAF-4AB8-70E2-CA30-0BB980EB322B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleFinger_2";
createNode transform -n "middleFinger_3_group" -p "middleFinger_2";
	rename -uid "5FC00FFE-4411-E0C5-FCC0-8E8B46E211CF";
createNode transform -n "middleFinger_3_group_2" -p "middleFinger_3_group";
	rename -uid "7A66A4C7-4A96-A435-2BA3-0C8CC94BA520";
createNode transform -n "middleFinger_3" -p "middleFinger_3_group_2";
	rename -uid "9C27E533-41CB-D4AC-9590-B4AAEC44911C";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleFinger_3";
createNode nurbsCurve -n "middleFinger_3Shape" -p "middleFinger_3";
	rename -uid "8A54BB77-473B-B217-6DDD-02A60DD0490F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "middleFinger_2Shape" -p "middleFinger_2";
	rename -uid "7F60176C-4254-F010-82A4-A2BBEDE25938";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "middleFinger_1Shape" -p "middleFinger_1";
	rename -uid "EC8759E0-46C0-5090-F770-7D8E9F4B8565";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		-2.4648898536773823e-17 0.13743134052271699 -0.080787421580650165
		2.4648898536773903e-17 -0.13743134052271697 -0.080787421580650526
		2.4648898536773823e-17 -0.13743134052271699 0.080787421580650165
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		;
createNode transform -n "ringFingerRoot_group" -p "controls";
	rename -uid "2C8742FC-4C82-3AFF-21FA-C8A331A99DF1";
createNode transform -n "ringFingerRoot_clenchGroup" -p "ringFingerRoot_group";
	rename -uid "EF8903F5-469B-8BC9-1054-978DEEFC39F6";
createNode transform -n "ringFingerRoot_group_2" -p "ringFingerRoot_clenchGroup";
	rename -uid "60A40272-4126-8D37-92BF-9C973340343F";
createNode transform -n "ringFingerRoot" -p "ringFingerRoot_group_2";
	rename -uid "DDC34009-4696-AE91-0F0C-BAA0B5CEDA56";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ringFingerRoot";
createNode nurbsCurve -n "ringFingerRootShape" -p "ringFingerRoot";
	rename -uid "B28F7547-4B7B-92B6-59F6-36B0D74BE1FE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.14362484218821794 0.04903295286819629
		-2.4648898536773823e-17 0.14362484218821797 -0.049032952868196082
		2.4648898536773903e-17 -0.14362484218821794 -0.04903295286819629
		2.4648898536773823e-17 -0.14362484218821797 0.049032952868196082
		-2.4648898536773903e-17 0.14362484218821794 0.04903295286819629
		;
createNode transform -n "ringFinger_1_group" -p "ringFingerRoot";
	rename -uid "100D16A3-455D-5C79-D72A-42AEE470CCF9";
createNode transform -n "ringFinger_1_group_2" -p "ringFinger_1_group";
	rename -uid "0B5B1209-4CB7-38D8-102F-1988B5F2C7B3";
createNode transform -n "ringFinger_1" -p "ringFinger_1_group_2";
	rename -uid "8523DBEF-498F-AF84-9D7A-D7BA31B1EFD2";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ringFinger_1";
createNode transform -n "ringFinger_2_group" -p "ringFinger_1";
	rename -uid "2129030C-45F0-9B6C-7C52-DE99E037C766";
createNode transform -n "ringFinger_2_group_2" -p "ringFinger_2_group";
	rename -uid "EB56FD2C-4AB0-BD22-8462-51899E0209AA";
createNode transform -n "ringFinger_2" -p "ringFinger_2_group_2";
	rename -uid "F4685B96-4E6A-28C6-6B9B-BF94DBFE9E55";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ringFinger_2";
createNode transform -n "ringFinger_3_group" -p "ringFinger_2";
	rename -uid "B02EAFF5-46B0-BF47-A6F4-51AE3E0C15B4";
createNode transform -n "ringFinger_3_group_2" -p "ringFinger_3_group";
	rename -uid "BB50A809-4F88-CD34-CE68-9B93D1FFAC1F";
createNode transform -n "ringFinger_3" -p "ringFinger_3_group_2";
	rename -uid "74FC4E86-403E-279E-4BFE-F89B0EA64143";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ringFinger_3";
createNode nurbsCurve -n "ringFinger_3Shape" -p "ringFinger_3";
	rename -uid "71EB4BD9-4497-D85B-D7FE-4599A5BBAF99";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "ringFinger_2Shape" -p "ringFinger_2";
	rename -uid "6CFFE355-4E2F-8152-3678-4D83CB928778";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "ringFinger_1Shape" -p "ringFinger_1";
	rename -uid "1E9D9B41-4F6D-E485-A855-088C8BC71A5F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		-2.4648898536773823e-17 0.13743134052271699 -0.080787421580650165
		2.4648898536773903e-17 -0.13743134052271697 -0.080787421580650526
		2.4648898536773823e-17 -0.13743134052271699 0.080787421580650165
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		;
createNode transform -n "pinkyFingerRoot_group" -p "controls";
	rename -uid "95F1DD1E-4ED8-5B63-4169-ECA492180881";
createNode transform -n "clench_group" -p "pinkyFingerRoot_group";
	rename -uid "6192D555-4168-07A7-675C-7DB4D03FD6C2";
createNode transform -n "clench" -p "clench_group";
	rename -uid "58C204E3-4DE8-3FB4-0C23-F58CFBBF2B18";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "clench";
createNode nurbsCurve -n "clenchShape" -p "clench";
	rename -uid "68A2886E-4527-059B-17DE-30B00644D081";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.079998628128317914 0.080408571803174692 0.080260412778841869
		-0.079998628128317914 0.080408571803174692 -0.0805567308275075
		0.25583785798481878 0.080408571803174692 -0.14381101822253445
		0.25583785798481878 0.080408571803174692 0.080260412778841869
		-0.079998628128317914 0.080408571803174692 0.080260412778841869
		0.25583785798481878 0.080408571803174692 0.080260412778841869
		0.25583785798481878 -0.080408571803174692 0.080260412778841869
		-0.079998628128317914 -0.080408571803174692 0.080260412778841869
		-0.079998628128317914 0.080408571803174692 0.080260412778841869
		-0.079998628128317914 -0.080408571803174692 0.080260412778841869
		-0.079998628128317914 -0.080408571803174692 -0.0805567308275075
		-0.079998628128317914 0.080408571803174692 -0.0805567308275075
		-0.079998628128317914 -0.080408571803174692 -0.0805567308275075
		0.25583785798481878 -0.080408571803174692 -0.14381101822253445
		0.25583785798481878 0.080408571803174692 -0.14381101822253445
		0.25583785798481878 -0.080408571803174692 -0.14381101822253445
		0.25583785798481878 -0.080408571803174692 0.080260412778841869
		;
createNode transform -n "pinkyFingerRoot_clench" -p "pinkyFingerRoot_group";
	rename -uid "6CEBB40C-4B36-3A75-57CE-FE8A42D58032";
createNode transform -n "pinkyFingerRoot_group_2" -p "pinkyFingerRoot_clench";
	rename -uid "B88333CC-4F25-5590-7CCF-F9A56EE05CE3";
createNode transform -n "pinkyFingerRoot" -p "pinkyFingerRoot_group_2";
	rename -uid "2FAAEADD-4EDB-67AD-79A4-24A09E6C56AA";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "pinkyFingerRoot";
createNode nurbsCurve -n "pinkyFingerRootShape" -p "pinkyFingerRoot";
	rename -uid "9EC1AC30-4A83-FF90-1D11-8097DDFBAC4D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.14362484218821794 0.04903295286819629
		-2.4648898536773823e-17 0.14362484218821797 -0.049032952868196082
		2.4648898536773903e-17 -0.14362484218821794 -0.04903295286819629
		2.4648898536773823e-17 -0.14362484218821797 0.049032952868196082
		-2.4648898536773903e-17 0.14362484218821794 0.04903295286819629
		;
createNode transform -n "pinkyFinger_1_group" -p "pinkyFingerRoot";
	rename -uid "68B3A777-47B6-5319-E032-C9B5D85BF0C2";
createNode transform -n "pinkyFinger_1_group_2" -p "pinkyFinger_1_group";
	rename -uid "0D3124D7-4511-86F7-3E35-EBB8C8ABC634";
createNode transform -n "pinkyFinger_1" -p "pinkyFinger_1_group_2";
	rename -uid "50E92791-4ACE-638F-899A-3E9956C7CA4A";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_1";
createNode transform -n "pinkyFinger_2_group" -p "pinkyFinger_1";
	rename -uid "243D240B-4061-3EC6-E828-0C8FD8074875";
createNode transform -n "pinkyFinger_2_group_2" -p "pinkyFinger_2_group";
	rename -uid "20654A5B-4932-5AD6-FEB1-11A908E6FEBD";
createNode transform -n "pinkyFinger_2_group_3" -p "pinkyFinger_2_group_2";
	rename -uid "EB974AA4-48FC-3344-37F2-EF978916CDBB";
createNode transform -n "pinkyFinger_2" -p "pinkyFinger_2_group_3";
	rename -uid "707C762B-493B-4737-B3C9-F49834B632BF";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_2";
createNode transform -n "pinkyFinger_3_group" -p "pinkyFinger_2";
	rename -uid "0BA1C4BC-41BB-DE7C-7372-7BAC8F62CFC1";
createNode transform -n "pinkyFinger_3_group_2" -p "pinkyFinger_3_group";
	rename -uid "366F2006-4742-90A5-B162-06950839B6A1";
createNode transform -n "pinkyFinger_3" -p "pinkyFinger_3_group_2";
	rename -uid "884C0149-409B-7EB0-8A25-E882A02E25D0";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_3";
createNode nurbsCurve -n "pinkyFinger_3Shape" -p "pinkyFinger_3";
	rename -uid "97159847-4722-65D9-EDE9-1ABBB6A3ED54";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "pinkyFinger_2Shape" -p "pinkyFinger_2";
	rename -uid "3E4BF383-4164-120F-35E9-13B82D0AB2C5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		-2.4648898536773823e-17 0.1110087702653082 -0.11100877026530775
		2.4648898536773903e-17 -0.11100877026530816 -0.11100877026530812
		2.4648898536773823e-17 -0.1110087702653082 0.11100877026530775
		-2.4648898536773903e-17 0.11100877026530816 0.11100877026530812
		;
createNode nurbsCurve -n "pinkyFinger_1Shape" -p "pinkyFinger_1";
	rename -uid "7F7EC2C7-4405-753F-DF64-15AC9740D45C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		-2.4648898536773823e-17 0.13743134052271699 -0.080787421580650165
		2.4648898536773903e-17 -0.13743134052271697 -0.080787421580650526
		2.4648898536773823e-17 -0.13743134052271699 0.080787421580650165
		-2.4648898536773903e-17 0.13743134052271697 0.080787421580650526
		;
createNode transform -n "fingers_group" -p "controls";
	rename -uid "14269C30-445A-AD4F-5D15-1DB76B7E9895";
	setAttr ".t" -type "double3" 0.47933637847790406 0.36601239251768675 -0.0088306108877134193 ;
createNode transform -n "fingers" -p "fingers_group";
	rename -uid "27905F50-4C84-C468-842B-F98FD6F1265C";
	addAttr -ci true -sn "thumb" -ln "thumb" -at "double";
	addAttr -ci true -sn "index" -ln "index" -at "double";
	addAttr -ci true -sn "middle" -ln "middle" -at "double";
	addAttr -ci true -sn "ring" -ln "ring" -at "double";
	addAttr -ci true -sn "pinky" -ln "pinky" -at "double";
	addAttr -ci true -sn "thumbMult1" -ln "thumbMult1" -at "double";
	addAttr -ci true -sn "thumbMult2" -ln "thumbMult2" -at "double";
	addAttr -ci true -sn "thumbMult3" -ln "thumbMult3" -at "double";
	addAttr -ci true -sn "indexMult1" -ln "indexMult1" -at "double";
	addAttr -ci true -sn "indexMult2" -ln "indexMult2" -at "double";
	addAttr -ci true -sn "indexMult3" -ln "indexMult3" -at "double";
	addAttr -ci true -sn "middleMult1" -ln "middleMult1" -at "double";
	addAttr -ci true -sn "middleMult2" -ln "middleMult2" -at "double";
	addAttr -ci true -sn "middleMult3" -ln "middleMult3" -at "double";
	addAttr -ci true -sn "ringMult1" -ln "ringMult1" -at "double";
	addAttr -ci true -sn "ringMult2" -ln "ringMult2" -at "double";
	addAttr -ci true -sn "ringMult3" -ln "ringMult3" -at "double";
	addAttr -ci true -sn "pinkyMult1" -ln "pinkyMult1" -at "double";
	addAttr -ci true -sn "pinkyMult2" -ln "pinkyMult2" -at "double";
	addAttr -ci true -sn "pinkyMult3" -ln "pinkyMult3" -at "double";
	addAttr -ci true -sn "spread" -ln "spread" -at "double";
	addAttr -ci true -sn "spreadThumbMult" -ln "spreadThumbMult" -at "double";
	addAttr -ci true -sn "spreadIndexRootMult" -ln "spreadIndexRootMult" -at "double";
	addAttr -ci true -sn "spreadMiddleRootMult" -ln "spreadMiddleRootMult" -at "double";
	addAttr -ci true -sn "spreadRingRootMult" -ln "spreadRingRootMult" -at "double";
	addAttr -ci true -sn "spreadPinkyRootMult" -ln "spreadPinkyRootMult" -at "double";
	addAttr -ci true -sn "spreadIndexMult" -ln "spreadIndexMult" -at "double";
	addAttr -ci true -sn "spreadMiddleMult" -ln "spreadMiddleMult" -at "double";
	addAttr -ci true -sn "spreadRingMult" -ln "spreadRingMult" -at "double";
	addAttr -ci true -sn "spreadPinkyMult" -ln "spreadPinkyMult" -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".thumb";
	setAttr -k on ".index";
	setAttr -k on ".middle";
	setAttr -k on ".ring";
	setAttr -k on ".pinky";
	setAttr ".thumbMult1" -1;
	setAttr ".thumbMult2" -1;
	setAttr ".thumbMult3" -1;
	setAttr ".indexMult1" -1;
	setAttr ".indexMult2" -1;
	setAttr ".indexMult3" -1;
	setAttr ".middleMult1" -1;
	setAttr ".middleMult2" -1;
	setAttr ".middleMult3" -1;
	setAttr ".ringMult1" -1;
	setAttr ".ringMult2" -1;
	setAttr ".ringMult3" -1;
	setAttr ".pinkyMult1" -1;
	setAttr ".pinkyMult2" -1;
	setAttr ".pinkyMult3" -1;
	setAttr -k on ".spread";
	setAttr ".spreadThumbMult" -0.48;
	setAttr ".spreadIndexRootMult" -0.5;
	setAttr ".spreadMiddleRootMult" -0.26000000000000012;
	setAttr ".spreadRingRootMult" 0.069999999999999979;
	setAttr ".spreadPinkyRootMult" 0.17000000000000004;
	setAttr ".spreadIndexMult" -0.68;
	setAttr ".spreadMiddleMult" -0.20000000000000007;
	setAttr ".spreadRingMult" 0.22999999999999998;
	setAttr ".spreadPinkyMult" 0.85000000000000009;
createNode nurbsCurve -n "fingersShape" -p "fingers";
	rename -uid "9DA20377-4A89-7EAE-3848-E39FBB4A44ED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -0.66126373801497984 -4.0490726007612877e-17 
		0.66126373801497917 1.1054022489794892e-16 -5.9328185971757888e-17 0.96890280549566621 
		0.6612637380149794 -4.0490726007612914e-17 0.6612637380149794 0.96890280549566621 
		-1.7191824020594358e-32 3.5618558453939662e-16 0.66126373801497962 4.0490726007612877e-17 
		-0.6612637380149794 2.9194932451766201e-16 5.9328185971757913e-17 -0.96890280549566643 
		-0.66126373801497917 4.0490726007612895e-17 -0.66126373801497962 -0.96890280549566621 
		3.1865284418968338e-32 -4.4497779536276251e-16 0 0 0 0 0 0 0 0 0;
createNode transform -n "system" -p "mod";
	rename -uid "6FD6FEA9-4B8E-2308-3EE1-389B78C8A0AD";
	setAttr ".v" no;
	setAttr ".ove" yes;
createNode transform -n "output" -p "mod";
	rename -uid "7218FC95-479D-0529-91D3-68B91502E5AF";
createNode transform -n "outJoints" -p "output";
	rename -uid "AF6AD040-452D-314F-D76F-02AA2CFE9865";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "7A215B85-464E-8BEB-D840-4D94CD0A34BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2832028466235486 0.10356778950840868 0.23507893710489736 0
		 -0.051831814688344295 1.2773445997948163 -0.27982525911350142 0 -0.25159860230164138 0.26507060498698654 1.2565960595865715 0
		 1.3924554333966863 2.5804152796896376 0.028828740475449768 1;
	setAttr ".radi" 0.5;
createNode joint -n "thumbFinger_1_outJoint" -p "root_outJoint";
	rename -uid "56FBD286-4475-27B1-4330-61B8FDE42B5C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".pa" -type "double3" 39.423518114671225 -45.000000000000114 2.2489917831974765e-15 ;
	setAttr ".bps" -type "matrix" 0.67504966950132239 -0.54747401438527477 0.97835478562525147 0
		 -0.540557518773779 0.84156074412583692 0.84390225862969948 0 -0.98219318460275196 -0.83943174635943107 0.20796353190082256 0
		 1.488606841407017 2.5609536877922938 0.19982231646870116 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_2_outJoint" -p "thumbFinger_1_outJoint";
	rename -uid "63A51357-4C24-90BC-6CCC-BDAD21F4EE00";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.73922496793375392 -0.6516033964696325 0.86113727115331851 0
		 -0.44882171758956763 0.76378354014079108 0.96321945002515197 0 -0.98219318460275196 -0.83943174635943107 0.20796353190082256 0
		 1.5420148322326586 2.5176391163487377 0.27722693686277361 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_3_outJoint" -p "thumbFinger_2_outJoint";
	rename -uid "C1E1640D-425A-B2AF-751A-38B20E946E8C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.77293129202256883 -0.7109280318128407 0.78086906115676513 0
		 -0.38790682542207422 0.70889605448435178 1.0293651528997341 0 -0.98219318460275196 -0.83943174635943107 0.20796353190082256 0
		 1.6102302463354488 2.4575093893385649 0.3566923744483918 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_end_outJoint" -p "thumbFinger_3_outJoint";
	rename -uid "4F8575DF-4239-501F-9B66-B2ADBB641FD4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.77293129202256994 -0.71092803181284325 0.7808690611567618 0
		 -0.38790682542207577 0.70889605448434556 1.0293651528997374 0 -0.9821931846027504 -0.83943174635943396 0.20796353190081796 0
		 1.6718804003388803 2.4008047083231165 0.41897565669387499 1;
	setAttr ".radi" 0.2;
createNode joint -n "index_root_outJoint" -p "root_outJoint";
	rename -uid "2B37B86E-42A6-712A-BBAA-1BA37F7DA495";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -8.7170924641710776 0 ;
	setAttr ".bps" -type "matrix" 1.2636736742269346 0.11646996665436286 0.31962717533109636 0
		 -0.047282437445269138 1.2777722155898401 -0.27867629151520951 0 -0.33688448383954711 0.25754776491161296 1.2380532834308866 0
		 1.4775303712762553 2.5796878983533684 0.0097798130510091605 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_1_outJoint" -p "index_root_outJoint";
	rename -uid "9D2D92CE-4F2B-189E-CC43-409588CDF923";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 8.7170924641710776 0 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.7279774505630681 2.6367414299060319 0.24207929103528197 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_2_outJoint" -p "indexFinger_1_outJoint";
	rename -uid "F1713E59-415C-178B-9EA8-28B458DE0D0D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.8545816034067619 2.6335331930968731 0.29000027437242898 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_3_outJoint" -p "indexFinger_2_outJoint";
	rename -uid "F53E7053-4742-B71C-5B26-0EA8D07BD1B9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.945827245434339 2.631220965410396 0.32453769508871033 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_end_outJoint" -p "indexFinger_3_outJoint";
	rename -uid "315B1C89-4125-7D4B-44B6-089AD265C403";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2235771402115796 -0.031006291119996469 0.46313662254181498 0
		 0.010792652932731619 1.3072871093841545 0.059007385618243875 0 -0.46404788532125774 -0.051351366348019949 1.2225467420838616 0
		 2.0262383384181293 2.6291832930020518 0.35497412672202061 1;
	setAttr ".radi" 0.2;
createNode joint -n "middle_root_outJoint" -p "root_outJoint";
	rename -uid "C11A964F-42A4-8916-F794-F2BDCC32F670";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -2.8833043805222336 -1.0415511279042884 -2.1118447590530485 ;
	setAttr ".bps" -type "matrix" 1.2636736742269346 0.11646996665436286 0.31962717533109636 0
		 -0.047282437445269138 1.2777722155898401 -0.27867629151520951 0 -0.33688448383954711 0.25754776491161296 1.2380532834308866 0
		 1.4775303712762553 2.5796878983533684 0.0097798130510091605 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_1_outJoint" -p "middle_root_outJoint";
	rename -uid "B8C66E97-4D70-52D8-E9DB-259090E01787";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 5.2566783519041245 0 ;
	setAttr ".bps" -type "matrix" 1.2438093089611888 -0.15907131256742008 0.37447651426541129 0
		 0.18682789279871975 1.2933012967615327 -0.071169049060198442 0 -0.36143004951260593 0.12110331370289172 1.2519186259483079 0
		 1.7511485431607738 2.6272881776011774 0.16206767007007836 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_2_outJoint" -p "middleFinger_1_outJoint";
	rename -uid "C1BC011E-445A-3CCD-7D23-81963A0D2440";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2438093089611888 -0.15907131256742008 0.37447651426541129 0
		 0.18682789279871975 1.2933012967615327 -0.071169049060198442 0 -0.36143004951260593 0.12110331370289172 1.2519186259483079 0
		 1.903507840041301 2.6078028809708802 0.20793883215311279 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_3_outJoint" -p "middleFinger_2_outJoint";
	rename -uid "B794B73D-4133-87AA-C884-B5A1A35CE79E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2438093089611888 -0.15907131256742008 0.37447651426541129 0
		 0.18682789279871975 1.2933012967615327 -0.071169049060198442 0 -0.36143004951260593 0.12110331370289172 1.2519186259483079 0
		 2.001307935193867 2.5952951843384033 0.23738373055007547 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_end_outJoint" -p "middleFinger_3_outJoint";
	rename -uid "F6F8D066-4B93-B4F2-233E-73BB728D1B19";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.243809308961189 -0.15907131256741958 0.37447651426541073 0
		 0.1868278927987172 1.2933012967615334 -0.071169049060191614 0 -0.36143004951260632 0.12110331370288438 1.2519186259483082 0
		 2.1162641539957296 2.5805933839209736 0.27199386231403716 1;
	setAttr ".radi" 0.2;
createNode joint -n "ring_root_outJoint" -p "root_outJoint";
	rename -uid "F68C02C9-41D9-56FF-4203-D0AFD8D18F41";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -5.7666087610444672 11.637692949407096 -4.2236895181060969 ;
	setAttr ".bps" -type "matrix" 1.2636736742269346 0.11646996665436286 0.31962717533109636 0
		 -0.047282437445269138 1.2777722155898401 -0.27867629151520951 0 -0.33688448383954711 0.25754776491161296 1.2380532834308866 0
		 1.4775303712762553 2.5796878983533684 0.0097798130510091605 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_1_outJoint" -p "ring_root_outJoint";
	rename -uid "CC708326-4FE0-72FD-0278-0B9145BAA15E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 -3.2074389854260263 0 ;
	setAttr ".bps" -type "matrix" 1.2587143153106928 -0.25701539804749746 0.2493577688286954 0
		 0.29723167035656972 1.2580843918359068 -0.20365396247734627 0 -0.19972367372392821 0.25251670729313613 1.2684414475918293 0
		 1.770551429883686 2.6066949917360107 0.083895065418291878 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_2_outJoint" -p "ringFinger_1_outJoint";
	rename -uid "9650280C-4DA9-60A5-D692-49BD50720BCB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2452075418592781 -0.309315841475029 0.2576428287109388 0
		 0.3495233484730273 1.2462571813342669 -0.19306580774900384 0 -0.19972367372392821 0.25251670729313613 1.2684414475918293 0
		 1.9069958575729724 2.5788345642606392 0.11092540712796542 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_3_outJoint" -p "ringFinger_2_outJoint";
	rename -uid "8B198823-4C98-2602-260C-6DAA2CA7758E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2533007273099339 -0.27906820358382017 0.25289555937124536 0
		 0.31928933642609086 1.253377113866029 -0.19924374358622757 0 -0.19972367372392821 0.25251670729313613 1.2684414475918293 0
		 2.004950002763608 2.5545022599442295 0.13119285829774763 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_end_outJoint" -p "ringFinger_3_outJoint";
	rename -uid "3487A46A-477B-C447-F86B-4EBD779A3501";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2533007271889378 -0.27906820405879323 0.25289555944674852 0
		 0.31928933690103378 1.2533771137602765 -0.19924374349038479 0 -0.1997236737239288 0.25251670729312919 1.2684414475918304 0
		 2.0984328795773028 2.53368674645262 0.15005617170655097 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinky_root_outJoint" -p "root_outJoint";
	rename -uid "FF998D0C-4E65-E732-D243-51AE227F55A5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.3018482441153094 0.078127181101778784 0.10809825226977712 0
		 -0.053405045970940757 1.2772511211625857 -0.27995609268341365 0 -0.12221697768940382 0.27408695032564445 1.2737885591032996 0
		 1.4915932426512275 2.5724154751347141 -0.026051936680658125 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_1_outJoint" -p "pinky_root_outJoint";
	rename -uid "744364B8-4D11-7943-8DFD-C5829119DA18";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 -11.061535051331006 0 ;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.7776693725797501 2.5895836218160579 -0.0022977627197828814 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_2_outJoint" -p "pinkyFinger_1_outJoint";
	rename -uid "7E09F2B2-42C3-1841-19D0-9CB9511BDC29";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.896183983991486 2.549299791957818 0.016602220508937282 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_3_outJoint" -p "pinkyFinger_2_outJoint";
	rename -uid "40A333AB-4874-0978-DE7E-9A86DD89D642";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.96899508416744 2.5245508606965972 0.028213688122913739 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_end_outJoint" -p "pinkyFinger_3_outJoint";
	rename -uid "74389099-4FCF-1A7C-B48C-648B61E37B5E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.22712031808436 -0.42037387850651287 0.173376660743986 0
		 0.4426446260086313 1.2185312218429949 -0.17845261482057717 0 -0.10411243579430152 0.22597655396083455 1.2847930327682229 0
		 2.0310584437696688 2.5041022172784917 0.042529531828269115 1;
	setAttr ".radi" 0.2;
createNode transform -s -n "persp";
	rename -uid "B4CB8A02-4ED4-5B47-4588-78A2DF4DAB63";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.1878698916159038 1.8987526737967693 1.6026504753636202 ;
	setAttr ".r" -type "double3" -35.40000000011775 56.79999999999098 2.9042807706990063e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "FD5AF2A7-4477-D351-B960-8095957B3EBF";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 3.0017567326520687;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.23989045713841625 0.0068033527050639919 0.5364975674686463 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "4399C4E0-4AC2-2D79-E31C-0DA7ED948171";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.65911486133936981 2.2520725518810769 0.039422549224904541 ;
	setAttr ".r" -type "double3" -90 90 0 ;
	setAttr ".rp" -type "double3" 3.1554436208840458e-30 3.1554436208840493e-30 0 ;
	setAttr ".rpt" -type "double3" -3.1554436208840458e-30 -6.3108872417680986e-30 7.0064923216240838e-46 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "E800210B-4E9B-9A53-8F37-FDAAB535FF9F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.2169596930784077;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "FDE69542-47DA-5161-15B5-8D8B70323FE7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.88779443749500764 0.020856788009760541 4.6488981419617081 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "446C6151-42A7-5B30-64D8-16A4C5703C49";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 4.8863601810591737;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "BA82C4FD-4CEC-AD27-03D3-06B7E366A3AD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.2111497855092295 -0.3162759641316395 2.2328693358809817 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" -1.4210854715202007e-14 0 1.4210854715202013e-14 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "ED723A9B-443C-74BA-02D5-EFAF752AB9BF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.3286896185558397;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "AAA9103E-42CA-3EAB-2490-049A621D678A";
	setAttr -s 102 ".lnk";
	setAttr -s 102 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "2A6582A9-415D-937E-F9B4-F389102D70A2";
createNode displayLayer -n "defaultLayer";
	rename -uid "E07D4D85-463A-EC21-D440-F88CC183AD0E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "6D06FA84-44B4-791E-071A-2CBD3EAF1D62";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "D7EABF89-4D44-5996-B10A-06AB47230C35";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "E9CAD617-4DBC-A87A-DD6D-D19908C6C63C";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 0 -aet 140 ";
	setAttr ".st" 6;
createNode objectSet -n "sets";
	rename -uid "339CEF37-4ED0-5286-C0A6-42972AA1962C";
	setAttr ".ihi" 0;
createNode decomposeMatrix -n "root_connector_decomposeMatrix";
	rename -uid "849744F8-41C7-4F21-61FC-E885696CD195";
createNode decomposeMatrix -n "decomposeMatrix236";
	rename -uid "2E6C6B60-47E5-C5B9-53F7-F2B6C79FA24A";
createNode decomposeMatrix -n "ringFinger_1_skinJoint_decMat";
	rename -uid "B168BA2D-4E52-B0F1-5960-BFA4629078FA";
createNode multMatrix -n "ringFinger_1_skinJoint_multMat";
	rename -uid "7212DFCE-4BC3-87BA-52E4-E48823DC748D";
createNode decomposeMatrix -n "pinkyFinger_1_skinJoint_decMat";
	rename -uid "BF98B4B1-4490-B74C-5D8B-579AEE749448";
createNode multMatrix -n "pinkyFinger_1_skinJoint_multMat";
	rename -uid "9B0D5179-498A-7573-5A9F-589F8395969E";
createNode objectSet -n "thumb_moduleControlSet";
	rename -uid "B8977D35-4E6D-B2AA-992E-9994E426DED3";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "moduleControlSet";
	rename -uid "1CE65CA5-43CC-84A3-23C7-00A250534604";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr -s 5 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode groupId -n "cluster4GroupId";
	rename -uid "F6670110-49BF-41A1-9649-239FAD54FB15";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "cluster4Set";
	rename -uid "5FA9A7E5-4D3E-3158-BA9B-83969295B90D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "F7A34973-443E-29C5-6509-9DB48CFD5F63";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "14EC613B-428C-E397-7766-2B8C4861B1AA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "";
createNode tweak -n "tweak24";
	rename -uid "DA89FD9C-4992-35AD-12AE-1B8C5C8B5D35";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "tweakSet24";
	rename -uid "A72BEBE3-44CF-61EB-AD43-1BB5CBB1702A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "groupId42";
	rename -uid "617669E0-4405-C358-025F-43A805542637";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupParts -n "groupParts42";
	rename -uid "07F55339-4BF5-98F2-31D9-FE806C782330";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "thumbFinger_cluster4GroupId";
	rename -uid "2611037D-489C-CDBE-02CD-CC97D9ED8BB1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode objectSet -n "thumbFinger_cluster4Set";
	rename -uid "2823A7DE-4E5D-B193-BE78-92BDC70DB50A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode cluster -n "thumbFinger_mainPoser_clusterHandleCluster";
	rename -uid "9B302DCE-4295-6D6A-12C2-B3A76D9D3F4F";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "thumbFinger_cluster4GroupParts";
	rename -uid "51D1AB0B-42BC-9FE2-BF52-5CA1984F6C9E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode tweak -n "thumbFinger_tweak24";
	rename -uid "75DAF4C2-44FF-C04F-9B89-5A9B8746960D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode objectSet -n "thumbFinger_tweakSet24";
	rename -uid "50B26D5B-4CE0-44E5-845D-E88304A27106";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode groupId -n "thumbFinger_groupId42";
	rename -uid "E6720442-4E0B-6DD0-3449-DC82ABC39293";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode groupParts -n "thumbFinger_groupParts42";
	rename -uid "C9F29742-48AA-E564-3BA4-0F90C138A758";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode groupId -n "indexFinger_cluster4GroupId";
	rename -uid "AE54F722-4A9D-E6AF-9669-B3A8CEA680DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode objectSet -n "indexFinger_cluster4Set";
	rename -uid "EC316D69-484A-042F-E3F2-53BFFDD6E323";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode cluster -n "indexFinger_mainPoser_clusterHandleCluster";
	rename -uid "DAE20233-40B0-26A8-1ADD-A4932B0AEA65";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "indexFinger_cluster4GroupParts";
	rename -uid "EF85E879-415B-34C9-F9D1-AB9AE9A4D74E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode tweak -n "indexFinger_tweak24";
	rename -uid "900527D3-436C-B13D-4C54-2B9B17C3CCA7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode objectSet -n "indexFinger_tweakSet24";
	rename -uid "15D07853-433F-9D4C-FE5F-26ACB33C8D2F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode groupId -n "indexFinger_groupId42";
	rename -uid "001DC065-4100-217D-3CCE-3D9057915FAB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode groupParts -n "indexFinger_groupParts42";
	rename -uid "08C3BBBB-4EEE-B7F2-49D3-E4ACB63BB77C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode groupId -n "middleFinger_cluster4GroupId";
	rename -uid "2FABCEE3-41BA-E734-5E84-44A1095E6993";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode objectSet -n "middleFinger_cluster4Set";
	rename -uid "DA267B0F-4844-7955-7026-BD8E45470C5B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode cluster -n "middleFinger_mainPoser_clusterHandleCluster";
	rename -uid "E2CE95D3-46C7-3670-F288-349F65748898";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "middleFinger_cluster4GroupParts";
	rename -uid "833B5EA0-409F-1FA8-6A87-1AA9F04A1992";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode tweak -n "middleFinger_tweak24";
	rename -uid "32456B53-4536-4106-BAE5-65B93123C333";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode objectSet -n "middleFinger_tweakSet24";
	rename -uid "961CAA23-4A72-9B2D-2F70-9CAEB0DA5487";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode groupId -n "middleFinger_groupId42";
	rename -uid "20DE6975-4DAF-FB94-B34F-20A78CEA635C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode groupParts -n "middleFinger_groupParts42";
	rename -uid "57DE01F8-4B7C-7221-CFC1-70A535900164";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode groupId -n "ringFinger_cluster4GroupId";
	rename -uid "A286DCF1-44F7-35D3-6620-7CBDA31AE7A1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode objectSet -n "ringFinger_cluster4Set";
	rename -uid "E263ACE5-43F2-9CF7-CD3F-04B69B6738F0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode cluster -n "ringFinger_mainPoser_clusterHandleCluster";
	rename -uid "5CA9913D-4BE5-E5F7-B489-40BEFF6BFF9C";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "ringFinger_cluster4GroupParts";
	rename -uid "C1556442-447A-77D5-08D7-AB87FEA98568";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode tweak -n "ringFinger_tweak24";
	rename -uid "340670D8-40A3-835B-746C-6199B2475101";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode objectSet -n "ringFinger_tweakSet24";
	rename -uid "088FB2C6-45DE-E096-43E9-6E92644547A0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode groupId -n "ringFinger_groupId42";
	rename -uid "E2257886-43F8-665E-F31E-2A8A04601AE7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode groupParts -n "ringFinger_groupParts42";
	rename -uid "356AD251-462A-1B30-626B-1BB8DEBE654A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode groupId -n "pinkyFinger_cluster4GroupId";
	rename -uid "E76C8116-45F9-5876-3ABD-639AC050FEA6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode objectSet -n "pinkyFinger_cluster4Set";
	rename -uid "2100F736-4D2B-2504-1563-50AC2D01D666";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode cluster -n "pinkyFinger_mainPoser_clusterHandleCluster";
	rename -uid "77E3E75C-44BA-3860-E952-B6BC5E00A503";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "pinkyFinger_cluster4GroupParts";
	rename -uid "6321A2C6-4A47-35FA-CD8C-98B602362A7C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode tweak -n "pinkyFinger_tweak24";
	rename -uid "BDF84EB3-4573-259C-BA05-438D8F6201C1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode objectSet -n "pinkyFinger_tweakSet24";
	rename -uid "18558788-4724-C9B4-3EBB-AB9631BD0C65";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode groupId -n "pinkyFinger_groupId42";
	rename -uid "34F45AE3-4A8C-A0BB-6795-FDACEF7BA8F8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode groupParts -n "pinkyFinger_groupParts42";
	rename -uid "CEAAFF96-4603-F4A7-1C12-1A9738A03E5B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode decomposeMatrix -n "thumbFinger_1_group_decMat";
	rename -uid "B2CF1711-4BF1-0D66-D28D-E1893267A430";
createNode multMatrix -n "thumbFinger_1_group_multMat";
	rename -uid "478CB382-4BB9-8F7A-96EA-7F8AAFD80F4E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "thumbFinger_2_offset_decMat";
	rename -uid "87553DEE-4AE9-F9BB-3134-D1934F5D752E";
createNode multMatrix -n "thumbFinger_2_offset_multMat";
	rename -uid "DC85E28A-46E9-4593-CB34-79B5583336BD";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "thumbFinger_3_offset_decMat";
	rename -uid "04B51633-46B1-371A-1617-1FAEDCBFE079";
createNode multMatrix -n "thumbFinger_3_offset_multMat";
	rename -uid "4BFF12AE-45FA-71A1-B989-B3A2A3E27CFD";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1406";
	rename -uid "FBEF48FE-4E2F-114F-017F-C3B56BAEF983";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1407";
	rename -uid "EB7A9620-4C98-BE76-AF44-99931434A788";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1408";
	rename -uid "12542E4E-4B7A-5CC1-4D99-C7BFAF814A61";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1409";
	rename -uid "ABE5680F-4535-A646-072B-FC97361F190F";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1410";
	rename -uid "4B075F79-4E91-A96E-17C1-B6B51A34EC8E";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1411";
	rename -uid "301CEF22-460B-0199-9A54-11BA5918C647";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1412";
	rename -uid "29EBC94E-414F-1986-DF2D-299F7AB6A51A";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1413";
	rename -uid "0608F3D2-4F5B-5FFE-3563-87B64408DCD5";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1414";
	rename -uid "067E48B0-41DA-1A9E-221B-5DA685423B1E";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1415";
	rename -uid "9D80D60D-4ECE-3FE8-B24B-AE97D47FAAEE";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1416";
	rename -uid "CEEBBF51-40A6-D7DD-5381-299CE3AC1BE7";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1417";
	rename -uid "EB94C521-4EF5-F37A-9D26-1489540B893F";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1418";
	rename -uid "65D9BEA5-4C16-AE6E-AE2F-D9B684BC9D88";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1419";
	rename -uid "C9829417-4B7B-253B-76CC-F48A45F6CCC5";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1420";
	rename -uid "057CE062-4E95-F5AD-7704-F7AC944A29C8";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1421";
	rename -uid "8A0A4B89-4FF0-9B02-67F7-CC9BBF7DD437";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1422";
	rename -uid "922A9C7B-4228-A886-ED8B-5A8A2E7EB7B5";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1423";
	rename -uid "4D07DB60-40F6-4209-F381-7E99C45F94B1";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1424";
	rename -uid "F6E82BA4-4658-EE3E-F6D8-9C867EF8754F";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "indexFingerRoot_group_decMat";
	rename -uid "2D6607A1-48E9-8D55-A839-AC86895AA5B5";
createNode multMatrix -n "indexFingerRoot_group_multMat";
	rename -uid "4650A21A-403F-62A0-E978-EAAE1772DCBC";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_1_group_decMat";
	rename -uid "B751A2C9-4E92-FF43-D77F-54BD7F81B921";
createNode multMatrix -n "indexFinger_1_group_multMat";
	rename -uid "4B9A2622-49AD-45E4-493A-3CA0BBC12321";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_2_group_decMat";
	rename -uid "18B9C2C7-4ACA-281B-FCFD-9DBEF8E08145";
createNode multMatrix -n "indexFinger_2_group_multMat";
	rename -uid "81D46528-4746-2858-71EC-86B4CEE09C3E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_3_group_decMat";
	rename -uid "72707667-47C8-69A6-D11F-1B9C522E82AA";
createNode multMatrix -n "indexFinger_3_group_multMat";
	rename -uid "58862978-4580-DA90-6F48-B0B308D720E0";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFingerRoot_group_decMat";
	rename -uid "9128B8B6-4B79-5A23-522D-7E9B4D6FB191";
createNode multMatrix -n "middleFingerRoot_group_multMat";
	rename -uid "9C4CE234-409B-6806-0362-E7A13BD83243";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_1_group_decMat";
	rename -uid "1034F97E-4259-223F-915E-679AD96BFC09";
createNode multMatrix -n "middleFinger_1_group_multMat";
	rename -uid "A76FB6D7-44FF-F38E-637E-D1AB4B4513EA";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_2_group_decMat";
	rename -uid "F58D843B-4903-68D4-23B4-7BA4FEE59B7C";
createNode multMatrix -n "middleFinger_2_group_multMat";
	rename -uid "28442028-4B48-7A5F-95E1-C99103FEE87D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_3_group_decMat";
	rename -uid "1D5197D9-4619-1760-8884-A5819367B190";
createNode multMatrix -n "middleFinger_3_group_multMat";
	rename -uid "1B0E0970-4987-5B55-F2E3-A799F1EC5EAF";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFingerRoot_group_decMat";
	rename -uid "4A2E1238-41A4-ADC5-C9E9-03B11FC69C24";
createNode multMatrix -n "ringFingerRoot_group_multMat";
	rename -uid "31FEA447-44EA-9BC5-1466-5C8004C9010C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_1_group_decMat";
	rename -uid "B3C9D4A1-44CB-9FC6-F4FD-7882EFED5A4A";
createNode multMatrix -n "ringFinger_1_group_multMat";
	rename -uid "FDA8B602-454D-756E-D432-16A4CA4BE26A";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_2_group_decMat";
	rename -uid "57261C02-43CB-7830-7E51-03800FA41173";
createNode multMatrix -n "ringFinger_2_group_multMat";
	rename -uid "A27BF0DD-4163-8E4F-21D0-979F4955B6D0";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_3_group_decMat";
	rename -uid "B695E173-4F2F-563B-E03A-E98075C172EF";
createNode multMatrix -n "ringFinger_3_group_multMat";
	rename -uid "9B20205C-49E0-4235-A774-C19AE0FB6E5C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFingerRoot_group_decMat";
	rename -uid "31FED4DE-4EE5-8C50-EFB4-B19C20EC7758";
createNode multMatrix -n "pinkyFingerRoot_group_multMat";
	rename -uid "CF3DFB77-41CA-19F7-C505-1FBF73FF923F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_1_group_decMat";
	rename -uid "309C1486-435D-6F44-050C-FE8CEC670467";
createNode multMatrix -n "pinkyFinger_1_group_multMat";
	rename -uid "AE9B13BE-4F0D-2F36-0B12-87A301ABE3C4";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_2_group_decMat";
	rename -uid "2B18D652-43B5-0A63-DECC-13B22753C6D9";
createNode multMatrix -n "pinkyFinger_2_group_multMat";
	rename -uid "EDF95601-415B-F2EE-CDC5-D0A691CD0DDE";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_3_group_decMat";
	rename -uid "372E137C-402E-E827-2342-0299C61FE702";
createNode multMatrix -n "pinkyFinger_3_group_multMat";
	rename -uid "3D2F9CA6-451C-BC96-8869-6CA5B0F4EF97";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "thumbFinger_1_outJoint_decMat";
	rename -uid "FDBCC414-4A78-08E9-9485-27BEFDD63410";
createNode multMatrix -n "thumbFinger_1_outJoint_multMat";
	rename -uid "2E1C8D7F-4F34-5695-68BE-97BD48B2E0C4";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "thumbFinger_2_outJoint_decMat";
	rename -uid "22DDCF12-4A11-8109-3CEE-B289513EC347";
createNode multMatrix -n "thumbFinger_2_outJoint_multMat";
	rename -uid "975ABBBA-44D3-379A-B795-458C7EC67BB5";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "thumbFinger_3_outJoint_decMat";
	rename -uid "FAE40C92-4897-1641-BF4D-D0A8CF6B0A6E";
createNode multMatrix -n "thumbFinger_3_outJoint_multMat";
	rename -uid "AA2A188F-4B44-235F-0BCD-688077E71FB3";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "index_root_outJoint_decMat";
	rename -uid "68E8705F-4708-E758-8440-DB9A43833FD7";
createNode multMatrix -n "index_root_outJoint_multMat";
	rename -uid "9F2FF4A0-4EE5-9927-5A06-58BD4DF33A35";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "indexFinger_1_outJoint_decMat";
	rename -uid "30ABBA19-4687-239A-CB34-6C9267354BEF";
createNode multMatrix -n "indexFinger_1_outJoint_multMat";
	rename -uid "9C58BC64-401A-FD3B-A7F5-4E953ABA4E97";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "indexFinger_2_outJoint_decMat";
	rename -uid "AB572C19-420E-82AE-E308-09A63492C4EF";
createNode multMatrix -n "indexFinger_2_outJoint_multMat";
	rename -uid "1189B364-4C89-C2DE-0C27-7C989E3D1CC8";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "indexFinger_3_outJoint_decMat";
	rename -uid "99A5E64E-40DC-E874-0028-71AA9EFA42F2";
createNode multMatrix -n "indexFinger_3_outJoint_multMat";
	rename -uid "D20163CD-45D8-B3FF-2EBD-2982B4EAE84E";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "middle_rooit_outJoint_decMat";
	rename -uid "E729526A-434C-2445-AE14-AB8F4561813F";
createNode multMatrix -n "middle_rooit_outJoint_multMat";
	rename -uid "81361060-4185-477D-2B68-4B882F56920E";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "middleFinger_1_outJoint_decMat";
	rename -uid "B0DC5A4C-42D8-806D-E193-2B93909BFDBC";
createNode multMatrix -n "middleFinger_1_outJoint_multMat";
	rename -uid "83E41431-4070-0961-B8C7-39B94EC680B7";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "middleFinger_2_outJoint_decMat";
	rename -uid "FB8BD06F-43FE-D078-2DA8-B08D5F91CB02";
createNode multMatrix -n "middleFinger_2_outJoint_multMat";
	rename -uid "903CEDEE-49D0-95E0-080D-A59FD0F95EE0";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "middleFinger_3_outJoint_decMat";
	rename -uid "A58752CD-446E-27C7-9FBC-148F80CE5E01";
createNode multMatrix -n "middleFinger_3_outJoint_multMat";
	rename -uid "E0FB4E7A-440B-D9D9-77A2-D5B27DB00227";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "ring_root_outJoint_decMat";
	rename -uid "8402DC8D-4E8A-D2C7-E65C-6AA98C8D6E47";
createNode multMatrix -n "ring_root_outJoint_multMat";
	rename -uid "0841B3B4-4560-48E2-0D09-4EBAFF300CC0";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "ringFinger_1_outJoint_decMat";
	rename -uid "F3EB8BB4-4126-DDCB-81DB-2198279B4F38";
createNode multMatrix -n "ringFinger_1_outJoint_multMat";
	rename -uid "A73FB1AF-4F6A-FC9C-F3C2-A58F3614A168";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "ringFinger_2_outJoint_decMat";
	rename -uid "86AF260D-4CD1-4E7E-2218-CC9BF085C9D3";
createNode multMatrix -n "ringFinger_2_outJoint_multMat";
	rename -uid "2544927A-4E21-7BD2-B5D6-64BBC8D72F69";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "ringFinger_3_outJoint_decMat";
	rename -uid "2A173B92-45DE-6A7C-24FE-4BB3CFB54C2A";
createNode multMatrix -n "ringFinger_3_outJoint_multMat";
	rename -uid "9A80AAA7-4A37-7A9A-5C19-6FAC99A5F36C";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "pinky_root_outJoint_decMat";
	rename -uid "382AB3C0-430B-B7ED-3219-D7BB0A377E53";
createNode multMatrix -n "pinky_root_outJoint_multMat";
	rename -uid "033E04F9-4D6F-E721-B405-278C904F1863";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "pinkyFinger_1_outJoint_decMat";
	rename -uid "9867741D-49EA-6F3B-02BF-F6B751A56076";
createNode multMatrix -n "pinkyFinger_1_outJoint_multMat";
	rename -uid "0B57A719-4EEE-6151-2B86-8A855EB91E96";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "pinkyFinger_2_outJoint_decMat";
	rename -uid "73F1E5A9-4F13-DEF0-47C2-7AB20D3D5C4E";
createNode multMatrix -n "pinkyFinger_2_outJoint_multMat";
	rename -uid "A4CAFA1C-432E-5288-FBE1-28A3F1313E7F";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "pinkyFinger_3_outJoint_decMat";
	rename -uid "B19D8C7B-4660-5840-A815-E484104D42AF";
createNode multMatrix -n "pinkyFinger_3_outJoint_multMat";
	rename -uid "2EB9087E-461B-185E-98CF-3A846CD80FDB";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "thumbFinger_end_outJoint_decMat";
	rename -uid "C66E5CE7-4A56-96C2-C086-579FF70BD643";
createNode multMatrix -n "thumbFinger_end_outJoint_multMat";
	rename -uid "AACA17AD-4238-4D03-CC9C-02A99B50333E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_end_outJoint_decMat";
	rename -uid "D940D057-46EE-3DB7-7B5D-BA9E96F1417D";
createNode multMatrix -n "indexFinger_end_outJoint_multMat";
	rename -uid "47F50D94-43CE-CC66-0F58-41A06A8D42AA";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_end_outJoint_decMat";
	rename -uid "0C38AD44-4994-682B-10F8-F198FF4127F6";
createNode multMatrix -n "middleFinger_end_outJoint_multMat";
	rename -uid "1EDF6D0F-4973-B5BA-251B-7ABCC1642B8D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_end_outJoint_decMat";
	rename -uid "423AFBC3-4F2B-EE21-B053-878550433328";
createNode multMatrix -n "ringFinger_end_outJoint_multMat";
	rename -uid "C8AEBA15-4FFD-7299-A5E6-EF8ED9D18248";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_end_outJoint_decMat";
	rename -uid "60C972FF-42B9-D3B2-D915-84A1277483EC";
createNode multMatrix -n "pinkyFinger_end_outJoint_multMat";
	rename -uid "449B44E3-460A-987B-81A2-95ABDC26F656";
	setAttr -s 2 ".i";
createNode objectSet -n "index_moduleControlSet";
	rename -uid "D706DE67-4253-AF2E-3249-B7B9E2A301F8";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "middle_moduleControlSet";
	rename -uid "C50812BF-4F31-B6E2-361D-11A39A47C9D4";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "ring_moduleControlSet";
	rename -uid "55DAF7A6-48B5-D875-07C0-95848E3FC0AB";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "pinky_moduleControlSet";
	rename -uid "625BADB2-4341-EF49-22E2-97B79375930D";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode pairBlend -n "pairBlend1";
	rename -uid "77C04C33-46A1-5B47-5DD0-D6912A967E3B";
	setAttr ".w" 0.66;
createNode pairBlend -n "pairBlend2";
	rename -uid "90DADF6C-4131-5F9C-2A72-5F86F1584172";
	setAttr ".w" 0.33;
createNode condition -n "mirror_condition";
	rename -uid "07F72874-48A0-09B7-D1A8-EEA0969A4C48";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
createNode multDoubleLinear -n "multDoubleLinear1";
	rename -uid "CF5518E0-4616-9874-B2CB-599D4C292234";
createNode decomposeMatrix -n "root_outJoint_decMat";
	rename -uid "565120B6-448A-4A0B-A40C-2D942CE7E370";
createNode multMatrix -n "root_outJoint_multMat";
	rename -uid "81121C1F-4EE9-5FD7-BF1E-45A043E573F5";
	setAttr -s 3 ".i";
createNode composeMatrix -n "composeMatrix1";
	rename -uid "4276FF0A-4137-09FC-694A-2A9EC90DA616";
createNode composeMatrix -n "composeMatrix2";
	rename -uid "61FD2AF4-4C28-8C2C-5349-1683700F058F";
createNode pairBlend -n "ring_pairBlend";
	rename -uid "6C2F17FE-4159-69E2-6EF3-93A497FD0170";
	setAttr ".w" 0.666;
	setAttr ".ri" 1;
createNode multMatrix -n "ring_root_outJoint_multMat1";
	rename -uid "252B0456-463C-B2DA-6F47-50AE801FFF41";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "ring_root_outJoint_decMat1";
	rename -uid "B51EB565-4AA9-33C6-7928-A8A2F2C6324D";
createNode pairBlend -n "middle_pairBlend";
	rename -uid "8580EB4F-4B73-A34A-AAA1-3ABC9E68D98E";
	setAttr ".w" 0.333;
	setAttr ".ri" 1;
createNode multMatrix -n "middle_rooit_outJoint_multMat1";
	rename -uid "46BB26C9-4A85-53C2-AADE-7682855A6489";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "middle_rooit_outJoint_decMat1";
	rename -uid "D7BE0BC3-4C14-1F5E-9133-B0952647D3C3";
createNode multMatrix -n "pinky_root_outJoint_multMat1";
	rename -uid "B33641A4-458F-B2D9-F80E-ABB5E99F8CAD";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "pinky_root_outJoint_decMat1";
	rename -uid "497B3F67-4DC6-3BF9-A11C-08B5AA72526B";
createNode makeNurbCircle -n "makeNurbCircle1";
	rename -uid "F08A1912-40C0-D45B-85AC-6B911B587F2A";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode multDoubleLinear -n "multDoubleLinear2";
	rename -uid "F96613B1-4CE2-5882-9670-14B2BCDA8CF7";
createNode unitConversion -n "unitConversion1426";
	rename -uid "378403D7-4ABB-7275-9EAA-988708823DAE";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear3";
	rename -uid "460BDF6D-47D2-94E6-C7AC-5AA84722DB86";
createNode multDoubleLinear -n "multDoubleLinear4";
	rename -uid "0D4D0792-4F0F-BAC7-C0F9-43BD1510EAEC";
createNode unitConversion -n "unitConversion1427";
	rename -uid "0794B98F-4D26-3382-5435-1D8AD9431638";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1428";
	rename -uid "E21FE371-410E-B5B7-4448-7EA47C30D233";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear5";
	rename -uid "94CC3FE2-48BF-408E-66E2-8392AE589DD4";
createNode multDoubleLinear -n "multDoubleLinear6";
	rename -uid "1AE98A8B-4FFD-07C7-58DE-47AD8D18982F";
createNode multDoubleLinear -n "multDoubleLinear7";
	rename -uid "7C6E04E8-4F5E-332C-2988-B792A502E184";
createNode unitConversion -n "unitConversion1429";
	rename -uid "4E56D9CD-4530-3B73-569E-17AC85D791D0";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1430";
	rename -uid "75C8D626-4E4E-DFC5-D970-92AE2CD30E64";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1431";
	rename -uid "40016D54-45DD-6992-A1A2-7DBB65465CF3";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear8";
	rename -uid "2CCB2365-4B45-CE2F-F3E9-F381C7B9D840";
createNode multDoubleLinear -n "multDoubleLinear9";
	rename -uid "CDCCA9D6-4321-92FD-7DB1-5CBA0EEC8C96";
createNode multDoubleLinear -n "multDoubleLinear10";
	rename -uid "F331B63D-4502-7A58-CC2A-4B8A696681B1";
createNode unitConversion -n "unitConversion1432";
	rename -uid "BC8981C3-45DE-E6EF-0017-2AB0850A2AAE";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1433";
	rename -uid "0A394EE3-4401-6B97-DA82-CB947ABB77C9";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1434";
	rename -uid "0EFDA732-4D21-A396-F14E-ABB9C100F02F";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear11";
	rename -uid "B638718F-4881-D0A1-5DBC-0EB44DCC23A5";
createNode multDoubleLinear -n "multDoubleLinear12";
	rename -uid "25371F9A-4E6C-E4BA-D88A-EEBAD7F6E306";
createNode multDoubleLinear -n "multDoubleLinear13";
	rename -uid "128F2E2D-4BC5-D73D-FE00-BAB0011EB0AB";
createNode unitConversion -n "unitConversion1435";
	rename -uid "0A4612D6-4254-5AE0-1A8C-43838DCB888F";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1436";
	rename -uid "4069224B-462F-28A3-B3AB-EA84CDF7D3EF";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1437";
	rename -uid "C8CE92A6-410A-6DFB-F128-12A8B95A62F4";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear14";
	rename -uid "3FB887B5-4752-937F-B1D8-A09FD4641911";
createNode multDoubleLinear -n "multDoubleLinear15";
	rename -uid "E90036A5-47BE-89E6-A5FA-8799D1D1A3B3";
createNode multDoubleLinear -n "multDoubleLinear16";
	rename -uid "E3B2D574-48C4-482B-1A7F-E9A7E36E3B09";
createNode unitConversion -n "unitConversion1438";
	rename -uid "9C947459-410A-9EE7-843F-DB9D340E1BC8";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1439";
	rename -uid "4D93EAB6-4859-0C9B-001E-E5BD11F9CDA0";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1440";
	rename -uid "755A7EF3-47A3-FD23-1F8C-29BDB6E671E2";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear17";
	rename -uid "4F66A7D3-452B-D6BE-73F5-C5A672E2BA40";
createNode unitConversion -n "unitConversion1441";
	rename -uid "68F3185E-4396-5430-F4E5-DFA698E68B03";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear18";
	rename -uid "0377935F-43C6-B6F3-D320-C8B59F5CAD9C";
createNode unitConversion -n "unitConversion1442";
	rename -uid "CE195E06-4F8B-4DD3-1F13-2ABBE5EE9076";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear19";
	rename -uid "6D5C5C21-4F8E-E706-C9B4-1C869D612EAD";
createNode unitConversion -n "unitConversion1443";
	rename -uid "4AA65257-4333-281F-E2DB-2CB0D2E0A30C";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear20";
	rename -uid "A90E3250-4052-D033-B89A-0D8D2363F2DB";
createNode unitConversion -n "unitConversion1444";
	rename -uid "735C49AF-462A-00C6-AB67-07B4E6CB94AD";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear21";
	rename -uid "E5F0D474-47C1-3BBA-8D8D-9FBF6682C0FF";
createNode unitConversion -n "unitConversion1445";
	rename -uid "4E625A06-4C5E-DB2D-7B0A-2695FF3E4B1E";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear22";
	rename -uid "B0C7F769-468B-4043-08D4-36AF565EF095";
createNode unitConversion -n "unitConversion1446";
	rename -uid "83BD847D-48FF-ED91-A144-6ABC5C714C16";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear23";
	rename -uid "F8F87A82-44DC-4494-C33D-D5A4AFC246DB";
createNode unitConversion -n "unitConversion1447";
	rename -uid "6169B4AA-43BC-303A-4C88-3C950472730F";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear24";
	rename -uid "51CD4F45-44E9-398D-AF66-1C8DBD356DA7";
createNode unitConversion -n "unitConversion1448";
	rename -uid "AB45FCEC-41A8-E761-53FE-AC881B5D388C";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear25";
	rename -uid "92694F0F-495F-3837-78A1-759241DC755E";
createNode unitConversion -n "unitConversion1449";
	rename -uid "C646E771-46D2-3A0E-A6F4-9089BABA4380";
	setAttr ".cf" 0.017453292519943295;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "7C4143D9-4229-134A-C163-C4B3B52DB267";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "B7B98CF5-4530-52E6-0924-3D87B4E2BF4E";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "C96A8F96-4C18-2F6D-A4FA-9AA6E1AF2AF0";
createNode multiplyDivide -n "multiplyDivide1";
	rename -uid "97DD9A78-413D-CE73-B0AE-D0A7C359B1DD";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "430D5B51-4B41-5D06-0C91-68B0FDA48EAE";
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "F2C49F93-4400-6DAA-A366-BAA13DC90259";
createNode makeNurbSphere -n "makeNurbSphere4";
	rename -uid "54650D3D-4917-94CA-5663-7AA7EF9469ED";
createNode multiplyDivide -n "multiplyDivide2";
	rename -uid "7C7C1C9B-45B7-0023-9F21-ADACE9807C27";
	setAttr ".i2" -type "float3" 0.5 0.5 0.1 ;
createNode makeNurbSphere -n "makeNurbSphere5";
	rename -uid "8458B2E1-42D2-A92B-E5D2-CA86E3F0231D";
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "DDF22569-43BA-D28D-77A2-38B97C19CBAE";
createNode makeNurbSphere -n "makeNurbSphere6";
	rename -uid "5CC1ADA9-43D2-8E44-238D-45A8AF6CF241";
createNode makeNurbSphere -n "makeNurbSphere7";
	rename -uid "7677D01C-49E4-6E37-A67B-79BDB1C62D72";
createNode makeNurbSphere -n "makeNurbSphere8";
	rename -uid "014BE79D-463D-8E82-D278-23BBC7D5E0DC";
createNode makeNurbSphere -n "makeNurbSphere9";
	rename -uid "9B2FA9FE-407E-8CD7-7E52-148B077DD3D8";
createNode makeNurbSphere -n "makeNurbSphere10";
	rename -uid "679AC19F-4E25-BE95-5076-358EC7C321D7";
createNode makeNurbSphere -n "makeNurbSphere11";
	rename -uid "0DA88375-4E66-B1CE-8C4D-FAA543FDD451";
createNode makeNurbSphere -n "makeNurbSphere12";
	rename -uid "B10F12C4-40C1-8594-A91E-29B4B1CE25B5";
createNode multiplyDivide -n "multiplyDivide4";
	rename -uid "13E5EE59-4615-79B8-3E23-1482E2655AA2";
createNode multiplyDivide -n "multiplyDivide5";
	rename -uid "57B3D95B-4C0A-4EE0-9E26-12BDC5AFF726";
createNode makeNurbSphere -n "makeNurbSphere13";
	rename -uid "8353952A-4845-1152-0B8A-43B5070A806D";
createNode makeNurbSphere -n "makeNurbSphere14";
	rename -uid "83C66D1F-49F0-2D5B-0C25-518BA3488213";
createNode makeNurbSphere -n "makeNurbSphere15";
	rename -uid "415CC292-48C2-A8D6-3903-C79E07163D71";
createNode makeNurbSphere -n "makeNurbSphere16";
	rename -uid "5BCDA9BC-42C5-B87F-D2AE-21A8FE95DFE1";
createNode multiplyDivide -n "multiplyDivide6";
	rename -uid "4AD9CAA3-4C84-9971-D47D-7DB1B7DE97E3";
createNode makeNurbSphere -n "makeNurbSphere17";
	rename -uid "4CF30176-40A7-D33C-A31B-41A8D63A9F65";
createNode makeNurbSphere -n "makeNurbSphere18";
	rename -uid "44CD0CEA-4989-A27A-879F-41934C161055";
createNode makeNurbSphere -n "makeNurbSphere19";
	rename -uid "3AFD6B6D-4472-DCDE-A5A6-578E569165B8";
createNode makeNurbSphere -n "makeNurbSphere20";
	rename -uid "6BDBB5F8-4A2F-195D-C8BE-249683B957A7";
createNode multiplyDivide -n "multiplyDivide7";
	rename -uid "CDC54DD6-42CE-A0B3-501F-499C0B93AFAD";
createNode makeNurbSphere -n "makeNurbSphere21";
	rename -uid "3664E318-47B8-FB40-18AD-A2B59EB4AD0D";
createNode makeNurbSphere -n "makeNurbSphere22";
	rename -uid "BC8224AB-4678-2938-6568-3ABEA351B49B";
createNode makeNurbSphere -n "makeNurbSphere23";
	rename -uid "C4C2D85D-4354-9EE3-BB24-A78C122F8BC6";
createNode makeNurbSphere -n "makeNurbSphere24";
	rename -uid "F38A618A-4CFF-8643-CF77-94B2108665A6";
createNode multiplyDivide -n "multiplyDivide8";
	rename -uid "AF6B22B9-428A-FBCF-BCB8-A4BD13171736";
	setAttr ".i2" -type "float3" 0.5 1 0.5 ;
createNode multiplyDivide -n "multiplyDivide9";
	rename -uid "E1F6B9EB-4A04-1D58-0C51-A4AD47FD3C4E";
createNode makeNurbSphere -n "makeNurbSphere25";
	rename -uid "B4E28EF0-4752-2C60-BB42-F1A6336AE53E";
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "7DC32EA2-4B93-3B29-A075-F1BB314069E9";
createNode multDoubleLinear -n "multDoubleLinear26";
	rename -uid "32EE8354-41BB-BA30-92FC-83939FCF2DCD";
createNode sweepMeshCreator -n "sweepMeshCreator2";
	rename -uid "3F0792B4-4CA6-4474-494A-C09B5DB8B82B";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
	setAttr -s 5 ".inCurveArray";
	setAttr -s 5 ".outMeshArray";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "732DF30F-4288-98AB-D6CF-3A8604F24488";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -839.64265264530991 -928.77046803485564 ;
	setAttr ".tgi[0].vh" -type "double2" 285.40860843230416 116.79861816427271 ;
	setAttr -s 44 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -911.4285888671875;
	setAttr ".tgi[0].ni[0].y" -44.285713195800781;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[1].y" 778.5714111328125;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[2].y" -901.4285888671875;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[3].y" -597.14288330078125;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -911.4285888671875;
	setAttr ".tgi[0].ni[4].y" -625.71429443359375;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -911.4285888671875;
	setAttr ".tgi[0].ni[5].y" -145.71427917480469;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" -911.4285888671875;
	setAttr ".tgi[0].ni[6].y" -727.14288330078125;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[7].y" -32.857143402099609;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[8].y" -495.71429443359375;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[9].y" 271.42855834960938;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[10].y" -1611.4285888671875;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[11].y" -698.5714111328125;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[12].y" -1510;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[13].y" 575.71429443359375;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[14].y" -292.85714721679688;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[15].y" 474.28570556640625;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[16].y" -800;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[17].y" 880;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[18].y" -1205.7142333984375;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[19].y" -1002.8571166992188;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" -1588.5714111328125;
	setAttr ".tgi[0].ni[20].y" -142.85714721679688;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[21].y" -1712.857177734375;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[22].y" 372.85714721679688;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[23].y" -1408.5714111328125;
	setAttr ".tgi[0].ni[23].nvs" 18304;
	setAttr ".tgi[0].ni[24].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[24].y" -191.42857360839844;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" -911.4285888671875;
	setAttr ".tgi[0].ni[25].y" 95.714286804199219;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[0].ni[26].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[26].y" -394.28570556640625;
	setAttr ".tgi[0].ni[26].nvs" 18304;
	setAttr ".tgi[0].ni[27].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[27].y" 677.14288330078125;
	setAttr ".tgi[0].ni[27].nvs" 18304;
	setAttr ".tgi[0].ni[28].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[28].y" -1307.142822265625;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[29].y" 68.571426391601562;
	setAttr ".tgi[0].ni[29].nvs" 18304;
	setAttr ".tgi[0].ni[30].x" -909.5361328125;
	setAttr ".tgi[0].ni[30].y" -462.41329956054688;
	setAttr ".tgi[0].ni[30].nvs" 18304;
	setAttr ".tgi[0].ni[31].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[31].y" 170;
	setAttr ".tgi[0].ni[31].nvs" 18304;
	setAttr ".tgi[0].ni[32].x" -1281.4285888671875;
	setAttr ".tgi[0].ni[32].y" -1104.2857666015625;
	setAttr ".tgi[0].ni[32].nvs" 18304;
	setAttr ".tgi[0].ni[33].x" 35.714286804199219;
	setAttr ".tgi[0].ni[33].y" -111.42857360839844;
	setAttr ".tgi[0].ni[33].nvs" 18304;
	setAttr ".tgi[0].ni[34].x" -260;
	setAttr ".tgi[0].ni[34].y" -315.71429443359375;
	setAttr ".tgi[0].ni[34].nvs" 18304;
	setAttr ".tgi[0].ni[35].x" -546.32611083984375;
	setAttr ".tgi[0].ni[35].y" -148.66389465332031;
	setAttr ".tgi[0].ni[35].nvs" 18305;
	setAttr ".tgi[0].ni[36].x" 35.714286804199219;
	setAttr ".tgi[0].ni[36].y" -371.42855834960938;
	setAttr ".tgi[0].ni[36].nvs" 18304;
	setAttr ".tgi[0].ni[37].x" -260;
	setAttr ".tgi[0].ni[37].y" -417.14285278320312;
	setAttr ".tgi[0].ni[37].nvs" 18304;
	setAttr ".tgi[0].ni[38].x" 35.714286804199219;
	setAttr ".tgi[0].ni[38].y" -241.42857360839844;
	setAttr ".tgi[0].ni[38].nvs" 18304;
	setAttr ".tgi[0].ni[39].x" -260;
	setAttr ".tgi[0].ni[39].y" -11.428571701049805;
	setAttr ".tgi[0].ni[39].nvs" 18304;
	setAttr ".tgi[0].ni[40].x" 35.714286804199219;
	setAttr ".tgi[0].ni[40].y" -631.4285888671875;
	setAttr ".tgi[0].ni[40].nvs" 18304;
	setAttr ".tgi[0].ni[41].x" -260;
	setAttr ".tgi[0].ni[41].y" -214.28572082519531;
	setAttr ".tgi[0].ni[41].nvs" 18304;
	setAttr ".tgi[0].ni[42].x" 35.714286804199219;
	setAttr ".tgi[0].ni[42].y" -501.42855834960938;
	setAttr ".tgi[0].ni[42].nvs" 18304;
	setAttr ".tgi[0].ni[43].x" -260;
	setAttr ".tgi[0].ni[43].y" -112.85713958740234;
	setAttr ".tgi[0].ni[43].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -284.2745855091656 -5620.5454266667548 ;
	setAttr ".tgi[1].vh" -type "double2" 1995.0027169923492 -3502.2936022225376 ;
	setAttr -s 75 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 526.469482421875;
	setAttr ".tgi[1].ni[0].y" -4429.02685546875;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 823.30877685546875;
	setAttr ".tgi[1].ni[1].y" -4353.1171875;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 3088.571533203125;
	setAttr ".tgi[1].ni[2].y" -3648.571533203125;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 1060.54833984375;
	setAttr ".tgi[1].ni[3].y" -1319.0626220703125;
	setAttr ".tgi[1].ni[3].nvs" 18305;
	setAttr ".tgi[1].ni[4].x" 608.1463623046875;
	setAttr ".tgi[1].ni[4].y" -1633.1165771484375;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 579.18695068359375;
	setAttr ".tgi[1].ni[5].y" -3507.684814453125;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 1355.50390625;
	setAttr ".tgi[1].ni[6].y" -411.93453979492188;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" 1052.9141845703125;
	setAttr ".tgi[1].ni[7].y" -2275.234375;
	setAttr ".tgi[1].ni[7].nvs" 18305;
	setAttr ".tgi[1].ni[8].x" 3087.142822265625;
	setAttr ".tgi[1].ni[8].y" -3388.571533203125;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" 1663.823974609375;
	setAttr ".tgi[1].ni[9].y" -3713.9912109375;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[1].ni[10].x" 3088.571533203125;
	setAttr ".tgi[1].ni[10].y" -3518.571533203125;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" 1721.3736572265625;
	setAttr ".tgi[1].ni[11].y" -1052.8388671875;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" 1722.023681640625;
	setAttr ".tgi[1].ni[12].y" -2300.361328125;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" 1772.9742431640625;
	setAttr ".tgi[1].ni[13].y" -1399.573486328125;
	setAttr ".tgi[1].ni[13].nvs" 18304;
	setAttr ".tgi[1].ni[14].x" 1772.9742431640625;
	setAttr ".tgi[1].ni[14].y" -1659.573486328125;
	setAttr ".tgi[1].ni[14].nvs" 18304;
	setAttr ".tgi[1].ni[15].x" 1655.8798828125;
	setAttr ".tgi[1].ni[15].y" -3147.79443359375;
	setAttr ".tgi[1].ni[15].nvs" 18304;
	setAttr ".tgi[1].ni[16].x" 1699.5526123046875;
	setAttr ".tgi[1].ni[16].y" -912.17236328125;
	setAttr ".tgi[1].ni[16].nvs" 18304;
	setAttr ".tgi[1].ni[17].x" 611.30535888671875;
	setAttr ".tgi[1].ni[17].y" -3794.422607421875;
	setAttr ".tgi[1].ni[17].nvs" 18304;
	setAttr ".tgi[1].ni[18].x" 611.49627685546875;
	setAttr ".tgi[1].ni[18].y" -2813.289306640625;
	setAttr ".tgi[1].ni[18].nvs" 18304;
	setAttr ".tgi[1].ni[19].x" 1772.9742431640625;
	setAttr ".tgi[1].ni[19].y" -1529.573486328125;
	setAttr ".tgi[1].ni[19].nvs" 18304;
	setAttr ".tgi[1].ni[20].x" 1025.0733642578125;
	setAttr ".tgi[1].ni[20].y" -3442.76220703125;
	setAttr ".tgi[1].ni[20].nvs" 18305;
	setAttr ".tgi[1].ni[21].x" 1346.25732421875;
	setAttr ".tgi[1].ni[21].y" -3510.052001953125;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" 1630.4208984375;
	setAttr ".tgi[1].ni[22].y" -3614.265380859375;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" 608.1463623046875;
	setAttr ".tgi[1].ni[23].y" -1514.209228515625;
	setAttr ".tgi[1].ni[23].nvs" 18304;
	setAttr ".tgi[1].ni[24].x" 1767.880859375;
	setAttr ".tgi[1].ni[24].y" -2010.1893310546875;
	setAttr ".tgi[1].ni[24].nvs" 18304;
	setAttr ".tgi[1].ni[25].x" 611.30535888671875;
	setAttr ".tgi[1].ni[25].y" -3924.422607421875;
	setAttr ".tgi[1].ni[25].nvs" 18304;
	setAttr ".tgi[1].ni[26].x" 1749.1744384765625;
	setAttr ".tgi[1].ni[26].y" -2153.535888671875;
	setAttr ".tgi[1].ni[26].nvs" 18304;
	setAttr ".tgi[1].ni[27].x" 1655.8798828125;
	setAttr ".tgi[1].ni[27].y" -3017.79443359375;
	setAttr ".tgi[1].ni[27].nvs" 18304;
	setAttr ".tgi[1].ni[28].x" 1763.516357421875;
	setAttr ".tgi[1].ni[28].y" -1798.1669921875;
	setAttr ".tgi[1].ni[28].nvs" 18304;
	setAttr ".tgi[1].ni[29].x" 588.18011474609375;
	setAttr ".tgi[1].ni[29].y" -3604.76513671875;
	setAttr ".tgi[1].ni[29].nvs" 18304;
	setAttr ".tgi[1].ni[30].x" 1694.1165771484375;
	setAttr ".tgi[1].ni[30].y" -762.306396484375;
	setAttr ".tgi[1].ni[30].nvs" 18304;
	setAttr ".tgi[1].ni[31].x" 1652.2613525390625;
	setAttr ".tgi[1].ni[31].y" -3470.13330078125;
	setAttr ".tgi[1].ni[31].nvs" 18304;
	setAttr ".tgi[1].ni[32].x" 1724.897216796875;
	setAttr ".tgi[1].ni[32].y" -4097.29931640625;
	setAttr ".tgi[1].ni[32].nvs" 18304;
	setAttr ".tgi[1].ni[33].x" 920;
	setAttr ".tgi[1].ni[33].y" -4950;
	setAttr ".tgi[1].ni[33].nvs" 18304;
	setAttr ".tgi[1].ni[34].x" 608.15863037109375;
	setAttr ".tgi[1].ni[34].y" -3041.90966796875;
	setAttr ".tgi[1].ni[34].nvs" 18304;
	setAttr ".tgi[1].ni[35].x" 1413.3829345703125;
	setAttr ".tgi[1].ni[35].y" -2159.978759765625;
	setAttr ".tgi[1].ni[35].nvs" 18304;
	setAttr ".tgi[1].ni[36].x" 1677.5499267578125;
	setAttr ".tgi[1].ni[36].y" -391.58126831054688;
	setAttr ".tgi[1].ni[36].nvs" 18305;
	setAttr ".tgi[1].ni[37].x" 1413.3829345703125;
	setAttr ".tgi[1].ni[37].y" -2289.978759765625;
	setAttr ".tgi[1].ni[37].nvs" 18304;
	setAttr ".tgi[1].ni[38].x" 1036.849365234375;
	setAttr ".tgi[1].ni[38].y" -3917.63916015625;
	setAttr ".tgi[1].ni[38].nvs" 18305;
	setAttr ".tgi[1].ni[39].x" 236.83369445800781;
	setAttr ".tgi[1].ni[39].y" -4179.2763671875;
	setAttr ".tgi[1].ni[39].nvs" 18305;
	setAttr ".tgi[1].ni[40].x" 1415.767822265625;
	setAttr ".tgi[1].ni[40].y" -2627.023193359375;
	setAttr ".tgi[1].ni[40].nvs" 18304;
	setAttr ".tgi[1].ni[41].x" 1662.3953857421875;
	setAttr ".tgi[1].ni[41].y" -3882.050048828125;
	setAttr ".tgi[1].ni[41].nvs" 18304;
	setAttr ".tgi[1].ni[42].x" 1049.139404296875;
	setAttr ".tgi[1].ni[42].y" -1801.5914306640625;
	setAttr ".tgi[1].ni[42].nvs" 18305;
	setAttr ".tgi[1].ni[43].x" 1660.51611328125;
	setAttr ".tgi[1].ni[43].y" -3282.39990234375;
	setAttr ".tgi[1].ni[43].nvs" 18304;
	setAttr ".tgi[1].ni[44].x" 1326.8240966796875;
	setAttr ".tgi[1].ni[44].y" -1114.6055908203125;
	setAttr ".tgi[1].ni[44].nvs" 18304;
	setAttr ".tgi[1].ni[45].x" 615.11273193359375;
	setAttr ".tgi[1].ni[45].y" -3174.820556640625;
	setAttr ".tgi[1].ni[45].nvs" 18304;
	setAttr ".tgi[1].ni[46].x" 1342.3587646484375;
	setAttr ".tgi[1].ni[46].y" -3175.3564453125;
	setAttr ".tgi[1].ni[46].nvs" 18304;
	setAttr ".tgi[1].ni[47].x" 608.1463623046875;
	setAttr ".tgi[1].ni[47].y" -1893.1165771484375;
	setAttr ".tgi[1].ni[47].nvs" 18304;
	setAttr ".tgi[1].ni[48].x" 1730.7283935546875;
	setAttr ".tgi[1].ni[48].y" -2617.03466796875;
	setAttr ".tgi[1].ni[48].nvs" 18304;
	setAttr ".tgi[1].ni[49].x" 1722.27294921875;
	setAttr ".tgi[1].ni[49].y" -2443.861328125;
	setAttr ".tgi[1].ni[49].nvs" 18304;
	setAttr ".tgi[1].ni[50].x" 1331.74658203125;
	setAttr ".tgi[1].ni[50].y" -3927.005126953125;
	setAttr ".tgi[1].ni[50].nvs" 18304;
	setAttr ".tgi[1].ni[51].x" 1321.717041015625;
	setAttr ".tgi[1].ni[51].y" -4076.1513671875;
	setAttr ".tgi[1].ni[51].nvs" 18304;
	setAttr ".tgi[1].ni[52].x" 1336.538330078125;
	setAttr ".tgi[1].ni[52].y" -785.73486328125;
	setAttr ".tgi[1].ni[52].nvs" 18304;
	setAttr ".tgi[1].ni[53].x" 1413.3829345703125;
	setAttr ".tgi[1].ni[53].y" -2419.978759765625;
	setAttr ".tgi[1].ni[53].nvs" 18304;
	setAttr ".tgi[1].ni[54].x" 1376.9959716796875;
	setAttr ".tgi[1].ni[54].y" -1566.7587890625;
	setAttr ".tgi[1].ni[54].nvs" 18304;
	setAttr ".tgi[1].ni[55].x" 1326.8240966796875;
	setAttr ".tgi[1].ni[55].y" -984.60552978515625;
	setAttr ".tgi[1].ni[55].nvs" 18304;
	setAttr ".tgi[1].ni[56].x" 614.54046630859375;
	setAttr ".tgi[1].ni[56].y" -2435.92138671875;
	setAttr ".tgi[1].ni[56].nvs" 18304;
	setAttr ".tgi[1].ni[57].x" 3087.142822265625;
	setAttr ".tgi[1].ni[57].y" -3258.571533203125;
	setAttr ".tgi[1].ni[57].nvs" 18304;
	setAttr ".tgi[1].ni[58].x" 615.52880859375;
	setAttr ".tgi[1].ni[58].y" -3994.732421875;
	setAttr ".tgi[1].ni[58].nvs" 18304;
	setAttr ".tgi[1].ni[59].x" 618.5068359375;
	setAttr ".tgi[1].ni[59].y" -2295.318115234375;
	setAttr ".tgi[1].ni[59].nvs" 18304;
	setAttr ".tgi[1].ni[60].x" 1342.3587646484375;
	setAttr ".tgi[1].ni[60].y" -3305.3564453125;
	setAttr ".tgi[1].ni[60].nvs" 18304;
	setAttr ".tgi[1].ni[61].x" 614.54046630859375;
	setAttr ".tgi[1].ni[61].y" -2695.92138671875;
	setAttr ".tgi[1].ni[61].nvs" 18304;
	setAttr ".tgi[1].ni[62].x" 614.54046630859375;
	setAttr ".tgi[1].ni[62].y" -2565.92138671875;
	setAttr ".tgi[1].ni[62].nvs" 18304;
	setAttr ".tgi[1].ni[63].x" 1337.26416015625;
	setAttr ".tgi[1].ni[63].y" -3752.065673828125;
	setAttr ".tgi[1].ni[63].nvs" 18304;
	setAttr ".tgi[1].ni[64].x" 1029.9991455078125;
	setAttr ".tgi[1].ni[64].y" -809.22052001953125;
	setAttr ".tgi[1].ni[64].nvs" 18305;
	setAttr ".tgi[1].ni[65].x" 1052.564697265625;
	setAttr ".tgi[1].ni[65].y" -306.67056274414062;
	setAttr ".tgi[1].ni[65].nvs" 18305;
	setAttr ".tgi[1].ni[66].x" 1379.67236328125;
	setAttr ".tgi[1].ni[66].y" -1459.5084228515625;
	setAttr ".tgi[1].ni[66].nvs" 18304;
	setAttr ".tgi[1].ni[67].x" 1413.3829345703125;
	setAttr ".tgi[1].ni[67].y" -2028.44775390625;
	setAttr ".tgi[1].ni[67].nvs" 18304;
	setAttr ".tgi[1].ni[68].x" 605.73870849609375;
	setAttr ".tgi[1].ni[68].y" -3308.895263671875;
	setAttr ".tgi[1].ni[68].nvs" 18304;
	setAttr ".tgi[1].ni[69].x" 1382.218017578125;
	setAttr ".tgi[1].ni[69].y" -1353.764404296875;
	setAttr ".tgi[1].ni[69].nvs" 18304;
	setAttr ".tgi[1].ni[70].x" 1338.56689453125;
	setAttr ".tgi[1].ni[70].y" -3045.3564453125;
	setAttr ".tgi[1].ni[70].nvs" 18304;
	setAttr ".tgi[1].ni[71].x" 1046.0911865234375;
	setAttr ".tgi[1].ni[71].y" -2970.168701171875;
	setAttr ".tgi[1].ni[71].nvs" 18305;
	setAttr ".tgi[1].ni[72].x" 1341.1182861328125;
	setAttr ".tgi[1].ni[72].y" -3634.9130859375;
	setAttr ".tgi[1].ni[72].nvs" 18304;
	setAttr ".tgi[1].ni[73].x" 1412.1583251953125;
	setAttr ".tgi[1].ni[73].y" -1803.5474853515625;
	setAttr ".tgi[1].ni[73].nvs" 18304;
	setAttr ".tgi[1].ni[74].x" 597.440673828125;
	setAttr ".tgi[1].ni[74].y" -1730.612548828125;
	setAttr ".tgi[1].ni[74].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" 924.4835540607736 -2112.3029400845394 ;
	setAttr ".tgi[2].vh" -type "double2" 2628.1973837169417 -528.95240873881517 ;
	setAttr -s 3 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 1121.4285888671875;
	setAttr ".tgi[2].ni[0].y" -791.4285888671875;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[2].ni[1].x" 1747.142822265625;
	setAttr ".tgi[2].ni[1].y" -970;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 1428.5714111328125;
	setAttr ".tgi[2].ni[2].y" -871.4285888671875;
	setAttr ".tgi[2].ni[2].nvs" 18304;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 34;
	setAttr -av ".unw" 34;
	setAttr -k on ".etw";
	setAttr -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr ".etmr" no;
	setAttr ".tmr" 4096;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".st";
	setAttr -k on ".an";
	setAttr -k on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 40 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr ".mcfr" 25;
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -cb on ".imfkey";
	setAttr -k on ".gama";
	setAttr -k on ".an";
	setAttr -cb on ".ar";
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr -av -k on ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep" 1;
	setAttr -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".pff";
	setAttr -cb on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -cb on ".sosl";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w" 640;
	setAttr -av ".h" 480;
	setAttr -av ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av ".dar" 1.3333332538604736;
	setAttr -av -k on ".ldar";
	setAttr -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -k on ".isu";
	setAttr -k on ".pdu";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultObjectSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :defaultColorMgtGlobals;
	setAttr ".cme" no;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off ".eeaa";
	setAttr -k off ".engm";
	setAttr -k off ".mes";
	setAttr -k off ".emb";
	setAttr -av -k off ".mbbf";
	setAttr -k off ".mbs";
	setAttr -k off ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off ".twa";
	setAttr -k off ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr" 25;
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "mainPoser.size" "mainPoser_clusterHandle.sx";
connectAttr "mainPoser.size" "mainPoser_clusterHandle.sy";
connectAttr "mainPoser.size" "mainPoser_clusterHandle.sz";
connectAttr "thumbFinger_mainPoser.sx" "thumbFinger_mainPoser.sy" -l on;
connectAttr "thumbFinger_mainPoser.sx" "thumbFinger_mainPoser.sz" -l on;
connectAttr "thumbFinger_cluster4GroupId.id" "thumbFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "thumbFinger_cluster4Set.mwc" "thumbFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "thumbFinger_groupId42.id" "thumbFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "thumbFinger_tweakSet24.mwc" "thumbFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "thumbFinger_mainPoser_clusterHandleCluster.og[0]" "thumbFinger_mainPoserShape.cr"
		;
connectAttr "thumbFinger_tweak24.pl[0].cp[0]" "thumbFinger_mainPoserShape.twl";
connectAttr "thumbFinger_mainPoser.size" "thumbFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "thumbFinger_mainPoser.size" "thumbFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "thumbFinger_mainPoser.size" "thumbFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere2.os" "thumbFingerA_poserNurbsShape.cr";
connectAttr "thumbFingerA_poserOrient_aimConstraint1.crx" "thumbFingerA_poserOrient.rx"
		;
connectAttr "thumbFingerA_poserOrient_aimConstraint1.cry" "thumbFingerA_poserOrient.ry"
		;
connectAttr "thumbFingerA_poserOrient_aimConstraint1.crz" "thumbFingerA_poserOrient.rz"
		;
connectAttr "thumbFingerA_poserOrient.pim" "thumbFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "thumbFingerA_poserOrient.t" "thumbFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "thumbFingerA_poserOrient.rp" "thumbFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "thumbFingerA_poserOrient.rpt" "thumbFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "thumbFingerA_poserOrient.ro" "thumbFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "thumbFingerB_poser.t" "thumbFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "thumbFingerB_poser.rp" "thumbFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "thumbFingerB_poser.rpt" "thumbFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "thumbFingerB_poser.pm" "thumbFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "thumbFingerA_poserOrient_aimConstraint1.w0" "thumbFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1406.o" "thumbFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere4.os" "thumbFingerB_poserNurbsShape.cr";
connectAttr "thumbFingerB_poserOrient_aimConstraint1.crx" "thumbFingerB_poserOrient.rx"
		;
connectAttr "thumbFingerB_poserOrient_aimConstraint1.cry" "thumbFingerB_poserOrient.ry"
		;
connectAttr "thumbFingerB_poserOrient_aimConstraint1.crz" "thumbFingerB_poserOrient.rz"
		;
connectAttr "thumbFingerB_poserOrient.pim" "thumbFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "thumbFingerB_poserOrient.t" "thumbFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "thumbFingerB_poserOrient.rp" "thumbFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "thumbFingerB_poserOrient.rpt" "thumbFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "thumbFingerB_poserOrient.ro" "thumbFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "thumbFingerC_poser.t" "thumbFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "thumbFingerC_poser.rp" "thumbFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "thumbFingerC_poser.rpt" "thumbFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "thumbFingerC_poser.pm" "thumbFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "thumbFingerB_poserOrient_aimConstraint1.w0" "thumbFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1407.o" "thumbFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere3.os" "thumbFingerC_poserNurbsShape.cr";
connectAttr "thumbFingerC_poserOrient_aimConstraint1.crx" "thumbFingerC_poserOrient.rx"
		;
connectAttr "thumbFingerC_poserOrient_aimConstraint1.cry" "thumbFingerC_poserOrient.ry"
		;
connectAttr "thumbFingerC_poserOrient_aimConstraint1.crz" "thumbFingerC_poserOrient.rz"
		;
connectAttr "thumbFingerC_poserOrient.pim" "thumbFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "thumbFingerC_poserOrient.t" "thumbFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "thumbFingerC_poserOrient.rp" "thumbFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "thumbFingerC_poserOrient.rpt" "thumbFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "thumbFingerC_poserOrient.ro" "thumbFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "thumbFingerD_poser.t" "thumbFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "thumbFingerD_poser.rp" "thumbFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "thumbFingerD_poser.rpt" "thumbFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "thumbFingerD_poser.pm" "thumbFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "thumbFingerC_poserOrient_aimConstraint1.w0" "thumbFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1408.o" "thumbFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere5.os" "thumbFingerD_poserNurbsShape.cr";
connectAttr "makeNurbSphere1.os" "pinkyFingerRoot_poserNurbsShape.cr";
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.crx" "pinkyFingerRoot_poserOrient.rx"
		;
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.cry" "pinkyFingerRoot_poserOrient.ry"
		;
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.crz" "pinkyFingerRoot_poserOrient.rz"
		;
connectAttr "pinkyFingerRoot_poserOrient.pim" "pinkyFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerRoot_poserOrient.t" "pinkyFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerRoot_poserOrient.rp" "pinkyFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerRoot_poserOrient.rpt" "pinkyFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerRoot_poserOrient.ro" "pinkyFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerA_poser.t" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerA_poser.rp" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerA_poser.rpt" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerA_poser.pm" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.w0" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1421.o" "pinkyFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere8.os" "ringFingerRoot_poserNurbsShape.cr";
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.crx" "ringFingerRoot_poserOrient.rx"
		;
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.cry" "ringFingerRoot_poserOrient.ry"
		;
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.crz" "ringFingerRoot_poserOrient.rz"
		;
connectAttr "ringFingerRoot_poserOrient.pim" "ringFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerRoot_poserOrient.t" "ringFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerRoot_poserOrient.rp" "ringFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerRoot_poserOrient.rpt" "ringFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerRoot_poserOrient.ro" "ringFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerA_poser.t" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerA_poser.rp" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerA_poser.rpt" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerA_poser.pm" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.w0" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1417.o" "ringFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere7.os" "middleFingerRoot_poserNurbsShape.cr";
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.crx" "middleFingerRoot_poserOrient.rx"
		;
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.cry" "middleFingerRoot_poserOrient.ry"
		;
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.crz" "middleFingerRoot_poserOrient.rz"
		;
connectAttr "middleFingerRoot_poserOrient.pim" "middleFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerRoot_poserOrient.t" "middleFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerRoot_poserOrient.rp" "middleFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerRoot_poserOrient.rpt" "middleFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerRoot_poserOrient.ro" "middleFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerA_poser.t" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerA_poser.rp" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerA_poser.rpt" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerA_poser.pm" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.w0" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1413.o" "middleFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere6.os" "indexFingerRoot_poserNurbsShape.cr";
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.crx" "indexFingerRoot_poserOrient.rx"
		;
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.cry" "indexFingerRoot_poserOrient.ry"
		;
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.crz" "indexFingerRoot_poserOrient.rz"
		;
connectAttr "indexFingerRoot_poserOrient.pim" "indexFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerRoot_poserOrient.t" "indexFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerRoot_poserOrient.rp" "indexFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerRoot_poserOrient.rpt" "indexFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerRoot_poserOrient.ro" "indexFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerA_poser.t" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerA_poser.rp" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerA_poser.rpt" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerA_poser.pm" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.w0" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1409.o" "indexFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "indexFinger_mainPoser.sx" "indexFinger_mainPoser.sy" -l on;
connectAttr "indexFinger_mainPoser.sx" "indexFinger_mainPoser.sz" -l on;
connectAttr "indexFinger_cluster4GroupId.id" "indexFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "indexFinger_cluster4Set.mwc" "indexFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "indexFinger_groupId42.id" "indexFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "indexFinger_tweakSet24.mwc" "indexFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "indexFinger_mainPoser_clusterHandleCluster.og[0]" "indexFinger_mainPoserShape.cr"
		;
connectAttr "indexFinger_tweak24.pl[0].cp[0]" "indexFinger_mainPoserShape.twl";
connectAttr "indexFinger_mainPoser.size" "indexFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "indexFinger_mainPoser.size" "indexFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "indexFinger_mainPoser.size" "indexFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere9.os" "indexFingerA_poserNurbsShape.cr";
connectAttr "indexFingerA_poserOrient_aimConstraint1.crx" "indexFingerA_poserOrient.rx"
		;
connectAttr "indexFingerA_poserOrient_aimConstraint1.cry" "indexFingerA_poserOrient.ry"
		;
connectAttr "indexFingerA_poserOrient_aimConstraint1.crz" "indexFingerA_poserOrient.rz"
		;
connectAttr "indexFingerA_poserOrient.pim" "indexFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerA_poserOrient.t" "indexFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerA_poserOrient.rp" "indexFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerA_poserOrient.rpt" "indexFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerA_poserOrient.ro" "indexFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerB_poser.t" "indexFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerB_poser.rp" "indexFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerB_poser.rpt" "indexFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerB_poser.pm" "indexFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerA_poserOrient_aimConstraint1.w0" "indexFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1410.o" "indexFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere11.os" "indexFingerB_poserNurbsShape.cr";
connectAttr "indexFingerB_poserOrient_aimConstraint1.crx" "indexFingerB_poserOrient.rx"
		;
connectAttr "indexFingerB_poserOrient_aimConstraint1.cry" "indexFingerB_poserOrient.ry"
		;
connectAttr "indexFingerB_poserOrient_aimConstraint1.crz" "indexFingerB_poserOrient.rz"
		;
connectAttr "indexFingerB_poserOrient.pim" "indexFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerB_poserOrient.t" "indexFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerB_poserOrient.rp" "indexFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerB_poserOrient.rpt" "indexFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerB_poserOrient.ro" "indexFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerC_poser.t" "indexFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerC_poser.rp" "indexFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerC_poser.rpt" "indexFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerC_poser.pm" "indexFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerB_poserOrient_aimConstraint1.w0" "indexFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1411.o" "indexFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere12.os" "indexFingerC_poserNurbsShape.cr";
connectAttr "indexFingerC_poserOrient_aimConstraint1.crx" "indexFingerC_poserOrient.rx"
		;
connectAttr "indexFingerC_poserOrient_aimConstraint1.cry" "indexFingerC_poserOrient.ry"
		;
connectAttr "indexFingerC_poserOrient_aimConstraint1.crz" "indexFingerC_poserOrient.rz"
		;
connectAttr "indexFingerC_poserOrient.pim" "indexFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerC_poserOrient.t" "indexFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerC_poserOrient.rp" "indexFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerC_poserOrient.rpt" "indexFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerC_poserOrient.ro" "indexFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerD_poser.t" "indexFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerD_poser.rp" "indexFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerD_poser.rpt" "indexFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerD_poser.pm" "indexFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerC_poserOrient_aimConstraint1.w0" "indexFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1412.o" "indexFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere10.os" "indexFingerD_poserNurbsShape.cr";
connectAttr "middleFinger_mainPoser.sx" "middleFinger_mainPoser.sy" -l on;
connectAttr "middleFinger_mainPoser.sx" "middleFinger_mainPoser.sz" -l on;
connectAttr "middleFinger_cluster4GroupId.id" "middleFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "middleFinger_cluster4Set.mwc" "middleFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "middleFinger_groupId42.id" "middleFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "middleFinger_tweakSet24.mwc" "middleFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "middleFinger_mainPoser_clusterHandleCluster.og[0]" "middleFinger_mainPoserShape.cr"
		;
connectAttr "middleFinger_tweak24.pl[0].cp[0]" "middleFinger_mainPoserShape.twl"
		;
connectAttr "middleFinger_mainPoser.size" "middleFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "middleFinger_mainPoser.size" "middleFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "middleFinger_mainPoser.size" "middleFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere13.os" "middleFingerA_poserNurbsShape.cr";
connectAttr "middleFingerA_poserOrient_aimConstraint1.crx" "middleFingerA_poserOrient.rx"
		;
connectAttr "middleFingerA_poserOrient_aimConstraint1.cry" "middleFingerA_poserOrient.ry"
		;
connectAttr "middleFingerA_poserOrient_aimConstraint1.crz" "middleFingerA_poserOrient.rz"
		;
connectAttr "middleFingerA_poserOrient.pim" "middleFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerA_poserOrient.t" "middleFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerA_poserOrient.rp" "middleFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerA_poserOrient.rpt" "middleFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerA_poserOrient.ro" "middleFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerB_poser.t" "middleFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerB_poser.rp" "middleFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerB_poser.rpt" "middleFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerB_poser.pm" "middleFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerA_poserOrient_aimConstraint1.w0" "middleFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1414.o" "middleFingerA_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere14.os" "middleFingerB_poserNurbsShape.cr";
connectAttr "middleFingerB_poserOrient_aimConstraint1.crx" "middleFingerB_poserOrient.rx"
		;
connectAttr "middleFingerB_poserOrient_aimConstraint1.cry" "middleFingerB_poserOrient.ry"
		;
connectAttr "middleFingerB_poserOrient_aimConstraint1.crz" "middleFingerB_poserOrient.rz"
		;
connectAttr "middleFingerB_poserOrient.pim" "middleFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerB_poserOrient.t" "middleFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerB_poserOrient.rp" "middleFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerB_poserOrient.rpt" "middleFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerB_poserOrient.ro" "middleFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerC_poser.t" "middleFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerC_poser.rp" "middleFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerC_poser.rpt" "middleFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerC_poser.pm" "middleFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerB_poserOrient_aimConstraint1.w0" "middleFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1415.o" "middleFingerB_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere15.os" "middleFingerC_poserNurbsShape.cr";
connectAttr "middleFingerC_poserOrient_aimConstraint1.crx" "middleFingerC_poserOrient.rx"
		;
connectAttr "middleFingerC_poserOrient_aimConstraint1.cry" "middleFingerC_poserOrient.ry"
		;
connectAttr "middleFingerC_poserOrient_aimConstraint1.crz" "middleFingerC_poserOrient.rz"
		;
connectAttr "middleFingerC_poserOrient.pim" "middleFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerC_poserOrient.t" "middleFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerC_poserOrient.rp" "middleFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerC_poserOrient.rpt" "middleFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerC_poserOrient.ro" "middleFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerD_poser.t" "middleFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerD_poser.rp" "middleFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerD_poser.rpt" "middleFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerD_poser.pm" "middleFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerC_poserOrient_aimConstraint1.w0" "middleFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1416.o" "middleFingerC_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere16.os" "middleFingerD_poserNurbsShape.cr";
connectAttr "ringFinger_mainPoser.sx" "ringFinger_mainPoser.sy" -l on;
connectAttr "ringFinger_mainPoser.sx" "ringFinger_mainPoser.sz" -l on;
connectAttr "ringFinger_cluster4GroupId.id" "ringFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "ringFinger_cluster4Set.mwc" "ringFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "ringFinger_groupId42.id" "ringFinger_mainPoserShape.iog.og[2].gid";
connectAttr "ringFinger_tweakSet24.mwc" "ringFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "ringFinger_mainPoser_clusterHandleCluster.og[0]" "ringFinger_mainPoserShape.cr"
		;
connectAttr "ringFinger_tweak24.pl[0].cp[0]" "ringFinger_mainPoserShape.twl";
connectAttr "ringFinger_mainPoser.size" "ringFinger_mainPoser_clusterHandle.sx";
connectAttr "ringFinger_mainPoser.size" "ringFinger_mainPoser_clusterHandle.sy";
connectAttr "ringFinger_mainPoser.size" "ringFinger_mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere17.os" "ringFingerA_poserNurbsShape.cr";
connectAttr "ringFingerA_poserOrient_aimConstraint1.crx" "ringFingerA_poserOrient.rx"
		;
connectAttr "ringFingerA_poserOrient_aimConstraint1.cry" "ringFingerA_poserOrient.ry"
		;
connectAttr "ringFingerA_poserOrient_aimConstraint1.crz" "ringFingerA_poserOrient.rz"
		;
connectAttr "ringFingerA_poserOrient.pim" "ringFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerA_poserOrient.t" "ringFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerA_poserOrient.rp" "ringFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerA_poserOrient.rpt" "ringFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerA_poserOrient.ro" "ringFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerB_poser.t" "ringFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerB_poser.rp" "ringFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerB_poser.rpt" "ringFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerB_poser.pm" "ringFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerA_poserOrient_aimConstraint1.w0" "ringFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1418.o" "ringFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere20.os" "ringFingerB_poserNurbsShape.cr";
connectAttr "ringFingerB_poserOrient_aimConstraint1.crx" "ringFingerB_poserOrient.rx"
		;
connectAttr "ringFingerB_poserOrient_aimConstraint1.cry" "ringFingerB_poserOrient.ry"
		;
connectAttr "ringFingerB_poserOrient_aimConstraint1.crz" "ringFingerB_poserOrient.rz"
		;
connectAttr "ringFingerB_poserOrient.pim" "ringFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerB_poserOrient.t" "ringFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerB_poserOrient.rp" "ringFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerB_poserOrient.rpt" "ringFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerB_poserOrient.ro" "ringFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerC_poser.t" "ringFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerC_poser.rp" "ringFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerC_poser.rpt" "ringFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerC_poser.pm" "ringFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerB_poserOrient_aimConstraint1.w0" "ringFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1419.o" "ringFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere19.os" "ringFingerC_poserNurbsShape.cr";
connectAttr "ringFingerC_poserOrient_aimConstraint1.crx" "ringFingerC_poserOrient.rx"
		;
connectAttr "ringFingerC_poserOrient_aimConstraint1.cry" "ringFingerC_poserOrient.ry"
		;
connectAttr "ringFingerC_poserOrient_aimConstraint1.crz" "ringFingerC_poserOrient.rz"
		;
connectAttr "ringFingerC_poserOrient.pim" "ringFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerC_poserOrient.t" "ringFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerC_poserOrient.rp" "ringFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerC_poserOrient.rpt" "ringFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerC_poserOrient.ro" "ringFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerD_poser.t" "ringFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerD_poser.rp" "ringFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerD_poser.rpt" "ringFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerD_poser.pm" "ringFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerC_poserOrient_aimConstraint1.w0" "ringFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1420.o" "ringFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere18.os" "ringFingerD_poserNurbsShape.cr";
connectAttr "pinkyFinger_mainPoser.sx" "pinkyFinger_mainPoser.sy" -l on;
connectAttr "pinkyFinger_mainPoser.sx" "pinkyFinger_mainPoser.sz" -l on;
connectAttr "pinkyFinger_cluster4GroupId.id" "pinkyFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "pinkyFinger_cluster4Set.mwc" "pinkyFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "pinkyFinger_groupId42.id" "pinkyFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "pinkyFinger_tweakSet24.mwc" "pinkyFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "pinkyFinger_mainPoser_clusterHandleCluster.og[0]" "pinkyFinger_mainPoserShape.cr"
		;
connectAttr "pinkyFinger_tweak24.pl[0].cp[0]" "pinkyFinger_mainPoserShape.twl";
connectAttr "pinkyFinger_mainPoser.size" "pinkyFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "pinkyFinger_mainPoser.size" "pinkyFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "pinkyFinger_mainPoser.size" "pinkyFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere23.os" "pinkyFingerA_poserNurbsShape.cr";
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.crx" "pinkyFingerA_poserOrient.rx"
		;
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.cry" "pinkyFingerA_poserOrient.ry"
		;
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.crz" "pinkyFingerA_poserOrient.rz"
		;
connectAttr "pinkyFingerA_poserOrient.pim" "pinkyFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerA_poserOrient.t" "pinkyFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerA_poserOrient.rp" "pinkyFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerA_poserOrient.rpt" "pinkyFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerA_poserOrient.ro" "pinkyFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerB_poser.t" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerB_poser.rp" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerB_poser.rpt" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerB_poser.pm" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.w0" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1422.o" "pinkyFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere24.os" "pinkyFingerB_poserNurbsShape.cr";
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.crx" "pinkyFingerB_poserOrient.rx"
		;
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.cry" "pinkyFingerB_poserOrient.ry"
		;
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.crz" "pinkyFingerB_poserOrient.rz"
		;
connectAttr "pinkyFingerB_poserOrient.pim" "pinkyFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerB_poserOrient.t" "pinkyFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerB_poserOrient.rp" "pinkyFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerB_poserOrient.rpt" "pinkyFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerB_poserOrient.ro" "pinkyFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerC_poser.t" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerC_poser.rp" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerC_poser.rpt" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerC_poser.pm" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.w0" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1423.o" "pinkyFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere22.os" "pinkyFingerC_poserNurbsShape.cr";
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.crx" "pinkyFingerC_poserOrient.rx"
		;
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.cry" "pinkyFingerC_poserOrient.ry"
		;
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.crz" "pinkyFingerC_poserOrient.rz"
		;
connectAttr "pinkyFingerC_poserOrient.pim" "pinkyFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerC_poserOrient.t" "pinkyFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerC_poserOrient.rp" "pinkyFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerC_poserOrient.rpt" "pinkyFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerC_poserOrient.ro" "pinkyFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerD_poser.t" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerD_poser.rp" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerD_poser.rpt" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerD_poser.pm" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.w0" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1424.o" "pinkyFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere21.os" "pinkyFingerD_poserNurbsShape.cr";
connectAttr "makeNurbSphere25.os" "root_poserNurbsShape.cr";
connectAttr "root_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[0]";
connectAttr "thumbFingerA_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[1]"
		;
connectAttr "thumbFingerB_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[2]"
		;
connectAttr "thumbFingerC_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[3]"
		;
connectAttr "thumbFingerD_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[4]"
		;
connectAttr "root_poser_locShape.wp" "indexFinger_posers_curveShape.cp[0]";
connectAttr "indexFingerRoot_poser_locShape.wp" "indexFinger_posers_curveShape.cp[1]"
		;
connectAttr "indexFingerA_poser_locShape.wp" "indexFinger_posers_curveShape.cp[2]"
		;
connectAttr "indexFingerB_poser_locShape.wp" "indexFinger_posers_curveShape.cp[3]"
		;
connectAttr "indexFingerC_poser_locShape.wp" "indexFinger_posers_curveShape.cp[4]"
		;
connectAttr "indexFingerD_poser_locShape.wp" "indexFinger_posers_curveShape.cp[5]"
		;
connectAttr "root_poser_locShape.wp" "middleFinger_posers_curveShape.cp[0]";
connectAttr "middleFingerRoot_poserOrientShape.wp" "middleFinger_posers_curveShape.cp[1]"
		;
connectAttr "middleFingerA_poser_locShape.wp" "middleFinger_posers_curveShape.cp[2]"
		;
connectAttr "middleFingerB_poser_locShape.wp" "middleFinger_posers_curveShape.cp[3]"
		;
connectAttr "middleFingerC_poser_locShape.wp" "middleFinger_posers_curveShape.cp[4]"
		;
connectAttr "middleFingerD_poser_locShape.wp" "middleFinger_posers_curveShape.cp[5]"
		;
connectAttr "root_poser_locShape.wp" "ringFinger_posers_curveShape.cp[0]";
connectAttr "ringFingerRoot_poser_locShape.wp" "ringFinger_posers_curveShape.cp[1]"
		;
connectAttr "ringFingerA_poser_locShape.wp" "ringFinger_posers_curveShape.cp[2]"
		;
connectAttr "ringFingerB_poser_locShape.wp" "ringFinger_posers_curveShape.cp[3]"
		;
connectAttr "ringFingerC_poser_locShape.wp" "ringFinger_posers_curveShape.cp[4]"
		;
connectAttr "ringFingerD_poser_locShape.wp" "ringFinger_posers_curveShape.cp[5]"
		;
connectAttr "root_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[0]";
connectAttr "pinkyFingerRoot_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[1]"
		;
connectAttr "pinkyFingerA_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[2]"
		;
connectAttr "pinkyFingerB_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[3]"
		;
connectAttr "pinkyFingerC_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[4]"
		;
connectAttr "pinkyFingerD_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[5]"
		;
connectAttr "sweepMeshCreator2.outMeshArray[0]" "thumbFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[1]" "indexFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[2]" "middleFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[3]" "ringFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[4]" "pinkyFinger_posers_sweepShape.i"
		;
connectAttr "decomposeMatrix236.otx" "input.tx";
connectAttr "decomposeMatrix236.oty" "input.ty";
connectAttr "decomposeMatrix236.otz" "input.tz";
connectAttr "decomposeMatrix236.orx" "input.rx";
connectAttr "decomposeMatrix236.ory" "input.ry";
connectAttr "decomposeMatrix236.orz" "input.rz";
connectAttr "decomposeMatrix236.osx" "input.sx";
connectAttr "decomposeMatrix236.osy" "input.sy";
connectAttr "decomposeMatrix236.osz" "input.sz";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "thumbFinger_1_group_decMat.otx" "thumbFinger_1_group.tx";
connectAttr "thumbFinger_1_group_decMat.oty" "thumbFinger_1_group.ty";
connectAttr "thumbFinger_1_group_decMat.otz" "thumbFinger_1_group.tz";
connectAttr "thumbFinger_1_group_decMat.orx" "thumbFinger_1_group.rx";
connectAttr "thumbFinger_1_group_decMat.ory" "thumbFinger_1_group.ry";
connectAttr "thumbFinger_1_group_decMat.orz" "thumbFinger_1_group.rz";
connectAttr "thumbFinger_1_group_decMat.osx" "thumbFinger_1_group.sx";
connectAttr "thumbFinger_1_group_decMat.osy" "thumbFinger_1_group.sy";
connectAttr "thumbFinger_1_group_decMat.osz" "thumbFinger_1_group.sz";
connectAttr "thumbFinger_mainPoser.lodv" "thumbFinger_1_group.v";
connectAttr "unitConversion1426.o" "thumbFinger_1_group_2.rz";
connectAttr "unitConversion1441.o" "thumbFinger_1_group_2.ry";
connectAttr "thumbFinger_2_offset_decMat.otx" "thumbFinger_2_group.tx";
connectAttr "thumbFinger_2_offset_decMat.oty" "thumbFinger_2_group.ty";
connectAttr "thumbFinger_2_offset_decMat.otz" "thumbFinger_2_group.tz";
connectAttr "thumbFinger_2_offset_decMat.orx" "thumbFinger_2_group.rx";
connectAttr "thumbFinger_2_offset_decMat.ory" "thumbFinger_2_group.ry";
connectAttr "thumbFinger_2_offset_decMat.orz" "thumbFinger_2_group.rz";
connectAttr "thumbFinger_2_offset_decMat.osx" "thumbFinger_2_group.sx";
connectAttr "thumbFinger_2_offset_decMat.osy" "thumbFinger_2_group.sy";
connectAttr "thumbFinger_2_offset_decMat.osz" "thumbFinger_2_group.sz";
connectAttr "unitConversion1427.o" "thumbFinger_2_group_2.rz";
connectAttr "thumbFinger_3_offset_decMat.otx" "thumbFinger_3_group.tx";
connectAttr "thumbFinger_3_offset_decMat.oty" "thumbFinger_3_group.ty";
connectAttr "thumbFinger_3_offset_decMat.otz" "thumbFinger_3_group.tz";
connectAttr "thumbFinger_3_offset_decMat.orx" "thumbFinger_3_group.rx";
connectAttr "thumbFinger_3_offset_decMat.ory" "thumbFinger_3_group.ry";
connectAttr "thumbFinger_3_offset_decMat.orz" "thumbFinger_3_group.rz";
connectAttr "thumbFinger_3_offset_decMat.osx" "thumbFinger_3_group.sx";
connectAttr "thumbFinger_3_offset_decMat.osy" "thumbFinger_3_group.sy";
connectAttr "thumbFinger_3_offset_decMat.osz" "thumbFinger_3_group.sz";
connectAttr "unitConversion1428.o" "thumbFinger_3_group_2.rz";
connectAttr "indexFingerRoot_group_decMat.otx" "indexFingerRoot_group.tx";
connectAttr "indexFingerRoot_group_decMat.oty" "indexFingerRoot_group.ty";
connectAttr "indexFingerRoot_group_decMat.otz" "indexFingerRoot_group.tz";
connectAttr "indexFingerRoot_group_decMat.orx" "indexFingerRoot_group.rx";
connectAttr "indexFingerRoot_group_decMat.ory" "indexFingerRoot_group.ry";
connectAttr "indexFingerRoot_group_decMat.orz" "indexFingerRoot_group.rz";
connectAttr "indexFingerRoot_group_decMat.osx" "indexFingerRoot_group.sx";
connectAttr "indexFingerRoot_group_decMat.osy" "indexFingerRoot_group.sy";
connectAttr "indexFingerRoot_group_decMat.osz" "indexFingerRoot_group.sz";
connectAttr "indexFingerRoot_poser.lodv" "indexFingerRoot_group.v";
connectAttr "unitConversion1442.o" "indexFingerRoot_group_2.ry";
connectAttr "indexFinger_1_group_decMat.otx" "indexFinger_1_group.tx";
connectAttr "indexFinger_1_group_decMat.oty" "indexFinger_1_group.ty";
connectAttr "indexFinger_1_group_decMat.otz" "indexFinger_1_group.tz";
connectAttr "indexFinger_1_group_decMat.orx" "indexFinger_1_group.rx";
connectAttr "indexFinger_1_group_decMat.ory" "indexFinger_1_group.ry";
connectAttr "indexFinger_1_group_decMat.orz" "indexFinger_1_group.rz";
connectAttr "indexFinger_1_group_decMat.osx" "indexFinger_1_group.sx";
connectAttr "indexFinger_1_group_decMat.osy" "indexFinger_1_group.sy";
connectAttr "indexFinger_1_group_decMat.osz" "indexFinger_1_group.sz";
connectAttr "unitConversion1429.o" "indexFinger_1_group_2.rz";
connectAttr "unitConversion1449.o" "indexFinger_1_group_2.ry";
connectAttr "indexFinger_2_group_decMat.otx" "indexFinger_2_group.tx";
connectAttr "indexFinger_2_group_decMat.oty" "indexFinger_2_group.ty";
connectAttr "indexFinger_2_group_decMat.otz" "indexFinger_2_group.tz";
connectAttr "indexFinger_2_group_decMat.orx" "indexFinger_2_group.rx";
connectAttr "indexFinger_2_group_decMat.ory" "indexFinger_2_group.ry";
connectAttr "indexFinger_2_group_decMat.orz" "indexFinger_2_group.rz";
connectAttr "indexFinger_2_group_decMat.osx" "indexFinger_2_group.sx";
connectAttr "indexFinger_2_group_decMat.osy" "indexFinger_2_group.sy";
connectAttr "indexFinger_2_group_decMat.osz" "indexFinger_2_group.sz";
connectAttr "unitConversion1430.o" "indexFinger_2_group_2.rz";
connectAttr "indexFinger_3_group_decMat.otx" "indexFinger_3_group.tx";
connectAttr "indexFinger_3_group_decMat.oty" "indexFinger_3_group.ty";
connectAttr "indexFinger_3_group_decMat.otz" "indexFinger_3_group.tz";
connectAttr "indexFinger_3_group_decMat.orx" "indexFinger_3_group.rx";
connectAttr "indexFinger_3_group_decMat.ory" "indexFinger_3_group.ry";
connectAttr "indexFinger_3_group_decMat.orz" "indexFinger_3_group.rz";
connectAttr "indexFinger_3_group_decMat.osx" "indexFinger_3_group.sx";
connectAttr "indexFinger_3_group_decMat.osy" "indexFinger_3_group.sy";
connectAttr "indexFinger_3_group_decMat.osz" "indexFinger_3_group.sz";
connectAttr "unitConversion1431.o" "indexFinger_3_group_2.rz";
connectAttr "middleFingerRoot_group_decMat.otx" "middleFingerRoot_group.tx";
connectAttr "middleFingerRoot_group_decMat.oty" "middleFingerRoot_group.ty";
connectAttr "middleFingerRoot_group_decMat.otz" "middleFingerRoot_group.tz";
connectAttr "middleFingerRoot_group_decMat.orx" "middleFingerRoot_group.rx";
connectAttr "middleFingerRoot_group_decMat.ory" "middleFingerRoot_group.ry";
connectAttr "middleFingerRoot_group_decMat.orz" "middleFingerRoot_group.rz";
connectAttr "middleFingerRoot_group_decMat.osx" "middleFingerRoot_group.sx";
connectAttr "middleFingerRoot_group_decMat.osy" "middleFingerRoot_group.sy";
connectAttr "middleFingerRoot_group_decMat.osz" "middleFingerRoot_group.sz";
connectAttr "middleFingerRoot_poser.lodv" "middleFingerRoot_group.v";
connectAttr "pairBlend2.or" "middleFingerRoot_clenchGroup.r";
connectAttr "unitConversion1443.o" "middleFingerRoot_group_2.ry";
connectAttr "middleFinger_1_group_decMat.otx" "middleFinger_1_group.tx";
connectAttr "middleFinger_1_group_decMat.oty" "middleFinger_1_group.ty";
connectAttr "middleFinger_1_group_decMat.otz" "middleFinger_1_group.tz";
connectAttr "middleFinger_1_group_decMat.orx" "middleFinger_1_group.rx";
connectAttr "middleFinger_1_group_decMat.ory" "middleFinger_1_group.ry";
connectAttr "middleFinger_1_group_decMat.orz" "middleFinger_1_group.rz";
connectAttr "middleFinger_1_group_decMat.osx" "middleFinger_1_group.sx";
connectAttr "middleFinger_1_group_decMat.osy" "middleFinger_1_group.sy";
connectAttr "middleFinger_1_group_decMat.osz" "middleFinger_1_group.sz";
connectAttr "unitConversion1432.o" "middleFinger_1_group_2.rz";
connectAttr "unitConversion1448.o" "middleFinger_1_group_2.ry";
connectAttr "middleFinger_2_group_decMat.otx" "middleFinger_2_group.tx";
connectAttr "middleFinger_2_group_decMat.oty" "middleFinger_2_group.ty";
connectAttr "middleFinger_2_group_decMat.otz" "middleFinger_2_group.tz";
connectAttr "middleFinger_2_group_decMat.orx" "middleFinger_2_group.rx";
connectAttr "middleFinger_2_group_decMat.ory" "middleFinger_2_group.ry";
connectAttr "middleFinger_2_group_decMat.orz" "middleFinger_2_group.rz";
connectAttr "middleFinger_2_group_decMat.osx" "middleFinger_2_group.sx";
connectAttr "middleFinger_2_group_decMat.osy" "middleFinger_2_group.sy";
connectAttr "middleFinger_2_group_decMat.osz" "middleFinger_2_group.sz";
connectAttr "unitConversion1433.o" "middleFinger_2_group_2.rz";
connectAttr "middleFinger_3_group_decMat.otx" "middleFinger_3_group.tx";
connectAttr "middleFinger_3_group_decMat.oty" "middleFinger_3_group.ty";
connectAttr "middleFinger_3_group_decMat.otz" "middleFinger_3_group.tz";
connectAttr "middleFinger_3_group_decMat.orx" "middleFinger_3_group.rx";
connectAttr "middleFinger_3_group_decMat.ory" "middleFinger_3_group.ry";
connectAttr "middleFinger_3_group_decMat.orz" "middleFinger_3_group.rz";
connectAttr "middleFinger_3_group_decMat.osx" "middleFinger_3_group.sx";
connectAttr "middleFinger_3_group_decMat.osy" "middleFinger_3_group.sy";
connectAttr "middleFinger_3_group_decMat.osz" "middleFinger_3_group.sz";
connectAttr "unitConversion1434.o" "middleFinger_3_group_2.rz";
connectAttr "ringFingerRoot_group_decMat.otx" "ringFingerRoot_group.tx";
connectAttr "ringFingerRoot_group_decMat.oty" "ringFingerRoot_group.ty";
connectAttr "ringFingerRoot_group_decMat.otz" "ringFingerRoot_group.tz";
connectAttr "ringFingerRoot_group_decMat.orx" "ringFingerRoot_group.rx";
connectAttr "ringFingerRoot_group_decMat.ory" "ringFingerRoot_group.ry";
connectAttr "ringFingerRoot_group_decMat.orz" "ringFingerRoot_group.rz";
connectAttr "ringFingerRoot_group_decMat.osx" "ringFingerRoot_group.sx";
connectAttr "ringFingerRoot_group_decMat.osy" "ringFingerRoot_group.sy";
connectAttr "ringFingerRoot_group_decMat.osz" "ringFingerRoot_group.sz";
connectAttr "ringFingerRoot_poser.lodv" "ringFingerRoot_group.v";
connectAttr "pairBlend1.or" "ringFingerRoot_clenchGroup.r";
connectAttr "unitConversion1444.o" "ringFingerRoot_group_2.ry";
connectAttr "ringFinger_1_group_decMat.otx" "ringFinger_1_group.tx";
connectAttr "ringFinger_1_group_decMat.oty" "ringFinger_1_group.ty";
connectAttr "ringFinger_1_group_decMat.otz" "ringFinger_1_group.tz";
connectAttr "ringFinger_1_group_decMat.orx" "ringFinger_1_group.rx";
connectAttr "ringFinger_1_group_decMat.ory" "ringFinger_1_group.ry";
connectAttr "ringFinger_1_group_decMat.orz" "ringFinger_1_group.rz";
connectAttr "ringFinger_1_group_decMat.osx" "ringFinger_1_group.sx";
connectAttr "ringFinger_1_group_decMat.osy" "ringFinger_1_group.sy";
connectAttr "ringFinger_1_group_decMat.osz" "ringFinger_1_group.sz";
connectAttr "unitConversion1435.o" "ringFinger_1_group_2.rz";
connectAttr "unitConversion1447.o" "ringFinger_1_group_2.ry";
connectAttr "ringFinger_2_group_decMat.otx" "ringFinger_2_group.tx";
connectAttr "ringFinger_2_group_decMat.oty" "ringFinger_2_group.ty";
connectAttr "ringFinger_2_group_decMat.otz" "ringFinger_2_group.tz";
connectAttr "ringFinger_2_group_decMat.orx" "ringFinger_2_group.rx";
connectAttr "ringFinger_2_group_decMat.ory" "ringFinger_2_group.ry";
connectAttr "ringFinger_2_group_decMat.orz" "ringFinger_2_group.rz";
connectAttr "ringFinger_2_group_decMat.osx" "ringFinger_2_group.sx";
connectAttr "ringFinger_2_group_decMat.osy" "ringFinger_2_group.sy";
connectAttr "ringFinger_2_group_decMat.osz" "ringFinger_2_group.sz";
connectAttr "unitConversion1436.o" "ringFinger_2_group_2.rz";
connectAttr "ringFinger_3_group_decMat.otx" "ringFinger_3_group.tx";
connectAttr "ringFinger_3_group_decMat.oty" "ringFinger_3_group.ty";
connectAttr "ringFinger_3_group_decMat.otz" "ringFinger_3_group.tz";
connectAttr "ringFinger_3_group_decMat.orx" "ringFinger_3_group.rx";
connectAttr "ringFinger_3_group_decMat.ory" "ringFinger_3_group.ry";
connectAttr "ringFinger_3_group_decMat.orz" "ringFinger_3_group.rz";
connectAttr "ringFinger_3_group_decMat.osx" "ringFinger_3_group.sx";
connectAttr "ringFinger_3_group_decMat.osy" "ringFinger_3_group.sy";
connectAttr "ringFinger_3_group_decMat.osz" "ringFinger_3_group.sz";
connectAttr "unitConversion1437.o" "ringFinger_3_group_2.rz";
connectAttr "pinkyFingerRoot_group_decMat.otx" "pinkyFingerRoot_group.tx";
connectAttr "pinkyFingerRoot_group_decMat.oty" "pinkyFingerRoot_group.ty";
connectAttr "pinkyFingerRoot_group_decMat.otz" "pinkyFingerRoot_group.tz";
connectAttr "pinkyFingerRoot_group_decMat.orx" "pinkyFingerRoot_group.rx";
connectAttr "pinkyFingerRoot_group_decMat.ory" "pinkyFingerRoot_group.ry";
connectAttr "pinkyFingerRoot_group_decMat.orz" "pinkyFingerRoot_group.rz";
connectAttr "pinkyFingerRoot_group_decMat.osx" "pinkyFingerRoot_group.sx";
connectAttr "pinkyFingerRoot_group_decMat.osy" "pinkyFingerRoot_group.sy";
connectAttr "pinkyFingerRoot_group_decMat.osz" "pinkyFingerRoot_group.sz";
connectAttr "pinkyFingerRoot_poser.lodv" "pinkyFingerRoot_group.v";
connectAttr "clench.r" "pinkyFingerRoot_clench.r";
connectAttr "unitConversion1445.o" "pinkyFingerRoot_group_2.ry";
connectAttr "pinkyFinger_1_group_decMat.otx" "pinkyFinger_1_group.tx";
connectAttr "pinkyFinger_1_group_decMat.oty" "pinkyFinger_1_group.ty";
connectAttr "pinkyFinger_1_group_decMat.otz" "pinkyFinger_1_group.tz";
connectAttr "pinkyFinger_1_group_decMat.orx" "pinkyFinger_1_group.rx";
connectAttr "pinkyFinger_1_group_decMat.ory" "pinkyFinger_1_group.ry";
connectAttr "pinkyFinger_1_group_decMat.orz" "pinkyFinger_1_group.rz";
connectAttr "pinkyFinger_1_group_decMat.osx" "pinkyFinger_1_group.sx";
connectAttr "pinkyFinger_1_group_decMat.osy" "pinkyFinger_1_group.sy";
connectAttr "pinkyFinger_1_group_decMat.osz" "pinkyFinger_1_group.sz";
connectAttr "unitConversion1438.o" "pinkyFinger_1_group_2.rz";
connectAttr "unitConversion1446.o" "pinkyFinger_1_group_2.ry";
connectAttr "pinkyFinger_2_group_decMat.otx" "pinkyFinger_2_group.tx";
connectAttr "pinkyFinger_2_group_decMat.oty" "pinkyFinger_2_group.ty";
connectAttr "pinkyFinger_2_group_decMat.otz" "pinkyFinger_2_group.tz";
connectAttr "pinkyFinger_2_group_decMat.orx" "pinkyFinger_2_group.rx";
connectAttr "pinkyFinger_2_group_decMat.ory" "pinkyFinger_2_group.ry";
connectAttr "pinkyFinger_2_group_decMat.orz" "pinkyFinger_2_group.rz";
connectAttr "pinkyFinger_2_group_decMat.osx" "pinkyFinger_2_group.sx";
connectAttr "pinkyFinger_2_group_decMat.osy" "pinkyFinger_2_group.sy";
connectAttr "pinkyFinger_2_group_decMat.osz" "pinkyFinger_2_group.sz";
connectAttr "unitConversion1439.o" "pinkyFinger_2_group_2.rz";
connectAttr "pinkyFinger_3_group_decMat.otx" "pinkyFinger_3_group.tx";
connectAttr "pinkyFinger_3_group_decMat.oty" "pinkyFinger_3_group.ty";
connectAttr "pinkyFinger_3_group_decMat.otz" "pinkyFinger_3_group.tz";
connectAttr "pinkyFinger_3_group_decMat.orx" "pinkyFinger_3_group.rx";
connectAttr "pinkyFinger_3_group_decMat.ory" "pinkyFinger_3_group.ry";
connectAttr "pinkyFinger_3_group_decMat.orz" "pinkyFinger_3_group.rz";
connectAttr "pinkyFinger_3_group_decMat.osx" "pinkyFinger_3_group.sx";
connectAttr "pinkyFinger_3_group_decMat.osy" "pinkyFinger_3_group.sy";
connectAttr "pinkyFinger_3_group_decMat.osz" "pinkyFinger_3_group.sz";
connectAttr "unitConversion1440.o" "pinkyFinger_3_group_2.rz";
connectAttr "makeNurbCircle1.oc" "fingersShape.cr";
connectAttr "root_connector.wm" "system.opm";
connectAttr "root_connector_decomposeMatrix.osx" "outJoints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "outJoints.sy";
connectAttr "multDoubleLinear1.o" "outJoints.sz";
connectAttr "root_outJoint_decMat.otx" "root_outJoint.tx";
connectAttr "root_outJoint_decMat.oty" "root_outJoint.ty";
connectAttr "root_outJoint_decMat.otz" "root_outJoint.tz";
connectAttr "root_outJoint_decMat.orx" "root_outJoint.rx";
connectAttr "root_outJoint_decMat.ory" "root_outJoint.ry";
connectAttr "root_outJoint_decMat.orz" "root_outJoint.rz";
connectAttr "root_outJoint.s" "thumbFinger_1_outJoint.is";
connectAttr "thumbFinger_1_outJoint_decMat.orx" "thumbFinger_1_outJoint.rx";
connectAttr "thumbFinger_1_outJoint_decMat.ory" "thumbFinger_1_outJoint.ry";
connectAttr "thumbFinger_1_outJoint_decMat.orz" "thumbFinger_1_outJoint.rz";
connectAttr "thumbFinger_1_outJoint_decMat.otx" "thumbFinger_1_outJoint.tx";
connectAttr "thumbFinger_1_outJoint_decMat.oty" "thumbFinger_1_outJoint.ty";
connectAttr "thumbFinger_1_outJoint_decMat.otz" "thumbFinger_1_outJoint.tz";
connectAttr "thumbFinger_2_outJoint_decMat.orx" "thumbFinger_2_outJoint.rx";
connectAttr "thumbFinger_2_outJoint_decMat.ory" "thumbFinger_2_outJoint.ry";
connectAttr "thumbFinger_2_outJoint_decMat.orz" "thumbFinger_2_outJoint.rz";
connectAttr "thumbFinger_2_outJoint_decMat.otx" "thumbFinger_2_outJoint.tx";
connectAttr "thumbFinger_2_outJoint_decMat.oty" "thumbFinger_2_outJoint.ty";
connectAttr "thumbFinger_2_outJoint_decMat.otz" "thumbFinger_2_outJoint.tz";
connectAttr "thumbFinger_1_outJoint.s" "thumbFinger_2_outJoint.is";
connectAttr "thumbFinger_3_outJoint_decMat.otx" "thumbFinger_3_outJoint.tx";
connectAttr "thumbFinger_3_outJoint_decMat.oty" "thumbFinger_3_outJoint.ty";
connectAttr "thumbFinger_3_outJoint_decMat.otz" "thumbFinger_3_outJoint.tz";
connectAttr "thumbFinger_3_outJoint_decMat.orx" "thumbFinger_3_outJoint.rx";
connectAttr "thumbFinger_3_outJoint_decMat.ory" "thumbFinger_3_outJoint.ry";
connectAttr "thumbFinger_3_outJoint_decMat.orz" "thumbFinger_3_outJoint.rz";
connectAttr "thumbFinger_2_outJoint.s" "thumbFinger_3_outJoint.is";
connectAttr "thumbFinger_3_outJoint.s" "thumbFinger_end_outJoint.is";
connectAttr "thumbFinger_end_outJoint_decMat.otx" "thumbFinger_end_outJoint.tx";
connectAttr "thumbFinger_end_outJoint_decMat.oty" "thumbFinger_end_outJoint.ty";
connectAttr "thumbFinger_end_outJoint_decMat.otz" "thumbFinger_end_outJoint.tz";
connectAttr "index_root_outJoint_decMat.orx" "index_root_outJoint.rx";
connectAttr "index_root_outJoint_decMat.ory" "index_root_outJoint.ry";
connectAttr "index_root_outJoint_decMat.orz" "index_root_outJoint.rz";
connectAttr "root_outJoint.s" "index_root_outJoint.is";
connectAttr "index_root_outJoint_decMat.otx" "index_root_outJoint.tx";
connectAttr "index_root_outJoint_decMat.oty" "index_root_outJoint.ty";
connectAttr "index_root_outJoint_decMat.otz" "index_root_outJoint.tz";
connectAttr "indexFinger_1_outJoint_decMat.orx" "indexFinger_1_outJoint.rx";
connectAttr "indexFinger_1_outJoint_decMat.ory" "indexFinger_1_outJoint.ry";
connectAttr "indexFinger_1_outJoint_decMat.orz" "indexFinger_1_outJoint.rz";
connectAttr "indexFinger_1_outJoint_decMat.otx" "indexFinger_1_outJoint.tx";
connectAttr "indexFinger_1_outJoint_decMat.oty" "indexFinger_1_outJoint.ty";
connectAttr "indexFinger_1_outJoint_decMat.otz" "indexFinger_1_outJoint.tz";
connectAttr "index_root_outJoint.s" "indexFinger_1_outJoint.is";
connectAttr "indexFinger_2_outJoint_decMat.otx" "indexFinger_2_outJoint.tx";
connectAttr "indexFinger_2_outJoint_decMat.oty" "indexFinger_2_outJoint.ty";
connectAttr "indexFinger_2_outJoint_decMat.otz" "indexFinger_2_outJoint.tz";
connectAttr "indexFinger_2_outJoint_decMat.orx" "indexFinger_2_outJoint.rx";
connectAttr "indexFinger_2_outJoint_decMat.ory" "indexFinger_2_outJoint.ry";
connectAttr "indexFinger_2_outJoint_decMat.orz" "indexFinger_2_outJoint.rz";
connectAttr "indexFinger_1_outJoint.s" "indexFinger_2_outJoint.is";
connectAttr "indexFinger_3_outJoint_decMat.otx" "indexFinger_3_outJoint.tx";
connectAttr "indexFinger_3_outJoint_decMat.oty" "indexFinger_3_outJoint.ty";
connectAttr "indexFinger_3_outJoint_decMat.otz" "indexFinger_3_outJoint.tz";
connectAttr "indexFinger_3_outJoint_decMat.orx" "indexFinger_3_outJoint.rx";
connectAttr "indexFinger_3_outJoint_decMat.ory" "indexFinger_3_outJoint.ry";
connectAttr "indexFinger_3_outJoint_decMat.orz" "indexFinger_3_outJoint.rz";
connectAttr "indexFinger_2_outJoint.s" "indexFinger_3_outJoint.is";
connectAttr "indexFinger_3_outJoint.s" "indexFinger_end_outJoint.is";
connectAttr "indexFinger_end_outJoint_decMat.otx" "indexFinger_end_outJoint.tx";
connectAttr "indexFinger_end_outJoint_decMat.oty" "indexFinger_end_outJoint.ty";
connectAttr "indexFinger_end_outJoint_decMat.otz" "indexFinger_end_outJoint.tz";
connectAttr "middle_rooit_outJoint_decMat.otx" "middle_root_outJoint.tx";
connectAttr "middle_rooit_outJoint_decMat.oty" "middle_root_outJoint.ty";
connectAttr "middle_rooit_outJoint_decMat.otz" "middle_root_outJoint.tz";
connectAttr "middle_pairBlend.or" "middle_root_outJoint.r";
connectAttr "root_outJoint.s" "middle_root_outJoint.is";
connectAttr "middleFinger_1_outJoint_decMat.orx" "middleFinger_1_outJoint.rx";
connectAttr "middleFinger_1_outJoint_decMat.ory" "middleFinger_1_outJoint.ry";
connectAttr "middleFinger_1_outJoint_decMat.orz" "middleFinger_1_outJoint.rz";
connectAttr "middleFinger_1_outJoint_decMat.otx" "middleFinger_1_outJoint.tx";
connectAttr "middleFinger_1_outJoint_decMat.oty" "middleFinger_1_outJoint.ty";
connectAttr "middleFinger_1_outJoint_decMat.otz" "middleFinger_1_outJoint.tz";
connectAttr "middle_root_outJoint.s" "middleFinger_1_outJoint.is";
connectAttr "middleFinger_1_outJoint.s" "middleFinger_2_outJoint.is";
connectAttr "middleFinger_2_outJoint_decMat.otx" "middleFinger_2_outJoint.tx";
connectAttr "middleFinger_2_outJoint_decMat.oty" "middleFinger_2_outJoint.ty";
connectAttr "middleFinger_2_outJoint_decMat.otz" "middleFinger_2_outJoint.tz";
connectAttr "middleFinger_2_outJoint_decMat.orx" "middleFinger_2_outJoint.rx";
connectAttr "middleFinger_2_outJoint_decMat.ory" "middleFinger_2_outJoint.ry";
connectAttr "middleFinger_2_outJoint_decMat.orz" "middleFinger_2_outJoint.rz";
connectAttr "middleFinger_3_outJoint_decMat.otx" "middleFinger_3_outJoint.tx";
connectAttr "middleFinger_3_outJoint_decMat.oty" "middleFinger_3_outJoint.ty";
connectAttr "middleFinger_3_outJoint_decMat.otz" "middleFinger_3_outJoint.tz";
connectAttr "middleFinger_3_outJoint_decMat.orx" "middleFinger_3_outJoint.rx";
connectAttr "middleFinger_3_outJoint_decMat.ory" "middleFinger_3_outJoint.ry";
connectAttr "middleFinger_3_outJoint_decMat.orz" "middleFinger_3_outJoint.rz";
connectAttr "middleFinger_2_outJoint.s" "middleFinger_3_outJoint.is";
connectAttr "middleFinger_3_outJoint.s" "middleFinger_end_outJoint.is";
connectAttr "middleFinger_end_outJoint_decMat.otx" "middleFinger_end_outJoint.tx"
		;
connectAttr "middleFinger_end_outJoint_decMat.oty" "middleFinger_end_outJoint.ty"
		;
connectAttr "middleFinger_end_outJoint_decMat.otz" "middleFinger_end_outJoint.tz"
		;
connectAttr "ring_pairBlend.or" "ring_root_outJoint.r";
connectAttr "ring_root_outJoint_decMat.otx" "ring_root_outJoint.tx";
connectAttr "ring_root_outJoint_decMat.oty" "ring_root_outJoint.ty";
connectAttr "ring_root_outJoint_decMat.otz" "ring_root_outJoint.tz";
connectAttr "root_outJoint.s" "ring_root_outJoint.is";
connectAttr "ringFinger_1_outJoint_decMat.orx" "ringFinger_1_outJoint.rx";
connectAttr "ringFinger_1_outJoint_decMat.ory" "ringFinger_1_outJoint.ry";
connectAttr "ringFinger_1_outJoint_decMat.orz" "ringFinger_1_outJoint.rz";
connectAttr "ringFinger_1_outJoint_decMat.otx" "ringFinger_1_outJoint.tx";
connectAttr "ringFinger_1_outJoint_decMat.oty" "ringFinger_1_outJoint.ty";
connectAttr "ringFinger_1_outJoint_decMat.otz" "ringFinger_1_outJoint.tz";
connectAttr "ring_root_outJoint.s" "ringFinger_1_outJoint.is";
connectAttr "ringFinger_1_outJoint.s" "ringFinger_2_outJoint.is";
connectAttr "ringFinger_2_outJoint_decMat.otx" "ringFinger_2_outJoint.tx";
connectAttr "ringFinger_2_outJoint_decMat.oty" "ringFinger_2_outJoint.ty";
connectAttr "ringFinger_2_outJoint_decMat.otz" "ringFinger_2_outJoint.tz";
connectAttr "ringFinger_2_outJoint_decMat.orx" "ringFinger_2_outJoint.rx";
connectAttr "ringFinger_2_outJoint_decMat.ory" "ringFinger_2_outJoint.ry";
connectAttr "ringFinger_2_outJoint_decMat.orz" "ringFinger_2_outJoint.rz";
connectAttr "ringFinger_2_outJoint.s" "ringFinger_3_outJoint.is";
connectAttr "ringFinger_3_outJoint_decMat.otx" "ringFinger_3_outJoint.tx";
connectAttr "ringFinger_3_outJoint_decMat.oty" "ringFinger_3_outJoint.ty";
connectAttr "ringFinger_3_outJoint_decMat.otz" "ringFinger_3_outJoint.tz";
connectAttr "ringFinger_3_outJoint_decMat.orx" "ringFinger_3_outJoint.rx";
connectAttr "ringFinger_3_outJoint_decMat.ory" "ringFinger_3_outJoint.ry";
connectAttr "ringFinger_3_outJoint_decMat.orz" "ringFinger_3_outJoint.rz";
connectAttr "ringFinger_3_outJoint.s" "ringFinger_end_outJoint.is";
connectAttr "ringFinger_end_outJoint_decMat.otx" "ringFinger_end_outJoint.tx";
connectAttr "ringFinger_end_outJoint_decMat.oty" "ringFinger_end_outJoint.ty";
connectAttr "ringFinger_end_outJoint_decMat.otz" "ringFinger_end_outJoint.tz";
connectAttr "pinky_root_outJoint_decMat1.or" "pinky_root_outJoint.r";
connectAttr "pinky_root_outJoint_decMat.otx" "pinky_root_outJoint.tx";
connectAttr "pinky_root_outJoint_decMat.oty" "pinky_root_outJoint.ty";
connectAttr "pinky_root_outJoint_decMat.otz" "pinky_root_outJoint.tz";
connectAttr "root_outJoint.s" "pinky_root_outJoint.is";
connectAttr "pinkyFinger_1_outJoint_decMat.orx" "pinkyFinger_1_outJoint.rx";
connectAttr "pinkyFinger_1_outJoint_decMat.ory" "pinkyFinger_1_outJoint.ry";
connectAttr "pinkyFinger_1_outJoint_decMat.orz" "pinkyFinger_1_outJoint.rz";
connectAttr "pinkyFinger_1_outJoint_decMat.otx" "pinkyFinger_1_outJoint.tx";
connectAttr "pinkyFinger_1_outJoint_decMat.oty" "pinkyFinger_1_outJoint.ty";
connectAttr "pinkyFinger_1_outJoint_decMat.otz" "pinkyFinger_1_outJoint.tz";
connectAttr "pinky_root_outJoint.s" "pinkyFinger_1_outJoint.is";
connectAttr "pinkyFinger_1_outJoint.s" "pinkyFinger_2_outJoint.is";
connectAttr "pinkyFinger_2_outJoint_decMat.otx" "pinkyFinger_2_outJoint.tx";
connectAttr "pinkyFinger_2_outJoint_decMat.oty" "pinkyFinger_2_outJoint.ty";
connectAttr "pinkyFinger_2_outJoint_decMat.otz" "pinkyFinger_2_outJoint.tz";
connectAttr "pinkyFinger_2_outJoint_decMat.orx" "pinkyFinger_2_outJoint.rx";
connectAttr "pinkyFinger_2_outJoint_decMat.ory" "pinkyFinger_2_outJoint.ry";
connectAttr "pinkyFinger_2_outJoint_decMat.orz" "pinkyFinger_2_outJoint.rz";
connectAttr "pinkyFinger_2_outJoint.s" "pinkyFinger_3_outJoint.is";
connectAttr "pinkyFinger_3_outJoint_decMat.otx" "pinkyFinger_3_outJoint.tx";
connectAttr "pinkyFinger_3_outJoint_decMat.oty" "pinkyFinger_3_outJoint.ty";
connectAttr "pinkyFinger_3_outJoint_decMat.otz" "pinkyFinger_3_outJoint.tz";
connectAttr "pinkyFinger_3_outJoint_decMat.orx" "pinkyFinger_3_outJoint.rx";
connectAttr "pinkyFinger_3_outJoint_decMat.ory" "pinkyFinger_3_outJoint.ry";
connectAttr "pinkyFinger_3_outJoint_decMat.orz" "pinkyFinger_3_outJoint.rz";
connectAttr "pinkyFinger_3_outJoint.s" "pinkyFinger_end_outJoint.is";
connectAttr "pinkyFinger_end_outJoint_decMat.otx" "pinkyFinger_end_outJoint.tx";
connectAttr "pinkyFinger_end_outJoint_decMat.oty" "pinkyFinger_end_outJoint.ty";
connectAttr "pinkyFinger_end_outJoint_decMat.otz" "pinkyFinger_end_outJoint.tz";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "root_connector.wm" "root_connector_decomposeMatrix.imat";
connectAttr "root_poser.wm" "decomposeMatrix236.imat";
connectAttr "ringFinger_1_skinJoint_multMat.o" "ringFinger_1_skinJoint_decMat.imat"
		;
connectAttr "ringFinger_1_outJoint.pim" "ringFinger_1_skinJoint_multMat.i[1]";
connectAttr "pinkyFinger_1_skinJoint_multMat.o" "pinkyFinger_1_skinJoint_decMat.imat"
		;
connectAttr "pinkyFinger_1_outJoint.pim" "pinkyFinger_1_skinJoint_multMat.i[1]";
connectAttr "thumbFinger_1.iog" "thumb_moduleControlSet.dsm" -na;
connectAttr "thumbFinger_2.iog" "thumb_moduleControlSet.dsm" -na;
connectAttr "thumbFinger_3.iog" "thumb_moduleControlSet.dsm" -na;
connectAttr "thumb_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "pinky_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ring_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "middle_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "index_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "clench.iog" "moduleControlSet.dsm" -na;
connectAttr "fingers.iog" "moduleControlSet.dsm" -na;
connectAttr "cluster4GroupId.msg" "cluster4Set.gn" -na;
connectAttr "mainPoserShape.iog.og[1]" "cluster4Set.dsm" -na;
connectAttr "mainPoser_clusterHandleCluster.msg" "cluster4Set.ub[0]";
connectAttr "cluster4GroupParts.og" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "cluster4GroupId.id" "mainPoser_clusterHandleCluster.ip[0].gi";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "tweak24.og[0]" "cluster4GroupParts.ig";
connectAttr "cluster4GroupId.id" "cluster4GroupParts.gi";
connectAttr "groupParts42.og" "tweak24.ip[0].ig";
connectAttr "groupId42.id" "tweak24.ip[0].gi";
connectAttr "groupId42.msg" "tweakSet24.gn" -na;
connectAttr "mainPoserShape.iog.og[2]" "tweakSet24.dsm" -na;
connectAttr "tweak24.msg" "tweakSet24.ub[0]";
connectAttr "mainPoserShapeOrig.ws" "groupParts42.ig";
connectAttr "groupId42.id" "groupParts42.gi";
connectAttr "thumbFinger_cluster4GroupId.msg" "thumbFinger_cluster4Set.gn" -na;
connectAttr "thumbFinger_mainPoserShape.iog.og[1]" "thumbFinger_cluster4Set.dsm"
		 -na;
connectAttr "thumbFinger_mainPoser_clusterHandleCluster.msg" "thumbFinger_cluster4Set.ub[0]"
		;
connectAttr "thumbFinger_cluster4GroupParts.og" "thumbFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "thumbFinger_cluster4GroupId.id" "thumbFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "thumbFinger_mainPoser_clusterHandle.wm" "thumbFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "thumbFinger_mainPoser_clusterHandleShape.x" "thumbFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "thumbFinger_tweak24.og[0]" "thumbFinger_cluster4GroupParts.ig";
connectAttr "thumbFinger_cluster4GroupId.id" "thumbFinger_cluster4GroupParts.gi"
		;
connectAttr "thumbFinger_groupParts42.og" "thumbFinger_tweak24.ip[0].ig";
connectAttr "thumbFinger_groupId42.id" "thumbFinger_tweak24.ip[0].gi";
connectAttr "thumbFinger_groupId42.msg" "thumbFinger_tweakSet24.gn" -na;
connectAttr "thumbFinger_mainPoserShape.iog.og[2]" "thumbFinger_tweakSet24.dsm" 
		-na;
connectAttr "thumbFinger_tweak24.msg" "thumbFinger_tweakSet24.ub[0]";
connectAttr "thumbFinger_mainPoserShapeOrig.ws" "thumbFinger_groupParts42.ig";
connectAttr "thumbFinger_groupId42.id" "thumbFinger_groupParts42.gi";
connectAttr "indexFinger_cluster4GroupId.msg" "indexFinger_cluster4Set.gn" -na;
connectAttr "indexFinger_mainPoserShape.iog.og[1]" "indexFinger_cluster4Set.dsm"
		 -na;
connectAttr "indexFinger_mainPoser_clusterHandleCluster.msg" "indexFinger_cluster4Set.ub[0]"
		;
connectAttr "indexFinger_cluster4GroupParts.og" "indexFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "indexFinger_cluster4GroupId.id" "indexFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "indexFinger_mainPoser_clusterHandle.wm" "indexFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "indexFinger_mainPoser_clusterHandleShape.x" "indexFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "indexFinger_tweak24.og[0]" "indexFinger_cluster4GroupParts.ig";
connectAttr "indexFinger_cluster4GroupId.id" "indexFinger_cluster4GroupParts.gi"
		;
connectAttr "indexFinger_groupParts42.og" "indexFinger_tweak24.ip[0].ig";
connectAttr "indexFinger_groupId42.id" "indexFinger_tweak24.ip[0].gi";
connectAttr "indexFinger_groupId42.msg" "indexFinger_tweakSet24.gn" -na;
connectAttr "indexFinger_mainPoserShape.iog.og[2]" "indexFinger_tweakSet24.dsm" 
		-na;
connectAttr "indexFinger_tweak24.msg" "indexFinger_tweakSet24.ub[0]";
connectAttr "indexFinger_mainPoserShapeOrig.ws" "indexFinger_groupParts42.ig";
connectAttr "indexFinger_groupId42.id" "indexFinger_groupParts42.gi";
connectAttr "middleFinger_cluster4GroupId.msg" "middleFinger_cluster4Set.gn" -na
		;
connectAttr "middleFinger_mainPoserShape.iog.og[1]" "middleFinger_cluster4Set.dsm"
		 -na;
connectAttr "middleFinger_mainPoser_clusterHandleCluster.msg" "middleFinger_cluster4Set.ub[0]"
		;
connectAttr "middleFinger_cluster4GroupParts.og" "middleFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "middleFinger_cluster4GroupId.id" "middleFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "middleFinger_mainPoser_clusterHandle.wm" "middleFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "middleFinger_mainPoser_clusterHandleShape.x" "middleFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "middleFinger_tweak24.og[0]" "middleFinger_cluster4GroupParts.ig";
connectAttr "middleFinger_cluster4GroupId.id" "middleFinger_cluster4GroupParts.gi"
		;
connectAttr "middleFinger_groupParts42.og" "middleFinger_tweak24.ip[0].ig";
connectAttr "middleFinger_groupId42.id" "middleFinger_tweak24.ip[0].gi";
connectAttr "middleFinger_groupId42.msg" "middleFinger_tweakSet24.gn" -na;
connectAttr "middleFinger_mainPoserShape.iog.og[2]" "middleFinger_tweakSet24.dsm"
		 -na;
connectAttr "middleFinger_tweak24.msg" "middleFinger_tweakSet24.ub[0]";
connectAttr "middleFinger_mainPoserShapeOrig.ws" "middleFinger_groupParts42.ig";
connectAttr "middleFinger_groupId42.id" "middleFinger_groupParts42.gi";
connectAttr "ringFinger_cluster4GroupId.msg" "ringFinger_cluster4Set.gn" -na;
connectAttr "ringFinger_mainPoserShape.iog.og[1]" "ringFinger_cluster4Set.dsm" -na
		;
connectAttr "ringFinger_mainPoser_clusterHandleCluster.msg" "ringFinger_cluster4Set.ub[0]"
		;
connectAttr "ringFinger_cluster4GroupParts.og" "ringFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "ringFinger_cluster4GroupId.id" "ringFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "ringFinger_mainPoser_clusterHandle.wm" "ringFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "ringFinger_mainPoser_clusterHandleShape.x" "ringFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "ringFinger_tweak24.og[0]" "ringFinger_cluster4GroupParts.ig";
connectAttr "ringFinger_cluster4GroupId.id" "ringFinger_cluster4GroupParts.gi";
connectAttr "ringFinger_groupParts42.og" "ringFinger_tweak24.ip[0].ig";
connectAttr "ringFinger_groupId42.id" "ringFinger_tweak24.ip[0].gi";
connectAttr "ringFinger_groupId42.msg" "ringFinger_tweakSet24.gn" -na;
connectAttr "ringFinger_mainPoserShape.iog.og[2]" "ringFinger_tweakSet24.dsm" -na
		;
connectAttr "ringFinger_tweak24.msg" "ringFinger_tweakSet24.ub[0]";
connectAttr "ringFinger_mainPoserShapeOrig.ws" "ringFinger_groupParts42.ig";
connectAttr "ringFinger_groupId42.id" "ringFinger_groupParts42.gi";
connectAttr "pinkyFinger_cluster4GroupId.msg" "pinkyFinger_cluster4Set.gn" -na;
connectAttr "pinkyFinger_mainPoserShape.iog.og[1]" "pinkyFinger_cluster4Set.dsm"
		 -na;
connectAttr "pinkyFinger_mainPoser_clusterHandleCluster.msg" "pinkyFinger_cluster4Set.ub[0]"
		;
connectAttr "pinkyFinger_cluster4GroupParts.og" "pinkyFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "pinkyFinger_cluster4GroupId.id" "pinkyFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "pinkyFinger_mainPoser_clusterHandle.wm" "pinkyFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "pinkyFinger_mainPoser_clusterHandleShape.x" "pinkyFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "pinkyFinger_tweak24.og[0]" "pinkyFinger_cluster4GroupParts.ig";
connectAttr "pinkyFinger_cluster4GroupId.id" "pinkyFinger_cluster4GroupParts.gi"
		;
connectAttr "pinkyFinger_groupParts42.og" "pinkyFinger_tweak24.ip[0].ig";
connectAttr "pinkyFinger_groupId42.id" "pinkyFinger_tweak24.ip[0].gi";
connectAttr "pinkyFinger_groupId42.msg" "pinkyFinger_tweakSet24.gn" -na;
connectAttr "pinkyFinger_mainPoserShape.iog.og[2]" "pinkyFinger_tweakSet24.dsm" 
		-na;
connectAttr "pinkyFinger_tweak24.msg" "pinkyFinger_tweakSet24.ub[0]";
connectAttr "pinkyFinger_mainPoserShapeOrig.ws" "pinkyFinger_groupParts42.ig";
connectAttr "pinkyFinger_groupId42.id" "pinkyFinger_groupParts42.gi";
connectAttr "thumbFinger_1_group_multMat.o" "thumbFinger_1_group_decMat.imat";
connectAttr "thumbFingerA_poserOrient.wm" "thumbFinger_1_group_multMat.i[0]";
connectAttr "root_poser.wim" "thumbFinger_1_group_multMat.i[1]";
connectAttr "thumbFinger_2_offset_multMat.o" "thumbFinger_2_offset_decMat.imat";
connectAttr "thumbFingerB_poserOrient.wm" "thumbFinger_2_offset_multMat.i[0]";
connectAttr "thumbFingerA_poserOrient.wim" "thumbFinger_2_offset_multMat.i[1]";
connectAttr "thumbFinger_3_offset_multMat.o" "thumbFinger_3_offset_decMat.imat";
connectAttr "thumbFingerC_poserOrient.wm" "thumbFinger_3_offset_multMat.i[0]";
connectAttr "thumbFingerB_poserOrient.wim" "thumbFinger_3_offset_multMat.i[1]";
connectAttr "indexFingerRoot_group_multMat.o" "indexFingerRoot_group_decMat.imat"
		;
connectAttr "indexFingerRoot_poserOrient.wm" "indexFingerRoot_group_multMat.i[0]"
		;
connectAttr "root_poser.wim" "indexFingerRoot_group_multMat.i[1]";
connectAttr "indexFinger_1_group_multMat.o" "indexFinger_1_group_decMat.imat";
connectAttr "indexFingerA_poserOrient.wm" "indexFinger_1_group_multMat.i[0]";
connectAttr "indexFingerRoot_poserOrient.wim" "indexFinger_1_group_multMat.i[1]"
		;
connectAttr "indexFinger_2_group_multMat.o" "indexFinger_2_group_decMat.imat";
connectAttr "indexFingerB_poserOrient.wm" "indexFinger_2_group_multMat.i[0]";
connectAttr "indexFingerA_poserOrient.wim" "indexFinger_2_group_multMat.i[1]";
connectAttr "indexFinger_3_group_multMat.o" "indexFinger_3_group_decMat.imat";
connectAttr "indexFingerC_poserOrient.wm" "indexFinger_3_group_multMat.i[0]";
connectAttr "indexFingerB_poserOrient.wim" "indexFinger_3_group_multMat.i[1]";
connectAttr "middleFingerRoot_group_multMat.o" "middleFingerRoot_group_decMat.imat"
		;
connectAttr "middleFingerRoot_poserOrient.wm" "middleFingerRoot_group_multMat.i[0]"
		;
connectAttr "root_poser.wim" "middleFingerRoot_group_multMat.i[1]";
connectAttr "middleFinger_1_group_multMat.o" "middleFinger_1_group_decMat.imat";
connectAttr "middleFingerA_poserOrient.wm" "middleFinger_1_group_multMat.i[0]";
connectAttr "middleFingerRoot_poserOrient.wim" "middleFinger_1_group_multMat.i[1]"
		;
connectAttr "middleFinger_2_group_multMat.o" "middleFinger_2_group_decMat.imat";
connectAttr "middleFingerB_poserOrient.wm" "middleFinger_2_group_multMat.i[0]";
connectAttr "middleFingerA_poserOrient.wim" "middleFinger_2_group_multMat.i[1]";
connectAttr "middleFinger_3_group_multMat.o" "middleFinger_3_group_decMat.imat";
connectAttr "middleFingerC_poserOrient.wm" "middleFinger_3_group_multMat.i[0]";
connectAttr "middleFingerB_poserOrient.wim" "middleFinger_3_group_multMat.i[1]";
connectAttr "ringFingerRoot_group_multMat.o" "ringFingerRoot_group_decMat.imat";
connectAttr "ringFingerRoot_poserOrient.wm" "ringFingerRoot_group_multMat.i[0]";
connectAttr "root_poser.wim" "ringFingerRoot_group_multMat.i[1]";
connectAttr "ringFinger_1_group_multMat.o" "ringFinger_1_group_decMat.imat";
connectAttr "ringFingerA_poserOrient.wm" "ringFinger_1_group_multMat.i[0]";
connectAttr "ringFingerRoot_poserOrient.wim" "ringFinger_1_group_multMat.i[1]";
connectAttr "ringFinger_2_group_multMat.o" "ringFinger_2_group_decMat.imat";
connectAttr "ringFingerB_poserOrient.wm" "ringFinger_2_group_multMat.i[0]";
connectAttr "ringFingerA_poserOrient.wim" "ringFinger_2_group_multMat.i[1]";
connectAttr "ringFinger_3_group_multMat.o" "ringFinger_3_group_decMat.imat";
connectAttr "ringFingerC_poserOrient.wm" "ringFinger_3_group_multMat.i[0]";
connectAttr "ringFingerB_poserOrient.wim" "ringFinger_3_group_multMat.i[1]";
connectAttr "pinkyFingerRoot_group_multMat.o" "pinkyFingerRoot_group_decMat.imat"
		;
connectAttr "pinkyFingerRoot_poserOrient.wm" "pinkyFingerRoot_group_multMat.i[0]"
		;
connectAttr "root_poser.wim" "pinkyFingerRoot_group_multMat.i[1]";
connectAttr "pinkyFinger_1_group_multMat.o" "pinkyFinger_1_group_decMat.imat";
connectAttr "pinkyFingerA_poserOrient.wm" "pinkyFinger_1_group_multMat.i[0]";
connectAttr "pinkyFingerRoot_poserOrient.wim" "pinkyFinger_1_group_multMat.i[1]"
		;
connectAttr "pinkyFinger_2_group_multMat.o" "pinkyFinger_2_group_decMat.imat";
connectAttr "pinkyFingerB_poserOrient.wm" "pinkyFinger_2_group_multMat.i[0]";
connectAttr "pinkyFingerA_poserOrient.wim" "pinkyFinger_2_group_multMat.i[1]";
connectAttr "pinkyFinger_3_group_multMat.o" "pinkyFinger_3_group_decMat.imat";
connectAttr "pinkyFingerC_poserOrient.wm" "pinkyFinger_3_group_multMat.i[0]";
connectAttr "pinkyFingerB_poserOrient.wim" "pinkyFinger_3_group_multMat.i[1]";
connectAttr "thumbFinger_1_outJoint_multMat.o" "thumbFinger_1_outJoint_decMat.imat"
		;
connectAttr "thumbFinger_1.m" "thumbFinger_1_outJoint_multMat.i[0]";
connectAttr "thumbFinger_1_group_2.m" "thumbFinger_1_outJoint_multMat.i[1]";
connectAttr "thumbFinger_1_group.m" "thumbFinger_1_outJoint_multMat.i[2]";
connectAttr "composeMatrix1.omat" "thumbFinger_1_outJoint_multMat.i[3]";
connectAttr "thumbFinger_2_outJoint_multMat.o" "thumbFinger_2_outJoint_decMat.imat"
		;
connectAttr "thumbFinger_2.m" "thumbFinger_2_outJoint_multMat.i[0]";
connectAttr "thumbFinger_2_group_2.m" "thumbFinger_2_outJoint_multMat.i[1]";
connectAttr "thumbFinger_2_group.m" "thumbFinger_2_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "thumbFinger_2_outJoint_multMat.i[3]";
connectAttr "thumbFinger_3_outJoint_multMat.o" "thumbFinger_3_outJoint_decMat.imat"
		;
connectAttr "thumbFinger_3.m" "thumbFinger_3_outJoint_multMat.i[0]";
connectAttr "thumbFinger_3_group_2.m" "thumbFinger_3_outJoint_multMat.i[1]";
connectAttr "thumbFinger_3_group.m" "thumbFinger_3_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "thumbFinger_3_outJoint_multMat.i[3]";
connectAttr "index_root_outJoint_multMat.o" "index_root_outJoint_decMat.imat";
connectAttr "indexFingerRoot.m" "index_root_outJoint_multMat.i[0]";
connectAttr "indexFingerRoot_group_2.m" "index_root_outJoint_multMat.i[1]";
connectAttr "indexFingerRoot_group.m" "index_root_outJoint_multMat.i[2]";
connectAttr "composeMatrix1.omat" "index_root_outJoint_multMat.i[3]";
connectAttr "indexFinger_1_outJoint_multMat.o" "indexFinger_1_outJoint_decMat.imat"
		;
connectAttr "indexFinger_1.m" "indexFinger_1_outJoint_multMat.i[0]";
connectAttr "indexFinger_1_group_2.m" "indexFinger_1_outJoint_multMat.i[1]";
connectAttr "indexFinger_1_group.m" "indexFinger_1_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "indexFinger_1_outJoint_multMat.i[3]";
connectAttr "indexFinger_2_outJoint_multMat.o" "indexFinger_2_outJoint_decMat.imat"
		;
connectAttr "indexFinger_2.m" "indexFinger_2_outJoint_multMat.i[0]";
connectAttr "indexFinger_2_group_2.m" "indexFinger_2_outJoint_multMat.i[1]";
connectAttr "indexFinger_2_group.m" "indexFinger_2_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "indexFinger_2_outJoint_multMat.i[3]";
connectAttr "indexFinger_3_outJoint_multMat.o" "indexFinger_3_outJoint_decMat.imat"
		;
connectAttr "indexFinger_3.m" "indexFinger_3_outJoint_multMat.i[0]";
connectAttr "indexFinger_3_group_2.m" "indexFinger_3_outJoint_multMat.i[1]";
connectAttr "indexFinger_3_group.m" "indexFinger_3_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "indexFinger_3_outJoint_multMat.i[3]";
connectAttr "middle_rooit_outJoint_multMat.o" "middle_rooit_outJoint_decMat.imat"
		;
connectAttr "middleFingerRoot.m" "middle_rooit_outJoint_multMat.i[0]";
connectAttr "middleFingerRoot_clenchGroup.m" "middle_rooit_outJoint_multMat.i[1]"
		;
connectAttr "middleFingerRoot_group_2.m" "middle_rooit_outJoint_multMat.i[2]";
connectAttr "middleFingerRoot_group.m" "middle_rooit_outJoint_multMat.i[3]";
connectAttr "composeMatrix1.omat" "middle_rooit_outJoint_multMat.i[4]";
connectAttr "middleFinger_1_outJoint_multMat.o" "middleFinger_1_outJoint_decMat.imat"
		;
connectAttr "middleFinger_1.m" "middleFinger_1_outJoint_multMat.i[0]";
connectAttr "middleFinger_1_group_2.m" "middleFinger_1_outJoint_multMat.i[1]";
connectAttr "middleFinger_1_group.m" "middleFinger_1_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "middleFinger_1_outJoint_multMat.i[3]";
connectAttr "middleFinger_2_outJoint_multMat.o" "middleFinger_2_outJoint_decMat.imat"
		;
connectAttr "middleFinger_2.m" "middleFinger_2_outJoint_multMat.i[0]";
connectAttr "middleFinger_2_group_2.m" "middleFinger_2_outJoint_multMat.i[1]";
connectAttr "middleFinger_2_group.m" "middleFinger_2_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "middleFinger_2_outJoint_multMat.i[3]";
connectAttr "middleFinger_3_outJoint_multMat.o" "middleFinger_3_outJoint_decMat.imat"
		;
connectAttr "middleFinger_3.m" "middleFinger_3_outJoint_multMat.i[0]";
connectAttr "middleFinger_3_group_2.m" "middleFinger_3_outJoint_multMat.i[1]";
connectAttr "middleFinger_3_group.m" "middleFinger_3_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "middleFinger_3_outJoint_multMat.i[3]";
connectAttr "ring_root_outJoint_multMat.o" "ring_root_outJoint_decMat.imat";
connectAttr "ringFingerRoot.m" "ring_root_outJoint_multMat.i[0]";
connectAttr "ringFingerRoot_group_2.m" "ring_root_outJoint_multMat.i[1]";
connectAttr "ringFingerRoot_clenchGroup.m" "ring_root_outJoint_multMat.i[2]";
connectAttr "ringFingerRoot_group.m" "ring_root_outJoint_multMat.i[3]";
connectAttr "composeMatrix1.omat" "ring_root_outJoint_multMat.i[4]";
connectAttr "ringFinger_1_outJoint_multMat.o" "ringFinger_1_outJoint_decMat.imat"
		;
connectAttr "ringFinger_1.m" "ringFinger_1_outJoint_multMat.i[0]";
connectAttr "ringFinger_1_group_2.m" "ringFinger_1_outJoint_multMat.i[1]";
connectAttr "ringFinger_1_group.m" "ringFinger_1_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "ringFinger_1_outJoint_multMat.i[3]";
connectAttr "ringFinger_2_outJoint_multMat.o" "ringFinger_2_outJoint_decMat.imat"
		;
connectAttr "ringFinger_2.m" "ringFinger_2_outJoint_multMat.i[0]";
connectAttr "ringFinger_2_group_2.m" "ringFinger_2_outJoint_multMat.i[1]";
connectAttr "ringFinger_2_group.m" "ringFinger_2_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "ringFinger_2_outJoint_multMat.i[3]";
connectAttr "ringFinger_3_outJoint_multMat.o" "ringFinger_3_outJoint_decMat.imat"
		;
connectAttr "ringFinger_3.m" "ringFinger_3_outJoint_multMat.i[0]";
connectAttr "ringFinger_3_group_2.m" "ringFinger_3_outJoint_multMat.i[1]";
connectAttr "ringFinger_3_group.m" "ringFinger_3_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "ringFinger_3_outJoint_multMat.i[3]";
connectAttr "pinky_root_outJoint_multMat.o" "pinky_root_outJoint_decMat.imat";
connectAttr "pinkyFingerRoot.m" "pinky_root_outJoint_multMat.i[0]";
connectAttr "pinkyFingerRoot_group_2.m" "pinky_root_outJoint_multMat.i[1]";
connectAttr "pinkyFingerRoot_clench.m" "pinky_root_outJoint_multMat.i[2]";
connectAttr "pinkyFingerRoot_group.m" "pinky_root_outJoint_multMat.i[3]";
connectAttr "composeMatrix1.omat" "pinky_root_outJoint_multMat.i[4]";
connectAttr "pinkyFinger_1_outJoint_multMat.o" "pinkyFinger_1_outJoint_decMat.imat"
		;
connectAttr "pinkyFinger_1.m" "pinkyFinger_1_outJoint_multMat.i[0]";
connectAttr "pinkyFinger_1_group_2.m" "pinkyFinger_1_outJoint_multMat.i[1]";
connectAttr "pinkyFinger_1_group.m" "pinkyFinger_1_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "pinkyFinger_1_outJoint_multMat.i[3]";
connectAttr "pinkyFinger_2_outJoint_multMat.o" "pinkyFinger_2_outJoint_decMat.imat"
		;
connectAttr "pinkyFinger_2.m" "pinkyFinger_2_outJoint_multMat.i[0]";
connectAttr "pinkyFinger_2_group_3.m" "pinkyFinger_2_outJoint_multMat.i[1]";
connectAttr "pinkyFinger_2_group_2.m" "pinkyFinger_2_outJoint_multMat.i[2]";
connectAttr "pinkyFinger_2_group.m" "pinkyFinger_2_outJoint_multMat.i[3]";
connectAttr "composeMatrix2.omat" "pinkyFinger_2_outJoint_multMat.i[4]";
connectAttr "pinkyFinger_3_outJoint_multMat.o" "pinkyFinger_3_outJoint_decMat.imat"
		;
connectAttr "pinkyFinger_3.m" "pinkyFinger_3_outJoint_multMat.i[0]";
connectAttr "pinkyFinger_3_group_2.m" "pinkyFinger_3_outJoint_multMat.i[1]";
connectAttr "pinkyFinger_3_group.m" "pinkyFinger_3_outJoint_multMat.i[2]";
connectAttr "composeMatrix2.omat" "pinkyFinger_3_outJoint_multMat.i[3]";
connectAttr "thumbFinger_end_outJoint_multMat.o" "thumbFinger_end_outJoint_decMat.imat"
		;
connectAttr "thumbFingerD_poser.wm" "thumbFinger_end_outJoint_multMat.i[0]";
connectAttr "thumbFingerC_poserOrient.wim" "thumbFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "indexFinger_end_outJoint_multMat.o" "indexFinger_end_outJoint_decMat.imat"
		;
connectAttr "indexFingerD_poser.wm" "indexFinger_end_outJoint_multMat.i[0]";
connectAttr "indexFingerC_poserOrient.wim" "indexFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "middleFinger_end_outJoint_multMat.o" "middleFinger_end_outJoint_decMat.imat"
		;
connectAttr "middleFingerD_poser.wm" "middleFinger_end_outJoint_multMat.i[0]";
connectAttr "middleFingerC_poserOrient.wim" "middleFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "ringFinger_end_outJoint_multMat.o" "ringFinger_end_outJoint_decMat.imat"
		;
connectAttr "ringFingerD_poser.wm" "ringFinger_end_outJoint_multMat.i[0]";
connectAttr "ringFingerC_poserOrient.wim" "ringFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "pinkyFinger_end_outJoint_multMat.o" "pinkyFinger_end_outJoint_decMat.imat"
		;
connectAttr "pinkyFingerD_poser.wm" "pinkyFinger_end_outJoint_multMat.i[0]";
connectAttr "pinkyFingerC_poserOrient.wim" "pinkyFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "indexFinger_1.iog" "index_moduleControlSet.dsm" -na;
connectAttr "indexFinger_2.iog" "index_moduleControlSet.dsm" -na;
connectAttr "indexFinger_3.iog" "index_moduleControlSet.dsm" -na;
connectAttr "indexFingerRoot.iog" "index_moduleControlSet.dsm" -na;
connectAttr "middleFingerRoot.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "middleFinger_1.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "middleFinger_2.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "middleFinger_3.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "ringFingerRoot.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "ringFinger_1.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "ringFinger_2.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "ringFinger_3.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "pinkyFingerRoot.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_1.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_2.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_3.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "clench.r" "pairBlend1.ir2";
connectAttr "clench.r" "pairBlend2.ir2";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "root_connector_decomposeMatrix.osz" "multDoubleLinear1.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear1.i2";
connectAttr "root_outJoint_multMat.o" "root_outJoint_decMat.imat";
connectAttr "composeMatrix1.omat" "root_outJoint_multMat.i[0]";
connectAttr "root_connector.wm" "root_outJoint_multMat.i[1]";
connectAttr "root_outJoint.pim" "root_outJoint_multMat.i[2]";
connectAttr "mirror_condition.ocr" "composeMatrix1.isx";
connectAttr "mirror_condition.ocr" "composeMatrix2.isz";
connectAttr "ring_root_outJoint_decMat.or" "ring_pairBlend.ir1";
connectAttr "ring_root_outJoint_decMat1.or" "ring_pairBlend.ir2";
connectAttr "ringFingerRoot.m" "ring_root_outJoint_multMat1.i[0]";
connectAttr "ringFingerRoot_group_2.m" "ring_root_outJoint_multMat1.i[1]";
connectAttr "ringFingerRoot_clenchGroup.m" "ring_root_outJoint_multMat1.i[2]";
connectAttr "ringFingerRoot_group.m" "ring_root_outJoint_multMat1.i[3]";
connectAttr "composeMatrix1.omat" "ring_root_outJoint_multMat1.i[4]";
connectAttr "ring_root_outJoint_multMat1.o" "ring_root_outJoint_decMat1.imat";
connectAttr "middle_rooit_outJoint_decMat.or" "middle_pairBlend.ir1";
connectAttr "middle_rooit_outJoint_decMat1.or" "middle_pairBlend.ir2";
connectAttr "middleFingerRoot.m" "middle_rooit_outJoint_multMat1.i[0]";
connectAttr "middleFingerRoot_clenchGroup.m" "middle_rooit_outJoint_multMat1.i[1]"
		;
connectAttr "middleFingerRoot_group_2.m" "middle_rooit_outJoint_multMat1.i[2]";
connectAttr "middleFingerRoot_group.m" "middle_rooit_outJoint_multMat1.i[3]";
connectAttr "composeMatrix1.omat" "middle_rooit_outJoint_multMat1.i[4]";
connectAttr "middle_rooit_outJoint_multMat1.o" "middle_rooit_outJoint_decMat1.imat"
		;
connectAttr "pinkyFingerRoot.m" "pinky_root_outJoint_multMat1.i[0]";
connectAttr "pinkyFingerRoot_group_2.m" "pinky_root_outJoint_multMat1.i[1]";
connectAttr "pinkyFingerRoot_clench.m" "pinky_root_outJoint_multMat1.i[2]";
connectAttr "pinkyFingerRoot_group.m" "pinky_root_outJoint_multMat1.i[3]";
connectAttr "composeMatrix1.omat" "pinky_root_outJoint_multMat1.i[4]";
connectAttr "pinky_root_outJoint_multMat1.o" "pinky_root_outJoint_decMat1.imat";
connectAttr "fingers.thumb" "multDoubleLinear2.i1";
connectAttr "fingers.thumbMult1" "multDoubleLinear2.i2";
connectAttr "multDoubleLinear2.o" "unitConversion1426.i";
connectAttr "fingers.thumb" "multDoubleLinear3.i1";
connectAttr "fingers.thumbMult2" "multDoubleLinear3.i2";
connectAttr "fingers.thumb" "multDoubleLinear4.i1";
connectAttr "fingers.thumbMult3" "multDoubleLinear4.i2";
connectAttr "multDoubleLinear3.o" "unitConversion1427.i";
connectAttr "multDoubleLinear4.o" "unitConversion1428.i";
connectAttr "fingers.index" "multDoubleLinear5.i1";
connectAttr "fingers.indexMult3" "multDoubleLinear5.i2";
connectAttr "fingers.index" "multDoubleLinear6.i1";
connectAttr "fingers.indexMult1" "multDoubleLinear6.i2";
connectAttr "fingers.index" "multDoubleLinear7.i1";
connectAttr "fingers.indexMult2" "multDoubleLinear7.i2";
connectAttr "multDoubleLinear6.o" "unitConversion1429.i";
connectAttr "multDoubleLinear7.o" "unitConversion1430.i";
connectAttr "multDoubleLinear5.o" "unitConversion1431.i";
connectAttr "fingers.middle" "multDoubleLinear8.i1";
connectAttr "fingers.middleMult2" "multDoubleLinear8.i2";
connectAttr "fingers.middle" "multDoubleLinear9.i1";
connectAttr "fingers.middleMult3" "multDoubleLinear9.i2";
connectAttr "fingers.middle" "multDoubleLinear10.i1";
connectAttr "fingers.middleMult1" "multDoubleLinear10.i2";
connectAttr "multDoubleLinear10.o" "unitConversion1432.i";
connectAttr "multDoubleLinear8.o" "unitConversion1433.i";
connectAttr "multDoubleLinear9.o" "unitConversion1434.i";
connectAttr "fingers.ring" "multDoubleLinear11.i1";
connectAttr "fingers.ringMult2" "multDoubleLinear11.i2";
connectAttr "fingers.ring" "multDoubleLinear12.i1";
connectAttr "fingers.ringMult3" "multDoubleLinear12.i2";
connectAttr "fingers.ring" "multDoubleLinear13.i1";
connectAttr "fingers.ringMult1" "multDoubleLinear13.i2";
connectAttr "multDoubleLinear13.o" "unitConversion1435.i";
connectAttr "multDoubleLinear11.o" "unitConversion1436.i";
connectAttr "multDoubleLinear12.o" "unitConversion1437.i";
connectAttr "fingers.pinky" "multDoubleLinear14.i1";
connectAttr "fingers.pinkyMult3" "multDoubleLinear14.i2";
connectAttr "fingers.pinky" "multDoubleLinear15.i1";
connectAttr "fingers.pinkyMult1" "multDoubleLinear15.i2";
connectAttr "fingers.pinky" "multDoubleLinear16.i1";
connectAttr "fingers.pinkyMult2" "multDoubleLinear16.i2";
connectAttr "multDoubleLinear15.o" "unitConversion1438.i";
connectAttr "multDoubleLinear16.o" "unitConversion1439.i";
connectAttr "multDoubleLinear14.o" "unitConversion1440.i";
connectAttr "fingers.spread" "multDoubleLinear17.i1";
connectAttr "fingers.spreadThumbMult" "multDoubleLinear17.i2";
connectAttr "multDoubleLinear17.o" "unitConversion1441.i";
connectAttr "fingers.spread" "multDoubleLinear18.i1";
connectAttr "fingers.spreadIndexRootMult" "multDoubleLinear18.i2";
connectAttr "multDoubleLinear18.o" "unitConversion1442.i";
connectAttr "fingers.spread" "multDoubleLinear19.i1";
connectAttr "fingers.spreadMiddleRootMult" "multDoubleLinear19.i2";
connectAttr "multDoubleLinear19.o" "unitConversion1443.i";
connectAttr "fingers.spread" "multDoubleLinear20.i1";
connectAttr "fingers.spreadRingRootMult" "multDoubleLinear20.i2";
connectAttr "multDoubleLinear20.o" "unitConversion1444.i";
connectAttr "fingers.spread" "multDoubleLinear21.i1";
connectAttr "fingers.spreadPinkyRootMult" "multDoubleLinear21.i2";
connectAttr "multDoubleLinear21.o" "unitConversion1445.i";
connectAttr "fingers.spread" "multDoubleLinear22.i1";
connectAttr "fingers.spreadPinkyMult" "multDoubleLinear22.i2";
connectAttr "multDoubleLinear22.o" "unitConversion1446.i";
connectAttr "fingers.spread" "multDoubleLinear23.i1";
connectAttr "fingers.spreadRingMult" "multDoubleLinear23.i2";
connectAttr "multDoubleLinear23.o" "unitConversion1447.i";
connectAttr "fingers.spread" "multDoubleLinear24.i1";
connectAttr "fingers.spreadMiddleMult" "multDoubleLinear24.i2";
connectAttr "multDoubleLinear24.o" "unitConversion1448.i";
connectAttr "fingers.spread" "multDoubleLinear25.i1";
connectAttr "fingers.spreadIndexMult" "multDoubleLinear25.i2";
connectAttr "multDoubleLinear25.o" "unitConversion1449.i";
connectAttr "multiplyDivide1.ox" "makeNurbSphere1.r";
connectAttr "pinkyFingerRoot_poser.size" "multiplyDivide1.i1x";
connectAttr "thumbFingerA_poser.size" "multiplyDivide1.i1y";
connectAttr "thumbFingerB_poser.size" "multiplyDivide1.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide1.i2x";
connectAttr "mainPoser.globalSize" "multiplyDivide1.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide1.i2z";
connectAttr "multiplyDivide1.oy" "makeNurbSphere2.r";
connectAttr "multiplyDivide2.ox" "makeNurbSphere3.r";
connectAttr "multiplyDivide1.oz" "makeNurbSphere4.r";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1z";
connectAttr "thumbFingerC_poser.size" "multiplyDivide2.i2x";
connectAttr "thumbFingerD_poser.size" "multiplyDivide2.i2y";
connectAttr "multiplyDivide2.oy" "makeNurbSphere5.r";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1z";
connectAttr "indexFingerRoot_poser.size" "multiplyDivide3.i2x";
connectAttr "middleFingerRoot_poser.size" "multiplyDivide3.i2y";
connectAttr "ringFingerRoot_poser.size" "multiplyDivide3.i2z";
connectAttr "multiplyDivide3.ox" "makeNurbSphere6.r";
connectAttr "multiplyDivide3.oy" "makeNurbSphere7.r";
connectAttr "multiplyDivide3.oz" "makeNurbSphere8.r";
connectAttr "multiplyDivide4.ox" "makeNurbSphere9.r";
connectAttr "multiplyDivide5.ox" "makeNurbSphere10.r";
connectAttr "multiplyDivide4.oz" "makeNurbSphere11.r";
connectAttr "multiplyDivide4.oy" "makeNurbSphere12.r";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1z";
connectAttr "indexFingerA_poser.size" "multiplyDivide4.i2x";
connectAttr "indexFingerB_poser.size" "multiplyDivide4.i2y";
connectAttr "indexFingerC_poser.size" "multiplyDivide4.i2z";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i1z";
connectAttr "indexFingerD_poser.size" "multiplyDivide5.i2x";
connectAttr "middleFingerA_poser.size" "multiplyDivide5.i2y";
connectAttr "middleFingerB_poser.size" "multiplyDivide5.i2z";
connectAttr "multiplyDivide5.oy" "makeNurbSphere13.r";
connectAttr "multiplyDivide5.oz" "makeNurbSphere14.r";
connectAttr "multiplyDivide6.ox" "makeNurbSphere15.r";
connectAttr "multiplyDivide6.oy" "makeNurbSphere16.r";
connectAttr "mainPoser.globalSize" "multiplyDivide6.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide6.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide6.i1z";
connectAttr "middleFingerC_poser.size" "multiplyDivide6.i2x";
connectAttr "middleFingerD_poser.size" "multiplyDivide6.i2y";
connectAttr "ringFingerA_poser.size" "multiplyDivide6.i2z";
connectAttr "multiplyDivide6.oz" "makeNurbSphere17.r";
connectAttr "multiplyDivide7.oz" "makeNurbSphere18.r";
connectAttr "multiplyDivide7.oy" "makeNurbSphere19.r";
connectAttr "multiplyDivide7.ox" "makeNurbSphere20.r";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1z";
connectAttr "ringFingerB_poser.size" "multiplyDivide7.i2x";
connectAttr "ringFingerC_poser.size" "multiplyDivide7.i2y";
connectAttr "ringFingerD_poser.size" "multiplyDivide7.i2z";
connectAttr "multiplyDivide8.ox" "makeNurbSphere21.r";
connectAttr "multiplyDivide9.oz" "makeNurbSphere22.r";
connectAttr "multiplyDivide9.ox" "makeNurbSphere23.r";
connectAttr "multiplyDivide9.oy" "makeNurbSphere24.r";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1z";
connectAttr "pinkyFingerD_poser.size" "multiplyDivide8.i2x";
connectAttr "root_poser.size" "multiplyDivide8.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1z";
connectAttr "pinkyFingerA_poser.size" "multiplyDivide9.i2x";
connectAttr "pinkyFingerB_poser.size" "multiplyDivide9.i2y";
connectAttr "pinkyFingerC_poser.size" "multiplyDivide9.i2z";
connectAttr "multiplyDivide8.oy" "makeNurbSphere25.r";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "mainPoser_decomposeMatrix.osx" "multDoubleLinear26.i1";
connectAttr "mainPoser.lineSize" "multDoubleLinear26.i2";
connectAttr "thumbFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[0]"
		;
connectAttr "indexFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[1]"
		;
connectAttr "middleFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[2]"
		;
connectAttr "ringFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[3]"
		;
connectAttr "pinkyFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[4]"
		;
connectAttr "multDoubleLinear26.o" "sweepMeshCreator2.scaleProfileX";
connectAttr "indexFinger_posers_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "thumbFingerB_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "middleFingerD_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "pinkyFingerRoot_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "middleFinger_posers_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "multDoubleLinear26.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "ringFinger_posers_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "mainPoser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "pinkyFingerB_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "indexFingerRoot_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "ringFingerC_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "pinkyFingerD_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "ringFingerB_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "thumbFingerD_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "pinkyFingerC_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "indexFingerD_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "middleFingerB_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "thumbFingerC_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "middleFingerC_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "middleFingerRoot_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "ringFingerA_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "indexFingerA_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "ringFingerD_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "root_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "thumbFinger_posers_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "pinkyFingerA_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn"
		;
connectAttr "thumbFingerA_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "ringFingerRoot_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "indexFingerC_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "pinkyFinger_posers_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "indexFingerB_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn"
		;
connectAttr "middleFingerA_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn"
		;
connectAttr "pinkyFinger_posers_sweep.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "pinkyFinger_posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "sweepMeshCreator2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "ringFinger_posers_sweep.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn"
		;
connectAttr "ringFinger_posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn"
		;
connectAttr "middleFinger_posers_sweep.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn"
		;
connectAttr "middleFinger_posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "indexFinger_posers_sweep.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "indexFinger_posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "thumbFinger_posers_sweep.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "thumbFinger_posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn"
		;
connectAttr "mainPoser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "multDoubleLinear26.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "pinkyFingerB_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "multiplyDivide4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "indexFingerB_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "pinkyFingerA_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "makeNurbSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "multiplyDivide6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "pinkyFingerD_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "pinkyFingerC_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "pinkyFingerC_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "ringFingerRoot_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "middleFingerC_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "indexFingerA_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn"
		;
connectAttr "indexFingerB_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn"
		;
connectAttr "ringFingerC_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn"
		;
connectAttr "middleFingerRoot_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "pinkyFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn"
		;
connectAttr "ringFingerA_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn"
		;
connectAttr "indexFingerC_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn"
		;
connectAttr "multiplyDivide9.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "makeNurbSphere23.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn"
		;
connectAttr "pinkyFingerB_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "indexFingerA_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn"
		;
connectAttr "middleFingerA_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn"
		;
connectAttr "pinkyFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn"
		;
connectAttr "middleFingerB_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn"
		;
connectAttr "ringFingerB_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn"
		;
connectAttr "indexFingerD_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn"
		;
connectAttr "pinkyFingerB_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn"
		;
connectAttr "indexFingerRoot_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[30].dn"
		;
connectAttr "pinkyFingerA_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[31].dn"
		;
connectAttr "root_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[32].dn"
		;
connectAttr "root_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[33].dn"
		;
connectAttr "ringFingerB_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[34].dn"
		;
connectAttr "makeNurbSphere14.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[35].dn"
		;
connectAttr "pinkyFingerRoot_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[36].dn"
		;
connectAttr "makeNurbSphere15.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[37].dn"
		;
connectAttr "multiplyDivide8.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[38].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[39].dn";
connectAttr "makeNurbSphere17.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[40].dn"
		;
connectAttr "pinkyFingerD_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[41].dn"
		;
connectAttr "multiplyDivide5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[42].dn"
		;
connectAttr "ringFingerD_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[43].dn"
		;
connectAttr "makeNurbSphere8.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[44].dn"
		;
connectAttr "ringFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[45].dn"
		;
connectAttr "makeNurbSphere19.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[46].dn"
		;
connectAttr "indexFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[47].dn"
		;
connectAttr "ringFingerA_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[48].dn"
		;
connectAttr "middleFingerD_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[49].dn"
		;
connectAttr "makeNurbSphere21.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[50].dn"
		;
connectAttr "makeNurbSphere25.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[51].dn"
		;
connectAttr "makeNurbSphere6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[52].dn"
		;
connectAttr "makeNurbSphere16.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[53].dn"
		;
connectAttr "makeNurbSphere11.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[54].dn"
		;
connectAttr "makeNurbSphere7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[55].dn"
		;
connectAttr "middleFingerB_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[56].dn"
		;
connectAttr "pinkyFingerA_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[57].dn"
		;
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[58].dn";
connectAttr "middleFingerA_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[59].dn"
		;
connectAttr "makeNurbSphere18.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[60].dn"
		;
connectAttr "middleFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[61].dn"
		;
connectAttr "middleFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[62].dn"
		;
connectAttr "makeNurbSphere22.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[63].dn"
		;
connectAttr "multiplyDivide3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[64].dn"
		;
connectAttr "multiplyDivide1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[65].dn"
		;
connectAttr "makeNurbSphere12.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[66].dn"
		;
connectAttr "makeNurbSphere13.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[67].dn"
		;
connectAttr "ringFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[68].dn"
		;
connectAttr "makeNurbSphere9.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[69].dn"
		;
connectAttr "makeNurbSphere20.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[70].dn"
		;
connectAttr "multiplyDivide7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[71].dn"
		;
connectAttr "makeNurbSphere24.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[72].dn"
		;
connectAttr "makeNurbSphere10.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[73].dn"
		;
connectAttr "indexFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[74].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "multDoubleLinear26.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "mainPoser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "root_connector_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "decomposeMatrix236.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of fingers.ma
