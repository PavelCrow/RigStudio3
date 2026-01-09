//Maya ASCII 2022 scene
//Name: foot2_movingPivot.ma
//Last modified: Fri, Dec 19, 2025 08:07:46 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "floatConstant" -nodeType "floatMath" "lookdevKit" "1.0";
requires -nodeType "ngst2SkinLayerData" -dataType "ngst2SkinLayerDataStorage" "ngSkinTools2" "2.4.0";
requires "chevelureMaya" "0.0.104 made in Khimki";
requires "BluePencil" "1.0";
requires "ngSkinTools" "1.0.960";
requires "mtoa" "5.0.0.1";
requires "Mayatomr" "2013.0 - 3.10.1.11 ";
requires "pk_softIk.py" "1.0";
requires "madHairsMaya.py" "Unknown";
requires "pk_blendMatrixNode.py" "1.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "BD69B14E-49C5-FC1D-B464-EC8BEEDD1ADD";
createNode transform -n "mod";
	rename -uid "004B43DA-47F7-458F-3E16-DB8E5B0E6C0C";
	addAttr -ci true -sn "ikFk" -ln "ikFk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -k on ".ikFk" 1;
createNode transform -n "posers" -p "mod";
	rename -uid "9A5C909A-43D5-5D22-9287-7A97ECC3E2C8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "F1CE2962-4BEA-0A02-9C99-B2A4341D1474";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "rollMaxAngle" -ln "rollMaxAngle" -dv 45 -min 0 -max 90 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.1;
	setAttr -k on ".rollMaxAngle";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "75D8738C-4247-A6E0-A6AF-469DE6343ACC";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "6CFC7BAF-4738-624A-6A93-82A51E877721";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-1.003391673827053 1.0033915826560398 1.0033907795050443
		-1.003391673827053 1.0033915826560398 -1.0033908676363192
		1.0033899733143172 1.0033915826560398 -1.0033908676363192
		1.0033899733143172 1.0033915826560398 1.0033907795050443
		-1.003391673827053 1.0033915826560398 1.0033907795050443
		1.0033899733143172 1.0033915826560398 1.0033907795050443
		1.0033899733143172 -1.003390064485324 1.0033907795050443
		-1.003391673827053 -1.003390064485324 1.0033907795050443
		-1.003391673827053 1.0033915826560398 1.0033907795050443
		-1.003391673827053 -1.003390064485324 1.0033907795050443
		-1.003391673827053 -1.003390064485324 -1.0033908676363192
		-1.003391673827053 1.0033915826560398 -1.0033908676363192
		-1.003391673827053 -1.003390064485324 -1.0033908676363192
		1.0033899733143172 -1.003390064485324 -1.0033908676363192
		1.0033899733143172 1.0033915826560398 -1.0033908676363192
		1.0033899733143172 -1.003390064485324 -1.0033908676363192
		1.0033899733143172 -1.003390064485324 1.0033907795050443
		;
createNode transform -n "mainPoser_clusterHandle" -p "mainPoser";
	rename -uid "9CB1DB14-456C-2EC3-2B7F-AB8E19705AC6";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "5F0741E2-45FB-A20C-3213-24970A385AC3";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "E81A0998-4280-CF5E-7763-D9B560936D72";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -4.4408920985006262e-16 1.5780937895153564 -1.6375900969857065 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "E7C4A81D-4AD2-6D5F-F2C0-BE9322AC6D37";
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
createNode locator -n "root_poser_locShape" -p "root_poser";
	rename -uid "7AFE231A-4A5A-EB58-3544-2F81D306B93F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "root_poserShapeOrig" -p "root_poser";
	rename -uid "D3CCB529-49B6-D852-5443-47B9F824F379";
	setAttr -k off ".v";
	setAttr ".io" yes;
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
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "553296F3-4596-6694-F680-168FBE52CEC5";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "9FA8DEC2-4E2A-610D-27A3-4CB89EF1D516";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_poserOrient_aimConstraint1" -p "root_poserOrient";
	rename -uid "200D2AC5-4B36-2351-8C4E-1A9142468DF7";
	addAttr -ci true -sn "w0" -ln "toe_poserW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 89.999999999999957 -74.491494205683381 -89.999999999999972 ;
	setAttr -k on ".w0";
createNode transform -n "heelFk_initLoc" -p "root_poserOrient";
	rename -uid "3E78C85C-449C-275C-0D02-CF94742C1F38";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 4.00593428432545e-32 1.6653345369377346e-16 ;
	setAttr ".r" -type "double3" -1.2405201672726248e-14 -3.180554681463516e-15 -1.2722218725854064e-14 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000009 1.0000000000000004 ;
createNode locator -n "heelFk_initLocShape" -p "heelFk_initLoc";
	rename -uid "E09DE1DD-47B1-3E3C-9C35-C0B95B4AAA6A";
	setAttr -k off ".v";
createNode transform -n "root_initLoc" -p "root_poserOrient";
	rename -uid "8F1C9A36-499C-C4DE-F096-FBAB829FFFBA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 4.00593428432545e-32 1.6653345369377346e-16 ;
	setAttr ".r" -type "double3" -1.2405201672726248e-14 -3.180554681463516e-15 -1.2722218725854064e-14 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000009 1.0000000000000004 ;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "6C03E84D-46FB-2E92-C559-D890E4D97F73";
	setAttr -k off ".v";
createNode transform -n "ik_foot_initLoc" -p "root_poser";
	rename -uid "303601D7-40F7-B8F3-D0A7-98BB11BDB955";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "ik_foot_initLocShape" -p "ik_foot_initLoc";
	rename -uid "12B2CA7B-4316-0D2C-1251-AFA47EF16E15";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ik_heel_initLoc" -p "root_poser";
	rename -uid "BF794FA8-4F99-A99A-D70B-17B6E6E679B9";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 6.2306345547044604e-15 0 0 ;
	setAttr -k on ".r";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode locator -n "ik_heel_initLocShape" -p "ik_heel_initLoc";
	rename -uid "F564CCC7-4597-036B-0E0D-FCB91236E277";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "fk_heel_initLoc" -p "root_poser";
	rename -uid "319638F6-4EB1-C3A2-12A3-E49765F8C4ED";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "fk_heel_initLocShape" -p "fk_heel_initLoc";
	rename -uid "0CC6CE6D-49CD-4EF7-A292-E69D6887E740";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "toe_poser" -p "mainPoser";
	rename -uid "D2BFDB8B-4F09-BCB9-0D66-A0BF585AC2DC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0.317997446773577 0.0060782896806902409 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "toe_poserShape" -p "toe_poser";
	rename -uid "D9D348A9-4B5C-B4A1-332F-FDA4A7F5E813";
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
createNode locator -n "toe_poser_locShape" -p "toe_poser";
	rename -uid "AB1916D5-46A6-251C-2144-29A566B729F2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "toe_poserShapeOrig" -p "toe_poser";
	rename -uid "4D36D06C-4D57-CB76-F421-819761CF1200";
	setAttr -k off ".v";
	setAttr ".io" yes;
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
createNode transform -n "toe_poserOrient" -p "toe_poser";
	rename -uid "1F478429-4BA4-460F-5CD2-0CA8FD98EA49";
createNode locator -n "toe_poserOrientShape" -p "toe_poserOrient";
	rename -uid "990E4AD4-44DE-CDBC-5251-1FA2928BF0F4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_toe_initLoc" -p "toe_poserOrient";
	rename -uid "A2DB7494-4BA6-0065-1640-EE8A66851169";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 90 0 90 ;
	setAttr -k on ".r";
createNode locator -n "ik_toe_initLocShape" -p "ik_toe_initLoc";
	rename -uid "0196E461-40D8-B9F1-7965-C3979293EB11";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "toe_poserOrient_aimConstraint1" -p "toe_poserOrient";
	rename -uid "9BDAAA8E-439A-38BF-C964-218783A1EE73";
	addAttr -ci true -sn "w0" -ln "toeTip_poserW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -90 -89.999999999999986 0 ;
	setAttr -k on ".w0";
createNode transform -n "fk_toe_initLoc" -p "toe_poserOrient";
	rename -uid "2C2CBA73-42F6-2ED2-ABA6-A097A280B83E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.110223024625156e-16 -1.4190121778238994e-16 1.6653345369377358e-16 ;
	setAttr ".r" -type "double3" 1.272221872585407e-14 1.2722218725854061e-14 -1.272221872585407e-14 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000004 ;
createNode locator -n "fk_toe_initLocShape" -p "fk_toe_initLoc";
	rename -uid "523C705F-4AF0-612A-FC63-54958522C86C";
	setAttr -k off ".v";
createNode transform -n "toe_initLoc" -p "toe_poserOrient";
	rename -uid "1CFA01AA-4DDE-56E2-5B77-F3B14DEF7C1D";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "toe_initLocShape" -p "toe_initLoc";
	rename -uid "D9281301-4FE1-CCF2-3D9C-9EB625525DBF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "toeTip_poser" -p "mainPoser";
	rename -uid "253F2FCD-4567-140B-EB2D-5CAB813C4007";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0.317997446773577 1.5400551876831834 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -k off ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "toeTip_poserShape" -p "toeTip_poser";
	rename -uid "BF2631FA-490B-338F-77AD-888D4C783E8B";
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
createNode locator -n "toeTip_poser_locShape" -p "toeTip_poser";
	rename -uid "0FF35650-4ADB-7A54-1A08-ECA0596B79A3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "toeTip_poserShapeOrig" -p "toeTip_poser";
	rename -uid "FB0B44B2-49BD-0E25-A184-0DA36C1F920B";
	setAttr -k off ".v";
	setAttr ".io" yes;
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
createNode transform -n "toeTip_poserOrient" -p "toeTip_poser";
	rename -uid "C798CCB6-4987-D2DE-2B8A-F4BDB43CE471";
createNode locator -n "toeTip_poserOrientShape" -p "toeTip_poserOrient";
	rename -uid "A9CE689B-4C17-A497-4268-82A9E64BAD0F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "toeTip_initLoc" -p "toeTip_poserOrient";
	rename -uid "8AE9E2FE-4C9E-6E88-8A62-F98E2ABBBBE1";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "toeTip_initLocShape" -p "toeTip_initLoc";
	rename -uid "0E8B26C7-4CA6-7B4D-5E59-84AE14009FAD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "toeTip_poserOrient_aimConstraint1" -p "toeTip_poserOrient";
	rename -uid "8AB350FE-435B-0B99-9D45-A69BB02BDA43";
	addAttr -ci true -sn "w0" -ln "toe_poserW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -90 89.999999999999986 0 ;
	setAttr -k on ".w0";
createNode transform -n "toeIk_initLoc" -p "toeTip_poserOrient";
	rename -uid "76BF29F9-45CB-4250-8E3F-DFB8B6089F49";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 4.9303806576313238e-32 0 ;
	setAttr ".r" -type "double3" 90.000000000000014 2.544443745170814e-14 89.999999999999986 ;
createNode locator -n "toeIk_initLocShape" -p "toeIk_initLoc";
	rename -uid "2F58A160-4D89-3531-4A1B-42BBE6FE6520";
	setAttr -k off ".v";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "437819C8-4967-CCE8-14F0-F68D7B9CDD52";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "AA550525-4020-CAC8-A501-32BB4D29ABCB";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		-4.4408920985006262e-16 1.5780937895153564 -1.6375900969857065
		0 0.317997446773577 0.0060782896806902409
		0 0.317997446773577 1.5400551876831834
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "17A2E555-4EE7-B461-1C57-A69EF849B3FD";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "B539DBCD-437C-C923-D9C6-18AE1658005C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "BC6E858B-4C05-171C-F8F4-15BD7445E31E";
	setAttr ".v" no;
createNode transform -n "fk_connector_init" -p "input";
	rename -uid "300D2F9E-40C4-2F13-FBB4-F38F52275D1C";
createNode transform -n "fk_connector" -p "fk_connector_init";
	rename -uid "92A8DD67-4CF3-0069-38FB-259CFEF80B78";
createNode locator -n "fk_connectorShape" -p "fk_connector";
	rename -uid "3A9B2FE0-45B6-CFAF-D0A6-15B34CF6926F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_init" -p "input";
	rename -uid "94918467-4B04-F000-05B1-C3B649926E92";
createNode transform -n "ikRev_connector" -p "ik_init";
	rename -uid "3106DD3C-43AC-7638-1134-9C95C76F1E2F";
createNode locator -n "ikRev_connectorShape" -p "ikRev_connector";
	rename -uid "EE31122E-4169-A979-6C4D-6D8E8B5AE1D3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_connector_group" -p "input";
	rename -uid "6F2BB9B8-4A8B-93E4-3855-F88558BE8BB3";
createNode transform -n "root_connector" -p "root_connector_group";
	rename -uid "B2818BEF-4915-E97E-8CC2-4A83F566CF0B";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "A95F7EC2-4DE2-4281-FB1D-C5922CB38FB4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_connector" -p "root_connector";
	rename -uid "BDCC3CA1-468B-A043-4119-0E8320596272";
createNode locator -n "ik_connectorShape" -p "ik_connector";
	rename -uid "C3A50979-4643-DE57-BA96-D49C0F25581B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "controls" -p "mod";
	rename -uid "F680D12C-4955-38FB-2310-3E93D893FBFE";
createNode transform -n "ik_controls" -p "controls";
	rename -uid "1D4898FC-4A45-D919-A3D8-38BF57443E5B";
createNode transform -n "global_group" -p "ik_controls";
	rename -uid "A032440C-42AB-3F1C-71CD-6F81F85FBEB2";
createNode transform -n "mirror_group" -p "global_group";
	rename -uid "C9803774-446A-EF7C-E7F9-F081F3B40199";
createNode transform -n "edge" -p "mirror_group";
	rename -uid "F7117520-4D5C-567E-67D1-C39BB01B81EA";
	setAttr -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "edgeShape" -p "edge";
	rename -uid "A82720C3-4587-1C55-1039-CFB4761D3F61";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.98018471593474932 -1.5780937895153577 -0.89594935550537247
		-0.046284369813607798 -1.5780937895153577 -1.2401523601851192
		-1.0057768083362173 -1.5780937895153577 -0.8414960825589719
		-1.1219922305660874 -1.5780937895153571 1.0286833978316885
		-1.1852995033738718 -1.5780937895153582 3.1804281077325167
		0.11927344453782281 -1.5780937895153599 3.585113255168745
		1.3226934636201459 -1.5780937895153582 2.9219300852990591
		1.2614494810429389 -1.5780937895153571 1.1338805559333709
		0.98018471593474932 -1.5780937895153577 -0.89594935550537247
		-0.046284369813607798 -1.5780937895153577 -1.2401523601851192
		-1.0057768083362173 -1.5780937895153577 -0.8414960825589719
		;
createNode transform -n "footTwistFront_group" -p "mirror_group";
	rename -uid "5A84512C-4460-C2B8-0D2E-28833D0F574E";
createNode transform -n "heel_rotate_group" -p "footTwistFront_group";
	rename -uid "E43CB031-46FE-0AE3-0AEF-C99DF91448A7";
	setAttr ".rp" -type "double3" 0.00049783343935399778 -0.3179974467735785 -2.7605023320195845 ;
	setAttr ".hdl" -type "double3" -0.036222707184227224 0.00013758212054609809 -0.3064536180022952 ;
createNode transform -n "group1" -p "heel_rotate_group";
	rename -uid "1C303B68-42DA-6A25-05F5-EAA4C2431C09";
	setAttr ".rp" -type "double3" 3.105372885370086e-16 -0.29255483310773323 1.7704611451864523 ;
	setAttr ".sp" -type "double3" 3.105372885370086e-16 -0.29255483310773323 1.7704611451864523 ;
	setAttr ".hdl" -type "double3" 3.105372885370086e-16 -0.29255483310773323 1.7704611451864523 ;
	setAttr ".dh" yes;
createNode transform -n "group2" -p "group1";
	rename -uid "B5EA1609-4269-A7D2-4040-AA921AE91C71";
	setAttr ".rp" -type "double3" -1.1864284583205821e-15 0.42127011201035452 3.7802412139941439 ;
	setAttr ".sp" -type "double3" -1.1864284583205821e-15 0.42127011201035452 3.7802412139941439 ;
createNode transform -n "locator7_group" -p "group2";
	rename -uid "66CC2798-466A-3F75-1030-5AB05E5F538A";
	setAttr ".t" -type "double3" -1.3887810887837574e-15 5.5511151231257827e-17 2.7762421305126166 ;
	setAttr ".r" -type "double3" -20.082650530297506 0 0 ;
createNode transform -n "locator7" -p "locator7_group";
	rename -uid "FB2BA89D-4607-893C-F223-1595F7E077CC";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 0 ;
createNode locator -n "locatorShape7" -p "locator7";
	rename -uid "76A5252D-4094-267C-2D0D-C29B38D84259";
	setAttr -k off ".v";
createNode transform -n "group3" -p "locator7";
	rename -uid "5CA81F21-43B1-38E1-2027-CFA8CC6BA4B3";
	setAttr ".t" -type "double3" 1.388781088783757e-15 0.95329301900283681 -2.607441808967879 ;
	setAttr ".r" -type "double3" 20.082650530297506 0 0 ;
createNode transform -n "toeBall_group" -p "group3";
	rename -uid "4A82C6A3-4460-B9B6-AD72-0BA15469EE98";
	setAttr ".t" -type "double3" -2.4651903288156619e-32 -2.2204460492503131e-16 1.1102230246251565e-16 ;
createNode transform -n "init_group" -p "toeBall_group";
	rename -uid "4AF43D49-44A7-F096-747B-8EB23AA8DEE9";
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode joint -n "ik_heel_controlJoint" -p "init_group";
	rename -uid "1C9897B3-491F-5C71-F38D-5380EE3239EB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 180 -52.524905441792917 1.1091259233818373e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -89.999999999999986 ;
	setAttr ".bps" -type "matrix" 0.02178910274156521 -0.21148844161664251 0.47455018076519745 0
		 0.0097003304467306456 0.47505014373491566 0.21126586218947027 0 -0.51945272989073965 -1.9333763479068008e-11 0.02385081568957868 0
		 0.12022212159279939 0.083215564463563471 -0.019470306162142608 1;
	setAttr ".radi" 0.2;
createNode joint -n "ik_toe_controlJoint" -p "ik_heel_controlJoint";
	rename -uid "7FB44C81-498F-5B3E-6966-C885194CCFD6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" -1.3787541628618016e-14 37.781747866287418 4.8329334073575751e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.023850815689578496 6.8483668458352298e-08 0.51945272989073521 0
		 1.1524872769919701e-08 0.51999999999999535 -6.9084987254693111e-08 0 -0.51945272989073954 1.4681461364769682e-08 0.023850815689576737 0
		 0.12667875144753837 0.020546504508678176 0.1211502095627012 1;
	setAttr ".radi" 0.2;
createNode joint -n "toeTip_controlJoint" -p "ik_toe_controlJoint";
	rename -uid "0D19C5F9-4C00-A173-6252-52859992CF32";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 1.5339769124984741 5.5077470362263625e-17 -1.1275702593849246e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".radi" 0.2;
createNode ikEffector -n "ik_toe_eff" -p "ik_toe_controlJoint";
	rename -uid "AA3B298F-491B-559E-1E4A-6FBA3FAD13F6";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "ik_toe_controlJoint_out" -p "ik_toe_controlJoint";
	rename -uid "9B48B7AE-4741-E35A-013C-C1AF859BFF72";
createNode ikEffector -n "ik_heel_eff" -p "ik_heel_controlJoint";
	rename -uid "20C6D89D-4ADE-8EE8-269C-19BE7894F44C";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "ik_heel_controlJoint_pointConstraint1" -p "ik_heel_controlJoint";
	rename -uid "B7C4A884-4F1C-4CC0-CC81-9BA7C35CD95C";
	addAttr -ci true -k true -sn "w0" -ln "l_foot_ik_inputW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -2.7755575615628914e-17 0 2.7755575615628914e-17 ;
	setAttr -k on ".w0";
createNode transform -n "ik_heel_controlJoint_out" -p "ik_heel_controlJoint";
	rename -uid "CF284444-4A59-8F6A-B51F-DD86E786D9E1";
createNode transform -n "target" -p "init_group";
	rename -uid "D7AD994F-4345-DAAD-46E3-5DB87EDE635F";
	setAttr ".v" no;
createNode locator -n "targetShape" -p "target";
	rename -uid "A5154480-4550-F728-8E0F-EB92E9C78A70";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode ikHandle -n "ik_heel_ikh" -p "toeBall_group";
	rename -uid "BE826577-4272-7F38-C1A9-F8BCAD7E9978";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ik_heel_ikh_poleVectorConstraint1" -p "ik_heel_ikh";
	rename -uid "8132BC5D-4009-9EF5-CD92-3FBE6470C608";
	addAttr -ci true -k true -sn "w0" -ln "heel_upvW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.46201653665756498 -0.27487944394184938 0.32436675746938981 ;
	setAttr -k on ".w0";
createNode transform -n "ik_heel_upv" -p "toeBall_group";
	rename -uid "B9C54E27-4611-5AFB-C70B-559461370688";
	setAttr -l on -k off ".v" no;
	setAttr -k on ".t" -type "double3" 0.4293629850371482 -5.8321940779144813e-17 3.4694469519536191e-17 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "ik_heel_upvShape" -p "ik_heel_upv";
	rename -uid "641BA7E2-478E-9BCA-CE02-E1ABE1DADBD7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_toe_group" -p "group3";
	rename -uid "600D34F3-44F8-32EC-4A41-06A1E9C2873A";
	setAttr ".t" -type "double3" 7.5335549205362779e-17 0.0081901169910452154 -0.0037260654737204801 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode transform -n "ik_toe" -p "ik_toe_group";
	rename -uid "3B4998D0-476C-E1EC-A9F0-E3A53C9C2ADF";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "ik_toeShape" -p "ik_toe";
	rename -uid "89008E01-4D1C-960A-1785-BF806B94BCF5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 3 3 3 4 5 5 5
		5
		1.1418007084602426e-13 -0.12540393397359312 2.577370634701202
		-4.8821617794113873e-14 0.27283567606415882 2.6097238057771421
		-1.1379966714006797e-13 0.67471357395765552 2.478539396407001
		-4.9987754561306136e-14 0.95168906505020379 2.0705862459735882
		1.141497815793441e-13 0.97025990710104504 1.7589958892741115
		;
createNode ikHandle -n "ik_toe_ikh" -p "ik_toe";
	rename -uid "ABF6710F-44AB-1E71-B0B1-AD95067C74B5";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ik_toe_ikh_poleVectorConstraint1" -p "ik_toe_ikh";
	rename -uid "4E5CB2A1-475A-AE0D-2085-4E8A5DCD8199";
	addAttr -ci true -k true -sn "w0" -ln "heel_upv1W0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.46201653665756498 -3.3454028436352701e-09 0.33051212757361936 ;
	setAttr -k on ".w0";
createNode transform -n "ik_toe_upv" -p "ik_toe";
	rename -uid "2E5B13F4-49AF-CF91-8BE3-AEAD17C2F09C";
	setAttr -k off ".v" no;
	setAttr -k on ".t" -type "double3" 1 -1.0408340855860843e-17 1.5339769124984741 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "ik_toe_upvShape" -p "ik_toe_upv";
	rename -uid "997B1966-4472-0245-BCA9-559AE2C63565";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "curve1" -p "group3";
	rename -uid "7A5FF459-41AE-3264-C1D1-6285AD8B3F78";
	setAttr ".t" -type "double3" -1.9870242630123517e-16 -0.30244224519888308 1.7634834861725723 ;
createNode nurbsCurve -n "curveShape1" -p "curve1";
	rename -uid "EF5BDDE7-4347-DABA-4408-6C8B1FB228E3";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "curve3" -p "group3";
	rename -uid "9FBE1DB1-4AF0-9CA7-3931-89855F90A817";
	setAttr ".t" -type "double3" -1.8806418767138689e-16 0.18653562275699054 1.6057812699458434 ;
createNode nurbsCurve -n "curveShape3" -p "curve3";
	rename -uid "E4AD5F75-4B1D-2FB3-D0CA-D48C9DE50C30";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "inner_edge" -p "mirror_group";
	rename -uid "0BAB7C3B-412A-42E8-17E1-34A3F70882DD";
	setAttr -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "inner_edgeShape" -p "inner_edge";
	rename -uid "A6F21918-41DE-CB3D-886B-36A267270E1C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.97613543626929766 -1.5780937895153566 -0.79666925708248493
		-0.035422976316902839 -1.5780937895153564 -0.84757683330476952
		-0.99865940377308215 -1.5780937895153575 -0.69994598879975067
		-1.0095170851908484 -1.5780937895153571 1.035926181839308
		-1.066844212509414 -1.5780937895153591 2.0303848605029615
		0.027824760293642059 -1.5780937895153604 2.2250863117279938
		1.1620900214157841 -1.5780937895153599 1.9741953523025821
		1.0954659041863481 -1.5780937895153571 1.1311861829193868
		0.97613543626929766 -1.5780937895153566 -0.79666925708248493
		-0.035422976316902839 -1.5780937895153564 -0.84757683330476952
		-0.99865940377308215 -1.5780937895153575 -0.69994598879975067
		;
createNode transform -n "ik_foot_group" -p "ik_controls";
	rename -uid "913F2277-466B-0B47-6A74-8694534F793D";
createNode transform -n "ik_foot_PH" -p "ik_foot_group";
	rename -uid "EB955995-4BD6-5ECB-D8C3-B6B847E7B7FD";
	setAttr ".rp" -type "double3" -5.5511151231257876e-17 0 -2.2204460492503131e-16 ;
	setAttr ".sp" -type "double3" -5.5511151231257876e-17 0 -2.2204460492503131e-16 ;
createNode transform -n "ik_foot_SN" -p "ik_foot_PH";
	rename -uid "6D02EEEE-458B-895C-D05E-8EB2525D0E4E";
	setAttr ".t" -type "double3" 0 0 -2.2204460492503131e-16 ;
	setAttr ".rp" -type "double3" -5.5511151231257876e-17 0 -2.2204460492503131e-16 ;
	setAttr ".sp" -type "double3" -5.5511151231257876e-17 0 -2.2204460492503131e-16 ;
createNode transform -n "ik_foot" -p "ik_foot_SN";
	rename -uid "9F72130A-4919-3650-9326-95B449ABF574";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 0 0 -2.2204460492503131e-16 ;
	setAttr ".ro" 3;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -5.5511151231257827e-17 0 1.3877787807814457e-17 ;
	setAttr -l on ".rpx";
	setAttr -l on ".rpy";
	setAttr -l on ".rpz";
	setAttr ".sp" -type "double3" -5.5511151231257827e-17 0 1.3877787807814457e-17 ;
	setAttr -l on ".spx";
	setAttr -l on ".spy";
	setAttr -l on ".spz";
	setAttr ".hdl" -type "double3" 0 -0.004 0.22821699418391136 ;
	setAttr ".mirrorShape" yes;
createNode nurbsCurve -n "ik_footShape" -p "ik_foot";
	rename -uid "949B5C4A-4AFB-9DD8-EB1C-F7B41577D530";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.99602792543558571 -1.5780937895153568 -1.7474742563270811
		-0.13673923242016692 -1.5780937895153568 -2.216489201535035
		-1.2695063902759283 -1.5780937895153568 -1.7474650692913598
		-2.2061198455564868 -1.5780937895153568 0.97150380893937172
		-1.705478804112474 -1.5780937895153568 3.7755373558395924
		-0.13673923242016789 -1.5780937895153568 4.48990951259717
		1.4320003392721345 -1.5780937895153568 3.7761945434367412
		1.9326413807161484 -1.5780937895153568 0.97259823738051399
		0.99602792543558571 -1.5780937895153568 -1.7474742563270811
		-0.13673923242016692 -1.5780937895153568 -2.216489201535035
		-1.2695063902759283 -1.5780937895153568 -1.7474650692913598
		;
createNode transform -n "ik_heel_group" -p "ik_foot";
	rename -uid "DF92266B-4133-587F-46FB-B5B7B23EC918";
createNode transform -n "ik_heel_scaleControl" -p "ik_heel_group";
	rename -uid "A482E93E-4311-A96F-7155-8BA851C909AC";
createNode transform -n "ik_heel" -p "ik_heel_scaleControl";
	rename -uid "CA625AA1-420B-6C4C-38CE-7CA24CBFDE92";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "heelOffset" -ln "heelOffset" -at "double";
	setAttr -l on -k off ".v";
	setAttr -s 2 ".iog";
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mnrl" -type "double3" -90 -45 -90 ;
	setAttr ".mxrl" -type "double3" 90 45 90 ;
	setAttr ".mrxe" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrze" yes;
	setAttr -k on ".weight" 0;
	setAttr -k on ".heelOffset";
createNode nurbsCurve -n "ik_heelShape" -p "ik_heel";
	rename -uid "9EBD3AE9-4168-E55A-F270-84B5C792EE2D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.5275430619158562 3.8303888462381798e-17 -0.53424298293637063
		-0.0067941606134548161 3.8303888462381798e-17 -0.75557362864478983
		-0.54113377104464977 3.8303888462381798e-17 -0.53424298293637063
		-0.73852276098230363 3.8303888462381798e-17 9.4422665417642697e-05
		-0.54113377104464977 3.8303888462381798e-17 0.53443464599142831
		-0.0067941606134548161 3.8303888462381798e-17 0.75576529169984918
		0.5275430619158562 3.8303888462381798e-17 0.53443464599142831
		0.74887370762427496 3.8303888462381798e-17 9.4422665417642697e-05
		0.5275430619158562 3.8303888462381798e-17 -0.53424298293637063
		-0.0067941606134548161 3.8303888462381798e-17 -0.75557362864478983
		-0.54113377104464977 3.8303888462381798e-17 -0.53424298293637063
		;
createNode nurbsCurve -n "ik_heelShape1" -p "ik_heel";
	rename -uid "5A15C83F-4911-AE53-305D-C29D708CAA8F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.52969664736967781 0.53434080438213616 0.00011534254094137644
		-0.0046409731432811713 0.75567145009055448 0.00011534254094137644
		-0.53898018559082717 0.53434080438213616 0.00011534254094137644
		-0.73636917552848224 3.8303888462381798e-17 0.00011534254094137644
		-0.53898018559082717 -0.5343408043821356 0.00011534254094137644
		-0.0046409731432811713 -0.75567145009055448 0.00011534254094137644
		0.52969664736967781 -0.5343408043821356 0.00011534254094137644
		0.75102729307809557 3.8303888462381798e-17 0.00011534254094137644
		0.52969664736967781 0.53434080438213616 0.00011534254094137644
		-0.0046409731432811713 0.75567145009055448 0.00011534254094137644
		-0.53898018559082717 0.53434080438213616 0.00011534254094137644
		;
createNode nurbsCurve -n "ik_heelShape2" -p "ik_heel";
	rename -uid "BA579B65-434E-9685-11F2-30B62ECD95F6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-0.0046409731432811713 0.53434080438213616 -0.53422585186516902
		-0.0046409731432811713 3.8303888462381798e-17 -0.75555649757358823
		-0.0046409731432811713 -0.5343408043821356 -0.53422585186516902
		-0.0046409731432811713 -0.75567145009055448 0.00011534254094137644
		-0.0046409731432811713 -0.5343408043821356 0.53445575689910318
		-0.0046409731432811713 3.8303888462381798e-17 0.75578640260752306
		-0.0046409731432811713 0.53434080438213616 0.53445575689910318
		-0.0046409731432811713 0.75567145009055448 0.00011534254094137644
		-0.0046409731432811713 0.53434080438213616 -0.53422585186516902
		-0.0046409731432811713 3.8303888462381798e-17 -0.75555649757358823
		-0.0046409731432811713 -0.5343408043821356 -0.53422585186516902
		;
createNode transform -n "autoAnkle_static" -p "ik_heel";
	rename -uid "BFF1A6BF-4EFB-E114-8C2F-07898E360CF5";
	setAttr ".v" no;
createNode locator -n "autoAnkle_staticShape" -p "autoAnkle_static";
	rename -uid "E6006C0C-4AF2-ADAB-1D7C-AB832C3197B9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "autoAnkle_up" -p "ik_heel";
	rename -uid "7007F1A4-40F4-42EB-2300-C7886580192B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.70160862753044917 0 0 ;
createNode locator -n "autoAnkle_upShape" -p "autoAnkle_up";
	rename -uid "7ACD6BDB-4092-743D-8850-FEAE7A8CAFAB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "autoAnkle_aim" -p "ik_heel";
	rename -uid "9540A5EC-4280-4973-EF79-4988B3F6BACE";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 93.439640971989036 -81.281485359048816 -93.399989553030338 ;
createNode locator -n "autoAnkle_aimShape" -p "autoAnkle_aim";
	rename -uid "EA3450AA-4196-5B66-C936-0FBA7742A0BD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "distant_loc" -p "ik_foot";
	rename -uid "7EFFBE01-47BB-214C-60C2-80BE0C01C3C0";
	setAttr ".t" -type "double3" -8.6377289793194671e-17 -100.61918701289864 0.30239365746216418 ;
createNode locator -n "distant_locShape" -p "distant_loc";
	rename -uid "4D22E5DB-4C5A-4D3C-BF1D-72A0A69210ED";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_controls" -p "controls";
	rename -uid "231D8495-438C-8A24-FD6E-6D9B93B62C87";
	setAttr ".t" -type "double3" 0 -6.9388939039072284e-18 -1.3877787807814457e-17 ;
	setAttr ".r" -type "double3" -3.180554681463516e-15 0 -1.1927080055488188e-15 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode transform -n "fk_heel_group_2" -p "fk_controls";
	rename -uid "814D98BD-473F-8788-61D4-EFA16EE8FFED";
createNode transform -n "fk_heel_group" -p "fk_heel_group_2";
	rename -uid "D8D424C4-4DD9-5B23-B6FB-06AD788B6ABD";
createNode transform -n "fk_heel" -p "fk_heel_group";
	rename -uid "D695846F-48DF-9622-9262-E38D48D810DE";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 1;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "fk_heelShape" -p "fk_heel";
	rename -uid "8CAA227B-4386-2E4F-FA1B-1FA076D968CB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-0.14684734039608022 -0.14682548187736225 0.019743609954772246
		-0.18665966599068798 -0.0037041488560489548 0.019743727310435666
		-0.14684734039607994 0.13941777978694883 0.019743609954772246
		-0.0090598853719320929 0.1987002274038191 0.01974324354594548
		0.12872813587799273 0.13941777978694889 0.01974287713561328
		0.18580102205462681 -0.0037041488560489145 0.019742725365560678
		0.12872813587799276 -0.14682548187736216 0.01974287713561328
		-0.0090598853719320842 -0.20610895037330221 0.01974324354594548
		-0.14684734039608022 -0.14682548187736225 0.019743609954772246
		-0.18665966599068798 -0.0037041488560489548 0.019743727310435666
		-0.14684734039607994 0.13941777978694883 0.019743609954772246
		;
createNode transform -n "fk_heel_reverse_group" -p "fk_heel";
	rename -uid "1D54C242-468F-BB4C-9E35-488F334BA826";
createNode joint -n "fk_heel_controlJoint" -p "fk_heel_reverse_group";
	rename -uid "402D79B1-42AA-D392-3D61-F5906B944063";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.02178910274156521 -0.21148844161664251 0.47455018076519745 0
		 0.0097003304467306456 0.47505014373491566 0.21126586218947027 0 -0.51945272989073965 -1.9333763479068008e-11 0.02385081568957868 0
		 0.12022212159279939 0.083215564463563471 -0.019470306162142608 1;
	setAttr ".radi" 0.2;
createNode transform -n "fk_toe_group_3" -p "fk_heel_reverse_group";
	rename -uid "483550FD-44D3-D995-5825-98ABD8EC9627";
	setAttr ".t" -type "double3" -1.1102230246251565e-16 1.9721522630525295e-31 6.9388939039072284e-17 ;
	setAttr ".r" -type "double3" 9.1809250999443306e-30 3.1805546814635168e-15 -7.0622500768802538e-30 ;
createNode transform -n "fk_toe_group_2" -p "fk_toe_group_3";
	rename -uid "B70E1E8C-49FA-3854-6B72-07AA3A2E721E";
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode transform -n "fk_toe_group" -p "fk_toe_group_2";
	rename -uid "B2588B30-43F3-A92B-C54E-2FA7ED9D1848";
createNode transform -n "fk_toe" -p "fk_toe_group";
	rename -uid "F82355E5-4AB5-2D85-A246-DD88C08DC3D4";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "fk_toeShape" -p "fk_toe";
	rename -uid "0A3B2A47-428A-7F69-8884-BC87DA65A00B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.6541209790342554e-06 -0.1401125128093402 -0.097983135445901204
		3.0935387022791127e-06 0.00087510152591874506 -0.11650100456405103
		2.6541209789787442e-06 0.1415008625054516 -0.097983135964808205
		-8.8669101361664909e-17 0.20008339964704441 -3.6867819127456286e-10
		-2.0995326384556436e-06 0.12739526473554144 0.089526949614531962
		-3.0933724961194732e-06 -0.00046738178980090458 0.12271252158079377
		-2.1001296947556173e-06 -0.12307925888999172 0.089526950076061804
		3.8328224590008125e-18 -0.20008339964704489 3.686779796382989e-10
		2.6541209790342554e-06 -0.1401125128093402 -0.097983135445901204
		3.0935387022791127e-06 0.00087510152591874506 -0.11650100456405103
		2.6541209789787442e-06 0.1415008625054516 -0.097983135964808205
		;
createNode joint -n "fk_toe_controlJoint" -p "fk_toe";
	rename -uid "59446ABD-4473-C044-2BEE-CB84DEC3F8F8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.023850815689578496 6.8483668458352298e-08 0.51945272989073521 0
		 1.1524872769919701e-08 0.51999999999999535 -6.9084987254693111e-08 0 -0.51945272989073954 1.4681461364769682e-08 0.023850815689576737 0
		 0.12667875144753837 0.020546504508678176 0.1211502095627012 1;
	setAttr ".radi" 0.2;
createNode joint -n "fk_toeTip_controlJoint" -p "fk_toe_controlJoint";
	rename -uid "407A39E7-474B-5814-EE3B-A398F898C8B5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 1.5339769124984741 1.1102230246251563e-16 2.7755575615628914e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".radi" 0.2;
createNode transform -n "ik_toe_ikFkSwitchHelper" -p "fk_toe";
	rename -uid "EF003DB3-46F1-A7E5-6E4F-F093DF05409C";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 90.000000000000028 8.1716299407921755e-15 90 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode locator -n "ik_toe_ikFkSwitchHelperShape" -p "ik_toe_ikFkSwitchHelper";
	rename -uid "56ED19C0-40DB-1186-B2DF-C4AFFD54FA30";
	setAttr -k off ".v";
createNode transform -n "ik_foot_ikFkSwitchHelper" -p "fk_heel_reverse_group";
	rename -uid "3C571DF0-4B46-BDCB-198E-7798E428FB6E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 2.0954117794933126e-31 1.2490009027033011e-16 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
createNode locator -n "ik_foot_ikFkSwitchHelperShape" -p "ik_foot_ikFkSwitchHelper";
	rename -uid "93F4445D-48D8-33F1-3B83-DABCCFF52BC9";
	setAttr -k off ".v";
createNode transform -n "system" -p "mod";
	rename -uid "67F71184-4957-40F4-E804-AFB02E8BCD58";
	setAttr ".v" no;
createNode transform -n "footPivot" -p "system";
	rename -uid "C501B623-48CE-D242-77F2-2185E7475467";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode locator -n "footPivotShape" -p "footPivot";
	rename -uid "7DB5FF14-475C-5061-FCDE-BC9269221FE9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.02 0.02 0.02 ;
createNode transform -n "inner_footPivot" -p "system";
	rename -uid "914466FE-4CCA-45C1-C5C6-2EB8CC903903";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode locator -n "inner_footPivotShape" -p "inner_footPivot";
	rename -uid "E3B81969-40D1-891C-6CB6-6BBE612D098B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 0.02 0.02 0.02 ;
createNode transform -n "output" -p "mod";
	rename -uid "1F93D2E3-4539-EEA2-E477-BBAA1EFE5DD2";
createNode transform -n "ik_out" -p "output";
	rename -uid "CBE26731-4A2E-78F9-6E52-DE9DBBD4539F";
	setAttr ".v" no;
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "53FB5BF6-4D9D-AEB8-5AB5-9F8F56849ED2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "outJoints" -p "output";
	rename -uid "5213A793-4507-6F8E-7674-E0AD317953C9";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "EABFA25D-4A53-0691-13EB-03A601487F06";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0 -0.60841651512164618 0.79361788294319047 0 0.99999999999999989 -4.4408920985006262e-16 -2.7755575615628914e-16 0
		 4.4408920985006262e-16 0.79361788294319058 0.60841651512164618 0 -4.4408920985006212e-16 1.5780937895153551 -1.637590096985706 1;
createNode joint -n "toe_outJoint" -p "root_outJoint";
	rename -uid "B5F06C8B-4E8C-A7E8-C456-B0B9E1E001C2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.0711081027984619 6.2450045135165055e-17 5.5511151231257827e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 2.7019121672102755e-16 2.0602048733664446e-08 0.99999999999999967 0
		 0.99999999999999989 -4.4408920985006262e-16 -2.7755575615628914e-16 0 3.5243713299262844e-16 0.99999999999999978 -2.0602048678153295e-08 0
		 -3.8163916471489707e-16 0.31799741517051072 0.0060783309036969158 1;
createNode joint -n "toeTip_outJoint" -p "toe_outJoint";
	rename -uid "4DA5CF5B-4C7C-E4F4-19D1-C5B22791BF22";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 1.5339769124984741 5.5511151231257827e-17 -1.1275702593849246e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.40715703353220656 -0.208163610382953 1.2261684582048975 0
		 1.241981416737161 2.0512607302008866e-07 -0.41240779214086126 0 0.065599825181135801 1.2920007499422284 0.19755695792330985 0
		 0.40937070197844544 0.057293687855251754 0.53426676273612173 1;
createNode orientConstraint -n "toe_finalJoint_orientConstraint1" -p "toe_outJoint";
	rename -uid "489B63AB-4CF4-01C9-17DC-328222EDE34F";
	addAttr -ci true -k true -sn "w1" -ln "toeFk_fkJointW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w0" -ln "toe_ikJoint_outW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180.00000000000003 -37.781747866287439 1.7871191528883454e-30 ;
	setAttr ".o" -type "double3" 180 0 0 ;
	setAttr ".rsrr" -type "double3" -92.406494829251201 14.836580059022289 46.087300233423456 ;
	setAttr ".int" 2;
	setAttr -k on ".w1";
	setAttr -k on ".w0";
createNode transform -n "fk_toe_ikFkSwitchHelper" -p "toe_outJoint";
	rename -uid "E190C397-4098-3153-C6A2-68AE3DD4E72A";
	setAttr ".v" no;
createNode locator -n "fk_toe_ikFkSwitchHelperShape" -p "fk_toe_ikFkSwitchHelper";
	rename -uid "09DBE63A-4654-5C7C-680D-8FA7F2CE73D4";
	setAttr -k off ".v";
createNode pointConstraint -n "heel_joint_pointConstraint1" -p "root_outJoint";
	rename -uid "69362546-4866-E21A-0D29-7FA46A2932D1";
	addAttr -ci true -k true -sn "w0" -ln "heel_fkJointW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "heeikJointW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -2.0029671421627242e-32 0.20369547765055157 -0.32265257258673619 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "heel_finalJoint_orientConstraint1" -p "root_outJoint";
	rename -uid "82BA7F56-4221-56FB-6584-E7BBD34325F8";
	addAttr -ci true -k true -sn "w0" -ln "heel_fkJointW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "heel_ikJoint_outW1" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 176.40372013905855 90.000000000000028 ;
	setAttr ".o" -type "double3" 180 0 0 ;
	setAttr ".rsrr" -type "double3" 74.773758599969526 -48.329909521982287 -78.507342662452317 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "fk_heel_ikFkSwitchHelper" -p "root_outJoint";
	rename -uid "B3553A8C-4C7F-578C-16A2-FBAB797E17CE";
	setAttr ".v" no;
createNode locator -n "fk_heel_ikFkSwitchHelperShape" -p "fk_heel_ikFkSwitchHelper";
	rename -uid "E5FA1F3B-428C-C5F7-ED64-99BEE5EC11B7";
	setAttr -k off ".v";
createNode transform -s -n "persp";
	rename -uid "F921EAA9-4502-8B0D-4008-3CAC313597E1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -11.759482845199614 2.6938132436549815 -0.73376566060009596 ;
	setAttr ".r" -type "double3" -11.399999999998323 626.39999999999952 0 ;
	setAttr ".rp" -type "double3" 7.7715611723760958e-16 9.3924867883288243e-14 3.0198066269804258e-14 ;
	setAttr ".rpt" -type "double3" -1.0992890654171976e-16 4.8430186591755061e-15 -3.063514319172062e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "71CACD7C-4D6F-A019-F750-73914A7C0D25";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 12.019871320360391;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 0.317997446773577 0.0060782896806902964 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9868B001-47C3-0EBB-B0EE-8B96FEC4A30B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.076502485591062541 4.3383587041989209 1.8005118464289074 ;
	setAttr ".r" -type "double3" -90 630 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "BDCCCF88-4D68-C8B7-68B5-5EAAAADC5E82";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 4.5454261887130922;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F750A30C-41C7-909C-24CF-97A9A787658F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.15301414505452227 0.51353852517350029 5.0883492388635005 ;
	setAttr ".r" -type "double3" 0 720 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "47D25636-428B-BB2B-E1D5-A9866B5FD60A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 4.7031293490410206;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "AE19EFD1-4DF0-F1BC-CE2E-FE81C358D108";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -12.019872420096954 2.3204469007130273 1.3389292493556155 ;
	setAttr ".r" -type "double3" 0 630 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "A13D6213-4298-109B-2D3E-878C845B1910";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.8753276115516;
	setAttr ".ow" 12.000944094360086;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" -1.6511791933737641e-13 950.5148815332883 -316.09489230288875 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "group";
	rename -uid "A3DC42AA-4B1A-E491-8132-FCB518288D53";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" 0.017910420894622803 0.30753612518310547 0.14446365833282471 ;
	setAttr ".sp" -type "double3" 0.017910420894622803 0.30753612518310547 0.14446365833282471 ;
createNode transform -n "pasted__masha_l_shoe" -p "group";
	rename -uid "10FFE58A-46A5-C271-0E30-BBAE0ADE2AA6";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "pasted__masha_l_shoeShape" -p "pasted__masha_l_shoe";
	rename -uid "F6A45B07-43A0-EABE-508D-5ABA99FDA3E2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75797083973884583 0.49930909276008606 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcol" yes;
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
	setAttr ".vcs" 2;
createNode mesh -n "pasted__masha_l_shoeShapeOrig" -p "pasted__masha_l_shoe";
	rename -uid "439B62E7-413B-70BC-1974-D68E597F5BD4";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 472 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.95921129 0.93115771 0.98427218
		 0.93115771 0.99141198 0.98087245 0.9640817 0.98087233 0.67092633 0.16063035 0.63747078
		 0.12515479 0.73314762 0.12388229 0.73236144 0.16266626 0.95786864 0.86803222 0.9808324
		 0.86803222 0.95591456 0.19983721 0.9777208 0.19983727 0.97779942 0.23847316 0.95461804
		 0.23847318 0.63687283 0.085606515 0.73179454 0.084112763 0.97783095 0.2839509 0.94594181
		 0.28395087 0.66881502 0.043349266 0.73037916 0.043098867 0.97774112 0.34493142 0.94317472
		 0.34493145 0.62676847 0.46030274 0.63888693 0.45835423 0.65796316 0.51483965 0.64793277
		 0.51483965 0.81761038 0.55189562 0.79839581 0.55189562 0.80844098 0.50583738 0.82206464
		 0.51553386 0.82318181 0.45880023 0.83761936 0.45930684 0.76073718 0.12430626 0.76082838
		 0.16829413 0.96708733 0.84094679 0.98215508 0.84094679 0.75956756 0.083441496 0.75797814
		 0.042005658 0.97766209 0.36511394 0.95664525 0.36511397 0.64428622 0.90711802 0.64548576
		 0.93103737 0.63974822 0.93095297 0.91366237 0.96756142 0.56491268 0.70441771 0.56610501
		 0.68285 0.60558784 0.68503797 0.60439491 0.70660317 0.63601261 0.68677384 0.63607818
		 0.70839363 0.87015116 0.17171046 0.89652103 0.12836337 0.93541163 0.13100046 0.90922886
		 0.16721761 0.97380209 0.7272706 0.95462435 0.72727054 0.96206558 0.68733001 0.97442019
		 0.68733001 0.89003515 0.068359643 0.92550713 0.062940896 0.86050612 0.02784884 0.89804238
		 0.033779919 0.95878637 0.47077578 0.97679985 0.47077578 0.97657406 0.50928229 0.9625237
		 0.50928235 0.64071095 0.35820234 0.65962577 0.33990109 0.66426444 0.34655848 0.65305638
		 0.36020774 0.56547081 0.60149562 0.56882572 0.54871428 0.62567562 0.53683388 0.61448181
		 0.60434997 0.56036896 0.78669316 0.52592754 0.75169837 0.5245297 0.70224655 0.95974553
		 0.63276857 0.97383821 0.63276863 0.96095502 0.5550282 0.97488523 0.55502826 0.64736831
		 0.4205274 0.6575166 0.42405623 0.8086462 0.419043 0.80166709 0.42383417 0.75636727
		 0.33697662 0.78994602 0.3377941 0.78003746 0.34614086 0.7675699 0.34466785 0.6922102
		 0.33531487 0.68507576 0.34247473 0.68720663 0.44227225 0.72650409 0.44410372 0.72457218
		 0.45522365 0.6808213 0.45292401 0.52930033 0.59981608 0.53878313 0.59112728 0.64973545
		 0.58461261 0.64079797 0.60590494 0.52620184 0.68074536 0.63479847 0.75649941 0.59985399
		 0.7886523 0.81128293 0.35188234 0.79855096 0.35599017 0.81499982 0.38435301 0.80481339
		 0.38607553 0.58390081 0.076403379 0.58044052 0.089286953 0.55441833 0.11820772 0.54503107
		 0.11503796 0.6548655 0.38552016 0.64266324 0.38594329 0.97667241 0.44415492 0.9572618
		 0.44415495 0.83331156 0.034572959 0.83529836 0.075675488 0.83801252 0.12443691 0.95213151
		 0.75661433 0.97195542 0.75661433 0.84149116 0.17115819 0.65813971 0.6738264 0.64748091
		 0.62765694 0.65380061 0.62617761 0.66389549 0.67182845 0.92501795 0.57873344 0.92466444
		 0.62034863 0.91801929 0.62008482 0.91830206 0.57854021 0.92267299 0.66957384 0.91608441
		 0.66896182 0.91394281 0.71777749 0.90745747 0.71671104 0.9097805 0.73898417 0.9033224
		 0.73775178 0.8640514 0.81592453 0.86136609 0.8025834 0.84476566 0.84202778 0.83961821
		 0.83794808 0.80886412 0.86695486 0.80692601 0.85640913 0.7557953 0.85302728 0.75986665
		 0.84641069 0.72066683 0.81811661 0.72449017 0.81331939 0.7144345 0.80835587 0.72442526
		 0.79445618 0.68659121 0.73651427 0.69260228 0.73356336 0.67653495 0.71744347 0.68249118
		 0.71474785 0.54780936 0.51483965 0.54838669 0.46091473 0.57146966 0.46719134 0.56158972
		 0.51483965 0.57505178 0.40545958 0.59134197 0.40917721 0.59344482 0.38573077 0.6050967
		 0.38879952 0.61559558 0.31108087 0.62003386 0.32934693 0.64074838 0.2868284 0.65003955
		 0.29971105 0.63118768 0.25512868 0.67439592 0.21098602 0.68510938 0.24419266 0.75861776
		 0.22725171 0.75277144 0.26055634 0.80369425 0.25041676 0.80008233 0.28092587 0.82548124
		 0.28244865 0.83475363 0.30751905 0.86137569 0.37944067 0.85560179 0.38176525 0.82464027
		 0.32254374 0.87246186 0.39870778 0.86094707 0.40214908 0.90370715 0.44667742 0.88909996
		 0.45511898 0.91885459 0.49903008 0.90410185 0.50212145 0.92210317 0.55189562 0.90807045
		 0.55189562 0.6828807 0.61250871 0.69514799 0.66624266 0.88828182 0.61657876 0.88425744
		 0.57892787 0.88530672 0.6730361 0.87652642 0.71052629 0.88725132 0.73433942 0.86114609
		 0.77879137 0.83166063 0.81597227 0.80616432 0.83160156 0.75693387 0.82348651 0.73625135
		 0.79053128 0.7247228 0.78145105 0.69931817 0.73023856 0.70945472 0.70245308 0.59625727
		 0.46811238 0.59117389 0.51483965 0.6101597 0.4157649 0.62489045 0.39419833 0.6268062
		 0.34836864 0.65539861 0.31825241 0.68984807 0.28223401 0.69369638 0.31563443 0.75290316
		 0.29060781 0.75571531 0.3180159 0.79701954 0.29727668 0.79300314 0.32138526 0.81834453
		 0.33748469 0.83812058 0.38908634 0.83201331 0.41481894 0.85857099 0.45923606 0.87399727
		 0.5100643 0.87621832 0.55189562 0.74618298 0.62457925 0.71802276 0.66508621 0.82718873
		 0.63423252 0.81766021 0.59418446 0.86577439 0.67202747 0.85135639 0.71302629 0.87014604
		 0.74573535 0.86085296 0.76890951 0.83101708 0.77579731 0.81661946 0.77563542 0.75832778
		 0.7772972 0.74006116 0.76958543 0.72903734 0.75728649 0.73258376 0.73192024 0.73558021
		 0.69618797 0.78235197 0.88825423 0.78100085 0.93776017 0.732171 0.93433279 0.7359494
		 0.90008324 0.77231222 0.94983751 0.7269997 0.93973821 0.87323844 0.8541519 0.91321158
		 0.84882414 0.91282123 0.89430267 0.8729049 0.89613003 0.77493489 0.87708211 0.72793126
		 0.89394295 0.87318456 0.34460247 0.86605239 0.33935457 0.87420148 0.32195705 0.88048953
		 0.32727069 0.60171771 0.26796803 0.55608916 0.26300973 0.55332279 0.24207824 0.59853911
		 0.24658746;
	setAttr ".uvst[0].uvsp[250:471]" 0.54452503 0.26424241 0.54277575 0.24427509
		 0.91076398 0.3465994 0.91761631 0.33161223 0.5366354 0.51483965 0.53673244 0.46290925
		 0.93166161 0.49834806 0.93523216 0.55189562 0.91408807 0.44946638 0.88051879 0.39529103
		 0.86672962 0.37838998 0.83963776 0.30209395 0.82918572 0.2790803 0.80694079 0.24883932
		 0.76043737 0.22244281 0.67284989 0.20718539 0.62717938 0.24638528 0.61988187 0.2875137
		 0.61507773 0.28188539 0.58789098 0.38523197 0.60932612 0.31000724 0.56935102 0.40578023
		 0.95478648 0.98087233 0.95209885 0.93115783 0.95283163 0.86803222 0.96366137 0.84094697
		 0.94329524 0.75661433 0.94500321 0.72727048 0.95088434 0.68732989 0.95564008 0.63276857
		 0.9564482 0.5550282 0.95540893 0.50928235 0.95212817 0.47077578 0.95110178 0.44415492
		 0.95025957 0.36511394 0.93923467 0.34493148 0.93903041 0.28395087 0.9459005 0.23847318
		 0.94753391 0.19983725 0.75479174 0.36193526 0.69491553 0.36212075 0.76881826 0.36230487
		 0.7598213 0.75710255 0.78757465 0.75561351 0.81668115 0.75542849 0.68200409 0.36119604
		 0.75777406 0.40393335 0.68833447 0.40427443 0.78619295 0.40930179 0.79047668 0.71193135
		 0.82887745 0.71436858 0.65974009 0.40799648 0.7325359 0.54501843 0.74050254 0.54512286
		 0.7357862 0.5745154 0.73019052 0.56574458 0.78142351 0.43698859 0.76537049 0.43132991
		 0.79174757 0.69400102 0.8376804 0.69248897 0.67804772 0.42950213 0.66260338 0.43863064
		 0.68776488 0.93620044 0.69399756 0.89662892 0.6866017 0.9437229 0.91276878 0.92821091
		 0.87535423 0.92935121 0.6908747 0.88959855 0.67121291 0.93806678 0.67304528 0.89532614
		 0.66843045 0.9461953 0.91271138 0.94393188 0.87529826 0.94507205 0.67048359 0.88796663
		 0.663903 0.93771464 0.66472065 0.89579207 0.65966535 0.94413584 0.91277307 0.95103127
		 0.87536013 0.9521715 0.66061676 0.88824219 0.65524858 0.93849939 0.65428257 0.89378643
		 0.65325332 0.94388509 0.91382515 0.96138138 0.87641108 0.96252078 0.65387917 0.89024431
		 0.65082896 0.93632466 0.6480478 0.89768302 0.87633449 0.96581882 0.91391253 0.96459699
		 0.64643455 0.89230049 0.87719148 0.30114681 0.88250524 0.30584586 0.56455326 0.22188717
		 0.6016326 0.22173315 0.5561862 0.21890587 0.91988212 0.30780107 0.60433161 0.21073368
		 0.59114337 0.21151647 0.60086918 0.20751178 0.56527197 0.21388176 0.55558145 0.21401647
		 0.88291472 0.3027516 0.92028481 0.30470943 0.59195435 0.20039269 0.60264802 0.20366025
		 0.56262529 0.20456502 0.5534848 0.20867956 0.88548064 0.3011682 0.91970086 0.30105573
		 0.5948441 0.18851894 0.60394347 0.18980542 0.55624402 0.19351259 0.5484302 0.19845805
		 0.88257921 0.29028255 0.91996455 0.29167801 0.59500849 0.16454929 0.60363138 0.16570747
		 0.55369651 0.17467454 0.54652286 0.17816672 0.880831 0.26901656 0.92022938 0.27341425
		 0.60275722 0.11327344 0.59411347 0.11720756 0.55063188 0.13099903 0.54277575 0.13019693
		 0.91612035 0.22960083 0.86858034 0.22114618 0.86605239 0.18676488 0.91150415 0.21791558
		 0.74361813 0.40492079 0.70393884 0.40464038 0.7440384 0.42054316 0.75626695 0.44236302
		 0.72743183 0.41647699 0.7022056 0.4206484 0.61713374 0.90403116 0.57219672 0.90209192
		 0.57546747 0.89027095 0.61443341 0.89206588 0.68435997 0.59135383 0.67914343 0.57163292
		 0.68279886 0.56671828 0.68528545 0.57593518 0.73340219 0.53060275 0.73835045 0.52162665
		 0.68054903 0.52186793 0.68734169 0.5009827 0.6874997 0.51738334 0.68430585 0.52689803
		 0.57537484 0.88549697 0.61459756 0.88759321 0.69167227 0.56780106 0.69162577 0.57445353
		 0.76103681 0.56810582 0.76950437 0.54807734 0.77627784 0.5489071 0.7646367 0.57265496
		 0.69333434 0.51948369 0.6926409 0.5263809 0.59536135 0.84193552 0.59424686 0.85270888
		 0.57671046 0.85131639 0.57760525 0.8406468 0.70572972 0.5760991 0.70247573 0.57053167
		 0.73044115 0.57157224 0.74282384 0.54559445 0.74202472 0.52207983 0.7631222 0.53114736
		 0.70462543 0.52488291 0.70954943 0.5192228 0.73282844 0.52534187 0.5780741 0.83599788
		 0.5950042 0.83677953 0.7395466 0.58150077 0.73851049 0.57436967 0.74315697 0.57916194
		 0.74161094 0.51497018 0.7462222 0.51749551 0.57794046 0.81386501 0.60049272 0.80492121
		 0.70277053 0.54644352 0.7675367 0.52645302 0.69028831 0.54658502 0.57500434 0.87351936
		 0.59118724 0.87418628 0.61614037 0.87516791 0.67997044 0.547768 0.67259741 0.55108333
		 0.6199165 0.81597167 0.61801392 0.83803225 0.61796778 0.84349334 0.61649954 0.85465044
		 0.73127842 0.16585791 0.66695523 0.16515136 0.8411606 0.17461604 0.76014775 0.17195517
		 0.75699621 0.028589189 0.83384645 0.017745733 0.90225285 0.02846992 0.94057482 0.059681296
		 0.86331052 0.017887354 0.95934141 0.13614786 0.9098354 0.17074734 0.87033814 0.17522684
		 0.72932464 0.029127479 0.66505194 0.038896918 0.63113552 0.078495741 0.63185304 0.12606502
		 0.76277548 0.45320743 0.74936813 0.71475458 0.74026942 0.68741941 0.78948271 0.65449065
		 0.82888693 0.67029512 0.74996287 0.66749662 0.63747621 0.9088313 0.64604831 0.94038051
		 0.87653381 0.96835876 0.75015271 0.43145311 0.72696793 0.43029034 0.69470608 0.43146032;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcol" yes;
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 325 ".pt";
	setAttr ".pt[0:165]" -type "float3"  -0.91614795 -0.0098737068 -1.8835779 
		-0.54417491 0.1351556 -2.2971191 -0.032547999 0.051227331 -2.2614894 0.36711979 -0.010352426 
		-1.8911196 -0.99373966 0.2867724 -1.9785633 -0.52277237 1.3869488 -2.0933495 -0.042030297 
		0.30864328 -2.1649165 0.39516804 0.28146073 -1.8683782 -1.2049562 0.054417528 0.47974569 
		-0.80976337 0.15871273 0.77456146 -0.06738928 0.15913995 0.74737328 0.32245433 0.10805495 
		0.52646059 -1.1757313 0.23737179 0.39250681 -0.88314259 0.43229669 0.93036658 -0.065527201 
		0.43229669 0.78408104 0.34251282 0.29411107 0.49026692 -0.98598427 -0.010352426 -1.2300802 
		-0.555022 -0.010352426 -1.2188867 -0.13582999 -0.010352426 -1.2080019 0.447456 0.011456545 
		-1.2082874 -1.1741996 -0.036438998 -0.23571976 -0.63459235 -0.050203677 -0.21485475 
		-0.11553037 -0.050203677 -0.20137608 0.32136738 -0.050184455 -0.1900329 -0.99245358 
		0.26839769 -1.2302477 -0.555022 0.39235303 -1.2188867 -0.13582999 0.39235303 -1.2080019 
		0.42489275 0.30864328 -1.1934344 -1.1472437 0.26680687 -0.22817498 -0.63673252 0.39235303 
		-0.13282432 -0.11766 0.39235303 -0.11934711 0.47566059 0.22913669 -0.18602373 -0.060793463 
		0.33798921 0.60182375 -0.65118349 0.33798921 0.42382759 -0.92539632 0.34661746 -0.055305973 
		-1.0194235 0.39235303 -0.14277056 -0.98382205 0.39235303 -1.2300217 -0.7505604 0.95597476 
		-1.6143821 -0.53234059 0.39235303 -2.0920398 -0.11321415 0.39235303 -2.0788147 0.22853898 
		0.39235303 -1.7087874 0.20062892 0.39235303 -1.1992593 0.16139424 0.39235303 -0.11209787 
		0.23639028 0.39235303 0.12093528 0.47058305 0.40792564 -0.96338022 0.18130589 0.39235303 
		-0.97089374 -0.56096017 0.39235303 -0.99016839 -0.98462647 0.39235303 -1.0011725 
		-0.14176819 0.39235303 -0.97928268 -0.99840677 0.34313518 -1.0015299 0.43222272 0.17751123 
		-0.9694075 -0.14176819 0.17752324 -0.97928268 -0.56096017 0.17752324 -0.99016839 
		-0.99183065 0.17752324 -1.0013593 -0.060793463 0.46066898 0.60182375 -0.65118349 
		0.42736089 0.42382759 -0.92539632 0.41493535 -0.055305973 -0.8792727 0.46066898 -0.24664731 
		-0.98382205 0.46066898 -1.2300217 -0.92656022 0.39235303 -1.7516729 -0.53234059 0.46066898 
		-2.0920398 -0.11321415 0.46066898 -2.0788147 0.22853898 0.46066898 -1.7087874 0.20062892 
		0.46066898 -1.1992593 0.16416457 0.46066898 -0.21871819 0.23639028 0.46066898 0.12093528 
		0.18130589 0.46066898 -0.97089374 -0.98462647 0.46066898 -1.0011725 -0.94559777 0.46066898 
		-1.8983197 -0.53012329 0.30864328 -2.1775942 -0.041716415 0.46066898 -2.1769898 0.34975511 
		0.46066898 -1.864686 -1.0371 0.53795326 0.013791016 -0.71708626 0.7200473 0.3117592 
		-0.052444786 0.73594123 0.28036487 0.33252683 0.53023601 0.086496934 -0.99245358 
		0.46066898 -1.2302477 0.42489275 0.46066898 -1.1934344 -1.0689206 0.35080689 -0.38841733 
		0.46000925 0.40191859 -0.29317278 0.44786748 0.46066898 -0.96396875 -0.99840677 0.46066898 
		-1.0015299 -0.92656022 0.46066898 -1.7516729 -0.10285892 0.5275076 0.3043887 -0.64470273 
		0.51504421 0.17409682 -0.78503931 0.55201054 -0.23679347 -0.86928308 0.51769036 -0.37303576 
		-0.89077711 0.78517544 -1.2082907 -0.53019446 0.78517544 -2.1748242 -0.11106175 0.78517544 
		-2.1615996 0.22630773 0.78517544 -1.6228755 0.20062892 0.78517544 -1.1992593 0.16946988 
		0.55225217 -0.4230319 0.090768009 0.56683242 0.1171512 0.18130589 0.62886786 -0.97089374 
		-0.98462647 0.53758126 -1.0011725 -0.52980512 0.46066898 -2.1896605 -0.94782758 0.72495025 
		-1.8124152 -0.039566085 0.78517544 -2.2597706 0.31859916 0.78517544 -1.7795285 -0.96721768 
		0.61549532 -0.15904179 -0.64005774 0.72513241 -0.0045706751 -0.038556196 0.78298056 
		0.014927915 0.26980385 0.62619489 -0.14178923 -0.99245358 0.66457611 -1.2302477 0.30346283 
		0.78517544 -1.1965878 -1.0041709 0.46941426 -0.54848081 0.38981205 0.49439526 -0.40666518 
		0.37962484 0.62886786 -0.96574241 -0.99840677 0.63673478 -1.0015299 -0.87409556 0.78517544 
		-1.6643341 -0.038727351 0.74301457 -0.24780725 -0.6335265 0.74143648 -0.25621679 
		-0.78934819 0.68695897 -0.40945041 -0.83753318 0.6551562 -0.5944348 -0.74344313 1.0268939 
		-1.1439211 -0.52833444 1.3869488 -1.8790711 -0.1092071 1.3869488 -1.8658472 0.21687703 
		0.95597476 -1.6218029 0.24938798 1.0268939 -1.099568 0.1717277 0.59250808 -0.51149982 
		0.05137787 0.64445823 -0.3019425 0.17286852 0.77917874 -0.81191301 -0.80035269 0.77917874 
		-0.83718944 -0.5276553 0.78517544 -2.2724559 -0.85677397 0.95597476 -1.6702349 -0.10358128 
		1.3869488 -2.0824692 0.33963284 0.95597476 -1.7136604 -0.85799456 0.67652988 -0.36566308 
		-0.72329348 1.4222224 -0.84079981 -0.041254211 0.84124064 -0.15049785 0.18673906 
		0.64445823 -0.29017404 -0.15392312 1.2572967 -0.79433113 0.32700276 0.54821688 -1.7522367 
		-0.95128685 0.61812329 -0.59739208 0.30810079 0.59250808 -0.50795931 0.27921224 0.77917874 
		-0.80914938 -0.92413092 0.77917874 -0.84040546 -0.66699666 1.3169715 -0.80958146 
		-0.67473757 1.0339615 -0.53496903 -0.86209309 1.0268939 -1.1469992 -0.7541756 1.0659611 
		-0.51096344 0.11575202 1.1320174 -0.95257854 0.1344067 0.86363608 -0.6633451 0.34235227 
		1.0268939 -1.0971582 0.23053814 0.85434842 -0.66082543 -0.94559777 0.2030658 -1.8983197 
		-0.023347303 0.39235303 -2.2715261 0.40075764 0.3651714 -1.9423428 -1.2381158 0.27973622 
		0.46453869 -0.90460831 0.45674437 0.95796889 -0.04249353 0.45674437 0.82521266 0.37872493 
		0.30396718 0.49365842 -1.0417715 0.28556564 -1.2656165 0.47473371 0.39235303 -1.2262326 
		-1.2073376 0.24967535 -0.24499574 0.53694338 0.23899707 -0.14552353 0.52002496 0.42396492 
		-0.98083496 -1.0481101 0.36030662 -1.0215577 -0.54449028 0.39235303 -2.2850525 -0.99373966 
		0.038879499 -1.9785633 -0.53506476 0.050997589 -2.2743971 -0.02303372 0.13527097 
		-2.283587 0.40075764 0.038532343 -1.9423428 -1.2063547 0.16625477 0.46819687 -0.90549511 
		0.33041331 0.99201477;
	setAttr ".pt[166:324]" -0.043378636 0.33041331 0.85926712 0.34324381 0.17647213 
		0.52663165 -1.0417715 0.043630086 -1.2656165 0.47473371 0.038532343 -1.2262326 -1.2073376 
		0.041663967 -0.24499574 0.53341019 0.043491382 -0.14562027 0.46839336 0.22640756 
		-0.98217535 -1.0481101 0.21737444 -1.0215577 -0.033231728 0.81210488 -0.45938903 
		-0.62802845 0.81053066 -0.46779034 -0.63564801 0.78286058 -0.17453028 -0.035297669 
		0.92798918 -0.37983042 -0.62969363 0.91119874 -0.40387312 0.052425608 0.99413651 
		-0.87068373 -0.65249151 0.9925555 -0.87456673 0.054276638 1.1725452 -0.69964528 -0.55624753 
		0.83839816 -0.31518102 0.016873423 1.4471315 -0.82283014 -0.72776169 1.4455605 -0.9107756 
		0.020941859 1.4390047 -0.73721713 -0.74309891 1.3462915 -0.78836352 -0.33208013 1.3105136 
		-0.78388512 -0.34548956 1.0515531 -0.52067882 -0.35452092 1.0931574 -0.46623567 -0.34069577 
		1.34902 -0.7334972 -0.17812164 1.2882042 -0.79089379 -0.19153047 1.029238 -0.52768356 
		-0.20056404 1.0708585 -0.47324511 -0.1867366 1.326721 -0.74050623 -0.10789805 1.2855951 
		-0.78776407 -0.12130654 1.0266316 -0.52455544 -0.13033892 1.0682434 -0.4701173 -0.11651097 
		1.3241161 -0.73737913 -0.017509351 1.323218 -0.75586742 -0.030917846 1.0642549 -0.49266315 
		0.03001751 1.0983448 -0.42730784 0.043846563 1.3542181 -0.69457257 -0.01760681 1.2765701 
		-0.75216734 -0.031015074 1.0176055 -0.48896211 0.033231582 1.0014288 -0.5510121 0.047059216 
		1.2572967 -0.81827456 -0.21858862 1.2765701 -0.72822046 -0.23199342 1.0176055 -0.46501425 
		-0.16774985 1.0014288 -0.52706844 0.20302045 1.1235708 -0.95029205 0.004884446 1.2670195 
		-0.8165791 -0.017643752 0.99865186 -0.52841401 0.064446911 0.98936456 -0.52625901 
		0.079402961 1.2585887 -0.81462085 0.069401972 1.3340659 -0.71616995 0.046875104 1.0656925 
		-0.4280065 0.081488669 1.0074593 -0.50461793 0.096443914 1.2766854 -0.7929858 0.20096655 
		1.3165675 -0.77870357 0.17844138 1.0481931 -0.49053681 0.10798553 0.99210572 -0.52897435 
		0.10933573 1.2500792 -0.78142828 0.2145873 1.2247726 -0.8772918 0.20990548 0.95640296 
		-0.58866543 0.13977735 0.92458433 -0.59410274 0.13689061 1.19382 -0.88292909 0.44707108 
		0.82655001 -1.4688743 0.4383404 0.55415303 -1.0507727 0.36423081 0.52234083 -1.0563143 
		0.36539179 0.79558825 -1.4746068 0.44479159 0.57917655 -1.7455592 0.49099123 0.49981737 
		-1.1701182 0.38076678 0.46800214 -1.1765951 0.23894839 0.80772859 -0.71143889 0.31629971 
		0.82510942 -0.7214461 0.34171245 1.0822666 -1.0373683 0.26022437 1.0583546 -1.0354712 
		-1.1176337 0.43770832 0.11226898 -0.82087702 0.69016051 0.69536126 -0.059787713 0.66741854 
		0.56317842 0.40266195 0.48385775 0.23642887 -0.55947918 1.2792271 -0.82195145 -0.086582497 
		1.1716802 -0.69034618 -0.65023375 1.1557623 -0.7191698 -0.52897292 0.022766728 -2.2217286 
		-0.56237984 1.1568666 -0.71029598 -0.52703834 1.3420941 -0.84675515 -0.11642285 1.2784358 
		-0.75690871 -0.11456262 1.3569071 -0.82844776 -0.52889854 1.2636226 -0.77521795 -0.54452658 
		1.2853892 -0.61952221 -0.10876322 1.2316847 -0.61442733 -0.10912064 1.3002007 -0.60062003 
		-0.54417247 1.2168655 -0.63333488 -0.5446201 1.0848736 -0.39419729 -0.1144895 1.0082142 
		-0.52498031 -0.12095837 1.0818263 -0.36689886 -0.54276776 1.0038941 -0.55310667 -0.54197061 
		1.0120921 -0.48069939 -0.11815722 0.97352421 -0.4901095 -0.11900353 1.0234238 -0.45746636 
		-0.54112244 0.96218324 -0.51334506 -0.55719972 0.89807373 -0.27856484 -0.11333583 
		0.84973615 -0.29142448 -0.1142859 0.90940869 -0.2548089 -0.53115129 1.2945746 -0.73956215 
		-0.53204602 1.3535994 -0.73167026 -0.11562894 1.366629 -0.70540166 -0.1160384 1.307395 
		-0.715581 -0.11537544 1.0434849 -0.45948124 -0.3112841 1.3241202 -0.80800891 -0.32843825 
		1.359972 -0.71882564 -0.33657566 1.2924944 -0.61048472 -0.35547036 1.0834668 -0.38219827 
		-0.35102826 1.0170839 -0.47034481 -0.35888427 0.87228489 -0.16388565 -0.35079595 
		0.81274372 -0.20016994 -0.29740757 0.96891457 -0.4997465 -0.30290809 1.0072112 -0.53829139 
		-0.9623329 -0.010352426 -1.9262141 -0.083681546 1.2940435 -0.80199808 -0.54487348 
		1.0393873 -0.49034351 0.27528128 0.063442923 0.49090517 0.49461246 -0.0074748732 
		-0.1727645 -0.061535873 0.29345095 0.8429566 -1.1405568 -0.050203677 -0.22800073 
		-1.1673939 0.04673015 0.47940075 -0.88897485 0.29193461 0.98443627 0.29201758 0.17751123 
		-0.96801847 -1.0228101 0.19709079 -1.0113662 0.30046389 -0.01033779 -1.1966655 0.31864899 
		-0.010447831 -1.8529671 -0.10978856 0.022761749 -2.2106454 -1.0138752 0.0069594514 
		-1.2456088 -0.11966317 1.078326 -0.43646148 -0.54211247 1.0820702 -0.46373335 -0.28010008 
		1.225757 -0.62192011 -0.35251617 1.0415349 -0.47768155 -0.30583909 1.0781918 -0.44823229 
		-0.27695623 1.2579933 -0.78849357 -0.31270859 1.6119195 -0.57145458 -0.36016265 1.6256655 
		-0.65190482 -0.30914715 1.0731062 -0.77560562 -0.33774403 0.81130248 -0.46368977 
		0.10852798 1.3021531 -0.76313716 0.10488854 1.1977329 -0.86520565 -0.3116349 1.2358512 
		-0.84823173 -0.72256213 1.2260885 -1.062812 -0.7193141 1.2740464 -0.94581956 -1.1815459 
		0.24914533 0.020476472 -1.2430226 0.26770961 0.056968831 -1.2149862 0.07778652 0.061254229 
		-1.2098747 -0.020556826 0.069813028 -1.1738697 -0.030675549 0.072691463 -0.73969692 
		0.075145639 0.37879452 -0.086643666 0.075402573 0.36786208 0.37139902 -0.029282475 
		0.10469507 0.46899924 0.01456876 0.13292143 0.49699503 0.076005898 0.14388229 0.5196929 
		0.25408462 0.12414748 0.47345766 0.24422479 0.10590029 -0.021767469 1.3665227 -0.82708156 
		-0.28549609 1.4349524 -0.73585737 -0.63808197 1.3507209 -0.85118824;
	setAttr -s 325 ".vt";
	setAttr ".vt[0:165]"  0.042180389 -0.0038547516 -0.28678608 0.14610526 0.052765846 -0.47563523
		 0.34232563 0.019999504 -0.50728625 0.52579987 -0.0040416718 -0.40274507 0.0045257099 0.1119585 -0.31578833
		 0.17383975 0.54147339 -0.37412411 0.34725994 0.1204958 -0.47000667 0.53838986 0.10988426 -0.39663383
		 0.14150484 0.021244865 0.63055748 0.31663293 0.061962128 0.70698023 0.59439492 0.062129021 0.63127661
		 0.72204226 0.042185426 0.51354444 0.14484911 0.092671394 0.59505552 0.30267227 0.16877079 0.77224135
		 0.59833264 0.16877079 0.64496279 0.72642249 0.114822 0.49811733 0.073427588 -0.0040416718 -0.03400743
		 0.2370548 -0.0040416718 -0.067771435 0.39621007 -0.0040416718 -0.1006124 0.61630738 0.0044727325 -0.15213466
		 0.0900473 -0.01422596 0.35783577 0.29552418 -0.019599915 0.31814599 0.49259984 -0.019599915 0.27747989
		 0.65847707 -0.019592285 0.24325156 0.070970729 0.10478306 -0.033500195 0.2370548 0.15317631 -0.067771435
		 0.39621007 0.15317631 -0.1006124 0.60909998 0.1204958 -0.14454162 0.10088743 0.10416317 0.35830832
		 0.30195069 0.15317631 0.34929109 0.49902654 0.15317631 0.30862498 0.71705735 0.089456558 0.23116374
		 0.58405423 0.13195324 0.57576656 0.34556109 0.13195324 0.56063485 0.19984639 0.13532162 0.40399218
		 0.1566498 0.15317631 0.37927341 0.074249983 0.15317631 -0.034177065 0.130097 0.37321663 -0.17328846
		 0.16864783 0.15317631 -0.39928582 0.3279863 0.15317631 -0.43123919 0.48957431 0.15317631 -0.32171798
		 0.52395356 0.15317631 -0.12697196 0.60497582 0.15317631 0.28676295 0.65381849 0.15317631 0.36809659
		 0.64662278 0.15925694 -0.061749935 0.53679144 0.15317631 -0.03908658 0.25497311 0.15317631 0.019065619
		 0.094117701 0.15317631 0.052257657 0.41412872 0.15317631 -0.013775826 0.088889062 0.13396263 0.053336382
		 0.63161528 0.069301605 -0.060643554 0.41412872 0.069306374 -0.013775826 0.25497311 0.069306374 0.019065619
		 0.091383606 0.069306374 0.052821875 0.58405423 0.17984772 0.57576656 0.34556109 0.16684437 0.56063485
		 0.19984639 0.16199303 0.40399218 0.20038414 0.17984772 0.32771802 0.074249983 0.17984772 -0.034177065
		 0.04987812 0.15317631 -0.23608524 0.16864783 0.17984772 -0.39928582 0.3279863 0.17984772 -0.43123919
		 0.48957431 0.17984772 -0.32171798 0.52395356 0.17984772 -0.12697196 0.59662282 0.17984772 0.24628234
		 0.65381849 0.17984772 0.36809659 0.53679144 0.17984772 -0.03908658 0.094117701 0.17984772 0.052257657
		 0.029768899 0.17984772 -0.28975278 0.16194507 0.1204958 -0.43176758 0.34631455 0.17984772 -0.47458842
		 0.52157724 0.17984772 -0.39123583 0.16377884 0.21002007 0.43991184 0.31081277 0.28111076 0.52415442
		 0.55886996 0.28731537 0.45371866 0.68706238 0.20700741 0.34662461 0.070970729 0.17984772 -0.033500195
		 0.60909998 0.17984772 -0.14454162 0.11631735 0.13695621 0.29093075 0.70170796 0.1569109 0.19210553
		 0.63799763 0.17984772 -0.05997026 0.088889062 0.17984772 0.053336382 0.04987812 0.17984772 -0.23608524
		 0.54196167 0.20594311 0.46722817 0.32599664 0.20107555 0.4658215 0.23681843 0.21550846 0.32312727
		 0.19301677 0.20210934 0.27913952 0.11128008 0.30653763 -0.034177065 0.1621621 0.30653763 -0.43071687
		 0.3215006 0.30653763 -0.46267024 0.49630499 0.30653763 -0.28909975 0.52395356 0.30653763 -0.12697196
		 0.58061624 0.21560287 0.16871047 0.59853041 0.22129345 0.37950492 0.53679144 0.24551296 -0.03908658
		 0.094117701 0.20987415 0.052257657 0.16099969 0.17984772 -0.43634933 0.036499664 0.28302574 -0.2571348
		 0.33982885 0.30653763 -0.50601947 0.51732719 0.30653763 -0.35635191 0.17491782 0.24029255 0.36852813
		 0.31199932 0.28309631 0.39798737 0.54071426 0.30568123 0.35232663 0.64327097 0.24447155 0.26600289
		 0.070970729 0.25945282 -0.033500195 0.56299639 0.30653763 -0.13502848 0.12664452 0.18326092 0.22481871
		 0.66521239 0.1930151 0.1554656 0.61208749 0.24551296 -0.054623723 0.088889062 0.24858665 0.053336382
		 0.077378213 0.30653763 -0.20775247 0.51749098 0.29007721 0.25318742 0.29228425 0.28946114 0.30244422
		 0.21997204 0.26819134 0.25835156 0.18548039 0.25577736 0.19278741 0.17255336 0.40090656 -0.022871017
		 0.19062787 0.54147339 -0.29276472 0.34996665 0.54147339 -0.32471806 0.49453655 0.37321663 -0.26136363
		 0.55114192 0.40090656 -0.093648553 0.57366943 0.23131847 0.13512468 0.54672384 0.25160122 0.22481704
		 0.54762018 0.30419731 0.021653533 0.17811462 0.30419731 0.097899914 0.15451396 0.30653763 -0.46778041
		 0.085086897 0.37321663 -0.18500507 0.332995 0.54147339 -0.40696523 0.53276438 0.37321663 -0.30685157
		 0.19792405 0.26412201 0.2809279 0.20588422 0.5552454 0.074206173 0.52511537 0.32842445 0.2901361
		 0.5988431 0.25160122 0.2173264 0.42584532 0.49085712 0.057094097 0.52290165 0.2140255 -0.34679562
		 0.14229438 0.24131966 0.20169854 0.62544703 0.23131847 0.12444043 0.58799648 0.30419731 0.013322115
		 0.1311197 0.30419731 0.10759687 0.23087463 0.51415157 0.096564531 0.25215852 0.40366077 0.20087886
		 0.12750781 0.40090656 -0.01357615 0.22429618 0.41615963 0.21694183 0.51366663 0.44194508 -0.02639699
		 0.54620087 0.33716965 0.081110477 0.58643728 0.40090656 -0.10093153 0.58270085 0.33354187 0.073587537
		 0.029768899 0.079277992 -0.28975278 0.34491414 0.15317631 -0.51188183 0.53397965 0.14256477 -0.42503938
		 0.12765077 0.10921001 0.62773961 0.29700506 0.17831516 0.78455138 0.61065078 0.17831516 0.65845871
		 0.74038702 0.11867103 0.4962095 0.049242496 0.11148643 -0.042501807 0.62501776 0.15317631 -0.16131103
		 0.07672745 0.097474098 0.35725474 0.74375391 0.093306541 0.24104476 0.66374218 0.16551781 -0.072694778
		 0.068362862 0.14066601 0.050159812 0.14705095 0.15317631 -0.47105348 0.0045257099 0.01517868 -0.31578833
		 0.151548 0.019909859 -0.46786249 0.34396875 0.052810669 -0.51646358 0.53397965 0.015043259 -0.42503938
		 0.1399577 0.06490694 0.62631792 0.29967254 0.12899494 0.79747939;
	setAttr ".vt[166:324]" 0.61331856 0.12899494 0.67138672 0.72990376 0.068895936 0.5117768
		 0.049242496 0.017033577 -0.042501807 0.62501776 0.015043259 -0.16131103 0.07672745 0.016265869 0.35725474
		 0.74241507 0.016979218 0.24132085 0.64413846 0.08839035 -0.068649411 0.068362862 0.084864616 0.050159812
		 0.50091517 0.31705189 0.17285657 0.27570832 0.31643581 0.22211385 0.29868335 0.30563259 0.3334558
		 0.50714839 0.36229038 0.20306373 0.28071606 0.35573578 0.24638343 0.49586809 0.38811588 -0.0073950291
		 0.20899248 0.38749981 0.054587364 0.51276147 0.45777035 0.074473739 0.31624812 0.32731628 0.27338052
		 0.48378408 0.56497097 -0.031275928 0.19690815 0.56435394 0.030706227 0.49398541 0.56179905 0.018161118
		 0.20402694 0.52559662 0.11127901 0.35953164 0.51163483 0.076739669 0.3776722 0.410532 0.17725134
		 0.37906164 0.42677593 0.19859314 0.36072278 0.5266695 0.096513629 0.41701573 0.50292492 0.060524106
		 0.43515658 0.40182209 0.16103578 0.43654603 0.41806602 0.18237758 0.41820687 0.51795959 0.080298424
		 0.44379234 0.50190735 0.055515051 0.46193314 0.40080452 0.1560266 0.46332258 0.41704845 0.1773684
		 0.44498336 0.51694202 0.075289011 0.4807148 0.51659298 0.059584737 0.49885559 0.4154892 0.16009641
		 0.52761185 0.42880058 0.17938709 0.50927258 0.52869415 0.077307701 0.48100483 0.49838257 0.060989976
		 0.49914575 0.39727974 0.16150165 0.51792061 0.39096355 0.13242114 0.49958134 0.49085712 0.030341744
		 0.40726852 0.49838257 0.087742448 0.42540932 0.39727974 0.18825388 0.44418418 0.39096355 0.15917349
		 0.54680109 0.43865204 -0.033226252 0.4838146 0.49465466 0.034700274 0.50071383 0.38988018 0.14543414
		 0.53188288 0.3862524 0.13901126 0.51210976 0.49136257 0.028869867 0.51701343 0.52082825 0.066905499
		 0.53391266 0.41605282 0.17763925 0.54022098 0.39331913 0.14567494 0.52044761 0.4984293 0.035533309
		 0.56115162 0.51399517 0.031709194 0.57805085 0.4092207 0.14244282 0.5480746 0.38732433 0.13414931
		 0.52633119 0.48804092 0.038757443 0.55760098 0.4781599 -0.0066972971 0.58127534 0.37338448 0.10263872
		 0.55433166 0.36096287 0.10676777 0.52778339 0.46607304 -0.0019757748 0.59319204 0.3226881 -0.25044107
		 0.62675107 0.21634388 -0.091889858 0.59829438 0.20392323 -0.087448478 0.56186134 0.31060123 -0.24540776
		 0.56794226 0.22611237 -0.35465789 0.63610041 0.1951313 -0.14156759 0.59393346 0.18271065 -0.13429725
		 0.58141482 0.315341 0.053745985 0.60972309 0.32212734 0.043150544 0.59146637 0.4225235 -0.078312755
		 0.5608812 0.41318798 -0.070413113 0.14207155 0.17088413 0.48417568 0.30545497 0.2694416 0.67806721
		 0.58102775 0.2605629 0.56109953 0.72674727 0.18889999 0.39702654 0.27035958 0.4994154 0.082418799
		 0.46042365 0.45743084 0.090400219 0.22466037 0.4512167 0.13051844 0.15848678 0.0088882446 -0.44852766
		 0.27910703 0.45164585 0.12481034 0.2804153 0.52395916 0.070198178 0.44329512 0.49910927 0.067910433
		 0.43769073 0.52974415 0.040749073 0.28601974 0.49332523 0.09735918 0.29384434 0.50182438 0.15749311
		 0.45874536 0.48085594 0.12100434 0.45982695 0.50760841 0.12624717 0.2927624 0.47507095 0.15224981
		 0.31367272 0.42354202 0.24253416 0.46446759 0.39361286 0.15526509 0.47596109 0.42235374 0.21549416
		 0.30036449 0.3919239 0.18240237 0.30704761 0.39512634 0.20965672 0.46615779 0.38006783 0.16874886
		 0.46871543 0.39955235 0.18114328 0.30448997 0.37564182 0.19726229 0.31911713 0.35061455 0.28728342
		 0.48549068 0.33174229 0.24330378 0.48835933 0.35504055 0.25720716 0.28831398 0.5054121 0.11101329
		 0.28866976 0.52845097 0.11407077 0.44813544 0.53354168 0.087279081 0.44708312 0.51041031 0.083472967
		 0.46990716 0.40738583 0.18006206 0.36525363 0.51694298 0.065803289 0.3666411 0.53094006 0.10097075
		 0.37311876 0.5045948 0.14257383 0.38611084 0.42299271 0.23039007 0.38001829 0.39707565 0.19673347
		 0.40406555 0.3405447 0.3130796 0.40392071 0.31730175 0.29867411 0.39766127 0.3782692 0.18091297
		 0.39218861 0.39321995 0.16685033 0.020993434 -0.0040416718 -0.29880381 0.45167649 0.50520039 0.048008919
		 0.30510241 0.4057827 0.20627356 0.7011072 0.02476847 0.50428712 0.72537875 -0.0029182434 0.23449707
		 0.60502899 0.11456585 0.66683435 0.10342769 -0.019599915 0.35778451 0.15565325 0.018243652 0.62711447
		 0.30523604 0.11397266 0.79315853 0.57882595 0.069301605 -0.047760367 0.078810781 0.076945305 0.051776886
		 0.56185842 -0.0040359497 -0.1347934 0.5108707 -0.0040788651 -0.38407391 0.31765783 0.0088863373 -0.48129314
		 0.061533242 0.0027170181 -0.037410021 0.47031736 0.42098522 0.18912697 0.3084892 0.42244911 0.21607351
		 0.3934257 0.47854137 0.13328063 0.37881112 0.40661907 0.19409561 0.39902145 0.42093372 0.20109606
		 0.37992841 0.49112892 0.070141196 0.38276172 0.62930202 0.11137491 0.35664463 0.63467216 0.067710817
		 0.36779809 0.41895103 0.060357213 0.3856172 0.31673622 0.19807458 0.52422559 0.5083704 -0.0076078619
		 0.51273572 0.46760082 -0.06329076 0.36045647 0.48248577 0.033167958 0.16674641 0.47866726 0.0021106754
		 0.17940617 0.49739742 0.063461974 0.1098614 0.097268105 0.4551686 0.089878403 0.10451565 0.47435763
		 0.10082994 0.030368425 0.4735046 0.10351878 -0.0080255512 0.47628075 0.11735999 -0.01197586 0.47419447
		 0.30818942 0.029337313 0.55144656 0.5536769 0.029437449 0.48975793 0.70333672 -0.011432075 0.35006341
		 0.74265844 0.0056877141 0.35211605 0.75418985 0.029673005 0.35378498 0.7610153 0.09919624 0.34433413
		 0.74195802 0.095346838 0.34152642 0.47283095 0.53349972 0.033085018 0.38134506 0.56021547 0.090758055
		 0.2381219 0.5273304 0.078312486;
	setAttr -s 645 ".ed";
	setAttr ".ed[0:165]"  160 4 0 4 159 0 159 1 0 1 160 0 0 245 0 245 17 0 17 16 0
		 16 0 0 160 168 0 168 153 0 153 4 0 159 147 0 147 162 0 162 1 0 245 293 0 293 18 0
		 18 17 0 147 148 0 148 163 0 163 162 0 293 292 0 292 291 0 291 18 0 148 154 0 154 169 0
		 169 163 0 125 37 0 37 116 0 116 5 0 5 125 0 116 117 0 117 126 0 126 5 0 117 118 0
		 118 127 0 127 126 0 17 52 0 52 53 0 53 16 0 168 173 0 173 158 0 158 153 0 18 51 0
		 51 52 0 291 289 0 289 51 0 154 157 0 157 172 0 172 169 0 132 209 0 209 208 0 208 207 0
		 207 132 0 25 46 0 46 48 0 48 26 0 26 25 0 48 45 0 45 41 0 41 26 0 286 21 0 21 315 0
		 9 287 0 287 314 0 170 312 0 164 149 0 149 311 0 155 170 0 21 22 0 22 316 0 10 9 0
		 22 23 0 23 317 0 283 10 0 171 156 0 156 320 0 152 167 0 167 319 0 134 128 0 128 113 0
		 113 114 0 114 134 0 29 33 0 33 32 0 32 30 0 30 29 0 38 59 0 59 36 0 36 25 0 25 38 0
		 164 165 0 165 150 0 150 149 0 165 166 0 166 151 0 151 150 0 166 167 0 152 151 0 140 115 0
		 115 37 0 125 140 0 144 127 0 118 119 0 119 144 0 130 131 0 131 121 0 121 111 0 111 130 0
		 176 112 0 112 113 0 128 176 0 129 301 0 301 302 0 302 184 0 184 129 0 29 35 0 35 34 0
		 34 33 0 32 43 0 43 42 0 42 30 0 29 46 0 46 47 0 47 35 0 41 40 0 40 39 0 39 26 0 131 135 0
		 135 120 0 120 121 0 39 38 0 135 136 0 136 122 0 122 120 0 133 231 0 231 232 0 232 233 0
		 233 133 0 36 47 0 42 45 0 48 30 0 114 123 0 123 137 0 137 134 0 171 172 0 157 156 0
		 22 51 0 289 23 0 21 52 0 155 158 0 173 170 0 286 53 0 38 60 0 60 82 0 82 59 0 39 61 0
		 61 60 0 40 62 0 62 61 0 41 63 0 63 62 0 45 66 0 66 63 0 42 64 0 64 66 0 43 65 0;
	setAttr ".ed[166:331]" 65 64 0 32 54 0 54 65 0 33 55 0 55 54 0 34 56 0 56 55 0
		 35 57 0 57 56 0 47 67 0 67 57 0 36 58 0 58 67 0 82 58 0 69 146 0 146 68 0 68 96 0
		 96 69 0 146 24 0 24 76 0 76 68 0 24 49 0 49 81 0 81 76 0 49 28 0 28 78 0 78 81 0
		 28 238 0 238 72 0 72 78 0 12 13 0 13 239 0 239 238 0 238 12 0 13 14 0 14 240 0 240 239 0
		 14 15 0 15 241 0 241 240 0 15 321 0 31 241 0 31 44 0 44 80 0 80 79 0 79 31 0 44 27 0
		 27 77 0 77 80 0 27 7 0 7 71 0 71 77 0 7 6 0 6 70 0 70 71 0 6 69 0 96 70 0 60 88 0
		 88 110 0 110 82 0 61 89 0 89 88 0 62 90 0 90 89 0 63 91 0 91 90 0 66 94 0 94 91 0
		 64 92 0 92 94 0 65 93 0 93 92 0 54 83 0 83 93 0 55 84 0 84 83 0 56 85 0 85 84 0 57 86 0
		 86 85 0 67 95 0 95 86 0 58 87 0 87 95 0 110 87 0 68 97 0 97 124 0 124 96 0 76 104 0
		 104 97 0 81 109 0 109 104 0 78 106 0 106 109 0 72 100 0 100 106 0 72 73 0 73 101 0
		 101 100 0 73 74 0 74 102 0 102 101 0 74 75 0 75 103 0 103 102 0 75 79 0 79 107 0
		 107 103 0 80 108 0 108 107 0 77 105 0 105 108 0 71 99 0 99 105 0 70 98 0 98 99 0
		 124 98 0 88 116 0 37 110 0 89 117 0 90 118 0 91 119 0 94 122 0 122 119 0 92 120 0
		 93 121 0 83 111 0 84 112 0 112 111 0 85 113 0 86 114 0 95 123 0 87 115 0 115 123 0
		 97 125 0 5 124 0 104 140 0 109 137 0 137 140 0 106 134 0 100 128 0 101 176 0 102 130 0
		 130 176 0 103 131 0 107 135 0 108 136 0 105 144 0 144 136 0 99 127 0 98 126 0 137 141 0
		 141 186 0 186 140 0 123 139 0 139 141 0 115 138 0 138 139 0 186 138 0 119 142 0 142 210 0
		 210 144 0 122 143 0 143 142 0 136 145 0 145 143 0;
	setAttr ".ed[332:497]" 210 145 0 69 159 0 4 146 0 6 147 0 7 148 0 27 154 0
		 44 157 0 31 156 0 15 152 0 14 151 0 13 150 0 12 149 0 12 310 0 28 155 0 49 158 0
		 24 153 0 161 280 0 280 160 0 1 161 0 280 294 0 294 168 0 294 290 0 290 173 0 290 20 0
		 20 170 0 20 313 0 8 164 0 8 288 0 288 165 0 288 285 0 285 166 0 285 11 0 11 167 0
		 11 318 0 284 171 0 284 50 0 50 172 0 50 19 0 19 169 0 19 3 0 3 163 0 3 2 0 2 162 0
		 2 161 0 130 177 0 177 178 0 178 176 0 111 174 0 174 177 0 112 175 0 175 304 0 304 174 0
		 178 175 0 177 181 0 181 244 0 244 178 0 174 179 0 179 181 0 304 303 0 303 179 0 244 180 0
		 180 175 0 274 298 0 298 270 0 270 257 0 257 274 0 179 306 0 306 305 0 305 181 0 303 307 0
		 307 306 0 244 309 0 309 308 0 308 180 0 141 189 0 189 190 0 190 186 0 139 188 0 188 189 0
		 138 187 0 187 188 0 190 187 0 189 193 0 193 194 0 194 190 0 188 192 0 192 193 0 187 191 0
		 191 192 0 194 191 0 193 197 0 197 198 0 198 194 0 192 196 0 196 197 0 191 195 0 195 196 0
		 198 195 0 197 201 0 201 202 0 202 198 0 196 200 0 200 201 0 195 199 0 199 200 0 202 199 0
		 201 205 0 205 206 0 206 202 0 200 204 0 204 205 0 199 203 0 203 204 0 206 203 0 205 209 0
		 132 206 0 204 208 0 203 207 0 142 211 0 211 214 0 214 210 0 143 212 0 212 211 0 145 213 0
		 213 212 0 214 213 0 211 215 0 215 218 0 218 214 0 212 216 0 216 215 0 213 217 0 217 216 0
		 218 217 0 215 219 0 219 222 0 222 218 0 216 220 0 220 219 0 217 221 0 221 220 0 222 221 0
		 219 223 0 223 226 0 226 222 0 220 224 0 224 223 0 221 225 0 225 224 0 226 225 0 223 236 0
		 236 237 0 237 226 0 224 235 0 235 236 0 225 234 0 234 235 0 237 234 0 230 227 0 227 231 0
		 133 230 0 227 228 0 228 232 0 228 229 0 229 233 0 229 230 0;
	setAttr ".ed[498:644]" 228 235 0 234 229 0 227 236 0 230 237 0 239 73 0 240 74 0
		 241 75 0 181 243 0 243 246 0 246 244 0 305 281 0 281 243 0 185 301 0 301 323 0 300 281 0
		 281 322 0 129 309 0 309 242 0 242 324 0 243 248 0 248 250 0 250 246 0 281 249 0 249 248 0
		 255 282 0 282 298 0 274 255 0 242 246 0 250 247 0 247 242 0 248 269 0 269 266 0 266 250 0
		 249 268 0 268 269 0 265 276 0 276 277 0 277 264 0 264 265 0 266 267 0 267 247 0 279 299 0
		 299 295 0 295 256 0 256 279 0 252 253 0 253 257 0 257 295 0 295 252 0 276 275 0 275 259 0
		 259 263 0 263 276 0 251 254 0 254 296 0 296 255 0 255 251 0 260 278 0 278 279 0 256 260 0
		 256 270 0 270 261 0 261 260 0 275 298 0 282 259 0 282 258 0 258 262 0 262 259 0 277 278 0
		 260 264 0 261 265 0 274 273 0 273 251 0 262 182 0 182 263 0 251 267 0 266 254 0 272 273 0
		 273 253 0 253 268 0 268 272 0 252 269 0 252 297 0 297 254 0 267 272 0 272 271 0 271 247 0
		 271 300 0 300 242 0 261 275 0 249 271 0 262 278 0 277 182 0 258 279 0 258 296 0 296 299 0
		 280 0 0 16 294 0 290 53 0 286 20 0 284 23 0 289 50 0 285 10 0 283 11 0 288 9 0 287 8 0
		 291 19 0 292 3 0 293 2 0 245 161 0 297 299 0 185 183 0 183 302 0 308 307 0 303 180 0
		 305 185 0 306 183 0 307 302 0 308 184 0 310 28 0 311 155 0 312 164 0 313 8 0 314 286 0
		 315 9 0 316 10 0 317 283 0 318 284 0 319 171 0 320 152 0 321 31 0 310 311 1 311 312 1
		 312 313 1 313 314 1 314 315 1 315 316 1 316 317 1 317 318 1 318 319 1 319 320 1 320 321 1
		 322 185 0 323 300 0 324 129 0 322 323 1 323 324 1;
	setAttr -s 1264 ".n";
	setAttr ".n[0:165]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 -0.29125464 -3.080344677 -0.26707453 -0.047757767 -3.045804501
		 -0.6045559 0.026760869 -2.93542862 1.013527989 -0.66577947 -2.8771956 0.960823 -2.57723594
		 -0.99624223 -1.41776097 -2.95417404 -0.91953105 0.2683292 -3.10492849 0 -0.064130433
		 -2.74375796 0.032819878 -1.45444417 -0.88965535 -0.6081118 -2.91262722 -0.97257763
		 0.10729192 -2.94741631 0.984146 0.10307143 -2.94372678 0.90136957 -0.61064601 -2.90849376
		 -0.047757767 -3.045804501 -0.6045559 0.029990684 -3.04923296 -0.58818322 -0.025121119
		 -2.93562436 1.012996912 0.026760869 -2.93542862 1.013527989 0.90136957 -0.61064601
		 -2.90849376 0.984146 0.10307143 -2.94372678 2.68359017 0.027636645 -1.56277645 2.49455595
		 -1.045875788 -1.52578568 0.029990684 -3.04923296 -0.58818322 0.15923913 -3.09261179
		 -0.23470497 0.15545341 -2.93110871 1.014462709 -0.025121119 -2.93562436 1.012996912
		 2.49455595 -1.045875788 -1.52578568 2.68359017 0.027636645 -1.56277645 3.087885141
		 -0.14371739 -0.29832608 2.92827964 -1.031577706 0.075652175 -2.21801257 2.14647508
		 -0.34314597 -1.15202177 2.87705588 0.20019564 -1.18912423 2.82871437 0.47858694 -1.54905283
		 2.43514585 -1.14681363 -1.54905283 2.43514585 -1.14681363 -1.18912423 2.82871437
		 0.47858694 1.19309318 2.83003736 0.46054968 1.50010562 2.45237255 -1.17483854 1.50010562
		 2.45237255 -1.17483854 1.19309318 2.83003736 0.46054968 1.11942852 2.88727021 0.23503107
		 2.19491625 2.16386652 -0.38040996 -0.66577947 -2.8771956 0.960823 0.026760869 -2.93542862
		 1.013527989 0 -3.04244113 0.62309629 -0.87867391 -2.93762422 0.49292856 -2.95417404
		 -0.91953105 0.2683292 -2.97848439 -0.87786335 -0.051692545 -3.093537331 0 -0.27334163
		 -3.10492849 0 -0.064130433 0.026760869 -2.93542862 1.013527989 -0.025121119 -2.93562436
		 1.012996912 9.316771e-06 -3.04244113 0.62308699 0 -3.04244113 0.62309629 -0.025121119
		 -2.93562436 1.012996912 0.15545341 -2.93110871 1.014462709 0.21078572 -3.038323164
		 0.60733235 9.316771e-06 -3.04244113 0.62308699 2.92827964 -1.031577706 0.075652175
		 3.087885141 -0.14371739 -0.29832608 3.074006319 -0.35679504 -0.26052794 2.92114592
		 -1.054316759 -0.0046273293 -1.29149687 -2.011810541 -1.98225784 -1.29149687 -2.011810541
		 -1.98225784 -2.13247848 -1.58786333 -1.60496581 -2.13247848 -1.58786333 -1.60496581
		 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011
		 0 0 3.10559011 0 0 3.10559011 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 -0.16532609 -2.87731981
		 1.15688503 -0.56913358 -2.96009302 0.74740684 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 -2.8800838 -0.83301556 0.80986959 -2.96984482 -0.52524847 0.74082607 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 0.30481368 -2.76954961 1.37163043 -0.16532609 -2.87731981
		 1.15688503 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0.55419564 -2.90665841 0.94281369
		 0.30481368 -2.76954961 1.37163043 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 2.80189443
		 -0.1148354 1.33450317 2.67066455 -0.72223604 1.41089129 -1.8856833 2.42338824 0.46483538
		 -1.36843789 2.77985096 -0.21092547 -0.64504659 2.96945667 -0.64104348 -0.67604661
		 2.96503115 0.62947208 -0.093242235 3.097764015 0.19961491 -0.18620187 3.074267149
		 0.39863047 -0.083534166 3.095658302 0.23368946 -0.041798137 3.10310555 0.11692857
		 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 -2.8800838 -0.83301556
		 0.80986959 -2.70815825 -0.94296271 1.19221735 -2.81440067 -0.55925155 1.18788517
		 -2.96984482 -0.52524847 0.74082607 0.56477952 -0.072310559 3.052947283 1.50546587
		 -0.29526711 2.70019865 1.5666678 0.44366148 2.64450645 0.53398758 0.79096889 2.95531988
		 1.50546587 -0.29526711 2.70019865 2.67066455 -0.72223604 1.41089129 2.80189443 -0.1148354
		 1.33450317 1.5666678 0.44366148 2.64450645 0.11563355 2.79203105 -1.35494411 0.11563355
		 2.79203105 -1.35494411 -1.15202177 2.87705588 0.20019564 -2.21801257 2.14647508 -0.34314597
		 -0.031636648 2.93299699 -1.020397544 2.19491625 2.16386652 -0.38040996 1.11942852
		 2.88727021 0.23503107 -0.031636648 2.93299699 -1.020397544 0.49497515 3.065773249
		 0.027037267 1.1062609 2.77630448 -0.84439754 0.21009006 2.64264917 -1.61770189 0.37687889
		 1.99311173 -2.35163045 -0.5990994 3.0057764053 0.50106835 -0.41513044 2.93086958
		 -0.9393416 -0.64504659 2.96945667 -0.64104348 -1.36843789 2.77985096 -0.21092547
		 -1.98328888 1.59794092 1.77703416 -0.06401553 3.080055952 0.39224535 -0.06401553
		 3.080055952 0.39224535 -2.33641934 2.022484541 0.30886337 -0.093242235 3.097764015
		 0.19961491 -0.16713354 3.089723587 0.2652702 -0.33255902 3.042282581 0.52783233 -0.18620187
		 3.074267149 0.39863047 -0.041798137 3.10310555 0.11692857 -0.083534166 3.095658302
		 0.23368946 -0.12795652 3.096534252 0.19949378 -0.064024851 3.10332608 0.099819869
		 -0.093242235 3.097764015 0.19961491 0 3.10559011 0 0 3.10559011 0 -0.16713354 3.089723587
		 0.2652702 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 1.1062609 2.77630448
		 -0.84439754 1.25486028 2.8161211 0.37346894 0.011801243 3.064372778 0.50415218 0.21009006
		 2.64264917 -1.61770189 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011
		 0 1.25486028 2.8161211 0.37346894 2.42900634 1.78178263 0.75489753;
	setAttr ".n[166:331]" -type "float3"  0 2.63218331 1.64812124 0.011801243 3.064372778
		 0.50415218 0.83290058 -2.94854355 -0.50700313 0.83290058 -2.94854355 -0.50700313
		 0.89000618 -2.93660259 0.47848138 0.89000618 -2.93660259 0.47848138 0 3.10559011
		 0 0 3.10559011 0 0 3.10559011 0 0 3.10559011 0 -0.041798137 3.10310555 0.11692857
		 -0.064024851 3.10332608 0.099819869 0 3.10559011 0 0 3.10559011 0 -0.093242235 3.097764015
		 0.19961491 -0.041798137 3.10310555 0.11692857 0 3.10559011 0 0 3.10559011 0 -1.8856833
		 2.42338824 0.46483538 -0.67604661 2.96503115 0.62947208 -0.41924533 2.67021751 1.52933228
		 -2.54484797 1.60244107 0.77499384 3.082925558 -0.3470093 0.14084783 2.92502809 -1.040881991
		 0.074006215 2.92114592 -1.054316759 -0.0046273293 3.074006319 -0.35679504 -0.26052794
		 0.20904969 -3.088649035 -0.24746273 -0.077559009 -3.10140681 -0.14125776 9.316771e-06
		 -3.04244113 0.62308699 0.21078572 -3.038323164 0.60733235 -0.077559009 -3.10140681
		 -0.14125776 0.021748448 -3.10308719 -0.12273603 0 -3.04244113 0.62309629 9.316771e-06
		 -3.04244113 0.62308699 -2.99864912 -0.79344726 -0.15244099 -3.093146086 -0.24234471
		 -0.13564286 -3.093537331 0 -0.27334163 -2.97848439 -0.87786335 -0.051692545 0.021748448
		 -3.10308719 -0.12273603 -0.47841614 -3.061782837 -0.20318633 -0.87867391 -2.93762422
		 0.49292856 0 -3.04244113 0.62309629 2.78554988 0 1.37310255 1.11233544 0 2.89955282
		 1.22161186 0.15185094 2.85119271 2.80991626 -0.13871428 1.31522679 1.11233544 0 2.89955282
		 -1.21613038 0 2.85757136 -1.29597211 0.20780125 2.81459951 1.22161186 0.15185094
		 2.85119271 -1.21613038 0 2.85757136 -2.89380121 0 1.12721431 -2.92307448 0.00097204972
		 1.048959613 -1.29597211 0.20780125 2.81459951 -2.89380121 0 1.12721431 -3.10263991
		 0 -0.13536026 -3.10254645 0.0032049688 -0.13740994 -2.92307448 0.00097204972 1.048959613
		 -3.10263991 0 -0.13536026 -3.10439444 0.0035745343 -0.08613044 -3.10440993 0.0041273292
		 -0.085441001 -3.10254645 0.0032049688 -0.13740994 -3.10439444 0.0035745343 -0.08613044
		 -3.058233023 0.33092237 0.42708075 -3.081736088 -0.29538199 0.24564907 -3.10440993
		 0.0041273292 -0.085441001 -3.058233023 0.33092237 0.42708075 -3.059649229 0.35211802
		 -0.39906213 -2.82632613 -1.19429505 -0.47981679 -3.081736088 -0.29538199 0.24564907
		 -3.059649229 0.35211802 -0.39906213 -2.68331051 0 -1.56350005 -2.68331051 0 -1.56350005
		 -2.82632613 -1.19429505 -0.47981679 0.81893176 0 -2.9956708 1.86939442 0 -2.47993183
		 1.67159319 -1.71962738 -1.97315538 0.81893176 0 -2.9956708 1.86939442 0 -2.47993183
		 2.34560871 -1.35483849 -1.51895654 2.15959024 -1.95397842 -1.078347802 1.67159319
		 -1.71962738 -1.97315538 2.34560871 -1.35483849 -1.51895654 1.88284469 -2.38381672
		 -0.64575464 2.31928873 -1.98153734 -0.58232611 2.15959024 -1.95397842 -1.078347802
		 1.88284469 -2.38381672 -0.64575464 2.85182285 -1.22377014 -0.11904658 2.99878263
		 -0.77520496 -0.22596584 2.31928873 -1.98153734 -0.58232611 2.85182285 -1.22377014
		 -0.11904658 3.1041491 0 0.094586954 3.1012671 -0.079099379 0.14343168 2.99878263
		 -0.77520496 -0.22596584 3.1041491 0 0.094586954 2.78554988 0 1.37310255 2.80991626
		 -0.13871428 1.31522679 3.1012671 -0.079099379 0.14343168 -0.9547857 -0.16697206 -2.95045662
		 -2.7328074 -0.040919255 -1.47471428 -2.78038502 -0.009680124 -1.38349378 -1.055984497
		 -0.28545654 -2.90656233 -2.7328074 -0.040919255 -1.47471428 -3.10483551 0 -0.068425469
		 -3.10478258 0.0066024843 -0.070450313 -2.78038502 -0.009680124 -1.38349378 -3.10483551
		 0 -0.068425469 -3.071512461 0.43730745 -0.13881677 -3.08182621 0.37837577 -0.062223606
		 -3.10478258 0.0066024843 -0.070450313 -3.071512461 0.43730745 -0.13881677 -2.92943811
		 1.0051801205 -0.22954658 -2.89236021 1.10469568 -0.24205901 -3.08182621 0.37837577
		 -0.062223606 -2.92943811 1.0051801205 -0.22954658 -2.72103119 1.49031985 0.14013045
		 -2.24015212 2.14606833 -0.14418945 -2.89236021 1.10469568 -0.24205901 -2.96255922
		 0.80085403 0.47599065 -2.80188513 1.0017763376 0.88914603 -1.22218013 2.62651873
		 1.11909628 -2.72103119 1.49031985 0.14013045 0.49390373 2.046990633 2.28267074 1.40854669
		 1.69219255 2.19024539 1.19792247 2.49182606 1.4143821 -1.22218013 2.62651873 1.11909628
		 1.40854669 1.69219255 2.19024539 2.78454661 0.76593786 1.14206827 2.64181066 1.46291935
		 0.72483855 1.19792247 2.49182606 1.4143821 2.78454661 0.76593786 1.14206827 1e+20
		 1e+20 1e+20 3.025425673 0.69397515 0.099478267 2.64181066 1.46291935 0.72483855 3.025425673
		 0.69397515 0.099478267 3.057847977 0.43967706 -0.3177267 2.96881366 0.88654661 -0.211823
		 2.80561805 1.33054042 0.053422358 3.057847977 0.43967706 -0.3177267 3.036133766 0.48084164
		 -0.44201866 3.0044472218 0.69978887 -0.35817081 2.96881366 0.88654661 -0.211823 3.036133766
		 0.48084164 -0.44201866 2.63869262 0.49405593 -1.56137574 2.7185154 0.46934786 -1.42620814
		 3.0044472218 0.69978887 -0.35817081 2.63869262 0.49405593 -1.56137574 0.91882604
		 0.013114906 -2.96652484 1.060444117 -0.16918322 -2.91402173 2.7185154 0.46934786
		 -1.42620814 0.91882604 0.013114906 -2.96652484 -0.9547857 -0.16697206 -2.95045662
		 -1.055984497 -0.28545654 -2.90656233 1.060444117 -0.16918322 -2.91402173 2.80991626
		 -0.13871428 1.31522679 1.22161186 0.15185094 2.85119271 1.49336958 -0.64926714 2.64442539
		 2.74342537 -0.99859321 1.058829188 1.22161186 0.15185094 2.85119271 -1.29597211 0.20780125
		 2.81459951 -1.48854351 -0.57514906 2.66422987 1.49336958 -0.64926714 2.64442539 -1.29597211
		 0.20780125 2.81459951 -2.92307448 0.00097204972 1.048959613 -2.91151857 -0.58051556
		 0.91145962 -1.48854351 -0.57514906 2.66422987;
	setAttr ".n[332:497]" -type "float3"  -2.92307448 0.00097204972 1.048959613
		 -3.10254645 0.0032049688 -0.13740994 -3.086770296 -0.33763665 -0.05046273 -2.91151857
		 -0.58051556 0.91145962 -3.10254645 0.0032049688 -0.13740994 -3.10440993 0.0041273292
		 -0.085441001 -3.10366774 -0.078307457 -0.076158382 -3.086770296 -0.33763665 -0.05046273
		 -3.10440993 0.0041273292 -0.085441001 -3.081736088 -0.29538199 0.24564907 -2.90813971
		 -1.088214278 -0.056503106 -3.10366774 -0.078307457 -0.076158382 -3.081736088 -0.29538199
		 0.24564907 -2.82632613 -1.19429505 -0.47981679 -1.83387256 -2.45405912 -0.50911492
		 -2.90813971 -1.088214278 -0.056503106 -2.82632613 -1.19429505 -0.47981679 -0.3841615
		 -2.94172049 -0.91836643 -0.49061802 -2.89918637 -0.99934787 -1.83387256 -2.45405912
		 -0.50911492 -0.3841615 -2.94172049 -0.91836643 1.67159319 -1.71962738 -1.97315538
		 1.11250937 -2.68595028 -1.092102528 -0.49061802 -2.89918637 -0.99934787 1.67159319
		 -1.71962738 -1.97315538 2.15959024 -1.95397842 -1.078347802 2.1787858 -2.050385237
		 -0.83276707 1.11250937 -2.68595028 -1.092102528 2.15959024 -1.95397842 -1.078347802
		 2.31928873 -1.98153734 -0.58232611 2.65391922 -1.49353421 -0.60890377 2.1787858 -2.050385237
		 -0.83276707 2.31928873 -1.98153734 -0.58232611 2.99878263 -0.77520496 -0.22596584
		 2.87975764 -0.97802794 -0.6286056 2.65391922 -1.49353421 -0.60890377 2.99878263 -0.77520496
		 -0.22596584 3.1012671 -0.079099379 0.14343168 2.91439748 -1.065114975 -0.12847516
		 2.87975764 -0.97802794 -0.6286056 3.1012671 -0.079099379 0.14343168 2.80991626 -0.13871428
		 1.31522679 2.74342537 -0.99859321 1.058829188 2.91439748 -1.065114975 -0.12847516
		 -1.055984497 -0.28545654 -2.90656233 -2.78038502 -0.009680124 -1.38349378 -2.8641367
		 0.58263355 -1.049742222 -1.3426367 0.42402485 -2.76807141 -2.78038502 -0.009680124
		 -1.38349378 -3.10478258 0.0066024843 -0.070450313 -3.055416107 0.5556491 0.019493788
		 -2.8641367 0.58263355 -1.049742222 -3.10478258 0.0066024843 -0.070450313 -3.08182621
		 0.37837577 -0.062223606 -3.016711235 0.71249068 0.19106211 -3.055416107 0.5556491
		 0.019493788 -3.08182621 0.37837577 -0.062223606 -2.89236021 1.10469568 -0.24205901
		 -2.84442234 1.24534166 0.05549068 -3.016711235 0.71249068 0.19106211 -2.89236021
		 1.10469568 -0.24205901 -2.24015212 2.14606833 -0.14418945 -2.096543312 2.28941917
		 0.088055901 -2.84442234 1.24534166 0.05549068 -2.24015212 2.14606833 -0.14418945
		 -0.83427328 2.98266768 0.22883852 -0.80843168 2.95946574 0.48237577 -2.096543312
		 2.28941917 0.088055901 -0.83427328 2.98266768 0.22883852 0.8107422 2.96450305 0.44622672
		 0.78972983 2.95985103 0.51019877 -0.80843168 2.95946574 0.48237577 0.8107422 2.96450305
		 0.44622672 2.19522667 2.17788196 0.28723603 1.94494104 2.4159348 0.15858385 0.78972983
		 2.95985103 0.51019877 2.19522667 2.17788196 0.28723603 2.80561805 1.33054042 0.053422358
		 2.41392255 1.94842553 0.14598137 1.94494104 2.4159348 0.15858385 2.80561805 1.33054042
		 0.053422358 2.96881366 0.88654661 -0.211823 2.79617381 1.34776402 0.098173916 2.41392255
		 1.94842553 0.14598137 2.96881366 0.88654661 -0.211823 3.0044472218 0.69978887 -0.35817081
		 2.95431066 0.94733226 -0.13891615 2.79617381 1.34776402 0.098173916 3.0044472218
		 0.69978887 -0.35817081 2.7185154 0.46934786 -1.42620814 2.80169272 0.78325778 -1.087071419
		 2.95431066 0.94733226 -0.13891615 2.7185154 0.46934786 -1.42620814 1.060444117 -0.16918322
		 -2.91402173 1.32490683 0.48563668 -2.7664907 2.80169272 0.78325778 -1.087071419 1.060444117
		 -0.16918322 -2.91402173 -1.055984497 -0.28545654 -2.90656233 -1.3426367 0.42402485
		 -2.76807141 1.32490683 0.48563668 -2.7664907 2.74342537 -0.99859321 1.058829188 1.49336958
		 -0.64926714 2.64442539 1.50462735 -1.56546903 2.22038198 2.50097203 -1.65721738 0.80216151
		 1.49336958 -0.64926714 2.64442539 -1.48854351 -0.57514906 2.66422987 -1.44832921
		 -1.52032304 2.28815532 1.50462735 -1.56546903 2.22038198 -1.48854351 -0.57514906
		 2.66422987 -2.91151857 -0.58051556 0.91145962 -2.77746272 -1.11909318 0.82341617
		 -1.44832921 -1.52032304 2.28815532 -2.91151857 -0.58051556 0.91145962 -3.086770296
		 -0.33763665 -0.05046273 -3.031565189 -0.66910249 -0.081276402 -2.77746272 -1.11909318
		 0.82341617 -3.086770296 -0.33763665 -0.05046273 -3.10366774 -0.078307457 -0.076158382
		 -3.085000038 -0.32274225 -0.15262112 -3.031565189 -0.66910249 -0.081276402 -3.10366774
		 -0.078307457 -0.076158382 -2.90813971 -1.088214278 -0.056503106 -2.83919883 -1.24785089
		 -0.16280124 -3.085000038 -0.32274225 -0.15262112 -2.90813971 -1.088214278 -0.056503106
		 -1.83387256 -2.45405912 -0.50911492 -1.75194418 -2.49943471 -0.5728882 -2.83919883
		 -1.24785089 -0.16280124 -1.83387256 -2.45405912 -0.50911492 -0.49061802 -2.89918637
		 -0.99934787 -0.39641306 -2.89703727 -1.046291947 -1.75194418 -2.49943471 -0.5728882
		 -0.49061802 -2.89918637 -0.99934787 1.11250937 -2.68595028 -1.092102528 0.83600622
		 -2.73268008 -1.21583235 -0.39641306 -2.89703727 -1.046291947 1.11250937 -2.68595028
		 -1.092102528 2.1787858 -2.050385237 -0.83276707 2.42256522 -1.652969 -1.021552801
		 0.83600622 -2.73268008 -1.21583235 2.1787858 -2.050385237 -0.83276707 2.65391922
		 -1.49353421 -0.60890377 2.62804651 -1.49104357 -0.71753418 2.42256522 -1.652969 -1.021552801
		 2.65391922 -1.49353421 -0.60890377 2.87975764 -0.97802794 -0.6286056 2.72207141 -1.29544413
		 -0.74622363 2.62804651 -1.49104357 -0.71753418 2.87975764 -0.97802794 -0.6286056
		 2.91439748 -1.065114975 -0.12847516 2.67055607 -1.5221647 -0.44252482 2.72207141
		 -1.29544413 -0.74622363 2.91439748 -1.065114975 -0.12847516 2.74342537 -0.99859321
		 1.058829188 2.50097203 -1.65721738 0.80216151 2.67055607 -1.5221647 -0.44252482 -1.3426367
		 0.42402485 -2.76807141 -2.8641367 0.58263355 -1.049742222 -2.21801257 2.14647508
		 -0.34314597 -1.54905283 2.43514585 -1.14681363 -2.8641367 0.58263355 -1.049742222
		 -3.055416107 0.5556491 0.019493788 -2.92271423 1.020251632 0.24801864 -2.21801257
		 2.14647508 -0.34314597 -3.055416107 0.5556491 0.019493788 -3.016711235 0.71249068
		 0.19106211;
	setAttr ".n[498:663]" -type "float3"  -2.54484797 1.60244107 0.77499384 -2.92271423
		 1.020251632 0.24801864 -3.016711235 0.71249068 0.19106211 -2.84442234 1.24534166
		 0.05549068 -1.8856833 2.42338824 0.46483538 -2.54484797 1.60244107 0.77499384 -2.84442234
		 1.24534166 0.05549068 -2.096543312 2.28941917 0.088055901 -1.36843789 2.77985096
		 -0.21092547 -1.8856833 2.42338824 0.46483538 -2.096543312 2.28941917 0.088055901
		 -0.80843168 2.95946574 0.48237577 -0.5990994 3.0057764053 0.50106835 -1.36843789
		 2.77985096 -0.21092547 -0.80843168 2.95946574 0.48237577 0.78972983 2.95985103 0.51019877
		 0.49497515 3.065773249 0.027037267 -0.5990994 3.0057764053 0.50106835 0.78972983
		 2.95985103 0.51019877 1.94494104 2.4159348 0.15858385 1.1062609 2.77630448 -0.84439754
		 0.49497515 3.065773249 0.027037267 1.94494104 2.4159348 0.15858385 2.41392255 1.94842553
		 0.14598137 1.25486028 2.8161211 0.37346894 1.1062609 2.77630448 -0.84439754 2.41392255
		 1.94842553 0.14598137 2.79617381 1.34776402 0.098173916 2.42900634 1.78178263 0.75489753
		 1.25486028 2.8161211 0.37346894 2.79617381 1.34776402 0.098173916 2.95431066 0.94733226
		 -0.13891615 2.95946288 0.93303102 0.12540062 2.42900634 1.78178263 0.75489753 2.95431066
		 0.94733226 -0.13891615 2.80169272 0.78325778 -1.087071419 2.19491625 2.16386652 -0.38040996
		 2.95946288 0.93303102 0.12540062 2.80169272 0.78325778 -1.087071419 1.32490683 0.48563668
		 -2.7664907 1.50010562 2.45237255 -1.17483854 2.19491625 2.16386652 -0.38040996 1.32490683
		 0.48563668 -2.7664907 -1.3426367 0.42402485 -2.76807141 -1.54905283 2.43514585 -1.14681363
		 1.50010562 2.45237255 -1.17483854 -2.92271423 1.020251632 0.24801864 -2.54484797
		 1.60244107 0.77499384 -2.92900014 0.89169872 0.5201087 -2.92900014 0.89169872 0.5201087
		 -0.10133229 -2.31112099 2.071987629 -0.10133229 -2.31112099 2.071987629 -0.038468946
		 -2.29300308 2.094124317 -0.038468946 -2.29300308 2.094124317 2.72207141 -1.29544413
		 -0.74622363 2.67055607 -1.5221647 -0.44252482 2.9927423 -0.72220188 -0.40816462 2.9927423
		 -0.72220188 -0.40816462 0.11563355 2.79203105 -1.35494411 0.11563355 2.79203105 -1.35494411
		 0.13935715 2.33635712 -2.041251659 0.13935715 2.33635712 -2.041251659 -0.031636648
		 2.93299699 -1.020397544 -0.031636648 2.93299699 -1.020397544 0.18547516 2.50332928
		 -1.82855904 0.18547516 2.50332928 -1.82855904 -3.031565189 -0.66910249 -0.081276402
		 -3.085000038 -0.32274225 -0.15262112 -2.85385108 -0.97322363 -0.74368012 -2.85385108
		 -0.97322363 -0.74368012 -0.12709318 -2.74692249 1.44324529 -0.12709318 -2.74692249
		 1.44324529 -0.18815839 -2.56297517 1.74368632 -0.18815839 -2.56297517 1.74368632
		 2.42900634 1.78178263 0.75489753 2.95946288 0.93303102 0.12540062 2.77918005 1.13205898
		 0.799559 2.77918005 1.13205898 0.799559 1.60395348 2.46016479 1.0097577572 0.37681058
		 2.41905904 1.91072059 0.37681058 2.41905904 1.91072059 1.60395348 2.46016479 1.0097577572
		 0.37681058 2.41905904 1.91072059 -0.60327017 2.32276702 1.97117078 -0.60327017 2.32276702
		 1.97117078 0.37681058 2.41905904 1.91072059 -0.60327017 2.32276702 1.97117078 -2.37820816
		 1.57579815 1.22706211 -2.37820816 1.57579815 1.22706211 -0.60327017 2.32276702 1.97117078
		 -2.37820816 1.57579815 1.22706211 -2.74004984 1.4603976 0.063711181 -2.74004984 1.4603976
		 0.063711181 -2.37820816 1.57579815 1.22706211 -2.74004984 1.4603976 0.063711181 -1.60024846
		 2.64357758 0.30886957 -1.60024846 2.64357758 0.30886957 -2.74004984 1.4603976 0.063711181
		 -1.60024846 2.64357758 0.30886957 -0.67158389 3.023152351 0.23282608 -0.67158389
		 3.023152351 0.23282608 -1.60024846 2.64357758 0.30886957 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 -0.53291619 2.93860888 -0.85162741 -0.53291619 2.93860888 -0.85162741
		 -0.53291619 2.93860888 -0.85162741 -0.43737268 2.61668944 -1.61440992 -0.43737268
		 2.61668944 -1.61440992 -0.53291619 2.93860888 -0.85162741 -0.43737268 2.61668944
		 -1.61440992 0.33472052 2.72303104 -1.45525157 0.33472052 2.72303104 -1.45525157 -0.43737268
		 2.61668944 -1.61440992 0.33472052 2.72303104 -1.45525157 0.82882613 2.94657445 -0.52482915
		 0.82882613 2.94657445 -0.52482915 0.33472052 2.72303104 -1.45525157 0.82882613 2.94657445
		 -0.52482915 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0.82882613 2.94657445 -0.52482915
		 0.26716772 3.088972092 0.17763975 0.66004038 3.023543596 -0.25927952 0.66004038 3.023543596
		 -0.25927952 0.26716772 3.088972092 0.17763975 0.66004038 3.023543596 -0.25927952
		 1.82697833 2.47309637 -0.4366087 1.82697833 2.47309637 -0.4366087 0.66004038 3.023543596
		 -0.25927952 1.82697833 2.47309637 -0.4366087 1.60395348 2.46016479 1.0097577572 1.60395348
		 2.46016479 1.0097577572 1.82697833 2.47309637 -0.4366087 -0.48237577 -2.27695036
		 -2.056090117 -1.3699441 -2.65830135 -0.83748758 -2.57723594 -0.99624223 -1.41776097
		 -0.88965535 -0.6081118 -2.91262722 -1.3699441 -2.65830135 -0.83748758 -1.99125779
		 -2.26851559 0.73035717 -2.95417404 -0.91953105 0.2683292 -2.57723594 -0.99624223
		 -1.41776097 -1.99125779 -2.26851559 0.73035717 -2.18274546 -2.1938386 0.25959629
		 -2.97848439 -0.87786335 -0.051692545 -2.95417404 -0.91953105 0.2683292 -2.18274546
		 -2.1938386 0.25959629 -2.050437927 -2.32053733 -0.23558697 -2.99864912 -0.79344726
		 -0.15244099 -2.97848439 -0.87786335 -0.051692545 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 -1.99441922 -2.19750619 0.91539443 -2.8800838 -0.83301556 0.80986959 -1.99441922
		 -2.19750619 0.91539443 -0.79712737 -2.12148142 2.123348 -2.70815825 -0.94296271 1.19221735
		 -2.8800838 -0.83301556 0.80986959 -0.79712737 -2.12148142 2.123348 1.078021765 -1.67892241
		 2.3798697 1.50546587 -0.29526711 2.70019865 0.56477952 -0.072310559 3.052947283 1.078021765
		 -1.67892241 2.3798697 1.82165849 -2.12368631 1.34767079 2.67066455 -0.72223604 1.41089129
		 1.50546587 -0.29526711 2.70019865;
	setAttr ".n[664:829]" -type "float3"  1.82165849 -2.12368631 1.34767079 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 2.67066455 -0.72223604 1.41089129 1.7283572 -2.57430458
		 -0.17444099 1.67643487 -2.5731833 0.46150312 2.92114592 -1.054316759 -0.0046273293
		 2.92502809 -1.040881991 0.074006215 1.67643487 -2.5731833 0.46150312 1.54214597 -2.57806849
		 0.78741932 2.92827964 -1.031577706 0.075652175 2.92114592 -1.054316759 -0.0046273293
		 1.54214597 -2.57806849 0.78741932 1.20881367 -2.72834468 -0.85999376 2.49455595 -1.045875788
		 -1.52578568 2.92827964 -1.031577706 0.075652175 1.20881367 -2.72834468 -0.85999376
		 0.46883851 -2.29171133 -2.042776346 0.90136957 -0.61064601 -2.90849376 2.49455595
		 -1.045875788 -1.52578568 0.46883851 -2.29171133 -2.042776346 -0.48237577 -2.27695036
		 -2.056090117 -0.88965535 -0.6081118 -2.91262722 0.90136957 -0.61064601 -2.90849376
		 -0.5990994 3.0057764053 0.50106835 0.49497515 3.065773249 0.027037267 -0.14242236
		 2.64931369 1.61417079 -0.14242236 2.64931369 1.61417079 3.10559011 0 0 3.10559011
		 0 0 3.091941118 -0.20524533 0.20606212 3.091941118 -0.20524533 0.20606212 -0.39641306
		 -2.89703727 -1.046291947 0.83600622 -2.73268008 -1.21583235 0.26141304 -2.83322668
		 -1.24466455 -0.014860248 -2.79621434 -1.3511709 -0.28566772 -2.82432604 -1.25946891
		 -3.10559011 0 0 -3.10559011 0 0 -3.091953516 -0.20486024 0.20627329 -3.091953516
		 -0.20486024 0.20627329 -0.14242236 2.64931369 1.61417079 -0.14242236 2.64931369 1.61417079
		 -0.08567702 2.46559644 1.8863138 -0.08567702 2.46559644 1.8863138 3.091941118 -0.20524533
		 0.20606212 3.091941118 -0.20524533 0.20606212 3.015002966 -0.56304967 0.48724845
		 3.015002966 -0.56304967 0.48724845 -0.28566772 -2.82432604 -1.25946891 -0.014860248
		 -2.79621434 -1.3511709 -0.037375778 -2.17720819 -2.21428251 -0.8785435 -2.07773304
		 -2.13445044 -3.091953516 -0.20486024 0.20627329 -3.091953516 -0.20486024 0.20627329
		 -3.017611742 -0.59205282 0.43379194 -3.017611742 -0.59205282 0.43379194 -0.048854034
		 -2.83755589 1.26118016 -0.048854034 -2.83755589 1.26118016 -0.053102486 -2.85331988
		 1.2249192 -0.053102486 -2.85331988 1.2249192 3.015002966 -0.56304967 0.48724845 3.015002966
		 -0.56304967 0.48724845 3.097602606 0.20148759 0.094614908 3.097602606 0.20148759
		 0.094614908 -0.8785435 -2.07773304 -2.13445044 -0.037375778 -2.17720819 -2.21428251
		 -0.044006214 -0.82685089 -2.99317098 -1.24383545 -0.78313047 -2.73573923 -3.017611742
		 -0.59205282 0.43379194 -3.017611742 -0.59205282 0.43379194 -2.44987273 1.20245647
		 1.48219883 -3.092959642 0.2097795 0.18515217 -0.29515529 2.19895339 2.17305589 -0.29515529
		 2.19895339 2.17305589 0.090661496 2.21863985 2.17119884 0.090661496 2.21863985 2.17119884
		 -0.038468946 -2.29300308 2.094124317 -0.038468946 -2.29300308 2.094124317 -0.1020559
		 -2.37849998 1.99424219 -0.1020559 -2.37849998 1.99424219 0.11234473 -2.17942858 -2.20955896
		 0.11234473 -2.17942858 -2.20955896 -0.18113044 -2.18706536 -2.19741297 -0.18113044
		 -2.18706536 -2.19741297 0.13935715 2.33635712 -2.041251659 0.13935715 2.33635712
		 -2.041251659 0.20309938 2.42366147 -1.93114293 0.20309938 2.42366147 -1.93114293
		 0.090661496 2.21863985 2.17119884 0.090661496 2.21863985 2.17119884 0.25994098 2.22524238
		 2.15068007 0.25994098 2.22524238 2.15068007 -0.1020559 -2.37849998 1.99424219 -0.1020559
		 -2.37849998 1.99424219 -0.17764287 -2.47225142 1.87112105 -0.17764287 -2.47225142
		 1.87112105 -0.18113044 -2.18706536 -2.19741297 -0.18113044 -2.18706536 -2.19741297
		 -0.2580559 -2.19591928 -2.18083239 -0.2580559 -2.19591928 -2.18083239 0.20309938
		 2.42366147 -1.93114293 0.20309938 2.42366147 -1.93114293 0.1777205 2.47275782 -1.87045038
		 0.1777205 2.47275782 -1.87045038 0.25994098 2.22524238 2.15068007 0.25994098 2.22524238
		 2.15068007 -0.43095654 2.22033238 2.12816787 -0.43095654 2.22033238 2.12816787 -0.17764287
		 -2.47225142 1.87112105 -0.17764287 -2.47225142 1.87112105 0.083074532 -2.57520175
		 1.73381674 0.083074532 -2.57520175 1.73381674 -0.2580559 -2.19591928 -2.18083239
		 -0.2580559 -2.19591928 -2.18083239 0.72161186 -2.15534782 -2.11623287 0.72161186
		 -2.15534782 -2.11623287 0.1777205 2.47275782 -1.87045038 0.1777205 2.47275782 -1.87045038
		 -0.089729816 2.58524227 -1.71847522 -0.089729816 2.58524227 -1.71847522 -0.43095654
		 2.22033238 2.12816787 -0.43095654 2.22033238 2.12816787 -0.89534783 2.15295672 2.051298141
		 -0.89534783 2.15295672 2.051298141 0.083074532 -2.57520175 1.73381674 0.083074532
		 -2.57520175 1.73381674 0.29249069 -2.35142875 2.0074689388 0.29249069 -2.35142875
		 2.0074689388 0.72161186 -2.15534782 -2.11623287 0.72161186 -2.15534782 -2.11623287
		 1.44093168 -1.97273922 -1.9174751 1.44093168 -1.97273922 -1.9174751 -0.089729816
		 2.58524227 -1.71847522 -0.089729816 2.58524227 -1.71847522 -0.32677951 2.3606956
		 -1.99123609 -0.32677951 2.3606956 -1.99123609 3.10504651 -0.045599379 0.035978261
		 3.10504651 -0.045599379 0.035978261 3.10504651 -0.045599379 0.035978261 3.10504651
		 -0.045599379 0.035978261 0.29249069 -2.35142875 2.0074689388 0.29249069 -2.35142875
		 2.0074689388 0.21581055 -2.58534479 1.70707762 0.21581055 -2.58534479 1.70707762
		 -3.10444736 -0.0066149067 -0.083956525 -3.10444736 -0.0066149067 -0.083956525 -3.10444736
		 -0.0066149067 -0.083956525 -3.10444736 -0.0066149067 -0.083956525 -0.32677951 2.3606956
		 -1.99123609 -0.32677951 2.3606956 -1.99123609 -0.24953416 2.55786347 -1.7434907 -0.24953416
		 2.55786347 -1.7434907 -0.31268013 -2.22104335 -2.1479969 -0.31268013 -2.22104335
		 -2.1479969 -1.29149687 -2.011810541 -1.98225784 -1.29149687 -2.011810541 -1.98225784
		 0.21581055 -2.58534479 1.70707762 0.21581055 -2.58534479 1.70707762 0.1292236 -2.97320509
		 0.88771427 0.1292236 -2.97320509 0.88771427 0.31700623 2.19128895 2.17771745 0.31700623
		 2.19128895 2.17771745 0.31700623 2.19128895 2.17771745 0.31700623 2.19128895 2.17771745
		 -0.24953416 2.55786347 -1.7434907;
	setAttr ".n[830:995]" -type "float3"  -0.24953416 2.55786347 -1.7434907 -0.14204037
		 2.94489145 -0.97577018 -0.14204037 2.94489145 -0.97577018 0.18547516 2.50332928 -1.82855904
		 0.18547516 2.50332928 -1.82855904 0.20836335 2.38748765 -1.97513974 0.20836335 2.38748765
		 -1.97513974 -2.85385108 -0.97322363 -0.74368012 -2.85385108 -0.97322363 -0.74368012
		 -2.59264922 -1.27242243 -1.14184475 -2.59264922 -1.27242243 -1.14184475 -0.18815839
		 -2.56297517 1.74368632 -0.18815839 -2.56297517 1.74368632 -0.21486336 -2.40301228
		 1.9555186 -0.21486336 -2.40301228 1.9555186 2.77918005 1.13205898 0.799559 2.77918005
		 1.13205898 0.799559 2.50848126 1.39254355 1.18870819 2.50848126 1.39254355 1.18870819
		 0.20836335 2.38748765 -1.97513974 0.20836335 2.38748765 -1.97513974 -0.11820187 2.15619874
		 -2.23193169 -0.11820187 2.15619874 -2.23193169 -2.68132925 1.21087575 0.99445343
		 -2.68132925 1.21087575 0.99445343 -2.68132925 1.21087575 0.99445343 -2.68132925 1.21087575
		 0.99445343 -0.21486336 -2.40301228 1.9555186 -0.21486336 -2.40301228 1.9555186 0.26461801
		 -2.37847829 1.97927022 0.26461801 -2.37847829 1.97927022 2.62131691 -1.24695349 -1.10385716
		 2.62131691 -1.24695349 -1.10385716 2.62131691 -1.24695349 -1.10385716 2.62131691
		 -1.24695349 -1.10385716 -0.11820187 2.15619874 -2.23193169 -0.11820187 2.15619874
		 -2.23193169 -0.8279286 2.017217398 -2.21134782 -0.8279286 2.017217398 -2.21134782
		 1.27609932 2.032965899 1.97061181 1.27609932 2.032965899 1.97061181 2.47838807 1.32789135
		 1.31870508 2.47838807 1.32789135 1.31870508 0.26461801 -2.37847829 1.97927022 0.26461801
		 -2.37847829 1.97927022 0.67926091 -2.15287566 2.13270497 0.67926091 -2.15287566 2.13270497
		 -2.21659946 -1.54765224 -1.52845037 -2.21659946 -1.54765224 -1.52845037 -2.69571757
		 -1.12018013 -1.059708118 -2.69571757 -1.12018013 -1.059708118 -0.8279286 2.017217398
		 -2.21134782 -0.8279286 2.017217398 -2.21134782 -0.99012107 2.1738975 -1.98456836
		 -0.99012107 2.1738975 -1.98456836 2.47838807 1.32789135 1.31870508 2.47838807 1.32789135
		 1.31870508 2.98316169 0.66805589 0.54693788 2.98316169 0.66805589 0.54693788 0.67926091
		 -2.15287566 2.13270497 0.67926091 -2.15287566 2.13270497 0.70343786 -1.9489814 2.31329489
		 0.70343786 -1.9489814 2.31329489 -2.69571757 -1.12018013 -1.059708118 -2.69571757
		 -1.12018013 -1.059708118 -2.92053413 -0.85424221 -0.62083232 -2.92053413 -0.85424221
		 -0.62083232 -0.99012107 2.1738975 -1.98456836 -0.99012107 2.1738975 -1.98456836 -0.80121428
		 2.32490063 -1.89672685 -0.80121428 2.32490063 -1.89672685 2.98316169 0.66805589 0.54693788
		 2.98316169 0.66805589 0.54693788 2.92527318 0.91391617 0.50220811 2.92527318 0.91391617
		 0.50220811 0.70343786 -1.9489814 2.31329489 0.70343786 -1.9489814 2.31329489 0.79194099
		 -2.0087547302 2.23213363 0.79194099 -2.0087547302 2.23213363 -2.92053413 -0.85424221
		 -0.62083232 -2.92053413 -0.85424221 -0.62083232 -2.91735101 -0.95499074 -0.47089133
		 -2.91735101 -0.95499074 -0.47089133 -0.73199379 2.35425162 -1.88848448 -0.73199379
		 2.35425162 -1.88848448 -0.6127578 2.2054441 -2.098866463 -0.6127578 2.2054441 -2.098866463
		 2.99015546 0.83006519 0.12103106 2.99015546 0.83006519 0.12103106 2.98288822 0.8641367
		 -0.018425465 2.98288822 0.8641367 -0.018425465 0.8480497 -2.41804671 1.75458086 0.8480497
		 -2.41804671 1.75458086 0.89000618 -2.93660259 0.47848138 0.89000618 -2.93660259 0.47848138
		 -3.041950226 -0.62548137 0.0030559008 -3.041950226 -0.62548137 0.0030559008 -3.067705154
		 -0.42642236 0.22813044 -3.067705154 -0.42642236 0.22813044 0.8480497 -2.41804671
		 1.75458086 0.8480497 -2.41804671 1.75458086 0.79194099 -2.0087547302 2.23213363 0.79194099
		 -2.0087547302 2.23213363 2.99015546 0.83006519 0.12103106 2.99015546 0.83006519 0.12103106
		 2.92527318 0.91391617 0.50220811 2.92527318 0.91391617 0.50220811 -0.73199379 2.35425162
		 -1.88848448 -0.73199379 2.35425162 -1.88848448 -0.80121428 2.32490063 -1.89672685
		 -0.80121428 2.32490063 -1.89672685 -3.041950226 -0.62548137 0.0030559008 -3.041950226
		 -0.62548137 0.0030559008 -2.91735101 -0.95499074 -0.47089133 -2.91735101 -0.95499074
		 -0.47089133 -2.96255922 0.80085403 0.47599065 -2.72103119 1.49031985 0.14013045 -2.92943811
		 1.0051801205 -0.22954658 1e+20 1e+20 1e+20 -0.83427328 2.98266768 0.22883852 -2.24015212
		 2.14606833 -0.14418945 -2.72103119 1.49031985 0.14013045 -1.22218013 2.62651873 1.11909628
		 0.8107422 2.96450305 0.44622672 -0.83427328 2.98266768 0.22883852 -1.22218013 2.62651873
		 1.11909628 1.19792247 2.49182606 1.4143821 2.19522667 2.17788196 0.28723603 0.8107422
		 2.96450305 0.44622672 1.19792247 2.49182606 1.4143821 2.64181066 1.46291935 0.72483855
		 2.80561805 1.33054042 0.053422358 2.19522667 2.17788196 0.28723603 2.64181066 1.46291935
		 0.72483855 3.025425673 0.69397515 0.099478267 0.079782613 -3.10445046 0.026540374
		 0.079782613 -3.10445046 0.026540374 0.079782613 -3.10445046 0.026540374 0.079782613
		 -3.10445046 0.026540374 0.66954035 2.33249998 1.93800008 1.058981419 1.78309631 2.31166768
		 1.33068943 1.4404161 2.40814281 0.84756517 1.96662414 2.24915838 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 0.10079193 0.4355652 3.073242426 1.33068943 1.4404161 2.40814281
		 -1.98328888 1.59794092 1.77703416 -2.44987273 1.20245647 1.48219883 -1.28624225 1.47367084
		 2.41217065 1e+20 1e+20 1e+20 -0.92831683 1.95381069 2.22835088 0.84756517 1.96662414
		 2.24915838 2.056186199 1.37573922 1.87726724 -2.098956585 1.3527081 1.84641623 0.84756517
		 1.96662414 2.24915838 1.33068943 1.4404161 2.40814281 2.79077029 0.91832608 1.0064657927
		 2.056186199 1.37573922 1.87726724 -0.044596273 -2.82132602 1.29723608 -0.044596273
		 -2.82132602 1.29723608 -0.048854034 -2.83755589 1.26118016 -0.048854034 -2.83755589
		 1.26118016 -1.28624225 1.47367084 2.41217065 -0.92831683 1.95381069 2.22835088 -2.098956585
		 1.3527081 1.84641623;
	setAttr ".n[996:1161]" -type "float3"  -2.78836966 0.92099071 1.010674 0.034024846
		 -2.44423914 1.91552484 0.034024846 -2.44423914 1.91552484 0.034024846 -2.44423914
		 1.91552484 0.034024846 -2.44423914 1.91552484 2.056186199 1.37573922 1.87726724 2.79077029
		 0.91832608 1.0064657927 3.10137892 -0.0038322981 -0.16160248 3.10137892 -0.0038322981
		 -0.16160248 1.23014283 -1.42904353 2.46764278 -0.10986957 -1.61864603 2.64813352
		 -0.10986957 -1.61864603 2.64813352 1.23014283 -1.42904353 2.46764278 -2.78836966
		 0.92099071 1.010674 -2.098956585 1.3527081 1.84641623 -3.10148764 -0.0071118013 -0.15941615
		 -3.10148764 -0.0071118013 -0.15941615 0.074726708 2.40534472 -1.96301556 0.074726708
		 2.40534472 -1.96301556 0.071583852 2.43065238 -1.9317081 0.071583852 2.43065238 -1.9317081
		 3.1034162 -0.014319876 -0.11526398 3.1034162 -0.014319876 -0.11526398 3.099701881
		 0.18169254 -0.059301242 3.099701881 0.18169254 -0.059301242 -0.12518634 2.76295352
		 1.41248131 -0.13752484 1.94767714 2.4150219 -0.20737888 2.0047051907 2.36280441 -0.26462734
		 2.75612736 1.40656209 -3.1034441 -0.021835405 -0.11337578 -3.1034441 -0.021835405
		 -0.11337578 -3.10273933 0.12588198 -0.043111801 -3.10273933 0.12588198 -0.043111801
		 0.022984471 -2.46908069 -1.88356221 0.11041926 -2.46434164 -1.88666773 0.11593168
		 -2.17086029 -2.2177949 0.11365218 -2.18890691 -2.20010233 3.10409617 0.095332295
		 0.013360249 3.10409617 0.095332295 0.013360249 3.10431981 -0.082211182 0.033596274
		 3.10431981 -0.082211182 0.033596274 -0.20737888 2.0047051907 2.36280441 -0.13752484
		 1.94767714 2.4150219 -0.12604347 0.79481989 2.99950933 -0.11825465 0.94517392 2.95590067
		 -3.10458064 0.0788882 0.0061086961 -3.10458064 0.0788882 0.0061086961 -3.10521126
		 -0.047403727 0.010593168 -3.10521126 -0.047403727 0.010593168 -0.06813354 -2.70140052
		 -1.53051555 0.10265528 -2.70811486 -1.51666152 0.11041926 -2.46434164 -1.88666773
		 0.022984471 -2.46908069 -1.88356221 3.10431981 -0.082211182 0.033596274 3.10431981
		 -0.082211182 0.033596274 3.10275769 0.070493788 -0.11231988 3.10275769 0.070493788
		 -0.11231988 -0.08942236 2.2980001 2.087074518 -0.089857146 2.28618312 2.099997044
		 -0.11091615 2.46948457 1.87990367 -0.11080124 2.48105597 1.86461174 -3.10521126 -0.047403727
		 0.010593168 -3.10521126 -0.047403727 0.010593168 -3.10275769 0.070493788 -0.11231677
		 -3.10275769 0.070493788 -0.11231677 -3.1034441 -0.021835405 -0.11337578 -3.1034441
		 -0.021835405 -0.11337578 -3.10148764 -0.0071118013 -0.15941615 -3.10148764 -0.0071118013
		 -0.15941615 -0.1171708 3.059323072 0.52105588 -0.11091615 2.46948457 1.87990367 -0.11102795
		 2.45781994 1.89512122 -0.24486646 3.049142838 0.53615838 3.1034162 -0.014319876 -0.11526398
		 3.1034162 -0.014319876 -0.11526398 3.10137892 -0.0038322981 -0.16160248 3.10137892
		 -0.0038322981 -0.16160248 0.11159628 -2.42385721 -1.9383384 0.10073603 -2.41389441
		 -1.95132303 0.1028323 -2.44150949 -1.91654348 0.12657763 -2.4876833 -1.85475159 0.12657763
		 -2.4876833 -1.85475159 0.010667702 3.064226627 0.50506526 -0.1171708 3.059323072
		 0.52105588 -0.085658386 3.02829814 -0.68319875 0.1509472 3.023736 -0.69204968 0.064413048
		 -1.03031671 -2.92899084 0.064413048 -1.03031671 -2.92899084 0.26891926 -0.99180752
		 -2.93064594 0.26891926 -0.99180752 -2.93064594 -0.11080124 2.48105597 1.86461174
		 -0.11091615 2.46948457 1.87990367 -0.1171708 3.059323072 0.52105588 0.010667702 3.064226627
		 0.50506526 -0.13752484 1.94767714 2.4150219 -0.12518634 2.76295352 1.41248131 0.014509317
		 2.76418638 1.41554034 -0.065919258 1.88708377 2.46561503 -0.13351242 0.64244407 3.035478354
		 -0.12604347 0.79481989 2.99950933 -0.13752484 1.94767714 2.4150219 -0.065919258 1.88708377
		 2.46561503 -0.11102795 2.45781994 1.89512122 -0.11091615 2.46948457 1.87990367 -0.089857146
		 2.28618312 2.099997044 -0.090288818 2.27429199 2.11285114 -0.085658386 3.02829814
		 -0.68319875 -0.1171708 3.059323072 0.52105588 -0.24486646 3.049142838 0.53615838
		 -0.32176709 3.015254736 -0.67037576 0.27313045 -2.70657468 -1.49818325 0.19792236
		 -2.45762753 -1.88827646 0.11041926 -2.46434164 -1.88666773 0.10265528 -2.70811486
		 -1.51666152 0.11593168 -2.17086029 -2.2177949 0.11041926 -2.46434164 -1.88666773
		 0.19792236 -2.45762753 -1.88827646 0.11819875 -2.15267086 -2.23533535 0.074726708
		 2.40534472 -1.96301556 0.074726708 2.40534472 -1.96301556 0.077857144 2.37962747
		 -1.99399066 0.077857144 2.37962747 -1.99399066 -1.99125779 -2.26851559 0.73035717
		 -1.3699441 -2.65830135 -0.83748758 -0.29125464 -3.080344677 -0.26707453 -0.66577947
		 -2.8771956 0.960823 -3.10273933 0.12588198 -0.043111801 -3.10273933 0.12588198 -0.043111801
		 -3.10458064 0.0788882 0.0061086961 -3.10458064 0.0788882 0.0061086961 -0.14038199
		 -1.064201832 -2.91418338 0.064413048 -1.03031671 -2.92899084 0.064413048 -1.03031671
		 -2.92899084 -0.14038199 -1.064201832 -2.91418338 -0.10986957 -1.61864603 2.64813352
		 -0.10986957 -1.61864603 2.64813352 -1.42864907 -1.49539137 2.31677938 -1.42864907
		 -1.49539137 2.31677938 -2.050437927 -2.32053733 -0.23558697 -2.18274546 -2.1938386
		 0.25959629 -0.87867391 -2.93762422 0.49292856 -0.47841614 -3.061782837 -0.20318633
		 1.67643487 -2.5731833 0.46150312 1.7283572 -2.57430458 -0.17444099 0.20904969 -3.088649035
		 -0.24746273 0.21078572 -3.038323164 0.60733235 1.82165849 -2.12368631 1.34767079
		 1.078021765 -1.67892241 2.3798697 0.30481368 -2.76954961 1.37163043 0.55419564 -2.90665841
		 0.94281369 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1.82165849 -2.12368631 1.34767079
		 0.55419564 -2.90665841 0.94281369 1.078021765 -1.67892241 2.3798697 -0.79712737 -2.12148142
		 2.123348 -0.16532609 -2.87731981 1.15688503 0.30481368 -2.76954961 1.37163043 -1.99441922
		 -2.19750619 0.91539443 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 -0.56913358 -2.96009302
		 0.74740684 -0.79712737 -2.12148142 2.123348 -1.99441922 -2.19750619 0.91539443 -0.56913358
		 -2.96009302 0.74740684 -0.16532609 -2.87731981 1.15688503;
	setAttr ".n[1162:1263]" -type "float3"  1.54214597 -2.57806849 0.78741932 1.67643487
		 -2.5731833 0.46150312 0.21078572 -3.038323164 0.60733235 0.15545341 -2.93110871 1.014462709
		 -2.18274546 -2.1938386 0.25959629 -1.99125779 -2.26851559 0.73035717 -0.66577947
		 -2.8771956 0.960823 -0.87867391 -2.93762422 0.49292856 1.20881367 -2.72834468 -0.85999376
		 1.54214597 -2.57806849 0.78741932 0.15545341 -2.93110871 1.014462709 0.15923913 -3.09261179
		 -0.23470497 0.46883851 -2.29171133 -2.042776346 1.20881367 -2.72834468 -0.85999376
		 0.15923913 -3.09261179 -0.23470497 0.029990684 -3.04923296 -0.58818322 -0.48237577
		 -2.27695036 -2.056090117 0.46883851 -2.29171133 -2.042776346 0.029990684 -3.04923296
		 -0.58818322 -0.047757767 -3.045804501 -0.6045559 3.099701881 0.18169254 -0.059301242
		 3.099701881 0.18169254 -0.059301242 3.10409617 0.095332295 0.013360249 3.10409617
		 0.095332295 0.013360249 -1.3699441 -2.65830135 -0.83748758 -0.48237577 -2.27695036
		 -2.056090117 -0.047757767 -3.045804501 -0.6045559 -0.29125464 -3.080344677 -0.26707453
		 0.10073603 -2.41389441 -1.95132303 0.087754659 -2.37554669 -1.99844098 0.07901863
		 -2.39368939 -1.97704351 0.1028323 -2.44150949 -1.91654348 0.096481368 -2.35719562
		 -2.019658327 0.087754659 -2.37554669 -1.99844098 0.10073603 -2.41389441 -1.95132303
		 0.11159628 -2.42385721 -1.9383384 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 -1.28624225
		 1.47367084 2.41217065 0.10079193 0.4355652 3.073242426 2.29851866 2.078347921 -0.2048758
		 2.29851866 2.078347921 -0.2048758 -0.06401553 3.080055952 0.39224535 -0.06401553
		 3.080055952 0.39224535 0.80624539 -2.11334777 -2.12800932 1.17067075 -0.7402795 -2.77960563
		 -0.044006214 -0.82685089 -2.99317098 -0.037375778 -2.17720819 -2.21428251 0.26141304
		 -2.83322668 -1.24466455 0.80624539 -2.11334777 -2.12800932 -0.037375778 -2.17720819
		 -2.21428251 -0.014860248 -2.79621434 -1.3511709 1.2873385 0.75077641 2.72466135 1e+20
		 1e+20 1e+20 1.33068943 1.4404161 2.40814281 1.058981419 1.78309631 2.31166768 2.29851866
		 2.078347921 -0.2048758 2.29851866 2.078347921 -0.2048758 3.097602606 0.20148759 0.094614908
		 3.097602606 0.20148759 0.094614908 -0.033552796 -0.14217392 -3.10215235 -1.32004035
		 -0.19937578 -2.80400324 -1.24383545 -0.78313047 -2.73573923 -0.044006214 -0.82685089
		 -2.99317098 1.25901556 -0.05921429 -2.83832002 -0.033552796 -0.14217392 -3.10215235
		 -0.044006214 -0.82685089 -2.99317098 1.17067075 -0.7402795 -2.77960563 -1.98328888
		 1.59794092 1.77703416 -2.33641934 2.022484541 0.30886337 -3.092959642 0.2097795 0.18515217
		 -2.44987273 1.20245647 1.48219883 -0.72847515 2.33088827 1.91858697 -0.92831683 1.95381069
		 2.22835088 -1.28624225 1.47367084 2.41217065 -2.44987273 1.20245647 1.48219883 0.26716772
		 3.088972092 0.17763975 0.26716772 3.088972092 0.17763975 -2.99864912 -0.79344726
		 -0.15244099 -3.093146086 -0.24234471 -0.13564286 -2.050437927 -2.32053733 -0.23558697
		 -2.99864912 -0.79344726 -0.15244099 -2.050437927 -2.32053733 -0.23558697 -0.47841614
		 -3.061782837 -0.20318633 -0.47841614 -3.061782837 -0.20318633 0.021748448 -3.10308719
		 -0.12273603 0.021748448 -3.10308719 -0.12273603 -0.077559009 -3.10140681 -0.14125776
		 -0.077559009 -3.10140681 -0.14125776 0.20904969 -3.088649035 -0.24746273 1.7283572
		 -2.57430458 -0.17444099 0.20904969 -3.088649035 -0.24746273 1.7283572 -2.57430458
		 -0.17444099 2.92502809 -1.040881991 0.074006215 2.92502809 -1.040881991 0.074006215
		 3.082925558 -0.3470093 0.14084783 -0.67158389 3.023152351 0.23282608 -0.67158389
		 3.023152351 0.23282608 1.2873385 0.75077641 2.72466135 0.10079193 0.4355652 3.073242426
		 -1.98328888 1.59794092 1.77703416 0.10079193 0.4355652 3.073242426;
	setAttr -s 322 -ch 1290 ".fc[0:321]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 2 3
		f 4 4 5 6 7
		mu 0 4 4 5 6 7
		f 4 8 9 10 -1
		mu 0 4 0 8 9 1
		f 4 -3 11 12 13
		mu 0 4 10 11 12 13
		f 4 14 15 16 -6
		mu 0 4 5 14 15 6
		f 4 -13 17 18 19
		mu 0 4 13 12 16 17
		f 4 20 21 22 -16
		mu 0 4 14 18 19 15
		f 4 -19 23 24 25
		mu 0 4 17 16 20 21
		f 4 26 27 28 29
		mu 0 4 22 23 24 25
		f 4 -29 30 31 32
		mu 0 4 26 27 28 29
		f 4 -32 33 34 35
		mu 0 4 29 28 30 31
		f 4 -7 36 37 38
		mu 0 4 7 6 32 33
		f 4 39 40 41 -10
		mu 0 4 8 34 35 9
		f 4 -17 42 43 -37
		mu 0 4 6 15 36 32
		f 4 -23 44 45 -43
		mu 0 4 15 19 37 36
		f 4 -25 46 47 48
		mu 0 4 21 20 38 39
		f 4 49 50 51 52
		mu 0 4 40 41 42 466
		f 4 53 54 55 56
		mu 0 4 44 45 46 47
		f 4 -56 57 58 59
		mu 0 4 47 46 48 49
		f 4 633 622 62 63
		mu 0 4 50 51 52 53
		f 4 630 619 65 66
		mu 0 4 54 55 56 57
		f 4 634 623 70 -623
		mu 0 4 51 58 59 52
		f 4 635 624 73 -624
		mu 0 4 58 60 61 59
		f 4 638 627 76 77
		mu 0 4 62 63 64 65
		f 4 78 79 80 81
		mu 0 4 66 67 68 69
		f 4 82 83 84 85
		mu 0 4 70 71 72 73
		f 4 86 87 88 89
		mu 0 4 74 75 76 44
		f 4 90 91 92 -66
		mu 0 4 56 77 78 57
		f 4 93 94 95 -92
		mu 0 4 77 79 80 78
		f 4 96 -77 97 -95
		mu 0 4 79 65 64 80
		f 4 98 99 -27 100
		mu 0 4 81 82 23 22
		f 4 101 -35 102 103
		mu 0 4 83 31 30 84
		f 4 104 105 106 107
		mu 0 4 85 86 87 88
		f 4 108 109 -80 110
		mu 0 4 89 90 68 67
		f 4 111 112 113 114
		mu 0 4 91 92 93 94
		f 4 115 116 117 -83
		mu 0 4 70 95 96 71
		f 4 -85 118 119 120
		mu 0 4 73 72 97 98
		f 4 121 122 123 -116
		mu 0 4 70 45 99 95
		f 4 -60 124 125 126
		mu 0 4 47 49 100 101
		f 4 127 128 129 -106
		mu 0 4 86 102 103 87
		f 4 -57 -127 130 -90
		mu 0 4 44 47 101 74
		f 4 131 132 133 -129
		mu 0 4 102 104 105 103
		f 4 134 135 136 137
		mu 0 4 106 107 108 109
		f 4 -89 138 -123 -54
		mu 0 4 44 76 99 45
		f 4 -121 139 -58 140
		mu 0 4 73 98 48 46
		f 4 -86 -141 -55 -122
		mu 0 4 70 73 46 45
		f 4 -82 141 142 143
		mu 0 4 66 69 110 111
		f 4 -75 144 -48 145
		mu 0 4 112 113 39 38
		f 4 -72 146 -46 147
		mu 0 4 114 115 36 37
		f 4 -69 148 -44 -147
		mu 0 4 115 116 32 36
		f 4 -68 149 -41 150
		mu 0 4 117 118 35 34
		f 4 -61 151 -38 -149
		mu 0 4 116 119 33 32
		f 4 -87 152 153 154
		mu 0 4 120 121 122 123
		f 4 -131 155 156 -153
		mu 0 4 124 125 126 127
		f 4 -126 157 158 -156
		mu 0 4 125 128 129 126
		f 4 -125 159 160 -158
		mu 0 4 128 130 131 129
		f 4 -59 161 162 -160
		mu 0 4 130 132 133 131
		f 4 -140 163 164 -162
		mu 0 4 132 134 135 133
		f 4 -120 165 166 -164
		mu 0 4 134 136 137 135
		f 4 -119 167 168 -166
		mu 0 4 136 138 139 137
		f 4 -84 169 170 -168
		mu 0 4 138 140 141 139
		f 4 -118 171 172 -170
		mu 0 4 140 142 143 141
		f 4 -117 173 174 -172
		mu 0 4 142 144 145 143
		f 4 -124 175 176 -174
		mu 0 4 144 146 147 145
		f 4 -139 177 178 -176
		mu 0 4 146 148 149 147
		f 4 -88 -155 179 -178
		mu 0 4 148 120 123 149
		f 4 180 181 182 183
		mu 0 4 150 151 152 153
		f 4 184 185 186 -182
		mu 0 4 151 154 155 152
		f 4 187 188 189 -186
		mu 0 4 154 156 157 155
		f 4 190 191 192 -189
		mu 0 4 156 158 159 157
		f 4 193 194 195 -192
		mu 0 4 158 160 161 159
		f 4 196 197 198 199
		mu 0 4 162 163 164 160
		f 4 200 201 202 -198
		mu 0 4 163 165 166 164
		f 4 203 204 205 -202
		mu 0 4 165 167 168 166
		f 4 206 628 207 -205
		mu 0 4 167 169 170 168
		f 4 208 209 210 211
		mu 0 4 170 171 172 173
		f 4 212 213 214 -210
		mu 0 4 171 174 175 172
		f 4 215 216 217 -214
		mu 0 4 174 176 177 175
		f 4 218 219 220 -217
		mu 0 4 176 178 179 177
		f 4 221 -184 222 -220
		mu 0 4 178 180 181 179
		f 4 -154 223 224 225
		mu 0 4 123 122 182 183
		f 4 -157 226 227 -224
		mu 0 4 127 126 184 185
		f 4 -159 228 229 -227
		mu 0 4 126 129 186 184
		f 4 -161 230 231 -229
		mu 0 4 129 131 187 186
		f 4 -163 232 233 -231
		mu 0 4 131 133 188 187
		f 4 -165 234 235 -233
		mu 0 4 133 135 189 188
		f 4 -167 236 237 -235
		mu 0 4 135 137 190 189
		f 4 -169 238 239 -237
		mu 0 4 137 139 191 190
		f 4 -171 240 241 -239
		mu 0 4 139 141 192 191
		f 4 -173 242 243 -241
		mu 0 4 141 143 193 192
		f 4 -175 244 245 -243
		mu 0 4 143 145 194 193
		f 4 -177 246 247 -245
		mu 0 4 145 147 195 194
		f 4 -179 248 249 -247
		mu 0 4 147 149 196 195
		f 4 -180 -226 250 -249
		mu 0 4 149 123 183 196
		f 4 -183 251 252 253
		mu 0 4 153 152 197 198
		f 4 -187 254 255 -252
		mu 0 4 152 155 199 197
		f 4 -190 256 257 -255
		mu 0 4 155 157 200 199
		f 4 -193 258 259 -257
		mu 0 4 157 159 201 200
		f 4 -196 260 261 -259
		mu 0 4 159 161 202 201
		f 4 262 263 264 -261
		mu 0 4 161 203 204 202
		f 4 265 266 267 -264
		mu 0 4 203 205 206 204
		f 4 268 269 270 -267
		mu 0 4 205 207 208 206
		f 4 271 272 273 -270
		mu 0 4 207 173 209 208
		f 4 -211 274 275 -273
		mu 0 4 173 172 210 209
		f 4 -215 276 277 -275
		mu 0 4 172 175 211 210
		f 4 -218 278 279 -277
		mu 0 4 175 177 212 211
		f 4 -221 280 281 -279
		mu 0 4 177 179 213 212
		f 4 -223 -254 282 -281
		mu 0 4 179 181 214 213
		f 4 -225 283 -28 284
		mu 0 4 183 182 215 216
		f 4 -228 285 -31 -284
		mu 0 4 185 184 217 218
		f 4 -230 286 -34 -286
		mu 0 4 184 186 219 217
		f 4 -232 287 -103 -287
		mu 0 4 186 187 220 219
		f 4 -234 288 289 -288
		mu 0 4 187 188 221 220
		f 4 -236 290 -134 -289
		mu 0 4 188 189 222 221
		f 4 -238 291 -130 -291
		mu 0 4 189 190 223 222
		f 4 -240 292 -107 -292
		mu 0 4 190 191 224 223
		f 4 -242 293 294 -293
		mu 0 4 191 192 225 224
		f 4 -244 295 -110 -294
		mu 0 4 192 193 226 225
		f 4 -246 296 -81 -296
		mu 0 4 193 194 227 226
		f 4 -248 297 -142 -297
		mu 0 4 194 195 228 227
		f 4 -250 298 299 -298
		mu 0 4 195 196 229 228
		f 4 -251 -285 -100 -299
		mu 0 4 196 183 216 229
		f 4 -253 300 -30 301
		mu 0 4 198 197 22 25
		f 4 -256 302 -101 -301
		mu 0 4 197 199 81 22
		f 4 -258 303 304 -303
		mu 0 4 199 200 111 81
		f 4 -260 305 -144 -304
		mu 0 4 200 201 66 111
		f 4 -262 306 -79 -306
		mu 0 4 201 202 67 66
		f 4 -265 307 -111 -307
		mu 0 4 202 204 89 67
		f 4 -268 308 309 -308
		mu 0 4 204 206 85 89
		f 4 -271 310 -105 -309
		mu 0 4 206 208 86 85
		f 4 -274 311 -128 -311
		mu 0 4 208 209 102 86
		f 4 -276 312 -132 -312
		mu 0 4 209 210 104 102
		f 4 -278 313 314 -313
		mu 0 4 210 211 83 104
		f 4 -280 315 -102 -314
		mu 0 4 211 212 31 83
		f 4 -282 316 -36 -316
		mu 0 4 212 213 29 31
		f 4 -283 -302 -33 -317
		mu 0 4 213 214 26 29
		f 4 -305 317 318 319
		mu 0 4 230 231 232 233
		f 4 -143 320 321 -318
		mu 0 4 231 234 235 232
		f 4 -300 322 323 -321
		mu 0 4 236 237 238 239
		f 4 -99 -320 324 -323
		mu 0 4 240 230 233 241
		f 4 -104 325 326 327
		mu 0 4 242 243 244 245
		f 4 -290 328 329 -326
		mu 0 4 246 247 248 249
		f 4 -133 330 331 -329
		mu 0 4 247 250 251 248
		f 4 -315 -328 332 -331
		mu 0 4 252 242 245 253
		f 4 -181 333 -2 334
		mu 0 4 151 150 254 255
		f 4 -222 335 -12 -334
		mu 0 4 180 178 256 257
		f 4 -219 336 -18 -336
		mu 0 4 178 176 258 256
		f 4 -216 337 -24 -337
		mu 0 4 176 174 259 258
		f 4 -213 338 -47 -338
		mu 0 4 174 171 260 259
		f 4 -209 339 -146 -339
		mu 0 4 171 170 261 260
		f 4 639 -207 340 -628
		mu 0 4 262 169 167 263
		f 4 -204 341 -98 -341
		mu 0 4 167 165 264 263
		f 4 -201 342 -96 -342
		mu 0 4 165 163 265 264
		f 4 -197 343 -93 -343
		mu 0 4 163 162 266 265
		f 4 344 629 -67 -344
		mu 0 4 162 267 268 266
		f 4 -191 346 -150 -346
		mu 0 4 158 156 269 270
		f 4 -188 347 -42 -347
		mu 0 4 156 154 271 269
		f 4 -185 -335 -11 -348
		mu 0 4 154 151 255 271
		f 4 348 349 -4 350
		mu 0 4 272 273 0 3
		f 4 351 352 -9 -350
		mu 0 4 273 274 8 0
		f 4 353 354 -40 -353
		mu 0 4 274 275 34 8
		f 4 355 356 -151 -355
		mu 0 4 275 276 117 34
		f 4 631 620 358 -620
		mu 0 4 55 277 278 56
		f 4 359 360 -91 -359
		mu 0 4 278 279 77 56
		f 4 361 362 -94 -361
		mu 0 4 279 280 79 77
		f 4 363 364 -97 -363
		mu 0 4 280 281 65 79
		f 4 365 637 -78 -365
		mu 0 4 281 282 62 65
		f 4 367 368 -145 -367
		mu 0 4 283 284 39 113
		f 4 369 370 -49 -369
		mu 0 4 284 285 21 39
		f 4 371 372 -26 -371
		mu 0 4 285 286 17 21
		f 4 373 374 -20 -373
		mu 0 4 286 287 13 17
		f 4 375 -351 -14 -375
		mu 0 4 287 288 10 13
		f 4 -310 376 377 378
		mu 0 4 89 85 289 290
		f 4 -108 379 380 -377
		mu 0 4 85 88 291 289
		f 5 -295 381 382 383 -380
		mu 0 5 224 225 292 293 294
		f 4 -109 -379 384 -382
		mu 0 4 90 89 290 295
		f 4 -378 385 386 387
		mu 0 4 290 289 296 297
		f 4 -381 388 389 -386
		mu 0 4 289 291 298 296
		f 4 -384 390 391 -389
		mu 0 4 294 293 299 300
		f 4 -385 -388 392 393
		mu 0 4 295 290 297 301
		f 4 394 395 396 397
		mu 0 4 302 303 304 305
		f 4 -390 398 399 400
		mu 0 4 296 298 306 307
		f 4 -392 401 402 -399
		mu 0 4 300 299 308 309
		f 4 -393 403 404 405
		mu 0 4 301 297 310 311
		f 4 -319 406 407 408
		mu 0 4 233 232 312 313
		f 4 -322 409 410 -407
		mu 0 4 232 235 314 312
		f 4 -324 411 412 -410
		mu 0 4 239 238 315 316
		f 4 -325 -409 413 -412
		mu 0 4 241 233 313 317
		f 4 -408 414 415 416
		mu 0 4 313 312 318 319
		f 4 -411 417 418 -415
		mu 0 4 312 314 320 318
		f 4 -413 419 420 -418
		mu 0 4 316 315 321 322
		f 4 -414 -417 421 -420
		mu 0 4 317 313 319 323
		f 4 -416 422 423 424
		mu 0 4 319 318 324 325
		f 4 -419 425 426 -423
		mu 0 4 318 320 326 324
		f 4 -421 427 428 -426
		mu 0 4 322 321 327 328
		f 4 -422 -425 429 -428
		mu 0 4 323 319 325 329
		f 4 -424 430 431 432
		mu 0 4 325 324 330 331
		f 4 -427 433 434 -431
		mu 0 4 324 326 332 330
		f 4 -429 435 436 -434
		mu 0 4 328 327 333 334
		f 4 -430 -433 437 -436
		mu 0 4 329 325 331 335
		f 4 -432 438 439 440
		mu 0 4 331 330 336 337
		f 4 -435 441 442 -439
		mu 0 4 330 332 467 336
		f 4 -437 443 444 -442
		mu 0 4 334 333 339 338
		f 4 -438 -441 445 -444
		mu 0 4 335 331 337 340
		f 4 -440 446 -50 447
		mu 0 4 337 336 41 40
		f 4 -443 448 -51 -447
		mu 0 4 336 467 42 41
		f 4 -445 449 -52 -449
		mu 0 4 338 339 43 468
		f 4 -446 -448 -53 -450
		mu 0 4 340 337 40 466
		f 4 -327 450 451 452
		mu 0 4 245 244 341 342
		f 4 -330 453 454 -451
		mu 0 4 249 248 343 344
		f 4 -332 455 456 -454
		mu 0 4 248 251 345 343
		f 4 -333 -453 457 -456
		mu 0 4 253 245 342 346
		f 4 -452 458 459 460
		mu 0 4 347 344 348 349
		f 4 -455 461 462 -459
		mu 0 4 344 343 350 348
		f 4 -457 463 464 -462
		mu 0 4 343 345 351 350
		f 4 -458 -461 465 -464
		mu 0 4 346 342 352 353
		f 4 -460 466 467 468
		mu 0 4 349 348 354 355
		f 4 -463 469 470 -467
		mu 0 4 348 350 356 354
		f 4 -465 471 472 -470
		mu 0 4 350 351 357 356
		f 4 -466 -469 473 -472
		mu 0 4 353 352 358 359
		f 4 -468 474 475 476
		mu 0 4 355 354 360 361
		f 4 -471 477 478 -475
		mu 0 4 354 356 362 360
		f 4 -473 479 480 -478
		mu 0 4 356 357 363 362
		f 4 -474 -477 481 -480
		mu 0 4 359 358 364 365
		f 4 -476 482 483 484
		mu 0 4 361 360 366 367
		f 4 -479 485 486 -483
		mu 0 4 360 362 368 366
		f 4 -481 487 488 -486
		mu 0 4 362 363 369 368
		f 4 -482 -485 489 -488
		mu 0 4 365 364 370 371
		f 4 490 491 -135 492
		mu 0 4 372 373 107 106
		f 4 493 494 -136 -492
		mu 0 4 373 374 108 107
		f 4 495 496 -137 -495
		mu 0 4 374 375 109 108
		f 4 497 -493 -138 -497
		mu 0 4 376 377 378 379
		f 4 -496 498 -489 499
		mu 0 4 375 374 368 369
		f 4 -494 500 -487 -499
		mu 0 4 374 373 366 368
		f 4 -491 501 -484 -501
		mu 0 4 373 372 367 366
		f 4 -498 -500 -490 -502
		mu 0 4 377 376 371 370
		f 4 -200 -194 -618 -345
		mu 0 4 162 160 158 267
		f 4 -263 -195 -199 502
		mu 0 4 203 161 160 164
		f 4 -266 -503 -203 503
		mu 0 4 205 203 164 166
		f 4 -269 -504 -206 504
		mu 0 4 207 205 166 168
		f 4 -272 -505 -208 -212
		mu 0 4 173 207 168 170
		f 4 -387 505 506 507
		mu 0 4 297 296 380 381
		f 4 -401 508 509 -506
		mu 0 4 296 307 382 380
		f 4 643 641 512 513
		mu 0 4 469 470 384 382
		f 4 514 515 516 642
		mu 0 4 91 310 385 471
		f 4 -507 517 518 519
		mu 0 4 386 387 388 389
		f 4 -510 520 521 -518
		mu 0 4 390 391 392 393
		f 4 522 523 -395 524
		mu 0 4 394 395 303 302
		f 4 525 -520 526 527
		mu 0 4 396 397 398 399
		f 4 -519 528 529 530
		mu 0 4 389 388 400 401
		f 4 -522 531 532 -529
		mu 0 4 393 392 402 403
		f 4 533 534 535 536
		mu 0 4 404 405 406 407
		f 4 -527 -531 537 538
		mu 0 4 399 398 408 409
		f 4 539 540 541 542
		mu 0 4 410 411 412 413
		f 4 543 544 545 546
		mu 0 4 414 415 305 416
		f 4 547 548 549 550
		mu 0 4 405 417 418 419
		f 4 551 552 553 554
		mu 0 4 420 421 422 394
		f 4 555 556 -543 557
		mu 0 4 423 424 410 413
		f 4 558 559 560 -558
		mu 0 4 425 304 426 427
		f 4 -549 561 -524 562
		mu 0 4 418 417 303 395
		f 4 563 564 565 -563
		mu 0 4 395 428 429 418
		f 4 -536 566 -556 567
		mu 0 4 430 431 424 423
		f 4 -561 568 -537 -568
		mu 0 4 427 426 404 407
		f 4 -525 569 570 -555
		mu 0 4 394 302 432 420
		f 4 -566 571 572 -550
		mu 0 4 418 429 433 419
		f 4 -552 573 -538 574
		mu 0 4 421 420 409 408
		f 4 575 576 577 578
		mu 0 4 434 432 415 402
		f 4 -544 579 -533 -578
		mu 0 4 415 414 403 402
		f 5 580 581 -575 -530 -580
		mu 0 5 435 436 437 401 400
		f 4 582 583 584 -539
		mu 0 4 409 434 438 399
		f 4 585 586 -528 -585
		mu 0 4 438 439 396 399
		f 4 -571 -576 -583 -574
		mu 0 4 420 432 434 409
		f 4 -548 -534 -569 587
		mu 0 4 417 405 404 426
		f 4 -396 -562 -588 -560
		mu 0 4 304 303 417 426
		f 4 -577 -570 -398 -545
		mu 0 4 415 432 302 305
		f 4 -584 -579 -532 588
		mu 0 4 438 434 402 392
		f 4 -572 589 -567 590
		mu 0 4 440 441 424 431
		f 4 -557 -590 -565 591
		mu 0 4 410 424 441 442
		f 4 -540 -592 592 593
		mu 0 4 411 410 442 443
		f 4 -352 594 -8 595
		mu 0 4 444 445 4 7
		f 4 -554 -593 -564 -523
		mu 0 4 394 422 428 395
		f 4 -513 -586 -589 -521
		mu 0 4 391 439 438 392
		f 4 -535 -551 -573 -591
		mu 0 4 406 405 419 433
		f 4 -356 596 -152 597
		mu 0 4 446 447 33 119
		f 4 -368 598 -148 599
		mu 0 4 448 449 114 37
		f 4 -364 600 -74 601
		mu 0 4 450 451 59 61
		f 4 636 -366 -602 -625
		mu 0 4 60 452 450 61
		f 4 -362 602 -71 -601
		mu 0 4 451 453 52 59
		f 4 -621 632 -64 603
		mu 0 4 454 455 50 53
		f 4 -360 -604 -63 -603
		mu 0 4 453 454 53 52
		f 4 -370 -600 -45 604
		mu 0 4 456 448 37 19
		f 4 -354 -596 -39 -597
		mu 0 4 447 444 7 33
		f 4 -372 -605 -22 605
		mu 0 4 457 456 19 18
		f 4 -374 -606 -21 606
		mu 0 4 458 457 18 14
		f 4 -376 -607 -15 607
		mu 0 4 459 458 14 5
		f 4 -546 -397 -559 -542
		mu 0 4 416 305 304 425
		f 4 -349 -608 -5 -595
		mu 0 4 445 459 5 4
		f 4 608 -594 -553 -582
		mu 0 4 436 411 443 437
		f 4 -541 -609 -581 -547
		mu 0 4 412 411 436 435
		f 4 644 -517 -587 -642
		mu 0 4 470 471 385 384
		f 4 609 610 -113 -511
		mu 0 4 383 460 93 92
		f 4 -406 611 -402 612
		mu 0 4 461 462 308 299
		f 4 -394 -613 -391 -383
		mu 0 4 292 461 299 293
		f 4 -641 -514 -509 613
		mu 0 4 383 469 382 307
		f 4 -610 -614 -400 614
		mu 0 4 460 383 307 306
		f 4 -611 -615 -403 615
		mu 0 4 463 464 309 308
		f 4 -114 -616 -612 616
		mu 0 4 465 463 308 462
		f 4 -115 -617 -405 -515
		mu 0 4 91 94 311 310
		f 4 -508 -526 -516 -404
		mu 0 4 297 381 385 310
		f 4 -630 617 345 -619
		mu 0 4 268 267 158 270
		f 4 64 -631 618 67
		mu 0 4 117 55 54 118
		f 4 357 -632 -65 -357
		mu 0 4 276 277 55 117
		f 4 -633 -358 -598 -622
		mu 0 4 50 455 446 119
		f 4 60 61 -634 621
		mu 0 4 119 116 51 50
		f 4 68 69 -635 -62
		mu 0 4 116 115 58 51
		f 4 71 72 -636 -70
		mu 0 4 115 114 60 58
		f 4 -626 -637 -73 -599
		mu 0 4 449 452 60 114
		f 4 -638 625 366 -627
		mu 0 4 62 282 283 113
		f 4 74 75 -639 626
		mu 0 4 113 112 63 62
		f 4 -629 -640 -76 -340
		mu 0 4 170 169 262 261
		f 4 510 511 -644 640
		mu 0 4 383 92 470 469
		f 4 -643 -645 -512 -112
		mu 0 4 91 471 470 92;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 2 
		338 0 
		339 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "locator1";
	rename -uid "B79FFD70-47F9-AACF-4A07-FBB7FF28D167";
	setAttr ".t" -type "double3" 0 1 5.041928216891737 ;
	setAttr ".s" -type "double3" 0.10807512869966407 0.10807512869966407 0.10807512869966407 ;
createNode locator -n "locatorShape1" -p "locator1";
	rename -uid "6CC16F2A-42F9-B8A9-8A81-5BB8A39FB9A5";
	setAttr -k off ".v";
createNode transform -n "loftedSurface1";
	rename -uid "1F21347D-4572-4612-3D57-29ABC3AA47B9";
	setAttr ".v" no;
createNode nurbsSurface -n "loftedSurfaceShape1" -p "loftedSurface1";
	rename -uid "83E1C40B-4AD8-36A8-9E15-D8B814DFD393";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 2;
	setAttr ".cps" 3;
createNode transform -n "nurbsToPoly1";
	rename -uid "9BF998E8-4A58-67CC-8D32-87B256429D87";
	setAttr ".tmp" yes;
createNode mesh -n "nurbsToPolyShape1" -p "nurbsToPoly1";
	rename -uid "FBD2D91D-4D69-DF8A-EFDB-61B73C0A8B3D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "bottom";
	rename -uid "5D7F2A99-402A-397D-2630-11901BDBF719";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -1000.1 0 ;
	setAttr ".r" -type "double3" 90 0 0 ;
createNode camera -n "bottomShape" -p "bottom";
	rename -uid "F1A70CB8-4846-B2B2-3BED-DE967C9FC780";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "bottom1";
	setAttr ".den" -type "string" "bottom1_depth";
	setAttr ".man" -type "string" "bottom1_mask";
	setAttr ".hc" -type "string" "viewSet -bo %camera";
	setAttr ".o" yes;
createNode transform -n "curve4";
	rename -uid "F9965EF0-436B-5404-DFA0-2EA5F701B511";
	setAttr ".t" -type "double3" -1.3573400552852754e-15 3.3056774664297013 1.7695617758532605 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999978 ;
createNode nurbsCurve -n "curveShape4" -p "curve4";
	rename -uid "35375E8E-4AFA-9557-49A1-ED90C18C39D3";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		2 1 0 no 3
		4 0 0 1 1
		3
		0 0 0
		9.8464914915285301e-16 -0.034903709739553257 1.1550357151599755
		1.9692982983057064e-15 0.71294685628106169 2.025922550316384
		;
createNode transform -n "locator2" -p "curve4";
	rename -uid "A0C8CA75-447C-4150-2D5A-D1B716F23202";
createNode locator -n "locatorShape2" -p "locator2";
	rename -uid "B0743045-4FFE-9801-D12D-A1B85ABEBCB2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "locator2_aimConstraint1" -p "locator2";
	rename -uid "ED6B7BD3-4C03-7244-764F-03847F129F7B";
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
	setAttr ".a" -type "double3" 0 0 1 ;
	setAttr ".rsrr" -type "double3" -19.387592273171858 5.2536197104638542e-14 -8.9743220223080617e-15 ;
	setAttr -k on ".w0";
createNode transform -n "locator3" -p "curve4";
	rename -uid "8D3C7C00-48C7-8825-2D45-E4A83EE3F268";
	setAttr ".t" -type "double3" 1.9692982983057064e-15 0.71294685628106169 2.025922550316384 ;
createNode locator -n "locatorShape3" -p "locator3";
	rename -uid "6FEF2EFC-4BA4-F95D-6C93-89B845D488C4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "locator4" -p "curve4";
	rename -uid "B5061F1A-4D57-DB39-BD8D-E6BFA1AF9885";
createNode locator -n "locatorShape4" -p "locator4";
	rename -uid "3725144F-4756-00F2-53A2-E69E5FD92BE4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "locator4_pointConstraint1" -p "locator4";
	rename -uid "1FDD3457-4F5C-2E82-30FC-87ADFBE5CEB9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "locator2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "locator3W1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 9.8464914915285301e-16 0.35647342814053129 1.012961275158192 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode aimConstraint -n "locator4_aimConstraint1" -p "locator4";
	rename -uid "5A145EA2-433E-DD2B-F6B0-C7BB0EA489A9";
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
	setAttr ".a" -type "double3" 0 0 1 ;
	setAttr ".rsrr" -type "double3" -19.387592273171837 5.2536197104638492e-14 -8.9743220223080444e-15 ;
	setAttr -k on ".w0";
createNode transform -n "locator5" -p "locator4";
	rename -uid "03BBF52B-445D-3A26-06BC-8EA117D5CC5B";
	setAttr ".t" -type "double3" 4.9303806576313238e-32 -0.41634651343190043 0.0040977201133883707 ;
createNode locator -n "locatorShape5" -p "locator5";
	rename -uid "FF7CDAE5-4975-79AB-5585-DDB909EEB548";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "locator6" -p "curve4";
	rename -uid "53616FC5-450F-8029-D4F8-19A85C86EA5B";
	setAttr ".v" no;
	setAttr ".r" -type "double3" -19.387592273171837 0 0 ;
createNode locator -n "locatorShape6" -p "|curve4|locator6";
	rename -uid "F151CC43-4831-3713-BF33-49801F9A5FB5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "locator6_pointConstraint1" -p "|curve4|locator6";
	rename -uid "34C4057D-4C03-27E6-DE50-C6A1F1F3ADC5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "locator5W0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 9.8464914915285301e-16 -0.17115063957588728 1.198638620186955 ;
	setAttr -k on ".w0";
createNode transform -n "locator8";
	rename -uid "EFB2CE4A-4D77-7D97-79D0-3282C504FF34";
	setAttr ".r" -type "double3" -19.387592273171837 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999967 ;
createNode locator -n "locatorShape8" -p "locator8";
	rename -uid "A65E5F8D-4F8B-F840-BE7C-968FCD21C795";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "locator9";
	rename -uid "86D6B204-4CC1-E037-4800-BB8340D9E846";
	setAttr ".r" -type "double3" -19.387592273171837 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999967 ;
createNode locator -n "locatorShape9" -p "locator9";
	rename -uid "9F425FA3-4EB5-14D7-B814-EF8B6FCE105A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "locator10";
	rename -uid "BF27A1E0-430A-7093-7ACD-CB8926A7F32B";
	setAttr ".r" -type "double3" -18.316663742065447 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999967 0.99999999999999978 ;
createNode locator -n "locatorShape10" -p "locator10";
	rename -uid "31BE1639-4142-B7AF-2427-09B2DCDF0E26";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "curve5";
	rename -uid "4606C3C2-4FD2-E713-8999-A19E640E0DB7";
	setAttr ".t" -type "double3" -1.3573400552852754e-15 5.2609719942177131 1.5568095215343583 ;
	setAttr ".r" -type "double3" 38.775333404541016 5.253619710463846e-14 -8.9743220223080397e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999978 ;
createNode nurbsCurve -n "curveShape5" -p "curve5";
	rename -uid "F0D01917-4882-4810-8D11-6693BCD4C16C";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "locator6" -p "curve5";
	rename -uid "68D8DA01-43DC-6BD1-EDA4-DD99409D20F6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 9.8464914915285301e-16 -0.18024586839037005 1.2061833935739505 ;
	setAttr ".r" -type "double3" -19.387592273171837 0 0 ;
createNode locator -n "locatorShape6" -p "|curve5|locator6";
	rename -uid "CAC749B9-40B1-9EE1-9380-07A62DDEFC24";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "locator6_pointConstraint1" -p "|curve5|locator6";
	rename -uid "3A37B214-41A0-15BE-34BD-C98CAE3CC4B4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "locator5W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" 4.9303806576313238e-32 -0.57042580499445461 
		0.0040977201133881626 ;
	setAttr ".tg[0].tpm" -type "matrix" 0.99999999999999978 0 0 0 0 0.94329456721190563 -0.33195686386713374 0
		 0 0.33195686386713363 0.94329456721190585 0 -3.7269090613242263e-16 3.6621508945702326 2.7825230510114523 1;
	setAttr ".cpim" -type "matrix" 1.0000000000000002 -0 0 -0 -0 1.0000000000000004 -0 0
		 0 -0 1.0000000000000002 -0 1.3573400552852756e-15 -3.3056774664297026 -1.7695617758532607 1;
	setAttr ".rst" -type "double3" 9.8464914915285301e-16 -0.17115063957588728 1.198638620186955 ;
	setAttr -k on ".w0";
createNode unitConversion -n "unitConversion1933";
	rename -uid "2897AB0B-4377-7608-F6B5-3582F35B054E";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1931";
	rename -uid "B9E0D179-4136-FA51-ACA8-948B3DC56D5F";
	setAttr ".cf" 57.295779513082323;
createNode decomposeMatrix -n "decomposeMatrix184";
	rename -uid "56E0F11D-481E-3B9E-31AA-29B84A1A50BC";
createNode multMatrix -n "multMatrix156";
	rename -uid "CFE135DC-44DD-EC56-BE2B-C98FFEBE25A1";
	setAttr -s 2 ".i";
createNode distanceBetween -n "root_toeBall_distance";
	rename -uid "901BBE81-463D-FF26-D5BE-8E9666377F1A";
createNode distanceBetween -n "toeBall_toeTip_distance";
	rename -uid "FCD27CF1-46A6-74EC-CDA0-B7A029D1DF47";
createNode decomposeMatrix -n "decomposeMatrix232";
	rename -uid "AC7E7CE5-481E-FD74-7A85-6F97A9F796A2";
createNode multMatrix -n "multMatrix191";
	rename -uid "34FD34E6-48CA-D2EF-081D-22B505686E8B";
createNode ikRPsolver -n "ikRPsolver20";
	rename -uid "131C44B7-4221-CFFF-AB23-EBA3E410C988";
createNode decomposeMatrix -n "decomposeMatrix187";
	rename -uid "339D2357-4B8C-6780-4DF8-9D8AA1AF2471";
createNode multMatrix -n "multMatrix159";
	rename -uid "22734E1E-4D64-2D4B-668C-E88F7282705E";
	setAttr -s 2 ".i";
createNode reverse -n "reverse174";
	rename -uid "BA669BC0-4A47-00D4-472E-948996D60BBF";
createNode decomposeMatrix -n "decomposeMatrix191";
	rename -uid "64800899-479A-56C1-E7D8-659CFF4F658D";
createNode multMatrix -n "multMatrix161";
	rename -uid "D7FC7943-4C70-84E5-1639-D2B4F135D926";
	setAttr -s 2 ".i";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "4E969006-472D-E65B-DECE-1497B6436A54";
	setAttr -s 23 ".lnk";
	setAttr -s 23 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "29F8235B-4FD7-0145-13D6-76B1A8AF898D";
createNode displayLayer -n "defaultLayer";
	rename -uid "19CE01F8-4DF6-369B-03C9-E4ACC39F3E53";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "43D6B5CA-4096-04D0-EDB9-2E82BA0B17C7";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "281C2244-47AF-B8DB-A19E-3DB775F64F4B";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "D5CCF0FB-40BC-E332-A00F-168691F83CE9";
	setAttr ".b" -type "string" "playbackOptions -min -10 -max 39 -ast -10 -aet 140 ";
	setAttr ".st" 6;
createNode multMatrix -n "multMatrix192";
	rename -uid "6C3B0E88-4B7B-6148-33B8-F89B40F671AD";
	setAttr -s 3 ".i";
createNode decomposeMatrix -n "decomposeMatrix237";
	rename -uid "E787604F-469B-6C1F-2A83-76916D5A2121";
createNode decomposeMatrix -n "decomposeMatrix238";
	rename -uid "3E6DA095-458D-2455-AE4F-18A4A56C77FF";
createNode multMatrix -n "multMatrix193";
	rename -uid "9173D8B5-40A1-6375-3CF8-EABE90F28B81";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix239";
	rename -uid "1A92A101-4740-D468-E474-A0BE201CAE70";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "214C0FA4-4D90-23D3-106A-D9BF186799FD";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "3A35960E-473D-142C-CB69-DD923C748849";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "moduleControlSet";
	rename -uid "FBA53D8F-412A-D5EC-8DD5-E0ADED0ACFAC";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode multMatrix -n "multMatrix195";
	rename -uid "BA05B341-4AFA-4A2B-76E3-44A1FAD9671E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix240";
	rename -uid "F452F7A6-407D-4A56-0A3B-96A857CEE2B1";
createNode multMatrix -n "multMatrix197";
	rename -uid "2952362C-4724-F61F-AA23-A4BD01DBA761";
createNode decomposeMatrix -n "decomposeMatrix243";
	rename -uid "1E1D4113-4047-0BFB-907F-619385656C17";
createNode multMatrix -n "multMatrix198";
	rename -uid "30566739-471D-72B8-B008-77ADFE0D9F72";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix244";
	rename -uid "F6541BA4-4EFC-CF00-6A7A-E9AD4752A5E0";
createNode multMatrix -n "multMatrix200";
	rename -uid "CCEEA500-4174-A382-CDBE-79AE3F1DBB7C";
	setAttr -s 2 ".i";
createNode condition -n "mirror_condition";
	rename -uid "A507E24C-4C69-0A52-56D9-FAA423D4746D";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 180 ;
	setAttr ".cf" -type "float3" 1 180 0 ;
createNode objectSet -n "sets";
	rename -uid "09CB26A3-46F7-1FCD-6FC0-DC895903664C";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
createNode composeMatrix -n "composeMatrix2";
	rename -uid "1C8BFA6E-4FAA-1282-ED08-CCB0233CFE5E";
createNode objectSet -n "poserShapesForConnectSet";
	rename -uid "206365E6-4B51-CA22-84E8-409B31AD8061";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
createNode objectSet -n "ikFkSwitchSet";
	rename -uid "11BC887D-47B9-BB3D-F153-7B86CBF5C9A2";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode partition -n "mtorPartition";
	rename -uid "AFF5081B-4413-456C-F871-0D898C34220B";
	addAttr -s false -ci true -sn "inmsg" -ln "inmessage" -at "message";
createNode multMatrix -n "middleByRoot_multMatrix";
	rename -uid "9FDFCD43-4C17-FD94-A3FB-828699626E84";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleByRoot_decomposeMatrix";
	rename -uid "2C6B65CB-433E-832A-6D80-279CC79B6934";
createNode hyperView -n "hyperView4";
	rename -uid "6C775ED0-46D5-DE6B-1D30-23AE14230745";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout4";
	rename -uid "39140A44-469F-08B8-56D8-D394B0521D9F";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView5";
	rename -uid "498C6A91-4811-17FC-2C0E-23A0152E199B";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout5";
	rename -uid "BC0AC482-4D81-357E-459F-FE82EC8E5162";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView6";
	rename -uid "15A971A1-4980-67E7-FB8F-CBBC15691492";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout6";
	rename -uid "145FF295-4D7B-5ADD-273B-7E9C9D2FB73A";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView7";
	rename -uid "9211DC85-4CAA-2CC5-DBD8-748ADD7EA61D";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout7";
	rename -uid "CBACAD81-48DA-A4F2-6F5E-9FA7CC82A11A";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode multDoubleLinear -n "multDoubleLinear1";
	rename -uid "D2BB9042-4EDE-90A3-E925-6D9FEB2E92A5";
	setAttr ".i2" 1;
createNode multDoubleLinear -n "multDoubleLinear2";
	rename -uid "64D3EE54-4B3C-4DF1-26AE-2783C52215E4";
	setAttr ".i2" 1;
createNode multDoubleLinear -n "multDoubleLinear436";
	rename -uid "18B2BFF2-4152-AF67-F489-98BA8DC8BEBC";
	setAttr ".i2" 1;
createNode decomposeMatrix -n "decomposeMatrix247";
	rename -uid "C95383D4-4ECD-C0DF-728C-9A8D4E9D0054";
createNode multMatrix -n "ik_connector_multMatrix";
	rename -uid "390C3D70-4102-5DF7-BE03-F1922844FF5E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ik_connector_decMat";
	rename -uid "CD21675D-4BEF-94FC-85DE-8D822F63A43B";
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "57BFCAC3-4255-FF2A-942E-F3911A3086F5";
createNode multiplyDivide -n "root_toeBall_distance_scaled";
	rename -uid "D3643202-4DAA-7A2E-80F2-B8B3EC40FD3C";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "D7F67215-4B2E-9E46-9607-958101E52A4D";
	setAttr ".op" 2;
createNode multDoubleLinear -n "multDoubleLinear1622";
	rename -uid "C8F16D32-44B3-D9D5-C9A7-9FB69FA58597";
createNode surfaceShader -n "blue_rsMat";
	rename -uid "4801F9B6-4975-3DFA-9B9C-1889CB33B9A1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr ".oc" -type "float3" 0.24190001 0.24190001 0.58999997 ;
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".moduleType" -type "string" "spine";
createNode surfaceShader -n "green_rsMat";
	rename -uid "AC6DF941-4BB5-E063-71CC-B3B99F3648DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr ".oc" -type "float3" 0.230864 0.61400002 0.230864 ;
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".moduleType" -type "string" "spine";
createNode shadingEngine -n "black_rsSG";
	rename -uid "117F2F8D-457E-B428-976C-C991ED7AB12F";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "13773D83-48F6-B601-6475-5787A2360178";
createNode shadingEngine -n "green_rsSG";
	rename -uid "DA95FA92-404E-297E-9B55-69A4E78B19A0";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "37737533-4504-3261-AF5D-5CA67A8870C5";
createNode shadingEngine -n "blue_rsSG";
	rename -uid "029CA825-4F97-02EA-4945-A4AACE713662";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "D75A566A-4483-087F-7C8E-81A472217C50";
createNode surfaceShader -n "red_rsMat";
	rename -uid "74CDF6BE-4971-1571-01FF-5FA4A4E61E3E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr ".oc" -type "float3" 0.63 0.22995001 0.22995001 ;
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".moduleType" -type "string" "spine";
createNode shadingEngine -n "red_rsSG";
	rename -uid "C6D0C12E-44F1-F681-A765-4C905A7B0F18";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "0A57FEE7-4592-0EFA-82C6-399E2CFA2796";
createNode groupId -n "cluster4GroupId";
	rename -uid "DFBCE029-4F3B-510E-493E-95AE4E1009BC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "cluster4Set";
	rename -uid "7FC75EEC-4DC2-BA39-6EBC-A5B315847B2C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode cluster -n "mainPoser_clusterHandleCluster1";
	rename -uid "C99978B5-4CF8-FA62-3258-3FBA0A1F8ECC";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "1A8D5994-42EE-0797-3F6F-BFB7071A4851";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "";
createNode tweak -n "tweak24";
	rename -uid "14D0E033-412D-50DB-1039-4F91377848D4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "tweakSet24";
	rename -uid "5AF4C756-4AD8-C1F4-9AFF-7A9F1292EE8B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "groupId42";
	rename -uid "94706812-4ABD-A631-0551-439183FF8F6D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupParts -n "groupParts42";
	rename -uid "B235D226-4BFA-C1CF-CCC9-71A3EFFBBE1C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "";
createNode shadingEngine -n "root_red_rsSG";
	rename -uid "979DB91F-484D-CA68-4548-21A38204D7FE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo1";
	rename -uid "77E7F549-46D1-572E-52F7-FBB67AD1B429";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "root_green_rsSG";
	rename -uid "94F3DD05-42DE-8354-C5A6-438A9D9B0B1D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo2";
	rename -uid "2A557A0F-43F7-1F1F-5525-BFA9F493F694";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "root_blue_rsSG";
	rename -uid "F18F86B4-480C-3032-04D8-D0BF2B5D898A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo3";
	rename -uid "2E2B9BD5-490A-E4AF-B709-DEB32A8DE37D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "root_red_rsSG1";
	rename -uid "911A7C87-4F59-F672-FDE4-029D665A35B9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo4";
	rename -uid "E27CF45F-4407-207D-562F-B8AAB79880B9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "root_green_rsSG1";
	rename -uid "9174D45C-49CF-97AB-C3BC-0A8E633B9905";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo5";
	rename -uid "1CF07B02-4ED5-941B-316B-EBA4A765141A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "root_blue_rsSG1";
	rename -uid "F1A9CCD6-4384-1CFF-E966-BBA06ACD1D90";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "root";
createNode materialInfo -n "root_materialInfo6";
	rename -uid "481EA489-40AB-9248-1B77-AE9C821C0C7F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode shadingEngine -n "toe_red_rsSG";
	rename -uid "0AB4D865-43A5-1191-ECFF-CEB0E99CE830";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toe";
createNode materialInfo -n "toe_materialInfo1";
	rename -uid "6578FC2B-4DAF-BDDC-96BB-15AA93C4D8C4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toe";
createNode shadingEngine -n "toe_green_rsSG";
	rename -uid "E914C00D-4096-16CF-415E-319336A53040";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toe";
createNode materialInfo -n "toe_materialInfo2";
	rename -uid "A43EF139-4DA8-5DF9-50B3-9CA6FE031B48";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toe";
createNode shadingEngine -n "toe_blue_rsSG";
	rename -uid "38D26142-4FE3-95C7-7D40-98AF5718D580";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toe";
createNode materialInfo -n "toe_materialInfo3";
	rename -uid "782820CD-4ABA-C25E-6ABA-319675DD635C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toe";
createNode shadingEngine -n "toe_surfaceShader1SG";
	rename -uid "1CBCC093-413A-7726-180A-F2B2118F853C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toe";
createNode materialInfo -n "toe_materialInfo4";
	rename -uid "8E3E027C-43BA-F1F8-7BE6-44A40DA4D3C1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toe";
createNode unitConversion -n "unitConversion1942";
	rename -uid "5CC8E043-4130-B528-2B29-5994331550BE";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode shadingEngine -n "toeTip_red_rsSG";
	rename -uid "4982F6FA-4108-E33B-0553-2AB6D532D8C9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode materialInfo -n "toeTip_materialInfo1";
	rename -uid "2BC3F836-47D0-D0F2-77B3-64AF070AFDAF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode shadingEngine -n "toeTip_green_rsSG";
	rename -uid "728EC7B5-4F59-C865-1D9B-B4BE8806AAF2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode materialInfo -n "toeTip_materialInfo2";
	rename -uid "6DB4F252-4609-A1AF-161B-83A9649CDDA4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode shadingEngine -n "toeTip_blue_rsSG";
	rename -uid "A9CE6F7E-4F0C-CB8B-EFD4-41A0E2E26369";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode materialInfo -n "toeTip_materialInfo3";
	rename -uid "A4D2511E-474B-2C2F-E356-DC8C105B6EC0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode shadingEngine -n "toeTip_surfaceShader1SG";
	rename -uid "891A4C79-44C5-8F8A-7A0C-90899CBD8551";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode materialInfo -n "toeTip_materialInfo4";
	rename -uid "9FC22748-45FC-C01E-F80F-6DA78885B20C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "toeTip";
createNode unitConversion -n "unitConversion1943";
	rename -uid "CDAF86A9-441B-8473-6F47-9D8468BEA603";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1944";
	rename -uid "6E389AE1-4C35-3149-7F2F-3EBFF43056DB";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear1623";
	rename -uid "FBC6CD01-474B-51B1-3D28-DBA593131AA1";
createNode multDoubleLinear -n "multDoubleLinear1624";
	rename -uid "6381A272-4AE2-CA4E-6A21-CEB0350334F5";
createNode unitConversion -n "unitConversion1952";
	rename -uid "78408946-40D6-57E3-457B-3686E9A60ED6";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1953";
	rename -uid "23FB9000-4C2B-5A01-35F5-2BB481C4CF99";
	setAttr ".cf" 0.017453292519943295;
createNode shadingEngine -n "qqq_red_rsSG";
	rename -uid "CCCC34C7-45AD-C92D-5B09-C59F176547D9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "qqq";
createNode materialInfo -n "qqq_materialInfo1";
	rename -uid "C9C46628-4E06-414C-6B6D-95B7345AFD21";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "qqq";
createNode shadingEngine -n "qqq_green_rsSG";
	rename -uid "83DBAFEE-4522-1280-8A94-99906DC4D640";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "qqq";
createNode materialInfo -n "qqq_materialInfo2";
	rename -uid "F1CA31B4-469C-44C8-D585-B59667AB2C81";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "qqq";
createNode shadingEngine -n "qqq_blue_rsSG";
	rename -uid "DDFCEC6B-46B3-BEEC-5AB1-FD94C20C4A80";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "qqq";
createNode materialInfo -n "qqq_materialInfo3";
	rename -uid "D0163C92-4BBD-92FB-A69A-8099DD72EF62";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "qqq";
createNode unitConversion -n "unitConversion1954";
	rename -uid "DADDA9A1-4F42-D9BB-BBEF-29AAB475BC89";
	setAttr ".cf" 0.017453292519943295;
createNode nearestPointOnCurve -n "nearestPointOnCurve1";
	rename -uid "097774EF-4A95-2581-67F5-07BB7F06072D";
	setAttr ".ip" -type "double3" -1.6511975207089764e-13 950.5148815332883 -316.09489230288875 ;
createNode multDoubleLinear -n "multDoubleLinear1625";
	rename -uid "E340D561-4729-D2C5-2660-E59DE313DA43";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion1956";
	rename -uid "594E7238-45E9-D505-5106-4CA9E62EDE24";
	setAttr ".cf" 57.295779513082323;
createNode addDoubleLinear -n "addDoubleLinear2";
	rename -uid "1675B7FD-4393-7AE4-8F96-AB9CE8894921";
	setAttr ".ihi" 2;
	setAttr ".i2" -90;
createNode unitConversion -n "unitConversion1957";
	rename -uid "FDD2F056-4834-2CA1-45E9-2EA9976732D5";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear1626";
	rename -uid "E7EA1311-4C3F-B91D-5227-818D38B47FF2";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion1958";
	rename -uid "AAE42689-40F5-998E-1D32-DA8AB7C039DF";
	setAttr ".cf" 0.017453292519943295;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "BF7F4EF7-464C-7D96-C0C2-59B64569EA99";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "189426DB-4F86-A746-7691-1CAC8E6F9416";
createNode floatConstant -n "floatConstant1";
	rename -uid "8427F90B-4326-33CB-3E71-4684E1E74A14";
	setAttr "._f" -90;
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "74DF937A-4399-BA22-EF3A-269F468F0BAC";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode unitConversion -n "unitConversion1959";
	rename -uid "165B2A4D-4E2F-E437-1828-ABB8B667D696";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion1960";
	rename -uid "56E20EBD-4262-21F8-3303-35937F61F63A";
	setAttr ".cf" 0.017453292519943295;
createNode condition -n "switchHelper_condition";
	rename -uid "BDAC2613-4FA8-42A3-4014-76875B48C80B";
	setAttr ".st" 1;
createNode addDoubleLinear -n "addDoubleLinear3";
	rename -uid "D5E79193-4A8C-34B1-D002-AD985011244A";
	setAttr ".ihi" 2;
	setAttr ".i1" 270;
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "3F68B20B-4CA6-421F-7089-198D6368B3AD";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "BDB74633-4578-689D-778D-CB8B3805CA09";
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "3F61011D-4692-D8EA-25B2-EA9A1B60EFCD";
createNode multiplyDivide -n "multiplyDivide5";
	rename -uid "6E6A93EE-474A-9868-D165-368F3BACF04C";
createNode multDoubleLinear -n "multDoubleLinear1627";
	rename -uid "491B23A0-40A4-1229-BCFA-7EBBC5307549";
createNode multDoubleLinear -n "multDoubleLinear1628";
	rename -uid "A363DAE5-4C93-ADA8-4C95-25B73FAF5EEB";
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "591A9FC3-46A1-DBD7-0394-E1BE277542F4";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode multiplyDivide -n "multiplyDivide6";
	rename -uid "FBEAA6E7-4BF3-537D-4DAD-88A651F3E4A2";
createNode objectSet -n "skinJointsSet";
	rename -uid "F966D683-41B3-21F5-FD24-F29D52A652FF";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
createNode animCurveTA -n "ik_heel_rotateX";
	rename -uid "63FE328E-463B-6373-0957-BE8E1F55D18B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  -10 -18.316663262767548 1 0 26 45 50 90;
createNode animCurveTA -n "ik_heel_rotateY";
	rename -uid "3560DC16-40A4-98A4-1F37-0FB904098B1E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "ik_heel_rotateZ";
	rename -uid "991C0160-4593-C939-37E3-17A6B9A7274A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode skinCluster -n "skinCluster1";
	rename -uid "02E2BA86-470C-0A6F-1842-B78A354D1CAA";
	setAttr -s 325 ".wl";
	setAttr ".wl[0:324].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.23008662799999999 1 0.76991337199999998
		2 0 0.75487751800000003 1 0.245122482
		2 0 0.76092303500000003 1 0.239076965
		2 0 0.21267845599999999 1 0.78732154399999998
		2 0 0.72336400099999998 1 0.27663599900000002
		2 0 0.72103817100000001 1 0.27896182899999999
		2 0 0.73785039400000008 1 0.26214960599999998
		2 0 0.773851124 1 0.226148876
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.80413427100000001 1 0.19586572899999999
		2 0 0.73369501000000004 1 0.26630499000000002
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
		2 0 0.72125532700000006 1 0.278744673
		2 0 0.71942004000000004 1 0.28057996000000002
		2 0 0.74696577600000003 1 0.25303422399999997
		2 0 0.80119052499999999 1 0.19880947500000001
		1 0 1
		2 0 0.89845836199999995 1 0.101541638
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.84518837599999996 1 0.15481162400000001
		2 0 0.73814843699999999 1 0.26185156300000001
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.27475003799999997 1 0.72524996200000003
		2 0 0.059617616999999998 1 0.94038238299999999
		2 0 0.256962629 1 0.743037371
		2 0 0.34881729700000003 1 0.65118270300000003
		1 0 1
		1 0 1
		2 0 0.49642246299999998 1 0.50357753700000008
		2 0 0.51638473699999998 1 0.48361526300000002
		1 0 1
		1 0 1
		2 0 0.89872490400000005 1 0.101275096
		2 0 0.727678406 1 0.272321594
		2 0 0.727057807 1 0.272942193
		2 0 0.78865664000000002 1 0.21134336000000001
		2 0 0.83565760700000002 1 0.164342393
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.93477570099999996 1 0.065224298999999999
		2 0 0.790098207 1 0.209901793
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.53095228400000005 1 0.469047716
		2 0 0.47877078299999998 1 0.52122921700000002
		2 0 0.60445583700000005 1 0.395544163
		2 0 0.64814703600000001 1 0.35185296399999999
		1 0 1
		1 0 1
		2 0 0.72631052699999998 1 0.27368947300000002
		2 0 0.72368560400000004 1 0.27631439600000002
		1 0 1
		1 0 1
		1 0 1
		2 0 0.86578950600000004 1 0.13421049400000001
		2 0 0.78525919700000002 1 0.21474080300000001
		2 0 0.80398000199999997 1 0.196019998
		2 0 0.924588776 1 0.075411223999999999
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.972590858 1 0.027409142000000001
		2 0 0.87490011000000001 1 0.12509988999999999
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.75837312200000007 1 0.24162687799999999
		1 0 1
		2 0 0.81045770699999997 1 0.189542293
		2 0 0.81098086000000003 1 0.18901914
		2 0 0.99616449799999995 1 0.0038355020000000002
		1 0 1
		2 0 0.89869360300000001 1 0.10130639700000001
		2 0 0.89862708899999999 1 0.101372911
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
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 0 1
		1 0 1
		2 0 0.17969309999999999 1 0.82030690000000006
		2 0 0.15217435600000001 1 0.84782564400000004
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 0 1
		1 0 1
		2 0 0.0011953700000000001 1 0.99880462999999997
		2 0 0.020063979999999999 1 0.97993602000000002
		1 0 1
		1 0 1
		2 0 0.98137633400000002 1 0.018623666000000001
		2 0 0.90753679499999995 1 0.092463205000000007
		2 0 0.72792557000000002 1 0.27207442999999998
		2 0 0.95846566799999999 1 0.041534332
		2 0 0.89466917400000001 1 0.105330826
		1 0 1
		1 0 1
		1 0 1
		2 0 0.998985228 1 0.0010147719999999999
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.983526228 1 0.016473772000000001
		2 0 0.98217737699999996 1 0.017822622999999999
		2 0 0.98211673700000002 1 0.017883263
		2 0 0.983460899 1 0.016539101
		2 0 0.98830446400000005 1 0.011695535999999999
		2 0 0.98748362999999995 1 0.012516370000000001
		2 0 0.98697163700000001 1 0.013028362999999999
		2 0 0.98784328700000001 1 0.012156713
		2 0 0.99320947100000001 1 0.006790529
		2 0 0.99284274500000003 1 0.0071572550000000004
		2 0 0.99248241299999995 1 0.0075175870000000001
		2 0 0.99286155700000001 1 0.0071384430000000004
		2 0 0.99457570799999995 1 0.0054242919999999998
		2 0 0.99433799499999997 1 0.0056620050000000003
		2 0 0.99472358900000002 1 0.0052764109999999999
		2 0 0.99492044899999998 1 0.0050795509999999999
		2 0 0.996100714 1 0.0038992860000000001
		2 0 0.99600798300000004 1 0.0039920169999999996
		2 0 0.99607620200000002 1 0.003923798
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.97475345700000005 1 0.025246543
		1 0 1
		1 0 1
		1 0 1
		2 0 0.98118855500000002 1 0.018811445
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
		2 0 0.095356514000000003 1 0.904643486
		1 1 1
		2 0 0.00039551499999999998 1 0.99960448499999999
		2 0 0.003290332 1 0.99670966800000005
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
		2 0 0.99746071800000002 1 0.0025392819999999999
		2 0 0.999999427 1 5.7299999999999996e-07
		2 0 0.99983325000000001 1 0.00016674999999999999
		2 0 0.99999955799999996 1 4.4200000000000001e-07
		2 0 0.99886556800000004 1 0.0011344320000000001
		2 0 0.99899618599999995 1 0.001003814
		2 0 0.99989422900000002 1 0.000105771
		2 0 0.99878631200000001 1 0.0012136880000000001
		2 0 0.99899172300000005 1 0.0010082769999999999
		2 0 0.99922639199999996 1 0.00077360799999999996
		2 0 0.99933628200000002 1 0.00066371799999999999
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.99997634400000002 1 2.3655999999999998e-05
		1 0 1
		1 0 1
		1 0 1
		2 0 0.99838371999999997 1 0.0016162800000000001
		2 0 0.99875396299999997 1 0.001246037
		2 0 0.99905005300000005 1 0.00094994700000000003
		2 0 0.99903058 1 0.00096942000000000003
		2 0 0.99861461600000001 1 0.0013853839999999999
		2 0 0.99833166399999995 1 0.0016683360000000001
		1 0 1
		1 0 1
		2 0 0.99995524400000002 1 4.4756000000000003e-05
		1 1 1
		2 0 0.0037003969999999998 1 0.99629960299999998
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.99998491300000003 1 1.5087e-05
		2 0 0.99995405199999998 1 4.5948000000000001e-05
		1 0 1
		2 0 0.99864973099999998 1 0.0013502690000000001
		2 0 0.99968641400000002 1 0.00031358599999999998
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		2 0 0.99552211599999996 1 0.0044778839999999997
		1 0 1
		2 0 0.93811974900000006 1 0.061880250999999997
		1 0 1
		1 0 1
		1 0 1
		2 0 0.00164832 1 0.99835167999999996
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
		1 0 1
		1 0 1
		1 0 1;
	setAttr -s 2 ".pm";
	setAttr ".pm[0]" -type "matrix" -4.9917997860649909e-17 1.0000000000000002 5.2130664447168387e-16 0
		 -0.60841651512164618 -3.5243713855912104e-16 0.79361788294319058 0 0.79361788294319069 -2.7019120946010058e-16 0.60841651512164618 0
		 2.2597591098505747 5.5780562050032239e-16 -0.25606659231521117 1;
	setAttr ".pm[1]" -type "matrix" 2.7755576530543663e-16 1 4.4408920413184534e-16 0
		 2.0602048678153295e-08 -3.5243713855912104e-16 0.99999999999999978 0 0.99999999999999989 -2.7019120946010058e-16 -2.0602048733664446e-08 0
		 -0.0060783374550951418 4.9535557536515724e-16 -0.31799741504528456 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 2 ".ma";
	setAttr -s 2 ".dpf[0:1]"  4 4;
	setAttr -s 2 ".lw";
	setAttr -s 2 ".lw";
	setAttr ".mmi" yes;
	setAttr ".ucm" yes;
	setAttr -s 2 ".ifcl";
	setAttr -s 2 ".ifcl";
createNode tweak -n "tweak25";
	rename -uid "685F58CB-48A7-D0DA-2ECF-0F89390C6F65";
createNode dagPose -n "bindPose1";
	rename -uid "A6D3D06A-4E3D-7A89-910E-CFB8FFC8CC9A";
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
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 3.1415926535897927 -2.2248601143318201
		 1.5707963267948968 0 -4.4408920985006212e-16 1.5780937895153551 -1.637590096985706 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 1.332267629550188e-15 -0.65406380813897202
		 0 0 2.0711081027984619 6.2450045135165055e-17 5.5511151231257827e-17 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr -s 5 ".g[0:4]" yes yes yes no no;
	setAttr ".bp" yes;
createNode ngst2SkinLayerData -n "ngSkinToolsData_skinCluster1";
	rename -uid "FB33B842-4DF5-F073-55B3-F2943B276E33";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 16 2232 {
"3ClcRQEAAAEAAAAMAAAAQmFzZSB3ZWlnaHRzARQJAQTwPwkIBAAAASwAAhENBQERHN4IAP4BAH54AH4BAGZAAPA+FiCliHpzzT/+DSrl9CfoPzlEjkN7Weg/CPyTMww5yz9XxpxCzCXnPykcIKS+Euc/APSsbXic5z90wq1uY8PoLTRmYAAJmhkgOBRVB8t3u+k/3cP59G1650IgAD4wAL4QAHgknB4NhhTnPyia5ix9Bec/x/g5xSTn5z9fJFNPWqPpFVAYj+4PwCvA7BUQXmgANDEICX7IC+s/Av5eeOmexrAAeEOWIy+BldE/e2sQRzOGrj9reZxiE3LQPyulG8kFU9ZCeAA4tYAVuWLF3z/Ys5tIOYbgQiAAmLGGtrpawuw/1nIXOSRJ5z8Rj267DkTnP+nZHtmsPOk/MRhtBbW96kI4AF7gADjW17e6runtP4Yo9Qh8SOliKABeQAB4V1WEpI/94D8bCnI2LqTeP8Hy+sOzV+M/w/rR2Z695EI4ADQpZvSS7z3nP7xp+LVuKGZQAXjT7S4xjLTrP7iMGeXXIOk/H/q+RDS66T+afvcyO5btQlgAXqAAOBxfqtx2H+8/3waZgy7/62IoAF5AABjM8DS1l0ToFSBY8sPb/0Tv6T9L/3ghjvPpPzQlTl6U4O8VIDQcavMVGcLsP00DV5iNwYZgAl54ANYYAH4BAHmIOLpPmfsuAMc/QezwBXN6w9pwABFQfgEAEShA8D9TuO3Jv5VTP4D2H+imi5RCeACYsS0XV29n7z/6mKeaigrtPxBobZAqS+c/6QPXMMCr7j+mpDY/IaHsQjgACYIc8D9eR2jer/c5kBEYvggA8JUjlIr+C3nvP6Yd1z//be8/cLvlE4Bt7z/yy3j9gnjvP0VZ464woO8/0T6BRHeZ7z/hhJuKRZXvPx3QPIZpnO8/riX8OV/I7z/mUa8lXsXvP6GMuXlqwu8/RkhrmYXF7z8s/wdvkNPvP7wGJ+qd0e8/s/NjkMbU7z+uTX5oY9bvP8krUJoO4O8/EifJIUzf7z8ceqAy29+m2AAUCGH2KC4xZjAAFOD2NorlZWYgAL4wAf4wABEwGAmyStlIabgNUEAAAFBFc02n6zk/1XSjkVP0ag0YWVD+eAAReD5IAPBV2TnVvDLr7z/1J03M/v/vP4Z9T0yi/u8/5DeLEv//7z+jvzHstPbvPz6MbtnG9+8/tw9/LiL/7z+N/Ni1DvbvP4+tFH299+8/XUMZoKn57z+R2qAUkPqGcAEUekORY87/ZigAuKKGLWrC8u8/xQHY3sr17z8PXv3QN/jvP08rhfoO+O8/rL85o6b07z/n17M+VfLvQtgAECvCxiOiFWAgAADkLg==",
"uvRLUG4NKH4BAKZ4ATDvM91b4P/vPx3XrKOfFXAY8D8e/IRH8AGgEJx/XG79ZugACYoc8D/oVtIxUdsZKBgH0rO0EwXuFSARKBEIGOsOPMaOAVsNEP4BAF4BAEYIASZICv4BAEZcAAlSnhgAfgEAfkgAZgEA8D76t9ZdIaPoP9/HV2ssYM8/IO/G8RKazj/yABvzvDHpP1NzxnpntNE/rse/t4La0T/RF6YkD8fQPzT2SEVy8swNyKYBADi1q+LTIBLJP0R4DBYkC9HCQAB+AQB4ncfC5fPW0T+vyzKmBfXRP10OjHW2MdA/gm6zwpZyyRVwGIGLgP+h/rkVEF4BADjn3tsH3tDDP+8DQg8twtCCMAA+AQB03jRuaD815z9I+Y7LnBfuPz/DsU72xuc/Iy1yG33WHkwJGQE4pT91o04d4D9OmMhujfPeQnAAmA3KSyoq7bk/VRrRjbdt0T/Q4SKJ4nfRPw+YhJtMDcs/PJ9L6isJxUI4AF4BADhVQUEqirKwP4hdK9wP3sqiOAARAXRRVfe24ATeP+r6xuToreA/fhoKeJhQ2T8FClxMwoQeDAsZATSuMxfaIITRP28sD5Qir2YAAnhMSEQ7zy3BPyLNmWugfMs/MhcE7S4XyT81C0RoJk6zoqgAONIZtGokEZw/heSb8UUDwKI4ABEBGM48LCuh7c4VOFg38JAA7ELIPw8CHHrHMcg/fcHasaFrbxUgNDCuZFA377k/k+VHPZPzhmAC/gEANgEApggENAysGUH0P+o/78SDPmMhHkQL3gEApngANCMJGyA19u8/SwC/yKJb0QQZAZhSRhodFRKTPzI4wyqrq7c/2C8l36pp0T9pwY/y/EOlP1naSgb29ro1cD4BABiNOHEvQ6BQYiAAngEA8Jqqe60ugN6QP3JKHAUYQJI/DJJIg/1Pkj/NgeZQoO+QP5CuKUfU84c/wEqw3y6iiT/zxx5Zna6KP/P4y3Ce5Yg/zCjtAWPQez9RAFco7VB9P8KvOSPDyn4/ytxbSjM9fT+ZaQB8yDd2P8eTfOwKMXc/0yUGzrecdT87KdnAS850Pwo31K9l8W8/oHdsG+9ZcD9y8cKvZhJwPwAAAJLDABie3jPhOtqZYggBGP0jIblOQ5NiIAD+AQDeAQAUq6nW5NbyJmQNNJdRFovC/O8/gFxurAvlRjAC/gEAXgEA8FgoJsYqQ81kP79wv4AtO6M+3igkCDvbJT8urmcDma6dPqSvgJwnllI/9YPnIk1yUD9lBwkeMLobP9vdBk6U4lM/fdak1gWFUD9vjvKaf1lJPzuFlXytv0U/AHqxABzTdEJeN874Pl4nALjvuvKkK3taP2F4/E9CalQ/B8aHCg==",
"vCBPP1DDUusVxE8/dKiAjLmyVj/wMFCYglVbQuABGOqScU8OdwcNGBzwP9FFC7Sv4TFYpsgDfgEAOB/m4ssipO8+F+o0yhQXCA1wQAAAUcIH9nAfVj9hthgDHI00FRheAQAYeYDUFmdXchUoGEjewrTErq8VED4BABDR4Zw4f0okCwkofuAAniAAUgEAbi8KBJqZAQEAuRJTCkB4DAAAAGNsb3Nlc3RQb2ludC6YFBwBAAAAAQAAAA=="};
	setAttr ".imo" -type "string" "{\"_InfluenceMappingConfig__mirror_axis\": 0, \"dg_destination_attribute\": \"oppositeInfluence\", \"globs\": [[\"L_*\", \"R_*\"], [\"l_*\", \"r_*\"], [\"lf_*\", \"rt_*\"], [\"*_lf\", \"*_rt\"], [\"Left*\", \"Right*\"]]}";
createNode nearestPointOnCurve -n "nearestPointOnCurve2";
	rename -uid "624DD72A-4464-A31F-A6A9-7788AF8265E0";
	setAttr ".ip" -type "double3" -1.6511975207089764e-13 950.5148815332883 -316.09489230288875 ;
createNode decomposeMatrix -n "decomposeMatrix249";
	rename -uid "11E44670-49D8-7872-8DEC-5DA06F462502";
	setAttr ".imat" -type "matrix" 0.84913169800011634 0 0 0 0 0.84913169800011634 0 0
		 0 0 0.84913169800011634 0 0 0 0 1;
createNode nearestPointOnCurve -n "nearestPointOnCurve3";
	rename -uid "496EDE97-4B88-564E-DB7B-F584857EA322";
createNode multDoubleLinear -n "multDoubleLinear1631";
	rename -uid "0038C117-481E-79ED-58D8-4B8379A3B1DE";
createNode floatMath -n "floatMath1";
	rename -uid "1342C88F-47C9-1E49-DA72-4F8C704AAFB3";
createNode multiplyDivide -n "multiplyDivide7";
	rename -uid "0259040F-4E1A-7B96-73C3-CD8BAB1FF182";
	setAttr ".op" 2;
	setAttr ".i1" -type "float3" 1 0 0 ;
createNode nurbsTessellate -n "nurbsTessellate1";
	rename -uid "0720F770-44B6-8995-4C26-FD8B88A8EB16";
	setAttr ".f" 2;
	setAttr ".pt" 1;
	setAttr ".chr" 0.1;
	setAttr ".ut" 1;
	setAttr ".un" 31;
	setAttr ".vt" 1;
	setAttr ".ucr" no;
	setAttr ".cht" 0.2;
	setAttr ".mnd" yes;
	setAttr ".ntr" no;
createNode condition -n "condition227";
	rename -uid "EA369B61-44BB-761D-4C92-5BBEF79E86A3";
createNode clamp -n "clamp1";
	rename -uid "6395F1AD-4B8D-5102-6E9B-F497C75AC220";
	setAttr ".mn" -type "float3" -100 0 0 ;
	setAttr ".mx" -type "float3" 0 100 0 ;
createNode multiplyDivide -n "multiplyDivide8";
	rename -uid "C3612365-4C49-E8AB-E723-B88364BC4C29";
	setAttr ".op" 2;
createNode multDoubleLinear -n "multDoubleLinear1632";
	rename -uid "C75DD19A-41DA-90EF-B8C3-69A707E9C282";
	setAttr ".i1" 3.9086320953181728;
createNode reverse -n "reverse175";
	rename -uid "2A80CA98-4488-7582-933A-C6BA7604E10F";
createNode unitConversion -n "unitConversion1950";
	rename -uid "8CDDB0CD-4B4A-99C5-A80E-AC9597D0F23E";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1951";
	rename -uid "4B95C784-40F0-20A8-FE29-F592B11C7964";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "decomposeMatrix235";
	rename -uid "F7AF8990-447D-3702-571A-5D89B7334C8D";
createNode loft -n "loft1";
	rename -uid "942ADDCF-4688-694F-ECF7-F2AA0F96CA95";
	setAttr -s 2 ".ic";
	setAttr ".u" yes;
	setAttr -s 2 ".r[0:1]" no no;
	setAttr ".rsn" yes;
createNode blendColors -n "blendColors1";
	rename -uid "6C2BD9F0-4C71-4E52-50EE-E19F826744B8";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode unitConversion -n "unitConversion1961";
	rename -uid "3537B47A-4EDD-7AEA-61A9-B69D4229F35C";
	setAttr ".cf" 0.017453292519943295;
createNode condition -n "condition228";
	rename -uid "C55565CD-4AAE-CBB1-EFF7-E18734F363F7";
	setAttr ".op" 4;
	setAttr ".cf" -type "float3" 19.388 36.733185 1 ;
createNode unitConversion -n "unitConversion1962";
	rename -uid "6AF4EE66-4F4A-CDE1-75BE-F1AC06D5E9DE";
	setAttr ".cf" -57.296;
createNode addDoubleLinear -n "addDoubleLinear4";
	rename -uid "B9BA1884-4D10-22CA-02C6-53B29ADD317F";
	setAttr ".ihi" 2;
createNode multDoubleLinear -n "multDoubleLinear1633";
	rename -uid "4E210F0B-4FFF-8459-4CE8-9E85EEC31625";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion1963";
	rename -uid "5A39409D-4B11-C9B9-045A-13BE9F5EC1B3";
	setAttr ".cf" 0.017453292519943295;
createNode remapValue -n "remapValue1";
	rename -uid "06922AC7-468B-6DA6-3B01-EB9383ED4C20";
	setAttr -s 2 ".vl";
	setAttr ".vl[0].vlp" 0;
	setAttr ".vl[0].vlfv" 1;
	setAttr ".vl[0].vli" 1;
	setAttr ".vl[2].vlp" 1;
	setAttr ".vl[2].vlfv" 0;
	setAttr ".vl[2].vli" 2;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode pointOnCurveInfo -n "pointOnCurveInfo1";
	rename -uid "C461FF73-46CB-5016-BD9F-02AB8E85B011";
	setAttr ".pr" 0.5;
createNode multDoubleLinear -n "multDoubleLinear1634";
	rename -uid "45913BC4-4C0C-AF95-AA55-FFBC1DED2E0C";
	setAttr ".i2" 0.5;
createNode remapValue -n "remapValue2";
	rename -uid "CFBD3B90-45D1-925A-749C-4D8BA77570DF";
	setAttr -s 2 ".vl";
	setAttr ".vl[0].vlp" 0;
	setAttr ".vl[0].vlfv" 0;
	setAttr ".vl[0].vli" 1;
	setAttr ".vl[2].vlp" 1;
	setAttr ".vl[2].vlfv" 1;
	setAttr ".vl[2].vli" 2;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode multDoubleLinear -n "multDoubleLinear1635";
	rename -uid "B6BED3C5-4D48-8706-031F-09A0D1CCA755";
	setAttr ".i2" 2;
createNode addDoubleLinear -n "addDoubleLinear5";
	rename -uid "A3C82A21-424A-CD72-6370-E9B1A407A21B";
	setAttr ".ihi" 2;
createNode setRange -n "setRange1";
	rename -uid "228BE35D-4925-ECAE-56B2-2581410BC4FD";
	setAttr ".m" -type "float3" 1 0 0 ;
createNode pointOnCurveInfo -n "pointOnCurveInfo2";
	rename -uid "7FFBCEB0-4449-6F10-311A-14841C49A789";
createNode multMatrix -n "multMatrix201";
	rename -uid "D08F9863-49A7-9459-92E2-49AC9BF56D33";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix250";
	rename -uid "C5CF9559-4238-053F-B44C-54A9BF6CF4AA";
createNode multDoubleLinear -n "multDoubleLinear1636";
	rename -uid "4F40C260-4F52-33CB-ABB7-B7B061AB30AD";
	setAttr ".i2" -1;
createNode nearestPointOnCurve -n "nearestPointOnCurve4";
	rename -uid "BAA498B3-4BAF-EA88-81E7-4084F7F11AC3";
	setAttr ".ip" -type "double3" 0 -1000 0 ;
createNode addDoubleLinear -n "addDoubleLinear6";
	rename -uid "CD281945-41D9-224F-0ED7-458B72844ACB";
	setAttr ".ihi" 2;
createNode unitConversion -n "unitConversion1965";
	rename -uid "A6709D8A-4FAC-B5F1-00FB-76B122908AD8";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion1966";
	rename -uid "C4B6CC02-4F90-7FAC-A196-E4AA4E38A4D7";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion1967";
	rename -uid "2D7C387D-402A-42D7-CA2B-90AC008D1C9C";
	setAttr ".cf" 0.017453292519943295;
createNode clamp -n "clamp2";
	rename -uid "B6D641D3-4FBE-6D3D-26AC-C1858A74EACA";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "B0253950-4322-68B3-53D5-D68F0045035B";
	setAttr -s 6 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 3234.2964437277469 -1131.679768716089 ;
	setAttr ".tgi[0].vh" -type "double2" 4760.6522294902352 501.06286755453266 ;
	setAttr -s 42 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 3385.71435546875;
	setAttr ".tgi[0].ni[0].y" -1545.7142333984375;
	setAttr ".tgi[0].ni[0].nvs" 18305;
	setAttr ".tgi[0].ni[1].x" 3055.71435546875;
	setAttr ".tgi[0].ni[1].y" -117.14286041259766;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 2846.466552734375;
	setAttr ".tgi[0].ni[2].y" -2337.549560546875;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 3078.571533203125;
	setAttr ".tgi[0].ni[3].y" -1650;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" 2748.571533203125;
	setAttr ".tgi[0].ni[4].y" -117.14286041259766;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 3362.857177734375;
	setAttr ".tgi[0].ni[5].y" -215.71427917480469;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" 3670;
	setAttr ".tgi[0].ni[6].y" -41.428569793701172;
	setAttr ".tgi[0].ni[6].nvs" 18305;
	setAttr ".tgi[0].ni[7].x" 3362.857177734375;
	setAttr ".tgi[0].ni[7].y" -472.85714721679688;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" 3362.857177734375;
	setAttr ".tgi[0].ni[8].y" 108.57142639160156;
	setAttr ".tgi[0].ni[8].nvs" 18305;
	setAttr ".tgi[0].ni[9].x" 3055.71435546875;
	setAttr ".tgi[0].ni[9].y" -275.71429443359375;
	setAttr ".tgi[0].ni[9].nvs" 18305;
	setAttr ".tgi[0].ni[10].x" 2748.571533203125;
	setAttr ".tgi[0].ni[10].y" -321.42855834960938;
	setAttr ".tgi[0].ni[10].nvs" 18305;
	setAttr ".tgi[0].ni[11].x" 4076.256591796875;
	setAttr ".tgi[0].ni[11].y" -66.763557434082031;
	setAttr ".tgi[0].ni[11].nvs" 18305;
	setAttr ".tgi[0].ni[12].x" 3670;
	setAttr ".tgi[0].ni[12].y" -1772.857177734375;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" 3604.28564453125;
	setAttr ".tgi[0].ni[13].y" 970;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" 2682.857177734375;
	setAttr ".tgi[0].ni[14].y" 848.5714111328125;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" 3977.142822265625;
	setAttr ".tgi[0].ni[15].y" -3072.857177734375;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" 3977.142822265625;
	setAttr ".tgi[0].ni[16].y" -1642.857177734375;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" 3977.142822265625;
	setAttr ".tgi[0].ni[17].y" -2942.857177734375;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" 3911.428466796875;
	setAttr ".tgi[0].ni[18].y" 1081.4285888671875;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" 2990;
	setAttr ".tgi[0].ni[19].y" 840;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" 3977.142822265625;
	setAttr ".tgi[0].ni[20].y" -1512.857177734375;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" 3670;
	setAttr ".tgi[0].ni[21].y" -1512.857177734375;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" 2375.71435546875;
	setAttr ".tgi[0].ni[22].y" 934.28570556640625;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" 3977.142822265625;
	setAttr ".tgi[0].ni[23].y" -1772.857177734375;
	setAttr ".tgi[0].ni[23].nvs" 18304;
	setAttr ".tgi[0].ni[24].x" 3670;
	setAttr ".tgi[0].ni[24].y" -1642.857177734375;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" 3604.28564453125;
	setAttr ".tgi[0].ni[25].y" 551.4285888671875;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[0].ni[26].x" 3604.28564453125;
	setAttr ".tgi[0].ni[26].y" 710;
	setAttr ".tgi[0].ni[26].nvs" 18304;
	setAttr ".tgi[0].ni[27].x" 3911.428466796875;
	setAttr ".tgi[0].ni[27].y" 882.85711669921875;
	setAttr ".tgi[0].ni[27].nvs" 18304;
	setAttr ".tgi[0].ni[28].x" 3977.142822265625;
	setAttr ".tgi[0].ni[28].y" -2682.857177734375;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" 3977.142822265625;
	setAttr ".tgi[0].ni[29].y" -2552.857177734375;
	setAttr ".tgi[0].ni[29].nvs" 18304;
	setAttr ".tgi[0].ni[30].x" 3670;
	setAttr ".tgi[0].ni[30].y" -1281.4285888671875;
	setAttr ".tgi[0].ni[30].nvs" 18304;
	setAttr ".tgi[0].ni[31].x" 3977.142822265625;
	setAttr ".tgi[0].ni[31].y" -2422.857177734375;
	setAttr ".tgi[0].ni[31].nvs" 18304;
	setAttr ".tgi[0].ni[32].x" 3977.142822265625;
	setAttr ".tgi[0].ni[32].y" -2292.857177734375;
	setAttr ".tgi[0].ni[32].nvs" 18304;
	setAttr ".tgi[0].ni[33].x" 3977.142822265625;
	setAttr ".tgi[0].ni[33].y" -2162.857177734375;
	setAttr ".tgi[0].ni[33].nvs" 18304;
	setAttr ".tgi[0].ni[34].x" 3297.142822265625;
	setAttr ".tgi[0].ni[34].y" 802.85711669921875;
	setAttr ".tgi[0].ni[34].nvs" 18304;
	setAttr ".tgi[0].ni[35].x" 3977.142822265625;
	setAttr ".tgi[0].ni[35].y" -1331.4285888671875;
	setAttr ".tgi[0].ni[35].nvs" 18304;
	setAttr ".tgi[0].ni[36].x" 3604.28564453125;
	setAttr ".tgi[0].ni[36].y" 811.4285888671875;
	setAttr ".tgi[0].ni[36].nvs" 18304;
	setAttr ".tgi[0].ni[37].x" 3911.428466796875;
	setAttr ".tgi[0].ni[37].y" 622.85711669921875;
	setAttr ".tgi[0].ni[37].nvs" 18304;
	setAttr ".tgi[0].ni[38].x" 3670;
	setAttr ".tgi[0].ni[38].y" -1382.857177734375;
	setAttr ".tgi[0].ni[38].nvs" 18304;
	setAttr ".tgi[0].ni[39].x" 3977.142822265625;
	setAttr ".tgi[0].ni[39].y" -2032.857177734375;
	setAttr ".tgi[0].ni[39].nvs" 18304;
	setAttr ".tgi[0].ni[40].x" 3977.142822265625;
	setAttr ".tgi[0].ni[40].y" -1902.857177734375;
	setAttr ".tgi[0].ni[40].nvs" 18304;
	setAttr ".tgi[0].ni[41].x" 3297.142822265625;
	setAttr ".tgi[0].ni[41].y" 1024.2857666015625;
	setAttr ".tgi[0].ni[41].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" 7740.1441698907984 -3774.1411875894328 ;
	setAttr ".tgi[1].vh" -type "double2" 9026.0111924347711 -2398.6493580530441 ;
	setAttr -s 10 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 8131.4287109375;
	setAttr ".tgi[1].ni[0].y" -2942.857177734375;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 7824.28564453125;
	setAttr ".tgi[1].ni[1].y" -2942.857177734375;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 6288.5712890625;
	setAttr ".tgi[1].ni[2].y" -2735.71435546875;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 8438.5712890625;
	setAttr ".tgi[1].ni[3].y" -2711.428466796875;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 7824.28564453125;
	setAttr ".tgi[1].ni[4].y" -2685.71435546875;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 8131.4287109375;
	setAttr ".tgi[1].ni[5].y" -2660;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 8438.5712890625;
	setAttr ".tgi[1].ni[6].y" -2812.857177734375;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" 6595.71435546875;
	setAttr ".tgi[1].ni[7].y" -2735.71435546875;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[1].ni[8].x" 6902.85693359375;
	setAttr ".tgi[1].ni[8].y" -2735.71435546875;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" 8438.5712890625;
	setAttr ".tgi[1].ni[9].y" -2942.857177734375;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" 3312.9272176968416 -3485.7313250077018 ;
	setAttr ".tgi[2].vh" -type "double2" 5523.9178209292531 -1120.6348907658632 ;
	setAttr -s 25 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 4916.54248046875;
	setAttr ".tgi[2].ni[0].y" -2546.28125;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" 4599.31591796875;
	setAttr ".tgi[2].ni[1].y" -2543.405029296875;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 4155.88623046875;
	setAttr ".tgi[2].ni[2].y" -3017.117919921875;
	setAttr ".tgi[2].ni[2].nvs" 18305;
	setAttr ".tgi[2].ni[3].x" 4443.56884765625;
	setAttr ".tgi[2].ni[3].y" -2876.7939453125;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" 3770.5380859375;
	setAttr ".tgi[2].ni[4].y" -2911.512451171875;
	setAttr ".tgi[2].ni[4].nvs" 18305;
	setAttr ".tgi[2].ni[5].x" 4338.78564453125;
	setAttr ".tgi[2].ni[5].y" -2450.086669921875;
	setAttr ".tgi[2].ni[5].nvs" 18305;
	setAttr ".tgi[2].ni[6].x" 3705.741455078125;
	setAttr ".tgi[2].ni[6].y" -2664.2744140625;
	setAttr ".tgi[2].ni[6].nvs" 18305;
	setAttr ".tgi[2].ni[7].x" 4886.4951171875;
	setAttr ".tgi[2].ni[7].y" -2321.944091796875;
	setAttr ".tgi[2].ni[7].nvs" 18304;
	setAttr ".tgi[2].ni[8].x" 4140.9873046875;
	setAttr ".tgi[2].ni[8].y" -2683.98095703125;
	setAttr ".tgi[2].ni[8].nvs" 18305;
	setAttr ".tgi[2].ni[9].x" 4546.1181640625;
	setAttr ".tgi[2].ni[9].y" -2383.664794921875;
	setAttr ".tgi[2].ni[9].nvs" 18304;
	setAttr ".tgi[2].ni[10].x" 2932.857177734375;
	setAttr ".tgi[2].ni[10].y" -2357.142822265625;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" 3775.86669921875;
	setAttr ".tgi[2].ni[11].y" -2289.8857421875;
	setAttr ".tgi[2].ni[11].nvs" 18305;
	setAttr ".tgi[2].ni[12].x" 4766.47998046875;
	setAttr ".tgi[2].ni[12].y" -2049.73046875;
	setAttr ".tgi[2].ni[12].nvs" 18304;
	setAttr ".tgi[2].ni[13].x" 5192.4853515625;
	setAttr ".tgi[2].ni[13].y" -1866.900634765625;
	setAttr ".tgi[2].ni[13].nvs" 18304;
	setAttr ".tgi[2].ni[14].x" 4071.081298828125;
	setAttr ".tgi[2].ni[14].y" -1622.9415283203125;
	setAttr ".tgi[2].ni[14].nvs" 18305;
	setAttr ".tgi[2].ni[15].x" 3319.221923828125;
	setAttr ".tgi[2].ni[15].y" -2728.33154296875;
	setAttr ".tgi[2].ni[15].nvs" 18305;
	setAttr ".tgi[2].ni[16].x" 4753.13818359375;
	setAttr ".tgi[2].ni[16].y" -2787.5498046875;
	setAttr ".tgi[2].ni[16].nvs" 18305;
	setAttr ".tgi[2].ni[17].x" 4110.0361328125;
	setAttr ".tgi[2].ni[17].y" -1970.060791015625;
	setAttr ".tgi[2].ni[17].nvs" 18305;
	setAttr ".tgi[2].ni[18].x" 5099.8271484375;
	setAttr ".tgi[2].ni[18].y" -2121.63037109375;
	setAttr ".tgi[2].ni[18].nvs" 18304;
	setAttr ".tgi[2].ni[19].x" 3433.7392578125;
	setAttr ".tgi[2].ni[19].y" -1611.447998046875;
	setAttr ".tgi[2].ni[19].nvs" 18305;
	setAttr ".tgi[2].ni[20].x" 3777.947021484375;
	setAttr ".tgi[2].ni[20].y" -1635.8863525390625;
	setAttr ".tgi[2].ni[20].nvs" 18305;
	setAttr ".tgi[2].ni[21].x" 3196.322998046875;
	setAttr ".tgi[2].ni[21].y" -2279.196044921875;
	setAttr ".tgi[2].ni[21].nvs" 18305;
	setAttr ".tgi[2].ni[22].x" 3463.544189453125;
	setAttr ".tgi[2].ni[22].y" -2254.968994140625;
	setAttr ".tgi[2].ni[22].nvs" 18305;
	setAttr ".tgi[2].ni[23].x" 4371.82421875;
	setAttr ".tgi[2].ni[23].y" -1881.782958984375;
	setAttr ".tgi[2].ni[23].nvs" 18305;
	setAttr ".tgi[2].ni[24].x" 4925.13330078125;
	setAttr ".tgi[2].ni[24].y" -1862.9881591796875;
	setAttr ".tgi[2].ni[24].nvs" 18304;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" 2231.6547106759185 -1743.7336532909519 ;
	setAttr ".tgi[3].vh" -type "double2" 3611.1206226587096 -268.11910078274065 ;
	setAttr -s 18 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 2261.880126953125;
	setAttr ".tgi[3].ni[0].y" -1689.3062744140625;
	setAttr ".tgi[3].ni[0].nvs" 18304;
	setAttr ".tgi[3].ni[1].x" 2759.254638671875;
	setAttr ".tgi[3].ni[1].y" -914.65838623046875;
	setAttr ".tgi[3].ni[1].nvs" 18305;
	setAttr ".tgi[3].ni[2].x" 1905.9779052734375;
	setAttr ".tgi[3].ni[2].y" -1593.1187744140625;
	setAttr ".tgi[3].ni[2].nvs" 18304;
	setAttr ".tgi[3].ni[3].x" 1578.406005859375;
	setAttr ".tgi[3].ni[3].y" -1521.56494140625;
	setAttr ".tgi[3].ni[3].nvs" 18305;
	setAttr ".tgi[3].ni[4].x" 1212.857177734375;
	setAttr ".tgi[3].ni[4].y" -617.14288330078125;
	setAttr ".tgi[3].ni[4].nvs" 18305;
	setAttr ".tgi[3].ni[5].x" 1839.1763916015625;
	setAttr ".tgi[3].ni[5].y" -690.11163330078125;
	setAttr ".tgi[3].ni[5].nvs" 18304;
	setAttr ".tgi[3].ni[6].x" 2148.049072265625;
	setAttr ".tgi[3].ni[6].y" -382.39797973632812;
	setAttr ".tgi[3].ni[6].nvs" 18305;
	setAttr ".tgi[3].ni[7].x" 3038.35400390625;
	setAttr ".tgi[3].ni[7].y" -992.609130859375;
	setAttr ".tgi[3].ni[7].nvs" 18304;
	setAttr ".tgi[3].ni[8].x" 2441.428466796875;
	setAttr ".tgi[3].ni[8].y" -918.5714111328125;
	setAttr ".tgi[3].ni[8].nvs" 18305;
	setAttr ".tgi[3].ni[9].x" 3291.96044921875;
	setAttr ".tgi[3].ni[9].y" -1137.4630126953125;
	setAttr ".tgi[3].ni[9].nvs" 18304;
	setAttr ".tgi[3].ni[10].x" 2558.571533203125;
	setAttr ".tgi[3].ni[10].y" -530;
	setAttr ".tgi[3].ni[10].nvs" 18304;
	setAttr ".tgi[3].ni[11].x" 3386.5263671875;
	setAttr ".tgi[3].ni[11].y" -933.147216796875;
	setAttr ".tgi[3].ni[11].nvs" 18304;
	setAttr ".tgi[3].ni[12].x" 2558.571533203125;
	setAttr ".tgi[3].ni[12].y" -400;
	setAttr ".tgi[3].ni[12].nvs" 18304;
	setAttr ".tgi[3].ni[13].x" 2294.16259765625;
	setAttr ".tgi[3].ni[13].y" -104.41067504882812;
	setAttr ".tgi[3].ni[13].nvs" 18304;
	setAttr ".tgi[3].ni[14].x" 3035.564208984375;
	setAttr ".tgi[3].ni[14].y" -800.94281005859375;
	setAttr ".tgi[3].ni[14].nvs" 18304;
	setAttr ".tgi[3].ni[15].x" 3115.190673828125;
	setAttr ".tgi[3].ni[15].y" -1318.846435546875;
	setAttr ".tgi[3].ni[15].nvs" 18304;
	setAttr ".tgi[3].ni[16].x" 2639.263916015625;
	setAttr ".tgi[3].ni[16].y" -1328.9532470703125;
	setAttr ".tgi[3].ni[16].nvs" 18304;
	setAttr ".tgi[3].ni[17].x" 1552.08935546875;
	setAttr ".tgi[3].ni[17].y" -401.86602783203125;
	setAttr ".tgi[3].ni[17].nvs" 18305;
	setAttr ".tgi[4].tn" -type "string" "Untitled_5";
	setAttr ".tgi[4].vl" -type "double2" 10114.761010188346 -2250.940483099756 ;
	setAttr ".tgi[4].vh" -type "double2" 12630.687738761782 440.34609489990027 ;
	setAttr -s 13 ".tgi[4].ni";
	setAttr ".tgi[4].ni[0].x" 11938.8671875;
	setAttr ".tgi[4].ni[0].y" -255.90614318847656;
	setAttr ".tgi[4].ni[0].nvs" 18305;
	setAttr ".tgi[4].ni[1].x" 11655.857421875;
	setAttr ".tgi[4].ni[1].y" -330.20425415039062;
	setAttr ".tgi[4].ni[1].nvs" 18304;
	setAttr ".tgi[4].ni[2].x" 10504.458984375;
	setAttr ".tgi[4].ni[2].y" -363.2845458984375;
	setAttr ".tgi[4].ni[2].nvs" 18305;
	setAttr ".tgi[4].ni[3].x" 10810;
	setAttr ".tgi[4].ni[3].y" -565.71429443359375;
	setAttr ".tgi[4].ni[3].nvs" 18304;
	setAttr ".tgi[4].ni[4].x" 10810;
	setAttr ".tgi[4].ni[4].y" -680;
	setAttr ".tgi[4].ni[4].nvs" 18304;
	setAttr ".tgi[4].ni[5].x" 11097.828125;
	setAttr ".tgi[4].ni[5].y" -479.88327026367188;
	setAttr ".tgi[4].ni[5].nvs" 18305;
	setAttr ".tgi[4].ni[6].x" 10493.24609375;
	setAttr ".tgi[4].ni[6].y" -745.3292236328125;
	setAttr ".tgi[4].ni[6].nvs" 18305;
	setAttr ".tgi[4].ni[7].x" 10521.3583984375;
	setAttr ".tgi[4].ni[7].y" -98.923126220703125;
	setAttr ".tgi[4].ni[7].nvs" 18305;
	setAttr ".tgi[4].ni[8].x" 11394.294921875;
	setAttr ".tgi[4].ni[8].y" -328.46829223632812;
	setAttr ".tgi[4].ni[8].nvs" 18304;
	setAttr ".tgi[4].ni[9].x" 10999.890625;
	setAttr ".tgi[4].ni[9].y" -800.33087158203125;
	setAttr ".tgi[4].ni[9].nvs" 18305;
	setAttr ".tgi[4].ni[10].x" 11494.751953125;
	setAttr ".tgi[4].ni[10].y" -759.15338134765625;
	setAttr ".tgi[4].ni[10].nvs" 18305;
	setAttr ".tgi[4].ni[11].x" 11848.92578125;
	setAttr ".tgi[4].ni[11].y" -976.2169189453125;
	setAttr ".tgi[4].ni[11].nvs" 18304;
	setAttr ".tgi[4].ni[12].x" 11514.2861328125;
	setAttr ".tgi[4].ni[12].y" -1178.5714111328125;
	setAttr ".tgi[4].ni[12].nvs" 18304;
	setAttr ".tgi[5].tn" -type "string" "Untitled_6";
	setAttr ".tgi[5].vl" -type "double2" 1243.9323412822921 -593.97447990620572 ;
	setAttr ".tgi[5].vh" -type "double2" 2412.7462950852923 656.30569332933669 ;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 32;
	setAttr -av -k on ".unw" 32;
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
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -k on ".sslt";
	setAttr -k on ".cbr";
	setAttr -k on ".bbr";
	setAttr -av -k on ".mhl";
	setAttr -k on ".cons" no;
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
	setAttr -s 23 ".st";
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
	setAttr -s 8 ".s";
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
	setAttr -s 61 ".u";
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
	setAttr -s 3 ".dsm";
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
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".gsn";
	setAttr -k on ".gsv";
	setAttr -s 4 ".sol";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster1.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "multDoubleLinear1627.o" "mainPoser_clusterHandle.sx";
connectAttr "multDoubleLinear1627.o" "mainPoser_clusterHandle.sy";
connectAttr "multDoubleLinear1627.o" "mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere1.os" "root_poserShape.cr";
connectAttr "root_poserOrient_aimConstraint1.crx" "root_poserOrient.rx";
connectAttr "root_poserOrient_aimConstraint1.cry" "root_poserOrient.ry";
connectAttr "root_poserOrient_aimConstraint1.crz" "root_poserOrient.rz";
connectAttr "root_poserOrient.pim" "root_poserOrient_aimConstraint1.cpim";
connectAttr "root_poserOrient.t" "root_poserOrient_aimConstraint1.ct";
connectAttr "root_poserOrient.rp" "root_poserOrient_aimConstraint1.crp";
connectAttr "root_poserOrient.rpt" "root_poserOrient_aimConstraint1.crt";
connectAttr "root_poserOrient.ro" "root_poserOrient_aimConstraint1.cro";
connectAttr "toe_poser.t" "root_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "toe_poser.rp" "root_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "toe_poser.rpt" "root_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "toe_poser.pm" "root_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "root_poserOrient_aimConstraint1.w0" "root_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1942.o" "root_poserOrient_aimConstraint1.ox";
connectAttr "mainPoser.wm" "root_poserOrient_aimConstraint1.wum";
connectAttr "mirror_condition.ocr" "ik_foot_initLoc.sx";
connectAttr "mirror_condition.ocr" "ik_heel_initLoc.sx";
connectAttr "makeNurbSphere2.os" "toe_poserShape.cr";
connectAttr "toe_poserOrient_aimConstraint1.crx" "toe_poserOrient.rx";
connectAttr "toe_poserOrient_aimConstraint1.cry" "toe_poserOrient.ry";
connectAttr "toe_poserOrient_aimConstraint1.crz" "toe_poserOrient.rz";
connectAttr "mirror_condition.ocr" "ik_toe_initLoc.sx";
connectAttr "toe_poserOrient.pim" "toe_poserOrient_aimConstraint1.cpim";
connectAttr "toe_poserOrient.t" "toe_poserOrient_aimConstraint1.ct";
connectAttr "toe_poserOrient.rp" "toe_poserOrient_aimConstraint1.crp";
connectAttr "toe_poserOrient.rpt" "toe_poserOrient_aimConstraint1.crt";
connectAttr "toe_poserOrient.ro" "toe_poserOrient_aimConstraint1.cro";
connectAttr "toeTip_poser.t" "toe_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "toeTip_poser.rp" "toe_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "toeTip_poser.rpt" "toe_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "toeTip_poser.pm" "toe_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "toe_poserOrient_aimConstraint1.w0" "toe_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1943.o" "toe_poserOrient_aimConstraint1.ox";
connectAttr "mainPoser.wm" "toe_poserOrient_aimConstraint1.wum";
connectAttr "mirror_condition.ocr" "toe_initLoc.sx";
connectAttr "toe_poser.ty" "toeTip_poser.ty" -l on;
connectAttr "makeNurbSphere3.os" "toeTip_poserShape.cr";
connectAttr "toeTip_poserOrient_aimConstraint1.crx" "toeTip_poserOrient.rx";
connectAttr "toeTip_poserOrient_aimConstraint1.cry" "toeTip_poserOrient.ry";
connectAttr "toeTip_poserOrient_aimConstraint1.crz" "toeTip_poserOrient.rz";
connectAttr "mirror_condition.ocr" "toeTip_initLoc.sx";
connectAttr "toeTip_poserOrient.pim" "toeTip_poserOrient_aimConstraint1.cpim";
connectAttr "toeTip_poserOrient.t" "toeTip_poserOrient_aimConstraint1.ct";
connectAttr "toeTip_poserOrient.rp" "toeTip_poserOrient_aimConstraint1.crp";
connectAttr "toeTip_poserOrient.rpt" "toeTip_poserOrient_aimConstraint1.crt";
connectAttr "toeTip_poserOrient.ro" "toeTip_poserOrient_aimConstraint1.cro";
connectAttr "toe_poser.t" "toeTip_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "toe_poser.rp" "toeTip_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "toe_poser.rpt" "toeTip_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "toe_poser.pm" "toeTip_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "toeTip_poserOrient_aimConstraint1.w0" "toeTip_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1944.o" "toeTip_poserOrient_aimConstraint1.ox";
connectAttr "mainPoser.wm" "toeTip_poserOrient_aimConstraint1.wum";
connectAttr "ik_heel_initLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "ik_toe_initLocShape.wp" "posers_curveShape.cp[1]";
connectAttr "toeTip_initLocShape.wp" "posers_curveShape.cp[2]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "decomposeMatrix239.orx" "fk_connector_init.rx";
connectAttr "decomposeMatrix239.ory" "fk_connector_init.ry";
connectAttr "decomposeMatrix239.orz" "fk_connector_init.rz";
connectAttr "decomposeMatrix239.otx" "fk_connector_init.tx";
connectAttr "decomposeMatrix239.oty" "fk_connector_init.ty";
connectAttr "decomposeMatrix239.otz" "fk_connector_init.tz";
connectAttr "decomposeMatrix239.osx" "fk_connector_init.sx";
connectAttr "decomposeMatrix239.osy" "fk_connector_init.sy";
connectAttr "decomposeMatrix239.osz" "fk_connector_init.sz";
connectAttr "decomposeMatrix235.otx" "ik_init.tx";
connectAttr "decomposeMatrix235.oty" "ik_init.ty";
connectAttr "decomposeMatrix235.otz" "ik_init.tz";
connectAttr "decomposeMatrix235.orx" "ik_init.rx";
connectAttr "decomposeMatrix235.ory" "ik_init.ry";
connectAttr "decomposeMatrix235.orz" "ik_init.rz";
connectAttr "decomposeMatrix235.osx" "ik_init.sx";
connectAttr "decomposeMatrix235.osy" "ik_init.sy";
connectAttr "decomposeMatrix235.osz" "ik_init.sz";
connectAttr "decomposeMatrix247.ot" "root_connector_group.t";
connectAttr "decomposeMatrix247.or" "root_connector_group.r";
connectAttr "decomposeMatrix247.osy" "root_connector_group.sy";
connectAttr "decomposeMatrix247.osx" "root_connector_group.sx";
connectAttr "decomposeMatrix247.osz" "root_connector_group.sz";
connectAttr "ik_connector_decMat.or" "ik_connector.r";
connectAttr "decomposeMatrix247.ot" "controls.t";
connectAttr "decomposeMatrix247.or" "controls.r";
connectAttr "decomposeMatrix238.osx" "controls.sx";
connectAttr "decomposeMatrix238.osy" "controls.sy";
connectAttr "decomposeMatrix238.osz" "controls.sz";
connectAttr "mod.ikFk" "ik_controls.v";
connectAttr "decomposeMatrix243.otx" "global_group.tx";
connectAttr "decomposeMatrix243.oty" "global_group.ty";
connectAttr "decomposeMatrix243.otz" "global_group.tz";
connectAttr "decomposeMatrix243.orx" "global_group.rx";
connectAttr "decomposeMatrix243.ory" "global_group.ry";
connectAttr "decomposeMatrix243.orz" "global_group.rz";
connectAttr "decomposeMatrix243.osx" "global_group.sx";
connectAttr "decomposeMatrix243.osy" "global_group.sy";
connectAttr "decomposeMatrix243.osz" "global_group.sz";
connectAttr "mirror_condition.ocr" "mirror_group.sx";
connectAttr "posers.v" "edge.v";
connectAttr "decomposeMatrix244.ot" "footTwistFront_group.t";
connectAttr "unitConversion1933.o" "heel_rotate_group.rx";
connectAttr "unitConversion1961.o" "group1.rx";
connectAttr "multDoubleLinear1636.o" "group1.ty";
connectAttr "unitConversion1963.o" "group2.rx";
connectAttr "decomposeMatrix184.otx" "init_group.tx";
connectAttr "decomposeMatrix184.oty" "init_group.ty";
connectAttr "decomposeMatrix184.otz" "init_group.tz";
connectAttr "ik_heel_controlJoint_pointConstraint1.ctx" "ik_heel_controlJoint.tx"
		;
connectAttr "ik_heel_controlJoint_pointConstraint1.cty" "ik_heel_controlJoint.ty"
		;
connectAttr "ik_heel_controlJoint_pointConstraint1.ctz" "ik_heel_controlJoint.tz"
		;
connectAttr "root_toeBall_distance_scaled.ox" "ik_toe_controlJoint.tx";
connectAttr "ik_heel_controlJoint.s" "ik_toe_controlJoint.is";
connectAttr "ik_toe_controlJoint.s" "toeTip_controlJoint.is";
connectAttr "multiplyDivide3.ox" "toeTip_controlJoint.tx";
connectAttr "toeTip_controlJoint.tx" "ik_toe_eff.tx";
connectAttr "toeTip_controlJoint.ty" "ik_toe_eff.ty";
connectAttr "toeTip_controlJoint.tz" "ik_toe_eff.tz";
connectAttr "unitConversion1950.o" "ik_toe_controlJoint_out.rx";
connectAttr "ik_toe_controlJoint.tx" "ik_heel_eff.tx";
connectAttr "ik_toe_controlJoint.ty" "ik_heel_eff.ty";
connectAttr "ik_toe_controlJoint.tz" "ik_heel_eff.tz";
connectAttr "ik_heel_controlJoint.pim" "ik_heel_controlJoint_pointConstraint1.cpim"
		;
connectAttr "ik_heel_controlJoint.rp" "ik_heel_controlJoint_pointConstraint1.crp"
		;
connectAttr "ik_heel_controlJoint.rpt" "ik_heel_controlJoint_pointConstraint1.crt"
		;
connectAttr "ikRev_connector.t" "ik_heel_controlJoint_pointConstraint1.tg[0].tt"
		;
connectAttr "ikRev_connector.rp" "ik_heel_controlJoint_pointConstraint1.tg[0].trp"
		;
connectAttr "ikRev_connector.rpt" "ik_heel_controlJoint_pointConstraint1.tg[0].trt"
		;
connectAttr "ikRev_connector.pm" "ik_heel_controlJoint_pointConstraint1.tg[0].tpm"
		;
connectAttr "ik_heel_controlJoint_pointConstraint1.w0" "ik_heel_controlJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1951.o" "ik_heel_controlJoint_out.rx";
connectAttr "mirror_condition.ocr" "target.sx";
connectAttr "ik_heel_controlJoint.msg" "ik_heel_ikh.hsj";
connectAttr "ik_heel_eff.hp" "ik_heel_ikh.hee";
connectAttr "ikRPsolver20.msg" "ik_heel_ikh.hsv";
connectAttr "ik_heel_ikh_poleVectorConstraint1.ctx" "ik_heel_ikh.pvx";
connectAttr "ik_heel_ikh_poleVectorConstraint1.cty" "ik_heel_ikh.pvy";
connectAttr "ik_heel_ikh_poleVectorConstraint1.ctz" "ik_heel_ikh.pvz";
connectAttr "ik_heel_ikh.pim" "ik_heel_ikh_poleVectorConstraint1.cpim";
connectAttr "ik_heel_controlJoint.pm" "ik_heel_ikh_poleVectorConstraint1.ps";
connectAttr "ik_heel_controlJoint.t" "ik_heel_ikh_poleVectorConstraint1.crp";
connectAttr "ik_heel_upv.t" "ik_heel_ikh_poleVectorConstraint1.tg[0].tt";
connectAttr "ik_heel_upv.rp" "ik_heel_ikh_poleVectorConstraint1.tg[0].trp";
connectAttr "ik_heel_upv.rpt" "ik_heel_ikh_poleVectorConstraint1.tg[0].trt";
connectAttr "ik_heel_upv.pm" "ik_heel_ikh_poleVectorConstraint1.tg[0].tpm";
connectAttr "ik_heel_ikh_poleVectorConstraint1.w0" "ik_heel_ikh_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "ik_toe_controlJoint.msg" "ik_toe_ikh.hsj";
connectAttr "ik_toe_eff.hp" "ik_toe_ikh.hee";
connectAttr "ikRPsolver20.msg" "ik_toe_ikh.hsv";
connectAttr "decomposeMatrix187.otx" "ik_toe_ikh.tx";
connectAttr "decomposeMatrix187.oty" "ik_toe_ikh.ty";
connectAttr "decomposeMatrix187.otz" "ik_toe_ikh.tz";
connectAttr "ik_toe_ikh_poleVectorConstraint1.ctx" "ik_toe_ikh.pvx";
connectAttr "ik_toe_ikh_poleVectorConstraint1.cty" "ik_toe_ikh.pvy";
connectAttr "ik_toe_ikh_poleVectorConstraint1.ctz" "ik_toe_ikh.pvz";
connectAttr "ik_toe_ikh.pim" "ik_toe_ikh_poleVectorConstraint1.cpim";
connectAttr "ik_toe_controlJoint.pm" "ik_toe_ikh_poleVectorConstraint1.ps";
connectAttr "ik_toe_controlJoint.t" "ik_toe_ikh_poleVectorConstraint1.crp";
connectAttr "ik_toe_upv.t" "ik_toe_ikh_poleVectorConstraint1.tg[0].tt";
connectAttr "ik_toe_upv.rp" "ik_toe_ikh_poleVectorConstraint1.tg[0].trp";
connectAttr "ik_toe_upv.rpt" "ik_toe_ikh_poleVectorConstraint1.tg[0].trt";
connectAttr "ik_toe_upv.pm" "ik_toe_ikh_poleVectorConstraint1.tg[0].tpm";
connectAttr "ik_toe_ikh_poleVectorConstraint1.w0" "ik_toe_ikh_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "multDoubleLinear1624.o" "ik_toe_upv.tz";
connectAttr "curveShape4.ws" "curveShape1.cr";
connectAttr "curveShape4.ws" "curveShape3.cr";
connectAttr "decomposeMatrix237.otx" "ik_foot_group.tx";
connectAttr "decomposeMatrix237.oty" "ik_foot_group.ty";
connectAttr "decomposeMatrix237.otz" "ik_foot_group.tz";
connectAttr "decomposeMatrix237.orx" "ik_foot_group.rx";
connectAttr "decomposeMatrix237.ory" "ik_foot_group.ry";
connectAttr "decomposeMatrix237.orz" "ik_foot_group.rz";
connectAttr "decomposeMatrix237.osx" "ik_foot_group.sx";
connectAttr "decomposeMatrix237.osy" "ik_foot_group.sy";
connectAttr "decomposeMatrix237.osz" "ik_foot_group.sz";
connectAttr "decomposeMatrix240.ot" "ik_heel_group.t";
connectAttr "mirror_condition.ocr" "ik_heel_group.sx";
connectAttr "ik_heel_rotateZ.o" "ik_heel.rz";
connectAttr "ik_heel_rotateX.o" "ik_heel.rx";
connectAttr "ik_heel_rotateY.o" "ik_heel.ry";
connectAttr "reverse174.ox" "fk_controls.v";
connectAttr "decomposeMatrix191.otx" "fk_heel_group_2.tx";
connectAttr "decomposeMatrix191.oty" "fk_heel_group_2.ty";
connectAttr "decomposeMatrix191.otz" "fk_heel_group_2.tz";
connectAttr "decomposeMatrix191.orx" "fk_heel_group_2.rx";
connectAttr "decomposeMatrix191.ory" "fk_heel_group_2.ry";
connectAttr "decomposeMatrix191.orz" "fk_heel_group_2.rz";
connectAttr "decomposeMatrix191.osx" "fk_heel_group_2.sx";
connectAttr "decomposeMatrix191.osy" "fk_heel_group_2.sy";
connectAttr "decomposeMatrix191.osz" "fk_heel_group_2.sz";
connectAttr "unitConversion1957.o" "fk_heel_group.ry";
connectAttr "unitConversion1958.o" "fk_heel_reverse_group.ry";
connectAttr "unitConversion1952.o" "fk_heel_controlJoint.rx";
connectAttr "middleByRoot_decomposeMatrix.ot" "fk_toe_group_2.t";
connectAttr "middleByRoot_decomposeMatrix.or" "fk_toe_group_2.r";
connectAttr "unitConversion1953.o" "fk_toe_controlJoint.rx";
connectAttr "fk_toe_controlJoint.s" "fk_toeTip_controlJoint.is";
connectAttr "multDoubleLinear1624.o" "fk_toeTip_controlJoint.tx";
connectAttr "ik_connector_decMat.ory" "ik_foot_ikFkSwitchHelper.ry";
connectAttr "ik_connector_decMat.orz" "ik_foot_ikFkSwitchHelper.rz";
connectAttr "ik_connector_decMat.orx" "ik_foot_ikFkSwitchHelper.rx";
connectAttr "mirror_condition.ocr" "ik_foot_ikFkSwitchHelper.sx";
connectAttr "nearestPointOnCurve1.p" "footPivot.t";
connectAttr "nearestPointOnCurve2.p" "inner_footPivot.t";
connectAttr "decomposeMatrix235.otx" "ik_out.tx";
connectAttr "decomposeMatrix235.oty" "ik_out.ty";
connectAttr "decomposeMatrix235.otz" "ik_out.tz";
connectAttr "decomposeMatrix235.orx" "ik_out.rx";
connectAttr "decomposeMatrix235.ory" "ik_out.ry";
connectAttr "decomposeMatrix235.orz" "ik_out.rz";
connectAttr "decomposeMatrix235.osx" "ik_out.sx";
connectAttr "decomposeMatrix235.osy" "ik_out.sy";
connectAttr "decomposeMatrix235.osz" "ik_out.sz";
connectAttr "decomposeMatrix238.osx" "outJoints.sx";
connectAttr "decomposeMatrix238.osy" "outJoints.sy";
connectAttr "multDoubleLinear1622.o" "outJoints.sz";
connectAttr "heel_joint_pointConstraint1.ctx" "root_outJoint.tx";
connectAttr "heel_joint_pointConstraint1.cty" "root_outJoint.ty";
connectAttr "heel_joint_pointConstraint1.ctz" "root_outJoint.tz";
connectAttr "heel_finalJoint_orientConstraint1.crx" "root_outJoint.rx";
connectAttr "heel_finalJoint_orientConstraint1.cry" "root_outJoint.ry";
connectAttr "heel_finalJoint_orientConstraint1.crz" "root_outJoint.rz";
connectAttr "root_outJoint.s" "toe_outJoint.is";
connectAttr "multDoubleLinear1623.o" "toe_outJoint.tx";
connectAttr "toe_finalJoint_orientConstraint1.crx" "toe_outJoint.rx";
connectAttr "toe_finalJoint_orientConstraint1.cry" "toe_outJoint.ry";
connectAttr "toe_finalJoint_orientConstraint1.crz" "toe_outJoint.rz";
connectAttr "toe_outJoint.s" "toeTip_outJoint.is";
connectAttr "multDoubleLinear1624.o" "toeTip_outJoint.tx";
connectAttr "toe_outJoint.ro" "toe_finalJoint_orientConstraint1.cro";
connectAttr "toe_outJoint.pim" "toe_finalJoint_orientConstraint1.cpim";
connectAttr "toe_outJoint.jo" "toe_finalJoint_orientConstraint1.cjo";
connectAttr "ik_toe_controlJoint_out.r" "toe_finalJoint_orientConstraint1.tg[0].tr"
		;
connectAttr "ik_toe_controlJoint_out.ro" "toe_finalJoint_orientConstraint1.tg[0].tro"
		;
connectAttr "ik_toe_controlJoint_out.pm" "toe_finalJoint_orientConstraint1.tg[0].tpm"
		;
connectAttr "toe_finalJoint_orientConstraint1.w0" "toe_finalJoint_orientConstraint1.tg[0].tw"
		;
connectAttr "fk_toe_controlJoint.r" "toe_finalJoint_orientConstraint1.tg[1].tr";
connectAttr "fk_toe_controlJoint.ro" "toe_finalJoint_orientConstraint1.tg[1].tro"
		;
connectAttr "fk_toe_controlJoint.pm" "toe_finalJoint_orientConstraint1.tg[1].tpm"
		;
connectAttr "fk_toe_controlJoint.jo" "toe_finalJoint_orientConstraint1.tg[1].tjo"
		;
connectAttr "toe_finalJoint_orientConstraint1.w1" "toe_finalJoint_orientConstraint1.tg[1].tw"
		;
connectAttr "reverse174.ox" "toe_finalJoint_orientConstraint1.w1";
connectAttr "mod.ikFk" "toe_finalJoint_orientConstraint1.w0";
connectAttr "unitConversion1954.o" "fk_toe_ikFkSwitchHelper.ry";
connectAttr "root_outJoint.pim" "heel_joint_pointConstraint1.cpim";
connectAttr "root_outJoint.rp" "heel_joint_pointConstraint1.crp";
connectAttr "root_outJoint.rpt" "heel_joint_pointConstraint1.crt";
connectAttr "fk_heel_controlJoint.t" "heel_joint_pointConstraint1.tg[0].tt";
connectAttr "fk_heel_controlJoint.rp" "heel_joint_pointConstraint1.tg[0].trp";
connectAttr "fk_heel_controlJoint.rpt" "heel_joint_pointConstraint1.tg[0].trt";
connectAttr "fk_heel_controlJoint.pm" "heel_joint_pointConstraint1.tg[0].tpm";
connectAttr "heel_joint_pointConstraint1.w0" "heel_joint_pointConstraint1.tg[0].tw"
		;
connectAttr "ik_heel_controlJoint.t" "heel_joint_pointConstraint1.tg[1].tt";
connectAttr "ik_heel_controlJoint.rp" "heel_joint_pointConstraint1.tg[1].trp";
connectAttr "ik_heel_controlJoint.rpt" "heel_joint_pointConstraint1.tg[1].trt";
connectAttr "ik_heel_controlJoint.pm" "heel_joint_pointConstraint1.tg[1].tpm";
connectAttr "heel_joint_pointConstraint1.w1" "heel_joint_pointConstraint1.tg[1].tw"
		;
connectAttr "reverse174.ox" "heel_joint_pointConstraint1.w0";
connectAttr "mod.ikFk" "heel_joint_pointConstraint1.w1";
connectAttr "root_outJoint.ro" "heel_finalJoint_orientConstraint1.cro";
connectAttr "root_outJoint.pim" "heel_finalJoint_orientConstraint1.cpim";
connectAttr "root_outJoint.jo" "heel_finalJoint_orientConstraint1.cjo";
connectAttr "fk_heel_controlJoint.r" "heel_finalJoint_orientConstraint1.tg[0].tr"
		;
connectAttr "fk_heel_controlJoint.ro" "heel_finalJoint_orientConstraint1.tg[0].tro"
		;
connectAttr "fk_heel_controlJoint.pm" "heel_finalJoint_orientConstraint1.tg[0].tpm"
		;
connectAttr "fk_heel_controlJoint.jo" "heel_finalJoint_orientConstraint1.tg[0].tjo"
		;
connectAttr "heel_finalJoint_orientConstraint1.w0" "heel_finalJoint_orientConstraint1.tg[0].tw"
		;
connectAttr "ik_heel_controlJoint_out.r" "heel_finalJoint_orientConstraint1.tg[1].tr"
		;
connectAttr "ik_heel_controlJoint_out.ro" "heel_finalJoint_orientConstraint1.tg[1].tro"
		;
connectAttr "ik_heel_controlJoint_out.pm" "heel_finalJoint_orientConstraint1.tg[1].tpm"
		;
connectAttr "heel_finalJoint_orientConstraint1.w1" "heel_finalJoint_orientConstraint1.tg[1].tw"
		;
connectAttr "reverse174.ox" "heel_finalJoint_orientConstraint1.w0";
connectAttr "mod.ikFk" "heel_finalJoint_orientConstraint1.w1";
connectAttr "unitConversion1960.o" "fk_heel_ikFkSwitchHelper.ry";
connectAttr "skinCluster1.og[0]" "pasted__masha_l_shoeShape.i";
connectAttr "tweak25.vl[0].vt[0]" "pasted__masha_l_shoeShape.twl";
connectAttr "multiplyDivide7.ox" "locator1.ty";
connectAttr "loft1.os" "loftedSurfaceShape1.cr";
connectAttr "nurbsTessellate1.op" "nurbsToPolyShape1.i";
connectAttr "locator2.t" "curveShape4.cp[0]";
connectAttr "|curve4|locator6.t" "curveShape4.cp[1]";
connectAttr "locator3.t" "curveShape4.cp[2]";
connectAttr "locator2_aimConstraint1.crx" "locator2.rx";
connectAttr "locator2_aimConstraint1.cry" "locator2.ry";
connectAttr "locator2_aimConstraint1.crz" "locator2.rz";
connectAttr "locator2.pim" "locator2_aimConstraint1.cpim";
connectAttr "locator2.t" "locator2_aimConstraint1.ct";
connectAttr "locator2.rp" "locator2_aimConstraint1.crp";
connectAttr "locator2.rpt" "locator2_aimConstraint1.crt";
connectAttr "locator2.ro" "locator2_aimConstraint1.cro";
connectAttr "locator3.t" "locator2_aimConstraint1.tg[0].tt";
connectAttr "locator3.rp" "locator2_aimConstraint1.tg[0].trp";
connectAttr "locator3.rpt" "locator2_aimConstraint1.tg[0].trt";
connectAttr "locator3.pm" "locator2_aimConstraint1.tg[0].tpm";
connectAttr "locator2_aimConstraint1.w0" "locator2_aimConstraint1.tg[0].tw";
connectAttr "locator4_pointConstraint1.ctx" "locator4.tx";
connectAttr "locator4_pointConstraint1.cty" "locator4.ty";
connectAttr "locator4_pointConstraint1.ctz" "locator4.tz";
connectAttr "locator4_aimConstraint1.crx" "locator4.rx";
connectAttr "locator4_aimConstraint1.cry" "locator4.ry";
connectAttr "locator4_aimConstraint1.crz" "locator4.rz";
connectAttr "locator4.pim" "locator4_pointConstraint1.cpim";
connectAttr "locator4.rp" "locator4_pointConstraint1.crp";
connectAttr "locator4.rpt" "locator4_pointConstraint1.crt";
connectAttr "locator2.t" "locator4_pointConstraint1.tg[0].tt";
connectAttr "locator2.rp" "locator4_pointConstraint1.tg[0].trp";
connectAttr "locator2.rpt" "locator4_pointConstraint1.tg[0].trt";
connectAttr "locator2.pm" "locator4_pointConstraint1.tg[0].tpm";
connectAttr "locator4_pointConstraint1.w0" "locator4_pointConstraint1.tg[0].tw";
connectAttr "locator3.t" "locator4_pointConstraint1.tg[1].tt";
connectAttr "locator3.rp" "locator4_pointConstraint1.tg[1].trp";
connectAttr "locator3.rpt" "locator4_pointConstraint1.tg[1].trt";
connectAttr "locator3.pm" "locator4_pointConstraint1.tg[1].tpm";
connectAttr "locator4_pointConstraint1.w1" "locator4_pointConstraint1.tg[1].tw";
connectAttr "locator4.pim" "locator4_aimConstraint1.cpim";
connectAttr "locator4.t" "locator4_aimConstraint1.ct";
connectAttr "locator4.rp" "locator4_aimConstraint1.crp";
connectAttr "locator4.rpt" "locator4_aimConstraint1.crt";
connectAttr "locator4.ro" "locator4_aimConstraint1.cro";
connectAttr "locator3.t" "locator4_aimConstraint1.tg[0].tt";
connectAttr "locator3.rp" "locator4_aimConstraint1.tg[0].trp";
connectAttr "locator3.rpt" "locator4_aimConstraint1.tg[0].trt";
connectAttr "locator3.pm" "locator4_aimConstraint1.tg[0].tpm";
connectAttr "locator4_aimConstraint1.w0" "locator4_aimConstraint1.tg[0].tw";
connectAttr "|curve4|locator6|locator6_pointConstraint1.ctx" "|curve4|locator6.tx"
		;
connectAttr "|curve4|locator6|locator6_pointConstraint1.cty" "|curve4|locator6.ty"
		;
connectAttr "|curve4|locator6|locator6_pointConstraint1.ctz" "|curve4|locator6.tz"
		;
connectAttr "|curve4|locator6.pim" "|curve4|locator6|locator6_pointConstraint1.cpim"
		;
connectAttr "|curve4|locator6.rp" "|curve4|locator6|locator6_pointConstraint1.crp"
		;
connectAttr "|curve4|locator6.rpt" "|curve4|locator6|locator6_pointConstraint1.crt"
		;
connectAttr "locator5.t" "|curve4|locator6|locator6_pointConstraint1.tg[0].tt";
connectAttr "locator5.rp" "|curve4|locator6|locator6_pointConstraint1.tg[0].trp"
		;
connectAttr "locator5.rpt" "|curve4|locator6|locator6_pointConstraint1.tg[0].trt"
		;
connectAttr "locator5.pm" "|curve4|locator6|locator6_pointConstraint1.tg[0].tpm"
		;
connectAttr "|curve4|locator6|locator6_pointConstraint1.w0" "|curve4|locator6|locator6_pointConstraint1.tg[0].tw"
		;
connectAttr "pointOnCurveInfo1.p" "locator8.t";
connectAttr "pointOnCurveInfo2.p" "locator9.t";
connectAttr "nearestPointOnCurve4.p" "locator10.t";
connectAttr "unitConversion1967.o" "curve5.rx";
connectAttr "curveShape4.ws" "curveShape5.cr";
connectAttr "clamp1.opr" "unitConversion1933.i";
connectAttr "ik_heel.rx" "unitConversion1931.i";
connectAttr "multMatrix156.o" "decomposeMatrix184.imat";
connectAttr "root_poser.wm" "multMatrix156.i[0]";
connectAttr "toe_poser.wim" "multMatrix156.i[1]";
connectAttr "toe_poser_locShape.wp" "root_toeBall_distance.p2";
connectAttr "root_poser_locShape.wp" "root_toeBall_distance.p1";
connectAttr "toeTip_poser_locShape.wp" "toeBall_toeTip_distance.p2";
connectAttr "toe_poser_locShape.wp" "toeBall_toeTip_distance.p1";
connectAttr "multMatrix191.o" "decomposeMatrix232.imat";
connectAttr "root_poser.wim" "multMatrix191.i[1]";
connectAttr "multMatrix159.o" "decomposeMatrix187.imat";
connectAttr "toeTip_poser.wm" "multMatrix159.i[0]";
connectAttr "toe_poser.wim" "multMatrix159.i[1]";
connectAttr "mod.ikFk" "reverse174.ix";
connectAttr "multMatrix161.o" "decomposeMatrix191.imat";
connectAttr "fk_connector.wm" "multMatrix161.i[0]";
connectAttr "fk_heel_group_2.pim" "multMatrix161.i[1]";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "root_red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "root_green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "root_blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "root_red_rsSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "root_green_rsSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "root_blue_rsSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toe_red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toe_green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toe_blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toe_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toeTip_red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toeTip_green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toeTip_blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "toeTip_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "qqq_red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "qqq_green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "qqq_blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "root_red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "root_green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "root_blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "root_red_rsSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "root_green_rsSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "root_blue_rsSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toe_red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toe_green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toe_blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toe_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toeTip_red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toeTip_green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toeTip_blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "toeTip_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "qqq_red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "qqq_green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "qqq_blue_rsSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "composeMatrix2.omat" "multMatrix192.i[0]";
connectAttr "ik_connector.wm" "multMatrix192.i[1]";
connectAttr "ik_foot_group.pim" "multMatrix192.i[2]";
connectAttr "multMatrix192.o" "decomposeMatrix237.imat";
connectAttr "root_connector.wm" "decomposeMatrix238.imat";
connectAttr "root_connector.wm" "multMatrix193.i[0]";
connectAttr "fk_connector_init.pim" "multMatrix193.i[1]";
connectAttr "multMatrix193.o" "decomposeMatrix239.imat";
connectAttr "ik_foot.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_heel.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_toe.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "fk_toe.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_heel.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "root_poser.wm" "multMatrix195.i[0]";
connectAttr "root_poser.wim" "multMatrix195.i[1]";
connectAttr "multMatrix195.o" "decomposeMatrix240.imat";
connectAttr "multMatrix198.o" "multMatrix197.i[2]";
connectAttr "multMatrix200.o" "decomposeMatrix243.imat";
connectAttr "toe_poser.wm" "multMatrix198.i[0]";
connectAttr "root_poser.wim" "multMatrix198.i[1]";
connectAttr "multMatrix198.o" "decomposeMatrix244.imat";
connectAttr "ik_foot.wm" "multMatrix200.i[0]";
connectAttr "global_group.pim" "multMatrix200.i[1]";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "poserShapesForConnectSet.msg" "sets.dnsm" -na;
connectAttr "ikFkSwitchSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "mirror_condition.ocr" "composeMatrix2.isx";
connectAttr "edge.iog" "poserShapesForConnectSet.dsm" -na;
connectAttr "inner_edge.iog" "poserShapesForConnectSet.dsm" -na;
connectAttr "fk_toe.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_heel.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_foot.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_heel.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_toe.iog" "ikFkSwitchSet.dsm" -na;
connectAttr ":defaultRenderGlobals.msg" "mtorPartition.inmsg";
connectAttr "toe_poserOrient.wm" "middleByRoot_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "middleByRoot_multMatrix.i[1]";
connectAttr "middleByRoot_multMatrix.o" "middleByRoot_decomposeMatrix.imat";
connectAttr "hyperLayout4.msg" "hyperView4.hl";
connectAttr "hyperLayout5.msg" "hyperView5.hl";
connectAttr "hyperLayout6.msg" "hyperView6.hl";
connectAttr "hyperLayout7.msg" "hyperView7.hl";
connectAttr "posers.size" "multDoubleLinear1.i1";
connectAttr "posers.size" "multDoubleLinear2.i1";
connectAttr "posers.size" "multDoubleLinear436.i1";
connectAttr "root_poserOrient.wm" "decomposeMatrix247.imat";
connectAttr "root_poser.wm" "ik_connector_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "ik_connector_multMatrix.i[1]";
connectAttr "ik_connector_multMatrix.o" "ik_connector_decMat.imat";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "root_toeBall_distance.d" "root_toeBall_distance_scaled.i1x";
connectAttr "mainPoser_decomposeMatrix.osx" "root_toeBall_distance_scaled.i2x";
connectAttr "toeBall_toeTip_distance.d" "multiplyDivide3.i1x";
connectAttr "mainPoser_decomposeMatrix.osx" "multiplyDivide3.i2x";
connectAttr "decomposeMatrix238.osz" "multDoubleLinear1622.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear1622.i2";
connectAttr "posers_sweepShape.iog" "black_rsSG.dsm" -na;
connectAttr "black_rsSG.msg" "materialInfo1.sg";
connectAttr "green_rsMat.oc" "green_rsSG.ss";
connectAttr "green_rsSG.msg" "materialInfo2.sg";
connectAttr "green_rsMat.msg" "materialInfo2.m";
connectAttr "green_rsMat.msg" "materialInfo2.t" -na;
connectAttr "blue_rsMat.oc" "blue_rsSG.ss";
connectAttr "blue_rsSG.msg" "materialInfo3.sg";
connectAttr "blue_rsMat.msg" "materialInfo3.m";
connectAttr "blue_rsMat.msg" "materialInfo3.t" -na;
connectAttr "red_rsMat.oc" "red_rsSG.ss";
connectAttr "red_rsSG.msg" "materialInfo4.sg";
connectAttr "red_rsMat.msg" "materialInfo4.m";
connectAttr "red_rsMat.msg" "materialInfo4.t" -na;
connectAttr "cluster4GroupId.msg" "cluster4Set.gn" -na;
connectAttr "mainPoserShape.iog.og[1]" "cluster4Set.dsm" -na;
connectAttr "mainPoser_clusterHandleCluster1.msg" "cluster4Set.ub[0]";
connectAttr "cluster4GroupParts.og" "mainPoser_clusterHandleCluster1.ip[0].ig";
connectAttr "cluster4GroupId.id" "mainPoser_clusterHandleCluster1.ip[0].gi";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster1.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster1.x"
		;
connectAttr "tweak24.og[0]" "cluster4GroupParts.ig";
connectAttr "cluster4GroupId.id" "cluster4GroupParts.gi";
connectAttr "groupParts42.og" "tweak24.ip[0].ig";
connectAttr "groupId42.id" "tweak24.ip[0].gi";
connectAttr "groupId42.msg" "tweakSet24.gn" -na;
connectAttr "mainPoserShape.iog.og[2]" "tweakSet24.dsm" -na;
connectAttr "tweak24.msg" "tweakSet24.ub[0]";
connectAttr "mainPoserShapeOrig.ws" "groupParts42.ig";
connectAttr "groupId42.id" "groupParts42.gi";
connectAttr "root_red_rsSG.msg" "root_materialInfo1.sg";
connectAttr "root_green_rsSG.msg" "root_materialInfo2.sg";
connectAttr "root_blue_rsSG.msg" "root_materialInfo3.sg";
connectAttr "root_red_rsSG1.msg" "root_materialInfo4.sg";
connectAttr "root_green_rsSG1.msg" "root_materialInfo5.sg";
connectAttr "root_blue_rsSG1.msg" "root_materialInfo6.sg";
connectAttr "toe_red_rsSG.msg" "toe_materialInfo1.sg";
connectAttr "toe_green_rsSG.msg" "toe_materialInfo2.sg";
connectAttr "toe_blue_rsSG.msg" "toe_materialInfo3.sg";
connectAttr "toe_surfaceShader1SG.msg" "toe_materialInfo4.sg";
connectAttr "toeTip_red_rsSG.msg" "toeTip_materialInfo1.sg";
connectAttr "toeTip_green_rsSG.msg" "toeTip_materialInfo2.sg";
connectAttr "toeTip_blue_rsSG.msg" "toeTip_materialInfo3.sg";
connectAttr "toeTip_surfaceShader1SG.msg" "toeTip_materialInfo4.sg";
connectAttr "root_toeBall_distance_scaled.ox" "multDoubleLinear1623.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear1623.i2";
connectAttr "multiplyDivide3.ox" "multDoubleLinear1624.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear1624.i2";
connectAttr "mirror_condition.ocg" "unitConversion1952.i";
connectAttr "mirror_condition.ocg" "unitConversion1953.i";
connectAttr "qqq_red_rsSG.msg" "qqq_materialInfo1.sg";
connectAttr "qqq_green_rsSG.msg" "qqq_materialInfo2.sg";
connectAttr "qqq_blue_rsSG.msg" "qqq_materialInfo3.sg";
connectAttr "mirror_condition.ocb" "unitConversion1954.i";
connectAttr "edgeShape.ws" "nearestPointOnCurve1.ic";
connectAttr "unitConversion1956.o" "multDoubleLinear1625.i1";
connectAttr "root_poserOrient.ry" "unitConversion1956.i";
connectAttr "multDoubleLinear1625.o" "addDoubleLinear2.i1";
connectAttr "addDoubleLinear2.o" "unitConversion1957.i";
connectAttr "addDoubleLinear2.o" "multDoubleLinear1626.i1";
connectAttr "multDoubleLinear1626.o" "unitConversion1958.i";
connectAttr "floatConstant1.of" "plusMinusAverage1.i1[0]";
connectAttr "unitConversion1959.o" "plusMinusAverage1.i1[1]";
connectAttr "root_poserOrient.ry" "unitConversion1959.i";
connectAttr "switchHelper_condition.ocr" "unitConversion1960.i";
connectAttr "addDoubleLinear3.o" "switchHelper_condition.ctr";
connectAttr "mod.mirror" "switchHelper_condition.ft";
connectAttr "plusMinusAverage1.o1" "switchHelper_condition.cfr";
connectAttr "unitConversion1959.o" "addDoubleLinear3.i2";
connectAttr "multiplyDivide5.ox" "makeNurbSphere1.r";
connectAttr "multiplyDivide5.oy" "makeNurbSphere2.r";
connectAttr "multiplyDivide5.oz" "makeNurbSphere3.r";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i2x";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i2z";
connectAttr "root_poser.size" "multiplyDivide5.i1x";
connectAttr "toe_poser.size" "multiplyDivide5.i1y";
connectAttr "toeTip_poser.size" "multiplyDivide5.i1z";
connectAttr "mainPoser.size" "multDoubleLinear1627.i1";
connectAttr "mainPoser.globalSize" "multDoubleLinear1627.i2";
connectAttr "mainPoser.globalSize" "multDoubleLinear1628.i1";
connectAttr "mainPoser.lineWidth" "multDoubleLinear1628.i2";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "multiplyDivide6.ox" "sweepMeshCreator1.scaleProfileX";
connectAttr "mainPoser_decomposeMatrix.osx" "multiplyDivide6.i1x";
connectAttr "multDoubleLinear1628.o" "multiplyDivide6.i2x";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "toe_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "tweak25.og[0]" "skinCluster1.ip[0].ig";
connectAttr "pasted__masha_l_shoeShapeOrig.o" "skinCluster1.orggeom[0]";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "root_outJoint.wm" "skinCluster1.ma[0]";
connectAttr "toe_outJoint.wm" "skinCluster1.ma[1]";
connectAttr "root_outJoint.liw" "skinCluster1.lw[0]";
connectAttr "toe_outJoint.liw" "skinCluster1.lw[1]";
connectAttr "root_outJoint.obcc" "skinCluster1.ifcl[0]";
connectAttr "toe_outJoint.obcc" "skinCluster1.ifcl[1]";
connectAttr "root_outJoint.msg" "skinCluster1.ptt";
connectAttr "pasted__masha_l_shoeShapeOrig.w" "tweak25.ip[0].ig";
connectAttr "mod.msg" "bindPose1.m[0]";
connectAttr "output.msg" "bindPose1.m[1]";
connectAttr "outJoints.msg" "bindPose1.m[2]";
connectAttr "root_outJoint.msg" "bindPose1.m[3]";
connectAttr "toe_outJoint.msg" "bindPose1.m[4]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "root_outJoint.bps" "bindPose1.wm[3]";
connectAttr "toe_outJoint.bps" "bindPose1.wm[4]";
connectAttr "skinCluster1.msg" "ngSkinToolsData_skinCluster1.sc";
connectAttr "inner_edgeShape.ws" "nearestPointOnCurve2.ic";
connectAttr "distant_locShape.wp" "nearestPointOnCurve3.ip";
connectAttr "multiplyDivide7.ox" "multDoubleLinear1631.i2";
connectAttr "loftedSurfaceShape1.ws" "nurbsTessellate1.is";
connectAttr "unitConversion1931.o" "clamp1.ipr";
connectAttr "unitConversion1931.o" "clamp1.ipg";
connectAttr "multiplyDivide8.ox" "multDoubleLinear1632.i2";
connectAttr "nearestPointOnCurve3.pr" "reverse175.ix";
connectAttr "mirror_condition.ocb" "unitConversion1950.i";
connectAttr "mirror_condition.ocb" "unitConversion1951.i";
connectAttr "target.wm" "decomposeMatrix235.imat";
connectAttr "curveShape3.ws" "loft1.ic[0]";
connectAttr "curveShape1.ws" "loft1.ic[1]";
connectAttr "nearestPointOnCurve3.pr" "blendColors1.b";
connectAttr "condition228.ocr" "unitConversion1961.i";
connectAttr "unitConversion1931.o" "condition228.ft";
connectAttr "unitConversion1962.o" "condition228.st";
connectAttr "addDoubleLinear4.o" "condition228.cfg";
connectAttr "clamp1.opg" "condition228.ctr";
connectAttr "locator2.rx" "unitConversion1962.i";
connectAttr "clamp1.opg" "addDoubleLinear4.i1";
connectAttr "multDoubleLinear1633.o" "addDoubleLinear4.i2";
connectAttr "unitConversion1962.o" "multDoubleLinear1633.i1";
connectAttr "condition228.ocg" "unitConversion1963.i";
connectAttr "clamp1.opg" "remapValue1.i";
connectAttr "unitConversion1962.o" "remapValue1.imx";
connectAttr "multDoubleLinear1634.o" "remapValue1.omx";
connectAttr "curveShape4.ws" "pointOnCurveInfo1.ic";
connectAttr "locator5.ty" "multDoubleLinear1634.i1";
connectAttr "clamp1.opg" "remapValue2.i";
connectAttr "multDoubleLinear1635.o" "remapValue2.imx";
connectAttr "multDoubleLinear1634.o" "remapValue2.omx";
connectAttr "unitConversion1962.o" "remapValue2.imn";
connectAttr "unitConversion1962.o" "multDoubleLinear1635.i1";
connectAttr "remapValue1.ov" "addDoubleLinear5.i1";
connectAttr "remapValue2.ov" "addDoubleLinear5.i2";
connectAttr "clamp1.opg" "setRange1.vx";
connectAttr "multDoubleLinear1635.o" "setRange1.omx";
connectAttr "curveShape4.ws" "pointOnCurveInfo2.ic";
connectAttr "setRange1.ox" "pointOnCurveInfo2.pr";
connectAttr "locator9.wm" "multMatrix201.i[0]";
connectAttr "locator2.wim" "multMatrix201.i[1]";
connectAttr "multMatrix201.o" "decomposeMatrix250.imat";
connectAttr "decomposeMatrix250.oty" "multDoubleLinear1636.i1";
connectAttr "curveShape5.ws" "nearestPointOnCurve4.ic";
connectAttr "unitConversion1965.o" "addDoubleLinear6.i1";
connectAttr "unitConversion1966.o" "addDoubleLinear6.i2";
connectAttr "group1.rx" "unitConversion1965.i";
connectAttr "group2.rx" "unitConversion1966.i";
connectAttr "clamp2.opr" "unitConversion1967.i";
connectAttr "addDoubleLinear6.o" "clamp2.ipr";
connectAttr "multDoubleLinear1635.o" "clamp2.mxr";
connectAttr "multDoubleLinear1631.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "nearestPointOnCurve3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "condition227.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "multiplyDivide7.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "distant_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "footPivot.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "unitConversion1933.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "footTwistFront_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "clamp1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "unitConversion1931.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "ik_heel.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "heel_rotate_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "unitConversion1951.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "ik_heel_ikh.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn";
connectAttr "ik_toe_controlJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "init_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn";
connectAttr "decomposeMatrix235.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn";
connectAttr "ik_heel_controlJoint_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "toeTip_controlJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "ik_toe_controlJoint_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "unitConversion1950.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "ik_heel_controlJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "ik_heel_controlJoint_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn";
connectAttr "ik_toe_upv.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn";
connectAttr "ik_toe_ikh.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn";
connectAttr "ik_heel_ikh_poleVectorConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "ik_toeShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn";
connectAttr "ik_toe_upvShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "curveShape1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn";
connectAttr "curve3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn";
connectAttr "ik_toe_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn";
connectAttr "curve1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn";
connectAttr "ik_toe_eff.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn";
connectAttr "loft1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn";
connectAttr "ik_heel_upv.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn";
connectAttr "ik_toe_ikh_poleVectorConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn"
		;
connectAttr "curveShape3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn";
connectAttr "ik_toe.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn";
connectAttr "ik_heel_upvShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "ik_heel_eff.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn";
connectAttr "nearestPointOnCurve3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "distant_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "ik_heel_rotateX.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "heel_rotate_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "clamp1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "unitConversion1933.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "footTwistFront_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "ik_heel.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "unitConversion1931.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "blendColors1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn";
connectAttr "locator9.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "pointOnCurveInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "remapValue2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn";
connectAttr "addDoubleLinear5.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "multDoubleLinear1634.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "setRange1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn";
connectAttr "multDoubleLinear1635.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn"
		;
connectAttr "heel_rotate_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn"
		;
connectAttr "remapValue1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn";
connectAttr "unitConversion1933.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn"
		;
connectAttr "ik_heel_rotateX.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "clamp1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn";
connectAttr "unitConversion1961.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn"
		;
connectAttr "group2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[13].dn";
connectAttr "multDoubleLinear1633.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[14].dn"
		;
connectAttr "locator5.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[15].dn";
connectAttr "locator7.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[16].dn";
connectAttr "addDoubleLinear4.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[17].dn"
		;
connectAttr "group1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[18].dn";
connectAttr "locator2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[19].dn";
connectAttr "unitConversion1962.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[20].dn"
		;
connectAttr "ik_heel.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[21].dn";
connectAttr "unitConversion1931.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[22].dn"
		;
connectAttr "condition228.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[23].dn";
connectAttr "unitConversion1963.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[24].dn"
		;
connectAttr "locator10.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn";
connectAttr "decomposeMatrix250.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn"
		;
connectAttr "nearestPointOnCurve4.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn"
		;
connectAttr "curveShape1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn";
connectAttr "locator2.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[4].dn";
connectAttr "pointOnCurveInfo2.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[5].dn"
		;
connectAttr "locator9.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[6].dn";
connectAttr "multDoubleLinear1636.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[7].dn"
		;
connectAttr "multMatrix201.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[8].dn";
connectAttr "group1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[9].dn";
connectAttr "locatorShape9.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[10].dn";
connectAttr "locator7.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[11].dn";
connectAttr "locatorShape4.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[12].dn";
connectAttr "locator4.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[13].dn";
connectAttr "locatorShape7.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[14].dn";
connectAttr "locator8.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[15].dn";
connectAttr "pointOnCurveInfo1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[16].dn"
		;
connectAttr "curveShape4.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[17].dn";
connectAttr "curve5.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[0].dn";
connectAttr "unitConversion1967.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[1].dn"
		;
connectAttr "group1.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[2].dn";
connectAttr "unitConversion1965.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[3].dn"
		;
connectAttr "unitConversion1966.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[4].dn"
		;
connectAttr "addDoubleLinear6.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[5].dn"
		;
connectAttr "group2.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[6].dn";
connectAttr "multDoubleLinear1635.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[7].dn"
		;
connectAttr "clamp2.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[8].dn";
connectAttr "curveShape5.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[9].dn";
connectAttr "nearestPointOnCurve4.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[10].dn"
		;
connectAttr "locator10.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[11].dn";
connectAttr "locatorShape10.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[12].dn";
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "root_red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "root_green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "root_blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "root_red_rsSG1.pa" ":renderPartition.st" -na;
connectAttr "root_green_rsSG1.pa" ":renderPartition.st" -na;
connectAttr "root_blue_rsSG1.pa" ":renderPartition.st" -na;
connectAttr "toe_red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "toe_green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "toe_blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "toe_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "toeTip_red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "toeTip_green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "toeTip_blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "toeTip_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "qqq_red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "qqq_green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "qqq_blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "green_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "blue_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "red_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "decomposeMatrix184.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix187.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix191.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse174.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix232.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_toeBall_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "toeBall_toeTip_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix235.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix237.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix238.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix239.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix240.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix243.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix244.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "middleByRoot_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "multDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear436.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix247.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ik_connector_decMat.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mainPoser_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_toeBall_distance_scaled.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1622.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1623.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1624.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1625.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1626.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "floatConstant1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "switchHelper_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1627.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1628.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1631.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "floatMath1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition227.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1632.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse175.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition228.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1633.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1634.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1635.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix201.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1636.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pasted__masha_l_shoeShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "loftedSurfaceShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "nurbsToPolyShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
connectAttr "ikRPsolver20.msg" ":ikSystem.sol" -na;
// End of foot2_movingPivot.ma
