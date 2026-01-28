//Maya ASCII 2022 scene
//Name: eyesGeometry.ma
//Last modified: Wed, Jan 21, 2026 06:18:22 PM
//Codeset: 1251
file -lcu 1;
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "eulerToQuat" "quatNodes" "1.0";
requires "Mayatomr" "2013.0 - 3.10.1.11 ";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "B16AA4E6-4B8E-DF2C-47A7-A2847C1C512A";
createNode transform -n "mod";
	rename -uid "96F3A192-48D2-4F4A-43F7-B985BFE5814B";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	setAttr ".rp" -type "double3" 0 5.0115806818520312 1.9587701269313376 ;
	setAttr ".rpt" -type "double3" 1.3921395628662506e-16 -2.3608268103196185e-16 -3.9443045261050722e-31 ;
	setAttr ".sp" -type "double3" 0 5.0115806818520312 1.9587701269313376 ;
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "D57E7CD3-4A5A-F75B-C88F-05BAA5B70F3C";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "9AE8E633-4352-EC75-F45A-0DAB09215993";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.15;
	setAttr -k on ".lineWidth" 0.25;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "D73C7951-485E-989D-628A-8580293C6D4E";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "739B6CDD-49A0-CD09-A8FB-7C926ADF167A";
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
	rename -uid "52BAA52C-467C-AEBE-D2B7-8FB75E28FD8B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "";
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "96308E52-4BC3-19CD-0E92-A986E59C78EC";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "8A1129FC-40D0-410D-08FD-9F8D08950775";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -at "float";
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
	setAttr ".dh" yes;
	setAttr -k on ".size";
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "root";
	setAttr -cb on ".lineWidth" 0.20000000298023224;
createNode nurbsSurface -n "root_poserNurbsShape" -p "root_poser";
	rename -uid "14827C86-4A8A-021C-3B1B-A1B14E155579";
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
	rename -uid "8351B1CB-47CE-01CC-9B6F-8B98C8C217F7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "F0BEB3C5-42E3-8C61-874E-49AF13A3BE6B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "end_poser" -p "root_poser";
	rename -uid "E07E7EFD-4084-E702-76C5-5C80F55F58B8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -at "float";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 1.2068271412702316 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr ".dh" yes;
	setAttr -k on ".size";
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "end";
	setAttr -cb on ".lineWidth" 0.20000000298023224;
createNode nurbsSurface -n "end_poserNurbsShape" -p "end_poser";
	rename -uid "C843BC99-473A-5A46-C7AC-6F8651A93B58";
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
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "768B1BE3-4202-83D7-1482-B5BCA7D5893E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "end";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "6D4EA5D7-44D8-F716-B420-CF869A663FBB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_ball_controlInitLoc" -p "end_poser";
	rename -uid "85831520-4795-A155-8E2D-70B9F7F424A5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 0 0 ;
createNode locator -n "l_ball_controlInitLocShape" -p "l_ball_controlInitLoc";
	rename -uid "D1B6189B-4A0E-853E-EAB6-BA98D5710BEA";
	setAttr -k off ".v";
createNode transform -n "length_poser" -p "root_poser";
	rename -uid "9D091CF5-4F70-999A-ABE4-BAB516D53A91";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -at "float";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -1.3921395628662506e-16 0 2 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "length";
	setAttr -cb on ".lineWidth" 0.20000000298023224;
createNode nurbsSurface -n "length_poserNurbsShape" -p "length_poser";
	rename -uid "69EA14E4-4EEF-90F6-6884-9C868B618D1F";
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
createNode transform -n "length_poserOrient" -p "length_poser";
	rename -uid "FA187F9D-44CB-B90F-8FAC-A081AA4215B6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "length";
createNode locator -n "length_poserOrientShape" -p "length_poserOrient";
	rename -uid "40AD001E-4A0A-9417-47B6-C4827F642864";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "AF0AE366-465C-95ED-EC10-4F9C6ECFA631";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "A7F205B3-4520-0EC2-7F02-3BA3ED0D3DA9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "mirror_init_group" -p "root_poser";
	rename -uid "3BAEB345-4EE1-52EB-328A-2C81F0AF9C76";
	setAttr ".s" -type "double3" -1 1 1 ;
createNode transform -n "r_ball_controlInitLoc" -p "mirror_init_group";
	rename -uid "D164DDCD-4404-1E42-5063-7CAB26DC0C19";
	setAttr ".v" no;
createNode locator -n "r_ball_controlInitLocShape" -p "r_ball_controlInitLoc";
	rename -uid "69996AB9-462C-51C7-5AB5-2B9DDB554DA3";
	setAttr -k off ".v";
createNode transform -n "highlights_poser" -p "root_poser";
	rename -uid "1F300FCC-47C5-8129-E9C5-568751673DC3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -at "float";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 2.6709176169666513 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "length";
	setAttr -cb on ".lineWidth";
createNode nurbsSurface -n "highlights_poserNurbsShape" -p "highlights_poser";
	rename -uid "E4A21865-4211-AB6E-A877-43A9DCED12C3";
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
createNode transform -n "highlights_poserOrient" -p "highlights_poser";
	rename -uid "FACB9650-4EF9-F700-4556-FBA76D24A472";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "length";
createNode locator -n "highlights_poserOrientShape" -p "highlights_poserOrient";
	rename -uid "56E3A1BD-4124-16B8-A7B5-B4B45E7EDC4B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "posers_curve" -p "posers";
	rename -uid "6143472C-4653-4CE9-2D6A-85A8703CA68E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "312F564D-440E-4144-6D29-F2860B9969D6";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 2
		1.3921395628662506e-16 0 0
		1.2068271412702318 0 0
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "CE4E95DD-4ACD-F1CA-EA87-60A0A70C8170";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "E0DE5EDF-400D-D602-B00A-1A83B1384C56";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "CD5AFA17-4AC2-9B9B-E42A-30A0E7FCED4C";
createNode transform -n "root_connector" -p "input";
	rename -uid "59B3ECDE-4305-47BF-757B-30BEB0F02567";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "6A412890-47B8-BBEB-FFEE-53AD52D6BB5B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
createNode transform -n "eyes_world_connector" -p "input";
	rename -uid "1B0AE282-4EA0-8828-13F4-8C90699266BC";
	setAttr ".v" no;
createNode locator -n "eyes_world_connectorShape" -p "eyes_world_connector";
	rename -uid "DCF20885-47DC-3DCB-949E-57A927A979E4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "controls" -p "mod";
	rename -uid "FD689BA0-488F-9160-3C6D-4A985D625D6C";
createNode transform -n "l_ball_group" -p "controls";
	rename -uid "0426A69C-454C-EC7A-EBEF-9FA7C9726F64";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
createNode transform -n "l_ball" -p "l_ball_group";
	rename -uid "885740BF-4D82-F907-6895-DE9D0713C142";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "l_ball";
createNode nurbsCurve -n "l_ballShape" -p "l_ball";
	rename -uid "E05F4256-4003-10FE-26DB-AD9256660D93";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".cc" -type "nurbsCurve" 
		1 25 0 no 3
		26 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
		26
		1.3412876220426841 -8.4466950025188296e-16 0
		1.3475801885951544 0.046549338655575041 0
		1.3655553002240222 0.089944978405573889 0
		1.3940210970401801 0.12730977969754362 0
		1.4313858983321486 0.15577557651369858 0
		1.4747815380821443 0.17375068814256564 0
		1.5213308767377201 0.18004325469503493 0
		1.5678802153932985 0.1737506881425655 0
		1.6112757305108696 0.15577557651369839 0
		1.6486406564352634 0.12730977969754345 0
		1.6771063286189936 0.089944978405573597 0
		1.6950816895127145 0.046549338655574757 0
		1.7013726358436463 -1.0845343041384577e-15 0
		1.6950816895127145 -0.046549338655576991 0
		1.6771063286189936 -0.089944978405575804 0
		1.6486406564352634 -0.12730977969754556 0
		1.6112757305108696 -0.15577557651370025 0
		1.5678802153932985 -0.17375068814256756 0
		1.5213308767377201 -0.18004325469503668 0
		1.4747815380821443 -0.17375068814256742 0
		1.4313858983321486 -0.15577557651370005 0
		1.3940210970401801 -0.12730977969754539 0
		1.3655553002240222 -0.089944978405575596 0
		1.3475801885951544 -0.046549338655576714 0
		1.3412876220426841 -8.4466950025188296e-16 0
		0.0047582263360196686 -3.1696154607761e-18 0
		;
createNode transform -n "l_highlight_rotate_aimGroup" -p "l_ball";
	rename -uid "23408F0C-490D-5B8B-4FE2-519FD70240FC";
createNode transform -n "l_highlight_rotate" -p "l_highlight_rotate_aimGroup";
	rename -uid "86B847F3-404E-2561-A29B-0DBC5FBB7479";
	setAttr ".r" -type "double3" -11.459155902616466 -17.188733853924695 -2.0807816916258703e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode transform -n "l_highlight_offset" -p "l_highlight_rotate";
	rename -uid "E4E700F5-47F8-5CF5-B703-D59B3F8D399D";
	setAttr ".t" -type "double3" 0 0 1.1000633599883005 ;
createNode transform -n "l_highlight_rev" -p "l_highlight_offset";
	rename -uid "19463ADE-4D36-F25D-17A9-0A8CDE0B5B26";
createNode transform -n "l_highlight" -p "l_highlight_rev";
	rename -uid "C3D93F1E-4391-A94D-5BC4-1083F6B642F9";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr -k on ".t" -type "double3" -0.3 0.2 -2.2204460492503131e-16 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr ".mnsl" -type "double3" 0.2 0.2 0.2 ;
	setAttr ".mxsl" -type "double3" 2 2 2 ;
	setAttr ".msxe" yes;
	setAttr ".msye" yes;
	setAttr ".msze" yes;
	setAttr ".xsxe" yes;
	setAttr ".xsye" yes;
	setAttr ".xsze" yes;
	setAttr -l on ".internalName" -type "string" "l_look_fk";
createNode nurbsCurve -n "l_highlightShape" -p "l_highlight";
	rename -uid "AC15B225-4B09-B3DA-C589-0D9D3A4C0260";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.065041253935228777 0.065257415189371143 1.5415995372067317e-16
		0.0019467301270979791 0.091392022662172084 1.5415995372067317e-16
		-0.06114779368103327 0.065257415189371143 1.5415995372067317e-16
		-0.087282401153833414 0.0021628913812398237 1.5415995372067317e-16
		-0.06114779368103327 -0.06093163242689157 1.5415995372067317e-16
		0.0019467301270979791 -0.087066239899691422 1.5415995372067317e-16
		0.065041253935228777 -0.06093163242689157 1.5415995372067317e-16
		0.091175861408028983 0.0021628913812398237 1.5415995372067317e-16
		0.065041253935228777 0.065257415189371143 1.5415995372067317e-16
		0.0019467301270979791 0.091392022662172084 1.5415995372067317e-16
		-0.06114779368103327 0.065257415189371143 1.5415995372067317e-16
		;
createNode orientConstraint -n "l_highlight_rotate_aimGroup_orientConstraint1" -p
		 "l_highlight_rotate_aimGroup";
	rename -uid "2C898936-4B7D-BB4F-0874-0AA7AF972DE9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "highlightsAimW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "ffd1Lattice" -p "l_ball";
	rename -uid "DC637686-4CD3-B2CD-F00F-41B4690B522F";
	setAttr ".tmp" yes;
	setAttr ".t" -type "double3" 0.90058222292082579 -8.5545623829119677e-06 0.0097725353962374584 ;
	setAttr ".s" -type "double3" 2.063156366348267 2.0646235871810852 2.0806301575218669 ;
createNode lattice -n "ffd1LatticeShapeOrig" -p "ffd1Lattice";
	rename -uid "70D5CAAD-46FB-5EC8-6877-B984AE6AC2D3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".sd" 3;
	setAttr ".td" 3;
	setAttr ".cc" -type "lattice" 3 3 2 18 -0.5 -0.5 -0.5 0 -0.5 -0.5 0.5
		 -0.5 -0.5 -0.5 0 -0.5 0 0 -0.5 0.5 0 -0.5 -0.5 0.5 -0.5 0 0.5 -0.5 0.5 0.5 -0.5 -0.5
		 -0.5 0.5 0 -0.5 0.5 0.5 -0.5 0.5 -0.5 0 0.5 0 0 0.5 0.5 0 0.5 -0.5 0.5 0.5 0 0.5
		 0.5 0.5 0.5 0.5 ;
createNode transform -n "r_mirror_group" -p "controls";
	rename -uid "51105902-43E8-DFE3-126A-EB8048982414";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s" -type "double3" -1 1 1 ;
	setAttr -k on ".s";
createNode transform -n "r_ball_group" -p "r_mirror_group";
	rename -uid "11FF3558-4ABE-48D6-0A9A-4CA5E4DDB41E";
createNode transform -n "r_ball" -p "r_ball_group";
	rename -uid "F2E60898-45B8-581A-ED04-12B5F77023A8";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".internalName" -type "string" "r_ball";
createNode nurbsCurve -n "r_ballShape" -p "r_ball";
	rename -uid "1E07297D-44E1-E989-60EF-F1BFB4176363";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "r_highlight_rotate_aimGroup" -p "r_ball";
	rename -uid "23E7C52D-414B-B607-1AD3-0899E6C9FE2B";
createNode transform -n "r_highlight_mirror" -p "r_highlight_rotate_aimGroup";
	rename -uid "562BA14D-4FB7-C740-08C4-5EBE62E6A8C9";
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
createNode transform -n "r_highlight_rotate" -p "r_highlight_mirror";
	rename -uid "75CE9028-4EAA-6828-6B0A-14BA187E3483";
	setAttr ".r" -type "double3" -11.459155902616466 -17.188733853924695 -2.0807816916258703e-16 ;
createNode transform -n "r_highlight_offset" -p "r_highlight_rotate";
	rename -uid "953FFBE0-498D-74EC-B861-A68E3B432531";
	setAttr ".t" -type "double3" 0 0 1.1000633599883005 ;
createNode transform -n "r_highlight_rev" -p "r_highlight_offset";
	rename -uid "1BD5DDC9-4437-3D1E-2E81-3FA373A27918";
createNode transform -n "r_highlight" -p "r_highlight_rev";
	rename -uid "6B384F1F-4FD8-E388-09BF-EA86A2357631";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr -k on ".t" -type "double3" -0.3 0.2 -2.2204460492503131e-16 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr ".mnsl" -type "double3" 0.2 0.2 0.2 ;
	setAttr ".mxsl" -type "double3" 2 2 2 ;
	setAttr ".msxe" yes;
	setAttr ".msye" yes;
	setAttr ".msze" yes;
	setAttr ".xsxe" yes;
	setAttr ".xsye" yes;
	setAttr ".xsze" yes;
	setAttr -l on ".internalName" -type "string" "l_look_fk";
createNode nurbsCurve -n "r_highlightShape" -p "r_highlight";
	rename -uid "BA5C76A0-4D3C-807E-F56B-1E85CF635575";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.065041253935228777 0.065257415189371143 1.5415995372067317e-16
		0.0019467301270979791 0.091392022662172084 1.5415995372067317e-16
		-0.06114779368103327 0.065257415189371143 1.5415995372067317e-16
		-0.087282401153833414 0.0021628913812398237 1.5415995372067317e-16
		-0.06114779368103327 -0.06093163242689157 1.5415995372067317e-16
		0.0019467301270979791 -0.087066239899691422 1.5415995372067317e-16
		0.065041253935228777 -0.06093163242689157 1.5415995372067317e-16
		0.091175861408028983 0.0021628913812398237 1.5415995372067317e-16
		0.065041253935228777 0.065257415189371143 1.5415995372067317e-16
		0.0019467301270979791 0.091392022662172084 1.5415995372067317e-16
		-0.06114779368103327 0.065257415189371143 1.5415995372067317e-16
		;
createNode orientConstraint -n "r_highlight_rotate_aimGroup_orientConstraint1" -p
		 "r_highlight_rotate_aimGroup";
	rename -uid "63754D42-484B-4467-8191-57879D9EABCC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "highlightsAimW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180 0 0 ;
	setAttr ".o" -type "double3" -180 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "ffd2Lattice" -p "r_ball";
	rename -uid "0577405A-48BC-1B11-C67C-07A4B94BE391";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.90058246133940578 -8.5545623811356108e-06 0.0097725353962363481 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 2.0631563663482666 2.0646235871808276 -2.0806301575216106 ;
createNode lattice -n "ffd2LatticeShapeOrig" -p "ffd2Lattice";
	rename -uid "1F844F2B-4604-51DA-264E-F39FD3686381";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".sd" 3;
	setAttr ".td" 3;
	setAttr ".cc" -type "lattice" 3 3 2 18 -0.5 -0.5 -0.5 0 -0.5 -0.5 0.5
		 -0.5 -0.5 -0.5 0 -0.5 0 0 -0.5 0.5 0 -0.5 -0.5 0.5 -0.5 0 0.5 -0.5 0.5 0.5 -0.5 -0.5
		 -0.5 0.5 0 -0.5 0.5 0.5 -0.5 0.5 -0.5 0 0.5 0 0 0.5 0.5 0 0.5 -0.5 0.5 0.5 0 0.5
		 0.5 0.5 0.5 0.5 ;
createNode transform -n "look_fk_group" -p "controls";
	rename -uid "CDF9E494-4D3B-426C-E29B-398084D61470";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".s" -type "double3" 1.0000000000000002 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0.0028617609138024136 0.24206809244675881 ;
	setAttr ".rpt" -type "double3" 0 -0.002861760913802022 1.6915466454034764e-05 ;
	setAttr ".sp" -type "double3" 0 0.0028617609138024136 0.24206809244675889 ;
	setAttr ".spt" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode transform -n "look_fk" -p "look_fk_group";
	rename -uid "5D64B34D-4BD1-8ADF-1259-EBBB19D215DD";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mnrl" -type "double3" -25 -25 -45 ;
	setAttr ".mxrl" -type "double3" 25 25 45 ;
	setAttr ".dh" yes;
	setAttr -l on ".internalName" -type "string" "look_fk";
createNode nurbsCurve -n "look_fkShape" -p "look_fk";
	rename -uid "78843A15-42A7-AF59-ABF8-DE94FFCAEA48";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1.2068271412702316 0 2
		-1.2068271412702316 0 2
		;
createNode transform -n "l_look_fk_group" -p "look_fk";
	rename -uid "E06261B3-4A04-E7C7-95B1-2D8552D5B410";
createNode transform -n "l_look_fk" -p "l_look_fk_group";
	rename -uid "571D7501-4FBC-6975-CBAD-989D24E07A23";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "pupilSize" -ln "pupilSize" -at "double";
	addAttr -ci true -sn "squash" -ln "squash" -at "double";
	setAttr -l on -k off ".v";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr -k on ".t" -type "double3" 0 -4.3368086899420177e-19 -2.2204460492503131e-16 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr ".mnsl" -type "double3" 0.2 0.2 0.2 ;
	setAttr ".mxsl" -type "double3" 2 2 2 ;
	setAttr ".msxe" yes;
	setAttr ".msye" yes;
	setAttr ".msze" yes;
	setAttr ".xsxe" yes;
	setAttr ".xsye" yes;
	setAttr ".xsze" yes;
	setAttr -k on ".size" 1;
	setAttr -l on ".internalName" -type "string" "l_look_fk";
	setAttr -k on ".pupilSize" 1;
	setAttr -k on ".squash";
createNode nurbsCurve -n "l_look_fkShape" -p "l_look_fk";
	rename -uid "303C5DA8-43E4-3088-BA6F-0091530A5670";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.20832325800723234 0.20853941926137451 0
		0.0019467301270981729 0.29402337606479845 0
		-0.20442979775303707 0.20853941926137451 0
		-0.28991375455645801 0.0021628913812387334 0
		-0.20442979775303707 -0.20421363649889696 0
		0.0019467301270981729 -0.28969759330231765 0
		0.20832325800723234 -0.20421363649889696 0
		0.29380721481065381 0.0021628913812387334 0
		0.20832325800723234 0.20853941926137451 0
		0.0019467301270981729 0.29402337606479845 0
		-0.20442979775303707 0.20853941926137451 0
		;
createNode transform -n "r_look_fk_group" -p "look_fk";
	rename -uid "464FFBEB-41B4-E9DC-BC39-6A907E07BE94";
createNode transform -n "r_look_fk" -p "r_look_fk_group";
	rename -uid "14307A1A-4EED-EAE9-2184-5EB29F09F18E";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "pupilSize" -ln "pupilSize" -at "double";
	addAttr -ci true -sn "squash" -ln "squash" -at "double";
	setAttr -l on -k off ".v";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr -k on ".t";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr ".mnsl" -type "double3" 0.2 0.2 0.2 ;
	setAttr ".mxsl" -type "double3" 2 2 2 ;
	setAttr ".msxe" yes;
	setAttr ".msye" yes;
	setAttr ".msze" yes;
	setAttr ".xsxe" yes;
	setAttr ".xsye" yes;
	setAttr ".xsze" yes;
	setAttr -k on ".size" 1;
	setAttr -l on ".internalName" -type "string" "r_look_fk";
	setAttr -k on ".pupilSize" 1;
	setAttr -k on ".squash";
createNode nurbsCurve -n "r_look_fkShape" -p "r_look_fk";
	rename -uid "236F6915-4205-5C1D-98F3-339B88DA364F";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".tw" yes;
createNode transform -n "control_group" -p "controls";
	rename -uid "EE91957B-4F3C-0AEC-783E-F399E44E53D0";
createNode transform -n "control" -p "control_group";
	rename -uid "2BD05FCF-43F1-7FD8-C4AF-3EB0FE8FA4ED";
	addAttr -ci true -sn "eyesIk" -ln "eyesIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "ikParentToHead" -ln "ikParentToHead" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "initIrisSize" -ln "initIrisSize" -at "double";
	addAttr -ci true -sn "initPupilSize" -ln "initPupilSize" -at "double";
	addAttr -ci true -sn "deep" -ln "deep" -dv 1 -at "double";
	addAttr -ci true -sn "highlights" -ln "highlights" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 20;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".eyesIk";
	setAttr -k on ".ikParentToHead" 0;
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "control";
	setAttr -cb on ".initIrisSize" 1;
	setAttr -cb on ".initPupilSize" 1;
	setAttr -k on ".deep" 0;
	setAttr -cb on ".highlights";
createNode nurbsCurve -n "controlShape" -p "control";
	rename -uid "7A67D334-442E-9A1F-7470-D6ADDE8B980F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-3.4105781994005162 0.12414120654943581 -0.0012370336589981289
		-3.5347255691504196 0.17556217795155668 -0.0017494297776658716
		-3.6588729389003198 0.12414120654943581 -0.0012370336589981289
		-3.7102964631836755 1.4454157168689085e-14 -1.8067696460861357e-15
		-3.6588729389003198 -0.12414120654943581 0.001237033658994515
		-3.5347255691504196 -0.17556217795155668 0.0017494297776640656
		-3.4105781994005171 -0.12414120654943581 0.001237033658994515
		-3.3591546751171584 1.4454157168689085e-14 -1.8067696460861357e-15
		-3.4105781994005162 0.12414120654943581 -0.0012370336589981289
		-3.5347255691504196 0.17556217795155668 -0.0017494297776658716
		-3.6588729389003198 0.12414120654943581 -0.0012370336589981289
		;
createNode nurbsCurve -n "controlShape1" -p "control";
	rename -uid "94A984A4-4D1D-BFF4-55C0-9B80342EF8FC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-3.3089890867430314 0.13634413023400838 -0.0013586325040161951
		-3.5347255691504196 0.19281971812689602 -0.0019213965134645477
		-3.7604620515578029 0.13634413023400838 -0.0013586325040161951
		-3.9555126495672801 1.4454157168689085e-14 -1.8067696460861357e-15
		-3.7604620515578029 -0.13634413023400838 0.0013586325040180008
		-3.5347255691504196 -0.19281971812689602 0.0019213965134645477
		-3.3089890867430323 -0.13634413023400838 0.0013586325040180008
		-3.1139384887335591 1.4454157168689085e-14 -1.8067696460861357e-15
		-3.3089890867430314 0.13634413023400838 -0.0013586325040161951
		-3.5347255691504196 0.19281971812689602 -0.0019213965134645477
		-3.7604620515578029 0.13634413023400838 -0.0013586325040161951
		;
createNode transform -n "look_ik_group_2" -p "controls";
	rename -uid "8182DA82-4688-94A2-C40A-3ABB4AE49E49";
	setAttr ".rp" -type "double3" 0 3.5527136788005009e-15 -3.5527136788005009e-15 ;
	setAttr ".sp" -type "double3" 0 3.5527136788005009e-15 -3.5527136788005009e-15 ;
createNode transform -n "look_ik_group" -p "look_ik_group_2";
	rename -uid "06518CE8-4274-1937-CB1F-D1A3229F20C9";
createNode transform -n "look_ik" -p "look_ik_group";
	rename -uid "9B3A8468-4D9A-B9A8-25E3-71B74B95C1EC";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "look_ik";
createNode nurbsCurve -n "look_ikShape" -p "look_ik";
	rename -uid "D24384C5-4E7C-50AE-7558-26AAB50FDD84";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.3595358515258946 0.51951007767948476 -9.4527728874632289e-17
		-3.076980786243172e-16 0.016380238238512937 -1.2614469790050693e-16
		-1.3595358515258944 0.51951007767948476 -9.4527728874632289e-17
		-1.6878811870939967 6.2495441600053735e-16 -1.8197613451237002e-17
		-1.3595358515258944 -0.51951007767947943 5.8132501972158932e-17
		-5.4645992111460053e-16 -0.016380238238508493 8.9749470998032675e-17
		1.3595358515258944 -0.51951007767947943 5.8132501972158932e-17
		1.6878811870939967 4.7550414063630544e-16 -1.8197613451237002e-17
		1.3595358515258946 0.51951007767948476 -9.4527728874632289e-17
		-3.076980786243172e-16 0.016380238238512937 -1.2614469790050693e-16
		-1.3595358515258944 0.51951007767948476 -9.4527728874632289e-17
		;
createNode transform -n "l_look_ik_group" -p "look_ik";
	rename -uid "493ECE6F-4ED7-8533-178C-9AAEF82F6572";
	setAttr ".t" -type "double3" 1.2068271412702316 -1.7763568394002505e-15 -1.9721522630525361e-31 ;
createNode transform -n "l_look_ik" -p "l_look_ik_group";
	rename -uid "905A7B4A-4BD4-97F5-AC50-C087E0158DA7";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "pupilSize" -ln "pupilSize" -at "double";
	addAttr -ci true -sn "squash" -ln "squash" -at "double";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 0 -1.8588803333398729e-15 ;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 0.52322829853473729 0.52322829853473718 0.52322829853473729 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 2.3236004166748416e-16 5.8090010416871015e-17 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006262e-16 1.1102230246251563e-16 0 ;
	setAttr ".spt" -type "double3" -2.1172916818257853e-16 -5.2932292045644627e-17 0 ;
	setAttr -l on ".internalName" -type "string" "l_look_ik";
	setAttr -k on ".size" 1;
	setAttr -k on ".pupilSize" 1;
	setAttr -k on ".squash";
createNode nurbsCurve -n "l_look_ikShape" -p "l_look_ik";
	rename -uid "4176356A-4609-B61C-B750-E691E2E933AC";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.39870744165381106 0.39870744165381045 9.3761047758203106e-16
		6.5850816361284259e-16 0.56385747140589704 9.1105199326079e-16
		-0.39870744165381106 0.39870744165381061 9.3761047758203106e-16
		-0.56385747140589737 3.6432607091349744e-16 1.0017283306264452e-15
		-0.39870744165381106 -0.39870744165381045 1.0658461836708588e-15
		5.7533557542831361e-16 -0.56385747140589737 1.0924046679921014e-15
		0.39870744165381106 -0.39870744165381045 1.0658461836708588e-15
		0.56385747140589737 2.387867508155444e-16 1.0017283306264452e-15
		0.39870744165381106 0.39870744165381045 9.3761047758203106e-16
		6.5850816361284259e-16 0.56385747140589704 9.1105199326079e-16
		-0.39870744165381106 0.39870744165381061 9.3761047758203106e-16
		;
createNode transform -n "r_look_ik_group" -p "look_ik";
	rename -uid "CE0C12E8-4FD9-2FFC-0247-DD9CF36827CB";
createNode transform -n "r_look_ik" -p "r_look_ik_group";
	rename -uid "C0EF54FD-4097-EFB4-D537-BE854104478A";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "pupilSize" -ln "pupilSize" -at "double";
	addAttr -ci true -sn "squash" -ln "squash" -at "double";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 -1.8550760011301896e-19 1.1594225007063683e-20 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 0.52322829853473729 0.52322829853473718 0.52322829853473729 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 2.3236004166748416e-16 5.8090010416871015e-17 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006262e-16 1.1102230246251563e-16 0 ;
	setAttr ".spt" -type "double3" -2.1172916818257853e-16 -5.2932292045644627e-17 0 ;
	setAttr -l on ".internalName" -type "string" "r_look_ik";
	setAttr -k on ".size" 1;
	setAttr -k on ".pupilSize" 1;
	setAttr -k on ".squash";
createNode nurbsCurve -n "r_look_ikShape" -p "r_look_ik";
	rename -uid "C35EC0F5-4B26-C6B2-EA4B-FE977F61955F";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[3:10]" -type "double3" 0 1.2286302180296096e-17 
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode parentConstraint -n "look_ik_group_2_parentConstraint1" -p "look_ik_group_2";
	rename -uid "EDCC5383-44FF-B6D2-3A55-46A1E5CC987B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_connectorW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "eyes_world_connectorW1" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 1.5077362084000105e-06 3.09703539482275e-15 
		-3.9562508421947516e-15 ;
	setAttr ".tg[1].tot" -type "double3" 1.5077362084000105e-06 3.09703539482275e-15 
		-3.9562508421947516e-15 ;
	setAttr ".rst" -type "double3" 1.5077362082607966e-06 -4.556782839777509e-16 -4.0353716339425071e-16 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "highlightsAim_group" -p "controls";
	rename -uid "F0718958-4DC5-5571-B893-849F89A6ADD4";
createNode orientConstraint -n "highlightsAim_group_orientConstraint1" -p "highlightsAim_group";
	rename -uid "2CF02086-4206-E648-033C-AF8B55A0FC43";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_connectorW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "eyes_world_connectorW1" -dv 1 -min 
		0 -at "double";
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
createNode transform -n "highlightsAim_group_1" -p "highlightsAim_group";
	rename -uid "CDE4A040-4495-643A-6046-AAA04E7053A9";
createNode transform -n "highlightsAim" -p "highlightsAim_group_1";
	rename -uid "2B432892-4E17-96FB-0AC8-6499F3DCFACE";
	addAttr -ci true -sn "world" -ln "world" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_world" -ln "default_world" -dt "string";
	addAttr -ci true -sn "highlightsSizeLeft" -ln "highlightsSizeLeft" -at "double";
	addAttr -ci true -sn "highlightsSizeRight" -ln "highlightsSizeRight" -at "double";
	addAttr -ci true -sn "default_highlightsSizeLeft" -ln "default_highlightsSizeLeft" 
		-dt "string";
	addAttr -ci true -sn "default_highlightsSizeRight" -ln "default_highlightsSizeRight" 
		-dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".world";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_world" -type "string" "1.0";
	setAttr -k on ".highlightsSizeLeft" 10;
	setAttr -k on ".highlightsSizeRight" 10;
	setAttr ".default_highlightsSizeLeft" -type "string" "10.0";
	setAttr ".default_highlightsSizeRight" -type "string" "10.0";
createNode nurbsCurve -n "highlightsAimShape" -p "highlightsAim";
	rename -uid "B69274F5-4AF3-4278-BDBD-8FBCB18A4339";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		0.35416738001800363 0 0
		-0.35416738001800363 0 0
		0 0 0
		0 0.35416738001800363 0
		0 -0.35416738001800363 0
		0 0 0
		0 0 -0.35416738001800363
		0 0 0.35416738001800363
		;
createNode nurbsCurve -n "highlightsAim_1Shape" -p "highlightsAim";
	rename -uid "19770966-4F93-1C10-C585-06986D6C3985";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 13 0 no 3
		14 0 1 2 3 4 5 6 7 8 9 10 11 12 13
		14
		0 -6.2143168578736579e-15 0.36934238719531676
		-0.049731856109067746 -7.1054273576010019e-15 0.16249691445461456
		0 -7.9965378573283482e-15 0.14491279218797171
		0.049731856109067746 -7.1054273576010019e-15 0.16249691445461456
		0 -6.2143168578736579e-15 0.36934238719531676
		0 0.04973185610906089 0.16249691445461456
		0 -7.9965378573283482e-15 0.14491279218797171
		0 -0.049731856109074692 0.16249691445461456
		0 -6.2143168578736579e-15 0.36934238719531676
		-0.049731856109067746 -7.1054273576010019e-15 0.16249691445461456
		0 0.04973185610906089 0.16249691445461456
		0.049731856109067746 -7.1054273576010019e-15 0.16249691445461456
		0 -0.049731856109074692 0.16249691445461456
		-0.049731856109067746 -7.1054273576010019e-15 0.16249691445461456
		;
createNode transform -n "system" -p "mod";
	rename -uid "CCEF1261-427B-729B-EC99-06B061F9A78C";
	setAttr ".v" no;
createNode transform -n "l_global_parent" -p "system";
	rename -uid "1D4F381E-4F65-75B6-ED43-CBBD5A907FD6";
createNode joint -n "l_eye_joint" -p "l_global_parent";
	rename -uid "917F6148-40E3-9103-C629-4DA6437481EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".t" -type "double3" 0 0 8.8817841970012523e-16 ;
	setAttr ".ro" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.29131260542181342 -1.7706612644177678e-05 0.012200514637008183 0
		 -1.7706612644177698e-05 0.29156675227512807 0.00084593308660278787 0 -0.01220051463700819 -0.00084593308660278787 0.29131137771872589 0
		 0.1584417181875592 1.5765327694019893 0.35305138646045897 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "l_eye_joint_aimConstraint1" -p "l_eye_joint";
	rename -uid "1A0735CF-476C-EB81-C542-3A94BF82E31D";
	addAttr -ci true -sn "w0" -ln "l_lookW0" -dv 1 -at "double";
	addAttr -ci true -sn "w2" -ln "l_lookTargetW2" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".ove" yes;
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
	setAttr ".a" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 89.99998305712586 89.999949128402633 89.999966076542975 ;
	setAttr -k on ".w0";
	setAttr -k on ".w2";
createNode transform -n "r_global_parent" -p "system";
	rename -uid "8F7BACAB-4B56-6D48-5CF6-D29D89B74A53";
createNode joint -n "r_eye_joint" -p "r_global_parent";
	rename -uid "F8019E20-48EC-EDEE-A311-1AA838196576";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 1.7763568394002505e-15 -4.4408920985006262e-16 ;
	setAttr ".ro" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.29135525303873949 1.6162390951466542e-05 -0.011135673041461744 0
		 1.6162390951466505e-05 0.29156675200548238 0.00084605692935294104 0 0.011135673041461748 -0.00084605692935294094 0.29135402506600622 0
		 -0.15844171818755898 1.5765327694019893 0.35305138646045869 1;
	setAttr ".radi" 0.5;
createNode aimConstraint -n "r_eye_joint_aimConstraint1" -p "r_eye_joint";
	rename -uid "2D33AAAB-4779-9BD9-C4E1-A4A3BD77E1F2";
	addAttr -ci true -sn "w0" -ln "r_lookW0" -dv 1 -at "double";
	addAttr -ci true -sn "w2" -ln "r_lookTargetW2" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".ove" yes;
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
	setAttr ".a" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -89.999983175307065 89.999949246584023 -89.999966076542805 ;
	setAttr -k on ".w0";
	setAttr -k on ".w2";
createNode transform -n "l_slideJoints" -p "system";
	rename -uid "F3815F0E-4EEE-1FD4-4C3C-37BA1E596D9E";
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
createNode joint -n "l_slideJoint_1" -p "l_slideJoints";
	rename -uid "88B7D421-4A23-B741-A0AA-1EBAAAB70651";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 0 -1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 -1.0869280817694462 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_2" -p "l_slideJoints";
	rename -uid "83F1827A-44F1-79DE-C864-7B91BCF1FCA7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.56420750886564863 0 0 0 0 0.56420750886564863 0 0
		 0 0 1 0 0 0 -0.82563302195322774 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_3" -p "l_slideJoints";
	rename -uid "988323C0-4551-F437-5B32-6D896851EE7B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.79891725838638117 0 0 0 0 0.79891725838638117 0 0
		 0 0 1 0 0 0 -0.60144094826706662 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_4" -p "l_slideJoints";
	rename -uid "236102CD-4D18-3776-C23E-F8BE73A0D17F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.94799855942573441 0 0 0 0 0.94799855942573441 0 0
		 0 0 1 0 0 0 -0.31827461621488495 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_5" -p "l_slideJoints";
	rename -uid "645251F0-4D0A-A464-AF06-5E974F919F14";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.9999976559015521 0 0 0 0 0.9999976559015521 0 0 0 0 1 0
		 0 0 -0.0021652231758063976 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_6" -p "l_slideJoints";
	rename -uid "433D1067-4577-4573-F71E-D39C526277F1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.94966907917555288 0 0 0 0 0.94966907917555288 0 0
		 0 0 1 0 0 0 0.31325491226452851 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_7" -p "l_slideJoints";
	rename -uid "1023DF2F-47C4-BE56-0675-93940BB110A0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.79388373798097123 0 0 0 0 0.79388373798097123 0 0
		 0 0 1 0 0 0 0.60806957707926867 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_8" -p "l_slideJoints";
	rename -uid "180E66C6-48E0-D7A7-E5A3-1484A1CBEAF2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.58934292311702685 0 0 0 0 0.58934292311702685 0 0
		 0 0 1 0 0 0 0.80788298594033914 1;
	setAttr ".radi" 0.1;
createNode joint -n "l_slideJoint_9" -p "l_slideJoints";
	rename -uid "4364CF3F-4D76-9DC3-F51B-3A8693FE4330";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.43184965843897211 0 0 0 0 0.43184965843897211 0 0
		 0 0 1.1435378955463982 0 0 0 0.9019456039618704 1;
	setAttr ".radi" 0.1;
createNode joint -n "ext_slideJoint_9" -p "l_slideJoint_9";
	rename -uid "F39291BC-4218-61F9-A1F8-62AC2306BEFA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 0 -0.066556617061704015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43131179988993451 0 0 0 0 0.43131179988993451 0 0
		 0 0 1.1421136461085466 0 0 0 0.82618771183969431 1;
	setAttr ".radi" 0.1;
createNode joint -n "int_slideJoint_9" -p "l_slideJoint_9";
	rename -uid "A6B2F8F3-4D23-B8CB-352A-269FBC4A084B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 0 -0.094798917737457203 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.3054460870326659 0 0 0 0 0.3054460870326659 0 0 0 0 0.80882123846249931 0
		 0 0 0.87553399384135988 1;
	setAttr ".radi" 0.1;
createNode transform -n "r_slideJoints" -p "system";
	rename -uid "D537687A-4CC7-B133-28F3-DFAD30C5E412";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
createNode joint -n "r_slideJoint_1" -p "r_slideJoints";
	rename -uid "957BF675-4D72-0EE9-C888-8D972211157B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 0 -1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 -1.0869280817694462 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_2" -p "r_slideJoints";
	rename -uid "9C602566-415E-5D6D-799D-A9A477A9ACB6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.56420750886564863 0 0 0 0 0.56420750886564863 0 0
		 0 0 1 0 0 0 -0.82563302195322774 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_3" -p "r_slideJoints";
	rename -uid "E1BDB1A7-4996-4301-E72D-D09F50697BC5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.79891725838638117 0 0 0 0 0.79891725838638117 0 0
		 0 0 1 0 0 0 -0.60144094826706662 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_4" -p "r_slideJoints";
	rename -uid "D7CE7F57-4308-FCC4-8268-0A8E47FF89EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.94799855942573441 0 0 0 0 0.94799855942573441 0 0
		 0 0 1 0 0 0 -0.31827461621488495 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_5" -p "r_slideJoints";
	rename -uid "898A41E6-4F94-C17D-2D00-2395B12495F2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.9999976559015521 0 0 0 0 0.9999976559015521 0 0 0 0 1 0
		 0 0 -0.0021652231758063976 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_6" -p "r_slideJoints";
	rename -uid "9A00307F-4EC8-416F-079F-E799452221BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.94966907917555288 0 0 0 0 0.94966907917555288 0 0
		 0 0 1 0 0 0 0.31325491226452851 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_7" -p "r_slideJoints";
	rename -uid "08092EF5-4C3A-7FCB-78C7-DBB100C55907";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.79388373798097123 0 0 0 0 0.79388373798097123 0 0
		 0 0 1 0 0 0 0.60806957707926867 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_8" -p "r_slideJoints";
	rename -uid "DC40A070-4F67-436C-23D8-6C8E052BA371";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.58934292311702685 0 0 0 0 0.58934292311702685 0 0
		 0 0 1 0 0 0 0.80788298594033914 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_slideJoint_9" -p "r_slideJoints";
	rename -uid "4464AE50-45A2-32D8-0A0E-DD8D5BB90EF3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.43184965843897211 0 0 0 0 0.43184965843897211 0 0
		 0 0 1.1435378955463982 0 0 0 0.9019456039618704 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_ext_slideJoint_9" -p "r_slideJoint_9";
	rename -uid "34CB9327-48F2-54D7-2874-BB848931DA95";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 0 -0.066556617061704015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43131179988993451 0 0 0 0 0.43131179988993451 0 0
		 0 0 1.1421136461085466 0 0 0 0.82618771183969431 1;
	setAttr ".radi" 0.1;
createNode joint -n "r_int_slideJoint_9" -p "r_slideJoint_9";
	rename -uid "52A18B91-44C1-E60F-AA5B-F9AF2E8DC86E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 0 -0.094798917737457203 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43184965843897211 0 0 0 0 0.43184965843897211 0 0
		 0 0 1.1435378955463982 0 0 0 0.79353944907230245 1;
	setAttr ".radi" 0.1;
createNode transform -n "cluster41Handle" -p "system";
	rename -uid "AFAA6DDF-4513-EEC9-4C9D-B5B7EB7ED26B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
	setAttr ".rp" -type "double3" 1.2068271524837593 -2.92082599079313e-09 4.0885118068878512e-09 ;
	setAttr ".sp" -type "double3" 1.2068271524837593 -2.92082599079313e-09 4.0885118068878512e-09 ;
createNode clusterHandle -n "cluster41HandleShape" -p "cluster41Handle";
	rename -uid "C190A159-431B-4535-4ABA-53932F898080";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" 1.2068271524837593 -2.92082599079313e-09 4.0885118068878512e-09 ;
createNode transform -n "cluster42Handle" -p "system";
	rename -uid "119B86C6-42DA-88BF-301E-8099985B6B6E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
	setAttr ".rp" -type "double3" -1.2068271300567042 -2.9208260116098117e-09 4.0885119213796006e-09 ;
	setAttr ".sp" -type "double3" -1.2068271300567042 -2.9208260116098117e-09 4.0885119213796006e-09 ;
createNode clusterHandle -n "cluster42HandleShape" -p "cluster42Handle";
	rename -uid "0F9627E4-4BBA-A92E-76BD-DAB86151AEF9";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -1.2068271300567042 -2.9208260116098117e-09 4.0885119213796006e-09 ;
createNode transform -n "output" -p "mod";
	rename -uid "47A5FD35-4206-37EF-7381-23B283803EFA";
createNode transform -n "outJoints" -p "output";
	rename -uid "6247DAED-493D-FEFB-341A-ACB2635D08F5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "C3EB0357-49D9-70A6-BA9F-32A9B53C3F71";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".is" -type "double3" 1 0.99999999999999978 0.99999999999999978 ;
	setAttr ".bps" -type "matrix" 0.17480996251517314 -1.062532906229076e-05 0.0073212468896531966 0
		 -1.0625329062290778e-05 0.1749624701687193 0.00050762489644169738 0 -0.0073212468896531992 -0.00050762489644169738 0.17480922579892158 0
		 0.15103959121899693 3.2433937511837829 0.40954992416818325 1;
	setAttr ".ds" 2;
	setAttr ".radi" 0.5;
createNode joint -n "l_base_outJoint" -p "outJoints";
	rename -uid "12CA53A7-4F9D-EF8A-0448-7F98204D3CBC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".is" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".bps" -type "matrix" 0.17480996251517314 -1.062532906229076e-05 0.0073212468896531966 0
		 -1.0625329062290778e-05 0.1749624701687193 0.00050762489644169738 0 -0.0073212468896531992 -0.00050762489644169738 0.17480922579892158 0
		 0.15103959121899693 3.2433937511837829 0.40954992416818325 1;
createNode joint -n "l_outJoint" -p "l_base_outJoint";
	rename -uid "E3741FBD-4138-8814-6B63-B7A9ACD0C851";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 0 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.17480996251517314 -1.062532906229076e-05 0.0073212468896531966 0
		 -1.0625329062290778e-05 0.1749624701687193 0.00050762489644169738 0 -0.0073212468896531992 -0.00050762489644169738 0.17480922579892158 0
		 0.15103959121899693 3.2433937511837829 0.40954992416818325 1;
	setAttr ".radi" 0.5;
createNode joint -n "r_base_outJoint" -p "outJoints";
	rename -uid "E5D1F676-4911-1D86-583E-80964D9CCB6A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".is" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".bps" -type "matrix" -0.17483555436453857 9.6986773102036513e-06 -0.0066822600557929629 0
		 -9.6986773102036954e-06 0.17496247000691115 0.000507699211613946 0 -0.0066822600557929638 -0.000507699211613946 0.17483481748647883 0
		 -0.15103959121899563 3.2433937511837829 0.40954992416818314 1;
createNode joint -n "r_outJoint" -p "r_base_outJoint";
	rename -uid "5CB14720-470B-A2CC-B541-D2A8DA548740";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 30;
	setAttr ".t" -type "double3" 0 1.7763568394002501e-15 -4.4408920985006252e-16 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 0.99999999999999978 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.17483555436453857 9.6986773102036513e-06 -0.0066822600557929629 0
		 -9.6986773102036954e-06 0.17496247000691115 0.000507699211613946 0 -0.0066822600557929638 -0.000507699211613946 0.17483481748647883 0
		 -0.15103959121899563 3.2433937511837829 0.40954992416818314 1;
	setAttr ".radi" 0.5;
createNode transform -n "geo_group" -p "output";
	rename -uid "EDD7EC9D-45B6-D4D5-8099-F6B8237735F7";
	setAttr ".t" -type "double3" -1.3921395628662506e-16 0 0 ;
createNode transform -n "l_geo_scale_group" -p "geo_group";
	rename -uid "A97EB54D-492C-11E7-711E-D0B71AB3CCA7";
createNode transform -n "l_geo_group" -p "l_geo_scale_group";
	rename -uid "C38CC62A-462D-1DC7-5EB0-C6838E26727A";
createNode transform -n "l_glass" -p "l_geo_group";
	rename -uid "B8A8930B-4CE9-FB16-292B-DA94305E5661";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -1.2417994799118759e-07 1.8623471265133418e-07 0.0078996763500006617 ;
	setAttr ".sp" -type "double3" -1.2417994799118759e-07 1.8623471265133418e-07 0.0078996763500006617 ;
createNode mesh -n "l_glassShape" -p "l_glass";
	rename -uid "2EDC75F1-438D-4567-9764-2189C9C2C918";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000005960464478 0.43934881687164307 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "l_glassShapeOrig1" -p "l_glass";
	rename -uid "17E842B8-4D05-BDD1-EB34-2495AAC2D256";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 350 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0.1 0.050000001 0.1 0.1 0.1
		 0.15000001 0.1 0.2 0.1 0.25 0.1 0.30000001 0.1 0.35000002 0.1 0.40000004 0.1 0.45000005
		 0.1 0.50000006 0.1 0.55000007 0.1 0.60000008 0.1 0.6500001 0.1 0.70000011 0.1 0.75000012
		 0.1 0.80000013 0.1 0.85000014 0.1 0.90000015 0.1 0.95000017 0.1 1.000000119209 0.1
		 0 0.2 0.050000001 0.2 0.1 0.2 0.15000001 0.2 0.2 0.2 0.25 0.2 0.30000001 0.2 0.35000002
		 0.2 0.40000004 0.2 0.45000005 0.2 0.50000006 0.2 0.55000007 0.2 0.60000008 0.2 0.6500001
		 0.2 0.70000011 0.2 0.75000012 0.2 0.80000013 0.2 0.85000014 0.2 0.90000015 0.2 0.95000017
		 0.2 1.000000119209 0.2 0 0.30000001 0.050000001 0.30000001 0.1 0.30000001 0.15000001
		 0.30000001 0.2 0.30000001 0.25 0.30000001 0.30000001 0.30000001 0.35000002 0.30000001
		 0.40000004 0.30000001 0.45000005 0.30000001 0.50000006 0.30000001 0.55000007 0.30000001
		 0.60000008 0.30000001 0.6500001 0.30000001 0.70000011 0.30000001 0.75000012 0.30000001
		 0.80000013 0.30000001 0.85000014 0.30000001 0.90000015 0.30000001 0.95000017 0.30000001
		 1.000000119209 0.30000001 0 0.40000004 0.050000001 0.40000004 0.1 0.40000004 0.15000001
		 0.40000004 0.2 0.40000004 0.25 0.40000004 0.30000001 0.40000004 0.35000002 0.40000004
		 0.40000004 0.40000004 0.45000005 0.40000004 0.50000006 0.40000004 0.55000007 0.40000004
		 0.60000008 0.40000004 0.6500001 0.40000004 0.70000011 0.40000004 0.75000012 0.40000004
		 0.80000013 0.40000004 0.85000014 0.40000004 0.90000015 0.40000004 0.95000017 0.40000004
		 1.000000119209 0.40000004 0 0.50000006 0.050000001 0.50000006 0.1 0.50000006 0.15000001
		 0.50000006 0.2 0.50000006 0.25 0.50000006 0.30000001 0.50000006 0.35000002 0.50000006
		 0.40000004 0.50000006 0.45000005 0.50000006 0.50000006 0.50000006 0.55000007 0.50000006
		 0.60000008 0.50000006 0.6500001 0.50000006 0.70000011 0.50000006 0.75000012 0.50000006
		 0.80000013 0.50000006 0.85000014 0.50000006 0.90000015 0.50000006 0.95000017 0.50000006
		 1.000000119209 0.50000006 0 0.60000008 0.050000001 0.60000008 0.1 0.60000008 0.15000001
		 0.60000008 0.2 0.60000008 0.25 0.60000008 0.30000001 0.60000008 0.35000002 0.60000008
		 0.40000004 0.60000008 0.45000005 0.60000008 0.50000006 0.60000008 0.55000007 0.60000008
		 0.60000008 0.60000008 0.6500001 0.60000008 0.70000011 0.60000008 0.75000012 0.60000008
		 0.80000013 0.60000008 0.85000014 0.60000008 0.90000015 0.60000008 0.95000017 0.60000008
		 1.000000119209 0.60000008 0 0.70000011 0.050000001 0.70000011 0.1 0.70000011 0.15000001
		 0.70000011 0.2 0.70000011 0.25 0.70000011 0.30000001 0.70000011 0.35000002 0.70000011
		 0.40000004 0.70000011 0.45000005 0.70000011 0.50000006 0.70000011 0.55000007 0.70000011
		 0.60000008 0.70000011 0.6500001 0.70000011 0.70000011 0.70000011 0.75000012 0.70000011
		 0.80000013 0.70000011 0.85000014 0.70000011 0.90000015 0.70000011 0.95000017 0.70000011
		 1.000000119209 0.70000011 0 0.80000013 0.050000001 0.80000013 0.1 0.80000013 0.15000001
		 0.80000013 0.2 0.80000013 0.25 0.80000013 0.30000001 0.80000013 0.35000002 0.80000013
		 0.40000004 0.80000013 0.45000005 0.80000013 0.50000006 0.80000013 0.55000007 0.80000013
		 0.60000008 0.80000013 0.6500001 0.80000013 0.70000011 0.80000013 0.75000012 0.80000013
		 0.80000013 0.80000013 0.85000014 0.80000013 0.90000015 0.80000013 0.95000017 0.80000013
		 1.000000119209 0.80000013 0.025 0 0.075000003 0 0.125 0 0.17500001 0 0.22500001 0
		 0.27500001 0 0.32500002 0 0.375 0 0.42500001 0 0.47500002 0 0.52499998 0 0.57499999
		 0 0.625 0 0.67500001 0 0.72499996 0 0.77499998 0 0.82499999 0 0.875 0 0.92500001
		 0 0.97499996 0 0.15000001 0.88590831 0.10000001 0.88590831 0.050000004 0.88590831
		 1.000000119209 0.88590831 0 0.88590831 0.95000017 0.88590831 0.90000021 0.88590831
		 0.85000014 0.88590831 0.80000013 0.88590831 0.75000012 0.88590831 0.70000005 0.88590831
		 0.6500001 0.88590831 0.60000008 0.88590831 0.55000007 0.88590831 0.50000006 0.88590831
		 0.45000005 0.88590831 0.40000004 0.88590831 0.35000002 0.88590831 0.30000001 0.88590831
		 0.25 0.88590831 0.20000002 0.88590831 0 0 0.25 0 0.25 0.052631378 0 0.052631378 0.25
		 0.10526276 0 0.10526276 0.25 0.15789509 0 0.15789509 0.25 0.21052647 0 0.21052647
		 0.25 0.26315784 0 0.26315784 0.25 0.31578922 0 0.31578922 0.25 0.3684206 0 0.3684206
		 0.25 0.42105293 0 0.42105293 0.25 0.47368431 0 0.47368431 0.25 0.52631569 0 0.52631569
		 0.25 0.57894707 0 0.57894707 0.25 0.63157845 0 0.63157845 0.25 0.68421078 0 0.68421078
		 0.25 0.73684216 0 0.73684216 0.25 0.78947353 0 0.78947353 0.25 0.84210491 0 0.84210491
		 0.25 0.89473724 0 0.89473724 0.25 0.94736862 0 0.94736862 0.25 1 0 1 0.5 0;
	setAttr ".uvst[0].uvsp[250:349]" 0.5 0.052631378 0.5 0.10526276 0.5 0.15789509
		 0.5 0.21052647 0.5 0.26315784 0.5 0.31578922 0.5 0.3684206 0.5 0.42105293 0.5 0.47368431
		 0.5 0.52631569 0.5 0.57894707 0.5 0.63157845 0.5 0.68421078 0.5 0.73684216 0.5 0.78947353
		 0.5 0.84210491 0.5 0.89473724 0.5 0.94736862 0.5 1 0.75 0 0.75 0.052631378 0.75 0.10526276
		 0.75 0.15789509 0.75 0.21052647 0.75 0.26315784 0.75 0.31578922 0.75 0.3684206 0.75
		 0.42105293 0.75 0.47368431 0.75 0.52631569 0.75 0.57894707 0.75 0.63157845 0.75 0.68421078
		 0.75 0.73684216 0.75 0.78947353 0.75 0.84210491 0.75 0.89473724 0.75 0.94736862 0.75
		 1 0.91666603 0 0.91666603 0.052631378 0.91666603 0.10526276 0.91666603 0.15789509
		 0.91666603 0.21052647 0.91666603 0.26315784 0.91666603 0.31578922 0.91666603 0.3684206
		 0.91666603 0.42105293 0.91666603 0.47368431 0.91666603 0.52631569 0.91666603 0.57894707
		 0.91666603 0.63157845 0.91666603 0.68421078 0.91666603 0.73684216 0.91666603 0.78947353
		 0.91666603 0.84210491 0.91666603 0.89473724 0.91666603 0.94736862 0.91666603 1 1
		 0 1 0.052631378 1 0.10526276 1 0.15789509 1 0.21052647 1 0.26315784 1 0.31578922
		 1 0.3684206 1 0.42105293 1 0.47368431 1 0.52631569 1 0.57894707 1 0.63157845 1 0.68421078
		 1 0.73684216 1 0.78947353 1 0.84210491 1 0.89473724 1 0.94736862 1 1 0.40000004 0.87869763
		 0.35000002 0.87869763 0.30000001 0.87869763 0.25 0.87869763 0.20000002 0.87869763
		 0.15000001 0.87869763 0.10000001 0.87869763 0.050000004 0.87869763 1.000000119209
		 0.87869763 0 0.87869763 0.95000017 0.87869763 0.90000021 0.87869763 0.85000014 0.87869763
		 0.80000013 0.87869763 0.75000012 0.87869763 0.70000005 0.87869763 0.6500001 0.87869763
		 0.60000008 0.87869763 0.55000007 0.87869763 0.50000006 0.87869763 0.45000005 0.87869763;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 301 ".vt";
	setAttr ".vt[0:165]"  0.3025842 0.098296933 -0.97923034 0.25739342 0.18697196 -0.97923034
		 0.18700725 0.25734484 -0.9792304 0.098315515 0.30252689 -0.9792304 7.5955292e-10 0.31809565 -0.9792304
		 -0.098315515 0.30252689 -0.9792304 -0.1870072 0.25734457 -0.9792304 -0.2573933 0.18697171 -0.9792304
		 -0.3025842 0.098296933 -0.97923034 -0.31815559 -1.1391112e-09 -0.97923034 -0.3025842 -0.098296933 -0.9792304
		 -0.25739327 -0.18697184 -0.9792304 -0.18700717 -0.2573446 -0.9792304 -0.098315492 -0.30252701 -0.9792304
		 -8.7222221e-09 -0.31809542 -0.97923034 0.098315462 -0.30252701 -0.9792304 0.18700713 -0.2573446 -0.97923034
		 0.25739324 -0.18697184 -0.97923034 0.3025842 -0.098296933 -0.97923034 0.31815553 -1.1391112e-09 -0.97923034
		 0.57528871 0.18688725 -0.83316594 0.48937011 0.35548073 -0.83316588 0.35554799 0.48927754 -0.83316588
		 0.18692262 0.57517999 -0.83316594 7.5955292e-10 0.60478014 -0.83316594 -0.18692262 0.57517976 -0.83316594
		 -0.35554796 0.48927727 -0.83316588 -0.48936966 0.35548073 -0.83316588 -0.57528853 0.18688725 -0.83316594
		 -0.60489458 -1.1391112e-09 -0.83316588 -0.57528853 -0.18688725 -0.83316582 -0.48936963 -0.35548073 -0.83316588
		 -0.35554796 -0.48927703 -0.83316588 -0.18692255 -0.57517964 -0.83316594 -1.7267691e-08 -0.60478014 -0.83316594
		 0.18692252 -0.57517964 -0.83316594 0.35554796 -0.48927703 -0.83316594 0.48936951 -0.35548073 -0.83316588
		 0.57528836 -0.18688713 -0.83316594 0.60489398 -1.1391112e-09 -0.83316588 0.7916227 0.25716516 -0.60596228
		 0.67339486 0.48915747 -0.60596228 0.48925 0.67326748 -0.60596228 0.2572138 0.79147297 -0.60596228
		 7.5955292e-10 0.83220392 -0.60596216 -0.2572138 0.79147297 -0.60596228 -0.48924959 0.67326748 -0.60596228
		 -0.67339486 0.48915711 -0.60596228 -0.79162246 0.25716504 -0.60596228 -0.83236104 -1.1391112e-09 -0.60596228
		 -0.79162246 -0.2571651 -0.60596216 -0.6733948 -0.48915705 -0.60596216 -0.48924953 -0.67326689 -0.60596216
		 -0.25721374 -0.79147267 -0.60596216 -2.4046736e-08 -0.83220369 -0.60596234 0.25721365 -0.79147267 -0.60596216
		 0.48924941 -0.67326683 -0.60596216 0.67339408 -0.48915696 -0.60596216 0.79162228 -0.25716504 -0.60596216
		 0.83236086 -1.1391112e-09 -0.60596228 0.93077588 0.30237031 -0.31967938 0.79176521 0.57514232 -0.31967938
		 0.57525116 0.79161543 -0.31967944 0.30242753 0.93059981 -0.31967944 7.5955292e-10 0.97849101 -0.31967944
		 -0.30242753 0.93059969 -0.31967944 -0.57525104 0.79161531 -0.31967944 -0.79176503 0.5751422 -0.31967938
		 -0.93077552 0.30237031 -0.31967938 -0.97867531 -1.1391112e-09 -0.31967938 -0.93077552 -0.30237034 -0.31967938
		 -0.79176497 -0.57514209 -0.31967944 -0.57525086 -0.79161513 -0.31967944 -0.30242753 -0.93059945 -0.31967944
		 -2.8407237e-08 -0.97849017 -0.31967944 0.3024272 -0.93059939 -0.31967929 0.5752508 -0.79161513 -0.31967944
		 0.7917648 -0.57514203 -0.31967944 0.93077528 -0.30237034 -0.31967938 0.97867507 -1.1391112e-09 -0.31967938
		 0.98292118 0.31930989 -0.0022268149 0.83612233 0.60736376 -0.0022268149 0.60747856 0.8359642 -0.0022268149
		 0.31937021 0.98273528 -0.0022268149 1.2367991e-09 1.033308387 -0.0022268149 -0.31937021 0.98273522 -0.0022268149
		 -0.60747862 0.83596402 -0.0022268149 -0.83612198 0.60736376 -0.0022268149 -0.98292029 0.31930977 -0.0022268149
		 -1.033503532 -1.8548452e-09 -0.0022268149 -0.98292029 -0.31930977 -0.0022268149 -0.83612192 -0.60736376 -0.0022268149
		 -0.60747862 -0.83596379 -0.0022268149 -0.31937012 -0.98273438 -0.0022268149 -2.9564003e-08 -1.033308029 -0.0022268149
		 0.31937003 -0.98273432 -0.0022268149 0.6074779 -0.83596373 -0.0022268149 0.83612174 -0.60736376 -0.0022268149
		 0.98292005 -0.31930971 -0.0022268149 1.033503294 -1.8548452e-09 -0.0022268149 0.93594742 0.30405033 0.31544849
		 0.79616439 0.57833791 0.31544855 0.57844728 0.79601389 0.31544855 0.30410784 0.93577033 0.31544855
		 1.2733645e-09 0.98392773 0.3154484 -0.30410784 0.93577033 0.3154484 -0.5784471 0.79601377 0.31544855
		 -0.79616421 0.57833773 0.31544855 -0.93594712 0.30405033 0.31544849 -0.98411292 -3.0655376e-09 0.31544849
		 -0.93594712 -0.3040503 0.31544849 -0.79616416 -0.57833767 0.31544849 -0.57844698 -0.79601359 0.31544855
		 -0.30410784 -0.93576998 0.31544855 -2.8055481e-08 -0.98392677 0.31544855 0.30410749 -0.93576986 0.31544855
		 0.57844687 -0.79601347 0.31544855 0.79616392 -0.57833767 0.31544849 0.93594688 -0.3040503 0.31544849
		 0.98411268 -3.0655376e-09 0.31544849 0.78488785 0.25497732 0.6103158 0.66766584 0.4849959 0.6103158
		 0.48508763 0.66753966 0.61031574 0.25502551 0.78473932 0.61031574 -3.478654e-10 0.82512379 0.61031574
		 -0.25502554 0.78473932 0.61031586 -0.48508728 0.66753966 0.61031574 -0.6676659 0.48499551 0.6103158
		 -0.78488767 0.25497726 0.61031574 -0.82527959 -3.1905922e-11 0.61031574 -0.78488767 -0.25497717 0.61031574
		 -0.66766578 -0.48499551 0.61031574 -0.48508719 -0.66753894 0.61031574 -0.25502545 -0.78473908 0.61031574
		 -2.4943109e-08 -0.82512361 0.61031574 0.25502533 -0.78473908 0.61031574 0.48508707 -0.66753894 0.61031574
		 0.66766512 -0.48499539 0.61031574 0.78488743 -0.25497717 0.61031574 0.82527941 -3.1905922e-11 0.61031574
		 0.57874399 0.18800974 0.8144024 0.49230936 0.3576158 0.8144024 0.35768345 0.49221623 0.81440234
		 0.18804532 0.57863456 0.8144024 7.5955292e-10 0.60841262 0.8144024 -0.18804532 0.57863456 0.8144024
		 -0.35768342 0.49221584 0.8144024 -0.49230886 0.3576158 0.81440234 -0.57874376 0.18800974 0.8144024
		 -0.60852766 -1.1391112e-09 0.8144024 -0.57874376 -0.18800974 0.8144024 -0.49230883 -0.3576158 0.8144024
		 -0.35768342 -0.49221572 0.8144024 -0.18804525 -0.57863444 0.8144024 -1.7375969e-08 -0.60841262 0.8144024
		 0.18804519 -0.57863444 0.8144024 0.35768342 -0.49221572 0.8144024 0.49230874 -0.3576158 0.8144024
		 0.57874364 -0.18800959 0.8144024 0.60852712 -1.1391112e-09 0.8144024 7.5955292e-10 -1.1391112e-09 -1.029621243
		 0.13538525 0.41659421 0.89874673 0.25751805 0.3543762 0.89874679 0.35444319 0.25746933 0.89874679
		 0.41667295 0.13535964 0.89874673 0.43811572 -8.728785e-17 0.89874673;
	setAttr ".vt[166:300]" 0.41667289 -0.13535964 0.89874673 0.35444307 -0.25746933 0.89874673
		 0.25751793 -0.35437608 0.89874673 0.13538522 -0.41659415 0.89874673 -2.986573e-09 -0.43803287 0.89874673
		 -0.13538523 -0.41659415 0.89874673 -0.25751799 -0.35437608 0.89874673 -0.35444313 -0.25746933 0.89874673
		 -0.41667295 -0.13535964 0.89874673 -0.43811578 -9.1274735e-17 0.89874673 -0.41667295 0.13535957 0.89874673
		 -0.35444313 0.25746936 0.89874673 -0.25751799 0.35437614 0.89874673 -0.13538525 0.41659421 0.89874673
		 -1.1426574e-08 0.43803298 0.89874673 0.34559804 0.11227038 0.95478028 0.36338329 -1.7342389e-16 0.95478028
		 0.34559804 -0.11227038 0.95478028 0.29398325 -0.21355094 0.95478028 0.21359132 -0.29392767 0.95478028
		 0.1122916 -0.34553272 0.95478028 -3.1690894e-17 -0.36331457 0.95478028 -0.1122916 -0.34553272 0.95478028
		 -0.21359132 -0.29392767 0.95478028 -0.29398325 -0.21355094 0.95478028 -0.34559804 -0.11227038 0.95478028
		 -0.36338329 -1.4961879e-16 0.95478028 -0.34559804 0.11227038 0.95478028 -0.29398325 0.21355094 0.95478028
		 -0.21359132 0.29392767 0.95478028 -0.1122916 0.34553272 0.95478028 -1.1369768e-16 0.36331457 0.95478028
		 0.1122916 0.34553272 0.95478028 0.21359132 0.29392767 0.95478028 0.29398325 0.21355094 0.95478028
		 0.21790522 0.070788309 1.013528943 0.22911911 -1.4601695e-16 1.013528943 0.21790522 -0.070788309 1.013528943
		 0.18536125 -0.13464737 1.013528943 0.13467282 -0.1853262 1.013528943 0.070801698 -0.21786404 1.013528943
		 -3.8471098e-17 -0.2290758 1.013528943 -0.070801698 -0.21786404 1.013528943 -0.13467282 -0.1853262 1.013528943
		 -0.18536125 -0.13464737 1.013528943 -0.21790522 -0.070788309 1.013528943 -0.22911911 -9.4035513e-17 1.013528943
		 -0.21790522 0.070788309 1.013528943 -0.18536125 0.13464737 1.013528943 -0.13467282 0.1853262 1.013528943
		 -0.070801698 0.21786404 1.013528943 -5.3198791e-17 0.2290758 1.013528943 0.070801698 0.21786404 1.013528943
		 0.13467282 0.1853262 1.013528943 0.18536125 0.13464737 1.013528943 0.1099065 0.035704035 1.032290459
		 0.11556254 -1.2785927e-16 1.032290459 0.1099065 -0.035704035 1.032290459 0.093492053 -0.067913108 1.032290459
		 0.067925952 -0.093474381 1.032290459 0.035710786 -0.10988572 1.032290459 -4.6737845e-17 -0.1155407 1.032290459
		 -0.035710786 -0.10988572 1.032290459 -0.067925952 -0.093474381 1.032290459 -0.093492053 -0.067913108 1.032290459
		 -0.1099065 -0.035704035 1.032290459 -0.11556254 -4.6983544e-17 1.032290459 -0.1099065 0.035704035 1.032290459
		 -0.093492053 0.067913108 1.032290459 -0.067925952 0.093474381 1.032290459 -0.035710786 0.10988572 1.032290459
		 5.0161049e-19 0.1155407 1.032290459 0.035710786 0.10988572 1.032290459 0.067925952 0.093474381 1.032290459
		 0.093492053 0.067913108 1.032290459 0.036605377 0.01189156 1.039113045 0.03848917 -1.142863e-16 1.039113045
		 0.036605377 -0.01189156 1.039113045 0.031138394 -0.022619089 1.039113045 0.022623368 -0.031132506 1.039113045
		 0.011893808 -0.036598455 1.039113045 -5.1718952e-17 -0.038481895 1.039113045 -0.011893808 -0.036598455 1.039113045
		 -0.022623368 -0.031132506 1.039113045 -0.031138394 -0.022619089 1.039113045 -0.036605377 -0.01189156 1.039113045
		 -0.03848917 -1.5058606e-17 1.039113045 -0.036605377 0.01189156 1.039113045 -0.031138394 0.022619089 1.039113045
		 -0.022623368 0.031132506 1.039113045 -0.011893808 0.036598455 1.039113045 3.6319549e-17 0.038481895 1.039113045
		 0.011893808 0.036598455 1.039113045 0.022623368 0.031132506 1.039113045 0.031138394 0.022619089 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 -0.43261096 0.14053717 0.8966589 -0.36800081 0.26731774 0.8966589 -0.26736823 0.36793125 0.8966589
		 -0.14056382 0.43252921 0.8966589 -9.7719672e-09 0.45478806 0.8966589 0.14056382 0.43252921 0.8966589
		 0.26736829 0.36793134 0.89665896 0.36800089 0.26731771 0.89665896 0.43261096 0.14053725 0.8966589
		 0.45487392 -1.1391114e-09 0.8966589 0.43261087 -0.14053723 0.8966589 0.36800072 -0.26731771 0.8966589
		 0.26736817 -0.36793119 0.8966589 0.14056379 -0.43252912 0.8966589 -3.5152725e-09 -0.45478797 0.8966589
		 -0.1405638 -0.43252912 0.8966589 -0.26736823 -0.36793119 0.8966589 -0.36800081 -0.26731771 0.8966589
		 -0.43261096 -0.14053725 0.8966589 -0.45487404 -1.1391114e-09 0.8966589;
	setAttr -s 600 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 4 1 4 5 1 5 6 1 6 7 1 7 8 1 8 9 1
		 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 0 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 30 31 1
		 31 32 1 32 33 1 33 34 1 34 35 1 35 36 1 36 37 1 37 38 1 38 39 1 39 20 1 40 41 1 41 42 1
		 42 43 1 43 44 1 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 49 50 1 50 51 1 51 52 1 52 53 1
		 53 54 1 54 55 1 55 56 1 56 57 1 57 58 1 58 59 1 59 40 1 60 61 1 61 62 1 62 63 1 63 64 1
		 64 65 1 65 66 1 66 67 1 67 68 1 68 69 1 69 70 1 70 71 1 71 72 1 72 73 1 73 74 1 74 75 1
		 75 76 1 76 77 1 77 78 1 78 79 1 79 60 1 80 81 1 81 82 1 82 83 1 83 84 1 84 85 1 85 86 1
		 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1 94 95 1 95 96 1 96 97 1
		 97 98 1 98 99 1 99 80 1 100 101 1 101 102 1 102 103 1 103 104 1 104 105 1 105 106 1
		 106 107 1 107 108 1 108 109 1 109 110 1 110 111 1 111 112 1 112 113 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 100 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 127 128 1 128 129 1 129 130 1 130 131 1 131 132 1 132 133 1
		 133 134 1 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 120 1 140 141 1 141 142 1
		 142 143 1 143 144 1 144 145 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1
		 151 152 1 152 153 1 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 159 140 1
		 0 20 1 1 21 1 2 22 1 3 23 1 4 24 1 5 25 1;
	setAttr ".ed[166:331]" 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1
		 13 33 1 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 20 40 1 21 41 1 22 42 1 23 43 1
		 24 44 1 25 45 1 26 46 1 27 47 1 28 48 1 29 49 1 30 50 1 31 51 1 32 52 1 33 53 1 34 54 1
		 35 55 1 36 56 1 37 57 1 38 58 1 39 59 1 40 60 1 41 61 1 42 62 1 43 63 1 44 64 1 45 65 1
		 46 66 1 47 67 1 48 68 1 49 69 1 50 70 1 51 71 1 52 72 1 53 73 1 54 74 1 55 75 1 56 76 1
		 57 77 1 58 78 1 59 79 1 60 80 1 61 81 1 62 82 1 63 83 1 64 84 1 65 85 1 66 86 1 67 87 1
		 68 88 1 69 89 1 70 90 1 71 91 1 72 92 1 73 93 1 74 94 1 75 95 1 76 96 1 77 97 1 78 98 1
		 79 99 1 80 100 1 81 101 1 82 102 1 83 103 1 84 104 1 85 105 1 86 106 1 87 107 1 88 108 1
		 89 109 1 90 110 1 91 111 1 92 112 1 93 113 1 94 114 1 95 115 1 96 116 1 97 117 1
		 98 118 1 99 119 1 100 120 1 101 121 1 102 122 1 103 123 1 104 124 1 105 125 1 106 126 1
		 107 127 1 108 128 1 109 129 1 110 130 1 111 131 1 112 132 1 113 133 1 114 134 1 115 135 1
		 116 136 1 117 137 1 118 138 1 119 139 1 120 140 1 121 141 1 122 142 1 123 143 1 124 144 1
		 125 145 1 126 146 1 127 147 1 128 148 1 129 149 1 130 150 1 131 151 1 132 152 1 133 153 1
		 134 154 1 135 155 1 136 156 1 137 157 1 138 158 1 139 159 1 140 289 1 141 288 1 142 287 1
		 143 286 1 144 285 1 145 284 1 146 283 1 147 282 1 148 281 1 149 300 1 150 299 1 151 298 1
		 152 297 1 153 296 1 154 295 1 155 294 1 156 293 1 157 292 1 158 291 1 159 290 1 160 0 1
		 160 1 1 160 2 1 160 3 1 160 4 1 160 5 1 160 6 1 160 7 1 160 8 1 160 9 1 160 10 1
		 160 11 1;
	setAttr ".ed[332:497]" 160 12 1 160 13 1 160 14 1 160 15 1 160 16 1 160 17 1
		 160 18 1 160 19 1 161 162 0 162 163 0 163 164 0 164 165 0 165 166 0 166 167 0 167 168 0
		 168 169 0 169 170 0 170 171 0 171 172 0 172 173 0 173 174 0 174 175 0 175 176 0 176 177 0
		 177 178 0 178 179 0 179 180 0 180 161 0 164 181 1 181 182 1 182 165 1 182 183 1 183 166 1
		 183 184 1 184 167 1 184 185 1 185 168 1 185 186 1 186 169 1 186 187 1 187 170 1 187 188 1
		 188 171 1 188 189 1 189 172 1 189 190 1 190 173 1 190 191 1 191 174 1 191 192 1 192 175 1
		 192 193 1 193 176 1 193 194 1 194 177 1 194 195 1 195 178 1 195 196 1 196 179 1 196 197 1
		 197 180 1 197 198 1 198 161 1 198 199 1 199 162 1 199 200 1 200 163 1 200 181 1 181 201 1
		 201 202 1 202 182 1 202 203 1 203 183 1 203 204 1 204 184 1 204 205 1 205 185 1 205 206 1
		 206 186 1 206 207 1 207 187 1 207 208 1 208 188 1 208 209 1 209 189 1 209 210 1 210 190 1
		 210 211 1 211 191 1 211 212 1 212 192 1 212 213 1 213 193 1 213 214 1 214 194 1 214 215 1
		 215 195 1 215 216 1 216 196 1 216 217 1 217 197 1 217 218 1 218 198 1 218 219 1 219 199 1
		 219 220 1 220 200 1 220 201 1 201 221 1 221 222 1 222 202 1 222 223 1 223 203 1 223 224 1
		 224 204 1 224 225 1 225 205 1 225 226 1 226 206 1 226 227 1 227 207 1 227 228 1 228 208 1
		 228 229 1 229 209 1 229 230 1 230 210 1 230 231 1 231 211 1 231 232 1 232 212 1 232 233 1
		 233 213 1 233 234 1 234 214 1 234 235 1 235 215 1 235 236 1 236 216 1 236 237 1 237 217 1
		 237 238 1 238 218 1 238 239 1 239 219 1 239 240 1 240 220 1 240 221 1 221 241 1 241 242 1
		 242 222 1 242 243 1 243 223 1 243 244 1 244 224 1 244 245 1 245 225 1 245 246 1 246 226 1
		 246 247 1 247 227 1 247 248 1 248 228 1 248 249 1 249 229 1 249 250 1;
	setAttr ".ed[498:599]" 250 230 1 250 251 1 251 231 1 251 252 1 252 232 1 252 253 1
		 253 233 1 253 254 1 254 234 1 254 255 1 255 235 1 255 256 1 256 236 1 256 257 1 257 237 1
		 257 258 1 258 238 1 258 259 1 259 239 1 259 260 1 260 240 1 260 241 1 241 261 1 261 262 0
		 262 242 1 262 263 0 263 243 1 263 264 0 264 244 1 264 265 0 265 245 1 265 266 0 266 246 1
		 266 267 0 267 247 1 267 268 0 268 248 1 268 269 0 269 249 1 269 270 0 270 250 1 270 271 0
		 271 251 1 271 272 0 272 252 1 272 273 0 273 253 1 273 274 0 274 254 1 274 275 0 275 255 1
		 275 276 0 276 256 1 276 277 0 277 257 1 277 278 0 278 258 1 278 279 0 279 259 1 279 280 0
		 280 260 1 280 261 0 281 176 1 282 177 1 281 282 1 283 178 1 282 283 1 284 179 1 283 284 1
		 285 180 1 284 285 1 286 161 1 285 286 1 287 162 1 286 287 1 288 163 1 287 288 1 289 164 1
		 288 289 1 290 165 1 289 290 1 291 166 1 290 291 1 292 167 1 291 292 1 293 168 1 292 293 1
		 294 169 1 293 294 1 295 170 1 294 295 1 296 171 1 295 296 1 297 172 1 296 297 1 298 173 1
		 297 298 1 299 174 1 298 299 1 300 175 1 299 300 1 300 281 1;
	setAttr -s 300 -ch 1180 ".fc[0:299]" -type "polyFaces" 
		f 3 -1 -321 321
		mu 0 3 1 0 168
		f 3 -2 -322 322
		mu 0 3 2 1 169
		f 3 -3 -323 323
		mu 0 3 3 2 170
		f 3 -4 -324 324
		mu 0 3 4 3 171
		f 3 -5 -325 325
		mu 0 3 5 4 172
		f 3 -6 -326 326
		mu 0 3 6 5 173
		f 3 -7 -327 327
		mu 0 3 7 6 174
		f 3 -8 -328 328
		mu 0 3 8 7 175
		f 3 -9 -329 329
		mu 0 3 9 8 176
		f 3 -10 -330 330
		mu 0 3 10 9 177
		f 3 -11 -331 331
		mu 0 3 11 10 178
		f 3 -12 -332 332
		mu 0 3 12 11 179
		f 3 -13 -333 333
		mu 0 3 13 12 180
		f 3 -14 -334 334
		mu 0 3 14 13 181
		f 3 -15 -335 335
		mu 0 3 15 14 182
		f 3 -16 -336 336
		mu 0 3 16 15 183
		f 3 -17 -337 337
		mu 0 3 17 16 184
		f 3 -18 -338 338
		mu 0 3 18 17 185
		f 3 -19 -339 339
		mu 0 3 19 18 186
		f 3 -20 -340 320
		mu 0 3 20 19 187
		f 4 161 -21 -161 0
		mu 0 4 1 22 21 0
		f 4 162 -22 -162 1
		mu 0 4 2 23 22 1
		f 4 163 -23 -163 2
		mu 0 4 3 24 23 2
		f 4 164 -24 -164 3
		mu 0 4 4 25 24 3
		f 4 165 -25 -165 4
		mu 0 4 5 26 25 4
		f 4 166 -26 -166 5
		mu 0 4 6 27 26 5
		f 4 167 -27 -167 6
		mu 0 4 7 28 27 6
		f 4 168 -28 -168 7
		mu 0 4 8 29 28 7
		f 4 169 -29 -169 8
		mu 0 4 9 30 29 8
		f 4 170 -30 -170 9
		mu 0 4 10 31 30 9
		f 4 171 -31 -171 10
		mu 0 4 11 32 31 10
		f 4 172 -32 -172 11
		mu 0 4 12 33 32 11
		f 4 173 -33 -173 12
		mu 0 4 13 34 33 12
		f 4 174 -34 -174 13
		mu 0 4 14 35 34 13
		f 4 175 -35 -175 14
		mu 0 4 15 36 35 14
		f 4 176 -36 -176 15
		mu 0 4 16 37 36 15
		f 4 177 -37 -177 16
		mu 0 4 17 38 37 16
		f 4 178 -38 -178 17
		mu 0 4 18 39 38 17
		f 4 179 -39 -179 18
		mu 0 4 19 40 39 18
		f 4 160 -40 -180 19
		mu 0 4 20 41 40 19
		f 4 181 -41 -181 20
		mu 0 4 22 43 42 21
		f 4 182 -42 -182 21
		mu 0 4 23 44 43 22
		f 4 183 -43 -183 22
		mu 0 4 24 45 44 23
		f 4 184 -44 -184 23
		mu 0 4 25 46 45 24
		f 4 185 -45 -185 24
		mu 0 4 26 47 46 25
		f 4 186 -46 -186 25
		mu 0 4 27 48 47 26
		f 4 187 -47 -187 26
		mu 0 4 28 49 48 27
		f 4 188 -48 -188 27
		mu 0 4 29 50 49 28
		f 4 189 -49 -189 28
		mu 0 4 30 51 50 29
		f 4 190 -50 -190 29
		mu 0 4 31 52 51 30
		f 4 191 -51 -191 30
		mu 0 4 32 53 52 31
		f 4 192 -52 -192 31
		mu 0 4 33 54 53 32
		f 4 193 -53 -193 32
		mu 0 4 34 55 54 33
		f 4 194 -54 -194 33
		mu 0 4 35 56 55 34
		f 4 195 -55 -195 34
		mu 0 4 36 57 56 35
		f 4 196 -56 -196 35
		mu 0 4 37 58 57 36
		f 4 197 -57 -197 36
		mu 0 4 38 59 58 37
		f 4 198 -58 -198 37
		mu 0 4 39 60 59 38
		f 4 199 -59 -199 38
		mu 0 4 40 61 60 39
		f 4 180 -60 -200 39
		mu 0 4 41 62 61 40
		f 4 201 -61 -201 40
		mu 0 4 43 64 63 42
		f 4 202 -62 -202 41
		mu 0 4 44 65 64 43
		f 4 203 -63 -203 42
		mu 0 4 45 66 65 44
		f 4 204 -64 -204 43
		mu 0 4 46 67 66 45
		f 4 205 -65 -205 44
		mu 0 4 47 68 67 46
		f 4 206 -66 -206 45
		mu 0 4 48 69 68 47
		f 4 207 -67 -207 46
		mu 0 4 49 70 69 48
		f 4 208 -68 -208 47
		mu 0 4 50 71 70 49
		f 4 209 -69 -209 48
		mu 0 4 51 72 71 50
		f 4 210 -70 -210 49
		mu 0 4 52 73 72 51
		f 4 211 -71 -211 50
		mu 0 4 53 74 73 52
		f 4 212 -72 -212 51
		mu 0 4 54 75 74 53
		f 4 213 -73 -213 52
		mu 0 4 55 76 75 54
		f 4 214 -74 -214 53
		mu 0 4 56 77 76 55
		f 4 215 -75 -215 54
		mu 0 4 57 78 77 56
		f 4 216 -76 -216 55
		mu 0 4 58 79 78 57
		f 4 217 -77 -217 56
		mu 0 4 59 80 79 58
		f 4 218 -78 -218 57
		mu 0 4 60 81 80 59
		f 4 219 -79 -219 58
		mu 0 4 61 82 81 60
		f 4 200 -80 -220 59
		mu 0 4 62 83 82 61
		f 4 221 -81 -221 60
		mu 0 4 64 85 84 63
		f 4 222 -82 -222 61
		mu 0 4 65 86 85 64
		f 4 223 -83 -223 62
		mu 0 4 66 87 86 65
		f 4 224 -84 -224 63
		mu 0 4 67 88 87 66
		f 4 225 -85 -225 64
		mu 0 4 68 89 88 67
		f 4 226 -86 -226 65
		mu 0 4 69 90 89 68
		f 4 227 -87 -227 66
		mu 0 4 70 91 90 69
		f 4 228 -88 -228 67
		mu 0 4 71 92 91 70
		f 4 229 -89 -229 68
		mu 0 4 72 93 92 71
		f 4 230 -90 -230 69
		mu 0 4 73 94 93 72
		f 4 231 -91 -231 70
		mu 0 4 74 95 94 73
		f 4 232 -92 -232 71
		mu 0 4 75 96 95 74
		f 4 233 -93 -233 72
		mu 0 4 76 97 96 75
		f 4 234 -94 -234 73
		mu 0 4 77 98 97 76
		f 4 235 -95 -235 74
		mu 0 4 78 99 98 77
		f 4 236 -96 -236 75
		mu 0 4 79 100 99 78
		f 4 237 -97 -237 76
		mu 0 4 80 101 100 79
		f 4 238 -98 -238 77
		mu 0 4 81 102 101 80
		f 4 239 -99 -239 78
		mu 0 4 82 103 102 81
		f 4 220 -100 -240 79
		mu 0 4 83 104 103 82
		f 4 241 -101 -241 80
		mu 0 4 85 106 105 84
		f 4 242 -102 -242 81
		mu 0 4 86 107 106 85
		f 4 243 -103 -243 82
		mu 0 4 87 108 107 86
		f 4 244 -104 -244 83
		mu 0 4 88 109 108 87
		f 4 245 -105 -245 84
		mu 0 4 89 110 109 88
		f 4 246 -106 -246 85
		mu 0 4 90 111 110 89
		f 4 247 -107 -247 86
		mu 0 4 91 112 111 90
		f 4 248 -108 -248 87
		mu 0 4 92 113 112 91
		f 4 249 -109 -249 88
		mu 0 4 93 114 113 92
		f 4 250 -110 -250 89
		mu 0 4 94 115 114 93
		f 4 251 -111 -251 90
		mu 0 4 95 116 115 94
		f 4 252 -112 -252 91
		mu 0 4 96 117 116 95
		f 4 253 -113 -253 92
		mu 0 4 97 118 117 96
		f 4 254 -114 -254 93
		mu 0 4 98 119 118 97
		f 4 255 -115 -255 94
		mu 0 4 99 120 119 98
		f 4 256 -116 -256 95
		mu 0 4 100 121 120 99
		f 4 257 -117 -257 96
		mu 0 4 101 122 121 100
		f 4 258 -118 -258 97
		mu 0 4 102 123 122 101
		f 4 259 -119 -259 98
		mu 0 4 103 124 123 102
		f 4 240 -120 -260 99
		mu 0 4 104 125 124 103
		f 4 261 -121 -261 100
		mu 0 4 106 127 126 105
		f 4 262 -122 -262 101
		mu 0 4 107 128 127 106
		f 4 263 -123 -263 102
		mu 0 4 108 129 128 107
		f 4 264 -124 -264 103
		mu 0 4 109 130 129 108
		f 4 265 -125 -265 104
		mu 0 4 110 131 130 109
		f 4 266 -126 -266 105
		mu 0 4 111 132 131 110
		f 4 267 -127 -267 106
		mu 0 4 112 133 132 111
		f 4 268 -128 -268 107
		mu 0 4 113 134 133 112
		f 4 269 -129 -269 108
		mu 0 4 114 135 134 113
		f 4 270 -130 -270 109
		mu 0 4 115 136 135 114
		f 4 271 -131 -271 110
		mu 0 4 116 137 136 115
		f 4 272 -132 -272 111
		mu 0 4 117 138 137 116
		f 4 273 -133 -273 112
		mu 0 4 118 139 138 117
		f 4 274 -134 -274 113
		mu 0 4 119 140 139 118
		f 4 275 -135 -275 114
		mu 0 4 120 141 140 119
		f 4 276 -136 -276 115
		mu 0 4 121 142 141 120
		f 4 277 -137 -277 116
		mu 0 4 122 143 142 121
		f 4 278 -138 -278 117
		mu 0 4 123 144 143 122
		f 4 279 -139 -279 118
		mu 0 4 124 145 144 123
		f 4 260 -140 -280 119
		mu 0 4 125 146 145 124
		f 4 281 -141 -281 120
		mu 0 4 127 148 147 126
		f 4 282 -142 -282 121
		mu 0 4 128 149 148 127
		f 4 283 -143 -283 122
		mu 0 4 129 150 149 128
		f 4 284 -144 -284 123
		mu 0 4 130 151 150 129
		f 4 285 -145 -285 124
		mu 0 4 131 152 151 130
		f 4 286 -146 -286 125
		mu 0 4 132 153 152 131
		f 4 287 -147 -287 126
		mu 0 4 133 154 153 132
		f 4 288 -148 -288 127
		mu 0 4 134 155 154 133
		f 4 289 -149 -289 128
		mu 0 4 135 156 155 134
		f 4 290 -150 -290 129
		mu 0 4 136 157 156 135
		f 4 291 -151 -291 130
		mu 0 4 137 158 157 136
		f 4 292 -152 -292 131
		mu 0 4 138 159 158 137
		f 4 293 -153 -293 132
		mu 0 4 139 160 159 138
		f 4 294 -154 -294 133
		mu 0 4 140 161 160 139
		f 4 295 -155 -295 134
		mu 0 4 141 162 161 140
		f 4 296 -156 -296 135
		mu 0 4 142 163 162 141
		f 4 297 -157 -297 136
		mu 0 4 143 164 163 142
		f 4 298 -158 -298 137
		mu 0 4 144 165 164 143
		f 4 299 -159 -299 138
		mu 0 4 145 166 165 144
		f 4 280 -160 -300 139
		mu 0 4 146 167 166 145
		f 4 301 576 -301 140
		mu 0 4 148 336 338 147
		f 4 302 574 -302 141
		mu 0 4 149 335 336 148
		f 4 303 572 -303 142
		mu 0 4 150 334 335 149
		f 4 304 570 -304 143
		mu 0 4 151 333 334 150
		f 4 305 568 -305 144
		mu 0 4 152 332 333 151
		f 4 306 566 -306 145
		mu 0 4 153 331 332 152
		f 4 307 564 -307 146
		mu 0 4 154 330 331 153
		f 4 308 562 -308 147
		mu 0 4 155 329 330 154
		f 4 309 599 -309 148
		mu 0 4 156 349 329 155
		f 4 310 598 -310 149
		mu 0 4 157 348 349 156
		f 4 311 596 -311 150
		mu 0 4 158 347 348 157
		f 4 312 594 -312 151
		mu 0 4 159 346 347 158
		f 4 313 592 -313 152
		mu 0 4 160 345 346 159
		f 4 314 590 -314 153
		mu 0 4 161 344 345 160
		f 4 315 588 -315 154
		mu 0 4 162 343 344 161
		f 4 316 586 -316 155
		mu 0 4 163 342 343 162
		f 4 317 584 -317 156
		mu 0 4 164 341 342 163
		f 4 318 582 -318 157
		mu 0 4 165 340 341 164
		f 4 319 580 -319 158
		mu 0 4 166 339 340 165
		f 4 300 578 -320 159
		mu 0 4 167 337 339 166
		f 4 360 361 362 -344
		mu 0 4 209 210 211 212
		f 4 -363 363 364 -345
		mu 0 4 212 211 213 214
		f 4 -365 365 366 -346
		mu 0 4 214 213 215 216
		f 4 -367 367 368 -347
		mu 0 4 216 215 217 218
		f 4 -369 369 370 -348
		mu 0 4 218 217 219 220
		f 4 -371 371 372 -349
		mu 0 4 220 219 221 222
		f 4 -373 373 374 -350
		mu 0 4 222 221 223 224
		f 4 -375 375 376 -351
		mu 0 4 224 223 225 226
		f 4 -377 377 378 -352
		mu 0 4 226 225 227 228
		f 4 -379 379 380 -353
		mu 0 4 228 227 229 230
		f 4 -381 381 382 -354
		mu 0 4 230 229 231 232
		f 4 -383 383 384 -355
		mu 0 4 232 231 233 234
		f 4 -385 385 386 -356
		mu 0 4 234 233 235 236
		f 4 -387 387 388 -357
		mu 0 4 236 235 237 238
		f 4 -389 389 390 -358
		mu 0 4 238 237 239 240
		f 4 -391 391 392 -359
		mu 0 4 240 239 241 242
		f 4 -393 393 394 -360
		mu 0 4 242 241 243 244
		f 4 -395 395 396 -341
		mu 0 4 244 243 245 246
		f 4 -397 397 398 -342
		mu 0 4 246 245 247 248
		f 4 -399 399 -361 -343
		mu 0 4 248 247 210 209
		f 4 400 401 402 -362
		mu 0 4 210 249 250 211
		f 4 -403 403 404 -364
		mu 0 4 211 250 251 213
		f 4 -405 405 406 -366
		mu 0 4 213 251 252 215
		f 4 -407 407 408 -368
		mu 0 4 215 252 253 217
		f 4 -409 409 410 -370
		mu 0 4 217 253 254 219
		f 4 -411 411 412 -372
		mu 0 4 219 254 255 221
		f 4 -413 413 414 -374
		mu 0 4 221 255 256 223
		f 4 -415 415 416 -376
		mu 0 4 223 256 257 225
		f 4 -417 417 418 -378
		mu 0 4 225 257 258 227
		f 4 -419 419 420 -380
		mu 0 4 227 258 259 229
		f 4 -421 421 422 -382
		mu 0 4 229 259 260 231
		f 4 -423 423 424 -384
		mu 0 4 231 260 261 233
		f 4 -425 425 426 -386
		mu 0 4 233 261 262 235
		f 4 -427 427 428 -388
		mu 0 4 235 262 263 237
		f 4 -429 429 430 -390
		mu 0 4 237 263 264 239
		f 4 -431 431 432 -392
		mu 0 4 239 264 265 241
		f 4 -433 433 434 -394
		mu 0 4 241 265 266 243
		f 4 -435 435 436 -396
		mu 0 4 243 266 267 245
		f 4 -437 437 438 -398
		mu 0 4 245 267 268 247
		f 4 -439 439 -401 -400
		mu 0 4 247 268 249 210
		f 4 440 441 442 -402
		mu 0 4 249 269 270 250
		f 4 -443 443 444 -404
		mu 0 4 250 270 271 251
		f 4 -445 445 446 -406
		mu 0 4 251 271 272 252
		f 4 -447 447 448 -408
		mu 0 4 252 272 273 253
		f 4 -449 449 450 -410
		mu 0 4 253 273 274 254
		f 4 -451 451 452 -412
		mu 0 4 254 274 275 255
		f 4 -453 453 454 -414
		mu 0 4 255 275 276 256
		f 4 -455 455 456 -416
		mu 0 4 256 276 277 257
		f 4 -457 457 458 -418
		mu 0 4 257 277 278 258
		f 4 -459 459 460 -420
		mu 0 4 258 278 279 259
		f 4 -461 461 462 -422
		mu 0 4 259 279 280 260
		f 4 -463 463 464 -424
		mu 0 4 260 280 281 261
		f 4 -465 465 466 -426
		mu 0 4 261 281 282 262
		f 4 -467 467 468 -428
		mu 0 4 262 282 283 263
		f 4 -469 469 470 -430
		mu 0 4 263 283 284 264
		f 4 -471 471 472 -432
		mu 0 4 264 284 285 265
		f 4 -473 473 474 -434
		mu 0 4 265 285 286 266
		f 4 -475 475 476 -436
		mu 0 4 266 286 287 267
		f 4 -477 477 478 -438
		mu 0 4 267 287 288 268
		f 4 -479 479 -441 -440
		mu 0 4 268 288 269 249
		f 4 480 481 482 -442
		mu 0 4 269 289 290 270
		f 4 -483 483 484 -444
		mu 0 4 270 290 291 271
		f 4 -485 485 486 -446
		mu 0 4 271 291 292 272
		f 4 -487 487 488 -448
		mu 0 4 272 292 293 273
		f 4 -489 489 490 -450
		mu 0 4 273 293 294 274
		f 4 -491 491 492 -452
		mu 0 4 274 294 295 275
		f 4 -493 493 494 -454
		mu 0 4 275 295 296 276
		f 4 -495 495 496 -456
		mu 0 4 276 296 297 277
		f 4 -497 497 498 -458
		mu 0 4 277 297 298 278
		f 4 -499 499 500 -460
		mu 0 4 278 298 299 279
		f 4 -501 501 502 -462
		mu 0 4 279 299 300 280
		f 4 -503 503 504 -464
		mu 0 4 280 300 301 281
		f 4 -505 505 506 -466
		mu 0 4 281 301 302 282
		f 4 -507 507 508 -468
		mu 0 4 282 302 303 283
		f 4 -509 509 510 -470
		mu 0 4 283 303 304 284
		f 4 -511 511 512 -472
		mu 0 4 284 304 305 285
		f 4 -513 513 514 -474
		mu 0 4 285 305 306 286
		f 4 -515 515 516 -476
		mu 0 4 286 306 307 287
		f 4 -517 517 518 -478
		mu 0 4 287 307 308 288
		f 4 -519 519 -481 -480
		mu 0 4 288 308 289 269
		f 4 520 521 522 -482
		mu 0 4 289 309 310 290
		f 4 -523 523 524 -484
		mu 0 4 290 310 311 291
		f 4 -525 525 526 -486
		mu 0 4 291 311 312 292
		f 4 -527 527 528 -488
		mu 0 4 292 312 313 293
		f 4 -529 529 530 -490
		mu 0 4 293 313 314 294
		f 4 -531 531 532 -492
		mu 0 4 294 314 315 295
		f 4 -533 533 534 -494
		mu 0 4 295 315 316 296
		f 4 -535 535 536 -496
		mu 0 4 296 316 317 297
		f 4 -537 537 538 -498
		mu 0 4 297 317 318 298
		f 4 -539 539 540 -500
		mu 0 4 298 318 319 299
		f 4 -541 541 542 -502
		mu 0 4 299 319 320 300
		f 4 -543 543 544 -504
		mu 0 4 300 320 321 301
		f 4 -545 545 546 -506
		mu 0 4 301 321 322 302
		f 4 -547 547 548 -508
		mu 0 4 302 322 323 303
		f 4 -549 549 550 -510
		mu 0 4 303 323 324 304
		f 4 -551 551 552 -512
		mu 0 4 304 324 325 305
		f 4 -553 553 554 -514
		mu 0 4 305 325 326 306
		f 4 -555 555 556 -516
		mu 0 4 306 326 327 307
		f 4 -557 557 558 -518
		mu 0 4 307 327 328 308
		f 4 -559 559 -521 -520
		mu 0 4 308 328 309 289
		f 4 560 355 -562 -563
		mu 0 4 329 204 205 330
		f 4 -565 561 356 -564
		mu 0 4 331 330 205 206
		f 4 -567 563 357 -566
		mu 0 4 332 331 206 207
		f 4 -569 565 358 -568
		mu 0 4 333 332 207 208
		f 4 -571 567 359 -570
		mu 0 4 334 333 208 188
		f 4 -573 569 340 -572
		mu 0 4 335 334 188 189
		f 4 -575 571 341 -574
		mu 0 4 336 335 189 190
		f 4 -577 573 342 -576
		mu 0 4 338 336 190 192
		f 4 -579 575 343 -578
		mu 0 4 339 337 191 193
		f 4 -581 577 344 -580
		mu 0 4 340 339 193 194
		f 4 -583 579 345 -582
		mu 0 4 341 340 194 195
		f 4 -585 581 346 -584
		mu 0 4 342 341 195 196
		f 4 -587 583 347 -586
		mu 0 4 343 342 196 197
		f 4 -589 585 348 -588
		mu 0 4 344 343 197 198
		f 4 -591 587 349 -590
		mu 0 4 345 344 198 199
		f 4 -593 589 350 -592
		mu 0 4 346 345 199 200
		f 4 -595 591 351 -594
		mu 0 4 347 346 200 201
		f 4 -597 593 352 -596
		mu 0 4 348 347 201 202
		f 4 -599 595 353 -598
		mu 0 4 349 348 202 203
		f 4 -600 597 354 -561
		mu 0 4 329 349 203 204;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode transform -n "l_eyeball" -p "l_geo_group";
	rename -uid "F9AC1FB5-46FC-DDB0-02B2-1BA50B7DE1BD";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "l_eyeballShape" -p "l_eyeball";
	rename -uid "9451E8AB-4E47-21E2-B693-0B91122AAC73";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "l_eyeballShapeOrig" -p "l_eyeball";
	rename -uid "7800EF19-4A9C-B83B-C2FC-06895E374E02";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 377 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0.095694274 0.049017072 0.095694244
		 0.099175811 0.095694244 0.1478 0.095694244 0.19890767 0.095694244 0.24761128 0.095694244
		 0.29780492 0.095694244 0.34706721 0.095694244 0.39615184 0.095694244 0.44620577 0.095694244
		 0.49789405 0.095694244 0.54694015 0.095694244 0.59571129 0.095694214 0.64610869 0.095694244
		 0.69796729 0.095694244 0.75037849 0.095694244 0.80169523 0.095694244 0.8520568 0.095694244
		 0.90180671 0.095694244 0.95155013 0.095694244 0.99999988 0.095694214 0 0.18827614
		 0.049017072 0.18827614 0.099175811 0.18827614 0.1478 0.18827614 0.19890767 0.18827617
		 0.24761128 0.18827614 0.29780492 0.18827617 0.34706721 0.18827617 0.39615184 0.18827617
		 0.44620577 0.18827617 0.49789405 0.18827617 0.54694015 0.18827617 0.59571129 0.18827617
		 0.64610869 0.18827617 0.69796729 0.18827617 0.75037849 0.18827617 0.80169523 0.18827617
		 0.8520568 0.18827617 0.90180671 0.18827617 0.95155013 0.18827617 0.99999988 0.18827614
		 0 0.28666908 0.049017072 0.28666908 0.099175811 0.28666908 0.14779988 0.28666911
		 0.19890767 0.28666911 0.24761128 0.28666911 0.29780477 0.28666911 0.34706706 0.28666911
		 0.39615184 0.28666911 0.44620577 0.28666911 0.49789405 0.28666911 0.54694003 0.28666911
		 0.59571141 0.28666911 0.64610887 0.28666911 0.69796741 0.28666911 0.75037849 0.28666911
		 0.80169541 0.28666911 0.8520568 0.28666911 0.90180689 0.28666911 0.95155025 0.28666908
		 0.99999988 0.28666911 0 0.39286804 0.049017072 0.39286804 0.099175811 0.39286804
		 0.1478 0.39286804 0.19890767 0.39286804 0.24761128 0.39286804 0.29780492 0.39286804
		 0.34706721 0.39286804 0.39615184 0.39286804 0.44620577 0.39286804 0.49789405 0.39286804
		 0.54694015 0.39286804 0.59571129 0.39286804 0.64610869 0.39286804 0.69796729 0.3928681
		 0.75037849 0.39286804 0.80169523 0.39286804 0.8520568 0.39286804 0.90180671 0.39286804
		 0.95155013 0.39286804 0.99999988 0.39286804 0 0.48367518 0.049017072 0.48367518 0.099175811
		 0.48367506 0.1478 0.48367518 0.19890767 0.48367506 0.24761128 0.48367506 0.29780492
		 0.48367506 0.34706706 0.48367506 0.39615184 0.48367506 0.44620577 0.48367506 0.49789405
		 0.48367506 0.54694015 0.48367506 0.59571129 0.48367506 0.64610869 0.48367506 0.69796729
		 0.48367506 0.75037849 0.48367506 0.80169523 0.48367506 0.8520568 0.48367506 0.90180671
		 0.48367506 0.95155013 0.48367518 0.99999988 0.48367506 0 0.57726073 0.049017072 0.57726073
		 0.099175811 0.57726073 0.1478 0.57726073 0.19890767 0.57726073 0.24761128 0.57726073
		 0.29780492 0.57726061 0.34706706 0.57726061 0.39615184 0.57726061 0.44620577 0.57726061
		 0.49789405 0.57726061 0.54694015 0.57726061 0.59571129 0.57726061 0.64610869 0.57726061
		 0.69796729 0.57726061 0.75037849 0.57726061 0.80169523 0.57726061 0.8520568 0.57726061
		 0.90180671 0.57726061 0.95155013 0.57726061 0.99999988 0.57726061 0 0.67646748 0.049017072
		 0.67646748 0.099175811 0.67646748 0.1478 0.67646748 0.19890767 0.67646748 0.24761128
		 0.67646748 0.29780492 0.67646748 0.34706721 0.67646748 0.39615184 0.67646748 0.44620577
		 0.67646748 0.49789405 0.67646748 0.54694015 0.67646748 0.59571117 0.67646748 0.64610857
		 0.67646748 0.69796711 0.67646748 0.75037837 0.67646748 0.80169511 0.67646748 0.85205662
		 0.67646748 0.90180671 0.67646748 0.95155001 0.67646748 1 0.67646748 0 0.77257699
		 0.049017072 0.77257699 0.099175811 0.77257699 0.1478 0.77257699 0.19890767 0.77257699
		 0.24761128 0.77257699 0.29780492 0.77257699 0.34706721 0.77257699 0.39615184 0.77257699
		 0.44620577 0.77257699 0.49789405 0.77257699 0.54694015 0.77257699 0.59571129 0.77257699
		 0.64610869 0.77257699 0.69796729 0.77257699 0.75037849 0.77257699 0.80169523 0.77257699
		 0.8520568 0.77257699 0.90180671 0.77257699 0.95155013 0.77257699 0.99999988 0.77257699
		 0.9999997 0.85367066 0.049017072 0.85367066 0.09917596 0.85367066 0.1478 0.85367066
		 0.19890782 0.85367066 0.24761128 0.85367066 0.29780492 0.85367066 0.34706721 0.85367066
		 0.39615184 0.85367066 0.44620577 0.85367066 0.49789405 0.85367066 0.54694015 0.85367066
		 0.59571129 0.85367066 0.64610869 0.85367066 0.69796729 0.85367066 0.75037849 0.85367066
		 0.80169523 0.85367066 0.8520568 0.85367066 0.90180689 0.85367066 0.95155013 0.85367066
		 0.049017072 0 0.049017072 0 0.099175811 0 0.1478 0 0.19890767 0 0.24761128 0 0.29780492
		 0 0.34706706 0 0.39615184 0 0.44620577 0 0.49789405 0 0.54694015 0 0.59571129 0 0.64610869
		 2.9802322e-08 0.69796729 0 0.75037849 0 0.80169523 0 0.8520568 0 0.90180671 0 0.95155013
		 0 0.049017072 0.86565226 0 0.86565226 0.09917596 0.86565226 0.1478 0.86565226 0.19890782
		 0.86565226 0.24761128 0.86565226 0.29780492 0.86565226 0.34706721 0.86565226 0.39615184
		 0.86565226 0.44620577 0.86565226 0.49789405 0.86565226 0.54694015 0.86565226 0.59571129
		 0.86565226 0.64610869 0.86565226 0.69796729 0.86565226 0.75037849 0.86565226 0.80169523
		 0.86565226 0.8520568 0.86565226 0.90180689 0.86565226 0.95155013 0.86565226 0.049017072
		 0.89954734 0 0.89954734 0.09917596 0.89954734 0.1478 0.89954734 0.19890782 0.89954734
		 0.24761128 0.89954734 0.29780492 0.89954734 0.34706721 0.89954734 0.39615184 0.89954734
		 0.44620577 0.89954734 0.49789405 0.89954734 0.54694015 0.89954734 0.59571129 0.89954734
		 0.64610869 0.89954734 0.69796729 0.89954734 0.75037849 0.89954734 0.80169523 0.89954734
		 0.8520568 0.89954734 0.90180689 0.89954734 0.95155013 0.89954734 0.049017072 0.9385519
		 0 0.9385519;
	setAttr ".uvst[0].uvsp[250:376]" 0.09917596 0.9385519 0.1478 0.9385519 0.19890782
		 0.9385519 0.24761128 0.9385519 0.29780492 0.9385519 0.34706721 0.9385519 0.39615184
		 0.9385519 0.44620577 0.9385519 0.49789405 0.9385519 0.54694015 0.9385519 0.59571129
		 0.9385519 0.64610869 0.9385519 0.69796729 0.9385519 0.75037849 0.9385519 0.80169523
		 0.9385519 0.8520568 0.9385519 0.90180689 0.9385519 0.95155013 0.9385519 0.049017072
		 0.94702017 0 0.94702017 0.09917596 0.94702017 0.1478 0.94702017 0.19890782 0.94702017
		 0.24761128 0.94702017 0.29780492 0.94702017 0.34706721 0.94702017 0.39615184 0.94702017
		 0.44620577 0.94702017 0.49789405 0.94702017 0.54694015 0.94702017 0.59571129 0.94702017
		 0.64610869 0.94702017 0.69796729 0.94702017 0.75037849 0.94702017 0.80169523 0.94702017
		 0.8520568 0.94702017 0.90180689 0.94702017 0.95155013 0.94702017 0.049017072 0.95891476
		 0 0.95891476 0.09917596 0.95891476 0.1478 0.95891476 0.19890782 0.95891476 0.24761128
		 0.95891476 0.29780492 0.95891476 0.34706721 0.95891476 0.39615184 0.95891476 0.44620577
		 0.95891476 0.49789405 0.95891476 0.54694015 0.95891476 0.59571129 0.95891476 0.64610869
		 0.95891476 0.69796729 0.95891476 0.75037849 0.95891476 0.80169523 0.95891476 0.8520568
		 0.95891476 0.90180689 0.95891476 0.95155013 0.95891476 0.049017072 0.96649295 0 0.96649295
		 0.09917596 0.96649295 0.1478 0.96649295 0.19890782 0.96649295 0.24761128 0.96649295
		 0.29780492 0.96649295 0.34706721 0.96649295 0.39615184 0.96649295 0.44620577 0.96649295
		 0.49789405 0.96649295 0.54694015 0.96649295 0.59571129 0.96649295 0.64610869 0.96649295
		 0.69796729 0.96649295 0.75037849 0.96649295 0.80169523 0.96649295 0.8520568 0.96649295
		 0.90180689 0.96649295 0.95155013 0.96649295 0.049017072 0.99999994 0 1 0.09917596
		 0.99999994 0.1478 0.99999994 0.19890782 0.99999994 0.24761128 0.99999994 0.29780492
		 0.99999994 0.34706721 0.99999994 0.39615184 0.99999982 0.44620577 0.99999982 0.49789405
		 0.99999982 0.54694015 0.99999982 0.59571129 0.99999982 0.64610869 0.9999997 0.69796729
		 0.9999997 0.75037849 0.9999997 0.80169523 0.9999997 0.8520568 0.9999997 0.90180689
		 0.9999997 0.95155013 0.9999997 0.1478 0.84898013 0.099175811 0.84898013 0.049017072
		 0.84898013 0.99999988 0.84898013 0 0.84898013 0.95155013 0.84898013 0.90180689 0.84898013
		 0.8520568 0.84898013 0.80169523 0.84898013 0.75037849 0.84898013 0.69796729 0.84898013
		 0.64610869 0.84898013 0.59571129 0.84898013 0.54694015 0.84898013 0.49789405 0.84898013
		 0.44620577 0.84898013 0.39615184 0.84898013 0.34706721 0.84898013 0.29780492 0.84898013
		 0.24761128 0.84898013 0.19890782 0.84898013 0.9999997 0.89954734 0.9999997 0.86565226
		 0 0.85367066 0.9999997 0.96649295 0.9999997 0.9999997 0.9999997 0.95891476 0.9999997
		 0.94702017 0.9999997 0.9385519;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr -s 1340 ".clst[0].clsp";
	setAttr ".clst[0].clsp[0:124]"  1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[125:249]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[250:374]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[375:499]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[500:624]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[625:749]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[750:874]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[875:999]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[1000:1124]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[1125:1249]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[1250:1339]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 341 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0.15639143 0.050796159 -0.50609279 
		0.13303445 0.096620083 -0.50609279 0.096655175 0.13298613 -0.50609279 0.050814629 
		0.15633453 -0.50609279 0 0.16437988 -0.50609279 -0.050814629 0.15633453 -0.50609279 
		-0.09665516 0.13298599 -0.50609279 -0.13303441 0.096619956 -0.50609279 -0.15639143 
		0.050796159 -0.50609279 -0.16443954 0 -0.50609279 -0.15639143 -0.050796159 -0.50609279 
		-0.13303439 -0.096620016 -0.50609279 -0.096655145 -0.13298599 -0.50609279 -0.050814617 
		-0.15633459 -0.50609279 -4.9006794e-09 -0.16437975 -0.50609279 0.050814603 -0.15633459 
		-0.50609279 0.096655123 -0.13298599 -0.50609279 0.13303436 -0.096620016 -0.50609279 
		0.15639143 -0.050796159 -0.50609279 0.16443951 0 -0.50609279 0.29733947 0.096576311 
		-0.430599 0.25293222 0.18369909 -0.43059897 0.1837659 0.25284025 -0.43059897 0.09661144 
		0.29723141 -0.430599 0 0.31252766 -0.430599 -0.09661144 0.29723129 -0.430599 -0.18376587 
		0.2528401 -0.43059897 -0.25293198 0.18369909 -0.43059897 -0.29733935 0.096576311 
		-0.430599 -0.31264132 0 -0.43059897 -0.29733935 -0.096576311 -0.43059894 -0.25293195 
		-0.18369909 -0.43059897 -0.18376587 -0.25283998 -0.43059897 -0.09661141 -0.29723123 
		-0.430599 -9.3174277e-09 -0.31252766 -0.430599 0.096611388 -0.29723123 -0.430599 
		0.18376587 -0.25283998 -0.430599 0.25293189 -0.18369909 -0.43059897 0.29733929 -0.096576244 
		-0.430599 0.31264099 0 -0.43059897 0.40915224 0.13289329 -0.31316817 0.34804589 0.2527782 
		-0.31316817 0.25287011 0.34791932 -0.31316817 0.13294162 0.40900347 -0.31316817 0 
		0.43005171 -0.31316814 -0.13294162 0.40900347 -0.31316817 -0.25286993 0.34791932 
		-0.31316817 -0.34804589 0.25277799 -0.31316817 -0.40915212 0.13289322 -0.31316817 
		-0.43020797 0 -0.31316817 -0.40915212 -0.13289325 -0.31316814 -0.34804583 -0.25277796 
		-0.31316814 -0.25286987 -0.34791899 -0.31316814 -0.13294157 -0.40900335 -0.31316814 
		-1.2821194e-08 -0.43005159 -0.3131682 0.13294153 -0.40900335 -0.31316814 0.25286984 
		-0.34791896 -0.31316814 0.3480455 -0.25277793 -0.31316814 0.40915203 -0.13289322 
		-0.31316814 0.43020788 0 -0.31316817 0.48107395 0.15625361 -0.16520213 0.40922591 
		0.29721195 -0.16520213 0.29732004 0.40907711 -0.16520216 0.15631044 0.48089901 -0.16520216 
		0 0.50564736 -0.16520216 -0.15631044 0.48089895 -0.16520216 -0.29731998 0.40907705 
		-0.16520216 -0.40922579 0.29721189 -0.16520213 -0.48107374 0.15625361 -0.16520213 
		-0.50583082 0 -0.16520213 -0.48107374 -0.15625362 -0.16520213 -0.40922576 -0.29721183 
		-0.16520216 -0.29731989 -0.40907696 -0.16520216 -0.15631044 -0.4808988 -0.16520216 
		-1.507493e-08 -0.50564688 -0.16520216 0.15631029 -0.48089877 -0.1652021 0.29731983 
		-0.40907696 -0.16520216 0.40922567 -0.2972118 -0.16520216 0.48107362 -0.15625362 
		-0.16520213 0.50583071 0 -0.16520213 0.50802535 0.16500734 -0.0011259613 0.43215197 
		0.31386274 -0.0011259613 0.31397688 0.43199486 -0.0011259613 0.16506733 0.50784063 
		-0.0011259613 2.4666594e-10 0.53397489 -0.0011259613 -0.16506733 0.50784063 -0.0011259613 
		-0.31397688 0.43199477 -0.0011259613 -0.43215182 0.31386274 -0.0011259613 -0.50802487 
		0.16500728 -0.0011259613 -0.53416896 -3.6986442e-10 -0.0011259613 -0.50802487 -0.16500728 
		-0.0011259613 -0.43215179 -0.31386274 -0.0011259613 -0.31397688 -0.43199468 -0.0011259613 
		-0.16506727 -0.50784016 -0.0011259613 -1.5672807e-08 -0.53397471 -0.0011259613 0.16506723 
		-0.5078401 -0.0011259613 0.31397656 -0.43199462 -0.0011259613 0.43215168 -0.31386274 
		-0.0011259613 0.50802475 -0.16500725 -0.0011259613 0.53416884 -3.6986442e-10 -0.0011259613 
		0.48374686 0.15712179 0.16306533 0.41149962 0.29886329 0.16306536 0.29897198 0.41135004 
		0.16306536 0.15717892 0.48357093 0.16306536 2.6556446e-10 0.50845683 0.1630653 -0.15717892 
		0.48357093 0.1630653 -0.29897189 0.41134998 0.16306536 -0.41149953 0.2988632 0.16306536 
		-0.48374668 0.15712179 0.16306533 -0.5086413 -9.9550468e-10 0.16306533 -0.48374668 
		-0.15712176 0.16306533 -0.4114995 -0.29886317 0.16306533 -0.29897183 -0.41134989 
		0.16306536 -0.15717892 -0.48357075 0.16306536 -1.4893124e-08 -0.50845635 0.16306536 
		0.15717876 -0.48357069 0.16306536 0.29897177 -0.41134983 0.16306536 0.41149941 -0.29886317 
		0.16306533 0.48374656 -0.15712176 0.16306533 0.50864118 -9.9550468e-10 0.16306533 
		0.40567133 0.13176268 0.31546828 0.34508485 0.25062764 0.31546828 0.2507188 0.34495941 
		0.31546825 0.13181059 0.40552381 0.31546825 -5.7237015e-10 0.42639294 0.31546825 
		-0.13181059 0.40552381 0.31546831 -0.25071859 0.34495941 0.31546825 -0.34508485 0.25062746 
		0.31546828 -0.40567118 0.13176265 0.31546825 -0.42654791 5.721621e-10 0.31546825 
		-0.40567118 -0.13176261 0.31546825 -0.34508482 -0.25062746 0.31546825 -0.25071856 
		-0.34495905 0.31546825 -0.13181056 -0.40552366 0.31546825 -1.3284486e-08 -0.42639285 
		0.31546825 0.13181052 -0.40552366 0.31546825 0.2507185 -0.34495905 0.31546825 0.34508446 
		-0.2506274 0.31546825 0.40567109 -0.13176261 0.31546825 0.4265478 5.721621e-10 0.31546825 
		0.29912534 0.097156361 0.42095098 0.25445136 0.1848024 0.42095098 0.18486962 0.25435883 
		0.42095095 0.097191706 0.29901657 0.42095098 1.7704687e-24 0.31440476 0.42095098 
		-0.097191706 0.29901657 0.42095098 -0.1848696 0.25435865 0.42095098 -0.25445113 0.1848024 
		0.42095095 -0.29912519 0.097156361 0.42095098 -0.31451911 0 0.42095098 -0.29912519 
		-0.097156361 0.42095098 -0.2544511 -0.1848024 0.42095098 -0.1848696 -0.25435859 0.42095098 
		-0.097191676 -0.29901651 0.42095098 -9.3733901e-09 -0.31440476 0.42095098 0.097191647 
		-0.29901651 0.42095098 0.1848696 -0.25435859 0.42095098 0.25445107 -0.1848024 0.42095098 
		0.29912513 -0.097156294 0.42095098 0.31451878 0 0.42095098 0.20754665 0.06741152 
		0.46855438 0.17654975 0.12822427 0.46855441 0.12827089 0.17648554 0.46855438 0.067436002 
		0.20747119 0.46855438 5.0318256e-09 0.21814807 0.46855438 -0.067435995 0.20747119 
		0.46855438;
	setAttr ".pt[166:331]" -0.12827085 0.17648554 0.46855438 -0.17654969 0.12822421 
		0.46855438 -0.20754665 0.067411445 0.46855444 -0.21822734 0 0.46855441 -0.20754665 
		-0.067411445 0.46855441 -0.17654967 -0.12822427 0.46855441 -0.12827083 -0.17648554 
		0.46855441 -0.067435987 -0.20747119 0.46855441 -1.4718585e-09 -0.21814801 0.46855441 
		0.067435957 -0.20747119 0.46855441 0.1282708 -0.17648554 0.46855441 0.17654964 -0.12822415 
		0.46855441 0.20754665 -0.067411445 0.46855441 0.21822731 0 0.46855441 0 0 -0.53213739 
		0.19336472 0.062805206 0.45956647 0.16448599 0.11946253 0.4595665 0.11950597 0.16442603 
		0.4595665 0.062828012 0.19329441 0.45956647 3.5936933e-09 0.2032418 0.4595665 -0.062828004 
		0.19329441 0.4595665 -0.11950593 0.16442603 0.4595665 -0.16448581 0.11946247 0.45956653 
		-0.19336466 0.062805139 0.45956653 -0.20331563 0 0.4595665 -0.19336466 -0.062805139 
		0.4595665 -0.1644858 -0.1194624 0.4595665 -0.11950592 -0.16442597 0.4595665 -0.062827997 
		-0.19329426 0.4595665 -2.4655826e-09 -0.20324165 0.4595665 0.062827975 -0.19329426 
		0.4595665 0.11950589 -0.16442597 0.4595665 0.16448577 -0.1194624 0.4595665 0.19336462 
		-0.062805139 0.4595665 0.2033156 0 0.4595665 0.14981748 0.048660934 0.43898451 0.12744214 
		0.092558518 0.43898448 0.092592269 0.1273957 0.43898451 0.048678618 0.14976302 0.43898451 
		-8.2225748e-10 0.15747006 0.43898457 -0.048678651 0.14976296 0.43898448 -0.09259218 
		0.1273957 0.43898451 -0.12744205 0.092558518 0.43898448 -0.14981738 0.048660934 0.43898457 
		-0.15752731 0 0.43898451 -0.14981738 -0.048660934 0.43898451 -0.12744205 -0.092558458 
		0.43898457 -0.09259218 -0.12739563 0.43898451 -0.04867864 -0.1497629 0.43898448 -5.5169118e-09 
		-0.15746999 0.43898451 0.048678618 -0.1497629 0.43898451 0.092592143 -0.12739563 
		0.43898451 0.127442 -0.092558458 0.43898451 0.14981735 -0.048660934 0.43898451 0.15752728 
		0 0.43898451 0.10065854 0.032694083 0.41992304 0.085625164 0.062187705 0.41992307 
		0.062210388 0.085594006 0.41992304 0.03270594 0.100622 0.41992304 -5.8072249e-09 
		0.10580024 0.41992304 -0.032705963 0.10062193 0.4199231 -0.06221034 0.085594006 0.41992304 
		-0.085625134 0.062187705 0.41992307 -0.10065851 0.032694083 0.41992304 -0.10583864 
		0 0.41992304 -0.10065851 -0.032694016 0.41992307 -0.085625134 -0.062187705 0.41992304 
		-0.06221034 -0.085593946 0.41992304 -0.032705959 -0.10062193 0.41992304 -8.9614467e-09 
		-0.10580011 0.41992304 0.03270594 -0.10062187 0.41992304 0.062210318 -0.085593946 
		0.41992304 0.085625067 -0.062187705 0.41992307 0.10065848 -0.032694016 0.41992307 
		0.1058386 0 0.41992304 0.092483371 0.030038765 0.41278976 0.078670926 0.057137027 
		0.41278976 0.057157844 0.078642331 0.41278976 0.030049659 0.092449792 0.41278976 
		-6.6362338e-09 0.097207397 0.41278976 -0.030049684 0.092449725 0.41278976 -0.057157807 
		0.078642331 0.41278976 -0.078670889 0.057137027 0.41278976 -0.092483319 0.030038765 
		0.41278976 -0.097242743 0 0.41278976 -0.092483319 -0.0300387 0.41278976 -0.078670889 
		-0.057136964 0.41278976 -0.057157807 -0.078642271 0.41278976 -0.030049678 -0.092449665 
		0.41278976 -9.5342774e-09 -0.097207338 0.41278976 0.030049659 -0.092449665 0.41278976 
		0.057157777 -0.078642271 0.41278976 0.078670852 -0.057136964 0.41278976 0.09248329 
		-0.0300387 0.41278976 0.097242713 0 0.41278976 0.092483371 0.030038765 0.39801121 
		0.078670926 0.057137027 0.39801124 0.057157844 0.078642331 0.39801127 0.030049659 
		0.092449792 0.39801121 -6.6362338e-09 0.097207397 0.39801127 -0.030049684 0.092449725 
		0.39801127 -0.057157807 0.078642331 0.39801127 -0.078670889 0.057137027 0.39801124 
		-0.092483319 0.030038765 0.39801121 -0.097242743 0 0.39801121 -0.092483319 -0.0300387 
		0.39801121 -0.078670889 -0.057136964 0.39801124 -0.057157807 -0.078642271 0.39801121 
		-0.030049678 -0.092449665 0.39801121 -9.5342774e-09 -0.097207338 0.39801121 0.030049659 
		-0.092449665 0.39801121 0.057157777 -0.078642271 0.39801121 0.078670852 -0.057136964 
		0.39801124 0.09248329 -0.0300387 0.39801121 0.097242713 0 0.39801121 0.10182299 0.033072285 
		0.39801121 0.086615689 0.062907152 0.39801124 0.062930055 0.086584166 0.39801124 
		0.033084285 0.101786 0.39801121 -5.689146e-09 0.1070241 0.39801121 -0.033084314 0.101786 
		0.39801124 -0.062930003 0.086584166 0.39801124 -0.086615644 0.062907152 0.39801124 
		-0.10182294 0.033072285 0.39801121 -0.10706301 0 0.39801121 -0.10182294 -0.033072222 
		0.39801121 -0.086615644 -0.062907092 0.39801121 -0.062930003 -0.086584106 0.39801121 
		-0.033084307 -0.10178594 0.39801121 -8.8798551e-09 -0.10702403 0.39801121 0.033084285 
		-0.10178588 0.39801121 0.062929973 -0.086584106 0.39801121 0.086615607 -0.062907092 
		0.39801121 0.10182291 -0.033072222 0.39801121 0.10706298 0 0.39801121 0.14829656 
		0.048166957 0.39161107 0.12614842 0.091618881 0.39161101 0.091652237 0.12610243 0.39161101 
		0.048184447 0.14824264 0.39161101 -9.7649377e-10 0.15587145 0.39161104 -0.048184477 
		0.14824264 0.39161104 -0.091652162 0.12610243 0.39161101 -0.12614825 0.091618881 
		0.39161101 -0.14829648 0.048166893 0.39161101 -0.15592811 0 0.39161104 -0.14829648 
		-0.048166893 0.39161107 -0.12614825 -0.091618814 0.39161104 -0.091652162 -0.1261023 
		0.39161104 -0.048184466 -0.14824256 0.39161101 -5.6234883e-09 -0.15587139 0.39161104 
		0.048184447 -0.1482425 0.39161101 0.091652133 -0.1261023 0.39161104 0.12614822 -0.091618814 
		0.39161104 0.14829645 -0.048166893 0.39161107 0.15592808 0 0.39161104 0.069676749 
		0.21436505 0.46945354 0.13253304 0.1823498 0.46945357 0.18241611 0.13248484 0.46945357 
		0.214443 0.06965141 0.46945354 0.22547854 0 0.46945354 0.21444291 -0.06965141 0.46945354 
		0.18241599 -0.13248484 0.46945354 0.13253297 -0.18234967 0.46945354 0.069676712 -0.21436499 
		0.46945354 -3.1061191e-09 -0.22539653 0.46945354 -0.069676727 -0.21436499 0.46945354;
	setAttr ".pt[332:340]" -0.132533 -0.18234967 0.46945354 -0.18241604 -0.13248484 
		0.46945354 -0.214443 -0.06965141 0.46945354 -0.22547859 0 0.46945354 -0.214443 0.069651343 
		0.46945354 -0.18241605 0.13248484 0.46945354 -0.13253301 0.18234974 0.46945354 -0.069676742 
		0.21436505 0.46945354 3.6136674e-09 0.22539666 0.46945354;
	setAttr -s 341 ".vt";
	setAttr ".vt[0:165]"  0.14435326 0.046903193 -0.4671365 0.12279418 0.089215219 -0.4671365
		 0.089215182 0.12279421 -0.4671365 0.046903193 0.14435321 -0.4671365 0 0.15178198 -0.4671365
		 -0.046903193 0.14435321 -0.4671365 -0.089215167 0.12279409 -0.4671365 -0.12279414 0.0892151 -0.4671365
		 -0.14435326 0.046903193 -0.4671365 -0.15178187 0 -0.4671365 -0.14435326 -0.046903193 -0.4671365
		 -0.12279412 -0.089215159 -0.4671365 -0.089215152 -0.12279409 -0.4671365 -0.046903182 -0.14435327 -0.4671365
		 -4.5234514e-09 -0.15178186 -0.4671365 0.046903167 -0.14435327 -0.4671365 0.08921513 -0.12279409 -0.4671365
		 0.12279409 -0.089215159 -0.4671365 0.14435326 -0.046903193 -0.4671365 0.15178184 0 -0.4671365
		 0.2745761 0.089215159 -0.39737004 0.23356852 0.16969734 -0.39737001 0.16969736 0.23356849 -0.39737001
		 0.089215174 0.27457613 -0.39737004 0 0.28870648 -0.39737004 -0.089215174 0.27457601 -0.39737004
		 -0.16969734 0.23356837 -0.39737001 -0.23356828 0.16969734 -0.39737001 -0.27457598 0.089215159 -0.39737004
		 -0.28870651 0 -0.39737001 -0.27457598 -0.089215159 -0.39736998 -0.23356828 -0.16969734 -0.39737001
		 -0.16969734 -0.23356825 -0.39737001 -0.089215145 -0.27457595 -0.39737004 -8.6041156e-09 -0.28870648 -0.39737004
		 0.089215122 -0.27457595 -0.39737004 0.16969734 -0.23356825 -0.39737004 0.23356825 -0.16969734 -0.39737001
		 0.27457592 -0.0892151 -0.39737004 0.28870621 0 -0.39737001 0.37792158 0.12279415 -0.28870621
		 0.32147947 0.23356849 -0.28870621 0.23356852 0.32147944 -0.28870621 0.12279415 0.37792152 -0.28870621
		 0 0.39737022 -0.28870618 -0.12279415 0.37792152 -0.28870621 -0.23356834 0.32147944 -0.28870621
		 -0.32147947 0.23356831 -0.28870621 -0.37792146 0.12279409 -0.28870621 -0.3973701 0 -0.28870621
		 -0.37792146 -0.12279412 -0.28870618 -0.32147944 -0.23356828 -0.28870618 -0.23356828 -0.32147914 -0.28870618
		 -0.12279412 -0.3779214 -0.28870618 -1.1842549e-08 -0.3973701 -0.28870624 0.12279408 -0.3779214 -0.28870618
		 0.23356822 -0.32147911 -0.28870618 0.32147911 -0.23356825 -0.28870618 0.37792137 -0.12279409 -0.28870618
		 0.39737001 0 -0.28870621 0.4442735 0.14435324 -0.15178183 0.37792158 0.2745761 -0.15178183
		 0.2745761 0.37792155 -0.15178186 0.14435326 0.44427344 -0.15178186 0 0.46713692 -0.15178186
		 -0.14435326 0.44427338 -0.15178186 -0.27457604 0.37792149 -0.15178186 -0.37792149 0.27457604 -0.15178183
		 -0.44427332 0.14435324 -0.15178183 -0.46713656 0 -0.15178183 -0.44427332 -0.14435326 -0.15178183
		 -0.37792146 -0.27457598 -0.15178186 -0.27457598 -0.3779214 -0.15178186 -0.14435326 -0.44427326 -0.15178186
		 -1.3921751e-08 -0.46713656 -0.15178186 0.14435311 -0.44427323 -0.1517818 0.27457592 -0.3779214 -0.15178186
		 0.37792137 -0.27457595 -0.15178186 0.4442732 -0.14435326 -0.15178183 0.46713644 0 -0.15178183
		 0.46892142 0.15236171 0 0.39888817 0.28980932 0 0.28980932 0.39888814 0 0.15236169 0.46892136 0
		 2.2767946e-10 0.49305278 0 -0.15236169 0.46892136 0 -0.28980932 0.39888805 0 -0.39888802 0.28980932 0
		 -0.46892095 0.15236165 0 -0.49305272 -3.415192e-10 0 -0.46892095 -0.15236165 0 -0.39888799 -0.28980932 0
		 -0.28980932 -0.39888796 0 -0.15236165 -0.46892095 0 -1.4466433e-08 -0.4930526 0 0.1523616 -0.46892089 0
		 0.28980902 -0.39888793 0 0.3988879 -0.28980932 0 0.46892083 -0.15236162 0 0.4930526 -3.415192e-10 0
		 0.44609889 0.14494635 0.15178183 0.37947434 0.27570423 0.15178186 0.27570423 0.37947434 0.15178186
		 0.14494635 0.4460988 0.15178186 2.4489669e-10 0.46905631 0.1517818 -0.14494635 0.4460988 0.1517818
		 -0.27570418 0.37947428 0.15178186 -0.37947425 0.27570415 0.15178186 -0.44609872 0.14494635 0.15178183
		 -0.46905592 -9.1836255e-10 0.15178183 -0.44609872 -0.14494634 0.15178183 -0.37947422 -0.27570412 0.15178183
		 -0.27570412 -0.37947419 0.15178186 -0.14494635 -0.44609866 0.15178186 -1.3734055e-08 -0.46905586 0.15178186
		 0.1449462 -0.4460986 0.15178186 0.27570406 -0.37947413 0.15178186 0.37947413 -0.27570412 0.15178183
		 0.4460986 -0.14494634 0.15178183 0.4690558 -9.1836255e-10 0.15178183 0.37346691 0.12134674 0.29248008
		 0.3176901 0.23081535 0.29248008 0.23081537 0.3176901 0.29248005 0.12134674 0.37346685 0.29248005
		 -5.2693228e-10 0.39268628 0.29248005 -0.12134674 0.37346685 0.29248011 -0.23081519 0.3176901 0.29248005
		 -0.3176901 0.23081517 0.29248008 -0.37346679 0.12134671 0.29248005 -0.39268619 5.2693228e-10 0.29248005
		 -0.37346679 -0.12134668 0.29248005 -0.31769007 -0.23081517 0.29248005 -0.23081514 -0.31768978 0.29248005
		 -0.12134671 -0.37346673 0.29248005 -1.222989e-08 -0.39268619 0.29248005 0.12134667 -0.37346673 0.29248005
		 0.2308151 -0.31768978 0.29248005 0.31768975 -0.23081511 0.29248005 0.3734667 -0.12134668 0.29248005
		 0.3926861 5.2693228e-10 0.29248005 0.2745761 0.089215159 0.3896828 0.23356852 0.16969734 0.3896828
		 0.16969736 0.23356849 0.38968277 0.089215174 0.27457607 0.3896828 0 0.28870648 0.3896828
		 -0.089215174 0.27457607 0.3896828 -0.16969734 0.23356831 0.3896828 -0.2335683 0.16969734 0.38968277
		 -0.27457598 0.089215159 0.3896828 -0.28870651 0 0.3896828 -0.27457598 -0.089215159 0.3896828
		 -0.23356828 -0.16969734 0.3896828 -0.16969734 -0.23356825 0.3896828 -0.089215145 -0.27457601 0.3896828
		 -8.6041156e-09 -0.28870648 0.3896828 0.089215122 -0.27457601 0.3896828 0.16969734 -0.23356825 0.3896828
		 0.23356824 -0.16969734 0.3896828 0.27457592 -0.0892151 0.3896828 0.28870621 0 0.3896828
		 0.1897095 0.061640382 0.43344885 0.16137657 0.11724693 0.43344891 0.11724693 0.16137654 0.43344885
		 0.061640359 0.18970948 0.43344885 4.5993764e-09 0.19947231 0.43344885 -0.061640352 0.18970948 0.43344885;
	setAttr ".vt[166:331]" -0.11724688 0.16137654 0.43344885 -0.16137651 0.11724687 0.43344885
		 -0.1897095 0.061640322 0.43344891 -0.19947226 0 0.43344891 -0.1897095 -0.061640322 0.43344891
		 -0.16137649 -0.11724693 0.43344891 -0.11724687 -0.16137654 0.43344891 -0.061640345 -0.18970948 0.43344891
		 -1.3453628e-09 -0.19947225 0.43344891 0.061640322 -0.18970948 0.43344891 0.11724684 -0.16137654 0.43344891
		 0.16137646 -0.11724681 0.43344891 0.1897095 -0.061640322 0.43344891 0.19947223 0 0.43344891
		 0 0 -0.49117637 0.1767464 0.05742842 0.42523342 0.15034959 0.10923529 0.42523348
		 0.10923529 0.15034944 0.42523348 0.057428394 0.17674637 0.42523342 3.2848411e-09 0.18584216 0.42523348
		 -0.057428386 0.17674637 0.42523348 -0.10923526 0.15034944 0.42523348 -0.15034942 0.10923523 0.42523348
		 -0.17674634 0.05742836 0.42523348 -0.1858421 0 0.42523348 -0.17674634 -0.05742836 0.42523348
		 -0.15034941 -0.10923517 0.42523348 -0.10923524 -0.15034938 0.42523348 -0.057428379 -0.17674625 0.42523348
		 -2.2536832e-09 -0.18584204 0.42523348 0.05742836 -0.17674625 0.42523348 0.10923521 -0.15034938 0.42523348
		 0.15034938 -0.10923517 0.42523348 0.17674631 -0.05742836 0.42523348 0.18584207 0 0.42523348
		 0.13694173 0.044495046 0.40642035 0.1164894 0.084634542 0.40642035 0.084634624 0.11648929 0.40642035
		 0.044495039 0.13694173 0.40642035 -7.5159035e-10 0.14398897 0.40642041 -0.044495068 0.13694167 0.40642035
		 -0.084634542 0.11648929 0.40642035 -0.11648931 0.084634542 0.40642035 -0.13694164 0.044495046 0.40642041
		 -0.14398897 0 0.40642035 -0.13694164 -0.044495046 0.40642035 -0.11648931 -0.084634483 0.40642041
		 -0.084634542 -0.11648923 0.40642035 -0.044495057 -0.13694161 0.40642035 -5.0427724e-09 -0.14398891 0.40642035
		 0.044495039 -0.13694161 0.40642035 0.084634513 -0.11648923 0.40642035 0.11648928 -0.084634483 0.40642035
		 0.13694161 -0.044495046 0.40642035 0.14398894 0 0.40642035 0.092007659 0.029895127 0.38899705
		 0.078266293 0.056863785 0.38899708 0.056863852 0.078266263 0.38899705 0.029895097 0.092007697 0.38899705
		 -5.3081357e-09 0.09674263 0.38899705 -0.029895119 0.092007637 0.38899711 -0.056863807 0.078266263 0.38899705
		 -0.078266263 0.056863785 0.38899708 -0.09200763 0.029895127 0.38899705 -0.096742563 0 0.38899705
		 -0.09200763 -0.029895067 0.38899708 -0.078266263 -0.056863785 0.38899705 -0.056863807 -0.078266203 0.38899705
		 -0.029895114 -0.092007637 0.38899705 -8.1912743e-09 -0.096742511 0.38899705 0.029895097 -0.092007577 0.38899705
		 0.056863785 -0.078266203 0.38899705 0.078266203 -0.056863785 0.38899708 0.0920076 -0.029895067 0.38899708
		 0.096742533 0 0.38899705 0.084535085 0.027467132 0.38247684 0.071909726 0.052245498 0.38247684
		 0.052245535 0.071909726 0.38247684 0.027467106 0.084535122 0.38247684 -6.0658967e-09 0.088885427 0.38247684
		 -0.027467128 0.084535062 0.38247684 -0.052245501 0.071909726 0.38247684 -0.071909688 0.052245498 0.38247684
		 -0.08453504 0.027467132 0.38247684 -0.088885427 0 0.38247684 -0.08453504 -0.027467072 0.38247684
		 -0.071909688 -0.052245438 0.38247684 -0.052245501 -0.071909666 0.38247684 -0.027467122 -0.084535003 0.38247684
		 -8.7148742e-09 -0.088885367 0.38247684 0.027467106 -0.084535003 0.38247684 0.052245472 -0.071909666 0.38247684
		 0.071909651 -0.052245438 0.38247684 0.08453501 -0.027467072 0.38247684 0.088885397 0 0.38247684
		 0.084535085 0.027467132 0.3689684 0.071909726 0.052245498 0.36896843 0.052245535 0.071909726 0.36896846
		 0.027467106 0.084535122 0.3689684 -6.0658967e-09 0.088885427 0.36896846 -0.027467128 0.084535062 0.36896846
		 -0.052245501 0.071909726 0.36896846 -0.071909688 0.052245498 0.36896843 -0.08453504 0.027467132 0.3689684
		 -0.088885427 0 0.3689684 -0.08453504 -0.027467072 0.3689684 -0.071909688 -0.052245438 0.36896843
		 -0.052245501 -0.071909666 0.3689684 -0.027467122 -0.084535003 0.3689684 -8.7148742e-09 -0.088885367 0.3689684
		 0.027467106 -0.084535003 0.3689684 0.052245472 -0.071909666 0.3689684 0.071909651 -0.052245438 0.36896843
		 0.08453501 -0.027467072 0.3689684 0.088885397 0 0.3689684 0.093072034 0.030240953 0.3689684
		 0.079171687 0.057521641 0.36896843 0.057521667 0.079171658 0.36896843 0.030240927 0.093072057 0.3689684
		 -5.2002043e-09 0.097861707 0.3689684 -0.030240953 0.093072057 0.36896843 -0.057521619 0.079171658 0.36896843
		 -0.07917165 0.057521641 0.36896843 -0.09307199 0.030240953 0.3689684 -0.097861707 0 0.3689684
		 -0.09307199 -0.030240893 0.3689684 -0.07917165 -0.057521582 0.3689684 -0.057521619 -0.079171598 0.3689684
		 -0.030240946 -0.093071997 0.3689684 -8.1166949e-09 -0.097861648 0.3689684 0.030240927 -0.093071938 0.3689684
		 0.057521589 -0.079171598 0.3689684 0.079171613 -0.057521582 0.3689684 0.09307196 -0.030240893 0.3689684
		 0.097861677 0 0.3689684 0.13555154 0.044043362 0.36311832 0.11530685 0.083775342 0.36311826
		 0.083775379 0.11530674 0.36311826 0.04404334 0.13555151 0.36311826 -8.9257113e-10 0.14252722 0.36311829
		 -0.044043366 0.13555151 0.36311829 -0.083775312 0.11530674 0.36311826 -0.11530671 0.083775342 0.36311826
		 -0.13555145 0.044043303 0.36311826 -0.14252721 0 0.36311829 -0.13555145 -0.044043303 0.36311832
		 -0.11530671 -0.083775282 0.36311829 -0.083775312 -0.11530662 0.36311829 -0.044043355 -0.13555145 0.36311826
		 -5.1401896e-09 -0.14252716 0.36311829 0.04404334 -0.13555139 0.36311826 0.083775282 -0.11530662 0.36311829
		 0.11530668 -0.083775282 0.36311829 0.13555142 -0.044043303 0.36311832 0.14252718 0 0.36311829
		 0.063688532 0.19601315 0.43427074 0.12114277 0.16673875 0.4342708 0.16673875 0.12114275 0.4342708
		 0.19601314 0.063688517 0.4342708 0.20610027 0 0.4342708 0.19601308 -0.063688517 0.4342708
		 0.16673864 -0.12114275 0.4342708 0.1211427 -0.16673863 0.4342708 0.063688494 -0.19601309 0.4342708
		 -2.8391702e-09 -0.20610023 0.4342708 -0.063688509 -0.19601309 0.4342708;
	setAttr ".vt[332:340]" -0.12114273 -0.16673863 0.4342708 -0.16673867 -0.12114275 0.4342708
		 -0.19601314 -0.063688517 0.4342708 -0.20610031 0 0.4342708 -0.19601314 0.063688457 0.4342708
		 -0.16673869 0.12114275 0.4342708 -0.12114275 0.16673869 0.4342708 -0.063688524 0.19601315 0.43427074
		 3.3030985e-09 0.20610034 0.4342708;
	setAttr -s 680 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 4 1 4 5 1 5 6 1 6 7 1 7 8 1 8 9 1
		 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 0 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 30 31 1
		 31 32 1 32 33 1 33 34 1 34 35 1 35 36 1 36 37 1 37 38 1 38 39 1 39 20 1 40 41 1 41 42 1
		 42 43 1 43 44 1 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 49 50 1 50 51 1 51 52 1 52 53 1
		 53 54 1 54 55 1 55 56 1 56 57 1 57 58 1 58 59 1 59 40 1 60 61 1 61 62 1 62 63 1 63 64 1
		 64 65 1 65 66 1 66 67 1 67 68 1 68 69 1 69 70 1 70 71 1 71 72 1 72 73 1 73 74 1 74 75 1
		 75 76 1 76 77 1 77 78 1 78 79 1 79 60 1 80 81 1 81 82 1 82 83 1 83 84 1 84 85 1 85 86 1
		 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1 94 95 1 95 96 1 96 97 1
		 97 98 1 98 99 1 99 80 1 100 101 1 101 102 1 102 103 1 103 104 1 104 105 1 105 106 1
		 106 107 1 107 108 1 108 109 1 109 110 1 110 111 1 111 112 1 112 113 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 100 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 127 128 1 128 129 1 129 130 1 130 131 1 131 132 1 132 133 1
		 133 134 1 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 120 1 140 141 1 141 142 1
		 142 143 1 143 144 1 144 145 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1
		 151 152 1 152 153 1 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 159 140 1
		 160 161 0 161 162 0 162 163 0 163 164 0 164 165 0 165 166 0;
	setAttr ".ed[166:331]" 166 167 0 167 168 0 168 169 0 169 170 0 170 171 0 171 172 0
		 172 173 0 173 174 0 174 175 0 175 176 0 176 177 0 177 178 0 178 179 0 179 160 0 0 20 1
		 1 21 1 2 22 1 3 23 1 4 24 1 5 25 1 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1
		 13 33 1 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 20 40 1 21 41 1 22 42 1 23 43 1
		 24 44 1 25 45 1 26 46 1 27 47 1 28 48 1 29 49 1 30 50 1 31 51 1 32 52 1 33 53 1 34 54 1
		 35 55 1 36 56 1 37 57 1 38 58 1 39 59 1 40 60 1 41 61 1 42 62 1 43 63 1 44 64 1 45 65 1
		 46 66 1 47 67 1 48 68 1 49 69 1 50 70 1 51 71 1 52 72 1 53 73 1 54 74 1 55 75 1 56 76 1
		 57 77 1 58 78 1 59 79 1 60 80 1 61 81 1 62 82 1 63 83 1 64 84 1 65 85 1 66 86 1 67 87 1
		 68 88 1 69 89 1 70 90 1 71 91 1 72 92 1 73 93 1 74 94 1 75 95 1 76 96 1 77 97 1 78 98 1
		 79 99 1 80 100 1 81 101 1 82 102 1 83 103 1 84 104 1 85 105 1 86 106 1 87 107 1 88 108 1
		 89 109 1 90 110 1 91 111 1 92 112 1 93 113 1 94 114 1 95 115 1 96 116 1 97 117 1
		 98 118 1 99 119 1 100 120 1 101 121 1 102 122 1 103 123 1 104 124 1 105 125 1 106 126 1
		 107 127 1 108 128 1 109 129 1 110 130 1 111 131 1 112 132 1 113 133 1 114 134 1 115 135 1
		 116 136 1 117 137 1 118 138 1 119 139 1 120 140 1 121 141 1 122 142 1 123 143 1 124 144 1
		 125 145 1 126 146 1 127 147 1 128 148 1 129 149 1 130 150 1 131 151 1 132 152 1 133 153 1
		 134 154 1 135 155 1 136 156 1 137 157 1 138 158 1 139 159 1 140 324 1 141 323 1 142 322 1
		 143 321 1 144 340 1 145 339 1 146 338 1 147 337 1 148 336 1 149 335 1 150 334 1 151 333 1;
	setAttr ".ed[332:497]" 152 332 1 153 331 1 154 330 1 155 329 1 156 328 1 157 327 1
		 158 326 1 159 325 1 180 0 1 180 1 1 180 2 1 180 3 1 180 4 1 180 5 1 180 6 1 180 7 1
		 180 8 1 180 9 1 180 10 1 180 11 1 180 12 1 180 13 1 180 14 1 180 15 1 180 16 1 180 17 1
		 180 18 1 180 19 1 160 181 0 161 182 0 181 182 0 162 183 0 182 183 0 163 184 0 183 184 0
		 164 185 0 184 185 0 165 186 0 185 186 0 166 187 0 186 187 0 167 188 0 187 188 0 168 189 0
		 188 189 0 169 190 0 189 190 0 170 191 0 190 191 0 171 192 0 191 192 0 172 193 0 192 193 0
		 173 194 0 193 194 0 174 195 0 194 195 0 175 196 0 195 196 0 176 197 0 196 197 0 177 198 0
		 197 198 0 178 199 0 198 199 0 179 200 0 199 200 0 200 181 0 181 201 0 182 202 0 201 202 0
		 183 203 0 202 203 0 184 204 0 203 204 0 185 205 0 204 205 0 186 206 0 205 206 0 187 207 0
		 206 207 0 188 208 0 207 208 0 189 209 0 208 209 0 190 210 0 209 210 0 191 211 0 210 211 0
		 192 212 0 211 212 0 193 213 0 212 213 0 194 214 0 213 214 0 195 215 0 214 215 0 196 216 0
		 215 216 0 197 217 0 216 217 0 198 218 0 217 218 0 199 219 0 218 219 0 200 220 0 219 220 0
		 220 201 0 201 221 0 202 222 0 221 222 0 203 223 0 222 223 0 204 224 0 223 224 0 205 225 0
		 224 225 0 206 226 0 225 226 0 207 227 0 226 227 0 208 228 0 227 228 0 209 229 0 228 229 0
		 210 230 0 229 230 0 211 231 0 230 231 0 212 232 0 231 232 0 213 233 0 232 233 0 214 234 0
		 233 234 0 215 235 0 234 235 0 216 236 0 235 236 0 217 237 0 236 237 0 218 238 0 237 238 0
		 219 239 0 238 239 0 220 240 0 239 240 0 240 221 0 221 241 0 222 242 0 241 242 0 223 243 0
		 242 243 0 224 244 0 243 244 0 225 245 0 244 245 0 226 246 0 245 246 0 227 247 0 246 247 0
		 228 248 0 247 248 0 229 249 0 248 249 0 230 250 0;
	setAttr ".ed[498:663]" 249 250 0 231 251 0 250 251 0 232 252 0 251 252 0 233 253 0
		 252 253 0 234 254 0 253 254 0 235 255 0 254 255 0 236 256 0 255 256 0 237 257 0 256 257 0
		 238 258 0 257 258 0 239 259 0 258 259 0 240 260 0 259 260 0 260 241 0 241 261 0 242 262 0
		 261 262 0 243 263 0 262 263 0 244 264 0 263 264 0 245 265 0 264 265 0 246 266 0 265 266 0
		 247 267 0 266 267 0 248 268 0 267 268 0 249 269 0 268 269 0 250 270 0 269 270 0 251 271 0
		 270 271 0 252 272 0 271 272 0 253 273 0 272 273 0 254 274 0 273 274 0 255 275 0 274 275 0
		 256 276 0 275 276 0 257 277 0 276 277 0 258 278 0 277 278 0 259 279 0 278 279 0 260 280 0
		 279 280 0 280 261 0 261 281 0 262 282 0 281 282 0 263 283 0 282 283 0 264 284 0 283 284 0
		 265 285 0 284 285 0 266 286 0 285 286 0 267 287 0 286 287 0 268 288 0 287 288 0 269 289 0
		 288 289 0 270 290 0 289 290 0 271 291 0 290 291 0 272 292 0 291 292 0 273 293 0 292 293 0
		 274 294 0 293 294 0 275 295 0 294 295 0 276 296 0 295 296 0 277 297 0 296 297 0 278 298 0
		 297 298 0 279 299 0 298 299 0 280 300 0 299 300 0 300 281 0 281 301 0 282 302 0 301 302 0
		 283 303 0 302 303 0 284 304 0 303 304 0 285 305 0 304 305 0 286 306 0 305 306 0 287 307 0
		 306 307 0 288 308 0 307 308 0 289 309 0 308 309 0 290 310 0 309 310 0 291 311 0 310 311 0
		 292 312 0 311 312 0 293 313 0 312 313 0 294 314 0 313 314 0 295 315 0 314 315 0 296 316 0
		 315 316 0 297 317 0 316 317 0 298 318 0 317 318 0 299 319 0 318 319 0 300 320 0 319 320 0
		 320 301 0 321 163 1 322 162 1 321 322 1 323 161 1 322 323 1 324 160 1 323 324 1 325 179 1
		 324 325 1 326 178 1 325 326 1 327 177 1 326 327 1 328 176 1 327 328 1 329 175 1 328 329 1
		 330 174 1 329 330 1 331 173 1 330 331 1 332 172 1 331 332 1 333 171 1;
	setAttr ".ed[664:679]" 332 333 1 334 170 1 333 334 1 335 169 1 334 335 1 336 168 1
		 335 336 1 337 167 1 336 337 1 338 166 1 337 338 1 339 165 1 338 339 1 340 164 1 339 340 1
		 340 321 1;
	setAttr -s 340 -ch 1340 ".fc[0:339]" -type "polyFaces" 
		f 3 -1 -341 341
		mu 0 3 1 0 188
		f 3 -2 -342 342
		mu 0 3 2 1 189
		f 3 -3 -343 343
		mu 0 3 3 2 190
		f 3 -4 -344 344
		mu 0 3 4 3 191
		f 3 -5 -345 345
		mu 0 3 5 4 192
		f 3 -6 -346 346
		mu 0 3 6 5 193
		f 3 -7 -347 347
		mu 0 3 7 6 194
		f 3 -8 -348 348
		mu 0 3 8 7 195
		f 3 -9 -349 349
		mu 0 3 9 8 196
		f 3 -10 -350 350
		mu 0 3 10 9 197
		f 3 -11 -351 351
		mu 0 3 11 10 198
		f 3 -12 -352 352
		mu 0 3 12 11 199
		f 3 -13 -353 353
		mu 0 3 13 12 200
		f 3 -14 -354 354
		mu 0 3 14 13 201
		f 3 -15 -355 355
		mu 0 3 15 14 202
		f 3 -16 -356 356
		mu 0 3 16 15 203
		f 3 -17 -357 357
		mu 0 3 17 16 204
		f 3 -18 -358 358
		mu 0 3 18 17 205
		f 3 -19 -359 359
		mu 0 3 19 18 206
		f 3 -20 -360 340
		mu 0 3 20 19 207
		f 4 181 -21 -181 0
		mu 0 4 1 22 21 0
		f 4 182 -22 -182 1
		mu 0 4 2 23 22 1
		f 4 183 -23 -183 2
		mu 0 4 3 24 23 2
		f 4 184 -24 -184 3
		mu 0 4 4 25 24 3
		f 4 185 -25 -185 4
		mu 0 4 5 26 25 4
		f 4 186 -26 -186 5
		mu 0 4 6 27 26 5
		f 4 187 -27 -187 6
		mu 0 4 7 28 27 6
		f 4 188 -28 -188 7
		mu 0 4 8 29 28 7
		f 4 189 -29 -189 8
		mu 0 4 9 30 29 8
		f 4 190 -30 -190 9
		mu 0 4 10 31 30 9
		f 4 191 -31 -191 10
		mu 0 4 11 32 31 10
		f 4 192 -32 -192 11
		mu 0 4 12 33 32 11
		f 4 193 -33 -193 12
		mu 0 4 13 34 33 12
		f 4 194 -34 -194 13
		mu 0 4 14 35 34 13
		f 4 195 -35 -195 14
		mu 0 4 15 36 35 14
		f 4 196 -36 -196 15
		mu 0 4 16 37 36 15
		f 4 197 -37 -197 16
		mu 0 4 17 38 37 16
		f 4 198 -38 -198 17
		mu 0 4 18 39 38 17
		f 4 199 -39 -199 18
		mu 0 4 19 40 39 18
		f 4 180 -40 -200 19
		mu 0 4 20 41 40 19
		f 4 201 -41 -201 20
		mu 0 4 22 43 42 21
		f 4 202 -42 -202 21
		mu 0 4 23 44 43 22
		f 4 203 -43 -203 22
		mu 0 4 24 45 44 23
		f 4 204 -44 -204 23
		mu 0 4 25 46 45 24
		f 4 205 -45 -205 24
		mu 0 4 26 47 46 25
		f 4 206 -46 -206 25
		mu 0 4 27 48 47 26
		f 4 207 -47 -207 26
		mu 0 4 28 49 48 27
		f 4 208 -48 -208 27
		mu 0 4 29 50 49 28
		f 4 209 -49 -209 28
		mu 0 4 30 51 50 29
		f 4 210 -50 -210 29
		mu 0 4 31 52 51 30
		f 4 211 -51 -211 30
		mu 0 4 32 53 52 31
		f 4 212 -52 -212 31
		mu 0 4 33 54 53 32
		f 4 213 -53 -213 32
		mu 0 4 34 55 54 33
		f 4 214 -54 -214 33
		mu 0 4 35 56 55 34
		f 4 215 -55 -215 34
		mu 0 4 36 57 56 35
		f 4 216 -56 -216 35
		mu 0 4 37 58 57 36
		f 4 217 -57 -217 36
		mu 0 4 38 59 58 37
		f 4 218 -58 -218 37
		mu 0 4 39 60 59 38
		f 4 219 -59 -219 38
		mu 0 4 40 61 60 39
		f 4 200 -60 -220 39
		mu 0 4 41 62 61 40
		f 4 221 -61 -221 40
		mu 0 4 43 64 63 42
		f 4 222 -62 -222 41
		mu 0 4 44 65 64 43
		f 4 223 -63 -223 42
		mu 0 4 45 66 65 44
		f 4 224 -64 -224 43
		mu 0 4 46 67 66 45
		f 4 225 -65 -225 44
		mu 0 4 47 68 67 46
		f 4 226 -66 -226 45
		mu 0 4 48 69 68 47
		f 4 227 -67 -227 46
		mu 0 4 49 70 69 48
		f 4 228 -68 -228 47
		mu 0 4 50 71 70 49
		f 4 229 -69 -229 48
		mu 0 4 51 72 71 50
		f 4 230 -70 -230 49
		mu 0 4 52 73 72 51
		f 4 231 -71 -231 50
		mu 0 4 53 74 73 52
		f 4 232 -72 -232 51
		mu 0 4 54 75 74 53
		f 4 233 -73 -233 52
		mu 0 4 55 76 75 54
		f 4 234 -74 -234 53
		mu 0 4 56 77 76 55
		f 4 235 -75 -235 54
		mu 0 4 57 78 77 56
		f 4 236 -76 -236 55
		mu 0 4 58 79 78 57
		f 4 237 -77 -237 56
		mu 0 4 59 80 79 58
		f 4 238 -78 -238 57
		mu 0 4 60 81 80 59
		f 4 239 -79 -239 58
		mu 0 4 61 82 81 60
		f 4 220 -80 -240 59
		mu 0 4 62 83 82 61
		f 4 241 -81 -241 60
		mu 0 4 64 85 84 63
		f 4 242 -82 -242 61
		mu 0 4 65 86 85 64
		f 4 243 -83 -243 62
		mu 0 4 66 87 86 65
		f 4 244 -84 -244 63
		mu 0 4 67 88 87 66
		f 4 245 -85 -245 64
		mu 0 4 68 89 88 67
		f 4 246 -86 -246 65
		mu 0 4 69 90 89 68
		f 4 247 -87 -247 66
		mu 0 4 70 91 90 69
		f 4 248 -88 -248 67
		mu 0 4 71 92 91 70
		f 4 249 -89 -249 68
		mu 0 4 72 93 92 71
		f 4 250 -90 -250 69
		mu 0 4 73 94 93 72
		f 4 251 -91 -251 70
		mu 0 4 74 95 94 73
		f 4 252 -92 -252 71
		mu 0 4 75 96 95 74
		f 4 253 -93 -253 72
		mu 0 4 76 97 96 75
		f 4 254 -94 -254 73
		mu 0 4 77 98 97 76
		f 4 255 -95 -255 74
		mu 0 4 78 99 98 77
		f 4 256 -96 -256 75
		mu 0 4 79 100 99 78
		f 4 257 -97 -257 76
		mu 0 4 80 101 100 79
		f 4 258 -98 -258 77
		mu 0 4 81 102 101 80
		f 4 259 -99 -259 78
		mu 0 4 82 103 102 81
		f 4 240 -100 -260 79
		mu 0 4 83 104 103 82
		f 4 261 -101 -261 80
		mu 0 4 85 106 105 84
		f 4 262 -102 -262 81
		mu 0 4 86 107 106 85
		f 4 263 -103 -263 82
		mu 0 4 87 108 107 86
		f 4 264 -104 -264 83
		mu 0 4 88 109 108 87
		f 4 265 -105 -265 84
		mu 0 4 89 110 109 88
		f 4 266 -106 -266 85
		mu 0 4 90 111 110 89
		f 4 267 -107 -267 86
		mu 0 4 91 112 111 90
		f 4 268 -108 -268 87
		mu 0 4 92 113 112 91
		f 4 269 -109 -269 88
		mu 0 4 93 114 113 92
		f 4 270 -110 -270 89
		mu 0 4 94 115 114 93
		f 4 271 -111 -271 90
		mu 0 4 95 116 115 94
		f 4 272 -112 -272 91
		mu 0 4 96 117 116 95
		f 4 273 -113 -273 92
		mu 0 4 97 118 117 96
		f 4 274 -114 -274 93
		mu 0 4 98 119 118 97
		f 4 275 -115 -275 94
		mu 0 4 99 120 119 98
		f 4 276 -116 -276 95
		mu 0 4 100 121 120 99
		f 4 277 -117 -277 96
		mu 0 4 101 122 121 100
		f 4 278 -118 -278 97
		mu 0 4 102 123 122 101
		f 4 279 -119 -279 98
		mu 0 4 103 124 123 102
		f 4 260 -120 -280 99
		mu 0 4 104 125 124 103
		f 4 281 -121 -281 100
		mu 0 4 106 127 126 105
		f 4 282 -122 -282 101
		mu 0 4 107 128 127 106
		f 4 283 -123 -283 102
		mu 0 4 108 129 128 107
		f 4 284 -124 -284 103
		mu 0 4 109 130 129 108
		f 4 285 -125 -285 104
		mu 0 4 110 131 130 109
		f 4 286 -126 -286 105
		mu 0 4 111 132 131 110
		f 4 287 -127 -287 106
		mu 0 4 112 133 132 111
		f 4 288 -128 -288 107
		mu 0 4 113 134 133 112
		f 4 289 -129 -289 108
		mu 0 4 114 135 134 113
		f 4 290 -130 -290 109
		mu 0 4 115 136 135 114
		f 4 291 -131 -291 110
		mu 0 4 116 137 136 115
		f 4 292 -132 -292 111
		mu 0 4 117 138 137 116
		f 4 293 -133 -293 112
		mu 0 4 118 139 138 117
		f 4 294 -134 -294 113
		mu 0 4 119 140 139 118
		f 4 295 -135 -295 114
		mu 0 4 120 141 140 119
		f 4 296 -136 -296 115
		mu 0 4 121 142 141 120
		f 4 297 -137 -297 116
		mu 0 4 122 143 142 121
		f 4 298 -138 -298 117
		mu 0 4 123 144 143 122
		f 4 299 -139 -299 118
		mu 0 4 124 145 144 123
		f 4 280 -140 -300 119
		mu 0 4 125 146 145 124
		f 4 301 -141 -301 120
		mu 0 4 127 148 147 126
		f 4 302 -142 -302 121
		mu 0 4 128 149 148 127
		f 4 303 -143 -303 122
		mu 0 4 129 150 149 128
		f 4 304 -144 -304 123
		mu 0 4 130 151 150 129
		f 4 305 -145 -305 124
		mu 0 4 131 152 151 130
		f 4 306 -146 -306 125
		mu 0 4 132 153 152 131
		f 4 307 -147 -307 126
		mu 0 4 133 154 153 132
		f 4 308 -148 -308 127
		mu 0 4 134 155 154 133
		f 4 309 -149 -309 128
		mu 0 4 135 156 155 134
		f 4 310 -150 -310 129
		mu 0 4 136 157 156 135
		f 4 311 -151 -311 130
		mu 0 4 137 158 157 136
		f 4 312 -152 -312 131
		mu 0 4 138 159 158 137
		f 4 313 -153 -313 132
		mu 0 4 139 160 159 138
		f 4 314 -154 -314 133
		mu 0 4 140 161 160 139
		f 4 315 -155 -315 134
		mu 0 4 141 162 161 140
		f 4 316 -156 -316 135
		mu 0 4 142 163 162 141
		f 4 317 -157 -317 136
		mu 0 4 143 164 163 142
		f 4 318 -158 -318 137
		mu 0 4 144 165 164 143
		f 4 319 -159 -319 138
		mu 0 4 145 166 165 144
		f 4 300 -160 -320 139
		mu 0 4 146 167 166 145
		f 4 321 646 -321 140
		mu 0 4 148 350 352 147
		f 4 322 644 -322 141
		mu 0 4 149 349 350 148
		f 4 323 642 -323 142
		mu 0 4 150 348 349 149
		f 4 324 679 -324 143
		mu 0 4 151 368 348 150
		f 4 325 678 -325 144
		mu 0 4 152 367 368 151
		f 4 326 676 -326 145
		mu 0 4 153 366 367 152
		f 4 327 674 -327 146
		mu 0 4 154 365 366 153
		f 4 328 672 -328 147
		mu 0 4 155 364 365 154
		f 4 329 670 -329 148
		mu 0 4 156 363 364 155
		f 4 330 668 -330 149
		mu 0 4 157 362 363 156
		f 4 331 666 -331 150
		mu 0 4 158 361 362 157
		f 4 332 664 -332 151
		mu 0 4 159 360 361 158
		f 4 333 662 -333 152
		mu 0 4 160 359 360 159
		f 4 334 660 -334 153
		mu 0 4 161 358 359 160
		f 4 335 658 -335 154
		mu 0 4 162 357 358 161
		f 4 336 656 -336 155
		mu 0 4 163 356 357 162
		f 4 337 654 -337 156
		mu 0 4 164 355 356 163
		f 4 338 652 -338 157
		mu 0 4 165 354 355 164
		f 4 339 650 -339 158
		mu 0 4 166 353 354 165
		f 4 320 648 -340 159
		mu 0 4 167 351 353 166
		f 4 160 361 -363 -361
		mu 0 4 371 169 208 209
		f 4 161 363 -365 -362
		mu 0 4 169 170 210 208
		f 4 162 365 -367 -364
		mu 0 4 170 171 211 210
		f 4 163 367 -369 -366
		mu 0 4 171 172 212 211
		f 4 164 369 -371 -368
		mu 0 4 172 173 213 212
		f 4 165 371 -373 -370
		mu 0 4 173 174 214 213
		f 4 166 373 -375 -372
		mu 0 4 174 175 215 214
		f 4 167 375 -377 -374
		mu 0 4 175 176 216 215
		f 4 168 377 -379 -376
		mu 0 4 176 177 217 216
		f 4 169 379 -381 -378
		mu 0 4 177 178 218 217
		f 4 170 381 -383 -380
		mu 0 4 178 179 219 218
		f 4 171 383 -385 -382
		mu 0 4 179 180 220 219
		f 4 172 385 -387 -384
		mu 0 4 180 181 221 220
		f 4 173 387 -389 -386
		mu 0 4 181 182 222 221
		f 4 174 389 -391 -388
		mu 0 4 182 183 223 222
		f 4 175 391 -393 -390
		mu 0 4 183 184 224 223
		f 4 176 393 -395 -392
		mu 0 4 184 185 225 224
		f 4 177 395 -397 -394
		mu 0 4 185 186 226 225
		f 4 178 397 -399 -396
		mu 0 4 186 187 227 226
		f 4 179 360 -400 -398
		mu 0 4 187 168 370 227
		f 4 401 -403 -401 362
		mu 0 4 208 228 229 209
		f 4 403 -405 -402 364
		mu 0 4 210 230 228 208
		f 4 405 -407 -404 366
		mu 0 4 211 231 230 210
		f 4 407 -409 -406 368
		mu 0 4 212 232 231 211
		f 4 409 -411 -408 370
		mu 0 4 213 233 232 212
		f 4 411 -413 -410 372
		mu 0 4 214 234 233 213
		f 4 413 -415 -412 374
		mu 0 4 215 235 234 214
		f 4 415 -417 -414 376
		mu 0 4 216 236 235 215
		f 4 417 -419 -416 378
		mu 0 4 217 237 236 216
		f 4 419 -421 -418 380
		mu 0 4 218 238 237 217
		f 4 421 -423 -420 382
		mu 0 4 219 239 238 218
		f 4 423 -425 -422 384
		mu 0 4 220 240 239 219
		f 4 425 -427 -424 386
		mu 0 4 221 241 240 220
		f 4 427 -429 -426 388
		mu 0 4 222 242 241 221
		f 4 429 -431 -428 390
		mu 0 4 223 243 242 222
		f 4 431 -433 -430 392
		mu 0 4 224 244 243 223
		f 4 433 -435 -432 394
		mu 0 4 225 245 244 224
		f 4 435 -437 -434 396
		mu 0 4 226 246 245 225
		f 4 437 -439 -436 398
		mu 0 4 227 247 246 226
		f 4 400 -440 -438 399
		mu 0 4 370 369 247 227
		f 4 402 441 -443 -441
		mu 0 4 229 228 248 249
		f 4 404 443 -445 -442
		mu 0 4 228 230 250 248
		f 4 406 445 -447 -444
		mu 0 4 230 231 251 250
		f 4 408 447 -449 -446
		mu 0 4 231 232 252 251
		f 4 410 449 -451 -448
		mu 0 4 232 233 253 252
		f 4 412 451 -453 -450
		mu 0 4 233 234 254 253
		f 4 414 453 -455 -452
		mu 0 4 234 235 255 254
		f 4 416 455 -457 -454
		mu 0 4 235 236 256 255
		f 4 418 457 -459 -456
		mu 0 4 236 237 257 256
		f 4 420 459 -461 -458
		mu 0 4 237 238 258 257
		f 4 422 461 -463 -460
		mu 0 4 238 239 259 258
		f 4 424 463 -465 -462
		mu 0 4 239 240 260 259
		f 4 426 465 -467 -464
		mu 0 4 240 241 261 260
		f 4 428 467 -469 -466
		mu 0 4 241 242 262 261
		f 4 430 469 -471 -468
		mu 0 4 242 243 263 262
		f 4 432 471 -473 -470
		mu 0 4 243 244 264 263
		f 4 434 473 -475 -472
		mu 0 4 244 245 265 264
		f 4 436 475 -477 -474
		mu 0 4 245 246 266 265
		f 4 438 477 -479 -476
		mu 0 4 246 247 267 266
		f 4 439 440 -480 -478
		mu 0 4 247 369 376 267
		f 4 442 481 -483 -481
		mu 0 4 249 248 268 269
		f 4 444 483 -485 -482
		mu 0 4 248 250 270 268
		f 4 446 485 -487 -484
		mu 0 4 250 251 271 270
		f 4 448 487 -489 -486
		mu 0 4 251 252 272 271
		f 4 450 489 -491 -488
		mu 0 4 252 253 273 272
		f 4 452 491 -493 -490
		mu 0 4 253 254 274 273
		f 4 454 493 -495 -492
		mu 0 4 254 255 275 274
		f 4 456 495 -497 -494
		mu 0 4 255 256 276 275
		f 4 458 497 -499 -496
		mu 0 4 256 257 277 276
		f 4 460 499 -501 -498
		mu 0 4 257 258 278 277
		f 4 462 501 -503 -500
		mu 0 4 258 259 279 278
		f 4 464 503 -505 -502
		mu 0 4 259 260 280 279
		f 4 466 505 -507 -504
		mu 0 4 260 261 281 280
		f 4 468 507 -509 -506
		mu 0 4 261 262 282 281
		f 4 470 509 -511 -508
		mu 0 4 262 263 283 282
		f 4 472 511 -513 -510
		mu 0 4 263 264 284 283
		f 4 474 513 -515 -512
		mu 0 4 264 265 285 284
		f 4 476 515 -517 -514
		mu 0 4 265 266 286 285
		f 4 478 517 -519 -516
		mu 0 4 266 267 287 286
		f 4 479 480 -520 -518
		mu 0 4 267 376 375 287
		f 4 482 521 -523 -521
		mu 0 4 269 268 288 289
		f 4 484 523 -525 -522
		mu 0 4 268 270 290 288
		f 4 486 525 -527 -524
		mu 0 4 270 271 291 290
		f 4 488 527 -529 -526
		mu 0 4 271 272 292 291
		f 4 490 529 -531 -528
		mu 0 4 272 273 293 292
		f 4 492 531 -533 -530
		mu 0 4 273 274 294 293
		f 4 494 533 -535 -532
		mu 0 4 274 275 295 294
		f 4 496 535 -537 -534
		mu 0 4 275 276 296 295
		f 4 498 537 -539 -536
		mu 0 4 276 277 297 296
		f 4 500 539 -541 -538
		mu 0 4 277 278 298 297
		f 4 502 541 -543 -540
		mu 0 4 278 279 299 298
		f 4 504 543 -545 -542
		mu 0 4 279 280 300 299
		f 4 506 545 -547 -544
		mu 0 4 280 281 301 300
		f 4 508 547 -549 -546
		mu 0 4 281 282 302 301
		f 4 510 549 -551 -548
		mu 0 4 282 283 303 302
		f 4 512 551 -553 -550
		mu 0 4 283 284 304 303
		f 4 514 553 -555 -552
		mu 0 4 284 285 305 304
		f 4 516 555 -557 -554
		mu 0 4 285 286 306 305
		f 4 518 557 -559 -556
		mu 0 4 286 287 307 306
		f 4 519 520 -560 -558
		mu 0 4 287 375 374 307
		f 4 522 561 -563 -561
		mu 0 4 289 288 308 309
		f 4 524 563 -565 -562
		mu 0 4 288 290 310 308
		f 4 526 565 -567 -564
		mu 0 4 290 291 311 310
		f 4 528 567 -569 -566
		mu 0 4 291 292 312 311
		f 4 530 569 -571 -568
		mu 0 4 292 293 313 312
		f 4 532 571 -573 -570
		mu 0 4 293 294 314 313
		f 4 534 573 -575 -572
		mu 0 4 294 295 315 314
		f 4 536 575 -577 -574
		mu 0 4 295 296 316 315
		f 4 538 577 -579 -576
		mu 0 4 296 297 317 316
		f 4 540 579 -581 -578
		mu 0 4 297 298 318 317
		f 4 542 581 -583 -580
		mu 0 4 298 299 319 318
		f 4 544 583 -585 -582
		mu 0 4 299 300 320 319
		f 4 546 585 -587 -584
		mu 0 4 300 301 321 320
		f 4 548 587 -589 -586
		mu 0 4 301 302 322 321
		f 4 550 589 -591 -588
		mu 0 4 302 303 323 322
		f 4 552 591 -593 -590
		mu 0 4 303 304 324 323
		f 4 554 593 -595 -592
		mu 0 4 304 305 325 324
		f 4 556 595 -597 -594
		mu 0 4 305 306 326 325
		f 4 558 597 -599 -596
		mu 0 4 306 307 327 326
		f 4 559 560 -600 -598
		mu 0 4 307 374 372 327
		f 4 562 601 -603 -601
		mu 0 4 309 308 328 329
		f 4 564 603 -605 -602
		mu 0 4 308 310 330 328
		f 4 566 605 -607 -604
		mu 0 4 310 311 331 330
		f 4 568 607 -609 -606
		mu 0 4 311 312 332 331
		f 4 570 609 -611 -608
		mu 0 4 312 313 333 332
		f 4 572 611 -613 -610
		mu 0 4 313 314 334 333
		f 4 574 613 -615 -612
		mu 0 4 314 315 335 334
		f 4 576 615 -617 -614
		mu 0 4 315 316 336 335
		f 4 578 617 -619 -616
		mu 0 4 316 317 337 336
		f 4 580 619 -621 -618
		mu 0 4 317 318 338 337
		f 4 582 621 -623 -620
		mu 0 4 318 319 339 338
		f 4 584 623 -625 -622
		mu 0 4 319 320 340 339
		f 4 586 625 -627 -624
		mu 0 4 320 321 341 340
		f 4 588 627 -629 -626
		mu 0 4 321 322 342 341
		f 4 590 629 -631 -628
		mu 0 4 322 323 343 342
		f 4 592 631 -633 -630
		mu 0 4 323 324 344 343
		f 4 594 633 -635 -632
		mu 0 4 324 325 345 344
		f 4 596 635 -637 -634
		mu 0 4 325 326 346 345
		f 4 598 637 -639 -636
		mu 0 4 326 327 347 346
		f 4 599 600 -640 -638
		mu 0 4 327 372 373 347
		f 4 -643 640 -163 -642
		mu 0 4 349 348 171 170
		f 4 -645 641 -162 -644
		mu 0 4 350 349 170 169
		f 4 -647 643 -161 -646
		mu 0 4 352 350 169 371
		f 4 -649 645 -180 -648
		mu 0 4 353 351 168 187
		f 4 -651 647 -179 -650
		mu 0 4 354 353 187 186
		f 4 -653 649 -178 -652
		mu 0 4 355 354 186 185
		f 4 -655 651 -177 -654
		mu 0 4 356 355 185 184
		f 4 -657 653 -176 -656
		mu 0 4 357 356 184 183
		f 4 -659 655 -175 -658
		mu 0 4 358 357 183 182
		f 4 -661 657 -174 -660
		mu 0 4 359 358 182 181
		f 4 -663 659 -173 -662
		mu 0 4 360 359 181 180
		f 4 -665 661 -172 -664
		mu 0 4 361 360 180 179
		f 4 -667 663 -171 -666
		mu 0 4 362 361 179 178
		f 4 -669 665 -170 -668
		mu 0 4 363 362 178 177
		f 4 -671 667 -169 -670
		mu 0 4 364 363 177 176
		f 4 -673 669 -168 -672
		mu 0 4 365 364 176 175
		f 4 -675 671 -167 -674
		mu 0 4 366 365 175 174
		f 4 -677 673 -166 -676
		mu 0 4 367 366 174 173
		f 4 -679 675 -165 -678
		mu 0 4 368 367 173 172
		f 4 -680 677 -164 -641
		mu 0 4 348 368 172 171;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode transform -n "l_pupil" -p "l_geo_group";
	rename -uid "3FB58C1D-4EDE-166A-8861-08B3E31790C4";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -1.2417994799118759e-07 1.862347126513341e-07 0.0078996763500006582 ;
	setAttr ".rpt" -type "double3" 0 7.059664236870061e-06 -3.3209195497707622e-09 ;
	setAttr ".sp" -type "double3" -1.2417994799118759e-07 1.8623471265133418e-07 0.0078996763500006617 ;
	setAttr ".spt" -type "double3" 0 -7.9409338805090622e-23 -3.4694469519536126e-18 ;
createNode mesh -n "l_pupilShape" -p "l_pupil";
	rename -uid "0019DDF6-4748-8A07-1B50-D394298303F9";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 22.5 8.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "l_pupilShapeOrig1" -p "l_pupil";
	rename -uid "535BA9CC-4F24-9129-5436-8ABAE151136F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 22.5 8.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 100 ".uvst[0].uvsp[0:99]" -type "float2" 21 -1 21 0 21 1 21
		 2 21 3 21 4 21 5 21 6 21 7 21 8 21 9 21 10 21 11 21 12 21 13 21 14 21 15 21 16 21
		 17 21 18 22 -1 22 0 22 1 22 2 22 3 22 4 22 5 22 6 22 7 22 8 22 9 22 10 22 11 22 12
		 22 13 22 14 22 15 22 16 22 17 22 18 23 -1 23 0 23 1 23 2 23 3 23 4 23 5 23 6 23 7
		 23 8 23 9 23 10 23 11 23 12 23 13 23 14 23 15 23 16 23 17 23 18 23.66666603 -1 23.66666603
		 0 23.66666603 1 23.66666603 2 23.66666603 3 23.66666603 4 23.66666603 5 23.66666603
		 6 23.66666603 7 23.66666603 8 23.66666603 9 23.66666603 10 23.66666603 11 23.66666603
		 12 23.66666603 13 23.66666603 14 23.66666603 15 23.66666603 16 23.66666603 17 23.66666603
		 18 24 -1 24 0 24 1 24 2 24 3 24 4 24 5 24 6 24 7 24 8 24 9 24 10 24 11 24 12 24 13
		 24 14 24 15 24 16 24 17 24 18;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 100 ".pt[0:99]" -type "float3"  -0.038534436 -0.012515453 
		-0.23385845 -0.040517241 3.0675503e-06 -0.23385845 -0.038534436 0.012521286 -0.23385845 
		-0.032780051 0.023814408 -0.23385845 -0.023815669 0.032777086 -0.23385851 -0.012520699 
		0.038530074 -0.23385845 -2.2710054e-16 0.04051318 -0.23385845 0.012520699 0.038530074 
		-0.23385845 0.023815669 0.032777086 -0.23385851 0.032780051 0.023814408 -0.23385845 
		0.038534436 0.012521286 -0.23385845 0.040517241 3.0675503e-06 -0.23385845 0.038534436 
		-0.012515453 -0.23385845 0.032780051 -0.02380868 -0.23385845 0.023815669 -0.032770477 
		-0.23385845 0.012520699 -0.038524307 -0.23385845 -2.2710054e-16 -0.04050719 -0.23385845 
		-0.012520699 -0.038524307 -0.23385845 -0.023815669 -0.032770477 -0.23385845 -0.032780051 
		-0.02380868 -0.23385845 -0.024297331 -0.0078901006 -0.24975888 -0.025547098 3.0675437e-06 
		-0.24975888 -0.024297331 0.0078961179 -0.24975888 -0.020667816 0.015016475 -0.24975888 
		-0.015015855 0.02066751 -0.24975888 -0.0078944461 0.024295162 -0.24975888 -2.2710054e-16 
		0.025545452 -0.24975888 0.0078944461 0.024295162 -0.24975888 0.015015855 0.02066751 
		-0.24975888 0.020667816 0.015016475 -0.24975888 0.024297331 0.0078961179 -0.24975888 
		0.025547098 3.0675437e-06 -0.24975888 0.024297331 -0.0078901006 -0.24975888 0.020667816 
		-0.015010419 -0.24975888 0.015015855 -0.020661095 -0.24975888 0.0078944461 -0.024289228 
		-0.24975888 -2.2710054e-16 -0.025539692 -0.24975888 -0.0078944461 -0.024289228 -0.24975888 
		-0.015015855 -0.020661095 -0.24975888 -0.020667816 -0.015010419 -0.24975888 -0.012254737 
		-0.0039779963 -0.25483409 -0.012885366 3.0675485e-06 -0.25483409 -0.012254737 0.0039841132 
		-0.25483409 -0.010424431 0.0075754868 -0.25483409 -0.0075738481 0.010425595 -0.25483409 
		-0.0039818082 0.012255363 -0.25483409 -2.2710054e-16 0.012885988 -0.25483409 0.0039818082 
		0.012255363 -0.25483409 0.0075738481 0.010425595 -0.25483409 0.010424431 0.0075754868 
		-0.25483409 0.012254737 0.0039841132 -0.25483409 0.012885366 3.0675485e-06 -0.25483409 
		0.012254737 -0.0039779963 -0.25483409 0.010424431 -0.0075693699 -0.25483409 0.0075738481 
		-0.010419384 -0.25483409 0.0039818082 -0.012249339 -0.25483409 -2.2710054e-16 -0.012880178 
		-0.25483409 -0.0039818082 -0.012249339 -0.25483409 -0.0075738481 -0.010419384 -0.25483409 
		-0.010424431 -0.0075693699 -0.25483409 -0.0040815677 -0.0013228599 -0.25667995 -0.0042915125 
		3.0675292e-06 -0.25667995 -0.0040815677 0.0013289925 -0.25667995 -0.003471924 0.0025250865 
		-0.25667995 -0.0025225396 0.0034743752 -0.25667995 -0.0013261634 0.0040837582 -0.25667995 
		-2.2710054e-16 0.0042938734 -0.25667995 0.0013261634 0.0040837582 -0.25667995 0.0025225396 
		0.0034743752 -0.25667995 0.003471924 0.0025250865 -0.25667995 0.0040815677 0.0013289925 
		-0.25667995 0.0042915125 3.0675292e-06 -0.25667995 0.0040815677 -0.0013228599 -0.25667995 
		0.003471924 -0.0025189617 -0.25667995 0.0025225396 -0.0034681908 -0.25667995 0.0013261634 
		-0.0040776152 -0.25667995 -2.2710054e-16 -0.0042877062 -0.25667995 -0.0013261634 
		-0.0040776152 -0.25667995 -0.0025225396 -0.0034681908 -0.25667995 -0.003471924 -0.0025189617 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995;
	setAttr -s 100 ".vt[0:99]"  0.24474537 0.07950756 0.98944354 0.25734052 -2.3948418e-11 0.98944354
		 0.24474537 -0.07950756 0.98944354 0.20819286 -0.15123236 0.98944354 0.15126096 -0.20815349 0.9894436
		 0.079522587 -0.24469912 0.98944354 1.4423887e-15 -0.25729185 0.98944354 -0.079522587 -0.24469912 0.98944354
		 -0.15126096 -0.20815349 0.9894436 -0.20819286 -0.15123236 0.98944354 -0.24474537 -0.07950756 0.98944354
		 -0.25734052 -2.3948418e-11 0.98944354 -0.24474537 0.07950756 0.98944354 -0.20819286 0.15123236 0.98944354
		 -0.15126096 0.2081535 0.98944354 -0.079522587 0.24469912 0.98944354 1.4423887e-15 0.25729185 0.98944354
		 0.079522587 0.24469912 0.98944354 0.15126096 0.2081535 0.98944354 0.20819286 0.15123236 0.98944354
		 0.15431596 0.050130814 1.031048179 0.1622574 -4.3084272e-11 1.031048179 0.15431596 -0.050130814 1.031048179
		 0.13126901 -0.095354483 1.031048179 0.095372505 -0.13124418 1.031048179 0.050140295 -0.1542868 1.031048179
		 1.4423887e-15 -0.16222674 1.031048179 -0.050140295 -0.1542868 1.031048179 -0.095372505 -0.13124418 1.031048179
		 -0.13126901 -0.095354483 1.031048179 -0.15431596 -0.050130814 1.031048179 -0.1622574 -4.3084272e-11 1.031048179
		 -0.15431596 0.050130814 1.031048179 -0.13126901 0.095354483 1.031048179 -0.095372505 0.13124418 1.031048179
		 -0.050140295 0.1542868 1.031048179 1.4423887e-15 0.16222674 1.031048179 0.050140295 0.1542868 1.031048179
		 0.095372505 0.13124418 1.031048179 0.13126901 0.095354483 1.031048179 0.077833511 0.025284858 1.04433465
		 0.081839003 -2.1862871e-11 1.04433465 0.077833511 -0.025284858 1.04433465 0.066209137 -0.048094656 1.04433465
		 0.048103753 -0.06619662 1.04433465 0.02528964 -0.077818796 1.04433465 1.4423887e-15 -0.081823528 1.04433465
		 -0.02528964 -0.077818796 1.04433465 -0.048103753 -0.06619662 1.04433465 -0.066209137 -0.048094656 1.04433465
		 -0.077833511 -0.025284858 1.04433465 -0.081839003 -2.1862871e-11 1.04433465 -0.077833511 0.025284858 1.04433465
		 -0.066209137 0.048094656 1.04433465 -0.048103753 0.06619662 1.04433465 -0.02528964 0.077818796 1.04433465
		 1.4423887e-15 0.081823528 1.04433465 0.02528964 0.077818796 1.04433465 0.048103753 0.06619662 1.04433465
		 0.066209137 0.048094656 1.04433465 0.02592317 0.0084213568 1.049166322 0.027257234 3.5685997e-13 1.049166322
		 0.02592317 -0.0084213568 1.049166322 0.022051565 -0.01601837 1.049166322 0.016021401 -0.022047397 1.049166322
		 0.0084229484 -0.025918268 1.049166322 1.4423887e-15 -0.027252082 1.049166322 -0.0084229484 -0.025918268 1.049166322
		 -0.016021401 -0.022047397 1.049166322 -0.022051565 -0.01601837 1.049166322 -0.02592317 -0.0084213568 1.049166322
		 -0.027257234 3.5685997e-13 1.049166322 -0.02592317 0.0084213568 1.049166322 -0.022051565 0.01601837 1.049166322
		 -0.016021401 0.022047397 1.049166322 -0.0084229484 0.025918268 1.049166322 1.4423887e-15 0.027252082 1.049166322
		 0.0084229484 0.025918268 1.049166322 0.016021401 0.022047397 1.049166322 0.022051565 0.01601837 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322;
	setAttr -s 180 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0
		 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 0 0
		 0 20 1 20 21 1 21 1 1 21 22 1 22 2 1 22 23 1 23 3 1 23 24 1 24 4 1 24 25 1 25 5 1
		 25 26 1 26 6 1 26 27 1 27 7 1 27 28 1 28 8 1 28 29 1 29 9 1 29 30 1 30 10 1 30 31 1
		 31 11 1 31 32 1 32 12 1 32 33 1 33 13 1 33 34 1 34 14 1 34 35 1 35 15 1 35 36 1 36 16 1
		 36 37 1 37 17 1 37 38 1 38 18 1 38 39 1 39 19 1 39 20 1 20 40 1 40 41 1 41 21 1 41 42 1
		 42 22 1 42 43 1 43 23 1 43 44 1 44 24 1 44 45 1 45 25 1 45 46 1 46 26 1 46 47 1 47 27 1
		 47 48 1 48 28 1 48 49 1 49 29 1 49 50 1 50 30 1 50 51 1 51 31 1 51 52 1 52 32 1 52 53 1
		 53 33 1 53 54 1 54 34 1 54 55 1 55 35 1 55 56 1 56 36 1 56 57 1 57 37 1 57 58 1 58 38 1
		 58 59 1 59 39 1 59 40 1 40 60 1 60 61 1 61 41 1 61 62 1 62 42 1 62 63 1 63 43 1 63 64 1
		 64 44 1 64 65 1 65 45 1 65 66 1 66 46 1 66 67 1 67 47 1 67 68 1 68 48 1 68 69 1 69 49 1
		 69 70 1 70 50 1 70 71 1 71 51 1 71 72 1 72 52 1 72 73 1 73 53 1 73 74 1 74 54 1 74 75 1
		 75 55 1 75 76 1 76 56 1 76 77 1 77 57 1 77 78 1 78 58 1 78 79 1 79 59 1 79 60 1 60 80 1
		 80 81 0 81 61 1 81 82 0 82 62 1 82 83 0 83 63 1 83 84 0 84 64 1 84 85 0 85 65 1 85 86 0
		 86 66 1 86 87 0 87 67 1 87 88 0 88 68 1 88 89 0 89 69 1 89 90 0 90 70 1 90 91 0 91 71 1
		 91 92 0 92 72 1 92 93 0;
	setAttr ".ed[166:179]" 93 73 1 93 94 0 94 74 1 94 95 0 95 75 1 95 96 0 96 76 1
		 96 97 0 97 77 1 97 98 0 98 78 1 98 99 0 99 79 1 99 80 0;
	setAttr -s 80 -ch 320 ".fc[0:79]" -type "polyFaces" 
		f 4 20 21 22 -1
		mu 0 4 0 20 21 1
		f 4 -23 23 24 -2
		mu 0 4 1 21 22 2
		f 4 -25 25 26 -3
		mu 0 4 2 22 23 3
		f 4 -27 27 28 -4
		mu 0 4 3 23 24 4
		f 4 -29 29 30 -5
		mu 0 4 4 24 25 5
		f 4 -31 31 32 -6
		mu 0 4 5 25 26 6
		f 4 -33 33 34 -7
		mu 0 4 6 26 27 7
		f 4 -35 35 36 -8
		mu 0 4 7 27 28 8
		f 4 -37 37 38 -9
		mu 0 4 8 28 29 9
		f 4 -39 39 40 -10
		mu 0 4 9 29 30 10
		f 4 -41 41 42 -11
		mu 0 4 10 30 31 11
		f 4 -43 43 44 -12
		mu 0 4 11 31 32 12
		f 4 -45 45 46 -13
		mu 0 4 12 32 33 13
		f 4 -47 47 48 -14
		mu 0 4 13 33 34 14
		f 4 -49 49 50 -15
		mu 0 4 14 34 35 15
		f 4 -51 51 52 -16
		mu 0 4 15 35 36 16
		f 4 -53 53 54 -17
		mu 0 4 16 36 37 17
		f 4 -55 55 56 -18
		mu 0 4 17 37 38 18
		f 4 -57 57 58 -19
		mu 0 4 18 38 39 19
		f 4 -59 59 -21 -20
		mu 0 4 19 39 20 0
		f 4 60 61 62 -22
		mu 0 4 20 40 41 21
		f 4 -63 63 64 -24
		mu 0 4 21 41 42 22
		f 4 -65 65 66 -26
		mu 0 4 22 42 43 23
		f 4 -67 67 68 -28
		mu 0 4 23 43 44 24
		f 4 -69 69 70 -30
		mu 0 4 24 44 45 25
		f 4 -71 71 72 -32
		mu 0 4 25 45 46 26
		f 4 -73 73 74 -34
		mu 0 4 26 46 47 27
		f 4 -75 75 76 -36
		mu 0 4 27 47 48 28
		f 4 -77 77 78 -38
		mu 0 4 28 48 49 29
		f 4 -79 79 80 -40
		mu 0 4 29 49 50 30
		f 4 -81 81 82 -42
		mu 0 4 30 50 51 31
		f 4 -83 83 84 -44
		mu 0 4 31 51 52 32
		f 4 -85 85 86 -46
		mu 0 4 32 52 53 33
		f 4 -87 87 88 -48
		mu 0 4 33 53 54 34
		f 4 -89 89 90 -50
		mu 0 4 34 54 55 35
		f 4 -91 91 92 -52
		mu 0 4 35 55 56 36
		f 4 -93 93 94 -54
		mu 0 4 36 56 57 37
		f 4 -95 95 96 -56
		mu 0 4 37 57 58 38
		f 4 -97 97 98 -58
		mu 0 4 38 58 59 39
		f 4 -99 99 -61 -60
		mu 0 4 39 59 40 20
		f 4 100 101 102 -62
		mu 0 4 40 60 61 41
		f 4 -103 103 104 -64
		mu 0 4 41 61 62 42
		f 4 -105 105 106 -66
		mu 0 4 42 62 63 43
		f 4 -107 107 108 -68
		mu 0 4 43 63 64 44
		f 4 -109 109 110 -70
		mu 0 4 44 64 65 45
		f 4 -111 111 112 -72
		mu 0 4 45 65 66 46
		f 4 -113 113 114 -74
		mu 0 4 46 66 67 47
		f 4 -115 115 116 -76
		mu 0 4 47 67 68 48
		f 4 -117 117 118 -78
		mu 0 4 48 68 69 49
		f 4 -119 119 120 -80
		mu 0 4 49 69 70 50
		f 4 -121 121 122 -82
		mu 0 4 50 70 71 51
		f 4 -123 123 124 -84
		mu 0 4 51 71 72 52
		f 4 -125 125 126 -86
		mu 0 4 52 72 73 53
		f 4 -127 127 128 -88
		mu 0 4 53 73 74 54
		f 4 -129 129 130 -90
		mu 0 4 54 74 75 55
		f 4 -131 131 132 -92
		mu 0 4 55 75 76 56
		f 4 -133 133 134 -94
		mu 0 4 56 76 77 57
		f 4 -135 135 136 -96
		mu 0 4 57 77 78 58
		f 4 -137 137 138 -98
		mu 0 4 58 78 79 59
		f 4 -139 139 -101 -100
		mu 0 4 59 79 60 40
		f 4 140 141 142 -102
		mu 0 4 60 80 81 61
		f 4 -143 143 144 -104
		mu 0 4 61 81 82 62
		f 4 -145 145 146 -106
		mu 0 4 62 82 83 63
		f 4 -147 147 148 -108
		mu 0 4 63 83 84 64
		f 4 -149 149 150 -110
		mu 0 4 64 84 85 65
		f 4 -151 151 152 -112
		mu 0 4 65 85 86 66
		f 4 -153 153 154 -114
		mu 0 4 66 86 87 67
		f 4 -155 155 156 -116
		mu 0 4 67 87 88 68
		f 4 -157 157 158 -118
		mu 0 4 68 88 89 69
		f 4 -159 159 160 -120
		mu 0 4 69 89 90 70
		f 4 -161 161 162 -122
		mu 0 4 70 90 91 71
		f 4 -163 163 164 -124
		mu 0 4 71 91 92 72
		f 4 -165 165 166 -126
		mu 0 4 72 92 93 73
		f 4 -167 167 168 -128
		mu 0 4 73 93 94 74
		f 4 -169 169 170 -130
		mu 0 4 74 94 95 75
		f 4 -171 171 172 -132
		mu 0 4 75 95 96 76
		f 4 -173 173 174 -134
		mu 0 4 76 96 97 77
		f 4 -175 175 176 -136
		mu 0 4 77 97 98 78
		f 4 -177 177 178 -138
		mu 0 4 78 98 99 79
		f 4 -179 179 -141 -140
		mu 0 4 79 99 80 60;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode transform -n "l_highlight_geo" -p "l_geo_group";
	rename -uid "FE968702-4600-3B6E-622F-00B45F238BCF";
createNode mesh -n "l_highlight_geoShape" -p "l_highlight_geo";
	rename -uid "F1B7FEF5-4A0D-FBDC-40FE-758FB5468383";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "l_highlight_geoShapeOrig" -p "l_highlight_geo";
	rename -uid "9F31A862-42C5-C70A-BE9D-5E94B0C209CE";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode parentConstraint -n "l_highlight_geo_parentConstraint1" -p "l_highlight_geo";
	rename -uid "F2782727-4D2D-BD6F-22F8-9398C133765A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "l_highlightW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 2.2204460492503131e-16 0 -1.1000633599883005 ;
	setAttr ".tg[0].tor" -type "double3" -90 0 0 ;
	setAttr ".lr" -type "double3" -101.54497137957769 -17.188715710380695 0.025360198832650539 ;
	setAttr ".rst" -type "double3" 1.2068271412702323 0 0 ;
	setAttr ".rsrr" -type "double3" -90 0 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "l_highlight_geo_scaleConstraint1" -p "l_highlight_geo";
	rename -uid "55DB200A-47BA-AF29-BC2B-A59B9EFB1AC9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "l_highlightW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr -k on ".w0";
createNode mesh -n "l_highlight_geoShapeOrigOrig" -p "l_highlight_geo";
	rename -uid "0C4541E2-4E76-4E19-9383-13AD615AB34F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 61 ".uvst[0].uvsp[0:60]" -type "float2" 0.066987343 0.24999999
		 0.93301272 0.25000006 0.49999994 1 0.50000006 0 0.9330126 0.75000006 0.066987231
		 0.74999988 0.5 0.5 0 0.49999997 0.25000006 0.066987306 0.5 0.25 0.28349364 0.62499994
		 0.28349367 0.37499997 0.75000006 0.066987343 1 0.50000006 0.7165063 0.625 0.7165063
		 0.37500003 0.74999988 0.93301272 0.24999997 0.93301266 0.49999997 0.74999994 0.17524047
		 0.68749994 0.017037092 0.62940943 0.14174683 0.43749994 0.28349367 0.49999997 0.15849365
		 0.56249994 0.017037166 0.37059042 0.1464467 0.14644663 0.26674688 0.22099364 0.15012032
		 0.29799679 0.37059054 0.017037129 0.50000006 0.12500001 0.39174685 0.31249997 0.38337347
		 0.17299683 0.5 0.37499997 0.39174679 0.5625 0.39174685 0.4375 0.62940955 0.017037166
		 0.73325312 0.22099368 0.60825318 0.3125 0.61662662 0.17299683 0.85355335 0.14644666
		 0.98296291 0.37059054 0.85825318 0.43750003 0.84987974 0.29799685 0.98296285 0.62940955
		 0.82475948 0.6875 0.7165063 0.5 0.84150636 0.5625 0.60825312 0.5625 0.60825318 0.4375
		 0.85355335 0.85355341 0.62499994 0.84150636 0.60825312 0.6875 0.72487968 0.76450318
		 0.62940943 0.98296291 0.37059042 0.98296285 0.37499994 0.84150636 0.49999994 0.90400636
		 0.14644659 0.85355335 0.39174679 0.6875 0.2751202 0.76450312 0.49999997 0.625;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 61 ".vt[0:60]"  -0.086602539 0 0.050000008 0.086602546 0 0.049999993
		 -1.6292068e-08 0 -0.10000001 7.4505802e-09 0 0.10000001 0.086602531 0 -0.050000008
		 -0.086602561 0 -0.049999986 -2.9471625e-09 0 0 -0.10000001 0 1.0753986e-08 -0.04999999 0 0.086602546
		 2.251709e-09 0 0.050000004 -0.043301277 0 -0.024999995 -0.043301269 0 0.025000006
		 0.050000008 0 0.086602539 0.10000001 0 -8.6031893e-09 0.043301266 0 -0.025000004
		 0.043301269 0 0.024999999 0.049999986 0 -0.086602554 -0.050000012 0 -0.086602539
		 -1.0050016e-08 0 -0.050000004 -0.064951912 0 -0.03749999 -0.09659259 0 -0.02588189
		 -0.071650639 0 0.012500009 -0.043301273 0 5.5879354e-09 -0.068301275 0 -0.012499992
		 -0.096592575 0 0.025881916 -0.070710666 0 0.070710681 -0.046650629 0 0.055801276
		 -0.069975942 0 0.040400643 -0.025881896 0 0.096592583 4.8511444e-09 0 0.075000003
		 -0.021650633 0 0.037500005 -0.023325313 0 0.065400638 -3.4772674e-10 0 0.025000002
		 -0.02165064 0 -0.012499997 -0.021650637 0 0.012500004 0.025881914 0 0.096592575 0.046650641 0 0.055801269
		 0.021650637 0 0.037500001 0.023325322 0 0.065400638 0.070710681 0 0.070710674 0.096592583 0 0.025881896
		 0.071650639 0 0.012499995 0.069975957 0 0.040400632 0.096592575 0 -0.025881914 0.064951897 0 -0.037500005
		 0.043301269 0 -2.7939677e-09 0.068301268 0 -0.012500005 0.021650631 0 -0.012500002
		 0.021650635 0 0.012499999 0.070710666 0 -0.070710689 0.024999989 0 -0.068301275 0.021650627 0 -0.037500005
		 0.04497594 0 -0.052900642 0.02588189 0 -0.09659259 -0.025881918 0 -0.096592575 -0.025000012 0 -0.068301275
		 -1.182573e-08 0 -0.080801278 -0.070710689 0 -0.070710666 -0.021650644 0 -0.037500001
		 -0.044975962 0 -0.052900627 -6.2377943e-09 0 -0.025;
	setAttr -s 108 ".ed[0:107]"  22 10 1 10 19 1 19 23 1 23 22 1 19 5 1 5 20 0
		 20 23 1 20 7 0 7 21 1 21 23 1 21 11 1 11 22 1 7 24 0 24 27 1 27 21 1 24 0 0 0 25 0
		 25 27 1 25 8 0 8 26 1 26 27 1 26 11 1 8 28 0 28 31 1 31 26 1 28 3 0 3 29 1 29 31 1
		 29 9 1 9 30 1 30 31 1 30 11 1 9 32 1 32 34 1 34 30 1 32 6 1 6 33 1 33 34 1 33 10 1
		 22 34 1 37 9 1 29 38 1 38 37 1 3 35 0 35 38 1 35 12 0 12 36 1 36 38 1 36 15 1 15 37 1
		 12 39 0 39 42 1 42 36 1 39 1 0 1 40 0 40 42 1 40 13 0 13 41 1 41 42 1 41 15 1 13 43 0
		 43 46 1 46 41 1 43 4 0 4 44 1 44 46 1 44 14 1 14 45 1 45 46 1 45 15 1 14 47 1 47 48 1
		 48 45 1 47 6 1 32 48 1 37 48 1 51 14 1 44 52 1 52 51 1 4 49 0 49 52 1 49 16 0 16 50 1
		 50 52 1 50 18 1 18 51 1 16 53 0 53 56 1 56 50 1 53 2 0 2 54 0 54 56 1 54 17 0 17 55 1
		 55 56 1 55 18 1 17 57 0 57 59 1 59 55 1 57 5 0 19 59 1 10 58 1 58 59 1 58 18 1 33 60 1
		 60 58 1 47 60 1 51 60 1;
	setAttr -s 48 -ch 192 ".fc[0:47]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 22 10 19 23
		f 4 4 5 6 -3
		mu 0 4 19 5 20 23
		f 4 7 8 9 -7
		mu 0 4 20 7 21 23
		f 4 10 11 -4 -10
		mu 0 4 21 11 22 23
		f 4 -9 12 13 14
		mu 0 4 21 7 24 27
		f 4 15 16 17 -14
		mu 0 4 24 0 25 27
		f 4 18 19 20 -18
		mu 0 4 25 8 26 27
		f 4 21 -11 -15 -21
		mu 0 4 26 11 21 27
		f 4 -20 22 23 24
		mu 0 4 26 8 28 31
		f 4 25 26 27 -24
		mu 0 4 28 3 29 31
		f 4 28 29 30 -28
		mu 0 4 29 9 30 31
		f 4 31 -22 -25 -31
		mu 0 4 30 11 26 31
		f 4 -30 32 33 34
		mu 0 4 30 9 32 34
		f 4 35 36 37 -34
		mu 0 4 32 6 33 34
		f 4 38 -1 39 -38
		mu 0 4 33 10 22 34
		f 4 -12 -32 -35 -40
		mu 0 4 22 11 30 34
		f 4 40 -29 41 42
		mu 0 4 37 9 29 38
		f 4 -27 43 44 -42
		mu 0 4 29 3 35 38
		f 4 45 46 47 -45
		mu 0 4 35 12 36 38
		f 4 48 49 -43 -48
		mu 0 4 36 15 37 38
		f 4 -47 50 51 52
		mu 0 4 36 12 39 42
		f 4 53 54 55 -52
		mu 0 4 39 1 40 42
		f 4 56 57 58 -56
		mu 0 4 40 13 41 42
		f 4 59 -49 -53 -59
		mu 0 4 41 15 36 42
		f 4 -58 60 61 62
		mu 0 4 41 13 43 46
		f 4 63 64 65 -62
		mu 0 4 43 4 44 46
		f 4 66 67 68 -66
		mu 0 4 44 14 45 46
		f 4 69 -60 -63 -69
		mu 0 4 45 15 41 46
		f 4 -68 70 71 72
		mu 0 4 45 14 47 48
		f 4 73 -36 74 -72
		mu 0 4 47 6 32 48
		f 4 -33 -41 75 -75
		mu 0 4 32 9 37 48
		f 4 -50 -70 -73 -76
		mu 0 4 37 15 45 48
		f 4 76 -67 77 78
		mu 0 4 51 14 44 52
		f 4 -65 79 80 -78
		mu 0 4 44 4 49 52
		f 4 81 82 83 -81
		mu 0 4 49 16 50 52
		f 4 84 85 -79 -84
		mu 0 4 50 18 51 52
		f 4 -83 86 87 88
		mu 0 4 50 16 53 56
		f 4 89 90 91 -88
		mu 0 4 53 2 54 56
		f 4 92 93 94 -92
		mu 0 4 54 17 55 56
		f 4 95 -85 -89 -95
		mu 0 4 55 18 50 56
		f 4 -94 96 97 98
		mu 0 4 55 17 57 59
		f 4 99 -5 100 -98
		mu 0 4 57 5 19 59
		f 4 -2 101 102 -101
		mu 0 4 19 10 58 59
		f 4 103 -96 -99 -103
		mu 0 4 58 18 55 59
		f 4 -102 -39 104 105
		mu 0 4 58 10 33 60
		f 4 -37 -74 106 -105
		mu 0 4 33 6 47 60
		f 4 -71 -77 107 -107
		mu 0 4 47 14 51 60
		f 4 -86 -104 -106 -108
		mu 0 4 51 18 58 60;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "r_geo_scale_group" -p "geo_group";
	rename -uid "D06D3439-4FF8-C818-C1F2-70A41E4CB35A";
createNode transform -n "r_geo_group" -p "r_geo_scale_group";
	rename -uid "0080BFF5-4ADA-987B-4010-92A122C8C591";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "r_glass" -p "r_geo_group";
	rename -uid "C638ABF7-4024-8979-F618-669706613010";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -1.2417994799118759e-07 1.8623471265133418e-07 0.0078996763500006617 ;
	setAttr ".sp" -type "double3" -1.2417994799118759e-07 1.8623471265133418e-07 0.0078996763500006617 ;
createNode mesh -n "r_glassShape" -p "r_glass";
	rename -uid "DE0347E3-4E21-87BB-F504-A7A658BF456F";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000005960464478 0.43934881687164307 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "r_glassShapeOrig1" -p "r_glass";
	rename -uid "4DD24A7F-4CFC-C619-D4A4-A5BCE6107DBA";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 350 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0.1 0.050000001 0.1 0.1 0.1
		 0.15000001 0.1 0.2 0.1 0.25 0.1 0.30000001 0.1 0.35000002 0.1 0.40000004 0.1 0.45000005
		 0.1 0.50000006 0.1 0.55000007 0.1 0.60000008 0.1 0.6500001 0.1 0.70000011 0.1 0.75000012
		 0.1 0.80000013 0.1 0.85000014 0.1 0.90000015 0.1 0.95000017 0.1 1.000000119209 0.1
		 0 0.2 0.050000001 0.2 0.1 0.2 0.15000001 0.2 0.2 0.2 0.25 0.2 0.30000001 0.2 0.35000002
		 0.2 0.40000004 0.2 0.45000005 0.2 0.50000006 0.2 0.55000007 0.2 0.60000008 0.2 0.6500001
		 0.2 0.70000011 0.2 0.75000012 0.2 0.80000013 0.2 0.85000014 0.2 0.90000015 0.2 0.95000017
		 0.2 1.000000119209 0.2 0 0.30000001 0.050000001 0.30000001 0.1 0.30000001 0.15000001
		 0.30000001 0.2 0.30000001 0.25 0.30000001 0.30000001 0.30000001 0.35000002 0.30000001
		 0.40000004 0.30000001 0.45000005 0.30000001 0.50000006 0.30000001 0.55000007 0.30000001
		 0.60000008 0.30000001 0.6500001 0.30000001 0.70000011 0.30000001 0.75000012 0.30000001
		 0.80000013 0.30000001 0.85000014 0.30000001 0.90000015 0.30000001 0.95000017 0.30000001
		 1.000000119209 0.30000001 0 0.40000004 0.050000001 0.40000004 0.1 0.40000004 0.15000001
		 0.40000004 0.2 0.40000004 0.25 0.40000004 0.30000001 0.40000004 0.35000002 0.40000004
		 0.40000004 0.40000004 0.45000005 0.40000004 0.50000006 0.40000004 0.55000007 0.40000004
		 0.60000008 0.40000004 0.6500001 0.40000004 0.70000011 0.40000004 0.75000012 0.40000004
		 0.80000013 0.40000004 0.85000014 0.40000004 0.90000015 0.40000004 0.95000017 0.40000004
		 1.000000119209 0.40000004 0 0.50000006 0.050000001 0.50000006 0.1 0.50000006 0.15000001
		 0.50000006 0.2 0.50000006 0.25 0.50000006 0.30000001 0.50000006 0.35000002 0.50000006
		 0.40000004 0.50000006 0.45000005 0.50000006 0.50000006 0.50000006 0.55000007 0.50000006
		 0.60000008 0.50000006 0.6500001 0.50000006 0.70000011 0.50000006 0.75000012 0.50000006
		 0.80000013 0.50000006 0.85000014 0.50000006 0.90000015 0.50000006 0.95000017 0.50000006
		 1.000000119209 0.50000006 0 0.60000008 0.050000001 0.60000008 0.1 0.60000008 0.15000001
		 0.60000008 0.2 0.60000008 0.25 0.60000008 0.30000001 0.60000008 0.35000002 0.60000008
		 0.40000004 0.60000008 0.45000005 0.60000008 0.50000006 0.60000008 0.55000007 0.60000008
		 0.60000008 0.60000008 0.6500001 0.60000008 0.70000011 0.60000008 0.75000012 0.60000008
		 0.80000013 0.60000008 0.85000014 0.60000008 0.90000015 0.60000008 0.95000017 0.60000008
		 1.000000119209 0.60000008 0 0.70000011 0.050000001 0.70000011 0.1 0.70000011 0.15000001
		 0.70000011 0.2 0.70000011 0.25 0.70000011 0.30000001 0.70000011 0.35000002 0.70000011
		 0.40000004 0.70000011 0.45000005 0.70000011 0.50000006 0.70000011 0.55000007 0.70000011
		 0.60000008 0.70000011 0.6500001 0.70000011 0.70000011 0.70000011 0.75000012 0.70000011
		 0.80000013 0.70000011 0.85000014 0.70000011 0.90000015 0.70000011 0.95000017 0.70000011
		 1.000000119209 0.70000011 0 0.80000013 0.050000001 0.80000013 0.1 0.80000013 0.15000001
		 0.80000013 0.2 0.80000013 0.25 0.80000013 0.30000001 0.80000013 0.35000002 0.80000013
		 0.40000004 0.80000013 0.45000005 0.80000013 0.50000006 0.80000013 0.55000007 0.80000013
		 0.60000008 0.80000013 0.6500001 0.80000013 0.70000011 0.80000013 0.75000012 0.80000013
		 0.80000013 0.80000013 0.85000014 0.80000013 0.90000015 0.80000013 0.95000017 0.80000013
		 1.000000119209 0.80000013 0.025 0 0.075000003 0 0.125 0 0.17500001 0 0.22500001 0
		 0.27500001 0 0.32500002 0 0.375 0 0.42500001 0 0.47500002 0 0.52499998 0 0.57499999
		 0 0.625 0 0.67500001 0 0.72499996 0 0.77499998 0 0.82499999 0 0.875 0 0.92500001
		 0 0.97499996 0 0.15000001 0.88590831 0.10000001 0.88590831 0.050000004 0.88590831
		 1.000000119209 0.88590831 0 0.88590831 0.95000017 0.88590831 0.90000021 0.88590831
		 0.85000014 0.88590831 0.80000013 0.88590831 0.75000012 0.88590831 0.70000005 0.88590831
		 0.6500001 0.88590831 0.60000008 0.88590831 0.55000007 0.88590831 0.50000006 0.88590831
		 0.45000005 0.88590831 0.40000004 0.88590831 0.35000002 0.88590831 0.30000001 0.88590831
		 0.25 0.88590831 0.20000002 0.88590831 0 0 0.25 0 0.25 0.052631378 0 0.052631378 0.25
		 0.10526276 0 0.10526276 0.25 0.15789509 0 0.15789509 0.25 0.21052647 0 0.21052647
		 0.25 0.26315784 0 0.26315784 0.25 0.31578922 0 0.31578922 0.25 0.3684206 0 0.3684206
		 0.25 0.42105293 0 0.42105293 0.25 0.47368431 0 0.47368431 0.25 0.52631569 0 0.52631569
		 0.25 0.57894707 0 0.57894707 0.25 0.63157845 0 0.63157845 0.25 0.68421078 0 0.68421078
		 0.25 0.73684216 0 0.73684216 0.25 0.78947353 0 0.78947353 0.25 0.84210491 0 0.84210491
		 0.25 0.89473724 0 0.89473724 0.25 0.94736862 0 0.94736862 0.25 1 0 1 0.5 0;
	setAttr ".uvst[0].uvsp[250:349]" 0.5 0.052631378 0.5 0.10526276 0.5 0.15789509
		 0.5 0.21052647 0.5 0.26315784 0.5 0.31578922 0.5 0.3684206 0.5 0.42105293 0.5 0.47368431
		 0.5 0.52631569 0.5 0.57894707 0.5 0.63157845 0.5 0.68421078 0.5 0.73684216 0.5 0.78947353
		 0.5 0.84210491 0.5 0.89473724 0.5 0.94736862 0.5 1 0.75 0 0.75 0.052631378 0.75 0.10526276
		 0.75 0.15789509 0.75 0.21052647 0.75 0.26315784 0.75 0.31578922 0.75 0.3684206 0.75
		 0.42105293 0.75 0.47368431 0.75 0.52631569 0.75 0.57894707 0.75 0.63157845 0.75 0.68421078
		 0.75 0.73684216 0.75 0.78947353 0.75 0.84210491 0.75 0.89473724 0.75 0.94736862 0.75
		 1 0.91666603 0 0.91666603 0.052631378 0.91666603 0.10526276 0.91666603 0.15789509
		 0.91666603 0.21052647 0.91666603 0.26315784 0.91666603 0.31578922 0.91666603 0.3684206
		 0.91666603 0.42105293 0.91666603 0.47368431 0.91666603 0.52631569 0.91666603 0.57894707
		 0.91666603 0.63157845 0.91666603 0.68421078 0.91666603 0.73684216 0.91666603 0.78947353
		 0.91666603 0.84210491 0.91666603 0.89473724 0.91666603 0.94736862 0.91666603 1 1
		 0 1 0.052631378 1 0.10526276 1 0.15789509 1 0.21052647 1 0.26315784 1 0.31578922
		 1 0.3684206 1 0.42105293 1 0.47368431 1 0.52631569 1 0.57894707 1 0.63157845 1 0.68421078
		 1 0.73684216 1 0.78947353 1 0.84210491 1 0.89473724 1 0.94736862 1 1 0.40000004 0.87869763
		 0.35000002 0.87869763 0.30000001 0.87869763 0.25 0.87869763 0.20000002 0.87869763
		 0.15000001 0.87869763 0.10000001 0.87869763 0.050000004 0.87869763 1.000000119209
		 0.87869763 0 0.87869763 0.95000017 0.87869763 0.90000021 0.87869763 0.85000014 0.87869763
		 0.80000013 0.87869763 0.75000012 0.87869763 0.70000005 0.87869763 0.6500001 0.87869763
		 0.60000008 0.87869763 0.55000007 0.87869763 0.50000006 0.87869763 0.45000005 0.87869763;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 301 ".vt";
	setAttr ".vt[0:165]"  0.3025842 0.098296933 -0.97923034 0.25739342 0.18697196 -0.97923034
		 0.18700725 0.25734484 -0.9792304 0.098315515 0.30252689 -0.9792304 7.5955292e-10 0.31809565 -0.9792304
		 -0.098315515 0.30252689 -0.9792304 -0.1870072 0.25734457 -0.9792304 -0.2573933 0.18697171 -0.9792304
		 -0.3025842 0.098296933 -0.97923034 -0.31815559 -1.1391112e-09 -0.97923034 -0.3025842 -0.098296933 -0.9792304
		 -0.25739327 -0.18697184 -0.9792304 -0.18700717 -0.2573446 -0.9792304 -0.098315492 -0.30252701 -0.9792304
		 -8.7222221e-09 -0.31809542 -0.97923034 0.098315462 -0.30252701 -0.9792304 0.18700713 -0.2573446 -0.97923034
		 0.25739324 -0.18697184 -0.97923034 0.3025842 -0.098296933 -0.97923034 0.31815553 -1.1391112e-09 -0.97923034
		 0.57528871 0.18688725 -0.83316594 0.48937011 0.35548073 -0.83316588 0.35554799 0.48927754 -0.83316588
		 0.18692262 0.57517999 -0.83316594 7.5955292e-10 0.60478014 -0.83316594 -0.18692262 0.57517976 -0.83316594
		 -0.35554796 0.48927727 -0.83316588 -0.48936966 0.35548073 -0.83316588 -0.57528853 0.18688725 -0.83316594
		 -0.60489458 -1.1391112e-09 -0.83316588 -0.57528853 -0.18688725 -0.83316582 -0.48936963 -0.35548073 -0.83316588
		 -0.35554796 -0.48927703 -0.83316588 -0.18692255 -0.57517964 -0.83316594 -1.7267691e-08 -0.60478014 -0.83316594
		 0.18692252 -0.57517964 -0.83316594 0.35554796 -0.48927703 -0.83316594 0.48936951 -0.35548073 -0.83316588
		 0.57528836 -0.18688713 -0.83316594 0.60489398 -1.1391112e-09 -0.83316588 0.7916227 0.25716516 -0.60596228
		 0.67339486 0.48915747 -0.60596228 0.48925 0.67326748 -0.60596228 0.2572138 0.79147297 -0.60596228
		 7.5955292e-10 0.83220392 -0.60596216 -0.2572138 0.79147297 -0.60596228 -0.48924959 0.67326748 -0.60596228
		 -0.67339486 0.48915711 -0.60596228 -0.79162246 0.25716504 -0.60596228 -0.83236104 -1.1391112e-09 -0.60596228
		 -0.79162246 -0.2571651 -0.60596216 -0.6733948 -0.48915705 -0.60596216 -0.48924953 -0.67326689 -0.60596216
		 -0.25721374 -0.79147267 -0.60596216 -2.4046736e-08 -0.83220369 -0.60596234 0.25721365 -0.79147267 -0.60596216
		 0.48924941 -0.67326683 -0.60596216 0.67339408 -0.48915696 -0.60596216 0.79162228 -0.25716504 -0.60596216
		 0.83236086 -1.1391112e-09 -0.60596228 0.93077588 0.30237031 -0.31967938 0.79176521 0.57514232 -0.31967938
		 0.57525116 0.79161543 -0.31967944 0.30242753 0.93059981 -0.31967944 7.5955292e-10 0.97849101 -0.31967944
		 -0.30242753 0.93059969 -0.31967944 -0.57525104 0.79161531 -0.31967944 -0.79176503 0.5751422 -0.31967938
		 -0.93077552 0.30237031 -0.31967938 -0.97867531 -1.1391112e-09 -0.31967938 -0.93077552 -0.30237034 -0.31967938
		 -0.79176497 -0.57514209 -0.31967944 -0.57525086 -0.79161513 -0.31967944 -0.30242753 -0.93059945 -0.31967944
		 -2.8407237e-08 -0.97849017 -0.31967944 0.3024272 -0.93059939 -0.31967929 0.5752508 -0.79161513 -0.31967944
		 0.7917648 -0.57514203 -0.31967944 0.93077528 -0.30237034 -0.31967938 0.97867507 -1.1391112e-09 -0.31967938
		 0.98292118 0.31930989 -0.0022268149 0.83612233 0.60736376 -0.0022268149 0.60747856 0.8359642 -0.0022268149
		 0.31937021 0.98273528 -0.0022268149 1.2367991e-09 1.033308387 -0.0022268149 -0.31937021 0.98273522 -0.0022268149
		 -0.60747862 0.83596402 -0.0022268149 -0.83612198 0.60736376 -0.0022268149 -0.98292029 0.31930977 -0.0022268149
		 -1.033503532 -1.8548452e-09 -0.0022268149 -0.98292029 -0.31930977 -0.0022268149 -0.83612192 -0.60736376 -0.0022268149
		 -0.60747862 -0.83596379 -0.0022268149 -0.31937012 -0.98273438 -0.0022268149 -2.9564003e-08 -1.033308029 -0.0022268149
		 0.31937003 -0.98273432 -0.0022268149 0.6074779 -0.83596373 -0.0022268149 0.83612174 -0.60736376 -0.0022268149
		 0.98292005 -0.31930971 -0.0022268149 1.033503294 -1.8548452e-09 -0.0022268149 0.93594742 0.30405033 0.31544849
		 0.79616439 0.57833791 0.31544855 0.57844728 0.79601389 0.31544855 0.30410784 0.93577033 0.31544855
		 1.2733645e-09 0.98392773 0.3154484 -0.30410784 0.93577033 0.3154484 -0.5784471 0.79601377 0.31544855
		 -0.79616421 0.57833773 0.31544855 -0.93594712 0.30405033 0.31544849 -0.98411292 -3.0655376e-09 0.31544849
		 -0.93594712 -0.3040503 0.31544849 -0.79616416 -0.57833767 0.31544849 -0.57844698 -0.79601359 0.31544855
		 -0.30410784 -0.93576998 0.31544855 -2.8055481e-08 -0.98392677 0.31544855 0.30410749 -0.93576986 0.31544855
		 0.57844687 -0.79601347 0.31544855 0.79616392 -0.57833767 0.31544849 0.93594688 -0.3040503 0.31544849
		 0.98411268 -3.0655376e-09 0.31544849 0.78488785 0.25497732 0.6103158 0.66766584 0.4849959 0.6103158
		 0.48508763 0.66753966 0.61031574 0.25502551 0.78473932 0.61031574 -3.478654e-10 0.82512379 0.61031574
		 -0.25502554 0.78473932 0.61031586 -0.48508728 0.66753966 0.61031574 -0.6676659 0.48499551 0.6103158
		 -0.78488767 0.25497726 0.61031574 -0.82527959 -3.1905922e-11 0.61031574 -0.78488767 -0.25497717 0.61031574
		 -0.66766578 -0.48499551 0.61031574 -0.48508719 -0.66753894 0.61031574 -0.25502545 -0.78473908 0.61031574
		 -2.4943109e-08 -0.82512361 0.61031574 0.25502533 -0.78473908 0.61031574 0.48508707 -0.66753894 0.61031574
		 0.66766512 -0.48499539 0.61031574 0.78488743 -0.25497717 0.61031574 0.82527941 -3.1905922e-11 0.61031574
		 0.57874399 0.18800974 0.8144024 0.49230936 0.3576158 0.8144024 0.35768345 0.49221623 0.81440234
		 0.18804532 0.57863456 0.8144024 7.5955292e-10 0.60841262 0.8144024 -0.18804532 0.57863456 0.8144024
		 -0.35768342 0.49221584 0.8144024 -0.49230886 0.3576158 0.81440234 -0.57874376 0.18800974 0.8144024
		 -0.60852766 -1.1391112e-09 0.8144024 -0.57874376 -0.18800974 0.8144024 -0.49230883 -0.3576158 0.8144024
		 -0.35768342 -0.49221572 0.8144024 -0.18804525 -0.57863444 0.8144024 -1.7375969e-08 -0.60841262 0.8144024
		 0.18804519 -0.57863444 0.8144024 0.35768342 -0.49221572 0.8144024 0.49230874 -0.3576158 0.8144024
		 0.57874364 -0.18800959 0.8144024 0.60852712 -1.1391112e-09 0.8144024 7.5955292e-10 -1.1391112e-09 -1.029621243
		 0.13538525 0.41659421 0.89874673 0.25751805 0.3543762 0.89874679 0.35444319 0.25746933 0.89874679
		 0.41667295 0.13535964 0.89874673 0.43811572 -8.728785e-17 0.89874673;
	setAttr ".vt[166:300]" 0.41667289 -0.13535964 0.89874673 0.35444307 -0.25746933 0.89874673
		 0.25751793 -0.35437608 0.89874673 0.13538522 -0.41659415 0.89874673 -2.986573e-09 -0.43803287 0.89874673
		 -0.13538523 -0.41659415 0.89874673 -0.25751799 -0.35437608 0.89874673 -0.35444313 -0.25746933 0.89874673
		 -0.41667295 -0.13535964 0.89874673 -0.43811578 -9.1274735e-17 0.89874673 -0.41667295 0.13535957 0.89874673
		 -0.35444313 0.25746936 0.89874673 -0.25751799 0.35437614 0.89874673 -0.13538525 0.41659421 0.89874673
		 -1.1426574e-08 0.43803298 0.89874673 0.34559804 0.11227038 0.95478028 0.36338329 -1.7342389e-16 0.95478028
		 0.34559804 -0.11227038 0.95478028 0.29398325 -0.21355094 0.95478028 0.21359132 -0.29392767 0.95478028
		 0.1122916 -0.34553272 0.95478028 -3.1690894e-17 -0.36331457 0.95478028 -0.1122916 -0.34553272 0.95478028
		 -0.21359132 -0.29392767 0.95478028 -0.29398325 -0.21355094 0.95478028 -0.34559804 -0.11227038 0.95478028
		 -0.36338329 -1.4961879e-16 0.95478028 -0.34559804 0.11227038 0.95478028 -0.29398325 0.21355094 0.95478028
		 -0.21359132 0.29392767 0.95478028 -0.1122916 0.34553272 0.95478028 -1.1369768e-16 0.36331457 0.95478028
		 0.1122916 0.34553272 0.95478028 0.21359132 0.29392767 0.95478028 0.29398325 0.21355094 0.95478028
		 0.21790522 0.070788309 1.013528943 0.22911911 -1.4601695e-16 1.013528943 0.21790522 -0.070788309 1.013528943
		 0.18536125 -0.13464737 1.013528943 0.13467282 -0.1853262 1.013528943 0.070801698 -0.21786404 1.013528943
		 -3.8471098e-17 -0.2290758 1.013528943 -0.070801698 -0.21786404 1.013528943 -0.13467282 -0.1853262 1.013528943
		 -0.18536125 -0.13464737 1.013528943 -0.21790522 -0.070788309 1.013528943 -0.22911911 -9.4035513e-17 1.013528943
		 -0.21790522 0.070788309 1.013528943 -0.18536125 0.13464737 1.013528943 -0.13467282 0.1853262 1.013528943
		 -0.070801698 0.21786404 1.013528943 -5.3198791e-17 0.2290758 1.013528943 0.070801698 0.21786404 1.013528943
		 0.13467282 0.1853262 1.013528943 0.18536125 0.13464737 1.013528943 0.1099065 0.035704035 1.032290459
		 0.11556254 -1.2785927e-16 1.032290459 0.1099065 -0.035704035 1.032290459 0.093492053 -0.067913108 1.032290459
		 0.067925952 -0.093474381 1.032290459 0.035710786 -0.10988572 1.032290459 -4.6737845e-17 -0.1155407 1.032290459
		 -0.035710786 -0.10988572 1.032290459 -0.067925952 -0.093474381 1.032290459 -0.093492053 -0.067913108 1.032290459
		 -0.1099065 -0.035704035 1.032290459 -0.11556254 -4.6983544e-17 1.032290459 -0.1099065 0.035704035 1.032290459
		 -0.093492053 0.067913108 1.032290459 -0.067925952 0.093474381 1.032290459 -0.035710786 0.10988572 1.032290459
		 5.0161049e-19 0.1155407 1.032290459 0.035710786 0.10988572 1.032290459 0.067925952 0.093474381 1.032290459
		 0.093492053 0.067913108 1.032290459 0.036605377 0.01189156 1.039113045 0.03848917 -1.142863e-16 1.039113045
		 0.036605377 -0.01189156 1.039113045 0.031138394 -0.022619089 1.039113045 0.022623368 -0.031132506 1.039113045
		 0.011893808 -0.036598455 1.039113045 -5.1718952e-17 -0.038481895 1.039113045 -0.011893808 -0.036598455 1.039113045
		 -0.022623368 -0.031132506 1.039113045 -0.031138394 -0.022619089 1.039113045 -0.036605377 -0.01189156 1.039113045
		 -0.03848917 -1.5058606e-17 1.039113045 -0.036605377 0.01189156 1.039113045 -0.031138394 0.022619089 1.039113045
		 -0.022623368 0.031132506 1.039113045 -0.011893808 0.036598455 1.039113045 3.6319549e-17 0.038481895 1.039113045
		 0.011893808 0.036598455 1.039113045 0.022623368 0.031132506 1.039113045 0.031138394 0.022619089 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 1.0510673e-16 -7.5838321e-17 1.039113045 1.0510673e-16 -7.5838321e-17 1.039113045
		 -0.43261096 0.14053717 0.8966589 -0.36800081 0.26731774 0.8966589 -0.26736823 0.36793125 0.8966589
		 -0.14056382 0.43252921 0.8966589 -9.7719672e-09 0.45478806 0.8966589 0.14056382 0.43252921 0.8966589
		 0.26736829 0.36793134 0.89665896 0.36800089 0.26731771 0.89665896 0.43261096 0.14053725 0.8966589
		 0.45487392 -1.1391114e-09 0.8966589 0.43261087 -0.14053723 0.8966589 0.36800072 -0.26731771 0.8966589
		 0.26736817 -0.36793119 0.8966589 0.14056379 -0.43252912 0.8966589 -3.5152725e-09 -0.45478797 0.8966589
		 -0.1405638 -0.43252912 0.8966589 -0.26736823 -0.36793119 0.8966589 -0.36800081 -0.26731771 0.8966589
		 -0.43261096 -0.14053725 0.8966589 -0.45487404 -1.1391114e-09 0.8966589;
	setAttr -s 600 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 4 1 4 5 1 5 6 1 6 7 1 7 8 1 8 9 1
		 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 0 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 30 31 1
		 31 32 1 32 33 1 33 34 1 34 35 1 35 36 1 36 37 1 37 38 1 38 39 1 39 20 1 40 41 1 41 42 1
		 42 43 1 43 44 1 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 49 50 1 50 51 1 51 52 1 52 53 1
		 53 54 1 54 55 1 55 56 1 56 57 1 57 58 1 58 59 1 59 40 1 60 61 1 61 62 1 62 63 1 63 64 1
		 64 65 1 65 66 1 66 67 1 67 68 1 68 69 1 69 70 1 70 71 1 71 72 1 72 73 1 73 74 1 74 75 1
		 75 76 1 76 77 1 77 78 1 78 79 1 79 60 1 80 81 1 81 82 1 82 83 1 83 84 1 84 85 1 85 86 1
		 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1 94 95 1 95 96 1 96 97 1
		 97 98 1 98 99 1 99 80 1 100 101 1 101 102 1 102 103 1 103 104 1 104 105 1 105 106 1
		 106 107 1 107 108 1 108 109 1 109 110 1 110 111 1 111 112 1 112 113 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 100 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 127 128 1 128 129 1 129 130 1 130 131 1 131 132 1 132 133 1
		 133 134 1 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 120 1 140 141 1 141 142 1
		 142 143 1 143 144 1 144 145 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1
		 151 152 1 152 153 1 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 159 140 1
		 0 20 1 1 21 1 2 22 1 3 23 1 4 24 1 5 25 1;
	setAttr ".ed[166:331]" 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1
		 13 33 1 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 20 40 1 21 41 1 22 42 1 23 43 1
		 24 44 1 25 45 1 26 46 1 27 47 1 28 48 1 29 49 1 30 50 1 31 51 1 32 52 1 33 53 1 34 54 1
		 35 55 1 36 56 1 37 57 1 38 58 1 39 59 1 40 60 1 41 61 1 42 62 1 43 63 1 44 64 1 45 65 1
		 46 66 1 47 67 1 48 68 1 49 69 1 50 70 1 51 71 1 52 72 1 53 73 1 54 74 1 55 75 1 56 76 1
		 57 77 1 58 78 1 59 79 1 60 80 1 61 81 1 62 82 1 63 83 1 64 84 1 65 85 1 66 86 1 67 87 1
		 68 88 1 69 89 1 70 90 1 71 91 1 72 92 1 73 93 1 74 94 1 75 95 1 76 96 1 77 97 1 78 98 1
		 79 99 1 80 100 1 81 101 1 82 102 1 83 103 1 84 104 1 85 105 1 86 106 1 87 107 1 88 108 1
		 89 109 1 90 110 1 91 111 1 92 112 1 93 113 1 94 114 1 95 115 1 96 116 1 97 117 1
		 98 118 1 99 119 1 100 120 1 101 121 1 102 122 1 103 123 1 104 124 1 105 125 1 106 126 1
		 107 127 1 108 128 1 109 129 1 110 130 1 111 131 1 112 132 1 113 133 1 114 134 1 115 135 1
		 116 136 1 117 137 1 118 138 1 119 139 1 120 140 1 121 141 1 122 142 1 123 143 1 124 144 1
		 125 145 1 126 146 1 127 147 1 128 148 1 129 149 1 130 150 1 131 151 1 132 152 1 133 153 1
		 134 154 1 135 155 1 136 156 1 137 157 1 138 158 1 139 159 1 140 289 1 141 288 1 142 287 1
		 143 286 1 144 285 1 145 284 1 146 283 1 147 282 1 148 281 1 149 300 1 150 299 1 151 298 1
		 152 297 1 153 296 1 154 295 1 155 294 1 156 293 1 157 292 1 158 291 1 159 290 1 160 0 1
		 160 1 1 160 2 1 160 3 1 160 4 1 160 5 1 160 6 1 160 7 1 160 8 1 160 9 1 160 10 1
		 160 11 1;
	setAttr ".ed[332:497]" 160 12 1 160 13 1 160 14 1 160 15 1 160 16 1 160 17 1
		 160 18 1 160 19 1 161 162 0 162 163 0 163 164 0 164 165 0 165 166 0 166 167 0 167 168 0
		 168 169 0 169 170 0 170 171 0 171 172 0 172 173 0 173 174 0 174 175 0 175 176 0 176 177 0
		 177 178 0 178 179 0 179 180 0 180 161 0 164 181 1 181 182 1 182 165 1 182 183 1 183 166 1
		 183 184 1 184 167 1 184 185 1 185 168 1 185 186 1 186 169 1 186 187 1 187 170 1 187 188 1
		 188 171 1 188 189 1 189 172 1 189 190 1 190 173 1 190 191 1 191 174 1 191 192 1 192 175 1
		 192 193 1 193 176 1 193 194 1 194 177 1 194 195 1 195 178 1 195 196 1 196 179 1 196 197 1
		 197 180 1 197 198 1 198 161 1 198 199 1 199 162 1 199 200 1 200 163 1 200 181 1 181 201 1
		 201 202 1 202 182 1 202 203 1 203 183 1 203 204 1 204 184 1 204 205 1 205 185 1 205 206 1
		 206 186 1 206 207 1 207 187 1 207 208 1 208 188 1 208 209 1 209 189 1 209 210 1 210 190 1
		 210 211 1 211 191 1 211 212 1 212 192 1 212 213 1 213 193 1 213 214 1 214 194 1 214 215 1
		 215 195 1 215 216 1 216 196 1 216 217 1 217 197 1 217 218 1 218 198 1 218 219 1 219 199 1
		 219 220 1 220 200 1 220 201 1 201 221 1 221 222 1 222 202 1 222 223 1 223 203 1 223 224 1
		 224 204 1 224 225 1 225 205 1 225 226 1 226 206 1 226 227 1 227 207 1 227 228 1 228 208 1
		 228 229 1 229 209 1 229 230 1 230 210 1 230 231 1 231 211 1 231 232 1 232 212 1 232 233 1
		 233 213 1 233 234 1 234 214 1 234 235 1 235 215 1 235 236 1 236 216 1 236 237 1 237 217 1
		 237 238 1 238 218 1 238 239 1 239 219 1 239 240 1 240 220 1 240 221 1 221 241 1 241 242 1
		 242 222 1 242 243 1 243 223 1 243 244 1 244 224 1 244 245 1 245 225 1 245 246 1 246 226 1
		 246 247 1 247 227 1 247 248 1 248 228 1 248 249 1 249 229 1 249 250 1;
	setAttr ".ed[498:599]" 250 230 1 250 251 1 251 231 1 251 252 1 252 232 1 252 253 1
		 253 233 1 253 254 1 254 234 1 254 255 1 255 235 1 255 256 1 256 236 1 256 257 1 257 237 1
		 257 258 1 258 238 1 258 259 1 259 239 1 259 260 1 260 240 1 260 241 1 241 261 1 261 262 0
		 262 242 1 262 263 0 263 243 1 263 264 0 264 244 1 264 265 0 265 245 1 265 266 0 266 246 1
		 266 267 0 267 247 1 267 268 0 268 248 1 268 269 0 269 249 1 269 270 0 270 250 1 270 271 0
		 271 251 1 271 272 0 272 252 1 272 273 0 273 253 1 273 274 0 274 254 1 274 275 0 275 255 1
		 275 276 0 276 256 1 276 277 0 277 257 1 277 278 0 278 258 1 278 279 0 279 259 1 279 280 0
		 280 260 1 280 261 0 281 176 1 282 177 1 281 282 1 283 178 1 282 283 1 284 179 1 283 284 1
		 285 180 1 284 285 1 286 161 1 285 286 1 287 162 1 286 287 1 288 163 1 287 288 1 289 164 1
		 288 289 1 290 165 1 289 290 1 291 166 1 290 291 1 292 167 1 291 292 1 293 168 1 292 293 1
		 294 169 1 293 294 1 295 170 1 294 295 1 296 171 1 295 296 1 297 172 1 296 297 1 298 173 1
		 297 298 1 299 174 1 298 299 1 300 175 1 299 300 1 300 281 1;
	setAttr -s 300 -ch 1180 ".fc[0:299]" -type "polyFaces" 
		f 3 -1 -321 321
		mu 0 3 1 0 168
		f 3 -2 -322 322
		mu 0 3 2 1 169
		f 3 -3 -323 323
		mu 0 3 3 2 170
		f 3 -4 -324 324
		mu 0 3 4 3 171
		f 3 -5 -325 325
		mu 0 3 5 4 172
		f 3 -6 -326 326
		mu 0 3 6 5 173
		f 3 -7 -327 327
		mu 0 3 7 6 174
		f 3 -8 -328 328
		mu 0 3 8 7 175
		f 3 -9 -329 329
		mu 0 3 9 8 176
		f 3 -10 -330 330
		mu 0 3 10 9 177
		f 3 -11 -331 331
		mu 0 3 11 10 178
		f 3 -12 -332 332
		mu 0 3 12 11 179
		f 3 -13 -333 333
		mu 0 3 13 12 180
		f 3 -14 -334 334
		mu 0 3 14 13 181
		f 3 -15 -335 335
		mu 0 3 15 14 182
		f 3 -16 -336 336
		mu 0 3 16 15 183
		f 3 -17 -337 337
		mu 0 3 17 16 184
		f 3 -18 -338 338
		mu 0 3 18 17 185
		f 3 -19 -339 339
		mu 0 3 19 18 186
		f 3 -20 -340 320
		mu 0 3 20 19 187
		f 4 161 -21 -161 0
		mu 0 4 1 22 21 0
		f 4 162 -22 -162 1
		mu 0 4 2 23 22 1
		f 4 163 -23 -163 2
		mu 0 4 3 24 23 2
		f 4 164 -24 -164 3
		mu 0 4 4 25 24 3
		f 4 165 -25 -165 4
		mu 0 4 5 26 25 4
		f 4 166 -26 -166 5
		mu 0 4 6 27 26 5
		f 4 167 -27 -167 6
		mu 0 4 7 28 27 6
		f 4 168 -28 -168 7
		mu 0 4 8 29 28 7
		f 4 169 -29 -169 8
		mu 0 4 9 30 29 8
		f 4 170 -30 -170 9
		mu 0 4 10 31 30 9
		f 4 171 -31 -171 10
		mu 0 4 11 32 31 10
		f 4 172 -32 -172 11
		mu 0 4 12 33 32 11
		f 4 173 -33 -173 12
		mu 0 4 13 34 33 12
		f 4 174 -34 -174 13
		mu 0 4 14 35 34 13
		f 4 175 -35 -175 14
		mu 0 4 15 36 35 14
		f 4 176 -36 -176 15
		mu 0 4 16 37 36 15
		f 4 177 -37 -177 16
		mu 0 4 17 38 37 16
		f 4 178 -38 -178 17
		mu 0 4 18 39 38 17
		f 4 179 -39 -179 18
		mu 0 4 19 40 39 18
		f 4 160 -40 -180 19
		mu 0 4 20 41 40 19
		f 4 181 -41 -181 20
		mu 0 4 22 43 42 21
		f 4 182 -42 -182 21
		mu 0 4 23 44 43 22
		f 4 183 -43 -183 22
		mu 0 4 24 45 44 23
		f 4 184 -44 -184 23
		mu 0 4 25 46 45 24
		f 4 185 -45 -185 24
		mu 0 4 26 47 46 25
		f 4 186 -46 -186 25
		mu 0 4 27 48 47 26
		f 4 187 -47 -187 26
		mu 0 4 28 49 48 27
		f 4 188 -48 -188 27
		mu 0 4 29 50 49 28
		f 4 189 -49 -189 28
		mu 0 4 30 51 50 29
		f 4 190 -50 -190 29
		mu 0 4 31 52 51 30
		f 4 191 -51 -191 30
		mu 0 4 32 53 52 31
		f 4 192 -52 -192 31
		mu 0 4 33 54 53 32
		f 4 193 -53 -193 32
		mu 0 4 34 55 54 33
		f 4 194 -54 -194 33
		mu 0 4 35 56 55 34
		f 4 195 -55 -195 34
		mu 0 4 36 57 56 35
		f 4 196 -56 -196 35
		mu 0 4 37 58 57 36
		f 4 197 -57 -197 36
		mu 0 4 38 59 58 37
		f 4 198 -58 -198 37
		mu 0 4 39 60 59 38
		f 4 199 -59 -199 38
		mu 0 4 40 61 60 39
		f 4 180 -60 -200 39
		mu 0 4 41 62 61 40
		f 4 201 -61 -201 40
		mu 0 4 43 64 63 42
		f 4 202 -62 -202 41
		mu 0 4 44 65 64 43
		f 4 203 -63 -203 42
		mu 0 4 45 66 65 44
		f 4 204 -64 -204 43
		mu 0 4 46 67 66 45
		f 4 205 -65 -205 44
		mu 0 4 47 68 67 46
		f 4 206 -66 -206 45
		mu 0 4 48 69 68 47
		f 4 207 -67 -207 46
		mu 0 4 49 70 69 48
		f 4 208 -68 -208 47
		mu 0 4 50 71 70 49
		f 4 209 -69 -209 48
		mu 0 4 51 72 71 50
		f 4 210 -70 -210 49
		mu 0 4 52 73 72 51
		f 4 211 -71 -211 50
		mu 0 4 53 74 73 52
		f 4 212 -72 -212 51
		mu 0 4 54 75 74 53
		f 4 213 -73 -213 52
		mu 0 4 55 76 75 54
		f 4 214 -74 -214 53
		mu 0 4 56 77 76 55
		f 4 215 -75 -215 54
		mu 0 4 57 78 77 56
		f 4 216 -76 -216 55
		mu 0 4 58 79 78 57
		f 4 217 -77 -217 56
		mu 0 4 59 80 79 58
		f 4 218 -78 -218 57
		mu 0 4 60 81 80 59
		f 4 219 -79 -219 58
		mu 0 4 61 82 81 60
		f 4 200 -80 -220 59
		mu 0 4 62 83 82 61
		f 4 221 -81 -221 60
		mu 0 4 64 85 84 63
		f 4 222 -82 -222 61
		mu 0 4 65 86 85 64
		f 4 223 -83 -223 62
		mu 0 4 66 87 86 65
		f 4 224 -84 -224 63
		mu 0 4 67 88 87 66
		f 4 225 -85 -225 64
		mu 0 4 68 89 88 67
		f 4 226 -86 -226 65
		mu 0 4 69 90 89 68
		f 4 227 -87 -227 66
		mu 0 4 70 91 90 69
		f 4 228 -88 -228 67
		mu 0 4 71 92 91 70
		f 4 229 -89 -229 68
		mu 0 4 72 93 92 71
		f 4 230 -90 -230 69
		mu 0 4 73 94 93 72
		f 4 231 -91 -231 70
		mu 0 4 74 95 94 73
		f 4 232 -92 -232 71
		mu 0 4 75 96 95 74
		f 4 233 -93 -233 72
		mu 0 4 76 97 96 75
		f 4 234 -94 -234 73
		mu 0 4 77 98 97 76
		f 4 235 -95 -235 74
		mu 0 4 78 99 98 77
		f 4 236 -96 -236 75
		mu 0 4 79 100 99 78
		f 4 237 -97 -237 76
		mu 0 4 80 101 100 79
		f 4 238 -98 -238 77
		mu 0 4 81 102 101 80
		f 4 239 -99 -239 78
		mu 0 4 82 103 102 81
		f 4 220 -100 -240 79
		mu 0 4 83 104 103 82
		f 4 241 -101 -241 80
		mu 0 4 85 106 105 84
		f 4 242 -102 -242 81
		mu 0 4 86 107 106 85
		f 4 243 -103 -243 82
		mu 0 4 87 108 107 86
		f 4 244 -104 -244 83
		mu 0 4 88 109 108 87
		f 4 245 -105 -245 84
		mu 0 4 89 110 109 88
		f 4 246 -106 -246 85
		mu 0 4 90 111 110 89
		f 4 247 -107 -247 86
		mu 0 4 91 112 111 90
		f 4 248 -108 -248 87
		mu 0 4 92 113 112 91
		f 4 249 -109 -249 88
		mu 0 4 93 114 113 92
		f 4 250 -110 -250 89
		mu 0 4 94 115 114 93
		f 4 251 -111 -251 90
		mu 0 4 95 116 115 94
		f 4 252 -112 -252 91
		mu 0 4 96 117 116 95
		f 4 253 -113 -253 92
		mu 0 4 97 118 117 96
		f 4 254 -114 -254 93
		mu 0 4 98 119 118 97
		f 4 255 -115 -255 94
		mu 0 4 99 120 119 98
		f 4 256 -116 -256 95
		mu 0 4 100 121 120 99
		f 4 257 -117 -257 96
		mu 0 4 101 122 121 100
		f 4 258 -118 -258 97
		mu 0 4 102 123 122 101
		f 4 259 -119 -259 98
		mu 0 4 103 124 123 102
		f 4 240 -120 -260 99
		mu 0 4 104 125 124 103
		f 4 261 -121 -261 100
		mu 0 4 106 127 126 105
		f 4 262 -122 -262 101
		mu 0 4 107 128 127 106
		f 4 263 -123 -263 102
		mu 0 4 108 129 128 107
		f 4 264 -124 -264 103
		mu 0 4 109 130 129 108
		f 4 265 -125 -265 104
		mu 0 4 110 131 130 109
		f 4 266 -126 -266 105
		mu 0 4 111 132 131 110
		f 4 267 -127 -267 106
		mu 0 4 112 133 132 111
		f 4 268 -128 -268 107
		mu 0 4 113 134 133 112
		f 4 269 -129 -269 108
		mu 0 4 114 135 134 113
		f 4 270 -130 -270 109
		mu 0 4 115 136 135 114
		f 4 271 -131 -271 110
		mu 0 4 116 137 136 115
		f 4 272 -132 -272 111
		mu 0 4 117 138 137 116
		f 4 273 -133 -273 112
		mu 0 4 118 139 138 117
		f 4 274 -134 -274 113
		mu 0 4 119 140 139 118
		f 4 275 -135 -275 114
		mu 0 4 120 141 140 119
		f 4 276 -136 -276 115
		mu 0 4 121 142 141 120
		f 4 277 -137 -277 116
		mu 0 4 122 143 142 121
		f 4 278 -138 -278 117
		mu 0 4 123 144 143 122
		f 4 279 -139 -279 118
		mu 0 4 124 145 144 123
		f 4 260 -140 -280 119
		mu 0 4 125 146 145 124
		f 4 281 -141 -281 120
		mu 0 4 127 148 147 126
		f 4 282 -142 -282 121
		mu 0 4 128 149 148 127
		f 4 283 -143 -283 122
		mu 0 4 129 150 149 128
		f 4 284 -144 -284 123
		mu 0 4 130 151 150 129
		f 4 285 -145 -285 124
		mu 0 4 131 152 151 130
		f 4 286 -146 -286 125
		mu 0 4 132 153 152 131
		f 4 287 -147 -287 126
		mu 0 4 133 154 153 132
		f 4 288 -148 -288 127
		mu 0 4 134 155 154 133
		f 4 289 -149 -289 128
		mu 0 4 135 156 155 134
		f 4 290 -150 -290 129
		mu 0 4 136 157 156 135
		f 4 291 -151 -291 130
		mu 0 4 137 158 157 136
		f 4 292 -152 -292 131
		mu 0 4 138 159 158 137
		f 4 293 -153 -293 132
		mu 0 4 139 160 159 138
		f 4 294 -154 -294 133
		mu 0 4 140 161 160 139
		f 4 295 -155 -295 134
		mu 0 4 141 162 161 140
		f 4 296 -156 -296 135
		mu 0 4 142 163 162 141
		f 4 297 -157 -297 136
		mu 0 4 143 164 163 142
		f 4 298 -158 -298 137
		mu 0 4 144 165 164 143
		f 4 299 -159 -299 138
		mu 0 4 145 166 165 144
		f 4 280 -160 -300 139
		mu 0 4 146 167 166 145
		f 4 301 576 -301 140
		mu 0 4 148 336 338 147
		f 4 302 574 -302 141
		mu 0 4 149 335 336 148
		f 4 303 572 -303 142
		mu 0 4 150 334 335 149
		f 4 304 570 -304 143
		mu 0 4 151 333 334 150
		f 4 305 568 -305 144
		mu 0 4 152 332 333 151
		f 4 306 566 -306 145
		mu 0 4 153 331 332 152
		f 4 307 564 -307 146
		mu 0 4 154 330 331 153
		f 4 308 562 -308 147
		mu 0 4 155 329 330 154
		f 4 309 599 -309 148
		mu 0 4 156 349 329 155
		f 4 310 598 -310 149
		mu 0 4 157 348 349 156
		f 4 311 596 -311 150
		mu 0 4 158 347 348 157
		f 4 312 594 -312 151
		mu 0 4 159 346 347 158
		f 4 313 592 -313 152
		mu 0 4 160 345 346 159
		f 4 314 590 -314 153
		mu 0 4 161 344 345 160
		f 4 315 588 -315 154
		mu 0 4 162 343 344 161
		f 4 316 586 -316 155
		mu 0 4 163 342 343 162
		f 4 317 584 -317 156
		mu 0 4 164 341 342 163
		f 4 318 582 -318 157
		mu 0 4 165 340 341 164
		f 4 319 580 -319 158
		mu 0 4 166 339 340 165
		f 4 300 578 -320 159
		mu 0 4 167 337 339 166
		f 4 360 361 362 -344
		mu 0 4 209 210 211 212
		f 4 -363 363 364 -345
		mu 0 4 212 211 213 214
		f 4 -365 365 366 -346
		mu 0 4 214 213 215 216
		f 4 -367 367 368 -347
		mu 0 4 216 215 217 218
		f 4 -369 369 370 -348
		mu 0 4 218 217 219 220
		f 4 -371 371 372 -349
		mu 0 4 220 219 221 222
		f 4 -373 373 374 -350
		mu 0 4 222 221 223 224
		f 4 -375 375 376 -351
		mu 0 4 224 223 225 226
		f 4 -377 377 378 -352
		mu 0 4 226 225 227 228
		f 4 -379 379 380 -353
		mu 0 4 228 227 229 230
		f 4 -381 381 382 -354
		mu 0 4 230 229 231 232
		f 4 -383 383 384 -355
		mu 0 4 232 231 233 234
		f 4 -385 385 386 -356
		mu 0 4 234 233 235 236
		f 4 -387 387 388 -357
		mu 0 4 236 235 237 238
		f 4 -389 389 390 -358
		mu 0 4 238 237 239 240
		f 4 -391 391 392 -359
		mu 0 4 240 239 241 242
		f 4 -393 393 394 -360
		mu 0 4 242 241 243 244
		f 4 -395 395 396 -341
		mu 0 4 244 243 245 246
		f 4 -397 397 398 -342
		mu 0 4 246 245 247 248
		f 4 -399 399 -361 -343
		mu 0 4 248 247 210 209
		f 4 400 401 402 -362
		mu 0 4 210 249 250 211
		f 4 -403 403 404 -364
		mu 0 4 211 250 251 213
		f 4 -405 405 406 -366
		mu 0 4 213 251 252 215
		f 4 -407 407 408 -368
		mu 0 4 215 252 253 217
		f 4 -409 409 410 -370
		mu 0 4 217 253 254 219
		f 4 -411 411 412 -372
		mu 0 4 219 254 255 221
		f 4 -413 413 414 -374
		mu 0 4 221 255 256 223
		f 4 -415 415 416 -376
		mu 0 4 223 256 257 225
		f 4 -417 417 418 -378
		mu 0 4 225 257 258 227
		f 4 -419 419 420 -380
		mu 0 4 227 258 259 229
		f 4 -421 421 422 -382
		mu 0 4 229 259 260 231
		f 4 -423 423 424 -384
		mu 0 4 231 260 261 233
		f 4 -425 425 426 -386
		mu 0 4 233 261 262 235
		f 4 -427 427 428 -388
		mu 0 4 235 262 263 237
		f 4 -429 429 430 -390
		mu 0 4 237 263 264 239
		f 4 -431 431 432 -392
		mu 0 4 239 264 265 241
		f 4 -433 433 434 -394
		mu 0 4 241 265 266 243
		f 4 -435 435 436 -396
		mu 0 4 243 266 267 245
		f 4 -437 437 438 -398
		mu 0 4 245 267 268 247
		f 4 -439 439 -401 -400
		mu 0 4 247 268 249 210
		f 4 440 441 442 -402
		mu 0 4 249 269 270 250
		f 4 -443 443 444 -404
		mu 0 4 250 270 271 251
		f 4 -445 445 446 -406
		mu 0 4 251 271 272 252
		f 4 -447 447 448 -408
		mu 0 4 252 272 273 253
		f 4 -449 449 450 -410
		mu 0 4 253 273 274 254
		f 4 -451 451 452 -412
		mu 0 4 254 274 275 255
		f 4 -453 453 454 -414
		mu 0 4 255 275 276 256
		f 4 -455 455 456 -416
		mu 0 4 256 276 277 257
		f 4 -457 457 458 -418
		mu 0 4 257 277 278 258
		f 4 -459 459 460 -420
		mu 0 4 258 278 279 259
		f 4 -461 461 462 -422
		mu 0 4 259 279 280 260
		f 4 -463 463 464 -424
		mu 0 4 260 280 281 261
		f 4 -465 465 466 -426
		mu 0 4 261 281 282 262
		f 4 -467 467 468 -428
		mu 0 4 262 282 283 263
		f 4 -469 469 470 -430
		mu 0 4 263 283 284 264
		f 4 -471 471 472 -432
		mu 0 4 264 284 285 265
		f 4 -473 473 474 -434
		mu 0 4 265 285 286 266
		f 4 -475 475 476 -436
		mu 0 4 266 286 287 267
		f 4 -477 477 478 -438
		mu 0 4 267 287 288 268
		f 4 -479 479 -441 -440
		mu 0 4 268 288 269 249
		f 4 480 481 482 -442
		mu 0 4 269 289 290 270
		f 4 -483 483 484 -444
		mu 0 4 270 290 291 271
		f 4 -485 485 486 -446
		mu 0 4 271 291 292 272
		f 4 -487 487 488 -448
		mu 0 4 272 292 293 273
		f 4 -489 489 490 -450
		mu 0 4 273 293 294 274
		f 4 -491 491 492 -452
		mu 0 4 274 294 295 275
		f 4 -493 493 494 -454
		mu 0 4 275 295 296 276
		f 4 -495 495 496 -456
		mu 0 4 276 296 297 277
		f 4 -497 497 498 -458
		mu 0 4 277 297 298 278
		f 4 -499 499 500 -460
		mu 0 4 278 298 299 279
		f 4 -501 501 502 -462
		mu 0 4 279 299 300 280
		f 4 -503 503 504 -464
		mu 0 4 280 300 301 281
		f 4 -505 505 506 -466
		mu 0 4 281 301 302 282
		f 4 -507 507 508 -468
		mu 0 4 282 302 303 283
		f 4 -509 509 510 -470
		mu 0 4 283 303 304 284
		f 4 -511 511 512 -472
		mu 0 4 284 304 305 285
		f 4 -513 513 514 -474
		mu 0 4 285 305 306 286
		f 4 -515 515 516 -476
		mu 0 4 286 306 307 287
		f 4 -517 517 518 -478
		mu 0 4 287 307 308 288
		f 4 -519 519 -481 -480
		mu 0 4 288 308 289 269
		f 4 520 521 522 -482
		mu 0 4 289 309 310 290
		f 4 -523 523 524 -484
		mu 0 4 290 310 311 291
		f 4 -525 525 526 -486
		mu 0 4 291 311 312 292
		f 4 -527 527 528 -488
		mu 0 4 292 312 313 293
		f 4 -529 529 530 -490
		mu 0 4 293 313 314 294
		f 4 -531 531 532 -492
		mu 0 4 294 314 315 295
		f 4 -533 533 534 -494
		mu 0 4 295 315 316 296
		f 4 -535 535 536 -496
		mu 0 4 296 316 317 297
		f 4 -537 537 538 -498
		mu 0 4 297 317 318 298
		f 4 -539 539 540 -500
		mu 0 4 298 318 319 299
		f 4 -541 541 542 -502
		mu 0 4 299 319 320 300
		f 4 -543 543 544 -504
		mu 0 4 300 320 321 301
		f 4 -545 545 546 -506
		mu 0 4 301 321 322 302
		f 4 -547 547 548 -508
		mu 0 4 302 322 323 303
		f 4 -549 549 550 -510
		mu 0 4 303 323 324 304
		f 4 -551 551 552 -512
		mu 0 4 304 324 325 305
		f 4 -553 553 554 -514
		mu 0 4 305 325 326 306
		f 4 -555 555 556 -516
		mu 0 4 306 326 327 307
		f 4 -557 557 558 -518
		mu 0 4 307 327 328 308
		f 4 -559 559 -521 -520
		mu 0 4 308 328 309 289
		f 4 560 355 -562 -563
		mu 0 4 329 204 205 330
		f 4 -565 561 356 -564
		mu 0 4 331 330 205 206
		f 4 -567 563 357 -566
		mu 0 4 332 331 206 207
		f 4 -569 565 358 -568
		mu 0 4 333 332 207 208
		f 4 -571 567 359 -570
		mu 0 4 334 333 208 188
		f 4 -573 569 340 -572
		mu 0 4 335 334 188 189
		f 4 -575 571 341 -574
		mu 0 4 336 335 189 190
		f 4 -577 573 342 -576
		mu 0 4 338 336 190 192
		f 4 -579 575 343 -578
		mu 0 4 339 337 191 193
		f 4 -581 577 344 -580
		mu 0 4 340 339 193 194
		f 4 -583 579 345 -582
		mu 0 4 341 340 194 195
		f 4 -585 581 346 -584
		mu 0 4 342 341 195 196
		f 4 -587 583 347 -586
		mu 0 4 343 342 196 197
		f 4 -589 585 348 -588
		mu 0 4 344 343 197 198
		f 4 -591 587 349 -590
		mu 0 4 345 344 198 199
		f 4 -593 589 350 -592
		mu 0 4 346 345 199 200
		f 4 -595 591 351 -594
		mu 0 4 347 346 200 201
		f 4 -597 593 352 -596
		mu 0 4 348 347 201 202
		f 4 -599 595 353 -598
		mu 0 4 349 348 202 203
		f 4 -600 597 354 -561
		mu 0 4 329 349 203 204;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode transform -n "r_eyeball" -p "r_geo_group";
	rename -uid "76DA2C7A-47EE-B632-10C2-CABF6A0596B6";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "r_eyeballShape" -p "r_eyeball";
	rename -uid "AEA34945-4217-92EA-BB83-0A8671D4E527";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "r_eyeballShapeOrig" -p "r_eyeball";
	rename -uid "2F43A61E-4575-6E2C-AC67-9B9E567BBCB2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 377 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0.095694274 0.049017072 0.095694244
		 0.099175811 0.095694244 0.1478 0.095694244 0.19890767 0.095694244 0.24761128 0.095694244
		 0.29780492 0.095694244 0.34706721 0.095694244 0.39615184 0.095694244 0.44620577 0.095694244
		 0.49789405 0.095694244 0.54694015 0.095694244 0.59571129 0.095694214 0.64610869 0.095694244
		 0.69796729 0.095694244 0.75037849 0.095694244 0.80169523 0.095694244 0.8520568 0.095694244
		 0.90180671 0.095694244 0.95155013 0.095694244 0.99999988 0.095694214 0 0.18827614
		 0.049017072 0.18827614 0.099175811 0.18827614 0.1478 0.18827614 0.19890767 0.18827617
		 0.24761128 0.18827614 0.29780492 0.18827617 0.34706721 0.18827617 0.39615184 0.18827617
		 0.44620577 0.18827617 0.49789405 0.18827617 0.54694015 0.18827617 0.59571129 0.18827617
		 0.64610869 0.18827617 0.69796729 0.18827617 0.75037849 0.18827617 0.80169523 0.18827617
		 0.8520568 0.18827617 0.90180671 0.18827617 0.95155013 0.18827617 0.99999988 0.18827614
		 0 0.28666908 0.049017072 0.28666908 0.099175811 0.28666908 0.14779988 0.28666911
		 0.19890767 0.28666911 0.24761128 0.28666911 0.29780477 0.28666911 0.34706706 0.28666911
		 0.39615184 0.28666911 0.44620577 0.28666911 0.49789405 0.28666911 0.54694003 0.28666911
		 0.59571141 0.28666911 0.64610887 0.28666911 0.69796741 0.28666911 0.75037849 0.28666911
		 0.80169541 0.28666911 0.8520568 0.28666911 0.90180689 0.28666911 0.95155025 0.28666908
		 0.99999988 0.28666911 0 0.39286804 0.049017072 0.39286804 0.099175811 0.39286804
		 0.1478 0.39286804 0.19890767 0.39286804 0.24761128 0.39286804 0.29780492 0.39286804
		 0.34706721 0.39286804 0.39615184 0.39286804 0.44620577 0.39286804 0.49789405 0.39286804
		 0.54694015 0.39286804 0.59571129 0.39286804 0.64610869 0.39286804 0.69796729 0.3928681
		 0.75037849 0.39286804 0.80169523 0.39286804 0.8520568 0.39286804 0.90180671 0.39286804
		 0.95155013 0.39286804 0.99999988 0.39286804 0 0.48367518 0.049017072 0.48367518 0.099175811
		 0.48367506 0.1478 0.48367518 0.19890767 0.48367506 0.24761128 0.48367506 0.29780492
		 0.48367506 0.34706706 0.48367506 0.39615184 0.48367506 0.44620577 0.48367506 0.49789405
		 0.48367506 0.54694015 0.48367506 0.59571129 0.48367506 0.64610869 0.48367506 0.69796729
		 0.48367506 0.75037849 0.48367506 0.80169523 0.48367506 0.8520568 0.48367506 0.90180671
		 0.48367506 0.95155013 0.48367518 0.99999988 0.48367506 0 0.57726073 0.049017072 0.57726073
		 0.099175811 0.57726073 0.1478 0.57726073 0.19890767 0.57726073 0.24761128 0.57726073
		 0.29780492 0.57726061 0.34706706 0.57726061 0.39615184 0.57726061 0.44620577 0.57726061
		 0.49789405 0.57726061 0.54694015 0.57726061 0.59571129 0.57726061 0.64610869 0.57726061
		 0.69796729 0.57726061 0.75037849 0.57726061 0.80169523 0.57726061 0.8520568 0.57726061
		 0.90180671 0.57726061 0.95155013 0.57726061 0.99999988 0.57726061 0 0.67646748 0.049017072
		 0.67646748 0.099175811 0.67646748 0.1478 0.67646748 0.19890767 0.67646748 0.24761128
		 0.67646748 0.29780492 0.67646748 0.34706721 0.67646748 0.39615184 0.67646748 0.44620577
		 0.67646748 0.49789405 0.67646748 0.54694015 0.67646748 0.59571117 0.67646748 0.64610857
		 0.67646748 0.69796711 0.67646748 0.75037837 0.67646748 0.80169511 0.67646748 0.85205662
		 0.67646748 0.90180671 0.67646748 0.95155001 0.67646748 1 0.67646748 0 0.77257699
		 0.049017072 0.77257699 0.099175811 0.77257699 0.1478 0.77257699 0.19890767 0.77257699
		 0.24761128 0.77257699 0.29780492 0.77257699 0.34706721 0.77257699 0.39615184 0.77257699
		 0.44620577 0.77257699 0.49789405 0.77257699 0.54694015 0.77257699 0.59571129 0.77257699
		 0.64610869 0.77257699 0.69796729 0.77257699 0.75037849 0.77257699 0.80169523 0.77257699
		 0.8520568 0.77257699 0.90180671 0.77257699 0.95155013 0.77257699 0.99999988 0.77257699
		 0.9999997 0.85367066 0.049017072 0.85367066 0.09917596 0.85367066 0.1478 0.85367066
		 0.19890782 0.85367066 0.24761128 0.85367066 0.29780492 0.85367066 0.34706721 0.85367066
		 0.39615184 0.85367066 0.44620577 0.85367066 0.49789405 0.85367066 0.54694015 0.85367066
		 0.59571129 0.85367066 0.64610869 0.85367066 0.69796729 0.85367066 0.75037849 0.85367066
		 0.80169523 0.85367066 0.8520568 0.85367066 0.90180689 0.85367066 0.95155013 0.85367066
		 0.049017072 0 0.049017072 0 0.099175811 0 0.1478 0 0.19890767 0 0.24761128 0 0.29780492
		 0 0.34706706 0 0.39615184 0 0.44620577 0 0.49789405 0 0.54694015 0 0.59571129 0 0.64610869
		 2.9802322e-08 0.69796729 0 0.75037849 0 0.80169523 0 0.8520568 0 0.90180671 0 0.95155013
		 0 0.049017072 0.86565226 0 0.86565226 0.09917596 0.86565226 0.1478 0.86565226 0.19890782
		 0.86565226 0.24761128 0.86565226 0.29780492 0.86565226 0.34706721 0.86565226 0.39615184
		 0.86565226 0.44620577 0.86565226 0.49789405 0.86565226 0.54694015 0.86565226 0.59571129
		 0.86565226 0.64610869 0.86565226 0.69796729 0.86565226 0.75037849 0.86565226 0.80169523
		 0.86565226 0.8520568 0.86565226 0.90180689 0.86565226 0.95155013 0.86565226 0.049017072
		 0.89954734 0 0.89954734 0.09917596 0.89954734 0.1478 0.89954734 0.19890782 0.89954734
		 0.24761128 0.89954734 0.29780492 0.89954734 0.34706721 0.89954734 0.39615184 0.89954734
		 0.44620577 0.89954734 0.49789405 0.89954734 0.54694015 0.89954734 0.59571129 0.89954734
		 0.64610869 0.89954734 0.69796729 0.89954734 0.75037849 0.89954734 0.80169523 0.89954734
		 0.8520568 0.89954734 0.90180689 0.89954734 0.95155013 0.89954734 0.049017072 0.9385519
		 0 0.9385519;
	setAttr ".uvst[0].uvsp[250:376]" 0.09917596 0.9385519 0.1478 0.9385519 0.19890782
		 0.9385519 0.24761128 0.9385519 0.29780492 0.9385519 0.34706721 0.9385519 0.39615184
		 0.9385519 0.44620577 0.9385519 0.49789405 0.9385519 0.54694015 0.9385519 0.59571129
		 0.9385519 0.64610869 0.9385519 0.69796729 0.9385519 0.75037849 0.9385519 0.80169523
		 0.9385519 0.8520568 0.9385519 0.90180689 0.9385519 0.95155013 0.9385519 0.049017072
		 0.94702017 0 0.94702017 0.09917596 0.94702017 0.1478 0.94702017 0.19890782 0.94702017
		 0.24761128 0.94702017 0.29780492 0.94702017 0.34706721 0.94702017 0.39615184 0.94702017
		 0.44620577 0.94702017 0.49789405 0.94702017 0.54694015 0.94702017 0.59571129 0.94702017
		 0.64610869 0.94702017 0.69796729 0.94702017 0.75037849 0.94702017 0.80169523 0.94702017
		 0.8520568 0.94702017 0.90180689 0.94702017 0.95155013 0.94702017 0.049017072 0.95891476
		 0 0.95891476 0.09917596 0.95891476 0.1478 0.95891476 0.19890782 0.95891476 0.24761128
		 0.95891476 0.29780492 0.95891476 0.34706721 0.95891476 0.39615184 0.95891476 0.44620577
		 0.95891476 0.49789405 0.95891476 0.54694015 0.95891476 0.59571129 0.95891476 0.64610869
		 0.95891476 0.69796729 0.95891476 0.75037849 0.95891476 0.80169523 0.95891476 0.8520568
		 0.95891476 0.90180689 0.95891476 0.95155013 0.95891476 0.049017072 0.96649295 0 0.96649295
		 0.09917596 0.96649295 0.1478 0.96649295 0.19890782 0.96649295 0.24761128 0.96649295
		 0.29780492 0.96649295 0.34706721 0.96649295 0.39615184 0.96649295 0.44620577 0.96649295
		 0.49789405 0.96649295 0.54694015 0.96649295 0.59571129 0.96649295 0.64610869 0.96649295
		 0.69796729 0.96649295 0.75037849 0.96649295 0.80169523 0.96649295 0.8520568 0.96649295
		 0.90180689 0.96649295 0.95155013 0.96649295 0.049017072 0.99999994 0 1 0.09917596
		 0.99999994 0.1478 0.99999994 0.19890782 0.99999994 0.24761128 0.99999994 0.29780492
		 0.99999994 0.34706721 0.99999994 0.39615184 0.99999982 0.44620577 0.99999982 0.49789405
		 0.99999982 0.54694015 0.99999982 0.59571129 0.99999982 0.64610869 0.9999997 0.69796729
		 0.9999997 0.75037849 0.9999997 0.80169523 0.9999997 0.8520568 0.9999997 0.90180689
		 0.9999997 0.95155013 0.9999997 0.1478 0.84898013 0.099175811 0.84898013 0.049017072
		 0.84898013 0.99999988 0.84898013 0 0.84898013 0.95155013 0.84898013 0.90180689 0.84898013
		 0.8520568 0.84898013 0.80169523 0.84898013 0.75037849 0.84898013 0.69796729 0.84898013
		 0.64610869 0.84898013 0.59571129 0.84898013 0.54694015 0.84898013 0.49789405 0.84898013
		 0.44620577 0.84898013 0.39615184 0.84898013 0.34706721 0.84898013 0.29780492 0.84898013
		 0.24761128 0.84898013 0.19890782 0.84898013 0.9999997 0.89954734 0.9999997 0.86565226
		 0 0.85367066 0.9999997 0.96649295 0.9999997 0.9999997 0.9999997 0.95891476 0.9999997
		 0.94702017 0.9999997 0.9385519;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr -s 1340 ".clst[0].clsp";
	setAttr ".clst[0].clsp[0:124]"  1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[125:249]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[250:374]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[375:499]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[500:624]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1;
	setAttr ".clst[0].clsp[625:749]" 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[750:874]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[875:999]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[1000:1124]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[1125:1249]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".clst[0].clsp[1250:1339]" 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 341 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0.15639143 0.050796159 -0.50609279 
		0.13303445 0.096620083 -0.50609279 0.096655175 0.13298613 -0.50609279 0.050814629 
		0.15633453 -0.50609279 0 0.16437988 -0.50609279 -0.050814629 0.15633453 -0.50609279 
		-0.09665516 0.13298599 -0.50609279 -0.13303441 0.096619956 -0.50609279 -0.15639143 
		0.050796159 -0.50609279 -0.16443954 0 -0.50609279 -0.15639143 -0.050796159 -0.50609279 
		-0.13303439 -0.096620016 -0.50609279 -0.096655145 -0.13298599 -0.50609279 -0.050814617 
		-0.15633459 -0.50609279 -4.9006794e-09 -0.16437975 -0.50609279 0.050814603 -0.15633459 
		-0.50609279 0.096655123 -0.13298599 -0.50609279 0.13303436 -0.096620016 -0.50609279 
		0.15639143 -0.050796159 -0.50609279 0.16443951 0 -0.50609279 0.29733947 0.096576311 
		-0.430599 0.25293222 0.18369909 -0.43059897 0.1837659 0.25284025 -0.43059897 0.09661144 
		0.29723141 -0.430599 0 0.31252766 -0.430599 -0.09661144 0.29723129 -0.430599 -0.18376587 
		0.2528401 -0.43059897 -0.25293198 0.18369909 -0.43059897 -0.29733935 0.096576311 
		-0.430599 -0.31264132 0 -0.43059897 -0.29733935 -0.096576311 -0.43059894 -0.25293195 
		-0.18369909 -0.43059897 -0.18376587 -0.25283998 -0.43059897 -0.09661141 -0.29723123 
		-0.430599 -9.3174277e-09 -0.31252766 -0.430599 0.096611388 -0.29723123 -0.430599 
		0.18376587 -0.25283998 -0.430599 0.25293189 -0.18369909 -0.43059897 0.29733929 -0.096576244 
		-0.430599 0.31264099 0 -0.43059897 0.40915224 0.13289329 -0.31316817 0.34804589 0.2527782 
		-0.31316817 0.25287011 0.34791932 -0.31316817 0.13294162 0.40900347 -0.31316817 0 
		0.43005171 -0.31316814 -0.13294162 0.40900347 -0.31316817 -0.25286993 0.34791932 
		-0.31316817 -0.34804589 0.25277799 -0.31316817 -0.40915212 0.13289322 -0.31316817 
		-0.43020797 0 -0.31316817 -0.40915212 -0.13289325 -0.31316814 -0.34804583 -0.25277796 
		-0.31316814 -0.25286987 -0.34791899 -0.31316814 -0.13294157 -0.40900335 -0.31316814 
		-1.2821194e-08 -0.43005159 -0.3131682 0.13294153 -0.40900335 -0.31316814 0.25286984 
		-0.34791896 -0.31316814 0.3480455 -0.25277793 -0.31316814 0.40915203 -0.13289322 
		-0.31316814 0.43020788 0 -0.31316817 0.48107395 0.15625361 -0.16520213 0.40922591 
		0.29721195 -0.16520213 0.29732004 0.40907711 -0.16520216 0.15631044 0.48089901 -0.16520216 
		0 0.50564736 -0.16520216 -0.15631044 0.48089895 -0.16520216 -0.29731998 0.40907705 
		-0.16520216 -0.40922579 0.29721189 -0.16520213 -0.48107374 0.15625361 -0.16520213 
		-0.50583082 0 -0.16520213 -0.48107374 -0.15625362 -0.16520213 -0.40922576 -0.29721183 
		-0.16520216 -0.29731989 -0.40907696 -0.16520216 -0.15631044 -0.4808988 -0.16520216 
		-1.507493e-08 -0.50564688 -0.16520216 0.15631029 -0.48089877 -0.1652021 0.29731983 
		-0.40907696 -0.16520216 0.40922567 -0.2972118 -0.16520216 0.48107362 -0.15625362 
		-0.16520213 0.50583071 0 -0.16520213 0.50802535 0.16500734 -0.0011259613 0.43215197 
		0.31386274 -0.0011259613 0.31397688 0.43199486 -0.0011259613 0.16506733 0.50784063 
		-0.0011259613 2.4666594e-10 0.53397489 -0.0011259613 -0.16506733 0.50784063 -0.0011259613 
		-0.31397688 0.43199477 -0.0011259613 -0.43215182 0.31386274 -0.0011259613 -0.50802487 
		0.16500728 -0.0011259613 -0.53416896 -3.6986442e-10 -0.0011259613 -0.50802487 -0.16500728 
		-0.0011259613 -0.43215179 -0.31386274 -0.0011259613 -0.31397688 -0.43199468 -0.0011259613 
		-0.16506727 -0.50784016 -0.0011259613 -1.5672807e-08 -0.53397471 -0.0011259613 0.16506723 
		-0.5078401 -0.0011259613 0.31397656 -0.43199462 -0.0011259613 0.43215168 -0.31386274 
		-0.0011259613 0.50802475 -0.16500725 -0.0011259613 0.53416884 -3.6986442e-10 -0.0011259613 
		0.48374686 0.15712179 0.16306533 0.41149962 0.29886329 0.16306536 0.29897198 0.41135004 
		0.16306536 0.15717892 0.48357093 0.16306536 2.6556446e-10 0.50845683 0.1630653 -0.15717892 
		0.48357093 0.1630653 -0.29897189 0.41134998 0.16306536 -0.41149953 0.2988632 0.16306536 
		-0.48374668 0.15712179 0.16306533 -0.5086413 -9.9550468e-10 0.16306533 -0.48374668 
		-0.15712176 0.16306533 -0.4114995 -0.29886317 0.16306533 -0.29897183 -0.41134989 
		0.16306536 -0.15717892 -0.48357075 0.16306536 -1.4893124e-08 -0.50845635 0.16306536 
		0.15717876 -0.48357069 0.16306536 0.29897177 -0.41134983 0.16306536 0.41149941 -0.29886317 
		0.16306533 0.48374656 -0.15712176 0.16306533 0.50864118 -9.9550468e-10 0.16306533 
		0.40567133 0.13176268 0.31546828 0.34508485 0.25062764 0.31546828 0.2507188 0.34495941 
		0.31546825 0.13181059 0.40552381 0.31546825 -5.7237015e-10 0.42639294 0.31546825 
		-0.13181059 0.40552381 0.31546831 -0.25071859 0.34495941 0.31546825 -0.34508485 0.25062746 
		0.31546828 -0.40567118 0.13176265 0.31546825 -0.42654791 5.721621e-10 0.31546825 
		-0.40567118 -0.13176261 0.31546825 -0.34508482 -0.25062746 0.31546825 -0.25071856 
		-0.34495905 0.31546825 -0.13181056 -0.40552366 0.31546825 -1.3284486e-08 -0.42639285 
		0.31546825 0.13181052 -0.40552366 0.31546825 0.2507185 -0.34495905 0.31546825 0.34508446 
		-0.2506274 0.31546825 0.40567109 -0.13176261 0.31546825 0.4265478 5.721621e-10 0.31546825 
		0.29912534 0.097156361 0.42095098 0.25445136 0.1848024 0.42095098 0.18486962 0.25435883 
		0.42095095 0.097191706 0.29901657 0.42095098 1.7704687e-24 0.31440476 0.42095098 
		-0.097191706 0.29901657 0.42095098 -0.1848696 0.25435865 0.42095098 -0.25445113 0.1848024 
		0.42095095 -0.29912519 0.097156361 0.42095098 -0.31451911 0 0.42095098 -0.29912519 
		-0.097156361 0.42095098 -0.2544511 -0.1848024 0.42095098 -0.1848696 -0.25435859 0.42095098 
		-0.097191676 -0.29901651 0.42095098 -9.3733901e-09 -0.31440476 0.42095098 0.097191647 
		-0.29901651 0.42095098 0.1848696 -0.25435859 0.42095098 0.25445107 -0.1848024 0.42095098 
		0.29912513 -0.097156294 0.42095098 0.31451878 0 0.42095098 0.20754665 0.06741152 
		0.46855438 0.17654975 0.12822427 0.46855441 0.12827089 0.17648554 0.46855438 0.067436002 
		0.20747119 0.46855438 5.0318256e-09 0.21814807 0.46855438 -0.067435995 0.20747119 
		0.46855438;
	setAttr ".pt[166:331]" -0.12827085 0.17648554 0.46855438 -0.17654969 0.12822421 
		0.46855438 -0.20754665 0.067411445 0.46855444 -0.21822734 0 0.46855441 -0.20754665 
		-0.067411445 0.46855441 -0.17654967 -0.12822427 0.46855441 -0.12827083 -0.17648554 
		0.46855441 -0.067435987 -0.20747119 0.46855441 -1.4718585e-09 -0.21814801 0.46855441 
		0.067435957 -0.20747119 0.46855441 0.1282708 -0.17648554 0.46855441 0.17654964 -0.12822415 
		0.46855441 0.20754665 -0.067411445 0.46855441 0.21822731 0 0.46855441 0 0 -0.53213739 
		0.19336472 0.062805206 0.45956647 0.16448599 0.11946253 0.4595665 0.11950597 0.16442603 
		0.4595665 0.062828012 0.19329441 0.45956647 3.5936933e-09 0.2032418 0.4595665 -0.062828004 
		0.19329441 0.4595665 -0.11950593 0.16442603 0.4595665 -0.16448581 0.11946247 0.45956653 
		-0.19336466 0.062805139 0.45956653 -0.20331563 0 0.4595665 -0.19336466 -0.062805139 
		0.4595665 -0.1644858 -0.1194624 0.4595665 -0.11950592 -0.16442597 0.4595665 -0.062827997 
		-0.19329426 0.4595665 -2.4655826e-09 -0.20324165 0.4595665 0.062827975 -0.19329426 
		0.4595665 0.11950589 -0.16442597 0.4595665 0.16448577 -0.1194624 0.4595665 0.19336462 
		-0.062805139 0.4595665 0.2033156 0 0.4595665 0.14981748 0.048660934 0.43898451 0.12744214 
		0.092558518 0.43898448 0.092592269 0.1273957 0.43898451 0.048678618 0.14976302 0.43898451 
		-8.2225748e-10 0.15747006 0.43898457 -0.048678651 0.14976296 0.43898448 -0.09259218 
		0.1273957 0.43898451 -0.12744205 0.092558518 0.43898448 -0.14981738 0.048660934 0.43898457 
		-0.15752731 0 0.43898451 -0.14981738 -0.048660934 0.43898451 -0.12744205 -0.092558458 
		0.43898457 -0.09259218 -0.12739563 0.43898451 -0.04867864 -0.1497629 0.43898448 -5.5169118e-09 
		-0.15746999 0.43898451 0.048678618 -0.1497629 0.43898451 0.092592143 -0.12739563 
		0.43898451 0.127442 -0.092558458 0.43898451 0.14981735 -0.048660934 0.43898451 0.15752728 
		0 0.43898451 0.10065854 0.032694083 0.41992304 0.085625164 0.062187705 0.41992307 
		0.062210388 0.085594006 0.41992304 0.03270594 0.100622 0.41992304 -5.8072249e-09 
		0.10580024 0.41992304 -0.032705963 0.10062193 0.4199231 -0.06221034 0.085594006 0.41992304 
		-0.085625134 0.062187705 0.41992307 -0.10065851 0.032694083 0.41992304 -0.10583864 
		0 0.41992304 -0.10065851 -0.032694016 0.41992307 -0.085625134 -0.062187705 0.41992304 
		-0.06221034 -0.085593946 0.41992304 -0.032705959 -0.10062193 0.41992304 -8.9614467e-09 
		-0.10580011 0.41992304 0.03270594 -0.10062187 0.41992304 0.062210318 -0.085593946 
		0.41992304 0.085625067 -0.062187705 0.41992307 0.10065848 -0.032694016 0.41992307 
		0.1058386 0 0.41992304 0.092483371 0.030038765 0.41278976 0.078670926 0.057137027 
		0.41278976 0.057157844 0.078642331 0.41278976 0.030049659 0.092449792 0.41278976 
		-6.6362338e-09 0.097207397 0.41278976 -0.030049684 0.092449725 0.41278976 -0.057157807 
		0.078642331 0.41278976 -0.078670889 0.057137027 0.41278976 -0.092483319 0.030038765 
		0.41278976 -0.097242743 0 0.41278976 -0.092483319 -0.0300387 0.41278976 -0.078670889 
		-0.057136964 0.41278976 -0.057157807 -0.078642271 0.41278976 -0.030049678 -0.092449665 
		0.41278976 -9.5342774e-09 -0.097207338 0.41278976 0.030049659 -0.092449665 0.41278976 
		0.057157777 -0.078642271 0.41278976 0.078670852 -0.057136964 0.41278976 0.09248329 
		-0.0300387 0.41278976 0.097242713 0 0.41278976 0.092483371 0.030038765 0.39801121 
		0.078670926 0.057137027 0.39801124 0.057157844 0.078642331 0.39801127 0.030049659 
		0.092449792 0.39801121 -6.6362338e-09 0.097207397 0.39801127 -0.030049684 0.092449725 
		0.39801127 -0.057157807 0.078642331 0.39801127 -0.078670889 0.057137027 0.39801124 
		-0.092483319 0.030038765 0.39801121 -0.097242743 0 0.39801121 -0.092483319 -0.0300387 
		0.39801121 -0.078670889 -0.057136964 0.39801124 -0.057157807 -0.078642271 0.39801121 
		-0.030049678 -0.092449665 0.39801121 -9.5342774e-09 -0.097207338 0.39801121 0.030049659 
		-0.092449665 0.39801121 0.057157777 -0.078642271 0.39801121 0.078670852 -0.057136964 
		0.39801124 0.09248329 -0.0300387 0.39801121 0.097242713 0 0.39801121 0.10182299 0.033072285 
		0.39801121 0.086615689 0.062907152 0.39801124 0.062930055 0.086584166 0.39801124 
		0.033084285 0.101786 0.39801121 -5.689146e-09 0.1070241 0.39801121 -0.033084314 0.101786 
		0.39801124 -0.062930003 0.086584166 0.39801124 -0.086615644 0.062907152 0.39801124 
		-0.10182294 0.033072285 0.39801121 -0.10706301 0 0.39801121 -0.10182294 -0.033072222 
		0.39801121 -0.086615644 -0.062907092 0.39801121 -0.062930003 -0.086584106 0.39801121 
		-0.033084307 -0.10178594 0.39801121 -8.8798551e-09 -0.10702403 0.39801121 0.033084285 
		-0.10178588 0.39801121 0.062929973 -0.086584106 0.39801121 0.086615607 -0.062907092 
		0.39801121 0.10182291 -0.033072222 0.39801121 0.10706298 0 0.39801121 0.14829656 
		0.048166957 0.39161107 0.12614842 0.091618881 0.39161101 0.091652237 0.12610243 0.39161101 
		0.048184447 0.14824264 0.39161101 -9.7649377e-10 0.15587145 0.39161104 -0.048184477 
		0.14824264 0.39161104 -0.091652162 0.12610243 0.39161101 -0.12614825 0.091618881 
		0.39161101 -0.14829648 0.048166893 0.39161101 -0.15592811 0 0.39161104 -0.14829648 
		-0.048166893 0.39161107 -0.12614825 -0.091618814 0.39161104 -0.091652162 -0.1261023 
		0.39161104 -0.048184466 -0.14824256 0.39161101 -5.6234883e-09 -0.15587139 0.39161104 
		0.048184447 -0.1482425 0.39161101 0.091652133 -0.1261023 0.39161104 0.12614822 -0.091618814 
		0.39161104 0.14829645 -0.048166893 0.39161107 0.15592808 0 0.39161104 0.069676749 
		0.21436505 0.46945354 0.13253304 0.1823498 0.46945357 0.18241611 0.13248484 0.46945357 
		0.214443 0.06965141 0.46945354 0.22547854 0 0.46945354 0.21444291 -0.06965141 0.46945354 
		0.18241599 -0.13248484 0.46945354 0.13253297 -0.18234967 0.46945354 0.069676712 -0.21436499 
		0.46945354 -3.1061191e-09 -0.22539653 0.46945354 -0.069676727 -0.21436499 0.46945354;
	setAttr ".pt[332:340]" -0.132533 -0.18234967 0.46945354 -0.18241604 -0.13248484 
		0.46945354 -0.214443 -0.06965141 0.46945354 -0.22547859 0 0.46945354 -0.214443 0.069651343 
		0.46945354 -0.18241605 0.13248484 0.46945354 -0.13253301 0.18234974 0.46945354 -0.069676742 
		0.21436505 0.46945354 3.6136674e-09 0.22539666 0.46945354;
	setAttr -s 341 ".vt";
	setAttr ".vt[0:165]"  0.14435326 0.046903193 -0.4671365 0.12279418 0.089215219 -0.4671365
		 0.089215182 0.12279421 -0.4671365 0.046903193 0.14435321 -0.4671365 0 0.15178198 -0.4671365
		 -0.046903193 0.14435321 -0.4671365 -0.089215167 0.12279409 -0.4671365 -0.12279414 0.0892151 -0.4671365
		 -0.14435326 0.046903193 -0.4671365 -0.15178187 0 -0.4671365 -0.14435326 -0.046903193 -0.4671365
		 -0.12279412 -0.089215159 -0.4671365 -0.089215152 -0.12279409 -0.4671365 -0.046903182 -0.14435327 -0.4671365
		 -4.5234514e-09 -0.15178186 -0.4671365 0.046903167 -0.14435327 -0.4671365 0.08921513 -0.12279409 -0.4671365
		 0.12279409 -0.089215159 -0.4671365 0.14435326 -0.046903193 -0.4671365 0.15178184 0 -0.4671365
		 0.2745761 0.089215159 -0.39737004 0.23356852 0.16969734 -0.39737001 0.16969736 0.23356849 -0.39737001
		 0.089215174 0.27457613 -0.39737004 0 0.28870648 -0.39737004 -0.089215174 0.27457601 -0.39737004
		 -0.16969734 0.23356837 -0.39737001 -0.23356828 0.16969734 -0.39737001 -0.27457598 0.089215159 -0.39737004
		 -0.28870651 0 -0.39737001 -0.27457598 -0.089215159 -0.39736998 -0.23356828 -0.16969734 -0.39737001
		 -0.16969734 -0.23356825 -0.39737001 -0.089215145 -0.27457595 -0.39737004 -8.6041156e-09 -0.28870648 -0.39737004
		 0.089215122 -0.27457595 -0.39737004 0.16969734 -0.23356825 -0.39737004 0.23356825 -0.16969734 -0.39737001
		 0.27457592 -0.0892151 -0.39737004 0.28870621 0 -0.39737001 0.37792158 0.12279415 -0.28870621
		 0.32147947 0.23356849 -0.28870621 0.23356852 0.32147944 -0.28870621 0.12279415 0.37792152 -0.28870621
		 0 0.39737022 -0.28870618 -0.12279415 0.37792152 -0.28870621 -0.23356834 0.32147944 -0.28870621
		 -0.32147947 0.23356831 -0.28870621 -0.37792146 0.12279409 -0.28870621 -0.3973701 0 -0.28870621
		 -0.37792146 -0.12279412 -0.28870618 -0.32147944 -0.23356828 -0.28870618 -0.23356828 -0.32147914 -0.28870618
		 -0.12279412 -0.3779214 -0.28870618 -1.1842549e-08 -0.3973701 -0.28870624 0.12279408 -0.3779214 -0.28870618
		 0.23356822 -0.32147911 -0.28870618 0.32147911 -0.23356825 -0.28870618 0.37792137 -0.12279409 -0.28870618
		 0.39737001 0 -0.28870621 0.4442735 0.14435324 -0.15178183 0.37792158 0.2745761 -0.15178183
		 0.2745761 0.37792155 -0.15178186 0.14435326 0.44427344 -0.15178186 0 0.46713692 -0.15178186
		 -0.14435326 0.44427338 -0.15178186 -0.27457604 0.37792149 -0.15178186 -0.37792149 0.27457604 -0.15178183
		 -0.44427332 0.14435324 -0.15178183 -0.46713656 0 -0.15178183 -0.44427332 -0.14435326 -0.15178183
		 -0.37792146 -0.27457598 -0.15178186 -0.27457598 -0.3779214 -0.15178186 -0.14435326 -0.44427326 -0.15178186
		 -1.3921751e-08 -0.46713656 -0.15178186 0.14435311 -0.44427323 -0.1517818 0.27457592 -0.3779214 -0.15178186
		 0.37792137 -0.27457595 -0.15178186 0.4442732 -0.14435326 -0.15178183 0.46713644 0 -0.15178183
		 0.46892142 0.15236171 0 0.39888817 0.28980932 0 0.28980932 0.39888814 0 0.15236169 0.46892136 0
		 2.2767946e-10 0.49305278 0 -0.15236169 0.46892136 0 -0.28980932 0.39888805 0 -0.39888802 0.28980932 0
		 -0.46892095 0.15236165 0 -0.49305272 -3.415192e-10 0 -0.46892095 -0.15236165 0 -0.39888799 -0.28980932 0
		 -0.28980932 -0.39888796 0 -0.15236165 -0.46892095 0 -1.4466433e-08 -0.4930526 0 0.1523616 -0.46892089 0
		 0.28980902 -0.39888793 0 0.3988879 -0.28980932 0 0.46892083 -0.15236162 0 0.4930526 -3.415192e-10 0
		 0.44609889 0.14494635 0.15178183 0.37947434 0.27570423 0.15178186 0.27570423 0.37947434 0.15178186
		 0.14494635 0.4460988 0.15178186 2.4489669e-10 0.46905631 0.1517818 -0.14494635 0.4460988 0.1517818
		 -0.27570418 0.37947428 0.15178186 -0.37947425 0.27570415 0.15178186 -0.44609872 0.14494635 0.15178183
		 -0.46905592 -9.1836255e-10 0.15178183 -0.44609872 -0.14494634 0.15178183 -0.37947422 -0.27570412 0.15178183
		 -0.27570412 -0.37947419 0.15178186 -0.14494635 -0.44609866 0.15178186 -1.3734055e-08 -0.46905586 0.15178186
		 0.1449462 -0.4460986 0.15178186 0.27570406 -0.37947413 0.15178186 0.37947413 -0.27570412 0.15178183
		 0.4460986 -0.14494634 0.15178183 0.4690558 -9.1836255e-10 0.15178183 0.37346691 0.12134674 0.29248008
		 0.3176901 0.23081535 0.29248008 0.23081537 0.3176901 0.29248005 0.12134674 0.37346685 0.29248005
		 -5.2693228e-10 0.39268628 0.29248005 -0.12134674 0.37346685 0.29248011 -0.23081519 0.3176901 0.29248005
		 -0.3176901 0.23081517 0.29248008 -0.37346679 0.12134671 0.29248005 -0.39268619 5.2693228e-10 0.29248005
		 -0.37346679 -0.12134668 0.29248005 -0.31769007 -0.23081517 0.29248005 -0.23081514 -0.31768978 0.29248005
		 -0.12134671 -0.37346673 0.29248005 -1.222989e-08 -0.39268619 0.29248005 0.12134667 -0.37346673 0.29248005
		 0.2308151 -0.31768978 0.29248005 0.31768975 -0.23081511 0.29248005 0.3734667 -0.12134668 0.29248005
		 0.3926861 5.2693228e-10 0.29248005 0.2745761 0.089215159 0.3896828 0.23356852 0.16969734 0.3896828
		 0.16969736 0.23356849 0.38968277 0.089215174 0.27457607 0.3896828 0 0.28870648 0.3896828
		 -0.089215174 0.27457607 0.3896828 -0.16969734 0.23356831 0.3896828 -0.2335683 0.16969734 0.38968277
		 -0.27457598 0.089215159 0.3896828 -0.28870651 0 0.3896828 -0.27457598 -0.089215159 0.3896828
		 -0.23356828 -0.16969734 0.3896828 -0.16969734 -0.23356825 0.3896828 -0.089215145 -0.27457601 0.3896828
		 -8.6041156e-09 -0.28870648 0.3896828 0.089215122 -0.27457601 0.3896828 0.16969734 -0.23356825 0.3896828
		 0.23356824 -0.16969734 0.3896828 0.27457592 -0.0892151 0.3896828 0.28870621 0 0.3896828
		 0.1897095 0.061640382 0.43344885 0.16137657 0.11724693 0.43344891 0.11724693 0.16137654 0.43344885
		 0.061640359 0.18970948 0.43344885 4.5993764e-09 0.19947231 0.43344885 -0.061640352 0.18970948 0.43344885;
	setAttr ".vt[166:331]" -0.11724688 0.16137654 0.43344885 -0.16137651 0.11724687 0.43344885
		 -0.1897095 0.061640322 0.43344891 -0.19947226 0 0.43344891 -0.1897095 -0.061640322 0.43344891
		 -0.16137649 -0.11724693 0.43344891 -0.11724687 -0.16137654 0.43344891 -0.061640345 -0.18970948 0.43344891
		 -1.3453628e-09 -0.19947225 0.43344891 0.061640322 -0.18970948 0.43344891 0.11724684 -0.16137654 0.43344891
		 0.16137646 -0.11724681 0.43344891 0.1897095 -0.061640322 0.43344891 0.19947223 0 0.43344891
		 0 0 -0.49117637 0.1767464 0.05742842 0.42523342 0.15034959 0.10923529 0.42523348
		 0.10923529 0.15034944 0.42523348 0.057428394 0.17674637 0.42523342 3.2848411e-09 0.18584216 0.42523348
		 -0.057428386 0.17674637 0.42523348 -0.10923526 0.15034944 0.42523348 -0.15034942 0.10923523 0.42523348
		 -0.17674634 0.05742836 0.42523348 -0.1858421 0 0.42523348 -0.17674634 -0.05742836 0.42523348
		 -0.15034941 -0.10923517 0.42523348 -0.10923524 -0.15034938 0.42523348 -0.057428379 -0.17674625 0.42523348
		 -2.2536832e-09 -0.18584204 0.42523348 0.05742836 -0.17674625 0.42523348 0.10923521 -0.15034938 0.42523348
		 0.15034938 -0.10923517 0.42523348 0.17674631 -0.05742836 0.42523348 0.18584207 0 0.42523348
		 0.13694173 0.044495046 0.40642035 0.1164894 0.084634542 0.40642035 0.084634624 0.11648929 0.40642035
		 0.044495039 0.13694173 0.40642035 -7.5159035e-10 0.14398897 0.40642041 -0.044495068 0.13694167 0.40642035
		 -0.084634542 0.11648929 0.40642035 -0.11648931 0.084634542 0.40642035 -0.13694164 0.044495046 0.40642041
		 -0.14398897 0 0.40642035 -0.13694164 -0.044495046 0.40642035 -0.11648931 -0.084634483 0.40642041
		 -0.084634542 -0.11648923 0.40642035 -0.044495057 -0.13694161 0.40642035 -5.0427724e-09 -0.14398891 0.40642035
		 0.044495039 -0.13694161 0.40642035 0.084634513 -0.11648923 0.40642035 0.11648928 -0.084634483 0.40642035
		 0.13694161 -0.044495046 0.40642035 0.14398894 0 0.40642035 0.092007659 0.029895127 0.38899705
		 0.078266293 0.056863785 0.38899708 0.056863852 0.078266263 0.38899705 0.029895097 0.092007697 0.38899705
		 -5.3081357e-09 0.09674263 0.38899705 -0.029895119 0.092007637 0.38899711 -0.056863807 0.078266263 0.38899705
		 -0.078266263 0.056863785 0.38899708 -0.09200763 0.029895127 0.38899705 -0.096742563 0 0.38899705
		 -0.09200763 -0.029895067 0.38899708 -0.078266263 -0.056863785 0.38899705 -0.056863807 -0.078266203 0.38899705
		 -0.029895114 -0.092007637 0.38899705 -8.1912743e-09 -0.096742511 0.38899705 0.029895097 -0.092007577 0.38899705
		 0.056863785 -0.078266203 0.38899705 0.078266203 -0.056863785 0.38899708 0.0920076 -0.029895067 0.38899708
		 0.096742533 0 0.38899705 0.084535085 0.027467132 0.38247684 0.071909726 0.052245498 0.38247684
		 0.052245535 0.071909726 0.38247684 0.027467106 0.084535122 0.38247684 -6.0658967e-09 0.088885427 0.38247684
		 -0.027467128 0.084535062 0.38247684 -0.052245501 0.071909726 0.38247684 -0.071909688 0.052245498 0.38247684
		 -0.08453504 0.027467132 0.38247684 -0.088885427 0 0.38247684 -0.08453504 -0.027467072 0.38247684
		 -0.071909688 -0.052245438 0.38247684 -0.052245501 -0.071909666 0.38247684 -0.027467122 -0.084535003 0.38247684
		 -8.7148742e-09 -0.088885367 0.38247684 0.027467106 -0.084535003 0.38247684 0.052245472 -0.071909666 0.38247684
		 0.071909651 -0.052245438 0.38247684 0.08453501 -0.027467072 0.38247684 0.088885397 0 0.38247684
		 0.084535085 0.027467132 0.3689684 0.071909726 0.052245498 0.36896843 0.052245535 0.071909726 0.36896846
		 0.027467106 0.084535122 0.3689684 -6.0658967e-09 0.088885427 0.36896846 -0.027467128 0.084535062 0.36896846
		 -0.052245501 0.071909726 0.36896846 -0.071909688 0.052245498 0.36896843 -0.08453504 0.027467132 0.3689684
		 -0.088885427 0 0.3689684 -0.08453504 -0.027467072 0.3689684 -0.071909688 -0.052245438 0.36896843
		 -0.052245501 -0.071909666 0.3689684 -0.027467122 -0.084535003 0.3689684 -8.7148742e-09 -0.088885367 0.3689684
		 0.027467106 -0.084535003 0.3689684 0.052245472 -0.071909666 0.3689684 0.071909651 -0.052245438 0.36896843
		 0.08453501 -0.027467072 0.3689684 0.088885397 0 0.3689684 0.093072034 0.030240953 0.3689684
		 0.079171687 0.057521641 0.36896843 0.057521667 0.079171658 0.36896843 0.030240927 0.093072057 0.3689684
		 -5.2002043e-09 0.097861707 0.3689684 -0.030240953 0.093072057 0.36896843 -0.057521619 0.079171658 0.36896843
		 -0.07917165 0.057521641 0.36896843 -0.09307199 0.030240953 0.3689684 -0.097861707 0 0.3689684
		 -0.09307199 -0.030240893 0.3689684 -0.07917165 -0.057521582 0.3689684 -0.057521619 -0.079171598 0.3689684
		 -0.030240946 -0.093071997 0.3689684 -8.1166949e-09 -0.097861648 0.3689684 0.030240927 -0.093071938 0.3689684
		 0.057521589 -0.079171598 0.3689684 0.079171613 -0.057521582 0.3689684 0.09307196 -0.030240893 0.3689684
		 0.097861677 0 0.3689684 0.13555154 0.044043362 0.36311832 0.11530685 0.083775342 0.36311826
		 0.083775379 0.11530674 0.36311826 0.04404334 0.13555151 0.36311826 -8.9257113e-10 0.14252722 0.36311829
		 -0.044043366 0.13555151 0.36311829 -0.083775312 0.11530674 0.36311826 -0.11530671 0.083775342 0.36311826
		 -0.13555145 0.044043303 0.36311826 -0.14252721 0 0.36311829 -0.13555145 -0.044043303 0.36311832
		 -0.11530671 -0.083775282 0.36311829 -0.083775312 -0.11530662 0.36311829 -0.044043355 -0.13555145 0.36311826
		 -5.1401896e-09 -0.14252716 0.36311829 0.04404334 -0.13555139 0.36311826 0.083775282 -0.11530662 0.36311829
		 0.11530668 -0.083775282 0.36311829 0.13555142 -0.044043303 0.36311832 0.14252718 0 0.36311829
		 0.063688532 0.19601315 0.43427074 0.12114277 0.16673875 0.4342708 0.16673875 0.12114275 0.4342708
		 0.19601314 0.063688517 0.4342708 0.20610027 0 0.4342708 0.19601308 -0.063688517 0.4342708
		 0.16673864 -0.12114275 0.4342708 0.1211427 -0.16673863 0.4342708 0.063688494 -0.19601309 0.4342708
		 -2.8391702e-09 -0.20610023 0.4342708 -0.063688509 -0.19601309 0.4342708;
	setAttr ".vt[332:340]" -0.12114273 -0.16673863 0.4342708 -0.16673867 -0.12114275 0.4342708
		 -0.19601314 -0.063688517 0.4342708 -0.20610031 0 0.4342708 -0.19601314 0.063688457 0.4342708
		 -0.16673869 0.12114275 0.4342708 -0.12114275 0.16673869 0.4342708 -0.063688524 0.19601315 0.43427074
		 3.3030985e-09 0.20610034 0.4342708;
	setAttr -s 680 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 4 1 4 5 1 5 6 1 6 7 1 7 8 1 8 9 1
		 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 0 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 30 31 1
		 31 32 1 32 33 1 33 34 1 34 35 1 35 36 1 36 37 1 37 38 1 38 39 1 39 20 1 40 41 1 41 42 1
		 42 43 1 43 44 1 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 49 50 1 50 51 1 51 52 1 52 53 1
		 53 54 1 54 55 1 55 56 1 56 57 1 57 58 1 58 59 1 59 40 1 60 61 1 61 62 1 62 63 1 63 64 1
		 64 65 1 65 66 1 66 67 1 67 68 1 68 69 1 69 70 1 70 71 1 71 72 1 72 73 1 73 74 1 74 75 1
		 75 76 1 76 77 1 77 78 1 78 79 1 79 60 1 80 81 1 81 82 1 82 83 1 83 84 1 84 85 1 85 86 1
		 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1 94 95 1 95 96 1 96 97 1
		 97 98 1 98 99 1 99 80 1 100 101 1 101 102 1 102 103 1 103 104 1 104 105 1 105 106 1
		 106 107 1 107 108 1 108 109 1 109 110 1 110 111 1 111 112 1 112 113 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 100 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 127 128 1 128 129 1 129 130 1 130 131 1 131 132 1 132 133 1
		 133 134 1 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 120 1 140 141 1 141 142 1
		 142 143 1 143 144 1 144 145 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1
		 151 152 1 152 153 1 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 159 140 1
		 160 161 0 161 162 0 162 163 0 163 164 0 164 165 0 165 166 0;
	setAttr ".ed[166:331]" 166 167 0 167 168 0 168 169 0 169 170 0 170 171 0 171 172 0
		 172 173 0 173 174 0 174 175 0 175 176 0 176 177 0 177 178 0 178 179 0 179 160 0 0 20 1
		 1 21 1 2 22 1 3 23 1 4 24 1 5 25 1 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1
		 13 33 1 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 20 40 1 21 41 1 22 42 1 23 43 1
		 24 44 1 25 45 1 26 46 1 27 47 1 28 48 1 29 49 1 30 50 1 31 51 1 32 52 1 33 53 1 34 54 1
		 35 55 1 36 56 1 37 57 1 38 58 1 39 59 1 40 60 1 41 61 1 42 62 1 43 63 1 44 64 1 45 65 1
		 46 66 1 47 67 1 48 68 1 49 69 1 50 70 1 51 71 1 52 72 1 53 73 1 54 74 1 55 75 1 56 76 1
		 57 77 1 58 78 1 59 79 1 60 80 1 61 81 1 62 82 1 63 83 1 64 84 1 65 85 1 66 86 1 67 87 1
		 68 88 1 69 89 1 70 90 1 71 91 1 72 92 1 73 93 1 74 94 1 75 95 1 76 96 1 77 97 1 78 98 1
		 79 99 1 80 100 1 81 101 1 82 102 1 83 103 1 84 104 1 85 105 1 86 106 1 87 107 1 88 108 1
		 89 109 1 90 110 1 91 111 1 92 112 1 93 113 1 94 114 1 95 115 1 96 116 1 97 117 1
		 98 118 1 99 119 1 100 120 1 101 121 1 102 122 1 103 123 1 104 124 1 105 125 1 106 126 1
		 107 127 1 108 128 1 109 129 1 110 130 1 111 131 1 112 132 1 113 133 1 114 134 1 115 135 1
		 116 136 1 117 137 1 118 138 1 119 139 1 120 140 1 121 141 1 122 142 1 123 143 1 124 144 1
		 125 145 1 126 146 1 127 147 1 128 148 1 129 149 1 130 150 1 131 151 1 132 152 1 133 153 1
		 134 154 1 135 155 1 136 156 1 137 157 1 138 158 1 139 159 1 140 324 1 141 323 1 142 322 1
		 143 321 1 144 340 1 145 339 1 146 338 1 147 337 1 148 336 1 149 335 1 150 334 1 151 333 1;
	setAttr ".ed[332:497]" 152 332 1 153 331 1 154 330 1 155 329 1 156 328 1 157 327 1
		 158 326 1 159 325 1 180 0 1 180 1 1 180 2 1 180 3 1 180 4 1 180 5 1 180 6 1 180 7 1
		 180 8 1 180 9 1 180 10 1 180 11 1 180 12 1 180 13 1 180 14 1 180 15 1 180 16 1 180 17 1
		 180 18 1 180 19 1 160 181 0 161 182 0 181 182 0 162 183 0 182 183 0 163 184 0 183 184 0
		 164 185 0 184 185 0 165 186 0 185 186 0 166 187 0 186 187 0 167 188 0 187 188 0 168 189 0
		 188 189 0 169 190 0 189 190 0 170 191 0 190 191 0 171 192 0 191 192 0 172 193 0 192 193 0
		 173 194 0 193 194 0 174 195 0 194 195 0 175 196 0 195 196 0 176 197 0 196 197 0 177 198 0
		 197 198 0 178 199 0 198 199 0 179 200 0 199 200 0 200 181 0 181 201 0 182 202 0 201 202 0
		 183 203 0 202 203 0 184 204 0 203 204 0 185 205 0 204 205 0 186 206 0 205 206 0 187 207 0
		 206 207 0 188 208 0 207 208 0 189 209 0 208 209 0 190 210 0 209 210 0 191 211 0 210 211 0
		 192 212 0 211 212 0 193 213 0 212 213 0 194 214 0 213 214 0 195 215 0 214 215 0 196 216 0
		 215 216 0 197 217 0 216 217 0 198 218 0 217 218 0 199 219 0 218 219 0 200 220 0 219 220 0
		 220 201 0 201 221 0 202 222 0 221 222 0 203 223 0 222 223 0 204 224 0 223 224 0 205 225 0
		 224 225 0 206 226 0 225 226 0 207 227 0 226 227 0 208 228 0 227 228 0 209 229 0 228 229 0
		 210 230 0 229 230 0 211 231 0 230 231 0 212 232 0 231 232 0 213 233 0 232 233 0 214 234 0
		 233 234 0 215 235 0 234 235 0 216 236 0 235 236 0 217 237 0 236 237 0 218 238 0 237 238 0
		 219 239 0 238 239 0 220 240 0 239 240 0 240 221 0 221 241 0 222 242 0 241 242 0 223 243 0
		 242 243 0 224 244 0 243 244 0 225 245 0 244 245 0 226 246 0 245 246 0 227 247 0 246 247 0
		 228 248 0 247 248 0 229 249 0 248 249 0 230 250 0;
	setAttr ".ed[498:663]" 249 250 0 231 251 0 250 251 0 232 252 0 251 252 0 233 253 0
		 252 253 0 234 254 0 253 254 0 235 255 0 254 255 0 236 256 0 255 256 0 237 257 0 256 257 0
		 238 258 0 257 258 0 239 259 0 258 259 0 240 260 0 259 260 0 260 241 0 241 261 0 242 262 0
		 261 262 0 243 263 0 262 263 0 244 264 0 263 264 0 245 265 0 264 265 0 246 266 0 265 266 0
		 247 267 0 266 267 0 248 268 0 267 268 0 249 269 0 268 269 0 250 270 0 269 270 0 251 271 0
		 270 271 0 252 272 0 271 272 0 253 273 0 272 273 0 254 274 0 273 274 0 255 275 0 274 275 0
		 256 276 0 275 276 0 257 277 0 276 277 0 258 278 0 277 278 0 259 279 0 278 279 0 260 280 0
		 279 280 0 280 261 0 261 281 0 262 282 0 281 282 0 263 283 0 282 283 0 264 284 0 283 284 0
		 265 285 0 284 285 0 266 286 0 285 286 0 267 287 0 286 287 0 268 288 0 287 288 0 269 289 0
		 288 289 0 270 290 0 289 290 0 271 291 0 290 291 0 272 292 0 291 292 0 273 293 0 292 293 0
		 274 294 0 293 294 0 275 295 0 294 295 0 276 296 0 295 296 0 277 297 0 296 297 0 278 298 0
		 297 298 0 279 299 0 298 299 0 280 300 0 299 300 0 300 281 0 281 301 0 282 302 0 301 302 0
		 283 303 0 302 303 0 284 304 0 303 304 0 285 305 0 304 305 0 286 306 0 305 306 0 287 307 0
		 306 307 0 288 308 0 307 308 0 289 309 0 308 309 0 290 310 0 309 310 0 291 311 0 310 311 0
		 292 312 0 311 312 0 293 313 0 312 313 0 294 314 0 313 314 0 295 315 0 314 315 0 296 316 0
		 315 316 0 297 317 0 316 317 0 298 318 0 317 318 0 299 319 0 318 319 0 300 320 0 319 320 0
		 320 301 0 321 163 1 322 162 1 321 322 1 323 161 1 322 323 1 324 160 1 323 324 1 325 179 1
		 324 325 1 326 178 1 325 326 1 327 177 1 326 327 1 328 176 1 327 328 1 329 175 1 328 329 1
		 330 174 1 329 330 1 331 173 1 330 331 1 332 172 1 331 332 1 333 171 1;
	setAttr ".ed[664:679]" 332 333 1 334 170 1 333 334 1 335 169 1 334 335 1 336 168 1
		 335 336 1 337 167 1 336 337 1 338 166 1 337 338 1 339 165 1 338 339 1 340 164 1 339 340 1
		 340 321 1;
	setAttr -s 340 -ch 1340 ".fc[0:339]" -type "polyFaces" 
		f 3 -1 -341 341
		mu 0 3 1 0 188
		f 3 -2 -342 342
		mu 0 3 2 1 189
		f 3 -3 -343 343
		mu 0 3 3 2 190
		f 3 -4 -344 344
		mu 0 3 4 3 191
		f 3 -5 -345 345
		mu 0 3 5 4 192
		f 3 -6 -346 346
		mu 0 3 6 5 193
		f 3 -7 -347 347
		mu 0 3 7 6 194
		f 3 -8 -348 348
		mu 0 3 8 7 195
		f 3 -9 -349 349
		mu 0 3 9 8 196
		f 3 -10 -350 350
		mu 0 3 10 9 197
		f 3 -11 -351 351
		mu 0 3 11 10 198
		f 3 -12 -352 352
		mu 0 3 12 11 199
		f 3 -13 -353 353
		mu 0 3 13 12 200
		f 3 -14 -354 354
		mu 0 3 14 13 201
		f 3 -15 -355 355
		mu 0 3 15 14 202
		f 3 -16 -356 356
		mu 0 3 16 15 203
		f 3 -17 -357 357
		mu 0 3 17 16 204
		f 3 -18 -358 358
		mu 0 3 18 17 205
		f 3 -19 -359 359
		mu 0 3 19 18 206
		f 3 -20 -360 340
		mu 0 3 20 19 207
		f 4 181 -21 -181 0
		mu 0 4 1 22 21 0
		f 4 182 -22 -182 1
		mu 0 4 2 23 22 1
		f 4 183 -23 -183 2
		mu 0 4 3 24 23 2
		f 4 184 -24 -184 3
		mu 0 4 4 25 24 3
		f 4 185 -25 -185 4
		mu 0 4 5 26 25 4
		f 4 186 -26 -186 5
		mu 0 4 6 27 26 5
		f 4 187 -27 -187 6
		mu 0 4 7 28 27 6
		f 4 188 -28 -188 7
		mu 0 4 8 29 28 7
		f 4 189 -29 -189 8
		mu 0 4 9 30 29 8
		f 4 190 -30 -190 9
		mu 0 4 10 31 30 9
		f 4 191 -31 -191 10
		mu 0 4 11 32 31 10
		f 4 192 -32 -192 11
		mu 0 4 12 33 32 11
		f 4 193 -33 -193 12
		mu 0 4 13 34 33 12
		f 4 194 -34 -194 13
		mu 0 4 14 35 34 13
		f 4 195 -35 -195 14
		mu 0 4 15 36 35 14
		f 4 196 -36 -196 15
		mu 0 4 16 37 36 15
		f 4 197 -37 -197 16
		mu 0 4 17 38 37 16
		f 4 198 -38 -198 17
		mu 0 4 18 39 38 17
		f 4 199 -39 -199 18
		mu 0 4 19 40 39 18
		f 4 180 -40 -200 19
		mu 0 4 20 41 40 19
		f 4 201 -41 -201 20
		mu 0 4 22 43 42 21
		f 4 202 -42 -202 21
		mu 0 4 23 44 43 22
		f 4 203 -43 -203 22
		mu 0 4 24 45 44 23
		f 4 204 -44 -204 23
		mu 0 4 25 46 45 24
		f 4 205 -45 -205 24
		mu 0 4 26 47 46 25
		f 4 206 -46 -206 25
		mu 0 4 27 48 47 26
		f 4 207 -47 -207 26
		mu 0 4 28 49 48 27
		f 4 208 -48 -208 27
		mu 0 4 29 50 49 28
		f 4 209 -49 -209 28
		mu 0 4 30 51 50 29
		f 4 210 -50 -210 29
		mu 0 4 31 52 51 30
		f 4 211 -51 -211 30
		mu 0 4 32 53 52 31
		f 4 212 -52 -212 31
		mu 0 4 33 54 53 32
		f 4 213 -53 -213 32
		mu 0 4 34 55 54 33
		f 4 214 -54 -214 33
		mu 0 4 35 56 55 34
		f 4 215 -55 -215 34
		mu 0 4 36 57 56 35
		f 4 216 -56 -216 35
		mu 0 4 37 58 57 36
		f 4 217 -57 -217 36
		mu 0 4 38 59 58 37
		f 4 218 -58 -218 37
		mu 0 4 39 60 59 38
		f 4 219 -59 -219 38
		mu 0 4 40 61 60 39
		f 4 200 -60 -220 39
		mu 0 4 41 62 61 40
		f 4 221 -61 -221 40
		mu 0 4 43 64 63 42
		f 4 222 -62 -222 41
		mu 0 4 44 65 64 43
		f 4 223 -63 -223 42
		mu 0 4 45 66 65 44
		f 4 224 -64 -224 43
		mu 0 4 46 67 66 45
		f 4 225 -65 -225 44
		mu 0 4 47 68 67 46
		f 4 226 -66 -226 45
		mu 0 4 48 69 68 47
		f 4 227 -67 -227 46
		mu 0 4 49 70 69 48
		f 4 228 -68 -228 47
		mu 0 4 50 71 70 49
		f 4 229 -69 -229 48
		mu 0 4 51 72 71 50
		f 4 230 -70 -230 49
		mu 0 4 52 73 72 51
		f 4 231 -71 -231 50
		mu 0 4 53 74 73 52
		f 4 232 -72 -232 51
		mu 0 4 54 75 74 53
		f 4 233 -73 -233 52
		mu 0 4 55 76 75 54
		f 4 234 -74 -234 53
		mu 0 4 56 77 76 55
		f 4 235 -75 -235 54
		mu 0 4 57 78 77 56
		f 4 236 -76 -236 55
		mu 0 4 58 79 78 57
		f 4 237 -77 -237 56
		mu 0 4 59 80 79 58
		f 4 238 -78 -238 57
		mu 0 4 60 81 80 59
		f 4 239 -79 -239 58
		mu 0 4 61 82 81 60
		f 4 220 -80 -240 59
		mu 0 4 62 83 82 61
		f 4 241 -81 -241 60
		mu 0 4 64 85 84 63
		f 4 242 -82 -242 61
		mu 0 4 65 86 85 64
		f 4 243 -83 -243 62
		mu 0 4 66 87 86 65
		f 4 244 -84 -244 63
		mu 0 4 67 88 87 66
		f 4 245 -85 -245 64
		mu 0 4 68 89 88 67
		f 4 246 -86 -246 65
		mu 0 4 69 90 89 68
		f 4 247 -87 -247 66
		mu 0 4 70 91 90 69
		f 4 248 -88 -248 67
		mu 0 4 71 92 91 70
		f 4 249 -89 -249 68
		mu 0 4 72 93 92 71
		f 4 250 -90 -250 69
		mu 0 4 73 94 93 72
		f 4 251 -91 -251 70
		mu 0 4 74 95 94 73
		f 4 252 -92 -252 71
		mu 0 4 75 96 95 74
		f 4 253 -93 -253 72
		mu 0 4 76 97 96 75
		f 4 254 -94 -254 73
		mu 0 4 77 98 97 76
		f 4 255 -95 -255 74
		mu 0 4 78 99 98 77
		f 4 256 -96 -256 75
		mu 0 4 79 100 99 78
		f 4 257 -97 -257 76
		mu 0 4 80 101 100 79
		f 4 258 -98 -258 77
		mu 0 4 81 102 101 80
		f 4 259 -99 -259 78
		mu 0 4 82 103 102 81
		f 4 240 -100 -260 79
		mu 0 4 83 104 103 82
		f 4 261 -101 -261 80
		mu 0 4 85 106 105 84
		f 4 262 -102 -262 81
		mu 0 4 86 107 106 85
		f 4 263 -103 -263 82
		mu 0 4 87 108 107 86
		f 4 264 -104 -264 83
		mu 0 4 88 109 108 87
		f 4 265 -105 -265 84
		mu 0 4 89 110 109 88
		f 4 266 -106 -266 85
		mu 0 4 90 111 110 89
		f 4 267 -107 -267 86
		mu 0 4 91 112 111 90
		f 4 268 -108 -268 87
		mu 0 4 92 113 112 91
		f 4 269 -109 -269 88
		mu 0 4 93 114 113 92
		f 4 270 -110 -270 89
		mu 0 4 94 115 114 93
		f 4 271 -111 -271 90
		mu 0 4 95 116 115 94
		f 4 272 -112 -272 91
		mu 0 4 96 117 116 95
		f 4 273 -113 -273 92
		mu 0 4 97 118 117 96
		f 4 274 -114 -274 93
		mu 0 4 98 119 118 97
		f 4 275 -115 -275 94
		mu 0 4 99 120 119 98
		f 4 276 -116 -276 95
		mu 0 4 100 121 120 99
		f 4 277 -117 -277 96
		mu 0 4 101 122 121 100
		f 4 278 -118 -278 97
		mu 0 4 102 123 122 101
		f 4 279 -119 -279 98
		mu 0 4 103 124 123 102
		f 4 260 -120 -280 99
		mu 0 4 104 125 124 103
		f 4 281 -121 -281 100
		mu 0 4 106 127 126 105
		f 4 282 -122 -282 101
		mu 0 4 107 128 127 106
		f 4 283 -123 -283 102
		mu 0 4 108 129 128 107
		f 4 284 -124 -284 103
		mu 0 4 109 130 129 108
		f 4 285 -125 -285 104
		mu 0 4 110 131 130 109
		f 4 286 -126 -286 105
		mu 0 4 111 132 131 110
		f 4 287 -127 -287 106
		mu 0 4 112 133 132 111
		f 4 288 -128 -288 107
		mu 0 4 113 134 133 112
		f 4 289 -129 -289 108
		mu 0 4 114 135 134 113
		f 4 290 -130 -290 109
		mu 0 4 115 136 135 114
		f 4 291 -131 -291 110
		mu 0 4 116 137 136 115
		f 4 292 -132 -292 111
		mu 0 4 117 138 137 116
		f 4 293 -133 -293 112
		mu 0 4 118 139 138 117
		f 4 294 -134 -294 113
		mu 0 4 119 140 139 118
		f 4 295 -135 -295 114
		mu 0 4 120 141 140 119
		f 4 296 -136 -296 115
		mu 0 4 121 142 141 120
		f 4 297 -137 -297 116
		mu 0 4 122 143 142 121
		f 4 298 -138 -298 117
		mu 0 4 123 144 143 122
		f 4 299 -139 -299 118
		mu 0 4 124 145 144 123
		f 4 280 -140 -300 119
		mu 0 4 125 146 145 124
		f 4 301 -141 -301 120
		mu 0 4 127 148 147 126
		f 4 302 -142 -302 121
		mu 0 4 128 149 148 127
		f 4 303 -143 -303 122
		mu 0 4 129 150 149 128
		f 4 304 -144 -304 123
		mu 0 4 130 151 150 129
		f 4 305 -145 -305 124
		mu 0 4 131 152 151 130
		f 4 306 -146 -306 125
		mu 0 4 132 153 152 131
		f 4 307 -147 -307 126
		mu 0 4 133 154 153 132
		f 4 308 -148 -308 127
		mu 0 4 134 155 154 133
		f 4 309 -149 -309 128
		mu 0 4 135 156 155 134
		f 4 310 -150 -310 129
		mu 0 4 136 157 156 135
		f 4 311 -151 -311 130
		mu 0 4 137 158 157 136
		f 4 312 -152 -312 131
		mu 0 4 138 159 158 137
		f 4 313 -153 -313 132
		mu 0 4 139 160 159 138
		f 4 314 -154 -314 133
		mu 0 4 140 161 160 139
		f 4 315 -155 -315 134
		mu 0 4 141 162 161 140
		f 4 316 -156 -316 135
		mu 0 4 142 163 162 141
		f 4 317 -157 -317 136
		mu 0 4 143 164 163 142
		f 4 318 -158 -318 137
		mu 0 4 144 165 164 143
		f 4 319 -159 -319 138
		mu 0 4 145 166 165 144
		f 4 300 -160 -320 139
		mu 0 4 146 167 166 145
		f 4 321 646 -321 140
		mu 0 4 148 350 352 147
		f 4 322 644 -322 141
		mu 0 4 149 349 350 148
		f 4 323 642 -323 142
		mu 0 4 150 348 349 149
		f 4 324 679 -324 143
		mu 0 4 151 368 348 150
		f 4 325 678 -325 144
		mu 0 4 152 367 368 151
		f 4 326 676 -326 145
		mu 0 4 153 366 367 152
		f 4 327 674 -327 146
		mu 0 4 154 365 366 153
		f 4 328 672 -328 147
		mu 0 4 155 364 365 154
		f 4 329 670 -329 148
		mu 0 4 156 363 364 155
		f 4 330 668 -330 149
		mu 0 4 157 362 363 156
		f 4 331 666 -331 150
		mu 0 4 158 361 362 157
		f 4 332 664 -332 151
		mu 0 4 159 360 361 158
		f 4 333 662 -333 152
		mu 0 4 160 359 360 159
		f 4 334 660 -334 153
		mu 0 4 161 358 359 160
		f 4 335 658 -335 154
		mu 0 4 162 357 358 161
		f 4 336 656 -336 155
		mu 0 4 163 356 357 162
		f 4 337 654 -337 156
		mu 0 4 164 355 356 163
		f 4 338 652 -338 157
		mu 0 4 165 354 355 164
		f 4 339 650 -339 158
		mu 0 4 166 353 354 165
		f 4 320 648 -340 159
		mu 0 4 167 351 353 166
		f 4 160 361 -363 -361
		mu 0 4 371 169 208 209
		f 4 161 363 -365 -362
		mu 0 4 169 170 210 208
		f 4 162 365 -367 -364
		mu 0 4 170 171 211 210
		f 4 163 367 -369 -366
		mu 0 4 171 172 212 211
		f 4 164 369 -371 -368
		mu 0 4 172 173 213 212
		f 4 165 371 -373 -370
		mu 0 4 173 174 214 213
		f 4 166 373 -375 -372
		mu 0 4 174 175 215 214
		f 4 167 375 -377 -374
		mu 0 4 175 176 216 215
		f 4 168 377 -379 -376
		mu 0 4 176 177 217 216
		f 4 169 379 -381 -378
		mu 0 4 177 178 218 217
		f 4 170 381 -383 -380
		mu 0 4 178 179 219 218
		f 4 171 383 -385 -382
		mu 0 4 179 180 220 219
		f 4 172 385 -387 -384
		mu 0 4 180 181 221 220
		f 4 173 387 -389 -386
		mu 0 4 181 182 222 221
		f 4 174 389 -391 -388
		mu 0 4 182 183 223 222
		f 4 175 391 -393 -390
		mu 0 4 183 184 224 223
		f 4 176 393 -395 -392
		mu 0 4 184 185 225 224
		f 4 177 395 -397 -394
		mu 0 4 185 186 226 225
		f 4 178 397 -399 -396
		mu 0 4 186 187 227 226
		f 4 179 360 -400 -398
		mu 0 4 187 168 370 227
		f 4 401 -403 -401 362
		mu 0 4 208 228 229 209
		f 4 403 -405 -402 364
		mu 0 4 210 230 228 208
		f 4 405 -407 -404 366
		mu 0 4 211 231 230 210
		f 4 407 -409 -406 368
		mu 0 4 212 232 231 211
		f 4 409 -411 -408 370
		mu 0 4 213 233 232 212
		f 4 411 -413 -410 372
		mu 0 4 214 234 233 213
		f 4 413 -415 -412 374
		mu 0 4 215 235 234 214
		f 4 415 -417 -414 376
		mu 0 4 216 236 235 215
		f 4 417 -419 -416 378
		mu 0 4 217 237 236 216
		f 4 419 -421 -418 380
		mu 0 4 218 238 237 217
		f 4 421 -423 -420 382
		mu 0 4 219 239 238 218
		f 4 423 -425 -422 384
		mu 0 4 220 240 239 219
		f 4 425 -427 -424 386
		mu 0 4 221 241 240 220
		f 4 427 -429 -426 388
		mu 0 4 222 242 241 221
		f 4 429 -431 -428 390
		mu 0 4 223 243 242 222
		f 4 431 -433 -430 392
		mu 0 4 224 244 243 223
		f 4 433 -435 -432 394
		mu 0 4 225 245 244 224
		f 4 435 -437 -434 396
		mu 0 4 226 246 245 225
		f 4 437 -439 -436 398
		mu 0 4 227 247 246 226
		f 4 400 -440 -438 399
		mu 0 4 370 369 247 227
		f 4 402 441 -443 -441
		mu 0 4 229 228 248 249
		f 4 404 443 -445 -442
		mu 0 4 228 230 250 248
		f 4 406 445 -447 -444
		mu 0 4 230 231 251 250
		f 4 408 447 -449 -446
		mu 0 4 231 232 252 251
		f 4 410 449 -451 -448
		mu 0 4 232 233 253 252
		f 4 412 451 -453 -450
		mu 0 4 233 234 254 253
		f 4 414 453 -455 -452
		mu 0 4 234 235 255 254
		f 4 416 455 -457 -454
		mu 0 4 235 236 256 255
		f 4 418 457 -459 -456
		mu 0 4 236 237 257 256
		f 4 420 459 -461 -458
		mu 0 4 237 238 258 257
		f 4 422 461 -463 -460
		mu 0 4 238 239 259 258
		f 4 424 463 -465 -462
		mu 0 4 239 240 260 259
		f 4 426 465 -467 -464
		mu 0 4 240 241 261 260
		f 4 428 467 -469 -466
		mu 0 4 241 242 262 261
		f 4 430 469 -471 -468
		mu 0 4 242 243 263 262
		f 4 432 471 -473 -470
		mu 0 4 243 244 264 263
		f 4 434 473 -475 -472
		mu 0 4 244 245 265 264
		f 4 436 475 -477 -474
		mu 0 4 245 246 266 265
		f 4 438 477 -479 -476
		mu 0 4 246 247 267 266
		f 4 439 440 -480 -478
		mu 0 4 247 369 376 267
		f 4 442 481 -483 -481
		mu 0 4 249 248 268 269
		f 4 444 483 -485 -482
		mu 0 4 248 250 270 268
		f 4 446 485 -487 -484
		mu 0 4 250 251 271 270
		f 4 448 487 -489 -486
		mu 0 4 251 252 272 271
		f 4 450 489 -491 -488
		mu 0 4 252 253 273 272
		f 4 452 491 -493 -490
		mu 0 4 253 254 274 273
		f 4 454 493 -495 -492
		mu 0 4 254 255 275 274
		f 4 456 495 -497 -494
		mu 0 4 255 256 276 275
		f 4 458 497 -499 -496
		mu 0 4 256 257 277 276
		f 4 460 499 -501 -498
		mu 0 4 257 258 278 277
		f 4 462 501 -503 -500
		mu 0 4 258 259 279 278
		f 4 464 503 -505 -502
		mu 0 4 259 260 280 279
		f 4 466 505 -507 -504
		mu 0 4 260 261 281 280
		f 4 468 507 -509 -506
		mu 0 4 261 262 282 281
		f 4 470 509 -511 -508
		mu 0 4 262 263 283 282
		f 4 472 511 -513 -510
		mu 0 4 263 264 284 283
		f 4 474 513 -515 -512
		mu 0 4 264 265 285 284
		f 4 476 515 -517 -514
		mu 0 4 265 266 286 285
		f 4 478 517 -519 -516
		mu 0 4 266 267 287 286
		f 4 479 480 -520 -518
		mu 0 4 267 376 375 287
		f 4 482 521 -523 -521
		mu 0 4 269 268 288 289
		f 4 484 523 -525 -522
		mu 0 4 268 270 290 288
		f 4 486 525 -527 -524
		mu 0 4 270 271 291 290
		f 4 488 527 -529 -526
		mu 0 4 271 272 292 291
		f 4 490 529 -531 -528
		mu 0 4 272 273 293 292
		f 4 492 531 -533 -530
		mu 0 4 273 274 294 293
		f 4 494 533 -535 -532
		mu 0 4 274 275 295 294
		f 4 496 535 -537 -534
		mu 0 4 275 276 296 295
		f 4 498 537 -539 -536
		mu 0 4 276 277 297 296
		f 4 500 539 -541 -538
		mu 0 4 277 278 298 297
		f 4 502 541 -543 -540
		mu 0 4 278 279 299 298
		f 4 504 543 -545 -542
		mu 0 4 279 280 300 299
		f 4 506 545 -547 -544
		mu 0 4 280 281 301 300
		f 4 508 547 -549 -546
		mu 0 4 281 282 302 301
		f 4 510 549 -551 -548
		mu 0 4 282 283 303 302
		f 4 512 551 -553 -550
		mu 0 4 283 284 304 303
		f 4 514 553 -555 -552
		mu 0 4 284 285 305 304
		f 4 516 555 -557 -554
		mu 0 4 285 286 306 305
		f 4 518 557 -559 -556
		mu 0 4 286 287 307 306
		f 4 519 520 -560 -558
		mu 0 4 287 375 374 307
		f 4 522 561 -563 -561
		mu 0 4 289 288 308 309
		f 4 524 563 -565 -562
		mu 0 4 288 290 310 308
		f 4 526 565 -567 -564
		mu 0 4 290 291 311 310
		f 4 528 567 -569 -566
		mu 0 4 291 292 312 311
		f 4 530 569 -571 -568
		mu 0 4 292 293 313 312
		f 4 532 571 -573 -570
		mu 0 4 293 294 314 313
		f 4 534 573 -575 -572
		mu 0 4 294 295 315 314
		f 4 536 575 -577 -574
		mu 0 4 295 296 316 315
		f 4 538 577 -579 -576
		mu 0 4 296 297 317 316
		f 4 540 579 -581 -578
		mu 0 4 297 298 318 317
		f 4 542 581 -583 -580
		mu 0 4 298 299 319 318
		f 4 544 583 -585 -582
		mu 0 4 299 300 320 319
		f 4 546 585 -587 -584
		mu 0 4 300 301 321 320
		f 4 548 587 -589 -586
		mu 0 4 301 302 322 321
		f 4 550 589 -591 -588
		mu 0 4 302 303 323 322
		f 4 552 591 -593 -590
		mu 0 4 303 304 324 323
		f 4 554 593 -595 -592
		mu 0 4 304 305 325 324
		f 4 556 595 -597 -594
		mu 0 4 305 306 326 325
		f 4 558 597 -599 -596
		mu 0 4 306 307 327 326
		f 4 559 560 -600 -598
		mu 0 4 307 374 372 327
		f 4 562 601 -603 -601
		mu 0 4 309 308 328 329
		f 4 564 603 -605 -602
		mu 0 4 308 310 330 328
		f 4 566 605 -607 -604
		mu 0 4 310 311 331 330
		f 4 568 607 -609 -606
		mu 0 4 311 312 332 331
		f 4 570 609 -611 -608
		mu 0 4 312 313 333 332
		f 4 572 611 -613 -610
		mu 0 4 313 314 334 333
		f 4 574 613 -615 -612
		mu 0 4 314 315 335 334
		f 4 576 615 -617 -614
		mu 0 4 315 316 336 335
		f 4 578 617 -619 -616
		mu 0 4 316 317 337 336
		f 4 580 619 -621 -618
		mu 0 4 317 318 338 337
		f 4 582 621 -623 -620
		mu 0 4 318 319 339 338
		f 4 584 623 -625 -622
		mu 0 4 319 320 340 339
		f 4 586 625 -627 -624
		mu 0 4 320 321 341 340
		f 4 588 627 -629 -626
		mu 0 4 321 322 342 341
		f 4 590 629 -631 -628
		mu 0 4 322 323 343 342
		f 4 592 631 -633 -630
		mu 0 4 323 324 344 343
		f 4 594 633 -635 -632
		mu 0 4 324 325 345 344
		f 4 596 635 -637 -634
		mu 0 4 325 326 346 345
		f 4 598 637 -639 -636
		mu 0 4 326 327 347 346
		f 4 599 600 -640 -638
		mu 0 4 327 372 373 347
		f 4 -643 640 -163 -642
		mu 0 4 349 348 171 170
		f 4 -645 641 -162 -644
		mu 0 4 350 349 170 169
		f 4 -647 643 -161 -646
		mu 0 4 352 350 169 371
		f 4 -649 645 -180 -648
		mu 0 4 353 351 168 187
		f 4 -651 647 -179 -650
		mu 0 4 354 353 187 186
		f 4 -653 649 -178 -652
		mu 0 4 355 354 186 185
		f 4 -655 651 -177 -654
		mu 0 4 356 355 185 184
		f 4 -657 653 -176 -656
		mu 0 4 357 356 184 183
		f 4 -659 655 -175 -658
		mu 0 4 358 357 183 182
		f 4 -661 657 -174 -660
		mu 0 4 359 358 182 181
		f 4 -663 659 -173 -662
		mu 0 4 360 359 181 180
		f 4 -665 661 -172 -664
		mu 0 4 361 360 180 179
		f 4 -667 663 -171 -666
		mu 0 4 362 361 179 178
		f 4 -669 665 -170 -668
		mu 0 4 363 362 178 177
		f 4 -671 667 -169 -670
		mu 0 4 364 363 177 176
		f 4 -673 669 -168 -672
		mu 0 4 365 364 176 175
		f 4 -675 671 -167 -674
		mu 0 4 366 365 175 174
		f 4 -677 673 -166 -676
		mu 0 4 367 366 174 173
		f 4 -679 675 -165 -678
		mu 0 4 368 367 173 172
		f 4 -680 677 -164 -641
		mu 0 4 348 368 172 171;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode transform -n "r_pupil" -p "r_geo_group";
	rename -uid "A30ECF30-48C6-7D23-FCB7-90962FD22D2E";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -1.2417994799118759e-07 1.862347126513341e-07 0.0078996763500006582 ;
	setAttr ".rpt" -type "double3" 0 7.0596642358886658e-06 -3.3209195480360387e-09 ;
	setAttr ".sp" -type "double3" -1.2417994799118759e-07 1.8623471265133418e-07 0.0078996763500006617 ;
	setAttr ".spt" -type "double3" 0 -7.9409338805090622e-23 -3.4694469519536126e-18 ;
createNode mesh -n "r_pupilShape" -p "r_pupil";
	rename -uid "68461626-4E56-ACDE-047F-C48D8600268E";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 22.5 8.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "r_pupilShapeOrig" -p "r_pupil";
	rename -uid "DE6CA112-432D-C208-F641-8FB1125ED58E";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 22.5 8.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 100 ".uvst[0].uvsp[0:99]" -type "float2" 21 -1 21 0 21 1 21
		 2 21 3 21 4 21 5 21 6 21 7 21 8 21 9 21 10 21 11 21 12 21 13 21 14 21 15 21 16 21
		 17 21 18 22 -1 22 0 22 1 22 2 22 3 22 4 22 5 22 6 22 7 22 8 22 9 22 10 22 11 22 12
		 22 13 22 14 22 15 22 16 22 17 22 18 23 -1 23 0 23 1 23 2 23 3 23 4 23 5 23 6 23 7
		 23 8 23 9 23 10 23 11 23 12 23 13 23 14 23 15 23 16 23 17 23 18 23.66666603 -1 23.66666603
		 0 23.66666603 1 23.66666603 2 23.66666603 3 23.66666603 4 23.66666603 5 23.66666603
		 6 23.66666603 7 23.66666603 8 23.66666603 9 23.66666603 10 23.66666603 11 23.66666603
		 12 23.66666603 13 23.66666603 14 23.66666603 15 23.66666603 16 23.66666603 17 23.66666603
		 18 24 -1 24 0 24 1 24 2 24 3 24 4 24 5 24 6 24 7 24 8 24 9 24 10 24 11 24 12 24 13
		 24 14 24 15 24 16 24 17 24 18;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 100 ".pt[0:99]" -type "float3"  -0.038534436 -0.012515453 
		-0.23385845 -0.040517241 3.0675503e-06 -0.23385845 -0.038534436 0.012521286 -0.23385845 
		-0.032780051 0.023814408 -0.23385845 -0.023815669 0.032777086 -0.23385851 -0.012520699 
		0.038530074 -0.23385845 -2.2710054e-16 0.04051318 -0.23385845 0.012520699 0.038530074 
		-0.23385845 0.023815669 0.032777086 -0.23385851 0.032780051 0.023814408 -0.23385845 
		0.038534436 0.012521286 -0.23385845 0.040517241 3.0675503e-06 -0.23385845 0.038534436 
		-0.012515453 -0.23385845 0.032780051 -0.02380868 -0.23385845 0.023815669 -0.032770477 
		-0.23385845 0.012520699 -0.038524307 -0.23385845 -2.2710054e-16 -0.04050719 -0.23385845 
		-0.012520699 -0.038524307 -0.23385845 -0.023815669 -0.032770477 -0.23385845 -0.032780051 
		-0.02380868 -0.23385845 -0.024297331 -0.0078901006 -0.24975888 -0.025547098 3.0675437e-06 
		-0.24975888 -0.024297331 0.0078961179 -0.24975888 -0.020667816 0.015016475 -0.24975888 
		-0.015015855 0.02066751 -0.24975888 -0.0078944461 0.024295162 -0.24975888 -2.2710054e-16 
		0.025545452 -0.24975888 0.0078944461 0.024295162 -0.24975888 0.015015855 0.02066751 
		-0.24975888 0.020667816 0.015016475 -0.24975888 0.024297331 0.0078961179 -0.24975888 
		0.025547098 3.0675437e-06 -0.24975888 0.024297331 -0.0078901006 -0.24975888 0.020667816 
		-0.015010419 -0.24975888 0.015015855 -0.020661095 -0.24975888 0.0078944461 -0.024289228 
		-0.24975888 -2.2710054e-16 -0.025539692 -0.24975888 -0.0078944461 -0.024289228 -0.24975888 
		-0.015015855 -0.020661095 -0.24975888 -0.020667816 -0.015010419 -0.24975888 -0.012254737 
		-0.0039779963 -0.25483409 -0.012885366 3.0675485e-06 -0.25483409 -0.012254737 0.0039841132 
		-0.25483409 -0.010424431 0.0075754868 -0.25483409 -0.0075738481 0.010425595 -0.25483409 
		-0.0039818082 0.012255363 -0.25483409 -2.2710054e-16 0.012885988 -0.25483409 0.0039818082 
		0.012255363 -0.25483409 0.0075738481 0.010425595 -0.25483409 0.010424431 0.0075754868 
		-0.25483409 0.012254737 0.0039841132 -0.25483409 0.012885366 3.0675485e-06 -0.25483409 
		0.012254737 -0.0039779963 -0.25483409 0.010424431 -0.0075693699 -0.25483409 0.0075738481 
		-0.010419384 -0.25483409 0.0039818082 -0.012249339 -0.25483409 -2.2710054e-16 -0.012880178 
		-0.25483409 -0.0039818082 -0.012249339 -0.25483409 -0.0075738481 -0.010419384 -0.25483409 
		-0.010424431 -0.0075693699 -0.25483409 -0.0040815677 -0.0013228599 -0.25667995 -0.0042915125 
		3.0675292e-06 -0.25667995 -0.0040815677 0.0013289925 -0.25667995 -0.003471924 0.0025250865 
		-0.25667995 -0.0025225396 0.0034743752 -0.25667995 -0.0013261634 0.0040837582 -0.25667995 
		-2.2710054e-16 0.0042938734 -0.25667995 0.0013261634 0.0040837582 -0.25667995 0.0025225396 
		0.0034743752 -0.25667995 0.003471924 0.0025250865 -0.25667995 0.0040815677 0.0013289925 
		-0.25667995 0.0042915125 3.0675292e-06 -0.25667995 0.0040815677 -0.0013228599 -0.25667995 
		0.003471924 -0.0025189617 -0.25667995 0.0025225396 -0.0034681908 -0.25667995 0.0013261634 
		-0.0040776152 -0.25667995 -2.2710054e-16 -0.0042877062 -0.25667995 -0.0013261634 
		-0.0040776152 -0.25667995 -0.0025225396 -0.0034681908 -0.25667995 -0.003471924 -0.0025189617 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995 -2.2710054e-16 3.0675292e-06 -0.25667995 -2.2710054e-16 3.0675292e-06 
		-0.25667995;
	setAttr -s 100 ".vt[0:99]"  0.24474537 0.07950756 0.98944354 0.25734052 -2.3948418e-11 0.98944354
		 0.24474537 -0.07950756 0.98944354 0.20819286 -0.15123236 0.98944354 0.15126096 -0.20815349 0.9894436
		 0.079522587 -0.24469912 0.98944354 1.4423887e-15 -0.25729185 0.98944354 -0.079522587 -0.24469912 0.98944354
		 -0.15126096 -0.20815349 0.9894436 -0.20819286 -0.15123236 0.98944354 -0.24474537 -0.07950756 0.98944354
		 -0.25734052 -2.3948418e-11 0.98944354 -0.24474537 0.07950756 0.98944354 -0.20819286 0.15123236 0.98944354
		 -0.15126096 0.2081535 0.98944354 -0.079522587 0.24469912 0.98944354 1.4423887e-15 0.25729185 0.98944354
		 0.079522587 0.24469912 0.98944354 0.15126096 0.2081535 0.98944354 0.20819286 0.15123236 0.98944354
		 0.15431596 0.050130814 1.031048179 0.1622574 -4.3084272e-11 1.031048179 0.15431596 -0.050130814 1.031048179
		 0.13126901 -0.095354483 1.031048179 0.095372505 -0.13124418 1.031048179 0.050140295 -0.1542868 1.031048179
		 1.4423887e-15 -0.16222674 1.031048179 -0.050140295 -0.1542868 1.031048179 -0.095372505 -0.13124418 1.031048179
		 -0.13126901 -0.095354483 1.031048179 -0.15431596 -0.050130814 1.031048179 -0.1622574 -4.3084272e-11 1.031048179
		 -0.15431596 0.050130814 1.031048179 -0.13126901 0.095354483 1.031048179 -0.095372505 0.13124418 1.031048179
		 -0.050140295 0.1542868 1.031048179 1.4423887e-15 0.16222674 1.031048179 0.050140295 0.1542868 1.031048179
		 0.095372505 0.13124418 1.031048179 0.13126901 0.095354483 1.031048179 0.077833511 0.025284858 1.04433465
		 0.081839003 -2.1862871e-11 1.04433465 0.077833511 -0.025284858 1.04433465 0.066209137 -0.048094656 1.04433465
		 0.048103753 -0.06619662 1.04433465 0.02528964 -0.077818796 1.04433465 1.4423887e-15 -0.081823528 1.04433465
		 -0.02528964 -0.077818796 1.04433465 -0.048103753 -0.06619662 1.04433465 -0.066209137 -0.048094656 1.04433465
		 -0.077833511 -0.025284858 1.04433465 -0.081839003 -2.1862871e-11 1.04433465 -0.077833511 0.025284858 1.04433465
		 -0.066209137 0.048094656 1.04433465 -0.048103753 0.06619662 1.04433465 -0.02528964 0.077818796 1.04433465
		 1.4423887e-15 0.081823528 1.04433465 0.02528964 0.077818796 1.04433465 0.048103753 0.06619662 1.04433465
		 0.066209137 0.048094656 1.04433465 0.02592317 0.0084213568 1.049166322 0.027257234 3.5685997e-13 1.049166322
		 0.02592317 -0.0084213568 1.049166322 0.022051565 -0.01601837 1.049166322 0.016021401 -0.022047397 1.049166322
		 0.0084229484 -0.025918268 1.049166322 1.4423887e-15 -0.027252082 1.049166322 -0.0084229484 -0.025918268 1.049166322
		 -0.016021401 -0.022047397 1.049166322 -0.022051565 -0.01601837 1.049166322 -0.02592317 -0.0084213568 1.049166322
		 -0.027257234 3.5685997e-13 1.049166322 -0.02592317 0.0084213568 1.049166322 -0.022051565 0.01601837 1.049166322
		 -0.016021401 0.022047397 1.049166322 -0.0084229484 0.025918268 1.049166322 1.4423887e-15 0.027252082 1.049166322
		 0.0084229484 0.025918268 1.049166322 0.016021401 0.022047397 1.049166322 0.022051565 0.01601837 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322
		 1.4423887e-15 3.5685997e-13 1.049166322 1.4423887e-15 3.5685997e-13 1.049166322;
	setAttr -s 180 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0
		 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 0 0
		 0 20 1 20 21 1 21 1 1 21 22 1 22 2 1 22 23 1 23 3 1 23 24 1 24 4 1 24 25 1 25 5 1
		 25 26 1 26 6 1 26 27 1 27 7 1 27 28 1 28 8 1 28 29 1 29 9 1 29 30 1 30 10 1 30 31 1
		 31 11 1 31 32 1 32 12 1 32 33 1 33 13 1 33 34 1 34 14 1 34 35 1 35 15 1 35 36 1 36 16 1
		 36 37 1 37 17 1 37 38 1 38 18 1 38 39 1 39 19 1 39 20 1 20 40 1 40 41 1 41 21 1 41 42 1
		 42 22 1 42 43 1 43 23 1 43 44 1 44 24 1 44 45 1 45 25 1 45 46 1 46 26 1 46 47 1 47 27 1
		 47 48 1 48 28 1 48 49 1 49 29 1 49 50 1 50 30 1 50 51 1 51 31 1 51 52 1 52 32 1 52 53 1
		 53 33 1 53 54 1 54 34 1 54 55 1 55 35 1 55 56 1 56 36 1 56 57 1 57 37 1 57 58 1 58 38 1
		 58 59 1 59 39 1 59 40 1 40 60 1 60 61 1 61 41 1 61 62 1 62 42 1 62 63 1 63 43 1 63 64 1
		 64 44 1 64 65 1 65 45 1 65 66 1 66 46 1 66 67 1 67 47 1 67 68 1 68 48 1 68 69 1 69 49 1
		 69 70 1 70 50 1 70 71 1 71 51 1 71 72 1 72 52 1 72 73 1 73 53 1 73 74 1 74 54 1 74 75 1
		 75 55 1 75 76 1 76 56 1 76 77 1 77 57 1 77 78 1 78 58 1 78 79 1 79 59 1 79 60 1 60 80 1
		 80 81 0 81 61 1 81 82 0 82 62 1 82 83 0 83 63 1 83 84 0 84 64 1 84 85 0 85 65 1 85 86 0
		 86 66 1 86 87 0 87 67 1 87 88 0 88 68 1 88 89 0 89 69 1 89 90 0 90 70 1 90 91 0 91 71 1
		 91 92 0 92 72 1 92 93 0;
	setAttr ".ed[166:179]" 93 73 1 93 94 0 94 74 1 94 95 0 95 75 1 95 96 0 96 76 1
		 96 97 0 97 77 1 97 98 0 98 78 1 98 99 0 99 79 1 99 80 0;
	setAttr -s 80 -ch 320 ".fc[0:79]" -type "polyFaces" 
		f 4 20 21 22 -1
		mu 0 4 0 20 21 1
		f 4 -23 23 24 -2
		mu 0 4 1 21 22 2
		f 4 -25 25 26 -3
		mu 0 4 2 22 23 3
		f 4 -27 27 28 -4
		mu 0 4 3 23 24 4
		f 4 -29 29 30 -5
		mu 0 4 4 24 25 5
		f 4 -31 31 32 -6
		mu 0 4 5 25 26 6
		f 4 -33 33 34 -7
		mu 0 4 6 26 27 7
		f 4 -35 35 36 -8
		mu 0 4 7 27 28 8
		f 4 -37 37 38 -9
		mu 0 4 8 28 29 9
		f 4 -39 39 40 -10
		mu 0 4 9 29 30 10
		f 4 -41 41 42 -11
		mu 0 4 10 30 31 11
		f 4 -43 43 44 -12
		mu 0 4 11 31 32 12
		f 4 -45 45 46 -13
		mu 0 4 12 32 33 13
		f 4 -47 47 48 -14
		mu 0 4 13 33 34 14
		f 4 -49 49 50 -15
		mu 0 4 14 34 35 15
		f 4 -51 51 52 -16
		mu 0 4 15 35 36 16
		f 4 -53 53 54 -17
		mu 0 4 16 36 37 17
		f 4 -55 55 56 -18
		mu 0 4 17 37 38 18
		f 4 -57 57 58 -19
		mu 0 4 18 38 39 19
		f 4 -59 59 -21 -20
		mu 0 4 19 39 20 0
		f 4 60 61 62 -22
		mu 0 4 20 40 41 21
		f 4 -63 63 64 -24
		mu 0 4 21 41 42 22
		f 4 -65 65 66 -26
		mu 0 4 22 42 43 23
		f 4 -67 67 68 -28
		mu 0 4 23 43 44 24
		f 4 -69 69 70 -30
		mu 0 4 24 44 45 25
		f 4 -71 71 72 -32
		mu 0 4 25 45 46 26
		f 4 -73 73 74 -34
		mu 0 4 26 46 47 27
		f 4 -75 75 76 -36
		mu 0 4 27 47 48 28
		f 4 -77 77 78 -38
		mu 0 4 28 48 49 29
		f 4 -79 79 80 -40
		mu 0 4 29 49 50 30
		f 4 -81 81 82 -42
		mu 0 4 30 50 51 31
		f 4 -83 83 84 -44
		mu 0 4 31 51 52 32
		f 4 -85 85 86 -46
		mu 0 4 32 52 53 33
		f 4 -87 87 88 -48
		mu 0 4 33 53 54 34
		f 4 -89 89 90 -50
		mu 0 4 34 54 55 35
		f 4 -91 91 92 -52
		mu 0 4 35 55 56 36
		f 4 -93 93 94 -54
		mu 0 4 36 56 57 37
		f 4 -95 95 96 -56
		mu 0 4 37 57 58 38
		f 4 -97 97 98 -58
		mu 0 4 38 58 59 39
		f 4 -99 99 -61 -60
		mu 0 4 39 59 40 20
		f 4 100 101 102 -62
		mu 0 4 40 60 61 41
		f 4 -103 103 104 -64
		mu 0 4 41 61 62 42
		f 4 -105 105 106 -66
		mu 0 4 42 62 63 43
		f 4 -107 107 108 -68
		mu 0 4 43 63 64 44
		f 4 -109 109 110 -70
		mu 0 4 44 64 65 45
		f 4 -111 111 112 -72
		mu 0 4 45 65 66 46
		f 4 -113 113 114 -74
		mu 0 4 46 66 67 47
		f 4 -115 115 116 -76
		mu 0 4 47 67 68 48
		f 4 -117 117 118 -78
		mu 0 4 48 68 69 49
		f 4 -119 119 120 -80
		mu 0 4 49 69 70 50
		f 4 -121 121 122 -82
		mu 0 4 50 70 71 51
		f 4 -123 123 124 -84
		mu 0 4 51 71 72 52
		f 4 -125 125 126 -86
		mu 0 4 52 72 73 53
		f 4 -127 127 128 -88
		mu 0 4 53 73 74 54
		f 4 -129 129 130 -90
		mu 0 4 54 74 75 55
		f 4 -131 131 132 -92
		mu 0 4 55 75 76 56
		f 4 -133 133 134 -94
		mu 0 4 56 76 77 57
		f 4 -135 135 136 -96
		mu 0 4 57 77 78 58
		f 4 -137 137 138 -98
		mu 0 4 58 78 79 59
		f 4 -139 139 -101 -100
		mu 0 4 59 79 60 40
		f 4 140 141 142 -102
		mu 0 4 60 80 81 61
		f 4 -143 143 144 -104
		mu 0 4 61 81 82 62
		f 4 -145 145 146 -106
		mu 0 4 62 82 83 63
		f 4 -147 147 148 -108
		mu 0 4 63 83 84 64
		f 4 -149 149 150 -110
		mu 0 4 64 84 85 65
		f 4 -151 151 152 -112
		mu 0 4 65 85 86 66
		f 4 -153 153 154 -114
		mu 0 4 66 86 87 67
		f 4 -155 155 156 -116
		mu 0 4 67 87 88 68
		f 4 -157 157 158 -118
		mu 0 4 68 88 89 69
		f 4 -159 159 160 -120
		mu 0 4 69 89 90 70
		f 4 -161 161 162 -122
		mu 0 4 70 90 91 71
		f 4 -163 163 164 -124
		mu 0 4 71 91 92 72
		f 4 -165 165 166 -126
		mu 0 4 72 92 93 73
		f 4 -167 167 168 -128
		mu 0 4 73 93 94 74
		f 4 -169 169 170 -130
		mu 0 4 74 94 95 75
		f 4 -171 171 172 -132
		mu 0 4 75 95 96 76
		f 4 -173 173 174 -134
		mu 0 4 76 96 97 77
		f 4 -175 175 176 -136
		mu 0 4 77 97 98 78
		f 4 -177 177 178 -138
		mu 0 4 78 98 99 79
		f 4 -179 179 -141 -140
		mu 0 4 79 99 80 60;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "r_pupilShapeOrig1" -p "r_pupil";
	rename -uid "47F66100-445C-17BC-FCA5-AB9D81410DB0";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 100 ".uvst[0].uvsp[0:99]" -type "float2" 21 -1 21 0 21 1 21
		 2 21 3 21 4 21 5 21 6 21 7 21 8 21 9 21 10 21 11 21 12 21 13 21 14 21 15 21 16 21
		 17 21 18 22 -1 22 0 22 1 22 2 22 3 22 4 22 5 22 6 22 7 22 8 22 9 22 10 22 11 22 12
		 22 13 22 14 22 15 22 16 22 17 22 18 23 -1 23 0 23 1 23 2 23 3 23 4 23 5 23 6 23 7
		 23 8 23 9 23 10 23 11 23 12 23 13 23 14 23 15 23 16 23 17 23 18 23.66666603 -1 23.66666603
		 0 23.66666603 1 23.66666603 2 23.66666603 3 23.66666603 4 23.66666603 5 23.66666603
		 6 23.66666603 7 23.66666603 8 23.66666603 9 23.66666603 10 23.66666603 11 23.66666603
		 12 23.66666603 13 23.66666603 14 23.66666603 15 23.66666603 16 23.66666603 17 23.66666603
		 18 24 -1 24 0 24 1 24 2 24 3 24 4 24 5 24 6 24 7 24 8 24 9 24 10 24 11 24 12 24 13
		 24 14 24 15 24 16 24 17 24 18;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 100 ".vt[0:99]"  0.20621094 0.066992104 0.75558507 0.21682328 3.0675264e-06 0.75558507
		 0.20621094 -0.066986278 0.75558507 0.1754128 -0.12741795 0.75558507 0.12744528 -0.1753764 0.75558507
		 0.067001887 -0.20616904 0.75558507 1.2152881e-15 -0.21677867 0.75558507 -0.067001887 -0.20616904 0.75558507
		 -0.12744528 -0.1753764 0.75558507 -0.1754128 -0.12741795 0.75558507 -0.20621094 -0.066986278 0.75558507
		 -0.21682328 3.0675264e-06 0.75558507 -0.20621094 0.066992104 0.75558507 -0.1754128 0.12742367 0.75558507
		 -0.12744528 0.17538303 0.75558507 -0.067001887 0.20617482 0.75558507 1.2152881e-15 0.21678466 0.75558507
		 0.067001887 0.20617482 0.75558507 0.12744528 0.17538303 0.75558507 0.1754128 0.12742367 0.75558507
		 0.13001864 0.042240713 0.78128928 0.1367103 3.0675008e-06 0.78128928 0.13001864 -0.042234696 0.78128928
		 0.11060119 -0.080338009 0.78128928 0.08035665 -0.11057667 0.78128928 0.04224585 -0.12999164 0.78128928
		 1.2152881e-15 -0.13668129 0.78128928 -0.04224585 -0.12999164 0.78128928 -0.08035665 -0.11057667 0.78128928
		 -0.11060119 -0.080338009 0.78128928 -0.13001864 -0.042234696 0.78128928 -0.1367103 3.0675008e-06 0.78128928
		 -0.13001864 0.042240713 0.78128928 -0.11060119 0.080344066 0.78128928 -0.08035665 0.11058309 0.78128928
		 -0.04224585 0.12999758 0.78128928 1.2152881e-15 0.13668704 0.78128928 0.04224585 0.12999758 0.78128928
		 0.08035665 0.11058309 0.78128928 0.11060119 0.080344066 0.78128928 0.065578774 0.021306861 0.78950059
		 0.068953633 3.0675267e-06 0.78950059 0.065578774 -0.021300744 0.78950059 0.055784706 -0.04051917 0.78950059
		 0.040529907 -0.055771027 0.78950059 0.021307832 -0.065563433 0.78950059 1.2152881e-15 -0.06893754 0.78950059
		 -0.021307832 -0.065563433 0.78950059 -0.040529907 -0.055771027 0.78950059 -0.055784706 -0.04051917 0.78950059
		 -0.065578774 -0.021300744 0.78950059 -0.068953633 3.0675267e-06 0.78950059 -0.065578774 0.021306861 0.78950059
		 -0.055784706 0.040525287 0.78950059 -0.040529907 0.055777237 0.78950059 -0.021307832 0.06556946 0.78950059
		 1.2152881e-15 0.068943352 0.78950059 0.021307832 0.06556946 0.78950059 0.040529907 0.055777237 0.78950059
		 0.055784706 0.040525287 0.78950059 0.021841602 0.0070984969 0.79248637 0.022965722 3.0675296e-06 0.79248637
		 0.021841602 -0.0070923641 0.79248637 0.018579641 -0.013493284 0.79248637 0.013498861 -0.018573022 0.79248637
		 0.0070967851 -0.021834509 0.79248637 1.2152881e-15 -0.022958208 0.79248637 -0.0070967851 -0.021834509 0.79248637
		 -0.013498861 -0.018573022 0.79248637 -0.018579641 -0.013493284 0.79248637 -0.021841602 -0.0070923641 0.79248637
		 -0.022965722 3.0675296e-06 0.79248637 -0.021841602 0.0070984969 0.79248637 -0.018579641 0.013499409 0.79248637
		 -0.013498861 0.018579205 0.79248637 -0.0070967851 0.021840652 0.79248637 1.2152881e-15 0.022964375 0.79248637
		 0.0070967851 0.021840652 0.79248637 0.013498861 0.018579205 0.79248637 0.018579641 0.013499409 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637
		 1.2152881e-15 3.0675296e-06 0.79248637 1.2152881e-15 3.0675296e-06 0.79248637;
	setAttr -s 180 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0
		 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 0 0
		 0 20 1 20 21 1 21 1 1 21 22 1 22 2 1 22 23 1 23 3 1 23 24 1 24 4 1 24 25 1 25 5 1
		 25 26 1 26 6 1 26 27 1 27 7 1 27 28 1 28 8 1 28 29 1 29 9 1 29 30 1 30 10 1 30 31 1
		 31 11 1 31 32 1 32 12 1 32 33 1 33 13 1 33 34 1 34 14 1 34 35 1 35 15 1 35 36 1 36 16 1
		 36 37 1 37 17 1 37 38 1 38 18 1 38 39 1 39 19 1 39 20 1 20 40 1 40 41 1 41 21 1 41 42 1
		 42 22 1 42 43 1 43 23 1 43 44 1 44 24 1 44 45 1 45 25 1 45 46 1 46 26 1 46 47 1 47 27 1
		 47 48 1 48 28 1 48 49 1 49 29 1 49 50 1 50 30 1 50 51 1 51 31 1 51 52 1 52 32 1 52 53 1
		 53 33 1 53 54 1 54 34 1 54 55 1 55 35 1 55 56 1 56 36 1 56 57 1 57 37 1 57 58 1 58 38 1
		 58 59 1 59 39 1 59 40 1 40 60 1 60 61 1 61 41 1 61 62 1 62 42 1 62 63 1 63 43 1 63 64 1
		 64 44 1 64 65 1 65 45 1 65 66 1 66 46 1 66 67 1 67 47 1 67 68 1 68 48 1 68 69 1 69 49 1
		 69 70 1 70 50 1 70 71 1 71 51 1 71 72 1 72 52 1 72 73 1 73 53 1 73 74 1 74 54 1 74 75 1
		 75 55 1 75 76 1 76 56 1 76 77 1 77 57 1 77 78 1 78 58 1 78 79 1 79 59 1 79 60 1 60 80 1
		 80 81 0 81 61 1 81 82 0 82 62 1 82 83 0 83 63 1 83 84 0 84 64 1 84 85 0 85 65 1 85 86 0
		 86 66 1 86 87 0 87 67 1 87 88 0 88 68 1 88 89 0 89 69 1 89 90 0 90 70 1 90 91 0 91 71 1
		 91 92 0 92 72 1 92 93 0;
	setAttr ".ed[166:179]" 93 73 1 93 94 0 94 74 1 94 95 0 95 75 1 95 96 0 96 76 1
		 96 97 0 97 77 1 97 98 0 98 78 1 98 99 0 99 79 1 99 80 0;
	setAttr -s 80 -ch 320 ".fc[0:79]" -type "polyFaces" 
		f 4 20 21 22 -1
		mu 0 4 0 20 21 1
		f 4 -23 23 24 -2
		mu 0 4 1 21 22 2
		f 4 -25 25 26 -3
		mu 0 4 2 22 23 3
		f 4 -27 27 28 -4
		mu 0 4 3 23 24 4
		f 4 -29 29 30 -5
		mu 0 4 4 24 25 5
		f 4 -31 31 32 -6
		mu 0 4 5 25 26 6
		f 4 -33 33 34 -7
		mu 0 4 6 26 27 7
		f 4 -35 35 36 -8
		mu 0 4 7 27 28 8
		f 4 -37 37 38 -9
		mu 0 4 8 28 29 9
		f 4 -39 39 40 -10
		mu 0 4 9 29 30 10
		f 4 -41 41 42 -11
		mu 0 4 10 30 31 11
		f 4 -43 43 44 -12
		mu 0 4 11 31 32 12
		f 4 -45 45 46 -13
		mu 0 4 12 32 33 13
		f 4 -47 47 48 -14
		mu 0 4 13 33 34 14
		f 4 -49 49 50 -15
		mu 0 4 14 34 35 15
		f 4 -51 51 52 -16
		mu 0 4 15 35 36 16
		f 4 -53 53 54 -17
		mu 0 4 16 36 37 17
		f 4 -55 55 56 -18
		mu 0 4 17 37 38 18
		f 4 -57 57 58 -19
		mu 0 4 18 38 39 19
		f 4 -59 59 -21 -20
		mu 0 4 19 39 20 0
		f 4 60 61 62 -22
		mu 0 4 20 40 41 21
		f 4 -63 63 64 -24
		mu 0 4 21 41 42 22
		f 4 -65 65 66 -26
		mu 0 4 22 42 43 23
		f 4 -67 67 68 -28
		mu 0 4 23 43 44 24
		f 4 -69 69 70 -30
		mu 0 4 24 44 45 25
		f 4 -71 71 72 -32
		mu 0 4 25 45 46 26
		f 4 -73 73 74 -34
		mu 0 4 26 46 47 27
		f 4 -75 75 76 -36
		mu 0 4 27 47 48 28
		f 4 -77 77 78 -38
		mu 0 4 28 48 49 29
		f 4 -79 79 80 -40
		mu 0 4 29 49 50 30
		f 4 -81 81 82 -42
		mu 0 4 30 50 51 31
		f 4 -83 83 84 -44
		mu 0 4 31 51 52 32
		f 4 -85 85 86 -46
		mu 0 4 32 52 53 33
		f 4 -87 87 88 -48
		mu 0 4 33 53 54 34
		f 4 -89 89 90 -50
		mu 0 4 34 54 55 35
		f 4 -91 91 92 -52
		mu 0 4 35 55 56 36
		f 4 -93 93 94 -54
		mu 0 4 36 56 57 37
		f 4 -95 95 96 -56
		mu 0 4 37 57 58 38
		f 4 -97 97 98 -58
		mu 0 4 38 58 59 39
		f 4 -99 99 -61 -60
		mu 0 4 39 59 40 20
		f 4 100 101 102 -62
		mu 0 4 40 60 61 41
		f 4 -103 103 104 -64
		mu 0 4 41 61 62 42
		f 4 -105 105 106 -66
		mu 0 4 42 62 63 43
		f 4 -107 107 108 -68
		mu 0 4 43 63 64 44
		f 4 -109 109 110 -70
		mu 0 4 44 64 65 45
		f 4 -111 111 112 -72
		mu 0 4 45 65 66 46
		f 4 -113 113 114 -74
		mu 0 4 46 66 67 47
		f 4 -115 115 116 -76
		mu 0 4 47 67 68 48
		f 4 -117 117 118 -78
		mu 0 4 48 68 69 49
		f 4 -119 119 120 -80
		mu 0 4 49 69 70 50
		f 4 -121 121 122 -82
		mu 0 4 50 70 71 51
		f 4 -123 123 124 -84
		mu 0 4 51 71 72 52
		f 4 -125 125 126 -86
		mu 0 4 52 72 73 53
		f 4 -127 127 128 -88
		mu 0 4 53 73 74 54
		f 4 -129 129 130 -90
		mu 0 4 54 74 75 55
		f 4 -131 131 132 -92
		mu 0 4 55 75 76 56
		f 4 -133 133 134 -94
		mu 0 4 56 76 77 57
		f 4 -135 135 136 -96
		mu 0 4 57 77 78 58
		f 4 -137 137 138 -98
		mu 0 4 58 78 79 59
		f 4 -139 139 -101 -100
		mu 0 4 59 79 60 40
		f 4 140 141 142 -102
		mu 0 4 60 80 81 61
		f 4 -143 143 144 -104
		mu 0 4 61 81 82 62
		f 4 -145 145 146 -106
		mu 0 4 62 82 83 63
		f 4 -147 147 148 -108
		mu 0 4 63 83 84 64
		f 4 -149 149 150 -110
		mu 0 4 64 84 85 65
		f 4 -151 151 152 -112
		mu 0 4 65 85 86 66
		f 4 -153 153 154 -114
		mu 0 4 66 86 87 67
		f 4 -155 155 156 -116
		mu 0 4 67 87 88 68
		f 4 -157 157 158 -118
		mu 0 4 68 88 89 69
		f 4 -159 159 160 -120
		mu 0 4 69 89 90 70
		f 4 -161 161 162 -122
		mu 0 4 70 90 91 71
		f 4 -163 163 164 -124
		mu 0 4 71 91 92 72
		f 4 -165 165 166 -126
		mu 0 4 72 92 93 73
		f 4 -167 167 168 -128
		mu 0 4 73 93 94 74
		f 4 -169 169 170 -130
		mu 0 4 74 94 95 75
		f 4 -171 171 172 -132
		mu 0 4 75 95 96 76
		f 4 -173 173 174 -134
		mu 0 4 76 96 97 77
		f 4 -175 175 176 -136
		mu 0 4 77 97 98 78
		f 4 -177 177 178 -138
		mu 0 4 78 98 99 79
		f 4 -179 179 -141 -140
		mu 0 4 79 99 80 60;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode transform -n "r_highlight_geo" -p "r_geo_group";
	rename -uid "61DE75AC-4982-FBE1-A4D1-B8B7009BC28B";
createNode mesh -n "r_highlight_geoShape" -p "r_highlight_geo";
	rename -uid "8177C558-41BA-D42D-648B-C49E2D6141C5";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "r_highlight_geoShapeOrig" -p "r_highlight_geo";
	rename -uid "448405EC-4AEE-8AA3-F012-EAABC2A00A9E";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode parentConstraint -n "r_highlight_geo_parentConstraint1" -p "r_highlight_geo";
	rename -uid "CB6DE245-46D7-904D-5224-35BB4086DB06";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "r_highlightW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 4.4408920985006262e-16 0 -1.1000633599883005 ;
	setAttr ".tg[0].tor" -type "double3" -90 0 0 ;
	setAttr ".lr" -type "double3" -101.54497137957769 -17.188715710380691 0.02536019883264887 ;
	setAttr ".rst" -type "double3" -9.8964176853399977e-09 -2.9154834393729929e-09 3.6853170249595771e-09 ;
	setAttr ".rsrr" -type "double3" -101.54617899687059 17.188715196146646 -0.025717073773949942 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "r_highlight_geo_scaleConstraint1" -p "r_highlight_geo";
	rename -uid "9EA936E6-40E8-9CC6-4054-448C86DBF182";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "r_highlightW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 1 1.0000000000000002 1 ;
	setAttr -k on ".w0";
createNode mesh -n "r_highlight_geoShapeOrigOrig" -p "r_highlight_geo";
	rename -uid "67441BD6-4A70-B2DD-59FB-44B1A1DCACEC";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 61 ".uvst[0].uvsp[0:60]" -type "float2" 0.066987343 0.24999999
		 0.93301272 0.25000006 0.49999994 1 0.50000006 0 0.9330126 0.75000006 0.066987231
		 0.74999988 0.5 0.5 0 0.49999997 0.25000006 0.066987306 0.5 0.25 0.28349364 0.62499994
		 0.28349367 0.37499997 0.75000006 0.066987343 1 0.50000006 0.7165063 0.625 0.7165063
		 0.37500003 0.74999988 0.93301272 0.24999997 0.93301266 0.49999997 0.74999994 0.17524047
		 0.68749994 0.017037092 0.62940943 0.14174683 0.43749994 0.28349367 0.49999997 0.15849365
		 0.56249994 0.017037166 0.37059042 0.1464467 0.14644663 0.26674688 0.22099364 0.15012032
		 0.29799679 0.37059054 0.017037129 0.50000006 0.12500001 0.39174685 0.31249997 0.38337347
		 0.17299683 0.5 0.37499997 0.39174679 0.5625 0.39174685 0.4375 0.62940955 0.017037166
		 0.73325312 0.22099368 0.60825318 0.3125 0.61662662 0.17299683 0.85355335 0.14644666
		 0.98296291 0.37059054 0.85825318 0.43750003 0.84987974 0.29799685 0.98296285 0.62940955
		 0.82475948 0.6875 0.7165063 0.5 0.84150636 0.5625 0.60825312 0.5625 0.60825318 0.4375
		 0.85355335 0.85355341 0.62499994 0.84150636 0.60825312 0.6875 0.72487968 0.76450318
		 0.62940943 0.98296291 0.37059042 0.98296285 0.37499994 0.84150636 0.49999994 0.90400636
		 0.14644659 0.85355335 0.39174679 0.6875 0.2751202 0.76450312 0.49999997 0.625;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 61 ".vt[0:60]"  -0.086602539 0 0.050000008 0.086602546 0 0.049999993
		 -1.6292068e-08 0 -0.10000001 7.4505802e-09 0 0.10000001 0.086602531 0 -0.050000008
		 -0.086602561 0 -0.049999986 -2.9471625e-09 0 0 -0.10000001 0 1.0753986e-08 -0.04999999 0 0.086602546
		 2.251709e-09 0 0.050000004 -0.043301277 0 -0.024999995 -0.043301269 0 0.025000006
		 0.050000008 0 0.086602539 0.10000001 0 -8.6031893e-09 0.043301266 0 -0.025000004
		 0.043301269 0 0.024999999 0.049999986 0 -0.086602554 -0.050000012 0 -0.086602539
		 -1.0050016e-08 0 -0.050000004 -0.064951912 0 -0.03749999 -0.09659259 0 -0.02588189
		 -0.071650639 0 0.012500009 -0.043301273 0 5.5879354e-09 -0.068301275 0 -0.012499992
		 -0.096592575 0 0.025881916 -0.070710666 0 0.070710681 -0.046650629 0 0.055801276
		 -0.069975942 0 0.040400643 -0.025881896 0 0.096592583 4.8511444e-09 0 0.075000003
		 -0.021650633 0 0.037500005 -0.023325313 0 0.065400638 -3.4772674e-10 0 0.025000002
		 -0.02165064 0 -0.012499997 -0.021650637 0 0.012500004 0.025881914 0 0.096592575 0.046650641 0 0.055801269
		 0.021650637 0 0.037500001 0.023325322 0 0.065400638 0.070710681 0 0.070710674 0.096592583 0 0.025881896
		 0.071650639 0 0.012499995 0.069975957 0 0.040400632 0.096592575 0 -0.025881914 0.064951897 0 -0.037500005
		 0.043301269 0 -2.7939677e-09 0.068301268 0 -0.012500005 0.021650631 0 -0.012500002
		 0.021650635 0 0.012499999 0.070710666 0 -0.070710689 0.024999989 0 -0.068301275 0.021650627 0 -0.037500005
		 0.04497594 0 -0.052900642 0.02588189 0 -0.09659259 -0.025881918 0 -0.096592575 -0.025000012 0 -0.068301275
		 -1.182573e-08 0 -0.080801278 -0.070710689 0 -0.070710666 -0.021650644 0 -0.037500001
		 -0.044975962 0 -0.052900627 -6.2377943e-09 0 -0.025;
	setAttr -s 108 ".ed[0:107]"  22 10 1 10 19 1 19 23 1 23 22 1 19 5 1 5 20 0
		 20 23 1 20 7 0 7 21 1 21 23 1 21 11 1 11 22 1 7 24 0 24 27 1 27 21 1 24 0 0 0 25 0
		 25 27 1 25 8 0 8 26 1 26 27 1 26 11 1 8 28 0 28 31 1 31 26 1 28 3 0 3 29 1 29 31 1
		 29 9 1 9 30 1 30 31 1 30 11 1 9 32 1 32 34 1 34 30 1 32 6 1 6 33 1 33 34 1 33 10 1
		 22 34 1 37 9 1 29 38 1 38 37 1 3 35 0 35 38 1 35 12 0 12 36 1 36 38 1 36 15 1 15 37 1
		 12 39 0 39 42 1 42 36 1 39 1 0 1 40 0 40 42 1 40 13 0 13 41 1 41 42 1 41 15 1 13 43 0
		 43 46 1 46 41 1 43 4 0 4 44 1 44 46 1 44 14 1 14 45 1 45 46 1 45 15 1 14 47 1 47 48 1
		 48 45 1 47 6 1 32 48 1 37 48 1 51 14 1 44 52 1 52 51 1 4 49 0 49 52 1 49 16 0 16 50 1
		 50 52 1 50 18 1 18 51 1 16 53 0 53 56 1 56 50 1 53 2 0 2 54 0 54 56 1 54 17 0 17 55 1
		 55 56 1 55 18 1 17 57 0 57 59 1 59 55 1 57 5 0 19 59 1 10 58 1 58 59 1 58 18 1 33 60 1
		 60 58 1 47 60 1 51 60 1;
	setAttr -s 48 -ch 192 ".fc[0:47]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 22 10 19 23
		f 4 4 5 6 -3
		mu 0 4 19 5 20 23
		f 4 7 8 9 -7
		mu 0 4 20 7 21 23
		f 4 10 11 -4 -10
		mu 0 4 21 11 22 23
		f 4 -9 12 13 14
		mu 0 4 21 7 24 27
		f 4 15 16 17 -14
		mu 0 4 24 0 25 27
		f 4 18 19 20 -18
		mu 0 4 25 8 26 27
		f 4 21 -11 -15 -21
		mu 0 4 26 11 21 27
		f 4 -20 22 23 24
		mu 0 4 26 8 28 31
		f 4 25 26 27 -24
		mu 0 4 28 3 29 31
		f 4 28 29 30 -28
		mu 0 4 29 9 30 31
		f 4 31 -22 -25 -31
		mu 0 4 30 11 26 31
		f 4 -30 32 33 34
		mu 0 4 30 9 32 34
		f 4 35 36 37 -34
		mu 0 4 32 6 33 34
		f 4 38 -1 39 -38
		mu 0 4 33 10 22 34
		f 4 -12 -32 -35 -40
		mu 0 4 22 11 30 34
		f 4 40 -29 41 42
		mu 0 4 37 9 29 38
		f 4 -27 43 44 -42
		mu 0 4 29 3 35 38
		f 4 45 46 47 -45
		mu 0 4 35 12 36 38
		f 4 48 49 -43 -48
		mu 0 4 36 15 37 38
		f 4 -47 50 51 52
		mu 0 4 36 12 39 42
		f 4 53 54 55 -52
		mu 0 4 39 1 40 42
		f 4 56 57 58 -56
		mu 0 4 40 13 41 42
		f 4 59 -49 -53 -59
		mu 0 4 41 15 36 42
		f 4 -58 60 61 62
		mu 0 4 41 13 43 46
		f 4 63 64 65 -62
		mu 0 4 43 4 44 46
		f 4 66 67 68 -66
		mu 0 4 44 14 45 46
		f 4 69 -60 -63 -69
		mu 0 4 45 15 41 46
		f 4 -68 70 71 72
		mu 0 4 45 14 47 48
		f 4 73 -36 74 -72
		mu 0 4 47 6 32 48
		f 4 -33 -41 75 -75
		mu 0 4 32 9 37 48
		f 4 -50 -70 -73 -76
		mu 0 4 37 15 45 48
		f 4 76 -67 77 78
		mu 0 4 51 14 44 52
		f 4 -65 79 80 -78
		mu 0 4 44 4 49 52
		f 4 81 82 83 -81
		mu 0 4 49 16 50 52
		f 4 84 85 -79 -84
		mu 0 4 50 18 51 52
		f 4 -83 86 87 88
		mu 0 4 50 16 53 56
		f 4 89 90 91 -88
		mu 0 4 53 2 54 56
		f 4 92 93 94 -92
		mu 0 4 54 17 55 56
		f 4 95 -85 -89 -95
		mu 0 4 55 18 50 56
		f 4 -94 96 97 98
		mu 0 4 55 17 57 59
		f 4 99 -5 100 -98
		mu 0 4 57 5 19 59
		f 4 -2 101 102 -101
		mu 0 4 19 10 58 59
		f 4 103 -96 -99 -103
		mu 0 4 58 18 55 59
		f 4 -102 -39 104 105
		mu 0 4 58 10 33 60
		f 4 -37 -74 106 -105
		mu 0 4 33 6 47 60
		f 4 -71 -77 107 -107
		mu 0 4 47 14 51 60
		f 4 -86 -104 -106 -108
		mu 0 4 51 18 58 60;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -s -n "persp";
	rename -uid "A4EA9250-41A6-37BB-F8AB-BAA79EF854A2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.0128038790456726 8.0470609783285916 9.9446612755216837 ;
	setAttr ".r" -type "double3" -35.400000000023006 26.000000000004349 1.7693456551919431e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "BA6516A2-419B-F4F9-084E-028C7549EBBB";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 12.316749661859179;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 2.2090098042645954 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "E9904FC9-4061-A2C9-CCFB-8489679426A5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.52365643622670088 7.3657360769246178 0.50120107065742658 ;
	setAttr ".r" -type "double3" -90 -90 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" 0 -1.4210854715202007e-14 1.4210854715202007e-14 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "80FCA0AD-4746-F3D6-C55C-1895428DF704";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 7.3657500780886442;
	setAttr ".ow" 10.159635105798262;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" -0.52365643622670066 -1.4001164025390089e-05 0.50120107065742658 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "0AEA98CA-42D6-07D8-3158-36844F0727C4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.8684167621627511 -0.44473909285808322 5.1818122203918744 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E0CCC2CB-43C9-96D0-48DE-CDB9BE9D47DE";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 15.856188115467216;
	setAttr ".ow" 5.3056107707630247;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -0.52365643622670066 -1.4001164025390089e-05 0.50120107065742658 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "D67EE298-4BA3-0678-A60C-B08E6B7D11CC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.0854762725440814 -1.4001164025390089e-05 0.50120107065742658 ;
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" -1.4210854715202007e-14 0 1.4210854715202007e-14 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "A544851C-4343-6208-0DCB-BF9321BAC3B3";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 3.6091327087707818;
	setAttr ".ow" 3.2259321467075597;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" -0.52365643622670066 -1.4001164025390089e-05 0.50120107065742658 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "animaccordHUD";
	rename -uid "B8946506-4B51-9528-65D5-F99334E3E7EA";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".hio" yes;
createNode decomposeMatrix -n "decomposeMatrix24";
	rename -uid "CBD27FE0-42A7-32F3-2E70-019E1098CF4A";
createNode multMatrix -n "multMatrix18";
	rename -uid "1B90A7D9-44A3-272F-A579-3ABB0541BA22";
	setAttr -s 3 ".i";
createNode reverse -n "reverse23";
	rename -uid "33DF63A2-4131-27C6-2FEE-E0BB4311B9D5";
createNode multDoubleLinear -n "pos_reverse_multDoubleLinear";
	rename -uid "1A7C387C-4F07-8AA6-7F82-A796BE5CB050";
	setAttr ".i2" -1;
createNode reverse -n "reverse40";
	rename -uid "D774DC2A-468F-908E-E677-87ABBC73D1E1";
createNode decomposeMatrix -n "decomposeMatrix23";
	rename -uid "6749E40C-48FA-F166-4822-91B5428539DF";
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "BB049716-4DA8-3C8D-8CED-689F34CA02F2";
createNode objectSet -n "look_fk_moduleControlSet";
	rename -uid "5BA11FC5-4EF6-D9E8-6652-18B72CA2B8F0";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "look_ik_moduleControlSet";
	rename -uid "A64C2A1D-4723-5D1F-952C-7FA84DE176AA";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "133EF1E8-4BD8-6FE8-7243-C8A3D8B11A9A";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "8E2D372C-4B15-CC67-0E66-E38AB8E18FD0";
createNode displayLayer -n "defaultLayer";
	rename -uid "F357F502-4252-ED91-F13A-ECA2301BB85F";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "865DB101-4E9E-67EE-664F-FCB69FD68660";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F97BA6B2-418F-A292-DA9D-22B02B4D615C";
	setAttr ".g" yes;
createNode decomposeMatrix -n "decomposeMatrix75";
	rename -uid "879433FC-477F-5EE1-5194-58B8B7FA645C";
createNode decomposeMatrix -n "root_decomposeMatrix";
	rename -uid "F78B5164-43C5-7957-05AE-C09F110083B5";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "565D70F1-4A7E-36F6-A296-05BE317D9D40";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 140 -ast 0 -aet 140 ";
	setAttr ".st" 6;
createNode objectSet -n "moduleControlSet";
	rename -uid "FDAD0384-4EE2-84D2-EBEA-3B9177C776A1";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr -s 3 ".dnsm";
createNode objectSet -n "sets";
	rename -uid "2C21950D-4CA6-3BF6-8FA8-BBA3B347DBAE";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode hyperView -n "hyperView1";
	rename -uid "799F53C6-4BE7-5C67-C353-E9B529429D7D";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	rename -uid "848425A3-4ABF-8EF7-797A-C3A2D1254AC8";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView2";
	rename -uid "081FCBA3-47B7-0A9A-E086-2AAC3EB7B595";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout2";
	rename -uid "D4F85DDF-4F13-A32C-73A5-9196A55CAFDD";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView3";
	rename -uid "D7327D70-4340-9F8C-9DEB-7C9E7F85D278";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout3";
	rename -uid "05A53DC1-4415-1464-9D4B-ACB69A08FC2B";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView4";
	rename -uid "DA493FE2-4461-8594-427D-D2A68C027622";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout4";
	rename -uid "CB0C0B84-476E-9496-663C-088A23E15B69";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode decomposeMatrix -n "l_eye_group_decMat";
	rename -uid "2B8958B6-47D1-243B-9BA4-FC89D457C962";
createNode decomposeMatrix -n "r_eye_group_decMat";
	rename -uid "56CCF56D-438D-A158-2F25-F7B7A9BACD3B";
createNode decomposeMatrix -n "r_eyeBase_skinJoint1_decMat";
	rename -uid "E57D6F06-4AE0-119A-8231-5A961CD03EA1";
createNode decomposeMatrix -n "l_eyeBase_skinJoint1_decMat";
	rename -uid "6EA0E7E0-4182-9E5B-1337-7DA3ED5D2766";
createNode groupId -n "cluster4GroupId";
	rename -uid "98A07B66-4095-876F-E15E-4EA959F17467";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "cluster4Set";
	rename -uid "5F96102A-4EE5-FA4B-9CCF-F2AC5BD5F5F9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "A11F3B67-4473-F88C-2E87-BAB1C6F5DEC6";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "576AC965-49EA-9488-C1A3-E1815813D4EC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "";
createNode tweak -n "tweak24";
	rename -uid "2878053A-4D2F-248A-5990-A0865FA1BA6E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "tweakSet24";
	rename -uid "895393BF-4B14-D9A4-7407-AC9B43E46974";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "groupId42";
	rename -uid "7405C3E3-4BD7-568C-A3AE-698BA46C54EE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupParts -n "groupParts42";
	rename -uid "49975102-4F70-3839-A672-738C1F2B7E6C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "skinJointsSet";
	rename -uid "9B7A4BDD-4E9B-9791-C155-24AC71AD7F90";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multDoubleLinear -n "pos_ik__multDoubleLinear";
	rename -uid "F06C738A-4047-6C70-6CF3-11AAA85E6A26";
	setAttr ".i2" 2;
createNode multMatrix -n "multMatrix20";
	rename -uid "0FC7A1AF-4315-99CA-A3B9-269A2608A2A7";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix1";
	rename -uid "D91CC052-4078-5B4D-0CF6-A298432FCCC9";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode decomposeMatrix -n "decomposeMatrix77";
	rename -uid "9408DF65-49E3-DEF1-8DE2-BB8FE9008CEB";
createNode multMatrix -n "multMatrix22";
	rename -uid "96BCB78F-433A-FEF6-1D8E-C39AD72F2D40";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix23";
	rename -uid "D78EBE61-4597-9396-0DAD-0A923BFF31B9";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix24";
	rename -uid "4DD25856-40FB-B8C2-D8FA-C4BE5D9C6EEA";
	setAttr -s 3 ".i";
createNode multMatrix -n "multMatrix25";
	rename -uid "5E0F957F-4CC0-BB63-2419-FB872588C9E3";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix78";
	rename -uid "F76900C6-40DC-59CB-E7A2-FB9C77064B1C";
createNode transformGeometry -n "transformGeometry1";
	rename -uid "18E33E12-4911-E25D-19FF-088DD35F1190";
createNode composeMatrix -n "composeMatrix2";
	rename -uid "C6C7B458-4E25-4EEF-9039-6D811F9969ED";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode transformGeometry -n "transformGeometry2";
	rename -uid "0F43965F-4AEB-B784-6391-DC800336FAA7";
createNode composeMatrix -n "composeMatrix3";
	rename -uid "AEDBBBD8-414E-0D7D-2C68-8397E910D1D3";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "004194A0-4863-D0B4-827D-49BA538C748B";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 4 4 5 0 1 ;
	setAttr -s 4 ".bspr";
	setAttr -s 4 ".obsv";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "37A779BB-476C-DEB2-70B0-F09908DDC870";
createNode blindDataTemplate -n "blindDataTemplate1";
	rename -uid "1516D5F4-4CD5-20B2-C103-3A8E9D608DF0";
	addAttr -ci true -sn "coverage" -ln "coverage" -at "float";
	addAttr -ci true -sn "numnonpacked" -ln "numnonpacked" -at "long";
createNode eulerToQuat -n "eulerToQuat3";
	rename -uid "EE82F5F8-4DDC-480D-FD6E-B7964D6D8A69";
createNode multDoubleLinear -n "multDoubleLinear5";
	rename -uid "CE031B85-492C-5D2A-E4A2-9EBC8A968C09";
	setAttr ".i2" 0.1;
createNode multDoubleLinear -n "multDoubleLinear6";
	rename -uid "E070637C-4AFB-4279-5944-2F84B702EDD2";
	setAttr ".i2" 150;
createNode reverse -n "reverse2";
	rename -uid "5639F764-4966-0CFA-46ED-E0B3A4B293DA";
createNode unitConversion -n "unitConversion6";
	rename -uid "08797AD6-4E58-70FA-6CBC-DD8F92CCDFBC";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat4";
	rename -uid "46645BF8-4D25-CF39-FD08-82A7EC6DA2D1";
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "11682C99-4CF0-8CC2-B106-ABB143DC71C7";
	setAttr ".ihi" 2;
	setAttr ".i2" 21;
createNode unitConversion -n "unitConversion7";
	rename -uid "5A6B8929-499D-856E-68B9-39A28F6D1812";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion8";
	rename -uid "A5E64753-4276-DB0A-AD8F-A285E6EA1762";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat5";
	rename -uid "0C7C4447-4FEF-92E7-D8E4-07B17B11FE8A";
createNode addDoubleLinear -n "addDoubleLinear2";
	rename -uid "574B4D2B-475E-B87D-7493-FE9496E6B022";
	setAttr ".ihi" 2;
	setAttr ".i2" 63.830000000000005;
createNode addDoubleLinear -n "addDoubleLinear3";
	rename -uid "6CB64299-47B1-E831-779B-A4A512836177";
	setAttr ".ihi" 2;
	setAttr ".i2" -21.94;
createNode eulerToQuat -n "eulerToQuat6";
	rename -uid "D05B85B3-4086-73F6-7B41-ECBF76FFC3C0";
createNode addDoubleLinear -n "addDoubleLinear4";
	rename -uid "79E36025-475C-A191-34E1-B5A464D74696";
	setAttr ".ihi" 2;
	setAttr ".i2" 147.24;
createNode unitConversion -n "unitConversion9";
	rename -uid "AEB5DC93-4527-35F6-8A28-D795E3DF965F";
	setAttr ".cf" 0.017453292519943295;
createNode addDoubleLinear -n "addDoubleLinear5";
	rename -uid "F3E54423-4047-0FB0-7D7C-C995D4C1440B";
	setAttr ".ihi" 2;
	setAttr ".i2" 174.42999999999998;
createNode unitConversion -n "unitConversion10";
	rename -uid "9D62E53D-4358-C19E-1F54-65AC9ABBA267";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat7";
	rename -uid "46ED6835-4169-13DC-7455-86B911BE86E8";
createNode eulerToQuat -n "eulerToQuat8";
	rename -uid "232CDBF7-45EC-B4A9-0D69-D2BEC3BE4E7B";
createNode unitConversion -n "unitConversion11";
	rename -uid "CA8BA201-4C1D-9E74-5965-55A37D85F22F";
	setAttr ".cf" 0.017453292519943295;
createNode addDoubleLinear -n "addDoubleLinear6";
	rename -uid "BC4FBF4D-46F1-C793-161B-9CAFBCC80A71";
	setAttr ".ihi" 2;
	setAttr ".i2" 108.28999999999999;
createNode multDoubleLinear -n "multDoubleLinear7";
	rename -uid "368C2B63-411E-8E24-B31F-10BD2554837E";
	setAttr ".i2" 130;
createNode multDoubleLinear -n "multDoubleLinear8";
	rename -uid "3FCE416D-4967-A9AD-9783-E1AD1BC02FC5";
	setAttr ".i2" 110;
createNode multDoubleLinear -n "multDoubleLinear9";
	rename -uid "2DF7EB9A-4CE9-2309-8E21-1FA17CA84119";
	setAttr ".i2" 50;
createNode multDoubleLinear -n "multDoubleLinear10";
	rename -uid "16374FCF-4572-B4F1-FF15-ACAD05472EF6";
	setAttr ".i2" 70;
createNode multDoubleLinear -n "multDoubleLinear11";
	rename -uid "723ECF5C-40AF-C925-F670-F2B37B4CD6EF";
	setAttr ".i2" 90;
createNode multDoubleLinear -n "multDoubleLinear12";
	rename -uid "BAF7D162-4F09-2942-90EC-FBAB0009B40A";
	setAttr ".i2" 2.648;
createNode addDoubleLinear -n "addDoubleLinear7";
	rename -uid "39FAD229-4381-5A73-06B8-45AD63576C42";
	setAttr ".ihi" 2;
	setAttr ".i2" -64.84;
createNode multDoubleLinear -n "multDoubleLinear13";
	rename -uid "EDD5241A-488F-4362-70F0-DD948A24E195";
	setAttr ".i2" 30;
createNode unitConversion -n "unitConversion12";
	rename -uid "23D1F2DA-453E-D5EE-E7D9-2F92717CA22B";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat9";
	rename -uid "475AAA4A-4F65-5408-601B-6A8792F2C501";
createNode eulerToQuat -n "eulerToQuat10";
	rename -uid "852D2A02-461F-D1B1-F613-29A3210EAC12";
createNode unitConversion -n "unitConversion13";
	rename -uid "189C39F4-47EA-E588-A26B-349C67E32AD1";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear14";
	rename -uid "0268026E-4400-9156-89F6-D3A5349B9AE6";
	setAttr ".i2" 10;
createNode addDoubleLinear -n "addDoubleLinear8";
	rename -uid "C70FE2AA-4BA6-422B-3BAA-7DB2DCDCEBEC";
	setAttr ".ihi" 2;
	setAttr ".i2" -108.27;
createNode dagPose -n "bindPose1";
	rename -uid "53E71F6E-4074-5492-1BE8-FFAFCD358120";
	setAttr -s 14 ".wm";
	setAttr ".wm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1.3921395628662506e-16 0 0 1;
	setAttr ".wm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1.3921395628662506e-16 0 0 1;
	setAttr ".wm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 15 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 0.99999999999999956 0.99999999999999956 1 0
		 0 0 0 0 0 2.9128324422741665e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 0.94879333057275839 0.94879333057275839 1 0
		 0 0 0 0 0 0.31589747681906605 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 0.94848967212553048 0.94848967212553048 1 0
		 0 0 0 0 0 -0.31680805209338309 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.79181016419459438 0.79181016419459438 1 0
		 0 0 0 0 0 0.61076727472755887 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 0.58608951931295872 0.58608951931295872 1 0
		 0 0 0 0 0 0.81024630536121856 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 0.42712110404869169 0.42712110404869169 1.1310166835209357 0
		 0 0 0 0 0 0.90419442736406352 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.066556617061704015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 2.3412563568528335 2.3412563568528335
		 0.88416025560907607 no;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 0.56446286832700165 0.56446286832700165 1 0
		 0 0 0 0 0 -0.82545846066295425 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 0.79947503107409235 0.79947503107409235 1 0
		 0 0 0 0 0 -0.6006993213655889 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.094798917737457203 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 2.3156206806200763 2.3156206806200763
		 0.87447910899549697 no;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 5.0115806818520312
		 1.9587701269313376 0 0 0 0 5.0115806818520312 1.9587701269313376 1.3921395628662506e-16
		 -2.3608268103196185e-16 -3.9443045261050722e-31 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.3921395628662506e-16
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 0.43184965843897211 0.43184965843897211
		 1.1435378955463982 0 0 0 0 0 0 0.9019456039618704 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 15 ".m";
	setAttr -s 15 ".p";
	setAttr -s 5 ".g[11:15]" yes yes yes yes yes;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster3";
	rename -uid "B01D66FB-4C0F-236C-EBD1-B5BA30BF1C53";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".skm" 2;
	setAttr -s 341 ".wl";
	setAttr ".wl[0:237].w"
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 8 0.99999998980632043 9 1.0193679574227675e-08
		1 8 1
		2 8 0.99999994039535522 9 5.9604644775390625e-08
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 2 1.6693778291470914e-07 9 0.99999983306221718
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 5.9604644775390625e-08 9 0.99999994039535522
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 0 9.1782946429037578e-08 2 0.99999990821705353
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		3 0 0.9999999727451393 1 2.7254860735981836e-08 10 0.094140559434890747
		3 0 0.99999994039535522 1 5.9604644775390625e-08 10 0.094136335657062642
		2 0 1 10 0.094131141901016235
		2 0 1 10 0.094126970978483132
		2 0 1 10 0.094125315546989441
		2 0 1 10 0.094126970978483132
		2 0 1 10 0.094131135151767242
		2 0 1 10 0.094136319353160858
		2 0 1 10 0.094140484929084778
		2 0 1 10 0.094142087505326322
		2 0 1 10 0.094140484929084778
		2 0 1 10 0.09413631120121016
		2 0 1 10 0.094131120250605937
		2 0 1 10 0.094126886918195429
		2 0 1 10 0.094125285744667053
		2 0 1 10 0.094126880168914795
		3 0 0.99999994039535522 1 5.9604644775390625e-08 10 0.09413108229637146
		2 0 1 10 0.094136297702789307
		2 0 1 10 0.094140463278744091
		2 0 1 10 0.094142072604165017
		2 1 1 10 0.14282116506727288
		2 1 1 10 0.14281913638114929
		2 1 1 10 0.14281660318374634
		2 1 1 10 0.14281456172466278
		3 1 0.99999988079071045 3 1.1920928955078125e-07 10 0.1428137868642807
		3 1 0.99999994039535522 3 5.9604644775390625e-08 10 0.14281454895160423
		2 1 1 10 0.14281660318374634
		3 1 0.99999994039535522 3 5.9604644775390625e-08 10 0.1428191214799881
		2 1 1 10 0.14282114803791046
		2 1 1 10 0.1428219207700801
		2 1 1 10 0.14282114590970957
		2 1 1 10 0.1428191065788269
		2 1 1 10 0.1428165861544522
		2 1 1 10 0.14281454682350159
		2 1 1 10 0.14281375493386755
		2 1 1 10 0.14281453192234039
		2 1 1 10 0.14281657338142395
		2 1 1 10 0.14281909167766571
		2 1 1 10 0.14282114803791046
		2 1 1 10 0.14282190799713135
		2 3 1 10 0.18604104082255779
		2 3 1 10 0.18604214350847795
		2 3 1 10 0.18604350090026855
		2 3 1 10 0.18604463477465982
		2 3 1 10 0.18604506552219391
		2 3 1 10 0.18604464967582116
		3 3 0.99999994039535522 4 5.9604644775390625e-08 10 0.18604351580142975
		2 3 1 10 0.18604214766684396
		3 3 0.99999988079071045 4 1.1920928955078125e-07 10 0.18604104220867157
		2 3 1 10 0.18604061146110754
		3 3 0.99999982118606567 4 1.7881393432617188e-07 10 0.18604103943644407
		2 3 1 10 0.18604214350847795
		2 3 1 10 0.18604352931645865
		2 3 1 10 0.18604464551739924
		2 3 1 10 0.18604506552219391
		2 3 1 10 0.18604464690353983
		3 3 0.99999994039535522 4 5.9604644775390625e-08 10 0.18604353070259094
		2 3 1 10 0.186042158409639
		2 3 1 10 0.18604104220867157
		2 3 1 10 0.18604062497615814
		2 4 1 10 0.23260147652959939
		2 4 1 10 0.23260456150319753
		3 4 0.99999994039535522 7 5.9604644775390625e-08 10 0.23260842393678668
		2 4 1 10 0.23261156634872487
		2 4 1 10 0.23261274137408203
		2 4 1 10 0.23261156634872487
		2 4 1 10 0.23260846647393535
		2 4 1 10 0.23260461053927928
		2 4 1 10 0.23260149706306305
		2 4 1 10 0.23260025550089633
		2 4 1 10 0.23260149706306305
		2 4 1 10 0.23260460663994062
		2 4 1 10 0.23260846734046936
		2 4 1 10 0.23261157951679473
		2 4 1 10 0.23261274137408203
		2 4 1 10 0.2326115918183187
		2 4 1 10 0.23260846734046936
		2 4 1 10 0.23260462110784191
		2 4 1 10 0.23260151906681212
		2 4 1 10 0.23260031857155558
		2 7 1 10 0.26390758304246281
		2 7 1 10 0.26391005909308879
		2 7 1 10 0.26391314968628532
		2 7 1 10 0.26391562573690319
		2 7 1 10 0.26391658703074639
		2 7 1 10 0.26391562598269375
		2 7 1 10 0.2639131494404971
		2 7 1 10 0.26391007980135112
		2 7 1 10 0.26390758500872757
		2 7 1 10 0.26390665597529467
		2 7 1 10 0.26390758156776428
		2 7 1 10 0.26391008643755737
		2 7 1 10 0.26391315066943838
		2 7 1 10 0.26391562598269375
		2 7 1 10 0.26391660896774133
		2 7 1 10 0.26391563114429595
		2 7 1 10 0.26391315632256873
		2 7 1 10 0.26391010862053121
		2 7 1 10 0.26390758156776428
		2 7 1 10 0.26390668577761689
		1 6 1
		3 7 0.95439532805147542 10 0.26717415327590821 11 0.045604671948524585
		3 7 0.9523792920970352 10 0.26717659905695335 11 0.047620707902964826
		3 7 0.95216002458983762 10 0.26717969202889791 11 0.047839975410162321
		3 7 0.95213802830688865 10 0.26718214701675552 11 0.047861971693111446
		3 7 0.9521360280806529 10 0.26718309596325207 11 0.04786397191934709
		3 7 0.95213607424680913 10 0.26718214477726066 11 0.047863925753190907
		3 7 0.9521370371565705 10 0.26717969800082941 11 0.047862962843429668
		3 7 0.95213808898103947 10 0.26717665766628773 11 0.047861911018960479
		3 7 0.95213867868570179 10 0.267174179843501 11 0.047861321314298294
		3 7 0.95213910822243064 10 0.26717322616920058 11 0.04786089177756947
		3 7 0.95213865853279789 10 0.26717417810172361 11 0.04786134146720207
		3 7 0.95213786069504802 10 0.26717665268973473 11 0.047862139304951944
		3 7 0.95213690287730235 10 0.26717969800082941 11 0.047863097122697686
		3 7 0.95213580506273487 10 0.26718220089824668 11 0.047864194937265063
		3 7 0.95213566585657239 10 0.26718312103773473 11 0.047864334143427625
		3 7 0.95213582778955841 10 0.2671822056260702 11 0.047864172210441543
		3 7 0.95213694964842022 10 0.2671797039727612 11 0.04786305035157979
		3 7 0.95213802427709848 10 0.26717665990573658 11 0.047861975722901635
		3 7 0.95199524316265471 10 0.26717418407353183 11 0.048004756837345286
		3 7 0.94998020600650857 10 0.26717323413158328 11 0.050019793993491338
		3 7 0.68970776017835644 10 0.2798312268615209 11 0.31029223982164356
		3 7 0.68486511014967344 10 0.27983364684375561 11 0.31513488985032656
		3 7 0.68424927038670791 10 0.2798365665592093 11 0.31575072961329209
		3 7 0.68417398326725842 10 0.27983883368583823 11 0.31582601673274158
		3 7 0.68416486283359979 10 0.27983974869672695 11 0.31583513716640021
		3 7 0.68416459346916669 10 0.27983885508315803 11 0.31583540653083331
		3 7 0.68416580657639359 10 0.27983659180071446 11 0.31583419342360641
		3 7 0.6841677016676817 10 0.27983367886130933 11 0.3158322983323183
		3 7 0.68416953086554066 10 0.27983126552469068 11 0.31583046913445934
		3 7 0.68417021796506683 10 0.27983036878372625 11 0.31582978203493317
		3 7 0.68416969303432196 10 0.2798312643519314 11 0.31583030696567804
		3 7 0.68416799039608833 10 0.27983369823901444 11 0.31583200960391167
		3 7 0.68416590792556597 10 0.27983659362504149 11 0.31583409207443403
		3 7 0.68416457837472422 10 0.27983885957885718 11 0.31583542162527578
		3 7 0.68416395157594656 10 0.27983978442817886 11 0.31583604842405344
		3 7 0.68416457550984167 10 0.27983886348816095 11 0.31583542449015833
		3 7 0.68416653996337762 10 0.27983662329705455 11 0.31583346003662238
		3 7 0.68417689826589145 10 0.27983370872878605 11 0.31582310173410855
		3 7 0.68421002559834732 10 0.27983125718506918 11 0.31578997440165268
		3 7 0.67937384086715213 10 0.27983037256260529 11 0.32062615913284787
		3 7 0.12816898061770307 10 0.30338770458413411 11 0.8718310193822969
		3 7 0.12786417424703914 10 0.3033903004236661 11 0.87213582575296089
		3 7 0.12776247158374077 10 0.30339341705846729 11 0.87223752841625923
		3 7 0.12774388347781371 10 0.30339584266678393 11 0.87225611652218626
		3 7 0.12774204535343023 10 0.30339682229355508 11 0.87225795464656974
		3 7 0.12774134306228274 10 0.30339586692387815 11 0.87225865693771731
		3 7 0.12774011735298207 10 0.30339342119086543 11 0.87225988264701793
		3 7 0.12773898326840821 10 0.30339029304193676 11 0.87226101673159184
		3 7 0.12773786842696994 10 0.30338772965371336 11 0.87226213157303012
		3 7 0.12773745823094548 10 0.30338674430518009 11 0.87226254176905449
		3 7 0.12773804944346426 10 0.30338772742861764 11 0.87226195055653577
		3 7 0.1277391743620889 10 0.30339032884853706 11 0.87226082563791107
		3 7 0.12774025615336049 10 0.30339344774378019 11 0.87225974384663951
		3 7 0.12774152328614738 10 0.30339586551108105 11 0.87225847671385259
		3 7 0.12774198362003483 10 0.30339687995559766 11 0.87225801637996514
		3 7 0.12774338801533949 10 0.30339592059477399 11 0.87225661198466053
		2 7 0.12774990164941935 10 0.30339345325364492;
	setAttr ".wl[237:340].w"
		1 11 0.87225009835058065
		3 7 0.12776548954917324 10 0.30339032234978908 11 0.87223451045082678
		3 7 0.12775428586060869 10 0.30338774088514947 11 0.87224571413939134
		3 7 0.12745993117042276 10 0.30338678360827809 11 0.87254006882957724
		2 10 0.31197003507054638 11 1
		2 10 0.31197337481931936 11 1
		2 10 0.31197736052209513 11 1
		2 10 0.31198049081924445 11 1
		2 10 0.31198177377190561 11 1
		2 10 0.31198054270603554 11 1
		2 10 0.31197738487657567 11 1
		2 10 0.31197338771538874 11 1
		2 10 0.31197006095051533 11 1
		2 10 0.31196880569379254 11 1
		2 10 0.31197008034770318 11 1
		2 10 0.31197342007816387 11 1
		2 10 0.31197741342589413 11 1
		2 10 0.31198057659428102 11 1
		2 10 0.3119818188669255 11 1
		2 10 0.311980579263751 11 1
		2 10 0.31197742159765823 11 1
		2 10 0.31197345925065645 11 1
		2 10 0.31197011681439668 11 1
		2 10 0.31196883289938149 11 1
		2 10 0.31524050698153488 11 1
		2 10 0.31524548154728588 11 1
		2 10 0.31525137892065125 11 1
		2 10 0.3152560041894038 11 1
		2 10 0.3152579039042876 11 1
		2 10 0.31525605975697946 11 1
		2 10 0.31525138314116175 11 1
		2 10 0.3152454765194676 11 1
		2 10 0.31524055370489079 11 1
		2 10 0.31523870783258057 11 1
		2 10 0.31524058504856339 11 1
		2 10 0.31524552981181342 11 1
		2 10 0.31525143907579722 11 1
		2 10 0.31525612119665647 11 1
		2 10 0.31525796552747892 11 1
		2 10 0.31525614446626415 11 1
		2 10 0.31525146788721686 11 1
		2 10 0.31524556959637534 11 1
		2 10 0.315240610190133 11 1
		2 10 0.31523873535958802 11 1
		2 10 0.30578884315070748 11 1
		2 10 0.30579346870488611 11 1
		2 10 0.30579904291404492 11 1
		2 10 0.30580336410847081 11 1
		2 10 0.30580511589504972 11 1
		2 10 0.30580339213078372 11 1
		2 10 0.30579906175166122 11 1
		2 10 0.30579350185351956 11 1
		2 10 0.30578887697566137 11 1
		2 10 0.30578714687462399 11 1
		2 10 0.3057888996226828 11 1
		2 10 0.30579352695676781 11 1
		2 10 0.30579909728553473 11 1
		2 10 0.3058034147418654 11 1
		2 10 0.30580517275846292 11 1
		2 10 0.30580348103934907 11 1
		2 10 0.30579910807224436 11 1
		2 10 0.30579354999527003 11 1
		2 10 0.30578893665150364 11 1
		2 10 0.30578718422378892 11 1
		3 7 0.4901 10 0.27101269604137224 11 0.5099
		3 7 0.4901 10 0.2710163012390005 11 0.5099
		3 7 0.4901 10 0.27102073850376052 11 0.5099
		3 7 0.4901 10 0.27102416678045643 11 0.5099
		3 7 0.4901 10 0.27102556824684143 11 0.5099
		3 7 0.4901 10 0.27102416488737452 11 0.5099
		3 7 0.4901 10 0.27102074872627402 11 0.5099
		3 7 0.4901 10 0.27101638648130738 11 0.5099
		3 7 0.4901 10 0.2710127183978871 11 0.5099
		3 7 0.4901 10 0.27101138713696632 11 0.5099
		3 7 0.4901 10 0.27101274706440764 11 0.5099
		3 7 0.4901 10 0.27101641262377585 11 0.5099
		3 7 0.4901 10 0.27102082551285289 11 0.5099
		3 7 0.4901 10 0.27102419393246374 11 0.5099
		3 7 0.4901 10 0.27102560322361524 11 0.5099
		3 7 0.4901 10 0.27102422095826512 11 0.5099
		3 7 0.4901 10 0.27102083258027176 11 0.5099
		3 7 0.4901 10 0.27101642044829066 11 0.5099
		3 7 0.4901 10 0.27101275551981741 11 0.5099
		3 7 0.4901 10 0.27101138751556486 11 0.5099
		2 7 1 10 0.26222285726004413
		2 7 1 10 0.26222031209625857
		2 7 1 10 0.26221716281856805
		2 7 1 10 0.26221460226091836
		2 7 1 10 0.26221364809818654
		2 7 1 10 0.26221460226091836
		2 7 1 10 0.26221716281856799
		2 7 1 10 0.2622203487365079
		2 7 1 10 0.26222288071280031
		2 7 1 10 0.26222389618967601
		2 7 1 10 0.26222288046858622
		2 7 1 10 0.26222035020177825
		2 7 1 10 0.26221716941220474
		2 7 1 10 0.26221460226091836
		2 7 1 10 0.26221364174884393
		2 7 1 10 0.2622145929810763
		2 7 1 10 0.26221716941220474
		2 7 1 10 0.26222032797001915
		2 7 1 10 0.26222285823690039
		2 7 1 10 0.26222386858528901;
	setAttr -s 12 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.0000023441039427 0 0 0 0 1.0000023441039427 0 0
		 0 0 1 0 0 0 0.0021652231758063976 1;
	setAttr ".pm[1]" -type "matrix" 1.0529983779909329 0 0 0 0 1.0529983779909329 0 0
		 0 0 1 0 0 0 -0.31325491226452856 1;
	setAttr ".pm[2]" -type "matrix" 1.054853923623857 0 0 0 0 1.054853923623857 0 0 0 0 1 0
		 0 0 0.3182746162148849 1;
	setAttr ".pm[3]" -type "matrix" 1.2596302860960846 0 0 0 0 1.2596302860960846 0 0
		 0 0 1 0 0 0 -0.60806957707926867 1;
	setAttr ".pm[4]" -type "matrix" 1.6968049683383206 0 0 0 0 1.6968049683383206 0 0
		 0 0 1 0 0 0 -0.80788298594033925 1;
	setAttr ".pm[5]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.78994146992176106 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1;
	setAttr ".pm[7]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.72338485286005705 1;
	setAttr ".pm[8]" -type "matrix" 1.7723975386476538 0 0 0 0 1.7723975386476538 0 0
		 0 0 1 0 0 0 0.82563302195322763 1;
	setAttr ".pm[9]" -type "matrix" 1.2516940765802922 0 0 0 0 1.2516940765802922 0 0
		 0 0 1 0 0 0 0.60144094826706673 1;
	setAttr ".pm[11]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.69514255218430376 1;
	setAttr ".pm[12]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.78994146992176106 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 11 ".ma";
	setAttr -s 12 ".dpf";
	setAttr ".dpf[0]" 4;
	setAttr ".dpf[1]" 4;
	setAttr ".dpf[2]" 4;
	setAttr ".dpf[3]" 4;
	setAttr ".dpf[4]" 4;
	setAttr ".dpf[5]" 4;
	setAttr ".dpf[6]" 4;
	setAttr ".dpf[7]" 4;
	setAttr ".dpf[8]" 4;
	setAttr ".dpf[9]" 4;
	setAttr ".dpf[11]" 4;
	setAttr ".dpf[12]" 4;
	setAttr -s 11 ".lw";
	setAttr ".mi" 6;
	setAttr ".bm" 1;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
	setAttr -s 11 ".ifcl";
createNode tweak -n "tweak3";
	rename -uid "B6A0FE98-4148-2AEC-3671-D9953EA34403";
createNode objectSet -n "skinCluster3Set";
	rename -uid "14534411-41EB-4AB7-29EC-53906B1AD045";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster3GroupId";
	rename -uid "7F20F4A9-4E1A-B1F0-0DC4-19B15F515142";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster3GroupParts";
	rename -uid "D972B289-4926-69FE-2BEE-B0893792FED7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet3";
	rename -uid "F4C11112-453A-B908-3E82-3BBD71CF8517";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId7";
	rename -uid "552B22A5-4D6C-F57F-D710-949CA6CFC04F";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	rename -uid "F5774AE8-4E3E-AF42-421B-2E9D8DD885FE";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose2";
	rename -uid "342CE69E-4672-376D-F3F9-18A046B3BA44";
	setAttr -s 10 ".wm";
	setAttr ".wm[0]" -type "matrix" 0.9999976559015521 0 0 0 0 0.9999976559015521 0 0
		 0 0 1 0 0 0 -0.0021652231758063976 1;
	setAttr ".wm[1]" -type "matrix" 0.94966907917555288 0 0 0 0 0.94966907917555288 0 0
		 0 0 1 0 0 0 0.31325491226452851 1;
	setAttr ".wm[2]" -type "matrix" 0.94799855942573441 0 0 0 0 0.94799855942573441 0 0
		 0 0 1 0 0 0 -0.31827461621488495 1;
	setAttr ".wm[3]" -type "matrix" 0.79388373798097123 0 0 0 0 0.79388373798097123 0 0
		 0 0 1 0 0 0 0.60806957707926867 1;
	setAttr ".wm[4]" -type "matrix" 0.58934292311702685 0 0 0 0 0.58934292311702685 0 0
		 0 0 1 0 0 0 0.80788298594033914 1;
	setAttr ".wm[5]" -type "matrix" 0.43131179988993451 0 0 0 0 0.43131179988993451 0 0
		 0 0 1.1421136461085466 0 0 0 0.90220293242468741 1;
	setAttr ".wm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 -1.0869280817694462 1;
	setAttr ".wm[7]" -type "matrix" 0.43131179988993451 0 0 0 0 0.43131179988993451 0 0
		 0 0 1.1421136461085466 0 0 0 0.82618771183969431 1;
	setAttr ".wm[8]" -type "matrix" 0.56420750886564863 0 0 0 0 0.56420750886564863 0 0
		 0 0 1 0 0 0 -0.82563302195322774 1;
	setAttr ".wm[9]" -type "matrix" 0.79891725838638117 0 0 0 0 0.79891725838638117 0 0
		 0 0 1 0 0 0 -0.60144094826706662 1;
	setAttr -s 10 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 0.9999976559015521 0.9999976559015521 1 0
		 0 0 0 0 0 -0.0021652231758063976 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 0.94966907917555288 0.94966907917555288 1 0
		 0 0 0 0 0 0.31325491226452851 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 0.94799855942573441 0.94799855942573441 1 0
		 0 0 0 0 0 -0.31827461621488495 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.79388373798097123 0.79388373798097123 1 0
		 0 0 0 0 0 0.60806957707926867 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 0.58934292311702685 0.58934292311702685 1 0
		 0 0 0 0 0 0.80788298594033914 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 0.43131179988993451 0.43131179988993451 1.1421136461085466 0
		 0 0 0 0 0 0.90220293242468741 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -1.0869280817694462 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.066556617061704126 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 2.3185083279780145 2.3185083279780145
		 0.87556961026360058 no;
	setAttr ".xm[8]" -type "matrix" "xform" 0.56420750886564863 0.56420750886564863 1 0
		 0 0 0 0 0 -0.82563302195322774 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 0.79891725838638117 0.79891725838638117 1 0
		 0 0 0 0 0 -0.60144094826706662 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr -s 10 ".m";
	setAttr -s 10 ".p";
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster5";
	rename -uid "2B1A2DBC-41A8-A1F5-1644-72A2AFC74D76";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".skm" 2;
	setAttr -s 18 ".bw";
	setAttr ".bw[24]" 1;
	setAttr ".bw[25]" 1;
	setAttr ".bw[26]" 1;
	setAttr ".bw[27]" 1;
	setAttr ".bw[28]" 1;
	setAttr ".bw[29]" 1;
	setAttr ".bw[30]" 1;
	setAttr ".bw[31]" 1;
	setAttr ".bw[285]" 1;
	setAttr ".bw[286]" 1;
	setAttr ".bw[288]" 1;
	setAttr ".bw[289]" 1;
	setAttr ".bw[290]" 1;
	setAttr ".bw[294]" 1;
	setAttr ".bw[295]" 1;
	setAttr ".bw[296]" 1;
	setAttr ".bw[297]" 1;
	setAttr ".bw[298]" 1;
	setAttr -s 301 ".wl";
	setAttr ".wl[0:300].w"
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 8 0.99999998980632032 9 1.0193679678138778e-08
		1 8 1
		2 8 0.99999994039535522 9 5.9604644775390625e-08
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 2 1.6693778093213041e-07 9 0.99999983306221907
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 5.9604644775390625e-08 9 0.99999994039535522
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 0 9.1782943911766779e-08 2 0.99999990821705609
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 0.99999997274513852 1 2.7254861478809289e-08
		2 0 0.99999994039535522 1 5.9604644775390625e-08
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.99999994039535522 1 5.9604644775390625e-08
		1 0 1
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		2 1 0.99999988079071045 3 1.1920928955078125e-07
		2 1 0.99999994039535522 3 5.9604644775390625e-08
		1 1 1
		2 1 0.99999994039535522 3 5.9604644775390625e-08
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		2 3 0.99999994039535522 4 5.9604644775390625e-08
		1 3 1
		2 3 0.99999988079071045 4 1.1920928955078125e-07
		1 3 1
		2 3 0.99999982118606567 4 1.7881393432617188e-07
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		2 3 0.99999994039535522 4 5.9604644775390625e-08
		1 3 1
		1 3 1
		1 3 1
		1 4 1
		1 4 1
		2 4 0.99999994039535522 7 5.9604644775390625e-08
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 6 1
		2 4 0.030280828442958652 7 0.96971917155704135
		2 4 0.03028040947158539 7 0.96971959052841461
		2 4 0.030280053615570068 7 0.96971994638442993
		2 4 0.030279874801635742 7 0.96972012519836426
		2 4 0.030280649662017822 7 0.96971935033798218
		2 4 0.030280470848083496 7 0.9697195291519165
		2 4 0.030280709266662598 7 0.9697192907333374
		2 4 0.030281424522399902 7 0.9697185754776001
		2 4 0.030281186103820801 7 0.9697188138961792
		2 4 0.030282020568847656 7 0.96971797943115234
		2 4 0.030281126499176025 7 0.96971887350082397
		2 4 0.030281484127044678 7 0.96971851587295532
		2 4 0.030280590057373047 7 0.96971940994262695
		2 4 0.03028029203414917 7 0.96971970796585083
		2 4 0.030280470848083496 7 0.9697195291519165
		2 4 0.03028029203414917 7 0.96971970796585083
		2 4 0.030280947685241699 7 0.9697190523147583
		2 4 0.03028106689453125 7 0.96971893310546875
		2 4 0.03028106689453125 7 0.96971893310546875
		2 4 0.030281364917755127 7 0.96971863508224487
		1 7 1
		1 7 1
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		2 4 0.11080378293991089 7 0.88919621706008911
		2 4 0.11080306768417358 7 0.88919693231582642
		2 4 0.11080175638198853 7 0.88919824361801147
		2 4 0.11080056428909302 7 0.88919943571090698
		2 4 0.11080050468444824 7 0.88919949531555176
		2 4 0.11080050468444824 7 0.88919949531555176
		2 4 0.11080133254520064 7 0.88919866745479936
		2 4 0.11080265045166016 7 0.88919734954833984
		2 4 0.11080366373062134 7 0.88919633626937866
		2 4 0.11080473661422729 7 0.88919526338577271
		2 4 0.11080408096313477 7 0.88919591903686523
		2 4 0.11080300807952881 7 0.88919699192047119
		2 4 0.1108020544052124 7 0.8891979455947876
		2 4 0.11080068349838257 7 0.88919931650161743
		2 4 0.11080121994018555 7 0.88919878005981445
		2 4 0.11080068349838257 7 0.88919931650161743
		2 4 0.11080211400985718 7 0.88919788599014282
		2 4 0.11080306768417358 7 0.88919693231582642
		2 4 0.11080378293991089 7 0.88919621706008911
		2 4 0.11080461740493774 7 0.88919538259506226;
	setAttr -s 11 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.0000023441039427 0 0 0 0 1.0000023441039427 0 0
		 0 0 1 0 0 0 0.0021652231758063976 1;
	setAttr ".pm[1]" -type "matrix" 1.0529983779909329 0 0 0 0 1.0529983779909329 0 0
		 0 0 1 0 0 0 -0.31325491226452856 1;
	setAttr ".pm[2]" -type "matrix" 1.054853923623857 0 0 0 0 1.054853923623857 0 0 0 0 1 0
		 0 0 0.3182746162148849 1;
	setAttr ".pm[3]" -type "matrix" 1.2596302860960846 0 0 0 0 1.2596302860960846 0 0
		 0 0 1 0 0 0 -0.60806957707926867 1;
	setAttr ".pm[4]" -type "matrix" 1.6968049683383206 0 0 0 0 1.6968049683383206 0 0
		 0 0 1 0 0 0 -0.80788298594033925 1;
	setAttr ".pm[5]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.78994146992176106 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1;
	setAttr ".pm[7]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.72338485286005705 1;
	setAttr ".pm[8]" -type "matrix" 1.7723975386476538 0 0 0 0 1.7723975386476538 0 0
		 0 0 1 0 0 0 0.82563302195322763 1;
	setAttr ".pm[9]" -type "matrix" 1.2516940765802922 0 0 0 0 1.2516940765802922 0 0
		 0 0 1 0 0 0 0.60144094826706673 1;
	setAttr ".pm[10]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.69514255218430376 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 11 ".ma";
	setAttr -s 11 ".dpf[0:10]"  4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 11 ".lw";
	setAttr -s 11 ".lw";
	setAttr ".mi" 6;
	setAttr ".bm" 1;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
	setAttr -s 11 ".ifcl";
	setAttr -s 11 ".ifcl";
createNode tweak -n "tweak5";
	rename -uid "6F2D54D1-474B-4669-163F-FC8507630405";
createNode objectSet -n "skinCluster5Set";
	rename -uid "7AA15621-40DF-7D0C-A64B-158AF5037165";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster5GroupId";
	rename -uid "7EC8CC95-439B-AADB-D02C-BB9729EB8871";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster5GroupParts";
	rename -uid "03D596CA-4D23-CFE6-AD73-DBBD7E63421F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[0:300]";
createNode objectSet -n "tweakSet5";
	rename -uid "8D61E3B8-4F0F-27CA-6E29-54B1694D43F9";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId12";
	rename -uid "96D97AF5-4B9F-36E6-8387-8FA5E3385132";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts11";
	rename -uid "94D11497-47E1-CB82-9D12-63811408A7AE";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode blendShape -n "blendShape1";
	rename -uid "1176EC86-46CA-2BFA-29D6-8A925D424C9D";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 3 ".w";
	setAttr -s 3 ".w";
	setAttr -s 3 ".it[0].itg";
	setAttr ".it[0].itg[0].iti[6000].ipt" -type "pointArray" 320 -0.00012421607971191406
		 -4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00010567903518676758 -7.6770782470703125e-05
		 -8.3804130554199219e-05 1 -7.6770782470703125e-05 -0.00010564923286437988 -8.3804130554199219e-05
		 1 -4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05 1 0 -0.00013059377670288086
		 -8.3744525909423828e-05 1 4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05
		 1 7.6770782470703125e-05 -0.00010567903518676758 -8.3804130554199219e-05 1 0.00010564923286437988
		 -7.6770782470703125e-05 -8.3804130554199219e-05 1 0.00012421607971191406 -4.0352344512939453e-05
		 -8.3744525909423828e-05 1 0.00013059377670288086 0 -8.3804130554199219e-05 1 0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 0.00010564923286437988 7.6770782470703125e-05
		 -8.3804130554199219e-05 1 7.6770782470703125e-05 0.00010567903518676758 -8.3804130554199219e-05
		 1 4.0367245674133301e-05 0.00012421607971191406 -8.3744525909423828e-05 1 3.893774191965349e-12
		 0.00013059377670288086 -8.3744525909423828e-05 1 -4.0352344512939453e-05 0.00012421607971191406
		 -8.3744525909423828e-05 1 -7.6770782470703125e-05 0.00010567903518676758 -8.3744525909423828e-05
		 1 -0.00010567903518676758 7.6770782470703125e-05 -8.3804130554199219e-05 1 -0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00013065338134765625 0 -8.3804130554199219e-05
		 1 -0.00026369094848632812 -8.5681676864624023e-05 -0.00035595893859863281 1 -0.00022435188293457031
		 -0.00016295909881591797 -0.00035595893859863281 1 -0.00016295909881591797 -0.00022435188293457031
		 -0.00035595893859863281 1 -8.5651874542236328e-05 -0.00026363134384155273 -0.00035595893859863281
		 1 0 -0.00027716159820556641 -0.00035595893859863281 1 8.5651874542236328e-05 -0.00026363134384155273
		 -0.00035595893859863281 1 0.00016295909881591797 -0.00022435188293457031 -0.00035595893859863281
		 1 0.00022435188293457031 -0.00016295909881591797 -0.00035595893859863281 1 0.00026369094848632812
		 -8.5651874542236328e-05 -0.00035595893859863281 1 0.0002772212028503418 0 -0.00035595893859863281
		 1 0.00026369094848632812 8.5651874542236328e-05 -0.00035595893859863281 1 0.00022429227828979492
		 0.00016295909881591797 -0.00035595893859863281 1 0.00016295909881591797 0.00022429227828979492
		 -0.00035595893859863281 1 8.5651874542236328e-05 0.00026363134384155273 -0.00035595893859863281
		 1 8.2618356600505649e-12 0.00027716159820556641 -0.00035595893859863281 1 -8.5681676864624023e-05
		 0.00026363134384155273 -0.00035595893859863281 1 -0.00016292929649353027 0.00022429227828979492
		 -0.00035595893859863281 1 -0.00022429227828979492 0.00016295909881591797 -0.00035595893859863281
		 1 -0.00026363134384155273 8.5651874542236328e-05 -0.00035595893859863281 1 -0.0002772212028503418
		 0 -0.00035595893859863281 1 -0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00019574165344238281 -0.00014221668243408203 -0.00070393085479736328 1 -0.00014215707778930664
		 -0.00019562244415283203 -0.00070393085479736328 1 -7.4744224548339844e-05 -0.00023007392883300781
		 -0.00070393085479736328 1 0 -0.00024187564849853516 -0.00070393085479736328 1 7.4744224548339844e-05
		 -0.00023007392883300781 -0.00070393085479736328 1 0.00014215707778930664 -0.00019562244415283203
		 -0.00070393085479736328 1 0.00019568204879760742 -0.00014221668243408203 -0.00070393085479736328
		 1 0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328 1 0.00024187564849853516
		 0 -0.00070393085479736328 1 0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 0.00019568204879760742 0.00014221668243408203 -0.00070393085479736328 1 0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 7.4744224548339844e-05 0.00023007392883300781
		 -0.00070393085479736328 1 7.2084560542862164e-12 0.00024187564849853516 -0.00070393085479736328
		 1 -7.4744224548339844e-05 0.00023001432418823242 -0.00070393085479736328 1 -0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 -0.00019568204879760742 0.00014209747314453125
		 -0.00070393085479736328 1 -0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00024187564849853516 0 -0.00070393085479736328 1 -1.1324882507324219e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 -9.5367431640625e-07 -6.5565109252929688e-07 -0.0010392910335212946
		 1 -7.152557373046875e-07 -9.5367431640625e-07 -0.0010392910335212946 1 -3.5762786865234375e-07
		 -1.1324882507324219e-06 -0.0010392910335212946 1 -4.9960036108132044e-16 -1.0728836059570312e-06
		 -0.0010392910335212946 1 3.5762786865234375e-07 -1.1324882507324219e-06 -0.0010392910335212946
		 1 7.152557373046875e-07 -8.9406967163085938e-07 -0.0010392910335212946 1 8.9406967163085938e-07
		 -6.5565109252929688e-07 -0.0010392910335212946 1 1.0728836059570312e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 1.1920928955078125e-06 7.7715611723760958e-16 -0.0010392910335212946
		 1 1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 9.5367431640625e-07
		 6.5565109252929688e-07 -0.0010392910335212946 1 7.152557373046875e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 3.5762786865234375e-07 1.1324882507324219e-06 -0.0010392910335212946
		 1 3.5527136788005009e-14 1.1920928955078125e-06 -0.0010392910335212946 1 -3.5762786865234375e-07
		 1.0728836059570312e-06 -0.0010392910335212946 1 -6.5565109252929688e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 -8.9406967163085938e-07 6.5565109252929688e-07 -0.0010392910335212946
		 1 -1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 -1.1920928955078125e-06
		 7.7715611723760958e-16 -0.0010392910335212946 1 0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 0.0003502964973449707 0.00025445222854614258 -0.0012683868408203125
		 1 0.00025445222854614258 0.00035023689270019531 -0.0012683868408203125 1 0.00013378262519836426
		 0.00041174888610839844 -0.0012683868408203125 1 2.2604140781368187e-13 0.00043290853500366211
		 -0.0012683868408203125 1 -0.00013378262519836426 0.00041174888610839844 -0.0012683868408203125
		 1 -0.00025451183319091797 0.00035023689270019531 -0.0012683868408203125 1 -0.00035023689270019531
		 0.00025451183319091797 -0.0012683868408203125 1 -0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 -0.00043290853500366211 -8.475442569988445e-13 -0.0012683868408203125
		 1 -0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 -0.0003502964973449707
		 -0.00025445222854614258 -0.0012683868408203125 1 -0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 -0.00013378262519836426 -0.00041174888610839844 -0.0012683868408203125
		 1 -1.2677858762799588e-11 -0.00043290853500366211 -0.0012683868408203125 1 0.00013375282287597656
		 -0.00041174888610839844 -0.0012683868408203125 1 0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 0.00035023689270019531 -0.00025445222854614258 -0.0012683868408203125
		 1 0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 0.00043290853500366211
		 -8.475442569988445e-13 -0.0012683868408203125 1 0.00097805261611938477 0.00031778216361999512
		 -0.0012948513031005859 1 0.00083196163177490234 0.00060445070266723633 -0.0012948513031005859
		 1 0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 0.00031781196594238281
		 0.00097805261611938477 -0.0012948513031005859 1 -1.3798961973066071e-12 0.0010283589363098145
		 -0.0012948513031005859 1 -0.00031781196594238281 0.00097805261611938477 -0.0012948513031005859
		 1 -0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 -0.00083196163177490234
		 0.00060445070266723633 -0.0012948513031005859 1 -0.00097799301147460938 0.00031778216361999512
		 -0.0012948513031005859 1 -0.0010282993316650391 1.3798961973066071e-12 -0.0012948513031005859
		 1 -0.00097799301147460938 -0.00031781196594238281 -0.0012948513031005859 1 -0.00083196163177490234
		 -0.00060445070266723633 -0.0012948513031005859 1 -0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 -0.00031781196594238281 -0.00097799301147460938 -0.0012948513031005859
		 1 -3.2025937457547116e-11 -0.0010283589363098145 -0.0012948513031005859 1 0.00031775236129760742
		 -0.00097799301147460938 -0.0012948513031005859 1 0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 0.00083196163177490234 -0.00060445070266723633 -0.0012948513031005859
		 1 0.00097805261611938477 -0.00031781196594238281 -0.0012948513031005859 1 0.0010283589363098145
		 1.3798961973066071e-12 -0.0012948513031005859 1 0.0015241503715515137 0.00049524009227752686
		 -0.0011343955993652344 1 0.0012965500354766846 0.00094199180603027344 -0.0011343955993652344
		 1 0.00094199180603027344 0.0012965500354766846 -0.001134335994720459 1 0.00049524009227752686
		 0.0015241503715515137 -0.0011343955993652344 1 1.6341874879616121e-24 0.0016025900840759277
		 -0.0011343955993652344 1 -0.00049524009227752686 0.0015241503715515137 -0.0011343955993652344
		 1 -0.00094199180603027344 0.0012965500354766846 -0.0011343955993652344 1 -0.0012965798377990723
		 0.00094199180603027344 -0.001134335994720459 1 -0.0015242099761962891 0.00049524009227752686
		 -0.0011343955993652344 1 -0.0016026496887207031 0 -0.0011343955993652344 1 -0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 -0.0012965500354766846 -0.00094199180603027344
		 -0.0011343955993652344 1 -0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 -0.00049524009227752686 -0.0015241503715515137 -0.0011343955993652344 1 -4.7762682697793934e-11
		 -0.0016025900840759277 -0.0011343955993652344 1 0.00049524009227752686 -0.0015241503715515137
		 -0.0011343955993652344 1 0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 0.0012965798377990723 -0.00094199180603027344 -0.0011343955993652344 1 0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 0.0016026496887207031 0 -0.0011343955993652344
		 1 0.0018613338470458984 0.00060479342937469482 -0.00096124410629272461 1 0.0015833377838134766
		 0.0011503547430038452 -0.0009613037109375 1 0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 0.00060477852821350098 0.0018613338470458984 -0.00096124410629272461
		 1 4.5126569148123963e-11 0.0019571185111999512 -0.00096124410629272461 1 -0.00060477852821350098
		 0.0018613338470458984 -0.00096124410629272461 1 -0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 -0.0015833377838134766 0.0011503547430038452 -0.00096124410629272461
		 1 -0.0018613338470458984 0.00060477852821350098 -0.00096124410629272461 1 -0.0019571185111999512
		 0 -0.0009613037109375 1 -0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 -0.0015833377838134766 -0.0011503547430038452 -0.0009613037109375 1 -0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 -0.00060477852821350098 -0.0018613338470458984
		 -0.0009613037109375 1 -1.3199885628978336e-11 -0.0019571185111999512 -0.0009613037109375
		 1 0.00060479342937469482 -0.0018613338470458984 -0.0009613037109375 1 0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 0.0015833377838134766 -0.0011503696441650391
		 -0.0009613037109375 1 0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 0.0019571185111999512 0 -0.0009613037109375 1 0.0081200301647186279 0.0026379600167274475
		 0.00089275836944580078 1 0.0069073140621185303 0.005017697811126709 0.00089275836944580078
		 1 0.0050184428691864014 0.0069062709808349609 0.00089275836944580078 1 0.0026393905282020569
		 0.0081219971179962158 0.00089365243911743164 1 8.0398798729675036e-10 0.0085399746894836426
		 0.00089365243911743164 1 -0.00263938307762146 0.0081219971179962158 0.00089365243911743164
		 1 -0.0050184577703475952 0.0069062709808349609 0.00089275836944580078 1 -0.0069073140621185303
		 0.005017697811126709 0.00089275836944580078 1 -0.0081200301647186279 0.0026379674673080444
		 0.00089275836944580078 1 -0.0085379183292388916 -2.1363970592602755e-09 0.00089275836944580078
		 1 -0.0081200301647186279 -0.0026379674673080444 0.00089275836944580078 1 -0.0069073140621185303
		 -0.0050176829099655151 0.00089275836944580078 1 -0.0050184428691864014 -0.0069062709808349609
		 0.00089275836944580078 1 -0.00263938307762146 -0.0081219971179962158 0.00089365243911743164
		 1 5.4943871674595357e-10 -0.0085399448871612549 0.00089365243911743164 1 0.00263938307762146
		 -0.0081219971179962158 0.00089365243911743164 1 0.0050184428691864014 -0.0069062709808349609
		 0.00089275836944580078 1 0.0069073140621185303 -0.0050176829099655151 0.00089275836944580078
		 1 0.0081200003623962402 -0.0026379674673080444 0.00089275836944580078 1 0.0085379183292388916
		 -2.1363970592602755e-09 0.00089275836944580078 1 0.089747458696365356 0.029155179858207703
		 0.036116957664489746 1 0.076343804597854614 0.055456534028053284 0.036116957664489746
		 1 0.05546705424785614 0.076329275965690613 0.036116957664489746 1 0.02916070818901062
		 0.089730799198150635 0.036116957664489746 1 1.0872969302688773e-08 0.09434857964515686
		 0.036116898059844971 1 -0.029160700738430023 0.089730799198150635 0.036116957664489746
		 1 -0.055467039346694946 0.076329275965690613 0.036116957664489746 1 -0.076343804597854614
		 0.055456534028053284 0.036116957664489746 1 -0.089747428894042969 0.029155179858207703
		 0.036116898059844971 1 -0.094365894794464111 -3.7296128851949106e-08 0.036116957664489746
		 1 -0.089747428894042969 -0.029155343770980835 0.036116957664489746 1 -0.076343804597854614
		 -0.055456548929214478 0.036116898059844971 1 -0.055467039346694946 -0.076329261064529419
		 0.036116957664489746 1 -0.029160693287849426 -0.089730799198150635 0.036116957664489746
		 1 8.0606508134906107e-09 -0.09434857964515686 0.036116957664489746 1 0.02916070818901062
		 -0.089730799198150635 0.036116957664489746 1 0.055467039346694946 -0.076329261064529419
		 0.036116957664489746 1 0.07634378969669342 -0.055456548929214478 0.036116957664489746
		 1 0.089747428894042969 -0.029155343770980835 0.036116957664489746 1 0.094365894794464111
		 -3.7296128851949106e-08 0.036116957664489746 1 0.18310564756393433 0.059483356773853302
		 0.067194819450378418 1 0.15575876832008362 0.11314383149147034 0.067194819450378418
		 1 0.11316557228565216 0.15572938323020935 0.067194819450378418 1 0.059494562447071075
		 0.1830715537071228 0.067194819450378418 1 2.4263051123796231e-08 0.19249275326728821
		 0.067194819450378418 1 -0.059494547545909882 0.18307146430015564 0.067194819450378418
		 1 -0.11316554248332977 0.15572938323020935 0.067194819450378418 1 -0.15575873851776123
		 0.11314383149147034 0.067194819450378418 1 -0.18310552835464478 0.059483356773853302
		 0.067194819450378418 1 -0.19252863526344299 -1.1993861903647485e-07 0.067194819450378418
		 1 -0.18310552835464478 -0.059483438730239868 0.067194819450378418 1 -0.15575873851776123
		 -0.11314412951469421 0.067194819450378418 1 -0.11316554248332977 -0.15572947263717651
		 0.067194819450378418 1 -0.059494554996490479 -0.18307158350944519 0.067194819450378418
		 1 1.8525227574173186e-08 -0.19249270856380463 0.067194819450378418 1 0.059494562447071075
		 -0.1830715537071228 0.067194819450378418 1 0.11316552758216858 -0.15572947263717651
		 0.067194819450378418 1 0.15575866401195526 -0.11314412951469421 0.067194819450378418
		 1 0.18310558795928955 -0.059483438730239868 0.067194819450378418 1 0.19252863526344299
		 -1.1993861903647485e-07 0.067194819450378418 1 0.19821393489837646 0.064391426742076874
		 0.075306355953216553 1 0.1686108410358429 0.12247951328754425 0.075306355953216553
		 1 0.12250330299139023 0.16857865452766418 0.075306355953216553 1 0.0644037164747715
		 0.19817653298377991 0.075306355953216553 1 2.6215694504116982e-08 0.2083752453327179
		 0.075306355953216553 1 -0.064403712749481201 0.19817647337913513 0.075306355953216553
		 1 -0.12250262498855591 0.16857865452766418 0.075306355953216553 1 -0.1686103343963623
		 0.12247951328754425 0.075306355953216553 1 -0.1982138603925705 0.064391426742076874
		 0.075306355953216553 1 -0.20841410756111145 -1.2911640112633904e-07 0.075306355953216553
		 1 -0.1982138603925705 -0.064391456544399261 0.075306355953216553 1 -0.1686103343963623
		 -0.12247958779335022 0.075306355953216553 1 -0.12250262498855591 -0.16857871413230896
		 0.075306355953216553 1 -0.064403712749481201 -0.19817653298377991 0.075306355953216553
		 1 2.0004543799245766e-08 -0.20837530493736267 0.075306355953216553 1 0.0644037164747715
		 -0.19817653298377991 0.075306355953216553 1 0.12250268459320068 -0.16857871413230896
		 0.075306355953216553 1 0.1686103343963623 -0.12247958779335022 0.075306355953216553
		 1 0.1982138603925705 -0.064391456544399261 0.075306355953216553 1 0.20841410756111145
		 -1.2911640112633904e-07 0.075306355953216553 1 0.1974901556968689 0.064156390726566315
		 0.10021430253982544 1 0.16799542307853699 0.12203241884708405 0.10021424293518066
		 1 0.12205623835325241 0.16796335577964783 0.10021424293518066 1 0.064168576151132584
		 0.19745332002639771 0.10021430253982544 1 2.61321755345989e-08 0.20761445164680481
		 0.10021424293518066 1 -0.064168572425842285 0.19745326042175293 0.10021424293518066
		 1 -0.1220555305480957 0.16796335577964783 0.10021424293518066 1 -0.1679949164390564
		 0.12203241884708405 0.10021424293518066 1 -0.19749008119106293 0.064156390726566315
		 0.10021430253982544 1 -0.20765331387519836 -1.2881005773124343e-07 0.10021430253982544
		 1 -0.19749008119106293 -0.064156420528888702 0.10021430253982544 1 -0.1679949164390564
		 -0.12203247845172882 0.10021424293518066 1 -0.1220555305480957 -0.16796338558197021
		 0.10021430253982544 1 -0.064168572425842285 -0.19745332002639771 0.10021430253982544
		 1 1.9943721341064702e-08 -0.20761451125144958 0.10021430253982544 1 0.064168576151132584
		 -0.19745332002639771 0.10021430253982544 1 0.12205559015274048 -0.16796338558197021
		 0.10021430253982544 1 0.1679949164390564 -0.12203247845172882 0.10021424293518066
		 1 0.19749008119106293 -0.064156420528888702 0.10021430253982544 1 0.20765331387519836
		 -1.2881005773124343e-07 0.10021430253982544 1 0.19153779745101929 0.062222741544246674
		 0.083096146583557129 1 0.16293162107467651 0.11835423856973648 0.083096146583557129
		 1 0.11837740242481232 0.16290096938610077 0.083098053932189941 1 0.062234789133071899
		 0.19150306284427643 0.083098053932189941 1 2.5535966230449958e-08 0.20135816931724548
		 0.083098053932189941 1 -0.062234759330749512 0.19150306284427643 0.083098053932189941
		 1 -0.11837736517190933 0.16290096938610077 0.083098053932189941 1 -0.16293151676654816
		 0.11835423856973648 0.083096146583557129 1 -0.19153767824172974 0.062222741544246674
		 0.083096146583557129 1 -0.2013944536447525 -1.1153542800457217e-07 0.083096146583557129
		 1 -0.19153767824172974 -0.062222793698310852 0.083096146583557129 1 -0.16293151676654816
		 -0.11835426837205887 0.083096146583557129 1 -0.11837736517190933 -0.16290132701396942
		 0.083098053932189941 1 -0.062234759330749512 -0.19150309264659882 0.083098053932189941
		 1 1.9534025952339107e-08 -0.20135830342769623 0.083098053932189941 1 0.062234789133071899
		 -0.19150303304195404 0.083098053932189941 1 0.11837736517190933 -0.16290132701396942
		 0.083098053932189941 1 0.16293150186538696 -0.11835426837205887 0.083096146583557129
		 1 0.19153767824172974 -0.062222793698310852 0.083096146583557129 1 0.20139442384243011
		 -1.1153542800457217e-07 0.083096146583557129 1 0.13879665732383728 0.045089274644851685
		 0.055639445781707764 1 0.11806720495223999 0.085764899849891663 0.055639445781707764
		 1 0.085780978202819824 0.11804506182670593 0.055639445781707764 1 0.045097768306732178
		 0.13877040147781372 0.055639445781707764 1 1.5814610065945089e-08 0.14591169357299805
		 0.055639445781707764 1 -0.045097634196281433 0.13877040147781372 0.055639445781707764
		 1 -0.085780948400497437 0.11804506182670593 0.055639445781707764 1 -0.11806705594062805
		 0.085764899849891663 0.055639445781707764 1 -0.13879662752151489 0.045089252293109894
		 0.055639445781707764 1 -0.14593896269798279 -4.8833577181994769e-08 0.055639445781707764
		 1 -0.13879662752151489 -0.045089282095432281 0.055639445781707764 1 -0.11806705594062805
		 -0.085764974355697632 0.055639445781707764 1 -0.085780948400497437 -0.11804503202438354
		 0.055639445781707764 1 -0.045097619295120239 -0.13877043128013611 0.055639445781707764
		 1 1.1465293603407645e-08 -0.14591172337532043 0.055639445781707764 1 0.045097768306732178
		 -0.13877037167549133 0.055639445781707764 1 0.085780918598175049 -0.11804503202438354
		 0.055639445781707764 1 0.11806705594062805 -0.085764974355697632 0.055639445781707764
		 1 0.13879662752151489 -0.045089282095432281 0.055639445781707764 1 0.14593896269798279
		 -4.8833577181994769e-08 0.055639445781707764 1 0.00062489509582519531 0.0019231736660003662
		 -0.00095319747924804688 1 0.0011885762214660645 0.0016359686851501465 -0.00095325708389282227
		 1 0.0016359388828277588 0.0011885762214660645 -0.00095325708389282227 1 0.0019232034683227539
		 0.00062488019466400146 -0.00095319747924804688 1 0.0020221471786499023 0 -0.00095319747924804688
		 1 0.0019231438636779785 -0.00062488019466400146 -0.00095319747924804688 1 0.0016359388828277588
		 -0.0011885762214660645 -0.00095319747924804688 1 0.0011886060237884521 -0.0016359388828277588
		 -0.00095319747924804688 1 0.00062486529350280762 -0.0019231736660003662 -0.00095319747924804688
		 1 -2.7856383866264878e-11 -0.0020221471786499023 -0.00095319747924804688 1 -0.00062486529350280762
		 -0.0019231736660003662 -0.00095319747924804688 1 -0.0011886060237884521 -0.0016359388828277588
		 -0.00095319747924804688 1 -0.0016359686851501465 -0.0011885762214660645 -0.00095319747924804688
		 1 -0.0019232034683227539 -0.00062488019466400146 -0.00095319747924804688 1 -0.0020221471786499023
		 0 -0.00095319747924804688 1 -0.0019232034683227539 0.00062489509582519531 -0.00095319747924804688
		 1 -0.0016359388828277588 0.0011885762214660645 -0.00095319747924804688 1 -0.0011885762214660645
		 0.0016359686851501465 -0.00095319747924804688 1 -0.00062486529350280762 0.0019231736660003662
		 -0.00095319747924804688 1 3.240829826722802e-11 0.0020221471786499023 -0.00095319747924804688
		 1 ;
	setAttr ".it[0].itg[0].iti[6000].ict" -type "componentList" 2 "vtx[20:179]" "vtx[181:340]";
	setAttr ".it[0].itg[1].iti[6000].ipt" -type "pointArray" 320 -0.00012421607971191406
		 -4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00010567903518676758 -7.6770782470703125e-05
		 -8.3804130554199219e-05 1 -7.6770782470703125e-05 -0.00010564923286437988 -8.3804130554199219e-05
		 1 -4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05 1 0 -0.00013059377670288086
		 -8.3744525909423828e-05 1 4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05
		 1 7.6770782470703125e-05 -0.00010567903518676758 -8.3804130554199219e-05 1 0.00010564923286437988
		 -7.6770782470703125e-05 -8.3804130554199219e-05 1 0.00012421607971191406 -4.0352344512939453e-05
		 -8.3744525909423828e-05 1 0.00013059377670288086 0 -8.3804130554199219e-05 1 0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 0.00010564923286437988 7.6770782470703125e-05
		 -8.3804130554199219e-05 1 7.6770782470703125e-05 0.00010567903518676758 -8.3804130554199219e-05
		 1 4.0367245674133301e-05 0.00012421607971191406 -8.3744525909423828e-05 1 3.893774191965349e-12
		 0.00013059377670288086 -8.3744525909423828e-05 1 -4.0352344512939453e-05 0.00012421607971191406
		 -8.3744525909423828e-05 1 -7.6770782470703125e-05 0.00010567903518676758 -8.3744525909423828e-05
		 1 -0.00010567903518676758 7.6770782470703125e-05 -8.3804130554199219e-05 1 -0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00013065338134765625 0 -8.3804130554199219e-05
		 1 -0.00026369094848632812 -8.5681676864624023e-05 -0.00035595893859863281 1 -0.00022435188293457031
		 -0.00016295909881591797 -0.00035595893859863281 1 -0.00016295909881591797 -0.00022435188293457031
		 -0.00035595893859863281 1 -8.5651874542236328e-05 -0.00026363134384155273 -0.00035595893859863281
		 1 0 -0.00027716159820556641 -0.00035595893859863281 1 8.5651874542236328e-05 -0.00026363134384155273
		 -0.00035595893859863281 1 0.00016295909881591797 -0.00022435188293457031 -0.00035595893859863281
		 1 0.00022435188293457031 -0.00016295909881591797 -0.00035595893859863281 1 0.00026369094848632812
		 -8.5651874542236328e-05 -0.00035595893859863281 1 0.0002772212028503418 0 -0.00035595893859863281
		 1 0.00026369094848632812 8.5651874542236328e-05 -0.00035595893859863281 1 0.00022429227828979492
		 0.00016295909881591797 -0.00035595893859863281 1 0.00016295909881591797 0.00022429227828979492
		 -0.00035595893859863281 1 8.5651874542236328e-05 0.00026363134384155273 -0.00035595893859863281
		 1 8.2618356600505649e-12 0.00027716159820556641 -0.00035595893859863281 1 -8.5681676864624023e-05
		 0.00026363134384155273 -0.00035595893859863281 1 -0.00016292929649353027 0.00022429227828979492
		 -0.00035595893859863281 1 -0.00022429227828979492 0.00016295909881591797 -0.00035595893859863281
		 1 -0.00026363134384155273 8.5651874542236328e-05 -0.00035595893859863281 1 -0.0002772212028503418
		 0 -0.00035595893859863281 1 -0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00019574165344238281 -0.00014221668243408203 -0.00070393085479736328 1 -0.00014215707778930664
		 -0.00019562244415283203 -0.00070393085479736328 1 -7.4744224548339844e-05 -0.00023007392883300781
		 -0.00070393085479736328 1 0 -0.00024187564849853516 -0.00070393085479736328 1 7.4744224548339844e-05
		 -0.00023007392883300781 -0.00070393085479736328 1 0.00014215707778930664 -0.00019562244415283203
		 -0.00070393085479736328 1 0.00019568204879760742 -0.00014221668243408203 -0.00070393085479736328
		 1 0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328 1 0.00024187564849853516
		 0 -0.00070393085479736328 1 0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 0.00019568204879760742 0.00014221668243408203 -0.00070393085479736328 1 0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 7.4744224548339844e-05 0.00023007392883300781
		 -0.00070393085479736328 1 7.2084560542862164e-12 0.00024187564849853516 -0.00070393085479736328
		 1 -7.4744224548339844e-05 0.00023001432418823242 -0.00070393085479736328 1 -0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 -0.00019568204879760742 0.00014209747314453125
		 -0.00070393085479736328 1 -0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00024187564849853516 0 -0.00070393085479736328 1 -1.1324882507324219e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 -9.5367431640625e-07 -6.5565109252929688e-07 -0.0010392910335212946
		 1 -7.152557373046875e-07 -9.5367431640625e-07 -0.0010392910335212946 1 -3.5762786865234375e-07
		 -1.1324882507324219e-06 -0.0010392910335212946 1 -4.9960036108132044e-16 -1.0728836059570312e-06
		 -0.0010392910335212946 1 3.5762786865234375e-07 -1.1324882507324219e-06 -0.0010392910335212946
		 1 7.152557373046875e-07 -8.9406967163085938e-07 -0.0010392910335212946 1 8.9406967163085938e-07
		 -6.5565109252929688e-07 -0.0010392910335212946 1 1.0728836059570312e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 1.1920928955078125e-06 7.7715611723760958e-16 -0.0010392910335212946
		 1 1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 9.5367431640625e-07
		 6.5565109252929688e-07 -0.0010392910335212946 1 7.152557373046875e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 3.5762786865234375e-07 1.1324882507324219e-06 -0.0010392910335212946
		 1 3.5527136788005009e-14 1.1920928955078125e-06 -0.0010392910335212946 1 -3.5762786865234375e-07
		 1.0728836059570312e-06 -0.0010392910335212946 1 -6.5565109252929688e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 -8.9406967163085938e-07 6.5565109252929688e-07 -0.0010392910335212946
		 1 -1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 -1.1920928955078125e-06
		 7.7715611723760958e-16 -0.0010392910335212946 1 0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 0.0003502964973449707 0.00025445222854614258 -0.0012683868408203125
		 1 0.00025445222854614258 0.00035023689270019531 -0.0012683868408203125 1 0.00013378262519836426
		 0.00041174888610839844 -0.0012683868408203125 1 2.2604140781368187e-13 0.00043290853500366211
		 -0.0012683868408203125 1 -0.00013378262519836426 0.00041174888610839844 -0.0012683868408203125
		 1 -0.00025451183319091797 0.00035023689270019531 -0.0012683868408203125 1 -0.00035023689270019531
		 0.00025451183319091797 -0.0012683868408203125 1 -0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 -0.00043290853500366211 -8.475442569988445e-13 -0.0012683868408203125
		 1 -0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 -0.0003502964973449707
		 -0.00025445222854614258 -0.0012683868408203125 1 -0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 -0.00013378262519836426 -0.00041174888610839844 -0.0012683868408203125
		 1 -1.2677858762799588e-11 -0.00043290853500366211 -0.0012683868408203125 1 0.00013375282287597656
		 -0.00041174888610839844 -0.0012683868408203125 1 0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 0.00035023689270019531 -0.00025445222854614258 -0.0012683868408203125
		 1 0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 0.00043290853500366211
		 -8.475442569988445e-13 -0.0012683868408203125 1 0.00097805261611938477 0.00031778216361999512
		 -0.0012948513031005859 1 0.00083196163177490234 0.00060445070266723633 -0.0012948513031005859
		 1 0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 0.00031781196594238281
		 0.00097805261611938477 -0.0012948513031005859 1 -1.3798961973066071e-12 0.0010283589363098145
		 -0.0012948513031005859 1 -0.00031781196594238281 0.00097805261611938477 -0.0012948513031005859
		 1 -0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 -0.00083196163177490234
		 0.00060445070266723633 -0.0012948513031005859 1 -0.00097799301147460938 0.00031778216361999512
		 -0.0012948513031005859 1 -0.0010282993316650391 1.3798961973066071e-12 -0.0012948513031005859
		 1 -0.00097799301147460938 -0.00031781196594238281 -0.0012948513031005859 1 -0.00083196163177490234
		 -0.00060445070266723633 -0.0012948513031005859 1 -0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 -0.00031781196594238281 -0.00097799301147460938 -0.0012948513031005859
		 1 -3.2025937457547116e-11 -0.0010283589363098145 -0.0012948513031005859 1 0.00031775236129760742
		 -0.00097799301147460938 -0.0012948513031005859 1 0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 0.00083196163177490234 -0.00060445070266723633 -0.0012948513031005859
		 1 0.00097805261611938477 -0.00031781196594238281 -0.0012948513031005859 1 0.0010283589363098145
		 1.3798961973066071e-12 -0.0012948513031005859 1 0.0015241503715515137 0.00049524009227752686
		 -0.0011343955993652344 1 0.0012965500354766846 0.00094199180603027344 -0.0011343955993652344
		 1 0.00094199180603027344 0.0012965500354766846 -0.001134335994720459 1 0.00049524009227752686
		 0.0015241503715515137 -0.0011343955993652344 1 1.6341874879616121e-24 0.0016025900840759277
		 -0.0011343955993652344 1 -0.00049524009227752686 0.0015241503715515137 -0.0011343955993652344
		 1 -0.00094199180603027344 0.0012965500354766846 -0.0011343955993652344 1 -0.0012965798377990723
		 0.00094199180603027344 -0.001134335994720459 1 -0.0015242099761962891 0.00049524009227752686
		 -0.0011343955993652344 1 -0.0016026496887207031 0 -0.0011343955993652344 1 -0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 -0.0012965500354766846 -0.00094199180603027344
		 -0.0011343955993652344 1 -0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 -0.00049524009227752686 -0.0015241503715515137 -0.0011343955993652344 1 -4.7762682697793934e-11
		 -0.0016025900840759277 -0.0011343955993652344 1 0.00049524009227752686 -0.0015241503715515137
		 -0.0011343955993652344 1 0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 0.0012965798377990723 -0.00094199180603027344 -0.0011343955993652344 1 0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 0.0016026496887207031 0 -0.0011343955993652344
		 1 0.0018613338470458984 0.00060479342937469482 -0.00096124410629272461 1 0.0015833377838134766
		 0.0011503547430038452 -0.0009613037109375 1 0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 0.00060477852821350098 0.0018613338470458984 -0.00096124410629272461
		 1 4.5126569148123963e-11 0.0019571185111999512 -0.00096124410629272461 1 -0.00060477852821350098
		 0.0018613338470458984 -0.00096124410629272461 1 -0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 -0.0015833377838134766 0.0011503547430038452 -0.00096124410629272461
		 1 -0.0018613338470458984 0.00060477852821350098 -0.00096124410629272461 1 -0.0019571185111999512
		 0 -0.0009613037109375 1 -0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 -0.0015833377838134766 -0.0011503547430038452 -0.0009613037109375 1 -0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 -0.00060477852821350098 -0.0018613338470458984
		 -0.0009613037109375 1 -1.3199885628978336e-11 -0.0019571185111999512 -0.0009613037109375
		 1 0.00060479342937469482 -0.0018613338470458984 -0.0009613037109375 1 0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 0.0015833377838134766 -0.0011503696441650391
		 -0.0009613037109375 1 0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 0.0019571185111999512 0 -0.0009613037109375 1 0.0017341673374176025 0.00056345760822296143
		 -0.0010418891906738281 1 0.0014751553535461426 0.0010717660188674927 -0.0010418891906738281
		 1 0.0010717511177062988 0.0014751553535461426 -0.0010418891906738281 1 0.00056345760822296143
		 0.0017341375350952148 -0.0010418891906738281 1 3.2229330315658444e-11 0.0018233954906463623
		 -0.0010418891906738281 1 -0.00056345760822296143 0.0017341375350952148 -0.0010418891906738281
		 1 -0.0010717660188674927 0.0014751553535461426 -0.0010418891906738281 1 -0.0014751553535461426
		 0.0010717660188674927 -0.0010418891906738281 1 -0.0017341673374176025 0.00056346505880355835
		 -0.0010418891906738281 1 -0.00182342529296875 0 -0.0010418891906738281 1 -0.0017341673374176025
		 -0.00056346505880355835 -0.0010418891906738281 1 -0.0014751553535461426 -0.0010717511177062988
		 -0.0010418891906738281 1 -0.0010717511177062988 -0.0014751553535461426 -0.0010418891906738281
		 1 -0.00056345760822296143 -0.0017341375350952148 -0.0010418891906738281 1 -2.2112089936854318e-11
		 -0.0018233656883239746 -0.0010418891906738281 1 0.00056345760822296143 -0.0017341375350952148
		 -0.0010418891906738281 1 0.0010717511177062988 -0.0014751553535461426 -0.0010418891906738281
		 1 0.0014751553535461426 -0.0010717511177062988 -0.0010418891906738281 1 0.0017341375350952148
		 -0.00056346505880355835 -0.0010418891906738281 1 0.00182342529296875 0 -0.0010418891906738281
		 1 -0.11783930659294128 -0.038280937820672989 -0.025105953216552734 1 -0.10024003684520721
		 -0.072814695537090302 -0.025105953216552734 1 -0.072828635573387146 -0.10022066533565521
		 -0.025105953216552734 1 -0.03828825056552887 -0.11781670153141022 -0.025105953216552734
		 1 -1.16819290907344e-08 -0.12387976050376892 -0.02510601282119751 1 0.03828825056552887
		 -0.11781665682792664 -0.025105953216552734 1 0.072828598320484161 -0.10022066533565521
		 -0.025105953216552734 1 0.10023985803127289 -0.072814695537090302 -0.025105953216552734
		 1 0.11783920228481293 -0.038280937820672989 -0.02510601282119751 1 0.12390351295471191
		 2.7739535113369129e-08 -0.025105953216552734 1 0.11783920228481293 0.03828100860118866
		 -0.025105953216552734 1 0.10023985803127289 0.072814702987670898 -0.02510601282119751
		 1 0.072828598320484161 0.10022066533565521 -0.025105953216552734 1 0.038288254290819168
		 0.11781665682792664 -0.025105953216552734 1 -7.9893389681728877e-09 0.12387976050376892
		 -0.025105953216552734 1 -0.03828825056552887 0.11781665682792664 -0.025105953216552734
		 1 -0.072828598320484161 0.10022066533565521 -0.025105953216552734 1 -0.10023984313011169
		 0.072814702987670898 -0.025105953216552734 1 -0.11783920228481293 0.03828100860118866
		 -0.025105953216552734 1 -0.12390351295471191 2.7739535113369129e-08 -0.025105953216552734
		 1 -0.18831075727939606 -0.061174225062131882 -0.0219917893409729 1 -0.16018648445606232
		 -0.11636010557413101 -0.021991848945617676 1 -0.11638244241476059 -0.16015590727329254
		 -0.0219917893409729 1 -0.061185892671346664 -0.18827494978904724 -0.0219917893409729
		 1 -1.8267662937887508e-08 -0.19796404242515564 -0.0219917893409729 1 0.061185877770185471
		 -0.18827484548091888 -0.021991968154907227 1 0.11638227850198746 -0.16015590727329254
		 -0.0219917893409729 1 0.16018636524677277 -0.11636010557413101 -0.021991848945617676
		 1 0.18831063807010651 -0.061174225062131882 -0.0219917893409729 1 0.19800154864788055
		 6.5546423400064668e-08 -0.0219917893409729 1 0.18831063807010651 0.061174225062131882
		 -0.021991848945617676 1 0.16018636524677277 0.11636023968458176 -0.0219917893409729
		 1 0.11638227850198746 0.16015592217445374 -0.0219917893409729 1 0.061185870319604874
		 0.18827496469020844 -0.0219917893409729 1 -1.2366783153083816e-08 0.19796392321586609
		 -0.0219917893409729 1 -0.061185892671346664 0.18827486038208008 -0.0219917893409729
		 1 -0.11638230830430984 0.16015592217445374 -0.0219917893409729 1 -0.1601862907409668
		 0.11636023968458176 -0.021991848945617676 1 -0.18831063807010651 0.061174225062131882
		 -0.021991848945617676 1 -0.19800154864788055 6.5546423400064668e-08 -0.0219917893409729
		 1 -0.17301677167415619 -0.056205827742815018 -0.0086470246315002441 1 -0.14717656373977661
		 -0.10690969973802567 -0.0086470246315002441 1 -0.1069301962852478 -0.14714857935905457
		 -0.0086470246315002441 1 -0.05621655285358429 -0.17298388481140137 -0.0086470246315002441
		 1 -1.6716764861257616e-08 -0.18188589811325073 -0.0086470246315002441 1 0.056216541677713394
		 -0.17298376560211182 -0.0086470246315002441 1 0.10693006217479706 -0.14714857935905457
		 -0.0086470246315002441 1 0.14717645943164825 -0.10690969973802567 -0.0086470246315002441
		 1 0.17301662266254425 -0.056205827742815018 -0.0086470246315002441 1 0.18192043900489807
		 6.5546423400064668e-08 -0.0086470246315002441 1 0.17301662266254425 0.056205835193395615
		 -0.0086470246315002441 1 0.14717645943164825 0.10690971463918686 -0.0086470246315002441
		 1 0.10693006217479706 0.14714859426021576 -0.0086470246315002441 1 0.0562165267765522
		 0.17298378050327301 -0.0086470246315002441 1 -1.1295135493583075e-08 0.18188591301441193
		 -0.0086470246315002441 1 -0.05621655285358429 0.17298378050327301 -0.0086470246315002441
		 1 -0.10693006217479706 0.14714859426021576 -0.0086470246315002441 1 -0.14717642962932587
		 0.10690971463918686 -0.0086470246315002441 1 -0.17301662266254425 0.056205835193395615
		 -0.0086470246315002441 1 -0.18192043900489807 6.5546423400064668e-08 -0.0086470246315002441
		 1 -0.17301677167415619 -0.056205827742815018 0.019000589847564697 1 -0.14717656373977661
		 -0.10690969973802567 0.019000411033630371 1 -0.1069301962852478 -0.14714857935905457
		 0.019000411033630371 1 -0.05621655285358429 -0.17298388481140137 0.019000589847564697
		 1 -1.6716764861257616e-08 -0.18188589811325073 0.019000411033630371 1 0.056216541677713394
		 -0.17298376560211182 0.019000411033630371 1 0.10693006217479706 -0.14714857935905457
		 0.019000411033630371 1 0.14717645943164825 -0.10690969973802567 0.019000411033630371
		 1 0.17301662266254425 -0.056205827742815018 0.019000589847564697 1 0.18192043900489807
		 6.5546423400064668e-08 0.019000589847564697 1 0.17301662266254425 0.056205835193395615
		 0.019000589847564697 1 0.14717645943164825 0.10690971463918686 0.019000411033630371
		 1 0.10693006217479706 0.14714859426021576 0.019000589847564697 1 0.0562165267765522
		 0.17298378050327301 0.019000589847564697 1 -1.1295135493583075e-08 0.18188591301441193
		 0.019000589847564697 1 -0.05621655285358429 0.17298378050327301 0.019000589847564697
		 1 -0.10693006217479706 0.14714859426021576 0.019000589847564697 1 -0.14717642962932587
		 0.10690971463918686 0.019000411033630371 1 -0.17301662266254425 0.056205835193395615
		 0.019000589847564697 1 -0.18192043900489807 6.5546423400064668e-08 0.019000589847564697
		 1 -0.19048921763896942 -0.061881884932518005 0.019000589847564697 1 -0.16203954815864563
		 -0.11770627647638321 0.019000411033630371 1 -0.11772876977920532 -0.1620086133480072
		 0.019000411033630371 1 -0.061893690377473831 -0.19045296311378479 0.019000589847564697
		 1 -1.8488558239937447e-08 -0.20025402307510376 0.019000589847564697 1 0.061893690377473831
		 -0.19045296311378479 0.019000411033630371 1 0.11772860586643219 -0.1620086133480072
		 0.019000411033630371 1 0.16203941404819489 -0.11770627647638321 0.019000411033630371
		 1 0.19048906862735748 -0.061881884932518005 0.019000589847564697 1 0.20029206573963165
		 6.5546423400064668e-08 0.019000589847564697 1 0.19048906862735748 0.061881892383098602
		 0.019000589847564697 1 0.16203941404819489 0.117706298828125 0.019000589847564697
		 1 0.11772860586643219 0.1620086282491684 0.019000589847564697 1 0.061893675476312637
		 0.19045297801494598 0.019000589847564697 1 -1.251942371993664e-08 0.20025402307510376
		 0.019000589847564697 1 -0.061893690377473831 0.19045285880565643 0.019000589847564697
		 1 -0.11772860586643219 0.1620086282491684 0.019000589847564697 1 -0.16203939914703369
		 0.117706298828125 0.019000589847564697 1 -0.19048906862735748 0.061881892383098602
		 0.019000589847564697 1 -0.20029206573963165 6.5546423400064668e-08 0.019000589847564697
		 1 -0.15081228315830231 -0.048992495983839035 0.016154766082763672 1 -0.12828832864761353
		 -0.093189187347888947 0.016154825687408447 1 -0.093206949532032013 -0.12826377153396606
		 0.016154825687408447 1 -0.049001824110746384 -0.15078336000442505 0.016154825687408447
		 1 -1.4906447631801711e-08 -0.1585429310798645 0.016154825687408447 1 0.049001831561326981
		 -0.15078336000442505 0.016154825687408447 1 0.093206882476806641 -0.12826377153396606
		 0.016154825687408447 1 0.1282881498336792 -0.093189187347888947 0.016154825687408447
		 1 0.15081214904785156 -0.048992399126291275 0.016154825687408447 1 0.15857319533824921
		 3.5773904727420813e-08 0.016154825687408447 1 0.15081214904785156 0.048992495983839035
		 0.016154766082763672 1 0.1282881498336792 0.09318917989730835 0.016154825687408447
		 1 0.093206882476806641 0.12826365232467651 0.016154825687408447 1 0.049001820385456085
		 0.15078337490558624 0.016154825687408447 1 -1.0180631448974964e-08 0.1585429310798645
		 0.016154825687408447 1 -0.049001824110746384 0.15078334510326385 0.016154825687408447
		 1 -0.093206882476806641 0.12826365232467651 0.016154825687408447 1 -0.1282881498336792
		 0.09318917989730835 0.016154825687408447 1 -0.15081214904785156 0.048992495983839035
		 0.016154766082763672 1 -0.15857319533824921 3.5773904727420813e-08 0.016154825687408447
		 1 0.00062489509582519531 0.0019231736660003662 -0.00095319747924804688 1 0.0011885762214660645
		 0.0016359686851501465 -0.00095325708389282227 1 0.0016359388828277588 0.0011885762214660645
		 -0.00095325708389282227 1 0.0019232034683227539 0.00062488019466400146 -0.00095319747924804688
		 1 0.0020221471786499023 0 -0.00095319747924804688 1 0.0019231438636779785 -0.00062488019466400146
		 -0.00095319747924804688 1 0.0016359388828277588 -0.0011885762214660645 -0.00095319747924804688
		 1 0.0011886060237884521 -0.0016359388828277588 -0.00095319747924804688 1 0.00062486529350280762
		 -0.0019231736660003662 -0.00095319747924804688 1 -2.7856383866264878e-11 -0.0020221471786499023
		 -0.00095319747924804688 1 -0.00062486529350280762 -0.0019231736660003662 -0.00095319747924804688
		 1 -0.0011886060237884521 -0.0016359388828277588 -0.00095319747924804688 1 -0.0016359686851501465
		 -0.0011885762214660645 -0.00095319747924804688 1 -0.0019232034683227539 -0.00062488019466400146
		 -0.00095319747924804688 1 -0.0020221471786499023 0 -0.00095319747924804688 1 -0.0019232034683227539
		 0.00062489509582519531 -0.00095319747924804688 1 -0.0016359388828277588 0.0011885762214660645
		 -0.00095319747924804688 1 -0.0011885762214660645 0.0016359686851501465 -0.00095319747924804688
		 1 -0.00062486529350280762 0.0019231736660003662 -0.00095319747924804688 1 3.240829826722802e-11
		 0.0020221471786499023 -0.00095319747924804688 1 ;
	setAttr ".it[0].itg[1].iti[6000].ict" -type "componentList" 2 "vtx[20:179]" "vtx[181:340]";
	setAttr ".it[0].itg[2].iti[6000].ipt" -type "pointArray" 320 -0.00012421607971191406
		 -4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00010567903518676758 -7.6770782470703125e-05
		 -8.3804130554199219e-05 1 -7.6770782470703125e-05 -0.00010564923286437988 -8.3804130554199219e-05
		 1 -4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05 1 0 -0.00013059377670288086
		 -8.3744525909423828e-05 1 4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05
		 1 7.6770782470703125e-05 -0.00010567903518676758 -8.3804130554199219e-05 1 0.00010564923286437988
		 -7.6770782470703125e-05 -8.3804130554199219e-05 1 0.00012421607971191406 -4.0352344512939453e-05
		 -8.3744525909423828e-05 1 0.00013059377670288086 0 -8.3804130554199219e-05 1 0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 0.00010564923286437988 7.6770782470703125e-05
		 -8.3804130554199219e-05 1 7.6770782470703125e-05 0.00010567903518676758 -8.3804130554199219e-05
		 1 4.0367245674133301e-05 0.00012421607971191406 -8.3744525909423828e-05 1 3.893774191965349e-12
		 0.00013059377670288086 -8.3744525909423828e-05 1 -4.0352344512939453e-05 0.00012421607971191406
		 -8.3744525909423828e-05 1 -7.6770782470703125e-05 0.00010567903518676758 -8.3744525909423828e-05
		 1 -0.00010567903518676758 7.6770782470703125e-05 -8.3804130554199219e-05 1 -0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00013065338134765625 0 -8.3804130554199219e-05
		 1 -0.00026369094848632812 -8.5681676864624023e-05 -0.00035595893859863281 1 -0.00022435188293457031
		 -0.00016295909881591797 -0.00035595893859863281 1 -0.00016295909881591797 -0.00022435188293457031
		 -0.00035595893859863281 1 -8.5651874542236328e-05 -0.00026363134384155273 -0.00035595893859863281
		 1 0 -0.00027716159820556641 -0.00035595893859863281 1 8.5651874542236328e-05 -0.00026363134384155273
		 -0.00035595893859863281 1 0.00016295909881591797 -0.00022435188293457031 -0.00035595893859863281
		 1 0.00022435188293457031 -0.00016295909881591797 -0.00035595893859863281 1 0.00026369094848632812
		 -8.5651874542236328e-05 -0.00035595893859863281 1 0.0002772212028503418 0 -0.00035595893859863281
		 1 0.00026369094848632812 8.5651874542236328e-05 -0.00035595893859863281 1 0.00022429227828979492
		 0.00016295909881591797 -0.00035595893859863281 1 0.00016295909881591797 0.00022429227828979492
		 -0.00035595893859863281 1 8.5681676864624023e-05 0.00026363134384155273 -0.00035595893859863281
		 1 8.2618356600505649e-12 0.00027716159820556641 -0.00035595893859863281 1 -8.5681676864624023e-05
		 0.00026363134384155273 -0.00035595893859863281 1 -0.00016292929649353027 0.00022429227828979492
		 -0.00035595893859863281 1 -0.00022429227828979492 0.00016295909881591797 -0.00035595893859863281
		 1 -0.00026363134384155273 8.5651874542236328e-05 -0.00035595893859863281 1 -0.0002772212028503418
		 0 -0.00035595893859863281 1 -0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00019574165344238281 -0.00014221668243408203 -0.00070393085479736328 1 -0.00014215707778930664
		 -0.00019562244415283203 -0.00070393085479736328 1 -7.4744224548339844e-05 -0.00023007392883300781
		 -0.00070393085479736328 1 0 -0.00024187564849853516 -0.00070393085479736328 1 7.4744224548339844e-05
		 -0.00023007392883300781 -0.00070393085479736328 1 0.00014215707778930664 -0.00019562244415283203
		 -0.00070393085479736328 1 0.00019568204879760742 -0.00014221668243408203 -0.00070393085479736328
		 1 0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328 1 0.00024187564849853516
		 0 -0.00070393085479736328 1 0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 0.00019568204879760742 0.00014221668243408203 -0.00070393085479736328 1 0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 7.4744224548339844e-05 0.00023007392883300781
		 -0.00070393085479736328 1 7.2084560542862164e-12 0.00024187564849853516 -0.00070393085479736328
		 1 -7.4744224548339844e-05 0.00023001432418823242 -0.00070393085479736328 1 -0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 -0.00019568204879760742 0.00014209747314453125
		 -0.00070393085479736328 1 -0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00024187564849853516 0 -0.00070393085479736328 1 -1.1324882507324219e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 -9.5367431640625e-07 -6.5565109252929688e-07 -0.0010392910335212946
		 1 -7.152557373046875e-07 -9.5367431640625e-07 -0.0010392910335212946 1 -3.5762786865234375e-07
		 -1.1324882507324219e-06 -0.0010392910335212946 1 -4.9960036108132044e-16 -1.0728836059570312e-06
		 -0.0010392910335212946 1 3.5762786865234375e-07 -1.1324882507324219e-06 -0.0010392910335212946
		 1 7.152557373046875e-07 -8.9406967163085938e-07 -0.0010392910335212946 1 8.9406967163085938e-07
		 -6.5565109252929688e-07 -0.0010392910335212946 1 1.0728836059570312e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 1.1920928955078125e-06 7.7715611723760958e-16 -0.0010392910335212946
		 1 1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 9.5367431640625e-07
		 6.5565109252929688e-07 -0.0010392910335212946 1 7.152557373046875e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 3.5762786865234375e-07 1.1324882507324219e-06 -0.0010392910335212946
		 1 3.5527136788005009e-14 1.1920928955078125e-06 -0.0010392910335212946 1 -3.5762786865234375e-07
		 1.0728836059570312e-06 -0.0010392910335212946 1 -6.5565109252929688e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 -8.9406967163085938e-07 6.5565109252929688e-07 -0.0010392910335212946
		 1 -1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 -1.1920928955078125e-06
		 7.7715611723760958e-16 -0.0010392910335212946 1 0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 0.0003502964973449707 0.00025445222854614258 -0.0012683868408203125
		 1 0.00025445222854614258 0.00035023689270019531 -0.0012683868408203125 1 0.00013378262519836426
		 0.00041174888610839844 -0.0012683868408203125 1 2.2604140781368187e-13 0.00043290853500366211
		 -0.0012683868408203125 1 -0.00013378262519836426 0.00041174888610839844 -0.0012683868408203125
		 1 -0.00025451183319091797 0.00035023689270019531 -0.0012683868408203125 1 -0.00035023689270019531
		 0.00025451183319091797 -0.0012683868408203125 1 -0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 -0.00043290853500366211 -8.475442569988445e-13 -0.0012683868408203125
		 1 -0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 -0.0003502964973449707
		 -0.00025445222854614258 -0.0012683868408203125 1 -0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 -0.00013378262519836426 -0.00041174888610839844 -0.0012683868408203125
		 1 -1.2677858762799588e-11 -0.00043290853500366211 -0.0012683868408203125 1 0.00013375282287597656
		 -0.00041174888610839844 -0.0012683868408203125 1 0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 0.00035023689270019531 -0.00025445222854614258 -0.0012683868408203125
		 1 0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 0.00043290853500366211
		 -8.475442569988445e-13 -0.0012683868408203125 1 0.00097805261611938477 0.00031778216361999512
		 -0.0012948513031005859 1 0.00083196163177490234 0.00060445070266723633 -0.0012948513031005859
		 1 0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 0.00031778216361999512
		 0.00097805261611938477 -0.0012948513031005859 1 -1.3798961973066071e-12 0.0010283589363098145
		 -0.0012948513031005859 1 -0.00031778216361999512 0.00097805261611938477 -0.0012948513031005859
		 1 -0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 -0.00083196163177490234
		 0.00060445070266723633 -0.0012948513031005859 1 -0.00097799301147460938 0.00031778216361999512
		 -0.0012948513031005859 1 -0.0010282993316650391 1.3798961973066071e-12 -0.0012948513031005859
		 1 -0.00097799301147460938 -0.00031778216361999512 -0.0012948513031005859 1 -0.00083196163177490234
		 -0.00060445070266723633 -0.0012948513031005859 1 -0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 -0.00031778216361999512 -0.00097799301147460938 -0.0012948513031005859
		 1 -3.2027713814386516e-11 -0.0010283589363098145 -0.0012948513031005859 1 0.00031775236129760742
		 -0.00097799301147460938 -0.0012948513031005859 1 0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 0.00083196163177490234 -0.00060445070266723633 -0.0012948513031005859
		 1 0.00097805261611938477 -0.00031778216361999512 -0.0012948513031005859 1 0.0010283589363098145
		 1.3798961973066071e-12 -0.0012948513031005859 1 0.0015241503715515137 0.00049524009227752686
		 -0.0011343955993652344 1 0.0012965500354766846 0.00094199180603027344 -0.0011343955993652344
		 1 0.00094199180603027344 0.0012965500354766846 -0.001134335994720459 1 0.00049524009227752686
		 0.0015241503715515137 -0.0011343955993652344 1 1.6341874879616121e-24 0.0016025900840759277
		 -0.0011343955993652344 1 -0.00049524009227752686 0.0015241503715515137 -0.0011343955993652344
		 1 -0.00094199180603027344 0.0012965500354766846 -0.0011343955993652344 1 -0.0012965798377990723
		 0.00094199180603027344 -0.001134335994720459 1 -0.0015242099761962891 0.00049524009227752686
		 -0.0011343955993652344 1 -0.0016026496887207031 0 -0.0011343955993652344 1 -0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 -0.0012965500354766846 -0.00094199180603027344
		 -0.0011343955993652344 1 -0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 -0.00049524009227752686 -0.0015241503715515137 -0.0011343955993652344 1 -4.7762682697793934e-11
		 -0.0016025900840759277 -0.0011343955993652344 1 0.00049524009227752686 -0.0015241503715515137
		 -0.0011343955993652344 1 0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 0.0012965798377990723 -0.00094199180603027344 -0.0011343955993652344 1 0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 0.0016026496887207031 0 -0.0011343955993652344
		 1 0.0018613338470458984 0.00060479342937469482 0.0081895589828491211 1 0.0015833377838134766
		 0.0011503696441650391 0.0081894993782043457 1 0.0011503696441650391 0.0015833377838134766
		 0.0081895589828491211 1 0.00060477852821350098 0.0018613338470458984 0.0081895589828491211
		 1 4.5126569148123963e-11 0.0019571185111999512 0.0081895589828491211 1 -0.00060477852821350098
		 0.0018613338470458984 0.0081895589828491211 1 -0.0011503696441650391 0.0015833377838134766
		 0.0081895589828491211 1 -0.0015833377838134766 0.0011503696441650391 0.0081895589828491211
		 1 -0.0018613338470458984 0.00060477852821350098 0.0081895589828491211 1 -0.0019571185111999512
		 0 0.0081894993782043457 1 -0.0018613338470458984 -0.00060477852821350098 0.0081894993782043457
		 1 -0.0015833377838134766 -0.0011503696441650391 0.0081894993782043457 1 -0.0011503696441650391
		 -0.0015833377838134766 0.0081894993782043457 1 -0.00060477852821350098 -0.0018613338470458984
		 0.0081894993782043457 1 -1.3199885628978336e-11 -0.0019571185111999512 0.0081894993782043457
		 1 0.00060479342937469482 -0.0018613338470458984 0.0081894993782043457 1 0.0011503696441650391
		 -0.0015833377838134766 0.0081894993782043457 1 0.0015833377838134766 -0.0011503845453262329
		 0.0081894993782043457 1 0.0018613338470458984 -0.00060477852821350098 0.0081894993782043457
		 1 0.0019571185111999512 0 0.0081894993782043457 1 0.0017341673374176025 0.00056345760822296143
		 0.036474108695983887 1 0.0014751553535461426 0.0010717809200286865 0.036474108695983887
		 1 0.0010717660188674927 0.0014751553535461426 0.036474108695983887 1 0.00056345760822296143
		 0.0017341375350952148 0.036474108695983887 1 3.2229330315658444e-11 0.0018233954906463623
		 0.036474108695983887 1 -0.00056345760822296143 0.0017341375350952148 0.036474108695983887
		 1 -0.0010717660188674927 0.0014751553535461426 0.036474108695983887 1 -0.0014751553535461426
		 0.0010717809200286865 0.036474108695983887 1 -0.0017341673374176025 0.00056346505880355835
		 0.036474108695983887 1 -0.00182342529296875 0 0.036474108695983887 1 -0.0017341673374176025
		 -0.00056346505880355835 0.036474108695983887 1 -0.0014751553535461426 -0.0010717660188674927
		 0.036474108695983887 1 -0.0010717511177062988 -0.0014751553535461426 0.036474108695983887
		 1 -0.00056345760822296143 -0.0017341375350952148 0.036474108695983887 1 -2.2112089936854318e-11
		 -0.0018233656883239746 0.036474108695983887 1 0.00056345760822296143 -0.0017341375350952148
		 0.036474108695983887 1 0.0010717511177062988 -0.0014751553535461426 0.036474108695983887
		 1 0.0014751553535461426 -0.0010717660188674927 0.036474108695983887 1 0.0017341375350952148
		 -0.00056346505880355835 0.036474108695983887 1 0.00182342529296875 0 0.036474108695983887
		 1 0.0013436079025268555 0.00043655931949615479 0.10198169946670532 1 0.0011429339647293091
		 0.00083039700984954834 0.10198163986206055 1 0.00083038210868835449 0.0011429339647293091
		 0.10198169946670532 1 0.00043656677007675171 0.0013436079025268555 0.10198169946670532
		 1 -7.3742123518627523e-12 0.0014127492904663086 0.10198163986206055 1 -0.00043656677007675171
		 0.0013436079025268555 0.10198163986206055 1 -0.00083038210868835449 0.0011429339647293091
		 0.10198169946670532 1 -0.0011429339647293091 0.00083039700984954834 0.10198163986206055
		 1 -0.0013436079025268555 0.00043655931949615479 0.10198163986206055 1 -0.0014127492904663086
		 0 0.10198169946670532 1 -0.0013436079025268555 -0.00043655931949615479 0.10198169946670532
		 1 -0.0011429339647293091 -0.00083039700984954834 0.10198163986206055 1 -0.00083038210868835449
		 -0.0011429488658905029 0.10198169946670532 1 -0.00043655931949615479 -0.0013436079025268555
		 0.10198163986206055 1 -4.9477755226234876e-11 -0.0014127492904663086 0.10198169946670532
		 1 0.00043656677007675171 -0.0013436079025268555 0.10198169946670532 1 0.00083038210868835449
		 -0.0011429488658905029 0.10198169946670532 1 0.0011429339647293091 -0.00083039700984954834
		 0.10198169946670532 1 0.0013436079025268555 -0.00043655931949615479 0.10198169946670532
		 1 0.0014127492904663086 0 0.10198169946670532 1 0.00090274214744567871 0.00029331445693969727
		 0.15738457441329956 1 0.00076790153980255127 0.00055792182683944702 0.15738451480865479
		 1 0.00055790692567825317 0.00076791644096374512 0.15738457441329956 1 0.00029331445693969727
		 0.00090274214744567871 0.15738457441329956 1 -5.2080117995956243e-11 0.00094918906688690186
		 0.15738457441329956 1 -0.00029331445693969727 0.00090272724628448486 0.15738457441329956
		 1 -0.00055792182683944702 0.00076791644096374512 0.15738457441329956 1 -0.00076790153980255127
		 0.00055792182683944702 0.15738451480865479 1 -0.00090274214744567871 0.00029331445693969727
		 0.15738457441329956 1 -0.0009492039680480957 0 0.15738457441329956 1 -0.00090274214744567871
		 -0.00029331445693969727 0.15738451480865479 1 -0.00076790153980255127 -0.00055792182683944702
		 0.15738457441329956 1 -0.00055792182683944702 -0.00076791644096374512 0.15738457441329956
		 1 -0.00029331445693969727 -0.00090272724628448486 0.15738457441329956 1 -8.0367712484985532e-11
		 -0.00094918906688690186 0.15738457441329956 1 0.00029331445693969727 -0.00090272724628448486
		 0.15738457441329956 1 0.0005579143762588501 -0.00076791644096374512 0.15738457441329956
		 1 0.00076790153980255127 -0.00055792182683944702 0.15738451480865479 1 0.00090272724628448486
		 -0.00029331445693969727 0.15738451480865479 1 0.00094917416572570801 0 0.15738457441329956
		 1 0.00082939863204956055 0.00026949122548103333 0.15944874286651611 1 0.00070554018020629883
		 0.0005126073956489563 0.15944874286651611 1 0.0005126073956489563 0.00070554018020629883
		 0.15944874286651611 1 0.00026949122548103333 0.00082942843437194824 0.15944874286651611
		 1 -5.9515059547265992e-11 0.00087210536003112793 0.15944874286651611 1 -0.00026949122548103333
		 0.00082941353321075439 0.15944874286651611 1 -0.00051259994506835938 0.00070554018020629883
		 0.15944874286651611 1 -0.00070554018020629883 0.0005126073956489563 0.15944874286651611
		 1 -0.00082941353321075439 0.00026949122548103333 0.15944874286651611 1 -0.00087210536003112793
		 0 0.15944874286651611 1 -0.00082941353321075439 -0.00026949495077133179 0.15944874286651611
		 1 -0.00070554018020629883 -0.0005126073956489563 0.15944874286651611 1 -0.00051259994506835938
		 -0.00070554018020629883 0.15944874286651611 1 -0.00026949495077133179 -0.00082941353321075439
		 0.15944874286651611 1 -8.5504936464531056e-11 -0.00087210536003112793 0.15944874286651611
		 1 0.00026949122548103333 -0.00082941353321075439 0.15944874286651611 1 0.00051259994506835938
		 -0.00070554018020629883 0.15944874286651611 1 0.00070554018020629883 -0.0005126073956489563
		 0.15944874286651611 1 0.00082941353321075439 -0.00026949495077133179 0.15944874286651611
		 1 0.00087210536003112793 0 0.15944874286651611 1 0.00082939863204956055 0.00026949122548103333
		 0.15931618213653564 1 0.00070554018020629883 0.0005126073956489563 0.15931618213653564
		 1 0.0005126073956489563 0.00070554018020629883 0.15931618213653564 1 0.00026949122548103333
		 0.00082942843437194824 0.15931618213653564 1 -5.9515059547265992e-11 0.00087210536003112793
		 0.15931618213653564 1 -0.00026949122548103333 0.00082941353321075439 0.15931618213653564
		 1 -0.00051259994506835938 0.00070554018020629883 0.15931618213653564 1 -0.00070554018020629883
		 0.0005126073956489563 0.15931618213653564 1 -0.00082941353321075439 0.00026949122548103333
		 0.15931618213653564 1 -0.00087210536003112793 0 0.15931618213653564 1 -0.00082941353321075439
		 -0.00026949495077133179 0.15931618213653564 1 -0.00070554018020629883 -0.0005126073956489563
		 0.15931618213653564 1 -0.00051259994506835938 -0.00070554018020629883 0.15931618213653564
		 1 -0.00026949495077133179 -0.00082941353321075439 0.15931618213653564 1 -8.5504936464531056e-11
		 -0.00087210536003112793 0.15931618213653564 1 0.00026949122548103333 -0.00082941353321075439
		 0.15931618213653564 1 0.00051259994506835938 -0.00070554018020629883 0.15931618213653564
		 1 0.00070554018020629883 -0.0005126073956489563 0.15931618213653564 1 0.00082941353321075439
		 -0.00026949495077133179 0.15931618213653564 1 0.00087210536003112793 0 0.15931618213653564
		 1 0.00091317296028137207 0.00029670447111129761 0.1576697826385498 1 0.00077679753303527832
		 0.00056437402963638306 0.1576697826385498 1 0.00056438148021697998 0.00077678263187408447
		 0.1576697826385498 1 0.00029671192169189453 0.00091317296028137207 0.1576697826385498
		 1 -5.1022297498093394e-11 0.00096017122268676758 0.1576697826385498 1 -0.00029670447111129761
		 0.00091317296028137207 0.1576697826385498 1 -0.00056438148021697998 0.00077678263187408447
		 0.1576697826385498 1 -0.00077678263187408447 0.00056437402963638306 0.1576697826385498
		 1 -0.00091317296028137207 0.00029670447111129761 0.1576697826385498 1 -0.00096017122268676758
		 0 0.1576697826385498 1 -0.00091317296028137207 -0.00029671192169189453 0.1576697826385498
		 1 -0.00077678263187408447 -0.00056437402963638306 0.1576697826385498 1 -0.00056438148021697998
		 -0.00077678263187408447 0.1576697826385498 1 -0.00029670447111129761 -0.00091317296028137207
		 0.1576697826385498 1 -7.9635853467152629e-11 -0.00096017122268676758 0.1576697826385498
		 1 0.00029671192169189453 -0.00091317296028137207 0.1576697826385498 1 0.00056438148021697998
		 -0.00077678263187408447 0.1576697826385498 1 0.00077679753303527832 -0.00056437402963638306
		 0.1576697826385498 1 0.00091317296028137207 -0.00029671192169189453 0.1576697826385498
		 1 0.00096017122268676758 0 0.1576697826385498 1 0.001329958438873291 0.00043212622404098511
		 0.10658526420593262 1 0.0011313557624816895 0.00082196295261383057 0.10658526420593262
		 1 0.00082196295261383057 0.0011313259601593018 0.10658526420593262 1 0.00043213367462158203
		 0.001329958438873291 0.10658526420593262 1 -8.7574392182432348e-12 0.0013983845710754395
		 0.10658532381057739 1 -0.00043212622404098511 0.001329958438873291 0.10658532381057739
		 1 -0.00082197785377502441 0.0011313259601593018 0.10658526420593262 1 -0.0011313259601593018
		 0.00082196295261383057 0.10658526420593262 1 -0.001329958438873291 0.00043212622404098511
		 0.10658526420593262 1 -0.0013984143733978271 0 0.10658532381057739 1 -0.001329958438873291
		 -0.00043212622404098511 0.10658526420593262 1 -0.0011313259601593018 -0.00082197785377502441
		 0.10658532381057739 1 -0.00082197785377502441 -0.0011313259601593018 0.10658532381057739
		 1 -0.00043213367462158203 -0.001329958438873291 0.10658526420593262 1 -5.0431658848992811e-11
		 -0.0013983845710754395 0.10658532381057739 1 0.00043213367462158203 -0.001329958438873291
		 0.10658526420593262 1 0.00082197785377502441 -0.0011313259601593018 0.10658532381057739
		 1 0.0011313259601593018 -0.00082197785377502441 0.10658532381057739 1 0.001329958438873291
		 -0.00043212622404098511 0.10658526420593262 1 0.0013984143733978271 0 0.10658532381057739
		 1 0.00062489509582519531 0.0019231736660003662 0.0015242695808410645 1 0.0011886060237884521
		 0.0016359686851501465 0.0015242099761962891 1 0.0016359388828277588 0.0011885762214660645
		 0.0015242099761962891 1 0.0019232034683227539 0.00062488019466400146 0.0015242695808410645
		 1 0.0020221471786499023 0 0.0015242695808410645 1 0.0019231438636779785 -0.00062488019466400146
		 0.0015242695808410645 1 0.0016359388828277588 -0.0011885762214660645 0.0015242695808410645
		 1 0.0011886060237884521 -0.0016359388828277588 0.0015242695808410645 1 0.00062486529350280762
		 -0.0019231736660003662 0.0015242695808410645 1 -2.7856383866264878e-11 -0.0020221471786499023
		 0.0015242695808410645 1 -0.00062486529350280762 -0.0019231736660003662 0.0015242695808410645
		 1 -0.0011886060237884521 -0.0016359388828277588 0.0015242695808410645 1 -0.0016359686851501465
		 -0.0011885762214660645 0.0015242695808410645 1 -0.0019232034683227539 -0.00062488019466400146
		 0.0015242695808410645 1 -0.0020221471786499023 0 0.0015242695808410645 1 -0.0019232034683227539
		 0.00062489509582519531 0.0015242695808410645 1 -0.0016359388828277588 0.0011885762214660645
		 0.0015242695808410645 1 -0.0011886060237884521 0.0016359686851501465 0.0015242695808410645
		 1 -0.00062486529350280762 0.0019231736660003662 0.0015242695808410645 1 3.240829826722802e-11
		 0.0020221471786499023 0.0015242695808410645 1 ;
	setAttr ".it[0].itg[2].iti[6000].ict" -type "componentList" 2 "vtx[20:179]" "vtx[181:340]";
	setAttr ".sn" yes;
	setAttr ".mlid" 4;
	setAttr ".mlpr" 0;
	setAttr -s 3 ".pndr[0:2]"  0 0 0;
	setAttr ".tgdt[0].cid" -type "Int32Array" 3 0 1 2 ;
	setAttr ".aal" -type "attributeAlias" {"eyeball1","weight[0]","eyeball2","weight[1]"
		,"eyeball_deep_bs","weight[2]"} ;
createNode objectSet -n "blendShape1Set";
	rename -uid "6E260CAF-4C8F-58CB-5CEC-E39742EC327E";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "blendShape1GroupId";
	rename -uid "5E626AF6-4E76-7991-F586-A1A6BCA80349";
	setAttr ".ihi" 0;
createNode groupParts -n "blendShape1GroupParts";
	rename -uid "5945168B-4D6E-6966-F8C7-6E8B127AE062";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode multDoubleLinear -n "multDoubleLinear15";
	rename -uid "569E7CED-4845-8C58-5694-3697101B36F5";
	setAttr ".i2" -1;
createNode clamp -n "clamp5";
	rename -uid "AAB869DE-47C0-0892-D2F1-B0A62DAC020A";
	setAttr ".mn" -type "float3" 0 -1 0 ;
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode addDoubleLinear -n "addDoubleLinear9";
	rename -uid "A96C2B09-438F-3EA8-396D-60B13D2BA787";
	setAttr ".ihi" 2;
	setAttr ".i2" 10;
createNode multDoubleLinear -n "multDoubleLinear16";
	rename -uid "48248575-43D3-2AEC-3D06-8FA96A461BC3";
	setAttr ".i2" -1;
createNode clamp -n "clamp6";
	rename -uid "767628D8-48E7-C576-0BB5-E48EA278D0C8";
	setAttr ".mn" -type "float3" 0.95700002 0 0 ;
	setAttr ".mx" -type "float3" 2 0 0 ;
createNode blindDataTemplate -n "blindDataTemplate2";
	rename -uid "E8A45D74-4B1D-4B9F-CF8A-39BEE4E762F0";
	addAttr -ci true -sn "coverage" -ln "coverage" -at "float";
	addAttr -ci true -sn "numnonpacked" -ln "numnonpacked" -at "long";
createNode eulerToQuat -n "eulerToQuat12";
	rename -uid "05F0272A-4698-63D2-B464-5F9B39570466";
createNode multDoubleLinear -n "multDoubleLinear20";
	rename -uid "542BB37F-4EBA-AAE6-3831-148DCF92F34C";
	setAttr ".i2" 0.1;
createNode multDoubleLinear -n "multDoubleLinear21";
	rename -uid "64869B1B-45AF-B3C6-9B31-4E92E221559D";
	setAttr ".i2" 150;
createNode reverse -n "reverse41";
	rename -uid "91A253C5-4905-FF69-D2F5-DA8F62572D5E";
createNode unitConversion -n "unitConversion15";
	rename -uid "54959D38-41D6-67A8-D131-73945FB496DF";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat13";
	rename -uid "75EBCA55-4134-1721-9B5C-7282AFC91F52";
createNode addDoubleLinear -n "addDoubleLinear10";
	rename -uid "37E0EAD4-4812-070E-C12C-FD8CAB043148";
	setAttr ".ihi" 2;
	setAttr ".i2" 21;
createNode unitConversion -n "unitConversion16";
	rename -uid "793C172E-44BB-5BDE-2953-F9BBA3A70C13";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion17";
	rename -uid "A13DEA48-48AC-FE56-393C-318AE9FB04B3";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat14";
	rename -uid "FC981B96-43BE-2807-0549-28AF1F586665";
createNode addDoubleLinear -n "addDoubleLinear11";
	rename -uid "E700533D-4739-36F2-752B-E1A102C9677B";
	setAttr ".ihi" 2;
	setAttr ".i2" 63.830000000000005;
createNode addDoubleLinear -n "addDoubleLinear12";
	rename -uid "D40EED30-449D-2542-4AD7-EF8C0012113C";
	setAttr ".ihi" 2;
	setAttr ".i2" -21.94;
createNode eulerToQuat -n "eulerToQuat15";
	rename -uid "CA58DB0A-4472-1C92-1CCA-68A02AE4B35B";
createNode addDoubleLinear -n "addDoubleLinear13";
	rename -uid "9DD3BF35-4E31-A1EB-BED3-6E8F68492C1F";
	setAttr ".ihi" 2;
	setAttr ".i2" 147.24;
createNode unitConversion -n "unitConversion18";
	rename -uid "2A481E43-4480-FBC4-33E5-DABD2B3D9474";
	setAttr ".cf" 0.017453292519943295;
createNode addDoubleLinear -n "addDoubleLinear14";
	rename -uid "A2ECE886-4DBB-438F-8C15-80BA9225E031";
	setAttr ".ihi" 2;
	setAttr ".i2" 174.42999999999998;
createNode unitConversion -n "unitConversion19";
	rename -uid "9D86097E-47AC-477B-A693-549C39428E98";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat16";
	rename -uid "61CB500E-4EA3-4BF5-A1CE-939EE2D3E527";
createNode eulerToQuat -n "eulerToQuat17";
	rename -uid "B3A11DF9-4BD3-2A99-3443-D6B9D75E89FA";
createNode unitConversion -n "unitConversion20";
	rename -uid "7DC96222-4566-B216-2904-37A21D135AC7";
	setAttr ".cf" 0.017453292519943295;
createNode addDoubleLinear -n "addDoubleLinear15";
	rename -uid "FB38945E-4885-1BB1-0668-BA9028478C9B";
	setAttr ".ihi" 2;
	setAttr ".i2" 108.28999999999999;
createNode multDoubleLinear -n "multDoubleLinear22";
	rename -uid "5D658C3C-4B04-2E9E-41C5-A885F7F02A2E";
	setAttr ".i2" 130;
createNode multDoubleLinear -n "multDoubleLinear23";
	rename -uid "C36B5CA8-4210-AA23-E54B-2891DD0224AE";
	setAttr ".i2" 110;
createNode multDoubleLinear -n "multDoubleLinear24";
	rename -uid "4D8DA0D9-447C-9CF7-3AC0-3687E9F42CF1";
	setAttr ".i2" 50;
createNode multDoubleLinear -n "multDoubleLinear25";
	rename -uid "E3D645D3-45B6-0032-0ACB-D9B11F361F3A";
	setAttr ".i2" 70;
createNode multDoubleLinear -n "multDoubleLinear26";
	rename -uid "491CDCA7-4DEA-A28D-DFE8-42B28FF42FD4";
	setAttr ".i2" 90;
createNode multDoubleLinear -n "multDoubleLinear27";
	rename -uid "B79BAF51-4BEE-C3BA-4B5A-CAA37490D4E0";
	setAttr ".i2" 2.648;
createNode addDoubleLinear -n "addDoubleLinear16";
	rename -uid "3A454633-49AA-D4CD-D1CA-46BD0B649446";
	setAttr ".ihi" 2;
	setAttr ".i2" -64.84;
createNode multDoubleLinear -n "multDoubleLinear28";
	rename -uid "6F32B472-409B-AF7F-68EF-0D892B1796A4";
	setAttr ".i2" 30;
createNode unitConversion -n "unitConversion21";
	rename -uid "F7357485-4491-8144-5FAC-408E83502153";
	setAttr ".cf" 0.017453292519943295;
createNode eulerToQuat -n "eulerToQuat18";
	rename -uid "C9E14BF5-47CC-5DA1-2C6A-4BB092E101E7";
createNode eulerToQuat -n "eulerToQuat19";
	rename -uid "FB1391ED-4E33-71CE-2D4E-18AF931C251D";
createNode unitConversion -n "unitConversion22";
	rename -uid "D5BAC1E0-4A12-CCCA-2B9A-F791B086FCDA";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear29";
	rename -uid "AB53E206-406B-88C3-F7ED-4D95038AF0AA";
	setAttr ".i2" 10;
createNode addDoubleLinear -n "addDoubleLinear17";
	rename -uid "25FB4E67-4ECE-DF7F-4815-BAB8D684F971";
	setAttr ".ihi" 2;
	setAttr ".i2" -108.27;
createNode dagPose -n "bindPose3";
	rename -uid "B263831C-4BDB-3726-8A8C-839A10A9867E";
	setAttr -s 14 ".wm";
	setAttr ".wm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1.3921395628662506e-16 0 0 1;
	setAttr ".wm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1.3921395628662506e-16 0 0 1;
	setAttr ".wm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 15 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 0.99999999999999956 0.99999999999999956 1 0
		 0 0 0 0 0 2.9128324422741665e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 0.94879333057275839 0.94879333057275839 1 0
		 0 0 0 0 0 0.31589747681906605 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 0.94848967212553048 0.94848967212553048 1 0
		 0 0 0 0 0 -0.31680805209338309 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.79181016419459438 0.79181016419459438 1 0
		 0 0 0 0 0 0.61076727472755887 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 0.58608951931295872 0.58608951931295872 1 0
		 0 0 0 0 0 0.81024630536121856 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 0.42712110404869169 0.42712110404869169 1.1310166835209357 0
		 0 0 0 0 0 0.90419442736406352 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.066556617061704015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 2.3412563568528335 2.3412563568528335
		 0.88416025560907607 no;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 0.56446286832700165 0.56446286832700165 1 0
		 0 0 0 0 0 -0.82545846066295425 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 0.79947503107409235 0.79947503107409235 1 0
		 0 0 0 0 0 -0.6006993213655889 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.094798917737457203 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 2.3156206806200763 2.3156206806200763
		 0.87447910899549697 no;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 5.0115806818520312
		 1.9587701269313376 0 0 0 0 5.0115806818520312 1.9587701269313376 1.3921395628662506e-16
		 -2.3608268103196185e-16 -3.9443045261050722e-31 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.3921395628662506e-16
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 0.43184965843897211 0.43184965843897211
		 1.1435378955463982 0 0 0 0 0 0 0.9019456039618704 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 15 ".m";
	setAttr -s 15 ".p";
	setAttr -s 5 ".g[11:15]" yes yes yes yes yes;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster6";
	rename -uid "2A4F34D7-4B61-423B-F562-BBBDDBF33C56";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".skm" 2;
	setAttr -s 341 ".wl";
	setAttr ".wl[0:237].w"
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 8 0.99999998980632043 9 1.0193679574227675e-08
		1 8 1
		2 8 0.99999994039535522 9 5.9604644775390625e-08
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 2 1.6693778291470914e-07 9 0.99999983306221718
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 5.9604644775390625e-08 9 0.99999994039535522
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 0 9.1782946429037578e-08 2 0.99999990821705353
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		3 0 0.9999999727451393 1 2.7254860735981836e-08 10 0.094140559434890747
		3 0 0.99999994039535522 1 5.9604644775390625e-08 10 0.094136335657062642
		2 0 1 10 0.094131141901016235
		2 0 1 10 0.094126970978483132
		2 0 1 10 0.094125315546989441
		2 0 1 10 0.094126970978483132
		2 0 1 10 0.094131135151767242
		2 0 1 10 0.094136319353160858
		2 0 1 10 0.094140484929084778
		2 0 1 10 0.094142087505326322
		2 0 1 10 0.094140484929084778
		2 0 1 10 0.09413631120121016
		2 0 1 10 0.094131120250605937
		2 0 1 10 0.094126886918195429
		2 0 1 10 0.094125285744667053
		2 0 1 10 0.094126880168914795
		3 0 0.99999994039535522 1 5.9604644775390625e-08 10 0.09413108229637146
		2 0 1 10 0.094136297702789307
		2 0 1 10 0.094140463278744091
		2 0 1 10 0.094142072604165017
		2 1 1 10 0.14282116506727288
		2 1 1 10 0.14281913638114929
		2 1 1 10 0.14281660318374634
		2 1 1 10 0.14281456172466278
		3 1 0.99999988079071045 3 1.1920928955078125e-07 10 0.1428137868642807
		3 1 0.99999994039535522 3 5.9604644775390625e-08 10 0.14281454895160423
		2 1 1 10 0.14281660318374634
		3 1 0.99999994039535522 3 5.9604644775390625e-08 10 0.1428191214799881
		2 1 1 10 0.14282114803791046
		2 1 1 10 0.1428219207700801
		2 1 1 10 0.14282114590970957
		2 1 1 10 0.1428191065788269
		2 1 1 10 0.1428165861544522
		2 1 1 10 0.14281454682350159
		2 1 1 10 0.14281375493386755
		2 1 1 10 0.14281453192234039
		2 1 1 10 0.14281657338142395
		2 1 1 10 0.14281909167766571
		2 1 1 10 0.14282114803791046
		2 1 1 10 0.14282190799713135
		2 3 1 10 0.18604104082255779
		2 3 1 10 0.18604214350847795
		2 3 1 10 0.18604350090026855
		2 3 1 10 0.18604463477465982
		2 3 1 10 0.18604506552219391
		2 3 1 10 0.18604464967582116
		3 3 0.99999994039535522 4 5.9604644775390625e-08 10 0.18604351580142975
		2 3 1 10 0.18604214766684396
		3 3 0.99999988079071045 4 1.1920928955078125e-07 10 0.18604104220867157
		2 3 1 10 0.18604061146110754
		3 3 0.99999982118606567 4 1.7881393432617188e-07 10 0.18604103943644407
		2 3 1 10 0.18604214350847795
		2 3 1 10 0.18604352931645865
		2 3 1 10 0.18604464551739924
		2 3 1 10 0.18604506552219391
		2 3 1 10 0.18604464690353983
		3 3 0.99999994039535522 4 5.9604644775390625e-08 10 0.18604353070259094
		2 3 1 10 0.186042158409639
		2 3 1 10 0.18604104220867157
		2 3 1 10 0.18604062497615814
		2 4 1 10 0.23260147652959939
		2 4 1 10 0.23260456150319753
		3 4 0.99999994039535522 7 5.9604644775390625e-08 10 0.23260842393678668
		2 4 1 10 0.23261156634872487
		2 4 1 10 0.23261274137408203
		2 4 1 10 0.23261156634872487
		2 4 1 10 0.23260846647393535
		2 4 1 10 0.23260461053927928
		2 4 1 10 0.23260149706306305
		2 4 1 10 0.23260025550089633
		2 4 1 10 0.23260149706306305
		2 4 1 10 0.23260460663994062
		2 4 1 10 0.23260846734046936
		2 4 1 10 0.23261157951679473
		2 4 1 10 0.23261274137408203
		2 4 1 10 0.2326115918183187
		2 4 1 10 0.23260846734046936
		2 4 1 10 0.23260462110784191
		2 4 1 10 0.23260151906681212
		2 4 1 10 0.23260031857155558
		2 7 1 10 0.26390758304246281
		2 7 1 10 0.26391005909308879
		2 7 1 10 0.26391314968628532
		2 7 1 10 0.26391562573690319
		2 7 1 10 0.26391658703074639
		2 7 1 10 0.26391562598269375
		2 7 1 10 0.2639131494404971
		2 7 1 10 0.26391007980135112
		2 7 1 10 0.26390758500872757
		2 7 1 10 0.26390665597529467
		2 7 1 10 0.26390758156776428
		2 7 1 10 0.26391008643755737
		2 7 1 10 0.26391315066943838
		2 7 1 10 0.26391562598269375
		2 7 1 10 0.26391660896774133
		2 7 1 10 0.26391563114429595
		2 7 1 10 0.26391315632256873
		2 7 1 10 0.26391010862053121
		2 7 1 10 0.26390758156776428
		2 7 1 10 0.26390668577761689
		1 6 1
		3 7 0.95439532805147542 10 0.26717415327590821 11 0.045604671948524585
		3 7 0.9523792920970352 10 0.26717659905695335 11 0.047620707902964826
		3 7 0.95216002458983762 10 0.26717969202889791 11 0.047839975410162321
		3 7 0.95213802830688865 10 0.26718214701675552 11 0.047861971693111446
		3 7 0.9521360280806529 10 0.26718309596325207 11 0.04786397191934709
		3 7 0.95213607424680913 10 0.26718214477726066 11 0.047863925753190907
		3 7 0.9521370371565705 10 0.26717969800082941 11 0.047862962843429668
		3 7 0.95213808898103947 10 0.26717665766628773 11 0.047861911018960479
		3 7 0.95213867868570179 10 0.267174179843501 11 0.047861321314298294
		3 7 0.95213910822243064 10 0.26717322616920058 11 0.04786089177756947
		3 7 0.95213865853279789 10 0.26717417810172361 11 0.04786134146720207
		3 7 0.95213786069504802 10 0.26717665268973473 11 0.047862139304951944
		3 7 0.95213690287730235 10 0.26717969800082941 11 0.047863097122697686
		3 7 0.95213580506273487 10 0.26718220089824668 11 0.047864194937265063
		3 7 0.95213566585657239 10 0.26718312103773473 11 0.047864334143427625
		3 7 0.95213582778955841 10 0.2671822056260702 11 0.047864172210441543
		3 7 0.95213694964842022 10 0.2671797039727612 11 0.04786305035157979
		3 7 0.95213802427709848 10 0.26717665990573658 11 0.047861975722901635
		3 7 0.95199524316265471 10 0.26717418407353183 11 0.048004756837345286
		3 7 0.94998020600650857 10 0.26717323413158328 11 0.050019793993491338
		3 7 0.68970776017835644 10 0.2798312268615209 11 0.31029223982164356
		3 7 0.68486511014967344 10 0.27983364684375561 11 0.31513488985032656
		3 7 0.68424927038670791 10 0.2798365665592093 11 0.31575072961329209
		3 7 0.68417398326725842 10 0.27983883368583823 11 0.31582601673274158
		3 7 0.68416486283359979 10 0.27983974869672695 11 0.31583513716640021
		3 7 0.68416459346916669 10 0.27983885508315803 11 0.31583540653083331
		3 7 0.68416580657639359 10 0.27983659180071446 11 0.31583419342360641
		3 7 0.6841677016676817 10 0.27983367886130933 11 0.3158322983323183
		3 7 0.68416953086554066 10 0.27983126552469068 11 0.31583046913445934
		3 7 0.68417021796506683 10 0.27983036878372625 11 0.31582978203493317
		3 7 0.68416969303432196 10 0.2798312643519314 11 0.31583030696567804
		3 7 0.68416799039608833 10 0.27983369823901444 11 0.31583200960391167
		3 7 0.68416590792556597 10 0.27983659362504149 11 0.31583409207443403
		3 7 0.68416457837472422 10 0.27983885957885718 11 0.31583542162527578
		3 7 0.68416395157594656 10 0.27983978442817886 11 0.31583604842405344
		3 7 0.68416457550984167 10 0.27983886348816095 11 0.31583542449015833
		3 7 0.68416653996337762 10 0.27983662329705455 11 0.31583346003662238
		3 7 0.68417689826589145 10 0.27983370872878605 11 0.31582310173410855
		3 7 0.68421002559834732 10 0.27983125718506918 11 0.31578997440165268
		3 7 0.67937384086715213 10 0.27983037256260529 11 0.32062615913284787
		3 7 0.12816898061770307 10 0.30338770458413411 11 0.8718310193822969
		3 7 0.12786417424703914 10 0.3033903004236661 11 0.87213582575296089
		3 7 0.12776247158374077 10 0.30339341705846729 11 0.87223752841625923
		3 7 0.12774388347781371 10 0.30339584266678393 11 0.87225611652218626
		3 7 0.12774204535343023 10 0.30339682229355508 11 0.87225795464656974
		3 7 0.12774134306228274 10 0.30339586692387815 11 0.87225865693771731
		3 7 0.12774011735298207 10 0.30339342119086543 11 0.87225988264701793
		3 7 0.12773898326840821 10 0.30339029304193676 11 0.87226101673159184
		3 7 0.12773786842696994 10 0.30338772965371336 11 0.87226213157303012
		3 7 0.12773745823094548 10 0.30338674430518009 11 0.87226254176905449
		3 7 0.12773804944346426 10 0.30338772742861764 11 0.87226195055653577
		3 7 0.1277391743620889 10 0.30339032884853706 11 0.87226082563791107
		3 7 0.12774025615336049 10 0.30339344774378019 11 0.87225974384663951
		3 7 0.12774152328614738 10 0.30339586551108105 11 0.87225847671385259
		3 7 0.12774198362003483 10 0.30339687995559766 11 0.87225801637996514
		3 7 0.12774338801533949 10 0.30339592059477399 11 0.87225661198466053
		2 7 0.12774990164941935 10 0.30339345325364492;
	setAttr ".wl[237:340].w"
		1 11 0.87225009835058065
		3 7 0.12776548954917324 10 0.30339032234978908 11 0.87223451045082678
		3 7 0.12775428586060869 10 0.30338774088514947 11 0.87224571413939134
		3 7 0.12745993117042276 10 0.30338678360827809 11 0.87254006882957724
		2 10 0.31197003507054638 11 1
		2 10 0.31197337481931936 11 1
		2 10 0.31197736052209513 11 1
		2 10 0.31198049081924445 11 1
		2 10 0.31198177377190561 11 1
		2 10 0.31198054270603554 11 1
		2 10 0.31197738487657567 11 1
		2 10 0.31197338771538874 11 1
		2 10 0.31197006095051533 11 1
		2 10 0.31196880569379254 11 1
		2 10 0.31197008034770318 11 1
		2 10 0.31197342007816387 11 1
		2 10 0.31197741342589413 11 1
		2 10 0.31198057659428102 11 1
		2 10 0.3119818188669255 11 1
		2 10 0.311980579263751 11 1
		2 10 0.31197742159765823 11 1
		2 10 0.31197345925065645 11 1
		2 10 0.31197011681439668 11 1
		2 10 0.31196883289938149 11 1
		2 10 0.31524050698153488 11 1
		2 10 0.31524548154728588 11 1
		2 10 0.31525137892065125 11 1
		2 10 0.3152560041894038 11 1
		2 10 0.3152579039042876 11 1
		2 10 0.31525605975697946 11 1
		2 10 0.31525138314116175 11 1
		2 10 0.3152454765194676 11 1
		2 10 0.31524055370489079 11 1
		2 10 0.31523870783258057 11 1
		2 10 0.31524058504856339 11 1
		2 10 0.31524552981181342 11 1
		2 10 0.31525143907579722 11 1
		2 10 0.31525612119665647 11 1
		2 10 0.31525796552747892 11 1
		2 10 0.31525614446626415 11 1
		2 10 0.31525146788721686 11 1
		2 10 0.31524556959637534 11 1
		2 10 0.315240610190133 11 1
		2 10 0.31523873535958802 11 1
		2 10 0.30578884315070748 11 1
		2 10 0.30579346870488611 11 1
		2 10 0.30579904291404492 11 1
		2 10 0.30580336410847081 11 1
		2 10 0.30580511589504972 11 1
		2 10 0.30580339213078372 11 1
		2 10 0.30579906175166122 11 1
		2 10 0.30579350185351956 11 1
		2 10 0.30578887697566137 11 1
		2 10 0.30578714687462399 11 1
		2 10 0.3057888996226828 11 1
		2 10 0.30579352695676781 11 1
		2 10 0.30579909728553473 11 1
		2 10 0.3058034147418654 11 1
		2 10 0.30580517275846292 11 1
		2 10 0.30580348103934907 11 1
		2 10 0.30579910807224436 11 1
		2 10 0.30579354999527003 11 1
		2 10 0.30578893665150364 11 1
		2 10 0.30578718422378892 11 1
		3 7 0.4901 10 0.27101269604137224 11 0.5099
		3 7 0.4901 10 0.2710163012390005 11 0.5099
		3 7 0.4901 10 0.27102073850376052 11 0.5099
		3 7 0.4901 10 0.27102416678045643 11 0.5099
		3 7 0.4901 10 0.27102556824684143 11 0.5099
		3 7 0.4901 10 0.27102416488737452 11 0.5099
		3 7 0.4901 10 0.27102074872627402 11 0.5099
		3 7 0.4901 10 0.27101638648130738 11 0.5099
		3 7 0.4901 10 0.2710127183978871 11 0.5099
		3 7 0.4901 10 0.27101138713696632 11 0.5099
		3 7 0.4901 10 0.27101274706440764 11 0.5099
		3 7 0.4901 10 0.27101641262377585 11 0.5099
		3 7 0.4901 10 0.27102082551285289 11 0.5099
		3 7 0.4901 10 0.27102419393246374 11 0.5099
		3 7 0.4901 10 0.27102560322361524 11 0.5099
		3 7 0.4901 10 0.27102422095826512 11 0.5099
		3 7 0.4901 10 0.27102083258027176 11 0.5099
		3 7 0.4901 10 0.27101642044829066 11 0.5099
		3 7 0.4901 10 0.27101275551981741 11 0.5099
		3 7 0.4901 10 0.27101138751556486 11 0.5099
		2 7 1 10 0.26222285726004413
		2 7 1 10 0.26222031209625857
		2 7 1 10 0.26221716281856805
		2 7 1 10 0.26221460226091836
		2 7 1 10 0.26221364809818654
		2 7 1 10 0.26221460226091836
		2 7 1 10 0.26221716281856799
		2 7 1 10 0.2622203487365079
		2 7 1 10 0.26222288071280031
		2 7 1 10 0.26222389618967601
		2 7 1 10 0.26222288046858622
		2 7 1 10 0.26222035020177825
		2 7 1 10 0.26221716941220474
		2 7 1 10 0.26221460226091836
		2 7 1 10 0.26221364174884393
		2 7 1 10 0.2622145929810763
		2 7 1 10 0.26221716941220474
		2 7 1 10 0.26222032797001915
		2 7 1 10 0.26222285823690039
		2 7 1 10 0.26222386858528901;
	setAttr -s 12 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.0000023441039427 0 0 0 0 1.0000023441039427 0 0
		 0 0 1 0 0 0 0.0021652231758063976 1;
	setAttr ".pm[1]" -type "matrix" 1.0529983779909329 0 0 0 0 1.0529983779909329 0 0
		 0 0 1 0 0 0 -0.31325491226452856 1;
	setAttr ".pm[2]" -type "matrix" 1.054853923623857 0 0 0 0 1.054853923623857 0 0 0 0 1 0
		 0 0 0.3182746162148849 1;
	setAttr ".pm[3]" -type "matrix" 1.2596302860960846 0 0 0 0 1.2596302860960846 0 0
		 0 0 1 0 0 0 -0.60806957707926867 1;
	setAttr ".pm[4]" -type "matrix" 1.6968049683383206 0 0 0 0 1.6968049683383206 0 0
		 0 0 1 0 0 0 -0.80788298594033925 1;
	setAttr ".pm[5]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.78994146992176106 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1;
	setAttr ".pm[7]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.72338485286005705 1;
	setAttr ".pm[8]" -type "matrix" 1.7723975386476538 0 0 0 0 1.7723975386476538 0 0
		 0 0 1 0 0 0 0.82563302195322763 1;
	setAttr ".pm[9]" -type "matrix" 1.2516940765802922 0 0 0 0 1.2516940765802922 0 0
		 0 0 1 0 0 0 0.60144094826706673 1;
	setAttr ".pm[11]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.69514255218430376 1;
	setAttr ".pm[12]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.78994146992176106 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 11 ".ma";
	setAttr -s 12 ".dpf";
	setAttr ".dpf[0]" 4;
	setAttr ".dpf[1]" 4;
	setAttr ".dpf[2]" 4;
	setAttr ".dpf[3]" 4;
	setAttr ".dpf[4]" 4;
	setAttr ".dpf[5]" 4;
	setAttr ".dpf[6]" 4;
	setAttr ".dpf[7]" 4;
	setAttr ".dpf[8]" 4;
	setAttr ".dpf[9]" 4;
	setAttr ".dpf[11]" 4;
	setAttr ".dpf[12]" 4;
	setAttr -s 11 ".lw";
	setAttr ".mi" 6;
	setAttr ".bm" 1;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
	setAttr -s 11 ".ifcl";
createNode tweak -n "tweak174";
	rename -uid "E2267E85-4489-7E9E-3643-6DA94B7E07B2";
createNode objectSet -n "skinCluster3Set1";
	rename -uid "E9076789-4E03-CE36-2FE1-3294EE2D9FB9";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster3GroupId1";
	rename -uid "87635410-424C-42BD-AC31-888AD39E33A6";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster3GroupParts1";
	rename -uid "FBD09F2A-4695-2045-F87C-F9AC3A422FC2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet213";
	rename -uid "786EE409-4983-248B-88F1-FCB5B76148C7";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId1741";
	rename -uid "A01D842E-4C82-CBF6-CC91-FF9B3DD0068A";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts620";
	rename -uid "DAD75628-40B4-0BF0-BA20-B68E71D453F2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose4";
	rename -uid "0A6EE902-46DA-6C81-259B-4EB46E4F8BA3";
	setAttr -s 10 ".wm";
	setAttr ".wm[0]" -type "matrix" 0.9999976559015521 0 0 0 0 0.9999976559015521 0 0
		 0 0 1 0 0 0 -0.0021652231758063976 1;
	setAttr ".wm[1]" -type "matrix" 0.94966907917555288 0 0 0 0 0.94966907917555288 0 0
		 0 0 1 0 0 0 0.31325491226452851 1;
	setAttr ".wm[2]" -type "matrix" 0.94799855942573441 0 0 0 0 0.94799855942573441 0 0
		 0 0 1 0 0 0 -0.31827461621488495 1;
	setAttr ".wm[3]" -type "matrix" 0.79388373798097123 0 0 0 0 0.79388373798097123 0 0
		 0 0 1 0 0 0 0.60806957707926867 1;
	setAttr ".wm[4]" -type "matrix" 0.58934292311702685 0 0 0 0 0.58934292311702685 0 0
		 0 0 1 0 0 0 0.80788298594033914 1;
	setAttr ".wm[5]" -type "matrix" 0.43131179988993451 0 0 0 0 0.43131179988993451 0 0
		 0 0 1.1421136461085466 0 0 0 0.90220293242468741 1;
	setAttr ".wm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 -1.0869280817694462 1;
	setAttr ".wm[7]" -type "matrix" 0.43131179988993451 0 0 0 0 0.43131179988993451 0 0
		 0 0 1.1421136461085466 0 0 0 0.82618771183969431 1;
	setAttr ".wm[8]" -type "matrix" 0.56420750886564863 0 0 0 0 0.56420750886564863 0 0
		 0 0 1 0 0 0 -0.82563302195322774 1;
	setAttr ".wm[9]" -type "matrix" 0.79891725838638117 0 0 0 0 0.79891725838638117 0 0
		 0 0 1 0 0 0 -0.60144094826706662 1;
	setAttr -s 10 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 0.9999976559015521 0.9999976559015521 1 0
		 0 0 0 0 0 -0.0021652231758063976 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 0.94966907917555288 0.94966907917555288 1 0
		 0 0 0 0 0 0.31325491226452851 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 0.94799855942573441 0.94799855942573441 1 0
		 0 0 0 0 0 -0.31827461621488495 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.79388373798097123 0.79388373798097123 1 0
		 0 0 0 0 0 0.60806957707926867 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 0.58934292311702685 0.58934292311702685 1 0
		 0 0 0 0 0 0.80788298594033914 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 0.43131179988993451 0.43131179988993451 1.1421136461085466 0
		 0 0 0 0 0 0.90220293242468741 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -1.0869280817694462 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -0.066556617061704126 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 2.3185083279780145 2.3185083279780145
		 0.87556961026360058 no;
	setAttr ".xm[8]" -type "matrix" "xform" 0.56420750886564863 0.56420750886564863 1 0
		 0 0 0 0 0 -0.82563302195322774 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 0.79891725838638117 0.79891725838638117 1 0
		 0 0 0 0 0 -0.60144094826706662 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr -s 10 ".m";
	setAttr -s 10 ".p";
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster7";
	rename -uid "9DDD2769-40C0-CCDA-D962-7B844E8397BF";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".skm" 2;
	setAttr -s 14 ".bw";
	setAttr ".bw[11]" 0.0078125;
	setAttr ".bw[12]" 0.69999992772936825;
	setAttr ".bw[24]" 1;
	setAttr ".bw[25]" 1;
	setAttr ".bw[26]" 1;
	setAttr ".bw[27]" 1;
	setAttr ".bw[28]" 1;
	setAttr ".bw[29]" 1;
	setAttr ".bw[30]" 1;
	setAttr ".bw[31]" 1;
	setAttr ".bw[64]" 1;
	setAttr ".bw[68]" 1;
	setAttr ".bw[74]" 1;
	setAttr ".bw[75]" 1;
	setAttr -s 301 ".wl";
	setAttr ".wl[0:300].w"
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		2 6 0.99999994039535522 8 5.9604644775390625e-08
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		2 8 0.99999998980632032 9 1.0193679678138778e-08
		1 8 1
		2 8 0.99999994039535522 9 5.9604644775390625e-08
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 8 0.99999988079071045 9 1.1920928955078125e-07
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		1 8 1
		2 2 1.6693778093213041e-07 9 0.99999983306221907
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 5.9604644775390625e-08 9 0.99999994039535522
		1 9 1
		1 9 1
		1 9 1
		1 9 1
		2 2 1.7881393432617188e-07 9 0.99999982118606567
		2 0 9.1782943911766779e-08 2 0.99999990821705609
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 5.9604644775390625e-08 2 0.99999994039535522
		2 0 1.1920928955078125e-07 2 0.99999988079071045
		2 0 0.99999997274513852 1 2.7254861478809289e-08
		2 0 0.99999994039535522 1 5.9604644775390625e-08
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.99999994039535522 1 5.9604644775390625e-08
		1 0 1
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		2 1 0.99999988079071045 3 1.1920928955078125e-07
		2 1 0.99999994039535522 3 5.9604644775390625e-08
		1 1 1
		2 1 0.99999994039535522 3 5.9604644775390625e-08
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		2 3 0.99999994039535522 4 5.9604644775390625e-08
		1 3 1
		2 3 0.99999988079071045 4 1.1920928955078125e-07
		1 3 1
		2 3 0.99999982118606567 4 1.7881393432617188e-07
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		2 3 0.99999994039535522 4 5.9604644775390625e-08
		1 3 1
		1 3 1
		1 3 1
		1 4 1
		1 4 1
		2 4 0.99999994039535522 7 5.9604644775390625e-08
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 6 1
		2 4 0.030280828442958652 7 0.96971917155704135
		2 4 0.03028040947158539 7 0.96971959052841461
		2 4 0.030280053615570068 7 0.96971994638442993
		2 4 0.030279874801635742 7 0.96972012519836426
		2 4 0.030280649662017822 7 0.96971935033798218
		2 4 0.030280470848083496 7 0.9697195291519165
		2 4 0.030280709266662598 7 0.9697192907333374
		2 4 0.030281424522399902 7 0.9697185754776001
		2 4 0.030281186103820801 7 0.9697188138961792
		2 4 0.030282020568847656 7 0.96971797943115234
		2 4 0.030281126499176025 7 0.96971887350082397
		2 4 0.030281484127044678 7 0.96971851587295532
		2 4 0.030280590057373047 7 0.96971940994262695
		2 4 0.03028029203414917 7 0.96971970796585083
		2 4 0.030280470848083496 7 0.9697195291519165
		2 4 0.03028029203414917 7 0.96971970796585083
		2 4 0.030280947685241699 7 0.9697190523147583
		2 4 0.03028106689453125 7 0.96971893310546875
		2 4 0.03028106689453125 7 0.96971893310546875
		2 4 0.030281364917755127 7 0.96971863508224487
		1 7 1
		1 7 1
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 0.99999999999999989
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		1 7 1
		2 4 0.11080378293991089 7 0.88919621706008911
		2 4 0.11080306768417358 7 0.88919693231582642
		2 4 0.11080175638198853 7 0.88919824361801147
		2 4 0.11080056428909302 7 0.88919943571090698
		2 4 0.11080050468444824 7 0.88919949531555176
		2 4 0.11080050468444824 7 0.88919949531555176
		2 4 0.11080133254520064 7 0.88919866745479936
		2 4 0.11080265045166016 7 0.88919734954833984
		2 4 0.11080366373062134 7 0.88919633626937866
		2 4 0.11080473661422729 7 0.88919526338577271
		2 4 0.11080408096313477 7 0.88919591903686523
		2 4 0.11080300807952881 7 0.88919699192047119
		2 4 0.1108020544052124 7 0.8891979455947876
		2 4 0.11080068349838257 7 0.88919931650161743
		2 4 0.11080121994018555 7 0.88919878005981445
		2 4 0.11080068349838257 7 0.88919931650161743
		2 4 0.11080211400985718 7 0.88919788599014282
		2 4 0.11080306768417358 7 0.88919693231582642
		2 4 0.11080378293991089 7 0.88919621706008911
		2 4 0.11080461740493774 7 0.88919538259506226;
	setAttr -s 11 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.0000023441039427 0 0 0 0 1.0000023441039427 0 0
		 0 0 1 0 0 0 0.0021652231758063976 1;
	setAttr ".pm[1]" -type "matrix" 1.0529983779909329 0 0 0 0 1.0529983779909329 0 0
		 0 0 1 0 0 0 -0.31325491226452856 1;
	setAttr ".pm[2]" -type "matrix" 1.054853923623857 0 0 0 0 1.054853923623857 0 0 0 0 1 0
		 0 0 0.3182746162148849 1;
	setAttr ".pm[3]" -type "matrix" 1.2596302860960846 0 0 0 0 1.2596302860960846 0 0
		 0 0 1 0 0 0 -0.60806957707926867 1;
	setAttr ".pm[4]" -type "matrix" 1.6968049683383206 0 0 0 0 1.6968049683383206 0 0
		 0 0 1 0 0 0 -0.80788298594033925 1;
	setAttr ".pm[5]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.78994146992176106 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1;
	setAttr ".pm[7]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.72338485286005705 1;
	setAttr ".pm[8]" -type "matrix" 1.7723975386476538 0 0 0 0 1.7723975386476538 0 0
		 0 0 1 0 0 0 0.82563302195322763 1;
	setAttr ".pm[9]" -type "matrix" 1.2516940765802922 0 0 0 0 1.2516940765802922 0 0
		 0 0 1 0 0 0 0.60144094826706673 1;
	setAttr ".pm[10]" -type "matrix" 2.3185083279780141 0 0 0 0 2.3185083279780141 0 0
		 0 0 0.87556961026360047 0 0 0 -0.69514255218430376 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 11 ".ma";
	setAttr -s 11 ".dpf[0:10]"  4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 11 ".lw";
	setAttr -s 11 ".lw";
	setAttr ".mi" 6;
	setAttr ".bm" 1;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
	setAttr -s 11 ".ifcl";
	setAttr -s 11 ".ifcl";
createNode tweak -n "tweak175";
	rename -uid "A089F05E-4A27-A9F5-8774-CD8F64E11F5D";
createNode objectSet -n "skinCluster5Set1";
	rename -uid "A478804D-4C2E-AA7E-D09F-F79EAA51C6BF";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster5GroupId1";
	rename -uid "25E11DE9-4F70-BB09-3CD0-4F9334E2F30F";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster5GroupParts1";
	rename -uid "024E0970-46B4-5330-BD33-28834341EF42";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[0:300]";
createNode objectSet -n "tweakSet214";
	rename -uid "73CA384F-4115-0925-49F4-D7B584EE4340";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId1743";
	rename -uid "6FD21F0C-43B6-7ACE-3210-11927E8D7FDE";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts622";
	rename -uid "B97EACDB-4EBF-4551-8F45-178321DE3036";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode blendShape -n "blendShape2";
	rename -uid "CE352745-4AB7-8DD5-1480-5D9B15DFA12B";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 3 ".w";
	setAttr -s 3 ".w";
	setAttr -s 3 ".it[0].itg";
	setAttr ".it[0].itg[0].iti[6000].ipt" -type "pointArray" 320 -0.00012421607971191406
		 -4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00010567903518676758 -7.6770782470703125e-05
		 -8.3804130554199219e-05 1 -7.6770782470703125e-05 -0.00010564923286437988 -8.3804130554199219e-05
		 1 -4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05 1 0 -0.00013059377670288086
		 -8.3744525909423828e-05 1 4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05
		 1 7.6770782470703125e-05 -0.00010567903518676758 -8.3804130554199219e-05 1 0.00010564923286437988
		 -7.6770782470703125e-05 -8.3804130554199219e-05 1 0.00012421607971191406 -4.0352344512939453e-05
		 -8.3744525909423828e-05 1 0.00013059377670288086 0 -8.3804130554199219e-05 1 0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 0.00010564923286437988 7.6770782470703125e-05
		 -8.3804130554199219e-05 1 7.6770782470703125e-05 0.00010567903518676758 -8.3804130554199219e-05
		 1 4.0367245674133301e-05 0.00012421607971191406 -8.3744525909423828e-05 1 3.893774191965349e-12
		 0.00013059377670288086 -8.3744525909423828e-05 1 -4.0352344512939453e-05 0.00012421607971191406
		 -8.3744525909423828e-05 1 -7.6770782470703125e-05 0.00010567903518676758 -8.3744525909423828e-05
		 1 -0.00010567903518676758 7.6770782470703125e-05 -8.3804130554199219e-05 1 -0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00013065338134765625 0 -8.3804130554199219e-05
		 1 -0.00026369094848632812 -8.5681676864624023e-05 -0.00035595893859863281 1 -0.00022435188293457031
		 -0.00016295909881591797 -0.00035595893859863281 1 -0.00016295909881591797 -0.00022435188293457031
		 -0.00035595893859863281 1 -8.5651874542236328e-05 -0.00026363134384155273 -0.00035595893859863281
		 1 0 -0.00027716159820556641 -0.00035595893859863281 1 8.5651874542236328e-05 -0.00026363134384155273
		 -0.00035595893859863281 1 0.00016295909881591797 -0.00022435188293457031 -0.00035595893859863281
		 1 0.00022435188293457031 -0.00016295909881591797 -0.00035595893859863281 1 0.00026369094848632812
		 -8.5651874542236328e-05 -0.00035595893859863281 1 0.0002772212028503418 0 -0.00035595893859863281
		 1 0.00026369094848632812 8.5651874542236328e-05 -0.00035595893859863281 1 0.00022429227828979492
		 0.00016295909881591797 -0.00035595893859863281 1 0.00016295909881591797 0.00022429227828979492
		 -0.00035595893859863281 1 8.5651874542236328e-05 0.00026363134384155273 -0.00035595893859863281
		 1 8.2618356600505649e-12 0.00027716159820556641 -0.00035595893859863281 1 -8.5681676864624023e-05
		 0.00026363134384155273 -0.00035595893859863281 1 -0.00016292929649353027 0.00022429227828979492
		 -0.00035595893859863281 1 -0.00022429227828979492 0.00016295909881591797 -0.00035595893859863281
		 1 -0.00026363134384155273 8.5651874542236328e-05 -0.00035595893859863281 1 -0.0002772212028503418
		 0 -0.00035595893859863281 1 -0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00019574165344238281 -0.00014221668243408203 -0.00070393085479736328 1 -0.00014215707778930664
		 -0.00019562244415283203 -0.00070393085479736328 1 -7.4744224548339844e-05 -0.00023007392883300781
		 -0.00070393085479736328 1 0 -0.00024187564849853516 -0.00070393085479736328 1 7.4744224548339844e-05
		 -0.00023007392883300781 -0.00070393085479736328 1 0.00014215707778930664 -0.00019562244415283203
		 -0.00070393085479736328 1 0.00019568204879760742 -0.00014221668243408203 -0.00070393085479736328
		 1 0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328 1 0.00024187564849853516
		 0 -0.00070393085479736328 1 0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 0.00019568204879760742 0.00014221668243408203 -0.00070393085479736328 1 0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 7.4744224548339844e-05 0.00023007392883300781
		 -0.00070393085479736328 1 7.2084560542862164e-12 0.00024187564849853516 -0.00070393085479736328
		 1 -7.4744224548339844e-05 0.00023001432418823242 -0.00070393085479736328 1 -0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 -0.00019568204879760742 0.00014209747314453125
		 -0.00070393085479736328 1 -0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00024187564849853516 0 -0.00070393085479736328 1 -1.1324882507324219e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 -9.5367431640625e-07 -6.5565109252929688e-07 -0.0010392910335212946
		 1 -7.152557373046875e-07 -9.5367431640625e-07 -0.0010392910335212946 1 -3.5762786865234375e-07
		 -1.1324882507324219e-06 -0.0010392910335212946 1 -4.9960036108132044e-16 -1.0728836059570312e-06
		 -0.0010392910335212946 1 3.5762786865234375e-07 -1.1324882507324219e-06 -0.0010392910335212946
		 1 7.152557373046875e-07 -8.9406967163085938e-07 -0.0010392910335212946 1 8.9406967163085938e-07
		 -6.5565109252929688e-07 -0.0010392910335212946 1 1.0728836059570312e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 1.1920928955078125e-06 7.7715611723760958e-16 -0.0010392910335212946
		 1 1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 9.5367431640625e-07
		 6.5565109252929688e-07 -0.0010392910335212946 1 7.152557373046875e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 3.5762786865234375e-07 1.1324882507324219e-06 -0.0010392910335212946
		 1 3.5527136788005009e-14 1.1920928955078125e-06 -0.0010392910335212946 1 -3.5762786865234375e-07
		 1.0728836059570312e-06 -0.0010392910335212946 1 -6.5565109252929688e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 -8.9406967163085938e-07 6.5565109252929688e-07 -0.0010392910335212946
		 1 -1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 -1.1920928955078125e-06
		 7.7715611723760958e-16 -0.0010392910335212946 1 0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 0.0003502964973449707 0.00025445222854614258 -0.0012683868408203125
		 1 0.00025445222854614258 0.00035023689270019531 -0.0012683868408203125 1 0.00013378262519836426
		 0.00041174888610839844 -0.0012683868408203125 1 2.2604140781368187e-13 0.00043290853500366211
		 -0.0012683868408203125 1 -0.00013378262519836426 0.00041174888610839844 -0.0012683868408203125
		 1 -0.00025451183319091797 0.00035023689270019531 -0.0012683868408203125 1 -0.00035023689270019531
		 0.00025451183319091797 -0.0012683868408203125 1 -0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 -0.00043290853500366211 -8.475442569988445e-13 -0.0012683868408203125
		 1 -0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 -0.0003502964973449707
		 -0.00025445222854614258 -0.0012683868408203125 1 -0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 -0.00013378262519836426 -0.00041174888610839844 -0.0012683868408203125
		 1 -1.2677858762799588e-11 -0.00043290853500366211 -0.0012683868408203125 1 0.00013375282287597656
		 -0.00041174888610839844 -0.0012683868408203125 1 0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 0.00035023689270019531 -0.00025445222854614258 -0.0012683868408203125
		 1 0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 0.00043290853500366211
		 -8.475442569988445e-13 -0.0012683868408203125 1 0.00097805261611938477 0.00031778216361999512
		 -0.0012948513031005859 1 0.00083196163177490234 0.00060445070266723633 -0.0012948513031005859
		 1 0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 0.00031781196594238281
		 0.00097805261611938477 -0.0012948513031005859 1 -1.3798961973066071e-12 0.0010283589363098145
		 -0.0012948513031005859 1 -0.00031781196594238281 0.00097805261611938477 -0.0012948513031005859
		 1 -0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 -0.00083196163177490234
		 0.00060445070266723633 -0.0012948513031005859 1 -0.00097799301147460938 0.00031778216361999512
		 -0.0012948513031005859 1 -0.0010282993316650391 1.3798961973066071e-12 -0.0012948513031005859
		 1 -0.00097799301147460938 -0.00031781196594238281 -0.0012948513031005859 1 -0.00083196163177490234
		 -0.00060445070266723633 -0.0012948513031005859 1 -0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 -0.00031781196594238281 -0.00097799301147460938 -0.0012948513031005859
		 1 -3.2025937457547116e-11 -0.0010283589363098145 -0.0012948513031005859 1 0.00031775236129760742
		 -0.00097799301147460938 -0.0012948513031005859 1 0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 0.00083196163177490234 -0.00060445070266723633 -0.0012948513031005859
		 1 0.00097805261611938477 -0.00031781196594238281 -0.0012948513031005859 1 0.0010283589363098145
		 1.3798961973066071e-12 -0.0012948513031005859 1 0.0015241503715515137 0.00049524009227752686
		 -0.0011343955993652344 1 0.0012965500354766846 0.00094199180603027344 -0.0011343955993652344
		 1 0.00094199180603027344 0.0012965500354766846 -0.001134335994720459 1 0.00049524009227752686
		 0.0015241503715515137 -0.0011343955993652344 1 1.6341874879616121e-24 0.0016025900840759277
		 -0.0011343955993652344 1 -0.00049524009227752686 0.0015241503715515137 -0.0011343955993652344
		 1 -0.00094199180603027344 0.0012965500354766846 -0.0011343955993652344 1 -0.0012965798377990723
		 0.00094199180603027344 -0.001134335994720459 1 -0.0015242099761962891 0.00049524009227752686
		 -0.0011343955993652344 1 -0.0016026496887207031 0 -0.0011343955993652344 1 -0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 -0.0012965500354766846 -0.00094199180603027344
		 -0.0011343955993652344 1 -0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 -0.00049524009227752686 -0.0015241503715515137 -0.0011343955993652344 1 -4.7762682697793934e-11
		 -0.0016025900840759277 -0.0011343955993652344 1 0.00049524009227752686 -0.0015241503715515137
		 -0.0011343955993652344 1 0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 0.0012965798377990723 -0.00094199180603027344 -0.0011343955993652344 1 0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 0.0016026496887207031 0 -0.0011343955993652344
		 1 0.0018613338470458984 0.00060479342937469482 -0.00096124410629272461 1 0.0015833377838134766
		 0.0011503547430038452 -0.0009613037109375 1 0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 0.00060477852821350098 0.0018613338470458984 -0.00096124410629272461
		 1 4.5126569148123963e-11 0.0019571185111999512 -0.00096124410629272461 1 -0.00060477852821350098
		 0.0018613338470458984 -0.00096124410629272461 1 -0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 -0.0015833377838134766 0.0011503547430038452 -0.00096124410629272461
		 1 -0.0018613338470458984 0.00060477852821350098 -0.00096124410629272461 1 -0.0019571185111999512
		 0 -0.0009613037109375 1 -0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 -0.0015833377838134766 -0.0011503547430038452 -0.0009613037109375 1 -0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 -0.00060477852821350098 -0.0018613338470458984
		 -0.0009613037109375 1 -1.3199885628978336e-11 -0.0019571185111999512 -0.0009613037109375
		 1 0.00060479342937469482 -0.0018613338470458984 -0.0009613037109375 1 0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 0.0015833377838134766 -0.0011503696441650391
		 -0.0009613037109375 1 0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 0.0019571185111999512 0 -0.0009613037109375 1 0.0081200301647186279 0.0026379600167274475
		 0.00089275836944580078 1 0.0069073140621185303 0.005017697811126709 0.00089275836944580078
		 1 0.0050184428691864014 0.0069062709808349609 0.00089275836944580078 1 0.0026393905282020569
		 0.0081219971179962158 0.00089365243911743164 1 8.0398798729675036e-10 0.0085399746894836426
		 0.00089365243911743164 1 -0.00263938307762146 0.0081219971179962158 0.00089365243911743164
		 1 -0.0050184577703475952 0.0069062709808349609 0.00089275836944580078 1 -0.0069073140621185303
		 0.005017697811126709 0.00089275836944580078 1 -0.0081200301647186279 0.0026379674673080444
		 0.00089275836944580078 1 -0.0085379183292388916 -2.1363970592602755e-09 0.00089275836944580078
		 1 -0.0081200301647186279 -0.0026379674673080444 0.00089275836944580078 1 -0.0069073140621185303
		 -0.0050176829099655151 0.00089275836944580078 1 -0.0050184428691864014 -0.0069062709808349609
		 0.00089275836944580078 1 -0.00263938307762146 -0.0081219971179962158 0.00089365243911743164
		 1 5.4943871674595357e-10 -0.0085399448871612549 0.00089365243911743164 1 0.00263938307762146
		 -0.0081219971179962158 0.00089365243911743164 1 0.0050184428691864014 -0.0069062709808349609
		 0.00089275836944580078 1 0.0069073140621185303 -0.0050176829099655151 0.00089275836944580078
		 1 0.0081200003623962402 -0.0026379674673080444 0.00089275836944580078 1 0.0085379183292388916
		 -2.1363970592602755e-09 0.00089275836944580078 1 0.089747458696365356 0.029155179858207703
		 0.036116957664489746 1 0.076343804597854614 0.055456534028053284 0.036116957664489746
		 1 0.05546705424785614 0.076329275965690613 0.036116957664489746 1 0.02916070818901062
		 0.089730799198150635 0.036116957664489746 1 1.0872969302688773e-08 0.09434857964515686
		 0.036116898059844971 1 -0.029160700738430023 0.089730799198150635 0.036116957664489746
		 1 -0.055467039346694946 0.076329275965690613 0.036116957664489746 1 -0.076343804597854614
		 0.055456534028053284 0.036116957664489746 1 -0.089747428894042969 0.029155179858207703
		 0.036116898059844971 1 -0.094365894794464111 -3.7296128851949106e-08 0.036116957664489746
		 1 -0.089747428894042969 -0.029155343770980835 0.036116957664489746 1 -0.076343804597854614
		 -0.055456548929214478 0.036116898059844971 1 -0.055467039346694946 -0.076329261064529419
		 0.036116957664489746 1 -0.029160693287849426 -0.089730799198150635 0.036116957664489746
		 1 8.0606508134906107e-09 -0.09434857964515686 0.036116957664489746 1 0.02916070818901062
		 -0.089730799198150635 0.036116957664489746 1 0.055467039346694946 -0.076329261064529419
		 0.036116957664489746 1 0.07634378969669342 -0.055456548929214478 0.036116957664489746
		 1 0.089747428894042969 -0.029155343770980835 0.036116957664489746 1 0.094365894794464111
		 -3.7296128851949106e-08 0.036116957664489746 1 0.18310564756393433 0.059483356773853302
		 0.067194819450378418 1 0.15575876832008362 0.11314383149147034 0.067194819450378418
		 1 0.11316557228565216 0.15572938323020935 0.067194819450378418 1 0.059494562447071075
		 0.1830715537071228 0.067194819450378418 1 2.4263051123796231e-08 0.19249275326728821
		 0.067194819450378418 1 -0.059494547545909882 0.18307146430015564 0.067194819450378418
		 1 -0.11316554248332977 0.15572938323020935 0.067194819450378418 1 -0.15575873851776123
		 0.11314383149147034 0.067194819450378418 1 -0.18310552835464478 0.059483356773853302
		 0.067194819450378418 1 -0.19252863526344299 -1.1993861903647485e-07 0.067194819450378418
		 1 -0.18310552835464478 -0.059483438730239868 0.067194819450378418 1 -0.15575873851776123
		 -0.11314412951469421 0.067194819450378418 1 -0.11316554248332977 -0.15572947263717651
		 0.067194819450378418 1 -0.059494554996490479 -0.18307158350944519 0.067194819450378418
		 1 1.8525227574173186e-08 -0.19249270856380463 0.067194819450378418 1 0.059494562447071075
		 -0.1830715537071228 0.067194819450378418 1 0.11316552758216858 -0.15572947263717651
		 0.067194819450378418 1 0.15575866401195526 -0.11314412951469421 0.067194819450378418
		 1 0.18310558795928955 -0.059483438730239868 0.067194819450378418 1 0.19252863526344299
		 -1.1993861903647485e-07 0.067194819450378418 1 0.19821393489837646 0.064391426742076874
		 0.075306355953216553 1 0.1686108410358429 0.12247951328754425 0.075306355953216553
		 1 0.12250330299139023 0.16857865452766418 0.075306355953216553 1 0.0644037164747715
		 0.19817653298377991 0.075306355953216553 1 2.6215694504116982e-08 0.2083752453327179
		 0.075306355953216553 1 -0.064403712749481201 0.19817647337913513 0.075306355953216553
		 1 -0.12250262498855591 0.16857865452766418 0.075306355953216553 1 -0.1686103343963623
		 0.12247951328754425 0.075306355953216553 1 -0.1982138603925705 0.064391426742076874
		 0.075306355953216553 1 -0.20841410756111145 -1.2911640112633904e-07 0.075306355953216553
		 1 -0.1982138603925705 -0.064391456544399261 0.075306355953216553 1 -0.1686103343963623
		 -0.12247958779335022 0.075306355953216553 1 -0.12250262498855591 -0.16857871413230896
		 0.075306355953216553 1 -0.064403712749481201 -0.19817653298377991 0.075306355953216553
		 1 2.0004543799245766e-08 -0.20837530493736267 0.075306355953216553 1 0.0644037164747715
		 -0.19817653298377991 0.075306355953216553 1 0.12250268459320068 -0.16857871413230896
		 0.075306355953216553 1 0.1686103343963623 -0.12247958779335022 0.075306355953216553
		 1 0.1982138603925705 -0.064391456544399261 0.075306355953216553 1 0.20841410756111145
		 -1.2911640112633904e-07 0.075306355953216553 1 0.1974901556968689 0.064156390726566315
		 0.10021430253982544 1 0.16799542307853699 0.12203241884708405 0.10021424293518066
		 1 0.12205623835325241 0.16796335577964783 0.10021424293518066 1 0.064168576151132584
		 0.19745332002639771 0.10021430253982544 1 2.61321755345989e-08 0.20761445164680481
		 0.10021424293518066 1 -0.064168572425842285 0.19745326042175293 0.10021424293518066
		 1 -0.1220555305480957 0.16796335577964783 0.10021424293518066 1 -0.1679949164390564
		 0.12203241884708405 0.10021424293518066 1 -0.19749008119106293 0.064156390726566315
		 0.10021430253982544 1 -0.20765331387519836 -1.2881005773124343e-07 0.10021430253982544
		 1 -0.19749008119106293 -0.064156420528888702 0.10021430253982544 1 -0.1679949164390564
		 -0.12203247845172882 0.10021424293518066 1 -0.1220555305480957 -0.16796338558197021
		 0.10021430253982544 1 -0.064168572425842285 -0.19745332002639771 0.10021430253982544
		 1 1.9943721341064702e-08 -0.20761451125144958 0.10021430253982544 1 0.064168576151132584
		 -0.19745332002639771 0.10021430253982544 1 0.12205559015274048 -0.16796338558197021
		 0.10021430253982544 1 0.1679949164390564 -0.12203247845172882 0.10021424293518066
		 1 0.19749008119106293 -0.064156420528888702 0.10021430253982544 1 0.20765331387519836
		 -1.2881005773124343e-07 0.10021430253982544 1 0.19153779745101929 0.062222741544246674
		 0.083096146583557129 1 0.16293162107467651 0.11835423856973648 0.083096146583557129
		 1 0.11837740242481232 0.16290096938610077 0.083098053932189941 1 0.062234789133071899
		 0.19150306284427643 0.083098053932189941 1 2.5535966230449958e-08 0.20135816931724548
		 0.083098053932189941 1 -0.062234759330749512 0.19150306284427643 0.083098053932189941
		 1 -0.11837736517190933 0.16290096938610077 0.083098053932189941 1 -0.16293151676654816
		 0.11835423856973648 0.083096146583557129 1 -0.19153767824172974 0.062222741544246674
		 0.083096146583557129 1 -0.2013944536447525 -1.1153542800457217e-07 0.083096146583557129
		 1 -0.19153767824172974 -0.062222793698310852 0.083096146583557129 1 -0.16293151676654816
		 -0.11835426837205887 0.083096146583557129 1 -0.11837736517190933 -0.16290132701396942
		 0.083098053932189941 1 -0.062234759330749512 -0.19150309264659882 0.083098053932189941
		 1 1.9534025952339107e-08 -0.20135830342769623 0.083098053932189941 1 0.062234789133071899
		 -0.19150303304195404 0.083098053932189941 1 0.11837736517190933 -0.16290132701396942
		 0.083098053932189941 1 0.16293150186538696 -0.11835426837205887 0.083096146583557129
		 1 0.19153767824172974 -0.062222793698310852 0.083096146583557129 1 0.20139442384243011
		 -1.1153542800457217e-07 0.083096146583557129 1 0.13879665732383728 0.045089274644851685
		 0.055639445781707764 1 0.11806720495223999 0.085764899849891663 0.055639445781707764
		 1 0.085780978202819824 0.11804506182670593 0.055639445781707764 1 0.045097768306732178
		 0.13877040147781372 0.055639445781707764 1 1.5814610065945089e-08 0.14591169357299805
		 0.055639445781707764 1 -0.045097634196281433 0.13877040147781372 0.055639445781707764
		 1 -0.085780948400497437 0.11804506182670593 0.055639445781707764 1 -0.11806705594062805
		 0.085764899849891663 0.055639445781707764 1 -0.13879662752151489 0.045089252293109894
		 0.055639445781707764 1 -0.14593896269798279 -4.8833577181994769e-08 0.055639445781707764
		 1 -0.13879662752151489 -0.045089282095432281 0.055639445781707764 1 -0.11806705594062805
		 -0.085764974355697632 0.055639445781707764 1 -0.085780948400497437 -0.11804503202438354
		 0.055639445781707764 1 -0.045097619295120239 -0.13877043128013611 0.055639445781707764
		 1 1.1465293603407645e-08 -0.14591172337532043 0.055639445781707764 1 0.045097768306732178
		 -0.13877037167549133 0.055639445781707764 1 0.085780918598175049 -0.11804503202438354
		 0.055639445781707764 1 0.11806705594062805 -0.085764974355697632 0.055639445781707764
		 1 0.13879662752151489 -0.045089282095432281 0.055639445781707764 1 0.14593896269798279
		 -4.8833577181994769e-08 0.055639445781707764 1 0.00062489509582519531 0.0019231736660003662
		 -0.00095319747924804688 1 0.0011885762214660645 0.0016359686851501465 -0.00095325708389282227
		 1 0.0016359388828277588 0.0011885762214660645 -0.00095325708389282227 1 0.0019232034683227539
		 0.00062488019466400146 -0.00095319747924804688 1 0.0020221471786499023 0 -0.00095319747924804688
		 1 0.0019231438636779785 -0.00062488019466400146 -0.00095319747924804688 1 0.0016359388828277588
		 -0.0011885762214660645 -0.00095319747924804688 1 0.0011886060237884521 -0.0016359388828277588
		 -0.00095319747924804688 1 0.00062486529350280762 -0.0019231736660003662 -0.00095319747924804688
		 1 -2.7856383866264878e-11 -0.0020221471786499023 -0.00095319747924804688 1 -0.00062486529350280762
		 -0.0019231736660003662 -0.00095319747924804688 1 -0.0011886060237884521 -0.0016359388828277588
		 -0.00095319747924804688 1 -0.0016359686851501465 -0.0011885762214660645 -0.00095319747924804688
		 1 -0.0019232034683227539 -0.00062488019466400146 -0.00095319747924804688 1 -0.0020221471786499023
		 0 -0.00095319747924804688 1 -0.0019232034683227539 0.00062489509582519531 -0.00095319747924804688
		 1 -0.0016359388828277588 0.0011885762214660645 -0.00095319747924804688 1 -0.0011885762214660645
		 0.0016359686851501465 -0.00095319747924804688 1 -0.00062486529350280762 0.0019231736660003662
		 -0.00095319747924804688 1 3.240829826722802e-11 0.0020221471786499023 -0.00095319747924804688
		 1 ;
	setAttr ".it[0].itg[0].iti[6000].ict" -type "componentList" 2 "vtx[20:179]" "vtx[181:340]";
	setAttr ".it[0].itg[1].iti[6000].ipt" -type "pointArray" 320 -0.00012421607971191406
		 -4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00010567903518676758 -7.6770782470703125e-05
		 -8.3804130554199219e-05 1 -7.6770782470703125e-05 -0.00010564923286437988 -8.3804130554199219e-05
		 1 -4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05 1 0 -0.00013059377670288086
		 -8.3744525909423828e-05 1 4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05
		 1 7.6770782470703125e-05 -0.00010567903518676758 -8.3804130554199219e-05 1 0.00010564923286437988
		 -7.6770782470703125e-05 -8.3804130554199219e-05 1 0.00012421607971191406 -4.0352344512939453e-05
		 -8.3744525909423828e-05 1 0.00013059377670288086 0 -8.3804130554199219e-05 1 0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 0.00010564923286437988 7.6770782470703125e-05
		 -8.3804130554199219e-05 1 7.6770782470703125e-05 0.00010567903518676758 -8.3804130554199219e-05
		 1 4.0367245674133301e-05 0.00012421607971191406 -8.3744525909423828e-05 1 3.893774191965349e-12
		 0.00013059377670288086 -8.3744525909423828e-05 1 -4.0352344512939453e-05 0.00012421607971191406
		 -8.3744525909423828e-05 1 -7.6770782470703125e-05 0.00010567903518676758 -8.3744525909423828e-05
		 1 -0.00010567903518676758 7.6770782470703125e-05 -8.3804130554199219e-05 1 -0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00013065338134765625 0 -8.3804130554199219e-05
		 1 -0.00026369094848632812 -8.5681676864624023e-05 -0.00035595893859863281 1 -0.00022435188293457031
		 -0.00016295909881591797 -0.00035595893859863281 1 -0.00016295909881591797 -0.00022435188293457031
		 -0.00035595893859863281 1 -8.5651874542236328e-05 -0.00026363134384155273 -0.00035595893859863281
		 1 0 -0.00027716159820556641 -0.00035595893859863281 1 8.5651874542236328e-05 -0.00026363134384155273
		 -0.00035595893859863281 1 0.00016295909881591797 -0.00022435188293457031 -0.00035595893859863281
		 1 0.00022435188293457031 -0.00016295909881591797 -0.00035595893859863281 1 0.00026369094848632812
		 -8.5651874542236328e-05 -0.00035595893859863281 1 0.0002772212028503418 0 -0.00035595893859863281
		 1 0.00026369094848632812 8.5651874542236328e-05 -0.00035595893859863281 1 0.00022429227828979492
		 0.00016295909881591797 -0.00035595893859863281 1 0.00016295909881591797 0.00022429227828979492
		 -0.00035595893859863281 1 8.5651874542236328e-05 0.00026363134384155273 -0.00035595893859863281
		 1 8.2618356600505649e-12 0.00027716159820556641 -0.00035595893859863281 1 -8.5681676864624023e-05
		 0.00026363134384155273 -0.00035595893859863281 1 -0.00016292929649353027 0.00022429227828979492
		 -0.00035595893859863281 1 -0.00022429227828979492 0.00016295909881591797 -0.00035595893859863281
		 1 -0.00026363134384155273 8.5651874542236328e-05 -0.00035595893859863281 1 -0.0002772212028503418
		 0 -0.00035595893859863281 1 -0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00019574165344238281 -0.00014221668243408203 -0.00070393085479736328 1 -0.00014215707778930664
		 -0.00019562244415283203 -0.00070393085479736328 1 -7.4744224548339844e-05 -0.00023007392883300781
		 -0.00070393085479736328 1 0 -0.00024187564849853516 -0.00070393085479736328 1 7.4744224548339844e-05
		 -0.00023007392883300781 -0.00070393085479736328 1 0.00014215707778930664 -0.00019562244415283203
		 -0.00070393085479736328 1 0.00019568204879760742 -0.00014221668243408203 -0.00070393085479736328
		 1 0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328 1 0.00024187564849853516
		 0 -0.00070393085479736328 1 0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 0.00019568204879760742 0.00014221668243408203 -0.00070393085479736328 1 0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 7.4744224548339844e-05 0.00023007392883300781
		 -0.00070393085479736328 1 7.2084560542862164e-12 0.00024187564849853516 -0.00070393085479736328
		 1 -7.4744224548339844e-05 0.00023001432418823242 -0.00070393085479736328 1 -0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 -0.00019568204879760742 0.00014209747314453125
		 -0.00070393085479736328 1 -0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00024187564849853516 0 -0.00070393085479736328 1 -1.1324882507324219e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 -9.5367431640625e-07 -6.5565109252929688e-07 -0.0010392910335212946
		 1 -7.152557373046875e-07 -9.5367431640625e-07 -0.0010392910335212946 1 -3.5762786865234375e-07
		 -1.1324882507324219e-06 -0.0010392910335212946 1 -4.9960036108132044e-16 -1.0728836059570312e-06
		 -0.0010392910335212946 1 3.5762786865234375e-07 -1.1324882507324219e-06 -0.0010392910335212946
		 1 7.152557373046875e-07 -8.9406967163085938e-07 -0.0010392910335212946 1 8.9406967163085938e-07
		 -6.5565109252929688e-07 -0.0010392910335212946 1 1.0728836059570312e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 1.1920928955078125e-06 7.7715611723760958e-16 -0.0010392910335212946
		 1 1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 9.5367431640625e-07
		 6.5565109252929688e-07 -0.0010392910335212946 1 7.152557373046875e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 3.5762786865234375e-07 1.1324882507324219e-06 -0.0010392910335212946
		 1 3.5527136788005009e-14 1.1920928955078125e-06 -0.0010392910335212946 1 -3.5762786865234375e-07
		 1.0728836059570312e-06 -0.0010392910335212946 1 -6.5565109252929688e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 -8.9406967163085938e-07 6.5565109252929688e-07 -0.0010392910335212946
		 1 -1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 -1.1920928955078125e-06
		 7.7715611723760958e-16 -0.0010392910335212946 1 0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 0.0003502964973449707 0.00025445222854614258 -0.0012683868408203125
		 1 0.00025445222854614258 0.00035023689270019531 -0.0012683868408203125 1 0.00013378262519836426
		 0.00041174888610839844 -0.0012683868408203125 1 2.2604140781368187e-13 0.00043290853500366211
		 -0.0012683868408203125 1 -0.00013378262519836426 0.00041174888610839844 -0.0012683868408203125
		 1 -0.00025451183319091797 0.00035023689270019531 -0.0012683868408203125 1 -0.00035023689270019531
		 0.00025451183319091797 -0.0012683868408203125 1 -0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 -0.00043290853500366211 -8.475442569988445e-13 -0.0012683868408203125
		 1 -0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 -0.0003502964973449707
		 -0.00025445222854614258 -0.0012683868408203125 1 -0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 -0.00013378262519836426 -0.00041174888610839844 -0.0012683868408203125
		 1 -1.2677858762799588e-11 -0.00043290853500366211 -0.0012683868408203125 1 0.00013375282287597656
		 -0.00041174888610839844 -0.0012683868408203125 1 0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 0.00035023689270019531 -0.00025445222854614258 -0.0012683868408203125
		 1 0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 0.00043290853500366211
		 -8.475442569988445e-13 -0.0012683868408203125 1 0.00097805261611938477 0.00031778216361999512
		 -0.0012948513031005859 1 0.00083196163177490234 0.00060445070266723633 -0.0012948513031005859
		 1 0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 0.00031781196594238281
		 0.00097805261611938477 -0.0012948513031005859 1 -1.3798961973066071e-12 0.0010283589363098145
		 -0.0012948513031005859 1 -0.00031781196594238281 0.00097805261611938477 -0.0012948513031005859
		 1 -0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 -0.00083196163177490234
		 0.00060445070266723633 -0.0012948513031005859 1 -0.00097799301147460938 0.00031778216361999512
		 -0.0012948513031005859 1 -0.0010282993316650391 1.3798961973066071e-12 -0.0012948513031005859
		 1 -0.00097799301147460938 -0.00031781196594238281 -0.0012948513031005859 1 -0.00083196163177490234
		 -0.00060445070266723633 -0.0012948513031005859 1 -0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 -0.00031781196594238281 -0.00097799301147460938 -0.0012948513031005859
		 1 -3.2025937457547116e-11 -0.0010283589363098145 -0.0012948513031005859 1 0.00031775236129760742
		 -0.00097799301147460938 -0.0012948513031005859 1 0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 0.00083196163177490234 -0.00060445070266723633 -0.0012948513031005859
		 1 0.00097805261611938477 -0.00031781196594238281 -0.0012948513031005859 1 0.0010283589363098145
		 1.3798961973066071e-12 -0.0012948513031005859 1 0.0015241503715515137 0.00049524009227752686
		 -0.0011343955993652344 1 0.0012965500354766846 0.00094199180603027344 -0.0011343955993652344
		 1 0.00094199180603027344 0.0012965500354766846 -0.001134335994720459 1 0.00049524009227752686
		 0.0015241503715515137 -0.0011343955993652344 1 1.6341874879616121e-24 0.0016025900840759277
		 -0.0011343955993652344 1 -0.00049524009227752686 0.0015241503715515137 -0.0011343955993652344
		 1 -0.00094199180603027344 0.0012965500354766846 -0.0011343955993652344 1 -0.0012965798377990723
		 0.00094199180603027344 -0.001134335994720459 1 -0.0015242099761962891 0.00049524009227752686
		 -0.0011343955993652344 1 -0.0016026496887207031 0 -0.0011343955993652344 1 -0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 -0.0012965500354766846 -0.00094199180603027344
		 -0.0011343955993652344 1 -0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 -0.00049524009227752686 -0.0015241503715515137 -0.0011343955993652344 1 -4.7762682697793934e-11
		 -0.0016025900840759277 -0.0011343955993652344 1 0.00049524009227752686 -0.0015241503715515137
		 -0.0011343955993652344 1 0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 0.0012965798377990723 -0.00094199180603027344 -0.0011343955993652344 1 0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 0.0016026496887207031 0 -0.0011343955993652344
		 1 0.0018613338470458984 0.00060479342937469482 -0.00096124410629272461 1 0.0015833377838134766
		 0.0011503547430038452 -0.0009613037109375 1 0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 0.00060477852821350098 0.0018613338470458984 -0.00096124410629272461
		 1 4.5126569148123963e-11 0.0019571185111999512 -0.00096124410629272461 1 -0.00060477852821350098
		 0.0018613338470458984 -0.00096124410629272461 1 -0.0011503696441650391 0.0015833377838134766
		 -0.00096124410629272461 1 -0.0015833377838134766 0.0011503547430038452 -0.00096124410629272461
		 1 -0.0018613338470458984 0.00060477852821350098 -0.00096124410629272461 1 -0.0019571185111999512
		 0 -0.0009613037109375 1 -0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 -0.0015833377838134766 -0.0011503547430038452 -0.0009613037109375 1 -0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 -0.00060477852821350098 -0.0018613338470458984
		 -0.0009613037109375 1 -1.3199885628978336e-11 -0.0019571185111999512 -0.0009613037109375
		 1 0.00060479342937469482 -0.0018613338470458984 -0.0009613037109375 1 0.0011503696441650391
		 -0.0015833377838134766 -0.0009613037109375 1 0.0015833377838134766 -0.0011503696441650391
		 -0.0009613037109375 1 0.0018613338470458984 -0.00060477852821350098 -0.0009613037109375
		 1 0.0019571185111999512 0 -0.0009613037109375 1 0.0017341673374176025 0.00056345760822296143
		 -0.0010418891906738281 1 0.0014751553535461426 0.0010717660188674927 -0.0010418891906738281
		 1 0.0010717511177062988 0.0014751553535461426 -0.0010418891906738281 1 0.00056345760822296143
		 0.0017341375350952148 -0.0010418891906738281 1 3.2229330315658444e-11 0.0018233954906463623
		 -0.0010418891906738281 1 -0.00056345760822296143 0.0017341375350952148 -0.0010418891906738281
		 1 -0.0010717660188674927 0.0014751553535461426 -0.0010418891906738281 1 -0.0014751553535461426
		 0.0010717660188674927 -0.0010418891906738281 1 -0.0017341673374176025 0.00056346505880355835
		 -0.0010418891906738281 1 -0.00182342529296875 0 -0.0010418891906738281 1 -0.0017341673374176025
		 -0.00056346505880355835 -0.0010418891906738281 1 -0.0014751553535461426 -0.0010717511177062988
		 -0.0010418891906738281 1 -0.0010717511177062988 -0.0014751553535461426 -0.0010418891906738281
		 1 -0.00056345760822296143 -0.0017341375350952148 -0.0010418891906738281 1 -2.2112089936854318e-11
		 -0.0018233656883239746 -0.0010418891906738281 1 0.00056345760822296143 -0.0017341375350952148
		 -0.0010418891906738281 1 0.0010717511177062988 -0.0014751553535461426 -0.0010418891906738281
		 1 0.0014751553535461426 -0.0010717511177062988 -0.0010418891906738281 1 0.0017341375350952148
		 -0.00056346505880355835 -0.0010418891906738281 1 0.00182342529296875 0 -0.0010418891906738281
		 1 -0.11783930659294128 -0.038280937820672989 -0.025105953216552734 1 -0.10024003684520721
		 -0.072814695537090302 -0.025105953216552734 1 -0.072828635573387146 -0.10022066533565521
		 -0.025105953216552734 1 -0.03828825056552887 -0.11781670153141022 -0.025105953216552734
		 1 -1.16819290907344e-08 -0.12387976050376892 -0.02510601282119751 1 0.03828825056552887
		 -0.11781665682792664 -0.025105953216552734 1 0.072828598320484161 -0.10022066533565521
		 -0.025105953216552734 1 0.10023985803127289 -0.072814695537090302 -0.025105953216552734
		 1 0.11783920228481293 -0.038280937820672989 -0.02510601282119751 1 0.12390351295471191
		 2.7739535113369129e-08 -0.025105953216552734 1 0.11783920228481293 0.03828100860118866
		 -0.025105953216552734 1 0.10023985803127289 0.072814702987670898 -0.02510601282119751
		 1 0.072828598320484161 0.10022066533565521 -0.025105953216552734 1 0.038288254290819168
		 0.11781665682792664 -0.025105953216552734 1 -7.9893389681728877e-09 0.12387976050376892
		 -0.025105953216552734 1 -0.03828825056552887 0.11781665682792664 -0.025105953216552734
		 1 -0.072828598320484161 0.10022066533565521 -0.025105953216552734 1 -0.10023984313011169
		 0.072814702987670898 -0.025105953216552734 1 -0.11783920228481293 0.03828100860118866
		 -0.025105953216552734 1 -0.12390351295471191 2.7739535113369129e-08 -0.025105953216552734
		 1 -0.18831075727939606 -0.061174225062131882 -0.0219917893409729 1 -0.16018648445606232
		 -0.11636010557413101 -0.021991848945617676 1 -0.11638244241476059 -0.16015590727329254
		 -0.0219917893409729 1 -0.061185892671346664 -0.18827494978904724 -0.0219917893409729
		 1 -1.8267662937887508e-08 -0.19796404242515564 -0.0219917893409729 1 0.061185877770185471
		 -0.18827484548091888 -0.021991968154907227 1 0.11638227850198746 -0.16015590727329254
		 -0.0219917893409729 1 0.16018636524677277 -0.11636010557413101 -0.021991848945617676
		 1 0.18831063807010651 -0.061174225062131882 -0.0219917893409729 1 0.19800154864788055
		 6.5546423400064668e-08 -0.0219917893409729 1 0.18831063807010651 0.061174225062131882
		 -0.021991848945617676 1 0.16018636524677277 0.11636023968458176 -0.0219917893409729
		 1 0.11638227850198746 0.16015592217445374 -0.0219917893409729 1 0.061185870319604874
		 0.18827496469020844 -0.0219917893409729 1 -1.2366783153083816e-08 0.19796392321586609
		 -0.0219917893409729 1 -0.061185892671346664 0.18827486038208008 -0.0219917893409729
		 1 -0.11638230830430984 0.16015592217445374 -0.0219917893409729 1 -0.1601862907409668
		 0.11636023968458176 -0.021991848945617676 1 -0.18831063807010651 0.061174225062131882
		 -0.021991848945617676 1 -0.19800154864788055 6.5546423400064668e-08 -0.0219917893409729
		 1 -0.17301677167415619 -0.056205827742815018 -0.0086470246315002441 1 -0.14717656373977661
		 -0.10690969973802567 -0.0086470246315002441 1 -0.1069301962852478 -0.14714857935905457
		 -0.0086470246315002441 1 -0.05621655285358429 -0.17298388481140137 -0.0086470246315002441
		 1 -1.6716764861257616e-08 -0.18188589811325073 -0.0086470246315002441 1 0.056216541677713394
		 -0.17298376560211182 -0.0086470246315002441 1 0.10693006217479706 -0.14714857935905457
		 -0.0086470246315002441 1 0.14717645943164825 -0.10690969973802567 -0.0086470246315002441
		 1 0.17301662266254425 -0.056205827742815018 -0.0086470246315002441 1 0.18192043900489807
		 6.5546423400064668e-08 -0.0086470246315002441 1 0.17301662266254425 0.056205835193395615
		 -0.0086470246315002441 1 0.14717645943164825 0.10690971463918686 -0.0086470246315002441
		 1 0.10693006217479706 0.14714859426021576 -0.0086470246315002441 1 0.0562165267765522
		 0.17298378050327301 -0.0086470246315002441 1 -1.1295135493583075e-08 0.18188591301441193
		 -0.0086470246315002441 1 -0.05621655285358429 0.17298378050327301 -0.0086470246315002441
		 1 -0.10693006217479706 0.14714859426021576 -0.0086470246315002441 1 -0.14717642962932587
		 0.10690971463918686 -0.0086470246315002441 1 -0.17301662266254425 0.056205835193395615
		 -0.0086470246315002441 1 -0.18192043900489807 6.5546423400064668e-08 -0.0086470246315002441
		 1 -0.17301677167415619 -0.056205827742815018 0.019000589847564697 1 -0.14717656373977661
		 -0.10690969973802567 0.019000411033630371 1 -0.1069301962852478 -0.14714857935905457
		 0.019000411033630371 1 -0.05621655285358429 -0.17298388481140137 0.019000589847564697
		 1 -1.6716764861257616e-08 -0.18188589811325073 0.019000411033630371 1 0.056216541677713394
		 -0.17298376560211182 0.019000411033630371 1 0.10693006217479706 -0.14714857935905457
		 0.019000411033630371 1 0.14717645943164825 -0.10690969973802567 0.019000411033630371
		 1 0.17301662266254425 -0.056205827742815018 0.019000589847564697 1 0.18192043900489807
		 6.5546423400064668e-08 0.019000589847564697 1 0.17301662266254425 0.056205835193395615
		 0.019000589847564697 1 0.14717645943164825 0.10690971463918686 0.019000411033630371
		 1 0.10693006217479706 0.14714859426021576 0.019000589847564697 1 0.0562165267765522
		 0.17298378050327301 0.019000589847564697 1 -1.1295135493583075e-08 0.18188591301441193
		 0.019000589847564697 1 -0.05621655285358429 0.17298378050327301 0.019000589847564697
		 1 -0.10693006217479706 0.14714859426021576 0.019000589847564697 1 -0.14717642962932587
		 0.10690971463918686 0.019000411033630371 1 -0.17301662266254425 0.056205835193395615
		 0.019000589847564697 1 -0.18192043900489807 6.5546423400064668e-08 0.019000589847564697
		 1 -0.19048921763896942 -0.061881884932518005 0.019000589847564697 1 -0.16203954815864563
		 -0.11770627647638321 0.019000411033630371 1 -0.11772876977920532 -0.1620086133480072
		 0.019000411033630371 1 -0.061893690377473831 -0.19045296311378479 0.019000589847564697
		 1 -1.8488558239937447e-08 -0.20025402307510376 0.019000589847564697 1 0.061893690377473831
		 -0.19045296311378479 0.019000411033630371 1 0.11772860586643219 -0.1620086133480072
		 0.019000411033630371 1 0.16203941404819489 -0.11770627647638321 0.019000411033630371
		 1 0.19048906862735748 -0.061881884932518005 0.019000589847564697 1 0.20029206573963165
		 6.5546423400064668e-08 0.019000589847564697 1 0.19048906862735748 0.061881892383098602
		 0.019000589847564697 1 0.16203941404819489 0.117706298828125 0.019000589847564697
		 1 0.11772860586643219 0.1620086282491684 0.019000589847564697 1 0.061893675476312637
		 0.19045297801494598 0.019000589847564697 1 -1.251942371993664e-08 0.20025402307510376
		 0.019000589847564697 1 -0.061893690377473831 0.19045285880565643 0.019000589847564697
		 1 -0.11772860586643219 0.1620086282491684 0.019000589847564697 1 -0.16203939914703369
		 0.117706298828125 0.019000589847564697 1 -0.19048906862735748 0.061881892383098602
		 0.019000589847564697 1 -0.20029206573963165 6.5546423400064668e-08 0.019000589847564697
		 1 -0.15081228315830231 -0.048992495983839035 0.016154766082763672 1 -0.12828832864761353
		 -0.093189187347888947 0.016154825687408447 1 -0.093206949532032013 -0.12826377153396606
		 0.016154825687408447 1 -0.049001824110746384 -0.15078336000442505 0.016154825687408447
		 1 -1.4906447631801711e-08 -0.1585429310798645 0.016154825687408447 1 0.049001831561326981
		 -0.15078336000442505 0.016154825687408447 1 0.093206882476806641 -0.12826377153396606
		 0.016154825687408447 1 0.1282881498336792 -0.093189187347888947 0.016154825687408447
		 1 0.15081214904785156 -0.048992399126291275 0.016154825687408447 1 0.15857319533824921
		 3.5773904727420813e-08 0.016154825687408447 1 0.15081214904785156 0.048992495983839035
		 0.016154766082763672 1 0.1282881498336792 0.09318917989730835 0.016154825687408447
		 1 0.093206882476806641 0.12826365232467651 0.016154825687408447 1 0.049001820385456085
		 0.15078337490558624 0.016154825687408447 1 -1.0180631448974964e-08 0.1585429310798645
		 0.016154825687408447 1 -0.049001824110746384 0.15078334510326385 0.016154825687408447
		 1 -0.093206882476806641 0.12826365232467651 0.016154825687408447 1 -0.1282881498336792
		 0.09318917989730835 0.016154825687408447 1 -0.15081214904785156 0.048992495983839035
		 0.016154766082763672 1 -0.15857319533824921 3.5773904727420813e-08 0.016154825687408447
		 1 0.00062489509582519531 0.0019231736660003662 -0.00095319747924804688 1 0.0011885762214660645
		 0.0016359686851501465 -0.00095325708389282227 1 0.0016359388828277588 0.0011885762214660645
		 -0.00095325708389282227 1 0.0019232034683227539 0.00062488019466400146 -0.00095319747924804688
		 1 0.0020221471786499023 0 -0.00095319747924804688 1 0.0019231438636779785 -0.00062488019466400146
		 -0.00095319747924804688 1 0.0016359388828277588 -0.0011885762214660645 -0.00095319747924804688
		 1 0.0011886060237884521 -0.0016359388828277588 -0.00095319747924804688 1 0.00062486529350280762
		 -0.0019231736660003662 -0.00095319747924804688 1 -2.7856383866264878e-11 -0.0020221471786499023
		 -0.00095319747924804688 1 -0.00062486529350280762 -0.0019231736660003662 -0.00095319747924804688
		 1 -0.0011886060237884521 -0.0016359388828277588 -0.00095319747924804688 1 -0.0016359686851501465
		 -0.0011885762214660645 -0.00095319747924804688 1 -0.0019232034683227539 -0.00062488019466400146
		 -0.00095319747924804688 1 -0.0020221471786499023 0 -0.00095319747924804688 1 -0.0019232034683227539
		 0.00062489509582519531 -0.00095319747924804688 1 -0.0016359388828277588 0.0011885762214660645
		 -0.00095319747924804688 1 -0.0011885762214660645 0.0016359686851501465 -0.00095319747924804688
		 1 -0.00062486529350280762 0.0019231736660003662 -0.00095319747924804688 1 3.240829826722802e-11
		 0.0020221471786499023 -0.00095319747924804688 1 ;
	setAttr ".it[0].itg[1].iti[6000].ict" -type "componentList" 2 "vtx[20:179]" "vtx[181:340]";
	setAttr ".it[0].itg[2].iti[6000].ipt" -type "pointArray" 320 -0.00012421607971191406
		 -4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00010567903518676758 -7.6770782470703125e-05
		 -8.3804130554199219e-05 1 -7.6770782470703125e-05 -0.00010564923286437988 -8.3804130554199219e-05
		 1 -4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05 1 0 -0.00013059377670288086
		 -8.3744525909423828e-05 1 4.0367245674133301e-05 -0.00012421607971191406 -8.3744525909423828e-05
		 1 7.6770782470703125e-05 -0.00010567903518676758 -8.3804130554199219e-05 1 0.00010564923286437988
		 -7.6770782470703125e-05 -8.3804130554199219e-05 1 0.00012421607971191406 -4.0352344512939453e-05
		 -8.3744525909423828e-05 1 0.00013059377670288086 0 -8.3804130554199219e-05 1 0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 0.00010564923286437988 7.6770782470703125e-05
		 -8.3804130554199219e-05 1 7.6770782470703125e-05 0.00010567903518676758 -8.3804130554199219e-05
		 1 4.0367245674133301e-05 0.00012421607971191406 -8.3744525909423828e-05 1 3.893774191965349e-12
		 0.00013059377670288086 -8.3744525909423828e-05 1 -4.0352344512939453e-05 0.00012421607971191406
		 -8.3744525909423828e-05 1 -7.6770782470703125e-05 0.00010567903518676758 -8.3744525909423828e-05
		 1 -0.00010567903518676758 7.6770782470703125e-05 -8.3804130554199219e-05 1 -0.00012421607971191406
		 4.0352344512939453e-05 -8.3744525909423828e-05 1 -0.00013065338134765625 0 -8.3804130554199219e-05
		 1 -0.00026369094848632812 -8.5681676864624023e-05 -0.00035595893859863281 1 -0.00022435188293457031
		 -0.00016295909881591797 -0.00035595893859863281 1 -0.00016295909881591797 -0.00022435188293457031
		 -0.00035595893859863281 1 -8.5651874542236328e-05 -0.00026363134384155273 -0.00035595893859863281
		 1 0 -0.00027716159820556641 -0.00035595893859863281 1 8.5651874542236328e-05 -0.00026363134384155273
		 -0.00035595893859863281 1 0.00016295909881591797 -0.00022435188293457031 -0.00035595893859863281
		 1 0.00022435188293457031 -0.00016295909881591797 -0.00035595893859863281 1 0.00026369094848632812
		 -8.5651874542236328e-05 -0.00035595893859863281 1 0.0002772212028503418 0 -0.00035595893859863281
		 1 0.00026369094848632812 8.5651874542236328e-05 -0.00035595893859863281 1 0.00022429227828979492
		 0.00016295909881591797 -0.00035595893859863281 1 0.00016295909881591797 0.00022429227828979492
		 -0.00035595893859863281 1 8.5681676864624023e-05 0.00026363134384155273 -0.00035595893859863281
		 1 8.2618356600505649e-12 0.00027716159820556641 -0.00035595893859863281 1 -8.5681676864624023e-05
		 0.00026363134384155273 -0.00035595893859863281 1 -0.00016292929649353027 0.00022429227828979492
		 -0.00035595893859863281 1 -0.00022429227828979492 0.00016295909881591797 -0.00035595893859863281
		 1 -0.00026363134384155273 8.5651874542236328e-05 -0.00035595893859863281 1 -0.0002772212028503418
		 0 -0.00035595893859863281 1 -0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00019574165344238281 -0.00014221668243408203 -0.00070393085479736328 1 -0.00014215707778930664
		 -0.00019562244415283203 -0.00070393085479736328 1 -7.4744224548339844e-05 -0.00023007392883300781
		 -0.00070393085479736328 1 0 -0.00024187564849853516 -0.00070393085479736328 1 7.4744224548339844e-05
		 -0.00023007392883300781 -0.00070393085479736328 1 0.00014215707778930664 -0.00019562244415283203
		 -0.00070393085479736328 1 0.00019568204879760742 -0.00014221668243408203 -0.00070393085479736328
		 1 0.00023007392883300781 -7.4744224548339844e-05 -0.00070393085479736328 1 0.00024187564849853516
		 0 -0.00070393085479736328 1 0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 0.00019568204879760742 0.00014221668243408203 -0.00070393085479736328 1 0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 7.4744224548339844e-05 0.00023007392883300781
		 -0.00070393085479736328 1 7.2084560542862164e-12 0.00024187564849853516 -0.00070393085479736328
		 1 -7.4744224548339844e-05 0.00023001432418823242 -0.00070393085479736328 1 -0.00014209747314453125
		 0.00019574165344238281 -0.00070393085479736328 1 -0.00019568204879760742 0.00014209747314453125
		 -0.00070393085479736328 1 -0.00023007392883300781 7.4744224548339844e-05 -0.00070393085479736328
		 1 -0.00024187564849853516 0 -0.00070393085479736328 1 -1.1324882507324219e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 -9.5367431640625e-07 -6.5565109252929688e-07 -0.0010392910335212946
		 1 -7.152557373046875e-07 -9.5367431640625e-07 -0.0010392910335212946 1 -3.5762786865234375e-07
		 -1.1324882507324219e-06 -0.0010392910335212946 1 -4.9960036108132044e-16 -1.0728836059570312e-06
		 -0.0010392910335212946 1 3.5762786865234375e-07 -1.1324882507324219e-06 -0.0010392910335212946
		 1 7.152557373046875e-07 -8.9406967163085938e-07 -0.0010392910335212946 1 8.9406967163085938e-07
		 -6.5565109252929688e-07 -0.0010392910335212946 1 1.0728836059570312e-06 -3.5762786865234375e-07
		 -0.0010392910335212946 1 1.1920928955078125e-06 7.7715611723760958e-16 -0.0010392910335212946
		 1 1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 9.5367431640625e-07
		 6.5565109252929688e-07 -0.0010392910335212946 1 7.152557373046875e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 3.5762786865234375e-07 1.1324882507324219e-06 -0.0010392910335212946
		 1 3.5527136788005009e-14 1.1920928955078125e-06 -0.0010392910335212946 1 -3.5762786865234375e-07
		 1.0728836059570312e-06 -0.0010392910335212946 1 -6.5565109252929688e-07 9.5367431640625e-07
		 -0.0010392910335212946 1 -8.9406967163085938e-07 6.5565109252929688e-07 -0.0010392910335212946
		 1 -1.0728836059570312e-06 3.5762786865234375e-07 -0.0010392910335212946 1 -1.1920928955078125e-06
		 7.7715611723760958e-16 -0.0010392910335212946 1 0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 0.0003502964973449707 0.00025445222854614258 -0.0012683868408203125
		 1 0.00025445222854614258 0.00035023689270019531 -0.0012683868408203125 1 0.00013378262519836426
		 0.00041174888610839844 -0.0012683868408203125 1 2.2604140781368187e-13 0.00043290853500366211
		 -0.0012683868408203125 1 -0.00013378262519836426 0.00041174888610839844 -0.0012683868408203125
		 1 -0.00025451183319091797 0.00035023689270019531 -0.0012683868408203125 1 -0.00035023689270019531
		 0.00025451183319091797 -0.0012683868408203125 1 -0.00041174888610839844 0.00013378262519836426
		 -0.0012683868408203125 1 -0.00043290853500366211 -8.475442569988445e-13 -0.0012683868408203125
		 1 -0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 -0.0003502964973449707
		 -0.00025445222854614258 -0.0012683868408203125 1 -0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 -0.00013378262519836426 -0.00041174888610839844 -0.0012683868408203125
		 1 -1.2677858762799588e-11 -0.00043290853500366211 -0.0012683868408203125 1 0.00013375282287597656
		 -0.00041174888610839844 -0.0012683868408203125 1 0.00025451183319091797 -0.0003502964973449707
		 -0.0012683868408203125 1 0.00035023689270019531 -0.00025445222854614258 -0.0012683868408203125
		 1 0.00041174888610839844 -0.00013375282287597656 -0.0012683868408203125 1 0.00043290853500366211
		 -8.475442569988445e-13 -0.0012683868408203125 1 0.00097805261611938477 0.00031778216361999512
		 -0.0012948513031005859 1 0.00083196163177490234 0.00060445070266723633 -0.0012948513031005859
		 1 0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 0.00031778216361999512
		 0.00097805261611938477 -0.0012948513031005859 1 -1.3798961973066071e-12 0.0010283589363098145
		 -0.0012948513031005859 1 -0.00031778216361999512 0.00097805261611938477 -0.0012948513031005859
		 1 -0.00060445070266723633 0.00083196163177490234 -0.0012948513031005859 1 -0.00083196163177490234
		 0.00060445070266723633 -0.0012948513031005859 1 -0.00097799301147460938 0.00031778216361999512
		 -0.0012948513031005859 1 -0.0010282993316650391 1.3798961973066071e-12 -0.0012948513031005859
		 1 -0.00097799301147460938 -0.00031778216361999512 -0.0012948513031005859 1 -0.00083196163177490234
		 -0.00060445070266723633 -0.0012948513031005859 1 -0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 -0.00031778216361999512 -0.00097799301147460938 -0.0012948513031005859
		 1 -3.2027713814386516e-11 -0.0010283589363098145 -0.0012948513031005859 1 0.00031775236129760742
		 -0.00097799301147460938 -0.0012948513031005859 1 0.00060445070266723633 -0.00083196163177490234
		 -0.0012948513031005859 1 0.00083196163177490234 -0.00060445070266723633 -0.0012948513031005859
		 1 0.00097805261611938477 -0.00031778216361999512 -0.0012948513031005859 1 0.0010283589363098145
		 1.3798961973066071e-12 -0.0012948513031005859 1 0.0015241503715515137 0.00049524009227752686
		 -0.0011343955993652344 1 0.0012965500354766846 0.00094199180603027344 -0.0011343955993652344
		 1 0.00094199180603027344 0.0012965500354766846 -0.001134335994720459 1 0.00049524009227752686
		 0.0015241503715515137 -0.0011343955993652344 1 1.6341874879616121e-24 0.0016025900840759277
		 -0.0011343955993652344 1 -0.00049524009227752686 0.0015241503715515137 -0.0011343955993652344
		 1 -0.00094199180603027344 0.0012965500354766846 -0.0011343955993652344 1 -0.0012965798377990723
		 0.00094199180603027344 -0.001134335994720459 1 -0.0015242099761962891 0.00049524009227752686
		 -0.0011343955993652344 1 -0.0016026496887207031 0 -0.0011343955993652344 1 -0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 -0.0012965500354766846 -0.00094199180603027344
		 -0.0011343955993652344 1 -0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 -0.00049524009227752686 -0.0015241503715515137 -0.0011343955993652344 1 -4.7762682697793934e-11
		 -0.0016025900840759277 -0.0011343955993652344 1 0.00049524009227752686 -0.0015241503715515137
		 -0.0011343955993652344 1 0.00094199180603027344 -0.0012965500354766846 -0.0011343955993652344
		 1 0.0012965798377990723 -0.00094199180603027344 -0.0011343955993652344 1 0.0015242099761962891
		 -0.00049524009227752686 -0.0011343955993652344 1 0.0016026496887207031 0 -0.0011343955993652344
		 1 0.0018613338470458984 0.00060479342937469482 0.0081895589828491211 1 0.0015833377838134766
		 0.0011503696441650391 0.0081894993782043457 1 0.0011503696441650391 0.0015833377838134766
		 0.0081895589828491211 1 0.00060477852821350098 0.0018613338470458984 0.0081895589828491211
		 1 4.5126569148123963e-11 0.0019571185111999512 0.0081895589828491211 1 -0.00060477852821350098
		 0.0018613338470458984 0.0081895589828491211 1 -0.0011503696441650391 0.0015833377838134766
		 0.0081895589828491211 1 -0.0015833377838134766 0.0011503696441650391 0.0081895589828491211
		 1 -0.0018613338470458984 0.00060477852821350098 0.0081895589828491211 1 -0.0019571185111999512
		 0 0.0081894993782043457 1 -0.0018613338470458984 -0.00060477852821350098 0.0081894993782043457
		 1 -0.0015833377838134766 -0.0011503696441650391 0.0081894993782043457 1 -0.0011503696441650391
		 -0.0015833377838134766 0.0081894993782043457 1 -0.00060477852821350098 -0.0018613338470458984
		 0.0081894993782043457 1 -1.3199885628978336e-11 -0.0019571185111999512 0.0081894993782043457
		 1 0.00060479342937469482 -0.0018613338470458984 0.0081894993782043457 1 0.0011503696441650391
		 -0.0015833377838134766 0.0081894993782043457 1 0.0015833377838134766 -0.0011503845453262329
		 0.0081894993782043457 1 0.0018613338470458984 -0.00060477852821350098 0.0081894993782043457
		 1 0.0019571185111999512 0 0.0081894993782043457 1 0.0017341673374176025 0.00056345760822296143
		 0.036474108695983887 1 0.0014751553535461426 0.0010717809200286865 0.036474108695983887
		 1 0.0010717660188674927 0.0014751553535461426 0.036474108695983887 1 0.00056345760822296143
		 0.0017341375350952148 0.036474108695983887 1 3.2229330315658444e-11 0.0018233954906463623
		 0.036474108695983887 1 -0.00056345760822296143 0.0017341375350952148 0.036474108695983887
		 1 -0.0010717660188674927 0.0014751553535461426 0.036474108695983887 1 -0.0014751553535461426
		 0.0010717809200286865 0.036474108695983887 1 -0.0017341673374176025 0.00056346505880355835
		 0.036474108695983887 1 -0.00182342529296875 0 0.036474108695983887 1 -0.0017341673374176025
		 -0.00056346505880355835 0.036474108695983887 1 -0.0014751553535461426 -0.0010717660188674927
		 0.036474108695983887 1 -0.0010717511177062988 -0.0014751553535461426 0.036474108695983887
		 1 -0.00056345760822296143 -0.0017341375350952148 0.036474108695983887 1 -2.2112089936854318e-11
		 -0.0018233656883239746 0.036474108695983887 1 0.00056345760822296143 -0.0017341375350952148
		 0.036474108695983887 1 0.0010717511177062988 -0.0014751553535461426 0.036474108695983887
		 1 0.0014751553535461426 -0.0010717660188674927 0.036474108695983887 1 0.0017341375350952148
		 -0.00056346505880355835 0.036474108695983887 1 0.00182342529296875 0 0.036474108695983887
		 1 0.0013436079025268555 0.00043655931949615479 0.10198169946670532 1 0.0011429339647293091
		 0.00083039700984954834 0.10198163986206055 1 0.00083038210868835449 0.0011429339647293091
		 0.10198169946670532 1 0.00043656677007675171 0.0013436079025268555 0.10198169946670532
		 1 -7.3742123518627523e-12 0.0014127492904663086 0.10198163986206055 1 -0.00043656677007675171
		 0.0013436079025268555 0.10198163986206055 1 -0.00083038210868835449 0.0011429339647293091
		 0.10198169946670532 1 -0.0011429339647293091 0.00083039700984954834 0.10198163986206055
		 1 -0.0013436079025268555 0.00043655931949615479 0.10198163986206055 1 -0.0014127492904663086
		 0 0.10198169946670532 1 -0.0013436079025268555 -0.00043655931949615479 0.10198169946670532
		 1 -0.0011429339647293091 -0.00083039700984954834 0.10198163986206055 1 -0.00083038210868835449
		 -0.0011429488658905029 0.10198169946670532 1 -0.00043655931949615479 -0.0013436079025268555
		 0.10198163986206055 1 -4.9477755226234876e-11 -0.0014127492904663086 0.10198169946670532
		 1 0.00043656677007675171 -0.0013436079025268555 0.10198169946670532 1 0.00083038210868835449
		 -0.0011429488658905029 0.10198169946670532 1 0.0011429339647293091 -0.00083039700984954834
		 0.10198169946670532 1 0.0013436079025268555 -0.00043655931949615479 0.10198169946670532
		 1 0.0014127492904663086 0 0.10198169946670532 1 0.00090274214744567871 0.00029331445693969727
		 0.15738457441329956 1 0.00076790153980255127 0.00055792182683944702 0.15738451480865479
		 1 0.00055790692567825317 0.00076791644096374512 0.15738457441329956 1 0.00029331445693969727
		 0.00090274214744567871 0.15738457441329956 1 -5.2080117995956243e-11 0.00094918906688690186
		 0.15738457441329956 1 -0.00029331445693969727 0.00090272724628448486 0.15738457441329956
		 1 -0.00055792182683944702 0.00076791644096374512 0.15738457441329956 1 -0.00076790153980255127
		 0.00055792182683944702 0.15738451480865479 1 -0.00090274214744567871 0.00029331445693969727
		 0.15738457441329956 1 -0.0009492039680480957 0 0.15738457441329956 1 -0.00090274214744567871
		 -0.00029331445693969727 0.15738451480865479 1 -0.00076790153980255127 -0.00055792182683944702
		 0.15738457441329956 1 -0.00055792182683944702 -0.00076791644096374512 0.15738457441329956
		 1 -0.00029331445693969727 -0.00090272724628448486 0.15738457441329956 1 -8.0367712484985532e-11
		 -0.00094918906688690186 0.15738457441329956 1 0.00029331445693969727 -0.00090272724628448486
		 0.15738457441329956 1 0.0005579143762588501 -0.00076791644096374512 0.15738457441329956
		 1 0.00076790153980255127 -0.00055792182683944702 0.15738451480865479 1 0.00090272724628448486
		 -0.00029331445693969727 0.15738451480865479 1 0.00094917416572570801 0 0.15738457441329956
		 1 0.00082939863204956055 0.00026949122548103333 0.15944874286651611 1 0.00070554018020629883
		 0.0005126073956489563 0.15944874286651611 1 0.0005126073956489563 0.00070554018020629883
		 0.15944874286651611 1 0.00026949122548103333 0.00082942843437194824 0.15944874286651611
		 1 -5.9515059547265992e-11 0.00087210536003112793 0.15944874286651611 1 -0.00026949122548103333
		 0.00082941353321075439 0.15944874286651611 1 -0.00051259994506835938 0.00070554018020629883
		 0.15944874286651611 1 -0.00070554018020629883 0.0005126073956489563 0.15944874286651611
		 1 -0.00082941353321075439 0.00026949122548103333 0.15944874286651611 1 -0.00087210536003112793
		 0 0.15944874286651611 1 -0.00082941353321075439 -0.00026949495077133179 0.15944874286651611
		 1 -0.00070554018020629883 -0.0005126073956489563 0.15944874286651611 1 -0.00051259994506835938
		 -0.00070554018020629883 0.15944874286651611 1 -0.00026949495077133179 -0.00082941353321075439
		 0.15944874286651611 1 -8.5504936464531056e-11 -0.00087210536003112793 0.15944874286651611
		 1 0.00026949122548103333 -0.00082941353321075439 0.15944874286651611 1 0.00051259994506835938
		 -0.00070554018020629883 0.15944874286651611 1 0.00070554018020629883 -0.0005126073956489563
		 0.15944874286651611 1 0.00082941353321075439 -0.00026949495077133179 0.15944874286651611
		 1 0.00087210536003112793 0 0.15944874286651611 1 0.00082939863204956055 0.00026949122548103333
		 0.15931618213653564 1 0.00070554018020629883 0.0005126073956489563 0.15931618213653564
		 1 0.0005126073956489563 0.00070554018020629883 0.15931618213653564 1 0.00026949122548103333
		 0.00082942843437194824 0.15931618213653564 1 -5.9515059547265992e-11 0.00087210536003112793
		 0.15931618213653564 1 -0.00026949122548103333 0.00082941353321075439 0.15931618213653564
		 1 -0.00051259994506835938 0.00070554018020629883 0.15931618213653564 1 -0.00070554018020629883
		 0.0005126073956489563 0.15931618213653564 1 -0.00082941353321075439 0.00026949122548103333
		 0.15931618213653564 1 -0.00087210536003112793 0 0.15931618213653564 1 -0.00082941353321075439
		 -0.00026949495077133179 0.15931618213653564 1 -0.00070554018020629883 -0.0005126073956489563
		 0.15931618213653564 1 -0.00051259994506835938 -0.00070554018020629883 0.15931618213653564
		 1 -0.00026949495077133179 -0.00082941353321075439 0.15931618213653564 1 -8.5504936464531056e-11
		 -0.00087210536003112793 0.15931618213653564 1 0.00026949122548103333 -0.00082941353321075439
		 0.15931618213653564 1 0.00051259994506835938 -0.00070554018020629883 0.15931618213653564
		 1 0.00070554018020629883 -0.0005126073956489563 0.15931618213653564 1 0.00082941353321075439
		 -0.00026949495077133179 0.15931618213653564 1 0.00087210536003112793 0 0.15931618213653564
		 1 0.00091317296028137207 0.00029670447111129761 0.1576697826385498 1 0.00077679753303527832
		 0.00056437402963638306 0.1576697826385498 1 0.00056438148021697998 0.00077678263187408447
		 0.1576697826385498 1 0.00029671192169189453 0.00091317296028137207 0.1576697826385498
		 1 -5.1022297498093394e-11 0.00096017122268676758 0.1576697826385498 1 -0.00029670447111129761
		 0.00091317296028137207 0.1576697826385498 1 -0.00056438148021697998 0.00077678263187408447
		 0.1576697826385498 1 -0.00077678263187408447 0.00056437402963638306 0.1576697826385498
		 1 -0.00091317296028137207 0.00029670447111129761 0.1576697826385498 1 -0.00096017122268676758
		 0 0.1576697826385498 1 -0.00091317296028137207 -0.00029671192169189453 0.1576697826385498
		 1 -0.00077678263187408447 -0.00056437402963638306 0.1576697826385498 1 -0.00056438148021697998
		 -0.00077678263187408447 0.1576697826385498 1 -0.00029670447111129761 -0.00091317296028137207
		 0.1576697826385498 1 -7.9635853467152629e-11 -0.00096017122268676758 0.1576697826385498
		 1 0.00029671192169189453 -0.00091317296028137207 0.1576697826385498 1 0.00056438148021697998
		 -0.00077678263187408447 0.1576697826385498 1 0.00077679753303527832 -0.00056437402963638306
		 0.1576697826385498 1 0.00091317296028137207 -0.00029671192169189453 0.1576697826385498
		 1 0.00096017122268676758 0 0.1576697826385498 1 0.001329958438873291 0.00043212622404098511
		 0.10658526420593262 1 0.0011313557624816895 0.00082196295261383057 0.10658526420593262
		 1 0.00082196295261383057 0.0011313259601593018 0.10658526420593262 1 0.00043213367462158203
		 0.001329958438873291 0.10658526420593262 1 -8.7574392182432348e-12 0.0013983845710754395
		 0.10658532381057739 1 -0.00043212622404098511 0.001329958438873291 0.10658532381057739
		 1 -0.00082197785377502441 0.0011313259601593018 0.10658526420593262 1 -0.0011313259601593018
		 0.00082196295261383057 0.10658526420593262 1 -0.001329958438873291 0.00043212622404098511
		 0.10658526420593262 1 -0.0013984143733978271 0 0.10658532381057739 1 -0.001329958438873291
		 -0.00043212622404098511 0.10658526420593262 1 -0.0011313259601593018 -0.00082197785377502441
		 0.10658532381057739 1 -0.00082197785377502441 -0.0011313259601593018 0.10658532381057739
		 1 -0.00043213367462158203 -0.001329958438873291 0.10658526420593262 1 -5.0431658848992811e-11
		 -0.0013983845710754395 0.10658532381057739 1 0.00043213367462158203 -0.001329958438873291
		 0.10658526420593262 1 0.00082197785377502441 -0.0011313259601593018 0.10658532381057739
		 1 0.0011313259601593018 -0.00082197785377502441 0.10658532381057739 1 0.001329958438873291
		 -0.00043212622404098511 0.10658526420593262 1 0.0013984143733978271 0 0.10658532381057739
		 1 0.00062489509582519531 0.0019231736660003662 0.0015242695808410645 1 0.0011886060237884521
		 0.0016359686851501465 0.0015242099761962891 1 0.0016359388828277588 0.0011885762214660645
		 0.0015242099761962891 1 0.0019232034683227539 0.00062488019466400146 0.0015242695808410645
		 1 0.0020221471786499023 0 0.0015242695808410645 1 0.0019231438636779785 -0.00062488019466400146
		 0.0015242695808410645 1 0.0016359388828277588 -0.0011885762214660645 0.0015242695808410645
		 1 0.0011886060237884521 -0.0016359388828277588 0.0015242695808410645 1 0.00062486529350280762
		 -0.0019231736660003662 0.0015242695808410645 1 -2.7856383866264878e-11 -0.0020221471786499023
		 0.0015242695808410645 1 -0.00062486529350280762 -0.0019231736660003662 0.0015242695808410645
		 1 -0.0011886060237884521 -0.0016359388828277588 0.0015242695808410645 1 -0.0016359686851501465
		 -0.0011885762214660645 0.0015242695808410645 1 -0.0019232034683227539 -0.00062488019466400146
		 0.0015242695808410645 1 -0.0020221471786499023 0 0.0015242695808410645 1 -0.0019232034683227539
		 0.00062489509582519531 0.0015242695808410645 1 -0.0016359388828277588 0.0011885762214660645
		 0.0015242695808410645 1 -0.0011886060237884521 0.0016359686851501465 0.0015242695808410645
		 1 -0.00062486529350280762 0.0019231736660003662 0.0015242695808410645 1 3.240829826722802e-11
		 0.0020221471786499023 0.0015242695808410645 1 ;
	setAttr ".it[0].itg[2].iti[6000].ict" -type "componentList" 2 "vtx[20:179]" "vtx[181:340]";
	setAttr ".sn" yes;
	setAttr ".mlid" 5;
	setAttr ".mlpr" 0;
	setAttr -s 3 ".pndr[0:2]"  0 0 0;
	setAttr ".tgdt[0].cid" -type "Int32Array" 3 0 1 2 ;
	setAttr ".aal" -type "attributeAlias" {"eyeball1","weight[0]","eyeball2","weight[1]"
		,"eyeball_deep_bs","weight[2]"} ;
createNode objectSet -n "blendShape1Set1";
	rename -uid "1D7BCD29-4C4B-8261-7B68-C5B1FD9C3C40";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "blendShape1GroupId1";
	rename -uid "EFB9EF8E-4B36-5920-1CC7-8B9BBD40AA25";
	setAttr ".ihi" 0;
createNode groupParts -n "blendShape1GroupParts1";
	rename -uid "516FF936-4A8C-A37D-1754-E1A7F9FFD5D3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode multDoubleLinear -n "multDoubleLinear30";
	rename -uid "2C693908-41C1-FAB4-FC13-FBA5D4C50052";
	setAttr ".i2" -1;
createNode clamp -n "clamp7";
	rename -uid "D246D393-4E1F-A27D-1011-F8BAB9F9376E";
	setAttr ".mn" -type "float3" 0 -1 0 ;
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode addDoubleLinear -n "addDoubleLinear18";
	rename -uid "105A6BF0-459C-5A0E-B9A6-F692F23C4ED7";
	setAttr ".ihi" 2;
	setAttr ".i2" 10;
createNode multDoubleLinear -n "multDoubleLinear31";
	rename -uid "87345350-4072-1FCC-0BA8-4E8F880ECACF";
	setAttr ".i2" -1;
createNode clamp -n "clamp8";
	rename -uid "3D31734A-458C-0F06-8860-CB9679FCE176";
	setAttr ".mn" -type "float3" 0.95700002 0 0 ;
	setAttr ".mx" -type "float3" 2 0 0 ;
createNode addDoubleLinear -n "addDoubleLinear20";
	rename -uid "B3B94486-404E-3FAF-1537-158C23295F71";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear22";
	rename -uid "185B7D32-4487-5835-39F7-7F9E696E1490";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear23";
	rename -uid "D19A1AFF-48FE-B6A3-D72D-0FA08B6E2657";
	setAttr ".ihi" 2;
	setAttr ".i2" -2;
createNode addDoubleLinear -n "addDoubleLinear24";
	rename -uid "5934E1E0-48B8-7B92-9A6F-57B7D56F0C89";
	setAttr ".ihi" 2;
createNode multMatrix -n "multMatrix26";
	rename -uid "E19A58B1-456B-0268-D456-F4AF8CB08070";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix79";
	rename -uid "DAF03B47-4BFD-D77C-45FA-C7B9301B14CE";
createNode composeMatrix -n "composeMatrix4";
	rename -uid "B7FE281A-4BC3-D0BB-3D62-AAB4D0F19D14";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode blendTwoAttr -n "blendTwoAttr1";
	rename -uid "FEFE1B0C-48C8-6CCF-2AAB-A9B1BBC1AC13";
	setAttr -s 2 ".i";
	setAttr -s 2 ".i";
createNode blendTwoAttr -n "blendTwoAttr2";
	rename -uid "16DF8A08-4670-6E35-FAC8-FB843F3806EB";
	setAttr -s 2 ".i";
	setAttr -s 2 ".i";
createNode blinn -n "eyeball_mat";
	rename -uid "4A4AC577-47A4-2AD3-89EA-5BAC1BB4421D";
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 0.51111114025115967;
	setAttr ".ec" 0.25775200128555298;
	setAttr ".sro" 0.72444444894790649;
createNode shadingEngine -n "blinn1SG";
	rename -uid "CF4CE1FB-4284-E6ED-A3CA-9CA7CA3A19BA";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "E1A4900A-4D0E-2EA1-CA11-D8A0273746BA";
createNode ramp -n "ramp1";
	rename -uid "39808B33-40C2-46E9-19C8-A8A12D21B3A9";
	setAttr -s 2 ".cel";
	setAttr ".cel[2].ep" 0.84530389308929443;
	setAttr ".cel[2].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[3].ep" 0.85161799192428589;
	setAttr ".cel[3].ec" -type "float3" 0.44299999 0.23756185 0.104105 ;
createNode place2dTexture -n "place2dTexture1";
	rename -uid "1E86F1B3-4FB4-9B11-D1D1-EBA7C830465B";
createNode blinn -n "glass_mat";
	rename -uid "7954F42D-42E3-7A87-07F9-F089F19B90E7";
	setAttr ".c" -type "float3" 0.47555557 0.47555557 0.47555557 ;
createNode shadingEngine -n "blinn2SG";
	rename -uid "0435C60E-484B-0529-EE9E-B690D6768B1F";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "BB1562B6-4D5D-9910-2C6B-47A400D887E6";
createNode lambert -n "black_mat";
	rename -uid "C8628160-4252-DB08-95F6-A3A5C74AAAEC";
	setAttr ".c" -type "float3" 0 0 0 ;
createNode shadingEngine -n "lambert2SG";
	rename -uid "21981DF8-4FC2-A7B7-C711-9AB8D7333A74";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "3BFEB483-4034-5C7B-F248-CD884F9AE4DD";
createNode blendShape -n "blendShape4";
	rename -uid "A27CA70B-469D-9D40-0196-EEAC6363B690";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".tc" no;
	setAttr -s 3 ".w";
	setAttr -s 3 ".w";
	setAttr -s 3 ".it[0].itg";
	setAttr ".it[0].itg[0].iti[6000].ipt" -type "pointArray" 100 0.21484279632568359
		 0.069798067212104797 0.06671440601348877 1 0.22589915990829468 4.8618021537549794e-06
		 0.06671440601348877 1 0.21484279632568359 -0.069788470864295959 0.06671440601348877
		 1 0.18275567889213562 -0.13274994492530823 0.06671440601348877 1 0.13278022408485413
		 -0.18271566927433014 0.06671440601348877 1 0.069806419312953949 -0.21479734778404236
		 0.06671440601348877 1 1.2661581903246474e-15 -0.22585180401802063 0.06671440601348877
		 1 -0.069806419312953949 -0.21479734778404236 0.06671440601348877 1 -0.13278022408485413
		 -0.18271566927433014 0.06671440601348877 1 -0.18275567889213562 -0.13274994492530823
		 0.06671440601348877 1 -0.21484279632568359 -0.069788470864295959 0.06671440601348877
		 1 -0.22589915990829468 4.8618021537549794e-06 0.06671440601348877 1 -0.21484279632568359
		 0.069798067212104797 0.06671440601348877 1 -0.18275567889213562 0.13275954127311707
		 0.06671440601348877 1 -0.13278022408485413 0.18272680044174194 0.06671440601348877
		 1 -0.069806419312953949 0.21480602025985718 0.06671440601348877 1 1.2661581903246474e-15
		 0.22586140036582947 0.06671440601348877 1 0.069806419312953949 0.21480602025985718
		 0.06671440601348877 1 0.13278022408485413 0.18272680044174194 0.06671440601348877
		 1 0.18275567889213562 0.13275954127311707 0.06671440601348877 1 0.13546092808246613
		 0.044010575860738754 0.093494176864624023 1 0.14243267476558685 4.861809657086269e-06
		 0.093494176864624023 1 0.13546092808246613 -0.044000960886478424 0.093494176864624023
		 1 0.11523086577653885 -0.083699263632297516 0.093494176864624023 1 0.083720214664936066
		 -0.11520412564277649 0.093494176864624023 1 0.044014222919940948 -0.13543145358562469
		 0.093494176864624023 1 1.2661581903246474e-15 -0.14240080118179321 0.093494176864624023
		 1 -0.044014222919940948 -0.13543145358562469 0.093494176864624023 1 -0.083720214664936066
		 -0.11520412564277649 0.093494176864624023 1 -0.11523086577653885 -0.083699263632297516
		 0.093494176864624023 1 -0.13546092808246613 -0.044000960886478424 0.093494176864624023
		 1 -0.14243267476558685 4.861809657086269e-06 0.093494176864624023 1 -0.13546092808246613
		 0.044010575860738754 0.093494176864624023 1 -0.11523086577653885 0.083709046244621277
		 0.093494176864624023 1 -0.083720214664936066 0.11521389335393906 0.093494176864624023
		 1 -0.044014222919940948 0.13544109463691711 0.093494176864624023 1 1.2661581903246474e-15
		 0.14241030812263489 0.093494176864624023 1 0.044014222919940948 0.13544109463691711
		 0.093494176864624023 1 0.083720214664936066 0.11521389335393906 0.093494176864624023
		 1 0.11523086577653885 0.083709046244621277 0.093494176864624023 1 0.068323776125907898
		 0.022200383245944977 0.10204821825027466 1 0.071840107440948486 4.8618019263813039e-06
		 0.10204821825027466 1 0.068323776125907898 -0.022190716117620468 0.10204821825027466
		 1 0.058119777590036392 -0.042213685810565948 0.10204821825027466 1 0.042226485908031464
		 -0.058103714138269424 0.10204821825027466 1 0.022199748083949089 -0.068306080996990204
		 0.10204821825027466 1 1.2661581903246474e-15 -0.071821659803390503 0.10204821825027466
		 1 -0.022199748083949089 -0.068306080996990204 0.10204821825027466 1 -0.042226485908031464
		 -0.058103714138269424 0.10204821825027466 1 -0.058119777590036392 -0.042213685810565948
		 0.10204821825027466 1 -0.068323776125907898 -0.022190716117620468 0.10204821825027466
		 1 -0.071840107440948486 4.8618019263813039e-06 0.10204821825027466 1 -0.068323776125907898
		 0.022200383245944977 0.10204821825027466 1 -0.058119777590036392 0.042223408818244934
		 0.10204821825027466 1 -0.042226485908031464 0.05811367928981781 0.10204821825027466
		 1 -0.022199748083949089 0.068315625190734863 0.10204821825027466 1 1.2661581903246474e-15
		 0.071831032633781433 0.10204821825027466 1 0.022199748083949089 0.068315625190734863
		 0.10204821825027466 1 0.042226485908031464 0.05811367928981781 0.10204821825027466
		 1 0.058119777590036392 0.042223408818244934 0.10204821825027466 1 0.022755896672606468
		 0.0073973014950752258 0.10515820980072021 1 0.023927036672830582 4.8618071559758391e-06
		 0.10515820980072021 1 0.022755896672606468 -0.0073875673115253448 0.10515820980072021
		 1 0.019357359036803246 -0.014056443236768246 0.10515820980072021 1 0.01406387984752655
		 -0.019348809495568275 0.10515820980072021 1 0.0073938500136137009 -0.022746847942471504
		 0.10515820980072021 1 1.2661581903246474e-15 -0.02391752228140831 0.10515820980072021
		 1 -0.0073938500136137009 -0.022746847942471504 0.10515820980072021 1 -0.01406387984752655
		 -0.019348809495568275 0.10515820980072021 1 -0.019357359036803246 -0.014056443236768246
		 0.10515820980072021 1 -0.022755896672606468 -0.0073875673115253448 0.10515820980072021
		 1 -0.023927036672830582 4.8618071559758391e-06 0.10515820980072021 1 -0.022755896672606468
		 0.0073973014950752258 0.10515820980072021 1 -0.019357359036803246 0.014066169038414955
		 0.10515820980072021 1 -0.01406387984752655 0.019358614459633827 0.10515820980072021
		 1 -0.0073938500136137009 0.022756593301892281 0.10515820980072021 1 1.2661581903246474e-15
		 0.023927317932248116 0.10515820980072021 1 0.0073938500136137009 0.022756593301892281
		 0.10515820980072021 1 0.01406387984752655 0.019358614459633827 0.10515820980072021
		 1 0.019357359036803246 0.014066169038414955 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 ;
	setAttr ".it[0].itg[0].iti[6000].ict" -type "componentList" 1 "vtx[0:99]";
	setAttr ".it[0].itg[1].iti[6000].ipt" -type "pointArray" 100 -0.17606735229492188
		 -0.057191964238882065 0.016353845596313477 1 -0.185128353536129 4.7355188144138083e-06
		 0.016353845596313477 1 -0.17606735229492188 0.057201672345399857 0.016353845596313477
		 1 -0.14977128803730011 0.10879956930875778 0.016353845596313477 1 -0.1088155135512352
		 0.14974745362997055 0.016353845596313477 1 -0.057207629084587097 0.17603893578052521
		 0.016353845596313477 1 -3.3284689057949766e-16 0.18509768694639206 0.016353845596313477
		 1 0.057207629084587097 0.17603893578052521 0.016353845596313477 1 0.1088155135512352
		 0.14974745362997055 0.016353845596313477 1 0.14977128803730011 0.10879956930875778
		 0.016353845596313477 1 0.17606735229492188 0.057201672345399857 0.016353845596313477
		 1 0.185128353536129 4.7355188144138083e-06 0.016353845596313477 1 0.17606735229492188
		 -0.057191964238882065 0.016353845596313477 1 0.14977128803730011 -0.10878972709178925
		 0.016353845596313477 1 0.1088155135512352 -0.14973843097686768 0.016353845596313477
		 1 0.057207629084587097 -0.17602913081645966 0.016353845596313477 1 -3.3284689057949766e-16
		 -0.18508809059858322 0.016353845596313477 1 -0.057207629084587097 -0.17602913081645966
		 0.016353845596313477 1 -0.1088155135512352 -0.14973843097686768 0.016353845596313477
		 1 -0.14977128803730011 -0.10878972709178925 0.016353845596313477 1 -0.11101267486810684
		 -0.036058682948350906 -0.0055931806564331055 1 -0.11672621220350266 4.7355426886497298e-06
		 -0.0055931806564331055 1 -0.11101267486810684 0.036068260669708252 -0.0055931806564331055
		 1 -0.094433635473251343 0.068601660430431366 -0.0055931806564331055 1 -0.06861022487282753
		 0.09442003071308136 -0.0055931806564331055 1 -0.036070404574275017 0.11099698394536972
		 -0.0055931806564331055 1 -3.3284689057949766e-16 0.11670879274606705 -0.0055931806564331055
		 1 0.036070404574275017 0.11099698394536972 -0.0055931806564331055 1 0.06861022487282753
		 0.09442003071308136 -0.0055931806564331055 1 0.094433635473251343 0.068601660430431366
		 -0.0055931806564331055 1 0.11101267486810684 0.036068260669708252 -0.0055931806564331055
		 1 0.11672621220350266 4.7355426886497298e-06 -0.0055931806564331055 1 0.11101267486810684
		 -0.036058682948350906 -0.0055931806564331055 1 0.094433635473251343 -0.0685921311378479
		 -0.0055931806564331055 1 0.06861022487282753 -0.094410859048366547 -0.0055931806564331055
		 1 0.036070404574275017 -0.1109873428940773 -0.0055931806564331055 1 -3.3284689057949766e-16
		 -0.1166989877820015 -0.0055931806564331055 1 -0.036070404574275017 -0.1109873428940773
		 -0.0055931806564331055 1 -0.06861022487282753 -0.094410859048366547 -0.0055931806564331055
		 1 -0.094433635473251343 -0.0685921311378479 -0.0055931806564331055 1 -0.055992539972066879
		 -0.018184895627200603 -0.012604117393493652 1 -0.058874074369668961 4.7355185870401328e-06
		 -0.012604117393493652 1 -0.055992539972066879 0.018194390460848808 -0.012604117393493652
		 1 -0.047630187124013901 0.034603497013449669 -0.012604117393493652 1 -0.034605307504534721
		 0.047625858336687088 -0.012604117393493652 1 -0.018193078227341175 0.055986829102039337
		 -0.012604117393493652 1 -3.3284689057949766e-16 0.058867711573839188 -0.012604117393493652
		 1 0.018193078227341175 0.055986829102039337 -0.012604117393493652 1 0.034605307504534721
		 0.047625858336687088 -0.012604117393493652 1 0.047630187124013901 0.034603497013449669
		 -0.012604117393493652 1 0.055992539972066879 0.018194390460848808 -0.012604117393493652
		 1 0.058874074369668961 4.7355185870401328e-06 -0.012604117393493652 1 0.055992539972066879
		 -0.018184895627200603 -0.012604117393493652 1 0.047630187124013901 -0.034594001248478889
		 -0.012604117393493652 1 0.034605307504534721 -0.047616425901651382 -0.012604117393493652
		 1 0.018193078227341175 -0.055977270007133484 -0.012604117393493652 1 -3.3284689057949766e-16
		 -0.05885794386267662 -0.012604117393493652 1 -0.018193078227341175 -0.055977270007133484
		 -0.012604117393493652 1 -0.034605307504534721 -0.047616425901651382 -0.012604117393493652
		 1 -0.047630187124013901 -0.034594001248478889 -0.012604117393493652 1 -0.01864883117377758
		 -0.0060534970834851265 -0.015153646469116211 1 -0.019608631730079651 4.7355165406770539e-06
		 -0.015153646469116211 1 -0.01864883117377758 0.0060629686340689659 -0.015153646469116211
		 1 -0.015863687731325626 0.011528210248798132 -0.015153646469116211 1 -0.011525619309395552
		 0.015865394845604897 -0.015153646469116211 1 -0.0060593839734792709 0.018650127574801445
		 -0.015153646469116211 1 -3.3284689057949766e-16 0.019609556533396244 -0.015153646469116211
		 1 0.0060593839734792709 0.018650127574801445 -0.015153646469116211 1 0.011525619309395552
		 0.015865394845604897 -0.015153646469116211 1 0.015863687731325626 0.011528210248798132
		 -0.015153646469116211 1 0.01864883117377758 0.0060629686340689659 -0.015153646469116211
		 1 0.019608631730079651 4.7355165406770539e-06 -0.015153646469116211 1 0.01864883117377758
		 -0.0060534970834851265 -0.015153646469116211 1 0.015863687731325626 -0.011518727988004684
		 -0.015153646469116211 1 0.011525619309395552 -0.015855961479246616 -0.015153646469116211
		 1 0.0060593839734792709 -0.018640655092895031 -0.015153646469116211 1 -3.3284689057949766e-16
		 -0.019600122235715389 -0.015153646469116211 1 -0.0060593839734792709 -0.018640655092895031
		 -0.015153646469116211 1 -0.011525619309395552 -0.015855961479246616 -0.015153646469116211
		 1 -0.015863687731325626 -0.011518727988004684 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 ;
	setAttr ".it[0].itg[1].iti[6000].ict" -type "componentList" 1 "vtx[0:99]";
	setAttr ".it[0].itg[2].iti[6000].ipt" -type "pointArray" 100 -0.0016004890203475952
		 -0.00051951408386230469 0.18096303939819336 1 -0.0016831159591674805 1.2651776160055306e-07
		 0.18096303939819336 1 -0.0016004890203475952 0.00052007287740707397 0.18096303939819336
		 1 -0.0013607442378997803 0.00098884105682373047 0.18096303939819336 1 -0.00098906457424163818
		 0.0013604611158370972 0.18096309900283813 1 -0.0005199238657951355 0.0016004592180252075
		 0.18096303939819336 1 2.818668362204583e-16 0.0016823858022689819 0.18096303939819336
		 1 0.0005199238657951355 0.0016004592180252075 0.18096303939819336 1 0.00098906457424163818
		 0.0013604611158370972 0.18096309900283813 1 0.0013607442378997803 0.00098884105682373047
		 0.18096303939819336 1 0.0016004890203475952 0.00052007287740707397 0.18096303939819336
		 1 0.0016831159591674805 1.2651776160055306e-07 0.18096303939819336 1 0.0016004890203475952
		 -0.00051951408386230469 0.18096303939819336 1 0.0013607442378997803 -0.00098817050457000732
		 0.18096303939819336 1 0.00098906457424163818 -0.0013606846332550049 0.18096303939819336
		 1 0.0005199238657951355 -0.0015998333692550659 0.18096303939819336 1 2.818668362204583e-16
		 -0.001681983470916748 0.18096303939819336 1 -0.0005199238657951355 -0.0015998333692550659
		 0.18096303939819336 1 -0.00098906457424163818 -0.0013606846332550049 0.18096303939819336
		 1 -0.0013607442378997803 -0.00098817050457000732 0.18096303939819336 1 -0.0010084062814712524
		 -0.00032747909426689148 0.18076527118682861 1 -0.0010609179735183716 1.2652685654757079e-07
		 0.18076527118682861 1 -0.0010084062814712524 0.00032785162329673767 0.18076527118682861
		 1 -0.00085852295160293579 0.00062356144189834595 0.18076527118682861 1 -0.00062394142150878906
		 0.00085794925689697266 0.18076527118682861 1 -0.00032788515090942383 0.0010089725255966187
		 0.18076527118682861 1 2.818668362204583e-16 0.0010607242584228516 0.18076527118682861
		 1 0.00032788515090942383 0.0010089725255966187 0.18076527118682861 1 0.00062394142150878906
		 0.00085794925689697266 0.18076527118682861 1 0.00085852295160293579 0.00062356144189834595
		 0.18076527118682861 1 0.0010084062814712524 0.00032785162329673767 0.18076527118682861
		 1 0.0010609179735183716 1.2652685654757079e-07 0.18076527118682861 1 0.0010084062814712524
		 -0.00032747909426689148 0.18076527118682861 1 0.00085852295160293579 -0.00062322616577148438
		 0.18076527118682861 1 0.00062394142150878906 -0.00085797905921936035 0.18076527118682861
		 1 0.00032788515090942383 -0.0010085254907608032 0.18076527118682861 1 2.818668362204583e-16
		 -0.00106009840965271 0.18076527118682861 1 -0.00032788515090942383 -0.0010085254907608032
		 0.18076527118682861 1 -0.00062394142150878906 -0.00085797905921936035 0.18076527118682861
		 1 -0.00085852295160293579 -0.00062322616577148438 0.18076527118682861 1 -0.00050890445709228516
		 -0.00016518309712409973 0.18069946765899658 1 -0.00053511559963226318 1.2651935321628116e-07
		 0.18069946765899658 1 -0.00050890445709228516 0.00016545504331588745 0.18069946765899658
		 1 -0.0004329681396484375 0.00031457841396331787 0.18069946765899658 1 -0.00031451880931854248
		 0.00043294951319694519 0.18069946765899658 1 -0.00016535073518753052 0.00050905346870422363
		 0.18069946765899658 1 2.818668362204583e-16 0.0005351528525352478 0.18069946765899658
		 1 0.00016535073518753052 0.00050905346870422363 0.18069946765899658 1 0.00031451880931854248
		 0.00043294951319694519 0.18069946765899658 1 0.0004329681396484375 0.00031457841396331787
		 0.18069946765899658 1 0.00050890445709228516 0.00016545504331588745 0.18069946765899658
		 1 0.00053511559963226318 1.2651935321628116e-07 0.18069946765899658 1 0.00050890445709228516
		 -0.00016518309712409973 0.18069946765899658 1 0.0004329681396484375 -0.00031431019306182861
		 0.18069946765899658 1 0.00031451880931854248 -0.00043276697397232056 0.18069946765899658
		 1 0.00016535073518753052 -0.00050869584083557129 0.18069946765899658 1 2.818668362204583e-16
		 -0.00053457915782928467 0.18069946765899658 1 -0.00016535073518753052 -0.00050869584083557129
		 0.18069946765899658 1 -0.00031451880931854248 -0.00043276697397232056 0.18069946765899658
		 1 -0.0004329681396484375 -0.00031431019306182861 0.18069946765899658 1 -0.00016948021948337555
		 -5.4934062063694e-05 0.18067586421966553 1 -0.00017830543220043182 1.2653435987886041e-07
		 0.18067586421966553 1 -0.00016948021948337555 5.5189710110425949e-05 0.18067586421966553
		 1 -0.00014423392713069916 0.00010490324348211288 0.18067586421966553 1 -0.00010475330054759979
		 0.00014429166913032532 0.18067586421966553 1 -5.5085867643356323e-05 0.00016968138515949249
		 0.18067586421966553 1 2.818668362204583e-16 0.00017829239368438721 0.18067586421966553
		 1 5.5085867643356323e-05 0.00016968138515949249 0.18067586421966553 1 0.00010475330054759979
		 0.00014429166913032532 0.18067586421966553 1 0.00014423392713069916 0.00010490324348211288
		 0.18067586421966553 1 0.00016948021948337555 5.5189710110425949e-05 0.18067586421966553
		 1 0.00017830543220043182 1.2653435987886041e-07 0.18067586421966553 1 0.00016948021948337555
		 -5.4934062063694e-05 0.18067586421966553 1 0.00014423392713069916 -0.0001046396791934967
		 0.18067586421966553 1 0.00010475330054759979 -0.00014408864080905914 0.18067586421966553
		 1 5.5085867643356323e-05 -0.00016943551599979401 0.18067586421966553 1 2.818668362204583e-16
		 -0.00017807073891162872 0.18067586421966553 1 -5.5085867643356323e-05 -0.00016943551599979401
		 0.18067586421966553 1 -0.00010475330054759979 -0.00014408864080905914 0.18067586421966553
		 1 -0.00014423392713069916 -0.0001046396791934967 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 ;
	setAttr ".it[0].itg[2].iti[6000].ict" -type "componentList" 1 "vtx[0:99]";
	setAttr ".mlid" 0;
	setAttr ".mlpr" 0;
	setAttr -s 3 ".pndr[0:2]"  0 0 0;
	setAttr ".tgdt[0].cid" -type "Int32Array" 3 0 1 2 ;
	setAttr ".aal" -type "attributeAlias" {"l_pupil_bs_1","weight[0]","l_pupil_bs_2"
		,"weight[1]","l_pupil_deep_bs","weight[2]"} ;
createNode tweak -n "tweak178";
	rename -uid "A42F3D5C-42F2-5C9D-8BD1-4FBD1CA2454A";
createNode objectSet -n "blendShape4Set";
	rename -uid "B925220D-40A2-912E-1C63-1E9F9DE38CFF";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "blendShape4GroupId";
	rename -uid "73160710-4379-9CE2-6163-A1ADD0639A6E";
	setAttr ".ihi" 0;
createNode groupParts -n "blendShape4GroupParts";
	rename -uid "EA78C804-4921-ADF2-5F42-1AA2B38166DD";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet217";
	rename -uid "836720DD-42D4-EFE4-9664-3BAA10CF4FEC";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId1751";
	rename -uid "CD2AC611-456D-48E4-1D87-A4B904C734B1";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts630";
	rename -uid "87B713DE-47A7-52DA-1063-398CA212D249";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster8";
	rename -uid "E0768355-41D1-F5F8-E7A4-A69AB225AA01";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 100 ".wl";
	setAttr ".wl[0:99].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1;
	setAttr ".pm[0]" -type "matrix" 2.3156206806200763 0 0 0 0 2.3156206806200763 0 0
		 0 0 0.87447910899549708 0 0 0 -0.69393367037752463 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 0.99999999999999956 0 0 0 0 0.99999999999999956 0
		 0 -7.0596643856040499e-06 -2.9880566614765014e-09 1;
	setAttr ".dpf[0]"  4;
	setAttr ".mmi" yes;
	setAttr ".mi" 1;
	setAttr ".ucm" yes;
createNode objectSet -n "skinCluster8Set";
	rename -uid "EA49194C-4CBA-B7C2-10EE-98A4F037372D";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster8GroupId";
	rename -uid "C2E08F21-4C65-4354-9569-7D89C3522391";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster8GroupParts";
	rename -uid "AB298E1F-4AA1-91EF-E5BF-F3AECA5B45FB";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode blendShape -n "blendShape5";
	rename -uid "EFD186BE-4C6E-9AFC-F039-6CB92492FF36";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".tc" no;
	setAttr -s 3 ".w";
	setAttr -s 3 ".w";
	setAttr -s 3 ".it[0].itg";
	setAttr ".it[0].itg[0].iti[6000].ipt" -type "pointArray" 100 0.21484279632568359
		 0.069798067212104797 0.06671440601348877 1 0.22589915990829468 4.8618021537549794e-06
		 0.06671440601348877 1 0.21484279632568359 -0.069788470864295959 0.06671440601348877
		 1 0.18275567889213562 -0.13274994492530823 0.06671440601348877 1 0.13278022408485413
		 -0.18271566927433014 0.06671440601348877 1 0.069806419312953949 -0.21479734778404236
		 0.06671440601348877 1 1.2661581903246474e-15 -0.22585180401802063 0.06671440601348877
		 1 -0.069806419312953949 -0.21479734778404236 0.06671440601348877 1 -0.13278022408485413
		 -0.18271566927433014 0.06671440601348877 1 -0.18275567889213562 -0.13274994492530823
		 0.06671440601348877 1 -0.21484279632568359 -0.069788470864295959 0.06671440601348877
		 1 -0.22589915990829468 4.8618021537549794e-06 0.06671440601348877 1 -0.21484279632568359
		 0.069798067212104797 0.06671440601348877 1 -0.18275567889213562 0.13275954127311707
		 0.06671440601348877 1 -0.13278022408485413 0.18272680044174194 0.06671440601348877
		 1 -0.069806419312953949 0.21480602025985718 0.06671440601348877 1 1.2661581903246474e-15
		 0.22586140036582947 0.06671440601348877 1 0.069806419312953949 0.21480602025985718
		 0.06671440601348877 1 0.13278022408485413 0.18272680044174194 0.06671440601348877
		 1 0.18275567889213562 0.13275954127311707 0.06671440601348877 1 0.13546092808246613
		 0.044010575860738754 0.093494176864624023 1 0.14243267476558685 4.861809657086269e-06
		 0.093494176864624023 1 0.13546092808246613 -0.044000960886478424 0.093494176864624023
		 1 0.11523086577653885 -0.083699263632297516 0.093494176864624023 1 0.083720214664936066
		 -0.11520412564277649 0.093494176864624023 1 0.044014222919940948 -0.13543145358562469
		 0.093494176864624023 1 1.2661581903246474e-15 -0.14240080118179321 0.093494176864624023
		 1 -0.044014222919940948 -0.13543145358562469 0.093494176864624023 1 -0.083720214664936066
		 -0.11520412564277649 0.093494176864624023 1 -0.11523086577653885 -0.083699263632297516
		 0.093494176864624023 1 -0.13546092808246613 -0.044000960886478424 0.093494176864624023
		 1 -0.14243267476558685 4.861809657086269e-06 0.093494176864624023 1 -0.13546092808246613
		 0.044010575860738754 0.093494176864624023 1 -0.11523086577653885 0.083709046244621277
		 0.093494176864624023 1 -0.083720214664936066 0.11521389335393906 0.093494176864624023
		 1 -0.044014222919940948 0.13544109463691711 0.093494176864624023 1 1.2661581903246474e-15
		 0.14241030812263489 0.093494176864624023 1 0.044014222919940948 0.13544109463691711
		 0.093494176864624023 1 0.083720214664936066 0.11521389335393906 0.093494176864624023
		 1 0.11523086577653885 0.083709046244621277 0.093494176864624023 1 0.068323776125907898
		 0.022200383245944977 0.10204821825027466 1 0.071840107440948486 4.8618019263813039e-06
		 0.10204821825027466 1 0.068323776125907898 -0.022190716117620468 0.10204821825027466
		 1 0.058119777590036392 -0.042213685810565948 0.10204821825027466 1 0.042226485908031464
		 -0.058103714138269424 0.10204821825027466 1 0.022199748083949089 -0.068306080996990204
		 0.10204821825027466 1 1.2661581903246474e-15 -0.071821659803390503 0.10204821825027466
		 1 -0.022199748083949089 -0.068306080996990204 0.10204821825027466 1 -0.042226485908031464
		 -0.058103714138269424 0.10204821825027466 1 -0.058119777590036392 -0.042213685810565948
		 0.10204821825027466 1 -0.068323776125907898 -0.022190716117620468 0.10204821825027466
		 1 -0.071840107440948486 4.8618019263813039e-06 0.10204821825027466 1 -0.068323776125907898
		 0.022200383245944977 0.10204821825027466 1 -0.058119777590036392 0.042223408818244934
		 0.10204821825027466 1 -0.042226485908031464 0.05811367928981781 0.10204821825027466
		 1 -0.022199748083949089 0.068315625190734863 0.10204821825027466 1 1.2661581903246474e-15
		 0.071831032633781433 0.10204821825027466 1 0.022199748083949089 0.068315625190734863
		 0.10204821825027466 1 0.042226485908031464 0.05811367928981781 0.10204821825027466
		 1 0.058119777590036392 0.042223408818244934 0.10204821825027466 1 0.022755896672606468
		 0.0073973014950752258 0.10515820980072021 1 0.023927036672830582 4.8618071559758391e-06
		 0.10515820980072021 1 0.022755896672606468 -0.0073875673115253448 0.10515820980072021
		 1 0.019357359036803246 -0.014056443236768246 0.10515820980072021 1 0.01406387984752655
		 -0.019348809495568275 0.10515820980072021 1 0.0073938500136137009 -0.022746847942471504
		 0.10515820980072021 1 1.2661581903246474e-15 -0.02391752228140831 0.10515820980072021
		 1 -0.0073938500136137009 -0.022746847942471504 0.10515820980072021 1 -0.01406387984752655
		 -0.019348809495568275 0.10515820980072021 1 -0.019357359036803246 -0.014056443236768246
		 0.10515820980072021 1 -0.022755896672606468 -0.0073875673115253448 0.10515820980072021
		 1 -0.023927036672830582 4.8618071559758391e-06 0.10515820980072021 1 -0.022755896672606468
		 0.0073973014950752258 0.10515820980072021 1 -0.019357359036803246 0.014066169038414955
		 0.10515820980072021 1 -0.01406387984752655 0.019358614459633827 0.10515820980072021
		 1 -0.0073938500136137009 0.022756593301892281 0.10515820980072021 1 1.2661581903246474e-15
		 0.023927317932248116 0.10515820980072021 1 0.0073938500136137009 0.022756593301892281
		 0.10515820980072021 1 0.01406387984752655 0.019358614459633827 0.10515820980072021
		 1 0.019357359036803246 0.014066169038414955 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15
		 4.8618071559758391e-06 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06
		 0.10515820980072021 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021
		 1 1.2661581903246474e-15 4.8618071559758391e-06 0.10515820980072021 1 ;
	setAttr ".it[0].itg[0].iti[6000].ict" -type "componentList" 1 "vtx[0:99]";
	setAttr ".it[0].itg[1].iti[6000].ipt" -type "pointArray" 100 -0.17606735229492188
		 -0.057191964238882065 0.016353845596313477 1 -0.185128353536129 4.7355188144138083e-06
		 0.016353845596313477 1 -0.17606735229492188 0.057201672345399857 0.016353845596313477
		 1 -0.14977128803730011 0.10879956930875778 0.016353845596313477 1 -0.1088155135512352
		 0.14974745362997055 0.016353845596313477 1 -0.057207629084587097 0.17603893578052521
		 0.016353845596313477 1 -3.3284689057949766e-16 0.18509768694639206 0.016353845596313477
		 1 0.057207629084587097 0.17603893578052521 0.016353845596313477 1 0.1088155135512352
		 0.14974745362997055 0.016353845596313477 1 0.14977128803730011 0.10879956930875778
		 0.016353845596313477 1 0.17606735229492188 0.057201672345399857 0.016353845596313477
		 1 0.185128353536129 4.7355188144138083e-06 0.016353845596313477 1 0.17606735229492188
		 -0.057191964238882065 0.016353845596313477 1 0.14977128803730011 -0.10878972709178925
		 0.016353845596313477 1 0.1088155135512352 -0.14973843097686768 0.016353845596313477
		 1 0.057207629084587097 -0.17602913081645966 0.016353845596313477 1 -3.3284689057949766e-16
		 -0.18508809059858322 0.016353845596313477 1 -0.057207629084587097 -0.17602913081645966
		 0.016353845596313477 1 -0.1088155135512352 -0.14973843097686768 0.016353845596313477
		 1 -0.14977128803730011 -0.10878972709178925 0.016353845596313477 1 -0.11101267486810684
		 -0.036058682948350906 -0.0055931806564331055 1 -0.11672621220350266 4.7355426886497298e-06
		 -0.0055931806564331055 1 -0.11101267486810684 0.036068260669708252 -0.0055931806564331055
		 1 -0.094433635473251343 0.068601660430431366 -0.0055931806564331055 1 -0.06861022487282753
		 0.09442003071308136 -0.0055931806564331055 1 -0.036070404574275017 0.11099698394536972
		 -0.0055931806564331055 1 -3.3284689057949766e-16 0.11670879274606705 -0.0055931806564331055
		 1 0.036070404574275017 0.11099698394536972 -0.0055931806564331055 1 0.06861022487282753
		 0.09442003071308136 -0.0055931806564331055 1 0.094433635473251343 0.068601660430431366
		 -0.0055931806564331055 1 0.11101267486810684 0.036068260669708252 -0.0055931806564331055
		 1 0.11672621220350266 4.7355426886497298e-06 -0.0055931806564331055 1 0.11101267486810684
		 -0.036058682948350906 -0.0055931806564331055 1 0.094433635473251343 -0.0685921311378479
		 -0.0055931806564331055 1 0.06861022487282753 -0.094410859048366547 -0.0055931806564331055
		 1 0.036070404574275017 -0.1109873428940773 -0.0055931806564331055 1 -3.3284689057949766e-16
		 -0.1166989877820015 -0.0055931806564331055 1 -0.036070404574275017 -0.1109873428940773
		 -0.0055931806564331055 1 -0.06861022487282753 -0.094410859048366547 -0.0055931806564331055
		 1 -0.094433635473251343 -0.0685921311378479 -0.0055931806564331055 1 -0.055992539972066879
		 -0.018184895627200603 -0.012604117393493652 1 -0.058874074369668961 4.7355185870401328e-06
		 -0.012604117393493652 1 -0.055992539972066879 0.018194390460848808 -0.012604117393493652
		 1 -0.047630187124013901 0.034603497013449669 -0.012604117393493652 1 -0.034605307504534721
		 0.047625858336687088 -0.012604117393493652 1 -0.018193078227341175 0.055986829102039337
		 -0.012604117393493652 1 -3.3284689057949766e-16 0.058867711573839188 -0.012604117393493652
		 1 0.018193078227341175 0.055986829102039337 -0.012604117393493652 1 0.034605307504534721
		 0.047625858336687088 -0.012604117393493652 1 0.047630187124013901 0.034603497013449669
		 -0.012604117393493652 1 0.055992539972066879 0.018194390460848808 -0.012604117393493652
		 1 0.058874074369668961 4.7355185870401328e-06 -0.012604117393493652 1 0.055992539972066879
		 -0.018184895627200603 -0.012604117393493652 1 0.047630187124013901 -0.034594001248478889
		 -0.012604117393493652 1 0.034605307504534721 -0.047616425901651382 -0.012604117393493652
		 1 0.018193078227341175 -0.055977270007133484 -0.012604117393493652 1 -3.3284689057949766e-16
		 -0.05885794386267662 -0.012604117393493652 1 -0.018193078227341175 -0.055977270007133484
		 -0.012604117393493652 1 -0.034605307504534721 -0.047616425901651382 -0.012604117393493652
		 1 -0.047630187124013901 -0.034594001248478889 -0.012604117393493652 1 -0.01864883117377758
		 -0.0060534970834851265 -0.015153646469116211 1 -0.019608631730079651 4.7355165406770539e-06
		 -0.015153646469116211 1 -0.01864883117377758 0.0060629686340689659 -0.015153646469116211
		 1 -0.015863687731325626 0.011528210248798132 -0.015153646469116211 1 -0.011525619309395552
		 0.015865394845604897 -0.015153646469116211 1 -0.0060593839734792709 0.018650127574801445
		 -0.015153646469116211 1 -3.3284689057949766e-16 0.019609556533396244 -0.015153646469116211
		 1 0.0060593839734792709 0.018650127574801445 -0.015153646469116211 1 0.011525619309395552
		 0.015865394845604897 -0.015153646469116211 1 0.015863687731325626 0.011528210248798132
		 -0.015153646469116211 1 0.01864883117377758 0.0060629686340689659 -0.015153646469116211
		 1 0.019608631730079651 4.7355165406770539e-06 -0.015153646469116211 1 0.01864883117377758
		 -0.0060534970834851265 -0.015153646469116211 1 0.015863687731325626 -0.011518727988004684
		 -0.015153646469116211 1 0.011525619309395552 -0.015855961479246616 -0.015153646469116211
		 1 0.0060593839734792709 -0.018640655092895031 -0.015153646469116211 1 -3.3284689057949766e-16
		 -0.019600122235715389 -0.015153646469116211 1 -0.0060593839734792709 -0.018640655092895031
		 -0.015153646469116211 1 -0.011525619309395552 -0.015855961479246616 -0.015153646469116211
		 1 -0.015863687731325626 -0.011518727988004684 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16
		 4.7355165406770539e-06 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06
		 -0.015153646469116211 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211
		 1 -3.3284689057949766e-16 4.7355165406770539e-06 -0.015153646469116211 1 ;
	setAttr ".it[0].itg[1].iti[6000].ict" -type "componentList" 1 "vtx[0:99]";
	setAttr ".it[0].itg[2].iti[6000].ipt" -type "pointArray" 100 -0.0016004890203475952
		 -0.00051951408386230469 0.18096303939819336 1 -0.0016831159591674805 1.2651776160055306e-07
		 0.18096303939819336 1 -0.0016004890203475952 0.00052007287740707397 0.18096303939819336
		 1 -0.0013607442378997803 0.00098884105682373047 0.18096303939819336 1 -0.00098906457424163818
		 0.0013604611158370972 0.18096309900283813 1 -0.0005199238657951355 0.0016004592180252075
		 0.18096303939819336 1 2.818668362204583e-16 0.0016823858022689819 0.18096303939819336
		 1 0.0005199238657951355 0.0016004592180252075 0.18096303939819336 1 0.00098906457424163818
		 0.0013604611158370972 0.18096309900283813 1 0.0013607442378997803 0.00098884105682373047
		 0.18096303939819336 1 0.0016004890203475952 0.00052007287740707397 0.18096303939819336
		 1 0.0016831159591674805 1.2651776160055306e-07 0.18096303939819336 1 0.0016004890203475952
		 -0.00051951408386230469 0.18096303939819336 1 0.0013607442378997803 -0.00098817050457000732
		 0.18096303939819336 1 0.00098906457424163818 -0.0013606846332550049 0.18096303939819336
		 1 0.0005199238657951355 -0.0015998333692550659 0.18096303939819336 1 2.818668362204583e-16
		 -0.001681983470916748 0.18096303939819336 1 -0.0005199238657951355 -0.0015998333692550659
		 0.18096303939819336 1 -0.00098906457424163818 -0.0013606846332550049 0.18096303939819336
		 1 -0.0013607442378997803 -0.00098817050457000732 0.18096303939819336 1 -0.0010084062814712524
		 -0.00032747909426689148 0.18076527118682861 1 -0.0010609179735183716 1.2652685654757079e-07
		 0.18076527118682861 1 -0.0010084062814712524 0.00032785162329673767 0.18076527118682861
		 1 -0.00085852295160293579 0.00062356144189834595 0.18076527118682861 1 -0.00062394142150878906
		 0.00085794925689697266 0.18076527118682861 1 -0.00032788515090942383 0.0010089725255966187
		 0.18076527118682861 1 2.818668362204583e-16 0.0010607242584228516 0.18076527118682861
		 1 0.00032788515090942383 0.0010089725255966187 0.18076527118682861 1 0.00062394142150878906
		 0.00085794925689697266 0.18076527118682861 1 0.00085852295160293579 0.00062356144189834595
		 0.18076527118682861 1 0.0010084062814712524 0.00032785162329673767 0.18076527118682861
		 1 0.0010609179735183716 1.2652685654757079e-07 0.18076527118682861 1 0.0010084062814712524
		 -0.00032747909426689148 0.18076527118682861 1 0.00085852295160293579 -0.00062322616577148438
		 0.18076527118682861 1 0.00062394142150878906 -0.00085797905921936035 0.18076527118682861
		 1 0.00032788515090942383 -0.0010085254907608032 0.18076527118682861 1 2.818668362204583e-16
		 -0.00106009840965271 0.18076527118682861 1 -0.00032788515090942383 -0.0010085254907608032
		 0.18076527118682861 1 -0.00062394142150878906 -0.00085797905921936035 0.18076527118682861
		 1 -0.00085852295160293579 -0.00062322616577148438 0.18076527118682861 1 -0.00050890445709228516
		 -0.00016518309712409973 0.18069946765899658 1 -0.00053511559963226318 1.2651935321628116e-07
		 0.18069946765899658 1 -0.00050890445709228516 0.00016545504331588745 0.18069946765899658
		 1 -0.0004329681396484375 0.00031457841396331787 0.18069946765899658 1 -0.00031451880931854248
		 0.00043294951319694519 0.18069946765899658 1 -0.00016535073518753052 0.00050905346870422363
		 0.18069946765899658 1 2.818668362204583e-16 0.0005351528525352478 0.18069946765899658
		 1 0.00016535073518753052 0.00050905346870422363 0.18069946765899658 1 0.00031451880931854248
		 0.00043294951319694519 0.18069946765899658 1 0.0004329681396484375 0.00031457841396331787
		 0.18069946765899658 1 0.00050890445709228516 0.00016545504331588745 0.18069946765899658
		 1 0.00053511559963226318 1.2651935321628116e-07 0.18069946765899658 1 0.00050890445709228516
		 -0.00016518309712409973 0.18069946765899658 1 0.0004329681396484375 -0.00031431019306182861
		 0.18069946765899658 1 0.00031451880931854248 -0.00043276697397232056 0.18069946765899658
		 1 0.00016535073518753052 -0.00050869584083557129 0.18069946765899658 1 2.818668362204583e-16
		 -0.00053457915782928467 0.18069946765899658 1 -0.00016535073518753052 -0.00050869584083557129
		 0.18069946765899658 1 -0.00031451880931854248 -0.00043276697397232056 0.18069946765899658
		 1 -0.0004329681396484375 -0.00031431019306182861 0.18069946765899658 1 -0.00016948021948337555
		 -5.4934062063694e-05 0.18067586421966553 1 -0.00017830543220043182 1.2653435987886041e-07
		 0.18067586421966553 1 -0.00016948021948337555 5.5189710110425949e-05 0.18067586421966553
		 1 -0.00014423392713069916 0.00010490324348211288 0.18067586421966553 1 -0.00010475330054759979
		 0.00014429166913032532 0.18067586421966553 1 -5.5085867643356323e-05 0.00016968138515949249
		 0.18067586421966553 1 2.818668362204583e-16 0.00017829239368438721 0.18067586421966553
		 1 5.5085867643356323e-05 0.00016968138515949249 0.18067586421966553 1 0.00010475330054759979
		 0.00014429166913032532 0.18067586421966553 1 0.00014423392713069916 0.00010490324348211288
		 0.18067586421966553 1 0.00016948021948337555 5.5189710110425949e-05 0.18067586421966553
		 1 0.00017830543220043182 1.2653435987886041e-07 0.18067586421966553 1 0.00016948021948337555
		 -5.4934062063694e-05 0.18067586421966553 1 0.00014423392713069916 -0.0001046396791934967
		 0.18067586421966553 1 0.00010475330054759979 -0.00014408864080905914 0.18067586421966553
		 1 5.5085867643356323e-05 -0.00016943551599979401 0.18067586421966553 1 2.818668362204583e-16
		 -0.00017807073891162872 0.18067586421966553 1 -5.5085867643356323e-05 -0.00016943551599979401
		 0.18067586421966553 1 -0.00010475330054759979 -0.00014408864080905914 0.18067586421966553
		 1 -0.00014423392713069916 -0.0001046396791934967 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16
		 1.2653435987886041e-07 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07
		 0.18067586421966553 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553
		 1 2.818668362204583e-16 1.2653435987886041e-07 0.18067586421966553 1 ;
	setAttr ".it[0].itg[2].iti[6000].ict" -type "componentList" 1 "vtx[0:99]";
	setAttr ".mlid" 1;
	setAttr ".mlpr" 0;
	setAttr -s 3 ".pndr[0:2]"  0 0 0;
	setAttr ".tgdt[0].cid" -type "Int32Array" 3 0 1 2 ;
	setAttr ".aal" -type "attributeAlias" {"l_pupil_bs_1","weight[0]","l_pupil_bs_2"
		,"weight[1]","l_pupil_deep_bs","weight[2]"} ;
createNode tweak -n "tweak179";
	rename -uid "2AFA5E43-41A8-7B92-2E01-B39BA257512B";
createNode objectSet -n "blendShape5Set";
	rename -uid "A20E7B8A-46CB-F1D4-D516-C3AE9032D220";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "blendShape5GroupId";
	rename -uid "6DB508FD-445C-F7DD-4599-0086B8292DAF";
	setAttr ".ihi" 0;
createNode groupParts -n "blendShape5GroupParts";
	rename -uid "9C6943E1-422D-FE21-52F2-E38987BFE4C7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet218";
	rename -uid "B2D91EE4-49F9-BC24-EC42-DAB344B90E07";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId1753";
	rename -uid "D87DC5AA-4263-3949-094A-C2B9E87925FA";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts632";
	rename -uid "E3937165-4928-460C-217C-21848A9D2E75";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster9";
	rename -uid "9B5FC74C-4A47-E97A-D39E-3081A567B62E";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 100 ".wl";
	setAttr ".wl[0:99].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1;
	setAttr ".pm[0]" -type "matrix" 2.3156206806200763 0 0 0 0 2.3156206806200763 0 0
		 0 0 0.87447910899549708 0 0 0 -0.69393367037752463 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 0.99999999999999956 0 0 0 0 0.99999999999999956 0
		 0 -7.0596643846226538e-06 -2.9880566580070544e-09 1;
	setAttr ".dpf[0]"  4;
	setAttr ".mmi" yes;
	setAttr ".mi" 1;
	setAttr ".ucm" yes;
createNode objectSet -n "skinCluster9Set";
	rename -uid "0F1B20A5-4E01-1AC4-EF1B-B5AF74541F2C";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster9GroupId";
	rename -uid "BB9F39F2-4CFC-531D-054D-008108AF215B";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster9GroupParts";
	rename -uid "7ADE18B7-4795-1C8D-27E9-0DA74CC4263D";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode addDoubleLinear -n "addDoubleLinear25";
	rename -uid "424A2EC6-41CB-65DF-A7DC-1AB9C4EE22FE";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear26";
	rename -uid "FDCA0512-4399-DBF3-BA9F-D0A6F0283547";
	setAttr ".ihi" 2;
	setAttr ".i2" -2;
createNode condition -n "condition1";
	rename -uid "49E1A651-4982-CC5B-D416-B0AFCA19765F";
	setAttr ".op" 2;
	setAttr ".cf" -type "float3" 0 0 1 ;
createNode setRange -n "setRange1";
	rename -uid "B0635692-40F2-77EE-FE6B-47A3CE0AC81E";
	setAttr ".n" -type "float3" 1 0.1 0 ;
	setAttr ".m" -type "float3" 0.1 1 0 ;
	setAttr ".on" -type "float3" 0 -1 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode condition -n "condition2";
	rename -uid "F07FB01F-47A9-005D-82BD-B8AEB869F188";
	setAttr ".op" 2;
	setAttr ".cf" -type "float3" 0 0 1 ;
createNode setRange -n "setRange2";
	rename -uid "5677B02B-45B3-EB2D-225C-C5998E423F0D";
	setAttr ".n" -type "float3" 1 0.1 0 ;
	setAttr ".m" -type "float3" 0.1 1 0 ;
	setAttr ".on" -type "float3" 0 -1 0 ;
	setAttr ".om" -type "float3" 1 0 0 ;
createNode blendColors -n "blendColors1";
	rename -uid "34084F9C-465A-D988-C042-E0B0F6BF51CC";
createNode blendColors -n "blendColors2";
	rename -uid "C6AB3050-4A40-8174-A6AC-18BAD576F6CB";
createNode surfaceShader -n "highlight_mat";
	rename -uid "32777B97-48AE-9F6E-4FF7-94992B5B934E";
	setAttr ".oc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "surfaceShader1SG";
	rename -uid "C5522918-4B29-0576-D41E-83BCD65BCD61";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "081950B9-4BC3-487B-6632-05970722C531";
createNode shrinkWrap -n "shrinkWrap1";
	rename -uid "42F7D899-4457-C282-E381-C884282CD165";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".tsl" 1;
	setAttr ".prj" 3;
	setAttr ".o" 0.01;
createNode tweak -n "tweak180";
	rename -uid "201533EC-4D7B-C2EE-495C-629E1F1D4946";
createNode objectSet -n "shrinkWrap1Set";
	rename -uid "E5ED4435-4082-4EAD-A351-BB94607D72FC";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "shrinkWrap1GroupId";
	rename -uid "55709964-4C79-1010-11A1-C5AF2D3240E3";
	setAttr ".ihi" 0;
createNode groupParts -n "shrinkWrap1GroupParts";
	rename -uid "8EDBCDB6-4B52-D672-819F-5897ACA5DF57";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet219";
	rename -uid "77BB381A-42CB-DA59-8E22-BDAB2ACF0C66";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId1757";
	rename -uid "8BD9A23B-4F77-62F5-CE04-2A82B6C124E2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts636";
	rename -uid "21B2CF78-48FA-38FB-E2EB-4E96ECA17AC7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode multiplyDivide -n "multiplyDivide1";
	rename -uid "B1D56DB8-4AEF-B6A0-E34C-D0976F019B55";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode unitConversion -n "unitConversion23";
	rename -uid "B0339707-4300-0BD4-8F62-E28AE04A6ACE";
createNode unitConversion -n "unitConversion24";
	rename -uid "C0D02A3C-44BE-EAF4-43E3-9F9ECBFADDC4";
	setAttr ".cf" -1;
createNode multDoubleLinear -n "multDoubleLinear32";
	rename -uid "389CF49E-4172-006C-EDB8-7899BDA6F72A";
	setAttr ".i2" 0.1;
createNode unitConversion -n "unitConversion25";
	rename -uid "CFE6B88B-43D0-51FC-756B-E5AA0867F56F";
	setAttr ".cf" -1;
createNode unitConversion -n "unitConversion26";
	rename -uid "9052C2F6-4E4A-5760-AEF8-A7B748217E0F";
createNode multiplyDivide -n "multiplyDivide2";
	rename -uid "4582610D-453B-CB87-9A80-3D8EF6C3E908";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode shrinkWrap -n "shrinkWrap2";
	rename -uid "E1F678B1-45C4-51C3-2F96-B497FF47BC4F";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".tsl" 1;
	setAttr ".prj" 3;
	setAttr ".o" 0.01;
createNode tweak -n "tweak181";
	rename -uid "FB9B74C9-4987-4FFC-EA73-D4BBDBE40DEE";
createNode objectSet -n "shrinkWrap2Set";
	rename -uid "34D5E2D2-4212-49AC-E8DE-2B9BD4C8F4AC";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "shrinkWrap2GroupId";
	rename -uid "5223813F-42E4-F64A-5A71-96B0D5E0F63A";
	setAttr ".ihi" 0;
createNode groupParts -n "shrinkWrap2GroupParts";
	rename -uid "852CB831-47F0-53B4-FE31-3A83F67B9549";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet220";
	rename -uid "5851D7C9-422A-8844-3F72-24B6B204496C";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId1759";
	rename -uid "D1AD2CB2-4F3B-D489-F4BB-61880AC3FE04";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts638";
	rename -uid "C5AE734E-4DDB-E920-CF87-32926C57362E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode multDoubleLinear -n "multDoubleLinear34";
	rename -uid "F66D97E2-4CC4-86E1-004D-70A54D6A018A";
	setAttr ".i2" 0.1;
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "F8DC3C49-4DF7-BE9D-1EC7-339B93CD4E0D";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide4";
	rename -uid "A7ED2EC5-4670-08C4-4C69-7784D18BF343";
	setAttr ".op" 2;
createNode reverse -n "reverse42";
	rename -uid "7645102A-4806-71A9-480B-DCA6BCF3269F";
createNode objectSet -n "highlights_moduleControlSet";
	rename -uid "07064BA2-4780-BAE7-1A6E-938D70CD0576";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
createNode cluster -n "cluster41";
	rename -uid "F754FADE-4A72-2930-4AB0-6EADCEF090D8";
	setAttr ".gm[0]" -type "matrix" 0.95533648912560598 -3.4857099845408968e-17 0.2955202066613396 0
		 0.28962947762551577 -0.19866933079506138 -0.93629336358419957 0 0.058710801693826573 0.98006657784124207 -0.18979606097868751 0
		 1.2068271524837593 -2.9208259977320235e-09 4.0885117513767e-09 1;
createNode cluster -n "cluster42";
	rename -uid "CC84872F-4E8C-D794-DB09-E9A421C9DD8A";
	setAttr ".gm[0]" -type "matrix" -0.95533648912560598 6.8846837952829532e-18 -0.29552020666133944 0
		 0.28962947762551494 -0.19866933079507085 -0.93629336358419735 0 0.058710801693829376 0.98006657784123974 -0.18979606097869664 0
		 -1.2068271300567042 -2.9208259977320235e-09 4.0885119734213049e-09 1;
createNode multDoubleLinear -n "multDoubleLinear35";
	rename -uid "FF2A224D-4926-1135-BD98-7F94614E4B3C";
createNode decomposeMatrix -n "decomposeMatrix80";
	rename -uid "7E658934-426E-594C-52FB-169EB6177C54";
createNode multiplyDivide -n "multiplyDivide5";
	rename -uid "05B12E19-4522-B7A7-485A-BC854896C899";
createNode multiplyDivide -n "multiplyDivide6";
	rename -uid "412D45DE-441F-F72D-EC85-FB9C0DCEE04F";
createNode multiplyDivide -n "multiplyDivide7";
	rename -uid "A4404853-47E7-8604-50F4-4CAA3632FA3F";
createNode multiplyDivide -n "multiplyDivide8";
	rename -uid "BAE95E91-4055-F5AD-AF1C-F18661AABE7A";
createNode multiplyDivide -n "multiplyDivide9";
	rename -uid "A7F7B43A-4C9E-5097-1719-6AA8A5B5CBB5";
createNode multiplyDivide -n "multiplyDivide10";
	rename -uid "FF80B95E-4F13-199D-1B20-71B42BB73427";
createNode multiplyDivide -n "multiplyDivide11";
	rename -uid "BD14AE56-4797-CAEE-1BDA-BABC2CA6990F";
createNode multiplyDivide -n "multiplyDivide12";
	rename -uid "71B2ADF7-4DBA-2519-E063-0BB6A627399C";
createNode multiplyDivide -n "multiplyDivide13";
	rename -uid "3B1C8E2B-4E98-469B-F101-FE840156AA96";
createNode makeNurbSphere -n "makeNurbSphere18";
	rename -uid "A08F1302-4712-5DF3-D27C-CFA696D06792";
createNode makeNurbSphere -n "makeNurbSphere19";
	rename -uid "6897239E-49D4-E5C1-621F-118FAEEB511E";
createNode makeNurbSphere -n "makeNurbSphere21";
	rename -uid "96DD7856-41AD-C24B-B614-19B1FB10CE90";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "4D59415C-42A5-8F69-68B3-5982E510E1D9";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -2237.6305731054526 -1139.7502450704408 ;
	setAttr ".tgi[0].vh" -type "double2" 8390.7371811000648 1248.4900781478816 ;
	setAttr -s 6 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 930;
	setAttr ".tgi[0].ni[0].y" 225.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 1884.2857666015625;
	setAttr ".tgi[0].ni[1].y" 161.42857360839844;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 891.4285888671875;
	setAttr ".tgi[0].ni[2].y" 318.57144165039062;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -360;
	setAttr ".tgi[0].ni[3].y" 255.71427917480469;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" 254.28572082519531;
	setAttr ".tgi[0].ni[4].y" 278.57144165039062;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" -56.428573608398438;
	setAttr ".tgi[0].ni[5].y" 273.80953979492188;
	setAttr ".tgi[0].ni[5].nvs" 1923;
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "BD05A6D5-434F-D644-8E02-B99CD5E392CC";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode multiplyDivide -n "multiplyDivide14";
	rename -uid "03B246C0-4EAD-6D62-0415-C199D85E9A84";
createNode makeNurbSphere -n "makeNurbSphere22";
	rename -uid "319987C3-454B-E79E-DA86-A084E3118513";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "4B671CB7-4354-0868-A435-639B47458E28";
	setAttr -s 5 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -6857.1430104119463 -1857.1428986532358 ;
	setAttr ".tgi[0].vh" -type "double2" 6857.143010411949 1857.1428986532358 ;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -6857.1430104119463 -1857.1428986532358 ;
	setAttr ".tgi[1].vh" -type "double2" 6857.143010411949 1857.1428986532358 ;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -6857.1430104119463 -1857.1428986532358 ;
	setAttr ".tgi[2].vh" -type "double2" 6857.143010411949 1857.1428986532358 ;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" -194.54838761246785 -775.72538732798591 ;
	setAttr ".tgi[3].vh" -type "double2" 412.70807867971189 438.78754525637356 ;
	setAttr -s 4 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 236.96923828125;
	setAttr ".tgi[3].ni[0].y" 101.60091400146484;
	setAttr ".tgi[3].ni[0].nvs" 18305;
	setAttr ".tgi[3].ni[1].x" 228.10417175292969;
	setAttr ".tgi[3].ni[1].y" -138.34417724609375;
	setAttr ".tgi[3].ni[1].nvs" 18304;
	setAttr ".tgi[3].ni[2].x" -382.85714721679688;
	setAttr ".tgi[3].ni[2].y" -61.428569793701172;
	setAttr ".tgi[3].ni[2].nvs" 18304;
	setAttr ".tgi[3].ni[3].x" -75.714286804199219;
	setAttr ".tgi[3].ni[3].y" -61.428569793701172;
	setAttr ".tgi[3].ni[3].nvs" 18304;
	setAttr ".tgi[4].tn" -type "string" "Untitled_5";
	setAttr ".tgi[4].vl" -type "double2" -4787.1573532608963 -2064.5437119651233 ;
	setAttr ".tgi[4].vh" -type "double2" -3412.0524730896682 685.66604837733405 ;
	setAttr -s 9 ".tgi[4].ni";
	setAttr ".tgi[4].ni[0].x" -4638.5712890625;
	setAttr ".tgi[4].ni[0].y" -465.71429443359375;
	setAttr ".tgi[4].ni[0].nvs" 18304;
	setAttr ".tgi[4].ni[1].x" -4667.4716796875;
	setAttr ".tgi[4].ni[1].y" -176.22720336914062;
	setAttr ".tgi[4].ni[1].nvs" 18305;
	setAttr ".tgi[4].ni[2].x" -3718.571533203125;
	setAttr ".tgi[4].ni[2].y" -25.714284896850586;
	setAttr ".tgi[4].ni[2].nvs" 18304;
	setAttr ".tgi[4].ni[3].x" -3715.3603515625;
	setAttr ".tgi[4].ni[3].y" -173.16932678222656;
	setAttr ".tgi[4].ni[3].nvs" 18304;
	setAttr ".tgi[4].ni[4].x" -4640;
	setAttr ".tgi[4].ni[4].y" -75.714286804199219;
	setAttr ".tgi[4].ni[4].nvs" 18304;
	setAttr ".tgi[4].ni[5].x" -4025.71435546875;
	setAttr ".tgi[4].ni[5].y" -25.714284896850586;
	setAttr ".tgi[4].ni[5].nvs" 18304;
	setAttr ".tgi[4].ni[6].x" -4041.77001953125;
	setAttr ".tgi[4].ni[6].y" -166.74702453613281;
	setAttr ".tgi[4].ni[6].nvs" 18304;
	setAttr ".tgi[4].ni[7].x" -4332.85693359375;
	setAttr ".tgi[4].ni[7].y" -75.714286804199219;
	setAttr ".tgi[4].ni[7].nvs" 18305;
	setAttr ".tgi[4].ni[8].x" -3885.71435546875;
	setAttr ".tgi[4].ni[8].y" -568.5714111328125;
	setAttr ".tgi[4].ni[8].nvs" 18304;
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
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -av -k on ".lm";
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -av -k on ".sslt";
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
	setAttr -k on ".tmrm";
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
	setAttr -av -k on ".mbfta";
	setAttr -k on ".mbfe";
	setAttr -k on ".mbme";
	setAttr -av -k on ".mbcsx";
	setAttr -av -k on ".mbcsy";
	setAttr -av -k on ".mbasx";
	setAttr -av -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -av -k on ".blth";
	setAttr -av -k on ".blfr";
	setAttr -av -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av ".msaa";
	setAttr -av ".aasc";
	setAttr -av -k on ".aasq";
	setAttr -k on ".laa";
	setAttr -k on ".gamm";
	setAttr -k on ".gmmv";
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
	setAttr -s 113 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultTextureList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
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
lockNode -l 0 -lu 1;
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
lockNode -l 0 -lu 1;
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
	setAttr ".vtn" -type "string" "Un-tone-mapped (sRGB)";
	setAttr ".vn" -type "string" "Un-tone-mapped";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".ovt" no;
	setAttr ".povt" no;
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
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "multiplyDivide14.oy" "mainPoser_clusterHandle.sx";
connectAttr "multiplyDivide14.oy" "mainPoser_clusterHandle.sy";
connectAttr "multiplyDivide14.oy" "mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere18.os" "root_poserNurbsShape.cr";
connectAttr "makeNurbSphere19.os" "end_poserNurbsShape.cr";
connectAttr "makeNurbSphere21.os" "length_poserNurbsShape.cr";
connectAttr "end_poser.t" "r_ball_controlInitLoc.t";
connectAttr "makeNurbSphere22.os" "highlights_poserNurbsShape.cr";
connectAttr "length_poserOrientShape.wp" "posers_curveShape.cp[0]";
connectAttr "root_poserOrientShape.wp" "posers_curveShape.cp[1]";
connectAttr "end_poserOrientShape.wp" "posers_curveShape.cp[2]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "decomposeMatrix75.otx" "input.tx";
connectAttr "decomposeMatrix75.oty" "input.ty";
connectAttr "decomposeMatrix75.otz" "input.tz";
connectAttr "decomposeMatrix75.orx" "input.rx";
connectAttr "decomposeMatrix75.ory" "input.ry";
connectAttr "decomposeMatrix75.orz" "input.rz";
connectAttr "decomposeMatrix75.osx" "input.sx";
connectAttr "decomposeMatrix75.osy" "input.sy";
connectAttr "decomposeMatrix75.osz" "input.sz";
connectAttr "root_decomposeMatrix.otx" "controls.tx";
connectAttr "root_decomposeMatrix.oty" "controls.ty";
connectAttr "root_decomposeMatrix.otz" "controls.tz";
connectAttr "root_decomposeMatrix.orx" "controls.rx";
connectAttr "root_decomposeMatrix.ory" "controls.ry";
connectAttr "root_decomposeMatrix.orz" "controls.rz";
connectAttr "root_decomposeMatrix.osx" "controls.sx";
connectAttr "root_decomposeMatrix.osy" "controls.sy";
connectAttr "root_decomposeMatrix.osz" "controls.sz";
connectAttr "end_poser.tx" "l_ball_group.tx";
connectAttr "end_poser.s" "l_ball_group.s";
connectAttr "l_highlight_rotate_aimGroup_orientConstraint1.crx" "l_highlight_rotate_aimGroup.rx"
		;
connectAttr "l_highlight_rotate_aimGroup_orientConstraint1.cry" "l_highlight_rotate_aimGroup.ry"
		;
connectAttr "l_highlight_rotate_aimGroup_orientConstraint1.crz" "l_highlight_rotate_aimGroup.rz"
		;
connectAttr "unitConversion24.o" "l_highlight_rotate.rx";
connectAttr "unitConversion23.o" "l_highlight_rotate.ry";
connectAttr "multiplyDivide1.o" "l_highlight_rev.t";
connectAttr "control.highlights" "l_highlight.v";
connectAttr "multiplyDivide3.ox" "l_highlight.size" -l on;
connectAttr "l_highlight_rotate_aimGroup.ro" "l_highlight_rotate_aimGroup_orientConstraint1.cro"
		;
connectAttr "l_highlight_rotate_aimGroup.pim" "l_highlight_rotate_aimGroup_orientConstraint1.cpim"
		;
connectAttr "highlightsAim.r" "l_highlight_rotate_aimGroup_orientConstraint1.tg[0].tr"
		;
connectAttr "highlightsAim.ro" "l_highlight_rotate_aimGroup_orientConstraint1.tg[0].tro"
		;
connectAttr "highlightsAim.pm" "l_highlight_rotate_aimGroup_orientConstraint1.tg[0].tpm"
		;
connectAttr "l_highlight_rotate_aimGroup_orientConstraint1.w0" "l_highlight_rotate_aimGroup_orientConstraint1.tg[0].tw"
		;
connectAttr "multDoubleLinear35.o" "ffd1Lattice.v";
connectAttr "end_poser.tx" "r_ball_group.tx";
connectAttr "end_poser.s" "r_ball_group.s";
connectAttr "l_ballShape.ws" "r_ballShape.cr";
connectAttr "r_highlight_rotate_aimGroup_orientConstraint1.crx" "r_highlight_rotate_aimGroup.rx"
		;
connectAttr "r_highlight_rotate_aimGroup_orientConstraint1.cry" "r_highlight_rotate_aimGroup.ry"
		;
connectAttr "r_highlight_rotate_aimGroup_orientConstraint1.crz" "r_highlight_rotate_aimGroup.rz"
		;
connectAttr "unitConversion25.o" "r_highlight_rotate.rx";
connectAttr "unitConversion26.o" "r_highlight_rotate.ry";
connectAttr "multiplyDivide2.o" "r_highlight_rev.t";
connectAttr "control.highlights" "r_highlight.v";
connectAttr "multiplyDivide4.ox" "r_highlight.size" -l on;
connectAttr "r_highlight_rotate_aimGroup.ro" "r_highlight_rotate_aimGroup_orientConstraint1.cro"
		;
connectAttr "r_highlight_rotate_aimGroup.pim" "r_highlight_rotate_aimGroup_orientConstraint1.cpim"
		;
connectAttr "highlightsAim.r" "r_highlight_rotate_aimGroup_orientConstraint1.tg[0].tr"
		;
connectAttr "highlightsAim.ro" "r_highlight_rotate_aimGroup_orientConstraint1.tg[0].tro"
		;
connectAttr "highlightsAim.pm" "r_highlight_rotate_aimGroup_orientConstraint1.tg[0].tpm"
		;
connectAttr "r_highlight_rotate_aimGroup_orientConstraint1.w0" "r_highlight_rotate_aimGroup_orientConstraint1.tg[0].tw"
		;
connectAttr "reverse23.ox" "look_fk_group.v";
connectAttr "end_poser.tx" "look_fkShape.cp[0].xv";
connectAttr "length_poser.tz" "look_fkShape.cp[0].zv";
connectAttr "pos_reverse_multDoubleLinear.o" "look_fkShape.cp[1].xv";
connectAttr "length_poser.tz" "look_fkShape.cp[1].zv";
connectAttr "end_poser.tx" "l_look_fk_group.tx";
connectAttr "length_poser.tz" "l_look_fk_group.tz";
connectAttr "l_look_fk.sx" "l_look_fk.sz" -l on;
connectAttr "pos_reverse_multDoubleLinear.o" "r_look_fk_group.tx";
connectAttr "length_poser.tz" "r_look_fk_group.tz";
connectAttr "transformGeometry1.og" "r_look_fkShape.cr";
connectAttr "control.eyesIk" "look_ik_group_2.v";
connectAttr "look_ik_group_2_parentConstraint1.crx" "look_ik_group_2.rx";
connectAttr "look_ik_group_2_parentConstraint1.cry" "look_ik_group_2.ry";
connectAttr "look_ik_group_2_parentConstraint1.crz" "look_ik_group_2.rz";
connectAttr "look_ik_group_2_parentConstraint1.ctx" "look_ik_group_2.tx";
connectAttr "look_ik_group_2_parentConstraint1.cty" "look_ik_group_2.ty";
connectAttr "look_ik_group_2_parentConstraint1.ctz" "look_ik_group_2.tz";
connectAttr "pos_ik__multDoubleLinear.o" "look_ik_group.tz";
connectAttr "end_poser.tx" "l_look_ik_group.tx";
connectAttr "pos_reverse_multDoubleLinear.o" "r_look_ik_group.tx";
connectAttr "transformGeometry2.og" "r_look_ikShape.cr";
connectAttr "look_ik_group_2.ro" "look_ik_group_2_parentConstraint1.cro";
connectAttr "look_ik_group_2.pim" "look_ik_group_2_parentConstraint1.cpim";
connectAttr "look_ik_group_2.rp" "look_ik_group_2_parentConstraint1.crp";
connectAttr "look_ik_group_2.rpt" "look_ik_group_2_parentConstraint1.crt";
connectAttr "root_connector.t" "look_ik_group_2_parentConstraint1.tg[0].tt";
connectAttr "root_connector.rp" "look_ik_group_2_parentConstraint1.tg[0].trp";
connectAttr "root_connector.rpt" "look_ik_group_2_parentConstraint1.tg[0].trt";
connectAttr "root_connector.r" "look_ik_group_2_parentConstraint1.tg[0].tr";
connectAttr "root_connector.ro" "look_ik_group_2_parentConstraint1.tg[0].tro";
connectAttr "root_connector.s" "look_ik_group_2_parentConstraint1.tg[0].ts";
connectAttr "root_connector.pm" "look_ik_group_2_parentConstraint1.tg[0].tpm";
connectAttr "look_ik_group_2_parentConstraint1.w0" "look_ik_group_2_parentConstraint1.tg[0].tw"
		;
connectAttr "eyes_world_connector.t" "look_ik_group_2_parentConstraint1.tg[1].tt"
		;
connectAttr "eyes_world_connector.rp" "look_ik_group_2_parentConstraint1.tg[1].trp"
		;
connectAttr "eyes_world_connector.rpt" "look_ik_group_2_parentConstraint1.tg[1].trt"
		;
connectAttr "eyes_world_connector.r" "look_ik_group_2_parentConstraint1.tg[1].tr"
		;
connectAttr "eyes_world_connector.ro" "look_ik_group_2_parentConstraint1.tg[1].tro"
		;
connectAttr "eyes_world_connector.s" "look_ik_group_2_parentConstraint1.tg[1].ts"
		;
connectAttr "eyes_world_connector.pm" "look_ik_group_2_parentConstraint1.tg[1].tpm"
		;
connectAttr "look_ik_group_2_parentConstraint1.w1" "look_ik_group_2_parentConstraint1.tg[1].tw"
		;
connectAttr "control.ikParentToHead" "look_ik_group_2_parentConstraint1.w0";
connectAttr "reverse40.ox" "look_ik_group_2_parentConstraint1.w1";
connectAttr "highlightsAim_group_orientConstraint1.crx" "highlightsAim_group.rx"
		;
connectAttr "highlightsAim_group_orientConstraint1.cry" "highlightsAim_group.ry"
		;
connectAttr "highlightsAim_group_orientConstraint1.crz" "highlightsAim_group.rz"
		;
connectAttr "control.highlights" "highlightsAim_group.v";
connectAttr "highlights_poser.t" "highlightsAim_group.t";
connectAttr "highlightsAim_group.ro" "highlightsAim_group_orientConstraint1.cro"
		;
connectAttr "highlightsAim_group.pim" "highlightsAim_group_orientConstraint1.cpim"
		;
connectAttr "root_connector.r" "highlightsAim_group_orientConstraint1.tg[0].tr";
connectAttr "root_connector.ro" "highlightsAim_group_orientConstraint1.tg[0].tro"
		;
connectAttr "root_connector.pm" "highlightsAim_group_orientConstraint1.tg[0].tpm"
		;
connectAttr "highlightsAim_group_orientConstraint1.w0" "highlightsAim_group_orientConstraint1.tg[0].tw"
		;
connectAttr "eyes_world_connector.r" "highlightsAim_group_orientConstraint1.tg[1].tr"
		;
connectAttr "eyes_world_connector.ro" "highlightsAim_group_orientConstraint1.tg[1].tro"
		;
connectAttr "eyes_world_connector.pm" "highlightsAim_group_orientConstraint1.tg[1].tpm"
		;
connectAttr "highlightsAim_group_orientConstraint1.w1" "highlightsAim_group_orientConstraint1.tg[1].tw"
		;
connectAttr "reverse42.ox" "highlightsAim_group_orientConstraint1.w0";
connectAttr "highlightsAim.world" "highlightsAim_group_orientConstraint1.w1";
connectAttr "decomposeMatrix23.otx" "l_global_parent.tx";
connectAttr "decomposeMatrix23.oty" "l_global_parent.ty";
connectAttr "decomposeMatrix23.otz" "l_global_parent.tz";
connectAttr "decomposeMatrix23.orx" "l_global_parent.rx";
connectAttr "decomposeMatrix23.ory" "l_global_parent.ry";
connectAttr "decomposeMatrix23.orz" "l_global_parent.rz";
connectAttr "root_connector.s" "l_global_parent.s";
connectAttr "l_eye_joint_aimConstraint1.crx" "l_eye_joint.rx";
connectAttr "l_eye_joint_aimConstraint1.cry" "l_eye_joint.ry";
connectAttr "l_eye_joint_aimConstraint1.crz" "l_eye_joint.rz";
connectAttr "reverse23.ox" "l_eye_joint_aimConstraint1.w0";
connectAttr "control.eyesIk" "l_eye_joint_aimConstraint1.w2";
connectAttr "l_eye_joint.pim" "l_eye_joint_aimConstraint1.cpim";
connectAttr "l_eye_joint.t" "l_eye_joint_aimConstraint1.ct";
connectAttr "l_eye_joint.rp" "l_eye_joint_aimConstraint1.crp";
connectAttr "l_eye_joint.rpt" "l_eye_joint_aimConstraint1.crt";
connectAttr "l_eye_joint.ro" "l_eye_joint_aimConstraint1.cro";
connectAttr "l_eye_joint.jo" "l_eye_joint_aimConstraint1.cjo";
connectAttr "l_look_fk.t" "l_eye_joint_aimConstraint1.tg[0].tt";
connectAttr "l_look_fk.rp" "l_eye_joint_aimConstraint1.tg[0].trp";
connectAttr "l_look_fk.rpt" "l_eye_joint_aimConstraint1.tg[0].trt";
connectAttr "l_look_fk.pm" "l_eye_joint_aimConstraint1.tg[0].tpm";
connectAttr "l_eye_joint_aimConstraint1.w0" "l_eye_joint_aimConstraint1.tg[0].tw"
		;
connectAttr "l_look_ik.t" "l_eye_joint_aimConstraint1.tg[2].tt";
connectAttr "l_look_ik.rp" "l_eye_joint_aimConstraint1.tg[2].trp";
connectAttr "l_look_ik.rpt" "l_eye_joint_aimConstraint1.tg[2].trt";
connectAttr "l_look_ik.pm" "l_eye_joint_aimConstraint1.tg[2].tpm";
connectAttr "l_eye_joint_aimConstraint1.w2" "l_eye_joint_aimConstraint1.tg[2].tw"
		;
connectAttr "root_connector.wm" "l_eye_joint_aimConstraint1.wum";
connectAttr "decomposeMatrix25.otx" "r_global_parent.tx";
connectAttr "decomposeMatrix25.oty" "r_global_parent.ty";
connectAttr "decomposeMatrix25.otz" "r_global_parent.tz";
connectAttr "decomposeMatrix25.orx" "r_global_parent.rx";
connectAttr "decomposeMatrix25.ory" "r_global_parent.ry";
connectAttr "decomposeMatrix25.orz" "r_global_parent.rz";
connectAttr "root_connector.s" "r_global_parent.s";
connectAttr "r_eye_joint_aimConstraint1.crx" "r_eye_joint.rx";
connectAttr "r_eye_joint_aimConstraint1.cry" "r_eye_joint.ry";
connectAttr "r_eye_joint_aimConstraint1.crz" "r_eye_joint.rz";
connectAttr "reverse23.ox" "r_eye_joint_aimConstraint1.w0";
connectAttr "control.eyesIk" "r_eye_joint_aimConstraint1.w2";
connectAttr "r_eye_joint.pim" "r_eye_joint_aimConstraint1.cpim";
connectAttr "r_eye_joint.t" "r_eye_joint_aimConstraint1.ct";
connectAttr "r_eye_joint.rp" "r_eye_joint_aimConstraint1.crp";
connectAttr "r_eye_joint.rpt" "r_eye_joint_aimConstraint1.crt";
connectAttr "r_eye_joint.ro" "r_eye_joint_aimConstraint1.cro";
connectAttr "r_eye_joint.jo" "r_eye_joint_aimConstraint1.cjo";
connectAttr "r_look_fk.t" "r_eye_joint_aimConstraint1.tg[0].tt";
connectAttr "r_look_fk.rp" "r_eye_joint_aimConstraint1.tg[0].trp";
connectAttr "r_look_fk.rpt" "r_eye_joint_aimConstraint1.tg[0].trt";
connectAttr "r_look_fk.pm" "r_eye_joint_aimConstraint1.tg[0].tpm";
connectAttr "r_eye_joint_aimConstraint1.w0" "r_eye_joint_aimConstraint1.tg[0].tw"
		;
connectAttr "r_look_ik.t" "r_eye_joint_aimConstraint1.tg[2].tt";
connectAttr "r_look_ik.rp" "r_eye_joint_aimConstraint1.tg[2].trp";
connectAttr "r_look_ik.rpt" "r_eye_joint_aimConstraint1.tg[2].trt";
connectAttr "r_look_ik.pm" "r_eye_joint_aimConstraint1.tg[2].tpm";
connectAttr "r_eye_joint_aimConstraint1.w2" "r_eye_joint_aimConstraint1.tg[2].tw"
		;
connectAttr "root_connector.wm" "r_eye_joint_aimConstraint1.wum";
connectAttr "eulerToQuat10.oqx" "l_slideJoint_2.tz";
connectAttr "eulerToQuat10.oqw" "l_slideJoint_2.sx";
connectAttr "eulerToQuat10.oqw" "l_slideJoint_2.sy";
connectAttr "eulerToQuat9.oqx" "l_slideJoint_3.tz";
connectAttr "eulerToQuat9.oqw" "l_slideJoint_3.sx";
connectAttr "eulerToQuat9.oqw" "l_slideJoint_3.sy";
connectAttr "eulerToQuat3.oqx" "l_slideJoint_4.tz";
connectAttr "eulerToQuat3.oqw" "l_slideJoint_4.sx";
connectAttr "eulerToQuat3.oqw" "l_slideJoint_4.sy";
connectAttr "eulerToQuat4.oqx" "l_slideJoint_5.tz";
connectAttr "eulerToQuat4.oqw" "l_slideJoint_5.sx";
connectAttr "eulerToQuat4.oqw" "l_slideJoint_5.sy";
connectAttr "eulerToQuat5.oqx" "l_slideJoint_6.tz";
connectAttr "eulerToQuat5.oqw" "l_slideJoint_6.sx";
connectAttr "eulerToQuat5.oqw" "l_slideJoint_6.sy";
connectAttr "eulerToQuat8.oqx" "l_slideJoint_7.tz";
connectAttr "eulerToQuat8.oqw" "l_slideJoint_7.sx";
connectAttr "eulerToQuat8.oqw" "l_slideJoint_7.sy";
connectAttr "eulerToQuat6.oqx" "l_slideJoint_8.tz";
connectAttr "eulerToQuat6.oqw" "l_slideJoint_8.sx";
connectAttr "eulerToQuat6.oqw" "l_slideJoint_8.sy";
connectAttr "eulerToQuat7.oqx" "l_slideJoint_9.tz";
connectAttr "eulerToQuat7.oqw" "l_slideJoint_9.sx";
connectAttr "eulerToQuat7.oqw" "l_slideJoint_9.sy";
connectAttr "multDoubleLinear12.o" "l_slideJoint_9.sz";
connectAttr "l_slideJoint_9.s" "ext_slideJoint_9.is";
connectAttr "setRange1.ox" "ext_slideJoint_9.sx";
connectAttr "setRange1.oy" "ext_slideJoint_9.sy";
connectAttr "l_slideJoint_9.s" "int_slideJoint_9.is";
connectAttr "setRange1.ox" "int_slideJoint_9.sx";
connectAttr "setRange1.oy" "int_slideJoint_9.sy";
connectAttr "eulerToQuat19.oqx" "r_slideJoint_2.tz";
connectAttr "eulerToQuat19.oqw" "r_slideJoint_2.sx";
connectAttr "eulerToQuat19.oqw" "r_slideJoint_2.sy";
connectAttr "eulerToQuat18.oqx" "r_slideJoint_3.tz";
connectAttr "eulerToQuat18.oqw" "r_slideJoint_3.sx";
connectAttr "eulerToQuat18.oqw" "r_slideJoint_3.sy";
connectAttr "eulerToQuat12.oqx" "r_slideJoint_4.tz";
connectAttr "eulerToQuat12.oqw" "r_slideJoint_4.sx";
connectAttr "eulerToQuat12.oqw" "r_slideJoint_4.sy";
connectAttr "eulerToQuat13.oqx" "r_slideJoint_5.tz";
connectAttr "eulerToQuat13.oqw" "r_slideJoint_5.sx";
connectAttr "eulerToQuat13.oqw" "r_slideJoint_5.sy";
connectAttr "eulerToQuat14.oqx" "r_slideJoint_6.tz";
connectAttr "eulerToQuat14.oqw" "r_slideJoint_6.sx";
connectAttr "eulerToQuat14.oqw" "r_slideJoint_6.sy";
connectAttr "eulerToQuat17.oqx" "r_slideJoint_7.tz";
connectAttr "eulerToQuat17.oqw" "r_slideJoint_7.sx";
connectAttr "eulerToQuat17.oqw" "r_slideJoint_7.sy";
connectAttr "eulerToQuat15.oqx" "r_slideJoint_8.tz";
connectAttr "eulerToQuat15.oqw" "r_slideJoint_8.sx";
connectAttr "eulerToQuat15.oqw" "r_slideJoint_8.sy";
connectAttr "eulerToQuat16.oqx" "r_slideJoint_9.tz";
connectAttr "eulerToQuat16.oqw" "r_slideJoint_9.sx";
connectAttr "eulerToQuat16.oqw" "r_slideJoint_9.sy";
connectAttr "multDoubleLinear27.o" "r_slideJoint_9.sz";
connectAttr "r_slideJoint_9.s" "r_ext_slideJoint_9.is";
connectAttr "setRange2.ox" "r_ext_slideJoint_9.sx";
connectAttr "setRange2.oy" "r_ext_slideJoint_9.sy";
connectAttr "r_slideJoint_9.s" "r_int_slideJoint_9.is";
connectAttr "setRange2.ox" "r_int_slideJoint_9.sx";
connectAttr "setRange2.oy" "r_int_slideJoint_9.sy";
connectAttr "multDoubleLinear32.o" "cluster41Handle.sx";
connectAttr "multDoubleLinear32.o" "cluster41Handle.sy";
connectAttr "multDoubleLinear32.o" "cluster41Handle.sz";
connectAttr "multDoubleLinear34.o" "cluster42Handle.sx";
connectAttr "multDoubleLinear34.o" "cluster42Handle.sy";
connectAttr "multDoubleLinear34.o" "cluster42Handle.sz";
connectAttr "root_decomposeMatrix.os" "outJoints.s";
connectAttr "decomposeMatrix78.or" "root_outJoint.r";
connectAttr "decomposeMatrix78.ot" "root_outJoint.t";
connectAttr "decomposeMatrix77.oty" "l_base_outJoint.ty";
connectAttr "decomposeMatrix77.otz" "l_base_outJoint.tz";
connectAttr "decomposeMatrix77.otx" "l_base_outJoint.tx";
connectAttr "decomposeMatrix77.ory" "l_base_outJoint.ry";
connectAttr "decomposeMatrix77.orz" "l_base_outJoint.rz";
connectAttr "decomposeMatrix77.orx" "l_base_outJoint.rx";
connectAttr "decomposeMatrix77.osy" "l_base_outJoint.sy";
connectAttr "decomposeMatrix77.osz" "l_base_outJoint.sz";
connectAttr "decomposeMatrix77.osx" "l_base_outJoint.sx";
connectAttr "l_eyeBase_skinJoint1_decMat.orx" "l_outJoint.rx";
connectAttr "l_eyeBase_skinJoint1_decMat.ory" "l_outJoint.ry";
connectAttr "l_eyeBase_skinJoint1_decMat.orz" "l_outJoint.rz";
connectAttr "l_base_outJoint.s" "l_outJoint.is";
connectAttr "decomposeMatrix24.os" "r_base_outJoint.s";
connectAttr "decomposeMatrix24.ot" "r_base_outJoint.t";
connectAttr "decomposeMatrix24.or" "r_base_outJoint.r";
connectAttr "r_eyeBase_skinJoint1_decMat.orx" "r_outJoint.rx";
connectAttr "r_eyeBase_skinJoint1_decMat.ory" "r_outJoint.ry";
connectAttr "r_eyeBase_skinJoint1_decMat.orz" "r_outJoint.rz";
connectAttr "r_base_outJoint.s" "r_outJoint.is";
connectAttr "multiplyDivide5.o" "l_geo_scale_group.s";
connectAttr "l_eye_group_decMat.ot" "l_geo_scale_group.t";
connectAttr "l_eye_group_decMat.orx" "l_geo_group.rx";
connectAttr "l_eye_group_decMat.ory" "l_geo_group.ry";
connectAttr "l_eye_group_decMat.orz" "l_geo_group.rz";
connectAttr "skinCluster5.og[0]" "l_glassShape.i";
connectAttr "skinCluster5GroupId.id" "l_glassShape.iog.og[3].gid";
connectAttr "skinCluster5Set.mwc" "l_glassShape.iog.og[3].gco";
connectAttr "groupId12.id" "l_glassShape.iog.og[4].gid";
connectAttr "tweakSet5.mwc" "l_glassShape.iog.og[4].gco";
connectAttr "tweak5.vl[0].vt[0]" "l_glassShape.twl";
connectAttr "skinCluster3.og[0]" "l_eyeballShape.i";
connectAttr "skinCluster3GroupId.id" "l_eyeballShape.iog.og[3].gid";
connectAttr "skinCluster3Set.mwc" "l_eyeballShape.iog.og[3].gco";
connectAttr "groupId7.id" "l_eyeballShape.iog.og[4].gid";
connectAttr "tweakSet3.mwc" "l_eyeballShape.iog.og[4].gco";
connectAttr "blendShape1GroupId.id" "l_eyeballShape.iog.og[7].gid";
connectAttr "blendShape1Set.mwc" "l_eyeballShape.iog.og[7].gco";
connectAttr "tweak3.vl[0].vt[0]" "l_eyeballShape.twl";
connectAttr "skinCluster8.og[0]" "l_pupilShape.i";
connectAttr "blendShape4GroupId.id" "l_pupilShape.iog.og[4].gid";
connectAttr "blendShape4Set.mwc" "l_pupilShape.iog.og[4].gco";
connectAttr "groupId1751.id" "l_pupilShape.iog.og[5].gid";
connectAttr "tweakSet217.mwc" "l_pupilShape.iog.og[5].gco";
connectAttr "skinCluster8GroupId.id" "l_pupilShape.iog.og[6].gid";
connectAttr "skinCluster8Set.mwc" "l_pupilShape.iog.og[6].gco";
connectAttr "tweak178.vl[0].vt[0]" "l_pupilShape.twl";
connectAttr "l_highlight_geo_parentConstraint1.ctx" "l_highlight_geo.tx";
connectAttr "l_highlight_geo_parentConstraint1.cty" "l_highlight_geo.ty";
connectAttr "l_highlight_geo_parentConstraint1.ctz" "l_highlight_geo.tz";
connectAttr "l_highlight_geo_parentConstraint1.crx" "l_highlight_geo.rx";
connectAttr "l_highlight_geo_parentConstraint1.cry" "l_highlight_geo.ry";
connectAttr "l_highlight_geo_parentConstraint1.crz" "l_highlight_geo.rz";
connectAttr "l_highlight_geo_scaleConstraint1.csx" "l_highlight_geo.sx";
connectAttr "l_highlight_geo_scaleConstraint1.csy" "l_highlight_geo.sy";
connectAttr "l_highlight_geo_scaleConstraint1.csz" "l_highlight_geo.sz";
connectAttr "control.highlights" "l_highlight_geo.v";
connectAttr "shrinkWrap1.og[0]" "l_highlight_geoShape.i";
connectAttr "shrinkWrap1GroupId.id" "l_highlight_geoShape.iog.og[0].gid";
connectAttr "shrinkWrap1Set.mwc" "l_highlight_geoShape.iog.og[0].gco";
connectAttr "groupId1757.id" "l_highlight_geoShape.iog.og[1].gid";
connectAttr "tweakSet219.mwc" "l_highlight_geoShape.iog.og[1].gco";
connectAttr "tweak180.vl[0].vt[0]" "l_highlight_geoShape.twl";
connectAttr "cluster41.og[0]" "l_highlight_geoShapeOrig.i";
connectAttr "l_highlight_geo.ro" "l_highlight_geo_parentConstraint1.cro";
connectAttr "l_highlight_geo.pim" "l_highlight_geo_parentConstraint1.cpim";
connectAttr "l_highlight_geo.rp" "l_highlight_geo_parentConstraint1.crp";
connectAttr "l_highlight_geo.rpt" "l_highlight_geo_parentConstraint1.crt";
connectAttr "l_highlight.t" "l_highlight_geo_parentConstraint1.tg[0].tt";
connectAttr "l_highlight.rp" "l_highlight_geo_parentConstraint1.tg[0].trp";
connectAttr "l_highlight.rpt" "l_highlight_geo_parentConstraint1.tg[0].trt";
connectAttr "l_highlight.r" "l_highlight_geo_parentConstraint1.tg[0].tr";
connectAttr "l_highlight.ro" "l_highlight_geo_parentConstraint1.tg[0].tro";
connectAttr "l_highlight.s" "l_highlight_geo_parentConstraint1.tg[0].ts";
connectAttr "l_highlight.pm" "l_highlight_geo_parentConstraint1.tg[0].tpm";
connectAttr "l_highlight_geo_parentConstraint1.w0" "l_highlight_geo_parentConstraint1.tg[0].tw"
		;
connectAttr "l_highlight_geo.pim" "l_highlight_geo_scaleConstraint1.cpim";
connectAttr "l_highlight.s" "l_highlight_geo_scaleConstraint1.tg[0].ts";
connectAttr "l_highlight.pm" "l_highlight_geo_scaleConstraint1.tg[0].tpm";
connectAttr "l_highlight_geo_scaleConstraint1.w0" "l_highlight_geo_scaleConstraint1.tg[0].tw"
		;
connectAttr "multiplyDivide6.o" "r_geo_scale_group.s";
connectAttr "r_eye_group_decMat.ot" "r_geo_scale_group.t";
connectAttr "r_eye_group_decMat.orx" "r_geo_group.rx";
connectAttr "r_eye_group_decMat.ory" "r_geo_group.ry";
connectAttr "r_eye_group_decMat.orz" "r_geo_group.rz";
connectAttr "skinCluster7.og[0]" "r_glassShape.i";
connectAttr "skinCluster5GroupId1.id" "r_glassShape.iog.og[3].gid";
connectAttr "skinCluster5Set1.mwc" "r_glassShape.iog.og[3].gco";
connectAttr "groupId1743.id" "r_glassShape.iog.og[4].gid";
connectAttr "tweakSet214.mwc" "r_glassShape.iog.og[4].gco";
connectAttr "tweak175.vl[0].vt[0]" "r_glassShape.twl";
connectAttr "skinCluster6.og[0]" "r_eyeballShape.i";
connectAttr "skinCluster3GroupId1.id" "r_eyeballShape.iog.og[3].gid";
connectAttr "skinCluster3Set1.mwc" "r_eyeballShape.iog.og[3].gco";
connectAttr "groupId1741.id" "r_eyeballShape.iog.og[4].gid";
connectAttr "tweakSet213.mwc" "r_eyeballShape.iog.og[4].gco";
connectAttr "blendShape1GroupId1.id" "r_eyeballShape.iog.og[7].gid";
connectAttr "blendShape1Set1.mwc" "r_eyeballShape.iog.og[7].gco";
connectAttr "tweak174.vl[0].vt[0]" "r_eyeballShape.twl";
connectAttr "skinCluster9.og[0]" "r_pupilShape.i";
connectAttr "blendShape5GroupId.id" "r_pupilShape.iog.og[6].gid";
connectAttr "blendShape5Set.mwc" "r_pupilShape.iog.og[6].gco";
connectAttr "groupId1753.id" "r_pupilShape.iog.og[7].gid";
connectAttr "tweakSet218.mwc" "r_pupilShape.iog.og[7].gco";
connectAttr "skinCluster9GroupId.id" "r_pupilShape.iog.og[8].gid";
connectAttr "skinCluster9Set.mwc" "r_pupilShape.iog.og[8].gco";
connectAttr "tweak179.vl[0].vt[0]" "r_pupilShape.twl";
connectAttr "r_highlight_geo_scaleConstraint1.csz" "r_highlight_geo.sz";
connectAttr "r_highlight_geo_scaleConstraint1.csx" "r_highlight_geo.sx";
connectAttr "r_highlight_geo_scaleConstraint1.csy" "r_highlight_geo.sy";
connectAttr "r_highlight_geo_parentConstraint1.ctx" "r_highlight_geo.tx";
connectAttr "r_highlight_geo_parentConstraint1.cty" "r_highlight_geo.ty";
connectAttr "r_highlight_geo_parentConstraint1.ctz" "r_highlight_geo.tz";
connectAttr "r_highlight_geo_parentConstraint1.crx" "r_highlight_geo.rx";
connectAttr "r_highlight_geo_parentConstraint1.cry" "r_highlight_geo.ry";
connectAttr "r_highlight_geo_parentConstraint1.crz" "r_highlight_geo.rz";
connectAttr "control.highlights" "r_highlight_geo.v";
connectAttr "shrinkWrap2.og[0]" "r_highlight_geoShape.i";
connectAttr "shrinkWrap2GroupId.id" "r_highlight_geoShape.iog.og[0].gid";
connectAttr "shrinkWrap2Set.mwc" "r_highlight_geoShape.iog.og[0].gco";
connectAttr "groupId1759.id" "r_highlight_geoShape.iog.og[1].gid";
connectAttr "tweakSet220.mwc" "r_highlight_geoShape.iog.og[1].gco";
connectAttr "tweak181.vl[0].vt[0]" "r_highlight_geoShape.twl";
connectAttr "cluster42.og[0]" "r_highlight_geoShapeOrig.i";
connectAttr "r_highlight_geo.ro" "r_highlight_geo_parentConstraint1.cro";
connectAttr "r_highlight_geo.pim" "r_highlight_geo_parentConstraint1.cpim";
connectAttr "r_highlight_geo.rp" "r_highlight_geo_parentConstraint1.crp";
connectAttr "r_highlight_geo.rpt" "r_highlight_geo_parentConstraint1.crt";
connectAttr "r_highlight.t" "r_highlight_geo_parentConstraint1.tg[0].tt";
connectAttr "r_highlight.rp" "r_highlight_geo_parentConstraint1.tg[0].trp";
connectAttr "r_highlight.rpt" "r_highlight_geo_parentConstraint1.tg[0].trt";
connectAttr "r_highlight.r" "r_highlight_geo_parentConstraint1.tg[0].tr";
connectAttr "r_highlight.ro" "r_highlight_geo_parentConstraint1.tg[0].tro";
connectAttr "r_highlight.s" "r_highlight_geo_parentConstraint1.tg[0].ts";
connectAttr "r_highlight.pm" "r_highlight_geo_parentConstraint1.tg[0].tpm";
connectAttr "r_highlight_geo_parentConstraint1.w0" "r_highlight_geo_parentConstraint1.tg[0].tw"
		;
connectAttr "r_highlight_geo.pim" "r_highlight_geo_scaleConstraint1.cpim";
connectAttr "r_highlight.s" "r_highlight_geo_scaleConstraint1.tg[0].ts";
connectAttr "r_highlight.pm" "r_highlight_geo_scaleConstraint1.tg[0].tpm";
connectAttr "r_highlight_geo_scaleConstraint1.w0" "r_highlight_geo_scaleConstraint1.tg[0].tw"
		;
connectAttr "multMatrix18.o" "decomposeMatrix24.imat";
connectAttr "composeMatrix1.omat" "multMatrix18.i[0]";
connectAttr "r_ball.wm" "multMatrix18.i[1]";
connectAttr "r_base_outJoint.pim" "multMatrix18.i[2]";
connectAttr "control.eyesIk" "reverse23.ix";
connectAttr "end_poser.tx" "pos_reverse_multDoubleLinear.i1";
connectAttr "look_ik_group_2_parentConstraint1.w0" "reverse40.ix";
connectAttr "l_ball.wm" "decomposeMatrix23.imat";
connectAttr "multMatrix20.o" "decomposeMatrix25.imat";
connectAttr "r_look_fk.iog" "look_fk_moduleControlSet.dsm" -na;
connectAttr "look_fk.iog" "look_fk_moduleControlSet.dsm" -na;
connectAttr "l_look_fk.iog" "look_fk_moduleControlSet.dsm" -na;
connectAttr "look_ik.iog" "look_ik_moduleControlSet.dsm" -na;
connectAttr "l_look_ik.iog" "look_ik_moduleControlSet.dsm" -na;
connectAttr "r_look_ik.iog" "look_ik_moduleControlSet.dsm" -na;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "root_poser.wm" "decomposeMatrix75.imat";
connectAttr "root_connector.wm" "root_decomposeMatrix.imat";
connectAttr "look_ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "look_fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "highlights_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "r_ball.iog" "moduleControlSet.dsm" -na;
connectAttr "l_ball.iog" "moduleControlSet.dsm" -na;
connectAttr "control.iog" "moduleControlSet.dsm" -na;
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr "hyperLayout2.msg" "hyperView2.hl";
connectAttr "hyperLayout3.msg" "hyperView3.hl";
connectAttr "hyperLayout4.msg" "hyperView4.hl";
connectAttr "l_eye_joint.wm" "l_eye_group_decMat.imat";
connectAttr "r_eye_joint.wm" "r_eye_group_decMat.imat";
connectAttr "multMatrix24.o" "r_eyeBase_skinJoint1_decMat.imat";
connectAttr "multMatrix23.o" "l_eyeBase_skinJoint1_decMat.imat";
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
connectAttr "l_base_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_base_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "length_poser.tz" "pos_ik__multDoubleLinear.i1";
connectAttr "composeMatrix1.omat" "multMatrix20.i[0]";
connectAttr "r_ball.wm" "multMatrix20.i[1]";
connectAttr "multMatrix22.o" "decomposeMatrix77.imat";
connectAttr "l_ball.wm" "multMatrix22.i[0]";
connectAttr "l_base_outJoint.pim" "multMatrix22.i[1]";
connectAttr "l_eye_joint.wm" "multMatrix23.i[0]";
connectAttr "l_outJoint.pim" "multMatrix23.i[1]";
connectAttr "r_eye_joint.wm" "multMatrix24.i[0]";
connectAttr "r_outJoint.pim" "multMatrix24.i[1]";
connectAttr "composeMatrix3.omat" "multMatrix24.i[2]";
connectAttr "root_connector.wm" "multMatrix25.i[0]";
connectAttr "root_outJoint.pim" "multMatrix25.i[1]";
connectAttr "multMatrix25.o" "decomposeMatrix78.imat";
connectAttr "l_look_fkShape.ws" "transformGeometry1.ig";
connectAttr "composeMatrix2.omat" "transformGeometry1.txf";
connectAttr "l_look_ikShape.ws" "transformGeometry2.ig";
connectAttr "composeMatrix2.omat" "transformGeometry2.txf";
connectAttr "blendShape4.mlpr" "shapeEditorManager.bspr[0]";
connectAttr "blendShape5.mlpr" "shapeEditorManager.bspr[1]";
connectAttr "blendShape1.mlpr" "shapeEditorManager.bspr[4]";
connectAttr "blendShape2.mlpr" "shapeEditorManager.bspr[5]";
connectAttr "unitConversion6.o" "eulerToQuat3.irx";
connectAttr "addDoubleLinear9.o" "multDoubleLinear5.i1";
connectAttr "reverse2.ox" "multDoubleLinear6.i1";
connectAttr "clamp6.opr" "reverse2.ix";
connectAttr "addDoubleLinear3.o" "unitConversion6.i";
connectAttr "unitConversion7.o" "eulerToQuat4.irx";
connectAttr "multDoubleLinear10.o" "addDoubleLinear1.i1";
connectAttr "addDoubleLinear1.o" "unitConversion7.i";
connectAttr "addDoubleLinear2.o" "unitConversion8.i";
connectAttr "unitConversion8.o" "eulerToQuat5.irx";
connectAttr "multDoubleLinear11.o" "addDoubleLinear2.i1";
connectAttr "multDoubleLinear9.o" "addDoubleLinear3.i1";
connectAttr "unitConversion9.o" "eulerToQuat6.irx";
connectAttr "multDoubleLinear7.o" "addDoubleLinear4.i1";
connectAttr "addDoubleLinear4.o" "unitConversion9.i";
connectAttr "multDoubleLinear6.o" "addDoubleLinear5.i1";
connectAttr "addDoubleLinear5.o" "unitConversion10.i";
connectAttr "unitConversion10.o" "eulerToQuat7.irx";
connectAttr "unitConversion11.o" "eulerToQuat8.irx";
connectAttr "addDoubleLinear6.o" "unitConversion11.i";
connectAttr "multDoubleLinear8.o" "addDoubleLinear6.i1";
connectAttr "reverse2.ox" "multDoubleLinear7.i1";
connectAttr "reverse2.ox" "multDoubleLinear8.i1";
connectAttr "reverse2.ox" "multDoubleLinear9.i1";
connectAttr "reverse2.ox" "multDoubleLinear10.i1";
connectAttr "reverse2.ox" "multDoubleLinear11.i1";
connectAttr "eulerToQuat7.oqw" "multDoubleLinear12.i1";
connectAttr "multDoubleLinear13.o" "addDoubleLinear7.i1";
connectAttr "reverse2.ox" "multDoubleLinear13.i1";
connectAttr "addDoubleLinear7.o" "unitConversion12.i";
connectAttr "unitConversion12.o" "eulerToQuat9.irx";
connectAttr "unitConversion13.o" "eulerToQuat10.irx";
connectAttr "addDoubleLinear8.o" "unitConversion13.i";
connectAttr "reverse2.ox" "multDoubleLinear14.i1";
connectAttr "multDoubleLinear14.o" "addDoubleLinear8.i1";
connectAttr "l_slideJoint_5.msg" "bindPose1.m[0]";
connectAttr "l_slideJoint_6.msg" "bindPose1.m[1]";
connectAttr "l_slideJoint_4.msg" "bindPose1.m[2]";
connectAttr "l_slideJoint_7.msg" "bindPose1.m[3]";
connectAttr "l_slideJoint_8.msg" "bindPose1.m[4]";
connectAttr "ext_slideJoint_9.msg" "bindPose1.m[6]";
connectAttr "l_slideJoint_1.msg" "bindPose1.m[7]";
connectAttr "l_slideJoint_2.msg" "bindPose1.m[8]";
connectAttr "l_slideJoint_3.msg" "bindPose1.m[9]";
connectAttr "int_slideJoint_9.msg" "bindPose1.m[11]";
connectAttr "mod.msg" "bindPose1.m[12]";
connectAttr "system.msg" "bindPose1.m[13]";
connectAttr "l_slideJoints.msg" "bindPose1.m[14]";
connectAttr "l_slideJoint_9.msg" "bindPose1.m[15]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.w" "bindPose1.p[1]";
connectAttr "bindPose1.w" "bindPose1.p[2]";
connectAttr "bindPose1.w" "bindPose1.p[3]";
connectAttr "bindPose1.w" "bindPose1.p[4]";
connectAttr "bindPose1.w" "bindPose1.p[5]";
connectAttr "bindPose1.m[15]" "bindPose1.p[6]";
connectAttr "bindPose1.m[14]" "bindPose1.p[7]";
connectAttr "bindPose1.w" "bindPose1.p[8]";
connectAttr "bindPose1.w" "bindPose1.p[9]";
connectAttr "bindPose1.m[5]" "bindPose1.p[11]";
connectAttr "bindPose1.w" "bindPose1.p[12]";
connectAttr "mod.msg" "bindPose1.p[13]";
connectAttr "system.msg" "bindPose1.p[14]";
connectAttr "l_slideJoints.msg" "bindPose1.p[15]";
connectAttr "l_slideJoint_5.bps" "bindPose1.wm[0]";
connectAttr "l_slideJoint_6.bps" "bindPose1.wm[1]";
connectAttr "l_slideJoint_4.bps" "bindPose1.wm[2]";
connectAttr "l_slideJoint_7.bps" "bindPose1.wm[3]";
connectAttr "l_slideJoint_8.bps" "bindPose1.wm[4]";
connectAttr "ext_slideJoint_9.bps" "bindPose1.wm[6]";
connectAttr "l_slideJoint_1.bps" "bindPose1.wm[7]";
connectAttr "l_slideJoint_2.bps" "bindPose1.wm[8]";
connectAttr "l_slideJoint_3.bps" "bindPose1.wm[9]";
connectAttr "int_slideJoint_9.bps" "bindPose1.wm[11]";
connectAttr "l_slideJoint_9.bps" "bindPose1.wm[15]";
connectAttr "blendShape1.og[0]" "skinCluster3.ip[0].ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3.ip[0].gi";
connectAttr "bindPose2.msg" "skinCluster3.bp";
connectAttr "l_slideJoint_5.wm" "skinCluster3.ma[0]";
connectAttr "l_slideJoint_6.wm" "skinCluster3.ma[1]";
connectAttr "l_slideJoint_4.wm" "skinCluster3.ma[2]";
connectAttr "l_slideJoint_7.wm" "skinCluster3.ma[3]";
connectAttr "l_slideJoint_8.wm" "skinCluster3.ma[4]";
connectAttr "l_slideJoint_1.wm" "skinCluster3.ma[6]";
connectAttr "ext_slideJoint_9.wm" "skinCluster3.ma[7]";
connectAttr "l_slideJoint_2.wm" "skinCluster3.ma[8]";
connectAttr "l_slideJoint_3.wm" "skinCluster3.ma[9]";
connectAttr "int_slideJoint_9.wm" "skinCluster3.ma[11]";
connectAttr "l_slideJoint_9.wm" "skinCluster3.ma[12]";
connectAttr "l_slideJoint_5.liw" "skinCluster3.lw[0]";
connectAttr "l_slideJoint_6.liw" "skinCluster3.lw[1]";
connectAttr "l_slideJoint_4.liw" "skinCluster3.lw[2]";
connectAttr "l_slideJoint_7.liw" "skinCluster3.lw[3]";
connectAttr "l_slideJoint_8.liw" "skinCluster3.lw[4]";
connectAttr "l_slideJoint_1.liw" "skinCluster3.lw[6]";
connectAttr "ext_slideJoint_9.liw" "skinCluster3.lw[7]";
connectAttr "l_slideJoint_2.liw" "skinCluster3.lw[8]";
connectAttr "l_slideJoint_3.liw" "skinCluster3.lw[9]";
connectAttr "int_slideJoint_9.liw" "skinCluster3.lw[11]";
connectAttr "l_slideJoint_9.liw" "skinCluster3.lw[12]";
connectAttr "l_slideJoint_5.obcc" "skinCluster3.ifcl[0]";
connectAttr "l_slideJoint_6.obcc" "skinCluster3.ifcl[1]";
connectAttr "l_slideJoint_4.obcc" "skinCluster3.ifcl[2]";
connectAttr "l_slideJoint_7.obcc" "skinCluster3.ifcl[3]";
connectAttr "l_slideJoint_8.obcc" "skinCluster3.ifcl[4]";
connectAttr "l_slideJoint_1.obcc" "skinCluster3.ifcl[6]";
connectAttr "ext_slideJoint_9.obcc" "skinCluster3.ifcl[7]";
connectAttr "l_slideJoint_2.obcc" "skinCluster3.ifcl[8]";
connectAttr "l_slideJoint_3.obcc" "skinCluster3.ifcl[9]";
connectAttr "int_slideJoint_9.obcc" "skinCluster3.ifcl[11]";
connectAttr "l_slideJoint_9.obcc" "skinCluster3.ifcl[12]";
connectAttr "groupParts6.og" "tweak3.ip[0].ig";
connectAttr "groupId7.id" "tweak3.ip[0].gi";
connectAttr "skinCluster3GroupId.msg" "skinCluster3Set.gn" -na;
connectAttr "l_eyeballShape.iog.og[3]" "skinCluster3Set.dsm" -na;
connectAttr "skinCluster3.msg" "skinCluster3Set.ub[0]";
connectAttr "tweak3.og[0]" "skinCluster3GroupParts.ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3GroupParts.gi";
connectAttr "groupId7.msg" "tweakSet3.gn" -na;
connectAttr "l_eyeballShape.iog.og[4]" "tweakSet3.dsm" -na;
connectAttr "tweak3.msg" "tweakSet3.ub[0]";
connectAttr "l_eyeballShapeOrig.w" "groupParts6.ig";
connectAttr "groupId7.id" "groupParts6.gi";
connectAttr "l_slideJoint_5.msg" "bindPose2.m[0]";
connectAttr "l_slideJoint_6.msg" "bindPose2.m[1]";
connectAttr "l_slideJoint_4.msg" "bindPose2.m[2]";
connectAttr "l_slideJoint_7.msg" "bindPose2.m[3]";
connectAttr "l_slideJoint_8.msg" "bindPose2.m[4]";
connectAttr "l_slideJoint_1.msg" "bindPose2.m[6]";
connectAttr "ext_slideJoint_9.msg" "bindPose2.m[7]";
connectAttr "l_slideJoint_2.msg" "bindPose2.m[8]";
connectAttr "l_slideJoint_3.msg" "bindPose2.m[9]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.w" "bindPose2.p[1]";
connectAttr "bindPose2.w" "bindPose2.p[2]";
connectAttr "bindPose2.w" "bindPose2.p[3]";
connectAttr "bindPose2.w" "bindPose2.p[4]";
connectAttr "bindPose2.w" "bindPose2.p[5]";
connectAttr "bindPose2.w" "bindPose2.p[6]";
connectAttr "bindPose2.m[5]" "bindPose2.p[7]";
connectAttr "bindPose2.w" "bindPose2.p[8]";
connectAttr "bindPose2.w" "bindPose2.p[9]";
connectAttr "skinCluster5GroupParts.og" "skinCluster5.ip[0].ig";
connectAttr "skinCluster5GroupId.id" "skinCluster5.ip[0].gi";
connectAttr "l_slideJoint_5.wm" "skinCluster5.ma[0]";
connectAttr "l_slideJoint_6.wm" "skinCluster5.ma[1]";
connectAttr "l_slideJoint_4.wm" "skinCluster5.ma[2]";
connectAttr "l_slideJoint_7.wm" "skinCluster5.ma[3]";
connectAttr "l_slideJoint_8.wm" "skinCluster5.ma[4]";
connectAttr "l_slideJoint_9.wm" "skinCluster5.ma[5]";
connectAttr "l_slideJoint_1.wm" "skinCluster5.ma[6]";
connectAttr "ext_slideJoint_9.wm" "skinCluster5.ma[7]";
connectAttr "l_slideJoint_2.wm" "skinCluster5.ma[8]";
connectAttr "l_slideJoint_3.wm" "skinCluster5.ma[9]";
connectAttr "int_slideJoint_9.wm" "skinCluster5.ma[10]";
connectAttr "l_slideJoint_5.liw" "skinCluster5.lw[0]";
connectAttr "l_slideJoint_6.liw" "skinCluster5.lw[1]";
connectAttr "l_slideJoint_4.liw" "skinCluster5.lw[2]";
connectAttr "l_slideJoint_7.liw" "skinCluster5.lw[3]";
connectAttr "l_slideJoint_8.liw" "skinCluster5.lw[4]";
connectAttr "l_slideJoint_9.liw" "skinCluster5.lw[5]";
connectAttr "l_slideJoint_1.liw" "skinCluster5.lw[6]";
connectAttr "ext_slideJoint_9.liw" "skinCluster5.lw[7]";
connectAttr "l_slideJoint_2.liw" "skinCluster5.lw[8]";
connectAttr "l_slideJoint_3.liw" "skinCluster5.lw[9]";
connectAttr "int_slideJoint_9.liw" "skinCluster5.lw[10]";
connectAttr "l_slideJoint_5.obcc" "skinCluster5.ifcl[0]";
connectAttr "l_slideJoint_6.obcc" "skinCluster5.ifcl[1]";
connectAttr "l_slideJoint_4.obcc" "skinCluster5.ifcl[2]";
connectAttr "l_slideJoint_7.obcc" "skinCluster5.ifcl[3]";
connectAttr "l_slideJoint_8.obcc" "skinCluster5.ifcl[4]";
connectAttr "l_slideJoint_9.obcc" "skinCluster5.ifcl[5]";
connectAttr "l_slideJoint_1.obcc" "skinCluster5.ifcl[6]";
connectAttr "ext_slideJoint_9.obcc" "skinCluster5.ifcl[7]";
connectAttr "l_slideJoint_2.obcc" "skinCluster5.ifcl[8]";
connectAttr "l_slideJoint_3.obcc" "skinCluster5.ifcl[9]";
connectAttr "int_slideJoint_9.obcc" "skinCluster5.ifcl[10]";
connectAttr "bindPose2.msg" "skinCluster5.bp";
connectAttr "groupParts11.og" "tweak5.ip[0].ig";
connectAttr "groupId12.id" "tweak5.ip[0].gi";
connectAttr "skinCluster5GroupId.msg" "skinCluster5Set.gn" -na;
connectAttr "l_glassShape.iog.og[3]" "skinCluster5Set.dsm" -na;
connectAttr "skinCluster5.msg" "skinCluster5Set.ub[0]";
connectAttr "tweak5.og[0]" "skinCluster5GroupParts.ig";
connectAttr "skinCluster5GroupId.id" "skinCluster5GroupParts.gi";
connectAttr "groupId12.msg" "tweakSet5.gn" -na;
connectAttr "l_glassShape.iog.og[4]" "tweakSet5.dsm" -na;
connectAttr "tweak5.msg" "tweakSet5.ub[0]";
connectAttr "l_glassShapeOrig1.w" "groupParts11.ig";
connectAttr "groupId12.id" "groupParts11.gi";
connectAttr "blendShape1GroupParts.og" "blendShape1.ip[0].ig";
connectAttr "blendShape1GroupId.id" "blendShape1.ip[0].gi";
connectAttr "shapeEditorManager.obsv[4]" "blendShape1.tgdt[0].dpvs";
connectAttr "clamp5.opr" "blendShape1.w[0]";
connectAttr "multDoubleLinear15.o" "blendShape1.w[1]";
connectAttr "blendTwoAttr1.o" "blendShape1.w[2]";
connectAttr "blendShape1GroupId.msg" "blendShape1Set.gn" -na;
connectAttr "l_eyeballShape.iog.og[7]" "blendShape1Set.dsm" -na;
connectAttr "blendShape1.msg" "blendShape1Set.ub[0]";
connectAttr "skinCluster3GroupParts.og" "blendShape1GroupParts.ig";
connectAttr "blendShape1GroupId.id" "blendShape1GroupParts.gi";
connectAttr "clamp5.opg" "multDoubleLinear15.i1";
connectAttr "addDoubleLinear26.o" "clamp5.ipr";
connectAttr "addDoubleLinear26.o" "clamp5.ipg";
connectAttr "addDoubleLinear20.o" "addDoubleLinear9.i1";
connectAttr "control.deep" "multDoubleLinear16.i1";
connectAttr "multDoubleLinear5.o" "clamp6.ipr";
connectAttr "unitConversion15.o" "eulerToQuat12.irx";
connectAttr "addDoubleLinear18.o" "multDoubleLinear20.i1";
connectAttr "reverse41.ox" "multDoubleLinear21.i1";
connectAttr "clamp8.opr" "reverse41.ix";
connectAttr "addDoubleLinear12.o" "unitConversion15.i";
connectAttr "unitConversion16.o" "eulerToQuat13.irx";
connectAttr "multDoubleLinear25.o" "addDoubleLinear10.i1";
connectAttr "addDoubleLinear10.o" "unitConversion16.i";
connectAttr "addDoubleLinear11.o" "unitConversion17.i";
connectAttr "unitConversion17.o" "eulerToQuat14.irx";
connectAttr "multDoubleLinear26.o" "addDoubleLinear11.i1";
connectAttr "multDoubleLinear24.o" "addDoubleLinear12.i1";
connectAttr "unitConversion18.o" "eulerToQuat15.irx";
connectAttr "multDoubleLinear22.o" "addDoubleLinear13.i1";
connectAttr "addDoubleLinear13.o" "unitConversion18.i";
connectAttr "multDoubleLinear21.o" "addDoubleLinear14.i1";
connectAttr "addDoubleLinear14.o" "unitConversion19.i";
connectAttr "unitConversion19.o" "eulerToQuat16.irx";
connectAttr "unitConversion20.o" "eulerToQuat17.irx";
connectAttr "addDoubleLinear15.o" "unitConversion20.i";
connectAttr "multDoubleLinear23.o" "addDoubleLinear15.i1";
connectAttr "reverse41.ox" "multDoubleLinear22.i1";
connectAttr "reverse41.ox" "multDoubleLinear23.i1";
connectAttr "reverse41.ox" "multDoubleLinear24.i1";
connectAttr "reverse41.ox" "multDoubleLinear25.i1";
connectAttr "reverse41.ox" "multDoubleLinear26.i1";
connectAttr "eulerToQuat16.oqw" "multDoubleLinear27.i1";
connectAttr "multDoubleLinear28.o" "addDoubleLinear16.i1";
connectAttr "reverse41.ox" "multDoubleLinear28.i1";
connectAttr "addDoubleLinear16.o" "unitConversion21.i";
connectAttr "unitConversion21.o" "eulerToQuat18.irx";
connectAttr "unitConversion22.o" "eulerToQuat19.irx";
connectAttr "addDoubleLinear17.o" "unitConversion22.i";
connectAttr "reverse41.ox" "multDoubleLinear29.i1";
connectAttr "multDoubleLinear29.o" "addDoubleLinear17.i1";
connectAttr "r_slideJoint_5.msg" "bindPose3.m[0]";
connectAttr "r_slideJoint_6.msg" "bindPose3.m[1]";
connectAttr "r_slideJoint_4.msg" "bindPose3.m[2]";
connectAttr "r_slideJoint_7.msg" "bindPose3.m[3]";
connectAttr "r_slideJoint_8.msg" "bindPose3.m[4]";
connectAttr "r_ext_slideJoint_9.msg" "bindPose3.m[6]";
connectAttr "r_slideJoint_1.msg" "bindPose3.m[7]";
connectAttr "r_slideJoint_2.msg" "bindPose3.m[8]";
connectAttr "r_slideJoint_3.msg" "bindPose3.m[9]";
connectAttr "r_int_slideJoint_9.msg" "bindPose3.m[11]";
connectAttr "mod.msg" "bindPose3.m[12]";
connectAttr "system.msg" "bindPose3.m[13]";
connectAttr "r_slideJoints.msg" "bindPose3.m[14]";
connectAttr "r_slideJoint_9.msg" "bindPose3.m[15]";
connectAttr "bindPose3.w" "bindPose3.p[0]";
connectAttr "bindPose3.w" "bindPose3.p[1]";
connectAttr "bindPose3.w" "bindPose3.p[2]";
connectAttr "bindPose3.w" "bindPose3.p[3]";
connectAttr "bindPose3.w" "bindPose3.p[4]";
connectAttr "bindPose3.w" "bindPose3.p[5]";
connectAttr "bindPose3.m[15]" "bindPose3.p[6]";
connectAttr "bindPose3.m[14]" "bindPose3.p[7]";
connectAttr "bindPose3.w" "bindPose3.p[8]";
connectAttr "bindPose3.w" "bindPose3.p[9]";
connectAttr "bindPose3.m[5]" "bindPose3.p[11]";
connectAttr "bindPose3.w" "bindPose3.p[12]";
connectAttr "mod.msg" "bindPose3.p[13]";
connectAttr "system.msg" "bindPose3.p[14]";
connectAttr "r_slideJoints.msg" "bindPose3.p[15]";
connectAttr "r_slideJoint_5.bps" "bindPose3.wm[0]";
connectAttr "r_slideJoint_6.bps" "bindPose3.wm[1]";
connectAttr "r_slideJoint_4.bps" "bindPose3.wm[2]";
connectAttr "r_slideJoint_7.bps" "bindPose3.wm[3]";
connectAttr "r_slideJoint_8.bps" "bindPose3.wm[4]";
connectAttr "r_ext_slideJoint_9.bps" "bindPose3.wm[6]";
connectAttr "r_slideJoint_1.bps" "bindPose3.wm[7]";
connectAttr "r_slideJoint_2.bps" "bindPose3.wm[8]";
connectAttr "r_slideJoint_3.bps" "bindPose3.wm[9]";
connectAttr "r_int_slideJoint_9.bps" "bindPose3.wm[11]";
connectAttr "r_slideJoint_9.bps" "bindPose3.wm[15]";
connectAttr "blendShape2.og[0]" "skinCluster6.ip[0].ig";
connectAttr "skinCluster3GroupId1.id" "skinCluster6.ip[0].gi";
connectAttr "bindPose4.msg" "skinCluster6.bp";
connectAttr "r_slideJoint_5.wm" "skinCluster6.ma[0]";
connectAttr "r_slideJoint_6.wm" "skinCluster6.ma[1]";
connectAttr "r_slideJoint_4.wm" "skinCluster6.ma[2]";
connectAttr "r_slideJoint_7.wm" "skinCluster6.ma[3]";
connectAttr "r_slideJoint_8.wm" "skinCluster6.ma[4]";
connectAttr "r_slideJoint_1.wm" "skinCluster6.ma[6]";
connectAttr "r_ext_slideJoint_9.wm" "skinCluster6.ma[7]";
connectAttr "r_slideJoint_2.wm" "skinCluster6.ma[8]";
connectAttr "r_slideJoint_3.wm" "skinCluster6.ma[9]";
connectAttr "r_int_slideJoint_9.wm" "skinCluster6.ma[11]";
connectAttr "r_slideJoint_9.wm" "skinCluster6.ma[12]";
connectAttr "r_slideJoint_5.liw" "skinCluster6.lw[0]";
connectAttr "r_slideJoint_6.liw" "skinCluster6.lw[1]";
connectAttr "r_slideJoint_4.liw" "skinCluster6.lw[2]";
connectAttr "r_slideJoint_7.liw" "skinCluster6.lw[3]";
connectAttr "r_slideJoint_8.liw" "skinCluster6.lw[4]";
connectAttr "r_slideJoint_1.liw" "skinCluster6.lw[6]";
connectAttr "r_ext_slideJoint_9.liw" "skinCluster6.lw[7]";
connectAttr "r_slideJoint_2.liw" "skinCluster6.lw[8]";
connectAttr "r_slideJoint_3.liw" "skinCluster6.lw[9]";
connectAttr "r_int_slideJoint_9.liw" "skinCluster6.lw[11]";
connectAttr "r_slideJoint_9.liw" "skinCluster6.lw[12]";
connectAttr "r_slideJoint_5.obcc" "skinCluster6.ifcl[0]";
connectAttr "r_slideJoint_6.obcc" "skinCluster6.ifcl[1]";
connectAttr "r_slideJoint_4.obcc" "skinCluster6.ifcl[2]";
connectAttr "r_slideJoint_7.obcc" "skinCluster6.ifcl[3]";
connectAttr "r_slideJoint_8.obcc" "skinCluster6.ifcl[4]";
connectAttr "r_slideJoint_1.obcc" "skinCluster6.ifcl[6]";
connectAttr "r_ext_slideJoint_9.obcc" "skinCluster6.ifcl[7]";
connectAttr "r_slideJoint_2.obcc" "skinCluster6.ifcl[8]";
connectAttr "r_slideJoint_3.obcc" "skinCluster6.ifcl[9]";
connectAttr "r_int_slideJoint_9.obcc" "skinCluster6.ifcl[11]";
connectAttr "r_slideJoint_9.obcc" "skinCluster6.ifcl[12]";
connectAttr "groupParts620.og" "tweak174.ip[0].ig";
connectAttr "groupId1741.id" "tweak174.ip[0].gi";
connectAttr "skinCluster3GroupId1.msg" "skinCluster3Set1.gn" -na;
connectAttr "r_eyeballShape.iog.og[3]" "skinCluster3Set1.dsm" -na;
connectAttr "skinCluster6.msg" "skinCluster3Set1.ub[0]";
connectAttr "tweak174.og[0]" "skinCluster3GroupParts1.ig";
connectAttr "skinCluster3GroupId1.id" "skinCluster3GroupParts1.gi";
connectAttr "groupId1741.msg" "tweakSet213.gn" -na;
connectAttr "r_eyeballShape.iog.og[4]" "tweakSet213.dsm" -na;
connectAttr "tweak174.msg" "tweakSet213.ub[0]";
connectAttr "r_eyeballShapeOrig.w" "groupParts620.ig";
connectAttr "groupId1741.id" "groupParts620.gi";
connectAttr "r_slideJoint_5.msg" "bindPose4.m[0]";
connectAttr "r_slideJoint_6.msg" "bindPose4.m[1]";
connectAttr "r_slideJoint_4.msg" "bindPose4.m[2]";
connectAttr "r_slideJoint_7.msg" "bindPose4.m[3]";
connectAttr "r_slideJoint_8.msg" "bindPose4.m[4]";
connectAttr "r_slideJoint_1.msg" "bindPose4.m[6]";
connectAttr "r_ext_slideJoint_9.msg" "bindPose4.m[7]";
connectAttr "r_slideJoint_2.msg" "bindPose4.m[8]";
connectAttr "r_slideJoint_3.msg" "bindPose4.m[9]";
connectAttr "bindPose4.w" "bindPose4.p[0]";
connectAttr "bindPose4.w" "bindPose4.p[1]";
connectAttr "bindPose4.w" "bindPose4.p[2]";
connectAttr "bindPose4.w" "bindPose4.p[3]";
connectAttr "bindPose4.w" "bindPose4.p[4]";
connectAttr "bindPose4.w" "bindPose4.p[5]";
connectAttr "bindPose4.w" "bindPose4.p[6]";
connectAttr "bindPose4.m[5]" "bindPose4.p[7]";
connectAttr "bindPose4.w" "bindPose4.p[8]";
connectAttr "bindPose4.w" "bindPose4.p[9]";
connectAttr "skinCluster5GroupParts1.og" "skinCluster7.ip[0].ig";
connectAttr "skinCluster5GroupId1.id" "skinCluster7.ip[0].gi";
connectAttr "r_slideJoint_5.wm" "skinCluster7.ma[0]";
connectAttr "r_slideJoint_6.wm" "skinCluster7.ma[1]";
connectAttr "r_slideJoint_4.wm" "skinCluster7.ma[2]";
connectAttr "r_slideJoint_7.wm" "skinCluster7.ma[3]";
connectAttr "r_slideJoint_8.wm" "skinCluster7.ma[4]";
connectAttr "r_slideJoint_9.wm" "skinCluster7.ma[5]";
connectAttr "r_slideJoint_1.wm" "skinCluster7.ma[6]";
connectAttr "r_ext_slideJoint_9.wm" "skinCluster7.ma[7]";
connectAttr "r_slideJoint_2.wm" "skinCluster7.ma[8]";
connectAttr "r_slideJoint_3.wm" "skinCluster7.ma[9]";
connectAttr "r_int_slideJoint_9.wm" "skinCluster7.ma[10]";
connectAttr "r_slideJoint_5.liw" "skinCluster7.lw[0]";
connectAttr "r_slideJoint_6.liw" "skinCluster7.lw[1]";
connectAttr "r_slideJoint_4.liw" "skinCluster7.lw[2]";
connectAttr "r_slideJoint_7.liw" "skinCluster7.lw[3]";
connectAttr "r_slideJoint_8.liw" "skinCluster7.lw[4]";
connectAttr "r_slideJoint_9.liw" "skinCluster7.lw[5]";
connectAttr "r_slideJoint_1.liw" "skinCluster7.lw[6]";
connectAttr "r_ext_slideJoint_9.liw" "skinCluster7.lw[7]";
connectAttr "r_slideJoint_2.liw" "skinCluster7.lw[8]";
connectAttr "r_slideJoint_3.liw" "skinCluster7.lw[9]";
connectAttr "r_int_slideJoint_9.liw" "skinCluster7.lw[10]";
connectAttr "r_slideJoint_5.obcc" "skinCluster7.ifcl[0]";
connectAttr "r_slideJoint_6.obcc" "skinCluster7.ifcl[1]";
connectAttr "r_slideJoint_4.obcc" "skinCluster7.ifcl[2]";
connectAttr "r_slideJoint_7.obcc" "skinCluster7.ifcl[3]";
connectAttr "r_slideJoint_8.obcc" "skinCluster7.ifcl[4]";
connectAttr "r_slideJoint_9.obcc" "skinCluster7.ifcl[5]";
connectAttr "r_slideJoint_1.obcc" "skinCluster7.ifcl[6]";
connectAttr "r_ext_slideJoint_9.obcc" "skinCluster7.ifcl[7]";
connectAttr "r_slideJoint_2.obcc" "skinCluster7.ifcl[8]";
connectAttr "r_slideJoint_3.obcc" "skinCluster7.ifcl[9]";
connectAttr "r_int_slideJoint_9.obcc" "skinCluster7.ifcl[10]";
connectAttr "bindPose4.msg" "skinCluster7.bp";
connectAttr "groupParts622.og" "tweak175.ip[0].ig";
connectAttr "groupId1743.id" "tweak175.ip[0].gi";
connectAttr "skinCluster5GroupId1.msg" "skinCluster5Set1.gn" -na;
connectAttr "r_glassShape.iog.og[3]" "skinCluster5Set1.dsm" -na;
connectAttr "skinCluster7.msg" "skinCluster5Set1.ub[0]";
connectAttr "tweak175.og[0]" "skinCluster5GroupParts1.ig";
connectAttr "skinCluster5GroupId1.id" "skinCluster5GroupParts1.gi";
connectAttr "groupId1743.msg" "tweakSet214.gn" -na;
connectAttr "r_glassShape.iog.og[4]" "tweakSet214.dsm" -na;
connectAttr "tweak175.msg" "tweakSet214.ub[0]";
connectAttr "r_glassShapeOrig1.w" "groupParts622.ig";
connectAttr "groupId1743.id" "groupParts622.gi";
connectAttr "blendShape1GroupParts1.og" "blendShape2.ip[0].ig";
connectAttr "blendShape1GroupId1.id" "blendShape2.ip[0].gi";
connectAttr "shapeEditorManager.obsv[5]" "blendShape2.tgdt[0].dpvs";
connectAttr "clamp7.opr" "blendShape2.w[0]";
connectAttr "multDoubleLinear30.o" "blendShape2.w[1]";
connectAttr "blendTwoAttr2.o" "blendShape2.w[2]";
connectAttr "blendShape1GroupId1.msg" "blendShape1Set1.gn" -na;
connectAttr "r_eyeballShape.iog.og[7]" "blendShape1Set1.dsm" -na;
connectAttr "blendShape2.msg" "blendShape1Set1.ub[0]";
connectAttr "skinCluster3GroupParts1.og" "blendShape1GroupParts1.ig";
connectAttr "blendShape1GroupId1.id" "blendShape1GroupParts1.gi";
connectAttr "clamp7.opg" "multDoubleLinear30.i1";
connectAttr "addDoubleLinear23.o" "clamp7.ipr";
connectAttr "addDoubleLinear23.o" "clamp7.ipg";
connectAttr "addDoubleLinear24.o" "addDoubleLinear18.i1";
connectAttr "control.deep" "multDoubleLinear31.i1";
connectAttr "multDoubleLinear20.o" "clamp8.ipr";
connectAttr "blendColors1.opr" "addDoubleLinear20.i1";
connectAttr "control.initIrisSize" "addDoubleLinear20.i2";
connectAttr "blendColors2.opg" "addDoubleLinear22.i1";
connectAttr "control.initPupilSize" "addDoubleLinear22.i2";
connectAttr "addDoubleLinear22.o" "addDoubleLinear23.i1";
connectAttr "control.initIrisSize" "addDoubleLinear24.i1";
connectAttr "blendColors2.opr" "addDoubleLinear24.i2";
connectAttr "end_poser.m" "multMatrix26.i[0]";
connectAttr "composeMatrix4.omat" "multMatrix26.i[1]";
connectAttr "multMatrix26.o" "decomposeMatrix79.imat";
connectAttr "clamp5.opr" "blendTwoAttr1.ab";
connectAttr "multDoubleLinear16.o" "blendTwoAttr1.i[0]";
connectAttr "clamp5.opb" "blendTwoAttr1.i[1]";
connectAttr "clamp7.opr" "blendTwoAttr2.ab";
connectAttr "multDoubleLinear31.o" "blendTwoAttr2.i[0]";
connectAttr "clamp7.opb" "blendTwoAttr2.i[1]";
connectAttr "ramp1.oc" "eyeball_mat.c";
connectAttr "eyeball_mat.oc" "blinn1SG.ss";
connectAttr "l_eyeballShape.iog" "blinn1SG.dsm" -na;
connectAttr "r_eyeballShape.iog" "blinn1SG.dsm" -na;
connectAttr "blinn1SG.msg" "materialInfo1.sg";
connectAttr "eyeball_mat.msg" "materialInfo1.m";
connectAttr "ramp1.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.o" "ramp1.uv";
connectAttr "place2dTexture1.ofs" "ramp1.fs";
connectAttr "glass_mat.oc" "blinn2SG.ss";
connectAttr "l_glassShape.iog" "blinn2SG.dsm" -na;
connectAttr "r_glassShape.iog" "blinn2SG.dsm" -na;
connectAttr "blinn2SG.msg" "materialInfo2.sg";
connectAttr "glass_mat.msg" "materialInfo2.m";
connectAttr "black_mat.oc" "lambert2SG.ss";
connectAttr "l_pupilShape.iog" "lambert2SG.dsm" -na;
connectAttr "r_pupilShape.iog" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo3.sg";
connectAttr "black_mat.msg" "materialInfo3.m";
connectAttr "blendShape4GroupParts.og" "blendShape4.ip[0].ig";
connectAttr "blendShape4GroupId.id" "blendShape4.ip[0].gi";
connectAttr "shapeEditorManager.obsv[0]" "blendShape4.tgdt[0].dpvs";
connectAttr "clamp5.opr" "blendShape4.w[0]";
connectAttr "multDoubleLinear15.o" "blendShape4.w[1]";
connectAttr "blendTwoAttr1.o" "blendShape4.w[2]";
connectAttr "groupParts630.og" "tweak178.ip[0].ig";
connectAttr "groupId1751.id" "tweak178.ip[0].gi";
connectAttr "blendShape4GroupId.msg" "blendShape4Set.gn" -na;
connectAttr "l_pupilShape.iog.og[4]" "blendShape4Set.dsm" -na;
connectAttr "blendShape4.msg" "blendShape4Set.ub[0]";
connectAttr "tweak178.og[0]" "blendShape4GroupParts.ig";
connectAttr "blendShape4GroupId.id" "blendShape4GroupParts.gi";
connectAttr "groupId1751.msg" "tweakSet217.gn" -na;
connectAttr "l_pupilShape.iog.og[5]" "tweakSet217.dsm" -na;
connectAttr "tweak178.msg" "tweakSet217.ub[0]";
connectAttr "l_pupilShapeOrig1.w" "groupParts630.ig";
connectAttr "groupId1751.id" "groupParts630.gi";
connectAttr "skinCluster8GroupParts.og" "skinCluster8.ip[0].ig";
connectAttr "skinCluster8GroupId.id" "skinCluster8.ip[0].gi";
connectAttr "int_slideJoint_9.wm" "skinCluster8.ma[0]";
connectAttr "int_slideJoint_9.liw" "skinCluster8.lw[0]";
connectAttr "int_slideJoint_9.obcc" "skinCluster8.ifcl[0]";
connectAttr "bindPose1.msg" "skinCluster8.bp";
connectAttr "skinCluster8GroupId.msg" "skinCluster8Set.gn" -na;
connectAttr "l_pupilShape.iog.og[6]" "skinCluster8Set.dsm" -na;
connectAttr "skinCluster8.msg" "skinCluster8Set.ub[0]";
connectAttr "blendShape4.og[0]" "skinCluster8GroupParts.ig";
connectAttr "skinCluster8GroupId.id" "skinCluster8GroupParts.gi";
connectAttr "blendShape5GroupParts.og" "blendShape5.ip[0].ig";
connectAttr "blendShape5GroupId.id" "blendShape5.ip[0].gi";
connectAttr "shapeEditorManager.obsv[1]" "blendShape5.tgdt[0].dpvs";
connectAttr "clamp7.opr" "blendShape5.w[0]";
connectAttr "multDoubleLinear30.o" "blendShape5.w[1]";
connectAttr "blendTwoAttr2.o" "blendShape5.w[2]";
connectAttr "groupParts632.og" "tweak179.ip[0].ig";
connectAttr "groupId1753.id" "tweak179.ip[0].gi";
connectAttr "blendShape5GroupId.msg" "blendShape5Set.gn" -na;
connectAttr "r_pupilShape.iog.og[6]" "blendShape5Set.dsm" -na;
connectAttr "blendShape5.msg" "blendShape5Set.ub[0]";
connectAttr "tweak179.og[0]" "blendShape5GroupParts.ig";
connectAttr "blendShape5GroupId.id" "blendShape5GroupParts.gi";
connectAttr "groupId1753.msg" "tweakSet218.gn" -na;
connectAttr "r_pupilShape.iog.og[7]" "tweakSet218.dsm" -na;
connectAttr "tweak179.msg" "tweakSet218.ub[0]";
connectAttr "r_pupilShapeOrig1.w" "groupParts632.ig";
connectAttr "groupId1753.id" "groupParts632.gi";
connectAttr "skinCluster9GroupParts.og" "skinCluster9.ip[0].ig";
connectAttr "skinCluster9GroupId.id" "skinCluster9.ip[0].gi";
connectAttr "r_int_slideJoint_9.wm" "skinCluster9.ma[0]";
connectAttr "r_int_slideJoint_9.liw" "skinCluster9.lw[0]";
connectAttr "r_int_slideJoint_9.obcc" "skinCluster9.ifcl[0]";
connectAttr "bindPose3.msg" "skinCluster9.bp";
connectAttr "skinCluster9GroupId.msg" "skinCluster9Set.gn" -na;
connectAttr "r_pupilShape.iog.og[8]" "skinCluster9Set.dsm" -na;
connectAttr "skinCluster9.msg" "skinCluster9Set.ub[0]";
connectAttr "blendShape5.og[0]" "skinCluster9GroupParts.ig";
connectAttr "skinCluster9GroupId.id" "skinCluster9GroupParts.gi";
connectAttr "control.initPupilSize" "addDoubleLinear25.i1";
connectAttr "blendColors1.opg" "addDoubleLinear25.i2";
connectAttr "addDoubleLinear25.o" "addDoubleLinear26.i1";
connectAttr "blendColors1.opb" "condition1.ft";
connectAttr "blendColors1.opb" "condition1.ctr";
connectAttr "blendColors1.opb" "condition1.cfg";
connectAttr "condition1.ocr" "setRange1.vx";
connectAttr "condition1.ocg" "setRange1.vy";
connectAttr "blendColors2.opb" "condition2.ft";
connectAttr "blendColors2.opb" "condition2.ctr";
connectAttr "blendColors2.opb" "condition2.cfg";
connectAttr "condition2.ocr" "setRange2.vx";
connectAttr "condition2.ocg" "setRange2.vy";
connectAttr "control.eyesIk" "blendColors1.b";
connectAttr "l_look_ik.size" "blendColors1.c1r";
connectAttr "l_look_ik.pupilSize" "blendColors1.c1g";
connectAttr "l_look_ik.squash" "blendColors1.c1b";
connectAttr "l_look_fk.size" "blendColors1.c2r";
connectAttr "l_look_fk.pupilSize" "blendColors1.c2g";
connectAttr "l_look_fk.squash" "blendColors1.c2b";
connectAttr "control.eyesIk" "blendColors2.b";
connectAttr "r_look_ik.size" "blendColors2.c1r";
connectAttr "r_look_ik.pupilSize" "blendColors2.c1g";
connectAttr "r_look_ik.squash" "blendColors2.c1b";
connectAttr "r_look_fk.size" "blendColors2.c2r";
connectAttr "r_look_fk.pupilSize" "blendColors2.c2g";
connectAttr "r_look_fk.squash" "blendColors2.c2b";
connectAttr "highlight_mat.oc" "surfaceShader1SG.ss";
connectAttr "l_highlight_geoShape.iog" "surfaceShader1SG.dsm" -na;
connectAttr "r_highlight_geoShape.iog" "surfaceShader1SG.dsm" -na;
connectAttr "surfaceShader1SG.msg" "materialInfo4.sg";
connectAttr "highlight_mat.msg" "materialInfo4.m";
connectAttr "highlight_mat.msg" "materialInfo4.t" -na;
connectAttr "shrinkWrap1GroupParts.og" "shrinkWrap1.ip[0].ig";
connectAttr "shrinkWrap1GroupId.id" "shrinkWrap1.ip[0].gi";
connectAttr "l_glassShape.w" "shrinkWrap1.tgt";
connectAttr "l_glassShape.co" "shrinkWrap1.co";
connectAttr "l_glassShape.suv" "shrinkWrap1.suv";
connectAttr "l_glassShape.kb" "shrinkWrap1.kb";
connectAttr "l_glassShape.bnr" "shrinkWrap1.bnr";
connectAttr "l_glassShape.khe" "shrinkWrap1.khe";
connectAttr "l_glassShape.peh" "shrinkWrap1.peh";
connectAttr "l_glassShape.kmb" "shrinkWrap1.kmb";
connectAttr "groupParts636.og" "tweak180.ip[0].ig";
connectAttr "groupId1757.id" "tweak180.ip[0].gi";
connectAttr "shrinkWrap1GroupId.msg" "shrinkWrap1Set.gn" -na;
connectAttr "l_highlight_geoShape.iog.og[0]" "shrinkWrap1Set.dsm" -na;
connectAttr "shrinkWrap1.msg" "shrinkWrap1Set.ub[0]";
connectAttr "tweak180.og[0]" "shrinkWrap1GroupParts.ig";
connectAttr "shrinkWrap1GroupId.id" "shrinkWrap1GroupParts.gi";
connectAttr "groupId1757.msg" "tweakSet219.gn" -na;
connectAttr "l_highlight_geoShape.iog.og[1]" "tweakSet219.dsm" -na;
connectAttr "tweak180.msg" "tweakSet219.ub[0]";
connectAttr "l_highlight_geoShapeOrig.w" "groupParts636.ig";
connectAttr "groupId1757.id" "groupParts636.gi";
connectAttr "l_highlight.t" "multiplyDivide1.i1";
connectAttr "l_highlight.tx" "unitConversion23.i";
connectAttr "l_highlight.ty" "unitConversion24.i";
connectAttr "l_highlight.size" "multDoubleLinear32.i1";
connectAttr "r_highlight.ty" "unitConversion25.i";
connectAttr "r_highlight.tx" "unitConversion26.i";
connectAttr "r_highlight.t" "multiplyDivide2.i1";
connectAttr "shrinkWrap2GroupParts.og" "shrinkWrap2.ip[0].ig";
connectAttr "shrinkWrap2GroupId.id" "shrinkWrap2.ip[0].gi";
connectAttr "r_glassShape.w" "shrinkWrap2.tgt";
connectAttr "r_glassShape.co" "shrinkWrap2.co";
connectAttr "r_glassShape.suv" "shrinkWrap2.suv";
connectAttr "r_glassShape.kb" "shrinkWrap2.kb";
connectAttr "r_glassShape.bnr" "shrinkWrap2.bnr";
connectAttr "r_glassShape.khe" "shrinkWrap2.khe";
connectAttr "r_glassShape.peh" "shrinkWrap2.peh";
connectAttr "r_glassShape.kmb" "shrinkWrap2.kmb";
connectAttr "groupParts638.og" "tweak181.ip[0].ig";
connectAttr "groupId1759.id" "tweak181.ip[0].gi";
connectAttr "shrinkWrap2GroupId.msg" "shrinkWrap2Set.gn" -na;
connectAttr "r_highlight_geoShape.iog.og[0]" "shrinkWrap2Set.dsm" -na;
connectAttr "shrinkWrap2.msg" "shrinkWrap2Set.ub[0]";
connectAttr "tweak181.og[0]" "shrinkWrap2GroupParts.ig";
connectAttr "shrinkWrap2GroupId.id" "shrinkWrap2GroupParts.gi";
connectAttr "groupId1759.msg" "tweakSet220.gn" -na;
connectAttr "r_highlight_geoShape.iog.og[1]" "tweakSet220.dsm" -na;
connectAttr "tweak181.msg" "tweakSet220.ub[0]";
connectAttr "r_highlight_geoShapeOrig.w" "groupParts638.ig";
connectAttr "groupId1759.id" "groupParts638.gi";
connectAttr "r_highlight.size" "multDoubleLinear34.i1";
connectAttr "highlightsAim.highlightsSizeLeft" "multiplyDivide3.i1x";
connectAttr "l_ball.s" "multiplyDivide3.i2";
connectAttr "highlightsAim.highlightsSizeRight" "multiplyDivide4.i1x";
connectAttr "r_ball.s" "multiplyDivide4.i2";
connectAttr "highlightsAim.world" "reverse42.ix";
connectAttr "highlightsAim.iog" "highlights_moduleControlSet.dsm" -na;
connectAttr "l_highlight.iog" "highlights_moduleControlSet.dsm" -na;
connectAttr "r_highlight.iog" "highlights_moduleControlSet.dsm" -na;
connectAttr "l_highlight_geoShapeOrigOrig.w" "cluster41.ip[0].ig";
connectAttr "l_highlight_geoShapeOrigOrig.o" "cluster41.orggeom[0]";
connectAttr "cluster41Handle.wm" "cluster41.ma";
connectAttr "cluster41HandleShape.x" "cluster41.x";
connectAttr "r_highlight_geoShapeOrigOrig.w" "cluster42.ip[0].ig";
connectAttr "r_highlight_geoShapeOrigOrig.o" "cluster42.orggeom[0]";
connectAttr "cluster42Handle.wm" "cluster42.ma";
connectAttr "cluster42HandleShape.x" "cluster42.x";
connectAttr "posers.v" "multDoubleLinear35.i2";
connectAttr "root_connector.wm" "decomposeMatrix80.imat";
connectAttr "l_ball.s" "multiplyDivide5.i1";
connectAttr "decomposeMatrix80.os" "multiplyDivide5.i2";
connectAttr "r_ball.s" "multiplyDivide6.i1";
connectAttr "decomposeMatrix80.os" "multiplyDivide6.i2";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide10.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide10.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide10.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide11.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide11.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide11.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide12.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide12.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide12.i1z";
connectAttr "root_poser.size" "multiplyDivide12.i2x";
connectAttr "end_poser.size" "multiplyDivide12.i2y";
connectAttr "length_poser.size" "multiplyDivide12.i2z";
connectAttr "mainPoser.globalSize" "multiplyDivide13.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide13.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide13.i1z";
connectAttr "multiplyDivide12.ox" "makeNurbSphere18.r";
connectAttr "multiplyDivide12.oy" "makeNurbSphere19.r";
connectAttr "multiplyDivide12.oz" "makeNurbSphere21.r";
connectAttr "glass_mat.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "highlight_mat.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "black_mat.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "place2dTexture1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "eyeball_mat.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "ramp1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "multiplyDivide14.ox" "sweepMeshCreator1.scaleProfileX";
connectAttr "mainPoser.globalSize" "multiplyDivide14.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide14.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide14.i1z";
connectAttr "mainPoser.lineWidth" "multiplyDivide14.i2x";
connectAttr "mainPoser.size" "multiplyDivide14.i2y";
connectAttr "highlights_poser.size" "multiplyDivide14.i2z";
connectAttr "multiplyDivide14.oz" "makeNurbSphere22.r";
connectAttr "l_geo_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn";
connectAttr "l_geo_scale_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn"
		;
connectAttr "l_eye_joint.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn";
connectAttr "l_eye_group_decMat.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn"
		;
connectAttr "root_connectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[0].dn"
		;
connectAttr "root_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[1].dn";
connectAttr "l_geo_scale_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[2].dn"
		;
connectAttr "r_geo_scale_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[3].dn"
		;
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[4].dn";
connectAttr "multiplyDivide5.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[5].dn";
connectAttr "multiplyDivide6.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[6].dn";
connectAttr "decomposeMatrix80.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[7].dn"
		;
connectAttr "l_geo_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[8].dn";
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "blinn2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "eyeball_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "glass_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "black_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "highlight_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "reverse23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse40.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pos_reverse_multDoubleLinear.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "decomposeMatrix75.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pos_ik__multDoubleLinear.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix77.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix78.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse41.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear27.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear28.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "eulerToQuat19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear29.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix79.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear32.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear34.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear35.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ramp1.msg" ":defaultTextureList1.tx" -na;
// End of eyesGeometry.ma
