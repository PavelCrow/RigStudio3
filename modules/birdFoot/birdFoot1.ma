//Maya ASCII 2022 scene
//Name: birdFoot1.ma
//Last modified: Fri, Sep 25, 2026 11:16:15 AM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26200)";
fileInfo "UUID" "F40ED5AC-482A-EEA7-E6A8-6EA2579BC7C6";
createNode transform -n "mod";
	rename -uid "004B43DA-47F7-458F-3E16-DB8E5B0E6C0C";
	addAttr -ci true -sn "ikFk" -ln "ikFk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -k on ".ikFk" 1;
createNode transform -n "posers" -p "mod";
	rename -uid "9A5C909A-43D5-5D22-9287-7A97ECC3E2C8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr ".v" no;
createNode transform -n "mainPoser" -p "posers";
	rename -uid "F1CE2962-4BEA-0A02-9C99-B2A4341D1474";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 3.93;
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.079999999999999905;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "75D8738C-4247-A6E0-A6AF-469DE6343ACC";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "6CFC7BAF-4738-624A-6A93-82A51E877721";
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
	setAttr ".ove" yes;
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
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "E7C4A81D-4AD2-6D5F-F2C0-BE9322AC6D37";
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
	rename -uid "553296F3-4596-6694-F680-168FBE52CEC5";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "9FA8DEC2-4E2A-610D-27A3-4CB89EF1D516";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
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
createNode aimConstraint -n "root_poserOrient_aimConstraint1" -p "root_poserOrient";
	rename -uid "22332959-47FB-65AD-FAB4-B7A6C60F6829";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_0_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 87.18607015747763 -48.907792182163107 -87.878537217236868 ;
	setAttr -k on ".w0";
createNode transform -n "ik_foot_initLoc" -p "root_poser";
	rename -uid "303601D7-40F7-B8F3-D0A7-98BB11BDB955";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "ik_foot_initLoc_locShape" -p "ik_foot_initLoc";
	rename -uid "12B2CA7B-4316-0D2C-1251-AFA47EF16E15";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "roll_initLocs" -p "ik_foot_initLoc";
	rename -uid "6A59E66C-48BA-0B36-1DF5-DFB44A3715AA";
	setAttr ".v" no;
createNode transform -n "roll_back_1_initLoc" -p "roll_initLocs";
	rename -uid "28986410-42F3-F77A-AFB0-138E81F983C9";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "roll_back_1_initLocShape" -p "roll_back_1_initLoc";
	rename -uid "C72D69B1-4338-C1FD-6AFA-3CB8B4C999E3";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_back_1_initLoc_pointConstraint1" -p "roll_back_1_initLoc";
	rename -uid "D860D22F-49DB-22F8-DC69-70990300A6F6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.65926591241297061 -2.3884195843040099 ;
	setAttr -k on ".w0";
createNode transform -n "roll_front_1_initLoc" -p "roll_initLocs";
	rename -uid "0474FF5E-459F-C209-AE94-0C960D01BD79";
createNode locator -n "roll_front_1_initLocShape" -p "roll_front_1_initLoc";
	rename -uid "4B3BEEC5-4217-01FE-FA08-BEAE5738DB15";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_front_1_initLoc_pointConstraint1" -p "roll_front_1_initLoc";
	rename -uid "F6F999AE-4142-C5F5-51A5-CB8070A5ED9D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.74957085645767685 4.1161047618220614 ;
	setAttr -k on ".w0";
createNode transform -n "roll_back_2_initLoc" -p "roll_initLocs";
	rename -uid "800BCC87-4F6C-1204-9D73-1C91FF4FE38F";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "roll_back_2_initLocShape" -p "roll_back_2_initLoc";
	rename -uid "D5B7B04D-4F33-F63D-37F6-F59F6DB4A719";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_back_2_initLoc_pointConstraint1" -p "roll_back_2_initLoc";
	rename -uid "C29E5E2B-4208-D5B2-885C-918DDCED2895";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_3_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.51235556151340522 -1.6905954175310756 ;
	setAttr -k on ".w0";
createNode transform -n "roll_front_2_initLoc" -p "roll_initLocs";
	rename -uid "FFB003C4-4383-C5ED-E6A9-6DB0A665A863";
createNode locator -n "roll_front_2_initLocShape" -p "roll_front_2_initLoc";
	rename -uid "EC543456-4D97-D5E9-1A04-D699DEF22CA3";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_front_2_initLoc_pointConstraint1" -p "roll_front_2_initLoc";
	rename -uid "B4476986-4435-32B6-4371-65A5C0C6FE1D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_3_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.55291232340025154 3.0720267317717296 ;
	setAttr -k on ".w0";
createNode transform -n "roll_back_3_initLoc" -p "roll_initLocs";
	rename -uid "B7E56830-453F-9A15-DD09-70B3E9B85E59";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "roll_back_3_initLocShape" -p "roll_back_3_initLoc";
	rename -uid "48F9AAC4-4780-3FAE-F822-64A562DCBD5C";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_back_3_initLoc_pointConstraint1" -p "roll_back_3_initLoc";
	rename -uid "78FE6FD1-436B-A822-AD98-78B5F1B21756";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_2_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.49766452642344894 -1.0735719437529023 ;
	setAttr -k on ".w0";
createNode transform -n "roll_front_3_initLoc" -p "roll_initLocs";
	rename -uid "98612E86-48AB-694E-D84C-0990185A9501";
createNode locator -n "roll_front_3_initLocShape" -p "roll_front_3_initLoc";
	rename -uid "B00306BF-4852-3D0C-D602-5988A08DBE93";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_front_3_initLoc_pointConstraint1" -p "roll_front_3_initLoc";
	rename -uid "2CB64D07-447F-7258-8DA5-C49D38AA489D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_2_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.44921964233360878 2.0207974823374921 ;
	setAttr -k on ".w0";
createNode transform -n "roll_back_4_initLoc" -p "roll_initLocs";
	rename -uid "1417CE61-48EC-715A-66E5-4F867C8E2B18";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "roll_back_4_initLocShape" -p "roll_back_4_initLoc";
	rename -uid "8EBB1B34-4517-1217-D0E9-D786C1EEE7F9";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_back_4_initLoc_pointConstraint1" -p "roll_back_4_initLoc";
	rename -uid "F7AE7829-4BF1-CD6E-2598-16BFFD0A564B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_1_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.42420935097366641 -0.62549537350922835 ;
	setAttr -k on ".w0";
createNode transform -n "roll_front_4_initLoc" -p "roll_initLocs";
	rename -uid "A9DFDC53-43A5-2EC1-8A1E-1584E1981D09";
createNode locator -n "roll_front_4_initLocShape" -p "roll_front_4_initLoc";
	rename -uid "86C08AA9-4458-EFD8-1F3E-998D778F7F8B";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_front_4_initLoc_pointConstraint1" -p "roll_front_4_initLoc";
	rename -uid "6BED3A43-4659-22DF-666F-048782FE6C7E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_1_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.47067330048532807 1.0160511588986463 ;
	setAttr -k on ".w0";
createNode transform -n "roll_back_5_initLoc" -p "roll_initLocs";
	rename -uid "59BF8C86-4A6C-F735-A312-50B2CB735023";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "roll_back_5_initLocShape" -p "roll_back_5_initLoc";
	rename -uid "4020C012-44D9-371B-DC38-DAA8F7179EF3";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_back_5_initLoc_pointConstraint1" -p "roll_back_5_initLoc";
	rename -uid "F509EF17-45BA-91C1-E2AD-64AF9DBB985A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.28437197666534808 -0.2674864714869829 ;
	setAttr -k on ".w0";
createNode transform -n "roll_front_5_initLoc" -p "roll_initLocs";
	rename -uid "011BDC81-4AB1-83F7-0CB6-37B8F0E46304";
createNode locator -n "roll_front_5_initLocShape" -p "roll_front_5_initLoc";
	rename -uid "29DFEF75-48F9-8BA7-366E-F09AB6312537";
	setAttr -k off ".v";
createNode pointConstraint -n "roll_front_5_initLoc_pointConstraint1" -p "roll_front_5_initLoc";
	rename -uid "E4F57E0D-4296-26ED-ACD8-F089AB3F8ECF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.2375976034283489 0.27262489015902069 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_0_rollLoc" -p "roll_initLocs";
	rename -uid "62DA8A03-4D64-3DC3-B0BA-7888003EE392";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_1_0_rollLocShape" -p "finger_1_0_rollLoc";
	rename -uid "D17DD9D0-41D9-9832-D5CA-20BA375AEFF0";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_0_rollLoc_pointConstraint1" -p "finger_1_0_rollLoc";
	rename -uid "67F41A68-405C-4461-1AD9-A98859F82DAE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" -0.46858898834703488 -0.2375976034283489 0.27262489015902069 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_0_pivotLoc" -p "finger_1_0_rollLoc";
	rename -uid "0DC1A9A6-46C5-7924-A6E7-3CAECAA9E9DC";
createNode locator -n "finger_1_0_pivotLocShape" -p "finger_1_0_pivotLoc";
	rename -uid "2868C346-40EE-217C-1A63-948E86C4BCD2";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_0_pivotLoc_pointConstraint1" -p "finger_1_0_pivotLoc";
	rename -uid "E24D742E-4CE7-5A8F-ED7B-78B6BC91C7FE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_5_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" -0.46858898834703533 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_1_rollLoc" -p "roll_initLocs";
	rename -uid "0911B05C-43B4-117A-965C-44ACB194870D";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_1_1_rollLocShape" -p "finger_1_1_rollLoc";
	rename -uid "31D89209-40BF-5456-62A5-F5A94780B6B4";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_1_rollLoc_pointConstraint1" -p "finger_1_1_rollLoc";
	rename -uid "43441E7B-4364-0240-530D-90941363BCAD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_1_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" -0.76587319119276609 -0.47067330048532807 0.93667949296445141 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_1_pivotLoc" -p "finger_1_1_rollLoc";
	rename -uid "1F21B5BE-408A-072E-FA3B-BFAFBF371552";
createNode locator -n "finger_1_1_pivotLocShape" -p "finger_1_1_pivotLoc";
	rename -uid "7AD6BCE9-402F-D4FE-3D3F-55A2134DE23F";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_1_pivotLoc_pointConstraint1" -p "finger_1_1_pivotLoc";
	rename -uid "B266D510-4532-4FA7-07BF-8EA0CB6D69A4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_4_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" -0.77467462386741626 0 -0.079371665934194757 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_2_rollLoc" -p "roll_initLocs";
	rename -uid "8C6633B5-4FDA-49E1-D224-7FBA035D5FFF";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_1_2_rollLocShape" -p "finger_1_2_rollLoc";
	rename -uid "2A7ACF74-4849-901E-5C3B-59998936845F";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_2_rollLoc_pointConstraint1" -p "finger_1_2_rollLoc";
	rename -uid "C72E9D98-4604-371D-8197-E58CF90C8E77";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_2_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" -1.0395363877860695 -0.44921964233360878 1.9034388370073279 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_2_pivotLoc" -p "finger_1_2_rollLoc";
	rename -uid "44F2CF01-4BE7-B30F-B654-9BABFC806059";
createNode locator -n "finger_1_2_pivotLocShape" -p "finger_1_2_pivotLoc";
	rename -uid "7FBADC7E-43B8-1885-59CB-4A8E8CA5B51E";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_2_pivotLoc_pointConstraint1" -p "finger_1_2_pivotLoc";
	rename -uid "6C40188E-49A9-6808-5323-57947EAC9B86";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_3_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" -1.0483378204607197 0 -0.11735864533016416 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_3_rollLoc" -p "roll_initLocs";
	rename -uid "91714A7C-4F3A-83D0-ACB2-06A9F884F1A7";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_1_3_rollLocShape" -p "finger_1_3_rollLoc";
	rename -uid "EABD7D09-409C-C456-0AC4-A4924D2A9ACD";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_3_rollLoc_pointConstraint1" -p "finger_1_3_rollLoc";
	rename -uid "B0B66867-48E4-34C4-F81B-509DFDE5359D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_3_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" -1.3258601593107358 -0.55291232340025154 2.9149237023048569 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_3_pivotLoc" -p "finger_1_3_rollLoc";
	rename -uid "1723069F-4252-C826-9C39-529718174802";
createNode locator -n "finger_1_3_pivotLocShape" -p "finger_1_3_pivotLoc";
	rename -uid "A725729D-4204-9694-5F61-0B8AC42FD061";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_3_pivotLoc_pointConstraint1" -p "finger_1_3_pivotLoc";
	rename -uid "182D2E8B-442A-4DEB-D990-37AD50105EA0";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_2_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" -1.3346615919853859 0 -0.15710302946687249 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_4_rollLoc" -p "roll_initLocs";
	rename -uid "FDFAD92C-44D7-54BD-6958-4D8848937A78";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_1_4_rollLocShape" -p "finger_1_4_rollLoc";
	rename -uid "F2D8DDDF-49A9-F013-AD80-6AA65F6402FE";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_4_rollLoc_pointConstraint1" -p "finger_1_4_rollLoc";
	rename -uid "88E8837A-46ED-BA07-0619-C3AAAFB8C30F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_1_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" -1.610236150076731 -0.74957085645767685 3.9195277181785939 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_4_pivotLoc" -p "finger_1_4_rollLoc";
	rename -uid "1DD4C55D-496B-D437-6E22-2FBCDD6364B4";
createNode locator -n "finger_1_4_pivotLocShape" -p "finger_1_4_pivotLoc";
	rename -uid "4915B8B9-49A1-A8BF-E428-578D449C23ED";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_1_4_pivotLoc_pointConstraint1" -p "finger_1_4_pivotLoc";
	rename -uid "4E103837-4201-8D9F-E961-A389E9502463";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_1_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" -1.6190375827513812 0 -0.19657704364346751 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_0_rollLoc" -p "roll_initLocs";
	rename -uid "40999253-42D9-97FA-F1F9-1FBA0848B5DE";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_2_0_rollLocShape" -p "finger_2_0_rollLoc";
	rename -uid "F3190BBF-4C4A-8008-319C-88BF65813436";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_2_0_rollLoc_pointConstraint1" -p "finger_2_0_rollLoc";
	rename -uid "320A5021-447D-D016-DE4C-729FAF4595B3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.2375976034283489 0.27262489015902069 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_1_rollLoc" -p "roll_initLocs";
	rename -uid "DD332FC6-44BF-62AB-9308-DAA160139C5E";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_2_1_rollLocShape" -p "finger_2_1_rollLoc";
	rename -uid "0CFF4D81-4400-4AA6-BDDE-2F8E230527FD";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_2_1_rollLoc_pointConstraint1" -p "finger_2_1_rollLoc";
	rename -uid "7B8B2D05-40B8-2EAD-4656-53B0D51E67B4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_1_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.47067330048532807 1.0160511588986463 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_2_rollLoc" -p "roll_initLocs";
	rename -uid "5BE40258-4381-DC95-A1FE-BE84E450B125";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_2_2_rollLocShape" -p "finger_2_2_rollLoc";
	rename -uid "D5F37266-44D5-B16E-F3DE-EB9802EBAEA6";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_2_2_rollLoc_pointConstraint1" -p "finger_2_2_rollLoc";
	rename -uid "DE6E616F-4D9E-21D0-F1FC-659908DFA7DA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_2_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.44921964233360878 2.0207974823374921 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_3_rollLoc" -p "roll_initLocs";
	rename -uid "1E1D587C-4124-7540-C2CA-52AD5533A797";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_2_3_rollLocShape" -p "finger_2_3_rollLoc";
	rename -uid "D96C135A-4A13-825C-AFDB-DDA61A92760F";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_2_3_rollLoc_pointConstraint1" -p "finger_2_3_rollLoc";
	rename -uid "8AAF413B-4CC0-3D11-626E-61AD210E8F5D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_3_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.55291232340025154 3.0720267317717296 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_4_rollLoc" -p "roll_initLocs";
	rename -uid "25EC1EA2-444E-5C38-D69E-D8B3C9CDCA26";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_2_4_rollLocShape" -p "finger_2_4_rollLoc";
	rename -uid "F94D3A9A-4DC6-3BB1-FCFD-D4A151515EEB";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_2_4_rollLoc_pointConstraint1" -p "finger_2_4_rollLoc";
	rename -uid "A7EE5607-4262-F92E-6298-95BA48BADAA7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.74957085645767685 4.1161047618220614 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_0_rollLoc" -p "roll_initLocs";
	rename -uid "7006519F-48A6-82FC-0247-64A182D766C4";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_3_0_rollLocShape" -p "finger_3_0_rollLoc";
	rename -uid "F146EA74-4288-3961-AA99-F8A7562D32A5";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_0_rollLoc_pointConstraint1" -p "finger_3_0_rollLoc";
	rename -uid "553459EA-483F-773D-C701-9B8F4684C28B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.5347677535423887 -0.2375976034283489 0.27262489015902069 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_0_pivotLoc" -p "finger_3_0_rollLoc";
	rename -uid "97574E75-41C1-C4C2-B508-8885625BB317";
createNode locator -n "finger_3_0_pivotLocShape" -p "finger_3_0_pivotLoc";
	rename -uid "DA876A78-45A7-8F20-BB4B-B89F295A8A8C";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_0_pivotLoc_pointConstraint1" -p "finger_3_0_pivotLoc";
	rename -uid "A1D2DF01-4EB1-ED40-8619-2E8C2392D96D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_5_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.53476775354238826 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_1_rollLoc" -p "roll_initLocs";
	rename -uid "430D802A-4396-1A62-EFD1-5D8D44E94E3C";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_3_1_rollLocShape" -p "finger_3_1_rollLoc";
	rename -uid "3873EDAA-4A0B-F310-C1F9-3AAA12B47097";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_1_rollLoc_pointConstraint1" -p "finger_3_1_rollLoc";
	rename -uid "786D1DC6-4096-B85C-DD10-118F0E0BECF7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_1_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.83238978438998357 -0.47067330048532807 0.86550983861774544 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_1_pivotLoc" -p "finger_3_1_rollLoc";
	rename -uid "DAC3E0C4-4C19-00A3-FED7-65AE84CFABDF";
createNode locator -n "finger_3_1_pivotLocShape" -p "finger_3_1_pivotLoc";
	rename -uid "2E7F5825-47B0-4B1A-6F45-96B4D0D6C979";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_1_pivotLoc_pointConstraint1" -p "finger_3_1_pivotLoc";
	rename -uid "1E1BA5E7-4ABB-07D4-77A9-74B1C717DB6B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_4_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.8235883517153334 0 -0.15054132028090095 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_2_rollLoc" -p "roll_initLocs";
	rename -uid "DDB662A9-4BED-C100-1204-B48973DAC702";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_3_2_rollLocShape" -p "finger_3_2_rollLoc";
	rename -uid "55271372-4ACE-9D23-3380-D9B5E908EEEB";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_2_rollLoc_pointConstraint1" -p "finger_3_2_rollLoc";
	rename -uid "20880C13-4A82-23F4-340B-04B45AC928E5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_2_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 1.0706012296589771 -0.44921964233360878 1.8416094656060644 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_2_pivotLoc" -p "finger_3_2_rollLoc";
	rename -uid "5D613C06-4785-5D56-D23E-6BBFB880B0C8";
createNode locator -n "finger_3_2_pivotLocShape" -p "finger_3_2_pivotLoc";
	rename -uid "A51A68AC-4D67-9E8D-F76B-42A7A0550E1F";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_2_pivotLoc_pointConstraint1" -p "finger_3_2_pivotLoc";
	rename -uid "8426FEA2-4C6A-6258-9EC6-F69640557950";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_3_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 1.0617997969843269 0 -0.17918801673142784 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_3_rollLoc" -p "roll_initLocs";
	rename -uid "D1F5FC4A-498E-1E5C-16D3-029CEF16E862";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_3_3_rollLocShape" -p "finger_3_3_rollLoc";
	rename -uid "CBD86C95-47A4-7624-5B12-789CD292503C";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_3_rollLoc_pointConstraint1" -p "finger_3_3_rollLoc";
	rename -uid "745952DB-4817-BA85-2CA1-22873ACA4573";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_3_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 1.3198331332500235 -0.55291232340025154 2.8628667265831669 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_3_pivotLoc" -p "finger_3_3_rollLoc";
	rename -uid "91B5342D-4782-FBEE-3143-98B6584E2109";
createNode locator -n "finger_3_3_pivotLocShape" -p "finger_3_3_pivotLoc";
	rename -uid "DC843DC2-4C05-4B00-C060-62A4FEADBDEF";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_3_pivotLoc_pointConstraint1" -p "finger_3_3_pivotLoc";
	rename -uid "4AA2E2CA-4042-9E3B-D11E-AD831EBC9516";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_2_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 1.3110317005753733 0 -0.20916000518856293 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_4_rollLoc" -p "roll_initLocs";
	rename -uid "E03CDCB3-4AE0-C993-9BBF-ECB669446495";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "finger_3_4_rollLocShape" -p "finger_3_4_rollLoc";
	rename -uid "E8312449-4AEF-84F6-B76D-C09CB9D31EC6";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_4_rollLoc_pointConstraint1" -p "finger_3_4_rollLoc";
	rename -uid "4727EDA3-4D48-E855-8BD0-349D2BA85113";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_3_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 1.5673695817146005 -0.74957085645767685 3.8771766592543031 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_4_pivotLoc" -p "finger_3_4_rollLoc";
	rename -uid "748F5A02-47C0-3C38-CE2D-C985CF5F38E3";
createNode locator -n "finger_3_4_pivotLocShape" -p "finger_3_4_pivotLoc";
	rename -uid "093C7CF2-426A-44BD-22EB-ABAE90222F09";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_3_4_pivotLoc_pointConstraint1" -p "finger_3_4_pivotLoc";
	rename -uid "85BEF7BD-4BCF-BCA2-C9A7-8FBBE4187571";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "roll_front_1_initLocW0" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 1.5585681490399503 0 -0.23892810256775832 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_0_rollLoc" -p "roll_initLocs";
	rename -uid "09D380A6-4E5B-392C-D259-91A259086A57";
createNode locator -n "finger_4_0_rollLocShape" -p "finger_4_0_rollLoc";
	rename -uid "F3889CCF-493F-16BA-25C9-98B2A3E97976";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_4_0_rollLoc_pointConstraint1" -p "finger_4_0_rollLoc";
	rename -uid "83685D06-48F2-4277-B1BC-9D898E1C7728";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.28437197666534808 -0.2674864714869829 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_1_rollLoc" -p "roll_initLocs";
	rename -uid "39A74507-49DA-B768-8ECB-47A3BBD039F7";
createNode locator -n "finger_4_1_rollLocShape" -p "finger_4_1_rollLoc";
	rename -uid "865878E8-4C8C-2160-69D5-BD8D611417ED";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_4_1_rollLoc_pointConstraint1" -p "finger_4_1_rollLoc";
	rename -uid "41EF72D2-4D0C-EE4D-096E-60BE4EE7DB2F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_1_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.42420935097366641 -0.62549537350922835 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_2_rollLoc" -p "roll_initLocs";
	rename -uid "53591D96-4CAF-911D-CA05-3599775B8283";
createNode locator -n "finger_4_2_rollLocShape" -p "finger_4_2_rollLoc";
	rename -uid "0AA4F027-43B2-022D-61C4-4589D63E58E9";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_4_2_rollLoc_pointConstraint1" -p "finger_4_2_rollLoc";
	rename -uid "73F91F98-4D62-D888-8416-C689111F2E62";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_2_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.49766452642344894 -1.0735719437529023 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_3_rollLoc" -p "roll_initLocs";
	rename -uid "7E186530-4031-55C8-DBD2-85B07080A87B";
createNode locator -n "finger_4_3_rollLocShape" -p "finger_4_3_rollLoc";
	rename -uid "66E8755D-44FF-8175-9E30-A5BD11E39F84";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_4_3_rollLoc_pointConstraint1" -p "finger_4_3_rollLoc";
	rename -uid "28368948-48D9-D3F1-544A-DD8B276EA8C4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_3_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.51235556151340522 -1.6905954175310756 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_4_rollLoc" -p "roll_initLocs";
	rename -uid "5AB56D41-4DF7-02E3-97E8-CCBF9E163412";
createNode locator -n "finger_4_4_rollLocShape" -p "finger_4_4_rollLoc";
	rename -uid "3F459A9F-4A68-BAC0-9AF9-3294EE116A36";
	setAttr -k off ".v";
createNode pointConstraint -n "finger_4_4_rollLoc_pointConstraint1" -p "finger_4_4_rollLoc";
	rename -uid "1ABDC5BC-4EFB-7D62-44DC-039AD03814FF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.65926591241297061 -2.3884195843040099 ;
	setAttr -k on ".w0";
createNode transform -n "ik_backTip_initLoc" -p "roll_initLocs";
	rename -uid "7B61E0FA-4CF4-2573-D626-6EACABE214A9";
createNode locator -n "ik_backTip_initLocShape" -p "ik_backTip_initLoc";
	rename -uid "3B9ECA36-4895-AEB6-B13A-3E9ABD79E914";
	setAttr -k off ".v";
createNode pointConstraint -n "ik_backTip_initLoc_pointConstraint1" -p "ik_backTip_initLoc";
	rename -uid "FE81FC25-4FE3-97CE-450C-ED8406B09D66";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.65926591241297061 -2.3884195843040099 ;
	setAttr -k on ".w0";
createNode transform -n "ik_frontTip_initLoc" -p "roll_initLocs";
	rename -uid "3787F0EF-454F-1160-58DB-378777BE3CED";
createNode locator -n "ik_frontTip_initLocShape" -p "ik_frontTip_initLoc";
	rename -uid "F6CF7F35-4CF0-D72D-F179-65AFFD781D88";
	setAttr -k off ".v";
createNode pointConstraint -n "ik_frontTip_initLoc_pointConstraint1" -p "ik_frontTip_initLoc";
	rename -uid "D2EB8519-4146-B066-7F4C-ACB35D6756A3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_4_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 0.008801432674650167 -0.74957085645767685 4.1161047618220614 ;
	setAttr -k on ".w0";
createNode transform -n "front_fingers_holdLoc" -p "roll_initLocs";
	rename -uid "D71F6253-4B22-D2B9-E83F-FFB8DD3A3EF2";
createNode locator -n "front_fingers_holdLocShape" -p "front_fingers_holdLoc";
	rename -uid "594FAE62-44F1-7326-F755-EDA81C1A0CE5";
	setAttr -k off ".v";
createNode pointConstraint -n "front_fingers_holdLoc_pointConstraint1" -p "front_fingers_holdLoc";
	rename -uid "968FAFA9-4D28-9FF7-6931-259A4566572E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_4_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.28437197666534808 -0.2674864714869829 ;
	setAttr -k on ".w0";
createNode transform -n "back_fingers_holdLoc" -p "roll_initLocs";
	rename -uid "75C26EF3-4A26-1F11-76B6-4FB52A5B94F1";
	setAttr ".r" -type "double3" 0 180 0 ;
createNode locator -n "back_fingers_holdLocShape" -p "back_fingers_holdLoc";
	rename -uid "BD57A6BA-4604-B2A1-91F5-AFA50FAD5578";
	setAttr -k off ".v";
createNode pointConstraint -n "back_fingers_holdLoc_pointConstraint1" -p "back_fingers_holdLoc";
	rename -uid "6AF71F5C-4A3B-3F77-0999-129584571607";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "finger_2_0_iniLocW0" -dv 1 -min 0 
		-at "double";
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
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -0.2375976034283489 0.27262489015902069 ;
	setAttr -k on ".w0";
createNode transform -n "ik_heel_initLoc" -p "root_poser";
	rename -uid "BF794FA8-4F99-A99A-D70B-17B6E6E679B9";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 6.2306345547044604e-15 0 0 ;
	setAttr -k on ".r";
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode locator -n "ik_heel_initLoc_locShape" -p "ik_heel_initLoc";
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
createNode locator -n "fk_heel_initLoc_locShape" -p "fk_heel_initLoc";
	rename -uid "0CC6CE6D-49CD-4EF7-A292-E69D6887E740";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "transform_initLoc" -p "root_poser";
	rename -uid "BE0FC40B-4466-8C33-16C9-90989280FAD8";
	setAttr ".r" -type "double3" -90 -90 0 ;
createNode locator -n "transform_initLocShape" -p "transform_initLoc";
	rename -uid "5C580895-4E2E-F41C-3071-0DA96700D3DF";
	setAttr -k off ".v";
createNode transform -n "finger_1_0_poser" -p "mainPoser";
	rename -uid "D2BFDB8B-4F09-BCB9-0D66-A0BF585AC2DC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -0.46858898834703533 1.3404961860870075 -1.3649652068266858 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_1_0_poserShape" -p "finger_1_0_poser";
	rename -uid "D9D348A9-4B5C-B4A1-332F-FDA4A7F5E813";
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
createNode locator -n "finger_1_0_poser_locShape" -p "finger_1_0_poser";
	rename -uid "AB1916D5-46A6-251C-2144-29A566B729F2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "finger_1_0_poserShapeOrig" -p "finger_1_0_poser";
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
createNode transform -n "finger_1_0_iniLoc" -p "finger_1_0_poser";
	rename -uid "63040E41-4DE0-2680-5C7D-EAA2CEDCA922";
createNode locator -n "finger_1_0_iniLocShape" -p "finger_1_0_iniLoc";
	rename -uid "ECF7741C-4614-1619-F38A-D296C606F92B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_1_0_iniLoc_aimConstraint1" -p "finger_1_0_iniLoc";
	rename -uid "EDD84110-4C17-FF1D-5BDB-17BE024E4778";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_1_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 145.72685018947632 -60.365837142119474 -141.90297118968346 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_0_poser" -p "mainPoser";
	rename -uid "581EF967-41C6-D2E5-27D4-EBA7EBD77701";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 1.3404961860870075 -1.3649652068266858 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_2_0_poserShape" -p "finger_2_0_poser";
	rename -uid "44A9E3F7-4B0E-F9E0-FBFE-8D822F6E474A";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_2_0_iniLoc" -p "finger_2_0_poser";
	rename -uid "428A2C80-4E6E-37CE-7898-D2B3F8FA9D51";
createNode locator -n "finger_2_0_iniLocShape" -p "finger_2_0_iniLoc";
	rename -uid "820E6015-4CCA-AB29-0FB7-039F311B97C3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_2_0_iniLoc_aimConstraint1" -p "finger_2_0_iniLoc";
	rename -uid "52267DF3-4B23-6DA4-273F-04853348A8FF";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_1_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90 -72.592980619992716 -90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_0_poser" -p "mainPoser";
	rename -uid "9D240B2D-4B7F-414D-8CA0-918C0B5BFAB3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.53476775354238826 1.3404961860870075 -1.3649652068266858 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_3_0_poserShape" -p "finger_3_0_poser";
	rename -uid "7F6FAC87-4161-7DBE-5C30-D1A50F32873A";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_3_0_iniLoc" -p "finger_3_0_poser";
	rename -uid "D4B9AD99-4BCC-0DBC-225F-698094F14C96";
createNode locator -n "finger_3_0_iniLocShape" -p "finger_3_0_iniLoc";
	rename -uid "BCE4E007-4FBC-B35C-61EE-40863D914A54";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_3_0_iniLoc_aimConstraint1" -p "finger_3_0_iniLoc";
	rename -uid "2FB956BD-492C-7632-9C9B-5F8CBD823986";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_1_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 33.437687242853109 -57.478285680242415 -38.065436667550003 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_0_poser" -p "mainPoser";
	rename -uid "69E2C774-47DB-D4BB-3200-EB8000AFF7D2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 1.2937218128500083 -1.9050765684726894 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_4_0_poserShape" -p "finger_4_0_poser";
	rename -uid "052EE1BF-4482-85B0-9260-3598B05CC766";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_4_0_iniLoc" -p "finger_4_0_poser";
	rename -uid "CAA0FF26-4CB9-A28B-9D18-A097A4F4152E";
createNode locator -n "finger_4_0_iniLocShape" -p "finger_4_0_iniLoc";
	rename -uid "D7908F2E-48FE-2815-E96A-349D5300E1AD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_4_0_iniLoc_aimConstraint1" -p "finger_4_0_iniLoc";
	rename -uid "8BCE4FF2-4D79-DF5E-F252-3781034DFDB6";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_1_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -90.000000000000071 68.664508844074305 -90.000000000000071 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_mainPoser" -p "mainPoser";
	rename -uid "AD191D5C-44B8-4294-5C0E-0E97223E95ED";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.81478902504829498 1.1305244464227377 -0.76560816191023007 ;
	setAttr ".r" -type "double3" 0 13.714626600862086 0 ;
	setAttr -k on ".s";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 3.93;
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.079999999999999905;
createNode nurbsCurve -n "finger_3_mainPoserShape" -p "finger_3_mainPoser";
	rename -uid "69640E13-4205-B6C8-C7BD-3AA18C70A7A6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		;
createNode nurbsCurve -n "finger_3_mainPoserShapeOrig" -p "finger_3_mainPoser";
	rename -uid "9188EF52-4C91-73C8-C628-76A92E82B553";
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
createNode transform -n "finger_3_4_poser" -p "finger_3_mainPoser";
	rename -uid "C4F4EA17-4681-9A89-F94C-3BB9B4CEDC0A";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.018633382021416178 -0.30200151336505821 3.0979389312216696 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_3_4_poserShape" -p "finger_3_4_poser";
	rename -uid "3AE8DCD4-4C38-EA32-4A3C-C6822DCB895F";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_3_4_iniLoc" -p "finger_3_4_poser";
	rename -uid "C4F025AA-4615-EF93-5D43-E58FC1BAFBA8";
createNode locator -n "finger_3_4_iniLocShape" -p "finger_3_4_iniLoc";
	rename -uid "2308CB2F-4A84-23B3-3F72-BB96BDA2D545";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_3_4_iniLoc_aimConstraint1" -p "finger_3_4_iniLoc";
	rename -uid "B4DD3BF2-49F0-F4DA-564D-5EBE8730E4C3";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 89.999999999999901 79.332963482205571 89.999999999999929 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_3_poser" -p "finger_3_mainPoser";
	rename -uid "BA5F7998-4E32-8DAC-A78A-EA9574BE5F06";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.018633382021416178 -0.10534298030763289 2.0538609011713382 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_3_3_poserShape" -p "finger_3_3_poser";
	rename -uid "654765AA-40A0-9F36-67CD-CA861D50B557";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_3_3_iniLoc" -p "finger_3_3_poser";
	rename -uid "78751538-47CC-BF11-88D9-50A52723F2B7";
createNode locator -n "finger_3_3_iniLocShape" -p "finger_3_3_iniLoc";
	rename -uid "6884DF09-49AE-04BA-AD0F-DDBF8C7C390D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_3_3_iniLoc_aimConstraint1" -p "finger_3_3_iniLoc";
	rename -uid "4F12B6B5-4E13-D582-2690-9B924F9964E4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_4_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90.000000000000071 -79.332963482205599 -90.000000000000071 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_2_poser" -p "finger_3_mainPoser";
	rename -uid "4A6CB738-48E5-8D3A-1E5C-EAA054856C0D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.018633382021416178 -0.0016502992409901385 1.002631651737101 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_3_2_poserShape" -p "finger_3_2_poser";
	rename -uid "F2F39D26-46E7-BD0F-DB69-0D9A3C25BE29";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_3_2_iniLoc" -p "finger_3_2_poser";
	rename -uid "595B8C19-4E3D-C321-6DA4-F4A6D6527D2F";
createNode locator -n "finger_3_2_iniLocShape" -p "finger_3_2_iniLoc";
	rename -uid "81301A00-4CB6-2F20-C526-908FF53B02CC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_3_2_iniLoc_aimConstraint1" -p "finger_3_2_iniLoc";
	rename -uid "73711181-41AF-5A94-BD53-01B41840936C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90.000000000000128 -84.366598839391344 -90.000000000000128 ;
	setAttr -k on ".w0";
createNode transform -n "finger_3_1_poser" -p "finger_3_mainPoser";
	rename -uid "A03441B7-4EE0-15BE-4F9F-67A590CC974E";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.018633382021416178 -0.023103957392709429 -0.0021146717017448413 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_3_1_poserShape" -p "finger_3_1_poser";
	rename -uid "3B51CF85-46B7-ACC8-D473-199847A7EBA2";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_3_1_iniLoc" -p "finger_3_1_poser";
	rename -uid "E12ED17E-4936-B827-F8F5-1DAF3B9EC6F9";
createNode locator -n "finger_3_1_iniLocShape" -p "finger_3_1_iniLoc";
	rename -uid "39B4BE30-4D6F-3EDE-5EEA-6AA2E60EBE76";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_3_1_iniLoc_aimConstraint1" -p "finger_3_1_iniLoc";
	rename -uid "AD84DBE6-4BCA-4D48-958D-49A3F0F5B998";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_3_2_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -89.999999999999403 -88.776788446136862 89.999999999999105 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_mainPoser" -p "mainPoser";
	rename -uid "117BE3D3-4D3D-14E0-914F-ADBDC8B3BCF2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0 1.1305244464227377 -0.61942426638531523 ;
	setAttr -k on ".s";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 3.93;
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.079999999999999905;
createNode nurbsCurve -n "finger_2_mainPoserShape" -p "finger_2_mainPoser";
	rename -uid "8610FB5F-4429-2F43-3C39-52BC6E4C6740";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		;
createNode nurbsCurve -n "finger_2_mainPoserShapeOrig" -p "finger_2_mainPoser";
	rename -uid "7E2951D9-46F2-02C7-65A7-77A64ABC4180";
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
createNode transform -n "finger_2_4_poser" -p "finger_2_mainPoser";
	rename -uid "53D2EE8D-488F-32FE-B7EE-62B5679E606F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.0088014326746497229 -0.30200151336505821 3.0979389312216696 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_2_4_poserShape" -p "finger_2_4_poser";
	rename -uid "47F4B3BC-4E94-29BA-EDCF-7F94E02B769A";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_2_4_iniLoc" -p "finger_2_4_poser";
	rename -uid "B1D214B7-4D67-316B-F06B-AF89DD820208";
createNode locator -n "finger_2_4_iniLocShape" -p "finger_2_4_iniLoc";
	rename -uid "7BD00402-40A2-B74F-1C46-38AC3472FBA8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_2_4_iniLoc_aimConstraint1" -p "finger_2_4_iniLoc";
	rename -uid "13A2016B-4197-D327-E15E-129BB25095F5";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90 79.332963482205585 90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_3_poser" -p "finger_2_mainPoser";
	rename -uid "E5415763-4532-6343-6811-21BE59100AEE";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.0088014326746497229 -0.10534298030763289 2.0538609011713382 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_2_3_poserShape" -p "finger_2_3_poser";
	rename -uid "D95AA14A-40F4-96C5-3F18-95A0C287C8AA";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_2_3_iniLoc" -p "finger_2_3_poser";
	rename -uid "4F32F241-4D0A-7B8C-6DDE-F38D6083D742";
createNode locator -n "finger_2_3_iniLocShape" -p "finger_2_3_iniLoc";
	rename -uid "ECE450E3-431E-2175-0414-75B42A800D58";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_2_3_iniLoc_aimConstraint1" -p "finger_2_3_iniLoc";
	rename -uid "BDEBECCD-4E63-5C5D-7D31-63A16E4C2850";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_4_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90 -79.332963482205585 -90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_2_poser" -p "finger_2_mainPoser";
	rename -uid "83A681CF-47BA-78C3-6B8D-E099680C58FB";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.0088014326746497229 -0.0016502992409901385 
		1.002631651737101 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_2_2_poserShape" -p "finger_2_2_poser";
	rename -uid "11D3D404-4776-7456-4AC2-9A929BF18A74";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_2_2_iniLoc" -p "finger_2_2_poser";
	rename -uid "7FF29BE2-4412-1A90-C708-62A2B5B6CC83";
createNode locator -n "finger_2_2_iniLocShape" -p "finger_2_2_iniLoc";
	rename -uid "7D41E8A1-4610-AB91-78FB-DCA5D440DBC3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_2_2_iniLoc_aimConstraint1" -p "finger_2_2_iniLoc";
	rename -uid "C3804213-42FD-3A02-31C0-97A6FDE9CA30";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90 -84.366598839391344 -90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_2_1_poser" -p "finger_2_mainPoser";
	rename -uid "ECDB2189-4685-2E2E-13A1-6F8307CF95E8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.0088014326746497229 -0.023103957392709429 -0.0021146717017448413 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_2_1_poserShape" -p "finger_2_1_poser";
	rename -uid "333AF042-4F0F-7409-AC94-6BB2F00B2A4C";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_2_1_iniLoc" -p "finger_2_1_poser";
	rename -uid "CBDEF73A-40EF-0626-7B49-72A33C0310B3";
createNode locator -n "finger_2_1_iniLocShape" -p "finger_2_1_iniLoc";
	rename -uid "EDC00311-4E46-AF03-9334-91875C1AC86F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_2_1_iniLoc_aimConstraint1" -p "finger_2_1_iniLoc";
	rename -uid "042CF944-42DE-1139-3D86-CDB4C3147B74";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_2_2_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -90 -88.776788446136862 90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_mainPoser" -p "mainPoser";
	rename -uid "D713379F-4B7F-A592-3532-769F04910C3D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" -0.78298399806855823 1.1305244464227377 -0.7035564429304656 ;
	setAttr ".r" -type "double3" 0 -15.805370563298148 0 ;
	setAttr -k on ".s";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 3.93;
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.079999999999999905;
createNode nurbsCurve -n "finger_1_mainPoserShape" -p "finger_1_mainPoser";
	rename -uid "50C07448-4BA5-4C4E-080F-8EB7AD1B2DCE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		;
createNode nurbsCurve -n "finger_1_mainPoserShapeOrig" -p "finger_1_mainPoser";
	rename -uid "9F68910A-4924-C537-A987-28BB6B3AE67E";
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
createNode transform -n "finger_1_4_poser" -p "finger_1_mainPoser";
	rename -uid "5DF3F5B7-413E-3F1A-CAFA-ECA3ED6D3531";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.017184537790350118 -0.30200151336505821 3.0979389312216696 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_1_4_poserShape" -p "finger_1_4_poser";
	rename -uid "C68CE751-4528-1EF9-E5B3-BCA8D04A04B7";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_1_4_iniLoc" -p "finger_1_4_poser";
	rename -uid "2469F960-4B04-6D8C-0E79-8AB5B210743E";
createNode locator -n "finger_1_4_iniLocShape" -p "finger_1_4_iniLoc";
	rename -uid "A845B2C6-4393-B9AC-C6DB-FE86B547D6B4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_1_4_iniLoc_aimConstraint1" -p "finger_1_4_iniLoc";
	rename -uid "D881E124-4FD7-4157-FB2B-6AA099065F9B";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 89.999999999999972 79.332963482205585 90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_3_poser" -p "finger_1_mainPoser";
	rename -uid "B55C7F14-49D3-5A57-E40A-E9B3C6A79586";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.017184537790350118 -0.10534298030763289 2.0538609011713382 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_1_3_poserShape" -p "finger_1_3_poser";
	rename -uid "57FB3BE0-4D28-9935-0EA9-9BBC2E0F2C6A";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_1_3_iniLoc" -p "finger_1_3_poser";
	rename -uid "25F42585-4A13-31FF-94D0-E9B62B8487D5";
createNode locator -n "finger_1_3_iniLocShape" -p "finger_1_3_iniLoc";
	rename -uid "4A53AB39-40FC-40FE-D77F-78B421830268";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_1_3_iniLoc_aimConstraint1" -p "finger_1_3_iniLoc";
	rename -uid "5CB0F108-4641-7855-57CC-60A8CE4CB1E2";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_4_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90 -79.332963482205599 -90.000000000000071 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_2_poser" -p "finger_1_mainPoser";
	rename -uid "FAC969AB-4466-8107-12B1-1F895EC64FD9";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.017184537790350118 -0.0016502992409901385 1.002631651737101 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_1_2_poserShape" -p "finger_1_2_poser";
	rename -uid "3A19DBD9-4CD7-B0FA-659A-01BE2A19F88A";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_1_2_iniLoc" -p "finger_1_2_poser";
	rename -uid "F811D371-4FAB-AC78-4F43-21A16DD9CACB";
createNode locator -n "finger_1_2_iniLocShape" -p "finger_1_2_iniLoc";
	rename -uid "7A476F9D-45BF-A622-EFF1-FAB31BB366E4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_1_2_iniLoc_aimConstraint1" -p "finger_1_2_iniLoc";
	rename -uid "4D2E6E6D-48BF-CBB1-F1D8-45B2930E5192";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 90.000000000000128 -84.366598839391344 -90.000000000000128 ;
	setAttr -k on ".w0";
createNode transform -n "finger_1_1_poser" -p "finger_1_mainPoser";
	rename -uid "253F2FCD-4567-140B-EB2D-5CAB813C4007";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.017184537790350118 -0.023103957392709429 -0.0021146717017448413 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_1_1_poserShape" -p "finger_1_1_poser";
	rename -uid "BF2631FA-490B-338F-77AD-888D4C783E8B";
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
createNode locator -n "finger_1_1_poser_locShape" -p "finger_1_1_poser";
	rename -uid "0FF35650-4ADB-7A54-1A08-ECA0596B79A3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode nurbsCurve -n "finger_1_1_poserShapeOrig" -p "finger_1_1_poser";
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
createNode transform -n "finger_1_1_iniLoc" -p "finger_1_1_poser";
	rename -uid "16D62DFA-4BCB-11CE-E6F0-029D7B5D9104";
createNode locator -n "finger_1_1_iniLocShape" -p "finger_1_1_iniLoc";
	rename -uid "99B495BE-4F93-2517-E42E-2E9F0CCEA4BB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_1_1_iniLoc_aimConstraint1" -p "finger_1_1_iniLoc";
	rename -uid "824D1D4B-4D9B-6481-11A3-0CB44F9023CB";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_1_2_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -89.999999999999403 -88.776788446136862 89.999999999999105 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_mainPoser" -p "mainPoser";
	rename -uid "EE2FA3A2-4EDC-447F-21E5-3B985DC799A4";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0 1.1389468072554312 -2.2350576415850347 ;
	setAttr -k on ".s";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 3.93;
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.079999999999999905;
createNode nurbsCurve -n "finger_4_mainPoserShape" -p "finger_4_mainPoser";
	rename -uid "0A0CF20D-4A58-6716-F9E6-BC93467F7746";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		0.2752358615398407 0.27523618936538696 0.27523601055145264
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 0.27523618936538696 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 0.27523601055145264
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		-0.27523621916770935 0.27523618936538696 -0.27523604035377502
		-0.27523621916770935 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 0.27523618936538696 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 -0.27523604035377502
		0.2752358615398407 -0.27523589134216309 0.27523601055145264
		;
createNode nurbsCurve -n "finger_4_mainPoserShapeOrig" -p "finger_4_mainPoser";
	rename -uid "DCED5BEF-40B9-722A-DF2C-B9836A0AFA4C";
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
createNode transform -n "finger_4_4_poser" -p "finger_4_mainPoser";
	rename -uid "5AA8AC17-4F5B-FCC7-9096-578451A8CCAE";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 -0.2201189301530454 -1.7909520397046816 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_4_4_poserShape" -p "finger_4_4_poser";
	rename -uid "E80E04AE-4469-EAD2-0C2C-D480928E32D9";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_4_4_iniLoc" -p "finger_4_4_poser";
	rename -uid "F856C38D-4C2F-6C24-86AC-31A0FF83F02E";
createNode locator -n "finger_4_4_iniLocShape" -p "finger_4_4_iniLoc";
	rename -uid "F516A46D-40D8-AC0F-5CF8-92964785AA79";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_4_4_iniLoc_aimConstraint1" -p "finger_4_4_iniLoc";
	rename -uid "767B300D-4E59-6460-7A5E-95B9F35F613B";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -90 -78.111341960372002 90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_3_poser" -p "finger_4_mainPoser";
	rename -uid "66FBD9D3-4BA7-6348-E628-C7A9C44FAB05";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 -0.073208579253480011 -1.0931278729317473 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_4_3_poserShape" -p "finger_4_3_poser";
	rename -uid "FD95117D-4DD1-5B58-470A-4182E773C671";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_4_3_iniLoc" -p "finger_4_3_poser";
	rename -uid "04C6EA41-4A7A-876B-CCBA-67805AB67FBA";
createNode locator -n "finger_4_3_iniLocShape" -p "finger_4_3_iniLoc";
	rename -uid "30FD6C9A-42F8-04D7-F8CF-50B1320A3DFF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_4_3_iniLoc_aimConstraint1" -p "finger_4_3_iniLoc";
	rename -uid "1B9E76AD-4FDD-5F1E-341E-20ADDD7183AD";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_4_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -90 78.111341960372002 -90 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_2_poser" -p "finger_4_mainPoser";
	rename -uid "7CA7D329-4FA5-A942-BE0B-4CACB48BC5AF";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 -0.058517544163523727 -0.47610439915357405 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_4_2_poserShape" -p "finger_4_2_poser";
	rename -uid "874AA45F-4052-283B-1169-EABBE6C824BB";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_4_2_iniLoc" -p "finger_4_2_poser";
	rename -uid "F4EAEAC3-402D-1605-68B0-6F9F8610F20C";
createNode locator -n "finger_4_2_iniLocShape" -p "finger_4_2_iniLoc";
	rename -uid "13CD19F4-4999-FCB0-5717-DB935196ABF9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_4_2_iniLoc_aimConstraint1" -p "finger_4_2_iniLoc";
	rename -uid "70C6FEF2-42FE-2FC2-8199-518D9E620262";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_3_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -90 88.636072468397103 -89.99999999999973 ;
	setAttr -k on ".w0";
createNode transform -n "finger_4_1_poser" -p "finger_4_mainPoser";
	rename -uid "552E9C2E-498F-BC8F-EDBA-3AAB5B1671F8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0.014937631286258801 -0.028027828909900077 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.29;
createNode nurbsSurface -n "finger_4_1_poserShape" -p "finger_4_1_poser";
	rename -uid "75421593-4EC0-DF2C-C376-2A9E20F0A4FE";
	setAttr -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 2.7829775776940882e-17 -2.2793576926807528e-17
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.14499999582767487 -0.040995129177680251 -1.5822739986685523e-17
		-0.14499999582767487 -0.028987933837156202 0.028987933837156185
		-0.14499999582767487 -8.9253663401610562e-18 0.040995129177680251
		-0.14499999582767487 0.028987933837156196 0.028987933837156189
		-0.14499999582767487 0.040995129177680251 1.5306584657322075e-18
		-0.14499999582767487 0.028987933837156202 -0.028987933837156209
		-0.14499999582767487 7.3290838989840907e-18 -0.040995129177680244
		-0.14499999582767487 -0.028987933837156196 -0.028987933837156209
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		-0.11362368233974504 -0.12640572380483017 -5.7403014219436989e-18
		-0.11362368233974504 -0.089382344483189213 0.089382344483189199
		-0.11362368233974506 -4.8921102404508637e-18 0.1264057238048302
		-0.11362368233974504 0.089382344483189213 0.089382344483189186
		-0.11362368233974504 0.12640572380483017 2.5104224140591287e-18
		-0.11362368233974504 0.089382344483189213 -0.089382344483189227
		-0.11362368233974503 -2.9919313337535399e-20 -0.12640572380483012
		-0.11362368233974504 -0.089382344483189213 -0.089382344483189213
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		1.7874929152972409e-17 -0.17782936695504464 1.2559110718327048e-17
		1.0175308288410169e-17 -0.125744351268023 0.12574435126802302
		6.986020901177632e-18 3.9645271926297526e-18 0.17782936695504467
		1.017530828841017e-17 0.12574435126802302 0.125744351268023
		1.7874929152972409e-17 0.17782936695504464 2.4727114804633637e-18
		2.5574550017534652e-17 0.125744351268023 -0.12574435126802305
		2.876383740476718e-17 -1.0888908251794773e-17 -0.17782936695504459
		2.5574550017534648e-17 -0.12574435126802302 -0.125744351268023
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.11362368233974511 -0.12640572380483017 2.3594984345000647e-17
		0.11362368233974511 -0.089382344483189199 0.089382344483189255
		0.1136236823397451 1.0528287638023041e-17 0.1264057238048302
		0.11362368233974511 0.089382344483189241 0.089382344483189199
		0.11362368233974511 0.12640572380483017 1.0049124240556719e-18
		0.11362368233974511 0.089382344483189199 -0.089382344483189227
		0.11362368233974512 -1.5450317191811432e-17 -0.12640572380483012
		0.11362368233974511 -0.089382344483189241 -0.089382344483189172
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -0.040995129177680195 2.1613261260764657e-17
		0.14499999582767487 -0.028987933837156147 0.028987933837156182
		0.14499999582767487 1.0753256830614969e-17 0.040995129177680209
		0.14499999582767487 0.028987933837156171 0.028987933837156154
		0.14499999582767487 0.040995129177680195 -3.9058662836965696e-19
		0.14499999582767487 0.028987933837156147 -0.028987933837156164
		0.14499999582767487 -1.2349539271791924e-17 -0.040995129177680174
		0.14499999582767487 -0.028987933837156171 -0.028987933837156133
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		0.14499999582767487 -2.6529650716098423e-17 2.1493451865965065e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "finger_4_1_iniLoc" -p "finger_4_1_poser";
	rename -uid "45DD3FA7-4FDF-74E0-EE73-CA81BE778266";
createNode locator -n "finger_4_1_iniLocShape" -p "finger_4_1_iniLoc";
	rename -uid "C62B1C58-405A-EBC1-E84E-7C9F716585A1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode aimConstraint -n "finger_4_1_iniLoc_aimConstraint1" -p "finger_4_1_iniLoc";
	rename -uid "9D7A458E-4823-6650-FC4B-D4B3BC9CFE04";
	addAttr -dcb 0 -ci true -sn "w0" -ln "finger_4_2_iniLocW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -90.000000000000071 80.690059825013975 -90.000000000000071 ;
	setAttr -k on ".w0";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "437819C8-4967-CCE8-14F0-F68D7B9CDD52";
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "AA550525-4020-CAC8-A501-32BB4D29ABCB";
	setAttr -k off ".v";
	setAttr -s 11 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 0.10000000000000001 0.20000000000000001 0.29999999999999999 0.40000000000000002
		 0.5 0.59999999999999998 0.69999999999999996 0.80000000000000004 0.90000000000000002
		 1
		11
		-1.6102361500767315 0.82852293305767954 2.2819376211928875
		-1.3258601593107362 1.0251814661151049 1.2773336053191504
		-1.0395363877860699 1.1288741471817476 0.26584874002162151
		-0.76587319119276653 1.1074204890300283 -0.70091060402125505
		-0.46858898834703533 1.3404961860870075 -1.3649652068266858
		-4.4408920985006262e-16 1.5780937895153564 -1.6375900969857065
		0.53476775354238826 1.3404961860870075 -1.3649652068266858
		0.83238978438998312 1.1074204890300283 -0.77208025836796101
		1.0706012296589766 1.1288741471817476 0.20401936862035785
		1.319833133250023 1.0251814661151049 1.2252766295974604
		1.5673695817146001 0.82852293305767954 2.2395865622685966
		;
createNode transform -n "posers_curve_2" -p "posers";
	rename -uid "61295DD6-4B94-098B-7B7F-13A089CCBE94";
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curve_2Shape" -p "posers_curve_2";
	rename -uid "060A65CE-4C61-486F-8B4A-FBBF44ECA370";
	setAttr -k off ".v";
	setAttr -s 11 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 0.10000000000000001 0.20000000000000001 0.29999999999999999 0.40000000000000002
		 0.5 0.59999999999999998 0.69999999999999996 0.80000000000000004 0.90000000000000002
		 1
		11
		0.0088014326746497229 0.82852293305767954 2.4785146648363545
		0.0088014326746497229 1.0251814661151049 1.4344366347860231
		0.0088014326746497229 1.1288741471817476 0.38320738535178578
		0.0088014326746497229 1.1074204890300283 -0.62153893808706007
		0 1.3404961860870075 -1.3649652068266858
		-4.4408920985006262e-16 1.5780937895153564 -1.6375900969857065
		0 1.2937218128500083 -1.9050765684726894
		0 1.15388443854169 -2.2630854704949348
		0 1.0804292630919075 -2.7111620407386088
		0 1.0657382280019512 -3.328185514516782
		0 0.91882787710238578 -4.0260096812897164
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
	setAttr ".ndt" 0;
createNode transform -n "posers_sweep_2" -p "posers";
	rename -uid "E746BBB5-4ADC-B728-1841-03A840E54DA3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweep_2Shape" -p "posers_sweep_2";
	rename -uid "C7BB7CC9-4F91-BA93-0CAA-EDB419C8B8B7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
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
createNode transform -n "ik_foot_group" -p "ik_controls";
	rename -uid "913F2277-466B-0B47-6A74-8694534F793D";
createNode transform -n "ik_foot" -p "ik_foot_group";
	rename -uid "307033E8-4E98-F8CF-F840-4193C8F42D4F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "parent" -ln "parent" -min 0 -max 0 -en "root" -at "enum";
	addAttr -ci true -sn "roll" -ln "roll" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_roll" -ln "default_roll" -dt "string";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "radius" -ln "radius" -min 0 -at "double";
	addAttr -ci true -k true -sn "rollAngle" -ln "rollAngle" -dv 30 -at "double";
	addAttr -ci true -k true -sn "holdFingers" -ln "holdFingers" -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ovdt" 2;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_end";
	setAttr -l on ".moduleName" -type "string" "l_leg";
	setAttr -l on ".type" -type "string" "control";
	setAttr -k on ".roll";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_roll" -type "string" "0.0";
	setAttr -k on ".weight";
	setAttr ".radius" 15;
	setAttr -k on ".rollAngle";
	setAttr -k on ".holdFingers";
createNode nurbsCurve -n "ik_footShape" -p "ik_foot";
	rename -uid "4BAA9A61-4F74-A6A3-A4BE-81BEDB0AA6FD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 55 0 no 3
		56 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54
		 55
		56
		-0.026772798229783516 -1.5931230715376141 4.2817330275757151
		0.55484893208857966 -1.5931230715376141 4.2447796512842437
		1.111923798597364 -1.5931230715376141 3.9299340652347583
		1.5690837730967162 -1.5931230715376141 3.412959436130008
		1.8331510833305811 -1.5931230715376141 2.6298304331867124
		1.7777861896259648 -1.5931230715376141 1.7945103623235097
		1.5030229956333583 -1.5931230715376141 1.0275911702726646
		1.5030229956333583 -1.1763110587369019 1.0275911702726694
		1.7777861896259648 -1.1763110587369019 1.7945103623235115
		1.8331510833305811 -1.1763110587369019 2.6298304331867124
		1.5690837730967162 -1.1763110587369019 3.4129594361300097
		1.111923798597364 -1.1763110587369019 3.929934065234761
		0.55484893208857966 -1.1763110587369019 4.2447796512842437
		-0.026772798229783516 -1.1763110587369019 4.2817330275757168
		-0.026772798229783516 -1.5931230715376141 4.2817330275757151
		-0.5964044131185362 -1.5931230715376141 4.1912571848272631
		-1.1474852262312156 -1.5931230715376141 3.8697212904706606
		-1.5926543108619291 -1.5931230715376141 3.3795078945943784
		-1.874708303783301 -1.5931230715376141 2.6298304331867124
		-1.8013556837375082 -1.5931230715376141 1.8614134453947235
		-1.5086263322461482 -1.5931230715376141 1.0543524035011562
		-1.1605903850678549 -1.5931230715376141 0.087913354494961252
		-0.97549592900175475 -1.5931230715376119 -0.6750027172482207
		-0.80134742105416445 -1.5931230715376119 -1.3042546291277017
		-0.57198930637102752 -1.5931230715376119 -1.9082032662250348
		-0.33130327875936005 -1.5931230715376119 -2.3193893011553901
		-0.026772798229783516 -1.5931230715376119 -2.4272599362440235
		-0.026772798229783516 -1.1763110587369014 -2.4272599362440199
		0.27909047048890501 -1.1763110587369014 -2.296642243652868
		0.54841737706758953 -1.1763110587369014 -1.9416548077606413
		0.78930190248146459 -1.1763110587369019 -1.3360942089898939
		0.9894976396353895 -1.1763110587369019 -0.62786622575170214
		1.1407460809447274 -1.1763110587369019 0.080033653929544368
		1.5030229956333583 -1.1763110587369019 1.0275911702726694
		1.5030229956333583 -1.5931230715376141 1.0275911702726646
		1.1407460809447274 -1.5931230715376141 0.080033653929542106
		0.9894976396353895 -1.5931230715376119 -0.62786622575170525
		0.78930190248146459 -1.5931230715376119 -1.3360942089898957
		0.54841737706758953 -1.5931230715376119 -1.9416548077606413
		0.27909047048890501 -1.5931230715376119 -2.2966422436528728
		-0.026772798229783516 -1.5931230715376119 -2.4272599362440235
		-0.026772798229783516 -1.1763110587369014 -2.4272599362440199
		-0.33130327875936005 -1.1763110587369014 -2.319389301155387
		-0.57198930637102752 -1.1763110587369014 -1.9082032662250348
		-0.80134742105416445 -1.1763110587369019 -1.3042546291277008
		-0.97549592900175475 -1.1763110587369019 -0.6750027172482207
		-1.1605903850678549 -1.1763110587369019 0.087913354494964083
		-1.5086263322461482 -1.1763110587369019 1.0543524035011602
		-1.5086263322461482 -1.5931230715376141 1.0543524035011562
		-1.5086263322461482 -1.1763110587369019 1.0543524035011602
		-1.8013556837375082 -1.1763110587369019 1.8614134453947244
		-1.874708303783301 -1.1763110587369019 2.6298304331867124
		-1.5926543108619291 -1.1763110587369019 3.3795078945943784
		-1.1474852262312156 -1.1763110587369019 3.8697212904706606
		-0.5964044131185362 -1.1763110587369019 4.1912571848272648
		-0.026772798229783516 -1.1763110587369019 4.2817330275757168
		;
createNode transform -n "fk_controls" -p "controls";
	rename -uid "231D8495-438C-8A24-FD6E-6D9B93B62C87";
	setAttr ".t" -type "double3" 0 -6.9388939039072284e-18 -1.3877787807814457e-17 ;
	setAttr ".r" -type "double3" -3.180554681463516e-15 0 -1.1927080055488188e-15 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode transform -n "fk_heel_group_2" -p "fk_controls";
	rename -uid "814D98BD-473F-8788-61D4-EFA16EE8FFED";
createNode transform -n "fk_heel_group" -p "fk_controls";
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
createNode transform -n "fk_toe_group" -p "fk_heel";
	rename -uid "B2588B30-43F3-A92B-C54E-2FA7ED9D1848";
	setAttr ".v" no;
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
createNode nurbsCurve -n "fk_heelShape" -p "fk_heel";
	rename -uid "B921EAAD-44A1-0155-EA71-61B067200BB6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.78220172572844116 4.7896041985043591e-17 -0.78220172572844004
		-1.2620422609855989e-16 6.7735232159239798e-17 -1.1062002890368023
		-0.78220172572844016 4.7896041985043647e-17 -0.78220172572844016
		-1.1062002890368023 1.9539677860741656e-32 -3.2011531745708022e-16
		-0.7822017257284406 -4.7896041985043622e-17 0.78220172572844016
		-3.3331973582254345e-16 -6.7735232159239823e-17 1.1062002890368023
		0.78220172572844004 -4.7896041985043665e-17 0.78220172572844038
		1.1062002890368023 -3.6469023143475602e-32 5.9457618450434596e-16
		0.78220172572844116 4.7896041985043591e-17 -0.78220172572844004
		-1.2620422609855989e-16 6.7735232159239798e-17 -1.1062002890368023
		-0.78220172572844016 4.7896041985043647e-17 -0.78220172572844016
		;
createNode transform -n "fk_heel_out" -p "fk_heel";
	rename -uid "53030E46-474F-E97D-0450-B68654DE3689";
createNode transform -n "transform" -p "controls";
	rename -uid "D289998C-462E-7142-1997-B18EE0190176";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
createNode locator -n "transformShape" -p "transform";
	rename -uid "DDCA70FF-4598-5E5A-9C3E-E093A81F9E1B";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 5.8400000000000007 5.8400000000000007 5.8400000000000007 ;
createNode transform -n "ik_backTip_group" -p "transform";
	rename -uid "2E565C46-459D-E74C-02DA-03BADB1E4E1E";
createNode transform -n "ik_backTip" -p "ik_backTip_group";
	rename -uid "FA5A91A8-4196-879D-A0E1-199886F1911F";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "ik_backTipShape" -p "ik_backTip";
	rename -uid "7F4640EA-422A-E5BE-7734-B8ADF950A9BE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9192949363953888e-17 0.31344464995648985 -0.3134446499564898
		1.6620250738737024e-33 0.44327767502175508 -2.7142929292443649e-17
		-1.9192949363953888e-17 0.3134446499564898 0.3134446499564898
		-2.7142929292443665e-17 2.2979592950099324e-17 0.4432776750217553
		-1.9192949363953888e-17 -0.3134446499564898 0.3134446499564898
		-2.7189257911234355e-33 -0.44327767502175536 4.44034278784129e-17
		1.9192949363953888e-17 -0.3134446499564898 -0.3134446499564898
		2.7142929292443665e-17 -6.044962003119836e-17 -0.4432776750217553
		1.9192949363953888e-17 0.31344464995648985 -0.3134446499564898
		1.6620250738737024e-33 0.44327767502175508 -2.7142929292443649e-17
		-1.9192949363953888e-17 0.3134446499564898 0.3134446499564898
		;
createNode transform -n "roll_back_rigid" -p "ik_backTip";
	rename -uid "BB9C1789-4E8D-4464-BA1D-01AA83308079";
createNode transform -n "roll_back_1" -p "roll_back_rigid";
	rename -uid "C6CBEE80-4F19-48BB-5E20-43B129755FF6";
createNode transform -n "roll_back_2" -p "roll_back_1";
	rename -uid "FA2F5FA1-4178-3D71-1255-4CA48564B6CA";
createNode transform -n "roll_back_3" -p "roll_back_2";
	rename -uid "FA9F1D76-4395-15C4-94FB-5B8D2AFA5CB8";
createNode transform -n "roll_back_4" -p "roll_back_3";
	rename -uid "8927E344-4087-0AF0-E9AE-9BA8D7603175";
createNode transform -n "roll_back_5" -p "roll_back_4";
	rename -uid "E48CA41D-46F2-0EF6-8F88-96AC0916F5CD";
createNode transform -n "ik_frontTip_group" -p "roll_back_5";
	rename -uid "EBB4FF12-42FE-68FC-89F7-BDA54644115C";
createNode transform -n "ik_frontTip" -p "ik_frontTip_group";
	rename -uid "E478F651-428C-0FBB-5993-F0A367A4F511";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "ik_frontTipShape" -p "ik_frontTip";
	rename -uid "6BB78B1A-4B6E-134E-BF37-EB9F5DD94106";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9192949363953888e-17 0.31344464995648985 -0.3134446499564898
		1.6620250738737024e-33 0.44327767502175508 -2.7142929292443649e-17
		-1.9192949363953888e-17 0.3134446499564898 0.3134446499564898
		-2.7142929292443665e-17 2.2979592950099324e-17 0.4432776750217553
		-1.9192949363953888e-17 -0.3134446499564898 0.3134446499564898
		-2.7189257911234355e-33 -0.44327767502175536 4.44034278784129e-17
		1.9192949363953888e-17 -0.3134446499564898 -0.3134446499564898
		2.7142929292443665e-17 -6.044962003119836e-17 -0.4432776750217553
		1.9192949363953888e-17 0.31344464995648985 -0.3134446499564898
		1.6620250738737024e-33 0.44327767502175508 -2.7142929292443649e-17
		-1.9192949363953888e-17 0.3134446499564898 0.3134446499564898
		;
createNode transform -n "roll_front_rigid" -p "ik_frontTip";
	rename -uid "B48CB25B-4E09-5DA5-AA02-9082472D9663";
createNode transform -n "roll_front_1" -p "roll_front_rigid";
	rename -uid "552E1DDE-404A-357B-769F-7EA53E6CE2BC";
createNode transform -n "roll_front_2" -p "roll_front_1";
	rename -uid "96CE84BD-4C35-B054-BDA7-ABA4E65178DD";
createNode transform -n "roll_front_3" -p "roll_front_2";
	rename -uid "EB1EDEC5-4C78-BC82-6403-EDBED1BA7B75";
createNode transform -n "roll_front_4" -p "roll_front_3";
	rename -uid "8250DD2F-481A-D206-45FB-D1A6B92ECA76";
createNode transform -n "roll_front_5" -p "roll_front_4";
	rename -uid "859CD27D-4BAC-2583-9E38-1193721305DD";
createNode transform -n "roll_center" -p "roll_front_5";
	rename -uid "8C07E506-4C78-AFEA-0A27-83A40361DBB2";
createNode transform -n "foot_add" -p "roll_center";
	rename -uid "03C1423F-4408-C1BD-E267-D1969B1E1529";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr ".opm" -type "matrix" 0.99999999999999933 0 0 0 0 1 0 0 0 0 0.99999999999999989 0
		 0 0 0 1;
createNode nurbsCurve -n "foot_addShape" -p "foot_add";
	rename -uid "DB54D93F-48E2-F654-95B6-D69D4E3B1C08";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 8 0 no 3
		9 0 1 2 3 4 5 6 7 8
		9
		8.4703294725430034e-21 8.4703294725430034e-21 0
		1.7728100472395878 -4.9155606540016287e-16 1.1673836776731733e-15
		2.5009529076190695 -4.9155606540016287e-16 1.1673836776731733e-15
		2.1368814774293279 -4.9155606540016287e-16 -0.36407143018974031
		1.7728100472395878 -4.9155606540016287e-16 1.1673836776731733e-15
		2.1368814774293279 -4.9155606540016287e-16 0.36407143018974319
		2.1368814774293279 -4.9155606540016287e-16 -0.36407143018974031
		2.5009529076190695 -4.9155606540016287e-16 1.1673836776731733e-15
		2.1368814774293279 -4.9155606540016287e-16 0.36407143018974319
		;
createNode transform -n "foot_fingers_gr" -p "foot_add";
	rename -uid "F32EC5D0-410A-64DD-B9D0-32BA8831E5A4";
	setAttr ".t" -type "double3" -5.9504809655041293e-05 0.46264413771093998 1.3690489767786025 ;
	setAttr ".s" -type "double3" 0.290058992151907 0.290058992151907 0.290058992151907 ;
createNode transform -n "foot_fingers" -p "foot_fingers_gr";
	rename -uid "D7CB8906-42D6-43B3-9501-23BFC850B32D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "back" -ln "back" -at "double";
	addAttr -ci true -sn "index" -ln "index" -at "double";
	addAttr -ci true -sn "middle" -ln "middle" -at "double";
	addAttr -ci true -sn "ring" -ln "ring" -at "double";
	addAttr -ci true -sn "spread" -ln "spread" -at "double";
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
	setAttr -l on ".moduleName" -type "string" "l_hand";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".internalName" -type "string" "fingers";
	setAttr -k on ".back";
	setAttr -k on ".index";
	setAttr -k on ".middle";
	setAttr -k on ".ring";
	setAttr -k on ".spread";
createNode nurbsCurve -n "foot_fingersShape" -p "foot_fingers";
	rename -uid "F0BB94CF-407A-B08D-2B24-D68E9EE5AF26";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.31087428845669 6.8354993099966067e-08 -1.310874129943685
		7.4079745131685248e-08 6.8354993099966067e-08 -1.4924121319738644
		-1.3108741402972064 6.8354993099966067e-08 -1.3108741299436826
		-1.4924121423274068 6.8354993099966067e-08 8.4433266820491657e-08
		-1.3108741402972031 6.8354993099966067e-08 1.3108742988102131
		7.4079745131685248e-08 6.8354993099966067e-08 1.4924123008404029
		1.310874288456698 6.8354993099966067e-08 1.3108742988102102
		1.4924122904868904 6.8354993099966067e-08 8.4433260250409253e-08
		1.31087428845669 6.8354993099966067e-08 -1.310874129943685
		7.4079745131685248e-08 6.8354993099966067e-08 -1.4924121319738644
		-1.3108741402972064 6.8354993099966067e-08 -1.3108741299436826
		;
createNode transform -n "finger_controls" -p "foot_add";
	rename -uid "60BD7DBD-47D1-3DE7-3F9D-B5ACF8105D10";
createNode transform -n "front_fingers_holdGroup" -p "finger_controls";
	rename -uid "E2303E5B-4873-62DF-70D9-1987E71BF5B3";
createNode transform -n "finger_1_0_group" -p "front_fingers_holdGroup";
	rename -uid "EC17D446-4AB3-2BAB-8853-E6954707BFC9";
createNode transform -n "finger_1_0_bendGroup" -p "finger_1_0_group";
	rename -uid "C4624BDD-44C0-D0C7-34C9-2E97A90364CC";
createNode transform -n "finger_1_0" -p "finger_1_0_bendGroup";
	rename -uid "F2A6DF9C-407D-53EA-F82C-1ABDEFDC9006";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode nurbsCurve -n "finger_1_0Shape" -p "finger_1_0";
	rename -uid "DB5999EF-4C4F-150F-6D07-20B02F6BD537";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252790242854e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		0.45547913297282944 0.16920118650585314 0.10917469582822695
		0.58702089701411853 0.16920118650585314 0.077198891969294761
		0.64150727969850341 0.16920118650585314 2.4726252791266007e-06
		0.58702089701411853 0.16920118650585314 -0.077193946718735126
		0.4554791329728296 0.1692011865058532 -0.10916975057766672
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252790242854e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		;
createNode transform -n "finger_1_1_group" -p "finger_1_0";
	rename -uid "562EC985-420A-5ED6-49B2-1F83AADEB0AE";
createNode transform -n "finger_1_1_bendGroup" -p "finger_1_1_group";
	rename -uid "51A73A0E-4C00-72BE-E47D-C6BFFF3BDDE5";
	setAttr ".t" -type "double3" 0 1.1102230246251565e-16 0 ;
	setAttr ".r" -type "double3" -5.3423379415207522e-16 0 0 ;
createNode transform -n "finger_1_1" -p "finger_1_1_bendGroup";
	rename -uid "D92C6952-4DA9-E061-5733-58A3CB876825";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode transform -n "finger_1_2_group" -p "finger_1_1";
	rename -uid "5DB9CE80-46A0-5883-5022-8BB96B9D7942";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_1_2_bendGroup" -p "finger_1_2_group";
	rename -uid "90B3FEDF-4871-09B9-FCDC-74BDA7DC2787";
	setAttr ".t" -type "double3" 1.3322676295501878e-15 2.2204460492503131e-16 1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_1_2" -p "finger_1_2_bendGroup";
	rename -uid "067938A6-477A-AE81-3585-48BA671D995F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_2";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_2\", per = True, d= 3,p= [[1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016], [-1.6410999453235323e-17, 0.30168100564418465, 1.3731672543988743e-17], [-9.8531916250331419e-18, 0.21332068484618016, 0.21332068484618016], [3.2103006362128536e-17, 1.1619019477200868e-16, 0.30168100564418465], [8.4880222752981204e-17, -0.21332068484618011, 0.21332068484618016], [1.1756227997006297e-16, -0.30168100564418465, 2.6318473714785471e-16], [1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode transform -n "finger_1_3_group" -p "finger_1_2";
	rename -uid "54A8BE42-42C2-5383-08C4-098D0DE3AC57";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_1_3_bendGroup" -p "finger_1_3_group";
	rename -uid "71D0AC91-4ED0-E0AF-02A9-80B2EB5AA787";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -3.5527136788005009e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999978 0.99999999999999956 ;
createNode transform -n "finger_1_3" -p "finger_1_3_bendGroup";
	rename -uid "74499AA3-45EA-0095-B1E2-01B50CFAE3F6";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_1_3Shape" -p "finger_1_3";
	rename -uid "4F5346C5-4449-8CC8-59F2-3EA6A282AF7F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		6.1538601894468885e-16 -0.34948291284593869 -0.3386253143250515
		5.4878473861629118e-16 -0.010857598520884795 -0.47888851208134131
		4.6500617067084863e-16 0.32776771580416592 -0.33862531432505166
		4.1312666397460894e-16 0.46803091356045456 -8.8145331374852863e-16
		4.2353652994100376e-16 0.32776771580416592 0.33862531432505211
		4.9013781026940449e-16 -0.010857598520884703 0.4788885120813417
		5.7391637821484517e-16 -0.34948291284593808 0.33862531432505211
		6.2579588491108412e-16 -0.489746110602225 -4.8547144976876171e-16
		6.1538601894468885e-16 -0.34948291284593869 -0.3386253143250515
		5.4878473861629118e-16 -0.010857598520884795 -0.47888851208134131
		4.6500617067084863e-16 0.32776771580416592 -0.33862531432505166
		;
createNode transform -n "finger_1_4_group" -p "finger_1_3";
	rename -uid "D14A8994-4B6E-304F-FF65-02B7E7E1E392";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_1_4_bendGroup" -p "finger_1_4_group";
	rename -uid "32A0F781-407D-475B-50A7-77A15D12DE3D";
createNode transform -n "finger_1_4" -p "finger_1_4_bendGroup";
	rename -uid "D8350D6F-4DA4-D98C-B05F-21ACFEA5A055";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_1_4Shape" -p "finger_1_4";
	rename -uid "0548B467-491A-8AC9-FA5D-E0B989AA2864";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885196 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		0.088731540479161805 0.38352259004230321 3.8686737042965593e-15
		0.088731540479161805 0.26801130717777422 0.27886890569866168
		0.088731540479161861 -0.010857598520885121 0.39438018856318918
		0.088731540479161958 -0.28972650421954455 0.27886890569866168
		0.088731540479161972 -0.40523778708407254 4.1947775849371904e-15
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885196 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		;
createNode nurbsCurve -n "finger_1_2Shape" -p "finger_1_2";
	rename -uid "E672DA65-4E19-0008-3844-8DB7AAB930A4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.4463463439741489e-18 -0.27494376176117696 -0.24877559839053529
		-4.6483171522398596e-17 -0.026168163370642955 -0.3518218252313754
		-1.0803221257525532e-16 0.22260743501989119 -0.2487755983905354
		-1.4614618331689213e-16 0.32565366186073186 -3.0810246969322391e-15
		-1.3849843660274906e-16 0.22260743501989119 0.24877559839053279
		-8.9568918736376881e-17 -0.026168163370642823 0.35182182523137417
		-2.8019877683520103e-17 -0.27494376176117663 0.24877559839053279
		1.0094093058116252e-17 -0.37798998860201749 -2.7901113452245738e-15
		2.4463463439741489e-18 -0.27494376176117696 -0.24877559839053529
		-4.6483171522398596e-17 -0.026168163370642955 -0.3518218252313754
		-1.0803221257525532e-16 0.22260743501989119 -0.2487755983905354
		;
createNode nurbsCurve -n "finger_1_1Shape" -p "finger_1_1";
	rename -uid "B9355D06-4B6D-E022-96B5-FC832DDECE8F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		0.34453989007231006 0.2858984375640829 0.18447196265816049
		0.56680538117468593 0.28589843756408284 0.13044259943730649
		0.65887076203680595 0.28589843756408284 4.177983138938278e-06
		0.56680538117468593 0.2858984375640829 -0.13043424347102867
		0.34453989007231028 0.2858984375640829 -0.18446360669188275
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		;
createNode transform -n "finger_2_0_group" -p "front_fingers_holdGroup";
	rename -uid "710DD352-4D74-B558-4A7C-6889B9F3ECD0";
createNode transform -n "finger_2_0_bendGroup" -p "finger_2_0_group";
	rename -uid "CDA4B686-4346-304D-3F58-65ABCD49D793";
createNode transform -n "finger_2_0" -p "finger_2_0_bendGroup";
	rename -uid "04EC53BC-4892-9E90-8E83-77BF626BCDE7";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode nurbsCurve -n "finger_2_0Shape" -p "finger_2_0";
	rename -uid "78DA2722-44CB-8273-A142-209D432D3D39";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252790254848e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		0.45547913297282944 0.16920118650585314 0.10917469582822695
		0.58702089701411853 0.16920118650585314 0.077198891969294761
		0.64150727969850341 0.16920118650585314 2.4726252791277937e-06
		0.58702089701411853 0.16920118650585314 -0.077193946718735126
		0.4554791329728296 0.1692011865058532 -0.10916975057766672
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252790254848e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		;
createNode transform -n "finger_2_1_group" -p "finger_2_0";
	rename -uid "7C1E02DA-4173-FEB1-85DE-EB8E476B5E41";
createNode transform -n "finger_2_1_bendGroup" -p "finger_2_1_group";
	rename -uid "7CC26625-408D-771B-26E8-B9B9D49BAFFE";
	setAttr ".t" -type "double3" 0 1.1102230246251565e-16 0 ;
	setAttr ".r" -type "double3" -5.3423379415207522e-16 -3.8167311351637514e-14 0 ;
createNode transform -n "finger_2_1" -p "finger_2_1_bendGroup";
	rename -uid "EDEE4BDB-4FBB-8980-26DC-BEAE80419569";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode transform -n "finger_2_2_group" -p "finger_2_1";
	rename -uid "43B6E704-4A0E-FA61-98D9-E88B2448DAD8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_2_2_bendGroup" -p "finger_2_2_group";
	rename -uid "62D5FE5E-4C9A-92AA-1067-A387A7C5E25E";
	setAttr ".t" -type "double3" 1.3322676295501878e-15 2.2204460492503131e-16 1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_2_2" -p "finger_2_2_bendGroup";
	rename -uid "904A8C81-4F5C-468E-68CA-C58A90B13A6D";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_2";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_2\", per = True, d= 3,p= [[1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016], [-1.6410999453235323e-17, 0.30168100564418465, 1.3731672543988743e-17], [-9.8531916250331419e-18, 0.21332068484618016, 0.21332068484618016], [3.2103006362128536e-17, 1.1619019477200868e-16, 0.30168100564418465], [8.4880222752981204e-17, -0.21332068484618011, 0.21332068484618016], [1.1756227997006297e-16, -0.30168100564418465, 2.6318473714785471e-16], [1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode transform -n "finger_2_3_group" -p "finger_2_2";
	rename -uid "CDB92852-4228-B4CB-8463-8287B8CF83C0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_2_3_bendGroup" -p "finger_2_3_group";
	rename -uid "B5D7E284-45C4-D655-4841-62A8E6E3C9D4";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -3.5527136788005009e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999978 0.99999999999999956 ;
createNode transform -n "finger_2_3" -p "finger_2_3_bendGroup";
	rename -uid "92964A7B-451F-47BF-B43F-A5A7AEEDCE9B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -4.4408920985006262e-16 -5.5511151231257827e-17 0 ;
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_2_3Shape" -p "finger_2_3";
	rename -uid "3561451B-442B-4AE0-42F1-F490397D5D0F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.0999875106776676e-16 -0.34948291284593869 -0.3386253143250515
		2.4339747073936805e-16 -0.010857598520884942 -0.47888851208134131
		1.596189027939257e-16 0.32776771580416592 -0.33862531432505166
		1.0773939609768719e-16 0.46803091356045456 -8.8145331374852863e-16
		1.1814926206408145e-16 0.32776771580416592 0.33862531432505211
		1.8475054239248183e-16 -0.010857598520884868 0.4788885120813417
		2.6852911033792347e-16 -0.34948291284593808 0.33862531432505211
		3.2040861703416232e-16 -0.489746110602225 -4.8547144976876171e-16
		3.0999875106776676e-16 -0.34948291284593869 -0.3386253143250515
		2.4339747073936805e-16 -0.010857598520884942 -0.47888851208134131
		1.596189027939257e-16 0.32776771580416592 -0.33862531432505166
		;
createNode transform -n "finger_2_4_group" -p "finger_2_3";
	rename -uid "2CF4E249-40DB-A3A5-1E3F-A18DF22A9E84";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_2_4_bendGroup" -p "finger_2_4_group";
	rename -uid "57EAE186-4FEE-A0A5-A8CB-AA80073918BE";
createNode transform -n "finger_2_4" -p "finger_2_4_bendGroup";
	rename -uid "A734EB79-4ABC-F66D-B91F-E792A3E7659E";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_2_4Shape" -p "finger_2_4";
	rename -uid "6EFE607E-4ABD-D8FE-A770-11B65D04FA8D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885196 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		0.088731540479161805 0.38352259004230321 4.0213673382350276e-15
		0.088731540479161805 0.26801130717777422 0.27886890569866168
		0.088731540479161861 -0.010857598520885121 0.39438018856318918
		0.088731540479161958 -0.28972650421954455 0.27886890569866168
		0.088731540479161972 -0.40523778708407254 4.3474712188756454e-15
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885196 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		;
createNode nurbsCurve -n "finger_2_2Shape" -p "finger_2_2";
	rename -uid "B906891F-470E-1014-BD2E-AE958EF72BEB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.1696657179782022e-16 -0.27494376176117696 -0.24877559839053529
		6.8037053931447554e-17 -0.026168163370643038 -0.3518218252313754
		6.4880128785905753e-18 0.22260743501989119 -0.2487755983905354
		-3.1625957863046173e-17 0.32565366186073186 -3.2337183308707059e-15
		-2.3978211148902978e-17 0.22260743501989119 0.24877559839053279
		2.4951306717468942e-17 -0.026168163370642903 0.35182182523137417
		8.6500347770325844e-17 -0.27494376176117663 0.24877559839053279
		1.2461431851196231e-16 -0.37798998860201749 -2.9428049791630319e-15
		1.1696657179782022e-16 -0.27494376176117696 -0.24877559839053529
		6.8037053931447554e-17 -0.026168163370643038 -0.3518218252313754
		6.4880128785905753e-18 0.22260743501989119 -0.2487755983905354
		;
createNode nurbsCurve -n "finger_2_1Shape" -p "finger_2_1";
	rename -uid "4D6C244E-49E1-4710-3EC5-13A3F39D54C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		0.34453989007231006 0.2858984375640829 0.18447196265816049
		0.56680538117468593 0.28589843756408284 0.13044259943730649
		0.65887076203680595 0.28589843756408284 4.177983138938278e-06
		0.56680538117468593 0.2858984375640829 -0.13043424347102867
		0.34453989007231028 0.2858984375640829 -0.18446360669188275
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		;
createNode transform -n "finger_3_0_group" -p "front_fingers_holdGroup";
	rename -uid "5F53AF33-4441-89CA-3F21-70AFE25E8035";
createNode transform -n "finger_3_0_bendGroup" -p "finger_3_0_group";
	rename -uid "BEC3A220-4F0B-8AE1-92C3-9591C3989F54";
createNode transform -n "finger_3_0" -p "finger_3_0_bendGroup";
	rename -uid "F780234E-4CB6-0044-EB6D-CFB383DFF0E9";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode nurbsCurve -n "finger_3_0Shape" -p "finger_3_0";
	rename -uid "BC4E4D1C-4D3D-6F7B-CCFB-2CA6F503B000";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252788715967e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		0.45547913297282944 0.16920118650585314 0.10917469582822695
		0.58702089701411853 0.16920118650585314 0.077198891969294761
		0.64150727969850341 0.16920118650585314 2.4726252789739073e-06
		0.58702089701411853 0.16920118650585314 -0.077193946718735126
		0.4554791329728296 0.1692011865058532 -0.10916975057766672
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252788715967e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		;
createNode transform -n "finger_3_1_group" -p "finger_3_0";
	rename -uid "E6C89237-4892-FDD3-5127-F2BF699D0EED";
createNode transform -n "finger_3_1_bendGroup" -p "finger_3_1_group";
	rename -uid "C715ABF1-4E6C-A5FD-C9BB-04AA786CCE1A";
	setAttr ".t" -type "double3" 0 1.1102230246251565e-16 0 ;
	setAttr ".r" -type "double3" -5.3423379415207522e-16 0 0 ;
createNode transform -n "finger_3_1" -p "finger_3_1_bendGroup";
	rename -uid "43BA925A-42C5-C161-A76C-FAABC9FDFC67";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode transform -n "finger_3_2_group" -p "finger_3_1";
	rename -uid "AAA47739-4F6B-47E0-F1DB-C6ADB2EB74EB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_3_2_bendGroup" -p "finger_3_2_group";
	rename -uid "DCD9B600-4775-7F71-7915-64B25DAEF47E";
	setAttr ".t" -type "double3" 1.3322676295501878e-15 2.2204460492503131e-16 1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_3_2" -p "finger_3_2_bendGroup";
	rename -uid "1E94AB42-44E5-458A-1199-9490DFAC5CC5";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_2";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_2\", per = True, d= 3,p= [[1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016], [-1.6410999453235323e-17, 0.30168100564418465, 1.3731672543988743e-17], [-9.8531916250331419e-18, 0.21332068484618016, 0.21332068484618016], [3.2103006362128536e-17, 1.1619019477200868e-16, 0.30168100564418465], [8.4880222752981204e-17, -0.21332068484618011, 0.21332068484618016], [1.1756227997006297e-16, -0.30168100564418465, 2.6318473714785471e-16], [1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode transform -n "finger_3_3_group" -p "finger_3_2";
	rename -uid "9326F4EC-4F09-007A-2A9E-4CBDB57C8116";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_3_3_bendGroup" -p "finger_3_3_group";
	rename -uid "FFEE1C66-4511-650E-5952-4DBD9022EA21";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -3.5527136788005009e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999978 0.99999999999999956 ;
createNode transform -n "finger_3_3" -p "finger_3_3_bendGroup";
	rename -uid "E23AEC00-4373-EAA1-CEA1-CD911207860A";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -4.4408920985006262e-16 -5.5511151231257827e-17 0 ;
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_3_3Shape" -p "finger_3_3";
	rename -uid "6B6010FE-4EC8-0D69-D79C-F3BE13865138";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.0999875106776676e-16 -0.34948291284593869 -0.3386253143250515
		2.4339747073936805e-16 -0.010857598520884942 -0.47888851208134131
		1.596189027939257e-16 0.32776771580416592 -0.33862531432505166
		1.0773939609768719e-16 0.46803091356045456 -8.8145331374852863e-16
		1.1814926206408145e-16 0.32776771580416592 0.33862531432505211
		1.8475054239248183e-16 -0.010857598520884868 0.4788885120813417
		2.6852911033792347e-16 -0.34948291284593808 0.33862531432505211
		3.2040861703416232e-16 -0.489746110602225 -4.8547144976876171e-16
		3.0999875106776676e-16 -0.34948291284593869 -0.3386253143250515
		2.4339747073936805e-16 -0.010857598520884942 -0.47888851208134131
		1.596189027939257e-16 0.32776771580416592 -0.33862531432505166
		;
createNode transform -n "finger_3_4_group" -p "finger_3_3";
	rename -uid "81ACA7B7-4EAC-AA31-E4B6-B396D50D13D5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_3_4_bendGroup" -p "finger_3_4_group";
	rename -uid "2D848ACF-4E0B-4E70-7262-0B8B404D6AA4";
createNode transform -n "finger_3_4" -p "finger_3_4_bendGroup";
	rename -uid "3A97A3EB-42BC-FD48-9473-50B1F9C7C3B5";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_3_4Shape" -p "finger_3_4";
	rename -uid "DFD4DDCA-44ED-30A3-42EA-76BCC15F1205";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885334 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		0.088731540479161805 0.38352259004230321 4.0213673382350276e-15
		0.088731540479161805 0.26801130717777422 0.27886890569866168
		0.088731540479161861 -0.010857598520885272 0.39438018856318918
		0.088731540479161958 -0.28972650421954455 0.27886890569866168
		0.088731540479161972 -0.40523778708407254 4.3474712188756454e-15
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885334 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		;
createNode nurbsCurve -n "finger_3_2Shape" -p "finger_3_2";
	rename -uid "049E72BD-4B6B-7990-9D71-D2AD64AD59E7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		7.8793163313204627e-17 -0.27494376176117696 -0.24877559839053529
		2.9863645446832279e-17 -0.026168163370642955 -0.3518218252313754
		-3.1685395606024647e-17 0.22260743501989119 -0.2487755983905354
		-6.9799366347661348e-17 0.32565366186073186 -3.2337183308707059e-15
		-6.2151619633518298e-17 0.22260743501989119 0.24877559839053279
		-1.3222101767146245e-17 -0.026168163370642823 0.35182182523137417
		4.8326939285710674e-17 -0.27494376176117663 0.24877559839053279
		8.6440910027347036e-17 -0.37798998860201749 -2.9428049791630319e-15
		7.8793163313204627e-17 -0.27494376176117696 -0.24877559839053529
		2.9863645446832279e-17 -0.026168163370642955 -0.3518218252313754
		-3.1685395606024647e-17 0.22260743501989119 -0.2487755983905354
		;
createNode nurbsCurve -n "finger_3_1Shape" -p "finger_3_1";
	rename -uid "13AE915D-4E94-74BD-48FF-FE9863D68186";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		0.34453989007231006 0.2858984375640829 0.18447196265816049
		0.56680538117468593 0.28589843756408284 0.13044259943730649
		0.65887076203680595 0.28589843756408284 4.177983138938278e-06
		0.56680538117468593 0.2858984375640829 -0.13043424347102867
		0.34453989007231028 0.2858984375640829 -0.18446360669188275
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		;
createNode transform -n "back_fingers_holdGroup" -p "finger_controls";
	rename -uid "C338B203-461C-B7CA-A009-DDB5959FB633";
createNode transform -n "finger_4_0_group" -p "back_fingers_holdGroup";
	rename -uid "32DE09C6-4B6C-2922-C680-0CBF69A59238";
createNode transform -n "finger_4_0_bendGroup" -p "finger_4_0_group";
	rename -uid "D8737C51-4F2D-AFE3-69B9-82B40BBCCDA8";
createNode transform -n "finger_4_0" -p "finger_4_0_bendGroup";
	rename -uid "345721BE-4DF2-6D99-1C3B-058108F6CF8F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode nurbsCurve -n "finger_4_0Shape" -p "finger_4_0";
	rename -uid "25DD78D7-4613-A4AA-AF29-55BD7BE5A77F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252790242854e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		0.45547913297282944 0.16920118650585314 0.10917469582822695
		0.58702089701411853 0.16920118650585314 0.077198891969294761
		0.64150727969850341 0.16920118650585314 2.4726252791266007e-06
		0.58702089701411853 0.16920118650585314 -0.077193946718735126
		0.4554791329728296 0.1692011865058532 -0.10916975057766672
		0.32393736893153946 0.1692011865058532 -0.077193946718735418
		0.24937958559732173 0.16920118650585314 2.4726252790242854e-06
		0.32393736893153929 0.16920118650585314 0.07719889196929472
		;
createNode transform -n "finger_4_1_group" -p "finger_4_0";
	rename -uid "413CCBED-4136-32EE-4F99-1C978CC7347B";
createNode transform -n "finger_4_1_bendGroup" -p "finger_4_1_group";
	rename -uid "61BAB5E9-4BC8-3272-F036-61B56038DFAD";
	setAttr ".t" -type "double3" 0 1.1102230246251565e-16 0 ;
	setAttr ".r" -type "double3" -5.3423379415207522e-16 0 0 ;
createNode transform -n "finger_4_1" -p "finger_4_1_bendGroup";
	rename -uid "03D859F1-4590-39F2-C4A4-3E8B746DA1B0";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "bend" -ln "bend" -at "double";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	addAttr -ci true -sn "default_bend" -ln "default_bend" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_1";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_1\", per = True, d= 3,p= [[0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208], [0.33067429830211631, 0.18042787392742038, 0.17704811131041906], [0.54399498314829664, 0.18042787392742032, 0.12519309456035221], [0.63235530394630102, 0.18042787392742032, 4.009845256226655e-06], [0.54399498314829675, 0.18042787392742043, -0.12518507486983965], [0.3306742983021167, 0.18042787392742049, -0.17704009161990708], [0.11735361345593626, 0.18042787392742055, -0.1251850748698399], [0.22313612793919729, 0.18042787392742049, 4.0098452561148822e-06], [0.11735361345593609, 0.18042787392742043, 0.12519309456035208]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr -k on ".bend";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
	setAttr ".default_bend" -type "string" "0.0";
createNode transform -n "finger_4_2_group" -p "finger_4_1";
	rename -uid "87C260CF-4FFA-417E-6A76-C2951E246735";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_4_2_bendGroup" -p "finger_4_2_group";
	rename -uid "9D4384EC-4963-249D-F61B-348797F27DFF";
	setAttr ".t" -type "double3" 1.3322676295501878e-15 2.2204460492503131e-16 1.7763568394002505e-15 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode transform -n "finger_4_2" -p "finger_4_2_bendGroup";
	rename -uid "BE58BBB3-433C-E3A3-A683-5DBA393E5297";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_2";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_2\", per = True, d= 3,p= [[1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016], [-1.6410999453235323e-17, 0.30168100564418465, 1.3731672543988743e-17], [-9.8531916250331419e-18, 0.21332068484618016, 0.21332068484618016], [3.2103006362128536e-17, 1.1619019477200868e-16, 0.30168100564418465], [8.4880222752981204e-17, -0.21332068484618011, 0.21332068484618016], [1.1756227997006297e-16, -0.30168100564418465, 2.6318473714785471e-16], [1.1100447214186143e-16, -0.21332068484618036, -0.21332068484618011], [6.904827415469909e-17, 5.9706015661510766e-17, -0.30168100564418465], [1.6271057763846441e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode transform -n "finger_4_3_group" -p "finger_4_2";
	rename -uid "A3EAD2F3-4504-A8F5-5BD4-BFB7E0D53475";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_4_3_bendGroup" -p "finger_4_3_group";
	rename -uid "665F4842-48C1-BE6A-EEE5-4E96E3FE8550";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -3.5527136788005009e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999978 0.99999999999999956 ;
createNode transform -n "finger_4_3" -p "finger_4_3_bendGroup";
	rename -uid "C548E460-4B86-56FE-0562-5EB2C55552F6";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -4.4408920985006262e-16 -5.5511151231257827e-17 0 ;
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_4_3Shape" -p "finger_4_3";
	rename -uid "A0EFED0C-4D53-667E-4398-0483AA5C73EE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.0999875106776676e-16 -0.34948291284593869 -0.3386253143250515
		2.4339747073936805e-16 -0.010857598520884942 -0.47888851208134131
		1.596189027939257e-16 0.32776771580416592 -0.33862531432505166
		1.0773939609768719e-16 0.46803091356045456 -8.8147195310814169e-16
		1.1814926206408145e-16 0.32776771580416592 0.33862531432505211
		1.8475054239248183e-16 -0.010857598520884868 0.4788885120813417
		2.6852911033792347e-16 -0.34948291284593808 0.33862531432505211
		3.2040861703416232e-16 -0.489746110602225 -4.8549008912837231e-16
		3.0999875106776676e-16 -0.34948291284593869 -0.3386253143250515
		2.4339747073936805e-16 -0.010857598520884942 -0.47888851208134131
		1.596189027939257e-16 0.32776771580416592 -0.33862531432505166
		;
createNode transform -n "finger_4_4_group" -p "finger_4_3";
	rename -uid "F4AE681D-4DD8-0A8F-F487-5F83BE8431D1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".rp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr ".sp" -type "double3" -1.2325951644078309e-32 0 0 ;
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
createNode transform -n "finger_4_4_bendGroup" -p "finger_4_4_group";
	rename -uid "0B4E3924-4815-A9F1-EEB0-A79A1D1E0677";
createNode transform -n "finger_4_4" -p "finger_4_4_bendGroup";
	rename -uid "75523FE0-4E36-ECAB-3F62-5E97E2AA0368";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on ".internalName" -type "string" "element_3";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".moduleName" -type "string" "l_finger_2";
	setAttr -l on ".customShapeCommand" -type "string" "[u'cmds.curve(name = \"element_3\", per = True, d= 3,p= [[6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016], [-6.6986639711649121e-17, 0.30168100564418465, 1.3731672543988743e-17], [-6.042883188344704e-17, 0.21332068484618016, 0.21332068484618016], [-1.8472633896285289e-17, 9.0902374642801772e-17, 0.30168100564418465], [3.4304582494567317e-17, -0.21332068484618011, 0.21332068484618016], [6.6986639711649109e-17, -0.30168100564418465, 2.6318473714785471e-16], [6.0428831883447052e-17, -0.21332068484618036, -0.21332068484618011], [1.8472633896285268e-17, 3.4418195532303825e-17, -0.30168100564418465], [-3.4304582494567342e-17, 0.21332068484618016, -0.21332068484618016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "-0.0";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode nurbsCurve -n "finger_4_4Shape" -p "finger_4_4";
	rename -uid "C96C167E-4F43-0BE1-A661-349DC7B70AF1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885334 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		0.088731540479161805 0.38352259004230321 4.0213673382350276e-15
		0.088731540479161805 0.26801130717777422 0.27886890569866168
		0.088731540479161861 -0.010857598520885272 0.39438018856318918
		0.088731540479161958 -0.28972650421954455 0.27886890569866168
		0.088731540479161972 -0.40523778708407254 4.3474712188756454e-15
		0.088731540479161972 -0.28972650421954493 -0.27886890569865874
		0.08873154047916193 -0.010857598520885334 -0.39438018856318746
		0.088731540479161861 0.26801130717777422 -0.27886890569865902
		;
createNode nurbsCurve -n "finger_4_2Shape" -p "finger_4_2";
	rename -uid "EF0D2916-47CA-4F90-E7C3-478FA09899C1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.1696657179782022e-16 -0.27494376176117696 -0.24877559839053529
		6.8037053931447554e-17 -0.026168163370643038 -0.3518218252313754
		6.4880128785905753e-18 0.22260743501989119 -0.2487755983905354
		-3.1625957863046173e-17 0.32565366186073186 -3.2336996915110971e-15
		-2.3978211148902978e-17 0.22260743501989119 0.24877559839053279
		2.4951306717468942e-17 -0.026168163370642903 0.35182182523137417
		8.6500347770325844e-17 -0.27494376176117663 0.24877559839053279
		1.2461431851196231e-16 -0.37798998860201749 -2.9427863398034144e-15
		1.1696657179782022e-16 -0.27494376176117696 -0.24877559839053529
		6.8037053931447554e-17 -0.026168163370643038 -0.3518218252313754
		6.4880128785905753e-18 0.22260743501989119 -0.2487755983905354
		;
createNode nurbsCurve -n "finger_4_1Shape" -p "finger_4_1";
	rename -uid "A83E3A47-4978-901A-5520-E4AFABA4B784";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		0.34453989007231006 0.2858984375640829 0.18447196265816049
		0.56680538117468593 0.28589843756408284 0.13044259943730649
		0.65887076203680595 0.28589843756408284 4.177983138938278e-06
		0.56680538117468593 0.2858984375640829 -0.13043424347102867
		0.34453989007231028 0.2858984375640829 -0.18446360669188275
		0.12227439896993464 0.2858984375640829 -0.13043424347102894
		0.2324925081449539 0.2858984375640829 4.1779831388218118e-06
		0.12227439896993454 0.2858984375640829 0.13044259943730641
		;
createNode transform -n "target" -p "foot_add";
	rename -uid "D7AD994F-4345-DAAD-46E3-5DB87EDE635F";
	setAttr ".v" no;
createNode locator -n "targetShape" -p "target";
	rename -uid "A5154480-4550-F728-8E0F-EB92E9C78A70";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "system" -p "mod";
	rename -uid "67F71184-4957-40F4-E804-AFB02E8BCD58";
createNode transform -n "output" -p "mod";
	rename -uid "1F93D2E3-4539-EEA2-E477-BBAA1EFE5DD2";
	setAttr ".v" no;
createNode transform -n "ik_out" -p "output";
	rename -uid "CBE26731-4A2E-78F9-6E52-DE9DBBD4539F";
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "53FB5BF6-4D9D-AEB8-5AB5-9F8F56849ED2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "outJoints" -p "output";
	rename -uid "5213A793-4507-6F8E-7674-E0AD317953C9";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "DAE29FF0-4D91-E511-9CBF-A2A14C3A3065";
	setAttr ".ssc" no;
createNode joint -n "finger_1_0_outJoint" -p "root_outJoint";
	rename -uid "9C13F4E6-4C3C-C798-0395-9EB5DB49BC69";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_1_1_outJoint" -p "finger_1_0_outJoint";
	rename -uid "C1349EE3-458E-AD0C-7A47-458BF751F048";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_1_2_outJoint" -p "finger_1_1_outJoint";
	rename -uid "85F0C592-40F9-E83F-0CE3-C08384BECB5D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.9427868319239199 1.80912942368806 7.2654377815747191 1;
createNode joint -n "finger_1_3_outJoint" -p "finger_1_2_outJoint";
	rename -uid "069863A0-4834-7B3D-4E41-B19F6A9020D4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 6.5990670374584965 2.3076223839850249 11.343522735302944 1;
createNode joint -n "finger_1_4_outJoint" -p "finger_1_3_outJoint";
	rename -uid "AFB0C700-4362-2001-CE21-49A933363C3E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.27698974135621812 0.0034499997978726321 1.7086637570047203 0
		 -0.0019428186191328856 1.7309688519184483 -0.003180088147917458 0 -1.7086661354565151 -0.0014089024842245121 0.27699297166997167 0
		 2.2694130648544819 0.37860540189256631 3.7479905634402373 1;
createNode joint -n "finger_2_0_outJoint" -p "root_outJoint";
	rename -uid "4E532168-494D-F7CC-7C7E-569B07503E24";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_2_1_outJoint" -p "finger_2_0_outJoint";
	rename -uid "69D46B49-4107-4AA1-E95C-009B1DED21D1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_2_2_outJoint" -p "finger_2_1_outJoint";
	rename -uid "921041DF-425A-D0A1-51DF-7280777E5F68";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.9427868319239199 1.80912942368806 7.2654377815747191 1;
createNode joint -n "finger_2_3_outJoint" -p "finger_2_2_outJoint";
	rename -uid "75F51EFB-4CBD-B31E-E493-D29AB382BBD5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 6.5990670374584965 2.3076223839850249 11.343522735302944 1;
createNode joint -n "finger_2_4_outJoint" -p "finger_2_3_outJoint";
	rename -uid "8A6C10D3-447F-C5E9-9DB0-3D81ED693874";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.27698974135621812 0.0034499997978726321 1.7086637570047203 0
		 -0.0019428186191328856 1.7309688519184483 -0.003180088147917458 0 -1.7086661354565151 -0.0014089024842245121 0.27699297166997167 0
		 2.2694130648544819 0.37860540189256631 3.7479905634402373 1;
createNode joint -n "finger_3_0_outJoint" -p "root_outJoint";
	rename -uid "4BFD75F5-40F6-1387-F686-7DBB35E3C506";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_3_1_outJoint" -p "finger_3_0_outJoint";
	rename -uid "2FA749D9-48A1-DF06-5DA0-6EA238B54E9B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_3_2_outJoint" -p "finger_3_1_outJoint";
	rename -uid "6FA85A6D-4503-CF3B-0367-C19FC6F06CD5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.9427868319239199 1.80912942368806 7.2654377815747191 1;
createNode joint -n "finger_3_3_outJoint" -p "finger_3_2_outJoint";
	rename -uid "67211879-4065-0F83-4BCF-968CF219D097";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 6.5990670374584965 2.3076223839850249 11.343522735302944 1;
createNode joint -n "finger_3_4_outJoint" -p "finger_3_3_outJoint";
	rename -uid "73E0E83B-4B4C-2783-E688-F0A9E855EED3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.27698974135621812 0.0034499997978726321 1.7086637570047203 0
		 -0.0019428186191328856 1.7309688519184483 -0.003180088147917458 0 -1.7086661354565151 -0.0014089024842245121 0.27699297166997167 0
		 2.2694130648544819 0.37860540189256631 3.7479905634402373 1;
createNode joint -n "finger_4_0_outJoint" -p "root_outJoint";
	rename -uid "82FD1755-4098-F96F-DA70-42855A3CDA87";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_4_1_outJoint" -p "finger_4_0_outJoint";
	rename -uid "A964E409-4E45-11D8-36E1-12A4E10D6CDB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.2702842452940368 1.6866689930622858 3.0877788961291031 1;
createNode joint -n "finger_4_2_outJoint" -p "finger_4_1_outJoint";
	rename -uid "2E25072D-46EF-D5C2-84B9-AD91F98224BB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 5.9427868319239199 1.80912942368806 7.2654377815747191 1;
createNode joint -n "finger_4_3_outJoint" -p "finger_4_2_outJoint";
	rename -uid "B16E5464-4BE9-4A22-EC3A-5D8DE25EB0F3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.84203541166441209 -0.013318862156903961 5.2302869264293816 0
		 -0.00051805286376652073 5.2976332304146023 0.013573761173861821 0 -5.2303038589061446 -0.0026689477364918958 0.8420313412181335 0
		 6.5990670374584965 2.3076223839850249 11.343522735302944 1;
createNode joint -n "finger_4_4_outJoint" -p "finger_4_3_outJoint";
	rename -uid "55FF614F-4416-7962-C253-33B45B91F1BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ovc" 16;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.27698974135621812 0.0034499997978726321 1.7086637570047203 0
		 -0.0019428186191328856 1.7309688519184483 -0.003180088147917458 0 -1.7086661354565151 -0.0014089024842245121 0.27699297166997167 0
		 2.2694130648544819 0.37860540189256631 3.7479905634402373 1;
createNode transform -s -n "persp";
	rename -uid "F921EAA9-4502-8B0D-4008-3CAC313597E1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 10.28480635753415 4.2998673446621245 2.3748147391469874 ;
	setAttr ".r" -type "double3" -14.999999999979151 74.399999999977453 2.956787151447403e-15 ;
	setAttr ".rp" -type "double3" 7.7715611723760958e-16 9.3924867883288243e-14 3.0198066269804258e-14 ;
	setAttr ".rpt" -type "double3" -1.0992890654171976e-16 4.8430186591755061e-15 -3.063514319172062e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "71CACD7C-4D6F-A019-F750-73914A7C0D25";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 11.244326400171145;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.020778610226360406 0.19337672437809861 -0.71035355131985978 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9868B001-47C3-0EBB-B0EE-8B96FEC4A30B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.17974005891954614 7.5278234736756655 -0.67199902659733279 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "BDCCCF88-4D68-C8B7-68B5-5EAAAADC5E82";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.6780665491133187;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F750A30C-41C7-909C-24CF-97A9A787658F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.93024269372038482 1.500849223917877 -8.2714450761729559 ;
	setAttr ".r" -type "double3" 0 180 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "47D25636-428B-BB2B-E1D5-A9866B5FD60A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.2127092655310978;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "AE19EFD1-4DF0-F1BC-CE2E-FE81C358D108";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5.2824657749872381 1.5008491863771252 -2.0587374407824779 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "A13D6213-4298-109B-2D3E-878C845B1910";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.2127092655310978;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode decomposeMatrix -n "decomposeMatrix235";
	rename -uid "F7AF8990-447D-3702-571A-5D89B7334C8D";
createNode reverse -n "reverse174";
	rename -uid "BA669BC0-4A47-00D4-472E-948996D60BBF";
createNode decomposeMatrix -n "decomposeMatrix191";
	rename -uid "64800899-479A-56C1-E7D8-659CFF4F658D";
createNode multMatrix -n "multMatrix161";
	rename -uid "D7FC7943-4C70-84E5-1639-D2B4F135D926";
	setAttr -s 2 ".i";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "B745595C-43E1-EE26-B7B8-8C8EEFE3D67C";
	setAttr -s 81 ".lnk";
	setAttr -s 81 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "5B3E1022-4B9F-D3E7-54D7-01A48CFD4636";
createNode displayLayer -n "defaultLayer";
	rename -uid "19CE01F8-4DF6-369B-03C9-E4ACC39F3E53";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "390ECC3C-4379-4FF5-1516-41BC397049CF";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "281C2244-47AF-B8DB-A19E-3DB775F64F4B";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "D5CCF0FB-40BC-E332-A00F-168691F83CE9";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 100 -ast -10 -aet 100 ";
	setAttr ".st" 6;
createNode multMatrix -n "multMatrix192";
	rename -uid "6C3B0E88-4B7B-6148-33B8-F89B40F671AD";
	setAttr -s 3 ".i";
createNode decomposeMatrix -n "decomposeMatrix238";
	rename -uid "3E6DA095-458D-2455-AE4F-18A4A56C77FF";
createNode multMatrix -n "multMatrix193";
	rename -uid "9173D8B5-40A1-6375-3CF8-EABE90F28B81";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix239";
	rename -uid "1A92A101-4740-D468-E474-A0BE201CAE70";
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "3A35960E-473D-142C-CB69-DD923C748849";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "moduleControlSet";
	rename -uid "FBA53D8F-412A-D5EC-8DD5-E0ADED0ACFAC";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode condition -n "mirror_condition";
	rename -uid "A507E24C-4C69-0A52-56D9-FAA423D4746D";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 180 ;
	setAttr ".cf" -type "float3" 1 180 0 ;
createNode objectSet -n "sets";
	rename -uid "09CB26A3-46F7-1FCD-6FC0-DC895903664C";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode composeMatrix -n "composeMatrix2";
	rename -uid "1C8BFA6E-4FAA-1282-ED08-CCB0233CFE5E";
createNode objectSet -n "ikFkSwitchSet";
	rename -uid "11BC887D-47B9-BB3D-F153-7B86CBF5C9A2";
	setAttr ".ihi" 0;
	setAttr -s 6 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "decomposeMatrix247";
	rename -uid "C95383D4-4ECD-C0DF-728C-9A8D4E9D0054";
createNode multMatrix -n "ik_connector_multMatrix";
	rename -uid "390C3D70-4102-5DF7-BE03-F1922844FF5E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ik_connector_decMat";
	rename -uid "CD21675D-4BEF-94FC-85DE-8D822F63A43B";
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "57BFCAC3-4255-FF2A-942E-F3911A3086F5";
createNode multDoubleLinear -n "multDoubleLinear1622";
	rename -uid "C8F16D32-44B3-D9D5-C9A7-9FB69FA58597";
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
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "E7002A4B-4F66-5DE9-D24B-1FB5B1A4599B";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "00085EAA-44F1-B1FF-09A8-3C823F7235F0";
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
	setAttr -s 2 ".inCurveArray";
	setAttr -s 2 ".outMeshArray";
createNode multiplyDivide -n "multiplyDivide6";
	rename -uid "FBEAA6E7-4BF3-537D-4DAD-88A651F3E4A2";
createNode objectSet -n "skinJointsSet";
	rename -uid "0F065F41-4375-936D-9DEF-3DA149A32A55";
	setAttr ".ihi" 0;
	setAttr -s 21 ".dsm";
createNode network -n "picker_pkrData";
	rename -uid "AB9E9222-41A5-E32F-ED26-2E8E42C05FB2";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "data" -ln "data" -dt "string";
	setAttr -l on ".type" -type "string" "rs_pickerNode";
	setAttr -l on ".data" -type "string" (
		"(dp1\nVlayers\np2\n(lp3\n(dp4\nVindex\np5\nI0\nsVlocked\np6\nI00\nsVname\np7\nVdefault\np8\nsVvisibility\np9\nI01\nsVpath\np10\nNsa(dp11\ng5\nI2\nsg6\nI00\nsg7\nVfk\np12\nsg9\nI01\nsg10\nNsa(dp13\ng5\nI5\nsg6\nI00\nsg7\nVoffset\np14\nsg9\nI01\nsg10\nNsa(dp15\ng5\nI5\nsg6\nI00\nsg7\nVik\np16\nsg9\nI01\nsg10\nNsa(dp17\ng5\nI5\nsg6\nI00\nsg7\nVhidden\np18\nsg9\nI00\nsg10\nNsasVuseNode\np19\nI01\nsVautorun_ext_scripts\np20\n(lp21\nsVtabs\np22\n(lp23\n(dp24\ng5\nI0\nsg7\nVbody\np25\nsVitems\np26\n(lp27\n(dp28\nS'layer'\np29\nVdefault\np30\nsS'color'\np31\n(I150\nI150\nI150\nI180\ntp32\nsS'text'\np33\nS'M'\nsS'height'\np34\nI20\nsS'visible'\np35\nI01\nsS'text_opacity'\np36\nI255\nsS'radius'\np37\nI20\nsS'text_size'\np38\nF-1\nsS'init_script'\np39\nNsS'rmb_scripts'\np40\n(lp41\nsS'script'\np42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000aif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.mirror()\\u000aelse:\\u000a    mel.eval('human_mirrorPose -mirror \"%s\"' %ns)\\u000a\\u000a\\u000a\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000afor item in self.view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000aself.view.scene().update()\n"
		+ "p43\nsS'mirrored'\np44\nI00\nsS'width'\np45\nI24\nsS'handles'\np46\n(lp47\n(lp48\nF14.142135623730951\naF14.142135623730951\naa(lp49\nF14.142135623730951\naF-14.142135623730949\naa(lp50\nF-14.142135623730949\naF-14.142135623730955\naa(lp51\nF-14.142135623730955\naF14.142135623730947\naasS'path_type'\np52\nVlinear\np53\nsS'opacity'\np54\nI255\nsS'selectionOnClick'\np55\nI00\nsS'squash'\np56\nF1\nsS'text_color'\np57\n(I30\nI30\nI30\nI255\ntp58\nsS'slider'\np59\nNsS'rotate'\np60\nI0\nsS'slider_objects'\np61\n(dp62\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssS'rmb_items'\np63\n(lp64\nsS'name'\np65\nVbody_mirror\np66\nsS'flipped'\np67\nI00\nsS'shape_type'\np68\nVrect\np69\nsS'position'\np70\n(lp71\nF96\naF-194\nasa(dp72\ng29\nVdefault\np73\nsg31\n(I150\nI150\nI150\nI180\ntp74\nsg33\nS'S'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp75\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000aif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.symmetry()\\u000aelse:\\u000a    ns = self.namespace\\u000a    mel.eval('human_mirrorPose -symmetrical \"%s\"' %ns)\\u000a\\u000a\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000afor item in self.view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000aself.view.scene().update()\n"
		+ "p76\nsg44\nI00\nsg45\nI24\nsg46\n(lp77\n(lp78\nF14.142135623730951\naF14.142135623730951\naa(lp79\nF14.142135623730951\naF-14.142135623730949\naa(lp80\nF-14.142135623730949\naF-14.142135623730955\naa(lp81\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np82\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp83\nsg59\nNsg60\nI0\nsg61\n(dp84\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp85\nsg65\nVbody_sym\np86\nsg67\nI00\nsg68\nVrect\np87\nsg70\n(lp88\nF123\naF-194\nasa(dp89\ng29\nVdefault\np90\nsg31\n(I150\nI150\nI150\nI180\ntp91\nsg33\nS'R'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp92\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000amel.eval('resetToDefaultValues;')\\u000a'''\\u000atry:\\u000a    import rigStudio_picker.animTools.rs_keepPos\\u000a    rigStudio_picker.animTools.rs_keepPos.loadPos()\\u000aexcept:\\u000a    import rigStudio2.animTools.rs_keepPos\\u000a    rigStudio2.animTools.rs_keepPos.loadPos()\\u000a\\u000asel = cmds.ls(sl=1)\\u000aif sel:\\u000a    name = sel[0].split(':')[-1]\\u000a    ns = sel[0].split(name)[0]\\u000a\\u000a    for item in self.view.items:\\u000a        for c in item.controls:\\u000a            if ns+c in sel:\\u000a                item.reset_slider()\\u000a'''\\u000a\\u000ans = self.namespace\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000afor item in self.view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000aself.view.scene().update()\\u000a\n"
		+ "p93\nsg44\nI00\nsg45\nI24\nsg46\n(lp94\n(lp95\nF14.142135623730951\naF14.142135623730951\naa(lp96\nF14.142135623730951\naF-14.142135623730949\naa(lp97\nF-14.142135623730949\naF-14.142135623730955\naa(lp98\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np99\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp100\nsg59\nNsg60\nI0\nsg61\n(dp101\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp102\nsg65\nVbody_reset\np103\nsg67\nI00\nsg68\nVrect\np104\nsg70\n(lp105\nF150\naF-194\nasa(dp106\ng29\nVhidden\np107\nsg31\n(I119\nI126\nI126\nI180\ntp108\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp109\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np110\nsS'controls'\np111\n(lp112\nVl_thumb\np113\naVl_hand_thumbFinger\np114\nasg45\nI40\nsg46\n(lp115\n(lp116\nF14.142135623730951\naF14.142135623730951\naa(lp117\nF14.142135623730951\naF-14.142135623730949\naa(lp118\nF-14.142135623730949\naF-14.142135623730955\n"
		+ "aa(lp119\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np120\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp121\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp122\nsg65\nVhand_finger_5\np123\nsg67\nI00\nsg68\nVcircle\np124\nsg70\n(lp125\nF156.86235583894677\naF28.323581620213737\nasa(dp126\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp127\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp128\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np129\nsg111\n(lp130\nVl_finger1\np131\naVl_hand_indexFinger\np132\naVl_f_foot_thumbFinger\np133\naVl_handFingerA\np134\nasg45\nI40\nsg46\n(lp135\n(lp136\nF14.142135623730951\naF14.142135623730951\naa(lp137\nF14.142135623730951\naF-14.142135623730949\naa(lp138\nF-14.142135623730949\naF-14.142135623730955\naa(lp139\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np140\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp141\nV1\nNsV3\n"
		+ "NsV2\nNsV5\nNsV4\nNssg63\n(lp142\nsg65\nVhand_finger_4\np143\nsg67\nI00\nsg68\nVcircle\np144\nsg70\n(lp145\nF154.01902846782264\naF47.754425339283955\nasa(dp146\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp147\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp148\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np149\nsg111\n(lp150\nVl_fingerB\np151\nasg45\nI40\nsg46\n(lp152\n(lp153\nF14.142135623730951\naF14.142135623730951\naa(lp154\nF14.142135623730951\naF-14.142135623730949\naa(lp155\nF-14.142135623730949\naF-14.142135623730955\naa(lp156\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np157\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp158\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp159\nsg65\nVhand_finger_3\np160\nsg67\nI00\nsg68\nVcircle\np161\nsg70\n(lp162\nF141.83198593038537\naF62.217068168522033\nasa(dp163\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp164\nsg34\nI20\nsg35\nI00\nsg37\n"
		+ "I7\nsg44\nI00\nsg39\nNsg40\n(lp165\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np166\nsg111\n(lp167\nVl_fingerA\np168\nasg45\nI40\nsg46\n(lp169\n(lp170\nF14.142135623730951\naF14.142135623730951\naa(lp171\nF14.142135623730951\naF-14.142135623730949\naa(lp172\nF-14.142135623730949\naF-14.142135623730955\naa(lp173\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np174\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp175\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp176\nsg65\nVhand_finger_2\np177\nsg67\nI00\nsg68\nVcircle\np178\nsg70\n(lp179\nF123.7824166879206\naF69.088857888966999\nasa(dp180\ng29\nVdefault\np181\nsg31\n(I146\nI141\nI115\nI180\ntp182\nsg33\nS' '\nsg34\nI12\nsg35\nI01\nsg36\nI255\nsg37\nI52\nsg111\n(lp183\nVtransform\np184\naVposCtrl\np185\nasg38\nF-1\nsg39\nNsg40\n(lp186\nsg42\nNsg44\nI00\nsg45\nI49\nsg46\n(lp187\n(lp188\nF14.142135623730951\naF14.142135623730951\naa(lp189\nF14.142135623730951\n"
		+ "aF-14.142135623730949\naa(lp190\nF-14.142135623730949\naF-14.142135623730955\naa(lp191\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np192\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp193\nsg59\nNsg60\nI0\nsg61\n(dp194\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp195\nsg65\nVmain\np196\nsg67\nI00\nsg68\nVrect\np197\nsg70\n(lp198\nF110.40187357324737\naF-170.52068905475753\nasa(dp199\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp200\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp201\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np202\nsg111\n(lp203\nVr_thumb\np204\naVr_hand_thumbFinger\np205\nasg45\nI40\nsg46\n(lp206\n(lp207\nF-14.142135623730951\naF14.142135623730951\naa(lp208\nF-14.142135623730951\naF-14.142135623730949\naa(lp209\nF14.142135623730949\naF-14.142135623730955\naa(lp210\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np211\nsg54\nI255\nsg55\nI01\n"
		+ "sg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp212\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp213\nsg65\nVhand_finger_5_MIRROR\np214\nsg67\nI01\nsg68\nVcircle\np215\nsg70\n(lp216\nF-156.86235583894677\naF28.323581620213737\nasa(dp217\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp218\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp219\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np220\nsg111\n(lp221\nVr_finger1\np222\naVr_hand_indexFinger\np223\naVr_f_foot_thumbFinger\np224\naVr_handFingerA\np225\nasg45\nI40\nsg46\n(lp226\n(lp227\nF-14.142135623730951\naF14.142135623730951\naa(lp228\nF-14.142135623730951\naF-14.142135623730949\naa(lp229\nF14.142135623730949\naF-14.142135623730955\naa(lp230\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np231\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp232\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp233\nsg65\nVhand_finger_4_MIRROR\np234\nsg67\nI01\nsg68\nVcircle\n"
		+ "p235\nsg70\n(lp236\nF-154.01902846782264\naF47.754425339283955\nasa(dp237\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp238\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp239\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np240\nsg111\n(lp241\nVr_fingerB\np242\nasg45\nI40\nsg46\n(lp243\n(lp244\nF-14.142135623730951\naF14.142135623730951\naa(lp245\nF-14.142135623730951\naF-14.142135623730949\naa(lp246\nF14.142135623730949\naF-14.142135623730955\naa(lp247\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np248\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp249\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp250\nsg65\nVhand_finger_3_MIRROR\np251\nsg67\nI01\nsg68\nVcircle\np252\nsg70\n(lp253\nF-141.83198593038537\naF62.217068168522033\nasa(dp254\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp255\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp256\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\n"
		+ "p257\nsg111\n(lp258\nVr_fingerA\np259\nasg45\nI40\nsg46\n(lp260\n(lp261\nF-14.142135623730951\naF14.142135623730951\naa(lp262\nF-14.142135623730951\naF-14.142135623730949\naa(lp263\nF14.142135623730949\naF-14.142135623730955\naa(lp264\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np265\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp266\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp267\nsg65\nVhand_finger_2_MIRROR\np268\nsg67\nI01\nsg68\nVcircle\np269\nsg70\n(lp270\nF-123.7824166879206\naF69.088857888966999\nasa(dp271\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp272\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp273\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np274\nsg111\n(lp275\nVl_finger4\np276\nasg45\nI40\nsg46\n(lp277\n(lp278\nF14.142135623730951\naF14.142135623730951\naa(lp279\nF14.142135623730951\naF-14.142135623730949\naa(lp280\nF-14.142135623730949\naF-14.142135623730955\n"
		+ "aa(lp281\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np282\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp283\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp284\nsg65\nVhand_finger_1\np285\nsg67\nI00\nsg68\nVcircle\np286\nsg70\n(lp287\nF105.16923949707478\naF66.477791247679306\nasa(dp288\ng29\ng107\nsg31\n(I119\nI126\nI126\nI180\ntp289\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp290\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np291\nsg111\n(lp292\nVr_finger4\np293\nasg45\nI40\nsg46\n(lp294\n(lp295\nF-14.142135623730951\naF14.142135623730951\naa(lp296\nF-14.142135623730951\naF-14.142135623730949\naa(lp297\nF14.142135623730949\naF-14.142135623730955\naa(lp298\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np299\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp300\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp301\nsg65\nVhand_finger_1_MIRROR\np302\nsg67\nI01\nsg68\n"
		+ "Vcircle\np303\nsg70\n(lp304\nF-105.16923949707478\naF66.477791247679306\nasa(dp305\ng29\nVhidden\np306\nsg31\n(I119\nI126\nI126\nI180\ntp307\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp308\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np309\nsg111\n(lp310\nVhead_control\np311\nasg45\nI40\nsg46\n(lp312\n(lp313\nF-2.2103705565471459\naF6.383907291102858\naa(lp314\nF5.238003578082858\naF-1.2273405825128545\naa(lp315\nF-2.3732442955328561\naF-8.6757147171428599\naa(lp316\nF-9.8216184301628573\naF-1.0644668435271474\naasg52\nVlinear\np317\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp318\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp319\nsg65\nVhead_control\np320\nsg67\nI00\nsg68\nVpolygon\np321\nsg70\n(lp322\nF102.42387030164599\naF-118.85430260797381\nasa(dp323\ng29\nVdefault\np324\nsg31\n(I255\nI85\nI127\nI180\ntp325\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp326\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.objExists(ns+'character.clothControls'):\\u000a    v = cmds.getAttr(ns+'character.clothControls')\\u000a    cmds.setAttr(ns+'character.clothControls', not v)\\u000a    if cmds.objExists(ns+'character.skirtControls'):\\u000a        cmds.setAttr(ns+'character.skirtControls', not v)\\u000a\\u000a    if not v: self.polygon.opacity = 255\\u000a    else: self.polygon.opacity = 100\\u000a\\u000a    self.view.scene().update()\\u000a    self.view.update()\\u000a\n"
		+ "p327\nsg44\nI00\nsg45\nI40\nsg46\n(lp328\n(lp329\nF0\naF0\naa(lp330\nF0\naF35\naa(lp331\nF42\naF35\naa(lp332\nF42\naF0\naasg52\nVlinear\np333\nsg54\nI100\nsg55\nI00\nsS'image_path'\np334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/dress_icon.png\np335\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp336\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp337\nsg65\nVcloth_icon\np338\nsg67\nI00\nsg68\nVpolygon\np339\nsg70\n(lp340\nF88\naF-245\nasa(dp341\ng29\nVdefault\np342\nsg31\n(I255\nI85\nI127\nI180\ntp343\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp344\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000a# namespace\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    v = cmds.getAttr(ns+'character.bodyControls')\\u000a    cmds.setAttr(ns+'character.bodyControls', not v)\\u000aelse:\\u000a    v = cmds.getAttr(ns+'character.controls')\\u000a    cmds.setAttr(ns+'character.controls', not v)\\u000a\\u000aif not v: self.polygon.opacity = 255\\u000aelse: self.polygon.opacity = 100\\u000a\\u000aself.view.scene().update()\\u000aself.view.update()\\u000a\n"
		+ "p345\nsg44\nI00\nsg45\nI40\nsg46\n(lp346\n(lp347\nF0\naF0\naa(lp348\nF0\naF34\naa(lp349\nF28\naF34\naa(lp350\nF28\naF0\naasg52\nVlinear\np351\nsg54\nI255\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/face_icon.png\np352\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp353\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp354\nsg65\nVface_icon\np355\nsg67\nI00\nsg68\nVpolygon\np356\nsg70\n(lp357\nF62\naF-244\nasa(dp358\ng29\nVdefault\np359\nsg31\n(I146\nI107\nI102\nI180\ntp360\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp361\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000aimport importlib\\u000aimport rs_switchIkFk\\u000aimportlib.reload (rs_switchIkFk)\\u000ars_switchIkFk.switchAnimation(match=False)\\u000a\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000aview = self\\u000a\\u000afor item in view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000a\\u000a\\u000aview.scene().update()\n"
		+ "p362\nasg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000asel = cmds.ls(sl=1)\\u000aif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"pig\"]:\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk(snap=False)\\u000aelif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"dog\", \"penguin\", \"cat\", \"bearFemale\", \"hare\", \"panda\"]:\\u000a    mel.eval('humanAnimaccord_switchFkIk')\\u000aelif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk(snap=False)\\u000aelse:\\u000a    mel.eval(\"human_switchFkIk -sl;\")\\u000a\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000afor item in self.view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000a\\u000a\\u000aself.view.scene().update()\n"
		+ "p363\nsg44\nI00\nsg45\nI40\nsg46\n(lp364\n(lp365\nF-3.668790635695538\naF10.596060112804469\naa(lp366\nF8.69408001300447\naF-2.0371496637044642\naa(lp367\nF-3.9391297635044662\naF-14.400020312404473\naa(lp368\nF-16.302000412204475\naF-1.7668105358955399\naasg52\nVlinear\np369\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp370\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp371\nVswitch animation\np372\nasg65\nVikFkSwitch\np373\nsg67\nI00\nsg68\nVpolygon\np374\nsg70\n(lp375\nF-141.24789257622911\naF-150\nasa(dp376\ng29\nVdefault\np377\nsg31\n(I89\nI139\nI101\nI180\ntp378\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp379\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000aimport importlib\\u000aimport rs_switchIkFk\\u000aimportlib.reload (rs_switchIkFk)\\u000ars_switchIkFk.switchAnimation()\\u000a\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000aview = self\\u000a\\u000afor item in view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000a\\u000a\\u000aview.scene().update()\n"
		+ "p380\nasg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"pig\"]:\\u000a    import importlib\\u000a    import rigStudio2.animTools.switchIkFk as switchIkFk\\u000a    switchIkFk.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.name\") in [\"dog\", \"penguin\", \"cat\", \"bear\", \"bearFemale\", \"hare\", \"panda\"]:\\u000a    import importlib\\u000a    import pk_selector_switchIKFK\\u000a    pk_selector_switchIKFK.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    #mel.eval(\"humanAnimaccord_changeFkIk;\")\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk()\\u000aelse:\\u000a    mel.eval(\"human_changeFkIk -sl;\")\\u000a\\u000a\\u000a\\u000adef setIcon(item, ctrl):\\u000a    global ns\\u000a    def isIk(ctrl):\\u000a        if cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a            switch_attr = (ns+ctrl+\".fkIk\")\\u000a        else:\\u000a            switch_attr = (ns+ctrl+\".ikFk\")\\u000a        return cmds.getAttr(switch_attr)\\u000a\\u000a    if isIk(ctrl):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000afor item in self.view.items:\\u000a    if item.name == \"common_ikFk_arm\":\\u000a        if cmds.objExists(ns+\"l_arm_control\"):\\u000a            setIcon(item, 'l_arm_control')\\u000a        else:\\u000a            setIcon(item, 'l_f_leg_control')\\u000a    elif item.name == \"common_ikFk_arm_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_arm_control\"):\\u000a            setIcon(item, 'r_arm_control')\\u000a        else:\\u000a            setIcon(item, 'r_f_leg_control')\\u000a    elif item.name == \"common_ikFk_leg\":\\u000a        if cmds.objExists(ns+\"l_leg_control\"):\\u000a            setIcon(item, 'l_leg_control')\\u000a        else:\\u000a            setIcon(item, 'l_b_leg_control')\\u000a    elif item.name == \"common_ikFk_leg_MIRROR\":\\u000a        if cmds.objExists(ns+\"r_leg_control\"):\\u000a            setIcon(item, 'r_leg_control')\\u000a        else:\\u000a            setIcon(item, 'r_b_leg_control')\\u000a\\u000aself.view.scene().update()\n"
		+ "p381\nsg44\nI00\nsg45\nI40\nsg46\n(lp382\n(lp383\nF-3.668790635695538\naF10.596060112804469\naa(lp384\nF8.69408001300447\naF-2.0371496637044642\naa(lp385\nF-3.9391297635044662\naF-14.400020312404473\naa(lp386\nF-16.302000412204475\naF-1.7668105358955399\naasg52\nVlinear\np387\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp388\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp389\nVswitch animation\np390\nasg65\nVikFkSwitchSeamless\np391\nsg67\nI00\nsg68\nVpolygon\np392\nsg70\n(lp393\nF-111.24789257622911\naF-150\nasa(dp394\ng29\nVdefault\np395\nsg31\n(I170\nI49\nI49\nI180\ntp396\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp397\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', tgl=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\np398\nsg44\nI00\nsg45\nI40\nsg46\n(lp399\n(lp400\nF0\naF0\naa(lp401\nF0\naF60\naa(lp402\nF30\naF60\naa(lp403\nF30\naF0\naasg52\nVlinear\np404\nsg54\nI255\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/bodyFullSelect3_icon.png\n"
		+ "p405\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp406\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp407\nsg65\nVbody_select_all\np408\nsg67\nI00\nsg68\nVpolygon\np409\nsg70\n(lp410\nF-128\naF-244\nasa(dp411\ng29\nVdefault\np412\nsg31\n(I170\nI49\nI49\nI180\ntp413\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp414\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'body_controlSet', tgl=1)\\u000aelse:\\u000a    cmds.select(ns+'body_controlSet')\np415\nsg44\nI00\nsg45\nI40\nsg46\n(lp416\n(lp417\nF0\naF0\naa(lp418\nF0\naF35\naa(lp419\nF30\naF35\naa(lp420\nF30\naF0\naasg52\nVlinear\np421\nsg54\nI255\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/bodySelect3_icon.png\np422\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp423\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp424\nsg65\nVbody_select_body\np425\nsg67\nI00\nsg68\nVpolygon\np426\nsg70\n(lp427\nF-163\naF-217\nasa(dp428\ng29\nVdefault\np429\nsg31\n(I170\nI49\nI49\nI180\ntp430\nsg34\nI20\nsg35\nI01\n"
		+ "sg37\nI10\nsg39\nNsg40\n(lp431\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'face_controlSet', tgl=1)\\u000aelse:\\u000a    cmds.select(ns+'face_controlSet')\\u000a\np432\nsg44\nI00\nsg45\nI40\nsg46\n(lp433\n(lp434\nF0\naF0\naa(lp435\nF0\naF29\naa(lp436\nF23\naF29\naa(lp437\nF23\naF0\naasg52\nVlinear\np438\nsg54\nI255\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/faceSelect_icon.png\np439\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp440\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp441\nsg65\nVbody_select_face\np442\nsg67\nI00\nsg68\nVpolygon\np443\nsg70\n(lp444\nF-159\naF-243\nasa(dp445\ng29\nVdefault\np446\nsg31\n(I170\nI49\nI49\nI180\ntp447\nsg34\nI0\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp448\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000av = cmds.getAttr(ns+'character.offsetControls')\\u000acmds.setAttr(ns+'character.offsetControls', not v)\\u000a\\u000aif not v: self.polygon.opacity = 255\\u000aelse: self.polygon.opacity = 100\\u000a'''\\u000a# cycle all items\\u000afor item in self.view.items:\\u000a    if \"fingers_auto\" in item.name:\\u000a        if not v: item.visible = True\\u000a        else: item.visible = False\\u000a        if \"fingers_auto\" == item.name:\\u000a            print (item.visible)\\u000a'''\\u000aself.view.scene().update()\\u000aself.view.update()\\u000a\\u000a\n"
		+ "p449\nsg44\nI00\nsg45\nI0\nsg46\n(lp450\n(lp451\nF0\naF0\naa(lp452\nF0\naF35\naa(lp453\nF35\naF35\naa(lp454\nF35\naF0\naasg52\nVlinear\np455\nsg54\nI100\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/add.png\np456\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp457\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp458\nsg65\nVadd_icon\np459\nsg67\nI00\nsg68\nVpolygon\np460\nsg70\n(lp461\nF131\naF-245\nasa(dp462\ng29\nVdefault\np463\nsg31\n(I200\nI200\nI200\nI180\ntp464\nsg33\nS'Sel'\np465\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI10\nsg38\nF-1\nsg39\nNsg40\n(lp466\nsg42\nNsg44\nI00\nsg45\nI40\nsg46\n(lp467\n(lp468\nF14.142135623730951\naF14.142135623730951\naa(lp469\nF14.142135623730951\naF-14.142135623730949\naa(lp470\nF-14.142135623730949\naF-14.142135623730955\naa(lp471\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np472\nsg54\nI0\nsg55\nI01\nsg56\nF1\nsg57\n(I148\nI148\nI148\nI255\ntp473\nsg59\nNsg60\nI0\nsg61\n(dp474\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp475\nsg65\nVbody_select_label\np476\nsg67\nI00\nsg68\nVpolygon\np477\nsg70\n(lp478\nF-86.822725057982012\n"
		+ "aF-240\nasa(dp479\ng29\nVdefault\np480\nsg31\n(I200\nI200\nI200\nI180\ntp481\nsg33\nS'Vis'\np482\nsg34\nI0\nsg35\nI01\nsg36\nI255\nsg37\nI10\nsg38\nF-1\nsg39\nNsg40\n(lp483\nsg42\nNsg44\nI00\nsg45\nI0\nsg46\n(lp484\n(lp485\nF14.142135623730951\naF14.142135623730951\naa(lp486\nF14.142135623730951\naF-14.142135623730949\naa(lp487\nF-14.142135623730949\naF-14.142135623730955\naa(lp488\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np489\nsg54\nI0\nsg55\nI01\nsg56\nF1\nsg57\n(I148\nI148\nI148\nI255\ntp490\nsg59\nNsg60\nI0\nsg61\n(dp491\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp492\nsg65\nVbody_vis_label\np493\nsg67\nI00\nsg68\nVpolygon\np494\nsg70\n(lp495\nF53.177274942017981\naF-240\nasa(dp496\ng29\nVoffset\np497\nsg31\n(I122\nI118\nI96\nI180\ntp498\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp499\nsg42\nNsg111\n(lp500\nVl_arm_middleOffset\np501\nasg45\nI40\nsg46\n(lp502\n(lp503\nF14.142135623730951\naF14.142135623730951\naa(lp504\nF14.142135623730951\naF-14.142135623730949\naa(lp505\nF-14.142135623730949\naF-14.142135623730955\naa(lp506\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np507\nsg54\nI255\n"
		+ "sg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp508\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp509\nsg65\nVarm_offset_2\np510\nsg67\nI00\nsg68\nVcircle\np511\nsg70\n(lp512\nF104\naF-32\nasa(dp513\ng29\nVoffset\np514\nsg31\n(I122\nI118\nI96\nI180\ntp515\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp516\nsg42\nNsg111\n(lp517\nVr_arm_middleOffset\np518\nasg45\nI40\nsg46\n(lp519\n(lp520\nF-14.142135623730951\naF14.142135623730951\naa(lp521\nF-14.142135623730951\naF-14.142135623730949\naa(lp522\nF14.142135623730949\naF-14.142135623730955\naa(lp523\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np524\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp525\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp526\nsg65\nVarm_offset_2_MIRROR\np527\nsg67\nI01\nsg68\nVcircle\np528\nsg70\n(lp529\nF-104\naF-32\nasa(dp530\ng29\nVfk\np531\nsg31\n(I138\nI146\nI146\nI180\ntp532\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp533\nsg42\nNsg111\n(lp534\nVl_arm\np535\naVl_arm_fk\np536\naVl_f_legFk\np537\nasg45\nI40\nsg46\n(lp538\n(lp539\nF22.70842733006964\naF18.402300471632969\naa(lp540\nF13.332902896073083\naF-7.4287539685494437\naa(lp541\n"
		+ "F-0.21218850446185122\naF-23.078333095576113\naa(lp542\nF-7.6223028757226832\naF-13.104422989201613\naa(lp543\nF-19.765614164432264\naF-7.5143890195871563\naa(lp544\nF-8.6100851418812105\naF8.9909914444417183\naa(lp545\nF12.080789943887204\naF26.941515763396922\naa(lp546\nF16.838220385081417\naF21.29772578157478\naasg52\nVquadratic\np547\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp548\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp549\nsg65\nVarm_fk\np550\nsg67\nI00\nsg68\nVpolygon\np551\nsg70\n(lp552\nF63.765029521782679\naF-39.386886717053841\nasa(dp553\ng29\nVdefault\np554\nsg31\n(I138\nI146\nI146\nI180\ntp555\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp556\nsg42\nNsg111\n(lp557\nVneck\np558\nasg45\nI40\nsg46\n(lp559\n(lp560\nF10.309616869699866\naF10.309616869699866\naa(lp561\nF10.309616869699866\naF-10.309616869699864\naa(lp562\nF-10.309616869699864\naF-10.309616869699866\naa(lp563\nF-10.309616869699866\naF10.309616869699862\naasg52\nVlinear\np564\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp565\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp566\nsg65\nVneck\np567\nsg67\nI00\nsg68\nVpolygon\n"
		+ "p568\nsg70\n(lp569\nF0.87946055656868793\naF-93.115508932122339\nasa(dp570\ng29\nVdefault\np571\nsg31\n(I146\nI141\nI115\nI180\ntp572\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp573\nsg42\nNsg111\n(lp574\nVl_shoulder\np575\nasg45\nI40\nsg46\n(lp576\n(lp577\nF24.824532815464416\naF3.5006397130625011\naa(lp578\nF10.637198939705712\naF-16.053918219204022\naa(lp579\nF-13.148237677968684\naF-15.753525113435678\naa(lp580\nF-4.5027878830687413\naF7.084961365424137\naa(lp581\nF5.3066597548978205\naF18.729080845077259\naa(lp582\nF18.034795014810015\naF14.444734638481748\naasg52\nVquadratic\np583\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp584\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp585\nsg65\nVshoulder\np586\nsg67\nI00\nsg68\nVpolygon\np587\nsg70\n(lp588\nF34.705210904219058\naF-71.225794124923254\nasa(dp589\ng29\nVdefault\np590\nsg31\n(I138\nI146\nI146\nI180\ntp591\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp592\nsg42\nNsg111\n(lp593\nVhip\np594\naVhips\np595\naVhips_ik\np596\nasg45\nI40\nsg46\n(lp597\n(lp598\nF17.677705172600199\naF21.332408018021709\naa(lp599\nF24.617990171784982\naF17.36112160104517\n"
		+ "aa(lp600\nF20.352197507033715\naF9.8712828134315025\naa(lp601\nF-9.9296092888754668\naF-0.62005958225237356\naa(lp602\nF-40.832943022229003\naF9.7911152823373513\naa(lp603\nF-43.613419629322237\naF16.916009360674988\naa(lp604\nF-37.969129284473723\naF21.439226395582409\naa(lp605\nF-9.7441674837677343\naF16.579270967569851\naasg52\nVquadratic\np606\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp607\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp608\nsg65\nVhips\np609\nsg67\nI00\nsg68\nVpolygon\np610\nsg70\n(lp611\nF10\naF20.268629752243129\nasa(dp612\ng29\nVdefault\np613\nsg31\n(I146\nI141\nI115\nI180\ntp614\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp615\nsg42\nNsg111\n(lp616\nVpelvis\np617\nasg45\nI40\nsg46\n(lp618\n(lp619\nF39.507889740261575\naF14.664123868214016\naa(lp620\nF44.97402668375652\naF6.6046425372353594\naa(lp621\nF39.706664135490847\naF-1.8176018632489666\naa(lp622\nF0.51317964395950066\naF-9.6592080241708604\naa(lp623\nF-38.000432047394632\naF-1.778829336735517\naa(lp624\nF-42.42393312120668\naF6.3063320449964424\naa(lp625\nF-37.935979470127819\naF14.971259377374178\naa(lp626\n"
		+ "F0.49864016481935008\naF19.524451159764784\naasg52\nVquadratic\np627\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp628\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp629\nsg65\nVpelvis\np630\nsg67\nI00\nsg68\nVpolygon\np631\nsg70\n(lp632\nF-0.29255750471908648\naF48.348792213684007\nasa(dp633\ng29\nVfk\np634\nsg31\n(I138\nI146\nI146\nI180\ntp635\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp636\nsg42\nNsg111\n(lp637\nVl_forearm_fk\np638\nasg45\nI40\nsg46\n(lp639\n(lp640\nF22.74698165901259\naF18.787843761062561\naa(lp641\nF13.332902896073083\naF-7.4287539685494437\naa(lp642\nF-5.6097945564752809\naF-18.953019898680196\naa(lp643\nF-10.531402241418236\naF-13.174521769097897\naa(lp644\nF-15.447529322821524\naF-10.984278624452941\naa(lp645\nF-8.6100851418812105\naF8.9909914444417183\naa(lp646\nF13.237419812175801\naF26.941515763396893\naa(lp647\nF16.312479535859335\naF21.858516020744997\naasg52\nVquadratic\np648\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp649\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp650\nsg65\nVforeArm_fk\np651\nsg67\nI00\nsg68\nVpolygon\np652\nsg70\n(lp653\nF95.26874137320894\naF1.5674608304295337\n"
		+ "asa(dp654\ng29\nVfk\np655\nsg31\n(I138\nI146\nI146\nI180\ntp656\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp657\nsg42\nNsg111\n(lp658\nVr_forearm_fk\np659\nasg45\nI40\nsg46\n(lp660\n(lp661\nF-22.74698165901259\naF18.787843761062561\naa(lp662\nF-13.332902896073083\naF-7.4287539685494437\naa(lp663\nF5.6097945564752809\naF-18.953019898680196\naa(lp664\nF10.531402241418236\naF-13.174521769097897\naa(lp665\nF15.447529322821524\naF-10.984278624452941\naa(lp666\nF8.6100851418812105\naF8.9909914444417183\naa(lp667\nF-13.237419812175801\naF26.941515763396893\naa(lp668\nF-16.312479535859335\naF21.858516020744997\naasg52\nVquadratic\np669\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp670\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp671\nsg65\nVforeArm_fk_MIRROR\np672\nsg67\nI01\nsg68\nVpolygon\np673\nsg70\n(lp674\nF-95.26874137320894\naF1.5674608304295337\nasa(dp675\ng29\nVfk\np676\nsg31\n(I138\nI146\nI146\nI180\ntp677\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp678\nsg42\nNsg111\n(lp679\nVr_arm\np680\naVr_arm_fk\np681\naVr_f_legFk\np682\nasg45\nI40\nsg46\n(lp683\n(lp684\nF-22.70842733006964\naF18.402300471632969\n"
		+ "aa(lp685\nF-13.332902896073083\naF-7.4287539685494437\naa(lp686\nF0.21218850446185122\naF-23.078333095576113\naa(lp687\nF7.6223028757226832\naF-13.104422989201613\naa(lp688\nF19.765614164432264\naF-7.5143890195871563\naa(lp689\nF8.6100851418812105\naF8.9909914444417183\naa(lp690\nF-12.080789943887204\naF26.941515763396922\naa(lp691\nF-16.838220385081417\naF21.29772578157478\naasg52\nVquadratic\np692\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp693\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp694\nsg65\nVarm_fk_MIRROR\np695\nsg67\nI01\nsg68\nVpolygon\np696\nsg70\n(lp697\nF-63.765029521782679\naF-39.386886717053841\nasa(dp698\ng29\nVdefault\np699\nsg31\n(I146\nI141\nI115\nI180\ntp700\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp701\nsg42\nNsg111\n(lp702\nVr_shoulder\np703\nasg45\nI40\nsg46\n(lp704\n(lp705\nF-24.824532815464416\naF3.5006397130625011\naa(lp706\nF-10.637198939705712\naF-16.053918219204022\naa(lp707\nF13.148237677968684\naF-15.753525113435678\naa(lp708\nF4.5027878830687413\naF7.084961365424137\naa(lp709\nF-5.3066597548978205\naF18.729080845077259\naa(lp710\nF-18.034795014810015\n"
		+ "aF14.444734638481748\naasg52\nVquadratic\np711\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp712\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp713\nsg65\nVshoulder_MIRROR\np714\nsg67\nI01\nsg68\nVpolygon\np715\nsg70\n(lp716\nF-34.705210904219058\naF-71.225794124923254\nasa(dp717\ng29\nVik\np718\nsg31\n(I138\nI146\nI146\nI180\ntp719\nsg34\nI20\nsg35\nI01\nsg37\nI31\nsg44\nI00\nsg39\nNsg40\n(lp720\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np721\nsg111\n(lp722\nVhead\np723\nasg45\nI40\nsg46\n(lp724\n(lp725\nF14.142135623730951\naF14.142135623730951\naa(lp726\nF14.142135623730951\naF-14.142135623730949\naa(lp727\nF-14.142135623730949\naF-14.142135623730955\naa(lp728\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np729\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp730\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp731\nsg65\nVhead\np732\nsg67\nI00\nsg68\nVcircle\np733\nsg70\n(lp734\nF0\naF-142.05148169844415\n"
		+ "asa(dp735\ng29\nVfk\np736\nsg31\n(I138\nI146\nI146\nI180\ntp737\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp738\nsg42\nNsg111\n(lp739\nVl_foot_fk_heel\np740\nasg45\nI40\nsg46\n(lp741\n(lp742\nF10.16341983535915\naF16.111124669034496\naa(lp743\nF-13.625058966836541\naF3.4388465199905056\naa(lp744\nF-31.164309885114321\naF12.315777991594331\naa(lp745\nF-35.845901191177347\naF21.735086298317313\naa(lp746\nF-25.54858724625133\naF28.804882013792238\naa(lp747\nF-1.7586903236019751\naF29.741242624518677\naa(lp748\nF15.086748661239795\naF29.65096422505647\naa(lp749\nF15.025339128818786\naF21.419749458681238\naasg52\nVquadratic\np750\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp751\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp752\nsg65\nVfoot_fk\np753\nsg67\nI00\nsg68\nVpolygon\np754\nsg70\n(lp755\nF43.062039182336832\naF205.29560220291748\nasa(dp756\ng29\nVfk\np757\nsg31\n(I138\nI146\nI146\nI180\ntp758\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp759\nsg42\nNsg111\n(lp760\nVl_foot_fk_toe\np761\nasg45\nI40\nsg46\n(lp762\n(lp763\nF-8.0894800523018446\naF11.560970015322258\naa(lp764\nF-9.094995410337674\n"
		+ "aF4.036210770473426\naa(lp765\nF-24.069027873332406\naF1.7268425600316704\naa(lp766\nF-19.392074327870738\naF9.0907291963481445\naa(lp767\nF-19.356096769780009\naF14.721462072415267\naa(lp768\nF-7.7340354770249382\naF15.691727823645721\naasg52\nVquadratic\np769\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp770\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp771\nsg65\nVfootFingers_fk\np772\nsg67\nI00\nsg68\nVpolygon\np773\nsg70\n(lp774\nF83.022769823947598\naF220.79006652657867\nasa(dp775\ng29\nVik\np776\nsg31\n(I138\nI146\nI146\nI180\ntp777\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp778\nsg42\nNsg111\n(lp779\nVl_toe_ik\np780\nasg45\nI40\nsg46\n(lp781\n(lp782\nF-8.0894800523018446\naF11.560970015322258\naa(lp783\nF-9.094995410337674\naF4.036210770473426\naa(lp784\nF-22.010861915365165\naF2.7995669570358359\naa(lp785\nF-16.933735609985241\naF9.4539522239819238\naa(lp786\nF-16.971316699791572\naF14.577391584522179\naa(lp787\nF-7.7340354770249382\naF15.691727823645721\naasg52\nVquadratic\np788\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp789\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp790\nsg65\n"
		+ "VfootFingers_ik\np791\nsg67\nI00\nsg68\nVpolygon\np792\nsg70\n(lp793\nF81.45453367319422\naF220.03046362684807\nasa(dp794\ng29\nVik\np795\nsg31\n(I146\nI141\nI115\nI180\ntp796\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp797\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\np798\nsg111\n(lp799\nVl_hand\np800\naVl_hand_ik\np801\naVl_f_foot\np802\nasg45\nI40\nsg46\n(lp803\n(lp804\nF14.142135623730951\naF14.142135623730951\naa(lp805\nF14.142135623730951\naF-14.142135623730949\naa(lp806\nF-14.142135623730949\naF-14.142135623730955\naa(lp807\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np808\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp809\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp810\nsg65\nVhand_ik\np811\nsg67\nI00\nsg68\nVcircle\np812\nsg70\n(lp813\nF118.58942758020078\naF32.765035546407034\nasa(dp814\ng29\nVik\np815\nsg31\n(I138\nI146\nI146\nI180\ntp816\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp817\nsg42\nNsg111\n(lp818\nVl_knee_ik\np819\nasg45\nI40\nsg46\n(lp820\n(lp821\nF6.4894901462821037\naF1.2175328215101306\naa(lp822\nF1.5439824394341712\naF-12.154384509769056\n"
		+ "aa(lp823\nF-12.401468841270288\naF-13.371917331279191\naa(lp824\nF-17.099896376036991\naF-0.64399734963148969\naa(lp825\nF-12.727924141067676\naF12.727919981647695\naa(lp826\nF-1.0766147478777881\naF11.938078651582584\naasg52\nVquadratic\np827\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp828\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp829\nsg65\nVknee_ik\np830\nsg67\nI00\nsg68\nVpolygon\np831\nsg70\n(lp832\nF31.375137188606082\naF144.76958427602753\nasa(dp833\ng29\nVik\np834\nsg31\n(I138\nI146\nI146\nI180\ntp835\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp836\nsg42\nNsg111\n(lp837\nVr_foot_fingers\np838\naVr_b_toeIk\np839\naVr_toeIk\np840\naVr_toe_ik\np841\nasg45\nI40\nsg46\n(lp842\n(lp843\nF8.0894800523018446\naF11.560970015322258\naa(lp844\nF9.094995410337674\naF4.036210770473426\naa(lp845\nF22.010861915365165\naF2.7995669570358359\naa(lp846\nF16.933735609985241\naF9.4539522239819238\naa(lp847\nF16.971316699791572\naF14.577391584522179\naa(lp848\nF7.7340354770249382\naF15.691727823645721\naasg52\nVquadratic\np849\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp850\nV1\nNsV3\nNsV2\nNsV5\n"
		+ "NsV4\nNssg63\n(lp851\nsg65\nVfootFingers_ik_MIRROR\np852\nsg67\nI01\nsg68\nVpolygon\np853\nsg70\n(lp854\nF-81.45453367319422\naF220.03046362684807\nasa(dp855\ng29\nVdefault\np856\nsg31\n(I138\nI146\nI146\nI180\ntp857\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp858\nsg42\nNsg111\n(lp859\nVwaist\np860\naVstomach\np861\nasg45\nI40\nsg46\n(lp862\n(lp863\nF29.09217335419261\naF10.798127575684866\naa(lp864\nF33.117237830766165\naF4.8634185956005833\naa(lp865\nF29.238543590679626\naF-1.3384159174833299\naa(lp866\nF0.37788682873381413\naF-7.1126895450712695\naa(lp867\nF-27.982136325808771\naF-1.3098652388688807\naa(lp868\nF-31.239441661979463\naF4.6437535967701082\naa(lp869\nF-27.934675791639581\naF11.024290996066437\naa(lp870\nF0.36718048500333961\naF14.377095854008614\naasg52\nVquadratic\np871\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp872\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp873\nsg65\nVstomach\np874\nsg67\nI00\nsg68\nVpolygon\np875\nsg70\n(lp876\nF0\naF-10.212379588793107\nasa(dp877\ng29\nVdefault\np878\nsg31\n(I138\nI146\nI146\nI180\ntp879\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp880\n"
		+ "sg42\nNsg111\n(lp881\nVchest\np882\nasg45\nI40\nsg46\n(lp883\n(lp884\nF32.002055018754199\naF13.279032682566623\naa(lp885\nF32.248502141421973\naF4.122465813984463\naa(lp886\nF25.281095465853987\naF-2.4387620918644486\naa(lp887\nF0.45724306276791504\naF-8.6063543495362378\naa(lp888\nF-24.8111235832848\naF-2.6454561661233025\naa(lp889\nF-32.294708173662819\naF5.5909997726974066\naa(lp890\nF-31.539995558411892\naF13.488700926431946\naa(lp891\nF0.44428838685404098\naF17.396285983350431\naasg52\nVquadratic\np892\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp893\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp894\nsg65\nVchest\np895\nsg67\nI00\nsg68\nVpolygon\np896\nsg70\n(lp897\nF0\naF-52.950495475071449\nasa(dp898\ng29\nVoffset\np899\nsg31\n(I122\nI118\nI96\nI180\ntp900\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp901\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np902\nsg111\n(lp903\nVl_hip_ik\n"
		+ "p904\nasg45\nI40\nsg46\n(lp905\n(lp906\nF14.142135623730951\naF14.142135623730951\naa(lp907\nF14.142135623730951\naF-14.142135623730949\naa(lp908\nF-14.142135623730949\naF-14.142135623730955\naa(lp909\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np910\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp911\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp912\nsg65\nVhand_fk_8\np913\nsg67\nI00\nsg68\nVcircle\np914\nsg70\n(lp915\nF53.285818053690711\naF53.309621256641933\nasa(dp916\ng29\nVoffset\np917\nsg31\n(I122\nI118\nI96\nI180\ntp918\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp919\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np920\nsg111\n(lp921\nVr_hip_ik\np922\nasg45\nI40\nsg46\n(lp923\n(lp924\nF-14.142135623730951\naF14.142135623730951\naa(lp925\nF-14.142135623730951\naF-14.142135623730949\naa(lp926\nF14.142135623730949\naF-14.142135623730955\naa(lp927\nF14.142135623730955\n"
		+ "aF14.142135623730947\naasg52\nVlinear\np928\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp929\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp930\nsg65\nVhand_fk_8_MIRROR\np931\nsg67\nI01\nsg68\nVcircle\np932\nsg70\n(lp933\nF-53.285818053690711\naF53.309621256641933\nasa(dp934\ng29\nVdefault\np935\nsg31\n(I138\nI146\nI146\nI180\ntp936\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp937\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np938\nsg111\n(lp939\nVspineRoot\np940\nasg45\nI40\nsg46\n(lp941\n(lp942\nF14.142135623730951\naF14.142135623730951\naa(lp943\nF14.142135623730951\naF-14.142135623730949\naa(lp944\nF-14.142135623730949\naF-14.142135623730955\naa(lp945\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np946\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp947\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp948\nsg65\nVspine_rotate\np949\nsg67\nI00\nsg68\nVcircle\np950\nsg70\n(lp951\n"
		+ "F0.5894275802007769\naF75.326661544126793\nasa(dp952\ng29\nVik\np953\nsg31\n(I138\nI146\nI146\nI180\ntp954\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp955\nsg42\nNsg111\n(lp956\nVl_elbow\np957\naVl_elbow_ik\np958\naVl_f_knee\np959\nasg45\nI40\nsg46\n(lp960\n(lp961\nF2.3036300142406176\naF-9.5124966378007763\naa(lp962\nF-13.355701633884109\naF-13.504871677521173\naa(lp963\nF-23.593239009112633\naF-3.291387240757615\naa(lp964\nF-18.649390962781929\naF9.0982765747773389\naa(lp965\nF-8.1837416433359778\naF15.193615011386061\naa(lp966\nF4.4116637829491703\naF6.2546538454639062\naasg52\nVquadratic\np967\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp968\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp969\nsg65\nVelbow_ik\np970\nsg67\nI00\nsg68\nVpolygon\np971\nsg70\n(lp972\nF90.45554904667469\naF-17.735354718786365\nasa(dp973\ng29\nVik\np974\nsg31\n(I138\nI146\nI146\nI180\ntp975\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp976\nsg42\nNsg111\n(lp977\nVr_elbow\np978\naVr_elbow_ik\np979\naVr_f_knee\np980\nasg45\nI40\nsg46\n(lp981\n(lp982\nF-2.3036300142406176\naF-9.5124966378007763\naa(lp983\nF13.355701633884109\n"
		+ "aF-13.504871677521173\naa(lp984\nF23.593239009112633\naF-3.291387240757615\naa(lp985\nF18.649390962781929\naF9.0982765747773389\naa(lp986\nF8.1837416433359778\naF15.193615011386061\naa(lp987\nF-4.4116637829491703\naF6.2546538454639062\naasg52\nVquadratic\np988\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp989\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp990\nsg65\nVelbow_ik_MIRROR\np991\nsg67\nI01\nsg68\nVpolygon\np992\nsg70\n(lp993\nF-90.45554904667469\naF-17.735354718786365\nasa(dp994\ng29\nVik\np995\nsg31\n(I146\nI141\nI115\nI180\ntp996\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp997\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np998\nsg111\n(lp999\nVr_hand\np1000\naVr_hand_ik\np1001\naVr_f_foot\np1002\nasg45\nI40\nsg46\n(lp1003\n(lp1004\nF-14.142135623730951\naF14.142135623730951\naa(lp1005\nF-14.142135623730951\naF-14.142135623730949\naa(lp1006\nF14.142135623730949\naF-14.142135623730955\n"
		+ "aa(lp1007\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1008\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1009\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1010\nsg65\nVhand_ik_MIRROR\np1011\nsg67\nI01\nsg68\nVcircle\np1012\nsg70\n(lp1013\nF-118.58942758020078\naF32.765035546407034\nasa(dp1014\ng29\nVdefault\np1015\nsg31\n(I160\nI170\nI120\nI255\ntp1016\nsg33\nS'IK'\np1017\nsg34\nI24\nsg35\nI01\nsg36\nI255\nsg37\nI30\nsg38\nF-1\nsg39\nNsg40\n(lp1018\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000asel = cmds.ls(sl=1)\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.name\") in [\"dog\"]:\\u000a    ctrl = \"l_f_leg_control\"\\u000aelse:\\u000a    ctrl = \"l_arm_control\"\\u000a\\u000acmds.select(ns+ctrl)\\u000a\\u000aif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"pig\"]:\\u000a    import importlib\\u000a    import rigStudio2.animTools.switchIkFk as switchIkFk\\u000a    switchIkFk.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.name\") in [\"dog\", \"penguin\", \"cat\", \"bear\", \"bearFemale\", \"hare\", \"panda\"]:\\u000a    import importlib\\u000a    import pk_selector_switchIKFK\\u000a    pk_selector_switchIKFK.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk()\\u000aelse:\\u000a    mel.eval(\"human_changeFkIk -sl;\")\\u000a\\u000aif cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a    switch_attr = (ns+ctrl+\".fkIk\")\\u000aelse:\\u000a    switch_attr = (ns+ctrl+\".ikFk\")\\u000a\\u000aif cmds.getAttr(switch_attr):\\u000a    self.text.set_text(\"IK\")\\u000a    self.set_color(QtGui.QColor(160, 170, 120, 255))\\u000aelse:\\u000a    self.text.set_text(\"FK\")\\u000a    self.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000aif sel:\\u000a    cmds.select(sel)\\u000aelse:\\u000a    cmds.select(clear=1)\\u000a\\u000aself.view.scene().update()\n"
		+ "p1019\nsg44\nI00\nsg45\nI28\nsg46\n(lp1020\n(lp1021\nF14.142135623730951\naF14.142135623730951\naa(lp1022\nF14.142135623730951\naF-14.142135623730949\naa(lp1023\nF-14.142135623730949\naF-14.142135623730955\naa(lp1024\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1025\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1026\nsg59\nNsg60\nI0\nsg61\n(dp1027\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1028\nsg65\nVikFk_arm\np1029\nsg67\nI00\nsg68\nVrect\np1030\nsg70\n(lp1031\nF138.38593097444772\naF-68.073558558713529\nasa(dp1032\ng29\nVdefault\np1033\nsg31\n(I160\nI170\nI120\nI255\ntp1034\nsg33\nS'IK'\np1035\nsg34\nI24\nsg35\nI01\nsg36\nI255\nsg37\nI30\nsg38\nF-1\nsg39\nNsg40\n(lp1036\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000asel = cmds.ls(sl=1)\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.name\") in [\"dog\"]:\\u000a    ctrl = \"l_b_leg_control\"\\u000aelse:\\u000a    ctrl = \"l_leg_control\"\\u000a\\u000acmds.select(ns+ctrl)\\u000a\\u000aif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"pig\"]:\\u000a    import importlib\\u000a    import rigStudio2.animTools.switchIkFk as switchIkFk\\u000a    switchIkFk.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.name\") in [\"dog\", \"penguin\", \"cat\", \"bear\", \"bearFemale\", \"hare\", \"panda\"]:\\u000a    import importlib\\u000a    import pk_selector_switchIKFK\\u000a    pk_selector_switchIKFK.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk()\\u000aelse:\\u000a    mel.eval(\"human_changeFkIk -sl;\")\\u000a\\u000aif cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a    switch_attr = (ns+ctrl+\".fkIk\")\\u000aelse:\\u000a    switch_attr = (ns+ctrl+\".ikFk\")\\u000a\\u000aif cmds.getAttr(switch_attr):\\u000a    self.text.set_text(\"IK\")\\u000a    self.set_color(QtGui.QColor(160, 170, 120, 255))\\u000aelse:\\u000a    self.text.set_text(\"FK\")\\u000a    self.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000aif sel:\\u000a    cmds.select(sel)\\u000aelse:\\u000a    cmds.select(clear=1)\\u000a\\u000aself.view.scene().update()\n"
		+ "p1037\nsg44\nI00\nsg45\nI28\nsg46\n(lp1038\n(lp1039\nF14.142135623730951\naF14.142135623730951\naa(lp1040\nF14.142135623730951\naF-14.142135623730949\naa(lp1041\nF-14.142135623730949\naF-14.142135623730955\naa(lp1042\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1043\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1044\nsg59\nNsg60\nI0\nsg61\n(dp1045\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1046\nsg65\nVikFk_leg\np1047\nsg67\nI00\nsg68\nVrect\np1048\nsg70\n(lp1049\nF117.72359306278284\naF185.73926977806383\nasa(dp1050\ng29\nVdefault\np1051\nsg31\n(I160\nI170\nI120\nI255\ntp1052\nsg33\nS'IK'\np1053\nsg34\nI24\nsg35\nI01\nsg36\nI255\nsg37\nI30\nsg38\nF-1\nsg39\nNsg40\n(lp1054\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000asel = cmds.ls(sl=1)\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.name\") in [\"dog\"]:\\u000a    ctrl = \"r_f_leg_control\"\\u000aelse:\\u000a    ctrl = \"r_arm_control\"\\u000a\\u000acmds.select(ns+ctrl)\\u000a\\u000aif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"pig\"]:\\u000a    import importlib\\u000a    import rigStudio2.animTools.switchIkFk as switchIkFk\\u000a    switchIkFk.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.name\") in [\"dog\", \"penguin\", \"cat\", \"bear\", \"bearFemale\", \"hare\", \"panda\"]:\\u000a    import importlib\\u000a    import pk_selector_switchIKFK\\u000a    pk_selector_switchIKFK.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk()\\u000aelse:\\u000a    mel.eval(\"human_changeFkIk -sl;\")\\u000a\\u000aif cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a    switch_attr = (ns+ctrl+\".fkIk\")\\u000aelse:\\u000a    switch_attr = (ns+ctrl+\".ikFk\")\\u000a\\u000aif cmds.getAttr(switch_attr):\\u000a    self.text.set_text(\"IK\")\\u000a    self.set_color(QtGui.QColor(160, 170, 120, 255))\\u000aelse:\\u000a    self.text.set_text(\"FK\")\\u000a    self.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000aif sel:\\u000a    cmds.select(sel)\\u000aelse:\\u000a    cmds.select(clear=1)\\u000a\\u000aself.view.scene().update()\n"
		+ "p1055\nsg44\nI01\nsg45\nI28\nsg46\n(lp1056\n(lp1057\nF-14.142135623730951\naF14.142135623730951\naa(lp1058\nF-14.142135623730951\naF-14.142135623730949\naa(lp1059\nF14.142135623730949\naF-14.142135623730955\naa(lp1060\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1061\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1062\nsg59\nNsg60\nI0\nsg61\n(dp1063\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1064\nsg65\nVikFk_arm_MIRROR\np1065\nsg67\nI01\nsg68\nVrect\np1066\nsg70\n(lp1067\nF-138.38593097444772\naF-68.073558558713529\nasa(dp1068\ng29\nVdefault\np1069\nsg31\n(I160\nI170\nI120\nI255\ntp1070\nsg33\nS'IK'\np1071\nsg34\nI24\nsg35\nI01\nsg36\nI255\nsg37\nI30\nsg38\nF-1\nsg39\nNsg40\n(lp1072\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000asel = cmds.ls(sl=1)\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.name\") in [\"dog\"]:\\u000a    ctrl = \"r_b_leg_control\"\\u000aelse:\\u000a    ctrl = \"r_leg_control\"\\u000a\\u000acmds.select(ns+ctrl)\\u000a\\u000aif cmds.objExists(ns+\"character.name\") and cmds.getAttr(ns+\"character.name\") in [\"pig\"]:\\u000a    import importlib\\u000a    import rigStudio2.animTools.switchIkFk as switchIkFk\\u000a    switchIkFk.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.name\") in [\"dog\", \"penguin\", \"cat\", \"bear\", \"bearFemale\", \"hare\", \"panda\"]:\\u000a    import importlib\\u000a    import pk_selector_switchIKFK\\u000a    pk_selector_switchIKFK.switchIkFk()\\u000aelif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import rs_switchIkFk\\u000a    rs_switchIkFk.switchIkFk()\\u000aelse:\\u000a    mel.eval(\"human_changeFkIk -sl;\")\\u000a\\u000aif cmds.objExists(ns+ctrl+\".fkIk\"):\\u000a    switch_attr = (ns+ctrl+\".fkIk\")\\u000aelse:\\u000a    switch_attr = (ns+ctrl+\".ikFk\")\\u000a\\u000aif cmds.getAttr(switch_attr):\\u000a    self.text.set_text(\"IK\")\\u000a    self.set_color(QtGui.QColor(160, 170, 120, 255))\\u000aelse:\\u000a    self.text.set_text(\"FK\")\\u000a    self.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000aif sel:\\u000a    cmds.select(sel)\\u000aelse:\\u000a    cmds.select(clear=1)\\u000a\\u000aself.view.scene().update()\n"
		+ "p1073\nsg44\nI01\nsg45\nI28\nsg46\n(lp1074\n(lp1075\nF-14.142135623730951\naF14.142135623730951\naa(lp1076\nF-14.142135623730951\naF-14.142135623730949\naa(lp1077\nF14.142135623730949\naF-14.142135623730955\naa(lp1078\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1079\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1080\nsg59\nNsg60\nI0\nsg61\n(dp1081\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1082\nsg65\nVikFk_leg_MIRROR\np1083\nsg67\nI01\nsg68\nVrect\np1084\nsg70\n(lp1085\nF-117.72359306278284\naF185.73926977806383\nasa(dp1086\ng29\nVhidden\np1087\nsg31\n(I119\nI126\nI126\nI180\ntp1088\nsg33\nS' '\nsg34\nI16\nsg35\nI00\nsg36\nI255\nsg37\nI30\nsg111\n(lp1089\nVl_arm_control\np1090\naVl_f_leg_control\np1091\nasg38\nF-1\nsg39\nNsg40\n(lp1092\nsg42\nNsg44\nI00\nsg45\nI16\nsg46\n(lp1093\n(lp1094\nF14.142135623730951\naF14.142135623730951\naa(lp1095\nF14.142135623730951\naF-14.142135623730949\naa(lp1096\nF-14.142135623730949\naF-14.142135623730955\naa(lp1097\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1098\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1099\nsg59\nNsg60\nI0\n"
		+ "sg61\n(dp1100\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1101\nsg65\nVitem_42\np1102\nsg67\nI00\nsg68\nVrect\np1103\nsg70\n(lp1104\nF139.30409969946339\naF-115.32030060333216\nasa(dp1105\ng29\nVoffset\np1106\nsg31\n(I119\nI126\nI126\nI180\ntp1107\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp1108\nVl_hand_indexFinger_2\np1109\nasg38\nF-1\nsg39\nNsg40\n(lp1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp1111\n(lp1112\nF14.142135623730951\naF14.142135623730951\naa(lp1113\nF14.142135623730951\naF-14.142135623730949\naa(lp1114\nF-14.142135623730949\naF-14.142135623730955\naa(lp1115\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1117\nsg59\nNsg60\nI0\nsg61\n(dp1118\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1119\nsg65\nVitem_45\np1120\nsg67\nI00\nsg68\nVrect\np1121\nsg70\n(lp1122\nF109.29454251204747\naF104.19928293224679\nasa(dp1123\ng29\nVhidden\np1124\nsg31\n(I119\nI126\nI126\nI180\ntp1125\nsg33\nS' '\nsg34\nI0\nsg35\nI00\nsg36\nI255\nsg37\nI30\nsg111\n(lp1126\nVr_arm_control\np1127\naVr_f_leg_control\np1128\nasg38\nF-1\nsg39\nNsg40\n(lp1129\nsg42\nNsg44\n"
		+ "I01\nsg45\nI0\nsg46\n(lp1130\n(lp1131\nF-14.142135623730951\naF14.142135623730951\naa(lp1132\nF-14.142135623730951\naF-14.142135623730949\naa(lp1133\nF14.142135623730949\naF-14.142135623730955\naa(lp1134\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1135\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp1136\nsg59\nNsg60\nI0\nsg61\n(dp1137\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1138\nsg65\nVitem_42_MIRROR\np1139\nsg67\nI01\nsg68\nVrect\np1140\nsg70\n(lp1141\nF-139.30409969946339\naF-115.32030060333216\nasa(dp1142\ng29\nVik\np1143\nsg31\n(I146\nI141\nI115\nI180\ntp1144\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1145\nsg42\nNsg111\n(lp1146\nVl_foot_ik_foot\np1147\nasg45\nI40\nsg46\n(lp1148\n(lp1149\nF14.81832423986323\naF16.477120363919084\naa(lp1150\nF-6.7794499852618735\naF15.634820876301134\naa(lp1151\nF-29.114436308621364\naF16.236252571175726\naa(lp1152\nF-35.497607653118386\naF22.536321630696616\naa(lp1153\nF-31.95933556465485\naF28.206812470711668\naa(lp1154\nF-5.6771923031576677\naF28.073206955615262\naa(lp1155\nF21.294612294029882\naF28.476990339841251\naa(lp1156\n"
		+ "F21.007845224418915\naF21.296476873253241\naasg52\nVquadratic\np1157\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1158\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1159\nsg65\nVfoot_ik\np1160\nsg67\nI01\nsg68\nVpolygon\np1161\nsg70\n(lp1162\nF40.191817809777781\naF206.77144738753654\nasa(dp1163\ng29\nVfk\np1164\nsg31\n(I138\nI146\nI146\nI180\ntp1165\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1166\nsg42\nNsg111\n(lp1167\nVl_wrist\np1168\naVl_hand_fk\np1169\naVl_f_heelFk\np1170\nasg45\nI40\nsg46\n(lp1171\n(lp1172\nF-6.8625731660165457\naF36.707770136181551\naa(lp1173\nF6.4390249572796598\naF28.249326422074844\naa(lp1174\nF-10.255453934188431\naF10.103741651865221\naa(lp1175\nF-18.046698096505331\naF11.73455521175006\naa(lp1176\nF-20.07655330173062\naF18.587551721188092\naa(lp1177\nF-20.649823735395366\naF30.52521717194584\naa(lp1178\nF-16.173592244096987\naF37.672704705400122\naa(lp1179\nF-13.813298920510178\naF42.624630377305451\naasg52\nVquadratic\np1180\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1181\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1182\nsg65\nVhand_fk\np1183\nsg67\nI00\nsg68\n"
		+ "Vpolygon\np1184\nsg70\n(lp1185\nF131.20259465432343\naF14.379924785809166\nasa(dp1186\ng29\nVfk\np1187\nsg31\n(I138\nI146\nI146\nI180\ntp1188\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1189\nsg42\nNsg111\n(lp1190\nVr_wrist\np1191\naVr_hand_fk\np1192\naVr_f_heelFk\np1193\nasg45\nI40\nsg46\n(lp1194\n(lp1195\nF6.8625731660165457\naF36.707770136181551\naa(lp1196\nF-6.4390249572796598\naF28.249326422074844\naa(lp1197\nF10.255453934188431\naF10.103741651865221\naa(lp1198\nF18.046698096505331\naF11.73455521175006\naa(lp1199\nF20.07655330173062\naF18.587551721188092\naa(lp1200\nF20.649823735395366\naF30.52521717194584\naa(lp1201\nF16.173592244096987\naF37.672704705400122\naa(lp1202\nF13.813298920510178\naF42.624630377305451\naasg52\nVquadratic\np1203\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1204\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1205\nsg65\nVhand_fk_MIRROR\np1206\nsg67\nI01\nsg68\nVpolygon\np1207\nsg70\n(lp1208\nF-131.20259465432343\naF14.379924785809166\nasa(dp1209\ng29\nVoffset\np1210\nsg31\n(I150\nI150\nI150\nI180\ntp1211\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1212\n"
		+ "sg42\nNsg111\n(lp1213\nVl_ear\np1214\nasg45\nI40\nsg46\n(lp1215\n(lp1216\nF-11.156650805076191\naF37.577568396609195\naa(lp1217\nF-3.0640574894915646\naF32.344560507069673\naa(lp1218\nF1.2098213845723584\naF14.034041546308226\naa(lp1219\nF-10.156610321762818\naF18.648261385642741\naa(lp1220\nF-8.7515914356397104\naF23.671510537124657\naa(lp1221\nF-9.6757651258536228\naF31.749552383023794\naasg52\nVcubic\np1222\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1223\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1224\nsg65\nVhuman_ear\np1225\nsg67\nI00\nsg68\nVpolygon\np1226\nsg70\n(lp1227\nF43.907879921442941\naF-169.55173991118374\nasa(dp1228\ng29\nVoffset\np1229\nsg31\n(I150\nI150\nI150\nI180\ntp1230\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1231\nsg42\nNsg111\n(lp1232\nVr_ear\np1233\nasg45\nI40\nsg46\n(lp1234\n(lp1235\nF11.670850296419923\naF39.309483009073297\naa(lp1236\nF3.2052770033108589\naF33.835290731672949\naa(lp1237\nF-1.2655809087730101\naF14.680857257464575\naa(lp1238\nF10.62471889237889\naF19.507742128248708\naa(lp1239\nF9.1549440136917681\naF24.762508085599428\naa(lp1240\nF10.121711995841848\n"
		+ "aF33.212859245537928\naasg52\nVcubic\np1241\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1242\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1243\nsg65\nVhuman_ear_MIRROR\np1244\nsg67\nI01\nsg68\nVpolygon\np1245\nsg70\n(lp1246\nF-43.907879921442941\naF-169.55173991118374\nasa(dp1247\ng29\nVik\np1248\nsg31\n(I138\nI146\nI146\nI180\ntp1249\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1250\nsg42\nNsg111\n(lp1251\nVl_foot_ik_heel\np1252\nasg45\nI40\nsg46\n(lp1253\n(lp1254\nF15.321319598980185\naF16.850971317464474\naa(lp1255\nF15.103695606491037\naF3.1296238296429086\naa(lp1256\nF2.8749114756589229\naF3.4038254393887728\naa(lp1257\nF-9.821780343683475\naF4.157652661434275\naa(lp1258\nF-9.2661253941244066\naF17.261021697926875\naa(lp1259\nF3.9072552486510035\naF17.21002207618006\naasg52\nVquadratic\np1260\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1261\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1262\nsg65\nVfoot_ik_2\np1263\nsg67\nI00\nsg68\nVpolygon\np1264\nsg70\n(lp1265\nF20.91193558179685\naF201.63700454830138\nasa(dp1266\ng29\nVik\np1267\nsg31\n(I146\nI141\nI115\nI180\ntp1268\nsg34\nI20\nsg35\nI01\nsg37\n"
		+ "I10\nsg44\nI01\nsg39\nNsg40\n(lp1269\nsg42\nNsg111\n(lp1270\nVr_foot_ik_foot\np1271\nasg45\nI40\nsg46\n(lp1272\n(lp1273\nF-14.81832423986323\naF16.477120363919084\naa(lp1274\nF6.7794499852618735\naF15.634820876301134\naa(lp1275\nF29.114436308621364\naF16.236252571175726\naa(lp1276\nF35.497607653118386\naF22.536321630696616\naa(lp1277\nF31.95933556465485\naF28.206812470711668\naa(lp1278\nF5.6771923031576677\naF28.073206955615262\naa(lp1279\nF-21.294612294029882\naF28.476990339841251\naa(lp1280\nF-21.007845224418915\naF21.296476873253241\naasg52\nVquadratic\np1281\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1282\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1283\nsg65\nVfoot_ik_MIRROR\np1284\nsg67\nI01\nsg68\nVpolygon\np1285\nsg70\n(lp1286\nF-40.191817809777781\naF206.77144738753654\nasa(dp1287\ng29\nVik\np1288\nsg31\n(I138\nI146\nI146\nI180\ntp1289\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1290\nsg42\nNsg111\n(lp1291\nVr_foot_ik_heel\np1292\nasg45\nI40\nsg46\n(lp1293\n(lp1294\nF-15.321319598980185\naF16.850971317464474\naa(lp1295\nF-15.103695606491037\naF3.1296238296429086\naa(lp1296\nF-2.8749114756589229\n"
		+ "aF3.4038254393887728\naa(lp1297\nF9.821780343683475\naF4.157652661434275\naa(lp1298\nF9.2661253941244066\naF17.261021697926875\naa(lp1299\nF-3.9072552486510035\naF17.21002207618006\naasg52\nVquadratic\np1300\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1301\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1302\nsg65\nVfoot_ik_2_MIRROR\np1303\nsg67\nI01\nsg68\nVpolygon\np1304\nsg70\n(lp1305\nF-20.91193558179685\naF201.63700454830138\nasa(dp1306\ng29\nVoffset\np1307\nsg31\n(I146\nI141\nI115\nI180\ntp1308\nsg34\nI0\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp1309\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1310\nsg111\n(lp1311\nVl_leg_middleOffset\np1312\nasg45\nI0\nsg46\n(lp1313\n(lp1314\nF14.142135623730951\naF14.142135623730951\naa(lp1315\nF14.142135623730951\naF-14.142135623730949\naa(lp1316\nF-14.142135623730949\naF-14.142135623730955\naa(lp1317\nF-14.142135623730955\naF14.142135623730947\n"
		+ "aasg52\nVlinear\np1318\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1319\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1320\nsg65\nVleg_offset_3\np1321\nsg67\nI00\nsg68\nVcircle\np1322\nsg70\n(lp1323\nF51.681756248502225\naF142.6976905950776\nasa(dp1324\ng29\nVoffset\np1325\nsg31\n(I146\nI141\nI115\nI180\ntp1326\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp1327\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1328\nsg111\n(lp1329\nVr_leg_middleOffset\np1330\nasg45\nI40\nsg46\n(lp1331\n(lp1332\nF-14.142135623730951\naF14.142135623730951\naa(lp1333\nF-14.142135623730951\naF-14.142135623730949\naa(lp1334\nF14.142135623730949\naF-14.142135623730955\naa(lp1335\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1336\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1337\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1338\nsg65\nVleg_offset_3_MIRROR\np1339\nsg67\nI01\nsg68\nVcircle\np1340\n"
		+ "sg70\n(lp1341\nF-51.681756248502225\naF142.6976905950776\nasa(dp1342\ng29\nVhidden\np1343\nsg31\n(I138\nI146\nI146\nI180\ntp1344\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1345\nsg42\nNsg111\n(lp1346\nVl_ear_control\np1347\nasg45\nI40\nsg46\n(lp1348\n(lp1349\nF14.142135623730951\naF14.142135623730951\naa(lp1350\nF14.142135623730951\naF-14.142135623730949\naa(lp1351\nF-14.142135623730949\naF-14.142135623730955\naa(lp1352\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1353\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1354\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1355\nsg65\nVitem_9\np1356\nsg67\nI00\nsg68\nVcircle\np1357\nsg70\n(lp1358\nF0.43719760709533251\naF-217.76424527614469\nasa(dp1359\ng29\nVoffset\np1360\nsg31\n(I146\nI141\nI115\nI180\ntp1361\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp1362\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1363\nsg111\n"
		+ "(lp1364\nVheadSquash\np1365\nasg45\nI40\nsg46\n(lp1366\n(lp1367\nF14.142135623730951\naF14.142135623730951\naa(lp1368\nF14.142135623730951\naF-14.142135623730949\naa(lp1369\nF-14.142135623730949\naF-14.142135623730955\naa(lp1370\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1371\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1372\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1373\nsg65\nVhead_deform\np1374\nsg67\nI00\nsg68\nVcircle\np1375\nsg70\n(lp1376\nF-0.15048186124233975\naF-191.93929025451652\nasa(dp1377\ng29\nVoffset\np1378\nsg31\n(I146\nI141\nI115\nI180\ntp1379\nsg34\nI0\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp1380\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1381\nsg111\n(lp1382\nVnoseSquash\np1383\nasg45\nI0\nsg46\n(lp1384\n(lp1385\nF14.142135623730951\naF14.142135623730951\naa(lp1386\nF14.142135623730951\naF-14.142135623730949\naa(lp1387\nF-14.142135623730949\n"
		+ "aF-14.142135623730955\naa(lp1388\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1389\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1390\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1391\nsg65\nVjaw_add\np1392\nsg67\nI00\nsg68\nVcircle\np1393\nsg70\n(lp1394\nF-32.381900857551173\naF-114.20893800048943\nasa(dp1395\ng29\nVoffset\np1396\nsg31\n(I122\nI118\nI96\nI180\ntp1397\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp1398\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1399\nsg111\n(lp1400\nVneck_twist\np1401\nasg45\nI40\nsg46\n(lp1402\n(lp1403\nF14.142135623730951\naF14.142135623730951\naa(lp1404\nF14.142135623730951\naF-14.142135623730949\naa(lp1405\nF-14.142135623730949\naF-14.142135623730955\naa(lp1406\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1407\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1408\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1409\n"
		+ "sg65\nVarm_offset_4\np1410\nsg67\nI00\nsg68\nVcircle\np1411\nsg70\n(lp1412\nF21.385357244127306\naF-100.02421854781893\nasa(dp1413\ng29\nVik\np1414\nsg31\n(I138\nI146\nI146\nI180\ntp1415\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1416\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1417\nsg111\n(lp1418\nVl_ankle_ik\np1419\nasg45\nI40\nsg46\n(lp1420\n(lp1421\nF14.142135623730951\naF14.142135623730951\naa(lp1422\nF14.142135623730951\naF-14.142135623730949\naa(lp1423\nF-14.142135623730949\naF-14.142135623730955\naa(lp1424\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1425\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1426\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1427\nsg65\nVfoot_ik_3\np1428\nsg67\nI00\nsg68\nVcircle\np1429\nsg70\n(lp1430\nF14.270143011737765\naF196.13157608879538\nasa(dp1431\ng29\nVik\np1432\nsg31\n(I138\nI146\nI146\nI180\ntp1433\nsg34\nI20\nsg35\nI01\nsg37\n"
		+ "I7\nsg44\nI01\nsg39\nNsg40\n(lp1434\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1435\nsg111\n(lp1436\nVr_ankle_ik\np1437\nasg45\nI40\nsg46\n(lp1438\n(lp1439\nF-14.142135623730951\naF14.142135623730951\naa(lp1440\nF-14.142135623730951\naF-14.142135623730949\naa(lp1441\nF14.142135623730949\naF-14.142135623730955\naa(lp1442\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1443\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1444\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1445\nsg65\nVfoot_ik_3_MIRROR\np1446\nsg67\nI01\nsg68\nVcircle\np1447\nsg70\n(lp1448\nF-14.270143011737765\naF196.13157608879538\nasa(dp1449\ng29\nVoffset\np1450\nsg31\n(I119\nI126\nI126\nI180\ntp1451\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1452\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\n"
		+ "p1453\nsg111\n(lp1454\nVl_b_foot_thumbFinger\np1455\naVl_legFingerA\np1456\naVl_footFingers_middleFinger\np1457\naVl_foot_finger1\np1458\naVl_foot_thumbFinger\np1459\naVl_footFingerA\np1460\nasg45\nI40\nsg46\n(lp1461\n(lp1462\nF14.142135623730951\naF14.142135623730951\naa(lp1463\nF14.142135623730951\naF-14.142135623730949\naa(lp1464\nF-14.142135623730949\naF-14.142135623730955\naa(lp1465\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1466\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1467\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1468\nsg65\nVfoot_finger_1\np1469\nsg67\nI00\nsg68\nVcircle\np1470\nsg70\n(lp1471\nF91.569301947253138\naF229.79078626668573\nasa(dp1472\ng29\nVoffset\np1473\nsg31\n(I119\nI126\nI126\nI180\ntp1474\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1475\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1476\nsg111\n(lp1477\nVl_b_foot_indexFinger\n"
		+ "p1478\naVl_legFingerB\np1479\naVl_footFingers_ringFinger\np1480\naVl_foot_finger2\np1481\naVl_foot_indexFinger\np1482\naVl_footFingerB\np1483\nasg45\nI40\nsg46\n(lp1484\n(lp1485\nF14.142135623730951\naF14.142135623730951\naa(lp1486\nF14.142135623730951\naF-14.142135623730949\naa(lp1487\nF-14.142135623730949\naF-14.142135623730955\naa(lp1488\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1489\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1490\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1491\nsg65\nVfoot_finger_2\np1492\nsg67\nI00\nsg68\nVcircle\np1493\nsg70\n(lp1494\nF108.56930194725314\naF229.79078626668573\nasa(dp1495\ng29\nVoffset\np1496\nsg31\n(I119\nI126\nI126\nI180\ntp1497\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1498\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1499\nsg111\n(lp1500\nVl_b_foot_middleFinger\np1501\naVl_footFingers_pinkyFinger\np1502\naVl_foot_finger3\n"
		+ "p1503\naVl_foot_middleFinger\np1504\nasg45\nI40\nsg46\n(lp1505\n(lp1506\nF14.142135623730951\naF14.142135623730951\naa(lp1507\nF14.142135623730951\naF-14.142135623730949\naa(lp1508\nF-14.142135623730949\naF-14.142135623730955\naa(lp1509\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1510\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1511\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1512\nsg65\nVfoot_finger_3\np1513\nsg67\nI00\nsg68\nVcircle\np1514\nsg70\n(lp1515\nF125.56930194725314\naF229.79078626668573\nasa(dp1516\ng29\nVoffset\np1517\nsg31\n(I119\nI126\nI126\nI180\ntp1518\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp1519\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1520\nsg111\n(lp1521\nVr_b_foot_thumbFinger\np1522\naVr_legFingerA\np1523\naVr_footFingers_middleFinger\np1524\naVr_foot_finger1\np1525\naVr_foot_thumbFinger\np1526\naVr_footFingerA\np1527\nasg45\n"
		+ "I40\nsg46\n(lp1528\n(lp1529\nF-14.142135623730951\naF14.142135623730951\naa(lp1530\nF-14.142135623730951\naF-14.142135623730949\naa(lp1531\nF14.142135623730949\naF-14.142135623730955\naa(lp1532\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1533\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1534\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1535\nsg65\nVfoot_finger_1_MIRROR\np1536\nsg67\nI01\nsg68\nVcircle\np1537\nsg70\n(lp1538\nF-91.569301947253138\naF229.79078626668573\nasa(dp1539\ng29\nVoffset\np1540\nsg31\n(I119\nI126\nI126\nI180\ntp1541\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp1542\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1543\nsg111\n(lp1544\nVr_b_foot_indexFinger\np1545\naVr_legFingerB\np1546\naVr_footFingers_ringFinger\np1547\naVr_foot_finger2\np1548\naVr_foot_indexFinger\np1549\naVr_footFingerB\np1550\nasg45\nI40\nsg46\n(lp1551\n(lp1552\nF-14.142135623730951\n"
		+ "aF14.142135623730951\naa(lp1553\nF-14.142135623730951\naF-14.142135623730949\naa(lp1554\nF14.142135623730949\naF-14.142135623730955\naa(lp1555\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1556\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1557\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1558\nsg65\nVfoot_finger_2_MIRROR\np1559\nsg67\nI01\nsg68\nVcircle\np1560\nsg70\n(lp1561\nF-108.56930194725314\naF229.79078626668573\nasa(dp1562\ng29\nVoffset\np1563\nsg31\n(I119\nI126\nI126\nI180\ntp1564\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp1565\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1566\nsg111\n(lp1567\nVr_b_foot_middleFinger\np1568\naVr_footFingers_pinkyFinger\np1569\naVr_foot_finger3\np1570\naVr_foot_middleFinger\np1571\nasg45\nI40\nsg46\n(lp1572\n(lp1573\nF-14.142135623730951\naF14.142135623730951\naa(lp1574\nF-14.142135623730951\naF-14.142135623730949\n"
		+ "aa(lp1575\nF14.142135623730949\naF-14.142135623730955\naa(lp1576\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1577\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1578\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1579\nsg65\nVfoot_finger_3_MIRROR\np1580\nsg67\nI01\nsg68\nVcircle\np1581\nsg70\n(lp1582\nF-125.56930194725314\naF229.79078626668573\nasa(dp1583\ng29\nVik\np1584\nsg31\n(I138\nI146\nI146\nI180\ntp1585\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1586\nsg42\nNsg111\n(lp1587\nVl_f_heelIk\np1588\nasg45\nI40\nsg46\n(lp1589\n(lp1590\nF15.241545093125843\naF16.213965570330032\naa(lp1591\nF9.3551662479351858\naF4.5304900814070415\naa(lp1592\nF-0.32474156258599901\naF10.915329817763919\naa(lp1593\nF-8.7026281669225138\naF19.298688875440906\naa(lp1594\nF1.9125200295638449\naF27.328606832405033\naa(lp1595\nF4.8831613386407247\naF18.053253436111145\naasg52\nVquadratic\np1596\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1597\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1598\nsg65\nVhand_ik_2\np1599\nsg67\nI00\nsg68\nVpolygon\np1600\nsg70\n(lp1601\nF102.96766739942575\naF2.6359624182667503\n"
		+ "asa(dp1602\ng29\nVik\np1603\nsg31\n(I138\nI146\nI146\nI180\ntp1604\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1605\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1606\nsg111\n(lp1607\nVl_f_ankleIk\np1608\nasg45\nI40\nsg46\n(lp1609\n(lp1610\nF14.142135623730951\naF14.142135623730951\naa(lp1611\nF14.142135623730951\naF-14.142135623730949\naa(lp1612\nF-14.142135623730949\naF-14.142135623730955\naa(lp1613\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1614\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1615\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1616\nsg65\nVhand_ik_3\np1617\nsg67\nI00\nsg68\nVcircle\np1618\nsg70\n(lp1619\nF87.973876999334749\naF17.554779665434602\nasa(dp1620\ng29\nVik\np1621\nsg31\n(I138\nI146\nI146\nI180\ntp1622\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp1623\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\n"
		+ "p1624\nsg111\n(lp1625\nVr_f_ankleIk\np1626\nasg45\nI40\nsg46\n(lp1627\n(lp1628\nF-14.142135623730951\naF14.142135623730951\naa(lp1629\nF-14.142135623730951\naF-14.142135623730949\naa(lp1630\nF14.142135623730949\naF-14.142135623730955\naa(lp1631\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1632\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1633\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1634\nsg65\nVhand_ik_3_MIRROR\np1635\nsg67\nI01\nsg68\nVcircle\np1636\nsg70\n(lp1637\nF-87.973876999334749\naF17.554779665434602\nasa(dp1638\ng29\nVik\np1639\nsg31\n(I138\nI146\nI146\nI180\ntp1640\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1641\nsg42\nNsg111\n(lp1642\nVr_f_heelIk\np1643\nasg45\nI40\nsg46\n(lp1644\n(lp1645\nF-15.241545093125843\naF16.213965570330032\naa(lp1646\nF-9.3551662479351858\naF4.5304900814070415\naa(lp1647\nF0.32474156258599901\naF10.915329817763919\naa(lp1648\nF8.7026281669225138\naF19.298688875440906\naa(lp1649\nF-1.9125200295638449\naF27.328606832405033\naa(lp1650\nF-4.8831613386407247\naF18.053253436111145\naasg52\nVquadratic\np1651\nsg54\nI255\nsg55\nI01\nsg56\nF1\n"
		+ "sg59\nNsg60\nI0\nsg61\n(dp1652\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1653\nsg65\nVhand_ik_2_MIRROR\np1654\nsg67\nI01\nsg68\nVpolygon\np1655\nsg70\n(lp1656\nF-102.96766739942575\naF2.6359624182667503\nasa(dp1657\ng29\nVfk\np1658\nsg31\n(I138\nI146\nI146\nI180\ntp1659\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1660\nsg42\nNsg111\n(lp1661\nVl_f_ankleFk\np1662\nasg45\nI40\nsg46\n(lp1663\n(lp1664\nF-18.427493357178975\naF27.175254270993221\naa(lp1665\nF-19.730428974510918\naF21.936282896261432\naa(lp1666\nF-24.895959432798428\naF16.632615725569693\naa(lp1667\nF-28.730310217112617\naF15.2957592519525\naa(lp1668\nF-31.551544097938446\naF18.299777657333351\naa(lp1669\nF-27.646330662863775\naF30.741047719836885\naa(lp1670\nF-20.867906660727463\naF36.449664934017463\naa(lp1671\nF-16.529166648139316\naF33.667662639826631\naasg52\nVquadratic\np1672\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1673\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1674\nsg65\nVhand_2_fk\np1675\nsg67\nI00\nsg68\nVpolygon\np1676\nsg70\n(lp1677\nF149.30237627441937\naF-9.6690294451334218\nasa(dp1678\ng29\nVoffset\np1679\nsg31\n(I138\n"
		+ "I146\nI146\nI180\ntp1680\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp1681\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1682\nsg111\n(lp1683\nVl_f_toeFk\np1684\nasg45\nI40\nsg46\n(lp1685\n(lp1686\nF14.142135623730951\naF14.142135623730951\naa(lp1687\nF14.142135623730951\naF-14.142135623730949\naa(lp1688\nF-14.142135623730949\naF-14.142135623730955\naa(lp1689\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1690\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1691\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1692\nsg65\nVhand_3_fk\np1693\nsg67\nI00\nsg68\nVcircle\np1694\nsg70\n(lp1695\nF102.47075930419743\naF41.454363567515159\nasa(dp1696\ng29\nVfk\np1697\nsg31\n(I138\nI146\nI146\nI180\ntp1698\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1699\nsg42\nNsg111\n(lp1700\nVr_f_ankleFk\np1701\nasg45\nI40\nsg46\n(lp1702\n(lp1703\nF18.427493357178975\naF27.175254270993221\n"
		+ "aa(lp1704\nF19.730428974510918\naF21.936282896261432\naa(lp1705\nF24.895959432798428\naF16.632615725569693\naa(lp1706\nF28.730310217112617\naF15.2957592519525\naa(lp1707\nF31.551544097938446\naF18.299777657333351\naa(lp1708\nF27.646330662863775\naF30.741047719836885\naa(lp1709\nF20.867906660727463\naF36.449664934017463\naa(lp1710\nF16.529166648139316\naF33.667662639826631\naasg52\nVquadratic\np1711\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1712\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1713\nsg65\nVhand_2_fk_MIRROR\np1714\nsg67\nI01\nsg68\nVpolygon\np1715\nsg70\n(lp1716\nF-149.30237627441937\naF-9.6690294451334218\nasa(dp1717\ng29\nVoffset\np1718\nsg31\n(I138\nI146\nI146\nI180\ntp1719\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp1720\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np1721\nsg111\n(lp1722\nVr_f_toeFk\np1723\nasg45\nI40\nsg46\n(lp1724\n(lp1725\nF-14.142135623730951\n"
		+ "aF14.142135623730951\naa(lp1726\nF-14.142135623730951\naF-14.142135623730949\naa(lp1727\nF14.142135623730949\naF-14.142135623730955\naa(lp1728\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1729\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1730\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1731\nsg65\nVhand_3_fk_MIRROR\np1732\nsg67\nI01\nsg68\nVcircle\np1733\nsg70\n(lp1734\nF-102.47075930419743\naF41.454363567515159\nasa(dp1735\ng29\nVfk\np1736\nsg31\n(I146\nI141\nI115\nI180\ntp1737\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp1738\nsg42\nNsg111\n(lp1739\nVstomach_add\np1740\nasg45\nI40\nsg46\n(lp1741\n(lp1742\nF14.142135623730951\naF14.142135623730951\naa(lp1743\nF14.142135623730951\naF-14.142135623730949\naa(lp1744\nF-14.142135623730949\naF-14.142135623730955\naa(lp1745\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1746\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1747\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1748\nsg65\nVitem_12\np1749\nsg67\nI00\nsg68\nVcircle\np1750\nsg70\n(lp1751\nF-33.219103991965795\naF19.920358301418919\nasa(dp1752\ng29\nVdefault\np1753\n"
		+ "sg31\n(I146\nI141\nI115\nI180\ntp1754\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1755\nsg42\nNsg111\n(lp1756\nVl_arm_control\np1757\naVl_f_leg_control\np1758\nasg45\nI40\nsg46\n(lp1759\n(lp1760\nF-13.282336512261907\naF0.97416408419720124\naa(lp1761\nF0.94048322800312079\naF-8.4838390747519519\naa(lp1762\nF-17.972406102848499\naF-20.12693916874872\naa(lp1763\nF-17.820131967384906\naF9.0798070830269584\naa(lp1764\nF-13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np1765\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1766\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1767\nsg65\nVarm_control\np1768\nsg67\nI00\nsg68\nVpolygon\np1769\nsg70\n(lp1770\nF109.4516125817203\naF-83.173407143770632\nasa(dp1771\ng29\nVdefault\np1772\nsg31\n(I146\nI141\nI115\nI180\ntp1773\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1774\nsg42\nNsg111\n(lp1775\nVl_ear_control\np1776\nasg45\nI40\nsg46\n(lp1777\n(lp1778\nF-13.282336512261907\naF0.97416408419720124\naa(lp1779\nF0.94048322800312079\naF-8.4838390747519519\naa(lp1780\nF-17.972406102848499\naF-20.12693916874872\naa(lp1781\nF-17.820131967384906\n"
		+ "aF9.0798070830269584\naa(lp1782\nF-13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np1783\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1784\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1785\nsg65\nVhead_control_top\np1786\nsg67\nI00\nsg68\nVpolygon\np1787\nsg70\n(lp1788\nF-18.505798824664225\naF-184.57864051342318\nasa(dp1789\ng29\nVdefault\np1790\nsg31\n(I146\nI141\nI115\nI180\ntp1791\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1792\nsg42\nNsg111\n(lp1793\nVl_leg_control\np1794\naVl_b_leg_control\np1795\nasg45\nI40\nsg46\n(lp1796\n(lp1797\nF-13.282336512261907\naF0.97416408419720124\naa(lp1798\nF0.94048322800312079\naF-8.4838390747519519\naa(lp1799\nF-17.972406102848499\naF-20.12693916874872\naa(lp1800\nF-17.820131967384906\naF9.0798070830269584\naa(lp1801\nF-13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np1802\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1803\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1804\nsg65\nVleg_control\np1805\nsg67\nI00\nsg68\nVpolygon\np1806\nsg70\n(lp1807\nF101.03935971656939\naF171.0522893356171\nasa(dp1808\ng29\nVdefault\np1809\nsg31\n(I146\n"
		+ "I141\nI115\nI180\ntp1810\nsg34\nI0\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1811\nsg42\nNsg111\n(lp1812\nVr_arm_control\np1813\naVr_f_leg_control\np1814\nasg45\nI0\nsg46\n(lp1815\n(lp1816\nF13.282336512261907\naF0.97416408419720124\naa(lp1817\nF-0.94048322800312079\naF-8.4838390747519519\naa(lp1818\nF17.972406102848499\naF-20.12693916874872\naa(lp1819\nF17.820131967384906\naF9.0798070830269584\naa(lp1820\nF13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np1821\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1822\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1823\nsg65\nVarm_control_MIRROR\np1824\nsg67\nI01\nsg68\nVpolygon\np1825\nsg70\n(lp1826\nF-109.4516125817203\naF-83.173407143770632\nasa(dp1827\ng29\nVdefault\np1828\nsg31\n(I146\nI141\nI115\nI180\ntp1829\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp1830\nsg42\nNsg111\n(lp1831\nVr_leg_control\np1832\naVr_b_leg_control\np1833\nasg45\nI40\nsg46\n(lp1834\n(lp1835\nF13.282336512261907\naF0.97416408419720124\naa(lp1836\nF-0.94048322800312079\naF-8.4838390747519519\naa(lp1837\nF17.972406102848499\naF-20.12693916874872\naa(lp1838\nF17.820131967384906\n"
		+ "aF9.0798070830269584\naa(lp1839\nF13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np1840\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1841\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1842\nsg65\nVleg_control_MIRROR\np1843\nsg67\nI01\nsg68\nVpolygon\np1844\nsg70\n(lp1845\nF-101.03935971656939\naF171.0522893356171\nasa(dp1846\ng29\nVdefault\np1847\nsg31\n(I146\nI141\nI115\nI180\ntp1848\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1849\nsg42\nNsg111\n(lp1850\nVhead_control\np1851\nasg45\nI40\nsg46\n(lp1852\n(lp1853\nF-13.282336512261907\naF0.97416408419720124\naa(lp1854\nF0.94048322800312079\naF-8.4838390747519519\naa(lp1855\nF-17.972406102848499\naF-20.12693916874872\naa(lp1856\nF-17.820131967384906\naF9.0798070830269584\naa(lp1857\nF-13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np1858\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1859\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1860\nsg65\nVhead_control_side\np1861\nsg67\nI00\nsg68\nVpolygon\np1862\nsg70\n(lp1863\nF73.152124072404774\naF-161.17071336997083\nasa(dp1864\ng29\nVhidden\np1865\nsg31\n(I138\nI146\nI146\nI180\ntp1866\n"
		+ "sg34\nI0\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp1867\nsg42\nNsg111\n(lp1868\nVtail_1\np1869\naVTail_A\np1870\nasg45\nI0\nsg46\n(lp1871\n(lp1872\nF-25.921653234046758\naF-1.329458119223645\naa(lp1873\nF-20.231367953912084\naF-3.5852288796840277\naa(lp1874\nF-12.943629145477956\naF-4.4768150687990147\naa(lp1875\nF-14.445739450856063\naF6.2053437294270974\naa(lp1876\nF-12.525149649382229\naF17.137738718417253\naa(lp1877\nF-20.747829964571125\naF16.063314269846707\naa(lp1878\nF-25.952533288084439\naF13.117754842519108\naa(lp1879\nF-27.457187672652722\naF6.2502245992504939\naasg52\nVquadratic\np1880\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1881\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1882\nsg65\nVtail_1\np1883\nsg67\nI00\nsg68\nVpolygon\np1884\nsg70\n(lp1885\nF113.66473872577672\naF276.63577565511025\nasa(dp1886\ng29\nVhidden\np1887\nsg31\n(I138\nI146\nI146\nI180\ntp1888\nsg34\nI0\nsg35\nI00\nsg37\nI30\nsg44\nI00\nsg39\nNsg40\n(lp1889\nsg42\nNsg111\n(lp1890\nVtail_1\np1891\nasg45\nI0\nsg46\n(lp1892\n(lp1893\nF14.142135623730951\naF14.142135623730951\naa(lp1894\nF14.142135623730951\naF-14.142135623730949\n"
		+ "aa(lp1895\nF-14.142135623730949\naF-14.142135623730955\naa(lp1896\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1897\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1898\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1899\nsg65\nVitem_18\np1900\nsg67\nI00\nsg68\nVrect\np1901\nsg70\n(lp1902\nF-158.65805518577565\naF211.12179833888405\nasa(dp1903\ng29\nVhidden\np1904\nsg31\n(I138\nI146\nI146\nI180\ntp1905\nsg34\nI0\nsg35\nI00\nsg37\nI30\nsg44\nI00\nsg39\nNsg40\n(lp1906\nsg42\nNsg111\n(lp1907\nVtail_2\np1908\nasg45\nI0\nsg46\n(lp1909\n(lp1910\nF14.142135623730951\naF14.142135623730951\naa(lp1911\nF14.142135623730951\naF-14.142135623730949\naa(lp1912\nF-14.142135623730949\naF-14.142135623730955\naa(lp1913\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1914\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1915\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1916\nsg65\nVitem_31\np1917\nsg67\nI00\nsg68\nVrect\np1918\nsg70\n(lp1919\nF-158.65805518577565\naF194.12179833888405\nasa(dp1920\ng29\nVhidden\np1921\nsg31\n(I138\nI146\nI146\nI180\ntp1922\nsg34\nI0\nsg35\nI00\nsg37\nI30\nsg44\nI00\nsg39\nNsg40\n(lp1923\n"
		+ "sg42\nNsg111\n(lp1924\nVtail_3\np1925\nasg45\nI0\nsg46\n(lp1926\n(lp1927\nF14.142135623730951\naF14.142135623730951\naa(lp1928\nF14.142135623730951\naF-14.142135623730949\naa(lp1929\nF-14.142135623730949\naF-14.142135623730955\naa(lp1930\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1931\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1932\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1933\nsg65\nVitem_38\np1934\nsg67\nI00\nsg68\nVrect\np1935\nsg70\n(lp1936\nF-158.65805518577565\naF177.12179833888405\nasa(dp1937\ng29\nVhidden\np1938\nsg31\n(I138\nI146\nI146\nI180\ntp1939\nsg34\nI12\nsg35\nI00\nsg37\nI30\nsg44\nI00\nsg39\nNsg40\n(lp1940\nsg42\nNsg111\n(lp1941\nVtail_4\np1942\nasg45\nI20\nsg46\n(lp1943\n(lp1944\nF14.142135623730951\naF14.142135623730951\naa(lp1945\nF14.142135623730951\naF-14.142135623730949\naa(lp1946\nF-14.142135623730949\naF-14.142135623730955\naa(lp1947\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1948\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1949\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1950\nsg65\nVitem_39\np1951\nsg67\nI00\nsg68\nVrect\np1952\nsg70\n(lp1953\n"
		+ "F-158.65805518577565\naF160.12179833888405\nasa(dp1954\ng29\nVhidden\np1955\nsg31\n(I138\nI146\nI146\nI180\ntp1956\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1957\nsg42\nNsg111\n(lp1958\nVtail_loca_1\np1959\nasg45\nI40\nsg46\n(lp1960\n(lp1961\nF14.142135623730951\naF14.142135623730951\naa(lp1962\nF14.142135623730951\naF-14.142135623730949\naa(lp1963\nF-14.142135623730949\naF-14.142135623730955\naa(lp1964\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1965\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1966\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1967\nsg65\nVtail_local_1\np1968\nsg67\nI00\nsg68\nVcircle\np1969\nsg70\n(lp1970\nF92.128741536448103\naF260.20451951215125\nasa(dp1971\ng29\nVdefault\np1972\nsg31\n(I138\nI146\nI146\nI180\ntp1973\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp1974\nsg42\nNsg111\n(lp1975\nVtail_local_2\np1976\nasg45\nI40\nsg46\n(lp1977\n(lp1978\nF14.142135623730951\naF14.142135623730951\naa(lp1979\nF14.142135623730951\naF-14.142135623730949\naa(lp1980\nF-14.142135623730949\naF-14.142135623730955\naa(lp1981\nF-14.142135623730955\naF14.142135623730947\n"
		+ "aasg52\nVlinear\np1982\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp1983\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp1984\nsg65\nVtail_local_2\np1985\nsg67\nI00\nsg68\nVcircle\np1986\nsg70\n(lp1987\nF-6.7561669731785088\naF256.17985389458659\nasa(dp1988\ng29\nVhidden\np1989\nsg31\n(I138\nI146\nI146\nI180\ntp1990\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp1991\nsg42\nNsg111\n(lp1992\nVtail_local_3\np1993\nasg45\nI40\nsg46\n(lp1994\n(lp1995\nF14.142135623730951\naF14.142135623730951\naa(lp1996\nF14.142135623730951\naF-14.142135623730949\naa(lp1997\nF-14.142135623730949\naF-14.142135623730955\naa(lp1998\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np1999\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2000\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2001\nsg65\nVtail_local_3\np2002\nsg67\nI00\nsg68\nVcircle\np2003\nsg70\n(lp2004\nF132.24701982309415\naF255.05502408895435\nasa(dp2005\ng29\nVhidden\np2006\nsg31\n(I138\nI146\nI146\nI180\ntp2007\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp2008\nsg42\nNsg111\n(lp2009\nVtail_local_4\np2010\nasg45\nI40\nsg46\n(lp2011\n(lp2012\nF14.142135623730951\n"
		+ "aF14.142135623730951\naa(lp2013\nF14.142135623730951\naF-14.142135623730949\naa(lp2014\nF-14.142135623730949\naF-14.142135623730955\naa(lp2015\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2016\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2017\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2018\nsg65\nVtail_local_4\np2019\nsg67\nI00\nsg68\nVcircle\np2020\nsg70\n(lp2021\nF152.8184110164438\naF258.95897795536189\nasa(dp2022\ng29\nVhidden\np2023\nsg31\n(I138\nI146\nI146\nI180\ntp2024\nsg34\nI20\nsg35\nI00\nsg37\nI7\nsg39\nNsg40\n(lp2025\nsg42\nNsg44\nI00\nsg45\nI40\nsg46\n(lp2026\n(lp2027\nF14.142135623730951\naF14.142135623730951\naa(lp2028\nF14.142135623730951\naF-14.142135623730949\naa(lp2029\nF-14.142135623730949\naF-14.142135623730955\naa(lp2030\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2031\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2032\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2033\nsg65\nVitem_48\np2034\nsg67\nI00\nsg68\nVcircle\np2035\nsg70\n(lp2036\nF-157.77216323851226\naF142.88456364803903\nasa(dp2037\ng29\nVhidden\np2038\nsg31\n(I138\nI146\nI146\nI180\ntp2039\n"
		+ "sg34\nI0\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2040\nsg42\nNsg111\n(lp2041\nVtail_2\np2042\naVTail_B\np2043\nasg45\nI0\nsg46\n(lp2044\n(lp2045\nF-27.270427429267627\naF-5.0838920114947257\naa(lp2046\nF-20.575407063155353\naF-7.2573225186407093\naa(lp2047\nF-13.752826970971142\naF-7.0695892392021857\naa(lp2048\nF-16.064468560038986\naF5.8456261496086679\naa(lp2049\nF-13.897024727720208\naF19.735627892946642\naa(lp2050\nF-20.66020797803229\naF19.624851768245627\naa(lp2051\nF-26.957101644963799\naF18.174761163776743\naa(lp2052\nF-30.029168368354476\naF6.2502245992504939\naasg52\nVquadratic\np2053\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2054\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2055\nsg65\nVtail_2\np2056\nsg67\nI00\nsg68\nVpolygon\np2057\nsg70\n(lp2058\nF132.86593434093098\naF275.73507252876249\nasa(dp2059\ng29\nVhidden\np2060\nsg31\n(I138\nI146\nI146\nI180\ntp2061\nsg34\nI0\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2062\nsg42\nNsg111\n(lp2063\nVtail_3\np2064\naVTail_C\np2065\nasg45\nI0\nsg46\n(lp2066\n(lp2067\nF-23.889082178974391\naF-7.5479574332509571\naa(lp2068\nF-16.40268313726159\n"
		+ "aF-8.5163340480052092\naa(lp2069\nF-8.8426820064496354\naF-7.123546876174947\naa(lp2070\nF-11.208281232490204\naF6.2053437294270974\naa(lp2071\nF-8.6811198203530182\naF19.735627892946649\naa(lp2072\nF-16.235681746265627\naF21.261566756419473\naa(lp2073\nF-24.097346885407305\naF19.973349062868881\naa(lp2074\nF-27.457187672652722\naF6.2502245992504939\naasg52\nVquadratic\np2075\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2076\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2077\nsg65\nVtail_3\np2078\nsg67\nI00\nsg68\nVpolygon\np2079\nsg70\n(lp2080\nF148.59003718613602\naF275.87759305689389\nasa(dp2081\ng29\nVhidden\np2082\nsg31\n(I138\nI146\nI146\nI180\ntp2083\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2084\nsg42\nNsg111\n(lp2085\nVtail_4\np2086\naVTail_D\np2087\nasg45\nI40\nsg46\n(lp2088\n(lp2089\nF-23.493392841174128\naF-6.7565787576504093\naa(lp2090\nF-15.215615123860786\naF-6.106226263221739\naa(lp2091\nF-8.8426820064496354\naF-4.1558768426729156\naa(lp2092\nF-10.488846072853359\naF6.2053437294270974\naa(lp2093\nF-9.0768091581533028\naF16.408240279626195\naa(lp2094\nF-16.163738230301952\n"
		+ "aF18.545699028790345\naa(lp2095\nF-23.55777051567965\naF19.074055113322814\naa(lp2096\nF-26.018317353379018\naF5.8905070194320643\naasg52\nVquadratic\np2097\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2098\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2099\nsg65\nVtail_4\np2100\nsg67\nI00\nsg68\nVpolygon\np2101\nsg70\n(lp2102\nF168.19397550743696\naF276.02986994657635\nasa(dp2103\ng29\nVhidden\np2104\nsg31\n(I138\nI146\nI146\nI180\ntp2105\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2106\nsg42\nNsg111\n(lp2107\nVtail_local_5\np2108\naVTail_E\np2109\nasg45\nI40\nsg46\n(lp2110\n(lp2111\nF-14.461739773329636\naF-8.5053332871157963\naa(lp2112\nF-4.3187725265965842\naF-5.6850499332475835\naa(lp2113\nF-0.1458170596776327\naF0.51333717521296762\naa(lp2114\nF-6.3401379307391341\naF7.1715148898522578\naa(lp2115\nF-14.46209850301457\naF8.928179099259264\naa(lp2116\nF-16.711537953958356\naF0.32724546954303957\naasg52\nVquadratic\np2117\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2118\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2119\nsg65\nVtail_5\np2120\nsg67\nI00\nsg68\nVpolygon\np2121\nsg70\n(lp2122\n"
		+ "F178.10519253479509\naF282.00635812824027\nasa(dp2123\ng29\nVdefault\np2124\nsg31\n(I146\nI141\nI115\nI180\ntp2125\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2126\nsg42\nNsg111\n(lp2127\nVtail_control\np2128\naVtail_controls\np2129\nasg45\nI40\nsg46\n(lp2130\n(lp2131\nF-13.282336512261907\naF0.97416408419720124\naa(lp2132\nF0.94048322800312079\naF-8.4838390747519519\naa(lp2133\nF-17.972406102848499\naF-20.12693916874872\naa(lp2134\nF-17.820131967384906\naF9.0798070830269584\naa(lp2135\nF-13.389365333382791\naF8.9811251015099813\naasg52\nVlinear\np2136\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2137\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2138\nsg65\nVtail_controls\np2139\nsg67\nI00\nsg68\nVpolygon\np2140\nsg70\n(lp2141\nF-40.01777749198385\naF280.71062920939539\nasa(dp2142\ng29\nVik\np2143\nsg31\n(I146\nI141\nI115\nI180\ntp2144\nsg34\nI0\nsg35\nI01\nsg37\nI45\nsg44\nI00\nsg39\nNsg40\n(lp2145\nsg42\nNsg111\n(lp2146\nVlook\np2147\nasg45\nI0\nsg46\n(lp2148\n(lp2149\nF14.142135623730951\naF14.142135623730951\naa(lp2150\nF14.142135623730951\naF-14.142135623730949\naa(lp2151\nF-14.142135623730949\naF-14.142135623730955\n"
		+ "aa(lp2152\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2153\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2154\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2155\nsg65\nVitem_look_ik\np2156\nsg67\nI00\nsg68\nVrect\np2157\nsg70\n(lp2158\nF-60.985938509762249\naF-142.30052318944513\nasa(dp2159\ng29\nVdefault\np2160\nsg31\n(I85\nI170\nI127\nI255\ntp2161\nsg33\nS'3'\nsg34\nI31\nsg35\nI01\nsg36\nI255\nsg37\nI100\nsg38\nF-1\nsg39\nNsg40\n(lp2162\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000ageo = ns+\"geo\"\\u000a\\u000ageo_list = [geo]\\u000achar_gr = cmds.listRelatives(geo, p=1)[0]\\u000a\\u000aif cmds.listRelatives(char_gr, p=1):\\u000a    top_gr = cmds.listRelatives(char_gr, p=1)[0]\\u000a    if \"main\" in top_gr:\\u000a        for gr in cmds.listRelatives(top_gr):\\u000a            if gr != char_gr:\\u000a                geo_gr = gr.replace(\"main\", \"geo\")\\u000a                if cmds.objExists(geo_gr):\\u000a                    geo_list.append(geo_gr)\\u000a\\u000aroot_name = self.main.get_root_name()\\u000aviews = self.main.views[root_name]\\u000asel = cmds.ls(sl=1)\\u000a\\u000adef getSmooth():\\u000a    global geo\\u000a    for o in cmds.listRelatives(geo, allDescendents=1):\\u000a        shapes = cmds.listRelatives(o, s=1) or []\\u000a        for s in shapes:\\u000a            if 'scaleCube' in s:\\u000a                continue\\u000a            if not cmds.getAttr(s+'.intermediateObject'):\\u000a                smooth = 3 in cmds.displaySmoothness( s, q=True, polygonObject=True )\\u000a                return (smooth)\\u000a\\u000aif cmds.objExists(geo):\\u000a    cmds.select(geo_list)\\u000a    if not getSmooth():\\u000a        cmds.displaySmoothness(divisionsU=0, divisionsV=3, pointsWire=16, pointsShaded=4, polygonObject=3)\\u000a    else:\\u000a        cmds.displaySmoothness(divisionsU=0, divisionsV=0, pointsWire=4, pointsShaded=1, polygonObject=1)\\u000a\\u000a    if sel:\\u000a        cmds.select(sel)\\u000a    else:\\u000a        cmds.select(clear=1)\\u000a\\u000a\\u000afor view in views:\\u000a    for item in view.items:\\u000a        if item.name == \"common_item_smooth\" or item.name == \"common_face_smooth\":\\u000a            if getSmooth():\\u000a                item.text.set_text(\"3\")\\u000a                item.set_color(QtGui.QColor(85, 170, 127, 255))\\u000a            else:\\u000a                item.text.set_text(\"1\")\\u000a                item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000a\\u000a\\u000a    self.view.scene().update()\n"
		+ "p2163\nsg44\nI00\nsg45\nI22\nsg46\n(lp2164\n(lp2165\nF14.142135623730951\naF14.142135623730951\naa(lp2166\nF14.142135623730951\naF-14.142135623730949\naa(lp2167\nF-14.142135623730949\naF-14.142135623730955\naa(lp2168\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2169\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp2170\nsg59\nNsg60\nI0\nsg61\n(dp2171\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2172\nsg65\nVitem_smooth\np2173\nsg67\nI00\nsg68\nVrect\np2174\nsg70\n(lp2175\nF150.97125521449058\naF-138.8302910917262\nasa(dp2176\ng29\nVoffset\np2177\nsg31\n(I119\nI126\nI126\nI180\ntp2178\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp2179\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np2180\nsg111\n(lp2181\nVl_foot_finger4\np2182\naVl_foot_ringFinger\np2183\nasg45\nI40\nsg46\n(lp2184\n(lp2185\nF14.142135623730951\naF14.142135623730951\naa(lp2186\nF14.142135623730951\naF-14.142135623730949\n"
		+ "aa(lp2187\nF-14.142135623730949\naF-14.142135623730955\naa(lp2188\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2189\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2190\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2191\nsg65\nVfoot_finger_4\np2192\nsg67\nI00\nsg68\nVcircle\np2193\nsg70\n(lp2194\nF142.56930194725314\naF229.79078626668573\nasa(dp2195\ng29\nVoffset\np2196\nsg31\n(I119\nI126\nI126\nI180\ntp2197\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp2198\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np2199\nsg111\n(lp2200\nVr_foot_finger4\np2201\naVr_foot_ringFinger\np2202\nasg45\nI40\nsg46\n(lp2203\n(lp2204\nF-14.142135623730951\naF14.142135623730951\naa(lp2205\nF-14.142135623730951\naF-14.142135623730949\naa(lp2206\nF14.142135623730949\naF-14.142135623730955\naa(lp2207\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2208\nsg54\nI255\nsg55\nI01\nsg56\n"
		+ "F1\nsg59\nNsg60\nI0\nsg61\n(dp2209\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2210\nsg65\nVfoot_finger_4_MIRROR\np2211\nsg67\nI01\nsg68\nVcircle\np2212\nsg70\n(lp2213\nF-142.56930194725314\naF229.79078626668573\nasa(dp2214\ng29\nVdefault\np2215\nsg31\n(I146\nI141\nI115\nI180\ntp2216\nsg34\nI0\nsg35\nI01\nsg37\nI45\nsg44\nI00\nsg39\nNsg40\n(lp2217\nsg42\nNsg111\n(lp2218\nVeyes_look_fk\np2219\naVlook\np2220\nasg45\nI0\nsg46\n(lp2221\n(lp2222\nF14.142135623730951\naF14.142135623730951\naa(lp2223\nF14.142135623730951\naF-14.142135623730949\naa(lp2224\nF-14.142135623730949\naF-14.142135623730955\naa(lp2225\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2226\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2227\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2228\nsg65\nVbody_look_fk\np2229\nsg67\nI00\nsg68\nVrect\np2230\nsg70\n(lp2231\nF-60.916061957054652\naF-144.49811577491445\nasa(dp2232\ng29\nVhidden\np2233\nsg31\n(I146\nI141\nI115\nI180\ntp2234\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2235\nsg42\nNsg111\n(lp2236\nVl_ear_1\np2237\naVl_ear\np2238\naVl_ear_A\np2239\naVl_ear_a\np2240\nasg45\nI40\nsg46\n(lp2241\n(lp2242\n"
		+ "F-10.28491661029792\naF10.489838633128029\naa(lp2243\nF-15.606651770337894\naF5.9091036977313696\naa(lp2244\nF-21.8220879048136\naF2.3959280614562561\naa(lp2245\nF-33.382351822752987\naF0.89034770978367617\naa(lp2246\nF-32.681952885754775\naF12.961225897868058\naa(lp2247\nF-23.449796341207851\naF18.075663295840769\naa(lp2248\nF-16.596210006850029\naF24.845188205566121\naa(lp2249\nF-5.0359460889106691\naF21.274226398296481\naasg52\nVquadratic\np2250\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2251\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2252\nsg65\nVear_1\np2253\nsg67\nI00\nsg68\nVpolygon\np2254\nsg70\n(lp2255\nF45.426283590024525\naF-188.56061649919303\nasa(dp2256\ng29\ng2233\nsg31\n(I146\nI141\nI115\nI180\ntp2257\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2258\nsg42\nNsg111\n(lp2259\nVl_ear_2\np2260\naVl_ear2\np2261\naVl_ear_b\np2262\naVl_ear_B\np2263\nasg45\nI40\nsg46\n(lp2264\n(lp2265\nF-9.64263388843281\naF6.1674004319364402\naa(lp2266\nF-11.849371233875885\naF1.1558912579961778\naa(lp2267\nF-18.222318553407707\naF-0.063051694526104679\naa(lp2268\nF-27.312833309525175\naF0.72846630800482604\n"
		+ "aa(lp2269\nF-25.452189151565861\naF11.340405360830671\naa(lp2270\nF-21.273718244260685\naF16.224778020411211\naa(lp2271\nF-15.702171535667322\naF17.432727992398792\naa(lp2272\nF-6.4876036479505981\naF17.150377698472781\naasg52\nVquadratic\np2273\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2274\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2275\nsg65\nVear_2\np2276\nsg67\nI00\nsg68\nVpolygon\np2277\nsg70\n(lp2278\nF49.817512157056882\naF-202.45333544539983\nasa(dp2279\ng29\ng2233\nsg31\n(I146\nI141\nI115\nI180\ntp2280\nsg34\nI20\nsg35\nI00\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp2281\nsg42\nNsg111\n(lp2282\nVl_ear_3\np2283\naVl_ear_c\np2284\naVl_ear_C\np2285\nasg45\nI40\nsg46\n(lp2286\n(lp2287\nF14.142135623730951\naF14.142135623730951\naa(lp2288\nF14.142135623730951\naF-14.142135623730949\naa(lp2289\nF-14.142135623730949\naF-14.142135623730955\naa(lp2290\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2291\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2292\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2293\nsg65\nVear_3\np2294\nsg67\nI00\nsg68\nVcircle\np2295\nsg70\n(lp2296\nF36.200621787098804\naF-211.18369661019389\n"
		+ "asa(dp2297\ng29\ng2233\nsg31\n(I146\nI141\nI115\nI180\ntp2298\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp2299\nsg42\nNsg111\n(lp2300\nVr_ear_1\np2301\naVr_ear\np2302\naVr_ear_A\np2303\naVr_ear_a\np2304\nasg45\nI40\nsg46\n(lp2305\n(lp2306\nF10.28491661029792\naF10.489838633128029\naa(lp2307\nF15.606651770337894\naF5.9091036977313696\naa(lp2308\nF21.8220879048136\naF2.3959280614562561\naa(lp2309\nF33.382351822752987\naF0.89034770978367617\naa(lp2310\nF32.681952885754775\naF12.961225897868058\naa(lp2311\nF23.449796341207851\naF18.075663295840769\naa(lp2312\nF16.596210006850029\naF24.845188205566121\naa(lp2313\nF5.0359460889106691\naF21.274226398296481\naasg52\nVquadratic\np2314\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2315\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2316\nsg65\nVear_1_MIRROR\np2317\nsg67\nI01\nsg68\nVpolygon\np2318\nsg70\n(lp2319\nF-45.426283590024525\naF-188.56061649919303\nasa(dp2320\ng29\ng2233\nsg31\n(I146\nI141\nI115\nI180\ntp2321\nsg34\nI20\nsg35\nI00\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp2322\nsg42\nNsg111\n(lp2323\nVr_ear_2\np2324\naVr_ear2\np2325\naVr_ear_b\np2326\naVr_ear_B\n"
		+ "p2327\nasg45\nI40\nsg46\n(lp2328\n(lp2329\nF9.64263388843281\naF6.1674004319364402\naa(lp2330\nF11.849371233875885\naF1.1558912579961778\naa(lp2331\nF18.222318553407707\naF-0.063051694526104679\naa(lp2332\nF27.312833309525175\naF0.72846630800482604\naa(lp2333\nF25.452189151565861\naF11.340405360830671\naa(lp2334\nF21.273718244260685\naF16.224778020411211\naa(lp2335\nF15.702171535667322\naF17.432727992398792\naa(lp2336\nF6.4876036479505981\naF17.150377698472781\naasg52\nVquadratic\np2337\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2338\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2339\nsg65\nVear_2_MIRROR\np2340\nsg67\nI01\nsg68\nVpolygon\np2341\nsg70\n(lp2342\nF-49.817512157056882\naF-202.45333544539983\nasa(dp2343\ng29\ng2233\nsg31\n(I146\nI141\nI115\nI180\ntp2344\nsg34\nI20\nsg35\nI00\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp2345\nsg42\nNsg111\n(lp2346\nVr_ear_3\np2347\naVr_ear_c\np2348\naVr_ear_C\np2349\nasg45\nI40\nsg46\n(lp2350\n(lp2351\nF-14.142135623730951\naF14.142135623730951\naa(lp2352\nF-14.142135623730951\naF-14.142135623730949\naa(lp2353\nF14.142135623730949\naF-14.142135623730955\naa(lp2354\n"
		+ "F14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2355\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2356\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2357\nsg65\nVear_3_MIRROR\np2358\nsg67\nI01\nsg68\nVcircle\np2359\nsg70\n(lp2360\nF-36.200621787098804\naF-211.18369661019389\nasa(dp2361\ng29\nVdefault\np2362\nsg31\n(I150\nI150\nI150\nI180\ntp2363\nsg33\nS'P'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp2364\nsg42\n"
		+ "V#print (\"Change parent\")\\u000a\\u000a# Run by RMB\\u000a'''-------------------\"RMBRunStart\"\\u000adef switchAnimation(id):\\u000a    import rigStudio_picker.animTools.rs_changeParent as rs_changeParent\\u000a    rs_changeParent.animation_run(id)\\u000aprint (\"RMB Action\")\\u000a\\u000adef switchParent(id):\\u000a    import rigStudio_picker.animTools.rs_changeParent as rs_changeParent\\u000a    rs_changeParent.run(value=id)\\u000a\t\t\t\t\t\\u000asel = cmds.ls(sl=1)\\u000aif len(sel) == 0:\\u000a    print (\"select control with parent attribute\")\\u000aelse:\\u000a    for o in sel:\\u000a        if not cmds.attributeQuery( 'parent', node=o, exists=True ):\\u000a            print (\"control\", o, \"has not parent attribute\")\\u000a            #return\t\t\\u000a\\u000a    if cmds.objExists(o+'.parent'):\\u000a        menu_items = cmds.attributeQuery(\"parent\", node=o, listEnum=True)[0].split(\":\")\\u000a\\u000a        title_action = QtWidgets.QAction(\"Change parent\", None)\\u000a        menu.addAction(title_action)\\u000a        sep_action = QtWidgets.QAction(\"\", None)\\u000a        sep_action.setSeparator(True)\\u000a        menu.addAction(sep_action)\\u000a\\u000a        s_all_actions = {}\\u000a        file_submenu = menu.addMenu(\"in current frame\")\\u000a        s_actions = []\\u000a        for s_action_name in menu_items:\\u000a            s_action = QtWidgets.QAction(s_action_name, None)\\u000a            s_action.triggered.connect(partial(switchParent, s_action_name))\\u000a            file_submenu.addAction(s_action)\\u000a            s_actions.append(s_action)\\u000a\\u000a        file_submenu2 = menu.addMenu(\"in animation\")\\u000a\\u000a        for s_action_name in menu_items:\\u000a            s_action = QtWidgets.QAction(s_action_name, None)\\u000a            s_action.triggered.connect(partial(switchAnimation, s_action_name))\\u000a            file_submenu2.addAction(s_action)\\u000a            s_actions.append(s_action)\\u000a\\u000a\\u000a\\u000a\"RMBRunEnd\"---------------------'''\\u000a\\u000a\\u000a\\u000a# Run by LMB\\u000a\\u000aimport importlib\\u000aimport rigStudio_picker.animTools.rs_changeParent as rs_changeParent\\u000aimportlib.reload(rs_changeParent)\\u000a\\u000ars_changeParent.run()\\u000a\\u000a\\u000a\n"
		+ "p2365\nsg44\nI00\nsg45\nI24\nsg46\n(lp2366\n(lp2367\nF14.142135623730951\naF14.142135623730951\naa(lp2368\nF14.142135623730951\naF-14.142135623730949\naa(lp2369\nF-14.142135623730949\naF-14.142135623730955\naa(lp2370\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2371\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp2372\nsg59\nNsg60\nI0\nsg61\n(dp2373\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2374\nsg65\nVbody_parent\np2375\nsg67\nI00\nsg68\nVrect\np2376\nsg70\n(lp2377\nF150.22535211267606\naF-170.40845070422534\nasa(dp2378\ng29\nVdefault\np2379\nsg31\n(I150\nI150\nI150\nI180\ntp2380\nsg33\nS'S'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI100\nsg38\nF-1\nsg39\nNsg40\n(lp2381\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    import importlib\\u000a    import pk_selector_switchIKFK\\u000a    pk_selector_switchIKFK.snapElbowKnee()\\u000aelse:\\u000a    mel.eval('human_handleSnap')\\u000a\np2382\nsg44\nI00\nsg45\nI24\nsg46\n(lp2383\n(lp2384\nF14.142135623730951\naF14.142135623730951\n"
		+ "aa(lp2385\nF14.142135623730951\naF-14.142135623730949\naa(lp2386\nF-14.142135623730949\naF-14.142135623730955\naa(lp2387\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2388\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp2389\nsg59\nNsg60\nI0\nsg61\n(dp2390\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2391\nsg65\nVbody_snap\np2392\nsg67\nI00\nsg68\nVrect\np2393\nsg70\n(lp2394\nF-131\naF-126\nasa(dp2395\ng29\nVfk\np2396\nsg31\n(I138\nI146\nI146\nI180\ntp2397\nsg34\nI20\nsg35\nI01\nsg37\nI31\nsg44\nI00\nsg39\nNsg40\n(lp2398\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000a\\u000aif cmds.getModifiers() == 1:\\u000a    cmds.select(ns+'controlSet', add=1)\\u000aelse:\\u000a    cmds.select(ns+'controlSet')\\u000aprint (self )\np2399\nsg111\n(lp2400\nVhead_local\np2401\nasg45\nI40\nsg46\n(lp2402\n(lp2403\nF14.142135623730951\naF14.142135623730951\naa(lp2404\nF14.142135623730951\naF-14.142135623730949\naa(lp2405\nF-14.142135623730949\naF-14.142135623730955\naa(lp2406\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2407\nsg54\nI255\n"
		+ "sg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2408\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2409\nsg65\nVhead_local\np2410\nsg67\nI00\nsg68\nVcircle\np2411\nsg70\n(lp2412\nF0\naF-142.05148169844415\nasa(dp2413\ng29\nVik\np2414\nsg31\n(I146\nI141\nI115\nI180\ntp2415\nsg34\nI0\nsg35\nI01\nsg37\nI45\nsg44\nI00\nsg39\nNsg40\n(lp2416\nsg42\nNsg111\n(lp2417\nVlookTarget\np2418\naVeyes_look_ik\np2419\nasg45\nI0\nsg46\n(lp2420\n(lp2421\nF14.142135623730951\naF14.142135623730951\naa(lp2422\nF14.142135623730951\naF-14.142135623730949\naa(lp2423\nF-14.142135623730949\naF-14.142135623730955\naa(lp2424\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2425\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2426\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2427\nsg65\nVitem_1\np2428\nsg67\nI00\nsg68\nVrect\np2429\nsg70\n(lp2430\nF-60.985938509762249\naF-142.30052318944513\nasa(dp2431\ng29\nVik\np2432\nsg31\n(I146\nI141\nI115\nI180\ntp2433\nsg34\nI0\nsg35\nI01\nsg37\nI45\nsg44\nI00\nsg39\nNsg40\n(lp2434\nsg42\nNsg111\n(lp2435\nVeyes_look_ik\np2436\naVlookTarget\np2437\naVlook_ik\np2438\nasg45\nI0\nsg46\n(lp2439\n(lp2440\nF14.142135623730951\naF14.142135623730951\n"
		+ "aa(lp2441\nF14.142135623730951\naF-14.142135623730949\naa(lp2442\nF-14.142135623730949\naF-14.142135623730955\naa(lp2443\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2444\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2445\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2446\nsg65\nVitem_2\np2447\nsg67\nI00\nsg68\nVrect\np2448\nsg70\n(lp2449\nF-60.985938509762249\naF-142.30052318944513\nasa(dp2450\ng29\nVik\np2451\nsg31\n(I146\nI141\nI115\nI180\ntp2452\nsg34\nI0\nsg35\nI01\nsg37\nI45\nsg44\nI00\nsg39\nNsg40\n(lp2453\nsg42\nNsg111\n(lp2454\nVlook_ik\np2455\naVlookTarget\np2456\naVeyes_look_ik\np2457\nasg45\nI0\nsg46\n(lp2458\n(lp2459\nF14.142135623730951\naF14.142135623730951\naa(lp2460\nF14.142135623730951\naF-14.142135623730949\naa(lp2461\nF-14.142135623730949\naF-14.142135623730955\naa(lp2462\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2463\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2464\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2465\nsg65\nVitem_3\np2466\nsg67\nI00\nsg68\nVrect\np2467\nsg70\n(lp2468\nF-60.985938509762249\naF-142.30052318944513\nasa(dp2469\ng29\nVdefault\np2470\n"
		+ "sg31\n(I146\nI141\nI115\nI180\ntp2471\nsg34\nI0\nsg35\nI01\nsg37\nI45\nsg44\nI00\nsg39\nNsg40\n(lp2472\nsg42\nNsg111\n(lp2473\nVeyes_look_ik\np2474\naVlookTarget\np2475\naVlook_ik\np2476\nasg45\nI0\nsg46\n(lp2477\n(lp2478\nF14.142135623730951\naF14.142135623730951\naa(lp2479\nF14.142135623730951\naF-14.142135623730949\naa(lp2480\nF-14.142135623730949\naF-14.142135623730955\naa(lp2481\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2482\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2483\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2484\nsg65\nVbody_look_ik\np2485\nsg67\nI00\nsg68\nVrect\np2486\nsg70\n(lp2487\nF-60.916061957054652\naF-145.13185034400294\nasa(dp2488\ng29\nVdefault\np2489\nsg31\n(I146\nI141\nI115\nI180\ntp2490\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2491\nsg42\nNsg111\n(lp2492\nVspine_fk_3\np2493\nasg45\nI40\nsg46\n(lp2494\n(lp2495\nF19.474925964376872\naF7.2284986250452405\naa(lp2496\nF22.169390613983957\naF3.2556769111045218\naa(lp2497\nF19.572909345826854\naF-0.89596437451363398\naa(lp2498\nF0.25296556303668544\naF-4.76138721612209\naa(lp2499\nF-18.731843325541405\naF-0.87685193676346551\n"
		+ "aa(lp2500\nF-20.912353509258978\naF3.1086284408130469\naa(lp2501\nF-18.70007222415542\naF7.3798972783585235\naa(lp2502\nF0.24579850648983889\naF9.6243368940057668\naasg52\nVquadratic\np2503\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2504\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2505\nsg65\nVstomach_1\np2506\nsg67\nI00\nsg68\nVpolygon\np2507\nsg70\n(lp2508\nF0\naF-71.167898682921461\nasa(dp2509\ng29\nVdefault\np2510\nsg31\n(I146\nI141\nI115\nI180\ntp2511\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2512\nsg42\nNsg111\n(lp2513\nVspine_fk_2\np2514\nasg45\nI40\nsg46\n(lp2515\n(lp2516\nF19.474925964376872\naF7.2284986250452405\naa(lp2517\nF22.169390613983957\naF3.2556769111045218\naa(lp2518\nF19.572909345826854\naF-0.89596437451363398\naa(lp2519\nF0.25296556303668544\naF-4.76138721612209\naa(lp2520\nF-18.731843325541405\naF-0.87685193676346551\naa(lp2521\nF-20.912353509258978\naF3.1086284408130469\naa(lp2522\nF-18.70007222415542\naF7.3798972783585235\naa(lp2523\nF0.24579850648983889\naF9.6243368940057668\naasg52\nVquadratic\np2524\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2525\n"
		+ "V1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2526\nsg65\nVstomach_2\np2527\nsg67\nI00\nsg68\nVpolygon\np2528\nsg70\n(lp2529\nF0\naF-29.13479710655217\nasa(dp2530\ng29\nVdefault\np2531\nsg31\n(I146\nI141\nI115\nI180\ntp2532\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2533\nsg42\nNsg111\n(lp2534\nVspine_fk_1\np2535\nasg45\nI40\nsg46\n(lp2536\n(lp2537\nF19.474925964376872\naF7.2284986250452405\naa(lp2538\nF22.169390613983957\naF3.2556769111045218\naa(lp2539\nF19.572909345826854\naF-0.89596437451363398\naa(lp2540\nF0.25296556303668544\naF-4.76138721612209\naa(lp2541\nF-18.731843325541405\naF-0.87685193676346551\naa(lp2542\nF-20.912353509258978\naF3.1086284408130469\naa(lp2543\nF-18.70007222415542\naF7.3798972783585235\naa(lp2544\nF0.24579850648983889\naF9.6243368940057668\naasg52\nVquadratic\np2545\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2546\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2547\nsg65\nVstomach_3\np2548\nsg67\nI00\nsg68\nVpolygon\np2549\nsg70\n(lp2550\nF0\naF11.077113417419934\nasa(dp2551\ng29\nVfk\np2552\nsg31\n(I146\nI141\nI115\nI180\ntp2553\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n"
		+ "(lp2554\nsg42\nNsg111\n(lp2555\nVhips_fk\np2556\nasg45\nI40\nsg46\n(lp2557\n(lp2558\nF14.142135623730951\naF14.142135623730951\naa(lp2559\nF14.142135623730951\naF-14.142135623730949\naa(lp2560\nF-14.142135623730949\naF-14.142135623730955\naa(lp2561\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2562\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2563\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2564\nsg65\nVitem_13\np2565\nsg67\nI00\nsg68\nVcircle\np2566\nsg70\n(lp2567\nF0.27067211282159231\naF90.521954823392903\nasa(dp2568\ng29\nVdefault\np2569\nsg31\n(I138\nI146\nI146\nI180\ntp2570\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2571\nsg42\nNsg111\n(lp2572\nVl_legUp_fk\np2573\nasg45\nI40\nsg46\n(lp2574\n(lp2575\nF-17.097757028597776\naF-32.766246408978716\naa(lp2576\nF-7.9728204208804225\naF-42.006271608069568\naa(lp2577\nF5.5157965601248948\naF-35.15783057625098\naa(lp2578\nF13.65980749983736\naF-10.549268489408803\naa(lp2579\nF7.4747455760491013\naF33.184603093639474\naa(lp2580\nF1.1108532531168391\naF37.395824535340161\naa(lp2581\nF-6.1076453998702602\naF35.914835770487343\n"
		+ "aa(lp2582\nF-15.669010251461486\naF-1.1381607880407141\naasg52\nVquadratic\np2583\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2584\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2585\nsg65\nVleg_fk\np2586\nsg67\nI00\nsg68\nVpolygon\np2587\nsg70\n(lp2588\nF27.065896455269073\naF109.66724279585789\nasa(dp2589\ng29\nVdefault\np2590\nsg31\n(I138\nI146\nI146\nI180\ntp2591\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2592\nsg42\nNsg111\n(lp2593\nVl_knee_fk\np2594\nasg45\nI40\nsg46\n(lp2595\n(lp2596\nF-8.5631738352952205\naF-35.561657420724607\naa(lp2597\nF-0.11089368779516746\naF-39.274427805500054\naa(lp2598\nF7.2439920997958218\naF-33.967510784037614\naa(lp2599\nF7.695903553993606\naF-12.644685601602195\naa(lp2600\nF-3.5033054947546036\naF20.982718421817484\naa(lp2601\nF-10.459363156900709\naF23.629588087852756\naa(lp2602\nF-14.589789603981759\naF17.958915723248019\naa(lp2603\nF-16.680507720288329\naF-13.740765239719304\naasg52\nVquadratic\np2604\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2605\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2606\nsg65\nVstomach_5\np2607\nsg67\nI00\nsg68\nVpolygon\n"
		+ "p2608\nsg70\n(lp2609\nF26.488854749185894\naF188.32574598386557\nasa(dp2610\ng29\nVdefault\np2611\nsg31\n(I138\nI146\nI146\nI180\ntp2612\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp2613\nsg42\nNsg111\n(lp2614\nVl_ankle_fk\np2615\nasg45\nI40\nsg46\n(lp2616\n(lp2617\nF-9.031853284246786\naF-22.41786556491321\naa(lp2618\nF-6.028252838576595\naF-24.761691615510212\naa(lp2619\nF-2.0038993243444905\naF-22.922977944054828\naa(lp2620\nF1.6837081508670666\naF-10.476653665136986\naa(lp2621\nF4.8486244355461601\naF-0.8942697080113291\naa(lp2622\nF1.144087789421615\naF4.7942058462872552\naa(lp2623\nF-4.5101804492619149\naF4.4336004380309042\naa(lp2624\nF-11.080947976714597\naF-9.0519921921952164\naasg52\nVquadratic\np2625\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2626\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2627\nsg65\nVstomach_6\np2628\nsg67\nI00\nsg68\nVpolygon\np2629\nsg70\n(lp2630\nF60.210458489080743\naF278.26878819312446\nasa(dp2631\ng29\nVdefault\np2632\nsg31\n(I138\nI146\nI146\nI180\ntp2633\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp2634\nsg42\nNsg111\n(lp2635\nVr_legUp_fk\np2636\n"
		+ "asg45\nI40\nsg46\n(lp2637\n(lp2638\nF17.097757028597776\naF-32.766246408978716\naa(lp2639\nF7.9728204208804225\naF-42.006271608069568\naa(lp2640\nF-5.5157965601248948\naF-35.15783057625098\naa(lp2641\nF-13.65980749983736\naF-10.549268489408803\naa(lp2642\nF-7.4747455760491013\naF33.184603093639474\naa(lp2643\nF-1.1108532531168391\naF37.395824535340161\naa(lp2644\nF6.1076453998702602\naF35.914835770487343\naa(lp2645\nF15.669010251461486\naF-1.1381607880407141\naasg52\nVquadratic\np2646\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2647\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2648\nsg65\nVleg_fk_MIRROR\np2649\nsg67\nI01\nsg68\nVpolygon\np2650\nsg70\n(lp2651\nF-27.065896455269073\naF109.66724279585789\nasa(dp2652\ng29\nVdefault\np2653\nsg31\n(I138\nI146\nI146\nI180\ntp2654\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp2655\nsg42\nNsg111\n(lp2656\nVr_knee_fk\np2657\nasg45\nI40\nsg46\n(lp2658\n(lp2659\nF8.5631738352952205\naF-35.561657420724607\naa(lp2660\nF0.11089368779516746\naF-39.274427805500054\naa(lp2661\nF-7.2439920997958218\naF-33.967510784037614\naa(lp2662\nF-7.695903553993606\n"
		+ "aF-12.644685601602195\naa(lp2663\nF3.5033054947546036\naF20.982718421817484\naa(lp2664\nF10.459363156900709\naF23.629588087852756\naa(lp2665\nF14.589789603981759\naF17.958915723248019\naa(lp2666\nF16.680507720288329\naF-13.740765239719304\naasg52\nVquadratic\np2667\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2668\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2669\nsg65\nVstomach_5_MIRROR\np2670\nsg67\nI01\nsg68\nVpolygon\np2671\nsg70\n(lp2672\nF-26.488854749185894\naF188.32574598386557\nasa(dp2673\ng29\nVdefault\np2674\nsg31\n(I138\nI146\nI146\nI180\ntp2675\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp2676\nsg42\nNsg111\n(lp2677\nVr_ankle_fk\np2678\nasg45\nI40\nsg46\n(lp2679\n(lp2680\nF9.031853284246786\naF-22.41786556491321\naa(lp2681\nF6.028252838576595\naF-24.761691615510212\naa(lp2682\nF2.0038993243444905\naF-22.922977944054828\naa(lp2683\nF-1.6837081508670666\naF-10.476653665136986\naa(lp2684\nF-4.8486244355461601\naF-0.8942697080113291\naa(lp2685\nF-1.144087789421615\naF4.7942058462872552\naa(lp2686\nF4.5101804492619149\naF4.4336004380309042\naa(lp2687\nF11.080947976714597\naF-9.0519921921952164\n"
		+ "aasg52\nVquadratic\np2688\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2689\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2690\nsg65\nVstomach_6_MIRROR\np2691\nsg67\nI01\nsg68\nVpolygon\np2692\nsg70\n(lp2693\nF-60.210458489080743\naF278.26878819312446\nasa(dp2694\ng29\nVfk\np2695\nsg31\n(I138\nI146\nI146\nI180\ntp2696\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp2697\nsg42\nNsg111\n(lp2698\nVr_foot_fk_toe\np2699\nasg45\nI40\nsg46\n(lp2700\n(lp2701\nF8.0894800523018446\naF11.560970015322258\naa(lp2702\nF9.094995410337674\naF4.036210770473426\naa(lp2703\nF24.069027873332406\naF1.7268425600316704\naa(lp2704\nF19.392074327870738\naF9.0907291963481445\naa(lp2705\nF19.356096769780009\naF14.721462072415267\naa(lp2706\nF7.7340354770249382\naF15.691727823645721\naasg52\nVquadratic\np2707\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2708\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2709\nsg65\nVfootFingers_fk_MIRROR\np2710\nsg67\nI01\nsg68\nVpolygon\np2711\nsg70\n(lp2712\nF-83.022769823947598\naF220.79006652657867\nasa(dp2713\ng29\nVik\np2714\nsg31\n(I138\nI146\nI146\nI180\ntp2715\nsg34\nI20\nsg35\nI01\nsg37\nI10\n"
		+ "sg44\nI01\nsg39\nNsg40\n(lp2716\nsg42\nNsg111\n(lp2717\nVr_knee_ik\np2718\nasg45\nI40\nsg46\n(lp2719\n(lp2720\nF-6.4894901462821037\naF1.2175328215101306\naa(lp2721\nF-1.5439824394341712\naF-12.154384509769056\naa(lp2722\nF12.401468841270288\naF-13.371917331279191\naa(lp2723\nF17.099896376036991\naF-0.64399734963148969\naa(lp2724\nF12.727924141067676\naF12.727919981647695\naa(lp2725\nF1.0766147478777881\naF11.938078651582584\naasg52\nVquadratic\np2726\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2727\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2728\nsg65\nVknee_ik_MIRROR\np2729\nsg67\nI01\nsg68\nVpolygon\np2730\nsg70\n(lp2731\nF-31.375137188606082\naF144.76958427602753\nasa(dp2732\ng29\nVik\np2733\nsg31\n(I122\nI118\nI96\nI180\ntp2734\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp2735\nsg42\nNsg111\n(lp2736\nVl_arm_upperBend\np2737\nasg45\nI0\nsg46\n(lp2738\n(lp2739\nF14.142135623730951\naF14.142135623730951\naa(lp2740\nF14.142135623730951\naF-14.142135623730949\naa(lp2741\nF-14.142135623730949\naF-14.142135623730955\naa(lp2742\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2743\n"
		+ "sg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2744\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2745\nsg65\nVitem_11\np2746\nsg67\nI00\nsg68\nVrect\np2747\nsg70\n(lp2748\nF90.589599864761411\naF-52.182462160900485\nasa(dp2749\ng29\nVik\np2750\nsg31\n(I122\nI118\nI96\nI180\ntp2751\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp2752\nsg42\nNsg111\n(lp2753\nVl_arm_lowerBend\np2754\nasg45\nI0\nsg46\n(lp2755\n(lp2756\nF14.142135623730951\naF14.142135623730951\naa(lp2757\nF14.142135623730951\naF-14.142135623730949\naa(lp2758\nF-14.142135623730949\naF-14.142135623730955\naa(lp2759\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2760\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2761\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2762\nsg65\nVitem_14\np2763\nsg67\nI00\nsg68\nVrect\np2764\nsg70\n(lp2765\nF119.08340955189634\naF-12.137108006008171\nasa(dp2766\ng29\nVoffset\np2767\nsg31\n(I122\nI118\nI96\nI180\ntp2768\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp2769\nsg42\nNsg111\n(lp2770\nVl_hand_offset\np2771\nasg45\nI40\nsg46\n(lp2772\n(lp2773\nF14.142135623730951\naF14.142135623730951\naa(lp2774\n"
		+ "F14.142135623730951\naF-14.142135623730949\naa(lp2775\nF-14.142135623730949\naF-14.142135623730955\naa(lp2776\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2777\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2778\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2779\nsg65\nVarm_offset_3\np2780\nsg67\nI00\nsg68\nVcircle\np2781\nsg70\n(lp2782\nF138.65463340327219\naF29.608237161372788\nasa(dp2783\ng29\nVoffset\np2784\nsg31\n(I122\nI118\nI96\nI180\ntp2785\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp2786\nsg42\nNsg111\n(lp2787\nVr_hand_offset\np2788\nasg45\nI40\nsg46\n(lp2789\n(lp2790\nF-14.142135623730951\naF14.142135623730951\naa(lp2791\nF-14.142135623730951\naF-14.142135623730949\naa(lp2792\nF14.142135623730949\naF-14.142135623730955\naa(lp2793\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2794\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2795\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2796\nsg65\nVarm_offset_3_MIRROR\np2797\nsg67\nI01\nsg68\nVcircle\np2798\nsg70\n(lp2799\nF-138.65463340327219\naF29.608237161372788\nasa(dp2800\ng29\nVik\np2801\nsg31\n(I138\nI146\nI146\n"
		+ "I180\ntp2802\nsg34\nI24\nsg35\nI01\nsg37\nI60\nsg44\nI00\nsg39\nNsg40\n(lp2803\nsg42\nNsg111\n(lp2804\nVtail_2\np2805\nasg45\nI10\nsg46\n(lp2806\n(lp2807\nF14.142135623730951\naF14.142135623730951\naa(lp2808\nF14.142135623730951\naF-14.142135623730949\naa(lp2809\nF-14.142135623730949\naF-14.142135623730955\naa(lp2810\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2811\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2812\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2813\nsg65\nVitem_4\np2814\nsg67\nI00\nsg68\nVrect\np2815\nsg70\n(lp2816\nF-6.4938096871349131\naF278.00717019069481\nasa(dp2817\ng29\nVik\np2818\nsg31\n(I138\nI146\nI146\nI180\ntp2819\nsg34\nI24\nsg35\nI01\nsg37\nI60\nsg44\nI00\nsg39\nNsg40\n(lp2820\nsg42\nNsg111\n(lp2821\nVtail_1\np2822\nasg45\nI10\nsg46\n(lp2823\n(lp2824\nF14.142135623730951\naF14.142135623730951\naa(lp2825\nF14.142135623730951\naF-14.142135623730949\naa(lp2826\nF-14.142135623730949\naF-14.142135623730955\naa(lp2827\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2828\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2829\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2830\n"
		+ "sg65\nVitem_7\np2831\nsg67\nI00\nsg68\nVrect\np2832\nsg70\n(lp2833\nF-20.493809687134913\naF278.00717019069481\nasa(dp2834\ng29\nVik\np2835\nsg31\n(I138\nI146\nI146\nI180\ntp2836\nsg34\nI24\nsg35\nI01\nsg37\nI60\nsg44\nI00\nsg39\nNsg40\n(lp2837\nsg42\nNsg111\n(lp2838\nVtail_4\np2839\nasg45\nI10\nsg46\n(lp2840\n(lp2841\nF14.142135623730951\naF14.142135623730951\naa(lp2842\nF14.142135623730951\naF-14.142135623730949\naa(lp2843\nF-14.142135623730949\naF-14.142135623730955\naa(lp2844\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2845\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2846\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2847\nsg65\nVitem_8\np2848\nsg67\nI00\nsg68\nVrect\np2849\nsg70\n(lp2850\nF21.506190312865087\naF278.00717019069481\nasa(dp2851\ng29\nVik\np2852\nsg31\n(I138\nI146\nI146\nI180\ntp2853\nsg34\nI24\nsg35\nI01\nsg37\nI60\nsg44\nI00\nsg39\nNsg40\n(lp2854\nsg42\nNsg111\n(lp2855\nVtail_3\np2856\nasg45\nI10\nsg46\n(lp2857\n(lp2858\nF14.142135623730951\naF14.142135623730951\naa(lp2859\nF14.142135623730951\naF-14.142135623730949\naa(lp2860\nF-14.142135623730949\naF-14.142135623730955\naa(lp2861\nF-14.142135623730955\n"
		+ "aF14.142135623730947\naasg52\nVlinear\np2862\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2863\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2864\nsg65\nVitem_15\np2865\nsg67\nI00\nsg68\nVrect\np2866\nsg70\n(lp2867\nF7.5061903128650869\naF278.00717019069481\nasa(dp2868\ng29\nVdefault\np2869\nsg31\n(I138\nI146\nI146\nI180\ntp2870\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp2871\nsg42\nNsg111\n(lp2872\nVtail_local_2\np2873\nasg45\nI40\nsg46\n(lp2874\n(lp2875\nF14.142135623730951\naF14.142135623730951\naa(lp2876\nF14.142135623730951\naF-14.142135623730949\naa(lp2877\nF-14.142135623730949\naF-14.142135623730955\naa(lp2878\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2879\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2880\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2881\nsg65\nVtail_local_5\np2882\nsg67\nI00\nsg68\nVcircle\np2883\nsg70\n(lp2884\nF7.2438330268214912\naF256.17985389458659\nasa(dp2885\ng29\nVdefault\np2886\nsg31\n(I138\nI146\nI146\nI180\ntp2887\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp2888\nsg42\nNsg111\n(lp2889\nVtail_local_2\np2890\nasg45\nI40\nsg46\n(lp2891\n(lp2892\n"
		+ "F14.142135623730951\naF14.142135623730951\naa(lp2893\nF14.142135623730951\naF-14.142135623730949\naa(lp2894\nF-14.142135623730949\naF-14.142135623730955\naa(lp2895\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2896\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2897\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2898\nsg65\nVtail_local_6\np2899\nsg67\nI00\nsg68\nVcircle\np2900\nsg70\n(lp2901\nF21.243833026821491\naF256.17985389458659\nasa(dp2902\ng29\nVdefault\np2903\nsg31\n(I138\nI146\nI146\nI180\ntp2904\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp2905\nsg42\nNsg111\n(lp2906\nVtail_local_2\np2907\nasg45\nI40\nsg46\n(lp2908\n(lp2909\nF14.142135623730951\naF14.142135623730951\naa(lp2910\nF14.142135623730951\naF-14.142135623730949\naa(lp2911\nF-14.142135623730949\naF-14.142135623730955\naa(lp2912\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2913\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2914\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2915\nsg65\nVtail_local_7\np2916\nsg67\nI00\nsg68\nVcircle\np2917\nsg70\n(lp2918\nF-20.756166973178509\naF256.17985389458659\n"
		+ "asa(dp2919\ng29\nVdefault\np2920\nsg31\n(I138\nI146\nI146\nI180\ntp2921\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp2922\nsg42\nNsg111\n(lp2923\nVtail_local_2\np2924\nasg45\nI40\nsg46\n(lp2925\n(lp2926\nF14.142135623730951\naF14.142135623730951\naa(lp2927\nF14.142135623730951\naF-14.142135623730949\naa(lp2928\nF-14.142135623730949\naF-14.142135623730955\naa(lp2929\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2930\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2931\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2932\nsg65\nVtail_local_8\np2933\nsg67\nI00\nsg68\nVcircle\np2934\nsg70\n(lp2935\nF35.243833026821491\naF276.17985389458659\nasa(dp2936\ng29\nVfk\np2937\nsg31\n(I146\nI141\nI115\nI180\ntp2938\nsg34\nI9\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp2939\nsg42\nNsg111\n(lp2940\nVeyes_look_fk\np2941\nasg45\nI18\nsg46\n(lp2942\n(lp2943\nF14.142135623730951\naF14.142135623730951\naa(lp2944\nF14.142135623730951\naF-14.142135623730949\naa(lp2945\nF-14.142135623730949\naF-14.142135623730955\naa(lp2946\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2947\nsg54\nI255\nsg55\nI01\n"
		+ "sg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2948\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2949\nsg65\nVlook_fk\np2950\nsg67\nI00\nsg68\nVrect\np2951\nsg70\n(lp2952\nF-58.901304444929892\naF-141.69700441681664\nasa(dp2953\ng29\nVik\np2954\nsg31\n(I146\nI141\nI115\nI180\ntp2955\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp2956\nsg42\nNsg111\n(lp2957\nVeyes_look_ik\np2958\nasg45\nI0\nsg46\n(lp2959\n(lp2960\nF14.142135623730951\naF14.142135623730951\naa(lp2961\nF14.142135623730951\naF-14.142135623730949\naa(lp2962\nF-14.142135623730949\naF-14.142135623730955\naa(lp2963\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np2964\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp2965\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp2966\nsg65\nVlook_ik\np2967\nsg67\nI00\nsg68\nVrect\np2968\nsg70\n(lp2969\nF-58.901304444929892\naF-141.69700441681664\nasa(dp2970\ng29\ng1307\nsg31\n(I146\nI141\nI115\nI180\ntp2971\nsg34\nI0\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\ng1309\nsg42\ng1310\nsg111\n(lp2972\nVl_upleg_twist\np2973\nasg45\nI0\nsg46\n(lp2974\n(lp2975\nF14.142135623730951\naF14.142135623730951\naa(lp2976\nF14.142135623730951\naF-14.142135623730949\n"
		+ "aa(lp2977\nF-14.142135623730949\naF-14.142135623730955\naa(lp2978\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1318\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng1319\nsg63\ng1320\nsg65\nVleg_offset_4\np2979\nsg67\nI00\nsg68\ng1322\nsg70\n(lp2980\nF51.681756248502225\naF103.43532450779051\nasa(dp2981\ng29\ng1307\nsg31\n(I146\nI141\nI115\nI180\ntp2982\nsg34\nI0\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\ng1309\nsg42\ng1310\nsg111\n(lp2983\nVl_leg_twist\np2984\nasg45\nI0\nsg46\n(lp2985\n(lp2986\nF14.142135623730951\naF14.142135623730951\naa(lp2987\nF14.142135623730951\naF-14.142135623730949\naa(lp2988\nF-14.142135623730949\naF-14.142135623730955\naa(lp2989\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1318\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng1319\nsg63\ng1320\nsg65\nVleg_offset_5\np2990\nsg67\nI00\nsg68\ng1322\nsg70\n(lp2991\nF49.812119768155227\naF183.82969316271172\nasa(dp2992\ng29\ng736\nsg31\n(I138\nI146\nI146\nI180\ntp2993\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\ng738\nsg42\nNsg111\n(lp2994\nVr_foot_fk_heel\np2995\nasg45\nI40\nsg46\n(lp2996\n(lp2997\nF-10.16341983535915\n"
		+ "aF16.111124669034496\naa(lp2998\nF13.625058966836541\naF3.4388465199905056\naa(lp2999\nF31.164309885114321\naF12.315777991594331\naa(lp3000\nF35.845901191177347\naF21.735086298317313\naa(lp3001\nF25.54858724625133\naF28.804882013792238\naa(lp3002\nF1.7586903236019751\naF29.741242624518677\naa(lp3003\nF-15.086748661239795\naF29.65096422505647\naa(lp3004\nF-15.025339128818786\naF21.419749458681238\naasg52\ng750\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng751\nsg63\ng752\nsg65\nVfoot_fk_MIRROR\np3005\nsg67\nI01\nsg68\ng754\nsg70\n(lp3006\nF-43.062039182336832\naF205.29560220291748\nasa(dp3007\ng29\ng497\nsg31\n(I122\nI118\nI96\nI180\ntp3008\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\ng499\nsg42\nNsg111\n(lp3009\nVl_arm_twist\np3010\nasg45\nI40\nsg46\n(lp3011\n(lp3012\nF14.142135623730951\naF14.142135623730951\naa(lp3013\nF14.142135623730951\naF-14.142135623730949\naa(lp3014\nF-14.142135623730949\naF-14.142135623730955\naa(lp3015\nF-14.142135623730955\naF14.142135623730947\naasg52\ng507\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng508\nsg63\ng509\nsg65\nVarm_offset_5\np3016\nsg67\n"
		+ "I00\nsg68\ng511\nsg70\n(lp3017\nF120.20351616300738\naF-12.680423036414282\nasa(dp3018\ng29\ng497\nsg31\n(I122\nI118\nI96\nI180\ntp3019\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\ng499\nsg42\nNsg111\n(lp3020\nVl_forearm_twist\np3021\nasg45\nI40\nsg46\n(lp3022\n(lp3023\nF14.142135623730951\naF14.142135623730951\naa(lp3024\nF14.142135623730951\naF-14.142135623730949\naa(lp3025\nF-14.142135623730949\naF-14.142135623730955\naa(lp3026\nF-14.142135623730955\naF14.142135623730947\naasg52\ng507\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng508\nsg63\ng509\nsg65\nVarm_offset_6\np3027\nsg67\nI00\nsg68\ng511\nsg70\n(lp3028\nF86.55005951676128\naF-53.812425604048393\nasa(dp3029\ng29\ng497\nsg31\n(I122\nI118\nI96\nI180\ntp3030\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\ng499\nsg42\nNsg111\n(lp3031\nVr_forearm_twist\np3032\nasg45\nI40\nsg46\n(lp3033\n(lp3034\nF-14.142135623730951\naF14.142135623730951\naa(lp3035\nF-14.142135623730951\naF-14.142135623730949\naa(lp3036\nF14.142135623730949\naF-14.142135623730955\naa(lp3037\nF14.142135623730955\naF14.142135623730947\naasg52\ng507\nsg54\nI255\nsg55\nI01\nsg56\n"
		+ "F1\nsg59\nNsg60\nI0\nsg61\ng508\nsg63\ng509\nsg65\nVarm_offset_6_MIRROR\np3038\nsg67\nI01\nsg68\ng511\nsg70\n(lp3039\nF-86.55005951676128\naF-53.812425604048393\nasa(dp3040\ng29\ng497\nsg31\n(I122\nI118\nI96\nI180\ntp3041\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\ng499\nsg42\nNsg111\n(lp3042\nVr_arm_twist\np3043\nasg45\nI40\nsg46\n(lp3044\n(lp3045\nF-14.142135623730951\naF14.142135623730951\naa(lp3046\nF-14.142135623730951\naF-14.142135623730949\naa(lp3047\nF14.142135623730949\naF-14.142135623730955\naa(lp3048\nF14.142135623730955\naF14.142135623730947\naasg52\ng507\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng508\nsg63\ng509\nsg65\nVarm_offset_5_MIRROR\np3049\nsg67\nI01\nsg68\ng511\nsg70\n(lp3050\nF-120.20351616300738\naF-12.680423036414282\nasa(dp3051\ng29\ng1307\nsg31\n(I146\nI141\nI115\nI180\ntp3052\nsg34\nI0\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\ng1309\nsg42\ng1310\nsg111\n(lp3053\nVr_upleg_twist\np3054\nasg45\nI0\nsg46\n(lp3055\n(lp3056\nF-14.142135623730951\naF14.142135623730951\naa(lp3057\nF-14.142135623730951\naF-14.142135623730949\naa(lp3058\nF14.142135623730949\naF-14.142135623730955\naa(lp3059\n"
		+ "F14.142135623730955\naF14.142135623730947\naasg52\ng1318\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng1319\nsg63\ng1320\nsg65\nVleg_offset_4_MIRROR\np3060\nsg67\nI01\nsg68\ng1322\nsg70\n(lp3061\nF-51.681756248502225\naF103.43532450779051\nasa(dp3062\ng29\ng1307\nsg31\n(I146\nI141\nI115\nI180\ntp3063\nsg34\nI0\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\ng1309\nsg42\ng1310\nsg111\n(lp3064\nVr_leg_twist\np3065\nasg45\nI0\nsg46\n(lp3066\n(lp3067\nF-14.142135623730951\naF14.142135623730951\naa(lp3068\nF-14.142135623730951\naF-14.142135623730949\naa(lp3069\nF14.142135623730949\naF-14.142135623730955\naa(lp3070\nF14.142135623730955\naF14.142135623730947\naasg52\ng1318\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng1319\nsg63\ng1320\nsg65\nVleg_offset_5_MIRROR\np3071\nsg67\nI01\nsg68\ng1322\nsg70\n(lp3072\nF-49.812119768155227\naF183.82969316271172\nasa(dp3073\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3074\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3075\nVl_hand_indexFinger_1\np3076\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3077\n(lp3078\nF14.142135623730951\naF14.142135623730951\n"
		+ "aa(lp3079\nF14.142135623730951\naF-14.142135623730949\naa(lp3080\nF-14.142135623730949\naF-14.142135623730955\naa(lp3081\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3082\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_46\np3083\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3084\nF109.29454251204747\naF88.199282932246788\nasa(dp3085\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3086\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3087\nVl_hand_indexFinger_3\np3088\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3089\n(lp3090\nF14.142135623730951\naF14.142135623730951\naa(lp3091\nF14.142135623730951\naF-14.142135623730949\naa(lp3092\nF-14.142135623730949\naF-14.142135623730955\naa(lp3093\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3094\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_47\np3095\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3096\nF109.29454251204747\naF120.1992829322468\nasa(dp3097\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3098\nsg33\n"
		+ "S' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3099\nVl_hand_middleFinger_2\np3100\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3101\n(lp3102\nF14.142135623730951\naF14.142135623730951\naa(lp3103\nF14.142135623730951\naF-14.142135623730949\naa(lp3104\nF-14.142135623730949\naF-14.142135623730955\naa(lp3105\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3106\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_50\np3107\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3108\nF123.29454251204747\naF104.19928293224679\nasa(dp3109\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3110\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3111\nVl_hand_middleFinger_1\np3112\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3113\n(lp3114\nF14.142135623730951\naF14.142135623730951\naa(lp3115\nF14.142135623730951\naF-14.142135623730949\naa(lp3116\nF-14.142135623730949\naF-14.142135623730955\naa(lp3117\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\n"
		+ "I255\ntp3118\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_51\np3119\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3120\nF123.29454251204747\naF88.199282932246788\nasa(dp3121\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3122\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3123\nVl_hand_middleFinger_3\np3124\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3125\n(lp3126\nF14.142135623730951\naF14.142135623730951\naa(lp3127\nF14.142135623730951\naF-14.142135623730949\naa(lp3128\nF-14.142135623730949\naF-14.142135623730955\naa(lp3129\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3130\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_52\np3131\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3132\nF123.29454251204747\naF120.1992829322468\nasa(dp3133\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3134\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3135\nVl_hand_ringFinger_2\np3136\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3137\n(lp3138\nF14.142135623730951\naF14.142135623730951\naa(lp3139\nF14.142135623730951\n"
		+ "aF-14.142135623730949\naa(lp3140\nF-14.142135623730949\naF-14.142135623730955\naa(lp3141\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3142\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_54\np3143\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3144\nF137.29454251204749\naF104.19928293224679\nasa(dp3145\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3146\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3147\nVl_hand_ringFinger_1\np3148\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3149\n(lp3150\nF14.142135623730951\naF14.142135623730951\naa(lp3151\nF14.142135623730951\naF-14.142135623730949\naa(lp3152\nF-14.142135623730949\naF-14.142135623730955\naa(lp3153\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3154\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_55\np3155\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3156\nF137.29454251204749\naF88.199282932246788\nasa(dp3157\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3158\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\n"
		+ "I255\nsg37\nI29\nsg111\n(lp3159\nVl_hand_ringFinger_3\np3160\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3161\n(lp3162\nF14.142135623730951\naF14.142135623730951\naa(lp3163\nF14.142135623730951\naF-14.142135623730949\naa(lp3164\nF-14.142135623730949\naF-14.142135623730955\naa(lp3165\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3166\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_56\np3167\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3168\nF137.29454251204749\naF120.1992829322468\nasa(dp3169\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3170\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3171\nVl_hand_pinkyFinger_2\np3172\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3173\n(lp3174\nF14.142135623730951\naF14.142135623730951\naa(lp3175\nF14.142135623730951\naF-14.142135623730949\naa(lp3176\nF-14.142135623730949\naF-14.142135623730955\naa(lp3177\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3178\nsg59\nNsg60\nI0\nsg61\n"
		+ "g1118\nsg63\ng1119\nsg65\nVitem_58\np3179\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3180\nF151.29454251204749\naF104.19928293224679\nasa(dp3181\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3182\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3183\nVl_hand_pinkyFinger_1\np3184\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3185\n(lp3186\nF14.142135623730951\naF14.142135623730951\naa(lp3187\nF14.142135623730951\naF-14.142135623730949\naa(lp3188\nF-14.142135623730949\naF-14.142135623730955\naa(lp3189\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3190\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_59\np3191\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3192\nF151.29454251204749\naF88.199282932246788\nasa(dp3193\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3194\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3195\nVl_hand_pinkyFinger_3\np3196\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3197\n(lp3198\nF14.142135623730951\naF14.142135623730951\naa(lp3199\nF14.142135623730951\naF-14.142135623730949\n"
		+ "aa(lp3200\nF-14.142135623730949\naF-14.142135623730955\naa(lp3201\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3202\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_60\np3203\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3204\nF151.29454251204749\naF120.1992829322468\nasa(dp3205\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3206\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3207\nVl_hand_thumbFinger_2\np3208\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3209\n(lp3210\nF14.142135623730951\naF14.142135623730951\naa(lp3211\nF14.142135623730951\naF-14.142135623730949\naa(lp3212\nF-14.142135623730949\naF-14.142135623730955\naa(lp3213\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3214\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_62\np3215\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3216\nF95.294542512047471\naF104.19928293224679\nasa(dp3217\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3218\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3219\n"
		+ "Vl_hand_thumbFinger_1\np3220\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3221\n(lp3222\nF14.142135623730951\naF14.142135623730951\naa(lp3223\nF14.142135623730951\naF-14.142135623730949\naa(lp3224\nF-14.142135623730949\naF-14.142135623730955\naa(lp3225\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3226\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_63\np3227\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3228\nF95.294542512047471\naF88.199282932246788\nasa(dp3229\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3230\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3231\nVl_hand_thumbFinger_3\np3232\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI11\nsg46\n(lp3233\n(lp3234\nF14.142135623730951\naF14.142135623730951\naa(lp3235\nF14.142135623730951\naF-14.142135623730949\naa(lp3236\nF-14.142135623730949\naF-14.142135623730955\naa(lp3237\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3238\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_64\n"
		+ "p3239\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3240\nF95.294542512047471\naF120.1992829322468\nasa(dp3241\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3242\nsg33\nS' '\nsg34\nI10\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3243\nVl_hand_clench\np3244\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI00\nsg45\nI30\nsg46\n(lp3245\n(lp3246\nF14.142135623730951\naF14.142135623730951\naa(lp3247\nF14.142135623730951\naF-14.142135623730949\naa(lp3248\nF-14.142135623730949\naF-14.142135623730955\naa(lp3249\nF-14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3250\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_65\np3251\nsg67\nI00\nsg68\ng1121\nsg70\n(lp3252\nF137.28976391833953\naF71.402627947842404\nasa(dp3253\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3254\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3255\nVr_hand_indexFinger_2\np3256\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3257\n(lp3258\nF-14.142135623730951\naF14.142135623730951\naa(lp3259\nF-14.142135623730951\naF-14.142135623730949\naa(lp3260\nF14.142135623730949\n"
		+ "aF-14.142135623730955\naa(lp3261\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3262\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_45_MIRROR\np3263\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3264\nF-109.29454251204747\naF104.19928293224679\nasa(dp3265\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3266\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3267\nVr_hand_indexFinger_1\np3268\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3269\n(lp3270\nF-14.142135623730951\naF14.142135623730951\naa(lp3271\nF-14.142135623730951\naF-14.142135623730949\naa(lp3272\nF14.142135623730949\naF-14.142135623730955\naa(lp3273\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3274\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_46_MIRROR\np3275\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3276\nF-109.29454251204747\naF88.199282932246788\nasa(dp3277\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3278\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3279\nVr_hand_indexFinger_3\n"
		+ "p3280\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3281\n(lp3282\nF-14.142135623730951\naF14.142135623730951\naa(lp3283\nF-14.142135623730951\naF-14.142135623730949\naa(lp3284\nF14.142135623730949\naF-14.142135623730955\naa(lp3285\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3286\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_47_MIRROR\np3287\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3288\nF-109.29454251204747\naF120.1992829322468\nasa(dp3289\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3290\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3291\nVr_hand_middleFinger_2\np3292\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3293\n(lp3294\nF-14.142135623730951\naF14.142135623730951\naa(lp3295\nF-14.142135623730951\naF-14.142135623730949\naa(lp3296\nF14.142135623730949\naF-14.142135623730955\naa(lp3297\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3298\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_50_MIRROR\np3299\n"
		+ "sg67\nI01\nsg68\ng1121\nsg70\n(lp3300\nF-123.29454251204747\naF104.19928293224679\nasa(dp3301\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3302\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3303\nVr_hand_middleFinger_1\np3304\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3305\n(lp3306\nF-14.142135623730951\naF14.142135623730951\naa(lp3307\nF-14.142135623730951\naF-14.142135623730949\naa(lp3308\nF14.142135623730949\naF-14.142135623730955\naa(lp3309\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3310\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_51_MIRROR\np3311\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3312\nF-123.29454251204747\naF88.199282932246788\nasa(dp3313\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3314\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3315\nVr_hand_middleFinger_3\np3316\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3317\n(lp3318\nF-14.142135623730951\naF14.142135623730951\naa(lp3319\nF-14.142135623730951\naF-14.142135623730949\naa(lp3320\nF14.142135623730949\n"
		+ "aF-14.142135623730955\naa(lp3321\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3322\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_52_MIRROR\np3323\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3324\nF-123.29454251204747\naF120.1992829322468\nasa(dp3325\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3326\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3327\nVr_hand_ringFinger_2\np3328\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3329\n(lp3330\nF-14.142135623730951\naF14.142135623730951\naa(lp3331\nF-14.142135623730951\naF-14.142135623730949\naa(lp3332\nF14.142135623730949\naF-14.142135623730955\naa(lp3333\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3334\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_54_MIRROR\np3335\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3336\nF-137.29454251204749\naF104.19928293224679\nasa(dp3337\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3338\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3339\nVr_hand_ringFinger_1\n"
		+ "p3340\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3341\n(lp3342\nF-14.142135623730951\naF14.142135623730951\naa(lp3343\nF-14.142135623730951\naF-14.142135623730949\naa(lp3344\nF14.142135623730949\naF-14.142135623730955\naa(lp3345\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3346\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_55_MIRROR\np3347\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3348\nF-137.29454251204749\naF88.199282932246788\nasa(dp3349\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3350\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3351\nVr_hand_ringFinger_3\np3352\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3353\n(lp3354\nF-14.142135623730951\naF14.142135623730951\naa(lp3355\nF-14.142135623730951\naF-14.142135623730949\naa(lp3356\nF14.142135623730949\naF-14.142135623730955\naa(lp3357\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3358\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_56_MIRROR\np3359\n"
		+ "sg67\nI01\nsg68\ng1121\nsg70\n(lp3360\nF-137.29454251204749\naF120.1992829322468\nasa(dp3361\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3362\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3363\nVr_hand_pinkyFinger_2\np3364\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3365\n(lp3366\nF-14.142135623730951\naF14.142135623730951\naa(lp3367\nF-14.142135623730951\naF-14.142135623730949\naa(lp3368\nF14.142135623730949\naF-14.142135623730955\naa(lp3369\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3370\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_58_MIRROR\np3371\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3372\nF-151.29454251204749\naF104.19928293224679\nasa(dp3373\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3374\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3375\nVr_hand_pinkyFinger_1\np3376\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3377\n(lp3378\nF-14.142135623730951\naF14.142135623730951\naa(lp3379\nF-14.142135623730951\naF-14.142135623730949\naa(lp3380\nF14.142135623730949\n"
		+ "aF-14.142135623730955\naa(lp3381\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3382\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_59_MIRROR\np3383\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3384\nF-151.29454251204749\naF88.199282932246788\nasa(dp3385\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3386\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3387\nVr_hand_pinkyFinger_3\np3388\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3389\n(lp3390\nF-14.142135623730951\naF14.142135623730951\naa(lp3391\nF-14.142135623730951\naF-14.142135623730949\naa(lp3392\nF14.142135623730949\naF-14.142135623730955\naa(lp3393\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3394\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_60_MIRROR\np3395\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3396\nF-151.29454251204749\naF120.1992829322468\nasa(dp3397\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3398\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3399\nVr_hand_thumbFinger_2\n"
		+ "p3400\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3401\n(lp3402\nF-14.142135623730951\naF14.142135623730951\naa(lp3403\nF-14.142135623730951\naF-14.142135623730949\naa(lp3404\nF14.142135623730949\naF-14.142135623730955\naa(lp3405\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3406\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_62_MIRROR\np3407\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3408\nF-95.294542512047471\naF104.19928293224679\nasa(dp3409\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3410\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3411\nVr_hand_thumbFinger_1\np3412\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3413\n(lp3414\nF-14.142135623730951\naF14.142135623730951\naa(lp3415\nF-14.142135623730951\naF-14.142135623730949\naa(lp3416\nF14.142135623730949\naF-14.142135623730955\naa(lp3417\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3418\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_63_MIRROR\np3419\n"
		+ "sg67\nI01\nsg68\ng1121\nsg70\n(lp3420\nF-95.294542512047471\naF88.199282932246788\nasa(dp3421\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3422\nsg33\nS' '\nsg34\nI14\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3423\nVr_hand_thumbFinger_3\np3424\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI11\nsg46\n(lp3425\n(lp3426\nF-14.142135623730951\naF14.142135623730951\naa(lp3427\nF-14.142135623730951\naF-14.142135623730949\naa(lp3428\nF14.142135623730949\naF-14.142135623730955\naa(lp3429\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3430\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_64_MIRROR\np3431\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3432\nF-95.294542512047471\naF120.1992829322468\nasa(dp3433\ng29\ng1106\nsg31\n(I119\nI126\nI126\nI180\ntp3434\nsg33\nS' '\nsg34\nI10\nsg35\nI01\nsg36\nI255\nsg37\nI29\nsg111\n(lp3435\nVr_hand_clench\np3436\nasg38\nF-1\nsg39\nNsg40\ng1110\nsg42\nNsg44\nI01\nsg45\nI30\nsg46\n(lp3437\n(lp3438\nF-14.142135623730951\naF14.142135623730951\naa(lp3439\nF-14.142135623730951\naF-14.142135623730949\naa(lp3440\nF14.142135623730949\n"
		+ "aF-14.142135623730955\naa(lp3441\nF14.142135623730955\naF14.142135623730947\naasg52\ng1116\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3442\nsg59\nNsg60\nI0\nsg61\ng1118\nsg63\ng1119\nsg65\nVitem_65_MIRROR\np3443\nsg67\nI01\nsg68\ng1121\nsg70\n(lp3444\nF-137.28976391833953\naF71.402627947842404\nasasVtab_visibility\np3445\nI01\nsVbackground\np3446\nS'C:\\\\Users\\\\Pavel\\\\Documents\\\\maya\\\\2020\\\\scripts\\\\rigStudio_picker\\\\picker/images/Banana/common_back_small.png'\np3447\nsVbackground_flip\np3448\nI00\nsVbackground_offset_x\np3449\nI0\nsVbackground_offset_y\np3450\nI0\nsVbackground_opacity\np3451\nF0.45000000000000001\nsa(dp3452\ng5\nI1\nsg7\nVface\np3453\nsg26\n(lp3454\n(dp3455\ng29\nVfk\np3456\nsg31\n(I146\nI141\nI115\nI180\ntp3457\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp3458\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000acmds.select(ns+\"face_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\np3459\nsg111\n(lp3460\nVeyes_look_fk\np3461\naVlook\np3462\nasg45\nI0\nsg46\n(lp3463\n(lp3464\nF14.142135623730951\naF14.142135623730951\n"
		+ "aa(lp3465\nF14.142135623730951\naF-14.142135623730949\naa(lp3466\nF-14.142135623730949\naF-14.142135623730955\naa(lp3467\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3468\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3469\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3470\nsg65\nVface_look_fk\np3471\nsg67\nI00\nsg68\nVrect\np3472\nsg70\n(lp3473\nF-0.56364770378501472\naF-32.266625086121593\nasa(dp3474\ng29\nVdefault\np3475\nsg31\n(I85\nI0\nI127\nI180\ntp3476\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp3477\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000aif cmds.objExists(ns+'character.addFaceControls'):\\u000a    v = cmds.getAttr(ns+'character.addFaceControls')\\u000a    cmds.setAttr(ns+'character.addFaceControls', not v)\\u000a\\u000a    if not v: self.polygon.opacity = 255\\u000a    else: self.polygon.opacity = 100\\u000a\\u000a    self.view.scene().update()\\u000a    self.view.update()\np3478\nsg44\nI00\nsg45\nI40\nsg46\n(lp3479\n(lp3480\nF0\naF0\naa(lp3481\nF0\naF35\naa(lp3482\nF35\naF35\naa(lp3483\nF35\n"
		+ "aF0\naasg52\nVlinear\np3484\nsg54\nI100\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/plus.png\np3485\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3486\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3487\nsg65\nVface_plus_icon\np3488\nsg67\nI00\nsg68\nVpolygon\np3489\nsg70\n(lp3490\nF129\naF-245\nasa(dp3491\ng29\nVdefault\np3492\nsg31\n(I150\nI150\nI150\nI180\ntp3493\nsg33\nS'R'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3494\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000amel.eval('resetToDefaultValues;')\\u000a'''\\u000atry:\\u000a    import rigStudio_picker.animTools.rs_keepPos\\u000a    rigStudio_picker.animTools.rs_keepPos.loadPos()\\u000aexcept:\\u000a    import rigStudio2.animTools.rs_keepPos\\u000a    rigStudio2.animTools.rs_keepPos.loadPos()\\u000a\\u000asel = cmds.ls(sl=1)\\u000aif sel:\\u000a    name = sel[0].split(':')[-1]\\u000a    ns = sel[0].split(name)[0]\\u000a\\u000a    for item in self.view.items:\\u000a        for c in item.controls:\\u000a            if ns+c in sel:\\u000a                item.reset_slider()\\u000a'''\\u000aself.view.scene().update()\\u000a\n"
		+ "p3495\nsg44\nI00\nsg45\nI24\nsg46\n(lp3496\n(lp3497\nF14.142135623730951\naF14.142135623730951\naa(lp3498\nF14.142135623730951\naF-14.142135623730949\naa(lp3499\nF-14.142135623730949\naF-14.142135623730955\naa(lp3500\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3501\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3502\nsg59\nNsg60\nI0\nsg61\n(dp3503\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3504\nsg65\nVface_reset\np3505\nsg67\nI00\nsg68\nVrect\np3506\nsg70\n(lp3507\nF150\naF-194\nasa(dp3508\ng29\nVdefault\np3509\nsg31\n(I150\nI150\nI150\nI180\ntp3510\nsg33\nS'M'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3511\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000amel.eval('human_mirrorPose -mirror \"%s\"' %ns)\np3512\nsg44\nI00\nsg45\nI24\nsg46\n(lp3513\n(lp3514\nF14.142135623730951\naF14.142135623730951\naa(lp3515\nF14.142135623730951\naF-14.142135623730949\naa(lp3516\nF-14.142135623730949\naF-14.142135623730955\naa(lp3517\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3518\nsg54\nI255\nsg55\nI00\nsg56\n"
		+ "F1\nsg57\n(I30\nI30\nI30\nI255\ntp3519\nsg59\nNsg60\nI0\nsg61\n(dp3520\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3521\nsg65\nVface_mirror\np3522\nsg67\nI00\nsg68\nVrect\np3523\nsg70\n(lp3524\nF96\naF-194\nasa(dp3525\ng29\nVdefault\np3526\nsg31\n(I150\nI150\nI150\nI180\ntp3527\nsg33\nS'S'\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3528\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000amel.eval('human_mirrorPose -symmetrical \"%s\"' %ns)\np3529\nsg44\nI00\nsg45\nI24\nsg46\n(lp3530\n(lp3531\nF14.142135623730951\naF14.142135623730951\naa(lp3532\nF14.142135623730951\naF-14.142135623730949\naa(lp3533\nF-14.142135623730949\naF-14.142135623730955\naa(lp3534\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3535\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3536\nsg59\nNsg60\nI0\nsg61\n(dp3537\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3538\nsg65\nVface_sym\np3539\nsg67\nI00\nsg68\nVrect\np3540\nsg70\n(lp3541\nF123\naF-194\nasa(dp3542\ng29\nVdefault\np3543\nsg31\n(I255\nI85\nI127\nI180\ntp3544\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg39\nNsg40\n(lp3545\nsg42\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000a# namespace\\u000ans = self.namespace\\u000a\\u000aif cmds.getAttr(ns+\"character.type\") == \"humanAnimaccord\":\\u000a    v = cmds.getAttr(ns+'character.faceControls')\\u000a    cmds.setAttr(ns+'character.faceControls', not v)\\u000aelse:\\u000a    v = cmds.getAttr(ns+'character.FaceControls')\\u000a    cmds.setAttr(ns+'character.FaceControls', not v)\\u000a\\u000aif not v: self.polygon.opacity = 255\\u000aelse: self.polygon.opacity = 100\\u000a\\u000aself.view.scene().update()\\u000aself.view.update()\\u000a\np3546\nsg44\nI00\nsg45\nI40\nsg46\n(lp3547\n(lp3548\nF0\naF0\naa(lp3549\nF0\naF34\naa(lp3550\nF28\naF34\naa(lp3551\nF28\naF0\naasg52\nVlinear\np3552\nsg54\nI255\nsg55\nI00\nsg334\nVP:\\u005cAnimaccord\\u005cMayaGlobals\\u005canimation\\u005c2022\\u005cscripts\\u005cpashaScripts\\u005crigStudio_picker\\u005cpicker/images/face_icon.png\np3553\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3554\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3555\nsg65\nVface_face_icon\np3556\nsg67\nI00\nsg68\nVpolygon\np3557\nsg70\n(lp3558\nF96\naF-244\nasa(dp3559\n"
		+ "g29\nVdefault\np3560\nsg31\n(I150\nI150\nI150\nI180\ntp3561\nsg33\nS'All'\np3562\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3563\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000amods = cmds.getModifiers()\\u000a\\u000aif mods == 4:\\u000a    cmds.select(ns+\"face_controlSet\", tgl=1)\\u000aelse:\\u000a    cmds.select(ns+\"face_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\np3564\nsg44\nI00\nsg45\nI46\nsg46\n(lp3565\n(lp3566\nF14.142135623730951\naF14.142135623730951\naa(lp3567\nF14.142135623730951\naF-14.142135623730949\naa(lp3568\nF-14.142135623730949\naF-14.142135623730955\naa(lp3569\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3570\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3571\nsg59\nNsg60\nI0\nsg61\n(dp3572\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3573\nsg65\nVface_set_all\np3574\nsg67\nI00\nsg68\nVrect\np3575\nsg70\n(lp3576\nF-93\naF-236.55566249200564\nasa(dp3577\ng29\nVdefault\np3578\nsg31\n(I150\nI150\nI150\nI180\ntp3579\nsg33\nS'Brows'\np3580\nsg34\nI20\nsg35\nI01\nsg36\n"
		+ "I255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3581\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000amods = cmds.getModifiers()\\u000a\\u000aif mods == 4:\\u000a    cmds.select(ns+\"brows_controlSet\", tgl=1)\\u000aelse:\\u000a    cmds.select(ns+\"brows_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\np3582\nsg44\nI00\nsg45\nI46\nsg46\n(lp3583\n(lp3584\nF14.142135623730951\naF14.142135623730951\naa(lp3585\nF14.142135623730951\naF-14.142135623730949\naa(lp3586\nF-14.142135623730949\naF-14.142135623730955\naa(lp3587\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3588\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3589\nsg59\nNsg60\nI0\nsg61\n(dp3590\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3591\nsg65\nVface_set_brows\np3592\nsg67\nI00\nsg68\nVrect\np3593\nsg70\n(lp3594\nF-143\naF-236.07197719976904\nasa(dp3595\ng29\nVdefault\np3596\nsg31\n(I150\nI150\nI150\nI180\ntp3597\nsg33\nS'Eyelids'\np3598\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3599\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000amods = cmds.getModifiers()\\u000a\\u000aif mods == 4:\\u000a    if cmds.objExists(ns+\"eyelids_controlSet\"):\\u000a        cmds.select(ns+\"eyelids_controlSet\", tgl=1)\\u000aelse:\\u000a    if cmds.objExists(ns+\"eyelids_controlSet\"):\\u000a        cmds.select(ns+\"eyelids_controlSet\")\\u000a\\u000a\\u000a\\u000aself.view.scene().update()\\u000a\n"
		+ "p3600\nsg44\nI00\nsg45\nI46\nsg46\n(lp3601\n(lp3602\nF14.142135623730951\naF14.142135623730951\naa(lp3603\nF14.142135623730951\naF-14.142135623730949\naa(lp3604\nF-14.142135623730949\naF-14.142135623730955\naa(lp3605\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3606\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3607\nsg59\nNsg60\nI0\nsg61\n(dp3608\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3609\nsg65\nVface_set_eyelids\np3610\nsg67\nI00\nsg68\nVrect\np3611\nsg70\n(lp3612\nF-143\naF-189.58829190753241\nasa(dp3613\ng29\nVdefault\np3614\nsg31\n(I150\nI150\nI150\nI180\ntp3615\nsg33\nS'Mouth'\np3616\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp3617\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000amods = cmds.getModifiers()\\u000a\\u000aif mods == 4:\\u000a    if cmds.objExists(ns+\"mouth_controlSet\"):\\u000a        cmds.select(ns+\"mouth_controlSet\", tgl=1)\\u000aelse:\\u000a    if cmds.objExists(ns+\"mouth_controlSet\"):\\u000a        cmds.select(ns+\"mouth_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\n"
		+ "p3618\nsg44\nI00\nsg45\nI46\nsg46\n(lp3619\n(lp3620\nF14.142135623730951\naF14.142135623730951\naa(lp3621\nF14.142135623730951\naF-14.142135623730949\naa(lp3622\nF-14.142135623730949\naF-14.142135623730955\naa(lp3623\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3624\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp3625\nsg59\nNsg60\nI0\nsg61\n(dp3626\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3627\nsg65\nVface_set_mouth\np3628\nsg67\nI00\nsg68\nVrect\np3629\nsg70\n(lp3630\nF-143\naF-166.07878035195998\nasa(dp3631\ng29\nVfk\np3632\nsg31\n(I47\nI50\nI50\nI180\ntp3633\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3634\nsg42\nNsg111\n(lp3635\nVl_look\np3636\naVeyes_l_look_fk\np3637\nasg45\nI40\nsg46\n(lp3638\n(lp3639\nF14.142135623730951\naF14.142135623730951\naa(lp3640\nF14.142135623730951\naF-14.142135623730949\naa(lp3641\nF-14.142135623730949\naF-14.142135623730955\naa(lp3642\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3643\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3644\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3645\nsg65\nVface_eye\np3646\nsg67\nI00\nsg68\nVcircle\n"
		+ "p3647\nsg70\n(lp3648\nF59\naF-31\nasa(dp3649\ng29\nVdefault\np3650\nsg31\n(I146\nI141\nI115\nI180\ntp3651\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3652\nsg42\nNsg111\n(lp3653\nVl_brow\np3654\nasg45\nI40\nsg46\n(lp3655\n(lp3656\nF43.010328343252283\naF9.8299630243943525\naa(lp3657\nF44.593088195633229\naF6.9868398704994519\naa(lp3658\nF45.442003426418623\naF0.91118815257767949\naa(lp3659\nF4.8105485125979737\naF-12.937941171611635\naa(lp3660\nF-34.898696918346765\naF0.062270420612421162\naa(lp3661\nF-34.898699419526615\naF4.8838402635086169\naa(lp3662\nF-33.373478623510401\naF8.5853559546288025\naa(lp3663\nF5.2795296013089059\naF0.07803769310285702\naasg52\nVquadratic\np3664\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3665\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3666\nsg65\nVface_brow\np3667\nsg67\nI00\nsg68\nVpolygon\np3668\nsg70\n(lp3669\nF59.208621324399445\naF-102.25125175406879\nasa(dp3670\ng29\nVdefault\np3671\nsg31\n(I119\nI126\nI126\nI180\ntp3672\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3673\nsg42\nNsg111\n(lp3674\nVl_t_lid\np3675\nasg45\nI40\nsg46\n(lp3676\n(lp3677\nF33.671305524369842\n"
		+ "aF18.648359369713219\naa(lp3678\nF35.134623944276157\naF20.404719478535927\naa(lp3679\nF39.211662200491432\naF18.107161583783171\naa(lp3680\nF37.296378158196667\naF15.110830581735424\naa(lp3681\nF17.026455205259943\naF-13.243471453447761\naa(lp3682\nF-15.405220007114622\naF-5.0236277549384276\naa(lp3683\nF-27.455299261542024\naF10.404713380460278\naa(lp3684\nF-30.810445674482892\naF14.32383725074121\naa(lp3685\nF-25.428343965525404\naF18.648353709459556\naa(lp3686\nF-22.837407068575452\naF15.698939590541578\naa(lp3687\nF-5.6754872470526525\naF-0.67497735244930723\naa(lp3688\nF20.134789989700984\naF1.9156246235245362\naasg52\nVcubic\np3689\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3690\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3691\nsg65\nVface_t_lid\np3692\nsg67\nI00\nsg68\nVpolygon\np3693\nsg70\n(lp3694\nF56.249608539028557\naF-70.631053798596227\nasa(dp3695\ng29\nVdefault\np3696\nsg31\n(I119\nI126\nI126\nI180\ntp3697\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3698\nsg42\nNsg111\n(lp3699\nVl_brow_center\np3700\nasg45\nI40\nsg46\n(lp3701\n(lp3702\nF12.253396116037294\naF10.526376258922804\n"
		+ "aa(lp3703\nF14.539936153135951\naF6.4733285049145763\naa(lp3704\nF15.160445241130731\naF0.5517867291568308\naa(lp3705\nF1.8910903150543259\naF-2.1511118861875715\naa(lp3706\nF-13.564039218434161\naF-0.55667207677878139\naa(lp3707\nF-13.166009377413573\naF5.1257309754110789\naa(lp3708\nF-11.48394445639947\naF9.8594756223456841\naa(lp3709\nF0.71129619640478481\naF8.6625178766797326\naasg52\nVquadratic\np3710\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3711\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3712\nsg65\nVface_brow_2\np3713\nsg67\nI00\nsg68\nVpolygon\np3714\nsg70\n(lp3715\nF66.019516680708449\naF-124.44792468179207\nasa(dp3716\ng29\nVdefault\np3717\nsg31\n(I119\nI126\nI126\nI180\ntp3718\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3719\nsg42\nNsg111\n(lp3720\nVl_brow_in\np3721\nasg45\nI40\nsg46\n(lp3722\n(lp3723\nF13.994429202358475\naF7.2619392220705823\naa(lp3724\nF14.037957530696378\naF3.5264400450631825\naa(lp3725\nF12.404011238235455\naF-2.8492821803770383\naa(lp3726\nF-1.7377114452732965\naF-0.83228597769021206\naa(lp3727\nF-5.8882726634989631\naF3.1839566491573059\naa(lp3728\n"
		+ "F-6.9537655943626042\naF6.8032224108343495\naa(lp3729\nF-6.5055486101406856\naF11.444836237091465\naa(lp3730\nF0.92892533219493245\naF9.0977761482600279\naasg52\nVquadratic\np3731\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3732\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3733\nsg65\nVface_brow_1\np3734\nsg67\nI00\nsg68\nVpolygon\np3735\nsg70\n(lp3736\nF36.266398626232316\naF-121.34570918227649\nasa(dp3737\ng29\nVdefault\np3738\nsg31\n(I119\nI126\nI126\nI180\ntp3739\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3740\nsg42\nNsg111\n(lp3741\nVl_brow_out\np3742\nasg45\nI40\nsg46\n(lp3743\n(lp3744\nF9.0175949781768026\naF11.01890632848656\naa(lp3745\nF10.327094406484431\naF5.9501604261852208\naa(lp3746\nF9.4574164474691855\naF2.5359365648169714\naa(lp3747\nF2.9408649983202562\naF-1.0231624924656728\naa(lp3748\nF-5.7018969097191388\naF-3.0359271798110754\naa(lp3749\nF-8.3973520395992125\naF1.1946598210535679\naa(lp3750\nF-8.8036686693375259\naF7.1791998352837396\naa(lp3751\nF0.93465251199328137\naF8.6625178766797326\naasg52\nVquadratic\np3752\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\n"
		+ "sg61\n(dp3753\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3754\nsg65\nVface_brow_3\np3755\nsg67\nI00\nsg68\nVpolygon\np3756\nsg70\n(lp3757\nF91.621866167652513\naF-118.92037939555982\nasa(dp3758\ng29\nVdefault\np3759\nsg31\n(I119\nI126\nI126\nI180\ntp3760\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3761\nsg42\nNsg111\n(lp3762\nVnose\np3763\nasg45\nI40\nsg46\n(lp3764\n(lp3765\nF13.094322396375425\naF1.8248953674783799\naa(lp3766\nF11.748217440828\naF-15.817877658526037\naa(lp3767\nF1.0478155381442207\naF-21.473045815911007\naa(lp3768\nF-9.2640496064688183\naF-15.949026280259011\naa(lp3769\nF-10.79064924335135\naF1.6937467457453899\naa(lp3770\nF1.1067129061782461\naF9.0246592487145136\naasg52\nVquadratic\np3771\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3772\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3773\nsg65\nVface_nose\np3774\nsg67\nI00\nsg68\nVpolygon\np3775\nsg70\n(lp3776\nF-1.2393920493691635\naF39.239392049369158\nasa(dp3777\ng29\nVdefault\np3778\nsg31\n(I119\nI126\nI126\nI180\ntp3779\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3780\nsg42\nNsg111\n(lp3781\nVl_nostril\np3782\nasg45\nI40\nsg46\n"
		+ "(lp3783\n(lp3784\nF4.1147266245381005\naF-3.0993990880453133\naa(lp3785\nF2.4789572892539837\naF-11.183247582739021\naa(lp3786\nF-8.5111089931664736\naF-12.493450044073683\naa(lp3787\nF-8.1053920875220715\naF-7.5487592678950719\naa(lp3788\nF-6.1560191675643416\naF0.24542484706197243\naa(lp3789\nF4.8723498427551784\naF1.493385375560635\naasg52\nVquadratic\np3790\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3791\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3792\nsg65\nVface_nostrill\np3793\nsg67\nI00\nsg68\nVpolygon\np3794\nsg70\n(lp3795\nF21.354429570092478\naF41.556707087262666\nasa(dp3796\ng29\nVdefault\np3797\nsg31\n(I146\nI141\nI115\nI180\ntp3798\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3799\nsg42\nNsg111\n(lp3800\nVlips\np3801\nasg45\nI40\nsg46\n(lp3802\n(lp3803\nF33.664278145980809\naF5.1763840586466507\naa(lp3804\nF20.842525094882042\naF-3.5559727099471186\naa(lp3805\nF-21.850570222206841\naF-3.6522133010897946\naa(lp3806\nF-32.227925849765811\naF4.3463874853683269\naa(lp3807\nF-20.40407137470093\naF11.869203954921918\naa(lp3808\nF19.670881673495664\naF12.55004950630601\naasg52\n"
		+ "Vcubic\np3809\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3810\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3811\nsg65\nVface_mouth\np3812\nsg67\nI00\nsg68\nVpolygon\np3813\nsg70\n(lp3814\nF-0.54844893801410066\naF76.785437613100981\nasa(dp3815\ng29\nVdefault\np3816\nsg31\n(I119\nI126\nI126\nI180\ntp3817\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3818\nsg42\nNsg111\n(lp3819\nVt_lips\np3820\nasg45\nI40\nsg46\n(lp3821\n(lp3822\nF9.2518336746915821\naF17.676638251106816\naa(lp3823\nF11.980791142945794\naF15.390970089110965\naa(lp3824\nF9.6810581979108488\naF11.333594656374743\naa(lp3825\nF-5.4189585148847232\naF7.3441059848224519\naa(lp3826\nF-18.924302030812552\naF11.241120542549531\naa(lp3827\nF-21.476866427479443\naF15.073103222543288\naa(lp3828\nF-18.553455801009687\naF17.550948712379395\naa(lp3829\nF-4.971114010673336\naF15.844851336425048\naasg52\nVquadratic\np3830\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3831\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3832\nsg65\nVface_t_lip\np3833\nsg67\nI00\nsg68\nVpolygon\np3834\nsg70\n(lp3835\nF4.9250198607434186\naF40.370525675127659\nasa(dp3836\n"
		+ "g29\nVoffset\np3837\nsg31\n(I146\nI141\nI115\nI180\ntp3838\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp3839\nsg42\nNsg111\n(lp3840\nVc_u_lip\np3841\naVc_t_lip\np3842\naVc_top_lip\np3843\nasg45\nI40\nsg46\n(lp3844\n(lp3845\nF14.142135623730951\naF14.142135623730951\naa(lp3846\nF14.142135623730951\naF-14.142135623730949\naa(lp3847\nF-14.142135623730949\naF-14.142135623730955\naa(lp3848\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3849\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3850\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3851\nsg65\nVface_t_lipAdd\np3852\nsg67\nI00\nsg68\nVcircle\np3853\nsg70\n(lp3854\nF-0.057560848061143588\naF64.57560848061145\nasa(dp3855\ng29\nVoffset\np3856\nsg31\n(I146\nI141\nI115\nI180\ntp3857\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp3858\nsg42\nNsg111\n(lp3859\nVc_d_lip\np3860\naVc_b_lip\np3861\naVc_bot_lip\np3862\nasg45\nI40\nsg46\n(lp3863\n(lp3864\nF14.142135623730951\naF14.142135623730951\naa(lp3865\nF14.142135623730951\naF-14.142135623730949\naa(lp3866\nF-14.142135623730949\naF-14.142135623730955\naa(lp3867\nF-14.142135623730955\naF14.142135623730947\n"
		+ "aasg52\nVlinear\np3868\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3869\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3870\nsg65\nVface_b_lipAdd\np3871\nsg67\nI00\nsg68\nVcircle\np3872\nsg70\n(lp3873\nF-0.52878042403057268\naF101.6185396465325\nasa(dp3874\ng29\nVoffset\np3875\nsg31\n(I146\nI141\nI115\nI180\ntp3876\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp3877\nsg42\nNsg111\n(lp3878\nVl_b_lip\np3879\nasg45\nI40\nsg46\n(lp3880\n(lp3881\nF14.142135623730951\naF14.142135623730951\naa(lp3882\nF14.142135623730951\naF-14.142135623730949\naa(lp3883\nF-14.142135623730949\naF-14.142135623730955\naa(lp3884\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3885\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3886\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3887\nsg65\nVface_b_lipAdd_1\np3888\nsg67\nI00\nsg68\nVcircle\np3889\nsg70\n(lp3890\nF19.445350266711699\naF99.291560311049238\nasa(dp3891\ng29\nVoffset\np3892\nsg31\n(I146\nI141\nI115\nI180\ntp3893\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp3894\nsg42\nNsg111\n(lp3895\nVl_b_cornerLip\np3896\nasg45\nI40\nsg46\n(lp3897\n(lp3898\nF14.142135623730951\n"
		+ "aF14.142135623730951\naa(lp3899\nF14.142135623730951\naF-14.142135623730949\naa(lp3900\nF-14.142135623730949\naF-14.142135623730955\naa(lp3901\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3902\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3903\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3904\nsg65\nVface_b_lipAdd_2\np3905\nsg67\nI00\nsg68\nVcircle\np3906\nsg70\n(lp3907\nF37.529074325046636\naF92.649856317925114\nasa(dp3908\ng29\nVoffset\np3909\nsg31\n(I146\nI141\nI115\nI180\ntp3910\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp3911\nsg42\nNsg111\n(lp3912\nVl_t_cornerLip\np3913\nasg45\nI40\nsg46\n(lp3914\n(lp3915\nF14.142135623730951\naF14.142135623730951\naa(lp3916\nF14.142135623730951\naF-14.142135623730949\naa(lp3917\nF-14.142135623730949\naF-14.142135623730955\naa(lp3918\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3919\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3920\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3921\nsg65\nVface_t_lipAdd_2\np3922\nsg67\nI00\nsg68\nVcircle\np3923\nsg70\n(lp3924\nF38.225464798536571\naF72.859515830257322\nasa(dp3925\ng29\n"
		+ "Voffset\np3926\nsg31\n(I146\nI141\nI115\nI180\ntp3927\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp3928\nsg42\nNsg111\n(lp3929\nVl_t_lip\np3930\nasg45\nI40\nsg46\n(lp3931\n(lp3932\nF14.142135623730951\naF14.142135623730951\naa(lp3933\nF14.142135623730951\naF-14.142135623730949\naa(lp3934\nF-14.142135623730949\naF-14.142135623730955\naa(lp3935\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np3936\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3937\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3938\nsg65\nVface_t_lipAdd_1\np3939\nsg67\nI00\nsg68\nVcircle\np3940\nsg70\n(lp3941\nF19.984488614811724\naF65.803245215535824\nasa(dp3942\ng29\nVdefault\np3943\nsg31\n(I122\nI118\nI96\nI180\ntp3944\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3945\nsg42\nNsg111\n(lp3946\nVl_nose\np3947\naVl_cheekUp\np3948\naVL_nose2\np3949\nasg45\nI40\nsg46\n(lp3950\n(lp3951\nF9.2518336746915821\naF17.676638251106816\naa(lp3952\nF11.980791142945794\naF15.390970089110965\naa(lp3953\nF9.6810581979108488\naF11.333594656374743\naa(lp3954\nF-5.4189585148847232\naF7.3441059848224519\naa(lp3955\nF-18.924302030812552\n"
		+ "aF11.241120542549531\naa(lp3956\nF-21.476866427479443\naF15.073103222543288\naa(lp3957\nF-18.553455801009687\naF17.550948712379395\naa(lp3958\nF-4.971114010673336\naF15.844851336425048\naasg52\nVquadratic\np3959\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3960\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3961\nsg65\nVface_cheekUp\np3962\nsg67\nI00\nsg68\nVpolygon\np3963\nsg70\n(lp3964\nF64.925019860743419\naF13.370525675127652\nasa(dp3965\ng29\nVdefault\np3966\nsg31\n(I119\nI126\nI126\nI180\ntp3967\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3968\nsg42\nNsg111\n(lp3969\nVb_lips\np3970\nasg45\nI40\nsg46\n(lp3971\n(lp3972\nF9.2518336746915821\naF17.676638251106816\naa(lp3973\nF11.980791142945794\naF15.390970089110965\naa(lp3974\nF9.6810581979108488\naF11.333594656374743\naa(lp3975\nF-4.7649265515784922\naF14.047933608711322\naa(lp3976\nF-18.924302030812552\naF11.241120542549531\naa(lp3977\nF-21.476866427479443\naF15.073103222543288\naa(lp3978\nF-18.553455801009687\naF17.550948712379395\naa(lp3979\nF-4.971114010673336\naF21.89464699700768\naasg52\nVquadratic\np3980\nsg54\nI255\nsg55\nI01\n"
		+ "sg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp3981\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp3982\nsg65\nVface_b_lip\np3983\nsg67\nI00\nsg68\nVpolygon\np3984\nsg70\n(lp3985\nF4.9250198607434186\naF97.370525675127652\nasa(dp3986\ng29\nVdefault\np3987\nsg31\n(I122\nI118\nI96\nI180\ntp3988\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp3989\nsg42\nNsg111\n(lp3990\nVl_cheek\np3991\naVL_cheek2\np3992\nasg45\nI40\nsg46\n(lp3993\n(lp3994\nF-7.6013666008975207\naF30.053207203492569\naa(lp3995\nF-3.5557528611129037\naF34.614151653454783\naa(lp3996\nF4.9410956204014038\naF30.820107475024628\naa(lp3997\nF11.960904269316542\naF14.190718596780531\naa(lp3998\nF6.3554983825710885\naF2.5511891504488986\naa(lp3999\nF-1.2003598459113149\naF0.85321549001498198\naa(lp4000\nF-5.3868930857057045\naF4.9110485056875746\naa(lp4001\nF-2.3378014676125396\naF16.634845099343291\naasg52\nVquadratic\np4002\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4003\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4004\nsg65\nVface_cheek\np4005\nsg67\nI00\nsg68\nVpolygon\np4006\nsg70\n(lp4007\nF107.71501362366166\naF49.897188183739829\nasa(dp4008\ng29\nVdefault\n"
		+ "p4009\nsg31\n(I146\nI141\nI115\nI180\ntp4010\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4011\nsg42\nNsg111\n(lp4012\nVjaw\np4013\nasg45\nI40\nsg46\n(lp4014\n(lp4015\nF16.493324739979329\naF29.424295122921123\naa(lp4016\nF20.569707214467066\naF25.42457287363483\naa(lp4017\nF15.910071856027763\naF20.164652436300237\naa(lp4018\nF-7.9925926782930361\naF13.065413024854976\naa(lp4019\nF-31.115039299064648\naF20.334352768953952\naa(lp4020\nF-35.863231420961363\naF25.54990674177963\naa(lp4021\nF-32.748203461477317\naF29.859132499325931\naa(lp4022\nF-8.0060288253295191\naF35.261547935150858\naasg52\nVquadratic\np4023\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4024\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4025\nsg65\nVface_jaw\np4026\nsg67\nI00\nsg68\nVpolygon\np4027\nsg70\n(lp4028\nF8.2877582253227082\naF113.05189485741727\nasa(dp4029\ng29\nVdefault\np4030\nsg31\n(I122\nI118\nI96\nI180\ntp4031\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4032\nsg42\nNsg111\n(lp4033\nVr_nose\np4034\naVr_cheekUp\np4035\naVR_nose2\np4036\nasg45\nI40\nsg46\n(lp4037\n(lp4038\nF-9.2518336746915821\naF17.676638251106816\n"
		+ "aa(lp4039\nF-11.980791142945794\naF15.390970089110965\naa(lp4040\nF-9.6810581979108488\naF11.333594656374743\naa(lp4041\nF5.4189585148847232\naF7.3441059848224519\naa(lp4042\nF18.924302030812552\naF11.241120542549531\naa(lp4043\nF21.476866427479443\naF15.073103222543288\naa(lp4044\nF18.553455801009687\naF17.550948712379395\naa(lp4045\nF4.971114010673336\naF15.844851336425048\naasg52\nVquadratic\np4046\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4047\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4048\nsg65\nVface_cheekUp_MIRROR\np4049\nsg67\nI01\nsg68\nVpolygon\np4050\nsg70\n(lp4051\nF-64.925019860743419\naF13.370525675127652\nasa(dp4052\ng29\nVdefault\np4053\nsg31\n(I122\nI118\nI96\nI180\ntp4054\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4055\nsg42\nNsg111\n(lp4056\nVr_cheek\np4057\naVR_cheek2\np4058\nasg45\nI40\nsg46\n(lp4059\n(lp4060\nF7.6013666008975207\naF30.053207203492569\naa(lp4061\nF3.5557528611129037\naF34.614151653454783\naa(lp4062\nF-4.9410956204014038\naF30.820107475024628\naa(lp4063\nF-11.960904269316542\naF14.190718596780531\naa(lp4064\nF-6.3554983825710885\naF2.5511891504488986\n"
		+ "aa(lp4065\nF1.2003598459113149\naF0.85321549001498198\naa(lp4066\nF5.3868930857057045\naF4.9110485056875746\naa(lp4067\nF2.3378014676125396\naF16.634845099343291\naasg52\nVquadratic\np4068\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4069\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4070\nsg65\nVface_cheek_MIRROR\np4071\nsg67\nI01\nsg68\nVpolygon\np4072\nsg70\n(lp4073\nF-107.71501362366166\naF49.897188183739829\nasa(dp4074\ng29\nVdefault\np4075\nsg31\n(I119\nI126\nI126\nI180\ntp4076\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4077\nsg42\nNsg111\n(lp4078\nVl_b_lid\np4079\nasg45\nI40\nsg46\n(lp4080\n(lp4081\nF37.726606840683473\naF-7.4214348065886924\naa(lp4082\nF40.348582779536528\naF-10.589369153289692\naa(lp4083\nF38.632333441018048\naF-15.204242085935928\naa(lp4084\nF35.268727500039866\naF-12.407285493249905\naa(lp4085\nF19.633434622890157\naF3.2673981915433856\naa(lp4086\nF-6.1359598555406052\naF3.9559680168988969\naa(lp4087\nF-23.412049057737406\naF-12.233845481744225\naa(lp4088\nF-26.680582286931148\naF-14.10800920619705\naa(lp4089\nF-28.295162934397041\naF-8.1889080080576448\n"
		+ "aa(lp4090\nF-25.805751635441862\naF-6.0408013039576289\naa(lp4091\nF-6.2548160065260223\naF13.808241634385066\naa(lp4092\nF22.452105027594492\naF10.315891635888477\naasg52\nVcubic\np4093\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4094\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4095\nsg65\nVface_b_lid\np4096\nsg67\nI00\nsg68\nVpolygon\np4097\nsg70\n(lp4098\nF54.132546825012\naF-0.082470763354624665\nasa(dp4099\ng29\nVoffset\np4100\nsg31\n(I47\nI50\nI50\nI180\ntp4101\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4102\nsg42\nNsg111\n(lp4103\nVl_lidDetail_7\np4104\naVl_b_2_eyeLid\np4105\nasg45\nI40\nsg46\n(lp4106\n(lp4107\nF10.996041667178162\naF7.9613069000299337\naa(lp4108\nF11.559644913141145\naF4.866916915809945\naa(lp4109\nF10.339700953717205\naF1.7274233349107533\naa(lp4110\nF1.137136452099254\naF3.5974540883389601\naa(lp4111\nF-7.7068046214282546\naF2.0048485076294789\naa(lp4112\nF-9.4283123036215422\naF4.2217074558824432\naa(lp4113\nF-8.6238098794283147\naF7.8986349949205987\naa(lp4114\nF0.93465251199328137\naF10.281246985862655\naasg52\nVquadratic\np4115\nsg54\nI255\nsg55\nI01\nsg56\n"
		+ "F1\nsg59\nNsg60\nI0\nsg61\n(dp4116\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4117\nsg65\nVface_b_lid_2\np4118\nsg67\nI00\nsg68\nVpolygon\np4119\nsg70\n(lp4120\nF59.451897575646598\naF-16.123020616544125\nasa(dp4121\ng29\nVoffset\np4122\nsg31\n(I47\nI50\nI50\nI180\ntp4123\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4124\nsg42\nNsg111\n(lp4125\nVl_lidDetail_6\np4126\naVl_b_1_eyeLid\np4127\nasg45\nI40\nsg46\n(lp4128\n(lp4129\nF10.150942589469693\naF14.347470065096987\naa(lp4130\nF11.424514342210106\naF11.353184320499835\naa(lp4131\nF11.150484379303442\naF8.6190824523937621\naa(lp4132\nF5.1574486070941656\naF6.4688010508270644\naa(lp4133\nF0.4010296344341171\naF3.7615459297329927\naa(lp4134\nF-3.4825671826558064\naF4.7622297396066013\naa(lp4135\nF-3.8942398968419312\naF6.952720998403322\naa(lp4136\nF2.0164077586275617\naF11.734788972353787\naasg52\nVquadratic\np4137\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4138\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4139\nsg65\nVface_b_lid_1\np4140\nsg67\nI00\nsg68\nVpolygon\np4141\nsg70\n(lp4142\nF38.04174370335295\naF-23.417314945817267\nasa(dp4143\ng29\nVoffset\n"
		+ "p4144\nsg31\n(I47\nI50\nI50\nI180\ntp4145\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4146\nsg42\nNsg111\n(lp4147\nVl_lidDetail_8\np4148\naVl_b_3_eyeLid\np4149\nasg45\nI40\nsg46\n(lp4150\n(lp4151\nF9.4341468099526011\naF5.9829067475442219\naa(lp4152\nF7.7069709319847668\naF2.8885167633242403\naa(lp4153\nF4.821005791520232\naF2.456307601616011\naa(lp4154\nF0.40825218539399266\naF5.8882332122697782\naa(lp4155\nF-6.144909764202696\naF8.2524279365317135\naa(lp4156\nF-5.9921436177253131\naF11.406423799120011\naa(lp4157\nF-3.9381253077516405\naF13.833835452377713\naa(lp4158\nF3.9543159026293608\naF10.906004928752882\naasg52\nVquadratic\np4159\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4160\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4161\nsg65\nVface_b_lid_3\np4162\nsg67\nI00\nsg68\nVpolygon\np4163\nsg70\n(lp4164\nF77.451897575646598\naF-23.123020616544125\nasa(dp4165\ng29\nVoffset\np4166\nsg31\n(I47\nI50\nI50\nI180\ntp4167\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4168\nsg42\nNsg111\n(lp4169\nVl_lidDetail_3\np4170\naVl_resn_b\np4171\naVl_t_3_eyeLid\np4172\nasg45\nI40\nsg46\n(lp4173\n(lp4174\n"
		+ "F9.6628772490650263\naF7.9799525562273228\naa(lp4175\nF11.559644913141145\naF4.866916915809945\naa(lp4176\nF11.607605575139495\naF1.7181005068120569\naa(lp4177\nF0.46589282899333462\naF-1.4741643973502203\naa(lp4178\nF-9.7951181155355638\naF1.6971951803726011\naa(lp4179\nF-9.4283123036215422\naF4.809045626100124\naa(lp4180\nF-7.4864248513877261\naF7.7494697453415036\naa(lp4181\nF0.72955029382202596\naF6.3936276687075306\naasg52\nVquadratic\np4182\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4183\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4184\nsg65\nVface_t_lid_2\np4185\nsg67\nI00\nsg68\nVpolygon\np4186\nsg70\n(lp4187\nF58.862102011989094\naF-57.533225052886579\nasa(dp4188\ng29\nVoffset\np4189\nsg31\n(I47\nI50\nI50\nI180\ntp4190\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4191\nsg42\nNsg111\n(lp4192\nVl_lidDetail_4\np4193\naVl_resn_c\np4194\naVl_t_4_eyeLid\np4195\nasg45\nI40\nsg46\n(lp4196\n(lp4197\nF3.3165531388555607\naF10.025590804712861\naa(lp4198\nF7.3828818116362847\naF9.9036018323305015\naa(lp4199\nF9.6837365135822182\naF6.6533111008923953\naa(lp4200\nF1.6614364555619989\naF-0.81059439405233746\n"
		+ "aa(lp4201\nF-4.018631362636901\naF-2.2108551145608146\naa(lp4202\nF-6.8485468585744265\naF0.87797447174261301\naa(lp4203\nF-6.4214008182007714\naF3.775655288717104\naa(lp4204\nF0.074730696977578503\naF6.637166042564079\naasg52\nVquadratic\np4205\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4206\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4207\nsg65\nVface_t_lid_3\np4208\nsg67\nI00\nsg68\nVpolygon\np4209\nsg70\n(lp4210\nF77.206205628499248\naF-52.368712563691446\nasa(dp4211\ng29\nVoffset\np4212\nsg31\n(I47\nI50\nI50\nI180\ntp4213\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4214\nsg42\nNsg111\n(lp4215\nVl_lidDetail_2\np4216\naVl_resn_a\np4217\naVl_t_2_eyeLid\np4218\nasg45\nI40\nsg46\n(lp4219\n(lp4220\nF8.8238227201826263\naF2.6939090242681996\naa(lp4221\nF8.874670420717468\naF0.084306101180262161\naa(lp4222\nF6.82499476050981\naF-3.2323212135941066\naa(lp4223\nF1.2210419049874961\naF-1.4741643973502185\naa(lp4224\nF-3.4183036960293176\naF2.6201551621432397\naa(lp4225\nF-2.967592431227061\naF6.7388710425296434\naa(lp4226\nF-1.6130431492109238\naF9.0919569915533458\naa(lp4227\nF2.6593757102515454\n"
		+ "aF5.3028567811604113\naasg52\nVquadratic\np4228\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4229\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4230\nsg65\nVface_t_lid_1\np4231\nsg67\nI00\nsg68\nVpolygon\np4232\nsg70\n(lp4233\nF39.5770143795541\naF-51.355703797874199\nasa(dp4234\ng29\nVoffset\np4235\nsg31\n(I138\nI146\nI146\nI180\ntp4236\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4237\nsg42\nNsg111\n(lp4238\nVupTeeth_ctrl\np4239\naVt_tooth\np4240\naVupTooth\np4241\naVu_teethCtrl\np4242\nasg45\nI40\nsg46\n(lp4243\n(lp4244\nF12.332649661182472\naF24.595232092163137\naa(lp4245\nF14.216993227679815\naF27.926545607461598\naa(lp4246\nF21.139553916920686\naF27.612358470172772\naa(lp4247\nF22.440904244812522\naF24.496930250600517\naa(lp4248\nF23.135092245571901\naF20.340884316436494\naa(lp4249\nF23.695633204497327\naF16.628605931809094\naa(lp4250\nF21.450593561519032\naF15.784118377517721\naa(lp4251\nF15.196509990784655\naF15.099354575151473\naa(lp4252\nF8.7974052019304452\naF14.945454177391856\naa(lp4253\nF1.4144185233106441\naF15.046200672169014\naa(lp4254\nF-5.9690378438368867\naF14.962269617016045\n"
		+ "aa(lp4255\nF-15.527965597413921\naF15.595832469884577\naa(lp4256\nF-21.926770052207448\naF16.978739070322845\naa(lp4257\nF-23.818850433303112\naF19.789245258497864\naa(lp4258\nF-23.700237513018479\naF22.855429587877417\naa(lp4259\nF-21.060140319212859\naF27.514076339393604\naa(lp4260\nF-18.521528795440965\naF29.191144673826543\naa(lp4261\nF-13.106016986274808\naF29.513070470643349\naa(lp4262\nF-10.606215099224306\naF25.710576183355364\naa(lp4263\nF-7.6565448409161156\naF29.018031130438203\naa(lp4264\nF-0.29205694284204986\naF28.279525470041513\naa(lp4265\nF1.3057598695311774\naF25.130520386890002\naa(lp4266\nF4.6762999958852731\naF28.177229086704777\naa(lp4267\nF9.8588472733045194\naF27.908408563673145\naasg52\nVcubic\np4268\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4269\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4270\nsg65\nVface_tooth_up\np4271\nsg67\nI00\nsg68\nVpolygon\np4272\nsg70\n(lp4273\nF-42.365299718464598\naF166.89251667565804\nasa(dp4274\ng29\nVoffset\np4275\nsg31\n(I138\nI146\nI146\nI180\ntp4276\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4277\nsg42\nNsg111\n"
		+ "(lp4278\nVlowTeeth_ctrl\np4279\naVb_tooth\np4280\naVdownTooth\np4281\naVd_teethCtrl\np4282\nasg45\nI40\nsg46\n(lp4283\n(lp4284\nF12.908305893348697\naF30.867993194781981\naa(lp4285\nF14.216993227679815\naF27.926545607461598\naa(lp4286\nF21.139553916920686\naF27.612358470172772\naa(lp4287\nF22.767920226465634\naF30.662938202183852\naa(lp4288\nF22.921585943500855\naF33.974207617669073\naa(lp4289\nF22.479458066117971\naF36.264429193798435\naa(lp4290\nF21.472214452868005\naF39.829252168986876\naa(lp4291\nF17.046447506830582\naF41.193067821935209\naa(lp4292\nF9.0892872351414908\naF41.302672037491121\naa(lp4293\nF1.3009088437285712\naF41.481794263408283\naa(lp4294\nF-5.6987767019748077\naF41.582992090430835\naa(lp4295\nF-14.041529317172486\naF41.676032659575206\naa(lp4296\nF-20.710594913828093\naF40.896850125116842\naa(lp4297\nF-21.52163072747544\naF37.356219479533003\naa(lp4298\nF-21.403017807190807\naF35.422572684464093\naa(lp4299\nF-20.78987917735078\naF32.378776892911027\naa(lp4300\nF-18.521528795440965\naF29.191144673826543\naa(lp4301\nF-13.106016986274808\naF29.513070470643349\n"
		+ "aa(lp4302\nF-9.7954316736380687\naF31.791451875252143\naa(lp4303\nF-7.6565448409161156\naF29.018031130438203\naa(lp4304\nF-0.29205694284204986\naF28.279525470041513\naa(lp4305\nF1.9814127241863679\naF31.21139607878678\naa(lp4306\nF4.6762999958852731\naF28.177229086704777\naa(lp4307\nF9.8588472733045194\naF27.908408563673145\naasg52\nVcubic\np4308\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4309\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4310\nsg65\nVface_tooth_down\np4311\nsg67\nI00\nsg68\nVpolygon\np4312\nsg70\n(lp4313\nF-42.686738868987817\naF172.69458172537787\nasa(dp4314\ng29\nVoffset\np4315\nsg31\n(I138\nI146\nI146\nI180\ntp4316\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4317\nsg42\nNsg111\n(lp4318\nVtongue_1\np4319\nasg45\nI40\nsg46\n(lp4320\n(lp4321\nF-1.465748375565866\naF25.207912124260723\naa(lp4322\nF1.0482479167845007\naF16.778690367122366\naa(lp4323\nF-1.3401382433366198\naF8.7548184050662456\naa(lp4324\nF-17.016628212053789\naF6.3630580398631089\naa(lp4325\nF-23.59117898904238\naF13.939002391187735\naa(lp4326\nF-24.994537446172238\naF20.228406509238475\naa(lp4327\n"
		+ "F-20.882168490419726\naF26.740704084461882\naa(lp4328\nF-13.485533472800885\naF29.51967880472138\naasg52\nVquadratic\np4329\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4330\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4331\nsg65\nVface_tongue_1\np4332\nsg67\nI00\nsg68\nVpolygon\np4333\nsg70\n(lp4334\nF27.399657355763956\naF178.23170126344803\nasa(dp4335\ng29\nVoffset\np4336\nsg31\n(I138\nI146\nI146\nI180\ntp4337\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4338\nsg42\nNsg111\n(lp4339\nVtongue_2\np4340\nasg45\nI40\nsg46\n(lp4341\n(lp4342\nF2.6464202891560897\naF21.569134725524645\naa(lp4343\nF4.0070777612986035\naF17.640959254062121\naa(lp4344\nF3.2168971016081187\naF11.287191168112667\naa(lp4345\nF-8.0036157573431232\naF8.5220451214781505\naa(lp4346\nF-18.467742095093925\naF7.2384517752819715\naa(lp4347\nF-16.622500640653897\naF13.997784372306555\naa(lp4348\nF-18.833358818939548\naF22.254812678591552\naa(lp4349\nF-7.0416154893262828\naF21.10231619873143\naasg52\nVquadratic\np4350\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4351\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4352\nsg65\n"
		+ "Vface_tongue_2\np4353\nsg67\nI00\nsg68\nVpolygon\np4354\nsg70\n(lp4355\nF48.834821456278846\naF180.25935192160483\nasa(dp4356\ng29\nVoffset\np4357\nsg31\n(I138\nI146\nI146\nI180\ntp4358\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4359\nsg42\nNsg111\n(lp4360\nVtongue_3\np4361\naVtongue_root2\np4362\nasg45\nI40\nsg46\n(lp4363\n(lp4364\nF-0.71799988903492196\naF20.653036968237895\naa(lp4365\nF5.3553610397753841\naF18.64477119381803\naa(lp4366\nF3.2816171306344675\naF14.396116579030746\naa(lp4367\nF-7.7992398955023692\naF12.243783494528657\naa(lp4368\nF-15.234696646479868\naF10.544177958738825\naa(lp4369\nF-14.299443737000917\naF15.775287974690926\naa(lp4370\nF-15.483339149476919\naF20.855909789537101\naa(lp4371\nF-7.5460245624461653\naF22.454083633559708\naasg52\nVquadratic\np4372\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4373\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4374\nsg65\nVface_tongue_3\np4375\nsg67\nI00\nsg68\nVpolygon\np4376\nsg70\n(lp4377\nF70.84931431626714\naF182.03893076361078\nasa(dp4378\ng29\nVdefault\np4379\nsg31\n(I119\nI126\nI126\nI180\ntp4380\nsg34\nI20\nsg35\nI01\nsg37\nI10\n"
		+ "sg44\nI00\nsg39\nNsg40\n(lp4381\nsg42\nNsg111\n(lp4382\nVc_brow\np4383\naVbrows_center\np4384\nasg45\nI40\nsg46\n(lp4385\n(lp4386\nF11.774612017298978\naF-1.2038341601661866\naa(lp4387\nF15.365495259016296\naF-5.9779212825263883\naa(lp4388\nF11.483944456399469\naF-9.3806915236073536\naa(lp4389\nF-0.22077222392512219\naF-6.5079894323572525\naa(lp4390\nF-12.142292436270669\naF-9.2535319535343916\naa(lp4391\nF-15.33027563779226\naF-5.7405492628212809\naa(lp4392\nF-12.885077131390403\naF-1.479574630288937\naa(lp4393\nF-0.39804011815708318\naF3.3958927905581326\naasg52\nVquadratic\np4394\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4395\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4396\nsg65\nVface_c_brow\np4397\nsg67\nI00\nsg68\nVpolygon\np4398\nsg70\n(lp4399\nF0\naF-100\nasa(dp4400\ng29\nVoffset\np4401\nsg31\n(I146\nI141\nI115\nI180\ntp4402\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n(lp4403\nsg42\nNsg111\n(lp4404\nVl_lip\np4405\nasg45\nI40\nsg46\n(lp4406\n(lp4407\nF14.142135623730951\naF14.142135623730951\naa(lp4408\nF14.142135623730951\naF-14.142135623730949\naa(lp4409\nF-14.142135623730949\naF-14.142135623730955\n"
		+ "aa(lp4410\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4411\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4412\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4413\nsg65\nVface_t_lipAdd_4\np4414\nsg67\nI00\nsg68\nVcircle\np4415\nsg70\n(lp4416\nF51.319808487016807\naF82.439477899423039\nasa(dp4417\ng29\nVdefault\np4418\nsg31\n(I119\nI126\nI126\nI180\ntp4419\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4420\nsg42\nNsg111\n(lp4421\nVl_mouthCorner\np4422\nasg45\nI40\nsg46\n(lp4423\n(lp4424\nF-15.220199860624184\naF18.815699663531376\naa(lp4425\nF-0.83140855527622293\naF13.874146813554884\naa(lp4426\nF-1.6120805481441245\naF-5.1660469290767033\naa(lp4427\nF-15.629547715954615\naF-8.5059541642451428\naa(lp4428\nF-18.554883531048812\naF-8.955035219665735\naa(lp4429\nF-20.773211669453307\naF-6.8224791586438691\naa(lp4430\nF-20.696619436300828\naF-2.984038451749905\naa(lp4431\nF-15.0497955777257\naF1.9045378091987821\naa(lp4432\nF-15.144218351761552\naF9.344820650630993\naa(lp4433\nF-20.013232188345107\naF12.911513469075921\naa(lp4434\nF-20.730036868912485\naF15.426354480599247\n"
		+ "aa(lp4435\nF-17.751723589146174\naF18.514608566669388\naasg52\nVcubic\np4436\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4437\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4438\nsg65\nVface_l_lip\np4439\nsg67\nI00\nsg68\nVpolygon\np4440\nsg70\n(lp4441\nF77.446347210701731\naF77.386134673331782\nasa(dp4442\ng29\nVdefault\np4443\nsg31\n(I119\nI126\nI126\nI180\ntp4444\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp4445\nsg42\nNsg111\n(lp4446\nVnose_2\np4447\naVnose2\np4448\naVnoseBase_2\np4449\naVnoseBase\np4450\nasg45\nI40\nsg46\n(lp4451\n(lp4452\nF14.142135623730951\naF14.142135623730951\naa(lp4453\nF14.142135623730951\naF-14.142135623730949\naa(lp4454\nF-14.142135623730949\naF-14.142135623730955\naa(lp4455\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4456\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4457\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4458\nsg65\nVface_nose_1\np4459\nsg67\nI00\nsg68\nVcircle\np4460\nsg70\n(lp4461\nF-0.31863081771035473\naF5.5604442039051865\nasa(dp4462\ng29\nVdefault\np4463\nsg31\n(I119\nI126\nI126\nI180\ntp4464\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI00\nsg39\nNsg40\n"
		+ "(lp4465\nsg42\nNsg111\n(lp4466\nVnose_1\np4467\naVnose3\np4468\naVnoseBase_1\np4469\nasg45\nI40\nsg46\n(lp4470\n(lp4471\nF14.142135623730951\naF14.142135623730951\naa(lp4472\nF14.142135623730951\naF-14.142135623730949\naa(lp4473\nF-14.142135623730949\naF-14.142135623730955\naa(lp4474\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4475\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4476\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4477\nsg65\nVface_nose_2\np4478\nsg67\nI00\nsg68\nVcircle\np4479\nsg70\n(lp4480\nF1.7763568394002505e-15\naF-9.0083583170333483\nasa(dp4481\ng29\nVdefault\np4482\nsg31\n(I146\nI141\nI115\nI180\ntp4483\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp4484\nsg42\nNsg111\n(lp4485\nVjaw_2\np4486\naVC_low_lip\np4487\nasg45\nI40\nsg46\n(lp4488\n(lp4489\nF14.142135623730951\naF14.142135623730951\naa(lp4490\nF14.142135623730951\naF-14.142135623730949\naa(lp4491\nF-14.142135623730949\naF-14.142135623730955\naa(lp4492\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4493\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4494\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n"
		+ "(lp4495\nsg65\nVface_jaw_2\np4496\nsg67\nI00\nsg68\nVcircle\np4497\nsg70\n(lp4498\nF0\naF159\nasa(dp4499\ng29\nVdefault\np4500\nsg31\n(I119\nI126\nI126\nI180\ntp4501\nsg34\nI20\nsg35\nI01\nsg37\nI4\nsg44\nI00\nsg39\nNsg40\n(lp4502\nsg42\nNsg111\n(lp4503\nVnose4\np4504\nasg45\nI40\nsg46\n(lp4505\n(lp4506\nF14.142135623730951\naF14.142135623730951\naa(lp4507\nF14.142135623730951\naF-14.142135623730949\naa(lp4508\nF-14.142135623730949\naF-14.142135623730955\naa(lp4509\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4510\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4511\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4512\nsg65\nVface_nose_3\np4513\nsg67\nI00\nsg68\nVcircle\np4514\nsg70\n(lp4515\nF1.7763568394002505e-15\naF-20.008358317033348\nasa(dp4516\ng29\nVdefault\np4517\nsg31\n(I119\nI126\nI126\nI180\ntp4518\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp4519\nsg42\nNsg111\n(lp4520\nVl_whisker_1\np4521\nasg45\nI40\nsg46\n(lp4522\n(lp4523\nF14.142135623730951\naF14.142135623730951\naa(lp4524\nF14.142135623730951\naF-14.142135623730949\naa(lp4525\nF-14.142135623730949\naF-14.142135623730955\naa(lp4526\n"
		+ "F-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4527\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4528\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4529\nsg65\nVface_whisker_1\np4530\nsg67\nI00\nsg68\nVcircle\np4531\nsg70\n(lp4532\nF140.71558977599037\naF44.32725039007255\nasa(dp4533\ng29\nVdefault\np4534\nsg31\n(I119\nI126\nI126\nI180\ntp4535\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp4536\nsg42\nNsg111\n(lp4537\nVl_whisker_2\np4538\nasg45\nI40\nsg46\n(lp4539\n(lp4540\nF14.142135623730951\naF14.142135623730951\naa(lp4541\nF14.142135623730951\naF-14.142135623730949\naa(lp4542\nF-14.142135623730949\naF-14.142135623730955\naa(lp4543\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4544\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4545\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4546\nsg65\nVface_whisker_2\np4547\nsg67\nI00\nsg68\nVcircle\np4548\nsg70\n(lp4549\nF143.98114143745852\naF62.054530838042396\nasa(dp4550\ng29\nVdefault\np4551\nsg31\n(I119\nI126\nI126\nI180\ntp4552\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp4553\nsg42\nNsg111\n(lp4554\nVl_whisker_3\np4555\n"
		+ "asg45\nI40\nsg46\n(lp4556\n(lp4557\nF14.142135623730951\naF14.142135623730951\naa(lp4558\nF14.142135623730951\naF-14.142135623730949\naa(lp4559\nF-14.142135623730949\naF-14.142135623730955\naa(lp4560\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4561\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4562\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4563\nsg65\nVface_whisker_3\np4564\nsg67\nI00\nsg68\nVcircle\np4565\nsg70\n(lp4566\nF138.38305287494174\naF79.315303905802523\nasa(dp4567\ng29\nVfk\np4568\nsg31\n(I119\nI126\nI126\nI180\ntp4569\nsg34\nI20\nsg35\nI01\nsg37\nI8\nsg44\nI00\nsg39\nNsg40\n(lp4570\nsg42\nNsg111\n(lp4571\nVl_eyeball\np4572\nasg45\nI40\nsg46\n(lp4573\n(lp4574\nF14.142135623730951\naF14.142135623730951\naa(lp4575\nF14.142135623730951\naF-14.142135623730949\naa(lp4576\nF-14.142135623730949\naF-14.142135623730955\naa(lp4577\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4578\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4579\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4580\nsg65\nVface_eyeball\np4581\nsg67\nI00\nsg68\nVcircle\np4582\nsg70\n(lp4583\nF120\naF-31\nasa(dp4584\n"
		+ "g29\nVfk\np4585\nsg31\n(I138\nI146\nI146\nI180\ntp4586\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp4587\nsg42\nNsg111\n(lp4588\nVtongue_root\np4589\nasg45\nI40\nsg46\n(lp4590\n(lp4591\nF21.77011786386781\naF-1.518745652676361\naa(lp4592\nF14.739275899349922\naF-0.44334627545969507\naa(lp4593\nF9.4362897327030133\naF-2.3126669555074368\naa(lp4594\nF4.952417421816711\naF-6.5638763580220445\naa(lp4595\nF4.5546686592079997\naF-14.832053429979421\naa(lp4596\nF-8.1989562662876114\naF2.7324581470314895\naa(lp4597\nF6.423985377473084\naF9.0164945793963067\naa(lp4598\nF19.900797183820082\naF10.161052156206312\naasg52\nVquadratic\np4599\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4600\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4601\nsg65\nVface_tongue_root\np4602\nsg67\nI00\nsg68\nVpolygon\np4603\nsg70\n(lp4604\nF-5.4301312856921875\naF210.75623257216935\nasa(dp4605\ng29\nVdefault\np4606\nsg31\n(I138\nI146\nI146\nI180\ntp4607\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp4608\nsg42\nNsg111\n(lp4609\nVtongue_4\np4610\nasg45\nI40\nsg46\n(lp4611\n(lp4612\nF14.142135623730951\naF14.142135623730951\n"
		+ "aa(lp4613\nF14.142135623730951\naF-14.142135623730949\naa(lp4614\nF-14.142135623730949\naF-14.142135623730955\naa(lp4615\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4616\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4617\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4618\nsg65\nVface_tongue_4\np4619\nsg67\nI00\nsg68\nVcircle\np4620\nsg70\n(lp4621\nF85.702353674160506\naF198.93479302577478\nasa(dp4622\ng29\nVdefault\np4623\nsg31\n(I138\nI146\nI146\nI180\ntp4624\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp4625\nsg42\nNsg111\n(lp4626\nVtongue_5\np4627\nasg45\nI40\nsg46\n(lp4628\n(lp4629\nF14.142135623730951\naF14.142135623730951\naa(lp4630\nF14.142135623730951\naF-14.142135623730949\naa(lp4631\nF-14.142135623730949\naF-14.142135623730955\naa(lp4632\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4633\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4634\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4635\nsg65\nVface_tongue_5\np4636\nsg67\nI00\nsg68\nVcircle\np4637\nsg70\n(lp4638\nF100.78405278441778\naF198.69540097640558\nasa(dp4639\ng29\nVdefault\np4640\nsg31\n(I146\nI141\n"
		+ "I115\nI180\ntp4641\nsg34\nI12\nsg35\nI01\nsg37\nI20\nsg44\nI00\nsg39\nNsg40\n(lp4642\nsg42\nNsg111\n(lp4643\nVl_ear_1\np4644\nasg45\nI30\nsg46\n(lp4645\n(lp4646\nF14.142135623730951\naF14.142135623730951\naa(lp4647\nF14.142135623730951\naF-14.142135623730949\naa(lp4648\nF-14.142135623730949\naF-14.142135623730955\naa(lp4649\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4650\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4651\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4652\nsg65\nVface_ear_1\np4653\nsg67\nI00\nsg68\nVrect\np4654\nsg70\n(lp4655\nF50.146227777677808\naF-163.7321327562544\nasa(dp4656\ng29\nVdefault\np4657\nsg31\n(I146\nI141\nI115\nI180\ntp4658\nsg34\nI0\nsg35\nI01\nsg37\nI20\nsg44\nI00\nsg39\nNsg40\n(lp4659\nsg42\nNsg111\n(lp4660\nVl_ear_2\np4661\naVl_ear2\np4662\naVl_ear_B\np4663\naVl_ear_b\np4664\nasg45\nI0\nsg46\n(lp4665\n(lp4666\nF14.142135623730951\naF14.142135623730951\naa(lp4667\nF14.142135623730951\naF-14.142135623730949\naa(lp4668\nF-14.142135623730949\naF-14.142135623730955\naa(lp4669\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4670\nsg54\nI255\nsg55\nI01\nsg56\nF1\n"
		+ "sg59\nNsg60\nI0\nsg61\n(dp4671\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4672\nsg65\nVface_ear_2\np4673\nsg67\nI00\nsg68\nVrect\np4674\nsg70\n(lp4675\nF53.976060520134403\naF-183.57572825245498\nasa(dp4676\ng29\nVdefault\np4677\nsg31\n(I146\nI141\nI115\nI180\ntp4678\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp4679\nsg42\nNsg111\n(lp4680\nVl_ear_local_4\np4681\nasg45\nI40\nsg46\n(lp4682\n(lp4683\nF14.142135623730951\naF14.142135623730951\naa(lp4684\nF14.142135623730951\naF-14.142135623730949\naa(lp4685\nF-14.142135623730949\naF-14.142135623730955\naa(lp4686\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4687\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4688\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4689\nsg65\nVface_ear_3\np4690\nsg67\nI00\nsg68\nVcircle\np4691\nsg70\n(lp4692\nF49.850602038105436\naF-222.31423662153725\nasa(dp4693\ng29\nVdefault\np4694\nsg31\n(I146\nI141\nI115\nI180\ntp4695\nsg34\nI12\nsg35\nI01\nsg37\nI20\nsg44\nI00\nsg39\nNsg40\n(lp4696\nsg42\nNsg111\n(lp4697\nVl_ear_2\np4698\nasg45\nI30\nsg46\n(lp4699\n(lp4700\nF-14.142135623730951\naF14.142135623730951\naa(lp4701\nF-14.142135623730951\n"
		+ "aF-14.142135623730949\naa(lp4702\nF14.142135623730949\naF-14.142135623730955\naa(lp4703\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4704\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4705\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4706\nsg65\nVitem_121\np4707\nsg67\nI01\nsg68\nVrect\np4708\nsg70\n(lp4709\nF49.867309611577014\naF-182.57572825245495\nasa(dp4710\ng29\nVdefault\np4711\nsg31\n(I146\nI141\nI115\nI180\ntp4712\nsg34\nI0\nsg35\nI01\nsg37\nI0\nsg44\nI00\nsg39\nNsg40\n(lp4713\nsg42\nNsg111\n(lp4714\nVhead\np4715\nasg45\nI0\nsg46\n(lp4716\n(lp4717\nF14.142135623730951\naF14.142135623730951\naa(lp4718\nF14.142135623730951\naF-14.142135623730949\naa(lp4719\nF-14.142135623730949\naF-14.142135623730955\naa(lp4720\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4721\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4722\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4723\nsg65\nVface_head\np4724\nsg67\nI00\nsg68\nVrect\np4725\nsg70\n(lp4726\nF-1.23582508626059\naF-139.64823474744679\nasa(dp4727\ng29\nVdefault\np4728\nsg31\n(I85\nI170\nI127\nI255\ntp4729\nsg33\nS'3'\nsg34\nI31\nsg35\nI01\nsg36\n"
		+ "I255\nsg37\nI100\nsg38\nF-1\nsg39\nNsg40\n(lp4730\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace\\u000ageo = ns+\"geo\"\\u000a\\u000aroot_name = self.main.get_root_name()\\u000aviews = self.main.views[root_name]\\u000asel = cmds.ls(sl=1)\\u000a\\u000adef getSmooth():\\u000a    global geo\\u000a    for o in cmds.listRelatives(geo, allDescendents=1):\\u000a        shapes = cmds.listRelatives(o, s=1) or []\\u000a        for s in shapes:\\u000a            if 'scaleCube' in s:\\u000a                continue\\u000a            if not cmds.getAttr(s+'.intermediateObject'):\\u000a                smooth = 3 in cmds.displaySmoothness( s, q=True, polygonObject=True )\\u000a                return (smooth)\\u000a\\u000aif cmds.objExists(geo):\\u000a    cmds.select(geo)\\u000a    if not getSmooth():\\u000a        cmds.displaySmoothness(divisionsU=0, divisionsV=3, pointsWire=16, pointsShaded=4, polygonObject=3)\\u000a    else:\\u000a        cmds.displaySmoothness(divisionsU=0, divisionsV=0, pointsWire=4, pointsShaded=1, polygonObject=1)\\u000a\\u000a    if sel:\\u000a        cmds.select(sel)\\u000a    else:\\u000a        cmds.select(clear=1)\\u000a\\u000a\\u000afor view in views:\\u000a    for item in view.items:\\u000a        if item.name == \"common_item_smooth\" or item.name == \"common_face_smooth\":\\u000a            if getSmooth():\\u000a                item.text.set_text(\"3\")\\u000a                item.set_color(QtGui.QColor(85, 170, 127, 255))\\u000a            else:\\u000a                item.text.set_text(\"1\")\\u000a                item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000a\\u000a\\u000a    self.view.scene().update()\n"
		+ "p4731\nsg44\nI00\nsg45\nI22\nsg46\n(lp4732\n(lp4733\nF14.142135623730951\naF14.142135623730951\naa(lp4734\nF14.142135623730951\naF-14.142135623730949\naa(lp4735\nF-14.142135623730949\naF-14.142135623730955\naa(lp4736\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4737\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp4738\nsg59\nNsg60\nI0\nsg61\n(dp4739\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4740\nsg65\nVface_smooth\np4741\nsg67\nI00\nsg68\nVrect\np4742\nsg70\n(lp4743\nF149\naF-157\nasa(dp4744\ng29\nVdefault\np4745\nsg31\n(I150\nI150\nI150\nI180\ntp4746\nsg33\nS'Eyes'\np4747\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI20\nsg38\nF-1\nsg39\nNsg40\n(lp4748\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000a\\u000amods = cmds.getModifiers()\\u000a\\u000aif mods == 4:\\u000a    if cmds.objExists(ns+\"look_controlSet\"):\\u000a        cmds.select(ns+\"look_controlSet\", tgl=1)\\u000a    if cmds.objExists(ns+\"eyes_controlSet\"):\\u000a        cmds.select(ns+\"eyes_controlSet\", tgl=1)\\u000aelse:\\u000a    if cmds.objExists(ns+\"look_controlSet\"):\\u000a        cmds.select(ns+\"look_controlSet\")\\u000a    if cmds.objExists(ns+\"eyes_controlSet\"):\\u000a        cmds.select(ns+\"eyes_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\n"
		+ "p4749\nsg44\nI00\nsg45\nI46\nsg46\n(lp4750\n(lp4751\nF14.142135623730951\naF14.142135623730951\naa(lp4752\nF14.142135623730951\naF-14.142135623730949\naa(lp4753\nF-14.142135623730949\naF-14.142135623730955\naa(lp4754\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4755\nsg54\nI255\nsg55\nI00\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp4756\nsg59\nNsg60\nI0\nsg61\n(dp4757\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4758\nsg65\nVface_set_eyes\np4759\nsg67\nI00\nsg68\nVrect\np4760\nsg70\n(lp4761\nF-143\naF-212.58829190753241\nasa(dp4762\ng29\nVfk\np4763\nsg31\n(I119\nI126\nI126\nI180\ntp4764\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI00\nsg39\nNsg40\n(lp4765\nsg42\nNsg111\n(lp4766\nVeyes_l_ball\np4767\nasg45\nI40\nsg46\n(lp4768\n(lp4769\nF14.142135623730951\naF14.142135623730951\naa(lp4770\nF14.142135623730951\naF-14.142135623730949\naa(lp4771\nF-14.142135623730949\naF-14.142135623730955\naa(lp4772\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4773\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4774\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4775\nsg65\nVface_eyeball_2\np4776\nsg67\nI00\nsg68\nVcircle\np4777\n"
		+ "sg70\n(lp4778\nF138\naF-31\nasa(dp4779\ng29\nVik\np4780\nsg31\n(I146\nI141\nI115\nI180\ntp4781\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp4782\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000acmds.select(ns+\"face_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\np4783\nsg111\n(lp4784\nVeyes_look_ik\np4785\nasg45\nI0\nsg46\n(lp4786\n(lp4787\nF14.142135623730951\naF14.142135623730951\naa(lp4788\nF14.142135623730951\naF-14.142135623730949\naa(lp4789\nF-14.142135623730949\naF-14.142135623730955\naa(lp4790\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np4791\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4792\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4793\nsg65\nVface_look_ik\np4794\nsg67\nI00\nsg68\nVrect\np4795\nsg70\n(lp4796\nF-0.56364770378501472\naF-32.266625086121593\nasa(dp4797\ng29\nVoffset\np4798\nsg31\n(I47\nI50\nI50\nI180\ntp4799\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4800\nsg42\nNsg111\n(lp4801\nVr_lidDetail_3\np4802\naVr_resn_b\np4803\naVr_t_3_eyeLid\np4804\nasg45\nI40\nsg46\n(lp4805\n(lp4806\n"
		+ "F-9.6628772490650263\naF7.9799525562273228\naa(lp4807\nF-11.559644913141145\naF4.866916915809945\naa(lp4808\nF-11.607605575139495\naF1.7181005068120569\naa(lp4809\nF-0.46589282899333462\naF-1.4741643973502203\naa(lp4810\nF9.7951181155355638\naF1.6971951803726011\naa(lp4811\nF9.4283123036215422\naF4.809045626100124\naa(lp4812\nF7.4864248513877261\naF7.7494697453415036\naa(lp4813\nF-0.72955029382202596\naF6.3936276687075306\naasg52\nVquadratic\np4814\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4815\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4816\nsg65\nVface_t_lid_2_MIRROR\np4817\nsg67\nI01\nsg68\nVpolygon\np4818\nsg70\n(lp4819\nF-58.862102011989094\naF-57.533225052886579\nasa(dp4820\ng29\nVoffset\np4821\nsg31\n(I47\nI50\nI50\nI180\ntp4822\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4823\nsg42\nNsg111\n(lp4824\nVr_lidDetail_4\np4825\naVr_resn_c\np4826\naVr_t_4_eyeLid\np4827\nasg45\nI40\nsg46\n(lp4828\n(lp4829\nF-3.3165531388555607\naF10.025590804712861\naa(lp4830\nF-7.3828818116362847\naF9.9036018323305015\naa(lp4831\nF-9.6837365135822182\naF6.6533111008923953\naa(lp4832\nF-1.6614364555619989\n"
		+ "aF-0.81059439405233746\naa(lp4833\nF4.018631362636901\naF-2.2108551145608146\naa(lp4834\nF6.8485468585744265\naF0.87797447174261301\naa(lp4835\nF6.4214008182007714\naF3.775655288717104\naa(lp4836\nF-0.074730696977578503\naF6.637166042564079\naasg52\nVquadratic\np4837\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4838\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4839\nsg65\nVface_t_lid_3_MIRROR\np4840\nsg67\nI01\nsg68\nVpolygon\np4841\nsg70\n(lp4842\nF-77.206205628499248\naF-52.368712563691446\nasa(dp4843\ng29\nVoffset\np4844\nsg31\n(I47\nI50\nI50\nI180\ntp4845\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4846\nsg42\nNsg111\n(lp4847\nVr_lidDetail_2\np4848\naVr_resn_a\np4849\naVr_t_2_eyeLid\np4850\nasg45\nI40\nsg46\n(lp4851\n(lp4852\nF-8.8238227201826263\naF2.6939090242681996\naa(lp4853\nF-8.874670420717468\naF0.084306101180262161\naa(lp4854\nF-6.82499476050981\naF-3.2323212135941066\naa(lp4855\nF-1.2210419049874961\naF-1.4741643973502185\naa(lp4856\nF3.4183036960293176\naF2.6201551621432397\naa(lp4857\nF2.967592431227061\naF6.7388710425296434\naa(lp4858\nF1.6130431492109238\naF9.0919569915533458\n"
		+ "aa(lp4859\nF-2.6593757102515454\naF5.3028567811604113\naasg52\nVquadratic\np4860\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4861\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4862\nsg65\nVface_t_lid_1_MIRROR\np4863\nsg67\nI01\nsg68\nVpolygon\np4864\nsg70\n(lp4865\nF-39.5770143795541\naF-51.355703797874199\nasa(dp4866\ng29\nVoffset\np4867\nsg31\n(I47\nI50\nI50\nI180\ntp4868\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4869\nsg42\nNsg111\n(lp4870\nVr_lidDetail_6\np4871\naVr_b_1_eyeLid\np4872\nasg45\nI40\nsg46\n(lp4873\n(lp4874\nF-10.150942589469693\naF14.347470065096987\naa(lp4875\nF-11.424514342210106\naF11.353184320499835\naa(lp4876\nF-11.150484379303442\naF8.6190824523937621\naa(lp4877\nF-5.1574486070941656\naF6.4688010508270644\naa(lp4878\nF-0.4010296344341171\naF3.7615459297329927\naa(lp4879\nF3.4825671826558064\naF4.7622297396066013\naa(lp4880\nF3.8942398968419312\naF6.952720998403322\naa(lp4881\nF-2.0164077586275617\naF11.734788972353787\naasg52\nVquadratic\np4882\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4883\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4884\nsg65\nVface_b_lid_1_MIRROR\n"
		+ "p4885\nsg67\nI01\nsg68\nVpolygon\np4886\nsg70\n(lp4887\nF-38.04174370335295\naF-23.417314945817267\nasa(dp4888\ng29\nVoffset\np4889\nsg31\n(I47\nI50\nI50\nI180\ntp4890\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4891\nsg42\nNsg111\n(lp4892\nVr_lidDetail_7\np4893\naVr_b_2_eyeLid\np4894\nasg45\nI40\nsg46\n(lp4895\n(lp4896\nF-10.996041667178162\naF7.9613069000299337\naa(lp4897\nF-11.559644913141145\naF4.866916915809945\naa(lp4898\nF-10.339700953717205\naF1.7274233349107533\naa(lp4899\nF-1.137136452099254\naF3.5974540883389601\naa(lp4900\nF7.7068046214282546\naF2.0048485076294789\naa(lp4901\nF9.4283123036215422\naF4.2217074558824432\naa(lp4902\nF8.6238098794283147\naF7.8986349949205987\naa(lp4903\nF-0.93465251199328137\naF10.281246985862655\naasg52\nVquadratic\np4904\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4905\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4906\nsg65\nVface_b_lid_2_MIRROR\np4907\nsg67\nI01\nsg68\nVpolygon\np4908\nsg70\n(lp4909\nF-59.451897575646598\naF-16.123020616544125\nasa(dp4910\ng29\nVoffset\np4911\nsg31\n(I47\nI50\nI50\nI180\ntp4912\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\n"
		+ "sg39\nNsg40\n(lp4913\nsg42\nNsg111\n(lp4914\nVr_lidDetail_8\np4915\naVr_b_3_eyeLid\np4916\nasg45\nI40\nsg46\n(lp4917\n(lp4918\nF-9.4341468099526011\naF5.9829067475442219\naa(lp4919\nF-7.7069709319847668\naF2.8885167633242403\naa(lp4920\nF-4.821005791520232\naF2.456307601616011\naa(lp4921\nF-0.40825218539399266\naF5.8882332122697782\naa(lp4922\nF6.144909764202696\naF8.2524279365317135\naa(lp4923\nF5.9921436177253131\naF11.406423799120011\naa(lp4924\nF3.9381253077516405\naF13.833835452377713\naa(lp4925\nF-3.9543159026293608\naF10.906004928752882\naasg52\nVquadratic\np4926\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4927\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4928\nsg65\nVface_b_lid_3_MIRROR\np4929\nsg67\nI01\nsg68\nVpolygon\np4930\nsg70\n(lp4931\nF-77.451897575646598\naF-23.123020616544125\nasa(dp4932\ng29\nVdefault\np4933\nsg31\n(I146\nI141\nI115\nI180\ntp4934\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4935\nsg42\nNsg111\n(lp4936\nVr_brow\np4937\nasg45\nI40\nsg46\n(lp4938\n(lp4939\nF-43.010328343252283\naF9.8299630243943525\naa(lp4940\nF-44.593088195633229\naF6.9868398704994519\naa(lp4941\n"
		+ "F-45.442003426418623\naF0.91118815257767949\naa(lp4942\nF-4.8105485125979737\naF-12.937941171611635\naa(lp4943\nF34.898696918346765\naF0.062270420612421162\naa(lp4944\nF34.898699419526615\naF4.8838402635086169\naa(lp4945\nF33.373478623510401\naF8.5853559546288025\naa(lp4946\nF-5.2795296013089059\naF0.07803769310285702\naasg52\nVquadratic\np4947\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4948\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4949\nsg65\nVface_brow_MIRROR\np4950\nsg67\nI01\nsg68\nVpolygon\np4951\nsg70\n(lp4952\nF-59.208621324399445\naF-102.25125175406879\nasa(dp4953\ng29\nVdefault\np4954\nsg31\n(I119\nI126\nI126\nI180\ntp4955\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4956\nsg42\nNsg111\n(lp4957\nVr_brow_center\np4958\nasg45\nI40\nsg46\n(lp4959\n(lp4960\nF-12.253396116037294\naF10.526376258922804\naa(lp4961\nF-14.539936153135951\naF6.4733285049145763\naa(lp4962\nF-15.160445241130731\naF0.5517867291568308\naa(lp4963\nF-1.8910903150543259\naF-2.1511118861875715\naa(lp4964\nF13.564039218434161\naF-0.55667207677878139\naa(lp4965\nF13.166009377413573\naF5.1257309754110789\n"
		+ "aa(lp4966\nF11.48394445639947\naF9.8594756223456841\naa(lp4967\nF-0.71129619640478481\naF8.6625178766797326\naasg52\nVquadratic\np4968\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4969\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp4970\nsg65\nVface_brow_2_MIRROR\np4971\nsg67\nI01\nsg68\nVpolygon\np4972\nsg70\n(lp4973\nF-66.019516680708449\naF-124.44792468179207\nasa(dp4974\ng29\nVdefault\np4975\nsg31\n(I119\nI126\nI126\nI180\ntp4976\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4977\nsg42\nNsg111\n(lp4978\nVr_brow_in\np4979\nasg45\nI40\nsg46\n(lp4980\n(lp4981\nF-13.994429202358475\naF7.2619392220705823\naa(lp4982\nF-14.037957530696378\naF3.5264400450631825\naa(lp4983\nF-12.404011238235455\naF-2.8492821803770383\naa(lp4984\nF1.7377114452732965\naF-0.83228597769021206\naa(lp4985\nF5.8882726634989631\naF3.1839566491573059\naa(lp4986\nF6.9537655943626042\naF6.8032224108343495\naa(lp4987\nF6.5055486101406856\naF11.444836237091465\naa(lp4988\nF-0.92892533219493245\naF9.0977761482600279\naasg52\nVquadratic\np4989\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp4990\nV1\nNsV3\nNsV2\nNsV5\nNsV4\n"
		+ "Nssg63\n(lp4991\nsg65\nVface_brow_1_MIRROR\np4992\nsg67\nI01\nsg68\nVpolygon\np4993\nsg70\n(lp4994\nF-36.266398626232316\naF-121.34570918227649\nasa(dp4995\ng29\nVdefault\np4996\nsg31\n(I119\nI126\nI126\nI180\ntp4997\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp4998\nsg42\nNsg111\n(lp4999\nVr_brow_out\np5000\nasg45\nI40\nsg46\n(lp5001\n(lp5002\nF-9.0175949781768026\naF11.01890632848656\naa(lp5003\nF-10.327094406484431\naF5.9501604261852208\naa(lp5004\nF-9.4574164474691855\naF2.5359365648169714\naa(lp5005\nF-2.9408649983202562\naF-1.0231624924656728\naa(lp5006\nF5.7018969097191388\naF-3.0359271798110754\naa(lp5007\nF8.3973520395992125\naF1.1946598210535679\naa(lp5008\nF8.8036686693375259\naF7.1791998352837396\naa(lp5009\nF-0.93465251199328137\naF8.6625178766797326\naasg52\nVquadratic\np5010\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5011\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5012\nsg65\nVface_brow_3_MIRROR\np5013\nsg67\nI01\nsg68\nVpolygon\np5014\nsg70\n(lp5015\nF-91.621866167652527\naF-118.92037939555982\nasa(dp5016\ng29\nVdefault\np5017\nsg31\n(I119\nI126\nI126\nI180\ntp5018\nsg34\nI20\n"
		+ "sg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp5019\nsg42\nNsg111\n(lp5020\nVr_t_lid\np5021\nasg45\nI40\nsg46\n(lp5022\n(lp5023\nF-33.671305524369842\naF18.648359369713219\naa(lp5024\nF-35.134623944276157\naF20.404719478535927\naa(lp5025\nF-39.211662200491432\naF18.107161583783171\naa(lp5026\nF-37.296378158196667\naF15.110830581735424\naa(lp5027\nF-17.026455205259943\naF-13.243471453447761\naa(lp5028\nF15.405220007114622\naF-5.0236277549384276\naa(lp5029\nF27.455299261542024\naF10.404713380460278\naa(lp5030\nF30.810445674482892\naF14.32383725074121\naa(lp5031\nF25.428343965525404\naF18.648353709459556\naa(lp5032\nF22.837407068575452\naF15.698939590541578\naa(lp5033\nF5.6754872470526525\naF-0.67497735244930723\naa(lp5034\nF-20.134789989700984\naF1.9156246235245362\naasg52\nVcubic\np5035\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5036\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5037\nsg65\nVface_t_lid_MIRROR\np5038\nsg67\nI01\nsg68\nVpolygon\np5039\nsg70\n(lp5040\nF-56.249608539028557\naF-70.631053798596227\nasa(dp5041\ng29\nVdefault\np5042\nsg31\n(I119\nI126\nI126\nI180\ntp5043\nsg34\nI20\nsg35\n"
		+ "I01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp5044\nsg42\nNsg111\n(lp5045\nVr_b_lid\np5046\nasg45\nI40\nsg46\n(lp5047\n(lp5048\nF-37.726606840683473\naF-7.4214348065886924\naa(lp5049\nF-40.348582779536528\naF-10.589369153289692\naa(lp5050\nF-38.632333441018048\naF-15.204242085935928\naa(lp5051\nF-35.268727500039866\naF-12.407285493249905\naa(lp5052\nF-19.633434622890157\naF3.2673981915433856\naa(lp5053\nF6.1359598555406052\naF3.9559680168988969\naa(lp5054\nF23.412049057737406\naF-12.233845481744225\naa(lp5055\nF26.680582286931148\naF-14.10800920619705\naa(lp5056\nF28.295162934397041\naF-8.1889080080576448\naa(lp5057\nF25.805751635441862\naF-6.0408013039576289\naa(lp5058\nF6.2548160065260223\naF13.808241634385066\naa(lp5059\nF-22.452105027594492\naF10.315891635888477\naasg52\nVcubic\np5060\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5061\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5062\nsg65\nVface_b_lid_MIRROR\np5063\nsg67\nI01\nsg68\nVpolygon\np5064\nsg70\n(lp5065\nF-54.132546825012\naF-0.082470763354624665\nasa(dp5066\ng29\nVfk\np5067\nsg31\n(I47\nI50\nI50\nI180\ntp5068\nsg34\nI20\nsg35\nI01\nsg37\n"
		+ "I10\nsg44\nI01\nsg39\nNsg40\n(lp5069\nsg42\nNsg111\n(lp5070\nVr_look\np5071\naVeyes_r_look_fk\np5072\nasg45\nI40\nsg46\n(lp5073\n(lp5074\nF-14.142135623730951\naF14.142135623730951\naa(lp5075\nF-14.142135623730951\naF-14.142135623730949\naa(lp5076\nF14.142135623730949\naF-14.142135623730955\naa(lp5077\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5078\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5079\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5080\nsg65\nVface_eye_MIRROR\np5081\nsg67\nI01\nsg68\nVcircle\np5082\nsg70\n(lp5083\nF-59\naF-31\nasa(dp5084\ng29\nVfk\np5085\nsg31\n(I119\nI126\nI126\nI180\ntp5086\nsg34\nI20\nsg35\nI01\nsg37\nI8\nsg44\nI01\nsg39\nNsg40\n(lp5087\nsg42\nNsg111\n(lp5088\nVr_eyeball\np5089\nasg45\nI40\nsg46\n(lp5090\n(lp5091\nF-14.142135623730951\naF14.142135623730951\naa(lp5092\nF-14.142135623730951\naF-14.142135623730949\naa(lp5093\nF14.142135623730949\naF-14.142135623730955\naa(lp5094\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5095\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5096\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5097\nsg65\nVface_eyeball_MIRROR\n"
		+ "p5098\nsg67\nI01\nsg68\nVcircle\np5099\nsg70\n(lp5100\nF-120\naF-31\nasa(dp5101\ng29\nVfk\np5102\nsg31\n(I119\nI126\nI126\nI180\ntp5103\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp5104\nsg42\nNsg111\n(lp5105\nVeyes_r_ball\np5106\nasg45\nI40\nsg46\n(lp5107\n(lp5108\nF-14.142135623730951\naF14.142135623730951\naa(lp5109\nF-14.142135623730951\naF-14.142135623730949\naa(lp5110\nF14.142135623730949\naF-14.142135623730955\naa(lp5111\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5112\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5113\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5114\nsg65\nVface_eyeball_2_MIRROR\np5115\nsg67\nI01\nsg68\nVcircle\np5116\nsg70\n(lp5117\nF-138\naF-31\nasa(dp5118\ng29\nVdefault\np5119\nsg31\n(I119\nI126\nI126\nI180\ntp5120\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp5121\nsg42\nNsg111\n(lp5122\nVr_nostril\np5123\nasg45\nI40\nsg46\n(lp5124\n(lp5125\nF-4.1147266245381005\naF-3.0993990880453133\naa(lp5126\nF-2.4789572892539837\naF-11.183247582739021\naa(lp5127\nF8.5111089931664736\naF-12.493450044073683\naa(lp5128\nF8.1053920875220715\naF-7.5487592678950719\n"
		+ "aa(lp5129\nF6.1560191675643416\naF0.24542484706197243\naa(lp5130\nF-4.8723498427551784\naF1.493385375560635\naasg52\nVquadratic\np5131\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5132\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5133\nsg65\nVface_nostrill_MIRROR\np5134\nsg67\nI01\nsg68\nVpolygon\np5135\nsg70\n(lp5136\nF-21.354429570092478\naF41.556707087262666\nasa(dp5137\ng29\nVdefault\np5138\nsg31\n(I119\nI126\nI126\nI180\ntp5139\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp5140\nsg42\nNsg111\n(lp5141\nVr_mouthCorner\np5142\nasg45\nI40\nsg46\n(lp5143\n(lp5144\nF15.220199860624184\naF18.815699663531376\naa(lp5145\nF0.83140855527622293\naF13.874146813554884\naa(lp5146\nF1.6120805481441245\naF-5.1660469290767033\naa(lp5147\nF15.629547715954615\naF-8.5059541642451428\naa(lp5148\nF18.554883531048812\naF-8.955035219665735\naa(lp5149\nF20.773211669453307\naF-6.8224791586438691\naa(lp5150\nF20.696619436300828\naF-2.984038451749905\naa(lp5151\nF15.0497955777257\naF1.9045378091987821\naa(lp5152\nF15.144218351761552\naF9.344820650630993\naa(lp5153\nF20.013232188345107\naF12.911513469075921\n"
		+ "aa(lp5154\nF20.730036868912485\naF15.426354480599247\naa(lp5155\nF17.751723589146174\naF18.514608566669388\naasg52\nVcubic\np5156\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5157\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5158\nsg65\nVface_l_lip_MIRROR\np5159\nsg67\nI01\nsg68\nVpolygon\np5160\nsg70\n(lp5161\nF-77.446347210701731\naF77.386134673331782\nasa(dp5162\ng29\nVdefault\np5163\nsg31\n(I119\nI126\nI126\nI180\ntp5164\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp5165\nsg42\nNsg111\n(lp5166\nVr_whisker_1\np5167\nasg45\nI40\nsg46\n(lp5168\n(lp5169\nF-14.142135623730951\naF14.142135623730951\naa(lp5170\nF-14.142135623730951\naF-14.142135623730949\naa(lp5171\nF14.142135623730949\naF-14.142135623730955\naa(lp5172\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5173\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5174\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5175\nsg65\nVface_whisker_1_MIRROR\np5176\nsg67\nI01\nsg68\nVcircle\np5177\nsg70\n(lp5178\nF-140.71558977599037\naF44.32725039007255\nasa(dp5179\ng29\nVdefault\np5180\nsg31\n(I119\nI126\nI126\nI180\ntp5181\nsg34\nI20\nsg35\nI01\nsg37\n"
		+ "I6\nsg44\nI01\nsg39\nNsg40\n(lp5182\nsg42\nNsg111\n(lp5183\nVr_whisker_2\np5184\nasg45\nI40\nsg46\n(lp5185\n(lp5186\nF-14.142135623730951\naF14.142135623730951\naa(lp5187\nF-14.142135623730951\naF-14.142135623730949\naa(lp5188\nF14.142135623730949\naF-14.142135623730955\naa(lp5189\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5190\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5191\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5192\nsg65\nVface_whisker_2_MIRROR\np5193\nsg67\nI01\nsg68\nVcircle\np5194\nsg70\n(lp5195\nF-143.98114143745852\naF62.054530838042396\nasa(dp5196\ng29\nVdefault\np5197\nsg31\n(I119\nI126\nI126\nI180\ntp5198\nsg34\nI20\nsg35\nI01\nsg37\nI6\nsg44\nI01\nsg39\nNsg40\n(lp5199\nsg42\nNsg111\n(lp5200\nVr_whisker_3\np5201\nasg45\nI40\nsg46\n(lp5202\n(lp5203\nF-14.142135623730951\naF14.142135623730951\naa(lp5204\nF-14.142135623730951\naF-14.142135623730949\naa(lp5205\nF14.142135623730949\naF-14.142135623730955\naa(lp5206\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5207\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5208\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5209\n"
		+ "sg65\nVface_whisker_3_MIRROR\np5210\nsg67\nI01\nsg68\nVcircle\np5211\nsg70\n(lp5212\nF-138.38305287494174\naF79.315303905802523\nasa(dp5213\ng29\nVoffset\np5214\nsg31\n(I146\nI141\nI115\nI180\ntp5215\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI01\nsg39\nNsg40\n(lp5216\nsg42\nNsg111\n(lp5217\nVr_t_lip\np5218\nasg45\nI40\nsg46\n(lp5219\n(lp5220\nF-14.142135623730951\naF14.142135623730951\naa(lp5221\nF-14.142135623730951\naF-14.142135623730949\naa(lp5222\nF14.142135623730949\naF-14.142135623730955\naa(lp5223\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5224\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5225\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5226\nsg65\nVface_t_lipAdd_1_MIRROR\np5227\nsg67\nI01\nsg68\nVcircle\np5228\nsg70\n(lp5229\nF-19.984488614811724\naF65.803245215535824\nasa(dp5230\ng29\nVoffset\np5231\nsg31\n(I146\nI141\nI115\nI180\ntp5232\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI01\nsg39\nNsg40\n(lp5233\nsg42\nNsg111\n(lp5234\nVr_t_cornerLip\np5235\nasg45\nI40\nsg46\n(lp5236\n(lp5237\nF-14.142135623730951\naF14.142135623730951\naa(lp5238\nF-14.142135623730951\naF-14.142135623730949\naa(lp5239\nF14.142135623730949\n"
		+ "aF-14.142135623730955\naa(lp5240\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5241\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5242\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5243\nsg65\nVface_t_lipAdd_2_MIRROR\np5244\nsg67\nI01\nsg68\nVcircle\np5245\nsg70\n(lp5246\nF-38.225464798536571\naF72.859515830257322\nasa(dp5247\ng29\nVoffset\np5248\nsg31\n(I146\nI141\nI115\nI180\ntp5249\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI01\nsg39\nNsg40\n(lp5250\nsg42\nNsg111\n(lp5251\nVr_lip\np5252\nasg45\nI40\nsg46\n(lp5253\n(lp5254\nF-14.142135623730951\naF14.142135623730951\naa(lp5255\nF-14.142135623730951\naF-14.142135623730949\naa(lp5256\nF14.142135623730949\naF-14.142135623730955\naa(lp5257\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5258\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5259\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5260\nsg65\nVface_t_lipAdd_4_MIRROR\np5261\nsg67\nI01\nsg68\nVcircle\np5262\nsg70\n(lp5263\nF-51.319808487016807\naF82.439477899423039\nasa(dp5264\ng29\nVoffset\np5265\nsg31\n(I146\nI141\nI115\nI180\ntp5266\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI01\nsg39\nNsg40\n(lp5267\n"
		+ "sg42\nNsg111\n(lp5268\nVr_b_cornerLip\np5269\nasg45\nI40\nsg46\n(lp5270\n(lp5271\nF-14.142135623730951\naF14.142135623730951\naa(lp5272\nF-14.142135623730951\naF-14.142135623730949\naa(lp5273\nF14.142135623730949\naF-14.142135623730955\naa(lp5274\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5275\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5276\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5277\nsg65\nVface_b_lipAdd_2_MIRROR\np5278\nsg67\nI01\nsg68\nVcircle\np5279\nsg70\n(lp5280\nF-37.529074325046636\naF92.649856317925114\nasa(dp5281\ng29\nVoffset\np5282\nsg31\n(I146\nI141\nI115\nI180\ntp5283\nsg34\nI20\nsg35\nI01\nsg37\nI5\nsg44\nI01\nsg39\nNsg40\n(lp5284\nsg42\nNsg111\n(lp5285\nVr_b_lip\np5286\nasg45\nI40\nsg46\n(lp5287\n(lp5288\nF-14.142135623730951\naF14.142135623730951\naa(lp5289\nF-14.142135623730951\naF-14.142135623730949\naa(lp5290\nF14.142135623730949\naF-14.142135623730955\naa(lp5291\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5292\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5293\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5294\nsg65\nVface_b_lipAdd_1_MIRROR\np5295\n"
		+ "sg67\nI01\nsg68\nVcircle\np5296\nsg70\n(lp5297\nF-19.445350266711699\naF99.291560311049238\nasa(dp5298\ng29\nVik\np5299\nsg31\n(I47\nI50\nI50\nI180\ntp5300\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp5301\nsg42\nNsg111\n(lp5302\nVl_lookTarget\np5303\naVl_look_ik\np5304\nasg45\nI40\nsg46\n(lp5305\n(lp5306\nF14.142135623730951\naF14.142135623730951\naa(lp5307\nF14.142135623730951\naF-14.142135623730949\naa(lp5308\nF-14.142135623730949\naF-14.142135623730955\naa(lp5309\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5310\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5311\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5312\nsg65\nVface_eye_ik\np5313\nsg67\nI00\nsg68\nVcircle\np5314\nsg70\n(lp5315\nF59\naF-31\nasa(dp5316\ng29\nVik\np5317\nsg31\n(I47\nI50\nI50\nI180\ntp5318\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI01\nsg39\nNsg40\n(lp5319\nsg42\nNsg111\n(lp5320\nVr_lookTarget\np5321\naVr_look_ik\np5322\nasg45\nI40\nsg46\n(lp5323\n(lp5324\nF-14.142135623730951\naF14.142135623730951\naa(lp5325\nF-14.142135623730951\naF-14.142135623730949\naa(lp5326\nF14.142135623730949\naF-14.142135623730955\naa(lp5327\nF14.142135623730955\n"
		+ "aF14.142135623730947\naasg52\nVlinear\np5328\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5329\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5330\nsg65\nVface_eye_ik_MIRROR\np5331\nsg67\nI01\nsg68\nVcircle\np5332\nsg70\n(lp5333\nF-59\naF-31\nasa(dp5334\ng29\nVdefault\np5335\nsg31\n(I122\nI118\nI96\nI180\ntp5336\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp5337\nsg42\nNsg111\n(lp5338\nVheadSquash\np5339\nasg45\nI40\nsg46\n(lp5340\n(lp5341\nF14.142135623730951\naF14.142135623730951\naa(lp5342\nF14.142135623730951\naF-14.142135623730949\naa(lp5343\nF-14.142135623730949\naF-14.142135623730955\naa(lp5344\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5345\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5346\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5347\nsg65\nVface_headSquash\np5348\nsg67\nI00\nsg68\nVcircle\np5349\nsg70\n(lp5350\nF-0.32295168090282544\naF-175.3379433976516\nasa(dp5351\ng29\nVdefault\np5352\nsg31\n(I122\nI118\nI96\nI180\ntp5353\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp5354\nsg42\nNsg111\n(lp5355\nVmouth\np5356\nasg45\nI40\nsg46\n(lp5357\n(lp5358\nF14.142135623730951\n"
		+ "aF14.142135623730951\naa(lp5359\nF14.142135623730951\naF-14.142135623730949\naa(lp5360\nF-14.142135623730949\naF-14.142135623730955\naa(lp5361\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5362\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5363\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5364\nsg65\nVface_noseSquash\np5365\nsg67\nI00\nsg68\nVcircle\np5366\nsg70\n(lp5367\nF-111.32295168090283\naF139.6620566023484\nasa(dp5368\ng29\nVfk\np5369\nsg31\n(I146\nI141\nI115\nI180\ntp5370\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp5371\nsg42\nVimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000ans = self.namespace or \"\"\\u000acmds.select(ns+\"face_controlSet\")\\u000a\\u000aself.view.scene().update()\\u000a\np5372\nsg111\n(lp5373\nVeyes_look_fk\np5374\nasg45\nI0\nsg46\n(lp5375\n(lp5376\nF14.142135623730951\naF14.142135623730951\naa(lp5377\nF14.142135623730951\naF-14.142135623730949\naa(lp5378\nF-14.142135623730949\naF-14.142135623730955\naa(lp5379\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5380\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n"
		+ "(dp5381\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5382\nsg65\nVitem_19\np5383\nsg67\nI00\nsg68\nVrect\np5384\nsg70\n(lp5385\nF-0.27490669479149776\naF-31.950841339716789\nasa(dp5386\ng29\nVik\np5387\nsg31\n(I146\nI141\nI115\nI180\ntp5388\nsg34\nI0\nsg35\nI01\nsg37\nI40\nsg44\nI00\nsg39\nNsg40\n(lp5389\nsg42\nNsg111\n(lp5390\nVeyes_look_fk\np5391\nasg45\nI0\nsg46\n(lp5392\n(lp5393\nF14.142135623730951\naF14.142135623730951\naa(lp5394\nF14.142135623730951\naF-14.142135623730949\naa(lp5395\nF-14.142135623730949\naF-14.142135623730955\naa(lp5396\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5397\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5398\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5399\nsg65\nVitem_20\np5400\nsg67\nI00\nsg68\nVrect\np5401\nsg70\n(lp5402\nF0.25172928927525184\naF-35.242100498535237\nasa(dp5403\ng29\nVdefault\np5404\nsg31\n(I146\nI141\nI115\nI180\ntp5405\nsg34\nI12\nsg35\nI01\nsg37\nI20\nsg44\nI00\nsg39\nNsg40\n(lp5406\nsg42\nNsg111\n(lp5407\nVl_ear_3\np5408\nasg45\nI30\nsg46\n(lp5409\n(lp5410\nF-14.142135623730951\naF14.142135623730951\naa(lp5411\nF-14.142135623730951\naF-14.142135623730949\naa(lp5412\n"
		+ "F14.142135623730949\naF-14.142135623730955\naa(lp5413\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5414\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5415\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5416\nsg65\nVitem_122\np5417\nsg67\nI01\nsg68\nVrect\np5418\nsg70\n(lp5419\nF49.867309611577014\naF-202.53963298735434\nasa(dp5420\ng29\nVdefault\np5421\nsg31\n(I146\nI141\nI115\nI180\ntp5422\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp5423\nsg42\nNsg111\n(lp5424\nVl_ear_local_2\np5425\nasg45\nI40\nsg46\n(lp5426\n(lp5427\nF14.142135623730951\naF14.142135623730951\naa(lp5428\nF14.142135623730951\naF-14.142135623730949\naa(lp5429\nF-14.142135623730949\naF-14.142135623730955\naa(lp5430\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5431\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5432\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5433\nsg65\nVface_ear_5\np5434\nsg67\nI00\nsg68\nVcircle\np5435\nsg70\n(lp5436\nF23.150985146561766\naF-181.92172120716543\nasa(dp5437\ng29\nVdefault\np5438\nsg31\n(I146\nI141\nI115\nI180\ntp5439\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI00\nsg39\nNsg40\n(lp5440\n"
		+ "sg42\nNsg111\n(lp5441\nVl_ear_local_3\np5442\nasg45\nI40\nsg46\n(lp5443\n(lp5444\nF14.142135623730951\naF14.142135623730951\naa(lp5445\nF14.142135623730951\naF-14.142135623730949\naa(lp5446\nF-14.142135623730949\naF-14.142135623730955\naa(lp5447\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5448\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5449\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5450\nsg65\nVface_ear_6\np5451\nsg67\nI00\nsg68\nVcircle\np5452\nsg70\n(lp5453\nF23.150985146561766\naF-201.17028222199923\nasa(dp5454\ng29\nVdefault\np5455\nsg31\n(I146\nI141\nI115\nI180\ntp5456\nsg34\nI12\nsg35\nI01\nsg37\nI20\nsg44\nI01\nsg39\nNsg40\n(lp5457\nsg42\nNsg111\n(lp5458\nVr_ear_1\np5459\nasg45\nI30\nsg46\n(lp5460\n(lp5461\nF-14.142135623730951\naF14.142135623730951\naa(lp5462\nF-14.142135623730951\naF-14.142135623730949\naa(lp5463\nF14.142135623730949\naF-14.142135623730955\naa(lp5464\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5465\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5466\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5467\nsg65\nVface_ear_1_MIRROR\np5468\nsg67\nI01\nsg68\n"
		+ "Vrect\np5469\nsg70\n(lp5470\nF-50.146227777677808\naF-163.7321327562544\nasa(dp5471\ng29\nVdefault\np5472\nsg31\n(I146\nI141\nI115\nI180\ntp5473\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp5474\nsg42\nNsg111\n(lp5475\nVr_ear_local_4\np5476\nasg45\nI40\nsg46\n(lp5477\n(lp5478\nF-14.142135623730951\naF14.142135623730951\naa(lp5479\nF-14.142135623730951\naF-14.142135623730949\naa(lp5480\nF14.142135623730949\naF-14.142135623730955\naa(lp5481\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5482\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5483\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5484\nsg65\nVface_ear_3_MIRROR\np5485\nsg67\nI01\nsg68\nVcircle\np5486\nsg70\n(lp5487\nF-49.850602038105436\naF-222.31423662153725\nasa(dp5488\ng29\nVdefault\np5489\nsg31\n(I146\nI141\nI115\nI180\ntp5490\nsg34\nI12\nsg35\nI01\nsg37\nI20\nsg44\nI01\nsg39\nNsg40\n(lp5491\nsg42\nNsg111\n(lp5492\nVr_ear_2\np5493\nasg45\nI30\nsg46\n(lp5494\n(lp5495\nF14.142135623730951\naF14.142135623730951\naa(lp5496\nF14.142135623730951\naF-14.142135623730949\naa(lp5497\nF-14.142135623730949\naF-14.142135623730955\naa(lp5498\nF-14.142135623730955\n"
		+ "aF14.142135623730947\naasg52\nVlinear\np5499\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5500\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5501\nsg65\nVitem_121_MIRROR\np5502\nsg67\nI01\nsg68\nVrect\np5503\nsg70\n(lp5504\nF-49.867309611577014\naF-182.57572825245495\nasa(dp5505\ng29\nVdefault\np5506\nsg31\n(I146\nI141\nI115\nI180\ntp5507\nsg34\nI12\nsg35\nI01\nsg37\nI20\nsg44\nI01\nsg39\nNsg40\n(lp5508\nsg42\nNsg111\n(lp5509\nVr_ear_3\np5510\nasg45\nI30\nsg46\n(lp5511\n(lp5512\nF14.142135623730951\naF14.142135623730951\naa(lp5513\nF14.142135623730951\naF-14.142135623730949\naa(lp5514\nF-14.142135623730949\naF-14.142135623730955\naa(lp5515\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5516\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5517\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5518\nsg65\nVitem_122_MIRROR\np5519\nsg67\nI01\nsg68\nVrect\np5520\nsg70\n(lp5521\nF-49.867309611577014\naF-202.53963298735434\nasa(dp5522\ng29\nVdefault\np5523\nsg31\n(I146\nI141\nI115\nI180\ntp5524\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp5525\nsg42\nNsg111\n(lp5526\nVr_ear_local_2\np5527\nasg45\nI40\nsg46\n(lp5528\n"
		+ "(lp5529\nF-14.142135623730951\naF14.142135623730951\naa(lp5530\nF-14.142135623730951\naF-14.142135623730949\naa(lp5531\nF14.142135623730949\naF-14.142135623730955\naa(lp5532\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5533\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5534\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5535\nsg65\nVface_ear_5_MIRROR\np5536\nsg67\nI01\nsg68\nVcircle\np5537\nsg70\n(lp5538\nF-23.150985146561766\naF-181.92172120716543\nasa(dp5539\ng29\nVdefault\np5540\nsg31\n(I146\nI141\nI115\nI180\ntp5541\nsg34\nI20\nsg35\nI01\nsg37\nI7\nsg44\nI01\nsg39\nNsg40\n(lp5542\nsg42\nNsg111\n(lp5543\nVr_ear_local_3\np5544\nasg45\nI40\nsg46\n(lp5545\n(lp5546\nF-14.142135623730951\naF14.142135623730951\naa(lp5547\nF-14.142135623730951\naF-14.142135623730949\naa(lp5548\nF14.142135623730949\naF-14.142135623730955\naa(lp5549\nF14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5550\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5551\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5552\nsg65\nVface_ear_6_MIRROR\np5553\nsg67\nI01\nsg68\nVcircle\np5554\nsg70\n(lp5555\nF-23.150985146561766\n"
		+ "aF-201.17028222199923\nasa(dp5556\ng29\nVik\np5557\nsg31\n(I146\nI141\nI115\nI180\ntp5558\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp5559\nsg42\nNsg111\n(lp5560\nVt_head\np5561\nasg45\nI40\nsg46\n(lp5562\n(lp5563\nF21.52486120268884\naF-0.73944980495951995\naa(lp5564\nF14.142135623730951\naF-14.142135623730949\naa(lp5565\nF-14.142135623730949\naF-14.142135623730955\naa(lp5566\nF-21.326349278960866\naF-0.22629168672881761\naasg52\nVlinear\np5567\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5568\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5569\nsg65\nVitem_21\np5570\nsg67\nI00\nsg68\nVpolygon\np5571\nsg70\n(lp5572\nF133.69946629533428\naF129.55210061523991\nasa(dp5573\ng29\nVik\np5574\nsg31\n(I146\nI141\nI115\nI180\ntp5575\nsg34\nI20\nsg35\nI01\nsg37\nI10\nsg44\nI00\nsg39\nNsg40\n(lp5576\nsg42\nNsg111\n(lp5577\nVb_head\np5578\nasg45\nI40\nsg46\n(lp5579\n(lp5580\nF14.142135623730951\naF14.142135623730951\naa(lp5581\nF21.332291932070866\naF0.69630251107823149\naa(lp5582\nF-21.458448320980999\naF1.0606700946477581\naa(lp5583\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5584\nsg54\nI255\nsg55\n"
		+ "I01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\n(dp5585\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5586\nsg65\nVitem_22\np5587\nsg67\nI00\nsg68\nVpolygon\np5588\nsg70\n(lp5589\nF133.39017061466222\naF136.52727476908137\nasa(dp5590\ng29\nVik\np5591\nsg31\n(I146\nI141\nI115\nI180\ntp5592\nsg33\nS'BS'\np5593\nsg34\nI20\nsg35\nI01\nsg36\nI255\nsg37\nI40\nsg111\n(lp5594\nVbsButton\np5595\nasg38\nF-1\nsg39\nNsg40\n(lp5596\nsg42\nNsg44\nI00\nsg45\nI26\nsg46\n(lp5597\n(lp5598\nF14.142135623730951\naF14.142135623730951\naa(lp5599\nF14.142135623730951\naF-14.142135623730949\naa(lp5600\nF-14.142135623730949\naF-14.142135623730955\naa(lp5601\nF-14.142135623730955\naF14.142135623730947\naasg52\nVlinear\np5602\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg57\n(I30\nI30\nI30\nI255\ntp5603\nsg59\nNsg60\nI0\nsg61\n(dp5604\nV1\nNsV3\nNsV2\nNsV5\nNsV4\nNssg63\n(lp5605\nsg65\nVitem_23\np5606\nsg67\nI00\nsg68\nVrect\np5607\nsg70\n(lp5608\nF152\naF4\nasa(dp5609\ng29\ng4640\nsg31\n(I146\nI141\nI115\nI180\ntp5610\nsg34\nI9\nsg35\nI01\nsg37\nI21\nsg44\nI00\nsg39\nNsg40\ng4642\nsg42\nNsg111\n(lp5611\nVeyes_look_fk\np5612\nasg45\nI25\nsg46\n(lp5613\n(lp5614\nF14.142135623730951\naF14.142135623730951\naa(lp5615\n"
		+ "F14.142135623730951\naF-14.142135623730949\naa(lp5616\nF-14.142135623730949\naF-14.142135623730955\naa(lp5617\nF-14.142135623730955\naF14.142135623730947\naasg52\ng4650\nsg54\nI255\nsg55\nI01\nsg56\nF1\nsg59\nNsg60\nI0\nsg61\ng4651\nsg63\ng4652\nsg65\nVface_ear_4\np5618\nsg67\nI00\nsg68\ng4654\nsg70\n(lp5619\nF-0.32138880864785069\naF-31.837773442411724\nasasg3445\nI01\nsg3446\nS'C:\\\\Users\\\\Pavel\\\\Documents\\\\maya\\\\2020\\\\scripts\\\\rigStudio_picker\\\\picker/images/Banana/face_new.png'\np5620\nsg3448\nI00\nsg3449\nI0\nsg3450\nI0\nsg3451\nF0.40000000000000002\nsasVupdateSelection\np5621\nI00\nsVtabBar_visibility\np5622\nI01\nsVmoveLock\np5623\nI00\nsVautorun\np5624\nI01\nsVautorun_script\np5625\n"
		+ "Vimport maya.cmds as cmds\\u000aimport maya.mel as mel\\u000a\\u000aroot_name = self.get_root_name()\\u000ans = root_name.split(\"picker\")[0]\\u000a\\u000adef setState(part, item):\\u000a    global ns\\u000a    if cmds.objExists(ns+part+\"_control.fkIk\"):\\u000a        attr = ns+part+\"_control.fkIk\"\\u000a    else:\\u000a        attr = ns+part+\"_control.ikFk\"\\u000a    if cmds.getAttr(attr):\\u000a        item.text.set_text(\"IK\")\\u000a        item.set_color(QtGui.QColor(160, 170, 120, 255))\\u000a    else:\\u000a        item.text.set_text(\"FK\")\\u000a        item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000ageo = ns+\"geo\"\\u000adef getSmooth():\\u000a    global geo\\u000a    for o in cmds.listRelatives(geo, allDescendents=1):\\u000a        shapes = cmds.listRelatives(o, s=1) or []\\u000a        for s in shapes:\\u000a            if 'scaleCube' in s:\\u000a                continue\\u000a            if not cmds.getAttr(s+'.intermediateObject'):\\u000a                smooth = 3 in cmds.displaySmoothness( s, q=True, polygonObject=True )\\u000a                return (smooth)\\u000a\\u000a# cycle all items\\u000aviews = self.views[root_name]\\u000afor view in views:\\u000a    for item in view.items:\\u000a        if item.name == \"common_2_add_icon\":\\u000a            v = cmds.getAttr(ns+'character.offsetControls')\\u000a            if v: item.polygon.opacity = 255\\u000a            else: item.polygon.opacity = 100\\u000a        elif item.name == \"common_2_cloth_icon\":\\u000a            v = cmds.getAttr(ns+'character.clothControls')\\u000a            if v: item.polygon.opacity = 255\\u000a            else: item.polygon.opacity = 100\\u000a        elif item.name == \"common_2_face_icon\":\\u000a            if cmds.objExists(ns+'character.bodyControls'):\\u000a                v = cmds.getAttr(ns+'character.bodyControls')\\u000a            else:\\u000a                v = cmds.getAttr(ns+'character.controls')\\u000a            if v: item.polygon.opacity = 255\\u000a            else: item.polygon.opacity = 100\\u000a        elif item.name == \"common_2_face_face_icon\":\\u000a            if cmds.objExists(ns+'character.FaceControls'):\\u000a                v = cmds.getAttr(ns+'character.FaceControls')\\u000a            else:\\u000a                v = cmds.getAttr(ns+'character.faceControls')\\u000a            if v: item.polygon.opacity = 255\\u000a            else: item.polygon.opacity = 100\\u000a        elif item.name == \"common_2_face_plus_icon\":\\u000a            if cmds.objExists(ns+'character.addFaceControls'):\\u000a                v = cmds.getAttr(ns+'character.addFaceControls')\\u000a                if v: item.polygon.opacity = 255\\u000a                else: item.polygon.opacity = 100\\u000a\\u000a        elif item.name == \"common_2_ikFk_arm\":\\u000a            if cmds.objExists(ns+\"l_arm_control\"):\\u000a                setState(\"l_arm\", item)\\u000a            else:\\u000a                setState(\"l_f_leg\", item)\\u000a\\u000a        elif item.name == \"common_2_ikFk_arm_MIRROR\":\\u000a            if cmds.objExists(ns+\"l_arm_control\"):\\u000a                setState(\"r_arm\", item)\\u000a            else:\\u000a                setState(\"r_f_leg\", item)\\u000a\\u000a        elif item.name == \"common_2_ikFk_leg\":\\u000a            if cmds.objExists(ns+\"l_leg_control\"):\\u000a                setState(\"l_leg\", item)\\u000a            else:\\u000a                setState(\"l_b_leg\", item)\\u000a\\u000a        elif item.name == \"common_2_ikFk_leg_MIRROR\":\\u000a            if cmds.objExists(ns+\"r_leg_control\"):\\u000a                setState(\"r_leg\", item)\\u000a            else:\\u000a                setState(\"r_b_leg\", item)\\u000a\\u000a        elif item.name == \"common_2_item_smooth\" or item.name == \"common_2_face_smooth\":\\u000a            if cmds.objExists(ns+\"geo\"):\\u000a                if getSmooth():\\u000a                    item.text.set_text(\"3\")\\u000a                    item.set_color(QtGui.QColor(85, 170, 127, 255))\\u000a                else:\\u000a                    item.text.set_text(\"1\")\\u000a                    item.set_color(QtGui.QColor(100, 130, 150, 255))\\u000a\\u000a\\u000a\n"
		+ "p5626\nsVcurrent_layer\np5627\nVfk\np5628\ns.");
createNode materialInfo -n "pasted__pasted__materialInfo1";
	rename -uid "0E5F6F7E-467B-3272-D102-A890FA2E8434";
createNode multDoubleLinear -n "multDoubleLinear242";
	rename -uid "4AECCB3A-4CBF-2571-BE0A-58A21BE53F0F";
createNode multDoubleLinear -n "multDoubleLinear243";
	rename -uid "FAF202E4-4CDB-3CF3-8868-60862BC8BAE8";
createNode multDoubleLinear -n "multDoubleLinear244";
	rename -uid "8FDF12E3-43A8-3DB2-C0A3-86B25AE2D8DC";
createNode multDoubleLinear -n "multDoubleLinear245";
	rename -uid "4F08C7C1-4248-E058-1379-D090A250A077";
createNode multDoubleLinear -n "multDoubleLinear246";
	rename -uid "CF6BF25A-4602-DF1D-357C-468BA0F77A95";
createNode multDoubleLinear -n "multDoubleLinear247";
	rename -uid "2407FA9B-4363-E2CD-B09E-9EA862395425";
createNode multDoubleLinear -n "multDoubleLinear248";
	rename -uid "82893E86-42C0-3833-4574-EC885F12C495";
createNode multDoubleLinear -n "multDoubleLinear249";
	rename -uid "5FA1807F-4DD6-5B1A-030A-BF92443BB2A8";
createNode multDoubleLinear -n "multDoubleLinear250";
	rename -uid "EA9EC911-4E47-4584-1DC4-379D027CA80F";
createNode reverse -n "reverse42";
	rename -uid "98AF6E97-4278-E168-9BF7-38911E7AE44C";
createNode multDoubleLinear -n "multDoubleLinear251";
	rename -uid "E681891E-4F62-CE3E-6BEC-AAA09D0324E0";
createNode multDoubleLinear -n "multDoubleLinear264";
	rename -uid "606C3E7B-4F52-4045-7827-B18E1966A096";
createNode unitConversion -n "unitConversion495";
	rename -uid "EF17CF12-48FF-0BB9-5823-1494B6C65215";
	setAttr ".cf" -0.017;
createNode unitConversion -n "unitConversion496";
	rename -uid "E6A11FAC-4126-5E2A-95DF-29B45CF2A51E";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion504";
	rename -uid "D68BCC87-409D-ACBD-1D0E-F4894A0A9CF3";
	setAttr ".cf" -0.017;
createNode unitConversion -n "unitConversion505";
	rename -uid "A89DEAD2-4EB9-8AD8-65B3-489C71814344";
	setAttr ".cf" -0.017;
createNode unitConversion -n "unitConversion508";
	rename -uid "F546CB2C-46DB-6872-8774-2AA5D2F730DA";
	setAttr ".cf" -0.017;
createNode setRange -n "setRange178";
	rename -uid "485B2BD0-45F2-694F-B5FE-84A331D23A90";
	setAttr ".v" -type "float3" 0 0 -15 ;
	setAttr ".n" -type "float3" 30 50 20 ;
	setAttr ".on" -type "float3" -15 -65 -30 ;
	setAttr ".om" -type "float3" 0 0 -15 ;
createNode setRange -n "setRange180";
	rename -uid "E5D846C2-4691-9615-2F66-1BA2640DB705";
	setAttr ".n" -type "float3" 0 0 20 ;
	setAttr ".m" -type "float3" 30 40 0 ;
	setAttr ".on" -type "float3" 0 0 -30 ;
	setAttr ".om" -type "float3" 15 65 -15 ;
createNode unitConversion -n "unitConversion499";
	rename -uid "0E564E4A-4284-C2BC-A7A1-8B9A027556E9";
	setAttr ".cf" -0.017;
createNode blendMatrix -n "blendMatrix5";
	rename -uid "0FB69450-4E81-48DC-307B-DF993A1D50A6";
createNode multDoubleLinear -n "roll_negative_multDL";
	rename -uid "7B6EF987-4A34-7276-F613-3BA7C09B7124";
	setAttr ".i2" -1;
createNode multiplyDivide -n "roll_stage_bounds_a_multiplyDivide";
	rename -uid "804D530A-4401-473C-422E-CEB1BA6A7A49";
	setAttr ".i2" -type "float3" 0.5 1.5 2.5 ;
createNode multiplyDivide -n "roll_stage_bounds_b_multiplyDivide";
	rename -uid "3EB60145-4C10-C589-184D-388DED32A3FB";
	setAttr ".i2" -type "float3" 3.5 4 1 ;
createNode remapValue -n "roll_front_4_remapValue";
	rename -uid "324C83D5-452F-2D4E-6493-979919E928AA";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.125 3 0.16666667
		 0.25 3 0.25 0.375 3 0.33333334 0.5 3 0.41666666 0.6171875 3 0.5 0.71875 
		3 0.58333331 0.8046875 3 0.66666669 0.875 3 0.75 0.9296875 3 0.83333331
		 0.96875 3 0.91666669 0.9921875 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_front_3_remapValue";
	rename -uid "2BB62FAA-4ECB-41B7-5EF9-01950C94C655";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.013888889 3 0.16666667
		 0.055555556 3 0.25 0.125 3 0.33333334 0.22222222 3 0.41666666 0.34722221 
		3 0.5 0.5 3 0.58333331 0.65277779 3 0.66666669 0.77777779 3 0.75 0.875 
		3 0.83333331 0.94444442 3 0.91666669 0.9861111 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_front_2_remapValue";
	rename -uid "1824DFF9-4140-DC12-DAB6-70AA3D2A67FF";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.013888889 3 0.16666667
		 0.055555556 3 0.25 0.125 3 0.33333334 0.22222222 3 0.41666666 0.34722221 
		3 0.5 0.5 3 0.58333331 0.65277779 3 0.66666669 0.77777779 3 0.75 0.875 
		3 0.83333331 0.94444442 3 0.91666669 0.9861111 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_front_1_remapValue";
	rename -uid "94F8D434-45CF-B218-F7F1-A6AF98D1D26D";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.0078125 3 0.16666667
		 0.03125 3 0.25 0.0703125 3 0.33333334 0.125 3 0.41666666 0.1953125 3
		 0.5 0.28125 3 0.58333331 0.3828125 3 0.66666669 0.5 3 0.75 0.625 3 0.83333331
		 0.75 3 0.91666669 0.875 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_back_4_remapValue";
	rename -uid "5EF6E386-46FE-1291-2F72-5389BF94121D";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.125 3 0.16666667
		 0.25 3 0.25 0.375 3 0.33333334 0.5 3 0.41666666 0.6171875 3 0.5 0.71875 
		3 0.58333331 0.8046875 3 0.66666669 0.875 3 0.75 0.9296875 3 0.83333331
		 0.96875 3 0.91666669 0.9921875 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_back_3_remapValue";
	rename -uid "19F1CCB5-49F2-3E4C-E012-BA9F0B22D776";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.013888889 3 0.16666667
		 0.055555556 3 0.25 0.125 3 0.33333334 0.22222222 3 0.41666666 0.34722221 
		3 0.5 0.5 3 0.58333331 0.65277779 3 0.66666669 0.77777779 3 0.75 0.875 
		3 0.83333331 0.94444442 3 0.91666669 0.9861111 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_back_2_remapValue";
	rename -uid "8C43D4B5-49A1-855D-7D4F-7BB0B6F60694";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.013888889 3 0.16666667
		 0.055555556 3 0.25 0.125 3 0.33333334 0.22222222 3 0.41666666 0.34722221 
		3 0.5 0.5 3 0.58333331 0.65277779 3 0.66666669 0.77777779 3 0.75 0.875 
		3 0.83333331 0.94444442 3 0.91666669 0.9861111 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "roll_back_1_remapValue";
	rename -uid "1F6F9AEF-41CF-8E52-8D5C-03A58062B276";
	setAttr -s 13 ".vl[0:12]"  0 0 3 0.083333336 0.0078125 3 0.16666667
		 0.03125 3 0.25 0.0703125 3 0.33333334 0.125 3 0.41666666 0.1953125 3
		 0.5 0.28125 3 0.58333331 0.3828125 3 0.66666669 0.5 3 0.75 0.625 3 0.83333331
		 0.75 3 0.91666669 0.875 3 1 1 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode reverse -n "roll_holdFingers_reverse";
	rename -uid "6F0AF1C1-417A-0D11-8129-E1AB73D360C6";
createNode plusMinusAverage -n "roll_back_total_sum";
	rename -uid "E670453C-4C7B-761A-625F-ED84B72BF61C";
	setAttr -s 5 ".i1";
	setAttr -s 5 ".i1";
createNode multDoubleLinear -n "roll_back_rigid_free_multDL";
	rename -uid "BEE618AD-487D-28F9-16F3-FB9F135DE5E7";
createNode multDoubleLinear -n "roll_back_1_free_multDL";
	rename -uid "690B5DD8-49E1-6717-FC6E-15B3A7EABC57";
createNode multDoubleLinear -n "roll_back_2_free_multDL";
	rename -uid "568F9FC1-4C46-4746-1736-A798C4760A00";
createNode multDoubleLinear -n "roll_back_3_free_multDL";
	rename -uid "3C513C0C-4D37-CB65-267D-07A3DF849424";
createNode multDoubleLinear -n "roll_back_4_free_multDL";
	rename -uid "9E2A493C-4063-2E4D-6600-F880167DC9DE";
createNode multDoubleLinear -n "roll_back_5_hold_multDL";
	rename -uid "059E57E7-4727-29AA-AF5A-808805407E1A";
createNode plusMinusAverage -n "roll_front_total_sum";
	rename -uid "1D68EC15-4B95-8A94-B902-F3ADE07DBD5E";
	setAttr -s 5 ".i1";
	setAttr -s 5 ".i1";
createNode multDoubleLinear -n "roll_front_rigid_free_multDL";
	rename -uid "8F94DC8F-4549-C5D5-7DD1-F7A6FA0DAFE9";
createNode multDoubleLinear -n "roll_front_1_free_multDL";
	rename -uid "100DCCE4-486E-1E02-3C96-BA9BD5400443";
createNode multDoubleLinear -n "roll_front_2_free_multDL";
	rename -uid "78C963A2-4DBA-3A7D-733E-FC8418800153";
createNode multDoubleLinear -n "roll_front_3_free_multDL";
	rename -uid "3B66060C-4508-6E4D-FFB9-5CBFAEE9EBB6";
createNode multDoubleLinear -n "roll_front_4_free_multDL";
	rename -uid "1B6BBAA8-40F8-D90F-93F3-D4A09C01C9CD";
createNode multDoubleLinear -n "roll_front_5_hold_multDL";
	rename -uid "6D7590BF-45D1-0069-8F29-C7B30FD43B47";
createNode multMatrix -n "ik_backTip_group_multMat";
	rename -uid "63A73731-4597-6F22-DDBF-3EA29F38AB8B";
	setAttr -s 2 ".i";
createNode multMatrix -n "roll_back_rigid_multMat";
	rename -uid "181EFAAC-444B-F53A-FBD5-689D389C4042";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1964";
	rename -uid "E2988571-4F4E-642E-3A6B-B1906B0B6118";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1965";
	rename -uid "E5102BEC-425E-8166-922B-3DB9658E66CC";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_back_2_multMat";
	rename -uid "5BC08390-4B3B-4B4D-4F43-93B5670CBAD1";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1966";
	rename -uid "520C6A8F-40F9-FF87-BC98-29AFE342A5A2";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_back_3_multMat";
	rename -uid "720E4389-48B1-2509-293D-96A78D577B37";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1967";
	rename -uid "DA55874C-42E7-6511-C789-9E990A9209E8";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_back_4_multMat";
	rename -uid "47600EB1-47CA-D26A-A366-C1B862D66FA0";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1968";
	rename -uid "AD484169-481E-64D1-1813-4D8A23897686";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_back_5_multMat";
	rename -uid "7F3E37B1-472B-FE83-861C-F3BA75CB27A9";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1969";
	rename -uid "0EBB7024-4165-67C8-4A35-389F86FA13EB";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "ik_frontTip_group_multMat";
	rename -uid "E750C457-4F0C-D02D-A268-C593DA5A3BD7";
	setAttr -s 2 ".i";
createNode multMatrix -n "roll_front_rigid_multMat";
	rename -uid "B16A0929-46F4-42EE-C25B-6FB90F9FE5F3";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1970";
	rename -uid "F8AD0349-42A7-2EBE-BB4A-C39E8D19FEB9";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1971";
	rename -uid "B849EE2B-47EA-45B6-62C1-91A824C0391F";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_front_2_multMat";
	rename -uid "9C300944-4E46-A584-3F0E-918113BE5B9D";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1972";
	rename -uid "07372FA6-4506-C086-B87A-F1AD7B5F9843";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_front_3_multMat";
	rename -uid "E05B6366-4E0E-C9D6-DFF6-C992C5DC71EA";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1973";
	rename -uid "4F3C24D8-4AD6-E0E5-EFA9-69828A138B2B";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_front_4_multMat";
	rename -uid "BEFD60EC-4A6D-FA90-60D3-D49CC12972FB";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1974";
	rename -uid "420C4171-4BC3-B929-CD9B-C58FF032D2BF";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_front_5_multMat";
	rename -uid "7833762E-4F1C-C7F9-806E-0B83D0674B2B";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1975";
	rename -uid "BAA797BB-472B-A90C-7719-5C8F3532A5B9";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "roll_center_multMat";
	rename -uid "AE0E2CC2-4AA7-F898-D17E-FFB269F2F409";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_controls_multMat";
	rename -uid "C4BCF4BE-4F52-4EE5-094C-49A420BC52AA";
	setAttr -s 2 ".i";
createNode multMatrix -n "front_fingers_holdGroup_multMat";
	rename -uid "5BA553B2-4884-E3D7-A238-02B97E97D46A";
	setAttr -s 2 ".i";
createNode multMatrix -n "back_fingers_holdGroup_multMat";
	rename -uid "A3514273-49B9-EF24-6568-9894B123B392";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_0_group_multMat";
	rename -uid "E81638E6-447F-9759-57B2-AB8545451006";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_0_bendGroup_multMat";
	rename -uid "85D12A29-450D-5A44-2624-5992907C6E2D";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_1_group_multMat";
	rename -uid "17290554-4366-5F94-C192-328547562F8E";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_1_bendGroup_multMat";
	rename -uid "044F861E-4FFB-24D8-9664-38B7B34C0B04";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_2_group_multMat";
	rename -uid "53394331-44E1-A867-1C85-9BAAF3D68E9E";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_2_bendGroup_multMat";
	rename -uid "5917AAA5-456C-3F5A-AEDB-DA902A506077";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_3_group_multMat";
	rename -uid "A5AD0F4E-436B-5EC7-B10F-7E8EBF2BDC1D";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_3_bendGroup_multMat";
	rename -uid "4005BF84-4D58-D5C6-6C10-7B80ADCE4C9B";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_4_group_multMat";
	rename -uid "F16813E4-44C3-D5FF-7FD3-B4B4D42657F4";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_1_4_bendGroup_multMat";
	rename -uid "D58EE70B-4BD3-A73A-F054-AF9289C786CF";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_0_group_multMat";
	rename -uid "9650FF74-4D96-4F8E-5C34-3CA67E6B4AC2";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_0_bendGroup_multMat";
	rename -uid "71F07ED8-491B-0C0C-8952-788751FC5B29";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_1_group_multMat";
	rename -uid "8453BB9F-42F6-F555-271C-E0BFFFDDDFF6";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_1_bendGroup_multMat";
	rename -uid "7981600C-4775-F580-37A2-95992E9B0906";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_2_group_multMat";
	rename -uid "68C91AD8-4C88-186F-9CA2-D7BE382BADB8";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_2_bendGroup_multMat";
	rename -uid "033FDBCA-460D-4590-DDC5-99BE5B1550C3";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_3_group_multMat";
	rename -uid "6AF485E6-4D62-32A4-DAD9-59B946C2CF31";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_3_bendGroup_multMat";
	rename -uid "F73B283C-4863-F7C0-F49A-4E8EA3926094";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_4_group_multMat";
	rename -uid "A1A4B792-407B-2699-5CD3-BBB6BD4BA16A";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_2_4_bendGroup_multMat";
	rename -uid "A9F2CF32-453F-5BDC-A7C1-E2871E1CA820";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_0_group_multMat";
	rename -uid "979EE17F-4CED-5806-0878-73AEC089850B";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_0_bendGroup_multMat";
	rename -uid "1B653B64-4F31-6D2D-E4FD-9090959A69D1";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_1_group_multMat";
	rename -uid "956EA845-407B-9774-6A81-19A43BA8F321";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_1_bendGroup_multMat";
	rename -uid "78DA3A51-408A-72E2-3A20-26B845B46CB7";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_2_group_multMat";
	rename -uid "89FB725E-4A07-3937-FEFE-688BEF958868";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_2_bendGroup_multMat";
	rename -uid "46BDD264-4CD0-9D5C-B9E4-AAACDF5B6C11";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_3_group_multMat";
	rename -uid "9F8AF16D-44B4-C134-FAE5-4DA6915AA67D";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_3_bendGroup_multMat";
	rename -uid "0327A124-4068-6F94-D8C8-D3B50195E6C6";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_4_group_multMat";
	rename -uid "BC97D171-4CAD-B5EA-DDA5-73870CBB8270";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_3_4_bendGroup_multMat";
	rename -uid "68B7EA0B-4DA6-1260-98B2-E59C23A05B3A";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_0_group_multMat";
	rename -uid "C81430FF-489A-6D88-0B12-D39E22F5C40F";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_0_bendGroup_multMat";
	rename -uid "7AC6AEFD-4183-8A3E-417A-A081B0C36BEF";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_1_group_multMat";
	rename -uid "F7096F25-4F14-E58D-2525-798A431D4061";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_1_bendGroup_multMat";
	rename -uid "5501A282-43F0-042C-1610-5FA536B90946";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_2_group_multMat";
	rename -uid "D3CFAF86-47DC-0D11-23F7-FD92C597D88F";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_2_bendGroup_multMat";
	rename -uid "F134BA2B-419D-1FF5-B841-878D7A93BE2D";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_3_group_multMat";
	rename -uid "DA1AF90F-489D-FC4E-E1FD-848C316CEDB6";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_3_bendGroup_multMat";
	rename -uid "A74F6AB3-4495-DCC1-5E5D-B9A9CD306E14";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_4_group_multMat";
	rename -uid "4112D959-4142-3173-8BEF-6EAA121DB25D";
	setAttr -s 2 ".i";
createNode multMatrix -n "finger_4_4_bendGroup_multMat";
	rename -uid "67ADB407-4810-8BCB-D3E4-9CB8A2AE1680";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "root_outJoint_decMat";
	rename -uid "EDB1F633-407C-D121-985A-30A06949E15F";
createNode multMatrix -n "root_outJoint_multMat";
	rename -uid "1AA586DE-41A9-7557-7D09-77941DEE86A1";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "finger_1_0_outJoint_decMat";
	rename -uid "FA67F650-41BF-0191-E77A-0F87F6A222FE";
createNode multMatrix -n "finger_1_0_outJoint_multMat";
	rename -uid "B96F2B86-4B8A-1FC2-89DC-43BEAEA1C86B";
	setAttr -s 7 ".i";
createNode decomposeMatrix -n "finger_1_1_outJoint_decMat";
	rename -uid "13D5C965-43CB-BF2D-B058-E2A15FC4ADFD";
createNode multMatrix -n "finger_1_1_outJoint_multMat";
	rename -uid "A5BA8C4E-42FA-3A92-4B34-119F14C04593";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_1_2_outJoint_decMat";
	rename -uid "E83A6569-45D0-C08B-640A-73B347F60B6C";
createNode multMatrix -n "finger_1_2_outJoint_multMat";
	rename -uid "D4EE671D-4B46-FF83-2D06-13AD048A39FB";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_1_3_outJoint_decMat";
	rename -uid "FFEFB0AC-40CB-5C6D-2B89-778055D1C8D9";
createNode multMatrix -n "finger_1_3_outJoint_multMat";
	rename -uid "60018C9E-430E-562A-1755-3F8607D65E6F";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_1_4_outJoint_decMat";
	rename -uid "0DC80277-4FE1-1066-B60A-E3922D1FFC65";
createNode multMatrix -n "finger_1_4_outJoint_multMat";
	rename -uid "74DB47A3-4C19-5957-838C-56B676481DCB";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_2_0_outJoint_decMat";
	rename -uid "45C113E3-42CF-1C70-4481-4C89604A35F4";
createNode multMatrix -n "finger_2_0_outJoint_multMat";
	rename -uid "7A1455FD-4A5C-3095-1364-49B6ED437072";
	setAttr -s 7 ".i";
createNode decomposeMatrix -n "finger_2_1_outJoint_decMat";
	rename -uid "83983DD9-40C8-BF42-DFDD-87A748C71B8F";
createNode multMatrix -n "finger_2_1_outJoint_multMat";
	rename -uid "B7C790D2-4FEB-F93B-46BB-D5A9DAF09FAE";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_2_2_outJoint_decMat";
	rename -uid "74A53AF7-4CB3-1FEC-CE95-268B1CD126AC";
createNode multMatrix -n "finger_2_2_outJoint_multMat";
	rename -uid "A1D8563E-44A3-D176-2F0D-159FACAB8C59";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_2_3_outJoint_decMat";
	rename -uid "3E773E8D-4EA2-44C0-2EB6-BF846CED391A";
createNode multMatrix -n "finger_2_3_outJoint_multMat";
	rename -uid "5BE28D0D-4420-65EC-0CEA-C0AC86D4E5D3";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_2_4_outJoint_decMat";
	rename -uid "A4AAC015-41F9-C6E5-C9C8-8FBBE78D9B6A";
createNode multMatrix -n "finger_2_4_outJoint_multMat";
	rename -uid "01927373-4E70-6C21-65B8-43808EC45325";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_3_0_outJoint_decMat";
	rename -uid "0EA3A1A3-48A6-E44C-5D27-BAB28219160E";
createNode multMatrix -n "finger_3_0_outJoint_multMat";
	rename -uid "696C123B-449C-39BB-1A78-12BD468E0EFD";
	setAttr -s 7 ".i";
createNode decomposeMatrix -n "finger_3_1_outJoint_decMat";
	rename -uid "5B1716CD-43D6-EC8F-1DB3-40B8445E7C66";
createNode multMatrix -n "finger_3_1_outJoint_multMat";
	rename -uid "1A16C444-40B0-D49C-C5F8-7FB3E833F518";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_3_2_outJoint_decMat";
	rename -uid "32F07DCD-40E8-E72C-739E-8DB4C2E187F4";
createNode multMatrix -n "finger_3_2_outJoint_multMat";
	rename -uid "29DA858B-4A15-58E8-13E4-7D88541FEC42";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_3_3_outJoint_decMat";
	rename -uid "C3C724FB-4AD6-C7D1-00AB-48938399E030";
createNode multMatrix -n "finger_3_3_outJoint_multMat";
	rename -uid "95AEEB49-4694-5675-18F7-CCA6068207E6";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_3_4_outJoint_decMat";
	rename -uid "A6547440-4D77-4EC8-71DC-62AA9D22F593";
createNode multMatrix -n "finger_3_4_outJoint_multMat";
	rename -uid "CECE3F02-4B8E-6481-09DC-2FAE6B306475";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_4_0_outJoint_decMat";
	rename -uid "B5CF8600-4DD6-F01A-69F9-0DA09FBFC135";
createNode multMatrix -n "finger_4_0_outJoint_multMat";
	rename -uid "6452A366-4ABE-8E85-95ED-B68425BD610D";
	setAttr -s 7 ".i";
createNode decomposeMatrix -n "finger_4_1_outJoint_decMat";
	rename -uid "A964738F-4CC9-6E8F-211C-7FA9C1D5026F";
createNode multMatrix -n "finger_4_1_outJoint_multMat";
	rename -uid "C60DFBFB-4232-323B-F27C-24819A31F673";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_4_2_outJoint_decMat";
	rename -uid "1CEA16B8-49EC-58A4-4A6F-59A6CAC48C0B";
createNode multMatrix -n "finger_4_2_outJoint_multMat";
	rename -uid "BBB9826A-4D40-5D44-D98E-668F596BC8F5";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_4_3_outJoint_decMat";
	rename -uid "AA5F19F0-460C-044C-B31D-F28FF16BF35F";
createNode multMatrix -n "finger_4_3_outJoint_multMat";
	rename -uid "7A9EBD89-4A70-224F-5E61-468B7082C766";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "finger_4_4_outJoint_decMat";
	rename -uid "55324B98-4D92-D99A-135B-68989B45A7A2";
createNode multMatrix -n "finger_4_4_outJoint_multMat";
	rename -uid "CCFC9E54-40E6-6567-B899-83940174230A";
	setAttr -s 5 ".i";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "ABBFDCA6-4963-FE29-EF8F-EA88B0D7D545";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "fingers_moduleControlSet";
	rename -uid "8DA29237-4FB6-78A8-F65D-3C8017B73782";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
createNode objectSet -n "finger_1_moduleControlSet";
	rename -uid "120BC724-4374-F5D4-EC44-168E03EB75BA";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "finger_2_moduleControlSet";
	rename -uid "F5994B1F-4454-E3D3-16E9-7A90C710889E";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "finger_3_moduleControlSet";
	rename -uid "F93639EB-481C-C580-6C4C-71BE15CFDFED";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "finger_4_moduleControlSet";
	rename -uid "4E1C4454-4087-8664-F5FD-1599C3CEF8B8";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode shadingEngine -n "black_rsSG";
	rename -uid "E1D11256-4C12-FA15-91A4-75B5FABD7B99";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "3D2819EF-4E6F-1E58-C0DD-4890C4895797";
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
	setAttr -s 3 ".st";
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
	setAttr -s 19 ".u";
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
connectAttr "finger_2_0_poser.t" "root_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "finger_2_0_poser.rp" "root_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "finger_2_0_poser.rpt" "root_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "finger_2_0_poser.pm" "root_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "root_poserOrient_aimConstraint1.w0" "root_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "root_poserOrient_aimConstraint1.wum";
connectAttr "mirror_condition.ocr" "ik_foot_initLoc.sx";
connectAttr "roll_back_1_initLoc_pointConstraint1.ctx" "roll_back_1_initLoc.tx";
connectAttr "roll_back_1_initLoc_pointConstraint1.cty" "roll_back_1_initLoc.ty";
connectAttr "roll_back_1_initLoc_pointConstraint1.ctz" "roll_back_1_initLoc.tz";
connectAttr "roll_back_1_initLoc.pim" "roll_back_1_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_back_1_initLoc.rp" "roll_back_1_initLoc_pointConstraint1.crp";
connectAttr "roll_back_1_initLoc.rpt" "roll_back_1_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_4_4_iniLoc.t" "roll_back_1_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_4_iniLoc.rp" "roll_back_1_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_iniLoc.rpt" "roll_back_1_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_iniLoc.pm" "roll_back_1_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_back_1_initLoc_pointConstraint1.w0" "roll_back_1_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_front_1_initLoc_pointConstraint1.ctx" "roll_front_1_initLoc.tx"
		;
connectAttr "roll_front_1_initLoc_pointConstraint1.cty" "roll_front_1_initLoc.ty"
		;
connectAttr "roll_front_1_initLoc_pointConstraint1.ctz" "roll_front_1_initLoc.tz"
		;
connectAttr "roll_front_1_initLoc.pim" "roll_front_1_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_front_1_initLoc.rp" "roll_front_1_initLoc_pointConstraint1.crp"
		;
connectAttr "roll_front_1_initLoc.rpt" "roll_front_1_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_4_iniLoc.t" "roll_front_1_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_4_iniLoc.rp" "roll_front_1_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_4_iniLoc.rpt" "roll_front_1_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_iniLoc.pm" "roll_front_1_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_front_1_initLoc_pointConstraint1.w0" "roll_front_1_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_back_2_initLoc_pointConstraint1.ctx" "roll_back_2_initLoc.tx";
connectAttr "roll_back_2_initLoc_pointConstraint1.cty" "roll_back_2_initLoc.ty";
connectAttr "roll_back_2_initLoc_pointConstraint1.ctz" "roll_back_2_initLoc.tz";
connectAttr "roll_back_2_initLoc.pim" "roll_back_2_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_back_2_initLoc.rp" "roll_back_2_initLoc_pointConstraint1.crp";
connectAttr "roll_back_2_initLoc.rpt" "roll_back_2_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_4_3_iniLoc.t" "roll_back_2_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_3_iniLoc.rp" "roll_back_2_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_3_iniLoc.rpt" "roll_back_2_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_3_iniLoc.pm" "roll_back_2_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_back_2_initLoc_pointConstraint1.w0" "roll_back_2_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_front_2_initLoc_pointConstraint1.ctx" "roll_front_2_initLoc.tx"
		;
connectAttr "roll_front_2_initLoc_pointConstraint1.cty" "roll_front_2_initLoc.ty"
		;
connectAttr "roll_front_2_initLoc_pointConstraint1.ctz" "roll_front_2_initLoc.tz"
		;
connectAttr "roll_front_2_initLoc.pim" "roll_front_2_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_front_2_initLoc.rp" "roll_front_2_initLoc_pointConstraint1.crp"
		;
connectAttr "roll_front_2_initLoc.rpt" "roll_front_2_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_3_iniLoc.t" "roll_front_2_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_3_iniLoc.rp" "roll_front_2_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_3_iniLoc.rpt" "roll_front_2_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_3_iniLoc.pm" "roll_front_2_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_front_2_initLoc_pointConstraint1.w0" "roll_front_2_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_back_3_initLoc_pointConstraint1.ctx" "roll_back_3_initLoc.tx";
connectAttr "roll_back_3_initLoc_pointConstraint1.cty" "roll_back_3_initLoc.ty";
connectAttr "roll_back_3_initLoc_pointConstraint1.ctz" "roll_back_3_initLoc.tz";
connectAttr "roll_back_3_initLoc.pim" "roll_back_3_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_back_3_initLoc.rp" "roll_back_3_initLoc_pointConstraint1.crp";
connectAttr "roll_back_3_initLoc.rpt" "roll_back_3_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_4_2_iniLoc.t" "roll_back_3_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_2_iniLoc.rp" "roll_back_3_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_2_iniLoc.rpt" "roll_back_3_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_2_iniLoc.pm" "roll_back_3_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_back_3_initLoc_pointConstraint1.w0" "roll_back_3_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_front_3_initLoc_pointConstraint1.ctx" "roll_front_3_initLoc.tx"
		;
connectAttr "roll_front_3_initLoc_pointConstraint1.cty" "roll_front_3_initLoc.ty"
		;
connectAttr "roll_front_3_initLoc_pointConstraint1.ctz" "roll_front_3_initLoc.tz"
		;
connectAttr "roll_front_3_initLoc.pim" "roll_front_3_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_front_3_initLoc.rp" "roll_front_3_initLoc_pointConstraint1.crp"
		;
connectAttr "roll_front_3_initLoc.rpt" "roll_front_3_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_2_iniLoc.t" "roll_front_3_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_2_iniLoc.rp" "roll_front_3_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_2_iniLoc.rpt" "roll_front_3_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_2_iniLoc.pm" "roll_front_3_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_front_3_initLoc_pointConstraint1.w0" "roll_front_3_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_back_4_initLoc_pointConstraint1.ctx" "roll_back_4_initLoc.tx";
connectAttr "roll_back_4_initLoc_pointConstraint1.cty" "roll_back_4_initLoc.ty";
connectAttr "roll_back_4_initLoc_pointConstraint1.ctz" "roll_back_4_initLoc.tz";
connectAttr "roll_back_4_initLoc.pim" "roll_back_4_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_back_4_initLoc.rp" "roll_back_4_initLoc_pointConstraint1.crp";
connectAttr "roll_back_4_initLoc.rpt" "roll_back_4_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_4_1_iniLoc.t" "roll_back_4_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_1_iniLoc.rp" "roll_back_4_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_1_iniLoc.rpt" "roll_back_4_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_1_iniLoc.pm" "roll_back_4_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_back_4_initLoc_pointConstraint1.w0" "roll_back_4_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_front_4_initLoc_pointConstraint1.ctx" "roll_front_4_initLoc.tx"
		;
connectAttr "roll_front_4_initLoc_pointConstraint1.cty" "roll_front_4_initLoc.ty"
		;
connectAttr "roll_front_4_initLoc_pointConstraint1.ctz" "roll_front_4_initLoc.tz"
		;
connectAttr "roll_front_4_initLoc.pim" "roll_front_4_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_front_4_initLoc.rp" "roll_front_4_initLoc_pointConstraint1.crp"
		;
connectAttr "roll_front_4_initLoc.rpt" "roll_front_4_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_1_iniLoc.t" "roll_front_4_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_1_iniLoc.rp" "roll_front_4_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_1_iniLoc.rpt" "roll_front_4_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_1_iniLoc.pm" "roll_front_4_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_front_4_initLoc_pointConstraint1.w0" "roll_front_4_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_back_5_initLoc_pointConstraint1.ctx" "roll_back_5_initLoc.tx";
connectAttr "roll_back_5_initLoc_pointConstraint1.cty" "roll_back_5_initLoc.ty";
connectAttr "roll_back_5_initLoc_pointConstraint1.ctz" "roll_back_5_initLoc.tz";
connectAttr "roll_back_5_initLoc.pim" "roll_back_5_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_back_5_initLoc.rp" "roll_back_5_initLoc_pointConstraint1.crp";
connectAttr "roll_back_5_initLoc.rpt" "roll_back_5_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_4_0_iniLoc.t" "roll_back_5_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_0_iniLoc.rp" "roll_back_5_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_0_iniLoc.rpt" "roll_back_5_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_0_iniLoc.pm" "roll_back_5_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_back_5_initLoc_pointConstraint1.w0" "roll_back_5_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "roll_front_5_initLoc_pointConstraint1.ctx" "roll_front_5_initLoc.tx"
		;
connectAttr "roll_front_5_initLoc_pointConstraint1.cty" "roll_front_5_initLoc.ty"
		;
connectAttr "roll_front_5_initLoc_pointConstraint1.ctz" "roll_front_5_initLoc.tz"
		;
connectAttr "roll_front_5_initLoc.pim" "roll_front_5_initLoc_pointConstraint1.cpim"
		;
connectAttr "roll_front_5_initLoc.rp" "roll_front_5_initLoc_pointConstraint1.crp"
		;
connectAttr "roll_front_5_initLoc.rpt" "roll_front_5_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_0_iniLoc.t" "roll_front_5_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_0_iniLoc.rp" "roll_front_5_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_0_iniLoc.rpt" "roll_front_5_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_0_iniLoc.pm" "roll_front_5_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "roll_front_5_initLoc_pointConstraint1.w0" "roll_front_5_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_0_rollLoc_pointConstraint1.ctx" "finger_1_0_rollLoc.tx";
connectAttr "finger_1_0_rollLoc_pointConstraint1.cty" "finger_1_0_rollLoc.ty";
connectAttr "finger_1_0_rollLoc_pointConstraint1.ctz" "finger_1_0_rollLoc.tz";
connectAttr "finger_1_0_rollLoc.pim" "finger_1_0_rollLoc_pointConstraint1.cpim";
connectAttr "finger_1_0_rollLoc.rp" "finger_1_0_rollLoc_pointConstraint1.crp";
connectAttr "finger_1_0_rollLoc.rpt" "finger_1_0_rollLoc_pointConstraint1.crt";
connectAttr "finger_1_0_iniLoc.t" "finger_1_0_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_0_iniLoc.rp" "finger_1_0_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_0_iniLoc.rpt" "finger_1_0_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_0_iniLoc.pm" "finger_1_0_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_0_rollLoc_pointConstraint1.w0" "finger_1_0_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_0_pivotLoc_pointConstraint1.ctx" "finger_1_0_pivotLoc.tx";
connectAttr "finger_1_0_pivotLoc_pointConstraint1.cty" "finger_1_0_pivotLoc.ty";
connectAttr "finger_1_0_pivotLoc_pointConstraint1.ctz" "finger_1_0_pivotLoc.tz";
connectAttr "finger_1_0_pivotLoc.pim" "finger_1_0_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_1_0_pivotLoc.rp" "finger_1_0_pivotLoc_pointConstraint1.crp";
connectAttr "finger_1_0_pivotLoc.rpt" "finger_1_0_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_5_initLoc.t" "finger_1_0_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_5_initLoc.rp" "finger_1_0_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_5_initLoc.rpt" "finger_1_0_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_5_initLoc.pm" "finger_1_0_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_0_pivotLoc_pointConstraint1.w0" "finger_1_0_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_1_rollLoc_pointConstraint1.ctx" "finger_1_1_rollLoc.tx";
connectAttr "finger_1_1_rollLoc_pointConstraint1.cty" "finger_1_1_rollLoc.ty";
connectAttr "finger_1_1_rollLoc_pointConstraint1.ctz" "finger_1_1_rollLoc.tz";
connectAttr "finger_1_1_rollLoc.pim" "finger_1_1_rollLoc_pointConstraint1.cpim";
connectAttr "finger_1_1_rollLoc.rp" "finger_1_1_rollLoc_pointConstraint1.crp";
connectAttr "finger_1_1_rollLoc.rpt" "finger_1_1_rollLoc_pointConstraint1.crt";
connectAttr "finger_1_1_iniLoc.t" "finger_1_1_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_1_iniLoc.rp" "finger_1_1_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_1_iniLoc.rpt" "finger_1_1_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_1_iniLoc.pm" "finger_1_1_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_1_rollLoc_pointConstraint1.w0" "finger_1_1_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_1_pivotLoc_pointConstraint1.ctx" "finger_1_1_pivotLoc.tx";
connectAttr "finger_1_1_pivotLoc_pointConstraint1.cty" "finger_1_1_pivotLoc.ty";
connectAttr "finger_1_1_pivotLoc_pointConstraint1.ctz" "finger_1_1_pivotLoc.tz";
connectAttr "finger_1_1_pivotLoc.pim" "finger_1_1_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_1_1_pivotLoc.rp" "finger_1_1_pivotLoc_pointConstraint1.crp";
connectAttr "finger_1_1_pivotLoc.rpt" "finger_1_1_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_4_initLoc.t" "finger_1_1_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_4_initLoc.rp" "finger_1_1_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_4_initLoc.rpt" "finger_1_1_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_4_initLoc.pm" "finger_1_1_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_1_pivotLoc_pointConstraint1.w0" "finger_1_1_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_2_rollLoc_pointConstraint1.ctx" "finger_1_2_rollLoc.tx";
connectAttr "finger_1_2_rollLoc_pointConstraint1.cty" "finger_1_2_rollLoc.ty";
connectAttr "finger_1_2_rollLoc_pointConstraint1.ctz" "finger_1_2_rollLoc.tz";
connectAttr "finger_1_2_rollLoc.pim" "finger_1_2_rollLoc_pointConstraint1.cpim";
connectAttr "finger_1_2_rollLoc.rp" "finger_1_2_rollLoc_pointConstraint1.crp";
connectAttr "finger_1_2_rollLoc.rpt" "finger_1_2_rollLoc_pointConstraint1.crt";
connectAttr "finger_1_2_iniLoc.t" "finger_1_2_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_2_iniLoc.rp" "finger_1_2_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_2_iniLoc.rpt" "finger_1_2_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_2_iniLoc.pm" "finger_1_2_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_2_rollLoc_pointConstraint1.w0" "finger_1_2_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_2_pivotLoc_pointConstraint1.ctx" "finger_1_2_pivotLoc.tx";
connectAttr "finger_1_2_pivotLoc_pointConstraint1.cty" "finger_1_2_pivotLoc.ty";
connectAttr "finger_1_2_pivotLoc_pointConstraint1.ctz" "finger_1_2_pivotLoc.tz";
connectAttr "finger_1_2_pivotLoc.pim" "finger_1_2_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_1_2_pivotLoc.rp" "finger_1_2_pivotLoc_pointConstraint1.crp";
connectAttr "finger_1_2_pivotLoc.rpt" "finger_1_2_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_3_initLoc.t" "finger_1_2_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_3_initLoc.rp" "finger_1_2_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_3_initLoc.rpt" "finger_1_2_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_3_initLoc.pm" "finger_1_2_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_2_pivotLoc_pointConstraint1.w0" "finger_1_2_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_3_rollLoc_pointConstraint1.ctx" "finger_1_3_rollLoc.tx";
connectAttr "finger_1_3_rollLoc_pointConstraint1.cty" "finger_1_3_rollLoc.ty";
connectAttr "finger_1_3_rollLoc_pointConstraint1.ctz" "finger_1_3_rollLoc.tz";
connectAttr "finger_1_3_rollLoc.pim" "finger_1_3_rollLoc_pointConstraint1.cpim";
connectAttr "finger_1_3_rollLoc.rp" "finger_1_3_rollLoc_pointConstraint1.crp";
connectAttr "finger_1_3_rollLoc.rpt" "finger_1_3_rollLoc_pointConstraint1.crt";
connectAttr "finger_1_3_iniLoc.t" "finger_1_3_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_3_iniLoc.rp" "finger_1_3_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_3_iniLoc.rpt" "finger_1_3_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_3_iniLoc.pm" "finger_1_3_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_3_rollLoc_pointConstraint1.w0" "finger_1_3_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_3_pivotLoc_pointConstraint1.ctx" "finger_1_3_pivotLoc.tx";
connectAttr "finger_1_3_pivotLoc_pointConstraint1.cty" "finger_1_3_pivotLoc.ty";
connectAttr "finger_1_3_pivotLoc_pointConstraint1.ctz" "finger_1_3_pivotLoc.tz";
connectAttr "finger_1_3_pivotLoc.pim" "finger_1_3_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_1_3_pivotLoc.rp" "finger_1_3_pivotLoc_pointConstraint1.crp";
connectAttr "finger_1_3_pivotLoc.rpt" "finger_1_3_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_2_initLoc.t" "finger_1_3_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_2_initLoc.rp" "finger_1_3_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_2_initLoc.rpt" "finger_1_3_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_2_initLoc.pm" "finger_1_3_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_3_pivotLoc_pointConstraint1.w0" "finger_1_3_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_4_rollLoc_pointConstraint1.ctx" "finger_1_4_rollLoc.tx";
connectAttr "finger_1_4_rollLoc_pointConstraint1.cty" "finger_1_4_rollLoc.ty";
connectAttr "finger_1_4_rollLoc_pointConstraint1.ctz" "finger_1_4_rollLoc.tz";
connectAttr "finger_1_4_rollLoc.pim" "finger_1_4_rollLoc_pointConstraint1.cpim";
connectAttr "finger_1_4_rollLoc.rp" "finger_1_4_rollLoc_pointConstraint1.crp";
connectAttr "finger_1_4_rollLoc.rpt" "finger_1_4_rollLoc_pointConstraint1.crt";
connectAttr "finger_1_4_iniLoc.t" "finger_1_4_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_1_4_iniLoc.rp" "finger_1_4_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_1_4_iniLoc.rpt" "finger_1_4_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_1_4_iniLoc.pm" "finger_1_4_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_4_rollLoc_pointConstraint1.w0" "finger_1_4_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_1_4_pivotLoc_pointConstraint1.ctx" "finger_1_4_pivotLoc.tx";
connectAttr "finger_1_4_pivotLoc_pointConstraint1.cty" "finger_1_4_pivotLoc.ty";
connectAttr "finger_1_4_pivotLoc_pointConstraint1.ctz" "finger_1_4_pivotLoc.tz";
connectAttr "finger_1_4_pivotLoc.pim" "finger_1_4_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_1_4_pivotLoc.rp" "finger_1_4_pivotLoc_pointConstraint1.crp";
connectAttr "finger_1_4_pivotLoc.rpt" "finger_1_4_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_1_initLoc.t" "finger_1_4_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_1_initLoc.rp" "finger_1_4_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_1_initLoc.rpt" "finger_1_4_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_1_initLoc.pm" "finger_1_4_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_1_4_pivotLoc_pointConstraint1.w0" "finger_1_4_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_0_rollLoc_pointConstraint1.ctx" "finger_2_0_rollLoc.tx";
connectAttr "finger_2_0_rollLoc_pointConstraint1.cty" "finger_2_0_rollLoc.ty";
connectAttr "finger_2_0_rollLoc_pointConstraint1.ctz" "finger_2_0_rollLoc.tz";
connectAttr "finger_2_0_rollLoc.pim" "finger_2_0_rollLoc_pointConstraint1.cpim";
connectAttr "finger_2_0_rollLoc.rp" "finger_2_0_rollLoc_pointConstraint1.crp";
connectAttr "finger_2_0_rollLoc.rpt" "finger_2_0_rollLoc_pointConstraint1.crt";
connectAttr "finger_2_0_iniLoc.t" "finger_2_0_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_0_iniLoc.rp" "finger_2_0_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_0_iniLoc.rpt" "finger_2_0_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_0_iniLoc.pm" "finger_2_0_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_0_rollLoc_pointConstraint1.w0" "finger_2_0_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_1_rollLoc_pointConstraint1.ctx" "finger_2_1_rollLoc.tx";
connectAttr "finger_2_1_rollLoc_pointConstraint1.cty" "finger_2_1_rollLoc.ty";
connectAttr "finger_2_1_rollLoc_pointConstraint1.ctz" "finger_2_1_rollLoc.tz";
connectAttr "finger_2_1_rollLoc.pim" "finger_2_1_rollLoc_pointConstraint1.cpim";
connectAttr "finger_2_1_rollLoc.rp" "finger_2_1_rollLoc_pointConstraint1.crp";
connectAttr "finger_2_1_rollLoc.rpt" "finger_2_1_rollLoc_pointConstraint1.crt";
connectAttr "finger_2_1_iniLoc.t" "finger_2_1_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_1_iniLoc.rp" "finger_2_1_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_1_iniLoc.rpt" "finger_2_1_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_1_iniLoc.pm" "finger_2_1_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_1_rollLoc_pointConstraint1.w0" "finger_2_1_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_2_rollLoc_pointConstraint1.ctx" "finger_2_2_rollLoc.tx";
connectAttr "finger_2_2_rollLoc_pointConstraint1.cty" "finger_2_2_rollLoc.ty";
connectAttr "finger_2_2_rollLoc_pointConstraint1.ctz" "finger_2_2_rollLoc.tz";
connectAttr "finger_2_2_rollLoc.pim" "finger_2_2_rollLoc_pointConstraint1.cpim";
connectAttr "finger_2_2_rollLoc.rp" "finger_2_2_rollLoc_pointConstraint1.crp";
connectAttr "finger_2_2_rollLoc.rpt" "finger_2_2_rollLoc_pointConstraint1.crt";
connectAttr "finger_2_2_iniLoc.t" "finger_2_2_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_2_iniLoc.rp" "finger_2_2_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_2_iniLoc.rpt" "finger_2_2_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_2_iniLoc.pm" "finger_2_2_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_2_rollLoc_pointConstraint1.w0" "finger_2_2_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_3_rollLoc_pointConstraint1.ctx" "finger_2_3_rollLoc.tx";
connectAttr "finger_2_3_rollLoc_pointConstraint1.cty" "finger_2_3_rollLoc.ty";
connectAttr "finger_2_3_rollLoc_pointConstraint1.ctz" "finger_2_3_rollLoc.tz";
connectAttr "finger_2_3_rollLoc.pim" "finger_2_3_rollLoc_pointConstraint1.cpim";
connectAttr "finger_2_3_rollLoc.rp" "finger_2_3_rollLoc_pointConstraint1.crp";
connectAttr "finger_2_3_rollLoc.rpt" "finger_2_3_rollLoc_pointConstraint1.crt";
connectAttr "finger_2_3_iniLoc.t" "finger_2_3_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_3_iniLoc.rp" "finger_2_3_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_3_iniLoc.rpt" "finger_2_3_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_3_iniLoc.pm" "finger_2_3_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_3_rollLoc_pointConstraint1.w0" "finger_2_3_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_2_4_rollLoc_pointConstraint1.ctx" "finger_2_4_rollLoc.tx";
connectAttr "finger_2_4_rollLoc_pointConstraint1.cty" "finger_2_4_rollLoc.ty";
connectAttr "finger_2_4_rollLoc_pointConstraint1.ctz" "finger_2_4_rollLoc.tz";
connectAttr "finger_2_4_rollLoc.pim" "finger_2_4_rollLoc_pointConstraint1.cpim";
connectAttr "finger_2_4_rollLoc.rp" "finger_2_4_rollLoc_pointConstraint1.crp";
connectAttr "finger_2_4_rollLoc.rpt" "finger_2_4_rollLoc_pointConstraint1.crt";
connectAttr "finger_2_4_iniLoc.t" "finger_2_4_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_4_iniLoc.rp" "finger_2_4_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_4_iniLoc.rpt" "finger_2_4_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_iniLoc.pm" "finger_2_4_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_2_4_rollLoc_pointConstraint1.w0" "finger_2_4_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_0_rollLoc_pointConstraint1.ctx" "finger_3_0_rollLoc.tx";
connectAttr "finger_3_0_rollLoc_pointConstraint1.cty" "finger_3_0_rollLoc.ty";
connectAttr "finger_3_0_rollLoc_pointConstraint1.ctz" "finger_3_0_rollLoc.tz";
connectAttr "finger_3_0_rollLoc.pim" "finger_3_0_rollLoc_pointConstraint1.cpim";
connectAttr "finger_3_0_rollLoc.rp" "finger_3_0_rollLoc_pointConstraint1.crp";
connectAttr "finger_3_0_rollLoc.rpt" "finger_3_0_rollLoc_pointConstraint1.crt";
connectAttr "finger_3_0_iniLoc.t" "finger_3_0_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_0_iniLoc.rp" "finger_3_0_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_0_iniLoc.rpt" "finger_3_0_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_0_iniLoc.pm" "finger_3_0_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_0_rollLoc_pointConstraint1.w0" "finger_3_0_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_0_pivotLoc_pointConstraint1.ctx" "finger_3_0_pivotLoc.tx";
connectAttr "finger_3_0_pivotLoc_pointConstraint1.cty" "finger_3_0_pivotLoc.ty";
connectAttr "finger_3_0_pivotLoc_pointConstraint1.ctz" "finger_3_0_pivotLoc.tz";
connectAttr "finger_3_0_pivotLoc.pim" "finger_3_0_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_3_0_pivotLoc.rp" "finger_3_0_pivotLoc_pointConstraint1.crp";
connectAttr "finger_3_0_pivotLoc.rpt" "finger_3_0_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_5_initLoc.t" "finger_3_0_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_5_initLoc.rp" "finger_3_0_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_5_initLoc.rpt" "finger_3_0_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_5_initLoc.pm" "finger_3_0_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_0_pivotLoc_pointConstraint1.w0" "finger_3_0_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_1_rollLoc_pointConstraint1.ctx" "finger_3_1_rollLoc.tx";
connectAttr "finger_3_1_rollLoc_pointConstraint1.cty" "finger_3_1_rollLoc.ty";
connectAttr "finger_3_1_rollLoc_pointConstraint1.ctz" "finger_3_1_rollLoc.tz";
connectAttr "finger_3_1_rollLoc.pim" "finger_3_1_rollLoc_pointConstraint1.cpim";
connectAttr "finger_3_1_rollLoc.rp" "finger_3_1_rollLoc_pointConstraint1.crp";
connectAttr "finger_3_1_rollLoc.rpt" "finger_3_1_rollLoc_pointConstraint1.crt";
connectAttr "finger_3_1_iniLoc.t" "finger_3_1_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_1_iniLoc.rp" "finger_3_1_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_1_iniLoc.rpt" "finger_3_1_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_1_iniLoc.pm" "finger_3_1_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_1_rollLoc_pointConstraint1.w0" "finger_3_1_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_1_pivotLoc_pointConstraint1.ctx" "finger_3_1_pivotLoc.tx";
connectAttr "finger_3_1_pivotLoc_pointConstraint1.cty" "finger_3_1_pivotLoc.ty";
connectAttr "finger_3_1_pivotLoc_pointConstraint1.ctz" "finger_3_1_pivotLoc.tz";
connectAttr "finger_3_1_pivotLoc.pim" "finger_3_1_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_3_1_pivotLoc.rp" "finger_3_1_pivotLoc_pointConstraint1.crp";
connectAttr "finger_3_1_pivotLoc.rpt" "finger_3_1_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_4_initLoc.t" "finger_3_1_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_4_initLoc.rp" "finger_3_1_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_4_initLoc.rpt" "finger_3_1_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_4_initLoc.pm" "finger_3_1_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_1_pivotLoc_pointConstraint1.w0" "finger_3_1_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_2_rollLoc_pointConstraint1.ctx" "finger_3_2_rollLoc.tx";
connectAttr "finger_3_2_rollLoc_pointConstraint1.cty" "finger_3_2_rollLoc.ty";
connectAttr "finger_3_2_rollLoc_pointConstraint1.ctz" "finger_3_2_rollLoc.tz";
connectAttr "finger_3_2_rollLoc.pim" "finger_3_2_rollLoc_pointConstraint1.cpim";
connectAttr "finger_3_2_rollLoc.rp" "finger_3_2_rollLoc_pointConstraint1.crp";
connectAttr "finger_3_2_rollLoc.rpt" "finger_3_2_rollLoc_pointConstraint1.crt";
connectAttr "finger_3_2_iniLoc.t" "finger_3_2_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_2_iniLoc.rp" "finger_3_2_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_2_iniLoc.rpt" "finger_3_2_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_2_iniLoc.pm" "finger_3_2_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_2_rollLoc_pointConstraint1.w0" "finger_3_2_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_2_pivotLoc_pointConstraint1.ctx" "finger_3_2_pivotLoc.tx";
connectAttr "finger_3_2_pivotLoc_pointConstraint1.cty" "finger_3_2_pivotLoc.ty";
connectAttr "finger_3_2_pivotLoc_pointConstraint1.ctz" "finger_3_2_pivotLoc.tz";
connectAttr "finger_3_2_pivotLoc.pim" "finger_3_2_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_3_2_pivotLoc.rp" "finger_3_2_pivotLoc_pointConstraint1.crp";
connectAttr "finger_3_2_pivotLoc.rpt" "finger_3_2_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_3_initLoc.t" "finger_3_2_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_3_initLoc.rp" "finger_3_2_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_3_initLoc.rpt" "finger_3_2_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_3_initLoc.pm" "finger_3_2_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_2_pivotLoc_pointConstraint1.w0" "finger_3_2_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_3_rollLoc_pointConstraint1.ctx" "finger_3_3_rollLoc.tx";
connectAttr "finger_3_3_rollLoc_pointConstraint1.cty" "finger_3_3_rollLoc.ty";
connectAttr "finger_3_3_rollLoc_pointConstraint1.ctz" "finger_3_3_rollLoc.tz";
connectAttr "finger_3_3_rollLoc.pim" "finger_3_3_rollLoc_pointConstraint1.cpim";
connectAttr "finger_3_3_rollLoc.rp" "finger_3_3_rollLoc_pointConstraint1.crp";
connectAttr "finger_3_3_rollLoc.rpt" "finger_3_3_rollLoc_pointConstraint1.crt";
connectAttr "finger_3_3_iniLoc.t" "finger_3_3_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_3_iniLoc.rp" "finger_3_3_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_3_iniLoc.rpt" "finger_3_3_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_3_iniLoc.pm" "finger_3_3_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_3_rollLoc_pointConstraint1.w0" "finger_3_3_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_3_pivotLoc_pointConstraint1.ctx" "finger_3_3_pivotLoc.tx";
connectAttr "finger_3_3_pivotLoc_pointConstraint1.cty" "finger_3_3_pivotLoc.ty";
connectAttr "finger_3_3_pivotLoc_pointConstraint1.ctz" "finger_3_3_pivotLoc.tz";
connectAttr "finger_3_3_pivotLoc.pim" "finger_3_3_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_3_3_pivotLoc.rp" "finger_3_3_pivotLoc_pointConstraint1.crp";
connectAttr "finger_3_3_pivotLoc.rpt" "finger_3_3_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_2_initLoc.t" "finger_3_3_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_2_initLoc.rp" "finger_3_3_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_2_initLoc.rpt" "finger_3_3_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_2_initLoc.pm" "finger_3_3_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_3_pivotLoc_pointConstraint1.w0" "finger_3_3_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_4_rollLoc_pointConstraint1.ctx" "finger_3_4_rollLoc.tx";
connectAttr "finger_3_4_rollLoc_pointConstraint1.cty" "finger_3_4_rollLoc.ty";
connectAttr "finger_3_4_rollLoc_pointConstraint1.ctz" "finger_3_4_rollLoc.tz";
connectAttr "finger_3_4_rollLoc.pim" "finger_3_4_rollLoc_pointConstraint1.cpim";
connectAttr "finger_3_4_rollLoc.rp" "finger_3_4_rollLoc_pointConstraint1.crp";
connectAttr "finger_3_4_rollLoc.rpt" "finger_3_4_rollLoc_pointConstraint1.crt";
connectAttr "finger_3_4_iniLoc.t" "finger_3_4_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_3_4_iniLoc.rp" "finger_3_4_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_3_4_iniLoc.rpt" "finger_3_4_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_3_4_iniLoc.pm" "finger_3_4_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_4_rollLoc_pointConstraint1.w0" "finger_3_4_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_3_4_pivotLoc_pointConstraint1.ctx" "finger_3_4_pivotLoc.tx";
connectAttr "finger_3_4_pivotLoc_pointConstraint1.cty" "finger_3_4_pivotLoc.ty";
connectAttr "finger_3_4_pivotLoc_pointConstraint1.ctz" "finger_3_4_pivotLoc.tz";
connectAttr "finger_3_4_pivotLoc.pim" "finger_3_4_pivotLoc_pointConstraint1.cpim"
		;
connectAttr "finger_3_4_pivotLoc.rp" "finger_3_4_pivotLoc_pointConstraint1.crp";
connectAttr "finger_3_4_pivotLoc.rpt" "finger_3_4_pivotLoc_pointConstraint1.crt"
		;
connectAttr "roll_front_1_initLoc.t" "finger_3_4_pivotLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "roll_front_1_initLoc.rp" "finger_3_4_pivotLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "roll_front_1_initLoc.rpt" "finger_3_4_pivotLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "roll_front_1_initLoc.pm" "finger_3_4_pivotLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_3_4_pivotLoc_pointConstraint1.w0" "finger_3_4_pivotLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_0_rollLoc_pointConstraint1.ctx" "finger_4_0_rollLoc.tx";
connectAttr "finger_4_0_rollLoc_pointConstraint1.cty" "finger_4_0_rollLoc.ty";
connectAttr "finger_4_0_rollLoc_pointConstraint1.ctz" "finger_4_0_rollLoc.tz";
connectAttr "finger_4_0_rollLoc.pim" "finger_4_0_rollLoc_pointConstraint1.cpim";
connectAttr "finger_4_0_rollLoc.rp" "finger_4_0_rollLoc_pointConstraint1.crp";
connectAttr "finger_4_0_rollLoc.rpt" "finger_4_0_rollLoc_pointConstraint1.crt";
connectAttr "finger_4_0_iniLoc.t" "finger_4_0_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_0_iniLoc.rp" "finger_4_0_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_0_iniLoc.rpt" "finger_4_0_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_0_iniLoc.pm" "finger_4_0_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_0_rollLoc_pointConstraint1.w0" "finger_4_0_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_1_rollLoc_pointConstraint1.ctx" "finger_4_1_rollLoc.tx";
connectAttr "finger_4_1_rollLoc_pointConstraint1.cty" "finger_4_1_rollLoc.ty";
connectAttr "finger_4_1_rollLoc_pointConstraint1.ctz" "finger_4_1_rollLoc.tz";
connectAttr "finger_4_1_rollLoc.pim" "finger_4_1_rollLoc_pointConstraint1.cpim";
connectAttr "finger_4_1_rollLoc.rp" "finger_4_1_rollLoc_pointConstraint1.crp";
connectAttr "finger_4_1_rollLoc.rpt" "finger_4_1_rollLoc_pointConstraint1.crt";
connectAttr "finger_4_1_iniLoc.t" "finger_4_1_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_1_iniLoc.rp" "finger_4_1_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_1_iniLoc.rpt" "finger_4_1_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_1_iniLoc.pm" "finger_4_1_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_1_rollLoc_pointConstraint1.w0" "finger_4_1_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_2_rollLoc_pointConstraint1.ctx" "finger_4_2_rollLoc.tx";
connectAttr "finger_4_2_rollLoc_pointConstraint1.cty" "finger_4_2_rollLoc.ty";
connectAttr "finger_4_2_rollLoc_pointConstraint1.ctz" "finger_4_2_rollLoc.tz";
connectAttr "finger_4_2_rollLoc.pim" "finger_4_2_rollLoc_pointConstraint1.cpim";
connectAttr "finger_4_2_rollLoc.rp" "finger_4_2_rollLoc_pointConstraint1.crp";
connectAttr "finger_4_2_rollLoc.rpt" "finger_4_2_rollLoc_pointConstraint1.crt";
connectAttr "finger_4_2_iniLoc.t" "finger_4_2_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_2_iniLoc.rp" "finger_4_2_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_2_iniLoc.rpt" "finger_4_2_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_2_iniLoc.pm" "finger_4_2_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_2_rollLoc_pointConstraint1.w0" "finger_4_2_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_3_rollLoc_pointConstraint1.ctx" "finger_4_3_rollLoc.tx";
connectAttr "finger_4_3_rollLoc_pointConstraint1.cty" "finger_4_3_rollLoc.ty";
connectAttr "finger_4_3_rollLoc_pointConstraint1.ctz" "finger_4_3_rollLoc.tz";
connectAttr "finger_4_3_rollLoc.pim" "finger_4_3_rollLoc_pointConstraint1.cpim";
connectAttr "finger_4_3_rollLoc.rp" "finger_4_3_rollLoc_pointConstraint1.crp";
connectAttr "finger_4_3_rollLoc.rpt" "finger_4_3_rollLoc_pointConstraint1.crt";
connectAttr "finger_4_3_iniLoc.t" "finger_4_3_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_3_iniLoc.rp" "finger_4_3_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_3_iniLoc.rpt" "finger_4_3_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_3_iniLoc.pm" "finger_4_3_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_3_rollLoc_pointConstraint1.w0" "finger_4_3_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "finger_4_4_rollLoc_pointConstraint1.ctx" "finger_4_4_rollLoc.tx";
connectAttr "finger_4_4_rollLoc_pointConstraint1.cty" "finger_4_4_rollLoc.ty";
connectAttr "finger_4_4_rollLoc_pointConstraint1.ctz" "finger_4_4_rollLoc.tz";
connectAttr "finger_4_4_rollLoc.pim" "finger_4_4_rollLoc_pointConstraint1.cpim";
connectAttr "finger_4_4_rollLoc.rp" "finger_4_4_rollLoc_pointConstraint1.crp";
connectAttr "finger_4_4_rollLoc.rpt" "finger_4_4_rollLoc_pointConstraint1.crt";
connectAttr "finger_4_4_iniLoc.t" "finger_4_4_rollLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_4_iniLoc.rp" "finger_4_4_rollLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_iniLoc.rpt" "finger_4_4_rollLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_iniLoc.pm" "finger_4_4_rollLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "finger_4_4_rollLoc_pointConstraint1.w0" "finger_4_4_rollLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "ik_backTip_initLoc_pointConstraint1.ctx" "ik_backTip_initLoc.tx";
connectAttr "ik_backTip_initLoc_pointConstraint1.cty" "ik_backTip_initLoc.ty";
connectAttr "ik_backTip_initLoc_pointConstraint1.ctz" "ik_backTip_initLoc.tz";
connectAttr "ik_backTip_initLoc.pim" "ik_backTip_initLoc_pointConstraint1.cpim";
connectAttr "ik_backTip_initLoc.rp" "ik_backTip_initLoc_pointConstraint1.crp";
connectAttr "ik_backTip_initLoc.rpt" "ik_backTip_initLoc_pointConstraint1.crt";
connectAttr "finger_4_4_iniLoc.t" "ik_backTip_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_4_iniLoc.rp" "ik_backTip_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_4_iniLoc.rpt" "ik_backTip_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_iniLoc.pm" "ik_backTip_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "ik_backTip_initLoc_pointConstraint1.w0" "ik_backTip_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "ik_frontTip_initLoc_pointConstraint1.ctx" "ik_frontTip_initLoc.tx";
connectAttr "ik_frontTip_initLoc_pointConstraint1.cty" "ik_frontTip_initLoc.ty";
connectAttr "ik_frontTip_initLoc_pointConstraint1.ctz" "ik_frontTip_initLoc.tz";
connectAttr "ik_frontTip_initLoc.pim" "ik_frontTip_initLoc_pointConstraint1.cpim"
		;
connectAttr "ik_frontTip_initLoc.rp" "ik_frontTip_initLoc_pointConstraint1.crp";
connectAttr "ik_frontTip_initLoc.rpt" "ik_frontTip_initLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_4_iniLoc.t" "ik_frontTip_initLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_4_iniLoc.rp" "ik_frontTip_initLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_4_iniLoc.rpt" "ik_frontTip_initLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_iniLoc.pm" "ik_frontTip_initLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "ik_frontTip_initLoc_pointConstraint1.w0" "ik_frontTip_initLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "front_fingers_holdLoc_pointConstraint1.ctx" "front_fingers_holdLoc.tx"
		;
connectAttr "front_fingers_holdLoc_pointConstraint1.cty" "front_fingers_holdLoc.ty"
		;
connectAttr "front_fingers_holdLoc_pointConstraint1.ctz" "front_fingers_holdLoc.tz"
		;
connectAttr "front_fingers_holdLoc.pim" "front_fingers_holdLoc_pointConstraint1.cpim"
		;
connectAttr "front_fingers_holdLoc.rp" "front_fingers_holdLoc_pointConstraint1.crp"
		;
connectAttr "front_fingers_holdLoc.rpt" "front_fingers_holdLoc_pointConstraint1.crt"
		;
connectAttr "finger_4_0_iniLoc.t" "front_fingers_holdLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_4_0_iniLoc.rp" "front_fingers_holdLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_4_0_iniLoc.rpt" "front_fingers_holdLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_4_0_iniLoc.pm" "front_fingers_holdLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "front_fingers_holdLoc_pointConstraint1.w0" "front_fingers_holdLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "back_fingers_holdLoc_pointConstraint1.ctx" "back_fingers_holdLoc.tx"
		;
connectAttr "back_fingers_holdLoc_pointConstraint1.cty" "back_fingers_holdLoc.ty"
		;
connectAttr "back_fingers_holdLoc_pointConstraint1.ctz" "back_fingers_holdLoc.tz"
		;
connectAttr "back_fingers_holdLoc.pim" "back_fingers_holdLoc_pointConstraint1.cpim"
		;
connectAttr "back_fingers_holdLoc.rp" "back_fingers_holdLoc_pointConstraint1.crp"
		;
connectAttr "back_fingers_holdLoc.rpt" "back_fingers_holdLoc_pointConstraint1.crt"
		;
connectAttr "finger_2_0_iniLoc.t" "back_fingers_holdLoc_pointConstraint1.tg[0].tt"
		;
connectAttr "finger_2_0_iniLoc.rp" "back_fingers_holdLoc_pointConstraint1.tg[0].trp"
		;
connectAttr "finger_2_0_iniLoc.rpt" "back_fingers_holdLoc_pointConstraint1.tg[0].trt"
		;
connectAttr "finger_2_0_iniLoc.pm" "back_fingers_holdLoc_pointConstraint1.tg[0].tpm"
		;
connectAttr "back_fingers_holdLoc_pointConstraint1.w0" "back_fingers_holdLoc_pointConstraint1.tg[0].tw"
		;
connectAttr "mirror_condition.ocr" "ik_heel_initLoc.sx";
connectAttr "makeNurbSphere2.os" "finger_1_0_poserShape.cr";
connectAttr "finger_1_0_iniLoc_aimConstraint1.crx" "finger_1_0_iniLoc.rx";
connectAttr "finger_1_0_iniLoc_aimConstraint1.cry" "finger_1_0_iniLoc.ry";
connectAttr "finger_1_0_iniLoc_aimConstraint1.crz" "finger_1_0_iniLoc.rz";
connectAttr "finger_1_0_iniLoc.pim" "finger_1_0_iniLoc_aimConstraint1.cpim";
connectAttr "finger_1_0_iniLoc.t" "finger_1_0_iniLoc_aimConstraint1.ct";
connectAttr "finger_1_0_iniLoc.rp" "finger_1_0_iniLoc_aimConstraint1.crp";
connectAttr "finger_1_0_iniLoc.rpt" "finger_1_0_iniLoc_aimConstraint1.crt";
connectAttr "finger_1_0_iniLoc.ro" "finger_1_0_iniLoc_aimConstraint1.cro";
connectAttr "finger_1_1_iniLoc.t" "finger_1_0_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_1_1_iniLoc.rp" "finger_1_0_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_1_1_iniLoc.rpt" "finger_1_0_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_1_1_iniLoc.pm" "finger_1_0_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_0_iniLoc_aimConstraint1.w0" "finger_1_0_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_0_iniLoc_aimConstraint1.wum";
connectAttr "finger_2_0_iniLoc_aimConstraint1.crx" "finger_2_0_iniLoc.rx";
connectAttr "finger_2_0_iniLoc_aimConstraint1.cry" "finger_2_0_iniLoc.ry";
connectAttr "finger_2_0_iniLoc_aimConstraint1.crz" "finger_2_0_iniLoc.rz";
connectAttr "finger_2_0_iniLoc.pim" "finger_2_0_iniLoc_aimConstraint1.cpim";
connectAttr "finger_2_0_iniLoc.t" "finger_2_0_iniLoc_aimConstraint1.ct";
connectAttr "finger_2_0_iniLoc.rp" "finger_2_0_iniLoc_aimConstraint1.crp";
connectAttr "finger_2_0_iniLoc.rpt" "finger_2_0_iniLoc_aimConstraint1.crt";
connectAttr "finger_2_0_iniLoc.ro" "finger_2_0_iniLoc_aimConstraint1.cro";
connectAttr "finger_2_1_iniLoc.t" "finger_2_0_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_2_1_iniLoc.rp" "finger_2_0_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_2_1_iniLoc.rpt" "finger_2_0_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_2_1_iniLoc.pm" "finger_2_0_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_0_iniLoc_aimConstraint1.w0" "finger_2_0_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_0_iniLoc_aimConstraint1.wum";
connectAttr "finger_3_0_iniLoc_aimConstraint1.crx" "finger_3_0_iniLoc.rx";
connectAttr "finger_3_0_iniLoc_aimConstraint1.cry" "finger_3_0_iniLoc.ry";
connectAttr "finger_3_0_iniLoc_aimConstraint1.crz" "finger_3_0_iniLoc.rz";
connectAttr "finger_3_0_iniLoc.pim" "finger_3_0_iniLoc_aimConstraint1.cpim";
connectAttr "finger_3_0_iniLoc.t" "finger_3_0_iniLoc_aimConstraint1.ct";
connectAttr "finger_3_0_iniLoc.rp" "finger_3_0_iniLoc_aimConstraint1.crp";
connectAttr "finger_3_0_iniLoc.rpt" "finger_3_0_iniLoc_aimConstraint1.crt";
connectAttr "finger_3_0_iniLoc.ro" "finger_3_0_iniLoc_aimConstraint1.cro";
connectAttr "finger_3_1_iniLoc.t" "finger_3_0_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_3_1_iniLoc.rp" "finger_3_0_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_3_1_iniLoc.rpt" "finger_3_0_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_3_1_iniLoc.pm" "finger_3_0_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_0_iniLoc_aimConstraint1.w0" "finger_3_0_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_0_iniLoc_aimConstraint1.wum";
connectAttr "finger_4_0_iniLoc_aimConstraint1.crx" "finger_4_0_iniLoc.rx";
connectAttr "finger_4_0_iniLoc_aimConstraint1.cry" "finger_4_0_iniLoc.ry";
connectAttr "finger_4_0_iniLoc_aimConstraint1.crz" "finger_4_0_iniLoc.rz";
connectAttr "finger_4_0_iniLoc.pim" "finger_4_0_iniLoc_aimConstraint1.cpim";
connectAttr "finger_4_0_iniLoc.t" "finger_4_0_iniLoc_aimConstraint1.ct";
connectAttr "finger_4_0_iniLoc.rp" "finger_4_0_iniLoc_aimConstraint1.crp";
connectAttr "finger_4_0_iniLoc.rpt" "finger_4_0_iniLoc_aimConstraint1.crt";
connectAttr "finger_4_0_iniLoc.ro" "finger_4_0_iniLoc_aimConstraint1.cro";
connectAttr "finger_4_1_iniLoc.t" "finger_4_0_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_4_1_iniLoc.rp" "finger_4_0_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_4_1_iniLoc.rpt" "finger_4_0_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_4_1_iniLoc.pm" "finger_4_0_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_0_iniLoc_aimConstraint1.w0" "finger_4_0_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_0_iniLoc_aimConstraint1.wum";
connectAttr "finger_3_4_iniLoc_aimConstraint1.crx" "finger_3_4_iniLoc.rx";
connectAttr "finger_3_4_iniLoc_aimConstraint1.cry" "finger_3_4_iniLoc.ry";
connectAttr "finger_3_4_iniLoc_aimConstraint1.crz" "finger_3_4_iniLoc.rz";
connectAttr "finger_3_4_iniLoc.pim" "finger_3_4_iniLoc_aimConstraint1.cpim";
connectAttr "finger_3_4_iniLoc.t" "finger_3_4_iniLoc_aimConstraint1.ct";
connectAttr "finger_3_4_iniLoc.rp" "finger_3_4_iniLoc_aimConstraint1.crp";
connectAttr "finger_3_4_iniLoc.rpt" "finger_3_4_iniLoc_aimConstraint1.crt";
connectAttr "finger_3_4_iniLoc.ro" "finger_3_4_iniLoc_aimConstraint1.cro";
connectAttr "finger_3_3_iniLoc.t" "finger_3_4_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_3_3_iniLoc.rp" "finger_3_4_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_3_3_iniLoc.rpt" "finger_3_4_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_3_3_iniLoc.pm" "finger_3_4_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_4_iniLoc_aimConstraint1.w0" "finger_3_4_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_4_iniLoc_aimConstraint1.wum";
connectAttr "finger_3_3_iniLoc_aimConstraint1.crx" "finger_3_3_iniLoc.rx";
connectAttr "finger_3_3_iniLoc_aimConstraint1.cry" "finger_3_3_iniLoc.ry";
connectAttr "finger_3_3_iniLoc_aimConstraint1.crz" "finger_3_3_iniLoc.rz";
connectAttr "finger_3_3_iniLoc.pim" "finger_3_3_iniLoc_aimConstraint1.cpim";
connectAttr "finger_3_3_iniLoc.t" "finger_3_3_iniLoc_aimConstraint1.ct";
connectAttr "finger_3_3_iniLoc.rp" "finger_3_3_iniLoc_aimConstraint1.crp";
connectAttr "finger_3_3_iniLoc.rpt" "finger_3_3_iniLoc_aimConstraint1.crt";
connectAttr "finger_3_3_iniLoc.ro" "finger_3_3_iniLoc_aimConstraint1.cro";
connectAttr "finger_3_4_iniLoc.t" "finger_3_3_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_3_4_iniLoc.rp" "finger_3_3_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_3_4_iniLoc.rpt" "finger_3_3_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_3_4_iniLoc.pm" "finger_3_3_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_3_iniLoc_aimConstraint1.w0" "finger_3_3_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_3_iniLoc_aimConstraint1.wum";
connectAttr "finger_3_2_iniLoc_aimConstraint1.crx" "finger_3_2_iniLoc.rx";
connectAttr "finger_3_2_iniLoc_aimConstraint1.cry" "finger_3_2_iniLoc.ry";
connectAttr "finger_3_2_iniLoc_aimConstraint1.crz" "finger_3_2_iniLoc.rz";
connectAttr "finger_3_2_iniLoc.pim" "finger_3_2_iniLoc_aimConstraint1.cpim";
connectAttr "finger_3_2_iniLoc.t" "finger_3_2_iniLoc_aimConstraint1.ct";
connectAttr "finger_3_2_iniLoc.rp" "finger_3_2_iniLoc_aimConstraint1.crp";
connectAttr "finger_3_2_iniLoc.rpt" "finger_3_2_iniLoc_aimConstraint1.crt";
connectAttr "finger_3_2_iniLoc.ro" "finger_3_2_iniLoc_aimConstraint1.cro";
connectAttr "finger_3_3_iniLoc.t" "finger_3_2_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_3_3_iniLoc.rp" "finger_3_2_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_3_3_iniLoc.rpt" "finger_3_2_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_3_3_iniLoc.pm" "finger_3_2_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_2_iniLoc_aimConstraint1.w0" "finger_3_2_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_2_iniLoc_aimConstraint1.wum";
connectAttr "finger_3_1_iniLoc_aimConstraint1.crx" "finger_3_1_iniLoc.rx";
connectAttr "finger_3_1_iniLoc_aimConstraint1.cry" "finger_3_1_iniLoc.ry";
connectAttr "finger_3_1_iniLoc_aimConstraint1.crz" "finger_3_1_iniLoc.rz";
connectAttr "finger_3_1_iniLoc.pim" "finger_3_1_iniLoc_aimConstraint1.cpim";
connectAttr "finger_3_1_iniLoc.t" "finger_3_1_iniLoc_aimConstraint1.ct";
connectAttr "finger_3_1_iniLoc.rp" "finger_3_1_iniLoc_aimConstraint1.crp";
connectAttr "finger_3_1_iniLoc.rpt" "finger_3_1_iniLoc_aimConstraint1.crt";
connectAttr "finger_3_1_iniLoc.ro" "finger_3_1_iniLoc_aimConstraint1.cro";
connectAttr "finger_3_2_iniLoc.t" "finger_3_1_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_3_2_iniLoc.rp" "finger_3_1_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_3_2_iniLoc.rpt" "finger_3_1_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_3_2_iniLoc.pm" "finger_3_1_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_3_1_iniLoc_aimConstraint1.w0" "finger_3_1_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_3_1_iniLoc_aimConstraint1.wum";
connectAttr "finger_2_4_iniLoc_aimConstraint1.crx" "finger_2_4_iniLoc.rx";
connectAttr "finger_2_4_iniLoc_aimConstraint1.cry" "finger_2_4_iniLoc.ry";
connectAttr "finger_2_4_iniLoc_aimConstraint1.crz" "finger_2_4_iniLoc.rz";
connectAttr "finger_2_4_iniLoc.pim" "finger_2_4_iniLoc_aimConstraint1.cpim";
connectAttr "finger_2_4_iniLoc.t" "finger_2_4_iniLoc_aimConstraint1.ct";
connectAttr "finger_2_4_iniLoc.rp" "finger_2_4_iniLoc_aimConstraint1.crp";
connectAttr "finger_2_4_iniLoc.rpt" "finger_2_4_iniLoc_aimConstraint1.crt";
connectAttr "finger_2_4_iniLoc.ro" "finger_2_4_iniLoc_aimConstraint1.cro";
connectAttr "finger_2_3_iniLoc.t" "finger_2_4_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_2_3_iniLoc.rp" "finger_2_4_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_2_3_iniLoc.rpt" "finger_2_4_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_2_3_iniLoc.pm" "finger_2_4_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_4_iniLoc_aimConstraint1.w0" "finger_2_4_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_4_iniLoc_aimConstraint1.wum";
connectAttr "finger_2_3_iniLoc_aimConstraint1.crx" "finger_2_3_iniLoc.rx";
connectAttr "finger_2_3_iniLoc_aimConstraint1.cry" "finger_2_3_iniLoc.ry";
connectAttr "finger_2_3_iniLoc_aimConstraint1.crz" "finger_2_3_iniLoc.rz";
connectAttr "finger_2_3_iniLoc.pim" "finger_2_3_iniLoc_aimConstraint1.cpim";
connectAttr "finger_2_3_iniLoc.t" "finger_2_3_iniLoc_aimConstraint1.ct";
connectAttr "finger_2_3_iniLoc.rp" "finger_2_3_iniLoc_aimConstraint1.crp";
connectAttr "finger_2_3_iniLoc.rpt" "finger_2_3_iniLoc_aimConstraint1.crt";
connectAttr "finger_2_3_iniLoc.ro" "finger_2_3_iniLoc_aimConstraint1.cro";
connectAttr "finger_2_4_iniLoc.t" "finger_2_3_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_2_4_iniLoc.rp" "finger_2_3_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_2_4_iniLoc.rpt" "finger_2_3_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_2_4_iniLoc.pm" "finger_2_3_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_3_iniLoc_aimConstraint1.w0" "finger_2_3_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_3_iniLoc_aimConstraint1.wum";
connectAttr "finger_2_2_iniLoc_aimConstraint1.crx" "finger_2_2_iniLoc.rx";
connectAttr "finger_2_2_iniLoc_aimConstraint1.cry" "finger_2_2_iniLoc.ry";
connectAttr "finger_2_2_iniLoc_aimConstraint1.crz" "finger_2_2_iniLoc.rz";
connectAttr "finger_2_2_iniLoc.pim" "finger_2_2_iniLoc_aimConstraint1.cpim";
connectAttr "finger_2_2_iniLoc.t" "finger_2_2_iniLoc_aimConstraint1.ct";
connectAttr "finger_2_2_iniLoc.rp" "finger_2_2_iniLoc_aimConstraint1.crp";
connectAttr "finger_2_2_iniLoc.rpt" "finger_2_2_iniLoc_aimConstraint1.crt";
connectAttr "finger_2_2_iniLoc.ro" "finger_2_2_iniLoc_aimConstraint1.cro";
connectAttr "finger_2_3_iniLoc.t" "finger_2_2_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_2_3_iniLoc.rp" "finger_2_2_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_2_3_iniLoc.rpt" "finger_2_2_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_2_3_iniLoc.pm" "finger_2_2_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_2_iniLoc_aimConstraint1.w0" "finger_2_2_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_2_iniLoc_aimConstraint1.wum";
connectAttr "finger_2_1_iniLoc_aimConstraint1.crx" "finger_2_1_iniLoc.rx";
connectAttr "finger_2_1_iniLoc_aimConstraint1.cry" "finger_2_1_iniLoc.ry";
connectAttr "finger_2_1_iniLoc_aimConstraint1.crz" "finger_2_1_iniLoc.rz";
connectAttr "finger_2_1_iniLoc.pim" "finger_2_1_iniLoc_aimConstraint1.cpim";
connectAttr "finger_2_1_iniLoc.t" "finger_2_1_iniLoc_aimConstraint1.ct";
connectAttr "finger_2_1_iniLoc.rp" "finger_2_1_iniLoc_aimConstraint1.crp";
connectAttr "finger_2_1_iniLoc.rpt" "finger_2_1_iniLoc_aimConstraint1.crt";
connectAttr "finger_2_1_iniLoc.ro" "finger_2_1_iniLoc_aimConstraint1.cro";
connectAttr "finger_2_2_iniLoc.t" "finger_2_1_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_2_2_iniLoc.rp" "finger_2_1_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_2_2_iniLoc.rpt" "finger_2_1_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_2_2_iniLoc.pm" "finger_2_1_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_2_1_iniLoc_aimConstraint1.w0" "finger_2_1_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_2_1_iniLoc_aimConstraint1.wum";
connectAttr "finger_1_4_iniLoc_aimConstraint1.crx" "finger_1_4_iniLoc.rx";
connectAttr "finger_1_4_iniLoc_aimConstraint1.cry" "finger_1_4_iniLoc.ry";
connectAttr "finger_1_4_iniLoc_aimConstraint1.crz" "finger_1_4_iniLoc.rz";
connectAttr "finger_1_4_iniLoc.pim" "finger_1_4_iniLoc_aimConstraint1.cpim";
connectAttr "finger_1_4_iniLoc.t" "finger_1_4_iniLoc_aimConstraint1.ct";
connectAttr "finger_1_4_iniLoc.rp" "finger_1_4_iniLoc_aimConstraint1.crp";
connectAttr "finger_1_4_iniLoc.rpt" "finger_1_4_iniLoc_aimConstraint1.crt";
connectAttr "finger_1_4_iniLoc.ro" "finger_1_4_iniLoc_aimConstraint1.cro";
connectAttr "finger_1_3_iniLoc.t" "finger_1_4_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_1_3_iniLoc.rp" "finger_1_4_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_1_3_iniLoc.rpt" "finger_1_4_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_1_3_iniLoc.pm" "finger_1_4_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_4_iniLoc_aimConstraint1.w0" "finger_1_4_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_4_iniLoc_aimConstraint1.wum";
connectAttr "finger_1_3_iniLoc_aimConstraint1.crx" "finger_1_3_iniLoc.rx";
connectAttr "finger_1_3_iniLoc_aimConstraint1.cry" "finger_1_3_iniLoc.ry";
connectAttr "finger_1_3_iniLoc_aimConstraint1.crz" "finger_1_3_iniLoc.rz";
connectAttr "finger_1_3_iniLoc.pim" "finger_1_3_iniLoc_aimConstraint1.cpim";
connectAttr "finger_1_3_iniLoc.t" "finger_1_3_iniLoc_aimConstraint1.ct";
connectAttr "finger_1_3_iniLoc.rp" "finger_1_3_iniLoc_aimConstraint1.crp";
connectAttr "finger_1_3_iniLoc.rpt" "finger_1_3_iniLoc_aimConstraint1.crt";
connectAttr "finger_1_3_iniLoc.ro" "finger_1_3_iniLoc_aimConstraint1.cro";
connectAttr "finger_1_4_iniLoc.t" "finger_1_3_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_1_4_iniLoc.rp" "finger_1_3_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_1_4_iniLoc.rpt" "finger_1_3_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_1_4_iniLoc.pm" "finger_1_3_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_3_iniLoc_aimConstraint1.w0" "finger_1_3_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_3_iniLoc_aimConstraint1.wum";
connectAttr "finger_1_2_iniLoc_aimConstraint1.crx" "finger_1_2_iniLoc.rx";
connectAttr "finger_1_2_iniLoc_aimConstraint1.cry" "finger_1_2_iniLoc.ry";
connectAttr "finger_1_2_iniLoc_aimConstraint1.crz" "finger_1_2_iniLoc.rz";
connectAttr "finger_1_2_iniLoc.pim" "finger_1_2_iniLoc_aimConstraint1.cpim";
connectAttr "finger_1_2_iniLoc.t" "finger_1_2_iniLoc_aimConstraint1.ct";
connectAttr "finger_1_2_iniLoc.rp" "finger_1_2_iniLoc_aimConstraint1.crp";
connectAttr "finger_1_2_iniLoc.rpt" "finger_1_2_iniLoc_aimConstraint1.crt";
connectAttr "finger_1_2_iniLoc.ro" "finger_1_2_iniLoc_aimConstraint1.cro";
connectAttr "finger_1_3_iniLoc.t" "finger_1_2_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_1_3_iniLoc.rp" "finger_1_2_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_1_3_iniLoc.rpt" "finger_1_2_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_1_3_iniLoc.pm" "finger_1_2_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_2_iniLoc_aimConstraint1.w0" "finger_1_2_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_2_iniLoc_aimConstraint1.wum";
connectAttr "makeNurbSphere3.os" "finger_1_1_poserShape.cr";
connectAttr "finger_1_1_iniLoc_aimConstraint1.crx" "finger_1_1_iniLoc.rx";
connectAttr "finger_1_1_iniLoc_aimConstraint1.cry" "finger_1_1_iniLoc.ry";
connectAttr "finger_1_1_iniLoc_aimConstraint1.crz" "finger_1_1_iniLoc.rz";
connectAttr "finger_1_1_iniLoc.pim" "finger_1_1_iniLoc_aimConstraint1.cpim";
connectAttr "finger_1_1_iniLoc.t" "finger_1_1_iniLoc_aimConstraint1.ct";
connectAttr "finger_1_1_iniLoc.rp" "finger_1_1_iniLoc_aimConstraint1.crp";
connectAttr "finger_1_1_iniLoc.rpt" "finger_1_1_iniLoc_aimConstraint1.crt";
connectAttr "finger_1_1_iniLoc.ro" "finger_1_1_iniLoc_aimConstraint1.cro";
connectAttr "finger_1_2_iniLoc.t" "finger_1_1_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_1_2_iniLoc.rp" "finger_1_1_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_1_2_iniLoc.rpt" "finger_1_1_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_1_2_iniLoc.pm" "finger_1_1_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_1_1_iniLoc_aimConstraint1.w0" "finger_1_1_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_1_1_iniLoc_aimConstraint1.wum";
connectAttr "finger_4_4_iniLoc_aimConstraint1.crx" "finger_4_4_iniLoc.rx";
connectAttr "finger_4_4_iniLoc_aimConstraint1.cry" "finger_4_4_iniLoc.ry";
connectAttr "finger_4_4_iniLoc_aimConstraint1.crz" "finger_4_4_iniLoc.rz";
connectAttr "finger_4_4_iniLoc.pim" "finger_4_4_iniLoc_aimConstraint1.cpim";
connectAttr "finger_4_4_iniLoc.t" "finger_4_4_iniLoc_aimConstraint1.ct";
connectAttr "finger_4_4_iniLoc.rp" "finger_4_4_iniLoc_aimConstraint1.crp";
connectAttr "finger_4_4_iniLoc.rpt" "finger_4_4_iniLoc_aimConstraint1.crt";
connectAttr "finger_4_4_iniLoc.ro" "finger_4_4_iniLoc_aimConstraint1.cro";
connectAttr "finger_4_3_iniLoc.t" "finger_4_4_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_4_3_iniLoc.rp" "finger_4_4_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_4_3_iniLoc.rpt" "finger_4_4_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_4_3_iniLoc.pm" "finger_4_4_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_4_iniLoc_aimConstraint1.w0" "finger_4_4_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_4_iniLoc_aimConstraint1.wum";
connectAttr "finger_4_3_iniLoc_aimConstraint1.crx" "finger_4_3_iniLoc.rx";
connectAttr "finger_4_3_iniLoc_aimConstraint1.cry" "finger_4_3_iniLoc.ry";
connectAttr "finger_4_3_iniLoc_aimConstraint1.crz" "finger_4_3_iniLoc.rz";
connectAttr "finger_4_3_iniLoc.pim" "finger_4_3_iniLoc_aimConstraint1.cpim";
connectAttr "finger_4_3_iniLoc.t" "finger_4_3_iniLoc_aimConstraint1.ct";
connectAttr "finger_4_3_iniLoc.rp" "finger_4_3_iniLoc_aimConstraint1.crp";
connectAttr "finger_4_3_iniLoc.rpt" "finger_4_3_iniLoc_aimConstraint1.crt";
connectAttr "finger_4_3_iniLoc.ro" "finger_4_3_iniLoc_aimConstraint1.cro";
connectAttr "finger_4_4_iniLoc.t" "finger_4_3_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_4_4_iniLoc.rp" "finger_4_3_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_4_4_iniLoc.rpt" "finger_4_3_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_4_4_iniLoc.pm" "finger_4_3_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_3_iniLoc_aimConstraint1.w0" "finger_4_3_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_3_iniLoc_aimConstraint1.wum";
connectAttr "finger_4_2_iniLoc_aimConstraint1.crx" "finger_4_2_iniLoc.rx";
connectAttr "finger_4_2_iniLoc_aimConstraint1.cry" "finger_4_2_iniLoc.ry";
connectAttr "finger_4_2_iniLoc_aimConstraint1.crz" "finger_4_2_iniLoc.rz";
connectAttr "finger_4_2_iniLoc.pim" "finger_4_2_iniLoc_aimConstraint1.cpim";
connectAttr "finger_4_2_iniLoc.t" "finger_4_2_iniLoc_aimConstraint1.ct";
connectAttr "finger_4_2_iniLoc.rp" "finger_4_2_iniLoc_aimConstraint1.crp";
connectAttr "finger_4_2_iniLoc.rpt" "finger_4_2_iniLoc_aimConstraint1.crt";
connectAttr "finger_4_2_iniLoc.ro" "finger_4_2_iniLoc_aimConstraint1.cro";
connectAttr "finger_4_3_iniLoc.t" "finger_4_2_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_4_3_iniLoc.rp" "finger_4_2_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_4_3_iniLoc.rpt" "finger_4_2_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_4_3_iniLoc.pm" "finger_4_2_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_2_iniLoc_aimConstraint1.w0" "finger_4_2_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_2_iniLoc_aimConstraint1.wum";
connectAttr "finger_4_1_iniLoc_aimConstraint1.crx" "finger_4_1_iniLoc.rx";
connectAttr "finger_4_1_iniLoc_aimConstraint1.cry" "finger_4_1_iniLoc.ry";
connectAttr "finger_4_1_iniLoc_aimConstraint1.crz" "finger_4_1_iniLoc.rz";
connectAttr "finger_4_1_iniLoc.pim" "finger_4_1_iniLoc_aimConstraint1.cpim";
connectAttr "finger_4_1_iniLoc.t" "finger_4_1_iniLoc_aimConstraint1.ct";
connectAttr "finger_4_1_iniLoc.rp" "finger_4_1_iniLoc_aimConstraint1.crp";
connectAttr "finger_4_1_iniLoc.rpt" "finger_4_1_iniLoc_aimConstraint1.crt";
connectAttr "finger_4_1_iniLoc.ro" "finger_4_1_iniLoc_aimConstraint1.cro";
connectAttr "finger_4_2_iniLoc.t" "finger_4_1_iniLoc_aimConstraint1.tg[0].tt";
connectAttr "finger_4_2_iniLoc.rp" "finger_4_1_iniLoc_aimConstraint1.tg[0].trp";
connectAttr "finger_4_2_iniLoc.rpt" "finger_4_1_iniLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "finger_4_2_iniLoc.pm" "finger_4_1_iniLoc_aimConstraint1.tg[0].tpm";
connectAttr "finger_4_1_iniLoc_aimConstraint1.w0" "finger_4_1_iniLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "finger_4_1_iniLoc_aimConstraint1.wum";
connectAttr "finger_1_4_iniLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "finger_1_3_iniLocShape.wp" "posers_curveShape.cp[1]";
connectAttr "finger_1_2_iniLocShape.wp" "posers_curveShape.cp[2]";
connectAttr "finger_1_1_iniLocShape.wp" "posers_curveShape.cp[3]";
connectAttr "finger_1_0_iniLocShape.wp" "posers_curveShape.cp[4]";
connectAttr "ik_heel_initLoc_locShape.wp" "posers_curveShape.cp[5]";
connectAttr "finger_3_0_iniLocShape.wp" "posers_curveShape.cp[6]";
connectAttr "finger_3_1_iniLocShape.wp" "posers_curveShape.cp[7]";
connectAttr "finger_3_2_iniLocShape.wp" "posers_curveShape.cp[8]";
connectAttr "finger_3_3_iniLocShape.wp" "posers_curveShape.cp[9]";
connectAttr "finger_3_4_iniLocShape.wp" "posers_curveShape.cp[10]";
connectAttr "finger_2_4_iniLocShape.wp" "posers_curve_2Shape.cp[0]";
connectAttr "finger_2_3_iniLocShape.wp" "posers_curve_2Shape.cp[1]";
connectAttr "finger_2_2_iniLocShape.wp" "posers_curve_2Shape.cp[2]";
connectAttr "finger_2_1_iniLocShape.wp" "posers_curve_2Shape.cp[3]";
connectAttr "finger_2_0_iniLocShape.wp" "posers_curve_2Shape.cp[4]";
connectAttr "ik_heel_initLoc_locShape.wp" "posers_curve_2Shape.cp[5]";
connectAttr "finger_4_0_iniLocShape.wp" "posers_curve_2Shape.cp[6]";
connectAttr "finger_4_1_iniLocShape.wp" "posers_curve_2Shape.cp[7]";
connectAttr "finger_4_2_iniLocShape.wp" "posers_curve_2Shape.cp[8]";
connectAttr "finger_4_3_iniLocShape.wp" "posers_curve_2Shape.cp[9]";
connectAttr "finger_4_4_iniLocShape.wp" "posers_curve_2Shape.cp[10]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "sweepMeshCreator1.outMeshArray[1]" "posers_sweep_2Shape.i";
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
connectAttr "mod.ikFk" "ik_controls.v";
connectAttr "root_poser.wm" "ik_controls.opm";
connectAttr "multMatrix192.o" "ik_foot_group.opm";
connectAttr "reverse174.ox" "fk_controls.v";
connectAttr "root_poser.wm" "fk_controls.opm";
connectAttr "decomposeMatrix191.otx" "fk_heel_group_2.tx";
connectAttr "decomposeMatrix191.oty" "fk_heel_group_2.ty";
connectAttr "decomposeMatrix191.otz" "fk_heel_group_2.tz";
connectAttr "decomposeMatrix191.orx" "fk_heel_group_2.rx";
connectAttr "decomposeMatrix191.ory" "fk_heel_group_2.ry";
connectAttr "decomposeMatrix191.orz" "fk_heel_group_2.rz";
connectAttr "decomposeMatrix191.osx" "fk_heel_group_2.sx";
connectAttr "decomposeMatrix191.osy" "fk_heel_group_2.sy";
connectAttr "decomposeMatrix191.osz" "fk_heel_group_2.sz";
connectAttr "blendMatrix5.omat" "transform.opm";
connectAttr "ik_backTip_group_multMat.o" "ik_backTip_group.opm";
connectAttr "roll_back_rigid_multMat.o" "roll_back_rigid.opm";
connectAttr "unitConversion1964.o" "roll_back_rigid.rx";
connectAttr "unitConversion1965.o" "roll_back_1.rx";
connectAttr "roll_back_2_multMat.o" "roll_back_2.opm";
connectAttr "unitConversion1966.o" "roll_back_2.rx";
connectAttr "roll_back_3_multMat.o" "roll_back_3.opm";
connectAttr "unitConversion1967.o" "roll_back_3.rx";
connectAttr "roll_back_4_multMat.o" "roll_back_4.opm";
connectAttr "unitConversion1968.o" "roll_back_4.rx";
connectAttr "roll_back_5_multMat.o" "roll_back_5.opm";
connectAttr "unitConversion1969.o" "roll_back_5.rx";
connectAttr "ik_frontTip_group_multMat.o" "ik_frontTip_group.opm";
connectAttr "roll_front_rigid_multMat.o" "roll_front_rigid.opm";
connectAttr "unitConversion1970.o" "roll_front_rigid.rx";
connectAttr "unitConversion1971.o" "roll_front_1.rx";
connectAttr "roll_front_2_multMat.o" "roll_front_2.opm";
connectAttr "unitConversion1972.o" "roll_front_2.rx";
connectAttr "roll_front_3_multMat.o" "roll_front_3.opm";
connectAttr "unitConversion1973.o" "roll_front_3.rx";
connectAttr "roll_front_4_multMat.o" "roll_front_4.opm";
connectAttr "unitConversion1974.o" "roll_front_4.rx";
connectAttr "roll_front_5_multMat.o" "roll_front_5.opm";
connectAttr "unitConversion1975.o" "roll_front_5.rx";
connectAttr "roll_center_multMat.o" "roll_center.opm";
connectAttr "finger_controls_multMat.o" "finger_controls.opm";
connectAttr "front_fingers_holdGroup_multMat.o" "front_fingers_holdGroup.opm";
connectAttr "roll_back_5.rx" "front_fingers_holdGroup.rx";
connectAttr "roll_front_5.rx" "finger_1_0_group.rx";
connectAttr "finger_1_0_group_multMat.o" "finger_1_0_group.opm";
connectAttr "finger_1_0_pivotLoc.t" "finger_1_0_group.rp";
connectAttr "finger_1_0_bendGroup_multMat.o" "finger_1_0_bendGroup.opm";
connectAttr "roll_front_4.rx" "finger_1_1_group.rx";
connectAttr "finger_1_1_group_multMat.o" "finger_1_1_group.opm";
connectAttr "finger_1_1_pivotLoc.t" "finger_1_1_group.rp";
connectAttr "unitConversion495.o" "finger_1_1_bendGroup.ry";
connectAttr "unitConversion499.o" "finger_1_1_bendGroup.rz";
connectAttr "finger_1_1_bendGroup_multMat.o" "finger_1_1_bendGroup.opm";
connectAttr "roll_front_3.rx" "finger_1_2_group.rx";
connectAttr "finger_1_2_group_multMat.o" "finger_1_2_group.opm";
connectAttr "finger_1_2_pivotLoc.t" "finger_1_2_group.rp";
connectAttr "unitConversion499.o" "finger_1_2_bendGroup.rz";
connectAttr "finger_1_2_bendGroup_multMat.o" "finger_1_2_bendGroup.opm";
connectAttr "roll_front_2.rx" "finger_1_3_group.rx";
connectAttr "finger_1_3_group_multMat.o" "finger_1_3_group.opm";
connectAttr "finger_1_3_pivotLoc.t" "finger_1_3_group.rp";
connectAttr "unitConversion499.o" "finger_1_3_bendGroup.rz";
connectAttr "finger_1_3_bendGroup_multMat.o" "finger_1_3_bendGroup.opm";
connectAttr "roll_front_1.rx" "finger_1_4_group.rx";
connectAttr "finger_1_4_group_multMat.o" "finger_1_4_group.opm";
connectAttr "finger_1_4_pivotLoc.t" "finger_1_4_group.rp";
connectAttr "finger_1_4_bendGroup_multMat.o" "finger_1_4_bendGroup.opm";
connectAttr "roll_front_5.rx" "finger_2_0_group.rx";
connectAttr "finger_2_0_group_multMat.o" "finger_2_0_group.opm";
connectAttr "finger_2_0_bendGroup_multMat.o" "finger_2_0_bendGroup.opm";
connectAttr "roll_front_4.rx" "finger_2_1_group.rx";
connectAttr "finger_2_1_group_multMat.o" "finger_2_1_group.opm";
connectAttr "unitConversion504.o" "finger_2_1_bendGroup.rz";
connectAttr "finger_2_1_bendGroup_multMat.o" "finger_2_1_bendGroup.opm";
connectAttr "roll_front_3.rx" "finger_2_2_group.rx";
connectAttr "finger_2_2_group_multMat.o" "finger_2_2_group.opm";
connectAttr "unitConversion504.o" "finger_2_2_bendGroup.rz";
connectAttr "finger_2_2_bendGroup_multMat.o" "finger_2_2_bendGroup.opm";
connectAttr "roll_front_2.rx" "finger_2_3_group.rx";
connectAttr "finger_2_3_group_multMat.o" "finger_2_3_group.opm";
connectAttr "unitConversion504.o" "finger_2_3_bendGroup.rz";
connectAttr "finger_2_3_bendGroup_multMat.o" "finger_2_3_bendGroup.opm";
connectAttr "roll_front_1.rx" "finger_2_4_group.rx";
connectAttr "finger_2_4_group_multMat.o" "finger_2_4_group.opm";
connectAttr "finger_2_4_bendGroup_multMat.o" "finger_2_4_bendGroup.opm";
connectAttr "roll_front_5.rx" "finger_3_0_group.rx";
connectAttr "finger_3_0_group_multMat.o" "finger_3_0_group.opm";
connectAttr "finger_3_0_pivotLoc.t" "finger_3_0_group.rp";
connectAttr "finger_3_0_bendGroup_multMat.o" "finger_3_0_bendGroup.opm";
connectAttr "roll_front_4.rx" "finger_3_1_group.rx";
connectAttr "finger_3_1_group_multMat.o" "finger_3_1_group.opm";
connectAttr "finger_3_1_pivotLoc.t" "finger_3_1_group.rp";
connectAttr "unitConversion505.o" "finger_3_1_bendGroup.rz";
connectAttr "unitConversion496.o" "finger_3_1_bendGroup.ry";
connectAttr "finger_3_1_bendGroup_multMat.o" "finger_3_1_bendGroup.opm";
connectAttr "roll_front_3.rx" "finger_3_2_group.rx";
connectAttr "finger_3_2_group_multMat.o" "finger_3_2_group.opm";
connectAttr "finger_3_2_pivotLoc.t" "finger_3_2_group.rp";
connectAttr "unitConversion505.o" "finger_3_2_bendGroup.rz";
connectAttr "finger_3_2_bendGroup_multMat.o" "finger_3_2_bendGroup.opm";
connectAttr "roll_front_2.rx" "finger_3_3_group.rx";
connectAttr "finger_3_3_group_multMat.o" "finger_3_3_group.opm";
connectAttr "finger_3_3_pivotLoc.t" "finger_3_3_group.rp";
connectAttr "unitConversion505.o" "finger_3_3_bendGroup.rz";
connectAttr "finger_3_3_bendGroup_multMat.o" "finger_3_3_bendGroup.opm";
connectAttr "roll_front_1.rx" "finger_3_4_group.rx";
connectAttr "finger_3_4_group_multMat.o" "finger_3_4_group.opm";
connectAttr "finger_3_4_pivotLoc.t" "finger_3_4_group.rp";
connectAttr "finger_3_4_bendGroup_multMat.o" "finger_3_4_bendGroup.opm";
connectAttr "back_fingers_holdGroup_multMat.o" "back_fingers_holdGroup.opm";
connectAttr "roll_front_5.rx" "back_fingers_holdGroup.rx";
connectAttr "roll_back_5.rx" "finger_4_0_group.rx";
connectAttr "finger_4_0_group_multMat.o" "finger_4_0_group.opm";
connectAttr "finger_4_0_bendGroup_multMat.o" "finger_4_0_bendGroup.opm";
connectAttr "roll_back_4.rx" "finger_4_1_group.rx";
connectAttr "finger_4_1_group_multMat.o" "finger_4_1_group.opm";
connectAttr "unitConversion508.o" "finger_4_1_bendGroup.rz";
connectAttr "finger_4_1_bendGroup_multMat.o" "finger_4_1_bendGroup.opm";
connectAttr "roll_back_3.rx" "finger_4_2_group.rx";
connectAttr "finger_4_2_group_multMat.o" "finger_4_2_group.opm";
connectAttr "unitConversion508.o" "finger_4_2_bendGroup.rz";
connectAttr "finger_4_2_bendGroup_multMat.o" "finger_4_2_bendGroup.opm";
connectAttr "roll_back_2.rx" "finger_4_3_group.rx";
connectAttr "finger_4_3_group_multMat.o" "finger_4_3_group.opm";
connectAttr "unitConversion508.o" "finger_4_3_bendGroup.rz";
connectAttr "finger_4_3_bendGroup_multMat.o" "finger_4_3_bendGroup.opm";
connectAttr "roll_back_1.rx" "finger_4_4_group.rx";
connectAttr "finger_4_4_group_multMat.o" "finger_4_4_group.opm";
connectAttr "finger_4_4_bendGroup_multMat.o" "finger_4_4_bendGroup.opm";
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
connectAttr "root_outJoint_decMat.ot" "root_outJoint.t";
connectAttr "root_outJoint_decMat.or" "root_outJoint.r";
connectAttr "root_outJoint_decMat.os" "root_outJoint.s";
connectAttr "finger_1_0_outJoint_decMat.ot" "finger_1_0_outJoint.t";
connectAttr "finger_1_0_outJoint_decMat.or" "finger_1_0_outJoint.r";
connectAttr "finger_1_0_outJoint_decMat.os" "finger_1_0_outJoint.s";
connectAttr "finger_1_1_outJoint_decMat.ot" "finger_1_1_outJoint.t";
connectAttr "finger_1_1_outJoint_decMat.or" "finger_1_1_outJoint.r";
connectAttr "finger_1_1_outJoint_decMat.os" "finger_1_1_outJoint.s";
connectAttr "finger_1_2_outJoint_decMat.ot" "finger_1_2_outJoint.t";
connectAttr "finger_1_2_outJoint_decMat.or" "finger_1_2_outJoint.r";
connectAttr "finger_1_2_outJoint_decMat.os" "finger_1_2_outJoint.s";
connectAttr "finger_1_3_outJoint_decMat.ot" "finger_1_3_outJoint.t";
connectAttr "finger_1_3_outJoint_decMat.or" "finger_1_3_outJoint.r";
connectAttr "finger_1_3_outJoint_decMat.os" "finger_1_3_outJoint.s";
connectAttr "finger_1_4_outJoint_decMat.ot" "finger_1_4_outJoint.t";
connectAttr "finger_1_4_outJoint_decMat.or" "finger_1_4_outJoint.r";
connectAttr "finger_1_4_outJoint_decMat.os" "finger_1_4_outJoint.s";
connectAttr "finger_2_0_outJoint_decMat.ot" "finger_2_0_outJoint.t";
connectAttr "finger_2_0_outJoint_decMat.or" "finger_2_0_outJoint.r";
connectAttr "finger_2_0_outJoint_decMat.os" "finger_2_0_outJoint.s";
connectAttr "finger_2_1_outJoint_decMat.ot" "finger_2_1_outJoint.t";
connectAttr "finger_2_1_outJoint_decMat.or" "finger_2_1_outJoint.r";
connectAttr "finger_2_1_outJoint_decMat.os" "finger_2_1_outJoint.s";
connectAttr "finger_2_2_outJoint_decMat.ot" "finger_2_2_outJoint.t";
connectAttr "finger_2_2_outJoint_decMat.or" "finger_2_2_outJoint.r";
connectAttr "finger_2_2_outJoint_decMat.os" "finger_2_2_outJoint.s";
connectAttr "finger_2_3_outJoint_decMat.ot" "finger_2_3_outJoint.t";
connectAttr "finger_2_3_outJoint_decMat.or" "finger_2_3_outJoint.r";
connectAttr "finger_2_3_outJoint_decMat.os" "finger_2_3_outJoint.s";
connectAttr "finger_2_4_outJoint_decMat.ot" "finger_2_4_outJoint.t";
connectAttr "finger_2_4_outJoint_decMat.or" "finger_2_4_outJoint.r";
connectAttr "finger_2_4_outJoint_decMat.os" "finger_2_4_outJoint.s";
connectAttr "finger_3_0_outJoint_decMat.ot" "finger_3_0_outJoint.t";
connectAttr "finger_3_0_outJoint_decMat.or" "finger_3_0_outJoint.r";
connectAttr "finger_3_0_outJoint_decMat.os" "finger_3_0_outJoint.s";
connectAttr "finger_3_1_outJoint_decMat.ot" "finger_3_1_outJoint.t";
connectAttr "finger_3_1_outJoint_decMat.or" "finger_3_1_outJoint.r";
connectAttr "finger_3_1_outJoint_decMat.os" "finger_3_1_outJoint.s";
connectAttr "finger_3_2_outJoint_decMat.ot" "finger_3_2_outJoint.t";
connectAttr "finger_3_2_outJoint_decMat.or" "finger_3_2_outJoint.r";
connectAttr "finger_3_2_outJoint_decMat.os" "finger_3_2_outJoint.s";
connectAttr "finger_3_3_outJoint_decMat.ot" "finger_3_3_outJoint.t";
connectAttr "finger_3_3_outJoint_decMat.or" "finger_3_3_outJoint.r";
connectAttr "finger_3_3_outJoint_decMat.os" "finger_3_3_outJoint.s";
connectAttr "finger_3_4_outJoint_decMat.ot" "finger_3_4_outJoint.t";
connectAttr "finger_3_4_outJoint_decMat.or" "finger_3_4_outJoint.r";
connectAttr "finger_3_4_outJoint_decMat.os" "finger_3_4_outJoint.s";
connectAttr "finger_4_0_outJoint_decMat.ot" "finger_4_0_outJoint.t";
connectAttr "finger_4_0_outJoint_decMat.or" "finger_4_0_outJoint.r";
connectAttr "finger_4_0_outJoint_decMat.os" "finger_4_0_outJoint.s";
connectAttr "finger_4_1_outJoint_decMat.ot" "finger_4_1_outJoint.t";
connectAttr "finger_4_1_outJoint_decMat.or" "finger_4_1_outJoint.r";
connectAttr "finger_4_1_outJoint_decMat.os" "finger_4_1_outJoint.s";
connectAttr "finger_4_2_outJoint_decMat.ot" "finger_4_2_outJoint.t";
connectAttr "finger_4_2_outJoint_decMat.or" "finger_4_2_outJoint.r";
connectAttr "finger_4_2_outJoint_decMat.os" "finger_4_2_outJoint.s";
connectAttr "finger_4_3_outJoint_decMat.ot" "finger_4_3_outJoint.t";
connectAttr "finger_4_3_outJoint_decMat.or" "finger_4_3_outJoint.r";
connectAttr "finger_4_3_outJoint_decMat.os" "finger_4_3_outJoint.s";
connectAttr "finger_4_4_outJoint_decMat.ot" "finger_4_4_outJoint.t";
connectAttr "finger_4_4_outJoint_decMat.or" "finger_4_4_outJoint.r";
connectAttr "finger_4_4_outJoint_decMat.os" "finger_4_4_outJoint.s";
connectAttr "target.wm" "decomposeMatrix235.imat";
connectAttr "mod.ikFk" "reverse174.ix";
connectAttr "multMatrix161.o" "decomposeMatrix191.imat";
connectAttr "fk_connector.wm" "multMatrix161.i[0]";
connectAttr "fk_heel_group_2.pim" "multMatrix161.i[1]";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "composeMatrix2.omat" "multMatrix192.i[0]";
connectAttr "ik_connector.wm" "multMatrix192.i[1]";
connectAttr "ik_controls.wim" "multMatrix192.i[2]";
connectAttr "root_connector.wm" "decomposeMatrix238.imat";
connectAttr "root_connector.wm" "multMatrix193.i[0]";
connectAttr "fk_connector_init.pim" "multMatrix193.i[1]";
connectAttr "multMatrix193.o" "decomposeMatrix239.imat";
connectAttr "fk_toe.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_heel.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "fingers_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "ikFkSwitchSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "mirror_condition.ocr" "composeMatrix2.isx";
connectAttr "fk_toe.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "fk_heel.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_frontTip.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_backTip.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "foot_add.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "ik_foot.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "root_poserOrient.wm" "decomposeMatrix247.imat";
connectAttr "root_poser.wm" "ik_connector_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "ik_connector_multMatrix.i[1]";
connectAttr "ik_connector_multMatrix.o" "ik_connector_decMat.imat";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "decomposeMatrix238.osz" "multDoubleLinear1622.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear1622.i2";
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
connectAttr "multiplyDivide5.ox" "makeNurbSphere1.r";
connectAttr "multiplyDivide5.oy" "makeNurbSphere2.r";
connectAttr "multiplyDivide5.oz" "makeNurbSphere3.r";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i2x";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i2z";
connectAttr "root_poser.size" "multiplyDivide5.i1x";
connectAttr "finger_1_0_poser.size" "multiplyDivide5.i1y";
connectAttr "finger_1_1_poser.size" "multiplyDivide5.i1z";
connectAttr "mainPoser.size" "multDoubleLinear1627.i1";
connectAttr "mainPoser.globalSize" "multDoubleLinear1627.i2";
connectAttr "mainPoser.globalSize" "multDoubleLinear1628.i1";
connectAttr "mainPoser.lineWidth" "multDoubleLinear1628.i2";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "posers_curve_2Shape.ws" "sweepMeshCreator1.inCurveArray[1]";
connectAttr "multiplyDivide6.ox" "sweepMeshCreator1.scaleProfileX";
connectAttr "mainPoser_decomposeMatrix.osx" "multiplyDivide6.i1x";
connectAttr "multDoubleLinear1628.o" "multiplyDivide6.i2x";
connectAttr "finger_2_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_2_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_2_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_2_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_2_0_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_3_0_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_3_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_3_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_3_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_3_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_1_0_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_1_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_1_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_1_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_1_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_4_0_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_4_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_4_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_4_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "finger_4_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr ":lambert1.msg" "pasted__pasted__materialInfo1.m";
connectAttr "ik_foot.weight" "multDoubleLinear242.i2";
connectAttr "roll_front_2_remapValue.ov" "multDoubleLinear242.i1";
connectAttr "ik_foot.weight" "multDoubleLinear243.i2";
connectAttr "roll_front_3_remapValue.ov" "multDoubleLinear243.i1";
connectAttr "ik_foot.weight" "multDoubleLinear244.i2";
connectAttr "roll_front_4_remapValue.ov" "multDoubleLinear244.i1";
connectAttr "ik_foot.weight" "multDoubleLinear245.i2";
connectAttr "roll_back_4_remapValue.ov" "multDoubleLinear245.i1";
connectAttr "ik_foot.weight" "multDoubleLinear246.i2";
connectAttr "roll_back_3_remapValue.ov" "multDoubleLinear246.i1";
connectAttr "ik_foot.weight" "multDoubleLinear247.i2";
connectAttr "roll_back_2_remapValue.ov" "multDoubleLinear247.i1";
connectAttr "ik_foot.weight" "multDoubleLinear248.i2";
connectAttr "roll_front_1_remapValue.ov" "multDoubleLinear248.i1";
connectAttr "ik_foot.weight" "multDoubleLinear249.i2";
connectAttr "roll_back_1_remapValue.ov" "multDoubleLinear249.i1";
connectAttr "reverse42.ox" "multDoubleLinear250.i2";
connectAttr "setRange178.oy" "multDoubleLinear250.i1";
connectAttr "ik_foot.weight" "reverse42.ix";
connectAttr "reverse42.ox" "multDoubleLinear251.i2";
connectAttr "setRange180.oy" "multDoubleLinear251.i1";
connectAttr "mod.ikFk" "multDoubleLinear264.i1";
connectAttr "ik_foot.roll" "multDoubleLinear264.i2";
connectAttr "foot_fingers.spread" "unitConversion495.i";
connectAttr "foot_fingers.spread" "unitConversion496.i";
connectAttr "foot_fingers.middle" "unitConversion504.i";
connectAttr "foot_fingers.ring" "unitConversion505.i";
connectAttr "foot_fingers.back" "unitConversion508.i";
connectAttr "multDoubleLinear264.o" "setRange178.vx";
connectAttr "multDoubleLinear264.o" "setRange178.vy";
connectAttr "ik_foot.rollAngle" "setRange178.nx";
connectAttr "multDoubleLinear264.o" "setRange180.vx";
connectAttr "multDoubleLinear264.o" "setRange180.vy";
connectAttr "multDoubleLinear264.o" "setRange180.vz";
connectAttr "ik_foot.rollAngle" "setRange180.mx";
connectAttr "ik_foot.radius" "setRange180.omx";
connectAttr "foot_fingers.index" "unitConversion499.i";
connectAttr "fk_heel_out.wm" "blendMatrix5.imat";
connectAttr "ik_foot.wm" "blendMatrix5.tgt[0].tmat";
connectAttr "mod.ikFk" "blendMatrix5.env";
connectAttr "multDoubleLinear264.o" "roll_negative_multDL.i1";
connectAttr "ik_foot.radius" "roll_stage_bounds_a_multiplyDivide.i1x";
connectAttr "ik_foot.radius" "roll_stage_bounds_a_multiplyDivide.i1y";
connectAttr "ik_foot.radius" "roll_stage_bounds_a_multiplyDivide.i1z";
connectAttr "ik_foot.radius" "roll_stage_bounds_b_multiplyDivide.i1x";
connectAttr "ik_foot.radius" "roll_stage_bounds_b_multiplyDivide.i1y";
connectAttr "multDoubleLinear264.o" "roll_front_4_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.oy" "roll_front_4_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_front_4_remapValue.omx";
connectAttr "multDoubleLinear264.o" "roll_front_3_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.ox" "roll_front_3_remapValue.imn"
		;
connectAttr "roll_stage_bounds_a_multiplyDivide.oz" "roll_front_3_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_front_3_remapValue.omx";
connectAttr "multDoubleLinear264.o" "roll_front_2_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.oy" "roll_front_2_remapValue.imn"
		;
connectAttr "roll_stage_bounds_b_multiplyDivide.ox" "roll_front_2_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_front_2_remapValue.omx";
connectAttr "multDoubleLinear264.o" "roll_front_1_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.oz" "roll_front_1_remapValue.imn"
		;
connectAttr "roll_stage_bounds_b_multiplyDivide.oy" "roll_front_1_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_front_1_remapValue.omx";
connectAttr "roll_negative_multDL.o" "roll_back_4_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.oy" "roll_back_4_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_back_4_remapValue.omx";
connectAttr "roll_negative_multDL.o" "roll_back_3_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.ox" "roll_back_3_remapValue.imn"
		;
connectAttr "roll_stage_bounds_a_multiplyDivide.oz" "roll_back_3_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_back_3_remapValue.omx";
connectAttr "roll_negative_multDL.o" "roll_back_2_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.oy" "roll_back_2_remapValue.imn"
		;
connectAttr "roll_stage_bounds_b_multiplyDivide.ox" "roll_back_2_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_back_2_remapValue.omx";
connectAttr "roll_negative_multDL.o" "roll_back_1_remapValue.i";
connectAttr "roll_stage_bounds_a_multiplyDivide.oz" "roll_back_1_remapValue.imn"
		;
connectAttr "roll_stage_bounds_b_multiplyDivide.oy" "roll_back_1_remapValue.imx"
		;
connectAttr "ik_foot.rollAngle" "roll_back_1_remapValue.omx";
connectAttr "ik_foot.holdFingers" "roll_holdFingers_reverse.ix";
connectAttr "multDoubleLinear250.o" "roll_back_total_sum.i1[0]";
connectAttr "multDoubleLinear249.o" "roll_back_total_sum.i1[1]";
connectAttr "multDoubleLinear247.o" "roll_back_total_sum.i1[2]";
connectAttr "multDoubleLinear246.o" "roll_back_total_sum.i1[3]";
connectAttr "multDoubleLinear245.o" "roll_back_total_sum.i1[4]";
connectAttr "multDoubleLinear250.o" "roll_back_rigid_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_back_rigid_free_multDL.i2";
connectAttr "multDoubleLinear249.o" "roll_back_1_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_back_1_free_multDL.i2";
connectAttr "multDoubleLinear247.o" "roll_back_2_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_back_2_free_multDL.i2";
connectAttr "multDoubleLinear246.o" "roll_back_3_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_back_3_free_multDL.i2";
connectAttr "multDoubleLinear245.o" "roll_back_4_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_back_4_free_multDL.i2";
connectAttr "roll_back_total_sum.o1" "roll_back_5_hold_multDL.i1";
connectAttr "ik_foot.holdFingers" "roll_back_5_hold_multDL.i2";
connectAttr "multDoubleLinear251.o" "roll_front_total_sum.i1[0]";
connectAttr "multDoubleLinear248.o" "roll_front_total_sum.i1[1]";
connectAttr "multDoubleLinear242.o" "roll_front_total_sum.i1[2]";
connectAttr "multDoubleLinear243.o" "roll_front_total_sum.i1[3]";
connectAttr "multDoubleLinear244.o" "roll_front_total_sum.i1[4]";
connectAttr "multDoubleLinear251.o" "roll_front_rigid_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_front_rigid_free_multDL.i2";
connectAttr "multDoubleLinear248.o" "roll_front_1_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_front_1_free_multDL.i2";
connectAttr "multDoubleLinear242.o" "roll_front_2_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_front_2_free_multDL.i2";
connectAttr "multDoubleLinear243.o" "roll_front_3_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_front_3_free_multDL.i2";
connectAttr "multDoubleLinear244.o" "roll_front_4_free_multDL.i1";
connectAttr "roll_holdFingers_reverse.ox" "roll_front_4_free_multDL.i2";
connectAttr "roll_front_total_sum.o1" "roll_front_5_hold_multDL.i1";
connectAttr "ik_foot.holdFingers" "roll_front_5_hold_multDL.i2";
connectAttr "ik_backTip_initLoc.wm" "ik_backTip_group_multMat.i[0]";
connectAttr "ik_foot_initLoc.wim" "ik_backTip_group_multMat.i[1]";
connectAttr "roll_back_1_initLoc.wm" "roll_back_rigid_multMat.i[0]";
connectAttr "ik_backTip_initLoc.wim" "roll_back_rigid_multMat.i[1]";
connectAttr "roll_back_rigid_free_multDL.o" "unitConversion1964.i";
connectAttr "roll_back_1_free_multDL.o" "unitConversion1965.i";
connectAttr "roll_back_2_initLoc.wm" "roll_back_2_multMat.i[0]";
connectAttr "roll_back_1_initLoc.wim" "roll_back_2_multMat.i[1]";
connectAttr "roll_back_2_free_multDL.o" "unitConversion1966.i";
connectAttr "roll_back_3_initLoc.wm" "roll_back_3_multMat.i[0]";
connectAttr "roll_back_2_initLoc.wim" "roll_back_3_multMat.i[1]";
connectAttr "roll_back_3_free_multDL.o" "unitConversion1967.i";
connectAttr "roll_back_4_initLoc.wm" "roll_back_4_multMat.i[0]";
connectAttr "roll_back_3_initLoc.wim" "roll_back_4_multMat.i[1]";
connectAttr "roll_back_4_free_multDL.o" "unitConversion1968.i";
connectAttr "roll_back_5_initLoc.wm" "roll_back_5_multMat.i[0]";
connectAttr "roll_back_4_initLoc.wim" "roll_back_5_multMat.i[1]";
connectAttr "roll_back_5_hold_multDL.o" "unitConversion1969.i";
connectAttr "ik_frontTip_initLoc.wm" "ik_frontTip_group_multMat.i[0]";
connectAttr "roll_back_5_initLoc.wim" "ik_frontTip_group_multMat.i[1]";
connectAttr "roll_front_1_initLoc.wm" "roll_front_rigid_multMat.i[0]";
connectAttr "ik_frontTip_initLoc.wim" "roll_front_rigid_multMat.i[1]";
connectAttr "roll_front_rigid_free_multDL.o" "unitConversion1970.i";
connectAttr "roll_front_1_free_multDL.o" "unitConversion1971.i";
connectAttr "roll_front_2_initLoc.wm" "roll_front_2_multMat.i[0]";
connectAttr "roll_front_1_initLoc.wim" "roll_front_2_multMat.i[1]";
connectAttr "roll_front_2_free_multDL.o" "unitConversion1972.i";
connectAttr "roll_front_3_initLoc.wm" "roll_front_3_multMat.i[0]";
connectAttr "roll_front_2_initLoc.wim" "roll_front_3_multMat.i[1]";
connectAttr "roll_front_3_free_multDL.o" "unitConversion1973.i";
connectAttr "roll_front_4_initLoc.wm" "roll_front_4_multMat.i[0]";
connectAttr "roll_front_3_initLoc.wim" "roll_front_4_multMat.i[1]";
connectAttr "roll_front_4_free_multDL.o" "unitConversion1974.i";
connectAttr "roll_front_5_initLoc.wm" "roll_front_5_multMat.i[0]";
connectAttr "roll_front_4_initLoc.wim" "roll_front_5_multMat.i[1]";
connectAttr "roll_front_5_hold_multDL.o" "unitConversion1975.i";
connectAttr "ik_foot_initLoc.wm" "roll_center_multMat.i[0]";
connectAttr "roll_front_5_initLoc.wim" "roll_center_multMat.i[1]";
connectAttr "root_poser.wm" "finger_controls_multMat.i[0]";
connectAttr "ik_foot_initLoc.wim" "finger_controls_multMat.i[1]";
connectAttr "front_fingers_holdLoc.wm" "front_fingers_holdGroup_multMat.i[0]";
connectAttr "root_poser.wim" "front_fingers_holdGroup_multMat.i[1]";
connectAttr "back_fingers_holdLoc.wm" "back_fingers_holdGroup_multMat.i[0]";
connectAttr "root_poser.wim" "back_fingers_holdGroup_multMat.i[1]";
connectAttr "finger_1_0_rollLoc.wm" "finger_1_0_group_multMat.i[0]";
connectAttr "front_fingers_holdLoc.wim" "finger_1_0_group_multMat.i[1]";
connectAttr "finger_1_0_iniLoc.wm" "finger_1_0_bendGroup_multMat.i[0]";
connectAttr "finger_1_0_rollLoc.wim" "finger_1_0_bendGroup_multMat.i[1]";
connectAttr "finger_1_1_rollLoc.wm" "finger_1_1_group_multMat.i[0]";
connectAttr "finger_1_0_iniLoc.wim" "finger_1_1_group_multMat.i[1]";
connectAttr "finger_1_1_iniLoc.wm" "finger_1_1_bendGroup_multMat.i[0]";
connectAttr "finger_1_1_rollLoc.wim" "finger_1_1_bendGroup_multMat.i[1]";
connectAttr "finger_1_2_rollLoc.wm" "finger_1_2_group_multMat.i[0]";
connectAttr "finger_1_1_iniLoc.wim" "finger_1_2_group_multMat.i[1]";
connectAttr "finger_1_2_iniLoc.wm" "finger_1_2_bendGroup_multMat.i[0]";
connectAttr "finger_1_2_rollLoc.wim" "finger_1_2_bendGroup_multMat.i[1]";
connectAttr "finger_1_3_rollLoc.wm" "finger_1_3_group_multMat.i[0]";
connectAttr "finger_1_2_iniLoc.wim" "finger_1_3_group_multMat.i[1]";
connectAttr "finger_1_3_iniLoc.wm" "finger_1_3_bendGroup_multMat.i[0]";
connectAttr "finger_1_3_rollLoc.wim" "finger_1_3_bendGroup_multMat.i[1]";
connectAttr "finger_1_4_rollLoc.wm" "finger_1_4_group_multMat.i[0]";
connectAttr "finger_1_3_iniLoc.wim" "finger_1_4_group_multMat.i[1]";
connectAttr "finger_1_4_iniLoc.wm" "finger_1_4_bendGroup_multMat.i[0]";
connectAttr "finger_1_4_rollLoc.wim" "finger_1_4_bendGroup_multMat.i[1]";
connectAttr "finger_2_0_rollLoc.wm" "finger_2_0_group_multMat.i[0]";
connectAttr "front_fingers_holdLoc.wim" "finger_2_0_group_multMat.i[1]";
connectAttr "finger_2_0_iniLoc.wm" "finger_2_0_bendGroup_multMat.i[0]";
connectAttr "finger_2_0_rollLoc.wim" "finger_2_0_bendGroup_multMat.i[1]";
connectAttr "finger_2_1_rollLoc.wm" "finger_2_1_group_multMat.i[0]";
connectAttr "finger_2_0_iniLoc.wim" "finger_2_1_group_multMat.i[1]";
connectAttr "finger_2_1_iniLoc.wm" "finger_2_1_bendGroup_multMat.i[0]";
connectAttr "finger_2_1_rollLoc.wim" "finger_2_1_bendGroup_multMat.i[1]";
connectAttr "finger_2_2_rollLoc.wm" "finger_2_2_group_multMat.i[0]";
connectAttr "finger_2_1_iniLoc.wim" "finger_2_2_group_multMat.i[1]";
connectAttr "finger_2_2_iniLoc.wm" "finger_2_2_bendGroup_multMat.i[0]";
connectAttr "finger_2_2_rollLoc.wim" "finger_2_2_bendGroup_multMat.i[1]";
connectAttr "finger_2_3_rollLoc.wm" "finger_2_3_group_multMat.i[0]";
connectAttr "finger_2_2_iniLoc.wim" "finger_2_3_group_multMat.i[1]";
connectAttr "finger_2_3_iniLoc.wm" "finger_2_3_bendGroup_multMat.i[0]";
connectAttr "finger_2_3_rollLoc.wim" "finger_2_3_bendGroup_multMat.i[1]";
connectAttr "finger_2_4_rollLoc.wm" "finger_2_4_group_multMat.i[0]";
connectAttr "finger_2_3_iniLoc.wim" "finger_2_4_group_multMat.i[1]";
connectAttr "finger_2_4_iniLoc.wm" "finger_2_4_bendGroup_multMat.i[0]";
connectAttr "finger_2_4_rollLoc.wim" "finger_2_4_bendGroup_multMat.i[1]";
connectAttr "finger_3_0_rollLoc.wm" "finger_3_0_group_multMat.i[0]";
connectAttr "front_fingers_holdLoc.wim" "finger_3_0_group_multMat.i[1]";
connectAttr "finger_3_0_iniLoc.wm" "finger_3_0_bendGroup_multMat.i[0]";
connectAttr "finger_3_0_rollLoc.wim" "finger_3_0_bendGroup_multMat.i[1]";
connectAttr "finger_3_1_rollLoc.wm" "finger_3_1_group_multMat.i[0]";
connectAttr "finger_3_0_iniLoc.wim" "finger_3_1_group_multMat.i[1]";
connectAttr "finger_3_1_iniLoc.wm" "finger_3_1_bendGroup_multMat.i[0]";
connectAttr "finger_3_1_rollLoc.wim" "finger_3_1_bendGroup_multMat.i[1]";
connectAttr "finger_3_2_rollLoc.wm" "finger_3_2_group_multMat.i[0]";
connectAttr "finger_3_1_iniLoc.wim" "finger_3_2_group_multMat.i[1]";
connectAttr "finger_3_2_iniLoc.wm" "finger_3_2_bendGroup_multMat.i[0]";
connectAttr "finger_3_2_rollLoc.wim" "finger_3_2_bendGroup_multMat.i[1]";
connectAttr "finger_3_3_rollLoc.wm" "finger_3_3_group_multMat.i[0]";
connectAttr "finger_3_2_iniLoc.wim" "finger_3_3_group_multMat.i[1]";
connectAttr "finger_3_3_iniLoc.wm" "finger_3_3_bendGroup_multMat.i[0]";
connectAttr "finger_3_3_rollLoc.wim" "finger_3_3_bendGroup_multMat.i[1]";
connectAttr "finger_3_4_rollLoc.wm" "finger_3_4_group_multMat.i[0]";
connectAttr "finger_3_3_iniLoc.wim" "finger_3_4_group_multMat.i[1]";
connectAttr "finger_3_4_iniLoc.wm" "finger_3_4_bendGroup_multMat.i[0]";
connectAttr "finger_3_4_rollLoc.wim" "finger_3_4_bendGroup_multMat.i[1]";
connectAttr "finger_4_0_rollLoc.wm" "finger_4_0_group_multMat.i[0]";
connectAttr "back_fingers_holdLoc.wim" "finger_4_0_group_multMat.i[1]";
connectAttr "finger_4_0_iniLoc.wm" "finger_4_0_bendGroup_multMat.i[0]";
connectAttr "finger_4_0_rollLoc.wim" "finger_4_0_bendGroup_multMat.i[1]";
connectAttr "finger_4_1_rollLoc.wm" "finger_4_1_group_multMat.i[0]";
connectAttr "finger_4_0_iniLoc.wim" "finger_4_1_group_multMat.i[1]";
connectAttr "finger_4_1_iniLoc.wm" "finger_4_1_bendGroup_multMat.i[0]";
connectAttr "finger_4_1_rollLoc.wim" "finger_4_1_bendGroup_multMat.i[1]";
connectAttr "finger_4_2_rollLoc.wm" "finger_4_2_group_multMat.i[0]";
connectAttr "finger_4_1_iniLoc.wim" "finger_4_2_group_multMat.i[1]";
connectAttr "finger_4_2_iniLoc.wm" "finger_4_2_bendGroup_multMat.i[0]";
connectAttr "finger_4_2_rollLoc.wim" "finger_4_2_bendGroup_multMat.i[1]";
connectAttr "finger_4_3_rollLoc.wm" "finger_4_3_group_multMat.i[0]";
connectAttr "finger_4_2_iniLoc.wim" "finger_4_3_group_multMat.i[1]";
connectAttr "finger_4_3_iniLoc.wm" "finger_4_3_bendGroup_multMat.i[0]";
connectAttr "finger_4_3_rollLoc.wim" "finger_4_3_bendGroup_multMat.i[1]";
connectAttr "finger_4_4_rollLoc.wm" "finger_4_4_group_multMat.i[0]";
connectAttr "finger_4_3_iniLoc.wim" "finger_4_4_group_multMat.i[1]";
connectAttr "finger_4_4_iniLoc.wm" "finger_4_4_bendGroup_multMat.i[0]";
connectAttr "finger_4_4_rollLoc.wim" "finger_4_4_bendGroup_multMat.i[1]";
connectAttr "root_outJoint_multMat.o" "root_outJoint_decMat.imat";
connectAttr "finger_controls.wm" "root_outJoint_multMat.i[0]";
connectAttr "outJoints.wim" "root_outJoint_multMat.i[1]";
connectAttr "finger_1_0_outJoint_multMat.o" "finger_1_0_outJoint_decMat.imat";
connectAttr "finger_1_0.m" "finger_1_0_outJoint_multMat.i[0]";
connectAttr "finger_1_0_bendGroup.m" "finger_1_0_outJoint_multMat.i[1]";
connectAttr "finger_1_0_bendGroup.opm" "finger_1_0_outJoint_multMat.i[2]";
connectAttr "finger_1_0_group.m" "finger_1_0_outJoint_multMat.i[3]";
connectAttr "finger_1_0_group.opm" "finger_1_0_outJoint_multMat.i[4]";
connectAttr "front_fingers_holdGroup.m" "finger_1_0_outJoint_multMat.i[5]";
connectAttr "front_fingers_holdGroup.opm" "finger_1_0_outJoint_multMat.i[6]";
connectAttr "finger_1_1_outJoint_multMat.o" "finger_1_1_outJoint_decMat.imat";
connectAttr "finger_1_1.m" "finger_1_1_outJoint_multMat.i[0]";
connectAttr "finger_1_1_bendGroup.m" "finger_1_1_outJoint_multMat.i[1]";
connectAttr "finger_1_1_bendGroup.opm" "finger_1_1_outJoint_multMat.i[2]";
connectAttr "finger_1_1_group.m" "finger_1_1_outJoint_multMat.i[3]";
connectAttr "finger_1_1_group.opm" "finger_1_1_outJoint_multMat.i[4]";
connectAttr "finger_1_2_outJoint_multMat.o" "finger_1_2_outJoint_decMat.imat";
connectAttr "finger_1_2.m" "finger_1_2_outJoint_multMat.i[0]";
connectAttr "finger_1_2_bendGroup.m" "finger_1_2_outJoint_multMat.i[1]";
connectAttr "finger_1_2_bendGroup.opm" "finger_1_2_outJoint_multMat.i[2]";
connectAttr "finger_1_2_group.m" "finger_1_2_outJoint_multMat.i[3]";
connectAttr "finger_1_2_group.opm" "finger_1_2_outJoint_multMat.i[4]";
connectAttr "finger_1_3_outJoint_multMat.o" "finger_1_3_outJoint_decMat.imat";
connectAttr "finger_1_3.m" "finger_1_3_outJoint_multMat.i[0]";
connectAttr "finger_1_3_bendGroup.m" "finger_1_3_outJoint_multMat.i[1]";
connectAttr "finger_1_3_bendGroup.opm" "finger_1_3_outJoint_multMat.i[2]";
connectAttr "finger_1_3_group.m" "finger_1_3_outJoint_multMat.i[3]";
connectAttr "finger_1_3_group.opm" "finger_1_3_outJoint_multMat.i[4]";
connectAttr "finger_1_4_outJoint_multMat.o" "finger_1_4_outJoint_decMat.imat";
connectAttr "finger_1_4.m" "finger_1_4_outJoint_multMat.i[0]";
connectAttr "finger_1_4_bendGroup.m" "finger_1_4_outJoint_multMat.i[1]";
connectAttr "finger_1_4_bendGroup.opm" "finger_1_4_outJoint_multMat.i[2]";
connectAttr "finger_1_4_group.m" "finger_1_4_outJoint_multMat.i[3]";
connectAttr "finger_1_4_group.opm" "finger_1_4_outJoint_multMat.i[4]";
connectAttr "finger_2_0_outJoint_multMat.o" "finger_2_0_outJoint_decMat.imat";
connectAttr "finger_2_0.m" "finger_2_0_outJoint_multMat.i[0]";
connectAttr "finger_2_0_bendGroup.m" "finger_2_0_outJoint_multMat.i[1]";
connectAttr "finger_2_0_bendGroup.opm" "finger_2_0_outJoint_multMat.i[2]";
connectAttr "finger_2_0_group.m" "finger_2_0_outJoint_multMat.i[3]";
connectAttr "finger_2_0_group.opm" "finger_2_0_outJoint_multMat.i[4]";
connectAttr "front_fingers_holdGroup.m" "finger_2_0_outJoint_multMat.i[5]";
connectAttr "front_fingers_holdGroup.opm" "finger_2_0_outJoint_multMat.i[6]";
connectAttr "finger_2_1_outJoint_multMat.o" "finger_2_1_outJoint_decMat.imat";
connectAttr "finger_2_1.m" "finger_2_1_outJoint_multMat.i[0]";
connectAttr "finger_2_1_bendGroup.m" "finger_2_1_outJoint_multMat.i[1]";
connectAttr "finger_2_1_bendGroup.opm" "finger_2_1_outJoint_multMat.i[2]";
connectAttr "finger_2_1_group.m" "finger_2_1_outJoint_multMat.i[3]";
connectAttr "finger_2_1_group.opm" "finger_2_1_outJoint_multMat.i[4]";
connectAttr "finger_2_2_outJoint_multMat.o" "finger_2_2_outJoint_decMat.imat";
connectAttr "finger_2_2.m" "finger_2_2_outJoint_multMat.i[0]";
connectAttr "finger_2_2_bendGroup.m" "finger_2_2_outJoint_multMat.i[1]";
connectAttr "finger_2_2_bendGroup.opm" "finger_2_2_outJoint_multMat.i[2]";
connectAttr "finger_2_2_group.m" "finger_2_2_outJoint_multMat.i[3]";
connectAttr "finger_2_2_group.opm" "finger_2_2_outJoint_multMat.i[4]";
connectAttr "finger_2_3_outJoint_multMat.o" "finger_2_3_outJoint_decMat.imat";
connectAttr "finger_2_3.m" "finger_2_3_outJoint_multMat.i[0]";
connectAttr "finger_2_3_bendGroup.m" "finger_2_3_outJoint_multMat.i[1]";
connectAttr "finger_2_3_bendGroup.opm" "finger_2_3_outJoint_multMat.i[2]";
connectAttr "finger_2_3_group.m" "finger_2_3_outJoint_multMat.i[3]";
connectAttr "finger_2_3_group.opm" "finger_2_3_outJoint_multMat.i[4]";
connectAttr "finger_2_4_outJoint_multMat.o" "finger_2_4_outJoint_decMat.imat";
connectAttr "finger_2_4.m" "finger_2_4_outJoint_multMat.i[0]";
connectAttr "finger_2_4_bendGroup.m" "finger_2_4_outJoint_multMat.i[1]";
connectAttr "finger_2_4_bendGroup.opm" "finger_2_4_outJoint_multMat.i[2]";
connectAttr "finger_2_4_group.m" "finger_2_4_outJoint_multMat.i[3]";
connectAttr "finger_2_4_group.opm" "finger_2_4_outJoint_multMat.i[4]";
connectAttr "finger_3_0_outJoint_multMat.o" "finger_3_0_outJoint_decMat.imat";
connectAttr "finger_3_0.m" "finger_3_0_outJoint_multMat.i[0]";
connectAttr "finger_3_0_bendGroup.m" "finger_3_0_outJoint_multMat.i[1]";
connectAttr "finger_3_0_bendGroup.opm" "finger_3_0_outJoint_multMat.i[2]";
connectAttr "finger_3_0_group.m" "finger_3_0_outJoint_multMat.i[3]";
connectAttr "finger_3_0_group.opm" "finger_3_0_outJoint_multMat.i[4]";
connectAttr "front_fingers_holdGroup.m" "finger_3_0_outJoint_multMat.i[5]";
connectAttr "front_fingers_holdGroup.opm" "finger_3_0_outJoint_multMat.i[6]";
connectAttr "finger_3_1_outJoint_multMat.o" "finger_3_1_outJoint_decMat.imat";
connectAttr "finger_3_1.m" "finger_3_1_outJoint_multMat.i[0]";
connectAttr "finger_3_1_bendGroup.m" "finger_3_1_outJoint_multMat.i[1]";
connectAttr "finger_3_1_bendGroup.opm" "finger_3_1_outJoint_multMat.i[2]";
connectAttr "finger_3_1_group.m" "finger_3_1_outJoint_multMat.i[3]";
connectAttr "finger_3_1_group.opm" "finger_3_1_outJoint_multMat.i[4]";
connectAttr "finger_3_2_outJoint_multMat.o" "finger_3_2_outJoint_decMat.imat";
connectAttr "finger_3_2.m" "finger_3_2_outJoint_multMat.i[0]";
connectAttr "finger_3_2_bendGroup.m" "finger_3_2_outJoint_multMat.i[1]";
connectAttr "finger_3_2_bendGroup.opm" "finger_3_2_outJoint_multMat.i[2]";
connectAttr "finger_3_2_group.m" "finger_3_2_outJoint_multMat.i[3]";
connectAttr "finger_3_2_group.opm" "finger_3_2_outJoint_multMat.i[4]";
connectAttr "finger_3_3_outJoint_multMat.o" "finger_3_3_outJoint_decMat.imat";
connectAttr "finger_3_3.m" "finger_3_3_outJoint_multMat.i[0]";
connectAttr "finger_3_3_bendGroup.m" "finger_3_3_outJoint_multMat.i[1]";
connectAttr "finger_3_3_bendGroup.opm" "finger_3_3_outJoint_multMat.i[2]";
connectAttr "finger_3_3_group.m" "finger_3_3_outJoint_multMat.i[3]";
connectAttr "finger_3_3_group.opm" "finger_3_3_outJoint_multMat.i[4]";
connectAttr "finger_3_4_outJoint_multMat.o" "finger_3_4_outJoint_decMat.imat";
connectAttr "finger_3_4.m" "finger_3_4_outJoint_multMat.i[0]";
connectAttr "finger_3_4_bendGroup.m" "finger_3_4_outJoint_multMat.i[1]";
connectAttr "finger_3_4_bendGroup.opm" "finger_3_4_outJoint_multMat.i[2]";
connectAttr "finger_3_4_group.m" "finger_3_4_outJoint_multMat.i[3]";
connectAttr "finger_3_4_group.opm" "finger_3_4_outJoint_multMat.i[4]";
connectAttr "finger_4_0_outJoint_multMat.o" "finger_4_0_outJoint_decMat.imat";
connectAttr "finger_4_0.m" "finger_4_0_outJoint_multMat.i[0]";
connectAttr "finger_4_0_bendGroup.m" "finger_4_0_outJoint_multMat.i[1]";
connectAttr "finger_4_0_bendGroup.opm" "finger_4_0_outJoint_multMat.i[2]";
connectAttr "finger_4_0_group.m" "finger_4_0_outJoint_multMat.i[3]";
connectAttr "finger_4_0_group.opm" "finger_4_0_outJoint_multMat.i[4]";
connectAttr "back_fingers_holdGroup.m" "finger_4_0_outJoint_multMat.i[5]";
connectAttr "back_fingers_holdGroup.opm" "finger_4_0_outJoint_multMat.i[6]";
connectAttr "finger_4_1_outJoint_multMat.o" "finger_4_1_outJoint_decMat.imat";
connectAttr "finger_4_1.m" "finger_4_1_outJoint_multMat.i[0]";
connectAttr "finger_4_1_bendGroup.m" "finger_4_1_outJoint_multMat.i[1]";
connectAttr "finger_4_1_bendGroup.opm" "finger_4_1_outJoint_multMat.i[2]";
connectAttr "finger_4_1_group.m" "finger_4_1_outJoint_multMat.i[3]";
connectAttr "finger_4_1_group.opm" "finger_4_1_outJoint_multMat.i[4]";
connectAttr "finger_4_2_outJoint_multMat.o" "finger_4_2_outJoint_decMat.imat";
connectAttr "finger_4_2.m" "finger_4_2_outJoint_multMat.i[0]";
connectAttr "finger_4_2_bendGroup.m" "finger_4_2_outJoint_multMat.i[1]";
connectAttr "finger_4_2_bendGroup.opm" "finger_4_2_outJoint_multMat.i[2]";
connectAttr "finger_4_2_group.m" "finger_4_2_outJoint_multMat.i[3]";
connectAttr "finger_4_2_group.opm" "finger_4_2_outJoint_multMat.i[4]";
connectAttr "finger_4_3_outJoint_multMat.o" "finger_4_3_outJoint_decMat.imat";
connectAttr "finger_4_3.m" "finger_4_3_outJoint_multMat.i[0]";
connectAttr "finger_4_3_bendGroup.m" "finger_4_3_outJoint_multMat.i[1]";
connectAttr "finger_4_3_bendGroup.opm" "finger_4_3_outJoint_multMat.i[2]";
connectAttr "finger_4_3_group.m" "finger_4_3_outJoint_multMat.i[3]";
connectAttr "finger_4_3_group.opm" "finger_4_3_outJoint_multMat.i[4]";
connectAttr "finger_4_4_outJoint_multMat.o" "finger_4_4_outJoint_decMat.imat";
connectAttr "finger_4_4.m" "finger_4_4_outJoint_multMat.i[0]";
connectAttr "finger_4_4_bendGroup.m" "finger_4_4_outJoint_multMat.i[1]";
connectAttr "finger_4_4_bendGroup.opm" "finger_4_4_outJoint_multMat.i[2]";
connectAttr "finger_4_4_group.m" "finger_4_4_outJoint_multMat.i[3]";
connectAttr "finger_4_4_group.opm" "finger_4_4_outJoint_multMat.i[4]";
connectAttr "ik_foot.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "foot_add.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "foot_fingers.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_backTip.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_frontTip.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "finger_1_moduleControlSet.msg" "fingers_moduleControlSet.dnsm" -na;
connectAttr "finger_2_moduleControlSet.msg" "fingers_moduleControlSet.dnsm" -na;
connectAttr "finger_3_moduleControlSet.msg" "fingers_moduleControlSet.dnsm" -na;
connectAttr "finger_4_moduleControlSet.msg" "fingers_moduleControlSet.dnsm" -na;
connectAttr "finger_1_0.iog" "finger_1_moduleControlSet.dsm" -na;
connectAttr "finger_1_1.iog" "finger_1_moduleControlSet.dsm" -na;
connectAttr "finger_1_2.iog" "finger_1_moduleControlSet.dsm" -na;
connectAttr "finger_1_3.iog" "finger_1_moduleControlSet.dsm" -na;
connectAttr "finger_1_4.iog" "finger_1_moduleControlSet.dsm" -na;
connectAttr "finger_2_0.iog" "finger_2_moduleControlSet.dsm" -na;
connectAttr "finger_2_1.iog" "finger_2_moduleControlSet.dsm" -na;
connectAttr "finger_2_2.iog" "finger_2_moduleControlSet.dsm" -na;
connectAttr "finger_2_3.iog" "finger_2_moduleControlSet.dsm" -na;
connectAttr "finger_2_4.iog" "finger_2_moduleControlSet.dsm" -na;
connectAttr "finger_3_0.iog" "finger_3_moduleControlSet.dsm" -na;
connectAttr "finger_3_1.iog" "finger_3_moduleControlSet.dsm" -na;
connectAttr "finger_3_2.iog" "finger_3_moduleControlSet.dsm" -na;
connectAttr "finger_3_3.iog" "finger_3_moduleControlSet.dsm" -na;
connectAttr "finger_3_4.iog" "finger_3_moduleControlSet.dsm" -na;
connectAttr "finger_4_0.iog" "finger_4_moduleControlSet.dsm" -na;
connectAttr "finger_4_1.iog" "finger_4_moduleControlSet.dsm" -na;
connectAttr "finger_4_2.iog" "finger_4_moduleControlSet.dsm" -na;
connectAttr "finger_4_3.iog" "finger_4_moduleControlSet.dsm" -na;
connectAttr "finger_4_4.iog" "finger_4_moduleControlSet.dsm" -na;
connectAttr "posers_sweepShape.iog" "black_rsSG.dsm" -na;
connectAttr "posers_sweep_2Shape.iog" "black_rsSG.dsm" -na;
connectAttr "black_rsSG.msg" "materialInfo1.sg";
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "decomposeMatrix191.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse174.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix235.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix238.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix239.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix247.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ik_connector_decMat.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mainPoser_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1622.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1627.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1628.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear264.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange178.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange180.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=NodeProfileStruct:string=NodeProfileTag:int32=NodeProfileTagColor";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
// End of birdFoot1.ma
