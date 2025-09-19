//Maya ASCII 2022 scene
//Name: limbCurved.ma
//Last modified: Fri, Sep 19, 2025 05:38:49 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "inverseMatrix" "matrixNodes" "1.0";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "ngst2SkinLayerData" -dataType "ngst2SkinLayerDataStorage" "ngSkinTools2" "2.4.0";
requires -nodeType "quatToEuler" "quatNodes" "1.0";
requires -nodeType "bifrostGraphShape" -dataType "bifData" "bifrostGraph" "2.6.0.0-202212071624-fbc8dae";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202106180615-26a94e7f8c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "4EE9E860-41B2-B0F7-E98F-2AA407C28195";
createNode transform -s -n "persp";
	rename -uid "9930C439-4773-B55F-3AF3-1197E8D2931A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5.2604408794260724 9.3200420975524878 15.916241175884617 ;
	setAttr ".r" -type "double3" -39.600000000006041 367.19999999990955 0 ;
	setAttr ".rp" -type "double3" 1.1102230246251563e-16 0 8.8817841970012523e-16 ;
	setAttr ".rpt" -type "double3" 5.7589012943859782e-16 4.8375017868310666e-16 -2.7025092621108523e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "6DB399A3-4909-92FB-3D8E-5FA34FAA827B";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 17.668433422516966;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "5A919E60-469D-8DC4-5223-749A2D700F1B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.5746616989842446 13.317458046342656 -0.83590028467170874 ;
	setAttr ".r" -type "double3" -90 360 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "79A2314F-439D-3FB4-9615-EC90EF6DC036";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 3.5713423035773197;
	setAttr ".ow" 10.59102441010236;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" 2.074214343507256 0 -0.0059681181071694067 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "38B490A3-4E14-6D12-4F4A-45AEA931B352";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.9983006293470167 0.19659006517312605 16.796852123715713 ;
	setAttr ".r" -type "double3" 0 360 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "D95A67EB-4A4E-F624-ED46-1CBA80E7F17F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 16.218406193718049;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "2EA6E378-47C8-E64D-0048-B896145BCD21";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -9.1185887946976134 0.44573745767288209 -1.624962806077014 ;
	setAttr ".r" -type "double3" 0 270 0 ;
	setAttr ".rpt" -type "double3" 4.9303806576313238e-32 0 4.4408920985006262e-16 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "0FF3FB66-421A-5773-ED1B-31894C5F72EB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 10.064486689547836;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "mod";
	rename -uid "4AF1664A-49C8-8564-C79F-DC85677BD739";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mainPoserSize" -ln "mainPoserSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "poserSize" -ln "poserSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "poserSizeGlobal" -ln "poserSizeGlobal" -dv 1 -min 0 -max 1 
		-at "double";
	addAttr -ci true -sn "vertical" -ln "vertical" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "aim_offset" -ln "aim_offset" -at "double";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	setAttr ".mainPoserSize" 3.35;
	setAttr ".poserSize" 3.17;
	setAttr ".aim_offset" 3;
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "26717BB3-4498-BC22-987A-D3B5D5058154";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "F01BD56F-478E-58C1-CD72-68A3A8022EF5";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 2.5;
	setAttr -l on ".moduleName" -type "string" "foot";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineSize" 0.1;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "681537E5-4CF8-3397-3543-948E514E591D";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr -av ".iog[0].og[1].gid";
	setAttr -av ".iog[0].og[1].gco";
	setAttr -av ".iog[0].og[2].gid";
	setAttr -av ".iog[0].og[2].gco";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "2B0B7127-4F8E-CCEF-74DD-E98FA64A0560";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k off ".ry";
	setAttr -k off ".rx";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -l on ".twist";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "8F89A4D3-4D5A-F086-DBE4-10A09C11F3A9";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 1;
	setAttr ".dvv" 1;
	setAttr ".cpr" 7;
	setAttr ".cps" 2;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "F60928EF-4358-ABEB-D1C2-8087C688A0EF";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "root_poserOrient_locShape" -p "root_poserOrient";
	rename -uid "1E32A52F-438A-9182-4DF1-DD98EBD4DD45";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "rootMiddle_orient_locator_aimConstraint1" -p "root_poserOrient";
	rename -uid "77CA3FF0-4C34-E56D-098A-B8895848E405";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -5.1174087111780855 20.136207759421097 -14.581712838936754 ;
	setAttr -k on ".w0";
createNode transform -n "root_initLoc" -p "root_poserOrient";
	rename -uid "BC6038B9-4949-5CC8-7C8A-0AB5A3D6641F";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "5F93EE39-454C-BB16-B83D-DAA2941FB1F3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_initLoc_aimConstraint1" -p "root_initLoc";
	rename -uid "CEF003B9-4C49-72ED-37D3-FC877B4590DD";
	addAttr -ci true -sn "w0" -ln "middle_poserW0" -dv 1 -at "double";
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
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" -31.959622997812339 -4.3805693439989524e-16 -1.5297201688450584e-15 ;
	setAttr -k on ".w0";
createNode transform -n "ik_aim_initLoc" -p "root_poserOrient";
	rename -uid "DC442042-41BC-20BF-8233-D09801A3B822";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode locator -n "ik_aim_initLocShape" -p "ik_aim_initLoc";
	rename -uid "468D0092-4AEE-EDFB-FECE-88BE1A0C762C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_end_initLoc" -p "root_poserOrient";
	rename -uid "8BB9A641-4A05-C08C-3529-699B0A43713B";
createNode locator -n "ik_end_initLocShape" -p "ik_end_initLoc";
	rename -uid "25C6D98F-45BC-7C2E-6144-0EAC05886611";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_a_initLoc" -p "root_poserOrient";
	rename -uid "2776895A-4223-CA10-47DD-139EB5ED1B31";
	setAttr ".v" no;
createNode locator -n "fk_a_initLocShape" -p "fk_a_initLoc";
	rename -uid "7E84AF49-43CB-D3C0-9549-25A300D3E57E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_root_initLoc" -p "root_poserOrient";
	rename -uid "6DD496FE-412F-48A1-1DF1-CDAC33A8D8FC";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "ik_root_initLocShape" -p "ik_root_initLoc";
	rename -uid "01623441-42F1-FC19-C55C-4D8CA963A25B";
	setAttr -k off ".v";
createNode transform -n "aim_init_loc" -p "root_poser";
	rename -uid "0E37D943-45EC-C1B2-B4B5-BFA2EFC16528";
createNode locator -n "aim_init_locShape" -p "aim_init_loc";
	rename -uid "F285C65C-484E-EB46-D7C2-E8901993A040";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "aim_init_loc_aimConstraint1" -p "aim_init_loc";
	rename -uid "D491664F-4ABD-3861-88ED-009259939C76";
	addAttr -dcb 0 -ci true -sn "w0" -ln "end_poserW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode aimConstraint -n "root_poser_aimConstraint1" -p "root_poser";
	rename -uid "E6A383DB-401C-F31B-293F-E79C014861F6";
	addAttr -dcb 0 -ci true -sn "w0" -ln "middle_poserW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -0.3740654963631998 16.38303124121159 -1.3259858250128498 ;
	setAttr -k on ".w0";
createNode transform -n "middle_poser" -p "mainPoser";
	rename -uid "B2E6F427-4AF9-E60D-904E-3593767F5C9E";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 5 0 -1 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -l on ".twist";
createNode nurbsSurface -n "middle_poserShape" -p "middle_poser";
	rename -uid "27398E5E-4F32-46D5-84DD-318132988D36";
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
createNode transform -n "middle_poserOrient" -p "middle_poser";
	rename -uid "ED5F36EC-4C5F-C6AF-7D0A-D3B66F679355";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "middle_poserOrient_locShape" -p "middle_poserOrient";
	rename -uid "02B94ABF-4AD8-71B9-4474-358CBC99E7D1";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "middleEnd_orient_locator_aimConstraint1" -p "middle_poserOrient";
	rename -uid "D6383818-4777-A924-3103-95A7FF413B06";
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
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" 50.175792197513267 -29.928138633724306 5.5049004115719638e-15 ;
	setAttr -k on ".w0";
createNode nurbsSurface -n "middle_poserOrientNurbsShapeOrig" -p "middle_poserOrient";
	rename -uid "4358C0B0-41A5-E45C-5A9E-9D9E9247C19E";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		8.6508075520875674e-17 -0.037455761606731815 -9.4823692871288475e-18
		0.0074880356587501418 -0.037455761606731815 -0.007488035658750055
		0.010589681584137776 -0.037455761606731815 -2.3301336371712721e-18
		0.0074880356587501331 -0.037455761606731815 0.007488035658750055
		8.7227053388126875e-17 -0.037455761606731815 0.010589681584137646
		-0.007488035658749944 -0.037455761606731815 0.007488035658750055
		-0.010589681584137544 -0.037455761606731815 2.1421595593291823e-18
		-0.0074880356587499692 -0.037455761606731815 -0.0074880356587500472
		7.5981118448231861e-17 -0.037455761606731815 -0.010589681584137664
		0.0074880356587501418 -0.037455761606731815 -0.007488035658750055
		0.010589681584137776 -0.037455761606731815 -2.3301336371712721e-18
		0.0074880356587501331 -0.037455761606731815 0.007488035658750055
		0.023088854366533323 -0.029350770214189491 -0.023088854366533244
		0.032652570984808657 -0.029350770214189491 3.9351735340616244e-18
		0.023088854366533341 -0.029350770214189491 0.023088854366533244
		9.0368419057373221e-17 -0.029350770214189491 0.032652570984808546
		-0.023088854366533119 -0.029350770214189491 0.02308885436653323
		-0.032652570984808435 -0.029350770214189491 6.0345185968551401e-18
		-0.023088854366533119 -0.029350770214189491 -0.023088854366533195
		6.7383005221449205e-17 -0.029350770214189491 -0.032652570984808546
		0.023088854366533323 -0.029350770214189491 -0.023088854366533244
		0.032652570984808657 -0.029350770214189491 3.9351735340616244e-18
		0.023088854366533341 -0.029350770214189491 0.023088854366533244
		0.032481728138017481 2.4478804591740236e-18 -0.032481728138017509
		0.045936100462100393 4.5894823942413903e-19 1.0866309642580658e-17
		0.032481728138017515 -1.529983980325748e-18 0.032481728138017439
		9.0599225685143162e-17 -2.3538266803869673e-18 0.045936100462100282
		-0.032481728138017293 -1.529983980325748e-18 0.032481728138017439
		-0.045936100462100171 4.5894823942413903e-19 8.2158937239815268e-18
		-0.032481728138017328 2.4478804591740197e-18 -0.03248172813801737
		6.3866823513637793e-17 3.2717231592352638e-18 -0.045936100462100282
		0.032481728138017481 2.4478804591740236e-18 -0.032481728138017509
		0.045936100462100393 4.5894823942413903e-19 1.0866309642580658e-17
		0.032481728138017515 -1.529983980325748e-18 0.032481728138017439
		0.023088854366533341 0.029350770214189525 -0.023088854366533244
		0.032652570984808692 0.029350770214189525 1.1512935616605808e-17
		0.023088854366533341 0.029350770214189525 0.02308885436653323
		8.638508965436065e-17 0.029350770214189525 0.032652570984808581
		-0.023088854366533119 0.029350770214189525 0.02308885436653323
		-0.032652570984808435 0.029350770214189525 5.6456218733743019e-18
		-0.023088854366533133 0.029350770214189525 -0.023088854366533244
		7.1366334624461763e-17 0.029350770214189525 -0.032652570984808581
		0.023088854366533341 0.029350770214189525 -0.023088854366533244
		0.032652570984808692 0.029350770214189525 1.1512935616605808e-17
		0.023088854366533341 0.029350770214189525 0.02308885436653323
		0.0074880356587501418 0.037455761606731787 -0.0074880356587500802
		0.010589681584137766 0.037455761606731787 7.3401696633904938e-18
		0.0074880356587501331 0.037455761606731787 0.0074880356587500802
		8.2143757943696089e-17 0.037455761606731787 0.010589681584137657
		-0.0074880356587499692 0.037455761606731787 0.0074880356587500802
		-0.010589681584137544 0.037455761606731787 1.6458719710294841e-18
		-0.0074880356587499692 0.037455761606731787 -0.0074880356587500802
		8.1064413892662585e-17 0.037455761606731787 -0.010589681584137657
		0.0074880356587501418 0.037455761606731787 -0.0074880356587500802
		0.010589681584137766 0.037455761606731787 7.3401696633904938e-18
		0.0074880356587501331 0.037455761606731787 0.0074880356587500802
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		8.9430823017799084e-17 0.037455761606731815 -6.2924356885789583e-19
		
		;
createNode nurbsCurve -n "middle_poserOrientShapeOrig" -p "middle_poserOrient";
	rename -uid "35A6EDC7-4CC8-5A74-6003-BA9C41F4C1D2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		3 46 0 no 3
		51 2 2 2 3 4 4 4 5 6 6 6 7 8 8 8 9 10 10 10 11 12 12 12 13 14 14 14 15 16 16
		 16 17 18 18 18 19 20 20 20 21 22 22 22 23 24 24 24 25 26 26 26
		49
		-0.037295381707392931 1.2248255604521542e-17 8.3664103757630936e-17
		-0.03729538170739298 -0.0097416982202228747 8.0839647382932043e-17
		-0.029225094660668593 -0.0292250946606686 8.0252264176626439e-17
		-0.0097416982202228747 -0.037295381707392952 8.0997287206261607e-17
		1.2248255604521542e-17 -0.037295381707392931 8.3664103757630936e-17
		0.0097416982202228608 -0.03729538170739298 8.2190301160627131e-17
		0.029225094660668593 -0.029225094660668641 8.3831306039723046e-17
		0.037295381707392952 -0.0097416982202228591 8.540701436602577e-17
		0.037295381707392931 1.2248255604521542e-17 8.3664103757630936e-17
		0.037295381707392952 0.0097416982202228955 8.6488560132329865e-17
		0.029225094660668593 0.029225094660668641 8.7075943338635433e-17
		0.0097416982202228608 0.03729538170739298 8.6330920309000289e-17
		1.0177946030334963e-17 0.037295381707392834 8.5734413331817534e-17
		-0.0097416982202228747 0.037295381707392952 8.5137906354634741e-17
		-0.0292250946606686 0.029225094660668593 8.3496901475538825e-17
		-0.03729538170739298 0.0097416982202228608 8.192119314923609e-17
		-0.03729538170739298 6.0373268819618192e-18 7.952348460925779e-17
		-0.037295381707392931 1.2844762581704312e-17 -0.0097416982202228001
		-0.029225094660668593 1.4037776536069849e-17 -0.029225094660668569
		-0.0097416982202228747 1.4531939096068415e-17 -0.037295381707392911
		1.2248255604521542e-17 1.2248255604521542e-17 -0.037295381707392911
		0.0097416982202228747 1.4531939096068415e-17 -0.037295381707392911
		0.029225094660668641 1.4037776536069846e-17 -0.029225094660668541
		0.03729538170739298 1.2844762581704307e-17 -0.0097416982202227654
		0.037295381707392952 1.2248255604521542e-17 1.0229688992531007e-16
		0.037295381707392911 1.1651748627338767e-17 0.0097416982202229493
		0.029225094660668565 1.0458734672973231e-17 0.029225094660668631
		0.0097416982202228573 9.9645721129746668e-18 0.03729538170739298
		1.2248255604521542e-17 1.2248255604521542e-17 0.037295381707392931
		7.8014805803663933e-18 0.0097416982202228764 0.037295381707392931
		3.9694600751484296e-18 0.0292250946606686 0.02922509466066861
		3.3705103305924644e-18 0.037295381707392952 0.0097416982202229423
		3.9670173077752446e-18 0.037295381707392931 7.227740109960479e-17
		4.5635242849580202e-18 0.037295381707392931 -0.0097416982202228001
		7.5485019382450534e-18 0.029225094660668593 -0.029225094660668569
		1.2368847563460147e-17 0.0097416982202228747 -0.037295381707392911
		1.4531939096068415e-17 1.3283410391614826e-17 -0.037295381707392911
		1.6695030628676671e-17 -0.0097416982202228747 -0.037295381707392911
		2.0527051133894659e-17 -0.029225094660668641 -0.029225094660668541
		2.1126000878450615e-17 -0.03729538170739298 -0.0097416982202227654
		2.0529493901267841e-17 -0.037295381707392952 1.0229688992531007e-16
		1.993298692408506e-17 -0.037295381707392911 0.0097416982202229493
		1.694800927079803e-17 -0.029225094660668565 0.029225094660668631
		1.2127663645582925e-17 -0.0097416982202228573 0.03729538170739298
		9.9645721129746668e-18 2.570526783673428e-17 0.037295381707392931
		-0.0097416982202228764 9.9645721129746668e-18 0.037295381707392931
		-0.0292250946606686 1.0458734672973231e-17 0.02922509466066861
		-0.037295381707392952 1.1651748627338767e-17 0.0097416982202229423
		-0.037295381707392931 1.2248255604521542e-17 7.227740109960479e-17
		;
createNode transform -n "middle_initLoc" -p "middle_poserOrient";
	rename -uid "CC989E7B-4FFE-1CFB-29A8-DCBC3B767D1A";
createNode locator -n "middle_initLocShape" -p "middle_initLoc";
	rename -uid "615147F1-4D8A-51E3-48A4-DCAA640D5FC1";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middle_up_loc" -p "middle_poserOrient";
	rename -uid "D5BC8D77-4FD3-AF40-34E4-38AAA75070A4";
	setAttr ".t" -type "double3" 2.2204460492503114e-16 0.67310697141714793 -1.1102230246251557e-16 ;
createNode locator -n "middle_up_locShape" -p "middle_up_loc";
	rename -uid "5D8F1D05-4CC5-7E81-8DBB-6C9CDAA29CB9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_b_initLoc" -p "middle_poserOrient";
	rename -uid "1D277C70-4383-E3B6-CD14-598B229A90BB";
createNode locator -n "fk_b_initLocShape" -p "fk_b_initLoc";
	rename -uid "ACB0F834-46A4-A1AB-3C2F-6EB736C73A46";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_twist_angleLoc_1" -p "middle_poser";
	rename -uid "294560DB-4D2C-096F-C58F-C7BB13912AB1";
createNode locator -n "root_twist_angleLoc_1Shape" -p "root_twist_angleLoc_1";
	rename -uid "5770298A-4D3D-CD60-51C5-E393CECC2338";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleRoot_orient_locator1_aimConstraint1" -p "root_twist_angleLoc_1";
	rename -uid "3F1F089E-4443-4740-F775-CA817D8B1D0D";
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
	setAttr ".a" -type "double3" -1 0 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" 22.66485409266739 242.00254581962912 35.963335283329165 ;
	setAttr -k on ".w0";
createNode transform -n "root_twist_angleLoc_2" -p "root_twist_angleLoc_1";
	rename -uid "259379EA-42CD-9EC0-A330-53B933063BA4";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 -2.7755575615628914e-17 0 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode locator -n "root_twist_angleLoc_2Shape" -p "root_twist_angleLoc_2";
	rename -uid "44395F2B-4C76-AF33-E828-28B8426FCBB7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "startAngleLoc2_aimConstraint1" -p "root_twist_angleLoc_2";
	rename -uid "503C81DC-4332-2E2B-A47F-019FC7773C00";
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
	setAttr ".a" -type "double3" -1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 34.689439633455514 2.261889064608831e-15 -1.8293689012210464e-15 ;
	setAttr -k on ".w0";
createNode transform -n "end_poser" -p "mainPoser";
	rename -uid "0780CDDB-4616-08AE-3543-D3A3CF6DA5F0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 10 0.00072573233235617707 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -k on ".worldOrient";
createNode nurbsSurface -n "end_poserNurbsShape" -p "end_poser";
	rename -uid "553011FF-47B5-412F-EB51-258301F191F0";
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
createNode transform -n "end_initLoc" -p "end_poser";
	rename -uid "7CCCBB7E-4318-6387-9E71-0C9185CA0D22";
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "359BF419-40EC-C29C-8BD0-D9839758CADA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_initLoc" -p "end_initLoc";
	rename -uid "95048CB4-4700-CB9A-C366-3E8FB357F9C9";
createNode locator -n "fk_end_initLocShape" -p "fk_end_initLoc";
	rename -uid "37DD282B-4C06-6F14-FE07-C69AD63CD6D9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "2B58A2D0-4417-B727-68BA-169D3A99C615";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "C1F56FDE-4A17-8761-1029-53BB58E56238";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "10A02E6B-476B-0218-BBF7-7B99DDFBE994";
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
	rename -uid "9EA2D3FA-48AA-8842-D25C-7E851B49A4B2";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "148ACF07-41B7-6061-41BD-0BBF137026BB";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "end_pose_loc" -p "mainPoser";
	rename -uid "3C1DBFB0-458C-4F8E-6520-B2801446DA4E";
	setAttr ".v" no;
createNode locator -n "end_pose_locShape" -p "end_pose_loc";
	rename -uid "ED6E0939-4122-575F-90B1-90B43B033178";
	setAttr -k off ".v";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "9E3ED6DF-477A-A0EB-525A-6D93F670CACA";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "07D3A45B-484C-A82D-0832-D6B66802A478";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 0
		5 0 -1
		10 0.00072573233235617707 0
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "5D197322-4188-3DF3-4908-D68313233BA7";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "9076CF0C-4D64-F000-D379-53B94B967D91";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "EBCF6114-47A4-9F1E-E368-D2951BA9A061";
	setAttr ".v" no;
createNode transform -n "ik_connector_main" -p "input";
	rename -uid "7F86D3C9-427C-8D2B-1384-7DABAABCCC62";
createNode transform -n "ik_connector" -p "ik_connector_main";
	rename -uid "3640A505-461C-F244-A6F4-8E8281FB45AE";
createNode locator -n "ik_connectorShape" -p "ik_connector";
	rename -uid "6FBF2C29-4E37-598F-E581-869235926F88";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "root_connector_init" -p "input";
	rename -uid "EA2ACE2C-42C0-D509-5246-D48CFBED045E";
createNode transform -n "root_connector" -p "root_connector_init";
	rename -uid "411952BF-402A-8629-1B03-B78ECF639A35";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "B24C135D-4262-357B-48FE-79A0C6700916";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "aim_world_connector" -p "root_connector";
	rename -uid "3AF9E245-4A0C-DD3A-1748-159CE430BBF5";
createNode locator -n "aim_world_connectorShape" -p "aim_world_connector";
	rename -uid "4EDB8143-4083-3A26-5530-D59257437BC4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "controls" -p "mod";
	rename -uid "F0F9D5E3-4E82-059E-71CB-9CBC17575CC8";
createNode transform -n "control_group" -p "controls";
	rename -uid "FF678EB3-4D45-8B6C-0C14-4F8BB2734EF3";
createNode transform -n "control" -p "control_group";
	rename -uid "0EA8E33B-45F6-6FFC-2552-4AA8FC92C9FF";
	addAttr -ci true -sn "ikFk" -ln "ikFk" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "autoStretch" -ln "autoStretch" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "softIk" -ln "softIk" -min 0 -max 20 -at "double";
	addAttr -ci true -sn "stretchVolume" -ln "stretchVolume" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "length1" -ln "length1" -dv 1.0000303983688354 -min 0.1 -max 
		10 -at "double";
	addAttr -ci true -sn "length2" -ln "length2" -dv 1.0000303983688354 -min 0.1 -max 
		10 -at "double";
	addAttr -ci true -sn "constanta" -ln "constanta" -dv 1 -min 1 -max 1 -at "double";
	addAttr -ci true -sn "snap" -ln "snap" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "constanta0" -ln "constanta0" -at "double";
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
	setAttr -k on ".ikFk";
	setAttr -k on ".autoStretch";
	setAttr -k on ".softIk" 4;
	setAttr -k on ".stretchVolume" 0;
	setAttr -k on ".length1";
	setAttr -k on ".length2";
	setAttr -l on ".constanta";
	setAttr -k on ".snap";
	setAttr -l on ".internalName" -type "string" "control";
	setAttr -l on ".constanta0";
createNode nurbsCurve -n "controlShape" -p "control";
	rename -uid "5230F822-4384-BC9A-64F9-E983337EAF66";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		0.46945434266716113 0.27684798102421976 0
		0.46945434266716113 0.43289465486419471 0
		0.57348545856047806 0.38087909691753702 0
		0.46945434266716113 0.32886353897087856 0
		;
createNode transform -n "fk_controls" -p "controls";
	rename -uid "C14D2C88-4A78-237F-4795-2FB8B1FBF5BA";
createNode transform -n "fk_a_group" -p "fk_controls";
	rename -uid "295F680B-41F3-3071-7ADC-29BADDBC5F3B";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 0 -5.5511151231257827e-17 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999967 ;
createNode transform -n "fk_a" -p "fk_a_group";
	rename -uid "DBF78206-460C-7730-3BA9-A9950D85B208";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 1;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_a";
createNode nurbsCurve -n "fk_aShape" -p "fk_a";
	rename -uid "1BB65247-4899-A4BD-65B3-929991C90A3D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-3.1034317370559914e-17 0.2190447443687745 -0.21904474436877405
		-7.4484186917969207e-17 2.0174131519489299e-17 -0.30977604825286809
		-3.1034317370559914e-17 -0.21904474436877427 -0.21904474436877427
		-6.2068634741119827e-17 -0.30977604825286809 -8.9765348798859531e-17
		-3.1034317370559914e-17 -0.21904474436877427 0.21904474436877419
		-3.6547562323430174e-17 -3.7825694343907875e-17 0.30977604825286809
		-3.1034317370559914e-17 0.21904474436877419 0.21904474436877427
		6.2068634741119827e-17 0.30977604825286809 1.6638131980742933e-16
		-3.1034317370559914e-17 0.2190447443687745 -0.21904474436877405
		-7.4484186917969207e-17 2.0174131519489299e-17 -0.30977604825286809
		-3.1034317370559914e-17 -0.21904474436877427 -0.21904474436877427
		;
createNode joint -n "a_fkJoint" -p "fk_a";
	rename -uid "89D26522-484B-814A-3DDE-F2924806A166";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_b_group" -p "fk_a";
	rename -uid "415F9C0E-4DD1-51C8-8F3D-3CAF7CC6D7ED";
	setAttr ".t" -type "double3" 5.0991745154686585 0 1.6653345369377348e-16 ;
createNode transform -n "fk_b" -p "fk_b_group";
	rename -uid "DF51983D-4286-A780-45F1-1A8BCA4A6D54";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr ".ro" 1;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_b";
createNode nurbsCurve -n "fk_bShape" -p "fk_b";
	rename -uid "EE8911CE-43B5-F3A7-411F-FEBFBEE4AD0F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-2.547451261345112e-16 0.21904474436877464 -0.21904474436877405
		-2.0970515885500088e-16 2.9241467139708479e-17 -0.30977604825286809
		-1.9267649139339124e-16 -0.21904474436877405 -0.21904474436877427
		-3.1681376087563124e-16 -0.30977604825286809 -8.9765348798859531e-17
		-1.6164217402283144e-16 -0.21904474436877419 0.21904474436877419
		-1.7176853426046168e-16 -2.8758358723688627e-17 0.30977604825286809
		-2.857794435050709e-16 0.21904474436877419 0.21904474436877427
		-1.9267649139339124e-16 0.30977604825286809 1.6638131980742933e-16
		-2.547451261345112e-16 0.21904474436877464 -0.21904474436877405
		-2.0970515885500088e-16 2.9241467139708479e-17 -0.30977604825286809
		-1.9267649139339124e-16 -0.21904474436877405 -0.21904474436877427
		;
createNode joint -n "b_fkJoint" -p "fk_b";
	rename -uid "9566DA35-4F18-7124-11F3-DFB8DB39EBAB";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".is" -type "double3" 1.0000303983688354 1 1 ;
createNode transform -n "fk_end_group" -p "fk_b";
	rename -uid "D2148952-4805-D639-1E26-DEA470BCA782";
	setAttr ".s" -type "double3" 0.99999191367389451 1.0000000000000009 1.0000179037244814 ;
	setAttr ".sh" -type "double3" 0 1.5136983945333165e-05 0 ;
createNode transform -n "fk_end" -p "fk_end_group";
	rename -uid "0156B8D4-42B1-B174-F005-1B80C4904516";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_end";
createNode nurbsCurve -n "fk_endShape" -p "fk_end";
	rename -uid "28011C23-4606-5D7B-6D03-428BBC05AAFD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.1307738587875893e-06 0.21904628879437713 -0.2190438861543561
		1.6234850609484628e-07 0.30977823240050245 -7.6562895914411465e-06
		-1.9011783995915047e-06 0.21904628879437743 0.21903305852577848
		-2.8510207832508149e-06 8.9782728953588917e-17 0.30976717826480565
		-2.1307738587565582e-06 -0.21904628879437735 0.21904388615435599
		-1.6234850603277674e-07 -0.30977823240050245 7.6562895915698159e-06
		1.9011783995682297e-06 -0.21904628879437743 -0.21903305852577823
		2.8510207832508149e-06 -1.6639924010955204e-16 -0.30976717826480565
		2.1307738587875893e-06 0.21904628879437713 -0.2190438861543561
		1.6234850609484628e-07 0.30977823240050245 -7.6562895914411465e-06
		-1.9011783995915047e-06 0.21904628879437743 0.21903305852577848
		;
createNode joint -n "end_fkJoint" -p "fk_end";
	rename -uid "CA65CB71-4133-7316-462D-169586A36AA9";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0 0 -4.4406888105932846e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "ik_controls" -p "controls";
	rename -uid "43A603AE-4744-AA14-C4E9-EB9B7D303FBC";
createNode transform -n "ik_end_init" -p "ik_controls";
	rename -uid "A40F51E9-4133-4E7E-F347-6D9BC4208863";
createNode transform -n "ik_end_mirror" -p "ik_end_init";
	rename -uid "D18BFF12-47F8-DFAB-74C8-56B3B47290CF";
createNode transform -n "ik_end" -p "ik_end_mirror";
	rename -uid "5B72B786-4095-7D56-CA35-8F8494CBDE28";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "dynamicParentRevMultMatrixX" -ln "dynamicParentRevMultMatrixX" 
		-min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_end";
	setAttr -l on ".mirrorShape" yes;
	setAttr ".dynamicParentRevMultMatrixX" yes;
createNode nurbsCurve -n "ik_endShape" -p "ik_end";
	rename -uid "7FF30FB5-4072-82AF-3314-53ABF567D27F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.60493294568129663 0.60518310869463787 0.60518148587900256
		-0.60493294568129663 0.60518227700888083 -0.60518148587900256
		0.60493294568129119 0.60518227700888083 -0.60518148587900256
		0.60493294568129119 0.60518227700888083 0.60518148587900256
		-0.60493294568129663 0.60518227700888083 0.60518148587900256
		0.60493294568129119 0.60518227700888083 0.60518148587900256
		0.60493294568129119 -0.60518069474912506 0.60518148587900256
		-0.60493294568129663 -0.60518069474912506 0.60518148587900256
		-0.60493294568129663 0.60518227700888083 0.60518148587900256
		-0.60493294568129663 -0.60518069474912506 0.60518148587900256
		-0.60493294568129663 -0.60518069474912506 -0.60518148587900256
		-0.60493294568129663 0.60518227700888083 -0.60518148587900256
		-0.60493294568129663 -0.60518069474912506 -0.60518148587900256
		0.60493294568129119 -0.60518069474912506 -0.60518148587900256
		0.60493294568129119 0.60518227700888083 -0.60518148587900256
		0.60493294568129119 -0.60518069474912506 -0.60518148587900256
		0.60493294568129119 -0.60518069474912506 0.60518148587900256
		;
createNode transform -n "ik_end_out_rot" -p "ik_end";
	rename -uid "E28AFD68-47D7-AFDD-D178-4D8C9714AA16";
	setAttr ".v" no;
createNode transform -n "ik_end_out_init" -p "ik_end";
	rename -uid "53A00261-40AF-8849-8EAD-FC828B4F6F04";
	setAttr ".r" -type "double3" 0 -3.1528956873981994e-07 0 ;
createNode transform -n "ik_end_out" -p "ik_end_out_init";
	rename -uid "4AE2A366-43B2-E33A-3418-D5905D10C49B";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 0 -3.4346083563738136e-26 ;
createNode locator -n "ik_end_outShape" -p "ik_end_out";
	rename -uid "D5530C30-4960-B2FE-4C96-57A50856BACB";
	setAttr -k off ".v";
createNode transform -n "ik_root_group" -p "ik_controls";
	rename -uid "E4E46237-4654-8A17-BE71-16917830EFE4";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode transform -n "ik_root" -p "ik_root_group";
	rename -uid "609DC467-4BEC-AED2-CDEE-9993A6F0AAA9";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_root";
	setAttr -l on ".mirrorShape" yes;
createNode nurbsCurve -n "ik_rootShape" -p "ik_root";
	rename -uid "FF581E16-413B-DDB0-2A31-F7A529B5C400";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.62516986582492151 0.6251698658249204 0.6251698658249204
		-0.62516986582492151 0.6251698658249204 -0.6251698658249204
		0.62516986582492007 0.6251698658249204 -0.6251698658249204
		0.62516986582492007 0.6251698658249204 0.6251698658249204
		-0.62516986582492151 0.6251698658249204 0.6251698658249204
		0.62516986582492007 0.6251698658249204 0.6251698658249204
		0.62516986582492007 -0.6251698658249204 0.6251698658249204
		-0.62516986582492151 -0.6251698658249204 0.6251698658249204
		-0.62516986582492151 0.6251698658249204 0.6251698658249204
		-0.62516986582492151 -0.6251698658249204 0.6251698658249204
		-0.62516986582492151 -0.6251698658249204 -0.6251698658249204
		-0.62516986582492151 0.6251698658249204 -0.6251698658249204
		-0.62516986582492151 -0.6251698658249204 -0.6251698658249204
		0.62516986582492007 -0.6251698658249204 -0.6251698658249204
		0.62516986582492007 0.6251698658249204 -0.6251698658249204
		0.62516986582492007 -0.6251698658249204 -0.6251698658249204
		0.62516986582492007 -0.6251698658249204 0.6251698658249204
		;
createNode transform -n "snap_root_loc" -p "ik_root";
	rename -uid "F225C2C0-42F9-B90E-F03F-D0AB9BE9694C";
	setAttr ".v" no;
	setAttr ".sh" -type "double3" 0.0019699791094384997 -0.0050284108131751857 0.00029646444186807758 ;
createNode locator -n "snap_root_locShape" -p "snap_root_loc";
	rename -uid "658D2823-4270-130A-19D7-66A5CF97D5B6";
	setAttr -k off ".v";
createNode transform -n "null5" -p "ik_root";
	rename -uid "3B504F32-4682-74A7-C586-E9BAEC0295A1";
createNode transform -n "aim_curve" -p "ik_controls";
	rename -uid "5B3EF9EA-416D-DF7D-6E08-32A7F953A2D6";
	setAttr ".tmp" yes;
	setAttr ".it" no;
createNode nurbsCurve -n "aim_curveShape" -p "aim_curve";
	rename -uid "F66976C2-4000-47DE-AFD1-AF8023476BF9";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		5.0000000223938859 -2.8661582123768728e-07 -1.0007898643230049
		5 -0.0010885985102504492 -4.0000000000000009
		;
createNode transform -n "ik_aim_init" -p "ik_controls";
	rename -uid "3E268F3E-4545-A646-E2B6-4CA9DCC6B895";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
createNode transform -n "ik_aim_mirror" -p "ik_aim_init";
	rename -uid "19CDF15B-471B-0AD2-AB06-52BFDA69BD8B";
createNode transform -n "ik_aim" -p "ik_aim_mirror";
	rename -uid "93DD1320-4843-4C9F-1CDA-53B579ED7733";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_aim";
	setAttr -l on ".mirrorShape" yes;
createNode nurbsCurve -n "ik_aimShape0" -p "ik_aim";
	rename -uid "72EE9A8D-4365-983F-387C-D28F581EACAB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.32150348463017903 -1.4198645832694537e-16 -0.32150348463017847
		-5.1872933964643913e-17 -1.338320800336671e-16 -0.45467458831420821
		-0.32150348463017858 -1.4198645832694537e-16 -0.32150348463017858
		-0.45467458831420821 -1.6167286899529908e-16 -2.7924866183301846e-17
		-0.3215034846301788 -1.813592796636524e-16 0.32150348463017858
		-1.3700232694214553e-16 -1.8951365795693048e-16 0.45467458831420821
		0.32150348463017847 -1.813592796636524e-16 0.32150348463017858
		0.45467458831420821 -1.6167286899529908e-16 3.4803506278303425e-16
		0.32150348463017903 -1.4198645832694537e-16 -0.32150348463017847
		-5.1872933964643913e-17 -1.338320800336671e-16 -0.45467458831420821
		-0.32150348463017858 -1.4198645832694537e-16 -0.32150348463017858
		;
createNode nurbsCurve -n "ik_aimShape1" -p "ik_aim";
	rename -uid "6B7282B8-41A2-E6B6-DF2D-6A9BB8CA242D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.32150348463017903 0.32150348463017858 5.2126750891707064e-17
		-5.1872933964643913e-17 0.45467458831420821 3.0711204080034464e-17
		-0.32150348463017858 0.3215034846301788 5.212675089170691e-17
		-0.45467458831420821 -2.9919548361914635e-17 1.0382845445008229e-16
		-0.3215034846301788 -0.32150348463017858 1.5553015800845771e-16
		-1.3700232694214553e-16 -0.45467458831420821 1.769457048201303e-16
		0.32150348463017847 -0.3215034846301788 1.5553015800845779e-16
		0.45467458831420821 -4.0587947732825053e-16 1.0382845445008231e-16
		0.32150348463017903 0.32150348463017858 5.2126750891707064e-17
		-5.1872933964643913e-17 0.45467458831420821 3.0711204080034464e-17
		-0.32150348463017858 0.3215034846301788 5.212675089170691e-17
		;
createNode nurbsCurve -n "ik_aimShape2" -p "ik_aim";
	rename -uid "8CB4CFCC-47C9-5893-FA56-D49AD1083F26";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.1701703558375495e-17 0.32150348463017914 -0.32150348463017847
		-2.7840788961631838e-17 -2.1354580295994309e-16 -0.45467458831420821
		-9.1074524895082318e-17 -0.3215034846301788 -0.32150348463017858
		-1.0095803933167962e-16 -0.45467458831420821 -2.7924866183301846e-17
		-5.1701703558375476e-17 -0.3215034846301788 0.32150348463017858
		2.7840788961631788e-17 -2.9867519593744466e-16 0.45467458831420821
		9.1074524895082269e-17 0.32150348463017858 0.32150348463017858
		1.0095803933167962e-16 0.45467458831420821 3.4803506278303425e-16
		5.1701703558375495e-17 0.32150348463017914 -0.32150348463017847
		-2.7840788961631838e-17 -2.1354580295994309e-16 -0.45467458831420821
		-9.1074524895082318e-17 -0.3215034846301788 -0.32150348463017858
		;
createNode transform -n "curveEnd_locator" -p "ik_aim";
	rename -uid "C21C0856-4B92-379B-48E6-E09A5ACF295B";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687562 0 ;
createNode locator -n "curveEnd_locatorShape" -p "curveEnd_locator";
	rename -uid "5E7A4211-45C8-25D6-F3A5-228E95AE8FA9";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "add_controls" -p "controls";
	rename -uid "0C1F8D07-4F37-96AE-9E86-678487FEC1F5";
createNode transform -n "middle_group" -p "add_controls";
	rename -uid "FC8E5EB7-4DA6-A9FC-4D55-21BACCBFAF7F";
createNode transform -n "middle" -p "middle_group";
	rename -uid "27E02E82-470D-905A-C071-6E9FE8200497";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_middleRounded" -ln "default_middleRounded" -dt "string";
	addAttr -ci true -sn "default_curving" -ln "default_curving" -dt "string";
	addAttr -ci true -sn "default_ellbowSize" -ln "default_ellbowSize" -dt "string";
	addAttr -ci true -sn "mainBendControls" -ln "mainBendControls" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "addBendControls" -ln "addBendControls" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "zero" -ln "zero" -min 0 -max 0 -at "double";
	addAttr -ci true -sn "one" -ln "one" -dv 1 -min 1 -max 1 -at "double";
	addAttr -ci true -sn "sharpCorner" -ln "sharpCorner" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "radius" -ln "radius" -min 0 -at "double";
	addAttr -ci true -sn "middleBend" -ln "middleBend" -min 0 -at "double";
	addAttr -ci true -sn "startWeight" -ln "startWeight" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "endWeight" -ln "endWeight" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "noCorner" -ln "noCorner" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "default_radius" -ln "default_radius" -dt "string";
	addAttr -ci true -sn "default_middleBend" -ln "default_middleBend" -dt "string";
	addAttr -ci true -sn "default_startWeight" -ln "default_startWeight" -dt "string";
	addAttr -ci true -sn "default_endWeight" -ln "default_endWeight" -dt "string";
	addAttr -ci true -sn "default_noCorner" -ln "default_noCorner" -dt "string";
	addAttr -ci true -sn "default_mainBendControls" -ln "default_mainBendControls" -dt "string";
	addAttr -ci true -sn "default_addBendControls" -ln "default_addBendControls" -dt "string";
	addAttr -ci true -sn "default_sharpCorner" -ln "default_sharpCorner" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_end";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_middleRounded" -type "string" "1.0";
	setAttr ".default_curving" -type "string" "0.3";
	setAttr ".default_ellbowSize" -type "string" "0.25";
	setAttr -cb on ".mainBendControls";
	setAttr -cb on ".addBendControls";
	setAttr -l on ".zero";
	setAttr -cb on ".sharpCorner" yes;
	setAttr -k on ".radius" 1;
	setAttr -k on ".middleBend" 1;
	setAttr -k on ".startWeight" 1;
	setAttr -k on ".endWeight" 1;
	setAttr -k on ".noCorner";
	setAttr ".default_radius" -type "string" "1.0";
	setAttr ".default_middleBend" -type "string" "1.0";
	setAttr ".default_startWeight" -type "string" "1.0";
	setAttr ".default_endWeight" -type "string" "1.0";
	setAttr ".default_noCorner" -type "string" "0.0";
	setAttr ".default_mainBendControls" -type "string" "False";
	setAttr ".default_addBendControls" -type "string" "False";
	setAttr ".default_sharpCorner" -type "string" "True";
createNode transform -n "curve1_2_offset" -p "middle";
	rename -uid "3660B092-4ED7-D184-4AF0-B0831752CE64";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" 0 -6.9388939039072261e-18 3.4694469519536136e-17 ;
	setAttr ".rpt" -type "double3" -2.3769283482227962e-17 0 -9.4214131554256245e-18 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 2.3111159332646827e-33 -6.1629758220391534e-33 ;
createNode transform -n "middleBend_" -p "curve1_2_offset";
	rename -uid "FD73169B-43FF-3200-F7F8-B79D4FF17B7A";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "middleBend_Shape" -p "middleBend_";
	rename -uid "D4AFBE96-4F3C-678A-3861-89931BC2D45D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.0974098814501957e-16 0.10229860991239548 -0.079224541783332825
		2.0974098814501957e-16 0 -0.1215980052947998
		2.0974098814501957e-16 -0.10229860991239548 -0.079224541783332825
		2.0974098814501957e-16 -0.14467209577560425 0.02307407557964325
		2.0974098814501957e-16 -0.10229860991239548 0.12537269294261932
		2.0974098814501957e-16 0 0.1677461564540863
		2.0974098814501957e-16 0.10229860991239548 0.12537269294261932
		2.0974098814501957e-16 0.14467209577560425 0.02307407557964325
		2.0974098814501957e-16 0.10229860991239548 -0.079224541783332825
		2.0974098814501957e-16 0 -0.1215980052947998
		2.0974098814501957e-16 -0.10229860991239548 -0.079224541783332825
		;
createNode transform -n "curve1_2_loc" -p "middleBend_";
	rename -uid "4FD0C67A-439A-7A17-E3CA-C785AD77C501";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.4408920985006262e-16 -2.3111159332646827e-33 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode locator -n "curve1_2_locShape" -p "curve1_2_loc";
	rename -uid "026196B9-425E-3AE2-05A5-EFBB793EF1BE";
	setAttr -k off ".v";
createNode transform -n "locator2" -p "middle";
	rename -uid "9BE0432A-4B2A-B7B1-0B13-9986C97E188E";
	setAttr ".v" no;
createNode locator -n "locatorShape1" -p "locator2";
	rename -uid "82F21BBD-4448-FDDC-2DF7-748CBC21E049";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.11 0.11 0.11 ;
createNode transform -n "locator3" -p "middle";
	rename -uid "058811F6-427C-D199-DABD-5B9668EC6DCC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.070741474628448486 1.6653345369377348e-16 -3.3306690738754676e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "locatorShape3" -p "locator3";
	rename -uid "CD3F9AA1-4DB2-B9E6-43E6-2297C11D0B64";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.11 0.11 0.11 ;
createNode transform -n "middleBend_hardLoc" -p "middle";
	rename -uid "85EAEDCC-4D32-1866-3BCC-7095FE3E8547";
	setAttr ".v" no;
createNode locator -n "middleBend_hardLocShape" -p "middleBend_hardLoc";
	rename -uid "3708097A-470B-B87D-5407-CDA98EF85A24";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "middleShape" -p "middle";
	rename -uid "C9908B43-42D9-90F2-C206-6C877D757DA1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 52 0 no 3
		53 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
		53
		0 0.45935783758595966 0
		0 0.42439143475796243 0.17578840672646454
		0 0.32481506769289392 0.32481506769289392
		0 0.17578840672646454 0.42439143475796243
		0 -1.8439322655885376e-17 0.45935772164201816
		0 -0.17578840672646454 0.42439143475796243
		0 -0.32481506769289392 0.32481506769289392
		0 -0.42439143475796243 0.17578840672646454
		0 -0.45935783758595966 0
		0 -0.42439143475796243 -0.17578840672646454
		0 -0.32481506769289392 -0.32481506769289392
		0 -0.17578840672646454 -0.42439143475796243
		0 -1.8439322655885376e-17 -0.45935772164201816
		0 0.17578840672646454 -0.42439143475796243
		0 0.32481506769289392 -0.32481506769289392
		0 0.42439143475796243 -0.17578840672646454
		0 0.45935783758595966 0
		0.17578840672646454 0.42439143475796243 -1.0199791025744616e-16
		0.32481506769289392 0.32481506769289392 -1.0199791025744616e-16
		0.42439143475796243 0.17578840672646454 -1.0199791025744616e-16
		0.45935772164201816 -1.8439322655885376e-17 -1.0199791025744616e-16
		0.42439143475796243 -0.17578840672646454 -1.0199791025744616e-16
		0.32481506769289392 -0.32481506769289392 -1.0199791025744616e-16
		0.17578840672646454 -0.42439143475796243 -1.0199791025744616e-16
		0 -0.45935783758595966 0
		-0.17578840672646454 -0.42439143475796243 0
		-0.32481506769289392 -0.32481506769289392 0
		-0.42439143475796243 -0.17578840672646454 0
		-0.45935772164201816 -1.8439322655885376e-17 0
		-0.42439143475796243 0.17578840672646454 0
		-0.32481506769289392 0.32481506769289392 0
		-0.17578840672646454 0.42439143475796243 0
		0 0.45935783758595966 0
		0 0.42439143475796243 -0.17578840672646454
		0 0.32481506769289392 -0.32481506769289392
		0 0.17578840672646454 -0.42439143475796243
		0 -1.8439322655885376e-17 -0.45935772164201816
		-0.17578840672646454 -1.8439322655885376e-17 -0.42439143475796243
		-0.32481506769289392 -1.8439322655885376e-17 -0.32481506769289392
		-0.42439143475796243 -1.8439322655885376e-17 -0.17578840672646454
		-0.45935772164201816 -1.8439322655885376e-17 0
		-0.42439143475796243 -1.8439322655885376e-17 0.17578840672646454
		-0.32481506769289392 -1.8439322655885376e-17 0.32481506769289392
		-0.17578840672646454 -1.8439322655885376e-17 0.42439143475796243
		0 -1.8439322655885376e-17 0.45935772164201816
		0.17578840672646454 -1.8439322655885376e-17 0.42439143475796243
		0.32481506769289392 -1.8439322655885376e-17 0.32481506769289392
		0.42439143475796243 -1.8439322655885376e-17 0.17578840672646454
		0.45935772164201816 -1.8439322655885376e-17 -1.0199791025744616e-16
		0.42439143475796243 -1.8439322655885376e-17 -0.17578840672646454
		0.32481506769289392 -1.8439322655885376e-17 -0.32481506769289392
		0.17578840672646454 -1.8439322655885376e-17 -0.42439143475796243
		0 -1.8439322655885376e-17 -0.45935772164201816
		;
createNode parentConstraint -n "middle_group_parentConstraint1" -p "middle_group";
	rename -uid "4C4F19DF-434D-3B54-2E56-13B76CDAA4FD";
	addAttr -ci true -k true -sn "w0" -ln "middle_locatorW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -0.021622327055805048 -11.309932443825767 0.0042404873702399414 ;
	setAttr ".rst" -type "double3" 2.0748394263618519 0 -1.1102230246251563e-16 ;
	setAttr ".rsrr" -type "double3" 0 -15.42933456495282 0 ;
	setAttr -k on ".w0";
createNode transform -n "end_group" -p "add_controls";
	rename -uid "5B0F9FF8-4DF1-68A4-B12D-9A98D5DFFFC2";
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode pointConstraint -n "end_group_pointConstraint1" -p "end_group";
	rename -uid "9F089F77-4AD0-F317-8A29-D8814013D5EF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "end_finalJointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 2.4930626847470552 0 0.68807732828418677 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "end_group_aimConstraint1" -p "end_group";
	rename -uid "88C97B6C-441A-67A0-954E-B588B5532240";
	addAttr -dcb 0 -ci true -sn "w1" -ln "middleW1" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" -1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -2.3128605049828717e-16 -65.403351953175601 3.6024186907081713e-16 ;
	setAttr -k on ".w1";
createNode transform -n "curve1_3_offset" -p "end_group";
	rename -uid "3BDB0635-4290-A39A-B8EC-1AB673EC512A";
	setAttr ".rp" -type "double3" 0 -3.4694469519536139e-19 1.7347234759768071e-18 ;
	setAttr ".rpt" -type "double3" 4.4715333406739685e-19 0 -5.8621022683015451e-20 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 6.5919492087118667e-18 -3.2959746043559335e-17 ;
createNode transform -n "lowerBend" -p "curve1_3_offset";
	rename -uid "80EA1A5D-4F3C-B08D-9E7C-2DA6EB277EDE";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "curve1_3_loc" -p "lowerBend";
	rename -uid "E4F8EC34-415B-F823-C5C2-7B8EBE792FB5";
	setAttr ".v" no;
createNode locator -n "curve1_3_locShape" -p "curve1_3_loc";
	rename -uid "7621C949-4180-EF42-6584-5DBFA5567FF8";
	setAttr -k off ".v";
createNode nurbsCurve -n "lowerBendShape" -p "lowerBend";
	rename -uid "331D56BA-47EC-EA76-41ED-66B9D52AF489";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.210664306629793e-16 -0.25911070606768921 -0.25911070606768472
		1.4864446740671579e-16 8.2983113375637972e-17 -0.36643772642142408
		1.210664306629793e-16 0.25911070606768921 -0.25911070606768472
		5.4487349314198899e-17 0.36643772642142891 -1.4273027127177584e-15
		-1.2091732034591042e-17 0.25911070606768921 0.25911070606769404
		-3.9669768778327537e-17 1.6434863356851076e-16 0.36643772642143307
		-1.2091732034591042e-17 -0.25911070606768921 0.25911070606769404
		5.448734931419411e-17 -0.36643772642142891 -1.2035479001373628e-15
		1.210664306629793e-16 -0.25911070606768921 -0.25911070606768472
		1.4864446740671579e-16 8.2983113375637972e-17 -0.36643772642142408
		1.210664306629793e-16 0.25911070606768921 -0.25911070606768472
		;
createNode transform -n "lower_curve_4_offset" -p "end_group";
	rename -uid "B6BDDBEE-4669-E8FB-FDD0-109C591CD581";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" 0 -6.9388939039072299e-18 1.3877787807814463e-17 ;
	setAttr ".rpt" -type "double3" 3.6921810719649411e-18 0 -5.0016494833200646e-19 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".spt" -type "double3" 0 -1.5407439555097894e-33 6.1629758220391602e-33 ;
createNode transform -n "lower_curve_4" -p "lower_curve_4_offset";
	rename -uid "E11D0BD4-4FE6-FFD0-0E59-44AEADB5C356";
createNode nurbsCurve -n "lower_curve_Shape4" -p "lower_curve_4";
	rename -uid "178B3647-4CE9-0A3B-D2DA-788CBC931838";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078361162489122491 4.7982373409884682e-18 -0.078361162489122393
		-1.2643170607829328e-17 6.7857323231109116e-18 -0.1108194187554388
		-0.078361162489122435 4.7982373409884713e-18 -0.078361162489122435
		-0.1108194187554388 1.966335461618786e-33 -3.2112695072372301e-17
		-0.078361162489122449 -4.7982373409884698e-18 0.078361162489122393
		-3.3392053635905197e-17 -6.7857323231109146e-18 0.11081941875543884
		0.078361162489122393 -4.7982373409884721e-18 0.078361162489122449
		0.1108194187554388 -3.6446300679047917e-33 5.9521325992805854e-17
		0.078361162489122491 4.7982373409884682e-18 -0.078361162489122393
		-1.2643170607829328e-17 6.7857323231109116e-18 -0.1108194187554388
		-0.078361162489122435 4.7982373409884713e-18 -0.078361162489122435
		;
createNode nurbsCurve -n "lower_curve_Shape9" -p "lower_curve_4";
	rename -uid "C700037D-420E-6D53-699B-BAAC3FA1944C";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078361162489122491 0.078361162489122393 -1.2601436025374897e-17
		-1.2643170607829328e-17 0.11081941875543884 -1.7821121732462098e-17
		-0.078361162489122435 0.078361162489122449 -1.26014360253749e-17
		-0.1108194187554388 3.2112695072372307e-17 -5.1641152288041202e-33
		-0.078361162489122449 -0.078361162489122435 1.2601436025374897e-17
		-3.3392053635905197e-17 -0.11081941875543884 1.7821121732462101e-17
		0.078361162489122393 -0.078361162489122463 1.2601436025374904e-17
		0.1108194187554388 -5.9521325992805866e-17 9.5717592467817803e-33
		0.078361162489122491 0.078361162489122393 -1.2601436025374897e-17
		-1.2643170607829328e-17 0.11081941875543884 -1.7821121732462098e-17
		-0.078361162489122435 0.078361162489122449 -1.26014360253749e-17
		;
createNode nurbsCurve -n "lower_curve_Shape10" -p "lower_curve_4";
	rename -uid "750916B8-43C7-7309-38EF-DE90EBEFDC28";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.260143602537492e-17 0.078361162489122532 -0.078361162489122393
		-6.7857323231109177e-18 -1.2643170607829328e-17 -0.1108194187554388
		-2.2197910707351839e-17 -0.078361162489122449 -0.078361162489122435
		-2.4606854055573013e-17 -0.11081941875543884 -3.2112695072372301e-17
		-1.2601436025374907e-17 -0.078361162489122477 0.078361162489122393
		6.7857323231109092e-18 -3.3392053635905209e-17 0.11081941875543884
		2.2197910707351839e-17 0.078361162489122393 0.078361162489122449
		2.4606854055573022e-17 0.11081941875543884 5.9521325992805854e-17
		1.260143602537492e-17 0.078361162489122532 -0.078361162489122393
		-6.7857323231109177e-18 -1.2643170607829328e-17 -0.1108194187554388
		-2.2197910707351839e-17 -0.078361162489122449 -0.078361162489122435
		;
createNode transform -n "lower_curve_4_loc" -p "lower_curve_4";
	rename -uid "22EB7CE0-409D-CE67-B8EA-ED96B7457A63";
	setAttr ".v" no;
createNode locator -n "lower_curve_4_locShape" -p "lower_curve_4_loc";
	rename -uid "86A420D8-42C3-53EA-AB9C-B9A39445490A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "lowerBend_1_hardLoc" -p "end_group";
	rename -uid "821DFDC9-4570-7DCB-0B27-19BC6E7587AE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -4.8442158699035645 0 2.2985086056692694e-15 ;
createNode locator -n "lowerBend_1_hardLocShape" -p "lowerBend_1_hardLoc";
	rename -uid "5D574F51-41DB-36D0-90E3-A88499488055";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "lowerBend_2_hardLoc" -p "end_group";
	rename -uid "F755DFB4-4441-6593-016F-7C9052E74192";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.9065296649932861 0 1.9428902930940239e-16 ;
createNode locator -n "lowerBend_2_hardLocShape" -p "lowerBend_2_hardLoc";
	rename -uid "080E203B-49B9-6055-2342-BF911653EA42";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "lowerBend_3_hardLoc" -p "end_group";
	rename -uid "92607ED0-49EB-B84C-1C38-2BB7DACBD3B4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.95915484428405762 0 -1.7694179454963432e-15 ;
createNode locator -n "lowerBend_3_hardLocShape" -p "lowerBend_3_hardLoc";
	rename -uid "3910A467-444C-A688-E0AD-EBA3748FFE86";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_group" -p "add_controls";
	rename -uid "A0899C22-4094-A801-92AE-E8A631815FAC";
createNode transform -n "upper_curve_0_offset" -p "root_group";
	rename -uid "E70163AA-44FC-E579-EB74-0EA8BAD0BFE8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -5.3067248683213676e-18 5.409555146642431e-20 -1.02557142827227e-18 ;
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
createNode transform -n "upper_curve_0" -p "upper_curve_0_offset";
	rename -uid "933A000F-4A2A-74DA-92F9-2FBDAD8E429D";
createNode nurbsCurve -n "upper_curve_Shape0" -p "upper_curve_0";
	rename -uid "04160D64-47E0-F107-3C5B-899EB2B4EDF4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078361162489122491 4.7982373409884682e-18 -0.078361162489122393
		-1.2643170607829328e-17 6.7857323231109116e-18 -0.1108194187554388
		-0.078361162489122435 4.7982373409884713e-18 -0.078361162489122435
		-0.1108194187554388 1.966335461618786e-33 -3.2112695072372301e-17
		-0.078361162489122449 -4.7982373409884698e-18 0.078361162489122393
		-3.3392053635905197e-17 -6.7857323231109146e-18 0.11081941875543884
		0.078361162489122393 -4.7982373409884721e-18 0.078361162489122449
		0.1108194187554388 -3.6446300679047917e-33 5.9521325992805854e-17
		0.078361162489122491 4.7982373409884682e-18 -0.078361162489122393
		-1.2643170607829328e-17 6.7857323231109116e-18 -0.1108194187554388
		-0.078361162489122435 4.7982373409884713e-18 -0.078361162489122435
		;
createNode nurbsCurve -n "upper_curve_Shape1" -p "upper_curve_0";
	rename -uid "9936428E-4A75-04B9-B491-D5A830A43B15";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078361162489122491 0.078361162489122393 -1.2601436025374897e-17
		-1.2643170607829328e-17 0.11081941875543884 -1.7821121732462098e-17
		-0.078361162489122435 0.078361162489122449 -1.26014360253749e-17
		-0.1108194187554388 3.2112695072372307e-17 -5.1641152288041202e-33
		-0.078361162489122449 -0.078361162489122435 1.2601436025374897e-17
		-3.3392053635905197e-17 -0.11081941875543884 1.7821121732462101e-17
		0.078361162489122393 -0.078361162489122463 1.2601436025374904e-17
		0.1108194187554388 -5.9521325992805866e-17 9.5717592467817803e-33
		0.078361162489122491 0.078361162489122393 -1.2601436025374897e-17
		-1.2643170607829328e-17 0.11081941875543884 -1.7821121732462098e-17
		-0.078361162489122435 0.078361162489122449 -1.26014360253749e-17
		;
createNode nurbsCurve -n "upper_curve_Shape2" -p "upper_curve_0";
	rename -uid "018EB317-4D61-4B3C-66D5-EC8F97A026F1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.260143602537492e-17 0.078361162489122532 -0.078361162489122393
		-6.7857323231109177e-18 -1.2643170607829328e-17 -0.1108194187554388
		-2.2197910707351839e-17 -0.078361162489122449 -0.078361162489122435
		-2.4606854055573013e-17 -0.11081941875543884 -3.2112695072372301e-17
		-1.2601436025374907e-17 -0.078361162489122477 0.078361162489122393
		6.7857323231109092e-18 -3.3392053635905209e-17 0.11081941875543884
		2.2197910707351839e-17 0.078361162489122393 0.078361162489122449
		2.4606854055573022e-17 0.11081941875543884 5.9521325992805854e-17
		1.260143602537492e-17 0.078361162489122532 -0.078361162489122393
		-6.7857323231109177e-18 -1.2643170607829328e-17 -0.1108194187554388
		-2.2197910707351839e-17 -0.078361162489122449 -0.078361162489122435
		;
createNode transform -n "upper_curve_0_loc" -p "upper_curve_0";
	rename -uid "B0FEF506-4CFB-64DD-BDB4-05925CA4105E";
	setAttr ".v" no;
createNode locator -n "upper_curve_0_locShape" -p "upper_curve_0_loc";
	rename -uid "1B309261-4E12-867E-8F3E-D4944E3F893E";
	setAttr -k off ".v";
createNode aimConstraint -n "root_group_aimConstraint1" -p "root_group";
	rename -uid "0FAFD822-41BA-E25D-EB07-2685D6940953";
	addAttr -dcb 0 -ci true -sn "w1" -ln "middleW1" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -5.4781708375408586e-17 33.780936856471413 -1.8041573285498628e-16 ;
	setAttr -k on ".w1";
createNode pointConstraint -n "root_group_pointConstraint1" -p "root_group";
	rename -uid "21E9CD30-418B-A233-1327-B0BD49DF2A0C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "a_finalJointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.45751338689550364 0 -0.36017935915534799 ;
	setAttr -k on ".w0";
createNode transform -n "curve1_1_offset" -p "root_group";
	rename -uid "E63CF1A5-4652-8546-C1C2-D7BB75DC5B25";
	setAttr ".rp" -type "double3" 0 -3.4694469519536139e-19 1.7347234759768069e-18 ;
	setAttr ".rpt" -type "double3" -4.6152263399562707e-19 0 -6.2520618541503395e-20 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 6.5919492087118667e-18 -3.2959746043559335e-17 ;
createNode transform -n "upperBend" -p "curve1_1_offset";
	rename -uid "D0CDBCBD-430C-0E85-032E-6094D9FA2FD8";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "curve1_1_loc" -p "upperBend";
	rename -uid "DE8EF084-45A9-9306-BAA6-60A3E7973E37";
	setAttr ".v" no;
createNode locator -n "curve1_1_locShape" -p "curve1_1_loc";
	rename -uid "A177A495-49C1-D5B2-487E-6C8CC346E70C";
	setAttr -k off ".v";
createNode nurbsCurve -n "upperBendShape" -p "upperBend";
	rename -uid "3E2B3415-4A2A-928C-F664-38BE5524DD64";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.9900663230545051e-18 -0.27648958097861454 -0.27648958097860976
		2.7437663388339982e-17 8.8991023397638568e-17 -0.39101515707555728
		-1.9900663230545051e-18 0.27648958097861454 -0.27648958097860976
		-7.303468884535363e-17 0.39101515707556089 -1.7843724381804231e-15
		-1.4407931136766298e-16 0.27648958097861454 0.27648958097861959
		-1.7350704107905737e-16 1.758138294701805e-16 0.39101515707556506
		-1.4407931136766298e-16 -0.27648958097861454 0.27648958097861959
		-7.3034688845358746e-17 -0.39101515707556089 -1.5456101141097995e-15
		-1.9900663230545051e-18 -0.27648958097861454 -0.27648958097860976
		2.7437663388339982e-17 8.8991023397638568e-17 -0.39101515707555728
		-1.9900663230545051e-18 0.27648958097861454 -0.27648958097860976
		;
createNode transform -n "upperBend_1_hardLoc" -p "root_group";
	rename -uid "DBA5901E-4A00-5807-A3DC-75AE2556963E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.95915484428405762 0 -4.1355807667287081e-15 ;
createNode locator -n "upperBend_1_hardLocShape" -p "upperBend_1_hardLoc";
	rename -uid "9F0B1E2E-458A-C9CB-4DA3-8FB2CC6CEAC7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "upperBend_2_hardLoc" -p "root_group";
	rename -uid "D97D2641-49AC-4661-E8C7-968C64610577";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.9065296649932861 0 -1.7763568394002505e-15 ;
createNode locator -n "upperBend_2_hardLocShape" -p "upperBend_2_hardLoc";
	rename -uid "75EF6540-4C49-914C-B6E1-DE812202DD39";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "upperBend_3_hardLoc" -p "root_group";
	rename -uid "34800188-4B75-7AEB-AE3D-32B8B95F106A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.8442158699035645 0 -3.8094527532450684e-15 ;
createNode locator -n "upperBend_3_hardLocShape" -p "upperBend_3_hardLoc";
	rename -uid "E156E96A-43DA-2CC5-E246-5AA7AD707E89";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "offset_group" -p "controls";
	rename -uid "C9A28691-4902-EC59-EA6D-93BCE811F68D";
	setAttr ".it" no;
createNode transform -n "lower_curve_1_offset" -p "offset_group";
	rename -uid "B90C7836-4141-A5D3-E57D-E49800A72985";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
createNode transform -n "lowerBend_1" -p "lower_curve_1_offset";
	rename -uid "B288451B-4719-C305-9FF8-97A448B147C0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "lower_curve_1_loc" -p "lowerBend_1";
	rename -uid "4CB7C3AD-4E05-001C-BAF2-1BA71311C8B7";
	setAttr ".v" no;
createNode locator -n "lower_curve_1_locShape" -p "lower_curve_1_loc";
	rename -uid "5A4BF05D-4F8F-5AF4-A843-9680858AACAF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "lowerBend_1Shape" -p "lowerBend_1";
	rename -uid "875696B3-491E-4B10-4C5F-EA9E61E5BB9B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		3.4082441847334439e-16 0.061137836761960308 -0.071329303922690282
		3.5502543590973378e-16 0.24455134704784751 -7.1329302066915804e-07
		3.124223836005661e-16 0.24455134704784751 7.1329302173593717e-07
		3.5857569026883156e-16 0.061137836761960308 0.07132930392269092
		3.6922645334612317e-16 6.113783495453826e-07 0.28531721569076279
		3.4082441847334439e-16 -6.1137835479564835e-07 0.2853172156907629
		3.3727416411424686e-16 -0.06113783676196409 0.071329303922690906
		3.6922645334612317e-16 -0.2445513470478502 7.1329302171355559e-07
		3.5502543590973378e-16 -0.2445513470478502 -7.1329302064893587e-07
		3.4082441847334439e-16 -0.06113783676196409 -0.071329303922690268
		3.4082441847334439e-16 -6.1137835479564835e-07 -0.28531721569076202
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "lower_curve_2_offset" -p "offset_group";
	rename -uid "3F3DFC00-4803-F2FD-22C3-D9A01EACBE0F";
	setAttr ".s" -type "double3" 1.0000000000000002 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814452e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".spt" -type "double3" 0 0 -4.6222318665293654e-33 ;
createNode transform -n "lowerBend_2" -p "lower_curve_2_offset";
	rename -uid "3279AFD0-440D-66B4-83B4-D7982A9B144D";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "lower_curve_2_loc" -p "lowerBend_2";
	rename -uid "9D288906-418A-CAA4-F699-79BFF4909FE1";
	setAttr ".v" no;
createNode locator -n "lower_curve_2_locShape" -p "lower_curve_2_loc";
	rename -uid "75957839-4BCC-BB60-576E-1F8E8DFBDE1C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "lowerBend_2Shape" -p "lowerBend_2";
	rename -uid "D7DAB296-4FDD-4976-423C-49BBD0DC202E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		5.5769734934117735e-16 6.1137834952103845e-07 -0.28531721569076202
		5.5769734934117735e-16 0.061137836761960308 -0.071329303922690282
		5.7189836677756669e-16 0.24455134704784751 -7.1329302061493872e-07
		5.2929531446839886e-16 0.24455134704784751 7.1329302179015543e-07
		5.7544862113666392e-16 0.061137836761960308 0.07132930392269092
		5.8609938421395603e-16 6.113783495453826e-07 0.28531721569076279
		5.5769734934117735e-16 -6.1137835479564835e-07 0.2853172156907629
		5.5414709498208031e-16 -0.06113783676196409 0.071329303922690906
		5.8609938421395603e-16 -0.2445513470478502 7.1329302176777449e-07
		5.7189836677756669e-16 -0.2445513470478502 -7.1329302059471771e-07
		5.5769734934117735e-16 -0.06113783676196409 -0.071329303922690268
		5.5769734934117735e-16 -6.1137835479564835e-07 -0.28531721569076202
		5.5769734934117735e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "lower_curve_3_offset" -p "offset_group";
	rename -uid "ED2D61BC-400A-35AE-92B5-BCAA1DDC0EBB";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814452e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".spt" -type "double3" 0 0 -4.6222318665293654e-33 ;
createNode transform -n "lowerBend_3" -p "lower_curve_3_offset";
	rename -uid "0A14BFC8-4A4C-8D61-384B-298F0BD72441";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "lower_curve_3_loc" -p "lowerBend_3";
	rename -uid "206FFE15-46D9-535E-E6D2-98B525716249";
	setAttr ".v" no;
createNode locator -n "lower_curve_3_locShape" -p "lower_curve_3_loc";
	rename -uid "01BACCB6-4063-EE7E-533C-6CB4589F70F6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "lowerBend_3Shape" -p "lowerBend_3";
	rename -uid "C8FCC23C-4D03-34EF-8171-0B9A1BEE09C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		1.239514876055117e-16 6.1137834952103845e-07 -0.28531721569076202
		1.239514876055117e-16 0.061137836761960308 -0.071329303922690282
		1.3815250504190102e-16 0.24455134704784751 -7.1329302050650389e-07
		9.5549452732733276e-17 0.24455134704784751 7.1329302189859026e-07
		1.4170275940099882e-16 0.061137836761960308 0.07132930392269092
		1.5235352247829031e-16 6.113783495453826e-07 0.28531721569076279
		1.239514876055117e-16 -6.1137835479564835e-07 0.2853172156907629
		1.2040123324641436e-16 -0.06113783676196409 0.071329303922690906
		1.5235352247829031e-16 -0.2445513470478502 7.1329302187620847e-07
		1.3815250504190102e-16 -0.2445513470478502 -7.1329302048628193e-07
		1.239514876055117e-16 -0.06113783676196409 -0.071329303922690268
		1.239514876055117e-16 -6.1137835479564835e-07 -0.28531721569076202
		1.239514876055117e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "upper_curve_4_offset" -p "offset_group";
	rename -uid "8BB5AB0F-4358-B4F0-CF05-B284998C9566";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814452e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".spt" -type "double3" 0 0 -4.6222318665293654e-33 ;
createNode transform -n "middleBend" -p "upper_curve_4_offset";
	rename -uid "FBA89CD7-4E91-1358-F32B-53AD7D25D1A6";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "upper_curve_4_loc" -p "middleBend";
	rename -uid "E0F675C0-44C2-743D-D5F9-518DCA748A01";
	setAttr ".v" no;
createNode locator -n "upper_curve_4_locShape" -p "upper_curve_4_loc";
	rename -uid "78999A03-42D7-F51E-D367-5FB3D9CCAB48";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "lower_curve_0_offset" -p "middleBend";
	rename -uid "B6711F9F-455C-631B-FAD5-E7B7DD159C4F";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
createNode transform -n "lower_curve_0" -p "lower_curve_0_offset";
	rename -uid "9DFA1B08-497D-D0EB-49AE-D3B59654CA51";
createNode nurbsCurve -n "lower_curve_Shape0" -p "lower_curve_0";
	rename -uid "B457B128-4B76-C51B-3117-F69219B0DE42";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.00043176114559173584 2.3991174255212366e-19 -0.00043176114559173584
		-2.7156339510115899e-21 3.3928673980240674e-19 -0.00061060488224029541
		-0.00043176114559173584 2.3991174255212366e-19 -0.00043176114559173584
		-0.00061060488224029541 -2.465190181878868e-32 -5.5511151231257827e-17
		-0.00043176114559173584 -2.3991174255212366e-19 0.00043176114559173584
		2.7164611316241429e-21 -3.3928673980240674e-19 0.00061060488224029541
		0.00043176114559173584 -2.3991174255212366e-19 0.00043176114559173584
		0.00061060488224029541 -2.4651903288156619e-32 -5.4157777870002667e-17
		0.00043176114559173584 2.3991174255212366e-19 -0.00043176114559173584
		-2.7156339510115899e-21 3.3928673980240674e-19 -0.00061060488224029541
		-0.00043176114559173584 2.3991174255212366e-19 -0.00043176114559173584
		;
createNode nurbsCurve -n "lower_curve_Shape1" -p "lower_curve_0";
	rename -uid "A89F1E91-4505-D4D0-4848-FBA95EB23BD5";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078361161053180695 0.078361161053180695 -1.2601435714935947e-17
		-1.2643170285561697e-17 0.11081942170858383 -1.7821121569616025e-17
		-0.078361161053180695 0.078361161053180695 -1.2601435714935947e-17
		-0.00061060488224029541 1.6056336695817816e-18 -5.4157774561280217e-17
		-0.078361161053180695 -0.078361161053180695 1.2601435714935947e-17
		-3.3392053792736699e-17 -0.11081942170858383 1.7821121569616025e-17
		0.078361161053180695 -0.078361161053180695 1.2601435714935947e-17
		0.00061060488224029541 -2.9760634950677851e-18 -5.4496117901594007e-17
		0.078361161053180695 0.078361161053180695 -1.2601435714935947e-17
		-1.2643170285561697e-17 0.11081942170858383 -1.7821121569616025e-17
		-0.078361161053180695 0.078361161053180695 -1.2601435714935947e-17
		;
createNode nurbsCurve -n "lower_curve_Shape2" -p "lower_curve_0";
	rename -uid "D687DA6A-4524-0A8A-49BA-9CB8702755C1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.2601435714935947e-17 0.078361161053180695 -0.078361161053180695
		-2.7152203607053133e-21 -6.32158721073238e-19 -0.00061060488224029541
		-2.2197911207285181e-17 -0.078361161053180695 -0.078361161053180695
		-2.4606854711302935e-17 -0.11081942170858383 -3.2112696552692783e-17
		-1.2601435714935947e-17 -0.078361161053180695 0.078361161053180695
		2.7152203607053133e-21 -1.6696012007117323e-18 0.00061060488224029541
		2.2197911207285181e-17 0.078361161053180695 0.078361161053180695
		2.4606854711302935e-17 0.11081942170858383 5.9521322840914905e-17
		1.2601435714935947e-17 0.078361161053180695 -0.078361161053180695
		-2.7152203607053133e-21 -6.32158721073238e-19 -0.00061060488224029541
		-2.2197911207285181e-17 -0.078361161053180695 -0.078361161053180695
		;
createNode transform -n "lower_curve_0_loc" -p "lower_curve_0";
	rename -uid "2347565B-45BA-BF5F-9063-48A9EF853176";
	setAttr ".v" no;
createNode locator -n "lower_curve_0_locShape" -p "lower_curve_0_loc";
	rename -uid "17904A3A-4037-9DB5-A0B8-FDADA553F0B9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "twistDown_root_connector" -p "middleBend";
	rename -uid "D1DAA7DA-4D94-E408-B4ED-BE99E75C6B45";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.532107773982716e-14 0 0 ;
	setAttr ".sh" -type "double3" 0 -4.2116433226552086e-06 0 ;
createNode locator -n "twistDown_root_connectorShape" -p "twistDown_root_connector";
	rename -uid "29E58CE0-4AA5-5544-16EB-6696EDF7CC4B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
createNode transform -n "twistDown_start_connector" -p "twistDown_root_connector";
	rename -uid "36F05AC4-46ED-210F-ABCC-2EB075B035A6";
	setAttr -k off ".v";
	setAttr ".ovc" 17;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
createNode locator -n "twistDown_start_connectorShape" -p "twistDown_start_connector";
	rename -uid "8B10CB03-44BB-FE96-B3B9-5AB43D635003";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
createNode transform -n "twistDown_end_connector" -p "twistDown_root_connector";
	rename -uid "08D2005D-4660-7630-DF40-348125B9D2B8";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 17;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr ".default_translate" -type "string" "[(5.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "5.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode locator -n "twistDown_end_connectorShape" -p "twistDown_end_connector";
	rename -uid "2C23A704-423B-372A-FBC0-59B9060D0A07";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
createNode parentConstraint -n "twistDown_end_connector_parentConstraint1" -p "twistDown_end_connector";
	rename -uid "E788147C-4549-4094-45FF-F791445A909A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "end_finalJointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0.019945306669958848 11.492184407135184 -0.004243208063976542 ;
	setAttr ".rst" -type "double3" 2.0740713169497367 0 2.2531785326407316e-09 ;
	setAttr ".rsrr" -type "double3" 0 17.824117377151381 0 ;
	setAttr -k on ".w0";
createNode transform -n "twistDown_startUp_loc" -p "twistDown_root_connector";
	rename -uid "F75E199A-4A4E-024D-11B5-8DAF29F3248B";
	setAttr ".ovc" 17;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
createNode locator -n "twistDown_startUp_locShape" -p "twistDown_startUp_loc";
	rename -uid "137890DC-40F5-ADB7-42C1-3CB7E77C5EAB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 1.5 1.5 1.5 ;
createNode transform -n "twistDown_endUp_loc" -p "twistDown_startUp_loc";
	rename -uid "67DCAEA5-4375-F767-DA45-AAB8D673E76A";
	setAttr ".ovc" 17;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999944 0.99999999999999989 ;
createNode locator -n "twistDown_endUp_locShape" -p "twistDown_endUp_loc";
	rename -uid "3621F544-4C35-A37A-F086-CB983A773F9B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 1.5 1.5 1.5 ;
createNode aimConstraint -n "twistDown_root_connector_aimConstraint1" -p "twistDown_root_connector";
	rename -uid "669377E7-4C5D-FBA9-8ED6-DD81AB9C2A6B";
	addAttr -dcb 0 -ci true -sn "w0" -ln "end_finalJointW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.9962042558246924 -7.2841428880487564 -6.5745976280549474 ;
	setAttr -k on ".w0";
createNode nurbsCurve -n "middleBendShape" -p "middleBend";
	rename -uid "488978C7-432A-F18F-7B98-9DAADBD4B8F1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		3.4082441847334439e-16 0.061137836761960308 -0.071329303922690282
		3.5502543590973378e-16 0.24455134704784751 -7.1329302064204949e-07
		3.124223836005661e-16 0.24455134704784751 7.1329302176304519e-07
		3.5857569026883156e-16 0.061137836761960308 0.07132930392269092
		3.6922645334612317e-16 6.113783495453826e-07 0.28531721569076279
		3.4082441847334439e-16 -6.1137835479564835e-07 0.2853172156907629
		3.3727416411424686e-16 -0.06113783676196409 0.071329303922690906
		3.6922645334612317e-16 -0.2445513470478502 7.1329302174066404e-07
		3.5502543590973378e-16 -0.2445513470478502 -7.1329302062182764e-07
		3.4082441847334439e-16 -0.06113783676196409 -0.071329303922690268
		3.4082441847334439e-16 -6.1137835479564835e-07 -0.28531721569076202
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "upper_curve_3_offset" -p "offset_group";
	rename -uid "E858C831-4002-A31B-1906-A2B0CCEBE157";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
createNode transform -n "upperBend_3" -p "upper_curve_3_offset";
	rename -uid "811D25E2-4E66-4AC2-F4A0-38B35DEF6520";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "upper_curve_3_loc" -p "upperBend_3";
	rename -uid "D64FCDB3-4301-7AB4-2F49-28BAC7B512BA";
	setAttr ".v" no;
createNode locator -n "upper_curve_3_locShape" -p "upper_curve_3_loc";
	rename -uid "D2D9BDB9-493F-B962-A74B-6B994E7D61E2";
	setAttr -k off ".v";
createNode nurbsCurve -n "upperBend_3Shape" -p "upperBend_3";
	rename -uid "A1925B91-4F14-9910-4384-70875B57CCE9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		4.4926088390726057e-16 6.1137834952103845e-07 -0.28531721569076202
		4.4926088390726057e-16 0.061137836761960308 -0.071329303922690282
		4.6346190134364991e-16 0.24455134704784751 -7.1329302061493872e-07
		4.2085884903448258e-16 0.24455134704784751 7.1329302179015543e-07
		4.6701215570274715e-16 0.061137836761960308 0.07132930392269092
		4.7766291878003994e-16 6.113783495453826e-07 0.28531721569076279
		4.4926088390726057e-16 -6.1137835479564835e-07 0.2853172156907629
		4.4571062954816343e-16 -0.06113783676196409 0.071329303922690906
		4.7766291878003994e-16 -0.2445513470478502 7.1329302176777449e-07
		4.6346190134364991e-16 -0.2445513470478502 -7.1329302059471771e-07
		4.4926088390726057e-16 -0.06113783676196409 -0.071329303922690268
		4.4926088390726057e-16 -6.1137835479564835e-07 -0.28531721569076202
		4.4926088390726057e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "upper_curve_2_offset" -p "offset_group";
	rename -uid "83D6F537-4CF5-6B1C-EE30-ED85A02269A2";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
createNode transform -n "upperBend_2" -p "upper_curve_2_offset";
	rename -uid "43C6026C-4238-192E-07C2-95BE4D0490ED";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "upper_curve_2_loc" -p "upperBend_2";
	rename -uid "5F12D61B-4BA4-3FFE-4720-3099C871A45C";
	setAttr ".v" no;
createNode locator -n "upper_curve_2_locShape" -p "upper_curve_2_loc";
	rename -uid "42CF954A-40E9-2781-E548-87A93A686950";
	setAttr -k off ".v";
createNode nurbsCurve -n "upperBend_2Shape" -p "upperBend_2";
	rename -uid "F297E534-4D9D-8139-EBAE-62973DC75F45";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		3.4082441847334439e-16 0.061137836761960308 -0.071329303922690282
		3.5502543590973378e-16 0.24455134704784751 -7.1329302064882523e-07
		3.124223836005661e-16 0.24455134704784751 7.1329302175626871e-07
		3.5857569026883156e-16 0.061137836761960308 0.07132930392269092
		3.6922645334612317e-16 6.113783495453826e-07 0.28531721569076279
		3.4082441847334439e-16 -6.1137835479564835e-07 0.2853172156907629
		3.3727416411424686e-16 -0.06113783676196409 0.071329303922690906
		3.6922645334612317e-16 -0.2445513470478502 7.1329302173388724e-07
		3.5502543590973378e-16 -0.2445513470478502 -7.132930206286039e-07
		3.4082441847334439e-16 -0.06113783676196409 -0.071329303922690268
		3.4082441847334439e-16 -6.1137835479564835e-07 -0.28531721569076202
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "upper_curve_1_offset" -p "offset_group";
	rename -uid "BCB564C5-45C0-2F55-E296-9BB50149353B";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814452e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 1.3877787807814457e-17 ;
	setAttr ".spt" -type "double3" 0 0 -4.6222318665293654e-33 ;
createNode transform -n "upperBend_1" -p "upper_curve_1_offset";
	rename -uid "A2765F51-4832-6D9A-58BC-E5B0BF30A272";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "upper_curve_1_loc" -p "upperBend_1";
	rename -uid "843EC76E-4C98-32B1-3321-0BAA7C45FAEC";
	setAttr ".v" no;
createNode locator -n "upper_curve_1_locShape" -p "upper_curve_1_loc";
	rename -uid "E3B3E6D9-4A2E-5216-2B5E-CEB237515C96";
	setAttr -k off ".v";
createNode nurbsCurve -n "upperBend_1Shape" -p "upperBend_1";
	rename -uid "A191341C-4FA8-348C-BCA4-E2BEFCB73240";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		3.4082441847334439e-16 0.061137836761960308 -0.071329303922690282
		3.5502543590973378e-16 0.24455134704784751 -7.1329302061324465e-07
		3.124223836005661e-16 0.24455134704784751 7.1329302179184939e-07
		3.5857569026883156e-16 0.061137836761960308 0.07132930392269092
		3.6922645334612317e-16 6.113783495453826e-07 0.28531721569076279
		3.4082441847334439e-16 -6.1137835479564835e-07 0.2853172156907629
		3.3727416411424686e-16 -0.06113783676196409 0.071329303922690906
		3.6922645334612317e-16 -0.2445513470478502 7.1329302176946824e-07
		3.5502543590973378e-16 -0.2445513470478502 -7.132930205930227e-07
		3.4082441847334439e-16 -0.06113783676196409 -0.071329303922690268
		3.4082441847334439e-16 -6.1137835479564835e-07 -0.28531721569076202
		3.4082441847334439e-16 6.1137834952103845e-07 -0.28531721569076202
		;
createNode transform -n "system" -p "mod";
	rename -uid "BB4F4C19-4515-AF79-6BDF-4C935FBDEF07";
createNode transform -n "ik_joints" -p "system";
	rename -uid "487975A2-4FCA-5D9E-85C4-C696645F8198";
	setAttr ".v" no;
createNode joint -n "a_ikJoint" -p "ik_joints";
	rename -uid "042E2C71-45A9-EBBB-0D90-57A25FCFF3F7";
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" -0.021202436301850886 0.0087027423348141116 -3.2204971784293051e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "b_ikJoint" -p "a_ikJoint";
	rename -uid "6F596FD4-4C7A-8087-6861-768EB39AE0C6";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 5.0991744995117188 0 -1.6653345369377336e-15 ;
	setAttr ".r" -type "double3" 0 -17.637271942715131 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -5 0 ;
createNode joint -n "end_ikJoint" -p "b_ikJoint";
	rename -uid "EAEBEADE-487E-3E58-4BC4-489E2A8C16A5";
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode ikEffector -n "effector" -p "b_ikJoint";
	rename -uid "57717DCA-4C02-89F7-3575-5F9CC71829DD";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".hd" yes;
createNode ikHandle -n "ikHandle" -p "system";
	rename -uid "BDC88C78-4D26-123F-C858-AC8A0E5695CC";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle_poleVectorConstraint1" -p "ikHandle";
	rename -uid "28F35096-474E-AC51-CFEE-D7A8B50ABE0D";
	addAttr -ci true -k true -sn "w0" -ln "l_elbowW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 2.4407336945833804 -0.19346201857986681 -1.9383567201180392 ;
	setAttr -k on ".w0";
createNode transform -n "final_joints" -p "system";
	rename -uid "2E04B92E-42AD-8E8E-9EDD-85BAAFC81A16";
	setAttr ".v" no;
createNode joint -n "a_finalJoint" -p "final_joints";
	rename -uid "5E79C7EA-4EE3-D637-F09C-8695DB795B71";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.09961607666187984 0.0055378625360235382 -0.0067800699868501638 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 0.0070934636314600244 -0.0056734465564594666 0.099586619472096516 0
		 0.32123309041702086 2.3902817968656178 -0.054956858176564261 1;
createNode joint -n "b_finalJoint" -p "a_finalJoint";
	rename -uid "4D18F67A-460B-1E1B-47F1-498F5A6BD69E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ro" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.099691102795354883 0.0047514142680777855 0.0062536458085739538 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 -0.005946762080523681 -0.0063466510657197535 0.099621062235892885 0
		 0.8016236508328034 2.4169876959165881 -0.087653203282550218 1;
createNode joint -n "end_finalJoint" -p "b_finalJoint";
	rename -uid "EB366DED-4527-0572-184B-14994AF5E8F6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "end_joint_parentConstraint1" -p "end_finalJoint";
	rename -uid "647EEA87-4668-7639-8051-4FBE865EF770";
	addAttr -ci true -k true -sn "w1" -ln "end_ikJointW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w0" -ln "end_fkJointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0.019958414124985384 11.318637262302037 -0.0042406160629095292 ;
	setAttr ".rst" -type "double3" 2.161307049502966 0.029976148749351963 -0.079060712407660994 ;
	setAttr ".rsrr" -type "double3" 1.8436269137598027 29.243973811402793 1.6517385454817457 ;
	setAttr ".int" 2;
	setAttr -k on ".w1";
	setAttr -k on ".w0";
createNode transform -n "ik_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "3A0BA117-422A-B425-5A5E-5AB63E0070A3";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "ik_end_ikFkSwitchHelperShape" -p "ik_end_ikFkSwitchHelper";
	rename -uid "11302DCF-4AB0-8D7B-64CB-76B783127418";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "820BFF90-4B31-D2E6-C7FF-F2922C58772E";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "fk_end_ikFkSwitchHelperShape" -p "fk_end_ikFkSwitchHelper";
	rename -uid "CA13E768-42F1-42DB-2774-69B31D7F6ED5";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "curve1_4_loc" -p "end_finalJoint";
	rename -uid "B6C5E26B-4811-EAE9-4DF7-F59278E91CAA";
	setAttr ".v" no;
createNode locator -n "curve1_4_locShape" -p "curve1_4_loc";
	rename -uid "D807226B-4C63-8821-38C5-489D5CE3062A";
	setAttr -k off ".v";
createNode transform -n "curveStart_locator" -p "b_finalJoint";
	rename -uid "0A54CE1B-4559-905C-5139-00A71E74B0D6";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "curveStart_locatorShape" -p "curveStart_locator";
	rename -uid "2C26022A-4974-7AD1-2C79-95BED131A39A";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode parentConstraint -n "b_joint_parentConstraint1" -p "b_finalJoint";
	rename -uid "CF510DC9-44C5-234A-84AB-7F83BAD61780";
	addAttr -ci true -k true -sn "w0" -ln "b_ikJointW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "b_fkJointW1" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 -22.637271942715124 0 ;
	setAttr ".rst" -type "double3" 2.2681055008005182 0.036040713028121597 -0.1204070915889166 ;
	setAttr ".rsrr" -type "double3" -0.10474226879154834 -52.816060736806094 -0.3565215501189829 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "fk_b_ikFkSwitchHelper" -p "b_finalJoint";
	rename -uid "9BBD021C-4E2A-D891-8CCC-C3968AAE62A7";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687512 0 ;
createNode locator -n "fk_b_ikFkSwitchHelperShape" -p "fk_b_ikFkSwitchHelper";
	rename -uid "728112C8-408B-2BB4-C235-E48DBA43A710";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middle_locator" -p "b_finalJoint";
	rename -uid "BE9B00A4-4B12-B763-3246-FFAFE856C98C";
createNode locator -n "middle_locatorShape" -p "middle_locator";
	rename -uid "6A58C4A4-43E6-CAE5-CEC0-278073602A5F";
	setAttr -k off ".v" no;
createNode orientConstraint -n "locator1_orientConstraint1" -p "middle_locator";
	rename -uid "8884D055-420C-3CC7-624D-FD9F14CD5AC9";
	addAttr -ci true -k true -sn "w0" -ln "a_finalJointW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "b_finalJointW1" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 1.2364560723841511e-18 11.318635971357573 1.1026879986829649e-18 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode joint -n "middle_volume_outJoint" -p "b_finalJoint";
	rename -uid "14E0C9B9-41A8-19A1-2816-A2976B80BBDB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 8.8817841970012523e-16 1.2037062152420224e-35 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.1060104311167156e-18 -1.5902773407317584e-15 3.1060104311167156e-18 ;
createNode parentConstraint -n "a_joint_parentConstraint1" -p "a_finalJoint";
	rename -uid "65F89FF2-4C62-1CD2-9543-50AB4D79981B";
	addAttr -ci true -k true -sn "w0" -ln "a_fkJointW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "a_ikJointW1" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -0.021203080420861248 11.318635216355 -3.2843753650027767e-06 ;
	setAttr ".rst" -type "double3" -8.1139024314801804e-17 2.0284756078700451e-17 2.4341707294440544e-16 ;
	setAttr ".rsrr" -type "double3" -2.7624631311983412e-16 -7.3523463271148621e-34 
		-3.0498753761064987e-16 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "ik_root_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "AD03AE9B-4A10-3470-9253-C684C5B7216D";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "ik_root_ikFkSwitchHelperShape" -p "ik_root_ikFkSwitchHelper";
	rename -uid "034D94F8-4677-CFB0-FE73-F996F9E2E30C";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_a_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "0EC2152C-4D56-BE04-00D8-F2BE43E9F76E";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "fk_a_ikFkSwitchHelperShape" -p "fk_a_ikFkSwitchHelper";
	rename -uid "2CD5456A-4830-5565-B9A2-798C840545D2";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "twistUp_root_connector" -p "a_finalJoint";
	rename -uid "9AA1708C-4F85-4329-1476-1296C8BAF957";
	setAttr ".v" no;
createNode locator -n "twistUp_root_connectorShape" -p "twistUp_root_connector";
	rename -uid "F6E5551A-45A7-7614-88A4-A9ADD9A8C202";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
createNode transform -n "twistUp_start_connector" -p "twistUp_root_connector";
	rename -uid "7CA85724-443C-2BB9-B1F4-FD94D0795C7C";
	setAttr -k off ".v";
	setAttr ".ovc" 17;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
createNode locator -n "twistUp_start_connectorShape" -p "twistUp_start_connector";
	rename -uid "6E9CDE4E-4173-E355-DBE8-748E06FE29B1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
createNode transform -n "twistUp_end_connector" -p "twistUp_root_connector";
	rename -uid "B83D5FD8-4BB0-53FF-4A58-28B3EDE8A8E6";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 17;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr ".default_translate" -type "string" "[(5.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "5.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode locator -n "twistUp_end_connectorShape" -p "twistUp_end_connector";
	rename -uid "AB51BAD8-46E2-0DFF-A066-9A918D08909B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
createNode parentConstraint -n "end_connector_parentConstraint1" -p "twistUp_end_connector";
	rename -uid "976E747F-41CC-0DDA-6D4F-2587F5F76A90";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 -11.318635971357555 0 ;
	setAttr ".rst" -type "double3" 2.0399847511487548 0 -1.5114719125793002e-08 ;
	setAttr ".rsrr" -type "double3" 0 -28.557485169906649 0 ;
	setAttr -k on ".w0";
createNode transform -n "twistUp_startUp_loc" -p "twistUp_root_connector";
	rename -uid "16AF59CF-45E5-E805-51A6-BAAB44AE6554";
	setAttr ".v" no;
	setAttr ".ovc" 17;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
createNode locator -n "twistUp_startUp_locShape" -p "twistUp_startUp_loc";
	rename -uid "F39F06C1-49F5-4CC9-6991-65A7FD5E8400";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 1.5 1.5 1.5 ;
createNode aimConstraint -n "twistUp_root_connector_aimConstraint1" -p "twistUp_root_connector";
	rename -uid "D14C25D8-413D-402F-2871-DEB198A0FD46";
	addAttr -dcb 0 -ci true -sn "w0" -ln "middleW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 14.492970098111327 39.512839419596048 22.110195845577145 ;
	setAttr -k on ".w0";
createNode transform -n "curve1_0_loc" -p "a_finalJoint";
	rename -uid "8AF2A9C9-4B3B-5129-3942-28AC67084AA9";
	setAttr ".v" no;
createNode locator -n "curve1_0_locShape" -p "curve1_0_loc";
	rename -uid "A6A0B997-4578-A7EF-4817-199ABD9D1099";
	setAttr -k off ".v";
createNode joint -n "root_volume_outJoint" -p "a_finalJoint";
	rename -uid "07006F86-4CA7-18A3-E085-0D992268A189";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.1060104311167164e-18 0 -7.7650260777917909e-19 ;
createNode transform -n "soft_curve" -p "system";
	rename -uid "B353AC9B-4323-7084-C036-18BEE1390E74";
	setAttr ".v" no;
createNode nurbsCurve -n "soft_curveShape" -p "soft_curve";
	rename -uid "AF0DA0E8-4212-39F3-9FDF-ED80D57F6D2F";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 0.5 1 1 1
		5
		0 0 0
		2.4760884216758128 -4.4632339517199649e-05 -0.61821713185907357
		5.0000000253745425 -4.1358113556776856e-05 -1.1139762162767941
		7.5239116029625839 0.00032170451029626187 -0.61821713186068028
		9.9999999920780382 0.00072573233323714609 -3.049338559435455e-12
		;
createNode transform -n "final_curve" -p "system";
	rename -uid "BDA358FC-49C6-95B3-7A64-55B5FA3E07E7";
	setAttr ".tmp" yes;
createNode nurbsCurve -n "final_curveShape" -p "final_curve";
	rename -uid "4B4FE940-4CAF-DC00-51B3-8DA9ACADF58D";
	setAttr -k off ".v";
	setAttr -s 9 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 6 0 no 3
		11 0 0 0 0.16666666666666666 0.33333333333333331 0.5 0.66666666666666663 0.83333333333333337
		 1 1 1
		9
		-5.4046817967048915e-18 5.3721753255795302e-20 5.0799220773883605e-20
		0.926464427009278 -2.6164482355690955e-05 -0.25739793166248015
		2.8258939090403707 -4.5017009805827536e-05 -0.68923831746607334
		4.7360972152715641 -2.6162870589296059e-05 -1.0193200424924767
		5.0000000228089467 -6.0058218052113952e-06 -1.0165510636239539
		5.2639028304921842 1.2141689509507004e-05 -1.0193200424927604
		7.1741061193385818 0.00027054680973403393 -0.68923831746747433
		9.0735355786254352 0.0005650948137103616 -0.25739793166498753
		9.9999999920780382 0.00072573233323714609 -3.0495603595677651e-12
		;
createNode transform -n "soft_locs_group" -p "system";
	rename -uid "95EE266C-4638-AE40-DA9E-D9BBCC006875";
	setAttr ".v" no;
createNode transform -n "lowerBend_1_softLoc" -p "soft_locs_group";
	rename -uid "F3630566-4F23-0788-3A33-DAB7388C6EC3";
createNode locator -n "lowerBend_1_softLocShape" -p "lowerBend_1_softLoc";
	rename -uid "E7BD2F0A-449E-0316-BFBB-DD8F7A424B97";
	setAttr -k off ".v";
createNode transform -n "lowerBend_2_softLoc" -p "soft_locs_group";
	rename -uid "8C2DC7F2-44B9-C8AA-D805-7EB1C984293A";
createNode locator -n "lowerBend_2_softLocShape" -p "lowerBend_2_softLoc";
	rename -uid "4C7E86F1-4703-1799-63A6-4FAB01CF9B80";
	setAttr -k off ".v";
createNode transform -n "lowerBend_3_softLoc" -p "soft_locs_group";
	rename -uid "E51C34E7-400D-0E8A-67AE-9ABA039001BC";
createNode locator -n "lowerBend_3_softLocShape" -p "lowerBend_3_softLoc";
	rename -uid "6A93B482-4A52-D0E2-D2A6-E6B21B691298";
	setAttr -k off ".v";
createNode transform -n "upperBend_3_softLoc" -p "soft_locs_group";
	rename -uid "97CA7979-458D-FC21-F97F-40B3FA1A5051";
createNode locator -n "upperBend_3_softLocShape" -p "upperBend_3_softLoc";
	rename -uid "B609A66D-4A10-8540-0D21-CEAF535FB64E";
	setAttr -k off ".v";
createNode transform -n "upperBend_2_softLoc" -p "soft_locs_group";
	rename -uid "5D51FB35-4A2A-2357-64EE-42BCC064D67E";
createNode locator -n "upperBend_2_softLocShape" -p "upperBend_2_softLoc";
	rename -uid "7B42E058-4932-3741-AFFF-919CA07C3BCE";
	setAttr -k off ".v";
createNode transform -n "upperBend_1_softLoc" -p "soft_locs_group";
	rename -uid "B214F671-4108-17D3-A26C-F0B6AA3C04F7";
createNode locator -n "upperBend_1_softLocShape" -p "upperBend_1_softLoc";
	rename -uid "9488F2BA-4F74-41A2-6ECB-C193BC380EC7";
	setAttr -k off ".v";
createNode transform -n "middleBend_softLoc" -p "soft_locs_group";
	rename -uid "B6B0F32F-4E96-2098-658A-3384A693E27F";
createNode locator -n "middleBend_softLocShape" -p "middleBend_softLoc";
	rename -uid "23DD3FD5-4D2B-51EA-5B77-A7AD92BA9BF5";
	setAttr -k off ".v";
createNode transform -n "bifrostGraph" -p "system";
	rename -uid "EF1F8328-44D8-17FB-5CA3-85A1F97202B5";
createNode bifrostGraphShape -n "bifrostGraphShape" -p "bifrostGraph";
	rename -uid "49D2AAF0-4C74-BBDF-A9BA-E8B76780488D";
	addAttr -r false -ci true -k true -sn "angle" -ln "angle" -at "float";
	addAttr -w false -ci true -sn "main_bend_upper" -ln "main_bend_upper" -at "float3" 
		-nc 3;
	addAttr -w false -ci true -sn "main_bend_upperx" -ln "main_bend_upperx" -at "float" 
		-p "main_bend_upper";
	addAttr -w false -ci true -sn "main_bend_uppery" -ln "main_bend_uppery" -at "float" 
		-p "main_bend_upper";
	addAttr -w false -ci true -sn "main_bend_upperz" -ln "main_bend_upperz" -at "float" 
		-p "main_bend_upper";
	addAttr -w false -ci true -sn "main_bend_lower" -ln "main_bend_lower" -at "float3" 
		-nc 3;
	addAttr -w false -ci true -sn "main_bend_lowerx" -ln "main_bend_lowerx" -at "float" 
		-p "main_bend_lower";
	addAttr -w false -ci true -sn "main_bend_lowery" -ln "main_bend_lowery" -at "float" 
		-p "main_bend_lower";
	addAttr -w false -ci true -sn "main_bend_lowerz" -ln "main_bend_lowerz" -at "float" 
		-p "main_bend_lower";
	addAttr -w false -ci true -sn "bend_upper_2" -ln "bend_upper_2" -at "float3" -nc 
		3;
	addAttr -w false -ci true -sn "bend_upper_2x" -ln "bend_upper_2x" -at "float" -p "bend_upper_2";
	addAttr -w false -ci true -sn "bend_upper_2y" -ln "bend_upper_2y" -at "float" -p "bend_upper_2";
	addAttr -w false -ci true -sn "bend_upper_2z" -ln "bend_upper_2z" -at "float" -p "bend_upper_2";
	addAttr -w false -ci true -sn "bend_upper_1" -ln "bend_upper_1" -at "float3" -nc 
		3;
	addAttr -w false -ci true -sn "bend_upper_1x" -ln "bend_upper_1x" -at "float" -p "bend_upper_1";
	addAttr -w false -ci true -sn "bend_upper_1y" -ln "bend_upper_1y" -at "float" -p "bend_upper_1";
	addAttr -w false -ci true -sn "bend_upper_1z" -ln "bend_upper_1z" -at "float" -p "bend_upper_1";
	addAttr -w false -ci true -sn "bend_upper_3" -ln "bend_upper_3" -at "float3" -nc 
		3;
	addAttr -w false -ci true -sn "bend_upper_3x" -ln "bend_upper_3x" -at "float" -p "bend_upper_3";
	addAttr -w false -ci true -sn "bend_upper_3y" -ln "bend_upper_3y" -at "float" -p "bend_upper_3";
	addAttr -w false -ci true -sn "bend_upper_3z" -ln "bend_upper_3z" -at "float" -p "bend_upper_3";
	addAttr -w false -ci true -sn "bend_lower_1" -ln "bend_lower_1" -at "float3" -nc 
		3;
	addAttr -w false -ci true -sn "bend_lower_1x" -ln "bend_lower_1x" -at "float" -p "bend_lower_1";
	addAttr -w false -ci true -sn "bend_lower_1y" -ln "bend_lower_1y" -at "float" -p "bend_lower_1";
	addAttr -w false -ci true -sn "bend_lower_1z" -ln "bend_lower_1z" -at "float" -p "bend_lower_1";
	addAttr -w false -ci true -sn "bend_lower_2" -ln "bend_lower_2" -at "float3" -nc 
		3;
	addAttr -w false -ci true -sn "bend_lower_2x" -ln "bend_lower_2x" -at "float" -p "bend_lower_2";
	addAttr -w false -ci true -sn "bend_lower_2y" -ln "bend_lower_2y" -at "float" -p "bend_lower_2";
	addAttr -w false -ci true -sn "bend_lower_2z" -ln "bend_lower_2z" -at "float" -p "bend_lower_2";
	addAttr -w false -ci true -sn "bend_lower_3" -ln "bend_lower_3" -at "float3" -nc 
		3;
	addAttr -w false -ci true -sn "bend_lower_3x" -ln "bend_lower_3x" -at "float" -p "bend_lower_3";
	addAttr -w false -ci true -sn "bend_lower_3y" -ln "bend_lower_3y" -at "float" -p "bend_lower_3";
	addAttr -w false -ci true -sn "bend_lower_3z" -ln "bend_lower_3z" -at "float" -p "bend_lower_3";
	addAttr -r false -ci true -k true -sn "global_scale" -ln "global_scale" -at "float";
	addAttr -r false -ci true -k true -sn "start_matrix" -ln "start_matrix" -at "fltMatrix";
	addAttr -r false -ci true -k true -sn "middle_matrix" -ln "middle_matrix" -at "fltMatrix";
	addAttr -r false -ci true -k true -sn "end_matrix" -ln "end_matrix" -at "fltMatrix";
	addAttr -r false -ci true -k true -sn "smooth_mode" -ln "smooth_mode" -at "float";
	addAttr -r false -ci true -k true -sn "middle_bend" -ln "middle_bend" -at "float";
	addAttr -w false -ci true -sn "main_bend_center" -ln "main_bend_center" -at "float3" 
		-nc 3;
	addAttr -w false -ci true -sn "main_bend_centerx" -ln "main_bend_centerx" -at "float" 
		-p "main_bend_center";
	addAttr -w false -ci true -sn "main_bend_centery" -ln "main_bend_centery" -at "float" 
		-p "main_bend_center";
	addAttr -w false -ci true -sn "main_bend_centerz" -ln "main_bend_centerz" -at "float" 
		-p "main_bend_center";
	addAttr -r false -ci true -k true -sn "radius" -ln "radius" -at "float";
	addAttr -w false -ci true -sn "corner_wide" -ln "corner_wide" -at "float";
	addAttr -w false -ci true -sn "corner_wide_negated" -ln "corner_wide_negated" -at "float";
	addAttr -r false -ci true -k true -sn "in_upper_bend" -ln "in_upper_bend" -at "float3" 
		-nc 3;
	addAttr -r false -ci true -k true -sn "in_upper_bendx" -ln "in_upper_bendx" -at "float" 
		-p "in_upper_bend";
	addAttr -r false -ci true -k true -sn "in_upper_bendy" -ln "in_upper_bendy" -at "float" 
		-p "in_upper_bend";
	addAttr -r false -ci true -k true -sn "in_upper_bendz" -ln "in_upper_bendz" -at "float" 
		-p "in_upper_bend";
	addAttr -r false -ci true -k true -sn "in_lower_bend" -ln "in_lower_bend" -at "float3" 
		-nc 3;
	addAttr -r false -ci true -k true -sn "in_lower_bendx" -ln "in_lower_bendx" -at "float" 
		-p "in_lower_bend";
	addAttr -r false -ci true -k true -sn "in_lower_bendy" -ln "in_lower_bendy" -at "float" 
		-p "in_lower_bend";
	addAttr -r false -ci true -k true -sn "in_lower_bendz" -ln "in_lower_bendz" -at "float" 
		-p "in_lower_bend";
	addAttr -w false -ci true -sn "out_lower_slide_1" -ln "out_lower_slide_1" -at "float";
	addAttr -w false -ci true -sn "out_lower_slide_2" -ln "out_lower_slide_2" -at "float";
	addAttr -w false -ci true -sn "out_lower_slide_3" -ln "out_lower_slide_3" -at "float";
	addAttr -w false -ci true -sn "out_upper_slide_1" -ln "out_upper_slide_1" -at "float";
	addAttr -w false -ci true -sn "out_upper_slide_2" -ln "out_upper_slide_2" -at "float";
	addAttr -w false -ci true -sn "out_upper_slide_3" -ln "out_upper_slide_3" -at "float";
	addAttr -w false -ci true -sn "corner_wide_out" -ln "corner_wide_out" -at "float";
	addAttr -r false -ci true -k true -sn "sharp_corner" -ln "sharp_corner" -min 0 -max 
		1 -at "bool";
	addAttr -r false -ci true -k true -sn "startWeight" -ln "startWeight" -at "float";
	addAttr -r false -ci true -k true -sn "endWeight" -ln "endWeight" -at "float";
	addAttr -r false -ci true -k true -sn "init_length" -ln "init_length" -at "float";
	addAttr -w false -ci true -sn "Core__Graph__terminal__diagnostic" -ln "Core__Graph__terminal__diagnostic" 
		-ct "terminal_node_output_attribute" -dt "bifData";
	addAttr -r false -ci true -k true -sn "JobPorts__Math_epsilonFloat" -ln "JobPorts__Math_epsilonFloat" 
		-at "float";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\n    \"header\": {\n        \"metadata\": [\n            {\n                \"metaName\": \"adskFileFormatVersion\",\n                \"metaValue\": \"100L\"\n            }\n        ]\n    },\n    \"namespaces\": [],\n    \"types\": [],\n    \"compounds\": [\n        {\n            \"name\": \"bifrostGraphShape\",\n            \"metadata\": [\n                {\n                    \"metaName\": \"io_nodes\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_inodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"input\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1703.83 815.456\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"angle\"\n                                                },\n                                                {\n                                                    \"metaName\": \"global_scale\"\n                                                },\n                                                {\n                                                    \"metaName\": \"start_matrix\"\n                                                },\n                                                {\n                                                    \"metaName\": \"middle_matrix\"\n                                                },\n"
		+ "                                                {\n                                                    \"metaName\": \"end_matrix\"\n                                                },\n                                                {\n                                                    \"metaName\": \"middle_bend\"\n                                                },\n                                                {\n                                                    \"metaName\": \"smooth_mode\"\n                                                },\n                                                {\n                                                    \"metaName\": \"radius\"\n                                                },\n                                                {\n                                                    \"metaName\": \"sharp_corner\"\n                                                },\n                                                {\n                                                    \"metaName\": \"startWeight\"\n                                                },\n"
		+ "                                                {\n                                                    \"metaName\": \"endWeight\"\n                                                },\n                                                {\n                                                    \"metaName\": \"init_length\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"input1\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-948.189 1803.1\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"in_upper_bend\"\n                                                },\n                                                {\n                                                    \"metaName\": \"in_lower_bend\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"io_onodes\",\n                            \"metadata\": [\n"
		+ "                                {\n                                    \"metaName\": \"output\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"520.112 401.022\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"main_bend_upper\"\n                                                },\n"
		+ "                                                {\n                                                    \"metaName\": \"main_bend_lower\"\n                                                },\n                                                {\n                                                    \"metaName\": \"main_bend_center\"\n                                                },\n                                                {\n                                                    \"metaName\": \"corner_wide\"\n                                                },\n                                                {\n                                                    \"metaName\": \"corner_wide_out\"\n                                                },\n                                                {\n                                                    \"metaName\": \"corner_wide_negated\"\n                                                },\n                                                {\n                                                    \"metaName\": \"out_lower_slide_1\"\n"
		+ "                                                },\n                                                {\n                                                    \"metaName\": \"out_lower_slide_2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"out_lower_slide_3\"\n                                                },\n                                                {\n                                                    \"metaName\": \"out_upper_slide_1\"\n                                                },\n                                                {\n                                                    \"metaName\": \"out_upper_slide_2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"out_upper_slide_3\"\n                                                }\n                                            ]\n                                        }\n"
		+ "                                    ]\n                                },\n                                {\n                                    \"metaName\": \"output1\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"314.438 1318.6\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"bend_lower_1\"\n"
		+ "                                                },\n                                                {\n                                                    \"metaName\": \"bend_lower_2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"bend_lower_3\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"output2\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n"
		+ "                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"295.2 1805.29\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"bend_upper_1\"\n                                                },\n                                                {\n                                                    \"metaName\": \"bend_upper_2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"bend_upper_3\"\n                                                }\n                                            ]\n                                        }\n"
		+ "                                    ]\n                                }\n                            ]\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"backdrop3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"type\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"backdrop\"\n                        },\n                        {\n                            \"metaName\": \"title\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"Upper bend\"\n                        },\n                        {\n                            \"metaName\": \"coords\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-637.167 3283.59 2214.29 1111.97\"\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n"
		+ "                    \"metaValue\": \"BifrostGraph,User::Compounds,print\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Constants,float\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Math,lerp\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Logic,if\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::FCurve,evaluate_fcurve\"\n                },\n                {\n                    \"metaName\": \"internal\",\n                    \"metaValue\": \"true\"\n                },\n                {\n                    \"metaName\": \"ViewportRect\",\n"
		+ "                    \"metaType\": \"string\",\n                    \"metaValue\": \"-1821.69 594.261 1141.66 1441.22\"\n                }\n            ],\n            \"ports\": [\n                {\n                    \"portName\": \"angle\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"main_bend_upper\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"main_bend_lower\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"main_bend_center\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"bend_upper_1\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n"
		+ "                },\n                {\n                    \"portName\": \"bend_upper_2\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"bend_upper_3\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"bend_lower_1\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"bend_lower_2\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"bend_lower_3\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"global_scale\",\n                    \"portDirection\": \"input\",\n"
		+ "                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"start_matrix\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float4x4\"\n                },\n                {\n                    \"portName\": \"middle_matrix\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float4x4\"\n                },\n                {\n                    \"portName\": \"end_matrix\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float4x4\"\n                },\n                {\n                    \"portName\": \"middle_bend\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"smooth_mode\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"radius\",\n                    \"portDirection\": \"input\",\n"
		+ "                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"corner_wide\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"corner_wide_out\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"corner_wide_negated\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"in_upper_bend\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"in_lower_bend\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float3\"\n                },\n                {\n                    \"portName\": \"out_lower_slide_1\",\n                    \"portDirection\": \"output\",\n"
		+ "                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"out_lower_slide_2\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"out_lower_slide_3\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"out_upper_slide_1\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"out_upper_slide_2\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"out_upper_slide_3\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"sharp_corner\",\n                    \"portDirection\": \"input\",\n"
		+ "                    \"portType\": \"bool\"\n                },\n                {\n                    \"portName\": \"startWeight\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"endWeight\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"init_length\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                }\n            ],\n            \"compounds\": [\n                {\n                    \"name\": \"bend_driver\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n"
		+ "                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-816.5 12.5\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"middle_bend\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"smooth_mode\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"angle\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n"
		+ "                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"246.5 -7.5\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"output\"\n                                                        }\n"
		+ "                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-645 -564 1290 1129\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"middle_bend\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"smooth_mode\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n"
		+ "                            \"portName\": \"angle\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"output\",\n                            \"portDirection\": \"output\"\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"lerp\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-434.413 365.784\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"angle\",\n                                \"output1\",\n                                \"interpolated\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-112.3 24.7709\"\n                                }\n                            ]\n                        },\n"
		+ "                        {\n                            \"nodeName\": \"value\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-423.25 153.241\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \".middle_bend\",\n                            \"target\": \"lerp.first\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"lerp.fraction\"\n"
		+ "                        },\n                        {\n                            \"source\": \"lerp.interpolated\",\n                            \"target\": \"multiply.first.interpolated\"\n                        },\n                        {\n                            \"source\": \".angle\",\n                            \"target\": \"multiply.first.angle\"\n                        },\n                        {\n                            \"source\": \"value.output\",\n                            \"target\": \"multiply.first.output1\"\n                        },\n                        {\n                            \"source\": \"multiply.output\",\n                            \"target\": \".output\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n                            \"valueName\": \"lerp.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1f\"\n                        },\n                        {\n                            \"valueName\": \"value.value\",\n"
		+ "                            \"valueType\": \"float\",\n                            \"value\": \"0.00499999989f\"\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        },\n                        {\n                            \"name\": \"output\"\n                        }\n                    ]\n                },\n                {\n                    \"name\": \"main_bend_controls\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-235.436 -194.811\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"upper_length\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lower_length\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"output\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n"
		+ "                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1337.01 -33.6157\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"vector3\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"vector4\"\n                                                        },\n"
		+ "                                                        {\n                                                            \"metaName\": \"vector5\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"233 -547 1278 1129\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"vector3\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"vector4\",\n"
		+ "                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"vector5\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"upper_length\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"lower_length\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"output\",\n                            \"portDirection\": \"input\"\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"half_of\",\n                            \"nodeType\": \"Core::Math::half_of\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"241.71 -487.155\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"half_of1\",\n                            \"nodeType\": \"Core::Math::half_of\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"149.192 64.7587\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate1\",\n                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"487.755 18.4432\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"scalar_to_vector3\",\n                            \"nodeType\": \"Core::Conversion::scalar_to_vector3\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"919.558 -291.881\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"scalar_to_vector4\",\n                            \"nodeType\": \"Core::Conversion::scalar_to_vector3\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n"
		+ "                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"914.555 87.4782\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"scalar_to_vector5\",\n                            \"nodeType\": \"Core::Conversion::scalar_to_vector3\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"901.304 383.138\"\n                                }\n                            ]\n"
		+ "                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \"half_of.half_value\",\n                            \"target\": \"scalar_to_vector3.x\"\n                        },\n                        {\n                            \"source\": \"half_of1.half_value\",\n                            \"target\": \"negate1.value\"\n                        },\n                        {\n                            \"source\": \"negate1.negated\",\n                            \"target\": \"scalar_to_vector4.x\"\n                        },\n                        {\n                            \"source\": \".output\",\n                            \"target\": \"scalar_to_vector3.z\"\n                        },\n                        {\n                            \"source\": \"scalar_to_vector3.vector3\",\n                            \"target\": \".vector3\"\n                        },\n                        {\n                            \"source\": \".output\",\n                            \"target\": \"scalar_to_vector4.z\"\n"
		+ "                        },\n                        {\n                            \"source\": \"scalar_to_vector4.vector3\",\n                            \"target\": \".vector4\"\n                        },\n                        {\n                            \"source\": \".output\",\n                            \"target\": \"scalar_to_vector5.z\"\n                        },\n                        {\n                            \"source\": \"scalar_to_vector5.vector3\",\n                            \"target\": \".vector5\"\n                        },\n                        {\n                            \"source\": \".upper_length\",\n                            \"target\": \"half_of.value\"\n                        },\n                        {\n                            \"source\": \".lower_length\",\n                            \"target\": \"half_of1.value\"\n                        }\n                    ],\n                    \"values\": [],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        },\n"
		+ "                        {\n                            \"name\": \"output\"\n                        }\n                    ]\n                },\n                {\n                    \"name\": \"Corner_wide\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n"
		+ "                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"radius\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"smooth_mode\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"upper_length\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lower_length\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"angle\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"small_radius\"\n                                                        }\n                                                    ]\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-1431.75 163.76\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n"
		+ "                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"corner_wide\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"corner_wide_out\"\n                                                        },\n"
		+ "                                                        {\n                                                            \"metaName\": \"negated\"\n                                                        }\n                                                    ]\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1538.75 -215.189\"\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"output1\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n"
		+ "                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"lower_slide_1\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lower_slide_2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lower_slide_3\"\n                                                        }\n                                                    ]\n                                                },\n"
		+ "                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1646.41 468.487\"\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"output2\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1727.63 1380.7\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"upper_slide_1\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"upper_slide_2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"upper_slide_3\"\n                                                        }\n                                                    ]\n"
		+ "                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,clamp\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,multiply\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,negate\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,half_of\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,subtract\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1526.02 -374.334 1206.06 1522.51\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"corner_wide\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n"
		+ "                        {\n                            \"portName\": \"smooth_mode\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"corner_wide_out\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"negated\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"upper_length\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"lower_length\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"lower_slide_1\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n"
		+ "                            \"portName\": \"angle\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"lower_slide_2\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"lower_slide_3\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"upper_slide_1\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"upper_slide_2\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"upper_slide_3\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"small_radius\",\n"
		+ "                            \"portDirection\": \"input\",\n                            \"portType\": \"bool\"\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"half_of2\",\n                            \"nodeType\": \"Core::Math::half_of\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-152.121 106.766\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp1\",\n                            \"nodeType\": \"Core::Math::lerp\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-714.308 166.341\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate\",\n                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n"
		+ "                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"674 114\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"change_range\",\n                            \"nodeType\": \"Core::Math::change_range\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-268.431 -428.68\"\n                                }\n                            ]\n                        },\n                        {\n"
		+ "                            \"nodeName\": \"multiply\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"interpolated\",\n                                \"negated\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"293 530\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate1\",\n                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n"
		+ "                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-309.973 819.504\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-132.564 324.051\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply1\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"half_value\",\n                                \"result\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"374.646 -484.578\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"if\",\n                            \"nodeType\": \"Core::Logic::if\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-481.223 469.959\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply2\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n"
		+ "                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"695.144 629.332\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n"
		+ "                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"359.088 806.663\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply3\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"half_value\",\n                                \"result\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"302.864 129.425\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate2\",\n                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"742.912 1202.83\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate3\",\n"
		+ "                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"1019.83 1363.62\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate4\",\n                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n"
		+ "                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"1300.81 1589.28\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply4\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"interpolated\",\n                                \"negated\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"256.831 1214.62\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value1\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"251.185 1519.71\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply5\",\n                            \"nodeType\": \"Core::Math::multiply\",\n"
		+ "                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"605.831 1379.62\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"negate5\",\n                            \"nodeType\": \"Core::Math::negate\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-297 1105\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply6\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n"
		+ "                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"630.866 -145.458\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value2\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"299.984 -164.603\"\n                                }\n                            ]\n                        },\n"
		+ "                        {\n                            \"nodeName\": \"multiply7\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"1193.1 671.634\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value3\",\n                            \"valueType\": \"float\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"777.459 928.131\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply8\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"983.174 1707.35\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value4\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"662.551 1935.28\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"if1\",\n                            \"nodeType\": \"Core::Logic::if\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-455.432 -49.3979\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"clamp\",\n                            \"nodeType\": \"Core::Math::clamp\",\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1067.43 -47.3631\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"lerp1.fraction\"\n                        },\n                        {\n                            \"source\": \"negate.negated\",\n                            \"target\": \".negated\"\n                        },\n                        {\n                            \"source\": \".lower_length\",\n                            \"target\": \"negate1.value\"\n"
		+ "                        },\n                        {\n                            \"source\": \"lerp.interpolated\",\n                            \"target\": \"multiply.first.interpolated\"\n                        },\n                        {\n                            \"source\": \".angle\",\n                            \"target\": \"change_range.value\"\n                        },\n                        {\n                            \"source\": \"lerp1.interpolated\",\n                            \"target\": \"if.true_case\"\n                        },\n                        {\n                            \"source\": \"multiply.output\",\n                            \"target\": \"multiply2.first.output1\"\n                        },\n                        {\n                            \"source\": \"value.output\",\n                            \"target\": \"multiply2.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply3.output\",\n                            \"target\": \"negate.value\"\n                        },\n"
		+ "                        {\n                            \"source\": \"negate2.negated\",\n                            \"target\": \".upper_slide_1\"\n                        },\n                        {\n                            \"source\": \"negate3.negated\",\n                            \"target\": \".upper_slide_2\"\n                        },\n                        {\n                            \"source\": \"negate4.negated\",\n                            \"target\": \".upper_slide_3\"\n                        },\n                        {\n                            \"source\": \"multiply4.output\",\n                            \"target\": \"multiply5.first.output1\"\n                        },\n                        {\n                            \"source\": \"value1.output\",\n                            \"target\": \"multiply5.first.output2\"\n                        },\n                        {\n                            \"source\": \"lerp.interpolated\",\n                            \"target\": \"multiply4.first.interpolated\"\n                        },\n                        {\n"
		+ "                            \"source\": \".upper_length\",\n                            \"target\": \"negate5.value\"\n                        },\n                        {\n                            \"source\": \"negate5.negated\",\n                            \"target\": \"multiply4.first.negated\"\n                        },\n                        {\n                            \"source\": \"multiply4.output\",\n                            \"target\": \"negate2.value\"\n                        },\n                        {\n                            \"source\": \"multiply5.output\",\n                            \"target\": \"negate3.value\"\n                        },\n                        {\n                            \"source\": \"multiply6.output\",\n                            \"target\": \".corner_wide_out\"\n                        },\n                        {\n                            \"source\": \"value2.output\",\n                            \"target\": \"multiply6.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply3.output\",\n"
		+ "                            \"target\": \"multiply6.first.output1\"\n                        },\n                        {\n                            \"source\": \"value3.output\",\n                            \"target\": \"multiply7.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply2.output\",\n                            \"target\": \"multiply7.first.output1\"\n                        },\n                        {\n                            \"source\": \"value4.output\",\n                            \"target\": \"multiply8.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply5.output\",\n                            \"target\": \"multiply8.first.output1\"\n                        },\n                        {\n                            \"source\": \"multiply8.output\",\n                            \"target\": \"negate4.value\"\n                        },\n                        {\n                            \"source\": \"multiply7.output\",\n"
		+ "                            \"target\": \".lower_slide_3\"\n                        },\n                        {\n                            \"source\": \"multiply2.output\",\n                            \"target\": \".lower_slide_2\"\n                        },\n                        {\n                            \"source\": \"multiply.output\",\n                            \"target\": \".lower_slide_1\"\n                        },\n                        {\n                            \"source\": \".small_radius\",\n                            \"target\": \"if.condition\"\n                        },\n                        {\n                            \"source\": \"if.output\",\n                            \"target\": \"lerp.fraction\"\n                        },\n                        {\n                            \"source\": \"negate1.negated\",\n                            \"target\": \"multiply.first.negated\"\n                        },\n                        {\n                            \"source\": \".small_radius\",\n                            \"target\": \"if1.condition\"\n"
		+ "                        },\n                        {\n                            \"source\": \"lerp1.interpolated\",\n                            \"target\": \"if1.true_case\"\n                        },\n                        {\n                            \"source\": \"if1.output\",\n                            \"target\": \"half_of2.value\"\n                        },\n                        {\n                            \"source\": \"multiply1.output\",\n                            \"target\": \".corner_wide\"\n                        },\n                        {\n                            \"source\": \"change_range.result\",\n                            \"target\": \"multiply1.first.result\"\n                        },\n                        {\n                            \"source\": \"half_of2.half_value\",\n                            \"target\": \"multiply1.first.half_value\"\n                        },\n                        {\n                            \"source\": \"change_range.result\",\n                            \"target\": \"multiply3.first.result\"\n"
		+ "                        },\n                        {\n                            \"source\": \"half_of2.half_value\",\n                            \"target\": \"multiply3.first.half_value\"\n                        },\n                        {\n                            \"source\": \".radius\",\n                            \"target\": \"clamp.value\"\n                        },\n                        {\n                            \"source\": \"clamp.clamped\",\n                            \"target\": \"lerp1.first\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n                            \"valueName\": \"lerp1.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"change_range.from_end\",\n                            \"valueType\": \"float\",\n                            \"value\": \"-160f\"\n                        },\n                        {\n                            \"valueName\": \"change_range.to_end\",\n"
		+ "                            \"valueType\": \"float\",\n                            \"value\": \"1f\"\n                        },\n                        {\n                            \"valueName\": \"lerp.first\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1f\"\n                        },\n                        {\n                            \"valueName\": \"lerp.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.949999988f\"\n                        },\n                        {\n                            \"valueName\": \"if.false_case\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1.5f\"\n                        },\n                        {\n                            \"valueName\": \"value.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.600000024f\"\n                        },\n                        {\n                            \"valueName\": \"value1.value\",\n"
		+ "                            \"valueType\": \"float\",\n                            \"value\": \"0.600000024f\"\n                        },\n                        {\n                            \"valueName\": \"value2.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"-0.222800002f\"\n                        },\n                        {\n                            \"valueName\": \"value3.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.330000013f\"\n                        },\n                        {\n                            \"valueName\": \"value4.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.330000013f\"\n                        },\n                        {\n                            \"valueName\": \"if1.false_case\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"clamp.min\",\n"
		+ "                            \"valueType\": \"float\",\n                            \"value\": \"0.00999999978f\"\n                        },\n                        {\n                            \"valueName\": \"clamp.max\",\n                            \"valueType\": \"float\",\n                            \"value\": \"10f\"\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        },\n                        {\n                            \"name\": \"output\"\n                        },\n                        {\n                            \"name\": \"output1\"\n                        },\n                        {\n                            \"name\": \"output2\"\n                        }\n                    ]\n                },\n                {\n                    \"name\": \"length\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n"
		+ "                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-769.585 -111.771\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n"
		+ "                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"global_scale\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"start_matrix\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"middle_matrix\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"end_matrix\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n"
		+ "                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"990.5 -23.5\"\n"
		+ "                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"upper_length\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lower_length\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"-625 -521 1278 1129\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"global_scale\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"start_matrix\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float4x4\"\n                        },\n                        {\n                            \"portName\": \"middle_matrix\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float4x4\"\n                        },\n                        {\n                            \"portName\": \"end_matrix\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float4x4\"\n"
		+ "                        },\n                        {\n                            \"portName\": \"upper_length\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"lower_length\",\n                            \"portDirection\": \"output\"\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"divide\",\n                            \"nodeType\": \"Core::Math::divide\",\n                            \"multiInPortNames\": [\n                                \"length\",\n                                \"global_scale\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n"
		+ "                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"598.412 -179.325\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"divide1\",\n                            \"nodeType\": \"Core::Math::divide\",\n                            \"multiInPortNames\": [\n                                \"length\",\n                                \"global_scale\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"584.387 156.601\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"matrix_to_SRT\",\n                            \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-306.626 -384.889\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"matrix_to_SRT1\",\n                            \"nodeType\": \"Core::Math::matrix_to_SRT\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-306.646 -110.548\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"matrix_to_SRT2\",\n                            \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n"
		+ "                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-321.028 181.216\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"subtract\",\n                            \"nodeType\": \"Core::Math::subtract\",\n                            \"multiInPortNames\": [\n                                \"vector_a\",\n                                \"vector_b\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"4.5 -277\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"subtract1\",\n                            \"nodeType\": \"Core::Math::subtract\",\n                            \"multiInPortNames\": [\n                                \"vector_a\",\n                                \"vector_b\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"41.1763 102.94\"\n                                }\n                            ]\n"
		+ "                        },\n                        {\n                            \"nodeName\": \"vector_length\",\n                            \"nodeType\": \"Core::Math::length\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"261.5 -259\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"vector_length1\",\n                            \"nodeType\": \"Core::Math::length\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"298.175 120.94\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \"divide.output\",\n                            \"target\": \".upper_length\"\n                        },\n                        {\n                            \"source\": \"divide1.output\",\n                            \"target\": \".lower_length\"\n                        },\n                        {\n                            \"source\": \"matrix_to_SRT.translation\",\n                            \"target\": \"subtract.first.vector_a\"\n                        },\n                        {\n"
		+ "                            \"source\": \"matrix_to_SRT1.translation\",\n                            \"target\": \"subtract.first.vector_b\"\n                        },\n                        {\n                            \"source\": \"matrix_to_SRT1.translation\",\n                            \"target\": \"subtract1.first.vector_b\"\n                        },\n                        {\n                            \"source\": \"matrix_to_SRT2.translation\",\n                            \"target\": \"subtract1.first.vector_a\"\n                        },\n                        {\n                            \"source\": \"subtract.output\",\n                            \"target\": \"vector_length.vector\"\n                        },\n                        {\n                            \"source\": \"subtract1.output\",\n                            \"target\": \"vector_length1.vector\"\n                        },\n                        {\n                            \"source\": \"vector_length.length\",\n                            \"target\": \"divide.first.length\"\n                        },\n"
		+ "                        {\n                            \"source\": \"vector_length1.length\",\n                            \"target\": \"divide1.first.length\"\n                        },\n                        {\n                            \"source\": \".global_scale\",\n                            \"target\": \"divide.first.global_scale\"\n                        },\n                        {\n                            \"source\": \".global_scale\",\n                            \"target\": \"divide1.first.global_scale\"\n                        },\n                        {\n                            \"source\": \".start_matrix\",\n                            \"target\": \"matrix_to_SRT.transform\"\n                        },\n                        {\n                            \"source\": \".middle_matrix\",\n                            \"target\": \"matrix_to_SRT1.transform\"\n                        },\n                        {\n                            \"source\": \".end_matrix\",\n                            \"target\": \"matrix_to_SRT2.transform\"\n                        }\n"
		+ "                    ],\n                    \"values\": [],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        },\n                        {\n                            \"name\": \"output\"\n                        }\n                    ]\n                },\n                {\n                    \"name\": \"lower_bend\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n"
		+ "                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-1825 11\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"driver_control\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"radius\"\n                                                        },\n"
		+ "                                                        {\n                                                            \"metaName\": \"smooth_mode\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"bend_driver\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"sharp_corner\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"endWeight\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n"
		+ "                                },\n                                {\n                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"bend_lower_1\"\n                                                        },\n"
		+ "                                                        {\n                                                            \"metaName\": \"bend_lower_2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"bend_lower_3\"\n                                                        }\n                                                    ]\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"944 -81\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n"
		+ "                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Logic,if\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,add\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Constants,float\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,multiply\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::FCurve,evaluate_fcurve\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-596 -874 1291 1129\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"driver_control\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float3\"\n                        },\n                        {\n                            \"portName\": \"radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"bend_lower_1\",\n                            \"portDirection\": \"output\"\n                        },\n"
		+ "                        {\n                            \"portName\": \"bend_lower_2\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"bend_lower_3\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"smooth_mode\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"bend_driver\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"sharp_corner\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"bool\"\n                        },\n                        {\n                            \"portName\": \"endWeight\",\n                            \"portDirection\": \"input\"\n"
		+ "                        }\n                    ],\n                    \"compounds\": [\n                        {\n                            \"name\": \"reverse\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"ViewportRect\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-416.398 -290.859 883.582 1053.39\"\n                                },\n                                {\n                                    \"metaName\": \"io_nodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"io_inodes\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"input\",\n                                                    \"metadata\": [\n                                                        {\n"
		+ "                                                            \"metaName\": \"DisplayMode\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"LayoutPos\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"-449.5 -60.5\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"io_ports\",\n                                                            \"metadata\": [\n                                                                {\n                                                                    \"metaName\": \"smooth_mode\"\n"
		+ "                                                                }\n                                                            ]\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"io_onodes\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"output\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"DisplayMode\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"2\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"LayoutPos\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"232.031 -35.3081\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"io_ports\",\n                                                            \"metadata\": [\n                                                                {\n                                                                    \"metaName\": \"output\"\n                                                                }\n                                                            ]\n                                                        }\n                                                    ]\n"
		+ "                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ],\n                            \"ports\": [\n                                {\n                                    \"portName\": \"smooth_mode\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"float\"\n                                },\n                                {\n                                    \"portName\": \"output\",\n                                    \"portDirection\": \"output\"\n                                }\n                            ],\n                            \"compoundNodes\": [\n                                {\n                                    \"nodeName\": \"subtract\",\n                                    \"nodeType\": \"Core::Math::subtract\",\n                                    \"multiInPortNames\": [\n                                        \"smooth_mode\",\n"
		+ "                                        \"smooth_mode1\"\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-78.4274 63.9027\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"value4\",\n                                    \"valueType\": \"float\",\n                                    \"metadata\": [\n                                        {\n"
		+ "                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-391.242 77.7226\"\n                                        }\n                                    ]\n                                }\n                            ],\n                            \"connections\": [\n                                {\n                                    \"source\": \"subtract.output\",\n                                    \"target\": \".output\"\n                                },\n                                {\n                                    \"source\": \"value4.output\",\n                                    \"target\": \"subtract.first.smooth_mode\"\n"
		+ "                                },\n                                {\n                                    \"source\": \".smooth_mode\",\n                                    \"target\": \"subtract.first.smooth_mode1\"\n                                }\n                            ],\n                            \"values\": [\n                                {\n                                    \"valueName\": \"value4.value\",\n                                    \"valueType\": \"float\",\n                                    \"value\": \"1f\"\n                                }\n                            ],\n                            \"reservedNodeNames\": [\n                                {\n                                    \"name\": \"input\"\n                                },\n                                {\n                                    \"name\": \"output\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"evaluate_fcurve\",\n"
		+ "                            \"nodeType\": \"Core::FCurve::evaluate_fcurve\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-447 -328\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply2\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"56 454\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply3\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"corners_auto_bend\",\n                                \"output1\",\n                                \"radius\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"193 -381\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"scalar_to_vector3\",\n                            \"nodeType\": \"Core::Conversion::scalar_to_vector3\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1264 -286\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value7\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-287 -546\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp1\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1153 369\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"if\",\n                            \"nodeType\": \"Core::Logic::if\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-95 -118\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp2\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-360 32\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"clamp\",\n                            \"nodeType\": \"Core::Math::clamp\",\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1478 457\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"-432.349 616.166\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"reverse\",\n                            \"nodeType\": \"reverse\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-812 271\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"add\",\n                            \"nodeType\": \"Core::Math::add\",\n                            \"multiInPortNames\": [\n"
		+ "                                \"in_lower_bend\",\n                                \"output1\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-859 -171\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply1\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n"
		+ "                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-345 292\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-342 730\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"add1\",\n                            \"nodeType\": \"Core::Math::add\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"512 -354\"\n                                }\n"
		+ "                            ]\n                        },\n                        {\n                            \"nodeName\": \"if1\",\n                            \"nodeType\": \"Core::Logic::if\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"207.775 -685.994\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \"multiply2.output\",\n                            \"target\": \".bend_lower_3\"\n                        },\n                        {\n"
		+ "                            \"source\": \"value7.output\",\n                            \"target\": \"multiply3.first.output1\"\n                        },\n                        {\n                            \"source\": \"lerp1.interpolated\",\n                            \"target\": \"evaluate_fcurve.x\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"lerp1.fraction\"\n                        },\n                        {\n                            \"source\": \".sharp_corner\",\n                            \"target\": \"if.condition\"\n                        },\n                        {\n                            \"source\": \"if.output\",\n                            \"target\": \"multiply3.first.radius\"\n                        },\n                        {\n                            \"source\": \"evaluate_fcurve.y\",\n                            \"target\": \"if.true_case\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n"
		+ "                            \"target\": \"lerp2.fraction\"\n                        },\n                        {\n                            \"source\": \"lerp2.interpolated\",\n                            \"target\": \"if.false_case\"\n                        },\n                        {\n                            \"source\": \".radius\",\n                            \"target\": \"clamp.value\"\n                        },\n                        {\n                            \"source\": \"clamp.clamped\",\n                            \"target\": \"lerp1.first\"\n                        },\n                        {\n                            \"source\": \".bend_driver\",\n                            \"target\": \"scalar_to_vector3.z\"\n                        },\n                        {\n                            \"source\": \".driver_control\",\n                            \"target\": \"add.first.in_lower_bend\"\n                        },\n                        {\n                            \"source\": \"scalar_to_vector3.vector3\",\n                            \"target\": \"add.first.output1\"\n"
		+ "                        },\n                        {\n                            \"source\": \"add.output\",\n                            \"target\": \"multiply1.first.output1\"\n                        },\n                        {\n                            \"source\": \"add.output\",\n                            \"target\": \"multiply3.first.corners_auto_bend\"\n                        },\n                        {\n                            \"source\": \"reverse.output\",\n                            \"target\": \"multiply1.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply1.output\",\n                            \"target\": \".bend_lower_2\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"reverse.smooth_mode\"\n                        },\n                        {\n                            \"source\": \"multiply1.output\",\n                            \"target\": \"multiply2.first.output1\"\n"
		+ "                        },\n                        {\n                            \"source\": \".endWeight\",\n                            \"target\": \"lerp.fraction\"\n                        },\n                        {\n                            \"source\": \"lerp.interpolated\",\n                            \"target\": \"multiply2.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply3.output\",\n                            \"target\": \"add1.first.output1\"\n                        },\n                        {\n                            \"source\": \"add1.output\",\n                            \"target\": \".bend_lower_1\"\n                        },\n                        {\n                            \"source\": \".sharp_corner\",\n                            \"target\": \"if1.condition\"\n                        },\n                        {\n                            \"source\": \"if1.output\",\n                            \"target\": \"add1.first.output2\"\n                        }\n                    ],\n"
		+ "                    \"values\": [\n                        {\n                            \"valueName\": \"evaluate_fcurve.fcurve\",\n                            \"valueType\": \"Math::FCurve\",\n                            \"value\": {\n                                \"version\": \"1\",\n                                \"preExtrapolation\": \"0\",\n                                \"postExtrapolation\": \"0\",\n                                \"points\": [\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"-0.00041800000000000002\",\n                                                \"yp\": \"-0.59193499999999999\",\n                                                \"x\": \"0\",\n                                                \"y\": \"0\",\n                                                \"xn\": \"0.00041800000000000002\",\n"
		+ "                                                \"yn\": \"0.59193499999999999\"\n                                            }\n                                        }\n                                    },\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"0.59999999999999998\",\n                                                \"yp\": \"1\",\n                                                \"x\": \"1\",\n                                                \"y\": \"1\",\n                                                \"xn\": \"1.3999999999999999\",\n                                                \"yn\": \"1\"\n                                            }\n                                        }\n                                    }\n                                ]\n                            }\n"
		+ "                        },\n                        {\n                            \"valueName\": \"value7.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.5f\"\n                        },\n                        {\n                            \"valueName\": \"lerp1.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"if.true_case\",\n                            \"valueType\": \"float\",\n                            \"value\": \"3.4000001f\"\n                        },\n                        {\n                            \"valueName\": \"if.false_case\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1.39999998f\"\n                        },\n                        {\n                            \"valueName\": \"lerp2.first\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1.39999998f\"\n"
		+ "                        },\n                        {\n                            \"valueName\": \"lerp2.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"clamp.min\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.00999999978f\"\n                        },\n                        {\n                            \"valueName\": \"clamp.max\",\n                            \"valueType\": \"float\",\n                            \"value\": \"10f\"\n                        },\n                        {\n                            \"valueName\": \"value.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.600000024f\"\n                        },\n                        {\n                            \"valueName\": \"reverse.smooth_mode\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n"
		+ "                        },\n                        {\n                            \"valueName\": \"lerp.first\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"lerp.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.600000024f\"\n                        },\n                        {\n                            \"valueName\": \"if1.true_case\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"if1.false_case\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"-0.100000001f\",\n"
		+ "                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        },\n                        {\n                            \"name\": \"output\"\n                        }\n                    ]\n                },\n                {\n                    \"name\": \"upper_bend\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-1588.18 38.2852\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"driver_control\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"radius\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"smooth_mode\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"bend_driver\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"sharp_corner\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"start_fix\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n"
		+ "                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"bend_upper_1\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"bend_upper_2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"bend_upper_3\"\n                                                        }\n                                                    ]\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"882.157 -68.3\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Logic,greater\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::FCurve,evaluate_fcurve\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Fields,fcurve_field\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Conversion,scalar_to_vector3\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Constants,float\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-561 -791 862 1129\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"driver_control\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float3\"\n                        },\n                        {\n                            \"portName\": \"radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"smooth_mode\",\n"
		+ "                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"bend_driver\",\n                            \"portDirection\": \"input\"\n                        },\n                        {\n                            \"portName\": \"bend_upper_1\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"bend_upper_2\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"sharp_corner\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"bool\"\n                        },\n                        {\n                            \"portName\": \"bend_upper_3\",\n                            \"portDirection\": \"output\"\n                        },\n                        {\n                            \"portName\": \"start_fix\",\n"
		+ "                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        }\n                    ],\n                    \"compounds\": [\n                        {\n                            \"name\": \"reverse\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"ViewportRect\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-416.398 -290.859 883.582 1053.39\"\n                                },\n                                {\n                                    \"metaName\": \"io_nodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"io_inodes\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"input\",\n                                                    \"metadata\": [\n"
		+ "                                                        {\n                                                            \"metaName\": \"DisplayMode\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"LayoutPos\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"-449.5 -60.5\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"io_ports\",\n                                                            \"metadata\": [\n                                                                {\n                                                                    \"metaName\": \"smooth_mode\"\n"
		+ "                                                                }\n                                                            ]\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"io_onodes\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"output\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"DisplayMode\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"2\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"LayoutPos\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"232.031 -35.3081\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"io_ports\",\n                                                            \"metadata\": [\n                                                                {\n                                                                    \"metaName\": \"output\"\n                                                                }\n                                                            ]\n                                                        }\n                                                    ]\n"
		+ "                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ],\n                            \"ports\": [\n                                {\n                                    \"portName\": \"smooth_mode\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"float\"\n                                },\n                                {\n                                    \"portName\": \"output\",\n                                    \"portDirection\": \"output\"\n                                }\n                            ],\n                            \"compoundNodes\": [\n                                {\n                                    \"nodeName\": \"subtract\",\n                                    \"nodeType\": \"Core::Math::subtract\",\n                                    \"multiInPortNames\": [\n                                        \"smooth_mode\",\n"
		+ "                                        \"smooth_mode1\"\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-78.4274 63.9027\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"value4\",\n                                    \"valueType\": \"float\",\n                                    \"metadata\": [\n                                        {\n"
		+ "                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-391.242 77.7226\"\n                                        }\n                                    ]\n                                }\n                            ],\n                            \"connections\": [\n                                {\n                                    \"source\": \"subtract.output\",\n                                    \"target\": \".output\"\n                                },\n                                {\n                                    \"source\": \"value4.output\",\n                                    \"target\": \"subtract.first.smooth_mode\"\n"
		+ "                                },\n                                {\n                                    \"source\": \".smooth_mode\",\n                                    \"target\": \"subtract.first.smooth_mode1\"\n                                }\n                            ],\n                            \"values\": [\n                                {\n                                    \"valueName\": \"value4.value\",\n                                    \"valueType\": \"float\",\n                                    \"value\": \"1f\"\n                                }\n                            ],\n                            \"reservedNodeNames\": [\n                                {\n                                    \"name\": \"input\"\n                                },\n                                {\n                                    \"name\": \"output\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"reverse\",\n"
		+ "                            \"nodeType\": \"reverse\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-899.075 649.68\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"add\",\n                            \"nodeType\": \"Core::Math::add\",\n                            \"multiInPortNames\": [\n                                \"in_lower_bend\",\n                                \"output1\"\n                            ],\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-752.673 -359.702\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"evaluate_fcurve\",\n                            \"nodeType\": \"Core::FCurve::evaluate_fcurve\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-361.266 -133.836\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply1\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-420.924 521.564\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply2\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-48.5443 658.465\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply3\",\n"
		+ "                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"corners_auto_bend\",\n                                \"output1\",\n                                \"radius\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"247.896 -299.814\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"scalar_to_vector3\",\n                            \"nodeType\": \"Core::Conversion::scalar_to_vector3\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1147.34 -234.955\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value7\",\n                            \"valueType\": \"float\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n"
		+ "                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-106.271 -439.454\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp1\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-737.5 -3\"\n                                }\n                            ]\n                        },\n                        {\n"
		+ "                            \"nodeName\": \"if\",\n                            \"nodeType\": \"Core::Logic::if\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-53.5439 -45.433\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp2\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-376.085 137.768\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"clamp\",\n                            \"nodeType\": \"Core::Math::clamp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1061.5 284\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"lerp\",\n                            \"nodeType\": \"Core::Math::lerp\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-399.142 926.98\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"if1\",\n                            \"nodeType\": \"Core::Logic::if\",\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"221.34 -650.77\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"add1\",\n                            \"nodeType\": \"Core::Math::add\",\n                            \"multiInPortNames\": [\n                                \"output1\",\n                                \"output2\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n"
		+ "                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"554.449 -455.112\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \"reverse.output\",\n                            \"target\": \"multiply1.first.output2\"\n                        },\n                        {\n                            \"source\": \"add.output\",\n                            \"target\": \"multiply1.first.output1\"\n                        },\n                        {\n                            \"source\": \"add.output\",\n                            \"target\": \"multiply3.first.corners_auto_bend\"\n                        },\n                        {\n                            \"source\": \"multiply1.output\",\n                            \"target\": \".bend_upper_2\"\n"
		+ "                        },\n                        {\n                            \"source\": \"multiply1.output\",\n                            \"target\": \"multiply2.first.output1\"\n                        },\n                        {\n                            \"source\": \"value7.output\",\n                            \"target\": \"multiply3.first.output1\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"reverse.smooth_mode\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"lerp1.fraction\"\n                        },\n                        {\n                            \"source\": \"lerp1.interpolated\",\n                            \"target\": \"evaluate_fcurve.x\"\n                        },\n                        {\n                            \"source\": \"evaluate_fcurve.y\",\n                            \"target\": \"if.true_case\"\n                        },\n"
		+ "                        {\n                            \"source\": \"if.output\",\n                            \"target\": \"multiply3.first.radius\"\n                        },\n                        {\n                            \"source\": \".sharp_corner\",\n                            \"target\": \"if.condition\"\n                        },\n                        {\n                            \"source\": \".smooth_mode\",\n                            \"target\": \"lerp2.fraction\"\n                        },\n                        {\n                            \"source\": \"lerp2.interpolated\",\n                            \"target\": \"if.false_case\"\n                        },\n                        {\n                            \"source\": \".radius\",\n                            \"target\": \"clamp.value\"\n                        },\n                        {\n                            \"source\": \"clamp.clamped\",\n                            \"target\": \"lerp1.first\"\n                        },\n                        {\n                            \"source\": \".bend_driver\",\n"
		+ "                            \"target\": \"scalar_to_vector3.z\"\n                        },\n                        {\n                            \"source\": \"scalar_to_vector3.vector3\",\n                            \"target\": \"add.first.output1\"\n                        },\n                        {\n                            \"source\": \".driver_control\",\n                            \"target\": \"add.first.in_lower_bend\"\n                        },\n                        {\n                            \"source\": \".start_fix\",\n                            \"target\": \"lerp.fraction\"\n                        },\n                        {\n                            \"source\": \"if1.output\",\n                            \"target\": \"add1.first.output2\"\n                        },\n                        {\n                            \"source\": \"multiply2.output\",\n                            \"target\": \".bend_upper_1\"\n                        },\n                        {\n                            \"source\": \"lerp.interpolated\",\n                            \"target\": \"multiply2.first.output2\"\n"
		+ "                        },\n                        {\n                            \"source\": \"multiply3.output\",\n                            \"target\": \"add1.first.output1\"\n                        },\n                        {\n                            \"source\": \".sharp_corner\",\n                            \"target\": \"if1.condition\"\n                        },\n                        {\n                            \"source\": \"add1.output\",\n                            \"target\": \".bend_upper_3\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n                            \"valueName\": \"reverse.smooth_mode\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"evaluate_fcurve.fcurve\",\n                            \"valueType\": \"Math::FCurve\",\n                            \"value\": {\n                                \"version\": \"1\",\n                                \"preExtrapolation\": \"0\",\n"
		+ "                                \"postExtrapolation\": \"0\",\n                                \"points\": [\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"-0.00041800000000000002\",\n                                                \"yp\": \"-0.59193499999999999\",\n                                                \"x\": \"0\",\n                                                \"y\": \"0\",\n                                                \"xn\": \"0.00041800000000000002\",\n                                                \"yn\": \"0.59193499999999999\"\n                                            }\n                                        }\n                                    },\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n"
		+ "                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"0.59999999999999998\",\n                                                \"yp\": \"1\",\n                                                \"x\": \"1\",\n                                                \"y\": \"1\",\n                                                \"xn\": \"1.3999999999999999\",\n                                                \"yn\": \"1\"\n                                            }\n                                        }\n                                    }\n                                ]\n                            }\n                        },\n                        {\n                            \"valueName\": \"value7.value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.5f\"\n                        },\n                        {\n                            \"valueName\": \"lerp1.second\",\n                            \"valueType\": \"float\",\n"
		+ "                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"if.true_case\",\n                            \"valueType\": \"float\",\n                            \"value\": \"3.4000001f\"\n                        },\n                        {\n                            \"valueName\": \"if.false_case\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1.39999998f\"\n                        },\n                        {\n                            \"valueName\": \"lerp2.first\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1.39999998f\"\n                        },\n                        {\n                            \"valueName\": \"lerp2.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"clamp.min\",\n                            \"valueType\": \"float\",\n"
		+ "                            \"value\": \"0.00999999978f\"\n                        },\n                        {\n                            \"valueName\": \"clamp.max\",\n                            \"valueType\": \"float\",\n                            \"value\": \"10f\"\n                        },\n                        {\n                            \"valueName\": \"lerp.first\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0f\"\n                        },\n                        {\n                            \"valueName\": \"lerp.second\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.600000024f\"\n                        },\n                        {\n                            \"valueName\": \"if1.true_case\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n"
		+ "                        },\n                        {\n                            \"valueName\": \"if1.false_case\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0.100000001f\",\n                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        },\n                        {\n                            \"name\": \"output\"\n                        }\n                    ]\n                }\n            ],\n            \"compoundNodes\": [\n                {\n                    \"nodeName\": \"bend_driver\",\n                    \"nodeType\": \"bend_driver\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-778.697 587.06\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"main_bend_controls\",\n                    \"nodeType\": \"main_bend_controls\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-161.333 103.272\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"Corner_wide\",\n                    \"nodeType\": \"Corner_wide\",\n"
		+ "                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-172.898 603.79\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"length\",\n                    \"nodeType\": \"length\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-777.883 75.1914\"\n                        }\n"
		+ "                    ]\n                },\n                {\n                    \"nodeName\": \"lower_bend\",\n                    \"nodeType\": \"lower_bend\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-201.543 1318.02\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"upper_bend\",\n                    \"nodeType\": \"upper_bend\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"-233.417 1799.62\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"print\",\n                    \"nodeType\": \"User::Compounds::print\",\n                    \"terminalStates\": [\n                        {\n                            \"name\": \"Core::Graph::terminal::final\",\n                            \"enabled\": \"true\"\n                        },\n                        {\n                            \"name\": \"Core::Graph::terminal::proxy\",\n                            \"enabled\": \"true\"\n                        },\n                        {\n                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                            \"enabled\": \"false\"\n                        }\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1354.5 1333.4\"\n                        }\n                    ]\n                }\n            ],\n            \"connections\": [\n                {\n                    \"source\": \".middle_bend\",\n                    \"target\": \"bend_driver.middle_bend\"\n                },\n                {\n                    \"source\": \".smooth_mode\",\n                    \"target\": \"bend_driver.smooth_mode\"\n                },\n                {\n                    \"source\": \".angle\",\n                    \"target\": \"bend_driver.angle\"\n                },\n                {\n                    \"source\": \"bend_driver.output\",\n                    \"target\": \"main_bend_controls.output\"\n                },\n                {\n                    \"source\": \"main_bend_controls.vector3\",\n                    \"target\": \".main_bend_upper\"\n"
		+ "                },\n                {\n                    \"source\": \"main_bend_controls.vector4\",\n                    \"target\": \".main_bend_lower\"\n                },\n                {\n                    \"source\": \"main_bend_controls.vector5\",\n                    \"target\": \".main_bend_center\"\n                },\n                {\n                    \"source\": \"Corner_wide.corner_wide\",\n                    \"target\": \".corner_wide\"\n                },\n                {\n                    \"source\": \".radius\",\n                    \"target\": \"Corner_wide.radius\"\n                },\n                {\n                    \"source\": \".smooth_mode\",\n                    \"target\": \"Corner_wide.smooth_mode\"\n                },\n                {\n                    \"source\": \"Corner_wide.negated\",\n                    \"target\": \".corner_wide_negated\"\n                },\n                {\n                    \"source\": \".global_scale\",\n                    \"target\": \"length.global_scale\"\n                },\n                {\n                    \"source\": \".start_matrix\",\n"
		+ "                    \"target\": \"length.start_matrix\"\n                },\n                {\n                    \"source\": \".middle_matrix\",\n                    \"target\": \"length.middle_matrix\"\n                },\n                {\n                    \"source\": \".end_matrix\",\n                    \"target\": \"length.end_matrix\"\n                },\n                {\n                    \"source\": \"length.upper_length\",\n                    \"target\": \"main_bend_controls.upper_length\"\n                },\n                {\n                    \"source\": \"length.lower_length\",\n                    \"target\": \"main_bend_controls.lower_length\"\n                },\n                {\n                    \"source\": \"length.upper_length\",\n                    \"target\": \"Corner_wide.upper_length\"\n                },\n                {\n                    \"source\": \"length.lower_length\",\n                    \"target\": \"Corner_wide.lower_length\"\n                },\n                {\n                    \"source\": \"Corner_wide.lower_slide_1\",\n                    \"target\": \".out_lower_slide_1\"\n"
		+ "                },\n                {\n                    \"source\": \".angle\",\n                    \"target\": \"Corner_wide.angle\"\n                },\n                {\n                    \"source\": \"Corner_wide.lower_slide_2\",\n                    \"target\": \".out_lower_slide_2\"\n                },\n                {\n                    \"source\": \"Corner_wide.lower_slide_3\",\n                    \"target\": \".out_lower_slide_3\"\n                },\n                {\n                    \"source\": \"Corner_wide.corner_wide_out\",\n                    \"target\": \".corner_wide_out\"\n                },\n                {\n                    \"source\": \".in_lower_bend\",\n                    \"target\": \"lower_bend.driver_control\"\n                },\n                {\n                    \"source\": \".radius\",\n                    \"target\": \"lower_bend.radius\"\n                },\n                {\n                    \"source\": \"lower_bend.bend_lower_2\",\n                    \"target\": \".bend_lower_2\"\n                },\n                {\n                    \"source\": \".smooth_mode\",\n"
		+ "                    \"target\": \"lower_bend.smooth_mode\"\n                },\n                {\n                    \"source\": \"bend_driver.output\",\n                    \"target\": \"lower_bend.bend_driver\"\n                },\n                {\n                    \"source\": \".radius\",\n                    \"target\": \"upper_bend.radius\"\n                },\n                {\n                    \"source\": \".smooth_mode\",\n                    \"target\": \"upper_bend.smooth_mode\"\n                },\n                {\n                    \"source\": \"bend_driver.output\",\n                    \"target\": \"upper_bend.bend_driver\"\n                },\n                {\n                    \"source\": \".in_upper_bend\",\n                    \"target\": \"upper_bend.driver_control\"\n                },\n                {\n                    \"source\": \"upper_bend.bend_upper_2\",\n                    \"target\": \".bend_upper_2\"\n                },\n                {\n                    \"source\": \"upper_bend.bend_upper_3\",\n                    \"target\": \".bend_upper_3\"\n"
		+ "                },\n                {\n                    \"source\": \"Corner_wide.upper_slide_2\",\n                    \"target\": \".out_upper_slide_2\"\n                },\n                {\n                    \"source\": \"Corner_wide.upper_slide_1\",\n                    \"target\": \".out_upper_slide_1\"\n                },\n                {\n                    \"source\": \"Corner_wide.upper_slide_3\",\n                    \"target\": \".out_upper_slide_3\"\n                },\n                {\n                    \"source\": \".sharp_corner\",\n                    \"target\": \"Corner_wide.small_radius\"\n                },\n                {\n                    \"source\": \"lower_bend.bend_lower_1\",\n                    \"target\": \".bend_lower_1\"\n                },\n                {\n                    \"source\": \"lower_bend.bend_lower_3\",\n                    \"target\": \".bend_lower_3\"\n                },\n                {\n                    \"source\": \".sharp_corner\",\n                    \"target\": \"lower_bend.sharp_corner\"\n                },\n                {\n"
		+ "                    \"source\": \".sharp_corner\",\n                    \"target\": \"upper_bend.sharp_corner\"\n                },\n                {\n                    \"source\": \"upper_bend.bend_upper_1\",\n                    \"target\": \".bend_upper_1\"\n                },\n                {\n                    \"source\": \".startWeight\",\n                    \"target\": \"upper_bend.start_fix\"\n                },\n                {\n                    \"source\": \".endWeight\",\n                    \"target\": \"lower_bend.endWeight\"\n                },\n                {\n                    \"source\": \".init_length\",\n                    \"target\": \"print.single_value\"\n                }\n            ],\n            \"values\": [\n                {\n                    \"valueName\": \"bend_driver.middle_bend\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"bend_driver.smooth_mode\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n"
		+ "                },\n                {\n                    \"valueName\": \"bend_driver.angle\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"main_bend_controls.output\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"Corner_wide.radius\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"Corner_wide.smooth_mode\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"Corner_wide.small_radius\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"false\"\n                },\n                {\n                    \"valueName\": \"length.global_scale\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n"
		+ "                },\n                {\n                    \"valueName\": \"length.start_matrix\",\n                    \"valueType\": \"Math::float4x4\",\n                    \"value\": {\n                        \"c0\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c1\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c2\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c3\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        }\n"
		+ "                    }\n                },\n                {\n                    \"valueName\": \"length.middle_matrix\",\n                    \"valueType\": \"Math::float4x4\",\n                    \"value\": {\n                        \"c0\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c1\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c2\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c3\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n"
		+ "                        }\n                    }\n                },\n                {\n                    \"valueName\": \"length.end_matrix\",\n                    \"valueType\": \"Math::float4x4\",\n                    \"value\": {\n                        \"c0\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c1\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c2\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c3\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n"
		+ "                        }\n                    }\n                },\n                {\n                    \"valueName\": \"lower_bend.driver_control\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"0f\",\n                        \"y\": \"0f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"lower_bend.radius\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"lower_bend.smooth_mode\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"lower_bend.bend_driver\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"upper_bend.driver_control\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n"
		+ "                        \"x\": \"0f\",\n                        \"y\": \"0f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"upper_bend.radius\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"upper_bend.smooth_mode\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"upper_bend.bend_driver\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"print.single_value\",\n                    \"valueType\": \"string\",\n                    \"value\": \"testValue\"\n                },\n                {\n                    \"valueName\": \"print.array_int\",\n                    \"valueType\": \"array<long>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"print.array_float\",\n"
		+ "                    \"valueType\": \"array<float>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"print.array_bool\",\n                    \"valueType\": \"array<bool>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"print.array_string\",\n                    \"valueType\": \"array<string>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"print.array_float3\",\n                    \"valueType\": \"array<Math::float3>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"print.transform\",\n                    \"valueType\": \"Math::float4x4\",\n                    \"value\": {\n                        \"c0\": {\n                            \"x\": \"1f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c1\": {\n                            \"x\": \"0f\",\n"
		+ "                            \"y\": \"1f\",\n                            \"z\": \"0f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c2\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"1f\",\n                            \"w\": \"0f\"\n                        },\n                        \"c3\": {\n                            \"x\": \"0f\",\n                            \"y\": \"0f\",\n                            \"z\": \"0f\",\n                            \"w\": \"1f\"\n                        }\n                    }\n                }\n            ],\n            \"reservedNodeNames\": [\n                {\n                    \"name\": \"input\"\n                },\n                {\n                    \"name\": \"output\"\n                },\n                {\n                    \"name\": \"output1\"\n                },\n                {\n                    \"name\": \"input1\"\n                },\n                {\n                    \"name\": \"output2\"\n                }\n"
		+ "            ]\n        }\n    ]\n}\n");
	setAttr -k on ".angle";
	setAttr -k on ".global_scale";
	setAttr -k on ".start_matrix";
	setAttr -k on ".middle_matrix";
	setAttr -k on ".end_matrix";
	setAttr -k on ".smooth_mode";
	setAttr -k on ".middle_bend";
	setAttr -k on ".radius";
	setAttr -k on ".in_upper_bend";
	setAttr -k on ".in_lower_bend";
	setAttr -k on ".sharp_corner";
	setAttr -k on ".startWeight";
	setAttr -k on ".endWeight";
	setAttr -k on ".init_length";
createNode transform -n "output" -p "mod";
	rename -uid "AE64A555-46BF-B6C3-D3DC-B6BDCA144703";
createNode transform -n "outJoints" -p "output";
	rename -uid "0091C87B-41BC-56F7-0DE1-82B6E9C507E4";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "1538F0A6-4DF2-9B68-991B-9EA3CC08C35F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
	setAttr ".ds" 2;
createNode joint -n "middle_outJoint" -p "root_outJoint";
	rename -uid "F869F1E5-48A0-EF1E-6D24-E383EFC876C3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000259339796214 0 -0.0029881482422647126 0 0 1 0 0
		 0.0029880574101934557 0 0.9999955357464918 0 2.236129877159025 0 0.005211601042381415 1;
	setAttr ".ds" 2;
createNode joint -n "end_outJoint" -p "middle_outJoint";
	rename -uid "E8F88622-413B-36B9-CC07-8FAD2BF0A9BF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_out_grp" -p "output";
	rename -uid "6B73D897-4733-CCDA-9155-41ACD5BC362B";
	setAttr ".v" no;
createNode transform -n "fk_out" -p "fk_out_grp";
	rename -uid "550C0AB8-4102-4758-CE95-D68D86FEB23C";
createNode locator -n "fk_outShape" -p "fk_out";
	rename -uid "D13C78A6-463B-14A0-2F39-2D891CE57851";
	setAttr -k off ".v";
createNode transform -n "ik_out_grp" -p "output";
	rename -uid "7D391C34-4B19-07AB-CC26-3D8769ADFF5D";
	setAttr ".v" no;
createNode transform -n "ik_out" -p "ik_out_grp";
	rename -uid "478BB390-4B88-E340-133D-E98FDB3C4062";
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "D404342B-43DD-3914-3961-D79730A89106";
	setAttr -k off ".v";
createNode transform -n "ik_out_initLoc" -p "ik_out";
	rename -uid "390D0948-45D6-6AC9-C201-4CA1E1B45E30";
createNode locator -n "ik_out_initLocShape" -p "ik_out_initLoc";
	rename -uid "69269616-4B62-ADCE-DD00-FE917512BB9F";
	setAttr -k off ".v";
createNode transform -n "ikRev_out" -p "ik_out_grp";
	rename -uid "92BC4E78-4474-C3E2-5547-4D96DDB21C24";
createNode locator -n "ikRev_outShape" -p "ikRev_out";
	rename -uid "CA5F238A-4C7F-A100-51BC-68B303D97B2C";
	setAttr -k off ".v";
createNode transform -n "end_out" -p "output";
	rename -uid "F5EE451E-4FD5-888A-A5E6-F6B04099A65C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.81999877030424 0 2.3314683517128287e-15 ;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
createNode locator -n "end_outShape" -p "end_out";
	rename -uid "82A0E8C6-43B8-1EAC-AF2E-A0A59BBC4B15";
	setAttr -k off ".v";
createNode transform -n "twist_joints" -p "output";
	rename -uid "4651F112-4E88-2290-489E-9D8E7EF96D38";
createNode joint -n "twistUp_0_skinJoint" -p "twist_joints";
	rename -uid "52534C0E-40DE-1300-BBC5-1CB3CB8EB300";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr -s 2 ".iog";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999993439 0 -3.6232601223622836e-07 0 0 0.99996960163116455 0 0
		 3.6231499811646972e-07 0 0.99996960163109894 0 -5.3067252399122155e-18 5.4095551466424304e-20 -1.0255695055077891e-18 1;
	setAttr -k on ".curvePosition";
createNode joint -n "twistUp_1_skinJoint" -p "twist_joints";
	rename -uid "02D0AD9C-473E-65F1-2160-AE83564D785E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999993439 0 -3.6232600767104704e-07 0 0 0.99996960163116455 0 0
		 3.6231499355142716e-07 0 0.99996960163109894 0 0.35561430253326332 2.193859418593791e-20 -1.2884831130252656e-07 1;
	setAttr -k on ".curvePosition" 13.3;
createNode joint -n "twistUp_2_skinJoint" -p "twist_joints";
	rename -uid "14D14F05-440C-4804-C973-9F90EB7B8421";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999993439 0 -3.6232600293214763e-07 0 0 0.99996960163116455 0 0
		 3.6231498881267185e-07 0 0.99996960163109894 0 0.87477846797879277 1.6492808945738963e-21 -3.1695498931693838e-07 1;
	setAttr -k on ".curvePosition" 28.900000000000002;
createNode joint -n "twistUp_3_skinJoint" -p "twist_joints";
	rename -uid "3A2780A7-42B9-E9FF-2D6E-BDAD02CCF0CD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999993716 0 -3.5439787774778538e-07 0 0 0.99996960163116455 0 0
		 3.5438710463038311e-07 0 0.99996960163110171 0 1.6230619142940546 -2.2813198089869744e-18 -5.8711179215021363e-07 1;
	setAttr -k on ".curvePosition" 50.699999999999996;
createNode joint -n "twistUp_4_skinJoint" -p "twist_joints";
	rename -uid "A71B1183-4A94-9183-F48B-B0A691EF23C1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999996758 0 -2.545112628663806e-07 0 0 0.99996960163116455 0 0
		 2.5450352613913923e-07 0 0.99996960163113213 0 2.0360373836291892 -3.7131550845022918e-17 -7.2186966685689251e-07 1;
	setAttr -k on ".curvePosition" 70.300000000000011;
createNode joint -n "twistDown_0_skinJoint" -p "twist_joints";
	rename -uid "DE2B032E-45B3-EE53-426E-D9BA3A62954D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99996960163116455 0 0 0 0 0.99996960163116455 0
		 2.1996167103448254 -8.7892656116158234e-17 -7.4430469354683578e-07 1;
	setAttr -k on ".curvePosition" 31;
createNode joint -n "twistDown_1_skinJoint" -p "twist_joints";
	rename -uid "728DDF8E-4552-67E0-0EA9-159BF39CF7D8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999995115 0 3.1263263873738035e-07 0 0 0.99996960163116455 0 0
		 -3.1262313521511804e-07 0 0.9999696016311157 0 2.3759826986522445 -3.0325435594382318e-17 -7.1412011423125903e-07 1;
	setAttr -k on ".curvePosition" 50.900000000000006;
createNode joint -n "twistDown_2_skinJoint" -p "twist_joints";
	rename -uid "7857C251-43F9-A728-2AC1-C389A20F89F6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999991684 0 4.0771208512660012e-07 0 0 0.99996960163116455 0 0
		 -4.0769969134425777e-07 0 0.9999696016310814 0 2.8304395695194025 -6.3082392577166269e-19 -5.3996442508762242e-07 1;
	setAttr -k on ".curvePosition" 70.7;
createNode joint -n "twistDown_3_skinJoint" -p "twist_joints";
	rename -uid "B1BA3F3F-44ED-24A3-4A05-81B7EBDA8410";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.9999999999999154 0 4.1120470471378883e-07 0 0 0.99996960163116455 0 0
		 -4.1119220476150805e-07 0 0.99996960163107995 0 3.462066058350814 -1.0084296608336714e-34 -2.8050626920138995e-07 1;
	setAttr -k on ".curvePosition" 86.4;
createNode joint -n "twistDown_4_skinJoint" -p "twist_joints";
	rename -uid "A2F32116-4587-A827-4D85-9CA1D1247FFC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "curvePosition" -ln "curvePosition" -min 0 -max 100 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.9999999999999154 0 4.112047074076732e-07 0 0 0.99996960163116455 0 0
		 -4.1119220745531057e-07 0 0.99996960163107995 0 3.8650354791933927 -7.0889575158818096e-34 -1.1480334698512045e-07 1;
	setAttr -k on ".curvePosition" 100;
createNode joint -n "twistKnee_skinJoint" -p "twist_joints";
	rename -uid "DBEEDE6D-4C9E-7792-B39C-7B8174CBC8DA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "radiusWeight" -ln "radiusWeight" -min 0 -max 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99996960163116455 0 0 0 0 0.99996960163116455 0
		 2.1996167103448254 -8.7892656116158234e-17 -7.4430469354683578e-07 1;
	setAttr -k on ".radiusWeight";
createNode joint -n "twistKnee_y_2_skinJoint" -p "twistKnee_skinJoint";
	rename -uid "4421BD4D-4653-7923-AB13-FF914914E5C3";
	addAttr -ci true -sn "driverAngle" -ln "driverAngle" -at "double";
	addAttr -ci true -sn "angleMin" -ln "angleMin" -at "double";
	addAttr -ci true -sn "angleMax" -ln "angleMax" -at "double";
	addAttr -ci true -sn "posMin" -ln "posMin" -at "double";
	addAttr -ci true -sn "posMax" -ln "posMax" -at "double";
	addAttr -ci true -sn "slideMax" -ln "slideMax" -at "double";
	addAttr -ci true -sn "slideMin" -ln "slideMin" -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -3.1805546814635168e-15 0 ;
	setAttr -cb on ".driverAngle";
	setAttr -cb on ".angleMin" 130;
	setAttr -cb on ".angleMax" 40;
	setAttr -cb on ".posMin" -0.1;
	setAttr -cb on ".posMax" -1;
	setAttr -cb on ".slideMax";
	setAttr -cb on ".slideMin";
createNode joint -n "twistKnee_y_1_skinJoint" -p "twistKnee_skinJoint";
	rename -uid "A6A122AB-4D93-A1C3-C97A-18A903B437E2";
	addAttr -ci true -sn "driverAngle" -ln "driverAngle" -at "double";
	addAttr -ci true -sn "angleMin" -ln "angleMin" -at "double";
	addAttr -ci true -sn "angleMax" -ln "angleMax" -at "double";
	addAttr -ci true -sn "posMin" -ln "posMin" -at "double";
	addAttr -ci true -sn "posMax" -ln "posMax" -at "double";
	addAttr -ci true -sn "slideMax" -ln "slideMax" -at "double";
	addAttr -ci true -sn "slideMin" -ln "slideMin" -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -3.1805546814635168e-15 0 ;
	setAttr -cb on ".driverAngle";
	setAttr -cb on ".angleMin" 150;
	setAttr -cb on ".angleMax" 40;
	setAttr -cb on ".posMin" 0.1;
	setAttr -cb on ".posMax" 1;
	setAttr -cb on ".slideMax";
	setAttr -cb on ".slideMin";
createNode reverse -n "ikFk_reverse";
	rename -uid "B34D5FBD-48FF-FE61-FFB0-EA8B05D9ED51";
createNode ikRPsolver -n "ikRPsolver1";
	rename -uid "8D8B7F0A-42B8-C98C-B401-A1BAFD9E81A8";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "16DCD2D3-4631-FB86-2291-E58ADD422F37";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "9791AA2E-4291-14D7-D5CC-54B16320C058";
	setAttr ".cdl" 5;
	setAttr -s 5 ".dli[1:4]"  5 3 2 4;
createNode displayLayer -n "defaultLayer";
	rename -uid "C96E594B-4CFB-7E18-16C6-CD9B48091A1E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "C4DE3D9C-4827-8550-EF19-C1BF224363D0";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "8E4F4BE6-43F1-363F-82A2-F39206547257";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "43278D91-4856-05A1-723E-65AA0F1E1C1F";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 50 -ast 1 -aet 50 ";
	setAttr ".st" 6;
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "AF8C86FB-42B1-0713-AD3A-E398EFA86CDF";
createNode multMatrix -n "multMatrix22";
	rename -uid "55A9A3AC-4E9A-FC24-A8E1-3FA0BF4F5334";
	setAttr -s 3 ".i";
createNode multMatrix -n "fk_b_group_multMatrix";
	rename -uid "0CFD21C9-4971-1505-92AA-0CA17C0C976F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "fk_b_group_decomposeMatrix";
	rename -uid "F642ACE3-45A1-D06C-D7D3-96A44B68B641";
createNode decomposeMatrix -n "decomposeMatrix31";
	rename -uid "1EBE2BAA-4E3A-1263-A6DA-3B922C020E0A";
createNode multMatrix -n "multMatrix29";
	rename -uid "DCAA9BF9-4AFC-B76D-D665-308D915615BC";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix33";
	rename -uid "C4BBD845-4F0F-72BB-59B8-49AAB7DDBCB3";
createNode objectSet -n "moduleControlSet";
	rename -uid "9767B9CF-47E4-5D91-1EC5-9387CBAEFA23";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode condition -n "mirror_condition";
	rename -uid "5461C4A0-4F3D-5A10-1A15-C8B2E24B5EE4";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 180 -90 ;
	setAttr ".cf" -type "float3" 1 0 0 ;
createNode decomposeMatrix -n "root_connector_decomposeMatrix";
	rename -uid "4A10F995-42A3-7115-9DE1-C5B577E2971D";
createNode decomposeMatrix -n "root_decMat";
	rename -uid "28187909-4B13-6976-9CFD-13828AF1C128";
createNode multMatrix -n "fk_end_group_multMatrix";
	rename -uid "19861CF6-4656-2752-36BF-4A86740E5757";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "fk_end_group_decomposeMatrix";
	rename -uid "149F1B46-469F-E6C0-2AE1-0A84ED09E72C";
createNode decomposeMatrix -n "decomposeMatrix41";
	rename -uid "ECAD3A6F-4B61-33DB-55BF-FB88E22767EB";
createNode decomposeMatrix -n "decomposeMatrix43";
	rename -uid "E25D52CA-47F4-B5FE-71D4-1BB4BCB2C634";
createNode decomposeMatrix -n "decomposeMatrix44";
	rename -uid "16858E37-44C6-3E7C-EC53-B28C6A3F7C95";
createNode objectSet -n "sets";
	rename -uid "6CFCC263-4DCC-7C0C-D7C4-E8BC46C6D2C6";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode unitConversion -n "unitConversion431";
	rename -uid "E20D34AF-4FA3-3BA2-84FE-2E823C32BA8A";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear435";
	rename -uid "A89C058C-498F-3DC1-4B65-A9AAE8C668E4";
createNode multMatrix -n "multMatrix38";
	rename -uid "F6CED503-418B-E877-8D22-8B980925F5B0";
	setAttr -s 2 ".i";
createNode objectSet -n "ikFkSwitchSet";
	rename -uid "008336E9-4BC7-422C-BCCD-CEB3A1E9F540";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "skinJointsSet";
	rename -uid "38FACABF-44CA-AD93-E25F-3EA0A49F9EC5";
	setAttr ".ihi" 0;
	setAttr -s 11 ".dsm";
createNode decomposeMatrix -n "decomposeMatrix42";
	rename -uid "71308060-44D7-C042-2BE6-2FB1A5F7BAC1";
createNode unitConversion -n "unitConversion432";
	rename -uid "B84001D6-499D-DAD3-7BFA-78A5B52468D0";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "rootMiddle_vector";
	rename -uid "B30505B8-4F7D-22A4-E639-E78173055AC4";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "rootEnd_vector";
	rename -uid "449C5B93-4B12-009F-DEA1-21A57AE5D65C";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "cosAngle_bewtweenVectors";
	rename -uid "4CC32169-4A38-DCE1-686A-74962320D4CF";
	setAttr ".no" yes;
createNode multiplyDivide -n "rootEnd_vectorNormalized_projected";
	rename -uid "8B3E45E9-4A0B-EA9A-730B-EBB068110DAD";
createNode distanceBetween -n "rootMiddle_distance";
	rename -uid "0392A35B-4810-0182-1152-C1BFAAAE3157";
createNode vectorProduct -n "rootEnd_vectorNormalized";
	rename -uid "B4201529-4EB9-A0FE-7B62-0797F7EBEF2A";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode multiplyDivide -n "rootMiddle_projected";
	rename -uid "14E7DB82-4F43-2159-5E41-1C863F4C3C66";
createNode plusMinusAverage -n "rootMiddle_betweenPoint";
	rename -uid "466F46EA-4710-D662-3AB0-37A2562AAF5F";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "frombetweenToMiddle_vector";
	rename -uid "021556F9-4674-9E99-1CC4-ABB8144B519F";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "middleOut_vector";
	rename -uid "2C9959DD-4911-1AA6-DB61-84ACCFFE24DB";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "middleOut_vectorNormalized";
	rename -uid "420C0A84-4100-0A67-7530-A4BA1EDE9419";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode multiplyDivide -n "multiplyDivide352";
	rename -uid "6C6F4B8E-448C-E06F-9D91-258F3D323530";
createNode composeMatrix -n "middleOut_matrix";
	rename -uid "D0328F65-43C5-B177-E551-DFB1A831A750";
createNode multMatrix -n "ik_aim_multMatrix";
	rename -uid "CF8FBA45-4DD4-D8D8-9230-3EB66FE3B2F0";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "aimOffset_scaled";
	rename -uid "112C142A-47A0-6782-F971-B38F205220AD";
createNode multiplyDivide -n "final_length";
	rename -uid "8D2095E3-4660-2D6D-D4A6-6997304B8CC3";
createNode blendColors -n "stretch_blend";
	rename -uid "75FC0250-455B-926D-C237-17808BC1518F";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "final_length_factor";
	rename -uid "EF537FE2-4F9A-FE20-633E-5C94FDCF7C78";
	setAttr ".op" 2;
createNode multiplyDivide -n "current_length_scaled";
	rename -uid "9EDC8019-4BC0-D8E7-0D45-1B967A208024";
	setAttr ".op" 2;
createNode condition -n "stretch_condition";
	rename -uid "56722DEB-46B6-A035-5CE1-04A41B2B8C1B";
	setAttr ".op" 5;
createNode plusMinusAverage -n "init_lenth_minus_softIk";
	rename -uid "FCB297E5-49B5-2E88-C5D1-328321D79598";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode addDoubleLinear -n "init_length";
	rename -uid "7F2DDB34-461F-E12D-F8F8-318E900795ED";
	setAttr ".ihi" 2;
createNode multiplyDivide -n "init_length_a";
	rename -uid "1F5B09E3-4AA5-BD54-05AF-2BAAE93346D5";
createNode multiplyDivide -n "init_length_b";
	rename -uid "995A87EA-4298-3AA0-55D9-DE80DCCDEC63";
createNode addDoubleLinear -n "return_softIk";
	rename -uid "60DEC147-4D5F-B6B1-D27E-F8A32C9BE782";
	setAttr ".ihi" 2;
createNode multDoubleLinear -n "one_minus_by_softIk";
	rename -uid "821AC429-4593-68E3-EF9A-D999CF6C8D48";
createNode plusMinusAverage -n "one_minus";
	rename -uid "0A0B38A4-43A4-65B6-487B-738ADE9024E2";
	setAttr ".op" 2;
	setAttr -s 2 ".i1[0:1]"  1 1.034244776;
createNode multiplyDivide -n "power";
	rename -uid "E3D3EDDA-42AD-488C-0E3B-8D9268DD86A3";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 2.7182817 0 0 ;
createNode multiplyDivide -n "length_difference_by_softIk";
	rename -uid "B3BAB427-4816-104E-DD18-148E7E286238";
	setAttr ".op" 2;
createNode multDoubleLinear -n "length_difference_minus";
	rename -uid "544D4D3C-4D4A-F95A-1A7B-C0BCC02F776B";
	setAttr ".i2" -1;
createNode plusMinusAverage -n "length_difference";
	rename -uid "D24F3B80-461C-0E4D-28F4-CA87EDF61750";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode distanceBetween -n "current_length";
	rename -uid "1AE586E9-4E24-C153-EF10-789ECB7D8FD8";
createNode multiplyDivide -n "scale_to_translate_converter";
	rename -uid "6FAF55FD-427B-CE93-8B1F-269FDE43F5EF";
createNode remapValue -n "softIk_value";
	rename -uid "EE0C19F8-49C5-47C6-818C-B5958BAE12C6";
	setAttr ".imx" 20;
	setAttr ".omn" 0.0010000000474974513;
	setAttr ".omx" 2;
	setAttr -s 2 ".vl[0:1]"  0 0 2 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode condition -n "softIk_condition";
	rename -uid "3DA8BF02-431A-50A2-CCA5-8DBACE77A96B";
	setAttr ".op" 2;
createNode blendColors -n "snap_blend";
	rename -uid "041BA176-4F2A-A582-0CE8-559A8F07C604";
createNode distanceBetween -n "current_rootToSnapPoint_length";
	rename -uid "3D558C57-4F3C-DEAD-592B-28B01B66F6C1";
createNode multiplyDivide -n "current_toSnapPoint_length_scaled";
	rename -uid "97EA899A-486F-B929-D728-F48F5DF84709";
	setAttr ".op" 2;
createNode distanceBetween -n "current_endToSnapPoint_length";
	rename -uid "F0C47035-4FE3-53E4-DB6A-DD850039FA16";
createNode decomposeMatrix -n "decomposeMatrix46";
	rename -uid "4D834575-439F-FDBC-60E7-82ABAE4E0E40";
createNode multMatrix -n "multMatrix39";
	rename -uid "7AACF8B7-472A-1A3C-D620-E29DEA6D0803";
	setAttr -s 2 ".i";
createNode composeMatrix -n "world_composeMatrix";
	rename -uid "648EE9AF-4CCD-C959-905D-F98BFBF7219C";
createNode blendColors -n "blendColors1";
	rename -uid "9379CCE7-46BA-249F-4DC4-14B74BF09A29";
createNode unitConversion -n "unitConversion433";
	rename -uid "EE5FF488-4B12-40E8-B2E6-1F9474DF899A";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion434";
	rename -uid "CC94B914-403B-E59B-E841-B1B339E2954E";
	setAttr ".cf" 0.017453292519943295;
createNode blendColors -n "blendColors2";
	rename -uid "21BE9269-48EA-DDF1-CD06-B48D99720355";
createNode unitConversion -n "unitConversion436";
	rename -uid "687CC03F-4225-85A3-4D7E-EC810B74B5D5";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion437";
	rename -uid "EEAE0BE5-4564-679F-3595-E988A1D3EA64";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "control_group_decomposeMatrix";
	rename -uid "D3EECA53-43FD-7AAF-95FE-778296F6FB04";
createNode multMatrix -n "control_group_multMatrix";
	rename -uid "CAC0243B-459A-9FEE-D03E-5A8BD2D92DA4";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "multDoubleLinear437";
	rename -uid "87C64DFF-4252-0239-B66D-C886A7CB2AEB";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion440";
	rename -uid "EFCBED14-4E29-C234-1BDC-B3B749E0AC61";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "multMatrix41";
	rename -uid "984D4332-4D98-A278-9AAB-2A862907F4EA";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix48";
	rename -uid "09D39D73-44C6-731F-B7ED-F0A866C3DA17";
createNode shadingEngine -n "green_rsSG";
	rename -uid "7871FB80-4E5A-D1D6-9B19-BFB37447C823";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "82898476-454C-F0D1-B471-2AA82281139B";
createNode shadingEngine -n "blue_rsSG";
	rename -uid "2968B719-4CEF-A72F-DAEC-71B06C56AED2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "DC927537-4122-9A41-1DEB-7C869CABA00F";
createNode shadingEngine -n "red_rsSG";
	rename -uid "755FAB50-48CA-2AA9-013A-2F83E2FD8964";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "E74AE416-402C-76EF-187F-CE9992CB3D43";
createNode shadingEngine -n "black_rsSG";
	rename -uid "CB07B470-4677-EF36-BD9B-06ADB09AAEB4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "8A676D11-432F-41C9-0C12-C2A238298325";
createNode unitConversion -n "unitConversion443";
	rename -uid "7E2B0977-4CAA-5505-67C7-2AA7EAB15746";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion444";
	rename -uid "3423A85C-4A9E-64C5-4090-F098BE24BBDC";
	setAttr ".cf" 0.017453292519943295;
createNode multiplyDivide -n "volume_mult";
	rename -uid "28477EB0-46DD-73E1-B931-E29C0E5E5144";
	setAttr ".op" 2;
createNode blendColors -n "volume_blendColors";
	rename -uid "D2A52E60-47F5-3FDD-EB10-B3B2F7241642";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode decomposeMatrix -n "ik_aim_decomposeMatrix";
	rename -uid "F2CCBFB8-41D5-7902-AC7E-ABA39168AAE9";
createNode multDoubleLinear -n "initScale1_mult";
	rename -uid "4ED194C1-4AC9-24CB-498C-0794CA9FE3D8";
createNode multDoubleLinear -n "initScaleEnd_mult";
	rename -uid "FB1C669C-4071-F53C-15CC-1E99189F7E6F";
createNode decomposeMatrix -n "decomposeMatrix49";
	rename -uid "1F1445A4-45D6-4AB2-B51F-04804AD8782B";
createNode multiplyDivide -n "multiplyDivide353";
	rename -uid "0B1D7241-436B-FDB0-5ADB-8C98CCE91FB1";
	setAttr ".i2" -type "float3" -1 1 1 ;
createNode unitConversion -n "unitConversion446";
	rename -uid "FB5B6B3D-45E5-70BE-5025-9C938F8359B5";
	setAttr ".cf" 57.295779513082323;
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "96374C77-4494-1291-1FAF-E787355C01F0";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "642124AD-4D3C-2F79-4CC6-5AA216D46BCD";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode blendColors -n "ikfk_blend";
	rename -uid "7F46783C-444F-AE55-2773-F3A0CCA39281";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode decomposeMatrix -n "root_outJoint_decMat";
	rename -uid "BB0073C2-47D5-D29A-6C0C-C0BB5EE1A8CD";
createNode multMatrix -n "root_outJoint_multMat";
	rename -uid "C8382284-4318-3C83-8124-C2A72B4FF119";
	setAttr -s 2 ".i";
createNode objectSet -n "add_moduleControlSet";
	rename -uid "E7DE24E5-4D9B-FB8E-2C32-D3B5412B041E";
	setAttr ".ihi" 0;
	setAttr -s 10 ".dsm";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "EF70865E-4606-3427-40E0-3D83C47CA7DD";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "E82673EC-4FA0-BFE6-51AE-B5871144B145";
createNode renderLayerManager -n "twistUp_renderLayerManager";
	rename -uid "9AEF7D5A-4481-D497-B94A-8FBD3B867557";
createNode renderLayer -n "twistUp_defaultRenderLayer";
	rename -uid "D0D00438-4253-4CAB-E4CE-AFA01063A307";
	setAttr ".g" yes;
createNode multMatrix -n "twistUp_multMatrix5";
	rename -uid "4B51BFD5-46E2-5B94-68D5-3B94C0543598";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "twistUp_decomposeMatrix5";
	rename -uid "F241B2D0-4538-7774-120F-9ABA57CD6071";
createNode quatToEuler -n "twistUp_quatToEuler1";
	rename -uid "56640431-4C9D-4570-2DAC-A6B388EF7A0F";
createNode quatToEuler -n "twistUp_quatToEuler2";
	rename -uid "162602BA-4490-FC5A-99EC-5A87A2EAF1E3";
createNode decomposeMatrix -n "twistUp_decomposeMatrix6";
	rename -uid "B0EC0DFF-4C78-43B6-CBFD-55A66B9BF9CF";
createNode multMatrix -n "twistUp_multMatrix6";
	rename -uid "3B81452C-4DB8-633A-B4C0-E085157A05B2";
createNode shapeEditorManager -n "twistUp_shapeEditorManager";
	rename -uid "8A4EB232-4ED1-03C4-B7B9-5C87A3B6F9C2";
createNode poseInterpolatorManager -n "twistUp_poseInterpolatorManager";
	rename -uid "32F1CB26-4E42-143C-B477-81A7EBC5EBB6";
createNode motionPath -n "twistUp_curve_0_mpath";
	rename -uid "BB78B019-4D51-3D60-7593-D9AAB8A23F48";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistUp_curve_1_mpath";
	rename -uid "60D1E8AF-4A19-8A65-604E-FBB156606F49";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistUp_curve_2_mpath";
	rename -uid "41DBE454-4A5F-FB00-221C-F19F83D47DB8";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistUp_curve_3_mpath";
	rename -uid "E65B4CAB-490D-1929-64FB-8AAA44046D67";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistUp_curve_4_mpath";
	rename -uid "5571E16F-49CC-30DF-DEB2-EAA8C813ED5E";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode unitConversion -n "twistUp_unitConversion18";
	rename -uid "8F1BE87A-49D4-FC3F-1289-209DE2749E35";
	setAttr ".cf" 0.5;
createNode unitConversion -n "twistUp_unitConversion19";
	rename -uid "DB1E5EAC-4C4D-8310-01AE-EC947D7672B9";
	setAttr ".cf" 0.25;
createNode unitConversion -n "twistUp_unitConversion20";
	rename -uid "3CA504B4-45E3-2BB5-4A9F-1BA664172BC7";
	setAttr ".cf" 0.75;
createNode inverseMatrix -n "twistUp_inverseMatrix1";
	rename -uid "0431631E-4585-4826-1F91-F4A4E9A3834B";
createNode renderLayerManager -n "twistDown_renderLayerManager";
	rename -uid "1201BFEF-4E1E-F0C9-B174-A2A39572859F";
createNode renderLayer -n "twistDown_defaultRenderLayer";
	rename -uid "2336143D-4498-EA71-CBB2-84813E0FCD71";
	setAttr ".g" yes;
createNode multMatrix -n "twistDown_multMatrix5";
	rename -uid "E32B71F3-4313-F549-FB60-B58163EA1FC6";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "twistDown_decomposeMatrix5";
	rename -uid "5C730860-4152-E14B-897E-3D91DDCCAE2E";
createNode quatToEuler -n "twistDown_quatToEuler1";
	rename -uid "8915C30A-4731-C5FB-1318-068DECC1BE6C";
createNode quatToEuler -n "twistDown_quatToEuler2";
	rename -uid "C9F1FE51-4106-41DC-A6B7-FBB425F6C947";
createNode decomposeMatrix -n "twistDown_decomposeMatrix6";
	rename -uid "DFA2A05B-4D1B-09FC-44FA-E9A6CB15FA5F";
createNode multMatrix -n "twistDown_multMatrix6";
	rename -uid "81F298AD-4F81-FD2B-EC1C-B9B027BAD729";
createNode shapeEditorManager -n "twistDown_shapeEditorManager";
	rename -uid "744FB908-4CE7-5208-6B4F-84B2CF1009F2";
createNode poseInterpolatorManager -n "twistDown_poseInterpolatorManager";
	rename -uid "2DEF5171-4CD9-F570-BB2B-6CAAD5018B16";
createNode motionPath -n "twistDown_curve_0_mpath";
	rename -uid "9A9684B4-4B43-864A-BD84-99A5A20FCDAF";
	setAttr ".u" 0.655;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistDown_curve_1_mpath";
	rename -uid "D21C67D5-4559-3DA2-D28D-5B9C99909465";
	setAttr ".u" 0.75450000000000006;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistDown_curve_2_mpath";
	rename -uid "0070E3D5-4A63-26C3-89CA-72960F71B28F";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistDown_curve_3_mpath";
	rename -uid "907C9915-48D6-4F8A-E4A2-BBB95D89CA55";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode motionPath -n "twistDown_curve_4_mpath";
	rename -uid "0A14AAE0-4322-B7B2-5055-11B1DCC17473";
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode unitConversion -n "twistDown_unitConversion18";
	rename -uid "39765CEF-49FE-9156-BA86-50A1B47720C8";
	setAttr ".cf" 0.5;
createNode unitConversion -n "twistDown_unitConversion19";
	rename -uid "AA40E4FF-4687-A591-656B-7CBF0AB10E6B";
	setAttr ".cf" 0.25;
createNode unitConversion -n "twistDown_unitConversion20";
	rename -uid "B5D0EB5D-4304-1CCD-CFF5-17B6B4BDD97E";
	setAttr ".cf" 0.75;
createNode inverseMatrix -n "twistDown_inverseMatrix1";
	rename -uid "AB418B50-45CC-909B-9BB0-F1A81EA07769";
createNode motionPath -n "soft_curve_0_mpath";
	rename -uid "92529A93-4FCA-6FF1-8EF1-C8A18687B61B";
	setAttr ".u" 0.1;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "soft_curve_1_mpath";
	rename -uid "80EC8033-4D13-6357-D670-E59D4CDFDC41";
	setAttr ".u" 0.25;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "soft_curve_2_mpath";
	rename -uid "3F5EFE52-46E8-6618-1758-F49F8BEA6717";
	setAttr ".u" 0.4;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "soft_curve_3_mpath";
	rename -uid "489C3AD3-4FE6-B591-49C0-6A808CC83792";
	setAttr ".u" 0.5;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "soft_curve_4_mpath";
	rename -uid "8D4022D7-4F7A-654E-432F-46AC88FB4D63";
	setAttr ".u" 0.6;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "soft_curve_5_mpath";
	rename -uid "E8F98514-4561-6DE7-DF65-9A8E0C903A46";
	setAttr ".u" 0.75;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode motionPath -n "soft_curve_6_mpath";
	rename -uid "2F1E95F5-4805-2750-5839-D287271B6DEB";
	setAttr ".u" 0.89999999999999991;
	setAttr ".f" yes;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
createNode blendMatrix -n "blendMatrix1";
	rename -uid "E43D9C72-46EA-46BB-9977-B1908FC73752";
createNode blendMatrix -n "blendMatrix2";
	rename -uid "DB105B62-4253-46AA-5BC6-C7A7CE57FEC5";
createNode blendMatrix -n "blendMatrix3";
	rename -uid "71472C08-481A-7E8B-2533-47AC21A6A474";
createNode blendMatrix -n "blendMatrix4";
	rename -uid "28129C81-4DA9-185C-FCCA-F1AF32390CFC";
createNode blendMatrix -n "blendMatrix5";
	rename -uid "CDE9FAFB-4C10-875E-D578-9DBF57993618";
createNode blendMatrix -n "blendMatrix6";
	rename -uid "59386C8F-4D90-2761-40DF-1D8400729CBE";
createNode blendMatrix -n "blendMatrix8";
	rename -uid "E1265FF5-4F64-AF98-82AD-5A8F39440714";
createNode multiplyDivide -n "multiplyDivide369";
	rename -uid "F0323E05-4EF5-4504-D080-2AB262DE2AAC";
createNode distanceBetween -n "distanceBetween3";
	rename -uid "2EDECD91-4D56-4A38-F2D3-C89776FA9FA9";
	setAttr ".im1" -type "matrix" 0.99999999999999989 0 -3.4206316112950219e-09 0 0 1 0 0
		 3.4206316112950219e-09 0 0.99999999999999989 0 1.2531623287412819 0 9.3959197694035763e-09 1;
createNode multiplyDivide -n "multiplyDivide373";
	rename -uid "EC9F6E6D-4B19-2E09-94FD-478F8D97634F";
createNode dagPose -n "bindPose1";
	rename -uid "5247F8AA-41EA-FDE7-F3B1-51AFD77BDD64";
	setAttr -s 13 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 13 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -5.1197014183729445e-27
		 3.6232600293215552e-07 -1.4130096589649702e-20 0 0.87477846797879277 1.6492808945738963e-21
		 -3.1695498931693838e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 6.4745658201336352e-40
		 2.2562470444440427e-09 2.8696174189245402e-31 0 2.1996167103448254 -8.7892656116158234e-17
		 -7.4430469354683578e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -7.0615897623593753e-23
		 -3.1263263873738543e-07 2.2587500111564801e-16 0 2.3759826986522445 -3.0325435594382318e-17
		 -7.1412011423125903e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -3.3315689627078178e-24
		 -4.0771208512661145e-07 8.1713765283001625e-18 0 2.8304395695194025 -6.3082392577166269e-19
		 -5.3996442508762242e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -4.1124594845508465e-26
		 3.6232601223623625e-07 -1.1350163514811674e-19 0 -5.3067252399122155e-18 5.4095551466424304e-20
		 -1.0255695055077891e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 9.7238648564745766e-40
		 -4.112047074076848e-07 -2.3647260552477628e-33 0 3.8650354791933927 -7.0889575158818096e-34
		 -1.1480334698512045e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -6.1663687551574819e-23
		 2.5451126286638335e-07 -2.4228274559286788e-16 0 2.0360373836291892 -3.7131550845022918e-17
		 -7.2186966685689251e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -2.4617743376797353e-26
		 3.6232600767105493e-07 -6.7943627715368447e-20 0 0.35561430253326332 2.193859418593791e-20
		 -1.2884831130252656e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -6.6371902828894142e-24
		 3.5439787774779279e-07 -1.8728075701437774e-17 0 1.6230619142940546 -2.2813198089869744e-18
		 -5.8711179215021363e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 3.0241068072879356e-40
		 -4.1120470471380043e-07 -7.3542612052379289e-34 0 3.462066058350814 -1.0084296608336714e-34
		 -2.8050626920138995e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 13 ".m";
	setAttr -s 13 ".p";
	setAttr -s 13 ".g[0:12]" yes yes yes no no no no no no no no no no;
	setAttr ".bp" yes;
createNode multDoubleLinear -n "multDoubleLinear459";
	rename -uid "8D3DBFD4-41EB-8488-4F12-D08E60E80695";
createNode unitConversion -n "unitConversion447";
	rename -uid "59FF3A66-42C1-1C77-069D-5D9A7B0C3AFA";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion448";
	rename -uid "1CA15DA2-419F-AA9C-7715-0E9F83184584";
	setAttr ".cf" -1;
createNode unitConversion -n "unitConversion449";
	rename -uid "C843E988-4445-F8F0-CB10-4FB4D817D52A";
	setAttr ".cf" 1.29;
createNode unitConversion -n "unitConversion450";
	rename -uid "9D53E36A-4BE4-3B0C-6FE5-F9B63F05E84E";
createNode unitConversion -n "unitConversion451";
	rename -uid "D3CF4FC1-46EB-F349-5CB8-6BB513595D41";
	setAttr ".cf" -1.29;
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "1F5E7F28-49EB-EF77-2F6F-EFA8CE69D22D";
	setAttr ".g" yes;
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "BF6885DF-4BB7-4705-76CA-BD8ABBD6D9B2";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode angleBetween -n "angleBetween1";
	rename -uid "00843370-4878-F79F-91F4-5AA7A7CFE29E";
createNode plusMinusAverage -n "plusMinusAverage2";
	rename -uid "C28A44D6-4EF2-24DF-A6F1-9395C27340A2";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "setRange1";
	rename -uid "8FB11D06-43C4-E71E-DB31-5E94D743451E";
createNode unitConversion -n "unitConversion452";
	rename -uid "EEB95CCB-4640-137A-552C-5B8AEE43DF9A";
	setAttr ".cf" 57.295779513082323;
createNode setRange -n "setRange2";
	rename -uid "57F46EAE-4A21-AD6B-E7DC-B68E7A35A259";
createNode dagPose -n "bindPose2";
	rename -uid "BD530B67-413A-DF1F-039E-118C8582E660";
	setAttr -s 16 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 0.9999963254327503 0 -0.0027109262249008356 0 0 0.99996960163116455 0 0
		 0.0027108438171655654 0 0.99996592717561572 0 0.10016278093969418 4.0764838814104838e-20 -0.00027153490738189416 1;
	setAttr ".wm[4]" -type "matrix" 0.99999632543275041 0 -0.0027109262248925939 0 0 0.99996960163116455 0 0
		 0.0027108438171573241 0 0.99996592717561583 0 0.60926044552288605 4.8056291171668766e-21 -0.0016516661887190638 1;
	setAttr ".wm[5]" -type "matrix" 0.99999632447647469 0 -0.0027112789493503112 0 0 0.99996960163116455 0 0
		 0.0027111965308927932 0 0.99996592621936919 0 1.1206242282791572 0 -0.0030379478198775947 1;
	setAttr ".wm[6]" -type "matrix" 0.99999613709928326 0 -0.0027795299083455695 0 0 0.99996960163116455 0 0
		 0.0027794454151702265 0 0.99996573884787365 0 1.6633409580355765 0 -0.004520344867497127 1;
	setAttr ".wm[7]" -type "matrix" 0.99999746445160165 0 -0.0022519081614702017 0 0 0.99996960163116455 0 0
		 0.0022518397071353258 0 0.99996706615984277 0 2.0834471571589988 0 -0.0056816942810543379 1;
	setAttr ".wm[8]" -type "matrix" 0.99999984089671567 0 0.00056409799094364957 0 0 0.99996960163116455 0 0
		 -0.00056408084328486154 0 0.99996944253271669 0 2.3120624324394896 0 -0.0058834974139143053 1;
	setAttr ".wm[9]" -type "matrix" 0.99999932969537564 0 0.0011578466216871559 0 0 0.99996960163116455 0 0
		 -0.001157811425038495 0 0.99996893134691633 0 2.6718373133213675 0 -0.005476002244023722 1;
	setAttr ".wm[10]" -type "matrix" 0.99999941865967301 0 0.0010782765489218186 0 0 0.99996960163116455 0 0
		 -0.0010782437710735778 0 0.99996902030850932 0 3.1397700694660688 0 -0.0049602354688511761 1;
	setAttr ".wm[11]" -type "matrix" 0.99999941937676207 0 0.0010776113114861572 0 0 0.99996960163116455 0 0
		 -0.0010775785538600494 0 0.99996902102557661 0 3.6547142724594543 -1.9143974604728107e-34 -0.004405310545059278 1;
	setAttr ".wm[12]" -type "matrix" 0.99999941937676207 0 0.0010776113114908557 0 0 0.99996960163116455 0 0
		 -0.0010775785538647477 0 0.99996902102557661 0 4.0472003048895404 -1.1382450335606818e-33 -0.0039823629113382311 1;
	setAttr ".wm[13]" -type "matrix" 0.99999956087256825 0 -0.00093715242663879863 0
		 0 0.99996960163116455 0 0 0.00093712393873367867 0 0.99996916251708157 0 2.1957553295363832 0 -0.0058687761197861437 1;
	setAttr ".wm[14]" -type "matrix" 0.99999956087256825 0 -0.00093715242663879863 0
		 0 1 0 0 0.00093715242663879874 0 0.99999956087256836 0 2.1956616171201668 0 -0.10586571621261699 1;
	setAttr ".wm[15]" -type "matrix" 0.99999956087256825 0 -0.00093715242663879863 0
		 0 1 0 0 0.00093715242663879874 0 0.99999956087256836 0 2.1958490419525996 0 0.094128163973044701 1;
	setAttr -s 16 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -3.2723793118456533e-22
		 0.0027109295453992899 -1.2071074755881108e-19 0 0.10016278093969418 4.0764838814104838e-20
		 -0.00027153490738189416 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -8.2076980078821199e-23
		 0.0027109295453910482 -3.0276360649420884e-20 0 0.60926044552288605 4.8056291171668766e-21
		 -0.0016516661887190638 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.0027112822711450489 0 0 1.1206242282791572 0 -0.0030379478198775947 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.0027795334873671248 0 0 1.6633409580355765 0 -0.004520344867497127 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.0022519100647461761 0 0 2.0834471571589988 0 -0.0056816942810543379 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 -0.00056409802086026574 0 0 2.3120624324394896 0 -0.0058834974139143053 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 -0.0011578468803905399 0 0 2.6718373133213675 0 -0.005476002244023722 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 -0.0010782767578704144 0 0 3.1397700694660688 0 -0.0049602354688511761 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 1.3081406736328826e-36
		 -0.0010776115200482619 -1.2139262642193291e-33 0 3.6547142724594543 -1.9143974604728107e-34
		 -0.004405310545059278 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 4.1530417456659826e-36
		 -0.0010776115200529604 -3.8539329546572074e-33 0 4.0472003048895404 -1.1382450335606818e-33
		 -0.0039823629113382311 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.00093715256381526901 0 0 2.1957553295363832 0 -0.0058687761197861437 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.10000002384185791 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000303992929245 1.0000303992929245 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0.10000002384185791 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000303992929245 1.0000303992929245 yes;
	setAttr -s 14 ".m";
	setAttr -s 16 ".p";
	setAttr -s 16 ".g[0:15]" yes yes yes no no no no no no no no no no 
		no no no;
	setAttr ".bp" yes;
createNode blendColors -n "blendColors3";
	rename -uid "5D8F483D-415B-C13D-35DB-7DB235F5570A";
	setAttr ".c1" -type "float3" 0.81900001 0.69999999 0.56 ;
	setAttr ".c2" -type "float3" 0.83999997 0.755 0.66000003 ;
createNode multDoubleLinear -n "multDoubleLinear466";
	rename -uid "4F65DB8E-400A-0231-0A4E-F39168449F27";
createNode multDoubleLinear -n "multDoubleLinear467";
	rename -uid "23D90645-4107-5445-C323-56BC772D5E47";
createNode reverse -n "reverse1";
	rename -uid "5685D95D-4F1E-CFC9-7308-188EFFE62BB3";
createNode blendColors -n "blendColors4";
	rename -uid "F68F694F-4FA0-7BAD-6158-2EA51CB54948";
	setAttr ".c1" -type "float3" 0.442 0.294 0.178 ;
	setAttr ".c2" -type "float3" 0.352 0.25400001 0.168 ;
createNode ngst2SkinLayerData -n "ngSkinToolsData_skinCluster2";
	rename -uid "A6E16D79-4992-9327-7A5A-9AAAAF564BD8";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 16 3981 {
"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"};
	setAttr ".imo" -type "string" "{\"_InfluenceMappingConfig__mirror_axis\": 0, \"dg_destination_attribute\": \"oppositeInfluence\", \"globs\": [[\"L_*\", \"R_*\"], [\"l_*\", \"r_*\"], [\"lf_*\", \"rt_*\"], [\"*_lf\", \"*_rt\"], [\"Left*\", \"Right*\"]]}";
createNode dagPose -n "bindPose3";
	rename -uid "3F920A78-44A1-F029-52DB-E28355E17E88";
	setAttr -s 16 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 0.99999632699790164 0 -0.0027103488162429305 0 0 0.99996960163116455 0 0
		 0.0027102664260599415 0 0.99996592874071943 0 0.1176618017854392 4.0764838814104838e-20 -0.00031890569652766993 1;
	setAttr ".wm[4]" -type "matrix" 0.99999632699790164 0 -0.0027103488162359161 0 0 0.99996960163116455 0 0
		 0.0027102664260529276 0 0.99996592874071943 0 0.7157017902364804 4.8056291171668766e-21 -0.0019398086248693619 1;
	setAttr ".wm[5]" -type "matrix" 0.99999632699778351 0 -0.002710348859842769 0 0 0.99996960163116455 0 0
		 0.0027102664696584547 0 0.99996592874060131 0 1.2538298465805906 0 -0.00339832872263961 1;
	setAttr ".wm[6]" -type "matrix" 0.99999632630962187 0 -0.0027106027485332743 0 0 0.99996960163116455 0 0
		 0.0027105203506311579 0 0.99996592805246065 0 1.7513029061164891 0 -0.0047466951143789833 1;
	setAttr ".wm[7]" -type "matrix" 0.99999632062740318 0 -0.0027126982242629233 0 0 0.99996960163116455 0 0
		 0.002712615762661763 0 0.99996592237041471 0 2.0971377365502137 0 -0.0056843349767224079 1;
	setAttr ".wm[8]" -type "matrix" 0.99999941769114831 0 0.0010791743900746612 0 0 0.99996960163116455 0 0
		 -0.001079141584933514 0 0.99996901934001414 0 2.3188949953600821 0 -0.0058438907178888664 1;
	setAttr ".wm[9]" -type "matrix" 0.99999941984394236 0 0.0010771776913489222 0 0 0.99996960163116455 0 0
		 -0.0010771449469041594 0 0.99996902149274269 0 2.6387859530548079 0 -0.0054991274946085038 1;
	setAttr ".wm[10]" -type "matrix" 0.99999942008333753 0 0.0010769554255194737 0 0 0.99996960163116455 0 0
		 -0.0010769226878312294 0 0.99996902173213065 0 3.084303014233261 -9.8606449417795613e-38 -0.0050192992791582205 1;
	setAttr ".wm[11]" -type "matrix" 0.99999942008333753 0 0.0010769554255213505 0 0 0.99996960163116455 0 0
		 -0.0010769226878331061 0 0.99996902173213065 0 3.5697112426623701 -1.9143974604728107e-34 -0.0044965359508001828 1;
	setAttr ".wm[12]" -type "matrix" 0.99999942008333753 0 0.0010769554255253581 0 0 0.99996960163116455 0 0
		 -0.0010769226878371136 0 0.99996902173213065 0 4.030766885229073 -1.1382450335606818e-33 -0.0039999992871200159 1;
	setAttr ".wm[13]" -type "matrix" 0.99999956094043874 0 -0.00093708000183763255 0
		 0 0.99996960163116455 0 0 0.00093705151613410838 0 0.99996916258494994 0 2.2022750134844729 0 -0.0059681181071694154 1;
	setAttr ".wm[14]" -type "matrix" 0.99999956094043874 0 -0.00093708000183763255 0
		 0 1 0 0 0.00093708000183763266 0 0.99999956094043885 0 2.2021813083105184 0 -0.1059650582067871 1;
	setAttr ".wm[15]" -type "matrix" 0.99999956094043874 0 -0.00093708000183763255 0
		 0 1 0 0 0.00093708000183763266 0 0.99999956094043885 0 2.2023687186584273 0 0.094028821992448261 1;
	setAttr -s 16 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -2.7851077808240699e-22
		 0.0027103521346201025 -1.0275827834901226e-19 0 0.1176618017854392 4.0764838814104838e-20
		 -0.00031890569652766993 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 -6.9855360175361576e-23
		 0.0027103521346130881 -2.5773568242177573e-20 0 0.7157017902364804 4.8056291171668766e-21
		 -0.0019398086248693619 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.0027103521782201011 0 0 1.2538298465805906 0 -0.00339832872263961 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.002710606067843231 0 0 1.7513029061164891 0 -0.0047466951143789833 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.0027127015512769894 0 0 2.0971377365502137 0 -0.0056843349767224079 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 -0.0010791745995456432 0 0 2.3188949953600821 0 -0.0058438907178888664 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 -0.0010771778996593582 0 0 2.6387859530548079 0 -0.0054991274946085038 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 8.0753570812564742e-39
		 -0.0010769556337009872 -7.4983206267439488e-36 0 3.084303014233261 -9.8606449417795613e-38
		 -0.0050192992791582205 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 1.1129121913482089e-36
		 -0.0010769556337028639 -1.0333874225197873e-33 0 3.5697112426623701 -1.9143974604728107e-34
		 -0.0044965359508001828 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 3.5332368375457597e-36
		 -0.0010769556337068716 -3.2807642301650358e-33 0 4.030766885229073 -1.1382450335606818e-33
		 -0.0039999992871200159 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 0.99996960163116455 0.99996960163116455 0
		 0.00093708013898230154 0 0 2.2022750134844729 0 -0.0059681181071694154 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.10000002384185791 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000303992929245 1.0000303992929245 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0.10000002384185791 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000303992929245 1.0000303992929245 yes;
	setAttr -s 16 ".m";
	setAttr -s 16 ".p";
	setAttr -s 16 ".g[0:15]" yes yes yes no no no no no no no no no no 
		no no no;
	setAttr ".bp" yes;
createNode ngst2SkinLayerData -n "ngSkinToolsData_skinCluster3";
	rename -uid "9900332E-4739-FF4C-1F4A-B28A27061144";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 16 28605 {
"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"};
	setAttr ".imo" -type "string" "{\"_InfluenceMappingConfig__mirror_axis\": 0, \"dg_destination_attribute\": \"oppositeInfluence\", \"globs\": [[\"L_*\", \"R_*\"], [\"l_*\", \"r_*\"], [\"lf_*\", \"rt_*\"], [\"*_lf\", \"*_rt\"], [\"Left*\", \"Right*\"]]}";
createNode blendColors -n "blendColors5";
	rename -uid "46D31AD1-478C-385F-CB41-59A589E5D066";
createNode blendColors -n "blendColors6";
	rename -uid "C53FCBDA-4235-2EBF-B799-0AB04B95C234";
createNode multDoubleLinear -n "multDoubleLinear468";
	rename -uid "D13EC1B8-49E0-32EE-EF3D-4AB459E07DAF";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear469";
	rename -uid "6B0EB990-438B-6FFB-EA25-8CBE9A3EF79E";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear470";
	rename -uid "B8B00346-4F0A-F820-15A5-2082CAA3CF7A";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear471";
	rename -uid "EDF54F26-41A8-7483-F66A-7A9BC7EC24EF";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear472";
	rename -uid "2B8718D7-4BBF-02FE-0F7D-8DA2D67048E5";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear473";
	rename -uid "8D8FF759-44D7-2AB8-1497-A2B08F641671";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear474";
	rename -uid "4655FECC-4EF4-EAB8-214B-8F914CC50088";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear475";
	rename -uid "84EA6133-4460-6D4C-FEA1-CCB6258561EB";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear476";
	rename -uid "2FD47134-4931-3585-4C91-0EAC70209BAB";
	setAttr ".i2" 0.005;
createNode multDoubleLinear -n "multDoubleLinear477";
	rename -uid "56809BD8-40E9-AC80-A3DE-3FB5FCD273E2";
	setAttr ".i2" 0.005;
createNode unitConversion -n "unitConversion453";
	rename -uid "9D69E675-4A71-F9EE-EE82-B89DE13218F5";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear478";
	rename -uid "026E427B-49CE-CB35-16DB-DCB3C34694E5";
createNode addDoubleLinear -n "addDoubleLinear5";
	rename -uid "FFAAA2B0-436A-B28C-C9DA-03A1E8C0215D";
	setAttr ".ihi" 2;
	setAttr ".i2" 0.5;
createNode addDoubleLinear -n "addDoubleLinear6";
	rename -uid "1B69E028-4639-377A-8154-7F9AFA85247D";
	setAttr ".ihi" 2;
	setAttr ".i2" 0.5;
createNode addDoubleLinear -n "addDoubleLinear7";
	rename -uid "6479BF74-4484-0A5F-DF9F-9A968EC366F0";
	setAttr ".ihi" 2;
	setAttr ".i2" 0.5;
createNode condition -n "reverse_condition";
	rename -uid "A957ED41-4C33-992D-9F09-60B970605081";
	setAttr ".op" 4;
	setAttr ".ct" -type "float3" 180 0 0 ;
	setAttr ".cf" -type "float3" 0 0 0 ;
createNode multMatrix -n "aim_world_connector_multMatrix";
	rename -uid "D36FD702-4904-E155-A961-94A9084E30D3";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion454";
	rename -uid "4837F307-4ECF-0B3B-118C-9E8365B96708";
	setAttr ".cf" -1;
createNode multiplyDivide -n "pasted__size_multiplyDivide";
	rename -uid "CB431E3D-4165-18A4-5243-07AD1A208D5F";
createNode multDoubleLinear -n "pasted__multDoubleLinear438";
	rename -uid "9E0FC157-44F0-EB99-1486-5484CCD5E2AD";
createNode decomposeMatrix -n "pasted__mainPoser_decomposeMatrix";
	rename -uid "53F36A5A-439C-8173-50D2-4EBE0BABFE84";
createNode sweepMeshCreator -n "pasted__sweepMeshCreator1";
	rename -uid "ADFEBA5C-4CC4-16BC-E732-759C8A7F70C9";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "5D576044-404A-B78F-CBB3-78874D6B60A6";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode objectSet -n "cluster4Set";
	rename -uid "A07D1D99-4881-7312-13EE-D0B1BA48D4DE";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupParts -n "groupParts42";
	rename -uid "8309FD7C-4BC0-955A-4AFA-0BB218798CE8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode groupId -n "groupId42";
	rename -uid "0477F951-4A1A-29B1-22B3-90944132D1F2";
	setAttr ".ihi" 0;
createNode tweak -n "tweak24";
	rename -uid "A20F2129-47CA-9FB6-957D-37A9757361D3";
createNode objectSet -n "tweakSet24";
	rename -uid "D8EB776E-4BE4-686A-17DA-109380A2323B";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "D30F2C7D-4029-ACA9-1253-29B9D090E7C3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode groupId -n "cluster4GroupId";
	rename -uid "2BACF571-4079-4D35-C2DF-EB9B6414C18C";
	setAttr ".ihi" 0;
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "48B05EA6-4358-6585-083E-DDA3657A0F40";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "BDF96844-427D-7CC2-94C1-1A9DAA0B0573";
createNode multiplyDivide -n "pasted__size_multiplyDivide1";
	rename -uid "6D531F62-4047-2A20-644B-D4B22B44E188";
	setAttr ".i1" -type "float3" 0.5 0.56 0.25 ;
	setAttr ".i2" -type "float3" 0.5 0.25999999 0.25999999 ;
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "B42DCE2B-40F4-B85F-7ACD-9F8E00EBEA21";
createNode decomposeMatrix -n "decomposeMatrix45";
	rename -uid "12466FBC-472E-43C9-4685-A09AFAC3CEDA";
createNode unitConversion -n "unitConversion435";
	rename -uid "EF30D383-4478-4CAA-7A98-D18B9E9F8B6A";
	setAttr ".cf" 57.295779513082323;
createNode multMatrix -n "multMatrix34";
	rename -uid "C27A9465-4FD4-0A20-A0A4-3FAEE94427E0";
createNode distanceBetween -n "distanceBetween4";
	rename -uid "38B2EE20-4022-9F6F-A6DB-298D2BF82E13";
createNode motionPath -n "twistDown_curve_0_mpath1";
	rename -uid "FFF7E5EC-4B0C-B3A1-5062-9BBE0511990C";
	setAttr ".u" 0.5;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".wut" 2;
createNode pairBlend -n "pairBlend1";
	rename -uid "93868B54-4442-6EFC-780E-32B26F58CEF6";
	setAttr ".w" 0.5;
	setAttr ".ri" 1;
createNode condition -n "condition3";
	rename -uid "70D38D93-47FF-8C95-DE49-FC8B42C056A8";
	setAttr ".op" 3;
createNode condition -n "condition2";
	rename -uid "829503B8-4408-6099-AC45-5BAF71381C46";
	setAttr ".op" 3;
createNode condition -n "condition1";
	rename -uid "E6D459C7-4B8A-C4B5-44A5-E99BDF3C070F";
	setAttr ".op" 2;
createNode condition -n "condition4";
	rename -uid "C2097C4D-426A-5E9A-0D32-679666B441AC";
	setAttr ".op" 2;
createNode condition -n "condition6";
	rename -uid "E8F0226A-4F51-9F40-6AC5-41B039019660";
	setAttr ".op" 3;
createNode condition -n "condition5";
	rename -uid "05F7812A-4BC0-9059-3EA9-7981BAB20259";
	setAttr ".op" 3;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "8B9E0492-4502-F110-FBCB-D9A9A060A3B1";
	setAttr -s 8 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 96119.318524882983 2415.4760944937698 ;
	setAttr ".tgi[0].vh" -type "double2" 101525.91171663768 3879.7617505939993 ;
	setAttr -s 10 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 98635.7109375;
	setAttr ".tgi[0].ni[0].y" 2525.71435546875;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 98576.953125;
	setAttr ".tgi[0].ni[1].y" 3596.347412109375;
	setAttr ".tgi[0].ni[1].nvs" 18305;
	setAttr ".tgi[0].ni[2].x" 98130.9453125;
	setAttr ".tgi[0].ni[2].y" 3822.852783203125;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" 98682.0859375;
	setAttr ".tgi[0].ni[3].y" 3217.885009765625;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 98635.7109375;
	setAttr ".tgi[0].ni[4].y" 2785.71435546875;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 98632.421875;
	setAttr ".tgi[0].ni[5].y" 3017.14404296875;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" 98635.7109375;
	setAttr ".tgi[0].ni[6].y" 2655.71435546875;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 99098.65625;
	setAttr ".tgi[0].ni[7].y" 3870.953125;
	setAttr ".tgi[0].ni[7].nvs" 18305;
	setAttr ".tgi[0].ni[8].x" 98752.8671875;
	setAttr ".tgi[0].ni[8].y" 3007.634033203125;
	setAttr ".tgi[0].ni[8].nvs" 18305;
	setAttr ".tgi[0].ni[9].x" 98146.1796875;
	setAttr ".tgi[0].ni[9].y" 3268.4248046875;
	setAttr ".tgi[0].ni[9].nvs" 18305;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" 68139.466156849754 -4491.666488183876 ;
	setAttr ".tgi[1].vh" -type "double2" 71572.433053402929 -3561.9046203673888 ;
	setAttr -s 7 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 70094.3671875;
	setAttr ".tgi[1].ni[0].y" -4090.336181640625;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" 69398.5703125;
	setAttr ".tgi[1].ni[1].y" -3958.571533203125;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 69400.25;
	setAttr ".tgi[1].ni[2].y" -4065.88232421875;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 69725.0390625;
	setAttr ".tgi[1].ni[3].y" -3871.260498046875;
	setAttr ".tgi[1].ni[3].nvs" 18305;
	setAttr ".tgi[1].ni[4].x" 69697.3125;
	setAttr ".tgi[1].ni[4].y" -4259.24365234375;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 69398.5703125;
	setAttr ".tgi[1].ni[5].y" -3857.142822265625;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 69386.8046875;
	setAttr ".tgi[1].ni[6].y" -4255.54638671875;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" 46374.173981431719 245.2380854932093 ;
	setAttr ".tgi[2].vh" -type "double2" 49811.53648220584 1176.1904294528679 ;
	setAttr -s 3 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 47755.125;
	setAttr ".tgi[2].ni[0].y" 1143.781494140625;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[2].ni[1].x" 48301.765625;
	setAttr ".tgi[2].ni[1].y" 942.100830078125;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 48147.14453125;
	setAttr ".tgi[2].ni[2].y" 674.28570556640625;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" 36637.086456260775 -3014.2855945087663 ;
	setAttr ".tgi[3].vh" -type "double2" 40070.053352813964 -2084.5237266922791 ;
	setAttr -s 16 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 38570.421875;
	setAttr ".tgi[3].ni[0].y" -2457.983154296875;
	setAttr ".tgi[3].ni[0].nvs" 18304;
	setAttr ".tgi[3].ni[1].x" 38562.85546875;
	setAttr ".tgi[3].ni[1].y" -2254.28564453125;
	setAttr ".tgi[3].ni[1].nvs" 18304;
	setAttr ".tgi[3].ni[2].x" 38562.85546875;
	setAttr ".tgi[3].ni[2].y" -2660;
	setAttr ".tgi[3].ni[2].nvs" 18304;
	setAttr ".tgi[3].ni[3].x" 38562.85546875;
	setAttr ".tgi[3].ni[3].y" -2558.571533203125;
	setAttr ".tgi[3].ni[3].nvs" 18304;
	setAttr ".tgi[3].ni[4].x" 38562.85546875;
	setAttr ".tgi[3].ni[4].y" -2152.857177734375;
	setAttr ".tgi[3].ni[4].nvs" 18304;
	setAttr ".tgi[3].ni[5].x" 38562.85546875;
	setAttr ".tgi[3].ni[5].y" -2355.71435546875;
	setAttr ".tgi[3].ni[5].nvs" 18304;
	setAttr ".tgi[3].ni[6].x" 38255.71484375;
	setAttr ".tgi[3].ni[6].y" -2355.71435546875;
	setAttr ".tgi[3].ni[6].nvs" 18304;
	setAttr ".tgi[3].ni[7].x" 38255.71484375;
	setAttr ".tgi[3].ni[7].y" -2761.428466796875;
	setAttr ".tgi[3].ni[7].nvs" 18304;
	setAttr ".tgi[3].ni[8].x" 38255.71484375;
	setAttr ".tgi[3].ni[8].y" -2457.142822265625;
	setAttr ".tgi[3].ni[8].nvs" 18304;
	setAttr ".tgi[3].ni[9].x" 37904.03515625;
	setAttr ".tgi[3].ni[9].y" -2370.588134765625;
	setAttr ".tgi[3].ni[9].nvs" 18305;
	setAttr ".tgi[3].ni[10].x" 38562.85546875;
	setAttr ".tgi[3].ni[10].y" -2761.428466796875;
	setAttr ".tgi[3].ni[10].nvs" 18304;
	setAttr ".tgi[3].ni[11].x" 38255.71484375;
	setAttr ".tgi[3].ni[11].y" -2254.28564453125;
	setAttr ".tgi[3].ni[11].nvs" 18304;
	setAttr ".tgi[3].ni[12].x" 38255.71484375;
	setAttr ".tgi[3].ni[12].y" -2660;
	setAttr ".tgi[3].ni[12].nvs" 18304;
	setAttr ".tgi[3].ni[13].x" 38255.71484375;
	setAttr ".tgi[3].ni[13].y" -2152.857177734375;
	setAttr ".tgi[3].ni[13].nvs" 18304;
	setAttr ".tgi[3].ni[14].x" 38562.85546875;
	setAttr ".tgi[3].ni[14].y" -2891.428466796875;
	setAttr ".tgi[3].ni[14].nvs" 18304;
	setAttr ".tgi[3].ni[15].x" 38255.71484375;
	setAttr ".tgi[3].ni[15].y" -2558.571533203125;
	setAttr ".tgi[3].ni[15].nvs" 18304;
	setAttr ".tgi[4].tn" -type "string" "Untitled_5";
	setAttr ".tgi[4].vl" -type "double2" -280.76921961246433 269.04760835663154 ;
	setAttr ".tgi[4].vh" -type "double2" 3152.1976769407206 1198.809476173119 ;
	setAttr -s 5 ".tgi[4].ni";
	setAttr ".tgi[4].ni[0].x" 1025.7142333984375;
	setAttr ".tgi[4].ni[0].y" 807.14288330078125;
	setAttr ".tgi[4].ni[0].nvs" 18305;
	setAttr ".tgi[4].ni[1].x" 1001.3445434570312;
	setAttr ".tgi[4].ni[1].y" 1388.9915771484375;
	setAttr ".tgi[4].ni[1].nvs" 18305;
	setAttr ".tgi[4].ni[2].x" 1332.857177734375;
	setAttr ".tgi[4].ni[2].y" 965.71429443359375;
	setAttr ".tgi[4].ni[2].nvs" 18305;
	setAttr ".tgi[4].ni[3].x" 1650.92431640625;
	setAttr ".tgi[4].ni[3].y" 895.79833984375;
	setAttr ".tgi[4].ni[3].nvs" 18304;
	setAttr ".tgi[4].ni[4].x" 1025.7142333984375;
	setAttr ".tgi[4].ni[4].y" 908.5714111328125;
	setAttr ".tgi[4].ni[4].nvs" 18304;
	setAttr ".tgi[5].tn" -type "string" "Untitled_6";
	setAttr ".tgi[5].vl" -type "double2" -3435.530999015391 -4133.3331690894456 ;
	setAttr ".tgi[5].vh" -type "double2" -2.5641024622063924 -3203.5713012729584 ;
	setAttr -s 9 ".tgi[5].ni";
	setAttr ".tgi[5].ni[0].x" -2201.428466796875;
	setAttr ".tgi[5].ni[0].y" -3440;
	setAttr ".tgi[5].ni[0].nvs" 18304;
	setAttr ".tgi[5].ni[1].x" -1894.2857666015625;
	setAttr ".tgi[5].ni[1].y" -3700;
	setAttr ".tgi[5].ni[1].nvs" 18304;
	setAttr ".tgi[5].ni[2].x" -2201.428466796875;
	setAttr ".tgi[5].ni[2].y" -3570;
	setAttr ".tgi[5].ni[2].nvs" 18304;
	setAttr ".tgi[5].ni[3].x" -1587.142822265625;
	setAttr ".tgi[5].ni[3].y" -3830;
	setAttr ".tgi[5].ni[3].nvs" 18304;
	setAttr ".tgi[5].ni[4].x" -1894.2857666015625;
	setAttr ".tgi[5].ni[4].y" -3570;
	setAttr ".tgi[5].ni[4].nvs" 18304;
	setAttr ".tgi[5].ni[5].x" -1894.2857666015625;
	setAttr ".tgi[5].ni[5].y" -3440;
	setAttr ".tgi[5].ni[5].nvs" 18304;
	setAttr ".tgi[5].ni[6].x" -1587.142822265625;
	setAttr ".tgi[5].ni[6].y" -3440;
	setAttr ".tgi[5].ni[6].nvs" 18304;
	setAttr ".tgi[5].ni[7].x" -1587.142822265625;
	setAttr ".tgi[5].ni[7].y" -3700;
	setAttr ".tgi[5].ni[7].nvs" 18304;
	setAttr ".tgi[5].ni[8].x" -1587.142822265625;
	setAttr ".tgi[5].ni[8].y" -3570;
	setAttr ".tgi[5].ni[8].nvs" 18304;
	setAttr ".tgi[6].tn" -type "string" "Untitled_7";
	setAttr ".tgi[6].vl" -type "double2" 7214.7957182016635 4066.9430426184235 ;
	setAttr ".tgi[6].vh" -type "double2" 8845.4537499863636 5415.6534656140011 ;
	setAttr -s 18 ".tgi[6].ni";
	setAttr ".tgi[6].ni[0].x" 7423.3642578125;
	setAttr ".tgi[6].ni[0].y" 5167.44921875;
	setAttr ".tgi[6].ni[0].nvs" 18305;
	setAttr ".tgi[6].ni[1].x" 8042.85693359375;
	setAttr ".tgi[6].ni[1].y" 5892.85693359375;
	setAttr ".tgi[6].ni[1].nvs" 18304;
	setAttr ".tgi[6].ni[2].x" 8042.85693359375;
	setAttr ".tgi[6].ni[2].y" 5791.4287109375;
	setAttr ".tgi[6].ni[2].nvs" 18304;
	setAttr ".tgi[6].ni[3].x" 8042.85693359375;
	setAttr ".tgi[6].ni[3].y" 5690;
	setAttr ".tgi[6].ni[3].nvs" 18304;
	setAttr ".tgi[6].ni[4].x" 8042.85693359375;
	setAttr ".tgi[6].ni[4].y" 5588.5712890625;
	setAttr ".tgi[6].ni[4].nvs" 18304;
	setAttr ".tgi[6].ni[5].x" 8042.85693359375;
	setAttr ".tgi[6].ni[5].y" 5487.14306640625;
	setAttr ".tgi[6].ni[5].nvs" 18304;
	setAttr ".tgi[6].ni[6].x" 8042.85693359375;
	setAttr ".tgi[6].ni[6].y" 5385.71435546875;
	setAttr ".tgi[6].ni[6].nvs" 18304;
	setAttr ".tgi[6].ni[7].x" 8042.85693359375;
	setAttr ".tgi[6].ni[7].y" 5284.28564453125;
	setAttr ".tgi[6].ni[7].nvs" 18304;
	setAttr ".tgi[6].ni[8].x" 8042.85693359375;
	setAttr ".tgi[6].ni[8].y" 5182.85693359375;
	setAttr ".tgi[6].ni[8].nvs" 18304;
	setAttr ".tgi[6].ni[9].x" 8042.85693359375;
	setAttr ".tgi[6].ni[9].y" 5081.4287109375;
	setAttr ".tgi[6].ni[9].nvs" 18304;
	setAttr ".tgi[6].ni[10].x" 8042.85693359375;
	setAttr ".tgi[6].ni[10].y" 4980;
	setAttr ".tgi[6].ni[10].nvs" 18304;
	setAttr ".tgi[6].ni[11].x" 8042.85693359375;
	setAttr ".tgi[6].ni[11].y" 4878.5712890625;
	setAttr ".tgi[6].ni[11].nvs" 18304;
	setAttr ".tgi[6].ni[12].x" 8042.85693359375;
	setAttr ".tgi[6].ni[12].y" 4777.14306640625;
	setAttr ".tgi[6].ni[12].nvs" 18304;
	setAttr ".tgi[6].ni[13].x" 8042.85693359375;
	setAttr ".tgi[6].ni[13].y" 4675.71435546875;
	setAttr ".tgi[6].ni[13].nvs" 18304;
	setAttr ".tgi[6].ni[14].x" 8042.85693359375;
	setAttr ".tgi[6].ni[14].y" 4574.28564453125;
	setAttr ".tgi[6].ni[14].nvs" 18304;
	setAttr ".tgi[6].ni[15].x" 7621.072265625;
	setAttr ".tgi[6].ni[15].y" 4579.46435546875;
	setAttr ".tgi[6].ni[15].nvs" 18305;
	setAttr ".tgi[6].ni[16].x" 8042.85693359375;
	setAttr ".tgi[6].ni[16].y" 4371.4287109375;
	setAttr ".tgi[6].ni[16].nvs" 18304;
	setAttr ".tgi[6].ni[17].x" 8042.85693359375;
	setAttr ".tgi[6].ni[17].y" 4270;
	setAttr ".tgi[6].ni[17].nvs" 18304;
	setAttr ".tgi[7].tn" -type "string" "Untitled_8";
	setAttr ".tgi[7].vl" -type "double2" 29395.031581540734 -1382.2248623407584 ;
	setAttr ".tgi[7].vh" -type "double2" 30517.720625680409 -453.65345981505595 ;
	setAttr -s 4 ".tgi[7].ni";
	setAttr ".tgi[7].ni[0].x" 29861.427734375;
	setAttr ".tgi[7].ni[0].y" -1214.2857666015625;
	setAttr ".tgi[7].ni[0].nvs" 18304;
	setAttr ".tgi[7].ni[1].x" 29702.521484375;
	setAttr ".tgi[7].ni[1].y" -564.45379638671875;
	setAttr ".tgi[7].ni[1].nvs" 18304;
	setAttr ".tgi[7].ni[2].x" 29668.908203125;
	setAttr ".tgi[7].ni[2].y" -1044.7899169921875;
	setAttr ".tgi[7].ni[2].nvs" 18304;
	setAttr ".tgi[7].ni[3].x" 30124.7890625;
	setAttr ".tgi[7].ni[3].y" -741.59661865234375;
	setAttr ".tgi[7].ni[3].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr -av ".unw" 1;
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
	setAttr -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -k on ".hwi";
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
	setAttr -k on ".hff";
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
	setAttr -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -k on ".blat";
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
	setAttr -s 6 ".st";
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
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 128 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
	setAttr -s 4 ".r";
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
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -av -k on ".an";
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
	setAttr -av -k on ".fs" 0.96;
	setAttr -av -k on ".ef" 9.6;
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
	setAttr -av ".pa";
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
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av ".ctrs" 256;
	setAttr -av ".btrs" 512;
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
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".gsn";
	setAttr -k on ".gsv";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "root_poser_aimConstraint1.cry" "root_poser.ry" -l on;
connectAttr "root_poser_aimConstraint1.crx" "root_poser.rx" -l on;
connectAttr "root_poser_aimConstraint1.crz" "root_poser.rz" -l on;
connectAttr "makeNurbSphere1.os" "root_poserShape.cr";
connectAttr "rootMiddle_orient_locator_aimConstraint1.crx" "root_poserOrient.rx"
		;
connectAttr "rootMiddle_orient_locator_aimConstraint1.cry" "root_poserOrient.ry"
		;
connectAttr "rootMiddle_orient_locator_aimConstraint1.crz" "root_poserOrient.rz"
		;
connectAttr "root_poserOrient.pim" "rootMiddle_orient_locator_aimConstraint1.cpim"
		;
connectAttr "root_poserOrient.t" "rootMiddle_orient_locator_aimConstraint1.ct";
connectAttr "root_poserOrient.rp" "rootMiddle_orient_locator_aimConstraint1.crp"
		;
connectAttr "root_poserOrient.rpt" "rootMiddle_orient_locator_aimConstraint1.crt"
		;
connectAttr "root_poserOrient.ro" "rootMiddle_orient_locator_aimConstraint1.cro"
		;
connectAttr "middle_poser.t" "rootMiddle_orient_locator_aimConstraint1.tg[0].tt"
		;
connectAttr "middle_poser.rp" "rootMiddle_orient_locator_aimConstraint1.tg[0].trp"
		;
connectAttr "middle_poser.rpt" "rootMiddle_orient_locator_aimConstraint1.tg[0].trt"
		;
connectAttr "middle_poser.pm" "rootMiddle_orient_locator_aimConstraint1.tg[0].tpm"
		;
connectAttr "rootMiddle_orient_locator_aimConstraint1.w0" "rootMiddle_orient_locator_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "rootMiddle_orient_locator_aimConstraint1.wum";
connectAttr "mirror_condition.ocr" "root_initLoc.sx";
connectAttr "root_initLoc_aimConstraint1.crx" "root_initLoc.rx";
connectAttr "root_initLoc_aimConstraint1.cry" "root_initLoc.ry";
connectAttr "root_initLoc_aimConstraint1.crz" "root_initLoc.rz";
connectAttr "root_initLoc.pim" "root_initLoc_aimConstraint1.cpim";
connectAttr "root_initLoc.t" "root_initLoc_aimConstraint1.ct";
connectAttr "root_initLoc.rp" "root_initLoc_aimConstraint1.crp";
connectAttr "root_initLoc.rpt" "root_initLoc_aimConstraint1.crt";
connectAttr "root_initLoc.ro" "root_initLoc_aimConstraint1.cro";
connectAttr "middle_poser.t" "root_initLoc_aimConstraint1.tg[0].tt";
connectAttr "middle_poser.rp" "root_initLoc_aimConstraint1.tg[0].trp";
connectAttr "middle_poser.rpt" "root_initLoc_aimConstraint1.tg[0].trt";
connectAttr "middle_poser.pm" "root_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "root_initLoc_aimConstraint1.w0" "root_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "middle_up_loc.wm" "root_initLoc_aimConstraint1.wum";
connectAttr "ik_aim_decomposeMatrix.ot" "ik_aim_initLoc.t";
connectAttr "decomposeMatrix45.or" "ik_aim_initLoc.r";
connectAttr "mirror_condition.ocr" "ik_aim_initLoc.sz";
connectAttr "decomposeMatrix25.ot" "ik_end_initLoc.t";
connectAttr "unitConversion437.o" "ik_end_initLoc.r";
connectAttr "mirror_condition.ocr" "ik_end_initLoc.sz";
connectAttr "aim_init_loc_aimConstraint1.cry" "aim_init_loc.ry";
connectAttr "aim_init_loc_aimConstraint1.crx" "aim_init_loc.rx";
connectAttr "aim_init_loc_aimConstraint1.crz" "aim_init_loc.rz";
connectAttr "aim_init_loc.pim" "aim_init_loc_aimConstraint1.cpim";
connectAttr "aim_init_loc.t" "aim_init_loc_aimConstraint1.ct";
connectAttr "aim_init_loc.rp" "aim_init_loc_aimConstraint1.crp";
connectAttr "aim_init_loc.rpt" "aim_init_loc_aimConstraint1.crt";
connectAttr "aim_init_loc.ro" "aim_init_loc_aimConstraint1.cro";
connectAttr "end_poser.t" "aim_init_loc_aimConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "aim_init_loc_aimConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "aim_init_loc_aimConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "aim_init_loc_aimConstraint1.tg[0].tpm";
connectAttr "aim_init_loc_aimConstraint1.w0" "aim_init_loc_aimConstraint1.tg[0].tw"
		;
connectAttr "root_poser.wm" "aim_init_loc_aimConstraint1.wum";
connectAttr "root_poser.pim" "root_poser_aimConstraint1.cpim";
connectAttr "root_poser.t" "root_poser_aimConstraint1.ct";
connectAttr "root_poser.rp" "root_poser_aimConstraint1.crp";
connectAttr "root_poser.rpt" "root_poser_aimConstraint1.crt";
connectAttr "root_poser.ro" "root_poser_aimConstraint1.cro";
connectAttr "middle_poser.t" "root_poser_aimConstraint1.tg[0].tt";
connectAttr "middle_poser.rp" "root_poser_aimConstraint1.tg[0].trp";
connectAttr "middle_poser.rpt" "root_poser_aimConstraint1.tg[0].trt";
connectAttr "middle_poser.pm" "root_poser_aimConstraint1.tg[0].tpm";
connectAttr "root_poser_aimConstraint1.w0" "root_poser_aimConstraint1.tg[0].tw";
connectAttr "mainPoser.wm" "root_poser_aimConstraint1.wum";
connectAttr "makeNurbSphere2.os" "middle_poserShape.cr";
connectAttr "middleEnd_orient_locator_aimConstraint1.crx" "middle_poserOrient.rx"
		;
connectAttr "middleEnd_orient_locator_aimConstraint1.cry" "middle_poserOrient.ry"
		;
connectAttr "middleEnd_orient_locator_aimConstraint1.crz" "middle_poserOrient.rz"
		;
connectAttr "middle_poserOrient.pim" "middleEnd_orient_locator_aimConstraint1.cpim"
		;
connectAttr "middle_poserOrient.t" "middleEnd_orient_locator_aimConstraint1.ct";
connectAttr "middle_poserOrient.rp" "middleEnd_orient_locator_aimConstraint1.crp"
		;
connectAttr "middle_poserOrient.rpt" "middleEnd_orient_locator_aimConstraint1.crt"
		;
connectAttr "middle_poserOrient.ro" "middleEnd_orient_locator_aimConstraint1.cro"
		;
connectAttr "end_poser.t" "middleEnd_orient_locator_aimConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "middleEnd_orient_locator_aimConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "middleEnd_orient_locator_aimConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "middleEnd_orient_locator_aimConstraint1.tg[0].tpm";
connectAttr "middleEnd_orient_locator_aimConstraint1.w0" "middleEnd_orient_locator_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion432.o" "middleEnd_orient_locator_aimConstraint1.ox";
connectAttr "root_poser.wm" "middleEnd_orient_locator_aimConstraint1.wum";
connectAttr "mirror_condition.ocr" "middle_initLoc.sx";
connectAttr "middleRoot_orient_locator1_aimConstraint1.crx" "root_twist_angleLoc_1.rx"
		;
connectAttr "middleRoot_orient_locator1_aimConstraint1.cry" "root_twist_angleLoc_1.ry"
		;
connectAttr "middleRoot_orient_locator1_aimConstraint1.crz" "root_twist_angleLoc_1.rz"
		;
connectAttr "root_twist_angleLoc_1.pim" "middleRoot_orient_locator1_aimConstraint1.cpim"
		;
connectAttr "root_twist_angleLoc_1.t" "middleRoot_orient_locator1_aimConstraint1.ct"
		;
connectAttr "root_twist_angleLoc_1.rp" "middleRoot_orient_locator1_aimConstraint1.crp"
		;
connectAttr "root_twist_angleLoc_1.rpt" "middleRoot_orient_locator1_aimConstraint1.crt"
		;
connectAttr "root_twist_angleLoc_1.ro" "middleRoot_orient_locator1_aimConstraint1.cro"
		;
connectAttr "root_poser.t" "middleRoot_orient_locator1_aimConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "middleRoot_orient_locator1_aimConstraint1.tg[0].trp"
		;
connectAttr "root_poser.rpt" "middleRoot_orient_locator1_aimConstraint1.tg[0].trt"
		;
connectAttr "root_poser.pm" "middleRoot_orient_locator1_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleRoot_orient_locator1_aimConstraint1.w0" "middleRoot_orient_locator1_aimConstraint1.tg[0].tw"
		;
connectAttr "end_poser.wm" "middleRoot_orient_locator1_aimConstraint1.wum";
connectAttr "startAngleLoc2_aimConstraint1.crx" "root_twist_angleLoc_2.rx";
connectAttr "startAngleLoc2_aimConstraint1.cry" "root_twist_angleLoc_2.ry";
connectAttr "startAngleLoc2_aimConstraint1.crz" "root_twist_angleLoc_2.rz";
connectAttr "root_twist_angleLoc_2.pim" "startAngleLoc2_aimConstraint1.cpim";
connectAttr "root_twist_angleLoc_2.t" "startAngleLoc2_aimConstraint1.ct";
connectAttr "root_twist_angleLoc_2.rp" "startAngleLoc2_aimConstraint1.crp";
connectAttr "root_twist_angleLoc_2.rpt" "startAngleLoc2_aimConstraint1.crt";
connectAttr "root_twist_angleLoc_2.ro" "startAngleLoc2_aimConstraint1.cro";
connectAttr "root_poser.t" "startAngleLoc2_aimConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "startAngleLoc2_aimConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "startAngleLoc2_aimConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "startAngleLoc2_aimConstraint1.tg[0].tpm";
connectAttr "startAngleLoc2_aimConstraint1.w0" "startAngleLoc2_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "startAngleLoc2_aimConstraint1.wum";
connectAttr "makeNurbSphere3.os" "end_poserNurbsShape.cr";
connectAttr "mirror_condition.ocr" "end_initLoc.sx";
connectAttr "unitConversion434.o" "end_poserOrient.r";
connectAttr "mainPoser.size" "mainPoser_clusterHandle.sx";
connectAttr "mainPoser.size" "mainPoser_clusterHandle.sy";
connectAttr "mainPoser.size" "mainPoser_clusterHandle.sz";
connectAttr "end_poser.tx" "end_pose_loc.tx";
connectAttr "end_poser.ty" "end_pose_loc.ty";
connectAttr "end_poser.tz" "end_pose_loc.tz";
connectAttr "root_poserOrient_locShape.wp" "posers_curveShape.cp[0]";
connectAttr "middle_poserOrient_locShape.wp" "posers_curveShape.cp[1]";
connectAttr "end_initLocShape.wp" "posers_curveShape.cp[2]";
connectAttr "pasted__sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "decomposeMatrix31.otx" "ik_connector_main.tx";
connectAttr "decomposeMatrix31.oty" "ik_connector_main.ty";
connectAttr "decomposeMatrix31.otz" "ik_connector_main.tz";
connectAttr "decomposeMatrix31.orx" "ik_connector_main.rx";
connectAttr "decomposeMatrix31.ory" "ik_connector_main.ry";
connectAttr "decomposeMatrix31.orz" "ik_connector_main.rz";
connectAttr "decomposeMatrix31.osx" "ik_connector_main.sx";
connectAttr "decomposeMatrix31.osy" "ik_connector_main.sy";
connectAttr "decomposeMatrix31.osz" "ik_connector_main.sz";
connectAttr "root_decMat.otx" "root_connector_init.tx";
connectAttr "root_decMat.oty" "root_connector_init.ty";
connectAttr "root_decMat.otz" "root_connector_init.tz";
connectAttr "root_decMat.orx" "root_connector_init.rx";
connectAttr "root_decMat.ory" "root_connector_init.ry";
connectAttr "root_decMat.orz" "root_connector_init.rz";
connectAttr "root_decMat.osx" "root_connector_init.sx";
connectAttr "root_decMat.osy" "root_connector_init.sy";
connectAttr "root_decMat.osz" "root_connector_init.sz";
connectAttr "aim_world_connector_multMatrix.o" "aim_world_connector.opm";
connectAttr "root_connector_decomposeMatrix.ory" "controls.ry";
connectAttr "root_connector_decomposeMatrix.orz" "controls.rz";
connectAttr "root_connector_decomposeMatrix.orx" "controls.rx";
connectAttr "root_connector_decomposeMatrix.osy" "controls.sy";
connectAttr "root_connector_decomposeMatrix.osz" "controls.sz";
connectAttr "root_connector_decomposeMatrix.osx" "controls.sx";
connectAttr "root_connector_decomposeMatrix.oty" "controls.ty";
connectAttr "root_connector_decomposeMatrix.otz" "controls.tz";
connectAttr "root_connector_decomposeMatrix.otx" "controls.tx";
connectAttr "control_group_decomposeMatrix.or" "control_group.r";
connectAttr "control_group_decomposeMatrix.ot" "control_group.t";
connectAttr "control_group_decomposeMatrix.os" "control_group.s";
connectAttr "ikFk_reverse.ox" "fk_controls.v";
connectAttr "initScale1_mult.o" "fk_b_group.tx";
connectAttr "fk_end_group_decomposeMatrix.or" "fk_b_group.r";
connectAttr "initScaleEnd_mult.o" "fk_end_group.tx";
connectAttr "fk_b_group_decomposeMatrix.or" "fk_end_group.r";
connectAttr "mirror_condition.ocr" "end_fkJoint.sx";
connectAttr "control.ikFk" "ik_controls.v";
connectAttr "decomposeMatrix25.ot" "ik_end_init.t";
connectAttr "unitConversion437.o" "ik_end_init.r";
connectAttr "mirror_condition.ocr" "ik_end_mirror.sz";
connectAttr "ik_connector.t" "ik_end_out_init.t";
connectAttr "mirror_condition.ocr" "ik_end_out.sy";
connectAttr "unitConversion431.o" "ik_end_out.rx";
connectAttr "unitConversion440.o" "ik_end_out.ry";
connectAttr "curveStart_locatorShape.wp" "aim_curveShape.cp[0]";
connectAttr "curveEnd_locatorShape.wp" "aim_curveShape.cp[1]";
connectAttr "ik_aim_decomposeMatrix.ot" "ik_aim_init.t";
connectAttr "decomposeMatrix45.orx" "ik_aim_init.rx";
connectAttr "decomposeMatrix45.ory" "ik_aim_init.ry";
connectAttr "decomposeMatrix45.orz" "ik_aim_init.rz";
connectAttr "mirror_condition.ocr" "ik_aim_mirror.sz";
connectAttr "middle_group_parentConstraint1.ctx" "middle_group.tx";
connectAttr "middle_group_parentConstraint1.cty" "middle_group.ty";
connectAttr "middle_group_parentConstraint1.ctz" "middle_group.tz";
connectAttr "middle_group_parentConstraint1.crx" "middle_group.rx";
connectAttr "middle_group_parentConstraint1.cry" "middle_group.ry";
connectAttr "middle_group_parentConstraint1.crz" "middle_group.rz";
connectAttr "mirror_condition.ocr" "middle_group.sy";
connectAttr "mirror_condition.ocr" "middle_group.sz";
connectAttr "bifrostGraphShape.main_bend_center" "curve1_2_offset.t";
connectAttr "bifrostGraphShape.corner_wide_negated" "locator2.tx";
connectAttr "bifrostGraphShape.corner_wide" "locator3.tx";
connectAttr "mirror_condition.ocr" "middleBend_hardLoc.sy";
connectAttr "middle_group.ro" "middle_group_parentConstraint1.cro";
connectAttr "middle_group.pim" "middle_group_parentConstraint1.cpim";
connectAttr "middle_group.rp" "middle_group_parentConstraint1.crp";
connectAttr "middle_group.rpt" "middle_group_parentConstraint1.crt";
connectAttr "middle_locator.t" "middle_group_parentConstraint1.tg[0].tt";
connectAttr "middle_locator.rp" "middle_group_parentConstraint1.tg[0].trp";
connectAttr "middle_locator.rpt" "middle_group_parentConstraint1.tg[0].trt";
connectAttr "middle_locator.r" "middle_group_parentConstraint1.tg[0].tr";
connectAttr "middle_locator.ro" "middle_group_parentConstraint1.tg[0].tro";
connectAttr "middle_locator.s" "middle_group_parentConstraint1.tg[0].ts";
connectAttr "middle_locator.pm" "middle_group_parentConstraint1.tg[0].tpm";
connectAttr "middle_group_parentConstraint1.w0" "middle_group_parentConstraint1.tg[0].tw"
		;
connectAttr "end_group_pointConstraint1.ctx" "end_group.tx";
connectAttr "end_group_pointConstraint1.cty" "end_group.ty";
connectAttr "end_group_pointConstraint1.ctz" "end_group.tz";
connectAttr "end_group_aimConstraint1.crx" "end_group.rx";
connectAttr "end_group_aimConstraint1.cry" "end_group.ry";
connectAttr "end_group_aimConstraint1.crz" "end_group.rz";
connectAttr "end_group.pim" "end_group_pointConstraint1.cpim";
connectAttr "end_group.rp" "end_group_pointConstraint1.crp";
connectAttr "end_group.rpt" "end_group_pointConstraint1.crt";
connectAttr "end_finalJoint.t" "end_group_pointConstraint1.tg[0].tt";
connectAttr "end_finalJoint.rp" "end_group_pointConstraint1.tg[0].trp";
connectAttr "end_finalJoint.rpt" "end_group_pointConstraint1.tg[0].trt";
connectAttr "end_finalJoint.pm" "end_group_pointConstraint1.tg[0].tpm";
connectAttr "end_group_pointConstraint1.w0" "end_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_group.pim" "end_group_aimConstraint1.cpim";
connectAttr "end_group.t" "end_group_aimConstraint1.ct";
connectAttr "end_group.rp" "end_group_aimConstraint1.crp";
connectAttr "end_group.rpt" "end_group_aimConstraint1.crt";
connectAttr "end_group.ro" "end_group_aimConstraint1.cro";
connectAttr "locator3.t" "end_group_aimConstraint1.tg[1].tt";
connectAttr "locator3.rp" "end_group_aimConstraint1.tg[1].trp";
connectAttr "locator3.rpt" "end_group_aimConstraint1.tg[1].trt";
connectAttr "locator3.pm" "end_group_aimConstraint1.tg[1].tpm";
connectAttr "end_group_aimConstraint1.w1" "end_group_aimConstraint1.tg[1].tw";
connectAttr "b_finalJoint.wm" "end_group_aimConstraint1.wum";
connectAttr "bifrostGraphShape.main_bend_lower" "curve1_3_offset.t";
connectAttr "middle.mainBendControls" "curve1_3_offset.v";
connectAttr "bifrostGraphShape.out_lower_slide_1" "lowerBend_1_hardLoc.tx";
connectAttr "bifrostGraphShape.out_lower_slide_2" "lowerBend_2_hardLoc.tx";
connectAttr "bifrostGraphShape.out_lower_slide_3" "lowerBend_3_hardLoc.tx";
connectAttr "root_group_pointConstraint1.ctx" "root_group.tx";
connectAttr "root_group_pointConstraint1.cty" "root_group.ty";
connectAttr "root_group_pointConstraint1.ctz" "root_group.tz";
connectAttr "root_group_aimConstraint1.crx" "root_group.rx";
connectAttr "root_group_aimConstraint1.cry" "root_group.ry";
connectAttr "root_group_aimConstraint1.crz" "root_group.rz";
connectAttr "root_group.pim" "root_group_aimConstraint1.cpim";
connectAttr "root_group.t" "root_group_aimConstraint1.ct";
connectAttr "root_group.rp" "root_group_aimConstraint1.crp";
connectAttr "root_group.rpt" "root_group_aimConstraint1.crt";
connectAttr "root_group.ro" "root_group_aimConstraint1.cro";
connectAttr "locator2.t" "root_group_aimConstraint1.tg[1].tt";
connectAttr "locator2.rp" "root_group_aimConstraint1.tg[1].trp";
connectAttr "locator2.rpt" "root_group_aimConstraint1.tg[1].trt";
connectAttr "locator2.pm" "root_group_aimConstraint1.tg[1].tpm";
connectAttr "root_group_aimConstraint1.w1" "root_group_aimConstraint1.tg[1].tw";
connectAttr "a_finalJoint.wm" "root_group_aimConstraint1.wum";
connectAttr "root_group.pim" "root_group_pointConstraint1.cpim";
connectAttr "root_group.rp" "root_group_pointConstraint1.crp";
connectAttr "root_group.rpt" "root_group_pointConstraint1.crt";
connectAttr "a_finalJoint.t" "root_group_pointConstraint1.tg[0].tt";
connectAttr "a_finalJoint.rp" "root_group_pointConstraint1.tg[0].trp";
connectAttr "a_finalJoint.rpt" "root_group_pointConstraint1.tg[0].trt";
connectAttr "a_finalJoint.pm" "root_group_pointConstraint1.tg[0].tpm";
connectAttr "root_group_pointConstraint1.w0" "root_group_pointConstraint1.tg[0].tw"
		;
connectAttr "bifrostGraphShape.main_bend_upper" "curve1_1_offset.t";
connectAttr "middle.mainBendControls" "curve1_1_offset.v";
connectAttr "bifrostGraphShape.out_upper_slide_3" "upperBend_1_hardLoc.tx";
connectAttr "bifrostGraphShape.out_upper_slide_2" "upperBend_2_hardLoc.tx";
connectAttr "bifrostGraphShape.out_upper_slide_1" "upperBend_3_hardLoc.tx";
connectAttr "middle.addBendControls" "offset_group.v";
connectAttr "bifrostGraphShape.bend_lower_1" "lower_curve_1_offset.t";
connectAttr "blendMatrix6.omat" "lower_curve_1_offset.opm";
connectAttr "unitConversion448.o" "lower_curve_1_offset.ry";
connectAttr "bifrostGraphShape.bend_lower_2" "lower_curve_2_offset.t";
connectAttr "blendMatrix5.omat" "lower_curve_2_offset.opm";
connectAttr "bifrostGraphShape.bend_lower_3" "lower_curve_3_offset.t";
connectAttr "blendMatrix8.omat" "lower_curve_3_offset.opm";
connectAttr "unitConversion449.o" "lower_curve_3_offset.ry";
connectAttr "blendMatrix4.omat" "upper_curve_4_offset.opm";
connectAttr "bifrostGraphShape.corner_wide_out" "upper_curve_4_offset.tz";
connectAttr "twistDown_root_connector_aimConstraint1.crx" "twistDown_root_connector.rx"
		;
connectAttr "twistDown_root_connector_aimConstraint1.cry" "twistDown_root_connector.ry"
		;
connectAttr "twistDown_root_connector_aimConstraint1.crz" "twistDown_root_connector.rz"
		;
connectAttr "twistDown_end_connector_parentConstraint1.ctx" "twistDown_end_connector.tx"
		;
connectAttr "twistDown_end_connector_parentConstraint1.cty" "twistDown_end_connector.ty"
		;
connectAttr "twistDown_end_connector_parentConstraint1.ctz" "twistDown_end_connector.tz"
		;
connectAttr "twistDown_end_connector_parentConstraint1.crx" "twistDown_end_connector.rx"
		;
connectAttr "twistDown_end_connector_parentConstraint1.cry" "twistDown_end_connector.ry"
		;
connectAttr "twistDown_end_connector_parentConstraint1.crz" "twistDown_end_connector.rz"
		;
connectAttr "twistDown_end_connector.ro" "twistDown_end_connector_parentConstraint1.cro"
		;
connectAttr "twistDown_end_connector.pim" "twistDown_end_connector_parentConstraint1.cpim"
		;
connectAttr "twistDown_end_connector.rp" "twistDown_end_connector_parentConstraint1.crp"
		;
connectAttr "twistDown_end_connector.rpt" "twistDown_end_connector_parentConstraint1.crt"
		;
connectAttr "end_finalJoint.t" "twistDown_end_connector_parentConstraint1.tg[0].tt"
		;
connectAttr "end_finalJoint.rp" "twistDown_end_connector_parentConstraint1.tg[0].trp"
		;
connectAttr "end_finalJoint.rpt" "twistDown_end_connector_parentConstraint1.tg[0].trt"
		;
connectAttr "end_finalJoint.r" "twistDown_end_connector_parentConstraint1.tg[0].tr"
		;
connectAttr "end_finalJoint.ro" "twistDown_end_connector_parentConstraint1.tg[0].tro"
		;
connectAttr "end_finalJoint.s" "twistDown_end_connector_parentConstraint1.tg[0].ts"
		;
connectAttr "end_finalJoint.pm" "twistDown_end_connector_parentConstraint1.tg[0].tpm"
		;
connectAttr "end_finalJoint.jo" "twistDown_end_connector_parentConstraint1.tg[0].tjo"
		;
connectAttr "end_finalJoint.ssc" "twistDown_end_connector_parentConstraint1.tg[0].tsc"
		;
connectAttr "end_finalJoint.is" "twistDown_end_connector_parentConstraint1.tg[0].tis"
		;
connectAttr "twistDown_end_connector_parentConstraint1.w0" "twistDown_end_connector_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion453.o" "twistDown_end_connector_parentConstraint1.tg[0].tory"
		;
connectAttr "twistDown_quatToEuler2.ort" "twistDown_startUp_loc.r";
connectAttr "twistDown_end_connector.t" "twistDown_endUp_loc.t";
connectAttr "twistDown_quatToEuler1.ort" "twistDown_endUp_loc.r";
connectAttr "twistDown_root_connector.pim" "twistDown_root_connector_aimConstraint1.cpim"
		;
connectAttr "twistDown_root_connector.t" "twistDown_root_connector_aimConstraint1.ct"
		;
connectAttr "twistDown_root_connector.rp" "twistDown_root_connector_aimConstraint1.crp"
		;
connectAttr "twistDown_root_connector.rpt" "twistDown_root_connector_aimConstraint1.crt"
		;
connectAttr "twistDown_root_connector.ro" "twistDown_root_connector_aimConstraint1.cro"
		;
connectAttr "end_finalJoint.t" "twistDown_root_connector_aimConstraint1.tg[0].tt"
		;
connectAttr "end_finalJoint.rp" "twistDown_root_connector_aimConstraint1.tg[0].trp"
		;
connectAttr "end_finalJoint.rpt" "twistDown_root_connector_aimConstraint1.tg[0].trt"
		;
connectAttr "end_finalJoint.pm" "twistDown_root_connector_aimConstraint1.tg[0].tpm"
		;
connectAttr "twistDown_root_connector_aimConstraint1.w0" "twistDown_root_connector_aimConstraint1.tg[0].tw"
		;
connectAttr "middle.wm" "twistDown_root_connector_aimConstraint1.wum";
connectAttr "bifrostGraphShape.bend_upper_3" "upper_curve_3_offset.t";
connectAttr "blendMatrix3.omat" "upper_curve_3_offset.opm";
connectAttr "unitConversion450.o" "upper_curve_3_offset.ry";
connectAttr "bifrostGraphShape.bend_upper_2" "upper_curve_2_offset.t";
connectAttr "blendMatrix2.omat" "upper_curve_2_offset.opm";
connectAttr "bifrostGraphShape.bend_upper_1" "upper_curve_1_offset.t";
connectAttr "blendMatrix1.omat" "upper_curve_1_offset.opm";
connectAttr "unitConversion451.o" "upper_curve_1_offset.ry";
connectAttr "root_connector_decomposeMatrix.osx" "ik_joints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "ik_joints.sy";
connectAttr "root_connector_decomposeMatrix.osz" "ik_joints.sz";
connectAttr "root_connector_decomposeMatrix.otx" "ik_joints.tx";
connectAttr "root_connector_decomposeMatrix.oty" "ik_joints.ty";
connectAttr "root_connector_decomposeMatrix.otz" "ik_joints.tz";
connectAttr "root_connector_decomposeMatrix.orx" "ik_joints.rx";
connectAttr "root_connector_decomposeMatrix.ory" "ik_joints.ry";
connectAttr "root_connector_decomposeMatrix.orz" "ik_joints.rz";
connectAttr "ik_root.ty" "a_ikJoint.ty";
connectAttr "ik_root.tz" "a_ikJoint.tz";
connectAttr "ik_root.tx" "a_ikJoint.tx";
connectAttr "snap_blend.opr" "b_ikJoint.tx";
connectAttr "a_ikJoint.s" "b_ikJoint.is";
connectAttr "snap_blend.opg" "end_ikJoint.tx";
connectAttr "decomposeMatrix33.orx" "end_ikJoint.rx";
connectAttr "decomposeMatrix33.ory" "end_ikJoint.ry";
connectAttr "decomposeMatrix33.orz" "end_ikJoint.rz";
connectAttr "b_ikJoint.s" "end_ikJoint.is";
connectAttr "end_ikJoint.tx" "effector.tx";
connectAttr "end_ikJoint.ty" "effector.ty";
connectAttr "end_ikJoint.tz" "effector.tz";
connectAttr "a_ikJoint.msg" "ikHandle.hsj";
connectAttr "effector.hp" "ikHandle.hee";
connectAttr "ikRPsolver1.msg" "ikHandle.hsv";
connectAttr "ikHandle_poleVectorConstraint1.ctx" "ikHandle.pvx";
connectAttr "ikHandle_poleVectorConstraint1.cty" "ikHandle.pvy";
connectAttr "ikHandle_poleVectorConstraint1.ctz" "ikHandle.pvz";
connectAttr "decomposeMatrix41.otx" "ikHandle.tx";
connectAttr "decomposeMatrix41.oty" "ikHandle.ty";
connectAttr "decomposeMatrix41.otz" "ikHandle.tz";
connectAttr "ikHandle.pim" "ikHandle_poleVectorConstraint1.cpim";
connectAttr "a_ikJoint.pm" "ikHandle_poleVectorConstraint1.ps";
connectAttr "a_ikJoint.t" "ikHandle_poleVectorConstraint1.crp";
connectAttr "ik_aim.t" "ikHandle_poleVectorConstraint1.tg[0].tt";
connectAttr "ik_aim.rp" "ikHandle_poleVectorConstraint1.tg[0].trp";
connectAttr "ik_aim.rpt" "ikHandle_poleVectorConstraint1.tg[0].trt";
connectAttr "ik_aim.pm" "ikHandle_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle_poleVectorConstraint1.w0" "ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "root_connector_decomposeMatrix.osx" "final_joints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "final_joints.sy";
connectAttr "multDoubleLinear435.o" "final_joints.sz";
connectAttr "a_joint_parentConstraint1.cty" "a_finalJoint.ty";
connectAttr "a_joint_parentConstraint1.ctz" "a_finalJoint.tz";
connectAttr "a_joint_parentConstraint1.ctx" "a_finalJoint.tx";
connectAttr "a_joint_parentConstraint1.cry" "a_finalJoint.ry";
connectAttr "a_joint_parentConstraint1.crz" "a_finalJoint.rz";
connectAttr "a_joint_parentConstraint1.crx" "a_finalJoint.rx";
connectAttr "b_joint_parentConstraint1.cty" "b_finalJoint.ty";
connectAttr "b_joint_parentConstraint1.ctz" "b_finalJoint.tz";
connectAttr "b_joint_parentConstraint1.ctx" "b_finalJoint.tx";
connectAttr "b_joint_parentConstraint1.cry" "b_finalJoint.ry";
connectAttr "b_joint_parentConstraint1.crz" "b_finalJoint.rz";
connectAttr "b_joint_parentConstraint1.crx" "b_finalJoint.rx";
connectAttr "a_finalJoint.s" "b_finalJoint.is";
connectAttr "end_joint_parentConstraint1.cty" "end_finalJoint.ty";
connectAttr "end_joint_parentConstraint1.ctz" "end_finalJoint.tz";
connectAttr "end_joint_parentConstraint1.ctx" "end_finalJoint.tx";
connectAttr "end_joint_parentConstraint1.cry" "end_finalJoint.ry";
connectAttr "end_joint_parentConstraint1.crz" "end_finalJoint.rz";
connectAttr "end_joint_parentConstraint1.crx" "end_finalJoint.rx";
connectAttr "b_finalJoint.s" "end_finalJoint.is";
connectAttr "end_finalJoint.ro" "end_joint_parentConstraint1.cro";
connectAttr "end_finalJoint.pim" "end_joint_parentConstraint1.cpim";
connectAttr "end_finalJoint.rp" "end_joint_parentConstraint1.crp";
connectAttr "end_finalJoint.rpt" "end_joint_parentConstraint1.crt";
connectAttr "end_finalJoint.jo" "end_joint_parentConstraint1.cjo";
connectAttr "end_fkJoint.t" "end_joint_parentConstraint1.tg[0].tt";
connectAttr "end_fkJoint.rp" "end_joint_parentConstraint1.tg[0].trp";
connectAttr "end_fkJoint.rpt" "end_joint_parentConstraint1.tg[0].trt";
connectAttr "end_fkJoint.r" "end_joint_parentConstraint1.tg[0].tr";
connectAttr "end_fkJoint.ro" "end_joint_parentConstraint1.tg[0].tro";
connectAttr "end_fkJoint.s" "end_joint_parentConstraint1.tg[0].ts";
connectAttr "end_fkJoint.pm" "end_joint_parentConstraint1.tg[0].tpm";
connectAttr "end_fkJoint.jo" "end_joint_parentConstraint1.tg[0].tjo";
connectAttr "end_joint_parentConstraint1.w0" "end_joint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion443.o" "end_joint_parentConstraint1.tg[0].torx";
connectAttr "end_ikJoint.t" "end_joint_parentConstraint1.tg[1].tt";
connectAttr "end_ikJoint.rp" "end_joint_parentConstraint1.tg[1].trp";
connectAttr "end_ikJoint.rpt" "end_joint_parentConstraint1.tg[1].trt";
connectAttr "end_ikJoint.r" "end_joint_parentConstraint1.tg[1].tr";
connectAttr "end_ikJoint.ro" "end_joint_parentConstraint1.tg[1].tro";
connectAttr "end_ikJoint.s" "end_joint_parentConstraint1.tg[1].ts";
connectAttr "end_ikJoint.pm" "end_joint_parentConstraint1.tg[1].tpm";
connectAttr "end_ikJoint.jo" "end_joint_parentConstraint1.tg[1].tjo";
connectAttr "end_joint_parentConstraint1.w1" "end_joint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion444.o" "end_joint_parentConstraint1.tg[1].tory";
connectAttr "unitConversion444.o" "end_joint_parentConstraint1.tg[1].torx";
connectAttr "unitConversion444.o" "end_joint_parentConstraint1.tg[1].torz";
connectAttr "ikFk_reverse.ox" "end_joint_parentConstraint1.w0";
connectAttr "control.ikFk" "end_joint_parentConstraint1.w1";
connectAttr "b_finalJoint.ro" "b_joint_parentConstraint1.cro";
connectAttr "b_finalJoint.pim" "b_joint_parentConstraint1.cpim";
connectAttr "b_finalJoint.rp" "b_joint_parentConstraint1.crp";
connectAttr "b_finalJoint.rpt" "b_joint_parentConstraint1.crt";
connectAttr "b_finalJoint.jo" "b_joint_parentConstraint1.cjo";
connectAttr "b_ikJoint.t" "b_joint_parentConstraint1.tg[0].tt";
connectAttr "b_ikJoint.rp" "b_joint_parentConstraint1.tg[0].trp";
connectAttr "b_ikJoint.rpt" "b_joint_parentConstraint1.tg[0].trt";
connectAttr "b_ikJoint.r" "b_joint_parentConstraint1.tg[0].tr";
connectAttr "b_ikJoint.ro" "b_joint_parentConstraint1.tg[0].tro";
connectAttr "b_ikJoint.s" "b_joint_parentConstraint1.tg[0].ts";
connectAttr "b_ikJoint.pm" "b_joint_parentConstraint1.tg[0].tpm";
connectAttr "b_ikJoint.jo" "b_joint_parentConstraint1.tg[0].tjo";
connectAttr "b_joint_parentConstraint1.w0" "b_joint_parentConstraint1.tg[0].tw";
connectAttr "unitConversion443.o" "b_joint_parentConstraint1.tg[0].torx";
connectAttr "b_fkJoint.t" "b_joint_parentConstraint1.tg[1].tt";
connectAttr "b_fkJoint.rp" "b_joint_parentConstraint1.tg[1].trp";
connectAttr "b_fkJoint.rpt" "b_joint_parentConstraint1.tg[1].trt";
connectAttr "b_fkJoint.r" "b_joint_parentConstraint1.tg[1].tr";
connectAttr "b_fkJoint.ro" "b_joint_parentConstraint1.tg[1].tro";
connectAttr "b_fkJoint.s" "b_joint_parentConstraint1.tg[1].ts";
connectAttr "b_fkJoint.pm" "b_joint_parentConstraint1.tg[1].tpm";
connectAttr "b_fkJoint.jo" "b_joint_parentConstraint1.tg[1].tjo";
connectAttr "b_joint_parentConstraint1.w1" "b_joint_parentConstraint1.tg[1].tw";
connectAttr "unitConversion443.o" "b_joint_parentConstraint1.tg[1].torx";
connectAttr "control.ikFk" "b_joint_parentConstraint1.w0";
connectAttr "ikFk_reverse.ox" "b_joint_parentConstraint1.w1";
connectAttr "mirror_condition.ocr" "fk_b_ikFkSwitchHelper.sx";
connectAttr "locator1_orientConstraint1.crx" "middle_locator.rx";
connectAttr "locator1_orientConstraint1.cry" "middle_locator.ry";
connectAttr "locator1_orientConstraint1.crz" "middle_locator.rz";
connectAttr "middle_locator.ro" "locator1_orientConstraint1.cro";
connectAttr "middle_locator.pim" "locator1_orientConstraint1.cpim";
connectAttr "a_finalJoint.r" "locator1_orientConstraint1.tg[0].tr";
connectAttr "a_finalJoint.ro" "locator1_orientConstraint1.tg[0].tro";
connectAttr "a_finalJoint.pm" "locator1_orientConstraint1.tg[0].tpm";
connectAttr "a_finalJoint.jo" "locator1_orientConstraint1.tg[0].tjo";
connectAttr "locator1_orientConstraint1.w0" "locator1_orientConstraint1.tg[0].tw"
		;
connectAttr "b_finalJoint.r" "locator1_orientConstraint1.tg[1].tr";
connectAttr "b_finalJoint.ro" "locator1_orientConstraint1.tg[1].tro";
connectAttr "b_finalJoint.pm" "locator1_orientConstraint1.tg[1].tpm";
connectAttr "b_finalJoint.jo" "locator1_orientConstraint1.tg[1].tjo";
connectAttr "locator1_orientConstraint1.w1" "locator1_orientConstraint1.tg[1].tw"
		;
connectAttr "b_finalJoint.s" "middle_volume_outJoint.is";
connectAttr "volume_blendColors.opg" "middle_volume_outJoint.sy";
connectAttr "volume_blendColors.opg" "middle_volume_outJoint.sz";
connectAttr "a_finalJoint.ro" "a_joint_parentConstraint1.cro";
connectAttr "a_finalJoint.pim" "a_joint_parentConstraint1.cpim";
connectAttr "a_finalJoint.rp" "a_joint_parentConstraint1.crp";
connectAttr "a_finalJoint.rpt" "a_joint_parentConstraint1.crt";
connectAttr "a_finalJoint.jo" "a_joint_parentConstraint1.cjo";
connectAttr "a_fkJoint.t" "a_joint_parentConstraint1.tg[0].tt";
connectAttr "a_fkJoint.rp" "a_joint_parentConstraint1.tg[0].trp";
connectAttr "a_fkJoint.rpt" "a_joint_parentConstraint1.tg[0].trt";
connectAttr "a_fkJoint.r" "a_joint_parentConstraint1.tg[0].tr";
connectAttr "a_fkJoint.ro" "a_joint_parentConstraint1.tg[0].tro";
connectAttr "a_fkJoint.s" "a_joint_parentConstraint1.tg[0].ts";
connectAttr "a_fkJoint.pm" "a_joint_parentConstraint1.tg[0].tpm";
connectAttr "a_fkJoint.jo" "a_joint_parentConstraint1.tg[0].tjo";
connectAttr "a_joint_parentConstraint1.w0" "a_joint_parentConstraint1.tg[0].tw";
connectAttr "unitConversion443.o" "a_joint_parentConstraint1.tg[0].torx";
connectAttr "a_ikJoint.t" "a_joint_parentConstraint1.tg[1].tt";
connectAttr "a_ikJoint.rp" "a_joint_parentConstraint1.tg[1].trp";
connectAttr "a_ikJoint.rpt" "a_joint_parentConstraint1.tg[1].trt";
connectAttr "a_ikJoint.r" "a_joint_parentConstraint1.tg[1].tr";
connectAttr "a_ikJoint.ro" "a_joint_parentConstraint1.tg[1].tro";
connectAttr "a_ikJoint.s" "a_joint_parentConstraint1.tg[1].ts";
connectAttr "a_ikJoint.pm" "a_joint_parentConstraint1.tg[1].tpm";
connectAttr "a_ikJoint.jo" "a_joint_parentConstraint1.tg[1].tjo";
connectAttr "a_joint_parentConstraint1.w1" "a_joint_parentConstraint1.tg[1].tw";
connectAttr "unitConversion443.o" "a_joint_parentConstraint1.tg[1].torx";
connectAttr "ikFk_reverse.ox" "a_joint_parentConstraint1.w0";
connectAttr "control.ikFk" "a_joint_parentConstraint1.w1";
connectAttr "mirror_condition.ocr" "fk_a_ikFkSwitchHelper.sx";
connectAttr "twistUp_root_connector_aimConstraint1.crx" "twistUp_root_connector.rx"
		;
connectAttr "twistUp_root_connector_aimConstraint1.cry" "twistUp_root_connector.ry"
		;
connectAttr "twistUp_root_connector_aimConstraint1.crz" "twistUp_root_connector.rz"
		;
connectAttr "end_connector_parentConstraint1.ctx" "twistUp_end_connector.tx";
connectAttr "end_connector_parentConstraint1.cty" "twistUp_end_connector.ty";
connectAttr "end_connector_parentConstraint1.ctz" "twistUp_end_connector.tz";
connectAttr "end_connector_parentConstraint1.crx" "twistUp_end_connector.rx";
connectAttr "end_connector_parentConstraint1.cry" "twistUp_end_connector.ry";
connectAttr "end_connector_parentConstraint1.crz" "twistUp_end_connector.rz";
connectAttr "twistUp_end_connector.ro" "end_connector_parentConstraint1.cro";
connectAttr "twistUp_end_connector.pim" "end_connector_parentConstraint1.cpim";
connectAttr "twistUp_end_connector.rp" "end_connector_parentConstraint1.crp";
connectAttr "twistUp_end_connector.rpt" "end_connector_parentConstraint1.crt";
connectAttr "middle.t" "end_connector_parentConstraint1.tg[0].tt";
connectAttr "middle.rp" "end_connector_parentConstraint1.tg[0].trp";
connectAttr "middle.rpt" "end_connector_parentConstraint1.tg[0].trt";
connectAttr "middle.r" "end_connector_parentConstraint1.tg[0].tr";
connectAttr "middle.ro" "end_connector_parentConstraint1.tg[0].tro";
connectAttr "middle.s" "end_connector_parentConstraint1.tg[0].ts";
connectAttr "middle.pm" "end_connector_parentConstraint1.tg[0].tpm";
connectAttr "end_connector_parentConstraint1.w0" "end_connector_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion453.o" "end_connector_parentConstraint1.tg[0].torz";
connectAttr "twistUp_quatToEuler2.ort" "twistUp_startUp_loc.r";
connectAttr "twistUp_root_connector.pim" "twistUp_root_connector_aimConstraint1.cpim"
		;
connectAttr "twistUp_root_connector.t" "twistUp_root_connector_aimConstraint1.ct"
		;
connectAttr "twistUp_root_connector.rp" "twistUp_root_connector_aimConstraint1.crp"
		;
connectAttr "twistUp_root_connector.rpt" "twistUp_root_connector_aimConstraint1.crt"
		;
connectAttr "twistUp_root_connector.ro" "twistUp_root_connector_aimConstraint1.cro"
		;
connectAttr "middle.t" "twistUp_root_connector_aimConstraint1.tg[0].tt";
connectAttr "middle.rp" "twistUp_root_connector_aimConstraint1.tg[0].trp";
connectAttr "middle.rpt" "twistUp_root_connector_aimConstraint1.tg[0].trt";
connectAttr "middle.pm" "twistUp_root_connector_aimConstraint1.tg[0].tpm";
connectAttr "twistUp_root_connector_aimConstraint1.w0" "twistUp_root_connector_aimConstraint1.tg[0].tw"
		;
connectAttr "a_finalJoint.wm" "twistUp_root_connector_aimConstraint1.wum";
connectAttr "volume_blendColors.opr" "root_volume_outJoint.sy";
connectAttr "volume_blendColors.opr" "root_volume_outJoint.sz";
connectAttr "a_finalJoint.s" "root_volume_outJoint.is";
connectAttr "curve1_0_locShape.wp" "soft_curveShape.cp[0]";
connectAttr "curve1_1_locShape.wp" "soft_curveShape.cp[1]";
connectAttr "curve1_2_locShape.wp" "soft_curveShape.cp[2]";
connectAttr "curve1_3_locShape.wp" "soft_curveShape.cp[3]";
connectAttr "curve1_4_locShape.wp" "soft_curveShape.cp[4]";
connectAttr "upper_curve_0_locShape.wp" "final_curveShape.cp[0]";
connectAttr "upper_curve_1_locShape.wp" "final_curveShape.cp[1]";
connectAttr "upper_curve_2_locShape.wp" "final_curveShape.cp[2]";
connectAttr "upper_curve_3_locShape.wp" "final_curveShape.cp[3]";
connectAttr "upper_curve_4_locShape.wp" "final_curveShape.cp[4]";
connectAttr "lower_curve_1_locShape.wp" "final_curveShape.cp[5]";
connectAttr "lower_curve_2_locShape.wp" "final_curveShape.cp[6]";
connectAttr "lower_curve_3_locShape.wp" "final_curveShape.cp[7]";
connectAttr "lower_curve_4_locShape.wp" "final_curveShape.cp[8]";
connectAttr "soft_curve_4_mpath.ac" "lowerBend_1_softLoc.t";
connectAttr "soft_curve_4_mpath.rx" "lowerBend_1_softLoc.rx";
connectAttr "soft_curve_4_mpath.ry" "lowerBend_1_softLoc.ry";
connectAttr "soft_curve_4_mpath.rz" "lowerBend_1_softLoc.rz";
connectAttr "final_joints.sx" "lowerBend_1_softLoc.sx";
connectAttr "final_joints.sy" "lowerBend_1_softLoc.sy";
connectAttr "final_joints.sz" "lowerBend_1_softLoc.sz";
connectAttr "soft_curve_5_mpath.ac" "lowerBend_2_softLoc.t";
connectAttr "soft_curve_5_mpath.rx" "lowerBend_2_softLoc.rx";
connectAttr "soft_curve_5_mpath.ry" "lowerBend_2_softLoc.ry";
connectAttr "soft_curve_5_mpath.rz" "lowerBend_2_softLoc.rz";
connectAttr "final_joints.sx" "lowerBend_2_softLoc.sx";
connectAttr "final_joints.sy" "lowerBend_2_softLoc.sy";
connectAttr "final_joints.sz" "lowerBend_2_softLoc.sz";
connectAttr "soft_curve_6_mpath.ac" "lowerBend_3_softLoc.t";
connectAttr "soft_curve_6_mpath.rx" "lowerBend_3_softLoc.rx";
connectAttr "soft_curve_6_mpath.ry" "lowerBend_3_softLoc.ry";
connectAttr "soft_curve_6_mpath.rz" "lowerBend_3_softLoc.rz";
connectAttr "final_joints.sx" "lowerBend_3_softLoc.sx";
connectAttr "final_joints.sy" "lowerBend_3_softLoc.sy";
connectAttr "final_joints.sz" "lowerBend_3_softLoc.sz";
connectAttr "soft_curve_2_mpath.ac" "upperBend_3_softLoc.t";
connectAttr "soft_curve_2_mpath.rx" "upperBend_3_softLoc.rx";
connectAttr "soft_curve_2_mpath.ry" "upperBend_3_softLoc.ry";
connectAttr "soft_curve_2_mpath.rz" "upperBend_3_softLoc.rz";
connectAttr "final_joints.sx" "upperBend_3_softLoc.sx";
connectAttr "final_joints.sy" "upperBend_3_softLoc.sy";
connectAttr "final_joints.sz" "upperBend_3_softLoc.sz";
connectAttr "soft_curve_1_mpath.ac" "upperBend_2_softLoc.t";
connectAttr "soft_curve_1_mpath.rx" "upperBend_2_softLoc.rx";
connectAttr "soft_curve_1_mpath.ry" "upperBend_2_softLoc.ry";
connectAttr "soft_curve_1_mpath.rz" "upperBend_2_softLoc.rz";
connectAttr "final_joints.sx" "upperBend_2_softLoc.sx";
connectAttr "final_joints.sy" "upperBend_2_softLoc.sy";
connectAttr "final_joints.sz" "upperBend_2_softLoc.sz";
connectAttr "soft_curve_0_mpath.ac" "upperBend_1_softLoc.t";
connectAttr "soft_curve_0_mpath.rx" "upperBend_1_softLoc.rx";
connectAttr "soft_curve_0_mpath.ry" "upperBend_1_softLoc.ry";
connectAttr "soft_curve_0_mpath.rz" "upperBend_1_softLoc.rz";
connectAttr "final_joints.sx" "upperBend_1_softLoc.sx";
connectAttr "final_joints.sy" "upperBend_1_softLoc.sy";
connectAttr "final_joints.sz" "upperBend_1_softLoc.sz";
connectAttr "soft_curve_3_mpath.ac" "middleBend_softLoc.t";
connectAttr "soft_curve_3_mpath.rx" "middleBend_softLoc.rx";
connectAttr "soft_curve_3_mpath.ry" "middleBend_softLoc.ry";
connectAttr "soft_curve_3_mpath.rz" "middleBend_softLoc.rz";
connectAttr "final_joints.sx" "middleBend_softLoc.sx";
connectAttr "final_joints.sy" "middleBend_softLoc.sy";
connectAttr "final_joints.sz" "middleBend_softLoc.sz";
connectAttr "multDoubleLinear478.o" "bifrostGraphShape.angle";
connectAttr "root_connector_decomposeMatrix.osx" "bifrostGraphShape.global_scale"
		;
connectAttr "middle.middleBend" "bifrostGraphShape.middle_bend";
connectAttr "middle.noCorner" "bifrostGraphShape.smooth_mode";
connectAttr "middle.wm" "bifrostGraphShape.middle_matrix";
connectAttr "a_finalJoint.wm" "bifrostGraphShape.start_matrix";
connectAttr "end_finalJoint.wm" "bifrostGraphShape.end_matrix";
connectAttr "middle.radius" "bifrostGraphShape.radius";
connectAttr "upperBend.t" "bifrostGraphShape.in_upper_bend";
connectAttr "lowerBend.t" "bifrostGraphShape.in_lower_bend";
connectAttr "middle.sharpCorner" "bifrostGraphShape.sharp_corner";
connectAttr "middle.startWeight" "bifrostGraphShape.startWeight";
connectAttr "middle.endWeight" "bifrostGraphShape.endWeight";
connectAttr "distanceBetween4.d" "bifrostGraphShape.init_length";
connectAttr "final_joints.s" "outJoints.s";
connectAttr "root_outJoint_decMat.ory" "root_outJoint.ry";
connectAttr "root_outJoint_decMat.orz" "root_outJoint.rz";
connectAttr "root_outJoint_decMat.orx" "root_outJoint.rx";
connectAttr "root_outJoint_decMat.oty" "root_outJoint.ty";
connectAttr "root_outJoint_decMat.otz" "root_outJoint.tz";
connectAttr "root_outJoint_decMat.otx" "root_outJoint.tx";
connectAttr "root_outJoint_decMat.osx" "root_outJoint.sx";
connectAttr "root_outJoint_decMat.osy" "root_outJoint.sy";
connectAttr "root_outJoint_decMat.osz" "root_outJoint.sz";
connectAttr "b_finalJoint.ty" "middle_outJoint.ty";
connectAttr "b_finalJoint.tz" "middle_outJoint.tz";
connectAttr "b_finalJoint.tx" "middle_outJoint.tx";
connectAttr "b_finalJoint.ry" "middle_outJoint.ry";
connectAttr "b_finalJoint.rz" "middle_outJoint.rz";
connectAttr "b_finalJoint.rx" "middle_outJoint.rx";
connectAttr "root_outJoint.s" "middle_outJoint.is";
connectAttr "end_finalJoint.ty" "end_outJoint.ty";
connectAttr "end_finalJoint.tz" "end_outJoint.tz";
connectAttr "end_finalJoint.tx" "end_outJoint.tx";
connectAttr "middle_outJoint.s" "end_outJoint.is";
connectAttr "end_finalJoint.ry" "end_outJoint.ry";
connectAttr "end_finalJoint.rz" "end_outJoint.rz";
connectAttr "end_finalJoint.rx" "end_outJoint.rx";
connectAttr "decomposeMatrix42.otx" "fk_out_grp.tx";
connectAttr "decomposeMatrix42.oty" "fk_out_grp.ty";
connectAttr "decomposeMatrix42.otz" "fk_out_grp.tz";
connectAttr "decomposeMatrix42.orx" "fk_out_grp.rx";
connectAttr "decomposeMatrix42.ory" "fk_out_grp.ry";
connectAttr "decomposeMatrix42.orz" "fk_out_grp.rz";
connectAttr "decomposeMatrix42.osx" "fk_out_grp.sx";
connectAttr "decomposeMatrix42.osy" "fk_out_grp.sy";
connectAttr "decomposeMatrix42.osz" "fk_out_grp.sz";
connectAttr "decomposeMatrix43.otx" "ik_out_grp.tx";
connectAttr "decomposeMatrix43.oty" "ik_out_grp.ty";
connectAttr "decomposeMatrix43.otz" "ik_out_grp.tz";
connectAttr "decomposeMatrix43.orx" "ik_out_grp.rx";
connectAttr "decomposeMatrix43.ory" "ik_out_grp.ry";
connectAttr "decomposeMatrix43.orz" "ik_out_grp.rz";
connectAttr "decomposeMatrix43.osx" "ik_out_grp.sx";
connectAttr "decomposeMatrix43.osy" "ik_out_grp.sy";
connectAttr "decomposeMatrix43.osz" "ik_out_grp.sz";
connectAttr "mirror_condition.ocr" "ik_out.sx";
connectAttr "decomposeMatrix44.oty" "ikRev_out.ty";
connectAttr "decomposeMatrix44.otz" "ikRev_out.tz";
connectAttr "decomposeMatrix44.otx" "ikRev_out.tx";
connectAttr "decomposeMatrix44.ory" "ikRev_out.ry";
connectAttr "decomposeMatrix44.orz" "ikRev_out.rz";
connectAttr "decomposeMatrix44.orx" "ikRev_out.rx";
connectAttr "decomposeMatrix44.osy" "ikRev_out.sy";
connectAttr "decomposeMatrix44.osz" "ikRev_out.sz";
connectAttr "decomposeMatrix44.osx" "ikRev_out.sx";
connectAttr "root_connector_decomposeMatrix.osy" "end_out.sy";
connectAttr "root_connector_decomposeMatrix.osz" "end_out.sz";
connectAttr "root_connector_decomposeMatrix.osx" "end_out.sx";
connectAttr "twistUp_curve_0_mpath.ac" "twistUp_0_skinJoint.t";
connectAttr "twistUp_curve_0_mpath.msg" "twistUp_0_skinJoint.sml";
connectAttr "twistUp_curve_0_mpath.rx" "twistUp_0_skinJoint.rx";
connectAttr "twistUp_curve_0_mpath.ry" "twistUp_0_skinJoint.ry";
connectAttr "twistUp_curve_0_mpath.rz" "twistUp_0_skinJoint.rz";
connectAttr "twistUp_curve_0_mpath.ro" "twistUp_0_skinJoint.ro";
connectAttr "final_joints.sx" "twistUp_0_skinJoint.sx";
connectAttr "multiplyDivide369.oy" "twistUp_0_skinJoint.sy";
connectAttr "multiplyDivide369.oy" "twistUp_0_skinJoint.sz";
connectAttr "twistUp_curve_1_mpath.ac" "twistUp_1_skinJoint.t";
connectAttr "twistUp_curve_1_mpath.msg" "twistUp_1_skinJoint.sml";
connectAttr "twistUp_curve_1_mpath.rx" "twistUp_1_skinJoint.rx";
connectAttr "twistUp_curve_1_mpath.ry" "twistUp_1_skinJoint.ry";
connectAttr "twistUp_curve_1_mpath.rz" "twistUp_1_skinJoint.rz";
connectAttr "twistUp_curve_1_mpath.ro" "twistUp_1_skinJoint.ro";
connectAttr "final_joints.sx" "twistUp_1_skinJoint.sx";
connectAttr "multiplyDivide369.oy" "twistUp_1_skinJoint.sy";
connectAttr "multiplyDivide369.oy" "twistUp_1_skinJoint.sz";
connectAttr "twistUp_curve_2_mpath.ac" "twistUp_2_skinJoint.t";
connectAttr "twistUp_curve_2_mpath.msg" "twistUp_2_skinJoint.sml";
connectAttr "twistUp_curve_2_mpath.rx" "twistUp_2_skinJoint.rx";
connectAttr "twistUp_curve_2_mpath.ry" "twistUp_2_skinJoint.ry";
connectAttr "twistUp_curve_2_mpath.rz" "twistUp_2_skinJoint.rz";
connectAttr "twistUp_curve_2_mpath.ro" "twistUp_2_skinJoint.ro";
connectAttr "final_joints.sx" "twistUp_2_skinJoint.sx";
connectAttr "multiplyDivide369.oy" "twistUp_2_skinJoint.sy";
connectAttr "multiplyDivide369.oy" "twistUp_2_skinJoint.sz";
connectAttr "twistUp_curve_3_mpath.ac" "twistUp_3_skinJoint.t";
connectAttr "twistUp_curve_3_mpath.msg" "twistUp_3_skinJoint.sml";
connectAttr "twistUp_curve_3_mpath.rx" "twistUp_3_skinJoint.rx";
connectAttr "twistUp_curve_3_mpath.ry" "twistUp_3_skinJoint.ry";
connectAttr "twistUp_curve_3_mpath.rz" "twistUp_3_skinJoint.rz";
connectAttr "twistUp_curve_3_mpath.ro" "twistUp_3_skinJoint.ro";
connectAttr "final_joints.sx" "twistUp_3_skinJoint.sx";
connectAttr "multiplyDivide369.oy" "twistUp_3_skinJoint.sy";
connectAttr "multiplyDivide369.oy" "twistUp_3_skinJoint.sz";
connectAttr "twistUp_curve_4_mpath.ac" "twistUp_4_skinJoint.t";
connectAttr "twistUp_curve_4_mpath.msg" "twistUp_4_skinJoint.sml";
connectAttr "twistUp_curve_4_mpath.rx" "twistUp_4_skinJoint.rx";
connectAttr "twistUp_curve_4_mpath.ry" "twistUp_4_skinJoint.ry";
connectAttr "twistUp_curve_4_mpath.rz" "twistUp_4_skinJoint.rz";
connectAttr "twistUp_curve_4_mpath.ro" "twistUp_4_skinJoint.ro";
connectAttr "final_joints.sx" "twistUp_4_skinJoint.sx";
connectAttr "multiplyDivide369.oy" "twistUp_4_skinJoint.sy";
connectAttr "multiplyDivide369.oy" "twistUp_4_skinJoint.sz";
connectAttr "twistDown_curve_0_mpath.ac" "twistDown_0_skinJoint.t";
connectAttr "twistDown_curve_0_mpath.msg" "twistDown_0_skinJoint.sml";
connectAttr "twistDown_curve_0_mpath.rx" "twistDown_0_skinJoint.rx";
connectAttr "twistDown_curve_0_mpath.ry" "twistDown_0_skinJoint.ry";
connectAttr "twistDown_curve_0_mpath.rz" "twistDown_0_skinJoint.rz";
connectAttr "twistDown_curve_0_mpath.ro" "twistDown_0_skinJoint.ro";
connectAttr "final_joints.sx" "twistDown_0_skinJoint.sx";
connectAttr "multiplyDivide369.ox" "twistDown_0_skinJoint.sy";
connectAttr "multiplyDivide369.ox" "twistDown_0_skinJoint.sz";
connectAttr "twistDown_curve_1_mpath.ac" "twistDown_1_skinJoint.t";
connectAttr "twistDown_curve_1_mpath.msg" "twistDown_1_skinJoint.sml";
connectAttr "twistDown_curve_1_mpath.rx" "twistDown_1_skinJoint.rx";
connectAttr "twistDown_curve_1_mpath.ry" "twistDown_1_skinJoint.ry";
connectAttr "twistDown_curve_1_mpath.rz" "twistDown_1_skinJoint.rz";
connectAttr "twistDown_curve_1_mpath.ro" "twistDown_1_skinJoint.ro";
connectAttr "final_joints.sx" "twistDown_1_skinJoint.sx";
connectAttr "multiplyDivide369.ox" "twistDown_1_skinJoint.sy";
connectAttr "multiplyDivide369.ox" "twistDown_1_skinJoint.sz";
connectAttr "twistDown_curve_2_mpath.ac" "twistDown_2_skinJoint.t";
connectAttr "twistDown_curve_2_mpath.msg" "twistDown_2_skinJoint.sml";
connectAttr "twistDown_curve_2_mpath.rx" "twistDown_2_skinJoint.rx";
connectAttr "twistDown_curve_2_mpath.ry" "twistDown_2_skinJoint.ry";
connectAttr "twistDown_curve_2_mpath.rz" "twistDown_2_skinJoint.rz";
connectAttr "twistDown_curve_2_mpath.ro" "twistDown_2_skinJoint.ro";
connectAttr "final_joints.sx" "twistDown_2_skinJoint.sx";
connectAttr "multiplyDivide369.ox" "twistDown_2_skinJoint.sy";
connectAttr "multiplyDivide369.ox" "twistDown_2_skinJoint.sz";
connectAttr "twistDown_curve_3_mpath.ac" "twistDown_3_skinJoint.t";
connectAttr "twistDown_curve_3_mpath.msg" "twistDown_3_skinJoint.sml";
connectAttr "twistDown_curve_3_mpath.rx" "twistDown_3_skinJoint.rx";
connectAttr "twistDown_curve_3_mpath.ry" "twistDown_3_skinJoint.ry";
connectAttr "twistDown_curve_3_mpath.rz" "twistDown_3_skinJoint.rz";
connectAttr "twistDown_curve_3_mpath.ro" "twistDown_3_skinJoint.ro";
connectAttr "final_joints.sx" "twistDown_3_skinJoint.sx";
connectAttr "multiplyDivide369.ox" "twistDown_3_skinJoint.sy";
connectAttr "multiplyDivide369.ox" "twistDown_3_skinJoint.sz";
connectAttr "twistDown_curve_4_mpath.ac" "twistDown_4_skinJoint.t";
connectAttr "twistDown_curve_4_mpath.msg" "twistDown_4_skinJoint.sml";
connectAttr "twistDown_curve_4_mpath.rx" "twistDown_4_skinJoint.rx";
connectAttr "twistDown_curve_4_mpath.ry" "twistDown_4_skinJoint.ry";
connectAttr "twistDown_curve_4_mpath.rz" "twistDown_4_skinJoint.rz";
connectAttr "twistDown_curve_4_mpath.ro" "twistDown_4_skinJoint.ro";
connectAttr "final_joints.sx" "twistDown_4_skinJoint.sx";
connectAttr "multiplyDivide369.ox" "twistDown_4_skinJoint.sy";
connectAttr "multiplyDivide369.ox" "twistDown_4_skinJoint.sz";
connectAttr "twistDown_curve_0_mpath1.ac" "twistKnee_skinJoint.t";
connectAttr "pairBlend1.or" "twistKnee_skinJoint.r";
connectAttr "middle_volume_outJoint.s" "twistKnee_skinJoint.s";
connectAttr "unitConversion452.o" "twistKnee_y_2_skinJoint.driverAngle";
connectAttr "setRange2.ox" "twistKnee_y_2_skinJoint.tx";
connectAttr "setRange2.oy" "twistKnee_y_2_skinJoint.tz";
connectAttr "twistKnee_skinJoint.s" "twistKnee_y_2_skinJoint.is";
connectAttr "unitConversion452.o" "twistKnee_y_1_skinJoint.driverAngle" -l on;
connectAttr "setRange1.ox" "twistKnee_y_1_skinJoint.tx";
connectAttr "setRange1.oy" "twistKnee_y_1_skinJoint.tz";
connectAttr "twistKnee_skinJoint.s" "twistKnee_y_1_skinJoint.is";
connectAttr "control.ikFk" "ikFk_reverse.ix";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "multMatrix22.o" "decomposeMatrix25.imat";
connectAttr "world_composeMatrix.omat" "multMatrix22.i[0]";
connectAttr "end_poser.wm" "multMatrix22.i[1]";
connectAttr "root_poserOrient.wim" "multMatrix22.i[2]";
connectAttr "end_poser.wm" "fk_b_group_multMatrix.i[0]";
connectAttr "middle_poserOrient.wim" "fk_b_group_multMatrix.i[1]";
connectAttr "fk_b_group_multMatrix.o" "fk_b_group_decomposeMatrix.imat";
connectAttr "ik_end_out_rot.wm" "decomposeMatrix31.imat";
connectAttr "ik_end_out.wm" "multMatrix29.i[0]";
connectAttr "end_ikJoint.pim" "multMatrix29.i[1]";
connectAttr "multMatrix29.o" "decomposeMatrix33.imat";
connectAttr "control.iog" "moduleControlSet.dsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "add_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "root_connector.wm" "root_connector_decomposeMatrix.imat";
connectAttr "root_poserOrient.wm" "root_decMat.imat";
connectAttr "middle_poserOrient.wm" "fk_end_group_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "fk_end_group_multMatrix.i[1]";
connectAttr "fk_end_group_multMatrix.o" "fk_end_group_decomposeMatrix.imat";
connectAttr "ik_connector.wm" "decomposeMatrix41.imat";
connectAttr "ik_end.wm" "decomposeMatrix43.imat";
connectAttr "multMatrix38.o" "decomposeMatrix44.imat";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "ikFkSwitchSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "mirror_condition.ocg" "unitConversion431.i";
connectAttr "root_connector_decomposeMatrix.osz" "multDoubleLinear435.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear435.i2";
connectAttr "end_ikJoint.wm" "multMatrix38.i[0]";
connectAttr "ikRev_out.pim" "multMatrix38.i[1]";
connectAttr "control.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_b.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_end.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_a.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_aim.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_root.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_end.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "middle.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "twistUp_0_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistUp_1_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistUp_2_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistUp_3_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistUp_4_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistDown_0_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistDown_1_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistDown_2_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistDown_3_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistDown_4_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "twistKnee_skinJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "end_fkJoint.wm" "decomposeMatrix42.imat";
connectAttr "middle_poser.twist" "unitConversion432.i";
connectAttr "middle_poserOrient_locShape.wp" "rootMiddle_vector.i3[0]";
connectAttr "root_poserOrient_locShape.wp" "rootMiddle_vector.i3[1]";
connectAttr "end_initLocShape.wp" "rootEnd_vector.i3[0]";
connectAttr "root_poserOrient_locShape.wp" "rootEnd_vector.i3[1]";
connectAttr "rootMiddle_vector.o3" "cosAngle_bewtweenVectors.i1";
connectAttr "rootEnd_vector.o3" "cosAngle_bewtweenVectors.i2";
connectAttr "rootEnd_vectorNormalized.o" "rootEnd_vectorNormalized_projected.i1"
		;
connectAttr "cosAngle_bewtweenVectors.o" "rootEnd_vectorNormalized_projected.i2"
		;
connectAttr "middle_poserOrient_locShape.wp" "rootMiddle_distance.p1";
connectAttr "root_poserOrient_locShape.wp" "rootMiddle_distance.p2";
connectAttr "rootEnd_vector.o3" "rootEnd_vectorNormalized.i1";
connectAttr "rootEnd_vectorNormalized_projected.o" "rootMiddle_projected.i1";
connectAttr "rootMiddle_distance.d" "rootMiddle_projected.i2x";
connectAttr "rootMiddle_distance.d" "rootMiddle_projected.i2y";
connectAttr "rootMiddle_distance.d" "rootMiddle_projected.i2z";
connectAttr "rootMiddle_projected.o" "rootMiddle_betweenPoint.i3[0]";
connectAttr "root_poserOrient_locShape.wp" "rootMiddle_betweenPoint.i3[1]";
connectAttr "middle_poserOrient_locShape.wp" "frombetweenToMiddle_vector.i3[0]";
connectAttr "rootMiddle_betweenPoint.o3" "frombetweenToMiddle_vector.i3[1]";
connectAttr "multiplyDivide352.o" "middleOut_vector.i3[0]";
connectAttr "middle_poserOrient_locShape.wp" "middleOut_vector.i3[1]";
connectAttr "frombetweenToMiddle_vector.o3" "middleOut_vectorNormalized.i1";
connectAttr "aimOffset_scaled.o" "multiplyDivide352.i1x";
connectAttr "aimOffset_scaled.o" "multiplyDivide352.i1y";
connectAttr "aimOffset_scaled.o" "multiplyDivide352.i1z";
connectAttr "middleOut_vectorNormalized.o" "multiplyDivide352.i2";
connectAttr "middleOut_vector.o3" "middleOut_matrix.it";
connectAttr "middleOut_matrix.omat" "ik_aim_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "ik_aim_multMatrix.i[1]";
connectAttr "mod.aim_offset" "aimOffset_scaled.i1";
connectAttr "root_decMat.osx" "aimOffset_scaled.i2";
connectAttr "ikfk_blend.opr" "final_length.i1x";
connectAttr "ikfk_blend.opr" "final_length.i1y";
connectAttr "control.length1" "final_length.i2x";
connectAttr "control.length2" "final_length.i2y";
connectAttr "control.autoStretch" "stretch_blend.b";
connectAttr "final_length_factor.ox" "stretch_blend.c1r";
connectAttr "current_length_scaled.ox" "final_length_factor.i1x";
connectAttr "stretch_condition.ocr" "final_length_factor.i2x";
connectAttr "current_length.d" "current_length_scaled.i1x";
connectAttr "root_connector_decomposeMatrix.osx" "current_length_scaled.i2x";
connectAttr "current_length_scaled.ox" "stretch_condition.st";
connectAttr "softIk_condition.ocr" "stretch_condition.ft";
connectAttr "current_length_scaled.ox" "stretch_condition.cfr";
connectAttr "softIk_condition.ocg" "stretch_condition.ctr";
connectAttr "init_length.o" "init_lenth_minus_softIk.i1[0]";
connectAttr "softIk_value.ov" "init_lenth_minus_softIk.i1[1]";
connectAttr "init_length_a.ox" "init_length.i1";
connectAttr "init_length_b.ox" "init_length.i2";
connectAttr "control.length1" "init_length_a.i1x";
connectAttr "fk_end_group_decomposeMatrix.otx" "init_length_a.i2x";
connectAttr "fk_b_group_decomposeMatrix.otx" "init_length_b.i1x";
connectAttr "control.length2" "init_length_b.i2x";
connectAttr "one_minus_by_softIk.o" "return_softIk.i1";
connectAttr "init_lenth_minus_softIk.o1" "return_softIk.i2";
connectAttr "one_minus.o1" "one_minus_by_softIk.i1";
connectAttr "softIk_value.ov" "one_minus_by_softIk.i2";
connectAttr "power.ox" "one_minus.i1[1]";
connectAttr "length_difference_by_softIk.ox" "power.i2x";
connectAttr "length_difference_minus.o" "length_difference_by_softIk.i1x";
connectAttr "softIk_value.ov" "length_difference_by_softIk.i2x";
connectAttr "length_difference.o1" "length_difference_minus.i1";
connectAttr "current_length_scaled.ox" "length_difference.i1[0]";
connectAttr "init_lenth_minus_softIk.o1" "length_difference.i1[1]";
connectAttr "ik_end_outShape.wp" "current_length.p1";
connectAttr "snap_root_locShape.wp" "current_length.p2";
connectAttr "final_length.o" "scale_to_translate_converter.i2";
connectAttr "fk_end_group_decomposeMatrix.otx" "scale_to_translate_converter.i1x"
		;
connectAttr "fk_b_group_decomposeMatrix.otx" "scale_to_translate_converter.i1y";
connectAttr "control.softIk" "softIk_value.i";
connectAttr "control.softIk" "softIk_condition.ft";
connectAttr "init_lenth_minus_softIk.o1" "softIk_condition.ctr";
connectAttr "return_softIk.o" "softIk_condition.ctg";
connectAttr "init_length.o" "softIk_condition.cfr";
connectAttr "init_length.o" "softIk_condition.cfg";
connectAttr "control.snap" "snap_blend.b";
connectAttr "current_toSnapPoint_length_scaled.o" "snap_blend.c1";
connectAttr "scale_to_translate_converter.ox" "snap_blend.c2r";
connectAttr "scale_to_translate_converter.oy" "snap_blend.c2g";
connectAttr "snap_root_locShape.wp" "current_rootToSnapPoint_length.p1";
connectAttr "curveEnd_locatorShape.wp" "current_rootToSnapPoint_length.p2";
connectAttr "current_rootToSnapPoint_length.d" "current_toSnapPoint_length_scaled.i1x"
		;
connectAttr "current_endToSnapPoint_length.d" "current_toSnapPoint_length_scaled.i1y"
		;
connectAttr "root_connector_decomposeMatrix.osx" "current_toSnapPoint_length_scaled.i2x"
		;
connectAttr "root_connector_decomposeMatrix.osx" "current_toSnapPoint_length_scaled.i2y"
		;
connectAttr "curveEnd_locatorShape.wp" "current_endToSnapPoint_length.p1";
connectAttr "ik_end_outShape.wp" "current_endToSnapPoint_length.p2";
connectAttr "multMatrix39.o" "decomposeMatrix46.imat";
connectAttr "world_composeMatrix.omat" "multMatrix39.i[0]";
connectAttr "end_poser.wim" "multMatrix39.i[1]";
connectAttr "mirror_condition.ocr" "world_composeMatrix.isx";
connectAttr "unitConversion433.o" "blendColors1.c1";
connectAttr "end_poser.worldOrient" "blendColors1.b";
connectAttr "decomposeMatrix46.or" "unitConversion433.i";
connectAttr "blendColors1.op" "unitConversion434.i";
connectAttr "unitConversion435.o" "blendColors2.c1";
connectAttr "unitConversion436.o" "blendColors2.c2";
connectAttr "end_poser.worldOrient" "blendColors2.b";
connectAttr "decomposeMatrix25.or" "unitConversion436.i";
connectAttr "blendColors2.op" "unitConversion437.i";
connectAttr "control_group_multMatrix.o" "control_group_decomposeMatrix.imat";
connectAttr "mainPoser.wm" "control_group_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "control_group_multMatrix.i[1]";
connectAttr "mirror_condition.ocb" "multDoubleLinear437.i1";
connectAttr "multDoubleLinear437.o" "unitConversion440.i";
connectAttr "mod.wm" "multMatrix41.i[0]";
connectAttr "end_poser.wim" "multMatrix41.i[1]";
connectAttr "multMatrix41.o" "decomposeMatrix48.imat";
connectAttr "green_rsSG.msg" "materialInfo1.sg";
connectAttr "blue_rsSG.msg" "materialInfo2.sg";
connectAttr "red_rsSG.msg" "materialInfo3.sg";
connectAttr "black_rsSG.msg" "materialInfo4.sg";
connectAttr "mirror_condition.ocg" "unitConversion443.i";
connectAttr "mirror_condition.ocb" "unitConversion444.i";
connectAttr "fk_end_group_decomposeMatrix.otx" "volume_mult.i1x";
connectAttr "fk_b_group_decomposeMatrix.otx" "volume_mult.i1y";
connectAttr "scale_to_translate_converter.ox" "volume_mult.i2x";
connectAttr "scale_to_translate_converter.oy" "volume_mult.i2y";
connectAttr "volume_mult.o" "volume_blendColors.c1";
connectAttr "control.stretchVolume" "volume_blendColors.b";
connectAttr "ik_aim_multMatrix.o" "ik_aim_decomposeMatrix.imat";
connectAttr "fk_end_group_decomposeMatrix.otx" "initScale1_mult.i1";
connectAttr "control.length1" "initScale1_mult.i2";
connectAttr "fk_b_group_decomposeMatrix.otx" "initScaleEnd_mult.i1";
connectAttr "control.length2" "initScaleEnd_mult.i2";
connectAttr "root_twist_angleLoc_2.m" "decomposeMatrix49.imat";
connectAttr "unitConversion446.o" "multiplyDivide353.i1";
connectAttr "decomposeMatrix49.or" "unitConversion446.i";
connectAttr "fk_b.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_end.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_a.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "ik_aim.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_root.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_end.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "stretch_blend.opr" "ikfk_blend.c1r";
connectAttr "control.ikFk" "ikfk_blend.b";
connectAttr "root_outJoint_multMat.o" "root_outJoint_decMat.imat";
connectAttr "a_finalJoint.wm" "root_outJoint_multMat.i[0]";
connectAttr "root_outJoint.pim" "root_outJoint_multMat.i[1]";
connectAttr "lowerBend_3.iog" "add_moduleControlSet.dsm" -na;
connectAttr "middle.iog" "add_moduleControlSet.dsm" -na;
connectAttr "middleBend.iog" "add_moduleControlSet.dsm" -na;
connectAttr "lowerBend_2.iog" "add_moduleControlSet.dsm" -na;
connectAttr "upperBend_2.iog" "add_moduleControlSet.dsm" -na;
connectAttr "upperBend_3.iog" "add_moduleControlSet.dsm" -na;
connectAttr "lowerBend_1.iog" "add_moduleControlSet.dsm" -na;
connectAttr "upperBend_1.iog" "add_moduleControlSet.dsm" -na;
connectAttr "upperBend.iog" "add_moduleControlSet.dsm" -na;
connectAttr "lowerBend.iog" "add_moduleControlSet.dsm" -na;
connectAttr "twistUp_renderLayerManager.rlmi[0]" "twistUp_defaultRenderLayer.rlid"
		;
connectAttr "twistUp_end_connector.m" "twistUp_multMatrix5.i[0]";
connectAttr "twistUp_inverseMatrix1.omat" "twistUp_multMatrix5.i[1]";
connectAttr "twistUp_multMatrix5.o" "twistUp_decomposeMatrix5.imat";
connectAttr "twistUp_decomposeMatrix5.oqw" "twistUp_quatToEuler1.iqw";
connectAttr "twistUp_decomposeMatrix5.oqx" "twistUp_quatToEuler1.iqx";
connectAttr "twistUp_decomposeMatrix6.oqw" "twistUp_quatToEuler2.iqw";
connectAttr "twistUp_decomposeMatrix6.oqx" "twistUp_quatToEuler2.iqx";
connectAttr "twistUp_multMatrix6.o" "twistUp_decomposeMatrix6.imat";
connectAttr "twistUp_start_connector.m" "twistUp_multMatrix6.i[0]";
connectAttr "final_curveShape.ws" "twistUp_curve_0_mpath.gp";
connectAttr "twistUp_startUp_loc.wm" "twistUp_curve_0_mpath.wum";
connectAttr "multDoubleLinear468.o" "twistUp_curve_0_mpath.u";
connectAttr "final_curveShape.ws" "twistUp_curve_1_mpath.gp";
connectAttr "twistUp_startUp_loc.wm" "twistUp_curve_1_mpath.wum";
connectAttr "twistUp_unitConversion19.o" "twistUp_curve_1_mpath.ft";
connectAttr "multDoubleLinear471.o" "twistUp_curve_1_mpath.u";
connectAttr "final_curveShape.ws" "twistUp_curve_2_mpath.gp";
connectAttr "twistUp_startUp_loc.wm" "twistUp_curve_2_mpath.wum";
connectAttr "twistUp_unitConversion18.o" "twistUp_curve_2_mpath.ft";
connectAttr "multDoubleLinear470.o" "twistUp_curve_2_mpath.u";
connectAttr "final_curveShape.ws" "twistUp_curve_3_mpath.gp";
connectAttr "twistUp_startUp_loc.wm" "twistUp_curve_3_mpath.wum";
connectAttr "twistUp_unitConversion20.o" "twistUp_curve_3_mpath.ft";
connectAttr "multDoubleLinear472.o" "twistUp_curve_3_mpath.u";
connectAttr "final_curveShape.ws" "twistUp_curve_4_mpath.gp";
connectAttr "twistUp_startUp_loc.wm" "twistUp_curve_4_mpath.wum";
connectAttr "twistUp_quatToEuler1.orx" "twistUp_curve_4_mpath.ft";
connectAttr "multDoubleLinear469.o" "twistUp_curve_4_mpath.u";
connectAttr "twistUp_quatToEuler1.orx" "twistUp_unitConversion18.i";
connectAttr "twistUp_quatToEuler1.orx" "twistUp_unitConversion19.i";
connectAttr "twistUp_quatToEuler1.orx" "twistUp_unitConversion20.i";
connectAttr "twistUp_startUp_loc.m" "twistUp_inverseMatrix1.imat";
connectAttr "twistDown_renderLayerManager.rlmi[0]" "twistDown_defaultRenderLayer.rlid"
		;
connectAttr "twistDown_end_connector.m" "twistDown_multMatrix5.i[0]";
connectAttr "twistDown_inverseMatrix1.omat" "twistDown_multMatrix5.i[1]";
connectAttr "twistDown_multMatrix5.o" "twistDown_decomposeMatrix5.imat";
connectAttr "twistDown_decomposeMatrix5.oqw" "twistDown_quatToEuler1.iqw";
connectAttr "twistDown_decomposeMatrix5.oqx" "twistDown_quatToEuler1.iqx";
connectAttr "twistDown_decomposeMatrix6.oqw" "twistDown_quatToEuler2.iqw";
connectAttr "twistDown_decomposeMatrix6.oqx" "twistDown_quatToEuler2.iqx";
connectAttr "twistDown_multMatrix6.o" "twistDown_decomposeMatrix6.imat";
connectAttr "twistDown_start_connector.m" "twistDown_multMatrix6.i[0]";
connectAttr "final_curveShape.ws" "twistDown_curve_0_mpath.gp";
connectAttr "twistDown_startUp_loc.wm" "twistDown_curve_0_mpath.wum";
connectAttr "final_curveShape.ws" "twistDown_curve_1_mpath.gp";
connectAttr "twistDown_startUp_loc.wm" "twistDown_curve_1_mpath.wum";
connectAttr "twistDown_unitConversion19.o" "twistDown_curve_1_mpath.ft";
connectAttr "final_curveShape.ws" "twistDown_curve_2_mpath.gp";
connectAttr "twistDown_startUp_loc.wm" "twistDown_curve_2_mpath.wum";
connectAttr "twistDown_unitConversion18.o" "twistDown_curve_2_mpath.ft";
connectAttr "addDoubleLinear6.o" "twistDown_curve_2_mpath.u";
connectAttr "final_curveShape.ws" "twistDown_curve_3_mpath.gp";
connectAttr "twistDown_startUp_loc.wm" "twistDown_curve_3_mpath.wum";
connectAttr "twistDown_unitConversion20.o" "twistDown_curve_3_mpath.ft";
connectAttr "addDoubleLinear5.o" "twistDown_curve_3_mpath.u";
connectAttr "final_curveShape.ws" "twistDown_curve_4_mpath.gp";
connectAttr "twistDown_startUp_loc.wm" "twistDown_curve_4_mpath.wum";
connectAttr "twistDown_quatToEuler1.orx" "twistDown_curve_4_mpath.ft";
connectAttr "addDoubleLinear7.o" "twistDown_curve_4_mpath.u";
connectAttr "twistDown_quatToEuler1.orx" "twistDown_unitConversion18.i";
connectAttr "twistDown_quatToEuler1.orx" "twistDown_unitConversion19.i";
connectAttr "twistDown_quatToEuler1.orx" "twistDown_unitConversion20.i";
connectAttr "twistDown_startUp_loc.m" "twistDown_inverseMatrix1.imat";
connectAttr "soft_curveShape.ws" "soft_curve_0_mpath.gp";
connectAttr "soft_curveShape.ws" "soft_curve_1_mpath.gp";
connectAttr "soft_curveShape.ws" "soft_curve_2_mpath.gp";
connectAttr "soft_curveShape.ws" "soft_curve_3_mpath.gp";
connectAttr "soft_curveShape.ws" "soft_curve_4_mpath.gp";
connectAttr "soft_curveShape.ws" "soft_curve_5_mpath.gp";
connectAttr "soft_curveShape.ws" "soft_curve_6_mpath.gp";
connectAttr "upperBend_1_hardLoc.wm" "blendMatrix1.imat";
connectAttr "upperBend_1_softLoc.wm" "blendMatrix1.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix1.env";
connectAttr "upperBend_2_hardLoc.wm" "blendMatrix2.imat";
connectAttr "upperBend_2_softLoc.wm" "blendMatrix2.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix2.env";
connectAttr "upperBend_3_hardLoc.wm" "blendMatrix3.imat";
connectAttr "upperBend_3_softLoc.wm" "blendMatrix3.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix3.env";
connectAttr "middleBend_hardLoc.wm" "blendMatrix4.imat";
connectAttr "middleBend_softLoc.wm" "blendMatrix4.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix4.env";
connectAttr "lowerBend_2_hardLoc.wm" "blendMatrix5.imat";
connectAttr "lowerBend_2_softLoc.wm" "blendMatrix5.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix5.env";
connectAttr "lowerBend_1_hardLoc.wm" "blendMatrix6.imat";
connectAttr "lowerBend_1_softLoc.wm" "blendMatrix6.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix6.env";
connectAttr "lowerBend_3_hardLoc.wm" "blendMatrix8.imat";
connectAttr "lowerBend_3_softLoc.wm" "blendMatrix8.tgt[0].tmat";
connectAttr "middle.noCorner" "blendMatrix8.env";
connectAttr "root_connector_decomposeMatrix.osx" "multiplyDivide369.i1x";
connectAttr "root_connector_decomposeMatrix.osx" "multiplyDivide369.i1y";
connectAttr "root_connector_decomposeMatrix.osx" "multiplyDivide369.i1z";
connectAttr "volume_blendColors.opr" "multiplyDivide369.i2x";
connectAttr "volume_blendColors.opg" "multiplyDivide369.i2y";
connectAttr "locatorShape3.wp" "distanceBetween3.p2";
connectAttr "ik_end_outShape.wp" "distanceBetween3.p1";
connectAttr "mod.msg" "bindPose1.m[0]";
connectAttr "output.msg" "bindPose1.m[1]";
connectAttr "twist_joints.msg" "bindPose1.m[2]";
connectAttr "twistUp_2_skinJoint.msg" "bindPose1.m[3]";
connectAttr "twistDown_0_skinJoint.msg" "bindPose1.m[4]";
connectAttr "twistDown_1_skinJoint.msg" "bindPose1.m[5]";
connectAttr "twistDown_2_skinJoint.msg" "bindPose1.m[6]";
connectAttr "twistUp_0_skinJoint.msg" "bindPose1.m[7]";
connectAttr "twistDown_4_skinJoint.msg" "bindPose1.m[8]";
connectAttr "twistUp_4_skinJoint.msg" "bindPose1.m[9]";
connectAttr "twistUp_1_skinJoint.msg" "bindPose1.m[10]";
connectAttr "twistUp_3_skinJoint.msg" "bindPose1.m[11]";
connectAttr "twistDown_3_skinJoint.msg" "bindPose1.m[12]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[2]" "bindPose1.p[4]";
connectAttr "bindPose1.m[2]" "bindPose1.p[5]";
connectAttr "bindPose1.m[2]" "bindPose1.p[6]";
connectAttr "bindPose1.m[2]" "bindPose1.p[7]";
connectAttr "bindPose1.m[2]" "bindPose1.p[8]";
connectAttr "bindPose1.m[2]" "bindPose1.p[9]";
connectAttr "bindPose1.m[2]" "bindPose1.p[10]";
connectAttr "bindPose1.m[2]" "bindPose1.p[11]";
connectAttr "bindPose1.m[2]" "bindPose1.p[12]";
connectAttr "twistUp_2_skinJoint.bps" "bindPose1.wm[3]";
connectAttr "twistDown_0_skinJoint.bps" "bindPose1.wm[4]";
connectAttr "twistDown_1_skinJoint.bps" "bindPose1.wm[5]";
connectAttr "twistDown_2_skinJoint.bps" "bindPose1.wm[6]";
connectAttr "twistUp_0_skinJoint.bps" "bindPose1.wm[7]";
connectAttr "twistDown_4_skinJoint.bps" "bindPose1.wm[8]";
connectAttr "twistUp_4_skinJoint.bps" "bindPose1.wm[9]";
connectAttr "twistUp_1_skinJoint.bps" "bindPose1.wm[10]";
connectAttr "twistUp_3_skinJoint.bps" "bindPose1.wm[11]";
connectAttr "twistDown_3_skinJoint.bps" "bindPose1.wm[12]";
connectAttr "middle.mainBendControls" "multDoubleLinear459.i1";
connectAttr "middle.noCorner" "multDoubleLinear459.i2";
connectAttr "b_finalJoint.ry" "unitConversion447.i";
connectAttr "bifrostGraphShape.bend_lower_2z" "unitConversion448.i";
connectAttr "bifrostGraphShape.bend_lower_3z" "unitConversion449.i";
connectAttr "bifrostGraphShape.bend_upper_2z" "unitConversion450.i";
connectAttr "bifrostGraphShape.bend_upper_1z" "unitConversion451.i";
connectAttr "blendColors6.op" "plusMinusAverage1.i3[0]";
connectAttr "twistKnee_skinJoint.t" "plusMinusAverage1.i3[1]";
connectAttr "plusMinusAverage1.o3" "angleBetween1.v1";
connectAttr "plusMinusAverage2.o3" "angleBetween1.v2";
connectAttr "blendColors5.op" "plusMinusAverage2.i3[0]";
connectAttr "twistKnee_skinJoint.t" "plusMinusAverage2.i3[1]";
connectAttr "unitConversion452.o" "setRange1.vx";
connectAttr "unitConversion452.o" "setRange1.vy";
connectAttr "unitConversion452.o" "setRange1.vz";
connectAttr "condition1.ocr" "setRange1.omx";
connectAttr "condition1.ocr" "setRange1.omy";
connectAttr "condition1.ocg" "setRange1.onx";
connectAttr "condition1.ocg" "setRange1.ony";
connectAttr "condition3.ocg" "setRange1.nx";
connectAttr "condition2.ocg" "setRange1.ny";
connectAttr "condition3.ocr" "setRange1.mx";
connectAttr "condition2.ocr" "setRange1.my";
connectAttr "angleBetween1.a" "unitConversion452.i";
connectAttr "unitConversion452.o" "setRange2.vx";
connectAttr "unitConversion452.o" "setRange2.vy";
connectAttr "unitConversion452.o" "setRange2.vz";
connectAttr "condition4.ocr" "setRange2.omx";
connectAttr "condition4.ocr" "setRange2.omy";
connectAttr "condition4.ocg" "setRange2.onx";
connectAttr "condition4.ocg" "setRange2.ony";
connectAttr "condition5.ocg" "setRange2.nx";
connectAttr "condition6.ocg" "setRange2.ny";
connectAttr "condition5.ocr" "setRange2.mx";
connectAttr "condition6.ocr" "setRange2.my";
connectAttr "mod.msg" "bindPose2.m[0]";
connectAttr "output.msg" "bindPose2.m[1]";
connectAttr "twist_joints.msg" "bindPose2.m[2]";
connectAttr "twistUp_0_skinJoint.msg" "bindPose2.m[3]";
connectAttr "twistUp_1_skinJoint.msg" "bindPose2.m[4]";
connectAttr "twistUp_2_skinJoint.msg" "bindPose2.m[5]";
connectAttr "twistUp_3_skinJoint.msg" "bindPose2.m[6]";
connectAttr "twistUp_4_skinJoint.msg" "bindPose2.m[7]";
connectAttr "twistDown_0_skinJoint.msg" "bindPose2.m[8]";
connectAttr "twistDown_1_skinJoint.msg" "bindPose2.m[9]";
connectAttr "twistDown_2_skinJoint.msg" "bindPose2.m[10]";
connectAttr "twistDown_3_skinJoint.msg" "bindPose2.m[11]";
connectAttr "twistDown_4_skinJoint.msg" "bindPose2.m[12]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.m[0]" "bindPose2.p[1]";
connectAttr "bindPose2.m[1]" "bindPose2.p[2]";
connectAttr "bindPose2.m[2]" "bindPose2.p[3]";
connectAttr "bindPose2.m[2]" "bindPose2.p[4]";
connectAttr "bindPose2.m[2]" "bindPose2.p[5]";
connectAttr "bindPose2.m[2]" "bindPose2.p[6]";
connectAttr "bindPose2.m[2]" "bindPose2.p[7]";
connectAttr "bindPose2.m[2]" "bindPose2.p[8]";
connectAttr "bindPose2.m[2]" "bindPose2.p[9]";
connectAttr "bindPose2.m[2]" "bindPose2.p[10]";
connectAttr "bindPose2.m[2]" "bindPose2.p[11]";
connectAttr "bindPose2.m[2]" "bindPose2.p[12]";
connectAttr "bindPose2.m[2]" "bindPose2.p[13]";
connectAttr "bindPose2.m[13]" "bindPose2.p[14]";
connectAttr "bindPose2.m[13]" "bindPose2.p[15]";
connectAttr "multDoubleLinear467.o" "blendColors3.b";
connectAttr "middle.sharpCorner" "multDoubleLinear466.i2";
connectAttr "multDoubleLinear466.o" "multDoubleLinear467.i1";
connectAttr "reverse1.ox" "multDoubleLinear467.i2";
connectAttr "middle.noCorner" "reverse1.ix";
connectAttr "multDoubleLinear467.o" "blendColors4.b";
connectAttr "mod.msg" "bindPose3.m[0]";
connectAttr "output.msg" "bindPose3.m[1]";
connectAttr "twist_joints.msg" "bindPose3.m[2]";
connectAttr "twistUp_0_skinJoint.msg" "bindPose3.m[3]";
connectAttr "twistUp_1_skinJoint.msg" "bindPose3.m[4]";
connectAttr "twistUp_2_skinJoint.msg" "bindPose3.m[5]";
connectAttr "twistUp_3_skinJoint.msg" "bindPose3.m[6]";
connectAttr "twistUp_4_skinJoint.msg" "bindPose3.m[7]";
connectAttr "twistDown_0_skinJoint.msg" "bindPose3.m[8]";
connectAttr "twistDown_1_skinJoint.msg" "bindPose3.m[9]";
connectAttr "twistDown_2_skinJoint.msg" "bindPose3.m[10]";
connectAttr "twistDown_3_skinJoint.msg" "bindPose3.m[11]";
connectAttr "twistDown_4_skinJoint.msg" "bindPose3.m[12]";
connectAttr "twistKnee_skinJoint.msg" "bindPose3.m[13]";
connectAttr "twistKnee_y_2_skinJoint.msg" "bindPose3.m[14]";
connectAttr "twistKnee_y_1_skinJoint.msg" "bindPose3.m[15]";
connectAttr "bindPose3.w" "bindPose3.p[0]";
connectAttr "bindPose3.m[0]" "bindPose3.p[1]";
connectAttr "bindPose3.m[1]" "bindPose3.p[2]";
connectAttr "bindPose3.m[2]" "bindPose3.p[3]";
connectAttr "bindPose3.m[2]" "bindPose3.p[4]";
connectAttr "bindPose3.m[2]" "bindPose3.p[5]";
connectAttr "bindPose3.m[2]" "bindPose3.p[6]";
connectAttr "bindPose3.m[2]" "bindPose3.p[7]";
connectAttr "bindPose3.m[2]" "bindPose3.p[8]";
connectAttr "bindPose3.m[2]" "bindPose3.p[9]";
connectAttr "bindPose3.m[2]" "bindPose3.p[10]";
connectAttr "bindPose3.m[2]" "bindPose3.p[11]";
connectAttr "bindPose3.m[2]" "bindPose3.p[12]";
connectAttr "bindPose3.m[2]" "bindPose3.p[13]";
connectAttr "bindPose3.m[13]" "bindPose3.p[14]";
connectAttr "bindPose3.m[13]" "bindPose3.p[15]";
connectAttr "twistDown_1_skinJoint.t" "blendColors5.c1";
connectAttr "twistDown_0_skinJoint.t" "blendColors5.c2";
connectAttr "twistKnee_skinJoint.radiusWeight" "blendColors5.b";
connectAttr "twistUp_3_skinJoint.t" "blendColors6.c1";
connectAttr "twistUp_4_skinJoint.t" "blendColors6.c2";
connectAttr "twistKnee_skinJoint.radiusWeight" "blendColors6.b";
connectAttr "twistUp_0_skinJoint.curvePosition" "multDoubleLinear468.i1";
connectAttr "twistUp_4_skinJoint.curvePosition" "multDoubleLinear469.i1";
connectAttr "twistUp_2_skinJoint.curvePosition" "multDoubleLinear470.i1";
connectAttr "twistUp_1_skinJoint.curvePosition" "multDoubleLinear471.i1";
connectAttr "twistUp_3_skinJoint.curvePosition" "multDoubleLinear472.i1";
connectAttr "twistDown_1_skinJoint.curvePosition" "multDoubleLinear473.i1";
connectAttr "twistDown_0_skinJoint.curvePosition" "multDoubleLinear474.i1";
connectAttr "twistDown_2_skinJoint.curvePosition" "multDoubleLinear475.i1";
connectAttr "twistDown_3_skinJoint.curvePosition" "multDoubleLinear476.i1";
connectAttr "twistDown_4_skinJoint.curvePosition" "multDoubleLinear477.i1";
connectAttr "mirror_condition.ocg" "unitConversion453.i";
connectAttr "unitConversion447.o" "multDoubleLinear478.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear478.i2";
connectAttr "multDoubleLinear476.o" "addDoubleLinear5.i1";
connectAttr "multDoubleLinear475.o" "addDoubleLinear6.i1";
connectAttr "multDoubleLinear477.o" "addDoubleLinear7.i1";
connectAttr "root_poser.tz" "reverse_condition.ft";
connectAttr "middle_poser.tz" "reverse_condition.st";
connectAttr "end_poser.wm" "aim_world_connector_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "aim_world_connector_multMatrix.i[1]";
connectAttr "root_poserOrient.ry" "unitConversion454.i";
connectAttr "root_poser.size" "pasted__size_multiplyDivide.i1x";
connectAttr "middle_poser.size" "pasted__size_multiplyDivide.i1y";
connectAttr "pasted__multDoubleLinear438.o" "pasted__size_multiplyDivide.i1z";
connectAttr "mainPoser.globalSize" "pasted__size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "pasted__size_multiplyDivide.i2y";
connectAttr "mainPoser.globalSize" "pasted__size_multiplyDivide.i2z";
connectAttr "pasted__mainPoser_decomposeMatrix.osx" "pasted__multDoubleLinear438.i1"
		;
connectAttr "mainPoser.lineSize" "pasted__multDoubleLinear438.i2";
connectAttr "mainPoser.wm" "pasted__mainPoser_decomposeMatrix.imat";
connectAttr "posers_curveShape.ws" "pasted__sweepMeshCreator1.inCurveArray[0]";
connectAttr "pasted__size_multiplyDivide.oz" "pasted__sweepMeshCreator1.scaleProfileX"
		;
connectAttr "cluster4GroupParts.og" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "cluster4GroupId.id" "mainPoser_clusterHandleCluster.ip[0].gi";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "cluster4GroupId.msg" "cluster4Set.gn" -na;
connectAttr "mainPoserShape.iog.og[1]" "cluster4Set.dsm" -na;
connectAttr "mainPoser_clusterHandleCluster.msg" "cluster4Set.ub[0]";
connectAttr "mainPoserShapeOrig.ws" "groupParts42.ig";
connectAttr "groupId42.id" "groupParts42.gi";
connectAttr "groupParts42.og" "tweak24.ip[0].ig";
connectAttr "groupId42.id" "tweak24.ip[0].gi";
connectAttr "groupId42.msg" "tweakSet24.gn" -na;
connectAttr "mainPoserShape.iog.og[2]" "tweakSet24.dsm" -na;
connectAttr "tweak24.msg" "tweakSet24.ub[0]";
connectAttr "tweak24.og[0]" "cluster4GroupParts.ig";
connectAttr "cluster4GroupId.id" "cluster4GroupParts.gi";
connectAttr "pasted__size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "pasted__size_multiplyDivide.oy" "makeNurbSphere2.r";
connectAttr "end_poser.size" "pasted__size_multiplyDivide1.i1x";
connectAttr "mainPoser.globalSize" "pasted__size_multiplyDivide1.i2x";
connectAttr "pasted__size_multiplyDivide1.ox" "makeNurbSphere3.r";
connectAttr "multMatrix34.o" "decomposeMatrix45.imat";
connectAttr "decomposeMatrix45.or" "unitConversion435.i";
connectAttr "root_poserOrient.wim" "multMatrix34.i[1]";
connectAttr "root_poser.t" "distanceBetween4.p1";
connectAttr "end_poser.t" "distanceBetween4.p2";
connectAttr "final_curveShape.ws" "twistDown_curve_0_mpath1.gp";
connectAttr "twistDown_startUp_loc.wm" "twistDown_curve_0_mpath1.wum";
connectAttr "twistUp_4_skinJoint.r" "pairBlend1.ir1";
connectAttr "twistDown_0_skinJoint.r" "pairBlend1.ir2";
connectAttr "twistKnee_y_1_skinJoint.angleMax" "condition3.ft";
connectAttr "twistKnee_y_1_skinJoint.angleMin" "condition3.st";
connectAttr "twistKnee_y_1_skinJoint.slideMax" "condition3.ctr";
connectAttr "twistKnee_y_1_skinJoint.slideMin" "condition3.ctg";
connectAttr "twistKnee_y_1_skinJoint.slideMin" "condition3.cfr";
connectAttr "twistKnee_y_1_skinJoint.slideMax" "condition3.cfg";
connectAttr "twistKnee_y_1_skinJoint.angleMax" "condition2.ft";
connectAttr "twistKnee_y_1_skinJoint.angleMin" "condition2.st";
connectAttr "twistKnee_y_1_skinJoint.posMax" "condition2.ctr";
connectAttr "twistKnee_y_1_skinJoint.posMin" "condition2.ctg";
connectAttr "twistKnee_y_1_skinJoint.posMin" "condition2.cfr";
connectAttr "twistKnee_y_1_skinJoint.posMax" "condition2.cfg";
connectAttr "twistKnee_y_1_skinJoint.angleMax" "condition1.ft";
connectAttr "twistKnee_y_1_skinJoint.angleMin" "condition1.st";
connectAttr "twistKnee_y_1_skinJoint.angleMax" "condition1.ctr";
connectAttr "twistKnee_y_1_skinJoint.angleMin" "condition1.ctg";
connectAttr "twistKnee_y_1_skinJoint.angleMin" "condition1.cfr";
connectAttr "twistKnee_y_1_skinJoint.angleMax" "condition1.cfg";
connectAttr "twistKnee_y_2_skinJoint.angleMax" "condition4.ft";
connectAttr "twistKnee_y_2_skinJoint.angleMin" "condition4.st";
connectAttr "twistKnee_y_2_skinJoint.angleMax" "condition4.ctr";
connectAttr "twistKnee_y_2_skinJoint.angleMin" "condition4.ctg";
connectAttr "twistKnee_y_2_skinJoint.angleMin" "condition4.cfr";
connectAttr "twistKnee_y_2_skinJoint.angleMax" "condition4.cfg";
connectAttr "twistKnee_y_2_skinJoint.angleMax" "condition6.ft";
connectAttr "twistKnee_y_2_skinJoint.angleMin" "condition6.st";
connectAttr "twistKnee_y_2_skinJoint.posMax" "condition6.ctr";
connectAttr "twistKnee_y_2_skinJoint.posMin" "condition6.ctg";
connectAttr "twistKnee_y_2_skinJoint.posMin" "condition6.cfr";
connectAttr "twistKnee_y_2_skinJoint.posMax" "condition6.cfg";
connectAttr "twistKnee_y_2_skinJoint.angleMax" "condition5.ft";
connectAttr "twistKnee_y_2_skinJoint.angleMin" "condition5.st";
connectAttr "twistKnee_y_2_skinJoint.slideMax" "condition5.ctr";
connectAttr "twistKnee_y_2_skinJoint.slideMin" "condition5.ctg";
connectAttr "twistKnee_y_2_skinJoint.slideMin" "condition5.cfr";
connectAttr "twistKnee_y_2_skinJoint.slideMax" "condition5.cfg";
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "distanceBetween4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "multMatrix41.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "end_pose_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "aim_world_connector_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "end_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "bifrostGraphShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "end_pose_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "lower_curve_1_offset.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "lowerBend_1_hardLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "lowerBend_1_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "blendMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "unitConversion448.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "middle.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "bifrostGraphShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "bifrostGraphShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "lowerBend_1_hardLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "lowerBend_1_hardLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "lowerBend_3_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn"
		;
connectAttr "lowerBend_2_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn"
		;
connectAttr "upperBend_2_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn"
		;
connectAttr "middleBend_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn"
		;
connectAttr "upperBend_3_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[4].dn"
		;
connectAttr "lowerBend_1_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[5].dn"
		;
connectAttr "soft_curve_4_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[6].dn"
		;
connectAttr "soft_curve_0_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[7].dn"
		;
connectAttr "soft_curve_6_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[8].dn"
		;
connectAttr "soft_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[9].dn";
connectAttr "upperBend_1_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[10].dn"
		;
connectAttr "soft_curve_5_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[11].dn"
		;
connectAttr "soft_curve_1_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[12].dn"
		;
connectAttr "soft_curve_2_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[13].dn"
		;
connectAttr "soft_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[14].dn";
connectAttr "soft_curve_3_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[15].dn"
		;
connectAttr "lowerBend_3_softLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[0].dn"
		;
connectAttr "middle.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[1].dn";
connectAttr "blendMatrix8.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[2].dn";
connectAttr "lower_curve_3_offset.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[3].dn"
		;
connectAttr "lowerBend_3_hardLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[4].dn"
		;
connectAttr "locator2.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[0].dn";
connectAttr "locatorShape3.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[1].dn";
connectAttr "locator3.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[2].dn";
connectAttr "locatorShape1.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[3].dn";
connectAttr "end_group_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[4].dn"
		;
connectAttr "root_group_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[5].dn"
		;
connectAttr "root_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[6].dn";
connectAttr "distanceBetween3.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[7].dn"
		;
connectAttr "end_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[8].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[0].dn"
		;
connectAttr "fk_b_ikFkSwitchHelper.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[1].dn"
		;
connectAttr "ik_aim_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[2].dn";
connectAttr "end_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[3].dn";
connectAttr "ik_aim_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[4].dn";
connectAttr "end_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[5].dn";
connectAttr "ik_end_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[6].dn";
connectAttr "ik_end_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[7].dn";
connectAttr "fk_a_ikFkSwitchHelper.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[8].dn"
		;
connectAttr "multDoubleLinear478.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[9].dn"
		;
connectAttr "middleBend_hardLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[10].dn"
		;
connectAttr "middle_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[11].dn";
connectAttr "ik_end_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[12].dn";
connectAttr "multDoubleLinear435.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[13].dn"
		;
connectAttr "root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[14].dn";
connectAttr "world_composeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[15].dn"
		;
connectAttr "middle_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[16].dn";
connectAttr "ik_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[17].dn";
connectAttr "twist_joints.msg" "MayaNodeEditorSavedTabsInfo.tgi[7].ni[0].dn";
connectAttr "twistUp_curve_0_mpath.msg" "MayaNodeEditorSavedTabsInfo.tgi[7].ni[1].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[7].ni[2].dn";
connectAttr "twistUp_0_skinJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[7].ni[3].dn"
		;
connectAttr "green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "ikFk_reverse.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_connector_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "decomposeMatrix25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "fk_b_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix33.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "fk_end_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "decomposeMatrix41.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix43.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix44.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix45.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear435.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rootMiddle_vector.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rootEnd_vector.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "cosAngle_bewtweenVectors.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rootEnd_vectorNormalized_projected.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "rootMiddle_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rootEnd_vectorNormalized.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rootMiddle_projected.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rootMiddle_betweenPoint.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "frombetweenToMiddle_vector.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "middleOut_vector.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "middleOut_vectorNormalized.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide352.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "middleOut_matrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aimOffset_scaled.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "stretch_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "final_length_factor.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "init_length.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "final_length.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "stretch_blend.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "current_length_scaled.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "init_length_a.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "init_length_b.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "init_lenth_minus_softIk.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "length_difference.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "length_difference_minus.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "length_difference_by_softIk.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "power.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "one_minus.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "one_minus_by_softIk.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "return_softIk.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "current_length.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "scale_to_translate_converter.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "softIk_value.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "softIk_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "snap_blend.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "current_rootToSnapPoint_length.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "current_toSnapPoint_length_scaled.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "current_endToSnapPoint_length.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "decomposeMatrix46.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "world_composeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "control_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "multDoubleLinear437.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix48.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "volume_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "volume_blendColors.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ik_aim_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "initScale1_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "initScaleEnd_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix49.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide353.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_decomposeMatrix5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_quatToEuler1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_quatToEuler2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_decomposeMatrix6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_unitConversion18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_unitConversion19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_unitConversion20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistUp_inverseMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_decomposeMatrix5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_quatToEuler1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_quatToEuler2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_decomposeMatrix6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_unitConversion18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_unitConversion19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_unitConversion20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "twistDown_inverseMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide369.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear459.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide373.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion448.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion449.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion450.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion451.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "angleBetween1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear466.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear467.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear468.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear469.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear470.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear471.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear472.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear473.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear474.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear475.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear476.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear477.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear478.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion454.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pasted__size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "pasted__multDoubleLinear438.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "pasted__size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "distanceBetween4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "twistUp_defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "twistDown_defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "bifrostGraphShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
connectAttr "ikRPsolver1.msg" ":ikSystem.sol" -na;
// End of limbCurved.ma
