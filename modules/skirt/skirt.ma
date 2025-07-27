//Maya ASCII 2022 scene
//Name: skirt.ma
//Last modified: Sun, Jun 29, 2025 06:37:13 AM
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
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "8A21ABC7-4A57-9D26-CCD8-A59ACED1FCFB";
createNode transform -n "mod";
	rename -uid "A8281E66-4053-4FC7-AA21-27BF6ABE5693";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "E50E84B9-4A17-1A8A-DEB4-45820B676476";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr ".v" no;
createNode transform -n "mainPoser" -p "posers";
	rename -uid "911C4211-4943-3E27-F7A9-D5959D2D670D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 0.1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0 7.4913884403290663 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineSize";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "7E7CD312-4EC7-EBF8-4861-12993990D3B6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "F74FCE7A-456D-F633-E7D0-1A937CCD1942";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -k on ".twist";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "A652376D-438E-C137-8AA7-9EAFB8533D6E";
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
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "1FCD49E6-4E8D-108B-6C9C-6EBABE58ABE7";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "root_poserOrient_locShape" -p "root_poserOrient";
	rename -uid "A86869AB-4210-77EB-E03D-09B5CF749147";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "root_poserOrientShapeOrig" -p "root_poserOrient";
	rename -uid "1473E7E6-4CC4-CB2B-4A98-B5BF126FBF1D";
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
createNode transform -n "root_initLoc" -p "root_poserOrient";
	rename -uid "6996A819-4919-3A1D-4A41-30B69C168D87";
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "435A9AF0-44CF-5CA1-D733-82BDCFAF23D9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "end_poser" -p "mainPoser";
	rename -uid "7EFF8BCC-4DFD-81EC-5CB3-B4A78AF28458";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	addAttr -ci true -sn "radius" -ln "radius" -dv 1 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 -7.9996462751108943 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".twist";
	setAttr -k on ".radius" 0;
createNode nurbsSurface -n "end_poserShape" -p "end_poser";
	rename -uid "E19747E6-493B-F049-0CF1-419A46C49AF3";
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
createNode locator -n "end_poser_locShape" -p "end_poser";
	rename -uid "355D3450-4B55-5CFD-5D71-EB802E89D746";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "235E3B04-44AD-C7D2-878C-68B693958B16";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "end_poserOrient_locShape" -p "end_poserOrient";
	rename -uid "2B1E17BA-40AF-75FF-FA74-F08E6707A1AC";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "C67FF82B-4416-9173-59E4-868E4232E582";
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
createNode transform -n "f_mainPoser" -p "mainPoser";
	rename -uid "4829C295-46BF-9BAB-BC33-EB9E81E5C768";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.037411178809752421 0 3.9129825443921118 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "f_mainPoserShape" -p "f_mainPoser";
	rename -uid "67DE24AA-499F-9442-34A5-0D932927240D";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "f_mainPoserShapeOrig" -p "f_mainPoser";
	rename -uid "31A713FA-470C-5FFB-7996-0DBE8F377CD2";
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
createNode transform -n "f_mainPoser_clusterHandle" -p "f_mainPoser";
	rename -uid "75B6F76F-4B46-4807-4AD8-3A9CF124E8C3";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "f_mainPoser_clusterHandleShape" -p "f_mainPoser_clusterHandle";
	rename -uid "A1F4E8C6-4026-FFE2-1EAB-21A1E011CC42";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_1_group" -p "f_mainPoser";
	rename -uid "61276C24-4482-5EB3-30DE-31A71F9E72AA";
createNode transform -n "f_2_poser_group" -p "rotate_1_group";
	rename -uid "20CE5FFD-4953-09ED-DB00-B29880BA2F69";
	setAttr ".t" -type "double3" -8.8817841970012523e-16 -2.6638822555541992 0 ;
createNode transform -n "f_2_poser" -p "f_2_poser_group";
	rename -uid "E1242B82-46DC-2F3C-8115-7F9BCCB5ED0F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "f_2_poserNurbsShape" -p "f_2_poser";
	rename -uid "BCDABAE5-4841-4FE8-9B9C-CEB2CAD8C630";
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
createNode transform -n "f_2_poserOrient" -p "f_2_poser";
	rename -uid "E4AA16E8-476C-D5A0-5355-4384D2E2BDCF";
createNode locator -n "f_2_poserOrientShape" -p "f_2_poserOrient";
	rename -uid "127DBF17-41EC-C282-FF86-D1B6118B3292";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "f_2_initLoc" -p "f_2_poserOrient";
	rename -uid "8724E50D-45AA-7E6E-D643-DA88F3F45AFE";
	setAttr ".v" no;
createNode locator -n "f_2_initLocShape" -p "f_2_initLoc";
	rename -uid "0410A6FC-454A-FC5C-ECC5-8B91EE6B7B27";
	setAttr -k off ".v";
createNode transform -n "f_3_poser_group" -p "rotate_1_group";
	rename -uid "B3A1A3A5-4B2B-EEC4-4657-CAA434F13E2A";
	setAttr ".t" -type "double3" 0 -5.3277645111083984 8.8817841970012523e-16 ;
createNode transform -n "f_3_poser" -p "f_3_poser_group";
	rename -uid "56A2487D-470E-DB77-0FDD-7FBD65CF1897";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "f_3_poserNurbsShape" -p "f_3_poser";
	rename -uid "A5EF82D1-4D59-332C-80C2-0DBA1DAF31BE";
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
createNode transform -n "f_3_poserOrient" -p "f_3_poser";
	rename -uid "EEA73F2E-4083-CAB5-1E99-5BA1E7DFC63A";
createNode locator -n "f_3_poserOrientShape" -p "f_3_poserOrient";
	rename -uid "E97B964A-46F1-8330-3053-8B853D361D7C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "f_3_initLoc" -p "f_3_poserOrient";
	rename -uid "0B453847-4826-3700-C840-E4B4A295D1E3";
	setAttr ".v" no;
createNode locator -n "f_3_initLocShape" -p "f_3_initLoc";
	rename -uid "A91644F5-4190-29DA-A009-36B326D39C4C";
	setAttr -k off ".v";
createNode transform -n "f_4_poser_group" -p "rotate_1_group";
	rename -uid "893C60D4-43A4-5D85-73C5-A8811A8C9F6C";
createNode transform -n "f_4_poser" -p "f_4_poser_group";
	rename -uid "6EAC9A9B-40E8-A0FF-055D-37BC90A25565";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "f_4_poserNurbsShape" -p "f_4_poser";
	rename -uid "F16B6D43-4918-A5EF-E45C-BA97FE238858";
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
createNode transform -n "f_4_poserOrient" -p "f_4_poser";
	rename -uid "E85B413E-467C-9975-05FA-D28D91889D40";
createNode locator -n "f_4_poserOrientShape" -p "f_4_poserOrient";
	rename -uid "BE524DEC-4871-202D-91AA-D3805826734D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "f_4_initLoc" -p "f_4_poserOrient";
	rename -uid "757BB566-486A-B7D5-9DA7-A58922689974";
	setAttr ".v" no;
createNode locator -n "f_4_initLocShape" -p "f_4_initLoc";
	rename -uid "6CDFD848-4B3B-7EE8-0057-9DA529C20C38";
	setAttr -k off ".v";
createNode transform -n "f_1_poser_group" -p "rotate_1_group";
	rename -uid "97754127-489F-AD5A-9EF8-3AB15BB5F0CD";
createNode transform -n "f_1_poser" -p "f_1_poser_group";
	rename -uid "563A218D-4216-9DB8-061C-3A94480CA831";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "f_1_poserNurbsShape" -p "f_1_poser";
	rename -uid "20E0E64B-4F66-6BE7-5087-78A58EAFB332";
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
createNode transform -n "f_1_poserOrient" -p "f_1_poser";
	rename -uid "11E2BF4A-4445-F893-C80F-5EA810CF9002";
createNode locator -n "f_1_poserOrientShape" -p "f_1_poserOrient";
	rename -uid "A456DBE0-4D89-D8F1-957D-AD8D4BC56CBE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "f_1_initLoc" -p "f_1_poserOrient";
	rename -uid "4D30B06E-4B2B-58D9-0562-18BA33DB5FC2";
	setAttr ".v" no;
createNode locator -n "f_1_initLocShape" -p "f_1_initLoc";
	rename -uid "2668A01B-41A3-DCD7-D0FB-68B575658712";
	setAttr -k off ".v";
createNode transform -n "l_1_mainPoser" -p "mainPoser";
	rename -uid "5DCF785F-4124-ADA0-1FC5-498B7F789C64";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 2.4440370461850893 0 3.5384546436195428 ;
	setAttr ".r" -type "double3" 0 15.025009587585895 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "l_1_mainPoserShape" -p "l_1_mainPoser";
	rename -uid "4DCAEE40-417D-C7E3-C98F-EA904D3C8B6A";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_1_mainPoserShapeOrig" -p "l_1_mainPoser";
	rename -uid "0838CFB4-4755-2CB9-3A7E-E5AD36950BD1";
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
createNode transform -n "l_1_mainPoser_clusterHandle" -p "l_1_mainPoser";
	rename -uid "3D3ED58C-4FB4-B08C-1F1A-2D86E164C979";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_1_mainPoser_clusterHandleShape" -p "l_1_mainPoser_clusterHandle";
	rename -uid "B9EDF277-41CD-05F7-52AC-77843832C787";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_2_group" -p "l_1_mainPoser";
	rename -uid "017669B1-4D15-2707-D213-D8BFFB27BDDF";
createNode transform -n "l_1_4_poser_group" -p "rotate_2_group";
	rename -uid "B51045A9-4B71-01E6-B513-749131727502";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 -7.9996462751108943 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "l_1_4_poser" -p "l_1_4_poser_group";
	rename -uid "74BF85A9-47A8-3006-48BE-C3B8EB7A71C3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_1_4_poserNurbsShape" -p "l_1_4_poser";
	rename -uid "A3BC12C9-496C-65E0-8C66-B88B020A6FC0";
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
createNode transform -n "l_1_4_poserOrient" -p "l_1_4_poser";
	rename -uid "8DCFDBEC-425C-234D-7841-F8BB7402B6E5";
createNode locator -n "l_1_4_poserOrientShape" -p "l_1_4_poserOrient";
	rename -uid "04CDDA2A-4ACD-8C4E-B91B-A9A7465970AD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_1_4_initLoc" -p "l_1_4_poserOrient";
	rename -uid "59C638D4-47EC-D94E-87B9-B0BE8E6ABF32";
	setAttr ".v" no;
createNode locator -n "l_1_4_initLocShape" -p "l_1_4_initLoc";
	rename -uid "7A53E0DC-4643-F257-B069-588B4FE186A5";
	setAttr -k off ".v";
createNode transform -n "l_1_2_poser_group" -p "rotate_2_group";
	rename -uid "1095DE8C-47B9-6DC1-8B5C-9993E31DEF8D";
	setAttr ".t" -type "double3" -1.1102230246251565e-15 -2.6638822555541992 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "l_1_2_poser" -p "l_1_2_poser_group";
	rename -uid "31E8AB89-425D-9F40-8DB6-558F8BECF26A";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_1_2_poserNurbsShape" -p "l_1_2_poser";
	rename -uid "A3A681F5-41F3-46DB-15DE-1D96C82DB4DE";
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
createNode transform -n "l_1_2_poserOrient" -p "l_1_2_poser";
	rename -uid "ABB49AD2-4B50-9A69-278B-6C8A728CCBF4";
createNode locator -n "l_1_2_poserOrientShape" -p "l_1_2_poserOrient";
	rename -uid "4DC1C41E-49AA-4D62-D72B-948EEBF24FB2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_1_2_initLoc" -p "l_1_2_poserOrient";
	rename -uid "72C1FB28-47E3-414A-A9D9-3DA49F18F30D";
	setAttr ".v" no;
createNode locator -n "l_1_2_initLocShape" -p "l_1_2_initLoc";
	rename -uid "CD504B84-4440-6477-F21C-DFBDED1635FD";
	setAttr -k off ".v";
createNode transform -n "l_1_3_poser_group" -p "rotate_2_group";
	rename -uid "EB6A3DC6-407D-CE99-1437-A7A528A93BE8";
	setAttr ".t" -type "double3" -4.4408920985006262e-16 -5.3277645111083984 8.8817841970012523e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "l_1_3_poser" -p "l_1_3_poser_group";
	rename -uid "261D4E25-4A1F-1318-18F5-7AB66D1B921E";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_1_3_poserNurbsShape" -p "l_1_3_poser";
	rename -uid "8745C8DA-4570-18E9-AC07-1981F8CACFAD";
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
createNode transform -n "l_1_3_poserOrient" -p "l_1_3_poser";
	rename -uid "59539F58-4F1C-3B67-7966-B68D8AAA816E";
createNode locator -n "l_1_3_poserOrientShape" -p "l_1_3_poserOrient";
	rename -uid "230515CE-428F-44F4-848B-A7A5163F7E38";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_1_3_initLoc" -p "l_1_3_poserOrient";
	rename -uid "CA5C98FC-41C6-8536-576C-66809D2D3DAE";
	setAttr ".v" no;
createNode locator -n "l_1_3_initLocShape" -p "l_1_3_initLoc";
	rename -uid "AC1913EF-4B39-3B38-0DF1-5595C9BA2004";
	setAttr -k off ".v";
createNode transform -n "l_1_1_poser_group" -p "rotate_2_group";
	rename -uid "81459676-4652-AFA5-502C-4AB05E1ADAA2";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "l_1_1_poser" -p "l_1_1_poser_group";
	rename -uid "448EF301-4BC6-34B4-063F-58909217C7BD";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_1_1_poserNurbsShape" -p "l_1_1_poser";
	rename -uid "F115F355-4F26-CB0F-B967-498BA4EDC769";
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
createNode transform -n "l_1_1_poserOrient" -p "l_1_1_poser";
	rename -uid "27D6AD7B-487A-5D44-A35F-67B602D4A481";
createNode locator -n "l_1_1_poserOrientShape" -p "l_1_1_poserOrient";
	rename -uid "034771E5-4862-4A57-D3BF-EEB429AECABA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_1_1_initLoc" -p "l_1_1_poserOrient";
	rename -uid "AFDDB557-41EA-4015-D12E-D09351D81C12";
	setAttr ".v" no;
createNode locator -n "l_1_1_initLocShape" -p "l_1_1_initLoc";
	rename -uid "62083E1E-4152-7F02-84D5-97A3B35DAC2B";
	setAttr -k off ".v";
createNode transform -n "l_2_mainPoser" -p "mainPoser";
	rename -uid "3E33EE3D-46B9-DE3C-E419-A3BD44929F7F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 4.7441645250525566 0 2.7024513031665673 ;
	setAttr ".r" -type "double3" 0 39.601381621607246 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "l_2_mainPoserShape" -p "l_2_mainPoser";
	rename -uid "FD9592BD-45D6-67A3-72E6-279A02B01B30";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_2_mainPoserShapeOrig" -p "l_2_mainPoser";
	rename -uid "D270CD4E-47A6-7667-8257-789CB3DDE0B9";
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
createNode transform -n "l_2_mainPoser_clusterHandle" -p "l_2_mainPoser";
	rename -uid "7AAF2856-4DB7-21F7-1E98-7AB690FF0721";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_2_mainPoser_clusterHandleShape" -p "l_2_mainPoser_clusterHandle";
	rename -uid "361D5253-465E-8004-993A-ACA3BF2EC233";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_3_group" -p "l_2_mainPoser";
	rename -uid "15D0E58D-45C0-C2CE-DE1D-9D813A817582";
createNode transform -n "l_2_2_poser_group" -p "rotate_3_group";
	rename -uid "A8FAB678-46B4-6E8F-BA97-87AC6D7BFCB4";
	setAttr ".t" -type "double3" -4.4408920985006262e-16 -2.6638822555541992 0 ;
createNode transform -n "l_2_2_poser" -p "l_2_2_poser_group";
	rename -uid "8A2425EF-4860-1A35-8497-D19353BEF880";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_2_2_poserNurbsShape" -p "l_2_2_poser";
	rename -uid "FC286019-4303-CC05-9A4A-0485B8BB7DAB";
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
createNode transform -n "l_2_2_poserOrient" -p "l_2_2_poser";
	rename -uid "4199DDC0-4D24-EAFC-AD1B-B2A624230D90";
createNode locator -n "l_2_2_poserOrientShape" -p "l_2_2_poserOrient";
	rename -uid "1808AF1F-4053-2A80-427D-FBADE06A216D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_2_2_initLoc" -p "l_2_2_poserOrient";
	rename -uid "7E2AE77D-45D4-7E9F-A520-78AC46645B8A";
	setAttr ".v" no;
createNode locator -n "l_2_2_initLocShape" -p "l_2_2_initLoc";
	rename -uid "5FECF981-448A-C89E-6B87-18B2469BD765";
	setAttr -k off ".v";
createNode transform -n "l_2_3_poser_group" -p "rotate_3_group";
	rename -uid "6DB30B18-4D6D-060A-DDA0-09ACC4E02344";
	setAttr ".t" -type "double3" 4.4408920985006262e-16 -5.3277645111083984 8.8817841970012523e-16 ;
createNode transform -n "l_2_3_poser" -p "l_2_3_poser_group";
	rename -uid "EAD22C91-4316-1A9D-7F88-EE99A341962E";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_2_3_poserNurbsShape" -p "l_2_3_poser";
	rename -uid "E5D49A12-4635-CD0B-FDDF-98B59D967044";
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
createNode transform -n "l_2_3_poserOrient" -p "l_2_3_poser";
	rename -uid "64258273-4803-5D71-6678-B5B6F10C3C9D";
createNode locator -n "l_2_3_poserOrientShape" -p "l_2_3_poserOrient";
	rename -uid "7120D876-4E02-6B61-8C54-EB8DE8BA1756";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_2_3_initLoc" -p "l_2_3_poserOrient";
	rename -uid "285B7549-432C-3B32-BE71-17A30EB05D35";
	setAttr ".v" no;
createNode locator -n "l_2_3_initLocShape" -p "l_2_3_initLoc";
	rename -uid "F0DFD323-41E1-FD34-295A-9D9DA6ADB0CE";
	setAttr -k off ".v";
createNode transform -n "l_2_4_poser_group" -p "rotate_3_group";
	rename -uid "62463502-423E-257D-BF79-40AB2BAFBA12";
	setAttr ".t" -type "double3" 6.6613381477509392e-16 -7.9996462751108943 0 ;
createNode transform -n "l_2_4_poser" -p "l_2_4_poser_group";
	rename -uid "24E42EBD-4B9C-5BC7-4109-2A926F8311E6";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_2_4_poserNurbsShape" -p "l_2_4_poser";
	rename -uid "45C36657-40F5-B1A3-977F-B4B187072333";
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
createNode transform -n "l_2_4_poserOrient" -p "l_2_4_poser";
	rename -uid "693621BE-4D47-A760-5D8C-A2B8E7759D91";
createNode locator -n "l_2_4_poserOrientShape" -p "l_2_4_poserOrient";
	rename -uid "7580C3A6-4FA9-8CE5-7FB1-74895E99C4CE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_2_4_initLoc" -p "l_2_4_poserOrient";
	rename -uid "2B6D9D35-4B42-643C-2028-A8BAA8323978";
	setAttr ".v" no;
createNode locator -n "l_2_4_initLocShape" -p "l_2_4_initLoc";
	rename -uid "E6DD735D-47D3-88E3-F32B-F7B708A3AC85";
	setAttr -k off ".v";
createNode transform -n "l_2_1_poser_group" -p "rotate_3_group";
	rename -uid "CBE47D23-48A0-D7E0-36FB-C79870EBD791";
	setAttr ".t" -type "double3" 6.6613381477509392e-16 0 0 ;
createNode transform -n "l_2_1_poser" -p "l_2_1_poser_group";
	rename -uid "B5B5C96B-4296-BF64-E896-D1BF9018E470";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_2_1_poserNurbsShape" -p "l_2_1_poser";
	rename -uid "525D0C15-4B72-17D1-F08C-7C90EC1EA461";
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
createNode transform -n "l_2_1_poserOrient" -p "l_2_1_poser";
	rename -uid "CA9E25CF-48A6-7730-AD65-5BA302D89E50";
createNode locator -n "l_2_1_poserOrientShape" -p "l_2_1_poserOrient";
	rename -uid "D79AE02C-4D38-2DCC-5535-B2BFF6E23CE2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_2_1_initLoc" -p "l_2_1_poserOrient";
	rename -uid "8C0D73D6-49A3-4E13-16BB-09BDC00AB911";
	setAttr ".v" no;
createNode locator -n "l_2_1_initLocShape" -p "l_2_1_initLoc";
	rename -uid "EB07BA16-4D87-8D97-5459-51A8171BDF15";
	setAttr -k off ".v";
createNode transform -n "l_3_mainPoser" -p "mainPoser";
	rename -uid "BE82B957-4844-F6FF-BCE4-8E865C143A62";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 6.6661467371177388 0 0.071033634012703573 ;
	setAttr ".r" -type "double3" 0 84.082359163144972 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "l_3_mainPoserShape" -p "l_3_mainPoser";
	rename -uid "D3D35F0B-4CCF-ADF4-C2F6-52A1F08DC630";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_3_mainPoserShapeOrig" -p "l_3_mainPoser";
	rename -uid "8588FACA-49E1-1688-2F8A-D0853FF755DB";
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
createNode transform -n "l_3_mainPoser_clusterHandle" -p "l_3_mainPoser";
	rename -uid "BF837A6F-4D61-0099-626A-EBBAE2FB42A0";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_3_mainPoser_clusterHandleShape" -p "l_3_mainPoser_clusterHandle";
	rename -uid "B70AB0A1-4D6D-FD54-A12A-8C95DE972686";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_4_group" -p "l_3_mainPoser";
	rename -uid "04147C3D-4D3F-3F0F-60DA-C88D2560AC85";
createNode transform -n "l_3_4_poser_group" -p "rotate_4_group";
	rename -uid "ECC3321C-4F20-8AEA-BD7B-C48277270177";
	setAttr ".t" -type "double3" 1.1102230246251565e-16 -7.9996462751108943 0 ;
createNode transform -n "l_3_4_poser" -p "l_3_4_poser_group";
	rename -uid "7CF95B63-4EC0-980D-F772-ADAD7292DC65";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_3_4_poserNurbsShape" -p "l_3_4_poser";
	rename -uid "9F13B5D6-4D6A-EE50-930D-32BEC8D48120";
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
createNode transform -n "l_3_4_poserOrient" -p "l_3_4_poser";
	rename -uid "1EC7F256-49B0-69C8-F6F8-708869754449";
createNode locator -n "l_3_4_poserOrientShape" -p "l_3_4_poserOrient";
	rename -uid "5ECB79AD-47D7-2741-4C7E-3EA8562DDEB8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_3_4_initLoc" -p "l_3_4_poserOrient";
	rename -uid "ABA7128B-45C6-2C31-66B9-6C9B3594C5EC";
	setAttr ".v" no;
createNode locator -n "l_3_4_initLocShape" -p "l_3_4_initLoc";
	rename -uid "308C4617-4BC6-419A-6CA3-4D9FC9DEC332";
	setAttr -k off ".v";
createNode transform -n "l_3_2_poser_group" -p "rotate_4_group";
	rename -uid "51912002-4B66-525A-0D88-8581CF07BA04";
	setAttr ".t" -type "double3" -7.7715611723760958e-16 -2.6638822555541992 0 ;
createNode transform -n "l_3_2_poser" -p "l_3_2_poser_group";
	rename -uid "E99488A3-4C3E-B968-DAF6-2C921ED70815";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_3_2_poserNurbsShape" -p "l_3_2_poser";
	rename -uid "42DF4ABB-436C-D81F-E7EB-EB98DB8A1B3B";
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
createNode transform -n "l_3_2_poserOrient" -p "l_3_2_poser";
	rename -uid "0E9ACAF9-46E3-C027-7C8F-F6AC5E682628";
createNode locator -n "l_3_2_poserOrientShape" -p "l_3_2_poserOrient";
	rename -uid "5554EA04-472A-F516-BB86-E4B0C45384B6";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_3_2_initLoc" -p "l_3_2_poserOrient";
	rename -uid "7C991132-4038-2725-1F72-98A9BC7A97CC";
	setAttr ".v" no;
createNode locator -n "l_3_2_initLocShape" -p "l_3_2_initLoc";
	rename -uid "1F3FBF66-40AC-3FE6-564B-EAA1A33BFC48";
	setAttr -k off ".v";
createNode transform -n "l_3_3_poser_group" -p "rotate_4_group";
	rename -uid "6E0F0C02-45BE-0DB3-F05B-7FA60EE7B175";
	setAttr ".t" -type "double3" 0 -5.3277645111083984 8.8817841970012523e-16 ;
createNode transform -n "l_3_3_poser" -p "l_3_3_poser_group";
	rename -uid "F8981503-4A55-6F94-3CB7-5FB047D0EDA0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_3_3_poserNurbsShape" -p "l_3_3_poser";
	rename -uid "10D14252-4790-B1DA-97B1-88826DD7B0F8";
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
createNode transform -n "l_3_3_poserOrient" -p "l_3_3_poser";
	rename -uid "35E13D93-447D-D0CA-0A09-6F967DBB6F9C";
createNode locator -n "l_3_3_poserOrientShape" -p "l_3_3_poserOrient";
	rename -uid "598158DD-474A-A807-D4AA-FCA8A4522ABA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_3_3_initLoc" -p "l_3_3_poserOrient";
	rename -uid "3B9CBECD-42F2-9D64-B276-46966BD78001";
	setAttr ".v" no;
createNode locator -n "l_3_3_initLocShape" -p "l_3_3_initLoc";
	rename -uid "ABC2A7D0-473C-A55B-02AE-088D2E2EA704";
	setAttr -k off ".v";
createNode transform -n "l_3_1_poser_group" -p "rotate_4_group";
	rename -uid "C15A57CE-4FB2-E176-D09F-B28582D8F910";
	setAttr ".t" -type "double3" 1.1102230246251565e-16 0 0 ;
createNode transform -n "l_3_1_poser" -p "l_3_1_poser_group";
	rename -uid "CCEB50D3-42A6-7F43-EAF5-A08C2BB4EA17";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_3_1_poserNurbsShape" -p "l_3_1_poser";
	rename -uid "8EC14A24-4F62-0AC6-836F-36844A42E2B9";
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
createNode transform -n "l_3_1_poserOrient" -p "l_3_1_poser";
	rename -uid "EDF07A29-4FF2-605F-B9DB-679F79E7AC5C";
createNode locator -n "l_3_1_poserOrientShape" -p "l_3_1_poserOrient";
	rename -uid "FE874C7E-452C-FAC9-38AA-EC9BCE89604E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_3_1_initLoc" -p "l_3_1_poserOrient";
	rename -uid "645D516A-4260-FDEC-DB6F-03A5FAA69B14";
	setAttr ".v" no;
createNode locator -n "l_3_1_initLocShape" -p "l_3_1_initLoc";
	rename -uid "4616D986-44CA-8A2A-0BD9-6EA1F286C184";
	setAttr -k off ".v";
createNode transform -n "l_4_mainPoser" -p "mainPoser";
	rename -uid "FFE404CB-419D-CFA0-2C2D-1DA8379B0885";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 5.1235496677055457 0 -3.7528169087132097 ;
	setAttr ".r" -type "double3" 0 131.07403925658824 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "l_4_mainPoserShape" -p "l_4_mainPoser";
	rename -uid "A97B66ED-421A-2E68-4E41-DAB977456CE7";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_4_mainPoserShapeOrig" -p "l_4_mainPoser";
	rename -uid "E4F5923E-4812-7785-7EC3-998B0B9405ED";
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
createNode transform -n "l_4_mainPoser_clusterHandle" -p "l_4_mainPoser";
	rename -uid "3333DB52-4F1E-B961-A593-56A70BE07473";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_4_mainPoser_clusterHandleShape" -p "l_4_mainPoser_clusterHandle";
	rename -uid "0677575B-46F9-3FB3-CB21-6A926976EBC6";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_5_group" -p "l_4_mainPoser";
	rename -uid "38C8AE3D-4E6F-5825-A55E-D98398635548";
createNode transform -n "l_4_3_poser_group" -p "rotate_5_group";
	rename -uid "1A9E9903-45BF-348A-8307-059124FB4A90";
	setAttr ".t" -type "double3" 0 -5.3277645111083984 8.8817841970012523e-16 ;
createNode transform -n "l_4_3_poser" -p "l_4_3_poser_group";
	rename -uid "39141269-4F96-71B7-0F3F-4098F18C3834";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_4_3_poserNurbsShape" -p "l_4_3_poser";
	rename -uid "455F1CBD-4621-279F-6996-598F2DA7613A";
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
createNode transform -n "l_4_3_poserOrient" -p "l_4_3_poser";
	rename -uid "C8253497-46C3-4358-0B8C-AAA70BA67A38";
createNode locator -n "l_4_3_poserOrientShape" -p "l_4_3_poserOrient";
	rename -uid "3AEFEBA2-4071-45AE-E5F5-82A04E1E6B85";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_4_3_initLoc" -p "l_4_3_poserOrient";
	rename -uid "2300980E-44B3-2730-AE25-DBBAFCE785F3";
	setAttr ".v" no;
createNode locator -n "l_4_3_initLocShape" -p "l_4_3_initLoc";
	rename -uid "EF37B757-4431-3CD5-0691-0D80DC53CC6F";
	setAttr -k off ".v";
createNode transform -n "l_4_2_poser_group" -p "rotate_5_group";
	rename -uid "2F11EE03-49CC-9103-E6F2-64AB8839FD4E";
	setAttr ".t" -type "double3" -8.8817841970012523e-16 -2.6638822555541992 8.8817841970012523e-16 ;
createNode transform -n "l_4_2_poser" -p "l_4_2_poser_group";
	rename -uid "FFE570B4-40BC-ED50-0369-D08EC1DBA246";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_4_2_poserNurbsShape" -p "l_4_2_poser";
	rename -uid "574E8ABF-455A-B7C8-4D24-AABD594A8DB0";
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
createNode transform -n "l_4_2_poserOrient" -p "l_4_2_poser";
	rename -uid "FE0D8F8D-434A-78A2-0CBE-819671A1200E";
createNode locator -n "l_4_2_poserOrientShape" -p "l_4_2_poserOrient";
	rename -uid "777267B1-4CE8-F37E-98D5-41A05FB34624";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_4_2_initLoc" -p "l_4_2_poserOrient";
	rename -uid "89E0360F-4CD2-42B2-B310-EB9E92433A9F";
	setAttr ".v" no;
createNode locator -n "l_4_2_initLocShape" -p "l_4_2_initLoc";
	rename -uid "465DCED5-44B3-3CCD-3226-278F2E501E3C";
	setAttr -k off ".v";
createNode transform -n "l_4_4_poser_group" -p "rotate_5_group";
	rename -uid "F8DF00B7-4672-DC95-98F9-62BDFF9B091D";
createNode transform -n "l_4_4_poser" -p "l_4_4_poser_group";
	rename -uid "ADB4B452-4D84-3061-A96D-42A90EC61239";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_4_4_poserNurbsShape" -p "l_4_4_poser";
	rename -uid "B4C0A103-418E-FE85-AB95-AFA81C1D6DF3";
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
createNode transform -n "l_4_4_poserOrient" -p "l_4_4_poser";
	rename -uid "3E8A204A-463C-D9A9-1E10-49977B39A83C";
createNode locator -n "l_4_4_poserOrientShape" -p "l_4_4_poserOrient";
	rename -uid "762791E1-47BA-4916-4C92-41872723A4D1";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_4_4_initLoc" -p "l_4_4_poserOrient";
	rename -uid "D6D283AA-4665-C983-21C3-CAB5B41E8D9A";
	setAttr ".v" no;
createNode locator -n "l_4_4_initLocShape" -p "l_4_4_initLoc";
	rename -uid "099A3BF7-4CB7-F983-6A6F-A7A01309693B";
	setAttr -k off ".v";
createNode transform -n "l_4_1_poser_group" -p "rotate_5_group";
	rename -uid "DBE51E36-43E8-EBDF-D96E-389A7A3ACF3B";
createNode transform -n "l_4_1_poser" -p "l_4_1_poser_group";
	rename -uid "E3A64F44-46AC-4FBB-2D50-32A7B6EB8F90";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_4_1_poserNurbsShape" -p "l_4_1_poser";
	rename -uid "47FAE3C0-403C-F508-0325-8F81047900C0";
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
createNode transform -n "l_4_1_poserOrient" -p "l_4_1_poser";
	rename -uid "5CCF73B0-4A0C-3F94-871F-83B1B605AC93";
createNode locator -n "l_4_1_poserOrientShape" -p "l_4_1_poserOrient";
	rename -uid "A6E84463-48D5-0942-B23E-17A2C8093ED7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_4_1_initLoc" -p "l_4_1_poserOrient";
	rename -uid "CA0A6BDC-4675-3085-DF4A-6182C835943F";
	setAttr ".v" no;
createNode locator -n "l_4_1_initLocShape" -p "l_4_1_initLoc";
	rename -uid "4EE86866-48E4-0E68-A8DB-D3A728D34EA3";
	setAttr -k off ".v";
createNode transform -n "l_5_mainPoser" -p "mainPoser";
	rename -uid "E9F62D82-4192-E98B-0873-259DC1A38AAB";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 2.6044827654356704 0 -4.9790377798522947 ;
	setAttr ".r" -type "double3" 0 165.09858141102566 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "l_5_mainPoserShape" -p "l_5_mainPoser";
	rename -uid "E4DF6F5D-4D7A-5762-FE77-75BB4921CC68";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_5_mainPoserShapeOrig" -p "l_5_mainPoser";
	rename -uid "A73EA8FC-4FFF-225D-D541-5A9F5F591034";
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
createNode transform -n "l_5_mainPoser_clusterHandle" -p "l_5_mainPoser";
	rename -uid "48BEAEDD-4DE6-F058-4746-80A77690A6DA";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_5_mainPoser_clusterHandleShape" -p "l_5_mainPoser_clusterHandle";
	rename -uid "4992EC52-4C16-4E08-33CA-0E93A1646946";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_6_group" -p "l_5_mainPoser";
	rename -uid "6E37DB0B-4920-A2E6-CFC1-65909796BECD";
createNode transform -n "l_5_1_poser_group" -p "rotate_6_group";
	rename -uid "34F44F43-4A1B-A70C-2E7B-0D9FE86E0E86";
createNode transform -n "l_5_1_poser" -p "l_5_1_poser_group";
	rename -uid "5EE43137-45B2-C6DE-5D35-36940ECEE0DF";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_5_1_poserNurbsShape" -p "l_5_1_poser";
	rename -uid "CD628B8C-4ECA-85A2-6F7C-91B371D94670";
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
createNode transform -n "l_5_1_poserOrient" -p "l_5_1_poser";
	rename -uid "1B218DEB-4CFF-B440-29AF-B69D09474610";
createNode locator -n "l_5_1_poserOrientShape" -p "l_5_1_poserOrient";
	rename -uid "6BF18B42-4FDE-FF0C-F001-B59B050C820F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_5_1_initLoc" -p "l_5_1_poserOrient";
	rename -uid "87BC2110-4434-9176-4538-06B7A138820F";
	setAttr ".v" no;
createNode locator -n "l_5_1_initLocShape" -p "l_5_1_initLoc";
	rename -uid "DBA3FC70-48A5-4370-550A-9BA2BB3B6373";
	setAttr -k off ".v";
createNode transform -n "l_5_2_poser_group" -p "rotate_6_group";
	rename -uid "B8CCF1CF-4F93-E00A-ED35-0395FF1B8B41";
	setAttr ".t" -type "double3" -1.9984014443252818e-15 -2.6638822555541992 -8.8817841970012523e-16 ;
createNode transform -n "l_5_2_poser" -p "l_5_2_poser_group";
	rename -uid "726DA3A6-4182-DDF0-57BB-A39EF761BF42";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_5_2_poserNurbsShape" -p "l_5_2_poser";
	rename -uid "4382010A-447A-8603-D4CC-C28F8DDFFD5A";
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
createNode transform -n "l_5_2_poserOrient" -p "l_5_2_poser";
	rename -uid "DB62E1D8-4C05-730C-9535-D698CFE53996";
createNode locator -n "l_5_2_poserOrientShape" -p "l_5_2_poserOrient";
	rename -uid "67CCF0F5-439E-0C42-DA2C-3AA2147C434C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_5_3_initLoc" -p "l_5_2_poserOrient";
	rename -uid "51FD816D-461C-93D8-73F4-69869C43AB6F";
	setAttr ".v" no;
createNode locator -n "l_5_3_initLocShape" -p "|mod|posers|mainPoser|l_5_mainPoser|rotate_6_group|l_5_2_poser_group|l_5_2_poser|l_5_2_poserOrient|l_5_3_initLoc";
	rename -uid "BCAC17E5-48FA-EFAC-735D-99969FC7671A";
	setAttr -k off ".v";
createNode transform -n "l_5_3_poser_group" -p "rotate_6_group";
	rename -uid "3580EE5B-48AA-EFB9-FBD1-929A4ACDAA3C";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 -5.3277645111083984 8.8817841970012523e-16 ;
createNode transform -n "l_5_3_poser" -p "l_5_3_poser_group";
	rename -uid "308C1F04-4878-B7C5-BCED-5D9D5255281C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_5_3_poserNurbsShape" -p "l_5_3_poser";
	rename -uid "3E83DF31-481E-462B-8429-3C92218A4C77";
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
createNode transform -n "l_5_3_poserOrient" -p "l_5_3_poser";
	rename -uid "7589BCD9-480A-FB38-FE04-22975E38F5C0";
createNode locator -n "l_5_3_poserOrientShape" -p "l_5_3_poserOrient";
	rename -uid "5631C4BF-4C83-0C91-1162-D7BA19ECFDBD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_5_3_initLoc" -p "l_5_3_poserOrient";
	rename -uid "20E92F4F-4E56-BB12-F248-B49A3ABBF98F";
	setAttr ".v" no;
createNode locator -n "l_5_3_initLocShape" -p "|mod|posers|mainPoser|l_5_mainPoser|rotate_6_group|l_5_3_poser_group|l_5_3_poser|l_5_3_poserOrient|l_5_3_initLoc";
	rename -uid "9A72D1AB-432F-08B2-172A-57BD08EEE787";
	setAttr -k off ".v";
createNode transform -n "l_5_4_poser_group" -p "rotate_6_group";
	rename -uid "CE20550E-4B67-7F7F-9A80-2292BAB63124";
createNode transform -n "l_5_4_poser" -p "l_5_4_poser_group";
	rename -uid "50B39A6A-4DA0-314F-F6F0-8E9FAD8D8B15";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "l_5_4_poserNurbsShape" -p "l_5_4_poser";
	rename -uid "B683F956-4C21-B6CC-6E95-F89F3A6B0BFA";
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
createNode transform -n "l_5_4_poserOrient" -p "l_5_4_poser";
	rename -uid "A7D8BCB7-42FE-9632-9850-55BEB656509C";
createNode locator -n "l_5_4_poserOrientShape" -p "l_5_4_poserOrient";
	rename -uid "5098C83E-47E3-D1D5-A631-28BD364B85B2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_5_4_initLoc" -p "l_5_4_poserOrient";
	rename -uid "9D97BC64-4B28-4945-7DBB-4C934975FDC2";
	setAttr ".v" no;
createNode locator -n "l_5_4_initLocShape" -p "l_5_4_initLoc";
	rename -uid "94A0AE69-49FD-EF39-AE1E-1CA1A925D05B";
	setAttr -k off ".v";
createNode transform -n "b_mainPoser" -p "mainPoser";
	rename -uid "85D9790C-4A80-F880-9CC7-238666AC03A2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" -0.13111585326363762 0 -5.3747683256826351 ;
	setAttr ".r" -type "double3" 0 180.23577648321495 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
createNode nurbsCurve -n "b_mainPoserShape" -p "b_mainPoser";
	rename -uid "082535C9-4F5A-4C28-96EB-7CAC5528016F";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "b_mainPoserShapeOrig" -p "b_mainPoser";
	rename -uid "78F7B160-43B2-F43F-128B-C0A5FD51E40C";
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
createNode transform -n "b_mainPoser_clusterHandle" -p "b_mainPoser";
	rename -uid "46A56ADC-4A02-C664-7C9B-34B55707591C";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "b_mainPoser_clusterHandleShape" -p "b_mainPoser_clusterHandle";
	rename -uid "7870B0F9-4C8C-456C-B068-B19D3FF2E72D";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "rotate_7_group" -p "b_mainPoser";
	rename -uid "73D117D9-4E8B-3E1C-16DA-E282F4455FE7";
createNode transform -n "b_4_poser_group" -p "rotate_7_group";
	rename -uid "2A442A61-4C8F-81D2-BA0A-CABC5229889E";
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "b_4_poser" -p "b_4_poser_group";
	rename -uid "AE4C1AE2-464B-10A1-87E5-C0958C513B66";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0 -6.6613381477509392e-16 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "b_4_poserNurbsShape" -p "b_4_poser";
	rename -uid "61B7CA78-480C-A446-7ADA-94B963A14EB0";
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
createNode transform -n "b_4_poserOrient" -p "b_4_poser";
	rename -uid "3668BF7A-4DBC-566C-81A3-F8992098FD4D";
createNode locator -n "b_4_poserOrientShape" -p "b_4_poserOrient";
	rename -uid "4D18F4DA-475E-7113-7E06-6CA643E1F7B2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "b_4_initLoc" -p "b_4_poserOrient";
	rename -uid "2888459E-438C-3EA7-C4A5-9D903878EE09";
	setAttr ".v" no;
createNode locator -n "b_4_initLocShape" -p "b_4_initLoc";
	rename -uid "4A4261A9-40EB-7556-864E-21B1F53B9055";
	setAttr -k off ".v";
createNode transform -n "b_2_poser_group" -p "rotate_7_group";
	rename -uid "03947E68-493F-FB88-B2D9-AA8073A3ECDC";
	setAttr ".t" -type "double3" -8.8817841970012523e-16 -2.6638822555541992 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "b_2_poser" -p "b_2_poser_group";
	rename -uid "E211B184-4942-B146-F60E-37A92D73790D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0 -1.3322676295501878e-15 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "b_2_poserNurbsShape" -p "b_2_poser";
	rename -uid "396A1F0C-4B83-25EA-3262-B4B14CBC5349";
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
createNode transform -n "b_2_poserOrient" -p "b_2_poser";
	rename -uid "E1C41B69-4CBB-E6D9-910C-0AA381EBEACB";
createNode locator -n "b_2_poserOrientShape" -p "b_2_poserOrient";
	rename -uid "10673389-4213-1A75-067D-3E8A95FCF729";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "b_2_initLoc" -p "b_2_poserOrient";
	rename -uid "43DBE0AE-46FF-A520-091A-F68478C7D8CE";
	setAttr ".v" no;
createNode locator -n "b_2_initLocShape" -p "b_2_initLoc";
	rename -uid "EEDA7991-47C9-BB7A-3EBB-8EA5C05165A0";
	setAttr -k off ".v";
createNode transform -n "b_3_poser_group" -p "rotate_7_group";
	rename -uid "2900409E-4E8F-E22E-00A6-C4BE7F8C4F5C";
	setAttr ".t" -type "double3" 0 -5.3277645111083984 8.8817841970012523e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "b_3_poser" -p "b_3_poser_group";
	rename -uid "727F9765-4CE5-A270-E8FA-4A9257C7A021";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "b_3_poserNurbsShape" -p "b_3_poser";
	rename -uid "93F551D2-403B-C983-0DF1-8997523EAD5E";
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
createNode transform -n "b_3_poserOrient" -p "b_3_poser";
	rename -uid "F9FE9099-4AC2-B5E2-5249-94881D512A5C";
createNode locator -n "b_3_poserOrientShape" -p "b_3_poserOrient";
	rename -uid "FEE9DB43-444D-C433-4628-0F877323E9B5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "b_3_initLoc" -p "b_3_poserOrient";
	rename -uid "324708FF-4D7B-6132-DEEA-4D82518B462A";
	setAttr ".v" no;
createNode locator -n "b_3_initLocShape" -p "b_3_initLoc";
	rename -uid "BE77EF58-44DD-B814-9C43-3FA25AD63C66";
	setAttr -k off ".v";
createNode transform -n "b_1_poser_group" -p "rotate_7_group";
	rename -uid "1C77E7D8-4FEA-DF9E-7F2D-80882B6BDBD6";
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
createNode transform -n "b_1_poser" -p "b_1_poser_group";
	rename -uid "A19D1982-41F3-A11F-226C-FAAA7D7AF4AF";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.2;
createNode nurbsSurface -n "b_1_poserNurbsShape" -p "b_1_poser";
	rename -uid "2C8AF290-4772-48A8-2BDC-8080C5A41B6C";
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
createNode transform -n "b_1_poserOrient" -p "b_1_poser";
	rename -uid "1F83B633-4B47-23AB-A01E-C1A0ECCBA680";
createNode locator -n "b_1_poserOrientShape" -p "b_1_poserOrient";
	rename -uid "06AE0ED9-4D15-65FA-0076-71B4D5D72F02";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "b_1_initLoc" -p "b_1_poserOrient";
	rename -uid "EFB2F7B4-4DF9-E84F-5446-4CB1986712CC";
	setAttr ".v" no;
createNode locator -n "b_1_initLocShape" -p "b_1_initLoc";
	rename -uid "5C7B8C15-44F0-7A2E-2A80-A9B9B51690BD";
	setAttr -k off ".v";
createNode transform -n "mainPoser_clusterHandle" -p "posers";
	rename -uid "CE28EE25-4811-AB16-D688-98B7D1E08882";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "35BA2E8F-4474-A624-A158-BBB1451EBA31";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "6EBCA2D9-4492-E884-484D-8D8EE1C7D3AB";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "E7993EAB-458D-256B-7807-F4B9377B7957";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 10
		2
		0 7.4913884403290663 0
		0 -0.50825783478182807 0
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "2DDC3435-4388-A64D-7DFF-1DA4989EFD9D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "293BF1EC-4602-49ED-1BAD-EFB0F074640C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "EA12AC18-4B08-D6DC-C862-F6A9004128AF";
	setAttr ".v" no;
createNode transform -n "root_connector" -p "input";
	rename -uid "DCCB6E2F-4A52-EF75-53A5-489446F8A6BA";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "16079ADA-4323-3228-8371-5EA712F9626D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "system" -p "mod";
	rename -uid "BE0A76BD-48C9-7557-E616-429013534A82";
createNode transform -n "surf" -p "system";
	rename -uid "1CD94E05-4CCC-0271-D2EE-64922938D49D";
	setAttr ".v" no;
createNode nurbsSurface -n "surfShape" -p "surf";
	rename -uid "AADD1ED9-425A-9236-CB12-BAA1BB532A96";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 60 ".cp";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 2 2 2
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		
		60
		5.1235496677055457 -0.50825783478182895 -3.7528169087132102
		6.6661467371177388 -0.50825783478182807 0.071033634012703351
		4.7441645250525601 -0.50825783478182895 2.7024513031665673
		2.4440370461850889 -0.5082578347818294 3.5384546436195428
		0.037411178809752421 -0.50825783478182807 3.9129825443921118
		-2.4440370461850889 -0.5082578347818294 3.5384546436195428
		-4.7441645250525601 -0.50825783478182895 2.7024513031665673
		-6.6661467371177388 -0.50825783478182807 0.071033634012703351
		-5.1235496677055457 -0.50825783478182895 -3.7528169087132102
		-2.6044827654356704 -0.50825783478182895 -4.9790377798522938
		-0.13111585326363762 -0.50825783478182629 -5.3747683256826351
		2.6044827654356704 -0.50825783478182895 -4.9790377798522938
		5.1235496677055457 -0.50825783478182895 -3.7528169087132102
		6.6661467371177388 -0.50825783478182807 0.071033634012703351
		4.7441645250525601 -0.50825783478182895 2.7024513031665673
		5.1235496677055465 2.1636239292206669 -3.7528169087132106
		6.6661467371177396 2.1636239292206678 0.071033634012703559
		4.7441645250525593 2.1636239292206669 2.7024513031665678
		2.4440370461850893 2.1636239292206669 3.5384546436195436
		0.037411178809752421 2.1636239292206678 3.9129825443921127
		-2.4440370461850893 2.1636239292206669 3.5384546436195436
		-4.7441645250525593 2.1636239292206669 2.7024513031665678
		-6.6661467371177396 2.1636239292206678 0.071033634012703559
		-5.1235496677055465 2.1636239292206669 -3.7528169087132106
		-2.6044827654356713 2.1636239292206669 -4.9790377798522947
		-0.13111585326363762 2.1636239292206687 -5.374768325682636
		2.6044827654356713 2.1636239292206669 -4.9790377798522947
		5.1235496677055465 2.1636239292206669 -3.7528169087132106
		6.6661467371177396 2.1636239292206678 0.071033634012703559
		4.7441645250525593 2.1636239292206669 2.7024513031665678
		5.1235496677055465 4.8275061847748661 -3.7528169087132102
		6.6661467371177388 4.827506184774867 0.071033634012704239
		4.7441645250525575 4.827506184774867 2.7024513031665678
		2.4440370461850889 4.8275061847748661 3.5384546436195436
		0.037411178809751533 4.827506184774867 3.9129825443921118
		-2.4440370461850889 4.8275061847748661 3.5384546436195436
		-4.7441645250525575 4.827506184774867 2.7024513031665678
		-6.6661467371177388 4.827506184774867 0.071033634012704239
		-5.1235496677055465 4.8275061847748661 -3.7528169087132102
		-2.6044827654356721 4.8275061847748661 -4.979037779852292
		-0.13111585326363673 4.827506184774867 -5.3747683256826351
		2.6044827654356721 4.8275061847748661 -4.979037779852292
		5.1235496677055465 4.8275061847748661 -3.7528169087132102
		6.6661467371177388 4.827506184774867 0.071033634012704239
		4.7441645250525575 4.827506184774867 2.7024513031665678
		5.1235496677055457 7.4913884403290663 -3.7528169087132097
		6.6661467371177388 7.4913884403290663 0.071033634012703462
		4.7441645250525575 7.4913884403290663 2.7024513031665669
		2.4440370461850889 7.4913884403290663 3.5384546436195428
		0.037411178809752421 7.4913884403290663 3.9129825443921118
		-2.4440370461850889 7.4913884403290663 3.5384546436195428
		-4.7441645250525575 7.4913884403290663 2.7024513031665669
		-6.6661467371177388 7.4913884403290663 0.071033634012703462
		-5.1235496677055457 7.4913884403290663 -3.7528169087132097
		-2.6044827654356704 7.4913884403290663 -4.9790377798522947
		-0.13111585326363762 7.4913884403290663 -5.3747683256826351
		2.6044827654356704 7.4913884403290663 -4.9790377798522947
		5.1235496677055457 7.4913884403290663 -3.7528169087132097
		6.6661467371177388 7.4913884403290663 0.071033634012703462
		4.7441645250525575 7.4913884403290663 2.7024513031665669
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "controls" -p "mod";
	rename -uid "FCAA7EB7-4CB0-AB78-DB1E-ABB14D792469";
createNode transform -n "f_1_group" -p "controls";
	rename -uid "7B8A94E2-41EB-A076-E563-55B3EC8F8FB5";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "f_1" -p "f_1_group";
	rename -uid "9840C212-4B30-8B48-7906-2F8F83DDA663";
createNode nurbsCurve -n "f_1Shape" -p "f_1";
	rename -uid "B411F250-4537-AEF8-A5F0-54827D3BBB1E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "f_1_joint" -p "f_1";
	rename -uid "04C0D58C-4220-7C9D-BEC9-0FB1BDA0725F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "f_2_group" -p "f_1";
	rename -uid "DB77FC6B-4FDB-8CA7-CDE3-04905FC8BF02";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "f_2" -p "f_2_group";
	rename -uid "82AE7328-46D9-4E1C-8B9B-358AC5D5827D";
createNode nurbsCurve -n "f_2Shape" -p "f_2";
	rename -uid "3C55B1B3-41E2-7E3D-908F-AF9D7DE0D6DE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "f_2_joint" -p "f_2";
	rename -uid "0FDB552B-491A-B057-52F9-ED8D666C828B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "f_3_group" -p "f_2";
	rename -uid "76CA5DCB-4D8D-9526-6E99-89ABD08616D9";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "f_3" -p "f_3_group";
	rename -uid "12BE19C9-4511-132D-FD22-779D4B583926";
createNode nurbsCurve -n "f_3_3Shape" -p "f_3";
	rename -uid "36BFF638-4237-91A2-53AD-9F9BB338914B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "f_3_joint" -p "f_3";
	rename -uid "1B480D4D-4CD3-9BD9-58C4-158088660865";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "f_4_group" -p "f_3";
	rename -uid "A5028BEA-49F5-6BB7-6C62-228AD23A0AEC";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "f_4" -p "f_4_group";
	rename -uid "657293E0-412C-68AD-8096-F784D969D0FB";
createNode nurbsCurve -n "f_4_3Shape4" -p "f_4";
	rename -uid "330BD663-4594-6436-3C6F-D285AD1F1F4D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "f_4_joint" -p "f_4";
	rename -uid "01867708-4C3A-D140-0266-9ABE5063B651";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_4" -p "f_4";
	rename -uid "EEE0B286-4C85-250C-C558-C7BCBE443062";
	setAttr ".v" no;
createNode locator -n "surfLoc_4Shape" -p "surfLoc_4";
	rename -uid "04E2BD0B-422B-4CB4-9639-D39ADF67DCCB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_19" -p "f_3";
	rename -uid "9C74CBD7-4C92-432D-EFB4-E09698FD29DC";
	setAttr ".v" no;
createNode locator -n "surfLoc_19Shape" -p "surfLoc_19";
	rename -uid "59BE68A2-4E2B-7A83-091C-6B88E7B53407";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_34" -p "f_2";
	rename -uid "1F724492-4AC5-5C22-CE52-0DAF022AA2E2";
	setAttr ".v" no;
createNode locator -n "surfLoc_34Shape" -p "surfLoc_34";
	rename -uid "2365B6A6-48F3-23C4-C848-5CA509F3ADD1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_49" -p "f_1";
	rename -uid "B6693781-4532-11FA-E2A8-BD89CD274228";
	setAttr ".v" no;
createNode locator -n "surfLoc_49Shape" -p "surfLoc_49";
	rename -uid "F8A27BA2-4BD7-DE09-49CF-3284BE0A0ED2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "b_1_group" -p "controls";
	rename -uid "0454CED6-4CF6-3047-1A9C-11B387D33C9C";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "b_1" -p "b_1_group";
	rename -uid "F7CDC989-46E2-C3AF-B475-D89EC19B6185";
createNode nurbsCurve -n "b_1Shape" -p "b_1";
	rename -uid "F371418C-4D70-8378-90CA-AEA8BE2DC77B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "b_1_joint" -p "b_1";
	rename -uid "42261BB6-4862-914B-EC02-DBBC581EF5FB";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "b_2_group" -p "b_1";
	rename -uid "2713AF14-4EBF-E5DF-82E0-6ABE6788F2D4";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "b_2" -p "b_2_group";
	rename -uid "E58EF69B-471C-5F69-FF10-0A8A874DD9DF";
createNode nurbsCurve -n "b_2Shape" -p "b_2";
	rename -uid "6C37E171-4AC2-1EE6-41BF-FD88104F0692";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "b_2_joint" -p "b_2";
	rename -uid "6A72572B-4097-F265-E096-4EBABE5F7AE5";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "b_3_group" -p "b_2";
	rename -uid "716691A0-4EEF-B863-06B3-44A48E64CD3E";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "b_3" -p "b_3_group";
	rename -uid "871EE1BF-41F1-0283-BE06-478C12412B24";
createNode nurbsCurve -n "b_3_3Shape" -p "b_3";
	rename -uid "84B3C965-403B-5751-E394-4FA216DDFA4A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "b_3_joint" -p "b_3";
	rename -uid "5D42BA5B-486A-6A41-E99C-0A81027D6BD0";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "b_4_group" -p "b_3";
	rename -uid "75D59EB0-4619-5CEE-7FF5-8C86FBB9A56C";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "b_4" -p "b_4_group";
	rename -uid "7B42C547-4AE1-378D-B029-60B55498EF4D";
createNode nurbsCurve -n "b_4_3Shape4" -p "b_4";
	rename -uid "82112086-4DE9-ACEB-F5F8-29835053AD9B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "b_4_joint" -p "b_4";
	rename -uid "3EDC66E8-4AA2-742B-A9E9-D6BAD31CA523";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_10" -p "b_4";
	rename -uid "093CEAF1-4344-0158-688B-1CB556E62DEB";
	setAttr ".v" no;
createNode locator -n "surfLoc_10Shape" -p "surfLoc_10";
	rename -uid "BC727251-4F6B-E5AB-08CD-B0B9613607F0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_25" -p "b_3";
	rename -uid "FBB9DA43-4695-4B38-EB31-BFACC6981E26";
	setAttr ".v" no;
createNode locator -n "surfLoc_25Shape" -p "surfLoc_25";
	rename -uid "49A7175B-4256-7A44-1536-AD86B22C8DE3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_40" -p "b_2";
	rename -uid "F63189D0-483D-3336-7665-90AE797D1B2C";
	setAttr ".v" no;
createNode locator -n "surfLoc_40Shape" -p "surfLoc_40";
	rename -uid "CA859CE6-4756-0FA0-BFBF-6CB2DFBF9FB3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_55" -p "b_1";
	rename -uid "B59DC86E-4D53-1749-1F74-69A385FEBDEE";
	setAttr ".v" no;
createNode locator -n "surfLoc_55Shape" -p "surfLoc_55";
	rename -uid "B9E8AC1A-495B-1F2A-38B4-0BAE30CA3FC4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "l_group" -p "controls";
	rename -uid "152C3D7F-4B77-616A-72B4-E09242E3BF24";
createNode transform -n "l_1_1_group" -p "l_group";
	rename -uid "393D1FF2-4F74-8712-8132-D4B200F57EDF";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_1_1" -p "l_1_1_group";
	rename -uid "F75D0D90-4B39-8305-E2C4-C48DC52DA0B5";
createNode nurbsCurve -n "l_1_1Shape" -p "l_1_1";
	rename -uid "DCD688C3-42EF-0B08-69C8-A48BE9FDEB97";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "l_1_1_joint" -p "l_1_1";
	rename -uid "6A2E2FAC-4117-06B5-8578-6994537555F0";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_1_2_group" -p "l_1_1";
	rename -uid "F32AD8BE-46E9-1678-C56A-5F83D1DCE407";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_1_2" -p "l_1_2_group";
	rename -uid "EC3CF0A7-41A9-7B7B-455E-E0865FDCF2A5";
createNode nurbsCurve -n "l_1_2Shape" -p "l_1_2";
	rename -uid "0B23F1BE-4229-5595-0BF8-4891F3D67825";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_1_2_joint" -p "l_1_2";
	rename -uid "4DD0B229-40C5-5C94-3F86-55AF686E07A9";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_1_3_group" -p "l_1_2";
	rename -uid "C9287FBA-44A9-317D-D8C5-7CBB06241F61";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_1_3" -p "l_1_3_group";
	rename -uid "224534FC-4345-D64A-BDCD-18A77CEAB4AE";
createNode nurbsCurve -n "l_1_3_3Shape" -p "l_1_3";
	rename -uid "7F50634C-4BD4-A99F-411C-9385BA85F009";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_1_3_joint" -p "l_1_3";
	rename -uid "86610D21-42C2-80B0-A315-1EA81719F35E";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_18" -p "l_1_3";
	rename -uid "32362884-4D0C-7DDC-6C1D-7995DFE0F6C4";
	setAttr ".v" no;
createNode locator -n "surfLoc_18Shape" -p "surfLoc_18";
	rename -uid "53191CC7-4ADF-7612-B0C2-149E9BA20E12";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "l_1_4_group" -p "l_1_3_group";
	rename -uid "3E9BC869-4186-10F6-6879-19A3A06532D5";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_1_4" -p "l_1_4_group";
	rename -uid "40F352D2-4AF7-358A-87D4-3F85FAACB8CA";
createNode nurbsCurve -n "l_1_4_3Shape4" -p "l_1_4";
	rename -uid "8F2E03B0-49E5-736E-704D-57936AC056D7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_1_4_joint" -p "l_1_4";
	rename -uid "349EC627-421A-FDC8-AD78-4B835050D1EC";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_3" -p "l_1_4";
	rename -uid "A6E77E6A-4DC1-1D5E-E074-EB95A34F54B5";
	setAttr ".v" no;
createNode locator -n "surfLoc_3Shape" -p "surfLoc_3";
	rename -uid "D2942AA3-4561-CA96-12D5-9EAF7809998B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_33" -p "l_1_2";
	rename -uid "F6B2030D-4060-EFA5-E40C-FAAE23769BB0";
	setAttr ".v" no;
createNode locator -n "surfLoc_33Shape" -p "surfLoc_33";
	rename -uid "AD6BDF0D-46B2-800B-EE0C-1A82DEF29DDB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_48" -p "l_1_1";
	rename -uid "75966F0B-4517-06BC-6B96-D1AA57005E50";
	setAttr ".v" no;
createNode locator -n "surfLoc_48Shape" -p "surfLoc_48";
	rename -uid "B20F17BB-4570-9939-5E2D-39A6976E04EF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "l_2_1_group" -p "l_group";
	rename -uid "492098F7-445A-7C45-BDF0-B69DEFCA5DF0";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_2_1" -p "l_2_1_group";
	rename -uid "0DD24464-45A6-5174-31A1-5CBD362464AA";
createNode nurbsCurve -n "l_2_1Shape" -p "l_2_1";
	rename -uid "7761C316-4226-F140-8F70-3A901AA4B9A0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "l_2_1_joint" -p "l_2_1";
	rename -uid "92345DF2-48A3-7C7F-4A81-12957AA6F079";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_2_2_group" -p "l_2_1";
	rename -uid "31AB2A0C-4292-91E6-2AC0-31A965FA7FF0";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_2_2" -p "l_2_2_group";
	rename -uid "AC68429F-4AFA-7366-D116-FB9528973DF5";
createNode nurbsCurve -n "l_2_2Shape" -p "l_2_2";
	rename -uid "1CAF2447-4803-B846-8F02-51A90254CCA0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_2_2_joint" -p "l_2_2";
	rename -uid "D3AB0C09-4311-CEF1-14EC-EFA104A3D164";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_2_3_group" -p "l_2_2";
	rename -uid "8DFA1CBF-4974-B4C6-CD58-6484E589C008";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_2_3" -p "l_2_3_group";
	rename -uid "CB4DF5BD-4982-77A2-9F49-CA9AA65E1633";
createNode nurbsCurve -n "l_2_3_3Shape" -p "l_2_3";
	rename -uid "F9A3D134-4D67-1281-4EA8-5487BA2ABCC5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_2_3_joint" -p "l_2_3";
	rename -uid "982A4ECB-4236-2D1D-74D0-C19AE38BB0C1";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_2_4_group" -p "l_2_3";
	rename -uid "18A4DB26-4AF3-2A8F-DC9D-AC94FF201CBA";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_2_4" -p "l_2_4_group";
	rename -uid "73E5119F-4736-3FC4-A8ED-BF85B4D0A74A";
createNode nurbsCurve -n "l_2_4_3Shape4" -p "l_2_4";
	rename -uid "D5859925-4721-54ED-646B-2B9BB2E7608B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_2_4_joint" -p "l_2_4";
	rename -uid "ECAAD603-4E75-251D-CCCA-178C44C44C44";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_2" -p "l_2_4";
	rename -uid "EDA74348-4925-CD20-CD35-6FBEBD1B48ED";
	setAttr ".v" no;
createNode locator -n "surfLoc_2Shape" -p "surfLoc_2";
	rename -uid "48D5DB38-40D1-F617-6B8B-B5A6FF951511";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_14" -p "l_2_4";
	rename -uid "6BBC71AF-4A7E-1B7C-307F-1381FFC7085C";
	setAttr ".v" no;
createNode locator -n "surfLoc_14Shape" -p "surfLoc_14";
	rename -uid "F31E4321-4B64-4795-7C44-5788A8A9FD1B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_29" -p "l_2_3";
	rename -uid "2D38EF6E-4F35-4446-E15C-F49D705118BA";
	setAttr ".v" no;
createNode locator -n "surfLoc_29Shape" -p "surfLoc_29";
	rename -uid "C69C6901-4C0D-0AAE-C6E4-81875E50365A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_17" -p "l_2_3";
	rename -uid "72A80745-4529-47F8-2208-0AA478935B66";
	setAttr ".v" no;
createNode locator -n "surfLoc_17Shape" -p "surfLoc_17";
	rename -uid "69240F99-481B-6A32-C9CB-26BB4486F11A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_32" -p "l_2_2";
	rename -uid "7C5EB6B0-4D62-F419-1F70-C791517608E4";
	setAttr ".v" no;
createNode locator -n "surfLoc_32Shape" -p "surfLoc_32";
	rename -uid "C4AAE30F-4AF9-A475-F3E4-1BBC7F9CB831";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_44" -p "l_2_2";
	rename -uid "0638DB0B-4504-566F-90C4-FEAEC5C3AE2D";
	setAttr ".v" no;
createNode locator -n "surfLoc_44Shape" -p "surfLoc_44";
	rename -uid "F9C04C1B-4D31-14EF-6D05-9AA455587357";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_59" -p "l_2_1";
	rename -uid "DF63DC85-40B8-F6F8-4236-5D9B8EE2958F";
	setAttr ".v" no;
createNode locator -n "surfLoc_59Shape" -p "surfLoc_59";
	rename -uid "61285F78-4414-909D-C3C7-E5A5E3971EBA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_47" -p "l_2_1";
	rename -uid "BEE8CA00-4DF1-46CB-F65E-1CB7B8A10C71";
	setAttr ".v" no;
createNode locator -n "surfLoc_47Shape" -p "surfLoc_47";
	rename -uid "41B57C42-48ED-FC26-4B93-09B7E356F5AC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "l_3_1_group" -p "l_group";
	rename -uid "589BC1F9-444F-6557-CF2F-C281D7242438";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_3_1" -p "l_3_1_group";
	rename -uid "696AA0D7-4C5E-853B-F75B-A3A190260F13";
createNode nurbsCurve -n "l_3_1Shape" -p "l_3_1";
	rename -uid "D80B5345-4BD6-F1ED-5A3E-39BEC3152BE0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "l_3_1_joint" -p "l_3_1";
	rename -uid "F102C6F9-4992-8F6B-77C4-63B5BDDFA849";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_3_2_group" -p "l_3_1";
	rename -uid "7D82555C-4F92-9651-A0E0-07AA4ACBBAE1";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_3_2" -p "l_3_2_group";
	rename -uid "46267CA5-42CE-F30A-D949-9F802A3873DF";
createNode nurbsCurve -n "l_3_2Shape" -p "l_3_2";
	rename -uid "9198ECE2-42E5-77FE-C6E2-B28613E8B451";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_3_2_joint" -p "l_3_2";
	rename -uid "B662A23D-4FEB-335F-F1F7-E98A73BC6640";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_3_3_group" -p "l_3_2";
	rename -uid "5B766870-4E6B-B3B6-20E7-DC9B75D8A54B";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_3_3" -p "l_3_3_group";
	rename -uid "1285151F-403C-4459-849E-7BB8952CA317";
createNode nurbsCurve -n "l_3_3_3Shape" -p "l_3_3";
	rename -uid "E6542224-46C0-2D8B-685E-BA9F5021445B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_3_3_joint" -p "l_3_3";
	rename -uid "B0022AA7-4495-5D7A-7E6B-89A059BC3111";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_3_4_group" -p "l_3_3";
	rename -uid "3AFF861C-46D0-971E-6678-398EAA755468";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_3_4" -p "l_3_4_group";
	rename -uid "D14D8C17-4E3E-8B8E-C06E-22AA799B355F";
createNode nurbsCurve -n "l_3_4_3Shape4" -p "l_3_4";
	rename -uid "EBF510EA-457E-9376-0558-C7872BB02765";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_3_4_joint" -p "l_3_4";
	rename -uid "5A4E3FD5-47C2-1FA2-D457-CB85345337DC";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_1" -p "l_3_4";
	rename -uid "0F3B9AD1-4BBC-2B56-3F98-DA92FF8CD10C";
	setAttr ".v" no;
createNode locator -n "surfLoc_1Shape" -p "surfLoc_1";
	rename -uid "16FB8ACA-43D1-BFEC-1D7C-5180BF361BF0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_13" -p "l_3_4";
	rename -uid "C3871BCA-43BC-5C94-5970-238669EF3DAE";
	setAttr ".v" no;
createNode locator -n "surfLoc_13Shape" -p "surfLoc_13";
	rename -uid "8EEEA9BD-400B-E87C-9D7D-CCBB75A01FA5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_16" -p "l_3_3";
	rename -uid "A9ADFF61-4F21-E099-A848-9B95A8B084B7";
	setAttr ".v" no;
createNode locator -n "surfLoc_16Shape" -p "surfLoc_16";
	rename -uid "A016C0F5-4C15-3C32-F733-75AD95BA0741";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_28" -p "l_3_3";
	rename -uid "D48A4F9A-4013-18E1-21E6-5392F6DD8F5E";
	setAttr ".v" no;
createNode locator -n "surfLoc_28Shape" -p "surfLoc_28";
	rename -uid "FC943D83-4AA4-7DE1-60B6-CEB4C1183201";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_31" -p "l_3_2";
	rename -uid "DDAF792C-4B71-C693-B9FB-AB905C6AD655";
	setAttr ".v" no;
createNode locator -n "surfLoc_31Shape" -p "surfLoc_31";
	rename -uid "43156758-4611-95AD-A977-1BB339332173";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_43" -p "l_3_2";
	rename -uid "BCA7BD19-46F4-7B7A-9952-38B99CBA4F41";
	setAttr ".v" no;
createNode locator -n "surfLoc_43Shape" -p "surfLoc_43";
	rename -uid "CE254758-450C-E8F1-6D89-E996FA6D6229";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_46" -p "l_3_1";
	rename -uid "0E88E07A-4532-8D6E-8EE9-3CA0FEB5451A";
	setAttr ".v" no;
createNode locator -n "surfLoc_46Shape" -p "surfLoc_46";
	rename -uid "54240C4A-41BB-CA3C-3FA0-D7BF08D8DFF7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_58" -p "l_3_1";
	rename -uid "2072948E-4B5E-9870-76BE-91B9C2F4F673";
	setAttr ".v" no;
createNode locator -n "surfLoc_58Shape" -p "surfLoc_58";
	rename -uid "15609F16-44BD-6010-BB35-7A8042934090";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "l_4_1_group" -p "l_group";
	rename -uid "E587DB33-4B32-A031-D3F3-2295ED8C6B00";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_4_1" -p "l_4_1_group";
	rename -uid "1D495566-47AC-D2A5-93C6-81BD613A39C0";
createNode nurbsCurve -n "l_4_1Shape" -p "l_4_1";
	rename -uid "2029CE95-4762-1110-2BB9-59A06A404429";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "l_4_1_joint" -p "l_4_1";
	rename -uid "1DD5F493-4848-E4E7-EABB-B585DDAACBCC";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_4_2_group" -p "l_4_1";
	rename -uid "2D4F2E35-41C5-3C5A-5A6F-ECBF002492A0";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_4_2" -p "l_4_2_group";
	rename -uid "9920BAB8-4B6C-5126-4201-B1A800212193";
createNode nurbsCurve -n "l_4_2Shape" -p "l_4_2";
	rename -uid "82D63801-4D64-0961-D5BB-CBA936DFE78C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_4_2_joint" -p "l_4_2";
	rename -uid "B9AD593F-4A50-29F2-C051-1782E2557817";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_4_3_group" -p "l_4_2";
	rename -uid "D01CE235-47B8-9D96-0452-1FB18F3080C8";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_4_3" -p "l_4_3_group";
	rename -uid "A6D3FD45-49B3-8275-9A7B-2E87776C3886";
createNode nurbsCurve -n "l_4_3_3Shape" -p "l_4_3";
	rename -uid "AA106ECD-4034-0A50-C0B1-1C99DD53A4ED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_4_3_joint" -p "l_4_3";
	rename -uid "9AAFDC7A-484D-F118-CA11-96B00DFACE63";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_4_4_group" -p "l_4_3";
	rename -uid "E2A45EA5-4E49-D32E-EC6F-59A0964DA11E";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_4_4" -p "l_4_4_group";
	rename -uid "19B5E771-4E0F-BF77-1A1B-46BBDDC5568B";
createNode nurbsCurve -n "l_4_4_3Shape4" -p "l_4_4";
	rename -uid "2ECD8F05-4B72-EF58-FB6A-D4BB2197199D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_4_4_joint" -p "l_4_4";
	rename -uid "1A4CC913-42F5-EC9C-58C0-AB864FF1D2A0";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_0" -p "l_4_4";
	rename -uid "EDE72627-4E56-BDAE-146B-C2BE951BCCAC";
	setAttr ".v" no;
createNode locator -n "surfLoc_0Shape" -p "surfLoc_0";
	rename -uid "62092A98-4844-C3EC-AE83-1390FC8FD80E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_12" -p "l_4_4";
	rename -uid "1A6503D9-4AB7-099F-0552-9A9D69CBBEA3";
	setAttr ".v" no;
createNode locator -n "surfLoc_12Shape" -p "surfLoc_12";
	rename -uid "2C2C7C7C-46A4-B40B-68B8-55AA213F8D32";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_15" -p "l_4_3";
	rename -uid "D5A2877E-4DC9-C308-7C43-62A03363BED1";
	setAttr ".v" no;
createNode locator -n "surfLoc_15Shape" -p "surfLoc_15";
	rename -uid "8570DB22-4E59-8B72-BA6F-C78368049E9D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_27" -p "l_4_3";
	rename -uid "65F4B41C-41D0-ACC1-9B88-FFA286F3AE8D";
	setAttr ".v" no;
createNode locator -n "surfLoc_27Shape" -p "surfLoc_27";
	rename -uid "1BAFCBA2-44DD-C296-2C06-18879777165F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_30" -p "l_4_2";
	rename -uid "CD667ECB-4A66-D42D-015A-859CF74537B2";
	setAttr ".v" no;
createNode locator -n "surfLoc_30Shape" -p "surfLoc_30";
	rename -uid "52F5CB76-46C4-3A33-2F2B-669023DBB465";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_42" -p "l_4_2";
	rename -uid "31FBF271-48F4-2E9F-2D12-809F15CE097B";
	setAttr ".v" no;
createNode locator -n "surfLoc_42Shape" -p "surfLoc_42";
	rename -uid "08A0D134-4C4E-6F0C-1735-D292FF727D0E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_57" -p "l_4_1";
	rename -uid "658EF3A9-4A75-B9B0-AF18-FE86713C7CC1";
	setAttr ".v" no;
createNode locator -n "surfLoc_57Shape" -p "surfLoc_57";
	rename -uid "6614D729-4FD1-B15C-FFF4-FE91EF380415";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_45" -p "l_4_1";
	rename -uid "44279A26-49AB-9A3F-2360-6FBC7902FAFE";
	setAttr ".v" no;
createNode locator -n "surfLoc_45Shape" -p "surfLoc_45";
	rename -uid "F6928369-4050-1C3E-8B84-57BF06D0D9D0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "l_5_1_group" -p "l_group";
	rename -uid "28A463E1-436C-CC94-EBA3-DE9458EAAC68";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_5_1" -p "l_5_1_group";
	rename -uid "32B18BDB-4CEC-A652-8D3C-CB8A453230D5";
createNode nurbsCurve -n "l_5_1Shape" -p "l_5_1";
	rename -uid "86F52375-49BE-9218-06F4-C4A8CCD584BF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "l_5_1_joint" -p "l_5_1";
	rename -uid "9152B21F-4C3A-C62D-0F93-28A0B0931FB6";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_5_2_group" -p "l_5_1";
	rename -uid "08011B06-4828-4E97-C1D5-D9BC63D5E7FF";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_5_2" -p "l_5_2_group";
	rename -uid "848E1AF7-41DC-748E-882C-8095939DD292";
createNode nurbsCurve -n "l_5_2Shape" -p "l_5_2";
	rename -uid "B9ADB909-45AD-DC69-55A5-B3835DD6E114";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_5_2_joint" -p "l_5_2";
	rename -uid "3516B3AD-4D12-39F2-C195-479FCF3A23D8";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_5_3_group" -p "l_5_2";
	rename -uid "C6D5EF61-4A89-F833-936C-B98E35B6E98B";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_5_3" -p "l_5_3_group";
	rename -uid "412E4A36-4C2B-39B4-2B36-4EBDBD9A1EA5";
createNode nurbsCurve -n "l_5_3_3Shape" -p "l_5_3";
	rename -uid "29A7810B-44B5-55C8-6B9A-7DABF2B4D067";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_5_3_joint" -p "l_5_3";
	rename -uid "83160CE9-4B0E-93A3-CE46-E59BE3595B55";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "l_5_4_group" -p "l_5_3";
	rename -uid "25761259-435E-DA48-9949-7B9D8F1F7755";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "l_5_4" -p "l_5_4_group";
	rename -uid "602CAD58-42F3-214F-0EA7-5F8BAEBB114E";
createNode nurbsCurve -n "l_5_4_3Shape4" -p "l_5_4";
	rename -uid "043022B7-423C-48A1-7D0D-C3AE39077EDB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "l_5_4_joint" -p "l_5_4";
	rename -uid "6EEDF306-4263-8456-6F23-59810FCCB139";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_11" -p "l_5_4";
	rename -uid "B9181CD0-431B-B421-11A6-9592DE13B192";
	setAttr ".v" no;
createNode locator -n "surfLoc_11Shape" -p "surfLoc_11";
	rename -uid "4735358F-428E-A4BA-C154-B892083FD27F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_26" -p "l_5_3";
	rename -uid "6BE09F17-4723-2BA1-5A91-F9A2B192A89D";
	setAttr ".v" no;
createNode locator -n "surfLoc_26Shape" -p "surfLoc_26";
	rename -uid "BE78566C-4D60-C03E-0349-95B997880D73";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_41" -p "l_5_2";
	rename -uid "CC7FA542-466C-27F9-0D6B-6F92A865BAA4";
	setAttr ".v" no;
createNode locator -n "surfLoc_41Shape" -p "surfLoc_41";
	rename -uid "F3EC51FB-48F7-54B3-60BC-668DBD472707";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_56" -p "l_5_1";
	rename -uid "60C39A64-4704-9688-2210-B4882CC101FD";
	setAttr ".v" no;
createNode locator -n "surfLoc_56Shape" -p "surfLoc_56";
	rename -uid "C88454D8-4539-5025-08FA-86B2C774C468";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "r_group" -p "controls";
	rename -uid "1CD680E0-430E-FCEE-3D31-E2A8823A9728";
	setAttr ".s" -type "double3" -1 1 1 ;
createNode transform -n "r_1_1_group" -p "r_group";
	rename -uid "96EA65EC-43F3-6374-8589-0987A069C07E";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_1_1" -p "r_1_1_group";
	rename -uid "8672B8B2-4256-A40A-46EB-979566FF3A94";
createNode nurbsCurve -n "r_1_1Shape" -p "r_1_1";
	rename -uid "2CF2E589-46F1-1AE5-0804-E982FFC3621D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "r_1_1_joint" -p "r_1_1";
	rename -uid "B6E68684-489F-103F-7826-2F9F17D849FD";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_1_2_group" -p "r_1_1";
	rename -uid "329F4280-4A02-8DAE-8EA9-9D8827FF842C";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_1_2" -p "r_1_2_group";
	rename -uid "E95BB33E-40C4-08BA-B967-38A5F74A4114";
createNode nurbsCurve -n "r_1_2Shape" -p "r_1_2";
	rename -uid "E35F9B2C-4BCD-9DC3-696C-68A020BC9C00";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_1_2_joint" -p "r_1_2";
	rename -uid "31535833-4E80-05CD-1B73-B0B4906A05E6";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_1_3_group" -p "r_1_2";
	rename -uid "5069BFFF-467C-DD7F-B72B-FB95842B2A2F";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_1_3" -p "r_1_3_group";
	rename -uid "CA699988-466F-7616-4D2E-F18111AE3E41";
createNode nurbsCurve -n "r_1_3_3Shape" -p "r_1_3";
	rename -uid "4C3E100D-4EC0-EA1D-096C-009AC3866D0A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_1_3_joint" -p "r_1_3";
	rename -uid "8CC46085-44E8-93CF-7C09-608FD57D204E";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_20" -p "r_1_3";
	rename -uid "117B7A62-44EB-74DE-DE6F-68A148DFF419";
	setAttr ".v" no;
createNode locator -n "surfLoc_20Shape" -p "surfLoc_20";
	rename -uid "06E65620-458E-435F-92E1-11B9E571ECBC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "r_1_4_group" -p "r_1_3_group";
	rename -uid "FFC551DF-461F-5786-DA56-FB807782BFA1";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_1_4" -p "r_1_4_group";
	rename -uid "BB2A47C6-487C-4093-BE2E-1BA6ABBE6DAE";
createNode nurbsCurve -n "r_1_4_3Shape" -p "r_1_4";
	rename -uid "D159F989-400A-EBB5-E3C0-66809D7BABCA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_1_4_joint" -p "r_1_4";
	rename -uid "28CDA0CF-469B-F457-4E9B-9C8DE622B87F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_5" -p "r_1_4";
	rename -uid "66DB7A56-429D-64D7-9C42-068BAFD806E9";
	setAttr ".v" no;
createNode locator -n "surfLoc_5Shape" -p "surfLoc_5";
	rename -uid "EE71BCEB-4960-388F-E0F5-EFB8A4AE25E9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_35" -p "r_1_2";
	rename -uid "E7BEA4CD-44C3-D08C-9223-66AA9C3F8233";
	setAttr ".v" no;
createNode locator -n "surfLoc_35Shape" -p "surfLoc_35";
	rename -uid "26BFEE97-4D44-7DED-57BD-33AFC5DE5190";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_50" -p "r_1_1";
	rename -uid "D3CAAB4B-4247-A555-1147-F4B2CB15309B";
	setAttr ".v" no;
createNode locator -n "surfLoc_50Shape" -p "surfLoc_50";
	rename -uid "4DD13A7C-4185-2473-19A2-30B6729E1F2B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "r_2_1_group" -p "r_group";
	rename -uid "D372F8EE-4F3A-0F17-D095-A0AC3F1D8D55";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_2_1" -p "r_2_1_group";
	rename -uid "700DA5B7-480D-FF0B-D304-E9B5558ACE51";
createNode nurbsCurve -n "r_2_1Shape" -p "r_2_1";
	rename -uid "8C9E9AAF-464B-37F8-CCD8-E9865083775C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "r_2_1_joint" -p "r_2_1";
	rename -uid "74C0A529-418E-042A-FB77-C6B648FA905B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_2_2_group" -p "r_2_1";
	rename -uid "AB28975E-4285-CB16-C619-05AAC22C4086";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_2_2" -p "r_2_2_group";
	rename -uid "5862150D-4699-175F-492B-67A16FE11CAC";
createNode nurbsCurve -n "r_2_2Shape" -p "r_2_2";
	rename -uid "E1AD07E1-4230-6B32-45ED-04A5605E6911";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_2_2_joint" -p "r_2_2";
	rename -uid "856B5D42-47BA-C41D-9853-68B3857DACE7";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_2_3_group" -p "r_2_2";
	rename -uid "AF671A3F-4D50-A128-70DF-FBA4AFFAF8FE";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_2_3" -p "r_2_3_group";
	rename -uid "E5DE6221-48C5-4022-71CD-E785EABD6922";
createNode nurbsCurve -n "r_2_3_3Shape" -p "r_2_3";
	rename -uid "5CB6140A-4086-0356-4EDD-079479E0CF39";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_2_3_joint" -p "r_2_3";
	rename -uid "2EFDDF54-46DB-8762-93FC-6CAEF90E3154";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_2_4_group" -p "r_2_3";
	rename -uid "A7FA735C-4AE8-2212-33A2-8680DBC69B9B";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_2_4" -p "r_2_4_group";
	rename -uid "DC97349C-4F4E-A3EE-E9BD-0184DDDE0480";
createNode nurbsCurve -n "r_2_4_3Shape" -p "r_2_4";
	rename -uid "93E78977-449E-2365-E319-A980A3538956";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_2_4_joint" -p "r_2_4";
	rename -uid "EC0062FA-47DA-E329-B4D5-6DA215395F13";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_6" -p "r_2_4";
	rename -uid "CBFEA15C-4F2F-15EB-A713-F587F2E168B7";
	setAttr ".v" no;
createNode locator -n "surfLoc_6Shape" -p "surfLoc_6";
	rename -uid "003EEB06-4AAE-80F6-EABF-7389C625BFD1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_21" -p "r_2_3";
	rename -uid "CCE323E6-4FF6-0450-6BDB-9B93A5CCD81E";
	setAttr ".v" no;
createNode locator -n "surfLoc_21Shape" -p "surfLoc_21";
	rename -uid "ADCFD271-4849-E324-0F6C-E09B637E98C8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_36" -p "r_2_2";
	rename -uid "7CCFDE44-4807-1B1A-EB14-7A9A4218610D";
	setAttr ".v" no;
createNode locator -n "surfLoc_36Shape" -p "surfLoc_36";
	rename -uid "7697AEB4-41CA-A127-1D76-B6AA40C2D47E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_51" -p "r_2_1";
	rename -uid "514E58ED-4EAE-3FA5-1DAC-9ABB203575E3";
	setAttr ".v" no;
createNode locator -n "surfLoc_51Shape" -p "surfLoc_51";
	rename -uid "AD231A03-4F36-F086-5BD5-0A867A7F6E4E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "r_3_1_group" -p "r_group";
	rename -uid "186E4133-4B34-5CA3-9C80-C08B11965346";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_3_1" -p "r_3_1_group";
	rename -uid "33A4C4C8-4E2D-D485-6493-E98990DDAD18";
createNode nurbsCurve -n "r_3_1Shape" -p "r_3_1";
	rename -uid "0F669877-4F19-BB35-FE92-598B7D7C4F65";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "r_3_1_joint" -p "r_3_1";
	rename -uid "B672B677-47B7-961A-4ADA-81B02643423F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_3_2_group" -p "r_3_1";
	rename -uid "3A2E5E83-4FC1-E3E1-B604-359C4428FA3A";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_3_2" -p "r_3_2_group";
	rename -uid "165DD689-4EE4-3814-1B54-F8853767FA1C";
createNode nurbsCurve -n "r_3_2Shape" -p "r_3_2";
	rename -uid "D082846F-4D15-B806-3C73-4CBCB4ED695E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_3_2_joint" -p "r_3_2";
	rename -uid "FFE04280-4524-1FC5-0C8A-A19A155DC57E";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_3_3_group" -p "r_3_2";
	rename -uid "77300FE0-488E-5A6F-7F46-328AEEDC0C37";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_3_3" -p "r_3_3_group";
	rename -uid "6D86E19F-493E-359A-5165-B296A3E7A7D5";
createNode nurbsCurve -n "r_3_3_3Shape" -p "r_3_3";
	rename -uid "DF196387-42A4-087C-2178-CFBDBB6A22C1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_3_3_joint" -p "r_3_3";
	rename -uid "F20BE8E9-4322-746A-E375-F3A4F9F758CF";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_3_4_group" -p "r_3_3";
	rename -uid "CAC200E2-4992-3EB6-55E0-6698F44BC42E";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_3_4" -p "r_3_4_group";
	rename -uid "0E0C81F0-4C99-7B26-EDD9-3D8453C80C43";
createNode nurbsCurve -n "r_3_4_3Shape" -p "r_3_4";
	rename -uid "6FE0356D-4D77-4E62-8BE4-90B72E3A1EF9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_3_4_joint" -p "r_3_4";
	rename -uid "390AFB75-4408-F0EB-3DFB-4DBEBAAB1747";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_7" -p "r_3_4";
	rename -uid "6303B7BE-4FC2-A590-695A-438E87AD7B0E";
	setAttr ".v" no;
createNode locator -n "surfLoc_7Shape" -p "surfLoc_7";
	rename -uid "7FCDF37E-41C1-FE0D-AD88-2E8079453B0E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_22" -p "r_3_3";
	rename -uid "0D43E91D-4B0D-D055-60FD-8C850080F67A";
	setAttr ".v" no;
createNode locator -n "surfLoc_22Shape" -p "surfLoc_22";
	rename -uid "19BBC4BC-410C-DC8C-4B51-02A1E07979FE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_37" -p "r_3_2";
	rename -uid "9570915F-470C-0766-008C-3981996A2BDE";
	setAttr ".v" no;
createNode locator -n "surfLoc_37Shape" -p "surfLoc_37";
	rename -uid "B6A539A1-4E36-1B6D-27B5-8CB41E33BF57";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_52" -p "r_3_1";
	rename -uid "EEAD84CB-47FE-D761-6446-83B2955F85A1";
	setAttr ".v" no;
createNode locator -n "surfLoc_52Shape" -p "surfLoc_52";
	rename -uid "055D31E4-4276-29DB-1C80-988ED6175710";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "r_4_1_group" -p "r_group";
	rename -uid "2DA30086-4354-C00B-902F-CCBDF5D4323C";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_4_1" -p "r_4_1_group";
	rename -uid "6A3D4CF1-4B1D-1593-83CD-F98D932C2B8F";
createNode nurbsCurve -n "r_4_1Shape" -p "r_4_1";
	rename -uid "6FF766CC-42E8-3DCD-EFB1-0E98DC0E8B0F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "r_4_1_joint" -p "r_4_1";
	rename -uid "226E0060-44DA-3438-000C-AD8321A4D46B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_4_2_group" -p "r_4_1";
	rename -uid "2432B515-471C-5AA6-C28F-0080F7B4FD05";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_4_2" -p "r_4_2_group";
	rename -uid "AC6D6397-4C83-93DA-B2B1-F8A02F472AF8";
createNode nurbsCurve -n "r_4_2Shape" -p "r_4_2";
	rename -uid "31729AB3-4001-8392-4E01-E3B438941D63";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_4_2_joint" -p "r_4_2";
	rename -uid "3FC08675-4607-8071-FCFB-00B408266EE0";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_4_3_group" -p "r_4_2";
	rename -uid "137DBDDF-4AC1-77BE-7915-ACB1B851B3E4";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_4_3" -p "r_4_3_group";
	rename -uid "376DC7AB-4C39-8FF6-2AB2-5CB180087A68";
createNode nurbsCurve -n "r_4_3_3Shape" -p "r_4_3";
	rename -uid "6C48DD0E-464C-D054-80AB-C39732490E8C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_4_3_joint" -p "r_4_3";
	rename -uid "B75482EB-46C7-0938-EE54-5DA24BBA9B5F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_4_4_group" -p "r_4_3";
	rename -uid "FD956A8A-4206-85EB-2176-38A094847971";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_4_4" -p "r_4_4_group";
	rename -uid "B9D00175-49DC-3A9B-C279-9BA24EFFB633";
createNode nurbsCurve -n "r_4_4_3Shape" -p "r_4_4";
	rename -uid "AE3D8A50-40D9-9058-47FC-249C5D446D2D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_4_4_joint" -p "r_4_4";
	rename -uid "EA9965E9-4D5F-339F-DC5A-0C8AC2AC455E";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_8" -p "r_4_4";
	rename -uid "41064A6F-41E5-08D2-A014-DFB1D159077D";
	setAttr ".v" no;
createNode locator -n "surfLoc_8Shape" -p "surfLoc_8";
	rename -uid "5AD574B6-4E37-0917-0852-DC99B87039CF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_23" -p "r_4_3";
	rename -uid "D479F130-43D5-A577-6BB9-78BB86AC197D";
	setAttr ".v" no;
createNode locator -n "surfLoc_23Shape" -p "surfLoc_23";
	rename -uid "710B98DC-4F09-4C6B-E5B7-C6BFC75B3C6E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_38" -p "r_4_2";
	rename -uid "C9E95895-4501-562A-35BE-47BD4C5A87B4";
	setAttr ".v" no;
createNode locator -n "surfLoc_38Shape" -p "surfLoc_38";
	rename -uid "81BF243B-40CB-FA0E-C507-6887EC70CFA1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_53" -p "r_4_1";
	rename -uid "9967A334-413B-9711-E6E4-99B2C6FBADF3";
	setAttr ".v" no;
createNode locator -n "surfLoc_53Shape" -p "surfLoc_53";
	rename -uid "4FD617C0-471F-F7EC-7BFE-C2BFBB66062B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "r_5_1_group" -p "r_group";
	rename -uid "080BCE1B-48A2-BC4C-50AF-B7832D80799C";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_5_1" -p "r_5_1_group";
	rename -uid "09C03BD9-42AA-100E-D5C5-F78A973F35CF";
createNode nurbsCurve -n "r_5_1Shape" -p "r_5_1";
	rename -uid "D841455B-4248-2A50-4A23-5390EDA67712";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		-0.17516471531050132 -0.0011604015287643352 -0.25059533330254735
		-0.25059632277548927 -0.0011604015287643489 -0.2505955698188162
		-0.25059341111408251 -0.0011604015287643413 -0.17570872304555218
		-0.25059769394715653 -0.0011604015287643449 -0.090993339444628091
		-0.25059923443689625 -0.0011604015287643489 1.5123934514698919e-06
		-0.25059769394715653 -0.0011604015287643525 0.090996027827356982
		-0.25059341111408251 -0.0011604015287643567 0.1757118888574003
		-0.25059632277548927 -0.0011604015287643489 0.25059852437797547
		-0.17516471531050162 -0.0011604015287643621 0.25060079385109452
		-0.090711674528112449 -0.0011604015287643634 0.25059745562906494
		7.243229066096639e-07 -0.0011604015287643645 0.25059625490485715
		0.090713123173926283 -0.0011604015287643634 0.25059745562906494
		0.17516616395631479 -0.0011604015287643621 0.25060079385109452
		0.25059777142130257 -0.0011604015287643489 0.25059852437797547
		0.25059386298363595 -0.0011604015287643567 0.17571188885739994
		0.2505996119989809 -0.0011604015287643525 0.090996027827357426
		0.25060167985896958 -0.0011604015287643489 1.5123934515115638e-06
		0.2505996119989809 -0.0011604015287643449 -0.090993339444627924
		0.25059386298363595 -0.0011604015287643413 -0.17570872304555185
		0.25059777142130257 -0.0011604015287643489 -0.2505955698188162
		0.1751661639563144 -0.0011604015287643352 -0.25059533330254735
		0.090713123173925922 -0.0011604015287643335 -0.25059568125885517
		7.2432290672364997e-07 -0.001160401528764333 -0.25059580633508499
		-0.090711674528112518 -0.0011604015287643335 -0.25059568125885517
		;
createNode joint -n "r_5_1_joint" -p "r_5_1";
	rename -uid "A64CAF97-4EF4-EEC8-DCB7-C49974A9023D";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_5_2_group" -p "r_5_1";
	rename -uid "348E91BD-431B-7B16-351A-BCA59BD58797";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_5_2" -p "r_5_2_group";
	rename -uid "D3EABF8E-4320-6FC3-ED5E-CF80D4F284DE";
createNode nurbsCurve -n "r_5_2Shape" -p "r_5_2";
	rename -uid "728B8D07-4005-1B97-A52D-B6857721955B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_5_2_joint" -p "r_5_2";
	rename -uid "F23D7799-4B41-0431-67D9-F2972365559A";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_5_3_group" -p "r_5_2";
	rename -uid "8A5DAB69-4C66-7474-8891-508C2D4A1E44";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_5_3" -p "r_5_3_group";
	rename -uid "A4221BDE-403F-80A2-625D-6EBBDB296BB2";
createNode nurbsCurve -n "r_5_3_3Shape" -p "r_5_3";
	rename -uid "9B3B685E-4C6D-8F04-1793-41BB4130CED4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_5_3_joint" -p "r_5_3";
	rename -uid "1F2F783B-4470-1E6A-98AB-459DFE5B8560";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "r_5_4_group" -p "r_5_3";
	rename -uid "A14042C4-4A87-F16F-A5C4-7F944DB9F3E5";
	setAttr ".rp" -type "double3" 0 -1.2325951644078307e-32 0 ;
	setAttr ".sp" -type "double3" 0 -1.2325951644078307e-32 0 ;
createNode transform -n "r_5_4" -p "r_5_4_group";
	rename -uid "89B79666-4A78-06C1-9266-F7B1412D9A62";
createNode nurbsCurve -n "r_5_4_3Shape" -p "r_5_4";
	rename -uid "385ED09F-4D4F-8CED-AF83-98814770AE0D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 24 2 no 3
		29 -0.083333333333333329 -0.041666666666666664 0 0.041666666666666664 0.083333333333333329
		 0.125 0.16666666666666666 0.20833333333333337 0.25 0.29166666666666669 0.33333333333333331
		 0.375 0.41666666666666674 0.45833333333333326 0.5 0.54166666666666663 0.58333333333333337
		 0.625 0.66666666666666663 0.70833333333333337 0.75 0.79166666666666652 0.83333333333333348
		 0.875 0.91666666666666652 0.95833333333333348 1 1.0416666666666667 1.0833333333333333
		
		27
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		-0.17516471531050132 -1.4831162971676099e-16 -0.25059533330254735
		-0.25059632277548927 -1.617374903455333e-16 -0.2505955698188162
		-0.25059341111408251 -1.5398750124996536e-16 -0.17570872304555218
		-0.25059769394715653 -1.5772401427631633e-16 -0.090993339444628091
		-0.25059923443689625 -1.617374937032113e-16 1.5123934514698919e-06
		-0.25059769394715653 -1.6575095829244054e-16 0.090996027827356982
		-0.25059341111408251 -1.6948749237659748e-16 0.1757118888574003
		-0.25059632277548927 -1.617374903455333e-16 0.25059852437797547
		-0.17516471531050162 -1.7516339503607836e-16 0.25060079385109452
		-0.090711674528112449 -1.7671111653575114e-16 0.25059745562906494
		7.243229066096639e-07 -1.7726781607667303e-16 0.25059625490485715
		0.090713123173926283 -1.7671111653575114e-16 0.25059745562906494
		0.17516616395631479 -1.7516339503607846e-16 0.25060079385109452
		0.25059777142130257 -1.617374903455333e-16 0.25059852437797547
		0.25059386298363595 -1.6948749237659748e-16 0.17571188885739994
		0.2505996119989809 -1.6575095829244054e-16 0.090996027827357426
		0.25060167985896958 -1.617374937032113e-16 1.5123934515115638e-06
		0.2505996119989809 -1.5772401427631638e-16 -0.090993339444627924
		0.25059386298363595 -1.5398750124996536e-16 -0.17570872304555185
		0.25059777142130257 -1.617374903455333e-16 -0.2505955698188162
		0.1751661639563144 -1.4831162971676096e-16 -0.25059533330254735
		0.090713123173925922 -1.4676377438855848e-16 -0.25059568125885517
		7.2432290672364997e-07 -1.4620738295365817e-16 -0.25059580633508499
		-0.090711674528112518 -1.4676377438855848e-16 -0.25059568125885517
		;
createNode joint -n "r_5_4_joint" -p "r_5_4";
	rename -uid "05C7D320-4DC9-8531-F897-369A287940DB";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "surfLoc_9" -p "r_5_4";
	rename -uid "AB97B6AB-45DB-5D7D-1408-1CA11C10B615";
	setAttr ".v" no;
createNode locator -n "surfLoc_9Shape" -p "surfLoc_9";
	rename -uid "147CECF7-4647-FE06-886F-51AF8EDCC9A6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_24" -p "r_5_3";
	rename -uid "B80FF49C-4E53-8585-93F1-3EA57A014B7A";
	setAttr ".v" no;
createNode locator -n "surfLoc_24Shape" -p "surfLoc_24";
	rename -uid "DB1AD02A-4D84-FA65-5944-839509C95F87";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_39" -p "r_5_2";
	rename -uid "7496A6C5-4F83-F692-EABA-21A31FAAA25C";
	setAttr ".v" no;
createNode locator -n "surfLoc_39Shape" -p "surfLoc_39";
	rename -uid "F98A71E3-4E4D-8095-5CAA-D6811B403362";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "surfLoc_54" -p "r_5_1";
	rename -uid "D9B5D6A2-4370-634B-5F8E-54B90DEA7AC8";
	setAttr ".v" no;
createNode locator -n "surfLoc_54Shape" -p "surfLoc_54";
	rename -uid "33970F35-43DE-D8AE-6D6D-C7B334FD75D0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "dynamic_control_xform" -p "controls";
	rename -uid "26082670-4ADC-07DD-DB70-A2A128ABE18E";
	setAttr ".t" -type "double3" 8.1588383660491939 0.067608223102206821 0 ;
	setAttr ".s" -type "double3" 4.1351170346992498 4.1351170346992498 4.1351170346992498 ;
createNode transform -n "dynamic_control" -p "dynamic_control_xform";
	rename -uid "7D7D6F5A-4C7C-9E44-501E-3AB5E6C2618F";
	addAttr -ci true -sn "dynamic" -ln "dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "startFrame" -ln "startFrame" -at "long";
	addAttr -ci true -sn "dynamicWeight" -ln "dynamicWeight" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "stiffness" -ln "stiffness" -min 0 -at "double";
	addAttr -ci true -sn "damp" -ln "damp" -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".dynamic" yes;
	setAttr -cb on ".startFrame" 1;
	setAttr -k on ".dynamicWeight" 1;
	setAttr -k on ".stiffness" 1;
	setAttr -k on ".damp" 0.2;
createNode nurbsCurve -n "dynamic_controlShape" -p "dynamic_control";
	rename -uid "4B6EB63C-4ADC-6BEF-D1DD-A9B1618A9B89";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 2 no 3
		39 -0.10000000000000001 -0.050000000000000003 0 1 2 3 4 5 6 7 8 9 10 11 12
		 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 31.050000000000001 31.100000000000001
		 31.150000000000002 32.150000000000006 33.150000000000006
		37
		0.15302462637307429 -0.1330374763360441 -1.0934427007835978e-05
		0.1561432022355288 -0.073916500942902225 -6.1857139379561943e-06
		0.12051231637910986 0.097978875553723893 7.6841190996823627e-06
		0.11623647316356206 0.12309551792656628 9.7094134168251855e-06
		0.11097757581643963 0.1504240132129209 1.1913914636618728e-05
		0.095788402910567727 0.15003118812916708 1.1903693238668467e-05
		0.073127610367599516 0.15214529238915023 1.210552649011376e-05
		0.061035160035477765 0.14836091882755401 1.1818282801723257e-05
		0.058626371235294572 0.14305259386639471 1.1394901356265308e-05
		0.057839383613924711 0.12575120579845825 1.000504313308781e-05
		0.044468078397077337 0.093852076626465136 7.4592798342543176e-06
		0.02018480428016306 0.084120655994778498 6.7110601817965687e-06
		-0.014273318236912969 0.088938407218641241 7.1468465780988311e-06
		-0.029927650953175622 0.10217965019025091 8.2334058721933445e-06
		-0.034666781761803878 0.13496978702614706 1.08762710939736e-05
		-0.039488418573678963 0.15401594025007062 1.2414289007001145e-05
		-0.044846369768605676 0.1553431740294923 1.2528528267718997e-05
		-0.053399416989955428 0.15789928277826618 1.2746057540535816e-05
		-0.079452052464688228 0.15691691499061713 1.2703716248285701e-05
		-0.093707357965315791 0.15323090023909083 1.2427421809402261e-05
		-0.093707357965315874 0.15323090023909072 1.2427421809402261e-05
		-0.097174759768869579 0.14695455427628981 1.1927703910341592e-05
		-0.093167664765886032 0.11744842853890139 9.5498899761459199e-06
		-0.10550808991507998 0.036741607210731192 3.0787265532516983e-06
		-0.12748367026500632 -0.065198513962077959 -5.0859626541388536e-06
		-0.15122725118249147 -0.11071240629395282 -8.7117141407411225e-06
		-0.15614320223552883 -0.12349172972476499 -9.7322093091101181e-06
		-0.14233057727192397 -0.12953774576145208 -1.0237710121874244e-05
		-0.072923145369545195 -0.15219846866516631 -1.2157151205283157e-05
		0.019933802751133822 -0.15789928277826618 -1.2746057540535816e-05
		0.091105969643806795 -0.15563917825260962 -1.2664441818355243e-05
		0.12669699025253023 -0.14869500648842168 -1.2156208091251841e-05
		0.14122311628116735 -0.14374112348614562 -1.1778362777992157e-05
		0.14709921141745752 -0.13996456244758207 -1.1483005252888034e-05
		0.15302462637307429 -0.1330374763360441 -1.0934427007835978e-05
		0.1561432022355288 -0.073916500942902225 -6.1857139379561943e-06
		0.12051231637910986 0.097978875553723893 7.6841190996823627e-06
		;
createNode transform -n "output" -p "mod";
	rename -uid "D65FD662-43FE-8FD0-2F2F-2A8EE067FB7F";
createNode transform -n "outJoints" -p "output";
	rename -uid "AB9FBA0E-4206-D046-3C9E-CF87ED2B65EB";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "B7185932-4DEB-5BCF-441D-1983F84E6457";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode transform -s -n "persp";
	rename -uid "6DD988D0-4F67-01C8-21B5-089512DF5F58";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.5678086450504436 12.741613773224209 21.409827097372588 ;
	setAttr ".r" -type "double3" -18.600000000004471 -709.19999999996026 2.0236918217561297e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C0598692-4A65-CD2F-2E76-769943D8CE56";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 25.532036135275586;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 5.1235496677055457 2.0808766554661062 -3.7528169087132097 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "76B76DF1-4C7C-BBEC-766D-F091444014EB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.8474235009863171 27.22786499289835 0.18014030102896506 ;
	setAttr ".r" -type "double3" -90 -180 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "701B895D-45BA-3625-AE2D-B0A37323752E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 16.851820847142271;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "1D0857E7-4234-8209-D26A-799A73F29C99";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.94962640623841454 5.2539411132707139 22.090933838395166 ;
	setAttr ".r" -type "double3" 0 -720 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "2AF88D17-453B-6B4B-9254-A5A3D4235324";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 24.587486818463926;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "E93973ED-4010-B152-A86B-94A99AC68819";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 29.615940114903477 2.8995751774543836 -0.86612619749623576 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F62AEFB8-46AB-898B-C1BB-8AB607C09A1B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 26.239438236700668;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "poly_dynamic_rig";
	rename -uid "9958639D-426A-2346-8F37-CDB6BECDD97D";
	setAttr ".rp" -type "double3" 0.0027911663055419922 3.2456941604614258 -0.72721445560455322 ;
	setAttr ".sp" -type "double3" 0.0027911663055419922 3.2456941604614258 -0.72721445560455322 ;
createNode transform -n "poly_dynamic" -p "poly_dynamic_rig";
	rename -uid "3031107E-4486-D125-AF4D-25A20E8572D6";
	setAttr ".rp" -type "double3" 0.0027911663055419922 3.2456941604614258 -0.72721445560455322 ;
	setAttr ".sp" -type "double3" 0.0027911663055419922 3.2456941604614258 -0.72721445560455322 ;
createNode transform -n "nCloth1" -p "poly_dynamic";
	rename -uid "7CAA1A5E-42ED-1C08-1E97-4D9C6AF93402";
	setAttr -l on ".t";
	setAttr -l on ".r";
	setAttr -l on ".s";
createNode nCloth -n "nClothShape1" -p "nCloth1";
	rename -uid "AD7A02CF-4548-EFE2-70DB-E388B92ADDC3";
	addAttr -ci true -sn "lifespan" -ln "lifespan" -at "double";
	addAttr -s false -ci true -sn "lifespanPP" -ln "lifespanPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "lifespanPP0" -ln "lifespanPP0" -dt "doubleArray";
	setAttr -k off ".v";
	setAttr ".gf" -type "Int32Array" 0 ;
	setAttr ".pos0" -type "vectorArray" 0 ;
	setAttr ".vel0" -type "vectorArray" 0 ;
	setAttr ".acc0" -type "vectorArray" 0 ;
	setAttr ".mas0" -type "doubleArray" 0 ;
	setAttr ".id0" -type "doubleArray" 0 ;
	setAttr ".nid" 341;
	setAttr ".bt0" -type "doubleArray" 0 ;
	setAttr ".ag0" -type "doubleArray" 0 ;
	setAttr -k off ".dve";
	setAttr -k off ".lfm";
	setAttr -k off ".lfr";
	setAttr -k off ".ead";
	setAttr ".irbx" -type "string" "";
	setAttr ".irax" -type "string" "";
	setAttr ".icx" -type "string" "";
	setAttr -k off ".dw";
	setAttr -k off ".fiw";
	setAttr -k off ".con";
	setAttr -k off ".eiw";
	setAttr -k off ".mxc";
	setAttr -k off ".lod";
	setAttr -k off ".inh";
	setAttr ".cts" 1;
	setAttr -k off ".stf";
	setAttr -k off ".igs";
	setAttr -k off ".ecfh";
	setAttr -k off ".tgs";
	setAttr -k off ".gsm";
	setAttr -k off ".chd";
	setAttr ".chw" 100;
	setAttr -k off ".trd";
	setAttr -k off ".prt";
	setAttr ".thss" 0.1181776225566864;
	setAttr ".scfl" 3;
	setAttr ".por" 0.47271049022674561;
	setAttr -s 2 ".fsc[0:1]"  0 1 1 1 0 1;
	setAttr -s 2 ".pfdo[0:1]"  0 1 1 1 0 1;
	setAttr ".lsou" yes;
	setAttr ".iatm" 1;
	setAttr ".iapv" -type "doubleArray" 341 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
	setAttr ".iamt" 1;
	setAttr -k on ".lifespan" 1;
	setAttr ".lifespanPP0" -type "doubleArray" 0 ;
createNode nucleus -n "nucleus1" -p "poly_dynamic";
	rename -uid "3C7DE184-49CF-8338-3869-43BAC87BC3F0";
createNode transform -n "poly_proxyGeo" -p "poly_dynamic_rig";
	rename -uid "2022BC5C-47C9-AA1E-39A7-B2A3AA1BA001";
	setAttr ".rp" -type "double3" 0.0027911663055419922 3.4915652573108673 -0.72721445560455322 ;
	setAttr ".sp" -type "double3" 0.0027911663055419922 3.4915652573108673 -0.72721445560455322 ;
createNode transform -n "poly_cloth" -p "poly_proxyGeo";
	rename -uid "3F49736E-4DB5-8EB4-9E1F-36B3120A33A3";
createNode mesh -n "poly_clothShape" -p "poly_cloth";
	rename -uid "22AE4777-4ADC-4116-F3A8-9B84F350F149";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 352 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0 1 1 1 0.51145577 0 0.51145577
		 1 0.23999546 0 0.23999546 0.49962494 0 0.49962494 0.23999546 0.49962494 0.09237884
		 0 0.09237884 0.19971229 0 0.19971229 0.09237884 0.19971229 0.02922399 0 0.02922399
		 0.099829264 0 0.099829264 0.02922399 0.19971229 0.059813764 0 0.059813764 0.099829264
		 0.059813764 0.099829264 0.09237884 0.49962494 0.02922399 0.29964319 0 0.29964319
		 0.02922399 0.39961606 0 0.39961606 0.02922399 0.29964319 0.09237884 0.29964319 0.059813764
		 0.49962494 0.059813764 0.39961606 0.059813764 0.39961606 0.09237884 0.19971229 0.23999546
		 0 0.16522093 0.19971229 0.16522093 0 0.12805699 0.19971229 0.12805699 0.099829264
		 0.12805699 0.099829264 0.16522093 0 0.20262143 0.19971229 0.20262143 0.099829264
		 0.20262143 0.099829264 0.23999546 0.49962494 0.16522093 0.29964319 0.16522093 0.29964319
		 0.12805699 0.49962494 0.12805699 0.39961606 0.12805699 0.39961606 0.16522093 0.29964319
		 0.23999546 0.29964319 0.20262143 0.49962494 0.20262143 0.39961606 0.20262143 0.39961606
		 0.23999546 1 0.09237884 0.69972682 0 0.69972682 0.09237884 0.69972682 0.02922399
		 0.59966385 0 0.59966385 0.02922399 0.69972682 0.059813764 0.59966385 0.059813764
		 0.59966385 0.09237884 1 0.02922399 0.79980785 0 0.79980785 0.02922399 0.89990091
		 1 0.89990091 0.02922399 0.79980785 0.09237884 0.79980785 0.059813764 1 0.059813764
		 0.89990091 0.059813764 0.89990091 0.09237884 0.69972682 0.23999546 0.69972682 0.16522093
		 0.69972682 0.12805699 0.59966385 0.12805699 0.59966385 0.16522093 0.69972682 0.20262143
		 0.59966385 0.20262143 0.59966385 0.23999546 1 0.16522093 0.79980785 0.16522093 0.79980785
		 0.12805699 1 0.12805699 0.89990091 0.12805699 0.89990091 0.16522093 0.79980785 0.23999546
		 0.79980785 0.20262143 1 0.20262143 0.89990091 0.20262143 0.89990091 0.23999546 0.49962494
		 0.51145577 0 0.38718152 0.49962494 0.38718152 0.19971229 0.38718152 0 0.3137666 0.19971229
		 0.3137666 0 0.27704099 0.19971229 0.27704099 0.099829264 0.27704099 0.099829264 0.3137666
		 0 0.35057253 0.19971229 0.35057253 0.099829264 0.35057253 0.099829264 0.38718152
		 0.49962494 0.3137666 0.29964319 0.3137666 0.29964319 0.27704099 0.49962494 0.27704099
		 0.39961606 0.27704099 0.39961606 0.3137666 0.29964319 0.38718152 0.29964319 0.35057253
		 0.49962494 0.35057253 0.39961606 0.35057253 0.39961606 0.38718152 0.19971229 0.51145577
		 0 0.45312548 0.19971229 0.45312548 0 0.42162433 0.19971229 0.42162433 0.099829264
		 0.42162433 0.099829264 0.45312548 0 0.48321304 0.19971229 0.48321304 0.099829264
		 0.48321304 0.099829264 0.51145577 0.49962494 0.45312548 0.29964319 0.45312548 0.29964319
		 0.42162433 0.49962494 0.42162433 0.39961606 0.42162433 0.39961606 0.45312548 0.29964319
		 0.51145577 0.29964319 0.48321304 0.49962494 0.48321304 0.39961606 0.48321304 0.39961606
		 0.51145577 1 0.38718152 0.69972682 0.38718152 0.69972682 0.3137666 0.69972682 0.27704099
		 0.59966385 0.27704099 0.59966385 0.3137666 0.69972682 0.35057253 0.59966385 0.35057253
		 0.59966385 0.38718152 1 0.3137666 0.79980785 0.3137666 0.79980785 0.27704099 1 0.27704099
		 0.89990091 0.27704099 0.89990091 0.3137666 0.79980785 0.38718152 0.79980785 0.35057253
		 1 0.35057253 0.89990091 0.35057253 0.89990091 0.38718152 0.69972682 0.51145577 0.69972682
		 0.45312548 0.69972682 0.42162433 0.59966385 0.42162433 0.59966385 0.45312548 0.69972682
		 0.48321304 0.59966385 0.48321304 0.59966385 0.51145577 1 0.45312548 0.79980785 0.45312548
		 0.79980785 0.42162433 1 0.42162433 0.89990091 0.42162433 0.89990091 0.45312548 0.79980785
		 0.51145577 0.79980785 0.48321304 1 0.48321304 0.89990091 0.48321304 0.89990091 0.51145577
		 1 0.7599076 0 0.7599076 0.49962494 0.7599076 0 0.62121159 0.49962494 0.62121159 0.19971229
		 0.62121159 0 0.56319696 0.19971229 0.56319696 0 0.53759515 0.19971229 0.53759515
		 0.099829264 0.53759515 0.099829264 0.56319696 0 0.59045434 0.19971229 0.59045434
		 0.099829264 0.59045434 0.099829264 0.62121159 0.49962494 0.56319696 0.29964319 0.56319696
		 0.29964319 0.53759515 0.49962494 0.53759515 0.39961606 0.53759515 0.39961606 0.56319696
		 0.29964319 0.62121159 0.29964319 0.59045434 0.49962494 0.59045434 0.39961606 0.59045434
		 0.39961606 0.62121159 0.19971229 0.7599076 0 0.68918294 0.19971229 0.68918294 0 0.6544022
		 0.19971229 0.6544022 0.099829264 0.6544022 0.099829264 0.68918294 0 0.72480613 0.19971229
		 0.72480613 0.099829264 0.72480613 0.099829264 0.7599076 0.49962494 0.68918294 0.29964319
		 0.68918294 0.29964319 0.6544022 0.49962494 0.6544022 0.39961606 0.6544022 0.39961606
		 0.68918294 0.29964319 0.7599076 0.29964319 0.72480613 0.49962494 0.72480613 0.39961606
		 0.72480613 0.39961606 0.7599076 1 0.62121159 0.69972682 0.62121159 0.69972682 0.56319696
		 0.69972682 0.53759515 0.59966385 0.53759515 0.59966385 0.56319696 0.69972682 0.59045434
		 0.59966385 0.59045434 0.59966385 0.62121159 1 0.56319696 0.79980785 0.56319696 0.79980785
		 0.53759515 1 0.53759515 0.89990091 0.53759515 0.89990091 0.56319696 0.79980785 0.62121159
		 0.79980785 0.59045434 1 0.59045434 0.89990091 0.59045434 0.89990091 0.62121159 0.69972682
		 0.7599076 0.69972682 0.68918294 0.69972682 0.6544022 0.59966385 0.6544022 0.59966385
		 0.68918294;
	setAttr ".uvst[0].uvsp[250:351]" 0.69972682 0.72480613 0.59966385 0.72480613
		 0.59966385 0.7599076 1 0.68918294 0.79980785 0.68918294 0.79980785 0.6544022 1 0.6544022
		 0.89990091 0.6544022 0.89990091 0.68918294 0.79980785 0.7599076 0.79980785 0.72480613
		 1 0.72480613 0.89990091 0.72480613 0.89990091 0.7599076 0 0.89206702 0.49962494 0.89206702
		 0.19971229 0.89206702 0 0.82712084 0.19971229 0.82712084 0 0.79386246 0.19971229
		 0.79386246 0.099829264 0.79386246 0.099829264 0.82712084 0 0.86005396 0.19971229
		 0.86005396 0.099829264 0.86005396 0.099829264 0.89206702 0.49962494 0.82712084 0.29964319
		 0.82712084 0.29964319 0.79386246 0.49962494 0.79386246 0.39961606 0.79386246 0.39961606
		 0.82712084 0.29964319 0.89206702 0.29964319 0.86005396 0.49962494 0.86005396 0.39961606
		 0.86005396 0.39961606 0.89206702 0 0.94757915 0.19971229 0.94757915 0 0.92129254
		 0.19971229 0.92129254 0.099829264 0.92129254 0.099829264 0.94757915 0 0.97316229
		 0.19971229 0.97316229 0.099829264 0.97316229 0.49962494 0.94757915 0.29964319 0.94757915
		 0.29964319 0.92129254 0.49962494 0.92129254 0.39961606 0.92129254 0.39961606 0.94757915
		 0.29964319 0.97316229 0.49962494 0.97316229 0.39961606 0.97316229 1 0.89206702 0.69972682
		 0.89206702 0.69972682 0.82712084 0.69972682 0.79386246 0.59966385 0.79386246 0.59966385
		 0.82712084 0.69972682 0.86005396 0.59966385 0.86005396 0.59966385 0.89206702 1 0.82712084
		 0.79980785 0.82712084 0.79980785 0.79386246 1 0.79386246 0.89990091 0.79386246 0.89990091
		 0.82712084 0.79980785 0.89206702 0.79980785 0.86005396 1 0.86005396 0.89990091 0.86005396
		 0.89990091 0.89206702 0.69972682 0.94757915 0.69972682 0.92129254 0.59966385 0.92129254
		 0.59966385 0.94757915 0.69972682 0.97316229 0.59966385 0.97316229 1 0.94757915 0.79980785
		 0.94757915 0.79980785 0.92129254 1 0.92129254 0.89990091 0.92129254 0.89990091 0.94757915
		 0.79980785 0.97316229 1 0.97316229 0.89990091 0.97316229 0.89990091 0 1 0 0.49962494
		 1 0.39961606 1 0.19971229 1 0.099829264 1 0 1 0.29964319 1 0.69972682 1 0.59966385
		 1 0.79980785 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 341 ".vt";
	setAttr ".vt[0:165]"  6.088716984 -0.50825781 -0.12770517 6.088716984 7.49138832 -0.12770517
		 -6.083134651 7.49138832 -0.58103245 -6.083134651 -0.50825781 -0.58103245 0.31780997 7.49138832 3.78282475
		 0.31780997 -0.50825781 3.78282475 6.088716984 3.49156547 -0.12770517 0.31780997 3.49156547 3.78282475
		 4.44982386 3.49156547 2.58111024 4.44982386 -0.50825781 2.58111024 6.088716984 1.091671586 -0.12770517
		 4.44982386 1.091671586 2.58111024 5.83133888 1.091671586 0.92652881 5.83133888 -0.50825781 0.92652881
		 6.088716984 0.29170692 -0.12770517 5.83133888 0.29170692 0.92652881 5.25032806 1.091671586 1.84465325
		 5.25032806 -0.50825781 1.84465325 5.25032806 0.29170692 1.84465325 4.44982386 0.29170692 2.58111024
		 5.83133888 3.49156547 0.92652881 6.088716984 1.89163625 -0.12770517 5.83133888 1.89163625 0.92652881
		 6.088716984 2.6916008 -0.12770517 5.83133888 2.6916008 0.92652881 4.44982386 1.89163625 2.58111024
		 5.25032806 1.89163625 1.84465325 5.25032806 3.49156547 1.84465325 5.25032806 2.6916008 1.84465325
		 4.44982386 2.6916008 2.58111024 0.31780997 1.091671586 3.78282475 2.46709919 -0.50825781 3.45097089
		 2.46709919 1.091671586 3.45097089 3.50071144 -0.50825781 3.10947061 3.50071144 1.091671586 3.10947061
		 3.50071144 0.29170692 3.10947061 2.46709919 0.29170692 3.45097089 1.40141761 -0.50825781 3.67588544
		 1.40141761 1.091671586 3.67588544 1.40141761 0.29170692 3.67588544 0.31780997 0.29170692 3.78282475
		 2.46709919 3.49156547 3.45097089 2.46709919 1.89163625 3.45097089 3.50071144 1.89163625 3.10947061
		 3.50071144 3.49156547 3.10947061 3.50071144 2.6916008 3.10947061 2.46709919 2.6916008 3.45097089
		 0.31780997 1.89163625 3.78282475 1.40141761 1.89163625 3.67588544 1.40141761 3.49156547 3.67588544
		 1.40141761 2.6916008 3.67588544 0.31780997 2.6916008 3.78282475 4.44982386 7.49138832 2.58111024
		 6.088716984 5.09149456 -0.12770517 4.44982386 5.09149456 2.58111024 5.83133888 5.09149456 0.92652881
		 6.088716984 4.29153013 -0.12770517 5.83133888 4.29153013 0.92652881 5.25032806 5.09149456 1.84465325
		 5.25032806 4.29153013 1.84465325 4.44982386 4.29153013 2.58111024 5.83133888 7.49138832 0.92652881
		 6.088716984 5.89145899 -0.12770517 5.83133888 5.89145899 0.92652881 6.088716984 6.69142389 -0.12770517
		 5.83133888 6.69142389 0.92652881 4.44982386 5.89145899 2.58111024 5.25032806 5.89145899 1.84465325
		 5.25032806 7.49138832 1.84465325 5.25032806 6.69142389 1.84465325 4.44982386 6.69142389 2.58111024
		 0.31780997 5.09149456 3.78282475 2.46709919 5.09149456 3.45097089 3.50071144 5.09149456 3.10947061
		 3.50071144 4.29153013 3.10947061 2.46709919 4.29153013 3.45097089 1.40141761 5.09149456 3.67588544
		 1.40141761 4.29153013 3.67588544 0.31780997 4.29153013 3.78282475 2.46709919 7.49138832 3.45097089
		 2.46709919 5.89145899 3.45097089 3.50071144 5.89145899 3.10947061 3.50071144 7.49138832 3.10947061
		 3.50071144 6.69142389 3.10947061 2.46709919 6.69142389 3.45097089 0.31780997 5.89145899 3.78282475
		 1.40141761 5.89145899 3.67588544 1.40141761 7.49138832 3.67588544 1.40141761 6.69142389 3.67588544
		 0.31780997 6.69142389 3.78282475 -6.083134651 3.49156547 -0.58103245 -3.91198659 -0.50825781 2.91410398
		 -3.91198659 3.49156547 2.91410398 -3.91198659 1.091671586 2.91410398 -1.84801245 -0.50825781 3.59031749
		 -1.84801245 1.091671586 3.59031749 -0.77060974 -0.50825781 3.75034165 -0.77060974 1.091671586 3.75034165
		 -0.77060974 0.29170692 3.75034165 -1.84801245 0.29170692 3.59031749 -2.90422964 -0.50825781 3.32448792
		 -2.90422964 1.091671586 3.32448792 -2.90422964 0.29170692 3.32448792 -3.91198659 0.29170692 2.91410398
		 -1.84801245 3.49156547 3.59031749 -1.84801245 1.89163625 3.59031749 -0.77060974 1.89163625 3.75034165
		 -0.77060974 3.49156547 3.75034165 -0.77060974 2.6916008 3.75034165 -1.84801245 2.6916008 3.59031749
		 -3.91198659 1.89163625 2.91410398 -2.90422964 1.89163625 3.32448792 -2.90422964 3.49156547 3.32448792
		 -2.90422964 2.6916008 3.32448792 -3.91198659 2.6916008 2.91410398 -6.083134651 1.091671586 -0.58103245
		 -5.52546978 -0.50825781 1.48129237 -5.52546978 1.091671586 1.48129237 -4.80595398 -0.50825781 2.29691744
		 -4.80595398 1.091671586 2.29691744 -4.80595398 0.29170692 2.29691744 -5.52546978 0.29170692 1.48129237
		 -5.9844141 -0.50825781 0.49746567 -5.9844141 1.091671586 0.49746567 -5.9844141 0.29170692 0.49746567
		 -6.083134651 0.29170692 -0.58103245 -5.52546978 3.49156547 1.48129237 -5.52546978 1.89163625 1.48129237
		 -4.80595398 1.89163625 2.29691744 -4.80595398 3.49156547 2.29691744 -4.80595398 2.6916008 2.29691744
		 -5.52546978 2.6916008 1.48129237 -6.083134651 1.89163625 -0.58103245 -5.9844141 1.89163625 0.49746567
		 -5.9844141 3.49156547 0.49746567 -5.9844141 2.6916008 0.49746567 -6.083134651 2.6916008 -0.58103245
		 -3.91198659 7.49138832 2.91410398 -3.91198659 5.09149456 2.91410398 -1.84801245 5.09149456 3.59031749
		 -0.77060974 5.09149456 3.75034165 -0.77060974 4.29153013 3.75034165 -1.84801245 4.29153013 3.59031749
		 -2.90422964 5.09149456 3.32448792 -2.90422964 4.29153013 3.32448792 -3.91198659 4.29153013 2.91410398
		 -1.84801245 7.49138832 3.59031749 -1.84801245 5.89145899 3.59031749 -0.77060974 5.89145899 3.75034165
		 -0.77060974 7.49138832 3.75034165 -0.77060974 6.69142389 3.75034165 -1.84801245 6.69142389 3.59031749
		 -3.91198659 5.89145899 2.91410398 -2.90422964 5.89145899 3.32448792 -2.90422964 7.49138832 3.32448792
		 -2.90422964 6.69142389 3.32448792 -3.91198659 6.69142389 2.91410398 -6.083134651 5.09149456 -0.58103245
		 -5.52546978 5.09149456 1.48129237 -4.80595398 5.09149456 2.29691744 -4.80595398 4.29153013 2.29691744
		 -5.52546978 4.29153013 1.48129237 -5.9844141 5.09149456 0.49746567 -5.9844141 4.29153013 0.49746567
		 -6.083134651 4.29153013 -0.58103245 -5.52546978 7.49138832 1.48129237;
	setAttr ".vt[166:331]" -5.52546978 5.89145899 1.48129237 -4.80595398 5.89145899 2.29691744
		 -4.80595398 7.49138832 2.29691744 -4.80595398 6.69142389 2.29691744 -5.52546978 6.69142389 1.48129237
		 -6.083134651 5.89145899 -0.58103245 -5.9844141 5.89145899 0.49746567 -5.9844141 7.49138832 0.49746567
		 -5.9844141 6.69142389 0.49746567 -6.083134651 6.69142389 -0.58103245 0.2239593 7.49138832 -5.23725367
		 0.2239593 -0.50825781 -5.23725367 0.2239593 3.49156547 -5.23725367 -3.95283842 -0.50825781 -4.22692251
		 -3.95283842 3.49156547 -4.22692251 -3.95283842 1.091671586 -4.22692251 -5.41717005 -0.50825781 -2.64281416
		 -5.41717005 1.091671586 -2.64281416 -5.85980034 -0.50825781 -1.64717352 -5.85980034 1.091671586 -1.64717352
		 -5.85980034 0.29170692 -1.64717352 -5.41717005 0.29170692 -2.64281416 -4.7838068 -0.50825781 -3.52634811
		 -4.7838068 1.091671586 -3.52634811 -4.7838068 0.29170692 -3.52634811 -3.95283842 0.29170692 -4.22692251
		 -5.41717005 3.49156547 -2.64281416 -5.41717005 1.89163625 -2.64281416 -5.85980034 1.89163625 -1.64717352
		 -5.85980034 3.49156547 -1.64717352 -5.85980034 2.6916008 -1.64717352 -5.41717005 2.6916008 -2.64281416
		 -3.95283842 1.89163625 -4.22692251 -4.7838068 1.89163625 -3.52634811 -4.7838068 3.49156547 -3.52634811
		 -4.7838068 2.6916008 -3.52634811 -3.95283842 2.6916008 -4.22692251 0.2239593 1.091671586 -5.23725367
		 -1.93828881 -0.50825781 -5.029557705 -1.93828881 1.091671586 -5.029557705 -2.97942948 -0.50825781 -4.71133518
		 -2.97942948 1.091671586 -4.71133518 -2.97942948 0.29170692 -4.71133518 -1.93828881 0.29170692 -5.029557705
		 -0.86424822 -0.50825781 -5.20650816 -0.86424822 1.091671586 -5.20650816 -0.86424822 0.29170692 -5.20650816
		 0.2239593 0.29170692 -5.23725367 -1.93828881 3.49156547 -5.029557705 -1.93828881 1.89163625 -5.029557705
		 -2.97942948 1.89163625 -4.71133518 -2.97942948 3.49156547 -4.71133518 -2.97942948 2.6916008 -4.71133518
		 -1.93828881 2.6916008 -5.029557705 0.2239593 1.89163625 -5.23725367 -0.86424822 1.89163625 -5.20650816
		 -0.86424822 3.49156547 -5.20650816 -0.86424822 2.6916008 -5.20650816 0.2239593 2.6916008 -5.23725367
		 -3.95283842 7.49138832 -4.22692251 -3.95283842 5.09149456 -4.22692251 -5.41717005 5.09149456 -2.64281416
		 -5.85980034 5.09149456 -1.64717352 -5.85980034 4.29153013 -1.64717352 -5.41717005 4.29153013 -2.64281416
		 -4.7838068 5.09149456 -3.52634811 -4.7838068 4.29153013 -3.52634811 -3.95283842 4.29153013 -4.22692251
		 -5.41717005 7.49138832 -2.64281416 -5.41717005 5.89145899 -2.64281416 -5.85980034 5.89145899 -1.64717352
		 -5.85980034 7.49138832 -1.64717352 -5.85980034 6.69142389 -1.64717352 -5.41717005 6.69142389 -2.64281416
		 -3.95283842 5.89145899 -4.22692251 -4.7838068 5.89145899 -3.52634811 -4.7838068 7.49138832 -3.52634811
		 -4.7838068 6.69142389 -3.52634811 -3.95283842 6.69142389 -4.22692251 0.2239593 5.09149456 -5.23725367
		 -1.93828881 5.09149456 -5.029557705 -2.97942948 5.09149456 -4.71133518 -2.97942948 4.29153013 -4.71133518
		 -1.93828881 4.29153013 -5.029557705 -0.86424822 5.09149456 -5.20650816 -0.86424822 4.29153013 -5.20650816
		 0.2239593 4.29153013 -5.23725367 -1.93828881 7.49138832 -5.029557705 -1.93828881 5.89145899 -5.029557705
		 -2.97942948 5.89145899 -4.71133518 -2.97942948 7.49138832 -4.71133518 -2.97942948 6.69142389 -4.71133518
		 -1.93828881 6.69142389 -5.029557705 0.2239593 5.89145899 -5.23725367 -0.86424822 5.89145899 -5.20650816
		 -0.86424822 7.49138832 -5.20650816 -0.86424822 6.69142389 -5.20650816 0.2239593 6.69142389 -5.23725367
		 4.3220253 -0.50825781 -3.95965481 4.3220253 3.49156547 -3.95965481 4.3220253 1.091671586 -3.95965481
		 2.37195778 -0.50825781 -4.89877605 2.37195778 1.091671586 -4.89877605 1.30814755 -0.50825781 -5.13227463
		 1.30814755 1.091671586 -5.13227463 1.30814755 0.29170692 -5.13227463 2.37195778 0.29170692 -4.89877605
		 3.39553452 -0.50825781 -4.52818251 3.39553452 1.091671586 -4.52818251 3.39553452 0.29170692 -4.52818251
		 4.3220253 0.29170692 -3.95965481 2.37195778 3.49156547 -4.89877605 2.37195778 1.89163625 -4.89877605
		 1.30814755 1.89163625 -5.13227463 1.30814755 3.49156547 -5.13227463 1.30814755 2.6916008 -5.13227463
		 2.37195778 2.6916008 -4.89877605 4.3220253 1.89163625 -3.95965481 3.39553452 1.89163625 -4.52818251
		 3.39553452 3.49156547 -4.52818251 3.39553452 2.6916008 -4.52818251 4.3220253 2.6916008 -3.95965481
		 5.62579107 -0.50825781 -2.23673964 5.62579107 1.091671586 -2.23673964 5.071962357 -0.50825781 -3.17581797
		 5.071962357 1.091671586 -3.17581797 5.071962357 0.29170692 -3.17581797 5.62579107 0.29170692 -2.23673964
		 5.98398972 -0.50825781 -1.20791209 5.98398972 1.091671586 -1.20791209 5.98398972 0.29170692 -1.20791209
		 5.62579107 3.49156547 -2.23673964 5.62579107 1.89163625 -2.23673964 5.071962357 1.89163625 -3.17581797
		 5.071962357 3.49156547 -3.17581797 5.071962357 2.6916008 -3.17581797 5.62579107 2.6916008 -2.23673964
		 5.98398972 1.89163625 -1.20791209 5.98398972 3.49156547 -1.20791209 5.98398972 2.6916008 -1.20791209
		 4.3220253 7.49138832 -3.95965481 4.3220253 5.09149456 -3.95965481 2.37195778 5.09149456 -4.89877605
		 1.30814755 5.09149456 -5.13227463 1.30814755 4.29153013 -5.13227463 2.37195778 4.29153013 -4.89877605
		 3.39553452 5.09149456 -4.52818251 3.39553452 4.29153013 -4.52818251 4.3220253 4.29153013 -3.95965481
		 2.37195778 7.49138832 -4.89877605 2.37195778 5.89145899 -4.89877605 1.30814755 5.89145899 -5.13227463
		 1.30814755 7.49138832 -5.13227463 1.30814755 6.69142389 -5.13227463 2.37195778 6.69142389 -4.89877605
		 4.3220253 5.89145899 -3.95965481 3.39553452 5.89145899 -4.52818251 3.39553452 7.49138832 -4.52818251
		 3.39553452 6.69142389 -4.52818251 4.3220253 6.69142389 -3.95965481 5.62579107 5.09149456 -2.23673964
		 5.071962357 5.09149456 -3.17581797 5.071962357 4.29153013 -3.17581797 5.62579107 4.29153013 -2.23673964
		 5.98398972 5.09149456 -1.20791209 5.98398972 4.29153013 -1.20791209;
	setAttr ".vt[332:340]" 5.62579107 7.49138832 -2.23673964 5.62579107 5.89145899 -2.23673964
		 5.071962357 5.89145899 -3.17581797 5.071962357 7.49138832 -3.17581797 5.071962357 6.69142389 -3.17581797
		 5.62579107 6.69142389 -2.23673964 5.98398972 5.89145899 -1.20791209 5.98398972 7.49138832 -1.20791209
		 5.98398972 6.69142389 -1.20791209;
	setAttr -s 651 ".ed";
	setAttr ".ed[0:165]"  339 1 0 1 64 1 64 340 1 340 339 1 173 2 0 2 175 1 175 174 1
		 174 173 1 87 4 0 4 89 1 89 88 1 88 87 1 49 7 1 7 51 1 51 50 1 50 49 1 27 8 1 8 29 1
		 29 28 1 28 27 1 16 11 1 11 19 1 19 18 1 18 16 1 14 10 1 10 12 1 12 15 1 15 14 1 0 14 1
		 15 13 1 13 0 0 12 16 1 18 15 1 18 17 1 17 13 0 19 9 1 9 17 0 23 6 1 6 20 1 20 24 1
		 24 23 1 10 21 1 21 22 1 22 12 1 21 23 1 24 22 1 25 11 1 16 26 1 26 25 1 22 26 1 20 27 1
		 28 24 1 28 26 1 29 25 1 30 40 1 40 39 1 39 38 1 38 30 1 35 34 1 34 32 1 32 36 1 36 35 1
		 11 34 1 35 19 1 33 9 0 35 33 1 31 33 0 36 31 1 32 38 1 39 36 1 37 31 0 39 37 1 40 5 1
		 5 37 0 44 41 1 41 46 1 46 45 1 45 44 1 42 32 1 34 43 1 43 42 1 25 43 1 8 44 1 45 29 1
		 45 43 1 46 42 1 47 30 1 38 48 1 48 47 1 42 48 1 41 49 1 50 46 1 50 48 1 51 47 1 68 52 0
		 52 70 1 70 69 1 69 68 1 58 54 1 54 60 1 60 59 1 59 58 1 56 53 1 53 55 1 55 57 1 57 56 1
		 6 56 1 57 20 1 55 58 1 59 57 1 59 27 1 60 8 1 1 61 0 61 65 1 65 64 1 53 62 1 62 63 1
		 63 55 1 62 64 1 65 63 1 66 54 1 58 67 1 67 66 1 63 67 1 61 68 0 69 65 1 69 67 1 70 66 1
		 71 78 1 78 77 1 77 76 1 76 71 1 74 73 1 73 72 1 72 75 1 75 74 1 54 73 1 74 60 1 74 44 1
		 75 41 1 72 76 1 77 75 1 77 49 1 78 7 1 82 79 0 79 84 1 84 83 1 83 82 1 80 72 1 73 81 1
		 81 80 1 66 81 1 52 82 0 83 70 1 83 81 1 84 80 1 85 71 1 76 86 1 86 85 1 80 86 1 79 87 0
		 88 84 1 88 86 1 89 85 1 90 136 1 136 135 1;
	setAttr ".ed[166:331]" 135 134 1 134 90 1 112 92 1 92 114 1 114 113 1 113 112 1
		 102 101 1 101 93 1 93 103 1 103 102 1 98 97 1 97 95 1 95 99 1 99 98 1 30 97 1 98 40 1
		 96 5 0 98 96 1 94 96 0 99 94 1 95 101 1 102 99 1 100 94 0 102 100 1 91 100 0 103 91 1
		 107 104 1 104 109 1 109 108 1 108 107 1 106 105 1 105 95 1 97 106 1 47 106 1 7 107 1
		 108 51 1 108 106 1 109 105 1 110 93 1 101 111 1 111 110 1 105 111 1 104 112 1 113 109 1
		 113 111 1 114 110 1 115 125 1 125 124 1 124 123 1 123 115 1 120 119 1 119 117 1 117 121 1
		 121 120 1 93 119 1 120 103 1 118 91 0 120 118 1 116 118 0 121 116 1 117 123 1 124 121 1
		 122 116 0 124 122 1 125 3 1 3 122 0 129 126 1 126 131 1 131 130 1 130 129 1 119 128 1
		 128 127 1 127 117 1 110 128 1 92 129 1 130 114 1 130 128 1 131 127 1 132 115 1 123 133 1
		 133 132 1 127 133 1 126 134 1 135 131 1 135 133 1 136 132 1 154 137 0 137 156 1 156 155 1
		 155 154 1 138 145 1 145 144 1 144 143 1 143 138 1 141 140 1 140 139 1 139 142 1 142 141 1
		 71 140 1 141 78 1 141 107 1 142 104 1 139 143 1 144 142 1 144 112 1 145 92 1 149 146 0
		 146 151 1 151 150 1 150 149 1 147 139 1 140 148 1 148 147 1 85 148 1 4 149 0 150 89 1
		 150 148 1 151 147 1 152 138 1 143 153 1 153 152 1 147 153 1 146 154 0 155 151 1 155 153 1
		 156 152 1 157 164 1 164 163 1 163 162 1 162 157 1 160 159 1 159 158 1 158 161 1 161 160 1
		 138 159 1 160 145 1 160 129 1 161 126 1 158 162 1 163 161 1 163 134 1 164 90 1 168 165 0
		 165 170 1 170 169 1 169 168 1 166 158 1 159 167 1 167 166 1 152 167 1 137 168 0 169 156 1
		 169 167 1 170 166 1 171 157 1 162 172 1 172 171 1 166 172 1 165 173 0 174 170 1 174 172 1
		 175 171 1 261 176 0 176 263 1 263 262 1 262 261 1;
	setAttr ".ed[332:497]" 178 224 1 224 223 1 223 222 1 222 178 1 200 180 1 180 202 1
		 202 201 1 201 200 1 190 189 1 189 181 1 181 191 1 191 190 1 186 185 1 185 183 1 183 187 1
		 187 186 1 115 185 1 186 125 1 184 3 0 186 184 1 182 184 0 187 182 1 183 189 1 190 187 1
		 188 182 0 190 188 1 179 188 0 191 179 1 195 192 1 192 197 1 197 196 1 196 195 1 194 193 1
		 193 183 1 185 194 1 132 194 1 90 195 1 196 136 1 196 194 1 197 193 1 198 181 1 189 199 1
		 199 198 1 193 199 1 192 200 1 201 197 1 201 199 1 202 198 1 203 213 1 213 212 1 212 211 1
		 211 203 1 208 207 1 207 205 1 205 209 1 209 208 1 181 207 1 208 191 1 206 179 0 208 206 1
		 204 206 0 209 204 1 205 211 1 212 209 1 210 204 0 212 210 1 213 177 1 177 210 0 217 214 1
		 214 219 1 219 218 1 218 217 1 207 216 1 216 215 1 215 205 1 198 216 1 180 217 1 218 202 1
		 218 216 1 219 215 1 220 203 1 211 221 1 221 220 1 215 221 1 214 222 1 223 219 1 223 221 1
		 224 220 1 242 225 0 225 244 1 244 243 1 243 242 1 226 233 1 233 232 1 232 231 1 231 226 1
		 229 228 1 228 227 1 227 230 1 230 229 1 157 228 1 229 164 1 229 195 1 230 192 1 227 231 1
		 232 230 1 232 200 1 233 180 1 237 234 0 234 239 1 239 238 1 238 237 1 235 227 1 228 236 1
		 236 235 1 171 236 1 2 237 0 238 175 1 238 236 1 239 235 1 240 226 1 231 241 1 241 240 1
		 235 241 1 234 242 0 243 239 1 243 241 1 244 240 1 245 252 1 252 251 1 251 250 1 250 245 1
		 248 247 1 247 246 1 246 249 1 249 248 1 226 247 1 248 233 1 248 217 1 249 214 1 246 250 1
		 251 249 1 251 222 1 252 178 1 256 253 0 253 258 1 258 257 1 257 256 1 254 246 1 247 255 1
		 255 254 1 240 255 1 225 256 0 257 244 1 257 255 1 258 254 1 259 245 1 250 260 1 260 259 1
		 254 260 1 253 261 0 262 258 1 262 260 1 263 259 1 23 305 1 305 304 1;
	setAttr ".ed[498:650]" 304 6 1 285 265 1 265 287 1 287 286 1 286 285 1 275 274 1
		 274 266 1 266 276 1 276 275 1 271 270 1 270 268 1 268 272 1 272 271 1 203 270 1 271 213 1
		 269 177 0 271 269 1 267 269 0 272 267 1 268 274 1 275 272 1 273 267 0 275 273 1 264 273 0
		 276 264 1 280 277 1 277 282 1 282 281 1 281 280 1 279 278 1 278 268 1 270 279 1 220 279 1
		 178 280 1 281 224 1 281 279 1 282 278 1 283 266 1 274 284 1 284 283 1 278 284 1 277 285 1
		 286 282 1 286 284 1 287 283 1 14 296 1 296 295 1 295 10 1 292 291 1 291 289 1 289 293 1
		 293 292 1 266 291 1 292 276 1 290 264 0 292 290 1 288 290 0 293 288 1 289 295 1 296 293 1
		 294 288 0 296 294 1 0 294 0 300 297 1 297 302 1 302 301 1 301 300 1 291 299 1 299 298 1
		 298 289 1 283 299 1 265 300 1 301 287 1 301 299 1 302 298 1 295 303 1 303 21 1 298 303 1
		 297 304 1 305 302 1 305 303 1 323 306 0 306 325 1 325 324 1 324 323 1 307 314 1 314 313 1
		 313 312 1 312 307 1 310 309 1 309 308 1 308 311 1 311 310 1 245 309 1 310 252 1 310 280 1
		 311 277 1 308 312 1 313 311 1 313 285 1 314 265 1 318 315 0 315 320 1 320 319 1 319 318 1
		 316 308 1 309 317 1 317 316 1 259 317 1 176 318 0 319 263 1 319 317 1 320 316 1 321 307 1
		 312 322 1 322 321 1 316 322 1 315 323 0 324 320 1 324 322 1 325 321 1 56 331 1 331 330 1
		 330 53 1 328 327 1 327 326 1 326 329 1 329 328 1 307 327 1 328 314 1 328 300 1 329 297 1
		 326 330 1 331 329 1 331 304 1 335 332 0 332 337 1 337 336 1 336 335 1 333 326 1 327 334 1
		 334 333 1 321 334 1 306 335 0 336 325 1 336 334 1 337 333 1 330 338 1 338 62 1 333 338 1
		 332 339 0 340 337 1 340 338 1;
	setAttr -s 310 -ch 1240 ".fc[0:309]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 339 1 64 340
		f 4 4 5 6 7
		mu 0 4 173 2 175 174
		f 4 8 9 10 11
		mu 0 4 87 4 89 88
		f 4 12 13 14 15
		mu 0 4 49 7 51 50
		f 4 16 17 18 19
		mu 0 4 27 8 29 28
		f 4 20 21 22 23
		mu 0 4 16 11 19 18
		f 4 24 25 26 27
		mu 0 4 14 10 12 15
		f 4 28 -28 29 30
		mu 0 4 0 14 15 13
		f 4 31 -24 32 -27
		mu 0 4 12 16 18 15
		f 4 33 34 -30 -33
		mu 0 4 18 17 13 15
		f 4 35 36 -34 -23
		mu 0 4 19 9 17 18
		f 4 37 38 39 40
		mu 0 4 23 6 20 24
		f 4 41 42 43 -26
		mu 0 4 10 21 22 12
		f 4 44 -41 45 -43
		mu 0 4 21 23 24 22
		f 4 46 -21 47 48
		mu 0 4 25 11 16 26
		f 4 -32 -44 49 -48
		mu 0 4 16 12 22 26
		f 4 50 -20 51 -40
		mu 0 4 20 27 28 24
		f 4 52 -50 -46 -52
		mu 0 4 28 26 22 24
		f 4 53 -49 -53 -19
		mu 0 4 29 25 26 28
		f 4 54 55 56 57
		mu 0 4 30 40 39 38
		f 4 58 59 60 61
		mu 0 4 35 34 32 36
		f 4 -22 62 -59 63
		mu 0 4 19 11 34 35
		f 4 64 -36 -64 65
		mu 0 4 33 9 19 35
		f 4 66 -66 -62 67
		mu 0 4 31 33 35 36
		f 4 -61 68 -57 69
		mu 0 4 36 32 38 39
		f 4 70 -68 -70 71
		mu 0 4 37 31 36 39
		f 4 72 73 -72 -56
		mu 0 4 40 5 37 39
		f 4 74 75 76 77
		mu 0 4 44 41 46 45
		f 4 78 -60 79 80
		mu 0 4 42 32 34 43
		f 4 -63 -47 81 -80
		mu 0 4 34 11 25 43
		f 4 82 -78 83 -18
		mu 0 4 8 44 45 29
		f 4 84 -82 -54 -84
		mu 0 4 45 43 25 29
		f 4 85 -81 -85 -77
		mu 0 4 46 42 43 45
		f 4 86 -58 87 88
		mu 0 4 47 30 38 48
		f 4 -69 -79 89 -88
		mu 0 4 38 32 42 48
		f 4 90 -16 91 -76
		mu 0 4 41 49 50 46
		f 4 92 -90 -86 -92
		mu 0 4 50 48 42 46
		f 4 93 -89 -93 -15
		mu 0 4 51 47 48 50
		f 4 94 95 96 97
		mu 0 4 68 52 70 69
		f 4 98 99 100 101
		mu 0 4 58 54 60 59
		f 4 102 103 104 105
		mu 0 4 56 53 55 57
		f 4 106 -106 107 -39
		mu 0 4 6 56 57 20
		f 4 108 -102 109 -105
		mu 0 4 55 58 59 57
		f 4 110 -51 -108 -110
		mu 0 4 59 27 20 57
		f 4 111 -17 -111 -101
		mu 0 4 60 8 27 59
		f 4 -2 112 113 114
		mu 0 4 341 342 61 65
		f 4 115 116 117 -104
		mu 0 4 53 62 63 55
		f 4 118 -115 119 -117
		mu 0 4 62 341 65 63
		f 4 120 -99 121 122
		mu 0 4 66 54 58 67
		f 4 -109 -118 123 -122
		mu 0 4 58 55 63 67
		f 4 124 -98 125 -114
		mu 0 4 61 68 69 65
		f 4 126 -124 -120 -126
		mu 0 4 69 67 63 65
		f 4 127 -123 -127 -97
		mu 0 4 70 66 67 69
		f 4 128 129 130 131
		mu 0 4 71 78 77 76
		f 4 132 133 134 135
		mu 0 4 74 73 72 75
		f 4 -100 136 -133 137
		mu 0 4 60 54 73 74
		f 4 -83 -112 -138 138
		mu 0 4 44 8 60 74
		f 4 -75 -139 -136 139
		mu 0 4 41 44 74 75
		f 4 -135 140 -131 141
		mu 0 4 75 72 76 77
		f 4 -91 -140 -142 142
		mu 0 4 49 41 75 77
		f 4 143 -13 -143 -130
		mu 0 4 78 7 49 77
		f 4 144 145 146 147
		mu 0 4 82 79 84 83
		f 4 148 -134 149 150
		mu 0 4 80 72 73 81
		f 4 -137 -121 151 -150
		mu 0 4 73 54 66 81
		f 4 152 -148 153 -96
		mu 0 4 52 82 83 70
		f 4 154 -152 -128 -154
		mu 0 4 83 81 66 70
		f 4 155 -151 -155 -147
		mu 0 4 84 80 81 83
		f 4 156 -132 157 158
		mu 0 4 85 71 76 86
		f 4 -141 -149 159 -158
		mu 0 4 76 72 80 86
		f 4 160 -12 161 -146
		mu 0 4 79 87 88 84
		f 4 162 -160 -156 -162
		mu 0 4 88 86 80 84
		f 4 163 -159 -163 -11
		mu 0 4 89 85 86 88
		f 4 164 165 166 167
		mu 0 4 90 136 135 134
		f 4 168 169 170 171
		mu 0 4 112 92 114 113
		f 4 172 173 174 175
		mu 0 4 102 101 93 103
		f 4 176 177 178 179
		mu 0 4 98 97 95 99
		f 4 -55 180 -177 181
		mu 0 4 40 30 97 98
		f 4 182 -73 -182 183
		mu 0 4 96 5 40 98
		f 4 184 -184 -180 185
		mu 0 4 94 96 98 99
		f 4 -179 186 -173 187
		mu 0 4 99 95 101 102
		f 4 188 -186 -188 189
		mu 0 4 100 94 99 102
		f 4 190 -190 -176 191
		mu 0 4 91 100 102 103
		f 4 192 193 194 195
		mu 0 4 107 104 109 108
		f 4 196 197 -178 198
		mu 0 4 106 105 95 97
		f 4 -87 199 -199 -181
		mu 0 4 30 47 106 97
		f 4 -14 200 -196 201
		mu 0 4 51 7 107 108
		f 4 -94 -202 202 -200
		mu 0 4 47 51 108 106
		f 4 203 -197 -203 -195
		mu 0 4 109 105 106 108
		f 4 204 -174 205 206
		mu 0 4 110 93 101 111
		f 4 -187 -198 207 -206
		mu 0 4 101 95 105 111
		f 4 208 -172 209 -194
		mu 0 4 104 112 113 109
		f 4 210 -208 -204 -210
		mu 0 4 113 111 105 109
		f 4 211 -207 -211 -171
		mu 0 4 114 110 111 113
		f 4 212 213 214 215
		mu 0 4 115 125 124 123
		f 4 216 217 218 219
		mu 0 4 120 119 117 121
		f 4 -175 220 -217 221
		mu 0 4 103 93 119 120
		f 4 222 -192 -222 223
		mu 0 4 118 91 103 120
		f 4 224 -224 -220 225
		mu 0 4 116 118 120 121
		f 4 -219 226 -215 227
		mu 0 4 121 117 123 124
		f 4 228 -226 -228 229
		mu 0 4 122 116 121 124
		f 4 230 231 -230 -214
		mu 0 4 125 3 122 124
		f 4 232 233 234 235
		mu 0 4 129 126 131 130
		f 4 -218 236 237 238
		mu 0 4 117 119 128 127
		f 4 -221 -205 239 -237
		mu 0 4 119 93 110 128
		f 4 -170 240 -236 241
		mu 0 4 114 92 129 130
		f 4 -212 -242 242 -240
		mu 0 4 110 114 130 128
		f 4 243 -238 -243 -235
		mu 0 4 131 127 128 130
		f 4 244 -216 245 246
		mu 0 4 132 115 123 133
		f 4 -227 -239 247 -246
		mu 0 4 123 117 127 133
		f 4 -234 248 -167 249
		mu 0 4 131 126 134 135
		f 4 -248 -244 -250 250
		mu 0 4 133 127 131 135
		f 4 251 -247 -251 -166
		mu 0 4 136 132 133 135
		f 4 252 253 254 255
		mu 0 4 154 137 156 155
		f 4 256 257 258 259
		mu 0 4 138 145 144 143
		f 4 260 261 262 263
		mu 0 4 141 140 139 142
		f 4 -129 264 -261 265
		mu 0 4 78 71 140 141
		f 4 -201 -144 -266 266
		mu 0 4 107 7 78 141
		f 4 -193 -267 -264 267
		mu 0 4 104 107 141 142
		f 4 -263 268 -259 269
		mu 0 4 142 139 143 144
		f 4 -209 -268 -270 270
		mu 0 4 112 104 142 144
		f 4 271 -169 -271 -258
		mu 0 4 145 92 112 144
		f 4 272 273 274 275
		mu 0 4 149 146 151 150
		f 4 276 -262 277 278
		mu 0 4 147 139 140 148
		f 4 -265 -157 279 -278
		mu 0 4 140 71 85 148
		f 4 280 -276 281 -10
		mu 0 4 4 149 150 89
		f 4 282 -280 -164 -282
		mu 0 4 150 148 85 89
		f 4 283 -279 -283 -275
		mu 0 4 151 147 148 150
		f 4 284 -260 285 286
		mu 0 4 152 138 143 153
		f 4 -269 -277 287 -286
		mu 0 4 143 139 147 153
		f 4 288 -256 289 -274
		mu 0 4 146 154 155 151
		f 4 290 -288 -284 -290
		mu 0 4 155 153 147 151
		f 4 291 -287 -291 -255
		mu 0 4 156 152 153 155
		f 4 292 293 294 295
		mu 0 4 157 164 163 162
		f 4 296 297 298 299
		mu 0 4 160 159 158 161
		f 4 -257 300 -297 301
		mu 0 4 145 138 159 160
		f 4 -241 -272 -302 302
		mu 0 4 129 92 145 160
		f 4 -233 -303 -300 303
		mu 0 4 126 129 160 161
		f 4 -299 304 -295 305
		mu 0 4 161 158 162 163
		f 4 -249 -304 -306 306
		mu 0 4 134 126 161 163
		f 4 307 -168 -307 -294
		mu 0 4 164 90 134 163
		f 4 308 309 310 311
		mu 0 4 168 165 170 169
		f 4 312 -298 313 314
		mu 0 4 166 158 159 167
		f 4 -301 -285 315 -314
		mu 0 4 159 138 152 167
		f 4 316 -312 317 -254
		mu 0 4 137 168 169 156
		f 4 318 -316 -292 -318
		mu 0 4 169 167 152 156
		f 4 319 -315 -319 -311
		mu 0 4 170 166 167 169
		f 4 320 -296 321 322
		mu 0 4 171 157 162 172
		f 4 -305 -313 323 -322
		mu 0 4 162 158 166 172
		f 4 324 -8 325 -310
		mu 0 4 165 173 174 170
		f 4 326 -324 -320 -326
		mu 0 4 174 172 166 170
		f 4 327 -323 -327 -7
		mu 0 4 175 171 172 174
		f 4 328 329 330 331
		mu 0 4 261 176 263 262
		f 4 332 333 334 335
		mu 0 4 178 224 223 222
		f 4 336 337 338 339
		mu 0 4 200 180 202 201
		f 4 340 341 342 343
		mu 0 4 190 189 181 191
		f 4 344 345 346 347
		mu 0 4 186 185 183 187
		f 4 -213 348 -345 349
		mu 0 4 125 115 185 186
		f 4 350 -231 -350 351
		mu 0 4 184 3 125 186
		f 4 352 -352 -348 353
		mu 0 4 182 184 186 187
		f 4 -347 354 -341 355
		mu 0 4 187 183 189 190
		f 4 356 -354 -356 357
		mu 0 4 188 182 187 190
		f 4 358 -358 -344 359
		mu 0 4 179 188 190 191
		f 4 360 361 362 363
		mu 0 4 195 192 197 196
		f 4 364 365 -346 366
		mu 0 4 194 193 183 185
		f 4 -245 367 -367 -349
		mu 0 4 115 132 194 185
		f 4 -165 368 -364 369
		mu 0 4 136 90 195 196
		f 4 -252 -370 370 -368
		mu 0 4 132 136 196 194
		f 4 371 -365 -371 -363
		mu 0 4 197 193 194 196
		f 4 372 -342 373 374
		mu 0 4 198 181 189 199
		f 4 -355 -366 375 -374
		mu 0 4 189 183 193 199
		f 4 376 -340 377 -362
		mu 0 4 192 200 201 197
		f 4 378 -376 -372 -378
		mu 0 4 201 199 193 197
		f 4 379 -375 -379 -339
		mu 0 4 202 198 199 201
		f 4 380 381 382 383
		mu 0 4 203 213 212 211
		f 4 384 385 386 387
		mu 0 4 208 207 205 209
		f 4 -343 388 -385 389
		mu 0 4 191 181 207 208
		f 4 390 -360 -390 391
		mu 0 4 206 179 191 208
		f 4 392 -392 -388 393
		mu 0 4 204 206 208 209
		f 4 -387 394 -383 395
		mu 0 4 209 205 211 212
		f 4 396 -394 -396 397
		mu 0 4 210 204 209 212
		f 4 398 399 -398 -382
		mu 0 4 213 177 210 212
		f 4 400 401 402 403
		mu 0 4 217 214 219 218
		f 4 -386 404 405 406
		mu 0 4 205 207 216 215
		f 4 -389 -373 407 -405
		mu 0 4 207 181 198 216
		f 4 -338 408 -404 409
		mu 0 4 202 180 217 218
		f 4 -380 -410 410 -408
		mu 0 4 198 202 218 216
		f 4 411 -406 -411 -403
		mu 0 4 219 215 216 218
		f 4 412 -384 413 414
		mu 0 4 220 203 211 221
		f 4 -395 -407 415 -414
		mu 0 4 211 205 215 221
		f 4 -402 416 -335 417
		mu 0 4 219 214 222 223
		f 4 -416 -412 -418 418
		mu 0 4 221 215 219 223
		f 4 419 -415 -419 -334
		mu 0 4 224 220 221 223
		f 4 420 421 422 423
		mu 0 4 242 225 244 243
		f 4 424 425 426 427
		mu 0 4 226 233 232 231
		f 4 428 429 430 431
		mu 0 4 229 228 227 230
		f 4 -293 432 -429 433
		mu 0 4 164 157 228 229
		f 4 -369 -308 -434 434
		mu 0 4 195 90 164 229
		f 4 -361 -435 -432 435
		mu 0 4 192 195 229 230
		f 4 -431 436 -427 437
		mu 0 4 230 227 231 232
		f 4 -377 -436 -438 438
		mu 0 4 200 192 230 232
		f 4 439 -337 -439 -426
		mu 0 4 233 180 200 232
		f 4 440 441 442 443
		mu 0 4 237 234 239 238
		f 4 444 -430 445 446
		mu 0 4 235 227 228 236
		f 4 -433 -321 447 -446
		mu 0 4 228 157 171 236
		f 4 448 -444 449 -6
		mu 0 4 2 237 238 175
		f 4 450 -448 -328 -450
		mu 0 4 238 236 171 175
		f 4 451 -447 -451 -443
		mu 0 4 239 235 236 238
		f 4 452 -428 453 454
		mu 0 4 240 226 231 241
		f 4 -437 -445 455 -454
		mu 0 4 231 227 235 241
		f 4 456 -424 457 -442
		mu 0 4 234 242 243 239
		f 4 458 -456 -452 -458
		mu 0 4 243 241 235 239
		f 4 459 -455 -459 -423
		mu 0 4 244 240 241 243
		f 4 460 461 462 463
		mu 0 4 245 252 251 250
		f 4 464 465 466 467
		mu 0 4 248 247 246 249
		f 4 -425 468 -465 469
		mu 0 4 233 226 247 248
		f 4 -409 -440 -470 470
		mu 0 4 217 180 233 248
		f 4 -401 -471 -468 471
		mu 0 4 214 217 248 249
		f 4 -467 472 -463 473
		mu 0 4 249 246 250 251
		f 4 -417 -472 -474 474
		mu 0 4 222 214 249 251
		f 4 475 -336 -475 -462
		mu 0 4 252 178 222 251
		f 4 476 477 478 479
		mu 0 4 256 253 258 257
		f 4 480 -466 481 482
		mu 0 4 254 246 247 255
		f 4 -469 -453 483 -482
		mu 0 4 247 226 240 255
		f 4 484 -480 485 -422
		mu 0 4 225 256 257 244
		f 4 486 -484 -460 -486
		mu 0 4 257 255 240 244
		f 4 487 -483 -487 -479
		mu 0 4 258 254 255 257
		f 4 488 -464 489 490
		mu 0 4 259 245 250 260
		f 4 -473 -481 491 -490
		mu 0 4 250 246 254 260
		f 4 492 -332 493 -478
		mu 0 4 253 261 262 258
		f 4 494 -492 -488 -494
		mu 0 4 262 260 254 258
		f 4 495 -491 -495 -331
		mu 0 4 263 259 260 262
		f 4 -38 496 497 498
		mu 0 4 343 344 305 304
		f 4 499 500 501 502
		mu 0 4 285 265 287 286
		f 4 503 504 505 506
		mu 0 4 275 274 266 276
		f 4 507 508 509 510
		mu 0 4 271 270 268 272
		f 4 -381 511 -508 512
		mu 0 4 213 203 270 271
		f 4 513 -399 -513 514
		mu 0 4 269 177 213 271
		f 4 515 -515 -511 516
		mu 0 4 267 269 271 272
		f 4 -510 517 -504 518
		mu 0 4 272 268 274 275
		f 4 519 -517 -519 520
		mu 0 4 273 267 272 275
		f 4 521 -521 -507 522
		mu 0 4 264 273 275 276
		f 4 523 524 525 526
		mu 0 4 280 277 282 281
		f 4 527 528 -509 529
		mu 0 4 279 278 268 270
		f 4 -413 530 -530 -512
		mu 0 4 203 220 279 270
		f 4 -333 531 -527 532
		mu 0 4 224 178 280 281
		f 4 -420 -533 533 -531
		mu 0 4 220 224 281 279
		f 4 534 -528 -534 -526
		mu 0 4 282 278 279 281
		f 4 535 -505 536 537
		mu 0 4 283 266 274 284
		f 4 -518 -529 538 -537
		mu 0 4 274 268 278 284
		f 4 539 -503 540 -525
		mu 0 4 277 285 286 282
		f 4 541 -539 -535 -541
		mu 0 4 286 284 278 282
		f 4 542 -538 -542 -502
		mu 0 4 287 283 284 286
		f 4 -25 543 544 545
		mu 0 4 345 346 296 295
		f 4 546 547 548 549
		mu 0 4 292 291 289 293
		f 4 -506 550 -547 551
		mu 0 4 276 266 291 292
		f 4 552 -523 -552 553
		mu 0 4 290 264 276 292
		f 4 554 -554 -550 555
		mu 0 4 288 290 292 293
		f 4 -549 556 -545 557
		mu 0 4 293 289 295 296
		f 4 558 -556 -558 559
		mu 0 4 294 288 293 296
		f 4 -29 560 -560 -544
		mu 0 4 346 347 294 296
		f 4 561 562 563 564
		mu 0 4 300 297 302 301
		f 4 -548 565 566 567
		mu 0 4 289 291 299 298
		f 4 -551 -536 568 -566
		mu 0 4 291 266 283 299
		f 4 -501 569 -565 570
		mu 0 4 287 265 300 301
		f 4 -543 -571 571 -569
		mu 0 4 283 287 301 299
		f 4 572 -567 -572 -564
		mu 0 4 302 298 299 301
		f 4 -42 -546 573 574
		mu 0 4 348 345 295 303
		f 4 -557 -568 575 -574
		mu 0 4 295 289 298 303
		f 4 -563 576 -498 577
		mu 0 4 302 297 304 305
		f 4 -576 -573 -578 578
		mu 0 4 303 298 302 305
		f 4 -45 -575 -579 -497
		mu 0 4 344 348 303 305
		f 4 579 580 581 582
		mu 0 4 323 306 325 324
		f 4 583 584 585 586
		mu 0 4 307 314 313 312
		f 4 587 588 589 590
		mu 0 4 310 309 308 311
		f 4 -461 591 -588 592
		mu 0 4 252 245 309 310
		f 4 -532 -476 -593 593
		mu 0 4 280 178 252 310
		f 4 -524 -594 -591 594
		mu 0 4 277 280 310 311
		f 4 -590 595 -586 596
		mu 0 4 311 308 312 313
		f 4 -540 -595 -597 597
		mu 0 4 285 277 311 313
		f 4 598 -500 -598 -585
		mu 0 4 314 265 285 313
		f 4 599 600 601 602
		mu 0 4 318 315 320 319
		f 4 603 -589 604 605
		mu 0 4 316 308 309 317
		f 4 -592 -489 606 -605
		mu 0 4 309 245 259 317
		f 4 607 -603 608 -330
		mu 0 4 176 318 319 263
		f 4 609 -607 -496 -609
		mu 0 4 319 317 259 263
		f 4 610 -606 -610 -602
		mu 0 4 320 316 317 319
		f 4 611 -587 612 613
		mu 0 4 321 307 312 322
		f 4 -596 -604 614 -613
		mu 0 4 312 308 316 322
		f 4 615 -583 616 -601
		mu 0 4 315 323 324 320
		f 4 617 -615 -611 -617
		mu 0 4 324 322 316 320
		f 4 618 -614 -618 -582
		mu 0 4 325 321 322 324
		f 4 -103 619 620 621
		mu 0 4 349 350 331 330
		f 4 622 623 624 625
		mu 0 4 328 327 326 329
		f 4 -584 626 -623 627
		mu 0 4 314 307 327 328
		f 4 -570 -599 -628 628
		mu 0 4 300 265 314 328
		f 4 -562 -629 -626 629
		mu 0 4 297 300 328 329
		f 4 -625 630 -621 631
		mu 0 4 329 326 330 331
		f 4 -577 -630 -632 632
		mu 0 4 304 297 329 331
		f 4 -107 -499 -633 -620
		mu 0 4 350 343 304 331
		f 4 633 634 635 636
		mu 0 4 335 332 337 336
		f 4 637 -624 638 639
		mu 0 4 333 326 327 334
		f 4 -627 -612 640 -639
		mu 0 4 327 307 321 334
		f 4 641 -637 642 -581
		mu 0 4 306 335 336 325
		f 4 643 -641 -619 -643
		mu 0 4 336 334 321 325
		f 4 644 -640 -644 -636
		mu 0 4 337 333 334 336
		f 4 -116 -622 645 646
		mu 0 4 351 349 330 338
		f 4 -631 -638 647 -646
		mu 0 4 330 326 333 338
		f 4 648 -4 649 -635
		mu 0 4 332 339 340 337
		f 4 650 -648 -645 -650
		mu 0 4 340 338 333 337
		f 4 -119 -647 -651 -3
		mu 0 4 64 351 338 340;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "outputCloth1" -p "poly_cloth";
	rename -uid "FDBA7ADA-4CD8-477E-C967-2983520A79E1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".qsp" 0;
createNode transform -n "poly" -p "poly_proxyGeo";
	rename -uid "288C87ED-47E1-E42C-EECD-759BCD7DA389";
createNode mesh -n "polyShape" -p "poly";
	rename -uid "F660570E-499B-AC1D-0899-29923380A378";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "poly_final" -p "poly_proxyGeo";
	rename -uid "EDA49F92-47C9-9B4A-B1D9-F7B36B0E0573";
	setAttr ".v" no;
createNode mesh -n "poly_finalShape" -p "poly_final";
	rename -uid "B7BEAAE0-4C58-9916-4300-AA93FD4F79DB";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "poly_finalShapeOrig" -p "poly_final";
	rename -uid "CE8C9BB3-4913-0B57-A9C5-BFA30FE005E9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 352 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0 1 1 1 0.51145577 0 0.51145577
		 1 0.23999546 0 0.23999546 0.49962494 0 0.49962494 0.23999546 0.49962494 0.09237884
		 0 0.09237884 0.19971229 0 0.19971229 0.09237884 0.19971229 0.02922399 0 0.02922399
		 0.099829264 0 0.099829264 0.02922399 0.19971229 0.059813764 0 0.059813764 0.099829264
		 0.059813764 0.099829264 0.09237884 0.49962494 0.02922399 0.29964319 0 0.29964319
		 0.02922399 0.39961606 0 0.39961606 0.02922399 0.29964319 0.09237884 0.29964319 0.059813764
		 0.49962494 0.059813764 0.39961606 0.059813764 0.39961606 0.09237884 0.19971229 0.23999546
		 0 0.16522093 0.19971229 0.16522093 0 0.12805699 0.19971229 0.12805699 0.099829264
		 0.12805699 0.099829264 0.16522093 0 0.20262143 0.19971229 0.20262143 0.099829264
		 0.20262143 0.099829264 0.23999546 0.49962494 0.16522093 0.29964319 0.16522093 0.29964319
		 0.12805699 0.49962494 0.12805699 0.39961606 0.12805699 0.39961606 0.16522093 0.29964319
		 0.23999546 0.29964319 0.20262143 0.49962494 0.20262143 0.39961606 0.20262143 0.39961606
		 0.23999546 1 0.09237884 0.69972682 0 0.69972682 0.09237884 0.69972682 0.02922399
		 0.59966385 0 0.59966385 0.02922399 0.69972682 0.059813764 0.59966385 0.059813764
		 0.59966385 0.09237884 1 0.02922399 0.79980785 0 0.79980785 0.02922399 0.89990091
		 1 0.89990091 0.02922399 0.79980785 0.09237884 0.79980785 0.059813764 1 0.059813764
		 0.89990091 0.059813764 0.89990091 0.09237884 0.69972682 0.23999546 0.69972682 0.16522093
		 0.69972682 0.12805699 0.59966385 0.12805699 0.59966385 0.16522093 0.69972682 0.20262143
		 0.59966385 0.20262143 0.59966385 0.23999546 1 0.16522093 0.79980785 0.16522093 0.79980785
		 0.12805699 1 0.12805699 0.89990091 0.12805699 0.89990091 0.16522093 0.79980785 0.23999546
		 0.79980785 0.20262143 1 0.20262143 0.89990091 0.20262143 0.89990091 0.23999546 0.49962494
		 0.51145577 0 0.38718152 0.49962494 0.38718152 0.19971229 0.38718152 0 0.3137666 0.19971229
		 0.3137666 0 0.27704099 0.19971229 0.27704099 0.099829264 0.27704099 0.099829264 0.3137666
		 0 0.35057253 0.19971229 0.35057253 0.099829264 0.35057253 0.099829264 0.38718152
		 0.49962494 0.3137666 0.29964319 0.3137666 0.29964319 0.27704099 0.49962494 0.27704099
		 0.39961606 0.27704099 0.39961606 0.3137666 0.29964319 0.38718152 0.29964319 0.35057253
		 0.49962494 0.35057253 0.39961606 0.35057253 0.39961606 0.38718152 0.19971229 0.51145577
		 0 0.45312548 0.19971229 0.45312548 0 0.42162433 0.19971229 0.42162433 0.099829264
		 0.42162433 0.099829264 0.45312548 0 0.48321304 0.19971229 0.48321304 0.099829264
		 0.48321304 0.099829264 0.51145577 0.49962494 0.45312548 0.29964319 0.45312548 0.29964319
		 0.42162433 0.49962494 0.42162433 0.39961606 0.42162433 0.39961606 0.45312548 0.29964319
		 0.51145577 0.29964319 0.48321304 0.49962494 0.48321304 0.39961606 0.48321304 0.39961606
		 0.51145577 1 0.38718152 0.69972682 0.38718152 0.69972682 0.3137666 0.69972682 0.27704099
		 0.59966385 0.27704099 0.59966385 0.3137666 0.69972682 0.35057253 0.59966385 0.35057253
		 0.59966385 0.38718152 1 0.3137666 0.79980785 0.3137666 0.79980785 0.27704099 1 0.27704099
		 0.89990091 0.27704099 0.89990091 0.3137666 0.79980785 0.38718152 0.79980785 0.35057253
		 1 0.35057253 0.89990091 0.35057253 0.89990091 0.38718152 0.69972682 0.51145577 0.69972682
		 0.45312548 0.69972682 0.42162433 0.59966385 0.42162433 0.59966385 0.45312548 0.69972682
		 0.48321304 0.59966385 0.48321304 0.59966385 0.51145577 1 0.45312548 0.79980785 0.45312548
		 0.79980785 0.42162433 1 0.42162433 0.89990091 0.42162433 0.89990091 0.45312548 0.79980785
		 0.51145577 0.79980785 0.48321304 1 0.48321304 0.89990091 0.48321304 0.89990091 0.51145577
		 1 0.7599076 0 0.7599076 0.49962494 0.7599076 0 0.62121159 0.49962494 0.62121159 0.19971229
		 0.62121159 0 0.56319696 0.19971229 0.56319696 0 0.53759515 0.19971229 0.53759515
		 0.099829264 0.53759515 0.099829264 0.56319696 0 0.59045434 0.19971229 0.59045434
		 0.099829264 0.59045434 0.099829264 0.62121159 0.49962494 0.56319696 0.29964319 0.56319696
		 0.29964319 0.53759515 0.49962494 0.53759515 0.39961606 0.53759515 0.39961606 0.56319696
		 0.29964319 0.62121159 0.29964319 0.59045434 0.49962494 0.59045434 0.39961606 0.59045434
		 0.39961606 0.62121159 0.19971229 0.7599076 0 0.68918294 0.19971229 0.68918294 0 0.6544022
		 0.19971229 0.6544022 0.099829264 0.6544022 0.099829264 0.68918294 0 0.72480613 0.19971229
		 0.72480613 0.099829264 0.72480613 0.099829264 0.7599076 0.49962494 0.68918294 0.29964319
		 0.68918294 0.29964319 0.6544022 0.49962494 0.6544022 0.39961606 0.6544022 0.39961606
		 0.68918294 0.29964319 0.7599076 0.29964319 0.72480613 0.49962494 0.72480613 0.39961606
		 0.72480613 0.39961606 0.7599076 1 0.62121159 0.69972682 0.62121159 0.69972682 0.56319696
		 0.69972682 0.53759515 0.59966385 0.53759515 0.59966385 0.56319696 0.69972682 0.59045434
		 0.59966385 0.59045434 0.59966385 0.62121159 1 0.56319696 0.79980785 0.56319696 0.79980785
		 0.53759515 1 0.53759515 0.89990091 0.53759515 0.89990091 0.56319696 0.79980785 0.62121159
		 0.79980785 0.59045434 1 0.59045434 0.89990091 0.59045434 0.89990091 0.62121159 0.69972682
		 0.7599076 0.69972682 0.68918294 0.69972682 0.6544022 0.59966385 0.6544022 0.59966385
		 0.68918294;
	setAttr ".uvst[0].uvsp[250:351]" 0.69972682 0.72480613 0.59966385 0.72480613
		 0.59966385 0.7599076 1 0.68918294 0.79980785 0.68918294 0.79980785 0.6544022 1 0.6544022
		 0.89990091 0.6544022 0.89990091 0.68918294 0.79980785 0.7599076 0.79980785 0.72480613
		 1 0.72480613 0.89990091 0.72480613 0.89990091 0.7599076 0 0.89206702 0.49962494 0.89206702
		 0.19971229 0.89206702 0 0.82712084 0.19971229 0.82712084 0 0.79386246 0.19971229
		 0.79386246 0.099829264 0.79386246 0.099829264 0.82712084 0 0.86005396 0.19971229
		 0.86005396 0.099829264 0.86005396 0.099829264 0.89206702 0.49962494 0.82712084 0.29964319
		 0.82712084 0.29964319 0.79386246 0.49962494 0.79386246 0.39961606 0.79386246 0.39961606
		 0.82712084 0.29964319 0.89206702 0.29964319 0.86005396 0.49962494 0.86005396 0.39961606
		 0.86005396 0.39961606 0.89206702 0 0.94757915 0.19971229 0.94757915 0 0.92129254
		 0.19971229 0.92129254 0.099829264 0.92129254 0.099829264 0.94757915 0 0.97316229
		 0.19971229 0.97316229 0.099829264 0.97316229 0.49962494 0.94757915 0.29964319 0.94757915
		 0.29964319 0.92129254 0.49962494 0.92129254 0.39961606 0.92129254 0.39961606 0.94757915
		 0.29964319 0.97316229 0.49962494 0.97316229 0.39961606 0.97316229 1 0.89206702 0.69972682
		 0.89206702 0.69972682 0.82712084 0.69972682 0.79386246 0.59966385 0.79386246 0.59966385
		 0.82712084 0.69972682 0.86005396 0.59966385 0.86005396 0.59966385 0.89206702 1 0.82712084
		 0.79980785 0.82712084 0.79980785 0.79386246 1 0.79386246 0.89990091 0.79386246 0.89990091
		 0.82712084 0.79980785 0.89206702 0.79980785 0.86005396 1 0.86005396 0.89990091 0.86005396
		 0.89990091 0.89206702 0.69972682 0.94757915 0.69972682 0.92129254 0.59966385 0.92129254
		 0.59966385 0.94757915 0.69972682 0.97316229 0.59966385 0.97316229 1 0.94757915 0.79980785
		 0.94757915 0.79980785 0.92129254 1 0.92129254 0.89990091 0.92129254 0.89990091 0.94757915
		 0.79980785 0.97316229 1 0.97316229 0.89990091 0.97316229 0.89990091 0 1 0 0.49962494
		 1 0.39961606 1 0.19971229 1 0.099829264 1 0 1 0.29964319 1 0.69972682 1 0.59966385
		 1 0.79980785 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 341 ".vt";
	setAttr ".vt[0:165]"  6.088716984 -0.50825781 -0.12770517 6.088716984 7.49138832 -0.12770517
		 -6.083134651 7.49138832 -0.58103245 -6.083134651 -0.50825781 -0.58103245 0.31780997 7.49138832 3.78282475
		 0.31780997 -0.50825781 3.78282475 6.088716984 3.49156547 -0.12770517 0.31780997 3.49156547 3.78282475
		 4.44982386 3.49156547 2.58111024 4.44982386 -0.50825781 2.58111024 6.088716984 1.091671586 -0.12770517
		 4.44982386 1.091671586 2.58111024 5.83133888 1.091671586 0.92652881 5.83133888 -0.50825781 0.92652881
		 6.088716984 0.29170692 -0.12770517 5.83133888 0.29170692 0.92652881 5.25032806 1.091671586 1.84465325
		 5.25032806 -0.50825781 1.84465325 5.25032806 0.29170692 1.84465325 4.44982386 0.29170692 2.58111024
		 5.83133888 3.49156547 0.92652881 6.088716984 1.89163625 -0.12770517 5.83133888 1.89163625 0.92652881
		 6.088716984 2.6916008 -0.12770517 5.83133888 2.6916008 0.92652881 4.44982386 1.89163625 2.58111024
		 5.25032806 1.89163625 1.84465325 5.25032806 3.49156547 1.84465325 5.25032806 2.6916008 1.84465325
		 4.44982386 2.6916008 2.58111024 0.31780997 1.091671586 3.78282475 2.46709919 -0.50825781 3.45097089
		 2.46709919 1.091671586 3.45097089 3.50071144 -0.50825781 3.10947061 3.50071144 1.091671586 3.10947061
		 3.50071144 0.29170692 3.10947061 2.46709919 0.29170692 3.45097089 1.40141761 -0.50825781 3.67588544
		 1.40141761 1.091671586 3.67588544 1.40141761 0.29170692 3.67588544 0.31780997 0.29170692 3.78282475
		 2.46709919 3.49156547 3.45097089 2.46709919 1.89163625 3.45097089 3.50071144 1.89163625 3.10947061
		 3.50071144 3.49156547 3.10947061 3.50071144 2.6916008 3.10947061 2.46709919 2.6916008 3.45097089
		 0.31780997 1.89163625 3.78282475 1.40141761 1.89163625 3.67588544 1.40141761 3.49156547 3.67588544
		 1.40141761 2.6916008 3.67588544 0.31780997 2.6916008 3.78282475 4.44982386 7.49138832 2.58111024
		 6.088716984 5.09149456 -0.12770517 4.44982386 5.09149456 2.58111024 5.83133888 5.09149456 0.92652881
		 6.088716984 4.29153013 -0.12770517 5.83133888 4.29153013 0.92652881 5.25032806 5.09149456 1.84465325
		 5.25032806 4.29153013 1.84465325 4.44982386 4.29153013 2.58111024 5.83133888 7.49138832 0.92652881
		 6.088716984 5.89145899 -0.12770517 5.83133888 5.89145899 0.92652881 6.088716984 6.69142389 -0.12770517
		 5.83133888 6.69142389 0.92652881 4.44982386 5.89145899 2.58111024 5.25032806 5.89145899 1.84465325
		 5.25032806 7.49138832 1.84465325 5.25032806 6.69142389 1.84465325 4.44982386 6.69142389 2.58111024
		 0.31780997 5.09149456 3.78282475 2.46709919 5.09149456 3.45097089 3.50071144 5.09149456 3.10947061
		 3.50071144 4.29153013 3.10947061 2.46709919 4.29153013 3.45097089 1.40141761 5.09149456 3.67588544
		 1.40141761 4.29153013 3.67588544 0.31780997 4.29153013 3.78282475 2.46709919 7.49138832 3.45097089
		 2.46709919 5.89145899 3.45097089 3.50071144 5.89145899 3.10947061 3.50071144 7.49138832 3.10947061
		 3.50071144 6.69142389 3.10947061 2.46709919 6.69142389 3.45097089 0.31780997 5.89145899 3.78282475
		 1.40141761 5.89145899 3.67588544 1.40141761 7.49138832 3.67588544 1.40141761 6.69142389 3.67588544
		 0.31780997 6.69142389 3.78282475 -6.083134651 3.49156547 -0.58103245 -3.91198659 -0.50825781 2.91410398
		 -3.91198659 3.49156547 2.91410398 -3.91198659 1.091671586 2.91410398 -1.84801245 -0.50825781 3.59031749
		 -1.84801245 1.091671586 3.59031749 -0.77060974 -0.50825781 3.75034165 -0.77060974 1.091671586 3.75034165
		 -0.77060974 0.29170692 3.75034165 -1.84801245 0.29170692 3.59031749 -2.90422964 -0.50825781 3.32448792
		 -2.90422964 1.091671586 3.32448792 -2.90422964 0.29170692 3.32448792 -3.91198659 0.29170692 2.91410398
		 -1.84801245 3.49156547 3.59031749 -1.84801245 1.89163625 3.59031749 -0.77060974 1.89163625 3.75034165
		 -0.77060974 3.49156547 3.75034165 -0.77060974 2.6916008 3.75034165 -1.84801245 2.6916008 3.59031749
		 -3.91198659 1.89163625 2.91410398 -2.90422964 1.89163625 3.32448792 -2.90422964 3.49156547 3.32448792
		 -2.90422964 2.6916008 3.32448792 -3.91198659 2.6916008 2.91410398 -6.083134651 1.091671586 -0.58103245
		 -5.52546978 -0.50825781 1.48129237 -5.52546978 1.091671586 1.48129237 -4.80595398 -0.50825781 2.29691744
		 -4.80595398 1.091671586 2.29691744 -4.80595398 0.29170692 2.29691744 -5.52546978 0.29170692 1.48129237
		 -5.9844141 -0.50825781 0.49746567 -5.9844141 1.091671586 0.49746567 -5.9844141 0.29170692 0.49746567
		 -6.083134651 0.29170692 -0.58103245 -5.52546978 3.49156547 1.48129237 -5.52546978 1.89163625 1.48129237
		 -4.80595398 1.89163625 2.29691744 -4.80595398 3.49156547 2.29691744 -4.80595398 2.6916008 2.29691744
		 -5.52546978 2.6916008 1.48129237 -6.083134651 1.89163625 -0.58103245 -5.9844141 1.89163625 0.49746567
		 -5.9844141 3.49156547 0.49746567 -5.9844141 2.6916008 0.49746567 -6.083134651 2.6916008 -0.58103245
		 -3.91198659 7.49138832 2.91410398 -3.91198659 5.09149456 2.91410398 -1.84801245 5.09149456 3.59031749
		 -0.77060974 5.09149456 3.75034165 -0.77060974 4.29153013 3.75034165 -1.84801245 4.29153013 3.59031749
		 -2.90422964 5.09149456 3.32448792 -2.90422964 4.29153013 3.32448792 -3.91198659 4.29153013 2.91410398
		 -1.84801245 7.49138832 3.59031749 -1.84801245 5.89145899 3.59031749 -0.77060974 5.89145899 3.75034165
		 -0.77060974 7.49138832 3.75034165 -0.77060974 6.69142389 3.75034165 -1.84801245 6.69142389 3.59031749
		 -3.91198659 5.89145899 2.91410398 -2.90422964 5.89145899 3.32448792 -2.90422964 7.49138832 3.32448792
		 -2.90422964 6.69142389 3.32448792 -3.91198659 6.69142389 2.91410398 -6.083134651 5.09149456 -0.58103245
		 -5.52546978 5.09149456 1.48129237 -4.80595398 5.09149456 2.29691744 -4.80595398 4.29153013 2.29691744
		 -5.52546978 4.29153013 1.48129237 -5.9844141 5.09149456 0.49746567 -5.9844141 4.29153013 0.49746567
		 -6.083134651 4.29153013 -0.58103245 -5.52546978 7.49138832 1.48129237;
	setAttr ".vt[166:331]" -5.52546978 5.89145899 1.48129237 -4.80595398 5.89145899 2.29691744
		 -4.80595398 7.49138832 2.29691744 -4.80595398 6.69142389 2.29691744 -5.52546978 6.69142389 1.48129237
		 -6.083134651 5.89145899 -0.58103245 -5.9844141 5.89145899 0.49746567 -5.9844141 7.49138832 0.49746567
		 -5.9844141 6.69142389 0.49746567 -6.083134651 6.69142389 -0.58103245 0.2239593 7.49138832 -5.23725367
		 0.2239593 -0.50825781 -5.23725367 0.2239593 3.49156547 -5.23725367 -3.95283842 -0.50825781 -4.22692251
		 -3.95283842 3.49156547 -4.22692251 -3.95283842 1.091671586 -4.22692251 -5.41717005 -0.50825781 -2.64281416
		 -5.41717005 1.091671586 -2.64281416 -5.85980034 -0.50825781 -1.64717352 -5.85980034 1.091671586 -1.64717352
		 -5.85980034 0.29170692 -1.64717352 -5.41717005 0.29170692 -2.64281416 -4.7838068 -0.50825781 -3.52634811
		 -4.7838068 1.091671586 -3.52634811 -4.7838068 0.29170692 -3.52634811 -3.95283842 0.29170692 -4.22692251
		 -5.41717005 3.49156547 -2.64281416 -5.41717005 1.89163625 -2.64281416 -5.85980034 1.89163625 -1.64717352
		 -5.85980034 3.49156547 -1.64717352 -5.85980034 2.6916008 -1.64717352 -5.41717005 2.6916008 -2.64281416
		 -3.95283842 1.89163625 -4.22692251 -4.7838068 1.89163625 -3.52634811 -4.7838068 3.49156547 -3.52634811
		 -4.7838068 2.6916008 -3.52634811 -3.95283842 2.6916008 -4.22692251 0.2239593 1.091671586 -5.23725367
		 -1.93828881 -0.50825781 -5.029557705 -1.93828881 1.091671586 -5.029557705 -2.97942948 -0.50825781 -4.71133518
		 -2.97942948 1.091671586 -4.71133518 -2.97942948 0.29170692 -4.71133518 -1.93828881 0.29170692 -5.029557705
		 -0.86424822 -0.50825781 -5.20650816 -0.86424822 1.091671586 -5.20650816 -0.86424822 0.29170692 -5.20650816
		 0.2239593 0.29170692 -5.23725367 -1.93828881 3.49156547 -5.029557705 -1.93828881 1.89163625 -5.029557705
		 -2.97942948 1.89163625 -4.71133518 -2.97942948 3.49156547 -4.71133518 -2.97942948 2.6916008 -4.71133518
		 -1.93828881 2.6916008 -5.029557705 0.2239593 1.89163625 -5.23725367 -0.86424822 1.89163625 -5.20650816
		 -0.86424822 3.49156547 -5.20650816 -0.86424822 2.6916008 -5.20650816 0.2239593 2.6916008 -5.23725367
		 -3.95283842 7.49138832 -4.22692251 -3.95283842 5.09149456 -4.22692251 -5.41717005 5.09149456 -2.64281416
		 -5.85980034 5.09149456 -1.64717352 -5.85980034 4.29153013 -1.64717352 -5.41717005 4.29153013 -2.64281416
		 -4.7838068 5.09149456 -3.52634811 -4.7838068 4.29153013 -3.52634811 -3.95283842 4.29153013 -4.22692251
		 -5.41717005 7.49138832 -2.64281416 -5.41717005 5.89145899 -2.64281416 -5.85980034 5.89145899 -1.64717352
		 -5.85980034 7.49138832 -1.64717352 -5.85980034 6.69142389 -1.64717352 -5.41717005 6.69142389 -2.64281416
		 -3.95283842 5.89145899 -4.22692251 -4.7838068 5.89145899 -3.52634811 -4.7838068 7.49138832 -3.52634811
		 -4.7838068 6.69142389 -3.52634811 -3.95283842 6.69142389 -4.22692251 0.2239593 5.09149456 -5.23725367
		 -1.93828881 5.09149456 -5.029557705 -2.97942948 5.09149456 -4.71133518 -2.97942948 4.29153013 -4.71133518
		 -1.93828881 4.29153013 -5.029557705 -0.86424822 5.09149456 -5.20650816 -0.86424822 4.29153013 -5.20650816
		 0.2239593 4.29153013 -5.23725367 -1.93828881 7.49138832 -5.029557705 -1.93828881 5.89145899 -5.029557705
		 -2.97942948 5.89145899 -4.71133518 -2.97942948 7.49138832 -4.71133518 -2.97942948 6.69142389 -4.71133518
		 -1.93828881 6.69142389 -5.029557705 0.2239593 5.89145899 -5.23725367 -0.86424822 5.89145899 -5.20650816
		 -0.86424822 7.49138832 -5.20650816 -0.86424822 6.69142389 -5.20650816 0.2239593 6.69142389 -5.23725367
		 4.3220253 -0.50825781 -3.95965481 4.3220253 3.49156547 -3.95965481 4.3220253 1.091671586 -3.95965481
		 2.37195778 -0.50825781 -4.89877605 2.37195778 1.091671586 -4.89877605 1.30814755 -0.50825781 -5.13227463
		 1.30814755 1.091671586 -5.13227463 1.30814755 0.29170692 -5.13227463 2.37195778 0.29170692 -4.89877605
		 3.39553452 -0.50825781 -4.52818251 3.39553452 1.091671586 -4.52818251 3.39553452 0.29170692 -4.52818251
		 4.3220253 0.29170692 -3.95965481 2.37195778 3.49156547 -4.89877605 2.37195778 1.89163625 -4.89877605
		 1.30814755 1.89163625 -5.13227463 1.30814755 3.49156547 -5.13227463 1.30814755 2.6916008 -5.13227463
		 2.37195778 2.6916008 -4.89877605 4.3220253 1.89163625 -3.95965481 3.39553452 1.89163625 -4.52818251
		 3.39553452 3.49156547 -4.52818251 3.39553452 2.6916008 -4.52818251 4.3220253 2.6916008 -3.95965481
		 5.62579107 -0.50825781 -2.23673964 5.62579107 1.091671586 -2.23673964 5.071962357 -0.50825781 -3.17581797
		 5.071962357 1.091671586 -3.17581797 5.071962357 0.29170692 -3.17581797 5.62579107 0.29170692 -2.23673964
		 5.98398972 -0.50825781 -1.20791209 5.98398972 1.091671586 -1.20791209 5.98398972 0.29170692 -1.20791209
		 5.62579107 3.49156547 -2.23673964 5.62579107 1.89163625 -2.23673964 5.071962357 1.89163625 -3.17581797
		 5.071962357 3.49156547 -3.17581797 5.071962357 2.6916008 -3.17581797 5.62579107 2.6916008 -2.23673964
		 5.98398972 1.89163625 -1.20791209 5.98398972 3.49156547 -1.20791209 5.98398972 2.6916008 -1.20791209
		 4.3220253 7.49138832 -3.95965481 4.3220253 5.09149456 -3.95965481 2.37195778 5.09149456 -4.89877605
		 1.30814755 5.09149456 -5.13227463 1.30814755 4.29153013 -5.13227463 2.37195778 4.29153013 -4.89877605
		 3.39553452 5.09149456 -4.52818251 3.39553452 4.29153013 -4.52818251 4.3220253 4.29153013 -3.95965481
		 2.37195778 7.49138832 -4.89877605 2.37195778 5.89145899 -4.89877605 1.30814755 5.89145899 -5.13227463
		 1.30814755 7.49138832 -5.13227463 1.30814755 6.69142389 -5.13227463 2.37195778 6.69142389 -4.89877605
		 4.3220253 5.89145899 -3.95965481 3.39553452 5.89145899 -4.52818251 3.39553452 7.49138832 -4.52818251
		 3.39553452 6.69142389 -4.52818251 4.3220253 6.69142389 -3.95965481 5.62579107 5.09149456 -2.23673964
		 5.071962357 5.09149456 -3.17581797 5.071962357 4.29153013 -3.17581797 5.62579107 4.29153013 -2.23673964
		 5.98398972 5.09149456 -1.20791209 5.98398972 4.29153013 -1.20791209;
	setAttr ".vt[332:340]" 5.62579107 7.49138832 -2.23673964 5.62579107 5.89145899 -2.23673964
		 5.071962357 5.89145899 -3.17581797 5.071962357 7.49138832 -3.17581797 5.071962357 6.69142389 -3.17581797
		 5.62579107 6.69142389 -2.23673964 5.98398972 5.89145899 -1.20791209 5.98398972 7.49138832 -1.20791209
		 5.98398972 6.69142389 -1.20791209;
	setAttr -s 651 ".ed";
	setAttr ".ed[0:165]"  339 1 1 1 64 1 64 340 1 340 339 1 173 2 1 2 175 1 175 174 1
		 174 173 1 87 4 1 4 89 1 89 88 1 88 87 1 49 7 1 7 51 1 51 50 1 50 49 1 27 8 1 8 29 1
		 29 28 1 28 27 1 16 11 1 11 19 1 19 18 1 18 16 1 14 10 1 10 12 1 12 15 1 15 14 1 0 14 1
		 15 13 1 13 0 1 12 16 1 18 15 1 18 17 1 17 13 1 19 9 1 9 17 1 23 6 1 6 20 1 20 24 1
		 24 23 1 10 21 1 21 22 1 22 12 1 21 23 1 24 22 1 25 11 1 16 26 1 26 25 1 22 26 1 20 27 1
		 28 24 1 28 26 1 29 25 1 30 40 1 40 39 1 39 38 1 38 30 1 35 34 1 34 32 1 32 36 1 36 35 1
		 11 34 1 35 19 1 33 9 1 35 33 1 31 33 1 36 31 1 32 38 1 39 36 1 37 31 1 39 37 1 40 5 1
		 5 37 1 44 41 1 41 46 1 46 45 1 45 44 1 42 32 1 34 43 1 43 42 1 25 43 1 8 44 1 45 29 1
		 45 43 1 46 42 1 47 30 1 38 48 1 48 47 1 42 48 1 41 49 1 50 46 1 50 48 1 51 47 1 68 52 1
		 52 70 1 70 69 1 69 68 1 58 54 1 54 60 1 60 59 1 59 58 1 56 53 1 53 55 1 55 57 1 57 56 1
		 6 56 1 57 20 1 55 58 1 59 57 1 59 27 1 60 8 1 1 61 1 61 65 1 65 64 1 53 62 1 62 63 1
		 63 55 1 62 64 1 65 63 1 66 54 1 58 67 1 67 66 1 63 67 1 61 68 1 69 65 1 69 67 1 70 66 1
		 71 78 1 78 77 1 77 76 1 76 71 1 74 73 1 73 72 1 72 75 1 75 74 1 54 73 1 74 60 1 74 44 1
		 75 41 1 72 76 1 77 75 1 77 49 1 78 7 1 82 79 1 79 84 1 84 83 1 83 82 1 80 72 1 73 81 1
		 81 80 1 66 81 1 52 82 1 83 70 1 83 81 1 84 80 1 85 71 1 76 86 1 86 85 1 80 86 1 79 87 1
		 88 84 1 88 86 1 89 85 1 90 136 1 136 135 1;
	setAttr ".ed[166:331]" 135 134 1 134 90 1 112 92 1 92 114 1 114 113 1 113 112 1
		 102 101 1 101 93 1 93 103 1 103 102 1 98 97 1 97 95 1 95 99 1 99 98 1 30 97 1 98 40 1
		 96 5 1 98 96 1 94 96 1 99 94 1 95 101 1 102 99 1 100 94 1 102 100 1 91 100 1 103 91 1
		 107 104 1 104 109 1 109 108 1 108 107 1 106 105 1 105 95 1 97 106 1 47 106 1 7 107 1
		 108 51 1 108 106 1 109 105 1 110 93 1 101 111 1 111 110 1 105 111 1 104 112 1 113 109 1
		 113 111 1 114 110 1 115 125 1 125 124 1 124 123 1 123 115 1 120 119 1 119 117 1 117 121 1
		 121 120 1 93 119 1 120 103 1 118 91 1 120 118 1 116 118 1 121 116 1 117 123 1 124 121 1
		 122 116 1 124 122 1 125 3 1 3 122 1 129 126 1 126 131 1 131 130 1 130 129 1 119 128 1
		 128 127 1 127 117 1 110 128 1 92 129 1 130 114 1 130 128 1 131 127 1 132 115 1 123 133 1
		 133 132 1 127 133 1 126 134 1 135 131 1 135 133 1 136 132 1 154 137 1 137 156 1 156 155 1
		 155 154 1 138 145 1 145 144 1 144 143 1 143 138 1 141 140 1 140 139 1 139 142 1 142 141 1
		 71 140 1 141 78 1 141 107 1 142 104 1 139 143 1 144 142 1 144 112 1 145 92 1 149 146 1
		 146 151 1 151 150 1 150 149 1 147 139 1 140 148 1 148 147 1 85 148 1 4 149 1 150 89 1
		 150 148 1 151 147 1 152 138 1 143 153 1 153 152 1 147 153 1 146 154 1 155 151 1 155 153 1
		 156 152 1 157 164 1 164 163 1 163 162 1 162 157 1 160 159 1 159 158 1 158 161 1 161 160 1
		 138 159 1 160 145 1 160 129 1 161 126 1 158 162 1 163 161 1 163 134 1 164 90 1 168 165 1
		 165 170 1 170 169 1 169 168 1 166 158 1 159 167 1 167 166 1 152 167 1 137 168 1 169 156 1
		 169 167 1 170 166 1 171 157 1 162 172 1 172 171 1 166 172 1 165 173 1 174 170 1 174 172 1
		 175 171 1 261 176 1 176 263 1 263 262 1 262 261 1;
	setAttr ".ed[332:497]" 178 224 1 224 223 1 223 222 1 222 178 1 200 180 1 180 202 1
		 202 201 1 201 200 1 190 189 1 189 181 1 181 191 1 191 190 1 186 185 1 185 183 1 183 187 1
		 187 186 1 115 185 1 186 125 1 184 3 1 186 184 1 182 184 1 187 182 1 183 189 1 190 187 1
		 188 182 1 190 188 1 179 188 1 191 179 1 195 192 1 192 197 1 197 196 1 196 195 1 194 193 1
		 193 183 1 185 194 1 132 194 1 90 195 1 196 136 1 196 194 1 197 193 1 198 181 1 189 199 1
		 199 198 1 193 199 1 192 200 1 201 197 1 201 199 1 202 198 1 203 213 1 213 212 1 212 211 1
		 211 203 1 208 207 1 207 205 1 205 209 1 209 208 1 181 207 1 208 191 1 206 179 1 208 206 1
		 204 206 1 209 204 1 205 211 1 212 209 1 210 204 1 212 210 1 213 177 1 177 210 1 217 214 1
		 214 219 1 219 218 1 218 217 1 207 216 1 216 215 1 215 205 1 198 216 1 180 217 1 218 202 1
		 218 216 1 219 215 1 220 203 1 211 221 1 221 220 1 215 221 1 214 222 1 223 219 1 223 221 1
		 224 220 1 242 225 1 225 244 1 244 243 1 243 242 1 226 233 1 233 232 1 232 231 1 231 226 1
		 229 228 1 228 227 1 227 230 1 230 229 1 157 228 1 229 164 1 229 195 1 230 192 1 227 231 1
		 232 230 1 232 200 1 233 180 1 237 234 1 234 239 1 239 238 1 238 237 1 235 227 1 228 236 1
		 236 235 1 171 236 1 2 237 1 238 175 1 238 236 1 239 235 1 240 226 1 231 241 1 241 240 1
		 235 241 1 234 242 1 243 239 1 243 241 1 244 240 1 245 252 1 252 251 1 251 250 1 250 245 1
		 248 247 1 247 246 1 246 249 1 249 248 1 226 247 1 248 233 1 248 217 1 249 214 1 246 250 1
		 251 249 1 251 222 1 252 178 1 256 253 1 253 258 1 258 257 1 257 256 1 254 246 1 247 255 1
		 255 254 1 240 255 1 225 256 1 257 244 1 257 255 1 258 254 1 259 245 1 250 260 1 260 259 1
		 254 260 1 253 261 1 262 258 1 262 260 1 263 259 1 23 305 1 305 304 1;
	setAttr ".ed[498:650]" 304 6 1 285 265 1 265 287 1 287 286 1 286 285 1 275 274 1
		 274 266 1 266 276 1 276 275 1 271 270 1 270 268 1 268 272 1 272 271 1 203 270 1 271 213 1
		 269 177 1 271 269 1 267 269 1 272 267 1 268 274 1 275 272 1 273 267 1 275 273 1 264 273 1
		 276 264 1 280 277 1 277 282 1 282 281 1 281 280 1 279 278 1 278 268 1 270 279 1 220 279 1
		 178 280 1 281 224 1 281 279 1 282 278 1 283 266 1 274 284 1 284 283 1 278 284 1 277 285 1
		 286 282 1 286 284 1 287 283 1 14 296 1 296 295 1 295 10 1 292 291 1 291 289 1 289 293 1
		 293 292 1 266 291 1 292 276 1 290 264 1 292 290 1 288 290 1 293 288 1 289 295 1 296 293 1
		 294 288 1 296 294 1 0 294 1 300 297 1 297 302 1 302 301 1 301 300 1 291 299 1 299 298 1
		 298 289 1 283 299 1 265 300 1 301 287 1 301 299 1 302 298 1 295 303 1 303 21 1 298 303 1
		 297 304 1 305 302 1 305 303 1 323 306 1 306 325 1 325 324 1 324 323 1 307 314 1 314 313 1
		 313 312 1 312 307 1 310 309 1 309 308 1 308 311 1 311 310 1 245 309 1 310 252 1 310 280 1
		 311 277 1 308 312 1 313 311 1 313 285 1 314 265 1 318 315 1 315 320 1 320 319 1 319 318 1
		 316 308 1 309 317 1 317 316 1 259 317 1 176 318 1 319 263 1 319 317 1 320 316 1 321 307 1
		 312 322 1 322 321 1 316 322 1 315 323 1 324 320 1 324 322 1 325 321 1 56 331 1 331 330 1
		 330 53 1 328 327 1 327 326 1 326 329 1 329 328 1 307 327 1 328 314 1 328 300 1 329 297 1
		 326 330 1 331 329 1 331 304 1 335 332 1 332 337 1 337 336 1 336 335 1 333 326 1 327 334 1
		 334 333 1 321 334 1 306 335 1 336 325 1 336 334 1 337 333 1 330 338 1 338 62 1 333 338 1
		 332 339 1 340 337 1 340 338 1;
	setAttr -s 310 -ch 1240 ".fc[0:309]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 339 1 64 340
		f 4 4 5 6 7
		mu 0 4 173 2 175 174
		f 4 8 9 10 11
		mu 0 4 87 4 89 88
		f 4 12 13 14 15
		mu 0 4 49 7 51 50
		f 4 16 17 18 19
		mu 0 4 27 8 29 28
		f 4 20 21 22 23
		mu 0 4 16 11 19 18
		f 4 24 25 26 27
		mu 0 4 14 10 12 15
		f 4 28 -28 29 30
		mu 0 4 0 14 15 13
		f 4 31 -24 32 -27
		mu 0 4 12 16 18 15
		f 4 33 34 -30 -33
		mu 0 4 18 17 13 15
		f 4 35 36 -34 -23
		mu 0 4 19 9 17 18
		f 4 37 38 39 40
		mu 0 4 23 6 20 24
		f 4 41 42 43 -26
		mu 0 4 10 21 22 12
		f 4 44 -41 45 -43
		mu 0 4 21 23 24 22
		f 4 46 -21 47 48
		mu 0 4 25 11 16 26
		f 4 -32 -44 49 -48
		mu 0 4 16 12 22 26
		f 4 50 -20 51 -40
		mu 0 4 20 27 28 24
		f 4 52 -50 -46 -52
		mu 0 4 28 26 22 24
		f 4 53 -49 -53 -19
		mu 0 4 29 25 26 28
		f 4 54 55 56 57
		mu 0 4 30 40 39 38
		f 4 58 59 60 61
		mu 0 4 35 34 32 36
		f 4 -22 62 -59 63
		mu 0 4 19 11 34 35
		f 4 64 -36 -64 65
		mu 0 4 33 9 19 35
		f 4 66 -66 -62 67
		mu 0 4 31 33 35 36
		f 4 -61 68 -57 69
		mu 0 4 36 32 38 39
		f 4 70 -68 -70 71
		mu 0 4 37 31 36 39
		f 4 72 73 -72 -56
		mu 0 4 40 5 37 39
		f 4 74 75 76 77
		mu 0 4 44 41 46 45
		f 4 78 -60 79 80
		mu 0 4 42 32 34 43
		f 4 -63 -47 81 -80
		mu 0 4 34 11 25 43
		f 4 82 -78 83 -18
		mu 0 4 8 44 45 29
		f 4 84 -82 -54 -84
		mu 0 4 45 43 25 29
		f 4 85 -81 -85 -77
		mu 0 4 46 42 43 45
		f 4 86 -58 87 88
		mu 0 4 47 30 38 48
		f 4 -69 -79 89 -88
		mu 0 4 38 32 42 48
		f 4 90 -16 91 -76
		mu 0 4 41 49 50 46
		f 4 92 -90 -86 -92
		mu 0 4 50 48 42 46
		f 4 93 -89 -93 -15
		mu 0 4 51 47 48 50
		f 4 94 95 96 97
		mu 0 4 68 52 70 69
		f 4 98 99 100 101
		mu 0 4 58 54 60 59
		f 4 102 103 104 105
		mu 0 4 56 53 55 57
		f 4 106 -106 107 -39
		mu 0 4 6 56 57 20
		f 4 108 -102 109 -105
		mu 0 4 55 58 59 57
		f 4 110 -51 -108 -110
		mu 0 4 59 27 20 57
		f 4 111 -17 -111 -101
		mu 0 4 60 8 27 59
		f 4 -2 112 113 114
		mu 0 4 341 342 61 65
		f 4 115 116 117 -104
		mu 0 4 53 62 63 55
		f 4 118 -115 119 -117
		mu 0 4 62 341 65 63
		f 4 120 -99 121 122
		mu 0 4 66 54 58 67
		f 4 -109 -118 123 -122
		mu 0 4 58 55 63 67
		f 4 124 -98 125 -114
		mu 0 4 61 68 69 65
		f 4 126 -124 -120 -126
		mu 0 4 69 67 63 65
		f 4 127 -123 -127 -97
		mu 0 4 70 66 67 69
		f 4 128 129 130 131
		mu 0 4 71 78 77 76
		f 4 132 133 134 135
		mu 0 4 74 73 72 75
		f 4 -100 136 -133 137
		mu 0 4 60 54 73 74
		f 4 -83 -112 -138 138
		mu 0 4 44 8 60 74
		f 4 -75 -139 -136 139
		mu 0 4 41 44 74 75
		f 4 -135 140 -131 141
		mu 0 4 75 72 76 77
		f 4 -91 -140 -142 142
		mu 0 4 49 41 75 77
		f 4 143 -13 -143 -130
		mu 0 4 78 7 49 77
		f 4 144 145 146 147
		mu 0 4 82 79 84 83
		f 4 148 -134 149 150
		mu 0 4 80 72 73 81
		f 4 -137 -121 151 -150
		mu 0 4 73 54 66 81
		f 4 152 -148 153 -96
		mu 0 4 52 82 83 70
		f 4 154 -152 -128 -154
		mu 0 4 83 81 66 70
		f 4 155 -151 -155 -147
		mu 0 4 84 80 81 83
		f 4 156 -132 157 158
		mu 0 4 85 71 76 86
		f 4 -141 -149 159 -158
		mu 0 4 76 72 80 86
		f 4 160 -12 161 -146
		mu 0 4 79 87 88 84
		f 4 162 -160 -156 -162
		mu 0 4 88 86 80 84
		f 4 163 -159 -163 -11
		mu 0 4 89 85 86 88
		f 4 164 165 166 167
		mu 0 4 90 136 135 134
		f 4 168 169 170 171
		mu 0 4 112 92 114 113
		f 4 172 173 174 175
		mu 0 4 102 101 93 103
		f 4 176 177 178 179
		mu 0 4 98 97 95 99
		f 4 -55 180 -177 181
		mu 0 4 40 30 97 98
		f 4 182 -73 -182 183
		mu 0 4 96 5 40 98
		f 4 184 -184 -180 185
		mu 0 4 94 96 98 99
		f 4 -179 186 -173 187
		mu 0 4 99 95 101 102
		f 4 188 -186 -188 189
		mu 0 4 100 94 99 102
		f 4 190 -190 -176 191
		mu 0 4 91 100 102 103
		f 4 192 193 194 195
		mu 0 4 107 104 109 108
		f 4 196 197 -178 198
		mu 0 4 106 105 95 97
		f 4 -87 199 -199 -181
		mu 0 4 30 47 106 97
		f 4 -14 200 -196 201
		mu 0 4 51 7 107 108
		f 4 -94 -202 202 -200
		mu 0 4 47 51 108 106
		f 4 203 -197 -203 -195
		mu 0 4 109 105 106 108
		f 4 204 -174 205 206
		mu 0 4 110 93 101 111
		f 4 -187 -198 207 -206
		mu 0 4 101 95 105 111
		f 4 208 -172 209 -194
		mu 0 4 104 112 113 109
		f 4 210 -208 -204 -210
		mu 0 4 113 111 105 109
		f 4 211 -207 -211 -171
		mu 0 4 114 110 111 113
		f 4 212 213 214 215
		mu 0 4 115 125 124 123
		f 4 216 217 218 219
		mu 0 4 120 119 117 121
		f 4 -175 220 -217 221
		mu 0 4 103 93 119 120
		f 4 222 -192 -222 223
		mu 0 4 118 91 103 120
		f 4 224 -224 -220 225
		mu 0 4 116 118 120 121
		f 4 -219 226 -215 227
		mu 0 4 121 117 123 124
		f 4 228 -226 -228 229
		mu 0 4 122 116 121 124
		f 4 230 231 -230 -214
		mu 0 4 125 3 122 124
		f 4 232 233 234 235
		mu 0 4 129 126 131 130
		f 4 -218 236 237 238
		mu 0 4 117 119 128 127
		f 4 -221 -205 239 -237
		mu 0 4 119 93 110 128
		f 4 -170 240 -236 241
		mu 0 4 114 92 129 130
		f 4 -212 -242 242 -240
		mu 0 4 110 114 130 128
		f 4 243 -238 -243 -235
		mu 0 4 131 127 128 130
		f 4 244 -216 245 246
		mu 0 4 132 115 123 133
		f 4 -227 -239 247 -246
		mu 0 4 123 117 127 133
		f 4 -234 248 -167 249
		mu 0 4 131 126 134 135
		f 4 -248 -244 -250 250
		mu 0 4 133 127 131 135
		f 4 251 -247 -251 -166
		mu 0 4 136 132 133 135
		f 4 252 253 254 255
		mu 0 4 154 137 156 155
		f 4 256 257 258 259
		mu 0 4 138 145 144 143
		f 4 260 261 262 263
		mu 0 4 141 140 139 142
		f 4 -129 264 -261 265
		mu 0 4 78 71 140 141
		f 4 -201 -144 -266 266
		mu 0 4 107 7 78 141
		f 4 -193 -267 -264 267
		mu 0 4 104 107 141 142
		f 4 -263 268 -259 269
		mu 0 4 142 139 143 144
		f 4 -209 -268 -270 270
		mu 0 4 112 104 142 144
		f 4 271 -169 -271 -258
		mu 0 4 145 92 112 144
		f 4 272 273 274 275
		mu 0 4 149 146 151 150
		f 4 276 -262 277 278
		mu 0 4 147 139 140 148
		f 4 -265 -157 279 -278
		mu 0 4 140 71 85 148
		f 4 280 -276 281 -10
		mu 0 4 4 149 150 89
		f 4 282 -280 -164 -282
		mu 0 4 150 148 85 89
		f 4 283 -279 -283 -275
		mu 0 4 151 147 148 150
		f 4 284 -260 285 286
		mu 0 4 152 138 143 153
		f 4 -269 -277 287 -286
		mu 0 4 143 139 147 153
		f 4 288 -256 289 -274
		mu 0 4 146 154 155 151
		f 4 290 -288 -284 -290
		mu 0 4 155 153 147 151
		f 4 291 -287 -291 -255
		mu 0 4 156 152 153 155
		f 4 292 293 294 295
		mu 0 4 157 164 163 162
		f 4 296 297 298 299
		mu 0 4 160 159 158 161
		f 4 -257 300 -297 301
		mu 0 4 145 138 159 160
		f 4 -241 -272 -302 302
		mu 0 4 129 92 145 160
		f 4 -233 -303 -300 303
		mu 0 4 126 129 160 161
		f 4 -299 304 -295 305
		mu 0 4 161 158 162 163
		f 4 -249 -304 -306 306
		mu 0 4 134 126 161 163
		f 4 307 -168 -307 -294
		mu 0 4 164 90 134 163
		f 4 308 309 310 311
		mu 0 4 168 165 170 169
		f 4 312 -298 313 314
		mu 0 4 166 158 159 167
		f 4 -301 -285 315 -314
		mu 0 4 159 138 152 167
		f 4 316 -312 317 -254
		mu 0 4 137 168 169 156
		f 4 318 -316 -292 -318
		mu 0 4 169 167 152 156
		f 4 319 -315 -319 -311
		mu 0 4 170 166 167 169
		f 4 320 -296 321 322
		mu 0 4 171 157 162 172
		f 4 -305 -313 323 -322
		mu 0 4 162 158 166 172
		f 4 324 -8 325 -310
		mu 0 4 165 173 174 170
		f 4 326 -324 -320 -326
		mu 0 4 174 172 166 170
		f 4 327 -323 -327 -7
		mu 0 4 175 171 172 174
		f 4 328 329 330 331
		mu 0 4 261 176 263 262
		f 4 332 333 334 335
		mu 0 4 178 224 223 222
		f 4 336 337 338 339
		mu 0 4 200 180 202 201
		f 4 340 341 342 343
		mu 0 4 190 189 181 191
		f 4 344 345 346 347
		mu 0 4 186 185 183 187
		f 4 -213 348 -345 349
		mu 0 4 125 115 185 186
		f 4 350 -231 -350 351
		mu 0 4 184 3 125 186
		f 4 352 -352 -348 353
		mu 0 4 182 184 186 187
		f 4 -347 354 -341 355
		mu 0 4 187 183 189 190
		f 4 356 -354 -356 357
		mu 0 4 188 182 187 190
		f 4 358 -358 -344 359
		mu 0 4 179 188 190 191
		f 4 360 361 362 363
		mu 0 4 195 192 197 196
		f 4 364 365 -346 366
		mu 0 4 194 193 183 185
		f 4 -245 367 -367 -349
		mu 0 4 115 132 194 185
		f 4 -165 368 -364 369
		mu 0 4 136 90 195 196
		f 4 -252 -370 370 -368
		mu 0 4 132 136 196 194
		f 4 371 -365 -371 -363
		mu 0 4 197 193 194 196
		f 4 372 -342 373 374
		mu 0 4 198 181 189 199
		f 4 -355 -366 375 -374
		mu 0 4 189 183 193 199
		f 4 376 -340 377 -362
		mu 0 4 192 200 201 197
		f 4 378 -376 -372 -378
		mu 0 4 201 199 193 197
		f 4 379 -375 -379 -339
		mu 0 4 202 198 199 201
		f 4 380 381 382 383
		mu 0 4 203 213 212 211
		f 4 384 385 386 387
		mu 0 4 208 207 205 209
		f 4 -343 388 -385 389
		mu 0 4 191 181 207 208
		f 4 390 -360 -390 391
		mu 0 4 206 179 191 208
		f 4 392 -392 -388 393
		mu 0 4 204 206 208 209
		f 4 -387 394 -383 395
		mu 0 4 209 205 211 212
		f 4 396 -394 -396 397
		mu 0 4 210 204 209 212
		f 4 398 399 -398 -382
		mu 0 4 213 177 210 212
		f 4 400 401 402 403
		mu 0 4 217 214 219 218
		f 4 -386 404 405 406
		mu 0 4 205 207 216 215
		f 4 -389 -373 407 -405
		mu 0 4 207 181 198 216
		f 4 -338 408 -404 409
		mu 0 4 202 180 217 218
		f 4 -380 -410 410 -408
		mu 0 4 198 202 218 216
		f 4 411 -406 -411 -403
		mu 0 4 219 215 216 218
		f 4 412 -384 413 414
		mu 0 4 220 203 211 221
		f 4 -395 -407 415 -414
		mu 0 4 211 205 215 221
		f 4 -402 416 -335 417
		mu 0 4 219 214 222 223
		f 4 -416 -412 -418 418
		mu 0 4 221 215 219 223
		f 4 419 -415 -419 -334
		mu 0 4 224 220 221 223
		f 4 420 421 422 423
		mu 0 4 242 225 244 243
		f 4 424 425 426 427
		mu 0 4 226 233 232 231
		f 4 428 429 430 431
		mu 0 4 229 228 227 230
		f 4 -293 432 -429 433
		mu 0 4 164 157 228 229
		f 4 -369 -308 -434 434
		mu 0 4 195 90 164 229
		f 4 -361 -435 -432 435
		mu 0 4 192 195 229 230
		f 4 -431 436 -427 437
		mu 0 4 230 227 231 232
		f 4 -377 -436 -438 438
		mu 0 4 200 192 230 232
		f 4 439 -337 -439 -426
		mu 0 4 233 180 200 232
		f 4 440 441 442 443
		mu 0 4 237 234 239 238
		f 4 444 -430 445 446
		mu 0 4 235 227 228 236
		f 4 -433 -321 447 -446
		mu 0 4 228 157 171 236
		f 4 448 -444 449 -6
		mu 0 4 2 237 238 175
		f 4 450 -448 -328 -450
		mu 0 4 238 236 171 175
		f 4 451 -447 -451 -443
		mu 0 4 239 235 236 238
		f 4 452 -428 453 454
		mu 0 4 240 226 231 241
		f 4 -437 -445 455 -454
		mu 0 4 231 227 235 241
		f 4 456 -424 457 -442
		mu 0 4 234 242 243 239
		f 4 458 -456 -452 -458
		mu 0 4 243 241 235 239
		f 4 459 -455 -459 -423
		mu 0 4 244 240 241 243
		f 4 460 461 462 463
		mu 0 4 245 252 251 250
		f 4 464 465 466 467
		mu 0 4 248 247 246 249
		f 4 -425 468 -465 469
		mu 0 4 233 226 247 248
		f 4 -409 -440 -470 470
		mu 0 4 217 180 233 248
		f 4 -401 -471 -468 471
		mu 0 4 214 217 248 249
		f 4 -467 472 -463 473
		mu 0 4 249 246 250 251
		f 4 -417 -472 -474 474
		mu 0 4 222 214 249 251
		f 4 475 -336 -475 -462
		mu 0 4 252 178 222 251
		f 4 476 477 478 479
		mu 0 4 256 253 258 257
		f 4 480 -466 481 482
		mu 0 4 254 246 247 255
		f 4 -469 -453 483 -482
		mu 0 4 247 226 240 255
		f 4 484 -480 485 -422
		mu 0 4 225 256 257 244
		f 4 486 -484 -460 -486
		mu 0 4 257 255 240 244
		f 4 487 -483 -487 -479
		mu 0 4 258 254 255 257
		f 4 488 -464 489 490
		mu 0 4 259 245 250 260
		f 4 -473 -481 491 -490
		mu 0 4 250 246 254 260
		f 4 492 -332 493 -478
		mu 0 4 253 261 262 258
		f 4 494 -492 -488 -494
		mu 0 4 262 260 254 258
		f 4 495 -491 -495 -331
		mu 0 4 263 259 260 262
		f 4 -38 496 497 498
		mu 0 4 343 344 305 304
		f 4 499 500 501 502
		mu 0 4 285 265 287 286
		f 4 503 504 505 506
		mu 0 4 275 274 266 276
		f 4 507 508 509 510
		mu 0 4 271 270 268 272
		f 4 -381 511 -508 512
		mu 0 4 213 203 270 271
		f 4 513 -399 -513 514
		mu 0 4 269 177 213 271
		f 4 515 -515 -511 516
		mu 0 4 267 269 271 272
		f 4 -510 517 -504 518
		mu 0 4 272 268 274 275
		f 4 519 -517 -519 520
		mu 0 4 273 267 272 275
		f 4 521 -521 -507 522
		mu 0 4 264 273 275 276
		f 4 523 524 525 526
		mu 0 4 280 277 282 281
		f 4 527 528 -509 529
		mu 0 4 279 278 268 270
		f 4 -413 530 -530 -512
		mu 0 4 203 220 279 270
		f 4 -333 531 -527 532
		mu 0 4 224 178 280 281
		f 4 -420 -533 533 -531
		mu 0 4 220 224 281 279
		f 4 534 -528 -534 -526
		mu 0 4 282 278 279 281
		f 4 535 -505 536 537
		mu 0 4 283 266 274 284
		f 4 -518 -529 538 -537
		mu 0 4 274 268 278 284
		f 4 539 -503 540 -525
		mu 0 4 277 285 286 282
		f 4 541 -539 -535 -541
		mu 0 4 286 284 278 282
		f 4 542 -538 -542 -502
		mu 0 4 287 283 284 286
		f 4 -25 543 544 545
		mu 0 4 345 346 296 295
		f 4 546 547 548 549
		mu 0 4 292 291 289 293
		f 4 -506 550 -547 551
		mu 0 4 276 266 291 292
		f 4 552 -523 -552 553
		mu 0 4 290 264 276 292
		f 4 554 -554 -550 555
		mu 0 4 288 290 292 293
		f 4 -549 556 -545 557
		mu 0 4 293 289 295 296
		f 4 558 -556 -558 559
		mu 0 4 294 288 293 296
		f 4 -29 560 -560 -544
		mu 0 4 346 347 294 296
		f 4 561 562 563 564
		mu 0 4 300 297 302 301
		f 4 -548 565 566 567
		mu 0 4 289 291 299 298
		f 4 -551 -536 568 -566
		mu 0 4 291 266 283 299
		f 4 -501 569 -565 570
		mu 0 4 287 265 300 301
		f 4 -543 -571 571 -569
		mu 0 4 283 287 301 299
		f 4 572 -567 -572 -564
		mu 0 4 302 298 299 301
		f 4 -42 -546 573 574
		mu 0 4 348 345 295 303
		f 4 -557 -568 575 -574
		mu 0 4 295 289 298 303
		f 4 -563 576 -498 577
		mu 0 4 302 297 304 305
		f 4 -576 -573 -578 578
		mu 0 4 303 298 302 305
		f 4 -45 -575 -579 -497
		mu 0 4 344 348 303 305
		f 4 579 580 581 582
		mu 0 4 323 306 325 324
		f 4 583 584 585 586
		mu 0 4 307 314 313 312
		f 4 587 588 589 590
		mu 0 4 310 309 308 311
		f 4 -461 591 -588 592
		mu 0 4 252 245 309 310
		f 4 -532 -476 -593 593
		mu 0 4 280 178 252 310
		f 4 -524 -594 -591 594
		mu 0 4 277 280 310 311
		f 4 -590 595 -586 596
		mu 0 4 311 308 312 313
		f 4 -540 -595 -597 597
		mu 0 4 285 277 311 313
		f 4 598 -500 -598 -585
		mu 0 4 314 265 285 313
		f 4 599 600 601 602
		mu 0 4 318 315 320 319
		f 4 603 -589 604 605
		mu 0 4 316 308 309 317
		f 4 -592 -489 606 -605
		mu 0 4 309 245 259 317
		f 4 607 -603 608 -330
		mu 0 4 176 318 319 263
		f 4 609 -607 -496 -609
		mu 0 4 319 317 259 263
		f 4 610 -606 -610 -602
		mu 0 4 320 316 317 319
		f 4 611 -587 612 613
		mu 0 4 321 307 312 322
		f 4 -596 -604 614 -613
		mu 0 4 312 308 316 322
		f 4 615 -583 616 -601
		mu 0 4 315 323 324 320
		f 4 617 -615 -611 -617
		mu 0 4 324 322 316 320
		f 4 618 -614 -618 -582
		mu 0 4 325 321 322 324
		f 4 -103 619 620 621
		mu 0 4 349 350 331 330
		f 4 622 623 624 625
		mu 0 4 328 327 326 329
		f 4 -584 626 -623 627
		mu 0 4 314 307 327 328
		f 4 -570 -599 -628 628
		mu 0 4 300 265 314 328
		f 4 -562 -629 -626 629
		mu 0 4 297 300 328 329
		f 4 -625 630 -621 631
		mu 0 4 329 326 330 331
		f 4 -577 -630 -632 632
		mu 0 4 304 297 329 331
		f 4 -107 -499 -633 -620
		mu 0 4 350 343 304 331
		f 4 633 634 635 636
		mu 0 4 335 332 337 336
		f 4 637 -624 638 639
		mu 0 4 333 326 327 334
		f 4 -627 -612 640 -639
		mu 0 4 327 307 321 334
		f 4 641 -637 642 -581
		mu 0 4 306 335 336 325
		f 4 643 -641 -619 -643
		mu 0 4 336 334 321 325
		f 4 644 -640 -644 -636
		mu 0 4 337 333 334 336
		f 4 -116 -622 645 646
		mu 0 4 351 349 330 338
		f 4 -631 -638 647 -646
		mu 0 4 330 326 333 338
		f 4 648 -4 649 -635
		mu 0 4 332 339 340 337
		f 4 650 -648 -645 -650
		mu 0 4 340 338 333 337
		f 4 -119 -647 -651 -3
		mu 0 4 64 351 338 340;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "nRigid1";
	rename -uid "4B2DA1E9-4E50-2BD8-E068-E0802002A152";
createNode nRigid -n "nRigidShape1" -p "nRigid1";
	rename -uid "91E18303-4060-D050-38A2-67AB6490B474";
	setAttr -k off ".v";
	setAttr ".gf" -type "Int32Array" 0 ;
	setAttr ".pos0" -type "vectorArray" 0 ;
	setAttr ".vel0" -type "vectorArray" 0 ;
	setAttr ".acc0" -type "vectorArray" 0 ;
	setAttr ".mas0" -type "doubleArray" 0 ;
	setAttr ".id0" -type "doubleArray" 0 ;
	setAttr ".nid" 341;
	setAttr ".bt0" -type "doubleArray" 0 ;
	setAttr ".ag0" -type "doubleArray" 0 ;
	setAttr -k off ".dve";
	setAttr -k off ".lfm";
	setAttr -k off ".lfr";
	setAttr -k off ".ead";
	setAttr ".irbx" -type "string" "";
	setAttr ".irax" -type "string" "";
	setAttr ".icx" -type "string" "";
	setAttr -k off ".dw";
	setAttr -k off ".fiw";
	setAttr -k off ".con";
	setAttr -k off ".eiw";
	setAttr -k off ".mxc";
	setAttr -k off ".lod";
	setAttr -k off ".inh";
	setAttr ".cts" 1;
	setAttr -k off ".stf";
	setAttr -k off ".igs";
	setAttr -k off ".ecfh";
	setAttr -k off ".tgs";
	setAttr -k off ".gsm";
	setAttr -k off ".chd";
	setAttr -k off ".trd";
	setAttr -k off ".prt";
	setAttr ".actv" no;
	setAttr ".cold" no;
	setAttr ".scld" no;
	setAttr -s 2 ".fsc[0:1]"  0 1 1 1 0 1;
	setAttr -s 2 ".pfdo[0:1]"  0 1 1 1 0 1;
createNode transform -n "dynamicConstraint1";
	rename -uid "50FF8370-4F1B-7505-58D1-6AB770BD127D";
createNode dynamicConstraint -n "dynamicConstraintShape1" -p "dynamicConstraint1";
	rename -uid "722A62D1-4608-699A-E800-9CBD72F576A3";
	setAttr -k off ".v";
	setAttr -s 2 ".cid";
	setAttr ".cdnr[0]"  0 1 1;
	setAttr ".sdp[0]"  0 1 1;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "6D0928CB-4DDF-3397-9765-F28089233A4F";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "9EF41120-42BB-8A44-5A43-F89F7A957E07";
createNode displayLayer -n "defaultLayer";
	rename -uid "47598A7F-4076-9A26-4738-16A1F08E3130";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "CA93DFB8-4F23-AF09-EED6-F1B28CD8FBBC";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "50669F66-46C9-894E-CDC6-858734AB76F8";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5F96966C-48A2-AE39-3811-DC8B33C3CBE4";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 100 -ast 1 -aet 100 ";
	setAttr ".st" 6;
createNode objectSet -n "moduleControlSet";
	rename -uid "86848271-443B-CB76-8AA6-2DB6CA556FFB";
	setAttr ".ihi" 0;
createNode objectSet -n "sets";
	rename -uid "A46F51A1-4817-F3B2-E213-B1A26CD977FD";
	setAttr ".ihi" 0;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "CEA19007-4C60-200E-EBF3-7CACE94F5CD4";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 1 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "E740EF97-4FC7-C34B-34B4-DE87C346250D";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "445D3C49-473F-543B-B586-14B1F92DD0B0";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "EA92ED5F-44E1-A7DA-F048-B5851E9A5947";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "DC38D912-4802-0F62-8A03-348675A31560";
createNode multDoubleLinear -n "multDoubleLinear438";
	rename -uid "D2CF903C-44ED-EAA3-F647-DA82950DBCD6";
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "E9E2FC7A-42D5-3755-0047-00949494F5E1";
createNode multiplyDivide -n "multiplyDivide353";
	rename -uid "B610B866-442F-7B27-48E7-D3BC95C26002";
	setAttr ".i2" -type "float3" -1 1 1 ;
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "F879C180-4593-6729-3760-9D8DDF2DBEE8";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide1";
	rename -uid "CD9F6E4E-41EF-73BC-D21D-9B80E4060DBF";
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "3CC6C5C1-4035-6A9B-B418-1E9654DF290A";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode makeNurbSphere -n "top_1_makeNurbSphere1";
	rename -uid "00E065F8-4EEA-C213-CB2A-649532F5DBF0";
createNode makeNurbSphere -n "top_2_makeNurbSphere1";
	rename -uid "39ED829B-475F-8CF4-7531-52A65DBF4CD5";
createNode makeNurbSphere -n "top_3_makeNurbSphere1";
	rename -uid "523ABC76-4BEE-0494-6ABF-368D99139A22";
createNode makeNurbSphere -n "top_4_makeNurbSphere1";
	rename -uid "F09C84E4-47A0-A697-EDB7-3998750E8072";
createNode makeNurbSphere -n "top_5_makeNurbSphere1";
	rename -uid "978D06E2-46DE-44CA-ECE4-CD866F7495A8";
createNode makeNurbSphere -n "top_6_makeNurbSphere1";
	rename -uid "30D51F66-40A9-F386-A3A9-D88292D721AE";
createNode makeNurbSphere -n "top_7_makeNurbSphere1";
	rename -uid "73C3413F-4C8B-253F-0AB2-D795759E02C7";
createNode makeNurbSphere -n "bot_1_makeNurbSphere1";
	rename -uid "349C7041-4D4F-E330-80CD-68BB490F78B7";
createNode makeNurbSphere -n "bot_2_makeNurbSphere1";
	rename -uid "A172BEDA-4524-0D17-BFD4-C981ACA3144E";
createNode makeNurbSphere -n "bot_3_makeNurbSphere1";
	rename -uid "7C1EF515-4955-3643-F2DB-F788ADCE3962";
createNode makeNurbSphere -n "bot_4_makeNurbSphere1";
	rename -uid "FADE7BC0-428E-A5F1-137B-69928F843000";
createNode makeNurbSphere -n "bot_5_makeNurbSphere1";
	rename -uid "257F98EC-4AC4-5668-09DB-63A798B5F423";
createNode makeNurbSphere -n "bot_6_makeNurbSphere1";
	rename -uid "7525077F-485A-1D23-3F0A-299E7F757156";
createNode makeNurbSphere -n "bot_7_makeNurbSphere1";
	rename -uid "E0E86393-4BB4-2F0D-B6C1-57815054800F";
createNode multiplyDivide -n "size_multiplyDivide2";
	rename -uid "A4092D8B-4A9F-8F3A-04AD-13B33F53E54E";
createNode multiplyDivide -n "size_multiplyDivide3";
	rename -uid "09C7C9E7-4955-1ECB-53DE-17A9774A31B7";
createNode multiplyDivide -n "size_multiplyDivide4";
	rename -uid "5592A6EE-4AFA-D048-20F5-3FAFDA9B9BCE";
createNode multiplyDivide -n "size_multiplyDivide5";
	rename -uid "42BA1696-4501-7E7E-18A7-7FBA3308C589";
createNode multiplyDivide -n "size_multiplyDivide6";
	rename -uid "E66CC418-44A7-CB0D-F530-4FB6BB664414";
	setAttr ".i2" -type "float3" 0.2 0.2 0.5 ;
createNode groupId -n "mainPoser_1_cluster4GroupId";
	rename -uid "61E8B1A2-4D84-53C6-63D0-0FA0984BC5DA";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_1_cluster4Set";
	rename -uid "95DDACB9-401D-435E-D797-8DB3F61AA313";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "f_mainPoser_clusterHandleCluster";
	rename -uid "7BA79019-4D00-2410-B14F-47A0CA53A22B";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_1_cluster4GroupParts";
	rename -uid "8DCEA525-4C48-3A50-C2A1-E488386D137E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_1_tweak24";
	rename -uid "C80A64CD-404E-71FE-38DA-37B39B333C5A";
createNode objectSet -n "mainPoser_1_tweakSet24";
	rename -uid "9FA7A62C-4AF6-E965-DCC1-5D843AAA7216";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_1_groupId42";
	rename -uid "2A5B4D14-42A6-32C4-6E14-5B837705E398";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_1_groupParts42";
	rename -uid "A29B6CA4-4221-1B69-37AB-D5A976338C2B";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_1_mainPoser_size_multiplyDivide";
	rename -uid "9393201B-43D1-54F6-1070-1FA436D96158";
createNode groupId -n "mainPoser_2_cluster4GroupId";
	rename -uid "93221D20-40CE-C874-6AC9-BA80BB92AB14";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_2_cluster4Set";
	rename -uid "28B1143E-4376-5F92-64CB-979304218AF3";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_2_mainPoser_clusterHandleCluster";
	rename -uid "6BAC1926-44AA-FD26-C86F-218636FEE1C8";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_2_cluster4GroupParts";
	rename -uid "BA60A746-4441-5690-DFC1-E683D659E250";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_2_tweak24";
	rename -uid "17FB94F2-4982-D24D-0B7D-A3A63B0FEB2B";
createNode objectSet -n "mainPoser_2_tweakSet24";
	rename -uid "65109C7C-4F69-7F57-F8B7-F7B1B3061BC8";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_2_groupId42";
	rename -uid "079A2073-4961-24F2-CA9B-54979E2043A7";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_2_groupParts42";
	rename -uid "80E00325-4FC2-7C2F-A074-388781EA1F39";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_2_mainPoser_size_multiplyDivide";
	rename -uid "30E4E691-47B8-A9F1-DFF4-96983A3BFD37";
createNode groupId -n "mainPoser_3_cluster4GroupId";
	rename -uid "085AA8C3-4976-A8FB-175D-3E99124DD97C";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_3_cluster4Set";
	rename -uid "6FD6594F-4ED5-A976-3B12-CDAA1D475186";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_3_mainPoser_clusterHandleCluster";
	rename -uid "A9329725-4272-82D2-174D-E6B72BD5CFD2";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_3_cluster4GroupParts";
	rename -uid "F8A10CFD-4A17-9AFF-149C-0E8B88A4A714";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_3_tweak24";
	rename -uid "EA38E99D-4108-307D-670F-8B8B7D6F9471";
createNode objectSet -n "mainPoser_3_tweakSet24";
	rename -uid "510B9ECD-471D-7823-5CE5-D6842ABE303B";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_3_groupId42";
	rename -uid "E8310D83-4EC9-C0BC-4ACC-AD877B12248A";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_3_groupParts42";
	rename -uid "297C307C-4649-131F-80F4-51962A59D70F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_3_mainPoser_size_multiplyDivide";
	rename -uid "4A9B8B8A-4A6D-B6ED-DFCA-38AF93705C77";
createNode groupId -n "mainPoser_4_cluster4GroupId";
	rename -uid "D0677A93-4387-5441-0F7E-1389B308E663";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_4_cluster4Set";
	rename -uid "AA093E94-4AD0-8FD6-87C4-E3A4FD8D8819";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_4_mainPoser_clusterHandleCluster";
	rename -uid "FC1C9FC7-4AD9-1159-3F57-EAAACE98D9EC";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_4_cluster4GroupParts";
	rename -uid "985DB357-4BCC-1E06-3244-F8B6A54977C1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_4_tweak24";
	rename -uid "C8C11CF7-4EE5-57F6-0CD6-A6B6A6845332";
createNode objectSet -n "mainPoser_4_tweakSet24";
	rename -uid "81A753EC-451F-6556-7C82-04AEDB875C41";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_4_groupId42";
	rename -uid "F74A657A-431C-74FB-C55F-E38E29808453";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_4_groupParts42";
	rename -uid "7FD9EF1F-4929-0E30-FC49-D39F0FB4FBDA";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_4_mainPoser_size_multiplyDivide";
	rename -uid "689BA3E7-40BF-DA3A-29AF-C1ABDF083684";
createNode groupId -n "mainPoser_5_cluster4GroupId";
	rename -uid "9D1B5DA4-4EB6-8357-12E0-7794971FBFA7";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_5_cluster4Set";
	rename -uid "5A581D48-4B86-494E-ECB7-26B8D317832F";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_5_mainPoser_clusterHandleCluster";
	rename -uid "6249C057-4FCD-9E5C-A2FB-3E80FE1884AA";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_5_cluster4GroupParts";
	rename -uid "BCBD1ABA-457F-1CB8-B818-44A5B830CC3A";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_5_tweak24";
	rename -uid "68FAF56F-48A5-195D-DB8A-0E810C5F8C6B";
createNode objectSet -n "mainPoser_5_tweakSet24";
	rename -uid "3266DC5C-4793-AE11-20D9-5FB8FE4C1A00";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_5_groupId42";
	rename -uid "0E18C1DE-4CF7-E554-7660-54915A364C14";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_5_groupParts42";
	rename -uid "6AB17F76-4787-2FF6-7B7C-52BE1E0047E4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_5_mainPoser_size_multiplyDivide";
	rename -uid "C3C6609F-48F4-0DF0-96B8-FFB16BF87EFF";
createNode groupId -n "mainPoser_6_cluster4GroupId";
	rename -uid "CFDA0DAA-4FD5-BCC0-6208-9FAF9C1E609F";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_6_cluster4Set";
	rename -uid "B5533D1D-4B51-09AA-DF2D-89AFCD9EAC3F";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_1_mainPoser_clusterHandleCluster";
	rename -uid "6311A45B-4C82-17C7-330A-34ACED6E3A9E";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_6_cluster4GroupParts";
	rename -uid "A54E13F1-4B9C-1A2D-49A8-4C9ACE69BA9C";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_6_tweak24";
	rename -uid "9FD0AE02-44A2-47C8-47BB-A8A94520859E";
createNode objectSet -n "mainPoser_6_tweakSet24";
	rename -uid "EA3B42CC-41BF-236C-4CA1-96BE3ECD3C00";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_6_groupId42";
	rename -uid "83EDCDFA-4B93-2189-CC72-02BF89F1B34E";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_6_groupParts42";
	rename -uid "CC49FD5D-4EB5-D7FB-4EE6-E3A8DAA8DD37";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_6_mainPoser_size_multiplyDivide";
	rename -uid "0FE0718E-4C1E-3B3D-2C30-3894C2AE77EC";
createNode groupId -n "mainPoser_7_cluster4GroupId";
	rename -uid "445D190A-4272-8EE2-258D-8CA6473FCED3";
	setAttr ".ihi" 0;
createNode objectSet -n "mainPoser_7_cluster4Set";
	rename -uid "9CAD5946-4355-B4F5-9BE6-F7BBDA7E08F5";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "b_mainPoser_clusterHandleCluster";
	rename -uid "1BC67386-4C95-6948-A491-4A8DB4A18B15";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mainPoser_7_cluster4GroupParts";
	rename -uid "C4AC5258-423D-890F-6229-6EA174CD7B92";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mainPoser_7_tweak24";
	rename -uid "FA2C9541-43CB-E230-6796-1CABCF04AEB3";
createNode objectSet -n "mainPoser_7_tweakSet24";
	rename -uid "DBE9A1ED-4586-1635-D6FC-6D95CB34295B";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mainPoser_7_groupId42";
	rename -uid "F9447D55-4114-7A55-2BCC-BFB723BB34EA";
	setAttr ".ihi" 0;
createNode groupParts -n "mainPoser_7_groupParts42";
	rename -uid "9F97236B-4F41-4367-739F-2696B95D55EA";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mainPoser_7_mainPoser_size_multiplyDivide";
	rename -uid "0DCBFE23-434E-A2AA-6C88-67877F9AD8BE";
createNode multMatrix -n "multMatrix2";
	rename -uid "1F446FB7-4F14-A995-E25A-E3845A198C93";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix3";
	rename -uid "4EFB2937-4CA4-E0D7-DFE0-0C83B37222B6";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix4";
	rename -uid "C3A2DD05-4B3D-AFCE-F6AD-238A0EEE590E";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix5";
	rename -uid "5B663966-4D49-12E9-153B-9680EB742619";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix6";
	rename -uid "7A3AE6F9-472F-0D70-24D0-C6B0D33165EA";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix7";
	rename -uid "1607B65E-4E8F-C7E1-9188-50B243C79A24";
	setAttr -s 2 ".i";
createNode makeNurbSphere -n "f_1_3_makeNurbSphere1";
	rename -uid "B1C1E790-4994-D421-DA03-829EB555404B";
createNode makeNurbSphere -n "f_1_4_makeNurbSphere1";
	rename -uid "BDC4A769-49BE-D61C-06D3-A0BEB320F701";
createNode makeNurbSphere -n "f_2_3_makeNurbSphere1";
	rename -uid "702ECBFE-47CD-B663-DD34-88A696AA9E09";
createNode makeNurbSphere -n "f_2_4_makeNurbSphere1";
	rename -uid "F2992890-485B-EE24-9B09-B388729A6698";
createNode makeNurbSphere -n "f_3_3_makeNurbSphere1";
	rename -uid "2CF2BBBF-4AF9-8650-A408-6E909B23F46D";
createNode makeNurbSphere -n "f_3_4_makeNurbSphere1";
	rename -uid "5DD22128-4519-9D2B-6002-4DBD2AA1B1F8";
createNode makeNurbSphere -n "edge_4_3_makeNurbSphere1";
	rename -uid "5DFDCED6-40C2-7ED1-2B75-64ABF39C9823";
createNode makeNurbSphere -n "edge_4_4_makeNurbSphere1";
	rename -uid "CBA54C75-42BA-9F93-78D0-2BADDC5119C9";
createNode makeNurbSphere -n "edge_5_3_makeNurbSphere1";
	rename -uid "BA959097-4815-1421-4C71-CFA685FBDA81";
createNode makeNurbSphere -n "edge_5_4_makeNurbSphere1";
	rename -uid "2F93CAD4-4755-F516-B7C2-C6A03CC5C767";
createNode makeNurbSphere -n "edge_6_3_makeNurbSphere1";
	rename -uid "48BD0188-42FE-6FA0-165F-77AC179F67A5";
createNode makeNurbSphere -n "edge_6_4_makeNurbSphere1";
	rename -uid "A9C8A142-462C-9F5D-0035-609F68C18CAB";
createNode makeNurbSphere -n "edge_7_3_makeNurbSphere1";
	rename -uid "5CD180D6-41DD-2B5D-AC1A-A087F94E0C51";
createNode makeNurbSphere -n "edge_7_4_makeNurbSphere1";
	rename -uid "9929BC99-4E35-8FB1-AA83-4FB45FD00586";
createNode multMatrix -n "multMatrix16";
	rename -uid "59A5B4E8-43CF-9A0D-977F-F3826F01C982";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix17";
	rename -uid "EF3011F2-455B-105D-DC22-81B2367E882E";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix1";
	rename -uid "68CFC642-413F-AA13-1774-D1885B72B9E3";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix18";
	rename -uid "4628FE0E-4042-B802-4677-F9AFFD00E64E";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix19";
	rename -uid "A3119BC6-4042-ADC6-DC45-09A607CFD39F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix20";
	rename -uid "8FB076B6-4667-FF5F-C327-9887059D4C8B";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix21";
	rename -uid "7095D8A6-435F-5793-3810-7D88BA38175F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix22";
	rename -uid "825533D6-437A-4DF4-0876-038BC7D0199F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix23";
	rename -uid "BDEEE68C-4E9E-D5D0-DACB-AFA8BC14F2ED";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix24";
	rename -uid "326E6371-4972-D484-466C-A8BF6B241DF9";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix25";
	rename -uid "90D69B71-426E-0263-E8CB-D4B2C2FB7DB3";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix26";
	rename -uid "8F5514C0-4355-E7AD-4713-F49F7B3197A1";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix27";
	rename -uid "6CC77596-4C74-6C4C-97E8-4EAF3DE7D130";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix28";
	rename -uid "156ED837-49AF-8E6E-671B-DAB66914E305";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix29";
	rename -uid "50D08804-4E2A-CE1A-D8A4-048600B77924";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix30";
	rename -uid "F8503092-4425-C064-FBBD-808874BC0D44";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix15";
	rename -uid "6C241314-4036-D0BB-3039-0D969F9143B8";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix31";
	rename -uid "E6A31A44-4319-3664-1D58-24A1F1592F4D";
createNode multMatrix -n "multMatrix32";
	rename -uid "A8BCEF12-4F44-5725-631B-AF86F13E9CFC";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix33";
	rename -uid "A35BA0CA-4D86-0EA9-3E81-D0829B9A0E0E";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix34";
	rename -uid "9734AF86-487A-C31F-D7FF-D6A28B722FE1";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix35";
	rename -uid "5E413262-473F-592A-F332-F19286E2C0F8";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix36";
	rename -uid "74F62F63-4ECA-E0CA-A46C-1684C01D390F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix37";
	rename -uid "3888589E-43EA-8B2F-120E-93A2BD83EBD3";
	setAttr -s 2 ".i";
createNode multiplyDivide -n "multiplyDivide354";
	rename -uid "C9229FBF-4EB8-AFBE-73BA-AAB4A2115E3D";
	setAttr ".i2" -type "float3" 0.333 0.66600001 1 ;
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "3900AE2A-4DFF-C730-C175-548E3409695A";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "multiplyDivide355";
	rename -uid "D38FE051-4646-5D63-92D0-7E88940FDD16";
	setAttr ".i2" -type "float3" -0.333 -0.66600001 1 ;
createNode plusMinusAverage -n "plusMinusAverage2";
	rename -uid "2D7C3A57-4B3B-D86D-CB67-96AD5628D255";
	setAttr -s 2 ".i3[1]" -type "float3"  0 0 0;
	setAttr -s 2 ".i3";
createNode unitConversion -n "unitConversion1";
	rename -uid "FEAC2C49-4A0D-BA9F-8574-DBBA5C17D046";
	setAttr ".cf" -0.1;
createNode nurbsTessellate -n "nurbsTessellate1";
	rename -uid "D525E905-46EB-B4F2-3CD8-23A9792AB809";
	setAttr ".f" 2;
	setAttr ".pt" 1;
	setAttr ".chr" 0.1;
	setAttr ".ut" 1;
	setAttr ".un" 11;
	setAttr ".vt" 1;
	setAttr ".vn" 32;
	setAttr ".ucr" no;
	setAttr ".cht" 0.2;
	setAttr ".mnd" yes;
	setAttr ".ntr" no;
createNode multDoubleLinear -n "multDoubleLinear439";
	rename -uid "860F25BE-493A-C666-D3F3-46BF69D2A49B";
	setAttr ".i2" 0.1;
createNode blendShape -n "blendShape1";
	rename -uid "5F0290A2-4779-6E11-C758-6BA3C9A07AEE";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 2 ".w";
	setAttr -s 2 ".w";
	setAttr -s 2 ".it[0].itg";
	setAttr ".mlid" 0;
	setAttr ".mlpr" 0;
	setAttr -s 2 ".pndr[0:1]"  0 0;
	setAttr ".tgdt[0].cid" -type "Int32Array" 2 0 1 ;
	setAttr ".aal" -type "attributeAlias" {"poly","weight[0]","poly_cloth","weight[1]"
		} ;
createNode reverse -n "reverse1";
	rename -uid "49771DF2-4FE1-E87C-5A0F-8FBB268C8D7A";
createNode multDoubleLinear -n "multDoubleLinear440";
	rename -uid "672724EA-4EDD-CCFF-CE40-60A2DD3EDABD";
createNode nComponent -n "nComponent1";
	rename -uid "D836B564-418A-F9D5-EDDA-F3ADB09CB9B3";
	setAttr ".ct" 6;
	setAttr ".el" 2;
createNode nComponent -n "nComponent2";
	rename -uid "0DABE782-4B8A-35EE-E350-E998B6CAB4B2";
	setAttr ".ct" 2;
	setAttr -s 31 ".ci[0:30]"  1 2 4 52 61 68 
		79 82 87 137 146 149 154 165 168 173 176 225 
		234 237 242 253 256 261 306 315 318 323 332 335 
		339;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "D441D9F6-4454-31FC-B50B-22B84EBC01F4";
	setAttr -s 5 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1023.5697718673925 -1842.8570696285826 ;
	setAttr ".tgi[0].vh" -type "double2" 441.42693785681303 -602.38092844448499 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -25.714284896850586;
	setAttr ".tgi[0].ni[0].y" -885.71429443359375;
	setAttr ".tgi[0].ni[0].nvs" 18305;
	setAttr ".tgi[0].ni[1].x" -332.85714721679688;
	setAttr ".tgi[0].ni[1].y" -877.865234375;
	setAttr ".tgi[0].ni[1].nvs" 18305;
	setAttr ".tgi[0].ni[2].x" -620.93804931640625;
	setAttr ".tgi[0].ni[2].y" -779.64971923828125;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" -618.6954345703125;
	setAttr ".tgi[0].ni[3].y" -1021.23974609375;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -1139.2856690145693 -3608.6479135291343 ;
	setAttr ".tgi[1].vh" -type "double2" 1792.857071615404 -1125.8757078616093 ;
	setAttr -s 27 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 295.71429443359375;
	setAttr ".tgi[1].ni[0].y" -2425.71435546875;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 295.71429443359375;
	setAttr ".tgi[1].ni[1].y" -1464.2857666015625;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" -18.019138336181641;
	setAttr ".tgi[1].ni[2].y" -2167.081787109375;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" -18.019138336181641;
	setAttr ".tgi[1].ni[3].y" -2037.081787109375;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" -530.26312255859375;
	setAttr ".tgi[1].ni[4].y" -2332.673828125;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 295.71429443359375;
	setAttr ".tgi[1].ni[5].y" -2295.71435546875;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" -595.37640380859375;
	setAttr ".tgi[1].ni[6].y" -1892.8311767578125;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" -318.57144165039062;
	setAttr ".tgi[1].ni[7].y" -1410;
	setAttr ".tgi[1].ni[7].nvs" 18305;
	setAttr ".tgi[1].ni[8].x" 2.0065414905548096;
	setAttr ".tgi[1].ni[8].y" -2533.604736328125;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" -313.09933471679688;
	setAttr ".tgi[1].ni[9].y" -2549.77587890625;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[1].ni[10].x" 2.0065414905548096;
	setAttr ".tgi[1].ni[10].y" -2273.604736328125;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" 310.05697631835938;
	setAttr ".tgi[1].ni[11].y" -1874.638427734375;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" -303.53753662109375;
	setAttr ".tgi[1].ni[12].y" -1920.0947265625;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" -313.09933471679688;
	setAttr ".tgi[1].ni[13].y" -2289.77587890625;
	setAttr ".tgi[1].ni[13].nvs" 18304;
	setAttr ".tgi[1].ni[14].x" -313.09933471679688;
	setAttr ".tgi[1].ni[14].y" -2159.77587890625;
	setAttr ".tgi[1].ni[14].nvs" 18304;
	setAttr ".tgi[1].ni[15].x" -507.55386352539062;
	setAttr ".tgi[1].ni[15].y" -2581.280517578125;
	setAttr ".tgi[1].ni[15].nvs" 18304;
	setAttr ".tgi[1].ni[16].x" -574.4864501953125;
	setAttr ".tgi[1].ni[16].y" -2177.294677734375;
	setAttr ".tgi[1].ni[16].nvs" 18304;
	setAttr ".tgi[1].ni[17].x" -487.23507690429688;
	setAttr ".tgi[1].ni[17].y" -2464.1484375;
	setAttr ".tgi[1].ni[17].nvs" 18304;
	setAttr ".tgi[1].ni[18].x" 295.71429443359375;
	setAttr ".tgi[1].ni[18].y" -2555.71435546875;
	setAttr ".tgi[1].ni[18].nvs" 18304;
	setAttr ".tgi[1].ni[19].x" -313.09933471679688;
	setAttr ".tgi[1].ni[19].y" -2029.77587890625;
	setAttr ".tgi[1].ni[19].nvs" 18304;
	setAttr ".tgi[1].ni[20].x" -24.958061218261719;
	setAttr ".tgi[1].ni[20].y" -1903.9931640625;
	setAttr ".tgi[1].ni[20].nvs" 18304;
	setAttr ".tgi[1].ni[21].x" 2.0065414905548096;
	setAttr ".tgi[1].ni[21].y" -2403.604736328125;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" -578.0721435546875;
	setAttr ".tgi[1].ni[22].y" -2055.3818359375;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" -313.09933471679688;
	setAttr ".tgi[1].ni[23].y" -2419.77587890625;
	setAttr ".tgi[1].ni[23].nvs" 18304;
	setAttr ".tgi[1].ni[24].x" 295.71429443359375;
	setAttr ".tgi[1].ni[24].y" -2165.71435546875;
	setAttr ".tgi[1].ni[24].nvs" 18304;
	setAttr ".tgi[1].ni[25].x" -318.57144165039062;
	setAttr ".tgi[1].ni[25].y" -1677.142822265625;
	setAttr ".tgi[1].ni[25].nvs" 18305;
	setAttr ".tgi[1].ni[26].x" 295.71429443359375;
	setAttr ".tgi[1].ni[26].y" -2035.7142333984375;
	setAttr ".tgi[1].ni[26].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -1283.5460597484553 -2072.6189652605699 ;
	setAttr ".tgi[2].vh" -type "double2" -185.50150092445864 -1142.8570974440822 ;
	setAttr ".tgi[2].ni[0].x" -845.2100830078125;
	setAttr ".tgi[2].ni[0].y" -1463.9495849609375;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" -968.45234246954249 -1515.4761302565798 ;
	setAttr ".tgi[3].vh" -type "double2" 586.3095005116777 -199.99999205271448 ;
	setAttr -s 9 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 517.47900390625;
	setAttr ".tgi[3].ni[0].y" -780.5882568359375;
	setAttr ".tgi[3].ni[0].nvs" 18305;
	setAttr ".tgi[3].ni[1].x" 103.22510528564453;
	setAttr ".tgi[3].ni[1].y" -381.99551391601562;
	setAttr ".tgi[3].ni[1].nvs" 18304;
	setAttr ".tgi[3].ni[2].x" -5.5656681060791016;
	setAttr ".tgi[3].ni[2].y" -242.64201354980469;
	setAttr ".tgi[3].ni[2].nvs" 18304;
	setAttr ".tgi[3].ni[3].x" -487.14285278320312;
	setAttr ".tgi[3].ni[3].y" -411.09243774414062;
	setAttr ".tgi[3].ni[3].nvs" 18304;
	setAttr ".tgi[3].ni[4].x" 534.28570556640625;
	setAttr ".tgi[3].ni[4].y" -522.85711669921875;
	setAttr ".tgi[3].ni[4].nvs" 18304;
	setAttr ".tgi[3].ni[5].x" -519.43121337890625;
	setAttr ".tgi[3].ni[5].y" -839.63079833984375;
	setAttr ".tgi[3].ni[5].nvs" 18305;
	setAttr ".tgi[3].ni[6].x" -76.638656616210938;
	setAttr ".tgi[3].ni[6].y" -469.49578857421875;
	setAttr ".tgi[3].ni[6].nvs" 18305;
	setAttr ".tgi[3].ni[7].x" -519.07562255859375;
	setAttr ".tgi[3].ni[7].y" -560.420166015625;
	setAttr ".tgi[3].ni[7].nvs" 18305;
	setAttr ".tgi[3].ni[8].x" 223.63885498046875;
	setAttr ".tgi[3].ni[8].y" -760.2763671875;
	setAttr ".tgi[3].ni[8].nvs" 18304;
	setAttr ".tgi[4].tn" -type "string" "Untitled_5";
	setAttr ".tgi[4].vl" -type "double2" 617.26188023412146 -516.07140806459336 ;
	setAttr ".tgi[4].vh" -type "double2" 2170.8332470721707 799.40473013927192 ;
	setAttr -s 27 ".tgi[4].ni";
	setAttr ".tgi[4].ni[0].x" 2368.406982421875;
	setAttr ".tgi[4].ni[0].y" 935.4095458984375;
	setAttr ".tgi[4].ni[0].nvs" 18304;
	setAttr ".tgi[4].ni[1].x" 2651.428466796875;
	setAttr ".tgi[4].ni[1].y" 225.71427917480469;
	setAttr ".tgi[4].ni[1].nvs" 18304;
	setAttr ".tgi[4].ni[2].x" 1852.6956787109375;
	setAttr ".tgi[4].ni[2].y" 574.23016357421875;
	setAttr ".tgi[4].ni[2].nvs" 18305;
	setAttr ".tgi[4].ni[3].x" 2651.428466796875;
	setAttr ".tgi[4].ni[3].y" -164.28572082519531;
	setAttr ".tgi[4].ni[3].nvs" 18304;
	setAttr ".tgi[4].ni[4].x" 1957.4454345703125;
	setAttr ".tgi[4].ni[4].y" -274.48318481445312;
	setAttr ".tgi[4].ni[4].nvs" 18304;
	setAttr ".tgi[4].ni[5].x" 1600.4808349609375;
	setAttr ".tgi[4].ni[5].y" 970.9404296875;
	setAttr ".tgi[4].ni[5].nvs" 18305;
	setAttr ".tgi[4].ni[6].x" 2651.428466796875;
	setAttr ".tgi[4].ni[6].y" 615.71429443359375;
	setAttr ".tgi[4].ni[6].nvs" 18304;
	setAttr ".tgi[4].ni[7].x" 2643.72607421875;
	setAttr ".tgi[4].ni[7].y" 1027.030029296875;
	setAttr ".tgi[4].ni[7].nvs" 18304;
	setAttr ".tgi[4].ni[8].x" 1139.727783203125;
	setAttr ".tgi[4].ni[8].y" 972.53558349609375;
	setAttr ".tgi[4].ni[8].nvs" 18305;
	setAttr ".tgi[4].ni[9].x" 2643.72607421875;
	setAttr ".tgi[4].ni[9].y" 1547.030029296875;
	setAttr ".tgi[4].ni[9].nvs" 18304;
	setAttr ".tgi[4].ni[10].x" 1662.020751953125;
	setAttr ".tgi[4].ni[10].y" -320.8121337890625;
	setAttr ".tgi[4].ni[10].nvs" 18304;
	setAttr ".tgi[4].ni[11].x" 2643.72607421875;
	setAttr ".tgi[4].ni[11].y" 1417.030029296875;
	setAttr ".tgi[4].ni[11].nvs" 18304;
	setAttr ".tgi[4].ni[12].x" 2643.72607421875;
	setAttr ".tgi[4].ni[12].y" 1677.030029296875;
	setAttr ".tgi[4].ni[12].nvs" 18304;
	setAttr ".tgi[4].ni[13].x" 2368.406982421875;
	setAttr ".tgi[4].ni[13].y" 1065.4095458984375;
	setAttr ".tgi[4].ni[13].nvs" 18304;
	setAttr ".tgi[4].ni[14].x" 2651.428466796875;
	setAttr ".tgi[4].ni[14].y" 355.71429443359375;
	setAttr ".tgi[4].ni[14].nvs" 18304;
	setAttr ".tgi[4].ni[15].x" 2135.61865234375;
	setAttr ".tgi[4].ni[15].y" 696.36737060546875;
	setAttr ".tgi[4].ni[15].nvs" 18305;
	setAttr ".tgi[4].ni[16].x" 2643.72607421875;
	setAttr ".tgi[4].ni[16].y" 1157.030029296875;
	setAttr ".tgi[4].ni[16].nvs" 18304;
	setAttr ".tgi[4].ni[17].x" 2368.406982421875;
	setAttr ".tgi[4].ni[17].y" 675.4095458984375;
	setAttr ".tgi[4].ni[17].nvs" 18304;
	setAttr ".tgi[4].ni[18].x" 1421.4749755859375;
	setAttr ".tgi[4].ni[18].y" 525.99737548828125;
	setAttr ".tgi[4].ni[18].nvs" 18305;
	setAttr ".tgi[4].ni[19].x" 2368.406982421875;
	setAttr ".tgi[4].ni[19].y" 1195.4095458984375;
	setAttr ".tgi[4].ni[19].nvs" 18304;
	setAttr ".tgi[4].ni[20].x" 865.779052734375;
	setAttr ".tgi[4].ni[20].y" 578.357177734375;
	setAttr ".tgi[4].ni[20].nvs" 18305;
	setAttr ".tgi[4].ni[21].x" 2368.406982421875;
	setAttr ".tgi[4].ni[21].y" 805.4095458984375;
	setAttr ".tgi[4].ni[21].nvs" 18304;
	setAttr ".tgi[4].ni[22].x" 2219.711181640625;
	setAttr ".tgi[4].ni[22].y" 295.63571166992188;
	setAttr ".tgi[4].ni[22].nvs" 18305;
	setAttr ".tgi[4].ni[23].x" 2368.406982421875;
	setAttr ".tgi[4].ni[23].y" 415.40951538085938;
	setAttr ".tgi[4].ni[23].nvs" 18304;
	setAttr ".tgi[4].ni[24].x" 2651.428466796875;
	setAttr ".tgi[4].ni[24].y" 485.71429443359375;
	setAttr ".tgi[4].ni[24].nvs" 18304;
	setAttr ".tgi[4].ni[25].x" 2643.72607421875;
	setAttr ".tgi[4].ni[25].y" 897.030029296875;
	setAttr ".tgi[4].ni[25].nvs" 18304;
	setAttr ".tgi[4].ni[26].x" 1198.930908203125;
	setAttr ".tgi[4].ni[26].y" 70.023048400878906;
	setAttr ".tgi[4].ni[26].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
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
	setAttr -k on ".lm";
	setAttr ".otfna" -type "stringArray" 16 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Viewport UI"  ;
	setAttr ".otfva" -type "Int32Array" 16 1 1 1 1 1 1
		 1 1 1 1 1 1 1 1 1 1 ;
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
	setAttr -s 27 ".u";
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
	setAttr -s 5 ".dsm";
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
connectAttr "makeNurbSphere2.os" "end_poserShape.cr";
connectAttr "f_mainPoser.sx" "f_mainPoser.sy" -l on;
connectAttr "f_mainPoser.sx" "f_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "f_mainPoser.globalSize" -l on;
connectAttr "mainPoser_1_cluster4GroupId.id" "f_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_1_cluster4Set.mwc" "f_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_1_groupId42.id" "f_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_1_tweakSet24.mwc" "f_mainPoserShape.iog.og[2].gco";
connectAttr "f_mainPoser_clusterHandleCluster.og[0]" "f_mainPoserShape.cr";
connectAttr "mainPoser_1_tweak24.pl[0].cp[0]" "f_mainPoserShape.twl";
connectAttr "mainPoser_1_mainPoser_size_multiplyDivide.ox" "f_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_1_mainPoser_size_multiplyDivide.ox" "f_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_1_mainPoser_size_multiplyDivide.ox" "f_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_1_group.rx";
connectAttr "plusMinusAverage2.o3x" "f_2_poser_group.ty";
connectAttr "bot_1_makeNurbSphere1.os" "f_2_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3y" "f_3_poser_group.ty";
connectAttr "f_1_3_makeNurbSphere1.os" "f_3_poserNurbsShape.cr";
connectAttr "end_poser.ty" "f_4_poser_group.ty";
connectAttr "f_1_4_makeNurbSphere1.os" "f_4_poserNurbsShape.cr";
connectAttr "root_poser.ty" "f_1_poser_group.ty";
connectAttr "top_1_makeNurbSphere1.os" "f_1_poserNurbsShape.cr";
connectAttr "l_1_mainPoser.sx" "l_1_mainPoser.sy" -l on;
connectAttr "l_1_mainPoser.sx" "l_1_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_1_mainPoser.globalSize" -l on;
connectAttr "mainPoser_6_cluster4GroupId.id" "l_1_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_6_cluster4Set.mwc" "l_1_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_6_groupId42.id" "l_1_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_6_tweakSet24.mwc" "l_1_mainPoserShape.iog.og[2].gco";
connectAttr "l_1_mainPoser_clusterHandleCluster.og[0]" "l_1_mainPoserShape.cr";
connectAttr "mainPoser_6_tweak24.pl[0].cp[0]" "l_1_mainPoserShape.twl";
connectAttr "mainPoser_6_mainPoser_size_multiplyDivide.ox" "l_1_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_6_mainPoser_size_multiplyDivide.ox" "l_1_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_6_mainPoser_size_multiplyDivide.ox" "l_1_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_2_group.rx";
connectAttr "end_poser.ty" "l_1_4_poser_group.ty";
connectAttr "edge_6_4_makeNurbSphere1.os" "l_1_4_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3x" "l_1_2_poser_group.ty";
connectAttr "bot_6_makeNurbSphere1.os" "l_1_2_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3y" "l_1_3_poser_group.ty";
connectAttr "edge_6_3_makeNurbSphere1.os" "l_1_3_poserNurbsShape.cr";
connectAttr "root_poser.ty" "l_1_1_poser_group.ty";
connectAttr "top_6_makeNurbSphere1.os" "l_1_1_poserNurbsShape.cr";
connectAttr "l_2_mainPoser.sx" "l_2_mainPoser.sy" -l on;
connectAttr "l_2_mainPoser.sx" "l_2_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_2_mainPoser.globalSize" -l on;
connectAttr "mainPoser_2_cluster4GroupId.id" "l_2_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_2_cluster4Set.mwc" "l_2_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_2_groupId42.id" "l_2_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_2_tweakSet24.mwc" "l_2_mainPoserShape.iog.og[2].gco";
connectAttr "l_2_mainPoser_clusterHandleCluster.og[0]" "l_2_mainPoserShape.cr";
connectAttr "mainPoser_2_tweak24.pl[0].cp[0]" "l_2_mainPoserShape.twl";
connectAttr "mainPoser_2_mainPoser_size_multiplyDivide.ox" "l_2_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_2_mainPoser_size_multiplyDivide.ox" "l_2_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_2_mainPoser_size_multiplyDivide.ox" "l_2_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_3_group.rx";
connectAttr "plusMinusAverage2.o3x" "l_2_2_poser_group.ty";
connectAttr "bot_2_makeNurbSphere1.os" "l_2_2_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3y" "l_2_3_poser_group.ty";
connectAttr "f_2_3_makeNurbSphere1.os" "l_2_3_poserNurbsShape.cr";
connectAttr "end_poser.ty" "l_2_4_poser_group.ty";
connectAttr "f_2_4_makeNurbSphere1.os" "l_2_4_poserNurbsShape.cr";
connectAttr "root_poser.ty" "l_2_1_poser_group.ty";
connectAttr "top_2_makeNurbSphere1.os" "l_2_1_poserNurbsShape.cr";
connectAttr "l_3_mainPoser.sx" "l_3_mainPoser.sy" -l on;
connectAttr "l_3_mainPoser.sx" "l_3_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_3_mainPoser.globalSize" -l on;
connectAttr "mainPoser_3_cluster4GroupId.id" "l_3_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_3_cluster4Set.mwc" "l_3_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_3_groupId42.id" "l_3_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_3_tweakSet24.mwc" "l_3_mainPoserShape.iog.og[2].gco";
connectAttr "l_3_mainPoser_clusterHandleCluster.og[0]" "l_3_mainPoserShape.cr";
connectAttr "mainPoser_3_tweak24.pl[0].cp[0]" "l_3_mainPoserShape.twl";
connectAttr "mainPoser_3_mainPoser_size_multiplyDivide.ox" "l_3_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_3_mainPoser_size_multiplyDivide.ox" "l_3_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_3_mainPoser_size_multiplyDivide.ox" "l_3_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_4_group.rx";
connectAttr "end_poser.ty" "l_3_4_poser_group.ty";
connectAttr "f_3_4_makeNurbSphere1.os" "l_3_4_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3x" "l_3_2_poser_group.ty";
connectAttr "bot_3_makeNurbSphere1.os" "l_3_2_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3y" "l_3_3_poser_group.ty";
connectAttr "f_3_3_makeNurbSphere1.os" "l_3_3_poserNurbsShape.cr";
connectAttr "root_poser.ty" "l_3_1_poser_group.ty";
connectAttr "top_3_makeNurbSphere1.os" "l_3_1_poserNurbsShape.cr";
connectAttr "l_4_mainPoser.sx" "l_4_mainPoser.sy" -l on;
connectAttr "l_4_mainPoser.sx" "l_4_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_4_mainPoser.globalSize" -l on;
connectAttr "mainPoser_4_cluster4GroupId.id" "l_4_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_4_cluster4Set.mwc" "l_4_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_4_groupId42.id" "l_4_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_4_tweakSet24.mwc" "l_4_mainPoserShape.iog.og[2].gco";
connectAttr "l_4_mainPoser_clusterHandleCluster.og[0]" "l_4_mainPoserShape.cr";
connectAttr "mainPoser_4_tweak24.pl[0].cp[0]" "l_4_mainPoserShape.twl";
connectAttr "mainPoser_4_mainPoser_size_multiplyDivide.ox" "l_4_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_4_mainPoser_size_multiplyDivide.ox" "l_4_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_4_mainPoser_size_multiplyDivide.ox" "l_4_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_5_group.rx";
connectAttr "plusMinusAverage2.o3y" "l_4_3_poser_group.ty";
connectAttr "edge_4_3_makeNurbSphere1.os" "l_4_3_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3x" "l_4_2_poser_group.ty";
connectAttr "bot_4_makeNurbSphere1.os" "l_4_2_poserNurbsShape.cr";
connectAttr "end_poser.ty" "l_4_4_poser_group.ty";
connectAttr "edge_4_4_makeNurbSphere1.os" "l_4_4_poserNurbsShape.cr";
connectAttr "root_poser.ty" "l_4_1_poser_group.ty";
connectAttr "top_4_makeNurbSphere1.os" "l_4_1_poserNurbsShape.cr";
connectAttr "l_5_mainPoser.sx" "l_5_mainPoser.sy" -l on;
connectAttr "l_5_mainPoser.sx" "l_5_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_5_mainPoser.globalSize" -l on;
connectAttr "mainPoser_5_cluster4GroupId.id" "l_5_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_5_cluster4Set.mwc" "l_5_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_5_groupId42.id" "l_5_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_5_tweakSet24.mwc" "l_5_mainPoserShape.iog.og[2].gco";
connectAttr "l_5_mainPoser_clusterHandleCluster.og[0]" "l_5_mainPoserShape.cr";
connectAttr "mainPoser_5_tweak24.pl[0].cp[0]" "l_5_mainPoserShape.twl";
connectAttr "mainPoser_5_mainPoser_size_multiplyDivide.ox" "l_5_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_5_mainPoser_size_multiplyDivide.ox" "l_5_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_5_mainPoser_size_multiplyDivide.ox" "l_5_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_6_group.rx";
connectAttr "root_poser.ty" "l_5_1_poser_group.ty";
connectAttr "top_5_makeNurbSphere1.os" "l_5_1_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3x" "l_5_2_poser_group.ty";
connectAttr "bot_5_makeNurbSphere1.os" "l_5_2_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3y" "l_5_3_poser_group.ty";
connectAttr "edge_5_3_makeNurbSphere1.os" "l_5_3_poserNurbsShape.cr";
connectAttr "end_poser.ty" "l_5_4_poser_group.ty";
connectAttr "edge_5_4_makeNurbSphere1.os" "l_5_4_poserNurbsShape.cr";
connectAttr "b_mainPoser.sx" "b_mainPoser.sy" -l on;
connectAttr "b_mainPoser.sx" "b_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "b_mainPoser.globalSize" -l on;
connectAttr "mainPoser_7_cluster4GroupId.id" "b_mainPoserShape.iog.og[1].gid";
connectAttr "mainPoser_7_cluster4Set.mwc" "b_mainPoserShape.iog.og[1].gco";
connectAttr "mainPoser_7_groupId42.id" "b_mainPoserShape.iog.og[2].gid";
connectAttr "mainPoser_7_tweakSet24.mwc" "b_mainPoserShape.iog.og[2].gco";
connectAttr "b_mainPoser_clusterHandleCluster.og[0]" "b_mainPoserShape.cr";
connectAttr "mainPoser_7_tweak24.pl[0].cp[0]" "b_mainPoserShape.twl";
connectAttr "mainPoser_7_mainPoser_size_multiplyDivide.ox" "b_mainPoser_clusterHandle.sx"
		;
connectAttr "mainPoser_7_mainPoser_size_multiplyDivide.ox" "b_mainPoser_clusterHandle.sy"
		;
connectAttr "mainPoser_7_mainPoser_size_multiplyDivide.ox" "b_mainPoser_clusterHandle.sz"
		;
connectAttr "unitConversion1.o" "rotate_7_group.rx";
connectAttr "end_poser.ty" "b_4_poser_group.ty";
connectAttr "edge_7_4_makeNurbSphere1.os" "b_4_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3x" "b_2_poser_group.ty";
connectAttr "bot_7_makeNurbSphere1.os" "b_2_poserNurbsShape.cr";
connectAttr "plusMinusAverage2.o3y" "b_3_poser_group.ty";
connectAttr "edge_7_3_makeNurbSphere1.os" "b_3_poserNurbsShape.cr";
connectAttr "root_poser.ty" "b_1_poser_group.ty";
connectAttr "top_7_makeNurbSphere1.os" "b_1_poserNurbsShape.cr";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sz";
connectAttr "root_initLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "end_poserOrient_locShape.wp" "posers_curveShape.cp[1]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "root_poser.wm" "input.opm";
connectAttr "surfLoc_0Shape.wp" "surfShape.cp[0]";
connectAttr "surfLoc_1Shape.wp" "surfShape.cp[1]";
connectAttr "surfLoc_2Shape.wp" "surfShape.cp[2]";
connectAttr "surfLoc_3Shape.wp" "surfShape.cp[3]";
connectAttr "surfLoc_4Shape.wp" "surfShape.cp[4]";
connectAttr "surfLoc_5Shape.wp" "surfShape.cp[5]";
connectAttr "surfLoc_6Shape.wp" "surfShape.cp[6]";
connectAttr "surfLoc_7Shape.wp" "surfShape.cp[7]";
connectAttr "surfLoc_8Shape.wp" "surfShape.cp[8]";
connectAttr "surfLoc_9Shape.wp" "surfShape.cp[9]";
connectAttr "surfLoc_10Shape.wp" "surfShape.cp[10]";
connectAttr "surfLoc_11Shape.wp" "surfShape.cp[11]";
connectAttr "surfLoc_12Shape.wp" "surfShape.cp[12]";
connectAttr "surfLoc_13Shape.wp" "surfShape.cp[13]";
connectAttr "surfLoc_14Shape.wp" "surfShape.cp[14]";
connectAttr "surfLoc_15Shape.wp" "surfShape.cp[15]";
connectAttr "surfLoc_16Shape.wp" "surfShape.cp[16]";
connectAttr "surfLoc_17Shape.wp" "surfShape.cp[17]";
connectAttr "surfLoc_18Shape.wp" "surfShape.cp[18]";
connectAttr "surfLoc_19Shape.wp" "surfShape.cp[19]";
connectAttr "surfLoc_20Shape.wp" "surfShape.cp[20]";
connectAttr "surfLoc_21Shape.wp" "surfShape.cp[21]";
connectAttr "surfLoc_22Shape.wp" "surfShape.cp[22]";
connectAttr "surfLoc_23Shape.wp" "surfShape.cp[23]";
connectAttr "surfLoc_24Shape.wp" "surfShape.cp[24]";
connectAttr "surfLoc_25Shape.wp" "surfShape.cp[25]";
connectAttr "surfLoc_26Shape.wp" "surfShape.cp[26]";
connectAttr "surfLoc_27Shape.wp" "surfShape.cp[27]";
connectAttr "surfLoc_28Shape.wp" "surfShape.cp[28]";
connectAttr "surfLoc_29Shape.wp" "surfShape.cp[29]";
connectAttr "surfLoc_30Shape.wp" "surfShape.cp[30]";
connectAttr "surfLoc_31Shape.wp" "surfShape.cp[31]";
connectAttr "surfLoc_32Shape.wp" "surfShape.cp[32]";
connectAttr "surfLoc_33Shape.wp" "surfShape.cp[33]";
connectAttr "surfLoc_34Shape.wp" "surfShape.cp[34]";
connectAttr "surfLoc_35Shape.wp" "surfShape.cp[35]";
connectAttr "surfLoc_36Shape.wp" "surfShape.cp[36]";
connectAttr "surfLoc_37Shape.wp" "surfShape.cp[37]";
connectAttr "surfLoc_38Shape.wp" "surfShape.cp[38]";
connectAttr "surfLoc_39Shape.wp" "surfShape.cp[39]";
connectAttr "surfLoc_40Shape.wp" "surfShape.cp[40]";
connectAttr "surfLoc_41Shape.wp" "surfShape.cp[41]";
connectAttr "surfLoc_42Shape.wp" "surfShape.cp[42]";
connectAttr "surfLoc_43Shape.wp" "surfShape.cp[43]";
connectAttr "surfLoc_44Shape.wp" "surfShape.cp[44]";
connectAttr "surfLoc_45Shape.wp" "surfShape.cp[45]";
connectAttr "surfLoc_46Shape.wp" "surfShape.cp[46]";
connectAttr "surfLoc_47Shape.wp" "surfShape.cp[47]";
connectAttr "surfLoc_48Shape.wp" "surfShape.cp[48]";
connectAttr "surfLoc_49Shape.wp" "surfShape.cp[49]";
connectAttr "surfLoc_50Shape.wp" "surfShape.cp[50]";
connectAttr "surfLoc_51Shape.wp" "surfShape.cp[51]";
connectAttr "surfLoc_52Shape.wp" "surfShape.cp[52]";
connectAttr "surfLoc_53Shape.wp" "surfShape.cp[53]";
connectAttr "surfLoc_54Shape.wp" "surfShape.cp[54]";
connectAttr "surfLoc_55Shape.wp" "surfShape.cp[55]";
connectAttr "surfLoc_56Shape.wp" "surfShape.cp[56]";
connectAttr "surfLoc_57Shape.wp" "surfShape.cp[57]";
connectAttr "surfLoc_58Shape.wp" "surfShape.cp[58]";
connectAttr "surfLoc_59Shape.wp" "surfShape.cp[59]";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "multMatrix4.o" "f_1_group.opm";
connectAttr "multMatrix35.o" "f_2_group.opm";
connectAttr "multMatrix36.o" "f_3_group.opm";
connectAttr "multMatrix37.o" "f_4_group.opm";
connectAttr "multMatrix5.o" "b_1_group.opm";
connectAttr "multMatrix32.o" "b_2_group.opm";
connectAttr "multMatrix33.o" "b_3_group.opm";
connectAttr "multMatrix34.o" "b_4_group.opm";
connectAttr "multMatrix1.o" "l_1_1_group.opm";
connectAttr "multMatrix18.o" "l_1_2_group.opm";
connectAttr "multMatrix19.o" "l_1_3_group.opm";
connectAttr "multMatrix20.o" "l_1_4_group.opm";
connectAttr "multMatrix2.o" "l_2_1_group.opm";
connectAttr "multMatrix22.o" "l_2_2_group.opm";
connectAttr "multMatrix23.o" "l_2_3_group.opm";
connectAttr "multMatrix24.o" "l_2_4_group.opm";
connectAttr "multMatrix7.o" "l_3_1_group.opm";
connectAttr "multMatrix25.o" "l_3_2_group.opm";
connectAttr "multMatrix26.o" "l_3_3_group.opm";
connectAttr "multMatrix27.o" "l_3_4_group.opm";
connectAttr "multMatrix6.o" "l_4_1_group.opm";
connectAttr "multMatrix28.o" "l_4_2_group.opm";
connectAttr "multMatrix29.o" "l_4_3_group.opm";
connectAttr "multMatrix30.o" "l_4_4_group.opm";
connectAttr "multMatrix3.o" "l_5_1_group.opm";
connectAttr "multMatrix15.o" "l_5_2_group.opm";
connectAttr "multMatrix16.o" "l_5_3_group.opm";
connectAttr "multMatrix17.o" "l_5_4_group.opm";
connectAttr "multMatrix1.o" "r_1_1_group.opm";
connectAttr "multMatrix18.o" "r_1_2_group.opm";
connectAttr "multMatrix19.o" "r_1_3_group.opm";
connectAttr "multMatrix20.o" "r_1_4_group.opm";
connectAttr "multMatrix2.o" "r_2_1_group.opm";
connectAttr "multMatrix22.o" "r_2_2_group.opm";
connectAttr "multMatrix23.o" "r_2_3_group.opm";
connectAttr "multMatrix24.o" "r_2_4_group.opm";
connectAttr "multMatrix7.o" "r_3_1_group.opm";
connectAttr "multMatrix25.o" "r_3_2_group.opm";
connectAttr "multMatrix26.o" "r_3_3_group.opm";
connectAttr "multMatrix27.o" "r_3_4_group.opm";
connectAttr "multMatrix6.o" "r_4_1_group.opm";
connectAttr "multMatrix28.o" "r_4_2_group.opm";
connectAttr "multMatrix29.o" "r_4_3_group.opm";
connectAttr "multMatrix30.o" "r_4_4_group.opm";
connectAttr "multMatrix3.o" "r_5_1_group.opm";
connectAttr "multMatrix15.o" "r_5_2_group.opm";
connectAttr "multMatrix16.o" "r_5_3_group.opm";
connectAttr "multMatrix17.o" "r_5_4_group.opm";
connectAttr "nucleus1.stf" "nClothShape1.stf";
connectAttr ":time1.o" "nClothShape1.cti";
connectAttr "poly_clothShape.o" "nClothShape1.imsh";
connectAttr "nucleus1.noao[0]" "nClothShape1.nxst";
connectAttr "dynamic_control.damp" "nClothShape1.adng";
connectAttr "multDoubleLinear439.o" "nClothShape1.bnd";
connectAttr "dynamic_control.dynamic" "nClothShape1.isd";
connectAttr "dynamic_control.startFrame" "nucleus1.stf";
connectAttr ":time1.o" "nucleus1.cti";
connectAttr "nClothShape1.cust" "nucleus1.niao[0]";
connectAttr "nClothShape1.stst" "nucleus1.nias[0]";
connectAttr "nRigidShape1.cust" "nucleus1.nipo[0]";
connectAttr "nRigidShape1.stst" "nucleus1.nips[0]";
connectAttr "dynamicConstraintShape1.evs" "nucleus1.is[0]";
connectAttr "dynamicConstraintShape1.evc" "nucleus1.ic[0]";
connectAttr "nClothShape1.omsh" "outputCloth1.i";
connectAttr "nurbsTessellate1.op" "polyShape.i";
connectAttr "blendShape1.og[0]" "poly_finalShape.i";
connectAttr ":time1.o" "nRigidShape1.cti";
connectAttr "nucleus1.stf" "nRigidShape1.stf";
connectAttr "polyShape.w" "nRigidShape1.imsh";
connectAttr "nComponent1.ocp" "dynamicConstraintShape1.cid[0]";
connectAttr "nComponent2.ocp" "dynamicConstraintShape1.cid[1]";
connectAttr ":time1.o" "dynamicConstraintShape1.cti";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "blendShape1.mlpr" "shapeEditorManager.bspr[0]";
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "root_poser.size" "size_multiplyDivide.i1x";
connectAttr "mainPoser.size" "size_multiplyDivide.i1y";
connectAttr "multDoubleLinear438.o" "size_multiplyDivide.i1z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2z";
connectAttr "mainPoser_decomposeMatrix.osx" "multDoubleLinear438.i1";
connectAttr "mainPoser.lineSize" "multDoubleLinear438.i2";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "size_multiplyDivide1.ox" "makeNurbSphere2.r";
connectAttr "end_poser.size" "size_multiplyDivide1.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2y";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "size_multiplyDivide.oz" "sweepMeshCreator1.scaleProfileX";
connectAttr "size_multiplyDivide5.oy" "top_1_makeNurbSphere1.r";
connectAttr "size_multiplyDivide3.ox" "top_2_makeNurbSphere1.r";
connectAttr "size_multiplyDivide5.ox" "top_3_makeNurbSphere1.r";
connectAttr "size_multiplyDivide3.oz" "top_4_makeNurbSphere1.r";
connectAttr "size_multiplyDivide5.oz" "top_5_makeNurbSphere1.r";
connectAttr "size_multiplyDivide6.ox" "top_6_makeNurbSphere1.r";
connectAttr "size_multiplyDivide4.oy" "top_7_makeNurbSphere1.r";
connectAttr "size_multiplyDivide2.oz" "bot_1_makeNurbSphere1.r";
connectAttr "size_multiplyDivide2.oy" "bot_2_makeNurbSphere1.r";
connectAttr "size_multiplyDivide2.ox" "bot_3_makeNurbSphere1.r";
connectAttr "size_multiplyDivide4.ox" "bot_4_makeNurbSphere1.r";
connectAttr "size_multiplyDivide6.oy" "bot_5_makeNurbSphere1.r";
connectAttr "size_multiplyDivide4.oz" "bot_6_makeNurbSphere1.r";
connectAttr "size_multiplyDivide3.oy" "bot_7_makeNurbSphere1.r";
connectAttr "mainPoser.globalSize" "size_multiplyDivide2.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide2.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide2.i1z";
connectAttr "l_3_2_poser.size" "size_multiplyDivide2.i2x";
connectAttr "l_2_2_poser.size" "size_multiplyDivide2.i2y";
connectAttr "f_2_poser.size" "size_multiplyDivide2.i2z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide3.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide3.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide3.i1z";
connectAttr "l_2_1_poser.size" "size_multiplyDivide3.i2x";
connectAttr "b_2_poser.size" "size_multiplyDivide3.i2y";
connectAttr "l_4_1_poser.size" "size_multiplyDivide3.i2z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide4.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide4.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide4.i1z";
connectAttr "l_4_2_poser.size" "size_multiplyDivide4.i2x";
connectAttr "b_1_poser.size" "size_multiplyDivide4.i2y";
connectAttr "l_1_2_poser.size" "size_multiplyDivide4.i2z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide5.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide5.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide5.i1z";
connectAttr "l_3_1_poser.size" "size_multiplyDivide5.i2x";
connectAttr "f_1_poser.size" "size_multiplyDivide5.i2y";
connectAttr "l_5_1_poser.size" "size_multiplyDivide5.i2z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide6.i1x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide6.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide6.i1z";
connectAttr "l_1_1_poser.size" "size_multiplyDivide6.i2x";
connectAttr "l_5_2_poser.size" "size_multiplyDivide6.i2y";
connectAttr "mainPoser_1_cluster4GroupId.msg" "mainPoser_1_cluster4Set.gn" -na;
connectAttr "f_mainPoserShape.iog.og[1]" "mainPoser_1_cluster4Set.dsm" -na;
connectAttr "f_mainPoser_clusterHandleCluster.msg" "mainPoser_1_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_1_cluster4GroupParts.og" "f_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_1_cluster4GroupId.id" "f_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "f_mainPoser_clusterHandle.wm" "f_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "f_mainPoser_clusterHandleShape.x" "f_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_1_tweak24.og[0]" "mainPoser_1_cluster4GroupParts.ig";
connectAttr "mainPoser_1_cluster4GroupId.id" "mainPoser_1_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_1_groupParts42.og" "mainPoser_1_tweak24.ip[0].ig";
connectAttr "mainPoser_1_groupId42.id" "mainPoser_1_tweak24.ip[0].gi";
connectAttr "mainPoser_1_groupId42.msg" "mainPoser_1_tweakSet24.gn" -na;
connectAttr "f_mainPoserShape.iog.og[2]" "mainPoser_1_tweakSet24.dsm" -na;
connectAttr "mainPoser_1_tweak24.msg" "mainPoser_1_tweakSet24.ub[0]";
connectAttr "f_mainPoserShapeOrig.ws" "mainPoser_1_groupParts42.ig";
connectAttr "mainPoser_1_groupId42.id" "mainPoser_1_groupParts42.gi";
connectAttr "f_mainPoser.globalSize" "mainPoser_1_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "f_mainPoser.globalSize" "mainPoser_1_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "f_mainPoser.globalSize" "mainPoser_1_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "f_mainPoser.size" "mainPoser_1_mainPoser_size_multiplyDivide.i2x";
connectAttr "mainPoser_2_cluster4GroupId.msg" "mainPoser_2_cluster4Set.gn" -na;
connectAttr "l_2_mainPoserShape.iog.og[1]" "mainPoser_2_cluster4Set.dsm" -na;
connectAttr "l_2_mainPoser_clusterHandleCluster.msg" "mainPoser_2_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_2_cluster4GroupParts.og" "l_2_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_2_cluster4GroupId.id" "l_2_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_2_mainPoser_clusterHandle.wm" "l_2_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_2_mainPoser_clusterHandleShape.x" "l_2_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_2_tweak24.og[0]" "mainPoser_2_cluster4GroupParts.ig";
connectAttr "mainPoser_2_cluster4GroupId.id" "mainPoser_2_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_2_groupParts42.og" "mainPoser_2_tweak24.ip[0].ig";
connectAttr "mainPoser_2_groupId42.id" "mainPoser_2_tweak24.ip[0].gi";
connectAttr "mainPoser_2_groupId42.msg" "mainPoser_2_tweakSet24.gn" -na;
connectAttr "l_2_mainPoserShape.iog.og[2]" "mainPoser_2_tweakSet24.dsm" -na;
connectAttr "mainPoser_2_tweak24.msg" "mainPoser_2_tweakSet24.ub[0]";
connectAttr "l_2_mainPoserShapeOrig.ws" "mainPoser_2_groupParts42.ig";
connectAttr "mainPoser_2_groupId42.id" "mainPoser_2_groupParts42.gi";
connectAttr "l_2_mainPoser.globalSize" "mainPoser_2_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_2_mainPoser.globalSize" "mainPoser_2_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_2_mainPoser.globalSize" "mainPoser_2_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_2_mainPoser.size" "mainPoser_2_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "mainPoser_3_cluster4GroupId.msg" "mainPoser_3_cluster4Set.gn" -na;
connectAttr "l_3_mainPoserShape.iog.og[1]" "mainPoser_3_cluster4Set.dsm" -na;
connectAttr "l_3_mainPoser_clusterHandleCluster.msg" "mainPoser_3_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_3_cluster4GroupParts.og" "l_3_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_3_cluster4GroupId.id" "l_3_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_3_mainPoser_clusterHandle.wm" "l_3_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_3_mainPoser_clusterHandleShape.x" "l_3_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_3_tweak24.og[0]" "mainPoser_3_cluster4GroupParts.ig";
connectAttr "mainPoser_3_cluster4GroupId.id" "mainPoser_3_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_3_groupParts42.og" "mainPoser_3_tweak24.ip[0].ig";
connectAttr "mainPoser_3_groupId42.id" "mainPoser_3_tweak24.ip[0].gi";
connectAttr "mainPoser_3_groupId42.msg" "mainPoser_3_tweakSet24.gn" -na;
connectAttr "l_3_mainPoserShape.iog.og[2]" "mainPoser_3_tweakSet24.dsm" -na;
connectAttr "mainPoser_3_tweak24.msg" "mainPoser_3_tweakSet24.ub[0]";
connectAttr "l_3_mainPoserShapeOrig.ws" "mainPoser_3_groupParts42.ig";
connectAttr "mainPoser_3_groupId42.id" "mainPoser_3_groupParts42.gi";
connectAttr "l_3_mainPoser.globalSize" "mainPoser_3_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_3_mainPoser.globalSize" "mainPoser_3_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_3_mainPoser.globalSize" "mainPoser_3_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_3_mainPoser.size" "mainPoser_3_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "mainPoser_4_cluster4GroupId.msg" "mainPoser_4_cluster4Set.gn" -na;
connectAttr "l_4_mainPoserShape.iog.og[1]" "mainPoser_4_cluster4Set.dsm" -na;
connectAttr "l_4_mainPoser_clusterHandleCluster.msg" "mainPoser_4_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_4_cluster4GroupParts.og" "l_4_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_4_cluster4GroupId.id" "l_4_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_4_mainPoser_clusterHandle.wm" "l_4_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_4_mainPoser_clusterHandleShape.x" "l_4_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_4_tweak24.og[0]" "mainPoser_4_cluster4GroupParts.ig";
connectAttr "mainPoser_4_cluster4GroupId.id" "mainPoser_4_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_4_groupParts42.og" "mainPoser_4_tweak24.ip[0].ig";
connectAttr "mainPoser_4_groupId42.id" "mainPoser_4_tweak24.ip[0].gi";
connectAttr "mainPoser_4_groupId42.msg" "mainPoser_4_tweakSet24.gn" -na;
connectAttr "l_4_mainPoserShape.iog.og[2]" "mainPoser_4_tweakSet24.dsm" -na;
connectAttr "mainPoser_4_tweak24.msg" "mainPoser_4_tweakSet24.ub[0]";
connectAttr "l_4_mainPoserShapeOrig.ws" "mainPoser_4_groupParts42.ig";
connectAttr "mainPoser_4_groupId42.id" "mainPoser_4_groupParts42.gi";
connectAttr "l_4_mainPoser.globalSize" "mainPoser_4_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_4_mainPoser.globalSize" "mainPoser_4_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_4_mainPoser.globalSize" "mainPoser_4_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_4_mainPoser.size" "mainPoser_4_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "mainPoser_5_cluster4GroupId.msg" "mainPoser_5_cluster4Set.gn" -na;
connectAttr "l_5_mainPoserShape.iog.og[1]" "mainPoser_5_cluster4Set.dsm" -na;
connectAttr "l_5_mainPoser_clusterHandleCluster.msg" "mainPoser_5_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_5_cluster4GroupParts.og" "l_5_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_5_cluster4GroupId.id" "l_5_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_5_mainPoser_clusterHandle.wm" "l_5_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_5_mainPoser_clusterHandleShape.x" "l_5_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_5_tweak24.og[0]" "mainPoser_5_cluster4GroupParts.ig";
connectAttr "mainPoser_5_cluster4GroupId.id" "mainPoser_5_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_5_groupParts42.og" "mainPoser_5_tweak24.ip[0].ig";
connectAttr "mainPoser_5_groupId42.id" "mainPoser_5_tweak24.ip[0].gi";
connectAttr "mainPoser_5_groupId42.msg" "mainPoser_5_tweakSet24.gn" -na;
connectAttr "l_5_mainPoserShape.iog.og[2]" "mainPoser_5_tweakSet24.dsm" -na;
connectAttr "mainPoser_5_tweak24.msg" "mainPoser_5_tweakSet24.ub[0]";
connectAttr "l_5_mainPoserShapeOrig.ws" "mainPoser_5_groupParts42.ig";
connectAttr "mainPoser_5_groupId42.id" "mainPoser_5_groupParts42.gi";
connectAttr "l_5_mainPoser.globalSize" "mainPoser_5_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_5_mainPoser.globalSize" "mainPoser_5_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_5_mainPoser.globalSize" "mainPoser_5_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_5_mainPoser.size" "mainPoser_5_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "mainPoser_6_cluster4GroupId.msg" "mainPoser_6_cluster4Set.gn" -na;
connectAttr "l_1_mainPoserShape.iog.og[1]" "mainPoser_6_cluster4Set.dsm" -na;
connectAttr "l_1_mainPoser_clusterHandleCluster.msg" "mainPoser_6_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_6_cluster4GroupParts.og" "l_1_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_6_cluster4GroupId.id" "l_1_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_1_mainPoser_clusterHandle.wm" "l_1_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_1_mainPoser_clusterHandleShape.x" "l_1_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_6_tweak24.og[0]" "mainPoser_6_cluster4GroupParts.ig";
connectAttr "mainPoser_6_cluster4GroupId.id" "mainPoser_6_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_6_groupParts42.og" "mainPoser_6_tweak24.ip[0].ig";
connectAttr "mainPoser_6_groupId42.id" "mainPoser_6_tweak24.ip[0].gi";
connectAttr "mainPoser_6_groupId42.msg" "mainPoser_6_tweakSet24.gn" -na;
connectAttr "l_1_mainPoserShape.iog.og[2]" "mainPoser_6_tweakSet24.dsm" -na;
connectAttr "mainPoser_6_tweak24.msg" "mainPoser_6_tweakSet24.ub[0]";
connectAttr "l_1_mainPoserShapeOrig.ws" "mainPoser_6_groupParts42.ig";
connectAttr "mainPoser_6_groupId42.id" "mainPoser_6_groupParts42.gi";
connectAttr "l_1_mainPoser.globalSize" "mainPoser_6_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_1_mainPoser.globalSize" "mainPoser_6_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_1_mainPoser.globalSize" "mainPoser_6_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_1_mainPoser.size" "mainPoser_6_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "mainPoser_7_cluster4GroupId.msg" "mainPoser_7_cluster4Set.gn" -na;
connectAttr "b_mainPoserShape.iog.og[1]" "mainPoser_7_cluster4Set.dsm" -na;
connectAttr "b_mainPoser_clusterHandleCluster.msg" "mainPoser_7_cluster4Set.ub[0]"
		;
connectAttr "mainPoser_7_cluster4GroupParts.og" "b_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mainPoser_7_cluster4GroupId.id" "b_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "b_mainPoser_clusterHandle.wm" "b_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "b_mainPoser_clusterHandleShape.x" "b_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mainPoser_7_tweak24.og[0]" "mainPoser_7_cluster4GroupParts.ig";
connectAttr "mainPoser_7_cluster4GroupId.id" "mainPoser_7_cluster4GroupParts.gi"
		;
connectAttr "mainPoser_7_groupParts42.og" "mainPoser_7_tweak24.ip[0].ig";
connectAttr "mainPoser_7_groupId42.id" "mainPoser_7_tweak24.ip[0].gi";
connectAttr "mainPoser_7_groupId42.msg" "mainPoser_7_tweakSet24.gn" -na;
connectAttr "b_mainPoserShape.iog.og[2]" "mainPoser_7_tweakSet24.dsm" -na;
connectAttr "mainPoser_7_tweak24.msg" "mainPoser_7_tweakSet24.ub[0]";
connectAttr "b_mainPoserShapeOrig.ws" "mainPoser_7_groupParts42.ig";
connectAttr "mainPoser_7_groupId42.id" "mainPoser_7_groupParts42.gi";
connectAttr "b_mainPoser.globalSize" "mainPoser_7_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "b_mainPoser.globalSize" "mainPoser_7_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "b_mainPoser.globalSize" "mainPoser_7_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "b_mainPoser.size" "mainPoser_7_mainPoser_size_multiplyDivide.i2x";
connectAttr "l_2_1_poser.wm" "multMatrix2.i[0]";
connectAttr "root_poser.wim" "multMatrix2.i[1]";
connectAttr "l_5_1_poser.wm" "multMatrix3.i[0]";
connectAttr "root_poser.wim" "multMatrix3.i[1]";
connectAttr "f_1_poser.wm" "multMatrix4.i[0]";
connectAttr "root_poser.wim" "multMatrix4.i[1]";
connectAttr "b_1_poser.wm" "multMatrix5.i[0]";
connectAttr "root_poser.wim" "multMatrix5.i[1]";
connectAttr "l_4_1_poser.wm" "multMatrix6.i[0]";
connectAttr "root_poser.wim" "multMatrix6.i[1]";
connectAttr "l_3_1_poser.wm" "multMatrix7.i[0]";
connectAttr "root_poser.wim" "multMatrix7.i[1]";
connectAttr "f_3_poser.size" "f_1_3_makeNurbSphere1.r";
connectAttr "f_4_poser.size" "f_1_4_makeNurbSphere1.r";
connectAttr "l_2_3_poser.size" "f_2_3_makeNurbSphere1.r";
connectAttr "l_2_4_poser.size" "f_2_4_makeNurbSphere1.r";
connectAttr "l_3_3_poser.size" "f_3_3_makeNurbSphere1.r";
connectAttr "l_3_4_poser.size" "f_3_4_makeNurbSphere1.r";
connectAttr "l_4_3_poser.size" "edge_4_3_makeNurbSphere1.r";
connectAttr "l_4_4_poser.size" "edge_4_4_makeNurbSphere1.r";
connectAttr "l_5_3_poser.size" "edge_5_3_makeNurbSphere1.r";
connectAttr "l_5_4_poser.size" "edge_5_4_makeNurbSphere1.r";
connectAttr "l_1_3_poser.size" "edge_6_3_makeNurbSphere1.r";
connectAttr "l_1_4_poser.size" "edge_6_4_makeNurbSphere1.r";
connectAttr "b_3_poser.size" "edge_7_3_makeNurbSphere1.r";
connectAttr "b_4_poser.size" "edge_7_4_makeNurbSphere1.r";
connectAttr "l_5_3_poser.wm" "multMatrix16.i[0]";
connectAttr "l_5_2_poser.wim" "multMatrix16.i[1]";
connectAttr "l_5_4_poser.wm" "multMatrix17.i[0]";
connectAttr "l_5_3_poser.wim" "multMatrix17.i[1]";
connectAttr "l_1_1_poser.wm" "multMatrix1.i[0]";
connectAttr "root_poser.wim" "multMatrix1.i[1]";
connectAttr "l_1_2_poser.wm" "multMatrix18.i[0]";
connectAttr "l_1_1_poser.wim" "multMatrix18.i[1]";
connectAttr "l_1_3_poser.wm" "multMatrix19.i[0]";
connectAttr "l_1_2_poser.wim" "multMatrix19.i[1]";
connectAttr "l_1_4_poser.wm" "multMatrix20.i[0]";
connectAttr "l_1_3_poser.wim" "multMatrix20.i[1]";
connectAttr "l_2_2_poser.wm" "multMatrix21.i[0]";
connectAttr "l_2_1_poser.wim" "multMatrix21.i[1]";
connectAttr "l_2_2_poser.wm" "multMatrix22.i[0]";
connectAttr "l_2_1_poser.wim" "multMatrix22.i[1]";
connectAttr "l_2_3_poser.wm" "multMatrix23.i[0]";
connectAttr "l_2_2_poser.wim" "multMatrix23.i[1]";
connectAttr "l_2_4_poser.wm" "multMatrix24.i[0]";
connectAttr "l_2_3_poser.wim" "multMatrix24.i[1]";
connectAttr "l_3_2_poser.wm" "multMatrix25.i[0]";
connectAttr "l_3_1_poser.wim" "multMatrix25.i[1]";
connectAttr "l_3_3_poser.wm" "multMatrix26.i[0]";
connectAttr "l_3_2_poser.wim" "multMatrix26.i[1]";
connectAttr "l_3_4_poser.wm" "multMatrix27.i[0]";
connectAttr "l_3_3_poser.wim" "multMatrix27.i[1]";
connectAttr "l_4_2_poser.wm" "multMatrix28.i[0]";
connectAttr "l_4_1_poser.wim" "multMatrix28.i[1]";
connectAttr "l_4_3_poser.wm" "multMatrix29.i[0]";
connectAttr "l_4_2_poser.wim" "multMatrix29.i[1]";
connectAttr "l_4_4_poser.wm" "multMatrix30.i[0]";
connectAttr "l_4_3_poser.wim" "multMatrix30.i[1]";
connectAttr "l_5_2_poser.wm" "multMatrix15.i[0]";
connectAttr "l_5_1_poser.wim" "multMatrix15.i[1]";
connectAttr "b_2_poser.wm" "multMatrix32.i[0]";
connectAttr "b_1_poser.wim" "multMatrix32.i[1]";
connectAttr "b_3_poser.wm" "multMatrix33.i[0]";
connectAttr "b_2_poser.wim" "multMatrix33.i[1]";
connectAttr "b_4_poser.wm" "multMatrix34.i[0]";
connectAttr "b_3_poser.wim" "multMatrix34.i[1]";
connectAttr "f_2_poser.wm" "multMatrix35.i[0]";
connectAttr "f_1_poser.wim" "multMatrix35.i[1]";
connectAttr "f_3_poser.wm" "multMatrix36.i[0]";
connectAttr "f_2_poser.wim" "multMatrix36.i[1]";
connectAttr "f_4_poser.wm" "multMatrix37.i[0]";
connectAttr "f_3_poser.wim" "multMatrix37.i[1]";
connectAttr "plusMinusAverage1.o1" "multiplyDivide354.i1x";
connectAttr "plusMinusAverage1.o1" "multiplyDivide354.i1y";
connectAttr "end_poser.ty" "plusMinusAverage1.i1[0]";
connectAttr "root_poser.ty" "plusMinusAverage1.i1[1]";
connectAttr "root_poser.ty" "multiplyDivide355.i1x";
connectAttr "root_poser.ty" "multiplyDivide355.i1y";
connectAttr "multiplyDivide354.o" "plusMinusAverage2.i3[0]";
connectAttr "root_poser.ty" "plusMinusAverage2.i3[1].i3x";
connectAttr "root_poser.ty" "plusMinusAverage2.i3[1].i3y";
connectAttr "end_poser.radius" "unitConversion1.i";
connectAttr "surfShape.ws" "nurbsTessellate1.is";
connectAttr "dynamic_control.stiffness" "multDoubleLinear439.i1";
connectAttr "poly_finalShapeOrig.w" "blendShape1.ip[0].ig";
connectAttr "poly_finalShapeOrig.o" "blendShape1.orggeom[0]";
connectAttr "shapeEditorManager.obsv[0]" "blendShape1.tgdt[0].dpvs";
connectAttr "polyShape.w" "blendShape1.it[0].itg[0].iti[6000].igt";
connectAttr "outputCloth1.w" "blendShape1.it[0].itg[1].iti[6000].igt";
connectAttr "reverse1.ox" "blendShape1.w[0]";
connectAttr "multDoubleLinear440.o" "blendShape1.w[1]";
connectAttr "blendShape1.w[1]" "reverse1.ix";
connectAttr "dynamic_control.dynamic" "multDoubleLinear440.i1";
connectAttr "dynamic_control.dynamicWeight" "multDoubleLinear440.i2";
connectAttr "nRigidShape1.nuid" "nComponent1.obid";
connectAttr "nClothShape1.nuid" "nComponent2.obid";
connectAttr "f_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "multMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "f_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "b_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "l_1_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "multMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "multMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "l_4_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "l_3_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "l_3_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "l_2_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "multMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn";
connectAttr "l_5_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn";
connectAttr "multMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn";
connectAttr "l_2_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn";
connectAttr "l_3_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn";
connectAttr "l_4_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn";
connectAttr "f_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn";
connectAttr "l_5_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn";
connectAttr "f_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn";
connectAttr "b_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn";
connectAttr "l_4_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn";
connectAttr "l_1_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn";
connectAttr "multMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn";
connectAttr "multMatrix5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn";
connectAttr "l_1_mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn";
connectAttr "b_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn";
connectAttr "f_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn";
connectAttr "l_2_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn";
connectAttr "l_5_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "blendShape1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn";
connectAttr "poly_cloth.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn";
connectAttr "poly.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn";
connectAttr ":time1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn";
connectAttr "nucleus1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[4].dn";
connectAttr "polyShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[5].dn";
connectAttr "nClothShape1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[6].dn";
connectAttr "poly_clothShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[7].dn";
connectAttr "outputCloth1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[8].dn";
connectAttr "l_1_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[0].dn"
		;
connectAttr "f_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[1].dn";
connectAttr "plusMinusAverage2.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[2].dn"
		;
connectAttr "l_2_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[3].dn"
		;
connectAttr "l_5_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[4].dn"
		;
connectAttr "multiplyDivide354.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[5].dn"
		;
connectAttr "b_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[6].dn";
connectAttr "l_2_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[7].dn"
		;
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[8].dn";
connectAttr "l_4_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[9].dn"
		;
connectAttr "l_3_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[10].dn"
		;
connectAttr "f_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[11].dn"
		;
connectAttr "l_3_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[12].dn"
		;
connectAttr "f_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[13].dn"
		;
connectAttr "l_4_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[14].dn"
		;
connectAttr "l_5_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[15].dn"
		;
connectAttr "l_1_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[16].dn"
		;
connectAttr "b_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[17].dn"
		;
connectAttr "plusMinusAverage1.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[18].dn"
		;
connectAttr "l_3_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[19].dn"
		;
connectAttr "multiplyDivide355.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[20].dn"
		;
connectAttr "l_4_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[21].dn"
		;
connectAttr "l_5_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[22].dn"
		;
connectAttr "l_2_2_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[23].dn"
		;
connectAttr "l_1_1_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[24].dn"
		;
connectAttr "b_3_poser_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[25].dn"
		;
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[26].dn";
connectAttr "multiplyDivide353.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear438.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mainPoser_1_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mainPoser_2_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mainPoser_3_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mainPoser_4_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mainPoser_5_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mainPoser_6_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mainPoser_7_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "multMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide354.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide355.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "surfShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "polyShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "poly_clothShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "outputCloth1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "poly_finalShape.iog" ":initialShadingGroup.dsm" -na;
// End of skirt.ma
