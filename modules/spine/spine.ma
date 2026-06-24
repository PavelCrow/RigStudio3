//Maya ASCII 2022 scene
//Name: spine.ma
//Last modified: Wed, Jun 24, 2026 06:28:28 AM
//Codeset: 1251
requires maya "2022";
requires -nodeType "inverseMatrix" "matrixNodes" "1.0";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26200)";
fileInfo "UUID" "9ADE267B-45E6-A0C8-01F7-BF98AA7E434B";
createNode transform -n "mod";
	rename -uid "C55DD497-492A-4EC0-E01E-33B4860B4331";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "8B6D04D2-4C43-9E49-D1BE-F385637FE8B1";
	setAttr ".v" no;
createNode transform -n "mainPoser" -p "posers";
	rename -uid "6FC9A59C-460B-671B-DA12-EB82FC6E3013";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 0.1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "foot";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.2;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "614CBDC8-482E-9E0B-B323-52B491A42A82";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "78831538-4AA5-F232-D568-D49EA125F78E";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "B8152D5C-41DF-8F03-5349-97A094AAD2BB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "38D97296-4D6A-A2A8-AE3C-4C80AACD7896";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "1E25A923-41B4-3D4E-6E6E-34AE22382E8B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pelvis_initLoc" -p "root_poser";
	rename -uid "D7712AAC-4DC7-AAB7-80DC-B0B582264D80";
createNode locator -n "pelvis_initLocShape" -p "pelvis_initLoc";
	rename -uid "5BCD1925-4A68-E2AB-2908-619874F3FD44";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "hips_initLoc" -p "root_poser";
	rename -uid "65913067-474C-9608-6DC3-D39ABE43DFE2";
createNode locator -n "hips_initLocShape" -p "hips_initLoc";
	rename -uid "80A881BE-4B26-113B-C0B8-C19184C08036";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "spineRoot_initLoc" -p "root_poser";
	rename -uid "C033FD8D-4EF1-0427-387E-C2B544CA335F";
createNode locator -n "spineRoot_initLocShape" -p "spineRoot_initLoc";
	rename -uid "B04084BF-47DC-5D56-B509-899E049D7695";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "16404241-45F9-7DBC-D9C4-CCAA0F0FC98B";
	setAttr ".t" -type "double3" -9.3074452277290208e-16 0 2.3268613069322532e-16 ;
	setAttr ".r" -type "double3" 0 -1.5902773407317592e-15 89.999999999999986 ;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "02A2318E-4BE9-3F22-8EDE-CCBF9B63DB00";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_1_initLoc" -p "root_poser";
	rename -uid "47F95F57-4F74-022A-2F83-108FDEEADF76";
	setAttr ".t" -type "double3" 0 5 0 ;
createNode locator -n "fk_1_initLocShape" -p "fk_1_initLoc";
	rename -uid "06C7542B-4045-168C-5C6B-AAA4D0A1EE77";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_2_initLoc" -p "fk_1_initLoc";
	rename -uid "BF4055A4-4A25-3F88-F689-C4BB848712E4";
	setAttr ".t" -type "double3" 0 5 0 ;
createNode locator -n "fk_2_initLocShape" -p "fk_2_initLoc";
	rename -uid "392B4E32-4DCC-2579-8A13-89A611502181";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_3_initLoc" -p "fk_2_initLoc";
	rename -uid "BAA4C6C0-41E2-C819-F986-05A6698F8ED4";
	setAttr ".t" -type "double3" 0 5 0 ;
createNode locator -n "fk_3_initLocShape" -p "fk_3_initLoc";
	rename -uid "BF05D547-4FC6-0972-8F09-01AC771E996A";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "stomach_initLoc" -p "fk_2_initLoc";
	rename -uid "98B1C58E-47DD-3D8E-0217-159362F02352";
createNode locator -n "stomach_initLocShape" -p "stomach_initLoc";
	rename -uid "F455289A-4EF5-85F5-408C-7CA89CC6095F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_hips_initLoc" -p "fk_1_initLoc";
	rename -uid "CE2D08D0-423C-0CD6-E4E9-B09F917C14FE";
	setAttr ".v" no;
createNode locator -n "fk_hips_initLocShape" -p "fk_hips_initLoc";
	rename -uid "93EB5877-4BD8-15CF-24A4-BFA6ECB32CCB";
	setAttr -k off ".v";
createNode transform -n "init_surfLoc_0" -p "root_poser";
	rename -uid "61C9B946-4B86-E1D0-82A6-5D9B68F061FD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1 ;
createNode locator -n "init_surfLoc_0Shape" -p "init_surfLoc_0";
	rename -uid "99CEE662-4B9E-4812-8640-B89A1B4F1C73";
	setAttr -k off ".v";
createNode transform -n "init_surfLoc_1" -p "root_poser";
	rename -uid "FBBD8757-416E-0A4D-6316-438C3D0B6BE1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode locator -n "init_surfLoc_1Shape" -p "init_surfLoc_1";
	rename -uid "B642B1B9-4A52-995A-FE76-299408889ECE";
	setAttr -k off ".v";
createNode transform -n "end_poser" -p "mainPoser";
	rename -uid "AC069D1D-44EF-2B2E-E383-1889779A1712";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 24.106466070714571 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size";
createNode nurbsSurface -n "end_poserShape" -p "end_poser";
	rename -uid "9497663A-461B-0B37-25AD-E591C4342D59";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "0A24CE8B-4F85-0AEF-7719-0483347627BF";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "C390C0A9-4985-4F1C-0115-01A0932B5CBC";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "end_poserOrient_aimConstraint1" -p "end_poserOrient";
	rename -uid "008835FB-4DC0-57C7-E9AE-ADB2F96E5A32";
	addAttr -ci true -sn "w0" -ln "root_poserW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 0 22.86844571111962 ;
	setAttr -k on ".w0";
createNode transform -n "init_surfLoc_13" -p "end_poser";
	rename -uid "949893F4-41E9-0705-B975-1C9966CE193A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.00033591597976467824 -1 ;
createNode locator -n "init_surfLoc_13Shape" -p "init_surfLoc_13";
	rename -uid "2E64F82B-4119-BBA9-F87A-2BBF03404C3C";
	setAttr -k off ".v";
createNode transform -n "init_surfLoc_12" -p "end_poser";
	rename -uid "9CFEE346-41C9-A98A-A2E0-12950621C3BC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.00033591597976467824 1 ;
createNode locator -n "init_surfLoc_12Shape" -p "init_surfLoc_12";
	rename -uid "DB442D9D-4EF5-F010-956E-B6B5C1D16DA3";
	setAttr -k off ".v";
createNode transform -n "end_initLoc" -p "end_poser";
	rename -uid "581E75CD-4CF7-D706-5C04-E78B30F010F6";
	setAttr ".r" -type "double3" 0 0 89.999999999999972 ;
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "E6C4C32D-4C78-01CF-30E5-3DB23D9A373D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_1_poser_group" -p "mainPoser";
	rename -uid "2BA4C7C3-437A-E63F-A606-37ABEDEB42D1";
createNode transform -n "local_1_poser" -p "local_1_poser_group";
	rename -uid "02E51398-493B-924D-20A5-FF9EFFE70D52";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 2.2333274839467379 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "local_1_poserShape" -p "local_1_poser";
	rename -uid "E3B915F4-4B8F-3B6B-A685-49BA55E971CD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "local_1_poserOrient" -p "local_1_poser";
	rename -uid "43778514-4C48-FD5D-93D7-BB9D82B49211";
createNode locator -n "local_1_poserOrientShape" -p "local_1_poserOrient";
	rename -uid "790E75B7-4A49-2D6F-102A-5D8C2974175F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "init_surfLoc_4" -p "local_1_poser";
	rename -uid "6BF93AC8-428C-9290-0DDC-B892928F4B42";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1.6873233565917189e-07 1 ;
createNode locator -n "init_surfLoc_4Shape" -p "init_surfLoc_4";
	rename -uid "278111AA-4413-C330-9E08-1780F2FFDF54";
	setAttr -k off ".v";
createNode transform -n "init_surfLoc_5" -p "local_1_poser";
	rename -uid "03014126-4BA5-E992-D473-E4B312E6431F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1.6873233565917189e-07 -1 ;
createNode locator -n "init_surfLoc_5Shape" -p "init_surfLoc_5";
	rename -uid "D6FB8FCC-4509-6FFE-AF65-319E640D4D8C";
	setAttr -k off ".v";
createNode pointConstraint -n "local_1_poser_group_pointConstraint1" -p "local_1_poser_group";
	rename -uid "0222646B-4D0F-1944-729B-A18236FFF802";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "end_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.20483;
createNode transform -n "local_2_poser_group" -p "mainPoser";
	rename -uid "A187A567-480A-9EBC-969C-60BEBF0C1607";
createNode transform -n "local_2_poser" -p "local_2_poser_group";
	rename -uid "1754ABE9-4264-4E9B-2A27-3DACC094EC32";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 4.4865436589159602 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "local_2_poserShape" -p "local_2_poser";
	rename -uid "F7DBAD21-43EF-A9FC-4F14-078060C3F6FE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "local_2_poserOrient" -p "local_2_poser";
	rename -uid "E454A4B6-4E7D-50D9-4924-0DAAB56A166D";
createNode locator -n "local_2_poserOrientShape" -p "local_2_poserOrient";
	rename -uid "FF55FBEA-4CFB-7830-C39B-C69AD3F76313";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "init_surfLoc_6" -p "local_2_poser";
	rename -uid "E62B8E73-496C-7CFA-65D8-70B7B7C42BEA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -2.053580381300435e-07 1 ;
createNode locator -n "init_surfLoc_6Shape" -p "init_surfLoc_6";
	rename -uid "93982F1E-4946-5FCF-9FE5-A08A05E4A3DF";
	setAttr -k off ".v";
createNode transform -n "init_surfLoc_7" -p "local_2_poser";
	rename -uid "97776A11-4020-9F24-ED6A-D28BC29E29DD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -2.053580381300435e-07 -1 ;
createNode locator -n "init_surfLoc_7Shape" -p "init_surfLoc_7";
	rename -uid "CD7E5F16-461C-EDA2-A01E-E794CF2CBBED";
	setAttr -k off ".v";
createNode pointConstraint -n "local_2_poser_group_pointConstraint1" -p "local_2_poser_group";
	rename -uid "31B1BCC1-4540-4490-E96F-67A7A6C05E80";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "end_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.4925;
createNode transform -n "local_3_poser_group" -p "mainPoser";
	rename -uid "3ADD4861-4C1E-4CA3-2EBD-5C863FF82422";
createNode transform -n "local_3_poser" -p "local_3_poser_group";
	rename -uid "6975772C-4F0A-3832-26EE-759D862F57F4";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 5.3839017642786562 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "local_3_poserShape" -p "local_3_poser";
	rename -uid "F84AA972-421A-6D58-45E6-D8929EBDFB4E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "local_3_poserOrient" -p "local_3_poser";
	rename -uid "2DF45443-46FA-CAC6-1791-C9A4FB507EE5";
createNode locator -n "local_3_poserOrientShape" -p "local_3_poserOrient";
	rename -uid "0A27F447-4FF2-62C9-C92D-71A8F58D1C15";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "init_surfLoc_8" -p "local_3_poser";
	rename -uid "031F3ED5-4CC0-E2A1-96A4-41A488A5998B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 8.9677519099495839e-07 1 ;
createNode locator -n "init_surfLoc_8Shape" -p "init_surfLoc_8";
	rename -uid "477A4C12-42EC-A629-A4BD-4088760BCC5B";
	setAttr -k off ".v";
createNode transform -n "init_surfLoc_9" -p "local_3_poser";
	rename -uid "F74CE5DC-4768-A5EC-D167-1FA3BF6829FF";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 8.9677519099495839e-07 -1 ;
createNode locator -n "init_surfLoc_9Shape" -p "init_surfLoc_9";
	rename -uid "35E32F08-4C44-8B57-D972-1687007E2E45";
	setAttr -k off ".v";
createNode pointConstraint -n "local_3_poser_group_pointConstraint1" -p "local_3_poser_group";
	rename -uid "EB8BDBEE-4052-11FA-3745-999B58F82883";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "end_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "local_4_poser_group" -p "mainPoser";
	rename -uid "135B3A7B-4E05-CBF7-24D5-7AAB86C92D54";
createNode pointConstraint -n "local_4_poser_group_pointConstraint1" -p "local_4_poser_group";
	rename -uid "5649C6F4-4ED9-B874-854E-54B4E173CA63";
	addAttr -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "root_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 4.1266343000499823 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.4925;
createNode transform -n "local_5_poser_group" -p "mainPoser";
	rename -uid "F760815F-4757-6813-114E-D98266DA45A4";
createNode pointConstraint -n "local_5_poser_group_pointConstraint1" -p "local_5_poser_group";
	rename -uid "673CDB42-4319-CCEA-7702-50BB9C75729F";
	addAttr -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "root_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 4.5616252556883001 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.20482;
createNode transform -n "fk_controls_positions" -p "mainPoser";
	rename -uid "C29CD532-40BA-C1A2-6357-97A756301849";
	setAttr -k off ".v" no;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s" -type "double3" 0.99999999999999989 0.99999999999999967 0.99999999999999967 ;
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 8.8817841970012484e-16 2.2204460492503121e-16 ;
	setAttr ".sp" -type "double3" 0 8.8817841970012523e-16 2.2204460492503131e-16 ;
	setAttr ".spt" -type "double3" 0 -3.9443045261050617e-31 -9.8607613152626443e-32 ;
	setAttr ".hdl" -type "double3" 0 8.8817841970012523e-16 2.2204460492503131e-16 ;
	setAttr ".dh" yes;
createNode transform -n "fk_bone_1_group_pos" -p "fk_controls_positions";
	rename -uid "E2DE1578-4AFB-04E7-763A-6F9EBB6EA2D0";
	setAttr ".t" -type "double3" 0 5 -4.4408920985006281e-16 ;
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".hdl" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".dh" yes;
createNode transform -n "fk_bone_2_group_pos" -p "fk_bone_1_group_pos";
	rename -uid "AB72E346-4CB9-E9DB-FE60-B5B2DA670183";
	setAttr ".t" -type "double3" 0 5 0 ;
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".hdl" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".dh" yes;
createNode transform -n "fk_bone_3_group_pos" -p "fk_bone_2_group_pos";
	rename -uid "4BF45432-4EEC-7C43-C669-AD832C941F16";
	setAttr ".t" -type "double3" 0 5 0 ;
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".hdl" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".dh" yes;
createNode transform -n "init_locators_group" -p "mainPoser";
	rename -uid "7F79931A-4C24-81FD-D8D7-48972AED763D";
	setAttr ".v" no;
createNode transform -n "fk_1_pivot_loc" -p "init_locators_group";
	rename -uid "4E2E52FD-4175-2858-6599-72BE0771FE43";
	setAttr ".v" no;
createNode locator -n "fk_1_pivot_locShape" -p "fk_1_pivot_loc";
	rename -uid "65E59973-43A9-911B-145A-8B928B3405F9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "fk_1_pivot_loc_pointConstraint1" -p "fk_1_pivot_loc";
	rename -uid "5A1DB2F2-49D5-97F8-A16E-2594B842270B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "local_2_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "local_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 2.499953182577479 -0.55182315757274114 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "fk_2_pivot_loc" -p "init_locators_group";
	rename -uid "3C86441C-4F57-5287-AF35-C0993C229F0A";
	setAttr ".v" no;
createNode locator -n "fk_2_pivot_locShape" -p "fk_2_pivot_loc";
	rename -uid "71E2466B-4E4E-3F03-DAA0-6F80C3992790";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "fk_3_pivot_loc_pointConstraint1" -p "fk_2_pivot_loc";
	rename -uid "A4CB23AD-4330-5582-4ECA-119E84FDA3EE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "local_3_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 5 -1.1036669834828774 ;
	setAttr -k on ".w0";
createNode transform -n "fk_3_pivot_loc" -p "init_locators_group";
	rename -uid "48FE55DF-493E-D261-F8B0-E896FDD1E6FD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 7.5000812620952964 -1.6555184124826337 ;
createNode locator -n "fk_3_pivot_locShape" -p "fk_3_pivot_loc";
	rename -uid "F05CBEBD-42C4-5AE2-D2E9-EBBD7287631B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "joints_initLocs" -p "init_locators_group";
	rename -uid "32714300-4309-38F0-D09C-CEAC2E4FE21C";
	setAttr ".it" no;
createNode transform -n "local_1_initLoc" -p "joints_initLocs";
	rename -uid "0A9EA400-4EB0-4AF5-6CB6-039507D6C292";
	setAttr ".it" no;
createNode locator -n "local_1_initLocShape" -p "local_1_initLoc";
	rename -uid "3D258508-41EF-4CA8-389A-A984BE77CB36";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_2_initLoc" -p "joints_initLocs";
	rename -uid "1E5B9A0B-4213-E5AD-1B71-EAA5592A23C6";
	setAttr ".it" no;
createNode locator -n "local_2_initLocShape" -p "local_2_initLoc";
	rename -uid "D136D180-4A13-5EF3-E16C-1B8273C1E6C9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_3_initLoc" -p "joints_initLocs";
	rename -uid "E6E82B5F-4486-8C9B-753B-71BDF90F550A";
	setAttr ".it" no;
createNode locator -n "local_3_initLocShape" -p "local_3_initLoc";
	rename -uid "10BBAD61-4D2F-491F-CFED-38B56CF2D618";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_4_initLoc" -p "joints_initLocs";
	rename -uid "374B3121-4A3D-76BF-831B-FC919A58104D";
	setAttr ".it" no;
createNode locator -n "local_4_initLocShape" -p "local_4_initLoc";
	rename -uid "FE73FB6F-4D74-49AF-C216-09B96FD5B946";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_5_initLoc" -p "joints_initLocs";
	rename -uid "3652B5CF-4D84-876F-A508-138390738E68";
	setAttr ".it" no;
createNode locator -n "local_5_initLocShape" -p "local_5_initLoc";
	rename -uid "E63383A1-46C4-E034-F62D-889081D716A4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_initLocs" -p "init_locators_group";
	rename -uid "B60CD6F6-47D7-2B0D-80DB-54B0792E1981";
createNode transform -n "ik_initLocs" -p "init_locators_group";
	rename -uid "3812ACB2-49C8-B1BD-B61F-FAB06ACF6D4B";
createNode transform -n "chest_initLoc" -p "ik_initLocs";
	rename -uid "A56CD0C6-4F99-348F-7D9A-9FBE19B1B5B4";
createNode locator -n "chest_initLocShape" -p "chest_initLoc";
	rename -uid "9DCA07A9-41D6-097B-A148-A5B52395FDD3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "chest_initLoc_pointConstraint1" -p "chest_initLoc";
	rename -uid "0FE61E6C-4A17-B2BB-3B8C-598E7D9A1F6C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 10 0 ;
	setAttr -k on ".w0";
createNode transform -n "init_surf" -p "init_locators_group";
	rename -uid "5703A642-4BB7-F068-7E1C-EF8D149218A6";
	setAttr ".it" no;
createNode nurbsSurface -n "init_surfShapeOrig" -p "init_surf";
	rename -uid "4EDD053F-47C7-3434-529A-4B87AEDEC731";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 14 ".cp";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 2;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		2 0 1
		
		14
		0 0 1
		0 0 -1
		0 3.1658024787902832 1
		0 3.1658024787902832 -1
		0 6.3316049575805664 1
		0 6.3316049575805664 -1
		0 12.441273463492212 1
		0 12.441273463492212 -1
		0 17.437135696411133 1
		0 17.437135696411133 -1
		0 20.771968841552734 1
		0 20.771968841552734 -1
		0 24.106801986694336 1
		0 24.106801986694336 -1
		
		;
createNode transform -n "init_surfCurve" -p "init_locators_group";
	rename -uid "232FB579-4DD4-61B8-7451-5CBC7B71D223";
	setAttr ".it" no;
createNode nurbsCurve -n "init_surfCurveShape" -p "init_surfCurve";
	rename -uid "F027F4DD-4075-2514-37A4-B9954FE82F35";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "9B2D96AC-4D05-A115-CAAE-CE80AFB3502C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 15 0 no 3
		16 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		16
		-1 1 1
		-1 1 -1
		1 1 -1
		1 1 1
		-1 1 1
		-1 -1 1
		-1 -1 -1
		1 -1 -1
		1 -1 1
		-1 -1 1
		1 -1 1
		1 1 1
		1 1 -1
		1 -1 -1
		-1 -1 -1
		-1 1 -1
		;
createNode transform -n "init_surfLoc_10" -p "mainPoser";
	rename -uid "B4FC4734-45B5-146A-EFEF-519602A915DC";
	setAttr ".v" no;
createNode locator -n "init_surfLoc_10Shape" -p "init_surfLoc_10";
	rename -uid "28678FDC-485E-A3B9-CF0F-959A35E37D0F";
	setAttr -k off ".v";
createNode pointConstraint -n "init_surfLoc_10_pointConstraint1" -p "init_surfLoc_10";
	rename -uid "957BADDD-46BD-4619-FB6B-E3B3AE8CE84A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "init_surfLoc_12W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "init_surfLoc_8W1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 20.771968841552734 1 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "init_surfLoc_11" -p "mainPoser";
	rename -uid "23A949F4-4EE8-7A40-E274-FF80175EED37";
	setAttr ".v" no;
createNode locator -n "init_surfLoc_11Shape" -p "init_surfLoc_11";
	rename -uid "54A63252-4B99-F78D-51EA-75A21A936827";
	setAttr -k off ".v";
createNode pointConstraint -n "init_surfLoc_11_pointConstraint1" -p "init_surfLoc_11";
	rename -uid "E1E7E269-435A-E05B-4BAC-F4A8ADE2F775";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "init_surfLoc_13W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "init_surfLoc_9W1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 20.771968841552734 -1 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "init_surfLoc_2" -p "mainPoser";
	rename -uid "00CB49E6-4CD2-3F78-B64A-72B7193AE2D9";
	setAttr ".v" no;
createNode locator -n "init_surfLoc_2Shape" -p "init_surfLoc_2";
	rename -uid "06951EE9-475C-108D-BEC4-C499D1FE9340";
	setAttr -k off ".v";
createNode pointConstraint -n "init_surfLoc_2_pointConstraint1" -p "init_surfLoc_2";
	rename -uid "D58D7BA5-4E55-1265-8F01-D68F9687AFC6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "init_surfLoc_0W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "init_surfLoc_4W1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 3.1658024787902832 1 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "init_surfLoc_3" -p "mainPoser";
	rename -uid "FA4D65EC-4B61-CA52-DF22-42974EFDCF10";
	setAttr ".v" no;
createNode locator -n "init_surfLoc_3Shape" -p "init_surfLoc_3";
	rename -uid "188FBEAD-41D0-3E6A-0C78-89A3702BE739";
	setAttr -k off ".v";
createNode pointConstraint -n "init_surfLoc_3_pointConstraint1" -p "init_surfLoc_3";
	rename -uid "7D68A883-4666-2B15-C632-348347D78DD1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "init_surfLoc_5W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "init_surfLoc_1W1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 3.1658024787902832 -1 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "D46962ED-4D10-D0AB-3440-199D7552E6DD";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "1FE366E7-4628-C737-4F1F-5989EB87EBAA";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		-9.3074452277290208e-16 0 2.3268613069322532e-16
		0 6.3316047888482307 0
		0 12.441273668850251 0
		0 17.437134799635942 0
		0 24.106466070714571 0
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "18BA2864-4437-9A02-364D-3EA471B797F7";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 1;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "EFCEE35C-4FE6-E39C-CA97-E091A962A90A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "mainPoser_clusterHandle" -p "posers";
	rename -uid "DCA498E1-414C-693B-00EF-0389956FA07B";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "71EEDD18-40BC-FB2E-3BCD-3B9DB1D173C0";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "input" -p "mod";
	rename -uid "68D3520E-4F1E-D9EE-8942-C7B90B60D32A";
	setAttr ".v" no;
createNode transform -n "root_connector" -p "input";
	rename -uid "806634B7-4939-E951-EB36-6BB1A2F82D1B";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "943F9A5A-43A9-CEF5-32DE-43897E1ED2C4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "controls" -p "mod";
	rename -uid "10CADAD4-41D3-1FBF-D88A-1A9D31AA7DDF";
	setAttr ".ove" yes;
createNode transform -n "pelvis_group" -p "controls";
	rename -uid "A81677C5-401D-7526-2C08-34BCA24A4BE3";
createNode transform -n "pelvis" -p "pelvis_group";
	rename -uid "AE5D7052-4637-A961-620A-9F88A5FF9893";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "squash" -ln "squash" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "localControls" -ln "localControls" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rotateZMirror" yes;
	setAttr -k on ".squash" 1;
	setAttr -cb on ".localControls" yes;
createNode nurbsCurve -n "pelvisShape" -p "pelvis";
	rename -uid "8C14EE6D-48F2-978C-9F87-07AB406F1FFE";
	addAttr -ci true -sn "ocellarisSurfaceShaderAttrs" -ln "ocellarisSurfaceShaderAttrs" 
		-dt "stringArray";
	addAttr -ci true -sn "ocellarisSurfaceShaderAttrsEdit" -ln "ocellarisSurfaceShaderAttrsEdit" 
		-dt "stringArray";
	addAttr -ci true -k true -sn "oc_surface" -ln "oc_surface" -dt "string";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 0.52999466350000002 1 1.513929804 2 2.4924675189999999 3 3.4673517110000001
		 4 5 5.4924671099999998 6 7
		13
		-13.090340633793765 0 0.00081718940982928375
		-5.1960166556208804 0 -5.1943034084223791
		0 0 -12.89046917854361
		5.1960166556208804 0 -5.1943034084223791
		13.090340633793765 0 0.00081718940982928375
		5.1960166556208804 0 5.1977299028194057
		0 0 13.290226539234226
		-5.1960166556208804 0 5.1977299028194057
		-13.090340633793765 0 0.00081718940982928375
		13.090340633793765 0 0.00081718940982928375
		5.1960166556208804 0 5.1977299028194057
		0 0 13.290226539234226
		0 0 -12.89046917854361
		;
	setAttr ".ocellarisSurfaceShaderAttrs" -type "stringArray" 0  ;
	setAttr -k on ".oc_surface";
createNode transform -n "spineRoot" -p "pelvis";
	rename -uid "68481D28-4BCB-16AB-CFD1-33ABACD6C22E";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 0 -8.8817841970012523e-16 4.4408920985006262e-16 ;
	setAttr -k on ".t";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999956 0.99999999999999956 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "spineRoot";
createNode nurbsCurve -n "spineRootShape2" -p "spineRoot";
	rename -uid "12A36C42-4A5B-6D6A-25AC-DD8260041B80";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.5796672871107447 5.5796672871107305 -0.078441021378501827
		3.8213450987361294e-15 7.8908506666998104 -0.078441021378502604
		-5.5796672871107127 5.5796672871107305 -0.078441021378502535
		-7.8908506666997988 -1.5904380303267178e-15 -0.078441021378503048
		-5.5796672871107127 -5.5796672871107305 -0.078441021378502535
		3.8213450987361294e-15 -7.8908506666998104 -0.078441021378502604
		5.5796672871107447 -5.5796672871107305 -0.078441021378501827
		7.8908506666998122 -1.5904380303267178e-15 -0.078441021378501577
		5.5796672871107447 5.5796672871107305 -0.078441021378501827
		3.8213450987361294e-15 7.8908506666998104 -0.078441021378502604
		-5.5796672871107127 5.5796672871107305 -0.078441021378502535
		;
createNode transform -n "fk_controls" -p "spineRoot";
	rename -uid "F0BD8006-4E15-5A79-96F4-33BB2439C18B";
	setAttr ".t" -type "double3" 0 9.9920072216264089e-16 -4.4408920985006281e-16 ;
	setAttr -k on ".s";
createNode transform -n "fk_bone_1_group" -p "fk_controls";
	rename -uid "FCFDED3D-4F9C-C8BD-B50C-35AA67D3D0F6";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 2.2204460492503131e-16 0 ;
createNode transform -n "fk_1" -p "fk_bone_1_group";
	rename -uid "B0AB1461-4A40-C005-4C55-8C80D1A837D1";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 2.2204460492503131e-16 4.4408920985006281e-16 ;
	setAttr ".sp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr -l on ".internalName" -type "string" "fk_1";
createNode nurbsCurve -n "fk_1Shape" -p "fk_1";
	rename -uid "47A4B6DB-41C5-F12D-FF15-05B48A2D6659";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0782865893619409 -1.6607782071182173e-14 -4.0782865893619391
		-6.5801056925467289e-16 -1.6607782071182173e-14 -5.7675682059199875
		-4.0782865893619391 -1.6607782071182173e-14 -4.0782865893619391
		-5.7675682059199875 -1.6607782071182173e-14 8.2618420014461603e-16
		-4.0782865893619391 -1.6607782071182173e-14 4.0782865893619391
		-1.7378808609873616e-15 -1.6607782071182173e-14 5.7675682059199902
		4.0782865893619391 -1.6607782071182173e-14 4.0782865893619391
		5.7675682059199875 -1.6607782071182173e-14 5.5952533074502136e-15
		4.0782865893619409 -1.6607782071182173e-14 -4.0782865893619391
		-6.5801056925467289e-16 -1.6607782071182173e-14 -5.7675682059199875
		-4.0782865893619391 -1.6607782071182173e-14 -4.0782865893619391
		;
createNode transform -n "fk_bone_2_group" -p "fk_1";
	rename -uid "B831BF60-4F88-25ED-3747-CAAD0186BAE4";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
createNode transform -n "fk_2" -p "fk_bone_2_group";
	rename -uid "FD6D8A8B-42C3-B195-5FF2-A28DCEA25C77";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 4.4408920985006281e-16 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr -l on ".internalName" -type "string" "fk_2";
createNode nurbsCurve -n "fk_2Shape" -p "fk_2";
	rename -uid "FF8B260D-4C40-B971-1D7D-C19FBA158B34";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.2722195777392682 -4.6475655316544178e-14 -3.272219577739262
		-5.2795580200050735e-16 -4.6475655316544178e-14 -4.6276173059016568
		-3.2722195777392664 -4.6475655316544178e-14 -3.2722195777392664
		-4.627617305901663 -4.6475655316544178e-14 -6.0727439827899845e-17
		-3.2722195777392664 -4.6475655316544178e-14 3.2722195777392664
		-1.3943914073951633e-15 -4.6475655316544178e-14 4.627617305901663
		3.2722195777392664 -4.6475655316544178e-14 3.2722195777392682
		4.627617305901663 -4.6475655316544178e-14 3.7657425638307558e-15
		3.2722195777392682 -4.6475655316544178e-14 -3.272219577739262
		-5.2795580200050735e-16 -4.6475655316544178e-14 -4.6276173059016568
		-3.2722195777392664 -4.6475655316544178e-14 -3.2722195777392664
		;
createNode transform -n "fk_bone_3_group" -p "fk_2";
	rename -uid "A6B5D088-43C8-581E-5375-3FA29F9F27A0";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
createNode transform -n "fk_3" -p "fk_bone_3_group";
	rename -uid "3AC06323-4B21-0026-24B3-819C5C22190B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "fk_3";
createNode nurbsCurve -n "fk_3Shape" -p "fk_3";
	rename -uid "C0920EAB-4DEE-6819-9858-1C879997A03F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.4019120034757449 1.082445604139711e-14 -3.4019120034757289
		-5.4888100797045502e-16 1.082445604139711e-14 -4.8110300933152024
		-3.4019120034757289 1.082445604139711e-14 -3.4019120034757289
		-4.8110300933152024 1.082445604139711e-14 -1.4639629873958557e-15
		-3.4019120034757289 1.082445604139711e-14 3.4019120034757289
		-1.4496572597485518e-15 1.082445604139711e-14 4.8110300933152024
		3.4019120034757289 1.082445604139711e-14 3.4019120034757289
		4.8110300933152024 1.082445604139711e-14 2.5141668193390961e-15
		3.4019120034757449 1.082445604139711e-14 -3.4019120034757289
		-5.4888100797045502e-16 1.082445604139711e-14 -4.8110300933152024
		-3.4019120034757289 1.082445604139711e-14 -3.4019120034757289
		;
createNode transform -n "chest_group" -p "fk_3";
	rename -uid "57EFC2E2-4BAA-7514-211B-4890CDA17874";
createNode transform -n "chest" -p "chest_group";
	rename -uid "A8A46644-4766-B164-311C-29B66567593E";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".ro" 3;
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "chest";
	setAttr -k on ".weight";
createNode transform -n "chest_out" -p "chest";
	rename -uid "7C5C4903-4A25-B15E-8CCF-2A9F5EEE23F3";
	setAttr ".v" no;
createNode nurbsCurve -n "chestShape" -p "chest";
	rename -uid "5ABB3010-4890-7493-CC4C-61B3585ED28E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-4.0598525794870248 2.2715746376911681 4.0598525794870248
		-4.0598525794870248 2.2715746376911681 -4.0598525794870248
		4.0598525794870248 2.2715746376911681 -4.0598525794870248
		4.0598525794870248 2.2715746376911681 4.0598525794870248
		-4.0598525794870248 2.2715746376911681 4.0598525794870248
		-5.1173348183188043 -2.2715746376911676 5.1173348183188043
		-5.1173348183188043 -2.2715746376911676 -5.1173348183188043
		-4.0598525794870248 2.2715746376911681 -4.0598525794870248
		-4.0598525794870248 2.2715746376911681 4.0598525794870248
		-5.1173348183188043 -2.2715746376911676 5.1173348183188043
		5.1173348183188043 -2.2715746376911676 5.1173348183188043
		4.0598525794870248 2.2715746376911681 4.0598525794870248
		4.0598525794870248 2.2715746376911681 -4.0598525794870248
		5.1173348183188043 -2.2715746376911676 -5.1173348183188043
		5.1173348183188043 -2.2715746376911676 5.1173348183188043
		5.1173348183188043 -2.2715746376911676 -5.1173348183188043
		-5.1173348183188043 -2.2715746376911676 -5.1173348183188043
		;
createNode transform -n "end_out" -p "chest";
	rename -uid "DAAF53A1-46BC-8171-2981-5EBF01FF89D9";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "local_ik_6" -p "chest";
	rename -uid "77E60C8C-42BA-8CF2-A661-6D9086D3827B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_4";
createNode nurbsCurve -n "local_ik_6Shape" -p "local_ik_6";
	rename -uid "50B141CC-4DB4-84C8-7672-B48934EA9E72";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 4.5356237620917819e-33 1.9414479704838771e-32
		-1.1989615347515965 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 1.1989615347515965 1.9414479704838771e-32
		4.0575919006096279e-15 -1.1989615347515965 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 -1.1989615347515965
		4.0575919006096279e-15 4.5356237620917819e-33 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_12" -p "local_ik_6";
	rename -uid "660D2BBC-4A97-F597-77A0-4FB4DE7DA9A7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.0003361092131335397 1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_12Shape" -p "bend_surfLoc_12";
	rename -uid "3408F88B-4F8D-7630-3A36-7196B17BE6A8";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_13" -p "local_ik_6";
	rename -uid "D0730193-41DC-9286-7824-B084A9A48FB5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.00033610630428171362 -1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_13Shape" -p "bend_surfLoc_13";
	rename -uid "1B2B7F1A-479B-5E13-B2D5-1A9C6ECEF961";
	setAttr -k off ".v";
createNode transform -n "chest_aim_group" -p "chest";
	rename -uid "72B0A26F-485F-ABEB-8E12-FCA5C6BA77BE";
createNode transform -n "local_7" -p "chest_aim_group";
	rename -uid "B46A1690-4EA5-6B53-4E4D-AEAC4C4ECE86";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_4";
createNode nurbsCurve -n "local_7Shape" -p "local_7";
	rename -uid "C521E470-4630-5B10-0B03-C48A6676DE3A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 4.5356237620917819e-33 1.9414479704838771e-32
		-1.1989615347515965 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 1.1989615347515965 1.9414479704838771e-32
		4.0575919006096279e-15 -1.1989615347515965 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 -1.1989615347515965
		4.0575919006096279e-15 4.5356237620917819e-33 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_10" -p "local_7";
	rename -uid "3B330D52-4283-CE96-D778-C99B32A42BE5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_10Shape" -p "bend_surfLoc_10";
	rename -uid "1B524A56-44C6-464D-7925-5691D56AE83B";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_11" -p "local_7";
	rename -uid "4D5EBA68-4752-678B-8CB8-859F64E8074A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_11Shape" -p "bend_surfLoc_11";
	rename -uid "7E432C19-4C71-6D60-D48C-B0AE916941DB";
	setAttr -k off ".v";
createNode transform -n "chest_stomach_target" -p "chest_aim_group";
	rename -uid "AD93DBF8-47BF-A189-8660-D6BDECC67EE4";
	setAttr ".v" no;
createNode locator -n "chest_stomach_targetShape" -p "chest_stomach_target";
	rename -uid "4EC8CACE-4E50-E80A-5C4C-92B9CECC4DC2";
	setAttr -k off ".v";
createNode aimConstraint -n "group2_aimConstraint1" -p "chest_aim_group";
	rename -uid "903AC91F-4F63-79DC-0AA8-1CBDE9EC5195";
	addAttr -dcb 0 -ci true -sn "w1" -ln "chest_loc_aim_staticW1" -dv 1 -at "double";
	addAttr -dcb 0 -ci true -sn "w2" -ln "hips_loc_targetW2" -dv 1 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wu" -type "double3" 1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -90.000000000000071 80.511831410867444 90.000000000000071 ;
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "chest_loc_aim_static" -p "chest";
	rename -uid "4071A68C-4BFD-2A49-BC20-049BFFDA927B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode locator -n "chest_loc_aim_staticShape" -p "chest_loc_aim_static";
	rename -uid "76FD044B-4AA3-24C6-6D75-279331181739";
	setAttr -k off ".v";
createNode transform -n "hips_loc_target" -p "chest_group";
	rename -uid "53F45885-40C6-DB6A-295A-62985C3C0723";
	setAttr ".v" no;
createNode locator -n "hips_loc_targetShape" -p "hips_loc_target";
	rename -uid "87EAA64A-4226-FD8B-F981-559CB0A10FDA";
	setAttr -k off ".v";
createNode transform -n "fk_3_loc_1" -p "fk_3";
	rename -uid "92D661C4-4772-75FD-8CF2-918DAF568313";
createNode locator -n "fk_3_loc_1Shape" -p "fk_3_loc_1";
	rename -uid "7C2D6936-48F9-1ECB-32F7-3B8E684EE695";
	setAttr -k off ".v" no;
createNode transform -n "local_4_group_2" -p "fk_3_loc_1";
	rename -uid "C74082DA-40BC-09B2-411B-F89FE54F824F";
createNode transform -n "local_ik_4" -p "local_4_group_2";
	rename -uid "AFD8C8DA-45B8-C11D-2CF7-D3AFBA207CBC";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_4";
createNode nurbsCurve -n "local_ik_4Shape" -p "local_ik_4";
	rename -uid "A1FE763D-49DC-20ED-70DE-4CB59F0A2CE3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 4.5356237620917819e-33 1.9414479704838771e-32
		-1.1989615347515965 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 1.1989615347515965 1.9414479704838771e-32
		4.0575919006096279e-15 -1.1989615347515965 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 1.9414479704838771e-32
		4.0575919006096279e-15 4.5356237620917819e-33 -1.1989615347515965
		4.0575919006096279e-15 4.5356237620917819e-33 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_9" -p "local_ik_4";
	rename -uid "933C1FE8-43CE-DB0A-584D-B0866E105547";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -0.99999999999999967 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999956 0.99999999999999956 ;
createNode locator -n "bend_surfLoc_9Shape" -p "bend_surfLoc_9";
	rename -uid "CBFC001F-44B2-DC8A-55D6-37BB642E5CB7";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_8" -p "local_ik_4";
	rename -uid "27D37B74-43DE-F592-37CF-D9BAA65912A0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 0.99999999999999944 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999956 0.99999999999999956 ;
createNode locator -n "bend_surfLoc_8Shape" -p "bend_surfLoc_8";
	rename -uid "5EAB67FA-435F-DCEF-AA98-14A65F1089EA";
	setAttr -k off ".v";
createNode transform -n "stomach_group" -p "fk_2";
	rename -uid "D1809847-44DD-519A-57A5-018D110C56CF";
createNode transform -n "stomach_group_1" -p "stomach_group";
	rename -uid "843738D5-4FE1-9319-1453-368717F27A05";
createNode transform -n "stomach" -p "stomach_group_1";
	rename -uid "1901839B-436E-6F0F-EE5E-B39A30387B39";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "weight" -ln "weight" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "stomach";
	setAttr -k on ".weight";
createNode nurbsCurve -n "stomachShape" -p "stomach";
	rename -uid "83C13181-4481-9CC4-9FCD-44B7D2BC5753";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-4.0602586708945712 2.2718018545479226 4.0602586708945712
		-4.0602586708945712 2.2718018545479226 -4.0602586708945712
		4.0602586708945712 2.2718018545479226 -4.0602586708945712
		4.0602586708945712 2.2718018545479226 4.0602586708945712
		-4.0602586708945712 2.2718018545479226 4.0602586708945712
		-4.0602586708945712 -2.2718018545479235 4.0602586708945712
		-4.0602586708945712 -2.2718018545479235 -4.0602586708945712
		-4.0602586708945712 2.2718018545479226 -4.0602586708945712
		-4.0602586708945712 2.2718018545479226 4.0602586708945712
		-4.0602586708945712 -2.2718018545479235 4.0602586708945712
		4.0602586708945712 -2.2718018545479235 4.0602586708945712
		4.0602586708945712 2.2718018545479226 4.0602586708945712
		4.0602586708945712 2.2718018545479226 -4.0602586708945712
		4.0602586708945712 -2.2718018545479235 -4.0602586708945712
		4.0602586708945712 -2.2718018545479235 4.0602586708945712
		4.0602586708945712 -2.2718018545479235 -4.0602586708945712
		-4.0602586708945712 -2.2718018545479235 -4.0602586708945712
		;
createNode transform -n "local_3_group" -p "stomach";
	rename -uid "84E57D39-46C0-24A1-7F51-8C842D788303";
createNode transform -n "local_ik_3" -p "local_3_group";
	rename -uid "AD92BC27-40C1-2946-9D9D-309686403529";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_3";
createNode nurbsCurve -n "local_ik_3Shape" -p "local_ik_3";
	rename -uid "C80534A9-4988-8C1F-2104-4DAC892D6BF4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 -4.320624246345267e-15 7.7657918819355126e-32
		-1.1989615347515965 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 1.1989615347515965 7.7657918819355126e-32
		2.508767368544373e-15 -1.1989615347515965 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 -1.1989615347515965
		2.508767368544373e-15 -4.320624246345267e-15 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_7" -p "local_ik_3";
	rename -uid "3A3F2E14-4125-A750-6498-97BF32E7882D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -3.0093023184463163e-08 -1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_7Shape" -p "bend_surfLoc_7";
	rename -uid "0D16D86F-493F-561A-9F23-A2BDD48E9A1D";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_6" -p "local_ik_3";
	rename -uid "FF848702-4FF8-5976-4B38-E088D53A6CAA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 3.0093021408106324e-08 1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_6Shape" -p "bend_surfLoc_6";
	rename -uid "414232BA-4865-B953-F69D-458CAD600C43";
	setAttr -k off ".v";
createNode transform -n "stomach_loc_1" -p "stomach";
	rename -uid "AF481C6E-48DD-3F15-77C2-EE9B9D486FFE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -1.7763568394002505e-15 8.8817841970012523e-16 ;
createNode locator -n "stomach_loc_1Shape" -p "stomach_loc_1";
	rename -uid "6AF85217-4CDF-0E63-EFAF-9EAB2A4D5B09";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "group3" -p "stomach";
	rename -uid "9795B179-4C84-01FB-8614-4C95711653CC";
createNode transform -n "stomach_loc_2" -p "group3";
	rename -uid "8CAFF561-47BC-6859-7E2D-3F9C0611ACAA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -1.7763568394002505e-15 0 ;
createNode locator -n "stomach_loc_2Shape" -p "stomach_loc_2";
	rename -uid "4ED9BF86-4AA5-C429-32C2-1889137CBCAF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "fk_1_loc_1" -p "fk_1";
	rename -uid "28FE2FA6-49C0-FCBA-DF5C-3FA57DC37BD4";
createNode locator -n "fk_1_loc_1Shape" -p "fk_1_loc_1";
	rename -uid "D065DB8C-4028-DF3F-DEC9-499A8D407815";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_2_group" -p "fk_1_loc_1";
	rename -uid "1571A6CF-489D-7BE5-8153-17B9C59CFEC5";
createNode transform -n "local_ik_2" -p "local_2_group";
	rename -uid "AF5CE1E7-4CEF-787C-7BFC-AE97FC0E4789";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_2";
createNode nurbsCurve -n "local_ik_2Shape" -p "local_ik_2";
	rename -uid "F1F69FF4-4B0E-8C47-BD60-748A13FC90F3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 -3.5753158208315601e-16 -1.5531583763871025e-31
		-1.1989615347515965 -3.5753158208315601e-16 -1.5531583763871025e-31
		-2.028795950304814e-15 -3.5753158208315601e-16 -1.5531583763871025e-31
		-2.028795950304814e-15 1.1989615347515965 -1.5531583763871025e-31
		-2.028795950304814e-15 -1.1989615347515965 -1.5531583763871025e-31
		-2.028795950304814e-15 -3.5753158208315601e-16 -1.5531583763871025e-31
		-2.028795950304814e-15 -3.5753158208315601e-16 -1.1989615347515965
		-2.028795950304814e-15 -3.5753158208315601e-16 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_5" -p "local_ik_2";
	rename -uid "497A137F-48DE-BA18-D2E5-3B8428F3BEBE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_5Shape" -p "bend_surfLoc_5";
	rename -uid "7C61BA3F-4979-D44A-3E0A-18ACE56F4521";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_4" -p "local_ik_2";
	rename -uid "0AC56C8A-4937-AC7C-E809-4E8C0291DF6C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1.0000000000000004 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "bend_surfLoc_4Shape" -p "bend_surfLoc_4";
	rename -uid "5E09BEBB-490E-B5EF-A13D-85955FA2FBD1";
	setAttr -k off ".v";
createNode transform -n "ik_controls" -p "spineRoot";
	rename -uid "1FE0A6BD-4D97-470A-6B96-0190A59ED7A7";
createNode transform -n "hips" -p "ik_controls";
	rename -uid "AB964663-4E68-4EB5-0C1F-5CB7C7E61B45";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "hips";
	setAttr -k on ".weight";
createNode nurbsCurve -n "hipsShape" -p "hips";
	rename -uid "A8C28870-4A56-B610-6A3B-6D8E7D08BC3A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-5.0873958485542641 2.2715746376911681 5.0873958485542641
		-5.0873958485542641 2.2715746376911681 -5.0873958485542641
		5.0873958485542641 2.2715746376911681 -5.0873958485542641
		5.0873958485542641 2.2715746376911681 5.0873958485542641
		-5.0873958485542641 2.2715746376911681 5.0873958485542641
		-4.0598525794870248 -2.2715746376911681 4.0598525794870248
		-4.0598525794870248 -2.2715746376911681 -4.0598525794870248
		-5.0873958485542641 2.2715746376911681 -5.0873958485542641
		-5.0873958485542641 2.2715746376911681 5.0873958485542641
		-4.0598525794870248 -2.2715746376911681 4.0598525794870248
		4.0598525794870248 -2.2715746376911681 4.0598525794870248
		5.0873958485542641 2.2715746376911681 5.0873958485542641
		5.0873958485542641 2.2715746376911681 -5.0873958485542641
		4.0598525794870248 -2.2715746376911681 -4.0598525794870248
		4.0598525794870248 -2.2715746376911681 4.0598525794870248
		4.0598525794870248 -2.2715746376911681 -4.0598525794870248
		-4.0598525794870248 -2.2715746376911681 -4.0598525794870248
		;
createNode transform -n "hips_out" -p "hips";
	rename -uid "66372931-45DD-4B76-F093-6987462BF351";
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000004 ;
createNode pointConstraint -n "hips_out_pointConstraint1" -p "hips_out";
	rename -uid "389FA444-44F4-A740-D5AF-8B8ED690CAD9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bendJoint_1_outW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 8.8817841970012563e-16 -1.3322676295501878e-15 ;
	setAttr -k on ".w0";
createNode transform -n "hips_out_2" -p "hips_out";
	rename -uid "D0520590-4AA8-C13D-5E7D-4BA2B372C46F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 9.8607613152626476e-32 ;
	setAttr ".r" -type "double3" 0 0 90 ;
	setAttr ".s" -type "double3" 0.99999999999999911 1 0.99999999999999911 ;
createNode locator -n "hips_out_2Shape" -p "hips_out_2";
	rename -uid "1FAD03FA-4ADC-14A7-2386-6FAAE6127D20";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "hipsStomachMid_aim" -p "hips";
	rename -uid "D766C323-4D8E-570E-AFB9-87884A8CBC39";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 4.6991641972054641 0 ;
createNode locator -n "hipsStomachMid_aimShape" -p "hipsStomachMid_aim";
	rename -uid "9213834D-498F-93F2-9649-B2A163C4C677";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "hipsStomachMid_loc_group" -p "hips";
	rename -uid "1D3E6570-4A45-C2F2-29BE-80A503B5BE7B";
	setAttr ".t" -type "double3" 0 7.7715611723760968e-16 -1.3322676295501878e-15 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
createNode aimConstraint -n "hipsStomachMid_loc_group_aimConstraint1" -p "hipsStomachMid_loc_group";
	rename -uid "F771EA38-41C4-BB21-DF25-5F87384296A0";
	addAttr -ci true -sn "w0" -ln "hipsStomachMid_aimW0" -dv 1 -at "double";
	addAttr -dcb 0 -ci true -sn "w4" -ln "locator3W4" -dv 1 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" -90 -77.256050684317032 90 ;
	setAttr -k on ".w0";
	setAttr -k on ".w4";
createNode transform -n "hips_loc_1" -p "hipsStomachMid_loc_group";
	rename -uid "51A00B0D-49DD-8972-B75E-E6996F9B8230";
createNode locator -n "hips_loc_1Shape" -p "hips_loc_1";
	rename -uid "60A4D69C-41C3-00A2-0542-19BE1466B08F";
	setAttr -k off ".v" no;
createNode transform -n "fk_hips_group" -p "hips_loc_1";
	rename -uid "AEB383B5-4F4A-0026-B246-408C719855F0";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -1.1102230246251559e-16 0 ;
	setAttr ".sp" -type "double3" 0 -1.1102230246251563e-16 0 ;
	setAttr ".spt" -type "double3" 0 3.6977854932234923e-32 0 ;
createNode transform -n "fk_hips" -p "fk_hips_group";
	rename -uid "4F4CC6A1-480B-0E68-03E6-DC8F4662C1A3";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -1.1102230246251563e-16 4.4408920985006281e-16 ;
	setAttr -l on ".rptx";
	setAttr -l on ".rpty";
	setAttr -l on ".rptz";
	setAttr ".sp" -type "double3" 0 -1.1102230246251563e-16 0 ;
	setAttr -l on ".sptx";
	setAttr -l on ".spty";
	setAttr -l on ".sptz";
	setAttr -l on ".internalName" -type "string" "fk_hips";
createNode nurbsCurve -n "fk_hipsShape" -p "fk_hips";
	rename -uid "8AF3796D-43AC-271E-28EF-D782A7317732";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-1.1803362372124175 -6.9290261005898843 -2.8015906558387096
		-4.3370034989809909 -1.7519861928663918 -4.0641958221907259
		4.3370034989809909 -1.7519861928663918 -4.0641958221907259
		1.181251438577736 -6.9290261005898843 -2.8015906558387096
		1.181251438577736 -6.9290261005898843 2.8825208749010889
		4.3370034989809909 -1.7519861928663918 4.5256589980729149
		-4.3370034989809909 -1.7519861928663918 4.5256589980729149
		-1.1803362372124175 -6.9290261005898843 2.8825208749010889
		-1.1820475326296631 -6.9290261005898843 -2.8015906558387096
		-4.3370034989809909 -1.7519861928663918 -4.0641958221907259
		-4.3370034989809909 -1.7519861928663918 4.5256589980729149
		-1.1803362372124175 -6.9290261005898843 2.8825208749010889
		1.181251438577736 -6.9290261005898843 2.8825208749010889
		4.3370034989809909 -1.7519861928663918 4.5256589980729149
		4.3370034989809909 -1.7519861928663918 -4.0641958221907259
		1.181251438577736 -6.9290261005898843 -2.8015906558387096
		-1.1803362372124175 -6.9290261005898843 -2.8015906558387096
		;
createNode transform -n "bendJoint_1_out" -p "fk_hips";
	rename -uid "6D12896E-417D-CCDB-5629-B8AD4E16881C";
	setAttr ".v" no;
createNode locator -n "bendJoint_1_outShape" -p "bendJoint_1_out";
	rename -uid "84495E32-430F-7BFF-BC49-9DA2733589D6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_ik_8" -p "fk_hips";
	rename -uid "C17250FE-45FF-9424-A5AD-62B1B8B738DC";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_3";
createNode nurbsCurve -n "local_ik_8Shape" -p "local_ik_8";
	rename -uid "08F23474-47D7-A1D8-A593-2F8723C6A002";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 -4.320624246345267e-15 7.7657918819355126e-32
		-1.1989615347515965 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 1.1989615347515965 7.7657918819355126e-32
		2.508767368544373e-15 -1.1989615347515965 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 -1.1989615347515965
		2.508767368544373e-15 -4.320624246345267e-15 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_0" -p "local_ik_8";
	rename -uid "F9E9ABAA-48C3-3FD7-AA16-C5975D2188B4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1.0000000000000007 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000007 1.0000000000000007 ;
createNode locator -n "bend_surfLoc_0Shape" -p "bend_surfLoc_0";
	rename -uid "8A99A9E9-421B-DEA1-B549-DEA6BD51DA37";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_1" -p "local_ik_8";
	rename -uid "9AC86710-49B7-4F5A-066A-7D9423EC3B6A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -1.0000000000000007 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000007 1.0000000000000007 ;
createNode locator -n "bend_surfLoc_1Shape" -p "bend_surfLoc_1";
	rename -uid "EA57251D-48ED-DAE3-B938-959B0B8CE751";
	setAttr -k off ".v";
createNode transform -n "local_ik_9" -p "fk_hips";
	rename -uid "01CD2777-481A-AC03-7C14-85A8D1A69D07";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_3";
createNode nurbsCurve -n "local_ik_9Shape" -p "local_ik_9";
	rename -uid "37C73307-4278-739A-D980-1ABDF07B4914";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 -4.320624246345267e-15 7.7657918819355126e-32
		-1.1989615347515965 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 1.1989615347515965 7.7657918819355126e-32
		2.508767368544373e-15 -1.1989615347515965 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 7.7657918819355126e-32
		2.508767368544373e-15 -4.320624246345267e-15 -1.1989615347515965
		2.508767368544373e-15 -4.320624246345267e-15 1.1989615347515965
		;
createNode transform -n "bend_surfLoc_2" -p "local_ik_9";
	rename -uid "11A2BC2F-4B9E-E6A5-201B-839707FFD9D8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1.0000000000000007 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000007 1.0000000000000007 ;
createNode locator -n "bend_surfLoc_2Shape" -p "bend_surfLoc_2";
	rename -uid "8B613E4F-4820-974B-D88F-5288C24A7DEE";
	setAttr -k off ".v";
createNode transform -n "bend_surfLoc_3" -p "local_ik_9";
	rename -uid "234947CA-4427-59B1-E959-E4B3D7F12F5E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -1.0000000000000007 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000007 1.0000000000000007 ;
createNode locator -n "bend_surfLoc_3Shape" -p "bend_surfLoc_3";
	rename -uid "59E462B1-455D-1109-141A-AEB4EBCE0667";
	setAttr -k off ".v";
createNode transform -n "chest_local_target" -p "ik_controls";
	rename -uid "662A6FEF-4039-4318-2255-E794F324FC7F";
	setAttr ".v" no;
createNode locator -n "chest_local_targetShape" -p "chest_local_target";
	rename -uid "037955FF-416D-E21C-65E8-EC9B959B92FD";
	setAttr -k off ".v";
createNode transform -n "mid_rotate_locator" -p "ik_controls";
	rename -uid "8CDB57CC-4B5A-A642-151E-F2B151B6F798";
	setAttr ".v" no;
createNode locator -n "mid_rotate_locatorShape" -p "mid_rotate_locator";
	rename -uid "D02278B6-4EE6-1F38-1E1E-6497AB3ABA1D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 4.7100000000000009 4.7100000000000009 4.7100000000000009 ;
createNode aimConstraint -n "locator1_aimConstraint1" -p "mid_rotate_locator";
	rename -uid "98FD0350-47D1-3FBE-8917-EDA88DD764A7";
	addAttr -dcb 0 -ci true -sn "w0" -ln "locator3W0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wu" -type "double3" 1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 -89.999999999999943 0 ;
	setAttr -k on ".w0";
createNode transform -n "system" -p "mod";
	rename -uid "425C5BC8-4007-736D-CDC0-C2870A98A214";
	setAttr ".v" no;
createNode transform -n "surf_joints" -p "system";
	rename -uid "12F71793-4423-C54A-13EC-C7AC49495F58";
	setAttr ".ovdt" 1;
	setAttr ".ovc" 15;
createNode joint -n "surf_1_jnt" -p "surf_joints";
	rename -uid "074937C4-49CA-D9A3-BC29-AA8B7EF9CFAD";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".it" no;
	setAttr ".smd" 7;
	setAttr ".radi" 2.4000000000000004;
createNode joint -n "surf_2_jnt" -p "surf_joints";
	rename -uid "B1255586-4F87-FF27-90DE-B09FF23C9E40";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".it" no;
	setAttr ".smd" 7;
	setAttr ".radi" 2.4000000000000004;
createNode joint -n "surf_3_jnt" -p "surf_joints";
	rename -uid "DD39EFA7-4E14-843D-E00D-07AF26031118";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".it" no;
	setAttr ".smd" 7;
	setAttr ".radi" 2.4000000000000004;
createNode joint -n "surf_4_jnt" -p "surf_joints";
	rename -uid "90B58C2C-4500-11BB-B57A-8CA7D9202FCE";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".it" no;
	setAttr ".smd" 7;
	setAttr ".radi" 2.4000000000000004;
createNode joint -n "surf_5_jnt" -p "surf_joints";
	rename -uid "CF1FCA28-47F1-852C-088E-588F6D3A2703";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".it" no;
	setAttr ".smd" 7;
	setAttr ".radi" 2.4000000000000004;
createNode transform -n "surf" -p "system";
	rename -uid "8ED631DE-426C-E6CA-BFF4-888391961A5B";
	setAttr ".rp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".sp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
createNode nurbsSurface -n "surfShape" -p "surf";
	rename -uid "37FBD00C-4ECA-34F0-1CC3-BFBC55B9D193";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 14 ".cp";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 2;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		2 0 1
		
		14
		0 0 0.99999999999999889
		0 0 -1.0000000000000007
		0 3.1658023944241118 0.99999999999999889
		0 3.1658023944241118 -1.0000000000000007
		0 6.3316047888482254 0.99999999999999933
		0 6.3316047888482254 -1.0000000000000002
		0 12.441273698943267 1
		0 12.441273638757222 -1
		0 17.437134799635935 0.99999999999999944
		0 17.437134799635935 -0.99999999999999878
		0 20.771800435175248 0.99999999999999978
		0 20.771800435175248 -0.99999999999999978
		0 24.106802179927694 1
		0 24.106802177018842 -1
		
		;
createNode transform -n "surfCurve" -p "system";
	rename -uid "8D8A1705-469E-6A58-FCA1-098A9CB32E85";
	setAttr ".v" no;
createNode nurbsCurve -n "surfCurveShape" -p "surfCurve";
	rename -uid "79CD2EFD-46E4-589D-ECA3-288181848A7F";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "output" -p "mod";
	rename -uid "D004D47A-40F7-DC39-8883-CE952F72F6FB";
createNode transform -n "outJoints" -p "output";
	rename -uid "58F73C13-44F8-B71A-F0C6-7C8807460BAF";
	setAttr ".ovdt" 1;
	setAttr ".ovc" 15;
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "939ABC2C-40D3-00FE-E979-8BAE3D13912F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -s 2 ".iog";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 0.99999999999999933 0.99999999999999933 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 5.8116296351744994e-16 1.3086626529693604 1.4529074087936241e-16 0
		 -4.3587222263808726e-16 0 1.3086626529693604 0 1.3086626529693604 -4.3587222263808726e-16 5.8116296351744994e-16 0
		 0 1.4381153442047454 -0.053282215027789577 1;
	setAttr ".radi" 5.2;
createNode joint -n "local_1_outJoint" -p "root_outJoint";
	rename -uid "89816955-4528-32AD-A9B8-89A4226984A4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr -s 2 ".iog";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 1;
	setAttr ".radi" 5.2;
	setAttr -k on ".pos" 0.135;
createNode joint -n "local_2_outJoint" -p "local_1_outJoint";
	rename -uid "7ECCED5F-4374-BAE1-03D8-78B7DB801A19";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.2779255513307275e-17 0.49999999999999994 3.4694469519536142e-17 1;
	setAttr ".radi" 5.2;
	setAttr -k on ".pos" 0.31000000000000005;
createNode joint -n "local_3_outJoint" -p "local_2_outJoint";
	rename -uid "FBE119BD-4687-9445-E77C-07A606F1FD52";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 1;
	setAttr ".radi" 5.2;
	setAttr -k on ".pos" 0.5;
createNode joint -n "local_4_outJoint" -p "local_3_outJoint";
	rename -uid "397D8543-4376-141D-40DC-6EB0B0EB8F40";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr ".radi" 5.2;
	setAttr -k on ".pos" 0.684;
createNode joint -n "local_5_outJoint" -p "local_4_outJoint";
	rename -uid "B2AAE9A7-42BE-33A6-26C1-DB8A31DC5BCF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr -s 2 ".iog";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr ".radi" 5.2;
	setAttr -k on ".pos" 0.873;
createNode joint -n "end_outJoint" -p "local_5_outJoint";
	rename -uid "6BC135C0-4800-E214-8B14-A7BB9C5CB66A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -s 2 ".iog";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".is" -type "double3" 1 1.0015161037445068 1.0015161037445068 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr ".radi" 5.2;
createNode transform -n "pCube1" -p "end_outJoint";
	rename -uid "CB86519C-4BCB-2CD3-DD89-D3BA4A8DF05D";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.563532250370526 2.563532250370526 2.563532250370526 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "AE4569A2-4FFB-5B45-1305-F58AA223A133";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube2" -p "local_5_outJoint";
	rename -uid "7C321BA4-4EEB-36CD-CCE0-7E9CAC5729A3";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.6066340092145022 2.6066340092145022 2.6066340092145022 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	rename -uid "4309CEA6-491A-D6F8-C426-D782BB8B3805";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube3" -p "local_4_outJoint";
	rename -uid "B85CFA9F-4B30-09EE-85F7-FEBB7D5A8B5E";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.6066340092145022 2.6066340092145022 2.6066340092145022 ;
createNode mesh -n "pCubeShape3" -p "pCube3";
	rename -uid "74D3875E-44C5-D20A-E163-CD9E5A6EC3BD";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube4" -p "local_3_outJoint";
	rename -uid "0944AF57-46B5-6E54-4E05-F1B8D5638725";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.6066340092145022 2.6066340092145022 2.6066340092145022 ;
createNode mesh -n "pCubeShape4" -p "pCube4";
	rename -uid "24664F89-4E74-BDC4-C302-F7AA53AA9F88";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube5" -p "local_2_outJoint";
	rename -uid "0101D39A-470B-17CB-DD5E-DD8897B50AB6";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.6066340092145022 2.6066340092145022 2.6066340092145022 ;
createNode mesh -n "pCubeShape5" -p "pCube5";
	rename -uid "4427048D-426E-7D58-6EA4-829A80736891";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube6" -p "local_1_outJoint";
	rename -uid "772C9973-42B5-C3EB-5A80-4F88D1B7D105";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.4821005861710419 2.4821005861710419 2.4821005861710419 ;
createNode mesh -n "pCubeShape6" -p "pCube6";
	rename -uid "EA1A593A-46C1-0C63-AFC2-9C9490D742CF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube7" -p "root_outJoint";
	rename -uid "DD0E049C-4EEF-5926-C19F-8B948F91B5F8";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 2.4821005861710419 2.4821005861710419 2.4821005861710419 ;
createNode mesh -n "pCubeShape7" -p "pCube7";
	rename -uid "1D66C30C-45E6-5151-0F73-8FAFB0B2C146";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -s -n "persp";
	rename -uid "742B74BF-4D6B-9A22-954F-B78DD4DB06E5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -60.81163293174771 16.750198866506359 4.0745938739577419 ;
	setAttr ".r" -type "double3" -11.399999999998007 -1167.5999999998587 1.8988089725382619e-14 ;
	setAttr ".rp" -type "double3" -3.3306690738754696e-16 -4.4408920985006262e-16 -1.7763568394002505e-15 ;
	setAttr ".rpt" -type "double3" -6.7928001781737458e-16 -1.7125212621107998e-16 3.3031043487526458e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "CA638930-4564-E4C8-E58E-CDA4DAE4DF36";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".cap" -type "double2" 1.41732 0.94488 ;
	setAttr ".pze" yes;
	setAttr ".coi" 68.852190334607812;
	setAttr ".imn" -type "string" "persp1";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 1.1102230246251565e-16 12.293827272770926 9.9920072216264089e-16 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "0CEE38C4-4E21-853D-1E5F-FC8B81451B34";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.12650853399096249 -13.395345390748739 -0.40080922627544646 ;
	setAttr ".r" -type "double3" 90 -450 0 ;
	setAttr ".rp" -type "double3" 3.1554436208840493e-30 -3.1554436208840493e-30 0 ;
	setAttr ".rpt" -type "double3" -3.1554436208840493e-30 -1.4012984643248171e-45 -2.1019476964872256e-45 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "3A50062F-4880-B8B1-298D-0CB583DE5701";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 3.0936925081170044;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "C360C1BB-4829-C934-1F92-03A5863E5AE1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.96336236579816403 9.4648406185763783 -37.657559315818858 ;
	setAttr ".r" -type "double3" 0 -900 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "27B1D1A3-4B73-C88A-EB3A-79899F2ABCE4";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 31.05545089349495;
	setAttr ".ow" 39.101022472202089;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 23.975970327630201 12.801040953176084 4.8572257327350599e-16 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "1BBA3B11-47C8-8626-D1B3-81BBC699DA24";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -37.246092276093385 7.6542364964824117 4.1294770284686004 ;
	setAttr ".r" -type "double3" 0 -1170 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "53E68386-4A18-3096-E9C3-E1A72D3BCDEB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 39.97788050018832;
	setAttr ".ow" 38.562916802592589;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 1.4210854715202004e-14 4.4168783651967223 -12.615016038623937 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "A06C98DA-4E7E-C280-6176-6FA8785BC034";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "AC797BAC-4B41-EEF9-E598-5A8825D47939";
	setAttr -s 25 ".lnk";
	setAttr -s 25 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "6A880636-4157-5B64-AC1E-A297FCE4A709";
createNode displayLayer -n "defaultLayer";
	rename -uid "B1DB931A-42AC-3765-6A0C-0E9123FB8239";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "9A470B6B-4FC2-F726-9DF2-C7A846D35E73";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "86635CA8-42FC-A04E-4E62-638EF51ABD39";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "97C93221-47CD-B990-D0E7-1FAD259A7C0C";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 100 -ast 0 -aet 1000 ";
	setAttr ".st" 6;
createNode objectSet -n "sets";
	rename -uid "0D4B12C4-429B-7034-133D-8CB6D334ACB9";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "moduleControlSet";
	rename -uid "62EE3B85-44A7-3BD7-1EE5-4388D2CBA37B";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr -s 3 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode condition -n "condition1";
	rename -uid "C9285224-4E2C-58C8-234F-86800B750113";
	setAttr ".ct" -type "float3" 1 1 0 ;
	setAttr ".cf" -type "float3" 0 0 1 ;
createNode condition -n "condition3";
	rename -uid "35E919D9-4F6E-BD08-6382-939EB332C78A";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "15B90130-40AF-BDBC-076A-028E1FDAAF76";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
createNode shadingEngine -n "red_rsSG";
	rename -uid "187C9389-47A6-D501-D574-6F8451DAEC5D";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "root_materialInfo1";
	rename -uid "EB20ACB9-45A0-F960-D9C1-8080E1CA3F06";
createNode shadingEngine -n "green_rsSG";
	rename -uid "3D80EE44-4C01-0912-0EEF-38876338CB6F";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "root_materialInfo2";
	rename -uid "C487490D-4264-4070-6DC7-7A88513ECA25";
createNode shadingEngine -n "blue_rsSG";
	rename -uid "D5970EF1-42B8-0118-4795-9996A634B86B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "root_materialInfo3";
	rename -uid "73A61BB9-46FA-65AD-5E50-84BC5C5BA4C8";
createNode shadingEngine -n "black_rsSG";
	rename -uid "EA1DEF5B-43CA-D55B-3730-33881A4A5520";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "spine_1_materialInfo7";
	rename -uid "919621E8-4EA4-51AE-6B22-8FBCEBF8ADE6";
createNode blendTwoAttr -n "squash_blendTwoAttr";
	rename -uid "769B0334-4EB0-4A81-EFE6-27BEB7B80A3E";
	addAttr -ci true -sn "const" -ln "const" -dv 1 -at "double";
	setAttr -s 2 ".i";
	setAttr -s 2 ".i";
	setAttr -k on ".const";
createNode reverse -n "reverse6";
	rename -uid "F598803D-4086-4348-9837-A6B25032925C";
createNode decomposeMatrix -n "spine_2_skinJoint_decMat";
	rename -uid "D172EA75-478E-9120-CCE7-7285AD7E4F02";
createNode multMatrix -n "spine_2_skinJoint_multMat";
	rename -uid "25A8D447-4967-E238-D9C4-8497E9290D8C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "spine_3_skinJoint_decMat";
	rename -uid "104B0C7F-4101-43D1-CB78-078941D47CA8";
createNode multMatrix -n "spine_3_skinJoint_multMat";
	rename -uid "5B05D33B-4FD0-36D9-709A-4A942C362CA9";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "spine_4_skinJoint_decMat";
	rename -uid "070D8BBB-4FC9-2F80-4F03-34A72397CE11";
createNode multMatrix -n "spine_4_skinJoint_multMat";
	rename -uid "FEF5E799-4159-B9CC-22D9-05849DB429BD";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "spine_5_skinJoint_decMat1";
	rename -uid "447982F0-4639-F373-A963-8AA6F5844925";
createNode multMatrix -n "spine_5_skinJoint_multMat1";
	rename -uid "4A0908FD-478A-CD4E-6939-FDAD608409A3";
	setAttr -s 2 ".i";
createNode multiplyDivide -n "multiplyDivide1853";
	rename -uid "25F697A8-4FC4-88FD-E8EC-A2A06675E7F9";
	setAttr ".op" 2;
createNode decomposeMatrix -n "spine_4_skinJoint_decMat1";
	rename -uid "0BDBCD83-429F-90DE-4494-9CB70FF39AE7";
createNode multMatrix -n "spine_4_skinJoint_multMat1";
	rename -uid "AC388731-497C-7D67-B0FC-29941466487C";
	setAttr -s 2 ".i";
createNode dagPose -n "bindPose5";
	rename -uid "BEDD78FE-4DB0-623E-160D-8FB41605EC96";
	setAttr -s 8 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 4.9999999999999973 0 0 0 0 4.9999999999999982 0 0
		 0 0 4.9999999999999991 0 -3.4694469519536142e-18 -0.18176299999999984 -2.3592239273284576e-16 1;
	setAttr ".wm[3]" -type "matrix" 2.2204460492503123e-15 4.9999999999999973 0 0 2.2204460492503123e-15 0 4.9999999999999991 0
		 4.9999999999999973 -2.2204460492503123e-15 -2.2204460492503127e-15 0 -1.7347234759768065e-17 2.2204460492503131e-16 -6.9388939039071446e-17 1;
	setAttr ".wm[4]" -type "matrix" 2.2204460492503123e-15 4.9999999999999982 0 0 -1.6081226496766362e-15 -2.7192621468937862e-31 -4.9999999999999991 0
		 -4.9999999999999973 2.2204460492503123e-15 1.6081226496766362e-15 0 -3.4775613731312552e-16 0.91077020994822155 1.6653345369377353e-16 1;
	setAttr ".wm[5]" -type "matrix" 2.2204460492503123e-15 4.9999999999999982 0 0 -1.6081226496766362e-15 -2.7192621468937862e-31 -4.9999999999999991 0
		 -4.9999999999999973 2.2204460492503123e-15 1.6081226496766362e-15 0 -4.2109255894334289e-16 1.8337918418248484 -5.5511151231257827e-17 1;
	setAttr ".wm[6]" -type "matrix" 2.2204460492503123e-15 4.9999999999999982 0 0 -1.6081226496766362e-15 -2.7192621468937862e-31 -4.9999999999999991 0
		 -4.9999999999999973 2.2204460492503123e-15 1.6081226496766362e-15 0 2.9174204210537234e-16 2.8350894552866599 -1.1934897514720433e-15 1;
	setAttr ".wm[7]" -type "matrix" 2.2204460492503123e-15 4.9999999999999982 0 0 -1.6081226496766362e-15 -2.7192621468937862e-31 -4.9999999999999991 0
		 -4.9999999999999973 2.2204460492503123e-15 1.6081226496766362e-15 0 1.6055377955678507e-15 3.7581110871632881 -2.8588242884097781e-15 1;
	setAttr -s 8 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 4.9999999999999973 4.9999999999999982 4.9999999999999991 0
		 0 0 0 -3.4694469519536142e-18 -0.18176299999999984 -2.3592239273284576e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.99999999999999989 1 1 1.570796326794897
		 0 1.5707963267948959 0 -2.7755575615628919e-18 0.036352600000000027 3.3306690738754868e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 3.1415926535897931 8.8817841970012504e-16
		 1.1102230246251521e-16 0 0.18215404198964436 4.7184478546568942e-17 -1.4697442508884782e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 1.144237745221954e-17 3.5707495841844308e-32
		 1.110223024625156e-16 0 0.18460432637532545 4.4408920985006313e-17 9.6648073760964838e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 -5.4366913486035887e-16 6.6613381477509402e-16
		 -2.1424497505106634e-31 0 0.20025952269236241 2.2759572004815712e-16 -5.3633827012341297e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 -1.098780647172937e-15 9.9920072216264089e-16
		 1.1102230246251532e-16 0 0.18460432637532564 3.3306690738754701e-16 -1.8077836125757457e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 8 ".m";
	setAttr -s 8 ".p";
	setAttr -s 8 ".g[0:7]" yes yes yes no no no no no;
	setAttr ".bp" yes;
createNode reverse -n "reverse8";
	rename -uid "C4C9AC8F-43AA-21EB-B5CB-74A156680DD5";
createNode multMatrix -n "multMatrix68";
	rename -uid "959C3EEE-4654-561E-A31F-2A870AE59FCB";
createNode decomposeMatrix -n "decomposeMatrix88";
	rename -uid "F061D0DC-42A2-AF9F-D5E9-5F97229A1FB3";
createNode unitConversion -n "unitConversion32";
	rename -uid "0F618B47-4BB8-05D4-CFE8-289BDF98DB4D";
	setAttr ".cf" -0.2;
createNode unitConversion -n "unitConversion33";
	rename -uid "37B3355A-4FDA-D13A-5C11-5293F4BA72A4";
	setAttr ".cf" 0.2;
createNode decomposeMatrix -n "decomposeMatrix89";
	rename -uid "7C4196B3-45E4-5976-E5D9-3D98C0A49116";
createNode unitConversion -n "unitConversion34";
	rename -uid "CA0D6F59-480D-C2E8-DFC2-BA87E8425D92";
	setAttr ".cf" -0.15;
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "03C28968-49AB-9C9D-ACA2-D2B2529BD76E";
	setAttr ".ihi" 2;
createNode unitConversion -n "unitConversion35";
	rename -uid "A4D4C2B1-482D-E09A-06B6-A4BF9871DD44";
	setAttr ".cf" 0.15;
createNode addDoubleLinear -n "addDoubleLinear2";
	rename -uid "8C32E528-46AB-89DF-9AD7-26B5568FDD8D";
	setAttr ".ihi" 2;
createNode multMatrix -n "multMatrix69";
	rename -uid "7005723D-42FF-9680-E640-E3B5E29A0174";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix90";
	rename -uid "6E6C486F-4B27-9D82-B112-C7B3584926BF";
createNode distanceBetween -n "distanceBetween1";
	rename -uid "1550D95F-4C90-5511-76CC-2485EECE710B";
createNode multDoubleLinear -n "multDoubleLinear14";
	rename -uid "BE524ADC-4DC0-A6FC-DDD7-24AA841854D5";
createNode condition -n "mirror_condition";
	rename -uid "E43FA756-4ED4-EB80-67FD-5F945C8C22D0";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
createNode multiplyDivide -n "multiplyDivide1854";
	rename -uid "B7654F7E-4A40-D595-A946-CE9FF2AA7E8D";
	setAttr ".i2" -type "float3" 0 -0.21000001 0 ;
createNode plusMinusAverage -n "plusMinusAverage2";
	rename -uid "0D610D8F-4276-B68B-4B3D-ACB8F90694A4";
	setAttr ".op" 2;
	setAttr -s 2 ".i3[0:1]" -type "float3"  1.78404379 5 1.15637338 0
		 0 0;
createNode shadingEngine -n "spine_4_poser_surfaceShader1SG";
	rename -uid "6A7CCDDA-4D56-A743-C613-F2B7DB2F03E2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4_poser";
createNode materialInfo -n "spine_4_poser_materialInfo1";
	rename -uid "22C58CA2-4C12-48F9-459F-C1B7406326F9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4_poser";
createNode shadingEngine -n "spine_4_poser_surfaceShader2SG";
	rename -uid "AB280AC6-4999-8D02-1D01-F187C8834AD5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4_poser";
createNode materialInfo -n "spine_4_poser_materialInfo2";
	rename -uid "831345FE-44FC-F27F-7592-DF9557DB7861";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4_poser";
createNode shadingEngine -n "spine_4_poser_surfaceShader3SG";
	rename -uid "A1A8C39B-47EB-A284-42D9-7A9821B21A26";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4_poser";
createNode materialInfo -n "spine_4_poser_materialInfo3";
	rename -uid "A382C741-4274-C4DC-44B1-9EA060742AD5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4_poser";
createNode shadingEngine -n "spine_3_surfaceShader1SG";
	rename -uid "F2B4A8E1-4D02-A9D9-9050-AE9D69D0C9DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode materialInfo -n "spine_3_materialInfo1";
	rename -uid "0295C2DE-4005-33D9-485D-D7BA360B74EC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode shadingEngine -n "spine_3_surfaceShader1SG1";
	rename -uid "22EB9AE6-4C2F-193A-3092-B2826886A3D9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode materialInfo -n "spine_3_materialInfo2";
	rename -uid "B245A8C7-401D-F6E6-B965-1DA3A34DF1CE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode shadingEngine -n "spine_3_surfaceShader2SG";
	rename -uid "7B5C5707-4B57-70B9-23EA-54B4FFDC54A8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode materialInfo -n "spine_3_materialInfo3";
	rename -uid "1E7F2025-48CB-D0D9-9623-DF958901DF22";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode shadingEngine -n "spine_3_surfaceShader3SG";
	rename -uid "2FD46B77-4720-472C-BCCE-0FA90DFE4D60";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode materialInfo -n "spine_3_materialInfo4";
	rename -uid "795F7A66-4A18-A71E-F2A6-C4ADD3A81DD4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_3";
createNode shadingEngine -n "spine_4_surfaceShader1SG";
	rename -uid "2FCA63A8-4767-204B-E3AA-428049EF486C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode materialInfo -n "spine_4_materialInfo1";
	rename -uid "516A1A07-42A9-4E34-96BB-BB9AAC188998";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode shadingEngine -n "spine_4_surfaceShader2SG";
	rename -uid "4DC7C96D-4DA7-9046-E19D-5CBC4E092ED1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode materialInfo -n "spine_4_materialInfo2";
	rename -uid "F1D16B88-46C1-8472-13EC-72A38E977628";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode shadingEngine -n "spine_4_surfaceShader3SG";
	rename -uid "A6422DEA-4532-97A0-F11D-9EA30B5BA03D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode materialInfo -n "spine_4_materialInfo3";
	rename -uid "24706592-4FC1-8B25-7809-F2BB8BFDD5FD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode shadingEngine -n "spine_4_surfaceShader1SG1";
	rename -uid "97012FA5-4F19-5CBD-3049-959632EC55DD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode materialInfo -n "spine_4_materialInfo4";
	rename -uid "C134715C-42BE-6A3B-F7BF-4D99A42BA433";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode shadingEngine -n "spine_5_surfaceShader1SG";
	rename -uid "27B26EAC-4441-279C-5D12-BF9D28B12FF1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode materialInfo -n "spine_5_materialInfo1";
	rename -uid "A6049297-46CE-D1B9-BA86-DF8428A16058";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode shadingEngine -n "spine_5_surfaceShader2SG";
	rename -uid "BFF9CA44-4DD1-33B8-E008-1B86E967BD7F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode materialInfo -n "spine_5_materialInfo2";
	rename -uid "B6DB49D7-48BF-9743-EB2F-018FB0C1A38B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode shadingEngine -n "spine_5_surfaceShader3SG";
	rename -uid "C604B98C-4DD9-60B6-CBCE-D99B31FD2206";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode materialInfo -n "spine_5_materialInfo3";
	rename -uid "BE748B3E-4B6A-A366-1C81-44B7A091D589";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode shadingEngine -n "spine_5_surfaceShader1SG1";
	rename -uid "69EDD237-4BB4-CA71-FBD3-67B734E7FCE3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode materialInfo -n "spine_5_materialInfo4";
	rename -uid "6D17F117-425B-E8FA-DA5C-60B7C44453F9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode shadingEngine -n "end_surfaceShader1SG";
	rename -uid "CC235721-46CD-4F6B-50C7-55BC2F3398CD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "end";
createNode materialInfo -n "end_materialInfo1";
	rename -uid "5E0390EB-4B9A-3F2F-13EB-B0A25B8908DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "end";
createNode shadingEngine -n "end_surfaceShader1SG1";
	rename -uid "029130BB-427F-B6FD-A4F8-C095610904DC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "end";
createNode materialInfo -n "end_materialInfo2";
	rename -uid "557298B9-4BD4-644C-5006-ED9C7300AB39";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "end";
createNode shadingEngine -n "end_surfaceShader1SG2";
	rename -uid "96AA2019-40F3-2076-2035-C0A9094171BB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "end";
createNode materialInfo -n "end_materialInfo3";
	rename -uid "4E28F502-496D-9784-2113-0380F9A4EF4B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "end";
createNode multMatrix -n "multMatrix70";
	rename -uid "0F14F30F-4BEE-CC31-13B8-21A2132D820E";
createNode objectSet -n "local_moduleControlSet";
	rename -uid "B9149EDE-47BC-5686-13D4-FAB45BFDFBB7";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode distanceBetween -n "distanceBetween2";
	rename -uid "E436C941-4F77-D899-ACBE-CB95BB7E3668";
createNode multDoubleLinear -n "curDistance_part_3";
	rename -uid "A4735617-40E1-8967-7803-C39D0D159CF0";
	setAttr ".i2" 0.17;
createNode multMatrix -n "end_multMatrix1";
	rename -uid "7CA88CDC-43B4-CEE8-D529-3880D569445C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "end_decomposeMatrix1";
	rename -uid "92EBAE6E-4704-1AA4-E0C9-64BE2485CDC5";
createNode distanceBetween -n "distanceBetween3";
	rename -uid "A520ED76-4237-F99E-1B68-D3B2F46E1F40";
createNode decomposeMatrix -n "local_end_outJoint_decMat";
	rename -uid "3CBB290A-4EE5-8595-670D-E98496608DBC";
createNode multMatrix -n "local_end_outJoint_multMat";
	rename -uid "D22EB26C-4F6E-69DA-D796-95B2CB71D488";
	setAttr -s 2 ".i";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "6E32B214-4C9A-8B43-438A-80BF698170F4";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "41DCE932-4CBB-5EE5-D5A9-179F10419E7C";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "8DBE1D78-4612-053F-6D5F-088A4D6E19AF";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "makeNurbSphere4";
	rename -uid "6A0FBC52-406C-EE0E-4C19-90A2381268CE";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "makeNurbSphere5";
	rename -uid "EDEA4F28-46B9-719B-A8B5-E7A0050C6344";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "makeNurbSphere6";
	rename -uid "ED7CB55B-4E02-584D-0660-2E92117060CB";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "8856643D-48D4-3DB0-AB84-68A5556A5F1C";
createNode multiplyDivide -n "size_multiplyDivide1";
	rename -uid "41060A5E-4843-5F18-6C24-9AB70F81AE74";
createNode decomposeMatrix -n "root_connector_decMat";
	rename -uid "97427CA4-45CE-6C4D-6ADC-AF818E61FDA6";
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "E06E584E-4F44-08F7-202C-62A9DF3268E5";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "C8562179-48C0-C6E6-EC2D-C98541679724";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "1B275863-440D-ACE7-2228-B4AA3286DE91";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "4CBD4363-44A7-072F-449B-C19F3BB5A2E0";
createNode multiplyDivide -n "size_multiplyDivide2";
	rename -uid "6E7D770B-40F8-7736-8F57-758A20381435";
createNode makeNurbSphere -n "makeNurbSphere7";
	rename -uid "4DB49BAA-4AFF-D2AA-7FEB-42B04108499D";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "96D17248-4392-5B22-1222-C1BBF0D4D123";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 3162.0788522829125 -742.01506923738589 ;
	setAttr ".tgi[0].vh" -type "double2" 8207.4232123874026 829.26825973076689 ;
	setAttr ".tgi[0].ni[0].x" 1441.4285888671875;
	setAttr ".tgi[0].ni[0].y" 120;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode shadingEngine -n "blinn1SG";
	rename -uid "757796D9-442E-B442-1B72-5888DCF18746";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "F030C738-4C56-D5E5-E77E-1BBB2CAC0EAD";
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "B3BD5320-45EB-ADD9-39D6-8AADDF9D2C96";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationMode" 2;
	setAttr ".interpolationSteps" 1;
	setAttr ".interpolationDistance" 3;
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "C893E999-4901-2165-1997-BE9B69AEABFA";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix92";
	rename -uid "35B9A3F7-48D0-5AD8-90FF-9D9B75EA2569";
createNode multMatrix -n "multMatrix72";
	rename -uid "A6E40297-43AF-9468-B412-16BE8A2F016D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix91";
	rename -uid "C39D0374-429A-74D6-9099-86A50A6742B9";
createNode multMatrix -n "multMatrix71";
	rename -uid "C50413DC-4EB8-68A7-8A20-54B6793C99E9";
	setAttr -s 2 ".i";
createNode objectSet -n "skinJointsSet";
	rename -uid "21F37984-4ADA-439C-E3EF-C3B6C988AE7B";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
createNode multDoubleLinear -n "multDoubleLinear15";
	rename -uid "EC959A45-4DC6-AE4B-69F3-CEA500AA2097";
	setAttr ".i2" 1;
createNode multMatrix -n "multMatrix80";
	rename -uid "84914098-44D2-0D4A-40A0-B4AE9B81B71C";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix81";
	rename -uid "968CFF0E-4460-B4F3-F3DE-07A90402B0A7";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix82";
	rename -uid "3645A11A-4165-472B-870B-BBA3BF8D1B27";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix83";
	rename -uid "AC21129C-475E-4C3C-80B5-8983C3BA9990";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix84";
	rename -uid "20D28560-45FD-D4CE-E7B4-82A8AFF45DC7";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix85";
	rename -uid "49B5991B-41A6-EA80-7353-CEA98652F5CC";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix1";
	rename -uid "113151B1-465F-0D3C-BD0F-48AAE058F782";
createNode multMatrix -n "multMatrix86";
	rename -uid "DB45DEB7-4F48-1D6C-5654-DA87F4B3CEF3";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix2";
	rename -uid "CD98C370-4BF6-0EBA-AD83-3B9C28314F13";
createNode multMatrix -n "multMatrix87";
	rename -uid "580B7C21-46B6-9202-0573-8D9B3287B9E4";
	setAttr -s 2 ".i";
createNode reverse -n "reverse9";
	rename -uid "2581C3C7-4A13-3E8F-3CEC-5F93976B8F35";
createNode blendMatrix -n "blendMatrix6";
	rename -uid "9B8AAAF6-4056-7C6B-5E5E-84A85E875A9E";
	setAttr ".env" 0.5;
	setAttr ".imat" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 0 0 0 1;
createNode blendMatrix -n "blendMatrix7";
	rename -uid "7663956E-458C-B1E8-35AB-36B41E9447AE";
	setAttr ".env" 0.5;
createNode multMatrix -n "multMatrix89";
	rename -uid "474762A6-404B-B113-8495-C8843A83C841";
	setAttr -s 2 ".i";
createNode inverseMatrix -n "inverseMatrix1";
	rename -uid "9A5D975A-4A91-6DB8-7CB6-21899855A7C8";
createNode plusMinusAverage -n "plusMinusAverage3";
	rename -uid "A4889F6D-42F5-A154-60A7-BF97D596AC9B";
	setAttr ".op" 3;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multMatrix -n "multMatrix90";
	rename -uid "1778B54A-44AF-FF27-C2E8-7D80A6EC4224";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix91";
	rename -uid "D4896860-4715-DF1B-A0D9-019F19ADB2F5";
	setAttr -s 2 ".i";
createNode uvPin -n "uvPin";
	rename -uid "EE511444-4FCA-2BE1-6611-AF8ECB8471EE";
	setAttr -s 5 ".coord[0:4]" -type "double2" 0.135 0.5 0.31000000000000005 
		0.5 0.5 0.49999999999375994 0.684 0.50000000001818978 0.873 0.50000000000158495;
	setAttr -s 5 ".coord";
	setAttr ".msn" -type "string" "";
	setAttr ".nrm" 1;
	setAttr ".tng" 0;
	setAttr -s 5 ".omat";
createNode uvPin -n "init_uvPin";
	rename -uid "4793667B-4D4E-707D-C02E-CAA5D91418C8";
	setAttr -s 5 ".coord[0:4]" -type "double2" 0.135 0.5 0.31000000000000005 
		0.5 0.5 0.5 0.684 0.5 0.873 0.5;
	setAttr -s 5 ".coord";
	setAttr ".msn" -type "string" "";
	setAttr ".tng" 1;
	setAttr -s 5 ".omat";
createNode multiplyDivide -n "multiplyDivide1855";
	rename -uid "AFF7FA3F-45DA-2CF7-7662-60BAF6104295";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide1856";
	rename -uid "EDB41D77-4744-F974-6ABB-1F83673FAEFD";
	setAttr ".op" 2;
createNode decomposeMatrix -n "decomposeMatrix93";
	rename -uid "55F2AA48-42FA-F8B6-5730-F393C586C129";
createNode curveFromSurfaceIso -n "curveFromSurfaceIso1";
	rename -uid "8AF0D9B5-4DEA-F57A-6A4F-D29589A8FC99";
	setAttr ".ihi" 1;
	setAttr ".max" 0;
	setAttr ".iv" 0.5;
createNode curveInfo -n "curveInfo1";
	rename -uid "8476FFD0-436F-2471-6011-5E974FC24585";
createNode curveFromSurfaceIso -n "curveFromSurfaceIso2";
	rename -uid "7DEFC922-4C1A-5552-4D52-DA911236D121";
	setAttr ".ihi" 1;
	setAttr ".max" 0;
	setAttr ".iv" 0.46586969255313598;
createNode curveInfo -n "curveInfo2";
	rename -uid "864207F6-40AC-7126-BD87-F982322ECFDB";
createNode multMatrix -n "multMatrix92";
	rename -uid "5225AB9A-4B08-1673-61C3-AFB7D64F6A4D";
	setAttr -s 2 ".i";
createNode inverseMatrix -n "inverseMatrix2";
	rename -uid "96E187A4-4D4E-E20B-A41A-CDA540CC3FF4";
createNode polyCube -n "polyCube1";
	rename -uid "32223BC1-4C73-345E-4764-80B7AE3B511F";
	setAttr ".cuv" 4;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "FB1CA4C5-4D12-86F0-F516-F7915EDD3F81";
	setAttr -s 4 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 12826.18996652348 -6602.9698707222806 ;
	setAttr ".tgi[0].vh" -type "double2" 14205.951816458573 -4894.6487200224519 ;
	setAttr -s 23 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 12458.5712890625;
	setAttr ".tgi[0].ni[0].y" -6330;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 12458.5712890625;
	setAttr ".tgi[0].ni[1].y" -5924.28564453125;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 12458.5712890625;
	setAttr ".tgi[0].ni[2].y" -5010;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 12458.5712890625;
	setAttr ".tgi[0].ni[3].y" -5111.4287109375;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 12458.5712890625;
	setAttr ".tgi[0].ni[4].y" -6025.71435546875;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 13687.142578125;
	setAttr ".tgi[0].ni[5].y" -5605.71435546875;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" 12458.5712890625;
	setAttr ".tgi[0].ni[6].y" -5314.28564453125;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 12458.5712890625;
	setAttr ".tgi[0].ni[7].y" -5618.5712890625;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" 12458.5712890625;
	setAttr ".tgi[0].ni[8].y" -5212.85693359375;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" 12458.5712890625;
	setAttr ".tgi[0].ni[9].y" -5822.85693359375;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" 13687.142578125;
	setAttr ".tgi[0].ni[10].y" -5504.28564453125;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 13355.7236328125;
	setAttr ".tgi[0].ni[11].y" -5751.15771484375;
	setAttr ".tgi[0].ni[11].nvs" 18305;
	setAttr ".tgi[0].ni[12].x" 13687.142578125;
	setAttr ".tgi[0].ni[12].y" -5402.85693359375;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" 12458.5712890625;
	setAttr ".tgi[0].ni[13].y" -5517.14306640625;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" 13687.142578125;
	setAttr ".tgi[0].ni[14].y" -5910;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" 12458.5712890625;
	setAttr ".tgi[0].ni[15].y" -6127.14306640625;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" 12458.5712890625;
	setAttr ".tgi[0].ni[16].y" -6228.5712890625;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" 13687.142578125;
	setAttr ".tgi[0].ni[17].y" -5707.14306640625;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" 13354.7900390625;
	setAttr ".tgi[0].ni[18].y" -5469.1337890625;
	setAttr ".tgi[0].ni[18].nvs" 18305;
	setAttr ".tgi[0].ni[19].x" 12458.5712890625;
	setAttr ".tgi[0].ni[19].y" -5415.71435546875;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" 12913.23828125;
	setAttr ".tgi[0].ni[20].y" -5554.22216796875;
	setAttr ".tgi[0].ni[20].nvs" 18305;
	setAttr ".tgi[0].ni[21].x" 13687.142578125;
	setAttr ".tgi[0].ni[21].y" -5808.5712890625;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" 12458.5712890625;
	setAttr ".tgi[0].ni[22].y" -5721.4287109375;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" 8943.8574397759021 -7239.2854266223576 ;
	setAttr ".tgi[1].vh" -type "double2" 10187.094180980766 -5699.9997735023599 ;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" 4506.9790001484262 -7354.4476591534094 ;
	setAttr ".tgi[2].vh" -type "double2" 5606.7291422752296 -5743.6579244973755 ;
	setAttr -s 19 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 2591.428466796875;
	setAttr ".tgi[2].ni[0].y" -6638.5712890625;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" 2591.428466796875;
	setAttr ".tgi[2].ni[1].y" -6841.4287109375;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 2912.857177734375;
	setAttr ".tgi[2].ni[2].y" -6688.5712890625;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" 5062.85693359375;
	setAttr ".tgi[2].ni[3].y" -7204.28564453125;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" 3527.142822265625;
	setAttr ".tgi[2].ni[4].y" -6714.28564453125;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" 3220;
	setAttr ".tgi[2].ni[5].y" -6688.5712890625;
	setAttr ".tgi[2].ni[5].nvs" 18304;
	setAttr ".tgi[2].ni[6].x" 4755.71435546875;
	setAttr ".tgi[2].ni[6].y" -6665.71435546875;
	setAttr ".tgi[2].ni[6].nvs" 18304;
	setAttr ".tgi[2].ni[7].x" 2605.71435546875;
	setAttr ".tgi[2].ni[7].y" -6841.4287109375;
	setAttr ".tgi[2].ni[7].nvs" 18304;
	setAttr ".tgi[2].ni[8].x" 5062.85693359375;
	setAttr ".tgi[2].ni[8].y" -7074.28564453125;
	setAttr ".tgi[2].ni[8].nvs" 18304;
	setAttr ".tgi[2].ni[9].x" 4794.4580078125;
	setAttr ".tgi[2].ni[9].y" -6235.208984375;
	setAttr ".tgi[2].ni[9].nvs" 18305;
	setAttr ".tgi[2].ni[10].x" 4448.5712890625;
	setAttr ".tgi[2].ni[10].y" -6598.5712890625;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" 2912.857177734375;
	setAttr ".tgi[2].ni[11].y" -6790;
	setAttr ".tgi[2].ni[11].nvs" 18304;
	setAttr ".tgi[2].ni[12].x" 3220;
	setAttr ".tgi[2].ni[12].y" -6587.14306640625;
	setAttr ".tgi[2].ni[12].nvs" 18304;
	setAttr ".tgi[2].ni[13].x" 2605.71435546875;
	setAttr ".tgi[2].ni[13].y" -6942.85693359375;
	setAttr ".tgi[2].ni[13].nvs" 18304;
	setAttr ".tgi[2].ni[14].x" 4141.4287109375;
	setAttr ".tgi[2].ni[14].y" -6585.71435546875;
	setAttr ".tgi[2].ni[14].nvs" 18304;
	setAttr ".tgi[2].ni[15].x" 2605.71435546875;
	setAttr ".tgi[2].ni[15].y" -6638.5712890625;
	setAttr ".tgi[2].ni[15].nvs" 18304;
	setAttr ".tgi[2].ni[16].x" 4799.83203125;
	setAttr ".tgi[2].ni[16].y" -6113.4453125;
	setAttr ".tgi[2].ni[16].nvs" 18304;
	setAttr ".tgi[2].ni[17].x" 5308.2353515625;
	setAttr ".tgi[2].ni[17].y" -6241.9326171875;
	setAttr ".tgi[2].ni[17].nvs" 18305;
	setAttr ".tgi[2].ni[18].x" 2605.71435546875;
	setAttr ".tgi[2].ni[18].y" -6740;
	setAttr ".tgi[2].ni[18].nvs" 18304;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" 2099.2482568912715 -3998.4827024689107 ;
	setAttr ".tgi[3].vh" -type "double2" 3320.8668267889207 -2209.1938661420968 ;
	setAttr -s 23 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 1657.142822265625;
	setAttr ".tgi[3].ni[0].y" -3440;
	setAttr ".tgi[3].ni[0].nvs" 18304;
	setAttr ".tgi[3].ni[1].x" 2852.203857421875;
	setAttr ".tgi[3].ni[1].y" -3750.2177734375;
	setAttr ".tgi[3].ni[1].nvs" 18304;
	setAttr ".tgi[3].ni[2].x" 2292.67919921875;
	setAttr ".tgi[3].ni[2].y" -3808.390869140625;
	setAttr ".tgi[3].ni[2].nvs" 18304;
	setAttr ".tgi[3].ni[3].x" 3209.20361328125;
	setAttr ".tgi[3].ni[3].y" -3842.6953125;
	setAttr ".tgi[3].ni[3].nvs" 18304;
	setAttr ".tgi[3].ni[4].x" 1697.3936767578125;
	setAttr ".tgi[3].ni[4].y" -3944.647705078125;
	setAttr ".tgi[3].ni[4].nvs" 18305;
	setAttr ".tgi[3].ni[5].x" 2263.25537109375;
	setAttr ".tgi[3].ni[5].y" -3675.245849609375;
	setAttr ".tgi[3].ni[5].nvs" 18304;
	setAttr ".tgi[3].ni[6].x" 2616.98583984375;
	setAttr ".tgi[3].ni[6].y" -3731.419189453125;
	setAttr ".tgi[3].ni[6].nvs" 18305;
	setAttr ".tgi[3].ni[7].x" 2908.4365234375;
	setAttr ".tgi[3].ni[7].y" -3197.954345703125;
	setAttr ".tgi[3].ni[7].nvs" 18305;
	setAttr ".tgi[3].ni[8].x" 2574.48486328125;
	setAttr ".tgi[3].ni[8].y" -3147.756591796875;
	setAttr ".tgi[3].ni[8].nvs" 18305;
	setAttr ".tgi[3].ni[9].x" 1624.2164306640625;
	setAttr ".tgi[3].ni[9].y" -3049.448974609375;
	setAttr ".tgi[3].ni[9].nvs" 18305;
	setAttr ".tgi[3].ni[10].x" 3500;
	setAttr ".tgi[3].ni[10].y" -3527.142822265625;
	setAttr ".tgi[3].ni[10].nvs" 18305;
	setAttr ".tgi[3].ni[11].x" 2566.3115234375;
	setAttr ".tgi[3].ni[11].y" -3551.686279296875;
	setAttr ".tgi[3].ni[11].nvs" 18304;
	setAttr ".tgi[3].ni[12].x" 3512.260009765625;
	setAttr ".tgi[3].ni[12].y" -3181.2529296875;
	setAttr ".tgi[3].ni[12].nvs" 18305;
	setAttr ".tgi[3].ni[13].x" 3830.028076171875;
	setAttr ".tgi[3].ni[13].y" -3214.763671875;
	setAttr ".tgi[3].ni[13].nvs" 18304;
	setAttr ".tgi[3].ni[14].x" 3826.7587890625;
	setAttr ".tgi[3].ni[14].y" -3584.35595703125;
	setAttr ".tgi[3].ni[14].nvs" 18304;
	setAttr ".tgi[3].ni[15].x" 2903.224365234375;
	setAttr ".tgi[3].ni[15].y" -2968.464111328125;
	setAttr ".tgi[3].ni[15].nvs" 18304;
	setAttr ".tgi[3].ni[16].x" 3196.94384765625;
	setAttr ".tgi[3].ni[16].y" -3330.0703125;
	setAttr ".tgi[3].ni[16].nvs" 18304;
	setAttr ".tgi[3].ni[17].x" 2869.36767578125;
	setAttr ".tgi[3].ni[17].y" -3536.974365234375;
	setAttr ".tgi[3].ni[17].nvs" 18304;
	setAttr ".tgi[3].ni[18].x" 1955.3536376953125;
	setAttr ".tgi[3].ni[18].y" -3270.221923828125;
	setAttr ".tgi[3].ni[18].nvs" 18305;
	setAttr ".tgi[3].ni[19].x" 3219.8291015625;
	setAttr ".tgi[3].ni[19].y" -3028.555419921875;
	setAttr ".tgi[3].ni[19].nvs" 18305;
	setAttr ".tgi[3].ni[20].x" 3196.12646484375;
	setAttr ".tgi[3].ni[20].y" -3536.2763671875;
	setAttr ".tgi[3].ni[20].nvs" 18305;
	setAttr ".tgi[3].ni[21].x" 2269.7939453125;
	setAttr ".tgi[3].ni[21].y" -3296.133544921875;
	setAttr ".tgi[3].ni[21].nvs" 18304;
	setAttr ".tgi[3].ni[22].x" 1974.2818603515625;
	setAttr ".tgi[3].ni[22].y" -3660.689697265625;
	setAttr ".tgi[3].ni[22].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av -k on ".unw";
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -k on ".lm";
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -k on ".sslt";
	setAttr -k on ".cbr";
	setAttr -k on ".bbr";
	setAttr -av -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -av -k on ".hwi";
	setAttr -k on ".csvd";
	setAttr -av ".ta";
	setAttr -av ".tq";
	setAttr -k on ".ts";
	setAttr -av ".etmr" no;
	setAttr -av ".tmr" 4096;
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -k on ".aofr";
	setAttr -av ".aosm";
	setAttr -av -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av ".mbe";
	setAttr -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".mbsc";
	setAttr -k on ".mbc";
	setAttr -k on ".mbfa";
	setAttr -k on ".mbftb";
	setAttr -k on ".mbftg";
	setAttr -k on ".mbftr";
	setAttr -k on ".mbfta";
	setAttr -k on ".mbfe";
	setAttr -k on ".mbme";
	setAttr -k on ".mbcsx";
	setAttr -k on ".mbcsy";
	setAttr -k on ".mbasx";
	setAttr -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av ".msaa";
	setAttr -av ".aasc";
	setAttr -k on ".aasq";
	setAttr -k on ".laa";
	setAttr -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 25 ".st";
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
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 46 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".r";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -s 9 ".dsm";
	setAttr -k on ".mwc";
	setAttr -av -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -k on ".hio";
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".macc";
	setAttr -av -k on ".macd";
	setAttr -av -k on ".macq";
	setAttr -av -k on ".mcfr" 25;
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -k on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs" 1;
	setAttr -av -k on ".ef" 10;
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep" 1;
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -cb on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -av -cb on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -k on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -k on ".ope";
	setAttr -av -k on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w" 640;
	setAttr -av -k on ".h" 480;
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar" 1.3333332538604736;
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
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
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k off -cb on ".ctrs" 256;
	setAttr -av -k off -cb on ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -av -k on ".hwcc";
	setAttr -av -k on ".hwdp";
	setAttr -av -k on ".hwql";
	setAttr -av -k on ".hwfr" 25;
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "makeNurbSphere7.os" "root_poserShape.cr";
connectAttr "makeNurbSphere1.os" "end_poserShape.cr";
connectAttr "end_poserOrient_aimConstraint1.crx" "end_poserOrient.rx";
connectAttr "end_poserOrient_aimConstraint1.cry" "end_poserOrient.ry";
connectAttr "end_poserOrient_aimConstraint1.crz" "end_poserOrient.rz";
connectAttr "end_poserOrient.pim" "end_poserOrient_aimConstraint1.cpim";
connectAttr "end_poserOrient.t" "end_poserOrient_aimConstraint1.ct";
connectAttr "end_poserOrient.rp" "end_poserOrient_aimConstraint1.crp";
connectAttr "end_poserOrient.rpt" "end_poserOrient_aimConstraint1.crt";
connectAttr "end_poserOrient.ro" "end_poserOrient_aimConstraint1.cro";
connectAttr "root_poser.t" "end_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "end_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "end_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "end_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "end_poserOrient_aimConstraint1.w0" "end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "end_poserOrient_aimConstraint1.wum";
connectAttr "local_1_poser_group_pointConstraint1.ctx" "local_1_poser_group.tx";
connectAttr "local_1_poser_group_pointConstraint1.cty" "local_1_poser_group.ty";
connectAttr "local_1_poser_group_pointConstraint1.ctz" "local_1_poser_group.tz";
connectAttr "end_poserOrient.r" "local_1_poser_group.r";
connectAttr "makeNurbSphere6.os" "local_1_poserShape.cr";
connectAttr "local_1_poser_group.pim" "local_1_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_1_poser_group.rp" "local_1_poser_group_pointConstraint1.crp";
connectAttr "local_1_poser_group.rpt" "local_1_poser_group_pointConstraint1.crt"
		;
connectAttr "root_poser.t" "local_1_poser_group_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "local_1_poser_group_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "local_1_poser_group_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "local_1_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_1_poser_group_pointConstraint1.w0" "local_1_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_poser.t" "local_1_poser_group_pointConstraint1.tg[1].tt";
connectAttr "end_poser.rp" "local_1_poser_group_pointConstraint1.tg[1].trp";
connectAttr "end_poser.rpt" "local_1_poser_group_pointConstraint1.tg[1].trt";
connectAttr "end_poser.pm" "local_1_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_1_poser_group_pointConstraint1.w1" "local_1_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_2_poser_group_pointConstraint1.ctx" "local_2_poser_group.tx";
connectAttr "local_2_poser_group_pointConstraint1.cty" "local_2_poser_group.ty";
connectAttr "local_2_poser_group_pointConstraint1.ctz" "local_2_poser_group.tz";
connectAttr "end_poserOrient.r" "local_2_poser_group.r";
connectAttr "makeNurbSphere5.os" "local_2_poserShape.cr";
connectAttr "local_2_poser_group.pim" "local_2_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_2_poser_group.rp" "local_2_poser_group_pointConstraint1.crp";
connectAttr "local_2_poser_group.rpt" "local_2_poser_group_pointConstraint1.crt"
		;
connectAttr "root_poser.t" "local_2_poser_group_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "local_2_poser_group_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "local_2_poser_group_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "local_2_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_2_poser_group_pointConstraint1.w0" "local_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_poser.t" "local_2_poser_group_pointConstraint1.tg[1].tt";
connectAttr "end_poser.rp" "local_2_poser_group_pointConstraint1.tg[1].trp";
connectAttr "end_poser.rpt" "local_2_poser_group_pointConstraint1.tg[1].trt";
connectAttr "end_poser.pm" "local_2_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_2_poser_group_pointConstraint1.w1" "local_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_3_poser_group_pointConstraint1.ctx" "local_3_poser_group.tx";
connectAttr "local_3_poser_group_pointConstraint1.cty" "local_3_poser_group.ty";
connectAttr "local_3_poser_group_pointConstraint1.ctz" "local_3_poser_group.tz";
connectAttr "end_poserOrient.r" "local_3_poser_group.r";
connectAttr "makeNurbSphere4.os" "local_3_poserShape.cr";
connectAttr "local_3_poser_group.pim" "local_3_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_3_poser_group.rp" "local_3_poser_group_pointConstraint1.crp";
connectAttr "local_3_poser_group.rpt" "local_3_poser_group_pointConstraint1.crt"
		;
connectAttr "root_poser.t" "local_3_poser_group_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "local_3_poser_group_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "local_3_poser_group_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "local_3_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_3_poser_group_pointConstraint1.w0" "local_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_poser.t" "local_3_poser_group_pointConstraint1.tg[1].tt";
connectAttr "end_poser.rp" "local_3_poser_group_pointConstraint1.tg[1].trp";
connectAttr "end_poser.rpt" "local_3_poser_group_pointConstraint1.tg[1].trt";
connectAttr "end_poser.pm" "local_3_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_3_poser_group_pointConstraint1.w1" "local_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_4_poser_group_pointConstraint1.ctx" "local_4_poser_group.tx";
connectAttr "local_4_poser_group_pointConstraint1.cty" "local_4_poser_group.ty";
connectAttr "local_4_poser_group_pointConstraint1.ctz" "local_4_poser_group.tz";
connectAttr "end_poserOrient.r" "local_4_poser_group.r";
connectAttr "local_4_poser_group.pim" "local_4_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_4_poser_group.rp" "local_4_poser_group_pointConstraint1.crp";
connectAttr "local_4_poser_group.rpt" "local_4_poser_group_pointConstraint1.crt"
		;
connectAttr "end_poser.t" "local_4_poser_group_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "local_4_poser_group_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "local_4_poser_group_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "local_4_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_4_poser_group_pointConstraint1.w0" "local_4_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "root_poser.t" "local_4_poser_group_pointConstraint1.tg[1].tt";
connectAttr "root_poser.rp" "local_4_poser_group_pointConstraint1.tg[1].trp";
connectAttr "root_poser.rpt" "local_4_poser_group_pointConstraint1.tg[1].trt";
connectAttr "root_poser.pm" "local_4_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_4_poser_group_pointConstraint1.w1" "local_4_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_5_poser_group_pointConstraint1.ctx" "local_5_poser_group.tx";
connectAttr "local_5_poser_group_pointConstraint1.cty" "local_5_poser_group.ty";
connectAttr "local_5_poser_group_pointConstraint1.ctz" "local_5_poser_group.tz";
connectAttr "end_poserOrient.r" "local_5_poser_group.r";
connectAttr "local_5_poser_group.pim" "local_5_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_5_poser_group.rp" "local_5_poser_group_pointConstraint1.crp";
connectAttr "local_5_poser_group.rpt" "local_5_poser_group_pointConstraint1.crt"
		;
connectAttr "end_poser.t" "local_5_poser_group_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "local_5_poser_group_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "local_5_poser_group_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "local_5_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_5_poser_group_pointConstraint1.w0" "local_5_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "root_poser.t" "local_5_poser_group_pointConstraint1.tg[1].tt";
connectAttr "root_poser.rp" "local_5_poser_group_pointConstraint1.tg[1].trp";
connectAttr "root_poser.rpt" "local_5_poser_group_pointConstraint1.tg[1].trt";
connectAttr "root_poser.pm" "local_5_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_5_poser_group_pointConstraint1.w1" "local_5_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "root_poser.t" "fk_controls_positions.t";
connectAttr "fk_1_pivot_loc_pointConstraint1.ctx" "fk_1_pivot_loc.tx";
connectAttr "fk_1_pivot_loc_pointConstraint1.cty" "fk_1_pivot_loc.ty";
connectAttr "fk_1_pivot_loc_pointConstraint1.ctz" "fk_1_pivot_loc.tz";
connectAttr "fk_1_pivot_loc.pim" "fk_1_pivot_loc_pointConstraint1.cpim";
connectAttr "fk_1_pivot_loc.rp" "fk_1_pivot_loc_pointConstraint1.crp";
connectAttr "fk_1_pivot_loc.rpt" "fk_1_pivot_loc_pointConstraint1.crt";
connectAttr "local_2_poser.t" "fk_1_pivot_loc_pointConstraint1.tg[0].tt";
connectAttr "local_2_poser.rp" "fk_1_pivot_loc_pointConstraint1.tg[0].trp";
connectAttr "local_2_poser.rpt" "fk_1_pivot_loc_pointConstraint1.tg[0].trt";
connectAttr "local_2_poser.pm" "fk_1_pivot_loc_pointConstraint1.tg[0].tpm";
connectAttr "fk_1_pivot_loc_pointConstraint1.w0" "fk_1_pivot_loc_pointConstraint1.tg[0].tw"
		;
connectAttr "local_1_poser.t" "fk_1_pivot_loc_pointConstraint1.tg[1].tt";
connectAttr "local_1_poser.rp" "fk_1_pivot_loc_pointConstraint1.tg[1].trp";
connectAttr "local_1_poser.rpt" "fk_1_pivot_loc_pointConstraint1.tg[1].trt";
connectAttr "local_1_poser.pm" "fk_1_pivot_loc_pointConstraint1.tg[1].tpm";
connectAttr "fk_1_pivot_loc_pointConstraint1.w1" "fk_1_pivot_loc_pointConstraint1.tg[1].tw"
		;
connectAttr "fk_3_pivot_loc_pointConstraint1.ctx" "fk_2_pivot_loc.tx";
connectAttr "fk_3_pivot_loc_pointConstraint1.cty" "fk_2_pivot_loc.ty";
connectAttr "fk_3_pivot_loc_pointConstraint1.ctz" "fk_2_pivot_loc.tz";
connectAttr "fk_2_pivot_loc.pim" "fk_3_pivot_loc_pointConstraint1.cpim";
connectAttr "fk_2_pivot_loc.rp" "fk_3_pivot_loc_pointConstraint1.crp";
connectAttr "fk_2_pivot_loc.rpt" "fk_3_pivot_loc_pointConstraint1.crt";
connectAttr "local_3_poser.t" "fk_3_pivot_loc_pointConstraint1.tg[0].tt";
connectAttr "local_3_poser.rp" "fk_3_pivot_loc_pointConstraint1.tg[0].trp";
connectAttr "local_3_poser.rpt" "fk_3_pivot_loc_pointConstraint1.tg[0].trt";
connectAttr "local_3_poser.pm" "fk_3_pivot_loc_pointConstraint1.tg[0].tpm";
connectAttr "fk_3_pivot_loc_pointConstraint1.w0" "fk_3_pivot_loc_pointConstraint1.tg[0].tw"
		;
connectAttr "init_uvPin.omat[0]" "local_1_initLoc.opm";
connectAttr "init_uvPin.omat[1]" "local_2_initLoc.opm";
connectAttr "init_uvPin.omat[2]" "local_3_initLoc.opm";
connectAttr "init_uvPin.omat[3]" "local_4_initLoc.opm";
connectAttr "init_uvPin.omat[4]" "local_5_initLoc.opm";
connectAttr "chest_initLoc_pointConstraint1.ctx" "chest_initLoc.tx";
connectAttr "chest_initLoc_pointConstraint1.cty" "chest_initLoc.ty";
connectAttr "chest_initLoc_pointConstraint1.ctz" "chest_initLoc.tz";
connectAttr "chest_initLoc.pim" "chest_initLoc_pointConstraint1.cpim";
connectAttr "chest_initLoc.rp" "chest_initLoc_pointConstraint1.crp";
connectAttr "chest_initLoc.rpt" "chest_initLoc_pointConstraint1.crt";
connectAttr "end_poser.t" "chest_initLoc_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "chest_initLoc_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "chest_initLoc_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "chest_initLoc_pointConstraint1.tg[0].tpm";
connectAttr "chest_initLoc_pointConstraint1.w0" "chest_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "init_surfLoc_0Shape.wp" "init_surfShapeOrig.cp[0]";
connectAttr "init_surfLoc_1Shape.wp" "init_surfShapeOrig.cp[1]";
connectAttr "init_surfLoc_2Shape.wp" "init_surfShapeOrig.cp[2]";
connectAttr "init_surfLoc_3Shape.wp" "init_surfShapeOrig.cp[3]";
connectAttr "init_surfLoc_4Shape.wp" "init_surfShapeOrig.cp[4]";
connectAttr "init_surfLoc_5Shape.wp" "init_surfShapeOrig.cp[5]";
connectAttr "init_surfLoc_6Shape.wp" "init_surfShapeOrig.cp[6]";
connectAttr "init_surfLoc_7Shape.wp" "init_surfShapeOrig.cp[7]";
connectAttr "init_surfLoc_8Shape.wp" "init_surfShapeOrig.cp[8]";
connectAttr "init_surfLoc_9Shape.wp" "init_surfShapeOrig.cp[9]";
connectAttr "init_surfLoc_10Shape.wp" "init_surfShapeOrig.cp[10]";
connectAttr "init_surfLoc_11Shape.wp" "init_surfShapeOrig.cp[11]";
connectAttr "init_surfLoc_12Shape.wp" "init_surfShapeOrig.cp[12]";
connectAttr "init_surfLoc_13Shape.wp" "init_surfShapeOrig.cp[13]";
connectAttr "curveFromSurfaceIso2.oc" "init_surfCurveShape.cr";
connectAttr "init_surfLoc_10_pointConstraint1.ctx" "init_surfLoc_10.tx";
connectAttr "init_surfLoc_10_pointConstraint1.cty" "init_surfLoc_10.ty";
connectAttr "init_surfLoc_10_pointConstraint1.ctz" "init_surfLoc_10.tz";
connectAttr "init_surfLoc_10.pim" "init_surfLoc_10_pointConstraint1.cpim";
connectAttr "init_surfLoc_10.rp" "init_surfLoc_10_pointConstraint1.crp";
connectAttr "init_surfLoc_10.rpt" "init_surfLoc_10_pointConstraint1.crt";
connectAttr "init_surfLoc_12.t" "init_surfLoc_10_pointConstraint1.tg[0].tt";
connectAttr "init_surfLoc_12.rp" "init_surfLoc_10_pointConstraint1.tg[0].trp";
connectAttr "init_surfLoc_12.rpt" "init_surfLoc_10_pointConstraint1.tg[0].trt";
connectAttr "init_surfLoc_12.pm" "init_surfLoc_10_pointConstraint1.tg[0].tpm";
connectAttr "init_surfLoc_10_pointConstraint1.w0" "init_surfLoc_10_pointConstraint1.tg[0].tw"
		;
connectAttr "init_surfLoc_8.t" "init_surfLoc_10_pointConstraint1.tg[1].tt";
connectAttr "init_surfLoc_8.rp" "init_surfLoc_10_pointConstraint1.tg[1].trp";
connectAttr "init_surfLoc_8.rpt" "init_surfLoc_10_pointConstraint1.tg[1].trt";
connectAttr "init_surfLoc_8.pm" "init_surfLoc_10_pointConstraint1.tg[1].tpm";
connectAttr "init_surfLoc_10_pointConstraint1.w1" "init_surfLoc_10_pointConstraint1.tg[1].tw"
		;
connectAttr "init_surfLoc_11_pointConstraint1.ctx" "init_surfLoc_11.tx";
connectAttr "init_surfLoc_11_pointConstraint1.cty" "init_surfLoc_11.ty";
connectAttr "init_surfLoc_11_pointConstraint1.ctz" "init_surfLoc_11.tz";
connectAttr "init_surfLoc_11.pim" "init_surfLoc_11_pointConstraint1.cpim";
connectAttr "init_surfLoc_11.rp" "init_surfLoc_11_pointConstraint1.crp";
connectAttr "init_surfLoc_11.rpt" "init_surfLoc_11_pointConstraint1.crt";
connectAttr "init_surfLoc_13.t" "init_surfLoc_11_pointConstraint1.tg[0].tt";
connectAttr "init_surfLoc_13.rp" "init_surfLoc_11_pointConstraint1.tg[0].trp";
connectAttr "init_surfLoc_13.rpt" "init_surfLoc_11_pointConstraint1.tg[0].trt";
connectAttr "init_surfLoc_13.pm" "init_surfLoc_11_pointConstraint1.tg[0].tpm";
connectAttr "init_surfLoc_11_pointConstraint1.w0" "init_surfLoc_11_pointConstraint1.tg[0].tw"
		;
connectAttr "init_surfLoc_9.t" "init_surfLoc_11_pointConstraint1.tg[1].tt";
connectAttr "init_surfLoc_9.rp" "init_surfLoc_11_pointConstraint1.tg[1].trp";
connectAttr "init_surfLoc_9.rpt" "init_surfLoc_11_pointConstraint1.tg[1].trt";
connectAttr "init_surfLoc_9.pm" "init_surfLoc_11_pointConstraint1.tg[1].tpm";
connectAttr "init_surfLoc_11_pointConstraint1.w1" "init_surfLoc_11_pointConstraint1.tg[1].tw"
		;
connectAttr "init_surfLoc_2_pointConstraint1.ctx" "init_surfLoc_2.tx";
connectAttr "init_surfLoc_2_pointConstraint1.cty" "init_surfLoc_2.ty";
connectAttr "init_surfLoc_2_pointConstraint1.ctz" "init_surfLoc_2.tz";
connectAttr "init_surfLoc_2.pim" "init_surfLoc_2_pointConstraint1.cpim";
connectAttr "init_surfLoc_2.rp" "init_surfLoc_2_pointConstraint1.crp";
connectAttr "init_surfLoc_2.rpt" "init_surfLoc_2_pointConstraint1.crt";
connectAttr "init_surfLoc_0.t" "init_surfLoc_2_pointConstraint1.tg[0].tt";
connectAttr "init_surfLoc_0.rp" "init_surfLoc_2_pointConstraint1.tg[0].trp";
connectAttr "init_surfLoc_0.rpt" "init_surfLoc_2_pointConstraint1.tg[0].trt";
connectAttr "init_surfLoc_0.pm" "init_surfLoc_2_pointConstraint1.tg[0].tpm";
connectAttr "init_surfLoc_2_pointConstraint1.w0" "init_surfLoc_2_pointConstraint1.tg[0].tw"
		;
connectAttr "init_surfLoc_4.t" "init_surfLoc_2_pointConstraint1.tg[1].tt";
connectAttr "init_surfLoc_4.rp" "init_surfLoc_2_pointConstraint1.tg[1].trp";
connectAttr "init_surfLoc_4.rpt" "init_surfLoc_2_pointConstraint1.tg[1].trt";
connectAttr "init_surfLoc_4.pm" "init_surfLoc_2_pointConstraint1.tg[1].tpm";
connectAttr "init_surfLoc_2_pointConstraint1.w1" "init_surfLoc_2_pointConstraint1.tg[1].tw"
		;
connectAttr "init_surfLoc_3_pointConstraint1.ctx" "init_surfLoc_3.tx";
connectAttr "init_surfLoc_3_pointConstraint1.cty" "init_surfLoc_3.ty";
connectAttr "init_surfLoc_3_pointConstraint1.ctz" "init_surfLoc_3.tz";
connectAttr "init_surfLoc_3.pim" "init_surfLoc_3_pointConstraint1.cpim";
connectAttr "init_surfLoc_3.rp" "init_surfLoc_3_pointConstraint1.crp";
connectAttr "init_surfLoc_3.rpt" "init_surfLoc_3_pointConstraint1.crt";
connectAttr "init_surfLoc_5.t" "init_surfLoc_3_pointConstraint1.tg[0].tt";
connectAttr "init_surfLoc_5.rp" "init_surfLoc_3_pointConstraint1.tg[0].trp";
connectAttr "init_surfLoc_5.rpt" "init_surfLoc_3_pointConstraint1.tg[0].trt";
connectAttr "init_surfLoc_5.pm" "init_surfLoc_3_pointConstraint1.tg[0].tpm";
connectAttr "init_surfLoc_3_pointConstraint1.w0" "init_surfLoc_3_pointConstraint1.tg[0].tw"
		;
connectAttr "init_surfLoc_1.t" "init_surfLoc_3_pointConstraint1.tg[1].tt";
connectAttr "init_surfLoc_1.rp" "init_surfLoc_3_pointConstraint1.tg[1].trp";
connectAttr "init_surfLoc_1.rpt" "init_surfLoc_3_pointConstraint1.tg[1].trt";
connectAttr "init_surfLoc_1.pm" "init_surfLoc_3_pointConstraint1.tg[1].tpm";
connectAttr "init_surfLoc_3_pointConstraint1.w1" "init_surfLoc_3_pointConstraint1.tg[1].tw"
		;
connectAttr "root_initLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "local_1_poserOrientShape.wp" "posers_curveShape.cp[1]";
connectAttr "local_2_poserOrientShape.wp" "posers_curveShape.cp[2]";
connectAttr "local_3_poserOrientShape.wp" "posers_curveShape.cp[3]";
connectAttr "end_poserOrientShape.wp" "posers_curveShape.cp[4]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "size_multiplyDivide2.oy" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide2.oy" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide2.oy" "mainPoser_clusterHandle.sz";
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "end_decomposeMatrix1.ot" "pelvis.rp";
connectAttr "multMatrix80.o" "fk_bone_1_group.opm";
connectAttr "decomposeMatrix91.otx" "fk_1.rpx";
connectAttr "decomposeMatrix91.otz" "fk_1.rpz";
connectAttr "multMatrix81.o" "fk_bone_2_group.opm";
connectAttr "decomposeMatrix92.otx" "fk_2.rpx";
connectAttr "decomposeMatrix92.otz" "fk_2.rpz";
connectAttr "multMatrix82.o" "fk_bone_3_group.opm";
connectAttr "multMatrix83.o" "chest_group.opm";
connectAttr "pelvis.localControls" "local_ik_6.v";
connectAttr "group2_aimConstraint1.crx" "chest_aim_group.rx";
connectAttr "group2_aimConstraint1.cry" "chest_aim_group.ry";
connectAttr "group2_aimConstraint1.crz" "chest_aim_group.rz";
connectAttr "pelvis.localControls" "local_7.v";
connectAttr "blendMatrix6.omat" "local_7.opm";
connectAttr "multMatrix85.o" "chest_stomach_target.opm";
connectAttr "chest.weight" "group2_aimConstraint1.w1";
connectAttr "reverse9.ox" "group2_aimConstraint1.w2";
connectAttr "chest_aim_group.pim" "group2_aimConstraint1.cpim";
connectAttr "chest_aim_group.t" "group2_aimConstraint1.ct";
connectAttr "chest_aim_group.rp" "group2_aimConstraint1.crp";
connectAttr "chest_aim_group.rpt" "group2_aimConstraint1.crt";
connectAttr "chest_aim_group.ro" "group2_aimConstraint1.cro";
connectAttr "chest_loc_aim_static.t" "group2_aimConstraint1.tg[1].tt";
connectAttr "chest_loc_aim_static.rp" "group2_aimConstraint1.tg[1].trp";
connectAttr "chest_loc_aim_static.rpt" "group2_aimConstraint1.tg[1].trt";
connectAttr "chest_loc_aim_static.pm" "group2_aimConstraint1.tg[1].tpm";
connectAttr "group2_aimConstraint1.w1" "group2_aimConstraint1.tg[1].tw";
connectAttr "hips_loc_target.t" "group2_aimConstraint1.tg[2].tt";
connectAttr "hips_loc_target.rp" "group2_aimConstraint1.tg[2].trp";
connectAttr "hips_loc_target.rpt" "group2_aimConstraint1.tg[2].trt";
connectAttr "hips_loc_target.pm" "group2_aimConstraint1.tg[2].tpm";
connectAttr "group2_aimConstraint1.w2" "group2_aimConstraint1.tg[2].tw";
connectAttr "chest.wm" "group2_aimConstraint1.wum";
connectAttr "hips.t" "hips_loc_target.t";
connectAttr "multMatrix91.o" "hips_loc_target.opm";
connectAttr "multMatrix86.o" "fk_3_loc_1.opm";
connectAttr "pelvis.localControls" "local_ik_4.v";
connectAttr "plusMinusAverage3.o3" "stomach_group_1.t";
connectAttr "mid_rotate_locator.r" "stomach_group_1.r";
connectAttr "pelvis.localControls" "local_ik_3.v";
connectAttr "multMatrix82.o" "stomach_loc_1.opm";
connectAttr "inverseMatrix2.omat" "group3.opm";
connectAttr "multMatrix92.o" "stomach_loc_2.opm";
connectAttr "multMatrix87.o" "fk_1_loc_1.opm";
connectAttr "pelvis.localControls" "local_ik_2.v";
connectAttr "hips_out_pointConstraint1.ctx" "hips_out.tx";
connectAttr "hips_out_pointConstraint1.cty" "hips_out.ty";
connectAttr "hips_out_pointConstraint1.ctz" "hips_out.tz";
connectAttr "fk_hips.r" "hips_out.r";
connectAttr "hips_out.pim" "hips_out_pointConstraint1.cpim";
connectAttr "hips_out.rp" "hips_out_pointConstraint1.crp";
connectAttr "hips_out.rpt" "hips_out_pointConstraint1.crt";
connectAttr "bendJoint_1_out.t" "hips_out_pointConstraint1.tg[0].tt";
connectAttr "bendJoint_1_out.rp" "hips_out_pointConstraint1.tg[0].trp";
connectAttr "bendJoint_1_out.rpt" "hips_out_pointConstraint1.tg[0].trt";
connectAttr "bendJoint_1_out.pm" "hips_out_pointConstraint1.tg[0].tpm";
connectAttr "hips_out_pointConstraint1.w0" "hips_out_pointConstraint1.tg[0].tw";
connectAttr "hipsStomachMid_loc_group_aimConstraint1.crx" "hipsStomachMid_loc_group.rx"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.cry" "hipsStomachMid_loc_group.ry"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.crz" "hipsStomachMid_loc_group.rz"
		;
connectAttr "hips.weight" "hipsStomachMid_loc_group_aimConstraint1.w0";
connectAttr "reverse8.ox" "hipsStomachMid_loc_group_aimConstraint1.w4";
connectAttr "hipsStomachMid_loc_group.pim" "hipsStomachMid_loc_group_aimConstraint1.cpim"
		;
connectAttr "hipsStomachMid_loc_group.t" "hipsStomachMid_loc_group_aimConstraint1.ct"
		;
connectAttr "hipsStomachMid_loc_group.rp" "hipsStomachMid_loc_group_aimConstraint1.crp"
		;
connectAttr "hipsStomachMid_loc_group.rpt" "hipsStomachMid_loc_group_aimConstraint1.crt"
		;
connectAttr "hipsStomachMid_loc_group.ro" "hipsStomachMid_loc_group_aimConstraint1.cro"
		;
connectAttr "hipsStomachMid_aim.t" "hipsStomachMid_loc_group_aimConstraint1.tg[0].tt"
		;
connectAttr "hipsStomachMid_aim.rp" "hipsStomachMid_loc_group_aimConstraint1.tg[0].trp"
		;
connectAttr "hipsStomachMid_aim.rpt" "hipsStomachMid_loc_group_aimConstraint1.tg[0].trt"
		;
connectAttr "hipsStomachMid_aim.pm" "hipsStomachMid_loc_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.w0" "hipsStomachMid_loc_group_aimConstraint1.tg[0].tw"
		;
connectAttr "chest_local_target.t" "hipsStomachMid_loc_group_aimConstraint1.tg[4].tt"
		;
connectAttr "chest_local_target.rp" "hipsStomachMid_loc_group_aimConstraint1.tg[4].trp"
		;
connectAttr "chest_local_target.rpt" "hipsStomachMid_loc_group_aimConstraint1.tg[4].trt"
		;
connectAttr "chest_local_target.pm" "hipsStomachMid_loc_group_aimConstraint1.tg[4].tpm"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.w4" "hipsStomachMid_loc_group_aimConstraint1.tg[4].tw"
		;
connectAttr "multMatrix80.o" "hips_loc_1.opm";
connectAttr "decomposeMatrix91.otz" "fk_hips.rpz";
connectAttr "decomposeMatrix91.otx" "fk_hips.rpx";
connectAttr "inverseMatrix1.omat" "bendJoint_1_out.opm";
connectAttr "pelvis.localControls" "local_ik_8.v";
connectAttr "inverseMatrix1.omat" "local_ik_8.opm";
connectAttr "pelvis.localControls" "local_ik_9.v";
connectAttr "multMatrix89.o" "local_ik_9.opm";
connectAttr "chest.t" "chest_local_target.t";
connectAttr "multMatrix90.o" "chest_local_target.opm";
connectAttr "locator1_aimConstraint1.crx" "mid_rotate_locator.rx";
connectAttr "locator1_aimConstraint1.cry" "mid_rotate_locator.ry";
connectAttr "locator1_aimConstraint1.crz" "mid_rotate_locator.rz";
connectAttr "hips.t" "mid_rotate_locator.t";
connectAttr "mid_rotate_locator.pim" "locator1_aimConstraint1.cpim";
connectAttr "mid_rotate_locator.t" "locator1_aimConstraint1.ct";
connectAttr "mid_rotate_locator.rp" "locator1_aimConstraint1.crp";
connectAttr "mid_rotate_locator.rpt" "locator1_aimConstraint1.crt";
connectAttr "mid_rotate_locator.ro" "locator1_aimConstraint1.cro";
connectAttr "chest_local_target.t" "locator1_aimConstraint1.tg[0].tt";
connectAttr "chest_local_target.rp" "locator1_aimConstraint1.tg[0].trp";
connectAttr "chest_local_target.rpt" "locator1_aimConstraint1.tg[0].trt";
connectAttr "chest_local_target.pm" "locator1_aimConstraint1.tg[0].tpm";
connectAttr "locator1_aimConstraint1.w0" "locator1_aimConstraint1.tg[0].tw";
connectAttr "hips.wm" "locator1_aimConstraint1.wum";
connectAttr "uvPin.omat[0]" "surf_1_jnt.opm";
connectAttr "uvPin.omat[1]" "surf_2_jnt.opm";
connectAttr "uvPin.omat[2]" "surf_3_jnt.opm";
connectAttr "uvPin.omat[3]" "surf_4_jnt.opm";
connectAttr "uvPin.omat[4]" "surf_5_jnt.opm";
connectAttr "bend_surfLoc_0Shape.wp" "surfShape.cp[0]";
connectAttr "bend_surfLoc_1Shape.wp" "surfShape.cp[1]";
connectAttr "bend_surfLoc_2Shape.wp" "surfShape.cp[2]";
connectAttr "bend_surfLoc_3Shape.wp" "surfShape.cp[3]";
connectAttr "bend_surfLoc_4Shape.wp" "surfShape.cp[4]";
connectAttr "bend_surfLoc_5Shape.wp" "surfShape.cp[5]";
connectAttr "bend_surfLoc_6Shape.wp" "surfShape.cp[6]";
connectAttr "bend_surfLoc_7Shape.wp" "surfShape.cp[7]";
connectAttr "bend_surfLoc_8Shape.wp" "surfShape.cp[8]";
connectAttr "bend_surfLoc_9Shape.wp" "surfShape.cp[9]";
connectAttr "bend_surfLoc_10Shape.wp" "surfShape.cp[10]";
connectAttr "bend_surfLoc_11Shape.wp" "surfShape.cp[11]";
connectAttr "bend_surfLoc_12Shape.wp" "surfShape.cp[12]";
connectAttr "bend_surfLoc_13Shape.wp" "surfShape.cp[13]";
connectAttr "curveFromSurfaceIso1.oc" "surfCurveShape.cr";
connectAttr "root_connector_decMat.osx" "outJoints.sx";
connectAttr "root_connector_decMat.osy" "outJoints.sy";
connectAttr "multDoubleLinear14.o" "outJoints.sz";
connectAttr "decomposeMatrix90.otx" "root_outJoint.tx";
connectAttr "decomposeMatrix90.oty" "root_outJoint.ty";
connectAttr "decomposeMatrix90.otz" "root_outJoint.tz";
connectAttr "decomposeMatrix90.orx" "root_outJoint.rx";
connectAttr "decomposeMatrix90.ory" "root_outJoint.ry";
connectAttr "decomposeMatrix90.orz" "root_outJoint.rz";
connectAttr "spine_2_skinJoint_decMat.otx" "local_1_outJoint.tx";
connectAttr "spine_2_skinJoint_decMat.oty" "local_1_outJoint.ty";
connectAttr "spine_2_skinJoint_decMat.otz" "local_1_outJoint.tz";
connectAttr "spine_2_skinJoint_decMat.orx" "local_1_outJoint.rx";
connectAttr "spine_2_skinJoint_decMat.ory" "local_1_outJoint.ry";
connectAttr "spine_2_skinJoint_decMat.orz" "local_1_outJoint.rz";
connectAttr "root_outJoint.s" "local_1_outJoint.is";
connectAttr "squash_blendTwoAttr.o" "local_1_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_1_outJoint.sz";
connectAttr "local_1_outJoint.s" "local_2_outJoint.is";
connectAttr "spine_3_skinJoint_decMat.otx" "local_2_outJoint.tx";
connectAttr "spine_3_skinJoint_decMat.oty" "local_2_outJoint.ty";
connectAttr "spine_3_skinJoint_decMat.otz" "local_2_outJoint.tz";
connectAttr "spine_3_skinJoint_decMat.orx" "local_2_outJoint.rx";
connectAttr "spine_3_skinJoint_decMat.ory" "local_2_outJoint.ry";
connectAttr "spine_3_skinJoint_decMat.orz" "local_2_outJoint.rz";
connectAttr "squash_blendTwoAttr.o" "local_2_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_2_outJoint.sz";
connectAttr "local_2_outJoint.s" "local_3_outJoint.is";
connectAttr "spine_4_skinJoint_decMat.otx" "local_3_outJoint.tx";
connectAttr "spine_4_skinJoint_decMat.oty" "local_3_outJoint.ty";
connectAttr "spine_4_skinJoint_decMat.otz" "local_3_outJoint.tz";
connectAttr "spine_4_skinJoint_decMat.orx" "local_3_outJoint.rx";
connectAttr "spine_4_skinJoint_decMat.ory" "local_3_outJoint.ry";
connectAttr "spine_4_skinJoint_decMat.orz" "local_3_outJoint.rz";
connectAttr "squash_blendTwoAttr.o" "local_3_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_3_outJoint.sz";
connectAttr "spine_4_skinJoint_decMat1.otx" "local_4_outJoint.tx";
connectAttr "spine_4_skinJoint_decMat1.oty" "local_4_outJoint.ty";
connectAttr "spine_4_skinJoint_decMat1.otz" "local_4_outJoint.tz";
connectAttr "spine_4_skinJoint_decMat1.orx" "local_4_outJoint.rx";
connectAttr "spine_4_skinJoint_decMat1.ory" "local_4_outJoint.ry";
connectAttr "spine_4_skinJoint_decMat1.orz" "local_4_outJoint.rz";
connectAttr "local_3_outJoint.s" "local_4_outJoint.is";
connectAttr "squash_blendTwoAttr.o" "local_4_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_4_outJoint.sz";
connectAttr "spine_5_skinJoint_decMat1.otx" "local_5_outJoint.tx";
connectAttr "spine_5_skinJoint_decMat1.oty" "local_5_outJoint.ty";
connectAttr "spine_5_skinJoint_decMat1.otz" "local_5_outJoint.tz";
connectAttr "spine_5_skinJoint_decMat1.orx" "local_5_outJoint.rx";
connectAttr "spine_5_skinJoint_decMat1.ory" "local_5_outJoint.ry";
connectAttr "spine_5_skinJoint_decMat1.orz" "local_5_outJoint.rz";
connectAttr "local_4_outJoint.s" "local_5_outJoint.is";
connectAttr "squash_blendTwoAttr.o" "local_5_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_5_outJoint.sz";
connectAttr "local_end_outJoint_decMat.ot" "end_outJoint.t";
connectAttr "local_end_outJoint_decMat.or" "end_outJoint.r";
connectAttr "local_end_outJoint_decMat.os" "end_outJoint.s";
connectAttr "local_end_outJoint_decMat.osh" "end_outJoint.sh";
connectAttr "polyCube1.out" "pCubeShape1.i";
connectAttr "hips.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "chest.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "stomach.iog" "ik_moduleControlSet.dsm" -na;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_poser_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_poser_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_poser_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_3_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_3_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_3_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_3_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_4_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_5_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_5_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_5_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "spine_5_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "end_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "end_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "end_surfaceShader1SG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_poser_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_poser_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_poser_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_3_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_3_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_3_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_3_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_4_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_5_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_5_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_5_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "spine_5_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "end_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "end_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "end_surfaceShader1SG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "spineRoot.iog" "moduleControlSet.dsm" -na;
connectAttr "pelvis.iog" "moduleControlSet.dsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "local_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "fk_3.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_2.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_1.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_hips.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "red_rsSG.msg" "root_materialInfo1.sg";
connectAttr "green_rsSG.msg" "root_materialInfo2.sg";
connectAttr "blue_rsSG.msg" "root_materialInfo3.sg";
connectAttr "black_rsSG.msg" "spine_1_materialInfo7.sg";
connectAttr "squash_blendTwoAttr.const" "squash_blendTwoAttr.i[0]";
connectAttr "multiplyDivide1855.ox" "squash_blendTwoAttr.i[1]";
connectAttr "pelvis.squash" "squash_blendTwoAttr.ab";
connectAttr "chest.weight" "reverse6.ix";
connectAttr "spine_2_skinJoint_multMat.o" "spine_2_skinJoint_decMat.imat";
connectAttr "surf_1_jnt.wm" "spine_2_skinJoint_multMat.i[0]";
connectAttr "root_outJoint.wim" "spine_2_skinJoint_multMat.i[1]";
connectAttr "spine_3_skinJoint_multMat.o" "spine_3_skinJoint_decMat.imat";
connectAttr "surf_2_jnt.wm" "spine_3_skinJoint_multMat.i[0]";
connectAttr "local_1_outJoint.wim" "spine_3_skinJoint_multMat.i[1]";
connectAttr "spine_4_skinJoint_multMat.o" "spine_4_skinJoint_decMat.imat";
connectAttr "surf_3_jnt.wm" "spine_4_skinJoint_multMat.i[0]";
connectAttr "local_2_outJoint.wim" "spine_4_skinJoint_multMat.i[1]";
connectAttr "spine_5_skinJoint_multMat1.o" "spine_5_skinJoint_decMat1.imat";
connectAttr "surf_5_jnt.wm" "spine_5_skinJoint_multMat1.i[0]";
connectAttr "local_4_outJoint.wim" "spine_5_skinJoint_multMat1.i[1]";
connectAttr "curveInfo1.al" "multiplyDivide1853.i1x";
connectAttr "root_connector_decMat.osx" "multiplyDivide1853.i2x";
connectAttr "spine_4_skinJoint_multMat1.o" "spine_4_skinJoint_decMat1.imat";
connectAttr "surf_4_jnt.wm" "spine_4_skinJoint_multMat1.i[0]";
connectAttr "local_3_outJoint.wim" "spine_4_skinJoint_multMat1.i[1]";
connectAttr "root_outJoint.msg" "bindPose5.m[3]";
connectAttr "local_1_outJoint.msg" "bindPose5.m[4]";
connectAttr "local_2_outJoint.msg" "bindPose5.m[5]";
connectAttr "local_3_outJoint.msg" "bindPose5.m[6]";
connectAttr "local_4_outJoint.msg" "bindPose5.m[7]";
connectAttr "bindPose5.w" "bindPose5.p[0]";
connectAttr "bindPose5.m[0]" "bindPose5.p[1]";
connectAttr "bindPose5.m[1]" "bindPose5.p[2]";
connectAttr "bindPose5.m[2]" "bindPose5.p[3]";
connectAttr "bindPose5.m[3]" "bindPose5.p[4]";
connectAttr "bindPose5.m[4]" "bindPose5.p[5]";
connectAttr "bindPose5.m[5]" "bindPose5.p[6]";
connectAttr "bindPose5.m[6]" "bindPose5.p[7]";
connectAttr "hips.weight" "reverse8.ix";
connectAttr "spineRoot.wim" "multMatrix68.i[1]";
connectAttr "multMatrix68.o" "decomposeMatrix88.imat";
connectAttr "decomposeMatrix88.orx" "unitConversion32.i";
connectAttr "decomposeMatrix88.orz" "unitConversion33.i";
connectAttr "fk_3.m" "decomposeMatrix89.imat";
connectAttr "decomposeMatrix89.orx" "unitConversion34.i";
connectAttr "unitConversion32.o" "addDoubleLinear1.i1";
connectAttr "unitConversion34.o" "addDoubleLinear1.i2";
connectAttr "decomposeMatrix89.orz" "unitConversion35.i";
connectAttr "unitConversion33.o" "addDoubleLinear2.i1";
connectAttr "unitConversion35.o" "addDoubleLinear2.i2";
connectAttr "hips_out_2.wm" "multMatrix69.i[0]";
connectAttr "outJoints.wim" "multMatrix69.i[1]";
connectAttr "multMatrix69.o" "decomposeMatrix90.imat";
connectAttr "end_poser.t" "distanceBetween1.p2";
connectAttr "root_poser.t" "distanceBetween1.p1";
connectAttr "root_connector_decMat.osz" "multDoubleLinear14.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear14.i2";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "distanceBetween3.d" "multiplyDivide1854.i1y";
connectAttr "spine_4_poser_surfaceShader1SG.msg" "spine_4_poser_materialInfo1.sg"
		;
connectAttr "spine_4_poser_surfaceShader2SG.msg" "spine_4_poser_materialInfo2.sg"
		;
connectAttr "spine_4_poser_surfaceShader3SG.msg" "spine_4_poser_materialInfo3.sg"
		;
connectAttr "spine_3_surfaceShader1SG.msg" "spine_3_materialInfo1.sg";
connectAttr "spine_3_surfaceShader1SG1.msg" "spine_3_materialInfo2.sg";
connectAttr "spine_3_surfaceShader2SG.msg" "spine_3_materialInfo3.sg";
connectAttr "spine_3_surfaceShader3SG.msg" "spine_3_materialInfo4.sg";
connectAttr "spine_4_surfaceShader1SG.msg" "spine_4_materialInfo1.sg";
connectAttr "spine_4_surfaceShader2SG.msg" "spine_4_materialInfo2.sg";
connectAttr "spine_4_surfaceShader3SG.msg" "spine_4_materialInfo3.sg";
connectAttr "spine_4_surfaceShader1SG1.msg" "spine_4_materialInfo4.sg";
connectAttr "spine_5_surfaceShader1SG.msg" "spine_5_materialInfo1.sg";
connectAttr "spine_5_surfaceShader2SG.msg" "spine_5_materialInfo2.sg";
connectAttr "spine_5_surfaceShader3SG.msg" "spine_5_materialInfo3.sg";
connectAttr "spine_5_surfaceShader1SG1.msg" "spine_5_materialInfo4.sg";
connectAttr "end_surfaceShader1SG.msg" "end_materialInfo1.sg";
connectAttr "end_surfaceShader1SG1.msg" "end_materialInfo2.sg";
connectAttr "end_surfaceShader1SG2.msg" "end_materialInfo3.sg";
connectAttr "local_ik_4.wm" "multMatrix70.i[0]";
connectAttr "local_ik_4.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_ik_3.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_ik_2.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_ik_6.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_7.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_ik_8.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_ik_9.iog" "local_moduleControlSet.dsm" -na;
connectAttr "root_poser.t" "distanceBetween2.p1";
connectAttr "end_poser.t" "distanceBetween2.p2";
connectAttr "distanceBetween2.d" "curDistance_part_3.i1";
connectAttr "mainPoser.wm" "end_multMatrix1.i[0]";
connectAttr "root_poser.wim" "end_multMatrix1.i[1]";
connectAttr "end_multMatrix1.o" "end_decomposeMatrix1.imat";
connectAttr "end_poser.t" "distanceBetween3.p1";
connectAttr "root_poser.t" "distanceBetween3.p2";
connectAttr "local_end_outJoint_multMat.o" "local_end_outJoint_decMat.imat";
connectAttr "end_out.wm" "local_end_outJoint_multMat.i[0]";
connectAttr "end_outJoint.pim" "local_end_outJoint_multMat.i[1]";
connectAttr "size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "size_multiplyDivide1.ox" "makeNurbSphere4.r";
connectAttr "size_multiplyDivide1.oy" "makeNurbSphere5.r";
connectAttr "size_multiplyDivide1.oz" "makeNurbSphere6.r";
connectAttr "end_poser.size" "size_multiplyDivide.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2z";
connectAttr "local_3_poser.size" "size_multiplyDivide1.i1x";
connectAttr "local_2_poser.size" "size_multiplyDivide1.i1y";
connectAttr "local_1_poser.size" "size_multiplyDivide1.i1z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2z";
connectAttr "root_connector.wm" "root_connector_decMat.imat";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "root_poser.size" "size_multiplyDivide2.i1x";
connectAttr "mainPoser.size" "size_multiplyDivide2.i1y";
connectAttr "mainPoser.lineWidth" "size_multiplyDivide2.i1z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide2.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide2.i2y";
connectAttr "multDoubleLinear15.o" "size_multiplyDivide2.i2z";
connectAttr "size_multiplyDivide2.ox" "makeNurbSphere7.r";
connectAttr "size_multiplyDivide2.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "posers_sweepShape.iog" "blinn1SG.dsm" -na;
connectAttr "blinn1SG.msg" "materialInfo1.sg";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "size_multiplyDivide2.oz" "sweepMeshCreator1.scaleProfileX";
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "multMatrix72.o" "decomposeMatrix92.imat";
connectAttr "fk_2_pivot_loc.wm" "multMatrix72.i[0]";
connectAttr "fk_bone_2_group_pos.wim" "multMatrix72.i[1]";
connectAttr "multMatrix71.o" "decomposeMatrix91.imat";
connectAttr "fk_1_pivot_loc.wm" "multMatrix71.i[0]";
connectAttr "fk_bone_1_group_pos.wim" "multMatrix71.i[1]";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "end_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "mainPoser.globalSize" "multDoubleLinear15.i1";
connectAttr "local_1_poser.wm" "multMatrix80.i[0]";
connectAttr "root_poser.wim" "multMatrix80.i[1]";
connectAttr "local_2_poser.wm" "multMatrix81.i[0]";
connectAttr "local_1_poser.wim" "multMatrix81.i[1]";
connectAttr "local_3_poser.wm" "multMatrix82.i[0]";
connectAttr "local_2_poser.wim" "multMatrix82.i[1]";
connectAttr "end_poser.wm" "multMatrix83.i[0]";
connectAttr "local_3_poser.wim" "multMatrix83.i[1]";
connectAttr "hips_loc_1.wm" "multMatrix84.i[0]";
connectAttr "stomach_group_1.wim" "multMatrix84.i[1]";
connectAttr "local_3_poser.wm" "multMatrix85.i[0]";
connectAttr "end_poser.wim" "multMatrix85.i[1]";
connectAttr "chest_stomach_target.wm" "blendMatrix1.imat";
connectAttr "stomach_loc_1.wm" "blendMatrix1.tgt[0].tmat";
connectAttr "stomach.weight" "blendMatrix1.env";
connectAttr "blendMatrix1.omat" "multMatrix86.i[0]";
connectAttr "fk_3.wim" "multMatrix86.i[1]";
connectAttr "hips_loc_1.wm" "blendMatrix2.imat";
connectAttr "stomach_loc_2.wm" "blendMatrix2.tgt[0].tmat";
connectAttr "stomach.weight" "blendMatrix2.env";
connectAttr "blendMatrix2.omat" "multMatrix87.i[0]";
connectAttr "fk_1.wim" "multMatrix87.i[1]";
connectAttr "chest.weight" "reverse9.ix";
connectAttr "multMatrix85.o" "blendMatrix6.tgt[0].tmat";
connectAttr "bendJoint_1_out.wm" "blendMatrix7.imat";
connectAttr "hips_loc_1.wm" "blendMatrix7.tgt[0].tmat";
connectAttr "blendMatrix7.omat" "multMatrix89.i[0]";
connectAttr "fk_hips.wim" "multMatrix89.i[1]";
connectAttr "multMatrix80.o" "inverseMatrix1.imat";
connectAttr "chest.t" "plusMinusAverage3.i3[0]";
connectAttr "hips.t" "plusMinusAverage3.i3[1]";
connectAttr "end_poser.wm" "multMatrix90.i[0]";
connectAttr "root_poser.wim" "multMatrix90.i[1]";
connectAttr "root_poser.wm" "multMatrix91.i[0]";
connectAttr "end_poser.wim" "multMatrix91.i[1]";
connectAttr "surfShape.l" "uvPin.curgeom";
connectAttr "surfShape.l" "uvPin.orggeom";
connectAttr "local_1_outJoint.pos" "uvPin.coord[0].cu";
connectAttr "local_2_outJoint.pos" "uvPin.coord[1].cu";
connectAttr "local_3_outJoint.pos" "uvPin.coord[2].cu";
connectAttr "local_4_outJoint.pos" "uvPin.coord[3].cu";
connectAttr "local_5_outJoint.pos" "uvPin.coord[4].cu";
connectAttr "init_surfShapeOrig.ws" "init_uvPin.curgeom";
connectAttr "init_surfShapeOrig.l" "init_uvPin.orggeom";
connectAttr "local_1_outJoint.pos" "init_uvPin.coord[0].cu";
connectAttr "local_2_outJoint.pos" "init_uvPin.coord[1].cu";
connectAttr "local_3_outJoint.pos" "init_uvPin.coord[2].cu";
connectAttr "local_4_outJoint.pos" "init_uvPin.coord[3].cu";
connectAttr "local_5_outJoint.pos" "init_uvPin.coord[4].cu";
connectAttr "multiplyDivide1856.ox" "multiplyDivide1855.i1x";
connectAttr "multiplyDivide1853.ox" "multiplyDivide1855.i2x";
connectAttr "curveInfo2.al" "multiplyDivide1856.i1x";
connectAttr "decomposeMatrix93.osx" "multiplyDivide1856.i2x";
connectAttr "root_poser.wm" "decomposeMatrix93.imat";
connectAttr "surfShape.ws" "curveFromSurfaceIso1.is";
connectAttr "surfCurveShape.ws" "curveInfo1.ic";
connectAttr "init_surfShapeOrig.ws" "curveFromSurfaceIso2.is";
connectAttr "init_surfCurveShape.ws" "curveInfo2.ic";
connectAttr "local_1_poser.wm" "multMatrix92.i[0]";
connectAttr "local_2_poser.wim" "multMatrix92.i[1]";
connectAttr "fk_2.m" "inverseMatrix2.imat";
connectAttr "init_surfLoc_2Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "init_surfLoc_8Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "init_surfLoc_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "init_surfLoc_9Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "init_surfLoc_4Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "local_2_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "init_surfLoc_7Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "init_surfLoc_12Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "init_surfLoc_10Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "init_surfLoc_13Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "local_3_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "curveFromSurfaceIso2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "local_5_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "init_surfLoc_3Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "local_4_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "init_surfLoc_5Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "init_surfLoc_11Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "local_1_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "init_uvPin.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn";
connectAttr "init_surfLoc_0Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "init_surfShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "init_surfCurveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "init_surfLoc_6Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "root_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "multiplyDivide1853.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "curveFromSurfaceIso1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn";
connectAttr "multiplyDivide1855.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "spine_2_skinJoint_multMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn"
		;
connectAttr "decomposeMatrix93.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn"
		;
connectAttr "curveFromSurfaceIso2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "squash_blendTwoAttr.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn"
		;
connectAttr "surf_1_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn";
connectAttr "multiplyDivide1856.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn"
		;
connectAttr "pelvis.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn";
connectAttr "curveInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[13].dn";
connectAttr "uvPin.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[14].dn";
connectAttr "root_connector_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[15].dn"
		;
connectAttr "spine_2_skinJoint_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[16].dn"
		;
connectAttr "local_1_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[17].dn"
		;
connectAttr "curveInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[18].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn";
connectAttr "stomach_loc_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn";
connectAttr "local_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn";
connectAttr "fk_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn";
connectAttr "local_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[4].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[5].dn";
connectAttr "multMatrix82.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[6].dn";
connectAttr "stomach_loc_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[7].dn";
connectAttr "multMatrix84.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[8].dn";
connectAttr "local_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[9].dn";
connectAttr "multMatrix86.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[10].dn";
connectAttr "multMatrix85.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[11].dn";
connectAttr "multMatrix87.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[12].dn";
connectAttr "fk_1_loc_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[13].dn";
connectAttr "fk_3_loc_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[14].dn";
connectAttr "hips_loc_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[15].dn";
connectAttr "fk_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[16].dn";
connectAttr "chest_stomach_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[17].dn"
		;
connectAttr "multMatrix80.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[18].dn";
connectAttr "blendMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[19].dn";
connectAttr "blendMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[20].dn";
connectAttr "stomach_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[21].dn"
		;
connectAttr "multMatrix92.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[22].dn";
connectAttr "red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_poser_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_poser_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_poser_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "spine_3_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "spine_3_surfaceShader1SG1.pa" ":renderPartition.st" -na;
connectAttr "spine_3_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "spine_3_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "spine_4_surfaceShader1SG1.pa" ":renderPartition.st" -na;
connectAttr "spine_5_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "spine_5_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "spine_5_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "spine_5_surfaceShader1SG1.pa" ":renderPartition.st" -na;
connectAttr "end_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "end_surfaceShader1SG1.pa" ":renderPartition.st" -na;
connectAttr "end_surfaceShader1SG2.pa" ":renderPartition.st" -na;
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "squash_blendTwoAttr.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1853.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix88.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix89.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix90.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1854.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix91.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix92.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part_3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "end_decomposeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix80.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix81.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix82.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix83.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix84.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix85.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix86.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix87.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix89.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix90.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix91.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1855.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1856.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curveInfo1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curveInfo2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix92.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "surfShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "init_surfShapeOrig.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape7.iog" ":initialShadingGroup.dsm" -na;
dataStructure -fmt "raw" -as "name=NodeProfileStruct:string=NodeProfileTag:int32=NodeProfileTagColor";
applyMetadata -fmt "raw" -v "channel\nname ProfileTag\nstream\nname ProfileTagStream\nindexType numeric\nstructure NodeProfileStruct\n0\n\"multiplyDivide1855\" 0\nendStream\nendChannel\nchannel\nname ProfileTagColor\nstream\nname ProfileTagColorStream\nindexType numeric\nstructure NodeProfileStruct\n0\n\"\" 255\n1\n\"\" 0\n2\n\"\" 0\nendStream\nendChannel\nendAssociations\n" 
		multiplyDivide1853;
applyMetadata -fmt "raw" -v "channel\nname ProfileTag\nstream\nname ProfileTagStream\nindexType numeric\nstructure NodeProfileStruct\n0\n\"multiplyDivide1855\" 0\nendStream\nendChannel\nchannel\nname ProfileTagColor\nstream\nname ProfileTagColorStream\nindexType numeric\nstructure NodeProfileStruct\n0\n\"\" 255\n1\n\"\" 0\n2\n\"\" 0\nendStream\nendChannel\nendAssociations\n" 
		multiplyDivide1855;
applyMetadata -fmt "raw" -v "channel\nname ProfileTag\nstream\nname ProfileTagStream\nindexType numeric\nstructure NodeProfileStruct\n0\n\"multiplyDivide1855\" 0\nendStream\nendChannel\nchannel\nname ProfileTagColor\nstream\nname ProfileTagColorStream\nindexType numeric\nstructure NodeProfileStruct\n0\n\"\" 255\n1\n\"\" 0\n2\n\"\" 0\nendStream\nendChannel\nendAssociations\n" 
		multiplyDivide1856;
// End of spine.ma
