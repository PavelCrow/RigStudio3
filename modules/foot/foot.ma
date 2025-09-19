//Maya ASCII 2022 scene
//Name: foot.ma
//Last modified: Wed, Aug 27, 2025 04:48:47 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "floatConstant" "lookdevKit" "1.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202106180615-26a94e7f8c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "58BDD514-4947-2561-96A5-A483A97F836F";
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
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.1;
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
		0.52565018031509136 -1.5780937895153573 -0.55114719234663601
		-0.046284369813607798 -1.5780937895153573 -1.0085886302647564
		-0.74231470044623293 -1.5780937895153573 -0.54538284558066175
		-1.2794852220520441 -1.5780937895153566 1.6088550391354299
		-1.0513314297175516 -1.5780937895153573 4.0793666283691916
		-0.10833226006556999 -1.5780937895153573 4.572065074105506
		0.83466690958640877 -1.5780937895153573 4.0792118620278686
		0.97437503749368148 -1.5780937895153566 1.6091468736561034
		0.52565018031509136 -1.5780937895153573 -0.55114719234663601
		-0.046284369813607798 -1.5780937895153573 -1.0085886302647564
		-0.74231470044623293 -1.5780937895153573 -0.54538284558066175
		;
createNode transform -n "footTwistFront_group" -p "mirror_group";
	rename -uid "5A84512C-4460-C2B8-0D2E-28833D0F574E";
createNode transform -n "heelTwist_group" -p "footTwistFront_group";
	rename -uid "E43CB031-46FE-0AE3-0AEF-C99DF91448A7";
	setAttr ".t" -type "double3" 0 -4.9960036108132044e-16 7.2164496600635165e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr ".hdl" -type "double3" -0.036222707184227224 0.00013758212054609809 -0.3064536180022952 ;
createNode transform -n "toeBall_group" -p "heelTwist_group";
	rename -uid "4A82C6A3-4460-B9B6-AD72-0BA15469EE98";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "init_group" -p "toeBall_group";
	rename -uid "4AF43D49-44A7-F096-747B-8EB23AA8DEE9";
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode joint -n "ik_heel_controlJoint" -p "init_group";
	rename -uid "1C9897B3-491F-5C71-F38D-5380EE3239EB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 180 -52.524905441792917 1.1091259233818774e-15 ;
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
	setAttr ".r" -type "double3" -1.2567888401590235e-14 37.475095738617519 8.4348094308194991e-15 ;
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
createNode transform -n "ik_toe_group" -p "heelTwist_group";
	rename -uid "600D34F3-44F8-32EC-4A41-06A1E9C2873A";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
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
		0.796382252931638 -1.5780937895153566 -1.2500151190563988
		-0.10933096873894615 -1.5780937895153566 -1.719030064264353
		-1.0150441904095362 -1.5780937895153566 -1.2500059320206776
		-1.7639211190520907 -1.5780937895153566 1.468962946210054
		-1.3636294903601915 -1.5780937895153566 4.2729964931102735
		-0.1093309687389469 -1.5780937895153566 4.9873686498678502
		1.1449675528822949 -1.5780937895153566 4.2736536807074224
		1.545259181574195 -1.5780937895153566 1.4700573746511962
		0.796382252931638 -1.5780937895153566 -1.2500151190563988
		-0.10933096873894615 -1.5780937895153566 -1.719030064264353
		-1.0150441904095362 -1.5780937895153566 -1.2500059320206776
		;
createNode transform -n "ik_heel_group" -p "ik_foot";
	rename -uid "DF92266B-4133-587F-46FB-B5B7B23EC918";
createNode transform -n "footPivotAim_grp" -p "ik_heel_group";
	rename -uid "78E5F853-4BDB-37EC-AEC7-5CB930419241";
	setAttr ".v" no;
createNode transform -n "footPivot_aim" -p "footPivotAim_grp";
	rename -uid "711DF727-4B9E-4BC0-35AB-8E922CA71E33";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 1000 0 ;
	setAttr -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "footPivot_aimShape" -p "footPivot_aim";
	rename -uid "323AE39F-406D-7878-E711-FE9CCCC22CDF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode transform -n "ik_heel_scaleControl" -p "ik_heel_group";
	rename -uid "A482E93E-4311-A96F-7155-8BA851C909AC";
createNode transform -n "ik_heel" -p "ik_heel_scaleControl";
	rename -uid "CA625AA1-420B-6C4C-38CE-7CA24CBFDE92";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "heelOffset" -ln "heelOffset" -at "double";
	setAttr -l on -k off ".v";
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
	setAttr -k on ".weight";
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
	setAttr ".bps" -type "matrix" 0.19192917279976512 -0.50472440063213586 1.1920631269248778 0
		 1.2920233373191357 -3.6151876243676879e-08 -0.20802336974895363 0 0.080230386949765295 1.2074151340551924 0.49830693914831337 0
		 0.20074408973992527 0.26158377724435167 -0.090761817132273687 1;
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
	setAttr ".bps" -type "matrix" 0.20537489785234617 -0.2081632978423392 1.2755732904472907 0
		 1.292023327003379 1.0971559631429535e-07 -0.20802343381959659 0 0.033089278478783651 1.292000800297886 0.20551656434059987 0
		 0.26254864987270421 0.099053667233958337 0.29310341885746422 1;
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
	addAttr -ci true -k true -sn "w0" -ln "toe_ikJoint_outW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "toeFk_fkJointW1" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -179.99999999999991 -37.475095738617519 3.5595216994015146e-30 ;
	setAttr ".o" -type "double3" 180 0 0 ;
	setAttr ".rsrr" -type "double3" -92.406494829251201 14.836580059022289 46.087300233423456 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
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
	setAttr ".lr" -type "double3" 2.5444437451708134e-14 -127.47509455820709 90 ;
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
	setAttr ".t" -type "double3" 3.7713924227292512 2.8532315381213218 3.0495412026768367 ;
	setAttr ".r" -type "double3" -29.400000000025777 60.40000000000024 -3.2195637752455707e-15 ;
	setAttr ".rp" -type "double3" 7.7715611723760958e-16 9.3924867883288243e-14 3.0198066269804258e-14 ;
	setAttr ".rpt" -type "double3" -1.0992890654171976e-16 4.8430186591755061e-15 -3.063514319172062e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "71CACD7C-4D6F-A019-F750-73914A7C0D25";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 5.2715968427397222;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 0.93979032337665558 -0.073104143142700195 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9868B001-47C3-0EBB-B0EE-8B96FEC4A30B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.10196674111849664 1.3945499381758222 -0.11478795457707776 ;
	setAttr ".r" -type "double3" -90 90 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "BDCCCF88-4D68-C8B7-68B5-5EAAAADC5E82";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.4797219437973967;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F750A30C-41C7-909C-24CF-97A9A787658F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.07715873918097152 0.0092476467047626632 1.767494877621022 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "47D25636-428B-BB2B-E1D5-A9866B5FD60A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 0.6563715625262827;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "AE19EFD1-4DF0-F1BC-CE2E-FE81C358D108";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 7.7966694863516519 0.71203748042068993 0.066172971358431809 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "A13D6213-4298-109B-2D3E-878C845B1910";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 7.7218887239398528;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode decomposeMatrix -n "decomposeMatrix235";
	rename -uid "F7AF8990-447D-3702-571A-5D89B7334C8D";
createNode unitConversion -n "unitConversion1933";
	rename -uid "2897AB0B-4377-7608-F6B5-3582F35B054E";
	setAttr ".cf" 0.017453292519943295;
createNode condition -n "condition222";
	rename -uid "461F7CD4-421F-FF4A-D30F-9FA083C98FA9";
	setAttr ".op" 3;
createNode unitConversion -n "unitConversion1931";
	rename -uid "B9E0D179-4136-FA51-ACA8-948B3DC56D5F";
	setAttr ".cf" 57.295779513082323;
createNode blendTwoAttr -n "blendTwoAttr634";
	rename -uid "FE512CAC-48AF-E4F3-2A54-16B1CE9DCE2D";
createNode blendTwoAttr -n "blendTwoAttr635";
	rename -uid "78A0128F-4EEC-1CB8-ABDD-FDB70A1267D6";
createNode unitConversion -n "unitConversion1935";
	rename -uid "C4F1F0BF-42DF-37DF-CA43-78A35B488668";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion1938";
	rename -uid "03EA10AA-47AE-C03C-C6BA-3E92404B09EB";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion1940";
	rename -uid "74917754-4450-C9D6-CD3A-AC9876A7458D";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear1616";
	rename -uid "7A3D0E11-4208-92AC-9AB2-6A8AEA017E06";
createNode blendTwoAttr -n "blendTwoAttr637";
	rename -uid "0505DF27-45CE-E071-01FC-BCA79E9A7183";
createNode reverse -n "reverse173";
	rename -uid "8BDB214B-4ADE-746A-BFB5-39B1EC5632A8";
createNode remapValue -n "remapValue17";
	rename -uid "801A2E49-4AC9-9BC9-0D62-2E801E9F4BA0";
	setAttr ".imn" -25;
	setAttr ".imx" 0;
	setAttr ".omn" 1;
	setAttr ".omx" 0;
	setAttr -s 2 ".vl[0:1]"  0 0 2 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode unitConversion -n "unitConversion1936";
	rename -uid "BA687541-4973-79C7-D09E-6B801E7D2EA6";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear1617";
	rename -uid "651855A0-4489-6E1B-2D61-B59A20A9D21F";
createNode blendTwoAttr -n "blendTwoAttr638";
	rename -uid "C0276EFC-46E7-DDE5-F1E9-1487CCC26BE1";
	setAttr -s 2 ".i";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1939";
	rename -uid "7CC80989-4170-6264-0995-7AAA838E628F";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear1615";
	rename -uid "2BE80671-4F0B-AA93-5F0C-66A4F4134CA4";
createNode blendTwoAttr -n "blendTwoAttr633";
	rename -uid "94279185-4062-1B75-1D47-C1B2D6EA1566";
createNode condition -n "condition223";
	rename -uid "4F401BB1-4BD0-387D-AF67-4F89FBF13628";
	setAttr ".op" 3;
	setAttr ".cf" -type "float3" 0 0 0 ;
createNode blendTwoAttr -n "blendTwoAttr636";
	rename -uid "0B80A419-4668-1DED-3955-34AE30D02655";
createNode unitConversion -n "unitConversion1937";
	rename -uid "7DB53D8B-48D2-1390-5A61-D0AA84C0127A";
	setAttr ".cf" 0.017453292519943295;
createNode multDoubleLinear -n "multDoubleLinear1618";
	rename -uid "420A138A-45C4-7208-7144-B9A2ECF17BFD";
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
	rename -uid "03400FA0-4069-318A-9FC4-EC906919DA76";
	setAttr -s 23 ".lnk";
	setAttr -s 23 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "95443A14-43A8-C8CA-8539-1593A8C81A43";
createNode displayLayer -n "defaultLayer";
	rename -uid "19CE01F8-4DF6-369B-03C9-E4ACC39F3E53";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "77AE2265-4FF6-624E-2D30-FF8AD4658275";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "281C2244-47AF-B8DB-A19E-3DB775F64F4B";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "D5CCF0FB-40BC-E332-A00F-168691F83CE9";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 50 -ast -10 -aet 140 ";
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
createNode decomposeMatrix -n "decomposeMatrix245";
	rename -uid "61A431F6-47A5-F669-69CD-91A46494EBD9";
createNode multMatrix -n "multMatrix199";
	rename -uid "8F59C6A1-4943-480C-A742-83BBE101D6B5";
	setAttr -s 2 ".i";
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
createNode unitConversion -n "unitConversion1932";
	rename -uid "DD742FFF-49E3-72AA-8E0A-29B5D112A3D9";
	setAttr ".cf" 0.017453292519943295;
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
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "474884CD-4A88-F0F6-F677-EF8665CA814F";
	setAttr ".ihi" 2;
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
createNode unitConversion -n "unitConversion1950";
	rename -uid "8CDDB0CD-4B4A-99C5-A80E-AC9597D0F23E";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1951";
	rename -uid "4B95C784-40F0-20A8-FE29-F592B11C7964";
	setAttr ".cf" 0.017453292519943295;
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
	rename -uid "1BBAFFCF-4B59-62D1-0266-909D62906A75";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "8F56EB69-4059-A140-0965-CE8A2A02BC2E";
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
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "FE0B18F3-4F15-7131-4367-87B554DE6ABB";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -5205.9525998338841 -2008.9286069075258 ;
	setAttr ".tgi[0].vh" -type "double2" 8508.3334209900131 1705.3571903989457 ;
	setAttr -s 13 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 362.85714721679688;
	setAttr ".tgi[0].ni[0].y" 62.857143402099609;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 1354.2857666015625;
	setAttr ".tgi[0].ni[1].y" -514.28570556640625;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 362.85714721679688;
	setAttr ".tgi[0].ni[2].y" 164.28572082519531;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 362.85714721679688;
	setAttr ".tgi[0].ni[3].y" -38.571430206298828;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 670;
	setAttr ".tgi[0].ni[4].y" -107.14286041259766;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 1301.543701171875;
	setAttr ".tgi[0].ni[5].y" -7.5206913948059082;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" 1295.7142333984375;
	setAttr ".tgi[0].ni[6].y" 98.571426391601562;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 1602.857177734375;
	setAttr ".tgi[0].ni[7].y" 128.57142639160156;
	setAttr ".tgi[0].ni[7].nvs" 18305;
	setAttr ".tgi[0].ni[8].x" 670;
	setAttr ".tgi[0].ni[8].y" -5.7142858505249023;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" 670;
	setAttr ".tgi[0].ni[9].y" 95.714286804199219;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" 988.5714111328125;
	setAttr ".tgi[0].ni[10].y" 34.285713195800781;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 988.5714111328125;
	setAttr ".tgi[0].ni[11].y" -67.142860412597656;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" 1627.8299560546875;
	setAttr ".tgi[0].ni[12].y" -187.4549560546875;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -4460.1192961372708 -2811.9047654762967 ;
	setAttr ".tgi[1].vh" -type "double2" 9254.1667246866255 902.38103183017506 ;
	setAttr -s 7 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 2314.28564453125;
	setAttr ".tgi[1].ni[0].y" -795.71429443359375;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 2262.857177734375;
	setAttr ".tgi[1].ni[1].y" -462.85714721679688;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 2262.857177734375;
	setAttr ".tgi[1].ni[2].y" -564.28570556640625;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 2314.28564453125;
	setAttr ".tgi[1].ni[3].y" -925.71429443359375;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 2262.016845703125;
	setAttr ".tgi[1].ni[4].y" -666.55462646484375;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 2262.857177734375;
	setAttr ".tgi[1].ni[5].y" -361.42855834960938;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 1955.7142333984375;
	setAttr ".tgi[1].ni[6].y" -348.57144165039062;
	setAttr ".tgi[1].ni[6].nvs" 18305;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -2797.4357862757865 -1077.3809095696815 ;
	setAttr ".tgi[2].vh" -type "double2" 635.53111027739828 -147.61904175319395 ;
	setAttr -s 13 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 74.285713195800781;
	setAttr ".tgi[2].ni[0].y" -528.5714111328125;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" -257.14285278320312;
	setAttr ".tgi[2].ni[1].y" -595.71429443359375;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" -257.14285278320312;
	setAttr ".tgi[2].ni[2].y" -798.5714111328125;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" 74.285713195800781;
	setAttr ".tgi[2].ni[3].y" -427.14285278320312;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" -871.4285888671875;
	setAttr ".tgi[2].ni[4].y" -564.28570556640625;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" 74.285713195800781;
	setAttr ".tgi[2].ni[5].y" -687.14288330078125;
	setAttr ".tgi[2].ni[5].nvs" 18304;
	setAttr ".tgi[2].ni[6].x" -257.14285278320312;
	setAttr ".tgi[2].ni[6].y" -697.14288330078125;
	setAttr ".tgi[2].ni[6].nvs" 18304;
	setAttr ".tgi[2].ni[7].x" -564.28570556640625;
	setAttr ".tgi[2].ni[7].y" -635.71429443359375;
	setAttr ".tgi[2].ni[7].nvs" 18304;
	setAttr ".tgi[2].ni[8].x" -1178.5714111328125;
	setAttr ".tgi[2].ni[8].y" -585.71429443359375;
	setAttr ".tgi[2].ni[8].nvs" 18304;
	setAttr ".tgi[2].ni[9].x" 418.57144165039062;
	setAttr ".tgi[2].ni[9].y" -491.42855834960938;
	setAttr ".tgi[2].ni[9].nvs" 18304;
	setAttr ".tgi[2].ni[10].x" -564.28570556640625;
	setAttr ".tgi[2].ni[10].y" -534.28570556640625;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" -1178.5714111328125;
	setAttr ".tgi[2].ni[11].y" -484.28570556640625;
	setAttr ".tgi[2].ni[11].nvs" 18304;
	setAttr ".tgi[2].ni[12].x" 418.57144165039062;
	setAttr ".tgi[2].ni[12].y" -928.5714111328125;
	setAttr ".tgi[2].ni[12].nvs" 18304;
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
	setAttr -s 55 ".u";
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
connectAttr "unitConversion1940.o" "footTwistFront_group.ry";
connectAttr "decomposeMatrix244.ot" "footTwistFront_group.t";
connectAttr "unitConversion1933.o" "heelTwist_group.rx";
connectAttr "unitConversion1939.o" "heelTwist_group.ry";
connectAttr "unitConversion1936.o" "heelTwist_group.rz";
connectAttr "decomposeMatrix245.ot" "heelTwist_group.rp";
connectAttr "unitConversion1932.o" "toeBall_group.rx";
connectAttr "unitConversion1937.o" "toeBall_group.rz";
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
connectAttr "unitConversion1933.o" "footPivotAim_grp.rx";
connectAttr "ik_heel.rz" "footPivotAim_grp.rz";
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
connectAttr "mod.ikFk" "toe_finalJoint_orientConstraint1.w0";
connectAttr "reverse174.ox" "toe_finalJoint_orientConstraint1.w1";
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
connectAttr "target.wm" "decomposeMatrix235.imat";
connectAttr "condition222.ocr" "unitConversion1933.i";
connectAttr "unitConversion1931.o" "condition222.ft";
connectAttr "blendTwoAttr634.o" "condition222.ctr";
connectAttr "blendTwoAttr635.o" "condition222.ctb";
connectAttr "unitConversion1938.o" "condition222.cfg";
connectAttr "unitConversion1935.o" "condition222.cfb";
connectAttr "unitConversion1931.o" "condition222.cfr";
connectAttr "ik_heel.rx" "unitConversion1931.i";
connectAttr "unitConversion1931.o" "blendTwoAttr634.i[0]";
connectAttr "ik_heel.weight" "blendTwoAttr634.ab";
connectAttr "unitConversion1935.o" "blendTwoAttr635.i[0]";
connectAttr "ik_heel.weight" "blendTwoAttr635.ab";
connectAttr "ik_heel.rz" "unitConversion1935.i";
connectAttr "ik_heel.ry" "unitConversion1938.i";
connectAttr "multDoubleLinear1616.o" "unitConversion1940.i";
connectAttr "blendTwoAttr637.o" "multDoubleLinear1616.i1";
connectAttr "reverse173.ox" "multDoubleLinear1616.i2";
connectAttr "unitConversion1938.o" "blendTwoAttr637.i[1]";
connectAttr "ik_heel.weight" "blendTwoAttr637.ab";
connectAttr "remapValue17.ov" "reverse173.ix";
connectAttr "unitConversion1931.o" "remapValue17.i";
connectAttr "multDoubleLinear1617.o" "unitConversion1936.i";
connectAttr "condition222.ocb" "multDoubleLinear1617.i1";
connectAttr "blendTwoAttr638.o" "multDoubleLinear1617.i2";
connectAttr "remapValue17.omn" "blendTwoAttr638.i[0]";
connectAttr "remapValue17.ov" "blendTwoAttr638.i[1]";
connectAttr "ik_heel.weight" "blendTwoAttr638.ab";
connectAttr "multDoubleLinear1615.o" "unitConversion1939.i";
connectAttr "condition222.ocg" "multDoubleLinear1615.i1";
connectAttr "remapValue17.ov" "multDoubleLinear1615.i2";
connectAttr "condition223.ocr" "blendTwoAttr633.i[1]";
connectAttr "ik_heel.weight" "blendTwoAttr633.ab";
connectAttr "unitConversion1931.o" "condition223.ft";
connectAttr "unitConversion1931.o" "condition223.ctr";
connectAttr "blendTwoAttr636.o" "condition223.ctb";
connectAttr "unitConversion1935.o" "blendTwoAttr636.i[1]";
connectAttr "ik_heel.weight" "blendTwoAttr636.ab";
connectAttr "multDoubleLinear1618.o" "unitConversion1937.i";
connectAttr "blendTwoAttr636.o" "multDoubleLinear1618.i1";
connectAttr "reverse173.ox" "multDoubleLinear1618.i2";
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
connectAttr "multMatrix199.o" "decomposeMatrix245.imat";
connectAttr "footPivot.wm" "multMatrix199.i[0]";
connectAttr "heelTwist_group.pim" "multMatrix199.i[1]";
connectAttr "ik_foot.wm" "multMatrix200.i[0]";
connectAttr "global_group.pim" "multMatrix200.i[1]";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "poserShapesForConnectSet.msg" "sets.dnsm" -na;
connectAttr "ikFkSwitchSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "mirror_condition.ocr" "composeMatrix2.isx";
connectAttr "edge.iog" "poserShapesForConnectSet.dsm" -na;
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
connectAttr "addDoubleLinear1.o" "unitConversion1932.i";
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
connectAttr "ik_heel.heelOffset" "addDoubleLinear1.i1";
connectAttr "blendTwoAttr633.o" "addDoubleLinear1.i2";
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
connectAttr "mirror_condition.ocb" "unitConversion1950.i";
connectAttr "mirror_condition.ocb" "unitConversion1951.i";
connectAttr "mirror_condition.ocg" "unitConversion1952.i";
connectAttr "mirror_condition.ocg" "unitConversion1953.i";
connectAttr "qqq_red_rsSG.msg" "qqq_materialInfo1.sg";
connectAttr "qqq_green_rsSG.msg" "qqq_materialInfo2.sg";
connectAttr "qqq_blue_rsSG.msg" "qqq_materialInfo3.sg";
connectAttr "mirror_condition.ocb" "unitConversion1954.i";
connectAttr "edgeShape.ws" "nearestPointOnCurve1.ic";
connectAttr "footPivot_aimShape.wp" "nearestPointOnCurve1.ip";
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
connectAttr "toe_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "ik_toe_upvShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "toeTip_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "multDoubleLinear1624.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "toe_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "toeTip_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "mainPoser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "toeBall_toeTip_distance.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "multiplyDivide3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "ik_toe_upv.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn";
connectAttr "mainPoserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "toe_poserOrient_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "root_poserOrient_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "mainPoserShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "mainPoser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "toeTip_poserOrient_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "cluster4Set.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "mainPoser_clusterHandleShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "cluster4GroupParts.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "tweakSet24.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn";
connectAttr "groupParts42.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn";
connectAttr "mainPoser_clusterHandleCluster1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "mainPoser_clusterHandle.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn"
		;
connectAttr "cluster4GroupId.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn";
connectAttr "mainPoserShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "mainPoserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn";
connectAttr "tweak24.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn";
connectAttr "groupId42.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn";
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn";
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
connectAttr "condition222.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr633.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr634.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix187.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr635.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition223.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr636.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr637.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1615.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse173.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1616.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1617.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1618.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendTwoAttr638.msg" ":defaultRenderUtilityList1.u" -na;
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
connectAttr "decomposeMatrix245.msg" ":defaultRenderUtilityList1.u" -na;
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
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
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
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
connectAttr "ikRPsolver20.msg" ":ikSystem.sol" -na;
// End of foot.ma
