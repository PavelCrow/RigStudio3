//Maya ASCII 2022 scene
//Name: temp.ma
//Last modified: Sun, Nov 09, 2025 02:56:16 PM
//Codeset: 1251
requires maya "2022";
requires "stereoCamera" "10.0";
requires -dataType "bifData" "bifrostGraph" "2.6.0.0-202212071624-fbc8dae";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "0438EAE3-43CC-271B-B92B-E094A4B6310D";
createNode transform -n "group1";
	rename -uid "ADC9D503-494B-1349-5028-689FE1FCE237";
createNode transform -n "curve5" -p "group1";
	rename -uid "9EEC4CE6-4C0B-2DBE-14BC-6A8F52D91E70";
createNode nurbsCurve -n "curveShape5" -p "curve5";
	rename -uid "3E744C77-4978-8BD2-15C9-9EA28BDB75C0";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		3.9563490380754072 0 1.1360973317289922
		4.3862235157735832 0 1.1991833478046421
		4.9524310447206998 0 1.0950928651871858
		5.2472603910181723 0 0.94662943230907004
		5.5215926663997967 0 0.80848744656750338
		5.8681658060190198 0 0.44846568672456172
		6.0132884741891601 0 0.17776138915272466
		;
createNode transform -n "curve5_0_loc" -p "group1";
	rename -uid "D52E999B-4354-36B5-9DCA-C5B3649C2994";
	setAttr ".t" -type "double3" 3.9563490380754072 0 1.1360973317289922 ;
	setAttr ".r" -type "double3" 0 3.8414239962558403 0 ;
createNode locator -n "curve5_0_locShape" -p "curve5_0_loc";
	rename -uid "502203DC-47A0-5BA5-7C5D-A7ABC4F88C10";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "pCube5" -p "curve5_0_loc";
	rename -uid "5920B71B-4BD5-74CF-2948-ED8141C59A63";
createNode mesh -n "pCubeShape5" -p "pCube5";
	rename -uid "82E4A57E-4371-1824-02E7-C79E77DF2017";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.46100691 0.46100691 -0.46100691 
		-0.17636275 0.49193388 -0.49193388 0.46100691 -0.46100691 -0.46100691 -0.17636275 
		-0.49193388 -0.49193388 0.46100691 -0.46100691 0.46100691 -0.17636275 -0.49193388 
		0.49193388 0.46100691 0.46100691 0.46100691 -0.17636275 0.49193388 0.49193388;
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
createNode aimConstraint -n "pCube1_aimConstraint1" -p "pCube5";
	rename -uid "45854741-43EE-6C42-CF07-C6866F661B24";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_6_locW0" -dv 1 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 7.5030083099236098 0 2.0376800434646398 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".cpim" -type "matrix" 0.99929847442673292 0 0.037450754443730229 0 0 1 0 0
		 -0.037450754443730229 0 0.99929847442673292 0 -6.8088514501396009 0 -3.0454729190931564 1;
	setAttr ".rsrr" -type "double3" 0 -5.993799949791085 0 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "pCube4_aimConstraint1" -p "pCube5";
	rename -uid "46CBF166-4598-7F11-58F3-41B503F7908C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_4_loc1W0" -dv 1 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 0.72144379469811115 0 -3.4319892733437627e-17 ;
	setAttr ".tg[0].tpm" -type "matrix" 0.9988555324955648 0 -0.047829125049507454 0
		 0 1 0 0 0.047829125049507454 0 0.9988555324955648 0 7.1706666969645871 0 2.9300695269089059 1;
	setAttr ".cpim" -type "matrix" 0.99744110890307447 0 -0.071492896641590531 0 0 1 0 0
		 0.071492896641590531 0 0.99744110890307447 0 -8.7416407163981891 0 -1.9880721813764368 1;
	setAttr ".rsrr" -type "double3" 0 79.061311177911875 0 ;
	setAttr -k on ".w0";
createNode transform -n "curve5_1_loc" -p "pCube5";
	rename -uid "CE6A921A-4588-D2CE-2D14-6E8CD2843B6B";
	setAttr ".s" -type "double3" 0.60207759636982217 0.60207759636982217 0.60207759636982217 ;
createNode locator -n "curve5_1_locShape" -p "curve5_1_loc";
	rename -uid "C2CE6D3B-45F0-534B-0F0C-6B96E31EE4C8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.089999999999999969 0.089999999999999969 0.089999999999999969 ;
createNode aimConstraint -n "pCube5_aimConstraint1" -p "pCube5";
	rename -uid "28CCAF0F-427B-779A-24AA-46AEDA0340CC";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_4_loc2W0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 24.816784804503033 0 ;
	setAttr -k on ".w0";
createNode transform -n "curve5_3_loc" -p "group1";
	rename -uid "CB72C6A5-46B5-64F2-68B4-F99FFB04128D";
	setAttr ".t" -type "double3" 5.2472603910181723 0 0.94662943230907004 ;
	setAttr ".r" -type "double3" 0 2.1462720809336271 0 ;
createNode locator -n "curve5_3_locShape" -p "curve5_3_loc";
	rename -uid "73EEFECC-463C-8FD8-2F2B-6CACBE812B92";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "pCube1" -p "curve5_3_loc";
	rename -uid "F1063EF0-46C3-0F52-DFC3-A79508784799";
	setAttr ".s" -type "double3" 0.077986185288807297 0.077986185288807297 0.077986185288807297 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "47124E50-4357-25DA-B2BE-A89D9E2EC17C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt";
	setAttr ".pt[1]" -type "float3" 3.6499319 0.39657009 -0.39657009 ;
	setAttr ".pt[3]" -type "float3" 3.6499319 -0.39657009 -0.39657009 ;
	setAttr ".pt[5]" -type "float3" 3.6499319 -0.39657009 0.39657009 ;
	setAttr ".pt[7]" -type "float3" 3.6499319 0.39657009 0.39657009 ;
createNode aimConstraint -n "pCube1_aimConstraint1" -p "pCube1";
	rename -uid "D1EF17B3-4FA9-6CB0-5768-87977F2C22FB";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_6_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 -5.993799949791085 0 ;
	setAttr -k on ".w0";
createNode transform -n "pCube2" -p "curve5_3_loc";
	rename -uid "5F6C621E-4A19-3BC4-4767-81A5A30BFA20";
	setAttr ".s" -type "double3" 0.077986185288807297 0.077986185288807297 0.077986185288807297 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	rename -uid "3356DE19-4205-99B1-0C42-39ABAD343172";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  1 0 0 -4.6499329 0.39657009 
		-0.39657009 1 0 0 -4.6499329 -0.39657009 -0.39657009 1 0 0 -4.6499329 -0.39657009 
		0.39657009 1 0 0 -4.6499329 0.39657009 0.39657009;
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
createNode aimConstraint -n "pCube1_aimConstraint1" -p "pCube2";
	rename -uid "3EFF33A3-4FD7-849D-5EDE-31AC14912AB2";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_6_locW0" -dv 1 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 7.5030083099236098 0 2.0376800434646398 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".cpim" -type "matrix" 0.99929847442673292 0 0.037450754443730229 0 0 1 0 0
		 -0.037450754443730229 0 0.99929847442673292 0 -6.1219871058093922 0 -2.1808088742909688 1;
	setAttr ".rsrr" -type "double3" 0 -5.993799949791085 0 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "pCube2_aimConstraint1" -p "pCube2";
	rename -uid "91C2C2C7-4967-13CA-4A14-53AB2DDA77D3";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_0_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 3.3736157267258453 0 ;
	setAttr -k on ".w0";
createNode transform -n "pCube3" -p "curve5_3_loc";
	rename -uid "11D5480F-4170-4E9D-962B-E28EBDABBF3B";
	setAttr ".rp" -type "double3" -1.7763568394002505e-15 0 0 ;
	setAttr ".sp" -type "double3" -1.7763568394002505e-15 0 0 ;
createNode mesh -n "pCubeShape3" -p "pCube3";
	rename -uid "025BB9C2-4218-AF64-4266-6085727DB069";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 6 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "back";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 1 "f[2]";
	setAttr ".gtag[1].gtagnm" -type "string" "bottom";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 1 "f[3]";
	setAttr ".gtag[2].gtagnm" -type "string" "front";
	setAttr ".gtag[2].gtagcmp" -type "componentList" 1 "f[0]";
	setAttr ".gtag[3].gtagnm" -type "string" "left";
	setAttr ".gtag[3].gtagcmp" -type "componentList" 1 "f[5]";
	setAttr ".gtag[4].gtagnm" -type "string" "right";
	setAttr ".gtag[4].gtagcmp" -type "componentList" 1 "f[4]";
	setAttr ".gtag[5].gtagnm" -type "string" "top";
	setAttr ".gtag[5].gtagcmp" -type "componentList" 1 "f[1]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.063760325 -0.063760325 0.063760325 0.063760325 -0.063760325 0.063760325
		 -0.063760325 0.063760325 0.063760325 0.063760325 0.063760325 0.063760325 -0.063760325 0.063760325 -0.063760325
		 0.063760325 0.063760325 -0.063760325 -0.063760325 -0.063760325 -0.063760325 0.063760325 -0.063760325 -0.063760325;
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
createNode orientConstraint -n "pCube3_orientConstraint1" -p "pCube3";
	rename -uid "29202047-4137-5621-B400-F3BE0B9D268F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "pCube2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "pCube1W1" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 24.581595904902848 0 ;
	setAttr ".rsrr" -type "double3" 0 10.49604679823061 0 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "curve5_4_loc" -p "pCube3";
	rename -uid "5A1A60D1-4733-CAD6-813F-838AA5BCBF37";
	setAttr ".t" -type "double3" 0.30715046075284069 0 1.6223949292170543e-16 ;
	setAttr ".s" -type "double3" 0.44963798145659722 0.44963798145659717 0.44963798145659722 ;
createNode locator -n "curve5_4_locShape" -p "curve5_4_loc";
	rename -uid "A657A24B-4EAE-9F7C-1269-4FAA75182633";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.089999999999999969 0.089999999999999969 0.089999999999999969 ;
createNode transform -n "curve5_2_loc" -p "pCube3";
	rename -uid "FD694FCA-4CAF-33BE-8CB7-1CB5F96598D9";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "curve5_2_locShape" -p "curve5_2_loc";
	rename -uid "F1358EE5-4628-E588-75A7-629AB5230B22";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.089999999999999969 0.089999999999999969 0.089999999999999969 ;
createNode transform -n "curve5_4_loc1" -p "pCube3";
	rename -uid "5E46EA58-422C-CDB8-7965-7F91FABC262D";
	setAttr ".t" -type "double3" 0.54266865857392343 0 -3.4319892733437627e-17 ;
	setAttr ".s" -type "double3" 0.44963798145659722 0.44963798145659717 0.44963798145659722 ;
createNode locator -n "curve5_4_loc1Shape" -p "curve5_4_loc1";
	rename -uid "1279B222-4E68-F869-A548-769E29FBA6CA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.089999999999999969 0.089999999999999969 0.089999999999999969 ;
createNode transform -n "curve5_4_loc2" -p "pCube3";
	rename -uid "B1045F2E-4439-35A2-ADD7-4BA1A6A1DEA7";
	setAttr ".t" -type "double3" -0.65237071632376287 0 1.6535948317020018e-16 ;
	setAttr ".s" -type "double3" 0.44963798145659722 0.44963798145659717 0.44963798145659722 ;
createNode locator -n "curve5_4_loc2Shape" -p "curve5_4_loc2";
	rename -uid "5B01E1E6-4FC5-B0AC-3878-20B0C6DC050D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.089999999999999969 0.089999999999999969 0.089999999999999969 ;
createNode transform -n "curve5_6_loc" -p "group1";
	rename -uid "A3A71A98-4397-89BC-E201-DF9A554228C5";
	setAttr ".t" -type "double3" 6.0132884741891601 0 0.17776138915272466 ;
createNode locator -n "curve5_6_locShape" -p "curve5_6_loc";
	rename -uid "1C16DD46-46FA-B47D-383E-8B92981B6913";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "pCube4" -p "curve5_6_loc";
	rename -uid "491FBF1A-4367-5C6E-6EEB-3090F155ECE1";
createNode mesh -n "pCubeShape4" -p "pCube4";
	rename -uid "4A8C79FD-4757-B03D-2BA5-0C88F5636D9F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.46100691 0.46100691 -0.46100691 
		-0.17636275 0.49193388 -0.49193388 0.46100691 -0.46100691 -0.46100691 -0.17636275 
		-0.49193388 -0.49193388 0.46100691 -0.46100691 0.46100691 -0.17636275 -0.49193388 
		0.49193388 0.46100691 0.46100691 0.46100691 -0.17636275 0.49193388 0.49193388;
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
createNode aimConstraint -n "pCube1_aimConstraint1" -p "pCube4";
	rename -uid "A605CA95-4228-C9F6-1AA3-AD8389937A11";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_6_locW0" -dv 1 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 7.5030083099236098 0 2.0376800434646398 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".cpim" -type "matrix" 0.99929847442673292 0 0.037450754443730229 0 0 1 0 0
		 -0.037450754443730229 0 0.99929847442673292 0 -6.8088514501396009 0 -3.0454729190931564 1;
	setAttr ".rsrr" -type "double3" 0 -5.993799949791085 0 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "pCube4_aimConstraint1" -p "pCube4";
	rename -uid "9E846140-4BCE-C94A-7677-419D96B87E09";
	addAttr -dcb 0 -ci true -sn "w0" -ln "curve5_4_loc1W0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 79.061311177911875 0 ;
	setAttr -k on ".w0";
createNode transform -n "curve5_5_loc" -p "pCube4";
	rename -uid "6D25B3CE-4E3C-618B-1205-DA9D6499F301";
	setAttr ".t" -type "double3" 0.30715046075284069 0 -4.649058915617843e-16 ;
createNode locator -n "curve5_5_locShape" -p "curve5_5_loc";
	rename -uid "CBC152D1-4410-F149-5424-8F81605B20F3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.089999999999999969 0.089999999999999969 0.089999999999999969 ;
createNode multDoubleLinear -n "multDoubleLinear447";
	rename -uid "6397C5FD-4523-7568-8FCC-1FAAF1FD0A9A";
	setAttr ".i2" 0.333;
createNode distanceBetween -n "distanceBetween3";
	rename -uid "91E4368A-4838-3D6E-A45C-189D51FB9F6A";
createNode polyCube -n "polyCube1";
	rename -uid "04B2B619-4766-E748-C5D7-878C1509BC74";
	setAttr ".cuv" 4;
createNode multDoubleLinear -n "multDoubleLinear444";
	rename -uid "A88DC273-453F-A6E8-96D7-5AAD8077FCF5";
	setAttr ".i2" 0.28300000000000003;
createNode distanceBetween -n "distanceBetween2";
	rename -uid "13148871-4F20-BD76-0111-95A469E9C97D";
createNode multDoubleLinear -n "multDoubleLinear446";
	rename -uid "A45D7DBA-46F6-C6DE-A294-ACA1A922C55C";
	setAttr ".i2" -0.253;
createNode multDoubleLinear -n "multDoubleLinear443";
	rename -uid "6EBE7A09-42A7-2482-E5FF-F1B844A9DE66";
	setAttr ".i2" 0.5;
createNode multDoubleLinear -n "multDoubleLinear445";
	rename -uid "5A690C2A-46BA-D1F0-4048-0188AB68C287";
	setAttr ".i2" -0.5;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av -k on ".unw";
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
	setAttr -av -k on ".cons" no;
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
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 45 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 12 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 472 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".r";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".tx";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -s 30 ".dsm";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -k on ".hio";
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
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
connectAttr "curve5_0_locShape.wp" "curveShape5.cp[0]";
connectAttr "curve5_1_locShape.wp" "curveShape5.cp[1]";
connectAttr "curve5_2_locShape.wp" "curveShape5.cp[2]";
connectAttr "curve5_3_locShape.wp" "curveShape5.cp[3]";
connectAttr "curve5_4_locShape.wp" "curveShape5.cp[4]";
connectAttr "curve5_5_locShape.wp" "curveShape5.cp[5]";
connectAttr "curve5_6_locShape.wp" "curveShape5.cp[6]";
connectAttr "pCube5_aimConstraint1.crx" "pCube5.rx";
connectAttr "pCube5_aimConstraint1.cry" "pCube5.ry";
connectAttr "pCube5_aimConstraint1.crz" "pCube5.rz";
connectAttr "multDoubleLinear447.o" "curve5_1_loc.tx";
connectAttr "pCube5.pim" "pCube5_aimConstraint1.cpim";
connectAttr "pCube5.t" "pCube5_aimConstraint1.ct";
connectAttr "pCube5.rp" "pCube5_aimConstraint1.crp";
connectAttr "pCube5.rpt" "pCube5_aimConstraint1.crt";
connectAttr "pCube5.ro" "pCube5_aimConstraint1.cro";
connectAttr "curve5_4_loc2.t" "pCube5_aimConstraint1.tg[0].tt";
connectAttr "curve5_4_loc2.rp" "pCube5_aimConstraint1.tg[0].trp";
connectAttr "curve5_4_loc2.rpt" "pCube5_aimConstraint1.tg[0].trt";
connectAttr "curve5_4_loc2.pm" "pCube5_aimConstraint1.tg[0].tpm";
connectAttr "pCube5_aimConstraint1.w0" "pCube5_aimConstraint1.tg[0].tw";
connectAttr "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.crx" "pCube1.rx";
connectAttr "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.cry" "pCube1.ry";
connectAttr "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.crz" "pCube1.rz";
connectAttr "polyCube1.out" "pCubeShape1.i";
connectAttr "pCube1.pim" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.cpim"
		;
connectAttr "pCube1.t" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.ct";
connectAttr "pCube1.rp" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.crp";
connectAttr "pCube1.rpt" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.crt"
		;
connectAttr "pCube1.ro" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.cro";
connectAttr "curve5_6_loc.t" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.tg[0].tt"
		;
connectAttr "curve5_6_loc.rp" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.tg[0].trp"
		;
connectAttr "curve5_6_loc.rpt" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.tg[0].trt"
		;
connectAttr "curve5_6_loc.pm" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.tg[0].tpm"
		;
connectAttr "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.w0" "|group1|curve5_3_loc|pCube1|pCube1_aimConstraint1.tg[0].tw"
		;
connectAttr "pCube2_aimConstraint1.crx" "pCube2.rx";
connectAttr "pCube2_aimConstraint1.cry" "pCube2.ry";
connectAttr "pCube2_aimConstraint1.crz" "pCube2.rz";
connectAttr "pCube2.pim" "pCube2_aimConstraint1.cpim";
connectAttr "pCube2.t" "pCube2_aimConstraint1.ct";
connectAttr "pCube2.rp" "pCube2_aimConstraint1.crp";
connectAttr "pCube2.rpt" "pCube2_aimConstraint1.crt";
connectAttr "pCube2.ro" "pCube2_aimConstraint1.cro";
connectAttr "curve5_0_loc.t" "pCube2_aimConstraint1.tg[0].tt";
connectAttr "curve5_0_loc.rp" "pCube2_aimConstraint1.tg[0].trp";
connectAttr "curve5_0_loc.rpt" "pCube2_aimConstraint1.tg[0].trt";
connectAttr "curve5_0_loc.pm" "pCube2_aimConstraint1.tg[0].tpm";
connectAttr "pCube2_aimConstraint1.w0" "pCube2_aimConstraint1.tg[0].tw";
connectAttr "pCube3_orientConstraint1.crx" "pCube3.rx";
connectAttr "pCube3_orientConstraint1.cry" "pCube3.ry";
connectAttr "pCube3_orientConstraint1.crz" "pCube3.rz";
connectAttr "pCube3.ro" "pCube3_orientConstraint1.cro";
connectAttr "pCube3.pim" "pCube3_orientConstraint1.cpim";
connectAttr "pCube2.r" "pCube3_orientConstraint1.tg[0].tr";
connectAttr "pCube2.ro" "pCube3_orientConstraint1.tg[0].tro";
connectAttr "pCube2.pm" "pCube3_orientConstraint1.tg[0].tpm";
connectAttr "pCube3_orientConstraint1.w0" "pCube3_orientConstraint1.tg[0].tw";
connectAttr "pCube1.r" "pCube3_orientConstraint1.tg[1].tr";
connectAttr "pCube1.ro" "pCube3_orientConstraint1.tg[1].tro";
connectAttr "pCube1.pm" "pCube3_orientConstraint1.tg[1].tpm";
connectAttr "pCube3_orientConstraint1.w1" "pCube3_orientConstraint1.tg[1].tw";
connectAttr "multDoubleLinear444.o" "curve5_4_loc.tx";
connectAttr "multDoubleLinear446.o" "curve5_2_loc.tx";
connectAttr "multDoubleLinear443.o" "curve5_4_loc1.tx";
connectAttr "multDoubleLinear445.o" "curve5_4_loc2.tx";
connectAttr "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.crx" "pCube4.rx";
connectAttr "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.cry" "pCube4.ry";
connectAttr "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.crz" "pCube4.rz";
connectAttr "pCube4.pim" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.cpim"
		;
connectAttr "pCube4.t" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.ct";
connectAttr "pCube4.rp" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.crp";
connectAttr "pCube4.rpt" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.crt"
		;
connectAttr "pCube4.ro" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.cro";
connectAttr "curve5_4_loc1.t" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.tg[0].tt"
		;
connectAttr "curve5_4_loc1.rp" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.tg[0].trp"
		;
connectAttr "curve5_4_loc1.rpt" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.tg[0].trt"
		;
connectAttr "curve5_4_loc1.pm" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.tg[0].tpm"
		;
connectAttr "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.w0" "|group1|curve5_6_loc|pCube4|pCube4_aimConstraint1.tg[0].tw"
		;
connectAttr "multDoubleLinear444.o" "curve5_5_loc.tx";
connectAttr "distanceBetween3.d" "multDoubleLinear447.i1";
connectAttr "curve5_0_locShape.wp" "distanceBetween3.p1";
connectAttr "curve5_3_locShape.wp" "distanceBetween3.p2";
connectAttr "distanceBetween2.d" "multDoubleLinear444.i1";
connectAttr "curve5_3_locShape.wp" "distanceBetween2.p1";
connectAttr "curve5_6_locShape.wp" "distanceBetween2.p2";
connectAttr "distanceBetween3.d" "multDoubleLinear446.i1";
connectAttr "distanceBetween2.d" "multDoubleLinear443.i1";
connectAttr "distanceBetween3.d" "multDoubleLinear445.i1";
connectAttr "distanceBetween2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear443.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear444.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear445.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear446.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear447.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape5.iog" ":initialShadingGroup.dsm" -na;
// End of temp.ma
