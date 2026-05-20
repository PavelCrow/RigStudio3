//Maya ASCII 2022 scene
//Name: brows.ma
//Last modified: Tue, May 05, 2026 04:27:49 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26200)";
fileInfo "UUID" "6E1D9ADF-486B-43A0-389A-07B81D284BF2";
createNode transform -s -n "persp";
	rename -uid "5072A5DE-4845-7F5F-1170-FD899F3D9C25";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2143361109360953 1.1755144067168215 3.6502281855545688 ;
	setAttr ".r" -type "double3" -6.33835272960079 8.9999999999983835 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C61D3DD1-4BF4-C7C7-B872-739E3DD143CF";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".fcp" 50000;
	setAttr ".coi" 4.1420213127436014;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "0ED14072-4CEC-1B85-C013-FE9965D5061E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "E9659E58-422E-8A47-22A8-F89C95038797";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "9E0529AB-4102-828C-A677-6591633B0308";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "459228F0-4A76-CCB3-D7D4-2583FABC0D52";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "2E05C0A8-4DF2-65F1-09C0-CD8C526A198E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "72C38D39-41FC-57B6-0B8F-49ADD66684EB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "mod";
	rename -uid "1A7A21C2-48B2-4E1E-8EC3-46A66F230D81";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr -l on ".version" -type "string" "1.0";
	setAttr -l on ".moduleType" -type "string" "brows";
createNode transform -n "posers" -p "mod";
	rename -uid "2AC833FF-4EEC-2BE9-2670-E59255522AD1";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "C344476F-445C-8026-E3DD-268221807883";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "jointsSlide" -ln "jointsSlide" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.1;
	setAttr -k on ".lineWidth" 0.19999999999999996;
	setAttr -k on ".jointsSlide" yes;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "3B6BEA84-467E-ABE8-32BC-8AA075CF6C09";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "964B85C8-4033-3F8F-B505-338FF012A907";
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
createNode transform -n "mainPoser_clusterHandle" -p "mainPoser";
	rename -uid "6E8E17F2-4995-BFCA-BD58-0C8799CF3AEA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "";
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "1D70718E-4C4C-BC3B-ED5C-829CC3E20EF3";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "83269F15-4764-A35D-E031-7A9E43F4C26F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "root";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "42133F38-42A8-215F-F311-FFBECDF81075";
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
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "78369C7C-455D-2BB7-D5C9-149ECFB4EF25";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "8A079221-4F30-626B-C369-E8B329758908";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "side_mainPoser" -p "root_poser";
	rename -uid "55682E14-45F3-9641-3CB5-AF848CB38B10";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 1.7097742429737977 0.73318310256943875 0.073579287216283817 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "side__";
	setAttr -l on ".moduleType" -type "string" "foot";
createNode nurbsCurve -n "side_mainPoserShape" -p "side_mainPoser";
	rename -uid "32C5EF44-4047-C569-8D8C-74AE40F32AA9";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "side_mainPoserShapeOrig" -p "side_mainPoser";
	rename -uid "700FB4B4-45AB-C297-F806-F4AAD9211BBC";
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
createNode transform -n "side_mainPoser_clusterHandle" -p "side_mainPoser";
	rename -uid "A4842F84-4181-B44D-B085-E49273D6FF02";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "side__";
createNode clusterHandle -n "side_mainPoser_clusterHandleShape" -p "side_mainPoser_clusterHandle";
	rename -uid "6344E2DB-49FD-8144-4357-2CABA2F94124";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "in_poser" -p "side_mainPoser";
	rename -uid "C7FEA4B3-411E-DEF2-5D6F-4FAAB3FA26CF";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -1.0473559559089465 -0.20505410429566567 -0.04647060372170489 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode nurbsSurface -n "in_poserShape" -p "in_poser";
	rename -uid "389B0FED-4E60-7297-DDFC-5DBB5E08D0A5";
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
createNode transform -n "in_poserOrient" -p "in_poser";
	rename -uid "E7C3C26D-4C50-FB5A-8340-60A8C46FA94D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode locator -n "in_poserOrientShape" -p "in_poserOrient";
	rename -uid "61C8CB92-462A-3C85-5785-A7B892F36CDC";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_1_controlInitLoc" -p "in_poser";
	rename -uid "59DED09D-42BF-A997-23BF-2C85521D4F1F";
	setAttr ".v" no;
createNode locator -n "l_brow_1_controlInitLocShape" -p "l_brow_1_controlInitLoc";
	rename -uid "2C16BD4F-433B-6573-2BDC-5D85DAD6BB41";
	setAttr -k off ".v";
createNode transform -n "l_brow_controlInitLoc" -p "side_mainPoser";
	rename -uid "76F374C5-494D-A9F0-9B1B-B1B39246F321";
	setAttr ".v" no;
createNode locator -n "l_brow_controlInitLocShape" -p "l_brow_controlInitLoc";
	rename -uid "BB17A80F-4375-CE8B-B1CC-D2B7533F66D9";
	setAttr -k off ".v";
createNode transform -n "middle_poser" -p "side_mainPoser";
	rename -uid "731FCB3E-4170-C59D-BBB3-0F891E4B0BEB";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "middle_poserShape" -p "middle_poser";
	rename -uid "CCF330B5-437B-C5CF-516A-9E9377EF9BDC";
	setAttr -k off ".v";
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
createNode transform -n "middle_poserOrient" -p "middle_poser";
	rename -uid "AB3A2902-48C2-51B8-1246-C1B85FA312C2";
createNode locator -n "middle_poserOrientShape" -p "middle_poserOrient";
	rename -uid "F6EB009F-4DEC-7509-3FC7-A8B0064171DD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middle_initLoc" -p "middle_poser";
	rename -uid "4D577CB5-4F16-DECF-7586-1197F6B9DBE0";
	setAttr ".v" no;
createNode locator -n "middle_initLocShape" -p "middle_initLoc";
	rename -uid "07C95812-45E5-4110-1042-BA82A3683280";
	setAttr -k off ".v";
createNode transform -n "out_poser" -p "side_mainPoser";
	rename -uid "4D644DFA-4FB9-D4BC-1974-55AFD1542CCD";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0.83314152088625315 -0.062649662196873623 -0.010415514320163438 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "out_poserShape" -p "out_poser";
	rename -uid "4F7EF0C2-453C-334D-C93D-78AA19B37280";
	setAttr -k off ".v";
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
createNode transform -n "out_poserOrient" -p "out_poser";
	rename -uid "75ACC1C3-4F8E-22C5-682E-CD9F6521EF76";
createNode locator -n "out_poserOrientShape" -p "out_poserOrient";
	rename -uid "BA39D7B8-46C7-2699-7BA3-808A6032906A";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "out_initLoc" -p "out_poserOrient";
	rename -uid "A8B68C66-487D-D64C-35DA-10897FA701EA";
	setAttr ".v" no;
createNode locator -n "out_initLocShape" -p "out_initLoc";
	rename -uid "0DB3E23A-43F0-5E57-01B3-C680C826FF96";
	setAttr -k off ".v";
createNode transform -n "inner_1_poser" -p "side_mainPoser";
	rename -uid "71CB7F23-4931-18D1-9CE7-EA97A0E5592C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" -0.52367797795447335 -0.10252705214783286 -0.023235301860852445 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "inner_1_poserShape" -p "inner_1_poser";
	rename -uid "9BBBB230-4917-E96D-683D-3CAEE50B4FA4";
	setAttr -k off ".v";
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
createNode transform -n "inner_1_poserOrient" -p "inner_1_poser";
	rename -uid "EC85F620-4FAA-2031-2FE4-C48231FE8E53";
createNode locator -n "inner_1_poserOrientShape" -p "inner_1_poserOrient";
	rename -uid "AE095D59-41F6-2A09-DB5B-6E919ED784D2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "inner_1_initLoc" -p "inner_1_poser";
	rename -uid "22D61648-480C-284B-2866-1089F3EDEEC2";
	setAttr ".v" no;
createNode locator -n "inner_1_initLocShape" -p "inner_1_initLoc";
	rename -uid "ADF8E0F2-4674-F8DC-43D3-F49D5061D428";
	setAttr -k off ".v";
createNode transform -n "outer_1_poser" -p "side_mainPoser";
	rename -uid "4523FFF0-4AF6-D7E0-A0B6-9EBFD4D87550";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0.41657076044312658 -0.031324831098436756 -0.0052077571600817191 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "outer_1_poserShape" -p "outer_1_poser";
	rename -uid "2AE4DD6E-46E5-F54A-95FF-1D8EB477556D";
	setAttr -k off ".v";
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
createNode transform -n "outer_1_poserOrient" -p "outer_1_poser";
	rename -uid "4723830F-4176-31DD-EF3E-2D9D58C45EA7";
createNode locator -n "outer_1_poserOrientShape" -p "outer_1_poserOrient";
	rename -uid "557051A3-4BE3-C9A5-15AE-65B71D0F8B2D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "outer_1_initLoc" -p "outer_1_poser";
	rename -uid "64680602-45EA-C20A-624F-DBA8F196DA19";
	setAttr ".v" no;
createNode locator -n "outer_1_initLocShape" -p "outer_1_initLoc";
	rename -uid "217C38FC-4080-8117-C81B-8BA095D94187";
	setAttr -k off ".v";
createNode transform -n "center_poser" -p "root_poser";
	rename -uid "F2F9C773-4860-D87B-54F6-A69DF6C8E391";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0.5736745148643263 0.1569921212627855 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "center";
createNode nurbsSurface -n "center_poserShape" -p "center_poser";
	rename -uid "D3E04665-4150-2AE1-4C2F-CB838B4B1FE4";
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
createNode transform -n "center_poserOrient" -p "center_poser";
	rename -uid "82EBA993-4F2E-C777-EABD-C698EEABDFA7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode locator -n "center_poserOrientShape" -p "center_poserOrient";
	rename -uid "46341956-4F39-29CA-8FEB-DB9F2A6281F8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "c_brow_controlInitLoc" -p "center_poser";
	rename -uid "53170650-4034-A2C4-9F7C-F68A1C341CB5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 0 ;
createNode locator -n "c_brow_controlInitLocShape" -p "c_brow_controlInitLoc";
	rename -uid "59DC62AD-488C-5964-4743-E9836593D528";
	setAttr -k off ".v";
createNode transform -n "mirror_controlInit_group" -p "root_poser";
	rename -uid "DEBED584-40D1-89AA-6D09-D28B54292269";
createNode transform -n "r_brow_controlInitLoc" -p "mirror_controlInit_group";
	rename -uid "4C527C3B-4FCD-A0C1-E0BD-E78796B8FCBE";
	setAttr ".v" no;
createNode locator -n "r_brow_controlInitLocShape" -p "r_brow_controlInitLoc";
	rename -uid "C850F969-4304-40D4-0F4E-629F6C3AD393";
	setAttr -k off ".v";
createNode transform -n "r_brow_1_controlInitLoc" -p "r_brow_controlInitLoc";
	rename -uid "AAA9B0E5-4E22-1354-AC16-799CF3E07BCB";
	setAttr ".v" no;
createNode locator -n "r_brow_1_controlInitLocShape" -p "r_brow_1_controlInitLoc";
	rename -uid "34729647-4535-F108-2EE6-E5925007EE3A";
	setAttr -k off ".v";
createNode transform -n "r_brow_2_controlInitLoc" -p "r_brow_controlInitLoc";
	rename -uid "27CAF26C-4CF1-A738-8315-05B6A4E7AFC3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.71277652226793797 -0.093090641137006658 -0.0046153865330956223 ;
createNode locator -n "r_brow_2_controlInitLocShape" -p "r_brow_2_controlInitLoc";
	rename -uid "943EA93A-4F32-08CA-9DCC-1DA7B803D7D9";
	setAttr -k off ".v";
createNode transform -n "r_brow_3_controlInitLoc" -p "r_brow_controlInitLoc";
	rename -uid "5F036510-4BBF-B2EC-FA12-428A71DAB416";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.36107288977519703 -0.035739377707265652 0.0012426729373162249 ;
createNode locator -n "r_brow_3_controlInitLocShape" -p "r_brow_3_controlInitLoc";
	rename -uid "EA15637E-4380-AA59-6957-E18E60C1FEEA";
	setAttr -k off ".v";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "310CB154-4AC2-7926-3FE7-79B4E140218B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "ADAFF616-43F1-0134-3517-C8957A08CBA6";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		0.66241828706485117 0.52812899827377313 0.027108683494578928
		1.1860962650193243 0.63065605042160588 0.050343985355431373
		1.7097742429737977 0.73318310256943875 0.073579287216283817
		2.1263450034169242 0.70185827147100199 0.068371530056202098
		2.5429157638600506 0.67053344037256513 0.063163772896120379
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "DCBE19DA-4636-FAD7-908D-A8ABCF2E3066";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "D2B24672-43CB-1CB3-B53B-BAAC163B0F35";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "A3BE08F3-477E-3EA1-8216-A5A217B491C7";
	setAttr ".v" no;
createNode transform -n "root_connector" -p "input";
	rename -uid "993AD3E4-4B34-14B1-45BA-42AB9578F608";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "13F60601-4A3E-6CB7-74DE-3A912093542A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "controls" -p "mod";
	rename -uid "632B4C41-4051-D23B-9599-F9967B7B7F98";
	setAttr ".ove" yes;
createNode transform -n "main_controls" -p "controls";
	rename -uid "282C6A5F-4110-AAD8-2EB2-518F74817338";
createNode transform -n "c_brow_group_2" -p "main_controls";
	rename -uid "371EEBE7-4C9E-195B-315A-2498D5FB3E1B";
createNode transform -n "c_brow_group" -p "c_brow_group_2";
	rename -uid "00F43210-4E5A-9894-2610-40927F00553E";
	setAttr ".rp" -type "double3" 0 4.4408920985006252e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".spt" -type "double3" 0 -9.8607613152626443e-32 0 ;
createNode transform -n "c_brow" -p "c_brow_group";
	rename -uid "50837CE5-42DD-7CA1-3805-4F816D96BC95";
	addAttr -ci true -sn "auto" -ln "auto" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -k on ".auto";
	setAttr -l on ".internalName" -type "string" "c_brow";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "c_browShape" -p "c_brow";
	rename -uid "59FF0BE2-4714-0379-C0E4-DA8686E49AA8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "r_brow_group" -p "main_controls";
	rename -uid "991D0DD8-42C1-F573-03AC-5CB98E10566D";
createNode transform -n "r_brow" -p "r_brow_group";
	rename -uid "6C6E4792-4926-167B-D4DD-AD82FD96B403";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "r_brow";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "r_browShape" -p "r_brow";
	rename -uid "641C074A-492A-A076-262E-D599348FD581";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".tw" yes;
createNode transform -n "r_brow_in_group" -p "r_brow";
	rename -uid "D62DF8D9-4A00-57D5-BC39-248AAFA2E9FA";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "r_brow_in" -p "r_brow_in_group";
	rename -uid "EC037899-400A-21F5-C0D3-15A48B5E6214";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "r_brow_in";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "r_brow_inShape" -p "r_brow_in";
	rename -uid "D793B791-41C2-8F9A-7B5F-13AF59B99515";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962030967 -0.00022758453962032354 0.00022758453962029579 -0.00022758453962032354 
		0.00022758453962028885 0.00022758453962029579 -0.00022758453962032354 0.00022758453962028885 
		0.00022758453962029579 0.00022758453962030967 -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962030967 0.00022758453962028885 0.00022758453962029579 0.00022758453962030967 
		0.00022758453962028885 -0.00022758453962033048 0.00022758453962030967 -0.00022758453962032354 
		-0.00022758453962033048 0.00022758453962030967 -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962030967 -0.00022758453962032354 -0.00022758453962033048 0.00022758453962030967 
		-0.00022758453962032354 -0.00022758453962033048 -0.00022758453962032354;
createNode transform -n "r_brow_in_loc" -p "r_brow_in";
	rename -uid "9AE58457-4F64-A533-76DD-8FAAA515FF23";
	setAttr ".v" no;
createNode locator -n "r_brow_in_locShape" -p "r_brow_in_loc";
	rename -uid "857B99FD-4052-A25C-FC84-8886484754CA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "r_brow_in_local_group" -p "r_brow_in";
	rename -uid "A699A81B-43FA-2F7E-1FD1-928C7F449292";
	setAttr ".rp" -type "double3" 0 4.4408920985006271e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".spt" -type "double3" 0 9.8607613152626519e-32 0 ;
createNode transform -n "r_brow_in_local" -p "r_brow_in_local_group";
	rename -uid "D4D6BEAA-4EF9-F1E8-1190-DAA12C43E624";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".middleFollow" 0.66666666635622585;
createNode nurbsCurve -n "r_brow_in_localShape" -p "r_brow_in_local";
	rename -uid "E7821543-4F53-80B1-B81D-F18E71C44398";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "r_brow_in_inner_1_target" -p "r_brow_in";
	rename -uid "9A0C595A-48B2-5E71-487E-CDAF1F3CB266";
	setAttr ".v" no;
createNode locator -n "r_brow_in_inner_1_targetShape" -p "r_brow_in_inner_1_target";
	rename -uid "9B744BE4-4E23-831B-6032-EEA1C55BF5DB";
	setAttr -k off ".v";
createNode transform -n "r_brow_c_target" -p "r_brow_in_group";
	rename -uid "8516138A-4CEC-3DFD-8468-7DB0E2EBAAFB";
	setAttr ".v" no;
	setAttr ".s" -type "double3" -1 1 1 ;
createNode locator -n "r_brow_c_targetShape" -p "r_brow_c_target";
	rename -uid "032FDDF4-437B-96E0-1AB9-199A5251917F";
	setAttr -k off ".v";
createNode transform -n "r_brow_mid_group" -p "r_brow";
	rename -uid "31B50C52-4035-1F94-C379-38BF084B3AC9";
	setAttr ".rp" -type "double3" -5.5511151231257827e-17 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" -5.5511151231257827e-17 4.4408920985006262e-16 0 ;
createNode transform -n "r_brow_mid" -p "r_brow_mid_group";
	rename -uid "B3654963-47D8-6665-3985-7FACB8FE05A5";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -5.5511151231257827e-17 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" -5.5511151231257827e-17 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "r_brow_mid";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "r_brow_midShape" -p "r_brow_mid";
	rename -uid "7753F789-4EF6-B5C4-EB6E-D6B688A60EAD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962030967 -0.00022758453962032354 0.00022758453962029579 -0.00022758453962032354 
		0.00022758453962028885 0.00022758453962029579 -0.00022758453962032354 0.00022758453962028885 
		0.00022758453962029579 0.00022758453962030967 -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962030967 0.00022758453962028885 0.00022758453962029579 0.00022758453962030967 
		0.00022758453962028885 -0.00022758453962033048 0.00022758453962030967 -0.00022758453962032354 
		-0.00022758453962033048 0.00022758453962030967 -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962030967 -0.00022758453962032354 -0.00022758453962033048 0.00022758453962030967 
		-0.00022758453962032354 -0.00022758453962033048 -0.00022758453962032354;
createNode transform -n "r_brow_mid_loc" -p "r_brow_mid";
	rename -uid "06386725-47C8-4B72-DDA6-D9AB42DC1BEA";
	setAttr ".v" no;
createNode locator -n "r_brow_mid_locShape" -p "r_brow_mid_loc";
	rename -uid "1F1A80F5-49AD-0E0E-9BD6-37B80E8A8F8B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "r_brow_mid_local_group" -p "r_brow_mid";
	rename -uid "BF434FE8-462F-5194-5A3A-D081599DC3EF";
	setAttr ".rp" -type "double3" 0 4.4408920985006281e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".spt" -type "double3" 0 1.9721522630525313e-31 0 ;
createNode transform -n "r_brow_mid_local" -p "r_brow_mid_local_group";
	rename -uid "85664AC8-4FE1-DA13-C106-37AEF5521855";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".middleFollow" 0.66666666635622585;
createNode nurbsCurve -n "r_brow_mid_localShape" -p "r_brow_mid_local";
	rename -uid "30DE5F4B-4116-4222-153F-5DACD000CC1F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "r_brow_mid_inner_1_target" -p "r_brow_mid";
	rename -uid "F3FBAF0B-4C63-4493-4F55-968BE9FB41F8";
	setAttr ".v" no;
createNode locator -n "r_brow_mid_inner_1_targetShape" -p "r_brow_mid_inner_1_target";
	rename -uid "4C40C2C7-4A24-506E-30F9-B1BB4487F892";
	setAttr -k off ".v";
createNode transform -n "r_brow_mid_outer_1_target" -p "r_brow_mid";
	rename -uid "715A3D91-4B81-B3CD-7A22-028A48654BFD";
	setAttr ".v" no;
createNode locator -n "r_brow_mid_outer_1_targetShape" -p "r_brow_mid_outer_1_target";
	rename -uid "0BF572A4-4A4D-F2E6-CA5A-4AB4A7ED0B1F";
	setAttr -k off ".v";
createNode transform -n "r_brow_out_group" -p "r_brow";
	rename -uid "4D88ADDE-4A8A-2605-38F0-138FF7EF3E9A";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 1.1102230246251563e-16 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 1.1102230246251563e-16 ;
createNode transform -n "r_brow_out" -p "r_brow_out_group";
	rename -uid "540714BB-4E50-AE8D-357B-3D9610C3720C";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 1.1102230246251563e-16 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 1.1102230246251563e-16 ;
	setAttr -l on ".internalName" -type "string" "r_brow_out";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "r_brow_outShape" -p "r_brow_out";
	rename -uid "58214EB6-4BC4-CEA4-D74A-C790D3C35233";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962032354 -0.00022758453962032354 0.00022758453962029579 -0.00022758453962033742 
		0.00022758453962028885 0.00022758453962029579 -0.00022758453962033742 0.00022758453962028885 
		0.00022758453962029579 0.00022758453962032354 -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962032354 0.00022758453962028885 0.00022758453962029579 0.00022758453962032354 
		0.00022758453962028885 -0.00022758453962033048 0.00022758453962032354 -0.00022758453962032354 
		-0.00022758453962033048 0.00022758453962032354 -0.00022758453962032354 0.00022758453962029579 
		0.00022758453962032354 -0.00022758453962032354 -0.00022758453962033048 0.00022758453962032354 
		-0.00022758453962032354 -0.00022758453962033048 -0.00022758453962033742;
createNode transform -n "r_brow_out_loc" -p "r_brow_out";
	rename -uid "3173CEF5-4EF3-2991-788C-0499B45B4700";
	setAttr ".v" no;
createNode locator -n "r_brow_out_locShape" -p "r_brow_out_loc";
	rename -uid "BF48D34B-4992-823D-3232-E3A8A3A1BAF5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "r_brow_out_local_group" -p "r_brow_out";
	rename -uid "6E63F2CC-429C-5FA0-8F61-CDADBEFB2B5E";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "r_brow_out_local" -p "r_brow_out_local_group";
	rename -uid "805BFEF0-46D3-49B6-4FEF-E5944741939C";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".middleFollow" 0.66666666635622585;
createNode nurbsCurve -n "r_brow_out_localShape" -p "r_brow_out_local";
	rename -uid "F05926C8-4E2C-1099-07E8-5BB4B35B8B70";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "r_brow_out_outer_1_target" -p "r_brow_out";
	rename -uid "FBF7B125-498D-46F8-EA59-29A2D30FE0C7";
	setAttr ".v" no;
createNode locator -n "r_brow_out_outer_1_targetShape" -p "r_brow_out_outer_1_target";
	rename -uid "111BD068-4EBB-C067-0126-078CB5061564";
	setAttr -k off ".v";
createNode transform -n "r_brow_inner_1_group" -p "r_brow";
	rename -uid "CA61A920-4983-9443-312B-E0BD9831972D";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "r_brow_inner_1" -p "r_brow_inner_1_group";
	rename -uid "4EBDFEAF-4E3C-7E60-54CD-C79757934378";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "r_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "r_brow_inner_1Shape" -p "r_brow_inner_1";
	rename -uid "196FE170-4445-3FEB-4065-6A8E30A27967";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "r_brow_inner_1_loc" -p "r_brow_inner_1";
	rename -uid "ED4D6783-4E91-EAED-D890-FFBB179E04C6";
	setAttr ".v" no;
createNode locator -n "r_brow_inner_1_locShape" -p "r_brow_inner_1_loc";
	rename -uid "208C6BBF-4334-AF96-2241-94BD57B1EEB2";
	setAttr -k off ".v";
createNode transform -n "r_brow_outer_1_group" -p "r_brow";
	rename -uid "82AF6E9F-4D50-1E5D-AE50-48B76B8D91CE";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "r_brow_outer_1" -p "r_brow_outer_1_group";
	rename -uid "4B17B554-43D8-81C3-5932-21B5C765BBD1";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "r_brow_outer_1";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "r_brow_outer_1Shape" -p "r_brow_outer_1";
	rename -uid "26A2B01D-4617-889B-8944-428BD35404D4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "r_brow_outer_1_loc" -p "r_brow_outer_1";
	rename -uid "9723E0AD-427C-7E15-240C-B281D5DDD7D5";
	setAttr ".v" no;
createNode locator -n "r_brow_outer_1_locShape" -p "r_brow_outer_1_loc";
	rename -uid "FBB47E81-4261-54CA-F0C5-EDA44C91F0ED";
	setAttr -k off ".v";
createNode transform -n "l_brow_group" -p "main_controls";
	rename -uid "063F232E-4316-E47A-E9B0-BB91A2E87A2D";
createNode transform -n "l_brow" -p "l_brow_group";
	rename -uid "B6265C6C-4563-6578-7316-139F3DD0EF86";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "l_brow";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "l_browShape" -p "l_brow";
	rename -uid "7CD0D145-4753-6415-DC9C-01B88AE6E384";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 1 1 1 2 3 3 3
		5
		-0.50297991580437584 0.18946183105219089 0.040015486481214661
		-0.32756937937721975 0.24044294662012855 0.10636093733228692
		0.0092734848259580227 0.31901834113349864 0.14963551235873693
		0.38479941830454351 0.2667464732528339 0.033640053823917798
		0.57034063521270995 0.17662161771976759 -0.12701225459803353
		;
createNode transform -n "l_brow_in_group" -p "l_brow";
	rename -uid "105A9C2E-41CA-9299-14A2-E8870DDDC63E";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "l_brow_in" -p "l_brow_in_group";
	rename -uid "37E6D66E-420A-4B78-4A97-AFA5F075F5BC";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_in";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "l_brow_inShape" -p "l_brow_in";
	rename -uid "C6531CFA-4A2F-EB8A-BADA-6ABADECC8379";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.1202037051874579 0.12020370518746669 0.30515632059232162
		4.6435952512858919e-18 0.16999371012360967 0.30515632059232162
		-0.1202037051874575 0.12020370518746669 0.30515632059232162
		-0.16999371012360032 9.5556358332231476e-15 0.30515632059232156
		-0.12020370518745783 -0.12020370518744881 0.30515632059232156
		-2.7184577522721789e-17 -0.16999371012359116 0.30515632059232156
		0.12020370518745729 -0.12020370518744881 0.30515632059232156
		0.1699937101236004 9.4150719556161767e-15 0.30515632059232156
		0.1202037051874579 0.12020370518746669 0.30515632059232162
		4.6435952512858919e-18 0.16999371012360967 0.30515632059232162
		-0.1202037051874575 0.12020370518746669 0.30515632059232162
		;
createNode transform -n "l_brow_in_loc" -p "l_brow_in";
	rename -uid "204BF06F-4067-549C-6471-609722A895FB";
	setAttr ".v" no;
createNode locator -n "l_brow_in_locShape" -p "l_brow_in_loc";
	rename -uid "F253FB1C-42B0-85AE-7EF6-E69715A85DC8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "l_brow_in_local_group" -p "l_brow_in";
	rename -uid "12A1D2B0-4F75-D374-CCD0-E79AD738EE04";
	setAttr ".rp" -type "double3" 0 4.4408920985006252e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".spt" -type "double3" 0 -9.8607613152626432e-32 0 ;
createNode transform -n "l_brow_in_local" -p "l_brow_in_local_group";
	rename -uid "1B02410C-419D-2575-B7BD-8792B8DC3219";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".middleFollow" 0.66666666635622585;
createNode nurbsCurve -n "l_brow_in_localShape" -p "l_brow_in_local";
	rename -uid "288BA0AD-487E-7DC1-985D-5E997935DD77";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "l_brow_in_inner_1_target" -p "l_brow_in";
	rename -uid "58B8A35C-4A51-36B0-0A6B-DBA3B80860ED";
	setAttr ".v" no;
createNode locator -n "l_brow_in_inner_1_targetShape" -p "l_brow_in_inner_1_target";
	rename -uid "B2090443-4970-32BB-56F8-4CAE10CDE47C";
	setAttr -k off ".v";
createNode transform -n "l_brow_c_target" -p "l_brow_in_group";
	rename -uid "69B4E8EE-48B5-B9BC-870D-D1BB4EAF9278";
	setAttr ".v" no;
createNode locator -n "l_brow_c_targetShape" -p "l_brow_c_target";
	rename -uid "6211951A-42AB-B6A1-F7FC-4EB26C213470";
	setAttr -k off ".v";
createNode transform -n "l_brow_mid_group" -p "l_brow";
	rename -uid "BDFF4A54-4BEC-D1F9-4E92-998DE5D65C55";
	setAttr ".rp" -type "double3" -5.5511151231257827e-17 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" -5.5511151231257827e-17 4.4408920985006262e-16 0 ;
createNode transform -n "l_brow_mid" -p "l_brow_mid_group";
	rename -uid "125D8965-4C98-D0A1-5313-169E8BC1176D";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" -5.5511151231257827e-17 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" -5.5511151231257827e-17 -4.4408920985006262e-16 0 ;
	setAttr ".mnsl" -type "double3" 0.01 -1 -1 ;
	setAttr -l on ".internalName" -type "string" "l_brow_mid";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "l_brow_midShape" -p "l_brow_mid";
	rename -uid "BBBED04C-4430-12B4-42C0-8BBFEA70445E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.1202037051874579 0.12020370518746669 0.30515632059232162
		4.6435952512858919e-18 0.16999371012360967 0.30515632059232162
		-0.1202037051874575 0.12020370518746669 0.30515632059232162
		-0.16999371012360032 9.5556358332231476e-15 0.30515632059232156
		-0.12020370518745783 -0.12020370518744881 0.30515632059232156
		-2.7184577522721789e-17 -0.16999371012359116 0.30515632059232156
		0.12020370518745729 -0.12020370518744881 0.30515632059232156
		0.1699937101236004 9.4150719556161767e-15 0.30515632059232156
		0.1202037051874579 0.12020370518746669 0.30515632059232162
		4.6435952512858919e-18 0.16999371012360967 0.30515632059232162
		-0.1202037051874575 0.12020370518746669 0.30515632059232162
		;
createNode transform -n "l_brow_mid_loc" -p "l_brow_mid";
	rename -uid "2F8B829D-418B-4663-8615-FA868A50AEDA";
	setAttr ".v" no;
createNode locator -n "l_brow_mid_locShape" -p "l_brow_mid_loc";
	rename -uid "7539BC04-4DD0-C30D-8438-B88856AFFFAA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "l_brow_mid_local_group" -p "l_brow_mid";
	rename -uid "AD0C059D-4331-80CA-6C92-568320AB0267";
	setAttr ".rp" -type "double3" 0 4.4408920985006247e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".spt" -type "double3" 0 -1.4791141972893969e-31 0 ;
createNode transform -n "l_brow_mid_local" -p "l_brow_mid_local_group";
	rename -uid "73AEDB54-44A0-F638-2F7D-0DBDBB8A8892";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".middleFollow" 0.66666666635622585;
createNode nurbsCurve -n "l_brow_mid_localShape" -p "l_brow_mid_local";
	rename -uid "6D02B45B-4880-B394-90D1-FEA11BD4C6EC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "l_brow_mid_inner_1_target" -p "l_brow_mid";
	rename -uid "966CA8CD-4E26-8C64-30AB-2A83DD52B5B9";
	setAttr ".v" no;
createNode locator -n "l_brow_mid_inner_1_targetShape" -p "l_brow_mid_inner_1_target";
	rename -uid "9526DAD7-45CE-B99C-B868-A8ADFE78DF02";
	setAttr -k off ".v";
createNode transform -n "l_brow_mid_outer_1_target" -p "l_brow_mid";
	rename -uid "AB04D377-4B88-059B-F4D1-E288CBC348A4";
	setAttr ".v" no;
createNode locator -n "l_brow_mid_outer_1_targetShape" -p "l_brow_mid_outer_1_target";
	rename -uid "0E90B6A0-43F8-CE97-E842-998BF28616A8";
	setAttr -k off ".v";
createNode transform -n "l_brow_out_group" -p "l_brow";
	rename -uid "6740CB48-4F91-CB8F-15D9-C8B3338402D1";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 1.1102230246251563e-16 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 1.1102230246251563e-16 ;
createNode transform -n "l_brow_out" -p "l_brow_out_group";
	rename -uid "15ECD0DE-4B0F-31A5-1F71-4E9549FF1D54";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 1.1102230246251563e-16 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 1.1102230246251563e-16 ;
	setAttr -l on ".internalName" -type "string" "l_brow_out";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "l_brow_outShape" -p "l_brow_out";
	rename -uid "6E46576D-44F4-A145-4E25-56B35BFBE559";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.1202037051874579 0.12020370518746669 0.30515632059232162
		4.6435952512858919e-18 0.16999371012360967 0.30515632059232162
		-0.1202037051874575 0.12020370518746669 0.30515632059232162
		-0.16999371012360032 9.5556358332231476e-15 0.30515632059232156
		-0.12020370518745783 -0.12020370518744881 0.30515632059232156
		-2.7184577522721789e-17 -0.16999371012359116 0.30515632059232156
		0.12020370518745729 -0.12020370518744881 0.30515632059232156
		0.1699937101236004 9.4150719556161767e-15 0.30515632059232156
		0.1202037051874579 0.12020370518746669 0.30515632059232162
		4.6435952512858919e-18 0.16999371012360967 0.30515632059232162
		-0.1202037051874575 0.12020370518746669 0.30515632059232162
		;
createNode transform -n "l_brow_out_loc" -p "l_brow_out";
	rename -uid "5C667B61-46ED-B9CF-B0BD-0FB22E5C8E3F";
	setAttr ".v" no;
createNode locator -n "l_brow_out_locShape" -p "l_brow_out_loc";
	rename -uid "0ADE35FE-4FF0-5992-3AAA-74B4E56231BB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "l_brow_out_local_group" -p "l_brow_out";
	rename -uid "2E8DC802-4F11-7BAF-DDEA-A2B040C63D35";
	setAttr ".rp" -type "double3" 0 4.4408920985006281e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".spt" -type "double3" 0 1.9721522630525313e-31 0 ;
createNode transform -n "l_brow_out_local" -p "l_brow_out_local_group";
	rename -uid "E2C4B1D8-48C1-8FDC-B7EE-E988780B17F2";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".middleFollow" 0.66666666635622585;
createNode nurbsCurve -n "l_brow_out_localShape" -p "l_brow_out_local";
	rename -uid "F8A973F0-4CB9-5A04-6A9B-CD9E7FB9C33B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "l_brow_out_outer_1_target" -p "l_brow_out";
	rename -uid "A1C86CAD-49F8-E898-B300-2DBA1B408265";
	setAttr ".v" no;
createNode locator -n "l_brow_out_outer_1_targetShape" -p "l_brow_out_outer_1_target";
	rename -uid "966ED437-4815-49EE-124E-90B771D1E51F";
	setAttr -k off ".v";
createNode transform -n "l_brow_inner_1_group" -p "l_brow";
	rename -uid "A8DCE5DF-4371-6FBF-0A2C-CB8F436D066B";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "l_brow_inner_1" -p "l_brow_inner_1_group";
	rename -uid "1CABE4A3-425B-B24D-4B6A-B08BD58F078A";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_inner_1";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "l_brow_inner_1Shape" -p "l_brow_inner_1";
	rename -uid "76326D8E-45B9-42B8-AAA3-21AFA22CDE08";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "l_brow_inner_1_loc" -p "l_brow_inner_1";
	rename -uid "601DE8D6-4342-6398-2D42-8A93AB0E4398";
	setAttr ".v" no;
createNode locator -n "l_brow_inner_1_locShape" -p "l_brow_inner_1_loc";
	rename -uid "702A6458-4C7E-A0F4-3B89-B688EC099E09";
	setAttr -k off ".v";
createNode transform -n "l_brow_outer_1_group" -p "l_brow";
	rename -uid "690B095B-40D5-2603-6CCA-9A8FE952AC81";
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-16 0 ;
createNode transform -n "l_brow_outer_1" -p "l_brow_outer_1_group";
	rename -uid "BDA132B5-47E0-346C-CB5B-E2A34A146F77";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "middleFollow" -ln "middleFollow" -dv 0.5 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr -l on ".internalName" -type "string" "l_brow_outer_1";
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "l_brow_outer_1Shape" -p "l_brow_outer_1";
	rename -uid "A4A96FA6-4B86-3C6B-00E2-178C3659BE02";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		-0.085482539501600854 4.5104754938844094e-15 0.22994650959522026
		-0.090577912312671538 -0.090577912312664863 0.22994650959522026
		-1.366995708388733e-17 -0.085482539501596483 0.22994650959522026
		0.090577912312671233 -0.090577912312664863 0.22994650959522026
		0.08548253950160091 4.4397919538210773e-15 0.22994650959522026
		0.090577912312671593 0.09057791231267831 0.22994650959522031
		2.3350647162702524e-18 0.085482539501605406 0.22994650959522031
		-0.090577912312671399 0.09057791231267831 0.22994650959522031
		;
createNode transform -n "l_brow_outer_1_loc" -p "l_brow_outer_1";
	rename -uid "3419BC93-46D0-F71E-DDCE-85BF87A16F4B";
	setAttr ".v" no;
createNode locator -n "l_brow_outer_1_locShape" -p "l_brow_outer_1_loc";
	rename -uid "8FD42BA6-4936-E739-C060-4AA154EE3321";
	setAttr -k off ".v";
createNode transform -n "system" -p "mod";
	rename -uid "F6553DA7-45F2-BDEC-5B30-23BC9C870385";
	setAttr ".v" no;
createNode transform -n "l_curve" -p "system";
	rename -uid "FE655977-481E-ACD9-14D8-888682932231";
createNode nurbsCurve -n "l_curveShape" -p "l_curve";
	rename -uid "F41E8D00-4CB3-6ED2-CCF6-3FAEA9A0AF2A";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 0.5 1 1 1
		5
		0.66241828706485117 0.52812899827377313 0.027108683494578928
		1.1860962650193243 0.63065605042160588 0.050343985355431373
		1.7097742429737977 0.73318310256943875 0.073579287216283817
		2.1263450034169242 0.70185827147100199 0.068371530056202098
		2.5429157638600506 0.67053344037256513 0.063163772896120379
		;
createNode transform -n "r_curve" -p "system";
	rename -uid "1551AA32-4D52-8C29-BB7B-E481F4E95623";
createNode nurbsCurve -n "r_curveShape" -p "r_curve";
	rename -uid "A232DE82-42F3-0F21-6644-1ABCB9671011";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 0.5 1 1 1
		5
		-0.66241828706485117 0.52812899827377313 0.027108683494578928
		-1.1860962650193243 0.63065605042160588 0.050343985355431373
		-1.7097742429737977 0.73318310256943875 0.073579287216283817
		-2.1263450034169242 0.70185827147100199 0.068371530056202098
		-2.5429157638600506 0.67053344037256513 0.063163772896120379
		;
createNode transform -n "output" -p "mod";
	rename -uid "C2F88741-43EE-BE81-4EB7-FD8B492D7EEC";
createNode transform -n "outJoints" -p "output";
	rename -uid "5E11242E-417B-5516-0B46-EEA493A9091D";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "94B2D016-4CAB-BDDC-F22D-47B8FC4FBDD2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ds" 2;
createNode joint -n "c_outJoint" -p "root_outJoint";
	rename -uid "16B21932-4A27-64F8-2847-779AE1038419";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0.5736745148643263 0.1569921212627855 1;
	setAttr ".ds" 2;
createNode joint -n "l_0_outJoint" -p "root_outJoint";
	rename -uid "667FA4F1-4F0C-3733-44BB-519AD410E912";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode joint -n "l_1_outJoint" -p "root_outJoint";
	rename -uid "0C92A33E-4713-588E-4B0C-738FE1763950";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos" 0.2;
createNode joint -n "l_2_outJoint" -p "root_outJoint";
	rename -uid "68A41EF9-49BB-0F78-ECB4-6F9EE1C45941";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos" 0.4;
createNode joint -n "l_3_outJoint" -p "root_outJoint";
	rename -uid "32B261D8-4F95-EC3B-BDBB-CCA89B047A58";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos" 0.60000000000000009;
createNode joint -n "l_4_outJoint" -p "root_outJoint";
	rename -uid "04C98538-4194-E414-E88A-88A6F549852A";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos" 0.8;
createNode joint -n "l_5_outJoint" -p "root_outJoint";
	rename -uid "A6E6CA8E-42D1-BFF9-4E6B-75ADFD068C84";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos" 1;
createNode joint -n "r_0_outJoint" -p "root_outJoint";
	rename -uid "D252629C-424A-D607-D30C-6CAEBE3BFD4D";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode joint -n "r_1_outJoint" -p "root_outJoint";
	rename -uid "5D59088F-4ECD-AA20-6DF2-D391BDA87EB6";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode joint -n "r_2_outJoint" -p "root_outJoint";
	rename -uid "D636C098-4C46-36E5-1C35-E3AEF536F09C";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode joint -n "r_3_outJoint" -p "root_outJoint";
	rename -uid "07E4B5E7-43B6-9F39-938D-B3A6395ADC0F";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode joint -n "r_4_outJoint" -p "root_outJoint";
	rename -uid "37ABDEF5-4848-158C-D2F8-09AF86BEB550";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode joint -n "r_5_outJoint" -p "root_outJoint";
	rename -uid "A8616C20-4A57-9136-78FB-1C862959849F";
	addAttr -ci true -k true -sn "pos" -ln "pos" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr -k on ".pos";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "47884928-4C73-DAE7-1F0D-DD921B579773";
	setAttr -s 19 ".lnk";
	setAttr -s 19 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "9EB6CF66-41A4-B854-2847-7988BFA4D427";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "2F3C0D61-441E-3576-E07D-B8BF42036D59";
createNode displayLayerManager -n "layerManager";
	rename -uid "9D7C63A8-415F-8EEA-F239-849C3770DE52";
createNode displayLayer -n "defaultLayer";
	rename -uid "BB18FECB-43E6-C40C-18F5-9AB4D312659A";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "0FD01DD0-4830-55FD-CEE5-1D9720F5A75E";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "EDBBC28A-48D7-D2E1-C0AB-CF9D21BFC4EF";
	setAttr ".g" yes;
createNode objectSet -n "sets";
	rename -uid "62837113-455A-D770-A1FD-F0A1FA9FCF40";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode hyperView -n "hyperView1";
	rename -uid "1CE91D06-46C0-E715-54C3-36AB7007BE4C";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	rename -uid "E1081D1E-4FE6-43E8-EB1E-8FA372B34F94";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView2";
	rename -uid "45A670EE-4C84-9E68-9AAE-978600A69297";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout2";
	rename -uid "01DC341A-469E-BE80-5102-77B8CA84FDF1";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView3";
	rename -uid "FBC5F479-472D-5315-E91A-279D3C607966";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout3";
	rename -uid "A9D2F9CF-4A05-2607-0AAA-DB8CC317D9E1";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView4";
	rename -uid "FEBFC6FE-446A-7EA1-A851-6F8A7897C0FB";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout4";
	rename -uid "E9906872-43C4-2CA4-0E07-FD9C414CB244";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode decomposeMatrix -n "c_brow_skinJoint_decMat";
	rename -uid "2655B0F2-4907-7E27-0BCC-1298AA8216D8";
createNode multMatrix -n "l_brow_1_xform_multMat";
	rename -uid "BE4148E5-4291-9A2D-680C-60B4DC615106";
	setAttr -s 2 ".i";
createNode objectSet -n "skinJointsSet";
	rename -uid "0DA7306F-47E3-A574-C562-58835D15FCFC";
	setAttr ".ihi" 0;
createNode groupId -n "cluster4GroupId";
	rename -uid "255F5B6B-495E-B578-9759-EAA463C49BEA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "cluster4Set";
	rename -uid "F3947B66-4F92-96E8-13F3-6DAE7BCEA494";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "7328221A-4A08-FE54-E146-60A5CC92C161";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "78D228C6-4B08-1A0F-C854-48A7AC4309B4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "";
createNode tweak -n "tweak24";
	rename -uid "9879F924-4C50-96FA-7291-B88C61E56BF5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "tweakSet24";
	rename -uid "068CB1E9-44C1-0F19-4D08-CC8DDBA0DFBC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "groupId42";
	rename -uid "915FA917-45FB-C33A-B9E9-ABBFCEFEC6E2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupParts -n "groupParts42";
	rename -uid "5AEAE1DA-4D6F-9BAE-776E-93BA5782783B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "";
createNode surfaceShader -n "red_rsMat";
	rename -uid "C59E6D9F-406C-9272-552F-8C80A4065018";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".oc" -type "float3" 0.63 0.22995001 0.22995001 ;
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "red_rsSG";
	rename -uid "1180BCD3-4A7A-749A-B6F7-D1B38AE5C26E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo1";
	rename -uid "751B5015-4906-F205-FD43-8E8D749F9277";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode surfaceShader -n "green_rsMat";
	rename -uid "B75C0565-4D9D-322C-E643-468211FDADDA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".oc" -type "float3" 0.230864 0.61400002 0.230864 ;
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "green_rsSG";
	rename -uid "8E2AC1EF-430B-58B6-3849-CDBC1598D3D2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo2";
	rename -uid "5B1B4EDF-4064-2767-CA10-0880F4396023";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode surfaceShader -n "blue_rsMat";
	rename -uid "D8BE4577-400D-E465-5F77-0A821018E1A1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".oc" -type "float3" 0.24190001 0.24190001 0.58999997 ;
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "blue_rsSG";
	rename -uid "7E6383F1-4450-A19F-E86C-238D7FB01832";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo3";
	rename -uid "853DFDBA-407E-5B30-5420-90B10F3B6AFA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode groupId -n "side___cluster4GroupId";
	rename -uid "93DE8F75-443D-4BDF-7E5A-CDB2FBC99E8E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "side__";
createNode objectSet -n "side___cluster4Set";
	rename -uid "87799305-4911-B6E8-FF8C-D9AC3A8BFBAE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "side__";
createNode cluster -n "side_mainPoser_clusterHandleCluster";
	rename -uid "AA5E3FBE-4D10-33E9-0D79-1BA8437AB2EA";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "side___cluster4GroupParts";
	rename -uid "53691535-4CC7-F659-EB32-1591C08A0BBB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "side__";
createNode tweak -n "side___tweak24";
	rename -uid "152CB67D-4F38-67D8-CBAB-F5BC4C4D9D06";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "side__";
createNode objectSet -n "side___tweakSet24";
	rename -uid "2FB83011-4D4D-AF26-AF84-6F9EB23C572A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "side__";
createNode groupId -n "side___groupId42";
	rename -uid "040A51C4-494C-233D-7680-FCA524F7C215";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "side__";
createNode groupParts -n "side___groupParts42";
	rename -uid "66085E4C-45DC-0AB5-B4BE-42AAC84F4DE0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "side__";
createNode shadingEngine -n "center_surfaceShader1SG";
	rename -uid "D4E89655-4AD9-9CEE-094F-D893AE0AE3A3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "center";
createNode materialInfo -n "center_materialInfo1";
	rename -uid "0EC42662-4BB6-3F23-4B43-138EF1277A95";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode shadingEngine -n "center_surfaceShader2SG";
	rename -uid "D6205713-4F3C-1644-2024-8D9E30ED60EA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "center";
createNode materialInfo -n "center_materialInfo2";
	rename -uid "3F2DE269-464F-0A6F-315C-D0B399F20AC5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode shadingEngine -n "center_surfaceShader3SG";
	rename -uid "A6F9B7C7-4F6F-3501-CB07-67BB44E97681";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "center";
createNode materialInfo -n "center_materialInfo3";
	rename -uid "C0CA2DFB-4A66-6002-621A-129F38C2C5A7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode shadingEngine -n "side_1_surfaceShader1SG";
	rename -uid "55F01F5E-4A87-620F-7328-D1878508A794";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode materialInfo -n "side_1_materialInfo1";
	rename -uid "A077BE7E-41B5-E3BF-997E-66A56AF7994B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode shadingEngine -n "side_1_surfaceShader2SG";
	rename -uid "2F5E55EA-49CA-D208-6AA0-049D68F9C7E2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode materialInfo -n "side_1_materialInfo2";
	rename -uid "5A4BE1E4-4F1F-220F-DAE4-7F8A0595FAB7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode shadingEngine -n "side_1_surfaceShader3SG";
	rename -uid "C707C887-4084-901E-7804-5683178C1DC8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode materialInfo -n "side_1_materialInfo3";
	rename -uid "F1E9A569-442A-A59E-318E-ACB8A15621BF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode shadingEngine -n "side_2_surfaceShader1SG";
	rename -uid "A725294C-4AC8-D8EC-E574-919A537E1D98";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo1";
	rename -uid "E333AB29-4599-4463-AA12-7B8C859BCAD9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_2_surfaceShader2SG";
	rename -uid "457E8898-4CC8-FDF7-C5AC-B9BB0B2C3A1B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo2";
	rename -uid "A5E18274-4E8C-F50F-4DE4-ECB499F8D8C0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_2_surfaceShader3SG";
	rename -uid "D16B60EF-4E95-BA1E-7E31-27B6E06D79B3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo3";
	rename -uid "B09C3D31-41A8-0095-F1DE-89BE31F20488";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_3_surfaceShader1SG";
	rename -uid "F6DAF3EE-49DA-A28C-42A9-1D8D251E858A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo1";
	rename -uid "2C972315-4EF2-D612-D784-16A266A479A6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode shadingEngine -n "side_3_surfaceShader2SG";
	rename -uid "E080B916-472D-96BD-F263-4CBED7FF18F1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo2";
	rename -uid "E7B5C385-4C90-3210-CE08-8BAFECE95138";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode shadingEngine -n "side_3_surfaceShader3SG";
	rename -uid "341FDCB3-43DF-4D13-10B0-F6BB1EEB9541";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo3";
	rename -uid "1023B3CB-4629-A454-32B2-4A9F0714C62C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode surfaceShader -n "black_rsMat";
	rename -uid "06825D03-4BF0-70B5-1490-96A68BBAD29D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "black_rsSG";
	rename -uid "511B660D-4BA6-9DA0-B498-5C94E00F73B7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo4";
	rename -uid "5917AAE3-4E94-3395-15EC-9BA3D0705719";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_3_surfaceShader1SG1";
	rename -uid "66D8707C-46BD-5EE7-E079-5A827FACE5D1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo4";
	rename -uid "5898B645-4E2A-5762-4A87-2EBB153E121E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode multMatrix -n "multMatrix3";
	rename -uid "5F492BE7-49F7-B835-7809-38B1368843DC";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix81";
	rename -uid "129E6E85-4C01-6B78-71FF-2F9E238A72EF";
createNode decomposeMatrix -n "decomposeMatrix82";
	rename -uid "8E42E1D3-4EFC-6945-F557-A2A2F11E042F";
createNode multMatrix -n "multMatrix4";
	rename -uid "7AA05AE6-4C3E-D241-2317-97A2439C5D50";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "r_brow_controlInitLoc_decMat";
	rename -uid "A7D81CC6-4D15-01E0-C5E2-9CB0138FE689";
createNode multMatrix -n "r_brow_controlInitLoc_multMat";
	rename -uid "C00411F1-43E8-B15A-75E5-2998940B6186";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix1";
	rename -uid "6BF8F175-45AA-FC90-52CE-42A84CAE4B5C";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode multMatrix -n "multMatrix11";
	rename -uid "467DE00E-4411-C792-EFA6-6D88CFBC259F";
	setAttr -s 2 ".i";
createNode multiplyDivide -n "multiplyDivide2";
	rename -uid "60F431ED-47E0-D1AC-D75E-EF8F42DFB937";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "C09F3704-4CDE-CFFE-5788-F7BAA76E4F31";
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "F924F563-42F3-2594-4F1C-F9B2AE670B38";
createNode makeNurbSphere -n "makeNurbSphere4";
	rename -uid "4564CA61-451B-7C8D-CE2A-CC8BA0A024DC";
createNode makeNurbSphere -n "makeNurbSphere5";
	rename -uid "925F9227-4416-1F31-D227-21A202D947EC";
createNode multiplyDivide -n "multiplyDivide4";
	rename -uid "09421D1F-444E-6E35-BA8C-C5A3123A6D27";
	setAttr ".i1" -type "float3" 0.1 0.1 0.1 ;
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "CF92629F-4B92-3FFA-723C-C497899E3DD7";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode multMatrix -n "multMatrix12";
	rename -uid "0C769F20-42B0-5DC1-4003-19A1EE13F2C6";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix83";
	rename -uid "58F8F51F-4D20-BF51-7122-22A7B8099ECF";
createNode makeNurbSphere -n "middle_makeNurbSphere";
	rename -uid "17ADD467-4683-EBD8-E76D-E8857B1759EB";
createNode multDoubleLinear -n "middle_size_multDoubleLinear";
	rename -uid "8C4748AC-4214-D540-3ADC-87944674D8A5";
createNode makeNurbSphere -n "out_makeNurbSphere";
	rename -uid "8334AC88-482D-734B-6DBB-CF835BF48A6F";
createNode multDoubleLinear -n "out_size_multDoubleLinear";
	rename -uid "23440147-4ED0-DE44-801B-47AD33349B31";
createNode multMatrix -n "multMatrix2";
	rename -uid "FF6311B4-48FD-4171-D89F-878BABA7D394";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix13";
	rename -uid "29D03BBC-486C-1D58-7B7A-C3A5AC297B12";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix2";
	rename -uid "58EDC4EC-45DA-4910-14FF-D199387A5DAE";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode multMatrix -n "l_brow_3_xform_multMat1";
	rename -uid "55815C05-492C-A042-78CF-8380C5E6E46D";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_brow_1_xform_multMat1";
	rename -uid "ABABDBE6-4BF1-4BDD-A22C-1CA272D11ACC";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix1";
	rename -uid "CDA20E71-4EBF-3D21-77D0-40977E3ABC4B";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix14";
	rename -uid "D05B8320-4C3E-1ADD-0BE7-CC9F40043FDC";
createNode multMatrix -n "multMatrix15";
	rename -uid "D1A40414-4F91-DD4D-42BD-2083C452EA45";
createNode multMatrix -n "multMatrix16";
	rename -uid "8D5BC622-40CF-79FA-5328-BAB168ACB1F4";
createNode multMatrix -n "multMatrix17";
	rename -uid "0FB17F99-4A0F-883C-4E0D-69BE32AF10CC";
createNode multMatrix -n "multMatrix18";
	rename -uid "E32B3661-4780-4C3A-2F81-98AF02293589";
createNode multMatrix -n "multMatrix19";
	rename -uid "31FC1E06-4144-10C3-4433-BF9B8CCE6492";
createNode multMatrix -n "multMatrix20";
	rename -uid "5DC31010-425A-C6BB-F718-DC85559179E9";
createNode multMatrix -n "multMatrix21";
	rename -uid "9400CC48-490E-F07A-0A07-2AA0031CAD4F";
createNode multMatrix -n "multMatrix22";
	rename -uid "231EA56A-4481-EB89-67B5-7AA1B8083EA9";
createNode multMatrix -n "multMatrix23";
	rename -uid "291CD2A2-4894-0197-7A33-4AB7390F7A36";
createNode multMatrix -n "multMatrix24";
	rename -uid "773EC029-45CC-117A-0F55-2181C5999415";
createNode multMatrix -n "multMatrix25";
	rename -uid "9747C9B6-442B-D3C9-31D5-B096B235D7C6";
createNode multMatrix -n "multMatrix26";
	rename -uid "091D9927-470C-2E65-6F0B-E3A9F2230AED";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix8";
	rename -uid "CB692D2C-48DF-AADD-ADC6-2D88A14450CC";
	setAttr ".env" 0.5;
createNode dagPose -n "bindPose1";
	rename -uid "50126D0C-499D-2036-6187-94B1EC7E0760";
	setAttr -s 5 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 5 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0.5736745148643263 0.1569921212627855 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr -s 5 ".g[0:4]" yes yes yes yes no;
	setAttr ".bp" yes;
createNode multiplyDivide -n "multiplyDivide5";
	rename -uid "83FAA972-403E-C81B-B0AC-008805FBD052";
	setAttr ".op" 2;
	setAttr ".i1" -type "float3" 1 1 1 ;
createNode animCurveTA -n "l_brow_mid_rotateX";
	rename -uid "B24E86AB-4403-34BA-E130-8C911FD4AF75";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "l_brow_mid_rotateY";
	rename -uid "1C037537-4AE9-FD70-7149-B39D5B54E462";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "l_brow_mid_rotateZ";
	rename -uid "8C80CB2E-4C91-A214-8D9A-D88591DB4C9F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "l_brow_mid_scaleX";
	rename -uid "349B0188-40D5-DA4C-374A-A291F1AC49F5";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 51 -0.26688592583765558;
createNode animCurveTU -n "l_brow_mid_scaleY";
	rename -uid "67452593-4D2F-7C25-D94A-D984A4421084";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "l_brow_mid_scaleZ";
	rename -uid "206F5B70-477D-829A-7DBC-C5A5EFAB462B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode controller -n "c_brow_tag";
	rename -uid "C73DD9C1-4062-B805-6F97-D4846AEF1FDB";
createNode controller -n "r_brow_tag";
	rename -uid "A03E3A16-411B-8F45-F1EE-10A7C9B34349";
createNode controller -n "r_brow_in_tag";
	rename -uid "7953CEBD-4D3A-AABB-C765-39896DF2E621";
createNode controller -n "r_brow_mid_tag";
	rename -uid "2AAF5DBC-4D53-0258-F83D-91AE3DA7FDED";
createNode controller -n "r_brow_out_tag";
	rename -uid "A58D6BF7-451F-BD4E-7AA9-E8A45AF0F3C9";
createNode controller -n "l_brow_tag";
	rename -uid "1043AFAA-4929-A262-F649-31ACD57769C6";
createNode controller -n "l_brow_in_tag";
	rename -uid "F550B2CA-40B7-1385-2FDD-208BF3E934D8";
createNode controller -n "l_brow_mid_tag";
	rename -uid "F18098BF-427B-F299-FBCE-D4BF79648E16";
createNode controller -n "l_brow_out_tag";
	rename -uid "6D959E28-4283-D624-E85D-C68FE8E2CCDF";
createNode motionPath -n "l_0_motionPath";
	rename -uid "85381007-4EF2-656E-0F80-2B85EACF8260";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "l_1_motionPath";
	rename -uid "A82FD94B-4A3A-FBCB-0DFD-03B7F15722BC";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "l_2_motionPath";
	rename -uid "6354D752-4DFB-CED5-8543-4E918DAEF6A7";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "l_3_motionPath";
	rename -uid "17E886CF-46C6-4AA3-F45A-C3A0734E6390";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "l_4_motionPath";
	rename -uid "C61C565C-483E-BF1E-5C84-0A8FACD583E0";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "l_5_motionPath";
	rename -uid "5B64C19F-49B2-4DEE-6E30-11B3E895B429";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "r_0_motionPath";
	rename -uid "0057424F-4D88-D5C1-EB1D-1AA683CE1DF6";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "r_1_motionPath";
	rename -uid "15F7FDD5-4C2F-3E46-53E2-6FBF90BF6CE6";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "r_2_motionPath";
	rename -uid "06A092C4-4A26-75D1-59AF-7A9EF0D03EE6";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "r_3_motionPath";
	rename -uid "59B76872-4DEE-76C0-D479-739676159004";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "r_4_motionPath";
	rename -uid "C1F49CC8-474C-0931-2A99-8A80F1EFD368";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode motionPath -n "r_5_motionPath";
	rename -uid "9F4FCE62-44D5-7746-616E-83B736DCEE22";
	setAttr ".f" yes;
	setAttr ".wu" -type "double3" 0 0 1 ;
createNode makeNurbSphere -n "inner_1_poser_makeNurbSphere";
	rename -uid "CA8AFA13-473D-BF4F-F067-84A94456703A";
createNode multDoubleLinear -n "inner_1_poser_multDoubleLinear";
	rename -uid "291819D9-4536-7451-5102-6DB92F013F20";
createNode multMatrix -n "l_brow_mid_inner_1_target_multMatrix";
	rename -uid "DCBA326A-41DE-1A43-E3ED-2E93A68CAE30";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_brow_in_inner_1_target_multMatrix";
	rename -uid "9E294BE5-4850-0975-5B41-49AA57D35303";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_brow_inner_1_multMatrix";
	rename -uid "BE9BD9B2-446C-220D-EF63-1599D4007C0C";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_brow_inner_1_pickMatrix";
	rename -uid "0860C731-479A-01DF-B730-28A8758A6DEB";
createNode blendMatrix -n "l_brow_inner_1_blendMatrix";
	rename -uid "E70C3CA0-4C75-0D75-ADA0-7685F74BFA80";
createNode multMatrix -n "r_brow_inner_1_multMatrix";
	rename -uid "6C2D97E4-454C-A695-2005-46BAABA32661";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_brow_inner_1_pickMatrix";
	rename -uid "3522A10F-46CD-3426-9B9E-59B4127BEEA7";
createNode blendMatrix -n "r_brow_inner_1_blendMatrix";
	rename -uid "84D78342-4F77-A2A9-DA40-578170E44745";
createNode makeNurbSphere -n "outer_1_poser_makeNurbSphere";
	rename -uid "57C80B93-441C-C5DB-B138-BB9A7D9585E1";
createNode multDoubleLinear -n "outer_1_poser_multDoubleLinear";
	rename -uid "72D2D3D8-490C-5FCC-2F89-C380567E513F";
createNode multMatrix -n "l_brow_mid_outer_1_target_multMatrix";
	rename -uid "079124A6-4874-3198-FBC2-B9AD13638244";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_brow_out_outer_1_target_multMatrix";
	rename -uid "D90AE112-4731-7C90-ED28-C38BCA54E7F0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_brow_outer_1_multMatrix";
	rename -uid "160E1A47-416A-C677-D8F3-A99CA2FD58B3";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_brow_outer_1_pickMatrix";
	rename -uid "EB157891-48BD-D23A-FD34-399587068273";
createNode blendMatrix -n "l_brow_outer_1_blendMatrix";
	rename -uid "80A4FB4B-42ED-A016-7174-7BA7E241377D";
createNode multMatrix -n "r_brow_outer_1_multMatrix";
	rename -uid "FCE3392A-4C3B-2767-09E5-2BBA0038EB54";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_brow_outer_1_pickMatrix";
	rename -uid "52B58976-4246-69A0-234C-619C9397FD03";
createNode blendMatrix -n "r_brow_outer_1_blendMatrix";
	rename -uid "67E73077-4339-C4F0-2C56-6C9EE7650981";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "73DB3E64-4BC3-A9A6-8F8B-5599B44D0E73";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 25 -ast 1 -aet 25 ";
	setAttr ".st" 6;
createNode objectSet -n "r_main_moduleControlSet";
	rename -uid "37A57352-4B61-19CF-95BF-17B293777487";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
createNode objectSet -n "r_add_moduleControlSet";
	rename -uid "2103D3C8-45A4-4B37-23A8-41AC0EEC0C77";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "r_moduleControlSet";
	rename -uid "6475B7AE-4D1C-47ED-3654-9F9DF282A541";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "l_main_moduleControlSet";
	rename -uid "F04A1104-46E8-BC52-D08C-16ADB1E9D2BD";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
createNode objectSet -n "l_add_moduleControlSet";
	rename -uid "DA421EED-4A06-7090-09B8-8FB581ABA18E";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "l_moduleControlSet";
	rename -uid "C078F429-4F35-6C5C-35C9-F486203DFC47";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "moduleControlSet";
	rename -uid "2D28D099-4326-71D7-5E62-F7B0B1140BDB";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "D0C57F34-4BFA-2527-4597-8E830CBEC0B1";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -727.38092347743134 -622.61902287839064 ;
	setAttr ".tgi[0].vh" -type "double2" 727.38092347743134 621.42854673521958 ;
	setAttr -s 354 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 927.14288330078125;
	setAttr ".tgi[0].ni[0].y" 3898.571533203125;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[1].y" 2935.71435546875;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 554.28570556640625;
	setAttr ".tgi[0].ni[2].y" 5718.5712890625;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 554.28570556640625;
	setAttr ".tgi[0].ni[3].y" 2382.857177734375;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 554.28570556640625;
	setAttr ".tgi[0].ni[4].y" -1410;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 554.28570556640625;
	setAttr ".tgi[0].ni[5].y" -312.85714721679688;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -531.4285888671875;
	setAttr ".tgi[0].ni[6].y" 1824.2857666015625;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -531.4285888671875;
	setAttr ".tgi[0].ni[7].y" -464.28570556640625;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[8].y" -267.14285278320312;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" 137.14285278320312;
	setAttr ".tgi[0].ni[9].y" -2890;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" -150;
	setAttr ".tgi[0].ni[10].y" 751.4285888671875;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 927.14288330078125;
	setAttr ".tgi[0].ni[11].y" -4137.14306640625;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" -150;
	setAttr ".tgi[0].ni[12].y" -2068.571533203125;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" 927.14288330078125;
	setAttr ".tgi[0].ni[13].y" 2151.428466796875;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" -150;
	setAttr ".tgi[0].ni[14].y" -1447.142822265625;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" 2015.7142333984375;
	setAttr ".tgi[0].ni[15].y" -10538.5712890625;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" 554.28570556640625;
	setAttr ".tgi[0].ni[16].y" 8827.142578125;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" -150;
	setAttr ".tgi[0].ni[17].y" -2328.571533203125;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" -838.5714111328125;
	setAttr ".tgi[0].ni[18].y" -685.71429443359375;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" -531.4285888671875;
	setAttr ".tgi[0].ni[19].y" 1520;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[20].y" 3365.71435546875;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" -531.4285888671875;
	setAttr ".tgi[0].ni[21].y" 2794.28564453125;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" 215.71427917480469;
	setAttr ".tgi[0].ni[22].y" -67.142860412597656;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" 927.14288330078125;
	setAttr ".tgi[0].ni[23].y" -4251.4287109375;
	setAttr ".tgi[0].ni[23].nvs" 18304;
	setAttr ".tgi[0].ni[24].x" 554.28570556640625;
	setAttr ".tgi[0].ni[24].y" 5052.85693359375;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" 585.71429443359375;
	setAttr ".tgi[0].ni[25].y" 4754.28564453125;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[0].ni[26].x" -531.4285888671875;
	setAttr ".tgi[0].ni[26].y" 2331.428466796875;
	setAttr ".tgi[0].ni[26].nvs" 18304;
	setAttr ".tgi[0].ni[27].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[27].y" 3467.142822265625;
	setAttr ".tgi[0].ni[27].nvs" 18304;
	setAttr ".tgi[0].ni[28].x" -150;
	setAttr ".tgi[0].ni[28].y" 1804.2857666015625;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" -531.4285888671875;
	setAttr ".tgi[0].ni[29].y" -362.85714721679688;
	setAttr ".tgi[0].ni[29].nvs" 18304;
	setAttr ".tgi[0].ni[30].x" -531.4285888671875;
	setAttr ".tgi[0].ni[30].y" 2128.571533203125;
	setAttr ".tgi[0].ni[30].nvs" 18304;
	setAttr ".tgi[0].ni[31].x" -150;
	setAttr ".tgi[0].ni[31].y" 1112.857177734375;
	setAttr ".tgi[0].ni[31].nvs" 18304;
	setAttr ".tgi[0].ni[32].x" 554.28570556640625;
	setAttr ".tgi[0].ni[32].y" -744.28570556640625;
	setAttr ".tgi[0].ni[32].nvs" 18304;
	setAttr ".tgi[0].ni[33].x" 215.71427917480469;
	setAttr ".tgi[0].ni[33].y" -930;
	setAttr ".tgi[0].ni[33].nvs" 18304;
	setAttr ".tgi[0].ni[34].x" 585.71429443359375;
	setAttr ".tgi[0].ni[34].y" -1674.2857666015625;
	setAttr ".tgi[0].ni[34].nvs" 18304;
	setAttr ".tgi[0].ni[35].x" -838.5714111328125;
	setAttr ".tgi[0].ni[35].y" -584.28570556640625;
	setAttr ".tgi[0].ni[35].nvs" 18304;
	setAttr ".tgi[0].ni[36].x" 2020;
	setAttr ".tgi[0].ni[36].y" -11318.5712890625;
	setAttr ".tgi[0].ni[36].nvs" 18304;
	setAttr ".tgi[0].ni[37].x" 554.28570556640625;
	setAttr ".tgi[0].ni[37].y" 3378.571533203125;
	setAttr ".tgi[0].ni[37].nvs" 18304;
	setAttr ".tgi[0].ni[38].x" 927.14288330078125;
	setAttr ".tgi[0].ni[38].y" 5092.85693359375;
	setAttr ".tgi[0].ni[38].nvs" 18304;
	setAttr ".tgi[0].ni[39].x" 215.71427917480469;
	setAttr ".tgi[0].ni[39].y" -4927.14306640625;
	setAttr ".tgi[0].ni[39].nvs" 18304;
	setAttr ".tgi[0].ni[40].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[40].y" -4572.85693359375;
	setAttr ".tgi[0].ni[40].nvs" 18304;
	setAttr ".tgi[0].ni[41].x" 554.28570556640625;
	setAttr ".tgi[0].ni[41].y" 2541.428466796875;
	setAttr ".tgi[0].ni[41].nvs" 18304;
	setAttr ".tgi[0].ni[42].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[42].y" -2552.857177734375;
	setAttr ".tgi[0].ni[42].nvs" 18304;
	setAttr ".tgi[0].ni[43].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[43].y" -3197.142822265625;
	setAttr ".tgi[0].ni[43].nvs" 18304;
	setAttr ".tgi[0].ni[44].x" 2101.428466796875;
	setAttr ".tgi[0].ni[44].y" -10018.5712890625;
	setAttr ".tgi[0].ni[44].nvs" 18304;
	setAttr ".tgi[0].ni[45].x" -531.4285888671875;
	setAttr ".tgi[0].ni[45].y" -565.71429443359375;
	setAttr ".tgi[0].ni[45].nvs" 18304;
	setAttr ".tgi[0].ni[46].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[46].y" 4602.85693359375;
	setAttr ".tgi[0].ni[46].nvs" 18304;
	setAttr ".tgi[0].ni[47].x" 137.14285278320312;
	setAttr ".tgi[0].ni[47].y" -2687.142822265625;
	setAttr ".tgi[0].ni[47].nvs" 18304;
	setAttr ".tgi[0].ni[48].x" 585.71429443359375;
	setAttr ".tgi[0].ni[48].y" -1401.4285888671875;
	setAttr ".tgi[0].ni[48].nvs" 18304;
	setAttr ".tgi[0].ni[49].x" 554.28570556640625;
	setAttr ".tgi[0].ni[49].y" 6930;
	setAttr ".tgi[0].ni[49].nvs" 18304;
	setAttr ".tgi[0].ni[50].x" 927.14288330078125;
	setAttr ".tgi[0].ni[50].y" -3494.28564453125;
	setAttr ".tgi[0].ni[50].nvs" 18304;
	setAttr ".tgi[0].ni[51].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[51].y" -4030;
	setAttr ".tgi[0].ni[51].nvs" 18304;
	setAttr ".tgi[0].ni[52].x" 137.14285278320312;
	setAttr ".tgi[0].ni[52].y" 4534.28564453125;
	setAttr ".tgi[0].ni[52].nvs" 18304;
	setAttr ".tgi[0].ni[53].x" 554.28570556640625;
	setAttr ".tgi[0].ni[53].y" 4488.5712890625;
	setAttr ".tgi[0].ni[53].nvs" 18304;
	setAttr ".tgi[0].ni[54].x" 927.14288330078125;
	setAttr ".tgi[0].ni[54].y" -2552.857177734375;
	setAttr ".tgi[0].ni[54].nvs" 18304;
	setAttr ".tgi[0].ni[55].x" 927.14288330078125;
	setAttr ".tgi[0].ni[55].y" -4977.14306640625;
	setAttr ".tgi[0].ni[55].nvs" 18304;
	setAttr ".tgi[0].ni[56].x" 554.28570556640625;
	setAttr ".tgi[0].ni[56].y" 5255.71435546875;
	setAttr ".tgi[0].ni[56].nvs" 18304;
	setAttr ".tgi[0].ni[57].x" -531.4285888671875;
	setAttr ".tgi[0].ni[57].y" 2591.428466796875;
	setAttr ".tgi[0].ni[57].nvs" 18304;
	setAttr ".tgi[0].ni[58].x" -531.4285888671875;
	setAttr ".tgi[0].ni[58].y" 601.4285888671875;
	setAttr ".tgi[0].ni[58].nvs" 18304;
	setAttr ".tgi[0].ni[59].x" -150;
	setAttr ".tgi[0].ni[59].y" -1345.7142333984375;
	setAttr ".tgi[0].ni[59].nvs" 18304;
	setAttr ".tgi[0].ni[60].x" 528.5714111328125;
	setAttr ".tgi[0].ni[60].y" -3317.142822265625;
	setAttr ".tgi[0].ni[60].nvs" 18304;
	setAttr ".tgi[0].ni[61].x" 554.28570556640625;
	setAttr ".tgi[0].ni[61].y" 6727.14306640625;
	setAttr ".tgi[0].ni[61].nvs" 18304;
	setAttr ".tgi[0].ni[62].x" 554.28570556640625;
	setAttr ".tgi[0].ni[62].y" 8725.7138671875;
	setAttr ".tgi[0].ni[62].nvs" 18304;
	setAttr ".tgi[0].ni[63].x" 554.28570556640625;
	setAttr ".tgi[0].ni[63].y" -4555.71435546875;
	setAttr ".tgi[0].ni[63].nvs" 18304;
	setAttr ".tgi[0].ni[64].x" 554.28570556640625;
	setAttr ".tgi[0].ni[64].y" -8464.2861328125;
	setAttr ".tgi[0].ni[64].nvs" 18304;
	setAttr ".tgi[0].ni[65].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[65].y" -4137.14306640625;
	setAttr ".tgi[0].ni[65].nvs" 18304;
	setAttr ".tgi[0].ni[66].x" -1145.7142333984375;
	setAttr ".tgi[0].ni[66].y" 2732.857177734375;
	setAttr ".tgi[0].ni[66].nvs" 18304;
	setAttr ".tgi[0].ni[67].x" -531.4285888671875;
	setAttr ".tgi[0].ni[67].y" 2027.142822265625;
	setAttr ".tgi[0].ni[67].nvs" 18304;
	setAttr ".tgi[0].ni[68].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[68].y" -368.57144165039062;
	setAttr ".tgi[0].ni[68].nvs" 18304;
	setAttr ".tgi[0].ni[69].x" -321.42855834960938;
	setAttr ".tgi[0].ni[69].y" 5367.14306640625;
	setAttr ".tgi[0].ni[69].nvs" 18304;
	setAttr ".tgi[0].ni[70].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[70].y" -1267.142822265625;
	setAttr ".tgi[0].ni[70].nvs" 18304;
	setAttr ".tgi[0].ni[71].x" 215.71427917480469;
	setAttr ".tgi[0].ni[71].y" -3017.142822265625;
	setAttr ".tgi[0].ni[71].nvs" 18304;
	setAttr ".tgi[0].ni[72].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[72].y" 3162.857177734375;
	setAttr ".tgi[0].ni[72].nvs" 18304;
	setAttr ".tgi[0].ni[73].x" -321.42855834960938;
	setAttr ".tgi[0].ni[73].y" 2545.71435546875;
	setAttr ".tgi[0].ni[73].nvs" 18304;
	setAttr ".tgi[0].ni[74].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[74].y" -3401.428466796875;
	setAttr ".tgi[0].ni[74].nvs" 18304;
	setAttr ".tgi[0].ni[75].x" 215.71427917480469;
	setAttr ".tgi[0].ni[75].y" -1132.857177734375;
	setAttr ".tgi[0].ni[75].nvs" 18304;
	setAttr ".tgi[0].ni[76].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[76].y" -4251.4287109375;
	setAttr ".tgi[0].ni[76].nvs" 18304;
	setAttr ".tgi[0].ni[77].x" -1452.857177734375;
	setAttr ".tgi[0].ni[77].y" 2955.71435546875;
	setAttr ".tgi[0].ni[77].nvs" 18304;
	setAttr ".tgi[0].ni[78].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[78].y" -1960;
	setAttr ".tgi[0].ni[78].nvs" 18304;
	setAttr ".tgi[0].ni[79].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[79].y" -4365.71435546875;
	setAttr ".tgi[0].ni[79].nvs" 18304;
	setAttr ".tgi[0].ni[80].x" -838.5714111328125;
	setAttr ".tgi[0].ni[80].y" -888.5714111328125;
	setAttr ".tgi[0].ni[80].nvs" 18304;
	setAttr ".tgi[0].ni[81].x" 528.5714111328125;
	setAttr ".tgi[0].ni[81].y" 2392.857177734375;
	setAttr ".tgi[0].ni[81].nvs" 18304;
	setAttr ".tgi[0].ni[82].x" 554.28570556640625;
	setAttr ".tgi[0].ni[82].y" -2824.28564453125;
	setAttr ".tgi[0].ni[82].nvs" 18304;
	setAttr ".tgi[0].ni[83].x" -838.5714111328125;
	setAttr ".tgi[0].ni[83].y" 2537.142822265625;
	setAttr ".tgi[0].ni[83].nvs" 18304;
	setAttr ".tgi[0].ni[84].x" -531.4285888671875;
	setAttr ".tgi[0].ni[84].y" 2692.857177734375;
	setAttr ".tgi[0].ni[84].nvs" 18304;
	setAttr ".tgi[0].ni[85].x" 215.71427917480469;
	setAttr ".tgi[0].ni[85].y" 4151.4287109375;
	setAttr ".tgi[0].ni[85].nvs" 18304;
	setAttr ".tgi[0].ni[86].x" 137.14285278320312;
	setAttr ".tgi[0].ni[86].y" -3371.428466796875;
	setAttr ".tgi[0].ni[86].nvs" 18304;
	setAttr ".tgi[0].ni[87].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[87].y" 1557.142822265625;
	setAttr ".tgi[0].ni[87].nvs" 18304;
	setAttr ".tgi[0].ni[88].x" 137.14285278320312;
	setAttr ".tgi[0].ni[88].y" 3707.142822265625;
	setAttr ".tgi[0].ni[88].nvs" 18304;
	setAttr ".tgi[0].ni[89].x" 2041.4285888671875;
	setAttr ".tgi[0].ni[89].y" -12618.5712890625;
	setAttr ".tgi[0].ni[89].nvs" 18304;
	setAttr ".tgi[0].ni[90].x" 215.71427917480469;
	setAttr ".tgi[0].ni[90].y" 465.71429443359375;
	setAttr ".tgi[0].ni[90].nvs" 18304;
	setAttr ".tgi[0].ni[91].x" -838.5714111328125;
	setAttr ".tgi[0].ni[91].y" -787.14288330078125;
	setAttr ".tgi[0].ni[91].nvs" 18304;
	setAttr ".tgi[0].ni[92].x" 554.28570556640625;
	setAttr ".tgi[0].ni[92].y" -6598.5712890625;
	setAttr ".tgi[0].ni[92].nvs" 18304;
	setAttr ".tgi[0].ni[93].x" -531.4285888671875;
	setAttr ".tgi[0].ni[93].y" 398.57144165039062;
	setAttr ".tgi[0].ni[93].nvs" 18304;
	setAttr ".tgi[0].ni[94].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[94].y" -4471.4287109375;
	setAttr ".tgi[0].ni[94].nvs" 18304;
	setAttr ".tgi[0].ni[95].x" 554.28570556640625;
	setAttr ".tgi[0].ni[95].y" -7830;
	setAttr ".tgi[0].ni[95].nvs" 18304;
	setAttr ".tgi[0].ni[96].x" 215.71427917480469;
	setAttr ".tgi[0].ni[96].y" 4741.4287109375;
	setAttr ".tgi[0].ni[96].nvs" 18304;
	setAttr ".tgi[0].ni[97].x" -838.5714111328125;
	setAttr ".tgi[0].ni[97].y" 2378.571533203125;
	setAttr ".tgi[0].ni[97].nvs" 18304;
	setAttr ".tgi[0].ni[98].x" 137.14285278320312;
	setAttr ".tgi[0].ni[98].y" -2585.71435546875;
	setAttr ".tgi[0].ni[98].nvs" 18304;
	setAttr ".tgi[0].ni[99].x" 927.14288330078125;
	setAttr ".tgi[0].ni[99].y" -4471.4287109375;
	setAttr ".tgi[0].ni[99].nvs" 18304;
	setAttr ".tgi[0].ni[100].x" 528.5714111328125;
	setAttr ".tgi[0].ni[100].y" 5031.4287109375;
	setAttr ".tgi[0].ni[100].nvs" 18304;
	setAttr ".tgi[0].ni[101].x" -150;
	setAttr ".tgi[0].ni[101].y" -1650;
	setAttr ".tgi[0].ni[101].nvs" 18304;
	setAttr ".tgi[0].ni[102].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[102].y" 2064.28564453125;
	setAttr ".tgi[0].ni[102].nvs" 18304;
	setAttr ".tgi[0].ni[103].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[103].y" 1455.7142333984375;
	setAttr ".tgi[0].ni[103].nvs" 18304;
	setAttr ".tgi[0].ni[104].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[104].y" 2470;
	setAttr ".tgi[0].ni[104].nvs" 18304;
	setAttr ".tgi[0].ni[105].x" 137.14285278320312;
	setAttr ".tgi[0].ni[105].y" 7154.28564453125;
	setAttr ".tgi[0].ni[105].nvs" 18304;
	setAttr ".tgi[0].ni[106].x" 554.28570556640625;
	setAttr ".tgi[0].ni[106].y" 3480;
	setAttr ".tgi[0].ni[106].nvs" 18304;
	setAttr ".tgi[0].ni[107].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[107].y" 2830;
	setAttr ".tgi[0].ni[107].nvs" 18304;
	setAttr ".tgi[0].ni[108].x" 2020;
	setAttr ".tgi[0].ni[108].y" -11058.5712890625;
	setAttr ".tgi[0].ni[108].nvs" 18304;
	setAttr ".tgi[0].ni[109].x" 927.14288330078125;
	setAttr ".tgi[0].ni[109].y" 2411.428466796875;
	setAttr ".tgi[0].ni[109].nvs" 18304;
	setAttr ".tgi[0].ni[110].x" 2040;
	setAttr ".tgi[0].ni[110].y" -12098.5712890625;
	setAttr ".tgi[0].ni[110].nvs" 18304;
	setAttr ".tgi[0].ni[111].x" 927.14288330078125;
	setAttr ".tgi[0].ni[111].y" 3022.857177734375;
	setAttr ".tgi[0].ni[111].nvs" 18304;
	setAttr ".tgi[0].ni[112].x" -838.5714111328125;
	setAttr ".tgi[0].ni[112].y" 2797.142822265625;
	setAttr ".tgi[0].ni[112].nvs" 18304;
	setAttr ".tgi[0].ni[113].x" 215.71427917480469;
	setAttr ".tgi[0].ni[113].y" -4724.28564453125;
	setAttr ".tgi[0].ni[113].nvs" 18304;
	setAttr ".tgi[0].ni[114].x" 585.71429443359375;
	setAttr ".tgi[0].ni[114].y" -4251.4287109375;
	setAttr ".tgi[0].ni[114].nvs" 18304;
	setAttr ".tgi[0].ni[115].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[115].y" -571.4285888671875;
	setAttr ".tgi[0].ni[115].nvs" 18304;
	setAttr ".tgi[0].ni[116].x" -150;
	setAttr ".tgi[0].ni[116].y" 2007.142822265625;
	setAttr ".tgi[0].ni[116].nvs" 18304;
	setAttr ".tgi[0].ni[117].x" 927.14288330078125;
	setAttr ".tgi[0].ni[117].y" -1724.2857666015625;
	setAttr ".tgi[0].ni[117].nvs" 18304;
	setAttr ".tgi[0].ni[118].x" 554.28570556640625;
	setAttr ".tgi[0].ni[118].y" -5291.4287109375;
	setAttr ".tgi[0].ni[118].nvs" 18304;
	setAttr ".tgi[0].ni[119].x" 215.71427917480469;
	setAttr ".tgi[0].ni[119].y" 681.4285888671875;
	setAttr ".tgi[0].ni[119].nvs" 18304;
	setAttr ".tgi[0].ni[120].x" 554.28570556640625;
	setAttr ".tgi[0].ni[120].y" 7964.28564453125;
	setAttr ".tgi[0].ni[120].nvs" 18304;
	setAttr ".tgi[0].ni[121].x" 927.14288330078125;
	setAttr ".tgi[0].ni[121].y" -1037.142822265625;
	setAttr ".tgi[0].ni[121].nvs" 18304;
	setAttr ".tgi[0].ni[122].x" 927.14288330078125;
	setAttr ".tgi[0].ni[122].y" 4675.71435546875;
	setAttr ".tgi[0].ni[122].nvs" 18304;
	setAttr ".tgi[0].ni[123].x" -531.4285888671875;
	setAttr ".tgi[0].ni[123].y" 804.28570556640625;
	setAttr ".tgi[0].ni[123].nvs" 18304;
	setAttr ".tgi[0].ni[124].x" 215.71427917480469;
	setAttr ".tgi[0].ni[124].y" -4825.71435546875;
	setAttr ".tgi[0].ni[124].nvs" 18304;
	setAttr ".tgi[0].ni[125].x" 554.28570556640625;
	setAttr ".tgi[0].ni[125].y" -5564.28564453125;
	setAttr ".tgi[0].ni[125].nvs" 18304;
	setAttr ".tgi[0].ni[126].x" 2021.4285888671875;
	setAttr ".tgi[0].ni[126].y" -11448.5712890625;
	setAttr ".tgi[0].ni[126].nvs" 18304;
	setAttr ".tgi[0].ni[127].x" 585.71429443359375;
	setAttr ".tgi[0].ni[127].y" -1071.4285888671875;
	setAttr ".tgi[0].ni[127].nvs" 18304;
	setAttr ".tgi[0].ni[128].x" 2097.142822265625;
	setAttr ".tgi[0].ni[128].y" -9048.5712890625;
	setAttr ".tgi[0].ni[128].nvs" 18304;
	setAttr ".tgi[0].ni[129].x" 215.71427917480469;
	setAttr ".tgi[0].ni[129].y" -3620;
	setAttr ".tgi[0].ni[129].nvs" 18304;
	setAttr ".tgi[0].ni[130].x" -150;
	setAttr ".tgi[0].ni[130].y" -2645.71435546875;
	setAttr ".tgi[0].ni[130].nvs" 18304;
	setAttr ".tgi[0].ni[131].x" 554.28570556640625;
	setAttr ".tgi[0].ni[131].y" -947.14288330078125;
	setAttr ".tgi[0].ni[131].nvs" 18304;
	setAttr ".tgi[0].ni[132].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[132].y" 1354.2857666015625;
	setAttr ".tgi[0].ni[132].nvs" 18304;
	setAttr ".tgi[0].ni[133].x" -321.42855834960938;
	setAttr ".tgi[0].ni[133].y" 5887.14306640625;
	setAttr ".tgi[0].ni[133].nvs" 18304;
	setAttr ".tgi[0].ni[134].x" 2040;
	setAttr ".tgi[0].ni[134].y" -12228.5712890625;
	setAttr ".tgi[0].ni[134].nvs" 18304;
	setAttr ".tgi[0].ni[135].x" 215.71427917480469;
	setAttr ".tgi[0].ni[135].y" -1031.4285888671875;
	setAttr ".tgi[0].ni[135].nvs" 18304;
	setAttr ".tgi[0].ni[136].x" 927.14288330078125;
	setAttr ".tgi[0].ni[136].y" -1861.4285888671875;
	setAttr ".tgi[0].ni[136].nvs" 18304;
	setAttr ".tgi[0].ni[137].x" 927.14288330078125;
	setAttr ".tgi[0].ni[137].y" -935.71429443359375;
	setAttr ".tgi[0].ni[137].nvs" 18304;
	setAttr ".tgi[0].ni[138].x" 554.28570556640625;
	setAttr ".tgi[0].ni[138].y" -4454.28564453125;
	setAttr ".tgi[0].ni[138].nvs" 18304;
	setAttr ".tgi[0].ni[139].x" -531.4285888671875;
	setAttr ".tgi[0].ni[139].y" 1621.4285888671875;
	setAttr ".tgi[0].ni[139].nvs" 18304;
	setAttr ".tgi[0].ni[140].x" 215.71427917480469;
	setAttr ".tgi[0].ni[140].y" -2268.571533203125;
	setAttr ".tgi[0].ni[140].nvs" 18304;
	setAttr ".tgi[0].ni[141].x" 137.14285278320312;
	setAttr ".tgi[0].ni[141].y" -3472.857177734375;
	setAttr ".tgi[0].ni[141].nvs" 18304;
	setAttr ".tgi[0].ni[142].x" 585.71429443359375;
	setAttr ".tgi[0].ni[142].y" 275.71429443359375;
	setAttr ".tgi[0].ni[142].nvs" 18304;
	setAttr ".tgi[0].ni[143].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[143].y" 1151.4285888671875;
	setAttr ".tgi[0].ni[143].nvs" 18304;
	setAttr ".tgi[0].ni[144].x" 1794.2857666015625;
	setAttr ".tgi[0].ni[144].y" -10278.5712890625;
	setAttr ".tgi[0].ni[144].nvs" 18304;
	setAttr ".tgi[0].ni[145].x" 2098.571533203125;
	setAttr ".tgi[0].ni[145].y" -14308.5712890625;
	setAttr ".tgi[0].ni[145].nvs" 18304;
	setAttr ".tgi[0].ni[146].x" -838.5714111328125;
	setAttr ".tgi[0].ni[146].y" 100;
	setAttr ".tgi[0].ni[146].nvs" 18304;
	setAttr ".tgi[0].ni[147].x" -531.4285888671875;
	setAttr ".tgi[0].ni[147].y" 702.85711669921875;
	setAttr ".tgi[0].ni[147].nvs" 18304;
	setAttr ".tgi[0].ni[148].x" 554.28570556640625;
	setAttr ".tgi[0].ni[148].y" 8624.2861328125;
	setAttr ".tgi[0].ni[148].nvs" 18304;
	setAttr ".tgi[0].ni[149].x" 2095.71435546875;
	setAttr ".tgi[0].ni[149].y" -14178.5712890625;
	setAttr ".tgi[0].ni[149].nvs" 18304;
	setAttr ".tgi[0].ni[150].x" 554.28570556640625;
	setAttr ".tgi[0].ni[150].y" 6207.14306640625;
	setAttr ".tgi[0].ni[150].nvs" 18304;
	setAttr ".tgi[0].ni[151].x" 554.28570556640625;
	setAttr ".tgi[0].ni[151].y" -7931.4287109375;
	setAttr ".tgi[0].ni[151].nvs" 18304;
	setAttr ".tgi[0].ni[152].x" -531.4285888671875;
	setAttr ".tgi[0].ni[152].y" 500;
	setAttr ".tgi[0].ni[152].nvs" 18304;
	setAttr ".tgi[0].ni[153].x" 585.71429443359375;
	setAttr ".tgi[0].ni[153].y" -4927.14306640625;
	setAttr ".tgi[0].ni[153].nvs" 18304;
	setAttr ".tgi[0].ni[154].x" 554.28570556640625;
	setAttr ".tgi[0].ni[154].y" -1308.5714111328125;
	setAttr ".tgi[0].ni[154].nvs" 18304;
	setAttr ".tgi[0].ni[155].x" -838.5714111328125;
	setAttr ".tgi[0].ni[155].y" 1737.142822265625;
	setAttr ".tgi[0].ni[155].nvs" 18304;
	setAttr ".tgi[0].ni[156].x" -531.4285888671875;
	setAttr ".tgi[0].ni[156].y" 1722.857177734375;
	setAttr ".tgi[0].ni[156].nvs" 18304;
	setAttr ".tgi[0].ni[157].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[157].y" -470;
	setAttr ".tgi[0].ni[157].nvs" 18304;
	setAttr ".tgi[0].ni[158].x" 137.14285278320312;
	setAttr ".tgi[0].ni[158].y" 4224.28564453125;
	setAttr ".tgi[0].ni[158].nvs" 18304;
	setAttr ".tgi[0].ni[159].x" 585.71429443359375;
	setAttr ".tgi[0].ni[159].y" -4365.71435546875;
	setAttr ".tgi[0].ni[159].nvs" 18304;
	setAttr ".tgi[0].ni[160].x" 554.28570556640625;
	setAttr ".tgi[0].ni[160].y" -2621.428466796875;
	setAttr ".tgi[0].ni[160].nvs" 18304;
	setAttr ".tgi[0].ni[161].x" 927.14288330078125;
	setAttr ".tgi[0].ni[161].y" -4030;
	setAttr ".tgi[0].ni[161].nvs" 18304;
	setAttr ".tgi[0].ni[162].x" -150;
	setAttr ".tgi[0].ni[162].y" 1531.4285888671875;
	setAttr ".tgi[0].ni[162].nvs" 18304;
	setAttr ".tgi[0].ni[163].x" 585.71429443359375;
	setAttr ".tgi[0].ni[163].y" -468.57144165039062;
	setAttr ".tgi[0].ni[163].nvs" 18304;
	setAttr ".tgi[0].ni[164].x" 215.71427917480469;
	setAttr ".tgi[0].ni[164].y" -2541.428466796875;
	setAttr ".tgi[0].ni[164].nvs" 18304;
	setAttr ".tgi[0].ni[165].x" 137.14285278320312;
	setAttr ".tgi[0].ni[165].y" -4014.28564453125;
	setAttr ".tgi[0].ni[165].nvs" 18304;
	setAttr ".tgi[0].ni[166].x" 554.28570556640625;
	setAttr ".tgi[0].ni[166].y" 6467.14306640625;
	setAttr ".tgi[0].ni[166].nvs" 18304;
	setAttr ".tgi[0].ni[167].x" -531.4285888671875;
	setAttr ".tgi[0].ni[167].y" -781.4285888671875;
	setAttr ".tgi[0].ni[167].nvs" 18304;
	setAttr ".tgi[0].ni[168].x" 554.28570556640625;
	setAttr ".tgi[0].ni[168].y" -3978.571533203125;
	setAttr ".tgi[0].ni[168].nvs" 18304;
	setAttr ".tgi[0].ni[169].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[169].y" -2162.857177734375;
	setAttr ".tgi[0].ni[169].nvs" 18304;
	setAttr ".tgi[0].ni[170].x" 137.14285278320312;
	setAttr ".tgi[0].ni[170].y" -3811.428466796875;
	setAttr ".tgi[0].ni[170].nvs" 18304;
	setAttr ".tgi[0].ni[171].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[171].y" -2264.28564453125;
	setAttr ".tgi[0].ni[171].nvs" 18304;
	setAttr ".tgi[0].ni[172].x" 2094.28564453125;
	setAttr ".tgi[0].ni[172].y" -14048.5712890625;
	setAttr ".tgi[0].ni[172].nvs" 18304;
	setAttr ".tgi[0].ni[173].x" 215.71427917480469;
	setAttr ".tgi[0].ni[173].y" -225.71427917480469;
	setAttr ".tgi[0].ni[173].nvs" 18304;
	setAttr ".tgi[0].ni[174].x" 927.14288330078125;
	setAttr ".tgi[0].ni[174].y" -15.714285850524902;
	setAttr ".tgi[0].ni[174].nvs" 18304;
	setAttr ".tgi[0].ni[175].x" 554.28570556640625;
	setAttr ".tgi[0].ni[175].y" -5767.14306640625;
	setAttr ".tgi[0].ni[175].nvs" 18304;
	setAttr ".tgi[0].ni[176].x" 2052.857177734375;
	setAttr ".tgi[0].ni[176].y" -12878.5712890625;
	setAttr ".tgi[0].ni[176].nvs" 18304;
	setAttr ".tgi[0].ni[177].x" 554.28570556640625;
	setAttr ".tgi[0].ni[177].y" 2700;
	setAttr ".tgi[0].ni[177].nvs" 18304;
	setAttr ".tgi[0].ni[178].x" 215.71427917480469;
	setAttr ".tgi[0].ni[178].y" 2974.28564453125;
	setAttr ".tgi[0].ni[178].nvs" 18304;
	setAttr ".tgi[0].ni[179].x" 2101.428466796875;
	setAttr ".tgi[0].ni[179].y" -10408.5712890625;
	setAttr ".tgi[0].ni[179].nvs" 18304;
	setAttr ".tgi[0].ni[180].x" 554.28570556640625;
	setAttr ".tgi[0].ni[180].y" -5031.4287109375;
	setAttr ".tgi[0].ni[180].nvs" 18304;
	setAttr ".tgi[0].ni[181].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[181].y" 41.428569793701172;
	setAttr ".tgi[0].ni[181].nvs" 18304;
	setAttr ".tgi[0].ni[182].x" 554.28570556640625;
	setAttr ".tgi[0].ni[182].y" 6828.5712890625;
	setAttr ".tgi[0].ni[182].nvs" 18304;
	setAttr ".tgi[0].ni[183].x" 2054.28564453125;
	setAttr ".tgi[0].ni[183].y" -13008.5712890625;
	setAttr ".tgi[0].ni[183].nvs" 18304;
	setAttr ".tgi[0].ni[184].x" 554.28570556640625;
	setAttr ".tgi[0].ni[184].y" -3877.142822265625;
	setAttr ".tgi[0].ni[184].nvs" 18304;
	setAttr ".tgi[0].ni[185].x" 528.5714111328125;
	setAttr ".tgi[0].ni[185].y" -5105.71435546875;
	setAttr ".tgi[0].ni[185].nvs" 18304;
	setAttr ".tgi[0].ni[186].x" 554.28570556640625;
	setAttr ".tgi[0].ni[186].y" -154.28572082519531;
	setAttr ".tgi[0].ni[186].nvs" 18304;
	setAttr ".tgi[0].ni[187].x" 585.71429443359375;
	setAttr ".tgi[0].ni[187].y" -252.85714721679688;
	setAttr ".tgi[0].ni[187].nvs" 18304;
	setAttr ".tgi[0].ni[188].x" 927.14288330078125;
	setAttr ".tgi[0].ni[188].y" -4365.71435546875;
	setAttr ".tgi[0].ni[188].nvs" 18304;
	setAttr ".tgi[0].ni[189].x" 2101.428466796875;
	setAttr ".tgi[0].ni[189].y" -10278.5712890625;
	setAttr ".tgi[0].ni[189].nvs" 18304;
	setAttr ".tgi[0].ni[190].x" 554.28570556640625;
	setAttr ".tgi[0].ni[190].y" -2101.428466796875;
	setAttr ".tgi[0].ni[190].nvs" 18304;
	setAttr ".tgi[0].ni[191].x" 927.14288330078125;
	setAttr ".tgi[0].ni[191].y" -3928.571533203125;
	setAttr ".tgi[0].ni[191].nvs" 18304;
	setAttr ".tgi[0].ni[192].x" 1787.142822265625;
	setAttr ".tgi[0].ni[192].y" -9048.5712890625;
	setAttr ".tgi[0].ni[192].nvs" 18304;
	setAttr ".tgi[0].ni[193].x" 215.71427917480469;
	setAttr ".tgi[0].ni[193].y" -3518.571533203125;
	setAttr ".tgi[0].ni[193].nvs" 18304;
	setAttr ".tgi[0].ni[194].x" -150;
	setAttr ".tgi[0].ni[194].y" 954.28570556640625;
	setAttr ".tgi[0].ni[194].nvs" 18304;
	setAttr ".tgi[0].ni[195].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[195].y" -1858.5714111328125;
	setAttr ".tgi[0].ni[195].nvs" 18304;
	setAttr ".tgi[0].ni[196].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[196].y" 2267.142822265625;
	setAttr ".tgi[0].ni[196].nvs" 18304;
	setAttr ".tgi[0].ni[197].x" 2098.571533203125;
	setAttr ".tgi[0].ni[197].y" -14568.5712890625;
	setAttr ".tgi[0].ni[197].nvs" 18304;
	setAttr ".tgi[0].ni[198].x" 554.28570556640625;
	setAttr ".tgi[0].ni[198].y" -3445.71435546875;
	setAttr ".tgi[0].ni[198].nvs" 18304;
	setAttr ".tgi[0].ni[199].x" 585.71429443359375;
	setAttr ".tgi[0].ni[199].y" -570;
	setAttr ".tgi[0].ni[199].nvs" 18304;
	setAttr ".tgi[0].ni[200].x" 927.14288330078125;
	setAttr ".tgi[0].ni[200].y" 2570;
	setAttr ".tgi[0].ni[200].nvs" 18304;
	setAttr ".tgi[0].ni[201].x" 585.71429443359375;
	setAttr ".tgi[0].ni[201].y" 4164.28564453125;
	setAttr ".tgi[0].ni[201].nvs" 18304;
	setAttr ".tgi[0].ni[202].x" 554.28570556640625;
	setAttr ".tgi[0].ni[202].y" 9302.857421875;
	setAttr ".tgi[0].ni[202].nvs" 18304;
	setAttr ".tgi[0].ni[203].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[203].y" 1658.5714111328125;
	setAttr ".tgi[0].ni[203].nvs" 18304;
	setAttr ".tgi[0].ni[204].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[204].y" 4917.14306640625;
	setAttr ".tgi[0].ni[204].nvs" 18304;
	setAttr ".tgi[0].ni[205].x" 585.71429443359375;
	setAttr ".tgi[0].ni[205].y" -3624.28564453125;
	setAttr ".tgi[0].ni[205].nvs" 18304;
	setAttr ".tgi[0].ni[206].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[206].y" 3061.428466796875;
	setAttr ".tgi[0].ni[206].nvs" 18304;
	setAttr ".tgi[0].ni[207].x" 2034.2857666015625;
	setAttr ".tgi[0].ni[207].y" -11968.5712890625;
	setAttr ".tgi[0].ni[207].nvs" 18304;
	setAttr ".tgi[0].ni[208].x" 585.71429443359375;
	setAttr ".tgi[0].ni[208].y" -4137.14306640625;
	setAttr ".tgi[0].ni[208].nvs" 18304;
	setAttr ".tgi[0].ni[209].x" 927.14288330078125;
	setAttr ".tgi[0].ni[209].y" -777.14288330078125;
	setAttr ".tgi[0].ni[209].nvs" 18304;
	setAttr ".tgi[0].ni[210].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[210].y" 2627.142822265625;
	setAttr ".tgi[0].ni[210].nvs" 18304;
	setAttr ".tgi[0].ni[211].x" 2055.71435546875;
	setAttr ".tgi[0].ni[211].y" -13138.5712890625;
	setAttr ".tgi[0].ni[211].nvs" 18304;
	setAttr ".tgi[0].ni[212].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[212].y" 4177.14306640625;
	setAttr ".tgi[0].ni[212].nvs" 18304;
	setAttr ".tgi[0].ni[213].x" 2087.142822265625;
	setAttr ".tgi[0].ni[213].y" -13788.5712890625;
	setAttr ".tgi[0].ni[213].nvs" 18304;
	setAttr ".tgi[0].ni[214].x" 585.71429443359375;
	setAttr ".tgi[0].ni[214].y" 738.5714111328125;
	setAttr ".tgi[0].ni[214].nvs" 18304;
	setAttr ".tgi[0].ni[215].x" 554.28570556640625;
	setAttr ".tgi[0].ni[215].y" -2304.28564453125;
	setAttr ".tgi[0].ni[215].nvs" 18304;
	setAttr ".tgi[0].ni[216].x" 927.14288330078125;
	setAttr ".tgi[0].ni[216].y" -618.5714111328125;
	setAttr ".tgi[0].ni[216].nvs" 18304;
	setAttr ".tgi[0].ni[217].x" 927.14288330078125;
	setAttr ".tgi[0].ni[217].y" 990;
	setAttr ".tgi[0].ni[217].nvs" 18304;
	setAttr ".tgi[0].ni[218].x" 927.14288330078125;
	setAttr ".tgi[0].ni[218].y" 1291.4285888671875;
	setAttr ".tgi[0].ni[218].nvs" 18304;
	setAttr ".tgi[0].ni[219].x" 927.14288330078125;
	setAttr ".tgi[0].ni[219].y" 1190;
	setAttr ".tgi[0].ni[219].nvs" 18304;
	setAttr ".tgi[0].ni[220].x" 2085.71435546875;
	setAttr ".tgi[0].ni[220].y" -13528.5712890625;
	setAttr ".tgi[0].ni[220].nvs" 18304;
	setAttr ".tgi[0].ni[221].x" 585.71429443359375;
	setAttr ".tgi[0].ni[221].y" 637.14288330078125;
	setAttr ".tgi[0].ni[221].nvs" 18304;
	setAttr ".tgi[0].ni[222].x" 585.71429443359375;
	setAttr ".tgi[0].ni[222].y" 840;
	setAttr ".tgi[0].ni[222].nvs" 18304;
	setAttr ".tgi[0].ni[223].x" 585.71429443359375;
	setAttr ".tgi[0].ni[223].y" 377.14285278320312;
	setAttr ".tgi[0].ni[223].nvs" 18304;
	setAttr ".tgi[0].ni[224].x" 2018.5714111328125;
	setAttr ".tgi[0].ni[224].y" -10668.5712890625;
	setAttr ".tgi[0].ni[224].nvs" 18304;
	setAttr ".tgi[0].ni[225].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[225].y" -3590;
	setAttr ".tgi[0].ni[225].nvs" 18304;
	setAttr ".tgi[0].ni[226].x" 137.14285278320312;
	setAttr ".tgi[0].ni[226].y" -201.42857360839844;
	setAttr ".tgi[0].ni[226].nvs" 18304;
	setAttr ".tgi[0].ni[227].x" 585.71429443359375;
	setAttr ".tgi[0].ni[227].y" 535.71429443359375;
	setAttr ".tgi[0].ni[227].nvs" 18304;
	setAttr ".tgi[0].ni[228].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[228].y" 2165.71435546875;
	setAttr ".tgi[0].ni[228].nvs" 18304;
	setAttr ".tgi[0].ni[229].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[229].y" 1760;
	setAttr ".tgi[0].ni[229].nvs" 18304;
	setAttr ".tgi[0].ni[230].x" 927.14288330078125;
	setAttr ".tgi[0].ni[230].y" 4991.4287109375;
	setAttr ".tgi[0].ni[230].nvs" 18304;
	setAttr ".tgi[0].ni[231].x" 554.28570556640625;
	setAttr ".tgi[0].ni[231].y" 4691.4287109375;
	setAttr ".tgi[0].ni[231].nvs" 18304;
	setAttr ".tgi[0].ni[232].x" 215.71427917480469;
	setAttr ".tgi[0].ni[232].y" -1881.4285888671875;
	setAttr ".tgi[0].ni[232].nvs" 18304;
	setAttr ".tgi[0].ni[233].x" -150;
	setAttr ".tgi[0].ni[233].y" 1214.2857666015625;
	setAttr ".tgi[0].ni[233].nvs" 18304;
	setAttr ".tgi[0].ni[234].x" 215.71427917480469;
	setAttr ".tgi[0].ni[234].y" -2642.857177734375;
	setAttr ".tgi[0].ni[234].nvs" 18304;
	setAttr ".tgi[0].ni[235].x" 137.14285278320312;
	setAttr ".tgi[0].ni[235].y" 7255.71435546875;
	setAttr ".tgi[0].ni[235].nvs" 18304;
	setAttr ".tgi[0].ni[236].x" 585.71429443359375;
	setAttr ".tgi[0].ni[236].y" 2134.28564453125;
	setAttr ".tgi[0].ni[236].nvs" 18304;
	setAttr ".tgi[0].ni[237].x" 585.71429443359375;
	setAttr ".tgi[0].ni[237].y" -2784.28564453125;
	setAttr ".tgi[0].ni[237].nvs" 18304;
	setAttr ".tgi[0].ni[238].x" -150;
	setAttr ".tgi[0].ni[238].y" -2170;
	setAttr ".tgi[0].ni[238].nvs" 18304;
	setAttr ".tgi[0].ni[239].x" -531.4285888671875;
	setAttr ".tgi[0].ni[239].y" 3010;
	setAttr ".tgi[0].ni[239].nvs" 18304;
	setAttr ".tgi[0].ni[240].x" 1480;
	setAttr ".tgi[0].ni[240].y" -9150;
	setAttr ".tgi[0].ni[240].nvs" 18304;
	setAttr ".tgi[0].ni[241].x" -150;
	setAttr ".tgi[0].ni[241].y" 1905.7142333984375;
	setAttr ".tgi[0].ni[241].nvs" 18304;
	setAttr ".tgi[0].ni[242].x" 215.71427917480469;
	setAttr ".tgi[0].ni[242].y" -5028.5712890625;
	setAttr ".tgi[0].ni[242].nvs" 18304;
	setAttr ".tgi[0].ni[243].x" 585.71429443359375;
	setAttr ".tgi[0].ni[243].y" 4062.857177734375;
	setAttr ".tgi[0].ni[243].nvs" 18304;
	setAttr ".tgi[0].ni[244].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[244].y" 1252.857177734375;
	setAttr ".tgi[0].ni[244].nvs" 18304;
	setAttr ".tgi[0].ni[245].x" 927.14288330078125;
	setAttr ".tgi[0].ni[245].y" -4572.85693359375;
	setAttr ".tgi[0].ni[245].nvs" 18304;
	setAttr ".tgi[0].ni[246].x" 554.28570556640625;
	setAttr ".tgi[0].ni[246].y" -4657.14306640625;
	setAttr ".tgi[0].ni[246].nvs" 18304;
	setAttr ".tgi[0].ni[247].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[247].y" 3568.571533203125;
	setAttr ".tgi[0].ni[247].nvs" 18304;
	setAttr ".tgi[0].ni[248].x" 137.14285278320312;
	setAttr ".tgi[0].ni[248].y" 8730;
	setAttr ".tgi[0].ni[248].nvs" 18304;
	setAttr ".tgi[0].ni[249].x" 927.14288330078125;
	setAttr ".tgi[0].ni[249].y" -2162.857177734375;
	setAttr ".tgi[0].ni[249].nvs" 18304;
	setAttr ".tgi[0].ni[250].x" -531.4285888671875;
	setAttr ".tgi[0].ni[250].y" 2230;
	setAttr ".tgi[0].ni[250].nvs" 18304;
	setAttr ".tgi[0].ni[251].x" -150;
	setAttr ".tgi[0].ni[251].y" -1548.5714111328125;
	setAttr ".tgi[0].ni[251].nvs" 18304;
	setAttr ".tgi[0].ni[252].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[252].y" -2061.428466796875;
	setAttr ".tgi[0].ni[252].nvs" 18304;
	setAttr ".tgi[0].ni[253].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[253].y" 3264.28564453125;
	setAttr ".tgi[0].ni[253].nvs" 18304;
	setAttr ".tgi[0].ni[254].x" 215.71427917480469;
	setAttr ".tgi[0].ni[254].y" 192.85714721679688;
	setAttr ".tgi[0].ni[254].nvs" 18304;
	setAttr ".tgi[0].ni[255].x" 2071.428466796875;
	setAttr ".tgi[0].ni[255].y" -13268.5712890625;
	setAttr ".tgi[0].ni[255].nvs" 18304;
	setAttr ".tgi[0].ni[256].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[256].y" 1861.4285888671875;
	setAttr ".tgi[0].ni[256].nvs" 18304;
	setAttr ".tgi[0].ni[257].x" 137.14285278320312;
	setAttr ".tgi[0].ni[257].y" 7357.14306640625;
	setAttr ".tgi[0].ni[257].nvs" 18304;
	setAttr ".tgi[0].ni[258].x" 927.14288330078125;
	setAttr ".tgi[0].ni[258].y" 1794.2857666015625;
	setAttr ".tgi[0].ni[258].nvs" 18304;
	setAttr ".tgi[0].ni[259].x" 2101.428466796875;
	setAttr ".tgi[0].ni[259].y" -14958.5712890625;
	setAttr ".tgi[0].ni[259].nvs" 18304;
	setAttr ".tgi[0].ni[260].x" 554.28570556640625;
	setAttr ".tgi[0].ni[260].y" -3084.28564453125;
	setAttr ".tgi[0].ni[260].nvs" 18304;
	setAttr ".tgi[0].ni[261].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[261].y" -1724.2857666015625;
	setAttr ".tgi[0].ni[261].nvs" 18304;
	setAttr ".tgi[0].ni[262].x" 2098.571533203125;
	setAttr ".tgi[0].ni[262].y" -14438.5712890625;
	setAttr ".tgi[0].ni[262].nvs" 18304;
	setAttr ".tgi[0].ni[263].x" 927.14288330078125;
	setAttr ".tgi[0].ni[263].y" 4004.28564453125;
	setAttr ".tgi[0].ni[263].nvs" 18304;
	setAttr ".tgi[0].ni[264].x" -150;
	setAttr ".tgi[0].ni[264].y" 650;
	setAttr ".tgi[0].ni[264].nvs" 18304;
	setAttr ".tgi[0].ni[265].x" 215.71427917480469;
	setAttr ".tgi[0].ni[265].y" -1234.2857666015625;
	setAttr ".tgi[0].ni[265].nvs" 18304;
	setAttr ".tgi[0].ni[266].x" 927.14288330078125;
	setAttr ".tgi[0].ni[266].y" 4140;
	setAttr ".tgi[0].ni[266].nvs" 18304;
	setAttr ".tgi[0].ni[267].x" 554.28570556640625;
	setAttr ".tgi[0].ni[267].y" 8465.7138671875;
	setAttr ".tgi[0].ni[267].nvs" 18304;
	setAttr ".tgi[0].ni[268].x" -531.4285888671875;
	setAttr ".tgi[0].ni[268].y" 2490;
	setAttr ".tgi[0].ni[268].nvs" 18304;
	setAttr ".tgi[0].ni[269].x" 585.71429443359375;
	setAttr ".tgi[0].ni[269].y" -4030;
	setAttr ".tgi[0].ni[269].nvs" 18304;
	setAttr ".tgi[0].ni[270].x" 554.28570556640625;
	setAttr ".tgi[0].ni[270].y" -3287.142822265625;
	setAttr ".tgi[0].ni[270].nvs" 18304;
	setAttr ".tgi[0].ni[271].x" 927.14288330078125;
	setAttr ".tgi[0].ni[271].y" 888.5714111328125;
	setAttr ".tgi[0].ni[271].nvs" 18304;
	setAttr ".tgi[0].ni[272].x" 1794.2857666015625;
	setAttr ".tgi[0].ni[272].y" -10018.5712890625;
	setAttr ".tgi[0].ni[272].nvs" 18304;
	setAttr ".tgi[0].ni[273].x" -838.5714111328125;
	setAttr ".tgi[0].ni[273].y" 2695.71435546875;
	setAttr ".tgi[0].ni[273].nvs" 18304;
	setAttr ".tgi[0].ni[274].x" 2097.142822265625;
	setAttr ".tgi[0].ni[274].y" -9150;
	setAttr ".tgi[0].ni[274].nvs" 18304;
	setAttr ".tgi[0].ni[275].x" 215.71427917480469;
	setAttr ".tgi[0].ni[275].y" -657.14288330078125;
	setAttr ".tgi[0].ni[275].nvs" 18304;
	setAttr ".tgi[0].ni[276].x" 2084.28564453125;
	setAttr ".tgi[0].ni[276].y" -13398.5712890625;
	setAttr ".tgi[0].ni[276].nvs" 18304;
	setAttr ".tgi[0].ni[277].x" 2085.71435546875;
	setAttr ".tgi[0].ni[277].y" -13658.5712890625;
	setAttr ".tgi[0].ni[277].nvs" 18304;
	setAttr ".tgi[0].ni[278].x" 585.71429443359375;
	setAttr ".tgi[0].ni[278].y" 1300;
	setAttr ".tgi[0].ni[278].nvs" 18304;
	setAttr ".tgi[0].ni[279].x" -150;
	setAttr ".tgi[0].ni[279].y" 4294.28564453125;
	setAttr ".tgi[0].ni[279].nvs" 18304;
	setAttr ".tgi[0].ni[280].x" 137.14285278320312;
	setAttr ".tgi[0].ni[280].y" 8571.4287109375;
	setAttr ".tgi[0].ni[280].nvs" 18304;
	setAttr ".tgi[0].ni[281].x" 554.28570556640625;
	setAttr ".tgi[0].ni[281].y" -4194.28564453125;
	setAttr ".tgi[0].ni[281].nvs" 18304;
	setAttr ".tgi[0].ni[282].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[282].y" -698.5714111328125;
	setAttr ".tgi[0].ni[282].nvs" 18304;
	setAttr ".tgi[0].ni[283].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[283].y" 3974.28564453125;
	setAttr ".tgi[0].ni[283].nvs" 18304;
	setAttr ".tgi[0].ni[284].x" -1452.857177734375;
	setAttr ".tgi[0].ni[284].y" 2854.28564453125;
	setAttr ".tgi[0].ni[284].nvs" 18304;
	setAttr ".tgi[0].ni[285].x" 137.14285278320312;
	setAttr ".tgi[0].ni[285].y" -3912.857177734375;
	setAttr ".tgi[0].ni[285].nvs" 18304;
	setAttr ".tgi[0].ni[286].x" -321.42855834960938;
	setAttr ".tgi[0].ni[286].y" 5151.4287109375;
	setAttr ".tgi[0].ni[286].nvs" 18304;
	setAttr ".tgi[0].ni[287].x" 215.71427917480469;
	setAttr ".tgi[0].ni[287].y" -1437.142822265625;
	setAttr ".tgi[0].ni[287].nvs" 18304;
	setAttr ".tgi[0].ni[288].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[288].y" -3095.71435546875;
	setAttr ".tgi[0].ni[288].nvs" 18304;
	setAttr ".tgi[0].ni[289].x" 554.28570556640625;
	setAttr ".tgi[0].ni[289].y" -5665.71435546875;
	setAttr ".tgi[0].ni[289].nvs" 18304;
	setAttr ".tgi[0].ni[290].x" -531.4285888671875;
	setAttr ".tgi[0].ni[290].y" 68.571426391601562;
	setAttr ".tgi[0].ni[290].nvs" 18304;
	setAttr ".tgi[0].ni[291].x" 215.71427917480469;
	setAttr ".tgi[0].ni[291].y" -2858.571533203125;
	setAttr ".tgi[0].ni[291].nvs" 18304;
	setAttr ".tgi[0].ni[292].x" -150;
	setAttr ".tgi[0].ni[292].y" -77.142860412597656;
	setAttr ".tgi[0].ni[292].nvs" 18304;
	setAttr ".tgi[0].ni[293].x" -150;
	setAttr ".tgi[0].ni[293].y" 852.85711669921875;
	setAttr ".tgi[0].ni[293].nvs" 18304;
	setAttr ".tgi[0].ni[294].x" 1787.142822265625;
	setAttr ".tgi[0].ni[294].y" -9150;
	setAttr ".tgi[0].ni[294].nvs" 18304;
	setAttr ".tgi[0].ni[295].x" 215.71427917480469;
	setAttr ".tgi[0].ni[295].y" 782.85711669921875;
	setAttr ".tgi[0].ni[295].nvs" 18304;
	setAttr ".tgi[0].ni[296].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[296].y" -3928.571533203125;
	setAttr ".tgi[0].ni[296].nvs" 18304;
	setAttr ".tgi[0].ni[297].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[297].y" 2728.571533203125;
	setAttr ".tgi[0].ni[297].nvs" 18304;
	setAttr ".tgi[0].ni[298].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[298].y" 1962.857177734375;
	setAttr ".tgi[0].ni[298].nvs" 18304;
	setAttr ".tgi[0].ni[299].x" 554.28570556640625;
	setAttr ".tgi[0].ni[299].y" -8565.7138671875;
	setAttr ".tgi[0].ni[299].nvs" 18304;
	setAttr ".tgi[0].ni[300].x" 2100;
	setAttr ".tgi[0].ni[300].y" -14698.5712890625;
	setAttr ".tgi[0].ni[300].nvs" 18304;
	setAttr ".tgi[0].ni[301].x" 2040;
	setAttr ".tgi[0].ni[301].y" -12358.5712890625;
	setAttr ".tgi[0].ni[301].nvs" 18304;
	setAttr ".tgi[0].ni[302].x" -150;
	setAttr ".tgi[0].ni[302].y" 4021.428466796875;
	setAttr ".tgi[0].ni[302].nvs" 18304;
	setAttr ".tgi[0].ni[303].x" 215.71427917480469;
	setAttr ".tgi[0].ni[303].y" -1335.7142333984375;
	setAttr ".tgi[0].ni[303].nvs" 18304;
	setAttr ".tgi[0].ni[304].x" 137.14285278320312;
	setAttr ".tgi[0].ni[304].y" -3048.571533203125;
	setAttr ".tgi[0].ni[304].nvs" 18304;
	setAttr ".tgi[0].ni[305].x" 137.14285278320312;
	setAttr ".tgi[0].ni[305].y" 8470;
	setAttr ".tgi[0].ni[305].nvs" 18304;
	setAttr ".tgi[0].ni[306].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[306].y" 3670;
	setAttr ".tgi[0].ni[306].nvs" 18304;
	setAttr ".tgi[0].ni[307].x" 215.71427917480469;
	setAttr ".tgi[0].ni[307].y" -441.42855834960938;
	setAttr ".tgi[0].ni[307].nvs" 18304;
	setAttr ".tgi[0].ni[308].x" 1794.2857666015625;
	setAttr ".tgi[0].ni[308].y" -10148.5712890625;
	setAttr ".tgi[0].ni[308].nvs" 18304;
	setAttr ".tgi[0].ni[309].x" -150;
	setAttr ".tgi[0].ni[309].y" 1315.7142333984375;
	setAttr ".tgi[0].ni[309].nvs" 18304;
	setAttr ".tgi[0].ni[310].x" 554.28570556640625;
	setAttr ".tgi[0].ni[310].y" -3775.71435546875;
	setAttr ".tgi[0].ni[310].nvs" 18304;
	setAttr ".tgi[0].ni[311].x" 2031.4285888671875;
	setAttr ".tgi[0].ni[311].y" -11708.5712890625;
	setAttr ".tgi[0].ni[311].nvs" 18304;
	setAttr ".tgi[0].ni[312].x" -531.4285888671875;
	setAttr ".tgi[0].ni[312].y" -261.42855834960938;
	setAttr ".tgi[0].ni[312].nvs" 18304;
	setAttr ".tgi[0].ni[313].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[313].y" 3872.857177734375;
	setAttr ".tgi[0].ni[313].nvs" 18304;
	setAttr ".tgi[0].ni[314].x" 2101.428466796875;
	setAttr ".tgi[0].ni[314].y" -10148.5712890625;
	setAttr ".tgi[0].ni[314].nvs" 18304;
	setAttr ".tgi[0].ni[315].x" -1145.7142333984375;
	setAttr ".tgi[0].ni[315].y" 2530;
	setAttr ".tgi[0].ni[315].nvs" 18304;
	setAttr ".tgi[0].ni[316].x" 137.14285278320312;
	setAttr ".tgi[0].ni[316].y" 7515.71435546875;
	setAttr ".tgi[0].ni[316].nvs" 18304;
	setAttr ".tgi[0].ni[317].x" -531.4285888671875;
	setAttr ".tgi[0].ni[317].y" 1925.7142333984375;
	setAttr ".tgi[0].ni[317].nvs" 18304;
	setAttr ".tgi[0].ni[318].x" 554.28570556640625;
	setAttr ".tgi[0].ni[318].y" -5132.85693359375;
	setAttr ".tgi[0].ni[318].nvs" 18304;
	setAttr ".tgi[0].ni[319].x" 554.28570556640625;
	setAttr ".tgi[0].ni[319].y" -5868.5712890625;
	setAttr ".tgi[0].ni[319].nvs" 18304;
	setAttr ".tgi[0].ni[320].x" 554.28570556640625;
	setAttr ".tgi[0].ni[320].y" -4930;
	setAttr ".tgi[0].ni[320].nvs" 18304;
	setAttr ".tgi[0].ni[321].x" 215.71427917480469;
	setAttr ".tgi[0].ni[321].y" 1628.5714111328125;
	setAttr ".tgi[0].ni[321].nvs" 18304;
	setAttr ".tgi[0].ni[322].x" -838.5714111328125;
	setAttr ".tgi[0].ni[322].y" 1118.5714111328125;
	setAttr ".tgi[0].ni[322].nvs" 18304;
	setAttr ".tgi[0].ni[323].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[323].y" 4075.71435546875;
	setAttr ".tgi[0].ni[323].nvs" 18304;
	setAttr ".tgi[0].ni[324].x" 585.71429443359375;
	setAttr ".tgi[0].ni[324].y" -2105.71435546875;
	setAttr ".tgi[0].ni[324].nvs" 18304;
	setAttr ".tgi[0].ni[325].x" 554.28570556640625;
	setAttr ".tgi[0].ni[325].y" 3682.857177734375;
	setAttr ".tgi[0].ni[325].nvs" 18304;
	setAttr ".tgi[0].ni[326].x" 554.28570556640625;
	setAttr ".tgi[0].ni[326].y" 7031.4287109375;
	setAttr ".tgi[0].ni[326].nvs" 18304;
	setAttr ".tgi[0].ni[327].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[327].y" 2368.571533203125;
	setAttr ".tgi[0].ni[327].nvs" 18304;
	setAttr ".tgi[0].ni[328].x" 215.71427917480469;
	setAttr ".tgi[0].ni[328].y" 91.428573608398438;
	setAttr ".tgi[0].ni[328].nvs" 18304;
	setAttr ".tgi[0].ni[329].x" 585.71429443359375;
	setAttr ".tgi[0].ni[329].y" -4471.4287109375;
	setAttr ".tgi[0].ni[329].nvs" 18304;
	setAttr ".tgi[0].ni[330].x" 2088.571533203125;
	setAttr ".tgi[0].ni[330].y" -13918.5712890625;
	setAttr ".tgi[0].ni[330].nvs" 18304;
	setAttr ".tgi[0].ni[331].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[331].y" 3771.428466796875;
	setAttr ".tgi[0].ni[331].nvs" 18304;
	setAttr ".tgi[0].ni[332].x" -150;
	setAttr ".tgi[0].ni[332].y" -1967.142822265625;
	setAttr ".tgi[0].ni[332].nvs" 18304;
	setAttr ".tgi[0].ni[333].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[333].y" -165.71427917480469;
	setAttr ".tgi[0].ni[333].nvs" 18304;
	setAttr ".tgi[0].ni[334].x" 585.71429443359375;
	setAttr ".tgi[0].ni[334].y" 3018.571533203125;
	setAttr ".tgi[0].ni[334].nvs" 18304;
	setAttr ".tgi[0].ni[335].x" 2201.428466796875;
	setAttr ".tgi[0].ni[335].y" -10978.5712890625;
	setAttr ".tgi[0].ni[335].nvs" 18304;
	setAttr ".tgi[0].ni[336].x" 554.28570556640625;
	setAttr ".tgi[0].ni[336].y" 9201.4287109375;
	setAttr ".tgi[0].ni[336].nvs" 18304;
	setAttr ".tgi[0].ni[337].x" 137.14285278320312;
	setAttr ".tgi[0].ni[337].y" -2788.571533203125;
	setAttr ".tgi[0].ni[337].nvs" 18304;
	setAttr ".tgi[0].ni[338].x" 585.71429443359375;
	setAttr ".tgi[0].ni[338].y" -1890;
	setAttr ".tgi[0].ni[338].nvs" 18304;
	setAttr ".tgi[0].ni[339].x" -1145.7142333984375;
	setAttr ".tgi[0].ni[339].y" 2631.428466796875;
	setAttr ".tgi[0].ni[339].nvs" 18304;
	setAttr ".tgi[0].ni[340].x" -150;
	setAttr ".tgi[0].ni[340].y" -1865.7142333984375;
	setAttr ".tgi[0].ni[340].nvs" 18304;
	setAttr ".tgi[0].ni[341].x" 2101.428466796875;
	setAttr ".tgi[0].ni[341].y" -14828.5712890625;
	setAttr ".tgi[0].ni[341].nvs" 18304;
	setAttr ".tgi[0].ni[342].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[342].y" -800;
	setAttr ".tgi[0].ni[342].nvs" 18304;
	setAttr ".tgi[0].ni[343].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[343].y" -4977.14306640625;
	setAttr ".tgi[0].ni[343].nvs" 18304;
	setAttr ".tgi[0].ni[344].x" 215.71427917480469;
	setAttr ".tgi[0].ni[344].y" -4622.85693359375;
	setAttr ".tgi[0].ni[344].nvs" 18304;
	setAttr ".tgi[0].ni[345].x" 215.71427917480469;
	setAttr ".tgi[0].ni[345].y" 4050;
	setAttr ".tgi[0].ni[345].nvs" 18304;
	setAttr ".tgi[0].ni[346].x" 927.14288330078125;
	setAttr ".tgi[0].ni[346].y" -117.14286041259766;
	setAttr ".tgi[0].ni[346].nvs" 18304;
	setAttr ".tgi[0].ni[347].x" 215.71427917480469;
	setAttr ".tgi[0].ni[347].y" 1170;
	setAttr ".tgi[0].ni[347].nvs" 18304;
	setAttr ".tgi[0].ni[348].x" 2018.5714111328125;
	setAttr ".tgi[0].ni[348].y" -10928.5712890625;
	setAttr ".tgi[0].ni[348].nvs" 18304;
	setAttr ".tgi[0].ni[349].x" 215.71427917480469;
	setAttr ".tgi[0].ni[349].y" -3721.428466796875;
	setAttr ".tgi[0].ni[349].nvs" 18304;
	setAttr ".tgi[0].ni[350].x" 1265.7142333984375;
	setAttr ".tgi[0].ni[350].y" -1165.7142333984375;
	setAttr ".tgi[0].ni[350].nvs" 18304;
	setAttr ".tgi[0].ni[351].x" 1794.2857666015625;
	setAttr ".tgi[0].ni[351].y" -10408.5712890625;
	setAttr ".tgi[0].ni[351].nvs" 18304;
	setAttr ".tgi[0].ni[352].x" -150;
	setAttr ".tgi[0].ni[352].y" -2487.142822265625;
	setAttr ".tgi[0].ni[352].nvs" 18304;
	setAttr ".tgi[0].ni[353].x" 554.28570556640625;
	setAttr ".tgi[0].ni[353].y" -1048.5714111328125;
	setAttr ".tgi[0].ni[353].nvs" 18304;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr -av -k on ".unw" 1;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".rm";
	setAttr -av -k on ".lm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -av -k on ".hom";
	setAttr -av -k on ".hodm";
	setAttr -av -k on ".xry";
	setAttr -av -k on ".jxr";
	setAttr -av -k on ".sslt";
	setAttr -av -k on ".cbr";
	setAttr -av -k on ".bbr";
	setAttr -av -k on ".mhl";
	setAttr -av -k on ".cons";
	setAttr -av -k on ".vac";
	setAttr -av -k on ".hwi";
	setAttr -av -k on ".csvd";
	setAttr -av -k on ".ta";
	setAttr -av -k on ".tq";
	setAttr -av -k on ".ts";
	setAttr -av -k on ".etmr";
	setAttr -k on ".tmrm";
	setAttr -av -k on ".tmr";
	setAttr -av -k on ".aoon";
	setAttr -av -k on ".aoam";
	setAttr -av -k on ".aora";
	setAttr -av -k on ".aofr";
	setAttr -av -k on ".aosm";
	setAttr -av -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av -k on ".mbe";
	setAttr -av -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".mbc";
	setAttr -av -k on ".mbfa";
	setAttr -av -k on ".mbftb";
	setAttr -av -k on ".mbftg";
	setAttr -av -k on ".mbftr";
	setAttr -av -k on ".mbfta";
	setAttr -av -k on ".mbfe";
	setAttr -av -k on ".mbme";
	setAttr -av -k on ".mbcsx";
	setAttr -av -k on ".mbcsy";
	setAttr -av -k on ".mbasx";
	setAttr -av -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -av -k on ".blth";
	setAttr -av -k on ".blfr";
	setAttr -av -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av -k on ".msaa";
	setAttr -av -k on ".aasc";
	setAttr -av -k on ".aasq";
	setAttr -av -k on ".laa";
	setAttr -k on ".gamm";
	setAttr -k on ".gmmv";
	setAttr -k on ".fprt" yes;
	setAttr -av -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 19 ".st";
	setAttr -k on ".an";
	setAttr -k on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 9 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 23 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
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
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".macc";
	setAttr -av -k on ".macd";
	setAttr -av -k on ".macq";
	setAttr -av -k on ".mcfr";
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
	setAttr -av -cb on ".ep";
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
	setAttr -av -k on ".rv";
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
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
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
	setAttr -av -k on ".hwfr";
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "multiplyDivide3.ox" "mainPoser_clusterHandle.sx";
connectAttr "multiplyDivide3.ox" "mainPoser_clusterHandle.sy";
connectAttr "multiplyDivide3.ox" "mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere4.os" "root_poserShape.cr";
connectAttr "side_mainPoser.sx" "side_mainPoser.sy" -l on;
connectAttr "side_mainPoser.sx" "side_mainPoser.sz" -l on;
connectAttr "side___cluster4GroupId.id" "side_mainPoserShape.iog.og[1].gid";
connectAttr "side___cluster4Set.mwc" "side_mainPoserShape.iog.og[1].gco";
connectAttr "side___groupId42.id" "side_mainPoserShape.iog.og[2].gid";
connectAttr "side___tweakSet24.mwc" "side_mainPoserShape.iog.og[2].gco";
connectAttr "side_mainPoser_clusterHandleCluster.og[0]" "side_mainPoserShape.cr"
		;
connectAttr "side___tweak24.pl[0].cp[0]" "side_mainPoserShape.twl";
connectAttr "multiplyDivide4.ox" "side_mainPoser_clusterHandle.sx";
connectAttr "multiplyDivide4.ox" "side_mainPoser_clusterHandle.sy";
connectAttr "multiplyDivide4.ox" "side_mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere1.os" "in_poserShape.cr";
connectAttr "middle_makeNurbSphere.os" "middle_poserShape.cr";
connectAttr "out_makeNurbSphere.os" "out_poserShape.cr";
connectAttr "inner_1_poser_makeNurbSphere.os" "inner_1_poserShape.cr";
connectAttr "outer_1_poser_makeNurbSphere.os" "outer_1_poserShape.cr";
connectAttr "makeNurbSphere5.os" "center_poserShape.cr";
connectAttr "r_brow_controlInitLoc_decMat.otx" "r_brow_controlInitLoc.tx";
connectAttr "r_brow_controlInitLoc_decMat.oty" "r_brow_controlInitLoc.ty";
connectAttr "r_brow_controlInitLoc_decMat.otz" "r_brow_controlInitLoc.tz";
connectAttr "r_brow_controlInitLoc_decMat.orx" "r_brow_controlInitLoc.rx";
connectAttr "r_brow_controlInitLoc_decMat.ory" "r_brow_controlInitLoc.ry";
connectAttr "r_brow_controlInitLoc_decMat.orz" "r_brow_controlInitLoc.rz";
connectAttr "r_brow_controlInitLoc_decMat.osx" "r_brow_controlInitLoc.sx";
connectAttr "r_brow_controlInitLoc_decMat.osy" "r_brow_controlInitLoc.sy";
connectAttr "r_brow_controlInitLoc_decMat.osz" "r_brow_controlInitLoc.sz";
connectAttr "in_poser.t" "r_brow_1_controlInitLoc.t";
connectAttr "in_poser.r" "r_brow_1_controlInitLoc.r";
connectAttr "in_poser.s" "r_brow_1_controlInitLoc.s";
connectAttr "in_poserOrientShape.wp" "posers_curveShape.cp[0]";
connectAttr "inner_1_poserOrientShape.wp" "posers_curveShape.cp[1]";
connectAttr "middle_poserOrientShape.wp" "posers_curveShape.cp[2]";
connectAttr "outer_1_poserOrientShape.wp" "posers_curveShape.cp[3]";
connectAttr "out_poserOrientShape.wp" "posers_curveShape.cp[4]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector.wm" "main_controls.opm";
connectAttr "multMatrix1.o" "c_brow_group_2.opm";
connectAttr "multMatrix13.o" "r_brow_group.opm";
connectAttr "l_browShape.ws" "r_browShape.cr";
connectAttr "l_brow_1_xform_multMat.o" "r_brow_in_group.opm";
connectAttr "l_brow_inShape.ws" "r_brow_inShape.cr";
connectAttr "l_brow_in_inner_1_target_multMatrix.o" "r_brow_in_inner_1_target.opm"
		;
connectAttr "multMatrix26.o" "r_brow_c_target.opm";
connectAttr "r_brow_in.t" "r_brow_c_target.t";
connectAttr "l_brow_1_xform_multMat1.o" "r_brow_mid_group.opm";
connectAttr "l_brow_midShape.ws" "r_brow_midShape.cr";
connectAttr "l_brow_mid_inner_1_target_multMatrix.o" "r_brow_mid_inner_1_target.opm"
		;
connectAttr "l_brow_mid_outer_1_target_multMatrix.o" "r_brow_mid_outer_1_target.opm"
		;
connectAttr "l_brow_3_xform_multMat1.o" "r_brow_out_group.opm";
connectAttr "l_brow_outShape.ws" "r_brow_outShape.cr";
connectAttr "l_brow_out_outer_1_target_multMatrix.o" "r_brow_out_outer_1_target.opm"
		;
connectAttr "r_brow_inner_1_multMatrix.o" "r_brow_inner_1_group.opm";
connectAttr "l_brow_inner_1.middleFollow" "r_brow_inner_1.middleFollow";
connectAttr "r_brow_outer_1_multMatrix.o" "r_brow_outer_1_group.opm";
connectAttr "l_brow_outer_1.middleFollow" "r_brow_outer_1.middleFollow";
connectAttr "multMatrix2.o" "l_brow_group.opm";
connectAttr "l_brow_1_xform_multMat.o" "l_brow_in_group.opm";
connectAttr "l_brow_in_inner_1_target_multMatrix.o" "l_brow_in_inner_1_target.opm"
		;
connectAttr "multMatrix26.o" "l_brow_c_target.opm";
connectAttr "l_brow_in.t" "l_brow_c_target.t";
connectAttr "l_brow_1_xform_multMat1.o" "l_brow_mid_group.opm";
connectAttr "l_brow_mid_scaleX.o" "l_brow_mid.sx";
connectAttr "l_brow_mid_scaleY.o" "l_brow_mid.sy";
connectAttr "l_brow_mid_scaleZ.o" "l_brow_mid.sz";
connectAttr "l_brow_mid_rotateX.o" "l_brow_mid.rx";
connectAttr "l_brow_mid_rotateY.o" "l_brow_mid.ry";
connectAttr "l_brow_mid_rotateZ.o" "l_brow_mid.rz";
connectAttr "l_brow_mid_inner_1_target_multMatrix.o" "l_brow_mid_inner_1_target.opm"
		;
connectAttr "l_brow_mid_outer_1_target_multMatrix.o" "l_brow_mid_outer_1_target.opm"
		;
connectAttr "l_brow_3_xform_multMat1.o" "l_brow_out_group.opm";
connectAttr "l_brow_out_outer_1_target_multMatrix.o" "l_brow_out_outer_1_target.opm"
		;
connectAttr "l_brow_inner_1_multMatrix.o" "l_brow_inner_1_group.opm";
connectAttr "l_brow_outer_1_multMatrix.o" "l_brow_outer_1_group.opm";
connectAttr "l_brow_in_locShape.wp" "l_curveShape.cp[0]";
connectAttr "l_brow_inner_1_locShape.wp" "l_curveShape.cp[1]";
connectAttr "l_brow_mid_locShape.wp" "l_curveShape.cp[2]";
connectAttr "l_brow_outer_1_locShape.wp" "l_curveShape.cp[3]";
connectAttr "l_brow_out_locShape.wp" "l_curveShape.cp[4]";
connectAttr "r_brow_in_locShape.wp" "r_curveShape.cp[0]";
connectAttr "r_brow_inner_1_locShape.wp" "r_curveShape.cp[1]";
connectAttr "r_brow_mid_locShape.wp" "r_curveShape.cp[2]";
connectAttr "r_brow_outer_1_locShape.wp" "r_curveShape.cp[3]";
connectAttr "r_brow_out_locShape.wp" "r_curveShape.cp[4]";
connectAttr "decomposeMatrix83.osx" "root_outJoint.sx";
connectAttr "decomposeMatrix83.osy" "root_outJoint.sy";
connectAttr "decomposeMatrix83.osz" "root_outJoint.sz";
connectAttr "decomposeMatrix83.otx" "root_outJoint.tx";
connectAttr "decomposeMatrix83.oty" "root_outJoint.ty";
connectAttr "decomposeMatrix83.otz" "root_outJoint.tz";
connectAttr "decomposeMatrix83.orx" "root_outJoint.rx";
connectAttr "decomposeMatrix83.ory" "root_outJoint.ry";
connectAttr "decomposeMatrix83.orz" "root_outJoint.rz";
connectAttr "c_brow_skinJoint_decMat.otx" "c_outJoint.tx";
connectAttr "c_brow_skinJoint_decMat.oty" "c_outJoint.ty";
connectAttr "c_brow_skinJoint_decMat.otz" "c_outJoint.tz";
connectAttr "c_brow_skinJoint_decMat.orx" "c_outJoint.rx";
connectAttr "c_brow_skinJoint_decMat.ory" "c_outJoint.ry";
connectAttr "c_brow_skinJoint_decMat.orz" "c_outJoint.rz";
connectAttr "c_brow_skinJoint_decMat.osx" "c_outJoint.sx";
connectAttr "c_brow_skinJoint_decMat.osy" "c_outJoint.sy";
connectAttr "c_brow_skinJoint_decMat.osz" "c_outJoint.sz";
connectAttr "root_outJoint.s" "c_outJoint.is";
connectAttr "root_outJoint.s" "l_0_outJoint.is";
connectAttr "l_0_motionPath.ac" "l_0_outJoint.t";
connectAttr "l_0_motionPath.r" "l_0_outJoint.r";
connectAttr "root_outJoint.s" "l_1_outJoint.is";
connectAttr "l_1_motionPath.ac" "l_1_outJoint.t";
connectAttr "l_1_motionPath.r" "l_1_outJoint.r";
connectAttr "root_outJoint.s" "l_2_outJoint.is";
connectAttr "l_2_motionPath.ac" "l_2_outJoint.t";
connectAttr "l_2_motionPath.r" "l_2_outJoint.r";
connectAttr "root_outJoint.s" "l_3_outJoint.is";
connectAttr "l_3_motionPath.ac" "l_3_outJoint.t";
connectAttr "l_3_motionPath.r" "l_3_outJoint.r";
connectAttr "root_outJoint.s" "l_4_outJoint.is";
connectAttr "l_4_motionPath.ac" "l_4_outJoint.t";
connectAttr "l_4_motionPath.r" "l_4_outJoint.r";
connectAttr "root_outJoint.s" "l_5_outJoint.is";
connectAttr "l_5_motionPath.ac" "l_5_outJoint.t";
connectAttr "l_5_motionPath.r" "l_5_outJoint.r";
connectAttr "root_outJoint.s" "r_0_outJoint.is";
connectAttr "l_0_outJoint.pos" "r_0_outJoint.pos";
connectAttr "r_0_motionPath.ac" "r_0_outJoint.t";
connectAttr "r_0_motionPath.r" "r_0_outJoint.r";
connectAttr "root_outJoint.s" "r_1_outJoint.is";
connectAttr "l_1_outJoint.pos" "r_1_outJoint.pos";
connectAttr "r_1_motionPath.ac" "r_1_outJoint.t";
connectAttr "r_1_motionPath.r" "r_1_outJoint.r";
connectAttr "root_outJoint.s" "r_2_outJoint.is";
connectAttr "l_2_outJoint.pos" "r_2_outJoint.pos";
connectAttr "r_2_motionPath.ac" "r_2_outJoint.t";
connectAttr "r_2_motionPath.r" "r_2_outJoint.r";
connectAttr "root_outJoint.s" "r_3_outJoint.is";
connectAttr "l_3_outJoint.pos" "r_3_outJoint.pos";
connectAttr "r_3_motionPath.ac" "r_3_outJoint.t";
connectAttr "r_3_motionPath.r" "r_3_outJoint.r";
connectAttr "root_outJoint.s" "r_4_outJoint.is";
connectAttr "l_4_outJoint.pos" "r_4_outJoint.pos";
connectAttr "r_4_motionPath.ac" "r_4_outJoint.t";
connectAttr "r_4_motionPath.r" "r_4_outJoint.r";
connectAttr "root_outJoint.s" "r_5_outJoint.is";
connectAttr "l_5_outJoint.pos" "r_5_outJoint.pos";
connectAttr "r_5_motionPath.ac" "r_5_outJoint.t";
connectAttr "r_5_motionPath.r" "r_5_outJoint.r";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "center_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "center_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "center_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_1_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_1_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_1_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_2_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_2_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_2_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "center_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "center_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "center_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_1_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_1_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_1_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_2_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_2_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_2_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader1SG1.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr "hyperLayout2.msg" "hyperView2.hl";
connectAttr "hyperLayout3.msg" "hyperView3.hl";
connectAttr "hyperLayout4.msg" "hyperView4.hl";
connectAttr "multMatrix11.o" "c_brow_skinJoint_decMat.imat";
connectAttr "in_poser.wm" "l_brow_1_xform_multMat.i[0]";
connectAttr "side_mainPoser.wim" "l_brow_1_xform_multMat.i[1]";
connectAttr "c_outJoint.iog" "skinJointsSet.dsm" -na;
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
connectAttr "red_rsMat.oc" "red_rsSG.ss";
connectAttr "red_rsSG.msg" "root_materialInfo1.sg";
connectAttr "red_rsMat.msg" "root_materialInfo1.m";
connectAttr "red_rsMat.msg" "root_materialInfo1.t" -na;
connectAttr "green_rsMat.oc" "green_rsSG.ss";
connectAttr "green_rsSG.msg" "root_materialInfo2.sg";
connectAttr "green_rsMat.msg" "root_materialInfo2.m";
connectAttr "green_rsMat.msg" "root_materialInfo2.t" -na;
connectAttr "blue_rsMat.oc" "blue_rsSG.ss";
connectAttr "blue_rsSG.msg" "root_materialInfo3.sg";
connectAttr "blue_rsMat.msg" "root_materialInfo3.m";
connectAttr "blue_rsMat.msg" "root_materialInfo3.t" -na;
connectAttr "side___cluster4GroupId.msg" "side___cluster4Set.gn" -na;
connectAttr "side_mainPoserShape.iog.og[1]" "side___cluster4Set.dsm" -na;
connectAttr "side_mainPoser_clusterHandleCluster.msg" "side___cluster4Set.ub[0]"
		;
connectAttr "side___cluster4GroupParts.og" "side_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "side___cluster4GroupId.id" "side_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "side_mainPoser_clusterHandle.wm" "side_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "side_mainPoser_clusterHandleShape.x" "side_mainPoser_clusterHandleCluster.x"
		;
connectAttr "side___tweak24.og[0]" "side___cluster4GroupParts.ig";
connectAttr "side___cluster4GroupId.id" "side___cluster4GroupParts.gi";
connectAttr "side___groupParts42.og" "side___tweak24.ip[0].ig";
connectAttr "side___groupId42.id" "side___tweak24.ip[0].gi";
connectAttr "side___groupId42.msg" "side___tweakSet24.gn" -na;
connectAttr "side_mainPoserShape.iog.og[2]" "side___tweakSet24.dsm" -na;
connectAttr "side___tweak24.msg" "side___tweakSet24.ub[0]";
connectAttr "side_mainPoserShapeOrig.ws" "side___groupParts42.ig";
connectAttr "side___groupId42.id" "side___groupParts42.gi";
connectAttr "center_surfaceShader1SG.msg" "center_materialInfo1.sg";
connectAttr "center_surfaceShader2SG.msg" "center_materialInfo2.sg";
connectAttr "center_surfaceShader3SG.msg" "center_materialInfo3.sg";
connectAttr "side_1_surfaceShader1SG.msg" "side_1_materialInfo1.sg";
connectAttr "side_1_surfaceShader2SG.msg" "side_1_materialInfo2.sg";
connectAttr "side_1_surfaceShader3SG.msg" "side_1_materialInfo3.sg";
connectAttr "side_2_surfaceShader1SG.msg" "side_2_materialInfo1.sg";
connectAttr "side_2_surfaceShader2SG.msg" "side_2_materialInfo2.sg";
connectAttr "side_2_surfaceShader3SG.msg" "side_2_materialInfo3.sg";
connectAttr "side_3_surfaceShader1SG.msg" "side_3_materialInfo1.sg";
connectAttr "side_3_surfaceShader2SG.msg" "side_3_materialInfo2.sg";
connectAttr "side_3_surfaceShader3SG.msg" "side_3_materialInfo3.sg";
connectAttr "black_rsMat.oc" "black_rsSG.ss";
connectAttr "black_rsSG.msg" "side_2_materialInfo4.sg";
connectAttr "black_rsMat.msg" "side_2_materialInfo4.m";
connectAttr "black_rsMat.msg" "side_2_materialInfo4.t" -na;
connectAttr "side_3_surfaceShader1SG1.msg" "side_3_materialInfo4.sg";
connectAttr "center_poser.wm" "multMatrix3.i[0]";
connectAttr "root_poser.wim" "multMatrix3.i[1]";
connectAttr "multMatrix3.o" "decomposeMatrix81.imat";
connectAttr "multMatrix4.o" "decomposeMatrix82.imat";
connectAttr "root_poser.wm" "multMatrix4.i[0]";
connectAttr "in_poser.wim" "multMatrix4.i[1]";
connectAttr "r_brow_controlInitLoc_multMat.o" "r_brow_controlInitLoc_decMat.imat"
		;
connectAttr "side_mainPoser.wm" "r_brow_controlInitLoc_multMat.i[0]";
connectAttr "composeMatrix1.omat" "r_brow_controlInitLoc_multMat.i[1]";
connectAttr "c_brow.wm" "multMatrix11.i[0]";
connectAttr "root_outJoint.wim" "multMatrix11.i[1]";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1z";
connectAttr "in_poser.size" "multiplyDivide2.i2x";
connectAttr "multiplyDivide2.ox" "makeNurbSphere1.r";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1z";
connectAttr "mainPoser.size" "multiplyDivide3.i2x";
connectAttr "root_poser.size" "multiplyDivide3.i2y";
connectAttr "center_poser.size" "multiplyDivide3.i2z";
connectAttr "multiplyDivide3.oy" "makeNurbSphere4.r";
connectAttr "multiplyDivide3.oz" "makeNurbSphere5.r";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1y";
connectAttr "side_mainPoser.size" "multiplyDivide4.i2x";
connectAttr "mainPoser.lineWidth" "multiplyDivide4.i2y";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "multiplyDivide4.oy" "sweepMeshCreator1.scaleProfileX";
connectAttr "root_connector.wm" "multMatrix12.i[0]";
connectAttr "outJoints.wim" "multMatrix12.i[1]";
connectAttr "multMatrix12.o" "decomposeMatrix83.imat";
connectAttr "middle_size_multDoubleLinear.o" "middle_makeNurbSphere.r";
connectAttr "middle_poser.size" "middle_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "middle_size_multDoubleLinear.i2";
connectAttr "out_size_multDoubleLinear.o" "out_makeNurbSphere.r";
connectAttr "out_poser.size" "out_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "out_size_multDoubleLinear.i2";
connectAttr "side_mainPoser.wm" "multMatrix2.i[0]";
connectAttr "root_poser.wim" "multMatrix2.i[1]";
connectAttr "multMatrix2.o" "multMatrix13.i[0]";
connectAttr "composeMatrix2.omat" "multMatrix13.i[1]";
connectAttr "out_poser.wm" "l_brow_3_xform_multMat1.i[0]";
connectAttr "side_mainPoser.wim" "l_brow_3_xform_multMat1.i[1]";
connectAttr "middle_poser.wm" "l_brow_1_xform_multMat1.i[0]";
connectAttr "side_mainPoser.wim" "l_brow_1_xform_multMat1.i[1]";
connectAttr "blendMatrix8.omat" "multMatrix1.i[0]";
connectAttr "main_controls.wim" "multMatrix1.i[1]";
connectAttr "in_poser.wim" "multMatrix14.i[1]";
connectAttr "middle_poser.wim" "multMatrix15.i[1]";
connectAttr "l_brow.wim" "multMatrix16.i[1]";
connectAttr "middle_poser.wim" "multMatrix17.i[1]";
connectAttr "in_poser.wim" "multMatrix18.i[1]";
connectAttr "l_brow.wim" "multMatrix19.i[1]";
connectAttr "out_poser.wim" "multMatrix20.i[1]";
connectAttr "middle_poser.wim" "multMatrix21.i[1]";
connectAttr "l_brow.wim" "multMatrix22.i[1]";
connectAttr "r_brow.wim" "multMatrix23.i[1]";
connectAttr "r_brow.wim" "multMatrix24.i[1]";
connectAttr "r_brow.wim" "multMatrix25.i[1]";
connectAttr "center_poser.wm" "multMatrix26.i[0]";
connectAttr "in_poser.wim" "multMatrix26.i[1]";
connectAttr "l_brow_c_target.wm" "blendMatrix8.imat";
connectAttr "r_brow_c_target.wm" "blendMatrix8.tgt[0].tmat";
connectAttr "mod.msg" "bindPose1.m[0]";
connectAttr "output.msg" "bindPose1.m[1]";
connectAttr "outJoints.msg" "bindPose1.m[2]";
connectAttr "root_outJoint.msg" "bindPose1.m[3]";
connectAttr "c_outJoint.msg" "bindPose1.m[4]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "root_outJoint.bps" "bindPose1.wm[3]";
connectAttr "c_outJoint.bps" "bindPose1.wm[4]";
connectAttr "l_brow_mid.s" "multiplyDivide5.i2";
connectAttr "c_brow.msg" "c_brow_tag.act";
connectAttr "r_brow.msg" "r_brow_tag.act";
connectAttr "r_brow_in.msg" "r_brow_in_tag.act";
connectAttr "r_brow_mid.msg" "r_brow_mid_tag.act";
connectAttr "r_brow_out.msg" "r_brow_out_tag.act";
connectAttr "l_brow.msg" "l_brow_tag.act";
connectAttr "l_brow_in.msg" "l_brow_in_tag.act";
connectAttr "l_brow_mid.msg" "l_brow_mid_tag.act";
connectAttr "l_brow_out.msg" "l_brow_out_tag.act";
connectAttr "l_curveShape.ws" "l_0_motionPath.gp";
connectAttr "l_0_outJoint.pos" "l_0_motionPath.u";
connectAttr "mainPoser.jointsSlide" "l_0_motionPath.fm";
connectAttr "l_curveShape.ws" "l_1_motionPath.gp";
connectAttr "l_1_outJoint.pos" "l_1_motionPath.u";
connectAttr "mainPoser.jointsSlide" "l_1_motionPath.fm";
connectAttr "l_curveShape.ws" "l_2_motionPath.gp";
connectAttr "l_2_outJoint.pos" "l_2_motionPath.u";
connectAttr "mainPoser.jointsSlide" "l_2_motionPath.fm";
connectAttr "l_curveShape.ws" "l_3_motionPath.gp";
connectAttr "l_3_outJoint.pos" "l_3_motionPath.u";
connectAttr "mainPoser.jointsSlide" "l_3_motionPath.fm";
connectAttr "l_curveShape.ws" "l_4_motionPath.gp";
connectAttr "l_4_outJoint.pos" "l_4_motionPath.u";
connectAttr "mainPoser.jointsSlide" "l_4_motionPath.fm";
connectAttr "l_curveShape.ws" "l_5_motionPath.gp";
connectAttr "l_5_outJoint.pos" "l_5_motionPath.u";
connectAttr "mainPoser.jointsSlide" "l_5_motionPath.fm";
connectAttr "r_curveShape.ws" "r_0_motionPath.gp";
connectAttr "r_0_outJoint.pos" "r_0_motionPath.u";
connectAttr "mainPoser.jointsSlide" "r_0_motionPath.fm";
connectAttr "r_curveShape.ws" "r_1_motionPath.gp";
connectAttr "r_1_outJoint.pos" "r_1_motionPath.u";
connectAttr "mainPoser.jointsSlide" "r_1_motionPath.fm";
connectAttr "r_curveShape.ws" "r_2_motionPath.gp";
connectAttr "r_2_outJoint.pos" "r_2_motionPath.u";
connectAttr "mainPoser.jointsSlide" "r_2_motionPath.fm";
connectAttr "r_curveShape.ws" "r_3_motionPath.gp";
connectAttr "r_3_outJoint.pos" "r_3_motionPath.u";
connectAttr "mainPoser.jointsSlide" "r_3_motionPath.fm";
connectAttr "r_curveShape.ws" "r_4_motionPath.gp";
connectAttr "r_4_outJoint.pos" "r_4_motionPath.u";
connectAttr "mainPoser.jointsSlide" "r_4_motionPath.fm";
connectAttr "r_curveShape.ws" "r_5_motionPath.gp";
connectAttr "r_5_outJoint.pos" "r_5_motionPath.u";
connectAttr "mainPoser.jointsSlide" "r_5_motionPath.fm";
connectAttr "inner_1_poser_multDoubleLinear.o" "inner_1_poser_makeNurbSphere.r";
connectAttr "mainPoser.globalSize" "inner_1_poser_multDoubleLinear.i1";
connectAttr "inner_1_poser.size" "inner_1_poser_multDoubleLinear.i2";
connectAttr "inner_1_poser.wm" "l_brow_mid_inner_1_target_multMatrix.i[0]";
connectAttr "middle_poser.wim" "l_brow_mid_inner_1_target_multMatrix.i[1]";
connectAttr "inner_1_poser.wm" "l_brow_in_inner_1_target_multMatrix.i[0]";
connectAttr "in_poser.wim" "l_brow_in_inner_1_target_multMatrix.i[1]";
connectAttr "l_brow_inner_1_pickMatrix.tmat" "l_brow_inner_1_multMatrix.i[0]";
connectAttr "l_brow.wim" "l_brow_inner_1_multMatrix.i[1]";
connectAttr "l_brow_inner_1_blendMatrix.omat" "l_brow_inner_1_pickMatrix.imat";
connectAttr "l_brow_in_inner_1_target.wm" "l_brow_inner_1_blendMatrix.imat";
connectAttr "l_brow_mid_inner_1_target.wm" "l_brow_inner_1_blendMatrix.tgt[0].tmat"
		;
connectAttr "l_brow_inner_1.middleFollow" "l_brow_inner_1_blendMatrix.env";
connectAttr "r_brow_inner_1_pickMatrix.tmat" "r_brow_inner_1_multMatrix.i[0]";
connectAttr "r_brow.wim" "r_brow_inner_1_multMatrix.i[1]";
connectAttr "r_brow_inner_1_blendMatrix.omat" "r_brow_inner_1_pickMatrix.imat";
connectAttr "r_brow_in_inner_1_target.wm" "r_brow_inner_1_blendMatrix.imat";
connectAttr "r_brow_mid_inner_1_target.wm" "r_brow_inner_1_blendMatrix.tgt[0].tmat"
		;
connectAttr "r_brow_inner_1.middleFollow" "r_brow_inner_1_blendMatrix.env";
connectAttr "outer_1_poser_multDoubleLinear.o" "outer_1_poser_makeNurbSphere.r";
connectAttr "mainPoser.globalSize" "outer_1_poser_multDoubleLinear.i1";
connectAttr "outer_1_poser.size" "outer_1_poser_multDoubleLinear.i2";
connectAttr "outer_1_poser.wm" "l_brow_mid_outer_1_target_multMatrix.i[0]";
connectAttr "middle_poser.wim" "l_brow_mid_outer_1_target_multMatrix.i[1]";
connectAttr "outer_1_poser.wm" "l_brow_out_outer_1_target_multMatrix.i[0]";
connectAttr "out_poser.wim" "l_brow_out_outer_1_target_multMatrix.i[1]";
connectAttr "l_brow_outer_1_pickMatrix.tmat" "l_brow_outer_1_multMatrix.i[0]";
connectAttr "l_brow.wim" "l_brow_outer_1_multMatrix.i[1]";
connectAttr "l_brow_outer_1_blendMatrix.omat" "l_brow_outer_1_pickMatrix.imat";
connectAttr "l_brow_out_outer_1_target.wm" "l_brow_outer_1_blendMatrix.imat";
connectAttr "l_brow_mid_outer_1_target.wm" "l_brow_outer_1_blendMatrix.tgt[0].tmat"
		;
connectAttr "l_brow_outer_1.middleFollow" "l_brow_outer_1_blendMatrix.env";
connectAttr "r_brow_outer_1_pickMatrix.tmat" "r_brow_outer_1_multMatrix.i[0]";
connectAttr "r_brow.wim" "r_brow_outer_1_multMatrix.i[1]";
connectAttr "r_brow_outer_1_blendMatrix.omat" "r_brow_outer_1_pickMatrix.imat";
connectAttr "r_brow_out_outer_1_target.wm" "r_brow_outer_1_blendMatrix.imat";
connectAttr "r_brow_mid_outer_1_target.wm" "r_brow_outer_1_blendMatrix.tgt[0].tmat"
		;
connectAttr "r_brow_outer_1.middleFollow" "r_brow_outer_1_blendMatrix.env";
connectAttr "r_brow_out.iog" "r_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_in.iog" "r_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_mid.iog" "r_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_mid_local.iog" "r_add_moduleControlSet.dsm" -na;
connectAttr "r_brow_out_local.iog" "r_add_moduleControlSet.dsm" -na;
connectAttr "r_brow_inner_1.iog" "r_add_moduleControlSet.dsm" -na;
connectAttr "r_brow_outer_1.iog" "r_add_moduleControlSet.dsm" -na;
connectAttr "r_brow_in_local.iog" "r_add_moduleControlSet.dsm" -na;
connectAttr "r_main_moduleControlSet.msg" "r_moduleControlSet.dnsm" -na;
connectAttr "r_add_moduleControlSet.msg" "r_moduleControlSet.dnsm" -na;
connectAttr "l_brow_in.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "l_brow_mid.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "l_brow_out.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "l_brow_in_local.iog" "l_add_moduleControlSet.dsm" -na;
connectAttr "l_brow_mid_local.iog" "l_add_moduleControlSet.dsm" -na;
connectAttr "l_brow_outer_1.iog" "l_add_moduleControlSet.dsm" -na;
connectAttr "l_brow_out_local.iog" "l_add_moduleControlSet.dsm" -na;
connectAttr "l_brow_inner_1.iog" "l_add_moduleControlSet.dsm" -na;
connectAttr "l_main_moduleControlSet.msg" "l_moduleControlSet.dnsm" -na;
connectAttr "l_add_moduleControlSet.msg" "l_moduleControlSet.dnsm" -na;
connectAttr "c_brow.iog" "moduleControlSet.dsm" -na;
connectAttr "r_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "l_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "multMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "r_1_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "l_brow_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "mirror_controlInit_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "r_brow_3_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "out_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "l_brow_mid_scaleY.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "l_brow_out_outer_1_target_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "r_brow_mid_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "side_2_surfaceShader1SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "r_brow_outer_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "inner_1_poser_makeNurbSphere.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "r_brow_mid_outer_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "l_brow_3_xform_multMat1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "l_brow_in_inner_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "r_brow_mid_outer_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "center_materialInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "tweak24.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn";
connectAttr "groupId42.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn";
connectAttr "l_brow_mid_scaleX.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "multMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "c_brow.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn";
connectAttr "l_brow_out_local.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "makeNurbSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "l_brow_in_local_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "c_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn";
connectAttr "l_brow_inner_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn";
connectAttr "l_brow_out_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "side_mainPoser_clusterHandleShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "l_brow_in_inner_1_target_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "l_brow_outer_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn";
connectAttr "r_brow_mid.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn";
connectAttr "posers.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn";
connectAttr "l_5_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn";
connectAttr "l_brow_inner_1_pickMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "inner_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn";
connectAttr "r_brow_out_outer_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn"
		;
connectAttr "l_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn";
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn";
connectAttr "outer_1_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "center_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "middle_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "r_brow_outer_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "l_brow_mid_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn";
connectAttr "r_brow_outShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[44].dn"
		;
connectAttr "l_brow_mid_outer_1_target_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[45].dn"
		;
connectAttr "sets.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[46].dn";
connectAttr "side_1_surfaceShader2SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[47].dn"
		;
connectAttr "l_2_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[48].dn";
connectAttr "hyperView2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[49].dn";
connectAttr "mainPoserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[50].dn";
connectAttr "middle_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[51].dn"
		;
connectAttr "blue_rsSG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[52].dn";
connectAttr "l_brow_mid_local_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[53].dn"
		;
connectAttr "r_brow_outer_1_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[54].dn"
		;
connectAttr "sweepMeshCreator1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[55].dn"
		;
connectAttr "l_brow_in_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[56].dn";
connectAttr "center_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[57].dn";
connectAttr "l_brow_outer_1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[58].dn"
		;
connectAttr "l_brow_mid_inner_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[59].dn"
		;
connectAttr "r_brow_inner_1_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[60].dn"
		;
connectAttr "hyperView4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[61].dn";
connectAttr "center_materialInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[62].dn"
		;
connectAttr "side_1_materialInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[63].dn"
		;
connectAttr "outer_1_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[64].dn"
		;
connectAttr "inner_1_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[65].dn"
		;
connectAttr "side___groupId42.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[66].dn"
		;
connectAttr "l_brow_mid_scaleZ.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[67].dn"
		;
connectAttr "r_brow_out_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[68].dn";
connectAttr "black_rsMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[69].dn";
connectAttr "l_3_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[70].dn";
connectAttr "r_brow_outer_1_blendMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[71].dn"
		;
connectAttr "multMatrix16.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[72].dn";
connectAttr "red_rsMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[73].dn";
connectAttr "tweakSet24.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[74].dn";
connectAttr "r_brow_inner_1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[75].dn"
		;
connectAttr "in_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[76].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[77].dn";
connectAttr "c_brow_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[78].dn";
connectAttr "outer_1_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[79].dn"
		;
connectAttr "outer_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[80].dn";
connectAttr "l_brow_outer_1_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[81].dn"
		;
connectAttr "r_brow_mid_local_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[82].dn"
		;
connectAttr "side___groupParts42.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[83].dn"
		;
connectAttr "side___cluster4GroupId.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[84].dn"
		;
connectAttr "r_brow_c_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[85].dn"
		;
connectAttr "side_2_surfaceShader3SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[86].dn"
		;
connectAttr "r_brow_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[87].dn"
		;
connectAttr "green_rsSG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[88].dn";
connectAttr "l_brow_1_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[89].dn"
		;
connectAttr "r_brow_in_local.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[90].dn"
		;
connectAttr "mainPoserShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[91].dn"
		;
connectAttr "system.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[92].dn";
connectAttr "l_brow_in_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[93].dn"
		;
connectAttr "out_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[94].dn";
connectAttr "inner_1_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[95].dn"
		;
connectAttr "c_brow_skinJoint_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[96].dn"
		;
connectAttr "decomposeMatrix83.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[97].dn"
		;
connectAttr "side_1_surfaceShader1SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[98].dn"
		;
connectAttr "out_makeNurbSphere.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[99].dn"
		;
connectAttr "l_brow_inner_1_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[100].dn"
		;
connectAttr "r_brow_in_inner_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[101].dn"
		;
connectAttr "multMatrix24.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[102].dn";
connectAttr "r_brow_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[103].dn";
connectAttr "multMatrix21.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[104].dn";
connectAttr "hyperLayout4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[105].dn";
connectAttr "l_brow_out_local_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[106].dn"
		;
connectAttr "multMatrix18.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[107].dn";
connectAttr "l_brow_mid_inner_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[108].dn"
		;
connectAttr "l_brow_1_xform_multMat1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[109].dn"
		;
connectAttr "r_brow_2_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[110].dn"
		;
connectAttr "r_1_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[111].dn";
connectAttr "in_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[112].dn";
connectAttr "inner_1_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[113].dn"
		;
connectAttr "multiplyDivide2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[114].dn"
		;
connectAttr "r_brow_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[115].dn";
connectAttr "side_mainPoser_clusterHandle.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[116].dn"
		;
connectAttr "l_brow_inner_1_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[117].dn"
		;
connectAttr "side_2_materialInfo4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[118].dn"
		;
connectAttr "r_brow_out_local.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[119].dn"
		;
connectAttr "controls.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[120].dn";
connectAttr "r_2_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[121].dn";
connectAttr "skinJointsSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[122].dn";
connectAttr "l_brow_inner_1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[123].dn"
		;
connectAttr "in_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[124].dn"
		;
connectAttr "side_3_materialInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[125].dn"
		;
connectAttr "l_brow_out_outer_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[126].dn"
		;
connectAttr "l_0_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[127].dn";
connectAttr "r_brow_outer_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[128].dn"
		;
connectAttr "cluster4GroupParts.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[129].dn"
		;
connectAttr "multiplyDivide3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[130].dn"
		;
connectAttr "posers_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[131].dn";
connectAttr "r_brow_in_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[132].dn"
		;
connectAttr "blue_rsMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[133].dn";
connectAttr "r_brow_3_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[134].dn"
		;
connectAttr "r_brow_in_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[135].dn"
		;
connectAttr "r_brow_inner_1_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[136].dn"
		;
connectAttr "l_3_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[137].dn";
connectAttr "side_1_materialInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[138].dn"
		;
connectAttr "l_brow_mid_rotateY.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[139].dn"
		;
connectAttr "l_2_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[140].dn"
		;
connectAttr "side_3_surfaceShader1SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[141].dn"
		;
connectAttr "composeMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[142].dn"
		;
connectAttr "r_brow_out_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[143].dn"
		;
connectAttr "l_brow_inShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[144].dn"
		;
connectAttr "r_brow_in_localShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[145].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[146].dn";
connectAttr "l_brow_mid_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[147].dn"
		;
connectAttr "center_materialInfo3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[148].dn"
		;
connectAttr "l_brow_c_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[149].dn"
		;
connectAttr "l_brow_1_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[150].dn"
		;
connectAttr "inner_1_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[151].dn"
		;
connectAttr "l_brow_out_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[152].dn"
		;
connectAttr "posers_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[153].dn"
		;
connectAttr "r_brow_2_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[154].dn"
		;
connectAttr "middle_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[155].dn";
connectAttr "l_brow_mid_rotateZ.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[156].dn"
		;
connectAttr "l_brow_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[157].dn";
connectAttr "black_rsSG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[158].dn";
connectAttr "outer_1_poser_multDoubleLinear.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[159].dn"
		;
connectAttr "r_brow_mid_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[160].dn"
		;
connectAttr "middle_makeNurbSphere.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[161].dn"
		;
connectAttr "r_brow_in.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[162].dn";
connectAttr "l_5_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[163].dn";
connectAttr "l_brow_inner_1_blendMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[164].dn"
		;
connectAttr "side_3_surfaceShader3SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[165].dn"
		;
connectAttr "in_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[166].dn"
		;
connectAttr "groupParts42.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[167].dn";
connectAttr "root_materialInfo3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[168].dn"
		;
connectAttr "l_brow_outer_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[169].dn"
		;
connectAttr "side_3_surfaceShader1SG1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[170].dn"
		;
connectAttr "l_brow_out_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[171].dn"
		;
connectAttr "r_brow_c_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[172].dn"
		;
connectAttr "r_brow.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[173].dn";
connectAttr "r_4_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[174].dn";
connectAttr "side_3_materialInfo3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[175].dn"
		;
connectAttr "c_brow_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[176].dn"
		;
connectAttr "middle_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[177].dn"
		;
connectAttr "l_1_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[178].dn"
		;
connectAttr "r_browShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[179].dn";
connectAttr "side_2_materialInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[180].dn"
		;
connectAttr "r_4_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[181].dn"
		;
connectAttr "hyperView3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[182].dn";
connectAttr "r_brow_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[183].dn"
		;
connectAttr "root_materialInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[184].dn"
		;
connectAttr "r_brow_outer_1_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[185].dn"
		;
connectAttr "out_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[186].dn";
connectAttr "l_4_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[187].dn";
connectAttr "outer_1_poser_makeNurbSphere.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[188].dn"
		;
connectAttr "r_brow_inShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[189].dn"
		;
connectAttr "r_brow_in_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[190].dn";
connectAttr "makeNurbSphere4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[191].dn"
		;
connectAttr "l_brow_outer_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[192].dn"
		;
connectAttr "mainPoser_clusterHandle.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[193].dn"
		;
connectAttr "r_brow_inner_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[194].dn"
		;
connectAttr "r_brow_inner_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[195].dn"
		;
connectAttr "multMatrix23.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[196].dn";
connectAttr "outer_1_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[197].dn"
		;
connectAttr "r_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[198].dn";
connectAttr "r_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[199].dn";
connectAttr "l_brow_1_xform_multMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[200].dn"
		;
connectAttr "blendMatrix8.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[201].dn";
connectAttr "c_brow_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[202].dn"
		;
connectAttr "r_brow_1_controlInitLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[203].dn"
		;
connectAttr "bindPose1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[204].dn";
connectAttr "mainPoser_clusterHandleCluster.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[205].dn"
		;
connectAttr "multMatrix17.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[206].dn";
connectAttr "l_brow_in_inner_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[207].dn"
		;
connectAttr "inner_1_poser_multDoubleLinear.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[208].dn"
		;
connectAttr "r_0_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[209].dn";
connectAttr "multMatrix20.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[210].dn";
connectAttr "l_brow_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[211].dn"
		;
connectAttr "c_brow_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[212].dn"
		;
connectAttr "r_brow_out_localShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[213].dn"
		;
connectAttr "r_add_moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[214].dn"
		;
connectAttr "r_brow_in_local_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[215].dn"
		;
connectAttr "r_3_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[216].dn"
		;
connectAttr "r_brow_controlInitLoc_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[217].dn"
		;
connectAttr "r_moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[218].dn"
		;
connectAttr "l_moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[219].dn"
		;
connectAttr "l_brow_mid_localShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[220].dn"
		;
connectAttr "l_main_moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[221].dn"
		;
connectAttr "r_main_moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[222].dn"
		;
connectAttr "r_brow_controlInitLoc_multMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[223].dn"
		;
connectAttr "l_brow_mid_outer_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[224].dn"
		;
connectAttr "cluster4Set.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[225].dn";
connectAttr "red_rsSG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[226].dn";
connectAttr "l_add_moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[227].dn"
		;
connectAttr "side___tweakSet24.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[228].dn"
		;
connectAttr "moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[229].dn"
		;
connectAttr "output.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[230].dn";
connectAttr "l_brow_mid_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[231].dn"
		;
connectAttr "l_0_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[232].dn"
		;
connectAttr "r_brow_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[233].dn";
connectAttr "r_brow_inner_1_blendMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[234].dn"
		;
connectAttr "hyperLayout3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[235].dn";
connectAttr "multMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[236].dn";
connectAttr "r_brow_outer_1_pickMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[237].dn"
		;
connectAttr "r_brow_out_outer_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[238].dn"
		;
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[239].dn";
connectAttr "c_browShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[240].dn";
connectAttr "side___cluster4GroupParts.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[241].dn"
		;
connectAttr "middle_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[242].dn"
		;
connectAttr "main_controls.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[243].dn";
connectAttr "r_brow_mid_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[244].dn"
		;
connectAttr "makeNurbSphere5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[245].dn"
		;
connectAttr "side_1_materialInfo3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[246].dn"
		;
connectAttr "l_brow_mid_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[247].dn"
		;
connectAttr "center_surfaceShader1SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[248].dn"
		;
connectAttr "l_brow_outer_1_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[249].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[250].dn";
connectAttr "r_brow_mid_inner_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[251].dn"
		;
connectAttr "l_brow_in_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[252].dn";
connectAttr "multMatrix15.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[253].dn";
connectAttr "l_brow_in_local.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[254].dn"
		;
connectAttr "center_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[255].dn"
		;
connectAttr "multiplyDivide5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[256].dn"
		;
connectAttr "hyperLayout2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[257].dn";
connectAttr "side_mainPoserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[258].dn"
		;
connectAttr "middle_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[259].dn"
		;
connectAttr "r_brow_out_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[260].dn"
		;
connectAttr "l_brow_inner_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[261].dn"
		;
connectAttr "root_connectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[262].dn"
		;
connectAttr "multMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[263].dn";
connectAttr "l_brow_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[264].dn";
connectAttr "r_brow_out_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[265].dn"
		;
connectAttr "multMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[266].dn";
connectAttr "center_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[267].dn"
		;
connectAttr "side___tweak24.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[268].dn"
		;
connectAttr "middle_size_multDoubleLinear.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[269].dn"
		;
connectAttr "r_brow_out_local_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[270].dn"
		;
connectAttr "multMatrix13.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[271].dn";
connectAttr "l_brow_outShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[272].dn"
		;
connectAttr "side_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[273].dn"
		;
connectAttr "r_brow_inner_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[274].dn"
		;
connectAttr "l_4_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[275].dn"
		;
connectAttr "r_brow_mid_localShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[276].dn"
		;
connectAttr "root_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[277].dn"
		;
connectAttr "side___cluster4Set.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[278].dn"
		;
connectAttr "multMatrix11.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[279].dn";
connectAttr "center_surfaceShader2SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[280].dn"
		;
connectAttr "root_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[281].dn"
		;
connectAttr "r_3_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[282].dn";
connectAttr "decomposeMatrix81.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[283].dn"
		;
connectAttr "root_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[284].dn"
		;
connectAttr "side_3_surfaceShader2SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[285].dn"
		;
connectAttr "green_rsMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[286].dn";
connectAttr "r_brow_outer_1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[287].dn"
		;
connectAttr "r_brow_in_tag.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[288].dn";
connectAttr "side_3_materialInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[289].dn"
		;
connectAttr "multiplyDivide4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[290].dn"
		;
connectAttr "l_brow_outer_1_blendMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[291].dn"
		;
connectAttr "l_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[292].dn";
connectAttr "l_brow_mid.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[293].dn";
connectAttr "l_brow_inner_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[294].dn"
		;
connectAttr "r_brow_mid_local.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[295].dn"
		;
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[296].dn"
		;
connectAttr "multMatrix19.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[297].dn";
connectAttr "multMatrix25.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[298].dn";
connectAttr "outer_1_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[299].dn"
		;
connectAttr "l_brow_in_localShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[300].dn"
		;
connectAttr "r_brow_1_controlInitLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[301].dn"
		;
connectAttr "multMatrix26.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[302].dn";
connectAttr "r_brow_mid_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[303].dn"
		;
connectAttr "side_2_surfaceShader2SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[304].dn"
		;
connectAttr "center_surfaceShader3SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[305].dn"
		;
connectAttr "l_brow_in_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[306].dn"
		;
connectAttr "composeMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[307].dn"
		;
connectAttr "l_brow_midShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[308].dn"
		;
connectAttr "l_brow_in.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[309].dn";
connectAttr "root_materialInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[310].dn"
		;
connectAttr "r_brow_in_inner_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[311].dn"
		;
connectAttr "l_brow_mid_inner_1_target_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[312].dn"
		;
connectAttr "input.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[313].dn";
connectAttr "r_brow_midShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[314].dn"
		;
connectAttr "multMatrix12.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[315].dn";
connectAttr "hyperLayout1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[316].dn";
connectAttr "l_brow_mid_rotateX.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[317].dn"
		;
connectAttr "side_2_materialInfo3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[318].dn"
		;
connectAttr "side_3_materialInfo4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[319].dn"
		;
connectAttr "side_2_materialInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[320].dn"
		;
connectAttr "side_mainPoser_clusterHandleCluster.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[321].dn"
		;
connectAttr "out_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[322].dn";
connectAttr "decomposeMatrix82.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[323].dn"
		;
connectAttr "l_brow_outer_1_pickMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[324].dn"
		;
connectAttr "l_brow_out_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[325].dn"
		;
connectAttr "hyperView1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[326].dn";
connectAttr "multMatrix22.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[327].dn";
connectAttr "l_brow_mid_local.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[328].dn"
		;
connectAttr "out_size_multDoubleLinear.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[329].dn"
		;
connectAttr "l_brow_out_localShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[330].dn"
		;
connectAttr "l_brow_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[331].dn";
connectAttr "l_brow_mid_outer_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[332].dn"
		;
connectAttr "r_5_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[333].dn"
		;
connectAttr "l_1_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[334].dn";
connectAttr "inner_1_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[335].dn"
		;
connectAttr "c_brow_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[336].dn";
connectAttr "side_1_surfaceShader3SG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[337].dn"
		;
connectAttr "r_brow_inner_1_pickMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[338].dn"
		;
connectAttr "side_mainPoserShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[339].dn"
		;
connectAttr "l_brow_out_outer_1_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[340].dn"
		;
connectAttr "out_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[341].dn"
		;
connectAttr "r_0_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[342].dn"
		;
connectAttr "posers_sweepShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[343].dn"
		;
connectAttr "out_poserOrientShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[344].dn"
		;
connectAttr "l_brow_c_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[345].dn"
		;
connectAttr "r_5_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[346].dn";
connectAttr "l_brow.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[347].dn";
connectAttr "r_brow_mid_inner_1_targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[348].dn"
		;
connectAttr "mainPoser_clusterHandleShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[349].dn"
		;
connectAttr "r_2_motionPath.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[350].dn"
		;
connectAttr "l_browShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[351].dn";
connectAttr "cluster4GroupId.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[352].dn"
		;
connectAttr "posers_sweep.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[353].dn";
connectAttr "red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "center_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "center_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "center_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_1_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "side_1_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "side_1_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_2_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "side_2_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "side_2_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader1SG1.pa" ":renderPartition.st" -na;
connectAttr "red_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "green_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "blue_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "black_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "decomposeMatrix81.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix82.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=NodeProfileStruct:string=NodeProfileTag:int32=NodeProfileTagColor";
// End of brows.ma
