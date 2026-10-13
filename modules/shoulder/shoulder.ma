//Maya ASCII 2022 scene
//Name: shoulder.ma
//Last modified: Mon, Oct 12, 2026 02:02:53 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "inverseMatrix" -nodeType "transposeMatrix" "matrixNodes" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26300)";
fileInfo "UUID" "93C3EE31-4BA5-1447-8591-1A9D140D99F8";
createNode transform -n "mod";
	rename -uid "796B45B9-43DB-82CA-C93B-1A91B6023A77";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "armConnected" -ln "armConnected" -at "double";
createNode transform -n "posers" -p "mod";
	rename -uid "4295F9C2-4F7B-E34F-ECAD-1FB25E9C5061";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "079BBC3E-46A2-E93B-5E9D-58814DF8C9A7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "scapulaFollow" -ln "scapulaFollow" -dv 0.6 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "scapulaUp" -ln "scapulaUp" -dv 30 -at "double";
	addAttr -ci true -sn "scapulaDown" -ln "scapulaDown" -dv -20 -at "double";
	addAttr -ci true -sn "muscleVolume" -ln "muscleVolume" -dv 0.5 -min 0 -max 2 -at "double";
	addAttr -ci true -sn "pecUpperBelly" -ln "pecUpperBelly" -dv 0.5 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "pecLowerBelly" -ln "pecLowerBelly" -dv 0.5 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "latBelly" -ln "latBelly" -dv 0.5 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "trapBelly" -ln "trapBelly" -dv 0.5 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "fiberHold" -ln "fiberHold" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fiberHoldBelow" -ln "fiberHoldBelow" -dv 0.7 -min 0.01 -max 
		1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".scapulaFollow";
	setAttr -k on ".scapulaUp";
	setAttr -k on ".scapulaDown";
	setAttr -k on ".muscleVolume";
	setAttr -k on ".pecUpperBelly";
	setAttr -k on ".pecLowerBelly";
	setAttr -k on ".latBelly";
	setAttr -k on ".trapBelly";
	setAttr -k on ".fiberHold";
	setAttr -k on ".fiberHoldBelow";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "C85FD3BD-4B15-B4FD-5AE1-EF966DC407CB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "07E5E7A8-424A-D812-4CD5-828825C1FF46";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "F302DA9A-496E-99CA-7D7C-8898CAEE0A31";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "DFB53D08-4656-00F0-34A1-6297C7446241";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "A9C00079-4C03-D084-162C-95AAE39571D1";
	setAttr -k off ".v";
createNode transform -n "main_initLoc" -p "root_poser";
	rename -uid "78764AE6-4639-BADC-DE6D-4EAFAC1CE5E4";
	setAttr ".v" no;
createNode locator -n "main_initLocShape" -p "main_initLoc";
	rename -uid "CFFEF4AD-48BE-D0B3-001C-D58BF22A7527";
	setAttr -k off ".v";
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "E3C14DBD-4FF6-7D6C-6BBC-6A968B9858E1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 15 0 no 3
		16 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		16
		-0.99824146113335877 0.99824146113335877 0.99824146113335877
		-0.99824146113335877 0.99824146113335877 -0.99824146113335877
		0.99824146113335877 0.99824146113335877 -0.99824146113335877
		0.99824146113335877 0.99824146113335877 0.99824146113335877
		-0.99824146113335877 0.99824146113335877 0.99824146113335877
		-0.99824146113335877 -0.99824146113335877 0.99824146113335877
		-0.99824146113335877 -0.99824146113335877 -0.99824146113335877
		0.99824146113335877 -0.99824146113335877 -0.99824146113335877
		0.99824146113335877 -0.99824146113335877 0.99824146113335877
		-0.99824146113335877 -0.99824146113335877 0.99824146113335877
		0.99824146113335877 -0.99824146113335877 0.99824146113335877
		0.99824146113335877 0.99824146113335877 0.99824146113335877
		0.99824146113335877 0.99824146113335877 -0.99824146113335877
		0.99824146113335877 -0.99824146113335877 -0.99824146113335877
		-0.99824146113335877 -0.99824146113335877 -0.99824146113335877
		-0.99824146113335877 0.99824146113335877 -0.99824146113335877
		;
createNode transform -n "shoulder_poser" -p "mainPoser";
	rename -uid "EB68BE9C-4245-7F7C-CF96-048974DBEFEB";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.25 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 1.85 0.65 -1.35 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "shoulder_poserShape" -p "shoulder_poser";
	rename -uid "0ABA7A13-4E6E-2FA2-1058-73AB8B42CD0B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "elbowRest_loc" -p "shoulder_poser";
	rename -uid "C95AA784-445F-1C78-BE54-49BD6E6DE05F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5 0 0 ;
createNode locator -n "elbowRest_locShape" -p "elbowRest_loc";
	rename -uid "2379EEC4-4CB6-0E42-7AEA-9D88B96D619B";
	setAttr -k off ".v";
createNode transform -n "scapulaTop_poser" -p "mainPoser";
	rename -uid "33A8CFAC-49C5-FE29-AA6D-6993FB97D6E4";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.2 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0.4 -0.4 -2.9 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "scapulaTop_poserShape" -p "scapulaTop_poser";
	rename -uid "78B6F202-4516-BBED-E731-8FB24E729FB1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "scapulaTip_poser" -p "mainPoser";
	rename -uid "9F1CB53E-45A9-F33C-9FA6-D8B7394CD283";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.2 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0.9 -3.8 -2.6 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "scapulaTip_poserShape" -p "scapulaTip_poser";
	rename -uid "637926BA-4BCF-246E-5416-6D938C389BD4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "pecUpperOrigin_poser" -p "mainPoser";
	rename -uid "2C8BB1CF-4434-8A52-22E3-CCA883A3773D";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 0.6 0.1 -0.1 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "pecUpperOrigin_poserShape" -p "pecUpperOrigin_poser";
	rename -uid "3EF5E9B8-4B87-3660-8A96-89AB3FFC4658";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "pecLowerOrigin_poser" -p "mainPoser";
	rename -uid "1F8743F2-4528-FADD-D45C-CD9B2EDF1A16";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -0.7 -2.2 1.1 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "pecLowerOrigin_poserShape" -p "pecLowerOrigin_poser";
	rename -uid "1CFC4A90-4B95-1E91-2E6D-F8A8A102F01D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "pecInsert_poser" -p "mainPoser";
	rename -uid "630E468E-4FF2-6E5D-BD3F-4984687D7926";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 3.15 0 -1.1 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "pecInsert_poserShape" -p "pecInsert_poser";
	rename -uid "16B03067-4C06-BC3A-9528-CFA31C08E8E5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "latOrigin_poser" -p "mainPoser";
	rename -uid "D5529CB8-4429-FCA2-CCEC-2C9C1D1CDF3D";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 0.4 -5.4 -2.5 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "latOrigin_poserShape" -p "latOrigin_poser";
	rename -uid "95F18CBC-487C-7A7D-6C8A-1DB1C05CB840";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "latInsert_poser" -p "mainPoser";
	rename -uid "31EA7258-45A7-3D53-581C-51A26946A66B";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 3.1 -0.1 -2.1 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "latInsert_poserShape" -p "latInsert_poser";
	rename -uid "E8DD14CD-4211-F257-0EF2-9EA5D4551FBA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "trapOrigin_poser" -p "mainPoser";
	rename -uid "B7062418-4D76-F785-1154-4AB25BAF4820";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -0.5 1.7 -1.4 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "trapOrigin_poserShape" -p "trapOrigin_poser";
	rename -uid "7EAC3F08-4587-BA0B-C405-43BEE060F991";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "trapInsert_poser" -p "mainPoser";
	rename -uid "4C67C825-4F37-A119-3D4B-B99F177514AC";
	addAttr -ci true -k true -sn "size" -ln "size" -dv 0.15 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.4 0.9 -1.9 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size";
createNode nurbsSurface -n "trapInsert_poserShape" -p "trapInsert_poser";
	rename -uid "742C7957-486E-D22D-BC7F-68B0CC6537A6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "ribcage_poser" -p "mainPoser";
	rename -uid "FF2A2485-4700-6812-8DFD-64AE7346F6C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".t" -type "double3" -1.216 -2.7 -1 ;
	setAttr ".s" -type "double3" 3 4.2 2 ;
createNode nurbsSurface -n "ribcage_poserShape" -p "ribcage_poser";
	rename -uid "E6037635-43D5-EB63-C519-D1BC32B405B1";
	setAttr -k off ".v";
	setAttr ".ovs" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 2;
	setAttr ".dvv" 2;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
createNode transform -n "scapula_guide" -p "mainPoser";
	rename -uid "1BF89212-49F8-1C7B-DD05-44BFD14EE317";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "scapula_guideShape" -p "scapula_guide";
	rename -uid "BAFB2C1E-4FFB-F5A4-AA95-038077B61DD4";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		0.40000000000000002 -0.40000000000000002 -2.8999999999999999
		1.8500000000000001 0.65000000000000002 -1.3500000000000001
		0.90000000000000002 -3.7999999999999998 -2.6000000000000001
		0 0 3
		;
createNode transform -n "clavicle_guide" -p "mainPoser";
	rename -uid "EE4476A4-418B-D57F-C282-88B48DAA319C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "clavicle_guideShape" -p "clavicle_guide";
	rename -uid "65B784DC-4309-C131-3C3C-C6B3FB474D45";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 0
		0 0 1
		;
createNode transform -n "pecUpper_guide" -p "mainPoser";
	rename -uid "7E81C3D4-4307-B8AD-2F6F-4B9D9326E190";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "pecUpper_guideShape" -p "pecUpper_guide";
	rename -uid "A1B5C6BF-46DA-8A12-78E9-6492D6F20B8F";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0.59999999999999998 0.10000000000000001 -0.10000000000000001
		0 0 1
		;
createNode transform -n "pecLower_guide" -p "mainPoser";
	rename -uid "437F3A16-48C7-555B-4F86-A4B3E89FC228";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "pecLower_guideShape" -p "pecLower_guide";
	rename -uid "C4BBECF1-48BE-7ADD-8AD7-BE816DBAB7E6";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.69999999999999996 -2.2000000000000002 1.1000000000000001
		0 0 1
		;
createNode transform -n "lat_guide" -p "mainPoser";
	rename -uid "00E480E4-4A97-B8E1-19F2-D5AE5B9C293F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "lat_guideShape" -p "lat_guide";
	rename -uid "F578CB12-4AA6-3D34-70D4-5E9AB298A149";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0.40000000000000002 -5.4000000000000004 -2.5
		0 0 1
		;
createNode transform -n "trap_guide" -p "mainPoser";
	rename -uid "68855422-4C7D-A8E8-653F-B29185A3FF07";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "trap_guideShape" -p "trap_guide";
	rename -uid "C7E334B7-4B5B-461F-69C8-E4BF0A0E5834";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.5 1.7 -1.3999999999999999
		0 0 1
		;
createNode transform -n "mainPoser_clusterHandle" -p "posers";
	rename -uid "65F3284F-4125-DEAF-C10D-099631D538B8";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "2573616C-43D9-0E43-9E42-E8BB836A9F84";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "input" -p "mod";
	rename -uid "B3EAAA1D-4341-4BF3-DD9D-038012C172E3";
	setAttr ".v" no;
createNode transform -n "root_connector" -p "input";
	rename -uid "53A087BF-4AEA-ADFA-346D-888D9621DCFC";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "51A6D925-4273-74C5-6072-B4AD63BD808A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "controls" -p "mod";
	rename -uid "7A32981C-491F-A0A0-AB59-0291C69C1B40";
	setAttr ".ove" yes;
createNode transform -n "root_group" -p "controls";
	rename -uid "73C2A4AD-4CCD-CA3D-9682-EEAF0312A343";
createNode transform -n "root" -p "root_group";
	rename -uid "F26C6DA9-4748-7D8A-3D92-7ABE72C6C83B";
	setAttr -l on -k off ".v";
	setAttr ".ro" 3;
	setAttr -k on ".s";
createNode nurbsCurve -n "rootShape" -p "root";
	rename -uid "61D0D67D-4C64-160B-F65D-9AA3E9F58A22";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.3638838877162365 1.4958867149879995e-16 -2.3638838877162174
		3.3430366538835474 1.0030416422998379e-16 3.1557008150757007e-14
		2.3638838877162365 -6.3896344480225851e-16 2.363883887716284
		1.3984906259897748e-15 -5.4039443026462189e-16 3.3430366538835705
		-2.3638838877162494 1.4958867149879995e-16 2.3638838877162849
		-3.3430366538835474 1.7351496923521325e-18 3.366753633440718e-14
		-2.3638838877162365 8.8885628053103699e-16 -2.3638838877161894
		-2.850395774432805e-15 6.4243374418696197e-16 -3.3430366538835363
		2.3638838877162365 1.4958867149879995e-16 -2.3638838877162174
		3.3430366538835474 1.0030416422998379e-16 3.1557008150757007e-14
		2.3638838877162365 -6.3896344480225851e-16 2.363883887716284
		;
createNode transform -n "scapula_poseSpace" -p "controls";
	rename -uid "4671C1E6-4519-979E-861C-B4BD4C572779";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "scapula_forward_poseLoc" -p "scapula_poseSpace";
	rename -uid "1A2CFD6E-442B-F439-D69B-F7A777FB439D";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "scapula_forward_poseLocShape" -p "scapula_forward_poseLoc";
	rename -uid "2533F5E9-4CFD-4666-CF44-36AA1CA0500D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "scapula_back_poseLoc" -p "scapula_poseSpace";
	rename -uid "C742C5CB-41CA-806A-AF42-AFB364A8A9DC";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "scapula_back_poseLocShape" -p "scapula_back_poseLoc";
	rename -uid "2965E42D-40B8-7F49-BDD4-06BDB76A7829";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "scapula_up_poseLoc" -p "scapula_poseSpace";
	rename -uid "2EF025B4-4BAD-AC83-78AF-FEBAC277E15D";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "scapula_up_poseLocShape" -p "scapula_up_poseLoc";
	rename -uid "CAA895DF-48BA-D253-78CC-1E843AC98FCC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "scapulaTip_poseSpace" -p "controls";
	rename -uid "DDDDC146-44FF-0762-8EE5-44BCA426A7A7";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "scapulaTip_forward_poseLoc" -p "scapulaTip_poseSpace";
	rename -uid "0BD5EFB2-4389-6D28-4BB3-63853D4AAA3C";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "scapulaTip_forward_poseLocShape" -p "scapulaTip_forward_poseLoc";
	rename -uid "91A5DFE6-451D-94CD-6839-11B153C509E4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "scapulaTip_back_poseLoc" -p "scapulaTip_poseSpace";
	rename -uid "4DE3F8A4-418D-23D9-8C95-259AD5F07EA4";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "scapulaTip_back_poseLocShape" -p "scapulaTip_back_poseLoc";
	rename -uid "AB0175C2-4FD5-743E-8532-0E9D07AF83E9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "scapulaTip_up_poseLoc" -p "scapulaTip_poseSpace";
	rename -uid "37CCA776-415F-802E-7F58-449A72DFC6E9";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "scapulaTip_up_poseLocShape" -p "scapulaTip_up_poseLoc";
	rename -uid "65116A49-4492-F787-6FBA-56932D0D9FFD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "pecUpper_poseSpace" -p "controls";
	rename -uid "4B12DAE4-4CED-AC9D-DAA1-A1A33EF91878";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "pecUpper_forward_poseLoc" -p "pecUpper_poseSpace";
	rename -uid "E39931BD-4A15-2D2E-1DB1-0AB51BC8349D";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "pecUpper_forward_poseLocShape" -p "pecUpper_forward_poseLoc";
	rename -uid "48B2C3B7-4FD4-8E73-2CB0-9786768BEFBB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "pecUpper_back_poseLoc" -p "pecUpper_poseSpace";
	rename -uid "5803CEC4-401B-D778-9657-00BE58FE2E67";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "pecUpper_back_poseLocShape" -p "pecUpper_back_poseLoc";
	rename -uid "DE07A6E8-42C0-3D03-2BED-63BD75B5DF55";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "pecUpper_up_poseLoc" -p "pecUpper_poseSpace";
	rename -uid "56E59822-4B8C-5BD6-3A0B-C080AD9045F1";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "pecUpper_up_poseLocShape" -p "pecUpper_up_poseLoc";
	rename -uid "3FF65692-42F0-A52A-71F8-768AB426853A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "pecLower_poseSpace" -p "controls";
	rename -uid "5D2BC89D-4BDC-EE3C-DD4E-99854F7AA995";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "pecLower_forward_poseLoc" -p "pecLower_poseSpace";
	rename -uid "D1A787E3-4FF1-6D4E-C835-35B2AAAF73C2";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "pecLower_forward_poseLocShape" -p "pecLower_forward_poseLoc";
	rename -uid "303C02BB-4DC5-3D18-4C66-D791A028A5CA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "pecLower_back_poseLoc" -p "pecLower_poseSpace";
	rename -uid "4CD68317-4031-8B19-8377-8C9A2045803F";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "pecLower_back_poseLocShape" -p "pecLower_back_poseLoc";
	rename -uid "C3A00740-469A-CFA6-7105-E8BB43D4CA83";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "pecLower_up_poseLoc" -p "pecLower_poseSpace";
	rename -uid "116644D2-4A53-A626-6B7A-629D00C0B889";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "pecLower_up_poseLocShape" -p "pecLower_up_poseLoc";
	rename -uid "74AAB1F7-4D16-4BB4-CECE-83B2E4EA485A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "lat_poseSpace" -p "controls";
	rename -uid "732AE666-4843-651E-2C0C-B58C8346E600";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "lat_forward_poseLoc" -p "lat_poseSpace";
	rename -uid "51628B56-4292-2AFD-BDB1-44AD42DB213F";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "lat_forward_poseLocShape" -p "lat_forward_poseLoc";
	rename -uid "53049A39-407D-58F1-8A11-1099A047D5CB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "lat_back_poseLoc" -p "lat_poseSpace";
	rename -uid "53B39604-4315-02D3-0586-CFB6BEC747BD";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "lat_back_poseLocShape" -p "lat_back_poseLoc";
	rename -uid "79111121-4597-45FA-126C-AA9AECDE51F7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "lat_up_poseLoc" -p "lat_poseSpace";
	rename -uid "B2CCD296-4919-BE3F-03D6-5AABEE52118D";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "lat_up_poseLocShape" -p "lat_up_poseLoc";
	rename -uid "4249557B-444B-9A79-12E9-18AD8A495186";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "trap_poseSpace" -p "controls";
	rename -uid "C8303F95-48B5-7D79-E68B-E4B41274EBE0";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "trap_forward_poseLoc" -p "trap_poseSpace";
	rename -uid "371CAFEE-4838-5DD1-45B9-92B3C18962BF";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "trap_forward_poseLocShape" -p "trap_forward_poseLoc";
	rename -uid "E37A3D1F-410D-C8CA-35F6-5080901ECC2F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "trap_back_poseLoc" -p "trap_poseSpace";
	rename -uid "0EA3E694-4F52-51A0-94CC-AD8AC3A37C60";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "trap_back_poseLocShape" -p "trap_back_poseLoc";
	rename -uid "389FDB43-4F44-0931-DF61-F0B0B0218A16";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "trap_up_poseLoc" -p "trap_poseSpace";
	rename -uid "6F6BE274-44D3-B327-9290-698BE2D3F702";
	setAttr -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "trap_up_poseLocShape" -p "trap_up_poseLoc";
	rename -uid "139FE334-4198-35CF-D885-6E9225C7CFEA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.4 0.4 0.4 ;
createNode transform -n "system" -p "mod";
	rename -uid "E33BEB84-4823-1A88-CA87-4EADCFD8F828";
createNode transform -n "output" -p "mod";
	rename -uid "6F030D73-420A-1DA9-DB36-3AB8C9C07059";
createNode transform -n "outJoints" -p "output";
	rename -uid "C606F955-4361-424E-A57C-129E07CFCFD5";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "DA961880-46EE-B695-84C8-E3A5B7A8AEE5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "forwardAngle" -ln "forwardAngle" -dv 25 -min 1 -at "double";
	addAttr -ci true -sn "backAngle" -ln "backAngle" -dv 25 -min 1 -at "double";
	addAttr -ci true -sn "upAngle" -ln "upAngle" -dv 30 -min 1 -at "double";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr -k on -cb off ".radi";
	setAttr -k on ".forwardAngle";
	setAttr -k on ".backAngle";
	setAttr -k on ".upAngle";
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode joint -n "scapula_outJoint" -p "root_outJoint";
	rename -uid "497BD8AF-46F4-A2E4-3619-5A98FD5BC8EF";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr ".radi" 0.5;
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode joint -n "scapulaTip_outJoint" -p "root_outJoint";
	rename -uid "100B81C0-43C0-2BDE-03F0-61942D8365AC";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr ".radi" 0.5;
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode joint -n "pecUpper_outJoint" -p "root_outJoint";
	rename -uid "515759F4-434D-DD69-778F-819707C4E55E";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr ".radi" 0.5;
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode joint -n "pecLower_outJoint" -p "root_outJoint";
	rename -uid "95D08633-46BE-FD6B-9CE8-53AE6DE66307";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr ".radi" 0.5;
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode joint -n "lat_outJoint" -p "root_outJoint";
	rename -uid "26A7DA97-4EBF-3580-3637-F38015013326";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr ".radi" 0.5;
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode joint -n "trap_outJoint" -p "root_outJoint";
	rename -uid "07B6FEB5-4F36-9862-C3BD-54B36A28E756";
	addAttr -ci true -sn "showForward" -ln "showForward" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showBack" -ln "showBack" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "showUp" -ln "showUp" -min 0 -max 1 -at "bool";
	setAttr ".radi" 0.5;
	setAttr -k on ".showForward";
	setAttr -k on ".showBack";
	setAttr -k on ".showUp";
createNode transform -s -n "persp";
	rename -uid "5D24B4F0-48F4-0BBF-2883-0FB107072B31";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.39323308675312485 11.285874386378262 14.860841110697637 ;
	setAttr ".r" -type "double3" -39.60000000000155 -349.60000000001702 8.0841981895660185e-16 ;
	setAttr ".rp" -type "double3" -6.9388939039072284e-18 1.1102230246251563e-16 2.2204460492503131e-16 ;
	setAttr ".rpt" -type "double3" -2.0710120022049341e-16 1.3723218949214615e-17 -2.394600998630024e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "FA06188C-40FD-4EF2-A7A8-2DBD9ED48E1A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 18.772426038983156;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 1.0415922415595477e-16 1.5543122344752192e-14 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "3DE8336C-402E-ED89-1A73-7CB6566A0C09";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.38283284696691933 44.605086454172408 0.32532196653745471 ;
	setAttr ".r" -type "double3" -90 -360 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "C13A0A32-480E-FAB4-7DDB-61860D3B1DFF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 24.627966839062363;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F8E080BB-4C63-C9FB-C0BB-C192650A2817";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.2915738820034981 0.78776544962929829 8.4337329019555192 ;
	setAttr ".r" -type "double3" 0 -360 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "6248469F-456A-6944-C2F4-05B8C7F589E8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 8.9783062132711429;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "440099C0-42D1-A499-B20D-69A0F18CA0CA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.0699600043254431 -0.18480748037566552 -0.24181561130914625 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F5BCB2FD-493B-2B40-AFE4-FDB54C16EA4A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.6409172568145158;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "E31E9FC5-4331-E0DD-E4DD-2BB95A43AA34";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "5E4A5BEC-4707-809F-20F8-7CBC68AC6EA7";
createNode displayLayer -n "defaultLayer";
	rename -uid "6684CFD7-4C9D-D20C-7922-43B1C9C96070";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "F301B812-4CA7-B6B0-664B-7FAF855410B5";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "C8562179-48C0-C6E6-EC2D-C98541679724";
	setAttr ".g" yes;
createNode objectSet -n "sets";
	rename -uid "C81ADCD3-4BF1-7A81-A8D9-B59FF0130DB8";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "moduleControlSet";
	rename -uid "3C698155-41CE-4B09-5C32-868CCF93B68F";
	setAttr ".ihi" 0;
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "root_decomposeMatrix";
	rename -uid "0A52AEE4-40D1-DEF0-8BB4-DD854B606741";
createNode condition -n "mirror_condition";
	rename -uid "046D833C-46E8-6A1C-3AFC-6DA814814DD6";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
	setAttr ".cf" -type "float3" 1 0 0 ;
createNode multMatrix -n "root_multMatrix";
	rename -uid "23740F9F-4543-F65A-C842-1983E844881B";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "root_ctrJoint_decomposeMatrix";
	rename -uid "B23DF042-4920-972E-B34E-3495D2664628";
createNode multDoubleLinear -n "negate";
	rename -uid "7FC27DA1-4067-DA67-BBB0-2E9270F8A353";
	setAttr ".i2" -1;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "6D0273C6-4A96-9BF6-11FB-2B991FC9128E";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "D405B123-4CFA-6B11-C723-128D03A15CEC";
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "6E7D770B-40F8-7736-8F57-758A20381435";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "4DB49BAA-4AFF-D2AA-7FEB-42B04108499D";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "96D17248-4392-5B22-1222-C1BBF0D4D123";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 3162.0788522829125 -742.01506923738589 ;
	setAttr ".tgi[0].vh" -type "double2" 8207.4232123874026 829.26825973076689 ;
	setAttr ".tgi[0].ni[0].x" 1441.4285888671875;
	setAttr ".tgi[0].ni[0].y" 120;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "96EB0403-4507-2F95-D609-7EBE26F40E1C";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 120 -ast 0 -aet 140 ";
	setAttr ".st" 6;
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "93CC364F-4326-1C82-5B68-C1AB6B8DFE03";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode condition -n "mirror_condition_2";
	rename -uid "BAFB1C48-44C1-0AE7-9262-56BBE8208782";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 1 0 0 ;
createNode objectSet -n "skinJointsSet";
	rename -uid "6CCCC7BD-418F-7D40-9123-5784BE2947B3";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "2C9E2075-436A-5D5B-F27D-9E875F21C4BC";
	setAttr -s 4 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -4947.6192767657949 -1338.0953002307233 ;
	setAttr ".tgi[0].vh" -type "double2" 8766.6667440581023 2376.1904970757482 ;
	setAttr -s 10 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 3160;
	setAttr ".tgi[0].ni[0].y" 974.28570556640625;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 1624.2857666015625;
	setAttr ".tgi[0].ni[1].y" 611.4285888671875;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 2852.857177734375;
	setAttr ".tgi[0].ni[2].y" 1025.7142333984375;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" 3467.142822265625;
	setAttr ".tgi[0].ni[3].y" 974.28570556640625;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 3467.142822265625;
	setAttr ".tgi[0].ni[4].y" 554.28570556640625;
	setAttr ".tgi[0].ni[4].nvs" 18305;
	setAttr ".tgi[0].ni[5].x" 985.71429443359375;
	setAttr ".tgi[0].ni[5].y" 665.71429443359375;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" 3467.142822265625;
	setAttr ".tgi[0].ni[6].y" 655.71429443359375;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 1292.857177734375;
	setAttr ".tgi[0].ni[7].y" 570;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" 1621.8167724609375;
	setAttr ".tgi[0].ni[8].y" 763.82769775390625;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" 1949.945556640625;
	setAttr ".tgi[0].ni[9].y" 897.53106689453125;
	setAttr ".tgi[0].ni[9].nvs" 18305;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -6880.3572952037812 -3141.0714190630724 ;
	setAttr ".tgi[1].vh" -type "double2" 6833.9287256201151 573.21437824339978 ;
	setAttr -s 11 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 370.36688232421875;
	setAttr ".tgi[1].ni[0].y" -1113.3077392578125;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" -356.53414916992188;
	setAttr ".tgi[1].ni[1].y" -1413.94384765625;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" -1274.308837890625;
	setAttr ".tgi[1].ni[2].y" -1443.5133056640625;
	setAttr ".tgi[1].ni[2].nvs" 18305;
	setAttr ".tgi[1].ni[3].x" -994.45611572265625;
	setAttr ".tgi[1].ni[3].y" -1771.93798828125;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 700.79241943359375;
	setAttr ".tgi[1].ni[4].y" -1096.0977783203125;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" -174.22187805175781;
	setAttr ".tgi[1].ni[5].y" -823.630615234375;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" -648.45257568359375;
	setAttr ".tgi[1].ni[6].y" -769.3531494140625;
	setAttr ".tgi[1].ni[6].nvs" 18305;
	setAttr ".tgi[1].ni[7].x" -1430.029541015625;
	setAttr ".tgi[1].ni[7].y" -731.39361572265625;
	setAttr ".tgi[1].ni[7].nvs" 18305;
	setAttr ".tgi[1].ni[8].x" -689.6279296875;
	setAttr ".tgi[1].ni[8].y" -1527.160400390625;
	setAttr ".tgi[1].ni[8].nvs" 18305;
	setAttr ".tgi[1].ni[9].x" 922.22100830078125;
	setAttr ".tgi[1].ni[9].y" -1096.0977783203125;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[1].ni[10].x" -1584.324951171875;
	setAttr ".tgi[1].ni[10].y" -1189.65771484375;
	setAttr ".tgi[1].ni[10].nvs" 18305;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -119.575228119191 -1891.6780964571926 ;
	setAttr ".tgi[2].vh" -type "double2" 1233.5477464143144 -226.64370129068632 ;
	setAttr -s 7 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" -114.28571319580078;
	setAttr ".tgi[2].ni[0].y" -754.28570556640625;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" 200.35871887207031;
	setAttr ".tgi[2].ni[1].y" -1096.514404296875;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 502.21951293945312;
	setAttr ".tgi[2].ni[2].y" -867.0032958984375;
	setAttr ".tgi[2].ni[2].nvs" 18305;
	setAttr ".tgi[2].ni[3].x" -421.42855834960938;
	setAttr ".tgi[2].ni[3].y" -680;
	setAttr ".tgi[2].ni[3].nvs" 18305;
	setAttr ".tgi[2].ni[4].x" 810.955078125;
	setAttr ".tgi[2].ni[4].y" -959.91522216796875;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" 198.13920593261719;
	setAttr ".tgi[2].ni[5].y" -931.89752197265625;
	setAttr ".tgi[2].ni[5].nvs" 18304;
	setAttr ".tgi[2].ni[6].x" 1140.9713134765625;
	setAttr ".tgi[2].ni[6].y" -873.50469970703125;
	setAttr ".tgi[2].ni[6].nvs" 18305;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" -198.90460465919602 -550.37458753735075 ;
	setAttr ".tgi[3].vh" -type "double2" 617.04245039657781 453.6582586058899 ;
	setAttr -s 4 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 218.57142639160156;
	setAttr ".tgi[3].ni[0].y" -25.714284896850586;
	setAttr ".tgi[3].ni[0].nvs" 18304;
	setAttr ".tgi[3].ni[1].x" -395.71429443359375;
	setAttr ".tgi[3].ni[1].y" 104.28571319580078;
	setAttr ".tgi[3].ni[1].nvs" 18304;
	setAttr ".tgi[3].ni[2].x" 218.57142639160156;
	setAttr ".tgi[3].ni[2].y" 104.28571319580078;
	setAttr ".tgi[3].ni[2].nvs" 18304;
	setAttr ".tgi[3].ni[3].x" -88.571426391601562;
	setAttr ".tgi[3].ni[3].y" 104.28571319580078;
	setAttr ".tgi[3].ni[3].nvs" 18304;
createNode makeNurbSphere -n "shoulder_makeNurbSphere";
	rename -uid "13109702-4206-B3C8-608D-7C8A4C56769F";
createNode multDoubleLinear -n "shoulder_size_multDoubleLinear";
	rename -uid "D04DDD17-41CC-9DF7-20DC-2DA52EDD7906";
createNode makeNurbSphere -n "scapulaTop_makeNurbSphere";
	rename -uid "2D20BC9E-4482-B1EE-976C-77A8F8CEE41A";
createNode multDoubleLinear -n "scapulaTop_size_multDoubleLinear";
	rename -uid "2B4D1A1E-42DA-4405-CD8D-6BAF24BD3AA1";
createNode makeNurbSphere -n "scapulaTip_makeNurbSphere";
	rename -uid "5654A6B1-4DDB-1B3A-AA48-728ECBA217EE";
createNode multDoubleLinear -n "scapulaTip_size_multDoubleLinear";
	rename -uid "0062D032-4905-AD9A-A85B-F5A902C43550";
createNode makeNurbSphere -n "pecUpperOrigin_makeNurbSphere";
	rename -uid "2B1D27A0-4B30-4B0C-A4D9-73AD9312D936";
createNode multDoubleLinear -n "pecUpperOrigin_size_multDoubleLinear";
	rename -uid "5772129F-4C09-2A1E-17BB-2DA5904647A8";
createNode makeNurbSphere -n "pecLowerOrigin_makeNurbSphere";
	rename -uid "D414E7B6-48CF-ABC5-0F95-A19B66DA5B04";
createNode multDoubleLinear -n "pecLowerOrigin_size_multDoubleLinear";
	rename -uid "2796B55E-41E6-C14F-905E-2EA24F79B915";
createNode makeNurbSphere -n "pecInsert_makeNurbSphere";
	rename -uid "4AFBB811-4F99-0919-DE49-8891DEB285BC";
createNode multDoubleLinear -n "pecInsert_size_multDoubleLinear";
	rename -uid "5E1AA743-4C14-A47F-ED81-219C60B26178";
createNode makeNurbSphere -n "latOrigin_makeNurbSphere";
	rename -uid "750D59A7-43CB-020D-650F-DD823F2A8ED7";
createNode multDoubleLinear -n "latOrigin_size_multDoubleLinear";
	rename -uid "7DE2C006-4B6A-45E1-D70C-2E93BA1F0D34";
createNode makeNurbSphere -n "latInsert_makeNurbSphere";
	rename -uid "34CC2366-49A9-66A7-D69A-08B9A2FACF5D";
createNode multDoubleLinear -n "latInsert_size_multDoubleLinear";
	rename -uid "E24DE408-4202-E82B-9152-E396F4CEDD2F";
createNode makeNurbSphere -n "trapOrigin_makeNurbSphere";
	rename -uid "DD833345-4234-4796-140E-91ADB930B661";
createNode multDoubleLinear -n "trapOrigin_size_multDoubleLinear";
	rename -uid "2E1CC363-4CDD-0B84-8ABB-97A88B33E651";
createNode makeNurbSphere -n "trapInsert_makeNurbSphere";
	rename -uid "A1A165D6-42B0-EC9F-ADB6-B280D8C96288";
createNode multDoubleLinear -n "trapInsert_size_multDoubleLinear";
	rename -uid "FE2EF5CD-49A5-0A12-5235-FE9C32D38FBE";
createNode makeNurbSphere -n "ribcage_makeNurbSphere";
	rename -uid "3B646236-4E23-6F04-F6FD-9195482EB764";
createNode multMatrix -n "humerusRest_multMatrix";
	rename -uid "5E79E869-4A42-6C91-6ED3-3D831DF8936C";
	setAttr -s 2 ".i";
createNode multMatrix -n "elbowRest_multMatrix";
	rename -uid "FD850AA2-4EC6-809D-88BD-0684F88CB72F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "humerusRest_decomposeMatrix";
	rename -uid "D82B7B3D-4651-2047-48DC-0DAD0747D40B";
createNode multMatrix -n "clav_multMatrix";
	rename -uid "2B4CE18F-45F7-B88E-7641-CFAC3D4D3366";
	setAttr -s 2 ".i";
createNode multMatrix -n "humerus_multMatrix";
	rename -uid "2D083FCB-4C72-E606-AD17-EE84EDC68674";
	setAttr -s 2 ".i";
createNode multMatrix -n "elbow_multMatrix";
	rename -uid "E17FBE2D-42F3-E5EA-2979-92976E51D214";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "elbow_decomposeMatrix";
	rename -uid "332D2C6E-4EFF-0FC6-FFAB-43A0EC1D58A7";
createNode decomposeMatrix -n "humerus_decomposeMatrix";
	rename -uid "E72F3FC2-46AE-0A21-1DFB-9A86223C303F";
createNode plusMinusAverage -n "humerusDir_plusMinusAverage";
	rename -uid "74D086F5-4BC0-43B7-9A58-F186980E456C";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "humerusDir_vectorProduct";
	rename -uid "03E27346-4B5E-4975-0314-BDAFAD2B5E57";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode decomposeMatrix -n "elbowRest_decomposeMatrix";
	rename -uid "7875BC6B-4602-91FF-67ED-D7A8712561BD";
createNode plusMinusAverage -n "humerusDirRest_plusMinusAverage";
	rename -uid "0E474661-4478-4AC8-1269-BEBF33F4E401";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "humerusDirRest_vectorProduct";
	rename -uid "C12A97F8-457E-8635-9B7D-6CAD26487FA1";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode plusMinusAverage -n "scapulaRhythm_u_plusMinusAverage";
	rename -uid "3D313106-40F6-5BE2-3169-E79A4F9B5CE7";
	setAttr ".i3[0]" -type "float3"  0 0 0;
createNode plusMinusAverage -n "scapulaRhythm_u0_plusMinusAverage";
	rename -uid "7A03261B-44CE-7EAE-F42E-31AF5015C2C8";
	setAttr ".i3[0]" -type "float3"  0 0 0;
createNode plusMinusAverage -n "scapulaRhythm_sumOC_plusMinusAverage";
	rename -uid "DFCFE900-41B8-83C0-E10E-50B178EC643F";
	setAttr -s 2 ".i3[0:1]" -type "float3"  30 0 0 -20 0 0;
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "scapulaRhythm_diffOC_plusMinusAverage";
	rename -uid "E175A489-4139-8EDD-CDC8-C9A6B5AB3BB9";
	setAttr ".op" 2;
	setAttr -s 2 ".i3[0:1]" -type "float3"  30 0 0 -20 0 0;
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "scapulaRhythm_du_plusMinusAverage";
	rename -uid "9D8AF0EA-4033-46A5-9168-9493DE155B36";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "scapulaRhythm_su_plusMinusAverage";
	rename -uid "4AF14A5E-40A7-6929-EFB8-768FE2CE3DC4";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "scapulaRhythm_curve_multiplyDivide";
	rename -uid "9CF5D5DA-4C56-BB3B-EEA3-5483605DA26F";
createNode plusMinusAverage -n "scapulaRhythm_slope_plusMinusAverage";
	rename -uid "87D6E6E1-4A12-3B7A-DCCF-89BF2D76AC2A";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "scapulaRhythm_delta_multiplyDivide";
	rename -uid "EB7A37E5-47D8-1D48-2BEB-0CBE17BD6E0F";
createNode multDoubleLinear -n "scapulaRhythm_weight_multDoubleLinear";
	rename -uid "922D5D56-48A6-EC6B-5262-F29186ADF8C8";
	setAttr ".i2" -0.5;
createNode multDoubleLinear -n "scapulaRhythm_angle_multDoubleLinear";
	rename -uid "52F7E444-4D14-1D84-641F-DF85BD393AD7";
createNode condition -n "zFlip_condition";
	rename -uid "AD10CFCA-4724-10DA-2820-9AA99051C123";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
createNode composeMatrix -n "zFlip_composeMatrix";
	rename -uid "68F85419-41D6-3A19-1E96-8F8CAB8CC5DD";
createNode inverseMatrix -n "clav_inverseMatrix";
	rename -uid "98DD71F8-43EA-EAAF-3D0A-AFB922D3AB16";
createNode multMatrix -n "ribcage_multMatrix";
	rename -uid "3969DEF4-4432-C687-5361-A99517151FE3";
	setAttr -s 2 ".i";
createNode inverseMatrix -n "ribcage_inverseMatrix";
	rename -uid "F736CE76-4382-2D9F-C39C-A49756D393FF";
createNode transposeMatrix -n "ribcageNormal_transposeMatrix";
	rename -uid "D7B855A9-4F0D-BF6C-0474-80B262511E61";
createNode pointMatrixMult -n "shoulder_poser_rest_pointMatrixMult";
	rename -uid "B46AB380-4A87-C0DF-DF11-14B7F3BEA65B";
createNode pointMatrixMult -n "acromion_pointMatrixMult";
	rename -uid "CC369135-470F-3A73-56D3-80889B4E9560";
createNode pointMatrixMult -n "scapulaTop_poser_rest_pointMatrixMult";
	rename -uid "2CA3B91F-497C-33A1-1FCB-79B0AD0F1740";
createNode plusMinusAverage -n "acromionShift_plusMinusAverage";
	rename -uid "019F8240-4BE1-9051-7B6B-5AB7E944BAF7";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "scapulaFollow_multiplyDivide";
	rename -uid "868EC860-4281-A38A-E1EB-1BA5EA2947F3";
createNode plusMinusAverage -n "scapulaTop_plusMinusAverage";
	rename -uid "E73A37E0-4362-815B-82D6-328312171952";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode pointMatrixMult -n "scapulaTop_sphere_pointMatrixMult";
	rename -uid "B647DC18-44D7-1F16-2410-4A8DB7A652CE";
createNode vectorProduct -n "scapulaTop_sphere_vectorProduct";
	rename -uid "B6B6B89A-4FCF-0826-CB21-EE80B261245C";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode distanceBetween -n "scapulaTop_gap_distanceBetween";
	rename -uid "80FF317B-4885-ED1E-15EA-B9BCB455484F";
createNode pointMatrixMult -n "scapulaTop_sphereRest_pointMatrixMult";
	rename -uid "531CEC82-41D2-87A0-3022-38974DE349E6";
createNode multiplyDivide -n "scapulaTop_surface_multiplyDivide";
	rename -uid "B2BB70A2-427B-FF18-ADBA-8E8D1D532531";
createNode pointMatrixMult -n "scapulaTop_onRibs_pointMatrixMult";
	rename -uid "8795D72C-4870-3A35-C8C6-9BA137385DB4";
createNode vectorProduct -n "scapulaTop_normal_vectorProduct";
	rename -uid "7CB6EA68-4DD8-2E92-28AF-759E131C5F72";
	setAttr ".op" 3;
	setAttr ".no" yes;
createNode aimMatrix -n "scapula_aimMatrix";
	rename -uid "21C47F94-4B2F-BD95-95DE-B2823022F457";
	setAttr ".sm" 2;
createNode composeMatrix -n "scapula_origin_composeMatrix";
	rename -uid "55F8E91B-4C31-D47C-3F36-F6AAD475328E";
createNode composeMatrix -n "scapula_target_composeMatrix";
	rename -uid "3A0F30DF-4DA9-C51B-F81B-6D9CF7B999EF";
createNode multMatrix -n "scapula_local_multMatrix";
	rename -uid "D255593A-40F4-2F7B-CFD9-BD827704B130";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "scapula_local_decomposeMatrix";
	rename -uid "3D2214C1-41D1-F7BE-6D3E-E29BDDDC3A4E";
createNode pointMatrixMult -n "scapulaTopRest_sphere_pointMatrixMult";
	rename -uid "2DD8EB84-420E-A521-687A-1BBEB890C00A";
createNode vectorProduct -n "scapulaTopRest_sphere_vectorProduct";
	rename -uid "A24A97E1-4E44-4139-AC46-6DA6E1BCE468";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode distanceBetween -n "scapulaTopRest_gap_distanceBetween";
	rename -uid "93D0E1CC-47D0-A976-8238-79ADE4BB8E8A";
createNode pointMatrixMult -n "scapulaTopRest_sphereRest_pointMatrixMult";
	rename -uid "4CDFD27E-4064-C318-A997-F9BDEECF0664";
createNode multiplyDivide -n "scapulaTopRest_surface_multiplyDivide";
	rename -uid "9097039E-4E95-7357-B1F9-548DB95A783A";
createNode pointMatrixMult -n "scapulaTopRest_onRibs_pointMatrixMult";
	rename -uid "C655C7F9-48F9-787A-E6C3-898FC5ABF16A";
createNode vectorProduct -n "scapulaTopRest_normal_vectorProduct";
	rename -uid "B33052D0-4198-0CF0-3335-139E667FA919";
	setAttr ".op" 3;
	setAttr ".no" yes;
createNode aimMatrix -n "scapulaRest_aimMatrix";
	rename -uid "229CC272-41E8-41D5-08B2-C78DEC6266F0";
	setAttr ".sm" 2;
createNode composeMatrix -n "scapulaRest_origin_composeMatrix";
	rename -uid "588116AE-4F6B-0E98-44D0-55B79EE4CB3A";
createNode composeMatrix -n "scapulaRest_target_composeMatrix";
	rename -uid "5091F922-4A65-C414-7C38-5BB026E450B2";
createNode pointMatrixMult -n "scapulaTip_poser_rest_pointMatrixMult";
	rename -uid "9FAB1BC5-4002-BCEE-08F9-1E8E37B6755F";
createNode inverseMatrix -n "scapulaRest_inverseMatrix";
	rename -uid "E1D582A3-4DC6-65FF-054F-9D9374BE1C3D";
createNode pointMatrixMult -n "scapulaTip_offset_pointMatrixMult";
	rename -uid "FE15DFE1-48CD-829F-6D1F-038B85ED25CE";
createNode composeMatrix -n "scapulaRotation_composeMatrix";
	rename -uid "B0F9F9D2-40C8-08FD-1420-A295762FC4BF";
createNode unitConversion -n "unitConversion1";
	rename -uid "B1D0E2CA-4E83-81E8-3926-24B99C87B2E1";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "scapulaTip_multMatrix";
	rename -uid "D43D1278-408E-BA9D-DA7E-6AAC0E487F1F";
	setAttr -s 2 ".i";
createNode pointMatrixMult -n "scapulaTip_pointMatrixMult";
	rename -uid "38C24773-47F4-2DD9-36F9-2E92154FDAF8";
createNode pointMatrixMult -n "scapulaTip_sphere_pointMatrixMult";
	rename -uid "0A0E1349-4779-2CE6-8B92-F39471A66A60";
createNode vectorProduct -n "scapulaTip_sphere_vectorProduct";
	rename -uid "05F4557A-4346-DA87-9D61-9587EE9DB4F0";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode distanceBetween -n "scapulaTip_gap_distanceBetween";
	rename -uid "22C71FFC-4B4B-E42F-B561-AEBD9D090E24";
createNode pointMatrixMult -n "scapulaTip_sphereRest_pointMatrixMult";
	rename -uid "94B51A03-4A53-2495-AD14-93AFACF1BA8C";
createNode multiplyDivide -n "scapulaTip_surface_multiplyDivide";
	rename -uid "E8734D3E-43A0-F166-869C-EB91056C3982";
createNode pointMatrixMult -n "scapulaTip_onRibs_pointMatrixMult";
	rename -uid "D1ECFB28-4349-4866-80E2-1886626FFA23";
createNode vectorProduct -n "scapulaTip_normal_vectorProduct";
	rename -uid "1E5261D7-40D2-FFBC-B36D-C2A256813911";
	setAttr ".op" 3;
	setAttr ".no" yes;
createNode pickMatrix -n "scapulaTip_pickMatrix";
	rename -uid "A69920A9-4833-F202-6B9B-419275CCE524";
	setAttr ".tra" no;
createNode composeMatrix -n "scapulaTip_composeMatrix";
	rename -uid "89C89008-4E63-09E0-3074-418C0753CA7E";
createNode multMatrix -n "scapulaTipFrame_multMatrix";
	rename -uid "02B9A08B-49FF-7930-9047-54AC57619BE3";
	setAttr -s 2 ".i";
createNode multMatrix -n "scapulaTip_local_multMatrix";
	rename -uid "3A57EA55-40E7-A42E-112E-8ABEECEC528B";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "scapulaTip_local_decomposeMatrix";
	rename -uid "3D5C62CD-4CF0-F3D7-E5E8-30903F7D08C4";
createNode inverseMatrix -n "humerusRest_inverseMatrix";
	rename -uid "A09849D6-4A31-0028-E808-59B35FD6BF8D";
createNode multDoubleLinear -n "muscleVolume_multDoubleLinear";
	rename -uid "ED8C5D23-4D03-DFC5-1CD9-8A907811AD7D";
	setAttr ".i2" -0.5;
createNode pointMatrixMult -n "pecUpperOrigin_poser_rest_pointMatrixMult";
	rename -uid "1E021C19-46AA-56E4-162A-5680C57F1E27";
createNode pointMatrixMult -n "pecUpperOrigin_pointMatrixMult";
	rename -uid "DC879480-4154-54B8-9340-D8A5610222BA";
createNode pointMatrixMult -n "pecInsert_poser_rest_pointMatrixMult";
	rename -uid "12025129-4965-09DA-69B7-3C9620036BAF";
createNode pointMatrixMult -n "pecUpperInsert_humerusLocal_pointMatrixMult";
	rename -uid "7E03B86F-4CCA-103C-B87B-45BC0CB54F4F";
createNode pointMatrixMult -n "pecUpperInsert_pointMatrixMult";
	rename -uid "9B113DF1-4D9E-5019-FFB1-55B74CBAC174";
createNode blendColors -n "pecUpper_belly_blendColors";
	rename -uid "03A95C79-463B-3E7A-A802-59A760BB3BC7";
createNode aimMatrix -n "pecUpper_aimMatrix";
	rename -uid "DA0CC2D9-45E0-05D1-7921-2C8C5D2FFDF5";
	setAttr ".smiv" -type "double3" 0 0 1 ;
createNode composeMatrix -n "pecUpper_origin_composeMatrix";
	rename -uid "29D4350C-4210-3946-DFAC-8EBF5E63E6F1";
createNode composeMatrix -n "pecUpper_target_composeMatrix";
	rename -uid "5BA068F7-4154-481C-97F8-4695876E6D35";
createNode multiplyDivide -n "pecUpper_stretch_multiplyDivide";
	rename -uid "5D788D5D-4322-1394-5815-C6B35357356A";
	setAttr ".op" 2;
createNode distanceBetween -n "pecUpper_distanceBetween";
	rename -uid "A083259D-47AA-55FB-545C-F7AE28B33D0D";
createNode distanceBetween -n "pecUpperRest_distanceBetween";
	rename -uid "04E845F2-473F-2A74-437C-358B79902258";
createNode multiplyDivide -n "pecUpper_volume_multiplyDivide";
	rename -uid "5D8D1A0F-49D2-08E6-3E4E-24BBAF3AD9C3";
	setAttr ".op" 3;
createNode multMatrix -n "pecUpper_local_multMatrix";
	rename -uid "FF53CDFA-4F39-4E66-EF7A-16A072BD5E55";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "pecUpper_local_decomposeMatrix";
	rename -uid "1D472A6C-4361-0456-AFA0-E49BBE021CAD";
createNode pointMatrixMult -n "pecLowerOrigin_poser_rest_pointMatrixMult";
	rename -uid "83402F37-4385-737D-ED52-ACADEB50D7D7";
createNode pointMatrixMult -n "pecLowerInsert_humerusLocal_pointMatrixMult";
	rename -uid "53F294FA-432E-CE4C-1C03-09A9064CDA4F";
createNode pointMatrixMult -n "pecLowerInsert_pointMatrixMult";
	rename -uid "58F61C13-401D-8763-0842-3C97274FB6E8";
createNode blendColors -n "pecLower_belly_blendColors";
	rename -uid "D77AA644-412E-3212-71FF-78B45DFC9446";
createNode aimMatrix -n "pecLower_aimMatrix";
	rename -uid "ED15469D-4A7A-0154-3531-8189EBF5DBA5";
	setAttr ".smiv" -type "double3" 0 0 1 ;
createNode composeMatrix -n "pecLower_origin_composeMatrix";
	rename -uid "8ACD5A3B-410A-80DE-B849-07A231C1135F";
createNode composeMatrix -n "pecLower_target_composeMatrix";
	rename -uid "BDDE6086-442B-A1CC-414C-8EBC36B8B280";
createNode multiplyDivide -n "pecLower_stretch_multiplyDivide";
	rename -uid "C4CDF349-4B5B-7B36-A241-648B0DD8AF2E";
	setAttr ".op" 2;
createNode distanceBetween -n "pecLower_distanceBetween";
	rename -uid "33DAC700-4B12-4120-97B8-0AB71D2DE7FD";
createNode distanceBetween -n "pecLowerRest_distanceBetween";
	rename -uid "0D13DD08-4EE7-014A-02EB-13BF76DBF055";
createNode multiplyDivide -n "pecLower_volume_multiplyDivide";
	rename -uid "7B5A134F-4847-E53B-8BD2-098736938FD2";
	setAttr ".op" 3;
createNode multMatrix -n "pecLower_local_multMatrix";
	rename -uid "D3666333-4B6B-26DC-C9F0-C28B08A0A9F6";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "pecLower_local_decomposeMatrix";
	rename -uid "2651543B-4A4E-6BDB-8AB4-0A8030F7115C";
createNode pointMatrixMult -n "latOrigin_poser_rest_pointMatrixMult";
	rename -uid "A6EFE6F4-418F-E54E-C62A-A9922BAB21B5";
createNode pointMatrixMult -n "latInsert_poser_rest_pointMatrixMult";
	rename -uid "85B1342D-45BD-8810-A2BA-458603B04202";
createNode pointMatrixMult -n "latInsert_humerusLocal_pointMatrixMult";
	rename -uid "A98D530E-49B1-41BD-DB0E-579B3332C8D9";
createNode pointMatrixMult -n "latInsert_pointMatrixMult";
	rename -uid "B67F6F0F-4731-E4FF-C505-4FA2AD576B0A";
createNode blendColors -n "lat_belly_blendColors";
	rename -uid "A95AD5F3-426C-EA27-576F-3BAE0CEAF15D";
createNode aimMatrix -n "lat_aimMatrix";
	rename -uid "7754569F-452B-FBFA-3E1D-6E96DADD651F";
	setAttr ".smiv" -type "double3" 0 0 -1 ;
createNode composeMatrix -n "lat_origin_composeMatrix";
	rename -uid "9E2433A8-4221-41DF-0ACC-87BB5C011E6E";
createNode composeMatrix -n "lat_target_composeMatrix";
	rename -uid "61626853-4A7A-554D-7907-6E8AF287061E";
createNode multiplyDivide -n "lat_stretch_multiplyDivide";
	rename -uid "90AD825A-4EAE-3D7C-54C9-24B55230AB07";
	setAttr ".op" 2;
createNode distanceBetween -n "lat_distanceBetween";
	rename -uid "4A79F8EC-4C54-9967-CAB4-8DAD4AC0EC29";
createNode distanceBetween -n "latRest_distanceBetween";
	rename -uid "97C19804-47EB-5C4F-0BE4-1F999A2F7C10";
createNode multiplyDivide -n "lat_volume_multiplyDivide";
	rename -uid "578A6611-4A48-A7EC-01E4-1CB83B7FA5D7";
	setAttr ".op" 3;
createNode multMatrix -n "lat_local_multMatrix";
	rename -uid "A70EA2EF-4F38-943B-4698-07B11982B835";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "lat_local_decomposeMatrix";
	rename -uid "A63B465E-41F2-D3B9-8211-58844823DE69";
createNode pointMatrixMult -n "trapOrigin_poser_rest_pointMatrixMult";
	rename -uid "0BD3CF05-48DC-DB10-AD13-AFBD64A010FE";
createNode pointMatrixMult -n "trapInsert_poser_rest_pointMatrixMult";
	rename -uid "F4C753E6-4EF5-AAC2-3C35-C6856F580C98";
createNode pointMatrixMult -n "trapInsert_pointMatrixMult";
	rename -uid "CC86C041-4C81-7361-3AB9-23AE089125C5";
createNode blendColors -n "trap_belly_blendColors";
	rename -uid "EE68E198-4447-26BB-6C7F-35BE83C2474B";
createNode aimMatrix -n "trap_aimMatrix";
	rename -uid "8E2C2962-4064-488C-E1D1-ADB08A88998F";
	setAttr ".smiv" -type "double3" 0 1 0 ;
createNode composeMatrix -n "trap_origin_composeMatrix";
	rename -uid "C407F77F-49F1-4A83-A10A-A8BD5DC137FE";
createNode composeMatrix -n "trap_target_composeMatrix";
	rename -uid "7EBBB767-44BF-5595-301D-7F918BCD63FE";
createNode multiplyDivide -n "trap_stretch_multiplyDivide";
	rename -uid "10FEA9A7-46B5-9BA9-7C30-188A9BA7493C";
	setAttr ".op" 2;
createNode distanceBetween -n "trap_distanceBetween";
	rename -uid "7EB1E5A3-4307-917D-24D9-5C9FF0F48FA0";
createNode distanceBetween -n "trapRest_distanceBetween";
	rename -uid "D7DD31C3-44B8-88F3-B0B9-40988A07AF79";
createNode multiplyDivide -n "trap_volume_multiplyDivide";
	rename -uid "EFA377A0-4770-C527-8E92-8A9AC4BC2410";
	setAttr ".op" 3;
createNode multMatrix -n "trap_local_multMatrix";
	rename -uid "4F243E6F-4B7B-C64B-1C19-6F983D3FE776";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "trap_local_decomposeMatrix";
	rename -uid "B77E0B42-4E68-94C9-73F8-6F9AE189DC1F";
createNode plusMinusAverage -n "pecUpper_fiber_plusMinusAverage";
	rename -uid "8D2D4818-4FEF-7E4A-8EE5-87BA536B9DB1";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "pecUpper_fiberRest_plusMinusAverage";
	rename -uid "5CE88574-4AE4-313E-5E8C-E9BD99183D66";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "pecUpper_fiberHold_setRange";
	rename -uid "4D39206B-4D57-9A15-6696-A69E7EB7E831";
	setAttr ".m" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "pecUpper_fiberHoldSq_multDoubleLinear";
	rename -uid "2FE6781E-4BDB-1FAE-7DF6-E88AFE8CD5BB";
createNode setRange -n "pecUpper_fiberHoldK_setRange";
	rename -uid "3969C820-411E-E9DA-2591-4CAB5CBBBC76";
	setAttr ".n" -type "float3" 3 0 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "pecUpper_fiberHoldSmooth_multDoubleLinear";
	rename -uid "DE3DA22B-4C7E-0DC4-E59D-B7956D01D46E";
createNode reverse -n "pecUpper_fiberHold_reverse";
	rename -uid "A8CCE09A-4242-7F16-0C81-069F6B4C836A";
createNode multDoubleLinear -n "pecUpper_fiberHoldK_multDoubleLinear";
	rename -uid "281C8FED-4B35-D5B6-A8DD-F3A3D83ED7C6";
createNode multiplyDivide -n "pecUpper_fiberHoldRest_multiplyDivide";
	rename -uid "0422CA77-4719-D079-9685-6DA7D6239434";
createNode plusMinusAverage -n "pecUpper_fiberTarget_plusMinusAverage";
	rename -uid "B97BF7F3-4366-9973-F91E-7C8E6E54C85A";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "pecLower_fiber_plusMinusAverage";
	rename -uid "A4AA5552-43BD-5473-6FDA-C99F7703D3EC";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "pecLower_fiberRest_plusMinusAverage";
	rename -uid "6DBD78A9-457D-E535-7D86-6EB462BCA00F";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "pecLower_fiberHold_setRange";
	rename -uid "CD83C87F-4D93-6B8F-4A7A-8BA9F720BD5C";
	setAttr ".m" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "pecLower_fiberHoldSq_multDoubleLinear";
	rename -uid "16520837-4234-A434-6BC7-3EB3C19470EC";
createNode setRange -n "pecLower_fiberHoldK_setRange";
	rename -uid "9E8108C0-4715-940C-3A49-F0BC86A85AE5";
	setAttr ".n" -type "float3" 3 0 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "pecLower_fiberHoldSmooth_multDoubleLinear";
	rename -uid "6B68C441-4C13-FB49-5070-BCB2E5912965";
createNode reverse -n "pecLower_fiberHold_reverse";
	rename -uid "9C6B6D32-477E-1E4C-816C-B6A5A8E1FF4D";
createNode multDoubleLinear -n "pecLower_fiberHoldK_multDoubleLinear";
	rename -uid "2068023E-4437-784B-234E-E0B9BB031535";
createNode multiplyDivide -n "pecLower_fiberHoldRest_multiplyDivide";
	rename -uid "ACE614C0-4003-2E1D-A8AE-44B3F825DD67";
createNode plusMinusAverage -n "pecLower_fiberTarget_plusMinusAverage";
	rename -uid "0A1F10A5-4593-9ACA-CA1B-12B5A7FDA3B4";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "lat_fiber_plusMinusAverage";
	rename -uid "2E8975D5-4CDB-8F56-32DC-96B6F58C8603";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "lat_fiberRest_plusMinusAverage";
	rename -uid "26F489D7-45C0-6086-EF7B-2BB86A146D36";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "lat_fiberHold_setRange";
	rename -uid "6B14D9A5-40D6-258E-4DCC-D0A17EEEC3D2";
	setAttr ".m" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "lat_fiberHoldSq_multDoubleLinear";
	rename -uid "95627836-458A-A9BA-FDAD-DD88B71A91E4";
createNode setRange -n "lat_fiberHoldK_setRange";
	rename -uid "51C106EB-460C-2A53-3F59-F5BFF0F18FE2";
	setAttr ".n" -type "float3" 3 0 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "lat_fiberHoldSmooth_multDoubleLinear";
	rename -uid "048EC4A5-4B34-5F11-91CE-D0BD4148B922";
createNode reverse -n "lat_fiberHold_reverse";
	rename -uid "BD108ABC-4A7C-5FAA-8B74-C18D3EF29E2F";
createNode multDoubleLinear -n "lat_fiberHoldK_multDoubleLinear";
	rename -uid "190BC5C8-425F-7829-954C-00BA2294D543";
createNode multiplyDivide -n "lat_fiberHoldRest_multiplyDivide";
	rename -uid "1BBB01B0-41EB-8C0C-FFD1-30B9DE52671C";
createNode plusMinusAverage -n "lat_fiberTarget_plusMinusAverage";
	rename -uid "5EF5B1B6-4A1C-BEAE-16BF-81B0A96D1088";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "trap_fiber_plusMinusAverage";
	rename -uid "73C95B9C-4436-1899-71E0-CBA08A8B19DE";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "trap_fiberRest_plusMinusAverage";
	rename -uid "B2DD4D6A-49A0-1C04-9C31-16BDCA74E9A8";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "trap_fiberHold_setRange";
	rename -uid "35064F1B-4E2B-B8CA-A9CE-66BB3820B61B";
	setAttr ".m" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "trap_fiberHoldSq_multDoubleLinear";
	rename -uid "31725838-4C4A-2E63-7A84-BF8995B5BE50";
createNode setRange -n "trap_fiberHoldK_setRange";
	rename -uid "E7376491-4216-7101-BAAD-55A991875500";
	setAttr ".n" -type "float3" 3 0 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode multDoubleLinear -n "trap_fiberHoldSmooth_multDoubleLinear";
	rename -uid "2785B76E-42B7-B904-DCCC-E397A23013BE";
createNode reverse -n "trap_fiberHold_reverse";
	rename -uid "4262AF12-4D4B-AA59-77FD-59A7FBDC0ADB";
createNode multDoubleLinear -n "trap_fiberHoldK_multDoubleLinear";
	rename -uid "00F54B42-403C-CF4B-F754-C9A06C1F9010";
createNode multiplyDivide -n "trap_fiberHoldRest_multiplyDivide";
	rename -uid "35AD224C-4275-C64F-BFE4-D4BBC48BA7B2";
createNode plusMinusAverage -n "trap_fiberTarget_plusMinusAverage";
	rename -uid "84552A0D-4E07-9717-D469-09BD6018C25B";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode blendColors -n "pecUpper_restFrameBelly_blendColors";
	rename -uid "4B7CCC1D-4929-0D43-95D7-C78BA5F05B95";
createNode composeMatrix -n "pecUpper_restFrameOrigin_composeMatrix";
	rename -uid "BD3A946D-4A0B-FCE3-6334-5995FE9ED586";
createNode composeMatrix -n "pecUpper_restFrameTarget_composeMatrix";
	rename -uid "D96F9316-4463-3C96-559E-8D804CD33AE2";
createNode aimMatrix -n "pecUpper_restFrame_aimMatrix";
	rename -uid "3C1B5DE5-49D2-8538-17B6-C3A74367FB13";
	setAttr ".sm" 2;
	setAttr ".smiv" -type "double3" 0 0 1 ;
createNode pickMatrix -n "pecUpper_restFrame_pickMatrix";
	rename -uid "43672877-4C73-B0A8-0BF4-3A92547B7CB5";
	setAttr ".tra" no;
createNode multMatrix -n "pecUpper_restFrame_multMatrix";
	rename -uid "1E7C6D49-4C9B-FB54-7BC6-FDBA0C57828E";
	setAttr -s 2 ".i";
createNode blendColors -n "pecLower_restFrameBelly_blendColors";
	rename -uid "48C53798-4BEB-187E-5880-4D830DD22693";
createNode composeMatrix -n "pecLower_restFrameOrigin_composeMatrix";
	rename -uid "48EFF715-4F11-CC85-68CC-DCB5BEDFE3D0";
createNode composeMatrix -n "pecLower_restFrameTarget_composeMatrix";
	rename -uid "8130D1C0-469F-291C-2089-B0965001C425";
createNode aimMatrix -n "pecLower_restFrame_aimMatrix";
	rename -uid "7C613C64-4F55-546C-9F9B-35870937127E";
	setAttr ".sm" 2;
	setAttr ".smiv" -type "double3" 0 0 1 ;
createNode pickMatrix -n "pecLower_restFrame_pickMatrix";
	rename -uid "C8720332-4242-457D-38D9-309729575AB4";
	setAttr ".tra" no;
createNode multMatrix -n "pecLower_restFrame_multMatrix";
	rename -uid "BFB24E21-459D-C234-BBD2-E0B6DEC5CE94";
	setAttr -s 2 ".i";
createNode blendColors -n "lat_restFrameBelly_blendColors";
	rename -uid "935062AD-4B98-D339-AC31-C89946364A21";
createNode composeMatrix -n "lat_restFrameOrigin_composeMatrix";
	rename -uid "CF7BBF63-4BDC-EED6-7A65-85AB82DCF32B";
createNode composeMatrix -n "lat_restFrameTarget_composeMatrix";
	rename -uid "6F71E621-4DFC-0F90-FB80-02A29490F251";
createNode aimMatrix -n "lat_restFrame_aimMatrix";
	rename -uid "DC931021-4B32-185F-61A8-59BECAFBACBB";
	setAttr ".sm" 2;
	setAttr ".smiv" -type "double3" 0 0 -1 ;
createNode pickMatrix -n "lat_restFrame_pickMatrix";
	rename -uid "B88CDE49-482A-E884-D489-AE956EFC614D";
	setAttr ".tra" no;
createNode multMatrix -n "lat_restFrame_multMatrix";
	rename -uid "1FF2AF4E-460F-4904-D0C8-57A7BB792703";
	setAttr -s 2 ".i";
createNode blendColors -n "trap_restFrameBelly_blendColors";
	rename -uid "E8F171F8-4424-C330-4163-16B76AB80A0D";
createNode composeMatrix -n "trap_restFrameOrigin_composeMatrix";
	rename -uid "B61154AA-40A9-3B0D-CBAE-2D8501357F7E";
createNode composeMatrix -n "trap_restFrameTarget_composeMatrix";
	rename -uid "5C5E0A6A-4143-8C76-370B-C5858B7CDFDA";
createNode aimMatrix -n "trap_restFrame_aimMatrix";
	rename -uid "EC739E9C-49D4-2CA0-5DAE-1F92357D9483";
	setAttr ".sm" 2;
	setAttr ".smiv" -type "double3" 0 1 0 ;
createNode pickMatrix -n "trap_restFrame_pickMatrix";
	rename -uid "0FC96919-46AD-292D-7729-05AE1DB1CDD0";
	setAttr ".tra" no;
createNode multMatrix -n "trap_restFrame_multMatrix";
	rename -uid "A8A8003C-43C4-D687-12AB-63BE501F3745";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "poseClav_decomposeMatrix";
	rename -uid "F79ECDFF-4434-6D80-CC63-F0B665763D47";
createNode multDoubleLinear -n "poseClavForward_multDoubleLinear";
	rename -uid "B64AFCEC-4985-1392-7C74-DA837AB09DCD";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion2";
	rename -uid "A51A7E35-4C76-AF72-0C53-40AB598A41DE";
	setAttr ".cf" 57.295779513082323;
createNode setRange -n "poseWeight_setRange";
	rename -uid "F9E9C2E9-49CC-2393-79B8-2189FC17C8ED";
	setAttr ".m" -type "float3" 1 1 1 ;
createNode unitConversion -n "unitConversion3";
	rename -uid "164DBE83-49B6-A883-713D-53A9A5E17927";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion4";
	rename -uid "FB5C29B0-4937-F188-DE60-F2BF04514E0F";
	setAttr ".cf" 57.295779513082323;
createNode multiplyDivide -n "poseWeightSq_multiplyDivide";
	rename -uid "0F0496C2-42AD-0A00-5A69-2FA2597D6E71";
createNode setRange -n "poseWeightK_setRange";
	rename -uid "2CF1FCEC-47F8-4E57-D04C-AE8DD72F8128";
	setAttr ".n" -type "float3" 3 3 3 ;
	setAttr ".m" -type "float3" 1 1 1 ;
	setAttr ".om" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "poseWeights_multiplyDivide";
	rename -uid "F7539981-4F3C-754E-D15D-F18774A04FE6";
createNode plusMinusAverage -n "scapula_poseTranslate_plusMinusAverage";
	rename -uid "51B34D69-44E9-94F5-0950-D8AE55F1EFBC";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "scapula_poseRotate_plusMinusAverage";
	rename -uid "2FBD8AA0-42B3-3945-492E-85B74FB4E2AF";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "scapula_forward_show_plusMinusAverage";
	rename -uid "79EED309-41B0-C25D-D51E-7F874976EF92";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "scapula_forwardTranslate_multiplyDivide";
	rename -uid "F19BBAF5-41EF-323B-A667-89A7F9FFD2E2";
createNode multiplyDivide -n "scapula_forwardRotate_multiplyDivide";
	rename -uid "455EFE5C-4AB1-9C52-D93E-4F9E1FDC3CEA";
createNode unitConversion -n "unitConversion5";
	rename -uid "4E2488B2-4999-9C99-DE3F-48A70EF5A892";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "scapula_back_show_plusMinusAverage";
	rename -uid "07CADD3A-495E-ECA2-22E9-21A98E82D94C";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "scapula_backTranslate_multiplyDivide";
	rename -uid "691E1468-47D8-2DE0-5DE0-EB9A93096D39";
createNode multiplyDivide -n "scapula_backRotate_multiplyDivide";
	rename -uid "21B43C95-4F8C-C221-C0B4-07A147C8CB8C";
createNode unitConversion -n "unitConversion6";
	rename -uid "B98F4490-4F4E-AA94-4E02-BE866CCB1BDF";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "scapula_up_show_plusMinusAverage";
	rename -uid "D4FA6D7A-4714-EA93-055D-808B1FEBBB8F";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "scapula_upTranslate_multiplyDivide";
	rename -uid "64365B4A-4879-2059-70C9-1FB2FA17349A";
createNode multiplyDivide -n "scapula_upRotate_multiplyDivide";
	rename -uid "B5CEA470-44EA-40B4-71C3-80A777504C64";
createNode unitConversion -n "unitConversion7";
	rename -uid "57FB5E4F-447E-3297-E7B2-99B3FF52173C";
	setAttr ".cf" 57.295779513082323;
createNode composeMatrix -n "scapula_pose_composeMatrix";
	rename -uid "F77D92AE-45EF-ADDB-96E3-00B0AB07F18D";
createNode unitConversion -n "unitConversion8";
	rename -uid "58575205-4AAF-0C9B-B114-3EBE1AD8A904";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "scapula_pose_multMatrix";
	rename -uid "185D6E3B-49AC-5763-426A-ABA440667F6A";
	setAttr -s 2 ".i";
createNode plusMinusAverage -n "scapulaTip_poseTranslate_plusMinusAverage";
	rename -uid "0E84417B-4730-D4EE-95EC-D7A6C08DDB79";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "scapulaTip_poseRotate_plusMinusAverage";
	rename -uid "693EF2D6-4402-829F-8215-C8AF230ADCA0";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "scapulaTip_forward_show_plusMinusAverage";
	rename -uid "FACDCE58-4B0B-DAEA-D922-70ACF70BB876";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "scapulaTip_forwardTranslate_multiplyDivide";
	rename -uid "170D004C-4362-524A-4708-D48CB5C967AC";
createNode multiplyDivide -n "scapulaTip_forwardRotate_multiplyDivide";
	rename -uid "DE54015B-4C0A-0747-826A-AF97E23D459F";
createNode unitConversion -n "unitConversion9";
	rename -uid "43F0B7BA-4326-37DE-4067-778D44B609DF";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "scapulaTip_back_show_plusMinusAverage";
	rename -uid "BF385233-419C-87CF-D764-3E9109BBC916";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "scapulaTip_backTranslate_multiplyDivide";
	rename -uid "5568E187-4283-0377-1BA7-7A97EC06151D";
createNode multiplyDivide -n "scapulaTip_backRotate_multiplyDivide";
	rename -uid "7DFBBF0D-44EC-FE23-F4BF-73A4D2C70467";
createNode unitConversion -n "unitConversion10";
	rename -uid "C998FDED-4F44-DF01-FF42-369B5588936C";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "scapulaTip_up_show_plusMinusAverage";
	rename -uid "7958E77C-4897-8979-8454-D4ABE9743A07";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "scapulaTip_upTranslate_multiplyDivide";
	rename -uid "BDDDBA3B-438D-E2AE-CA2B-078042D69078";
createNode multiplyDivide -n "scapulaTip_upRotate_multiplyDivide";
	rename -uid "41E2D7ED-4F66-99BF-36E8-9AABF7D44814";
createNode unitConversion -n "unitConversion11";
	rename -uid "76866AEB-4398-AFA5-10B0-80AD843F1F4F";
	setAttr ".cf" 57.295779513082323;
createNode composeMatrix -n "scapulaTip_pose_composeMatrix";
	rename -uid "0A31B914-4572-D651-BC2A-73A42A0B3EDF";
createNode unitConversion -n "unitConversion12";
	rename -uid "3CD3A783-47ED-21E4-AF9A-9583B06D23C0";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "scapulaTip_pose_multMatrix";
	rename -uid "BEBE3328-4F0B-775B-7EC8-F69CC13B6A0E";
	setAttr -s 2 ".i";
createNode plusMinusAverage -n "pecUpper_poseTranslate_plusMinusAverage";
	rename -uid "8312B346-4CD4-CD2E-96F3-0DB8A415E389";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "pecUpper_poseRotate_plusMinusAverage";
	rename -uid "53109AD4-4973-60B5-E7D7-98BBD48B1BFF";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "pecUpper_forward_show_plusMinusAverage";
	rename -uid "112A09C4-46EA-281B-FAE9-EBA50E359F77";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "pecUpper_forwardTranslate_multiplyDivide";
	rename -uid "501B7D1B-4E63-DA1B-53FE-E9AC45971822";
createNode multiplyDivide -n "pecUpper_forwardRotate_multiplyDivide";
	rename -uid "E8AD39CF-4D43-A52A-AC10-53B6FE14466B";
createNode unitConversion -n "unitConversion13";
	rename -uid "1A659C7E-4B24-A2DD-F7AF-0AA63E2E21A2";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "pecUpper_back_show_plusMinusAverage";
	rename -uid "27B271E2-4D52-42F3-4AE8-71983241E27D";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "pecUpper_backTranslate_multiplyDivide";
	rename -uid "26CB92F9-4BB4-1543-C55E-4B9B40806469";
createNode multiplyDivide -n "pecUpper_backRotate_multiplyDivide";
	rename -uid "D937A2DC-4871-629F-CEAB-4485719F2537";
createNode unitConversion -n "unitConversion14";
	rename -uid "855C5482-41C6-3B6D-45D7-41BE1B1E634A";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "pecUpper_up_show_plusMinusAverage";
	rename -uid "B717A15B-4664-E584-F5C9-C286F2B56E58";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "pecUpper_upTranslate_multiplyDivide";
	rename -uid "5B58F09E-4F7E-C0DC-162D-249007029B4F";
createNode multiplyDivide -n "pecUpper_upRotate_multiplyDivide";
	rename -uid "8465294E-4105-BC91-E0A7-A0AD6F1CD254";
createNode unitConversion -n "unitConversion15";
	rename -uid "66F244F1-43BC-C325-A943-298DB7DE766D";
	setAttr ".cf" 57.295779513082323;
createNode composeMatrix -n "pecUpper_pose_composeMatrix";
	rename -uid "2A443452-476A-6350-4D43-C6AB3AECEBB9";
createNode unitConversion -n "unitConversion16";
	rename -uid "254002AE-406F-B9DB-97A2-1EAA6094BDEE";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "pecUpper_pose_multMatrix";
	rename -uid "920F7FF5-4C4D-F8C0-A08D-B493248267A3";
	setAttr -s 2 ".i";
createNode plusMinusAverage -n "pecLower_poseTranslate_plusMinusAverage";
	rename -uid "242933B4-46BE-6B3E-CCE1-3D9674AA3E6C";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "pecLower_poseRotate_plusMinusAverage";
	rename -uid "67917534-468F-5D43-3BFD-EFB9FED2B843";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "pecLower_forward_show_plusMinusAverage";
	rename -uid "874FFD44-4BA4-FE08-C50E-D69DD850BB8C";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "pecLower_forwardTranslate_multiplyDivide";
	rename -uid "89FA4BF9-4784-5AE3-0C11-2AB00A61AFF6";
createNode multiplyDivide -n "pecLower_forwardRotate_multiplyDivide";
	rename -uid "9BED6373-43CF-324F-A71F-14980A9BE451";
createNode unitConversion -n "unitConversion17";
	rename -uid "94ABF205-4596-B9C3-0D81-6E9B3159D592";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "pecLower_back_show_plusMinusAverage";
	rename -uid "B85E4448-4F44-C8C1-3CF2-DAB5C19DCAD7";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "pecLower_backTranslate_multiplyDivide";
	rename -uid "6F5897E0-48EF-FAAB-EDDD-B6BF98BE377E";
createNode multiplyDivide -n "pecLower_backRotate_multiplyDivide";
	rename -uid "A46FE47B-4BA1-5988-FFE8-10B72AE69BEF";
createNode unitConversion -n "unitConversion18";
	rename -uid "2C693D4C-4930-26BD-B68C-859BA822B707";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "pecLower_up_show_plusMinusAverage";
	rename -uid "4280C187-4736-9738-F777-EBB9BA7BE450";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "pecLower_upTranslate_multiplyDivide";
	rename -uid "6CE8DED3-4AE1-81C1-2C5F-67A3BA945676";
createNode multiplyDivide -n "pecLower_upRotate_multiplyDivide";
	rename -uid "CB00D85A-40CB-EAFC-1365-358DFFC157E5";
createNode unitConversion -n "unitConversion19";
	rename -uid "C8F68806-4D12-C270-2A0F-3FB3F567878E";
	setAttr ".cf" 57.295779513082323;
createNode composeMatrix -n "pecLower_pose_composeMatrix";
	rename -uid "8B8F1A3C-4769-28E2-EAE6-F6B72057ADB5";
createNode unitConversion -n "unitConversion20";
	rename -uid "FB000DA4-499A-9FB0-883F-5DBFB934B930";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "pecLower_pose_multMatrix";
	rename -uid "D00C9E95-4B37-C990-4FEC-0191524152CA";
	setAttr -s 2 ".i";
createNode plusMinusAverage -n "lat_poseTranslate_plusMinusAverage";
	rename -uid "CD2317F9-43BE-E305-EAB8-459F0FCE4FB9";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "lat_poseRotate_plusMinusAverage";
	rename -uid "8E96CBF3-4453-D99F-A4FA-3EAE737D85BD";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "lat_forward_show_plusMinusAverage";
	rename -uid "2F388986-4FCF-FCFA-3397-85B4ED2E2D14";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "lat_forwardTranslate_multiplyDivide";
	rename -uid "8DF025A1-4750-E7BE-599E-9187B0D1EB41";
createNode multiplyDivide -n "lat_forwardRotate_multiplyDivide";
	rename -uid "BE2C95BA-4138-6C5A-164B-53B67D9FD1F3";
createNode unitConversion -n "unitConversion21";
	rename -uid "902BFFB6-4E08-4846-25A4-AB85CCAA35D3";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "lat_back_show_plusMinusAverage";
	rename -uid "9E64FB98-4531-0F8E-58A0-FD844C6362C2";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "lat_backTranslate_multiplyDivide";
	rename -uid "4351E098-48B8-9D70-CB2B-8BAFAB856E20";
createNode multiplyDivide -n "lat_backRotate_multiplyDivide";
	rename -uid "DE53E759-4B93-236D-46D0-A99482CCE51C";
createNode unitConversion -n "unitConversion22";
	rename -uid "5AE9C67F-4571-A28C-E427-28892A59F1CD";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "lat_up_show_plusMinusAverage";
	rename -uid "73DC9CF7-4E37-1EA3-1D0B-E1AC1BCB8E32";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "lat_upTranslate_multiplyDivide";
	rename -uid "76410539-4667-E86D-B22A-24988DC8D1D8";
createNode multiplyDivide -n "lat_upRotate_multiplyDivide";
	rename -uid "B0B8DA84-4E5B-5CC7-DE31-78BDFF4B12C5";
createNode unitConversion -n "unitConversion23";
	rename -uid "BC734009-4CB7-A30C-8CC6-12B7201CC84D";
	setAttr ".cf" 57.295779513082323;
createNode composeMatrix -n "lat_pose_composeMatrix";
	rename -uid "061EC45A-4B55-82F1-D4FC-7ABB9F4FB0D8";
createNode unitConversion -n "unitConversion24";
	rename -uid "511D0545-4AA0-2AF4-8816-06AEF347EED0";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "lat_pose_multMatrix";
	rename -uid "516A924C-4936-60D4-082E-F8B22AB1BCF4";
	setAttr -s 2 ".i";
createNode plusMinusAverage -n "trap_poseTranslate_plusMinusAverage";
	rename -uid "ACB6B47A-4718-8D6D-3D2A-5FAD4F45333A";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "trap_poseRotate_plusMinusAverage";
	rename -uid "288F138B-4C54-E104-2DBC-F28F58D3E10C";
	setAttr -s 3 ".i3";
	setAttr -s 3 ".i3";
createNode plusMinusAverage -n "trap_forward_show_plusMinusAverage";
	rename -uid "85CADDF4-4E0B-2282-6907-F08775AD5565";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "trap_forwardTranslate_multiplyDivide";
	rename -uid "FC64829C-4AAB-A3C0-F6BF-69970D99FDB0";
createNode multiplyDivide -n "trap_forwardRotate_multiplyDivide";
	rename -uid "030C12C7-4198-3233-65F0-69BA5740E883";
createNode unitConversion -n "unitConversion25";
	rename -uid "002CB655-42D5-CBDF-89EB-2192B576BD23";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "trap_back_show_plusMinusAverage";
	rename -uid "BCD60488-4701-77ED-701D-C59137175654";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "trap_backTranslate_multiplyDivide";
	rename -uid "FA04DF74-42E4-0861-6969-CD8E9E1FED47";
createNode multiplyDivide -n "trap_backRotate_multiplyDivide";
	rename -uid "4ED8B945-4027-795B-526C-EC8AACF88F55";
createNode unitConversion -n "unitConversion26";
	rename -uid "C265A282-4747-9D3D-ADE4-16B5668EC6F0";
	setAttr ".cf" 57.295779513082323;
createNode plusMinusAverage -n "trap_up_show_plusMinusAverage";
	rename -uid "15DDD97D-4084-0342-2D7C-24AA14BA8318";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "trap_upTranslate_multiplyDivide";
	rename -uid "6FDC1EF2-4FF0-2E67-0A4A-58AE24037198";
createNode multiplyDivide -n "trap_upRotate_multiplyDivide";
	rename -uid "571E03C2-4129-0A88-DCAB-3281E9EDC6E6";
createNode unitConversion -n "unitConversion27";
	rename -uid "B3C053C3-48A1-B4CF-6557-2DB001CF58A6";
	setAttr ".cf" 57.295779513082323;
createNode composeMatrix -n "trap_pose_composeMatrix";
	rename -uid "1C950C1F-464F-794E-5D69-0F9ADCFAA16A";
createNode unitConversion -n "unitConversion28";
	rename -uid "F4F6AD30-43A0-8567-CC96-B288A0F6E4C5";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "trap_pose_multMatrix";
	rename -uid "CB9FCE00-4FC4-2B40-FD29-AF80DE90DF03";
	setAttr -s 2 ".i";
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
	setAttr -k on ".laa" yes;
	setAttr -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
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
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
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
connectAttr "root_poser.sx" "root_poser.sy" -l on;
connectAttr "root_poser.sx" "root_poser.sz" -l on;
connectAttr "makeNurbSphere1.os" "root_poserShape.cr";
connectAttr "shoulder_makeNurbSphere.os" "shoulder_poserShape.cr";
connectAttr "scapulaTop_makeNurbSphere.os" "scapulaTop_poserShape.cr";
connectAttr "scapulaTip_makeNurbSphere.os" "scapulaTip_poserShape.cr";
connectAttr "pecUpperOrigin_makeNurbSphere.os" "pecUpperOrigin_poserShape.cr";
connectAttr "pecLowerOrigin_makeNurbSphere.os" "pecLowerOrigin_poserShape.cr";
connectAttr "pecInsert_makeNurbSphere.os" "pecInsert_poserShape.cr";
connectAttr "latOrigin_makeNurbSphere.os" "latOrigin_poserShape.cr";
connectAttr "latInsert_makeNurbSphere.os" "latInsert_poserShape.cr";
connectAttr "trapOrigin_makeNurbSphere.os" "trapOrigin_poserShape.cr";
connectAttr "trapInsert_makeNurbSphere.os" "trapInsert_poserShape.cr";
connectAttr "ribcage_makeNurbSphere.os" "ribcage_poserShape.cr";
connectAttr "scapulaTop_poser.t" "scapula_guideShape.cp[0]";
connectAttr "shoulder_poser.t" "scapula_guideShape.cp[1]";
connectAttr "scapulaTip_poser.t" "scapula_guideShape.cp[2]";
connectAttr "scapulaTop_poser.t" "scapula_guideShape.cp[3]";
connectAttr "root_poser.t" "clavicle_guideShape.cp[0]";
connectAttr "shoulder_poser.t" "clavicle_guideShape.cp[1]";
connectAttr "pecUpperOrigin_poser.t" "pecUpper_guideShape.cp[0]";
connectAttr "pecInsert_poser.t" "pecUpper_guideShape.cp[1]";
connectAttr "pecLowerOrigin_poser.t" "pecLower_guideShape.cp[0]";
connectAttr "pecInsert_poser.t" "pecLower_guideShape.cp[1]";
connectAttr "latOrigin_poser.t" "lat_guideShape.cp[0]";
connectAttr "latInsert_poser.t" "lat_guideShape.cp[1]";
connectAttr "trapOrigin_poser.t" "trap_guideShape.cp[0]";
connectAttr "trapInsert_poser.t" "trap_guideShape.cp[1]";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sz";
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "scapula_aimMatrix.tmat" "scapula_poseSpace.opm";
connectAttr "scapula_forward_show_plusMinusAverage.o1" "scapula_forward_poseLoc.v"
		;
connectAttr "scapula_back_show_plusMinusAverage.o1" "scapula_back_poseLoc.v";
connectAttr "scapula_up_show_plusMinusAverage.o1" "scapula_up_poseLoc.v";
connectAttr "scapulaTipFrame_multMatrix.o" "scapulaTip_poseSpace.opm";
connectAttr "scapulaTip_forward_show_plusMinusAverage.o1" "scapulaTip_forward_poseLoc.v"
		;
connectAttr "scapulaTip_back_show_plusMinusAverage.o1" "scapulaTip_back_poseLoc.v"
		;
connectAttr "scapulaTip_up_show_plusMinusAverage.o1" "scapulaTip_up_poseLoc.v";
connectAttr "pecUpper_aimMatrix.tmat" "pecUpper_poseSpace.opm";
connectAttr "pecUpper_forward_show_plusMinusAverage.o1" "pecUpper_forward_poseLoc.v"
		;
connectAttr "pecUpper_back_show_plusMinusAverage.o1" "pecUpper_back_poseLoc.v";
connectAttr "pecUpper_up_show_plusMinusAverage.o1" "pecUpper_up_poseLoc.v";
connectAttr "pecLower_aimMatrix.tmat" "pecLower_poseSpace.opm";
connectAttr "pecLower_forward_show_plusMinusAverage.o1" "pecLower_forward_poseLoc.v"
		;
connectAttr "pecLower_back_show_plusMinusAverage.o1" "pecLower_back_poseLoc.v";
connectAttr "pecLower_up_show_plusMinusAverage.o1" "pecLower_up_poseLoc.v";
connectAttr "lat_aimMatrix.tmat" "lat_poseSpace.opm";
connectAttr "lat_forward_show_plusMinusAverage.o1" "lat_forward_poseLoc.v";
connectAttr "lat_back_show_plusMinusAverage.o1" "lat_back_poseLoc.v";
connectAttr "lat_up_show_plusMinusAverage.o1" "lat_up_poseLoc.v";
connectAttr "trap_aimMatrix.tmat" "trap_poseSpace.opm";
connectAttr "trap_forward_show_plusMinusAverage.o1" "trap_forward_poseLoc.v";
connectAttr "trap_back_show_plusMinusAverage.o1" "trap_back_poseLoc.v";
connectAttr "trap_up_show_plusMinusAverage.o1" "trap_up_poseLoc.v";
connectAttr "root_ctrJoint_decomposeMatrix.osx" "outJoints.sx";
connectAttr "root_ctrJoint_decomposeMatrix.osy" "outJoints.sy";
connectAttr "mirror_condition_2.ocr" "outJoints.sz";
connectAttr "root_decomposeMatrix.or" "root_outJoint.r";
connectAttr "root_decomposeMatrix.ot" "root_outJoint.t";
connectAttr "scapula_local_decomposeMatrix.ot" "scapula_outJoint.t";
connectAttr "scapula_local_decomposeMatrix.or" "scapula_outJoint.r";
connectAttr "scapulaTip_local_decomposeMatrix.ot" "scapulaTip_outJoint.t";
connectAttr "scapulaTip_local_decomposeMatrix.or" "scapulaTip_outJoint.r";
connectAttr "pecUpper_local_decomposeMatrix.ot" "pecUpper_outJoint.t";
connectAttr "pecUpper_local_decomposeMatrix.or" "pecUpper_outJoint.r";
connectAttr "pecUpper_stretch_multiplyDivide.ox" "pecUpper_outJoint.sx";
connectAttr "pecUpper_volume_multiplyDivide.ox" "pecUpper_outJoint.sy";
connectAttr "pecUpper_volume_multiplyDivide.ox" "pecUpper_outJoint.sz";
connectAttr "pecLower_local_decomposeMatrix.ot" "pecLower_outJoint.t";
connectAttr "pecLower_local_decomposeMatrix.or" "pecLower_outJoint.r";
connectAttr "pecLower_stretch_multiplyDivide.ox" "pecLower_outJoint.sx";
connectAttr "pecLower_volume_multiplyDivide.ox" "pecLower_outJoint.sy";
connectAttr "pecLower_volume_multiplyDivide.ox" "pecLower_outJoint.sz";
connectAttr "lat_local_decomposeMatrix.ot" "lat_outJoint.t";
connectAttr "lat_local_decomposeMatrix.or" "lat_outJoint.r";
connectAttr "lat_stretch_multiplyDivide.ox" "lat_outJoint.sx";
connectAttr "lat_volume_multiplyDivide.ox" "lat_outJoint.sy";
connectAttr "lat_volume_multiplyDivide.ox" "lat_outJoint.sz";
connectAttr "trap_local_decomposeMatrix.ot" "trap_outJoint.t";
connectAttr "trap_local_decomposeMatrix.or" "trap_outJoint.r";
connectAttr "trap_stretch_multiplyDivide.ox" "trap_outJoint.sx";
connectAttr "trap_volume_multiplyDivide.ox" "trap_outJoint.sy";
connectAttr "trap_volume_multiplyDivide.ox" "trap_outJoint.sz";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "root.iog" "moduleControlSet.dsm" -na;
connectAttr "root_multMatrix.o" "root_decomposeMatrix.imat";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "root.wm" "root_multMatrix.i[1]";
connectAttr "outJoints.wim" "root_multMatrix.i[2]";
connectAttr "root.wm" "root_ctrJoint_decomposeMatrix.imat";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "negate.i1";
connectAttr "root_poser.size" "size_multiplyDivide.i1x";
connectAttr "mainPoser.size" "size_multiplyDivide.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "size_multiplyDivide.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "mod.mirror" "mirror_condition_2.ft";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "mirror_condition_2.cfr";
connectAttr "negate.o" "mirror_condition_2.ctr";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "scapula_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "scapulaTip_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "pecUpper_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "pecLower_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "lat_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "trap_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "negate.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "root.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "root_ctrJoint_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "root_ctrJoint_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "negate.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "mirror_condition_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn";
connectAttr "root.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn";
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn";
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "root.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn";
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn";
connectAttr "root_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn"
		;
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn";
connectAttr "root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn"
		;
connectAttr "shoulder_size_multDoubleLinear.o" "shoulder_makeNurbSphere.r";
connectAttr "shoulder_poser.size" "shoulder_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "shoulder_size_multDoubleLinear.i2";
connectAttr "scapulaTop_size_multDoubleLinear.o" "scapulaTop_makeNurbSphere.r";
connectAttr "scapulaTop_poser.size" "scapulaTop_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "scapulaTop_size_multDoubleLinear.i2";
connectAttr "scapulaTip_size_multDoubleLinear.o" "scapulaTip_makeNurbSphere.r";
connectAttr "scapulaTip_poser.size" "scapulaTip_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "scapulaTip_size_multDoubleLinear.i2";
connectAttr "pecUpperOrigin_size_multDoubleLinear.o" "pecUpperOrigin_makeNurbSphere.r"
		;
connectAttr "pecUpperOrigin_poser.size" "pecUpperOrigin_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "pecUpperOrigin_size_multDoubleLinear.i2";
connectAttr "pecLowerOrigin_size_multDoubleLinear.o" "pecLowerOrigin_makeNurbSphere.r"
		;
connectAttr "pecLowerOrigin_poser.size" "pecLowerOrigin_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "pecLowerOrigin_size_multDoubleLinear.i2";
connectAttr "pecInsert_size_multDoubleLinear.o" "pecInsert_makeNurbSphere.r";
connectAttr "pecInsert_poser.size" "pecInsert_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "pecInsert_size_multDoubleLinear.i2";
connectAttr "latOrigin_size_multDoubleLinear.o" "latOrigin_makeNurbSphere.r";
connectAttr "latOrigin_poser.size" "latOrigin_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "latOrigin_size_multDoubleLinear.i2";
connectAttr "latInsert_size_multDoubleLinear.o" "latInsert_makeNurbSphere.r";
connectAttr "latInsert_poser.size" "latInsert_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "latInsert_size_multDoubleLinear.i2";
connectAttr "trapOrigin_size_multDoubleLinear.o" "trapOrigin_makeNurbSphere.r";
connectAttr "trapOrigin_poser.size" "trapOrigin_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "trapOrigin_size_multDoubleLinear.i2";
connectAttr "trapInsert_size_multDoubleLinear.o" "trapInsert_makeNurbSphere.r";
connectAttr "trapInsert_poser.size" "trapInsert_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "trapInsert_size_multDoubleLinear.i2";
connectAttr "shoulder_poser.wm" "humerusRest_multMatrix.i[0]";
connectAttr "root_poser.wim" "humerusRest_multMatrix.i[1]";
connectAttr "elbowRest_loc.wm" "elbowRest_multMatrix.i[0]";
connectAttr "root_poser.wim" "elbowRest_multMatrix.i[1]";
connectAttr "humerusRest_multMatrix.o" "humerusRest_decomposeMatrix.imat";
connectAttr "root.wm" "clav_multMatrix.i[0]";
connectAttr "controls.wim" "clav_multMatrix.i[1]";
connectAttr "humerusRest_multMatrix.o" "humerus_multMatrix.i[0]";
connectAttr "clav_multMatrix.o" "humerus_multMatrix.i[1]";
connectAttr "elbowRest_multMatrix.o" "elbow_multMatrix.i[0]";
connectAttr "clav_multMatrix.o" "elbow_multMatrix.i[1]";
connectAttr "elbow_multMatrix.o" "elbow_decomposeMatrix.imat";
connectAttr "humerus_multMatrix.o" "humerus_decomposeMatrix.imat";
connectAttr "elbow_decomposeMatrix.ot" "humerusDir_plusMinusAverage.i3[0]";
connectAttr "humerus_decomposeMatrix.ot" "humerusDir_plusMinusAverage.i3[1]";
connectAttr "humerusDir_plusMinusAverage.o3" "humerusDir_vectorProduct.i1";
connectAttr "elbowRest_multMatrix.o" "elbowRest_decomposeMatrix.imat";
connectAttr "elbowRest_decomposeMatrix.ot" "humerusDirRest_plusMinusAverage.i3[0]"
		;
connectAttr "humerusRest_decomposeMatrix.ot" "humerusDirRest_plusMinusAverage.i3[1]"
		;
connectAttr "humerusDirRest_plusMinusAverage.o3" "humerusDirRest_vectorProduct.i1"
		;
connectAttr "humerusDir_vectorProduct.oy" "scapulaRhythm_u_plusMinusAverage.i3[0].i3x"
		;
connectAttr "humerusDirRest_vectorProduct.oy" "scapulaRhythm_u0_plusMinusAverage.i3[0].i3x"
		;
connectAttr "mainPoser.scapulaUp" "scapulaRhythm_sumOC_plusMinusAverage.i3[0].i3x"
		;
connectAttr "mainPoser.scapulaDown" "scapulaRhythm_sumOC_plusMinusAverage.i3[1].i3x"
		;
connectAttr "mainPoser.scapulaUp" "scapulaRhythm_diffOC_plusMinusAverage.i3[0].i3x"
		;
connectAttr "mainPoser.scapulaDown" "scapulaRhythm_diffOC_plusMinusAverage.i3[1].i3x"
		;
connectAttr "scapulaRhythm_u_plusMinusAverage.o3" "scapulaRhythm_du_plusMinusAverage.i3[0]"
		;
connectAttr "scapulaRhythm_u0_plusMinusAverage.o3" "scapulaRhythm_du_plusMinusAverage.i3[1]"
		;
connectAttr "scapulaRhythm_u_plusMinusAverage.o3" "scapulaRhythm_su_plusMinusAverage.i3[0]"
		;
connectAttr "scapulaRhythm_u0_plusMinusAverage.o3" "scapulaRhythm_su_plusMinusAverage.i3[1]"
		;
connectAttr "scapulaRhythm_sumOC_plusMinusAverage.o3" "scapulaRhythm_curve_multiplyDivide.i1"
		;
connectAttr "scapulaRhythm_su_plusMinusAverage.o3" "scapulaRhythm_curve_multiplyDivide.i2"
		;
connectAttr "scapulaRhythm_diffOC_plusMinusAverage.o3" "scapulaRhythm_slope_plusMinusAverage.i3[0]"
		;
connectAttr "scapulaRhythm_curve_multiplyDivide.o" "scapulaRhythm_slope_plusMinusAverage.i3[1]"
		;
connectAttr "scapulaRhythm_du_plusMinusAverage.o3" "scapulaRhythm_delta_multiplyDivide.i1"
		;
connectAttr "scapulaRhythm_slope_plusMinusAverage.o3" "scapulaRhythm_delta_multiplyDivide.i2"
		;
connectAttr "mod.armConnected" "scapulaRhythm_weight_multDoubleLinear.i1";
connectAttr "scapulaRhythm_delta_multiplyDivide.ox" "scapulaRhythm_angle_multDoubleLinear.i1"
		;
connectAttr "scapulaRhythm_weight_multDoubleLinear.o" "scapulaRhythm_angle_multDoubleLinear.i2"
		;
connectAttr "mod.mirror" "zFlip_condition.ft";
connectAttr "zFlip_condition.ocr" "zFlip_composeMatrix.isz";
connectAttr "clav_multMatrix.o" "clav_inverseMatrix.imat";
connectAttr "ribcage_poser.m" "ribcage_multMatrix.i[0]";
connectAttr "root_poser.im" "ribcage_multMatrix.i[1]";
connectAttr "ribcage_multMatrix.o" "ribcage_inverseMatrix.imat";
connectAttr "ribcage_inverseMatrix.omat" "ribcageNormal_transposeMatrix.imat";
connectAttr "shoulder_poser.t" "shoulder_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "shoulder_poser_rest_pointMatrixMult.im";
connectAttr "shoulder_poser_rest_pointMatrixMult.o" "acromion_pointMatrixMult.ip"
		;
connectAttr "clav_multMatrix.o" "acromion_pointMatrixMult.im";
connectAttr "scapulaTop_poser.t" "scapulaTop_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "scapulaTop_poser_rest_pointMatrixMult.im";
connectAttr "acromion_pointMatrixMult.o" "acromionShift_plusMinusAverage.i3[0]";
connectAttr "shoulder_poser_rest_pointMatrixMult.o" "acromionShift_plusMinusAverage.i3[1]"
		;
connectAttr "acromionShift_plusMinusAverage.o3" "scapulaFollow_multiplyDivide.i1"
		;
connectAttr "mainPoser.scapulaFollow" "scapulaFollow_multiplyDivide.i2x";
connectAttr "mainPoser.scapulaFollow" "scapulaFollow_multiplyDivide.i2y";
connectAttr "mainPoser.scapulaFollow" "scapulaFollow_multiplyDivide.i2z";
connectAttr "scapulaTop_poser_rest_pointMatrixMult.o" "scapulaTop_plusMinusAverage.i3[0]"
		;
connectAttr "scapulaFollow_multiplyDivide.o" "scapulaTop_plusMinusAverage.i3[1]"
		;
connectAttr "scapulaTop_plusMinusAverage.o3" "scapulaTop_sphere_pointMatrixMult.ip"
		;
connectAttr "ribcage_inverseMatrix.omat" "scapulaTop_sphere_pointMatrixMult.im";
connectAttr "scapulaTop_sphere_pointMatrixMult.o" "scapulaTop_sphere_vectorProduct.i1"
		;
connectAttr "scapulaTop_sphereRest_pointMatrixMult.o" "scapulaTop_gap_distanceBetween.p1"
		;
connectAttr "scapulaTop_poser_rest_pointMatrixMult.o" "scapulaTop_sphereRest_pointMatrixMult.ip"
		;
connectAttr "ribcage_inverseMatrix.omat" "scapulaTop_sphereRest_pointMatrixMult.im"
		;
connectAttr "scapulaTop_sphere_vectorProduct.o" "scapulaTop_surface_multiplyDivide.i1"
		;
connectAttr "scapulaTop_gap_distanceBetween.d" "scapulaTop_surface_multiplyDivide.i2x"
		;
connectAttr "scapulaTop_gap_distanceBetween.d" "scapulaTop_surface_multiplyDivide.i2y"
		;
connectAttr "scapulaTop_gap_distanceBetween.d" "scapulaTop_surface_multiplyDivide.i2z"
		;
connectAttr "scapulaTop_surface_multiplyDivide.o" "scapulaTop_onRibs_pointMatrixMult.ip"
		;
connectAttr "ribcage_multMatrix.o" "scapulaTop_onRibs_pointMatrixMult.im";
connectAttr "scapulaTop_sphere_vectorProduct.o" "scapulaTop_normal_vectorProduct.i1"
		;
connectAttr "ribcageNormal_transposeMatrix.omat" "scapulaTop_normal_vectorProduct.m"
		;
connectAttr "scapula_origin_composeMatrix.omat" "scapula_aimMatrix.imat";
connectAttr "scapula_target_composeMatrix.omat" "scapula_aimMatrix.pmat";
connectAttr "scapulaTop_normal_vectorProduct.o" "scapula_aimMatrix.smiv";
connectAttr "scapulaTop_onRibs_pointMatrixMult.o" "scapula_origin_composeMatrix.it"
		;
connectAttr "acromion_pointMatrixMult.o" "scapula_target_composeMatrix.it";
connectAttr "zFlip_composeMatrix.omat" "scapula_local_multMatrix.i[0]";
connectAttr "scapula_pose_multMatrix.o" "scapula_local_multMatrix.i[1]";
connectAttr "clav_inverseMatrix.omat" "scapula_local_multMatrix.i[2]";
connectAttr "zFlip_composeMatrix.omat" "scapula_local_multMatrix.i[3]";
connectAttr "scapula_local_multMatrix.o" "scapula_local_decomposeMatrix.imat";
connectAttr "scapulaTop_poser_rest_pointMatrixMult.o" "scapulaTopRest_sphere_pointMatrixMult.ip"
		;
connectAttr "ribcage_inverseMatrix.omat" "scapulaTopRest_sphere_pointMatrixMult.im"
		;
connectAttr "scapulaTopRest_sphere_pointMatrixMult.o" "scapulaTopRest_sphere_vectorProduct.i1"
		;
connectAttr "scapulaTopRest_sphereRest_pointMatrixMult.o" "scapulaTopRest_gap_distanceBetween.p1"
		;
connectAttr "scapulaTop_poser_rest_pointMatrixMult.o" "scapulaTopRest_sphereRest_pointMatrixMult.ip"
		;
connectAttr "ribcage_inverseMatrix.omat" "scapulaTopRest_sphereRest_pointMatrixMult.im"
		;
connectAttr "scapulaTopRest_sphere_vectorProduct.o" "scapulaTopRest_surface_multiplyDivide.i1"
		;
connectAttr "scapulaTopRest_gap_distanceBetween.d" "scapulaTopRest_surface_multiplyDivide.i2x"
		;
connectAttr "scapulaTopRest_gap_distanceBetween.d" "scapulaTopRest_surface_multiplyDivide.i2y"
		;
connectAttr "scapulaTopRest_gap_distanceBetween.d" "scapulaTopRest_surface_multiplyDivide.i2z"
		;
connectAttr "scapulaTopRest_surface_multiplyDivide.o" "scapulaTopRest_onRibs_pointMatrixMult.ip"
		;
connectAttr "ribcage_multMatrix.o" "scapulaTopRest_onRibs_pointMatrixMult.im";
connectAttr "scapulaTopRest_sphere_vectorProduct.o" "scapulaTopRest_normal_vectorProduct.i1"
		;
connectAttr "ribcageNormal_transposeMatrix.omat" "scapulaTopRest_normal_vectorProduct.m"
		;
connectAttr "scapulaRest_origin_composeMatrix.omat" "scapulaRest_aimMatrix.imat"
		;
connectAttr "scapulaRest_target_composeMatrix.omat" "scapulaRest_aimMatrix.pmat"
		;
connectAttr "scapulaTopRest_normal_vectorProduct.o" "scapulaRest_aimMatrix.smiv"
		;
connectAttr "scapulaTop_poser_rest_pointMatrixMult.o" "scapulaRest_origin_composeMatrix.it"
		;
connectAttr "shoulder_poser_rest_pointMatrixMult.o" "scapulaRest_target_composeMatrix.it"
		;
connectAttr "scapulaTip_poser.t" "scapulaTip_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "scapulaTip_poser_rest_pointMatrixMult.im";
connectAttr "scapulaRest_aimMatrix.tmat" "scapulaRest_inverseMatrix.imat";
connectAttr "scapulaTip_poser_rest_pointMatrixMult.o" "scapulaTip_offset_pointMatrixMult.ip"
		;
connectAttr "scapulaRest_inverseMatrix.omat" "scapulaTip_offset_pointMatrixMult.im"
		;
connectAttr "unitConversion1.o" "scapulaRotation_composeMatrix.iry";
connectAttr "scapulaRhythm_angle_multDoubleLinear.o" "unitConversion1.i";
connectAttr "scapulaRotation_composeMatrix.omat" "scapulaTip_multMatrix.i[0]";
connectAttr "scapula_aimMatrix.tmat" "scapulaTip_multMatrix.i[1]";
connectAttr "scapulaTip_offset_pointMatrixMult.o" "scapulaTip_pointMatrixMult.ip"
		;
connectAttr "scapulaTip_multMatrix.o" "scapulaTip_pointMatrixMult.im";
connectAttr "scapulaTip_pointMatrixMult.o" "scapulaTip_sphere_pointMatrixMult.ip"
		;
connectAttr "ribcage_inverseMatrix.omat" "scapulaTip_sphere_pointMatrixMult.im";
connectAttr "scapulaTip_sphere_pointMatrixMult.o" "scapulaTip_sphere_vectorProduct.i1"
		;
connectAttr "scapulaTip_sphereRest_pointMatrixMult.o" "scapulaTip_gap_distanceBetween.p1"
		;
connectAttr "scapulaTip_poser_rest_pointMatrixMult.o" "scapulaTip_sphereRest_pointMatrixMult.ip"
		;
connectAttr "ribcage_inverseMatrix.omat" "scapulaTip_sphereRest_pointMatrixMult.im"
		;
connectAttr "scapulaTip_sphere_vectorProduct.o" "scapulaTip_surface_multiplyDivide.i1"
		;
connectAttr "scapulaTip_gap_distanceBetween.d" "scapulaTip_surface_multiplyDivide.i2x"
		;
connectAttr "scapulaTip_gap_distanceBetween.d" "scapulaTip_surface_multiplyDivide.i2y"
		;
connectAttr "scapulaTip_gap_distanceBetween.d" "scapulaTip_surface_multiplyDivide.i2z"
		;
connectAttr "scapulaTip_surface_multiplyDivide.o" "scapulaTip_onRibs_pointMatrixMult.ip"
		;
connectAttr "ribcage_multMatrix.o" "scapulaTip_onRibs_pointMatrixMult.im";
connectAttr "scapulaTip_sphere_vectorProduct.o" "scapulaTip_normal_vectorProduct.i1"
		;
connectAttr "ribcageNormal_transposeMatrix.omat" "scapulaTip_normal_vectorProduct.m"
		;
connectAttr "scapulaTip_multMatrix.o" "scapulaTip_pickMatrix.imat";
connectAttr "scapulaTip_onRibs_pointMatrixMult.o" "scapulaTip_composeMatrix.it";
connectAttr "scapulaTip_pickMatrix.tmat" "scapulaTipFrame_multMatrix.i[0]";
connectAttr "scapulaTip_composeMatrix.omat" "scapulaTipFrame_multMatrix.i[1]";
connectAttr "zFlip_composeMatrix.omat" "scapulaTip_local_multMatrix.i[0]";
connectAttr "scapulaTip_pose_multMatrix.o" "scapulaTip_local_multMatrix.i[1]";
connectAttr "clav_inverseMatrix.omat" "scapulaTip_local_multMatrix.i[2]";
connectAttr "zFlip_composeMatrix.omat" "scapulaTip_local_multMatrix.i[3]";
connectAttr "scapulaTip_local_multMatrix.o" "scapulaTip_local_decomposeMatrix.imat"
		;
connectAttr "humerusRest_multMatrix.o" "humerusRest_inverseMatrix.imat";
connectAttr "mainPoser.muscleVolume" "muscleVolume_multDoubleLinear.i1";
connectAttr "pecUpperOrigin_poser.t" "pecUpperOrigin_poser_rest_pointMatrixMult.ip"
		;
connectAttr "root_poser.im" "pecUpperOrigin_poser_rest_pointMatrixMult.im";
connectAttr "pecUpperOrigin_poser_rest_pointMatrixMult.o" "pecUpperOrigin_pointMatrixMult.ip"
		;
connectAttr "clav_multMatrix.o" "pecUpperOrigin_pointMatrixMult.im";
connectAttr "pecInsert_poser.t" "pecInsert_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "pecInsert_poser_rest_pointMatrixMult.im";
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecUpperInsert_humerusLocal_pointMatrixMult.ip"
		;
connectAttr "humerusRest_inverseMatrix.omat" "pecUpperInsert_humerusLocal_pointMatrixMult.im"
		;
connectAttr "pecUpperInsert_humerusLocal_pointMatrixMult.o" "pecUpperInsert_pointMatrixMult.ip"
		;
connectAttr "humerus_multMatrix.o" "pecUpperInsert_pointMatrixMult.im";
connectAttr "pecUpperInsert_pointMatrixMult.o" "pecUpper_belly_blendColors.c1";
connectAttr "pecUpperOrigin_pointMatrixMult.o" "pecUpper_belly_blendColors.c2";
connectAttr "mainPoser.pecUpperBelly" "pecUpper_belly_blendColors.b";
connectAttr "pecUpper_restFrame_multMatrix.o" "pecUpper_aimMatrix.imat";
connectAttr "pecUpper_target_composeMatrix.omat" "pecUpper_aimMatrix.pmat";
connectAttr "pecUpper_belly_blendColors.op" "pecUpper_origin_composeMatrix.it";
connectAttr "pecUpper_fiberTarget_plusMinusAverage.o3" "pecUpper_target_composeMatrix.it"
		;
connectAttr "pecUpper_distanceBetween.d" "pecUpper_stretch_multiplyDivide.i1x";
connectAttr "pecUpperRest_distanceBetween.d" "pecUpper_stretch_multiplyDivide.i2x"
		;
connectAttr "pecUpperOrigin_pointMatrixMult.o" "pecUpper_distanceBetween.p1";
connectAttr "pecUpperInsert_pointMatrixMult.o" "pecUpper_distanceBetween.p2";
connectAttr "pecUpperOrigin_poser_rest_pointMatrixMult.o" "pecUpperRest_distanceBetween.p1"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecUpperRest_distanceBetween.p2"
		;
connectAttr "pecUpper_stretch_multiplyDivide.ox" "pecUpper_volume_multiplyDivide.i1x"
		;
connectAttr "muscleVolume_multDoubleLinear.o" "pecUpper_volume_multiplyDivide.i2x"
		;
connectAttr "zFlip_composeMatrix.omat" "pecUpper_local_multMatrix.i[0]";
connectAttr "pecUpper_pose_multMatrix.o" "pecUpper_local_multMatrix.i[1]";
connectAttr "clav_inverseMatrix.omat" "pecUpper_local_multMatrix.i[2]";
connectAttr "zFlip_composeMatrix.omat" "pecUpper_local_multMatrix.i[3]";
connectAttr "pecUpper_local_multMatrix.o" "pecUpper_local_decomposeMatrix.imat";
connectAttr "pecLowerOrigin_poser.t" "pecLowerOrigin_poser_rest_pointMatrixMult.ip"
		;
connectAttr "root_poser.im" "pecLowerOrigin_poser_rest_pointMatrixMult.im";
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecLowerInsert_humerusLocal_pointMatrixMult.ip"
		;
connectAttr "humerusRest_inverseMatrix.omat" "pecLowerInsert_humerusLocal_pointMatrixMult.im"
		;
connectAttr "pecLowerInsert_humerusLocal_pointMatrixMult.o" "pecLowerInsert_pointMatrixMult.ip"
		;
connectAttr "humerus_multMatrix.o" "pecLowerInsert_pointMatrixMult.im";
connectAttr "pecLowerInsert_pointMatrixMult.o" "pecLower_belly_blendColors.c1";
connectAttr "pecLowerOrigin_poser_rest_pointMatrixMult.o" "pecLower_belly_blendColors.c2"
		;
connectAttr "mainPoser.pecLowerBelly" "pecLower_belly_blendColors.b";
connectAttr "pecLower_restFrame_multMatrix.o" "pecLower_aimMatrix.imat";
connectAttr "pecLower_target_composeMatrix.omat" "pecLower_aimMatrix.pmat";
connectAttr "pecLower_belly_blendColors.op" "pecLower_origin_composeMatrix.it";
connectAttr "pecLower_fiberTarget_plusMinusAverage.o3" "pecLower_target_composeMatrix.it"
		;
connectAttr "pecLower_distanceBetween.d" "pecLower_stretch_multiplyDivide.i1x";
connectAttr "pecLowerRest_distanceBetween.d" "pecLower_stretch_multiplyDivide.i2x"
		;
connectAttr "pecLowerOrigin_poser_rest_pointMatrixMult.o" "pecLower_distanceBetween.p1"
		;
connectAttr "pecLowerInsert_pointMatrixMult.o" "pecLower_distanceBetween.p2";
connectAttr "pecLowerOrigin_poser_rest_pointMatrixMult.o" "pecLowerRest_distanceBetween.p1"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecLowerRest_distanceBetween.p2"
		;
connectAttr "pecLower_stretch_multiplyDivide.ox" "pecLower_volume_multiplyDivide.i1x"
		;
connectAttr "muscleVolume_multDoubleLinear.o" "pecLower_volume_multiplyDivide.i2x"
		;
connectAttr "zFlip_composeMatrix.omat" "pecLower_local_multMatrix.i[0]";
connectAttr "pecLower_pose_multMatrix.o" "pecLower_local_multMatrix.i[1]";
connectAttr "clav_inverseMatrix.omat" "pecLower_local_multMatrix.i[2]";
connectAttr "zFlip_composeMatrix.omat" "pecLower_local_multMatrix.i[3]";
connectAttr "pecLower_local_multMatrix.o" "pecLower_local_decomposeMatrix.imat";
connectAttr "latOrigin_poser.t" "latOrigin_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "latOrigin_poser_rest_pointMatrixMult.im";
connectAttr "latInsert_poser.t" "latInsert_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "latInsert_poser_rest_pointMatrixMult.im";
connectAttr "latInsert_poser_rest_pointMatrixMult.o" "latInsert_humerusLocal_pointMatrixMult.ip"
		;
connectAttr "humerusRest_inverseMatrix.omat" "latInsert_humerusLocal_pointMatrixMult.im"
		;
connectAttr "latInsert_humerusLocal_pointMatrixMult.o" "latInsert_pointMatrixMult.ip"
		;
connectAttr "humerus_multMatrix.o" "latInsert_pointMatrixMult.im";
connectAttr "latInsert_pointMatrixMult.o" "lat_belly_blendColors.c1";
connectAttr "latOrigin_poser_rest_pointMatrixMult.o" "lat_belly_blendColors.c2";
connectAttr "mainPoser.latBelly" "lat_belly_blendColors.b";
connectAttr "lat_restFrame_multMatrix.o" "lat_aimMatrix.imat";
connectAttr "lat_target_composeMatrix.omat" "lat_aimMatrix.pmat";
connectAttr "lat_belly_blendColors.op" "lat_origin_composeMatrix.it";
connectAttr "lat_fiberTarget_plusMinusAverage.o3" "lat_target_composeMatrix.it";
connectAttr "lat_distanceBetween.d" "lat_stretch_multiplyDivide.i1x";
connectAttr "latRest_distanceBetween.d" "lat_stretch_multiplyDivide.i2x";
connectAttr "latOrigin_poser_rest_pointMatrixMult.o" "lat_distanceBetween.p1";
connectAttr "latInsert_pointMatrixMult.o" "lat_distanceBetween.p2";
connectAttr "latOrigin_poser_rest_pointMatrixMult.o" "latRest_distanceBetween.p1"
		;
connectAttr "latInsert_poser_rest_pointMatrixMult.o" "latRest_distanceBetween.p2"
		;
connectAttr "lat_stretch_multiplyDivide.ox" "lat_volume_multiplyDivide.i1x";
connectAttr "muscleVolume_multDoubleLinear.o" "lat_volume_multiplyDivide.i2x";
connectAttr "zFlip_composeMatrix.omat" "lat_local_multMatrix.i[0]";
connectAttr "lat_pose_multMatrix.o" "lat_local_multMatrix.i[1]";
connectAttr "clav_inverseMatrix.omat" "lat_local_multMatrix.i[2]";
connectAttr "zFlip_composeMatrix.omat" "lat_local_multMatrix.i[3]";
connectAttr "lat_local_multMatrix.o" "lat_local_decomposeMatrix.imat";
connectAttr "trapOrigin_poser.t" "trapOrigin_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "trapOrigin_poser_rest_pointMatrixMult.im";
connectAttr "trapInsert_poser.t" "trapInsert_poser_rest_pointMatrixMult.ip";
connectAttr "root_poser.im" "trapInsert_poser_rest_pointMatrixMult.im";
connectAttr "trapInsert_poser_rest_pointMatrixMult.o" "trapInsert_pointMatrixMult.ip"
		;
connectAttr "clav_multMatrix.o" "trapInsert_pointMatrixMult.im";
connectAttr "trapInsert_pointMatrixMult.o" "trap_belly_blendColors.c1";
connectAttr "trapOrigin_poser_rest_pointMatrixMult.o" "trap_belly_blendColors.c2"
		;
connectAttr "mainPoser.trapBelly" "trap_belly_blendColors.b";
connectAttr "trap_restFrame_multMatrix.o" "trap_aimMatrix.imat";
connectAttr "trap_target_composeMatrix.omat" "trap_aimMatrix.pmat";
connectAttr "trap_belly_blendColors.op" "trap_origin_composeMatrix.it";
connectAttr "trap_fiberTarget_plusMinusAverage.o3" "trap_target_composeMatrix.it"
		;
connectAttr "trap_distanceBetween.d" "trap_stretch_multiplyDivide.i1x";
connectAttr "trapRest_distanceBetween.d" "trap_stretch_multiplyDivide.i2x";
connectAttr "trapOrigin_poser_rest_pointMatrixMult.o" "trap_distanceBetween.p1";
connectAttr "trapInsert_pointMatrixMult.o" "trap_distanceBetween.p2";
connectAttr "trapOrigin_poser_rest_pointMatrixMult.o" "trapRest_distanceBetween.p1"
		;
connectAttr "trapInsert_poser_rest_pointMatrixMult.o" "trapRest_distanceBetween.p2"
		;
connectAttr "trap_stretch_multiplyDivide.ox" "trap_volume_multiplyDivide.i1x";
connectAttr "muscleVolume_multDoubleLinear.o" "trap_volume_multiplyDivide.i2x";
connectAttr "zFlip_composeMatrix.omat" "trap_local_multMatrix.i[0]";
connectAttr "trap_pose_multMatrix.o" "trap_local_multMatrix.i[1]";
connectAttr "clav_inverseMatrix.omat" "trap_local_multMatrix.i[2]";
connectAttr "zFlip_composeMatrix.omat" "trap_local_multMatrix.i[3]";
connectAttr "trap_local_multMatrix.o" "trap_local_decomposeMatrix.imat";
connectAttr "pecUpperInsert_pointMatrixMult.o" "pecUpper_fiber_plusMinusAverage.i3[0]"
		;
connectAttr "pecUpperOrigin_pointMatrixMult.o" "pecUpper_fiber_plusMinusAverage.i3[1]"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecUpper_fiberRest_plusMinusAverage.i3[0]"
		;
connectAttr "pecUpperOrigin_poser_rest_pointMatrixMult.o" "pecUpper_fiberRest_plusMinusAverage.i3[1]"
		;
connectAttr "pecUpper_stretch_multiplyDivide.ox" "pecUpper_fiberHold_setRange.vx"
		;
connectAttr "mainPoser.fiberHoldBelow" "pecUpper_fiberHold_setRange.omx";
connectAttr "pecUpper_fiberHold_setRange.ox" "pecUpper_fiberHoldSq_multDoubleLinear.i1"
		;
connectAttr "pecUpper_fiberHold_setRange.ox" "pecUpper_fiberHoldSq_multDoubleLinear.i2"
		;
connectAttr "pecUpper_fiberHold_setRange.ox" "pecUpper_fiberHoldK_setRange.vx";
connectAttr "pecUpper_fiberHoldSq_multDoubleLinear.o" "pecUpper_fiberHoldSmooth_multDoubleLinear.i1"
		;
connectAttr "pecUpper_fiberHoldK_setRange.ox" "pecUpper_fiberHoldSmooth_multDoubleLinear.i2"
		;
connectAttr "pecUpper_fiberHoldSmooth_multDoubleLinear.o" "pecUpper_fiberHold_reverse.ix"
		;
connectAttr "pecUpper_fiberHold_reverse.ox" "pecUpper_fiberHoldK_multDoubleLinear.i1"
		;
connectAttr "mainPoser.fiberHold" "pecUpper_fiberHoldK_multDoubleLinear.i2";
connectAttr "pecUpper_fiberRest_plusMinusAverage.o3" "pecUpper_fiberHoldRest_multiplyDivide.i1"
		;
connectAttr "pecUpper_fiberHoldK_multDoubleLinear.o" "pecUpper_fiberHoldRest_multiplyDivide.i2x"
		;
connectAttr "pecUpper_fiberHoldK_multDoubleLinear.o" "pecUpper_fiberHoldRest_multiplyDivide.i2y"
		;
connectAttr "pecUpper_fiberHoldK_multDoubleLinear.o" "pecUpper_fiberHoldRest_multiplyDivide.i2z"
		;
connectAttr "pecUpper_belly_blendColors.op" "pecUpper_fiberTarget_plusMinusAverage.i3[0]"
		;
connectAttr "pecUpper_fiber_plusMinusAverage.o3" "pecUpper_fiberTarget_plusMinusAverage.i3[1]"
		;
connectAttr "pecUpper_fiberHoldRest_multiplyDivide.o" "pecUpper_fiberTarget_plusMinusAverage.i3[2]"
		;
connectAttr "pecLowerInsert_pointMatrixMult.o" "pecLower_fiber_plusMinusAverage.i3[0]"
		;
connectAttr "pecLowerOrigin_poser_rest_pointMatrixMult.o" "pecLower_fiber_plusMinusAverage.i3[1]"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecLower_fiberRest_plusMinusAverage.i3[0]"
		;
connectAttr "pecLowerOrigin_poser_rest_pointMatrixMult.o" "pecLower_fiberRest_plusMinusAverage.i3[1]"
		;
connectAttr "pecLower_stretch_multiplyDivide.ox" "pecLower_fiberHold_setRange.vx"
		;
connectAttr "mainPoser.fiberHoldBelow" "pecLower_fiberHold_setRange.omx";
connectAttr "pecLower_fiberHold_setRange.ox" "pecLower_fiberHoldSq_multDoubleLinear.i1"
		;
connectAttr "pecLower_fiberHold_setRange.ox" "pecLower_fiberHoldSq_multDoubleLinear.i2"
		;
connectAttr "pecLower_fiberHold_setRange.ox" "pecLower_fiberHoldK_setRange.vx";
connectAttr "pecLower_fiberHoldSq_multDoubleLinear.o" "pecLower_fiberHoldSmooth_multDoubleLinear.i1"
		;
connectAttr "pecLower_fiberHoldK_setRange.ox" "pecLower_fiberHoldSmooth_multDoubleLinear.i2"
		;
connectAttr "pecLower_fiberHoldSmooth_multDoubleLinear.o" "pecLower_fiberHold_reverse.ix"
		;
connectAttr "pecLower_fiberHold_reverse.ox" "pecLower_fiberHoldK_multDoubleLinear.i1"
		;
connectAttr "mainPoser.fiberHold" "pecLower_fiberHoldK_multDoubleLinear.i2";
connectAttr "pecLower_fiberRest_plusMinusAverage.o3" "pecLower_fiberHoldRest_multiplyDivide.i1"
		;
connectAttr "pecLower_fiberHoldK_multDoubleLinear.o" "pecLower_fiberHoldRest_multiplyDivide.i2x"
		;
connectAttr "pecLower_fiberHoldK_multDoubleLinear.o" "pecLower_fiberHoldRest_multiplyDivide.i2y"
		;
connectAttr "pecLower_fiberHoldK_multDoubleLinear.o" "pecLower_fiberHoldRest_multiplyDivide.i2z"
		;
connectAttr "pecLower_belly_blendColors.op" "pecLower_fiberTarget_plusMinusAverage.i3[0]"
		;
connectAttr "pecLower_fiber_plusMinusAverage.o3" "pecLower_fiberTarget_plusMinusAverage.i3[1]"
		;
connectAttr "pecLower_fiberHoldRest_multiplyDivide.o" "pecLower_fiberTarget_plusMinusAverage.i3[2]"
		;
connectAttr "latInsert_pointMatrixMult.o" "lat_fiber_plusMinusAverage.i3[0]";
connectAttr "latOrigin_poser_rest_pointMatrixMult.o" "lat_fiber_plusMinusAverage.i3[1]"
		;
connectAttr "latInsert_poser_rest_pointMatrixMult.o" "lat_fiberRest_plusMinusAverage.i3[0]"
		;
connectAttr "latOrigin_poser_rest_pointMatrixMult.o" "lat_fiberRest_plusMinusAverage.i3[1]"
		;
connectAttr "lat_stretch_multiplyDivide.ox" "lat_fiberHold_setRange.vx";
connectAttr "mainPoser.fiberHoldBelow" "lat_fiberHold_setRange.omx";
connectAttr "lat_fiberHold_setRange.ox" "lat_fiberHoldSq_multDoubleLinear.i1";
connectAttr "lat_fiberHold_setRange.ox" "lat_fiberHoldSq_multDoubleLinear.i2";
connectAttr "lat_fiberHold_setRange.ox" "lat_fiberHoldK_setRange.vx";
connectAttr "lat_fiberHoldSq_multDoubleLinear.o" "lat_fiberHoldSmooth_multDoubleLinear.i1"
		;
connectAttr "lat_fiberHoldK_setRange.ox" "lat_fiberHoldSmooth_multDoubleLinear.i2"
		;
connectAttr "lat_fiberHoldSmooth_multDoubleLinear.o" "lat_fiberHold_reverse.ix";
connectAttr "lat_fiberHold_reverse.ox" "lat_fiberHoldK_multDoubleLinear.i1";
connectAttr "mainPoser.fiberHold" "lat_fiberHoldK_multDoubleLinear.i2";
connectAttr "lat_fiberRest_plusMinusAverage.o3" "lat_fiberHoldRest_multiplyDivide.i1"
		;
connectAttr "lat_fiberHoldK_multDoubleLinear.o" "lat_fiberHoldRest_multiplyDivide.i2x"
		;
connectAttr "lat_fiberHoldK_multDoubleLinear.o" "lat_fiberHoldRest_multiplyDivide.i2y"
		;
connectAttr "lat_fiberHoldK_multDoubleLinear.o" "lat_fiberHoldRest_multiplyDivide.i2z"
		;
connectAttr "lat_belly_blendColors.op" "lat_fiberTarget_plusMinusAverage.i3[0]";
connectAttr "lat_fiber_plusMinusAverage.o3" "lat_fiberTarget_plusMinusAverage.i3[1]"
		;
connectAttr "lat_fiberHoldRest_multiplyDivide.o" "lat_fiberTarget_plusMinusAverage.i3[2]"
		;
connectAttr "trapInsert_pointMatrixMult.o" "trap_fiber_plusMinusAverage.i3[0]";
connectAttr "trapOrigin_poser_rest_pointMatrixMult.o" "trap_fiber_plusMinusAverage.i3[1]"
		;
connectAttr "trapInsert_poser_rest_pointMatrixMult.o" "trap_fiberRest_plusMinusAverage.i3[0]"
		;
connectAttr "trapOrigin_poser_rest_pointMatrixMult.o" "trap_fiberRest_plusMinusAverage.i3[1]"
		;
connectAttr "trap_stretch_multiplyDivide.ox" "trap_fiberHold_setRange.vx";
connectAttr "mainPoser.fiberHoldBelow" "trap_fiberHold_setRange.omx";
connectAttr "trap_fiberHold_setRange.ox" "trap_fiberHoldSq_multDoubleLinear.i1";
connectAttr "trap_fiberHold_setRange.ox" "trap_fiberHoldSq_multDoubleLinear.i2";
connectAttr "trap_fiberHold_setRange.ox" "trap_fiberHoldK_setRange.vx";
connectAttr "trap_fiberHoldSq_multDoubleLinear.o" "trap_fiberHoldSmooth_multDoubleLinear.i1"
		;
connectAttr "trap_fiberHoldK_setRange.ox" "trap_fiberHoldSmooth_multDoubleLinear.i2"
		;
connectAttr "trap_fiberHoldSmooth_multDoubleLinear.o" "trap_fiberHold_reverse.ix"
		;
connectAttr "trap_fiberHold_reverse.ox" "trap_fiberHoldK_multDoubleLinear.i1";
connectAttr "mainPoser.fiberHold" "trap_fiberHoldK_multDoubleLinear.i2";
connectAttr "trap_fiberRest_plusMinusAverage.o3" "trap_fiberHoldRest_multiplyDivide.i1"
		;
connectAttr "trap_fiberHoldK_multDoubleLinear.o" "trap_fiberHoldRest_multiplyDivide.i2x"
		;
connectAttr "trap_fiberHoldK_multDoubleLinear.o" "trap_fiberHoldRest_multiplyDivide.i2y"
		;
connectAttr "trap_fiberHoldK_multDoubleLinear.o" "trap_fiberHoldRest_multiplyDivide.i2z"
		;
connectAttr "trap_belly_blendColors.op" "trap_fiberTarget_plusMinusAverage.i3[0]"
		;
connectAttr "trap_fiber_plusMinusAverage.o3" "trap_fiberTarget_plusMinusAverage.i3[1]"
		;
connectAttr "trap_fiberHoldRest_multiplyDivide.o" "trap_fiberTarget_plusMinusAverage.i3[2]"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecUpper_restFrameBelly_blendColors.c1"
		;
connectAttr "pecUpperOrigin_poser_rest_pointMatrixMult.o" "pecUpper_restFrameBelly_blendColors.c2"
		;
connectAttr "mainPoser.pecUpperBelly" "pecUpper_restFrameBelly_blendColors.b";
connectAttr "pecUpper_restFrameBelly_blendColors.op" "pecUpper_restFrameOrigin_composeMatrix.it"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecUpper_restFrameTarget_composeMatrix.it"
		;
connectAttr "pecUpper_restFrameOrigin_composeMatrix.omat" "pecUpper_restFrame_aimMatrix.imat"
		;
connectAttr "pecUpper_restFrameTarget_composeMatrix.omat" "pecUpper_restFrame_aimMatrix.pmat"
		;
connectAttr "pecUpper_restFrame_aimMatrix.tmat" "pecUpper_restFrame_pickMatrix.imat"
		;
connectAttr "pecUpper_restFrame_pickMatrix.tmat" "pecUpper_restFrame_multMatrix.i[0]"
		;
connectAttr "pecUpper_origin_composeMatrix.omat" "pecUpper_restFrame_multMatrix.i[1]"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecLower_restFrameBelly_blendColors.c1"
		;
connectAttr "pecLowerOrigin_poser_rest_pointMatrixMult.o" "pecLower_restFrameBelly_blendColors.c2"
		;
connectAttr "mainPoser.pecLowerBelly" "pecLower_restFrameBelly_blendColors.b";
connectAttr "pecLower_restFrameBelly_blendColors.op" "pecLower_restFrameOrigin_composeMatrix.it"
		;
connectAttr "pecInsert_poser_rest_pointMatrixMult.o" "pecLower_restFrameTarget_composeMatrix.it"
		;
connectAttr "pecLower_restFrameOrigin_composeMatrix.omat" "pecLower_restFrame_aimMatrix.imat"
		;
connectAttr "pecLower_restFrameTarget_composeMatrix.omat" "pecLower_restFrame_aimMatrix.pmat"
		;
connectAttr "pecLower_restFrame_aimMatrix.tmat" "pecLower_restFrame_pickMatrix.imat"
		;
connectAttr "pecLower_restFrame_pickMatrix.tmat" "pecLower_restFrame_multMatrix.i[0]"
		;
connectAttr "pecLower_origin_composeMatrix.omat" "pecLower_restFrame_multMatrix.i[1]"
		;
connectAttr "latInsert_poser_rest_pointMatrixMult.o" "lat_restFrameBelly_blendColors.c1"
		;
connectAttr "latOrigin_poser_rest_pointMatrixMult.o" "lat_restFrameBelly_blendColors.c2"
		;
connectAttr "mainPoser.latBelly" "lat_restFrameBelly_blendColors.b";
connectAttr "lat_restFrameBelly_blendColors.op" "lat_restFrameOrigin_composeMatrix.it"
		;
connectAttr "latInsert_poser_rest_pointMatrixMult.o" "lat_restFrameTarget_composeMatrix.it"
		;
connectAttr "lat_restFrameOrigin_composeMatrix.omat" "lat_restFrame_aimMatrix.imat"
		;
connectAttr "lat_restFrameTarget_composeMatrix.omat" "lat_restFrame_aimMatrix.pmat"
		;
connectAttr "lat_restFrame_aimMatrix.tmat" "lat_restFrame_pickMatrix.imat";
connectAttr "lat_restFrame_pickMatrix.tmat" "lat_restFrame_multMatrix.i[0]";
connectAttr "lat_origin_composeMatrix.omat" "lat_restFrame_multMatrix.i[1]";
connectAttr "trapInsert_poser_rest_pointMatrixMult.o" "trap_restFrameBelly_blendColors.c1"
		;
connectAttr "trapOrigin_poser_rest_pointMatrixMult.o" "trap_restFrameBelly_blendColors.c2"
		;
connectAttr "mainPoser.trapBelly" "trap_restFrameBelly_blendColors.b";
connectAttr "trap_restFrameBelly_blendColors.op" "trap_restFrameOrigin_composeMatrix.it"
		;
connectAttr "trapInsert_poser_rest_pointMatrixMult.o" "trap_restFrameTarget_composeMatrix.it"
		;
connectAttr "trap_restFrameOrigin_composeMatrix.omat" "trap_restFrame_aimMatrix.imat"
		;
connectAttr "trap_restFrameTarget_composeMatrix.omat" "trap_restFrame_aimMatrix.pmat"
		;
connectAttr "trap_restFrame_aimMatrix.tmat" "trap_restFrame_pickMatrix.imat";
connectAttr "trap_restFrame_pickMatrix.tmat" "trap_restFrame_multMatrix.i[0]";
connectAttr "trap_origin_composeMatrix.omat" "trap_restFrame_multMatrix.i[1]";
connectAttr "clav_multMatrix.o" "poseClav_decomposeMatrix.imat";
connectAttr "root.ro" "poseClav_decomposeMatrix.ro";
connectAttr "unitConversion2.o" "poseClavForward_multDoubleLinear.i1";
connectAttr "poseClav_decomposeMatrix.ory" "unitConversion2.i";
connectAttr "poseClavForward_multDoubleLinear.o" "poseWeight_setRange.vx";
connectAttr "unitConversion3.o" "poseWeight_setRange.vy";
connectAttr "unitConversion4.o" "poseWeight_setRange.vz";
connectAttr "root_outJoint.forwardAngle" "poseWeight_setRange.omx";
connectAttr "root_outJoint.backAngle" "poseWeight_setRange.omy";
connectAttr "root_outJoint.upAngle" "poseWeight_setRange.omz";
connectAttr "poseClav_decomposeMatrix.ory" "unitConversion3.i";
connectAttr "poseClav_decomposeMatrix.orz" "unitConversion4.i";
connectAttr "poseWeight_setRange.o" "poseWeightSq_multiplyDivide.i1";
connectAttr "poseWeight_setRange.o" "poseWeightSq_multiplyDivide.i2";
connectAttr "poseWeight_setRange.o" "poseWeightK_setRange.v";
connectAttr "poseWeightSq_multiplyDivide.o" "poseWeights_multiplyDivide.i1";
connectAttr "poseWeightK_setRange.o" "poseWeights_multiplyDivide.i2";
connectAttr "scapula_forwardTranslate_multiplyDivide.o" "scapula_poseTranslate_plusMinusAverage.i3[0]"
		;
connectAttr "scapula_backTranslate_multiplyDivide.o" "scapula_poseTranslate_plusMinusAverage.i3[1]"
		;
connectAttr "scapula_upTranslate_multiplyDivide.o" "scapula_poseTranslate_plusMinusAverage.i3[2]"
		;
connectAttr "scapula_forwardRotate_multiplyDivide.o" "scapula_poseRotate_plusMinusAverage.i3[0]"
		;
connectAttr "scapula_backRotate_multiplyDivide.o" "scapula_poseRotate_plusMinusAverage.i3[1]"
		;
connectAttr "scapula_upRotate_multiplyDivide.o" "scapula_poseRotate_plusMinusAverage.i3[2]"
		;
connectAttr "scapula_outJoint.showForward" "scapula_forward_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showForward" "scapula_forward_show_plusMinusAverage.i1[1]"
		;
connectAttr "scapula_forward_poseLoc.t" "scapula_forwardTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapula_forwardTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapula_forwardTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapula_forwardTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion5.o" "scapula_forwardRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "scapula_forwardRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapula_forwardRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapula_forwardRotate_multiplyDivide.i2z"
		;
connectAttr "scapula_forward_poseLoc.r" "unitConversion5.i";
connectAttr "scapula_outJoint.showBack" "scapula_back_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showBack" "scapula_back_show_plusMinusAverage.i1[1]";
connectAttr "scapula_back_poseLoc.t" "scapula_backTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "scapula_backTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapula_backTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapula_backTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion6.o" "scapula_backRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "scapula_backRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapula_backRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapula_backRotate_multiplyDivide.i2z"
		;
connectAttr "scapula_back_poseLoc.r" "unitConversion6.i";
connectAttr "scapula_outJoint.showUp" "scapula_up_show_plusMinusAverage.i1[0]";
connectAttr "root_outJoint.showUp" "scapula_up_show_plusMinusAverage.i1[1]";
connectAttr "scapula_up_poseLoc.t" "scapula_upTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "scapula_upTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapula_upTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapula_upTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion7.o" "scapula_upRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "scapula_upRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapula_upRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapula_upRotate_multiplyDivide.i2z"
		;
connectAttr "scapula_up_poseLoc.r" "unitConversion7.i";
connectAttr "scapula_poseTranslate_plusMinusAverage.o3" "scapula_pose_composeMatrix.it"
		;
connectAttr "unitConversion8.o" "scapula_pose_composeMatrix.ir";
connectAttr "scapula_poseRotate_plusMinusAverage.o3" "unitConversion8.i";
connectAttr "scapula_pose_composeMatrix.omat" "scapula_pose_multMatrix.i[0]";
connectAttr "scapula_aimMatrix.tmat" "scapula_pose_multMatrix.i[1]";
connectAttr "scapulaTip_forwardTranslate_multiplyDivide.o" "scapulaTip_poseTranslate_plusMinusAverage.i3[0]"
		;
connectAttr "scapulaTip_backTranslate_multiplyDivide.o" "scapulaTip_poseTranslate_plusMinusAverage.i3[1]"
		;
connectAttr "scapulaTip_upTranslate_multiplyDivide.o" "scapulaTip_poseTranslate_plusMinusAverage.i3[2]"
		;
connectAttr "scapulaTip_forwardRotate_multiplyDivide.o" "scapulaTip_poseRotate_plusMinusAverage.i3[0]"
		;
connectAttr "scapulaTip_backRotate_multiplyDivide.o" "scapulaTip_poseRotate_plusMinusAverage.i3[1]"
		;
connectAttr "scapulaTip_upRotate_multiplyDivide.o" "scapulaTip_poseRotate_plusMinusAverage.i3[2]"
		;
connectAttr "scapulaTip_outJoint.showForward" "scapulaTip_forward_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showForward" "scapulaTip_forward_show_plusMinusAverage.i1[1]"
		;
connectAttr "scapulaTip_forward_poseLoc.t" "scapulaTip_forwardTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapulaTip_forwardTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapulaTip_forwardTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapulaTip_forwardTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion9.o" "scapulaTip_forwardRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "scapulaTip_forwardRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapulaTip_forwardRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "scapulaTip_forwardRotate_multiplyDivide.i2z"
		;
connectAttr "scapulaTip_forward_poseLoc.r" "unitConversion9.i";
connectAttr "scapulaTip_outJoint.showBack" "scapulaTip_back_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showBack" "scapulaTip_back_show_plusMinusAverage.i1[1]"
		;
connectAttr "scapulaTip_back_poseLoc.t" "scapulaTip_backTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapulaTip_backTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapulaTip_backTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapulaTip_backTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion10.o" "scapulaTip_backRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "scapulaTip_backRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapulaTip_backRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "scapulaTip_backRotate_multiplyDivide.i2z"
		;
connectAttr "scapulaTip_back_poseLoc.r" "unitConversion10.i";
connectAttr "scapulaTip_outJoint.showUp" "scapulaTip_up_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showUp" "scapulaTip_up_show_plusMinusAverage.i1[1]";
connectAttr "scapulaTip_up_poseLoc.t" "scapulaTip_upTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapulaTip_upTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapulaTip_upTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapulaTip_upTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion11.o" "scapulaTip_upRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "scapulaTip_upRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapulaTip_upRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "scapulaTip_upRotate_multiplyDivide.i2z"
		;
connectAttr "scapulaTip_up_poseLoc.r" "unitConversion11.i";
connectAttr "scapulaTip_poseTranslate_plusMinusAverage.o3" "scapulaTip_pose_composeMatrix.it"
		;
connectAttr "unitConversion12.o" "scapulaTip_pose_composeMatrix.ir";
connectAttr "scapulaTip_poseRotate_plusMinusAverage.o3" "unitConversion12.i";
connectAttr "scapulaTip_pose_composeMatrix.omat" "scapulaTip_pose_multMatrix.i[0]"
		;
connectAttr "scapulaTipFrame_multMatrix.o" "scapulaTip_pose_multMatrix.i[1]";
connectAttr "pecUpper_forwardTranslate_multiplyDivide.o" "pecUpper_poseTranslate_plusMinusAverage.i3[0]"
		;
connectAttr "pecUpper_backTranslate_multiplyDivide.o" "pecUpper_poseTranslate_plusMinusAverage.i3[1]"
		;
connectAttr "pecUpper_upTranslate_multiplyDivide.o" "pecUpper_poseTranslate_plusMinusAverage.i3[2]"
		;
connectAttr "pecUpper_forwardRotate_multiplyDivide.o" "pecUpper_poseRotate_plusMinusAverage.i3[0]"
		;
connectAttr "pecUpper_backRotate_multiplyDivide.o" "pecUpper_poseRotate_plusMinusAverage.i3[1]"
		;
connectAttr "pecUpper_upRotate_multiplyDivide.o" "pecUpper_poseRotate_plusMinusAverage.i3[2]"
		;
connectAttr "pecUpper_outJoint.showForward" "pecUpper_forward_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showForward" "pecUpper_forward_show_plusMinusAverage.i1[1]"
		;
connectAttr "pecUpper_forward_poseLoc.t" "pecUpper_forwardTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecUpper_forwardTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecUpper_forwardTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecUpper_forwardTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion13.o" "pecUpper_forwardRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "pecUpper_forwardRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecUpper_forwardRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecUpper_forwardRotate_multiplyDivide.i2z"
		;
connectAttr "pecUpper_forward_poseLoc.r" "unitConversion13.i";
connectAttr "pecUpper_outJoint.showBack" "pecUpper_back_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showBack" "pecUpper_back_show_plusMinusAverage.i1[1]"
		;
connectAttr "pecUpper_back_poseLoc.t" "pecUpper_backTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecUpper_backTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecUpper_backTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecUpper_backTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion14.o" "pecUpper_backRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "pecUpper_backRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecUpper_backRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecUpper_backRotate_multiplyDivide.i2z"
		;
connectAttr "pecUpper_back_poseLoc.r" "unitConversion14.i";
connectAttr "pecUpper_outJoint.showUp" "pecUpper_up_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showUp" "pecUpper_up_show_plusMinusAverage.i1[1]";
connectAttr "pecUpper_up_poseLoc.t" "pecUpper_upTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "pecUpper_upTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecUpper_upTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecUpper_upTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion15.o" "pecUpper_upRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "pecUpper_upRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecUpper_upRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecUpper_upRotate_multiplyDivide.i2z"
		;
connectAttr "pecUpper_up_poseLoc.r" "unitConversion15.i";
connectAttr "pecUpper_poseTranslate_plusMinusAverage.o3" "pecUpper_pose_composeMatrix.it"
		;
connectAttr "unitConversion16.o" "pecUpper_pose_composeMatrix.ir";
connectAttr "pecUpper_poseRotate_plusMinusAverage.o3" "unitConversion16.i";
connectAttr "pecUpper_pose_composeMatrix.omat" "pecUpper_pose_multMatrix.i[0]";
connectAttr "pecUpper_aimMatrix.tmat" "pecUpper_pose_multMatrix.i[1]";
connectAttr "pecLower_forwardTranslate_multiplyDivide.o" "pecLower_poseTranslate_plusMinusAverage.i3[0]"
		;
connectAttr "pecLower_backTranslate_multiplyDivide.o" "pecLower_poseTranslate_plusMinusAverage.i3[1]"
		;
connectAttr "pecLower_upTranslate_multiplyDivide.o" "pecLower_poseTranslate_plusMinusAverage.i3[2]"
		;
connectAttr "pecLower_forwardRotate_multiplyDivide.o" "pecLower_poseRotate_plusMinusAverage.i3[0]"
		;
connectAttr "pecLower_backRotate_multiplyDivide.o" "pecLower_poseRotate_plusMinusAverage.i3[1]"
		;
connectAttr "pecLower_upRotate_multiplyDivide.o" "pecLower_poseRotate_plusMinusAverage.i3[2]"
		;
connectAttr "pecLower_outJoint.showForward" "pecLower_forward_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showForward" "pecLower_forward_show_plusMinusAverage.i1[1]"
		;
connectAttr "pecLower_forward_poseLoc.t" "pecLower_forwardTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecLower_forwardTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecLower_forwardTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecLower_forwardTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion17.o" "pecLower_forwardRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "pecLower_forwardRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecLower_forwardRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "pecLower_forwardRotate_multiplyDivide.i2z"
		;
connectAttr "pecLower_forward_poseLoc.r" "unitConversion17.i";
connectAttr "pecLower_outJoint.showBack" "pecLower_back_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showBack" "pecLower_back_show_plusMinusAverage.i1[1]"
		;
connectAttr "pecLower_back_poseLoc.t" "pecLower_backTranslate_multiplyDivide.i1"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecLower_backTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecLower_backTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecLower_backTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion18.o" "pecLower_backRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "pecLower_backRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecLower_backRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "pecLower_backRotate_multiplyDivide.i2z"
		;
connectAttr "pecLower_back_poseLoc.r" "unitConversion18.i";
connectAttr "pecLower_outJoint.showUp" "pecLower_up_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showUp" "pecLower_up_show_plusMinusAverage.i1[1]";
connectAttr "pecLower_up_poseLoc.t" "pecLower_upTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "pecLower_upTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecLower_upTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecLower_upTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion19.o" "pecLower_upRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "pecLower_upRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecLower_upRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "pecLower_upRotate_multiplyDivide.i2z"
		;
connectAttr "pecLower_up_poseLoc.r" "unitConversion19.i";
connectAttr "pecLower_poseTranslate_plusMinusAverage.o3" "pecLower_pose_composeMatrix.it"
		;
connectAttr "unitConversion20.o" "pecLower_pose_composeMatrix.ir";
connectAttr "pecLower_poseRotate_plusMinusAverage.o3" "unitConversion20.i";
connectAttr "pecLower_pose_composeMatrix.omat" "pecLower_pose_multMatrix.i[0]";
connectAttr "pecLower_aimMatrix.tmat" "pecLower_pose_multMatrix.i[1]";
connectAttr "lat_forwardTranslate_multiplyDivide.o" "lat_poseTranslate_plusMinusAverage.i3[0]"
		;
connectAttr "lat_backTranslate_multiplyDivide.o" "lat_poseTranslate_plusMinusAverage.i3[1]"
		;
connectAttr "lat_upTranslate_multiplyDivide.o" "lat_poseTranslate_plusMinusAverage.i3[2]"
		;
connectAttr "lat_forwardRotate_multiplyDivide.o" "lat_poseRotate_plusMinusAverage.i3[0]"
		;
connectAttr "lat_backRotate_multiplyDivide.o" "lat_poseRotate_plusMinusAverage.i3[1]"
		;
connectAttr "lat_upRotate_multiplyDivide.o" "lat_poseRotate_plusMinusAverage.i3[2]"
		;
connectAttr "lat_outJoint.showForward" "lat_forward_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showForward" "lat_forward_show_plusMinusAverage.i1[1]"
		;
connectAttr "lat_forward_poseLoc.t" "lat_forwardTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "lat_forwardTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "lat_forwardTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "lat_forwardTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion21.o" "lat_forwardRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "lat_forwardRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "lat_forwardRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "lat_forwardRotate_multiplyDivide.i2z"
		;
connectAttr "lat_forward_poseLoc.r" "unitConversion21.i";
connectAttr "lat_outJoint.showBack" "lat_back_show_plusMinusAverage.i1[0]";
connectAttr "root_outJoint.showBack" "lat_back_show_plusMinusAverage.i1[1]";
connectAttr "lat_back_poseLoc.t" "lat_backTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "lat_backTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "lat_backTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "lat_backTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion22.o" "lat_backRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "lat_backRotate_multiplyDivide.i2x";
connectAttr "poseWeights_multiplyDivide.oy" "lat_backRotate_multiplyDivide.i2y";
connectAttr "poseWeights_multiplyDivide.oy" "lat_backRotate_multiplyDivide.i2z";
connectAttr "lat_back_poseLoc.r" "unitConversion22.i";
connectAttr "lat_outJoint.showUp" "lat_up_show_plusMinusAverage.i1[0]";
connectAttr "root_outJoint.showUp" "lat_up_show_plusMinusAverage.i1[1]";
connectAttr "lat_up_poseLoc.t" "lat_upTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "lat_upTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "lat_upTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "lat_upTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion23.o" "lat_upRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "lat_upRotate_multiplyDivide.i2x";
connectAttr "poseWeights_multiplyDivide.oz" "lat_upRotate_multiplyDivide.i2y";
connectAttr "poseWeights_multiplyDivide.oz" "lat_upRotate_multiplyDivide.i2z";
connectAttr "lat_up_poseLoc.r" "unitConversion23.i";
connectAttr "lat_poseTranslate_plusMinusAverage.o3" "lat_pose_composeMatrix.it";
connectAttr "unitConversion24.o" "lat_pose_composeMatrix.ir";
connectAttr "lat_poseRotate_plusMinusAverage.o3" "unitConversion24.i";
connectAttr "lat_pose_composeMatrix.omat" "lat_pose_multMatrix.i[0]";
connectAttr "lat_aimMatrix.tmat" "lat_pose_multMatrix.i[1]";
connectAttr "trap_forwardTranslate_multiplyDivide.o" "trap_poseTranslate_plusMinusAverage.i3[0]"
		;
connectAttr "trap_backTranslate_multiplyDivide.o" "trap_poseTranslate_plusMinusAverage.i3[1]"
		;
connectAttr "trap_upTranslate_multiplyDivide.o" "trap_poseTranslate_plusMinusAverage.i3[2]"
		;
connectAttr "trap_forwardRotate_multiplyDivide.o" "trap_poseRotate_plusMinusAverage.i3[0]"
		;
connectAttr "trap_backRotate_multiplyDivide.o" "trap_poseRotate_plusMinusAverage.i3[1]"
		;
connectAttr "trap_upRotate_multiplyDivide.o" "trap_poseRotate_plusMinusAverage.i3[2]"
		;
connectAttr "trap_outJoint.showForward" "trap_forward_show_plusMinusAverage.i1[0]"
		;
connectAttr "root_outJoint.showForward" "trap_forward_show_plusMinusAverage.i1[1]"
		;
connectAttr "trap_forward_poseLoc.t" "trap_forwardTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "trap_forwardTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "trap_forwardTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "trap_forwardTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion25.o" "trap_forwardRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.ox" "trap_forwardRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.ox" "trap_forwardRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.ox" "trap_forwardRotate_multiplyDivide.i2z"
		;
connectAttr "trap_forward_poseLoc.r" "unitConversion25.i";
connectAttr "trap_outJoint.showBack" "trap_back_show_plusMinusAverage.i1[0]";
connectAttr "root_outJoint.showBack" "trap_back_show_plusMinusAverage.i1[1]";
connectAttr "trap_back_poseLoc.t" "trap_backTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "trap_backTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "trap_backTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "trap_backTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion26.o" "trap_backRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oy" "trap_backRotate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oy" "trap_backRotate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oy" "trap_backRotate_multiplyDivide.i2z"
		;
connectAttr "trap_back_poseLoc.r" "unitConversion26.i";
connectAttr "trap_outJoint.showUp" "trap_up_show_plusMinusAverage.i1[0]";
connectAttr "root_outJoint.showUp" "trap_up_show_plusMinusAverage.i1[1]";
connectAttr "trap_up_poseLoc.t" "trap_upTranslate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "trap_upTranslate_multiplyDivide.i2x"
		;
connectAttr "poseWeights_multiplyDivide.oz" "trap_upTranslate_multiplyDivide.i2y"
		;
connectAttr "poseWeights_multiplyDivide.oz" "trap_upTranslate_multiplyDivide.i2z"
		;
connectAttr "unitConversion27.o" "trap_upRotate_multiplyDivide.i1";
connectAttr "poseWeights_multiplyDivide.oz" "trap_upRotate_multiplyDivide.i2x";
connectAttr "poseWeights_multiplyDivide.oz" "trap_upRotate_multiplyDivide.i2y";
connectAttr "poseWeights_multiplyDivide.oz" "trap_upRotate_multiplyDivide.i2z";
connectAttr "trap_up_poseLoc.r" "unitConversion27.i";
connectAttr "trap_poseTranslate_plusMinusAverage.o3" "trap_pose_composeMatrix.it"
		;
connectAttr "unitConversion28.o" "trap_pose_composeMatrix.ir";
connectAttr "trap_poseRotate_plusMinusAverage.o3" "unitConversion28.i";
connectAttr "trap_pose_composeMatrix.omat" "trap_pose_multMatrix.i[0]";
connectAttr "trap_aimMatrix.tmat" "trap_pose_multMatrix.i[1]";
connectAttr "root_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_ctrJoint_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "negate.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition_2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of shoulder.ma
