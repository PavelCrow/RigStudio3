//Maya ASCII 2022 scene
//Name: spine.ma
//Last modified: Thu, Feb 06, 2025 08:46:54 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "quatToEuler" "quatNodes" "1.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "4664D03B-4A63-30B5-3F73-AEBD996D8D1C";
createNode transform -n "mod";
	rename -uid "C55DD497-492A-4EC0-E01E-33B4860B4331";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "slidingJoints" -ln "slidingJoints" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
	setAttr ".slidingJoints" yes;
createNode transform -n "posers" -p "mod";
	rename -uid "8B6D04D2-4C43-9E49-D1BE-F385637FE8B1";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "6FC9A59C-460B-671B-DA12-EB82FC6E3013";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 0.1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "fk_1_initLocShape" -p "fk_1_initLoc";
	rename -uid "06C7542B-4045-168C-5C6B-AAA4D0A1EE77";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_2_initLoc" -p "fk_1_initLoc";
	rename -uid "BF4055A4-4A25-3F88-F689-C4BB848712E4";
createNode locator -n "fk_2_initLocShape" -p "fk_2_initLoc";
	rename -uid "392B4E32-4DCC-2579-8A13-89A611502181";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_3_initLoc" -p "fk_2_initLoc";
	rename -uid "BAA4C6C0-41E2-C819-F986-05A6698F8ED4";
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
createNode transform -n "end_poser" -p "mainPoser";
	rename -uid "AC069D1D-44EF-2B2E-E383-1889779A1712";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 20 0 ;
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
createNode transform -n "local_1_poser_group" -p "mainPoser";
	rename -uid "2BA4C7C3-437A-E63F-A606-37ABEDEB42D1";
createNode transform -n "local_1_poser" -p "local_1_poser_group";
	rename -uid "02E51398-493B-924D-20A5-FF9EFFE70D52";
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
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
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
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
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
createNode transform -n "local_4_poser" -p "local_4_poser_group";
	rename -uid "8FE61F32-42C9-C6BA-2C2B-639BBF0BC975";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode nurbsSurface -n "local_4_poserShape" -p "local_4_poser";
	rename -uid "3C00D815-440E-25AD-4770-9CB369100226";
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
createNode transform -n "local_4_poserOrient" -p "local_4_poser";
	rename -uid "3A54552C-4F02-76F4-E79C-67A645477D1E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_4";
createNode locator -n "local_4_poserOrientShape" -p "local_4_poserOrient";
	rename -uid "86F2A21D-4D91-FA47-3206-14819341306D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
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
createNode transform -n "local_5_poser" -p "local_5_poser_group";
	rename -uid "7815508D-4742-8634-7D4E-E88C056F2390";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode nurbsSurface -n "local_5_poserShape" -p "local_5_poser";
	rename -uid "B6738A0D-4797-4C64-97CB-B5BD2E4687EA";
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
createNode transform -n "local_5_poserOrient" -p "local_5_poser";
	rename -uid "2A52E1F4-4385-8339-3C49-EDBAA4DCE71B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine_5";
createNode locator -n "local_5_poserOrientShape" -p "local_5_poserOrient";
	rename -uid "A4E523DC-4682-9BAD-F68D-D78B57BE4C16";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
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
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".hdl" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".dh" yes;
createNode transform -n "fk_bone_3_group_pos" -p "fk_bone_2_group_pos";
	rename -uid "4BF45432-4EEC-7C43-C669-AD832C941F16";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".hdl" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".dh" yes;
createNode transform -n "init_locators_group" -p "mainPoser";
	rename -uid "7F79931A-4C24-81FD-D8D7-48972AED763D";
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
createNode locator -n "fk_3_pivot_locShape" -p "fk_3_pivot_loc";
	rename -uid "F05CBEBD-42C4-5AE2-D2E9-EBBD7287631B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "fk_2_pivot_loc_pointConstraint1" -p "fk_3_pivot_loc";
	rename -uid "7C347F40-4F37-54F6-C663-9991EE463E75";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "local_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "local_4_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 7.5000812620952964 -1.6555184124826337 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "initJoints" -p "init_locators_group";
	rename -uid "251E0D11-4262-34F9-10D1-CBA7D36CB4E5";
	setAttr ".v" no;
createNode joint -n "local_5_initJoint" -p "initJoints";
	rename -uid "BD6D159D-48B5-A8BA-19FE-3CA5EB3074E2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2.7755575615628909e-16 4.1500000000000012 0 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_6_posJoint_pointConstraint1" -p "local_5_initJoint";
	rename -uid "D8E269D1-4355-4F1C-2427-15B9A973802F";
	addAttr -ci true -k true -sn "w0" -ln "spine_5_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 4.1493775933609944 0 ;
	setAttr -k on ".w0";
createNode joint -n "local_4_initJoint" -p "initJoints";
	rename -uid "54CD9F22-4209-C238-4931-FC9704F8CC69";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -2.8275992658421951e-16 3.3499999999999965 1.0673970388119805e-16 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_5_posJoint_pointConstraint1" -p "local_4_initJoint";
	rename -uid "5B2D1E95-46C3-7439-C11A-89B832B5C8B3";
	addAttr -ci true -k true -sn "w0" -ln "spine_4_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 3.3444816053511706 0 ;
	setAttr -k on ".w0";
createNode joint -n "local_3_initJoint" -p "initJoints";
	rename -uid "D8716937-4273-8AEA-67DD-D18F7A84E544";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 2.4999999999999991 4.4286948240601633e-16 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_4_posJoint_pointConstraint1" -p "local_3_initJoint";
	rename -uid "28DB1105-4A41-BE33-BEC2-4188232A94C5";
	addAttr -ci true -k true -sn "w0" -ln "spine_3_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
createNode joint -n "local_2_initJoint" -p "initJoints";
	rename -uid "B9C89C6A-462E-4D09-A8D6-6D9FC631857C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.6429192995512955e-17 1.6499999999999979 5.5410862530302947e-16 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_3_posJoint_pointConstraint1" -p "local_2_initJoint";
	rename -uid "D62AC99A-4487-2E9F-61EE-FE9BECAFA694";
	addAttr -ci true -k true -sn "w0" -ln "spine_2_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 1.644295302013423 0 ;
	setAttr -k on ".w0";
createNode joint -n "local_1_initJoint" -p "initJoints";
	rename -uid "5A69F01F-40A7-7A03-858E-0FA4845B3B21";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2.1770017293856416e-17 0.84999999999999931 4.6680095993436e-20 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_2_posJoint_pointConstraint1" -p "local_1_initJoint";
	rename -uid "B354DA22-4210-BD88-C366-D09F724C0F27";
	addAttr -ci true -k true -sn "w0" -ln "spine_1_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0.85062240663900401 0 ;
	setAttr -k on ".w0";
createNode joint -n "root_initJoint" -p "initJoints";
	rename -uid "561024F0-4D07-66CF-AAC7-0582D6391DB3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_1_posJoint_pointConstraint1" -p "root_initJoint";
	rename -uid "F457DF8F-4188-4D7D-BD9C-5FBC10598D25";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr -k on ".w0";
createNode joint -n "end_initJoint" -p "initJoints";
	rename -uid "3D1EABB7-4981-80BC-F886-ACA2AA15E3F8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 5 0 1;
	setAttr ".radi" 2.5200000000000005;
createNode pointConstraint -n "bend_7_posJoint_pointConstraint1" -p "end_initJoint";
	rename -uid "6407D984-4724-0C5B-954C-DB87909157B1";
	addAttr -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 5 0 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "end_initJoint_orientConstraint1" -p "end_initJoint";
	rename -uid "F4DA5DD2-454C-5B59-E3EB-308A38BE540C";
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
	setAttr ".o" -type "double3" 90 0 90 ;
	setAttr ".rsrr" -type "double3" 90 0 90 ;
	setAttr -k on ".w0";
createNode transform -n "init_surf" -p "initJoints";
	rename -uid "5703A642-4BB7-F068-7E1C-EF8D149218A6";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".sp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".it" no;
createNode nurbsSurface -n "init_surfShape" -p "init_surf";
	rename -uid "E019EB92-45C7-FC1B-339C-8B935452E178";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode nurbsSurface -n "init_surfShapeOrig" -p "init_surf";
	rename -uid "EB0A2A83-4B0C-EDD5-0499-43A4073F0B99";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		2 0 1
		
		14
		0.0043710247026231396 0.0041268610836935025 0.22639549533562153
		0.0043710333730571935 0.0041464825218745652 -0.22639549533562059
		-1.2924452225679728e-17 0.86776859504132242 0.22639694415353209
		5.6464486813392554e-17 0.86776859504132253 -0.2263969441535312
		3.5988163824243052e-05 1.644295477543809 0.22639984178935385
		-3.5988163824089529e-05 1.6442951264830361 -0.22639984178935185
		8.2112349705906556e-05 2.5000000300930232 0.22640418824308492
		-8.2112349706017686e-05 2.4999999699069781 -0.22640418824308328
		0.00012811312433879031 3.3444816134180777 0.2264085346968161
		-0.00012811312433919965 3.3444815972842616 -0.22640853469681485
		9.1191646965979259e-05 4.150000003186876 0.22641143233263689
		-0.00022634935980384217 4.1499999968131283 -0.22641143233263575
		0.00013901251779507764 5.0003361092131327 0.22641288115054736
		-0.00020918445288213775 5.0003361063042799 -0.22641288115054639
		
		;
createNode transform -n "joints_initLocs" -p "init_locators_group";
	rename -uid "32714300-4309-38F0-D09C-CEAC2E4FE21C";
	setAttr ".it" no;
createNode transform -n "local_1_initFoll" -p "joints_initLocs";
	rename -uid "E47F2A67-4B4D-5A00-5E0A-55AAABF27852";
createNode follicle -n "local_1_initFollShape" -p "local_1_initFoll";
	rename -uid "AF37EB4A-4822-FB7F-CD94-13A75F87D4A8";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.10700000077486038;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_1_initLoc" -p "local_1_initFoll";
	rename -uid "0A9EA400-4EB0-4AF5-6CB6-039507D6C292";
createNode locator -n "local_1_initLocShape" -p "local_1_initLoc";
	rename -uid "3D258508-41EF-4CA8-389A-A984BE77CB36";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_1_initLoc_aimConstraint1" -p "local_1_initLoc";
	rename -uid "BB235A5D-47DC-99EA-6B24-AEBAF0893291";
	addAttr -ci true -sn "w0" -ln "bone_2_initLocW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -7.3446196579761231e-09 0.15091419056838509 -5.5768839716817475e-06 ;
	setAttr -k on ".w0";
createNode transform -n "local_2_initFoll" -p "joints_initLocs";
	rename -uid "218E453F-4CE8-288D-FB0B-688A95E8C607";
createNode follicle -n "local_2_initFollShape" -p "local_2_initFoll";
	rename -uid "63EA693C-455C-5DC9-54BF-E6B15310E763";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.25999999046325684;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_2_initLoc" -p "local_2_initFoll";
	rename -uid "1E5B9A0B-4213-E5AD-1B71-EAA5592A23C6";
createNode locator -n "local_2_initLocShape" -p "local_2_initLoc";
	rename -uid "D136D180-4A13-5EF3-E16C-1B8273C1E6C9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_2_initLoc_aimConstraint1" -p "local_2_initLoc";
	rename -uid "82F29618-424E-1820-AE0C-CCAEDB9E767D";
	addAttr -ci true -sn "w0" -ln "bone_3_initLocW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "local_3_initFoll" -p "joints_initLocs";
	rename -uid "E980D096-49D6-ABA9-F4BA-4F80402EC6BB";
createNode follicle -n "local_3_initFollShape" -p "local_3_initFoll";
	rename -uid "3393FB02-4238-F03F-0715-D9A9B2B90691";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.49900001287460327;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_3_initLoc" -p "local_3_initFoll";
	rename -uid "E6E82B5F-4486-8C9B-753B-71BDF90F550A";
createNode locator -n "local_3_initLocShape" -p "local_3_initLoc";
	rename -uid "10BBAD61-4D2F-491F-CFED-38B56CF2D618";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_3_initLoc_aimConstraint1" -p "local_3_initLoc";
	rename -uid "4C30DCDD-428A-AB6D-C792-B89A9876DDA4";
	addAttr -ci true -sn "w0" -ln "bone_4_initLocW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.37007425499515606 1.7915828138069128 11.673034855584673 ;
	setAttr -k on ".w0";
createNode transform -n "local_4_initFoll" -p "joints_initLocs";
	rename -uid "6E82B64E-4744-3653-52A8-C5B184D2CD36";
createNode follicle -n "local_4_initFollShape" -p "local_4_initFoll";
	rename -uid "86087A32-4FCC-17B5-54AA-4AAF53CDF097";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.74000000953674316;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_4_initLoc" -p "local_4_initFoll";
	rename -uid "374B3121-4A3D-76BF-831B-FC919A58104D";
createNode locator -n "local_4_initLocShape" -p "local_4_initLoc";
	rename -uid "FE73FB6F-4D74-49AF-C216-09B96FD5B946";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_4_initLoc_aimConstraint1" -p "local_4_initLoc";
	rename -uid "C1800003-4C76-643A-A998-7CA21DCB7D77";
	addAttr -ci true -sn "w0" -ln "bone_5_initLocW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.1506356851445603 -1.231863356510176 -6.9722235420386589 ;
	setAttr -k on ".w0";
createNode transform -n "local_5_initFoll" -p "joints_initLocs";
	rename -uid "018B7719-4ED9-74C8-B454-5A8A6F71923D";
createNode follicle -n "local_5_initFollShape" -p "local_5_initFoll";
	rename -uid "AFAA6A4B-4A1B-A2DE-2F90-BAA94C58D6F1";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.89300000667572021;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_5_initLoc" -p "local_5_initFoll";
	rename -uid "3652B5CF-4D84-876F-A508-138390738E68";
createNode locator -n "local_5_initLocShape" -p "local_5_initLoc";
	rename -uid "E63383A1-46C4-E034-F62D-889081D716A4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_5_initLoc_aimConstraint1" -p "local_5_initLoc";
	rename -uid "0D3FAF79-4FFE-EDE1-EA4E-4E98536760F7";
	addAttr -ci true -sn "w0" -ln "end_poserW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.9334351690129172 -3.9243230074390856 -26.254938523023672 ;
	setAttr -k on ".w0";
createNode transform -n "end_initLoc" -p "joints_initLocs";
	rename -uid "581E75CD-4CF7-D706-5C04-E78B30F010F6";
	setAttr ".r" -type "double3" 0 0 89.999999999999972 ;
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "E6C4C32D-4C78-01CF-30E5-3DB23D9A373D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "end_initLoc_pointConstraint1" -p "end_initLoc";
	rename -uid "2D607122-438C-FC78-1E27-40987110DEC2";
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
	setAttr -k on ".w0";
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
createNode transform -n "posers_curve" -p "posers";
	rename -uid "D46962ED-4D10-D0AB-3440-199D7552E6DD";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "1FE366E7-4628-C737-4F1F-5989EB87EBAA";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 0.16666666666666666 0.33333333333333331 0.5 0.66666666666666663 0.83333333333333337
		 1
		7
		-9.3074452277290208e-16 0 2.3268613069322532e-16
		0 3.400147738685126 0
		0 6.5996649916247909 0
		0 10 0
		0 13.40033500837521 0
		0 16.599990040005977 0
		0 20 0
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
	addAttr -ci true -sn "controls" -ln "controls" -min 0 -max 2 -en "Fk:Ik:Both" -at "enum";
	addAttr -ci true -sn "squash" -ln "squash" -dv 1 -min 0 -max 1 -at "double";
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
	setAttr -cb on ".controls" 2;
	setAttr -k on ".squash";
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
	setAttr ".t" -type "double3" 0 -8.8817841970012523e-16 4.4408920985006262e-16 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
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
		5.5796672871107447 -0.078441021378501827 -5.5796672871107305
		3.8213450987361294e-15 -0.078441021378502604 -7.8908506666998104
		-5.5796672871107127 -0.078441021378502535 -5.5796672871107305
		-7.8908506666997988 -0.078441021378503048 1.5904380303267178e-15
		-5.5796672871107127 -0.078441021378502535 5.5796672871107305
		3.8213450987361294e-15 -0.078441021378502604 7.8908506666998104
		5.5796672871107447 -0.078441021378501827 5.5796672871107305
		7.8908506666998122 -0.078441021378501577 1.5904380303267178e-15
		5.5796672871107447 -0.078441021378501827 -5.5796672871107305
		3.8213450987361294e-15 -0.078441021378502604 -7.8908506666998104
		-5.5796672871107127 -0.078441021378502535 -5.5796672871107305
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
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 4.4408920985006281e-16 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
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
createNode transform -n "fk_bone_3_out" -p "fk_3";
	rename -uid "4D5A7500-46CD-8D34-37E7-00A2246A18BA";
createNode transform -n "fk_bone_2_out" -p "fk_2";
	rename -uid "516E166C-44A4-8837-E2C7-5DA7BD7E3247";
	setAttr ".t" -type "double3" 0 0.84036461383370387 0 ;
createNode transform -n "fk_hips_group_2" -p "fk_controls";
	rename -uid "6D2BF128-4CCB-A2DC-C657-1DB1E7F0EA91";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999967 0.99999999999999967 ;
createNode transform -n "fk_hips_group" -p "fk_hips_group_2";
	rename -uid "AEB383B5-4F4A-0026-B246-408C719855F0";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -1.1102230246251563e-16 0 ;
	setAttr ".sp" -type "double3" 0 -1.1102230246251563e-16 0 ;
createNode transform -n "fk_hips" -p "fk_hips_group";
	rename -uid "4F4CC6A1-480B-0E68-03E6-DC8F4662C1A3";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
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
createNode joint -n "bendJoint_1" -p "fk_hips";
	rename -uid "4E43A14F-406C-723C-91B0-BD98E4DD5C7F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 0 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode aimConstraint -n "bendJoint_1_aimConstraint1" -p "bendJoint_1";
	rename -uid "EB600F6A-4DDB-F8BF-190C-4C997BFC54B3";
	addAttr -ci true -sn "w0" -ln "stomachHipsMid_locW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "hipsStomachMid_locW1" -dv 1 -at "double";
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
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 71.753329621503212 22.601825310479917 82.778731309028785 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "hipsStomachMid_loc1" -p "bendJoint_1";
	rename -uid "0A3E5D7B-4411-FD51-92EB-9BABBB5A26AB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 6.6000000000000005 4.4408920985006262e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode locator -n "hipsStomachMid_loc1Shape" -p "hipsStomachMid_loc1";
	rename -uid "6D0F9B10-4E87-98E9-9266-6FBC5D275C1F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_1_group" -p "bendJoint_1";
	rename -uid "E28D7051-438D-B35C-FD5B-CD9379D12AEB";
createNode transform -n "local_1_group_2" -p "local_1_group";
	rename -uid "CAA3908A-44B1-A2D1-F1A5-BF9EBCF6C461";
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "local_1" -p "local_1_group_2";
	rename -uid "C3836750-45BF-C606-6E6C-D483668B1A51";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.1770017293856419e-17 0 4.668009599343603e-20 ;
	setAttr -k on ".r" -type "double3" 0 0 3.0152566888325239e-16 ;
	setAttr -k on ".r";
	setAttr -l on ".internalName" -type "string" "local_1";
createNode nurbsCurve -n "local_1Shape" -p "local_1";
	rename -uid "DD3699E9-4908-A8C6-2976-B4897D543D0B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 9.0139027054473566e-16 -2.3648762430362077e-22
		-1.1989615347515965 9.0139027054473566e-16 -2.3648762430362077e-22
		8.9429483076639149e-16 9.0139027054473566e-16 -2.3648762430362077e-22
		8.9429483076639149e-16 1.1989615347515965 -2.3648762430362077e-22
		8.9429483076639149e-16 -1.1989615347515965 -2.3648762430362077e-22
		8.9429483076639149e-16 9.0139027054473566e-16 -2.3648762430362077e-22
		8.9429483076639149e-16 9.0139027054473566e-16 -1.1989615347515965
		8.9429483076639149e-16 9.0139027054473566e-16 1.1989615347515965
		;
createNode joint -n "bendJoint_2" -p "local_1";
	rename -uid "5738185E-4A2E-750E-AC41-818D3542C3D8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 0.84999999999999931 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode transform -n "bendJoint_1_out" -p "fk_hips";
	rename -uid "6D12896E-417D-CCDB-5629-B8AD4E16881C";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 -6.3611093629270335e-15 89.999999999999986 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
createNode locator -n "bendJoint_1_outShape" -p "bendJoint_1_out";
	rename -uid "84495E32-430F-7BFF-BC49-9DA2733589D6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
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
	setAttr ".t" -type "double3" -3.4694469519536142e-18 1.110223024625161e-16 -2.3592239273284576e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000004 ;
createNode transform -n "hipsStomachMid_aim" -p "hips";
	rename -uid "D766C323-4D8E-570E-AFB9-87884A8CBC39";
	setAttr ".v" no;
createNode locator -n "hipsStomachMid_aimShape" -p "hipsStomachMid_aim";
	rename -uid "9213834D-498F-93F2-9649-B2A163C4C677";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "hipsStomachMid_loc_group" -p "hips";
	rename -uid "1D3E6570-4A45-C2F2-29BE-80A503B5BE7B";
	setAttr ".v" no;
createNode transform -n "hipsStomachMid_loc" -p "hipsStomachMid_loc_group";
	rename -uid "7790EB0E-4E54-6CD0-AD0E-FE87B518FCAF";
createNode locator -n "hipsStomachMid_locShape" -p "hipsStomachMid_loc";
	rename -uid "BDADD86E-4674-5D6F-CC78-52BEA7D220F1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode aimConstraint -n "hipsStomachMid_loc_group_aimConstraint1" -p "hipsStomachMid_loc_group";
	rename -uid "F771EA38-41C4-BB21-DF25-5F87384296A0";
	addAttr -ci true -sn "w0" -ln "hipsStomachMid_aimW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "chest_outW1" -dv 1 -at "double";
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
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" -88.764352952975159 -28.260198395450949 89.414879840509116 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "stomach_group_2" -p "ik_controls";
	rename -uid "EB63DC62-4B00-CA59-8460-D4A3EA3B9BB1";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000009 ;
createNode transform -n "stomach_group" -p "stomach_group_2";
	rename -uid "D1809847-44DD-519A-57A5-018D110C56CF";
createNode orientConstraint -n "stomach_group_orientConstraint1" -p "stomach_group";
	rename -uid "898754C2-4F32-3DD9-B4B1-E58D11E784D6";
	addAttr -ci true -k true -sn "w0" -ln "chest_outW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "hips_outW1" -dv 1 -min 0 -at "double";
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
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "stomach" -p "stomach_group";
	rename -uid "1901839B-436E-6F0F-EE5E-B39A30387B39";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "stomach";
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
createNode transform -n "stomachChestMid_loc" -p "stomach";
	rename -uid "AF481C6E-48DD-3F15-77C2-EE9B9D486FFE";
	setAttr ".t" -type "double3" 3.2959746043559347e-17 3.4000000000000004 -3.3653635433950018e-16 ;
createNode locator -n "stomachChestMid_locShape" -p "stomachChestMid_loc";
	rename -uid "6AF85217-4CDF-0E63-EFAF-9EAB2A4D5B09";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_4_group" -p "stomachChestMid_loc";
	rename -uid "120EC694-44E4-F431-28D4-42AE6885C377";
createNode transform -n "local_4_group_2" -p "local_4_group";
	rename -uid "C74082DA-40BC-09B2-411B-F89FE54F824F";
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "local_4" -p "local_4_group_2";
	rename -uid "AFD8C8DA-45B8-C11D-2CF7-D3AFBA207CBC";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_4";
createNode nurbsCurve -n "local_4Shape" -p "local_4";
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
createNode joint -n "bendJoint_5" -p "local_4";
	rename -uid "47260F3D-4517-5F2B-7B44-5E9CEAFB78DF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 -1.3322676295501878e-15 -1.0842021724856277e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 -7.8062556418956282e-17 3.3499999999999974 1.0744443529331365e-16 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode transform -n "local_3_group" -p "stomach";
	rename -uid "84E57D39-46C0-24A1-7F51-8C842D788303";
createNode transform -n "local_3_group_2" -p "local_3_group";
	rename -uid "498FBFE2-4E10-903B-C49E-16B927595A14";
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "local_3" -p "local_3_group_2";
	rename -uid "AD92BC27-40C1-2946-9D9D-309686403529";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -5.5511151231257827e-17 4.4408920985006262e-16 -1.2197274440461925e-18 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_3";
createNode nurbsCurve -n "local_3Shape" -p "local_3";
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
createNode joint -n "bendJoint_4" -p "local_3";
	rename -uid "C700BEF5-416D-79FA-AE05-FD9EFAC2BE4C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode transform -n "stomachHipsMid_loc" -p "stomach";
	rename -uid "F38356C6-45B8-888A-6FD8-988126545850";
	setAttr ".t" -type "double3" -1.7347234759768071e-18 -3.4000000000000004 1.11022302462516e-16 ;
createNode locator -n "stomachHipsMid_locShape" -p "stomachHipsMid_loc";
	rename -uid "BE88D375-49F2-8F11-F49D-9896C64D8CA4";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_2_group" -p "stomachHipsMid_loc";
	rename -uid "1571A6CF-489D-7BE5-8153-17B9C59CFEC5";
createNode transform -n "local_2_group_2" -p "local_2_group";
	rename -uid "6226FF28-4C11-85CE-984F-AB956461D280";
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "local_2" -p "local_2_group_2";
	rename -uid "AF5CE1E7-4CEF-787C-7BFC-AE97FC0E4789";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 7.6327832942979524e-17 0 -8.9446679230054116e-19 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_2";
createNode nurbsCurve -n "local_2Shape" -p "local_2";
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
createNode joint -n "bendJoint_3" -p "local_2";
	rename -uid "F7FD211A-4451-AC4E-1BC1-9BA8D82FAFFD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 -2.2204460492503131e-16 -1.0842021724855044e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 -1.1275702593849244e-16 1.6499999999999984 5.5500309209533002e-16 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode pointConstraint -n "stomach_group_2_pointConstraint1" -p "stomach_group_2";
	rename -uid "DA82D6AA-4BDB-E227-10AA-38A0D39121CA";
	addAttr -ci true -k true -sn "w0" -ln "hipsMid_locW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "hipsMid_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 2.2381574280128778 9.8607613152626476e-32 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "chest_group" -p "ik_controls";
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
createNode joint -n "bend_joint_7" -p "chest";
	rename -uid "9B90A615-44DE-B3BD-A97E-829B9A19C404";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 5 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode aimConstraint -n "bend_joint_7_aimConstraint1" -p "bend_joint_7";
	rename -uid "4DE2B53C-4961-1F3D-4682-C5A8F3AF9A1F";
	addAttr -ci true -sn "w0" -ln "stomachChestMid_locW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "chestStomachMid_locW1" -dv 1 -at "double";
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
	setAttr ".wum" -type "matrix" -0.99999999999999989 1.224646799147353e-16 0 0 1.224646799147353e-16 0.99999999999999967 1.224646799147353e-16 0
		 1.4997597826618571e-32 1.224646799147353e-16 -0.99999999999999967 0 -0.038593063568717056 4.2459453344188356 -2.2194822940039787 1;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 1.3655785759077037 20.956279240587151 90.381565819649907 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "local_5_group" -p "bend_joint_7";
	rename -uid "F6416B7E-48F6-B477-9F4C-CFAE730865DC";
createNode transform -n "local_5_group_2" -p "local_5_group";
	rename -uid "E1B74540-4EDF-A218-421F-C29793CEB540";
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "local_5" -p "local_5_group_2";
	rename -uid "4A0EF3BC-42DC-6C82-5F33-8CAF08B18676";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.7755575615628914e-16 8.8817841970012523e-16 0 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_5";
createNode nurbsCurve -n "local_5Shape" -p "local_5";
	rename -uid "FA66FE3A-4F40-394A-8DBD-B0ACA1F15EEA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		1.1989615347515965 0 0
		-1.1989615347515965 0 0
		4.5406318786794518e-15 0 0
		4.5406318786794518e-15 1.1989615347515965 0
		4.5406318786794518e-15 -1.1989615347515965 0
		4.5406318786794518e-15 0 0
		4.5406318786794518e-15 0 -1.1989615347515965
		4.5406318786794518e-15 0 1.1989615347515965
		;
createNode joint -n "bend_joint_6" -p "local_5";
	rename -uid "8E7E33A3-402D-51AE-7ADA-40B160D93AE7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 8.8817841970012523e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.1500000000000012 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
createNode transform -n "bend_joint_7_out" -p "bend_joint_7";
	rename -uid "C4D2A2FF-4BE4-9151-82BE-C88905415FE1";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 90 179.99999999999986 -90 ;
createNode locator -n "bend_joint_7_outShape" -p "bend_joint_7_out";
	rename -uid "1E473698-47DB-EFCF-5B10-C888B5B3E14F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "chestStomachMid_loc_group" -p "chest";
	rename -uid "0AB0B4D1-48F0-661A-F947-6BAE0AFA2EDF";
	setAttr ".v" no;
createNode transform -n "chestStomachMid_loc" -p "chestStomachMid_loc_group";
	rename -uid "5B8D8E97-449E-96D6-91E3-F4A60BD6766F";
	setAttr ".t" -type "double3" 0 -6.6000000000000005 4.4408920985006262e-16 ;
createNode locator -n "chestStomachMid_locShape" -p "chestStomachMid_loc";
	rename -uid "DCD5DFCA-4F75-33B7-197E-459B392E2A08";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode aimConstraint -n "chestStomachMid_loc_group_aimConstraint1" -p "chestStomachMid_loc_group";
	rename -uid "E0A31106-43C7-4531-1023-7DBF789BFAB3";
	addAttr -ci true -sn "w0" -ln "chestStomachMid_aimW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "hips_outW1" -dv 1 -at "double";
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
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 90.000000000000071 -30.76383429044937 -90.000000000000071 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "chestStomachMid_aim" -p "chest";
	rename -uid "0FDB77D9-4C9A-8AE8-BFE0-A5AD7DFB4026";
	setAttr ".v" no;
createNode locator -n "chestStomachMid_aimShape" -p "chestStomachMid_aim";
	rename -uid "23A7AE63-4BE2-F6FF-25D3-728553645E7D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "end_out" -p "chest";
	rename -uid "DAAF53A1-46BC-8171-2981-5EBF01FF89D9";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 0 90 ;
createNode transform -n "stomach_orient" -p "ik_controls";
	rename -uid "B69F2751-4E02-C90F-FFA6-74A2D8BA9AD4";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000009 ;
createNode aimConstraint -n "stomach_orient_aimConstraint1" -p "stomach_orient";
	rename -uid "1652D233-4478-947C-422C-AE865B2B85AB";
	addAttr -ci true -sn "w0" -ln "chestStomachMid_locW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "chest_outW1" -dv 1 -at "double";
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
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 6.3611093629270335e-15 -84.763990726118976 55.615120457814577 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode pointConstraint -n "stomach_orient_pointConstraint1" -p "stomach_orient";
	rename -uid "45EF54FF-4396-27F1-BF73-3F935D6F4217";
	addAttr -ci true -k true -sn "w0" -ln "hipsStomachMid_locW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "hips_outW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.24204660357233371 0.74856771957123669 -2.1288789287552148 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "system" -p "mod";
	rename -uid "425C5BC8-4007-736D-CDC0-C2870A98A214";
	setAttr ".v" no;
createNode transform -n "bend_crv" -p "system";
	rename -uid "2954B667-4E30-F3E9-B645-8CB913133A9E";
createNode nurbsCurve -n "bend_crvShape" -p "bend_crv";
	rename -uid "C04DF9E5-4147-FF41-102F-3B9629A9D1FC";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "joints" -p "system";
	rename -uid "12F71793-4423-C54A-13EC-C7AC49495F58";
	setAttr ".ovdt" 1;
	setAttr ".ovc" 15;
createNode transform -n "bendJoints" -p "joints";
	rename -uid "2197FF27-4BFC-0740-FEBC-00A092F60C37";
createNode transform -n "bend_1_foll" -p "bendJoints";
	rename -uid "6D281DD0-4383-B92D-9A52-7DA58FF2296E";
createNode follicle -n "bend_1_follShape" -p "bend_1_foll";
	rename -uid "C33AE334-402A-3FB4-550F-94991C5D0498";
	setAttr -k off ".v";
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_1_jnt" -p "bend_1_foll";
	rename -uid "6D492336-4F58-B7DF-1AF9-F3A19F235B19";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "bend_1_jnt_aimConstraint1" -p "bend_1_jnt";
	rename -uid "99736E46-4203-D822-4294-6495098B5D1B";
	addAttr -ci true -sn "w0" -ln "bend_2_follW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.75877229095216381 8.5250916504991121 5.1051982124773394 ;
	setAttr -k on ".w0";
createNode transform -n "bend_2_foll" -p "bendJoints";
	rename -uid "E0D09F9C-4552-D51B-667C-6CA54069A471";
createNode follicle -n "bend_2_follShape" -p "bend_2_foll";
	rename -uid "B969E202-458B-EC34-81ED-5B9B61971525";
	setAttr -k off ".v" no;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_2_jnt" -p "bend_2_foll";
	rename -uid "CA3E8628-4B38-9315-0BF0-CD8846193F08";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "bend_2_jnt_aimConstraint1" -p "bend_2_jnt";
	rename -uid "F3C848D0-4DCB-E40D-B1B0-DCBAE8B1F098";
	addAttr -ci true -sn "w0" -ln "bend_3_follW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 5.4376959362203374 -16.767404951221064 -18.261262495520448 ;
	setAttr -k on ".w0";
createNode transform -n "bend_3_foll" -p "bendJoints";
	rename -uid "3DD0E7CA-4D80-D44A-6517-2F8978362179";
createNode follicle -n "bend_3_follShape" -p "bend_3_foll";
	rename -uid "D0E0EBCD-44CD-5213-E2C4-9E8E073FD41E";
	setAttr -k off ".v" no;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_3_jnt" -p "bend_3_foll";
	rename -uid "24FDC494-4422-B304-708D-2791DB016DC4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.2779255513307275e-17 0.49999999999999994 3.4694469519536142e-17 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "bend_3_jnt_aimConstraint1" -p "bend_3_jnt";
	rename -uid "ACEEB4D3-45C0-439E-5740-FDB0072CCA03";
	addAttr -ci true -sn "w0" -ln "bend_4_follW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.9559454439317359 -9.0611884171284114 -12.234957279608279 ;
	setAttr -k on ".w0";
createNode transform -n "bend_4_foll" -p "bendJoints";
	rename -uid "A5ED6611-4E1F-E573-DFC9-BFA931911209";
createNode follicle -n "bend_4_follShape" -p "bend_4_foll";
	rename -uid "9696EEB7-4C03-6287-BA9F-F4A97B30AFE3";
	setAttr -k off ".v" no;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_4_jnt" -p "bend_4_foll";
	rename -uid "4A92B28F-4C56-715F-BF78-5688E5DAFDEA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "bend_4_jnt_aimConstraint1" -p "bend_4_jnt";
	rename -uid "D7528CC6-4C02-708D-63BC-5DA17A2C88A5";
	addAttr -ci true -sn "w0" -ln "bend_5_follW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.0040711943580534083 0.71956960984821505 0.324174168691167 ;
	setAttr -k on ".w0";
createNode transform -n "bend_5_foll" -p "bendJoints";
	rename -uid "3F3E2A06-4752-665F-1686-6E94D682D0A2";
createNode follicle -n "bend_5_follShape" -p "bend_5_foll";
	rename -uid "F9C28A49-4FDA-D916-887D-76A99CC077F9";
	setAttr -k off ".v";
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_5_jnt" -p "bend_5_foll";
	rename -uid "748A406D-4BE6-8A3F-AC8C-3D8D422AD874";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 1.1102230246251563e-16 -1.1102230246251563e-16 0
		 1.1102230246251563e-16 1 1.1102230246251563e-16 0 -1.1102230246251563e-16 1.1102230246251563e-16 1 0
		 1.2893798948612516e-17 0 2.0816681711721685e-17 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "bend_5_jnt_aimConstraint1" -p "bend_5_jnt";
	rename -uid "9FFD96B4-4833-EABB-5A08-1290BE22B305";
	addAttr -ci true -sn "w0" -ln "chest_outW0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.108761237545985 7.4297795338068511 8.5122613076307605 ;
	setAttr -k on ".w0";
createNode transform -n "bend_crv_gr" -p "joints";
	rename -uid "E299C8E3-4BD9-8CB8-364D-6F92A332FE9D";
	setAttr ".v" no;
createNode joint -n "bend_crv_0_jnt" -p "bend_crv_gr";
	rename -uid "5573B4AB-40CB-E33F-BCA8-03B4EBE86938";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode joint -n "bend_crv_1_jnt" -p "bend_crv_gr";
	rename -uid "074937C4-49CA-D9A3-BC29-AA8B7EF9CFAD";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode joint -n "bend_crv_2_jnt" -p "bend_crv_gr";
	rename -uid "B1255586-4F87-FF27-90DE-B09FF23C9E40";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode joint -n "bend_crv_3_jnt" -p "bend_crv_gr";
	rename -uid "DD39EFA7-4E14-843D-E00D-07AF26031118";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode joint -n "bend_crv_4_jnt" -p "bend_crv_gr";
	rename -uid "90B58C2C-4500-11BB-B57A-8CA7D9202FCE";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode joint -n "bend_crv_5_jnt" -p "bend_crv_gr";
	rename -uid "CF1FCA28-47F1-852C-088E-588F6D3A2703";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode joint -n "bend_crv_6_jnt" -p "bend_crv_gr";
	rename -uid "A9F90A45-4415-575C-9F35-7F93537448F2";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
createNode transform -n "bend_surf" -p "system";
	rename -uid "8ED631DE-426C-E6CA-BFF4-888391961A5B";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".sp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
createNode nurbsSurface -n "bend_surfShape" -p "bend_surf";
	rename -uid "3DD20690-4B24-8965-5248-FE8098BD9E80";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode nurbsSurface -n "bend_surfShapeOrig3" -p "bend_surf";
	rename -uid "DD53012F-4FA7-3E23-634D-2BBCCD0B4EF8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		2 0 1
		
		14
		0.0043710247026231396 -9.8107190905308977e-06 0.22639549533562153
		0.0043710333730571935 9.8107190905317634e-06 -0.22639549533562059
		-3.4694469519536142e-17 0.86776859504132242 0.22639694415353209
		3.4694469519536142e-17 0.86776859504132253 -0.2263969441535312
		3.5988163824166725e-05 1.6442954775438094 0.22639984178935385
		-3.5988163824165857e-05 1.6442951264830366 -0.22639984178935185
		8.2112349705962067e-05 2.5000000300930223 0.22640418824308492
		-8.2112349705962175e-05 2.4999999699069773 -0.22640418824308328
		0.000128113124338995 3.3444816134180786 0.2264085346968161
		-0.00012811312433899495 3.3444815972842625 -0.22640853469681485
		9.1191646965701716e-05 4.1500000031868751 0.22641143233263689
		-0.00022634935980411972 4.1499999968131274 -0.22641143233263575
		0.00013901251779507764 5.0003361092131327 0.22641288115054736
		-0.00020918445288213775 5.0003361063042799 -0.22641288115054639
		
		;
createNode transform -n "output" -p "mod";
	rename -uid "D004D47A-40F7-DC39-8883-CE952F72F6FB";
createNode transform -n "outJoints" -p "output";
	rename -uid "58F73C13-44F8-B71A-F0C6-7C8807460BAF";
	setAttr ".ovdt" 1;
	setAttr ".ovc" 15;
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "939ABC2C-40D3-00FE-E979-8BAE3D13912F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 0.99999999999999933 0.99999999999999933 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.8116296351744994e-16 1.3086626529693604 1.4529074087936241e-16 0
		 -4.3587222263808726e-16 0 1.3086626529693604 0 1.3086626529693604 -4.3587222263808726e-16 5.8116296351744994e-16 0
		 0 1.4381153442047454 -0.053282215027789577 1;
createNode joint -n "local_1_outJoint" -p "root_outJoint";
	rename -uid "89816955-4528-32AD-A9B8-89A4226984A4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 1;
createNode joint -n "local_2_outJoint" -p "local_1_outJoint";
	rename -uid "7ECCED5F-4374-BAE1-03D8-78B7DB801A19";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.2779255513307275e-17 0.49999999999999994 3.4694469519536142e-17 1;
createNode joint -n "local_3_outJoint" -p "local_2_outJoint";
	rename -uid "FBE119BD-4687-9445-E77C-07A606F1FD52";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 1;
createNode joint -n "local_4_outJoint" -p "local_3_outJoint";
	rename -uid "397D8543-4376-141D-40DC-6EB0B0EB8F40";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
createNode joint -n "local_5_outJoint" -p "local_4_outJoint";
	rename -uid "B2AAE9A7-42BE-33A6-26C1-DB8A31DC5BCF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
createNode joint -n "local_end_outJoint" -p "local_5_outJoint";
	rename -uid "6BC135C0-4800-E214-8B14-A7BB9C5CB66A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.0071222513539054297 0.010420800732546852 -7.6380969223760837e-06 ;
	setAttr ".is" -type "double3" 1 1.0015161037445068 1.0015161037445068 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr ".ds" 2;
createNode joint -n "end_outJoint" -p "outJoints";
	rename -uid "750E3FE8-4F11-3C58-7FBA-92BAD7004742";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -s -n "persp";
	rename -uid "742B74BF-4D6B-9A22-954F-B78DD4DB06E5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -41.38883473053567 20.337566828192248 24.48819122011578 ;
	setAttr ".r" -type "double3" -14.400000000001958 -421.19999999971293 0 ;
	setAttr ".rp" -type "double3" -3.3306690738754696e-16 -4.4408920985006262e-16 -1.7763568394002505e-15 ;
	setAttr ".rpt" -type "double3" -6.7928001781737458e-16 -1.7125212621107998e-16 3.3031043487526458e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "CA638930-4564-E4C8-E58E-CDA4DAE4DF36";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".cap" -type "double2" 1.41732 0.94488 ;
	setAttr ".coi" 51.449945599963158;
	setAttr ".imn" -type "string" "persp1";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.00081803478412015643 3.5094748681805426 5.5511151231257827e-16 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "0CEE38C4-4E21-853D-1E5F-FC8B81451B34";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.057429296159794627 7.7120869509022851 0.016708462577689764 ;
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr ".rp" -type "double3" 3.1554436208840493e-30 -3.1554436208840493e-30 0 ;
	setAttr ".rpt" -type "double3" -3.1554436208840493e-30 -1.4012984643248171e-45 -2.1019476964872256e-45 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "3A50062F-4880-B8B1-298D-0CB583DE5701";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.2118696387156742;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "C360C1BB-4829-C934-1F92-03A5863E5AE1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.95690364349129831 8.2811937399173345 9.7812782260854192 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "27B1D1A3-4B73-C88A-EB3A-79899F2ABCE4";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 11.267772986927936;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "1BBA3B11-47C8-8626-D1B3-81BBC699DA24";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -19.000728992559132 4.2736277098859787 0.0097452773480144472 ;
	setAttr ".r" -type "double3" 0 -90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "53E68386-4A18-3096-E9C3-E1A72D3BCDEB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 17.903010132450422;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode decomposeMatrix -n "chest_group_decomposeMatrix";
	rename -uid "A0259D12-4FBB-6717-A307-058C5F274493";
createNode multMatrix -n "chest_group_multMatrix";
	rename -uid "3FC86DA8-4D88-088F-5455-BF885B160AC5";
	setAttr -s 2 ".i";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "A06C98DA-4E7E-C280-6176-6FA8785BC034";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "58B86A2C-4212-8ABE-C7AE-99AC9F02F997";
	setAttr -s 25 ".lnk";
	setAttr -s 25 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "98773617-46B0-EDCB-32E9-4CB05F2DDBCA";
createNode displayLayer -n "defaultLayer";
	rename -uid "B1DB931A-42AC-3765-6A0C-0E9123FB8239";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "33307E74-49DD-554A-B0AD-269BAD31802C";
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
createNode decomposeMatrix -n "root_poser_decMat";
	rename -uid "72BFC704-4325-F685-B85D-92B28CDC87CE";
createNode objectSet -n "moduleControlSet";
	rename -uid "62EE3B85-44A7-3BD7-1EE5-4388D2CBA37B";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr -s 3 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode multiplyDivide -n "parts_multiplyDivide";
	rename -uid "3FF9B012-42C3-9758-DC7D-E7B95AFEF55D";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4 -4 8 ;
createNode multMatrix -n "end_multMatrix";
	rename -uid "3317B753-476B-8955-47E2-B1A22BAD9976";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "end_decomposeMatrix";
	rename -uid "9A4AD38E-484D-A99C-05E7-A7BB5B092CB9";
createNode condition -n "condition1";
	rename -uid "C9285224-4E2C-58C8-234F-86800B750113";
	setAttr ".ct" -type "float3" 1 1 0 ;
	setAttr ".cf" -type "float3" 0 0 1 ;
createNode condition -n "condition2";
	rename -uid "013D909C-40A6-53DE-766A-72BDDE9C27CE";
	setAttr ".st" 2;
	setAttr ".ct" -type "float3" 1 1 0 ;
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
createNode multiplyDivide -n "multiplyDivide1846";
	rename -uid "80342DC2-4543-0248-3532-ACB6EE1605E3";
	setAttr ".op" 2;
createNode blendTwoAttr -n "squash_blendTwoAttr";
	rename -uid "769B0334-4EB0-4A81-EFE6-27BEB7B80A3E";
	addAttr -ci true -sn "const" -ln "const" -dv 1 -at "double";
	setAttr -s 2 ".i";
	setAttr -s 2 ".i";
	setAttr -k on ".const";
createNode dagPose -n "bindPose3";
	rename -uid "FC9FD4D8-4374-ACB7-1E69-84AD60B3B636";
	setAttr -s 10 ".wm";
	setAttr ".wm[0]" -type "matrix" -2.2204460492503131e-16 -1 0 0 2.2204460492503131e-16 0 -1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr ".wm[2]" -type "matrix" -2.2204460492503131e-16 -1 0 0 2.2204460492503131e-16 0 -1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 1;
	setAttr ".wm[4]" -type "matrix" 2.2204460492503131e-16 -1 0 0 2.2204460492503131e-16 0 -1 0
		 1 2.2204460492503131e-16 2.2204460492503131e-16 0 -1.2779255513307275e-17 0.49999999999999994 3.4694469519536142e-17 1;
	setAttr ".wm[6]" -type "matrix" 2.2204460492503131e-16 -1 0 0 2.2204460492503131e-16 0 -1 0
		 1 2.2204460492503131e-16 2.2204460492503131e-16 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 1;
	setAttr ".wm[8]" -type "matrix" 2.2204460492503131e-16 -1 1.1102230246251563e-16 0
		 1.1102230246251563e-16 -2.2204460492503131e-16 -1 0 1 3.3306690738754696e-16 0 0
		 1.2893798948612516e-17 0 2.0816681711721685e-17 1;
	setAttr -s 10 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 -8.3266726846886741e-17
		 -1.5707963267948968 0 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0.50000000000000011 -0.49999999999999994 0.5 0.50000000000000011 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 -1.3877787807814457e-16
		 -1.5707963267948968 0 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0.50000000000000011 -0.49999999999999994 0.5 0.50000000000000011 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 0 -1.5707963267948966 0 -1.2779255513307275e-17
		 0.49999999999999994 3.4694469519536142e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0.50000000000000011 -0.49999999999999994 0.5 0.50000000000000011 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 6.9388939039072271e-17
		 -1.5707963267948966 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0.50000000000000011 -0.49999999999999994 0.5 0.50000000000000011 1
		 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 0 -1.5707963267948963 0 1.2893798948612516e-17
		 0 2.0816681711721685e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0.50000000000000011 -0.49999999999999994 0.5 0.50000000000000011 1
		 1 1 yes;
	setAttr -s 10 ".m";
	setAttr -s 10 ".p";
	setAttr -s 10 ".g[0:9]" yes no yes no yes no yes no yes no;
	setAttr ".bp" yes;
createNode reverse -n "reverse6";
	rename -uid "F598803D-4086-4348-9837-A6B25032925C";
createNode curveInfo -n "curveInfo3";
	rename -uid "833D9C51-43E4-A822-BDAD-E3892DF1419D";
createNode multiplyDivide -n "multiplyDivide1849";
	rename -uid "B01D061B-4724-5CFB-79C2-F28BBF1C1354";
	setAttr ".op" 2;
	setAttr ".i1" -type "float3" 1 0 0 ;
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
createNode multiplyDivide -n "bendJoint_4_multiply_position";
	rename -uid "D83D5B50-4A7D-FE35-7DAB-09880B8F286A";
	setAttr ".i2" -type "float3" 0.2 0 0.2 ;
createNode distanceBetween -n "stomach_offset_distance";
	rename -uid "532D9A23-4959-E2C5-43CB-2697BB39FFB3";
createNode multiplyDivide -n "stomach_offset_multiplyDivide";
	rename -uid "DBBB1F94-4B53-2110-8BD1-08B500BA7196";
	setAttr ".i2" -type "float3" 0.15000001 -0.15000001 1 ;
createNode addDoubleLinear -n "stomachChestMid_loc_offset";
	rename -uid "511CB7AE-44F1-EB6F-F119-8481DDD77D7E";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "stomachHipsMid_loc_offset";
	rename -uid "EBC45FD0-4A36-FF7D-ED33-77B4DCC59D19";
	setAttr ".ihi" 2;
createNode multDoubleLinear -n "curDistance_part_2";
	rename -uid "6E2EE6B7-457D-B834-2E81-10ADF30F3C12";
	setAttr ".i2" 0.17;
createNode multDoubleLinear -n "curDistance_part_2_rev";
	rename -uid "7AAA66D9-4FE7-D00E-93BD-5893EBFAB6C2";
	setAttr ".i2" -1;
createNode distanceBetween -n "current_distance";
	rename -uid "CA8A6578-4829-FE34-EB25-2AB4964F3874";
createNode pointMatrixMult -n "pointMatrixMult5";
	rename -uid "6734EB7D-4E74-2648-D736-4691DF31E932";
createNode pointMatrixMult -n "pointMatrixMult6";
	rename -uid "2DC62B47-4BE4-F5A8-BF30-74933FAC8943";
createNode multiplyDivide -n "curDistance_scaled_multiplyDivide";
	rename -uid "8E54257D-4F5A-F64A-1E4E-D0BD004BAB10";
	setAttr ".op" 2;
createNode multDoubleLinear -n "curDistance_part_rev";
	rename -uid "2006F7E3-48C3-7F75-4CE3-11815100BAF9";
	setAttr ".i2" -1;
createNode curveFromSurfaceIso -n "curveFromSurfaceIso1";
	rename -uid "BD04208A-4397-591E-F71B-DDAF59F9FCEC";
	setAttr ".ihi" 1;
	setAttr ".max" 0;
	setAttr ".iv" 0.5;
createNode multDoubleLinear -n "multDoubleLinear13";
	rename -uid "B4D37DBD-4DE7-118B-29C4-2797CA238CFB";
	setAttr ".i2" -1;
createNode multDoubleLinear -n "curDistance_part";
	rename -uid "7D5F5C4C-40B5-0A0A-91CE-7CA6E78B5D6E";
	setAttr ".i2" 0.33;
createNode skinCluster -n "skinCluster1";
	rename -uid "CBCB3842-4985-79DD-CE3C-6FBCA21FAA8F";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 2 1
		1 2 1
		1 3 1
		1 3 1
		1 4 1
		1 4 1
		1 5 1
		1 5 1
		1 6 1
		1 6 1;
	setAttr -s 7 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000009 0 0
		 0 0 1.0000000000000009 0 0 0 0 1;
	setAttr ".pm[1]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000009 0 0
		 0 0 1.0000000000000009 0 0 -0.84999999999999987 0 1;
	setAttr ".pm[2]" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 1.1275702593849246e-16 -1.6499999999999977 -5.5500309209532972e-16 1;
	setAttr ".pm[3]" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 0 -2.4999999999999973 -4.4408920985006242e-16 1;
	setAttr ".pm[4]" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 7.8062556418956319e-17 -3.3499999999999961 -1.074444352933136e-16 1;
	setAttr ".pm[5]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 -4.1500000000000021 0 1;
	setAttr ".pm[6]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 -5.0000000000000018 0 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 7 ".ma";
	setAttr -s 7 ".dpf[0:6]"  4 4 4 4 4 4 4;
	setAttr -s 7 ".lw";
	setAttr -s 7 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 6;
	setAttr ".ucm" yes;
createNode tweak -n "tweak26";
	rename -uid "AE31876F-457C-8C5E-B131-3CAD2D768AF3";
createNode objectSet -n "skinCluster1Set";
	rename -uid "1D058A28-4697-D7A7-ADEB-F193821B9F6C";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	rename -uid "124C43E6-45CF-AE85-8E2E-34A11D406D68";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	rename -uid "50D45B63-4525-15A7-7AEA-619835BFF663";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
createNode objectSet -n "tweakSet26";
	rename -uid "2B8170E8-434C-B075-2FD3-38BA58C05A95";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId45";
	rename -uid "9230441E-48F1-D819-895F-9380985C35BB";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts45";
	rename -uid "74093010-4DA5-0828-DDB0-1B8C676CA536";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
createNode multMatrix -n "multMatrix66";
	rename -uid "BEF9DDAC-409C-DD44-D4F1-AC9774659974";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix86";
	rename -uid "19A114A1-42CB-CB79-039C-428AF6D6F613";
createNode unitConversion -n "unitConversion27";
	rename -uid "E5D0CE6B-4397-0A6C-5FF7-6281597467F8";
	setAttr ".cf" 0.333;
createNode unitConversion -n "unitConversion29";
	rename -uid "05E902B2-4241-6891-843A-BFB5424A3982";
	setAttr ".cf" -0.333;
createNode decomposeMatrix -n "decomposeMatrix87";
	rename -uid "34D0C82E-4E47-514F-1A74-D286FDF57823";
createNode multMatrix -n "multMatrix67";
	rename -uid "CBAD2909-456A-2B4C-6C59-C6866B3D36FC";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion30";
	rename -uid "06733093-46C0-4B08-E80B-BABAD080F480";
	setAttr ".cf" -0.333;
createNode unitConversion -n "unitConversion31";
	rename -uid "61789C78-4F26-BD32-B4A3-2591C0480A9D";
	setAttr ".cf" 0.333;
createNode motionPath -n "bend_crv_0_mpath";
	rename -uid "50326FEA-4385-7B29-0178-D08B681FDCEA";
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "bend_crv_1_mpath";
	rename -uid "AAEE7CE5-4D63-4FDC-6CA6-BF89D3ECC84A";
	setAttr ".u" 0.16666666666666666;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "bend_crv_2_mpath";
	rename -uid "A898DF5C-436F-159F-895B-D8A4EC6FF3FA";
	setAttr ".u" 0.33333333333333331;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "bend_crv_3_mpath";
	rename -uid "403FEF40-4FA8-C6B3-EA22-F8ABFC7C59C2";
	setAttr ".u" 0.5;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "bend_crv_4_mpath";
	rename -uid "F7FA5033-4162-31F5-336F-E1B7A9A807C6";
	setAttr ".u" 0.66666666666666663;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "bend_crv_5_mpath";
	rename -uid "916B6C58-4815-F415-AD31-388CB05391FA";
	setAttr ".u" 0.83333333333333326;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "bend_crv_6_mpath";
	rename -uid "808E1293-4A62-5DB7-583D-2C86D42AF547";
	setAttr ".u" 1;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode closestPointOnSurface -n "closestPointOnSurface1";
	rename -uid "4A7F8BDB-43C6-B33B-B290-019F9295C075";
createNode closestPointOnSurface -n "closestPointOnSurface2";
	rename -uid "DD51EF58-4C97-CE3B-1324-348076FD713D";
createNode closestPointOnSurface -n "closestPointOnSurface4";
	rename -uid "085C0D0A-4A95-E812-4043-94B3A67A3F95";
createNode closestPointOnSurface -n "closestPointOnSurface3";
	rename -uid "EAE51C44-4F91-F036-666D-B2A39067F570";
createNode closestPointOnSurface -n "closestPointOnSurface5";
	rename -uid "783CF568-4011-7758-457C-7E9961C3717E";
createNode condition -n "condition7";
	rename -uid "038D9C6B-4549-8341-D9F7-149C437841C1";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.107 1 1 ;
createNode condition -n "condition8";
	rename -uid "547B06A9-4537-24A9-CF96-55A851C5A4EF";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.25999999 1 1 ;
createNode condition -n "condition9";
	rename -uid "C45C8BC1-4A31-65EF-E5E0-E49E36023530";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.74000001 1 1 ;
createNode condition -n "condition10";
	rename -uid "AA1BA962-4C51-4EE1-425A-CB86D2B38B7E";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.49900001 1 1 ;
createNode condition -n "condition11";
	rename -uid "18436DDE-4424-A8A9-1921-2CB3EAA4652E";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.89300001 1 1 ;
createNode multMatrix -n "multMatrix68";
	rename -uid "959C3EEE-4654-561E-A31F-2A870AE59FCB";
	setAttr -s 2 ".i";
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
createNode dagPose -n "bindPose6";
	rename -uid "45D196CF-4F64-F7FD-EED9-6EB35C56E7A8";
	setAttr -s 26 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[4]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 -8.8817841970012523e-16 4.4408920985006262e-16 1;
	setAttr ".wm[5]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 1.1102230246251526e-16 0 1;
	setAttr ".wm[6]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 1.1102230246251526e-16 0 1;
	setAttr ".wm[7]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 1.2499999999999991 0 1;
	setAttr ".wm[8]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 1.2499999999999991 0 1;
	setAttr ".wm[11]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 -8.8817841970012523e-16 4.4408920985006262e-16 1;
	setAttr ".wm[12]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".wm[13]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".wm[14]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".wm[15]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 -1.7347234759768069e-18 1.6499999999999986 5.5511151231257857e-16 1;
	setAttr ".wm[18]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 3.2959746043559341e-17 3.3499999999999988 1.075528555105622e-16 1;
	setAttr ".wm[20]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.9999999999999982 0 1;
	setAttr ".wm[21]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.9999999999999982 0 1;
	setAttr ".wm[23]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.1500000000000004 0 1;
	setAttr ".wm[24]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.1500000000000004 0 1;
	setAttr -s 26 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999967 0.99999999999999967 0
		 0 0 2 0 -8.8817841970012523e-16 4.4408920985006262e-16 0 0 0 0 8.8817841970012523e-16
		 2.2204460492503131e-16 0 -3.9443045261050617e-31 -9.8607613152626443e-32 0 8.8817841970012484e-16
		 2.2204460492503121e-16 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 9.9920072216264089e-16
		 -4.4408920985006281e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999967 0.99999999999999967 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 1.25 0 0 0 0 0 -1.1102230246251563e-16
		 0 0 0 0 0 -1.1102230246251563e-16 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0 0 0 3 0 0 0 0 0 0 0 -1.1102230246251563e-16
		 0 0 0 0 0 -1.1102230246251563e-16 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.25 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0.84999999999999987
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1.0000000000000009 1.0000000000000009 0
		 0 0 2 0 2.5000000000000004 -9.8607613152626476e-32 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.7347234759768071e-18
		 -0.84999999999999987 1.11022302462516e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251563e-16
		 -2.2204460492503131e-16 -1.0842021724855044e-19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.2959746043559347e-17
		 0.84999999999999987 -3.3653635433950018e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251563e-16
		 -1.3322676295501878e-15 -1.0842021724855044e-19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.0000000000000009
		 -4.4408920985006281e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 1.7763568394002505e-15
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -0.84999999999999987
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 8.8817841970012523e-16
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 26 ".m";
	setAttr -s 26 ".p";
	setAttr -s 26 ".g[0:25]" yes yes yes yes yes yes yes yes yes no no 
		yes yes yes yes yes no no yes no yes yes no yes yes no;
	setAttr ".bp" yes;
createNode multMatrix -n "multMatrix69";
	rename -uid "7005723D-42FF-9680-E640-E3B5E29A0174";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix90";
	rename -uid "6E6C486F-4B27-9D82-B112-C7B3584926BF";
createNode distanceBetween -n "distanceBetween1";
	rename -uid "1550D95F-4C90-5511-76CC-2485EECE710B";
createNode decomposeMatrix -n "spine_5_skinJoint_decMat2";
	rename -uid "88E0B3AE-49B1-BFF5-869D-2983E9030CFA";
createNode multMatrix -n "spine_5_skinJoint_multMat2";
	rename -uid "B1E1D4ED-4CD4-9828-EB12-779ADA22C4FA";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "multDoubleLinear14";
	rename -uid "BE524ADC-4DC0-A6FC-DDD7-24AA841854D5";
createNode condition -n "mirror_condition";
	rename -uid "E43FA756-4ED4-EB80-67FD-5F945C8C22D0";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
createNode multiplyDivide -n "multiplyDivide1854";
	rename -uid "B7654F7E-4A40-D595-A946-CE9FF2AA7E8D";
	setAttr ".i2" -type "float3" 0 -0.21000001 0 ;
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "B53A3B5D-4F0B-CA9A-8210-AC859ECD952D";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "multiplyDivide1855";
	rename -uid "6A4B5DC1-4D4B-01A5-1716-90AFFD25D926";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
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
	setAttr -s 5 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode distanceBetween -n "distanceBetween2";
	rename -uid "E436C941-4F77-D899-ACBE-CB95BB7E3668";
createNode multDoubleLinear -n "curDistance_part_3";
	rename -uid "A4735617-40E1-8967-7803-C39D0D159CF0";
	setAttr ".i2" 0.17;
createNode skinCluster -n "skinCluster2";
	rename -uid "87EB2103-4BCD-3014-C771-9FB7B2D00D48";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 2 1
		1 2 1
		1 1 1
		1 1 1
		1 5 1
		1 5 1
		1 6 1
		1 6 1
		1 0 1
		1 0 1
		1 3 1
		1 3 1
		1 4 1
		1 4 1;
	setAttr -s 7 ".pm";
	setAttr ".pm[0]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -3.3500837520938025 -1.6517188132768261e-31 7.438680231994349e-16 1;
	setAttr ".pm[1]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -0.8500369346712815 -4.1910056609755058e-32 1.8874611533076937e-16 1;
	setAttr ".pm[2]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 0 0 0 1;
	setAttr ".pm[3]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -4.1499975100014934 -2.0461067452529524e-31 9.2148455754814527e-16 1;
	setAttr ".pm[4]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -5 -2.4651903288156641e-31 1.1102230246251563e-15 1;
	setAttr ".pm[5]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -1.6499162479061975 -8.1347151553883643e-32 3.6635500142572164e-16 1;
	setAttr ".pm[6]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -2.5 -1.2325951644078309e-31 5.5511151231257827e-16 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 7 ".ma";
	setAttr -s 7 ".dpf[0:6]"  4 4 4 4 4 4 4;
	setAttr -s 7 ".lw";
	setAttr -s 7 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 6;
	setAttr ".ucm" yes;
createNode objectSet -n "skinCluster2Set";
	rename -uid "EC612693-4A85-6A81-D7D3-FDBFBF209AF0";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster2GroupId";
	rename -uid "C96CC627-4948-B05D-1918-F59B25C29815";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster2GroupParts";
	rename -uid "698091C1-4E85-FBF1-2B62-7D8AC7813DD1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
createNode tweak -n "tweak27";
	rename -uid "7AF39B6B-4690-3BFB-F786-A9B1B272B0CF";
createNode objectSet -n "tweakSet27";
	rename -uid "028B4CA7-4AE6-7257-771C-3EA5D6BD9594";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId47";
	rename -uid "826E0833-4E2A-8159-DA37-9B85E325ABD6";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts47";
	rename -uid "6428723C-429B-D590-D691-0D8DE3AF3209";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
createNode dagPose -n "bindPose7";
	rename -uid "EEA680CD-4D1A-97E4-DCCB-A5BCCCA50671";
	setAttr -s 11 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[4]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 3.3500837520938025 0 1;
	setAttr ".wm[5]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 0.8500369346712815 0 1;
	setAttr ".wm[6]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 0 0 1;
	setAttr ".wm[7]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 4.1499975100014934 0 1;
	setAttr ".wm[8]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 5 0 1;
	setAttr ".wm[9]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 1.6499162479061975 0 1;
	setAttr ".wm[10]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 2.5 0 1;
	setAttr -s 11 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 3.3500837520938025 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 0.8500369346712815 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 4.1499975100014934 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 1.6499162479061975 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 2.5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 11 ".m";
	setAttr -s 11 ".p";
	setAttr -s 11 ".g[0:10]" yes yes yes yes no no no no no no no;
	setAttr ".bp" yes;
createNode multMatrix -n "end_multMatrix1";
	rename -uid "7CA88CDC-43B4-CEE8-D529-3880D569445C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "end_decomposeMatrix1";
	rename -uid "92EBAE6E-4704-1AA4-E0C9-64BE2485CDC5";
createNode distanceBetween -n "distanceBetween3";
	rename -uid "A520ED76-4237-F99E-1B68-D3B2F46E1F40";
createNode multiplyDivide -n "multiplyDivide1856";
	rename -uid "A606C17E-4AC5-C049-7539-91A76931ADCC";
	setAttr ".i2" -type "float3" -0.20999999 -0.20999999 -0.20999999 ;
createNode decomposeMatrix -n "local_end_outJoint_decMat";
	rename -uid "3CBB290A-4EE5-8595-670D-E98496608DBC";
createNode multMatrix -n "local_end_outJoint_multMat";
	rename -uid "D22EB26C-4F6E-69DA-D796-95B2CB71D488";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix74";
	rename -uid "68D5B9F0-40BD-5748-A63F-BDBE378260D6";
createNode decomposeMatrix -n "decomposeMatrix94";
	rename -uid "A2B794CA-4FD1-099A-759F-8487E1E17493";
createNode quatToEuler -n "quatToEuler1";
	rename -uid "AD66D88D-4921-C720-215F-7288C510AEB3";
	setAttr ".iqx" 0.54406910772189687;
createNode quatToEuler -n "quatToEuler2";
	rename -uid "B6413183-48DD-EA41-0FE0-4184DB6868AC";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "A4BB94CD-4D15-F460-E994-C5A69A4F2524";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "A7344866-4074-D3E7-F214-0D9BFDED45CB";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "8DBE1D78-4612-053F-6D5F-088A4D6E19AF";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "2C99F9FD-4B12-BFE0-4FAA-90BF6B5E7AC9";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "8E5A3603-4D78-E150-EABE-D691658D0EE9";
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
createNode decomposeMatrix -n "decomposeMatrix93";
	rename -uid "91FAA934-4F51-D8F0-65C1-EB8747DAF8BF";
createNode multMatrix -n "multMatrix73";
	rename -uid "D82C3CB5-4987-313E-CA06-1BA5548B7EC7";
	setAttr -s 2 ".i";
createNode objectSet -n "skinJointsSet";
	rename -uid "21F37984-4ADA-439C-E3EF-C3B6C988AE7B";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
createNode multDoubleLinear -n "multDoubleLinear15";
	rename -uid "EC959A45-4DC6-AE4B-69F3-CEA500AA2097";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "559190F4-45D0-D014-A518-BF94CFF1792D";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -2216.6670043317067 -1755.357188412122 ;
	setAttr ".tgi[0].vh" -type "double2" 11497.61901649219 1958.9286088943495 ;
	setAttr -s 5 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 2130;
	setAttr ".tgi[0].ni[0].y" -255.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 6637.14306640625;
	setAttr ".tgi[0].ni[1].y" 345.71429443359375;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 2457.117919921875;
	setAttr ".tgi[0].ni[2].y" 525.63507080078125;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 2290;
	setAttr ".tgi[0].ni[3].y" 427.14285278320312;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 6944.28564453125;
	setAttr ".tgi[0].ni[4].y" 345.71429443359375;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -2123.2146270927888 -1822.0238524296935 ;
	setAttr ".tgi[1].vh" -type "double2" 11591.071393731107 1892.261944876778 ;
	setAttr -s 80 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 5098.5712890625;
	setAttr ".tgi[1].ni[0].y" 590;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 5098.5712890625;
	setAttr ".tgi[1].ni[1].y" -2047.142822265625;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 5098.5712890625;
	setAttr ".tgi[1].ni[2].y" 894.28570556640625;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 3717.142822265625;
	setAttr ".tgi[1].ni[3].y" 458.57144165039062;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 4672.85693359375;
	setAttr ".tgi[1].ni[4].y" -202.85714721679688;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 5098.5712890625;
	setAttr ".tgi[1].ni[5].y" 995.71429443359375;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 5098.5712890625;
	setAttr ".tgi[1].ni[6].y" -2554.28564453125;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" 4331.4287109375;
	setAttr ".tgi[1].ni[7].y" 804.28570556640625;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[1].ni[8].x" 5098.5712890625;
	setAttr ".tgi[1].ni[8].y" 1604.2857666015625;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" 4672.85693359375;
	setAttr ".tgi[1].ni[9].y" -1052.857177734375;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[1].ni[10].x" 4672.85693359375;
	setAttr ".tgi[1].ni[10].y" 1021.4285888671875;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" 4672.85693359375;
	setAttr ".tgi[1].ni[11].y" -2078.571533203125;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" 5098.5712890625;
	setAttr ".tgi[1].ni[12].y" -728.5714111328125;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" 5098.5712890625;
	setAttr ".tgi[1].ni[13].y" 285.71429443359375;
	setAttr ".tgi[1].ni[13].nvs" 18304;
	setAttr ".tgi[1].ni[14].x" 5098.5712890625;
	setAttr ".tgi[1].ni[14].y" -1235.7142333984375;
	setAttr ".tgi[1].ni[14].nvs" 18304;
	setAttr ".tgi[1].ni[15].x" 1874.2857666015625;
	setAttr ".tgi[1].ni[15].y" 840;
	setAttr ".tgi[1].ni[15].nvs" 18305;
	setAttr ".tgi[1].ni[16].x" 3102.857177734375;
	setAttr ".tgi[1].ni[16].y" 644.28570556640625;
	setAttr ".tgi[1].ni[16].nvs" 18304;
	setAttr ".tgi[1].ni[17].x" 5098.5712890625;
	setAttr ".tgi[1].ni[17].y" 691.4285888671875;
	setAttr ".tgi[1].ni[17].nvs" 18304;
	setAttr ".tgi[1].ni[18].x" 5098.5712890625;
	setAttr ".tgi[1].ni[18].y" -2452.857177734375;
	setAttr ".tgi[1].ni[18].nvs" 18304;
	setAttr ".tgi[1].ni[19].x" 4672.85693359375;
	setAttr ".tgi[1].ni[19].y" 418.57144165039062;
	setAttr ".tgi[1].ni[19].nvs" 18304;
	setAttr ".tgi[1].ni[20].x" 5098.5712890625;
	setAttr ".tgi[1].ni[20].y" -18.571428298950195;
	setAttr ".tgi[1].ni[20].nvs" 18304;
	setAttr ".tgi[1].ni[21].x" 5098.5712890625;
	setAttr ".tgi[1].ni[21].y" -627.14288330078125;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" 4672.85693359375;
	setAttr ".tgi[1].ni[22].y" -304.28570556640625;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" 4672.85693359375;
	setAttr ".tgi[1].ni[23].y" -507.14285278320312;
	setAttr ".tgi[1].ni[23].nvs" 18304;
	setAttr ".tgi[1].ni[24].x" 5098.5712890625;
	setAttr ".tgi[1].ni[24].y" -525.71429443359375;
	setAttr ".tgi[1].ni[24].nvs" 18304;
	setAttr ".tgi[1].ni[25].x" 5098.5712890625;
	setAttr ".tgi[1].ni[25].y" -424.28570556640625;
	setAttr ".tgi[1].ni[25].nvs" 18304;
	setAttr ".tgi[1].ni[26].x" 5098.5712890625;
	setAttr ".tgi[1].ni[26].y" 792.85711669921875;
	setAttr ".tgi[1].ni[26].nvs" 18304;
	setAttr ".tgi[1].ni[27].x" 5098.5712890625;
	setAttr ".tgi[1].ni[27].y" 184.28572082519531;
	setAttr ".tgi[1].ni[27].nvs" 18304;
	setAttr ".tgi[1].ni[28].x" 5098.5712890625;
	setAttr ".tgi[1].ni[28].y" -2148.571533203125;
	setAttr ".tgi[1].ni[28].nvs" 18304;
	setAttr ".tgi[1].ni[29].x" 5098.5712890625;
	setAttr ".tgi[1].ni[29].y" 1502.857177734375;
	setAttr ".tgi[1].ni[29].nvs" 18304;
	setAttr ".tgi[1].ni[30].x" 4672.85693359375;
	setAttr ".tgi[1].ni[30].y" 862.85711669921875;
	setAttr ".tgi[1].ni[30].nvs" 18304;
	setAttr ".tgi[1].ni[31].x" 2488.571533203125;
	setAttr ".tgi[1].ni[31].y" 692.85711669921875;
	setAttr ".tgi[1].ni[31].nvs" 18304;
	setAttr ".tgi[1].ni[32].x" 4672.85693359375;
	setAttr ".tgi[1].ni[32].y" -101.42857360839844;
	setAttr ".tgi[1].ni[32].nvs" 18304;
	setAttr ".tgi[1].ni[33].x" 4331.4287109375;
	setAttr ".tgi[1].ni[33].y" 645.71429443359375;
	setAttr ".tgi[1].ni[33].nvs" 18305;
	setAttr ".tgi[1].ni[34].x" 4331.4287109375;
	setAttr ".tgi[1].ni[34].y" 308.57144165039062;
	setAttr ".tgi[1].ni[34].nvs" 18304;
	setAttr ".tgi[1].ni[35].x" 4672.85693359375;
	setAttr ".tgi[1].ni[35].y" 317.14285278320312;
	setAttr ".tgi[1].ni[35].nvs" 18304;
	setAttr ".tgi[1].ni[36].x" 5098.5712890625;
	setAttr ".tgi[1].ni[36].y" -2351.428466796875;
	setAttr ".tgi[1].ni[36].nvs" 18304;
	setAttr ".tgi[1].ni[37].x" 5098.5712890625;
	setAttr ".tgi[1].ni[37].y" 1401.4285888671875;
	setAttr ".tgi[1].ni[37].nvs" 18304;
	setAttr ".tgi[1].ni[38].x" 5098.5712890625;
	setAttr ".tgi[1].ni[38].y" -830;
	setAttr ".tgi[1].ni[38].nvs" 18304;
	setAttr ".tgi[1].ni[39].x" 4024.28564453125;
	setAttr ".tgi[1].ni[39].y" 125.71428680419922;
	setAttr ".tgi[1].ni[39].nvs" 18304;
	setAttr ".tgi[1].ni[40].x" 5098.5712890625;
	setAttr ".tgi[1].ni[40].y" -2250;
	setAttr ".tgi[1].ni[40].nvs" 18304;
	setAttr ".tgi[1].ni[41].x" 4024.28564453125;
	setAttr ".tgi[1].ni[41].y" 227.14285278320312;
	setAttr ".tgi[1].ni[41].nvs" 18304;
	setAttr ".tgi[1].ni[42].x" 5098.5712890625;
	setAttr ".tgi[1].ni[42].y" -120;
	setAttr ".tgi[1].ni[42].nvs" 18304;
	setAttr ".tgi[1].ni[43].x" 5098.5712890625;
	setAttr ".tgi[1].ni[43].y" -931.4285888671875;
	setAttr ".tgi[1].ni[43].nvs" 18304;
	setAttr ".tgi[1].ni[44].x" 5098.5712890625;
	setAttr ".tgi[1].ni[44].y" 1300;
	setAttr ".tgi[1].ni[44].nvs" 18304;
	setAttr ".tgi[1].ni[45].x" 4659.77978515625;
	setAttr ".tgi[1].ni[45].y" 53.873512268066406;
	setAttr ".tgi[1].ni[45].nvs" 18304;
	setAttr ".tgi[1].ni[46].x" 4331.4287109375;
	setAttr ".tgi[1].ni[46].y" -401.42855834960938;
	setAttr ".tgi[1].ni[46].nvs" 18304;
	setAttr ".tgi[1].ni[47].x" 3410;
	setAttr ".tgi[1].ni[47].y" 724.28570556640625;
	setAttr ".tgi[1].ni[47].nvs" 18304;
	setAttr ".tgi[1].ni[48].x" 5098.5712890625;
	setAttr ".tgi[1].ni[48].y" -1742.857177734375;
	setAttr ".tgi[1].ni[48].nvs" 18304;
	setAttr ".tgi[1].ni[49].x" 5098.5712890625;
	setAttr ".tgi[1].ni[49].y" -1844.2857666015625;
	setAttr ".tgi[1].ni[49].nvs" 18304;
	setAttr ".tgi[1].ni[50].x" 3717.142822265625;
	setAttr ".tgi[1].ni[50].y" 674.28570556640625;
	setAttr ".tgi[1].ni[50].nvs" 18304;
	setAttr ".tgi[1].ni[51].x" 5098.5712890625;
	setAttr ".tgi[1].ni[51].y" -1641.4285888671875;
	setAttr ".tgi[1].ni[51].nvs" 18304;
	setAttr ".tgi[1].ni[52].x" 5098.5712890625;
	setAttr ".tgi[1].ni[52].y" -322.85714721679688;
	setAttr ".tgi[1].ni[52].nvs" 18304;
	setAttr ".tgi[1].ni[53].x" 5098.5712890625;
	setAttr ".tgi[1].ni[53].y" -1540;
	setAttr ".tgi[1].ni[53].nvs" 18304;
	setAttr ".tgi[1].ni[54].x" 2136.890869140625;
	setAttr ".tgi[1].ni[54].y" 996.97479248046875;
	setAttr ".tgi[1].ni[54].nvs" 18304;
	setAttr ".tgi[1].ni[55].x" 3410;
	setAttr ".tgi[1].ni[55].y" 622.85711669921875;
	setAttr ".tgi[1].ni[55].nvs" 18304;
	setAttr ".tgi[1].ni[56].x" 5098.5712890625;
	setAttr ".tgi[1].ni[56].y" -1945.7142333984375;
	setAttr ".tgi[1].ni[56].nvs" 18304;
	setAttr ".tgi[1].ni[57].x" 5098.5712890625;
	setAttr ".tgi[1].ni[57].y" -1438.5714111328125;
	setAttr ".tgi[1].ni[57].nvs" 18304;
	setAttr ".tgi[1].ni[58].x" 2795.71435546875;
	setAttr ".tgi[1].ni[58].y" 667.14288330078125;
	setAttr ".tgi[1].ni[58].nvs" 18304;
	setAttr ".tgi[1].ni[59].x" 5098.5712890625;
	setAttr ".tgi[1].ni[59].y" 1198.5714111328125;
	setAttr ".tgi[1].ni[59].nvs" 18304;
	setAttr ".tgi[1].ni[60].x" 4672.85693359375;
	setAttr ".tgi[1].ni[60].y" 1122.857177734375;
	setAttr ".tgi[1].ni[60].nvs" 18304;
	setAttr ".tgi[1].ni[61].x" 5098.5712890625;
	setAttr ".tgi[1].ni[61].y" 82.857139587402344;
	setAttr ".tgi[1].ni[61].nvs" 18304;
	setAttr ".tgi[1].ni[62].x" 5098.5712890625;
	setAttr ".tgi[1].ni[62].y" 488.57144165039062;
	setAttr ".tgi[1].ni[62].nvs" 18304;
	setAttr ".tgi[1].ni[63].x" 5098.5712890625;
	setAttr ".tgi[1].ni[63].y" 1097.142822265625;
	setAttr ".tgi[1].ni[63].nvs" 18304;
	setAttr ".tgi[1].ni[64].x" 3717.142822265625;
	setAttr ".tgi[1].ni[64].y" 300;
	setAttr ".tgi[1].ni[64].nvs" 18304;
	setAttr ".tgi[1].ni[65].x" 5098.5712890625;
	setAttr ".tgi[1].ni[65].y" -1134.2857666015625;
	setAttr ".tgi[1].ni[65].nvs" 18304;
	setAttr ".tgi[1].ni[66].x" 4331.4287109375;
	setAttr ".tgi[1].ni[66].y" -71.428573608398438;
	setAttr ".tgi[1].ni[66].nvs" 18304;
	setAttr ".tgi[1].ni[67].x" 5098.5712890625;
	setAttr ".tgi[1].ni[67].y" -221.42857360839844;
	setAttr ".tgi[1].ni[67].nvs" 18304;
	setAttr ".tgi[1].ni[68].x" 4331.4287109375;
	setAttr ".tgi[1].ni[68].y" 207.14285278320312;
	setAttr ".tgi[1].ni[68].nvs" 18304;
	setAttr ".tgi[1].ni[69].x" 5098.5712890625;
	setAttr ".tgi[1].ni[69].y" 387.14285278320312;
	setAttr ".tgi[1].ni[69].nvs" 18304;
	setAttr ".tgi[1].ni[70].x" 4672.85693359375;
	setAttr ".tgi[1].ni[70].y" 1562.857177734375;
	setAttr ".tgi[1].ni[70].nvs" 18304;
	setAttr ".tgi[1].ni[71].x" 4672.85693359375;
	setAttr ".tgi[1].ni[71].y" 158.57142639160156;
	setAttr ".tgi[1].ni[71].nvs" 18304;
	setAttr ".tgi[1].ni[72].x" 4672.85693359375;
	setAttr ".tgi[1].ni[72].y" -2180;
	setAttr ".tgi[1].ni[72].nvs" 18304;
	setAttr ".tgi[1].ni[73].x" 5098.5712890625;
	setAttr ".tgi[1].ni[73].y" -1032.857177734375;
	setAttr ".tgi[1].ni[73].nvs" 18304;
	setAttr ".tgi[1].ni[74].x" 5098.5712890625;
	setAttr ".tgi[1].ni[74].y" -1337.142822265625;
	setAttr ".tgi[1].ni[74].nvs" 18304;
	setAttr ".tgi[1].ni[75].x" 4672.85693359375;
	setAttr ".tgi[1].ni[75].y" 1402.857177734375;
	setAttr ".tgi[1].ni[75].nvs" 18305;
	setAttr ".tgi[1].ni[76].x" 4331.4287109375;
	setAttr ".tgi[1].ni[76].y" 1077.142822265625;
	setAttr ".tgi[1].ni[76].nvs" 18304;
	setAttr ".tgi[1].ni[77].x" 4024.28564453125;
	setAttr ".tgi[1].ni[77].y" -50;
	setAttr ".tgi[1].ni[77].nvs" 18304;
	setAttr ".tgi[1].ni[78].x" 4672.85693359375;
	setAttr ".tgi[1].ni[78].y" -405.71429443359375;
	setAttr ".tgi[1].ni[78].nvs" 18304;
	setAttr ".tgi[1].ni[79].x" 4672.85693359375;
	setAttr ".tgi[1].ni[79].y" -780;
	setAttr ".tgi[1].ni[79].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -1676.4193473044943 -2380.9522863418301 ;
	setAttr ".tgi[2].vh" -type "double2" 1760.9431534696294 -1449.9999423821714 ;
	setAttr -s 13 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 1782.7542724609375;
	setAttr ".tgi[2].ni[0].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" 1561.32568359375;
	setAttr ".tgi[2].ni[1].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" -382.60504150390625;
	setAttr ".tgi[2].ni[2].y" -1589.4117431640625;
	setAttr ".tgi[2].ni[2].nvs" 18305;
	setAttr ".tgi[2].ni[3].x" 1339.8970947265625;
	setAttr ".tgi[2].ni[3].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" 2004.182861328125;
	setAttr ".tgi[2].ni[4].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" 11.325658798217773;
	setAttr ".tgi[2].ni[5].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[5].nvs" 18304;
	setAttr ".tgi[2].ni[6].x" 454.18280029296875;
	setAttr ".tgi[2].ni[6].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[6].nvs" 18304;
	setAttr ".tgi[2].ni[7].x" 335.27523803710938;
	setAttr ".tgi[2].ni[7].y" -1680.7513427734375;
	setAttr ".tgi[2].ni[7].nvs" 18304;
	setAttr ".tgi[2].ni[8].x" 1118.468505859375;
	setAttr ".tgi[2].ni[8].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[8].nvs" 18304;
	setAttr ".tgi[2].ni[9].x" 675.61138916015625;
	setAttr ".tgi[2].ni[9].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[9].nvs" 18304;
	setAttr ".tgi[2].ni[10].x" -13.044088363647461;
	setAttr ".tgi[2].ni[10].y" -1873.188232421875;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" 897.0399169921875;
	setAttr ".tgi[2].ni[11].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[11].nvs" 18304;
	setAttr ".tgi[2].ni[12].x" 232.75422668457031;
	setAttr ".tgi[2].ni[12].y" -2026.9698486328125;
	setAttr ".tgi[2].ni[12].nvs" 18304;
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
	setAttr -s 63 ".u";
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
	setAttr -s 2 ".dsm";
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
	setAttr -k on ".hio";
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
connectAttr "parts_multiplyDivide.ox" "fk_1_initLoc.ty";
connectAttr "parts_multiplyDivide.ox" "fk_2_initLoc.ty";
connectAttr "parts_multiplyDivide.ox" "fk_3_initLoc.ty";
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
connectAttr "makeNurbSphere3.os" "local_4_poserShape.cr";
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
connectAttr "makeNurbSphere2.os" "local_5_poserShape.cr";
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
connectAttr "parts_multiplyDivide.ox" "fk_bone_1_group_pos.ty";
connectAttr "parts_multiplyDivide.ox" "fk_bone_2_group_pos.ty";
connectAttr "parts_multiplyDivide.ox" "fk_bone_3_group_pos.ty";
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
connectAttr "fk_2_pivot_loc_pointConstraint1.ctx" "fk_3_pivot_loc.tx";
connectAttr "fk_2_pivot_loc_pointConstraint1.cty" "fk_3_pivot_loc.ty";
connectAttr "fk_2_pivot_loc_pointConstraint1.ctz" "fk_3_pivot_loc.tz";
connectAttr "fk_3_pivot_loc.pim" "fk_2_pivot_loc_pointConstraint1.cpim";
connectAttr "fk_3_pivot_loc.rp" "fk_2_pivot_loc_pointConstraint1.crp";
connectAttr "fk_3_pivot_loc.rpt" "fk_2_pivot_loc_pointConstraint1.crt";
connectAttr "local_5_poser.t" "fk_2_pivot_loc_pointConstraint1.tg[0].tt";
connectAttr "local_5_poser.rp" "fk_2_pivot_loc_pointConstraint1.tg[0].trp";
connectAttr "local_5_poser.rpt" "fk_2_pivot_loc_pointConstraint1.tg[0].trt";
connectAttr "local_5_poser.pm" "fk_2_pivot_loc_pointConstraint1.tg[0].tpm";
connectAttr "fk_2_pivot_loc_pointConstraint1.w0" "fk_2_pivot_loc_pointConstraint1.tg[0].tw"
		;
connectAttr "local_4_poser.t" "fk_2_pivot_loc_pointConstraint1.tg[1].tt";
connectAttr "local_4_poser.rp" "fk_2_pivot_loc_pointConstraint1.tg[1].trp";
connectAttr "local_4_poser.rpt" "fk_2_pivot_loc_pointConstraint1.tg[1].trt";
connectAttr "local_4_poser.pm" "fk_2_pivot_loc_pointConstraint1.tg[1].tpm";
connectAttr "fk_2_pivot_loc_pointConstraint1.w1" "fk_2_pivot_loc_pointConstraint1.tg[1].tw"
		;
connectAttr "end_poserOrient.r" "initJoints.r";
connectAttr "bend_6_posJoint_pointConstraint1.ctx" "local_5_initJoint.tx";
connectAttr "bend_6_posJoint_pointConstraint1.cty" "local_5_initJoint.ty";
connectAttr "bend_6_posJoint_pointConstraint1.ctz" "local_5_initJoint.tz";
connectAttr "local_5_initJoint.pim" "bend_6_posJoint_pointConstraint1.cpim";
connectAttr "local_5_initJoint.rp" "bend_6_posJoint_pointConstraint1.crp";
connectAttr "local_5_initJoint.rpt" "bend_6_posJoint_pointConstraint1.crt";
connectAttr "local_5_poser.t" "bend_6_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_5_poser.rp" "bend_6_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_5_poser.rpt" "bend_6_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_5_poser.pm" "bend_6_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_6_posJoint_pointConstraint1.w0" "bend_6_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_5_posJoint_pointConstraint1.ctx" "local_4_initJoint.tx";
connectAttr "bend_5_posJoint_pointConstraint1.cty" "local_4_initJoint.ty";
connectAttr "bend_5_posJoint_pointConstraint1.ctz" "local_4_initJoint.tz";
connectAttr "local_4_initJoint.pim" "bend_5_posJoint_pointConstraint1.cpim";
connectAttr "local_4_initJoint.rp" "bend_5_posJoint_pointConstraint1.crp";
connectAttr "local_4_initJoint.rpt" "bend_5_posJoint_pointConstraint1.crt";
connectAttr "local_4_poser.t" "bend_5_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_4_poser.rp" "bend_5_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_4_poser.rpt" "bend_5_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_4_poser.pm" "bend_5_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_5_posJoint_pointConstraint1.w0" "bend_5_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_4_posJoint_pointConstraint1.ctx" "local_3_initJoint.tx";
connectAttr "bend_4_posJoint_pointConstraint1.cty" "local_3_initJoint.ty";
connectAttr "bend_4_posJoint_pointConstraint1.ctz" "local_3_initJoint.tz";
connectAttr "local_3_initJoint.pim" "bend_4_posJoint_pointConstraint1.cpim";
connectAttr "local_3_initJoint.rp" "bend_4_posJoint_pointConstraint1.crp";
connectAttr "local_3_initJoint.rpt" "bend_4_posJoint_pointConstraint1.crt";
connectAttr "local_3_poser.t" "bend_4_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_3_poser.rp" "bend_4_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_3_poser.rpt" "bend_4_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_3_poser.pm" "bend_4_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_4_posJoint_pointConstraint1.w0" "bend_4_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_3_posJoint_pointConstraint1.ctx" "local_2_initJoint.tx";
connectAttr "bend_3_posJoint_pointConstraint1.cty" "local_2_initJoint.ty";
connectAttr "bend_3_posJoint_pointConstraint1.ctz" "local_2_initJoint.tz";
connectAttr "local_2_initJoint.pim" "bend_3_posJoint_pointConstraint1.cpim";
connectAttr "local_2_initJoint.rp" "bend_3_posJoint_pointConstraint1.crp";
connectAttr "local_2_initJoint.rpt" "bend_3_posJoint_pointConstraint1.crt";
connectAttr "local_2_poser.t" "bend_3_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_2_poser.rp" "bend_3_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_2_poser.rpt" "bend_3_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_2_poser.pm" "bend_3_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_3_posJoint_pointConstraint1.w0" "bend_3_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_2_posJoint_pointConstraint1.ctx" "local_1_initJoint.tx";
connectAttr "bend_2_posJoint_pointConstraint1.cty" "local_1_initJoint.ty";
connectAttr "bend_2_posJoint_pointConstraint1.ctz" "local_1_initJoint.tz";
connectAttr "local_1_initJoint.pim" "bend_2_posJoint_pointConstraint1.cpim";
connectAttr "local_1_initJoint.rp" "bend_2_posJoint_pointConstraint1.crp";
connectAttr "local_1_initJoint.rpt" "bend_2_posJoint_pointConstraint1.crt";
connectAttr "local_1_poser.t" "bend_2_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_1_poser.rp" "bend_2_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_1_poser.rpt" "bend_2_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_1_poser.pm" "bend_2_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_2_posJoint_pointConstraint1.w0" "bend_2_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_1_posJoint_pointConstraint1.cty" "root_initJoint.ty";
connectAttr "bend_1_posJoint_pointConstraint1.ctx" "root_initJoint.tx";
connectAttr "bend_1_posJoint_pointConstraint1.ctz" "root_initJoint.tz";
connectAttr "root_initJoint.pim" "bend_1_posJoint_pointConstraint1.cpim";
connectAttr "root_initJoint.rp" "bend_1_posJoint_pointConstraint1.crp";
connectAttr "root_initJoint.rpt" "bend_1_posJoint_pointConstraint1.crt";
connectAttr "root_poser.t" "bend_1_posJoint_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "bend_1_posJoint_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "bend_1_posJoint_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "bend_1_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_1_posJoint_pointConstraint1.w0" "bend_1_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_7_posJoint_pointConstraint1.ctx" "end_initJoint.tx";
connectAttr "bend_7_posJoint_pointConstraint1.cty" "end_initJoint.ty";
connectAttr "bend_7_posJoint_pointConstraint1.ctz" "end_initJoint.tz";
connectAttr "end_initJoint_orientConstraint1.crx" "end_initJoint.rx";
connectAttr "end_initJoint_orientConstraint1.cry" "end_initJoint.ry";
connectAttr "end_initJoint_orientConstraint1.crz" "end_initJoint.rz";
connectAttr "end_initJoint.pim" "bend_7_posJoint_pointConstraint1.cpim";
connectAttr "end_initJoint.rp" "bend_7_posJoint_pointConstraint1.crp";
connectAttr "end_initJoint.rpt" "bend_7_posJoint_pointConstraint1.crt";
connectAttr "end_poser.t" "bend_7_posJoint_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "bend_7_posJoint_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "bend_7_posJoint_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "bend_7_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_7_posJoint_pointConstraint1.w0" "bend_7_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "end_initJoint.ro" "end_initJoint_orientConstraint1.cro";
connectAttr "end_initJoint.pim" "end_initJoint_orientConstraint1.cpim";
connectAttr "end_initJoint.jo" "end_initJoint_orientConstraint1.cjo";
connectAttr "end_initJoint.is" "end_initJoint_orientConstraint1.is";
connectAttr "end_poser.r" "end_initJoint_orientConstraint1.tg[0].tr";
connectAttr "end_poser.ro" "end_initJoint_orientConstraint1.tg[0].tro";
connectAttr "end_poser.pm" "end_initJoint_orientConstraint1.tg[0].tpm";
connectAttr "end_initJoint_orientConstraint1.w0" "end_initJoint_orientConstraint1.tg[0].tw"
		;
connectAttr "skinCluster2GroupId.id" "init_surfShape.iog.og[23].gid";
connectAttr "skinCluster2Set.mwc" "init_surfShape.iog.og[23].gco";
connectAttr "groupId47.id" "init_surfShape.iog.og[24].gid";
connectAttr "tweakSet27.mwc" "init_surfShape.iog.og[24].gco";
connectAttr "skinCluster2.og[0]" "init_surfShape.cr";
connectAttr "tweak27.pl[0].cp[0]" "init_surfShape.twl";
connectAttr "local_1_initFollShape.ot" "local_1_initFoll.t";
connectAttr "local_1_initFollShape.or" "local_1_initFoll.r";
connectAttr "root_poser_decMat.osx" "local_1_initFoll.sx";
connectAttr "root_poser_decMat.osy" "local_1_initFoll.sy";
connectAttr "root_poser_decMat.osz" "local_1_initFoll.sz";
connectAttr "init_surfShape.ws" "local_1_initFollShape.is";
connectAttr "local_1_initLoc_aimConstraint1.crx" "local_1_initLoc.rx";
connectAttr "local_1_initLoc_aimConstraint1.cry" "local_1_initLoc.ry";
connectAttr "local_1_initLoc_aimConstraint1.crz" "local_1_initLoc.rz";
connectAttr "root_poser_decMat.osx" "local_1_initLoc.sx";
connectAttr "root_poser_decMat.osy" "local_1_initLoc.sy";
connectAttr "root_poser_decMat.osz" "local_1_initLoc.sz";
connectAttr "local_1_initLoc.pim" "local_1_initLoc_aimConstraint1.cpim";
connectAttr "local_1_initLoc.t" "local_1_initLoc_aimConstraint1.ct";
connectAttr "local_1_initLoc.rp" "local_1_initLoc_aimConstraint1.crp";
connectAttr "local_1_initLoc.rpt" "local_1_initLoc_aimConstraint1.crt";
connectAttr "local_1_initLoc.ro" "local_1_initLoc_aimConstraint1.cro";
connectAttr "local_2_initLoc.t" "local_1_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_2_initLoc.rp" "local_1_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_2_initLoc.rpt" "local_1_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_2_initLoc.pm" "local_1_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_1_initLoc_aimConstraint1.w0" "local_1_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_1_initFoll.wm" "local_1_initLoc_aimConstraint1.wum";
connectAttr "local_2_initFollShape.ot" "local_2_initFoll.t";
connectAttr "local_2_initFollShape.or" "local_2_initFoll.r";
connectAttr "root_poser_decMat.osx" "local_2_initFoll.sx";
connectAttr "root_poser_decMat.osy" "local_2_initFoll.sy";
connectAttr "root_poser_decMat.osz" "local_2_initFoll.sz";
connectAttr "init_surfShape.ws" "local_2_initFollShape.is";
connectAttr "local_2_initLoc_aimConstraint1.crx" "local_2_initLoc.rx";
connectAttr "local_2_initLoc_aimConstraint1.cry" "local_2_initLoc.ry";
connectAttr "local_2_initLoc_aimConstraint1.crz" "local_2_initLoc.rz";
connectAttr "root_poser_decMat.osx" "local_2_initLoc.sx";
connectAttr "root_poser_decMat.osy" "local_2_initLoc.sy";
connectAttr "root_poser_decMat.osz" "local_2_initLoc.sz";
connectAttr "local_2_initLoc.pim" "local_2_initLoc_aimConstraint1.cpim";
connectAttr "local_2_initLoc.t" "local_2_initLoc_aimConstraint1.ct";
connectAttr "local_2_initLoc.rp" "local_2_initLoc_aimConstraint1.crp";
connectAttr "local_2_initLoc.rpt" "local_2_initLoc_aimConstraint1.crt";
connectAttr "local_2_initLoc.ro" "local_2_initLoc_aimConstraint1.cro";
connectAttr "local_3_initLoc.t" "local_2_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_3_initLoc.rp" "local_2_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_3_initLoc.rpt" "local_2_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_3_initLoc.pm" "local_2_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_2_initLoc_aimConstraint1.w0" "local_2_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_2_initFoll.wm" "local_2_initLoc_aimConstraint1.wum";
connectAttr "local_3_initFollShape.ot" "local_3_initFoll.t";
connectAttr "local_3_initFollShape.or" "local_3_initFoll.r";
connectAttr "root_poser_decMat.osx" "local_3_initFoll.sx";
connectAttr "root_poser_decMat.osy" "local_3_initFoll.sy";
connectAttr "root_poser_decMat.osz" "local_3_initFoll.sz";
connectAttr "init_surfShape.ws" "local_3_initFollShape.is";
connectAttr "local_3_initLoc_aimConstraint1.crx" "local_3_initLoc.rx";
connectAttr "local_3_initLoc_aimConstraint1.cry" "local_3_initLoc.ry";
connectAttr "local_3_initLoc_aimConstraint1.crz" "local_3_initLoc.rz";
connectAttr "root_poser_decMat.osx" "local_3_initLoc.sx";
connectAttr "root_poser_decMat.osy" "local_3_initLoc.sy";
connectAttr "root_poser_decMat.osz" "local_3_initLoc.sz";
connectAttr "local_3_initLoc.pim" "local_3_initLoc_aimConstraint1.cpim";
connectAttr "local_3_initLoc.t" "local_3_initLoc_aimConstraint1.ct";
connectAttr "local_3_initLoc.rp" "local_3_initLoc_aimConstraint1.crp";
connectAttr "local_3_initLoc.rpt" "local_3_initLoc_aimConstraint1.crt";
connectAttr "local_3_initLoc.ro" "local_3_initLoc_aimConstraint1.cro";
connectAttr "local_4_initLoc.t" "local_3_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_4_initLoc.rp" "local_3_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_4_initLoc.rpt" "local_3_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_4_initLoc.pm" "local_3_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_3_initLoc_aimConstraint1.w0" "local_3_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_3_initFoll.wm" "local_3_initLoc_aimConstraint1.wum";
connectAttr "local_4_initFollShape.ot" "local_4_initFoll.t";
connectAttr "local_4_initFollShape.or" "local_4_initFoll.r";
connectAttr "root_poser_decMat.osx" "local_4_initFoll.sx";
connectAttr "root_poser_decMat.osy" "local_4_initFoll.sy";
connectAttr "root_poser_decMat.osz" "local_4_initFoll.sz";
connectAttr "init_surfShape.ws" "local_4_initFollShape.is";
connectAttr "local_4_initLoc_aimConstraint1.crx" "local_4_initLoc.rx";
connectAttr "local_4_initLoc_aimConstraint1.cry" "local_4_initLoc.ry";
connectAttr "local_4_initLoc_aimConstraint1.crz" "local_4_initLoc.rz";
connectAttr "root_poser_decMat.osx" "local_4_initLoc.sx";
connectAttr "root_poser_decMat.osy" "local_4_initLoc.sy";
connectAttr "root_poser_decMat.osz" "local_4_initLoc.sz";
connectAttr "local_4_initLoc.pim" "local_4_initLoc_aimConstraint1.cpim";
connectAttr "local_4_initLoc.t" "local_4_initLoc_aimConstraint1.ct";
connectAttr "local_4_initLoc.rp" "local_4_initLoc_aimConstraint1.crp";
connectAttr "local_4_initLoc.rpt" "local_4_initLoc_aimConstraint1.crt";
connectAttr "local_4_initLoc.ro" "local_4_initLoc_aimConstraint1.cro";
connectAttr "local_5_initLoc.t" "local_4_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_5_initLoc.rp" "local_4_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_5_initLoc.rpt" "local_4_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_5_initLoc.pm" "local_4_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_4_initLoc_aimConstraint1.w0" "local_4_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_4_initFoll.wm" "local_4_initLoc_aimConstraint1.wum";
connectAttr "local_5_initFollShape.ot" "local_5_initFoll.t";
connectAttr "local_5_initFollShape.or" "local_5_initFoll.r";
connectAttr "root_poser_decMat.osx" "local_5_initFoll.sx";
connectAttr "root_poser_decMat.osy" "local_5_initFoll.sy";
connectAttr "root_poser_decMat.osz" "local_5_initFoll.sz";
connectAttr "init_surfShape.ws" "local_5_initFollShape.is";
connectAttr "local_5_initLoc_aimConstraint1.crx" "local_5_initLoc.rx";
connectAttr "local_5_initLoc_aimConstraint1.cry" "local_5_initLoc.ry";
connectAttr "local_5_initLoc_aimConstraint1.crz" "local_5_initLoc.rz";
connectAttr "root_poser_decMat.osx" "local_5_initLoc.sx";
connectAttr "root_poser_decMat.osy" "local_5_initLoc.sy";
connectAttr "root_poser_decMat.osz" "local_5_initLoc.sz";
connectAttr "local_5_initLoc.pim" "local_5_initLoc_aimConstraint1.cpim";
connectAttr "local_5_initLoc.t" "local_5_initLoc_aimConstraint1.ct";
connectAttr "local_5_initLoc.rp" "local_5_initLoc_aimConstraint1.crp";
connectAttr "local_5_initLoc.rpt" "local_5_initLoc_aimConstraint1.crt";
connectAttr "local_5_initLoc.ro" "local_5_initLoc_aimConstraint1.cro";
connectAttr "end_poser.t" "local_5_initLoc_aimConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "local_5_initLoc_aimConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "local_5_initLoc_aimConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "local_5_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_5_initLoc_aimConstraint1.w0" "local_5_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_5_initFoll.wm" "local_5_initLoc_aimConstraint1.wum";
connectAttr "end_initLoc_pointConstraint1.ctx" "end_initLoc.tx";
connectAttr "end_initLoc_pointConstraint1.cty" "end_initLoc.ty";
connectAttr "end_initLoc_pointConstraint1.ctz" "end_initLoc.tz";
connectAttr "root_poser_decMat.os" "end_initLoc.s";
connectAttr "end_initLoc.pim" "end_initLoc_pointConstraint1.cpim";
connectAttr "end_initLoc.rp" "end_initLoc_pointConstraint1.crp";
connectAttr "end_initLoc.rpt" "end_initLoc_pointConstraint1.crt";
connectAttr "end_poser.t" "end_initLoc_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "end_initLoc_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "end_initLoc_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "end_initLoc_pointConstraint1.tg[0].tpm";
connectAttr "end_initLoc_pointConstraint1.w0" "end_initLoc_pointConstraint1.tg[0].tw"
		;
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
connectAttr "root_initLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "local_1_poserOrientShape.wp" "posers_curveShape.cp[1]";
connectAttr "local_2_poserOrientShape.wp" "posers_curveShape.cp[2]";
connectAttr "local_3_poserOrientShape.wp" "posers_curveShape.cp[3]";
connectAttr "local_4_poserOrientShape.wp" "posers_curveShape.cp[4]";
connectAttr "local_5_poserOrientShape.wp" "posers_curveShape.cp[5]";
connectAttr "end_poserOrientShape.wp" "posers_curveShape.cp[6]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "size_multiplyDivide2.oy" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide2.oy" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide2.oy" "mainPoser_clusterHandle.sz";
connectAttr "root_poser_decMat.otx" "input.tx";
connectAttr "root_poser_decMat.oty" "input.ty";
connectAttr "root_poser_decMat.otz" "input.tz";
connectAttr "root_poser_decMat.orx" "input.rx";
connectAttr "root_poser_decMat.ory" "input.ry";
connectAttr "root_poser_decMat.orz" "input.rz";
connectAttr "root_poser_decMat.osx" "input.sx";
connectAttr "root_poser_decMat.osy" "input.sy";
connectAttr "root_poser_decMat.osz" "input.sz";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "end_decomposeMatrix1.ot" "pelvis.rp";
connectAttr "parts_multiplyDivide.ox" "fk_bone_1_group.ty";
connectAttr "condition2.ocr" "fk_bone_1_group.v";
connectAttr "decomposeMatrix91.otx" "fk_1.rpx";
connectAttr "decomposeMatrix91.otz" "fk_1.rpz";
connectAttr "parts_multiplyDivide.ox" "fk_bone_2_group.ty";
connectAttr "decomposeMatrix92.otx" "fk_2.rpx";
connectAttr "decomposeMatrix92.otz" "fk_2.rpz";
connectAttr "parts_multiplyDivide.ox" "fk_bone_3_group.ty";
connectAttr "decomposeMatrix93.otx" "fk_3.rpx";
connectAttr "decomposeMatrix93.otz" "fk_3.rpz";
connectAttr "parts_multiplyDivide.ox" "fk_bone_3_out.ty";
connectAttr "end_decomposeMatrix.otx" "fk_bone_3_out.tx";
connectAttr "end_decomposeMatrix.otz" "fk_bone_3_out.tz";
connectAttr "hips.t" "fk_hips_group_2.t";
connectAttr "hips.r" "fk_hips_group_2.r";
connectAttr "parts_multiplyDivide.ox" "fk_hips_group.ty";
connectAttr "decomposeMatrix91.otz" "fk_hips.rpz";
connectAttr "decomposeMatrix91.otx" "fk_hips.rpx";
connectAttr "condition2.ocr" "fk_hipsShape.lodv";
connectAttr "bendJoint_1_aimConstraint1.crx" "bendJoint_1.rx";
connectAttr "bendJoint_1_aimConstraint1.cry" "bendJoint_1.ry";
connectAttr "bendJoint_1_aimConstraint1.crz" "bendJoint_1.rz";
connectAttr "parts_multiplyDivide.oy" "bendJoint_1.ty";
connectAttr "reverse8.ox" "bendJoint_1_aimConstraint1.w0";
connectAttr "hips.weight" "bendJoint_1_aimConstraint1.w1";
connectAttr "bendJoint_1.pim" "bendJoint_1_aimConstraint1.cpim";
connectAttr "bendJoint_1.t" "bendJoint_1_aimConstraint1.ct";
connectAttr "bendJoint_1.rp" "bendJoint_1_aimConstraint1.crp";
connectAttr "bendJoint_1.rpt" "bendJoint_1_aimConstraint1.crt";
connectAttr "bendJoint_1.ro" "bendJoint_1_aimConstraint1.cro";
connectAttr "bendJoint_1.jo" "bendJoint_1_aimConstraint1.cjo";
connectAttr "stomachHipsMid_loc.t" "bendJoint_1_aimConstraint1.tg[0].tt";
connectAttr "stomachHipsMid_loc.rp" "bendJoint_1_aimConstraint1.tg[0].trp";
connectAttr "stomachHipsMid_loc.rpt" "bendJoint_1_aimConstraint1.tg[0].trt";
connectAttr "stomachHipsMid_loc.pm" "bendJoint_1_aimConstraint1.tg[0].tpm";
connectAttr "bendJoint_1_aimConstraint1.w0" "bendJoint_1_aimConstraint1.tg[0].tw"
		;
connectAttr "hipsStomachMid_loc.t" "bendJoint_1_aimConstraint1.tg[1].tt";
connectAttr "hipsStomachMid_loc.rp" "bendJoint_1_aimConstraint1.tg[1].trp";
connectAttr "hipsStomachMid_loc.rpt" "bendJoint_1_aimConstraint1.tg[1].trt";
connectAttr "hipsStomachMid_loc.pm" "bendJoint_1_aimConstraint1.tg[1].tpm";
connectAttr "bendJoint_1_aimConstraint1.w1" "bendJoint_1_aimConstraint1.tg[1].tw"
		;
connectAttr "curDistance_part.o" "hipsStomachMid_loc1.ty";
connectAttr "curDistance_part_2.o" "local_1_group.ty";
connectAttr "unitConversion31.o" "local_1_group.ry";
connectAttr "pelvis.localControls" "local_1_group.v";
connectAttr "local_1_poser.t" "local_1_group_2.t";
connectAttr "parts_multiplyDivide.oy" "bendJoint_1_out.ty";
connectAttr "condition2.ocg" "hipsShape.lodv";
connectAttr "multiplyDivide1855.oy" "hipsStomachMid_aim.ty";
connectAttr "multiplyDivide1855.ox" "hipsStomachMid_aim.tx";
connectAttr "multiplyDivide1855.oz" "hipsStomachMid_aim.tz";
connectAttr "hipsStomachMid_loc_group_aimConstraint1.crx" "hipsStomachMid_loc_group.rx"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.cry" "hipsStomachMid_loc_group.ry"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.crz" "hipsStomachMid_loc_group.rz"
		;
connectAttr "curDistance_part.o" "hipsStomachMid_loc.ty";
connectAttr "hips.weight" "hipsStomachMid_loc_group_aimConstraint1.w0";
connectAttr "reverse8.ox" "hipsStomachMid_loc_group_aimConstraint1.w1";
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
connectAttr "chest_out.t" "hipsStomachMid_loc_group_aimConstraint1.tg[1].tt";
connectAttr "chest_out.rp" "hipsStomachMid_loc_group_aimConstraint1.tg[1].trp";
connectAttr "chest_out.rpt" "hipsStomachMid_loc_group_aimConstraint1.tg[1].trt";
connectAttr "chest_out.pm" "hipsStomachMid_loc_group_aimConstraint1.tg[1].tpm";
connectAttr "hipsStomachMid_loc_group_aimConstraint1.w1" "hipsStomachMid_loc_group_aimConstraint1.tg[1].tw"
		;
connectAttr "stomach_group_2_pointConstraint1.cty" "stomach_group_2.ty";
connectAttr "stomach_group_2_pointConstraint1.ctx" "stomach_group_2.tx";
connectAttr "stomach_group_2_pointConstraint1.ctz" "stomach_group_2.tz";
connectAttr "stomach_orient.r" "stomach_group_2.r";
connectAttr "stomach_group_orientConstraint1.cry" "stomach_group.ry";
connectAttr "stomach_group.ro" "stomach_group_orientConstraint1.cro";
connectAttr "stomach_group.pim" "stomach_group_orientConstraint1.cpim";
connectAttr "chest_out.r" "stomach_group_orientConstraint1.tg[0].tr";
connectAttr "chest_out.ro" "stomach_group_orientConstraint1.tg[0].tro";
connectAttr "chest_out.pm" "stomach_group_orientConstraint1.tg[0].tpm";
connectAttr "stomach_group_orientConstraint1.w0" "stomach_group_orientConstraint1.tg[0].tw"
		;
connectAttr "hips_out.r" "stomach_group_orientConstraint1.tg[1].tr";
connectAttr "hips_out.ro" "stomach_group_orientConstraint1.tg[1].tro";
connectAttr "hips_out.pm" "stomach_group_orientConstraint1.tg[1].tpm";
connectAttr "stomach_group_orientConstraint1.w1" "stomach_group_orientConstraint1.tg[1].tw"
		;
connectAttr "local_3_poser.tz" "stomach.rpz";
connectAttr "local_3_poser.tx" "stomach.rpx";
connectAttr "condition2.ocg" "stomachShape.lodv";
connectAttr "stomachChestMid_loc_offset.o" "stomachChestMid_loc.ty";
connectAttr "unitConversion29.o" "local_4_group.ry";
connectAttr "pelvis.localControls" "local_4_group.v";
connectAttr "local_4_poser.t" "local_4_group_2.t";
connectAttr "bendJoint_4_multiply_position.o" "local_3_group.t";
connectAttr "pelvis.localControls" "local_3_group.v";
connectAttr "local_3_poser.t" "local_3_group_2.t";
connectAttr "stomachHipsMid_loc_offset.o" "stomachHipsMid_loc.ty";
connectAttr "unitConversion30.o" "local_2_group.ry";
connectAttr "pelvis.localControls" "local_2_group.v";
connectAttr "local_2_poser.t" "local_2_group_2.t";
connectAttr "stomach_group_2.pim" "stomach_group_2_pointConstraint1.cpim";
connectAttr "stomach_group_2.rp" "stomach_group_2_pointConstraint1.crp";
connectAttr "stomach_group_2.rpt" "stomach_group_2_pointConstraint1.crt";
connectAttr "chestStomachMid_loc.t" "stomach_group_2_pointConstraint1.tg[0].tt";
connectAttr "chestStomachMid_loc.rp" "stomach_group_2_pointConstraint1.tg[0].trp"
		;
connectAttr "chestStomachMid_loc.rpt" "stomach_group_2_pointConstraint1.tg[0].trt"
		;
connectAttr "chestStomachMid_loc.pm" "stomach_group_2_pointConstraint1.tg[0].tpm"
		;
connectAttr "stomach_group_2_pointConstraint1.w0" "stomach_group_2_pointConstraint1.tg[0].tw"
		;
connectAttr "hipsStomachMid_loc.t" "stomach_group_2_pointConstraint1.tg[1].tt";
connectAttr "hipsStomachMid_loc.rp" "stomach_group_2_pointConstraint1.tg[1].trp"
		;
connectAttr "hipsStomachMid_loc.rpt" "stomach_group_2_pointConstraint1.tg[1].trt"
		;
connectAttr "hipsStomachMid_loc.pm" "stomach_group_2_pointConstraint1.tg[1].tpm"
		;
connectAttr "stomach_group_2_pointConstraint1.w1" "stomach_group_2_pointConstraint1.tg[1].tw"
		;
connectAttr "chest_group_decomposeMatrix.otx" "chest_group.tx";
connectAttr "chest_group_decomposeMatrix.oty" "chest_group.ty";
connectAttr "chest_group_decomposeMatrix.otz" "chest_group.tz";
connectAttr "chest_group_decomposeMatrix.orx" "chest_group.rx";
connectAttr "chest_group_decomposeMatrix.ory" "chest_group.ry";
connectAttr "chest_group_decomposeMatrix.orz" "chest_group.rz";
connectAttr "chest_group_decomposeMatrix.osx" "chest_group.sx";
connectAttr "chest_group_decomposeMatrix.osy" "chest_group.sy";
connectAttr "chest_group_decomposeMatrix.osz" "chest_group.sz";
connectAttr "condition2.ocg" "chestShape.lodv";
connectAttr "bend_joint_7_aimConstraint1.crx" "bend_joint_7.rx";
connectAttr "bend_joint_7_aimConstraint1.cry" "bend_joint_7.ry";
connectAttr "bend_joint_7_aimConstraint1.crz" "bend_joint_7.rz";
connectAttr "reverse6.ox" "bend_joint_7_aimConstraint1.w0";
connectAttr "chest.weight" "bend_joint_7_aimConstraint1.w1";
connectAttr "bend_joint_7.pim" "bend_joint_7_aimConstraint1.cpim";
connectAttr "bend_joint_7.t" "bend_joint_7_aimConstraint1.ct";
connectAttr "bend_joint_7.rp" "bend_joint_7_aimConstraint1.crp";
connectAttr "bend_joint_7.rpt" "bend_joint_7_aimConstraint1.crt";
connectAttr "bend_joint_7.ro" "bend_joint_7_aimConstraint1.cro";
connectAttr "bend_joint_7.jo" "bend_joint_7_aimConstraint1.cjo";
connectAttr "stomachChestMid_loc.t" "bend_joint_7_aimConstraint1.tg[0].tt";
connectAttr "stomachChestMid_loc.rp" "bend_joint_7_aimConstraint1.tg[0].trp";
connectAttr "stomachChestMid_loc.rpt" "bend_joint_7_aimConstraint1.tg[0].trt";
connectAttr "stomachChestMid_loc.pm" "bend_joint_7_aimConstraint1.tg[0].tpm";
connectAttr "bend_joint_7_aimConstraint1.w0" "bend_joint_7_aimConstraint1.tg[0].tw"
		;
connectAttr "chestStomachMid_aim.t" "bend_joint_7_aimConstraint1.tg[1].tt";
connectAttr "chestStomachMid_aim.rp" "bend_joint_7_aimConstraint1.tg[1].trp";
connectAttr "chestStomachMid_aim.rpt" "bend_joint_7_aimConstraint1.tg[1].trt";
connectAttr "chestStomachMid_aim.pm" "bend_joint_7_aimConstraint1.tg[1].tpm";
connectAttr "bend_joint_7_aimConstraint1.w1" "bend_joint_7_aimConstraint1.tg[1].tw"
		;
connectAttr "multDoubleLinear13.o" "local_5_group.ty";
connectAttr "unitConversion27.o" "local_5_group.ry";
connectAttr "pelvis.localControls" "local_5_group.v";
connectAttr "local_5_poser.t" "local_5_group_2.t";
connectAttr "chestStomachMid_loc_group_aimConstraint1.crx" "chestStomachMid_loc_group.rx"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.cry" "chestStomachMid_loc_group.ry"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.crz" "chestStomachMid_loc_group.rz"
		;
connectAttr "curDistance_part_rev.o" "chestStomachMid_loc.ty";
connectAttr "chest.weight" "chestStomachMid_loc_group_aimConstraint1.w0";
connectAttr "reverse6.ox" "chestStomachMid_loc_group_aimConstraint1.w1";
connectAttr "chestStomachMid_loc_group.pim" "chestStomachMid_loc_group_aimConstraint1.cpim"
		;
connectAttr "chestStomachMid_loc_group.t" "chestStomachMid_loc_group_aimConstraint1.ct"
		;
connectAttr "chestStomachMid_loc_group.rp" "chestStomachMid_loc_group_aimConstraint1.crp"
		;
connectAttr "chestStomachMid_loc_group.rpt" "chestStomachMid_loc_group_aimConstraint1.crt"
		;
connectAttr "chestStomachMid_loc_group.ro" "chestStomachMid_loc_group_aimConstraint1.cro"
		;
connectAttr "chestStomachMid_aim.t" "chestStomachMid_loc_group_aimConstraint1.tg[0].tt"
		;
connectAttr "chestStomachMid_aim.rp" "chestStomachMid_loc_group_aimConstraint1.tg[0].trp"
		;
connectAttr "chestStomachMid_aim.rpt" "chestStomachMid_loc_group_aimConstraint1.tg[0].trt"
		;
connectAttr "chestStomachMid_aim.pm" "chestStomachMid_loc_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.w0" "chestStomachMid_loc_group_aimConstraint1.tg[0].tw"
		;
connectAttr "hips_out.t" "chestStomachMid_loc_group_aimConstraint1.tg[1].tt";
connectAttr "hips_out.rp" "chestStomachMid_loc_group_aimConstraint1.tg[1].trp";
connectAttr "hips_out.rpt" "chestStomachMid_loc_group_aimConstraint1.tg[1].trt";
connectAttr "hips_out.pm" "chestStomachMid_loc_group_aimConstraint1.tg[1].tpm";
connectAttr "chestStomachMid_loc_group_aimConstraint1.w1" "chestStomachMid_loc_group_aimConstraint1.tg[1].tw"
		;
connectAttr "multiplyDivide1856.o" "chestStomachMid_aim.t";
connectAttr "stomach_orient_aimConstraint1.crx" "stomach_orient.rx";
connectAttr "stomach_orient_aimConstraint1.cry" "stomach_orient.ry";
connectAttr "stomach_orient_aimConstraint1.crz" "stomach_orient.rz";
connectAttr "stomach_orient_pointConstraint1.cty" "stomach_orient.ty";
connectAttr "stomach_orient_pointConstraint1.ctx" "stomach_orient.tx";
connectAttr "stomach_orient_pointConstraint1.ctz" "stomach_orient.tz";
connectAttr "chest.weight" "stomach_orient_aimConstraint1.w0";
connectAttr "reverse6.ox" "stomach_orient_aimConstraint1.w1";
connectAttr "stomach_orient.pim" "stomach_orient_aimConstraint1.cpim";
connectAttr "stomach_orient.t" "stomach_orient_aimConstraint1.ct";
connectAttr "stomach_orient.rp" "stomach_orient_aimConstraint1.crp";
connectAttr "stomach_orient.rpt" "stomach_orient_aimConstraint1.crt";
connectAttr "stomach_orient.ro" "stomach_orient_aimConstraint1.cro";
connectAttr "chestStomachMid_loc.t" "stomach_orient_aimConstraint1.tg[0].tt";
connectAttr "chestStomachMid_loc.rp" "stomach_orient_aimConstraint1.tg[0].trp";
connectAttr "chestStomachMid_loc.rpt" "stomach_orient_aimConstraint1.tg[0].trt";
connectAttr "chestStomachMid_loc.pm" "stomach_orient_aimConstraint1.tg[0].tpm";
connectAttr "stomach_orient_aimConstraint1.w0" "stomach_orient_aimConstraint1.tg[0].tw"
		;
connectAttr "chest_out.t" "stomach_orient_aimConstraint1.tg[1].tt";
connectAttr "chest_out.rp" "stomach_orient_aimConstraint1.tg[1].trp";
connectAttr "chest_out.rpt" "stomach_orient_aimConstraint1.tg[1].trt";
connectAttr "chest_out.pm" "stomach_orient_aimConstraint1.tg[1].tpm";
connectAttr "stomach_orient_aimConstraint1.w1" "stomach_orient_aimConstraint1.tg[1].tw"
		;
connectAttr "stomach_orient.pim" "stomach_orient_pointConstraint1.cpim";
connectAttr "stomach_orient.rp" "stomach_orient_pointConstraint1.crp";
connectAttr "stomach_orient.rpt" "stomach_orient_pointConstraint1.crt";
connectAttr "hipsStomachMid_loc.t" "stomach_orient_pointConstraint1.tg[0].tt";
connectAttr "hipsStomachMid_loc.rp" "stomach_orient_pointConstraint1.tg[0].trp";
connectAttr "hipsStomachMid_loc.rpt" "stomach_orient_pointConstraint1.tg[0].trt"
		;
connectAttr "hipsStomachMid_loc.pm" "stomach_orient_pointConstraint1.tg[0].tpm";
connectAttr "stomach_orient_pointConstraint1.w0" "stomach_orient_pointConstraint1.tg[0].tw"
		;
connectAttr "hips_out.t" "stomach_orient_pointConstraint1.tg[1].tt";
connectAttr "hips_out.rp" "stomach_orient_pointConstraint1.tg[1].trp";
connectAttr "hips_out.rpt" "stomach_orient_pointConstraint1.tg[1].trt";
connectAttr "hips_out.pm" "stomach_orient_pointConstraint1.tg[1].tpm";
connectAttr "stomach_orient_pointConstraint1.w1" "stomach_orient_pointConstraint1.tg[1].tw"
		;
connectAttr "hips.weight" "stomach_orient_pointConstraint1.w0";
connectAttr "reverse8.ox" "stomach_orient_pointConstraint1.w1";
connectAttr "curveFromSurfaceIso1.oc" "bend_crvShape.cr";
connectAttr "bend_1_follShape.ot" "bend_1_foll.t";
connectAttr "bend_1_follShape.or" "bend_1_foll.r";
connectAttr "bend_surfShape.ws" "bend_1_follShape.is";
connectAttr "condition7.ocr" "bend_1_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_1_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_1_jnt.sz";
connectAttr "bend_1_jnt_aimConstraint1.crx" "bend_1_jnt.rx";
connectAttr "bend_1_jnt_aimConstraint1.cry" "bend_1_jnt.ry";
connectAttr "bend_1_jnt_aimConstraint1.crz" "bend_1_jnt.rz";
connectAttr "bend_1_jnt.pim" "bend_1_jnt_aimConstraint1.cpim";
connectAttr "bend_1_jnt.t" "bend_1_jnt_aimConstraint1.ct";
connectAttr "bend_1_jnt.rp" "bend_1_jnt_aimConstraint1.crp";
connectAttr "bend_1_jnt.rpt" "bend_1_jnt_aimConstraint1.crt";
connectAttr "bend_1_jnt.ro" "bend_1_jnt_aimConstraint1.cro";
connectAttr "bend_1_jnt.jo" "bend_1_jnt_aimConstraint1.cjo";
connectAttr "bend_2_foll.t" "bend_1_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_2_foll.rp" "bend_1_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_2_foll.rpt" "bend_1_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_2_foll.pm" "bend_1_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_1_jnt_aimConstraint1.w0" "bend_1_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_1_foll.wm" "bend_1_jnt_aimConstraint1.wum";
connectAttr "bend_2_follShape.ot" "bend_2_foll.t";
connectAttr "bend_2_follShape.or" "bend_2_foll.r";
connectAttr "bend_surfShape.ws" "bend_2_follShape.is";
connectAttr "condition8.ocr" "bend_2_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_2_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_2_jnt.sz";
connectAttr "bend_2_jnt_aimConstraint1.crx" "bend_2_jnt.rx";
connectAttr "bend_2_jnt_aimConstraint1.cry" "bend_2_jnt.ry";
connectAttr "bend_2_jnt_aimConstraint1.crz" "bend_2_jnt.rz";
connectAttr "bend_2_jnt.pim" "bend_2_jnt_aimConstraint1.cpim";
connectAttr "bend_2_jnt.t" "bend_2_jnt_aimConstraint1.ct";
connectAttr "bend_2_jnt.rp" "bend_2_jnt_aimConstraint1.crp";
connectAttr "bend_2_jnt.rpt" "bend_2_jnt_aimConstraint1.crt";
connectAttr "bend_2_jnt.ro" "bend_2_jnt_aimConstraint1.cro";
connectAttr "bend_2_jnt.jo" "bend_2_jnt_aimConstraint1.cjo";
connectAttr "bend_3_foll.t" "bend_2_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_3_foll.rp" "bend_2_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_3_foll.rpt" "bend_2_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_3_foll.pm" "bend_2_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_2_jnt_aimConstraint1.w0" "bend_2_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_2_foll.wm" "bend_2_jnt_aimConstraint1.wum";
connectAttr "bend_3_follShape.ot" "bend_3_foll.t";
connectAttr "bend_3_follShape.or" "bend_3_foll.r";
connectAttr "bend_surfShape.ws" "bend_3_follShape.is";
connectAttr "condition10.ocr" "bend_3_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_3_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_3_jnt.sz";
connectAttr "bend_3_jnt_aimConstraint1.crx" "bend_3_jnt.rx";
connectAttr "bend_3_jnt_aimConstraint1.cry" "bend_3_jnt.ry";
connectAttr "bend_3_jnt_aimConstraint1.crz" "bend_3_jnt.rz";
connectAttr "bend_3_jnt.pim" "bend_3_jnt_aimConstraint1.cpim";
connectAttr "bend_3_jnt.t" "bend_3_jnt_aimConstraint1.ct";
connectAttr "bend_3_jnt.rp" "bend_3_jnt_aimConstraint1.crp";
connectAttr "bend_3_jnt.rpt" "bend_3_jnt_aimConstraint1.crt";
connectAttr "bend_3_jnt.ro" "bend_3_jnt_aimConstraint1.cro";
connectAttr "bend_3_jnt.jo" "bend_3_jnt_aimConstraint1.cjo";
connectAttr "bend_4_foll.t" "bend_3_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_4_foll.rp" "bend_3_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_4_foll.rpt" "bend_3_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_4_foll.pm" "bend_3_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_3_jnt_aimConstraint1.w0" "bend_3_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_3_foll.wm" "bend_3_jnt_aimConstraint1.wum";
connectAttr "bend_4_follShape.ot" "bend_4_foll.t";
connectAttr "bend_4_follShape.or" "bend_4_foll.r";
connectAttr "bend_surfShape.ws" "bend_4_follShape.is";
connectAttr "condition9.ocr" "bend_4_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_4_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_4_jnt.sz";
connectAttr "bend_4_jnt_aimConstraint1.crx" "bend_4_jnt.rx";
connectAttr "bend_4_jnt_aimConstraint1.cry" "bend_4_jnt.ry";
connectAttr "bend_4_jnt_aimConstraint1.crz" "bend_4_jnt.rz";
connectAttr "bend_4_jnt.pim" "bend_4_jnt_aimConstraint1.cpim";
connectAttr "bend_4_jnt.t" "bend_4_jnt_aimConstraint1.ct";
connectAttr "bend_4_jnt.rp" "bend_4_jnt_aimConstraint1.crp";
connectAttr "bend_4_jnt.rpt" "bend_4_jnt_aimConstraint1.crt";
connectAttr "bend_4_jnt.ro" "bend_4_jnt_aimConstraint1.cro";
connectAttr "bend_4_jnt.jo" "bend_4_jnt_aimConstraint1.cjo";
connectAttr "bend_5_foll.t" "bend_4_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_5_foll.rp" "bend_4_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_5_foll.rpt" "bend_4_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_5_foll.pm" "bend_4_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_4_jnt_aimConstraint1.w0" "bend_4_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_4_foll.wm" "bend_4_jnt_aimConstraint1.wum";
connectAttr "bend_5_follShape.ot" "bend_5_foll.t";
connectAttr "bend_5_follShape.or" "bend_5_foll.r";
connectAttr "bend_surfShape.ws" "bend_5_follShape.is";
connectAttr "condition11.ocr" "bend_5_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_5_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_5_jnt.sz";
connectAttr "bend_5_jnt_aimConstraint1.crx" "bend_5_jnt.rx";
connectAttr "bend_5_jnt_aimConstraint1.cry" "bend_5_jnt.ry";
connectAttr "bend_5_jnt_aimConstraint1.crz" "bend_5_jnt.rz";
connectAttr "bend_5_jnt.pim" "bend_5_jnt_aimConstraint1.cpim";
connectAttr "bend_5_jnt.t" "bend_5_jnt_aimConstraint1.ct";
connectAttr "bend_5_jnt.rp" "bend_5_jnt_aimConstraint1.crp";
connectAttr "bend_5_jnt.rpt" "bend_5_jnt_aimConstraint1.crt";
connectAttr "bend_5_jnt.ro" "bend_5_jnt_aimConstraint1.cro";
connectAttr "bend_5_jnt.jo" "bend_5_jnt_aimConstraint1.cjo";
connectAttr "chest_out.t" "bend_5_jnt_aimConstraint1.tg[0].tt";
connectAttr "chest_out.rp" "bend_5_jnt_aimConstraint1.tg[0].trp";
connectAttr "chest_out.rpt" "bend_5_jnt_aimConstraint1.tg[0].trt";
connectAttr "chest_out.pm" "bend_5_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_5_jnt_aimConstraint1.w0" "bend_5_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_5_foll.wm" "bend_5_jnt_aimConstraint1.wum";
connectAttr "bend_crv_0_mpath.ac" "bend_crv_0_jnt.t";
connectAttr "bend_crv_0_mpath.msg" "bend_crv_0_jnt.sml";
connectAttr "bend_crv_0_mpath.ro" "bend_crv_0_jnt.ro";
connectAttr "bend_crv_1_mpath.ac" "bend_crv_1_jnt.t";
connectAttr "bend_crv_1_mpath.msg" "bend_crv_1_jnt.sml";
connectAttr "bend_crv_1_mpath.ro" "bend_crv_1_jnt.ro";
connectAttr "bend_crv_2_mpath.ac" "bend_crv_2_jnt.t";
connectAttr "bend_crv_2_mpath.msg" "bend_crv_2_jnt.sml";
connectAttr "bend_crv_2_mpath.ro" "bend_crv_2_jnt.ro";
connectAttr "bend_crv_3_mpath.ac" "bend_crv_3_jnt.t";
connectAttr "bend_crv_3_mpath.msg" "bend_crv_3_jnt.sml";
connectAttr "bend_crv_3_mpath.ro" "bend_crv_3_jnt.ro";
connectAttr "bend_crv_4_mpath.ac" "bend_crv_4_jnt.t";
connectAttr "bend_crv_4_mpath.msg" "bend_crv_4_jnt.sml";
connectAttr "bend_crv_4_mpath.ro" "bend_crv_4_jnt.ro";
connectAttr "bend_crv_5_mpath.ac" "bend_crv_5_jnt.t";
connectAttr "bend_crv_5_mpath.msg" "bend_crv_5_jnt.sml";
connectAttr "bend_crv_5_mpath.ro" "bend_crv_5_jnt.ro";
connectAttr "bend_crv_6_mpath.ac" "bend_crv_6_jnt.t";
connectAttr "bend_crv_6_mpath.msg" "bend_crv_6_jnt.sml";
connectAttr "bend_crv_6_mpath.ro" "bend_crv_6_jnt.ro";
connectAttr "skinCluster1GroupId.id" "bend_surfShape.iog.og[21].gid";
connectAttr "skinCluster1Set.mwc" "bend_surfShape.iog.og[21].gco";
connectAttr "groupId45.id" "bend_surfShape.iog.og[22].gid";
connectAttr "tweakSet26.mwc" "bend_surfShape.iog.og[22].gco";
connectAttr "skinCluster1.og[0]" "bend_surfShape.cr";
connectAttr "tweak26.pl[0].cp[0]" "bend_surfShape.twl";
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
connectAttr "local_end_outJoint_decMat.otx" "local_end_outJoint.tx";
connectAttr "local_end_outJoint_decMat.oty" "local_end_outJoint.ty";
connectAttr "local_end_outJoint_decMat.otz" "local_end_outJoint.tz";
connectAttr "local_end_outJoint_decMat.orx" "local_end_outJoint.rx";
connectAttr "local_end_outJoint_decMat.ory" "local_end_outJoint.ry";
connectAttr "local_end_outJoint_decMat.orz" "local_end_outJoint.rz";
connectAttr "spine_5_skinJoint_decMat2.otx" "end_outJoint.tx";
connectAttr "spine_5_skinJoint_decMat2.oty" "end_outJoint.ty";
connectAttr "spine_5_skinJoint_decMat2.otz" "end_outJoint.tz";
connectAttr "spine_5_skinJoint_decMat2.orx" "end_outJoint.rx";
connectAttr "spine_5_skinJoint_decMat2.ory" "end_outJoint.ry";
connectAttr "spine_5_skinJoint_decMat2.orz" "end_outJoint.rz";
connectAttr "chest_group_multMatrix.o" "chest_group_decomposeMatrix.imat";
connectAttr "fk_bone_3_out.wm" "chest_group_multMatrix.i[0]";
connectAttr "chest_group.pim" "chest_group_multMatrix.i[1]";
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
connectAttr "root_poser.wm" "root_poser_decMat.imat";
connectAttr "spineRoot.iog" "moduleControlSet.dsm" -na;
connectAttr "pelvis.iog" "moduleControlSet.dsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "local_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "end_decomposeMatrix.oty" "parts_multiplyDivide.i1x";
connectAttr "end_decomposeMatrix.oty" "parts_multiplyDivide.i1y";
connectAttr "end_decomposeMatrix.oty" "parts_multiplyDivide.i1z";
connectAttr "end_poser.wm" "end_multMatrix.i[0]";
connectAttr "root_poser.wim" "end_multMatrix.i[1]";
connectAttr "end_multMatrix.o" "end_decomposeMatrix.imat";
connectAttr "pelvis.controls" "condition1.ft";
connectAttr "pelvis.controls" "condition2.ft";
connectAttr "condition1.ocr" "condition2.cfr";
connectAttr "condition3.ocr" "condition2.cfg";
connectAttr "pelvis.controls" "condition3.ft";
connectAttr "fk_3.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_2.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_1.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_hips.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "red_rsSG.msg" "root_materialInfo1.sg";
connectAttr "green_rsSG.msg" "root_materialInfo2.sg";
connectAttr "blue_rsSG.msg" "root_materialInfo3.sg";
connectAttr "black_rsSG.msg" "spine_1_materialInfo7.sg";
connectAttr "multiplyDivide1853.ox" "multiplyDivide1846.i2x";
connectAttr "curveInfo3.al" "multiplyDivide1846.i1x";
connectAttr "squash_blendTwoAttr.const" "squash_blendTwoAttr.i[0]";
connectAttr "multiplyDivide1849.ox" "squash_blendTwoAttr.i[1]";
connectAttr "pelvis.squash" "squash_blendTwoAttr.ab";
connectAttr "bend_1_foll.msg" "bindPose3.m[0]";
connectAttr "bend_1_jnt.msg" "bindPose3.m[1]";
connectAttr "bend_2_foll.msg" "bindPose3.m[2]";
connectAttr "bend_2_jnt.msg" "bindPose3.m[3]";
connectAttr "bend_3_foll.msg" "bindPose3.m[4]";
connectAttr "bend_3_jnt.msg" "bindPose3.m[5]";
connectAttr "bend_4_foll.msg" "bindPose3.m[6]";
connectAttr "bend_4_jnt.msg" "bindPose3.m[7]";
connectAttr "bend_5_foll.msg" "bindPose3.m[8]";
connectAttr "bend_5_jnt.msg" "bindPose3.m[9]";
connectAttr "bindPose3.w" "bindPose3.p[0]";
connectAttr "bindPose3.m[0]" "bindPose3.p[1]";
connectAttr "bindPose3.w" "bindPose3.p[2]";
connectAttr "bindPose3.m[2]" "bindPose3.p[3]";
connectAttr "bindPose3.w" "bindPose3.p[4]";
connectAttr "bindPose3.m[4]" "bindPose3.p[5]";
connectAttr "bindPose3.w" "bindPose3.p[6]";
connectAttr "bindPose3.m[6]" "bindPose3.p[7]";
connectAttr "bindPose3.w" "bindPose3.p[8]";
connectAttr "bindPose3.m[8]" "bindPose3.p[9]";
connectAttr "bend_1_jnt.bps" "bindPose3.wm[1]";
connectAttr "bend_2_jnt.bps" "bindPose3.wm[3]";
connectAttr "bend_3_jnt.bps" "bindPose3.wm[5]";
connectAttr "bend_4_jnt.bps" "bindPose3.wm[7]";
connectAttr "bend_5_jnt.bps" "bindPose3.wm[9]";
connectAttr "chest.weight" "reverse6.ix";
connectAttr "bend_crvShape.ws" "curveInfo3.ic";
connectAttr "multiplyDivide1846.ox" "multiplyDivide1849.i2x";
connectAttr "spine_2_skinJoint_multMat.o" "spine_2_skinJoint_decMat.imat";
connectAttr "bend_1_jnt.wm" "spine_2_skinJoint_multMat.i[0]";
connectAttr "local_1_outJoint.pim" "spine_2_skinJoint_multMat.i[1]";
connectAttr "spine_3_skinJoint_multMat.o" "spine_3_skinJoint_decMat.imat";
connectAttr "bend_2_jnt.wm" "spine_3_skinJoint_multMat.i[0]";
connectAttr "local_2_outJoint.pim" "spine_3_skinJoint_multMat.i[1]";
connectAttr "spine_4_skinJoint_multMat.o" "spine_4_skinJoint_decMat.imat";
connectAttr "bend_3_jnt.wm" "spine_4_skinJoint_multMat.i[0]";
connectAttr "local_3_outJoint.pim" "spine_4_skinJoint_multMat.i[1]";
connectAttr "spine_5_skinJoint_multMat1.o" "spine_5_skinJoint_decMat1.imat";
connectAttr "bend_5_jnt.wm" "spine_5_skinJoint_multMat1.i[0]";
connectAttr "local_5_outJoint.pim" "spine_5_skinJoint_multMat1.i[1]";
connectAttr "distanceBetween1.d" "multiplyDivide1853.i1x";
connectAttr "root_connector_decMat.osx" "multiplyDivide1853.i2x";
connectAttr "spine_4_skinJoint_multMat1.o" "spine_4_skinJoint_decMat1.imat";
connectAttr "bend_4_jnt.wm" "spine_4_skinJoint_multMat1.i[0]";
connectAttr "local_4_outJoint.pim" "spine_4_skinJoint_multMat1.i[1]";
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
connectAttr "stomach.t" "bendJoint_4_multiply_position.i1";
connectAttr "stomach.tz" "stomach_offset_distance.p1z";
connectAttr "stomach.tx" "stomach_offset_distance.p1x";
connectAttr "stomach_group.tz" "stomach_offset_distance.p2z";
connectAttr "stomach_group.tx" "stomach_offset_distance.p2x";
connectAttr "stomach_offset_distance.d" "stomach_offset_multiplyDivide.i1x";
connectAttr "stomach_offset_distance.d" "stomach_offset_multiplyDivide.i1y";
connectAttr "stomach_offset_multiplyDivide.ox" "stomachChestMid_loc_offset.i2";
connectAttr "curDistance_part_2.o" "stomachChestMid_loc_offset.i1";
connectAttr "stomach_offset_multiplyDivide.oy" "stomachHipsMid_loc_offset.i2";
connectAttr "curDistance_part_2_rev.o" "stomachHipsMid_loc_offset.i1";
connectAttr "curDistance_scaled_multiplyDivide.ox" "curDistance_part_2.i1";
connectAttr "curDistance_part_2.o" "curDistance_part_2_rev.i1";
connectAttr "pointMatrixMult5.o" "current_distance.p1";
connectAttr "pointMatrixMult6.o" "current_distance.p2";
connectAttr "chest.wm" "pointMatrixMult5.im";
connectAttr "hips.wm" "pointMatrixMult6.im";
connectAttr "current_distance.d" "curDistance_scaled_multiplyDivide.i1x";
connectAttr "root_connector_decMat.osx" "curDistance_scaled_multiplyDivide.i2x";
connectAttr "curDistance_part.o" "curDistance_part_rev.i1";
connectAttr "bend_surfShape.ws" "curveFromSurfaceIso1.is";
connectAttr "curDistance_part_2.o" "multDoubleLinear13.i1";
connectAttr "curDistance_scaled_multiplyDivide.ox" "curDistance_part.i1";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose6.msg" "skinCluster1.bp";
connectAttr "bendJoint_1.wm" "skinCluster1.ma[0]";
connectAttr "bendJoint_2.wm" "skinCluster1.ma[1]";
connectAttr "bendJoint_3.wm" "skinCluster1.ma[2]";
connectAttr "bendJoint_4.wm" "skinCluster1.ma[3]";
connectAttr "bendJoint_5.wm" "skinCluster1.ma[4]";
connectAttr "bend_joint_6.wm" "skinCluster1.ma[5]";
connectAttr "bend_joint_7.wm" "skinCluster1.ma[6]";
connectAttr "bendJoint_1.liw" "skinCluster1.lw[0]";
connectAttr "bendJoint_2.liw" "skinCluster1.lw[1]";
connectAttr "bendJoint_3.liw" "skinCluster1.lw[2]";
connectAttr "bendJoint_4.liw" "skinCluster1.lw[3]";
connectAttr "bendJoint_5.liw" "skinCluster1.lw[4]";
connectAttr "bend_joint_6.liw" "skinCluster1.lw[5]";
connectAttr "bend_joint_7.liw" "skinCluster1.lw[6]";
connectAttr "bendJoint_2.msg" "skinCluster1.ptt";
connectAttr "groupParts45.og" "tweak26.ip[0].ig";
connectAttr "groupId45.id" "tweak26.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "bend_surfShape.iog.og[21]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak26.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId45.msg" "tweakSet26.gn" -na;
connectAttr "bend_surfShape.iog.og[22]" "tweakSet26.dsm" -na;
connectAttr "tweak26.msg" "tweakSet26.ub[0]";
connectAttr "bend_surfShapeOrig3.ws" "groupParts45.ig";
connectAttr "groupId45.id" "groupParts45.gi";
connectAttr "local_3_group_2.wm" "multMatrix66.i[0]";
connectAttr "bend_joint_7.wim" "multMatrix66.i[1]";
connectAttr "multMatrix66.o" "decomposeMatrix86.imat";
connectAttr "decomposeMatrix86.ory" "unitConversion27.i";
connectAttr "decomposeMatrix86.ory" "unitConversion29.i";
connectAttr "multMatrix67.o" "decomposeMatrix87.imat";
connectAttr "local_3_group_2.wm" "multMatrix67.i[0]";
connectAttr "bendJoint_1.wim" "multMatrix67.i[1]";
connectAttr "decomposeMatrix87.ory" "unitConversion30.i";
connectAttr "decomposeMatrix87.ory" "unitConversion31.i";
connectAttr "bend_crvShape.ws" "bend_crv_0_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_1_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_2_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_3_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_4_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_5_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_6_mpath.gp";
connectAttr "bend_surfShape.ws" "closestPointOnSurface1.is";
connectAttr "bend_crv_1_jnt.t" "closestPointOnSurface1.ip";
connectAttr "bend_surfShape.ws" "closestPointOnSurface2.is";
connectAttr "bend_crv_2_jnt.t" "closestPointOnSurface2.ip";
connectAttr "bend_surfShape.ws" "closestPointOnSurface4.is";
connectAttr "bend_crv_3_jnt.t" "closestPointOnSurface4.ip";
connectAttr "bend_surfShape.ws" "closestPointOnSurface3.is";
connectAttr "bend_crv_4_jnt.t" "closestPointOnSurface3.ip";
connectAttr "bend_surfShape.ws" "closestPointOnSurface5.is";
connectAttr "bend_crv_5_jnt.t" "closestPointOnSurface5.ip";
connectAttr "mod.slidingJoints" "condition7.ft";
connectAttr "closestPointOnSurface1.u" "condition7.ctr";
connectAttr "mod.slidingJoints" "condition8.ft";
connectAttr "closestPointOnSurface2.u" "condition8.ctr";
connectAttr "mod.slidingJoints" "condition9.ft";
connectAttr "closestPointOnSurface3.u" "condition9.ctr";
connectAttr "mod.slidingJoints" "condition10.ft";
connectAttr "closestPointOnSurface4.u" "condition10.ctr";
connectAttr "mod.slidingJoints" "condition11.ft";
connectAttr "closestPointOnSurface5.u" "condition11.ctr";
connectAttr "fk_bone_2_out.wm" "multMatrix68.i[0]";
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
connectAttr "mod.msg" "bindPose6.m[0]";
connectAttr "controls.msg" "bindPose6.m[1]";
connectAttr "pelvis_group.msg" "bindPose6.m[2]";
connectAttr "fk_controls.msg" "bindPose6.m[5]";
connectAttr "fk_hips_group_2.msg" "bindPose6.m[6]";
connectAttr "fk_hips_group.msg" "bindPose6.m[7]";
connectAttr "fk_hips.msg" "bindPose6.m[8]";
connectAttr "bendJoint_1.msg" "bindPose6.m[9]";
connectAttr "bendJoint_2.msg" "bindPose6.m[10]";
connectAttr "ik_controls.msg" "bindPose6.m[11]";
connectAttr "stomach_group_2.msg" "bindPose6.m[12]";
connectAttr "stomach_group.msg" "bindPose6.m[13]";
connectAttr "stomach.msg" "bindPose6.m[14]";
connectAttr "stomachHipsMid_loc.msg" "bindPose6.m[15]";
connectAttr "bendJoint_3.msg" "bindPose6.m[16]";
connectAttr "bendJoint_4.msg" "bindPose6.m[17]";
connectAttr "stomachChestMid_loc.msg" "bindPose6.m[18]";
connectAttr "bendJoint_5.msg" "bindPose6.m[19]";
connectAttr "chest_group.msg" "bindPose6.m[20]";
connectAttr "chest.msg" "bindPose6.m[21]";
connectAttr "bend_joint_7.msg" "bindPose6.m[22]";
connectAttr "local_5_group.msg" "bindPose6.m[23]";
connectAttr "local_5.msg" "bindPose6.m[24]";
connectAttr "bend_joint_6.msg" "bindPose6.m[25]";
connectAttr "bindPose6.w" "bindPose6.p[0]";
connectAttr "bindPose6.m[0]" "bindPose6.p[1]";
connectAttr "bindPose6.m[1]" "bindPose6.p[2]";
connectAttr "bindPose6.m[2]" "bindPose6.p[3]";
connectAttr "bindPose6.m[3]" "bindPose6.p[4]";
connectAttr "bindPose6.m[4]" "bindPose6.p[5]";
connectAttr "bindPose6.m[5]" "bindPose6.p[6]";
connectAttr "bindPose6.m[6]" "bindPose6.p[7]";
connectAttr "bindPose6.m[7]" "bindPose6.p[8]";
connectAttr "bindPose6.m[8]" "bindPose6.p[9]";
connectAttr "bindPose6.m[9]" "bindPose6.p[10]";
connectAttr "bindPose6.m[4]" "bindPose6.p[11]";
connectAttr "bindPose6.m[11]" "bindPose6.p[12]";
connectAttr "bindPose6.m[12]" "bindPose6.p[13]";
connectAttr "bindPose6.m[13]" "bindPose6.p[14]";
connectAttr "bindPose6.m[14]" "bindPose6.p[15]";
connectAttr "bindPose6.m[15]" "bindPose6.p[16]";
connectAttr "bindPose6.m[14]" "bindPose6.p[17]";
connectAttr "bindPose6.m[14]" "bindPose6.p[18]";
connectAttr "bindPose6.m[18]" "bindPose6.p[19]";
connectAttr "bindPose6.m[11]" "bindPose6.p[20]";
connectAttr "bindPose6.m[20]" "bindPose6.p[21]";
connectAttr "bindPose6.m[21]" "bindPose6.p[22]";
connectAttr "bindPose6.m[22]" "bindPose6.p[23]";
connectAttr "bindPose6.m[23]" "bindPose6.p[24]";
connectAttr "bindPose6.m[24]" "bindPose6.p[25]";
connectAttr "bendJoint_1.bps" "bindPose6.wm[9]";
connectAttr "bendJoint_2.bps" "bindPose6.wm[10]";
connectAttr "bendJoint_3.bps" "bindPose6.wm[16]";
connectAttr "bendJoint_4.bps" "bindPose6.wm[17]";
connectAttr "bendJoint_5.bps" "bindPose6.wm[19]";
connectAttr "bend_joint_7.bps" "bindPose6.wm[22]";
connectAttr "bend_joint_6.bps" "bindPose6.wm[25]";
connectAttr "bendJoint_1_out.wm" "multMatrix69.i[0]";
connectAttr "root_outJoint.pim" "multMatrix69.i[1]";
connectAttr "multMatrix69.o" "decomposeMatrix90.imat";
connectAttr "end_poser.t" "distanceBetween1.p2";
connectAttr "root_poser.t" "distanceBetween1.p1";
connectAttr "spine_5_skinJoint_multMat2.o" "spine_5_skinJoint_decMat2.imat";
connectAttr "end_out.wm" "spine_5_skinJoint_multMat2.i[0]";
connectAttr "end_outJoint.pim" "spine_5_skinJoint_multMat2.i[1]";
connectAttr "root_connector_decMat.osz" "multDoubleLinear14.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear14.i2";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "distanceBetween3.d" "multiplyDivide1854.i1y";
connectAttr "end_poser.t" "plusMinusAverage1.i3[0]";
connectAttr "root_poser.t" "plusMinusAverage1.i3[1]";
connectAttr "multiplyDivide1856.o" "multiplyDivide1855.i1";
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
connectAttr "local_4.wm" "multMatrix70.i[0]";
connectAttr "local_5.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_4.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_3.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_2.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_1.iog" "local_moduleControlSet.dsm" -na;
connectAttr "root_poser.t" "distanceBetween2.p1";
connectAttr "end_poser.t" "distanceBetween2.p2";
connectAttr "distanceBetween2.d" "curDistance_part_3.i1";
connectAttr "skinCluster2GroupParts.og" "skinCluster2.ip[0].ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2.ip[0].gi";
connectAttr "bindPose7.msg" "skinCluster2.bp";
connectAttr "local_4_initJoint.wm" "skinCluster2.ma[0]";
connectAttr "local_1_initJoint.wm" "skinCluster2.ma[1]";
connectAttr "root_initJoint.wm" "skinCluster2.ma[2]";
connectAttr "local_5_initJoint.wm" "skinCluster2.ma[3]";
connectAttr "end_initJoint.wm" "skinCluster2.ma[4]";
connectAttr "local_2_initJoint.wm" "skinCluster2.ma[5]";
connectAttr "local_3_initJoint.wm" "skinCluster2.ma[6]";
connectAttr "local_4_initJoint.liw" "skinCluster2.lw[0]";
connectAttr "local_1_initJoint.liw" "skinCluster2.lw[1]";
connectAttr "root_initJoint.liw" "skinCluster2.lw[2]";
connectAttr "local_5_initJoint.liw" "skinCluster2.lw[3]";
connectAttr "end_initJoint.liw" "skinCluster2.lw[4]";
connectAttr "local_2_initJoint.liw" "skinCluster2.lw[5]";
connectAttr "local_3_initJoint.liw" "skinCluster2.lw[6]";
connectAttr "skinCluster2GroupId.msg" "skinCluster2Set.gn" -na;
connectAttr "init_surfShape.iog.og[23]" "skinCluster2Set.dsm" -na;
connectAttr "skinCluster2.msg" "skinCluster2Set.ub[0]";
connectAttr "tweak27.og[0]" "skinCluster2GroupParts.ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2GroupParts.gi";
connectAttr "groupParts47.og" "tweak27.ip[0].ig";
connectAttr "groupId47.id" "tweak27.ip[0].gi";
connectAttr "groupId47.msg" "tweakSet27.gn" -na;
connectAttr "init_surfShape.iog.og[24]" "tweakSet27.dsm" -na;
connectAttr "tweak27.msg" "tweakSet27.ub[0]";
connectAttr "init_surfShapeOrig.ws" "groupParts47.ig";
connectAttr "groupId47.id" "groupParts47.gi";
connectAttr "mod.msg" "bindPose7.m[0]";
connectAttr "posers.msg" "bindPose7.m[1]";
connectAttr "mainPoser.msg" "bindPose7.m[2]";
connectAttr "init_locators_group.msg" "bindPose7.m[3]";
connectAttr "local_4_initJoint.msg" "bindPose7.m[4]";
connectAttr "local_1_initJoint.msg" "bindPose7.m[5]";
connectAttr "root_initJoint.msg" "bindPose7.m[6]";
connectAttr "local_5_initJoint.msg" "bindPose7.m[7]";
connectAttr "end_initJoint.msg" "bindPose7.m[8]";
connectAttr "local_2_initJoint.msg" "bindPose7.m[9]";
connectAttr "local_3_initJoint.msg" "bindPose7.m[10]";
connectAttr "bindPose7.w" "bindPose7.p[0]";
connectAttr "bindPose7.m[0]" "bindPose7.p[1]";
connectAttr "bindPose7.m[1]" "bindPose7.p[2]";
connectAttr "bindPose7.m[2]" "bindPose7.p[3]";
connectAttr "bindPose7.m[3]" "bindPose7.p[4]";
connectAttr "bindPose7.m[3]" "bindPose7.p[5]";
connectAttr "bindPose7.m[3]" "bindPose7.p[6]";
connectAttr "bindPose7.m[3]" "bindPose7.p[7]";
connectAttr "bindPose7.m[3]" "bindPose7.p[8]";
connectAttr "bindPose7.m[3]" "bindPose7.p[9]";
connectAttr "bindPose7.m[3]" "bindPose7.p[10]";
connectAttr "mainPoser.wm" "end_multMatrix1.i[0]";
connectAttr "root_poser.wim" "end_multMatrix1.i[1]";
connectAttr "end_multMatrix1.o" "end_decomposeMatrix1.imat";
connectAttr "end_poser.t" "distanceBetween3.p1";
connectAttr "root_poser.t" "distanceBetween3.p2";
connectAttr "plusMinusAverage1.o3" "multiplyDivide1856.i1";
connectAttr "local_end_outJoint_multMat.o" "local_end_outJoint_decMat.imat";
connectAttr "end_out.wm" "local_end_outJoint_multMat.i[0]";
connectAttr "local_end_outJoint.pim" "local_end_outJoint_multMat.i[1]";
connectAttr "fk_bone_3_out.wm" "multMatrix74.i[0]";
connectAttr "multMatrix74.o" "decomposeMatrix94.imat";
connectAttr "decomposeMatrix94.oqy" "quatToEuler1.iqy";
connectAttr "decomposeMatrix94.oqw" "quatToEuler1.iqw";
connectAttr "decomposeMatrix94.oqy" "quatToEuler2.iqy";
connectAttr "decomposeMatrix94.oqw" "quatToEuler2.iqw";
connectAttr "size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "size_multiplyDivide.oy" "makeNurbSphere2.r";
connectAttr "size_multiplyDivide.oz" "makeNurbSphere3.r";
connectAttr "size_multiplyDivide1.ox" "makeNurbSphere4.r";
connectAttr "size_multiplyDivide1.oy" "makeNurbSphere5.r";
connectAttr "size_multiplyDivide1.oz" "makeNurbSphere6.r";
connectAttr "end_poser.size" "size_multiplyDivide.i1x";
connectAttr "local_5_poser.size" "size_multiplyDivide.i1y";
connectAttr "local_4_poser.size" "size_multiplyDivide.i1z";
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
connectAttr "multMatrix73.o" "decomposeMatrix93.imat";
connectAttr "fk_3_pivot_loc.wm" "multMatrix73.i[0]";
connectAttr "fk_bone_3_group_pos.wim" "multMatrix73.i[1]";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "end_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "mainPoser.globalSize" "multDoubleLinear15.i1";
connectAttr "root_poser_decMat.osx" "multDoubleLinear15.i2";
connectAttr "posers_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "sweepMeshCreator1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "root_poser_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "fk_bone_3_group_pos.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "mainPoser_clusterHandle.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "bend_5_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "end_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "distanceBetween3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "chestStomachMid_loc_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "local_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "end_poserOrient_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "local_5_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "bend_joint_7_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "distanceBetween2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "multiplyDivide1854.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "fk_controls_positions.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn"
		;
connectAttr "local_2_initFoll.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn"
		;
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn";
connectAttr "multiplyDivide1849.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "pelvis.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn";
connectAttr "curDistance_part_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn"
		;
connectAttr "makeNurbSphere7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn"
		;
connectAttr "fk_bone_3_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "root_initJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn";
connectAttr "local_2_poser_group_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "bendJoint_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn";
connectAttr "fk_2_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn";
connectAttr "local_4_initFoll.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn"
		;
connectAttr "local_5_initFoll.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn"
		;
connectAttr "bend_4_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn";
connectAttr "input.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn";
connectAttr "bendJoint_1_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn"
		;
connectAttr "end_decomposeMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[30].dn"
		;
connectAttr "multiplyDivide1853.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[31].dn"
		;
connectAttr "bend_1_posJoint_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[32].dn"
		;
connectAttr "size_multiplyDivide2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[33].dn"
		;
connectAttr "chestStomachMid_aim.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[34].dn"
		;
connectAttr "end_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[35].dn"
		;
connectAttr "fk_3_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[36].dn";
connectAttr "posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[37].dn"
		;
connectAttr "local_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[38].dn"
		;
connectAttr "end_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[39].dn"
		;
connectAttr "fk_bone_3_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[40].dn";
connectAttr "multiplyDivide1855.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[41].dn"
		;
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[42].dn"
		;
connectAttr "hipsStomachMid_loc_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[43].dn"
		;
connectAttr "fk_bone_2_group_pos.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[44].dn"
		;
connectAttr "root_poser_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[45].dn"
		;
connectAttr "local_3_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[46].dn"
		;
connectAttr "plusMinusAverage1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[47].dn"
		;
connectAttr "fk_bone_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[48].dn"
		;
connectAttr "fk_1_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[49].dn";
connectAttr "multiplyDivide1856.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[50].dn"
		;
connectAttr "local_5_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[51].dn"
		;
connectAttr "local_4_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[52].dn"
		;
connectAttr "fk_bone_1_group_pos.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[53].dn"
		;
connectAttr "distanceBetween1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[54].dn"
		;
connectAttr "squash_blendTwoAttr.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[55].dn"
		;
connectAttr "bend_joint_7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[56].dn";
connectAttr "bend_3_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[57].dn";
connectAttr "multiplyDivide1846.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[58].dn"
		;
connectAttr "local_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[59].dn"
		;
connectAttr "local_3_poser_group_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[60].dn"
		;
connectAttr "initJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[61].dn";
connectAttr "fk_hips_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[62].dn";
connectAttr "local_1_initFoll.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[63].dn"
		;
connectAttr "local_1_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[64].dn"
		;
connectAttr "bendJoint_1_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[65].dn"
		;
connectAttr "hipsStomachMid_aim.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[66].dn"
		;
connectAttr "bend_1_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[67].dn";
connectAttr "parts_multiplyDivide.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[68].dn"
		;
connectAttr "bend_2_jnt.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[69].dn";
connectAttr "local_5_poser_group_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[70].dn"
		;
connectAttr "local_4_poser_group_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[71].dn"
		;
connectAttr "local_1_poser_group_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[72].dn"
		;
connectAttr "local_3_initFoll.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[73].dn"
		;
connectAttr "fk_bone_2_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[74].dn"
		;
connectAttr "sweepMeshCreator1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[75].dn"
		;
connectAttr "end_multMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[76].dn"
		;
connectAttr "local_2_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[77].dn"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[78].dn"
		;
connectAttr "local_4_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[79].dn"
		;
connectAttr "local_5_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "local_4_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "root_poser_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "local_4_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "local_5_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn";
connectAttr "local_1_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "local_2_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn"
		;
connectAttr "end_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn";
connectAttr "local_3_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn";
connectAttr "local_2_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn";
connectAttr "end_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "local_3_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn"
		;
connectAttr "local_1_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn"
		;
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
connectAttr "chest_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "parts_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "end_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "squash_blendTwoAttr.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1846.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curveInfo3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1849.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1853.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bendJoint_4_multiply_position.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "stomach_offset_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "stomach_offset_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "stomachChestMid_loc_offset.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "stomachHipsMid_loc_offset.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part_2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part_2_rev.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "current_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_scaled_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "curDistance_part_rev.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix86.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion27.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion29.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix87.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix88.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix89.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix90.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1854.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1855.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix91.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix92.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix93.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part_3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "end_decomposeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1856.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix94.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "quatToEuler1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "quatToEuler2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "bend_surfShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "init_surfShape.iog" ":initialShadingGroup.dsm" -na;
// End of spine.ma
