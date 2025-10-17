//Maya ASCII 2022 scene
//Name: batWing.ma
//Last modified: Thu, Oct 16, 2025 11:37:58 AM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "8F0C8FEB-40D1-10CD-1A58-A18E39EDF574";
createNode transform -n "mod";
	rename -uid "1AEC415F-424F-70DE-1522-FA98FBD9C08E";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "aim_offset" -ln "aim_offset" -at "double";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr ".aim_offset" 20;
	setAttr -l on ".moduleType" -type "string" "limb";
createNode transform -n "posers" -p "mod";
	rename -uid "79C0EA80-4576-75C3-D3EB-979B9AF5CA92";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "A6327C76-46AB-A787-02D9-5DA9DD6D3FF8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 0.1 -min 0 -at "double";
	addAttr -ci true -sn "flatten" -ln "flatten" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "dysplayPosers" -ln "dysplayPosers" -min 0 -max 2 -en "Wing:Edge:Closed" 
		-at "enum";
	addAttr -ci true -sn "size1" -ln "size1" -dv 0.5 -min 0 -at "double";
	addAttr -ci true -sn "size2" -ln "size2" -dv 0.5 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 5.7263777670845366 10.351165894685552 -2.4629024382541735 ;
	setAttr -k on ".s" -type "double3" 0.802 0.802 0.802 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 1.75;
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineSize";
	setAttr -k on ".flatten";
	setAttr -cb on ".dysplayPosers";
	setAttr -k on ".size1" 0.58000000000000007;
	setAttr -k on ".size2" 0.27999999999999997;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "154A2FC1-4194-0363-05D9-CBB880D514AD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "9E732E65-4753-68EB-8E8F-D489DF94091D";
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
createNode transform -n "inbetweens_points" -p "mainPoser";
	rename -uid "BCA6BCA6-4D75-7D2F-3812-8EBF08EDE656";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 8.8817841970012523e-16 7.1054273576010019e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "inbetweens_point_1_1" -p "inbetweens_points";
	rename -uid "6670A0B7-4ADD-1094-6929-2E81743A4A64";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_1Shape" -p "inbetweens_point_1_1";
	rename -uid "B3D9FFFF-47CF-167B-BFFB-FD9F3E703837";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_1_pointConstraint1" -p "inbetweens_point_1_1";
	rename -uid "5E04C956-44DA-2CB9-2C2E-468B8F41D79E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "inbetweens_point_1_7W0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_7_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 3.8154789387799912 1.4247492197267206 -7.2659131060189148 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "inbetweens_point_1_2" -p "inbetweens_points";
	rename -uid "93C65E37-4519-277C-CE1A-50B61B880A09";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_2Shape" -p "inbetweens_point_1_2";
	rename -uid "DCE6FE06-42E2-CB75-A994-43825F2391DD";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_2_pointConstraint1" -p "inbetweens_point_1_2";
	rename -uid "3AD38E7A-4137-A6EA-BBC9-F8A061792D9B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_6_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 8.9801944011935042 1.0617935172047357 -8.482943649710986 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "inbetweens_point_1_3" -p "inbetweens_points";
	rename -uid "EACA5BB9-447B-522B-DD2E-EAAE0EC9D255";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_3Shape" -p "inbetweens_point_1_3";
	rename -uid "8640B29E-4580-610D-C668-3DB24CF54535";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_3_pointConstraint1" -p "inbetweens_point_1_3";
	rename -uid "1AF8827A-495A-20BF-2289-8F88866756AA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "inbetweens_point_1_8W0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_8_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 17.156615954573535 1.0163156289684316 -7.957724584200057 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "inbetweens_point_2_1" -p "inbetweens_points";
	rename -uid "C03F19E9-46F3-EE27-C45A-9AB0DBEF43AC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_1Shape" -p "inbetweens_point_2_1";
	rename -uid "2D2EDB96-4EB7-A5F9-1122-1B86C2745FC8";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_1_pointConstraint2" -p "inbetweens_point_2_1";
	rename -uid "B78D0A0B-46F9-0E54-A057-F49093807D1C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "inbetweens_point_1_7W0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_7_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 3.8154789387799912 1.4247492197267206 -7.2659131060189148 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_2_2" -p "inbetweens_points";
	rename -uid "63DFB16F-4AFC-C6A2-29AE-87A286770391";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_2Shape" -p "inbetweens_point_2_2";
	rename -uid "83CE101C-4B75-3C68-0447-D0B15DAB9A2F";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_2_pointConstraint1" -p "inbetweens_point_2_2";
	rename -uid "6DD9DF37-4EBF-5626-E3BD-1B9B6B75E676";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_6_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 8.9801944011935042 1.0617935172047357 -8.482943649710986 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_2_3" -p "inbetweens_points";
	rename -uid "037F81A1-4C3C-F820-FC58-B691C7386066";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_3Shape" -p "inbetweens_point_2_3";
	rename -uid "49EA5D33-441A-B75E-5679-C19CF1803BDE";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_3_pointConstraint1" -p "inbetweens_point_2_3";
	rename -uid "47FA9F94-42FB-AF02-AA44-DDB2A6F84D24";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "inbetweens_point_1_8W0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_8_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 17.156615954573535 1.0163156289684316 -7.957724584200057 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_7" -p "inbetweens_points";
	rename -uid "BD31FA6D-4F4A-CDD4-D50F-45B5FE17A33A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_7Shape" -p "inbetweens_point_1_7";
	rename -uid "B8AE107B-48F4-C108-3822-88A09857FA9C";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_1_pointConstraint1" -p "inbetweens_point_1_7";
	rename -uid "E321618B-4606-3BA2-37E4-A2835D262E02";
	addAttr -ci true -k true -sn "w0" -ln "feathers_5_init_locW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "edge_2_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".tg[0].tt" -type "double3" -1.7763568394002505e-15 7.2164496600635175e-15 
		1.7763568394002505e-15 ;
	setAttr ".tg[0].tpm" -type "matrix" -0.20816984665906541 0.096318693843705824 -0.76849985306321544 0
		 0.044985782587965095 0.79593436538811857 0.087571487135719508 0 0.77320475574513203 -0.020376339476353981 -0.21199813792261191 0
		 9.4461827871512618 10.353598629044928 -3.0959280288520454 1;
	setAttr ".tg[1].tpm" -type "matrix" -0.20401043119476361 0.12056178292266889 -0.76619096866397096 0
		 0.085268328309001371 0.79093612565727467 0.10175144872505609 0 0.77091702287024133 -0.055577887948055765 -0.21401411687110375 0
		 8.0923380238662581 11.493814768906386 -12.306371218557842 1;
	setAttr ".tg[1].tw" 0.5;
	setAttr ".cpim" -type "matrix" 1.246882793017456 0 0 0 0 1.2468827930174564 0 0 0 0 1.246882793017456 0
		 -7.1401219040954302 -12.906690641752565 3.0709506711398662 1;
	setAttr ".rst" -type "double3" 3.5800092732957731 0.018829440529319671 11.379630378391084 ;
	setAttr -k on ".w1" 0.5;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode pointConstraint -n "inbetweens_point_1_7_pointConstraint1" -p "inbetweens_point_1_7";
	rename -uid "799E21A5-4E67-29E6-9B14-77A05BF2558C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_1_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_5_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 4.6808827444156904 1.4247492197267206 -2.2581743662726588 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_8" -p "inbetweens_points";
	rename -uid "9FBECAB5-48AF-AAC3-A4A6-779B0BED4158";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_8Shape" -p "inbetweens_point_1_8";
	rename -uid "A63C3A5D-4E38-7310-C14C-F3876E87207E";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_1_pointConstraint1" -p "inbetweens_point_1_8";
	rename -uid "70DE922B-4946-7A1A-A484-A4B698BD4A03";
	addAttr -ci true -k true -sn "w0" -ln "feathers_5_init_locW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "edge_2_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".tg[0].tt" -type "double3" -1.7763568394002505e-15 7.2164496600635175e-15 
		1.7763568394002505e-15 ;
	setAttr ".tg[0].tpm" -type "matrix" -0.20816984665906541 0.096318693843705824 -0.76849985306321544 0
		 0.044985782587965095 0.79593436538811857 0.087571487135719508 0 0.77320475574513203 -0.020376339476353981 -0.21199813792261191 0
		 9.4461827871512618 10.353598629044928 -3.0959280288520454 1;
	setAttr ".tg[1].tpm" -type "matrix" -0.20401043119476361 0.12056178292266889 -0.76619096866397096 0
		 0.085268328309001371 0.79093612565727467 0.10175144872505609 0 0.77091702287024133 -0.055577887948055765 -0.21401411687110375 0
		 8.0923380238662581 11.493814768906386 -12.306371218557842 1;
	setAttr ".tg[1].tw" 0.5;
	setAttr ".cpim" -type "matrix" 1.246882793017456 0 0 0 0 1.2468827930174564 0 0 0 0 1.246882793017456 0
		 -7.1401219040954302 -12.906690641752565 3.0709506711398662 1;
	setAttr ".rst" -type "double3" 3.5800092732957731 0.018829440529319671 11.379630378391084 ;
	setAttr -k on ".w1" 0.5;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode pointConstraint -n "inbetweens_point_1_7_pointConstraint1" -p "inbetweens_point_1_8";
	rename -uid "4DE6E3D2-4B59-504C-351F-23942764B521";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_1_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_5_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 0.076439017556213962 1.4247492197267242 -1.0828536644064579 ;
	setAttr ".tg[0].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".tg[1].tt" -type "double3" 9.2853264712751695 1.4247492197267242 -3.4334950681388614 ;
	setAttr ".tg[1].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".cpim" -type "matrix" 1.246882793017456 0 0 0 0 1.2468827930174564 0 0 0 0 1.246882793017456 0
		 -7.1401219040954302 -12.906690641752565 3.0709506711398662 1;
	setAttr ".rst" -type "double3" 4.6808827444156904 1.4247492197267206 -2.2581743662726588 ;
createNode pointConstraint -n "inbetweens_point_1_8_pointConstraint1" -p "inbetweens_point_1_8";
	rename -uid "2A71EA0D-4F17-0E58-23C0-F39A102727BD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_4_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 15.356912629471587 1.4247492197267206 -1.759232224939705 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_2_7" -p "inbetweens_points";
	rename -uid "F149D9D2-4D51-7175-05B5-A399917CBA46";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_7Shape" -p "inbetweens_point_2_7";
	rename -uid "4A82B48A-4478-448F-C69A-65B2C0FC9883";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_6_pointConstraint1" -p "inbetweens_point_2_7";
	rename -uid "85E74D55-4FDF-5264-C8FB-478F1D07B7AD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "edge_5_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 19.56201920401476 -0.64722483016527932 1.1490266742340818 ;
	setAttr ".tg[0].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".tg[1].tt" -type "double3" 29.237576228239135 0.51692626173753276 -14.780041655637708 ;
	setAttr ".tg[1].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".tg[1].tw" 0.5;
	setAttr ".cpim" -type "matrix" 1.246882793017456 0 0 0 0 1.2468827930174564 0 0 0 0 1.246882793017456 0
		 -7.1401219040954302 -12.906690641752565 3.0709506711398662 1;
	setAttr ".rst" -type "double3" 25.042201534042825 -3.5990493254438647 -6.7761329175832126 ;
	setAttr -k on ".w1" 0.5;
createNode pointConstraint -n "inbetweens_point_2_7_pointConstraint1" -p "inbetweens_point_2_7";
	rename -uid "D7778C5E-42AC-6614-77F8-96B2467DC293";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_1_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_3_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 21.767134311476774 1.4247492197267206 0.41676359551196596 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_9" -p "inbetweens_points";
	rename -uid "594BC9B0-41EE-29A6-F3D1-45B74365DF88";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_9Shape" -p "inbetweens_point_1_9";
	rename -uid "9A486C22-490D-ED47-C0B7-4E8156D2AB8B";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_4_pointConstraint1" -p "inbetweens_point_1_9";
	rename -uid "EA066913-45E3-2D4B-20DD-2EA577ABB354";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "edge_6_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 19.56201920401476 -0.64722483016527932 1.1490266742340818 ;
	setAttr ".tg[0].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".tg[1].tt" -type "double3" 0 2.7755575615628914e-16 5.3290705182007514e-15 ;
	setAttr ".tg[1].tpm" -type "matrix" 0.63911306710132676 0.033473682061793859 -0.48334045978953721 0
		 0.0042826895902997901 0.79966202815538856 0.061043421400537236 0 0.48447925242491902 -0.051226490565296129 0.6370711896123975 0
		 32.36502238153745 10.426482650391833 -11.802512977933524 1;
	setAttr ".tg[1].tw" 0.5;
	setAttr ".cpim" -type "matrix" 1.246882793017456 0 0 0 0 1.2468827930174564 0 0 0 0 1.246882793017456 0
		 -7.1401219040954302 -12.906690641752565 3.0709506711398662 1;
	setAttr ".rst" -type "double3" 28.409906332276563 -3.0713104496958294 -3.5791738974932761 ;
	setAttr -k on ".w1" 0.5;
createNode pointConstraint -n "inbetweens_point_1_9_pointConstraint1" -p "inbetweens_point_1_9";
	rename -uid "3928B960-473A-6F83-D00E-778597A0A249";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_1_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_2_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 22.115301505028651 1.4247492197267206 1.6747340075814983 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_10" -p "inbetweens_points";
	rename -uid "14476345-4325-2BD8-1645-A6AA7B9E708D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_10Shape" -p "inbetweens_point_1_10";
	rename -uid "1E3D50B2-4DBC-1E70-8AA7-03B4824D7A81";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_5_pointConstraint1" -p "inbetweens_point_1_10";
	rename -uid "17C23225-4845-2C10-13AB-6EB6A2A33609";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "edge_7_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 19.56201920401476 -0.64722483016527932 1.1490266742340818 ;
	setAttr ".tg[0].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".tg[1].tt" -type "double3" 37.192958969897802 -0.32910392830541113 -8.5107576951836155 ;
	setAttr ".tg[1].tpm" -type "matrix" 0.80200000000000005 0 0 0 0 0.80200000000000005 0 0
		 0 0 0.80200000000000005 0 5.7263777670845366 10.351165894685552 -2.4629024382541735 1;
	setAttr ".tg[1].tw" 0.5;
	setAttr ".cpim" -type "matrix" 1.246882793017456 0 0 0 0 1.2468827930174564 0 0 0 0 1.246882793017456 0
		 -7.1401219040954302 -12.906690641752565 3.0709506711398662 1;
	setAttr ".rst" -type "double3" 28.747144095614921 -1.9355008661002007 0.59427744918172243 ;
	setAttr -k on ".w1" 0.5;
createNode pointConstraint -n "inbetweens_point_1_10_pointConstraint1" -p "inbetweens_point_1_10";
	rename -uid "7C2BA921-4A9F-7F0E-86D3-F78C744E0E97";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_1_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_1_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 21.519513601717144 1.4247492197267206 2.8395783467701872 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_6_group" -p "inbetweens_points";
	rename -uid "DD535108-4DA7-5891-D2AB-30896DA777BB";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "inbetweens_point_1_6" -p "inbetweens_point_1_6_group";
	rename -uid "7CB1C30E-4159-F280-12B0-EEB2AD67B226";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 -1.7763568394002505e-15 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_6Shape" -p "inbetweens_point_1_6";
	rename -uid "15384EE6-4541-9ABF-AD1A-5993627B748C";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_6_group_pointConstraint1" -p "inbetweens_point_1_6_group";
	rename -uid "0E3F0F23-4887-F098-B734-6786C2022E5E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_3_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_3_3_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 29.978898694135516 1.4252420394991461 -6.6001228419418441 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_2_6_group" -p "inbetweens_points";
	rename -uid "234FC3D2-4B4B-2E91-3681-46A950AE8AED";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "inbetweens_point_2_6" -p "inbetweens_point_2_6_group";
	rename -uid "7991D17B-41E5-3219-7729-73939952C714";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 -3.5527136788005009e-15 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_6Shape" -p "inbetweens_point_2_6";
	rename -uid "025FFEBB-4CDF-2443-0D25-A7BB3D229DDF";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_6_group_pointConstraint1" -p "inbetweens_point_2_6_group";
	rename -uid "B11B5D52-4851-1709-61FF-438D77CFE028";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_2_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_3_2_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 25.382263367009749 1.4169384449335851 -1.6398421497547249 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_2_4_group" -p "inbetweens_points";
	rename -uid "D4E08866-4A4B-833F-73C5-E9A66BF23A44";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "inbetweens_point_2_4" -p "inbetweens_point_2_4_group";
	rename -uid "0045A6B4-4251-6201-80CD-0AB0D0B9078F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_4Shape" -p "inbetweens_point_2_4";
	rename -uid "BE73AFAE-420E-71BD-AD07-C6A269EE1BA2";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_4_group_pointConstraint1" -p "inbetweens_point_2_4_group";
	rename -uid "0185877A-4C0B-E4D0-590C-B0A2AF67CFA3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_3_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_2_3_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 33.945083709545031 1.4247492197267206 -0.45519585600609069 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_4_group" -p "inbetweens_points";
	rename -uid "63B64D4E-4979-7D77-737E-32B287B4754E";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "inbetweens_point_1_4" -p "inbetweens_point_1_4_group";
	rename -uid "BBDC79C4-482E-DD78-30D1-BD815EA87FA0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_4Shape" -p "inbetweens_point_1_4";
	rename -uid "CB9C8F93-4D1E-AA02-7AE8-FC826194B86A";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_4_group_pointConstraint1" -p "inbetweens_point_1_4_group";
	rename -uid "E890BBBF-4CAA-E159-D01E-CA91B90F5183";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_2_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_2_2_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 27.384034896208952 1.4247492197267206 1.2934440911145035 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_2_5_group" -p "inbetweens_points";
	rename -uid "53E18D59-4A23-87E7-5E41-8AA67485BFD0";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "inbetweens_point_2_5" -p "inbetweens_point_2_5_group";
	rename -uid "0C2DFCD6-45BE-AF04-888C-D49FDE744765";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_2_5Shape" -p "inbetweens_point_2_5";
	rename -uid "F426907D-436A-FE30-D6E8-F2973EE28974";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_2_5_group_pointConstraint1" -p "inbetweens_point_2_5_group";
	rename -uid "1F2C11C9-4813-2028-DCC4-7F8E7B39077D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_3_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_1_3_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 34.283911216236874 1.4247492197267206 6.0003597978077767 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "inbetweens_point_1_5_group" -p "inbetweens_points";
	rename -uid "BA732993-4BE6-CEE8-74D1-9090C3A41840";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "inbetweens_point_1_5" -p "inbetweens_point_1_5_group";
	rename -uid "EC228A78-4798-1638-B82A-548316BFAB7D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "inbetweens_point_1_5Shape" -p "inbetweens_point_1_5";
	rename -uid "F5317867-4766-35F9-3CAE-AF89E725E07B";
	setAttr -k off ".v";
createNode pointConstraint -n "inbetweens_point_1_5_group_pointConstraint1" -p "inbetweens_point_1_5_group";
	rename -uid "830F28E7-4EFA-8257-0145-DE9A2C2A6D8D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_2_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_1_2_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 27.152205549525021 1.4247492197267206 4.5033888913534446 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "main_posers_group" -p "mainPoser";
	rename -uid "7FCAABCB-422B-285F-76D6-E3807340DBCB";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
createNode transform -n "root_poser" -p "main_posers_group";
	rename -uid "23CA3AEB-4369-EF7C-90C7-0BB972F33B75";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -4.9991692193035684 0.44816910899271073 -1.0698873619654177 ;
	setAttr -k on ".t";
	setAttr ".r" -type "double3" -4.4663778444675426 -1.1292217385399743 -3.3997427603922676 ;
	setAttr -k off ".sy";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "AA4D5D7D-4CF7-A089-A1E0-CBADCD4BC101";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "5BBF1C65-464D-DFCF-46A3-7AA5711BA268";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "F4856C9A-4150-036E-E47F-85AEF32F70D7";
	setAttr -k off ".v";
createNode transform -n "start_poser" -p "main_posers_group";
	rename -uid "140929C9-4749-E4F9-4870-429027F52EB3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr -k on ".r";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "start_poserShape" -p "start_poser";
	rename -uid "DEDA96A0-4194-16F0-8761-2B95BF9298DE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "start_poserOrient" -p "start_poser";
	rename -uid "709467F0-4C63-A340-34D7-A4B792888966";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "start_poserOrient_locShape" -p "start_poserOrient";
	rename -uid "4116BD89-48AE-0B6F-8AF4-69BD89C81721";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "rootMiddle_orient_locator_aimConstraint" -p "start_poserOrient";
	rename -uid "64E6F0F8-49CA-96C5-23A0-5996EE1866CC";
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
createNode nurbsCurve -n "start_poserOrientShapeOrig" -p "start_poserOrient";
	rename -uid "F3334075-46D7-4E07-F1C9-56ACFE0115F9";
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
createNode transform -n "start_initLoc" -p "start_poserOrient";
	rename -uid "3DB79373-498E-B982-1C79-C8B97163DF1B";
	setAttr ".v" no;
createNode locator -n "start_initLocShape" -p "start_initLoc";
	rename -uid "7E49D1A2-40E4-70AA-9558-0F87A396D281";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_initLoc_aimConstraint" -p "start_initLoc";
	rename -uid "FAFA0309-44E9-4B20-45CE-5CABCA33DB1B";
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
createNode transform -n "ik_end_initLoc" -p "start_poserOrient";
	rename -uid "B09FBAB9-4E71-8800-7AB3-3FB664AB0DC7";
createNode locator -n "ik_end_initLocShape" -p "ik_end_initLoc";
	rename -uid "F77E608C-4F78-AC48-0325-D683C70A1007";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_root_initLoc" -p "start_poserOrient";
	rename -uid "F772FF7D-4B92-59F7-F721-D7B042310064";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "ik_root_initLocShape" -p "ik_root_initLoc";
	rename -uid "9E357EAC-4C38-BE54-6F1B-97AEEFF9EB5D";
	setAttr -k off ".v";
createNode transform -n "fk_a_initLoc" -p "start_poserOrient";
	rename -uid "0E2F5DAB-42F4-7AD6-A9C3-87A31962BFD1";
	setAttr ".v" no;
createNode locator -n "fk_a_initLocShape" -p "fk_a_initLoc";
	rename -uid "D7B3B0D7-4B25-536A-48AB-F0AD7668CAFB";
	setAttr -k off ".v";
createNode aimConstraint -n "root_poser_aimConstraint" -p "start_poser";
	rename -uid "B00105F2-40F5-8CD1-BF46-1F87CE4F54B0";
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
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" 155.07533382652429 12.782815716921254 21.338233698780456 ;
	setAttr -k on ".w0";
createNode transform -n "main_root_initLoc" -p "start_poser";
	rename -uid "39F19086-44AD-E032-3D39-E5BC80F1BC41";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "main_root_initLoc_locShape" -p "main_root_initLoc";
	rename -uid "AE55FDD8-4BF7-274A-CCC7-80ADFEEE21EB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "main_root_initLocShapeOrig" -p "main_root_initLoc";
	rename -uid "3F35F063-463B-2D2B-CE7F-8BBDE4537667";
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
createNode aimConstraint -n "main_root_initLoc_aimConstraint1" -p "main_root_initLoc";
	rename -uid "0B6617A5-435B-62C4-D29B-D6ABEE9500AB";
	addAttr -dcb 0 -ci true -sn "w0" -ln "skin_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 116.04446592126665 79.812966562420399 115.6870757089325 ;
	setAttr -k on ".w0";
createNode transform -n "middle_poser" -p "main_posers_group";
	rename -uid "D45AF644-4EC1-9789-9052-E9AB95A50538";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 9.2763217458023135 0.006066669225372058 -1.5786174329124014 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".twist";
createNode nurbsSurface -n "middle_poserShape" -p "middle_poser";
	rename -uid "29E15B72-4D21-B9FF-7FC3-B4BBD6169990";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "middle_poser_locShape" -p "middle_poser";
	rename -uid "BBF200FE-4997-825E-3291-ACA315C77971";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middle_poserOrient" -p "middle_poser";
	rename -uid "412FF37F-4AC9-653B-0444-7BAC63B0E28A";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "middle_poserOrient_locShape" -p "middle_poserOrient";
	rename -uid "5743175B-4D0E-C08F-201D-CA8B2A2BBF85";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "middleEnd_orient_locator_aimConstraint" -p "middle_poserOrient";
	rename -uid "2ED102D5-456F-E36A-F140-8AA25B7C85E3";
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
	rename -uid "04929EA0-41FB-0648-E8BE-29B746DC6174";
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
	rename -uid "AB3BF966-48BF-262A-C528-9592ECE19CF7";
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
	rename -uid "D2ECAD95-4951-F57A-17DC-3E92BE954DF6";
createNode locator -n "middle_initLocShape" -p "middle_initLoc";
	rename -uid "B0F4D7E3-4445-96E9-BD94-149276DB9851";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middle_up_loc" -p "middle_poserOrient";
	rename -uid "3F48BA69-4A3C-0A81-0670-99A225DAEEEF";
	setAttr ".t" -type "double3" 2.2204460492503114e-16 0.67310697141714793 -1.1102230246251557e-16 ;
createNode locator -n "middle_up_locShape" -p "middle_up_loc";
	rename -uid "80887252-42F3-E507-0370-50A3891A1944";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_b_initLoc" -p "middle_poserOrient";
	rename -uid "33B44C1A-4864-3590-8B9B-3AA648BE6F00";
createNode locator -n "fk_b_initLocShape" -p "fk_b_initLoc";
	rename -uid "993D8DF5-451C-C6B3-19A5-AFBC28EEB197";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_twist_angleLoc_1" -p "middle_poser";
	rename -uid "0E94734F-44E1-FC83-1F59-59BEF125462C";
	setAttr ".v" no;
createNode locator -n "root_twist_angleLoc_1Shape" -p "root_twist_angleLoc_1";
	rename -uid "14FC2C96-4434-CCED-EC30-29A9B3C653A4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_twist_angleLoc_2" -p "root_twist_angleLoc_1";
	rename -uid "4632F6BB-4570-23FB-BADE-86BAEDC733E7";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 -2.7755575615628914e-17 0 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode locator -n "root_twist_angleLoc_2Shape" -p "root_twist_angleLoc_2";
	rename -uid "14014C17-4F08-BD35-5969-BB9B19155B11";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_twist_angleLoc_2_aimConstraint1" -p "root_twist_angleLoc_2";
	rename -uid "30E06D4F-4FD9-30E2-2E57-94968325D016";
	addAttr -dcb 0 -ci true -sn "w0" -ln "root_poserW0" -dv 1 -at "double";
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
	setAttr -k on ".w0";
createNode aimConstraint -n "root_twist_angleLoc_1_aimConstraint1" -p "root_twist_angleLoc_1";
	rename -uid "75B2B21F-493D-058E-7321-BA866884B32F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "root_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 15.42933456495283 0 ;
	setAttr -k on ".w0";
createNode transform -n "middle_init_loc_offset" -p "middle_poser";
	rename -uid "BAB5BCA2-4382-181D-C781-E6A1CE6CCCB9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" -3.5527136788005009e-15 0 8.8817841970012523e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1.0000000000000002 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "middle_init_loc_offsetShape" -p "middle_init_loc_offset";
	rename -uid "8B91AF4A-43D3-CEA6-67B6-0E986008283B";
	setAttr -k off ".v";
createNode aimConstraint -n "middle_init_loc_offset_aimConstraint1" -p "middle_init_loc_offset";
	rename -uid "E7D84DC0-4678-1A0E-3EB8-298A7B510C94";
	addAttr -ci true -sn "w0" -ln "edge_3_poserW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" 36.965344148491468 72.332809007418916 111.05889459311035 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "end_poser" -p "main_posers_group";
	rename -uid "9714B750-400C-BB83-A464-448B8AE22601";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 19.629353830533407 -0.10807489191710343 1.1518488312494235 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -k on ".worldOrient";
createNode nurbsSurface -n "end_poserShape" -p "end_poser";
	rename -uid "74543523-4C25-C322-A911-D5A08BB1833F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "end_poser_locShape" -p "end_poser";
	rename -uid "CD0A6C3F-4C61-C874-D6BC-FDA8BD1BF202";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "3F05960A-4361-BBB8-A3AB-7AA427A67E2F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 7.1054273576010019e-15 -5.3290705182007514e-15 8.8817841970012523e-16 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "17183EBC-48C8-066C-5CF4-2E84225E7EBD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "end_poserOrient_aimConstraint1" -p "end_poserOrient";
	rename -uid "FE65C5C2-462E-6955-45A3-569E654E94CE";
	addAttr -dcb 0 -ci true -sn "w0" -ln "edge_7_poserW0" -dv 1 -at "double";
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
createNode transform -n "end_initLoc" -p "end_poser";
	rename -uid "E9320517-44FC-0F91-2963-02A402747559";
	setAttr ".v" no;
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "DE829778-4C80-DA13-E242-60AF5DB077EE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_initLoc" -p "end_initLoc";
	rename -uid "CFCAEB2F-45CA-C3A4-CA73-E9AD7945853B";
createNode locator -n "fk_end_initLocShape" -p "fk_end_initLoc";
	rename -uid "0AB6C092-477B-B8CB-4207-A08CF42E7AA5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_middle_direction" -p "end_poser";
	rename -uid "D9DF3CD8-416F-1CBE-CCF6-A298FAD2C264";
	setAttr ".v" no;
createNode locator -n "main_middle_directionShape" -p "main_middle_direction";
	rename -uid "6A3922E0-4B4C-EFA5-E44A-4090487D2F3E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "main_middle_direction_aimConstraint1" -p "main_middle_direction";
	rename -uid "B5266602-44B7-24A8-B7FC-CC9D6DDB1C2F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 3.1864485511515146 58.85309411780586 3.7217652693691741 ;
	setAttr -k on ".w0";
createNode transform -n "main_end_direction" -p "end_poser";
	rename -uid "262B09CE-44BB-065F-3854-45B0B59F354F";
	setAttr ".v" no;
createNode locator -n "main_end_directionShape" -p "main_end_direction";
	rename -uid "2945CF7F-4DFE-59CB-B958-BC8A1EC37331";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "main_end_direction_aimConstraint1" -p "main_end_direction";
	rename -uid "8A0F7B96-4355-4301-56CF-B3B79E3EC1D8";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0.24426985033381193 -24.762717319270351 -0.58315938131498568 ;
	setAttr -k on ".w0";
createNode transform -n "control_initLoc" -p "main_posers_group";
	rename -uid "59EAD648-4563-D862-7851-D4BAE50B3D7D";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "control_initLocShape" -p "control_initLoc";
	rename -uid "06078623-447C-BB64-EC6D-C4B9EC3322F0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "finger_posers" -p "main_posers_group";
	rename -uid "3B9E5975-4953-B3CE-B8C6-499687BD2D58";
createNode transform -n "finger_3_4_poser" -p "finger_posers";
	rename -uid "68032A5F-476A-3D68-FD0F-4BACE60F7818";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 37.192958969897802 -0.32910392830541113 -8.5107576951836155 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on -k on ".worldOrient";
createNode nurbsSurface -n "finger_3_4_poserShape" -p "finger_3_4_poser";
	rename -uid "B7B72FD7-4EB1-BDED-4A83-8BAD4261888D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "finger_3_4_poser_locShape" -p "finger_3_4_poser";
	rename -uid "E7E13C26-45EB-44F5-B676-5A9E77038441";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "edge_7_poserOrient" -p "finger_3_4_poser";
	rename -uid "1043EAC9-4735-E7E9-F5E6-879C46E9F605";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 5.3290705182007514e-15 -8.8817841970012523e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_7_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_3_4_poser|edge_7_poserOrient";
	rename -uid "943D6096-4AC0-6505-4BED-AE9C3D41E4A9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "finger_4_4_poser" -p "finger_posers";
	rename -uid "0364351D-40F4-87FE-5C65-2C852FDF0E17";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 23.31184990903974 0.4805978490391774 -16.229523966669298 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on -k on ".worldOrient";
createNode nurbsSurface -n "finger_4_4_poserShape" -p "finger_4_4_poser";
	rename -uid "D25052BD-4A1C-365B-5428-93AB304A69DC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "finger_4_4_poser_locShape" -p "finger_4_4_poser";
	rename -uid "081CE8DD-438F-42EE-7D75-E182CEA0164F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "edge_5_poserOrient" -p "finger_4_4_poser";
	rename -uid "5E847C64-443A-5566-6413-258F48C43A7F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_5_poserOrientShape" -p "edge_5_poserOrient";
	rename -uid "072F3E90-4578-5029-42A5-EE8B6A6C873B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_5_initLoc" -p "edge_5_poserOrient";
	rename -uid "8778BFA8-4323-764B-63A1-DE8D1789E586";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_5_initLocShape" -p "edge_5_initLoc";
	rename -uid "F6DA701A-431B-15D3-994F-528D39C84635";
	setAttr -k off ".v";
createNode transform -n "finger_2_4_poser" -p "finger_posers";
	rename -uid "94B3AC88-4A43-4C28-AD5D-3CB54016C713";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 41.510922645533014 -0.32910392830541113 2.8654158348552912 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on -k on ".worldOrient";
createNode nurbsSurface -n "finger_2_4_poserShape" -p "finger_2_4_poser";
	rename -uid "AF47E06E-464B-C0C7-0AB8-CD8307070888";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "finger_2_4_poser_locShape" -p "finger_2_4_poser";
	rename -uid "B61DC7F3-4D9E-15E1-7DC5-5497C879ABED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "edge_7_poserOrient" -p "finger_2_4_poser";
	rename -uid "FC9A08CC-4AB3-2CB1-C2B0-05A26E80D7B4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 5.3290705182007514e-15 -8.8817841970012523e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_7_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_2_4_poser|edge_7_poserOrient";
	rename -uid "CAD8E78F-4E95-A7A9-C0B5-72A702DD6F87";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "finger_1_4_poser" -p "finger_posers";
	rename -uid "D40AA52A-478E-8B18-175F-2F975FAF341D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 41.344847119547055 -0.32910392830541113 11.16919213415377 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on -k on ".worldOrient";
createNode nurbsSurface -n "finger_1_4_poserShape" -p "finger_1_4_poser";
	rename -uid "A78DF6FA-44E4-6CE9-9755-E8A99DE0E564";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "finger_1_4_poser_locShape" -p "finger_1_4_poser";
	rename -uid "34ABADDE-4724-8F6B-9324-19BDE1C059DC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "edge_7_poserOrient" -p "finger_1_4_poser";
	rename -uid "E020D7B8-4726-17E3-1D9A-81AE5E64554F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 5.3290705182007514e-15 -8.8817841970012523e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_7_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_1_4_poser|edge_7_poserOrient";
	rename -uid "902BB6F4-41C5-692B-DC01-37B2E20E0E71";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "finger_1_1_poser" -p "finger_posers";
	rename -uid "C641278B-4AB9-8485-DC71-12A99DD8ECCF";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 20.914194028662518 1.4247492197267242 3.2481852511418605 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_1_1_poserNurbsShape" -p "finger_1_1_poser";
	rename -uid "7DA9E1F6-4F94-60E8-BE5B-008C12A1C8A6";
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
createNode transform -n "edge_2_poserOrient" -p "finger_1_1_poser";
	rename -uid "221B94CB-4EE2-1191-F71B-C1A53C0ECCAC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_1_1_poser|edge_2_poserOrient";
	rename -uid "4270011D-4A01-81E8-BFB8-AA9150AFE620";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_1_1_poser_aimConstraint1" -p "finger_1_1_poser";
	rename -uid "8A690BDC-4240-1271-87BE-FDA3B5422DA8";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_2_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 1.7717344439881786 -21.120619429621438 -4.9064818410065021 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_1_poser" -p "finger_posers";
	rename -uid "056E5F65-4C52-EE70-2806-108608501129";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 22.124833174771773 1.4247492197267242 2.4309714423985156 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_2_1_poserNurbsShape" -p "finger_2_1_poser";
	rename -uid "65212A0E-44AC-AC05-838C-76B8F4403F8D";
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
createNode transform -n "edge_2_poserOrient" -p "finger_2_1_poser";
	rename -uid "ADDE45DE-434F-96B3-0CB9-E282AA1A84CD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_2_1_poser|edge_2_poserOrient";
	rename -uid "0A3E5699-495E-51C4-634D-5CB481722DCA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_2_1_poser_aimConstraint1" -p "finger_2_1_poser";
	rename -uid "72EAAFEF-4591-2225-6156-4ABBBF96499F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_2_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0.11566203607154972 -1.2785698355592618 -5.1694574159177176 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_1_poser" -p "finger_posers";
	rename -uid "BD7FE747-4F89-6ABA-26EC-5CA6D7B0735F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 22.105769835285539 1.4247492197267242 0.91849657276448138 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_3_1_poserNurbsShape" -p "finger_3_1_poser";
	rename -uid "621CD557-4087-C0AD-DF8F-EB805191AE06";
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
createNode transform -n "edge_2_poserOrient" -p "finger_3_1_poser";
	rename -uid "EC8AA7C7-4968-9285-BE76-8C8477AA4CF6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_3_1_poser|edge_2_poserOrient";
	rename -uid "5A067608-46C2-DCC3-9D0F-28ABDC421A2D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_3_1_poser_aimConstraint1" -p "finger_3_1_poser";
	rename -uid "159C20AD-4141-E7D2-FBC0-739FC6736202";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_2_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -3.5085792363425714 31.832159446481921 -6.6307491434438228 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_1_poser" -p "finger_posers";
	rename -uid "333F6E7C-4BC3-81CD-D039-4BA2B6C18A89";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 21.428498787668016 1.4247492197267242 -0.08496938174054991 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_4_1_poserNurbsShape" -p "finger_4_1_poser";
	rename -uid "96D9A715-4348-48F0-66D7-058FB8EC78D6";
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
createNode transform -n "edge_2_poserOrient" -p "finger_4_1_poser";
	rename -uid "3622C412-4CB1-5343-825E-F5A31313EB7E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_4_1_poser|edge_2_poserOrient";
	rename -uid "934FC9AF-4812-9B79-8809-6499232FC3DD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_4_1_poser_aimConstraint1" -p "finger_4_1_poser";
	rename -uid "8E91C760-4C24-D0BF-A28A-DC8AF03B2FA6";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_2_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.8526665919325636 61.853810135960224 -6.6309994287287148 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_3_poser_group" -p "finger_posers";
	rename -uid "29841FAA-49F9-9C52-5B4B-1A911A74A278";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_4_3_poser" -p "finger_4_3_poser_group";
	rename -uid "D4236C68-4AE7-16E3-AF02-02BAE3C66369";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 7.1054273576010019e-15 -1.7763568394002505e-15 
		0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_4_3_poserNurbsShape" -p "finger_4_3_poser";
	rename -uid "7CE6327C-4DFD-1209-E2AF-EF841DCC5CF5";
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
createNode transform -n "edge_2_poserOrient" -p "finger_4_3_poser";
	rename -uid "C553FC56-43D2-7564-76F4-76A5A2977AC1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_4_3_poser_group|finger_4_3_poser|edge_2_poserOrient";
	rename -uid "D59FC010-4A4B-12B5-8A86-5F86D3CC0B13";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_4_3_poser_aimConstraint1" -p "finger_4_3_poser";
	rename -uid "095B91AA-4B48-B352-C8FF-1E81ADCE4C17";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.8526665919325529 61.853810135960302 -6.6309994287286873 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_4_3_poser_group_pointConstraint1" -p "finger_4_3_poser_group";
	rename -uid "539CC22E-4E79-E9A1-38C6-D4A5603F0679";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_4_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 25.333037507953577 0.97083774073212936 -7.432505518689128 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "finger_4_2_poser_group" -p "finger_posers";
	rename -uid "5E945B0F-4B7F-B5A9-1702-D69CC2B85D86";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_4_2_poser" -p "finger_4_2_poser_group";
	rename -uid "A782042B-4707-6D55-B072-7DA44E9B1110";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -0.15364618186303849 0.077025070663003417 1.31709331398975 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_4_2_poserNurbsShape" -p "finger_4_2_poser";
	rename -uid "01444ED4-4D76-51DB-6F08-B39026911168";
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
createNode transform -n "edge_2_poserOrient" -p "finger_4_2_poser";
	rename -uid "AFABA9FC-4E4B-A64F-9874-989DF3335AF8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_4_2_poser_group|finger_4_2_poser|edge_2_poserOrient";
	rename -uid "9C0171C5-4C2E-3232-54EC-6E892AE86782";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_4_2_poser_aimConstraint1" -p "finger_4_2_poser";
	rename -uid "3F9390FF-49FB-F6B6-A9D9-198355F0DC45";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_3_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.8526665919327279 61.853810135960288 -6.6309994287286571 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_4_2_poser_group_pointConstraint1" -p "finger_4_2_poser_group";
	rename -uid "808662E7-4E77-9BD5-69E1-8E80838A9010";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_4_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 25.333037507953577 0.97083774073212936 -7.432505518689128 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "finger_3_2_poser_group" -p "finger_posers";
	rename -uid "71E6922C-4244-E880-6842-43B02B6AE78F";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_3_2_poser" -p "finger_3_2_poser_group";
	rename -uid "D462072D-442F-2166-CED6-93985F23F4FA";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 1.7763568394002505e-15 4.4408920985006262e-16 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_3_2_poserNurbsShape" -p "finger_3_2_poser";
	rename -uid "71847B7F-4159-FBC1-FB3D-15A244BCBAF9";
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
createNode transform -n "edge_2_poserOrient" -p "finger_3_2_poser";
	rename -uid "2B07654E-498F-2CFE-C99D-729A655AF663";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_3_2_poser_group|finger_3_2_poser|edge_2_poserOrient";
	rename -uid "41403C31-4849-71CE-1726-528421EE8951";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_3_2_poser_aimConstraint1" -p "finger_3_2_poser";
	rename -uid "5B233556-456E-BD58-E0B4-91BC1BDBDAFB";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_3_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -3.5085792363428152 31.832159446482059 -6.6307491434438566 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_3_2_poser_group_pointConstraint1" -p "finger_3_2_poser_group";
	rename -uid "C175C156-43C0-0B94-A73B-858D55719CCC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_3_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 29.649364402591672 0.54782264571065475 -3.7961305612095666 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "finger_3_3_poser_group" -p "finger_posers";
	rename -uid "7780B1DC-412C-4604-9F3E-D78FCD7FBB47";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_3_3_poser" -p "finger_3_3_poser_group";
	rename -uid "023734E6-4FA5-3EEB-F4DF-5D9C5545267B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -7.1054273576010019e-15 1.7763568394002505e-15 
		0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_3_3_poserNurbsShape" -p "finger_3_3_poser";
	rename -uid "20770277-4001-8C94-58E9-4289C60EEBCF";
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
createNode transform -n "edge_2_poserOrient" -p "finger_3_3_poser";
	rename -uid "F06A3833-4D98-DB16-C883-C1B9F0F37794";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_3_3_poser_group|finger_3_3_poser|edge_2_poserOrient";
	rename -uid "8CEC0195-442E-D58C-9875-919AA28627E6";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_3_3_poser_aimConstraint1" -p "finger_3_3_poser";
	rename -uid "58FDCC96-4FF3-A7A2-0B95-B3AF13FDFF19";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -3.5085792363427863 31.832159446481871 -6.6307491434437988 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_3_3_poser_group_pointConstraint1" -p "finger_3_3_poser_group";
	rename -uid "3B7E7544-4417-F60C-CA79-7B8B445A69C3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_3_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 29.649364402591672 0.54782264571065475 -3.7961305612095666 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "finger_2_3_poser_group" -p "finger_posers";
	rename -uid "2B3E20FF-4BE8-21EE-AFE2-96B4A18D0909";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_2_3_poser" -p "finger_2_3_poser_group";
	rename -uid "1FE1A40F-43DA-589F-F8E3-FF9599C96CA8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_2_3_poserNurbsShape" -p "finger_2_3_poser";
	rename -uid "1D475313-4FFA-144F-12AB-F7838A5E6748";
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
createNode transform -n "edge_2_poserOrient" -p "finger_2_3_poser";
	rename -uid "214ACE9E-4ECE-88EB-CD2E-73A315A76C9E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_2_3_poser_group|finger_2_3_poser|edge_2_poserOrient";
	rename -uid "5AB4D632-4D59-63CD-1962-7AB655EC2BAF";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_2_3_poser_aimConstraint1" -p "finger_2_3_poser";
	rename -uid "F3112671-4F17-2740-E91B-5A96B59FA1CC";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0.11566203607154953 -1.2785698355592572 -5.1694574159177193 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_2_3_poser_group_pointConstraint1" -p "finger_2_3_poser_group";
	rename -uid "B06CE9F8-4D5E-3A9B-53C9-29AC1E0936C1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_2_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 31.81787791015239 0.54782264571065475 2.6481936386269034 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "finger_2_2_poser_group" -p "finger_posers";
	rename -uid "9B4AC5C1-428A-BC7B-AE5D-25BD601B5779";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_2_2_poser" -p "finger_2_2_poser_group";
	rename -uid "6A9FDBDA-4251-DCAD-9375-28B444E6D1A0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_2_2_poserNurbsShape" -p "finger_2_2_poser";
	rename -uid "89B18838-4FB4-446B-D381-A7B74C059179";
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
createNode transform -n "edge_2_poserOrient" -p "finger_2_2_poser";
	rename -uid "7FA111D3-4C3D-0043-2B15-E1AE4DEA1393";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_2_2_poser_group|finger_2_2_poser|edge_2_poserOrient";
	rename -uid "7F7BB85D-47B3-CCBA-3279-BC83A6513BAB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_2_2_poser_aimConstraint1" -p "finger_2_2_poser";
	rename -uid "78177FCC-4E72-ECDF-07D8-0C8C8C585255";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_3_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0.11566203607154937 -1.2785698355592534 -5.1694574159177193 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_2_2_poser_group_pointConstraint1" -p "finger_2_2_poser_group";
	rename -uid "707925DA-4840-722C-0374-56B7B4F7DC5E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_2_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 31.81787791015239 0.54782264571065475 2.6481936386269034 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "finger_1_2_poser_group" -p "finger_posers";
	rename -uid "2E2EEF2F-4EC0-4E24-3577-54BB16375537";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_1_2_poser" -p "finger_1_2_poser_group";
	rename -uid "11C35083-422A-C264-B3F8-A6A90B29E4B9";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_1_2_poserNurbsShape" -p "finger_1_2_poser";
	rename -uid "3EC6C5F8-49FC-92DB-6D40-05BF5D87C0A5";
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
createNode transform -n "edge_2_poserOrient" -p "finger_1_2_poser";
	rename -uid "57F4C429-40E5-8A59-B0D2-0DBA4FC63139";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_1_2_poser_group|finger_1_2_poser|edge_2_poserOrient";
	rename -uid "0A2018F9-4CC3-3C0F-1919-6BBD4385FBE8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_1_2_poser_aimConstraint1" -p "finger_1_2_poser";
	rename -uid "824C8D7A-44E3-54F1-1112-18BEF53C8C65";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_3_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 1.7717344439881846 -21.12061942962151 -4.9064818410065163 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_1_2_poser_group_pointConstraint1" -p "finger_1_2_poser_group";
	rename -uid "5D4D84C1-4E92-4987-2054-5B85391D8960";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_1_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_1_4_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 31.129520574104788 0.54782264571065475 7.2086886926478151 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "finger_1_3_poser_group" -p "finger_posers";
	rename -uid "A4C51A25-44E5-F148-26BC-388B5CF03F68";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_1_3_poser" -p "finger_1_3_poser_group";
	rename -uid "6383860D-459C-F41E-C885-639E36C9A717";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -7.1054273576010019e-15 1.7763568394002505e-15 
		0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "finger_1_3_poserNurbsShape" -p "finger_1_3_poser";
	rename -uid "012D8C11-447B-B7C9-CF32-61BBB37DAFB6";
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
createNode transform -n "edge_2_poserOrient" -p "finger_1_3_poser";
	rename -uid "C20A2D69-44E7-015F-55E2-4DB96BAD8145";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|finger_posers|finger_1_3_poser_group|finger_1_3_poser|edge_2_poserOrient";
	rename -uid "7C77EEC3-4126-E5FC-A219-9180A2CB8E21";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "finger_1_3_poser_aimConstraint1" -p "finger_1_3_poser";
	rename -uid "694EBBDE-499E-6117-669D-6D9FC7A4B30E";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 1.7717344439886 -21.120619429621403 -4.9064818410064905 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "finger_1_3_poser_group_pointConstraint1" -p "finger_1_3_poser_group";
	rename -uid "CCB05102-4989-B039-6C3D-818A3CEF3677";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_1_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_1_4_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 31.129520574104788 0.54782264571065475 7.2086886926478151 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "skin_posers" -p "main_posers_group";
	rename -uid "C6CC5CA8-4FAA-B638-A128-239962347F27";
createNode transform -n "skin_6_poser" -p "skin_posers";
	rename -uid "B19281FB-495C-07BD-8642-6481FAFE932D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 8.675062331111846 0.69883781468275963 -13.532392231283117 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_6_poserNurbsShape" -p "skin_6_poser";
	rename -uid "EA16F819-49C7-5FB7-EC12-0996436C89C9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "edge_3_poserOrient" -p "skin_6_poser";
	rename -uid "BD9A4507-4191-2CA4-76C4-63AE0633B48C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_3_poserOrientShape" -p "edge_3_poserOrient";
	rename -uid "17088F5E-434D-D474-7ED6-9483B1E2C0E0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_3_initLoc" -p "edge_3_poserOrient";
	rename -uid "892F3A2F-4B8E-76B6-11DA-478F53DC8299";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_3_initLocShape" -p "edge_3_initLoc";
	rename -uid "9C11FDBE-4736-2F30-A4F5-24959BD41471";
	setAttr -k off ".v";
createNode transform -n "skin_4_poser" -p "skin_posers";
	rename -uid "406EA68F-4329-F222-E157-2BB82E73EB49";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -2.7749120648232619 2.1506606247706923 -11.01491146024723 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_4_poserNurbsShape" -p "skin_4_poser";
	rename -uid "808FA873-48CE-8E3E-5B68-3DA6EBDDE0A8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "edge_1_poserOrient" -p "skin_4_poser";
	rename -uid "AF0F7F5E-4E8B-3FCB-E968-CF9CD44D50C8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_1_poserOrientShape" -p "edge_1_poserOrient";
	rename -uid "D2C52769-45F3-DA27-041E-D1BC58B6961C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_1_initLoc" -p "edge_1_poserOrient";
	rename -uid "DE34DB29-49A5-F515-8ACC-BC88D7A58C28";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_1_initLocShape" -p "edge_1_initLoc";
	rename -uid "C18EA459-4BFF-B615-CA39-8B84C3F74BD7";
	setAttr -k off ".v";
createNode transform -n "skin_5_poser" -p "skin_posers";
	rename -uid "FD620BFC-437B-2133-1C9E-B487E23340F3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 8.8579180301669549 0.71987632985377714 -4.0323527357659632 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_5_poserNurbsShape" -p "skin_5_poser";
	rename -uid "44B9F452-42E7-5A9B-69AB-2695CB7649F4";
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
createNode transform -n "edge_2_poserOrient" -p "skin_5_poser";
	rename -uid "F6BABD12-4F3C-DF9B-4549-24B79E0606DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_5_poser|edge_2_poserOrient";
	rename -uid "51BEB1C8-4127-F4E7-4D86-179BA0415A08";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "skin_1_poser" -p "skin_posers";
	rename -uid "D87B782C-4C57-BFAE-10FF-ECA2631EA0AE";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -0.34069257272753273 0.73933864276085182 -1.1114747691560092 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_1_poserNurbsShape" -p "skin_1_poser";
	rename -uid "3FB080AD-487F-1798-D19C-368CD346EA59";
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
createNode transform -n "edge_2_poserOrient" -p "skin_1_poser";
	rename -uid "06AD8F92-4CA5-3715-1F49-E4998FB5A8A0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 150.85112474280629 74.139106664916511 149.89552008963253 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_1_poser|edge_2_poserOrient";
	rename -uid "B839414D-432E-C63B-3A4B-C4B54B231397";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "skin_1_poser_aimConstraint1" -p "skin_1_poser";
	rename -uid "29E427D1-45C6-C819-47F1-C79CA3FDB037";
	addAttr -dcb 0 -ci true -sn "w0" -ln "skin_2_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 150.85112474280621 74.139106664916525 149.89552008963258 ;
	setAttr -k on ".w0";
createNode transform -n "skin_8_poser_group" -p "skin_posers";
	rename -uid "48B833CD-443E-650D-09BD-CB82E4F515A5";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
createNode transform -n "skin_8_poser" -p "skin_8_poser_group";
	rename -uid "11A52081-479F-CC5E-DA70-5EAF8A1E0530";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 8.8817841970012523e-16 0 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_8_poserNurbsShape" -p "skin_8_poser";
	rename -uid "8428A6CA-4A85-3F45-4433-8FA1FC9FFC38";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode transform -n "edge_4_poserOrient" -p "skin_8_poser";
	rename -uid "C477246A-4D52-8CFC-531D-F58CACD59D30";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_4_poserOrientShape" -p "edge_4_poserOrient";
	rename -uid "C4A981AE-4E15-7941-30B3-ECAC63492843";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_4_initLoc" -p "edge_4_poserOrient";
	rename -uid "49D9FC3D-4638-697D-E2FA-C68E20F78436";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_4_initLocShape" -p "edge_4_initLoc";
	rename -uid "7B88DBA9-40DF-42C9-3433-CFBB7023C770";
	setAttr -k off ".v";
createNode pointConstraint -n "edge_4_poser_group_pointConstraint1" -p "skin_8_poser_group";
	rename -uid "7E55E7DF-4C0F-BA79-377B-F182D5A2FDD5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "edge_3_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "edge_5_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 18.81486329375856 0.60788203821014619 -14.98137686130916 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "skin_7_poser_group" -p "skin_posers";
	rename -uid "5A2BC300-4C64-5DE7-DA38-709E2969F845";
	setAttr ".r" -type "double3" 154.57159019089366 72.813950801151833 149.41865730843091 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1.0000000000000007 ;
createNode transform -n "skin_7_poser" -p "skin_7_poser_group";
	rename -uid "DF85FC17-4B74-1BF3-6C78-C7A0A0D547A9";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_7_poserNurbsShape" -p "skin_7_poser";
	rename -uid "4060AD38-4299-3E10-90A7-A19DC60B5AAD";
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
createNode transform -n "edge_2_poserOrient" -p "skin_7_poser";
	rename -uid "B75D8776-4D44-BFCF-55F2-5195086103C0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_7_poser_group|skin_7_poser|edge_2_poserOrient";
	rename -uid "ED6E722D-419C-3197-D5C6-8DB86EBFAFA0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "edge_2_poserGroup_pointConstraint1" -p "skin_7_poser_group";
	rename -uid "C7C75D89-4CE0-FA57-F00D-A9963DF26D02";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "edge_1_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "edge_3_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 2.8086191472273621 1.424749219726726 -13.098811763613922 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "skin_9_poser_group" -p "skin_posers";
	rename -uid "C8AD445C-493B-612F-7D0F-1492B4055E11";
	setAttr ".r" -type "double3" 5.4733052618910998 37.061283795631361 2.9981391113742664 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1 ;
createNode transform -n "skin_9_poser" -p "skin_9_poser_group";
	rename -uid "380A421B-49EA-7F28-02C6-B69953F63F21";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 2.7755575615628914e-16 5.3290705182007514e-15 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_9_poserNurbsShape" -p "skin_9_poser";
	rename -uid "1E66DBB8-48BC-3A09-EC76-7592A1FE45EA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "skin_9_poser_locShape" -p "skin_9_poser";
	rename -uid "155DBEA8-469B-8726-FCEF-68B99B22292A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "skin_9_poserShapeOrig" -p "skin_9_poser";
	rename -uid "27673C13-43DD-E3D5-2BB7-DBAF253FDA08";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".cc" -type "nurbsCurve" 
		3 46 0 no 3
		51 2 2 2 3 4 4 4 5 6 6 6 7 8 8 8 9 10 10 10 11 12 12 12 13 14 14 14 15 16 16
		 16 17 18 18 18 19 20 20 20 21 22 22 22 23 24 24 24 25 26 26 26
		49
		-0.040672434428423117 1.3357320668974914e-17 8.830165531785147e-17
		-0.040672434428423165 -0.010623797476912803 8.5221447757645453e-17
		-0.031871392430738402 -0.031871392430738402 8.4580877696444362e-17
		-0.010623797476912803 -0.040672434428423138 8.5393361680607359e-17
		1.3357320668974914e-17 -0.040672434428423117 8.830165531785147e-17
		0.010623797476912791 -0.040672434428423165 8.6694401638096411e-17
		0.031871392430738402 -0.031871392430738443 8.8483997568911677e-17
		0.040672434428423138 -0.01062379747691279 9.0202384421275339e-17
		0.040672434428423117 1.3357320668974914e-17 8.830165531785147e-17
		0.040672434428423138 0.010623797476912828 9.1381862878057623e-17
		0.031871392430738402 0.031871392430738443 9.2022432939258664e-17
		0.010623797476912791 0.040672434428423165 9.1209948955095716e-17
		1.1099547010475297e-17 0.04067243442842302 9.0559428976351166e-17
		-0.010623797476912803 0.040672434428423138 8.9908908997606517e-17
		-0.031871392430738402 0.031871392430738402 8.811931306679135e-17
		-0.040672434428423165 0.010623797476912791 8.6400926214427725e-17
		-0.040672434428423165 6.5839996934760788e-18 8.37861080008523e-17
		-0.040672434428423117 1.4007840647719461e-17 -0.010623797476912732
		-0.031871392430738402 1.5308880605208556e-17 -0.031871392430738374
		-0.010623797476912803 1.5847789000789857e-17 -0.040672434428423096
		1.3357320668974914e-17 1.3357320668974914e-17 -0.040672434428423096
		0.010623797476912803 1.5847789000789857e-17 -0.040672434428423096
		0.031871392430738443 1.5308880605208553e-17 -0.031871392430738346
		0.040672434428423165 1.4007840647719458e-17 -0.010623797476912694
		0.040672434428423138 1.3357320668974914e-17 1.0862161824434793e-16
		0.040672434428423096 1.270680069023036e-17 0.010623797476912883
		0.031871392430738374 1.140576073274126e-17 0.031871392430738436
		0.01062379747691279 1.0866852337159962e-17 0.040672434428423165
		1.3357320668974914e-17 1.3357320668974914e-17 0.040672434428423117
		8.5078954235953106e-18 0.010623797476912803 0.040672434428423117
		4.3288899920473234e-18 0.031871392430738402 0.031871392430738416
		3.6757060562319033e-18 0.040672434428423138 0.010623797476912876
		4.3262260349764661e-18 0.040672434428423117 7.5883900196103648e-17
		4.9767460137210203e-18 0.040672434428423117 -0.010623797476912732
		8.232009864514622e-18 0.031871392430738402 -0.031871392430738374
		1.3488832087225212e-17 0.010623797476912803 -0.040672434428423096
		1.5847789000789857e-17 1.4486207498224713e-17 -0.040672434428423096
		1.8206745914354496e-17 -0.010623797476912803 -0.040672434428423096
		2.238575134590251e-17 -0.031871392430738443 -0.031871392430738346
		2.3038935281717925e-17 -0.040672434428423165 -0.010623797476912694
		2.2388415302973362e-17 -0.040672434428423138 1.0862161824434793e-16
		2.1737895324228802e-17 -0.040672434428423096 0.010623797476912883
		1.8482631473435204e-17 -0.031871392430738374 0.031871392430738436
		1.3225809250724601e-17 -0.01062379747691279 0.040672434428423165
		1.0866852337159962e-17 2.8032849449222395e-17 0.040672434428423117
		-0.010623797476912803 1.0866852337159962e-17 0.040672434428423117
		-0.031871392430738402 1.140576073274126e-17 0.031871392430738416
		-0.040672434428423138 1.270680069023036e-17 0.010623797476912876
		-0.040672434428423117 1.3357320668974914e-17 7.5883900196103648e-17
		;
createNode transform -n "edge_6_poserOrient" -p "skin_9_poser";
	rename -uid "84B20802-496A-A6CB-24F5-1B8954D3D322";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_6_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_9_poser_group|skin_9_poser|edge_6_poserOrient";
	rename -uid "094E0E53-4B86-BE1A-D5D6-868F173969F8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_6_poser_initLoc" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_9_poser_group|skin_9_poser|edge_6_poserOrient";
	rename -uid "7F343472-4C1D-56F3-CE95-7D89619A2593";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_6_poser_initLocShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_9_poser_group|skin_9_poser|edge_6_poserOrient|edge_6_poser_initLoc";
	rename -uid "4D51226A-4A48-0FA8-5687-82BD941F667B";
	setAttr -k off ".v";
createNode pointConstraint -n "edge_6_poserGroup_pointConstraint1" -p "skin_9_poser_group";
	rename -uid "ADA89936-49FE-B0A2-1047-E59F70B6FA04";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "edge_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "edge_7_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 18.371089199032106 -3.5527136788005009e-15 0.40129490135996981 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "skin_10_poser_group" -p "skin_posers";
	rename -uid "83F37AE0-44DA-EB2A-377E-BB8ABADA7B32";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "skin_10_poser" -p "skin_10_poser_group";
	rename -uid "2024F8EA-4ADF-308A-145C-7B9CF7FEB21C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 -1.7763568394002505e-15 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_10_poserNurbsShape" -p "skin_10_poser";
	rename -uid "DD3B8497-4F3F-11EB-B851-A38AF200DEFE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "skin_10_poser_locShape" -p "skin_10_poser";
	rename -uid "8DA8C5F1-4639-0C59-76FA-A792BD4C6255";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "skin_10_poserShapeOrig" -p "skin_10_poser";
	rename -uid "DDE46512-490C-07BF-8209-B09DAB21B8AF";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".cc" -type "nurbsCurve" 
		3 46 0 no 3
		51 2 2 2 3 4 4 4 5 6 6 6 7 8 8 8 9 10 10 10 11 12 12 12 13 14 14 14 15 16 16
		 16 17 18 18 18 19 20 20 20 21 22 22 22 23 24 24 24 25 26 26 26
		49
		-0.040672434428423117 1.3357320668974914e-17 8.830165531785147e-17
		-0.040672434428423165 -0.010623797476912803 8.5221447757645453e-17
		-0.031871392430738402 -0.031871392430738402 8.4580877696444362e-17
		-0.010623797476912803 -0.040672434428423138 8.5393361680607359e-17
		1.3357320668974914e-17 -0.040672434428423117 8.830165531785147e-17
		0.010623797476912791 -0.040672434428423165 8.6694401638096411e-17
		0.031871392430738402 -0.031871392430738443 8.8483997568911677e-17
		0.040672434428423138 -0.01062379747691279 9.0202384421275339e-17
		0.040672434428423117 1.3357320668974914e-17 8.830165531785147e-17
		0.040672434428423138 0.010623797476912828 9.1381862878057623e-17
		0.031871392430738402 0.031871392430738443 9.2022432939258664e-17
		0.010623797476912791 0.040672434428423165 9.1209948955095716e-17
		1.1099547010475297e-17 0.04067243442842302 9.0559428976351166e-17
		-0.010623797476912803 0.040672434428423138 8.9908908997606517e-17
		-0.031871392430738402 0.031871392430738402 8.811931306679135e-17
		-0.040672434428423165 0.010623797476912791 8.6400926214427725e-17
		-0.040672434428423165 6.5839996934760788e-18 8.37861080008523e-17
		-0.040672434428423117 1.4007840647719461e-17 -0.010623797476912732
		-0.031871392430738402 1.5308880605208556e-17 -0.031871392430738374
		-0.010623797476912803 1.5847789000789857e-17 -0.040672434428423096
		1.3357320668974914e-17 1.3357320668974914e-17 -0.040672434428423096
		0.010623797476912803 1.5847789000789857e-17 -0.040672434428423096
		0.031871392430738443 1.5308880605208553e-17 -0.031871392430738346
		0.040672434428423165 1.4007840647719458e-17 -0.010623797476912694
		0.040672434428423138 1.3357320668974914e-17 1.0862161824434793e-16
		0.040672434428423096 1.270680069023036e-17 0.010623797476912883
		0.031871392430738374 1.140576073274126e-17 0.031871392430738436
		0.01062379747691279 1.0866852337159962e-17 0.040672434428423165
		1.3357320668974914e-17 1.3357320668974914e-17 0.040672434428423117
		8.5078954235953106e-18 0.010623797476912803 0.040672434428423117
		4.3288899920473234e-18 0.031871392430738402 0.031871392430738416
		3.6757060562319033e-18 0.040672434428423138 0.010623797476912876
		4.3262260349764661e-18 0.040672434428423117 7.5883900196103648e-17
		4.9767460137210203e-18 0.040672434428423117 -0.010623797476912732
		8.232009864514622e-18 0.031871392430738402 -0.031871392430738374
		1.3488832087225212e-17 0.010623797476912803 -0.040672434428423096
		1.5847789000789857e-17 1.4486207498224713e-17 -0.040672434428423096
		1.8206745914354496e-17 -0.010623797476912803 -0.040672434428423096
		2.238575134590251e-17 -0.031871392430738443 -0.031871392430738346
		2.3038935281717925e-17 -0.040672434428423165 -0.010623797476912694
		2.2388415302973362e-17 -0.040672434428423138 1.0862161824434793e-16
		2.1737895324228802e-17 -0.040672434428423096 0.010623797476912883
		1.8482631473435204e-17 -0.031871392430738374 0.031871392430738436
		1.3225809250724601e-17 -0.01062379747691279 0.040672434428423165
		1.0866852337159962e-17 2.8032849449222395e-17 0.040672434428423117
		-0.010623797476912803 1.0866852337159962e-17 0.040672434428423117
		-0.031871392430738402 1.140576073274126e-17 0.031871392430738416
		-0.040672434428423138 1.270680069023036e-17 0.010623797476912876
		-0.040672434428423117 1.3357320668974914e-17 7.5883900196103648e-17
		;
createNode transform -n "edge_6_poserOrient" -p "skin_10_poser";
	rename -uid "1568976A-4F0F-ADA5-BB75-8CAE56AC1A37";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_6_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_10_poser_group|skin_10_poser|edge_6_poserOrient";
	rename -uid "F4998ACA-4576-41C5-27C1-24BDFF054174";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_6_poser_initLoc" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_10_poser_group|skin_10_poser|edge_6_poserOrient";
	rename -uid "243E2C23-4A9B-762A-6A2D-C7B86FF65A77";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_6_poser_initLocShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_10_poser_group|skin_10_poser|edge_6_poserOrient|edge_6_poser_initLoc";
	rename -uid "9335A1B2-47D6-F9B1-4B60-7B80043539E8";
	setAttr -k off ".v";
createNode pointConstraint -n "skin_10_poser_group_pointConstraint1" -p "skin_10_poser_group";
	rename -uid "4AA24AEE-4EA5-3CD6-44E2-0B80F7FC45EA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_2_4_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 39.351940807715408 -0.32910392830541113 -2.8226709301641622 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "skin_11_poser_group" -p "skin_posers";
	rename -uid "0272AFA3-47A3-2EDA-40E6-40AC11FA9E20";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "skin_11_poser" -p "skin_11_poser_group";
	rename -uid "75B0C895-4C50-248C-CB48-E886CA475A13";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0 4.4408920985006262e-16 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_11_poserNurbsShape" -p "skin_11_poser";
	rename -uid "FD404078-4C9B-3ED7-82E2-CC81394B8AAD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
createNode locator -n "skin_11_poser_locShape" -p "skin_11_poser";
	rename -uid "36E429BF-4393-29E1-0EB7-B59ABB829A2C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "skin_11_poserShapeOrig" -p "skin_11_poser";
	rename -uid "03CEA8D5-4932-8E4F-7F12-439222C72C73";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".cc" -type "nurbsCurve" 
		3 46 0 no 3
		51 2 2 2 3 4 4 4 5 6 6 6 7 8 8 8 9 10 10 10 11 12 12 12 13 14 14 14 15 16 16
		 16 17 18 18 18 19 20 20 20 21 22 22 22 23 24 24 24 25 26 26 26
		49
		-0.040672434428423117 1.3357320668974914e-17 8.830165531785147e-17
		-0.040672434428423165 -0.010623797476912803 8.5221447757645453e-17
		-0.031871392430738402 -0.031871392430738402 8.4580877696444362e-17
		-0.010623797476912803 -0.040672434428423138 8.5393361680607359e-17
		1.3357320668974914e-17 -0.040672434428423117 8.830165531785147e-17
		0.010623797476912791 -0.040672434428423165 8.6694401638096411e-17
		0.031871392430738402 -0.031871392430738443 8.8483997568911677e-17
		0.040672434428423138 -0.01062379747691279 9.0202384421275339e-17
		0.040672434428423117 1.3357320668974914e-17 8.830165531785147e-17
		0.040672434428423138 0.010623797476912828 9.1381862878057623e-17
		0.031871392430738402 0.031871392430738443 9.2022432939258664e-17
		0.010623797476912791 0.040672434428423165 9.1209948955095716e-17
		1.1099547010475297e-17 0.04067243442842302 9.0559428976351166e-17
		-0.010623797476912803 0.040672434428423138 8.9908908997606517e-17
		-0.031871392430738402 0.031871392430738402 8.811931306679135e-17
		-0.040672434428423165 0.010623797476912791 8.6400926214427725e-17
		-0.040672434428423165 6.5839996934760788e-18 8.37861080008523e-17
		-0.040672434428423117 1.4007840647719461e-17 -0.010623797476912732
		-0.031871392430738402 1.5308880605208556e-17 -0.031871392430738374
		-0.010623797476912803 1.5847789000789857e-17 -0.040672434428423096
		1.3357320668974914e-17 1.3357320668974914e-17 -0.040672434428423096
		0.010623797476912803 1.5847789000789857e-17 -0.040672434428423096
		0.031871392430738443 1.5308880605208553e-17 -0.031871392430738346
		0.040672434428423165 1.4007840647719458e-17 -0.010623797476912694
		0.040672434428423138 1.3357320668974914e-17 1.0862161824434793e-16
		0.040672434428423096 1.270680069023036e-17 0.010623797476912883
		0.031871392430738374 1.140576073274126e-17 0.031871392430738436
		0.01062379747691279 1.0866852337159962e-17 0.040672434428423165
		1.3357320668974914e-17 1.3357320668974914e-17 0.040672434428423117
		8.5078954235953106e-18 0.010623797476912803 0.040672434428423117
		4.3288899920473234e-18 0.031871392430738402 0.031871392430738416
		3.6757060562319033e-18 0.040672434428423138 0.010623797476912876
		4.3262260349764661e-18 0.040672434428423117 7.5883900196103648e-17
		4.9767460137210203e-18 0.040672434428423117 -0.010623797476912732
		8.232009864514622e-18 0.031871392430738402 -0.031871392430738374
		1.3488832087225212e-17 0.010623797476912803 -0.040672434428423096
		1.5847789000789857e-17 1.4486207498224713e-17 -0.040672434428423096
		1.8206745914354496e-17 -0.010623797476912803 -0.040672434428423096
		2.238575134590251e-17 -0.031871392430738443 -0.031871392430738346
		2.3038935281717925e-17 -0.040672434428423165 -0.010623797476912694
		2.2388415302973362e-17 -0.040672434428423138 1.0862161824434793e-16
		2.1737895324228802e-17 -0.040672434428423096 0.010623797476912883
		1.8482631473435204e-17 -0.031871392430738374 0.031871392430738436
		1.3225809250724601e-17 -0.01062379747691279 0.040672434428423165
		1.0866852337159962e-17 2.8032849449222395e-17 0.040672434428423117
		-0.010623797476912803 1.0866852337159962e-17 0.040672434428423117
		-0.031871392430738402 1.140576073274126e-17 0.031871392430738416
		-0.040672434428423138 1.270680069023036e-17 0.010623797476912876
		-0.040672434428423117 1.3357320668974914e-17 7.5883900196103648e-17
		;
createNode transform -n "edge_6_poserOrient" -p "skin_11_poser";
	rename -uid "151281DD-4320-9CDA-FC94-7E83BFF2C7DC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_6_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_11_poser_group|skin_11_poser|edge_6_poserOrient";
	rename -uid "5C3FA9DA-4759-D6C1-9F6A-FEB3FA558094";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "edge_6_poser_initLoc" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_11_poser_group|skin_11_poser|edge_6_poserOrient";
	rename -uid "D0CF372C-484F-6862-7CB4-819EBCCFA6E5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_6_poser_initLocShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_11_poser_group|skin_11_poser|edge_6_poserOrient|edge_6_poser_initLoc";
	rename -uid "AE5B47B7-4B50-F22C-2C9D-C0A6A05EE9FD";
	setAttr -k off ".v";
createNode pointConstraint -n "skin_11_poser_group_pointConstraint1" -p "skin_11_poser_group";
	rename -uid "BD28B2F0-44F9-1330-48DE-98B508C3CF00";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_4_poserW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "finger_1_4_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 41.427884882540035 -0.32910392830541113 7.0173039845045304 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "skin_2_poser_group" -p "skin_posers";
	rename -uid "DB7BEC73-4BC4-6564-1B0E-00A3095BEFF7";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "skin_2_poser" -p "skin_2_poser_group";
	rename -uid "50792FD7-4668-9645-2F0B-05BE98A99398";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.072982990377833054 -3.0531997285256249e-15 
		0.00088828288025559303 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_2_poserNurbsShape" -p "skin_2_poser";
	rename -uid "8029412E-4B44-1049-036F-6BBFA5F28F77";
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
createNode transform -n "edge_2_poserOrient" -p "skin_2_poser";
	rename -uid "FEA4AD12-445B-2CC5-6BAA-94A8DE8A3F31";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_2_poser_group|skin_2_poser|edge_2_poserOrient";
	rename -uid "7D0AB379-4BDA-54B2-3558-1FAADBB9705B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "skin_2_poser_aimConstraint1" -p "skin_2_poser";
	rename -uid "27BC8AFD-4E8E-381B-4327-6A89B0652800";
	addAttr -dcb 0 -ci true -sn "w0" -ln "skin_3_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 150.85112474280655 74.139106664916596 149.89552008963278 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "skin_2_poser_group_pointConstraint1" -p "skin_2_poser_group";
	rename -uid "2AE5EC1D-4CF3-E0B2-3DD9-02BDDFFA6970";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_4_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -1.5578023187753978 1.4449996337657716 -6.0631931147016207 ;
	setAttr -k on ".w0" 0.5;
	setAttr -k on ".w1";
createNode transform -n "skin_3_poser_group" -p "skin_posers";
	rename -uid "A4B4ABF2-44BD-93C2-91F9-69B8C5E181E6";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "skin_3_poser" -p "skin_3_poser_group";
	rename -uid "5529C457-4A60-AF43-F16B-FB9A85B37971";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "axises" -ln "axises" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "mCache" -ln "mCache" -nn "mCache" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "render" -ln "render" -nn "render" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.074060265736077269 -5.6035474086929417e-15 
		-0.0020337758322706368 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
	setAttr -l on ".axises";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".mCache";
	setAttr -l on ".render";
createNode nurbsSurface -n "skin_3_poserNurbsShape" -p "skin_3_poser";
	rename -uid "03221E57-49A1-75F0-4923-DF8DDD9703B5";
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
createNode transform -n "edge_2_poserOrient" -p "skin_3_poser";
	rename -uid "7D5A6449-450A-2867-8F34-CC842C0B60FA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "edge_2_poserOrientShape" -p "|mod|posers|mainPoser|main_posers_group|skin_posers|skin_3_poser_group|skin_3_poser|edge_2_poserOrient";
	rename -uid "B1A19D71-48B0-F514-415A-7F920B90197B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "skin_3_poser_aimConstraint1" -p "skin_3_poser";
	rename -uid "48AB298C-4417-8A1D-09A0-FFB8FE1B2E57";
	addAttr -dcb 0 -ci true -sn "w0" -ln "skin_4_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 150.85112474280632 74.139106664916582 149.89552008963258 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "skin_3_poser_group_pointConstraint1" -p "skin_3_poser_group";
	rename -uid "B60A2BCF-49FB-ED79-C886-EF84BE800EF0";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "skin_4_poserW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "skin_1_poserW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -1.5578023187753978 1.4449996337657716 -6.0631931147016207 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.5;
createNode transform -n "mainPoser_clusterHandle" -p "posers";
	rename -uid "6A4CC0B9-480D-048E-9C10-8391343D4FD8";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "3F222520-47DF-960D-BADE-D8B52DFE31EC";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "0E24BF45-4851-DB53-13AA-9AA7494B6A65";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "3A69A7C6-4E06-ADF1-1476-26B7A00BA7C0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "curve_posers" -p "posers";
	rename -uid "74CB551A-4E72-22B9-62E2-6DBAC2F8D708";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "posers_curve" -p "curve_posers";
	rename -uid "E587A844-4B57-25FC-50B7-3BA433B5B15E";
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "AF8D3DCF-42F3-B044-9BAB-05BFC5EAABDF";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 0.33333333333333331 0.66666666666666663 1
		4
		1.7170440532030744 10.710597520097707 -3.3209521025504385
		5.7263777670845366 10.351165894685552 -2.4629024382541735
		13.165987807217991 10.3560313634043 -3.7289536194499195
		21.469119539172329 10.264489831368035 -1.5391196755921359
		;
createNode transform -n "input" -p "mod";
	rename -uid "CC82F93A-41E8-51F1-6413-43A0A6569EA0";
	setAttr ".v" no;
createNode transform -n "ik_connector_main" -p "input";
	rename -uid "248D0253-4487-34BE-486C-308EAF37970E";
createNode transform -n "ik_connector" -p "ik_connector_main";
	rename -uid "3261B1E5-453C-5795-ECB4-EF969917A6CA";
createNode locator -n "ik_connectorShape" -p "ik_connector";
	rename -uid "CA2C85C9-4DAA-8A19-7709-E6A15560339F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "root_connector_init" -p "input";
	rename -uid "7B78C4BE-4991-E9B9-C105-22AB945BE96F";
createNode transform -n "root_connector" -p "root_connector_init";
	rename -uid "16C60F6A-409F-F6D5-7F5D-2E889CF64DA0";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "22919233-4087-CFE6-BD6B-CD83100D3C1E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "arm_init_connector" -p "root_connector";
	rename -uid "626C920F-450F-48A0-6143-849A672C6C6A";
createNode locator -n "arm_init_connectorShape" -p "arm_init_connector";
	rename -uid "10195350-4649-51B1-B395-B8955B2301B4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "arm_root_connector" -p "arm_init_connector";
	rename -uid "61A2FDDE-4E77-56CC-32AC-20A13247B459";
	setAttr ".opm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 0.99999999999999989 0 -4.4408920985006262e-16 0 -7.1054273576010019e-15 1;
createNode locator -n "arm_root_connectorShape" -p "arm_root_connector";
	rename -uid "12061DA5-4C0E-9260-94FD-94BC7EA19F8C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "connector_1" -p "arm_root_connector";
	rename -uid "B5CCFA2A-4DEC-DE28-5812-2CB88354711C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "connector_1Shape" -p "connector_1";
	rename -uid "3D87B837-41A4-C7DD-CF86-A992D5FC36DB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
createNode transform -n "connector_1_offset" -p "connector_1";
	rename -uid "9E16E0E2-4624-47C4-49A5-30B38A04ED62";
createNode transform -n "connector_2" -p "connector_1";
	rename -uid "BAFF77D2-4747-B35E-7E57-4BA189245574";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".dla" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "connector_2Shape" -p "connector_2";
	rename -uid "CBCF0AB9-42DD-10CA-619A-EF89BF1AF2F5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
createNode transform -n "connector_3_group" -p "connector_2";
	rename -uid "7144CD4C-4969-E1D8-EED3-3FA226380FD3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "connector_3" -p "connector_3_group";
	rename -uid "AE3EDFE8-411B-6FC1-BB2D-1699EC070CAA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "connector_3Shape" -p "connector_3";
	rename -uid "F23D43AC-423B-D04B-2CD6-73950C2A7E71";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
createNode transform -n "connector_2_offset" -p "connector_2";
	rename -uid "DE28EC30-45FF-391A-0974-4ABAD07CC94C";
	setAttr ".opm" -type "matrix" 0.98055626648980598 0.073497731341490236 -0.18195464197218669 0
		 -0.031653677561401083 0.97431007195386077 0.2229751743717257 0 0.19366840977405528 -0.21288017093406508 0.95769232004786986 0
		 5.0370587491883354 -0.22606270097196912 0.95610784602752696 1;
createNode transform -n "body_orient_connector" -p "root_connector";
	rename -uid "026BBEDC-43B0-09B4-92B9-49900D7B4B5A";
	setAttr ".dla" yes;
createNode transform -n "main_root_body_target" -p "body_orient_connector";
	rename -uid "508CDEF8-4C07-2C37-C3C1-7F8C4608B15C";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".opm" -type "matrix" 0.99999999999999978 0 0 0 0 0.99999999999999978 0 0
		 0 0 0.99999999999999967 0 0 0 0 1;
	setAttr ".dla" yes;
createNode transform -n "main_root_body_aim" -p "body_orient_connector";
	rename -uid "855E83AB-4D27-205E-7D45-4BAEAF8355F1";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".dla" yes;
createNode transform -n "controls" -p "mod";
	rename -uid "B105208E-4310-201F-D112-069A446C9033";
createNode transform -n "clav_group" -p "controls";
	rename -uid "D7DEAE99-4AD0-5691-3D8C-00A86279E08D";
createNode transform -n "clav_group_closed" -p "clav_group";
	rename -uid "FADD496E-4016-D54C-DB76-7F9F4FE44F5A";
	setAttr ".s" -type "double3" 1 0.99999999999999978 0.99999999999999967 ;
createNode transform -n "clav" -p "clav_group_closed";
	rename -uid "D910F469-4C1E-D93C-DA23-6FAD8942976F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "l_clav";
	setAttr -l on ".type" -type "string" "additionalControl";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"l_clav\", d= 3,p= [[1.777715429833373, 0.7218752934961462, 1.449287141867268], [1.7777154243450184, 1.2424200731528134, 1.4492871347832101], [1.777715413368309, 2.2835096318050496, 1.0180537055024759], [1.7777154065482568, 2.9303597520799483, -0.5435806422704632], [1.7777154133683106, 2.2835096270170143, -2.1052149724375244], [1.7777154243450204, 1.2424200670370904, -2.5400404679601825], [1.7777154298333753, 0.7218752873804236, -2.5400404608761225]], k = [0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0])']";
createNode joint -n "l_clav_joint" -p "clav";
	rename -uid "CF628BC0-4B46-D5DD-6537-BC89E175B439";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ds" 2;
createNode nurbsCurve -n "clavShape" -p "clav";
	rename -uid "E6C79BBE-4602-CC90-5FF4-588A5B853F4A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		3.274319486089412 -1.2113057583246885 3.1789322437109639
		3.2743194771224129 -0.36082862806350996 3.1789322321368845
		3.274319459188439 1.3401256313787275 2.4743738853040416
		3.2743194480456901 2.3969631129943085 -0.077057519861915183
		3.274319459188439 1.3401256235559256 -2.6284888962630166
		2.5987158384219562 -0.3608286380555043 -3.3389160373063311
		1.9891970499867022 -1.2113057683166759 -3.3389160257322401
		;
createNode transform -n "l_clav_out_loc_1" -p "clav";
	rename -uid "A063997B-4BD9-D889-A7C4-449305E4006E";
	setAttr ".v" no;
createNode locator -n "l_clav_out_loc_1Shape" -p "l_clav_out_loc_1";
	rename -uid "FE29B7BB-40B7-6344-8A9C-E394F963711B";
	setAttr -k off ".v";
createNode transform -n "l_clav_out_loc_2" -p "l_clav_out_loc_1";
	rename -uid "3B776078-4A75-3C25-AD64-929A0AA1E932";
createNode locator -n "l_clav_out_loc_2Shape" -p "l_clav_out_loc_2";
	rename -uid "EE688833-4789-CF91-56C3-00810098346A";
	setAttr -k off ".v";
createNode orientConstraint -n "l_clav_out_loc1_orientConstraint1" -p "l_clav_out_loc_2";
	rename -uid "88EAC1BB-426E-CAE9-CE7B-53B0217CC2B2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "body_orient_connectorW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "l_clav_out_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rsrr" -type "double3" -1.6368674971985092e-15 1.6896696745274934e-15 -6.5847421139674367e-16 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "l_clavClosed_out_loc" -p "clav";
	rename -uid "2215FD26-43F1-3FC1-0659-4187E8477FB5";
	setAttr ".v" no;
createNode locator -n "l_clavClosed_out_locShape" -p "l_clavClosed_out_loc";
	rename -uid "32AC55C4-492A-7235-80BF-13B0E9230661";
	setAttr -k off ".v";
createNode transform -n "clav_closed" -p "clav_group";
	rename -uid "451B1DCC-4C2E-E557-EF1E-2E9085092D36";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "l_clav";
	setAttr -l on ".type" -type "string" "additionalControl";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"l_clav\", d= 3,p= [[1.777715429833373, 0.7218752934961462, 1.449287141867268], [1.7777154243450184, 1.2424200731528134, 1.4492871347832101], [1.777715413368309, 2.2835096318050496, 1.0180537055024759], [1.7777154065482568, 2.9303597520799483, -0.5435806422704632], [1.7777154133683106, 2.2835096270170143, -2.1052149724375244], [1.7777154243450204, 1.2424200670370904, -2.5400404679601825], [1.7777154298333753, 0.7218752873804236, -2.5400404608761225]], k = [0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0])']";
createNode nurbsCurve -n "clav_closedShape" -p "clav_closed";
	rename -uid "773444B2-4C36-8AF3-0672-DA80F55A5E3A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		3.274319486089412 -1.2113057583246885 3.1789322437109639
		3.2743194771224129 -0.36082862806350996 3.1789322321368845
		3.274319459188439 1.3401256313787275 2.4743738853040416
		3.2743194480456901 2.3969631129943085 -0.077057519861915183
		3.274319459188439 1.3401256235559256 -2.6284888962630166
		2.5987158384219562 -0.3608286380555043 -3.3389160373063311
		1.9891970499867022 -1.2113057683166759 -3.3389160257322401
		;
createNode transform -n "arm_controls" -p "controls";
	rename -uid "B5DA7BC7-4FCC-0C62-CD36-A89F66C6FB4E";
createNode transform -n "control_group" -p "arm_controls";
	rename -uid "47074366-4EC3-B89B-8DAB-2196CEDC4C87";
createNode transform -n "control" -p "control_group";
	rename -uid "F585C6AA-41CC-806E-A43D-3D9326D813DD";
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
	addAttr -ci true -sn "default_ikFk" -ln "default_ikFk" -dt "string";
	addAttr -ci true -sn "default_autoStretch" -ln "default_autoStretch" -dt "string";
	addAttr -ci true -sn "default_softIk" -ln "default_softIk" -dt "string";
	addAttr -ci true -sn "default_stretchVolume" -ln "default_stretchVolume" -dt "string";
	addAttr -ci true -sn "default_length1" -ln "default_length1" -dt "string";
	addAttr -ci true -sn "default_length2" -ln "default_length2" -dt "string";
	addAttr -ci true -sn "default_snap" -ln "default_snap" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "shouldersGlobal" -ln "shouldersGlobal" -dv 1 -min 0 -max 1 
		-at "double";
	addAttr -ci true -sn "default_close" -ln "default_close" -dt "string";
	addAttr -ci true -sn "default_______________________" -ln "default_______________________" 
		-dt "string";
	addAttr -ci true -sn "default_wingAddControls" -ln "default_wingAddControls" -dt "string";
	addAttr -ci true -sn "default_layersControls" -ln "default_layersControls" -dt "string";
	addAttr -ci true -sn "default_feathersControls0" -ln "default_feathersControls0" 
		-dt "string";
	addAttr -ci true -sn "default_feathersControls1" -ln "default_feathersControls1" 
		-dt "string";
	addAttr -ci true -sn "default_feathersControls2" -ln "default_feathersControls2" 
		-dt "string";
	addAttr -ci true -sn "default_feathersControls3" -ln "default_feathersControls3" 
		-dt "string";
	addAttr -ci true -sn "default_feathersControls4" -ln "default_feathersControls4" 
		-dt "string";
	addAttr -ci true -sn "default_feathersControls5" -ln "default_feathersControls5" 
		-dt "string";
	addAttr -ci true -sn "default_feathersControls6" -ln "default_feathersControls6" 
		-dt "string";
	addAttr -ci true -sn "default_edgeControls" -ln "default_edgeControls" -dt "string";
	addAttr -ci true -sn "global" -ln "global" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "______________________" -ln "______________________" -min 
		0 -max 0 -en "Feathers" -at "enum";
	addAttr -ci true -sn "close" -ln "close" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "wingAddControls" -ln "wingAddControls" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "layersControls" -ln "layersControls" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls0" -ln "feathersControls0" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls1" -ln "feathersControls1" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls2" -ln "feathersControls2" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls3" -ln "feathersControls3" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls4" -ln "feathersControls4" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls5" -ln "feathersControls5" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "feathersControls6" -ln "feathersControls6" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "edgeControls" -ln "edgeControls" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
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
	setAttr -k on ".autoStretch" 0;
	setAttr -k on ".softIk" 4;
	setAttr -l on ".stretchVolume";
	setAttr -k on ".length1" 0.99999999945611284;
	setAttr -k on ".length2" 0.99999981389497772;
	setAttr -l on ".constanta";
	setAttr -k on ".snap";
	setAttr -l on ".internalName" -type "string" "control";
	setAttr ".default_ikFk" -type "string" "1.0";
	setAttr ".default_autoStretch" -type "string" "1.0";
	setAttr ".default_softIk" -type "string" "4.0";
	setAttr ".default_stretchVolume" -type "string" "1.0";
	setAttr ".default_length1" -type "string" "1.0";
	setAttr ".default_length2" -type "string" "1.0";
	setAttr ".default_snap" -type "string" "0.0";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".shouldersGlobal";
	setAttr ".default_close" -type "string" "0.0";
	setAttr ".default_______________________" -type "string" "0";
	setAttr ".default_wingAddControls" -type "string" "True";
	setAttr ".default_layersControls" -type "string" "False";
	setAttr ".default_feathersControls0" -type "string" "False";
	setAttr ".default_feathersControls1" -type "string" "False";
	setAttr ".default_feathersControls2" -type "string" "False";
	setAttr ".default_feathersControls3" -type "string" "False";
	setAttr ".default_feathersControls4" -type "string" "False";
	setAttr ".default_feathersControls5" -type "string" "False";
	setAttr ".default_feathersControls6" -type "string" "False";
	setAttr ".default_edgeControls" -type "string" "True";
	setAttr -k on ".global";
	setAttr -cb on ".______________________";
	setAttr -k on ".close";
	setAttr -cb on ".wingAddControls";
	setAttr -cb on ".layersControls";
	setAttr -cb on ".feathersControls0" yes;
	setAttr -cb on ".feathersControls1";
	setAttr -cb on ".feathersControls2";
	setAttr -cb on ".feathersControls3";
	setAttr -cb on ".feathersControls4";
	setAttr -cb on ".feathersControls5";
	setAttr -cb on ".feathersControls6";
	setAttr -cb on ".edgeControls";
createNode nurbsCurve -n "controlShape" -p "control";
	rename -uid "1042D0B9-4B41-40FB-238F-C192C336EE59";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		1.1954081850641616 1.184357421140982 -1.859790009056171
		1.1954081850641616 2.1433331581304249 -1.8532939155335377
		1.8347400110497043 1.8236745791339546 -1.855459280041085
		1.1954081850641616 1.5040160001374676 -1.8576246445486269
		;
createNode transform -n "fk_controls" -p "arm_controls";
	rename -uid "F0D813A3-4DAB-6810-7E5A-73821651F04B";
	setAttr ".t" -type "double3" 0 -3.5527136788005009e-15 -3.5527136788005009e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode transform -n "fk_a_group" -p "fk_controls";
	rename -uid "B2AA5EE0-4018-6F49-041B-ECACFBDF774B";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 0 -5.5511151231257827e-17 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999967 ;
createNode transform -n "fk_a_closedGroup" -p "fk_a_group";
	rename -uid "6948D0DF-4CCC-BB42-1A88-289774872B6F";
createNode transform -n "fk_a" -p "fk_a_closedGroup";
	rename -uid "55C5641C-465B-E463-E0CA-5FA01B3DD6E2";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1.7763568394002505e-15 8.8817841970012523e-16 -8.8817841970012523e-16 ;
	setAttr ".ro" 1;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_a";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_translateX" -type "string" "-1.7763568394002505e-15";
	setAttr ".default_translateY" -type "string" "8.881784197001252e-16";
	setAttr ".default_translateZ" -type "string" "-8.881784197001252e-16";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
createNode nurbsCurve -n "fk_aShape" -p "fk_a";
	rename -uid "07107EB1-43FD-6E47-FC47-4DAC98F49E83";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.71138628181017272 0.51178557711437977 -1.7795165732494413
		0.7113862818101726 1.8555288030655551e-15 -1.9915051003171587
		0.71138628181017272 -0.51178557711437733 -1.7795165732494422
		0.7113862818101726 -0.72377410418209487 -5.6095700126192116e-16
		0.71138628181017194 -0.51178557711437689 1.1549172967524106
		0.71138628181017194 2.6081939310061743e-15 1.3669058238201273
		0.71138628181017194 0.51178557711438 1.1549172967524106
		0.71138628181017294 0.72377410418209487 3.7515109978938951e-17
		0.71138628181017272 0.51178557711437977 -1.7795165732494413
		0.7113862818101726 1.8555288030655551e-15 -1.9915051003171587
		0.71138628181017272 -0.51178557711437733 -1.7795165732494422
		;
createNode joint -n "a_fkJoint" -p "fk_a";
	rename -uid "360D09E7-455E-6179-C0D5-C0B7A735FD26";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ds" 2;
createNode transform -n "fk_b_group" -p "fk_a";
	rename -uid "1E6EA266-4C44-4C50-2A4E-848D6E03E1B6";
	setAttr ".t" -type "double3" 9.4096872870091346 0 1.6653345369377348e-16 ;
createNode transform -n "fk_b_group_1" -p "fk_b_group";
	rename -uid "27E7AB48-4864-01A2-0F72-7183A72B317A";
createNode transform -n "fk_b" -p "fk_b_group_1";
	rename -uid "5E4CE8C2-4781-CCCE-E55C-20A5499D1697";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 1;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_b";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "fk_bShape" -p "fk_b";
	rename -uid "DB5D7BD1-4ECA-9EA6-B800-A2A68505059F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.6209093760722805e-15 0.69618585970578295 -1.7142439490615369
		3.7640590710442633e-15 3.3081944661100013e-15 -2.0026135740840432
		3.8181809698853792e-15 -0.69618585970577496 -1.7142439490615378
		-2.4466664604463326e-15 -0.98455548472828425 -1.6054549445457549e-16
		-3.3551440445028508e-15 -0.69618585970577396 1.3769932451983204
		-3.3873284679549665e-15 3.7344773558425338e-15 1.665362870220827
		-3.7496872321290418e-15 0.69618585970578262 1.3769932451983207
		-2.052123272820136e-15 0.98455548472828425 6.5356072484013998e-16
		3.6209093760722805e-15 0.69618585970578295 -1.7142439490615369
		3.7640590710442633e-15 3.3081944661100013e-15 -2.0026135740840432
		3.8181809698853792e-15 -0.69618585970577496 -1.7142439490615378
		;
createNode joint -n "b_fkJoint" -p "fk_b";
	rename -uid "2A114410-49E8-658E-0961-ECA13513CDF8";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".is" -type "double3" 1.0000303983688354 1 1 ;
	setAttr ".ds" 2;
createNode transform -n "fk_end_group" -p "fk_b";
	rename -uid "CFC78F9A-4649-9162-1A6E-2D957214450B";
	setAttr ".s" -type "double3" 0.99999191367389451 1.0000000000000009 1.0000179037244814 ;
	setAttr ".sh" -type "double3" 0 1.5136983945333165e-05 0 ;
createNode transform -n "fk_end_group_1" -p "fk_end_group";
	rename -uid "6835D6FC-4A4C-46DB-F039-4294808AB683";
createNode transform -n "fk_end" -p "fk_end_group_1";
	rename -uid "690897C9-4027-8A2F-1F12-EABC7A772A77";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_end";
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "fk_endShape" -p "fk_end";
	rename -uid "5C08F37A-45CB-4DEA-8475-8CB86BB01653";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0317302140647942e-06 0.41446704401428697 -1.1390431994916914
		3.0718669302493375e-07 0.58614491480169206 -1.4486799719582477e-05
		-3.5973026345556048e-06 0.41446704401428458 0.81090236935421589
		-5.3945408676320432e-06 -1.9874397685034573e-15 0.98258435769766983
		-4.0317302242810381e-06 -0.41446704401428991 0.81092285678285436
		-3.0718669607702083e-07 -0.58614491480169206 1.4486799719825938e-05
		3.5973026242366068e-06 -0.41446704401428686 -1.1390227120630521
		5.394540857357088e-06 7.0584055392790563e-16 -1.3107047004065062
		4.0317302140647942e-06 0.41446704401428697 -1.1390431994916914
		3.0718669302493375e-07 0.58614491480169206 -1.4486799719582477e-05
		-3.5973026345556048e-06 0.41446704401428458 0.81090236935421589
		;
createNode joint -n "end_fkJoint" -p "fk_end";
	rename -uid "24E58E6C-4A0D-CC26-0C0E-09AF0C328417";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0 0 -4.4406888105932846e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ds" 2;
createNode transform -n "ik_controls" -p "arm_controls";
	rename -uid "CB3440CB-480A-6CB1-0DD1-9FBB95EA8839";
	setAttr ".t" -type "double3" 0 -3.5527136788005009e-15 -3.5527136788005009e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode transform -n "ik_end_init" -p "ik_controls";
	rename -uid "EBDFA547-4A78-D148-204E-73BFE9B34C4C";
createNode transform -n "ik_end_mirror" -p "ik_end_init";
	rename -uid "7B352243-4DEF-22AA-6247-368CC9B833DC";
createNode transform -n "ik_end_closed" -p "ik_end_mirror";
	rename -uid "3CE97958-4DB0-9655-41B4-0191D5DD1494";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "dynamicParentRevMultMatrixX" -ln "dynamicParentRevMultMatrixX" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -15.159481986387153 -10.365178518604891 7.3299279301675346 ;
	setAttr ".r" -type "double3" -159.38147941808776 182.9631116015623 -245.58620438370892 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_end";
	setAttr -l on ".mirrorShape" yes;
	setAttr ".dynamicParentRevMultMatrixX" yes;
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "ik_end_closedShape" -p "ik_end_closed";
	rename -uid "81497B2D-4B12-9D17-CBF9-B8BC90F30AC6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.59476577945494469 0.59501077837289773 1.0926852821146265
		-0.59476577945494113 0.59500996066535972 -1.3072432162166834
		0.59476577945494402 0.59500996066535972 -1.3072432162166834
		0.59476577945494047 0.59500996066536183 1.0926852821146265
		-0.59476577945494469 0.59500996066536183 1.0926852821146265
		0.59476577945494047 0.59500996066536183 1.0926852821146265
		0.59476577945494047 -0.59501032416190536 1.0926852821146265
		-0.59476577945494469 -0.59501032416190536 1.0926852821146265
		-0.59476577945494469 0.59500996066536183 1.0926852821146265
		-0.59476577945494469 -0.59501032416190536 1.0926852821146265
		-0.59476577945494113 -0.59501032416190747 -1.3072432162166834
		-0.59476577945494113 0.59500996066535972 -1.3072432162166834
		-0.59476577945494113 -0.59501032416190747 -1.3072432162166834
		0.59476577945494402 -0.59501032416190747 -1.3072432162166834
		0.59476577945494402 0.59500996066535972 -1.3072432162166834
		0.59476577945494402 -0.59501032416190747 -1.3072432162166834
		0.59476577945494047 -0.59501032416190536 1.0926852821146265
		;
createNode ikHandle -n "fk_closed_ikHandle" -p "ik_end_closed";
	rename -uid "D23A1C5A-42B4-B795-833B-A98B2515728D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 7.8324156049802696e-09 1.2233556834218007e-08 1.1188987514287874e-09 ;
	setAttr ".r" -type "double3" -11.405788577381486 24.353687843602049 115.36654911704382 ;
	setAttr ".s" -type "double3" 3.1981210821036981 3.1981210821036989 3.1981210821036989 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle1_poleVectorConstraint1" -p "fk_closed_ikHandle";
	rename -uid "7F172360-43B8-AC12-D785-1B98D33435AE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "l_arm_ik_aim_closed1W0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.34925171639906383 -2.5133771402950664 -8.7446535408527062 ;
	setAttr -k on ".w0";
createNode transform -n "ik_end_closedGroup" -p "ik_end_mirror";
	rename -uid "7113D78F-4E68-2423-A3B2-78B986EEBD87";
createNode transform -n "ik_end_group" -p "ik_end_closedGroup";
	rename -uid "02F1F3BF-40FD-E607-B1DB-17837A5DBC1C";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 8.8817841970012523e-16 1.27675647831893e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode transform -n "ik_end_group_1" -p "ik_end_group";
	rename -uid "3D2017A4-409B-9C66-E197-008BE2A57F7D";
createNode transform -n "ik_end_group_2" -p "ik_end_group_1";
	rename -uid "BA1AC7F3-4DA1-7C48-61CC-A999EF83122A";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "dynamicParentRevMultMatrixX" -ln "dynamicParentRevMultMatrixX" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_end";
	setAttr -l on ".mirrorShape" yes;
	setAttr ".dynamicParentRevMultMatrixX" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "ik_end" -p "ik_end_group_2";
	rename -uid "2E152A5D-4736-36DF-B0DE-7B8E9CC03434";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "dynamicParentRevMultMatrixX" -ln "dynamicParentRevMultMatrixX" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".r" -type "double3" 0 0 0 ;
	setAttr -av ".rx";
	setAttr -av ".ry";
	setAttr -av ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_end";
	setAttr -l on ".mirrorShape" yes;
	setAttr ".dynamicParentRevMultMatrixX" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "ik_endShape" -p "ik_end";
	rename -uid "EC221788-44C3-49B5-15C2-9CA4802D9366";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.59476577945494469 0.59501077837289773 1.0926852821146265
		-0.59476577945494113 0.59500996066535972 -1.3072432162166834
		0.59476577945494402 0.59500996066535972 -1.3072432162166834
		0.59476577945494047 0.59500996066536183 1.0926852821146265
		-0.59476577945494469 0.59500996066536183 1.0926852821146265
		0.59476577945494047 0.59500996066536183 1.0926852821146265
		0.59476577945494047 -0.59501032416190536 1.0926852821146265
		-0.59476577945494469 -0.59501032416190536 1.0926852821146265
		-0.59476577945494469 0.59500996066536183 1.0926852821146265
		-0.59476577945494469 -0.59501032416190536 1.0926852821146265
		-0.59476577945494113 -0.59501032416190747 -1.3072432162166834
		-0.59476577945494113 0.59500996066535972 -1.3072432162166834
		-0.59476577945494113 -0.59501032416190747 -1.3072432162166834
		0.59476577945494402 -0.59501032416190747 -1.3072432162166834
		0.59476577945494402 0.59500996066535972 -1.3072432162166834
		0.59476577945494402 -0.59501032416190747 -1.3072432162166834
		0.59476577945494047 -0.59501032416190536 1.0926852821146265
		;
createNode transform -n "ik_end_out_rot" -p "ik_end";
	rename -uid "8B61C300-4AB0-5C77-DAE0-408AB89AE3D4";
	setAttr ".v" no;
createNode transform -n "ik_end_out_init" -p "ik_end";
	rename -uid "6D4B2ADF-4775-888F-49BF-BB988315287F";
createNode transform -n "ik_end_out" -p "ik_end_out_init";
	rename -uid "133C9EEB-48F2-4DD8-0E39-BE82E6EC900E";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 0 -3.4346083563738136e-26 ;
createNode locator -n "ik_end_outShape" -p "ik_end_out";
	rename -uid "E12DDECA-476A-B305-F940-95A4CD7A4037";
	setAttr -k off ".v";
createNode transform -n "pCube1" -p "ik_end";
	rename -uid "752C8ADF-405D-F9ED-D095-4CA3DD741B97";
	setAttr ".t" -type "double3" 1.7991440671850043 1.5328237369273801 -1.2368181364747961 ;
	setAttr ".s" -type "double3" 1.2468827930174571 1.2468827930174569 1.2468827930174569 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "11A98344-4841-99C0-BB49-A5A018010F88";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube2" -p "ik_end";
	rename -uid "4FC24AB6-4F2E-9807-326D-25A6B5A38424";
	setAttr ".t" -type "double3" 1.2848401130201239 1.5328237369273801 2.0963364183500821 ;
	setAttr ".s" -type "double3" 1.2468827930174571 1.2468827930174569 1.2468827930174569 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	rename -uid "B3112760-4B9C-ECB5-4FE6-D8883AD2B54D";
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
createNode transform -n "pCube3" -p "ik_end";
	rename -uid "CD3DFC52-4844-DE11-6953-ECBD20EDAA0B";
	setAttr ".t" -type "double3" 2.4764169304065895 1.5328249260474749 -0.23335224023935575 ;
	setAttr ".s" -type "double3" 1.2468827930174571 1.2468827930174569 1.2468827930174569 ;
createNode mesh -n "pCubeShape3" -p "pCube3";
	rename -uid "52DB1676-4937-7294-4F6D-1582A7E88500";
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
createNode transform -n "ik_root_group" -p "ik_controls";
	rename -uid "D13464CE-4A6D-0F2C-133B-5790439DBF53";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode transform -n "ik_root" -p "ik_root_group";
	rename -uid "738F0032-498C-2420-4F56-9EB64C49BF9B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_root";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "ik_rootShape" -p "ik_root";
	rename -uid "C88F5EC8-4539-D8A7-EF98-1E88CCC847E3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.62491115938632547 0.62491115938632369 0.62491115938632369
		-0.62491115938632547 0.62491115938632369 -0.62491115938632369
		0.62491115938632358 0.62491115938632369 -0.62491115938632369
		0.62491115938632358 0.62491115938632369 0.62491115938632369
		-0.62491115938632547 0.62491115938632369 0.62491115938632369
		0.62491115938632358 0.62491115938632369 0.62491115938632369
		0.62491115938632358 -0.62491115938632369 0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 0.62491115938632369
		-0.62491115938632547 0.62491115938632369 0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 -0.62491115938632369
		-0.62491115938632547 0.62491115938632369 -0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 -0.62491115938632369
		0.62491115938632358 -0.62491115938632369 -0.62491115938632369
		0.62491115938632358 0.62491115938632369 -0.62491115938632369
		0.62491115938632358 -0.62491115938632369 -0.62491115938632369
		0.62491115938632358 -0.62491115938632369 0.62491115938632369
		;
createNode transform -n "snap_root_loc" -p "ik_root";
	rename -uid "E68737BE-400B-340A-D173-B8A4F86243D8";
	setAttr ".v" no;
	setAttr ".sh" -type "double3" 0.0019699791094384997 -0.0050284108131751857 0.00029646444186807758 ;
createNode locator -n "snap_root_locShape" -p "snap_root_loc";
	rename -uid "17FC597D-4983-0624-477E-BCA07A2EFDBF";
	setAttr -k off ".v";
createNode transform -n "aim_curve" -p "ik_controls";
	rename -uid "140A1B9F-45D5-E86D-206E-00A0A9773E14";
	setAttr ".tmp" yes;
	setAttr ".it" no;
createNode nurbsCurve -n "aim_curveShape" -p "aim_curve";
	rename -uid "8BBF6C9F-4281-EBAB-C5F2-9C9ACDDB3D64";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		13.165988233472554 10.356031262170992 -3.7289499204626386
		14.340077400207511 10.888607978820795 -23.687358856201165
		;
createNode transform -n "ik_root_closed" -p "ik_controls";
	rename -uid "C050CF28-4BCA-AF82-3324-5EA9517D63F4";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1.5512269981968263 1.5393168255128207 0.94972697588167954 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_root";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "ik_root_closedShape" -p "ik_root_closed";
	rename -uid "B752893D-411D-CB46-3B69-1988F421592E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.62491115938632547 0.62491115938632369 0.62491115938632369
		-0.62491115938632547 0.62491115938632369 -0.62491115938632369
		0.62491115938632358 0.62491115938632369 -0.62491115938632369
		0.62491115938632358 0.62491115938632369 0.62491115938632369
		-0.62491115938632547 0.62491115938632369 0.62491115938632369
		0.62491115938632358 0.62491115938632369 0.62491115938632369
		0.62491115938632358 -0.62491115938632369 0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 0.62491115938632369
		-0.62491115938632547 0.62491115938632369 0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 -0.62491115938632369
		-0.62491115938632547 0.62491115938632369 -0.62491115938632369
		-0.62491115938632547 -0.62491115938632369 -0.62491115938632369
		0.62491115938632358 -0.62491115938632369 -0.62491115938632369
		0.62491115938632358 0.62491115938632369 -0.62491115938632369
		0.62491115938632358 -0.62491115938632369 -0.62491115938632369
		0.62491115938632358 -0.62491115938632369 0.62491115938632369
		;
createNode joint -n "fk_root_closedJoint" -p "ik_root_closed";
	rename -uid "601EE7E7-4730-A0C4-80F7-809EA7FF24D7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" -177.96474151024395 10.537345709103377 -67.232863526398646 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode joint -n "fk_middle_closedJoint" -p "fk_root_closedJoint";
	rename -uid "D6EBCE9E-4592-1106-A489-77811F33ABE8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 9.4096870422363281 -8.8817841970012523e-16 1.7763568394002505e-15 ;
	setAttr ".r" -type "double3" -3.2603903673695597e-30 82.311710660019273 3.8709262936213029e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 10 0 ;
	setAttr ".bps" -type "matrix" 1.0000259339796214 0 -0.0029881482422647126 0 0 1 0 0
		 0.0029880574101934557 0 0.9999955357464918 0 2.236129877159025 0 0.005211601042381415 1;
createNode joint -n "fk_end_closedJoint" -p "fk_middle_closedJoint";
	rename -uid "F61BEFD3-49EC-C4CA-1EED-92A272A28597";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 10.707647323608398 0 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode orientConstraint -n "fk_end_closedJoint_orientConstraint1" -p "fk_end_closedJoint";
	rename -uid "B63DEBE0-4EA6-A62C-16EF-4782898293C5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "l_arm_ik_end_closedW0" -dv 1 -min 
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
	setAttr ".lr" -type "double3" -149.79305714950311 296.5591616056272 -363.53067590573824 ;
	setAttr ".rsrr" -type "double3" -179.99999999999997 180 -180 ;
	setAttr -k on ".w0";
createNode ikEffector -n "effector1" -p "fk_middle_closedJoint";
	rename -uid "3FAE6C01-4606-0289-ED35-85970F0F0A55";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "fk_close_loc_3" -p "fk_root_closedJoint";
	rename -uid "47F6F416-43DE-209E-DE1F-ADACDB62DF58";
	setAttr ".r" -type "double3" 180 0 0 ;
createNode locator -n "fk_close_loc_Shape3" -p "fk_close_loc_3";
	rename -uid "3C81A029-46F1-554E-18B0-D2A6DF13E124";
	setAttr -k off ".v";
createNode transform -n "fk_close_loc_2_group" -p "fk_close_loc_3";
	rename -uid "C8EA6382-4B46-FD8B-9762-3B9774B344FB";
createNode transform -n "fk_close_loc_2" -p "fk_close_loc_2_group";
	rename -uid "EB63788F-4393-80F0-8459-93A2F9B41308";
createNode locator -n "fk_close_loc_Shape2" -p "fk_close_loc_2";
	rename -uid "0E36E9FF-44AB-F34A-2501-66A471153373";
	setAttr -k off ".v";
createNode orientConstraint -n "locator24_orientConstraint1" -p "fk_close_loc_2";
	rename -uid "46A17B9E-4440-7380-D1ED-55A0C4931A1F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "fk_middle_closedJointW0" -dv 1 -min 
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
	setAttr ".lr" -type "double3" 179.99999999999977 -57.871130564543762 2.5014257969812966e-13 ;
	setAttr ".o" -type "double3" 180 0 0 ;
	setAttr ".rsrr" -type "double3" -180 180.00000000000003 -180 ;
	setAttr -k on ".w0";
createNode transform -n "fk_close_loc_1_group" -p "fk_close_loc_2";
	rename -uid "51DB1DE1-4A5D-5586-25F7-859A8DF41226";
createNode transform -n "fk_close_loc_1" -p "fk_close_loc_1_group";
	rename -uid "A19084A1-4646-3FE8-5291-2B80C1BD433C";
createNode locator -n "fk_close_loc_Shape1" -p "fk_close_loc_1";
	rename -uid "BF8891F1-4F18-62D8-37D3-5083878AE179";
	setAttr -k off ".v";
createNode parentConstraint -n "locator25_parentConstraint1" -p "fk_close_loc_1";
	rename -uid "2300B2A4-418F-0822-3FAE-F6A049CD2BC5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "fk_end_closedJointW0" -dv 1 -min 
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
	setAttr ".tg[0].tor" -type "double3" 3.2004331482226631e-14 5.7249984266343308e-14 
		-2.9022561468354588e-14 ;
	setAttr ".lr" -type "double3" -328.82706570548021 408.59267030167308 -356.08647525096552 ;
	setAttr ".rst" -type "double3" 0 -3.5527136788005009e-15 -5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -172.01924842799872 473.81381831201372 -218.15469477494563 ;
	setAttr -k on ".w0";
createNode transform -n "ik_aim_init" -p "ik_controls";
	rename -uid "9C0AB38A-4022-3125-9DEF-8D93FC2263B1";
createNode transform -n "ik_aim_mirror" -p "ik_aim_init";
	rename -uid "08227F3D-4245-2FA3-AC43-8B8926588CBE";
createNode transform -n "ik_aim_closedGroup" -p "ik_aim_mirror";
	rename -uid "66BB02E2-45EB-4098-5717-EF8DD8982F0F";
createNode transform -n "ik_aim_group" -p "ik_aim_closedGroup";
	rename -uid "B3F519EE-4F72-E22A-F874-5BBFCB75A164";
	setAttr ".t" -type "double3" 0 1.1102230246251565e-16 -4.4408920985006262e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode transform -n "ik_aim" -p "ik_aim_group";
	rename -uid "AAF64970-4427-F08A-249E-04AE02B5CF35";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -1.1102230246251565e-16 4.4408920985006262e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_aim";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "-1.1102230246251565e-16";
	setAttr ".default_translateZ" -type "string" "4.440892098500626e-16";
createNode nurbsCurve -n "ik_aimShape" -p "ik_aim";
	rename -uid "1FB68824-42D5-C22B-B268-73BD5293F998";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30268065435494218 -1.3367368059906392e-16 -0.30268065435494107
		-4.8835967093139572e-17 -1.2599671075064575e-16 -0.42805508645672191
		-0.30268065435494113 -1.3367368059906392e-16 -0.30268065435494113
		-0.42805508645672191 -1.5220752532504428e-16 -2.6289969388227922e-17
		-0.3026806543549419 -1.707413700510245e-16 0.30268065435494113
		-1.2898135152313614e-16 -1.7841833989944245e-16 0.42805508645672191
		0.30268065435494107 -1.707413700510245e-16 0.30268065435494113
		0.42805508645672191 -1.5220752532504428e-16 3.2765890753192721e-16
		0.30268065435494218 -1.3367368059906392e-16 -0.30268065435494107
		-4.8835967093139572e-17 -1.2599671075064575e-16 -0.42805508645672191
		-0.30268065435494113 -1.3367368059906392e-16 -0.30268065435494113
		;
createNode nurbsCurve -n "ik_aimShape1" -p "ik_aim";
	rename -uid "330C4C44-4D90-D83C-777B-F5BAEE971FFD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30268065435494218 0.30268065435494113 4.9074923985498636e-17
		-4.8835967093139572e-17 0.42805508645672191 2.8913177590176649e-17
		-0.30268065435494113 0.3026806543549419 4.9074923985498501e-17
		-0.42805508645672191 -2.8167870362605023e-17 9.7749685574211094e-17
		-0.3026806543549419 -0.30268065435494113 1.4642444716292376e-16
		-1.2898135152313614e-16 -0.42805508645672191 1.6658619355824584e-16
		0.30268065435494107 -0.3026806543549419 1.4642444716292384e-16
		0.42805508645672191 -3.8211674728275962e-16 9.7749685574211168e-17
		0.30268065435494218 0.30268065435494113 4.9074923985498636e-17
		-4.8835967093139572e-17 0.42805508645672191 2.8913177590176649e-17
		-0.30268065435494113 0.3026806543549419 4.9074923985498501e-17
		;
createNode nurbsCurve -n "ik_aimShape2" -p "ik_aim";
	rename -uid "B942F01F-47E6-B003-7D83-E5AECEFCBE37";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.8674761588712742e-17 0.30268065435494246 -0.30268065435494107
		-2.6210814574398448e-17 -2.0104349241818378e-16 -0.42805508645672191
		-8.5742451040673322e-17 -0.3026806543549419 -0.30268065435494113
		-9.5047322558432937e-17 -0.42805508645672191 -2.6289969388227922e-17
		-4.8674761588712711e-17 -0.3026806543549419 0.30268065435494113
		2.6210814574398383e-17 -2.8118887684818065e-16 0.42805508645672191
		8.5742451040673322e-17 0.30268065435494113 0.30268065435494113
		9.5047322558432937e-17 0.42805508645672191 3.2765890753192721e-16
		4.8674761588712742e-17 0.30268065435494246 -0.30268065435494107
		-2.6210814574398448e-17 -2.0104349241818378e-16 -0.42805508645672191
		-8.5742451040673322e-17 -0.3026806543549419 -0.30268065435494113
		;
createNode transform -n "curveEnd_locator" -p "ik_aim";
	rename -uid "26BC516B-42D6-3315-905D-BEB70E107E21";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687562 0 ;
createNode locator -n "curveEnd_locatorShape" -p "curveEnd_locator";
	rename -uid "E2A01E7B-4947-A044-526C-39890FF9BCBA";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_aim_closed" -p "ik_aim_mirror";
	rename -uid "4254D4E1-4D69-546F-8237-5DB34AE10C61";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -13.41788788548603 -5.2881418108808864 -4.3488369777384834 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_aim";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "ik_aim_closedShape" -p "ik_aim_closed";
	rename -uid "109AD1AC-4C90-D134-AC40-50B26396DB06";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30268065435494218 -1.3367368059906392e-16 -0.30268065435494107
		-4.8835967093139572e-17 -1.2599671075064575e-16 -0.42805508645672191
		-0.30268065435494113 -1.3367368059906392e-16 -0.30268065435494113
		-0.42805508645672191 -1.5220752532504428e-16 -2.6289969388227922e-17
		-0.3026806543549419 -1.707413700510245e-16 0.30268065435494113
		-1.2898135152313614e-16 -1.7841833989944245e-16 0.42805508645672191
		0.30268065435494107 -1.707413700510245e-16 0.30268065435494113
		0.42805508645672191 -1.5220752532504428e-16 3.2765890753192721e-16
		0.30268065435494218 -1.3367368059906392e-16 -0.30268065435494107
		-4.8835967093139572e-17 -1.2599671075064575e-16 -0.42805508645672191
		-0.30268065435494113 -1.3367368059906392e-16 -0.30268065435494113
		;
createNode nurbsCurve -n "ik_aim_closedShape1" -p "ik_aim_closed";
	rename -uid "309514A7-452A-B9F1-6BBC-808402658D5F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30268065435494218 0.30268065435494113 4.9074923985498636e-17
		-4.8835967093139572e-17 0.42805508645672191 2.8913177590176649e-17
		-0.30268065435494113 0.3026806543549419 4.9074923985498501e-17
		-0.42805508645672191 -2.8167870362605023e-17 9.7749685574211094e-17
		-0.3026806543549419 -0.30268065435494113 1.4642444716292376e-16
		-1.2898135152313614e-16 -0.42805508645672191 1.6658619355824584e-16
		0.30268065435494107 -0.3026806543549419 1.4642444716292384e-16
		0.42805508645672191 -3.8211674728275962e-16 9.7749685574211168e-17
		0.30268065435494218 0.30268065435494113 4.9074923985498636e-17
		-4.8835967093139572e-17 0.42805508645672191 2.8913177590176649e-17
		-0.30268065435494113 0.3026806543549419 4.9074923985498501e-17
		;
createNode nurbsCurve -n "ik_aim_closedShape2" -p "ik_aim_closed";
	rename -uid "91FAB582-4AD3-0628-E049-6DAEC825A934";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.8674761588712742e-17 0.30268065435494246 -0.30268065435494107
		-2.6210814574398448e-17 -2.0104349241818378e-16 -0.42805508645672191
		-8.5742451040673322e-17 -0.3026806543549419 -0.30268065435494113
		-9.5047322558432937e-17 -0.42805508645672191 -2.6289969388227922e-17
		-4.8674761588712711e-17 -0.3026806543549419 0.30268065435494113
		2.6210814574398383e-17 -2.8118887684818065e-16 0.42805508645672191
		8.5742451040673322e-17 0.30268065435494113 0.30268065435494113
		9.5047322558432937e-17 0.42805508645672191 3.2765890753192721e-16
		4.8674761588712742e-17 0.30268065435494246 -0.30268065435494107
		-2.6210814574398448e-17 -2.0104349241818378e-16 -0.42805508645672191
		-8.5742451040673322e-17 -0.3026806543549419 -0.30268065435494113
		;
createNode transform -n "arm_fk_aim_closed" -p "ik_aim_closed";
	rename -uid "7C825528-4843-33F5-9211-9EB9530DF210";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	setAttr -l on -k off ".v" no;
	setAttr -k on ".t" -type "double3" 8.8817841970012523e-16 0 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ik_aim";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
createNode nurbsCurve -n "arm_fk_aim_closedShape" -p "arm_fk_aim_closed";
	rename -uid "09877A90-444A-E22C-7C93-6B85AE857288";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30268065435494218 -1.3367368059906392e-16 -0.30268065435494107
		-4.8835967093139572e-17 -1.2599671075064575e-16 -0.42805508645672191
		-0.30268065435494113 -1.3367368059906392e-16 -0.30268065435494113
		-0.42805508645672191 -1.5220752532504428e-16 -2.6289969388227922e-17
		-0.3026806543549419 -1.707413700510245e-16 0.30268065435494113
		-1.2898135152313614e-16 -1.7841833989944245e-16 0.42805508645672191
		0.30268065435494107 -1.707413700510245e-16 0.30268065435494113
		0.42805508645672191 -1.5220752532504428e-16 3.2765890753192721e-16
		0.30268065435494218 -1.3367368059906392e-16 -0.30268065435494107
		-4.8835967093139572e-17 -1.2599671075064575e-16 -0.42805508645672191
		-0.30268065435494113 -1.3367368059906392e-16 -0.30268065435494113
		;
createNode nurbsCurve -n "arm_fk_aim_closedShape1" -p "arm_fk_aim_closed";
	rename -uid "8B214EFB-4660-3F48-6A3C-5CB14FD2A9BD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30268065435494218 0.30268065435494113 4.9074923985498636e-17
		-4.8835967093139572e-17 0.42805508645672191 2.8913177590176649e-17
		-0.30268065435494113 0.3026806543549419 4.9074923985498501e-17
		-0.42805508645672191 -2.8167870362605023e-17 9.7749685574211094e-17
		-0.3026806543549419 -0.30268065435494113 1.4642444716292376e-16
		-1.2898135152313614e-16 -0.42805508645672191 1.6658619355824584e-16
		0.30268065435494107 -0.3026806543549419 1.4642444716292384e-16
		0.42805508645672191 -3.8211674728275962e-16 9.7749685574211168e-17
		0.30268065435494218 0.30268065435494113 4.9074923985498636e-17
		-4.8835967093139572e-17 0.42805508645672191 2.8913177590176649e-17
		-0.30268065435494113 0.3026806543549419 4.9074923985498501e-17
		;
createNode nurbsCurve -n "arm_fk_aim_closedShape2" -p "arm_fk_aim_closed";
	rename -uid "D615BE6A-4A5D-F245-026D-5A8238BAAF0C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.8674761588712742e-17 0.30268065435494246 -0.30268065435494107
		-2.6210814574398448e-17 -2.0104349241818378e-16 -0.42805508645672191
		-8.5742451040673322e-17 -0.3026806543549419 -0.30268065435494113
		-9.5047322558432937e-17 -0.42805508645672191 -2.6289969388227922e-17
		-4.8674761588712711e-17 -0.3026806543549419 0.30268065435494113
		2.6210814574398383e-17 -2.8118887684818065e-16 0.42805508645672191
		8.5742451040673322e-17 0.30268065435494113 0.30268065435494113
		9.5047322558432937e-17 0.42805508645672191 3.2765890753192721e-16
		4.8674761588712742e-17 0.30268065435494246 -0.30268065435494107
		-2.6210814574398448e-17 -2.0104349241818378e-16 -0.42805508645672191
		-8.5742451040673322e-17 -0.3026806543549419 -0.30268065435494113
		;
createNode transform -n "wing_controls" -p "controls";
	rename -uid "82BF8D31-4762-5002-06E6-8783D5EDDBE9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "main_controls_group" -p "wing_controls";
	rename -uid "71920745-44A2-00D5-9251-5CB48FCF9632";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "main_root_group" -p "main_controls_group";
	rename -uid "CDB85F4E-42B0-6AC3-2B45-E183074C0E51";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "main_1_closed" -p "main_root_group";
	rename -uid "9F91D4D8-4457-1F1B-2D37-C6905D427F6E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 3.5527136788005017e-15 3.5527136788005009e-15 ;
	setAttr ".rpt" -type "double3" -7.8886090522101181e-31 -3.7416739185829597e-22 3.7416734640018631e-22 ;
	setAttr ".sp" -type "double3" 0 3.5527136788005009e-15 3.5527136788005009e-15 ;
	setAttr ".spt" -type "double3" 0 7.8886090522101198e-31 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "tip";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"tip\", d= 1,p= [[7.6315520092340225, -2.7790009585279992e-15, 1.1155924210743788], [7.7084894175839906, -2.7108476593983877e-15, 0.55907850067635634], [7.7277237696715027, -2.6423802897658386e-15, 2.837157554613904e-15], [7.7084894175839906, -2.5739129201332586e-15, -0.55907850067635778], [7.6315520092340225, -2.5057596210036646e-15, -1.1155924210743799]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "main_1_closedShape" -p "main_1_closed";
	rename -uid "07D65EF4-4441-DAFC-AD56-BB8A54C51DA9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		11.704055424552804 -4.7821541313228523e-05 1.6059848001067685
		11.814861265201943 -4.7821541313083708e-05 0.80448921941149187
		11.842562725364255 -4.7821541312938228e-05 -0.0006998893054156873
		11.814861265201943 -4.7821541312792735e-05 -0.8058889980223366
		11.704055424552804 -4.7821541312647933e-05 -1.6073845787176078
		;
createNode transform -n "main_1_closed_group" -p "main_root_group";
	rename -uid "6F764FDC-4415-E90A-105C-76B3116A0C6E";
createNode transform -n "main_root" -p "main_1_closed_group";
	rename -uid "ACC92260-448B-FBFE-D301-BEA428292B53";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 3.5527136788005001e-15 3.5527136788005001e-15 ;
	setAttr ".sp" -type "double3" 0 3.5527136788005009e-15 3.5527136788005009e-15 ;
	setAttr ".spt" -type "double3" 0 -7.8886090522101172e-31 -7.8886090522101172e-31 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "tip";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"tip\", d= 1,p= [[7.6315520092340225, -2.7790009585279992e-15, 1.1155924210743788], [7.7084894175839906, -2.7108476593983877e-15, 0.55907850067635634], [7.7277237696715027, -2.6423802897658386e-15, 2.837157554613904e-15], [7.7084894175839906, -2.5739129201332586e-15, -0.55907850067635778], [7.6315520092340225, -2.5057596210036646e-15, -1.1155924210743799]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "main_rootShape" -p "main_root";
	rename -uid "8F8DD73D-47E4-7B04-21F7-E1B324E2454E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		11.704055424552804 -4.7821541313228523e-05 1.6059848001067685
		11.814861265201943 -4.7821541313083708e-05 0.80448921941149187
		11.842562725364255 -4.7821541312938228e-05 -0.0006998893054156873
		11.814861265201943 -4.7821541312792735e-05 -0.8058889980223366
		11.704055424552804 -4.7821541312647933e-05 -1.6073845787176078
		;
createNode transform -n "sec_1_root_init" -p "main_root";
	rename -uid "334B435F-464A-50B3-DC88-B2B5BD5A42F5";
createNode aimConstraint -n "main_root_group_aimConstraint1" -p "main_root_group";
	rename -uid "8D825137-45F3-C5FC-7134-FCBB62E6EE6B";
	addAttr -dcb 0 -ci true -sn "w0" -ln "main_root_body_aimW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 116.04446625490348 79.812966562420399 115.68707570893255 ;
	setAttr -k on ".w0";
createNode transform -n "wrist_group" -p "main_controls_group";
	rename -uid "4BC85F1B-4600-968F-C9FF-7794A4191221";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "main_2_closed" -p "wrist_group";
	rename -uid "81E6F421-4163-E3EA-6C75-62AB190F8144";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr ".r" -type "double3" -33.725612805443205 -20.649530800235411 10.234708030158444 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 3.5527136788005001e-15 3.5527136788005009e-15 ;
	setAttr ".rpt" -type "double3" -6.9025329206838533e-31 7.1490519535654195e-31 3.2540512340366737e-30 ;
	setAttr ".sp" -type "double3" 0 3.5527136788005009e-15 3.5527136788005009e-15 ;
	setAttr ".spt" -type "double3" 0 -7.8886090522101163e-31 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "tip";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"tip\", d= 1,p= [[7.6315520092340225, -2.7790009585279992e-15, 1.1155924210743788], [7.7084894175839906, -2.7108476593983877e-15, 0.55907850067635634], [7.7277237696715027, -2.6423802897658386e-15, 2.837157554613904e-15], [7.7084894175839906, -2.5739129201332586e-15, -0.55907850067635778], [7.6315520092340225, -2.5057596210036646e-15, -1.1155924210743799]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "main_2_closedShape" -p "main_2_closed";
	rename -uid "22985F03-40FE-2C4B-A746-3E8B725F35A2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		11.704055424552804 -4.7821541313228523e-05 1.6059848001067685
		11.814861265201943 -4.7821541313083708e-05 0.80448921941149187
		11.842562725364255 -4.7821541312938228e-05 -0.0006998893054156873
		11.814861265201943 -4.7821541312792735e-05 -0.8058889980223366
		11.704055424552804 -4.7821541312647933e-05 -1.6073845787176078
		;
createNode transform -n "main_middle_group" -p "wrist_group";
	rename -uid "3CB8D98D-41E4-1253-D3ED-50A45D0042A2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "main_middle_rev_group" -p "main_middle_group";
	rename -uid "96996483-45C1-4393-16FD-1FA05940BBF1";
createNode transform -n "main_3_closed" -p "main_middle_rev_group";
	rename -uid "24383AAA-4E13-3747-09E8-D9A78333DB01";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -1.8219395432663918 -0.20448318378812758 0.94977561582889791 ;
	setAttr -k on ".t";
	setAttr ".r" -type "double3" 51.516288264972907 26.803449368965566 -5.3746315224834706 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "middle";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"middle\", d= 1,p= [[6.31527893539233, -4.39714882966125e-15, 1.1155924210743811], [6.3922163437422821, -4.3289955305316165e-15, 0.55907850067635789], [6.4114506958297683, -4.2605281608990712e-15, 3.3377935756108579e-15], [6.3922163437422821, -4.1920607912665386e-15, -0.55907850067635578], [6.31527893539233, -4.1239074921368949e-15, -1.1155924210743791]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "main_3_closedShape" -p "main_3_closed";
	rename -uid "A575CAE3-4338-8000-B97A-5882BE7DFB72";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		7.840016084334323 -1.5277243589758755e-09 1.0158734226570012
		7.9100740999940848 -1.5277243589750986e-09 0.50912044271804702
		7.9275886039090198 -1.5277243589743194e-09 3.2195590435787826e-05
		7.9100740999940848 -1.5277243589735397e-09 -0.50905605153718037
		7.840016084334323 -1.5277243589727643e-09 -1.0158090314761343
		;
createNode transform -n "main_3_closedGroup" -p "main_middle_rev_group";
	rename -uid "D46173D3-4B2E-8825-819E-D0884DCDCF45";
createNode transform -n "main_middle" -p "main_3_closedGroup";
	rename -uid "76D28D6C-468F-E076-6B45-63B45EAEB2F4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "slideRotate" -ln "slideRotate" -dv 0.3 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "middle";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"middle\", d= 1,p= [[6.31527893539233, -4.39714882966125e-15, 1.1155924210743811], [6.3922163437422821, -4.3289955305316165e-15, 0.55907850067635789], [6.4114506958297683, -4.2605281608990712e-15, 3.3377935756108579e-15], [6.3922163437422821, -4.1920607912665386e-15, -0.55907850067635578], [6.31527893539233, -4.1239074921368949e-15, -1.1155924210743791]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "main_middleShape" -p "main_middle";
	rename -uid "6F00FEBB-45A8-0340-CD8A-5694D9B17C3A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		21.440068144834733 -2.5723124408517552e-09 1.7104811210879036
		21.558028621498721 -2.5723124408504491e-09 0.85723367321832955
		21.587518740664724 -2.5723124408491384e-09 5.4209459956850618e-05
		21.558028621498721 -2.5723124408478253e-09 -0.8571252542984239
		21.440068144834733 -2.5723124408465163e-09 -1.7103727021679977
		;
createNode transform -n "sec_2_root_init" -p "main_middle";
	rename -uid "CA75B5FD-4617-1C01-8C5A-DBB5A9E8C435";
createNode transform -n "sec_3_target_2_init" -p "main_middle";
	rename -uid "23B49667-4B03-9D55-D856-FA9541DDFA25";
	setAttr ".v" no;
createNode locator -n "sec_3_target_2_initShape" -p "sec_3_target_2_init";
	rename -uid "BEF6B2B6-469E-2583-E279-90A789F8E0D4";
	setAttr -k off ".v";
createNode transform -n "sec_4_target_2_init" -p "main_middle";
	rename -uid "1BD97E1B-40C2-ED2E-5530-32B482922447";
	setAttr ".v" no;
createNode locator -n "sec_4_target_2_initShape" -p "sec_4_target_2_init";
	rename -uid "086799F1-457F-DD61-1A34-42A541EF70A5";
	setAttr -k off ".v";
createNode transform -n "main_end_group" -p "wrist_group";
	rename -uid "56D51DE8-427B-5F63-F142-45B01F62CABA";
createNode transform -n "main_end_group_2" -p "main_end_group";
	rename -uid "8C5036CD-4CAF-A7E0-787B-4380EA734ABE";
	setAttr ".t" -type "double3" -7.1054273576010019e-15 0 2.2204460492503131e-16 ;
	setAttr -av ".tx";
	setAttr -av ".tz";
	setAttr ".s" -type "double3" 0.99999999999999967 1 1 ;
createNode transform -n "main_end" -p "main_end_group_2";
	rename -uid "91EFF7F3-4616-DB19-921D-89B27B473A5A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "followOffset" -ln "followOffset" -dv 0.5 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "initOffset" -ln "initOffset" -at "double";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 3.5527136788005009e-15 3.5527136788005001e-15 ;
	setAttr ".rpt" -type "double3" 1.2325951644078309e-30 -1.2325951644078309e-31 4.0305861876136072e-30 ;
	setAttr ".sp" -type "double3" 0 3.5527136788005009e-15 3.5527136788005009e-15 ;
	setAttr ".spt" -type "double3" 0 0 -7.8886090522101172e-31 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "tip";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"tip\", d= 1,p= [[7.6315520092340225, -2.7790009585279992e-15, 1.1155924210743788], [7.7084894175839906, -2.7108476593983877e-15, 0.55907850067635634], [7.7277237696715027, -2.6423802897658386e-15, 2.837157554613904e-15], [7.7084894175839906, -2.5739129201332586e-15, -0.55907850067635778], [7.6315520092340225, -2.5057596210036646e-15, -1.1155924210743799]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".initOffset" 69.3;
createNode nurbsCurve -n "main_endShape" -p "main_end";
	rename -uid "390A0E36-4034-32A6-25B0-8CAE5EAF6218";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		22.850419972232668 -4.7821541314172213e-05 1.6059848001067629
		22.961225812881807 -4.7821541314027397e-05 0.8044892194114871
		22.988927273044119 -4.7821541313881918e-05 -0.00069988930542057228
		22.961225812881807 -4.7821541313736425e-05 -0.80588899802234149
		22.850419972232668 -4.7821541313591623e-05 -1.6073845787176131
		;
createNode transform -n "sec_5_root_init" -p "main_end";
	rename -uid "67AC5BEB-4981-CAC1-1560-45BBBD21B648";
createNode transform -n "sec_3_target_1_init" -p "main_end";
	rename -uid "12173A3B-4926-E161-3A3D-D8A9FE6F8F6D";
	setAttr ".v" no;
createNode locator -n "sec_3_target_1_initShape" -p "sec_3_target_1_init";
	rename -uid "D86B4297-4460-C948-A520-3FBC026629B0";
	setAttr -k off ".v";
createNode transform -n "sec_4_target_1_init" -p "main_end";
	rename -uid "4745A2E4-4790-6A9B-DF6B-07B8529556D6";
	setAttr ".v" no;
createNode locator -n "sec_4_target_1_initShape" -p "sec_4_target_1_init";
	rename -uid "B513B449-4EF8-067E-6B28-08804841F0F5";
	setAttr -k off ".v";
createNode transform -n "sec_3_root_init" -p "wrist_group";
	rename -uid "CB6CAE88-421A-602E-202A-CB875725C9E9";
createNode transform -n "sec_4_root_init" -p "wrist_group";
	rename -uid "379EC088-4581-EECB-62E7-3CB1CF065698";
createNode transform -n "sec_controls_group" -p "wing_controls";
	rename -uid "2C008AE2-404E-FEF7-F43C-79A11991C6C9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "sec_5_1_group" -p "sec_controls_group";
	rename -uid "A25E3BA0-4F34-839B-DF99-A9B04FDB73DF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_7_1_closedGroup" -p "sec_5_1_group";
	rename -uid "940394B3-48AC-4434-3E01-0BAEF935C4BE";
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode transform -n "feathers_7_1" -p "feathers_7_1_closedGroup";
	rename -uid "FE8C0A73-4231-16D0-F44A-738564977531";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002501e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" -3.9443045261050586e-31 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_1";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_1\", d= 1,p= [[6.8196387974652426, -0.36301388816728325, -0.23006014220542165], [7.0537959646204715, -0.36301388816728386, -4.7445499841455199e-07], [6.819638933395038, -0.36301388816728386, 0.23005980186913019], [7.0537959646204715, -0.36301388816728386, -4.7445499875049791e-07], [-1.4276962846329207e-15, -0.36301388816728386, 2.0336008318632378e-15], [9.2640008304975382e-16, 0.36301388816730767, 5.834838561683655e-15], [7.0537958218044539, 0.36301388816730767, 9.9261053899478223e-15], [6.8196384920437163, 0.36301388816730762, 0.23005957648993677], [7.0537958218044539, 0.36301388816730767, 9.9261053899478223e-15], [6.8196384920437163, 0.36301388816730767, -0.2300595764899169]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "feathers_7_2_group" -p "feathers_7_1";
	rename -uid "4B74E09F-4172-78CD-70B1-EBA900B0CC06";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".rpt" -type "double3" -3.8790534518288521e-18 0 -6.9171406152013754e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_7_2_group_1" -p "feathers_7_2_group";
	rename -uid "8E0A6772-44C6-D006-6096-5EB4F0502831";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
createNode transform -n "feathers_7_2" -p "feathers_7_2_group_1";
	rename -uid "27753066-41E3-D162-623E-CD9199BBA14F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_5";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_5\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-6.5116626614390695e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [-6.8493887981328377e-16, -1.2812499491201269e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [0.20924399590350129, -1.7472360318056226e-33, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-6.5116626614390695e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_5\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [-6.5116626614390695e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697358257e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [-6.8493887981328377e-16, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944811e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [-6.5116626614390695e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_5\", per = True, d= 3,p= [[-6.4018532890998958e-16, 0.14795784842593551, -0.14795784842593551], [-6.7679126512630962e-16, 1.2812499491201259e-17, -0.20924399590350129], [-7.0589181290858073e-16, -0.14795784842593551, -0.14795784842593551], [-7.1044026603843422e-16, -0.20924399590350129, 1.3171102855728601e-15], [-6.8777220236022522e-16, -0.14795784842593551, 0.14795784842593557], [-6.5116626614390695e-16, -2.0960114178175192e-17, 0.20924399590350132], [-6.2206571836163475e-16, 0.14795784842593551, 0.14795784842593557], [-6.1751726523178027e-16, 0.20924399590350129, 1.3564920611121622e-15], [-6.4018532890998958e-16, 0.14795784842593551, -0.14795784842593551], [-6.7679126512630962e-16, 1.2812499491201259e-17, -0.20924399590350129], [-7.0589181290858073e-16, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_6_3_loc_closed" -p "feathers_7_2";
	rename -uid "897FD30D-4810-A945-CA16-718C063AEAC6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_6_3_loc_closedShape" -p "first_curve_6_3_loc_closed";
	rename -uid "79453310-4495-7EDC-0855-7CA9A34A0526";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_7_2Shape" -p "feathers_7_2";
	rename -uid "4A7E4D37-413E-37D2-1989-A4803E7CF19B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -1.6918911374165253e-16
		5.2440443801359633 0.66524208549177777 -3.1429125744135292e-15
		5.2440443801359633 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -1.6918911374165253e-16
		0.18236945941928415 0.66524208549177777 -1.6918911374165253e-16
		;
createNode transform -n "feathers_7_3_group" -p "feathers_7_2";
	rename -uid "921CFAB8-413A-1062-3461-0887FDC4433F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072245e-18 3.4694469519536142e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 3.8518598887744697e-33 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_7_3_group_1" -p "feathers_7_3_group";
	rename -uid "F6E6F976-4446-DF60-C862-2D99A4ED36A5";
createNode transform -n "feathers_7_3" -p "feathers_7_3_group_1";
	rename -uid "A67C148E-43DD-1C64-85B5-E4A85E1770AB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 1.1102230246251565e-16 0 -2.2204460492503131e-16 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_5";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_5\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741772751e-18, -0.14795784842593551], [6.7679126512630962e-16, 1.2812499491200968e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741772735e-18, -0.14795784842593551], [-0.20924399590350129, -2.9420160315197332e-31, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741778575e-18, 0.14795784842593557], [6.4301865145693369e-16, -1.281249949120147e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741778575e-18, 0.14795784842593557], [0.20924399590350129, -2.9661304141992061e-31, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741772751e-18, -0.14795784842593551], [6.7679126512630962e-16, 1.2812499491200968e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741772735e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_5\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [6.7679126512630962e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697357966e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [6.4301865145693369e-16, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944836e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [6.7679126512630962e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_5\", per = True, d= 3,p= [[6.8777220236022522e-16, 0.14795784842593551, -0.14795784842593551], [6.5116626614390695e-16, 1.2812499491200968e-17, -0.20924399590350129], [6.2206571836163475e-16, -0.14795784842593551, -0.14795784842593551], [6.1751726523178027e-16, -0.20924399590350129, 1.3171102855728601e-15], [6.4018532890998958e-16, -0.14795784842593551, 0.14795784842593557], [6.7679126512630962e-16, -2.0960114178175297e-17, 0.20924399590350132], [7.0589181290858073e-16, 0.14795784842593551, 0.14795784842593557], [7.1044026603843422e-16, 0.20924399590350129, 1.3564920611121622e-15], [6.8777220236022522e-16, 0.14795784842593551, -0.14795784842593551], [6.5116626614390695e-16, 1.2812499491200968e-17, -0.20924399590350129], [6.2206571836163475e-16, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "1.1102230246251565e-16";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "-2.220446049250313e-16";
	setAttr ".default_translate" -type "string" "[(1.1102230246251565e-16, 0.0, -2.220446049250313e-16)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_1_3_loc" -p "feathers_7_3";
	rename -uid "7264A2E3-421B-41BD-16F2-86B63C578F80";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_3_locShape" -p "first_curve_1_3_loc";
	rename -uid "8F357C6C-4FA7-EB4D-A2AE-008603BA645C";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_7_3Shape" -p "feathers_7_3";
	rename -uid "681BA975-4E32-2BE8-8035-57BAFBF6DAE4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -1.6063007874370832e-15
		5.2440443801359633 0.66524208549177777 -3.1429125744135292e-15
		5.2440443801359633 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -1.6063007874370832e-15
		0.18236945941928415 0.66524208549177777 -1.6063007874370832e-15
		;
createNode transform -n "first_curve_1_4_loc_group" -p "feathers_7_3";
	rename -uid "9EDFD17E-4289-ED61-E585-5F9DFDCD04D0";
	setAttr ".t" -type "double3" 5.2440443801359633 0 1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode transform -n "first_curve_1_4_loc" -p "first_curve_1_4_loc_group";
	rename -uid "EEE70DE6-4145-829A-55D3-0AB569EB0790";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_4_locShape" -p "first_curve_1_4_loc";
	rename -uid "6146EAC2-4FA6-F39E-1E40-0D8314F56FF5";
	setAttr -k off ".v";
createNode transform -n "first_curve_1_4_loc_closed" -p "first_curve_1_4_loc_group";
	rename -uid "B399B31C-4866-BAF0-7FA8-6393BAA33B5D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.3424725379796092 0.33909766204329106 -0.17700816262195421 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_4_loc_closedShape" -p "first_curve_1_4_loc_closed";
	rename -uid "6251F674-4B6D-63EF-CE54-CF91515D7163";
	setAttr -k off ".v";
createNode transform -n "first_curve_1_3_loc_closed" -p "feathers_7_3";
	rename -uid "701A4E02-484D-0C44-AB3D-92A09486A723";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.31384788201175118 -0.055601240503993385 0.038624904728033704 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_3_loc_closedShape" -p "first_curve_1_3_loc_closed";
	rename -uid "1D9A4146-47B3-9F79-6B6D-D7A47033BB89";
	setAttr -k off ".v";
createNode transform -n "feathers_7_3_closed" -p "feathers_7_3_group";
	rename -uid "35A4D169-49FD-EE09-2CA8-B187844FAC7B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -1.8576465896199796 0.74455844785239178 0.12481334210543352 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" -34.764157724605568 -25.030849731428457 -32.587618182515214 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_5";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_5\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741772751e-18, -0.14795784842593551], [6.7679126512630962e-16, 1.2812499491200968e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741772735e-18, -0.14795784842593551], [-0.20924399590350129, -2.9420160315197332e-31, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741778575e-18, 0.14795784842593557], [6.4301865145693369e-16, -1.281249949120147e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741778575e-18, 0.14795784842593557], [0.20924399590350129, -2.9661304141992061e-31, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741772751e-18, -0.14795784842593551], [6.7679126512630962e-16, 1.2812499491200968e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741772735e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_5\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [6.7679126512630962e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697357966e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [6.4301865145693369e-16, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944836e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [6.7679126512630962e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_5\", per = True, d= 3,p= [[6.8777220236022522e-16, 0.14795784842593551, -0.14795784842593551], [6.5116626614390695e-16, 1.2812499491200968e-17, -0.20924399590350129], [6.2206571836163475e-16, -0.14795784842593551, -0.14795784842593551], [6.1751726523178027e-16, -0.20924399590350129, 1.3171102855728601e-15], [6.4018532890998958e-16, -0.14795784842593551, 0.14795784842593557], [6.7679126512630962e-16, -2.0960114178175297e-17, 0.20924399590350132], [7.0589181290858073e-16, 0.14795784842593551, 0.14795784842593557], [7.1044026603843422e-16, 0.20924399590350129, 1.3564920611121622e-15], [6.8777220236022522e-16, 0.14795784842593551, -0.14795784842593551], [6.5116626614390695e-16, 1.2812499491200968e-17, -0.20924399590350129], [6.2206571836163475e-16, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_7_3_closedShape" -p "feathers_7_3_closed";
	rename -uid "124DE594-4198-BEC9-7804-D08559F60463";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -1.6063007874370832e-15
		4.6204800688250502 0.66524208549177777 -3.1429125744135292e-15
		4.6204800688250502 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -1.6063007874370832e-15
		0.18236945941928415 0.66524208549177777 -1.6063007874370832e-15
		;
createNode transform -n "first_curve_1_2_loc_closed" -p "feathers_7_2";
	rename -uid "B00CD4D5-4A27-A858-4043-5ABA79640ACB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.21248663210784122 0.038074214994940361 -0.21282065168915093 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_2_loc_closedShape" -p "first_curve_1_2_loc_closed";
	rename -uid "39286908-4B82-79A7-D99C-2493279101DE";
	setAttr -k off ".v";
createNode transform -n "feathers_7_2_closed" -p "feathers_7_2_group";
	rename -uid "B3219572-4504-63B3-4A0E-41A521E327F5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -1.7112064189654099 0.29415445821423775 0.6022367867904892 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 3.5116924516820642 9.8259004802111001 -22.307844846419513 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_5";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_5\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-6.5116626614390695e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [-6.8493887981328377e-16, -1.2812499491201269e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [0.20924399590350129, -1.7472360318056226e-33, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-6.5116626614390695e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_5\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [-6.5116626614390695e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697358257e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [-6.8493887981328377e-16, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944811e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [-6.5116626614390695e-16, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_5\", per = True, d= 3,p= [[-6.4018532890998958e-16, 0.14795784842593551, -0.14795784842593551], [-6.7679126512630962e-16, 1.2812499491201259e-17, -0.20924399590350129], [-7.0589181290858073e-16, -0.14795784842593551, -0.14795784842593551], [-7.1044026603843422e-16, -0.20924399590350129, 1.3171102855728601e-15], [-6.8777220236022522e-16, -0.14795784842593551, 0.14795784842593557], [-6.5116626614390695e-16, -2.0960114178175192e-17, 0.20924399590350132], [-6.2206571836163475e-16, 0.14795784842593551, 0.14795784842593557], [-6.1751726523178027e-16, 0.20924399590350129, 1.3564920611121622e-15], [-6.4018532890998958e-16, 0.14795784842593551, -0.14795784842593551], [-6.7679126512630962e-16, 1.2812499491201259e-17, -0.20924399590350129], [-7.0589181290858073e-16, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_7_2_closedShape" -p "feathers_7_2_closed";
	rename -uid "DCFD7D92-45F2-976D-E506-A7A5CABBA015";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -1.6918911374165253e-16
		4.6204800688250502 0.66524208549177777 -3.1429125744135292e-15
		4.6204800688250502 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -1.6918911374165253e-16
		0.18236945941928415 0.66524208549177777 -1.6918911374165253e-16
		;
createNode nurbsCurve -n "feathers_7_1Shape" -p "feathers_7_1";
	rename -uid "DDC19252-49F3-1889-67FC-B6A0B47137F0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		5.2440443801359633 0.66524208549177777 -3.1429125744135292e-15
		5.2440443801359633 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_1_1_loc" -p "feathers_7_1";
	rename -uid "5D0DB527-44B5-3B71-1910-CF8C9BD77799";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_1_locShape" -p "first_curve_1_1_loc";
	rename -uid "E8F83F58-4059-7CEC-3184-A48F4732D125";
	setAttr -k off ".v";
createNode joint -n "feathers_7_1_joint_1" -p "feathers_7_1";
	rename -uid "47C2C8DE-4573-0643-91E5-F5AFAE4F5038";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 2.9492637977268665 0.020797187693429961 0.29124085749216011 0
		 0.27255975962706924 0.86406997440031619 -2.8217910917434885 0 -0.10471359759247452 2.8348476616909948 0.85795367366505149 0
		 31.383722580893782 30.344083511337114 4.8221213351701895 1;
	setAttr ".ds" 2;
createNode joint -n "feathers_7_1_joint_2" -p "feathers_7_1_joint_1";
	rename -uid "FFB65FF6-4C23-6F99-6A63-87B01EDAF3CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.3972959592552083 8.8817841970012523e-16 1.2434497875801753e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 2.9459252277312569 0.15157687070306736 0.28628606944006568 0
		 0.23011377126444468 0.86427956361836022 -2.8255051224262759 0 -0.2279976174481462 2.8308048319957591 0.84733216524480326 0
		 31.383789323288021 30.344090436748431 4.8221254955937241 1;
	setAttr ".ds" 2;
	setAttr ".liw" yes;
createNode transform -n "first_curve_1_1_loc_closed" -p "feathers_7_1";
	rename -uid "101D4308-4F81-BC0E-5C43-56866A39C313";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_1_1_loc_closedShape" -p "first_curve_1_1_loc_closed";
	rename -uid "6FF00935-4DB0-C1D4-709C-5EAD3DFDCB0E";
	setAttr -k off ".v";
createNode transform -n "feathers_7_1_closed" -p "sec_5_1_group";
	rename -uid "76D33BED-4610-A5FC-439A-DA867B20B384";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr ".r" -type "double3" 0 0 4.6799999346106516 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".rpt" -type "double3" -7.8886090522101181e-31 -7.0750962437009496e-30 1.5777218104420236e-30 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_1";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_1\", d= 1,p= [[6.8196387974652426, -0.36301388816728325, -0.23006014220542165], [7.0537959646204715, -0.36301388816728386, -4.7445499841455199e-07], [6.819638933395038, -0.36301388816728386, 0.23005980186913019], [7.0537959646204715, -0.36301388816728386, -4.7445499875049791e-07], [-1.4276962846329207e-15, -0.36301388816728386, 2.0336008318632378e-15], [9.2640008304975382e-16, 0.36301388816730767, 5.834838561683655e-15], [7.0537958218044539, 0.36301388816730767, 9.9261053899478223e-15], [6.8196384920437163, 0.36301388816730762, 0.23005957648993677], [7.0537958218044539, 0.36301388816730767, 9.9261053899478223e-15], [6.8196384920437163, 0.36301388816730767, -0.2300595764899169]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_7_1_closedShape" -p "feathers_7_1_closed";
	rename -uid "8227D05B-4AF6-91B5-9260-93910B5C166B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.6204800688250502 0.66524208549177777 -3.1429125744135292e-15
		4.6204800688250502 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "sec_4_1_group" -p "sec_controls_group";
	rename -uid "264E0A58-4D2D-DFE1-0863-378AC5B6A4AD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "sec_4_1_group_2" -p "sec_4_1_group";
	rename -uid "B69842DD-4DC5-834B-F39A-99B3D59DC65B";
createNode transform -n "feathers_6_1_group_1" -p "sec_4_1_group_2";
	rename -uid "30937AEF-4F45-DC89-E0CE-128203BEF175";
	setAttr ".t" -type "double3" -3.5527136788005009e-15 7.1054273576010019e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
createNode transform -n "feathers_6_1" -p "feathers_6_1_group_1";
	rename -uid "D096B72F-446A-79C2-2A01-23BBDDD248EB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -1.7763568394002505e-15 1.7763568394002505e-15 
		1.6653345369377348e-16 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002509e-15 -7.1054273576010034e-15 -7.1054273576010034e-15 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" 3.9443045261050599e-31 -1.5777218104420243e-30 -1.5777218104420243e-30 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_2\", d= 1,p= [[6.9977819716981511, -0.36301388816728331, -0.23006014220542187], [7.2319391388533782, -0.36301388816728392, -4.7445499985698214e-07], [6.9977821076279412, -0.36301388816728392, 0.23005980186912933], [7.2319391388533782, -0.36301388816728392, -4.7445500019292657e-07], [7.2249825869420222e-16, -0.36301388816728392, 1.8522932836986376e-15], [3.0765946263768815e-15, 0.36301388816730762, 5.6535310135190541e-15], [7.2319389960373508, 0.36301388816730762, 8.4836747876675197e-15], [6.9977816662766275, 0.36301388816730756, 0.23005957648993644], [7.2319389960373508, 0.36301388816730762, 8.4836747876675197e-15], [6.9977816662766275, 0.36301388816730762, -0.23005957648991693]])']";
	setAttr ".default_translate" -type "string" "[(-1.7763568394002505e-15, 1.7763568394002505e-15, 1.6653345369377348e-16)]";
	setAttr ".default_translateX" -type "string" "-1.7763568394002505e-15";
	setAttr ".default_translateY" -type "string" "1.7763568394002505e-15";
	setAttr ".default_translateZ" -type "string" "1.6653345369377348e-16";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "feathers_6_2_group" -p "feathers_6_1";
	rename -uid "944D3C6A-4016-912B-198E-D7947C9DA37C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536136e-17 ;
	setAttr ".rpt" -type "double3" -1.8694503336856316e-17 0 -6.3921541905088047e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 0 -6.162975822039154e-33 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_6_2_closedGroup" -p "feathers_6_2_group";
	rename -uid "94ECA59B-4D7C-B390-F7EA-64946B32D354";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
createNode transform -n "feathers_6_2" -p "feathers_6_2_closedGroup";
	rename -uid "5D9E25EA-42B1-DE92-BE79-EFA2104DEBE3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_4";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_4\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-1.5318219191757567e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, -1.0847245697358257e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-1.8695480558695221e-16, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 2.8534529841944811e-17], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-1.5318219191757567e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_4\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-1.5318219191757567e-16, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 1.0847245697358257e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-1.8695480558695221e-16, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -2.8534529841944811e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-1.5318219191757567e-16, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_4\", per = True, d= 3,p= [[-1.4220125468365997e-16, 0.14795784842593551, -0.14795784842593551], [-1.788071908999784e-16, 1.2812499491201259e-17, -0.20924399590350129], [-2.0790773868224952e-16, -0.14795784842593551, -0.14795784842593551], [-2.1245619181210471e-16, -0.20924399590350129, -1.0847245697358257e-17], [-1.89788128133894e-16, -0.14795784842593551, 0.14795784842593551], [-1.5318219191757567e-16, -2.0960114178175192e-17, 0.20924399590350129], [-1.240816441353047e-16, 0.14795784842593551, 0.14795784842593551], [-1.1953319100544899e-16, 0.20924399590350129, 2.8534529841944811e-17], [-1.4220125468365997e-16, 0.14795784842593551, -0.14795784842593551], [-1.788071908999784e-16, 1.2812499491201259e-17, -0.20924399590350129], [-2.0790773868224952e-16, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_2_2_loc" -p "feathers_6_2";
	rename -uid "63109A99-4505-C39F-0356-0E8D404CA57F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_2_locShape" -p "first_curve_2_2_loc";
	rename -uid "5DAAF657-4F38-117A-432C-D0A3D8CDB117";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_6_2Shape" -p "feathers_6_2";
	rename -uid "7D8584F1-46A6-70C0-5467-5A9647F863B7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.6807549794515007 0.66524208549177777 -3.1429125744135292e-15
		4.6807549794515007 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_6_3_group" -p "feathers_6_2";
	rename -uid "422DE2F8-4253-6E06-CF7F-C690D3BFE073";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072299e-18 3.4694469519536148e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 -1.5407439555097894e-33 6.1629758220391575e-33 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_6_3_group_1" -p "feathers_6_3_group";
	rename -uid "6B6CE526-4B42-3683-5F16-F4812106D4FD";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "feathers_6_3" -p "feathers_6_3_group_1";
	rename -uid "86C0E5EE-4161-DA33-7C4C-6985113B03B0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -8.8817841970012523e-16 8.8817841970012523e-16 
		-4.4408920985006262e-16 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s" -type "double3" 1 1 1.0000000000000002 ;
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_4";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_4\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, -1.0847245697358257e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 2.8534529841944811e-17], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_4\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [1.2812499491201259e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 1.0847245697358257e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-2.0960114178175192e-17, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -2.8534529841944811e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [1.2812499491201259e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_4\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, -1.0847245697358257e-17], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593551], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350129], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593551], [4.6461500403327819e-17, 0.20924399590350129, 2.8534529841944811e-17], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "-8.881784197001252e-16";
	setAttr ".default_translateY" -type "string" "8.881784197001252e-16";
	setAttr ".default_translateZ" -type "string" "-4.440892098500626e-16";
	setAttr ".default_translate" -type "string" "[(-8.881784197001252e-16, 8.881784197001252e-16, -4.440892098500626e-16)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0000000000000002)]";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0000000000000002";
createNode transform -n "first_curve_2_3_loc" -p "feathers_6_3";
	rename -uid "739A03CE-446D-B970-022F-59A3F12D3B04";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_3_locShape" -p "first_curve_2_3_loc";
	rename -uid "999824DF-40FB-E2E7-1E37-C597A38CA032";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_6_3Shape" -p "feathers_6_3";
	rename -uid "3114B428-460F-FFC2-C760-C7B87E302F84";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.6807549794515007 0.66524208549177777 -3.1429125744135292e-15
		4.6807549794515007 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_2_4_loc_group" -p "feathers_6_3";
	rename -uid "9641734C-4C83-36CD-A662-87A33E6E00B6";
	setAttr ".t" -type "double3" 4.6807549794515007 -2.2204460492503131e-16 -1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
createNode transform -n "first_curve_2_4_loc" -p "first_curve_2_4_loc_group";
	rename -uid "2ADC3923-4FAB-DEFD-2559-DDAD0256096B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_4_locShape" -p "first_curve_2_4_loc";
	rename -uid "59D7FA26-429F-D9B4-43E8-868F8875B906";
	setAttr -k off ".v";
createNode transform -n "first_curve_2_4_loc_closed" -p "first_curve_2_4_loc_group";
	rename -uid "56DE736B-4798-BF54-2444-BD8AF813CA43";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.9995800392412102 0.0057129576013535358 0.278680903086098 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_4_loc_closedShape" -p "first_curve_2_4_loc_closed";
	rename -uid "10B7F063-41DB-3E83-584A-6AB04A381C09";
	setAttr -k off ".v";
createNode transform -n "first_curve_2_3_loc_closed" -p "feathers_6_3";
	rename -uid "8736BD3D-49F9-396E-8B20-9693EDAF5326";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.0828685254955703 0.28098557889332365 0.19266949741202827 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_3_loc_closedShape" -p "first_curve_2_3_loc_closed";
	rename -uid "46ABC3C1-4EF9-BE9D-1441-A9BA4C858220";
	setAttr -k off ".v";
createNode transform -n "feathers_6_3_closed" -p "feathers_6_3_group";
	rename -uid "65881AF4-4590-6FAE-553D-9E9B77B0DBA1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -4.2774900767954458 -0.48901483670690826 -0.069225452676611426 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" -4.6927133088294921 -5.5535723517647595 3.6916546995711852 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_4";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_4\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, -1.0847245697358257e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 2.8534529841944811e-17], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_4\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [1.2812499491201259e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 1.0847245697358257e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-2.0960114178175192e-17, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -2.8534529841944811e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [1.2812499491201259e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_4\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, -1.0847245697358257e-17], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593551], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350129], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593551], [4.6461500403327819e-17, 0.20924399590350129, 2.8534529841944811e-17], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_6_3_closedShape" -p "feathers_6_3_closed";
	rename -uid "873E984F-4EAD-A925-8216-1480CDB3B326";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		5.1162469412428138 0.66524208549177777 -3.1429125744135292e-15
		5.1162469412428138 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_2_2_loc_closed" -p "feathers_6_2";
	rename -uid "B35A941C-4FEE-168F-7406-57BD09662AAA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.21418355715595702 0.40832320562832497 -0.084189950241790434 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_2_loc_closedShape" -p "first_curve_2_2_loc_closed";
	rename -uid "AF236BC8-4BFE-BBFD-C69F-3EB29895354D";
	setAttr -k off ".v";
createNode transform -n "feathers_6_2_closed" -p "feathers_6_2_group";
	rename -uid "A3AD5456-4BBF-5E12-0E7A-228AEC872D01";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -0.25781504394420846 0.33665811316950822 0.32138893383150791 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" -12.284090809104411 8.0681358626064057 -28.758211750061342 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_4";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_4\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-1.5318219191757567e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, -1.0847245697358257e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-1.8695480558695221e-16, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 2.8534529841944811e-17], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [-1.5318219191757567e-16, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_4\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-1.5318219191757567e-16, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 1.0847245697358257e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-1.8695480558695221e-16, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -2.8534529841944811e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-1.5318219191757567e-16, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_4\", per = True, d= 3,p= [[-1.4220125468365997e-16, 0.14795784842593551, -0.14795784842593551], [-1.788071908999784e-16, 1.2812499491201259e-17, -0.20924399590350129], [-2.0790773868224952e-16, -0.14795784842593551, -0.14795784842593551], [-2.1245619181210471e-16, -0.20924399590350129, -1.0847245697358257e-17], [-1.89788128133894e-16, -0.14795784842593551, 0.14795784842593551], [-1.5318219191757567e-16, -2.0960114178175192e-17, 0.20924399590350129], [-1.240816441353047e-16, 0.14795784842593551, 0.14795784842593551], [-1.1953319100544899e-16, 0.20924399590350129, 2.8534529841944811e-17], [-1.4220125468365997e-16, 0.14795784842593551, -0.14795784842593551], [-1.788071908999784e-16, 1.2812499491201259e-17, -0.20924399590350129], [-2.0790773868224952e-16, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_6_2_closedShape" -p "feathers_6_2_closed";
	rename -uid "9B617BE1-4C65-9404-4F37-61A3B59048AE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		5.1162469412428138 0.66524208549177777 -3.1429125744135292e-15
		5.1162469412428138 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode nurbsCurve -n "feathers_6_1Shape" -p "feathers_6_1";
	rename -uid "9B170743-4FED-AD81-A3C9-4F827486E0C9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.6807549794515007 0.66524208549177777 -3.1429125744135292e-15
		4.6807549794515007 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_2_1_loc" -p "feathers_6_1";
	rename -uid "A39780F8-46DB-8275-9AF9-8A92226E99D7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_1_locShape" -p "first_curve_2_1_loc";
	rename -uid "AD542D28-4291-E176-1BBA-1D8DEF479595";
	setAttr -k off ".v";
createNode transform -n "first_curve_2_1_loc_closed" -p "feathers_6_1";
	rename -uid "E2D64B1D-41BC-2775-44E1-95B3B85B9D58";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_2_1_loc_closedShape" -p "first_curve_2_1_loc_closed";
	rename -uid "895FB1AC-4F29-A9DE-B32A-048D0B6B2524";
	setAttr -k off ".v";
createNode transform -n "feathers_6_1_closed" -p "sec_4_1_group_2";
	rename -uid "DCA93EC2-4E57-D261-9C28-96B91FDB58DA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -3.5527136788005009e-15 7.1054273576010019e-15 
		0 ;
	setAttr -k on ".t";
	setAttr ".r" -type "double3" 0 0 4.1614799640518445 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010034e-15 ;
	setAttr ".rpt" -type "double3" 5.1094102919919573e-16 1.4763963337936853e-16 0 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" 0 0 -1.577721810442024e-30 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_2\", d= 1,p= [[6.9977819716981511, -0.36301388816728331, -0.23006014220542187], [7.2319391388533782, -0.36301388816728392, -4.7445499985698214e-07], [6.9977821076279412, -0.36301388816728392, 0.23005980186912933], [7.2319391388533782, -0.36301388816728392, -4.7445500019292657e-07], [7.2249825869420222e-16, -0.36301388816728392, 1.8522932836986376e-15], [3.0765946263768815e-15, 0.36301388816730762, 5.6535310135190541e-15], [7.2319389960373508, 0.36301388816730762, 8.4836747876675197e-15], [6.9977816662766275, 0.36301388816730756, 0.23005957648993644], [7.2319389960373508, 0.36301388816730762, 8.4836747876675197e-15], [6.9977816662766275, 0.36301388816730762, -0.23005957648991693]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_6_1_closedShape" -p "feathers_6_1_closed";
	rename -uid "65B150F9-4203-F490-D093-9692C3E1F156";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		5.1162469412428138 0.66524208549177777 -3.1429125744135292e-15
		5.1162469412428138 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "sec_3_1_group" -p "sec_controls_group";
	rename -uid "AAFAD3C2-4783-0193-C2F1-54B66E5A4608";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "sec_3_1_group_2" -p "sec_3_1_group";
	rename -uid "9BBA9150-4BF9-F861-A888-C0972E8820B5";
createNode transform -n "feathers_5_1_closedGroup" -p "sec_3_1_group_2";
	rename -uid "FE90ABD5-41F7-90BB-5132-A082B4426742";
	setAttr ".t" -type "double3" 3.5527136788005009e-15 3.5527136788005009e-15 0 ;
createNode transform -n "group20" -p "feathers_5_1_closedGroup";
	rename -uid "34C9F725-49E0-0E1C-DA4D-35827FB5F036";
createNode transform -n "feathers_5_1" -p "group20";
	rename -uid "2A2863EC-4728-E16D-46DF-EB862F97A08E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 8.8817841970012523e-16 8.8817841970012523e-16 
		0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010034e-15 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" 0 0 -1.5777218104420243e-30 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_3";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_3\", d= 1,p= [[6.3454774014574058, -0.36301388816728342, -0.23006014220542348], [6.5796345686126134, -0.36301388816728403, -4.7445500183583792e-07], [6.3454775373871879, -0.36301388816728403, 0.23005980186912786], [6.5796345686126134, -0.36301388816728403, -4.7445500217178443e-07], [2.6137529866747846e-15, -0.36301388816728403, 1.5368689743329442e-16], [4.9678493543574678e-15, 0.36301388816730751, 3.9549246272536903e-15], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730745, 0.23005957648993478], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730751, -0.23005957648991876]])']";
	setAttr ".default_translate" -type "string" "[(8.881784197001252e-16, 8.881784197001252e-16, 0.0)]";
	setAttr ".default_translateX" -type "string" "8.881784197001252e-16";
	setAttr ".default_translateY" -type "string" "8.881784197001252e-16";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_5_1Shape" -p "feathers_5_1";
	rename -uid "0398FAE2-425E-2A9A-E95D-32AD711737BC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.1174654500002097 0.66524208549177777 -3.1429125744135292e-15
		4.1174654500002097 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_3_1_loc" -p "feathers_5_1";
	rename -uid "AD489224-490F-AC07-759D-3885A8991D00";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_1_locShape" -p "first_curve_3_1_loc";
	rename -uid "B4481474-4246-5EBF-F393-9F8017EBE453";
	setAttr -k off ".v";
createNode transform -n "feathers_5_2_group" -p "feathers_5_1";
	rename -uid "6B88C736-4136-FDF8-E9CD-50811A84F91F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072214e-18 3.4694469519536142e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 6.9333477997940395e-33 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_5_2_group_1" -p "feathers_5_2_group";
	rename -uid "411D00CE-4037-85E5-068F-08A4E6D9A287";
createNode transform -n "feathers_5_2" -p "feathers_5_2_group_1";
	rename -uid "9EFA61AA-4ED7-2F9D-0425-32921396AF2D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [0.20924399590350129, -1.7472360318056226e-33, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697358257e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [-2.0960114178175192e-17, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944811e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 1.3171102855728601e-15], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593557], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350132], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593557], [4.6461500403327819e-17, 0.20924399590350129, 1.3564920611121622e-15], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_3_2_loc" -p "feathers_5_2";
	rename -uid "C39F7952-4837-FFA1-3A13-BB90D5C86CEC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_2_locShape" -p "first_curve_3_2_loc";
	rename -uid "0CCDDBCF-41A2-E4C1-54F7-529FC936EB13";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_5_2Shape" -p "feathers_5_2";
	rename -uid "8A47001B-45AE-8078-059A-20B1E2CE7F09";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.1174654500002097 0.66524208549177777 -3.1429125744135292e-15
		4.1174654500002097 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_5_3_group" -p "feathers_5_2";
	rename -uid "D63E72B1-4568-BC01-1FD3-6FA84CF8EE64";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.938893903907233e-18 3.4694469519536136e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 -4.6222318665293715e-33 -6.1629758220391534e-33 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_5_3_group_1" -p "feathers_5_3_group";
	rename -uid "2F9CCBAE-42A3-5D1B-FC4C-B295BC524BC2";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
createNode transform -n "feathers_5_3" -p "feathers_5_3_group_1";
	rename -uid "92B7D024-4A18-2E66-0858-A9A3FBFD1E3E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 6.2450045135165055e-17 -1.7763568394002505e-15 
		2.2204460492503131e-16 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551], [-0.20924399590350129, 1.0374668213048572e-17, -1.0847245697358257e-17], [-0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [-6.2458787030369784e-17, -2.4378312781526715e-18, 0.20924399590350129], [0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [0.20924399590350129, 1.037466821304857e-17, 2.8534529841944811e-17], [0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 2.1221913910406881e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-6.2458787030369784e-17, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -1.8159861628896471e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551], [-8.7960173255522026e-17, -0.20924399590350129, -1.0847245697358257e-17], [-6.5292109577311033e-17, -0.14795784842593551, 0.14795784842593551], [-2.8686173360993036e-17, -1.0585445965126596e-17, 0.20924399590350129], [4.1437442127796877e-19, 0.14795784842593551, 0.14795784842593551], [4.9628275511335239e-18, 0.20924399590350129, 2.8534529841944811e-17], [-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "6.245004513516506e-17";
	setAttr ".default_translateY" -type "string" "-1.7763568394002505e-15";
	setAttr ".default_translateZ" -type "string" "2.220446049250313e-16";
	setAttr ".default_translate" -type "string" "[(6.245004513516506e-17, -1.7763568394002505e-15, 2.220446049250313e-16)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0000000000000002, 1.0, 1.0000000000000002)]";
	setAttr ".default_scaleX" -type "string" "1.0000000000000002";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0000000000000002";
createNode transform -n "first_curve_3_3_loc" -p "feathers_5_3";
	rename -uid "15092319-4F4A-97AB-9ACE-88AA76F71061";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_3_locShape" -p "first_curve_3_3_loc";
	rename -uid "1FEDF096-4CFE-E772-7AB3-9690D6F108C6";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_5_3Shape" -p "feathers_5_3";
	rename -uid "2DD9EEB1-43DC-D031-F303-DA86F75FBB40";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.1174654500002097 0.66524208549177777 -3.1429125744135292e-15
		4.1174654500002097 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_3_4_loc_group" -p "feathers_5_3";
	rename -uid "2C143D92-4181-147F-70F9-829C40398158";
	setAttr ".t" -type "double3" 4.1174654500002097 0 0 ;
createNode transform -n "first_curve_3_4_loc" -p "first_curve_3_4_loc_group";
	rename -uid "C39E8847-4E55-4607-C162-54AC1AA13AF4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_4_locShape" -p "first_curve_3_4_loc";
	rename -uid "F7EB6FB8-41DB-C3B0-E236-FCA97AE0B6FE";
	setAttr -k off ".v";
createNode transform -n "first_curve_3_4_loc_closed" -p "first_curve_3_4_loc_group";
	rename -uid "B51C7168-4F9F-6455-F22B-B8AFC6FDF8D2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.30845689543038135 -0.23009670021575906 -0.13630071747794814 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_4_loc_closedShape" -p "first_curve_3_4_loc_closed";
	rename -uid "68F10B4B-4286-051D-A149-4F96252923FD";
	setAttr -k off ".v";
createNode transform -n "first_curve_3_3_loc_closed" -p "feathers_5_3";
	rename -uid "169BDABA-4886-27AC-C5B6-1E8670EDB482";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.3147693744437485 0.40795641080801537 0.012824319065409455 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_3_loc_closedShape" -p "first_curve_3_3_loc_closed";
	rename -uid "3B0083EE-48B5-A14F-F2FE-E9BAA2E55F5C";
	setAttr -k off ".v";
createNode transform -n "feathers_5_3_closed" -p "feathers_5_3_group";
	rename -uid "1C1CBE81-4BE3-2602-EEF1-EE9DA3E4DD57";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -22.333904901225534 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551], [-0.20924399590350129, 1.0374668213048572e-17, -1.0847245697358257e-17], [-0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [-6.2458787030369784e-17, -2.4378312781526715e-18, 0.20924399590350129], [0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [0.20924399590350129, 1.037466821304857e-17, 2.8534529841944811e-17], [0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 2.1221913910406881e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-6.2458787030369784e-17, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -1.8159861628896471e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551], [-8.7960173255522026e-17, -0.20924399590350129, -1.0847245697358257e-17], [-6.5292109577311033e-17, -0.14795784842593551, 0.14795784842593551], [-2.8686173360993036e-17, -1.0585445965126596e-17, 0.20924399590350129], [4.1437442127796877e-19, 0.14795784842593551, 0.14795784842593551], [4.9628275511335239e-18, 0.20924399590350129, 2.8534529841944811e-17], [-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_5_3_closedShape" -p "feathers_5_3_closed";
	rename -uid "19A541A5-4968-F13A-75C1-209B88B3F359";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.3313938519380972 0.66524208549177777 -3.1429125744135292e-15
		4.3313938519380972 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_3_2_loc_closed" -p "feathers_5_2";
	rename -uid "EB4BFC78-4916-FF90-EA70-7D88498433EF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.0953136218444983 0.55374332496502732 -0.019234315562905734 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_2_loc_closedShape" -p "first_curve_3_2_loc_closed";
	rename -uid "61A1595A-4793-C640-A708-029901233269";
	setAttr -k off ".v";
createNode transform -n "feathers_5_2_closed" -p "feathers_5_2_group";
	rename -uid "4A3A9980-472C-E930-4C0D-4B937EF0EC46";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -2.023200527086173 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [0.20924399590350129, -1.7472360318056226e-33, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697358257e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [-2.0960114178175192e-17, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944811e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 1.3171102855728601e-15], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593557], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350132], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593557], [4.6461500403327819e-17, 0.20924399590350129, 1.3564920611121622e-15], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_5_2_closedShape" -p "feathers_5_2_closed";
	rename -uid "58F7889E-4A46-7135-86CD-86924FAF02F0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.3313938519380972 0.66524208549177777 -3.1429125744135292e-15
		4.3313938519380972 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_3_1_loc_closed" -p "feathers_5_1";
	rename -uid "72C7C2D7-4279-BFBA-D62B-C5A5A4866273";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_3_1_loc_closedShape" -p "first_curve_3_1_loc_closed";
	rename -uid "D6ABCDA9-426E-EE3C-B614-C5A23907870A";
	setAttr -k off ".v";
createNode transform -n "feathers_5_1_closed" -p "sec_3_1_group_2";
	rename -uid "20D80E64-49C3-4566-64A6-B28263436B67";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 3.5527136788005009e-15 3.5527136788005009e-15 
		0 ;
	setAttr -k on ".t";
	setAttr ".r" -type "double3" 0 0 4.1614799640518427 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002501e-15 -7.1054273576010003e-15 -7.1054273576010019e-15 ;
	setAttr ".rpt" -type "double3" 5.1094102919919533e-16 1.4763963337936848e-16 0 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" -3.9443045261050586e-31 1.5777218104420234e-30 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_3";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_3\", d= 1,p= [[6.3454774014574058, -0.36301388816728342, -0.23006014220542348], [6.5796345686126134, -0.36301388816728403, -4.7445500183583792e-07], [6.3454775373871879, -0.36301388816728403, 0.23005980186912786], [6.5796345686126134, -0.36301388816728403, -4.7445500217178443e-07], [2.6137529866747846e-15, -0.36301388816728403, 1.5368689743329442e-16], [4.9678493543574678e-15, 0.36301388816730751, 3.9549246272536903e-15], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730745, 0.23005957648993478], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730751, -0.23005957648991876]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_5_1_closedShape" -p "feathers_5_1_closed";
	rename -uid "64795EC9-4EE6-B4A6-1FA3-28BD5288A424";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		4.3313938519380972 0.66524208549177777 -3.1429125744135292e-15
		4.3313938519380972 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "sec_2_1_group" -p "sec_controls_group";
	rename -uid "70E06345-41CF-06EB-AB13-5A95B85DE972";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_4_1_closedGroup" -p "sec_2_1_group";
	rename -uid "003D05E9-4163-6A29-C93B-E1AE056FF306";
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode transform -n "feathers_4_1" -p "feathers_4_1_closedGroup";
	rename -uid "BF00DE15-4F14-3B28-1A4D-AA8053BB3B1F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002501e-15 -7.1054273576010003e-15 -7.1054273576010019e-15 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" -3.9443045261050582e-31 1.5777218104420233e-30 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_3";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_3\", d= 1,p= [[6.3454774014574058, -0.36301388816728342, -0.23006014220542348], [6.5796345686126134, -0.36301388816728403, -4.7445500183583792e-07], [6.3454775373871879, -0.36301388816728403, 0.23005980186912786], [6.5796345686126134, -0.36301388816728403, -4.7445500217178443e-07], [2.6137529866747846e-15, -0.36301388816728403, 1.5368689743329442e-16], [4.9678493543574678e-15, 0.36301388816730751, 3.9549246272536903e-15], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730745, 0.23005957648993478], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730751, -0.23005957648991876]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_4_1Shape" -p "feathers_4_1";
	rename -uid "79793F01-43BB-AABD-B568-5C9500FD34DB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.9341557820638009 0.66524208549177777 -3.1429125744135292e-15
		3.9341557820638009 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_4_1_loc" -p "feathers_4_1";
	rename -uid "13F08094-49A2-3CEE-B1BD-5EA7A0E68855";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_1_locShape" -p "first_curve_4_1_loc";
	rename -uid "8ABDBC74-4E6D-D2E0-8D3E-D1B710B442E1";
	setAttr -k off ".v";
createNode transform -n "feathers_4_2_group" -p "feathers_4_1";
	rename -uid "6C3F3FA7-4AE4-DDB2-24FC-A48E40E1769C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072214e-18 3.4694469519536142e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 6.9333477997940395e-33 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_4_2_closedGroup" -p "feathers_4_2_group";
	rename -uid "B09D2B23-4B67-759C-7D9F-96A9EC9A45B3";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 1 ;
createNode transform -n "feathers_4_2" -p "feathers_4_2_closedGroup";
	rename -uid "10FC9799-4B44-FC72-0254-F59630BBD40B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [0.20924399590350129, -1.7472360318056226e-33, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697358257e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [-2.0960114178175192e-17, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944811e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 1.3171102855728601e-15], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593557], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350132], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593557], [4.6461500403327819e-17, 0.20924399590350129, 1.3564920611121622e-15], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_4_2_loc" -p "feathers_4_2";
	rename -uid "4DDDE4F6-4849-B078-0777-3F89DB68EFA2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_2_locShape" -p "first_curve_4_2_loc";
	rename -uid "152BE662-49B2-A615-3943-7781CC3390A4";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_4_2Shape" -p "feathers_4_2";
	rename -uid "0285FD69-4814-41F6-3141-288FAA1D3E30";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.9341557820638009 0.66524208549177777 -3.1429125744135292e-15
		3.9341557820638009 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_4_3_group" -p "feathers_4_2";
	rename -uid "A8477CAC-4371-C488-16AB-09B017F3E29E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.938893903907233e-18 3.4694469519536136e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 -4.6222318665293715e-33 -6.1629758220391534e-33 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_4_3_closed" -p "feathers_4_3_group";
	rename -uid "B33BD34F-4EFE-3C92-9AD1-B3BE8CABE7CE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -16.061576018475741 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551], [-0.20924399590350129, 1.0374668213048572e-17, -1.0847245697358257e-17], [-0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [-6.2458787030369784e-17, -2.4378312781526715e-18, 0.20924399590350129], [0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [0.20924399590350129, 1.037466821304857e-17, 2.8534529841944811e-17], [0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 2.1221913910406881e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-6.2458787030369784e-17, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -1.8159861628896471e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551], [-8.7960173255522026e-17, -0.20924399590350129, -1.0847245697358257e-17], [-6.5292109577311033e-17, -0.14795784842593551, 0.14795784842593551], [-2.8686173360993036e-17, -1.0585445965126596e-17, 0.20924399590350129], [4.1437442127796877e-19, 0.14795784842593551, 0.14795784842593551], [4.9628275511335239e-18, 0.20924399590350129, 2.8534529841944811e-17], [-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "feathers_4_3_closedShape" -p "feathers_4_3_closed";
	rename -uid "0762A170-4805-61D7-ECFF-5BAE7348DA5C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.2989566907973877 0.66524208549177777 -3.1429125744135292e-15
		3.2989566907973877 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_4_3_closed_group" -p "feathers_4_3_group";
	rename -uid "AB8EDAEC-485A-E088-52C0-B4890D9898F2";
createNode transform -n "feathers_4_3" -p "feathers_4_3_closed_group";
	rename -uid "8F88200C-47E8-3413-0E61-F49975F0AF99";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -8.8817841970012523e-16 0 1.7763568394002505e-15 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1.0000000000000002 ;
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551], [-0.20924399590350129, 1.0374668213048572e-17, -1.0847245697358257e-17], [-0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [-6.2458787030369784e-17, -2.4378312781526715e-18, 0.20924399590350129], [0.14795784842593551, 1.3148629388709888e-18, 0.14795784842593551], [0.20924399590350129, 1.037466821304857e-17, 2.8534529841944811e-17], [0.14795784842593551, 1.9434473487226159e-17, -0.14795784842593551], [-2.8686173360993036e-17, 2.3187167704249769e-17, -0.20924399590350129], [-0.14795784842593551, 1.943447348722615e-17, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17], [-0.20924399590350129, 2.1221913910406881e-17, -1.744370149252922e-33], [-0.14795784842593551, -0.14795784842593551, 2.3793436725117095e-17], [-6.2458787030369784e-17, -0.20924399590350129, 3.3649000912126594e-17], [0.14795784842593551, -0.14795784842593551, 2.3793436725117055e-17], [0.20924399590350129, -1.8159861628896471e-17, 4.588702373670564e-33], [0.14795784842593551, 0.14795784842593551, -2.3793436725117095e-17], [-2.8686173360993036e-17, 0.20924399590350129, -3.3649000912126551e-17], [-0.14795784842593551, 0.14795784842593551, -2.3793436725117055e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_3\", per = True, d= 3,p= [[-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551], [-8.7960173255522026e-17, -0.20924399590350129, -1.0847245697358257e-17], [-6.5292109577311033e-17, -0.14795784842593551, 0.14795784842593551], [-2.8686173360993036e-17, -1.0585445965126596e-17, 0.20924399590350129], [4.1437442127796877e-19, 0.14795784842593551, 0.14795784842593551], [4.9628275511335239e-18, 0.20924399590350129, 2.8534529841944811e-17], [-1.770523612707721e-17, 0.14795784842593551, -0.14795784842593551], [-5.4311172343395376e-17, 2.3187167704249769e-17, -0.20924399590350129], [-8.341172012566672e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode transform -n "first_curve_4_3_loc" -p "feathers_4_3";
	rename -uid "429A2827-41C7-F60D-C1AE-C3ADE6CBEEA2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_3_locShape" -p "first_curve_4_3_loc";
	rename -uid "87E325BA-4180-CBD0-7D1E-1EBAC226127E";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_4_3Shape" -p "feathers_4_3";
	rename -uid "CE9E00B0-4E37-9BDB-6B6C-83ACB5BE31CC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.9341557820638009 0.66524208549177777 -3.1429125744135292e-15
		3.9341557820638009 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_4_4_loc_group" -p "feathers_4_3";
	rename -uid "06CE0B1C-4114-C089-C097-1E8F504DD231";
	setAttr ".t" -type "double3" 3.9341557820638009 0 1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000002 ;
createNode transform -n "first_curve_4_4_loc" -p "first_curve_4_4_loc_group";
	rename -uid "5CBDF38F-4B51-5CA2-BCDA-1CAE4B976BB7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_4_locShape" -p "first_curve_4_4_loc";
	rename -uid "F10AEB70-4ADC-94AB-3780-53A744903CAA";
	setAttr -k off ".v";
createNode transform -n "first_curve_4_4_loc_closed" -p "first_curve_4_4_loc_group";
	rename -uid "3B2F23C6-440A-E2C5-F544-7084B5998A8D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.18243376456436794 -0.39633104249226048 -0.22877898679439895 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_4_loc_closedShape" -p "first_curve_4_4_loc_closed";
	rename -uid "F0BCCCCF-45D7-5AAB-22D4-93AE38E76F95";
	setAttr -k off ".v";
createNode transform -n "first_curve_4_3_loc_closed" -p "feathers_4_3";
	rename -uid "0E452584-44BE-34BA-4CDF-2EB5B2BADDA1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.67012651400688461 0.1779258391713826 0.011340235030209074 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_3_loc_closedShape" -p "first_curve_4_3_loc_closed";
	rename -uid "6F987966-4AA7-1522-859B-6A970FD49EB5";
	setAttr -k off ".v";
createNode transform -n "first_curve_4_2_loc_closed" -p "feathers_4_2";
	rename -uid "A8CE9F23-458F-8400-77FF-5BA2BE442269";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.0017662328664322705 0.11079875482719659 -0.033562132879411219 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_2_loc_closedShape" -p "first_curve_4_2_loc_closed";
	rename -uid "6AF23B5C-4D57-E4CC-7277-48AA95D65940";
	setAttr -k off ".v";
createNode transform -n "feathers_4_2_closed" -p "feathers_4_2_group";
	rename -uid "2DBD11C5-4A62-676A-3298-A7804C980B3F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -1.0585146744731324 0.31161952346842542 0.13982474380369017 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -8.4298001520347992 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_3";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 1.3171102855728601e-15], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350132], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593557], [0.20924399590350129, -1.7472360318056226e-33, 1.3564920611121622e-15], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15], [-0.20924399590350129, 1.0847245697358257e-17, 1.3279575312702172e-15], [-0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [-2.0960114178175192e-17, -0.20924399590350129, 1.361606532182338e-15], [0.14795784842593551, -0.14795784842593551, 1.3517509679953348e-15], [0.20924399590350129, -2.8534529841944811e-17, 1.3279575312702172e-15], [0.14795784842593551, 0.14795784842593551, 1.3041640945450966e-15], [1.2812499491201259e-17, 0.20924399590350129, 1.2943085303580904e-15], [-0.14795784842593551, 0.14795784842593551, 1.3041640945450968e-15]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_3\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 1.3171102855728601e-15], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593557], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350132], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593557], [4.6461500403327819e-17, 0.20924399590350129, 1.3564920611121622e-15], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_4_2_closedShape" -p "feathers_4_2_closed";
	rename -uid "BC40CDE6-4F91-18FD-782F-7DB3E27DE41E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.0039361021429412 0.66524208549177777 -3.1429125744135292e-15
		3.0039361021429412 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_4_1_loc_closed" -p "feathers_4_1";
	rename -uid "1A4FBE97-4839-F928-3399-91B8BC004F3D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.026044778980996452 -0.34978809736789607 0.012679277062556379 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_4_1_loc_closedShape" -p "first_curve_4_1_loc_closed";
	rename -uid "BD9C779A-4375-292A-1E3F-D9ADA1E5F103";
	setAttr -k off ".v";
createNode transform -n "feathers_4_1_closed" -p "sec_2_1_group";
	rename -uid "453D094C-41FD-5823-11FC-0C8F92CABA57";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr ".r" -type "double3" 0 0 4.8357045052987369 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002509e-15 -7.1054273576010003e-15 -7.1054273576010019e-15 ;
	setAttr ".rpt" -type "double3" 3.6023599863935333e-16 2.0222966840406324e-16 -9.9464882917064994e-17 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" 3.9443045261050599e-31 1.5777218104420234e-30 0 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_3";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_3\", d= 1,p= [[6.3454774014574058, -0.36301388816728342, -0.23006014220542348], [6.5796345686126134, -0.36301388816728403, -4.7445500183583792e-07], [6.3454775373871879, -0.36301388816728403, 0.23005980186912786], [6.5796345686126134, -0.36301388816728403, -4.7445500217178443e-07], [2.6137529866747846e-15, -0.36301388816728403, 1.5368689743329442e-16], [4.9678493543574678e-15, 0.36301388816730751, 3.9549246272536903e-15], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730745, 0.23005957648993478], [6.5796344257966233, 0.36301388816730751, 6.5048188338208818e-15], [6.3454770960358795, 0.36301388816730751, -0.23005957648991876]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_4_1_closedShape" -p "feathers_4_1_closed";
	rename -uid "77F4AB3F-462E-19A2-1AB1-8B893FB5F332";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.0039361021429412 0.66524208549177777 -3.1429125744135292e-15
		3.0039361021429412 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "sec_1_1_group" -p "sec_controls_group";
	rename -uid "A6164062-40A2-6E5C-7036-0B8DFF1F40C8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_1_1_closed" -p "sec_1_1_group";
	rename -uid "8C16D032-44C9-8091-C1DE-0AA6CB527DC2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_6";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_6\", d= 1,p= [[4.4393581891245546, -0.36301388816728464, -0.23006014220543033], [4.6735153562797693, -0.36301388816728553, -4.7445500832342113e-07], [4.4393583250543447, -0.36301388816728553, 0.23005980186912081], [4.6735153562797693, -0.36301388816728553, -4.7445500865936885e-07], [3.9168712948129917e-15, -0.36301388816728464, -6.7262461153569524e-15], [6.2709676624956757e-15, 0.3630138881673069, -2.925008385536547e-15], [4.6735152134637543, 0.3630138881673064, 1.723521564443658e-17], [4.4393578837030265, 0.3630138881673064, 0.23005957648992781], [4.6735152134637543, 0.3630138881673064, 1.723521564443658e-17], [4.4393578837030265, 0.3630138881673064, -0.23005957648992559]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_1_1_closedShape" -p "feathers_1_1_closed";
	rename -uid "1425AA15-41A8-E11A-62C6-9183F4F2A3F3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		2.0551580376861689 0.66524208549177777 -3.1429125744135292e-15
		2.0551580376861689 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_1_1_closed_group" -p "sec_1_1_group";
	rename -uid "675A05D5-4D45-33DC-75EC-F3919078EAB6";
createNode transform -n "feathers_1_1" -p "feathers_1_1_closed_group";
	rename -uid "3B2E431A-4834-1FA0-30DD-BCB972B83E2D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 1.7763568394002505e-15 8.8817841970012523e-16 
		-3.7816971776294395e-16 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 -7.1054273576010034e-15 -7.1054273576010034e-15 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-15 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".spt" -type "double3" 0 -1.5777218104420243e-30 -1.5777218104420243e-30 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "feathers_6";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"feathers_6\", d= 1,p= [[4.4393581891245546, -0.36301388816728464, -0.23006014220543033], [4.6735153562797693, -0.36301388816728553, -4.7445500832342113e-07], [4.4393583250543447, -0.36301388816728553, 0.23005980186912081], [4.6735153562797693, -0.36301388816728553, -4.7445500865936885e-07], [3.9168712948129917e-15, -0.36301388816728464, -6.7262461153569524e-15], [6.2709676624956757e-15, 0.3630138881673069, -2.925008385536547e-15], [4.6735152134637543, 0.3630138881673064, 1.723521564443658e-17], [4.4393578837030265, 0.3630138881673064, 0.23005957648992781], [4.6735152134637543, 0.3630138881673064, 1.723521564443658e-17], [4.4393578837030265, 0.3630138881673064, -0.23005957648992559]])']";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "feathers_1_2_group" -p "feathers_1_1";
	rename -uid "71444633-4B3C-5BF9-45FD-E981B4D36AEF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536148e-17 ;
	setAttr ".rpt" -type "double3" -3.453171687182281e-17 0 -3.133787226542746e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 0 6.1629758220391561e-33 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_1_2_group_1" -p "feathers_1_2_group";
	rename -uid "E4821A0A-46C6-5628-ADA3-7397059340B2";
createNode transform -n "feathers_1_2_closed" -p "feathers_1_2_group_1";
	rename -uid "EBC3CB26-4FFD-1791-770B-9CB4C28D80E8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 0 -8.8817841970012523e-16 2.2204460492503131e-16 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_0";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_0\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 3.0651427154835961e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 7.0033202694139129e-17], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_0\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.770523612707721e-17], [1.2812499491201259e-17, 0.20924399590350129, 7.8496719400677153e-18], [-0.14795784842593551, 0.14795784842593551, 1.7705236127077256e-17], [-0.20924399590350129, 1.0847245697358257e-17, 4.149867285219428e-17], [-0.14795784842593551, -0.14795784842593551, 6.5292109577311033e-17], [-2.0960114178175192e-17, -0.20924399590350129, 7.5147673764320659e-17], [0.14795784842593551, -0.14795784842593551, 6.5292109577311008e-17], [0.20924399590350129, -2.8534529841944811e-17, 4.1498672852194286e-17], [0.14795784842593551, 0.14795784842593551, 1.770523612707721e-17], [1.2812499491201259e-17, 0.20924399590350129, 7.8496719400677153e-18], [-0.14795784842593551, 0.14795784842593551, 1.7705236127077256e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_0\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 3.0651427154835961e-17], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593551], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350129], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593551], [4.6461500403327819e-17, 0.20924399590350129, 7.0033202694139129e-17], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "-8.881784197001252e-16";
	setAttr ".default_translateZ" -type "string" "2.220446049250313e-16";
	setAttr ".default_translate" -type "string" "[(0.0, -8.881784197001252e-16, 2.220446049250313e-16)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_1_2_closedShape" -p "feathers_1_2_closed";
	rename -uid "89583BCB-430E-42C4-7255-32B28061E816";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		2.0551580376861689 0.66524208549177777 -3.1429125744135292e-15
		2.0551580376861689 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_1_2_closed_group" -p "feathers_1_2_group_1";
	rename -uid "1FFAE939-4A2F-668B-F733-8884F38714D8";
createNode transform -n "feathers_1_2" -p "feathers_1_2_closed_group";
	rename -uid "A0EF35AD-4459-61B4-7744-EB808DEDB7C4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -1.7763568394002505e-15 -9.4368957093138306e-16 
		1.3322676295501878e-15 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve2_0";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve2_0\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 3.0651427154835961e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 7.0033202694139129e-17], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_0\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 1.770523612707721e-17], [1.2812499491201259e-17, 0.20924399590350129, 7.8496719400677153e-18], [-0.14795784842593551, 0.14795784842593551, 1.7705236127077256e-17], [-0.20924399590350129, 1.0847245697358257e-17, 4.149867285219428e-17], [-0.14795784842593551, -0.14795784842593551, 6.5292109577311033e-17], [-2.0960114178175192e-17, -0.20924399590350129, 7.5147673764320659e-17], [0.14795784842593551, -0.14795784842593551, 6.5292109577311008e-17], [0.20924399590350129, -2.8534529841944811e-17, 4.1498672852194286e-17], [0.14795784842593551, 0.14795784842593551, 1.770523612707721e-17], [1.2812499491201259e-17, 0.20924399590350129, 7.8496719400677153e-18], [-0.14795784842593551, 0.14795784842593551, 1.7705236127077256e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve2_0\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 3.0651427154835961e-17], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593551], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350129], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593551], [4.6461500403327819e-17, 0.20924399590350129, 7.0033202694139129e-17], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "-8.881784197001252e-16";
	setAttr ".default_translateZ" -type "string" "2.220446049250313e-16";
	setAttr ".default_translate" -type "string" "[(0.0, -8.881784197001252e-16, 2.220446049250313e-16)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_7_2_loc" -p "feathers_1_2";
	rename -uid "5D81A14D-41EB-3A54-B5B5-EB8F983B469A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_2_locShape" -p "first_curve_7_2_loc";
	rename -uid "76B8E47D-4B7D-31C3-4170-AA8370940886";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_1_2Shape" -p "feathers_1_2";
	rename -uid "1D487424-4BD3-60A2-CB83-6B811555708C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.5410818707695939 0.66524208549177777 -3.1429125744135292e-15
		3.5410818707695939 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_1_3_group" -p "feathers_1_2";
	rename -uid "A9BD4919-4EDF-227C-59E6-C797D56A4006";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536148e-17 ;
	setAttr ".sp" -type "double3" 0 -6.9388939039072284e-18 3.4694469519536142e-17 ;
	setAttr ".spt" -type "double3" 0 0 6.1629758220391575e-33 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode transform -n "feathers_1_3_closed" -p "feathers_1_3_group";
	rename -uid "98822DA8-4915-DDCB-313A-51B93D7D5023";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v" no;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_0";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_0\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 7.2150100007030223e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 1.1153187554633412e-16], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_0\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17], [1.2812499491201259e-17, 0.20924399590350129, 4.9348344792262003e-17], [-0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17], [-0.20924399590350129, 1.0847245697358257e-17, 8.299734570438856e-17], [-0.14795784842593551, -0.14795784842593551, 1.0679078242950557e-16], [-2.0960114178175192e-17, -0.20924399590350129, 1.1664634661651427e-16], [0.14795784842593551, -0.14795784842593551, 1.0679078242950553e-16], [0.20924399590350129, -2.8534529841944811e-17, 8.2997345704388573e-17], [0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17], [1.2812499491201259e-17, 0.20924399590350129, 4.9348344792262003e-17], [-0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_0\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 7.2150100007030223e-17], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593551], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350129], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593551], [4.6461500403327819e-17, 0.20924399590350129, 1.1153187554633412e-16], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "feathers_1_3_closedShape" -p "feathers_1_3_closed";
	rename -uid "024A9521-4116-A9F0-AF0D-0DAA6E927C32";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		2.0551580376861689 0.66524208549177777 -3.1429125744135292e-15
		2.0551580376861689 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "feathers_1_3_closed_group" -p "feathers_1_3_group";
	rename -uid "04B560A8-456B-6D8E-BB0B-3DAEB4B414B9";
createNode transform -n "feathers_1_3" -p "feathers_1_3_closed_group";
	rename -uid "42A7C33D-4D92-603A-221B-38B0D7D56997";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -8.8817841970012523e-16 -5.5511151231257827e-17 
		0 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".moduleName" -type "string" "l_wing";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "curve3_0";
	setAttr -l on ".customShapeCommand" -type "string" (
		"[u'cmds.curve(name = \"curve3_0\", per = True, d= 3,p= [[0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551], [-0.20924399590350129, 6.6420223614173527e-34, 7.2150100007030223e-17], [-0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [-2.0960114178175192e-17, -1.2812499491201269e-17, 0.20924399590350129], [0.14795784842593551, -9.0598052741775678e-18, 0.14795784842593551], [0.20924399590350129, -1.7472360318056226e-33, 1.1153187554633412e-16], [0.14795784842593551, 9.0598052741775724e-18, -0.14795784842593551], [1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-0.14795784842593551, 9.0598052741775678e-18, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_0\", per = True, d= 3,p= [[0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17], [1.2812499491201259e-17, 0.20924399590350129, 4.9348344792262003e-17], [-0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17], [-0.20924399590350129, 1.0847245697358257e-17, 8.299734570438856e-17], [-0.14795784842593551, -0.14795784842593551, 1.0679078242950557e-16], [-2.0960114178175192e-17, -0.20924399590350129, 1.1664634661651427e-16], [0.14795784842593551, -0.14795784842593551, 1.0679078242950553e-16], [0.20924399590350129, -2.8534529841944811e-17, 8.2997345704388573e-17], [0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17], [1.2812499491201259e-17, 0.20924399590350129, 4.9348344792262003e-17], [-0.14795784842593551, 0.14795784842593551, 5.9203908979271518e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', u'cmds.curve(name = \"curve3_0\", per = True, d= 3,p= [[2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551], [-4.6461500403327819e-17, -0.20924399590350129, 7.2150100007030223e-17], [-2.3793436725117095e-17, -0.14795784842593551, 0.14795784842593551], [1.2812499491201259e-17, -2.0960114178175192e-17, 0.20924399590350129], [4.191304727347223e-17, 0.14795784842593551, 0.14795784842593551], [4.6461500403327819e-17, 0.20924399590350129, 1.1153187554633412e-16], [2.3793436725117095e-17, 0.14795784842593551, -0.14795784842593551], [-1.2812499491201259e-17, 1.2812499491201259e-17, -0.20924399590350129], [-4.191304727347223e-17, -0.14795784842593551, -0.14795784842593551]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "first_curve_7_3_loc" -p "feathers_1_3";
	rename -uid "6ABD2D4C-438C-8D18-8EAA-EBA4797C14A7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_3_locShape" -p "first_curve_7_3_loc";
	rename -uid "4A2B739E-4AB0-2547-867A-ED968542FD90";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_1_3Shape" -p "feathers_1_3";
	rename -uid "A5600055-4366-7827-7002-17A232961696";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.5410818707695939 0.66524208549177777 -3.1429125744135292e-15
		3.5410818707695939 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_7_4_loc_group" -p "feathers_1_3";
	rename -uid "11C4CDE4-40FE-AA1B-4027-5B97FECB0F3C";
	setAttr ".t" -type "double3" 3.5410818707695939 0 4.4408920985006262e-16 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
createNode transform -n "first_curve_7_4_loc" -p "first_curve_7_4_loc_group";
	rename -uid "F688CD6A-414F-A7D8-FBAF-2F8AFDB17FDD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_4_locShape" -p "first_curve_7_4_loc";
	rename -uid "DE7E9229-4D2D-B4BF-244D-0AA7C117351A";
	setAttr -k off ".v";
createNode transform -n "first_curve_7_4_loc_closed" -p "first_curve_7_4_loc_group";
	rename -uid "F6C4CA92-4455-493F-5B85-6DA7C554D8D1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.67541639337809944 -0.059593682956193314 -0.017487541640061791 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_4_loc_closedShape" -p "first_curve_7_4_loc_closed";
	rename -uid "B2792DD4-4F50-FB86-E221-B6AD93019160";
	setAttr -k off ".v";
createNode transform -n "first_curve_7_3_loc_closed" -p "feathers_1_3";
	rename -uid "6D35D28C-4273-8601-885F-1DA99C17F521";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.8163916471489756e-15 -0.12437664170968377 8.3266726846886741e-17 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_3_loc_closedShape" -p "first_curve_7_3_loc_closed";
	rename -uid "63891D24-4520-5206-B31F-8487F13AFA6F";
	setAttr -k off ".v";
createNode transform -n "first_curve_7_2_loc_closed" -p "feathers_1_2";
	rename -uid "9AA7C1A3-4636-3D0D-B032-B7890F54CAB9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.59827478284237023 -0.12114139061032861 -3.7470027081099033e-16 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_2_loc_closedShape" -p "first_curve_7_2_loc_closed";
	rename -uid "1461323B-4579-8163-4FD9-88A2FCD6096D";
	setAttr -k off ".v";
createNode nurbsCurve -n "feathers_1_1Shape" -p "feathers_1_1";
	rename -uid "95D7D5E7-4943-F2EB-B715-6DA3ADDA6BDF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		3.5410818707695939 0.66524208549177777 -3.1429125744135292e-15
		3.5410818707695939 -0.66524208549180519 -3.1429125744135292e-15
		0.18236945941928415 -0.66524208549180519 -9.7795480650489808e-16
		0.18236945941928415 0.66524208549177777 -9.7795480650489808e-16
		;
createNode transform -n "first_curve_7_1_loc" -p "feathers_1_1";
	rename -uid "AA36C8CD-4D9F-9F33-8418-C699EE526BCD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_1_locShape" -p "first_curve_7_1_loc";
	rename -uid "3AF1BCAB-4EF1-FC2F-17BA-BE8D6BB5EEF4";
	setAttr -k off ".v";
createNode transform -n "first_curve_7_1_loc_closed" -p "feathers_1_1";
	rename -uid "7A9977F7-4344-7001-F7DD-24AD13851F86";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.34596935332736301 -0.41024349337608884 0.54630533520847835 ;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode locator -n "first_curve_7_1_loc_closedShape" -p "first_curve_7_1_loc_closed";
	rename -uid "5D2A4641-40D5-9B6E-D7D0-41A1D51D581B";
	setAttr -k off ".v";
createNode transform -n "system" -p "mod";
	rename -uid "FE179AF5-4A8C-231C-5748-54BB06F5C2D0";
createNode transform -n "ik_joints" -p "system";
	rename -uid "AC084F1B-4874-283C-C51D-698CA296030F";
	setAttr ".v" no;
createNode joint -n "a_ikJoint" -p "ik_joints";
	rename -uid "FA924683-40BD-9D86-FBCE-79A11D77F548";
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" -4.2414740718631186e-06 -2.82391361120231e-05 -9.8084618406878037e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "b_ikJoint" -p "a_ikJoint";
	rename -uid "98E2BC77-4808-1465-66E8-52A1A77BD428";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 9.4096870422363281 0 -1.6653345369377336e-15 ;
	setAttr ".r" -type "double3" 0 -19.440528730996938 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -5 0 ;
createNode joint -n "end_ikJoint" -p "b_ikJoint";
	rename -uid "8BC3DB6E-47B0-F46A-457E-E49606C3317B";
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode ikEffector -n "effector" -p "b_ikJoint";
	rename -uid "919069F1-479D-4C98-4862-3B8D9FBC488B";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".hd" yes;
createNode transform -n "joints" -p "system";
	rename -uid "551B7878-48A9-02F4-9E58-B9A5A816FD16";
createNode joint -n "a_finalJoint" -p "joints";
	rename -uid "FC07311D-4826-913A-F188-A19C34DF620E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.09961607666187984 0.0055378625360235382 -0.0067800699868501638 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 0.0070934636314600244 -0.0056734465564594666 0.099586619472096516 0
		 0.32123309041702086 2.3902817968656178 -0.054956858176564261 1;
	setAttr ".ds" 2;
createNode joint -n "b_finalJoint" -p "a_finalJoint";
	rename -uid "0702E35F-4614-4285-6914-6DA098A73FB4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.099691102795354883 0.0047514142680777855 0.0062536458085739538 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 -0.005946762080523681 -0.0063466510657197535 0.099621062235892885 0
		 0.8016236508328034 2.4169876959165881 -0.087653203282550218 1;
	setAttr ".ds" 2;
createNode joint -n "end_finalJoint" -p "b_finalJoint";
	rename -uid "A1D56032-4CA7-2729-ECF9-26A2C7C8958C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".ds" 2;
createNode parentConstraint -n "end_joint_parentConstraint1" -p "end_finalJoint";
	rename -uid "ED2AEF38-4815-F345-75FB-C9A8E00B446E";
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
	setAttr ".lr" -type "double3" -1.4824075936509984 14.785057683817927 0.23258295376548604 ;
	setAttr ".rst" -type "double3" 2.161307049502966 0.029976148749351963 -0.079060712407660994 ;
	setAttr ".rsrr" -type "double3" 1.8436269137598027 29.243973811402793 1.6517385454817457 ;
	setAttr ".int" 2;
	setAttr -k on ".w1";
	setAttr -k on ".w0";
createNode transform -n "ik_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "1C436240-4D60-CB08-1DAE-64B95FF43680";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "ik_end_ikFkSwitchHelperShape" -p "ik_end_ikFkSwitchHelper";
	rename -uid "E1C60127-4C99-7D09-B648-E59E69822972";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "FD737570-4674-4EF0-F225-348272E966C9";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "fk_end_ikFkSwitchHelperShape" -p "fk_end_ikFkSwitchHelper";
	rename -uid "421B6B70-4276-7A53-037D-CA88A9B7696C";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "b_finalJoint_init_direction" -p "end_finalJoint";
	rename -uid "C89D9DFC-4AB5-2E66-76B1-AEB5A2093F2E";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -1.0658141036401503e-14 -1.7763568394002505e-15 4.4408920985006262e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1.0000000000000004 ;
createNode locator -n "b_finalJoint_init_directionShape" -p "b_finalJoint_init_direction";
	rename -uid "EE8D1BB2-42EA-F9FD-26C6-41B1F9A6376B";
	setAttr -k off ".v";
	setAttr ".oc" 6;
createNode transform -n "sec_2_root_init_2" -p "end_finalJoint";
	rename -uid "D1D9B35C-431A-3561-76FF-90A4E54AD414";
	setAttr ".opm" -type "matrix" 0.11567477300179774 -0.057989449892951052 -0.99159294601771719 0
		 0.00671922358963174 0.99831719593579715 -0.057598857048031936 0 0.99326441541280175 -5.8980598183211421e-16 0.11586975910333508 0
		 1.7991449571346081 1.5328241116438299 -1.236818212989973 1;
createNode transform -n "curveStart_locator" -p "b_finalJoint";
	rename -uid "4E0CB780-41CF-4174-308D-97AFEFA5FB64";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "curveStart_locatorShape" -p "curveStart_locator";
	rename -uid "028AB9FA-46C7-764D-6A1C-759FA80F5642";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode parentConstraint -n "b_joint_parentConstraint1" -p "b_finalJoint";
	rename -uid "6EC8138C-4293-F1BF-B327-A18AFED45393";
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
	setAttr ".lr" -type "double3" 0 -24.440528730996938 0 ;
	setAttr ".rst" -type "double3" 2.2681055008005182 0.036040713028121597 -0.1204070915889166 ;
	setAttr ".rsrr" -type "double3" -0.10474226879154834 -52.816060736806094 -0.3565215501189829 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "fk_b_ikFkSwitchHelper" -p "b_finalJoint";
	rename -uid "F436DC51-4B35-FCB3-341E-29806430380A";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687512 0 ;
createNode locator -n "fk_b_ikFkSwitchHelperShape" -p "fk_b_ikFkSwitchHelper";
	rename -uid "58765A3E-4449-941B-4A2F-75814A6F0D29";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "middle_volume_outJoint" -p "b_finalJoint";
	rename -uid "EF257582-429B-B832-251A-7CA353D01140";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ds" 2;
	setAttr ".radi" 3.8200000000000003;
createNode parentConstraint -n "a_joint_parentConstraint1" -p "a_finalJoint";
	rename -uid "7BCE81B9-433E-0417-EFEC-BD8BF28CFA43";
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
	setAttr ".lr" -type "double3" 1.5639204187991673 9.6578762380868852 0.037470373511272859 ;
	setAttr ".rst" -type "double3" -8.1139024314801804e-17 2.0284756078700451e-17 2.4341707294440544e-16 ;
	setAttr ".rsrr" -type "double3" -2.7624631311983412e-16 -7.3523463271148621e-34 
		-3.0498753761064987e-16 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "ik_root_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "E3180A85-43E9-A43D-1222-FF881BE6D251";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "ik_root_ikFkSwitchHelperShape" -p "ik_root_ikFkSwitchHelper";
	rename -uid "61784B79-41F5-8193-6D62-A4A5D267421E";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_a_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "9851B9B8-4ECF-6C54-0112-BD8C7B8F01E3";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "fk_a_ikFkSwitchHelperShape" -p "fk_a_ikFkSwitchHelper";
	rename -uid "B4A1764A-4F99-B944-8C01-D5B4B60E0CF2";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "root_volume_outJoint" -p "a_finalJoint";
	rename -uid "D6BC7FC3-4FC0-822B-752B-11872AA9E34C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ds" 2;
	setAttr ".radi" 3.8200000000000003;
createNode ikHandle -n "ikHandle" -p "system";
	rename -uid "0409717E-429B-751D-D59B-1EBC0CDCE49B";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle_poleVectorConstraint1" -p "ikHandle";
	rename -uid "F75AAD44-43B5-5BC5-2CA1-F19270C2474E";
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
createNode transform -n "output" -p "mod";
	rename -uid "DF649B76-48E9-A0FC-EC44-378CEDF09525";
createNode transform -n "outJoints" -p "output";
	rename -uid "EEFE76F0-4460-23D9-AB11-CDB564BA325A";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "B4EEBA90-43F0-C6DB-D267-6E977F446726";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode joint -n "start_outJoint" -p "root_outJoint";
	rename -uid "8BF0C162-4E3E-E342-64F4-C6BEE87D4F82";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode joint -n "middle_outJoint" -p "start_outJoint";
	rename -uid "DFB4338B-429F-2E2D-76D9-01A20A52C996";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -s 2 ".iog";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000259339796214 0 -0.0029881482422647126 0 0 1 0 0
		 0.0029880574101934557 0 0.9999955357464918 0 2.236129877159025 0 0.005211601042381415 1;
createNode joint -n "end_outJoint" -p "middle_outJoint";
	rename -uid "63667965-495B-E401-6058-27B1D154DA23";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -s 2 ".iog";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_out_grp" -p "output";
	rename -uid "2EAF6A5D-4720-E6DD-3F31-FCB219205BCD";
	setAttr ".v" no;
createNode transform -n "fk_out" -p "fk_out_grp";
	rename -uid "E00A0256-4BC1-5E96-CA94-628026937785";
createNode locator -n "fk_outShape" -p "fk_out";
	rename -uid "B04F1218-4F3E-4253-1AF5-D8814F2E840A";
	setAttr -k off ".v";
createNode transform -n "ik_out_grp" -p "output";
	rename -uid "FC09702A-40BE-1107-19C0-FA870CA618A7";
	setAttr ".v" no;
createNode transform -n "ik_out" -p "ik_out_grp";
	rename -uid "3BF84775-431D-A483-1A15-AA85C2AD5D88";
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "A3416898-480C-E80A-8AB9-EFBC404F9A84";
	setAttr -k off ".v";
createNode transform -n "ik_out_initLoc" -p "ik_out";
	rename -uid "5D8AE3B4-457F-68C9-F93F-50952019A657";
createNode locator -n "ik_out_initLocShape" -p "ik_out_initLoc";
	rename -uid "D4CD3B5F-4C16-088E-C884-D380F787BC33";
	setAttr -k off ".v";
createNode transform -n "ikRev_out" -p "ik_out_grp";
	rename -uid "0D92D864-43CD-4FA2-2362-8382FD7FB36C";
createNode locator -n "ikRev_outShape" -p "ikRev_out";
	rename -uid "32E00B62-4D20-09F0-A735-49A6232028E4";
	setAttr -k off ".v";
createNode transform -n "suff_group" -p "output";
	rename -uid "16E7186B-42F3-A980-828B-C5A4F34522BD";
createNode transform -n "surf" -p "suff_group";
	rename -uid "280048D8-4A1A-5D1E-0D65-0CA61E6F95AC";
	addAttr -ci true -sn "dr" -ln "dropoff" -dv 4 -min 0 -max 20 -at "double";
	addAttr -ci true -sn "wsm" -ln "wrapSamples" -dv 10 -min 1 -at "short";
	setAttr ".v" no;
	setAttr -k on ".dr";
	setAttr -k on ".wsm";
createNode nurbsSurface -n "surfShape" -p "surf";
	rename -uid "EE7F09E6-4B6D-3D26-394D-EAAE044E7C3C";
	setAttr -k off ".v";
	setAttr ".mb" no;
	setAttr ".csh" no;
	setAttr ".rcsh" no;
	setAttr ".vis" no;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
createNode nurbsSurface -n "surfShapeOrig" -p "surf";
	rename -uid "C7726EDB-4BA8-7643-B640-1EAE7182C5EF";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".rcsh" no;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 2;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		6 0 0 0 1 1 1
		
		28
		18.872583932545261 9.736373769459858 -2.1492906807240884
		22.988879784599625 9.7345207948274926 -1.9337761601603165
		27.105175636653989 9.7326678201951271 -1.7182616395965462
		31.221471488708353 9.7308148455627599 -1.5027471190327728
		18.872583932545261 9.736373769459858 -2.1492906807240884
		22.479312081446484 9.997933407786654 -4.2292930904833721
		26.086040230347713 10.259493046113446 -6.3092955002426532
		29.692768379248943 10.521052684440239 -8.3892979100019378
		18.872583932545261 9.736373769459858 -2.1492906807240884
		20.655540268339422 10.190089519689121 -5.6670505570744769
		22.438496604133583 10.64380526991838 -9.1848104334248628
		24.221452939927744 11.09752102014764 -12.70257030977525
		15.89984903956535 9.7326636808791935 -2.9793828188630602
		16.682033804685094 10.076981436570787 -6.4281805085235053
		17.464218569804842 10.42129919226238 -9.8769781981839468
		18.24640333492459 10.765616947953973 -13.325775887844392
		12.927114146585442 9.7289535922985237 -3.8094749570020281
		12.85460708497272 10.006308165074154 -6.9327467027320004
		12.782100023359995 10.283662737849784 -10.056018448461973
		12.709592961747273 10.561017310625415 -13.179290194191946
		9.3267459568349871 10.040059743492041 -3.1361886976281061
		8.5132771095929467 10.507026760139142 -6.3243356398118618
		7.6998082623509054 10.973993776786244 -9.5124825819956165
		6.8863394151088659 11.440960793433346 -12.700629524179373
		5.7263777670845402 10.351165894685558 -2.4629024382541846
		4.3135127120978076 10.926109168374255 -5.1789082819565184
		2.9006476571110738 11.501052442062957 -7.8949141256588522
		1.4877826021243401 12.075995715751656 -10.610919969361188
		
		;
createNode transform -s -n "persp";
	rename -uid "78F7E0CF-4DFD-ED4C-2210-7E8583425325";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 18.341356221898003 45.647741668427109 27.705910843836392 ;
	setAttr ".r" -type "double3" -48.000000000509736 356.79999999958744 1.9909510380860035e-16 ;
	setAttr ".rp" -type "double3" 9.2370555648813024e-14 6.0396132539608516e-14 -1.2967404927621828e-13 ;
	setAttr ".rpt" -type "double3" 3.1130132316051067e-14 -1.565334175653936e-13 6.2587732248230867e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "BB7D5C00-4F3D-6590-9630-5C94AAA13631";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".fcp" 50000;
	setAttr ".coi" 49.704488051603292;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 31.244315851026759 10.7905196565455 -0.33905114007539683 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "464F93A3-4F2E-8B14-7490-E2BA29C0124E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 24.596807338007224 60.09521689639918 -4.4583590795327837 ;
	setAttr ".r" -type "double3" -90 360 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "1C16BDB1-4092-68EC-0F1E-979217A110C5";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 45.863342574126847;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F04A35A4-4E0E-CD4B-48AA-89A9A51F2BB3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 8.7736509551692183 9.1709492167533018 30.10988695242078 ;
	setAttr ".r" -type "double3" 0 -360 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E50E2652-4361-6C41-61D4-33BC7C308B5D";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 38.555761846293379;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "7750B7DB-430B-DD5E-EA9E-34A008E257F1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -30.506874783001134 8.5222935845134593 -7.6851854915474487 ;
	setAttr ".r" -type "double3" 0 270 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "B02D002B-4594-8E8C-A829-2A94BE60F97F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 41.225019106493193;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "curve8";
	rename -uid "C2B0B865-4F5A-520B-ACED-B8B59C74496F";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape8" -p "curve8";
	rename -uid "F21A16C6-4C0D-3CFB-D33F-A2A28F3DB02D";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		5.7753136415069841 0 -2.595065008586003
		5.879030817946302 0 -5.257139203861855
		4.9801486221388727 0 -9.3712538692881751
		3.631825328427726 0 -11.272735437342359
		;
createNode transform -n "curve9";
	rename -uid "5746CA21-4ADB-87D7-D57A-C58411E46A12";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape9" -p "curve9";
	rename -uid "BE9A67F4-4557-69F5-BB20-9D944C254180";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		9.4803602415097288 0 -3.1786848207628804
		9.4486538554101465 0 -5.9084707973081807
		8.654675762888095 0 -9.9490008502280194
		7.8551077717287434 0 -13.872992106474248
		;
createNode transform -n "curve10";
	rename -uid "A3C06EA2-43D6-06FF-1FA5-44BBBE321A67";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape10" -p "curve10";
	rename -uid "FCD8CF1B-4E62-AE62-E5EA-56870A155CED";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		13.259486120585553 0 -3.9267449790167168
		13.444364678683455 0 -6.2233610671670423
		12.975264002457633 0 -10.588768536383126
		12.392280955495774 0 -15.234709606620958
		;
createNode transform -n "curve11";
	rename -uid "5247CA7D-49C5-5730-DF57-51BA24F7012D";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape11" -p "curve11";
	rename -uid "FE2AFFC3-44CA-D8BA-B01A-F4AD1993FED7";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		17.910562247304011 0 -3.5299855642581215
		19.039475737118568 0 -5.429216271776248
		20.303054614472643 0 -10.805353480580626
		20.550313853601157 0 -15.487392041518071
		;
createNode transform -n "curve12";
	rename -uid "11A32264-4C28-44E5-FE70-4DAB6B88522D";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape12" -p "curve12";
	rename -uid "633F592B-422F-F478-932A-4785007F388D";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		22.466190766765894 0 -2.5106925814417216
		24.165319416459113 0 -3.1550743577026221
		27.378162791590579 0 -8.3507241130090932
		29.177614130801093 0 -14.187882376333143
		;
createNode transform -n "curve13";
	rename -uid "12321D0B-4600-4638-6C9C-9F97B5E11E70";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape13" -p "curve13";
	rename -uid "5BD25BFC-47A8-CEBC-A26E-7FB17486EF53";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		23.298277570643361 0 -1.6786057775642558
		25.588543576494185 0 -1.8574288000235937
		31.396678066983718 0 -4.7926637129214233
		35.54026331684021 0 -9.4996145550411519
		;
createNode transform -n "curve14";
	rename -uid "8DBDE43D-4971-CE2E-E353-ACAE4696B8F8";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape14" -p "curve14";
	rename -uid "7E10754C-4774-8210-C817-0793195583FA";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		23.402288421128041 0 -0.56048913485391161
		25.128088701188723 0 -0.3086260376324903
		32.610604556425393 0 0.23048038131999249
		38.805306978097143 0 -0.16493844657584766
		;
createNode transform -n "curve15";
	rename -uid "A2BEFA55-4AE9-A7CE-9140-2698EC30A581";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape15" -p "curve15";
	rename -uid "D1C33BA5-456A-D360-0F53-3B8851D9476D";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 2 0 no 3
		5 0 0 1 2 2
		4
		22.466190766765894 0 0.011570542811845552
		24.081600348221759 0 0.9471599859278621
		32.275728283475956 0 4.6675909978999117
		38.889026046334493 0 5.9884130688698889
		;
createNode objectSet -n "sets";
	rename -uid "6F26346F-4878-304A-709C-6F90CEF98255";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "B309C9DD-473B-EB89-3518-F0AB7FF57744";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode makeNurbSphere -n "l_arm_makeNurbSphere1";
	rename -uid "F190F30C-4EF1-497E-E41E-3CBA9EB716F8";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "l_arm_size_multiplyDivide";
	rename -uid "AB3E8743-4503-857C-5531-A4B3ABDD27B1";
createNode multDoubleLinear -n "l_arm_multDoubleLinear438";
	rename -uid "FAC56CB2-4B11-59AD-FCB8-3A8E0C83D7B6";
createNode decomposeMatrix -n "l_arm_mainPoser_decomposeMatrix";
	rename -uid "ED765639-4473-0461-4C07-C687EB8B3BE9";
createNode multiplyDivide -n "l_arm_multiplyDivide353";
	rename -uid "1EA42746-464F-1CFC-2EA3-7EA171C6CA80";
	setAttr ".i2" -type "float3" -1 1 1 ;
createNode condition -n "mirror_condition";
	rename -uid "F0E6C4D9-4057-8F46-A1F5-CAAC2BA93AC0";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 180 -90 ;
	setAttr ".cf" -type "float3" 1 0 0 ;
createNode multiplyDivide -n "multiplyDivide357";
	rename -uid "166810DE-4E0C-13A1-75C5-45BBB84F18E2";
createNode multDoubleLinear -n "aimOffset_scaled";
	rename -uid "B97DABED-4091-8414-CBC5-899491A1508C";
	setAttr ".i2" 1;
createNode vectorProduct -n "l_arm_middleOut_vectorNormalized3";
	rename -uid "298360C5-436F-E300-5CE4-E3916A0E56DB";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode plusMinusAverage -n "l_arm_frombetweenToMiddle_vector3";
	rename -uid "4C60E1BA-479E-6AAE-82FB-F4A18163B0C7";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "l_arm_rootMiddle_betweenPoint3";
	rename -uid "DA5547B4-4DA4-B3E8-C2E4-A29F6CB0AD83";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "l_arm_rootMiddle_projected3";
	rename -uid "9EFB533F-41FC-081B-8AA8-919AC0D491B9";
createNode multiplyDivide -n "l_arm_rootEnd_vectorNormalized_projected3";
	rename -uid "AEE1E6CF-463A-21B7-5C47-0E8F4FE6CB6A";
createNode vectorProduct -n "l_arm_rootEnd_vectorNormalized";
	rename -uid "25C09275-4E63-C1E4-BA65-95AE676E90C9";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode plusMinusAverage -n "l_arm_rootEnd_vector";
	rename -uid "B38D8335-4FF9-09D5-2C3D-CD83F911A586";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "decomposeMatrix50";
	rename -uid "D5B3A93F-4E72-FFA1-B317-19832093F63D";
createNode vectorProduct -n "l_arm_cosAngle_bewtweenVectors";
	rename -uid "CC769E63-4000-A7A2-E0BF-5D895A1F314C";
	setAttr ".no" yes;
createNode plusMinusAverage -n "l_arm_rootMiddle_vector";
	rename -uid "A9331FB8-44A7-F71A-9A93-FE9A0B5C6664";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode distanceBetween -n "l_arm_rootMiddle_distance";
	rename -uid "749C045B-472A-0FB4-65E2-42AEC0FF5D7E";
createNode decomposeMatrix -n "l_arm_decomposeMatrix25";
	rename -uid "3B52C06F-4A91-860D-E3E6-CD981F603AAB";
createNode multMatrix -n "l_arm_multMatrix22";
	rename -uid "A2EAD45C-4A0E-8A01-C8ED-938D65C4069A";
	setAttr -s 3 ".i";
createNode composeMatrix -n "l_arm_composeMatrix1";
	rename -uid "CED9863C-410B-ED7D-FEFA-9887AB84FF6C";
createNode multiplyDivide -n "l_arm_size_multiplyDivide1";
	rename -uid "BCE86446-43BB-0DFE-4E98-B59B51B4F608";
createNode makeNurbSphere -n "l_arm_makeNurbSphere3";
	rename -uid "940D6C08-4180-9C41-AB31-11A0AE118D50";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode composeMatrix -n "l_arm_world_composeMatrix";
	rename -uid "DCF52B52-40A8-121F-4BA5-D28EFFC66A5D";
createNode makeNurbSphere -n "l_clav_makeNurbSphere";
	rename -uid "DD0B6FDE-4BD8-9A19-B6D0-40B9B3A80CAB";
createNode sweepMeshCreator -n "l_arm_sweepMeshCreator1";
	rename -uid "91298B61-49C5-49C4-4F64-ECBAD9B13F50";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode reverse -n "reverse3";
	rename -uid "B0A5E59B-42AF-0638-5681-089B8E3A085A";
createNode reverse -n "l_arm_ikFk_reverse";
	rename -uid "68197882-4412-488C-AFEC-E5864841601A";
createNode multDoubleLinear -n "l_arm_initScale1_mult";
	rename -uid "4DC439A8-4B79-C464-92D5-31BC5C794FD9";
createNode decomposeMatrix -n "l_arm_fk_end_group_decomposeMatrix";
	rename -uid "682F308D-4A16-0C99-7C60-3098C5ABE330";
createNode multMatrix -n "l_arm_fk_end_group_multMatrix";
	rename -uid "885B1CF3-43AD-7873-8BDC-A988865C7000";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "l_arm_initScaleEnd_mult";
	rename -uid "5657AEA8-488C-FBE9-4608-C6A4A930440B";
createNode decomposeMatrix -n "l_arm_fk_b_group_decomposeMatrix";
	rename -uid "9D485739-4F13-56DB-000D-C0AF58B89A95";
createNode multMatrix -n "l_arm_fk_b_group_multMatrix";
	rename -uid "04B947FA-4C87-3B89-53E9-65850159BA07";
	setAttr -s 2 ".i";
createNode pairBlend -n "pairBlend14";
	rename -uid "5210876F-4402-A4F6-8D27-3DA1D8C72020";
createNode pairBlend -n "pairBlend13";
	rename -uid "9182C4D7-4D4B-FA5F-C91D-C78C19979AC4";
	setAttr ".ri" 1;
createNode animCurveUA -n "l_arm_ik_end_rotateX";
	rename -uid "55105413-4A91-7403-3240-D898C627202A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 0.83197075128555298 -21.916690140419306 
		1 0;
	setAttr -s 3 ".kit[2]"  3;
	setAttr -s 3 ".kot[2]"  3;
createNode animCurveUA -n "l_arm_ik_end_rotateY";
	rename -uid "5ED62150-4139-2E4F-DFA9-AEADEDEEDDD2";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 0.83197075128555298 9.9934257556858146 
		1 0;
	setAttr -s 3 ".kit[2]"  3;
	setAttr -s 3 ".kot[2]"  3;
createNode animCurveUA -n "l_arm_ik_end_rotateZ";
	rename -uid "0B3A7C9F-4CC0-F70B-849E-A4B329B70305";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 0.83197075128555298 15.233664809073931 
		1 0;
	setAttr -s 3 ".kit[2]"  3;
	setAttr -s 3 ".kot[2]"  3;
createNode multDoubleLinear -n "l_arm_multDoubleLinear437";
	rename -uid "819FF97D-43B4-5BB7-12B3-DE8D9E61A690";
	setAttr ".i2" -1;
createNode pairBlend -n "pairBlend50";
	rename -uid "A9635411-4BCC-28B1-70E7-F2B1BC07EF4F";
createNode decomposeMatrix -n "l_arm_root_connector_decomposeMatrix";
	rename -uid "9B2A705F-4BBD-DA48-8A55-B7BA44ED380B";
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "1A27E185-4400-21B6-6D6F-6FB5F4D73395";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "l_arm_snap_blend";
	rename -uid "B23EC117-46A4-7FBE-011A-54A74F1D48C4";
createNode multiplyDivide -n "l_arm_current_toSnapPoint_length_scaled";
	rename -uid "96E8D91E-4807-9D59-6C19-C1A0E4C1FE1D";
	setAttr ".op" 2;
createNode distanceBetween -n "l_arm_current_rootToSnapPoint_length";
	rename -uid "BC9DEA9D-445B-B161-25B9-F7BEC6A30BFE";
createNode distanceBetween -n "l_arm_current_endToSnapPoint_length";
	rename -uid "67071A08-4BCA-A134-512C-278831EAFBBD";
createNode multiplyDivide -n "l_arm_scale_to_translate_converter";
	rename -uid "E604B8DE-4522-9FDB-8EAA-F6A4A42BE507";
createNode multiplyDivide -n "l_arm_final_length";
	rename -uid "8C894311-47AF-59F8-08C7-BDAE7E8DA0CD";
createNode blendColors -n "l_arm_ikfk_blend";
	rename -uid "9A1EBD01-48CD-3B0D-932E-E48DBF9EBF4C";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode blendColors -n "l_arm_stretch_blend";
	rename -uid "446FCF48-41C8-21B9-6244-E6B65BA7700F";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "l_arm_final_length_factor";
	rename -uid "10769119-4A1F-E7FD-71D8-4B9464EDDDE8";
	setAttr ".op" 2;
createNode multiplyDivide -n "l_arm_current_length_scaled";
	rename -uid "990581EB-4D1F-B2BF-52E1-7BB9960DC64D";
	setAttr ".op" 2;
createNode distanceBetween -n "l_arm_current_length";
	rename -uid "ABDB5318-4ED1-FE91-FD4F-4F894B0B4B33";
createNode condition -n "l_arm_stretch_condition";
	rename -uid "78323955-49E8-3593-0C81-B198DEE2FEA7";
	setAttr ".op" 5;
createNode condition -n "l_arm_softIk_condition";
	rename -uid "C049CB48-4D4A-4A3F-43DF-FB83BCF38E3A";
	setAttr ".op" 2;
createNode plusMinusAverage -n "l_arm_init_lenth_minus_softIk";
	rename -uid "5E95AE7A-4D77-D7C8-FA4D-0B9BA76B37FD";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode addDoubleLinear -n "l_arm_init_length";
	rename -uid "E6367869-4FC3-7814-48CA-F28A79E98B1B";
	setAttr ".ihi" 2;
createNode multiplyDivide -n "l_arm_init_length_a";
	rename -uid "1E60BED0-4410-5CB5-2AF2-D29A63CFA545";
createNode multiplyDivide -n "l_arm_init_length_b";
	rename -uid "E5310595-4DE9-A455-2559-4CB44953457F";
createNode remapValue -n "l_arm_softIk_value";
	rename -uid "02476879-4093-FF73-22FE-54BD01E92456";
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
createNode addDoubleLinear -n "l_arm_return_softIk";
	rename -uid "5088CA6E-465E-4FAE-8F67-79BBD2BAB59F";
	setAttr ".ihi" 2;
createNode multDoubleLinear -n "l_arm_one_minus_by_softIk";
	rename -uid "D3632C07-4041-E6E6-D7F0-B682C68E0F26";
createNode plusMinusAverage -n "l_arm_one_minus";
	rename -uid "4EFE9A87-494F-C6BA-DB87-46B076194D32";
	setAttr ".op" 2;
	setAttr -s 2 ".i1[0:1]"  1 3.91782308;
createNode multiplyDivide -n "l_arm_power";
	rename -uid "5B83D9FB-4655-B2C0-CE8B-82B251E3012E";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 2.7182817 0 0 ;
createNode multiplyDivide -n "l_arm_length_difference_by_softIk";
	rename -uid "797A2F16-485C-D48E-C995-019EE2069678";
	setAttr ".op" 2;
createNode multDoubleLinear -n "l_arm_length_difference_minus";
	rename -uid "37DAA50D-414D-99E7-2D09-D28027C92019";
	setAttr ".i2" -1;
createNode plusMinusAverage -n "l_arm_length_difference";
	rename -uid "8ACC5F72-440F-891E-CC48-32B4967A8077";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode decomposeMatrix -n "l_arm_decomposeMatrix33";
	rename -uid "6B239053-4C36-36AE-70EE-A3B47AEADF30";
createNode multMatrix -n "l_arm_multMatrix29";
	rename -uid "F10B4827-4A8A-C059-B425-8A8A4686C4B4";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "l_arm_multDoubleLinear435";
	rename -uid "DD61B2FC-4196-FA0C-503E-B89A5A002E77";
createNode unitConversion -n "unitConversion443";
	rename -uid "48FFA691-4E1D-3797-B2BB-F388979829C2";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion444";
	rename -uid "2EFAC62D-4B42-0D15-A4E5-1EA94AD2C84D";
	setAttr ".cf" 0.017453292519943295;
createNode blendColors -n "l_arm_volume_blendColors";
	rename -uid "4FC96A2B-4D39-5B88-2A8F-D5B35BD257B0";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "l_arm_volume_mult";
	rename -uid "5B6FF77B-4ECF-801F-7673-32AE7D4FE5BD";
	setAttr ".op" 2;
createNode ikRPsolver -n "l_arm_ikRPsolver1";
	rename -uid "A3D25984-4F0F-2019-6589-F484D6148698";
createNode decomposeMatrix -n "l_arm_decomposeMatrix41";
	rename -uid "2EC69E06-4513-3270-06E2-FF94FCBD8B9C";
createNode decomposeMatrix -n "l_arm_decomposeMatrix42";
	rename -uid "A6077440-4E04-377B-C4EA-CF8E0E3641E9";
createNode decomposeMatrix -n "l_arm_decomposeMatrix44";
	rename -uid "1663FB15-4C24-E6F1-9340-B29EC200C44B";
createNode multMatrix -n "l_arm_multMatrix38";
	rename -uid "DB660593-43B3-BBC8-548A-5D91E1B9C9C3";
	setAttr -s 2 ".i";
createNode pairBlend -n "pairBlend84";
	rename -uid "37954162-4C12-B803-84C2-118D10199058";
createNode decomposeMatrix -n "decomposeMatrix119";
	rename -uid "EFBD14B7-42A6-7B01-DE04-38921F2E13C5";
createNode multMatrix -n "multMatrix216";
	rename -uid "3FD9ABC3-45ED-4BC7-C16B-229EE7BA02F9";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix116";
	rename -uid "5E277BE9-495A-988B-EAE5-5A849DF5CF40";
createNode multMatrix -n "multMatrix213";
	rename -uid "E68C06FE-4E5F-2552-9D92-559ADEE79DD6";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_wing_root_decomposeMatrix1";
	rename -uid "CD5945FB-4287-C2C7-6E00-5FB3D71F3AF1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode multMatrix -n "l_wing_main_2_group_multMat1";
	rename -uid "2758FC84-4705-80BC-7E83-F4981BA995C8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode multMatrix -n "l_wing_feathers_6_group_multMat2";
	rename -uid "06234CE6-4395-175B-173D-159A0A34CB3B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode pairBlend -n "pairBlend3";
	rename -uid "5D40DC3F-4413-F953-2797-E5833CC06521";
	setAttr ".ri" 1;
createNode decomposeMatrix -n "decomposeMatrix90";
	rename -uid "6960C7AA-4067-1B8E-B6CA-C6A79C56038F";
createNode multMatrix -n "l_wing_feathers_6_group_multMat1";
	rename -uid "DAF3833E-4F7A-A930-0EAE-91A969464095";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode pairBlend -n "pairBlend86";
	rename -uid "9E0DC5F6-4DBD-5219-B5D2-24BEA5DF597D";
createNode pairBlend -n "pairBlend18";
	rename -uid "DA73B503-4571-73ED-B26E-1C847C40F913";
createNode multMatrix -n "multMatrix175";
	rename -uid "99621909-4AF2-A3F1-EFD6-28AB314E32FA";
createNode pairBlend -n "pairBlend26";
	rename -uid "425E11A9-4D84-79CE-6EBC-4BA55B5CD7CC";
createNode multMatrix -n "multMatrix167";
	rename -uid "35E4E8AD-40C7-821F-7A1C-E8ABDC2DF168";
	setAttr -s 2 ".i";
createNode distanceBetween -n "l_wing_distanceBetween18";
	rename -uid "91A1072C-41B9-59E0-45EF-319E5FC5271D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode blendColors -n "blendColors7";
	rename -uid "4A919D77-4031-B242-7FA7-169B0285068A";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors14";
	rename -uid "7CAFDA95-4692-CEF0-E785-1AA0444AB5CF";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors12";
	rename -uid "B2CCA88F-4A5B-3E2D-B195-328812C8D2CA";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors6";
	rename -uid "B93334AF-49B2-BD9B-5D10-CF9B4829A87E";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode distanceBetween -n "distanceBetween1";
	rename -uid "3509B2F5-4733-7411-F949-B7A4C9E0BD1D";
createNode blendColors -n "blendColors11";
	rename -uid "A8CD91ED-4C0B-F9E7-EB22-108FB9A90E5F";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors4";
	rename -uid "0CD77E18-40C4-FD72-CFA1-8FB9A74CC1F5";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors18";
	rename -uid "65AC1507-4D0F-4B4E-ABB8-CF9BDAF37E89";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors15";
	rename -uid "27693A4F-436A-58C1-DBE3-589C8B8B2E05";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode distanceBetween -n "l_wing_distanceBetween22";
	rename -uid "8F4CD15A-4086-0038-5B16-7EA486CA7F3B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode blendColors -n "blendColors17";
	rename -uid "91ADF0FB-486C-1EDC-BF09-05A3D69AA4F2";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors19";
	rename -uid "33CBFC51-4BC3-D166-945C-C78C85F549F1";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors5";
	rename -uid "BBE1DCF4-4ED5-7CA0-520E-79870C23EABE";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors3";
	rename -uid "4C69111F-4D33-F74B-69C1-7B9841583EFF";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors24";
	rename -uid "9AF06C6A-4C5E-8A41-96A2-37B718414C99";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors10";
	rename -uid "ECE6E246-4DD1-5585-2B71-9B858E1838F6";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors9";
	rename -uid "316B00AE-4CE5-6336-9508-B9B839F25A50";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors1";
	rename -uid "2494318C-46D0-70CB-EEE6-299E8B4D7A6E";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode distanceBetween -n "l_wing_distanceBetween19";
	rename -uid "2572EEC2-40AE-9F13-2892-34AD6CC8D6A9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode blendColors -n "blendColors28";
	rename -uid "98FF38BB-4F7D-AA51-C1E2-9587FF593C2D";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors23";
	rename -uid "67DD8007-4BA0-7049-3795-568C42C55C0C";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors21";
	rename -uid "17D2826F-4EDA-5088-5A93-9E909D3FC706";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors26";
	rename -uid "30BB23DC-499E-E46F-7DC8-00BEA6041C85";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors22";
	rename -uid "44542028-4DC0-CFB5-E124-76B269AF5713";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors32";
	rename -uid "458E4C37-453B-EBF7-C2CF-EFBCDEC79DFE";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors31";
	rename -uid "7CE3A3AB-4ABA-E43B-8998-C49141B6F7EB";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors2";
	rename -uid "621533BF-4C17-6A3A-74A4-8DAF80EE886D";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode multMatrix -n "multMatrix168";
	rename -uid "396F0DE6-42F8-F163-9CF0-19846218370B";
createNode blendColors -n "blendColors16";
	rename -uid "7B0BC041-40EF-DCBD-D840-AC824F8492E8";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors8";
	rename -uid "757C2EAA-4E1E-847D-A208-0EB742CCE5A9";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors20";
	rename -uid "06601B52-486E-5EEB-9D04-A3B14F26CBAF";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors13";
	rename -uid "8F419D93-42DD-FE8F-6482-84B2F0CA73CA";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors64";
	rename -uid "68294093-45F6-DBB1-010C-5D95BDB3252D";
	setAttr ".c1" -type "float3" -0.2 -0.31999999 0.22 ;
	setAttr ".c2" -type "float3" 0 0.050000001 0.19 ;
createNode blendColors -n "blendColors63";
	rename -uid "B3EC2C07-44B6-DBD1-BC7F-9C926EA2DE26";
	setAttr ".c1" -type "float3" -9 -15 -5.6999998 ;
	setAttr ".c2" -type "float3" 0 -2 2 ;
createNode blendColors -n "blendColors65";
	rename -uid "3F388A0A-4141-F1DB-B100-9A90C8345A07";
	setAttr ".c1" -type "float3" -3.3 -5.6300001 -5.6999998 ;
	setAttr ".c2" -type "float3" 2 -5 0 ;
createNode multDoubleLinear -n "multDoubleLinear9";
	rename -uid "61BC0DA7-40B0-AFEA-4F13-7A90AB016E5B";
	setAttr ".i2" 1;
createNode multiplyDivide -n "arm_middle_end_target_multiplyDivide";
	rename -uid "900B21BA-4D98-9B74-D0B5-76802D50B949";
	setAttr ".i2" -type "float3" 0.25 -0.25 0 ;
createNode objectSet -n "moduleControlSet";
	rename -uid "07B2C905-48EE-7F6E-5BB7-71AD6F2DA44D";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "36B5E5C0-431C-13F8-230C-DAB1C7C53766";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "E0B49E80-4C4C-F640-7C3E-19BE0A68E9D5";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "ikFkSwitchSet";
	rename -uid "5AFE8A7E-40B5-0FB8-403E-D2B77DF79EC5";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "skinJointsSet";
	rename -uid "7D349DAD-471D-FB25-916A-219A403F28D1";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
createNode objectSet -n "feathers_moduleControlSet";
	rename -uid "7006A150-473C-5D33-FCE2-9FB29996854E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".an" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode objectSet -n "main_moduleControlSet";
	rename -uid "8FA1B351-4B85-8928-1004-35A9A9FC5805";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "DFBC47D3-4733-9C15-C3DA-43A4E6E67A7F";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "2D89C3B4-48B2-5D6C-8A2F-69AE56396578";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C0719DDE-4992-9ED2-F6B5-35A06F794C69";
createNode displayLayerManager -n "layerManager";
	rename -uid "001CD81D-4BB0-5916-5465-1697C6A9B380";
createNode displayLayer -n "defaultLayer";
	rename -uid "8AFDF75E-4E64-89B5-7AEA-FA98DFDFFAEA";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "5FEABB80-4B3E-2E8F-1147-4A817F0DDF7E";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "47E500DE-4021-5B41-30E1-71A447FA7B70";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "79AA154B-4399-3494-6327-7ABF4A01AC92";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 144 -ast 0 -aet 144 ";
	setAttr ".st" 6;
createNode decomposeMatrix -n "l_arm_decomposeMatrix43";
	rename -uid "05A87F70-45B7-A903-9CC8-04A933807113";
createNode decomposeMatrix -n "l_arm_decomposeMatrix31";
	rename -uid "028BCD35-44D4-F425-62F6-BB858F1DC324";
createNode unitConversion -n "l_arm_unitConversion431";
	rename -uid "A1959EB6-4960-DDA7-507D-96A3B0046D81";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "l_arm_unitConversion440";
	rename -uid "89300379-43DA-74EA-7ACA-C1958C0A5C63";
	setAttr ".cf" 0.017453292519943295;
createNode objectSet -n "l_wing_hand_poser_clusterClusterSet2";
	rename -uid "075F857D-4744-0B60-D3D6-2494EE7B9F6F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode objectSet -n "l_wing_edge_6_poser_clusterClusterSet5";
	rename -uid "198821C3-4DF7-B32E-56EB-529FB40D5B3D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode distanceBetween -n "distanceBetween5";
	rename -uid "49B172DA-49F9-F7B2-5132-EBB4C903625E";
createNode distanceBetween -n "distanceBetween6";
	rename -uid "C8B2FB23-4A81-456F-4865-B6B21A6F0158";
createNode plusMinusAverage -n "plusMinusAverage3";
	rename -uid "30AF17CE-4C33-1A18-14A2-DC8AB1B1727B";
	setAttr ".op" 3;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multMatrix -n "multMatrix220";
	rename -uid "A07BC3C7-4ACE-5232-CF5E-E68DE91778AF";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix222";
	rename -uid "1D15DEED-4115-6D40-5CDA-8AAE5DA02B79";
	setAttr -s 2 ".i";
createNode distanceBetween -n "distanceBetween8";
	rename -uid "D30A08C2-43A1-DBBD-C29F-BA8AC79CB67C";
createNode multMatrix -n "multMatrix223";
	rename -uid "EB82E64E-4743-DC5F-6B34-8DAAF57C1924";
	setAttr -s 2 ".i";
createNode pairBlend -n "pairBlend94";
	rename -uid "256EE66F-429D-B38F-8653-F39B59083511";
	setAttr ".it2" -type "double3" 0 0 -1.436 ;
	setAttr ".w" 0;
createNode decomposeMatrix -n "decomposeMatrix122";
	rename -uid "E344DB0B-4B13-1051-2CAC-E9976EC6A80B";
createNode makeNurbSphere -n "l_arm_makeNurbSphere4";
	rename -uid "EE048B98-4D74-5855-7D20-E2BB2C1E0351";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "l_arm_size_multiplyDivide2";
	rename -uid "DFB09D6D-4DDB-0704-9C99-9F83CFA6BAF6";
createNode makeNurbSphere -n "l_arm_makeNurbSphere5";
	rename -uid "F95E5755-4B03-1E60-B451-8B9395869824";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multMatrix -n "multMatrix224";
	rename -uid "7D376F73-43A4-CF77-1464-45B173441F52";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix97";
	rename -uid "30D891D2-411B-E183-CAC9-23B47FF2DDCE";
	setAttr ".env" 0;
	setAttr ".tgt[0].tmat" -type "matrix" 0.44473084811618202 -0.6229385520450742 -0.64355421924640299 0
		 0.84148784323300874 0.53670684502402455 0.061999775769086815 0 0.30677790406892214 -0.56911626481795774 0.76288530900439755 0
		 -1.5512269981968263 1.5393168255128273 0.94972697588167421 0.99999999999999989;
createNode multMatrix -n "multMatrix225";
	rename -uid "DB190E55-416B-3B56-4CC1-F38E27D43BA6";
	setAttr -s 3 ".i";
createNode blendMatrix -n "blendMatrix98";
	rename -uid "551FC12D-4962-B237-BA8A-39B671C60CFF";
createNode multMatrix -n "multMatrix226";
	rename -uid "AFB5776C-4E32-381A-7E95-3EB5AAA1302F";
	setAttr -s 2 ".i";
createNode pairBlend -n "pairBlend96";
	rename -uid "518AD6E8-4450-766E-101A-01860ED15D63";
	setAttr ".ri" 1;
createNode multMatrix -n "multMatrix227";
	rename -uid "935DCB81-43F0-9DB9-1041-7EA630A961AA";
	setAttr -s 2 ".i";
createNode pairBlend -n "pairBlend97";
	rename -uid "6193A26A-415D-5477-2070-26BE9B4C9901";
	setAttr ".ri" 1;
createNode condition -n "condition1";
	rename -uid "63FD01B0-453A-0EC9-5628-4993178F076F";
	setAttr ".st" 2;
	setAttr ".ct" -type "float3" 0 1 0 ;
	setAttr ".cf" -type "float3" 1 0 1 ;
createNode condition -n "condition2";
	rename -uid "FE135623-4ECA-32C9-A62E-788C8B3ED9D5";
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode objectSet -n "l_wing_edge_1_poser_clusterClusterSet2";
	rename -uid "0A26E3A0-40C2-B1E6-D731-9FA78859C356";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode animCurveTU -n "uvPin2_coordinate_0__coordinateU";
	rename -uid "D167D92D-4EEE-9496-CE56-D1A28F754F15";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.92999999999999994;
createNode controller -n "l_clav_tag";
	rename -uid "35C09191-43AE-78A1-3709-F4974F00A15D";
createNode multMatrix -n "multMatrix232";
	rename -uid "3D9A1CB0-4E5F-BBEE-96A4-3D86F7BB738D";
createNode multMatrix -n "multMatrix235";
	rename -uid "8B4F0843-433E-6221-ECE6-D69A74F77AD4";
createNode condition -n "condition3";
	rename -uid "3ABE29CA-46AB-E172-B078-35A1D1BFFE8C";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode pairBlend -n "pairBlend98";
	rename -uid "393D922F-4B26-8FCF-EDC9-ED8B4491B139";
createNode objectSet -n "arm_moduleControlSet";
	rename -uid "0A8C29EB-4B45-0A48-FC4A-BEB6952C1593";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "l_wing_edge_3_poser_clusterClusterSet2";
	rename -uid "79542038-4E83-EE49-D440-9C88DD6868C7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode objectSet -n "l_wing_edge_1_poser_clusterClusterSet3";
	rename -uid "368A4376-4099-2E49-937E-C184492C9A65";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode objectSet -n "l_wing_edge_5_poser_clusterClusterSet2";
	rename -uid "0F346922-45B7-25E7-DB72-DBB50E06D90F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode objectSet -n "l_wing_edge_4_poser_clusterClusterSet2";
	rename -uid "5E1A6BBC-4926-DC81-2854-9E98B20FBC7A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode objectSet -n "l_wing_edge_2_poser_clusterClusterSet2";
	rename -uid "FE158B18-4E2B-219F-74A4-688F4DBBFD7D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "l_wing";
createNode condition -n "condition4";
	rename -uid "E57B8283-4469-46C2-BC02-62B617F65A41";
	setAttr ".op" 2;
createNode plusMinusAverage -n "plusMinusAverage5";
	rename -uid "61CE3390-4D2B-01AB-A303-C88D5007FD3C";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multMatrix -n "multMatrix242";
	rename -uid "6D0B3F95-4E9F-A1B4-B68A-C58C3A555752";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix123";
	rename -uid "4FC7AD3D-4297-4C20-347D-DEB4FEA50C39";
createNode composeMatrix -n "composeMatrix32";
	rename -uid "BCEBE597-4E3C-F370-1E0D-DCA745240E68";
createNode decomposeMatrix -n "decomposeMatrix124";
	rename -uid "205FC9C5-48BB-9FC4-BC8B-5C800303A4C2";
createNode composeMatrix -n "composeMatrix33";
	rename -uid "953526A0-46AA-7790-DA56-8188FCE54315";
createNode multMatrix -n "multMatrix243";
	rename -uid "4B71167E-4669-DD97-F4CF-00AE463FF0F0";
	setAttr -s 3 ".i";
createNode decomposeMatrix -n "decomposeMatrix125";
	rename -uid "00AF191E-4E2B-B16F-4B4F-FFB9889A8636";
createNode composeMatrix -n "composeMatrix34";
	rename -uid "415E49B7-4D09-926D-8103-048FECF867EB";
createNode decomposeMatrix -n "decomposeMatrix126";
	rename -uid "D031EA91-47DA-BCF6-3477-6C8C5E16B69C";
createNode multMatrix -n "multMatrix244";
	rename -uid "6289CC37-4B62-0A0C-5B47-E1B035BB39A9";
	setAttr -s 3 ".i";
createNode multMatrix -n "multMatrix245";
	rename -uid "64834384-4CB7-D1F0-F091-FEABE4EEC6C8";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix127";
	rename -uid "81E23C5F-43D5-4EA2-AAAB-E99EAB862A30";
createNode multMatrix -n "multMatrix246";
	rename -uid "B15EB515-4B62-2609-28FA-9CA700F8356F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix128";
	rename -uid "22C5B9A2-43AB-9FF6-4F0A-2A87404A7F40";
createNode makeNurbSphere -n "l_arm_makeNurbSphere6";
	rename -uid "AD6D8ACE-4935-BCEE-FAB9-3F9944D0A68C";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "l_arm_size_multiplyDivide3";
	rename -uid "4B5CDD99-4419-404D-9302-A2B94A7482F7";
createNode makeNurbSphere -n "l_arm_makeNurbSphere7";
	rename -uid "EFA3F2AB-485A-B13A-1526-3F98828323E9";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere8";
	rename -uid "6A3A912A-402D-5E0A-C005-1D99E411E2DA";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere9";
	rename -uid "0790ADBA-4D03-BBB3-6D96-7FBD6274B78A";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "l_arm_size_multiplyDivide4";
	rename -uid "0E5972EC-4EE0-C16C-6199-66A7FBBD3047";
	setAttr ".i1" -type "float3" 0.5 0.5 0.5 ;
	setAttr ".i2" -type "float3" 0.25 0.25 0.5 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere10";
	rename -uid "5909A022-43F9-FB4F-3E9B-9CA5620C6DFB";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere11";
	rename -uid "DE3126D3-4407-9899-C2FA-E0AAD5EA4600";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere12";
	rename -uid "AAC40B11-4E25-57FA-77B6-A28CFC85A8B1";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere13";
	rename -uid "792F6828-4F31-CC63-AF57-F0B54CFFADFF";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "l_arm_size_multiplyDivide5";
	rename -uid "61FA793D-44C1-58AB-E731-A88DD6E22D3B";
createNode makeNurbSphere -n "l_arm_makeNurbSphere14";
	rename -uid "AF256883-4C07-6B74-554C-E3BA4B832D57";
	setAttr ".ax" -type "double3" 0 1 0 ;
	setAttr ".r" 0.125;
createNode makeNurbSphere -n "l_arm_makeNurbSphere15";
	rename -uid "A1D8E83E-414C-1FCE-7686-65A4A0833DD1";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "l_arm_size_multiplyDivide6";
	rename -uid "DE147839-4441-C062-219A-C6AA5C5205AF";
	setAttr ".i2" -type "float3" 0.57999998 0.28 0.25 ;
createNode makeNurbSphere -n "l_arm_makeNurbSphere16";
	rename -uid "F832803E-4D3C-6826-CE65-45BC1522D59E";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode decomposeMatrix -n "l_arm_control_group_decomposeMatrix";
	rename -uid "358B1B0C-4BE8-E4B6-2A50-68BBDE8D23BF";
createNode multMatrix -n "l_arm_control_group_multMatrix";
	rename -uid "21177DDC-46BB-C8D8-6097-91A7A5966A42";
	setAttr -s 2 ".i";
createNode multiplyDivide -n "multiplyDivide358";
	rename -uid "EE148172-45BA-171F-90F3-EC95319F95C8";
	setAttr ".i2" -type "float3" 0.333 0.333 0.333 ;
createNode multiplyDivide -n "multiplyDivide359";
	rename -uid "37F84BC9-4D0D-02D7-A95B-C797A0BBEE79";
	setAttr ".i2" -type "float3" 0.66600001 0.66600001 0.66600001 ;
createNode multiplyDivide -n "multiplyDivide360";
	rename -uid "34C7CA4A-4CCF-133A-A792-F089D59CEA14";
	setAttr ".i2" -type "float3" 0.66600001 0.66600001 0.66600001 ;
createNode multiplyDivide -n "multiplyDivide361";
	rename -uid "519066F9-4C99-6E9A-4994-AF9ED7B4B06A";
	setAttr ".i2" -type "float3" 0.333 0.333 0.333 ;
createNode multMatrix -n "multMatrix247";
	rename -uid "DDE48D6F-4DCB-F48F-6E87-548856D9F563";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix248";
	rename -uid "52A22C34-41CA-1E11-CB4B-BFA04E1B765B";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix250";
	rename -uid "B885DC0F-41AF-87DD-8C99-4E89EF62BD08";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix251";
	rename -uid "09239F2F-4552-D583-929E-EAB08BF07595";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix133";
	rename -uid "E6173EF1-4336-8463-91C9-1685DF4B37B2";
createNode pairBlend -n "pairBlend100";
	rename -uid "5C7D4B47-444B-BBAD-C9C3-BBB4C5508C6C";
	setAttr ".w" 0.45360824736507283;
	setAttr ".ri" 1;
createNode multMatrix -n "multMatrix252";
	rename -uid "C6A5AA7D-49C2-FAAD-7BDD-45A4606FEE20";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix254";
	rename -uid "E2AC6A7F-4A39-ACE5-A9D5-6ABF816FE4F2";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix255";
	rename -uid "05428926-4495-4655-9FEE-54929B7D9935";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix257";
	rename -uid "DEFF5EC5-4062-E342-1898-63B63374EEC8";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix99";
	rename -uid "C4DB8E7C-4469-B70F-F8BF-B98D1FA95365";
	setAttr ".env" 0.48706896507566599;
createNode multMatrix -n "multMatrix258";
	rename -uid "3A72485F-4DB0-01F1-0CC1-09B486093B7B";
	setAttr -s 2 ".i";
createNode unitConversion -n "l_arm_unitConversion1";
	rename -uid "F3132420-4441-EF78-34F5-ECB9698E700D";
	setAttr ".cf" 0.017453292519943295;
createNode makeNurbSphere -n "l_arm_makeNurbSphere2";
	rename -uid "7A6E188C-4CFA-5537-41BE-1EBCE927FBED";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode unitConversion -n "l_arm_unitConversion432";
	rename -uid "E0BCF599-4487-0EE5-D735-42AB9F2850DB";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "l_arm_decomposeMatrix49";
	rename -uid "F30A2EEA-4AC7-AF6D-BC45-7CA5A8B56ACB";
createNode unitConversion -n "l_arm_unitConversion446";
	rename -uid "995C9AC4-422A-1187-684C-98AF84EC2E87";
	setAttr ".cf" 57.295779513082323;
createNode multMatrix -n "multMatrix259";
	rename -uid "D44199D3-41A1-CA10-8AB0-CE89FD516AB7";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix260";
	rename -uid "D02E1BF8-43C1-8FC4-958C-24A675E10DBE";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix261";
	rename -uid "F2532DC3-433F-93B9-5AC3-E8B7185F8BE2";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix262";
	rename -uid "AA27FA26-4081-C6A3-EFB1-2D8033ABCC36";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix134";
	rename -uid "C7DE3BC6-45A9-2635-E1AF-F88B9EAB3961";
createNode multMatrix -n "multMatrix263";
	rename -uid "8470F5B3-4133-6287-A5E2-1CBA60C08929";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix264";
	rename -uid "24DE041D-45E2-3058-873C-3A848DA02964";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix265";
	rename -uid "60C2FB6A-4E5F-9E12-198C-E3ABA15C8A8D";
	setAttr -s 2 ".i";
createNode polyCube -n "polyCube1";
	rename -uid "33567A42-4D71-7D01-CCED-319827636FB2";
	setAttr ".cuv" 4;
createNode multMatrix -n "multMatrix266";
	rename -uid "2AA65BC4-4A38-0307-C345-9C8113685261";
	setAttr -s 2 ".i";
createNode animCurveTA -n "ik_end_rotateX";
	rename -uid "D198A417-4383-7F5D-AA4F-8CAA824328AB";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "ik_end_rotateY";
	rename -uid "49050FC1-4ADB-43B5-4294-3C9A776EF47F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 39 80.534646998366966 40 0 64 103.44855630071618;
createNode animCurveTA -n "ik_end_rotateZ";
	rename -uid "6696E204-488F-8DBF-3271-2A87A2F4E809";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode multMatrix -n "multMatrix268";
	rename -uid "95EE954E-4F71-A267-0DB4-AE94DD83D5F4";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix269";
	rename -uid "883F5486-4687-46D5-EC22-8FA9832609FF";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix100";
	rename -uid "75E1EFAA-45A3-98DE-FF18-7AA66875AFDE";
	setAttr ".env" 0.79899999999999993;
createNode multMatrix -n "multMatrix270";
	rename -uid "23C61B8C-45F1-413D-5351-D9AAB069B674";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix137";
	rename -uid "D09F73A2-4A68-6D81-3792-349B656E46E9";
createNode multMatrix -n "multMatrix271";
	rename -uid "219CC642-4ADC-FA89-92B1-CDBC22655DAC";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix272";
	rename -uid "C46C1743-4179-9010-CD07-08BD5201D7CF";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix273";
	rename -uid "95C166EE-4D73-BAFA-E226-D78078B94ADD";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix274";
	rename -uid "8654C7ED-4701-BE95-D115-FE87DE0F05F5";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix275";
	rename -uid "EDFE5E81-4757-EE53-F20C-C7874FD84237";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix276";
	rename -uid "004CDFE4-49BA-20F3-71B7-F0AEB27DD30E";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix277";
	rename -uid "456F9020-41AF-DA1C-861F-36AFD4E169C8";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix278";
	rename -uid "B2BED442-471A-429B-D37F-A2AD5254CD52";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix279";
	rename -uid "1278C690-4C9B-A6B3-5F58-4FB2F23060AB";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix280";
	rename -uid "62770520-4B46-EC41-8EF6-E8866D59A672";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix281";
	rename -uid "2B185D99-443C-DC3C-CF2B-698B46983B6D";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix282";
	rename -uid "788004B3-4E68-E527-5A68-D3804CDC08E3";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix283";
	rename -uid "AF37EC90-4A02-18C0-327E-05A0FAA3D058";
	setAttr -s 2 ".i";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "C1904536-4470-F4A1-A8D0-AFB14599B5F1";
	setAttr -s 6 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 20592.552897812962 -3953.6889856822072 ;
	setAttr ".tgi[0].vh" -type "double2" 22954.183573951388 -1510.2415164565934 ;
	setAttr -s 23 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 21973.955078125;
	setAttr ".tgi[0].ni[0].y" -2763.9208984375;
	setAttr ".tgi[0].ni[0].nvs" 18305;
	setAttr ".tgi[0].ni[1].x" 20621.02734375;
	setAttr ".tgi[0].ni[1].y" -2764.574951171875;
	setAttr ".tgi[0].ni[1].nvs" 18305;
	setAttr ".tgi[0].ni[2].x" 20956.037109375;
	setAttr ".tgi[0].ni[2].y" -2405.859619140625;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" 21695.41015625;
	setAttr ".tgi[0].ni[3].y" -2766.722900390625;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" 20968.8671875;
	setAttr ".tgi[0].ni[4].y" -2892.390625;
	setAttr ".tgi[0].ni[4].nvs" 18305;
	setAttr ".tgi[0].ni[5].x" 20577.689453125;
	setAttr ".tgi[0].ni[5].y" -2399.9423828125;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" 20087.947265625;
	setAttr ".tgi[0].ni[6].y" -2196.593017578125;
	setAttr ".tgi[0].ni[6].nvs" 18305;
	setAttr ".tgi[0].ni[7].x" 22315.36328125;
	setAttr ".tgi[0].ni[7].y" -2775.050537109375;
	setAttr ".tgi[0].ni[7].nvs" 18305;
	setAttr ".tgi[0].ni[8].x" 21971.82421875;
	setAttr ".tgi[0].ni[8].y" -2243.775390625;
	setAttr ".tgi[0].ni[8].nvs" 18305;
	setAttr ".tgi[0].ni[9].x" 21307.900390625;
	setAttr ".tgi[0].ni[9].y" -2336.613525390625;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" 22273.01171875;
	setAttr ".tgi[0].ni[10].y" -2127.58740234375;
	setAttr ".tgi[0].ni[10].nvs" 18305;
	setAttr ".tgi[0].ni[11].x" 21290.513671875;
	setAttr ".tgi[0].ni[11].y" -2144.2724609375;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" 21686.505859375;
	setAttr ".tgi[0].ni[12].y" -2174.1044921875;
	setAttr ".tgi[0].ni[12].nvs" 18305;
	setAttr ".tgi[0].ni[13].x" 20950.119140625;
	setAttr ".tgi[0].ni[13].y" -2222.614013671875;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" 20936.982421875;
	setAttr ".tgi[0].ni[14].y" -2020.427001953125;
	setAttr ".tgi[0].ni[14].nvs" 18305;
	setAttr ".tgi[0].ni[15].x" 20162.62109375;
	setAttr ".tgi[0].ni[15].y" -1747.2696533203125;
	setAttr ".tgi[0].ni[15].nvs" 18305;
	setAttr ".tgi[0].ni[16].x" 20629.04296875;
	setAttr ".tgi[0].ni[16].y" -3057.20458984375;
	setAttr ".tgi[0].ni[16].nvs" 18305;
	setAttr ".tgi[0].ni[17].x" 20551.943359375;
	setAttr ".tgi[0].ni[17].y" -2024.314697265625;
	setAttr ".tgi[0].ni[17].nvs" 18305;
	setAttr ".tgi[0].ni[18].x" 19855.896484375;
	setAttr ".tgi[0].ni[18].y" -2445.6318359375;
	setAttr ".tgi[0].ni[18].nvs" 18305;
	setAttr ".tgi[0].ni[19].x" 21312.46875;
	setAttr ".tgi[0].ni[19].y" -3137.32080078125;
	setAttr ".tgi[0].ni[19].nvs" 18305;
	setAttr ".tgi[0].ni[20].x" 19854.57421875;
	setAttr ".tgi[0].ni[20].y" -2917.743896484375;
	setAttr ".tgi[0].ni[20].nvs" 18305;
	setAttr ".tgi[0].ni[21].x" 20130.861328125;
	setAttr ".tgi[0].ni[21].y" -3014.373291015625;
	setAttr ".tgi[0].ni[21].nvs" 18305;
	setAttr ".tgi[0].ni[22].x" 21308.728515625;
	setAttr ".tgi[0].ni[22].y" -2605.90771484375;
	setAttr ".tgi[0].ni[22].nvs" 18305;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" 8787.9836537999963 -4124.6301332822522 ;
	setAttr ".tgi[1].vh" -type "double2" 13443.528546298705 692.2023631700722 ;
	setAttr -s 34 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 9958.6318359375;
	setAttr ".tgi[1].ni[0].y" -736.62432861328125;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" 11166.4140625;
	setAttr ".tgi[1].ni[1].y" -1879.3372802734375;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" 10154.34375;
	setAttr ".tgi[1].ni[2].y" 1007.042236328125;
	setAttr ".tgi[1].ni[2].nvs" 18305;
	setAttr ".tgi[1].ni[3].x" 10967.4697265625;
	setAttr ".tgi[1].ni[3].y" 956.44537353515625;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 9694.916015625;
	setAttr ".tgi[1].ni[4].y" 1046.4459228515625;
	setAttr ".tgi[1].ni[4].nvs" 18305;
	setAttr ".tgi[1].ni[5].x" 10561.162109375;
	setAttr ".tgi[1].ni[5].y" 992.2437744140625;
	setAttr ".tgi[1].ni[5].nvs" 18305;
	setAttr ".tgi[1].ni[6].x" 9295.169921875;
	setAttr ".tgi[1].ni[6].y" 1221.1175537109375;
	setAttr ".tgi[1].ni[6].nvs" 18305;
	setAttr ".tgi[1].ni[7].x" 11505.689453125;
	setAttr ".tgi[1].ni[7].y" -2011.3358154296875;
	setAttr ".tgi[1].ni[7].nvs" 18305;
	setAttr ".tgi[1].ni[8].x" 10036.3232421875;
	setAttr ".tgi[1].ni[8].y" -223.22007751464844;
	setAttr ".tgi[1].ni[8].nvs" 18305;
	setAttr ".tgi[1].ni[9].x" 10382.2255859375;
	setAttr ".tgi[1].ni[9].y" -224.29541015625;
	setAttr ".tgi[1].ni[9].nvs" 18305;
	setAttr ".tgi[1].ni[10].x" 9677.0751953125;
	setAttr ".tgi[1].ni[10].y" -45.242618560791016;
	setAttr ".tgi[1].ni[10].nvs" 18305;
	setAttr ".tgi[1].ni[11].x" 10837.2548828125;
	setAttr ".tgi[1].ni[11].y" -1741.8642578125;
	setAttr ".tgi[1].ni[11].nvs" 18305;
	setAttr ".tgi[1].ni[12].x" 9680.1103515625;
	setAttr ".tgi[1].ni[12].y" -393.19476318359375;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" 10939.625;
	setAttr ".tgi[1].ni[13].y" 406.908447265625;
	setAttr ".tgi[1].ni[13].nvs" 18305;
	setAttr ".tgi[1].ni[14].x" 9616.7802734375;
	setAttr ".tgi[1].ni[14].y" -1391.9088134765625;
	setAttr ".tgi[1].ni[14].nvs" 18304;
	setAttr ".tgi[1].ni[15].x" 9684.36328125;
	setAttr ".tgi[1].ni[15].y" -2137.213134765625;
	setAttr ".tgi[1].ni[15].nvs" 18304;
	setAttr ".tgi[1].ni[16].x" 9605.7978515625;
	setAttr ".tgi[1].ni[16].y" -1625.8448486328125;
	setAttr ".tgi[1].ni[16].nvs" 18305;
	setAttr ".tgi[1].ni[17].x" 10389.0166015625;
	setAttr ".tgi[1].ni[17].y" -445.36325073242188;
	setAttr ".tgi[1].ni[17].nvs" 18304;
	setAttr ".tgi[1].ni[18].x" 10610.193359375;
	setAttr ".tgi[1].ni[18].y" 459.28988647460938;
	setAttr ".tgi[1].ni[18].nvs" 18305;
	setAttr ".tgi[1].ni[19].x" 9944.8828125;
	setAttr ".tgi[1].ni[19].y" -1480.4149169921875;
	setAttr ".tgi[1].ni[19].nvs" 18305;
	setAttr ".tgi[1].ni[20].x" 9294.203125;
	setAttr ".tgi[1].ni[20].y" 883.41546630859375;
	setAttr ".tgi[1].ni[20].nvs" 18305;
	setAttr ".tgi[1].ni[21].x" 10533.7822265625;
	setAttr ".tgi[1].ni[21].y" -2034.431640625;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" 10183.1904296875;
	setAttr ".tgi[1].ni[22].y" 491.17758178710938;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" 10201.29296875;
	setAttr ".tgi[1].ni[23].y" -2088.031005859375;
	setAttr ".tgi[1].ni[23].nvs" 18305;
	setAttr ".tgi[1].ni[24].x" 9244.12109375;
	setAttr ".tgi[1].ni[24].y" 168.82708740234375;
	setAttr ".tgi[1].ni[24].nvs" 18305;
	setAttr ".tgi[1].ni[25].x" 9591.755859375;
	setAttr ".tgi[1].ni[25].y" -773.283935546875;
	setAttr ".tgi[1].ni[25].nvs" 18305;
	setAttr ".tgi[1].ni[26].x" 9677.384765625;
	setAttr ".tgi[1].ni[26].y" -2297.75927734375;
	setAttr ".tgi[1].ni[26].nvs" 18305;
	setAttr ".tgi[1].ni[27].x" 10271.4287109375;
	setAttr ".tgi[1].ni[27].y" -1535.7142333984375;
	setAttr ".tgi[1].ni[27].nvs" 18304;
	setAttr ".tgi[1].ni[28].x" 10495.75;
	setAttr ".tgi[1].ni[28].y" -1155.341064453125;
	setAttr ".tgi[1].ni[28].nvs" 18305;
	setAttr ".tgi[1].ni[29].x" 9954.443359375;
	setAttr ".tgi[1].ni[29].y" -1001.5315551757812;
	setAttr ".tgi[1].ni[29].nvs" 18305;
	setAttr ".tgi[1].ni[30].x" 9653.595703125;
	setAttr ".tgi[1].ni[30].y" 541.52813720703125;
	setAttr ".tgi[1].ni[30].nvs" 18305;
	setAttr ".tgi[1].ni[31].x" 10709.91796875;
	setAttr ".tgi[1].ni[31].y" -423.16921997070312;
	setAttr ".tgi[1].ni[31].nvs" 18305;
	setAttr ".tgi[1].ni[32].x" 9631.873046875;
	setAttr ".tgi[1].ni[32].y" -1209.0086669921875;
	setAttr ".tgi[1].ni[32].nvs" 18304;
	setAttr ".tgi[1].ni[33].x" 11453.220703125;
	setAttr ".tgi[1].ni[33].y" -492.472900390625;
	setAttr ".tgi[1].ni[33].nvs" 18305;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" 30739.955832509666 -11205.639262489858 ;
	setAttr ".tgi[2].vh" -type "double2" 32008.94485316857 -9892.6871390553224 ;
	setAttr -s 4 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 31147.302734375;
	setAttr ".tgi[2].ni[0].y" -10508.2919921875;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[2].ni[1].x" 31601.904296875;
	setAttr ".tgi[2].ni[1].y" -10465.11328125;
	setAttr ".tgi[2].ni[1].nvs" 18305;
	setAttr ".tgi[2].ni[2].x" 30852.37109375;
	setAttr ".tgi[2].ni[2].y" -10776.2822265625;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" 30843.970703125;
	setAttr ".tgi[2].ni[3].y" -10274.708984375;
	setAttr ".tgi[2].ni[3].nvs" 18305;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" 13969.065712921989 -9117.2924623526069 ;
	setAttr ".tgi[3].vh" -type "double2" 15007.068004654926 -8043.329417067127 ;
	setAttr -s 2 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 14082.857421875;
	setAttr ".tgi[3].ni[0].y" -8604.2861328125;
	setAttr ".tgi[3].ni[0].nvs" 18304;
	setAttr ".tgi[3].ni[1].x" 14082.857421875;
	setAttr ".tgi[3].ni[1].y" -8502.857421875;
	setAttr ".tgi[3].ni[1].nvs" 18304;
	setAttr ".tgi[4].tn" -type "string" "Untitled_5";
	setAttr ".tgi[4].vl" -type "double2" 3051.5330753025983 -4975.0653832810558 ;
	setAttr ".tgi[4].vh" -type "double2" 4050.192317679373 -3941.8083956159539 ;
	setAttr -s 7 ".tgi[4].ni";
	setAttr ".tgi[4].ni[0].x" 3207.142822265625;
	setAttr ".tgi[4].ni[0].y" -4471.4287109375;
	setAttr ".tgi[4].ni[0].nvs" 18304;
	setAttr ".tgi[4].ni[1].x" 3207.142822265625;
	setAttr ".tgi[4].ni[1].y" -4370;
	setAttr ".tgi[4].ni[1].nvs" 18304;
	setAttr ".tgi[4].ni[2].x" 3821.428466796875;
	setAttr ".tgi[4].ni[2].y" -4421.4287109375;
	setAttr ".tgi[4].ni[2].nvs" 18304;
	setAttr ".tgi[4].ni[3].x" 3514.28564453125;
	setAttr ".tgi[4].ni[3].y" -4421.4287109375;
	setAttr ".tgi[4].ni[3].nvs" 18304;
	setAttr ".tgi[4].ni[4].x" 2900;
	setAttr ".tgi[4].ni[4].y" -4471.4287109375;
	setAttr ".tgi[4].ni[4].nvs" 18304;
	setAttr ".tgi[4].ni[5].x" 2592.857177734375;
	setAttr ".tgi[4].ni[5].y" -4522.85693359375;
	setAttr ".tgi[4].ni[5].nvs" 18304;
	setAttr ".tgi[4].ni[6].x" 2592.857177734375;
	setAttr ".tgi[4].ni[6].y" -4421.4287109375;
	setAttr ".tgi[4].ni[6].nvs" 18304;
	setAttr ".tgi[5].tn" -type "string" "Untitled_6";
	setAttr ".tgi[5].vl" -type "double2" 12220.820643831259 -22625.796535054367 ;
	setAttr ".tgi[5].vh" -type "double2" 13300.082702360358 -21509.14431157623 ;
	setAttr -s 36 ".tgi[5].ni";
	setAttr ".tgi[5].ni[0].x" 12159.328125;
	setAttr ".tgi[5].ni[0].y" -24831.849609375;
	setAttr ".tgi[5].ni[0].nvs" 18305;
	setAttr ".tgi[5].ni[1].x" 12153.8984375;
	setAttr ".tgi[5].ni[1].y" -24505.53125;
	setAttr ".tgi[5].ni[1].nvs" 18305;
	setAttr ".tgi[5].ni[2].x" 12480.3310546875;
	setAttr ".tgi[5].ni[2].y" -24726.34375;
	setAttr ".tgi[5].ni[2].nvs" 18305;
	setAttr ".tgi[5].ni[3].x" 12142.486328125;
	setAttr ".tgi[5].ni[3].y" -24156.029296875;
	setAttr ".tgi[5].ni[3].nvs" 18305;
	setAttr ".tgi[5].ni[4].x" 12154.640625;
	setAttr ".tgi[5].ni[4].y" -22778.388671875;
	setAttr ".tgi[5].ni[4].nvs" 18304;
	setAttr ".tgi[5].ni[5].x" 12500.921875;
	setAttr ".tgi[5].ni[5].y" -23445.05078125;
	setAttr ".tgi[5].ni[5].nvs" 18305;
	setAttr ".tgi[5].ni[6].x" 12770.5048828125;
	setAttr ".tgi[5].ni[6].y" -25049.697265625;
	setAttr ".tgi[5].ni[6].nvs" 18304;
	setAttr ".tgi[5].ni[7].x" 12510.5634765625;
	setAttr ".tgi[5].ni[7].y" -23690.115234375;
	setAttr ".tgi[5].ni[7].nvs" 18305;
	setAttr ".tgi[5].ni[8].x" 11992.771484375;
	setAttr ".tgi[5].ni[8].y" -23730.5078125;
	setAttr ".tgi[5].ni[8].nvs" 18304;
	setAttr ".tgi[5].ni[9].x" 12837.2822265625;
	setAttr ".tgi[5].ni[9].y" -24782.587890625;
	setAttr ".tgi[5].ni[9].nvs" 18304;
	setAttr ".tgi[5].ni[10].x" 12536.046875;
	setAttr ".tgi[5].ni[10].y" -24338.662109375;
	setAttr ".tgi[5].ni[10].nvs" 18305;
	setAttr ".tgi[5].ni[11].x" 12185.787109375;
	setAttr ".tgi[5].ni[11].y" -22245.908203125;
	setAttr ".tgi[5].ni[11].nvs" 18304;
	setAttr ".tgi[5].ni[12].x" 12165.359375;
	setAttr ".tgi[5].ni[12].y" -23603.400390625;
	setAttr ".tgi[5].ni[12].nvs" 18304;
	setAttr ".tgi[5].ni[13].x" 12824.31640625;
	setAttr ".tgi[5].ni[13].y" -23149.236328125;
	setAttr ".tgi[5].ni[13].nvs" 18304;
	setAttr ".tgi[5].ni[14].x" 12153.03515625;
	setAttr ".tgi[5].ni[14].y" -22986.029296875;
	setAttr ".tgi[5].ni[14].nvs" 18304;
	setAttr ".tgi[5].ni[15].x" 12920.1181640625;
	setAttr ".tgi[5].ni[15].y" -21839.591796875;
	setAttr ".tgi[5].ni[15].nvs" 18304;
	setAttr ".tgi[5].ni[16].x" 12133.5283203125;
	setAttr ".tgi[5].ni[16].y" -22620.375;
	setAttr ".tgi[5].ni[16].nvs" 18304;
	setAttr ".tgi[5].ni[17].x" 12872.83203125;
	setAttr ".tgi[5].ni[17].y" -24440.666015625;
	setAttr ".tgi[5].ni[17].nvs" 18304;
	setAttr ".tgi[5].ni[18].x" 12136.2568359375;
	setAttr ".tgi[5].ni[18].y" -23433.578125;
	setAttr ".tgi[5].ni[18].nvs" 18304;
	setAttr ".tgi[5].ni[19].x" 12857.4638671875;
	setAttr ".tgi[5].ni[19].y" -23497.21484375;
	setAttr ".tgi[5].ni[19].nvs" 18304;
	setAttr ".tgi[5].ni[20].x" 12496.90234375;
	setAttr ".tgi[5].ni[20].y" -23110.78125;
	setAttr ".tgi[5].ni[20].nvs" 18305;
	setAttr ".tgi[5].ni[21].x" 12143.37109375;
	setAttr ".tgi[5].ni[21].y" -22375.8203125;
	setAttr ".tgi[5].ni[21].nvs" 18304;
	setAttr ".tgi[5].ni[22].x" 12513.86328125;
	setAttr ".tgi[5].ni[22].y" -22805.818359375;
	setAttr ".tgi[5].ni[22].nvs" 18305;
	setAttr ".tgi[5].ni[23].x" 12820.7060546875;
	setAttr ".tgi[5].ni[23].y" -22869.994140625;
	setAttr ".tgi[5].ni[23].nvs" 18304;
	setAttr ".tgi[5].ni[24].x" 12138.966796875;
	setAttr ".tgi[5].ni[24].y" -22085.154296875;
	setAttr ".tgi[5].ni[24].nvs" 18304;
	setAttr ".tgi[5].ni[25].x" 12852.642578125;
	setAttr ".tgi[5].ni[25].y" -23741.15234375;
	setAttr ".tgi[5].ni[25].nvs" 18304;
	setAttr ".tgi[5].ni[26].x" 12160.130859375;
	setAttr ".tgi[5].ni[26].y" -23260.984375;
	setAttr ".tgi[5].ni[26].nvs" 18304;
	setAttr ".tgi[5].ni[27].x" 12521.1416015625;
	setAttr ".tgi[5].ni[27].y" -22546.13671875;
	setAttr ".tgi[5].ni[27].nvs" 18305;
	setAttr ".tgi[5].ni[28].x" 12876.2607421875;
	setAttr ".tgi[5].ni[28].y" -22559.0078125;
	setAttr ".tgi[5].ni[28].nvs" 18304;
	setAttr ".tgi[5].ni[29].x" 12862.7236328125;
	setAttr ".tgi[5].ni[29].y" -22342.4140625;
	setAttr ".tgi[5].ni[29].nvs" 18304;
	setAttr ".tgi[5].ni[30].x" 12559.044921875;
	setAttr ".tgi[5].ni[30].y" -22266.326171875;
	setAttr ".tgi[5].ni[30].nvs" 18305;
	setAttr ".tgi[5].ni[31].x" 12217.01953125;
	setAttr ".tgi[5].ni[31].y" -21902.99609375;
	setAttr ".tgi[5].ni[31].nvs" 18304;
	setAttr ".tgi[5].ni[32].x" 12573.6025390625;
	setAttr ".tgi[5].ni[32].y" -22027.42578125;
	setAttr ".tgi[5].ni[32].nvs" 18305;
	setAttr ".tgi[5].ni[33].x" 12884.7490234375;
	setAttr ".tgi[5].ni[33].y" -22043.72265625;
	setAttr ".tgi[5].ni[33].nvs" 18304;
	setAttr ".tgi[5].ni[34].x" 12604.9296875;
	setAttr ".tgi[5].ni[34].y" -21796.37109375;
	setAttr ".tgi[5].ni[34].nvs" 18305;
	setAttr ".tgi[5].ni[35].x" 12240.484375;
	setAttr ".tgi[5].ni[35].y" -21769.826171875;
	setAttr ".tgi[5].ni[35].nvs" 18304;
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
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -av -k on ".lm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
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
	setAttr -av -k on ".ta";
	setAttr -av -k on ".tq";
	setAttr -k on ".ts";
	setAttr -av -k on ".etmr";
	setAttr -k on ".tmrm";
	setAttr -av -k on ".tmr";
	setAttr -av -k on ".aoon";
	setAttr -av -k on ".aoam";
	setAttr -av -k on ".aora";
	setAttr -k on ".aofr";
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
	setAttr -av -k on ".msaa";
	setAttr -av -k on ".aasc";
	setAttr -av -k on ".aasq";
	setAttr -k on ".laa";
	setAttr -k on ".gamm";
	setAttr -k on ".gmmv";
	setAttr -k on ".fprt" yes;
	setAttr -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
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
	setAttr -s 171 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :standardSurface1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -s 4 ".dsm";
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
select -ne :initialMaterialInfo;
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
	setAttr -av -k on ".outf" 8;
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -k on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
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
	setAttr ".dss" -type "string" "standardSurface1";
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
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".gsn";
	setAttr -k on ".gsv";
connectAttr "mainPoser.sx" "mainPoser.sy";
connectAttr "mainPoser.sx" "mainPoser.sz";
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "inbetweens_point_1_1_pointConstraint1.ctx" "inbetweens_point_1_1.tx"
		;
connectAttr "inbetweens_point_1_1_pointConstraint1.cty" "inbetweens_point_1_1.ty"
		;
connectAttr "inbetweens_point_1_1_pointConstraint1.ctz" "inbetweens_point_1_1.tz"
		;
connectAttr "inbetweens_point_1_1.pim" "inbetweens_point_1_1_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_1.rp" "inbetweens_point_1_1_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_1.rpt" "inbetweens_point_1_1_pointConstraint1.crt"
		;
connectAttr "inbetweens_point_1_7.t" "inbetweens_point_1_1_pointConstraint1.tg[0].tt"
		;
connectAttr "inbetweens_point_1_7.rp" "inbetweens_point_1_1_pointConstraint1.tg[0].trp"
		;
connectAttr "inbetweens_point_1_7.rpt" "inbetweens_point_1_1_pointConstraint1.tg[0].trt"
		;
connectAttr "inbetweens_point_1_7.pm" "inbetweens_point_1_1_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_1_pointConstraint1.w0" "inbetweens_point_1_1_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_7_poser.t" "inbetweens_point_1_1_pointConstraint1.tg[1].tt";
connectAttr "skin_7_poser.rp" "inbetweens_point_1_1_pointConstraint1.tg[1].trp";
connectAttr "skin_7_poser.rpt" "inbetweens_point_1_1_pointConstraint1.tg[1].trt"
		;
connectAttr "skin_7_poser.pm" "inbetweens_point_1_1_pointConstraint1.tg[1].tpm";
connectAttr "inbetweens_point_1_1_pointConstraint1.w1" "inbetweens_point_1_1_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_2_pointConstraint1.ctx" "inbetweens_point_1_2.tx"
		;
connectAttr "inbetweens_point_1_2_pointConstraint1.cty" "inbetweens_point_1_2.ty"
		;
connectAttr "inbetweens_point_1_2_pointConstraint1.ctz" "inbetweens_point_1_2.tz"
		;
connectAttr "inbetweens_point_1_2.pim" "inbetweens_point_1_2_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_2.rp" "inbetweens_point_1_2_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_2.rpt" "inbetweens_point_1_2_pointConstraint1.crt"
		;
connectAttr "skin_5_poser.t" "inbetweens_point_1_2_pointConstraint1.tg[0].tt";
connectAttr "skin_5_poser.rp" "inbetweens_point_1_2_pointConstraint1.tg[0].trp";
connectAttr "skin_5_poser.rpt" "inbetweens_point_1_2_pointConstraint1.tg[0].trt"
		;
connectAttr "skin_5_poser.pm" "inbetweens_point_1_2_pointConstraint1.tg[0].tpm";
connectAttr "inbetweens_point_1_2_pointConstraint1.w0" "inbetweens_point_1_2_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_6_poser.t" "inbetweens_point_1_2_pointConstraint1.tg[1].tt";
connectAttr "skin_6_poser.rp" "inbetweens_point_1_2_pointConstraint1.tg[1].trp";
connectAttr "skin_6_poser.rpt" "inbetweens_point_1_2_pointConstraint1.tg[1].trt"
		;
connectAttr "skin_6_poser.pm" "inbetweens_point_1_2_pointConstraint1.tg[1].tpm";
connectAttr "inbetweens_point_1_2_pointConstraint1.w1" "inbetweens_point_1_2_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_3_pointConstraint1.ctx" "inbetweens_point_1_3.tx"
		;
connectAttr "inbetweens_point_1_3_pointConstraint1.cty" "inbetweens_point_1_3.ty"
		;
connectAttr "inbetweens_point_1_3_pointConstraint1.ctz" "inbetweens_point_1_3.tz"
		;
connectAttr "inbetweens_point_1_3.pim" "inbetweens_point_1_3_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_3.rp" "inbetweens_point_1_3_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_3.rpt" "inbetweens_point_1_3_pointConstraint1.crt"
		;
connectAttr "inbetweens_point_1_8.t" "inbetweens_point_1_3_pointConstraint1.tg[0].tt"
		;
connectAttr "inbetweens_point_1_8.rp" "inbetweens_point_1_3_pointConstraint1.tg[0].trp"
		;
connectAttr "inbetweens_point_1_8.rpt" "inbetweens_point_1_3_pointConstraint1.tg[0].trt"
		;
connectAttr "inbetweens_point_1_8.pm" "inbetweens_point_1_3_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_3_pointConstraint1.w0" "inbetweens_point_1_3_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_8_poser.t" "inbetweens_point_1_3_pointConstraint1.tg[1].tt";
connectAttr "skin_8_poser.rp" "inbetweens_point_1_3_pointConstraint1.tg[1].trp";
connectAttr "skin_8_poser.rpt" "inbetweens_point_1_3_pointConstraint1.tg[1].trt"
		;
connectAttr "skin_8_poser.pm" "inbetweens_point_1_3_pointConstraint1.tg[1].tpm";
connectAttr "inbetweens_point_1_3_pointConstraint1.w1" "inbetweens_point_1_3_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_2_1_pointConstraint2.ctx" "inbetweens_point_2_1.tx"
		;
connectAttr "inbetweens_point_2_1_pointConstraint2.cty" "inbetweens_point_2_1.ty"
		;
connectAttr "inbetweens_point_2_1_pointConstraint2.ctz" "inbetweens_point_2_1.tz"
		;
connectAttr "inbetweens_point_2_1.pim" "inbetweens_point_2_1_pointConstraint2.cpim"
		;
connectAttr "inbetweens_point_2_1.rp" "inbetweens_point_2_1_pointConstraint2.crp"
		;
connectAttr "inbetweens_point_2_1.rpt" "inbetweens_point_2_1_pointConstraint2.crt"
		;
connectAttr "inbetweens_point_1_7.t" "inbetweens_point_2_1_pointConstraint2.tg[0].tt"
		;
connectAttr "inbetweens_point_1_7.rp" "inbetweens_point_2_1_pointConstraint2.tg[0].trp"
		;
connectAttr "inbetweens_point_1_7.rpt" "inbetweens_point_2_1_pointConstraint2.tg[0].trt"
		;
connectAttr "inbetweens_point_1_7.pm" "inbetweens_point_2_1_pointConstraint2.tg[0].tpm"
		;
connectAttr "inbetweens_point_2_1_pointConstraint2.w0" "inbetweens_point_2_1_pointConstraint2.tg[0].tw"
		;
connectAttr "skin_7_poser.t" "inbetweens_point_2_1_pointConstraint2.tg[1].tt";
connectAttr "skin_7_poser.rp" "inbetweens_point_2_1_pointConstraint2.tg[1].trp";
connectAttr "skin_7_poser.rpt" "inbetweens_point_2_1_pointConstraint2.tg[1].trt"
		;
connectAttr "skin_7_poser.pm" "inbetweens_point_2_1_pointConstraint2.tg[1].tpm";
connectAttr "inbetweens_point_2_1_pointConstraint2.w1" "inbetweens_point_2_1_pointConstraint2.tg[1].tw"
		;
connectAttr "inbetweens_point_2_2_pointConstraint1.ctx" "inbetweens_point_2_2.tx"
		;
connectAttr "inbetweens_point_2_2_pointConstraint1.cty" "inbetweens_point_2_2.ty"
		;
connectAttr "inbetweens_point_2_2_pointConstraint1.ctz" "inbetweens_point_2_2.tz"
		;
connectAttr "inbetweens_point_2_2.pim" "inbetweens_point_2_2_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_2_2.rp" "inbetweens_point_2_2_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_2_2.rpt" "inbetweens_point_2_2_pointConstraint1.crt"
		;
connectAttr "skin_5_poser.t" "inbetweens_point_2_2_pointConstraint1.tg[0].tt";
connectAttr "skin_5_poser.rp" "inbetweens_point_2_2_pointConstraint1.tg[0].trp";
connectAttr "skin_5_poser.rpt" "inbetweens_point_2_2_pointConstraint1.tg[0].trt"
		;
connectAttr "skin_5_poser.pm" "inbetweens_point_2_2_pointConstraint1.tg[0].tpm";
connectAttr "inbetweens_point_2_2_pointConstraint1.w0" "inbetweens_point_2_2_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_6_poser.t" "inbetweens_point_2_2_pointConstraint1.tg[1].tt";
connectAttr "skin_6_poser.rp" "inbetweens_point_2_2_pointConstraint1.tg[1].trp";
connectAttr "skin_6_poser.rpt" "inbetweens_point_2_2_pointConstraint1.tg[1].trt"
		;
connectAttr "skin_6_poser.pm" "inbetweens_point_2_2_pointConstraint1.tg[1].tpm";
connectAttr "inbetweens_point_2_2_pointConstraint1.w1" "inbetweens_point_2_2_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_2_3_pointConstraint1.ctx" "inbetweens_point_2_3.tx"
		;
connectAttr "inbetweens_point_2_3_pointConstraint1.cty" "inbetweens_point_2_3.ty"
		;
connectAttr "inbetweens_point_2_3_pointConstraint1.ctz" "inbetweens_point_2_3.tz"
		;
connectAttr "inbetweens_point_2_3.pim" "inbetweens_point_2_3_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_2_3.rp" "inbetweens_point_2_3_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_2_3.rpt" "inbetweens_point_2_3_pointConstraint1.crt"
		;
connectAttr "inbetweens_point_1_8.t" "inbetweens_point_2_3_pointConstraint1.tg[0].tt"
		;
connectAttr "inbetweens_point_1_8.rp" "inbetweens_point_2_3_pointConstraint1.tg[0].trp"
		;
connectAttr "inbetweens_point_1_8.rpt" "inbetweens_point_2_3_pointConstraint1.tg[0].trt"
		;
connectAttr "inbetweens_point_1_8.pm" "inbetweens_point_2_3_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_2_3_pointConstraint1.w0" "inbetweens_point_2_3_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_8_poser.t" "inbetweens_point_2_3_pointConstraint1.tg[1].tt";
connectAttr "skin_8_poser.rp" "inbetweens_point_2_3_pointConstraint1.tg[1].trp";
connectAttr "skin_8_poser.rpt" "inbetweens_point_2_3_pointConstraint1.tg[1].trt"
		;
connectAttr "skin_8_poser.pm" "inbetweens_point_2_3_pointConstraint1.tg[1].tpm";
connectAttr "inbetweens_point_2_3_pointConstraint1.w1" "inbetweens_point_2_3_pointConstraint1.tg[1].tw"
		;
connectAttr "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.ctx" "inbetweens_point_1_7.tx"
		;
connectAttr "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.cty" "inbetweens_point_1_7.ty"
		;
connectAttr "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.ctz" "inbetweens_point_1_7.tz"
		;
connectAttr "inbetweens_point_1_7.pim" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_7.rp" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_7.rpt" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.crt"
		;
connectAttr "skin_1_poser.t" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[0].tt"
		;
connectAttr "skin_1_poser.rp" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[0].trp"
		;
connectAttr "skin_1_poser.rpt" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[0].trt"
		;
connectAttr "skin_1_poser.pm" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[0].tpm"
		;
connectAttr "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.w0" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_5_poser.t" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[1].tt"
		;
connectAttr "skin_5_poser.rp" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[1].trp"
		;
connectAttr "skin_5_poser.rpt" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[1].trt"
		;
connectAttr "skin_5_poser.pm" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[1].tpm"
		;
connectAttr "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.w1" "|mod|posers|mainPoser|inbetweens_points|inbetweens_point_1_7|inbetweens_point_1_7_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_8_pointConstraint1.ctx" "inbetweens_point_1_8.tx"
		;
connectAttr "inbetweens_point_1_8_pointConstraint1.cty" "inbetweens_point_1_8.ty"
		;
connectAttr "inbetweens_point_1_8_pointConstraint1.ctz" "inbetweens_point_1_8.tz"
		;
connectAttr "inbetweens_point_1_8.pim" "inbetweens_point_1_8_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_8.rp" "inbetweens_point_1_8_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_8.rpt" "inbetweens_point_1_8_pointConstraint1.crt"
		;
connectAttr "skin_5_poser.t" "inbetweens_point_1_8_pointConstraint1.tg[0].tt";
connectAttr "skin_5_poser.rp" "inbetweens_point_1_8_pointConstraint1.tg[0].trp";
connectAttr "skin_5_poser.rpt" "inbetweens_point_1_8_pointConstraint1.tg[0].trt"
		;
connectAttr "skin_5_poser.pm" "inbetweens_point_1_8_pointConstraint1.tg[0].tpm";
connectAttr "inbetweens_point_1_8_pointConstraint1.w0" "inbetweens_point_1_8_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_1_poser.t" "inbetweens_point_1_8_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_4_1_poser.rp" "inbetweens_point_1_8_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_4_1_poser.rpt" "inbetweens_point_1_8_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_4_1_poser.pm" "inbetweens_point_1_8_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_1_8_pointConstraint1.w1" "inbetweens_point_1_8_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_2_7_pointConstraint1.ctx" "inbetweens_point_2_7.tx"
		;
connectAttr "inbetweens_point_2_7_pointConstraint1.cty" "inbetweens_point_2_7.ty"
		;
connectAttr "inbetweens_point_2_7_pointConstraint1.ctz" "inbetweens_point_2_7.tz"
		;
connectAttr "inbetweens_point_2_7.pim" "inbetweens_point_2_7_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_2_7.rp" "inbetweens_point_2_7_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_2_7.rpt" "inbetweens_point_2_7_pointConstraint1.crt"
		;
connectAttr "finger_4_1_poser.t" "inbetweens_point_2_7_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_1_poser.rp" "inbetweens_point_2_7_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_1_poser.rpt" "inbetweens_point_2_7_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_1_poser.pm" "inbetweens_point_2_7_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_2_7_pointConstraint1.w0" "inbetweens_point_2_7_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_1_poser.t" "inbetweens_point_2_7_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_3_1_poser.rp" "inbetweens_point_2_7_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_3_1_poser.rpt" "inbetweens_point_2_7_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_3_1_poser.pm" "inbetweens_point_2_7_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_2_7_pointConstraint1.w1" "inbetweens_point_2_7_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_9_pointConstraint1.ctx" "inbetweens_point_1_9.tx"
		;
connectAttr "inbetweens_point_1_9_pointConstraint1.cty" "inbetweens_point_1_9.ty"
		;
connectAttr "inbetweens_point_1_9_pointConstraint1.ctz" "inbetweens_point_1_9.tz"
		;
connectAttr "inbetweens_point_1_9.pim" "inbetweens_point_1_9_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_9.rp" "inbetweens_point_1_9_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_9.rpt" "inbetweens_point_1_9_pointConstraint1.crt"
		;
connectAttr "finger_3_1_poser.t" "inbetweens_point_1_9_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_1_poser.rp" "inbetweens_point_1_9_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_1_poser.rpt" "inbetweens_point_1_9_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_1_poser.pm" "inbetweens_point_1_9_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_9_pointConstraint1.w0" "inbetweens_point_1_9_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_1_poser.t" "inbetweens_point_1_9_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_2_1_poser.rp" "inbetweens_point_1_9_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_2_1_poser.rpt" "inbetweens_point_1_9_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_2_1_poser.pm" "inbetweens_point_1_9_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_1_9_pointConstraint1.w1" "inbetweens_point_1_9_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_10_pointConstraint1.ctx" "inbetweens_point_1_10.tx"
		;
connectAttr "inbetweens_point_1_10_pointConstraint1.ctz" "inbetweens_point_1_10.tz"
		;
connectAttr "inbetweens_point_1_10_pointConstraint1.cty" "inbetweens_point_1_10.ty"
		;
connectAttr "inbetweens_point_1_10.pim" "inbetweens_point_1_10_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_10.rp" "inbetweens_point_1_10_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_10.rpt" "inbetweens_point_1_10_pointConstraint1.crt"
		;
connectAttr "finger_2_1_poser.t" "inbetweens_point_1_10_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_1_poser.rp" "inbetweens_point_1_10_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_1_poser.rpt" "inbetweens_point_1_10_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_1_poser.pm" "inbetweens_point_1_10_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_10_pointConstraint1.w0" "inbetweens_point_1_10_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_1_poser.t" "inbetweens_point_1_10_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_1_1_poser.rp" "inbetweens_point_1_10_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_1_1_poser.rpt" "inbetweens_point_1_10_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_1_1_poser.pm" "inbetweens_point_1_10_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_1_10_pointConstraint1.w1" "inbetweens_point_1_10_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_6_group_pointConstraint1.ctx" "inbetweens_point_1_6_group.tx"
		;
connectAttr "inbetweens_point_1_6_group_pointConstraint1.cty" "inbetweens_point_1_6_group.ty"
		;
connectAttr "inbetweens_point_1_6_group_pointConstraint1.ctz" "inbetweens_point_1_6_group.tz"
		;
connectAttr "inbetweens_point_1_6_group.pim" "inbetweens_point_1_6_group_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_6_group.rp" "inbetweens_point_1_6_group_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_6_group.rpt" "inbetweens_point_1_6_group_pointConstraint1.crt"
		;
connectAttr "finger_4_3_poser.t" "inbetweens_point_1_6_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_3_poser.rp" "inbetweens_point_1_6_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_3_poser.rpt" "inbetweens_point_1_6_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_3_poser.pm" "inbetweens_point_1_6_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_6_group_pointConstraint1.w0" "inbetweens_point_1_6_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_3_poser.t" "inbetweens_point_1_6_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_3_3_poser.rp" "inbetweens_point_1_6_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_3_3_poser.rpt" "inbetweens_point_1_6_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_3_3_poser.pm" "inbetweens_point_1_6_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_1_6_group_pointConstraint1.w1" "inbetweens_point_1_6_group_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_2_6_group_pointConstraint1.ctx" "inbetweens_point_2_6_group.tx"
		;
connectAttr "inbetweens_point_2_6_group_pointConstraint1.cty" "inbetweens_point_2_6_group.ty"
		;
connectAttr "inbetweens_point_2_6_group_pointConstraint1.ctz" "inbetweens_point_2_6_group.tz"
		;
connectAttr "inbetweens_point_2_6_group.pim" "inbetweens_point_2_6_group_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_2_6_group.rp" "inbetweens_point_2_6_group_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_2_6_group.rpt" "inbetweens_point_2_6_group_pointConstraint1.crt"
		;
connectAttr "finger_4_2_poser.t" "inbetweens_point_2_6_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_2_poser.rp" "inbetweens_point_2_6_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_2_poser.rpt" "inbetweens_point_2_6_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_2_poser.pm" "inbetweens_point_2_6_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_2_6_group_pointConstraint1.w0" "inbetweens_point_2_6_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_2_poser.t" "inbetweens_point_2_6_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_3_2_poser.rp" "inbetweens_point_2_6_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_3_2_poser.rpt" "inbetweens_point_2_6_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_3_2_poser.pm" "inbetweens_point_2_6_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_2_6_group_pointConstraint1.w1" "inbetweens_point_2_6_group_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_2_4_group_pointConstraint1.ctx" "inbetweens_point_2_4_group.tx"
		;
connectAttr "inbetweens_point_2_4_group_pointConstraint1.cty" "inbetweens_point_2_4_group.ty"
		;
connectAttr "inbetweens_point_2_4_group_pointConstraint1.ctz" "inbetweens_point_2_4_group.tz"
		;
connectAttr "multiplyDivide359.o" "inbetweens_point_2_4.t";
connectAttr "inbetweens_point_2_4_group.pim" "inbetweens_point_2_4_group_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_2_4_group.rp" "inbetweens_point_2_4_group_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_2_4_group.rpt" "inbetweens_point_2_4_group_pointConstraint1.crt"
		;
connectAttr "finger_3_3_poser.t" "inbetweens_point_2_4_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_3_poser.rp" "inbetweens_point_2_4_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_3_poser.rpt" "inbetweens_point_2_4_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_3_poser.pm" "inbetweens_point_2_4_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_2_4_group_pointConstraint1.w0" "inbetweens_point_2_4_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_3_poser.t" "inbetweens_point_2_4_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_2_3_poser.rp" "inbetweens_point_2_4_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_2_3_poser.rpt" "inbetweens_point_2_4_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_2_3_poser.pm" "inbetweens_point_2_4_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_2_4_group_pointConstraint1.w1" "inbetweens_point_2_4_group_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_4_group_pointConstraint1.ctx" "inbetweens_point_1_4_group.tx"
		;
connectAttr "inbetweens_point_1_4_group_pointConstraint1.cty" "inbetweens_point_1_4_group.ty"
		;
connectAttr "inbetweens_point_1_4_group_pointConstraint1.ctz" "inbetweens_point_1_4_group.tz"
		;
connectAttr "multiplyDivide358.o" "inbetweens_point_1_4.t";
connectAttr "inbetweens_point_1_4_group.pim" "inbetweens_point_1_4_group_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_4_group.rp" "inbetweens_point_1_4_group_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_4_group.rpt" "inbetweens_point_1_4_group_pointConstraint1.crt"
		;
connectAttr "finger_3_2_poser.t" "inbetweens_point_1_4_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_2_poser.rp" "inbetweens_point_1_4_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_2_poser.rpt" "inbetweens_point_1_4_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_2_poser.pm" "inbetweens_point_1_4_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_4_group_pointConstraint1.w0" "inbetweens_point_1_4_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_2_poser.t" "inbetweens_point_1_4_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_2_2_poser.rp" "inbetweens_point_1_4_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_2_2_poser.rpt" "inbetweens_point_1_4_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_2_2_poser.pm" "inbetweens_point_1_4_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_1_4_group_pointConstraint1.w1" "inbetweens_point_1_4_group_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_2_5_group_pointConstraint1.ctx" "inbetweens_point_2_5_group.tx"
		;
connectAttr "inbetweens_point_2_5_group_pointConstraint1.cty" "inbetweens_point_2_5_group.ty"
		;
connectAttr "inbetweens_point_2_5_group_pointConstraint1.ctz" "inbetweens_point_2_5_group.tz"
		;
connectAttr "multiplyDivide360.o" "inbetweens_point_2_5.t";
connectAttr "inbetweens_point_2_5_group.pim" "inbetweens_point_2_5_group_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_2_5_group.rp" "inbetweens_point_2_5_group_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_2_5_group.rpt" "inbetweens_point_2_5_group_pointConstraint1.crt"
		;
connectAttr "finger_2_3_poser.t" "inbetweens_point_2_5_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_3_poser.rp" "inbetweens_point_2_5_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_3_poser.rpt" "inbetweens_point_2_5_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_3_poser.pm" "inbetweens_point_2_5_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_2_5_group_pointConstraint1.w0" "inbetweens_point_2_5_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_3_poser.t" "inbetweens_point_2_5_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_1_3_poser.rp" "inbetweens_point_2_5_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_1_3_poser.rpt" "inbetweens_point_2_5_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_1_3_poser.pm" "inbetweens_point_2_5_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_2_5_group_pointConstraint1.w1" "inbetweens_point_2_5_group_pointConstraint1.tg[1].tw"
		;
connectAttr "inbetweens_point_1_5_group_pointConstraint1.ctx" "inbetweens_point_1_5_group.tx"
		;
connectAttr "inbetweens_point_1_5_group_pointConstraint1.cty" "inbetweens_point_1_5_group.ty"
		;
connectAttr "inbetweens_point_1_5_group_pointConstraint1.ctz" "inbetweens_point_1_5_group.tz"
		;
connectAttr "multiplyDivide361.o" "inbetweens_point_1_5.t";
connectAttr "inbetweens_point_1_5_group.pim" "inbetweens_point_1_5_group_pointConstraint1.cpim"
		;
connectAttr "inbetweens_point_1_5_group.rp" "inbetweens_point_1_5_group_pointConstraint1.crp"
		;
connectAttr "inbetweens_point_1_5_group.rpt" "inbetweens_point_1_5_group_pointConstraint1.crt"
		;
connectAttr "finger_2_2_poser.t" "inbetweens_point_1_5_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_2_poser.rp" "inbetweens_point_1_5_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_2_poser.rpt" "inbetweens_point_1_5_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_2_poser.pm" "inbetweens_point_1_5_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "inbetweens_point_1_5_group_pointConstraint1.w0" "inbetweens_point_1_5_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_2_poser.t" "inbetweens_point_1_5_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_1_2_poser.rp" "inbetweens_point_1_5_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_1_2_poser.rpt" "inbetweens_point_1_5_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_1_2_poser.pm" "inbetweens_point_1_5_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "inbetweens_point_1_5_group_pointConstraint1.w1" "inbetweens_point_1_5_group_pointConstraint1.tg[1].tw"
		;
connectAttr "condition2.ocr" "main_posers_group.v";
connectAttr "root_poser.sx" "root_poser.sy" -l on;
connectAttr "root_poser.sx" "root_poser.sz" -l on;
connectAttr "l_clav_makeNurbSphere.os" "root_poserShape.cr";
connectAttr "root_poser_aimConstraint.crx" "start_poser.rx";
connectAttr "root_poser_aimConstraint.cry" "start_poser.ry";
connectAttr "root_poser_aimConstraint.crz" "start_poser.rz";
connectAttr "start_poser.sx" "start_poser.sy" -l on;
connectAttr "start_poser.sx" "start_poser.sz" -l on;
connectAttr "l_arm_makeNurbSphere1.os" "start_poserShape.cr";
connectAttr "rootMiddle_orient_locator_aimConstraint.crx" "start_poserOrient.rx"
		;
connectAttr "rootMiddle_orient_locator_aimConstraint.cry" "start_poserOrient.ry"
		;
connectAttr "rootMiddle_orient_locator_aimConstraint.crz" "start_poserOrient.rz"
		;
connectAttr "start_poserOrient.pim" "rootMiddle_orient_locator_aimConstraint.cpim"
		;
connectAttr "start_poserOrient.t" "rootMiddle_orient_locator_aimConstraint.ct";
connectAttr "start_poserOrient.rp" "rootMiddle_orient_locator_aimConstraint.crp"
		;
connectAttr "start_poserOrient.rpt" "rootMiddle_orient_locator_aimConstraint.crt"
		;
connectAttr "start_poserOrient.ro" "rootMiddle_orient_locator_aimConstraint.cro"
		;
connectAttr "middle_poser.t" "rootMiddle_orient_locator_aimConstraint.tg[0].tt";
connectAttr "middle_poser.rp" "rootMiddle_orient_locator_aimConstraint.tg[0].trp"
		;
connectAttr "middle_poser.rpt" "rootMiddle_orient_locator_aimConstraint.tg[0].trt"
		;
connectAttr "middle_poser.pm" "rootMiddle_orient_locator_aimConstraint.tg[0].tpm"
		;
connectAttr "rootMiddle_orient_locator_aimConstraint.w0" "rootMiddle_orient_locator_aimConstraint.tg[0].tw"
		;
connectAttr "l_arm_unitConversion1.o" "rootMiddle_orient_locator_aimConstraint.ox"
		;
connectAttr "mainPoser.wm" "rootMiddle_orient_locator_aimConstraint.wum";
connectAttr "mirror_condition.ocr" "start_initLoc.sx";
connectAttr "root_initLoc_aimConstraint.crx" "start_initLoc.rx";
connectAttr "root_initLoc_aimConstraint.cry" "start_initLoc.ry";
connectAttr "root_initLoc_aimConstraint.crz" "start_initLoc.rz";
connectAttr "start_initLoc.pim" "root_initLoc_aimConstraint.cpim";
connectAttr "start_initLoc.t" "root_initLoc_aimConstraint.ct";
connectAttr "start_initLoc.rp" "root_initLoc_aimConstraint.crp";
connectAttr "start_initLoc.rpt" "root_initLoc_aimConstraint.crt";
connectAttr "start_initLoc.ro" "root_initLoc_aimConstraint.cro";
connectAttr "middle_poser.t" "root_initLoc_aimConstraint.tg[0].tt";
connectAttr "middle_poser.rp" "root_initLoc_aimConstraint.tg[0].trp";
connectAttr "middle_poser.rpt" "root_initLoc_aimConstraint.tg[0].trt";
connectAttr "middle_poser.pm" "root_initLoc_aimConstraint.tg[0].tpm";
connectAttr "root_initLoc_aimConstraint.w0" "root_initLoc_aimConstraint.tg[0].tw"
		;
connectAttr "middle_up_loc.wm" "root_initLoc_aimConstraint.wum";
connectAttr "l_arm_decomposeMatrix25.ot" "ik_end_initLoc.t";
connectAttr "l_arm_decomposeMatrix25.or" "ik_end_initLoc.r";
connectAttr "l_arm_decomposeMatrix25.os" "ik_end_initLoc.s";
connectAttr "start_poser.pim" "root_poser_aimConstraint.cpim";
connectAttr "start_poser.t" "root_poser_aimConstraint.ct";
connectAttr "start_poser.rp" "root_poser_aimConstraint.crp";
connectAttr "start_poser.rpt" "root_poser_aimConstraint.crt";
connectAttr "start_poser.ro" "root_poser_aimConstraint.cro";
connectAttr "middle_poser.t" "root_poser_aimConstraint.tg[0].tt";
connectAttr "middle_poser.rp" "root_poser_aimConstraint.tg[0].trp";
connectAttr "middle_poser.rpt" "root_poser_aimConstraint.tg[0].trt";
connectAttr "middle_poser.pm" "root_poser_aimConstraint.tg[0].tpm";
connectAttr "root_poser_aimConstraint.w0" "root_poser_aimConstraint.tg[0].tw";
connectAttr "end_poser.wm" "root_poser_aimConstraint.wum";
connectAttr "main_root_initLoc_aimConstraint1.crx" "main_root_initLoc.rx";
connectAttr "main_root_initLoc_aimConstraint1.cry" "main_root_initLoc.ry";
connectAttr "main_root_initLoc_aimConstraint1.crz" "main_root_initLoc.rz";
connectAttr "main_root_initLoc.pim" "main_root_initLoc_aimConstraint1.cpim";
connectAttr "main_root_initLoc.t" "main_root_initLoc_aimConstraint1.ct";
connectAttr "main_root_initLoc.rp" "main_root_initLoc_aimConstraint1.crp";
connectAttr "main_root_initLoc.rpt" "main_root_initLoc_aimConstraint1.crt";
connectAttr "main_root_initLoc.ro" "main_root_initLoc_aimConstraint1.cro";
connectAttr "skin_4_poser.t" "main_root_initLoc_aimConstraint1.tg[0].tt";
connectAttr "skin_4_poser.rp" "main_root_initLoc_aimConstraint1.tg[0].trp";
connectAttr "skin_4_poser.rpt" "main_root_initLoc_aimConstraint1.tg[0].trt";
connectAttr "skin_4_poser.pm" "main_root_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "main_root_initLoc_aimConstraint1.w0" "main_root_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "start_poser.wm" "main_root_initLoc_aimConstraint1.wum";
connectAttr "l_arm_makeNurbSphere2.os" "middle_poserShape.cr";
connectAttr "middleEnd_orient_locator_aimConstraint.crx" "middle_poserOrient.rx"
		;
connectAttr "middleEnd_orient_locator_aimConstraint.cry" "middle_poserOrient.ry"
		;
connectAttr "middleEnd_orient_locator_aimConstraint.crz" "middle_poserOrient.rz"
		;
connectAttr "middle_poserOrient.pim" "middleEnd_orient_locator_aimConstraint.cpim"
		;
connectAttr "middle_poserOrient.t" "middleEnd_orient_locator_aimConstraint.ct";
connectAttr "middle_poserOrient.rp" "middleEnd_orient_locator_aimConstraint.crp"
		;
connectAttr "middle_poserOrient.rpt" "middleEnd_orient_locator_aimConstraint.crt"
		;
connectAttr "middle_poserOrient.ro" "middleEnd_orient_locator_aimConstraint.cro"
		;
connectAttr "end_poser.t" "middleEnd_orient_locator_aimConstraint.tg[0].tt";
connectAttr "end_poser.rp" "middleEnd_orient_locator_aimConstraint.tg[0].trp";
connectAttr "end_poser.rpt" "middleEnd_orient_locator_aimConstraint.tg[0].trt";
connectAttr "end_poser.pm" "middleEnd_orient_locator_aimConstraint.tg[0].tpm";
connectAttr "middleEnd_orient_locator_aimConstraint.w0" "middleEnd_orient_locator_aimConstraint.tg[0].tw"
		;
connectAttr "l_arm_unitConversion432.o" "middleEnd_orient_locator_aimConstraint.ox"
		;
connectAttr "start_poser.wm" "middleEnd_orient_locator_aimConstraint.wum";
connectAttr "mirror_condition.ocr" "middle_initLoc.sx";
connectAttr "root_twist_angleLoc_1_aimConstraint1.crx" "root_twist_angleLoc_1.rx"
		;
connectAttr "root_twist_angleLoc_1_aimConstraint1.cry" "root_twist_angleLoc_1.ry"
		;
connectAttr "root_twist_angleLoc_1_aimConstraint1.crz" "root_twist_angleLoc_1.rz"
		;
connectAttr "root_twist_angleLoc_2_aimConstraint1.crx" "root_twist_angleLoc_2.rx"
		;
connectAttr "root_twist_angleLoc_2_aimConstraint1.cry" "root_twist_angleLoc_2.ry"
		;
connectAttr "root_twist_angleLoc_2_aimConstraint1.crz" "root_twist_angleLoc_2.rz"
		;
connectAttr "root_twist_angleLoc_2.pim" "root_twist_angleLoc_2_aimConstraint1.cpim"
		;
connectAttr "root_twist_angleLoc_2.t" "root_twist_angleLoc_2_aimConstraint1.ct";
connectAttr "root_twist_angleLoc_2.rp" "root_twist_angleLoc_2_aimConstraint1.crp"
		;
connectAttr "root_twist_angleLoc_2.rpt" "root_twist_angleLoc_2_aimConstraint1.crt"
		;
connectAttr "root_twist_angleLoc_2.ro" "root_twist_angleLoc_2_aimConstraint1.cro"
		;
connectAttr "start_poser.t" "root_twist_angleLoc_2_aimConstraint1.tg[0].tt";
connectAttr "start_poser.rp" "root_twist_angleLoc_2_aimConstraint1.tg[0].trp";
connectAttr "start_poser.rpt" "root_twist_angleLoc_2_aimConstraint1.tg[0].trt";
connectAttr "start_poser.pm" "root_twist_angleLoc_2_aimConstraint1.tg[0].tpm";
connectAttr "root_twist_angleLoc_2_aimConstraint1.w0" "root_twist_angleLoc_2_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "root_twist_angleLoc_2_aimConstraint1.wum";
connectAttr "root_twist_angleLoc_1.pim" "root_twist_angleLoc_1_aimConstraint1.cpim"
		;
connectAttr "root_twist_angleLoc_1.t" "root_twist_angleLoc_1_aimConstraint1.ct";
connectAttr "root_twist_angleLoc_1.rp" "root_twist_angleLoc_1_aimConstraint1.crp"
		;
connectAttr "root_twist_angleLoc_1.rpt" "root_twist_angleLoc_1_aimConstraint1.crt"
		;
connectAttr "root_twist_angleLoc_1.ro" "root_twist_angleLoc_1_aimConstraint1.cro"
		;
connectAttr "start_poser.t" "root_twist_angleLoc_1_aimConstraint1.tg[0].tt";
connectAttr "start_poser.rp" "root_twist_angleLoc_1_aimConstraint1.tg[0].trp";
connectAttr "start_poser.rpt" "root_twist_angleLoc_1_aimConstraint1.tg[0].trt";
connectAttr "start_poser.pm" "root_twist_angleLoc_1_aimConstraint1.tg[0].tpm";
connectAttr "root_twist_angleLoc_1_aimConstraint1.w0" "root_twist_angleLoc_1_aimConstraint1.tg[0].tw"
		;
connectAttr "end_poser.wm" "root_twist_angleLoc_1_aimConstraint1.wum";
connectAttr "middle_init_loc_offset_aimConstraint1.crx" "middle_init_loc_offset.rx"
		;
connectAttr "middle_init_loc_offset_aimConstraint1.cry" "middle_init_loc_offset.ry"
		;
connectAttr "middle_init_loc_offset_aimConstraint1.crz" "middle_init_loc_offset.rz"
		;
connectAttr "middle_init_loc_offset.pim" "middle_init_loc_offset_aimConstraint1.cpim"
		;
connectAttr "middle_init_loc_offset.t" "middle_init_loc_offset_aimConstraint1.ct"
		;
connectAttr "middle_init_loc_offset.rp" "middle_init_loc_offset_aimConstraint1.crp"
		;
connectAttr "middle_init_loc_offset.rpt" "middle_init_loc_offset_aimConstraint1.crt"
		;
connectAttr "middle_init_loc_offset.ro" "middle_init_loc_offset_aimConstraint1.cro"
		;
connectAttr "skin_6_poser.t" "middle_init_loc_offset_aimConstraint1.tg[0].tt";
connectAttr "skin_6_poser.rp" "middle_init_loc_offset_aimConstraint1.tg[0].trp";
connectAttr "skin_6_poser.rpt" "middle_init_loc_offset_aimConstraint1.tg[0].trt"
		;
connectAttr "skin_6_poser.pm" "middle_init_loc_offset_aimConstraint1.tg[0].tpm";
connectAttr "middle_init_loc_offset_aimConstraint1.w0" "middle_init_loc_offset_aimConstraint1.tg[0].tw"
		;
connectAttr "start_poser.wm" "middle_init_loc_offset_aimConstraint1.wum";
connectAttr "l_arm_makeNurbSphere3.os" "end_poserShape.cr";
connectAttr "end_poserOrient_aimConstraint1.crx" "end_poserOrient.rx";
connectAttr "end_poserOrient_aimConstraint1.cry" "end_poserOrient.ry";
connectAttr "end_poserOrient_aimConstraint1.crz" "end_poserOrient.rz";
connectAttr "end_poserOrient.pim" "end_poserOrient_aimConstraint1.cpim";
connectAttr "end_poserOrient.t" "end_poserOrient_aimConstraint1.ct";
connectAttr "end_poserOrient.rp" "end_poserOrient_aimConstraint1.crp";
connectAttr "end_poserOrient.rpt" "end_poserOrient_aimConstraint1.crt";
connectAttr "end_poserOrient.ro" "end_poserOrient_aimConstraint1.cro";
connectAttr "finger_3_4_poser.t" "end_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "finger_3_4_poser.rp" "end_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "finger_3_4_poser.rpt" "end_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "finger_3_4_poser.pm" "end_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "end_poserOrient_aimConstraint1.w0" "end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "mirror_condition.ocr" "end_initLoc.sx";
connectAttr "main_middle_direction_aimConstraint1.crx" "main_middle_direction.rx"
		;
connectAttr "main_middle_direction_aimConstraint1.cry" "main_middle_direction.ry"
		;
connectAttr "main_middle_direction_aimConstraint1.crz" "main_middle_direction.rz"
		;
connectAttr "main_middle_direction.pim" "main_middle_direction_aimConstraint1.cpim"
		;
connectAttr "main_middle_direction.t" "main_middle_direction_aimConstraint1.ct";
connectAttr "main_middle_direction.rp" "main_middle_direction_aimConstraint1.crp"
		;
connectAttr "main_middle_direction.rpt" "main_middle_direction_aimConstraint1.crt"
		;
connectAttr "main_middle_direction.ro" "main_middle_direction_aimConstraint1.cro"
		;
connectAttr "finger_4_4_poser.t" "main_middle_direction_aimConstraint1.tg[0].tt"
		;
connectAttr "finger_4_4_poser.rp" "main_middle_direction_aimConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_poser.rpt" "main_middle_direction_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_poser.pm" "main_middle_direction_aimConstraint1.tg[0].tpm"
		;
connectAttr "main_middle_direction_aimConstraint1.w0" "main_middle_direction_aimConstraint1.tg[0].tw"
		;
connectAttr "end_poser.wm" "main_middle_direction_aimConstraint1.wum";
connectAttr "main_end_direction_aimConstraint1.crx" "main_end_direction.rx";
connectAttr "main_end_direction_aimConstraint1.cry" "main_end_direction.ry";
connectAttr "main_end_direction_aimConstraint1.crz" "main_end_direction.rz";
connectAttr "main_end_direction.pim" "main_end_direction_aimConstraint1.cpim";
connectAttr "main_end_direction.t" "main_end_direction_aimConstraint1.ct";
connectAttr "main_end_direction.rp" "main_end_direction_aimConstraint1.crp";
connectAttr "main_end_direction.rpt" "main_end_direction_aimConstraint1.crt";
connectAttr "main_end_direction.ro" "main_end_direction_aimConstraint1.cro";
connectAttr "finger_1_4_poser.t" "main_end_direction_aimConstraint1.tg[0].tt";
connectAttr "finger_1_4_poser.rp" "main_end_direction_aimConstraint1.tg[0].trp";
connectAttr "finger_1_4_poser.rpt" "main_end_direction_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_1_4_poser.pm" "main_end_direction_aimConstraint1.tg[0].tpm";
connectAttr "main_end_direction_aimConstraint1.w0" "main_end_direction_aimConstraint1.tg[0].tw"
		;
connectAttr "end_poser.wm" "main_end_direction_aimConstraint1.wum";
connectAttr "start_poser.t" "control_initLoc.t";
connectAttr "l_arm_makeNurbSphere16.os" "finger_3_4_poserShape.cr";
connectAttr "l_arm_makeNurbSphere16.os" "finger_4_4_poserShape.cr";
connectAttr "l_arm_makeNurbSphere16.os" "finger_2_4_poserShape.cr";
connectAttr "l_arm_makeNurbSphere16.os" "finger_1_4_poserShape.cr";
connectAttr "finger_1_1_poser_aimConstraint1.crx" "finger_1_1_poser.rx";
connectAttr "finger_1_1_poser_aimConstraint1.cry" "finger_1_1_poser.ry";
connectAttr "finger_1_1_poser_aimConstraint1.crz" "finger_1_1_poser.rz";
connectAttr "l_arm_makeNurbSphere16.os" "finger_1_1_poserNurbsShape.cr";
connectAttr "finger_1_1_poser.pim" "finger_1_1_poser_aimConstraint1.cpim";
connectAttr "finger_1_1_poser.t" "finger_1_1_poser_aimConstraint1.ct";
connectAttr "finger_1_1_poser.rp" "finger_1_1_poser_aimConstraint1.crp";
connectAttr "finger_1_1_poser.rpt" "finger_1_1_poser_aimConstraint1.crt";
connectAttr "finger_1_1_poser.ro" "finger_1_1_poser_aimConstraint1.cro";
connectAttr "finger_1_2_poser.t" "finger_1_1_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_1_2_poser.rp" "finger_1_1_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_1_2_poser.rpt" "finger_1_1_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_1_2_poser.pm" "finger_1_1_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_1_poser_aimConstraint1.w0" "finger_1_1_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_1_poser_aimConstraint1.wum";
connectAttr "finger_2_1_poser_aimConstraint1.crx" "finger_2_1_poser.rx";
connectAttr "finger_2_1_poser_aimConstraint1.cry" "finger_2_1_poser.ry";
connectAttr "finger_2_1_poser_aimConstraint1.crz" "finger_2_1_poser.rz";
connectAttr "l_arm_makeNurbSphere16.os" "finger_2_1_poserNurbsShape.cr";
connectAttr "finger_2_1_poser.pim" "finger_2_1_poser_aimConstraint1.cpim";
connectAttr "finger_2_1_poser.t" "finger_2_1_poser_aimConstraint1.ct";
connectAttr "finger_2_1_poser.rp" "finger_2_1_poser_aimConstraint1.crp";
connectAttr "finger_2_1_poser.rpt" "finger_2_1_poser_aimConstraint1.crt";
connectAttr "finger_2_1_poser.ro" "finger_2_1_poser_aimConstraint1.cro";
connectAttr "finger_2_2_poser.t" "finger_2_1_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_2_2_poser.rp" "finger_2_1_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_2_2_poser.rpt" "finger_2_1_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_2_2_poser.pm" "finger_2_1_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_1_poser_aimConstraint1.w0" "finger_2_1_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_1_poser_aimConstraint1.wum";
connectAttr "finger_3_1_poser_aimConstraint1.crx" "finger_3_1_poser.rx";
connectAttr "finger_3_1_poser_aimConstraint1.cry" "finger_3_1_poser.ry";
connectAttr "finger_3_1_poser_aimConstraint1.crz" "finger_3_1_poser.rz";
connectAttr "l_arm_makeNurbSphere16.os" "finger_3_1_poserNurbsShape.cr";
connectAttr "finger_3_1_poser.pim" "finger_3_1_poser_aimConstraint1.cpim";
connectAttr "finger_3_1_poser.t" "finger_3_1_poser_aimConstraint1.ct";
connectAttr "finger_3_1_poser.rp" "finger_3_1_poser_aimConstraint1.crp";
connectAttr "finger_3_1_poser.rpt" "finger_3_1_poser_aimConstraint1.crt";
connectAttr "finger_3_1_poser.ro" "finger_3_1_poser_aimConstraint1.cro";
connectAttr "finger_3_2_poser.t" "finger_3_1_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_3_2_poser.rp" "finger_3_1_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_3_2_poser.rpt" "finger_3_1_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_3_2_poser.pm" "finger_3_1_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_1_poser_aimConstraint1.w0" "finger_3_1_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_1_poser_aimConstraint1.wum";
connectAttr "finger_4_1_poser_aimConstraint1.crx" "finger_4_1_poser.rx";
connectAttr "finger_4_1_poser_aimConstraint1.cry" "finger_4_1_poser.ry";
connectAttr "finger_4_1_poser_aimConstraint1.crz" "finger_4_1_poser.rz";
connectAttr "l_arm_makeNurbSphere16.os" "finger_4_1_poserNurbsShape.cr";
connectAttr "finger_4_1_poser.pim" "finger_4_1_poser_aimConstraint1.cpim";
connectAttr "finger_4_1_poser.t" "finger_4_1_poser_aimConstraint1.ct";
connectAttr "finger_4_1_poser.rp" "finger_4_1_poser_aimConstraint1.crp";
connectAttr "finger_4_1_poser.rpt" "finger_4_1_poser_aimConstraint1.crt";
connectAttr "finger_4_1_poser.ro" "finger_4_1_poser_aimConstraint1.cro";
connectAttr "finger_4_2_poser.t" "finger_4_1_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_4_2_poser.rp" "finger_4_1_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_4_2_poser.rpt" "finger_4_1_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_4_2_poser.pm" "finger_4_1_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_1_poser_aimConstraint1.w0" "finger_4_1_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_1_poser_aimConstraint1.wum";
connectAttr "finger_4_3_poser_group_pointConstraint1.ctx" "finger_4_3_poser_group.tx"
		;
connectAttr "finger_4_3_poser_group_pointConstraint1.cty" "finger_4_3_poser_group.ty"
		;
connectAttr "finger_4_3_poser_group_pointConstraint1.ctz" "finger_4_3_poser_group.tz"
		;
connectAttr "finger_4_3_poser_aimConstraint1.crx" "finger_4_3_poser.rx";
connectAttr "finger_4_3_poser_aimConstraint1.cry" "finger_4_3_poser.ry";
connectAttr "finger_4_3_poser_aimConstraint1.crz" "finger_4_3_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_4_3_poserNurbsShape.cr";
connectAttr "finger_4_3_poser.pim" "finger_4_3_poser_aimConstraint1.cpim";
connectAttr "finger_4_3_poser.t" "finger_4_3_poser_aimConstraint1.ct";
connectAttr "finger_4_3_poser.rp" "finger_4_3_poser_aimConstraint1.crp";
connectAttr "finger_4_3_poser.rpt" "finger_4_3_poser_aimConstraint1.crt";
connectAttr "finger_4_3_poser.ro" "finger_4_3_poser_aimConstraint1.cro";
connectAttr "finger_4_4_poser.t" "finger_4_3_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_4_4_poser.rp" "finger_4_3_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_4_4_poser.rpt" "finger_4_3_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_4_4_poser.pm" "finger_4_3_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_3_poser_aimConstraint1.w0" "finger_4_3_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_3_poser_aimConstraint1.wum";
connectAttr "finger_4_3_poser_group.pim" "finger_4_3_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_4_3_poser_group.rp" "finger_4_3_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_4_3_poser_group.rpt" "finger_4_3_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_4_4_poser.t" "finger_4_3_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_4_poser.rp" "finger_4_3_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_poser.rpt" "finger_4_3_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_poser.pm" "finger_4_3_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_3_poser_group_pointConstraint1.w0" "finger_4_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_1_poser.t" "finger_4_3_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_4_1_poser.rp" "finger_4_3_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_4_1_poser.rpt" "finger_4_3_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_4_1_poser.pm" "finger_4_3_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_4_3_poser_group_pointConstraint1.w1" "finger_4_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_4_2_poser_group_pointConstraint1.ctx" "finger_4_2_poser_group.tx"
		;
connectAttr "finger_4_2_poser_group_pointConstraint1.cty" "finger_4_2_poser_group.ty"
		;
connectAttr "finger_4_2_poser_group_pointConstraint1.ctz" "finger_4_2_poser_group.tz"
		;
connectAttr "finger_4_2_poser_aimConstraint1.crx" "finger_4_2_poser.rx";
connectAttr "finger_4_2_poser_aimConstraint1.cry" "finger_4_2_poser.ry";
connectAttr "finger_4_2_poser_aimConstraint1.crz" "finger_4_2_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_4_2_poserNurbsShape.cr";
connectAttr "finger_4_2_poser.pim" "finger_4_2_poser_aimConstraint1.cpim";
connectAttr "finger_4_2_poser.t" "finger_4_2_poser_aimConstraint1.ct";
connectAttr "finger_4_2_poser.rp" "finger_4_2_poser_aimConstraint1.crp";
connectAttr "finger_4_2_poser.rpt" "finger_4_2_poser_aimConstraint1.crt";
connectAttr "finger_4_2_poser.ro" "finger_4_2_poser_aimConstraint1.cro";
connectAttr "finger_4_3_poser.t" "finger_4_2_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_4_3_poser.rp" "finger_4_2_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_4_3_poser.rpt" "finger_4_2_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_4_3_poser.pm" "finger_4_2_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_2_poser_aimConstraint1.w0" "finger_4_2_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_2_poser_aimConstraint1.wum";
connectAttr "finger_4_2_poser_group.pim" "finger_4_2_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_4_2_poser_group.rp" "finger_4_2_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_4_2_poser_group.rpt" "finger_4_2_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_4_4_poser.t" "finger_4_2_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_4_poser.rp" "finger_4_2_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_poser.rpt" "finger_4_2_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_poser.pm" "finger_4_2_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_2_poser_group_pointConstraint1.w0" "finger_4_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_1_poser.t" "finger_4_2_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_4_1_poser.rp" "finger_4_2_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_4_1_poser.rpt" "finger_4_2_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_4_1_poser.pm" "finger_4_2_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_4_2_poser_group_pointConstraint1.w1" "finger_4_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_3_2_poser_group_pointConstraint1.ctx" "finger_3_2_poser_group.tx"
		;
connectAttr "finger_3_2_poser_group_pointConstraint1.cty" "finger_3_2_poser_group.ty"
		;
connectAttr "finger_3_2_poser_group_pointConstraint1.ctz" "finger_3_2_poser_group.tz"
		;
connectAttr "finger_3_2_poser_aimConstraint1.crx" "finger_3_2_poser.rx";
connectAttr "finger_3_2_poser_aimConstraint1.cry" "finger_3_2_poser.ry";
connectAttr "finger_3_2_poser_aimConstraint1.crz" "finger_3_2_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_3_2_poserNurbsShape.cr";
connectAttr "finger_3_2_poser.pim" "finger_3_2_poser_aimConstraint1.cpim";
connectAttr "finger_3_2_poser.t" "finger_3_2_poser_aimConstraint1.ct";
connectAttr "finger_3_2_poser.rp" "finger_3_2_poser_aimConstraint1.crp";
connectAttr "finger_3_2_poser.rpt" "finger_3_2_poser_aimConstraint1.crt";
connectAttr "finger_3_2_poser.ro" "finger_3_2_poser_aimConstraint1.cro";
connectAttr "finger_3_3_poser.t" "finger_3_2_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_3_3_poser.rp" "finger_3_2_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_3_3_poser.rpt" "finger_3_2_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_3_3_poser.pm" "finger_3_2_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_2_poser_aimConstraint1.w0" "finger_3_2_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_2_poser_aimConstraint1.wum";
connectAttr "finger_3_2_poser_group.pim" "finger_3_2_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_3_2_poser_group.rp" "finger_3_2_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_3_2_poser_group.rpt" "finger_3_2_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_3_4_poser.t" "finger_3_2_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_4_poser.rp" "finger_3_2_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_4_poser.rpt" "finger_3_2_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_4_poser.pm" "finger_3_2_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_2_poser_group_pointConstraint1.w0" "finger_3_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_1_poser.t" "finger_3_2_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_3_1_poser.rp" "finger_3_2_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_3_1_poser.rpt" "finger_3_2_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_3_1_poser.pm" "finger_3_2_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_3_2_poser_group_pointConstraint1.w1" "finger_3_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_3_3_poser_group_pointConstraint1.ctx" "finger_3_3_poser_group.tx"
		;
connectAttr "finger_3_3_poser_group_pointConstraint1.cty" "finger_3_3_poser_group.ty"
		;
connectAttr "finger_3_3_poser_group_pointConstraint1.ctz" "finger_3_3_poser_group.tz"
		;
connectAttr "finger_3_3_poser_aimConstraint1.crx" "finger_3_3_poser.rx";
connectAttr "finger_3_3_poser_aimConstraint1.cry" "finger_3_3_poser.ry";
connectAttr "finger_3_3_poser_aimConstraint1.crz" "finger_3_3_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_3_3_poserNurbsShape.cr";
connectAttr "finger_3_3_poser.pim" "finger_3_3_poser_aimConstraint1.cpim";
connectAttr "finger_3_3_poser.t" "finger_3_3_poser_aimConstraint1.ct";
connectAttr "finger_3_3_poser.rp" "finger_3_3_poser_aimConstraint1.crp";
connectAttr "finger_3_3_poser.rpt" "finger_3_3_poser_aimConstraint1.crt";
connectAttr "finger_3_3_poser.ro" "finger_3_3_poser_aimConstraint1.cro";
connectAttr "finger_3_4_poser.t" "finger_3_3_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_3_4_poser.rp" "finger_3_3_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_3_4_poser.rpt" "finger_3_3_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_3_4_poser.pm" "finger_3_3_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_3_poser_aimConstraint1.w0" "finger_3_3_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_3_poser_aimConstraint1.wum";
connectAttr "finger_3_3_poser_group.pim" "finger_3_3_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_3_3_poser_group.rp" "finger_3_3_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_3_3_poser_group.rpt" "finger_3_3_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_3_4_poser.t" "finger_3_3_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_4_poser.rp" "finger_3_3_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_4_poser.rpt" "finger_3_3_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_4_poser.pm" "finger_3_3_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_3_poser_group_pointConstraint1.w0" "finger_3_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_1_poser.t" "finger_3_3_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_3_1_poser.rp" "finger_3_3_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_3_1_poser.rpt" "finger_3_3_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_3_1_poser.pm" "finger_3_3_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_3_3_poser_group_pointConstraint1.w1" "finger_3_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_2_3_poser_group_pointConstraint1.ctx" "finger_2_3_poser_group.tx"
		;
connectAttr "finger_2_3_poser_group_pointConstraint1.cty" "finger_2_3_poser_group.ty"
		;
connectAttr "finger_2_3_poser_group_pointConstraint1.ctz" "finger_2_3_poser_group.tz"
		;
connectAttr "finger_2_3_poser_aimConstraint1.crx" "finger_2_3_poser.rx";
connectAttr "finger_2_3_poser_aimConstraint1.cry" "finger_2_3_poser.ry";
connectAttr "finger_2_3_poser_aimConstraint1.crz" "finger_2_3_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_2_3_poserNurbsShape.cr";
connectAttr "finger_2_3_poser.pim" "finger_2_3_poser_aimConstraint1.cpim";
connectAttr "finger_2_3_poser.t" "finger_2_3_poser_aimConstraint1.ct";
connectAttr "finger_2_3_poser.rp" "finger_2_3_poser_aimConstraint1.crp";
connectAttr "finger_2_3_poser.rpt" "finger_2_3_poser_aimConstraint1.crt";
connectAttr "finger_2_3_poser.ro" "finger_2_3_poser_aimConstraint1.cro";
connectAttr "finger_2_4_poser.t" "finger_2_3_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_2_4_poser.rp" "finger_2_3_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_2_4_poser.rpt" "finger_2_3_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_2_4_poser.pm" "finger_2_3_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_3_poser_aimConstraint1.w0" "finger_2_3_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_3_poser_aimConstraint1.wum";
connectAttr "finger_2_3_poser_group.pim" "finger_2_3_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_2_3_poser_group.rp" "finger_2_3_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_2_3_poser_group.rpt" "finger_2_3_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_2_4_poser.t" "finger_2_3_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_4_poser.rp" "finger_2_3_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_4_poser.rpt" "finger_2_3_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_poser.pm" "finger_2_3_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_3_poser_group_pointConstraint1.w0" "finger_2_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_1_poser.t" "finger_2_3_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_2_1_poser.rp" "finger_2_3_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_2_1_poser.rpt" "finger_2_3_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_2_1_poser.pm" "finger_2_3_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_2_3_poser_group_pointConstraint1.w1" "finger_2_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_2_2_poser_group_pointConstraint1.ctx" "finger_2_2_poser_group.tx"
		;
connectAttr "finger_2_2_poser_group_pointConstraint1.cty" "finger_2_2_poser_group.ty"
		;
connectAttr "finger_2_2_poser_group_pointConstraint1.ctz" "finger_2_2_poser_group.tz"
		;
connectAttr "finger_2_2_poser_aimConstraint1.crx" "finger_2_2_poser.rx";
connectAttr "finger_2_2_poser_aimConstraint1.cry" "finger_2_2_poser.ry";
connectAttr "finger_2_2_poser_aimConstraint1.crz" "finger_2_2_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_2_2_poserNurbsShape.cr";
connectAttr "finger_2_2_poser.pim" "finger_2_2_poser_aimConstraint1.cpim";
connectAttr "finger_2_2_poser.t" "finger_2_2_poser_aimConstraint1.ct";
connectAttr "finger_2_2_poser.rp" "finger_2_2_poser_aimConstraint1.crp";
connectAttr "finger_2_2_poser.rpt" "finger_2_2_poser_aimConstraint1.crt";
connectAttr "finger_2_2_poser.ro" "finger_2_2_poser_aimConstraint1.cro";
connectAttr "finger_2_3_poser.t" "finger_2_2_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_2_3_poser.rp" "finger_2_2_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_2_3_poser.rpt" "finger_2_2_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_2_3_poser.pm" "finger_2_2_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_2_poser_aimConstraint1.w0" "finger_2_2_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_2_poser_aimConstraint1.wum";
connectAttr "finger_2_2_poser_group.pim" "finger_2_2_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_2_2_poser_group.rp" "finger_2_2_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_2_2_poser_group.rpt" "finger_2_2_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_2_4_poser.t" "finger_2_2_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_4_poser.rp" "finger_2_2_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_4_poser.rpt" "finger_2_2_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_poser.pm" "finger_2_2_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_2_poser_group_pointConstraint1.w0" "finger_2_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_1_poser.t" "finger_2_2_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_2_1_poser.rp" "finger_2_2_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_2_1_poser.rpt" "finger_2_2_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_2_1_poser.pm" "finger_2_2_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_2_2_poser_group_pointConstraint1.w1" "finger_2_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_1_2_poser_group_pointConstraint1.ctx" "finger_1_2_poser_group.tx"
		;
connectAttr "finger_1_2_poser_group_pointConstraint1.cty" "finger_1_2_poser_group.ty"
		;
connectAttr "finger_1_2_poser_group_pointConstraint1.ctz" "finger_1_2_poser_group.tz"
		;
connectAttr "finger_1_2_poser_aimConstraint1.crx" "finger_1_2_poser.rx";
connectAttr "finger_1_2_poser_aimConstraint1.cry" "finger_1_2_poser.ry";
connectAttr "finger_1_2_poser_aimConstraint1.crz" "finger_1_2_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_1_2_poserNurbsShape.cr";
connectAttr "finger_1_2_poser.pim" "finger_1_2_poser_aimConstraint1.cpim";
connectAttr "finger_1_2_poser.t" "finger_1_2_poser_aimConstraint1.ct";
connectAttr "finger_1_2_poser.rp" "finger_1_2_poser_aimConstraint1.crp";
connectAttr "finger_1_2_poser.rpt" "finger_1_2_poser_aimConstraint1.crt";
connectAttr "finger_1_2_poser.ro" "finger_1_2_poser_aimConstraint1.cro";
connectAttr "finger_1_3_poser.t" "finger_1_2_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_1_3_poser.rp" "finger_1_2_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_1_3_poser.rpt" "finger_1_2_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_1_3_poser.pm" "finger_1_2_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_2_poser_aimConstraint1.w0" "finger_1_2_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_2_poser_aimConstraint1.wum";
connectAttr "finger_1_2_poser_group.pim" "finger_1_2_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_1_2_poser_group.rp" "finger_1_2_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_1_2_poser_group.rpt" "finger_1_2_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_1_1_poser.t" "finger_1_2_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_1_poser.rp" "finger_1_2_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_1_poser.rpt" "finger_1_2_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_1_poser.pm" "finger_1_2_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_2_poser_group_pointConstraint1.w0" "finger_1_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_4_poser.t" "finger_1_2_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_1_4_poser.rp" "finger_1_2_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_1_4_poser.rpt" "finger_1_2_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_1_4_poser.pm" "finger_1_2_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_1_2_poser_group_pointConstraint1.w1" "finger_1_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "finger_1_3_poser_group_pointConstraint1.ctx" "finger_1_3_poser_group.tx"
		;
connectAttr "finger_1_3_poser_group_pointConstraint1.cty" "finger_1_3_poser_group.ty"
		;
connectAttr "finger_1_3_poser_group_pointConstraint1.ctz" "finger_1_3_poser_group.tz"
		;
connectAttr "finger_1_3_poser_aimConstraint1.crx" "finger_1_3_poser.rx";
connectAttr "finger_1_3_poser_aimConstraint1.cry" "finger_1_3_poser.ry";
connectAttr "finger_1_3_poser_aimConstraint1.crz" "finger_1_3_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "finger_1_3_poserNurbsShape.cr";
connectAttr "finger_1_3_poser.pim" "finger_1_3_poser_aimConstraint1.cpim";
connectAttr "finger_1_3_poser.t" "finger_1_3_poser_aimConstraint1.ct";
connectAttr "finger_1_3_poser.rp" "finger_1_3_poser_aimConstraint1.crp";
connectAttr "finger_1_3_poser.rpt" "finger_1_3_poser_aimConstraint1.crt";
connectAttr "finger_1_3_poser.ro" "finger_1_3_poser_aimConstraint1.cro";
connectAttr "finger_1_4_poser.t" "finger_1_3_poser_aimConstraint1.tg[0].tt";
connectAttr "finger_1_4_poser.rp" "finger_1_3_poser_aimConstraint1.tg[0].trp";
connectAttr "finger_1_4_poser.rpt" "finger_1_3_poser_aimConstraint1.tg[0].trt";
connectAttr "finger_1_4_poser.pm" "finger_1_3_poser_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_3_poser_aimConstraint1.w0" "finger_1_3_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_3_poser_aimConstraint1.wum";
connectAttr "finger_1_3_poser_group.pim" "finger_1_3_poser_group_pointConstraint1.cpim"
		;
connectAttr "finger_1_3_poser_group.rp" "finger_1_3_poser_group_pointConstraint1.crp"
		;
connectAttr "finger_1_3_poser_group.rpt" "finger_1_3_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_1_1_poser.t" "finger_1_3_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_1_poser.rp" "finger_1_3_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_1_poser.rpt" "finger_1_3_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_1_poser.pm" "finger_1_3_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_3_poser_group_pointConstraint1.w0" "finger_1_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_4_poser.t" "finger_1_3_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_1_4_poser.rp" "finger_1_3_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_1_4_poser.rpt" "finger_1_3_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_1_4_poser.pm" "finger_1_3_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "finger_1_3_poser_group_pointConstraint1.w1" "finger_1_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "l_arm_makeNurbSphere16.os" "skin_6_poserNurbsShape.cr";
connectAttr "l_arm_makeNurbSphere16.os" "skin_4_poserNurbsShape.cr";
connectAttr "l_arm_makeNurbSphere16.os" "skin_5_poserNurbsShape.cr";
connectAttr "skin_1_poser_aimConstraint1.crx" "skin_1_poser.rx";
connectAttr "skin_1_poser_aimConstraint1.cry" "skin_1_poser.ry";
connectAttr "skin_1_poser_aimConstraint1.crz" "skin_1_poser.rz";
connectAttr "l_arm_makeNurbSphere16.os" "skin_1_poserNurbsShape.cr";
connectAttr "skin_1_poser.pim" "skin_1_poser_aimConstraint1.cpim";
connectAttr "skin_1_poser.t" "skin_1_poser_aimConstraint1.ct";
connectAttr "skin_1_poser.rp" "skin_1_poser_aimConstraint1.crp";
connectAttr "skin_1_poser.rpt" "skin_1_poser_aimConstraint1.crt";
connectAttr "skin_1_poser.ro" "skin_1_poser_aimConstraint1.cro";
connectAttr "skin_2_poser.t" "skin_1_poser_aimConstraint1.tg[0].tt";
connectAttr "skin_2_poser.rp" "skin_1_poser_aimConstraint1.tg[0].trp";
connectAttr "skin_2_poser.rpt" "skin_1_poser_aimConstraint1.tg[0].trt";
connectAttr "skin_2_poser.pm" "skin_1_poser_aimConstraint1.tg[0].tpm";
connectAttr "skin_1_poser_aimConstraint1.w0" "skin_1_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "skin_1_poser_aimConstraint1.wum";
connectAttr "edge_4_poser_group_pointConstraint1.ctx" "skin_8_poser_group.tx";
connectAttr "edge_4_poser_group_pointConstraint1.cty" "skin_8_poser_group.ty";
connectAttr "edge_4_poser_group_pointConstraint1.ctz" "skin_8_poser_group.tz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_8_poserNurbsShape.cr";
connectAttr "skin_8_poser_group.pim" "edge_4_poser_group_pointConstraint1.cpim";
connectAttr "skin_8_poser_group.rp" "edge_4_poser_group_pointConstraint1.crp";
connectAttr "skin_8_poser_group.rpt" "edge_4_poser_group_pointConstraint1.crt";
connectAttr "skin_6_poser.t" "edge_4_poser_group_pointConstraint1.tg[0].tt";
connectAttr "skin_6_poser.rp" "edge_4_poser_group_pointConstraint1.tg[0].trp";
connectAttr "skin_6_poser.rpt" "edge_4_poser_group_pointConstraint1.tg[0].trt";
connectAttr "skin_6_poser.pm" "edge_4_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "edge_4_poser_group_pointConstraint1.w0" "edge_4_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_4_poser.t" "edge_4_poser_group_pointConstraint1.tg[1].tt";
connectAttr "finger_4_4_poser.rp" "edge_4_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_4_4_poser.rpt" "edge_4_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_4_4_poser.pm" "edge_4_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "edge_4_poser_group_pointConstraint1.w1" "edge_4_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "edge_2_poserGroup_pointConstraint1.ctx" "skin_7_poser_group.tx";
connectAttr "edge_2_poserGroup_pointConstraint1.cty" "skin_7_poser_group.ty";
connectAttr "edge_2_poserGroup_pointConstraint1.ctz" "skin_7_poser_group.tz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_7_poserNurbsShape.cr";
connectAttr "skin_7_poser_group.pim" "edge_2_poserGroup_pointConstraint1.cpim";
connectAttr "skin_7_poser_group.rp" "edge_2_poserGroup_pointConstraint1.crp";
connectAttr "skin_7_poser_group.rpt" "edge_2_poserGroup_pointConstraint1.crt";
connectAttr "skin_4_poser.t" "edge_2_poserGroup_pointConstraint1.tg[0].tt";
connectAttr "skin_4_poser.rp" "edge_2_poserGroup_pointConstraint1.tg[0].trp";
connectAttr "skin_4_poser.rpt" "edge_2_poserGroup_pointConstraint1.tg[0].trt";
connectAttr "skin_4_poser.pm" "edge_2_poserGroup_pointConstraint1.tg[0].tpm";
connectAttr "edge_2_poserGroup_pointConstraint1.w0" "edge_2_poserGroup_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_6_poser.t" "edge_2_poserGroup_pointConstraint1.tg[1].tt";
connectAttr "skin_6_poser.rp" "edge_2_poserGroup_pointConstraint1.tg[1].trp";
connectAttr "skin_6_poser.rpt" "edge_2_poserGroup_pointConstraint1.tg[1].trt";
connectAttr "skin_6_poser.pm" "edge_2_poserGroup_pointConstraint1.tg[1].tpm";
connectAttr "edge_2_poserGroup_pointConstraint1.w1" "edge_2_poserGroup_pointConstraint1.tg[1].tw"
		;
connectAttr "edge_6_poserGroup_pointConstraint1.ctx" "skin_9_poser_group.tx";
connectAttr "edge_6_poserGroup_pointConstraint1.cty" "skin_9_poser_group.ty";
connectAttr "edge_6_poserGroup_pointConstraint1.ctz" "skin_9_poser_group.tz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_9_poserNurbsShape.cr";
connectAttr "skin_9_poser_group.pim" "edge_6_poserGroup_pointConstraint1.cpim";
connectAttr "skin_9_poser_group.rp" "edge_6_poserGroup_pointConstraint1.crp";
connectAttr "skin_9_poser_group.rpt" "edge_6_poserGroup_pointConstraint1.crt";
connectAttr "finger_4_4_poser.t" "edge_6_poserGroup_pointConstraint1.tg[0].tt";
connectAttr "finger_4_4_poser.rp" "edge_6_poserGroup_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_poser.rpt" "edge_6_poserGroup_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_poser.pm" "edge_6_poserGroup_pointConstraint1.tg[0].tpm"
		;
connectAttr "edge_6_poserGroup_pointConstraint1.w0" "edge_6_poserGroup_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_4_poser.t" "edge_6_poserGroup_pointConstraint1.tg[1].tt";
connectAttr "finger_3_4_poser.rp" "edge_6_poserGroup_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_3_4_poser.rpt" "edge_6_poserGroup_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_3_4_poser.pm" "edge_6_poserGroup_pointConstraint1.tg[1].tpm"
		;
connectAttr "edge_6_poserGroup_pointConstraint1.w1" "edge_6_poserGroup_pointConstraint1.tg[1].tw"
		;
connectAttr "skin_10_poser_group_pointConstraint1.ctx" "skin_10_poser_group.tx";
connectAttr "skin_10_poser_group_pointConstraint1.cty" "skin_10_poser_group.ty";
connectAttr "skin_10_poser_group_pointConstraint1.ctz" "skin_10_poser_group.tz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_10_poserNurbsShape.cr";
connectAttr "skin_10_poser_group.pim" "skin_10_poser_group_pointConstraint1.cpim"
		;
connectAttr "skin_10_poser_group.rp" "skin_10_poser_group_pointConstraint1.crp";
connectAttr "skin_10_poser_group.rpt" "skin_10_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_3_4_poser.t" "skin_10_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_4_poser.rp" "skin_10_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_4_poser.rpt" "skin_10_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_4_poser.pm" "skin_10_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "skin_10_poser_group_pointConstraint1.w0" "skin_10_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_4_poser.t" "skin_10_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_2_4_poser.rp" "skin_10_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_2_4_poser.rpt" "skin_10_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_2_4_poser.pm" "skin_10_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "skin_10_poser_group_pointConstraint1.w1" "skin_10_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "skin_11_poser_group_pointConstraint1.ctx" "skin_11_poser_group.tx";
connectAttr "skin_11_poser_group_pointConstraint1.cty" "skin_11_poser_group.ty";
connectAttr "skin_11_poser_group_pointConstraint1.ctz" "skin_11_poser_group.tz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_11_poserNurbsShape.cr";
connectAttr "skin_11_poser_group.pim" "skin_11_poser_group_pointConstraint1.cpim"
		;
connectAttr "skin_11_poser_group.rp" "skin_11_poser_group_pointConstraint1.crp";
connectAttr "skin_11_poser_group.rpt" "skin_11_poser_group_pointConstraint1.crt"
		;
connectAttr "finger_2_4_poser.t" "skin_11_poser_group_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_4_poser.rp" "skin_11_poser_group_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_4_poser.rpt" "skin_11_poser_group_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_poser.pm" "skin_11_poser_group_pointConstraint1.tg[0].tpm"
		;
connectAttr "skin_11_poser_group_pointConstraint1.w0" "skin_11_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_4_poser.t" "skin_11_poser_group_pointConstraint1.tg[1].tt"
		;
connectAttr "finger_1_4_poser.rp" "skin_11_poser_group_pointConstraint1.tg[1].trp"
		;
connectAttr "finger_1_4_poser.rpt" "skin_11_poser_group_pointConstraint1.tg[1].trt"
		;
connectAttr "finger_1_4_poser.pm" "skin_11_poser_group_pointConstraint1.tg[1].tpm"
		;
connectAttr "skin_11_poser_group_pointConstraint1.w1" "skin_11_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "skin_2_poser_group_pointConstraint1.ctx" "skin_2_poser_group.tx";
connectAttr "skin_2_poser_group_pointConstraint1.cty" "skin_2_poser_group.ty";
connectAttr "skin_2_poser_group_pointConstraint1.ctz" "skin_2_poser_group.tz";
connectAttr "skin_2_poser_aimConstraint1.crx" "skin_2_poser.rx";
connectAttr "skin_2_poser_aimConstraint1.cry" "skin_2_poser.ry";
connectAttr "skin_2_poser_aimConstraint1.crz" "skin_2_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_2_poserNurbsShape.cr";
connectAttr "skin_2_poser.pim" "skin_2_poser_aimConstraint1.cpim";
connectAttr "skin_2_poser.t" "skin_2_poser_aimConstraint1.ct";
connectAttr "skin_2_poser.rp" "skin_2_poser_aimConstraint1.crp";
connectAttr "skin_2_poser.rpt" "skin_2_poser_aimConstraint1.crt";
connectAttr "skin_2_poser.ro" "skin_2_poser_aimConstraint1.cro";
connectAttr "skin_3_poser.t" "skin_2_poser_aimConstraint1.tg[0].tt";
connectAttr "skin_3_poser.rp" "skin_2_poser_aimConstraint1.tg[0].trp";
connectAttr "skin_3_poser.rpt" "skin_2_poser_aimConstraint1.tg[0].trt";
connectAttr "skin_3_poser.pm" "skin_2_poser_aimConstraint1.tg[0].tpm";
connectAttr "skin_2_poser_aimConstraint1.w0" "skin_2_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "skin_2_poser_aimConstraint1.wum";
connectAttr "skin_2_poser_group.pim" "skin_2_poser_group_pointConstraint1.cpim";
connectAttr "skin_2_poser_group.rp" "skin_2_poser_group_pointConstraint1.crp";
connectAttr "skin_2_poser_group.rpt" "skin_2_poser_group_pointConstraint1.crt";
connectAttr "skin_4_poser.t" "skin_2_poser_group_pointConstraint1.tg[0].tt";
connectAttr "skin_4_poser.rp" "skin_2_poser_group_pointConstraint1.tg[0].trp";
connectAttr "skin_4_poser.rpt" "skin_2_poser_group_pointConstraint1.tg[0].trt";
connectAttr "skin_4_poser.pm" "skin_2_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "skin_2_poser_group_pointConstraint1.w0" "skin_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_1_poser.t" "skin_2_poser_group_pointConstraint1.tg[1].tt";
connectAttr "skin_1_poser.rp" "skin_2_poser_group_pointConstraint1.tg[1].trp";
connectAttr "skin_1_poser.rpt" "skin_2_poser_group_pointConstraint1.tg[1].trt";
connectAttr "skin_1_poser.pm" "skin_2_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "skin_2_poser_group_pointConstraint1.w1" "skin_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "skin_3_poser_group_pointConstraint1.ctx" "skin_3_poser_group.tx";
connectAttr "skin_3_poser_group_pointConstraint1.cty" "skin_3_poser_group.ty";
connectAttr "skin_3_poser_group_pointConstraint1.ctz" "skin_3_poser_group.tz";
connectAttr "skin_3_poser_aimConstraint1.crx" "skin_3_poser.rx";
connectAttr "skin_3_poser_aimConstraint1.cry" "skin_3_poser.ry";
connectAttr "skin_3_poser_aimConstraint1.crz" "skin_3_poser.rz";
connectAttr "l_arm_makeNurbSphere15.os" "skin_3_poserNurbsShape.cr";
connectAttr "skin_3_poser.pim" "skin_3_poser_aimConstraint1.cpim";
connectAttr "skin_3_poser.t" "skin_3_poser_aimConstraint1.ct";
connectAttr "skin_3_poser.rp" "skin_3_poser_aimConstraint1.crp";
connectAttr "skin_3_poser.rpt" "skin_3_poser_aimConstraint1.crt";
connectAttr "skin_3_poser.ro" "skin_3_poser_aimConstraint1.cro";
connectAttr "skin_4_poser.t" "skin_3_poser_aimConstraint1.tg[0].tt";
connectAttr "skin_4_poser.rp" "skin_3_poser_aimConstraint1.tg[0].trp";
connectAttr "skin_4_poser.rpt" "skin_3_poser_aimConstraint1.tg[0].trt";
connectAttr "skin_4_poser.pm" "skin_3_poser_aimConstraint1.tg[0].tpm";
connectAttr "skin_3_poser_aimConstraint1.w0" "skin_3_poser_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "skin_3_poser_aimConstraint1.wum";
connectAttr "skin_3_poser_group.pim" "skin_3_poser_group_pointConstraint1.cpim";
connectAttr "skin_3_poser_group.rp" "skin_3_poser_group_pointConstraint1.crp";
connectAttr "skin_3_poser_group.rpt" "skin_3_poser_group_pointConstraint1.crt";
connectAttr "skin_4_poser.t" "skin_3_poser_group_pointConstraint1.tg[0].tt";
connectAttr "skin_4_poser.rp" "skin_3_poser_group_pointConstraint1.tg[0].trp";
connectAttr "skin_4_poser.rpt" "skin_3_poser_group_pointConstraint1.tg[0].trt";
connectAttr "skin_4_poser.pm" "skin_3_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "skin_3_poser_group_pointConstraint1.w0" "skin_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "skin_1_poser.t" "skin_3_poser_group_pointConstraint1.tg[1].tt";
connectAttr "skin_1_poser.rp" "skin_3_poser_group_pointConstraint1.tg[1].trp";
connectAttr "skin_1_poser.rpt" "skin_3_poser_group_pointConstraint1.tg[1].trt";
connectAttr "skin_1_poser.pm" "skin_3_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "skin_3_poser_group_pointConstraint1.w1" "skin_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "l_arm_size_multiplyDivide.oy" "mainPoser_clusterHandle.sx";
connectAttr "l_arm_size_multiplyDivide.oy" "mainPoser_clusterHandle.sy";
connectAttr "l_arm_size_multiplyDivide.oy" "mainPoser_clusterHandle.sz";
connectAttr "condition2.ocr" "posers_sweep.v";
connectAttr "l_arm_sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "root_initLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "start_initLocShape.wp" "posers_curveShape.cp[1]";
connectAttr "middle_initLocShape.wp" "posers_curveShape.cp[2]";
connectAttr "end_initLocShape.wp" "posers_curveShape.cp[3]";
connectAttr "l_arm_decomposeMatrix31.otx" "ik_connector_main.tx";
connectAttr "l_arm_decomposeMatrix31.oty" "ik_connector_main.ty";
connectAttr "l_arm_decomposeMatrix31.otz" "ik_connector_main.tz";
connectAttr "l_arm_decomposeMatrix31.orx" "ik_connector_main.rx";
connectAttr "l_arm_decomposeMatrix31.ory" "ik_connector_main.ry";
connectAttr "l_arm_decomposeMatrix31.orz" "ik_connector_main.rz";
connectAttr "l_arm_decomposeMatrix31.osx" "ik_connector_main.sx";
connectAttr "l_arm_decomposeMatrix31.osy" "ik_connector_main.sy";
connectAttr "l_arm_decomposeMatrix31.osz" "ik_connector_main.sz";
connectAttr "root_poser.wm" "root_connector_init.opm";
connectAttr "multMatrix223.o" "arm_init_connector.opm";
connectAttr "multMatrix220.o" "connector_1.opm";
connectAttr "mirror_condition.ocr" "connector_1.sx";
connectAttr "l_wing_feathers_6_group_multMat1.o" "connector_1_offset.opm";
connectAttr "decomposeMatrix125.otx" "connector_2.tx";
connectAttr "decomposeMatrix125.oty" "connector_2.ty";
connectAttr "decomposeMatrix125.otz" "connector_2.tz";
connectAttr "decomposeMatrix125.orx" "connector_2.rx";
connectAttr "decomposeMatrix125.ory" "connector_2.ry";
connectAttr "decomposeMatrix125.orz" "connector_2.rz";
connectAttr "decomposeMatrix125.osx" "connector_2.sx";
connectAttr "decomposeMatrix125.osy" "connector_2.sy";
connectAttr "decomposeMatrix125.osz" "connector_2.sz";
connectAttr "decomposeMatrix126.otx" "connector_3_group.tx";
connectAttr "decomposeMatrix126.oty" "connector_3_group.ty";
connectAttr "decomposeMatrix126.otz" "connector_3_group.tz";
connectAttr "decomposeMatrix126.orx" "connector_3_group.rx";
connectAttr "decomposeMatrix126.ory" "connector_3_group.ry";
connectAttr "decomposeMatrix126.orz" "connector_3_group.rz";
connectAttr "decomposeMatrix126.osx" "connector_3_group.sx";
connectAttr "decomposeMatrix126.osy" "connector_3_group.sy";
connectAttr "decomposeMatrix126.osz" "connector_3_group.sz";
connectAttr "pairBlend3.or" "connector_2_offset.r";
connectAttr "multMatrix216.o" "body_orient_connector.opm";
connectAttr "multMatrix254.o" "main_root_body_aim.opm";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "pairBlend98.otx" "clav_group_closed.tx";
connectAttr "pairBlend98.oty" "clav_group_closed.ty";
connectAttr "pairBlend98.otz" "clav_group_closed.tz";
connectAttr "pairBlend98.orx" "clav_group_closed.rx";
connectAttr "pairBlend98.ory" "clav_group_closed.ry";
connectAttr "pairBlend98.orz" "clav_group_closed.rz";
connectAttr "condition1.ocr" "clavShape.v";
connectAttr "pairBlend84.ot" "l_clav_out_loc_1.t";
connectAttr "pairBlend84.or" "l_clav_out_loc_1.r";
connectAttr "decomposeMatrix119.os" "l_clav_out_loc_1.s";
connectAttr "l_clav_out_loc1_orientConstraint1.crx" "l_clav_out_loc_2.rx";
connectAttr "l_clav_out_loc1_orientConstraint1.cry" "l_clav_out_loc_2.ry";
connectAttr "l_clav_out_loc1_orientConstraint1.crz" "l_clav_out_loc_2.rz";
connectAttr "l_clav_out_loc_2.ro" "l_clav_out_loc1_orientConstraint1.cro";
connectAttr "l_clav_out_loc_2.pim" "l_clav_out_loc1_orientConstraint1.cpim";
connectAttr "body_orient_connector.r" "l_clav_out_loc1_orientConstraint1.tg[0].tr"
		;
connectAttr "body_orient_connector.ro" "l_clav_out_loc1_orientConstraint1.tg[0].tro"
		;
connectAttr "body_orient_connector.pm" "l_clav_out_loc1_orientConstraint1.tg[0].tpm"
		;
connectAttr "l_clav_out_loc1_orientConstraint1.w0" "l_clav_out_loc1_orientConstraint1.tg[0].tw"
		;
connectAttr "l_clav_out_loc_1.r" "l_clav_out_loc1_orientConstraint1.tg[1].tr";
connectAttr "l_clav_out_loc_1.ro" "l_clav_out_loc1_orientConstraint1.tg[1].tro";
connectAttr "l_clav_out_loc_1.pm" "l_clav_out_loc1_orientConstraint1.tg[1].tpm";
connectAttr "l_clav_out_loc1_orientConstraint1.w1" "l_clav_out_loc1_orientConstraint1.tg[1].tw"
		;
connectAttr "control.global" "l_clav_out_loc1_orientConstraint1.w0";
connectAttr "reverse3.ox" "l_clav_out_loc1_orientConstraint1.w1";
connectAttr "decomposeMatrix116.or" "l_clavClosed_out_loc.r";
connectAttr "decomposeMatrix116.ot" "l_clavClosed_out_loc.t";
connectAttr "condition1.ocg" "clav_closedShape.v";
connectAttr "multMatrix223.o" "arm_controls.opm";
connectAttr "l_arm_control_group_decomposeMatrix.or" "control_group.r";
connectAttr "l_arm_control_group_decomposeMatrix.ot" "control_group.t";
connectAttr "l_arm_control_group_decomposeMatrix.os" "control_group.s";
connectAttr "l_arm_ikFk_reverse.ox" "fk_controls.v";
connectAttr "blendMatrix98.omat" "fk_a_closedGroup.opm";
connectAttr "l_arm_initScale1_mult.o" "fk_b_group.tx";
connectAttr "l_arm_fk_end_group_decomposeMatrix.or" "fk_b_group.r";
connectAttr "pairBlend96.otx" "fk_b_group_1.tx";
connectAttr "pairBlend96.oty" "fk_b_group_1.ty";
connectAttr "pairBlend96.otz" "fk_b_group_1.tz";
connectAttr "pairBlend96.orx" "fk_b_group_1.rx";
connectAttr "pairBlend96.ory" "fk_b_group_1.ry";
connectAttr "pairBlend96.orz" "fk_b_group_1.rz";
connectAttr "l_arm_initScaleEnd_mult.o" "fk_end_group.tx";
connectAttr "l_arm_fk_b_group_decomposeMatrix.or" "fk_end_group.r";
connectAttr "pairBlend97.or" "fk_end_group_1.r";
connectAttr "mirror_condition.ocr" "end_fkJoint.sx";
connectAttr "control.ikFk" "ik_controls.v";
connectAttr "l_arm_decomposeMatrix25.ot" "ik_end_init.t";
connectAttr "l_arm_decomposeMatrix25.or" "ik_end_init.r";
connectAttr "mirror_condition.ocr" "ik_end_mirror.sz";
connectAttr "condition1.ocg" "ik_end_closedShape.v";
connectAttr "fk_root_closedJoint.msg" "fk_closed_ikHandle.hsj";
connectAttr "effector1.hp" "fk_closed_ikHandle.hee";
connectAttr "l_arm_ikRPsolver1.msg" "fk_closed_ikHandle.hsv";
connectAttr "ikHandle1_poleVectorConstraint1.ctx" "fk_closed_ikHandle.pvx";
connectAttr "ikHandle1_poleVectorConstraint1.cty" "fk_closed_ikHandle.pvy";
connectAttr "ikHandle1_poleVectorConstraint1.ctz" "fk_closed_ikHandle.pvz";
connectAttr "fk_closed_ikHandle.pim" "ikHandle1_poleVectorConstraint1.cpim";
connectAttr "fk_root_closedJoint.pm" "ikHandle1_poleVectorConstraint1.ps";
connectAttr "fk_root_closedJoint.t" "ikHandle1_poleVectorConstraint1.crp";
connectAttr "arm_fk_aim_closed.t" "ikHandle1_poleVectorConstraint1.tg[0].tt";
connectAttr "arm_fk_aim_closed.rp" "ikHandle1_poleVectorConstraint1.tg[0].trp";
connectAttr "arm_fk_aim_closed.rpt" "ikHandle1_poleVectorConstraint1.tg[0].trt";
connectAttr "arm_fk_aim_closed.pm" "ikHandle1_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle1_poleVectorConstraint1.w0" "ikHandle1_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "pairBlend13.or" "ik_end_closedGroup.r";
connectAttr "pairBlend13.ot" "ik_end_closedGroup.t";
connectAttr "l_arm_ik_end_rotateX.o" "ik_end_group_1.rx";
connectAttr "l_arm_ik_end_rotateY.o" "ik_end_group_1.ry";
connectAttr "l_arm_ik_end_rotateZ.o" "ik_end_group_1.rz";
connectAttr "ik_end_rotateX.o" "ik_end.rx";
connectAttr "ik_end_rotateY.o" "ik_end.ry";
connectAttr "ik_end_rotateZ.o" "ik_end.rz";
connectAttr "condition1.ocr" "ik_endShape.v";
connectAttr "ik_connector.t" "ik_end_out_init.t";
connectAttr "ik_connector.r" "ik_end_out_init.r";
connectAttr "mirror_condition.ocr" "ik_end_out.sy";
connectAttr "l_arm_unitConversion431.o" "ik_end_out.rx";
connectAttr "l_arm_unitConversion440.o" "ik_end_out.ry";
connectAttr "polyCube1.out" "pCubeShape1.i";
connectAttr "pairBlend50.otx" "ik_root_group.tx";
connectAttr "pairBlend50.oty" "ik_root_group.ty";
connectAttr "pairBlend50.otz" "ik_root_group.tz";
connectAttr "pairBlend50.orx" "ik_root_group.rx";
connectAttr "pairBlend50.ory" "ik_root_group.ry";
connectAttr "pairBlend50.orz" "ik_root_group.rz";
connectAttr "condition1.ocr" "ik_rootShape.v";
connectAttr "curveStart_locatorShape.wp" "aim_curveShape.cp[0]";
connectAttr "curveEnd_locatorShape.wp" "aim_curveShape.cp[1]";
connectAttr "condition1.ocg" "ik_root_closedShape.v";
connectAttr "l_arm_snap_blend.opr" "fk_middle_closedJoint.tx";
connectAttr "fk_root_closedJoint.s" "fk_middle_closedJoint.is";
connectAttr "l_arm_snap_blend.opg" "fk_end_closedJoint.tx";
connectAttr "fk_end_closedJoint_orientConstraint1.crx" "fk_end_closedJoint.rx";
connectAttr "fk_end_closedJoint_orientConstraint1.cry" "fk_end_closedJoint.ry";
connectAttr "fk_end_closedJoint_orientConstraint1.crz" "fk_end_closedJoint.rz";
connectAttr "fk_middle_closedJoint.s" "fk_end_closedJoint.is";
connectAttr "fk_end_closedJoint.ro" "fk_end_closedJoint_orientConstraint1.cro";
connectAttr "fk_end_closedJoint.pim" "fk_end_closedJoint_orientConstraint1.cpim"
		;
connectAttr "fk_end_closedJoint.jo" "fk_end_closedJoint_orientConstraint1.cjo";
connectAttr "fk_end_closedJoint.is" "fk_end_closedJoint_orientConstraint1.is";
connectAttr "ik_end_closed.r" "fk_end_closedJoint_orientConstraint1.tg[0].tr";
connectAttr "ik_end_closed.ro" "fk_end_closedJoint_orientConstraint1.tg[0].tro";
connectAttr "ik_end_closed.pm" "fk_end_closedJoint_orientConstraint1.tg[0].tpm";
connectAttr "fk_end_closedJoint_orientConstraint1.w0" "fk_end_closedJoint_orientConstraint1.tg[0].tw"
		;
connectAttr "fk_end_closedJoint.tx" "effector1.tx";
connectAttr "fk_end_closedJoint.ty" "effector1.ty";
connectAttr "fk_end_closedJoint.tz" "effector1.tz";
connectAttr "fk_end_closedJoint.opm" "effector1.opm";
connectAttr "multMatrix226.o" "fk_close_loc_2_group.opm";
connectAttr "locator24_orientConstraint1.crx" "fk_close_loc_2.rx";
connectAttr "locator24_orientConstraint1.cry" "fk_close_loc_2.ry";
connectAttr "locator24_orientConstraint1.crz" "fk_close_loc_2.rz";
connectAttr "fk_close_loc_2.ro" "locator24_orientConstraint1.cro";
connectAttr "fk_close_loc_2.pim" "locator24_orientConstraint1.cpim";
connectAttr "fk_middle_closedJoint.r" "locator24_orientConstraint1.tg[0].tr";
connectAttr "fk_middle_closedJoint.ro" "locator24_orientConstraint1.tg[0].tro";
connectAttr "fk_middle_closedJoint.pm" "locator24_orientConstraint1.tg[0].tpm";
connectAttr "fk_middle_closedJoint.jo" "locator24_orientConstraint1.tg[0].tjo";
connectAttr "locator24_orientConstraint1.w0" "locator24_orientConstraint1.tg[0].tw"
		;
connectAttr "multMatrix227.o" "fk_close_loc_1_group.opm";
connectAttr "locator25_parentConstraint1.crx" "fk_close_loc_1.rx";
connectAttr "locator25_parentConstraint1.cry" "fk_close_loc_1.ry";
connectAttr "locator25_parentConstraint1.crz" "fk_close_loc_1.rz";
connectAttr "locator25_parentConstraint1.ctx" "fk_close_loc_1.tx";
connectAttr "locator25_parentConstraint1.cty" "fk_close_loc_1.ty";
connectAttr "locator25_parentConstraint1.ctz" "fk_close_loc_1.tz";
connectAttr "fk_close_loc_1.ro" "locator25_parentConstraint1.cro";
connectAttr "fk_close_loc_1.pim" "locator25_parentConstraint1.cpim";
connectAttr "fk_close_loc_1.rp" "locator25_parentConstraint1.crp";
connectAttr "fk_close_loc_1.rpt" "locator25_parentConstraint1.crt";
connectAttr "fk_end_closedJoint.t" "locator25_parentConstraint1.tg[0].tt";
connectAttr "fk_end_closedJoint.rp" "locator25_parentConstraint1.tg[0].trp";
connectAttr "fk_end_closedJoint.rpt" "locator25_parentConstraint1.tg[0].trt";
connectAttr "fk_end_closedJoint.r" "locator25_parentConstraint1.tg[0].tr";
connectAttr "fk_end_closedJoint.ro" "locator25_parentConstraint1.tg[0].tro";
connectAttr "fk_end_closedJoint.s" "locator25_parentConstraint1.tg[0].ts";
connectAttr "fk_end_closedJoint.pm" "locator25_parentConstraint1.tg[0].tpm";
connectAttr "fk_end_closedJoint.jo" "locator25_parentConstraint1.tg[0].tjo";
connectAttr "fk_end_closedJoint.ssc" "locator25_parentConstraint1.tg[0].tsc";
connectAttr "fk_end_closedJoint.is" "locator25_parentConstraint1.tg[0].tis";
connectAttr "locator25_parentConstraint1.w0" "locator25_parentConstraint1.tg[0].tw"
		;
connectAttr "decomposeMatrix123.ot" "ik_aim_init.t";
connectAttr "decomposeMatrix124.or" "ik_aim_init.r";
connectAttr "mirror_condition.ocr" "ik_aim_mirror.sz";
connectAttr "pairBlend14.otx" "ik_aim_closedGroup.tx";
connectAttr "pairBlend14.oty" "ik_aim_closedGroup.ty";
connectAttr "pairBlend14.otz" "ik_aim_closedGroup.tz";
connectAttr "pairBlend14.orx" "ik_aim_closedGroup.rx";
connectAttr "pairBlend14.ory" "ik_aim_closedGroup.ry";
connectAttr "pairBlend14.orz" "ik_aim_closedGroup.rz";
connectAttr "condition1.ocr" "ik_aimShape.v";
connectAttr "condition1.ocr" "ik_aimShape1.v";
connectAttr "condition1.ocr" "ik_aimShape2.v";
connectAttr "condition1.ocg" "ik_aim_closedShape.v";
connectAttr "condition1.ocg" "ik_aim_closedShape1.v";
connectAttr "condition1.ocg" "ik_aim_closedShape2.v";
connectAttr "multMatrix224.o" "wing_controls.opm";
connectAttr "main_root_group_aimConstraint1.crx" "main_root_group.rx";
connectAttr "main_root_group_aimConstraint1.cry" "main_root_group.ry";
connectAttr "main_root_group_aimConstraint1.crz" "main_root_group.rz";
connectAttr "condition1.ocg" "main_1_closedShape.v";
connectAttr "pairBlend86.otx" "main_1_closed_group.tx";
connectAttr "pairBlend86.oty" "main_1_closed_group.ty";
connectAttr "pairBlend86.otz" "main_1_closed_group.tz";
connectAttr "pairBlend86.orx" "main_1_closed_group.rx";
connectAttr "pairBlend86.ory" "main_1_closed_group.ry";
connectAttr "pairBlend86.orz" "main_1_closed_group.rz";
connectAttr "condition1.ocr" "main_rootShape.v";
connectAttr "multMatrix258.o" "sec_1_root_init.opm";
connectAttr "main_root_group.pim" "main_root_group_aimConstraint1.cpim";
connectAttr "main_root_group.t" "main_root_group_aimConstraint1.ct";
connectAttr "main_root_group.rp" "main_root_group_aimConstraint1.crp";
connectAttr "main_root_group.rpt" "main_root_group_aimConstraint1.crt";
connectAttr "main_root_group.ro" "main_root_group_aimConstraint1.cro";
connectAttr "main_root_body_aim.t" "main_root_group_aimConstraint1.tg[0].tt";
connectAttr "main_root_body_aim.rp" "main_root_group_aimConstraint1.tg[0].trp";
connectAttr "main_root_body_aim.rpt" "main_root_group_aimConstraint1.tg[0].trt";
connectAttr "main_root_body_aim.pm" "main_root_group_aimConstraint1.tg[0].tpm";
connectAttr "main_root_group_aimConstraint1.w0" "main_root_group_aimConstraint1.tg[0].tw"
		;
connectAttr "a_finalJoint.wm" "main_root_group_aimConstraint1.wum";
connectAttr "multMatrix247.o" "wrist_group.opm";
connectAttr "condition1.ocg" "main_2_closedShape.v";
connectAttr "multMatrix248.o" "main_middle_group.opm";
connectAttr "pairBlend100.or" "main_middle_rev_group.r";
connectAttr "condition1.ocg" "main_3_closedShape.v";
connectAttr "pairBlend18.otx" "main_3_closedGroup.tx";
connectAttr "pairBlend18.oty" "main_3_closedGroup.ty";
connectAttr "pairBlend18.otz" "main_3_closedGroup.tz";
connectAttr "pairBlend18.orx" "main_3_closedGroup.rx";
connectAttr "pairBlend18.orz" "main_3_closedGroup.rz";
connectAttr "pairBlend18.ory" "main_3_closedGroup.ry";
connectAttr "condition1.ocr" "main_middleShape.v";
connectAttr "multMatrix259.o" "sec_2_root_init.opm";
connectAttr "multMatrix264.o" "sec_3_target_2_init.opm";
connectAttr "multMatrix272.o" "sec_4_target_2_init.opm";
connectAttr "multMatrix252.o" "main_end_group.opm";
connectAttr "pairBlend26.otx" "main_end_group_2.tx";
connectAttr "pairBlend26.oty" "main_end_group_2.ty";
connectAttr "pairBlend26.otz" "main_end_group_2.tz";
connectAttr "pairBlend26.orx" "main_end_group_2.rx";
connectAttr "pairBlend26.ory" "main_end_group_2.ry";
connectAttr "pairBlend26.orz" "main_end_group_2.rz";
connectAttr "multMatrix260.o" "sec_5_root_init.opm";
connectAttr "multMatrix263.o" "sec_3_target_1_init.opm";
connectAttr "multMatrix271.o" "sec_4_target_1_init.opm";
connectAttr "multMatrix262.o" "sec_3_root_init.opm";
connectAttr "multMatrix268.o" "sec_4_root_init.opm";
connectAttr "multMatrix257.o" "sec_5_1_group.opm";
connectAttr "multMatrix282.o" "feathers_7_2_group.opm";
connectAttr "multMatrix283.o" "feathers_7_3_group.opm";
connectAttr "feathers_7_1_joint_1.s" "feathers_7_1_joint_2.is";
connectAttr "multMatrix269.o" "sec_4_1_group.opm";
connectAttr "decomposeMatrix137.or" "sec_4_1_group_2.r";
connectAttr "multMatrix280.o" "feathers_6_2_group.opm";
connectAttr "multMatrix281.o" "feathers_6_3_group.opm";
connectAttr "multMatrix261.o" "sec_3_1_group.opm";
connectAttr "decomposeMatrix134.or" "sec_3_1_group_2.r";
connectAttr "multMatrix278.o" "feathers_5_2_group.opm";
connectAttr "multMatrix279.o" "feathers_5_3_group.opm";
connectAttr "multMatrix273.o" "sec_2_1_group.opm";
connectAttr "multMatrix277.o" "feathers_4_2_group.opm";
connectAttr "multMatrix276.o" "feathers_4_3_group.opm";
connectAttr "multMatrix255.o" "sec_1_1_group.opm";
connectAttr "multMatrix274.o" "feathers_1_2_group.opm";
connectAttr "multMatrix275.o" "feathers_1_3_group.opm";
connectAttr "l_arm_root_connector_decomposeMatrix.osx" "ik_joints.sx";
connectAttr "l_arm_root_connector_decomposeMatrix.osy" "ik_joints.sy";
connectAttr "l_arm_root_connector_decomposeMatrix.osz" "ik_joints.sz";
connectAttr "l_arm_root_connector_decomposeMatrix.otx" "ik_joints.tx";
connectAttr "l_arm_root_connector_decomposeMatrix.oty" "ik_joints.ty";
connectAttr "l_arm_root_connector_decomposeMatrix.otz" "ik_joints.tz";
connectAttr "l_arm_root_connector_decomposeMatrix.orx" "ik_joints.rx";
connectAttr "l_arm_root_connector_decomposeMatrix.ory" "ik_joints.ry";
connectAttr "l_arm_root_connector_decomposeMatrix.orz" "ik_joints.rz";
connectAttr "plusMinusAverage1.o3" "a_ikJoint.t";
connectAttr "a_ikJoint.s" "b_ikJoint.is";
connectAttr "l_arm_snap_blend.opr" "b_ikJoint.tx";
connectAttr "b_ikJoint.s" "end_ikJoint.is";
connectAttr "l_arm_decomposeMatrix33.orx" "end_ikJoint.rx";
connectAttr "l_arm_decomposeMatrix33.ory" "end_ikJoint.ry";
connectAttr "l_arm_decomposeMatrix33.orz" "end_ikJoint.rz";
connectAttr "l_arm_snap_blend.opg" "end_ikJoint.tx";
connectAttr "end_ikJoint.tx" "effector.tx";
connectAttr "end_ikJoint.ty" "effector.ty";
connectAttr "end_ikJoint.tz" "effector.tz";
connectAttr "l_arm_root_connector_decomposeMatrix.osx" "joints.sx";
connectAttr "l_arm_root_connector_decomposeMatrix.osy" "joints.sy";
connectAttr "l_arm_multDoubleLinear435.o" "joints.sz";
connectAttr "a_joint_parentConstraint1.cry" "a_finalJoint.ry";
connectAttr "a_joint_parentConstraint1.crz" "a_finalJoint.rz";
connectAttr "a_joint_parentConstraint1.crx" "a_finalJoint.rx";
connectAttr "a_joint_parentConstraint1.cty" "a_finalJoint.ty";
connectAttr "a_joint_parentConstraint1.ctz" "a_finalJoint.tz";
connectAttr "a_joint_parentConstraint1.ctx" "a_finalJoint.tx";
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
connectAttr "b_finalJoint.s" "end_finalJoint.is";
connectAttr "end_joint_parentConstraint1.cry" "end_finalJoint.ry";
connectAttr "end_joint_parentConstraint1.crz" "end_finalJoint.rz";
connectAttr "end_joint_parentConstraint1.crx" "end_finalJoint.rx";
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
connectAttr "l_arm_ikFk_reverse.ox" "end_joint_parentConstraint1.w0";
connectAttr "control.ikFk" "end_joint_parentConstraint1.w1";
connectAttr "mirror_condition.ocr" "fk_end_ikFkSwitchHelper.sx";
connectAttr "multMatrix250.o" "b_finalJoint_init_direction.opm";
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
connectAttr "l_arm_ikFk_reverse.ox" "b_joint_parentConstraint1.w1";
connectAttr "mirror_condition.ocr" "fk_b_ikFkSwitchHelper.sx";
connectAttr "b_finalJoint.s" "middle_volume_outJoint.is";
connectAttr "l_arm_volume_blendColors.opg" "middle_volume_outJoint.sy";
connectAttr "l_arm_volume_blendColors.opg" "middle_volume_outJoint.sz";
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
connectAttr "l_arm_ikFk_reverse.ox" "a_joint_parentConstraint1.w0";
connectAttr "control.ikFk" "a_joint_parentConstraint1.w1";
connectAttr "mirror_condition.ocr" "fk_a_ikFkSwitchHelper.sx";
connectAttr "l_arm_volume_blendColors.opr" "root_volume_outJoint.sy";
connectAttr "l_arm_volume_blendColors.opr" "root_volume_outJoint.sz";
connectAttr "a_finalJoint.s" "root_volume_outJoint.is";
connectAttr "a_ikJoint.msg" "ikHandle.hsj";
connectAttr "effector.hp" "ikHandle.hee";
connectAttr "l_arm_ikRPsolver1.msg" "ikHandle.hsv";
connectAttr "ikHandle_poleVectorConstraint1.ctx" "ikHandle.pvx";
connectAttr "ikHandle_poleVectorConstraint1.cty" "ikHandle.pvy";
connectAttr "ikHandle_poleVectorConstraint1.ctz" "ikHandle.pvz";
connectAttr "l_arm_decomposeMatrix41.otx" "ikHandle.tx";
connectAttr "l_arm_decomposeMatrix41.oty" "ikHandle.ty";
connectAttr "l_arm_decomposeMatrix41.otz" "ikHandle.tz";
connectAttr "ikHandle.pim" "ikHandle_poleVectorConstraint1.cpim";
connectAttr "a_ikJoint.pm" "ikHandle_poleVectorConstraint1.ps";
connectAttr "a_ikJoint.t" "ikHandle_poleVectorConstraint1.crp";
connectAttr "ik_aim.t" "ikHandle_poleVectorConstraint1.tg[0].tt";
connectAttr "ik_aim.rp" "ikHandle_poleVectorConstraint1.tg[0].trp";
connectAttr "ik_aim.rpt" "ikHandle_poleVectorConstraint1.tg[0].trt";
connectAttr "ik_aim.pm" "ikHandle_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle_poleVectorConstraint1.w0" "ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "joints.s" "outJoints.s";
connectAttr "decomposeMatrix127.oty" "root_outJoint.ty";
connectAttr "decomposeMatrix127.otz" "root_outJoint.tz";
connectAttr "decomposeMatrix127.otx" "root_outJoint.tx";
connectAttr "decomposeMatrix127.ory" "root_outJoint.ry";
connectAttr "decomposeMatrix127.orz" "root_outJoint.rz";
connectAttr "decomposeMatrix127.orx" "root_outJoint.rx";
connectAttr "decomposeMatrix127.osx" "root_outJoint.sx";
connectAttr "decomposeMatrix127.osy" "root_outJoint.sy";
connectAttr "decomposeMatrix127.osz" "root_outJoint.sz";
connectAttr "decomposeMatrix128.oty" "start_outJoint.ty";
connectAttr "decomposeMatrix128.otz" "start_outJoint.tz";
connectAttr "decomposeMatrix128.otx" "start_outJoint.tx";
connectAttr "decomposeMatrix128.ory" "start_outJoint.ry";
connectAttr "decomposeMatrix128.orz" "start_outJoint.rz";
connectAttr "decomposeMatrix128.orx" "start_outJoint.rx";
connectAttr "decomposeMatrix128.osx" "start_outJoint.sx";
connectAttr "decomposeMatrix128.osy" "start_outJoint.sy";
connectAttr "decomposeMatrix128.osz" "start_outJoint.sz";
connectAttr "root_outJoint.s" "start_outJoint.is";
connectAttr "b_finalJoint.tx" "middle_outJoint.tx";
connectAttr "b_finalJoint.ty" "middle_outJoint.ty";
connectAttr "b_finalJoint.tz" "middle_outJoint.tz";
connectAttr "b_finalJoint.rx" "middle_outJoint.rx";
connectAttr "b_finalJoint.ry" "middle_outJoint.ry";
connectAttr "b_finalJoint.rz" "middle_outJoint.rz";
connectAttr "start_outJoint.s" "middle_outJoint.is";
connectAttr "end_finalJoint.tx" "end_outJoint.tx";
connectAttr "end_finalJoint.ty" "end_outJoint.ty";
connectAttr "end_finalJoint.tz" "end_outJoint.tz";
connectAttr "end_finalJoint.rx" "end_outJoint.rx";
connectAttr "end_finalJoint.ry" "end_outJoint.ry";
connectAttr "end_finalJoint.rz" "end_outJoint.rz";
connectAttr "middle_outJoint.s" "end_outJoint.is";
connectAttr "l_arm_decomposeMatrix42.otx" "fk_out_grp.tx";
connectAttr "l_arm_decomposeMatrix42.oty" "fk_out_grp.ty";
connectAttr "l_arm_decomposeMatrix42.otz" "fk_out_grp.tz";
connectAttr "l_arm_decomposeMatrix42.orx" "fk_out_grp.rx";
connectAttr "l_arm_decomposeMatrix42.ory" "fk_out_grp.ry";
connectAttr "l_arm_decomposeMatrix42.orz" "fk_out_grp.rz";
connectAttr "l_arm_decomposeMatrix42.osx" "fk_out_grp.sx";
connectAttr "l_arm_decomposeMatrix42.osy" "fk_out_grp.sy";
connectAttr "l_arm_decomposeMatrix42.osz" "fk_out_grp.sz";
connectAttr "l_arm_decomposeMatrix43.otx" "ik_out_grp.tx";
connectAttr "l_arm_decomposeMatrix43.oty" "ik_out_grp.ty";
connectAttr "l_arm_decomposeMatrix43.otz" "ik_out_grp.tz";
connectAttr "l_arm_decomposeMatrix43.orx" "ik_out_grp.rx";
connectAttr "l_arm_decomposeMatrix43.ory" "ik_out_grp.ry";
connectAttr "l_arm_decomposeMatrix43.orz" "ik_out_grp.rz";
connectAttr "l_arm_decomposeMatrix43.osx" "ik_out_grp.sx";
connectAttr "l_arm_decomposeMatrix43.osy" "ik_out_grp.sy";
connectAttr "l_arm_decomposeMatrix43.osz" "ik_out_grp.sz";
connectAttr "mirror_condition.ocr" "ik_out.sx";
connectAttr "l_arm_decomposeMatrix44.oty" "ikRev_out.ty";
connectAttr "l_arm_decomposeMatrix44.otz" "ikRev_out.tz";
connectAttr "l_arm_decomposeMatrix44.otx" "ikRev_out.tx";
connectAttr "l_arm_decomposeMatrix44.ory" "ikRev_out.ry";
connectAttr "l_arm_decomposeMatrix44.orz" "ikRev_out.rz";
connectAttr "l_arm_decomposeMatrix44.orx" "ikRev_out.rx";
connectAttr "l_arm_decomposeMatrix44.osy" "ikRev_out.sy";
connectAttr "l_arm_decomposeMatrix44.osz" "ikRev_out.sz";
connectAttr "l_arm_decomposeMatrix44.osx" "ikRev_out.sx";
connectAttr "surfShapeOrig.ws" "surfShape.cr";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "ikFkSwitchSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "l_arm_size_multiplyDivide.ox" "l_arm_makeNurbSphere1.r";
connectAttr "start_poser.size" "l_arm_size_multiplyDivide.i1x";
connectAttr "mainPoser.size" "l_arm_size_multiplyDivide.i1y";
connectAttr "l_arm_multDoubleLinear438.o" "l_arm_size_multiplyDivide.i1z";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide.i2y";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide.i2z";
connectAttr "l_arm_mainPoser_decomposeMatrix.osx" "l_arm_multDoubleLinear438.i1"
		;
connectAttr "mainPoser.lineSize" "l_arm_multDoubleLinear438.i2";
connectAttr "mainPoser.wm" "l_arm_mainPoser_decomposeMatrix.imat";
connectAttr "l_arm_unitConversion446.o" "l_arm_multiplyDivide353.i1";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "aimOffset_scaled.o" "multiplyDivide357.i1x";
connectAttr "aimOffset_scaled.o" "multiplyDivide357.i1y";
connectAttr "aimOffset_scaled.o" "multiplyDivide357.i1z";
connectAttr "l_arm_middleOut_vectorNormalized3.o" "multiplyDivide357.i2";
connectAttr "mod.aim_offset" "aimOffset_scaled.i1";
connectAttr "l_arm_frombetweenToMiddle_vector3.o3" "l_arm_middleOut_vectorNormalized3.i1"
		;
connectAttr "middle_poser_locShape.wp" "l_arm_frombetweenToMiddle_vector3.i3[0]"
		;
connectAttr "l_arm_rootMiddle_betweenPoint3.o3" "l_arm_frombetweenToMiddle_vector3.i3[1]"
		;
connectAttr "l_arm_rootMiddle_projected3.o" "l_arm_rootMiddle_betweenPoint3.i3[0]"
		;
connectAttr "decomposeMatrix50.ot" "l_arm_rootMiddle_betweenPoint3.i3[1]";
connectAttr "l_arm_rootEnd_vectorNormalized_projected3.o" "l_arm_rootMiddle_projected3.i1"
		;
connectAttr "l_arm_rootMiddle_distance.d" "l_arm_rootMiddle_projected3.i2x";
connectAttr "l_arm_rootMiddle_distance.d" "l_arm_rootMiddle_projected3.i2y";
connectAttr "l_arm_rootMiddle_distance.d" "l_arm_rootMiddle_projected3.i2z";
connectAttr "l_arm_rootEnd_vectorNormalized.o" "l_arm_rootEnd_vectorNormalized_projected3.i1"
		;
connectAttr "l_arm_cosAngle_bewtweenVectors.o" "l_arm_rootEnd_vectorNormalized_projected3.i2"
		;
connectAttr "l_arm_rootEnd_vector.o3" "l_arm_rootEnd_vectorNormalized.i1";
connectAttr "end_poser_locShape.wp" "l_arm_rootEnd_vector.i3[0]";
connectAttr "decomposeMatrix50.ot" "l_arm_rootEnd_vector.i3[1]";
connectAttr "start_poser.wm" "decomposeMatrix50.imat";
connectAttr "l_arm_rootMiddle_vector.o3" "l_arm_cosAngle_bewtweenVectors.i1";
connectAttr "l_arm_rootEnd_vector.o3" "l_arm_cosAngle_bewtweenVectors.i2";
connectAttr "middle_poser_locShape.wp" "l_arm_rootMiddle_vector.i3[0]";
connectAttr "decomposeMatrix50.ot" "l_arm_rootMiddle_vector.i3[1]";
connectAttr "middle_poser_locShape.wp" "l_arm_rootMiddle_distance.p1";
connectAttr "decomposeMatrix50.ot" "l_arm_rootMiddle_distance.p2";
connectAttr "l_arm_multMatrix22.o" "l_arm_decomposeMatrix25.imat";
connectAttr "l_arm_composeMatrix1.omat" "l_arm_multMatrix22.i[0]";
connectAttr "end_poser.wm" "l_arm_multMatrix22.i[1]";
connectAttr "start_poserOrient.wim" "l_arm_multMatrix22.i[2]";
connectAttr "mirror_condition.ocr" "l_arm_composeMatrix1.isx";
connectAttr "middle_poser.size" "l_arm_size_multiplyDivide1.i1x";
connectAttr "end_poser.size" "l_arm_size_multiplyDivide1.i1y";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide1.i2x";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide1.i2y";
connectAttr "l_arm_size_multiplyDivide1.oy" "l_arm_makeNurbSphere3.r";
connectAttr "mirror_condition.ocr" "l_arm_world_composeMatrix.isx";
connectAttr "root_poser.size" "l_clav_makeNurbSphere.r";
connectAttr "posers_curveShape.ws" "l_arm_sweepMeshCreator1.inCurveArray[0]";
connectAttr "l_arm_size_multiplyDivide.oz" "l_arm_sweepMeshCreator1.scaleProfileX"
		;
connectAttr "control.global" "reverse3.ix";
connectAttr "control.ikFk" "l_arm_ikFk_reverse.ix";
connectAttr "l_arm_fk_end_group_decomposeMatrix.otx" "l_arm_initScale1_mult.i1";
connectAttr "control.length1" "l_arm_initScale1_mult.i2";
connectAttr "l_arm_fk_end_group_multMatrix.o" "l_arm_fk_end_group_decomposeMatrix.imat"
		;
connectAttr "middle_poserOrient.wm" "l_arm_fk_end_group_multMatrix.i[0]";
connectAttr "start_poserOrient.wim" "l_arm_fk_end_group_multMatrix.i[1]";
connectAttr "l_arm_fk_b_group_decomposeMatrix.otx" "l_arm_initScaleEnd_mult.i1";
connectAttr "control.length2" "l_arm_initScaleEnd_mult.i2";
connectAttr "l_arm_fk_b_group_multMatrix.o" "l_arm_fk_b_group_decomposeMatrix.imat"
		;
connectAttr "end_poser.wm" "l_arm_fk_b_group_multMatrix.i[0]";
connectAttr "middle_poserOrient.wim" "l_arm_fk_b_group_multMatrix.i[1]";
connectAttr "ik_aim_closed.t" "pairBlend14.it2";
connectAttr "ik_aim_closed.r" "pairBlend14.ir2";
connectAttr "control.close" "pairBlend14.w";
connectAttr "ik_end_closed.t" "pairBlend13.it2";
connectAttr "ik_end_closed.r" "pairBlend13.ir2";
connectAttr "control.close" "pairBlend13.w";
connectAttr "control.close" "l_arm_ik_end_rotateX.i";
connectAttr "control.close" "l_arm_ik_end_rotateY.i";
connectAttr "control.close" "l_arm_ik_end_rotateZ.i";
connectAttr "mirror_condition.ocb" "l_arm_multDoubleLinear437.i1";
connectAttr "control.close" "pairBlend50.w";
connectAttr "ik_root_closed.t" "pairBlend50.it2";
connectAttr "ik_root_closed.r" "pairBlend50.ir2";
connectAttr "arm_root_connector.wm" "l_arm_root_connector_decomposeMatrix.imat";
connectAttr "ik_root.t" "plusMinusAverage1.i3[0]";
connectAttr "ik_root_group.t" "plusMinusAverage1.i3[1]";
connectAttr "control.snap" "l_arm_snap_blend.b";
connectAttr "l_arm_current_toSnapPoint_length_scaled.o" "l_arm_snap_blend.c1";
connectAttr "l_arm_scale_to_translate_converter.ox" "l_arm_snap_blend.c2r";
connectAttr "l_arm_scale_to_translate_converter.oy" "l_arm_snap_blend.c2g";
connectAttr "l_arm_current_rootToSnapPoint_length.d" "l_arm_current_toSnapPoint_length_scaled.i1x"
		;
connectAttr "l_arm_current_endToSnapPoint_length.d" "l_arm_current_toSnapPoint_length_scaled.i1y"
		;
connectAttr "l_arm_root_connector_decomposeMatrix.osx" "l_arm_current_toSnapPoint_length_scaled.i2x"
		;
connectAttr "l_arm_root_connector_decomposeMatrix.osx" "l_arm_current_toSnapPoint_length_scaled.i2y"
		;
connectAttr "snap_root_locShape.wp" "l_arm_current_rootToSnapPoint_length.p1";
connectAttr "curveEnd_locatorShape.wp" "l_arm_current_rootToSnapPoint_length.p2"
		;
connectAttr "curveEnd_locatorShape.wp" "l_arm_current_endToSnapPoint_length.p1";
connectAttr "ik_end_outShape.wp" "l_arm_current_endToSnapPoint_length.p2";
connectAttr "l_arm_final_length.o" "l_arm_scale_to_translate_converter.i2";
connectAttr "l_arm_fk_end_group_decomposeMatrix.otx" "l_arm_scale_to_translate_converter.i1x"
		;
connectAttr "l_arm_fk_b_group_decomposeMatrix.otx" "l_arm_scale_to_translate_converter.i1y"
		;
connectAttr "l_arm_ikfk_blend.opr" "l_arm_final_length.i1x";
connectAttr "l_arm_ikfk_blend.opr" "l_arm_final_length.i1y";
connectAttr "control.length1" "l_arm_final_length.i2x";
connectAttr "control.length2" "l_arm_final_length.i2y";
connectAttr "l_arm_stretch_blend.opr" "l_arm_ikfk_blend.c1r";
connectAttr "control.ikFk" "l_arm_ikfk_blend.b";
connectAttr "control.autoStretch" "l_arm_stretch_blend.b";
connectAttr "l_arm_final_length_factor.ox" "l_arm_stretch_blend.c1r";
connectAttr "l_arm_current_length_scaled.ox" "l_arm_final_length_factor.i1x";
connectAttr "l_arm_stretch_condition.ocr" "l_arm_final_length_factor.i2x";
connectAttr "l_arm_current_length.d" "l_arm_current_length_scaled.i1x";
connectAttr "l_arm_root_connector_decomposeMatrix.osx" "l_arm_current_length_scaled.i2x"
		;
connectAttr "ik_end_outShape.wp" "l_arm_current_length.p1";
connectAttr "snap_root_locShape.wp" "l_arm_current_length.p2";
connectAttr "l_arm_current_length_scaled.ox" "l_arm_stretch_condition.st";
connectAttr "l_arm_softIk_condition.ocr" "l_arm_stretch_condition.ft";
connectAttr "l_arm_current_length_scaled.ox" "l_arm_stretch_condition.cfr";
connectAttr "l_arm_softIk_condition.ocg" "l_arm_stretch_condition.ctr";
connectAttr "control.softIk" "l_arm_softIk_condition.ft";
connectAttr "l_arm_init_lenth_minus_softIk.o1" "l_arm_softIk_condition.ctr";
connectAttr "l_arm_return_softIk.o" "l_arm_softIk_condition.ctg";
connectAttr "l_arm_init_length.o" "l_arm_softIk_condition.cfr";
connectAttr "l_arm_init_length.o" "l_arm_softIk_condition.cfg";
connectAttr "l_arm_init_length.o" "l_arm_init_lenth_minus_softIk.i1[0]";
connectAttr "l_arm_softIk_value.ov" "l_arm_init_lenth_minus_softIk.i1[1]";
connectAttr "l_arm_init_length_a.ox" "l_arm_init_length.i1";
connectAttr "l_arm_init_length_b.ox" "l_arm_init_length.i2";
connectAttr "control.length1" "l_arm_init_length_a.i1x";
connectAttr "l_arm_fk_end_group_decomposeMatrix.otx" "l_arm_init_length_a.i2x";
connectAttr "l_arm_fk_b_group_decomposeMatrix.otx" "l_arm_init_length_b.i1x";
connectAttr "control.length2" "l_arm_init_length_b.i2x";
connectAttr "control.softIk" "l_arm_softIk_value.i";
connectAttr "l_arm_one_minus_by_softIk.o" "l_arm_return_softIk.i1";
connectAttr "l_arm_init_lenth_minus_softIk.o1" "l_arm_return_softIk.i2";
connectAttr "l_arm_one_minus.o1" "l_arm_one_minus_by_softIk.i1";
connectAttr "l_arm_softIk_value.ov" "l_arm_one_minus_by_softIk.i2";
connectAttr "l_arm_power.ox" "l_arm_one_minus.i1[1]";
connectAttr "l_arm_length_difference_by_softIk.ox" "l_arm_power.i2x";
connectAttr "l_arm_length_difference_minus.o" "l_arm_length_difference_by_softIk.i1x"
		;
connectAttr "l_arm_softIk_value.ov" "l_arm_length_difference_by_softIk.i2x";
connectAttr "l_arm_length_difference.o1" "l_arm_length_difference_minus.i1";
connectAttr "l_arm_current_length_scaled.ox" "l_arm_length_difference.i1[0]";
connectAttr "l_arm_init_lenth_minus_softIk.o1" "l_arm_length_difference.i1[1]";
connectAttr "l_arm_multMatrix29.o" "l_arm_decomposeMatrix33.imat";
connectAttr "ik_end_out.wm" "l_arm_multMatrix29.i[0]";
connectAttr "end_ikJoint.pim" "l_arm_multMatrix29.i[1]";
connectAttr "l_arm_root_connector_decomposeMatrix.osz" "l_arm_multDoubleLinear435.i1"
		;
connectAttr "mirror_condition.ocr" "l_arm_multDoubleLinear435.i2";
connectAttr "mirror_condition.ocg" "unitConversion443.i";
connectAttr "mirror_condition.ocb" "unitConversion444.i";
connectAttr "l_arm_volume_mult.o" "l_arm_volume_blendColors.c1";
connectAttr "control.stretchVolume" "l_arm_volume_blendColors.b";
connectAttr "l_arm_fk_end_group_decomposeMatrix.otx" "l_arm_volume_mult.i1x";
connectAttr "l_arm_fk_b_group_decomposeMatrix.otx" "l_arm_volume_mult.i1y";
connectAttr "l_arm_scale_to_translate_converter.ox" "l_arm_volume_mult.i2x";
connectAttr "l_arm_scale_to_translate_converter.oy" "l_arm_volume_mult.i2y";
connectAttr "ik_connector.wm" "l_arm_decomposeMatrix41.imat";
connectAttr "end_fkJoint.wm" "l_arm_decomposeMatrix42.imat";
connectAttr "l_arm_multMatrix38.o" "l_arm_decomposeMatrix44.imat";
connectAttr "end_ikJoint.wm" "l_arm_multMatrix38.i[0]";
connectAttr "ikRev_out.pim" "l_arm_multMatrix38.i[1]";
connectAttr "l_clavClosed_out_loc.r" "pairBlend84.ir2";
connectAttr "l_clavClosed_out_loc.t" "pairBlend84.it2";
connectAttr "control.close" "pairBlend84.w";
connectAttr "decomposeMatrix119.ot" "pairBlend84.it1";
connectAttr "decomposeMatrix119.or" "pairBlend84.ir1";
connectAttr "multMatrix216.o" "decomposeMatrix119.imat";
connectAttr "start_poser.wm" "multMatrix216.i[0]";
connectAttr "root_poser.wim" "multMatrix216.i[1]";
connectAttr "multMatrix213.o" "decomposeMatrix116.imat";
connectAttr "start_poser.wm" "multMatrix213.i[0]";
connectAttr "root_poser.wim" "multMatrix213.i[1]";
connectAttr "start_poserOrient.wm" "l_wing_root_decomposeMatrix1.imat";
connectAttr "middle_poserOrient.wm" "l_wing_main_2_group_multMat1.i[0]";
connectAttr "start_poserOrient.wim" "l_wing_main_2_group_multMat1.i[1]";
connectAttr "start_poser.wm" "l_wing_feathers_6_group_multMat2.i[0]";
connectAttr "root_poser.wim" "l_wing_feathers_6_group_multMat2.i[1]";
connectAttr "decomposeMatrix90.or" "pairBlend3.ir1";
connectAttr "main_middle.slideRotate" "pairBlend3.w";
connectAttr "multMatrix222.o" "decomposeMatrix90.imat";
connectAttr "start_poserOrient.wim" "l_wing_feathers_6_group_multMat1.i[1]";
connectAttr "main_1_closed.t" "pairBlend86.it2";
connectAttr "main_1_closed.r" "pairBlend86.ir2";
connectAttr "control.close" "pairBlend86.w";
connectAttr "main_3_closed.t" "pairBlend18.it2";
connectAttr "main_3_closed.r" "pairBlend18.ir2";
connectAttr "control.close" "pairBlend18.w";
connectAttr "connector_1_offset.wim" "multMatrix175.i[1]";
connectAttr "main_2_closed.t" "pairBlend26.it2";
connectAttr "main_2_closed.r" "pairBlend26.ir2";
connectAttr "control.close" "pairBlend26.w";
connectAttr "main_root.wm" "multMatrix167.i[0]";
connectAttr "connector_1.wim" "multMatrix167.i[1]";
connectAttr "inbetweens_point_1_5.t" "l_wing_distanceBetween18.p1";
connectAttr "inbetweens_point_2_5.t" "l_wing_distanceBetween18.p2";
connectAttr "control.close" "blendColors7.b";
connectAttr "control.close" "blendColors14.b";
connectAttr "control.close" "blendColors12.b";
connectAttr "control.close" "blendColors6.b";
connectAttr "inbetweens_point_2_4.t" "distanceBetween1.p1";
connectAttr "inbetweens_point_1_4.t" "distanceBetween1.p2";
connectAttr "control.close" "blendColors11.b";
connectAttr "control.close" "blendColors4.b";
connectAttr "control.close" "blendColors18.b";
connectAttr "control.close" "blendColors15.b";
connectAttr "inbetweens_point_2_6.t" "l_wing_distanceBetween22.p1";
connectAttr "inbetweens_point_1_6.t" "l_wing_distanceBetween22.p2";
connectAttr "control.close" "blendColors17.b";
connectAttr "control.close" "blendColors19.b";
connectAttr "control.close" "blendColors5.b";
connectAttr "control.close" "blendColors3.b";
connectAttr "control.close" "blendColors24.b";
connectAttr "control.close" "blendColors10.b";
connectAttr "control.close" "blendColors9.b";
connectAttr "control.close" "blendColors1.b";
connectAttr "inbetweens_point_2_2.t" "l_wing_distanceBetween19.p1";
connectAttr "inbetweens_point_1_2.t" "l_wing_distanceBetween19.p2";
connectAttr "control.close" "blendColors28.b";
connectAttr "control.close" "blendColors23.b";
connectAttr "control.close" "blendColors21.b";
connectAttr "control.close" "blendColors26.b";
connectAttr "control.close" "blendColors22.b";
connectAttr "control.close" "blendColors32.b";
connectAttr "control.close" "blendColors31.b";
connectAttr "control.close" "blendColors2.b";
connectAttr "connector_1.wim" "multMatrix168.i[1]";
connectAttr "control.close" "blendColors16.b";
connectAttr "control.close" "blendColors8.b";
connectAttr "control.close" "blendColors20.b";
connectAttr "control.close" "blendColors13.b";
connectAttr "control.close" "blendColors64.b";
connectAttr "control.close" "blendColors63.b";
connectAttr "control.close" "blendColors65.b";
connectAttr "control.edgeControls" "multDoubleLinear9.i1";
connectAttr "feathers_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "arm_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ik_aim.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_root.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_end.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "fk_b.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_end.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_a.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "control.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_b.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_end.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_a.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_aim.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_root.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_end.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "clav.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "start_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "middle_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "end_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "main_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" -na;
connectAttr "main_root.iog" "main_moduleControlSet.dsm" -na;
connectAttr "main_middle.iog" "main_moduleControlSet.dsm" -na;
connectAttr "main_end.iog" "main_moduleControlSet.dsm" -na;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "ik_end.wm" "l_arm_decomposeMatrix43.imat";
connectAttr "ik_end_out_rot.wm" "l_arm_decomposeMatrix31.imat";
connectAttr "mirror_condition.ocg" "l_arm_unitConversion431.i";
connectAttr "l_arm_multDoubleLinear437.o" "l_arm_unitConversion440.i";
connectAttr "middle_poser.t" "distanceBetween5.p1";
connectAttr "skin_6_poser.t" "distanceBetween5.p2";
connectAttr "finger_4_4_poser.t" "distanceBetween6.p1";
connectAttr "end_poser.t" "distanceBetween6.p2";
connectAttr "distanceBetween5.d" "plusMinusAverage3.i1[0]";
connectAttr "distanceBetween6.d" "plusMinusAverage3.i1[1]";
connectAttr "start_outJoint.wm" "multMatrix220.i[0]";
connectAttr "arm_root_connector.wim" "multMatrix220.i[1]";
connectAttr "connector_2.im" "multMatrix222.i[0]";
connectAttr "l_wing_main_2_group_multMat1.o" "multMatrix222.i[1]";
connectAttr "inbetweens_point_1_6.t" "distanceBetween8.p1";
connectAttr "l_clav_out_loc_2.wm" "multMatrix223.i[0]";
connectAttr "root_connector.wim" "multMatrix223.i[1]";
connectAttr "pairBlend84.or" "pairBlend94.ir1";
connectAttr "clav.im" "decomposeMatrix122.imat";
connectAttr "l_arm_size_multiplyDivide2.ox" "l_arm_makeNurbSphere4.r";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide2.i1x";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide2.i1y";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide2.i1z";
connectAttr "finger_4_4_poser.size" "l_arm_size_multiplyDivide2.i2x";
connectAttr "finger_3_4_poser.size" "l_arm_size_multiplyDivide2.i2y";
connectAttr "skin_9_poser.size" "l_arm_size_multiplyDivide2.i2z";
connectAttr "l_arm_size_multiplyDivide2.oy" "l_arm_makeNurbSphere5.r";
connectAttr "arm_root_connector.wm" "multMatrix224.i[0]";
connectAttr "controls.wim" "multMatrix224.i[1]";
connectAttr "fk_close_loc_3.m" "multMatrix225.i[0]";
connectAttr "fk_root_closedJoint.m" "multMatrix225.i[1]";
connectAttr "ik_root_closed.m" "multMatrix225.i[2]";
connectAttr "multMatrix225.o" "blendMatrix98.tgt[0].tmat";
connectAttr "control.close" "blendMatrix98.env";
connectAttr "middle_poserOrient.wm" "multMatrix226.i[0]";
connectAttr "start_poser.wim" "multMatrix226.i[1]";
connectAttr "fk_close_loc_2.t" "pairBlend96.it2";
connectAttr "fk_close_loc_2.r" "pairBlend96.ir2";
connectAttr "control.close" "pairBlend96.w";
connectAttr "end_poser.wm" "multMatrix227.i[0]";
connectAttr "middle_poserOrient.wim" "multMatrix227.i[1]";
connectAttr "fk_close_loc_1.r" "pairBlend97.ir2";
connectAttr "control.close" "pairBlend97.w";
connectAttr "mainPoser.dysplayPosers" "condition1.ft";
connectAttr "mainPoser.dysplayPosers" "condition2.ft";
connectAttr "clav.msg" "l_clav_tag.act";
connectAttr "start_poser.wim" "multMatrix232.i[1]";
connectAttr "wing_controls.wm" "multMatrix235.i[0]";
connectAttr "mainPoser.dysplayPosers" "condition3.ft";
connectAttr "clav_closed.t" "pairBlend98.it2";
connectAttr "clav_closed.r" "pairBlend98.ir2";
connectAttr "control.close" "pairBlend98.w";
connectAttr "control.iog" "arm_moduleControlSet.dsm" -na;
connectAttr "fk_moduleControlSet.msg" "arm_moduleControlSet.dnsm" -na;
connectAttr "ik_moduleControlSet.msg" "arm_moduleControlSet.dnsm" -na;
connectAttr "mainPoser.sx" "condition4.ft";
connectAttr "multiplyDivide357.o" "plusMinusAverage5.i3[0]";
connectAttr "middle_poser_locShape.wp" "plusMinusAverage5.i3[1]";
connectAttr "composeMatrix32.omat" "multMatrix242.i[0]";
connectAttr "start_poserOrient.wim" "multMatrix242.i[1]";
connectAttr "multMatrix242.o" "decomposeMatrix123.imat";
connectAttr "plusMinusAverage5.o3" "composeMatrix32.it";
connectAttr "start_poserOrient.wim" "decomposeMatrix124.imat";
connectAttr "mirror_condition.ocr" "composeMatrix33.isx";
connectAttr "composeMatrix33.omat" "multMatrix243.i[0]";
connectAttr "middle_outJoint.m" "multMatrix243.i[1]";
connectAttr "composeMatrix33.omat" "multMatrix243.i[2]";
connectAttr "multMatrix243.o" "decomposeMatrix125.imat";
connectAttr "multMatrix244.o" "decomposeMatrix126.imat";
connectAttr "composeMatrix33.omat" "multMatrix244.i[0]";
connectAttr "end_outJoint.m" "multMatrix244.i[1]";
connectAttr "composeMatrix33.omat" "multMatrix244.i[2]";
connectAttr "l_clav_joint.wm" "multMatrix245.i[0]";
connectAttr "outJoints.wim" "multMatrix245.i[1]";
connectAttr "multMatrix245.o" "decomposeMatrix127.imat";
connectAttr "a_finalJoint.wm" "multMatrix246.i[0]";
connectAttr "l_clav_joint.wim" "multMatrix246.i[1]";
connectAttr "multMatrix246.o" "decomposeMatrix128.imat";
connectAttr "l_arm_size_multiplyDivide2.oz" "l_arm_makeNurbSphere6.r";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide3.i1x";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide3.i1y";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide3.i1z";
connectAttr "skin_4_poser.size" "l_arm_size_multiplyDivide3.i2x";
connectAttr "skin_7_poser.size" "l_arm_size_multiplyDivide3.i2y";
connectAttr "skin_6_poser.size" "l_arm_size_multiplyDivide3.i2z";
connectAttr "l_arm_size_multiplyDivide3.ox" "l_arm_makeNurbSphere7.r";
connectAttr "l_arm_size_multiplyDivide3.oz" "l_arm_makeNurbSphere8.r";
connectAttr "l_arm_size_multiplyDivide3.oy" "l_arm_makeNurbSphere9.r";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide4.i1x";
connectAttr "skin_8_poser.size" "l_arm_size_multiplyDivide4.i2x";
connectAttr "l_arm_size_multiplyDivide4.ox" "l_arm_makeNurbSphere10.r";
connectAttr "l_arm_size_multiplyDivide5.oz" "l_arm_makeNurbSphere11.r";
connectAttr "l_arm_size_multiplyDivide5.oy" "l_arm_makeNurbSphere12.r";
connectAttr "l_arm_size_multiplyDivide5.ox" "l_arm_makeNurbSphere13.r";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide5.i1x";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide5.i1y";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide5.i1z";
connectAttr "finger_2_4_poser.size" "l_arm_size_multiplyDivide5.i2x";
connectAttr "finger_1_4_poser.size" "l_arm_size_multiplyDivide5.i2y";
connectAttr "skin_10_poser.size" "l_arm_size_multiplyDivide5.i2z";
connectAttr "l_arm_size_multiplyDivide6.oy" "l_arm_makeNurbSphere15.r";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide6.i1x";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide6.i1y";
connectAttr "mainPoser.globalSize" "l_arm_size_multiplyDivide6.i1z";
connectAttr "mainPoser.size1" "l_arm_size_multiplyDivide6.i2x";
connectAttr "mainPoser.size2" "l_arm_size_multiplyDivide6.i2y";
connectAttr "l_arm_size_multiplyDivide6.ox" "l_arm_makeNurbSphere16.r";
connectAttr "l_arm_control_group_multMatrix.o" "l_arm_control_group_decomposeMatrix.imat"
		;
connectAttr "control_initLoc.wm" "l_arm_control_group_multMatrix.i[0]";
connectAttr "start_poserOrient.wim" "l_arm_control_group_multMatrix.i[1]";
connectAttr "skin_10_poser.t" "multiplyDivide358.i1";
connectAttr "skin_10_poser.t" "multiplyDivide359.i1";
connectAttr "skin_11_poser.t" "multiplyDivide360.i1";
connectAttr "skin_11_poser.t" "multiplyDivide361.i1";
connectAttr "end_outJoint.wm" "multMatrix247.i[0]";
connectAttr "arm_root_connector.wim" "multMatrix247.i[1]";
connectAttr "finger_4_1_poser.wm" "multMatrix248.i[0]";
connectAttr "end_poser.wim" "multMatrix248.i[1]";
connectAttr "middle_poserOrient.wm" "multMatrix250.i[0]";
connectAttr "end_poser.wim" "multMatrix250.i[1]";
connectAttr "b_finalJoint.wm" "multMatrix251.i[0]";
connectAttr "b_finalJoint_init_direction.wim" "multMatrix251.i[1]";
connectAttr "multMatrix251.o" "decomposeMatrix133.imat";
connectAttr "decomposeMatrix133.or" "pairBlend100.ir2";
connectAttr "finger_1_1_poser.wm" "multMatrix252.i[0]";
connectAttr "end_poser.wim" "multMatrix252.i[1]";
connectAttr "skin_4_poser.wm" "multMatrix254.i[0]";
connectAttr "start_poser.wim" "multMatrix254.i[1]";
connectAttr "sec_1_root_init.wm" "multMatrix255.i[0]";
connectAttr "sec_controls_group.wim" "multMatrix255.i[1]";
connectAttr "main_end.wm" "multMatrix257.i[0]";
connectAttr "sec_controls_group.wim" "multMatrix257.i[1]";
connectAttr "sec_3_target_2_init.wm" "blendMatrix99.imat";
connectAttr "sec_3_target_1_init.wm" "blendMatrix99.tgt[0].tmat";
connectAttr "skin_1_poser.wm" "multMatrix258.i[0]";
connectAttr "main_root_initLoc.wim" "multMatrix258.i[1]";
connectAttr "l_arm_multiplyDivide353.ox" "l_arm_unitConversion1.i";
connectAttr "l_arm_size_multiplyDivide1.ox" "l_arm_makeNurbSphere2.r";
connectAttr "middle_poser.twist" "l_arm_unitConversion432.i";
connectAttr "root_twist_angleLoc_2.m" "l_arm_decomposeMatrix49.imat";
connectAttr "l_arm_decomposeMatrix49.or" "l_arm_unitConversion446.i";
connectAttr "finger_4_1_poser.wm" "multMatrix259.i[0]";
connectAttr "main_middle_direction.wim" "multMatrix259.i[1]";
connectAttr "finger_1_1_poser.wm" "multMatrix260.i[0]";
connectAttr "main_end_direction.wim" "multMatrix260.i[1]";
connectAttr "sec_3_root_init.wm" "multMatrix261.i[0]";
connectAttr "sec_controls_group.wim" "multMatrix261.i[1]";
connectAttr "finger_3_1_poser.wm" "multMatrix262.i[0]";
connectAttr "end_poser.wim" "multMatrix262.i[1]";
connectAttr "multMatrix265.o" "decomposeMatrix134.imat";
connectAttr "finger_3_1_poser.wm" "multMatrix263.i[0]";
connectAttr "finger_1_1_poser.wim" "multMatrix263.i[1]";
connectAttr "finger_3_1_poser.wm" "multMatrix264.i[0]";
connectAttr "finger_4_1_poser.wim" "multMatrix264.i[1]";
connectAttr "blendMatrix99.omat" "multMatrix265.i[0]";
connectAttr "sec_3_1_group.wim" "multMatrix265.i[1]";
connectAttr "finger_4_1_poser.wm" "multMatrix266.i[0]";
connectAttr "end_poser.wim" "multMatrix266.i[1]";
connectAttr "finger_2_1_poser.wm" "multMatrix268.i[0]";
connectAttr "end_poser.wim" "multMatrix268.i[1]";
connectAttr "sec_4_root_init.wm" "multMatrix269.i[0]";
connectAttr "sec_controls_group.wim" "multMatrix269.i[1]";
connectAttr "sec_4_target_2_init.wm" "blendMatrix100.imat";
connectAttr "sec_4_target_1_init.wm" "blendMatrix100.tgt[0].tmat";
connectAttr "blendMatrix100.omat" "multMatrix270.i[0]";
connectAttr "sec_4_1_group.wim" "multMatrix270.i[1]";
connectAttr "multMatrix270.o" "decomposeMatrix137.imat";
connectAttr "finger_2_1_poser.wm" "multMatrix271.i[0]";
connectAttr "finger_1_1_poser.wim" "multMatrix271.i[1]";
connectAttr "finger_2_1_poser.wm" "multMatrix272.i[0]";
connectAttr "finger_4_1_poser.wim" "multMatrix272.i[1]";
connectAttr "main_middle.wm" "multMatrix273.i[0]";
connectAttr "sec_controls_group.wim" "multMatrix273.i[1]";
connectAttr "skin_2_poser.wm" "multMatrix274.i[0]";
connectAttr "skin_1_poser.wim" "multMatrix274.i[1]";
connectAttr "skin_3_poser.wm" "multMatrix275.i[0]";
connectAttr "skin_2_poser.wim" "multMatrix275.i[1]";
connectAttr "finger_4_3_poser.wm" "multMatrix276.i[0]";
connectAttr "finger_4_2_poser.wim" "multMatrix276.i[1]";
connectAttr "finger_4_2_poser.wm" "multMatrix277.i[0]";
connectAttr "finger_4_1_poser.wim" "multMatrix277.i[1]";
connectAttr "finger_3_2_poser.wm" "multMatrix278.i[0]";
connectAttr "finger_3_1_poser.wim" "multMatrix278.i[1]";
connectAttr "finger_3_3_poser.wm" "multMatrix279.i[0]";
connectAttr "finger_3_2_poser.wim" "multMatrix279.i[1]";
connectAttr "finger_2_2_poser.wm" "multMatrix280.i[0]";
connectAttr "finger_2_1_poser.wim" "multMatrix280.i[1]";
connectAttr "finger_2_3_poser.wm" "multMatrix281.i[0]";
connectAttr "finger_2_2_poser.wim" "multMatrix281.i[1]";
connectAttr "finger_1_2_poser.wm" "multMatrix282.i[0]";
connectAttr "finger_1_1_poser.wim" "multMatrix282.i[1]";
connectAttr "finger_1_3_poser.wm" "multMatrix283.i[0]";
connectAttr "finger_1_2_poser.wim" "multMatrix283.i[1]";
connectAttr "decomposeMatrix134.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "multMatrix263.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "sec_3_target_2_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "multMatrix265.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "sec_3_target_1_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "multMatrix264.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "finger_3_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "sec_3_1_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "decomposeMatrix137.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "sec_4_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "sec_4_1_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "blendMatrix100.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn";
connectAttr "multMatrix270.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn";
connectAttr "sec_4_target_1_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "sec_4_target_2_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "finger_2_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "multMatrix271.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn";
connectAttr "multMatrix272.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn";
connectAttr "finger_4_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "sec_3_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn";
connectAttr "finger_1_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "main_end_direction.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "blendMatrix99.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn";
connectAttr "multMatrix266.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "multMatrix273.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "sec_4_root_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "sec_4_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "multMatrix268.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "multMatrix269.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "finger_2_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "sec_2_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "multMatrix260.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn";
connectAttr "sec_5_root_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn";
connectAttr "main_end_direction.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "main_middle.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn";
connectAttr "finger_1_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "sec_3_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn";
connectAttr "skin_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn";
connectAttr "main_root.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn";
connectAttr "main_root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "main_end.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn";
connectAttr "multMatrix261.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn";
connectAttr "multMatrix258.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn";
connectAttr "finger_3_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "sec_1_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn";
connectAttr "sec_3_root_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "multMatrix255.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn";
connectAttr "finger_4_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn"
		;
connectAttr "sec_controls_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn"
		;
connectAttr "sec_1_root_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn"
		;
connectAttr "sec_2_root_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn"
		;
connectAttr "multMatrix259.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn";
connectAttr "multMatrix262.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[30].dn";
connectAttr "multMatrix257.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[31].dn";
connectAttr "main_middle_direction.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[32].dn"
		;
connectAttr "sec_5_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[33].dn";
connectAttr "multMatrix252.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "main_end_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn";
connectAttr "finger_1_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "main_controls_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn"
		;
connectAttr "main_root_body_target.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn"
		;
connectAttr "sec_3_root_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[0].dn";
connectAttr "sec_controls_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[1].dn"
		;
connectAttr "sec_3_1_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[2].dn";
connectAttr "multMatrix261.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[3].dn";
connectAttr "multMatrix262.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[4].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[5].dn";
connectAttr "finger_3_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[6].dn"
		;
connectAttr "skin_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[0].dn";
connectAttr "skin_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[1].dn";
connectAttr "multMatrix274.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[2].dn";
connectAttr "skin_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[3].dn";
connectAttr "finger_3_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[4].dn"
		;
connectAttr "multMatrix276.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[5].dn";
connectAttr "feathers_1_2_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[6].dn"
		;
connectAttr "multMatrix277.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[7].dn";
connectAttr "finger_4_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[8].dn"
		;
connectAttr "feathers_1_2_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[9].dn"
		;
connectAttr "multMatrix275.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[10].dn";
connectAttr "finger_2_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[11].dn"
		;
connectAttr "finger_4_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[12].dn"
		;
connectAttr "feathers_5_2_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[13].dn"
		;
connectAttr "finger_3_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[14].dn"
		;
connectAttr "feathers_7_3_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[15].dn"
		;
connectAttr "finger_2_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[16].dn"
		;
connectAttr "feathers_1_3_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[17].dn"
		;
connectAttr "finger_4_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[18].dn"
		;
connectAttr "feathers_4_3_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[19].dn"
		;
connectAttr "multMatrix278.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[20].dn";
connectAttr "finger_2_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[21].dn"
		;
connectAttr "multMatrix279.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[22].dn";
connectAttr "feathers_5_3_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[23].dn"
		;
connectAttr "finger_1_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[24].dn"
		;
connectAttr "feathers_4_2_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[25].dn"
		;
connectAttr "finger_3_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[26].dn"
		;
connectAttr "multMatrix280.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[27].dn";
connectAttr "feathers_6_2_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[28].dn"
		;
connectAttr "feathers_6_3_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[29].dn"
		;
connectAttr "multMatrix281.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[30].dn";
connectAttr "finger_1_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[31].dn"
		;
connectAttr "multMatrix282.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[32].dn";
connectAttr "feathers_7_2_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[33].dn"
		;
connectAttr "multMatrix283.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[34].dn";
connectAttr "finger_1_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[35].dn"
		;
connectAttr "l_wing_root_decomposeMatrix1.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "l_wing_distanceBetween18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_wing_distanceBetween19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix167.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix168.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix175.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_ikFk_reverse.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_root_connector_decomposeMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_decomposeMatrix25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_fk_b_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_decomposeMatrix31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_decomposeMatrix33.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_fk_end_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_decomposeMatrix41.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_decomposeMatrix42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_decomposeMatrix43.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_decomposeMatrix44.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_multDoubleLinear435.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_rootMiddle_vector.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_rootEnd_vector.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_cosAngle_bewtweenVectors.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "l_arm_rootEnd_vectorNormalized_projected3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_rootMiddle_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_rootEnd_vectorNormalized.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "l_arm_rootMiddle_projected3.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "l_arm_rootMiddle_betweenPoint3.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "l_arm_frombetweenToMiddle_vector3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_middleOut_vectorNormalized3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "multiplyDivide357.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aimOffset_scaled.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_stretch_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_final_length_factor.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_init_length.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_final_length.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_stretch_blend.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_current_length_scaled.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "l_arm_init_length_a.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_init_length_b.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_init_lenth_minus_softIk.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "l_arm_length_difference.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_length_difference_minus.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "l_arm_length_difference_by_softIk.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_power.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_one_minus.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_one_minus_by_softIk.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_return_softIk.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_current_length.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_scale_to_translate_converter.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_softIk_value.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_softIk_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_snap_blend.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_current_rootToSnapPoint_length.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_current_toSnapPoint_length_scaled.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_current_endToSnapPoint_length.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_world_composeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_control_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_arm_multDoubleLinear437.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_volume_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_volume_blendColors.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_initScale1_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_initScaleEnd_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_decomposeMatrix49.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_multiplyDivide353.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_multDoubleLinear438.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_wing_distanceBetween22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "arm_middle_end_target_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors28.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors32.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors63.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors64.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors65.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix213.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix216.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix220.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix222.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix223.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix224.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix225.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix226.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix227.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix232.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix235.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix242.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix243.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix244.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix245.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix246.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "l_arm_size_multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide358.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide359.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide360.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide361.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix247.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix248.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix250.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix251.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix252.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix254.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix255.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix257.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix258.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix259.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix260.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix261.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix262.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix263.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix264.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix265.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix266.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix268.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix269.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix270.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix271.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix272.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix273.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix274.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix275.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix276.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix277.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix278.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix279.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix280.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix281.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix282.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix283.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "surfShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "l_arm_ikRPsolver1.msg" ":ikSystem.sol" -na;
// End of batWing.ma
