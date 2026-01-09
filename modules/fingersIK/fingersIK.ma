//Maya ASCII 2022 scene
//Name: fingersIK.ma
//Last modified: Sun, Jan 04, 2026 07:58:34 AM
//Codeset: 1251
requires maya "2022";
requires -nodeType "inverseMatrix" "matrixNodes" "1.0";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "0AEA61E7-4C1F-236E-8272-8E85FB20B2F8";
createNode transform -n "mod";
	rename -uid "AEB94CF3-4469-D7D9-6076-95A1B694D245";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "ikFk" -ln "ikFk" -min 0 -max 1 -at "double";
	setAttr -l on ".version" -type "string" "1.0";
	setAttr -k on ".ikFk" 1;
createNode transform -n "posers" -p "mod";
	rename -uid "D7853ADA-49F6-897E-4F12-E7AC1BAA48B4";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "F0F00D91-4B38-ECC4-B2EA-E083C23249F2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "closed" -ln "closed" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "spread" -ln "spread" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -k on ".globalSize" 0.1;
	setAttr -k on ".lineSize" 0.1;
	setAttr -cb on ".closed";
	setAttr -cb on ".spread";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "0232B045-4B74-84F0-DFB3-BEAA77AFD825";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "EB14F3BF-4740-E797-AEEF-34B3A2F3B2AF";
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
	rename -uid "0D669623-4EB6-3FF2-21A6-A6947176D25F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "";
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "19A500E1-4653-D9E4-0C35-BD9F9B981FF9";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "thumbFinger_mainPoser" -p "mainPoser";
	rename -uid "BC63EDC4-41E3-327D-C2C9-179CF2EE6E29";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.28812560489975525 0 0.48826241970730738 ;
	setAttr ".r" -type "double3" 39.423518114671246 -45.000000000000114 -2.2489917831974772e-15 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode nurbsCurve -n "thumbFinger_mainPoserShape" -p "thumbFinger_mainPoser";
	rename -uid "E9EAE87B-4381-560A-71BD-2CB84008D3A4";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "thumbFinger_mainPoserShapeOrig" -p "thumbFinger_mainPoser";
	rename -uid "F4752012-4499-3F5E-6418-0E986E81ECBB";
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
createNode transform -n "thumbFinger_mainPoser_clusterHandle" -p "thumbFinger_mainPoser";
	rename -uid "067DCC1D-4E32-25D0-3EA5-80BC432E0DE8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode clusterHandle -n "thumbFinger_mainPoser_clusterHandleShape" -p "thumbFinger_mainPoser_clusterHandle";
	rename -uid "769740C8-46FA-8B14-E5BA-FFB06D7BB19A";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "thumbFingerA_poser" -p "thumbFinger_mainPoser";
	rename -uid "7D77BF3F-4F59-D8A4-444D-D9B1FC58D857";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "thumbFingerA";
createNode nurbsSurface -n "thumbFingerA_poserShape" -p "thumbFingerA_poser";
	rename -uid "61298ADD-47F5-F360-3B93-1A879DE3B733";
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
createNode locator -n "thumbFingerA_poser_locShape" -p "thumbFingerA_poser";
	rename -uid "93B8ADB5-400D-CF8F-C142-9FB2FF4D1BB0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerA_poserOrient" -p "thumbFingerA_poser";
	rename -uid "4F784EE3-482D-9C07-A4EE-A68615568B11";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerA";
createNode locator -n "thumbFingerA_poserOrientShape" -p "thumbFingerA_poserOrient";
	rename -uid "EB7CEBE9-451C-4391-995B-349D873D0DA7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "thumbFingerA_poserOrient_aimConstraint1" -p "thumbFingerA_poserOrient";
	rename -uid "A42626FD-4506-E866-887C-70BC77E47597";
	addAttr -ci true -sn "w0" -ln "thumbFingerB_poserW0" -dv 1 -at "double";
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
createNode transform -n "thumbFinger_1_initLoc" -p "thumbFingerA_poserOrient";
	rename -uid "8FD9D52A-4543-0BC3-BC8E-B196EE9BE956";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 -4.163336342344337e-17 0 ;
	setAttr ".r" -type "double3" 1.5902773407317584e-15 6.3611093629270335e-15 -9.5416640443905503e-15 ;
createNode locator -n "thumbFinger_1_initLocShape" -p "thumbFinger_1_initLoc";
	rename -uid "8086A8F7-46FE-FA97-80B9-55A6B0C43A5A";
	setAttr -k off ".v";
createNode transform -n "thumbFingerB_poser" -p "thumbFinger_mainPoser";
	rename -uid "2A12EFC5-416E-ADD9-DDDF-0E81036237AA";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.30646031254819522 0 1.7222551509932238e-16 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "thumbFingerB";
createNode nurbsSurface -n "thumbFingerB_poserShape" -p "thumbFingerB_poser";
	rename -uid "F9C88A7A-42AF-6350-EE41-0C8AB223E263";
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
createNode locator -n "thumbFingerB_poser_locShape" -p "thumbFingerB_poser";
	rename -uid "19D19CB4-4FF4-07B7-6D40-DEBF99A74B0E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerB_poserOrient" -p "thumbFingerB_poser";
	rename -uid "4312F284-46C1-FFF5-6CF6-5F994756B27A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerB";
createNode locator -n "thumbFingerB_poserOrientShape" -p "thumbFingerB_poserOrient";
	rename -uid "6D545275-4FB6-8215-D47B-A7898A696BF5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "thumbFingerB_poserOrient_aimConstraint1" -p "thumbFingerB_poserOrient";
	rename -uid "4AC77DF0-4BF1-AD7B-7150-E09EC1009E92";
	addAttr -ci true -sn "w0" -ln "thumbFingerC_poserW0" -dv 1 -at "double";
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
createNode transform -n "thumbFinger_2_initLoc" -p "thumbFingerB_poserOrient";
	rename -uid "0A9564EB-4FFC-909E-A1DF-598B3DD7B47A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 -9.7144514654701197e-17 -8.3266726846886741e-17 ;
	setAttr ".r" -type "double3" 0 1.2722218725854064e-14 -6.361109362927032e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000004 ;
createNode locator -n "thumbFinger_2_initLocShape" -p "thumbFinger_2_initLoc";
	rename -uid "4D2D31A9-46BE-8B40-3BF1-22BF331FD023";
	setAttr -k off ".v";
createNode transform -n "thumbFingerC_poser" -p "thumbFinger_mainPoser";
	rename -uid "A7A88EA3-43EE-2615-E8AA-C9B46A8D6685";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "thumbFingerC";
createNode nurbsSurface -n "thumbFingerC_poserShape" -p "thumbFingerC_poser";
	rename -uid "0549F5C4-4380-2668-7340-8ABFF3D56853";
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
createNode locator -n "thumbFingerC_poser_locShape" -p "thumbFingerC_poser";
	rename -uid "0F83C397-423C-9C6C-DC71-E4A9BE1428EC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerC_poserOrient" -p "thumbFingerC_poser";
	rename -uid "341C4983-4E1E-0E36-4573-0495E6BD28A4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerC";
createNode locator -n "thumbFingerC_poserOrientShape" -p "thumbFingerC_poserOrient";
	rename -uid "DB468603-4DC2-690D-05E1-EBBC409FCD7C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "thumbFingerC_poserOrient_aimConstraint1" -p "thumbFingerC_poserOrient";
	rename -uid "0E811EEF-4587-CEB1-1774-0394292E1D24";
	addAttr -ci true -sn "w0" -ln "thumbFingerD_poserW0" -dv 1 -at "double";
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
createNode transform -n "thumbFinger_3_initLoc" -p "thumbFingerC_poserOrient";
	rename -uid "6C575BFB-40E4-9FC0-000F-069BA39F0097";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 -6.9388939039072284e-17 -1.9428902930940239e-16 ;
	setAttr ".r" -type "double3" -3.1805546814635152e-15 1.2722218725854064e-14 -6.361109362927032e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000009 1.0000000000000004 ;
createNode locator -n "thumbFinger_3_initLocShape" -p "thumbFinger_3_initLoc";
	rename -uid "EE23313A-4646-A85A-36E3-DF8C27A75611";
	setAttr -k off ".v";
createNode transform -n "thumbFingerD_poser" -p "thumbFinger_mainPoser";
	rename -uid "D9DE08A2-429D-F4AD-9EB3-629F1505B78B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "thumbFingerD";
createNode nurbsSurface -n "thumbFingerD_poserShape" -p "thumbFingerD_poser";
	rename -uid "B5BCCE16-4A6A-591E-4638-A892AF6AD1E1";
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
createNode locator -n "thumbFingerD_poser_locShape" -p "thumbFingerD_poser";
	rename -uid "7BF2194A-4E77-D319-A821-EF86276BB51A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "thumbFingerD_poserOrient" -p "thumbFingerD_poser";
	rename -uid "A9960256-4B4B-4D78-1555-C5B5BB5130DA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "thumbFingerD";
createNode locator -n "thumbFingerD_poserOrientShape" -p "thumbFingerD_poserOrient";
	rename -uid "BC401C1B-4BB9-6CBF-DCE5-5D9EFE66A656";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pinkyFingerRoot_poser" -p "mainPoser";
	rename -uid "E601D7AE-4452-7E32-45C5-4FAEB66A3BE3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.36556257432503858 4.4408920985006262e-16 -0.20358022444175916 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerRoot";
createNode nurbsSurface -n "pinkyFingerRoot_poserShape" -p "pinkyFingerRoot_poser";
	rename -uid "0F058823-4A78-F9AA-9A3E-3A9E530D5221";
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
createNode locator -n "pinkyFingerRoot_poser_locShape" -p "pinkyFingerRoot_poser";
	rename -uid "B5F114A1-4BE6-9E4F-EF0A-6BA09AE6171B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerRoot_poserOrient" -p "pinkyFingerRoot_poser";
	rename -uid "CBE6CF7E-4EAD-DCE6-C1C6-759F021915BA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerRoot";
createNode locator -n "pinkyFingerRoot_poserOrientShape" -p "pinkyFingerRoot_poserOrient";
	rename -uid "5F31CF91-4D49-6543-364C-0185FB4A5137";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerRoot_poserOrient_aimConstraint1" -p "pinkyFingerRoot_poserOrient";
	rename -uid "3EA5B519-4924-A774-6652-B6BC9F797C3E";
	addAttr -ci true -sn "w0" -ln "pinkyFingerA_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -2.6592300015262948e-15 4.7891053861249056 -6.3591809174144774e-14 ;
	setAttr -k on ".w0";
createNode transform -n "pinkyFingerRoot_initLoc" -p "pinkyFingerRoot_poserOrient";
	rename -uid "20B16585-41E5-0064-39DD-2D9354B3998F";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
createNode locator -n "pinkyFingerRoot_initLocShape" -p "pinkyFingerRoot_initLoc";
	rename -uid "B9BC640E-454D-9A88-80AE-CFA438EA4A0D";
	setAttr -k off ".v";
createNode transform -n "ringFingerRoot_poser" -p "mainPoser";
	rename -uid "8CEC2E30-4A82-6579-27D3-1BAFCA428C4F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.37172840865895129 0 -0.050675101633040009 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "ringFingerRoot";
createNode nurbsSurface -n "ringFingerRoot_poserShape" -p "ringFingerRoot_poser";
	rename -uid "1928226C-410A-CF74-C75C-8EBA1398CFFA";
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
createNode locator -n "ringFingerRoot_poser_locShape" -p "ringFingerRoot_poser";
	rename -uid "47D873DB-4ED1-92DF-EABA-80BC6D826B94";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerRoot_poserOrient" -p "ringFingerRoot_poser";
	rename -uid "6695E38F-41F2-CCB2-9420-A6A16FF77F2B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerRoot";
createNode locator -n "ringFingerRoot_poserOrientShape" -p "ringFingerRoot_poserOrient";
	rename -uid "7AF4416F-445B-BC53-DA7E-C99ED300F108";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerRoot_poserOrient_aimConstraint1" -p "ringFingerRoot_poserOrient";
	rename -uid "817C1283-43E5-1A59-1E03-A8A474FA321A";
	addAttr -ci true -sn "w0" -ln "ringFingerA_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 -2.5096743599507234 0 ;
	setAttr -k on ".w0";
createNode transform -n "ringFingerRoot_initLoc" -p "ringFingerRoot_poserOrient";
	rename -uid "78252686-46C0-03AF-319D-84993D9AE3BC";
	setAttr ".v" no;
createNode locator -n "ringFingerRoot_initLocShape" -p "ringFingerRoot_initLoc";
	rename -uid "44D785C3-4476-846A-15F0-61852803DCBE";
	setAttr -k off ".v";
createNode transform -n "middleFingerRoot_poser" -p "mainPoser";
	rename -uid "5947B20C-421D-FDC3-0E74-DB9257FC2077";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.36573179024563496 0.00011708205605520661 0.1165831022146242 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "middleFingerRoot";
createNode nurbsSurface -n "middleFingerRoot_poserShape" -p "middleFingerRoot_poser";
	rename -uid "2861E353-4364-E9D8-9532-CB886A4E742D";
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
	setAttr ".cpr" 3;
	setAttr ".cps" 1;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "middleFingerRoot_poserOrient" -p "middleFingerRoot_poser";
	rename -uid "D9451840-4504-C90C-1940-D482474C4BF1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerRoot";
createNode locator -n "middleFingerRoot_poserOrientShape" -p "middleFingerRoot_poserOrient";
	rename -uid "BAB27F3D-4C95-A18E-D3C8-1CBC136DA2B0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerRoot_poserOrient_aimConstraint1" -p "middleFingerRoot_poserOrient";
	rename -uid "8201F378-4EB4-C558-141C-D8BA251C54E1";
	addAttr -ci true -sn "w0" -ln "middleFingerA_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 -11.073486849769539 0 ;
	setAttr -k on ".w0";
createNode transform -n "middleFingerRoot_initLoc" -p "middleFingerRoot_poserOrient";
	rename -uid "2AC22A6F-4109-BC2E-12B4-6D919E37ABA3";
	setAttr ".v" no;
createNode locator -n "middleFingerRoot_initLocShape" -p "middleFingerRoot_initLoc";
	rename -uid "16187381-4447-08F7-4E91-5DB1092BF854";
	setAttr -k off ".v";
createNode transform -n "indexFingerRoot_poser" -p "mainPoser";
	rename -uid "B98728F7-4A54-0A63-D24C-47A5C6A756F0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.36556257432503858 0 0.29552088582950792 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "indexFingerRoot";
createNode nurbsSurface -n "indexFingerRoot_poserShape" -p "indexFingerRoot_poser";
	rename -uid "99233B08-42C8-9FB3-EB6F-B6A224A54232";
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
createNode locator -n "indexFingerRoot_poser_locShape" -p "indexFingerRoot_poser";
	rename -uid "9A007551-4C7F-C157-021C-A190EA372692";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerRoot_poserOrient" -p "indexFingerRoot_poser";
	rename -uid "C36B6E98-4C80-A10F-8CBE-CD98B8672892";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerRoot";
createNode locator -n "indexFingerRoot_poserOrientShape" -p "indexFingerRoot_poserOrient";
	rename -uid "DCF03518-4B70-F3B9-7AD5-7899BE3CEABF";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerRoot_poserOrient_aimConstraint1" -p "indexFingerRoot_poserOrient";
	rename -uid "74C33A2B-4FFD-4684-A987-E285274EB7B6";
	addAttr -ci true -sn "w0" -ln "indexFingerA_poserW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0 -20.624186162184753 0 ;
	setAttr -k on ".w0";
createNode transform -n "indexFingerRoot_initLoc" -p "indexFingerRoot_poserOrient";
	rename -uid "4C3C54BF-4E0F-A4BC-7B67-50BCA40029A4";
	setAttr ".v" no;
createNode locator -n "indexFingerRoot_initLocShape" -p "indexFingerRoot_initLoc";
	rename -uid "852C50C1-431B-DBAD-0E89-24BC0AE15434";
	setAttr -k off ".v";
createNode transform -n "indexFinger_mainPoser" -p "mainPoser";
	rename -uid "CDD139C7-4362-788D-D09E-388D433BBFB9";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.74951730318001086 0 0.32492759417655598 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode nurbsCurve -n "indexFinger_mainPoserShape" -p "indexFinger_mainPoser";
	rename -uid "A4162A80-48BE-11B4-67A8-4F8AB5864D78";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "indexFinger_mainPoserShapeOrig" -p "indexFinger_mainPoser";
	rename -uid "4A778AFD-4E09-97B7-B82C-319521B18576";
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
createNode transform -n "indexFinger_mainPoser_clusterHandle" -p "indexFinger_mainPoser";
	rename -uid "CF60AE8F-4565-B3CA-0EDE-C2A5E73B1355";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode clusterHandle -n "indexFinger_mainPoser_clusterHandleShape" -p "indexFinger_mainPoser_clusterHandle";
	rename -uid "32424FFA-41E3-3C63-8983-7BAA99D37DC1";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "indexFingerA_poser" -p "indexFinger_mainPoser";
	rename -uid "5EBBB89C-468E-DF80-09B9-03BC02587CB7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "indexFingerA";
createNode nurbsSurface -n "indexFingerA_poserShape" -p "indexFingerA_poser";
	rename -uid "3CD2FD30-4573-58C8-3647-9F81DBD8565F";
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
createNode locator -n "indexFingerA_poser_locShape" -p "indexFingerA_poser";
	rename -uid "DA40E2F1-4C14-A8E9-D89B-95A705B36B26";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerA_poserOrient" -p "indexFingerA_poser";
	rename -uid "9C4BC783-48F1-A54F-F77C-38B94AF998F3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerA";
createNode locator -n "indexFingerA_poserOrientShape" -p "indexFingerA_poserOrient";
	rename -uid "64B8C665-49D3-4B1F-DD0A-CFB5F563A39C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerA_poserOrient_aimConstraint1" -p "indexFingerA_poserOrient";
	rename -uid "729BE50F-428D-1E2E-88D8-529992D21995";
	addAttr -ci true -sn "w0" -ln "indexFingerB_poserW0" -dv 1 -at "double";
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
createNode transform -n "indexFinger_1_initLoc" -p "indexFingerA_poserOrient";
	rename -uid "87B25D9F-43D7-BB53-62B0-D5BC14970AD2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.1102230246251563e-16 0 0 ;
createNode locator -n "indexFinger_1_initLocShape" -p "indexFinger_1_initLoc";
	rename -uid "6F521624-4C9A-6F8D-4A90-DDAE51F23C7A";
	setAttr -k off ".v";
createNode transform -n "indexFingerB_poser" -p "indexFinger_mainPoser";
	rename -uid "89ADC0CD-494E-BE82-B3D5-1EBB4B2AFC1C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "indexFingerB";
createNode nurbsSurface -n "indexFingerB_poserShape" -p "indexFingerB_poser";
	rename -uid "08104868-4610-E4DD-F455-67A4CAA8C446";
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
createNode locator -n "indexFingerB_poser_locShape" -p "indexFingerB_poser";
	rename -uid "6BF3319F-48EA-7EB2-A9FD-BE82055E6218";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerB_poserOrient" -p "indexFingerB_poser";
	rename -uid "444A86C5-4EBF-B760-BE29-E294368DCE9D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerB";
createNode locator -n "indexFingerB_poserOrientShape" -p "indexFingerB_poserOrient";
	rename -uid "6A53A0FB-4811-455B-CFF0-C7953A3723A6";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerB_poserOrient_aimConstraint1" -p "indexFingerB_poserOrient";
	rename -uid "BC502837-41A5-C224-D3EB-39AA657859D5";
	addAttr -ci true -sn "w0" -ln "indexFingerC_poserW0" -dv 1 -at "double";
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
createNode transform -n "indexFinger_2_initLoc" -p "indexFingerB_poserOrient";
	rename -uid "F246FBFA-4041-50E9-A50B-B0B325B91B7C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 0 0 ;
createNode locator -n "indexFinger_2_initLocShape" -p "indexFinger_2_initLoc";
	rename -uid "788657B8-44D4-F9A9-1DA3-C5AA890A491F";
	setAttr -k off ".v";
createNode transform -n "indexFingerC_poser" -p "indexFinger_mainPoser";
	rename -uid "26D4C7D5-4D5A-33BA-DB27-038C6D45A849";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.59428747010533944 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "indexFingerC";
createNode nurbsSurface -n "indexFingerC_poserShape" -p "indexFingerC_poser";
	rename -uid "BA2F44B1-453A-2998-BC44-F0BD97C2BBF0";
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
createNode locator -n "indexFingerC_poser_locShape" -p "indexFingerC_poser";
	rename -uid "8322E87A-407D-F01B-A44F-43954F2DDE11";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerC_poserOrient" -p "indexFingerC_poser";
	rename -uid "5AC0A644-4253-B339-496A-B88D93C2479A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerC";
createNode locator -n "indexFingerC_poserOrientShape" -p "indexFingerC_poserOrient";
	rename -uid "67B46BEC-4F45-1DF5-29B2-ABB855F4C800";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "indexFingerC_poserOrient_aimConstraint1" -p "indexFingerC_poserOrient";
	rename -uid "1ED8F196-4752-E7B4-4057-AEA4CF309FA3";
	addAttr -ci true -sn "w0" -ln "indexFingerD_poserW0" -dv 1 -at "double";
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
createNode transform -n "indexFinger_3_initLoc" -p "indexFingerC_poserOrient";
	rename -uid "0A001BAF-421C-82A5-E3E0-1DAF179D3090";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.2204460492503131e-16 0 0 ;
createNode locator -n "indexFinger_3_initLocShape" -p "indexFinger_3_initLoc";
	rename -uid "049FE9EB-4545-6C93-B815-509D16EE676E";
	setAttr -k off ".v";
createNode transform -n "indexFingerD_poser" -p "indexFinger_mainPoser";
	rename -uid "44BC4534-4CC4-2754-5567-05960386026B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.85625721615319006 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "indexFingerD";
createNode nurbsSurface -n "indexFingerD_poserShape" -p "indexFingerD_poser";
	rename -uid "67361B7A-4C40-05B3-BD5C-85939C8D7B13";
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
createNode locator -n "indexFingerD_poser_locShape" -p "indexFingerD_poser";
	rename -uid "C3516B1A-48B0-2C68-6F0E-2DA46281046F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "indexFingerD_poserOrient" -p "indexFingerD_poser";
	rename -uid "874C0CAE-4CF1-8EF5-7DD8-548BBBB4DE4C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "indexFingerD";
createNode locator -n "indexFingerD_poserOrientShape" -p "indexFingerD_poserOrient";
	rename -uid "660ED66A-49C9-8501-76F9-32A004F75775";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middleFinger_mainPoser" -p "mainPoser";
	rename -uid "220ACE95-4D55-D38F-F09F-54827BA98C66";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.7463470132132487 0 0.13489770064463968 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode nurbsCurve -n "middleFinger_mainPoserShape" -p "middleFinger_mainPoser";
	rename -uid "256E5963-4F77-4D12-07D6-DFA7683FD176";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "middleFinger_mainPoserShapeOrig" -p "middleFinger_mainPoser";
	rename -uid "D62F4DE7-448A-DB41-7A64-CAB57EFFFDD9";
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
createNode transform -n "middleFinger_mainPoser_clusterHandle" -p "middleFinger_mainPoser";
	rename -uid "A5655947-4D83-3788-F384-96B7881B61C6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode clusterHandle -n "middleFinger_mainPoser_clusterHandleShape" -p "middleFinger_mainPoser_clusterHandle";
	rename -uid "70ECC697-43FF-7E79-52D6-9397D61D53D9";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "middleFingerA_poser" -p "middleFinger_mainPoser";
	rename -uid "3C801BDF-47F4-85D0-746C-38AACD522FD7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "middleFingerA";
createNode nurbsSurface -n "middleFingerA_poserShape" -p "middleFingerA_poser";
	rename -uid "4C2CBCA8-4758-6D9C-666D-919C575D2A6B";
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
createNode locator -n "middleFingerA_poser_locShape" -p "middleFingerA_poser";
	rename -uid "899B1336-4378-3839-EBE8-E1AE3286364F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerA_poserOrient" -p "middleFingerA_poser";
	rename -uid "778FC680-41C8-1D03-0CF1-B7AAE7C1D51C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerA";
createNode locator -n "middleFingerA_poserOrientShape" -p "middleFingerA_poserOrient";
	rename -uid "BC722C3D-4638-52BC-A827-718D2769FFE6";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerA_poserOrient_aimConstraint1" -p "middleFingerA_poserOrient";
	rename -uid "60176852-4CA8-2030-FE31-F48C8624970E";
	addAttr -ci true -sn "w0" -ln "middleFingerB_poserW0" -dv 1 -at "double";
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
createNode transform -n "middleFinger_1_initLoc" -p "middleFingerA_poserOrient";
	rename -uid "ACF319BA-405A-1E56-AC28-AAB9A6F340EB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 0 0 ;
createNode locator -n "middleFinger_1_initLocShape" -p "middleFinger_1_initLoc";
	rename -uid "721B0762-442C-E194-E5B4-65BE5B38034D";
	setAttr -k off ".v";
createNode transform -n "middleFingerB_poser" -p "middleFinger_mainPoser";
	rename -uid "A3FE7FED-412D-565F-5A0B-7987910D1F54";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "middleFingerB";
createNode nurbsSurface -n "middleFingerB_poserShape" -p "middleFingerB_poser";
	rename -uid "E1B5ED38-4CEE-69D3-E77D-69AAF4FB0569";
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
createNode locator -n "middleFingerB_poser_locShape" -p "middleFingerB_poser";
	rename -uid "33477120-4070-CCDD-513D-6B8F167632CE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerB_poserOrient" -p "middleFingerB_poser";
	rename -uid "23970415-4D06-3F4F-FF14-B388453CCEDF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerB";
createNode locator -n "middleFingerB_poserOrientShape" -p "middleFingerB_poserOrient";
	rename -uid "E1B2338F-4681-161C-AB33-C8A846172C55";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerB_poserOrient_aimConstraint1" -p "middleFingerB_poserOrient";
	rename -uid "29A657BE-4B91-0AC1-01D0-00AF3A389781";
	addAttr -ci true -sn "w0" -ln "middleFingerC_poserW0" -dv 1 -at "double";
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
createNode transform -n "middleFinger_2_initLoc" -p "middleFingerB_poserOrient";
	rename -uid "E7FC859D-4147-F955-262A-FB9A8A206BA8";
	setAttr ".v" no;
createNode locator -n "middleFinger_2_initLocShape" -p "middleFinger_2_initLoc";
	rename -uid "C73EE09A-43F1-0E76-C117-C68DA844F49F";
	setAttr -k off ".v";
createNode transform -n "middleFingerC_poser" -p "middleFinger_mainPoser";
	rename -uid "B884C953-4CF2-F358-FEC6-8F95816DD337";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "middleFingerC";
createNode nurbsSurface -n "middleFingerC_poserShape" -p "middleFingerC_poser";
	rename -uid "E7E26014-44BF-6237-72D5-26B46ADDF335";
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
createNode locator -n "middleFingerC_poser_locShape" -p "middleFingerC_poser";
	rename -uid "584B1D0A-4630-AD57-2F45-92BDD8528DE1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerC_poserOrient" -p "middleFingerC_poser";
	rename -uid "1DB8D3FB-46AF-04D4-407A-66A9A1644439";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerC";
createNode locator -n "middleFingerC_poserOrientShape" -p "middleFingerC_poserOrient";
	rename -uid "BE39D8F4-43E8-5321-855F-5D90E19A6905";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "middleFingerC_poserOrient_aimConstraint1" -p "middleFingerC_poserOrient";
	rename -uid "2113EF4F-4CB1-C44E-AA55-34996014E2D2";
	addAttr -ci true -sn "w0" -ln "middleFingerD_poserW0" -dv 1 -at "double";
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
createNode transform -n "middleFinger_3_initLoc" -p "middleFingerC_poserOrient";
	rename -uid "E99A53E0-4CC4-1C71-6108-C190BED2187C";
	setAttr ".v" no;
createNode locator -n "middleFinger_3_initLocShape" -p "middleFinger_3_initLoc";
	rename -uid "C7548064-4A14-8F03-A2EF-82A0D3A97F37";
	setAttr -k off ".v";
createNode transform -n "middleFingerD_poser" -p "middleFinger_mainPoser";
	rename -uid "678B7613-4D13-A808-9977-C2B085944A67";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "middleFingerD";
createNode nurbsSurface -n "middleFingerD_poserShape" -p "middleFingerD_poser";
	rename -uid "79DF21BB-49ED-1290-BD5C-60A896BB7752";
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
createNode locator -n "middleFingerD_poser_locShape" -p "middleFingerD_poser";
	rename -uid "A8E658C9-46CB-9991-7077-84A73C536C43";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middleFingerD_poserOrient" -p "middleFingerD_poser";
	rename -uid "D43A525A-4D7A-E70D-E912-0CB3DF84BC5D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "middleFingerD";
createNode locator -n "middleFingerD_poserOrientShape" -p "middleFingerD_poserOrient";
	rename -uid "283EBFE1-4189-3C78-1E67-41AC2C4527EA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ringFinger_mainPoser" -p "mainPoser";
	rename -uid "194895D0-4C28-0907-5524-D0931C1D0077";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.7438096035359113 0 -0.072370664127818451 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode nurbsCurve -n "ringFinger_mainPoserShape" -p "ringFinger_mainPoser";
	rename -uid "1A48C19C-4B5D-558D-3C4D-F1BFB4A132B9";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "ringFinger_mainPoserShapeOrig" -p "ringFinger_mainPoser";
	rename -uid "BE2D8090-46B5-5E2A-39DD-F99E6D9A8A1F";
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
createNode transform -n "ringFinger_mainPoser_clusterHandle" -p "ringFinger_mainPoser";
	rename -uid "5F4B2CCA-412E-A6AD-0438-AE86C74BB9BD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode clusterHandle -n "ringFinger_mainPoser_clusterHandleShape" -p "ringFinger_mainPoser_clusterHandle";
	rename -uid "4E9DFF6C-46B1-58C4-9C77-60AFAEF2F5F5";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "ringFingerA_poser" -p "ringFinger_mainPoser";
	rename -uid "A873FC4B-49BF-B3DB-F5DB-6CBD1D8F955F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "ringFingerA";
createNode nurbsSurface -n "ringFingerA_poserShape" -p "ringFingerA_poser";
	rename -uid "0C1ABA65-41DC-78B6-2387-518588974E61";
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
createNode locator -n "ringFingerA_poser_locShape" -p "ringFingerA_poser";
	rename -uid "E45CDAE8-4375-C399-256F-B497B0D15794";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerA_poserOrient" -p "ringFingerA_poser";
	rename -uid "6148F353-45A1-4FDF-8323-A597118B8F11";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerA";
createNode locator -n "ringFingerA_poserOrientShape" -p "ringFingerA_poserOrient";
	rename -uid "F5AEB1A2-43E8-A341-C3D8-C79EBC82A7BD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerA_poserOrient_aimConstraint1" -p "ringFingerA_poserOrient";
	rename -uid "61572FF6-4F78-93B2-96F2-9EB6B6F57F84";
	addAttr -ci true -sn "w0" -ln "ringFingerB_poserW0" -dv 1 -at "double";
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
createNode transform -n "ringFinger_1_initLoc" -p "ringFingerA_poserOrient";
	rename -uid "94C42186-4A41-6B98-D407-4A9130880417";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 0 0 ;
createNode locator -n "ringFinger_1_initLocShape" -p "ringFinger_1_initLoc";
	rename -uid "026FDB1A-4680-F3DE-B7F2-4EB2E89711CE";
	setAttr -k off ".v";
createNode transform -n "ringFingerB_poser" -p "ringFinger_mainPoser";
	rename -uid "533164D4-4170-D6D4-68D4-14BDB0670F60";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "ringFingerB";
createNode nurbsSurface -n "ringFingerB_poserShape" -p "ringFingerB_poser";
	rename -uid "7C24B9D1-48B5-5300-B78D-70A39FDC1264";
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
createNode locator -n "ringFingerB_poser_locShape" -p "ringFingerB_poser";
	rename -uid "E46DC3D6-49C3-A415-0A63-D68C55B78E39";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerB_poserOrient" -p "ringFingerB_poser";
	rename -uid "CB9F9CBD-4F6A-A8C1-26FE-1DB58C3641C7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerB";
createNode locator -n "ringFingerB_poserOrientShape" -p "ringFingerB_poserOrient";
	rename -uid "D06D010A-4049-0F03-5113-5197A47F3B65";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerB_poserOrient_aimConstraint1" -p "ringFingerB_poserOrient";
	rename -uid "CF575994-435B-8002-9DD3-398A26B7EB74";
	addAttr -ci true -sn "w0" -ln "ringFingerC_poserW0" -dv 1 -at "double";
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
createNode transform -n "ringFinger_2_initLoc" -p "ringFingerB_poserOrient";
	rename -uid "CC8A9BED-4C9A-E0EF-6D78-058861DB4E93";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode locator -n "ringFinger_2_initLocShape" -p "ringFinger_2_initLoc";
	rename -uid "63486990-437C-CFAA-0DC4-6781C7A090EF";
	setAttr -k off ".v";
createNode transform -n "ringFingerC_poser" -p "ringFinger_mainPoser";
	rename -uid "8646C57D-4CFA-2E0A-10C7-9B8F64A42A50";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "ringFingerC";
createNode nurbsSurface -n "ringFingerC_poserShape" -p "ringFingerC_poser";
	rename -uid "B1639586-409F-97BC-3E5A-AC863151F0D5";
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
createNode locator -n "ringFingerC_poser_locShape" -p "ringFingerC_poser";
	rename -uid "9D167A18-4B27-4F01-68A7-599E2E2C1343";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerC_poserOrient" -p "ringFingerC_poser";
	rename -uid "CA183E87-4964-F24F-C59D-BCB063F0170F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerC";
createNode locator -n "ringFingerC_poserOrientShape" -p "ringFingerC_poserOrient";
	rename -uid "5C1255E3-4004-B856-451B-9092F349062C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "ringFingerC_poserOrient_aimConstraint1" -p "ringFingerC_poserOrient";
	rename -uid "80C9CF01-4A41-964B-05C6-64B76CB29329";
	addAttr -ci true -sn "w0" -ln "ringFingerD_poserW0" -dv 1 -at "double";
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
createNode transform -n "ringFinger_3_initLoc" -p "ringFingerC_poserOrient";
	rename -uid "1091E868-4339-885E-5045-CCBA7B4263D1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode locator -n "ringFinger_3_initLocShape" -p "ringFinger_3_initLoc";
	rename -uid "3D8D0249-4C4E-FAA8-1466-27BC0099E723";
	setAttr -k off ".v";
createNode transform -n "ringFingerD_poser" -p "ringFinger_mainPoser";
	rename -uid "E5CEC348-4012-A995-B0B9-1BA2DED4DE65";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "ringFingerD";
createNode nurbsSurface -n "ringFingerD_poserShape" -p "ringFingerD_poser";
	rename -uid "B9B52EE6-45E6-AF72-F6C9-6E8AF41C6C5D";
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
createNode locator -n "ringFingerD_poser_locShape" -p "ringFingerD_poser";
	rename -uid "F780C4D9-45E5-EE5B-4A97-23A051B789C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "ringFingerD_poserOrient" -p "ringFingerD_poser";
	rename -uid "A4A5C5A3-4980-6E18-72A3-E38F81DA34A2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "ringFingerD";
createNode locator -n "ringFingerD_poserOrientShape" -p "ringFingerD_poserOrient";
	rename -uid "872C7868-4142-255A-A313-D3A81560C322";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "center_poser" -p "ringFinger_mainPoser";
	rename -uid "07D6B391-437F-46A1-94DC-2E8352CB72F0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" -0.0046826154295770417 -0.0020808629582578231 
		0.11303186575599009 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -l on ".moduleName" -type "string" "ringFingerA";
createNode nurbsSurface -n "center_poserShape" -p "center_poser";
	rename -uid "11C44D4F-4E9F-80F3-DD3E-D882C6044D12";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
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
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 2.7896528015365289e-18 1.2922260853390709e-18
		-0.014534779145386338 0.0029057464022610737 -0.0029057464022610707
		-0.014534779145386338 7.3466633706901772e-19 -0.0041093459708944329
		-0.014534779145386338 -0.0029057464022610728 -0.0029057464022610707
		-0.014534779145386338 -0.0041093459708944373 1.990981797743278e-18
		-0.014534779145386338 -0.0029057464022610737 0.0029057464022610754
		-0.014534779145386338 -8.946774639916647e-19 0.0041093459708944407
		-0.014534779145386338 0.0029057464022610728 0.0029057464022610759
		-0.014534779145386338 0.0041093459708944373 3.7304840128160334e-18
		-0.014534779145386338 0.0029057464022610737 -0.0029057464022610707
		-0.014534779145386338 7.3466633706901772e-19 -0.0041093459708944329
		-0.014534779145386338 -0.0029057464022610728 -0.0029057464022610707
		-0.011389621903551269 0.008959673613397709 -0.0089596736133977055
		-0.011389621903551269 -2.9991077521099412e-21 -0.012670891938503384
		-0.011389621903551269 -0.008959673613397709 -0.0089596736133977038
		-0.011389621903551269 -0.012670891938503393 3.001644018448518e-18
		-0.011389621903551269 -0.008959673613397709 0.0089596736133977124
		-0.011389621903551269 -4.9038444100606542e-19 0.0126708919385034
		-0.011389621903551269 0.008959673613397709 0.0089596736133977107
		-0.011389621903551269 0.012670891938503393 3.8286954129078503e-18
		-0.011389621903551269 0.008959673613397709 -0.0089596736133977055
		-0.011389621903551269 -2.9991077521099412e-21 -0.012670891938503384
		-0.011389621903551269 -0.008959673613397709 -0.0089596736133977038
		2.5635892892664173e-18 0.012604596048628054 -0.012604596048628056
		2.8832830074626736e-18 -1.091502628471143e-18 -0.017825590680204107
		2.5635892892664169e-18 -0.012604596048628057 -0.012604596048628049
		1.7917803789915308e-18 -0.017825590680204118 4.8359745122599666e-18
		1.0199714687166444e-18 -0.012604596048628054 0.012604596048628061
		7.0027775052038735e-19 3.9740364702654619e-19 0.017825590680204124
		1.0199714687166448e-18 0.012604596048628057 0.012604596048628056
		1.7917803789915308e-18 0.017825590680204118 3.8249152742392106e-18
		2.5635892892664173e-18 0.012604596048628054 -0.012604596048628056
		2.8832830074626736e-18 -1.091502628471143e-18 -0.017825590680204107
		2.5635892892664169e-18 -0.012604596048628057 -0.012604596048628049
		0.011389621903551275 0.0089596736133977072 -0.0089596736133977072
		0.011389621903551275 -1.5487376177309081e-18 -0.012670891938503384
		0.011389621903551275 -0.0089596736133977107 -0.008959673613397702
		0.011389621903551275 -0.012670891938503393 5.9422089291955815e-18
		0.011389621903551275 -0.0089596736133977072 0.0089596736133977142
		0.011389621903551275 1.0553540689727337e-18 0.0126708919385034
		0.011389621903551275 0.0089596736133977107 0.008959673613397709
		0.011389621903551275 0.012670891938503393 3.6777833036973164e-18
		0.011389621903551275 0.0089596736133977072 -0.0089596736133977072
		0.011389621903551275 -1.5487376177309081e-18 -0.012670891938503384
		0.011389621903551275 -0.0089596736133977107 -0.008959673613397702
		0.014534779145386338 0.0029057464022610685 -0.0029057464022610663
		0.014534779145386338 -1.2379160760535118e-18 -0.004109345970894426
		0.014534779145386338 -0.0029057464022610702 -0.0029057464022610637
		0.014534779145386338 -0.004109345970894432 5.7435612865369156e-18
		0.014534779145386338 -0.0029057464022610685 0.0029057464022610746
		0.014534779145386338 1.0779049491308659e-18 0.0041093459708944373
		0.014534779145386338 0.0029057464022610702 0.0029057464022610724
		0.014534779145386338 0.004109345970894432 3.5378986753646115e-18
		0.014534779145386338 0.0029057464022610685 -0.0029057464022610663
		0.014534779145386338 -1.2379160760535118e-18 -0.004109345970894426
		0.014534779145386338 -0.0029057464022610702 -0.0029057464022610637
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		0.014534779145386338 -2.6593284486780277e-18 5.7315516096882078e-18
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "center_loc" -p "center_poser";
	rename -uid "595F1620-42B0-4799-C657-539E81F3F2C5";
	setAttr ".v" no;
createNode locator -n "center_locShape" -p "center_loc";
	rename -uid "6E9782DE-4420-67A1-FF94-64A609C3686F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pinkyFinger_mainPoser" -p "mainPoser";
	rename -uid "F8F5E742-4774-56B9-87FC-07BF9C403E2B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 10;
	setAttr ".t" -type "double3" 0.7441693368767478 0 -0.27933681092588802 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode nurbsCurve -n "pinkyFinger_mainPoserShape" -p "pinkyFinger_mainPoser";
	rename -uid "DC8DE16F-47BA-9C13-1B79-3897DB962A19";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode nurbsCurve -n "pinkyFinger_mainPoserShapeOrig" -p "pinkyFinger_mainPoser";
	rename -uid "3E28F49E-48C4-8527-8AAB-6784ABCFA261";
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
createNode transform -n "pinkyFinger_mainPoser_clusterHandle" -p "pinkyFinger_mainPoser";
	rename -uid "46114DE7-41CC-B239-7817-08A659D3D537";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode clusterHandle -n "pinkyFinger_mainPoser_clusterHandleShape" -p "pinkyFinger_mainPoser_clusterHandle";
	rename -uid "11D6E568-4F01-9BD8-BE78-499B3F054D7B";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "pinkyFingerA_poser" -p "pinkyFinger_mainPoser";
	rename -uid "97BBD40F-45D3-43C4-94BE-11B99164E8AE";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerA";
createNode nurbsSurface -n "pinkyFingerA_poserShape" -p "pinkyFingerA_poser";
	rename -uid "205A5247-4E4D-B8D0-ED01-F0A3EC50F1EE";
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
createNode locator -n "pinkyFingerA_poser_locShape" -p "pinkyFingerA_poser";
	rename -uid "8733A5AB-4869-65A2-2752-BCB9A961F336";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerA_poserOrient" -p "pinkyFingerA_poser";
	rename -uid "86DC26A8-4FEB-2DDB-EA2D-F3B649A27F4E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerA";
createNode locator -n "pinkyFingerA_poserOrientShape" -p "pinkyFingerA_poserOrient";
	rename -uid "FC32F532-4204-DEBB-A8DA-878055AB9472";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerA_poserOrient_aimConstraint1" -p "pinkyFingerA_poserOrient";
	rename -uid "648223AF-454D-5BFC-A7A5-E38CAE9990F5";
	addAttr -ci true -sn "w0" -ln "pinkyFingerB_poserW0" -dv 1 -at "double";
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
createNode transform -n "pinkyFinger_1_initLoc" -p "pinkyFingerA_poserOrient";
	rename -uid "191E7076-45E3-F491-486D-40AE77B117CD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode locator -n "pinkyFinger_1_initLocShape" -p "pinkyFinger_1_initLoc";
	rename -uid "38468847-47FB-5B7F-C402-DDADA116B284";
	setAttr -k off ".v";
createNode transform -n "pinkyFingerB_poser" -p "pinkyFinger_mainPoser";
	rename -uid "58F82BD7-4131-6C03-F07F-4D8C1EECC636";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.3 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerB";
createNode nurbsSurface -n "pinkyFingerB_poserShape" -p "pinkyFingerB_poser";
	rename -uid "2FA1BC2C-4132-A72B-C161-9DA54657AA43";
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
createNode locator -n "pinkyFingerB_poser_locShape" -p "pinkyFingerB_poser";
	rename -uid "0D932573-4B04-97FD-035D-4B99A0F78C84";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerB_poserOrient" -p "pinkyFingerB_poser";
	rename -uid "092A6B1D-4408-67DB-0ABA-50BFD7B9BB72";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerB";
createNode locator -n "pinkyFingerB_poserOrientShape" -p "pinkyFingerB_poserOrient";
	rename -uid "A9C09F7F-4539-EDCE-18AD-6FB94708D6B3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerB_poserOrient_aimConstraint1" -p "pinkyFingerB_poserOrient";
	rename -uid "4E7198E4-4F9F-2FBC-FE74-0EB141E53F89";
	addAttr -ci true -sn "w0" -ln "pinkyFingerC_poserW0" -dv 1 -at "double";
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
createNode transform -n "pinkyFinger_2_initLoc" -p "pinkyFingerB_poserOrient";
	rename -uid "185F8E80-4052-20DC-ACF8-1D973473FDD5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode locator -n "pinkyFinger_2_initLocShape" -p "pinkyFinger_2_initLoc";
	rename -uid "79C4FEDE-4F52-FD2D-9D3D-7ABEB997BED6";
	setAttr -k off ".v";
createNode transform -n "pinkyFingerC_poser" -p "pinkyFinger_mainPoser";
	rename -uid "BE73E439-47B0-654A-296C-C18AC28AD5A5";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.6 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerC";
createNode nurbsSurface -n "pinkyFingerC_poserShape" -p "pinkyFingerC_poser";
	rename -uid "3760C47D-432C-A017-A996-5A93505BE696";
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
createNode locator -n "pinkyFingerC_poser_locShape" -p "pinkyFingerC_poser";
	rename -uid "88F585E9-4580-C290-17C9-BD8A773704D1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerC_poserOrient" -p "pinkyFingerC_poser";
	rename -uid "1D38538B-4C80-D88E-ABD3-2A9FE94E11B0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerC";
createNode locator -n "pinkyFingerC_poserOrientShape" -p "pinkyFingerC_poserOrient";
	rename -uid "EACB9D0D-437A-289E-0175-508193E51D1A";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "pinkyFingerC_poserOrient_aimConstraint1" -p "pinkyFingerC_poserOrient";
	rename -uid "1ABF8AE0-405D-690E-7413-D89389906A05";
	addAttr -ci true -sn "w0" -ln "pinkyFingerD_poserW0" -dv 1 -at "double";
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
createNode transform -n "pinkyFinger_3_initLoc" -p "pinkyFingerC_poserOrient";
	rename -uid "7D553354-45B8-C332-F1D0-648B9D7BF5D3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
createNode locator -n "pinkyFinger_3_initLocShape" -p "pinkyFinger_3_initLoc";
	rename -uid "5A1F2CD3-4644-9842-8ABD-A987F1D8B627";
	setAttr -k off ".v";
createNode transform -n "pinkyFingerD_poser" -p "pinkyFinger_mainPoser";
	rename -uid "CD1999AE-49AF-BC72-A32C-62AFBC48D929";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0.9 0 0 ;
	setAttr -k on ".t";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "pinkyFingerD";
createNode nurbsSurface -n "pinkyFingerD_poserShape" -p "pinkyFingerD_poser";
	rename -uid "E64ACB7F-49A9-22AE-7188-0597586E5DA6";
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
createNode locator -n "pinkyFingerD_poser_locShape" -p "pinkyFingerD_poser";
	rename -uid "567CCF81-4574-B7D4-8DB3-9081DBF9DE37";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "pinkyFingerD_poserOrient" -p "pinkyFingerD_poser";
	rename -uid "B3403788-4C68-383F-1998-4C8828046AEB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "pinkyFingerD";
createNode locator -n "pinkyFingerD_poserOrientShape" -p "pinkyFingerD_poserOrient";
	rename -uid "C484CAAE-42FC-10BC-016A-2EADCDD39D06";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "1D18C478-4B2D-8617-E226-68981AA82C76";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "root";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "05EF3683-4D97-55E8-3A04-47BF42B967CF";
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
createNode locator -n "root_poser_locShape" -p "root_poser";
	rename -uid "CA58846E-41B5-4FCB-DF8D-ADA4F74C684F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "0E5D7518-46EC-5053-79C2-7E8814085954";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "B4DC59D4-44AF-AD6E-DC05-098324FE760E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "06CB70F3-419C-7141-28DF-C9A463041F44";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "E6943F31-493D-EEC8-4120-338686B5E1A2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "center_palm_loc_group" -p "mainPoser";
	rename -uid "15FDDD55-420C-70EB-9B42-688794054B29";
	setAttr ".v" no;
createNode transform -n "center_palm_loc" -p "center_palm_loc_group";
	rename -uid "3F229075-40CE-3609-AB80-1FB614D804B8";
createNode locator -n "center_palm_locShape" -p "center_palm_loc";
	rename -uid "7C40BD1C-4776-7ACB-A30A-AF9B0AB8480E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "lines_group" -p "posers";
	rename -uid "CB5C5268-4C1E-0A9D-19D1-3A8A9AED8DCC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode transform -n "thumbFinger_posers_curve" -p "lines_group";
	rename -uid "39A322F2-46AE-8849-9816-B1BE126C84D5";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "thumbFinger_posers_curveShape" -p "thumbFinger_posers_curve";
	rename -uid "AA1DA3E2-40B9-DFEF-3EC4-2EA0B9058415";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0 0 0
		0.28812560489975525 0 0.48826241970730738
		0.50482577006713236 -1.0937140734906581e-16 0.70496258487468555
		0.71238967361168293 0 0.91252648841923678
		0.92452170796764677 0 1.1246585227752015
		;
createNode transform -n "indexFinger_posers_curve" -p "lines_group";
	rename -uid "69CD81FF-4355-1B4C-B144-FCB5EBE95E36";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "indexFinger_posers_curveShape" -p "indexFinger_posers_curve";
	rename -uid "FCE166D0-4F8F-83CB-B115-C49AFAC9D979";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.36556257432503858 0 0.29552088582950792
		0.74951730318001086 0 0.32492759417655598
		1.0495173031800109 0 0.32492759417655598
		1.3438047732853504 0 0.32492759417655598
		1.6057745193332009 0 0.32492759417655598
		;
createNode transform -n "middleFinger_posers_curve" -p "lines_group";
	rename -uid "E2654C8D-46ED-F2C8-2075-7DACF7A6214B";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "middleFinger_posers_curveShape" -p "middleFinger_posers_curve";
	rename -uid "B23A6D7A-49B6-374B-E2D1-E7A69558793E";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.36573179024563496 0.00011708205605520661 0.1165831022146242
		0.7463470132132487 0 0.13489770064463968
		1.0463470132132486 0 0.13489770064463968
		1.3463470132132487 0 0.13489770064463968
		1.6463470132132487 0 0.13489770064463968
		;
createNode transform -n "ringFinger_posers_curve" -p "lines_group";
	rename -uid "8108281F-47EB-E8E0-EA8E-68B6FB35BFEA";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "ringFinger_posers_curveShape" -p "ringFinger_posers_curve";
	rename -uid "333C2F50-45B4-5725-8C18-73AD5F30ACE2";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.37172840865895129 0 -0.050675101633040009
		0.7438096035359113 0 -0.072370664127818451
		1.0438096035359112 0 -0.072370664127818451
		1.3438096035359113 0 -0.072370664127818451
		1.6438096035359113 0 -0.072370664127818451
		;
createNode transform -n "pinkyFinger_posers_curve" -p "lines_group";
	rename -uid "6C102DD6-4D15-416D-8388-2389745117DB";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "pinkyFinger_posers_curveShape" -p "pinkyFinger_posers_curve";
	rename -uid "92A8128B-4F13-3422-7542-F69E28553B00";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 0.19999999999999998 0.39999999999999997 0.59999999999999998 0.79999999999999993
		 1
		6
		0 0 0
		0.36556257432503858 4.4408920985006262e-16 -0.20358022444175916
		0.7441693368767478 0 -0.27933681092588802
		1.0441693368767477 0 -0.27933681092588802
		1.3441693368767478 0 -0.27933681092588802
		1.6441693368767478 0 -0.27933681092588802
		;
createNode transform -n "thumbFinger_posers_sweep" -p "lines_group";
	rename -uid "7BE25B70-4C4F-D8C1-7EA4-A6BEA4BE6C9E";
	setAttr ".it" no;
createNode mesh -n "thumbFinger_posers_sweepShape" -p "thumbFinger_posers_sweep";
	rename -uid "5AD573C1-4CC9-034F-AF15-FDAA68F8A544";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "indexFinger_posers_sweep" -p "lines_group";
	rename -uid "A090CBB2-4A1B-275B-E74C-19B1D978FDFE";
	setAttr ".it" no;
createNode mesh -n "indexFinger_posers_sweepShape" -p "indexFinger_posers_sweep";
	rename -uid "94D6C5F9-4A2A-6939-8CBB-308C2396961F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "middleFinger_posers_sweep" -p "lines_group";
	rename -uid "E578CAFB-42DA-D0AF-B831-64A63D0640A7";
	setAttr ".it" no;
createNode mesh -n "middleFinger_posers_sweepShape" -p "middleFinger_posers_sweep";
	rename -uid "7F2B2325-402E-30A6-5E99-AC8B4D1ECA7E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "ringFinger_posers_sweep" -p "lines_group";
	rename -uid "9B7A82BB-40F0-7FC2-373A-0FB3B0CBF015";
	setAttr ".it" no;
createNode mesh -n "ringFinger_posers_sweepShape" -p "ringFinger_posers_sweep";
	rename -uid "5CE428D7-4CEF-ABCC-57DD-DBA349AB1701";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pinkyFinger_posers_sweep" -p "lines_group";
	rename -uid "2E7FB292-497D-4057-7051-898D6E95FF37";
	setAttr ".it" no;
createNode mesh -n "pinkyFinger_posers_sweepShape" -p "pinkyFinger_posers_sweep";
	rename -uid "A20748AA-4873-61D6-62CE-8EB04BA327D4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "875CE9EB-4BB4-8A54-5E01-5988F8A5A1F9";
	setAttr ".v" no;
createNode transform -n "fk_connector" -p "input";
	rename -uid "DF1AFE66-4D2A-A82F-B0D9-0EA56E51A6A7";
createNode locator -n "fk_connectorShape" -p "fk_connector";
	rename -uid "405BF8DF-4BE9-7FC2-E8E3-64B3F674A27A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_connector" -p "input";
	rename -uid "6F946A29-4A01-FA00-1BEE-9095C96758D2";
createNode locator -n "ik_connectorShape" -p "ik_connector";
	rename -uid "EABAA31D-4AEF-75DD-97E6-17B45D78D78B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_connector_group" -p "input";
	rename -uid "3AE5D737-4F1A-4A6E-88B8-BAA976BBA4AB";
createNode transform -n "root_connector" -p "root_connector_group";
	rename -uid "5FDB5291-4A84-F903-1E2B-E3B0322AF764";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "094C9909-4B98-D76E-583E-83B28E6099C6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_connector__indexFinger_ik__parentSwitcherTarget" -p
		 "root_connector";
	rename -uid "7F9C6B47-49E2-D9A8-4241-169EA8560C53";
createNode locator -n "root_connector__indexFinger_ik__parentSwitcherTargetShape" 
		-p "root_connector__indexFinger_ik__parentSwitcherTarget";
	rename -uid "DBD48323-4C70-124B-90C9-32AE3DF007E7";
	setAttr -k off ".v";
createNode transform -n "root_connector__middleFinger_ik__parentSwitcherTarget" -p
		 "root_connector";
	rename -uid "003CA269-435A-9338-8F7A-5FAD898477B9";
createNode locator -n "root_connector__middleFinger_ik__parentSwitcherTargetShape" 
		-p "root_connector__middleFinger_ik__parentSwitcherTarget";
	rename -uid "01B96A41-4BFE-895E-7FE0-AB80872F22E7";
	setAttr -k off ".v";
createNode transform -n "root_connector__ringFinger_ik__parentSwitcherTarget" -p "root_connector";
	rename -uid "6D0E9F0E-47F3-5781-A400-FC9AD88B55C8";
createNode locator -n "root_connector__ringFinger_ik__parentSwitcherTargetShape" 
		-p "root_connector__ringFinger_ik__parentSwitcherTarget";
	rename -uid "52C047AD-4DCB-A37E-CDEC-6AA4CE5DD8F6";
	setAttr -k off ".v";
createNode transform -n "root_connector__pinkyFinger_ik__parentSwitcherTarget" -p
		 "root_connector";
	rename -uid "521953C9-4069-81B9-7123-6782EB4771A7";
createNode locator -n "root_connector__pinkyFinger_ik__parentSwitcherTargetShape" 
		-p "root_connector__pinkyFinger_ik__parentSwitcherTarget";
	rename -uid "D89EF039-4ACC-D12F-8886-2C9F8C21BAD6";
	setAttr -k off ".v";
createNode transform -n "root_connector__thumbFinger_ik__parentSwitcherTarget" -p
		 "root_connector";
	rename -uid "D8C23913-42E6-E199-A3EE-08824FEFFFEC";
createNode locator -n "root_connector__thumbFinger_ik__parentSwitcherTargetShape" 
		-p "root_connector__thumbFinger_ik__parentSwitcherTarget";
	rename -uid "4FAFB71E-4F74-B29F-AE45-23B13652CF5E";
	setAttr -k off ".v";
createNode parentConstraint -n "root_connector_group_parentConstraint1" -p "root_connector_group";
	rename -uid "9426C3C6-4B7E-49FC-42D8-F6A0B4D8374B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ik_connectorW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "fk_connectorW1" -dv 1 -min 0 -at "double";
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
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode scaleConstraint -n "root_connector_group_scaleConstraint1" -p "root_connector_group";
	rename -uid "07FBEC9E-4EDE-9F74-BF80-DA94CA269B29";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ik_connectorW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "controls" -p "mod";
	rename -uid "9539DD24-4F24-35FA-C82C-BBB48F2C166B";
	setAttr ".ove" yes;
createNode transform -n "fingersBend_group" -p "controls";
	rename -uid "14269C30-445A-AD4F-5D15-1DB76B7E9895";
createNode transform -n "fingersBend" -p "fingersBend_group";
	rename -uid "27905F50-4C84-C468-842B-F98FD6F1265C";
	addAttr -ci true -sn "thumbBend" -ln "thumbBend" -min -30 -max 90 -at "double";
	addAttr -ci true -sn "indexBend" -ln "indexBend" -min -30 -max 90 -at "double";
	addAttr -ci true -sn "middleBend" -ln "middleBend" -min -30 -max 90 -at "double";
	addAttr -ci true -sn "ringBend" -ln "ringBend" -min -30 -max 90 -at "double";
	addAttr -ci true -sn "pinkyBend" -ln "pinkyBend" -min -30 -max 90 -at "double";
	addAttr -ci true -sn "spread" -ln "spread" -at "double";
	addAttr -ci true -sn "addControls" -ln "addControls" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "thumbIk" -ln "thumbIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "IndexIk" -ln "IndexIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "middleIk" -ln "middleIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "ringIk" -ln "ringIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "pinkyIk" -ln "pinkyIk" -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mnrl" -type "double3" -40 -45 -180 ;
	setAttr ".mxrl" -type "double3" 40 45 180 ;
	setAttr ".mrxe" yes;
	setAttr ".xrxe" yes;
	setAttr -k on ".thumbBend";
	setAttr -k on ".indexBend";
	setAttr -k on ".middleBend";
	setAttr -k on ".ringBend";
	setAttr -k on ".pinkyBend";
	setAttr -k on ".spread";
	setAttr -cb on ".addControls";
	setAttr -k on ".thumbIk";
	setAttr -k on ".IndexIk";
	setAttr -k on ".middleIk";
	setAttr -k on ".ringIk";
	setAttr -k on ".pinkyIk";
createNode nurbsCurve -n "fingersBendShape" -p "fingersBend";
	rename -uid "9DA20377-4A89-7EAE-3848-E39FBB4A44ED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		1 25 0 no 3
		26 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
		26
		0 0.36022803273997367 0
		0 0.36186319436253173 -0.012096128263464226
		0 0.36653413625112968 -0.023372748719342518
		0 0.37393114637747399 -0.033082219187026196
		0 0.38364061684515788 -0.040479229313370405
		0 0.39491723730103528 -0.045150171201968431
		0 0.40701336556450002 -0.046785332824526391
		0 0.41910949382796403 -0.045150171201968431
		0 0.43038608189734973 -0.040479229313370405
		0 0.44009558475152599 -0.033082219187026196
		0 0.4474925624913777 -0.023372748719342518
		0 0.4521635691529613 -0.012096128263464226
		0 0.45379830975111601 0
		0 0.4521635691529613 0.012096128263464226
		0 0.4474925624913777 0.023372748719342518
		0 0.44009558475152599 0.033082219187026196
		0 0.43038608189734973 0.040479229313370405
		0 0.41910949382796403 0.045150171201968431
		0 0.40701336556450002 0.046785332824526391
		0 0.39491723730103528 0.045150171201968431
		0 0.38364061684515788 0.040479229313370405
		0 0.37393114637747399 0.033082219187026196
		0 0.36653413625112968 0.023372748719342518
		0 0.36186319436253173 0.012096128263464226
		0 0.36022803273997367 0
		0 0.0047582263360196686 0
		;
createNode transform -n "fingers_ik" -p "fingersBend_group";
	rename -uid "6D5CD69E-481D-82C5-97B9-0A82EEAC8B33";
	addAttr -ci true -sn "thumbMult1" -ln "thumbMult1" -at "double";
	addAttr -ci true -sn "thumbMult2" -ln "thumbMult2" -at "double";
	addAttr -ci true -sn "thumbMult3" -ln "thumbMult3" -at "double";
	addAttr -ci true -sn "indexMult1" -ln "indexMult1" -at "double";
	addAttr -ci true -sn "indexMult2" -ln "indexMult2" -at "double";
	addAttr -ci true -sn "indexMult3" -ln "indexMult3" -at "double";
	addAttr -ci true -sn "middleMult1" -ln "middleMult1" -at "double";
	addAttr -ci true -sn "middleMult2" -ln "middleMult2" -at "double";
	addAttr -ci true -sn "middleMult3" -ln "middleMult3" -at "double";
	addAttr -ci true -sn "ringMult1" -ln "ringMult1" -at "double";
	addAttr -ci true -sn "ringMult2" -ln "ringMult2" -at "double";
	addAttr -ci true -sn "ringMult3" -ln "ringMult3" -at "double";
	addAttr -ci true -sn "pinkyMult1" -ln "pinkyMult1" -at "double";
	addAttr -ci true -sn "pinkyMult2" -ln "pinkyMult2" -at "double";
	addAttr -ci true -sn "pinkyMult3" -ln "pinkyMult3" -at "double";
	addAttr -ci true -sn "spreadThumbMult" -ln "spreadThumbMult" -at "double";
	addAttr -ci true -sn "spreadIndexRootMult" -ln "spreadIndexRootMult" -at "double";
	addAttr -ci true -sn "spreadMiddleRootMult" -ln "spreadMiddleRootMult" -at "double";
	addAttr -ci true -sn "spreadRingRootMult" -ln "spreadRingRootMult" -at "double";
	addAttr -ci true -sn "spreadPinkyRootMult" -ln "spreadPinkyRootMult" -at "double";
	addAttr -ci true -sn "spreadIndexMult" -ln "spreadIndexMult" -at "double";
	addAttr -ci true -sn "spreadMiddleMult" -ln "spreadMiddleMult" -at "double";
	addAttr -ci true -sn "spreadRingMult" -ln "spreadRingMult" -at "double";
	addAttr -ci true -sn "spreadPinkyMult" -ln "spreadPinkyMult" -at "double";
	addAttr -ci true -sn "thumbIk" -ln "thumbIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "IndexIk" -ln "IndexIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "middleIk" -ln "middleIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "ringIk" -ln "ringIk" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "pinkyIk" -ln "pinkyIk" -min 0 -max 1 -at "double";
	setAttr -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mnrl" -type "double3" -40 -45 -45 ;
	setAttr ".mxrl" -type "double3" 40 45 45 ;
	setAttr ".mrxe" yes;
	setAttr ".xrxe" yes;
	setAttr ".thumbMult1" -1;
	setAttr ".thumbMult2" -1;
	setAttr ".thumbMult3" -1;
	setAttr ".indexMult1" -1;
	setAttr ".indexMult2" -1;
	setAttr ".indexMult3" -1;
	setAttr ".middleMult1" -1;
	setAttr ".middleMult2" -1;
	setAttr ".middleMult3" -1;
	setAttr ".ringMult1" -1;
	setAttr ".ringMult2" -1;
	setAttr ".ringMult3" -1;
	setAttr ".pinkyMult1" -1;
	setAttr ".pinkyMult2" -1;
	setAttr ".pinkyMult3" -1;
	setAttr ".spreadThumbMult" -0.48;
	setAttr ".spreadIndexRootMult" -0.5;
	setAttr ".spreadMiddleRootMult" -0.26000000000000012;
	setAttr ".spreadRingRootMult" 0.069999999999999979;
	setAttr ".spreadPinkyRootMult" 0.17000000000000004;
	setAttr ".spreadIndexMult" -0.68;
	setAttr ".spreadMiddleMult" -0.20000000000000007;
	setAttr ".spreadRingMult" 0.22999999999999998;
	setAttr ".spreadPinkyMult" 0.85000000000000009;
createNode transform -n "root_ik_pos_loc" -p "fingers_ik";
	rename -uid "DC5FE07F-4F78-77C2-0190-26A1464B4158";
	setAttr ".v" no;
createNode locator -n "root_ik_pos_locShape" -p "root_ik_pos_loc";
	rename -uid "5F34E57A-4C86-BA19-307C-01B9EF185281";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_pos_loc" -p "fingers_ik";
	rename -uid "83A3CD3E-48B1-F24D-8DD0-34AFD36E135E";
createNode locator -n "root_pos_locShape" -p "root_pos_loc";
	rename -uid "E30CED11-482A-9675-6C95-81BBE6A93113";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "palmBend_ik_group" -p "root_pos_loc";
	rename -uid "6A1B151F-49B5-F00B-4661-889B31F3E7C1";
createNode transform -n "palmBend" -p "palmBend_ik_group";
	rename -uid "D8FA1663-4EC8-20E7-8967-ECA226642AEA";
	setAttr -l on -k off ".v";
createNode nurbsCurve -n "palmBendShape" -p "palmBend";
	rename -uid "20978D4D-461B-5B07-391A-5298E3ADFD73";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.095520931777549528 0.095520931777549528 0.16300951223519405
		-0.095520931777549528 0.095520931777549528 -0.16300951223519405
		0.095520931777549528 0.095520931777549528 -0.16300951223519405
		0.095520931777549528 0.095520931777549528 0.16300951223519405
		-0.095520931777549528 0.095520931777549528 0.16300951223519405
		-0.095520931777549528 -0.095520931777549528 0.16300951223519405
		-0.095520931777549528 -0.095520931777549528 -0.16300951223519405
		-0.095520931777549528 0.095520931777549528 -0.16300951223519405
		-0.095520931777549528 0.095520931777549528 0.16300951223519405
		-0.095520931777549528 -0.095520931777549528 0.16300951223519405
		0.095520931777549528 -0.095520931777549528 0.16300951223519405
		0.095520931777549528 0.095520931777549528 0.16300951223519405
		0.095520931777549528 0.095520931777549528 -0.16300951223519405
		0.095520931777549528 -0.095520931777549528 -0.16300951223519405
		0.095520931777549528 -0.095520931777549528 0.16300951223519405
		0.095520931777549528 -0.095520931777549528 -0.16300951223519405
		-0.095520931777549528 -0.095520931777549528 -0.16300951223519405
		;
createNode transform -n "roots_group" -p "palmBend";
	rename -uid "4257EBED-447D-59E6-F836-E3928CDEAC01";
createNode transform -n "middleFingerRoot_group" -p "roots_group";
	rename -uid "B5CC0B8B-495F-A966-1815-6896457F080E";
createNode transform -n "middleFingerRoot_spread_group" -p "middleFingerRoot_group";
	rename -uid "0F9D1AE6-4C8E-C56E-C515-3395158DAA55";
createNode transform -n "middleFingerRoot" -p "middleFingerRoot_spread_group";
	rename -uid "610CCD46-458D-C21C-66E2-E28F098D7EA3";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleFingerRoot";
createNode nurbsCurve -n "middleFingerRootShape" -p "middleFingerRoot";
	rename -uid "580744E0-472F-9CBC-4F63-88BEA585BC98";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		-0.11058012735237834 0.15837953903413829 -2.5341824900502355e-17
		-0.078191957915338561 0.15837953903413829 0.023634498225209848
		-1.9432095297948168e-16 0.15837953903413829 0.033424227929974709
		0.078191957915338242 0.15837953903413829 0.023634498225209848
		0.11058012735237803 0.15837953903413829 2.2958981684278014e-18
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		;
createNode aimConstraint -n "middleFingerRoot_spread_group_aimConstraint1" -p "middleFingerRoot_spread_group";
	rename -uid "34A39FBF-4E8C-5001-4A52-269F387D71B2";
	addAttr -dcb 0 -ci true -sn "w0" -ln "middleFinger_1W0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 0.0013979046340865456 -8.6871573675554563e-22 4.1150305645541921e-19 ;
	setAttr -k on ".w0";
createNode transform -n "ringFingerRoot_group" -p "roots_group";
	rename -uid "EF8903F5-469B-8BC9-1054-978DEEFC39F6";
createNode transform -n "ringFingerRoot_init_group" -p "ringFingerRoot_group";
	rename -uid "2C8742FC-4C82-3AFF-21FA-C8A331A99DF1";
createNode transform -n "ringFingerRoot_spread_group" -p "ringFingerRoot_init_group";
	rename -uid "60A40272-4126-8D37-92BF-9C973340343F";
createNode transform -n "ringFingerRoot" -p "ringFingerRoot_spread_group";
	rename -uid "DDC34009-4696-AE91-0F0C-BAA0B5CEDA56";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ringFingerRoot";
createNode nurbsCurve -n "ringFingerRootShape" -p "ringFingerRoot";
	rename -uid "9B1787E2-446D-4392-D34B-7688F62FDF1C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		-0.11058012735237834 0.15837953903413829 -2.5341824900502355e-17
		-0.078191957915338561 0.15837953903413829 0.023634498225209848
		-1.9432095297948168e-16 0.15837953903413829 0.033424227929974709
		0.078191957915338242 0.15837953903413829 0.023634498225209848
		0.11058012735237803 0.15837953903413829 2.2958981684278014e-18
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		;
createNode aimConstraint -n "ringFingerRoot_spread_group_aimConstraint1" -p "ringFingerRoot_spread_group";
	rename -uid "4AB6F98D-4B52-3000-9A5E-8FA484CD930A";
	addAttr -dcb 0 -ci true -sn "w0" -ln "ringFinger_1W0" -dv 1 -at "double";
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
createNode transform -n "pinkyFingerRoot_group" -p "roots_group";
	rename -uid "3D14A8E5-405E-8F05-5D55-9CA21D92F700";
createNode transform -n "pinkyFingerRoot_init_group" -p "pinkyFingerRoot_group";
	rename -uid "95F1DD1E-4ED8-5B63-4169-ECA492180881";
createNode transform -n "pinkyFingerRoot_spread_group" -p "pinkyFingerRoot_init_group";
	rename -uid "B88333CC-4F25-5590-7CCF-F9A56EE05CE3";
createNode transform -n "pinkyFingerRoot" -p "pinkyFingerRoot_spread_group";
	rename -uid "2FAAEADD-4EDB-67AD-79A4-24A09E6C56AA";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "pinkyFingerRoot";
createNode nurbsCurve -n "pinkyFingerRootShape" -p "pinkyFingerRoot";
	rename -uid "692765D4-4C07-A63D-0C6C-57AD907DF9F9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		-0.11058012735237834 0.15837953903413829 -2.5341824900502355e-17
		-0.078191957915338561 0.15837953903413829 0.023634498225209848
		-1.9432095297948168e-16 0.15837953903413829 0.033424227929974709
		0.078191957915338242 0.15837953903413829 0.023634498225209848
		0.11058012735237803 0.15837953903413829 2.2958981684278014e-18
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		;
createNode aimConstraint -n "pinkyFingerRoot_spread_group_aimConstraint1" -p "pinkyFingerRoot_spread_group";
	rename -uid "B9BE398D-404C-820C-7ACD-1A98D0292BA5";
	addAttr -dcb 0 -ci true -sn "w0" -ln "pinkyFinger_1W0" -dv 1 -at "double";
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
createNode transform -n "indexFingerRoot_group" -p "roots_group";
	rename -uid "671FFCA6-45D4-0264-E6E2-4CB027D4549B";
createNode transform -n "indexFingerRoot_init_group" -p "indexFingerRoot_group";
	rename -uid "CC24D0FE-4B0F-E597-E18A-1D8D23AF3F1E";
createNode transform -n "indexFingerRoot_spread_group" -p "indexFingerRoot_init_group";
	rename -uid "E5BE5CB7-4A2C-C1B0-E388-EFA5CC22F9F9";
createNode transform -n "indexFingerRoot" -p "indexFingerRoot_spread_group";
	rename -uid "D181EB10-4AE4-9666-C89A-3DB4DEF2B301";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "indexFingerRoot";
createNode nurbsCurve -n "indexFingerRootShape" -p "indexFingerRoot";
	rename -uid "69DABA4E-4B23-E3A0-0374-419E25DCF602";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		-0.11058012735237834 0.15837953903413829 -2.5341824900502355e-17
		-0.078191957915338561 0.15837953903413829 0.023634498225209848
		-1.9432095297948168e-16 0.15837953903413829 0.033424227929974709
		0.078191957915338242 0.15837953903413829 0.023634498225209848
		0.11058012735237803 0.15837953903413829 2.2958981684278014e-18
		0.078191957915338256 0.15837953903413829 -0.023634498225209896
		-1.7361687283331498e-16 0.15837953903413829 -0.033424227929974758
		-0.078191957915338561 0.15837953903413829 -0.023634498225209896
		;
createNode aimConstraint -n "indexFingerRoot_spread_group_aimConstraint1" -p "indexFingerRoot_spread_group";
	rename -uid "7BE90B9A-4D97-3191-9F4B-E48B51ED574C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "indexFinger_1W0" -dv 1 -at "double";
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
	setAttr ".u" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 180 -8.2594819521687287e-14 5.0574740676693841e-30 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "root_pos_loc_parentConstraint1" -p "root_pos_loc";
	rename -uid "DF0E7A6B-4D82-2C8A-6BFE-0880C8AC33D8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_fk_pos_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_ik_pos_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.69383310128950526 -0.19088187543843663 0 ;
	setAttr ".rsrr" -type "double3" 0 0 15.38222188777657 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode nurbsCurve -n "fingers_ikShape" -p "fingers_ik";
	rename -uid "E06E1452-46C9-2FD5-471A-099B6C93FE29";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		-7.0453279928137198e-18 0.53309979089971327 0.11426301717673096
		-7.0453279928137244e-18 0.56315363129507845 0.11426301717673096
		-5.5208009163404014e-18 0.62326131208580859 0.089365600590417704
		-2.2522669299535087e-33 0.66060743696527813 -0.00079592059567744496
		5.5208009163404014e-18 0.62326131208580859 -0.090957441781772411
		7.8075915310503867e-18 0.56315363129507845 -0.1160622492427159
		7.8075915310503867e-18 0.53309979089971338 -0.1160622492427159
		;
createNode transform -n "fingersRoot_group" -p "fingersBend_group";
	rename -uid "E38FE1CF-4732-06DD-3072-5B8A16899CAF";
createNode transform -n "fingersRoot" -p "fingersRoot_group";
	rename -uid "D65169FC-43CF-3EB6-7760-1787B28947BE";
	setAttr -l on -k off ".v";
createNode nurbsCurve -n "fingersRootShape" -p "fingersRoot";
	rename -uid "93ED42E4-4B8F-9BFA-9E05-6EB0A0F9182F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.095520931777549528 0.095520931777549528 0.40431760370884073
		-0.095520931777549528 0.095520931777549528 -0.40431760370884073
		0.095520931777549528 0.095520931777549528 -0.40431760370884073
		0.095520931777549528 0.095520931777549528 0.40431760370884073
		-0.095520931777549528 0.095520931777549528 0.40431760370884073
		-0.095520931777549528 -0.095520931777549528 0.40431760370884073
		-0.095520931777549528 -0.095520931777549528 -0.40431760370884073
		-0.095520931777549528 0.095520931777549528 -0.40431760370884073
		-0.095520931777549528 0.095520931777549528 0.40431760370884073
		-0.095520931777549528 -0.095520931777549528 0.40431760370884073
		0.095520931777549528 -0.095520931777549528 0.40431760370884073
		0.095520931777549528 0.095520931777549528 0.40431760370884073
		0.095520931777549528 0.095520931777549528 -0.40431760370884073
		0.095520931777549528 -0.095520931777549528 -0.40431760370884073
		0.095520931777549528 -0.095520931777549528 0.40431760370884073
		0.095520931777549528 -0.095520931777549528 -0.40431760370884073
		-0.095520931777549528 -0.095520931777549528 -0.40431760370884073
		;
createNode transform -n "pinkyFingerRootIk_loc" -p "fingersRoot";
	rename -uid "E6A11457-4D53-AB5A-7D83-73B84EC268D5";
	setAttr ".v" no;
createNode locator -n "pinkyFingerRootIk_locShape" -p "pinkyFingerRootIk_loc";
	rename -uid "F89FFC8B-4616-D102-04F0-75A9FE00AE11";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ringFingerRootIk_loc" -p "fingersRoot";
	rename -uid "B3F3B2A0-4D2E-4CDB-7A3A-7496927058B9";
	setAttr ".v" no;
createNode locator -n "ringFingerRootIk_locShape" -p "ringFingerRootIk_loc";
	rename -uid "0B275D15-4031-8B32-7E87-86A2D397A071";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middleFingerRootIk_loc" -p "fingersRoot";
	rename -uid "2E94DB6E-4899-5C0E-0E73-04A0CE7521AE";
	setAttr ".v" no;
createNode locator -n "middleFingerRootIk_locShape" -p "middleFingerRootIk_loc";
	rename -uid "6C30F55A-4421-6B71-210E-F88930A3CE40";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "indexFingerRootIk_loc" -p "fingersRoot";
	rename -uid "8D5750BD-4012-0E22-751F-2CA3C3941D92";
	setAttr ".v" no;
createNode locator -n "indexFingerRootIk_locShape" -p "indexFingerRootIk_loc";
	rename -uid "A1E0A596-4FB7-905F-CC79-97B3155692EB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pinkyFingerRootIk_init" -p "fingersRoot_group";
	rename -uid "BF79DEC1-42A2-481D-4F9A-5093448F3462";
	setAttr ".v" no;
createNode locator -n "pinkyFingerRootIk_initShape" -p "pinkyFingerRootIk_init";
	rename -uid "99A032B9-47F8-5ED8-05B2-BBBCCA7BA150";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ringFingerRootIk_init" -p "fingersRoot_group";
	rename -uid "0692399F-4F3C-A8B3-E4A6-4BADE734F003";
	setAttr ".v" no;
createNode locator -n "ringFingerRootIk_initShape" -p "ringFingerRootIk_init";
	rename -uid "EF8D61FD-4D12-D2A9-1E6C-799654CA4127";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middleFingerRootIk_init" -p "fingersRoot_group";
	rename -uid "5BCA611E-4935-2677-0C2B-C9A19BC69E49";
	setAttr ".v" no;
createNode locator -n "middleFingerRootIk_initShape" -p "middleFingerRootIk_init";
	rename -uid "3FD95F13-4FE5-1D19-0B4C-13B65A008DC6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "indexFingerRootIk_init" -p "fingersRoot_group";
	rename -uid "3DF3B09E-4123-E743-38D4-ED87EF6A95C7";
	setAttr ".v" no;
createNode locator -n "indexFingerRootIk_initShape" -p "indexFingerRootIk_init";
	rename -uid "778687DE-425E-3C0F-5FA8-999500E07C69";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_fk_pos_loc" -p "fingersBend_group";
	rename -uid "7E20DE40-40C5-4412-28E1-D6BCD7BCF388";
	setAttr ".v" no;
createNode locator -n "root_fk_pos_locShape" -p "root_fk_pos_loc";
	rename -uid "F26B1A8A-4BA2-AFFC-129C-2B8E88ADBF9B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "b_bend_group" -p "controls";
	rename -uid "6192D555-4168-07A7-675C-7DB4D03FD6C2";
createNode transform -n "b_bend" -p "b_bend_group";
	rename -uid "58C204E3-4DE8-3FB4-0C23-F58CFBBF2B18";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "clench";
createNode nurbsCurve -n "b_bendShape" -p "b_bend";
	rename -uid "FDFBDAEA-4143-5169-6997-F2B9320B54B6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		0.15723088248344386 0.21968701916165059 -0.36328228002163765
		0.15723088248344386 0.21968701916165059 -0.38796170273695968
		0.15723088248344386 0.17214930205277043 -0.43732054816760374
		0.15723088248344386 7.0451939268374022e-17 -0.46798820296827848
		0.15723088248344386 -0.17214930205277043 -0.43732054816760374
		0.15723088248344388 -0.22008299955162255 -0.38796170273695968
		0.15723088248344388 -0.22008299955162255 -0.3632822800216377
		;
createNode transform -n "ringFinger_bend_target" -p "b_bend";
	rename -uid "4EB805DA-4992-6D7D-AC6C-929359C68FCE";
createNode transform -n "pinkyFinger_bend_target" -p "b_bend";
	rename -uid "59C7C81C-4600-C792-572F-DCB602DF989A";
createNode transform -n "f_bend_group" -p "controls";
	rename -uid "58BB4701-4BC6-56D9-190B-DA9DBEA4DA13";
	setAttr ".s" -type "double3" -1 -1 1 ;
createNode transform -n "f_bend" -p "f_bend_group";
	rename -uid "B8FE71BB-4642-1302-EFAF-1083DD9154A8";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "clench";
createNode nurbsCurve -n "f_bendShape" -p "f_bend";
	rename -uid "740369C8-4B03-BF8A-EEF8-96ADCA44573F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		-0.16525373025930989 0.21968701916165065 0.40228164148328804
		-0.16525373025930989 0.21968701916165065 0.42696106419861035
		-0.16525373025930989 0.17214930205277049 0.47631990962925497
		-0.16525373025930989 4.6524799481617141e-17 0.50698756442992976
		-0.16525373025930989 -0.17214930205277038 0.47631990962925497
		-0.16525373025930992 -0.2200829995516225 0.42696106419861035
		-0.16525373025930992 -0.2200829995516225 0.4022816414832881
		;
createNode transform -n "indexFinger_bend_target" -p "f_bend";
	rename -uid "90C15E0B-4074-F4CA-D943-78BBED1BEB8F";
createNode transform -n "thumFinger_bend_target" -p "f_bend";
	rename -uid "952A90F3-4149-B611-E7CD-E4B9E2A573D8";
createNode transform -n "thumbFinger_group_2" -p "controls";
	rename -uid "787D1157-420B-E966-D1E4-B49B8758C75D";
	setAttr ".opm" -type "matrix" 0.94139112824239968 -0.31137312720125182 -0.12972863725259345 0
		 0.32164174744443069 0.94448095354307593 0.067099289826755559 0 0.10163331130783324 -0.10489282173378198 0.98927658719962142 0
		 -0.617850002254272 0.44644557949267749 0.19808537913402385 1;
createNode transform -n "thumbFinger_group_1" -p "thumbFinger_group_2";
	rename -uid "8FFF8DE7-49B2-B269-49E2-CBB63485459C";
createNode transform -n "thumbFinger_group" -p "thumbFinger_group_1";
	rename -uid "90799C8D-4B7B-1588-874D-338AD6DAE43E";
createNode transform -n "thumbFinger_spread_group" -p "thumbFinger_group";
	rename -uid "B96EAC23-4D79-1A60-204E-63BB0C9A4190";
createNode transform -n "thumbFinger_1_closed" -p "thumbFinger_spread_group";
	rename -uid "25B9EE2B-4918-2755-0455-FDBEBEE84C72";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_1";
createNode nurbsCurve -n "thumbFinger_1_closedShape" -p "thumbFinger_1_closed";
	rename -uid "538D73CF-40A2-FE93-EB44-A2A06CBBE36B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		-1.6397282935425918e-18 5.3340701647916606e-17 0.13070295765995757
		-7.2988791812191686e-18 -0.092420947682493967 0.092420947682493995
		-9.6429762304105483e-18 -0.13070295765995757 5.3261139765149508e-17
		-7.2988791812191794e-18 -0.092420947682493995 -0.092420947682493954
		-1.6397282935426091e-18 -5.4734559078045844e-17 -0.13070295765995757
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "thumbFinger_1_group_3" -p "thumbFinger_spread_group";
	rename -uid "EB3A447A-4407-B3F4-2C72-C89F84A15A8E";
createNode transform -n "thumbFinger_1" -p "thumbFinger_1_group_3";
	rename -uid "7CDD038D-4DBB-1AD5-1594-6BA591A41ABA";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 0 1.3877787807814457e-17 1.3877787807814457e-17 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_1";
createNode transform -n "thumbFinger_2_group" -p "thumbFinger_1";
	rename -uid "BF363C20-44B7-8F9A-5426-E681C70C1A11";
createNode transform -n "thumbFinger_2_closed" -p "thumbFinger_2_group";
	rename -uid "1EE1C2FE-42A0-7A6C-EE72-F1BF0120AE54";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_1";
createNode nurbsCurve -n "thumbFinger_2_closedShape" -p "thumbFinger_2_closed";
	rename -uid "1E4AAFCA-44FD-F8ED-4246-4F9CDA140C3E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		-1.6397282935425918e-18 5.3340701647916606e-17 0.13070295765995757
		-7.2988791812191686e-18 -0.092420947682493967 0.092420947682493995
		-9.6429762304105483e-18 -0.13070295765995757 5.3261139765149508e-17
		-7.2988791812191794e-18 -0.092420947682493995 -0.092420947682493954
		-1.6397282935426091e-18 -5.4734559078045844e-17 -0.13070295765995757
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "thumbFinger_2_group_2" -p "thumbFinger_2_group";
	rename -uid "26A30A21-43B0-AB4D-2EA8-24B8C490225F";
createNode transform -n "thumbFinger_2" -p "thumbFinger_2_group_2";
	rename -uid "BF1C967D-4C99-DA65-4A7F-AC839698410F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_2";
createNode transform -n "thumbFinger_3_group" -p "thumbFinger_2";
	rename -uid "0BFB068F-4FB1-6E4C-1047-EB98CEF3C8EE";
createNode transform -n "thumbFinger_3_closed" -p "thumbFinger_3_group";
	rename -uid "78269E4E-4805-964E-9414-0FBF0D83EA94";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_1";
createNode nurbsCurve -n "thumbFinger_3_closedShape" -p "thumbFinger_3_closed";
	rename -uid "055C369B-4D66-EA6F-6CFE-318569CAC355";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		-1.6397282935425918e-18 5.3340701647916606e-17 0.13070295765995757
		-7.2988791812191686e-18 -0.092420947682493967 0.092420947682493995
		-9.6429762304105483e-18 -0.13070295765995757 5.3261139765149508e-17
		-7.2988791812191794e-18 -0.092420947682493995 -0.092420947682493954
		-1.6397282935426091e-18 -5.4734559078045844e-17 -0.13070295765995757
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "thumbFinger_3_group_2" -p "thumbFinger_3_group";
	rename -uid "7E59D4BA-41E3-202F-B191-688FA87FBCE1";
createNode transform -n "thumbFinger_3" -p "thumbFinger_3_group_2";
	rename -uid "CAEE283A-4A92-54A4-C987-18A3945732F0";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_3";
createNode nurbsCurve -n "thumbFinger_3Shape" -p "thumbFinger_3";
	rename -uid "4E91AA16-4578-D2D1-23AB-5EA516A5D9CC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-2.1638545403735467e-16 0.092420947682493954 -0.09242094768249412
		-2.1404135698816335e-16 0.13070295765995757 2.5537797597078838e-18
		-2.1638545403735467e-16 0.092420947682493967 0.092420947682493954
		-2.2204460492503126e-16 3.9462913840101977e-17 0.13070295765995757
		-2.2770375581270792e-16 -0.092420947682493967 0.092420947682493995
		-2.3004785286189906e-16 -0.13070295765995757 2.7025487068467848e-17
		-2.2770375581270792e-16 -0.092420947682493995 -0.092420947682493995
		-2.2204460492503136e-16 -6.8612346885860326e-17 -0.13070295765995757
		-2.1638545403735467e-16 0.092420947682493954 -0.09242094768249412
		-2.1404135698816335e-16 0.13070295765995757 2.5537797597078838e-18
		-2.1638545403735467e-16 0.092420947682493967 0.092420947682493954
		;
createNode transform -n "thumbFinger_ik_parentSwitcher_group" -p "thumbFinger_3";
	rename -uid "AE680DCB-4D7D-62D7-47B1-E4826835548A";
createNode transform -n "thumbFinger_ik" -p "thumbFinger_ik_parentSwitcher_group";
	rename -uid "AD0F49A9-458C-A102-AEA3-2A957085FB28";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -k true -sn "parent" -ln "parent" -min 0 -max 2 -en "finger:hand:world" 
		-at "enum";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -av ".rp" -type "double3" 0.30000000000000027 -1.3877787807814457e-17 -8.3266726846886741e-17 ;
	setAttr -av ".rp";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
	setAttr -k on ".parent";
createNode nurbsCurve -n "thumbFinger_ikShape" -p "thumbFinger_ik";
	rename -uid "BEBC69C2-4477-1D5D-6FE1-A088548C8831";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		;
createNode ikHandle -n "ikHandle2" -p "thumbFinger_ik";
	rename -uid "D8474942-426F-165D-3EB5-67B6415ADCEC";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle12" -p "thumbFinger_ik";
	rename -uid "4422D26E-4914-C5A9-4EE7-1F9C92AD6C26";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.29999999999966231 -2.5995811819834458e-07 -9.7144514654701197e-17 ;
	setAttr ".r" -type "double3" 0 0 -4.9648343422488909e-05 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999922 0.99999999999999978 ;
	setAttr ".pv" -type "double3" 0.70710678118654902 0.44904649441657957 0.54622087643386397 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "thumbFinger_ik_parentSwitcher_group_parentConstraint1" 
		-p "thumbFinger_ik_parentSwitcher_group";
	rename -uid "61A9271D-4992-F6A1-18D1-B7B30A4A990C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "thumbFinger_3__thumbFinger_ik__parentSwitcherTargetW0" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_connector__thumbFinger_ik__parentSwitcherTargetW1" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "mod__thumbFinger_ik__parentSwitcherTargetW2" 
		-dv 1 -min 0 -at "double";
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
	setAttr -s 3 ".tg";
	setAttr ".tg[0].tot" -type "double3" -2.2204460492503131e-16 1.6653345369377348e-16 
		4.4408920985006262e-16 ;
	setAttr ".tg[1].tot" -type "double3" -2.2204460492503131e-16 8.3266726846886741e-17 
		2.4980018054066022e-16 ;
	setAttr ".tg[1].tor" -type "double3" 1.9083328088781104e-14 -6.3611093629270233e-15 
		-2.5444437451708134e-14 ;
	setAttr ".tg[2].tot" -type "double3" -2.2204460492503131e-16 8.3266726846886741e-17 
		2.4980018054066022e-16 ;
	setAttr ".tg[2].tor" -type "double3" 1.9083328088781104e-14 -6.3611093629270233e-15 
		-2.5444437451708134e-14 ;
	setAttr ".rst" -type "double3" -4.4408920985006262e-16 8.3266726846886741e-17 4.163336342344337e-17 ;
	setAttr ".rsrr" -type "double3" -1.3782403619675239e-14 5.8310169160164492e-15 1.5902773407317584e-14 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget" -p "thumbFinger_3";
	rename -uid "45AEA79A-4055-3882-E779-B983D2B842B9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -8.3266726846886741e-17 -2.9143354396410359e-16 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 1 ;
createNode locator -n "thumbFinger_3__thumbFinger_ik__parentSwitcherTargetShape" 
		-p "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget";
	rename -uid "85C07FB3-4335-4E08-7F8A-51B7B265C5B6";
	setAttr -k off ".v";
createNode nurbsCurve -n "thumbFinger_2Shape" -p "thumbFinger_2";
	rename -uid "F0A5601F-45B6-4681-308B-5088B8DBD270";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.2278457093208019e-16 0.092420947682493954 -0.092420947682494051
		2.2512866798127118e-16 0.13070295765995757 -4.2119429501630219e-17
		2.2278457093208019e-16 0.092420947682493967 0.092420947682493995
		2.1712542004440358e-16 6.9618179208747175e-17 0.13070295765995757
		2.1146626915672689e-16 -0.092420947682493967 0.092420947682494023
		2.0912217210753572e-16 -0.13070295765995757 -1.7647722192870079e-17
		2.1146626915672687e-16 -0.092420947682493995 -0.092420947682493954
		2.1712542004440358e-16 -3.8457081517215041e-17 -0.13070295765995757
		2.2278457093208019e-16 0.092420947682493954 -0.092420947682494051
		2.2512866798127118e-16 0.13070295765995757 -4.2119429501630219e-17
		2.2278457093208019e-16 0.092420947682493967 0.092420947682493995
		;
createNode nurbsCurve -n "thumbFinger_1Shape" -p "thumbFinger_1";
	rename -uid "A4DE4552-4087-0507-42F7-9F8ECF3649B3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		-1.6397282935425918e-18 5.3340701647916606e-17 0.13070295765995757
		-7.2988791812191686e-18 -0.092420947682493967 0.092420947682493995
		-9.6429762304105483e-18 -0.13070295765995757 5.3261139765149508e-17
		-7.2988791812191794e-18 -0.092420947682493995 -0.092420947682493954
		-1.6397282935426091e-18 -5.4734559078045844e-17 -0.13070295765995757
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		;
createNode joint -n "thumbFinger_1_ikJoint" -p "thumbFinger_1";
	rename -uid "7D926BEF-467E-E1B6-AD15-3BB725DFBCF3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 39.423481872088352 -45.000029794880774 5.1254738908301029e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -49.300325076282057 33.108133597606525 -32.417492604221138 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.7279774505630681 2.6367414299060319 0.24207929103528197 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_2_ikJoint" -p "thumbFinger_1_ikJoint";
	rename -uid "69B91F47-4FB2-1CA4-8ED8-53ABC52A5B2A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 1.8910771268981335e-15 -1.1029537740822657e-14 -9.5900292564926658e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -10 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.8545816034067619 2.6335331930968731 0.29000027437242898 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_3_ikJoint" -p "thumbFinger_2_ikJoint";
	rename -uid "4B6F7DF1-4C53-6717-EDEA-F1BE71A59E8C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29353968745180481 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.945827245434339 2.631220965410396 0.32453769508871033 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_end_ikJoint" -p "thumbFinger_3_ikJoint";
	rename -uid "694C28DF-4463-D0FB-D19C-1AB694A6ABBB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29999999999999982 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115796 -0.031006291119996469 0.46313662254181498 0
		 0.010792652932731619 1.3072871093841545 0.059007385618243875 0 -0.46404788532125774 -0.051351366348019949 1.2225467420838616 0
		 2.0262383384181293 2.6291832930020518 0.35497412672202061 1;
	setAttr ".radi" 0.2;
createNode orientConstraint -n "thumbFinger_3_ikJoint_orientConstraint1" -p "thumbFinger_3_ikJoint";
	rename -uid "8FD7D11A-4CE4-7AD5-7BD5-18B02EA9DC0C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "thumbFinger_ikW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 0 4.8982722708278178e-05 ;
	setAttr ".rsrr" -type "double3" 0.204057447212875 -2.889592993710369 11.76798130632168 ;
	setAttr -k on ".w0";
createNode ikEffector -n "effector12" -p "thumbFinger_3_ikJoint";
	rename -uid "7EA676F0-423C-1751-E018-F0B014724687";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector2" -p "thumbFinger_2_ikJoint";
	rename -uid "39FE64DA-417D-320D-BE20-7F89744242CA";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "thumbFinger_1_spread" -p "thumbFinger_spread_group";
	rename -uid "FDA10644-4AB9-2042-36F5-2A99D4631A04";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -0.021135422572635468 0.053721240804565681 0.070410469673720583 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 4.5938444769724756 -14.165246906402666 22.744210377296017 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "thumbFinger_1";
createNode nurbsCurve -n "thumbFinger_1_spreadShape" -p "thumbFinger_1_spread";
	rename -uid "2135FBE1-489A-FA85-3EA6-0F8A18F82D2D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		-1.6397282935425918e-18 5.3340701647916606e-17 0.13070295765995757
		-7.2988791812191686e-18 -0.092420947682493967 0.092420947682493995
		-9.6429762304105483e-18 -0.13070295765995757 5.3261139765149508e-17
		-7.2988791812191794e-18 -0.092420947682493995 -0.092420947682493954
		-1.6397282935426091e-18 -5.4734559078045844e-17 -0.13070295765995757
		4.0194225941339692e-18 0.092420947682493954 -0.092420947682494065
		6.3635196433253381e-18 0.13070295765995757 2.87894324563895e-17
		4.0194225941339754e-18 0.092420947682493967 0.092420947682493967
		;
createNode parentConstraint -n "thumbFinger_group_2_parentConstraint1" -p "thumbFinger_group_2";
	rename -uid "D779DFFF-412E-4858-4FAA-C28603D78A5D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_pos_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -6.0524477852736958 -5.8332315719176631 18.863575490712449 ;
	setAttr ".rst" -type "double3" 0.75573658241013719 0.033202958199135768 -0.05424999829214032 ;
	setAttr ".rsrr" -type "double3" 3.5509295655025772 -5.0733380051613288 -2.6014059846619877 ;
	setAttr -k on ".w0";
createNode transform -n "indexFinger_1_loc" -p "controls";
	rename -uid "65296D73-41B1-D9D5-C04C-5387C82E877C";
createNode locator -n "indexFinger_1_locShape" -p "indexFinger_1_loc";
	rename -uid "736697F3-4F88-D8AD-86C5-F69ED9F26A9F";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "indexFinger_1_group_3" -p "indexFinger_1_loc";
	rename -uid "7BDDFC41-4728-E73C-6DC5-07B443891A55";
createNode transform -n "indexFinger_1" -p "indexFinger_1_group_3";
	rename -uid "D2A8224C-42AA-EA1D-354C-3E907EB89F0C";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_1";
createNode transform -n "indexFinger_2_group" -p "indexFinger_1";
	rename -uid "D02931BB-4C41-2546-DED6-F9A658E22F21";
createNode transform -n "indexFinger_2_closed" -p "indexFinger_2_group";
	rename -uid "527C7A6B-4BE7-EBBC-F0E3-AAB78655C726";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_2";
createNode nurbsCurve -n "indexFinger_2_closedShape" -p "indexFinger_2_closed";
	rename -uid "781EA2F5-47EB-D47D-1A27-3B85A068359F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "indexFinger_2_group_2" -p "indexFinger_2_group";
	rename -uid "843AA710-4E3E-0CF3-7FFF-64886CA772D6";
createNode transform -n "indexFinger_2" -p "indexFinger_2_group_2";
	rename -uid "F9A002EB-492E-1A58-ECAC-A4A0A693763D";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_2";
createNode transform -n "indexFinger_3_group" -p "indexFinger_2";
	rename -uid "472D5E22-4685-4D6C-F89D-138AD83A056B";
createNode transform -n "indexFinger_3_closed" -p "indexFinger_3_group";
	rename -uid "E0F26157-4B72-62F6-4359-FCB700AE01D9";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -5.5511151231257827e-17 5.5511151231257827e-17 
		-5.5511151231257827e-17 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
createNode nurbsCurve -n "indexFinger_3_closedShape" -p "indexFinger_3_closed";
	rename -uid "88445B3E-4CB6-E232-3FA2-C8B1F34C877C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "indexFinger_3_group_2" -p "indexFinger_3_group";
	rename -uid "594CFDA9-4552-20C3-6C7B-85968C85F3C1";
createNode transform -n "indexFinger_3" -p "indexFinger_3_group_2";
	rename -uid "A6B6F1C1-46CE-1031-4205-9DAC3E5C3E6F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
createNode nurbsCurve -n "indexFinger_3Shape" -p "indexFinger_3";
	rename -uid "6451A010-4E34-1733-4B53-7291114239EB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "indexFinger_ik_parentSwitcher_group" -p "indexFinger_3";
	rename -uid "63088831-439F-00AB-6835-BE854A467C2C";
createNode transform -n "indexFinger_ik" -p "indexFinger_ik_parentSwitcher_group";
	rename -uid "2CF57063-471A-33D1-848C-F984B40D4138";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -k true -sn "parent" -ln "parent" -min 0 -max 2 -en "finger:hand:world" 
		-at "enum";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr ".sp" -type "double3" 0.2916392042467173 0 0 ;
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
	setAttr -k on ".parent";
createNode ikHandle -n "ikHandle1" -p "indexFinger_ik";
	rename -uid "5D38FD17-424A-4040-6ECE-84AA70DD6AF0";
	setAttr ".v" no;
	setAttr ".pv" -type "double3" 0 1 0 ;
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle6" -p "indexFinger_ik";
	rename -uid "98F328D8-4F1B-9FDD-F20C-14A7ECCA8BA3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.29999999999909877 -1.0398324728991854e-06 0 ;
	setAttr ".r" -type "double3" 0 0 -9.9296686829674548e-05 ;
	setAttr ".roc" yes;
createNode nurbsCurve -n "indexFinger_ikShape" -p "indexFinger_ik";
	rename -uid "9C807BE9-413E-3ED3-CAF8-F491A1650049";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		;
createNode parentConstraint -n "indexFinger_ik_parentSwitcher_group_parentConstraint1" 
		-p "indexFinger_ik_parentSwitcher_group";
	rename -uid "7CEAC9AC-447C-0E3A-3791-FEA2AEC45C60";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "indexFinger_3__indexFinger_ik__parentSwitcherTargetW0" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_connector__indexFinger_ik__parentSwitcherTargetW1" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "mod__indexFinger_ik__parentSwitcherTargetW2" 
		-dv 1 -min 0 -at "double";
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
	setAttr -s 3 ".tg";
	setAttr ".rst" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "indexFinger_3__indexFinger_ik__parentSwitcherTarget" -p "indexFinger_3";
	rename -uid "766DED1B-4720-2798-8EAC-2091B5DFBB59";
	setAttr ".v" no;
createNode locator -n "indexFinger_3__indexFinger_ik__parentSwitcherTargetShape" 
		-p "indexFinger_3__indexFinger_ik__parentSwitcherTarget";
	rename -uid "6479BEA3-4BEB-7C7F-848D-CD8488A4CD82";
	setAttr -k off ".v";
createNode nurbsCurve -n "indexFinger_2Shape" -p "indexFinger_2";
	rename -uid "7E0B2E42-455B-FC13-A299-7795AA57076A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode nurbsCurve -n "indexFinger_1Shape" -p "indexFinger_1";
	rename -uid "84A8A59D-41B2-8AAE-056C-1DADDE8E9D56";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode joint -n "indexFinger_1_ikJoint" -p "indexFinger_1";
	rename -uid "A5407CAD-4E13-F0FA-FD85-618923AE7841";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.7279774505630681 2.6367414299060319 0.24207929103528197 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_2_ikJoint" -p "indexFinger_1_ikJoint";
	rename -uid "A6E7141C-4A3C-07BF-54EF-FAB9AEE5DF21";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 1.8862715532077687e-15 -1.1016105038828329e-14 -9.7799942433036318e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -10 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.8545816034067619 2.6335331930968731 0.29000027437242898 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_3_ikJoint" -p "indexFinger_2_ikJoint";
	rename -uid "1DD54FDC-43A9-C53D-6748-98A579A196E3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29428747010533951 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.945827245434339 2.631220965410396 0.32453769508871033 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_end_ikJoint" -p "indexFinger_3_ikJoint";
	rename -uid "57A2BFA4-4363-11D9-F483-E2821BA5055E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29999999999999982 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115796 -0.031006291119996469 0.46313662254181498 0
		 0.010792652932731619 1.3072871093841545 0.059007385618243875 0 -0.46404788532125774 -0.051351366348019949 1.2225467420838616 0
		 2.0262383384181293 2.6291832930020518 0.35497412672202061 1;
	setAttr ".radi" 0.2;
createNode ikEffector -n "effector6" -p "indexFinger_3_ikJoint";
	rename -uid "1ED86423-44E8-98DC-4B9A-D9BB0A2BB3F8";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector1" -p "indexFinger_2_ikJoint";
	rename -uid "40E82425-4803-998E-1490-7B84898D63BB";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode parentConstraint -n "indexFinger_1_loc_parentConstraint1" -p "indexFinger_1_loc";
	rename -uid "A3D86916-4156-CAF0-F3F4-798D9F584831";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "indexFinger_initW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "indexFinger_bend_targetW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.74951730318001086 0 0.32492759417655598 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "indexFinger_1_closed" -p "indexFinger_1_loc";
	rename -uid "CB84F99C-46A3-0ACE-8922-D389470584A2";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 0 0 -5.5511151231257827e-17 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_1";
createNode nurbsCurve -n "indexFinger_1_closedShape" -p "indexFinger_1_closed";
	rename -uid "59BA6A45-4607-B862-0C34-AD8641B47D95";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "indexFinger_1_spread" -p "indexFinger_1_loc";
	rename -uid "0E2CBCAF-4B66-683B-0CD1-13BB54F9911F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -0.023600889194648422 0.0014339705474215592 0.092711641730002459 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 -19.393037314318274 0 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_1";
createNode nurbsCurve -n "indexFinger_1_spreadShape" -p "indexFinger_1_spread";
	rename -uid "E6D020A1-4C19-88C9-72A8-E5B385D9E58A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "ringFinger_1_loc" -p "controls";
	rename -uid "A5BF1FE5-4665-144D-FB90-13A0097B2558";
createNode locator -n "ringFinger_1_locShape" -p "ringFinger_1_loc";
	rename -uid "602F51C2-4D12-1F90-26BB-7FAD15ABF741";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ringFinger_1_group_3" -p "ringFinger_1_loc";
	rename -uid "82762D8D-4DF7-18A2-B537-7BB5C3601BC3";
createNode transform -n "ringFinger_1" -p "ringFinger_1_group_3";
	rename -uid "8523DBEF-498F-AF84-9D7A-D7BA31B1EFD2";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_1";
createNode transform -n "ringFinger_2_group" -p "ringFinger_1";
	rename -uid "2129030C-45F0-9B6C-7C52-DE99E037C766";
createNode transform -n "ringFinger_2_closed" -p "ringFinger_2_group";
	rename -uid "95F08693-469E-6153-714A-4AADFDCCC378";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 4.8792580198409041e-08 0 8.4256301935425881e-10 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_1";
createNode nurbsCurve -n "ringFinger_2_closedShape" -p "ringFinger_2_closed";
	rename -uid "0F1A22CF-4409-100F-05DE-59839722D24E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "ringFinger_2_group_2" -p "ringFinger_2_group";
	rename -uid "EB56FD2C-4AB0-BD22-8462-51899E0209AA";
createNode transform -n "ringFinger_2" -p "ringFinger_2_group_2";
	rename -uid "F4685B96-4E6A-28C6-6B9B-BF94DBFE9E55";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_2";
createNode transform -n "ringFinger_3_group" -p "ringFinger_2";
	rename -uid "B02EAFF5-46B0-BF47-A6F4-51AE3E0C15B4";
createNode transform -n "ringFinger_3_closed" -p "ringFinger_3_group";
	rename -uid "D397D0CD-4BF3-E6F9-1582-319BC2080D35";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" 1.1088643336876203e-09 0 8.4256301935425881e-10 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_1";
createNode nurbsCurve -n "ringFinger_3_closedShape" -p "ringFinger_3_closed";
	rename -uid "C5C13092-4BBE-8F98-7612-8E8D0185F8BD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "ringFinger_3_group_2" -p "ringFinger_3_group";
	rename -uid "BB50A809-4F88-CD34-CE68-9B93D1FFAC1F";
createNode transform -n "ringFinger_3" -p "ringFinger_3_group_2";
	rename -uid "74FC4E86-403E-279E-4BFE-F89B0EA64143";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_3";
createNode nurbsCurve -n "ringFinger_3Shape" -p "ringFinger_3";
	rename -uid "7A50D8CB-4B12-B518-8A3D-6499BAF2AFD1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "ringFinger_ik_parentSwitcher_group" -p "ringFinger_3";
	rename -uid "7F0D7DE3-4CF2-0D68-B1F4-2091439471CB";
createNode transform -n "ringFinger_ik" -p "ringFinger_ik_parentSwitcher_group";
	rename -uid "5DEC10DB-4FB6-FB0B-9CCF-868123ACD806";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -k true -sn "parent" -ln "parent" -min 0 -max 2 -en "finger:hand:world" 
		-at "enum";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
	setAttr -k on ".parent";
createNode nurbsCurve -n "ringFinger_ikShape" -p "ringFinger_ik";
	rename -uid "0D3712D3-4445-E0BC-EA79-F3951D1FC15C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		;
createNode ikHandle -n "ikHandle8" -p "ringFinger_ik";
	rename -uid "C0B20AC4-449E-7C2E-323F-629973128642";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.5475169151967236e-07 7.5778616779979824e-16 2.4980018054066022e-16 ;
	setAttr ".r" -type "double3" 0 0 -4.9648343849840429e-05 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle9" -p "ringFinger_ik";
	rename -uid "8961023B-40F0-B958-E5EB-C49047169267";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.29999974524819573 -2.5995811973726453e-07 3.3306690738754696e-16 ;
	setAttr ".r" -type "double3" 0 0 -4.9648343849362099e-05 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "ringFinger_ik_parentSwitcher_group_parentConstraint1" 
		-p "ringFinger_ik_parentSwitcher_group";
	rename -uid "241438CF-4D55-46A8-D765-8488845897BC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ringFinger_3__ringFinger_ik__parentSwitcherTargetW0" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_connector__ringFinger_ik__parentSwitcherTargetW1" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "mod__ringFinger_ik__parentSwitcherTargetW2" 
		-dv 1 -min 0 -at "double";
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
	setAttr -s 3 ".tg";
	setAttr ".tg[0].tot" -type "double3" 0 3.3881317890172014e-21 0 ;
	setAttr ".tg[1].tot" -type "double3" 0 3.3881317890172014e-21 0 ;
	setAttr ".tg[2].tot" -type "double3" 0 3.3881317890172014e-21 0 ;
	setAttr ".rst" -type "double3" -2.2204460492503131e-16 3.3881317890172014e-21 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "ringFinger_3__ringFinger_ik__parentSwitcherTarget" -p "ringFinger_3";
	rename -uid "F18D7A34-4052-AE34-988F-E4842760106D";
	setAttr ".v" no;
createNode locator -n "ringFinger_3__ringFinger_ik__parentSwitcherTargetShape" -p
		 "ringFinger_3__ringFinger_ik__parentSwitcherTarget";
	rename -uid "A0B75110-4A27-18C5-D3E3-AB85F014A0F4";
	setAttr -k off ".v";
createNode nurbsCurve -n "ringFinger_2Shape" -p "ringFinger_2";
	rename -uid "5242FEBA-41EA-BAF4-63DB-3CBCD65D2961";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode nurbsCurve -n "ringFinger_1Shape" -p "ringFinger_1";
	rename -uid "964522CA-484B-DB87-4316-A9A2996A6D82";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode joint -n "ringFinger_1_ikJoint" -p "ringFinger_1";
	rename -uid "047F5DF8-4F3D-67D1-3132-8CBA14E2034F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -2.5475146614439836e-07 0 0 ;
	setAttr ".r" -type "double3" -4.7986420036069584 0.81122829852316836 -3.5630295042447955 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.7398169632749489 -1.1047341288078878 3.483365392505239 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.7279774505630681 2.6367414299060319 0.24207929103528197 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_2_ikJoint" -p "ringFinger_1_ikJoint";
	rename -uid "2A046D2F-4854-6D06-6B9E-0D8BC77A9C12";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 1.8503533341278401e-15 -1.0818444328214854e-14 -9.9296701731081181e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -10 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.8545816034067619 2.6335331930968731 0.29000027437242898 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_3_ikJoint" -p "ringFinger_2_ikJoint";
	rename -uid "1916214D-4102-316A-41A5-29AE75ED398A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.30000000000000004 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.945827245434339 2.631220965410396 0.32453769508871033 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_end_ikJoint" -p "ringFinger_3_ikJoint";
	rename -uid "7243D7A4-4AF0-ACA2-D72C-8CB07775E209";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29999999999999982 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115796 -0.031006291119996469 0.46313662254181498 0
		 0.010792652932731619 1.3072871093841545 0.059007385618243875 0 -0.46404788532125774 -0.051351366348019949 1.2225467420838616 0
		 2.0262383384181293 2.6291832930020518 0.35497412672202061 1;
	setAttr ".radi" 0.2;
createNode ikEffector -n "effector9" -p "ringFinger_3_ikJoint";
	rename -uid "D54EF55D-4AC4-EAF3-72E6-77B60EEA8750";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector8" -p "ringFinger_2_ikJoint";
	rename -uid "CCB7BE3A-4E8D-8751-2FF1-4B9ED6B32AE5";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode parentConstraint -n "locator7_parentConstraint1" -p "ringFinger_1_loc";
	rename -uid "919A143E-4A3D-41F2-1005-28AF1F6EEC45";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ringFinger_bend_targetW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "ringFinger_initW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 5.8541028027603303e-05 0 ;
	setAttr ".rst" -type "double3" 0.75198276381993201 -5.8541028027603303e-05 -0.10755288641189402 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "ringFinger_1_closed" -p "ringFinger_1_loc";
	rename -uid "C8C6132C-4344-C13C-3085-AB8EFEDB3297";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -3.4422321659732802e-09 2.9270513168561148e-05 
		2.0071200257376631e-10 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0.00026192345257210073 2.053491694243379e-08 
		-89.99550798502581 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_1";
createNode nurbsCurve -n "ringFinger_1_closedShape" -p "ringFinger_1_closed";
	rename -uid "35EC2A27-4007-CE8F-872B-7DBC1C2C9A39";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "ringFinger_1_spread" -p "ringFinger_1_loc";
	rename -uid "96DA9048-4CC4-747B-6198-0FAF729F7321";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -0.018520458405455131 -0.0024873643174712079 
		-0.06381329998043761 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 12.462632382880583 0 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "ringFinger_1";
createNode nurbsCurve -n "ringFinger_1_spreadShape" -p "ringFinger_1_spread";
	rename -uid "E5E1EF89-4B7C-80F8-5505-1C90ED8AA1AC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "pinkyFinger_1_loc" -p "controls";
	rename -uid "7A6EA1EF-4187-23BA-1D0E-33B2B2D313D1";
createNode locator -n "pinkyFinger_1_locShape" -p "pinkyFinger_1_loc";
	rename -uid "D13151A4-4CB1-4FEF-9210-4BBD468472E0";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pinkyFinger_1_group_3" -p "pinkyFinger_1_loc";
	rename -uid "8F4BD8CF-4F90-CC6C-DF72-9C8A85DCAC92";
createNode transform -n "pinkyFinger_1" -p "pinkyFinger_1_group_3";
	rename -uid "50E92791-4ACE-638F-899A-3E9956C7CA4A";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_1";
createNode transform -n "pinkyFinger_2_group" -p "pinkyFinger_1";
	rename -uid "243D240B-4061-3EC6-E828-0C8FD8074875";
createNode transform -n "pinkyFinger_2_closed" -p "pinkyFinger_2_group";
	rename -uid "28846A39-4588-D190-F928-C1A6B8C91A99";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -3.0121681815487023e-08 0 8.1388856765229889e-10 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_1";
createNode nurbsCurve -n "pinkyFinger_2_closedShape" -p "pinkyFinger_2_closed";
	rename -uid "2E3AA41E-4E97-2A5C-AEE1-23916849F42D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "pinkyFinger_2_group_2" -p "pinkyFinger_2_group";
	rename -uid "20654A5B-4932-5AD6-FEB1-11A908E6FEBD";
createNode transform -n "pinkyFinger_2" -p "pinkyFinger_2_group_2";
	rename -uid "707C762B-493B-4737-B3C9-F49834B632BF";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_2";
createNode transform -n "pinkyFinger_3_group" -p "pinkyFinger_2";
	rename -uid "0BA1C4BC-41BB-DE7C-7372-7BAC8F62CFC1";
createNode transform -n "pinkyFinger_3_closed" -p "pinkyFinger_3_group";
	rename -uid "E792145E-45F4-3C7C-C8C8-EEA314E0F7DD";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_1";
createNode nurbsCurve -n "pinkyFinger_3_closedShape" -p "pinkyFinger_3_closed";
	rename -uid "E52C1BB5-4F18-4ED0-BB7D-1B9259059776";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "pinkyFinger_3_group_2" -p "pinkyFinger_3_group";
	rename -uid "366F2006-4742-90A5-B162-06950839B6A1";
createNode transform -n "pinkyFinger_3" -p "pinkyFinger_3_group_2";
	rename -uid "884C0149-409B-7EB0-8A25-E882A02E25D0";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_3";
createNode nurbsCurve -n "pinkyFinger_3Shape" -p "pinkyFinger_3";
	rename -uid "11B08AE5-4433-00CA-2570-0D9DCC1E7DB2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "pinkyFinger_ik_parentSwitcher_group" -p "pinkyFinger_3";
	rename -uid "4903CE9A-44FC-F94A-5A5D-B6B7423AD3EE";
createNode transform -n "pinkyFinger_ik" -p "pinkyFinger_ik_parentSwitcher_group";
	rename -uid "286CD250-4E92-6C74-B9EF-E1ADABE5726E";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -k true -sn "parent" -ln "parent" -min 0 -max 2 -en "finger:hand:world" 
		-at "enum";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
	setAttr -k on ".parent";
createNode nurbsCurve -n "pinkyFinger_ikShape" -p "pinkyFinger_ik";
	rename -uid "89E2007D-40C4-4808-68A4-0191B7C8B408";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		;
createNode ikHandle -n "ikHandle10" -p "pinkyFinger_ik";
	rename -uid "2427D340-4B6D-5DA3-08C8-56BFC1AF3F65";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 1.4005769523011657e-17 -1.3156142841808105e-14 ;
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle11" -p "pinkyFinger_ik";
	rename -uid "774826FD-4056-74BE-0F87-378F2541E439";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.29999999999999982 2.0276849085520422e-17 -1.3489209749195652e-14 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "pinkyFinger_ik_parentSwitcher_group_parentConstraint1" 
		-p "pinkyFinger_ik_parentSwitcher_group";
	rename -uid "A7194472-49F7-B2DD-C92D-56B737861152";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTargetW0" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_connector__pinkyFinger_ik__parentSwitcherTargetW1" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "mod__pinkyFinger_ik__parentSwitcherTargetW2" 
		-dv 1 -min 0 -at "double";
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
	setAttr -s 3 ".tg";
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget" -p "pinkyFinger_3";
	rename -uid "9A2A1E5D-4A9A-F9B1-8A52-5E8396958DA4";
	setAttr ".v" no;
createNode locator -n "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTargetShape" 
		-p "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget";
	rename -uid "66D201D8-44A5-5892-BA9E-92B22329736C";
	setAttr -k off ".v";
createNode nurbsCurve -n "pinkyFinger_2Shape" -p "pinkyFinger_2";
	rename -uid "2A7BF0EF-412B-4566-38C3-1E9C6006796C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode nurbsCurve -n "pinkyFinger_1Shape" -p "pinkyFinger_1";
	rename -uid "6DCD6B8F-441F-68E0-8F95-28A976C431D3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode joint -n "pinkyFinger_1_ikJoint" -p "pinkyFinger_1";
	rename -uid "3899F84C-4492-0E0C-BDE7-C6926999C390";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -1.1102230246251565e-16 0 -1.2490009027033011e-14 ;
	setAttr ".r" -type "double3" -6.4981626599884522e-07 -0.74987410937394006 -0.016232248462023098 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.00021310596961744089 0.74987407909482395 0.016283295616716827 ;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.7776693725797501 2.5895836218160579 -0.0022977627197828814 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_2_ikJoint" -p "pinkyFinger_1_ikJoint";
	rename -uid "D727AEB4-447E-E22A-CB04-8FB2D3F55071";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29999999999999993 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr ".r" -type "double3" 4.598418762071784e-31 1.0250172441239797e-14 -9.9296682536059253e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -10 ;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.896183983991486 2.549299791957818 0.016602220508937282 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_3_ikJoint" -p "pinkyFinger_2_ikJoint";
	rename -uid "5D065ACC-40EE-447A-0482-2592456B8E06";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" -6.4981627719281654e-07 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.96899508416744 2.5245508606965972 0.028213688122913739 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_end_ikJoint" -p "pinkyFinger_3_ikJoint";
	rename -uid "7028BC6B-48D2-1B57-F1F5-2287E9E53871";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.30000000000000004 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.22712031808436 -0.42037387850651287 0.173376660743986 0
		 0.4426446260086313 1.2185312218429949 -0.17845261482057717 0 -0.10411243579430152 0.22597655396083455 1.2847930327682229 0
		 2.0310584437696688 2.5041022172784917 0.042529531828269115 1;
	setAttr ".radi" 0.2;
createNode ikEffector -n "effector11" -p "pinkyFinger_3_ikJoint";
	rename -uid "6786F1FC-46CD-F85F-FC26-CF972F1DD457";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector10" -p "pinkyFinger_2_ikJoint";
	rename -uid "A94344BF-4A4A-5CEE-7F9A-B6BF9E211581";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "pinkyFinger_1_closed" -p "pinkyFinger_1_loc";
	rename -uid "60F13F4A-4930-7D5F-873C-90A04A0D2B46";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_1";
createNode nurbsCurve -n "pinkyFinger_1_closedShape" -p "pinkyFinger_1_closed";
	rename -uid "BF19B895-4D40-389F-2809-2CA8389567CE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "pinkyFinger_1_spread" -p "pinkyFinger_1_loc";
	rename -uid "6BACE0BB-4072-9CC1-7FC3-1FBDD4078332";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -0.071543311771597118 0.013073588998331775 -0.085110725281556554 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 20.480647357498469 0 ;
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "pinkyFinger_1";
createNode nurbsCurve -n "pinkyFinger_1_spreadShape" -p "pinkyFinger_1_spread";
	rename -uid "7B7D22C7-4238-008C-5188-218C11C55FA8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "indexFinger_init" -p "controls";
	rename -uid "794C3F2D-46DE-0D7F-DA6A-E28D7DBA12F0";
createNode transform -n "middleFinger_init" -p "controls";
	rename -uid "0946A463-431B-EE94-EC75-05A23043A175";
createNode transform -n "middleFinger_1_group_3" -p "middleFinger_init";
	rename -uid "7D6047F0-46F3-815D-3654-EFBBECBFB28C";
createNode transform -n "middleFinger_1" -p "middleFinger_1_group_3";
	rename -uid "F023A976-43DE-7177-3FC5-B89D1EB95531";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_1";
createNode transform -n "middleFinger_2_group" -p "middleFinger_1";
	rename -uid "A26E80C5-4E78-A450-688A-1BA7816A0831";
createNode transform -n "middleFinger_2_closed" -p "middleFinger_2_group";
	rename -uid "3DA1BD7E-4D38-E324-54AA-55B9ABB8AD99";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_3";
createNode nurbsCurve -n "middleFinger_2_closedShape" -p "middleFinger_2_closed";
	rename -uid "64EFFBDE-4EA0-CFB4-1E44-B5AB612FF55E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "middleFinger_2_group_2" -p "middleFinger_2_group";
	rename -uid "A136FB78-4E20-65F7-0621-2BAD46A547B2";
createNode transform -n "middleFinger_2" -p "middleFinger_2_group_2";
	rename -uid "284DAFAF-4AB8-70E2-CA30-0BB980EB322B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_2";
createNode transform -n "middleFinger_3_group" -p "middleFinger_2";
	rename -uid "5FC00FFE-4411-E0C5-FCC0-8E8B46E211CF";
createNode transform -n "middleFinger_3_closed" -p "middleFinger_3_group";
	rename -uid "215AA93F-491F-52AB-239A-FA9B9A8237EA";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_3";
createNode nurbsCurve -n "middleFinger_3_closedShape" -p "middleFinger_3_closed";
	rename -uid "0DFDC1F5-443A-0A93-D3BD-2B91ADC7639D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "middleFinger_3_group_2" -p "middleFinger_3_group";
	rename -uid "7A66A4C7-4A96-A435-2BA3-0C8CC94BA520";
createNode transform -n "middleFinger_3" -p "middleFinger_3_group_2";
	rename -uid "9C27E533-41CB-D4AC-9590-B4AAEC44911C";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_3";
createNode nurbsCurve -n "middleFinger_3Shape" -p "middleFinger_3";
	rename -uid "415B84A8-4BAF-8A44-7B39-D79326FB2E48";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "middleFinger_ik_parentSwitcher_group" -p "middleFinger_3";
	rename -uid "B221FAEA-4D12-C151-A1F9-7A95A369EF27";
createNode transform -n "middleFinger_ik" -p "middleFinger_ik_parentSwitcher_group";
	rename -uid "991A73AB-4068-4D21-0897-DBAE1541504D";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -k true -sn "parent" -ln "parent" -min 0 -max 2 -en "finger:hand:world" 
		-at "enum";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "indexFinger_3";
	setAttr -k on ".parent";
createNode nurbsCurve -n "middleFinger_ikShape" -p "middleFinger_ik";
	rename -uid "CB211877-4BED-7BDF-A155-E99E18B3D66C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 0.061444893903165251 0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 0.061444893903165251
		0.2450681957208361 0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.2450681957208361 -0.061444893903165251 0.061444893903165251
		0.2450681957208361 -0.061444893903165251 -0.061444893903165251
		0.0094211222086883484 -0.061444893903165251 -0.061444893903165251
		;
createNode ikHandle -n "ikHandle4" -p "middleFinger_ik";
	rename -uid "028FEB0C-4004-774B-67BE-14988BDE42F1";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle7" -p "middleFinger_ik";
	rename -uid "79703C91-4BEE-4902-EC3F-B3A75942BB7C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.29999999999954929 -5.1991623644959272e-07 0 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "middleFinger_ik_parentSwitcher_group_parentConstraint1" 
		-p "middleFinger_ik_parentSwitcher_group";
	rename -uid "63150F57-4384-D62B-E0B8-949FA8CF423E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleFinger_3__middleFinger_ik__parentSwitcherTargetW0" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_connector__middleFinger_ik__parentSwitcherTargetW1" 
		-dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "mod__middleFinger_ik__parentSwitcherTargetW2" 
		-dv 1 -min 0 -at "double";
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
	setAttr -s 3 ".tg";
	setAttr ".rst" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "middleFinger_3__middleFinger_ik__parentSwitcherTarget" -p
		 "middleFinger_3";
	rename -uid "4C6717BC-44E6-0435-3137-53B7A848AE8C";
	setAttr ".v" no;
createNode locator -n "middleFinger_3__middleFinger_ik__parentSwitcherTargetShape" 
		-p "middleFinger_3__middleFinger_ik__parentSwitcherTarget";
	rename -uid "DE2948E4-468D-9260-9511-6C9F71A7E734";
	setAttr -k off ".v";
createNode nurbsCurve -n "middleFinger_2Shape" -p "middleFinger_2";
	rename -uid "C781FC45-403A-555F-EE64-37B1C1D49D99";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode nurbsCurve -n "middleFinger_1Shape" -p "middleFinger_1";
	rename -uid "CDEA79D4-4E85-DF04-291F-5082109DE5B5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode joint -n "middleFinger_1_ikJoint" -p "middleFinger_1";
	rename -uid "90815C8C-4105-CDBC-B479-B481C0C67BF4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.7279774505630681 2.6367414299060319 0.24207929103528197 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_2_ikJoint" -p "middleFinger_1_ikJoint";
	rename -uid "26C8F879-4421-0BB0-74EF-0EBAD09E2B84";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 1.8503533341280653e-15 -1.0818444328216172e-14 -9.9296700513178612e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -10 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.8545816034067619 2.6335331930968731 0.29000027437242898 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_3_ikJoint" -p "middleFinger_2_ikJoint";
	rename -uid "DF6B58DB-4B94-37C8-46CD-D6A3DF5BB61E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.30000000000000004 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.945827245434339 2.631220965410396 0.32453769508871033 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_end_ikJoint" -p "middleFinger_3_ikJoint";
	rename -uid "1075139D-4D51-CE41-D102-20A700445E89";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.29999999999999982 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115796 -0.031006291119996469 0.46313662254181498 0
		 0.010792652932731619 1.3072871093841545 0.059007385618243875 0 -0.46404788532125774 -0.051351366348019949 1.2225467420838616 0
		 2.0262383384181293 2.6291832930020518 0.35497412672202061 1;
	setAttr ".radi" 0.2;
createNode orientConstraint -n "middleFinger_3_ikJoint_orientConstraint1" -p "middleFinger_3_ikJoint";
	rename -uid "91526E6F-4324-B4DA-D294-A0A81A24B81F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleFinger_ikW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 0 9.9296700513178639e-05 ;
	setAttr ".rsrr" -type "double3" -0.11552026247139668 2.4689027988349017 5.3470666511130629 ;
	setAttr -k on ".w0";
createNode ikEffector -n "effector7" -p "middleFinger_3_ikJoint";
	rename -uid "94E04F93-40DC-73F6-455A-3E94409676C4";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector4" -p "middleFinger_2_ikJoint";
	rename -uid "B6B5E77C-47F7-92EC-AE79-F9A68FD5A88A";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "middleFinger_1_closed" -p "middleFinger_init";
	rename -uid "9BCFE0E7-4231-5DB6-C2BF-6B9E8D8C4FF7";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 0 -90 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_3";
createNode nurbsCurve -n "middleFinger_1_closedShape" -p "middleFinger_1_closed";
	rename -uid "01012168-4D74-6ADE-721D-889DA9B76B67";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "middleFinger_1_spread" -p "middleFinger_init";
	rename -uid "CABCBA88-4B96-C39B-938D-C29C57690722";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".t" -type "double3" -0.00069842068229675192 0 0.013527241822646334 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 0 -2.955595602498573 0 ;
	setAttr -k on ".r";
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "middleFinger_3";
createNode nurbsCurve -n "middleFinger_1_spreadShape" -p "middleFinger_1_spread";
	rename -uid "8162B49B-4042-52ED-AAE8-D4BE107CF8D9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		2.3087082090219562e-33 3.7823185546559397e-17 0.13070295765995757
		-5.659150887676577e-18 -0.092420947682493967 0.092420947682493995
		-8.0032479368679536e-18 -0.13070295765995757 3.9383351957335032e-17
		-5.6591508876765786e-18 -0.092420947682493995 -0.092420947682493954
		-4.3089928967313074e-33 -7.0252075179402973e-17 -0.13070295765995757
		5.6591508876765747e-18 0.092420947682493954 -0.092420947682494065
		8.0032479368679459e-18 0.13070295765995757 1.4911644648575e-17
		5.6591508876765786e-18 0.092420947682493967 0.092420947682493967
		;
createNode transform -n "ringFinger_init" -p "controls";
	rename -uid "59F46F47-485E-7FAB-C000-C1B5ACDAEA40";
createNode transform -n "pinkyFinger_init" -p "controls";
	rename -uid "DB9D964F-4954-E11D-EBA4-2C80C23D2316";
createNode transform -n "system" -p "mod";
	rename -uid "6FD6FEA9-4B8E-2308-3EE1-389B78C8A0AD";
	setAttr ".v" no;
	setAttr ".ove" yes;
createNode transform -n "mod__indexFinger_ik__parentSwitcherTarget" -p "system";
	rename -uid "5CD4D517-4B8B-979E-45B2-DCB65D2B677E";
createNode locator -n "mod__indexFinger_ik__parentSwitcherTargetShape" -p "mod__indexFinger_ik__parentSwitcherTarget";
	rename -uid "37DFEC76-47D2-4782-5E63-AAB800672E5D";
	setAttr -k off ".v";
createNode transform -n "mod__middleFinger_ik__parentSwitcherTarget" -p "system";
	rename -uid "698BCD9A-4BE9-B251-5E63-D4BBC7C06AA2";
createNode locator -n "mod__middleFinger_ik__parentSwitcherTargetShape" -p "mod__middleFinger_ik__parentSwitcherTarget";
	rename -uid "81B40B49-46AF-34FB-69C7-9B9AC0E7DF0C";
	setAttr -k off ".v";
createNode transform -n "mod__ringFinger_ik__parentSwitcherTarget" -p "system";
	rename -uid "7DEA37B4-4410-9BF2-BDD6-D0960EB3981F";
createNode locator -n "mod__ringFinger_ik__parentSwitcherTargetShape" -p "mod__ringFinger_ik__parentSwitcherTarget";
	rename -uid "80E98D61-471B-2F91-9187-D8B923DDBB51";
	setAttr -k off ".v";
createNode transform -n "mod__pinkyFinger_ik__parentSwitcherTarget" -p "system";
	rename -uid "487F1237-45DC-26D4-21C8-2783E7778C30";
createNode locator -n "mod__pinkyFinger_ik__parentSwitcherTargetShape" -p "mod__pinkyFinger_ik__parentSwitcherTarget";
	rename -uid "039FF119-48D2-1AB0-FFF5-F7B89A169E2E";
	setAttr -k off ".v";
createNode transform -n "mod__thumbFinger_ik__parentSwitcherTarget" -p "system";
	rename -uid "2917433B-48E7-FE76-E76F-529EB84EC362";
createNode locator -n "mod__thumbFinger_ik__parentSwitcherTargetShape" -p "mod__thumbFinger_ik__parentSwitcherTarget";
	rename -uid "FEB9A56C-45AE-44AF-306A-DB819629A687";
	setAttr -k off ".v";
createNode transform -n "output" -p "mod";
	rename -uid "7218FC95-479D-0529-91D3-68B91502E5AF";
createNode transform -n "outJoints" -p "output";
	rename -uid "AF6AD040-452D-314F-D76F-02AA2CFE9865";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "7A215B85-464E-8BEB-D840-4D94CD0A34BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2832028466235486 0.10356778950840868 0.23507893710489736 0
		 -0.051831814688344295 1.2773445997948163 -0.27982525911350142 0 -0.25159860230164138 0.26507060498698654 1.2565960595865715 0
		 1.3924554333966863 2.5804152796896376 0.028828740475449768 1;
	setAttr ".radi" 0.5;
createNode joint -n "thumbFinger_1_outJoint" -p "root_outJoint";
	rename -uid "56FBD286-4475-27B1-4330-61B8FDE42B5C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.67504966950132239 -0.54747401438527477 0.97835478562525147 0
		 -0.540557518773779 0.84156074412583692 0.84390225862969948 0 -0.98219318460275196 -0.83943174635943107 0.20796353190082256 0
		 1.488606841407017 2.5609536877922938 0.19982231646870116 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_2_outJoint" -p "thumbFinger_1_outJoint";
	rename -uid "63A51357-4C24-90BC-6CCC-BDAD21F4EE00";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.73922496793375392 -0.6516033964696325 0.86113727115331851 0
		 -0.44882171758956763 0.76378354014079108 0.96321945002515197 0 -0.98219318460275196 -0.83943174635943107 0.20796353190082256 0
		 1.5420148322326586 2.5176391163487377 0.27722693686277361 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_3_outJoint" -p "thumbFinger_2_outJoint";
	rename -uid "C1E1640D-425A-B2AF-751A-38B20E946E8C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.77293129202256883 -0.7109280318128407 0.78086906115676513 0
		 -0.38790682542207422 0.70889605448435178 1.0293651528997341 0 -0.98219318460275196 -0.83943174635943107 0.20796353190082256 0
		 1.6102302463354488 2.4575093893385649 0.3566923744483918 1;
	setAttr ".radi" 0.2;
createNode joint -n "thumbFinger_end_outJoint" -p "thumbFinger_3_outJoint";
	rename -uid "4F8575DF-4239-501F-9B66-B2ADBB641FD4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.77293129202256994 -0.71092803181284325 0.7808690611567618 0
		 -0.38790682542207577 0.70889605448434556 1.0293651528997374 0 -0.9821931846027504 -0.83943174635943396 0.20796353190081796 0
		 1.6718804003388803 2.4008047083231165 0.41897565669387499 1;
	setAttr ".radi" 0.2;
createNode parentConstraint -n "thumbFinger_3_outJoint_parentConstraint1" -p "thumbFinger_3_outJoint";
	rename -uid "7DDE2546-4D09-0B51-8C1F-F185443BF062";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "thumbFinger_3W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "thumbFinger_3_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.28824449235569893 -0.0015096167248778714 -0.0007472173211907282 ;
	setAttr ".rsrr" -type "double3" -1.6270202236558393 8.3747165980529754 10.965605614615692 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "thumbFinger_2_outJoint_parentConstraint1" -p "thumbFinger_2_outJoint";
	rename -uid "42E0B345-43BB-7746-BFCB-E08829D0F583";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "thumbFinger_2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "thumbFinger_2_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29861905399706767 -0.00029578855611950977 -0.00047689111839275405 ;
	setAttr ".rsrr" -type "double3" 1.1743776102779311 0.34691811668645445 -16.45517805462633 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "thumbFinger_1_outJoint_parentConstraint1" -p "thumbFinger_1_outJoint";
	rename -uid "E87903DE-42F6-7340-3C7F-FCB69E7F25BF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "thumbFinger_1W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "thumbFinger_1_ikJointW1" -dv 1 -min 
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
	setAttr ".tg[0].tot" -type "double3" 0 -1.3877787807814457e-17 -1.3877787807814457e-17 ;
	setAttr ".tg[0].tor" -type "double3" -4.7708320221952752e-15 3.1805546814635168e-15 
		0 ;
	setAttr ".lr" -type "double3" 39.423518114671239 -45.000000000000114 0 ;
	setAttr ".rst" -type "double3" 0.28812560489975525 9.5357977739121387e-19 0.48826241970730738 ;
	setAttr ".rsrr" -type "double3" 41.186373689867757 -54.896661556845189 -2.2942790408395743 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode joint -n "indexFingerRoot_outJoint" -p "root_outJoint";
	rename -uid "2B37B86E-42A6-712A-BBAA-1BA37F7DA495";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2636736742269346 0.11646996665436286 0.31962717533109636 0
		 -0.047282437445269138 1.2777722155898401 -0.27867629151520951 0 -0.33688448383954711 0.25754776491161296 1.2380532834308866 0
		 1.4775303712762553 2.5796878983533684 0.0097798130510091605 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_1_outJoint" -p "indexFingerRoot_outJoint";
	rename -uid "9D2D92CE-4F2B-189E-CC43-409588CDF923";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.7279774505630681 2.6367414299060319 0.24207929103528197 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_2_outJoint" -p "indexFinger_1_outJoint";
	rename -uid "F1713E59-415C-178B-9EA8-28B458DE0D0D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.8545816034067619 2.6335331930968731 0.29000027437242898 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_3_outJoint" -p "indexFinger_2_outJoint";
	rename -uid "F53E7053-4742-B71C-5B26-0EA8D07BD1B9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115794 -0.031006291119996504 0.46313662254181498 0
		 0.010792652932734225 1.3072871093841545 0.059007385618237013 0 -0.46404788532125768 -0.051351366348012573 1.2225467420838625 0
		 1.945827245434339 2.631220965410396 0.32453769508871033 1;
	setAttr ".radi" 0.2;
createNode joint -n "indexFinger_end_outJoint" -p "indexFinger_3_outJoint";
	rename -uid "315B1C89-4125-7D4B-44B6-089AD265C403";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2235771402115796 -0.031006291119996469 0.46313662254181498 0
		 0.010792652932731619 1.3072871093841545 0.059007385618243875 0 -0.46404788532125774 -0.051351366348019949 1.2225467420838616 0
		 2.0262383384181293 2.6291832930020518 0.35497412672202061 1;
	setAttr ".radi" 0.2;
createNode parentConstraint -n "indexFinger_3_outJoint_parentConstraint1" -p "indexFinger_3_outJoint";
	rename -uid "28EF9F73-4BB9-6DCE-62F2-B2B891B63228";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "indexFinger_3W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "indexFinger_3_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29688825765000204 5.5511151231257827e-17 5.5511151231257827e-17 ;
	setAttr ".rsrr" -type "double3" 0 0 7.6116678954378827 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "indexFinger_2_outJoint_parentConstraint1" -p "indexFinger_2_outJoint";
	rename -uid "E8B51BC0-40DE-1697-ADBA-32A1514C98B0";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "indexFinger_2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "indexFinger_2_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29688829499471892 -5.5511151231257827e-17 -1.6653345369377348e-16 ;
	setAttr ".rsrr" -type "double3" 0 0 -4.9648343417372281e-05 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "indexFinger_1_outJoint_parentConstraint1" -p "indexFinger_1_outJoint";
	rename -uid "B6D54C5C-4ABC-0CC4-601C-08BC408DE18A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "indexFinger_1W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "indexFinger_1_ikJointW1" -dv 1 -min 
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
	setAttr ".tg[0].tot" -type "double3" -1.1102230246251565e-16 0 5.5511151231257827e-17 ;
	setAttr ".lr" -type "double3" 0 4.3796762105568758 0 ;
	setAttr ".rst" -type "double3" 0.46456269519831284 -8.3266726846886741e-17 1.3877787807814457e-16 ;
	setAttr ".rsrr" -type "double3" -1.9670226785156917 13.303535483437251 -31.026421336498924 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "indexFingerRoot_outJoint_parentConstraint1" -p "indexFingerRoot_outJoint";
	rename -uid "1CD7775F-49F7-1D8F-0A63-3BB1F55FB85E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "indexFingerRootW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 0 -5.5511151231257827e-17 ;
	setAttr ".lr" -type "double3" 0 -4.3796762105568776 0 ;
	setAttr ".rst" -type "double3" 0.35665792465199897 0 0.29552088582950786 ;
	setAttr ".rsrr" -type "double3" 0 -4.2807786355568345 0 ;
	setAttr -k on ".w0";
createNode joint -n "middleFingerRoot_outJoint" -p "root_outJoint";
	rename -uid "C11A964F-42A4-8916-F794-F2BDCC32F670";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2636736742269346 0.11646996665436286 0.31962717533109636 0
		 -0.047282437445269138 1.2777722155898401 -0.27867629151520951 0 -0.33688448383954711 0.25754776491161296 1.2380532834308866 0
		 1.4775303712762553 2.5796878983533684 0.0097798130510091605 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_1_outJoint" -p "middleFingerRoot_outJoint";
	rename -uid "B8C66E97-4D70-52D8-E9DB-259090E01787";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2438093089611888 -0.15907131256742008 0.37447651426541129 0
		 0.18682789279871975 1.2933012967615327 -0.071169049060198442 0 -0.36143004951260593 0.12110331370289172 1.2519186259483079 0
		 1.7511485431607738 2.6272881776011774 0.16206767007007836 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_2_outJoint" -p "middleFinger_1_outJoint";
	rename -uid "C1BC011E-445A-3CCD-7D23-81963A0D2440";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2438093089611888 -0.15907131256742008 0.37447651426541129 0
		 0.18682789279871975 1.2933012967615327 -0.071169049060198442 0 -0.36143004951260593 0.12110331370289172 1.2519186259483079 0
		 1.903507840041301 2.6078028809708802 0.20793883215311279 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_3_outJoint" -p "middleFinger_2_outJoint";
	rename -uid "B794B73D-4133-87AA-C884-B5A1A35CE79E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2438093089611888 -0.15907131256742008 0.37447651426541129 0
		 0.18682789279871975 1.2933012967615327 -0.071169049060198442 0 -0.36143004951260593 0.12110331370289172 1.2519186259483079 0
		 2.001307935193867 2.5952951843384033 0.23738373055007547 1;
	setAttr ".radi" 0.2;
createNode joint -n "middleFinger_end_outJoint" -p "middleFinger_3_outJoint";
	rename -uid "F6F8D066-4B93-B4F2-233E-73BB728D1B19";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.243809308961189 -0.15907131256741958 0.37447651426541073 0
		 0.1868278927987172 1.2933012967615334 -0.071169049060191614 0 -0.36143004951260632 0.12110331370288438 1.2519186259483082 0
		 2.1162641539957296 2.5805933839209736 0.27199386231403716 1;
	setAttr ".radi" 0.2;
createNode parentConstraint -n "middleFinger_3_outJoint_parentConstraint1" -p "middleFinger_3_outJoint";
	rename -uid "9ACA89CA-4CD1-ED41-854E-02B5D70C2E29";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleFinger_3W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "middleFinger_3_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29688825765000226 5.5511151231257827e-17 -1.2490009027033011e-15 ;
	setAttr ".rsrr" -type "double3" 0 0 7.611713734436524 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "middleFinger_2_outJoint_parentConstraint1" -p "middleFinger_2_outJoint";
	rename -uid "FD030C6F-4D54-FEB6-E174-529794441E49";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleFinger_2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "middleFinger_2_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29688829499471858 -5.5511151231257827e-17 -1.1657341758564144e-15 ;
	setAttr ".rsrr" -type "double3" 0 0 -4.9648343414980653e-05 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "middleFinger_1_outJoint_parentConstraint1" -p "middleFinger_1_outJoint";
	rename -uid "C1402E44-4093-6A4E-0AB6-499347458808";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleFinger_1W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "middleFinger_1_ikJointW1" -dv 1 -min 
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
	setAttr ".tg[0].tot" -type "double3" -1.1102230246251565e-16 0 -2.7755575615628914e-17 ;
	setAttr ".tg[0].tor" -type "double3" 1.9412565194479477e-19 0 0 ;
	setAttr ".lr" -type "double3" 0.00042379601362933236 2.7548566711222517 0.017624905816379894 ;
	setAttr ".rst" -type "double3" 0.4700752228694583 2.7755575615628914e-17 3.4694469519536142e-17 ;
	setAttr ".rsrr" -type "double3" -1.2341338500533163 8.4395463798296095 -30.57868336469506 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "middleFingerRoot_outJoint_parentConstraint1" -p "middleFingerRoot_outJoint";
	rename -uid "9B430BFE-46F4-72F7-08C0-5C96F114A808";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middleFingerRootW0" -dv 1 -min 0 
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
	setAttr ".tg[0].tot" -type "double3" -5.5511151231257827e-17 0 -6.9388939039072284e-18 ;
	setAttr ".tg[0].tor" -type "double3" -1.9412565194479477e-19 0 0 ;
	setAttr ".lr" -type "double3" 0.0004237960136293323 -2.7548566711222522 -0.017624905816379894 ;
	setAttr ".rst" -type "double3" 0.35682714057259529 0.00011708205605520662 0.07036444625327716 ;
	setAttr ".rsrr" -type "double3" 0.0014169593163766018 -9.4069657353092282 -0.017221990295826019 ;
	setAttr -k on ".w0";
createNode joint -n "ringFingerRoot_outJoint" -p "root_outJoint";
	rename -uid "F68C02C9-41D9-56FF-4203-D0AFD8D18F41";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2636736742269346 0.11646996665436286 0.31962717533109636 0
		 -0.047282437445269138 1.2777722155898401 -0.27867629151520951 0 -0.33688448383954711 0.25754776491161296 1.2380532834308866 0
		 1.4775303712762553 2.5796878983533684 0.0097798130510091605 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_1_outJoint" -p "ringFingerRoot_outJoint";
	rename -uid "CC708326-4FE0-72FD-0278-0B9145BAA15E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2587143153106928 -0.25701539804749746 0.2493577688286954 0
		 0.29723167035656972 1.2580843918359068 -0.20365396247734627 0 -0.19972367372392821 0.25251670729313613 1.2684414475918293 0
		 1.770551429883686 2.6066949917360107 0.083895065418291878 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_2_outJoint" -p "ringFinger_1_outJoint";
	rename -uid "9650280C-4DA9-60A5-D692-49BD50720BCB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2452075418592781 -0.309315841475029 0.2576428287109388 0
		 0.3495233484730273 1.2462571813342669 -0.19306580774900384 0 -0.19972367372392821 0.25251670729313613 1.2684414475918293 0
		 1.9069958575729724 2.5788345642606392 0.11092540712796542 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_3_outJoint" -p "ringFinger_2_outJoint";
	rename -uid "8B198823-4C98-2602-260C-6DAA2CA7758E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2533007273099339 -0.27906820358382017 0.25289555937124536 0
		 0.31928933642609086 1.253377113866029 -0.19924374358622757 0 -0.19972367372392821 0.25251670729313613 1.2684414475918293 0
		 2.004950002763608 2.5545022599442295 0.13119285829774763 1;
	setAttr ".radi" 0.2;
createNode joint -n "ringFinger_end_outJoint" -p "ringFinger_3_outJoint";
	rename -uid "3487A46A-477B-C447-F86B-4EBD779A3501";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2533007271889378 -0.27906820405879323 0.25289555944674852 0
		 0.31928933690103378 1.2533771137602765 -0.19924374349038479 0 -0.1997236737239288 0.25251670729312919 1.2684414475918304 0
		 2.0984328795773028 2.53368674645262 0.15005617170655097 1;
	setAttr ".radi" 0.2;
createNode parentConstraint -n "ringFinger_3_outJoint_parentConstraint1" -p "ringFinger_3_outJoint";
	rename -uid "A4338891-4B6F-BEF9-FE6D-58A82EA33108";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ringFinger_3W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "ringFinger_3_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29692789054833346 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr ".rsrr" -type "double3" 0 0 7.4737935481445348 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "ringFinger_2_outJoint_parentConstraint1" -p "ringFinger_2_outJoint";
	rename -uid "122F97BC-4F1D-CDB1-86CA-2980497AF1F7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ringFinger_2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "ringFinger_2_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29692792765569687 1.1102230246251565e-16 -1.3877787807814457e-17 ;
	setAttr ".rsrr" -type "double3" 0 0 -4.9648343407649861e-05 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "ringFinger_1_outJoint_parentConstraint1" -p "ringFinger_1_outJoint";
	rename -uid "33E3E630-4D31-DD3D-71C8-0DA617FEE8C3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ringFinger_1W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "ringFinger_1_ikJointW1" -dv 1 -min 
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
	setAttr ".lr" -type "double3" 2.4306922001493195e-20 -3.3370626724493326 -0.0044996446996804556 ;
	setAttr ".rst" -type "double3" 0.44759186425116804 0.0021914114615007863 0.002119033950325061 ;
	setAttr ".rsrr" -type "double3" -0.97184251024772184 6.7074756219985456 -31.619299440443399 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "ringFingerRoot_outJoint_parentConstraint1" -p "ringFingerRoot_outJoint";
	rename -uid "16ECAAA7-40A0-E3A7-8FD1-A8BE0A5CDB72";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ringFingerRootW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0.00026236833258253233 3.3370626621469643 0.0045072873843546987 ;
	setAttr ".rst" -type "double3" 0.36282375898591168 0 -0.050675101633040009 ;
	setAttr ".rsrr" -type "double3" 0 3.2592368178869529 0 ;
	setAttr -k on ".w0";
createNode joint -n "pinkyFingerRoot_outJoint" -p "root_outJoint";
	rename -uid "FF998D0C-4E65-E732-D243-51AE227F55A5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.3018482441153094 0.078127181101778784 0.10809825226977712 0
		 -0.053405045970940757 1.2772511211625857 -0.27995609268341365 0 -0.12221697768940382 0.27408695032564445 1.2737885591032996 0
		 1.4915932426512275 2.5724154751347141 -0.026051936680658125 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_1_outJoint" -p "pinkyFingerRoot_outJoint";
	rename -uid "744364B8-4D11-7943-8DFD-C5829119DA18";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.7776693725797501 2.5895836218160579 -0.0022977627197828814 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_2_outJoint" -p "pinkyFinger_1_outJoint";
	rename -uid "7E09F2B2-42C3-1841-19D0-9CB9511BDC29";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.896183983991486 2.549299791957818 0.016602220508937282 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_3_outJoint" -p "pinkyFinger_2_outJoint";
	rename -uid "40A333AB-4874-0978-DE7E-9A86DD89D642";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.2251548211484544 -0.4164374989484107 0.19538017546080644 0
		 0.44264462600863386 1.2185312218429931 -0.17845261482058361 0 -0.12513727885478301 0.2331510457626545 1.2816314566120035 0
		 1.96899508416744 2.5245508606965972 0.028213688122913739 1;
	setAttr ".radi" 0.2;
createNode joint -n "pinkyFinger_end_outJoint" -p "pinkyFinger_3_outJoint";
	rename -uid "74389099-4FCF-1A7C-B48C-648B61E37B5E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.22712031808436 -0.42037387850651287 0.173376660743986 0
		 0.4426446260086313 1.2185312218429949 -0.17845261482057717 0 -0.10411243579430152 0.22597655396083455 1.2847930327682229 0
		 2.0310584437696688 2.5041022172784917 0.042529531828269115 1;
	setAttr ".radi" 0.2;
createNode parentConstraint -n "pinkyFinger_3_outJoint_parentConstraint1" -p "pinkyFinger_3_outJoint";
	rename -uid "3F187757-433A-5DAC-4C9B-3AAFC107D9B4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "pinkyFinger_3W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "pinkyFinger_3_ikJointW1" -dv 1 -min 
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
	setAttr ".rst" -type "double3" 0.29999999999999982 5.5511151231257827e-17 -1.1102230246251565e-16 ;
	setAttr ".rsrr" -type "double3" 0 0 7.9513867036587919e-16 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "pinkyFinger_2_outJoint_parentConstraint1" -p "pinkyFinger_2_outJoint";
	rename -uid "814E8AD3-43F0-21E7-8C1F-96B472D4C0E8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "pinkyFinger_2W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "pinkyFinger_2_ikJointW1" -dv 1 -min 
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
	setAttr ".tg[1].tot" -type "double3" 0 0 1.2878587085651816e-14 ;
	setAttr ".rst" -type "double3" 0.30000000000000004 5.5511151231257827e-17 5.5511151231257827e-17 ;
	setAttr ".rsrr" -type "double3" 0 0 7.9513867036587919e-16 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "pinkyFinger_1_outJoint_parentConstraint1" -p "pinkyFinger_1_outJoint";
	rename -uid "8F68FB11-490E-E775-2F5A-06AE4A813D64";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "pinkyFinger_1W0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "pinkyFinger_1_ikJointW1" -dv 1 -min 
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
	setAttr ".tg[0].tor" -type "double3" 0 4.7708320221952752e-15 0 ;
	setAttr ".tg[1].tot" -type "double3" 0 4.0869339705019991e-20 1.2490009027033011e-14 ;
	setAttr ".lr" -type "double3" 0 -11.315059373229133 0 ;
	setAttr ".rst" -type "double3" 0.41201010471805871 3.7947076036992655e-19 1.6653345369377348e-16 ;
	setAttr ".rsrr" -type "double3" 3.249081604316417e-07 -0.74987410937401577 -0.016281901055722126 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "pinkyFingerRoot_outJoint_parentConstraint1" -p "pinkyFingerRoot_outJoint";
	rename -uid "D45DBE67-4677-4FA9-BB14-B19DCCAA5023";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "pinkyFingerRootW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -5.5511151231257827e-17 0 2.7755575615628914e-17 ;
	setAttr ".tg[0].tor" -type "double3" 0 -1.5902773407317584e-15 0 ;
	setAttr ".lr" -type "double3" 0 11.315059373229133 0 ;
	setAttr ".rst" -type "double3" 0.35665792465199891 4.4408920985006262e-16 -0.20358022444175916 ;
	setAttr ".rsrr" -type "double3" 0 11.061535051331006 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "root_outJoint_parentConstraint1" -p "root_outJoint";
	rename -uid "A791DD3B-4921-5643-4465-A5B9EC374516";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "locator1W0" -dv 1 -min 0 -at "double";
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
createNode transform -n "ik_out" -p "output";
	rename -uid "3C0CB906-4DCB-EECC-1B2F-C08B2FFC766E";
	setAttr ".v" no;
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "69244324-47FA-AE6D-F391-EA809F8272FA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "root_ik_out_pointConstraint1" -p "ik_out";
	rename -uid "0B68696F-4BAF-F7E0-AB5D-E6BB7BC567F0";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_pos_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0.10636625817859025 0.38181190306164425 0.040965448832538956 ;
	setAttr -k on ".w0";
createNode transform -s -n "persp";
	rename -uid "B4CB8A02-4ED4-5B47-4588-78A2DF4DAB63";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.304457818569607 1.8351420584699265 1.5593680552162705 ;
	setAttr ".r" -type "double3" -42.60000000001061 45.60000000000182 4.5458358288858544e-15 ;
	setAttr ".rp" -type "double3" -1.8873791418627661e-15 4.1910919179599659e-15 1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" -1.6763437716797293e-14 -8.1469336055066895e-15 5.0082622293174691e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "FD5AF2A7-4477-D351-B960-8095957B3EBF";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 2.9431350198192039;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 1.3438047732853504 2.7755575615628914e-17 0.32492759417655592 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "4399C4E0-4AC2-2D79-E31C-0DA7ED948171";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.51584450451436548 1.5664543838979808 0.028713861886302205 ;
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr ".rp" -type "double3" 3.1554436208840458e-30 3.1554436208840493e-30 0 ;
	setAttr ".rpt" -type "double3" -3.1554436208840458e-30 -6.3108872417680986e-30 7.0064923216240838e-46 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "E800210B-4E9B-9A53-8F37-FDAAB535FF9F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.461211633135179;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "FDE69542-47DA-5161-15B5-8D8B70323FE7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.67176696221973375 -0.32454073558341279 1.9285312733387492 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "446C6151-42A7-5B30-64D8-16A4C5703C49";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.9559011544060101;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "BA82C4FD-4CEC-AD27-03D3-06B7E366A3AD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.3633278554574835 -0.11027211018928548 0.25495083836723159 ;
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" -1.4210854715202007e-14 0 1.4210854715202013e-14 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "ED723A9B-443C-74BA-02D5-EFAF752AB9BF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.9148173767991516;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "33464164-440E-C304-29B9-1BB76FF3E5DA";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "57891EC8-4CC0-D9A6-EEE2-BF8E0248D2E0";
createNode displayLayer -n "defaultLayer";
	rename -uid "E07D4D85-463A-EC21-D440-F88CC183AD0E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "448AD92D-45BC-CE96-0CA2-58832CD31724";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "D7EABF89-4D44-5996-B10A-06AB47230C35";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "E9CAD617-4DBC-A87A-DD6D-D19908C6C63C";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 29 -ast 0 -aet 140 ";
	setAttr ".st" 6;
createNode objectSet -n "sets";
	rename -uid "339CEF37-4ED0-5286-C0A6-42972AA1962C";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode decomposeMatrix -n "root_connector_decomposeMatrix";
	rename -uid "849744F8-41C7-4F21-61FC-E885696CD195";
createNode decomposeMatrix -n "ringFinger_1_skinJoint_decMat";
	rename -uid "B168BA2D-4E52-B0F1-5960-BFA4629078FA";
createNode multMatrix -n "ringFinger_1_skinJoint_multMat";
	rename -uid "7212DFCE-4BC3-87BA-52E4-E48823DC748D";
createNode decomposeMatrix -n "pinkyFinger_1_skinJoint_decMat";
	rename -uid "BF98B4B1-4490-B74C-5D8B-579AEE749448";
createNode multMatrix -n "pinkyFinger_1_skinJoint_multMat";
	rename -uid "9B0D5179-498A-7573-5A9F-589F8395969E";
createNode objectSet -n "thumb_moduleControlSet";
	rename -uid "B8977D35-4E6D-B2AA-992E-9994E426DED3";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "moduleControlSet";
	rename -uid "1CE65CA5-43CC-84A3-23C7-00A250534604";
	setAttr ".ihi" 0;
	setAttr -s 6 ".dsm";
	setAttr -s 6 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode groupId -n "cluster4GroupId";
	rename -uid "F6670110-49BF-41A1-9649-239FAD54FB15";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "cluster4Set";
	rename -uid "5FA9A7E5-4D3E-3158-BA9B-83969295B90D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "F7A34973-443E-29C5-6509-9DB48CFD5F63";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "14EC613B-428C-E397-7766-2B8C4861B1AA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "";
createNode tweak -n "tweak24";
	rename -uid "DA89FD9C-4992-35AD-12AE-1B8C5C8B5D35";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "tweakSet24";
	rename -uid "A72BEBE3-44CF-61EB-AD43-1BB5CBB1702A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "groupId42";
	rename -uid "617669E0-4405-C358-025F-43A805542637";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupParts -n "groupParts42";
	rename -uid "07F55339-4BF5-98F2-31D9-FE806C782330";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "thumbFinger_cluster4GroupId";
	rename -uid "2611037D-489C-CDBE-02CD-CC97D9ED8BB1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode objectSet -n "thumbFinger_cluster4Set";
	rename -uid "2823A7DE-4E5D-B193-BE78-92BDC70DB50A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode cluster -n "thumbFinger_mainPoser_clusterHandleCluster";
	rename -uid "9B302DCE-4295-6D6A-12C2-B3A76D9D3F4F";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "thumbFinger_cluster4GroupParts";
	rename -uid "51D1AB0B-42BC-9FE2-BF52-5CA1984F6C9E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode tweak -n "thumbFinger_tweak24";
	rename -uid "75DAF4C2-44FF-C04F-9B89-5A9B8746960D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode objectSet -n "thumbFinger_tweakSet24";
	rename -uid "50B26D5B-4CE0-44E5-845D-E88304A27106";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode groupId -n "thumbFinger_groupId42";
	rename -uid "E6720442-4E0B-6DD0-3449-DC82ABC39293";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode groupParts -n "thumbFinger_groupParts42";
	rename -uid "C9F29742-48AA-E564-3BA4-0F90C138A758";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "thumbFinger";
createNode groupId -n "indexFinger_cluster4GroupId";
	rename -uid "AE54F722-4A9D-E6AF-9669-B3A8CEA680DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode objectSet -n "indexFinger_cluster4Set";
	rename -uid "EC316D69-484A-042F-E3F2-53BFFDD6E323";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode cluster -n "indexFinger_mainPoser_clusterHandleCluster";
	rename -uid "DAE20233-40B0-26A8-1ADD-A4932B0AEA65";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "indexFinger_cluster4GroupParts";
	rename -uid "EF85E879-415B-34C9-F9D1-AB9AE9A4D74E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode tweak -n "indexFinger_tweak24";
	rename -uid "900527D3-436C-B13D-4C54-2B9B17C3CCA7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode objectSet -n "indexFinger_tweakSet24";
	rename -uid "15D07853-433F-9D4C-FE5F-26ACB33C8D2F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode groupId -n "indexFinger_groupId42";
	rename -uid "001DC065-4100-217D-3CCE-3D9057915FAB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode groupParts -n "indexFinger_groupParts42";
	rename -uid "08C3BBBB-4EEE-B7F2-49D3-E4ACB63BB77C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "indexFinger";
createNode groupId -n "middleFinger_cluster4GroupId";
	rename -uid "2FABCEE3-41BA-E734-5E84-44A1095E6993";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode objectSet -n "middleFinger_cluster4Set";
	rename -uid "DA267B0F-4844-7955-7026-BD8E45470C5B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode cluster -n "middleFinger_mainPoser_clusterHandleCluster";
	rename -uid "E2CE95D3-46C7-3670-F288-349F65748898";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "middleFinger_cluster4GroupParts";
	rename -uid "833B5EA0-409F-1FA8-6A87-1AA9F04A1992";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode tweak -n "middleFinger_tweak24";
	rename -uid "32456B53-4536-4106-BAE5-65B93123C333";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode objectSet -n "middleFinger_tweakSet24";
	rename -uid "961CAA23-4A72-9B2D-2F70-9CAEB0DA5487";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode groupId -n "middleFinger_groupId42";
	rename -uid "20DE6975-4DAF-FB94-B34F-20A78CEA635C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode groupParts -n "middleFinger_groupParts42";
	rename -uid "57DE01F8-4B7C-7221-CFC1-70A535900164";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "middleFinger";
createNode groupId -n "ringFinger_cluster4GroupId";
	rename -uid "A286DCF1-44F7-35D3-6620-7CBDA31AE7A1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode objectSet -n "ringFinger_cluster4Set";
	rename -uid "E263ACE5-43F2-9CF7-CD3F-04B69B6738F0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode cluster -n "ringFinger_mainPoser_clusterHandleCluster";
	rename -uid "5CA9913D-4BE5-E5F7-B489-40BEFF6BFF9C";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "ringFinger_cluster4GroupParts";
	rename -uid "C1556442-447A-77D5-08D7-AB87FEA98568";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode tweak -n "ringFinger_tweak24";
	rename -uid "340670D8-40A3-835B-746C-6199B2475101";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode objectSet -n "ringFinger_tweakSet24";
	rename -uid "088FB2C6-45DE-E096-43E9-6E92644547A0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode groupId -n "ringFinger_groupId42";
	rename -uid "E2257886-43F8-665E-F31E-2A8A04601AE7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode groupParts -n "ringFinger_groupParts42";
	rename -uid "356AD251-462A-1B30-626B-1BB8DEBE654A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "ringFinger";
createNode groupId -n "pinkyFinger_cluster4GroupId";
	rename -uid "E76C8116-45F9-5876-3ABD-639AC050FEA6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode objectSet -n "pinkyFinger_cluster4Set";
	rename -uid "2100F736-4D2B-2504-1563-50AC2D01D666";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode cluster -n "pinkyFinger_mainPoser_clusterHandleCluster";
	rename -uid "77E3E75C-44BA-3860-E952-B6BC5E00A503";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "pinkyFinger_cluster4GroupParts";
	rename -uid "6321A2C6-4A47-35FA-CD8C-98B602362A7C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode tweak -n "pinkyFinger_tweak24";
	rename -uid "BDF84EB3-4573-259C-BA05-438D8F6201C1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode objectSet -n "pinkyFinger_tweakSet24";
	rename -uid "18558788-4724-C9B4-3EBB-AB9631BD0C65";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode groupId -n "pinkyFinger_groupId42";
	rename -uid "34F45AE3-4A8C-A0BB-6795-FDACEF7BA8F8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode groupParts -n "pinkyFinger_groupParts42";
	rename -uid "CEAAFF96-4603-F4A7-1C12-1A9738A03E5B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "pinkyFinger";
createNode decomposeMatrix -n "thumbFinger_2_offset_decMat";
	rename -uid "87553DEE-4AE9-F9BB-3134-D1934F5D752E";
createNode multMatrix -n "thumbFinger_2_offset_multMat";
	rename -uid "DC85E28A-46E9-4593-CB34-79B5583336BD";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "thumbFinger_3_offset_decMat";
	rename -uid "04B51633-46B1-371A-1617-1FAEDCBFE079";
createNode multMatrix -n "thumbFinger_3_offset_multMat";
	rename -uid "4BFF12AE-45FA-71A1-B989-B3A2A3E27CFD";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1406";
	rename -uid "FBEF48FE-4E2F-114F-017F-C3B56BAEF983";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1407";
	rename -uid "EB7A9620-4C98-BE76-AF44-99931434A788";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1408";
	rename -uid "12542E4E-4B7A-5CC1-4D99-C7BFAF814A61";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1409";
	rename -uid "ABE5680F-4535-A646-072B-FC97361F190F";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1410";
	rename -uid "4B075F79-4E91-A96E-17C1-B6B51A34EC8E";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1411";
	rename -uid "301CEF22-460B-0199-9A54-11BA5918C647";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1412";
	rename -uid "29EBC94E-414F-1986-DF2D-299F7AB6A51A";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1413";
	rename -uid "0608F3D2-4F5B-5FFE-3563-87B64408DCD5";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1414";
	rename -uid "067E48B0-41DA-1A9E-221B-5DA685423B1E";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1415";
	rename -uid "9D80D60D-4ECE-3FE8-B24B-AE97D47FAAEE";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1416";
	rename -uid "CEEBBF51-40A6-D7DD-5381-299CE3AC1BE7";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1417";
	rename -uid "EB94C521-4EF5-F37A-9D26-1489540B893F";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1418";
	rename -uid "65D9BEA5-4C16-AE6E-AE2F-D9B684BC9D88";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1419";
	rename -uid "C9829417-4B7B-253B-76CC-F48A45F6CCC5";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1420";
	rename -uid "057CE062-4E95-F5AD-7704-F7AC944A29C8";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1421";
	rename -uid "8A0A4B89-4FF0-9B02-67F7-CC9BBF7DD437";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1422";
	rename -uid "922A9C7B-4228-A886-ED8B-5A8A2E7EB7B5";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1423";
	rename -uid "4D07DB60-40F6-4209-F381-7E99C45F94B1";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1424";
	rename -uid "F6E82BA4-4658-EE3E-F6D8-9C867EF8754F";
	setAttr ".i" 0;
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "indexFingerRoot_group_decMat";
	rename -uid "2D6607A1-48E9-8D55-A839-AC86895AA5B5";
createNode multMatrix -n "indexFingerRoot_group_multMat";
	rename -uid "4650A21A-403F-62A0-E978-EAAE1772DCBC";
	setAttr -s 2 ".i";
createNode multMatrix -n "indexFinger_1_group_multMat";
	rename -uid "4B9A2622-49AD-45E4-493A-3CA0BBC12321";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_2_group_decMat";
	rename -uid "18B9C2C7-4ACA-281B-FCFD-9DBEF8E08145";
createNode multMatrix -n "indexFinger_2_group_multMat";
	rename -uid "81D46528-4746-2858-71EC-86B4CEE09C3E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_3_group_decMat";
	rename -uid "72707667-47C8-69A6-D11F-1B9C522E82AA";
createNode multMatrix -n "indexFinger_3_group_multMat";
	rename -uid "58862978-4580-DA90-6F48-B0B308D720E0";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFingerRoot_group_decMat";
	rename -uid "9128B8B6-4B79-5A23-522D-7E9B4D6FB191";
createNode multMatrix -n "middleFingerRoot_group_multMat";
	rename -uid "9C4CE234-409B-6806-0362-E7A13BD83243";
	setAttr -s 2 ".i";
createNode multMatrix -n "middleFinger_1_group_multMat";
	rename -uid "A76FB6D7-44FF-F38E-637E-D1AB4B4513EA";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_2_group_decMat";
	rename -uid "F58D843B-4903-68D4-23B4-7BA4FEE59B7C";
createNode multMatrix -n "middleFinger_2_group_multMat";
	rename -uid "28442028-4B48-7A5F-95E1-C99103FEE87D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_3_group_decMat";
	rename -uid "1D5197D9-4619-1760-8884-A5819367B190";
createNode multMatrix -n "middleFinger_3_group_multMat";
	rename -uid "1B0E0970-4987-5B55-F2E3-A799F1EC5EAF";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFingerRoot_group_decMat";
	rename -uid "4A2E1238-41A4-ADC5-C9E9-03B11FC69C24";
createNode multMatrix -n "ringFingerRoot_group_multMat";
	rename -uid "31FEA447-44EA-9BC5-1466-5C8004C9010C";
	setAttr -s 2 ".i";
createNode multMatrix -n "ringFinger_1_group_multMat";
	rename -uid "FDA8B602-454D-756E-D432-16A4CA4BE26A";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_2_group_decMat";
	rename -uid "57261C02-43CB-7830-7E51-03800FA41173";
createNode multMatrix -n "ringFinger_2_group_multMat";
	rename -uid "A27BF0DD-4163-8E4F-21D0-979F4955B6D0";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_3_group_decMat";
	rename -uid "B695E173-4F2F-563B-E03A-E98075C172EF";
createNode multMatrix -n "ringFinger_3_group_multMat";
	rename -uid "9B20205C-49E0-4235-A774-C19AE0FB6E5C";
	setAttr -s 2 ".i";
createNode multMatrix -n "pinkyFinger_1_group_multMat";
	rename -uid "AE9B13BE-4F0D-2F36-0B12-87A301ABE3C4";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_2_group_decMat";
	rename -uid "2B18D652-43B5-0A63-DECC-13B22753C6D9";
createNode multMatrix -n "pinkyFinger_2_group_multMat";
	rename -uid "EDF95601-415B-F2EE-CDC5-D0A691CD0DDE";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_3_group_decMat";
	rename -uid "372E137C-402E-E827-2342-0299C61FE702";
createNode multMatrix -n "pinkyFinger_3_group_multMat";
	rename -uid "3D2F9CA6-451C-BC96-8869-6CA5B0F4EF97";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "thumbFinger_end_outJoint_decMat";
	rename -uid "C66E5CE7-4A56-96C2-C086-579FF70BD643";
createNode multMatrix -n "thumbFinger_end_outJoint_multMat";
	rename -uid "AACA17AD-4238-4D03-CC9C-02A99B50333E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "indexFinger_end_outJoint_decMat";
	rename -uid "D940D057-46EE-3DB7-7B5D-BA9E96F1417D";
createNode multMatrix -n "indexFinger_end_outJoint_multMat";
	rename -uid "47F50D94-43CE-CC66-0F58-41A06A8D42AA";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "middleFinger_end_outJoint_decMat";
	rename -uid "0C38AD44-4994-682B-10F8-F198FF4127F6";
createNode multMatrix -n "middleFinger_end_outJoint_multMat";
	rename -uid "1EDF6D0F-4973-B5BA-251B-7ABCC1642B8D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "ringFinger_end_outJoint_decMat";
	rename -uid "423AFBC3-4F2B-EE21-B053-878550433328";
createNode multMatrix -n "ringFinger_end_outJoint_multMat";
	rename -uid "C8AEBA15-4FFD-7299-A5E6-EF8ED9D18248";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "pinkyFinger_end_outJoint_decMat";
	rename -uid "60C972FF-42B9-D3B2-D915-84A1277483EC";
createNode multMatrix -n "pinkyFinger_end_outJoint_multMat";
	rename -uid "449B44E3-460A-987B-81A2-95ABDC26F656";
	setAttr -s 2 ".i";
createNode objectSet -n "index_moduleControlSet";
	rename -uid "D706DE67-4253-AF2E-3249-B7B9E2A301F8";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "middle_moduleControlSet";
	rename -uid "C50812BF-4F31-B6E2-361D-11A39A47C9D4";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "ring_moduleControlSet";
	rename -uid "55DAF7A6-48B5-D875-07C0-95848E3FC0AB";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "pinky_moduleControlSet";
	rename -uid "625BADB2-4341-EF49-22E2-97B79375930D";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode pairBlend -n "pairBlend1";
	rename -uid "77C04C33-46A1-5B47-5DD0-D6912A967E3B";
	setAttr ".w" 0.5;
createNode pairBlend -n "pairBlend2";
	rename -uid "90DADF6C-4131-5F9C-2A72-5F86F1584172";
	setAttr ".w" 0;
createNode condition -n "mirror_condition";
	rename -uid "07F72874-48A0-09B7-D1A8-EEA0969A4C48";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 180 0 ;
	setAttr ".cf" -type "float3" 1 0 1 ;
createNode multDoubleLinear -n "multDoubleLinear1";
	rename -uid "CF5518E0-4616-9874-B2CB-599D4C292234";
createNode composeMatrix -n "composeMatrix1";
	rename -uid "4276FF0A-4137-09FC-694A-2A9EC90DA616";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "97D70E19-4DF5-7195-9647-E49BAC3FFEC7";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C96FE923-418C-BB99-9BE7-CFA52FC1E2B1";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "C96A8F96-4C18-2F6D-A4FA-9AA6E1AF2AF0";
createNode multiplyDivide -n "multiplyDivide1";
	rename -uid "97DD9A78-413D-CE73-B0AE-D0A7C359B1DD";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "430D5B51-4B41-5D06-0C91-68B0FDA48EAE";
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "F2C49F93-4400-6DAA-A366-BAA13DC90259";
createNode makeNurbSphere -n "makeNurbSphere4";
	rename -uid "54650D3D-4917-94CA-5663-7AA7EF9469ED";
createNode multiplyDivide -n "multiplyDivide2";
	rename -uid "7C7C1C9B-45B7-0023-9F21-ADACE9807C27";
createNode makeNurbSphere -n "makeNurbSphere5";
	rename -uid "8458B2E1-42D2-A92B-E5D2-CA86E3F0231D";
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "DDF22569-43BA-D28D-77A2-38B97C19CBAE";
createNode makeNurbSphere -n "makeNurbSphere6";
	rename -uid "5CC1ADA9-43D2-8E44-238D-45A8AF6CF241";
createNode makeNurbSphere -n "makeNurbSphere7";
	rename -uid "7677D01C-49E4-6E37-A67B-79BDB1C62D72";
createNode makeNurbSphere -n "makeNurbSphere8";
	rename -uid "014BE79D-463D-8E82-D278-23BBC7D5E0DC";
createNode makeNurbSphere -n "makeNurbSphere9";
	rename -uid "9B2FA9FE-407E-8CD7-7E52-148B077DD3D8";
createNode makeNurbSphere -n "makeNurbSphere10";
	rename -uid "679AC19F-4E25-BE95-5076-358EC7C321D7";
createNode makeNurbSphere -n "makeNurbSphere11";
	rename -uid "0DA88375-4E66-B1CE-8C4D-FAA543FDD451";
createNode makeNurbSphere -n "makeNurbSphere12";
	rename -uid "B10F12C4-40C1-8594-A91E-29B4B1CE25B5";
createNode multiplyDivide -n "multiplyDivide4";
	rename -uid "13E5EE59-4615-79B8-3E23-1482E2655AA2";
createNode multiplyDivide -n "multiplyDivide5";
	rename -uid "57B3D95B-4C0A-4EE0-9E26-12BDC5AFF726";
createNode makeNurbSphere -n "makeNurbSphere13";
	rename -uid "8353952A-4845-1152-0B8A-43B5070A806D";
createNode makeNurbSphere -n "makeNurbSphere14";
	rename -uid "83C66D1F-49F0-2D5B-0C25-518BA3488213";
createNode makeNurbSphere -n "makeNurbSphere15";
	rename -uid "415CC292-48C2-A8D6-3903-C79E07163D71";
createNode makeNurbSphere -n "makeNurbSphere16";
	rename -uid "5BCDA9BC-42C5-B87F-D2AE-21A8FE95DFE1";
createNode multiplyDivide -n "multiplyDivide6";
	rename -uid "4AD9CAA3-4C84-9971-D47D-7DB1B7DE97E3";
createNode makeNurbSphere -n "makeNurbSphere17";
	rename -uid "4CF30176-40A7-D33C-A31B-41A8D63A9F65";
createNode makeNurbSphere -n "makeNurbSphere18";
	rename -uid "44CD0CEA-4989-A27A-879F-41934C161055";
createNode makeNurbSphere -n "makeNurbSphere19";
	rename -uid "3AFD6B6D-4472-DCDE-A5A6-578E569165B8";
createNode makeNurbSphere -n "makeNurbSphere20";
	rename -uid "6BDBB5F8-4A2F-195D-C8BE-249683B957A7";
createNode multiplyDivide -n "multiplyDivide7";
	rename -uid "CDC54DD6-42CE-A0B3-501F-499C0B93AFAD";
createNode makeNurbSphere -n "makeNurbSphere21";
	rename -uid "3664E318-47B8-FB40-18AD-A2B59EB4AD0D";
createNode makeNurbSphere -n "makeNurbSphere22";
	rename -uid "BC8224AB-4678-2938-6568-3ABEA351B49B";
createNode makeNurbSphere -n "makeNurbSphere23";
	rename -uid "C4C2D85D-4354-9EE3-BB24-A78C122F8BC6";
createNode makeNurbSphere -n "makeNurbSphere24";
	rename -uid "F38A618A-4CFF-8643-CF77-94B2108665A6";
createNode multiplyDivide -n "multiplyDivide8";
	rename -uid "AF6B22B9-428A-FBCF-BCB8-A4BD13171736";
createNode multiplyDivide -n "multiplyDivide9";
	rename -uid "E1F6B9EB-4A04-1D58-0C51-A4AD47FD3C4E";
createNode makeNurbSphere -n "makeNurbSphere25";
	rename -uid "B4E28EF0-4752-2C60-BB42-F1A6336AE53E";
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "7DC32EA2-4B93-3B29-A075-F1BB314069E9";
createNode multDoubleLinear -n "multDoubleLinear26";
	rename -uid "32EE8354-41BB-BA30-92FC-83939FCF2DCD";
createNode sweepMeshCreator -n "sweepMeshCreator2";
	rename -uid "3F0792B4-4CA6-4474-494A-C09B5DB8B82B";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
	setAttr -s 5 ".inCurveArray";
	setAttr -s 5 ".outMeshArray";
createNode multMatrix -n "thumbFinger_1_group_multMat";
	rename -uid "478CB382-4BB9-8F7A-96EA-7F8AAFD80F4E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "thumbFinger_1_group_decMat";
	rename -uid "B2CF1711-4BF1-0D66-D28D-E1893267A430";
createNode objectSet -n "skinJointsSet";
	rename -uid "11609AC3-4D7C-8C8C-0394-F2855202DFC5";
	setAttr ".ihi" 0;
	setAttr -s 20 ".dsm";
createNode multDoubleLinear -n "multDoubleLinear28";
	rename -uid "2788E5B7-4964-B228-5394-52B892893834";
	setAttr ".i1" 1.0000000000000002;
createNode multDoubleLinear -n "multDoubleLinear29";
	rename -uid "DB1F1C41-493A-B1A3-A992-26BEDE50A9D6";
	setAttr ".i1" 1.0000000000000002;
createNode multDoubleLinear -n "multDoubleLinear34";
	rename -uid "BC088B8E-4F08-89C0-1129-52B8D2A4B47B";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear35";
	rename -uid "C6F354A7-4083-4BE9-3ABB-26AB4A917A22";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear36";
	rename -uid "FB749598-4281-ED02-A8CF-AAB12C8A4EB7";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear37";
	rename -uid "588A776B-477B-AC73-149B-6597027E1301";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear38";
	rename -uid "751B3F0B-4F69-28F3-0B13-30A179F8FEFF";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear39";
	rename -uid "D47CD1F9-4295-BDAB-1E39-FEBAA2671855";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear40";
	rename -uid "82973D77-4767-7281-DA5A-03A1EC44B760";
	setAttr ".i1" 1;
createNode multDoubleLinear -n "multDoubleLinear41";
	rename -uid "DC1B041E-43E8-AC9A-D2FE-A1AF7B75B4BA";
	setAttr ".i1" 1;
createNode blendMatrix -n "blendMatrix1";
	rename -uid "76BAA171-44F0-1EFF-F636-8F886E4A2996";
createNode setRange -n "setRange1";
	rename -uid "99A386AD-48BE-42FD-775C-1699C396058F";
	setAttr ".m" -type "float3" 1 1 1 ;
	setAttr ".om" -type "float3" 90 90 90 ;
createNode decomposeMatrix -n "decomposeMatrix1";
	rename -uid "5E9E0C9F-46E9-A1F6-79B9-2182B7DC0C16";
createNode blendMatrix -n "blendMatrix2";
	rename -uid "6076DA94-4B10-2E29-A368-29ABB8F1BA66";
createNode blendMatrix -n "blendMatrix3";
	rename -uid "6E22049F-44CB-B6C9-0BC3-E983597FA26C";
	setAttr ".imat" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 5.5511151231257827e-17 -5.5511151231257827e-17 1;
createNode decomposeMatrix -n "decomposeMatrix3";
	rename -uid "F5D0F8F3-42AA-BB26-5A7C-89A0813DF82A";
createNode decomposeMatrix -n "decomposeMatrix4";
	rename -uid "502B1B85-4ED9-8BDF-D6D4-A89ED14CA42C";
createNode decomposeMatrix -n "decomposeMatrix5";
	rename -uid "31529233-4E94-70FD-23A4-00B92661C15F";
createNode blendMatrix -n "blendMatrix4";
	rename -uid "032CA10E-45AA-603D-D3B2-D78573F348A4";
	setAttr ".imat" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 5.5511151231257827e-17 -5.5511151231257827e-17 1;
createNode blendMatrix -n "blendMatrix5";
	rename -uid "BCED973C-4D7A-63CC-FE02-ED9AF457491D";
createNode blendMatrix -n "blendMatrix6";
	rename -uid "DA75CF31-4BF4-2D1F-2A38-52B395C29AB1";
createNode setRange -n "setRange2";
	rename -uid "F62E3E0A-4FE4-E491-98A1-0B8BC16F25D4";
	setAttr ".m" -type "float3" 1 1 1 ;
	setAttr ".om" -type "float3" 90 90 90 ;
createNode decomposeMatrix -n "decomposeMatrix7";
	rename -uid "2B1A0F5E-462E-FA3B-2AC7-44984C1743FF";
createNode decomposeMatrix -n "decomposeMatrix9";
	rename -uid "5B223573-4907-4A30-3F2C-F184304B8A0D";
createNode blendMatrix -n "blendMatrix7";
	rename -uid "D82D743D-4570-9AAB-53D1-5DB49884B9E9";
	setAttr ".imat" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 5.5511151231257827e-17 -5.5511151231257827e-17 1;
createNode blendMatrix -n "blendMatrix8";
	rename -uid "F802E439-42DC-529E-BAB2-14B760FBDC6E";
createNode blendMatrix -n "blendMatrix9";
	rename -uid "3F8339B6-4E83-4E96-FEA7-8FB4C905EEA4";
createNode setRange -n "setRange3";
	rename -uid "E1355BA3-4978-CCA2-B0A1-588124342E4C";
	setAttr ".m" -type "float3" 1 1 1 ;
	setAttr ".om" -type "float3" 90 90 90 ;
createNode decomposeMatrix -n "decomposeMatrix10";
	rename -uid "EE049C38-4F0F-D49A-FE9D-CEAFAF72CE49";
createNode decomposeMatrix -n "decomposeMatrix11";
	rename -uid "F66A7690-4FFD-FDD2-4C09-3BA3F57B7184";
createNode blendMatrix -n "blendMatrix10";
	rename -uid "97C4D633-4FF6-B5FC-AD73-E48EE39BF736";
createNode blendMatrix -n "blendMatrix11";
	rename -uid "6F9FA817-4B5E-C6A3-063C-F5A351FE2A2D";
	setAttr ".imat" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 5.5511151231257827e-17 -5.5511151231257827e-17 1;
createNode blendMatrix -n "blendMatrix12";
	rename -uid "6C5DC75B-4C1F-0F62-BC24-49B5D0F61B4A";
createNode setRange -n "setRange4";
	rename -uid "1626C678-4995-9D73-5FD9-709A92C531A9";
	setAttr ".m" -type "float3" 1 1 1 ;
	setAttr ".om" -type "float3" 90 90 90 ;
createNode decomposeMatrix -n "decomposeMatrix13";
	rename -uid "0128A9E3-4289-18F8-F8C5-818173C94677";
createNode decomposeMatrix -n "decomposeMatrix14";
	rename -uid "4B9841A0-446A-6F3B-9DE6-CFA26A621DC5";
createNode blendMatrix -n "blendMatrix13";
	rename -uid "4FEFF357-4165-7EC6-158D-9C9231820EFD";
	setAttr ".imat" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 5.5511151231257827e-17 -5.5511151231257827e-17 1;
createNode blendMatrix -n "blendMatrix14";
	rename -uid "8C90FA96-4139-38E8-1ABE-D8BFB83C3284";
createNode blendMatrix -n "blendMatrix15";
	rename -uid "1D042E8F-4031-5E94-7CDC-54AD48B789B2";
createNode decomposeMatrix -n "decomposeMatrix15";
	rename -uid "FA680A06-4079-9634-E412-0DA37CAFE3BE";
createNode setRange -n "setRange5";
	rename -uid "214A0857-4480-B338-DEBC-B4BD010551A0";
	setAttr ".m" -type "float3" 1 1 1 ;
	setAttr ".om" -type "float3" 90 90 90 ;
createNode multMatrix -n "multMatrix1";
	rename -uid "D6A84960-4019-1905-AD54-D2AB17A7B710";
	setAttr -s 3 ".i";
createNode composeMatrix -n "composeMatrix3";
	rename -uid "2D37454C-4CB2-4B1A-77E1-BBBAF1C40493";
createNode multMatrix -n "multMatrix2";
	rename -uid "DE7252AC-4DE3-2A1F-42EA-038F0C1D6798";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix4";
	rename -uid "03EE1E7D-4A81-9547-EB0F-E79093B32B1A";
	setAttr -s 2 ".i";
createNode clamp -n "clamp1";
	rename -uid "01F238F3-48C1-D895-6A34-5B9A37EF2073";
	setAttr ".mn" -type "float3" -90 -90 -90 ;
createNode unitConversion -n "unitConversion1450";
	rename -uid "CF805C48-47F2-8DA4-CF3B-3EA468A71C10";
	setAttr ".cf" -0.018;
createNode multMatrix -n "multMatrix5";
	rename -uid "09BEC70C-4470-552D-C6B0-A4A756DF658A";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix6";
	rename -uid "0DE735D9-454F-EA15-DA94-9B90AB801500";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix7";
	rename -uid "73DB331F-4E29-B315-AC06-BEACE4889814";
	setAttr -s 4 ".i";
createNode composeMatrix -n "composeMatrix4";
	rename -uid "51F4910D-4ED6-015C-670D-E4AA9A64DD24";
createNode unitConversion -n "unitConversion1451";
	rename -uid "B9C35777-4671-92FC-4E9E-AC9988039DD7";
	setAttr ".cf" -0.018;
createNode multMatrix -n "multMatrix8";
	rename -uid "755D36B7-4DB0-EA22-70A9-B683C41000D7";
	setAttr -s 4 ".i";
createNode multMatrix -n "multMatrix9";
	rename -uid "28740CD3-426D-E036-672F-EA929BBA3BD2";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix10";
	rename -uid "6C1AF6DF-438E-4B1B-3223-0EB95E6E0922";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1452";
	rename -uid "653B878B-4750-5A4D-9BBD-19B6AB553914";
	setAttr ".cf" -0.018;
createNode composeMatrix -n "composeMatrix5";
	rename -uid "396645E3-4736-F00B-267F-C89761F70626";
createNode multMatrix -n "multMatrix11";
	rename -uid "F021C9A6-4144-066C-3675-F7B9C64FBB03";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix12";
	rename -uid "8BE41D35-4D27-BAEF-23CF-518C8489DB48";
	setAttr -s 4 ".i";
createNode multMatrix -n "multMatrix13";
	rename -uid "B5B880CF-4766-73E8-0719-8D941A7C1319";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix6";
	rename -uid "0FE7CC53-4ADA-76F5-3ADF-A18AA8924A70";
createNode unitConversion -n "unitConversion1453";
	rename -uid "3A6AB65B-4A7D-62FF-37F5-A4A7544D5757";
	setAttr ".cf" -0.018;
createNode clamp -n "clamp2";
	rename -uid "DA0EF63B-4F75-1588-E933-D7B2B3DF2D51";
	setAttr ".mn" -type "float3" -90 -90 -90 ;
	setAttr ".ip" -type "float3" 0 0 45.799999 ;
createNode multMatrix -n "multMatrix14";
	rename -uid "E254C7B2-4BE9-EC78-A404-23BC96CB1E77";
	setAttr -s 4 ".i";
createNode multMatrix -n "multMatrix15";
	rename -uid "5DB9D54A-46C2-17B0-269C-A5B7D8DBA141";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix16";
	rename -uid "C2646EA8-4352-1A34-4BFA-D093C694BBD4";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix7";
	rename -uid "5D0F242B-4C18-B147-095E-6E872D441584";
createNode unitConversion -n "unitConversion1454";
	rename -uid "2725F141-4AEF-74CE-DA28-0F8FBB374C82";
	setAttr ".cf" -0.018;
createNode multMatrix -n "multMatrix17";
	rename -uid "D5B67B0C-47BD-7408-D60E-CBBE126A1B8C";
	setAttr -s 2 ".i";
createNode multMatrix -n "pinkyFingerRoot_group_multMat";
	rename -uid "CF3DFB77-41CA-19F7-C505-1FBF73FF923F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix16";
	rename -uid "1AE9FFA1-413B-1649-901B-FAA16042DE1E";
createNode decomposeMatrix -n "decomposeMatrix17";
	rename -uid "E7614867-4A30-7E0D-9225-848EFECCB0B3";
createNode multMatrix -n "multMatrix18";
	rename -uid "822C9568-475E-CC9E-E81A-CEBB99C212C9";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix20";
	rename -uid "EB903B43-405F-2C8A-0F0B-358C37025F48";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix18";
	rename -uid "3F4733D8-4845-06ED-CF92-7C8AF9FAF7E1";
createNode blendMatrix -n "blendMatrix16";
	rename -uid "8CE85FD9-4B58-5C68-E3DE-16A6298C6D6C";
	setAttr ".env" 0.5;
createNode decomposeMatrix -n "decomposeMatrix19";
	rename -uid "BA53CAA0-45A6-D782-4EA9-8A8372C54010";
createNode multMatrix -n "multMatrix21";
	rename -uid "FCF30BC1-4BB8-2339-FA99-029F51E2EFC2";
	setAttr -s 4 ".i";
createNode blendMatrix -n "blendMatrix17";
	rename -uid "76209925-4716-8234-32FB-CB9474CBC5E5";
	setAttr ".env" 0.5;
createNode composeMatrix -n "composeMatrix8";
	rename -uid "5B79E24E-457A-6EE9-4E01-2CB4DF1C4B63";
createNode multMatrix -n "multMatrix23";
	rename -uid "C9E2FBCB-42D6-8885-0878-1997356F1314";
	setAttr -s 2 ".i";
createNode unitConversion -n "unitConversion1455";
	rename -uid "2FFBA133-454D-3DB0-B26C-88954837B47F";
	setAttr ".cf" -114;
createNode addDoubleLinear -n "index_addDoubleLinear";
	rename -uid "92606222-46E8-AF8C-32B6-C780F1D3F4AE";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "81395FFE-4B5B-3ED4-FA15-099B67CE78C3";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear2";
	rename -uid "C6B6A8D2-4FBB-15B6-C18F-1FABFE6C0380";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "index_addDoubleLinear1";
	rename -uid "3D3C9DD3-4111-5AF6-FD12-9890D379585C";
	setAttr ".ihi" 2;
createNode setRange -n "setRange6";
	rename -uid "502FD64F-4BFC-A3C2-9A9C-E1AA25B3D8E6";
	setAttr ".n" -type "float3" 0 0.33000001 0 ;
	setAttr ".m" -type "float3" 1 0.66000003 0 ;
	setAttr ".on" -type "float3" -40 -40 0 ;
	setAttr ".om" -type "float3" 40 40 0 ;
createNode unitConversion -n "unitConversion1457";
	rename -uid "B86BDEDA-4425-7168-F030-E09C43445A0B";
	setAttr ".cf" 57.295779513082323;
createNode multDoubleLinear -n "multDoubleLinear42";
	rename -uid "AC9C3E3D-4B42-FACE-FFA5-0EA90CAC30D5";
createNode multDoubleLinear -n "multDoubleLinear43";
	rename -uid "BF7C42FB-48B8-ABCB-EB1D-9C8C74C469DE";
createNode multDoubleLinear -n "multDoubleLinear44";
	rename -uid "A46C833A-4D1C-AEDD-CEB1-B089251329BD";
createNode multDoubleLinear -n "multDoubleLinear45";
	rename -uid "228D7275-4CDC-9FF3-FE0C-90B50C2B766C";
createNode setRange -n "setRange7";
	rename -uid "DA3B3554-4891-2A46-6B45-8E80BCB01495";
	setAttr ".n" -type "float3" 0.66000003 1 0 ;
	setAttr ".m" -type "float3" 0.33000001 0 0 ;
	setAttr ".on" -type "float3" -40 -40 0 ;
	setAttr ".om" -type "float3" 40 40 0 ;
createNode multMatrix -n "multMatrix24";
	rename -uid "69EB6452-4D0E-090E-4036-2EA5C7A0D5BD";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix25";
	rename -uid "20E3781C-4AC9-726D-F460-11AA0A554BC1";
createNode inverseMatrix -n "inverseMatrix1";
	rename -uid "319B3EE6-4470-2C28-3118-F6B9AA530C28";
createNode multMatrix -n "middleFinger_1_outJoint_multMat1";
	rename -uid "19A9774C-4007-B00D-1E23-69BBB5B2C4F6";
	setAttr -s 3 ".i";
	setAttr ".i[3]" -type "matrix" 0.98655225339273556 0.00029653831382225394 -0.16344590356060973 0
		 -0.00029653831382225394 0.99999995573488121 2.4398035621888048e-05 0 0.1634459035606097 2.4398035621888051e-05 0.98655229765785424 0
		 0.39482943888790639 -2.1684043449710089e-19 1.1796119636642288e-16 1;
createNode multMatrix -n "multMatrix26";
	rename -uid "A0E37DB5-4C1D-1F44-A6E0-83B4964ABC46";
	setAttr -s 2 ".i";
createNode inverseMatrix -n "inverseMatrix2";
	rename -uid "A412A4E5-41FE-72E6-9269-6388FF93F5D8";
createNode multMatrix -n "multMatrix27";
	rename -uid "1BC3D686-4231-6E66-7549-2F9BE931C21A";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix28";
	rename -uid "ADB3781C-4185-D4C0-9140-849D416A9C58";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix29";
	rename -uid "20BCAC5B-485E-34F8-0A2C-75A4A2482740";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix30";
	rename -uid "FEB099A4-4632-E950-1518-AD8D2AFFB79F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix31";
	rename -uid "98236B58-464C-4364-747F-A798F00EA5E1";
	setAttr -s 2 ".i";
createNode ikSCsolver -n "ikSCsolver";
	rename -uid "E5E2119A-4E25-E20E-70C2-9FB46DA0D15E";
createNode multMatrix -n "multMatrix22";
	rename -uid "F16411DA-41F6-6248-882C-8497D79FFABD";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "decomposeMatrix20";
	rename -uid "69220383-42D5-7514-D471-D1A2ACFB7006";
createNode multMatrix -n "multMatrix32";
	rename -uid "B550F8DB-4267-6405-367F-90B39329C98C";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix33";
	rename -uid "163B912C-4902-98EC-400A-6595CBC7BC1F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix34";
	rename -uid "272618F1-4AE5-B57E-0652-489C69E7B08A";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix35";
	rename -uid "ECBA54E8-4A23-EDB9-D40E-7883D858E692";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix9";
	rename -uid "3DFD4B9B-455F-D2AC-1617-7EAEDDE1FC25";
createNode multMatrix -n "multMatrix36";
	rename -uid "CF921577-45D7-C08A-848B-AF826D262B2F";
	setAttr -s 2 ".i";
createNode blendMatrix -n "blendMatrix18";
	rename -uid "1E243A3B-4668-28A1-3590-B3A6AC813C2D";
	setAttr ".env" 0.5;
createNode multMatrix -n "multMatrix37";
	rename -uid "C72D96A7-44E4-F2B5-7885-2F85C27BF8D2";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix38";
	rename -uid "DAEC361D-43D3-4EE9-C367-A19A75547765";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix39";
	rename -uid "06171B27-4DA3-F9E8-14AC-E9B113D312E8";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix40";
	rename -uid "6E8B59C1-41D1-486B-FBB7-A7A9DD2A1908";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix41";
	rename -uid "B0CA0DA6-4E08-C3CE-AD81-DA8893E015DD";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix42";
	rename -uid "3D0C65B1-4ECB-CA9D-218F-1B8CC22A70C9";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix43";
	rename -uid "FAD3317E-47A6-78D1-13A6-2084E759D7F2";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix44";
	rename -uid "D86DBC0F-45D6-BD92-DD36-CF96C04082AD";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix45";
	rename -uid "B0281DA8-4FDC-EB3D-29A9-D5BFDCD506B3";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix46";
	rename -uid "9658A702-4D76-BEB9-B49A-B08356BC7CD8";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix48";
	rename -uid "E81A3D02-4FD8-D684-83BE-44B42D980D9C";
	setAttr -s 3 ".i";
createNode composeMatrix -n "composeMatrix10";
	rename -uid "94B1A3C0-4D46-8950-97F9-3B95446786A4";
	setAttr ".is" -type "double3" -1 -1 1 ;
createNode multMatrix -n "multMatrix49";
	rename -uid "21CFD561-4B06-EA6C-15B0-479A91519085";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix50";
	rename -uid "8793EF6D-4A68-1C7A-85AC-FCABA601E9D2";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix51";
	rename -uid "E0A44CED-4875-83C1-A0FE-0785330017E6";
	setAttr -s 4 ".i";
createNode animCurveUU -n "indexFinger_ik_parentSwitcher_group_parentConstraint1_indexFinger_3__indexFinger_ik__parentSwitcherTargetW0";
	rename -uid "29A7E3D2-4E64-7ED5-6BF6-72B462A3A818";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 0 2 0;
createNode animCurveUU -n "indexFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__indexFinger_ik__parentSwitcherTargetW1";
	rename -uid "618D37B9-4599-51D1-F006-B592535F1DD1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 1 2 0;
createNode animCurveUU -n "indexFinger_ik_parentSwitcher_group_parentConstraint1_mod__indexFinger_ik__parentSwitcherTargetW2";
	rename -uid "EB07F4E9-45ED-E06A-F6E5-BD94FB6CBB74";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 2 1;
createNode animCurveUU -n "middleFinger_ik_parentSwitcher_group_parentConstraint1_middleFinger_3__middleFinger_ik__parentSwitcherTargetW0";
	rename -uid "D333ECF0-420E-3DA9-1D30-00BC4233471F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 0 2 0;
createNode animCurveUU -n "middleFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__middleFinger_ik__parentSwitcherTargetW1";
	rename -uid "FB840203-4A47-D06B-876C-13AF7BEB5414";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 1 2 0;
createNode animCurveUU -n "middleFinger_ik_parentSwitcher_group_parentConstraint1_mod__middleFinger_ik__parentSwitcherTargetW2";
	rename -uid "935A6159-4293-CA46-DDF1-63A042EC124C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 2 1;
createNode animCurveUU -n "ringFinger_ik_parentSwitcher_group_parentConstraint1_ringFinger_3__ringFinger_ik__parentSwitcherTargetW0";
	rename -uid "F38E2543-4971-7A11-FB3D-F5B377812D80";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 0 2 0;
createNode animCurveUU -n "ringFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__ringFinger_ik__parentSwitcherTargetW1";
	rename -uid "16D55609-4BC7-F4AE-7722-1E93F37F6A4A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 1 2 0;
createNode animCurveUU -n "ringFinger_ik_parentSwitcher_group_parentConstraint1_mod__ringFinger_ik__parentSwitcherTargetW2";
	rename -uid "BD541E64-41E1-4DF1-2781-05849FCAFE2C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 2 1;
createNode animCurveUU -n "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_pinkyFinger_3__pinkyFinger_ik__parentSwitcherTargetW0";
	rename -uid "008DC2A7-4E66-A1A1-8762-1895495EAD69";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 0 2 0;
createNode animCurveUU -n "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__pinkyFinger_ik__parentSwitcherTargetW1";
	rename -uid "9C41D211-4EA2-1577-0CEC-A39D08EBEBDF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 1 2 0;
createNode animCurveUU -n "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_mod__pinkyFinger_ik__parentSwitcherTargetW2";
	rename -uid "ACE2785B-45AC-26CD-917B-198AB3EB4C1C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 2 1;
createNode animCurveUU -n "thumbFinger_ik_parentSwitcher_group_parentConstraint1_thumbFinger_3__thumbFinger_ik__parentSwitcherTargetW0";
	rename -uid "ABAB0FD2-4A3A-0106-E72A-16B279108AD8";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 0 2 0;
createNode animCurveUU -n "thumbFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__thumbFinger_ik__parentSwitcherTargetW1";
	rename -uid "D523F768-4300-1475-60AE-EE936B73C36A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 1 2 0;
createNode animCurveUU -n "thumbFinger_ik_parentSwitcher_group_parentConstraint1_mod__thumbFinger_ik__parentSwitcherTargetW2";
	rename -uid "A8204B82-46ED-145F-AF3B-B497FF41C3A2";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 2 1;
createNode reverse -n "reverse1";
	rename -uid "91AA3A55-4362-FFCB-3483-53A21E5CAEA9";
createNode reverse -n "reverse2";
	rename -uid "528667A2-46E4-6F7B-F2B4-419C78F900DA";
createNode multMatrix -n "multMatrix52";
	rename -uid "772D7277-48C3-60FD-A645-D08F50BF4BFB";
	setAttr -s 2 ".i";
createNode objectSet -n "fingers_ik_moduleControlSet";
	rename -uid "DC13C7F8-4485-060D-6644-CD91957D1A09";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode multMatrix -n "multMatrix53";
	rename -uid "09721996-40F9-94DE-6F35-1C9F173F57FF";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix54";
	rename -uid "5980177A-49B9-8EAD-DDBC-F484C932AA29";
	setAttr -s 3 ".i";
createNode multMatrix -n "multMatrix55";
	rename -uid "0A527F65-4BD6-B2F8-A96A-44901ABACAC7";
createNode multMatrix -n "multMatrix56";
	rename -uid "E0B471EE-434D-2838-865A-27AE89DCB600";
	setAttr -s 2 ".i";
createNode reverse -n "reverse3";
	rename -uid "D33CBCAA-4260-E3CD-B984-5489B8F7D123";
createNode reverse -n "reverse4";
	rename -uid "7931F053-4204-9BDA-DC9D-07A4C1801717";
createNode reverse -n "reverse5";
	rename -uid "789363F7-4ACA-6D57-E198-318986B3B5F5";
createNode multMatrix -n "multMatrix57";
	rename -uid "C0B4CF71-452E-0E0F-1F7E-AAA37CF33624";
	setAttr -s 2 ".i";
createNode animCurveTU -n "mod_mirror";
	rename -uid "C89EAFD0-442A-C411-17B4-CD8D07E58136";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 2 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode unitConversion -n "unitConversion1458";
	rename -uid "29404D50-44AD-EB5F-A922-91AD0B396BBE";
	setAttr ".cf" 0.017453292519943295;
createNode blendMatrix -n "blendMatrix19";
	rename -uid "34C5195C-4929-C678-6B1D-7C8AC009948E";
createNode blendMatrix -n "blendMatrix20";
	rename -uid "37194FCF-4083-20EF-5E30-CEA14EF609A3";
createNode blendMatrix -n "blendMatrix21";
	rename -uid "CCB14A43-4088-285E-B445-A8B84CABDF3C";
createNode blendMatrix -n "blendMatrix22";
	rename -uid "002B1093-4FD5-6BED-7C11-559F1035D4D3";
createNode blendMatrix -n "blendMatrix23";
	rename -uid "9A711529-404D-057F-FDA7-BE8AAEBFBF97";
createNode multMatrix -n "multMatrix58";
	rename -uid "B316512F-44AF-F4E2-F58C-41A4CE1C1D68";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix21";
	rename -uid "1743F303-4633-8741-78B4-E18DB18C6614";
createNode multMatrix -n "multMatrix59";
	rename -uid "DF4E38C9-47B7-EB3B-70BE-BB8813DA0201";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix60";
	rename -uid "0DF695E2-4425-9A14-C576-DFB1582A85B3";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix22";
	rename -uid "CC902E9B-41A8-F433-D15A-EC924E346C61";
createNode decomposeMatrix -n "decomposeMatrix23";
	rename -uid "C36C6B7E-48B2-1F6C-18A2-56AA1DAE9671";
createNode multMatrix -n "multMatrix61";
	rename -uid "5203DE7B-4311-7CF8-C12C-E392896EBCBB";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix24";
	rename -uid "27968333-4260-6DD2-222E-7A9BDE7C19E9";
createNode multMatrix -n "multMatrix62";
	rename -uid "0E7BBAB3-4B11-EC40-6ECE-3EBE90222F3B";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix63";
	rename -uid "04CF68F3-435A-C4B9-1E77-4AB9ABA545FC";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "F6B8C0D5-46AE-9227-EFEF-BBAEB6D43C87";
createNode multMatrix -n "multMatrix64";
	rename -uid "C8A7DDE2-44FC-7EDB-9DE7-3A9D03309ACA";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix65";
	rename -uid "0CB19B5F-4D78-DB4C-25EC-EC87B3DDEE76";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix66";
	rename -uid "A5A1F643-46B8-BA15-1622-CE89B13944D7";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix67";
	rename -uid "F769392A-4E75-7E55-9BDF-55B86300BACD";
	setAttr -s 2 ".i";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "10D32BCD-4EB3-13FD-1C02-9F806A65A56B";
	setAttr -s 7 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 4897.0694024775021 -4723.8093361022056 ;
	setAttr ".tgi[0].vh" -type "double2" 9341.0252698466065 -3520.2379553564069 ;
	setAttr -s 6 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 6830.97119140625;
	setAttr ".tgi[0].ni[0].y" -4077.0302734375;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 6693.2041015625;
	setAttr ".tgi[0].ni[1].y" -3640.45263671875;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 6850.5146484375;
	setAttr ".tgi[0].ni[2].y" -3773.19921875;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 7342.2333984375;
	setAttr ".tgi[0].ni[3].y" -3793.082763671875;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" 6829.8857421875;
	setAttr ".tgi[0].ni[4].y" -3950.453369140625;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 7029.66162109375;
	setAttr ".tgi[0].ni[5].y" -3511.990478515625;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -1783.5622001898798 -3846.4284185852389 ;
	setAttr ".tgi[1].vh" -type "double2" 3082.3716723893463 -2528.5713280950317 ;
	setAttr -s 89 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 3464.28564453125;
	setAttr ".tgi[1].ni[0].y" -4624.28564453125;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 2235.71435546875;
	setAttr ".tgi[1].ni[1].y" -3847.142822265625;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 2542.857177734375;
	setAttr ".tgi[1].ni[2].y" -2607.142822265625;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 3464.28564453125;
	setAttr ".tgi[1].ni[3].y" -4218.5712890625;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 1928.5714111328125;
	setAttr ".tgi[1].ni[4].y" -3060;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 3464.28564453125;
	setAttr ".tgi[1].ni[5].y" -4884.28564453125;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 2850;
	setAttr ".tgi[1].ni[6].y" -2668.571533203125;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" 2235.71435546875;
	setAttr ".tgi[1].ni[7].y" -3032.857177734375;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[1].ni[8].x" 1621.4285888671875;
	setAttr ".tgi[1].ni[8].y" -3001.428466796875;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" 3157.142822265625;
	setAttr ".tgi[1].ni[9].y" -2654.28564453125;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[1].ni[10].x" 2542.857177734375;
	setAttr ".tgi[1].ni[10].y" -4775.71435546875;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" 2542.857177734375;
	setAttr ".tgi[1].ni[11].y" -3532.857177734375;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" 3464.28564453125;
	setAttr ".tgi[1].ni[12].y" -3135.71435546875;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" 2850;
	setAttr ".tgi[1].ni[13].y" -4218.5712890625;
	setAttr ".tgi[1].ni[13].nvs" 18304;
	setAttr ".tgi[1].ni[14].x" 2542.857177734375;
	setAttr ".tgi[1].ni[14].y" -3634.28564453125;
	setAttr ".tgi[1].ni[14].nvs" 18304;
	setAttr ".tgi[1].ni[15].x" 1007.1428833007812;
	setAttr ".tgi[1].ni[15].y" -3051.428466796875;
	setAttr ".tgi[1].ni[15].nvs" 18304;
	setAttr ".tgi[1].ni[16].x" 3464.28564453125;
	setAttr ".tgi[1].ni[16].y" -4754.28564453125;
	setAttr ".tgi[1].ni[16].nvs" 18304;
	setAttr ".tgi[1].ni[17].x" 3464.28564453125;
	setAttr ".tgi[1].ni[17].y" -3244.28564453125;
	setAttr ".tgi[1].ni[17].nvs" 18304;
	setAttr ".tgi[1].ni[18].x" 2542.857177734375;
	setAttr ".tgi[1].ni[18].y" -4877.14306640625;
	setAttr ".tgi[1].ni[18].nvs" 18304;
	setAttr ".tgi[1].ni[19].x" 2235.71435546875;
	setAttr ".tgi[1].ni[19].y" -3337.142822265625;
	setAttr ".tgi[1].ni[19].nvs" 18304;
	setAttr ".tgi[1].ni[20].x" 1314.2857666015625;
	setAttr ".tgi[1].ni[20].y" -3310;
	setAttr ".tgi[1].ni[20].nvs" 18304;
	setAttr ".tgi[1].ni[21].x" 1314.2857666015625;
	setAttr ".tgi[1].ni[21].y" -2980;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" 3157.142822265625;
	setAttr ".tgi[1].ni[22].y" -4985.71435546875;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" 2850;
	setAttr ".tgi[1].ni[23].y" -4985.71435546875;
	setAttr ".tgi[1].ni[23].nvs" 18304;
	setAttr ".tgi[1].ni[24].x" 374.14630126953125;
	setAttr ".tgi[1].ni[24].y" -2768.630615234375;
	setAttr ".tgi[1].ni[24].nvs" 18305;
	setAttr ".tgi[1].ni[25].x" 2235.71435546875;
	setAttr ".tgi[1].ni[25].y" -2931.428466796875;
	setAttr ".tgi[1].ni[25].nvs" 18304;
	setAttr ".tgi[1].ni[26].x" 2850;
	setAttr ".tgi[1].ni[26].y" -4884.28564453125;
	setAttr ".tgi[1].ni[26].nvs" 18304;
	setAttr ".tgi[1].ni[27].x" 2235.71435546875;
	setAttr ".tgi[1].ni[27].y" -3235.71435546875;
	setAttr ".tgi[1].ni[27].nvs" 18304;
	setAttr ".tgi[1].ni[28].x" 3157.142822265625;
	setAttr ".tgi[1].ni[28].y" -3965.71435546875;
	setAttr ".tgi[1].ni[28].nvs" 18304;
	setAttr ".tgi[1].ni[29].x" 2850;
	setAttr ".tgi[1].ni[29].y" -4782.85693359375;
	setAttr ".tgi[1].ni[29].nvs" 18304;
	setAttr ".tgi[1].ni[30].x" 2850;
	setAttr ".tgi[1].ni[30].y" -3962.857177734375;
	setAttr ".tgi[1].ni[30].nvs" 18304;
	setAttr ".tgi[1].ni[31].x" 3464.28564453125;
	setAttr ".tgi[1].ni[31].y" -4985.71435546875;
	setAttr ".tgi[1].ni[31].nvs" 18304;
	setAttr ".tgi[1].ni[32].x" 2850;
	setAttr ".tgi[1].ni[32].y" -2347.142822265625;
	setAttr ".tgi[1].ni[32].nvs" 18304;
	setAttr ".tgi[1].ni[33].x" 3464.28564453125;
	setAttr ".tgi[1].ni[33].y" -3572.857177734375;
	setAttr ".tgi[1].ni[33].nvs" 18304;
	setAttr ".tgi[1].ni[34].x" 3157.142822265625;
	setAttr ".tgi[1].ni[34].y" -2341.428466796875;
	setAttr ".tgi[1].ni[34].nvs" 18304;
	setAttr ".tgi[1].ni[35].x" 3157.142822265625;
	setAttr ".tgi[1].ni[35].y" -4884.28564453125;
	setAttr ".tgi[1].ni[35].nvs" 18304;
	setAttr ".tgi[1].ni[36].x" 2850;
	setAttr ".tgi[1].ni[36].y" -3085.71435546875;
	setAttr ".tgi[1].ni[36].nvs" 18304;
	setAttr ".tgi[1].ni[37].x" 2235.71435546875;
	setAttr ".tgi[1].ni[37].y" -4227.14306640625;
	setAttr ".tgi[1].ni[37].nvs" 18304;
	setAttr ".tgi[1].ni[38].x" 2542.857177734375;
	setAttr ".tgi[1].ni[38].y" -4052.857177734375;
	setAttr ".tgi[1].ni[38].nvs" 18304;
	setAttr ".tgi[1].ni[39].x" 2850;
	setAttr ".tgi[1].ni[39].y" -3702.857177734375;
	setAttr ".tgi[1].ni[39].nvs" 18304;
	setAttr ".tgi[1].ni[40].x" 2542.857177734375;
	setAttr ".tgi[1].ni[40].y" -4978.5712890625;
	setAttr ".tgi[1].ni[40].nvs" 18304;
	setAttr ".tgi[1].ni[41].x" 2850;
	setAttr ".tgi[1].ni[41].y" -4522.85693359375;
	setAttr ".tgi[1].ni[41].nvs" 18304;
	setAttr ".tgi[1].ni[42].x" 3157.142822265625;
	setAttr ".tgi[1].ni[42].y" -4218.5712890625;
	setAttr ".tgi[1].ni[42].nvs" 18304;
	setAttr ".tgi[1].ni[43].x" 1621.4285888671875;
	setAttr ".tgi[1].ni[43].y" -3207.142822265625;
	setAttr ".tgi[1].ni[43].nvs" 18304;
	setAttr ".tgi[1].ni[44].x" 1314.2857666015625;
	setAttr ".tgi[1].ni[44].y" -2878.571533203125;
	setAttr ".tgi[1].ni[44].nvs" 18304;
	setAttr ".tgi[1].ni[45].x" 3464.28564453125;
	setAttr ".tgi[1].ni[45].y" -3995.71435546875;
	setAttr ".tgi[1].ni[45].nvs" 18304;
	setAttr ".tgi[1].ni[46].x" 1007.1428833007812;
	setAttr ".tgi[1].ni[46].y" -2835.71435546875;
	setAttr ".tgi[1].ni[46].nvs" 18304;
	setAttr ".tgi[1].ni[47].x" 2850;
	setAttr ".tgi[1].ni[47].y" -3601.428466796875;
	setAttr ".tgi[1].ni[47].nvs" 18304;
	setAttr ".tgi[1].ni[48].x" 3157.142822265625;
	setAttr ".tgi[1].ni[48].y" -5087.14306640625;
	setAttr ".tgi[1].ni[48].nvs" 18304;
	setAttr ".tgi[1].ni[49].x" 3157.142822265625;
	setAttr ".tgi[1].ni[49].y" -3701.428466796875;
	setAttr ".tgi[1].ni[49].nvs" 18304;
	setAttr ".tgi[1].ni[50].x" 2542.857177734375;
	setAttr ".tgi[1].ni[50].y" -4458.5712890625;
	setAttr ".tgi[1].ni[50].nvs" 18304;
	setAttr ".tgi[1].ni[51].x" 2235.71435546875;
	setAttr ".tgi[1].ni[51].y" -3540;
	setAttr ".tgi[1].ni[51].nvs" 18304;
	setAttr ".tgi[1].ni[52].x" 3464.28564453125;
	setAttr ".tgi[1].ni[52].y" -3414.28564453125;
	setAttr ".tgi[1].ni[52].nvs" 18304;
	setAttr ".tgi[1].ni[53].x" 2542.857177734375;
	setAttr ".tgi[1].ni[53].y" -3215.71435546875;
	setAttr ".tgi[1].ni[53].nvs" 18304;
	setAttr ".tgi[1].ni[54].x" 1928.5714111328125;
	setAttr ".tgi[1].ni[54].y" -3588.571533203125;
	setAttr ".tgi[1].ni[54].nvs" 18304;
	setAttr ".tgi[1].ni[55].x" 2542.857177734375;
	setAttr ".tgi[1].ni[55].y" -4154.28564453125;
	setAttr ".tgi[1].ni[55].nvs" 18304;
	setAttr ".tgi[1].ni[56].x" 2542.857177734375;
	setAttr ".tgi[1].ni[56].y" -4255.71435546875;
	setAttr ".tgi[1].ni[56].nvs" 18304;
	setAttr ".tgi[1].ni[57].x" 2850;
	setAttr ".tgi[1].ni[57].y" -3244.28564453125;
	setAttr ".tgi[1].ni[57].nvs" 18304;
	setAttr ".tgi[1].ni[58].x" 3464.28564453125;
	setAttr ".tgi[1].ni[58].y" -4522.85693359375;
	setAttr ".tgi[1].ni[58].nvs" 18304;
	setAttr ".tgi[1].ni[59].x" 2235.71435546875;
	setAttr ".tgi[1].ni[59].y" -3438.571533203125;
	setAttr ".tgi[1].ni[59].nvs" 18304;
	setAttr ".tgi[1].ni[60].x" 3464.28564453125;
	setAttr ".tgi[1].ni[60].y" -2324.28564453125;
	setAttr ".tgi[1].ni[60].nvs" 18304;
	setAttr ".tgi[1].ni[61].x" 700;
	setAttr ".tgi[1].ni[61].y" -2632.857177734375;
	setAttr ".tgi[1].ni[61].nvs" 18304;
	setAttr ".tgi[1].ni[62].x" 2235.71435546875;
	setAttr ".tgi[1].ni[62].y" -4355.71435546875;
	setAttr ".tgi[1].ni[62].nvs" 18304;
	setAttr ".tgi[1].ni[63].x" 2542.857177734375;
	setAttr ".tgi[1].ni[63].y" -3114.28564453125;
	setAttr ".tgi[1].ni[63].nvs" 18304;
	setAttr ".tgi[1].ni[64].x" 1621.4285888671875;
	setAttr ".tgi[1].ni[64].y" -2795.71435546875;
	setAttr ".tgi[1].ni[64].nvs" 18304;
	setAttr ".tgi[1].ni[65].x" 2542.857177734375;
	setAttr ".tgi[1].ni[65].y" -3951.428466796875;
	setAttr ".tgi[1].ni[65].nvs" 18304;
	setAttr ".tgi[1].ni[66].x" 2850;
	setAttr ".tgi[1].ni[66].y" -5087.14306640625;
	setAttr ".tgi[1].ni[66].nvs" 18304;
	setAttr ".tgi[1].ni[67].x" 3495.71435546875;
	setAttr ".tgi[1].ni[67].y" -5217.14306640625;
	setAttr ".tgi[1].ni[67].nvs" 18304;
	setAttr ".tgi[1].ni[68].x" 3157.142822265625;
	setAttr ".tgi[1].ni[68].y" -4522.85693359375;
	setAttr ".tgi[1].ni[68].nvs" 18304;
	setAttr ".tgi[1].ni[69].x" 3464.28564453125;
	setAttr ".tgi[1].ni[69].y" -4320;
	setAttr ".tgi[1].ni[69].nvs" 18304;
	setAttr ".tgi[1].ni[70].x" 2850;
	setAttr ".tgi[1].ni[70].y" -3442.857177734375;
	setAttr ".tgi[1].ni[70].nvs" 18304;
	setAttr ".tgi[1].ni[71].x" 2542.857177734375;
	setAttr ".tgi[1].ni[71].y" -4617.14306640625;
	setAttr ".tgi[1].ni[71].nvs" 18304;
	setAttr ".tgi[1].ni[72].x" 3157.142822265625;
	setAttr ".tgi[1].ni[72].y" -3414.28564453125;
	setAttr ".tgi[1].ni[72].nvs" 18304;
	setAttr ".tgi[1].ni[73].x" 3157.142822265625;
	setAttr ".tgi[1].ni[73].y" -3572.857177734375;
	setAttr ".tgi[1].ni[73].nvs" 18304;
	setAttr ".tgi[1].ni[74].x" 3464.28564453125;
	setAttr ".tgi[1].ni[74].y" -3034.28564453125;
	setAttr ".tgi[1].ni[74].nvs" 18304;
	setAttr ".tgi[1].ni[75].x" 2542.857177734375;
	setAttr ".tgi[1].ni[75].y" -2290;
	setAttr ".tgi[1].ni[75].nvs" 18304;
	setAttr ".tgi[1].ni[76].x" 1621.4285888671875;
	setAttr ".tgi[1].ni[76].y" -3494.28564453125;
	setAttr ".tgi[1].ni[76].nvs" 18304;
	setAttr ".tgi[1].ni[77].x" 1007.1428833007812;
	setAttr ".tgi[1].ni[77].y" -2620;
	setAttr ".tgi[1].ni[77].nvs" 18304;
	setAttr ".tgi[1].ni[78].x" 3157.142822265625;
	setAttr ".tgi[1].ni[78].y" -4320;
	setAttr ".tgi[1].ni[78].nvs" 18304;
	setAttr ".tgi[1].ni[79].x" 2235.71435546875;
	setAttr ".tgi[1].ni[79].y" -3948.571533203125;
	setAttr ".tgi[1].ni[79].nvs" 18304;
	setAttr ".tgi[1].ni[80].x" 3464.28564453125;
	setAttr ".tgi[1].ni[80].y" -5087.14306640625;
	setAttr ".tgi[1].ni[80].nvs" 18304;
	setAttr ".tgi[1].ni[81].x" 2850;
	setAttr ".tgi[1].ni[81].y" -4320;
	setAttr ".tgi[1].ni[81].nvs" 18304;
	setAttr ".tgi[1].ni[82].x" 3157.142822265625;
	setAttr ".tgi[1].ni[82].y" -3135.71435546875;
	setAttr ".tgi[1].ni[82].nvs" 18304;
	setAttr ".tgi[1].ni[83].x" 3464.28564453125;
	setAttr ".tgi[1].ni[83].y" -2628.571533203125;
	setAttr ".tgi[1].ni[83].nvs" 18304;
	setAttr ".tgi[1].ni[84].x" 3157.142822265625;
	setAttr ".tgi[1].ni[84].y" -3244.28564453125;
	setAttr ".tgi[1].ni[84].nvs" 18304;
	setAttr ".tgi[1].ni[85].x" 3157.142822265625;
	setAttr ".tgi[1].ni[85].y" -4754.28564453125;
	setAttr ".tgi[1].ni[85].nvs" 18304;
	setAttr ".tgi[1].ni[86].x" 1314.2857666015625;
	setAttr ".tgi[1].ni[86].y" -2605.71435546875;
	setAttr ".tgi[1].ni[86].nvs" 18304;
	setAttr ".tgi[1].ni[87].x" 2542.857177734375;
	setAttr ".tgi[1].ni[87].y" -3374.28564453125;
	setAttr ".tgi[1].ni[87].nvs" 18304;
	setAttr ".tgi[1].ni[88].x" 3464.28564453125;
	setAttr ".tgi[1].ni[88].y" -3691.428466796875;
	setAttr ".tgi[1].ni[88].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" 6329.395352887992 -6602.3806900259169 ;
	setAttr ".tgi[2].vh" -type "double2" 10549.175404989219 -5459.5235925818351 ;
	setAttr -s 17 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 7677.14306640625;
	setAttr ".tgi[2].ni[0].y" -5338.5712890625;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[2].ni[1].x" 6755.71435546875;
	setAttr ".tgi[2].ni[1].y" -6068.5712890625;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" 7984.28564453125;
	setAttr ".tgi[2].ni[2].y" -6021.4287109375;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" 7370;
	setAttr ".tgi[2].ni[3].y" -6068.5712890625;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" 7677.14306640625;
	setAttr ".tgi[2].ni[4].y" -6125.71435546875;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" 7984.28564453125;
	setAttr ".tgi[2].ni[5].y" -5502.85693359375;
	setAttr ".tgi[2].ni[5].nvs" 18305;
	setAttr ".tgi[2].ni[6].x" 8291.4287109375;
	setAttr ".tgi[2].ni[6].y" -6335.71435546875;
	setAttr ".tgi[2].ni[6].nvs" 18304;
	setAttr ".tgi[2].ni[7].x" 7984.28564453125;
	setAttr ".tgi[2].ni[7].y" -6122.85693359375;
	setAttr ".tgi[2].ni[7].nvs" 18304;
	setAttr ".tgi[2].ni[8].x" 8630.576171875;
	setAttr ".tgi[2].ni[8].y" -5773.49169921875;
	setAttr ".tgi[2].ni[8].nvs" 18305;
	setAttr ".tgi[2].ni[9].x" 8291.4287109375;
	setAttr ".tgi[2].ni[9].y" -6132.85693359375;
	setAttr ".tgi[2].ni[9].nvs" 18304;
	setAttr ".tgi[2].ni[10].x" 7984.28564453125;
	setAttr ".tgi[2].ni[10].y" -6234.28564453125;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" 8291.4287109375;
	setAttr ".tgi[2].ni[11].y" -5930;
	setAttr ".tgi[2].ni[11].nvs" 18304;
	setAttr ".tgi[2].ni[12].x" 8598.5712890625;
	setAttr ".tgi[2].ni[12].y" -6284.28564453125;
	setAttr ".tgi[2].ni[12].nvs" 18304;
	setAttr ".tgi[2].ni[13].x" 8698.2021484375;
	setAttr ".tgi[2].ni[13].y" -5488.3759765625;
	setAttr ".tgi[2].ni[13].nvs" 18305;
	setAttr ".tgi[2].ni[14].x" 7062.85693359375;
	setAttr ".tgi[2].ni[14].y" -6068.5712890625;
	setAttr ".tgi[2].ni[14].nvs" 18304;
	setAttr ".tgi[2].ni[15].x" 8291.4287109375;
	setAttr ".tgi[2].ni[15].y" -5755.71435546875;
	setAttr ".tgi[2].ni[15].nvs" 18304;
	setAttr ".tgi[2].ni[16].x" 8291.4287109375;
	setAttr ".tgi[2].ni[16].y" -6234.28564453125;
	setAttr ".tgi[2].ni[16].nvs" 18304;
	setAttr ".tgi[3].tn" -type "string" "Untitled_4";
	setAttr ".tgi[3].vl" -type "double2" 530.76920967835713 -6686.9044961910504 ;
	setAttr ".tgi[3].vh" -type "double2" 5440.6591244669708 -5357.1426442691336 ;
	setAttr -s 6 ".tgi[3].ni";
	setAttr ".tgi[3].ni[0].x" 3076.844482421875;
	setAttr ".tgi[3].ni[0].y" -4579.8310546875;
	setAttr ".tgi[3].ni[0].nvs" 19633;
	setAttr ".tgi[3].ni[1].x" 2404.392333984375;
	setAttr ".tgi[3].ni[1].y" -5443.68798828125;
	setAttr ".tgi[3].ni[1].nvs" 18305;
	setAttr ".tgi[3].ni[2].x" 3085.369873046875;
	setAttr ".tgi[3].ni[2].y" -5742.16357421875;
	setAttr ".tgi[3].ni[2].nvs" 19233;
	setAttr ".tgi[3].ni[3].x" 2751.28271484375;
	setAttr ".tgi[3].ni[3].y" -5943.06689453125;
	setAttr ".tgi[3].ni[3].nvs" 18304;
	setAttr ".tgi[3].ni[4].x" 2082.944580078125;
	setAttr ".tgi[3].ni[4].y" -5355.0537109375;
	setAttr ".tgi[3].ni[4].nvs" 18305;
	setAttr ".tgi[3].ni[5].x" 2738.49755859375;
	setAttr ".tgi[3].ni[5].y" -4649.783203125;
	setAttr ".tgi[3].ni[5].nvs" 19313;
	setAttr ".tgi[4].tn" -type "string" "Untitled_5";
	setAttr ".tgi[4].vl" -type "double2" 5289.8649321445437 -6805.3005314781904 ;
	setAttr ".tgi[4].vh" -type "double2" 6143.6464208016596 -5876.7291289524892 ;
	setAttr -s 2 ".tgi[4].ni";
	setAttr ".tgi[4].ni[0].x" 5371.4287109375;
	setAttr ".tgi[4].ni[0].y" -5965.71435546875;
	setAttr ".tgi[4].ni[0].nvs" 18305;
	setAttr ".tgi[4].ni[1].x" 5678.5712890625;
	setAttr ".tgi[4].ni[1].y" -6464.28564453125;
	setAttr ".tgi[4].ni[1].nvs" 18304;
	setAttr ".tgi[5].tn" -type "string" "Untitled_6";
	setAttr ".tgi[5].vl" -type "double2" 1944.8309240512767 -14859.043700840508 ;
	setAttr ".tgi[5].vh" -type "double2" 2799.3233138024016 -13929.699123404494 ;
	setAttr -s 11 ".tgi[5].ni";
	setAttr ".tgi[5].ni[0].x" 2348.571533203125;
	setAttr ".tgi[5].ni[0].y" -13878.5712890625;
	setAttr ".tgi[5].ni[0].nvs" 18304;
	setAttr ".tgi[5].ni[1].x" 1734.2857666015625;
	setAttr ".tgi[5].ni[1].y" -13941.4287109375;
	setAttr ".tgi[5].ni[1].nvs" 18304;
	setAttr ".tgi[5].ni[2].x" 2378.283447265625;
	setAttr ".tgi[5].ni[2].y" -14633.6748046875;
	setAttr ".tgi[5].ni[2].nvs" 18304;
	setAttr ".tgi[5].ni[3].x" 2041.4285888671875;
	setAttr ".tgi[5].ni[3].y" -13878.5712890625;
	setAttr ".tgi[5].ni[3].nvs" 18304;
	setAttr ".tgi[5].ni[4].x" 2655.71435546875;
	setAttr ".tgi[5].ni[4].y" -13857.142578125;
	setAttr ".tgi[5].ni[4].nvs" 18304;
	setAttr ".tgi[5].ni[5].x" 2022.7900390625;
	setAttr ".tgi[5].ni[5].y" -14170.66015625;
	setAttr ".tgi[5].ni[5].nvs" 18305;
	setAttr ".tgi[5].ni[6].x" 1734.2857666015625;
	setAttr ".tgi[5].ni[6].y" -13628.5712890625;
	setAttr ".tgi[5].ni[6].nvs" 18305;
	setAttr ".tgi[5].ni[7].x" 2492.146240234375;
	setAttr ".tgi[5].ni[7].y" -14027.1015625;
	setAttr ".tgi[5].ni[7].nvs" 18304;
	setAttr ".tgi[5].ni[8].x" 2492.146240234375;
	setAttr ".tgi[5].ni[8].y" -14128.5302734375;
	setAttr ".tgi[5].ni[8].nvs" 18304;
	setAttr ".tgi[5].ni[9].x" 2492.146240234375;
	setAttr ".tgi[5].ni[9].y" -14229.958984375;
	setAttr ".tgi[5].ni[9].nvs" 18304;
	setAttr ".tgi[5].ni[10].x" 2413.046630859375;
	setAttr ".tgi[5].ni[10].y" -14503.5947265625;
	setAttr ".tgi[5].ni[10].nvs" 18304;
	setAttr ".tgi[6].tn" -type "string" "Untitled_7";
	setAttr ".tgi[6].vl" -type "double2" -452.37563069828991 2724.2430108736271 ;
	setAttr ".tgi[6].vh" -type "double2" 1511.160953982408 4859.7823081887564 ;
	setAttr -s 25 ".tgi[6].ni";
	setAttr ".tgi[6].ni[0].x" 787.86932373046875;
	setAttr ".tgi[6].ni[0].y" 3602.21630859375;
	setAttr ".tgi[6].ni[0].nvs" 18304;
	setAttr ".tgi[6].ni[1].x" 718.9720458984375;
	setAttr ".tgi[6].ni[1].y" 4611.61083984375;
	setAttr ".tgi[6].ni[1].nvs" 18304;
	setAttr ".tgi[6].ni[2].x" -176.71835327148438;
	setAttr ".tgi[6].ni[2].y" 3592.4384765625;
	setAttr ".tgi[6].ni[2].nvs" 18305;
	setAttr ".tgi[6].ni[3].x" -160.4150390625;
	setAttr ".tgi[6].ni[3].y" 4397.36328125;
	setAttr ".tgi[6].ni[3].nvs" 18305;
	setAttr ".tgi[6].ni[4].x" -158.41647338867188;
	setAttr ".tgi[6].ni[4].y" 4705.236328125;
	setAttr ".tgi[6].ni[4].nvs" 18305;
	setAttr ".tgi[6].ni[5].x" -172.30764770507812;
	setAttr ".tgi[6].ni[5].y" 3722.65576171875;
	setAttr ".tgi[6].ni[5].nvs" 18304;
	setAttr ".tgi[6].ni[6].x" 177.08071899414062;
	setAttr ".tgi[6].ni[6].y" 4588.197265625;
	setAttr ".tgi[6].ni[6].nvs" 18305;
	setAttr ".tgi[6].ni[7].x" 430.8992919921875;
	setAttr ".tgi[6].ni[7].y" 4609.27490234375;
	setAttr ".tgi[6].ni[7].nvs" 18304;
	setAttr ".tgi[6].ni[8].x" 168.36434936523438;
	setAttr ".tgi[6].ni[8].y" 3698.802978515625;
	setAttr ".tgi[6].ni[8].nvs" 18305;
	setAttr ".tgi[6].ni[9].x" 172.42568969726562;
	setAttr ".tgi[6].ni[9].y" 4021.495849609375;
	setAttr ".tgi[6].ni[9].nvs" 18305;
	setAttr ".tgi[6].ni[10].x" -161.9151611328125;
	setAttr ".tgi[6].ni[10].y" 3941.617431640625;
	setAttr ".tgi[6].ni[10].nvs" 18304;
	setAttr ".tgi[6].ni[11].x" 765.97540283203125;
	setAttr ".tgi[6].ni[11].y" 4058.879638671875;
	setAttr ".tgi[6].ni[11].nvs" 18304;
	setAttr ".tgi[6].ni[12].x" 481.6844482421875;
	setAttr ".tgi[6].ni[12].y" 3684.698486328125;
	setAttr ".tgi[6].ni[12].nvs" 18304;
	setAttr ".tgi[6].ni[13].x" 464.43240356445312;
	setAttr ".tgi[6].ni[13].y" 4006.970947265625;
	setAttr ".tgi[6].ni[13].nvs" 18304;
	setAttr ".tgi[6].ni[14].x" -166.19419860839844;
	setAttr ".tgi[6].ni[14].y" 4094.43896484375;
	setAttr ".tgi[6].ni[14].nvs" 18304;
	setAttr ".tgi[6].ni[15].x" 798.96124267578125;
	setAttr ".tgi[6].ni[15].y" 3308.50048828125;
	setAttr ".tgi[6].ni[15].nvs" 18304;
	setAttr ".tgi[6].ni[16].x" -170.09367370605469;
	setAttr ".tgi[6].ni[16].y" 3306.309326171875;
	setAttr ".tgi[6].ni[16].nvs" 18304;
	setAttr ".tgi[6].ni[17].x" 463.08224487304688;
	setAttr ".tgi[6].ni[17].y" 3282.97412109375;
	setAttr ".tgi[6].ni[17].nvs" 18304;
	setAttr ".tgi[6].ni[18].x" -184.81831359863281;
	setAttr ".tgi[6].ni[18].y" 3121.428466796875;
	setAttr ".tgi[6].ni[18].nvs" 18305;
	setAttr ".tgi[6].ni[19].x" 164.87567138671875;
	setAttr ".tgi[6].ni[19].y" 3230.3369140625;
	setAttr ".tgi[6].ni[19].nvs" 18305;
	setAttr ".tgi[6].ni[20].x" 719.74627685546875;
	setAttr ".tgi[6].ni[20].y" 5186.0888671875;
	setAttr ".tgi[6].ni[20].nvs" 18305;
	setAttr ".tgi[6].ni[21].x" 146.21559143066406;
	setAttr ".tgi[6].ni[21].y" 5242.65380859375;
	setAttr ".tgi[6].ni[21].nvs" 18305;
	setAttr ".tgi[6].ni[22].x" -186.35997009277344;
	setAttr ".tgi[6].ni[22].y" 5476.13671875;
	setAttr ".tgi[6].ni[22].nvs" 18305;
	setAttr ".tgi[6].ni[23].x" -181.60438537597656;
	setAttr ".tgi[6].ni[23].y" 4987.2685546875;
	setAttr ".tgi[6].ni[23].nvs" 18305;
	setAttr ".tgi[6].ni[24].x" 420.0963134765625;
	setAttr ".tgi[6].ni[24].y" 5240.580078125;
	setAttr ".tgi[6].ni[24].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 26;
	setAttr -av -k on ".unw" 26;
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
	setAttr -av -k on ".etmr" no;
	setAttr -k on ".tmrm";
	setAttr -av -k on ".tmr" 4096;
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
	setAttr -k on ".fprt";
	setAttr -av -k on ".rtfm";
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
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
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
	setAttr -s 112 ".u";
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
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "multiplyDivide2.oz" "mainPoser_clusterHandle.sx";
connectAttr "multiplyDivide2.oz" "mainPoser_clusterHandle.sy";
connectAttr "multiplyDivide2.oz" "mainPoser_clusterHandle.sz";
connectAttr "thumbFinger_mainPoser.sx" "thumbFinger_mainPoser.sy" -l on;
connectAttr "thumbFinger_mainPoser.sx" "thumbFinger_mainPoser.sz" -l on;
connectAttr "thumbFinger_cluster4GroupId.id" "thumbFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "thumbFinger_cluster4Set.mwc" "thumbFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "thumbFinger_groupId42.id" "thumbFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "thumbFinger_tweakSet24.mwc" "thumbFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "thumbFinger_mainPoser_clusterHandleCluster.og[0]" "thumbFinger_mainPoserShape.cr"
		;
connectAttr "thumbFinger_tweak24.pl[0].cp[0]" "thumbFinger_mainPoserShape.twl";
connectAttr "thumbFinger_mainPoser.size" "thumbFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "thumbFinger_mainPoser.size" "thumbFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "thumbFinger_mainPoser.size" "thumbFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere2.os" "thumbFingerA_poserShape.cr";
connectAttr "thumbFingerA_poserOrient_aimConstraint1.crx" "thumbFingerA_poserOrient.rx"
		;
connectAttr "thumbFingerA_poserOrient_aimConstraint1.cry" "thumbFingerA_poserOrient.ry"
		;
connectAttr "thumbFingerA_poserOrient_aimConstraint1.crz" "thumbFingerA_poserOrient.rz"
		;
connectAttr "thumbFingerA_poserOrient.pim" "thumbFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "thumbFingerA_poserOrient.t" "thumbFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "thumbFingerA_poserOrient.rp" "thumbFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "thumbFingerA_poserOrient.rpt" "thumbFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "thumbFingerA_poserOrient.ro" "thumbFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "thumbFingerB_poser.t" "thumbFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "thumbFingerB_poser.rp" "thumbFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "thumbFingerB_poser.rpt" "thumbFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "thumbFingerB_poser.pm" "thumbFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "thumbFingerA_poserOrient_aimConstraint1.w0" "thumbFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1406.o" "thumbFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere4.os" "thumbFingerB_poserShape.cr";
connectAttr "thumbFingerB_poserOrient_aimConstraint1.crx" "thumbFingerB_poserOrient.rx"
		;
connectAttr "thumbFingerB_poserOrient_aimConstraint1.cry" "thumbFingerB_poserOrient.ry"
		;
connectAttr "thumbFingerB_poserOrient_aimConstraint1.crz" "thumbFingerB_poserOrient.rz"
		;
connectAttr "thumbFingerB_poserOrient.pim" "thumbFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "thumbFingerB_poserOrient.t" "thumbFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "thumbFingerB_poserOrient.rp" "thumbFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "thumbFingerB_poserOrient.rpt" "thumbFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "thumbFingerB_poserOrient.ro" "thumbFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "thumbFingerC_poser.t" "thumbFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "thumbFingerC_poser.rp" "thumbFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "thumbFingerC_poser.rpt" "thumbFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "thumbFingerC_poser.pm" "thumbFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "thumbFingerB_poserOrient_aimConstraint1.w0" "thumbFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1407.o" "thumbFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere3.os" "thumbFingerC_poserShape.cr";
connectAttr "thumbFingerC_poserOrient_aimConstraint1.crx" "thumbFingerC_poserOrient.rx"
		;
connectAttr "thumbFingerC_poserOrient_aimConstraint1.cry" "thumbFingerC_poserOrient.ry"
		;
connectAttr "thumbFingerC_poserOrient_aimConstraint1.crz" "thumbFingerC_poserOrient.rz"
		;
connectAttr "thumbFingerC_poserOrient.pim" "thumbFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "thumbFingerC_poserOrient.t" "thumbFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "thumbFingerC_poserOrient.rp" "thumbFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "thumbFingerC_poserOrient.rpt" "thumbFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "thumbFingerC_poserOrient.ro" "thumbFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "thumbFingerD_poser.t" "thumbFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "thumbFingerD_poser.rp" "thumbFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "thumbFingerD_poser.rpt" "thumbFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "thumbFingerD_poser.pm" "thumbFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "thumbFingerC_poserOrient_aimConstraint1.w0" "thumbFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1408.o" "thumbFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere5.os" "thumbFingerD_poserShape.cr";
connectAttr "makeNurbSphere1.os" "pinkyFingerRoot_poserShape.cr";
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.crx" "pinkyFingerRoot_poserOrient.rx"
		;
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.cry" "pinkyFingerRoot_poserOrient.ry"
		;
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.crz" "pinkyFingerRoot_poserOrient.rz"
		;
connectAttr "pinkyFingerRoot_poserOrient.pim" "pinkyFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerRoot_poserOrient.t" "pinkyFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerRoot_poserOrient.rp" "pinkyFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerRoot_poserOrient.rpt" "pinkyFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerRoot_poserOrient.ro" "pinkyFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerA_poser.t" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerA_poser.rp" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerA_poser.rpt" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerA_poser.pm" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerRoot_poserOrient_aimConstraint1.w0" "pinkyFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1421.o" "pinkyFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere8.os" "ringFingerRoot_poserShape.cr";
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.crx" "ringFingerRoot_poserOrient.rx"
		;
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.cry" "ringFingerRoot_poserOrient.ry"
		;
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.crz" "ringFingerRoot_poserOrient.rz"
		;
connectAttr "ringFingerRoot_poserOrient.pim" "ringFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerRoot_poserOrient.t" "ringFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerRoot_poserOrient.rp" "ringFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerRoot_poserOrient.rpt" "ringFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerRoot_poserOrient.ro" "ringFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerA_poser.t" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerA_poser.rp" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerA_poser.rpt" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerA_poser.pm" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerRoot_poserOrient_aimConstraint1.w0" "ringFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1417.o" "ringFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere7.os" "middleFingerRoot_poserShape.cr";
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.crx" "middleFingerRoot_poserOrient.rx"
		;
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.cry" "middleFingerRoot_poserOrient.ry"
		;
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.crz" "middleFingerRoot_poserOrient.rz"
		;
connectAttr "middleFingerRoot_poserOrient.pim" "middleFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerRoot_poserOrient.t" "middleFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerRoot_poserOrient.rp" "middleFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerRoot_poserOrient.rpt" "middleFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerRoot_poserOrient.ro" "middleFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerA_poser.t" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerA_poser.rp" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerA_poser.rpt" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerA_poser.pm" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerRoot_poserOrient_aimConstraint1.w0" "middleFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1413.o" "middleFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere6.os" "indexFingerRoot_poserShape.cr";
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.crx" "indexFingerRoot_poserOrient.rx"
		;
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.cry" "indexFingerRoot_poserOrient.ry"
		;
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.crz" "indexFingerRoot_poserOrient.rz"
		;
connectAttr "indexFingerRoot_poserOrient.pim" "indexFingerRoot_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerRoot_poserOrient.t" "indexFingerRoot_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerRoot_poserOrient.rp" "indexFingerRoot_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerRoot_poserOrient.rpt" "indexFingerRoot_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerRoot_poserOrient.ro" "indexFingerRoot_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerA_poser.t" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerA_poser.rp" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerA_poser.rpt" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerA_poser.pm" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerRoot_poserOrient_aimConstraint1.w0" "indexFingerRoot_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1409.o" "indexFingerRoot_poserOrient_aimConstraint1.ox"
		;
connectAttr "indexFinger_mainPoser.sx" "indexFinger_mainPoser.sy" -l on;
connectAttr "indexFinger_mainPoser.sx" "indexFinger_mainPoser.sz" -l on;
connectAttr "indexFinger_cluster4GroupId.id" "indexFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "indexFinger_cluster4Set.mwc" "indexFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "indexFinger_groupId42.id" "indexFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "indexFinger_tweakSet24.mwc" "indexFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "indexFinger_mainPoser_clusterHandleCluster.og[0]" "indexFinger_mainPoserShape.cr"
		;
connectAttr "indexFinger_tweak24.pl[0].cp[0]" "indexFinger_mainPoserShape.twl";
connectAttr "indexFinger_mainPoser.size" "indexFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "indexFinger_mainPoser.size" "indexFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "indexFinger_mainPoser.size" "indexFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere9.os" "indexFingerA_poserShape.cr";
connectAttr "indexFingerA_poserOrient_aimConstraint1.crx" "indexFingerA_poserOrient.rx"
		;
connectAttr "indexFingerA_poserOrient_aimConstraint1.cry" "indexFingerA_poserOrient.ry"
		;
connectAttr "indexFingerA_poserOrient_aimConstraint1.crz" "indexFingerA_poserOrient.rz"
		;
connectAttr "indexFingerA_poserOrient.pim" "indexFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerA_poserOrient.t" "indexFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerA_poserOrient.rp" "indexFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerA_poserOrient.rpt" "indexFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerA_poserOrient.ro" "indexFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerB_poser.t" "indexFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerB_poser.rp" "indexFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerB_poser.rpt" "indexFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerB_poser.pm" "indexFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerA_poserOrient_aimConstraint1.w0" "indexFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1410.o" "indexFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere11.os" "indexFingerB_poserShape.cr";
connectAttr "indexFingerB_poserOrient_aimConstraint1.crx" "indexFingerB_poserOrient.rx"
		;
connectAttr "indexFingerB_poserOrient_aimConstraint1.cry" "indexFingerB_poserOrient.ry"
		;
connectAttr "indexFingerB_poserOrient_aimConstraint1.crz" "indexFingerB_poserOrient.rz"
		;
connectAttr "indexFingerB_poserOrient.pim" "indexFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerB_poserOrient.t" "indexFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerB_poserOrient.rp" "indexFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerB_poserOrient.rpt" "indexFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerB_poserOrient.ro" "indexFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerC_poser.t" "indexFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerC_poser.rp" "indexFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerC_poser.rpt" "indexFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerC_poser.pm" "indexFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerB_poserOrient_aimConstraint1.w0" "indexFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1411.o" "indexFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere12.os" "indexFingerC_poserShape.cr";
connectAttr "indexFingerC_poserOrient_aimConstraint1.crx" "indexFingerC_poserOrient.rx"
		;
connectAttr "indexFingerC_poserOrient_aimConstraint1.cry" "indexFingerC_poserOrient.ry"
		;
connectAttr "indexFingerC_poserOrient_aimConstraint1.crz" "indexFingerC_poserOrient.rz"
		;
connectAttr "indexFingerC_poserOrient.pim" "indexFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "indexFingerC_poserOrient.t" "indexFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "indexFingerC_poserOrient.rp" "indexFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "indexFingerC_poserOrient.rpt" "indexFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "indexFingerC_poserOrient.ro" "indexFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "indexFingerD_poser.t" "indexFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFingerD_poser.rp" "indexFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFingerD_poser.rpt" "indexFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFingerD_poser.pm" "indexFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerC_poserOrient_aimConstraint1.w0" "indexFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1412.o" "indexFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere10.os" "indexFingerD_poserShape.cr";
connectAttr "middleFinger_mainPoser.sx" "middleFinger_mainPoser.sy" -l on;
connectAttr "middleFinger_mainPoser.sx" "middleFinger_mainPoser.sz" -l on;
connectAttr "middleFinger_cluster4GroupId.id" "middleFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "middleFinger_cluster4Set.mwc" "middleFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "middleFinger_groupId42.id" "middleFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "middleFinger_tweakSet24.mwc" "middleFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "middleFinger_mainPoser_clusterHandleCluster.og[0]" "middleFinger_mainPoserShape.cr"
		;
connectAttr "middleFinger_tweak24.pl[0].cp[0]" "middleFinger_mainPoserShape.twl"
		;
connectAttr "middleFinger_mainPoser.size" "middleFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "middleFinger_mainPoser.size" "middleFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "middleFinger_mainPoser.size" "middleFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere13.os" "middleFingerA_poserShape.cr";
connectAttr "middleFingerA_poserOrient_aimConstraint1.crx" "middleFingerA_poserOrient.rx"
		;
connectAttr "middleFingerA_poserOrient_aimConstraint1.cry" "middleFingerA_poserOrient.ry"
		;
connectAttr "middleFingerA_poserOrient_aimConstraint1.crz" "middleFingerA_poserOrient.rz"
		;
connectAttr "middleFingerA_poserOrient.pim" "middleFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerA_poserOrient.t" "middleFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerA_poserOrient.rp" "middleFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerA_poserOrient.rpt" "middleFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerA_poserOrient.ro" "middleFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerB_poser.t" "middleFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerB_poser.rp" "middleFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerB_poser.rpt" "middleFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerB_poser.pm" "middleFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerA_poserOrient_aimConstraint1.w0" "middleFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1414.o" "middleFingerA_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere14.os" "middleFingerB_poserShape.cr";
connectAttr "middleFingerB_poserOrient_aimConstraint1.crx" "middleFingerB_poserOrient.rx"
		;
connectAttr "middleFingerB_poserOrient_aimConstraint1.cry" "middleFingerB_poserOrient.ry"
		;
connectAttr "middleFingerB_poserOrient_aimConstraint1.crz" "middleFingerB_poserOrient.rz"
		;
connectAttr "middleFingerB_poserOrient.pim" "middleFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerB_poserOrient.t" "middleFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerB_poserOrient.rp" "middleFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerB_poserOrient.rpt" "middleFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerB_poserOrient.ro" "middleFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerC_poser.t" "middleFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerC_poser.rp" "middleFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerC_poser.rpt" "middleFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerC_poser.pm" "middleFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerB_poserOrient_aimConstraint1.w0" "middleFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1415.o" "middleFingerB_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere15.os" "middleFingerC_poserShape.cr";
connectAttr "middleFingerC_poserOrient_aimConstraint1.crx" "middleFingerC_poserOrient.rx"
		;
connectAttr "middleFingerC_poserOrient_aimConstraint1.cry" "middleFingerC_poserOrient.ry"
		;
connectAttr "middleFingerC_poserOrient_aimConstraint1.crz" "middleFingerC_poserOrient.rz"
		;
connectAttr "middleFingerC_poserOrient.pim" "middleFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "middleFingerC_poserOrient.t" "middleFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "middleFingerC_poserOrient.rp" "middleFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "middleFingerC_poserOrient.rpt" "middleFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "middleFingerC_poserOrient.ro" "middleFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "middleFingerD_poser.t" "middleFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFingerD_poser.rp" "middleFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFingerD_poser.rpt" "middleFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFingerD_poser.pm" "middleFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerC_poserOrient_aimConstraint1.w0" "middleFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1416.o" "middleFingerC_poserOrient_aimConstraint1.ox"
		;
connectAttr "makeNurbSphere16.os" "middleFingerD_poserShape.cr";
connectAttr "ringFinger_mainPoser.sx" "ringFinger_mainPoser.sy" -l on;
connectAttr "ringFinger_mainPoser.sx" "ringFinger_mainPoser.sz" -l on;
connectAttr "ringFinger_cluster4GroupId.id" "ringFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "ringFinger_cluster4Set.mwc" "ringFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "ringFinger_groupId42.id" "ringFinger_mainPoserShape.iog.og[2].gid";
connectAttr "ringFinger_tweakSet24.mwc" "ringFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "ringFinger_mainPoser_clusterHandleCluster.og[0]" "ringFinger_mainPoserShape.cr"
		;
connectAttr "ringFinger_tweak24.pl[0].cp[0]" "ringFinger_mainPoserShape.twl";
connectAttr "ringFinger_mainPoser.size" "ringFinger_mainPoser_clusterHandle.sx";
connectAttr "ringFinger_mainPoser.size" "ringFinger_mainPoser_clusterHandle.sy";
connectAttr "ringFinger_mainPoser.size" "ringFinger_mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere17.os" "ringFingerA_poserShape.cr";
connectAttr "ringFingerA_poserOrient_aimConstraint1.crx" "ringFingerA_poserOrient.rx"
		;
connectAttr "ringFingerA_poserOrient_aimConstraint1.cry" "ringFingerA_poserOrient.ry"
		;
connectAttr "ringFingerA_poserOrient_aimConstraint1.crz" "ringFingerA_poserOrient.rz"
		;
connectAttr "ringFingerA_poserOrient.pim" "ringFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerA_poserOrient.t" "ringFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerA_poserOrient.rp" "ringFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerA_poserOrient.rpt" "ringFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerA_poserOrient.ro" "ringFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerB_poser.t" "ringFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerB_poser.rp" "ringFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerB_poser.rpt" "ringFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerB_poser.pm" "ringFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerA_poserOrient_aimConstraint1.w0" "ringFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1418.o" "ringFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere20.os" "ringFingerB_poserShape.cr";
connectAttr "ringFingerB_poserOrient_aimConstraint1.crx" "ringFingerB_poserOrient.rx"
		;
connectAttr "ringFingerB_poserOrient_aimConstraint1.cry" "ringFingerB_poserOrient.ry"
		;
connectAttr "ringFingerB_poserOrient_aimConstraint1.crz" "ringFingerB_poserOrient.rz"
		;
connectAttr "ringFingerB_poserOrient.pim" "ringFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerB_poserOrient.t" "ringFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerB_poserOrient.rp" "ringFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerB_poserOrient.rpt" "ringFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerB_poserOrient.ro" "ringFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerC_poser.t" "ringFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerC_poser.rp" "ringFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerC_poser.rpt" "ringFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerC_poser.pm" "ringFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerB_poserOrient_aimConstraint1.w0" "ringFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1419.o" "ringFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere19.os" "ringFingerC_poserShape.cr";
connectAttr "ringFingerC_poserOrient_aimConstraint1.crx" "ringFingerC_poserOrient.rx"
		;
connectAttr "ringFingerC_poserOrient_aimConstraint1.cry" "ringFingerC_poserOrient.ry"
		;
connectAttr "ringFingerC_poserOrient_aimConstraint1.crz" "ringFingerC_poserOrient.rz"
		;
connectAttr "ringFingerC_poserOrient.pim" "ringFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "ringFingerC_poserOrient.t" "ringFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "ringFingerC_poserOrient.rp" "ringFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "ringFingerC_poserOrient.rpt" "ringFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "ringFingerC_poserOrient.ro" "ringFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "ringFingerD_poser.t" "ringFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFingerD_poser.rp" "ringFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFingerD_poser.rpt" "ringFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFingerD_poser.pm" "ringFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerC_poserOrient_aimConstraint1.w0" "ringFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1420.o" "ringFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere18.os" "ringFingerD_poserShape.cr";
connectAttr "pinkyFinger_mainPoser.sx" "pinkyFinger_mainPoser.sy" -l on;
connectAttr "pinkyFinger_mainPoser.sx" "pinkyFinger_mainPoser.sz" -l on;
connectAttr "pinkyFinger_cluster4GroupId.id" "pinkyFinger_mainPoserShape.iog.og[1].gid"
		;
connectAttr "pinkyFinger_cluster4Set.mwc" "pinkyFinger_mainPoserShape.iog.og[1].gco"
		;
connectAttr "pinkyFinger_groupId42.id" "pinkyFinger_mainPoserShape.iog.og[2].gid"
		;
connectAttr "pinkyFinger_tweakSet24.mwc" "pinkyFinger_mainPoserShape.iog.og[2].gco"
		;
connectAttr "pinkyFinger_mainPoser_clusterHandleCluster.og[0]" "pinkyFinger_mainPoserShape.cr"
		;
connectAttr "pinkyFinger_tweak24.pl[0].cp[0]" "pinkyFinger_mainPoserShape.twl";
connectAttr "pinkyFinger_mainPoser.size" "pinkyFinger_mainPoser_clusterHandle.sx"
		;
connectAttr "pinkyFinger_mainPoser.size" "pinkyFinger_mainPoser_clusterHandle.sy"
		;
connectAttr "pinkyFinger_mainPoser.size" "pinkyFinger_mainPoser_clusterHandle.sz"
		;
connectAttr "makeNurbSphere23.os" "pinkyFingerA_poserShape.cr";
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.crx" "pinkyFingerA_poserOrient.rx"
		;
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.cry" "pinkyFingerA_poserOrient.ry"
		;
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.crz" "pinkyFingerA_poserOrient.rz"
		;
connectAttr "pinkyFingerA_poserOrient.pim" "pinkyFingerA_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerA_poserOrient.t" "pinkyFingerA_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerA_poserOrient.rp" "pinkyFingerA_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerA_poserOrient.rpt" "pinkyFingerA_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerA_poserOrient.ro" "pinkyFingerA_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerB_poser.t" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerB_poser.rp" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerB_poser.rpt" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerB_poser.pm" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerA_poserOrient_aimConstraint1.w0" "pinkyFingerA_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1422.o" "pinkyFingerA_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere24.os" "pinkyFingerB_poserShape.cr";
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.crx" "pinkyFingerB_poserOrient.rx"
		;
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.cry" "pinkyFingerB_poserOrient.ry"
		;
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.crz" "pinkyFingerB_poserOrient.rz"
		;
connectAttr "pinkyFingerB_poserOrient.pim" "pinkyFingerB_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerB_poserOrient.t" "pinkyFingerB_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerB_poserOrient.rp" "pinkyFingerB_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerB_poserOrient.rpt" "pinkyFingerB_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerB_poserOrient.ro" "pinkyFingerB_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerC_poser.t" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerC_poser.rp" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerC_poser.rpt" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerC_poser.pm" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerB_poserOrient_aimConstraint1.w0" "pinkyFingerB_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1423.o" "pinkyFingerB_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere22.os" "pinkyFingerC_poserShape.cr";
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.crx" "pinkyFingerC_poserOrient.rx"
		;
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.cry" "pinkyFingerC_poserOrient.ry"
		;
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.crz" "pinkyFingerC_poserOrient.rz"
		;
connectAttr "pinkyFingerC_poserOrient.pim" "pinkyFingerC_poserOrient_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerC_poserOrient.t" "pinkyFingerC_poserOrient_aimConstraint1.ct"
		;
connectAttr "pinkyFingerC_poserOrient.rp" "pinkyFingerC_poserOrient_aimConstraint1.crp"
		;
connectAttr "pinkyFingerC_poserOrient.rpt" "pinkyFingerC_poserOrient_aimConstraint1.crt"
		;
connectAttr "pinkyFingerC_poserOrient.ro" "pinkyFingerC_poserOrient_aimConstraint1.cro"
		;
connectAttr "pinkyFingerD_poser.t" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerD_poser.rp" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerD_poser.rpt" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerD_poser.pm" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerC_poserOrient_aimConstraint1.w0" "pinkyFingerC_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1424.o" "pinkyFingerC_poserOrient_aimConstraint1.ox";
connectAttr "makeNurbSphere21.os" "pinkyFingerD_poserShape.cr";
connectAttr "makeNurbSphere25.os" "root_poserShape.cr";
connectAttr "mirror_condition.ocr" "root_initLoc.sy";
connectAttr "multMatrix53.o" "center_palm_loc.opm";
connectAttr "root_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[0]";
connectAttr "thumbFingerA_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[1]"
		;
connectAttr "thumbFingerB_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[2]"
		;
connectAttr "thumbFingerC_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[3]"
		;
connectAttr "thumbFingerD_poser_locShape.wp" "thumbFinger_posers_curveShape.cp[4]"
		;
connectAttr "root_poser_locShape.wp" "indexFinger_posers_curveShape.cp[0]";
connectAttr "indexFingerRoot_poser_locShape.wp" "indexFinger_posers_curveShape.cp[1]"
		;
connectAttr "indexFingerA_poser_locShape.wp" "indexFinger_posers_curveShape.cp[2]"
		;
connectAttr "indexFingerB_poser_locShape.wp" "indexFinger_posers_curveShape.cp[3]"
		;
connectAttr "indexFingerC_poser_locShape.wp" "indexFinger_posers_curveShape.cp[4]"
		;
connectAttr "indexFingerD_poser_locShape.wp" "indexFinger_posers_curveShape.cp[5]"
		;
connectAttr "root_poser_locShape.wp" "middleFinger_posers_curveShape.cp[0]";
connectAttr "middleFingerRoot_poserOrientShape.wp" "middleFinger_posers_curveShape.cp[1]"
		;
connectAttr "middleFingerA_poser_locShape.wp" "middleFinger_posers_curveShape.cp[2]"
		;
connectAttr "middleFingerB_poser_locShape.wp" "middleFinger_posers_curveShape.cp[3]"
		;
connectAttr "middleFingerC_poser_locShape.wp" "middleFinger_posers_curveShape.cp[4]"
		;
connectAttr "middleFingerD_poser_locShape.wp" "middleFinger_posers_curveShape.cp[5]"
		;
connectAttr "root_poser_locShape.wp" "ringFinger_posers_curveShape.cp[0]";
connectAttr "ringFingerRoot_poser_locShape.wp" "ringFinger_posers_curveShape.cp[1]"
		;
connectAttr "ringFingerA_poser_locShape.wp" "ringFinger_posers_curveShape.cp[2]"
		;
connectAttr "ringFingerB_poser_locShape.wp" "ringFinger_posers_curveShape.cp[3]"
		;
connectAttr "ringFingerC_poser_locShape.wp" "ringFinger_posers_curveShape.cp[4]"
		;
connectAttr "ringFingerD_poser_locShape.wp" "ringFinger_posers_curveShape.cp[5]"
		;
connectAttr "root_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[0]";
connectAttr "pinkyFingerRoot_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[1]"
		;
connectAttr "pinkyFingerA_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[2]"
		;
connectAttr "pinkyFingerB_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[3]"
		;
connectAttr "pinkyFingerC_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[4]"
		;
connectAttr "pinkyFingerD_poser_locShape.wp" "pinkyFinger_posers_curveShape.cp[5]"
		;
connectAttr "sweepMeshCreator2.outMeshArray[0]" "thumbFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[1]" "indexFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[2]" "middleFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[3]" "ringFinger_posers_sweepShape.i"
		;
connectAttr "sweepMeshCreator2.outMeshArray[4]" "pinkyFinger_posers_sweepShape.i"
		;
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector_group_parentConstraint1.ctx" "root_connector_group.tx"
		;
connectAttr "root_connector_group_parentConstraint1.cty" "root_connector_group.ty"
		;
connectAttr "root_connector_group_parentConstraint1.ctz" "root_connector_group.tz"
		;
connectAttr "root_connector_group_parentConstraint1.crx" "root_connector_group.rx"
		;
connectAttr "root_connector_group_parentConstraint1.cry" "root_connector_group.ry"
		;
connectAttr "root_connector_group_parentConstraint1.crz" "root_connector_group.rz"
		;
connectAttr "root_connector_group_scaleConstraint1.csx" "root_connector_group.sx"
		;
connectAttr "root_connector_group_scaleConstraint1.csy" "root_connector_group.sy"
		;
connectAttr "root_connector_group_scaleConstraint1.csz" "root_connector_group.sz"
		;
connectAttr "multMatrix59.o" "root_connector__indexFinger_ik__parentSwitcherTarget.opm"
		;
connectAttr "multMatrix64.o" "root_connector__middleFinger_ik__parentSwitcherTarget.opm"
		;
connectAttr "multMatrix65.o" "root_connector__ringFinger_ik__parentSwitcherTarget.opm"
		;
connectAttr "multMatrix66.o" "root_connector__pinkyFinger_ik__parentSwitcherTarget.opm"
		;
connectAttr "multMatrix67.o" "root_connector__thumbFinger_ik__parentSwitcherTarget.opm"
		;
connectAttr "root_connector_group.ro" "root_connector_group_parentConstraint1.cro"
		;
connectAttr "root_connector_group.pim" "root_connector_group_parentConstraint1.cpim"
		;
connectAttr "root_connector_group.rp" "root_connector_group_parentConstraint1.crp"
		;
connectAttr "root_connector_group.rpt" "root_connector_group_parentConstraint1.crt"
		;
connectAttr "ik_connector.t" "root_connector_group_parentConstraint1.tg[0].tt";
connectAttr "ik_connector.rp" "root_connector_group_parentConstraint1.tg[0].trp"
		;
connectAttr "ik_connector.rpt" "root_connector_group_parentConstraint1.tg[0].trt"
		;
connectAttr "ik_connector.r" "root_connector_group_parentConstraint1.tg[0].tr";
connectAttr "ik_connector.ro" "root_connector_group_parentConstraint1.tg[0].tro"
		;
connectAttr "ik_connector.s" "root_connector_group_parentConstraint1.tg[0].ts";
connectAttr "ik_connector.pm" "root_connector_group_parentConstraint1.tg[0].tpm"
		;
connectAttr "root_connector_group_parentConstraint1.w0" "root_connector_group_parentConstraint1.tg[0].tw"
		;
connectAttr "fk_connector.t" "root_connector_group_parentConstraint1.tg[1].tt";
connectAttr "fk_connector.rp" "root_connector_group_parentConstraint1.tg[1].trp"
		;
connectAttr "fk_connector.rpt" "root_connector_group_parentConstraint1.tg[1].trt"
		;
connectAttr "fk_connector.r" "root_connector_group_parentConstraint1.tg[1].tr";
connectAttr "fk_connector.ro" "root_connector_group_parentConstraint1.tg[1].tro"
		;
connectAttr "fk_connector.s" "root_connector_group_parentConstraint1.tg[1].ts";
connectAttr "fk_connector.pm" "root_connector_group_parentConstraint1.tg[1].tpm"
		;
connectAttr "root_connector_group_parentConstraint1.w1" "root_connector_group_parentConstraint1.tg[1].tw"
		;
connectAttr "mod.ikFk" "root_connector_group_parentConstraint1.w0";
connectAttr "reverse3.ox" "root_connector_group_parentConstraint1.w1";
connectAttr "root_connector_group.pim" "root_connector_group_scaleConstraint1.cpim"
		;
connectAttr "ik_connector.s" "root_connector_group_scaleConstraint1.tg[0].ts";
connectAttr "ik_connector.pm" "root_connector_group_scaleConstraint1.tg[0].tpm";
connectAttr "root_connector_group_scaleConstraint1.w0" "root_connector_group_scaleConstraint1.tg[0].tw"
		;
connectAttr "root_connector.wm" "controls.opm";
connectAttr "multMatrix23.o" "fingersBend_group.opm";
connectAttr "fingersBend.addControls" "fingers_ik.v";
connectAttr "fingersBend.thumbIk" "fingers_ik.thumbIk" -l on;
connectAttr "fingersBend.IndexIk" "fingers_ik.IndexIk" -l on;
connectAttr "fingersBend.middleIk" "fingers_ik.middleIk" -l on;
connectAttr "fingersBend.ringIk" "fingers_ik.ringIk" -l on;
connectAttr "fingersBend.pinkyIk" "fingers_ik.pinkyIk" -l on;
connectAttr "multMatrix36.o" "root_ik_pos_loc.opm";
connectAttr "root_pos_loc_parentConstraint1.ctx" "root_pos_loc.tx";
connectAttr "root_pos_loc_parentConstraint1.cty" "root_pos_loc.ty";
connectAttr "root_pos_loc_parentConstraint1.ctz" "root_pos_loc.tz";
connectAttr "root_pos_loc_parentConstraint1.crx" "root_pos_loc.rx";
connectAttr "root_pos_loc_parentConstraint1.cry" "root_pos_loc.ry";
connectAttr "root_pos_loc_parentConstraint1.crz" "root_pos_loc.rz";
connectAttr "multMatrix42.o" "palmBend_ik_group.opm";
connectAttr "fingersBend.addControls" "palmBendShape.v";
connectAttr "multMatrix52.o" "roots_group.opm";
connectAttr "middleFingerRoot_group_decMat.otx" "middleFingerRoot_group.tx";
connectAttr "middleFingerRoot_group_decMat.oty" "middleFingerRoot_group.ty";
connectAttr "middleFingerRoot_group_decMat.otz" "middleFingerRoot_group.tz";
connectAttr "middleFingerRoot_group_decMat.orx" "middleFingerRoot_group.rx";
connectAttr "middleFingerRoot_group_decMat.ory" "middleFingerRoot_group.ry";
connectAttr "middleFingerRoot_group_decMat.orz" "middleFingerRoot_group.rz";
connectAttr "middleFingerRoot_group_decMat.osx" "middleFingerRoot_group.sx";
connectAttr "middleFingerRoot_group_decMat.osy" "middleFingerRoot_group.sy";
connectAttr "middleFingerRoot_group_decMat.osz" "middleFingerRoot_group.sz";
connectAttr "middleFingerRoot_poser.lodv" "middleFingerRoot_group.v";
connectAttr "middleFingerRoot_spread_group_aimConstraint1.cry" "middleFingerRoot_spread_group.ry"
		;
connectAttr "middleFingerRoot_spread_group_aimConstraint1.crx" "middleFingerRoot_spread_group.rx"
		;
connectAttr "middleFingerRoot_spread_group_aimConstraint1.crz" "middleFingerRoot_spread_group.rz"
		;
connectAttr "middleFingerRoot_spread_group.pim" "middleFingerRoot_spread_group_aimConstraint1.cpim"
		;
connectAttr "middleFingerRoot_spread_group.t" "middleFingerRoot_spread_group_aimConstraint1.ct"
		;
connectAttr "middleFingerRoot_spread_group.rp" "middleFingerRoot_spread_group_aimConstraint1.crp"
		;
connectAttr "middleFingerRoot_spread_group.rpt" "middleFingerRoot_spread_group_aimConstraint1.crt"
		;
connectAttr "middleFingerRoot_spread_group.ro" "middleFingerRoot_spread_group_aimConstraint1.cro"
		;
connectAttr "middleFinger_1.t" "middleFingerRoot_spread_group_aimConstraint1.tg[0].tt"
		;
connectAttr "middleFinger_1.rp" "middleFingerRoot_spread_group_aimConstraint1.tg[0].trp"
		;
connectAttr "middleFinger_1.rpt" "middleFingerRoot_spread_group_aimConstraint1.tg[0].trt"
		;
connectAttr "middleFinger_1.pm" "middleFingerRoot_spread_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerRoot_spread_group_aimConstraint1.w0" "middleFingerRoot_spread_group_aimConstraint1.tg[0].tw"
		;
connectAttr "fingers_ik.wm" "middleFingerRoot_spread_group_aimConstraint1.wum";
connectAttr "decomposeMatrix18.otx" "ringFingerRoot_group.tx";
connectAttr "decomposeMatrix18.oty" "ringFingerRoot_group.ty";
connectAttr "decomposeMatrix18.otz" "ringFingerRoot_group.tz";
connectAttr "decomposeMatrix18.orx" "ringFingerRoot_group.rx";
connectAttr "decomposeMatrix18.ory" "ringFingerRoot_group.ry";
connectAttr "decomposeMatrix18.orz" "ringFingerRoot_group.rz";
connectAttr "decomposeMatrix18.osx" "ringFingerRoot_group.sx";
connectAttr "decomposeMatrix18.osy" "ringFingerRoot_group.sy";
connectAttr "decomposeMatrix18.osz" "ringFingerRoot_group.sz";
connectAttr "ringFingerRoot_group_decMat.otx" "ringFingerRoot_init_group.tx";
connectAttr "ringFingerRoot_group_decMat.oty" "ringFingerRoot_init_group.ty";
connectAttr "ringFingerRoot_group_decMat.otz" "ringFingerRoot_init_group.tz";
connectAttr "ringFingerRoot_group_decMat.orx" "ringFingerRoot_init_group.rx";
connectAttr "ringFingerRoot_group_decMat.ory" "ringFingerRoot_init_group.ry";
connectAttr "ringFingerRoot_group_decMat.orz" "ringFingerRoot_init_group.rz";
connectAttr "ringFingerRoot_group_decMat.osx" "ringFingerRoot_init_group.sx";
connectAttr "ringFingerRoot_group_decMat.osy" "ringFingerRoot_init_group.sy";
connectAttr "ringFingerRoot_group_decMat.osz" "ringFingerRoot_init_group.sz";
connectAttr "ringFingerRoot_poser.lodv" "ringFingerRoot_init_group.v";
connectAttr "ringFingerRoot_spread_group_aimConstraint1.cry" "ringFingerRoot_spread_group.ry"
		;
connectAttr "ringFingerRoot_spread_group_aimConstraint1.crx" "ringFingerRoot_spread_group.rx"
		;
connectAttr "ringFingerRoot_spread_group_aimConstraint1.crz" "ringFingerRoot_spread_group.rz"
		;
connectAttr "ringFingerRoot_spread_group.pim" "ringFingerRoot_spread_group_aimConstraint1.cpim"
		;
connectAttr "ringFingerRoot_spread_group.t" "ringFingerRoot_spread_group_aimConstraint1.ct"
		;
connectAttr "ringFingerRoot_spread_group.rp" "ringFingerRoot_spread_group_aimConstraint1.crp"
		;
connectAttr "ringFingerRoot_spread_group.rpt" "ringFingerRoot_spread_group_aimConstraint1.crt"
		;
connectAttr "ringFingerRoot_spread_group.ro" "ringFingerRoot_spread_group_aimConstraint1.cro"
		;
connectAttr "ringFinger_1.t" "ringFingerRoot_spread_group_aimConstraint1.tg[0].tt"
		;
connectAttr "ringFinger_1.rp" "ringFingerRoot_spread_group_aimConstraint1.tg[0].trp"
		;
connectAttr "ringFinger_1.rpt" "ringFingerRoot_spread_group_aimConstraint1.tg[0].trt"
		;
connectAttr "ringFinger_1.pm" "ringFingerRoot_spread_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerRoot_spread_group_aimConstraint1.w0" "ringFingerRoot_spread_group_aimConstraint1.tg[0].tw"
		;
connectAttr "fingers_ik.wm" "ringFingerRoot_spread_group_aimConstraint1.wum";
connectAttr "decomposeMatrix17.ot" "pinkyFingerRoot_group.t";
connectAttr "decomposeMatrix17.or" "pinkyFingerRoot_group.r";
connectAttr "decomposeMatrix17.os" "pinkyFingerRoot_group.s";
connectAttr "decomposeMatrix16.ot" "pinkyFingerRoot_init_group.t";
connectAttr "decomposeMatrix16.or" "pinkyFingerRoot_init_group.r";
connectAttr "decomposeMatrix16.os" "pinkyFingerRoot_init_group.s";
connectAttr "pinkyFingerRoot_poser.lodv" "pinkyFingerRoot_init_group.v";
connectAttr "pinkyFingerRoot_spread_group_aimConstraint1.cry" "pinkyFingerRoot_spread_group.ry"
		;
connectAttr "pinkyFingerRoot_spread_group_aimConstraint1.crx" "pinkyFingerRoot_spread_group.rx"
		;
connectAttr "pinkyFingerRoot_spread_group_aimConstraint1.crz" "pinkyFingerRoot_spread_group.rz"
		;
connectAttr "pinkyFingerRoot_spread_group.pim" "pinkyFingerRoot_spread_group_aimConstraint1.cpim"
		;
connectAttr "pinkyFingerRoot_spread_group.t" "pinkyFingerRoot_spread_group_aimConstraint1.ct"
		;
connectAttr "pinkyFingerRoot_spread_group.rp" "pinkyFingerRoot_spread_group_aimConstraint1.crp"
		;
connectAttr "pinkyFingerRoot_spread_group.rpt" "pinkyFingerRoot_spread_group_aimConstraint1.crt"
		;
connectAttr "pinkyFingerRoot_spread_group.ro" "pinkyFingerRoot_spread_group_aimConstraint1.cro"
		;
connectAttr "pinkyFinger_1.t" "pinkyFingerRoot_spread_group_aimConstraint1.tg[0].tt"
		;
connectAttr "pinkyFinger_1.rp" "pinkyFingerRoot_spread_group_aimConstraint1.tg[0].trp"
		;
connectAttr "pinkyFinger_1.rpt" "pinkyFingerRoot_spread_group_aimConstraint1.tg[0].trt"
		;
connectAttr "pinkyFinger_1.pm" "pinkyFingerRoot_spread_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerRoot_spread_group_aimConstraint1.w0" "pinkyFingerRoot_spread_group_aimConstraint1.tg[0].tw"
		;
connectAttr "b_bend.wm" "pinkyFingerRoot_spread_group_aimConstraint1.wum";
connectAttr "decomposeMatrix19.otx" "indexFingerRoot_group.tx";
connectAttr "decomposeMatrix19.oty" "indexFingerRoot_group.ty";
connectAttr "decomposeMatrix19.otz" "indexFingerRoot_group.tz";
connectAttr "decomposeMatrix19.orx" "indexFingerRoot_group.rx";
connectAttr "decomposeMatrix19.ory" "indexFingerRoot_group.ry";
connectAttr "decomposeMatrix19.orz" "indexFingerRoot_group.rz";
connectAttr "decomposeMatrix19.osx" "indexFingerRoot_group.sx";
connectAttr "decomposeMatrix19.osy" "indexFingerRoot_group.sy";
connectAttr "decomposeMatrix19.osz" "indexFingerRoot_group.sz";
connectAttr "indexFingerRoot_group_decMat.otx" "indexFingerRoot_init_group.tx";
connectAttr "indexFingerRoot_group_decMat.oty" "indexFingerRoot_init_group.ty";
connectAttr "indexFingerRoot_group_decMat.otz" "indexFingerRoot_init_group.tz";
connectAttr "indexFingerRoot_group_decMat.orx" "indexFingerRoot_init_group.rx";
connectAttr "indexFingerRoot_group_decMat.ory" "indexFingerRoot_init_group.ry";
connectAttr "indexFingerRoot_group_decMat.orz" "indexFingerRoot_init_group.rz";
connectAttr "indexFingerRoot_group_decMat.osx" "indexFingerRoot_init_group.sx";
connectAttr "indexFingerRoot_group_decMat.osy" "indexFingerRoot_init_group.sy";
connectAttr "indexFingerRoot_group_decMat.osz" "indexFingerRoot_init_group.sz";
connectAttr "indexFingerRoot_poser.lodv" "indexFingerRoot_init_group.v";
connectAttr "indexFingerRoot_spread_group_aimConstraint1.cry" "indexFingerRoot_spread_group.ry"
		;
connectAttr "indexFingerRoot_spread_group_aimConstraint1.crx" "indexFingerRoot_spread_group.rx"
		;
connectAttr "indexFingerRoot_spread_group_aimConstraint1.crz" "indexFingerRoot_spread_group.rz"
		;
connectAttr "indexFingerRoot_spread_group.pim" "indexFingerRoot_spread_group_aimConstraint1.cpim"
		;
connectAttr "indexFingerRoot_spread_group.t" "indexFingerRoot_spread_group_aimConstraint1.ct"
		;
connectAttr "indexFingerRoot_spread_group.rp" "indexFingerRoot_spread_group_aimConstraint1.crp"
		;
connectAttr "indexFingerRoot_spread_group.rpt" "indexFingerRoot_spread_group_aimConstraint1.crt"
		;
connectAttr "indexFingerRoot_spread_group.ro" "indexFingerRoot_spread_group_aimConstraint1.cro"
		;
connectAttr "indexFinger_1.t" "indexFingerRoot_spread_group_aimConstraint1.tg[0].tt"
		;
connectAttr "indexFinger_1.rp" "indexFingerRoot_spread_group_aimConstraint1.tg[0].trp"
		;
connectAttr "indexFinger_1.rpt" "indexFingerRoot_spread_group_aimConstraint1.tg[0].trt"
		;
connectAttr "indexFinger_1.pm" "indexFingerRoot_spread_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerRoot_spread_group_aimConstraint1.w0" "indexFingerRoot_spread_group_aimConstraint1.tg[0].tw"
		;
connectAttr "f_bend.wm" "indexFingerRoot_spread_group_aimConstraint1.wum";
connectAttr "root_pos_loc.ro" "root_pos_loc_parentConstraint1.cro";
connectAttr "root_pos_loc.pim" "root_pos_loc_parentConstraint1.cpim";
connectAttr "root_pos_loc.rp" "root_pos_loc_parentConstraint1.crp";
connectAttr "root_pos_loc.rpt" "root_pos_loc_parentConstraint1.crt";
connectAttr "root_fk_pos_loc.t" "root_pos_loc_parentConstraint1.tg[0].tt";
connectAttr "root_fk_pos_loc.rp" "root_pos_loc_parentConstraint1.tg[0].trp";
connectAttr "root_fk_pos_loc.rpt" "root_pos_loc_parentConstraint1.tg[0].trt";
connectAttr "root_fk_pos_loc.r" "root_pos_loc_parentConstraint1.tg[0].tr";
connectAttr "root_fk_pos_loc.ro" "root_pos_loc_parentConstraint1.tg[0].tro";
connectAttr "root_fk_pos_loc.s" "root_pos_loc_parentConstraint1.tg[0].ts";
connectAttr "root_fk_pos_loc.pm" "root_pos_loc_parentConstraint1.tg[0].tpm";
connectAttr "root_pos_loc_parentConstraint1.w0" "root_pos_loc_parentConstraint1.tg[0].tw"
		;
connectAttr "root_ik_pos_loc.t" "root_pos_loc_parentConstraint1.tg[1].tt";
connectAttr "root_ik_pos_loc.rp" "root_pos_loc_parentConstraint1.tg[1].trp";
connectAttr "root_ik_pos_loc.rpt" "root_pos_loc_parentConstraint1.tg[1].trt";
connectAttr "root_ik_pos_loc.r" "root_pos_loc_parentConstraint1.tg[1].tr";
connectAttr "root_ik_pos_loc.ro" "root_pos_loc_parentConstraint1.tg[1].tro";
connectAttr "root_ik_pos_loc.s" "root_pos_loc_parentConstraint1.tg[1].ts";
connectAttr "root_ik_pos_loc.pm" "root_pos_loc_parentConstraint1.tg[1].tpm";
connectAttr "root_pos_loc_parentConstraint1.w1" "root_pos_loc_parentConstraint1.tg[1].tw"
		;
connectAttr "reverse3.ox" "root_pos_loc_parentConstraint1.w0";
connectAttr "mod.ikFk" "root_pos_loc_parentConstraint1.w1";
connectAttr "mod.ikFk" "fingers_ikShape.v";
connectAttr "fingersBend.addControls" "fingersRootShape.v";
connectAttr "multMatrix46.o" "pinkyFingerRootIk_loc.opm";
connectAttr "multMatrix43.o" "ringFingerRootIk_loc.opm";
connectAttr "multMatrix44.o" "middleFingerRootIk_loc.opm";
connectAttr "multMatrix45.o" "indexFingerRootIk_loc.opm";
connectAttr "multMatrix46.o" "pinkyFingerRootIk_init.opm";
connectAttr "multMatrix43.o" "ringFingerRootIk_init.opm";
connectAttr "multMatrix44.o" "middleFingerRootIk_init.opm";
connectAttr "multMatrix45.o" "indexFingerRootIk_init.opm";
connectAttr "multMatrix57.o" "root_fk_pos_loc.opm";
connectAttr "multMatrix17.o" "b_bend_group.opm";
connectAttr "fingersBend.addControls" "b_bendShape.v";
connectAttr "multMatrix49.o" "ringFinger_bend_target.opm";
connectAttr "multMatrix50.o" "pinkyFinger_bend_target.opm";
connectAttr "multMatrix17.o" "f_bend_group.opm";
connectAttr "fingersBend.addControls" "f_bendShape.v";
connectAttr "multMatrix48.o" "indexFinger_bend_target.opm";
connectAttr "multMatrix54.o" "thumFinger_bend_target.opm";
connectAttr "thumbFinger_group_2_parentConstraint1.ctx" "thumbFinger_group_2.tx"
		;
connectAttr "thumbFinger_group_2_parentConstraint1.cty" "thumbFinger_group_2.ty"
		;
connectAttr "thumbFinger_group_2_parentConstraint1.ctz" "thumbFinger_group_2.tz"
		;
connectAttr "thumbFinger_group_2_parentConstraint1.crx" "thumbFinger_group_2.rx"
		;
connectAttr "thumbFinger_group_2_parentConstraint1.cry" "thumbFinger_group_2.ry"
		;
connectAttr "thumbFinger_group_2_parentConstraint1.crz" "thumbFinger_group_2.rz"
		;
connectAttr "decomposeMatrix20.otx" "thumbFinger_group_1.tx";
connectAttr "decomposeMatrix20.oty" "thumbFinger_group_1.ty";
connectAttr "decomposeMatrix20.otz" "thumbFinger_group_1.tz";
connectAttr "decomposeMatrix20.orx" "thumbFinger_group_1.rx";
connectAttr "decomposeMatrix20.ory" "thumbFinger_group_1.ry";
connectAttr "decomposeMatrix20.orz" "thumbFinger_group_1.rz";
connectAttr "decomposeMatrix20.osx" "thumbFinger_group_1.sx";
connectAttr "decomposeMatrix20.osy" "thumbFinger_group_1.sy";
connectAttr "decomposeMatrix20.osz" "thumbFinger_group_1.sz";
connectAttr "thumbFinger_mainPoser.lodv" "thumbFinger_group.v";
connectAttr "multMatrix56.o" "thumbFinger_group.opm";
connectAttr "mainPoser.closed" "thumbFinger_1_closedShape.v";
connectAttr "decomposeMatrix14.otx" "thumbFinger_1_group_3.tx";
connectAttr "decomposeMatrix14.oty" "thumbFinger_1_group_3.ty";
connectAttr "decomposeMatrix14.otz" "thumbFinger_1_group_3.tz";
connectAttr "decomposeMatrix14.orx" "thumbFinger_1_group_3.rx";
connectAttr "decomposeMatrix14.ory" "thumbFinger_1_group_3.ry";
connectAttr "decomposeMatrix14.orz" "thumbFinger_1_group_3.rz";
connectAttr "decomposeMatrix14.osx" "thumbFinger_1_group_3.sx";
connectAttr "decomposeMatrix14.osy" "thumbFinger_1_group_3.sy";
connectAttr "decomposeMatrix14.osz" "thumbFinger_1_group_3.sz";
connectAttr "thumbFinger_2_offset_decMat.otx" "thumbFinger_2_group.tx";
connectAttr "thumbFinger_2_offset_decMat.oty" "thumbFinger_2_group.ty";
connectAttr "thumbFinger_2_offset_decMat.otz" "thumbFinger_2_group.tz";
connectAttr "thumbFinger_2_offset_decMat.orx" "thumbFinger_2_group.rx";
connectAttr "thumbFinger_2_offset_decMat.ory" "thumbFinger_2_group.ry";
connectAttr "thumbFinger_2_offset_decMat.orz" "thumbFinger_2_group.rz";
connectAttr "thumbFinger_2_offset_decMat.osx" "thumbFinger_2_group.sx";
connectAttr "thumbFinger_2_offset_decMat.osy" "thumbFinger_2_group.sy";
connectAttr "thumbFinger_2_offset_decMat.osz" "thumbFinger_2_group.sz";
connectAttr "mainPoser.closed" "thumbFinger_2_closedShape.v";
connectAttr "decomposeMatrix13.orz" "thumbFinger_2_group_2.rz";
connectAttr "decomposeMatrix13.orx" "thumbFinger_2_group_2.rx";
connectAttr "decomposeMatrix13.ory" "thumbFinger_2_group_2.ry";
connectAttr "decomposeMatrix13.otx" "thumbFinger_2_group_2.tx";
connectAttr "decomposeMatrix13.oty" "thumbFinger_2_group_2.ty";
connectAttr "decomposeMatrix13.otz" "thumbFinger_2_group_2.tz";
connectAttr "decomposeMatrix13.osx" "thumbFinger_2_group_2.sx";
connectAttr "decomposeMatrix13.osy" "thumbFinger_2_group_2.sy";
connectAttr "decomposeMatrix13.osz" "thumbFinger_2_group_2.sz";
connectAttr "thumbFinger_3_offset_decMat.otx" "thumbFinger_3_group.tx";
connectAttr "thumbFinger_3_offset_decMat.oty" "thumbFinger_3_group.ty";
connectAttr "thumbFinger_3_offset_decMat.otz" "thumbFinger_3_group.tz";
connectAttr "thumbFinger_3_offset_decMat.orx" "thumbFinger_3_group.rx";
connectAttr "thumbFinger_3_offset_decMat.ory" "thumbFinger_3_group.ry";
connectAttr "thumbFinger_3_offset_decMat.orz" "thumbFinger_3_group.rz";
connectAttr "thumbFinger_3_offset_decMat.osx" "thumbFinger_3_group.sx";
connectAttr "thumbFinger_3_offset_decMat.osy" "thumbFinger_3_group.sy";
connectAttr "thumbFinger_3_offset_decMat.osz" "thumbFinger_3_group.sz";
connectAttr "mainPoser.closed" "thumbFinger_3_closedShape.v";
connectAttr "decomposeMatrix15.orz" "thumbFinger_3_group_2.rz";
connectAttr "decomposeMatrix15.orx" "thumbFinger_3_group_2.rx";
connectAttr "decomposeMatrix15.ory" "thumbFinger_3_group_2.ry";
connectAttr "decomposeMatrix15.otx" "thumbFinger_3_group_2.tx";
connectAttr "decomposeMatrix15.oty" "thumbFinger_3_group_2.ty";
connectAttr "decomposeMatrix15.otz" "thumbFinger_3_group_2.tz";
connectAttr "decomposeMatrix15.osx" "thumbFinger_3_group_2.sx";
connectAttr "decomposeMatrix15.osy" "thumbFinger_3_group_2.sy";
connectAttr "decomposeMatrix15.osz" "thumbFinger_3_group_2.sz";
connectAttr "reverse4.oy" "thumbFinger_3Shape.v";
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.ctx" "thumbFinger_ik_parentSwitcher_group.tx"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.cty" "thumbFinger_ik_parentSwitcher_group.ty"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.ctz" "thumbFinger_ik_parentSwitcher_group.tz"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.crx" "thumbFinger_ik_parentSwitcher_group.rx"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.cry" "thumbFinger_ik_parentSwitcher_group.ry"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.crz" "thumbFinger_ik_parentSwitcher_group.rz"
		;
connectAttr "decomposeMatrix25.ot" "thumbFinger_ik.rp";
connectAttr "fingersBend.thumbIk" "thumbFinger_ikShape.v";
connectAttr "thumbFinger_1_ikJoint.msg" "ikHandle2.hsj";
connectAttr "effector2.hp" "ikHandle2.hee";
connectAttr "ikSCsolver.msg" "ikHandle2.hsv";
connectAttr "thumbFinger_3_ikJoint.msg" "ikHandle12.hsj";
connectAttr "effector12.hp" "ikHandle12.hee";
connectAttr "ikSCsolver.msg" "ikHandle12.hsv";
connectAttr "thumbFinger_ik_parentSwitcher_group.ro" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.cro"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group.pim" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.cpim"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group.rp" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.crp"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group.rpt" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.crt"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.t" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tt"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.rp" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trp"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.rpt" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trt"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.r" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tr"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.ro" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tro"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.s" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].ts"
		;
connectAttr "thumbFinger_3__thumbFinger_ik__parentSwitcherTarget.pm" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tpm"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.w0" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tw"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.t" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tt"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.rp" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trp"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.rpt" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trt"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.r" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tr"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.ro" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tro"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.s" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].ts"
		;
connectAttr "root_connector__thumbFinger_ik__parentSwitcherTarget.pm" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tpm"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.w1" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tw"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.t" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tt"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.rp" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trp"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.rpt" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trt"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.r" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tr"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.ro" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tro"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.s" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].ts"
		;
connectAttr "mod__thumbFinger_ik__parentSwitcherTarget.pm" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tpm"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1.w2" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tw"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1_thumbFinger_3__thumbFinger_ik__parentSwitcherTargetW0.o" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.w0"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__thumbFinger_ik__parentSwitcherTargetW1.o" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.w1"
		;
connectAttr "thumbFinger_ik_parentSwitcher_group_parentConstraint1_mod__thumbFinger_ik__parentSwitcherTargetW2.o" "thumbFinger_ik_parentSwitcher_group_parentConstraint1.w2"
		;
connectAttr "reverse4.oy" "thumbFinger_2Shape.v";
connectAttr "reverse4.oy" "thumbFinger_1Shape.v";
connectAttr "thumbFinger_1_ikJoint.s" "thumbFinger_2_ikJoint.is";
connectAttr "thumbFinger_2_offset_decMat.otx" "thumbFinger_2_ikJoint.tx";
connectAttr "thumbFinger_3_ikJoint_orientConstraint1.crx" "thumbFinger_3_ikJoint.rx"
		;
connectAttr "thumbFinger_3_ikJoint_orientConstraint1.cry" "thumbFinger_3_ikJoint.ry"
		;
connectAttr "thumbFinger_3_ikJoint_orientConstraint1.crz" "thumbFinger_3_ikJoint.rz"
		;
connectAttr "thumbFinger_2_ikJoint.s" "thumbFinger_3_ikJoint.is";
connectAttr "thumbFinger_3_offset_decMat.otx" "thumbFinger_3_ikJoint.tx";
connectAttr "thumbFinger_3_ikJoint.s" "thumbFinger_end_ikJoint.is";
connectAttr "thumbFinger_3_ikJoint.ro" "thumbFinger_3_ikJoint_orientConstraint1.cro"
		;
connectAttr "thumbFinger_3_ikJoint.pim" "thumbFinger_3_ikJoint_orientConstraint1.cpim"
		;
connectAttr "thumbFinger_3_ikJoint.jo" "thumbFinger_3_ikJoint_orientConstraint1.cjo"
		;
connectAttr "thumbFinger_3_ikJoint.is" "thumbFinger_3_ikJoint_orientConstraint1.is"
		;
connectAttr "thumbFinger_ik.r" "thumbFinger_3_ikJoint_orientConstraint1.tg[0].tr"
		;
connectAttr "thumbFinger_ik.ro" "thumbFinger_3_ikJoint_orientConstraint1.tg[0].tro"
		;
connectAttr "thumbFinger_ik.pm" "thumbFinger_3_ikJoint_orientConstraint1.tg[0].tpm"
		;
connectAttr "thumbFinger_3_ikJoint_orientConstraint1.w0" "thumbFinger_3_ikJoint_orientConstraint1.tg[0].tw"
		;
connectAttr "thumbFinger_end_ikJoint.tx" "effector12.tx";
connectAttr "thumbFinger_end_ikJoint.ty" "effector12.ty";
connectAttr "thumbFinger_end_ikJoint.tz" "effector12.tz";
connectAttr "thumbFinger_end_ikJoint.opm" "effector12.opm";
connectAttr "thumbFinger_3_ikJoint.tx" "effector2.tx";
connectAttr "thumbFinger_3_ikJoint.ty" "effector2.ty";
connectAttr "thumbFinger_3_ikJoint.tz" "effector2.tz";
connectAttr "thumbFinger_3_ikJoint.opm" "effector2.opm";
connectAttr "mainPoser.spread" "thumbFinger_1_spreadShape.v";
connectAttr "thumbFinger_group_2.ro" "thumbFinger_group_2_parentConstraint1.cro"
		;
connectAttr "thumbFinger_group_2.pim" "thumbFinger_group_2_parentConstraint1.cpim"
		;
connectAttr "thumbFinger_group_2.rp" "thumbFinger_group_2_parentConstraint1.crp"
		;
connectAttr "thumbFinger_group_2.rpt" "thumbFinger_group_2_parentConstraint1.crt"
		;
connectAttr "root_pos_loc.t" "thumbFinger_group_2_parentConstraint1.tg[0].tt";
connectAttr "root_pos_loc.rp" "thumbFinger_group_2_parentConstraint1.tg[0].trp";
connectAttr "root_pos_loc.rpt" "thumbFinger_group_2_parentConstraint1.tg[0].trt"
		;
connectAttr "root_pos_loc.r" "thumbFinger_group_2_parentConstraint1.tg[0].tr";
connectAttr "root_pos_loc.ro" "thumbFinger_group_2_parentConstraint1.tg[0].tro";
connectAttr "root_pos_loc.s" "thumbFinger_group_2_parentConstraint1.tg[0].ts";
connectAttr "root_pos_loc.pm" "thumbFinger_group_2_parentConstraint1.tg[0].tpm";
connectAttr "thumbFinger_group_2_parentConstraint1.w0" "thumbFinger_group_2_parentConstraint1.tg[0].tw"
		;
connectAttr "indexFinger_1_loc_parentConstraint1.ctx" "indexFinger_1_loc.tx";
connectAttr "indexFinger_1_loc_parentConstraint1.cty" "indexFinger_1_loc.ty";
connectAttr "indexFinger_1_loc_parentConstraint1.ctz" "indexFinger_1_loc.tz";
connectAttr "indexFinger_1_loc_parentConstraint1.crx" "indexFinger_1_loc.rx";
connectAttr "indexFinger_1_loc_parentConstraint1.cry" "indexFinger_1_loc.ry";
connectAttr "indexFinger_1_loc_parentConstraint1.crz" "indexFinger_1_loc.rz";
connectAttr "multMatrix12.o" "indexFinger_1_group_3.opm";
connectAttr "indexFinger_2_group_decMat.otx" "indexFinger_2_group.tx";
connectAttr "indexFinger_2_group_decMat.oty" "indexFinger_2_group.ty";
connectAttr "indexFinger_2_group_decMat.otz" "indexFinger_2_group.tz";
connectAttr "indexFinger_2_group_decMat.orx" "indexFinger_2_group.rx";
connectAttr "indexFinger_2_group_decMat.ory" "indexFinger_2_group.ry";
connectAttr "indexFinger_2_group_decMat.orz" "indexFinger_2_group.rz";
connectAttr "indexFinger_2_group_decMat.osx" "indexFinger_2_group.sx";
connectAttr "indexFinger_2_group_decMat.osy" "indexFinger_2_group.sy";
connectAttr "indexFinger_2_group_decMat.osz" "indexFinger_2_group.sz";
connectAttr "mainPoser.closed" "indexFinger_2_closedShape.v";
connectAttr "decomposeMatrix1.orz" "indexFinger_2_group_2.rz";
connectAttr "decomposeMatrix1.orx" "indexFinger_2_group_2.rx";
connectAttr "decomposeMatrix1.ory" "indexFinger_2_group_2.ry";
connectAttr "decomposeMatrix1.otx" "indexFinger_2_group_2.tx";
connectAttr "decomposeMatrix1.oty" "indexFinger_2_group_2.ty";
connectAttr "decomposeMatrix1.otz" "indexFinger_2_group_2.tz";
connectAttr "decomposeMatrix1.osx" "indexFinger_2_group_2.sx";
connectAttr "decomposeMatrix1.osy" "indexFinger_2_group_2.sy";
connectAttr "decomposeMatrix1.osz" "indexFinger_2_group_2.sz";
connectAttr "indexFinger_3_group_decMat.otx" "indexFinger_3_group.tx";
connectAttr "indexFinger_3_group_decMat.oty" "indexFinger_3_group.ty";
connectAttr "indexFinger_3_group_decMat.otz" "indexFinger_3_group.tz";
connectAttr "indexFinger_3_group_decMat.orx" "indexFinger_3_group.rx";
connectAttr "indexFinger_3_group_decMat.ory" "indexFinger_3_group.ry";
connectAttr "indexFinger_3_group_decMat.orz" "indexFinger_3_group.rz";
connectAttr "indexFinger_3_group_decMat.osx" "indexFinger_3_group.sx";
connectAttr "indexFinger_3_group_decMat.osy" "indexFinger_3_group.sy";
connectAttr "indexFinger_3_group_decMat.osz" "indexFinger_3_group.sz";
connectAttr "mainPoser.closed" "indexFinger_3_closedShape.v";
connectAttr "decomposeMatrix3.orz" "indexFinger_3_group_2.rz";
connectAttr "decomposeMatrix3.orx" "indexFinger_3_group_2.rx";
connectAttr "decomposeMatrix3.ory" "indexFinger_3_group_2.ry";
connectAttr "decomposeMatrix3.otx" "indexFinger_3_group_2.tx";
connectAttr "decomposeMatrix3.oty" "indexFinger_3_group_2.ty";
connectAttr "decomposeMatrix3.otz" "indexFinger_3_group_2.tz";
connectAttr "decomposeMatrix3.osx" "indexFinger_3_group_2.sx";
connectAttr "decomposeMatrix3.osy" "indexFinger_3_group_2.sy";
connectAttr "decomposeMatrix3.osz" "indexFinger_3_group_2.sz";
connectAttr "reverse4.ox" "indexFinger_3Shape.v";
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.ctx" "indexFinger_ik_parentSwitcher_group.tx"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.cty" "indexFinger_ik_parentSwitcher_group.ty"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.ctz" "indexFinger_ik_parentSwitcher_group.tz"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.crx" "indexFinger_ik_parentSwitcher_group.rx"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.cry" "indexFinger_ik_parentSwitcher_group.ry"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.crz" "indexFinger_ik_parentSwitcher_group.rz"
		;
connectAttr "decomposeMatrix21.ot" "indexFinger_ik.rp";
connectAttr "indexFinger_1_ikJoint.msg" "ikHandle1.hsj";
connectAttr "effector1.hp" "ikHandle1.hee";
connectAttr "ikSCsolver.msg" "ikHandle1.hsv";
connectAttr "indexFinger_3_ikJoint.msg" "ikHandle6.hsj";
connectAttr "effector6.hp" "ikHandle6.hee";
connectAttr "ikSCsolver.msg" "ikHandle6.hsv";
connectAttr "fingersBend.IndexIk" "indexFinger_ikShape.v";
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1_indexFinger_3__indexFinger_ik__parentSwitcherTargetW0.o" "indexFinger_ik_parentSwitcher_group_parentConstraint1.w0"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__indexFinger_ik__parentSwitcherTargetW1.o" "indexFinger_ik_parentSwitcher_group_parentConstraint1.w1"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1_mod__indexFinger_ik__parentSwitcherTargetW2.o" "indexFinger_ik_parentSwitcher_group_parentConstraint1.w2"
		;
connectAttr "indexFinger_ik_parentSwitcher_group.ro" "indexFinger_ik_parentSwitcher_group_parentConstraint1.cro"
		;
connectAttr "indexFinger_ik_parentSwitcher_group.pim" "indexFinger_ik_parentSwitcher_group_parentConstraint1.cpim"
		;
connectAttr "indexFinger_ik_parentSwitcher_group.rp" "indexFinger_ik_parentSwitcher_group_parentConstraint1.crp"
		;
connectAttr "indexFinger_ik_parentSwitcher_group.rpt" "indexFinger_ik_parentSwitcher_group_parentConstraint1.crt"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.t" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tt"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.rp" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trp"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.rpt" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trt"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.r" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tr"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.ro" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tro"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.s" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].ts"
		;
connectAttr "indexFinger_3__indexFinger_ik__parentSwitcherTarget.pm" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tpm"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.w0" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tw"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.t" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tt"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.rp" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trp"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.rpt" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trt"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.r" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tr"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.ro" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tro"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.s" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].ts"
		;
connectAttr "root_connector__indexFinger_ik__parentSwitcherTarget.pm" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tpm"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.t" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tt"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.rp" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trp"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.rpt" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trt"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.r" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tr"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.ro" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tro"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.s" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].ts"
		;
connectAttr "mod__indexFinger_ik__parentSwitcherTarget.pm" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tpm"
		;
connectAttr "indexFinger_ik_parentSwitcher_group_parentConstraint1.w2" "indexFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tw"
		;
connectAttr "reverse4.ox" "indexFinger_2Shape.v";
connectAttr "reverse4.ox" "indexFinger_1Shape.v";
connectAttr "indexFinger_1_ikJoint.s" "indexFinger_2_ikJoint.is";
connectAttr "indexFinger_2_group_decMat.otx" "indexFinger_2_ikJoint.tx";
connectAttr "indexFinger_2_ikJoint.s" "indexFinger_3_ikJoint.is";
connectAttr "indexFinger_3_group_decMat.otx" "indexFinger_3_ikJoint.tx";
connectAttr "indexFinger_3_ikJoint.s" "indexFinger_end_ikJoint.is";
connectAttr "indexFinger_end_ikJoint.tx" "effector6.tx";
connectAttr "indexFinger_end_ikJoint.ty" "effector6.ty";
connectAttr "indexFinger_end_ikJoint.tz" "effector6.tz";
connectAttr "indexFinger_end_ikJoint.opm" "effector6.opm";
connectAttr "indexFinger_3_ikJoint.tx" "effector1.tx";
connectAttr "indexFinger_3_ikJoint.ty" "effector1.ty";
connectAttr "indexFinger_3_ikJoint.tz" "effector1.tz";
connectAttr "indexFinger_3_ikJoint.opm" "effector1.opm";
connectAttr "indexFinger_1_loc.ro" "indexFinger_1_loc_parentConstraint1.cro";
connectAttr "indexFinger_1_loc.pim" "indexFinger_1_loc_parentConstraint1.cpim";
connectAttr "indexFinger_1_loc.rp" "indexFinger_1_loc_parentConstraint1.crp";
connectAttr "indexFinger_1_loc.rpt" "indexFinger_1_loc_parentConstraint1.crt";
connectAttr "indexFinger_init.t" "indexFinger_1_loc_parentConstraint1.tg[0].tt";
connectAttr "indexFinger_init.rp" "indexFinger_1_loc_parentConstraint1.tg[0].trp"
		;
connectAttr "indexFinger_init.rpt" "indexFinger_1_loc_parentConstraint1.tg[0].trt"
		;
connectAttr "indexFinger_init.r" "indexFinger_1_loc_parentConstraint1.tg[0].tr";
connectAttr "indexFinger_init.ro" "indexFinger_1_loc_parentConstraint1.tg[0].tro"
		;
connectAttr "indexFinger_init.s" "indexFinger_1_loc_parentConstraint1.tg[0].ts";
connectAttr "indexFinger_init.pm" "indexFinger_1_loc_parentConstraint1.tg[0].tpm"
		;
connectAttr "indexFinger_1_loc_parentConstraint1.w0" "indexFinger_1_loc_parentConstraint1.tg[0].tw"
		;
connectAttr "indexFinger_bend_target.t" "indexFinger_1_loc_parentConstraint1.tg[1].tt"
		;
connectAttr "indexFinger_bend_target.rp" "indexFinger_1_loc_parentConstraint1.tg[1].trp"
		;
connectAttr "indexFinger_bend_target.rpt" "indexFinger_1_loc_parentConstraint1.tg[1].trt"
		;
connectAttr "indexFinger_bend_target.r" "indexFinger_1_loc_parentConstraint1.tg[1].tr"
		;
connectAttr "indexFinger_bend_target.ro" "indexFinger_1_loc_parentConstraint1.tg[1].tro"
		;
connectAttr "indexFinger_bend_target.s" "indexFinger_1_loc_parentConstraint1.tg[1].ts"
		;
connectAttr "indexFinger_bend_target.pm" "indexFinger_1_loc_parentConstraint1.tg[1].tpm"
		;
connectAttr "indexFinger_1_loc_parentConstraint1.w1" "indexFinger_1_loc_parentConstraint1.tg[1].tw"
		;
connectAttr "mainPoser.closed" "indexFinger_1_closedShape.v";
connectAttr "mainPoser.spread" "indexFinger_1_spreadShape.v";
connectAttr "locator7_parentConstraint1.ctx" "ringFinger_1_loc.tx";
connectAttr "locator7_parentConstraint1.cty" "ringFinger_1_loc.ty";
connectAttr "locator7_parentConstraint1.ctz" "ringFinger_1_loc.tz";
connectAttr "locator7_parentConstraint1.crx" "ringFinger_1_loc.rx";
connectAttr "locator7_parentConstraint1.cry" "ringFinger_1_loc.ry";
connectAttr "locator7_parentConstraint1.crz" "ringFinger_1_loc.rz";
connectAttr "multMatrix8.o" "ringFinger_1_group_3.opm";
connectAttr "ringFinger_2_group_decMat.otx" "ringFinger_2_group.tx";
connectAttr "ringFinger_2_group_decMat.oty" "ringFinger_2_group.ty";
connectAttr "ringFinger_2_group_decMat.otz" "ringFinger_2_group.tz";
connectAttr "ringFinger_2_group_decMat.orx" "ringFinger_2_group.rx";
connectAttr "ringFinger_2_group_decMat.ory" "ringFinger_2_group.ry";
connectAttr "ringFinger_2_group_decMat.orz" "ringFinger_2_group.rz";
connectAttr "ringFinger_2_group_decMat.osx" "ringFinger_2_group.sx";
connectAttr "ringFinger_2_group_decMat.osy" "ringFinger_2_group.sy";
connectAttr "ringFinger_2_group_decMat.osz" "ringFinger_2_group.sz";
connectAttr "mainPoser.closed" "ringFinger_2_closedShape.v";
connectAttr "decomposeMatrix9.orz" "ringFinger_2_group_2.rz";
connectAttr "decomposeMatrix9.orx" "ringFinger_2_group_2.rx";
connectAttr "decomposeMatrix9.ory" "ringFinger_2_group_2.ry";
connectAttr "decomposeMatrix9.otx" "ringFinger_2_group_2.tx";
connectAttr "decomposeMatrix9.oty" "ringFinger_2_group_2.ty";
connectAttr "decomposeMatrix9.otz" "ringFinger_2_group_2.tz";
connectAttr "decomposeMatrix9.osx" "ringFinger_2_group_2.sx";
connectAttr "decomposeMatrix9.osy" "ringFinger_2_group_2.sy";
connectAttr "decomposeMatrix9.osz" "ringFinger_2_group_2.sz";
connectAttr "ringFinger_3_group_decMat.otx" "ringFinger_3_group.tx";
connectAttr "ringFinger_3_group_decMat.oty" "ringFinger_3_group.ty";
connectAttr "ringFinger_3_group_decMat.otz" "ringFinger_3_group.tz";
connectAttr "ringFinger_3_group_decMat.orx" "ringFinger_3_group.rx";
connectAttr "ringFinger_3_group_decMat.ory" "ringFinger_3_group.ry";
connectAttr "ringFinger_3_group_decMat.orz" "ringFinger_3_group.rz";
connectAttr "ringFinger_3_group_decMat.osx" "ringFinger_3_group.sx";
connectAttr "ringFinger_3_group_decMat.osy" "ringFinger_3_group.sy";
connectAttr "ringFinger_3_group_decMat.osz" "ringFinger_3_group.sz";
connectAttr "mainPoser.closed" "ringFinger_3_closedShape.v";
connectAttr "decomposeMatrix7.orz" "ringFinger_3_group_2.rz";
connectAttr "decomposeMatrix7.orx" "ringFinger_3_group_2.rx";
connectAttr "decomposeMatrix7.ory" "ringFinger_3_group_2.ry";
connectAttr "decomposeMatrix7.otx" "ringFinger_3_group_2.tx";
connectAttr "decomposeMatrix7.oty" "ringFinger_3_group_2.ty";
connectAttr "decomposeMatrix7.otz" "ringFinger_3_group_2.tz";
connectAttr "decomposeMatrix7.osx" "ringFinger_3_group_2.sx";
connectAttr "decomposeMatrix7.osy" "ringFinger_3_group_2.sy";
connectAttr "decomposeMatrix7.osz" "ringFinger_3_group_2.sz";
connectAttr "reverse5.ox" "ringFinger_3Shape.v";
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.ctx" "ringFinger_ik_parentSwitcher_group.tx"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.cty" "ringFinger_ik_parentSwitcher_group.ty"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.ctz" "ringFinger_ik_parentSwitcher_group.tz"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.crx" "ringFinger_ik_parentSwitcher_group.rx"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.cry" "ringFinger_ik_parentSwitcher_group.ry"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.crz" "ringFinger_ik_parentSwitcher_group.rz"
		;
connectAttr "decomposeMatrix23.ot" "ringFinger_ik.rp";
connectAttr "fingersBend.ringIk" "ringFinger_ikShape.v";
connectAttr "ringFinger_1_ikJoint.msg" "ikHandle8.hsj";
connectAttr "effector8.hp" "ikHandle8.hee";
connectAttr "ikSCsolver.msg" "ikHandle8.hsv";
connectAttr "ringFinger_3_ikJoint.msg" "ikHandle9.hsj";
connectAttr "effector9.hp" "ikHandle9.hee";
connectAttr "ikSCsolver.msg" "ikHandle9.hsv";
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1_ringFinger_3__ringFinger_ik__parentSwitcherTargetW0.o" "ringFinger_ik_parentSwitcher_group_parentConstraint1.w0"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__ringFinger_ik__parentSwitcherTargetW1.o" "ringFinger_ik_parentSwitcher_group_parentConstraint1.w1"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1_mod__ringFinger_ik__parentSwitcherTargetW2.o" "ringFinger_ik_parentSwitcher_group_parentConstraint1.w2"
		;
connectAttr "ringFinger_ik_parentSwitcher_group.ro" "ringFinger_ik_parentSwitcher_group_parentConstraint1.cro"
		;
connectAttr "ringFinger_ik_parentSwitcher_group.pim" "ringFinger_ik_parentSwitcher_group_parentConstraint1.cpim"
		;
connectAttr "ringFinger_ik_parentSwitcher_group.rp" "ringFinger_ik_parentSwitcher_group_parentConstraint1.crp"
		;
connectAttr "ringFinger_ik_parentSwitcher_group.rpt" "ringFinger_ik_parentSwitcher_group_parentConstraint1.crt"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.t" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tt"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.rp" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trp"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.rpt" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trt"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.r" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tr"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.ro" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tro"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.s" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].ts"
		;
connectAttr "ringFinger_3__ringFinger_ik__parentSwitcherTarget.pm" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tpm"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.w0" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tw"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.t" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tt"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.rp" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trp"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.rpt" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trt"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.r" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tr"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.ro" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tro"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.s" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].ts"
		;
connectAttr "root_connector__ringFinger_ik__parentSwitcherTarget.pm" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tpm"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.w1" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tw"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.t" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tt"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.rp" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trp"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.rpt" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trt"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.r" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tr"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.ro" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tro"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.s" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].ts"
		;
connectAttr "mod__ringFinger_ik__parentSwitcherTarget.pm" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tpm"
		;
connectAttr "ringFinger_ik_parentSwitcher_group_parentConstraint1.w2" "ringFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tw"
		;
connectAttr "reverse5.ox" "ringFinger_2Shape.v";
connectAttr "reverse5.ox" "ringFinger_1Shape.v";
connectAttr "ringFinger_1_ikJoint.s" "ringFinger_2_ikJoint.is";
connectAttr "ringFinger_2_group_decMat.otx" "ringFinger_2_ikJoint.tx";
connectAttr "ringFinger_2_ikJoint.s" "ringFinger_3_ikJoint.is";
connectAttr "ringFinger_3_group_decMat.otx" "ringFinger_3_ikJoint.tx";
connectAttr "ringFinger_3_ikJoint.s" "ringFinger_end_ikJoint.is";
connectAttr "ringFinger_end_ikJoint.tx" "effector9.tx";
connectAttr "ringFinger_end_ikJoint.ty" "effector9.ty";
connectAttr "ringFinger_end_ikJoint.tz" "effector9.tz";
connectAttr "ringFinger_end_ikJoint.opm" "effector9.opm";
connectAttr "ringFinger_3_ikJoint.tx" "effector8.tx";
connectAttr "ringFinger_3_ikJoint.ty" "effector8.ty";
connectAttr "ringFinger_3_ikJoint.tz" "effector8.tz";
connectAttr "ringFinger_3_ikJoint.opm" "effector8.opm";
connectAttr "ringFinger_1_loc.ro" "locator7_parentConstraint1.cro";
connectAttr "ringFinger_1_loc.pim" "locator7_parentConstraint1.cpim";
connectAttr "ringFinger_1_loc.rp" "locator7_parentConstraint1.crp";
connectAttr "ringFinger_1_loc.rpt" "locator7_parentConstraint1.crt";
connectAttr "ringFinger_bend_target.t" "locator7_parentConstraint1.tg[0].tt";
connectAttr "ringFinger_bend_target.rp" "locator7_parentConstraint1.tg[0].trp";
connectAttr "ringFinger_bend_target.rpt" "locator7_parentConstraint1.tg[0].trt";
connectAttr "ringFinger_bend_target.r" "locator7_parentConstraint1.tg[0].tr";
connectAttr "ringFinger_bend_target.ro" "locator7_parentConstraint1.tg[0].tro";
connectAttr "ringFinger_bend_target.s" "locator7_parentConstraint1.tg[0].ts";
connectAttr "ringFinger_bend_target.pm" "locator7_parentConstraint1.tg[0].tpm";
connectAttr "locator7_parentConstraint1.w0" "locator7_parentConstraint1.tg[0].tw"
		;
connectAttr "ringFinger_init.t" "locator7_parentConstraint1.tg[1].tt";
connectAttr "ringFinger_init.rp" "locator7_parentConstraint1.tg[1].trp";
connectAttr "ringFinger_init.rpt" "locator7_parentConstraint1.tg[1].trt";
connectAttr "ringFinger_init.r" "locator7_parentConstraint1.tg[1].tr";
connectAttr "ringFinger_init.ro" "locator7_parentConstraint1.tg[1].tro";
connectAttr "ringFinger_init.s" "locator7_parentConstraint1.tg[1].ts";
connectAttr "ringFinger_init.pm" "locator7_parentConstraint1.tg[1].tpm";
connectAttr "locator7_parentConstraint1.w1" "locator7_parentConstraint1.tg[1].tw"
		;
connectAttr "mainPoser.closed" "ringFinger_1_closedShape.v";
connectAttr "mainPoser.spread" "ringFinger_1_spreadShape.v";
connectAttr "multMatrix51.o" "pinkyFinger_1_loc.opm";
connectAttr "multMatrix7.o" "pinkyFinger_1_group_3.opm";
connectAttr "pinkyFinger_2_group_decMat.otx" "pinkyFinger_2_group.tx";
connectAttr "pinkyFinger_2_group_decMat.oty" "pinkyFinger_2_group.ty";
connectAttr "pinkyFinger_2_group_decMat.otz" "pinkyFinger_2_group.tz";
connectAttr "pinkyFinger_2_group_decMat.orx" "pinkyFinger_2_group.rx";
connectAttr "pinkyFinger_2_group_decMat.ory" "pinkyFinger_2_group.ry";
connectAttr "pinkyFinger_2_group_decMat.orz" "pinkyFinger_2_group.rz";
connectAttr "pinkyFinger_2_group_decMat.osx" "pinkyFinger_2_group.sx";
connectAttr "pinkyFinger_2_group_decMat.osy" "pinkyFinger_2_group.sy";
connectAttr "pinkyFinger_2_group_decMat.osz" "pinkyFinger_2_group.sz";
connectAttr "mainPoser.closed" "pinkyFinger_2_closedShape.v";
connectAttr "decomposeMatrix11.orz" "pinkyFinger_2_group_2.rz";
connectAttr "decomposeMatrix11.orx" "pinkyFinger_2_group_2.rx";
connectAttr "decomposeMatrix11.ory" "pinkyFinger_2_group_2.ry";
connectAttr "decomposeMatrix11.otx" "pinkyFinger_2_group_2.tx";
connectAttr "decomposeMatrix11.oty" "pinkyFinger_2_group_2.ty";
connectAttr "decomposeMatrix11.otz" "pinkyFinger_2_group_2.tz";
connectAttr "decomposeMatrix11.osx" "pinkyFinger_2_group_2.sx";
connectAttr "decomposeMatrix11.osy" "pinkyFinger_2_group_2.sy";
connectAttr "decomposeMatrix11.osz" "pinkyFinger_2_group_2.sz";
connectAttr "pinkyFinger_3_group_decMat.otx" "pinkyFinger_3_group.tx";
connectAttr "pinkyFinger_3_group_decMat.oty" "pinkyFinger_3_group.ty";
connectAttr "pinkyFinger_3_group_decMat.otz" "pinkyFinger_3_group.tz";
connectAttr "pinkyFinger_3_group_decMat.orx" "pinkyFinger_3_group.rx";
connectAttr "pinkyFinger_3_group_decMat.ory" "pinkyFinger_3_group.ry";
connectAttr "pinkyFinger_3_group_decMat.orz" "pinkyFinger_3_group.rz";
connectAttr "pinkyFinger_3_group_decMat.osx" "pinkyFinger_3_group.sx";
connectAttr "pinkyFinger_3_group_decMat.osy" "pinkyFinger_3_group.sy";
connectAttr "pinkyFinger_3_group_decMat.osz" "pinkyFinger_3_group.sz";
connectAttr "mainPoser.closed" "pinkyFinger_3_closedShape.v";
connectAttr "decomposeMatrix10.orz" "pinkyFinger_3_group_2.rz";
connectAttr "decomposeMatrix10.orx" "pinkyFinger_3_group_2.rx";
connectAttr "decomposeMatrix10.ory" "pinkyFinger_3_group_2.ry";
connectAttr "decomposeMatrix10.otx" "pinkyFinger_3_group_2.tx";
connectAttr "decomposeMatrix10.oty" "pinkyFinger_3_group_2.ty";
connectAttr "decomposeMatrix10.otz" "pinkyFinger_3_group_2.tz";
connectAttr "decomposeMatrix10.osx" "pinkyFinger_3_group_2.sx";
connectAttr "decomposeMatrix10.osy" "pinkyFinger_3_group_2.sy";
connectAttr "decomposeMatrix10.osz" "pinkyFinger_3_group_2.sz";
connectAttr "reverse5.oy" "pinkyFinger_3Shape.v";
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.ctx" "pinkyFinger_ik_parentSwitcher_group.tx"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.cty" "pinkyFinger_ik_parentSwitcher_group.ty"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.ctz" "pinkyFinger_ik_parentSwitcher_group.tz"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.crx" "pinkyFinger_ik_parentSwitcher_group.rx"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.cry" "pinkyFinger_ik_parentSwitcher_group.ry"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.crz" "pinkyFinger_ik_parentSwitcher_group.rz"
		;
connectAttr "decomposeMatrix24.ot" "pinkyFinger_ik.rp";
connectAttr "fingersBend.pinkyIk" "pinkyFinger_ikShape.v";
connectAttr "pinkyFinger_1_ikJoint.msg" "ikHandle10.hsj";
connectAttr "effector10.hp" "ikHandle10.hee";
connectAttr "ikSCsolver.msg" "ikHandle10.hsv";
connectAttr "pinkyFinger_3_ikJoint.msg" "ikHandle11.hsj";
connectAttr "effector11.hp" "ikHandle11.hee";
connectAttr "ikSCsolver.msg" "ikHandle11.hsv";
connectAttr "pinkyFinger_ik_parentSwitcher_group.ro" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.cro"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group.pim" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.cpim"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group.rp" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.crp"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group.rpt" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.crt"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.t" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tt"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.rp" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trp"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.rpt" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trt"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.r" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tr"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.ro" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tro"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.s" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].ts"
		;
connectAttr "pinkyFinger_3__pinkyFinger_ik__parentSwitcherTarget.pm" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.w0" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tw"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.t" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tt"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.rp" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trp"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.rpt" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trt"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.r" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tr"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.ro" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tro"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.s" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].ts"
		;
connectAttr "root_connector__pinkyFinger_ik__parentSwitcherTarget.pm" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tpm"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.w1" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tw"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.t" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tt"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.rp" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trp"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.rpt" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trt"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.r" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tr"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.ro" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tro"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.s" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].ts"
		;
connectAttr "mod__pinkyFinger_ik__parentSwitcherTarget.pm" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tpm"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.w2" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tw"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_pinkyFinger_3__pinkyFinger_ik__parentSwitcherTargetW0.o" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.w0"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__pinkyFinger_ik__parentSwitcherTargetW1.o" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.w1"
		;
connectAttr "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_mod__pinkyFinger_ik__parentSwitcherTargetW2.o" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1.w2"
		;
connectAttr "reverse5.oy" "pinkyFinger_2Shape.v";
connectAttr "reverse5.oy" "pinkyFinger_1Shape.v";
connectAttr "pinkyFinger_1_ikJoint.s" "pinkyFinger_2_ikJoint.is";
connectAttr "pinkyFinger_2_group_decMat.otx" "pinkyFinger_2_ikJoint.tx";
connectAttr "pinkyFinger_2_ikJoint.s" "pinkyFinger_3_ikJoint.is";
connectAttr "pinkyFinger_3_group_decMat.otx" "pinkyFinger_3_ikJoint.tx";
connectAttr "pinkyFinger_3_ikJoint.s" "pinkyFinger_end_ikJoint.is";
connectAttr "pinkyFinger_end_ikJoint.tx" "effector11.tx";
connectAttr "pinkyFinger_end_ikJoint.ty" "effector11.ty";
connectAttr "pinkyFinger_end_ikJoint.tz" "effector11.tz";
connectAttr "pinkyFinger_end_ikJoint.opm" "effector11.opm";
connectAttr "pinkyFinger_3_ikJoint.tx" "effector10.tx";
connectAttr "pinkyFinger_3_ikJoint.ty" "effector10.ty";
connectAttr "pinkyFinger_3_ikJoint.tz" "effector10.tz";
connectAttr "pinkyFinger_3_ikJoint.opm" "effector10.opm";
connectAttr "mainPoser.closed" "pinkyFinger_1_closedShape.v";
connectAttr "mainPoser.spread" "pinkyFinger_1_spreadShape.v";
connectAttr "multMatrix38.o" "indexFinger_init.opm";
connectAttr "multMatrix39.o" "middleFinger_init.opm";
connectAttr "multMatrix14.o" "middleFinger_1_group_3.opm";
connectAttr "middleFinger_2_group_decMat.otx" "middleFinger_2_group.tx";
connectAttr "middleFinger_2_group_decMat.oty" "middleFinger_2_group.ty";
connectAttr "middleFinger_2_group_decMat.otz" "middleFinger_2_group.tz";
connectAttr "middleFinger_2_group_decMat.orx" "middleFinger_2_group.rx";
connectAttr "middleFinger_2_group_decMat.ory" "middleFinger_2_group.ry";
connectAttr "middleFinger_2_group_decMat.orz" "middleFinger_2_group.rz";
connectAttr "middleFinger_2_group_decMat.osx" "middleFinger_2_group.sx";
connectAttr "middleFinger_2_group_decMat.osy" "middleFinger_2_group.sy";
connectAttr "middleFinger_2_group_decMat.osz" "middleFinger_2_group.sz";
connectAttr "mainPoser.closed" "middleFinger_2_closedShape.v";
connectAttr "decomposeMatrix4.orz" "middleFinger_2_group_2.rz";
connectAttr "decomposeMatrix4.orx" "middleFinger_2_group_2.rx";
connectAttr "decomposeMatrix4.ory" "middleFinger_2_group_2.ry";
connectAttr "decomposeMatrix4.otx" "middleFinger_2_group_2.tx";
connectAttr "decomposeMatrix4.oty" "middleFinger_2_group_2.ty";
connectAttr "decomposeMatrix4.otz" "middleFinger_2_group_2.tz";
connectAttr "decomposeMatrix4.osx" "middleFinger_2_group_2.sx";
connectAttr "decomposeMatrix4.osy" "middleFinger_2_group_2.sy";
connectAttr "decomposeMatrix4.osz" "middleFinger_2_group_2.sz";
connectAttr "middleFinger_3_group_decMat.otx" "middleFinger_3_group.tx";
connectAttr "middleFinger_3_group_decMat.oty" "middleFinger_3_group.ty";
connectAttr "middleFinger_3_group_decMat.otz" "middleFinger_3_group.tz";
connectAttr "middleFinger_3_group_decMat.orx" "middleFinger_3_group.rx";
connectAttr "middleFinger_3_group_decMat.ory" "middleFinger_3_group.ry";
connectAttr "middleFinger_3_group_decMat.orz" "middleFinger_3_group.rz";
connectAttr "middleFinger_3_group_decMat.osx" "middleFinger_3_group.sx";
connectAttr "middleFinger_3_group_decMat.osy" "middleFinger_3_group.sy";
connectAttr "middleFinger_3_group_decMat.osz" "middleFinger_3_group.sz";
connectAttr "mainPoser.closed" "middleFinger_3_closedShape.v";
connectAttr "decomposeMatrix5.orz" "middleFinger_3_group_2.rz";
connectAttr "decomposeMatrix5.orx" "middleFinger_3_group_2.rx";
connectAttr "decomposeMatrix5.ory" "middleFinger_3_group_2.ry";
connectAttr "decomposeMatrix5.otx" "middleFinger_3_group_2.tx";
connectAttr "decomposeMatrix5.oty" "middleFinger_3_group_2.ty";
connectAttr "decomposeMatrix5.otz" "middleFinger_3_group_2.tz";
connectAttr "decomposeMatrix5.osx" "middleFinger_3_group_2.sx";
connectAttr "decomposeMatrix5.osy" "middleFinger_3_group_2.sy";
connectAttr "decomposeMatrix5.osz" "middleFinger_3_group_2.sz";
connectAttr "reverse4.oz" "middleFinger_3Shape.v";
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.ctx" "middleFinger_ik_parentSwitcher_group.tx"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.cty" "middleFinger_ik_parentSwitcher_group.ty"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.ctz" "middleFinger_ik_parentSwitcher_group.tz"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.crx" "middleFinger_ik_parentSwitcher_group.rx"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.cry" "middleFinger_ik_parentSwitcher_group.ry"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.crz" "middleFinger_ik_parentSwitcher_group.rz"
		;
connectAttr "decomposeMatrix22.ot" "middleFinger_ik.rp";
connectAttr "fingersBend.middleIk" "middleFinger_ikShape.v";
connectAttr "middleFinger_1_ikJoint.msg" "ikHandle4.hsj";
connectAttr "effector4.hp" "ikHandle4.hee";
connectAttr "ikSCsolver.msg" "ikHandle4.hsv";
connectAttr "middleFinger_3_ikJoint.msg" "ikHandle7.hsj";
connectAttr "effector7.hp" "ikHandle7.hee";
connectAttr "ikSCsolver.msg" "ikHandle7.hsv";
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1_middleFinger_3__middleFinger_ik__parentSwitcherTargetW0.o" "middleFinger_ik_parentSwitcher_group_parentConstraint1.w0"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__middleFinger_ik__parentSwitcherTargetW1.o" "middleFinger_ik_parentSwitcher_group_parentConstraint1.w1"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1_mod__middleFinger_ik__parentSwitcherTargetW2.o" "middleFinger_ik_parentSwitcher_group_parentConstraint1.w2"
		;
connectAttr "middleFinger_ik_parentSwitcher_group.ro" "middleFinger_ik_parentSwitcher_group_parentConstraint1.cro"
		;
connectAttr "middleFinger_ik_parentSwitcher_group.pim" "middleFinger_ik_parentSwitcher_group_parentConstraint1.cpim"
		;
connectAttr "middleFinger_ik_parentSwitcher_group.rp" "middleFinger_ik_parentSwitcher_group_parentConstraint1.crp"
		;
connectAttr "middleFinger_ik_parentSwitcher_group.rpt" "middleFinger_ik_parentSwitcher_group_parentConstraint1.crt"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.t" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tt"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.rp" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trp"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.rpt" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].trt"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.r" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tr"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.ro" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tro"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.s" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].ts"
		;
connectAttr "middleFinger_3__middleFinger_ik__parentSwitcherTarget.pm" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tpm"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.w0" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[0].tw"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.t" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tt"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.rp" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trp"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.rpt" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].trt"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.r" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tr"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.ro" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tro"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.s" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].ts"
		;
connectAttr "root_connector__middleFinger_ik__parentSwitcherTarget.pm" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tpm"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.w1" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[1].tw"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.t" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tt"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.rp" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trp"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.rpt" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].trt"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.r" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tr"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.ro" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tro"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.s" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].ts"
		;
connectAttr "mod__middleFinger_ik__parentSwitcherTarget.pm" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tpm"
		;
connectAttr "middleFinger_ik_parentSwitcher_group_parentConstraint1.w2" "middleFinger_ik_parentSwitcher_group_parentConstraint1.tg[2].tw"
		;
connectAttr "reverse4.oz" "middleFinger_2Shape.v";
connectAttr "reverse4.oz" "middleFinger_1Shape.v";
connectAttr "middleFinger_1_ikJoint.s" "middleFinger_2_ikJoint.is";
connectAttr "middleFinger_2_group_decMat.otx" "middleFinger_2_ikJoint.tx";
connectAttr "middleFinger_3_ikJoint_orientConstraint1.crx" "middleFinger_3_ikJoint.rx"
		;
connectAttr "middleFinger_3_ikJoint_orientConstraint1.cry" "middleFinger_3_ikJoint.ry"
		;
connectAttr "middleFinger_3_ikJoint_orientConstraint1.crz" "middleFinger_3_ikJoint.rz"
		;
connectAttr "middleFinger_2_ikJoint.s" "middleFinger_3_ikJoint.is";
connectAttr "middleFinger_3_group_decMat.otx" "middleFinger_3_ikJoint.tx";
connectAttr "middleFinger_3_ikJoint.s" "middleFinger_end_ikJoint.is";
connectAttr "middleFinger_3_ikJoint.ro" "middleFinger_3_ikJoint_orientConstraint1.cro"
		;
connectAttr "middleFinger_3_ikJoint.pim" "middleFinger_3_ikJoint_orientConstraint1.cpim"
		;
connectAttr "middleFinger_3_ikJoint.jo" "middleFinger_3_ikJoint_orientConstraint1.cjo"
		;
connectAttr "middleFinger_3_ikJoint.is" "middleFinger_3_ikJoint_orientConstraint1.is"
		;
connectAttr "middleFinger_ik.r" "middleFinger_3_ikJoint_orientConstraint1.tg[0].tr"
		;
connectAttr "middleFinger_ik.ro" "middleFinger_3_ikJoint_orientConstraint1.tg[0].tro"
		;
connectAttr "middleFinger_ik.pm" "middleFinger_3_ikJoint_orientConstraint1.tg[0].tpm"
		;
connectAttr "middleFinger_3_ikJoint_orientConstraint1.w0" "middleFinger_3_ikJoint_orientConstraint1.tg[0].tw"
		;
connectAttr "middleFinger_end_ikJoint.tx" "effector7.tx";
connectAttr "middleFinger_end_ikJoint.ty" "effector7.ty";
connectAttr "middleFinger_end_ikJoint.tz" "effector7.tz";
connectAttr "middleFinger_end_ikJoint.opm" "effector7.opm";
connectAttr "middleFinger_3_ikJoint.tx" "effector4.tx";
connectAttr "middleFinger_3_ikJoint.ty" "effector4.ty";
connectAttr "middleFinger_3_ikJoint.tz" "effector4.tz";
connectAttr "middleFinger_3_ikJoint.opm" "effector4.opm";
connectAttr "mainPoser.closed" "middleFinger_1_closedShape.v";
connectAttr "mainPoser.spread" "middleFinger_1_spreadShape.v";
connectAttr "multMatrix41.o" "ringFinger_init.opm";
connectAttr "multMatrix40.o" "pinkyFinger_init.opm";
connectAttr "root_connector.wm" "system.opm";
connectAttr "multMatrix59.o" "mod__indexFinger_ik__parentSwitcherTarget.opm";
connectAttr "multMatrix64.o" "mod__middleFinger_ik__parentSwitcherTarget.opm";
connectAttr "multMatrix65.o" "mod__ringFinger_ik__parentSwitcherTarget.opm";
connectAttr "multMatrix66.o" "mod__pinkyFinger_ik__parentSwitcherTarget.opm";
connectAttr "multMatrix67.o" "mod__thumbFinger_ik__parentSwitcherTarget.opm";
connectAttr "root_connector_decomposeMatrix.osx" "outJoints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "outJoints.sy";
connectAttr "multDoubleLinear1.o" "outJoints.sz";
connectAttr "root_outJoint_parentConstraint1.ctx" "root_outJoint.tx";
connectAttr "root_outJoint_parentConstraint1.cty" "root_outJoint.ty";
connectAttr "root_outJoint_parentConstraint1.ctz" "root_outJoint.tz";
connectAttr "root_outJoint_parentConstraint1.crx" "root_outJoint.rx";
connectAttr "root_outJoint_parentConstraint1.cry" "root_outJoint.ry";
connectAttr "root_outJoint_parentConstraint1.crz" "root_outJoint.rz";
connectAttr "root_outJoint.s" "thumbFinger_1_outJoint.is";
connectAttr "thumbFinger_1_outJoint_parentConstraint1.crx" "thumbFinger_1_outJoint.rx"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.cry" "thumbFinger_1_outJoint.ry"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.crz" "thumbFinger_1_outJoint.rz"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.ctx" "thumbFinger_1_outJoint.tx"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.cty" "thumbFinger_1_outJoint.ty"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.ctz" "thumbFinger_1_outJoint.tz"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.crx" "thumbFinger_2_outJoint.rx"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.cry" "thumbFinger_2_outJoint.ry"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.crz" "thumbFinger_2_outJoint.rz"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.ctx" "thumbFinger_2_outJoint.tx"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.cty" "thumbFinger_2_outJoint.ty"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.ctz" "thumbFinger_2_outJoint.tz"
		;
connectAttr "thumbFinger_1_outJoint.s" "thumbFinger_2_outJoint.is";
connectAttr "multDoubleLinear28.o" "thumbFinger_2_outJoint.sz";
connectAttr "thumbFinger_3_outJoint_parentConstraint1.ctx" "thumbFinger_3_outJoint.tx"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.cty" "thumbFinger_3_outJoint.ty"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.ctz" "thumbFinger_3_outJoint.tz"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.crx" "thumbFinger_3_outJoint.rx"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.cry" "thumbFinger_3_outJoint.ry"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.crz" "thumbFinger_3_outJoint.rz"
		;
connectAttr "thumbFinger_2_outJoint.s" "thumbFinger_3_outJoint.is";
connectAttr "multDoubleLinear29.o" "thumbFinger_3_outJoint.sz";
connectAttr "thumbFinger_3_outJoint.s" "thumbFinger_end_outJoint.is";
connectAttr "thumbFinger_end_outJoint_decMat.otx" "thumbFinger_end_outJoint.tx";
connectAttr "thumbFinger_end_outJoint_decMat.oty" "thumbFinger_end_outJoint.ty";
connectAttr "thumbFinger_end_outJoint_decMat.otz" "thumbFinger_end_outJoint.tz";
connectAttr "thumbFinger_3_outJoint.ro" "thumbFinger_3_outJoint_parentConstraint1.cro"
		;
connectAttr "thumbFinger_3_outJoint.pim" "thumbFinger_3_outJoint_parentConstraint1.cpim"
		;
connectAttr "thumbFinger_3_outJoint.rp" "thumbFinger_3_outJoint_parentConstraint1.crp"
		;
connectAttr "thumbFinger_3_outJoint.rpt" "thumbFinger_3_outJoint_parentConstraint1.crt"
		;
connectAttr "thumbFinger_3_outJoint.jo" "thumbFinger_3_outJoint_parentConstraint1.cjo"
		;
connectAttr "thumbFinger_3.t" "thumbFinger_3_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "thumbFinger_3.rp" "thumbFinger_3_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "thumbFinger_3.rpt" "thumbFinger_3_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "thumbFinger_3.r" "thumbFinger_3_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "thumbFinger_3.ro" "thumbFinger_3_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "thumbFinger_3.s" "thumbFinger_3_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "thumbFinger_3.pm" "thumbFinger_3_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.w0" "thumbFinger_3_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "thumbFinger_3_ikJoint.t" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "thumbFinger_3_ikJoint.rp" "thumbFinger_3_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "thumbFinger_3_ikJoint.rpt" "thumbFinger_3_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "thumbFinger_3_ikJoint.r" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "thumbFinger_3_ikJoint.ro" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "thumbFinger_3_ikJoint.s" "thumbFinger_3_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "thumbFinger_3_ikJoint.pm" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "thumbFinger_3_ikJoint.jo" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "thumbFinger_3_ikJoint.ssc" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "thumbFinger_3_ikJoint.is" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.w1" "thumbFinger_3_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "reverse2.oy" "thumbFinger_3_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.thumbIk" "thumbFinger_3_outJoint_parentConstraint1.w1";
connectAttr "thumbFinger_2_outJoint.ro" "thumbFinger_2_outJoint_parentConstraint1.cro"
		;
connectAttr "thumbFinger_2_outJoint.pim" "thumbFinger_2_outJoint_parentConstraint1.cpim"
		;
connectAttr "thumbFinger_2_outJoint.rp" "thumbFinger_2_outJoint_parentConstraint1.crp"
		;
connectAttr "thumbFinger_2_outJoint.rpt" "thumbFinger_2_outJoint_parentConstraint1.crt"
		;
connectAttr "thumbFinger_2_outJoint.jo" "thumbFinger_2_outJoint_parentConstraint1.cjo"
		;
connectAttr "thumbFinger_2.t" "thumbFinger_2_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "thumbFinger_2.rp" "thumbFinger_2_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "thumbFinger_2.rpt" "thumbFinger_2_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "thumbFinger_2.r" "thumbFinger_2_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "thumbFinger_2.ro" "thumbFinger_2_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "thumbFinger_2.s" "thumbFinger_2_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "thumbFinger_2.pm" "thumbFinger_2_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.w0" "thumbFinger_2_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "thumbFinger_2_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "thumbFinger_2_ikJoint.t" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "thumbFinger_2_ikJoint.rp" "thumbFinger_2_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "thumbFinger_2_ikJoint.rpt" "thumbFinger_2_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "thumbFinger_2_ikJoint.r" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "thumbFinger_2_ikJoint.ro" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "thumbFinger_2_ikJoint.s" "thumbFinger_2_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "thumbFinger_2_ikJoint.pm" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "thumbFinger_2_ikJoint.jo" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "thumbFinger_2_ikJoint.ssc" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "thumbFinger_2_ikJoint.is" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.w1" "thumbFinger_2_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "thumbFinger_2_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse2.oy" "thumbFinger_2_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.thumbIk" "thumbFinger_2_outJoint_parentConstraint1.w1";
connectAttr "thumbFinger_1_outJoint.ro" "thumbFinger_1_outJoint_parentConstraint1.cro"
		;
connectAttr "thumbFinger_1_outJoint.pim" "thumbFinger_1_outJoint_parentConstraint1.cpim"
		;
connectAttr "thumbFinger_1_outJoint.rp" "thumbFinger_1_outJoint_parentConstraint1.crp"
		;
connectAttr "thumbFinger_1_outJoint.rpt" "thumbFinger_1_outJoint_parentConstraint1.crt"
		;
connectAttr "thumbFinger_1_outJoint.jo" "thumbFinger_1_outJoint_parentConstraint1.cjo"
		;
connectAttr "thumbFinger_1.t" "thumbFinger_1_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "thumbFinger_1.rp" "thumbFinger_1_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "thumbFinger_1.rpt" "thumbFinger_1_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "thumbFinger_1.r" "thumbFinger_1_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "thumbFinger_1.ro" "thumbFinger_1_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "thumbFinger_1.s" "thumbFinger_1_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "thumbFinger_1.pm" "thumbFinger_1_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.w0" "thumbFinger_1_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "thumbFinger_1_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "thumbFinger_1_ikJoint.t" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "thumbFinger_1_ikJoint.rp" "thumbFinger_1_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "thumbFinger_1_ikJoint.rpt" "thumbFinger_1_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "thumbFinger_1_ikJoint.r" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "thumbFinger_1_ikJoint.ro" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "thumbFinger_1_ikJoint.s" "thumbFinger_1_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "thumbFinger_1_ikJoint.pm" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "thumbFinger_1_ikJoint.jo" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "thumbFinger_1_ikJoint.ssc" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "thumbFinger_1_ikJoint.is" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.w1" "thumbFinger_1_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "thumbFinger_1_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse2.oy" "thumbFinger_1_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.thumbIk" "thumbFinger_1_outJoint_parentConstraint1.w1";
connectAttr "indexFingerRoot_outJoint_parentConstraint1.crx" "indexFingerRoot_outJoint.rx"
		;
connectAttr "indexFingerRoot_outJoint_parentConstraint1.cry" "indexFingerRoot_outJoint.ry"
		;
connectAttr "indexFingerRoot_outJoint_parentConstraint1.crz" "indexFingerRoot_outJoint.rz"
		;
connectAttr "root_outJoint.s" "indexFingerRoot_outJoint.is";
connectAttr "indexFingerRoot_outJoint_parentConstraint1.ctx" "indexFingerRoot_outJoint.tx"
		;
connectAttr "indexFingerRoot_outJoint_parentConstraint1.cty" "indexFingerRoot_outJoint.ty"
		;
connectAttr "indexFingerRoot_outJoint_parentConstraint1.ctz" "indexFingerRoot_outJoint.tz"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.crx" "indexFinger_1_outJoint.rx"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.cry" "indexFinger_1_outJoint.ry"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.crz" "indexFinger_1_outJoint.rz"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.ctx" "indexFinger_1_outJoint.tx"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.cty" "indexFinger_1_outJoint.ty"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.ctz" "indexFinger_1_outJoint.tz"
		;
connectAttr "indexFingerRoot_outJoint.s" "indexFinger_1_outJoint.is";
connectAttr "indexFinger_2_outJoint_parentConstraint1.ctx" "indexFinger_2_outJoint.tx"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.cty" "indexFinger_2_outJoint.ty"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.ctz" "indexFinger_2_outJoint.tz"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.crx" "indexFinger_2_outJoint.rx"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.cry" "indexFinger_2_outJoint.ry"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.crz" "indexFinger_2_outJoint.rz"
		;
connectAttr "indexFinger_1_outJoint.s" "indexFinger_2_outJoint.is";
connectAttr "multDoubleLinear35.o" "indexFinger_2_outJoint.sz";
connectAttr "indexFinger_3_outJoint_parentConstraint1.ctx" "indexFinger_3_outJoint.tx"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.cty" "indexFinger_3_outJoint.ty"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.ctz" "indexFinger_3_outJoint.tz"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.crx" "indexFinger_3_outJoint.rx"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.cry" "indexFinger_3_outJoint.ry"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.crz" "indexFinger_3_outJoint.rz"
		;
connectAttr "indexFinger_2_outJoint.s" "indexFinger_3_outJoint.is";
connectAttr "multDoubleLinear40.o" "indexFinger_3_outJoint.sz";
connectAttr "indexFinger_3_outJoint.s" "indexFinger_end_outJoint.is";
connectAttr "indexFinger_end_outJoint_decMat.otx" "indexFinger_end_outJoint.tx";
connectAttr "indexFinger_end_outJoint_decMat.oty" "indexFinger_end_outJoint.ty";
connectAttr "indexFinger_end_outJoint_decMat.otz" "indexFinger_end_outJoint.tz";
connectAttr "indexFinger_3_outJoint.ro" "indexFinger_3_outJoint_parentConstraint1.cro"
		;
connectAttr "indexFinger_3_outJoint.pim" "indexFinger_3_outJoint_parentConstraint1.cpim"
		;
connectAttr "indexFinger_3_outJoint.rp" "indexFinger_3_outJoint_parentConstraint1.crp"
		;
connectAttr "indexFinger_3_outJoint.rpt" "indexFinger_3_outJoint_parentConstraint1.crt"
		;
connectAttr "indexFinger_3_outJoint.jo" "indexFinger_3_outJoint_parentConstraint1.cjo"
		;
connectAttr "indexFinger_3.t" "indexFinger_3_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "indexFinger_3.rp" "indexFinger_3_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "indexFinger_3.rpt" "indexFinger_3_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "indexFinger_3.r" "indexFinger_3_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "indexFinger_3.ro" "indexFinger_3_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "indexFinger_3.s" "indexFinger_3_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "indexFinger_3.pm" "indexFinger_3_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.w0" "indexFinger_3_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "indexFinger_3_ikJoint.t" "indexFinger_3_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "indexFinger_3_ikJoint.rp" "indexFinger_3_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "indexFinger_3_ikJoint.rpt" "indexFinger_3_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "indexFinger_3_ikJoint.r" "indexFinger_3_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "indexFinger_3_ikJoint.ro" "indexFinger_3_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "indexFinger_3_ikJoint.s" "indexFinger_3_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "indexFinger_3_ikJoint.pm" "indexFinger_3_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "indexFinger_3_ikJoint.jo" "indexFinger_3_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "indexFinger_3_ikJoint.ssc" "indexFinger_3_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "indexFinger_3_ikJoint.is" "indexFinger_3_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "indexFinger_3_outJoint_parentConstraint1.w1" "indexFinger_3_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "reverse2.ox" "indexFinger_3_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.IndexIk" "indexFinger_3_outJoint_parentConstraint1.w1";
connectAttr "indexFinger_2_outJoint.ro" "indexFinger_2_outJoint_parentConstraint1.cro"
		;
connectAttr "indexFinger_2_outJoint.pim" "indexFinger_2_outJoint_parentConstraint1.cpim"
		;
connectAttr "indexFinger_2_outJoint.rp" "indexFinger_2_outJoint_parentConstraint1.crp"
		;
connectAttr "indexFinger_2_outJoint.rpt" "indexFinger_2_outJoint_parentConstraint1.crt"
		;
connectAttr "indexFinger_2_outJoint.jo" "indexFinger_2_outJoint_parentConstraint1.cjo"
		;
connectAttr "indexFinger_2.t" "indexFinger_2_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "indexFinger_2.rp" "indexFinger_2_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "indexFinger_2.rpt" "indexFinger_2_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "indexFinger_2.r" "indexFinger_2_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "indexFinger_2.ro" "indexFinger_2_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "indexFinger_2.s" "indexFinger_2_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "indexFinger_2.pm" "indexFinger_2_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.w0" "indexFinger_2_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "indexFinger_2_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "indexFinger_2_ikJoint.t" "indexFinger_2_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "indexFinger_2_ikJoint.rp" "indexFinger_2_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "indexFinger_2_ikJoint.rpt" "indexFinger_2_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "indexFinger_2_ikJoint.r" "indexFinger_2_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "indexFinger_2_ikJoint.ro" "indexFinger_2_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "indexFinger_2_ikJoint.s" "indexFinger_2_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "indexFinger_2_ikJoint.pm" "indexFinger_2_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "indexFinger_2_ikJoint.jo" "indexFinger_2_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "indexFinger_2_ikJoint.ssc" "indexFinger_2_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "indexFinger_2_ikJoint.is" "indexFinger_2_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "indexFinger_2_outJoint_parentConstraint1.w1" "indexFinger_2_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "indexFinger_2_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse2.ox" "indexFinger_2_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.IndexIk" "indexFinger_2_outJoint_parentConstraint1.w1";
connectAttr "indexFinger_1_outJoint.ro" "indexFinger_1_outJoint_parentConstraint1.cro"
		;
connectAttr "indexFinger_1_outJoint.pim" "indexFinger_1_outJoint_parentConstraint1.cpim"
		;
connectAttr "indexFinger_1_outJoint.rp" "indexFinger_1_outJoint_parentConstraint1.crp"
		;
connectAttr "indexFinger_1_outJoint.rpt" "indexFinger_1_outJoint_parentConstraint1.crt"
		;
connectAttr "indexFinger_1_outJoint.jo" "indexFinger_1_outJoint_parentConstraint1.cjo"
		;
connectAttr "indexFinger_1.t" "indexFinger_1_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "indexFinger_1.rp" "indexFinger_1_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "indexFinger_1.rpt" "indexFinger_1_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "indexFinger_1.r" "indexFinger_1_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "indexFinger_1.ro" "indexFinger_1_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "indexFinger_1.s" "indexFinger_1_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "indexFinger_1.pm" "indexFinger_1_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.w0" "indexFinger_1_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "indexFinger_1_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "indexFinger_1_ikJoint.t" "indexFinger_1_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "indexFinger_1_ikJoint.rp" "indexFinger_1_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "indexFinger_1_ikJoint.rpt" "indexFinger_1_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "indexFinger_1_ikJoint.r" "indexFinger_1_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "indexFinger_1_ikJoint.ro" "indexFinger_1_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "indexFinger_1_ikJoint.s" "indexFinger_1_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "indexFinger_1_ikJoint.pm" "indexFinger_1_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "indexFinger_1_ikJoint.jo" "indexFinger_1_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "indexFinger_1_ikJoint.ssc" "indexFinger_1_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "indexFinger_1_ikJoint.is" "indexFinger_1_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "indexFinger_1_outJoint_parentConstraint1.w1" "indexFinger_1_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "indexFinger_1_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse2.ox" "indexFinger_1_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.IndexIk" "indexFinger_1_outJoint_parentConstraint1.w1";
connectAttr "indexFingerRoot_outJoint.ro" "indexFingerRoot_outJoint_parentConstraint1.cro"
		;
connectAttr "indexFingerRoot_outJoint.pim" "indexFingerRoot_outJoint_parentConstraint1.cpim"
		;
connectAttr "indexFingerRoot_outJoint.rp" "indexFingerRoot_outJoint_parentConstraint1.crp"
		;
connectAttr "indexFingerRoot_outJoint.rpt" "indexFingerRoot_outJoint_parentConstraint1.crt"
		;
connectAttr "indexFingerRoot_outJoint.jo" "indexFingerRoot_outJoint_parentConstraint1.cjo"
		;
connectAttr "indexFingerRoot.t" "indexFingerRoot_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "indexFingerRoot.rp" "indexFingerRoot_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "indexFingerRoot.rpt" "indexFingerRoot_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "indexFingerRoot.r" "indexFingerRoot_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "indexFingerRoot.ro" "indexFingerRoot_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "indexFingerRoot.s" "indexFingerRoot_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "indexFingerRoot.pm" "indexFingerRoot_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "indexFingerRoot_outJoint_parentConstraint1.w0" "indexFingerRoot_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "indexFingerRoot_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.ctx" "middleFingerRoot_outJoint.tx"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.cty" "middleFingerRoot_outJoint.ty"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.ctz" "middleFingerRoot_outJoint.tz"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.crx" "middleFingerRoot_outJoint.rx"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.cry" "middleFingerRoot_outJoint.ry"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.crz" "middleFingerRoot_outJoint.rz"
		;
connectAttr "root_outJoint.s" "middleFingerRoot_outJoint.is";
connectAttr "middleFinger_1_outJoint_parentConstraint1.crx" "middleFinger_1_outJoint.rx"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.cry" "middleFinger_1_outJoint.ry"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.crz" "middleFinger_1_outJoint.rz"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.ctx" "middleFinger_1_outJoint.tx"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.cty" "middleFinger_1_outJoint.ty"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.ctz" "middleFinger_1_outJoint.tz"
		;
connectAttr "middleFingerRoot_outJoint.s" "middleFinger_1_outJoint.is";
connectAttr "middleFinger_1_outJoint.s" "middleFinger_2_outJoint.is";
connectAttr "middleFinger_2_outJoint_parentConstraint1.ctx" "middleFinger_2_outJoint.tx"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.cty" "middleFinger_2_outJoint.ty"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.ctz" "middleFinger_2_outJoint.tz"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.crx" "middleFinger_2_outJoint.rx"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.cry" "middleFinger_2_outJoint.ry"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.crz" "middleFinger_2_outJoint.rz"
		;
connectAttr "multDoubleLinear34.o" "middleFinger_2_outJoint.sz";
connectAttr "middleFinger_3_outJoint_parentConstraint1.ctx" "middleFinger_3_outJoint.tx"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.cty" "middleFinger_3_outJoint.ty"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.ctz" "middleFinger_3_outJoint.tz"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.crx" "middleFinger_3_outJoint.rx"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.cry" "middleFinger_3_outJoint.ry"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.crz" "middleFinger_3_outJoint.rz"
		;
connectAttr "middleFinger_2_outJoint.s" "middleFinger_3_outJoint.is";
connectAttr "multDoubleLinear39.o" "middleFinger_3_outJoint.sz";
connectAttr "middleFinger_3_outJoint.s" "middleFinger_end_outJoint.is";
connectAttr "middleFinger_end_outJoint_decMat.otx" "middleFinger_end_outJoint.tx"
		;
connectAttr "middleFinger_end_outJoint_decMat.oty" "middleFinger_end_outJoint.ty"
		;
connectAttr "middleFinger_end_outJoint_decMat.otz" "middleFinger_end_outJoint.tz"
		;
connectAttr "middleFinger_3_outJoint.ro" "middleFinger_3_outJoint_parentConstraint1.cro"
		;
connectAttr "middleFinger_3_outJoint.pim" "middleFinger_3_outJoint_parentConstraint1.cpim"
		;
connectAttr "middleFinger_3_outJoint.rp" "middleFinger_3_outJoint_parentConstraint1.crp"
		;
connectAttr "middleFinger_3_outJoint.rpt" "middleFinger_3_outJoint_parentConstraint1.crt"
		;
connectAttr "middleFinger_3_outJoint.jo" "middleFinger_3_outJoint_parentConstraint1.cjo"
		;
connectAttr "middleFinger_3.t" "middleFinger_3_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "middleFinger_3.rp" "middleFinger_3_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "middleFinger_3.rpt" "middleFinger_3_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "middleFinger_3.r" "middleFinger_3_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "middleFinger_3.ro" "middleFinger_3_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "middleFinger_3.s" "middleFinger_3_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "middleFinger_3.pm" "middleFinger_3_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.w0" "middleFinger_3_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "middleFinger_3_ikJoint.t" "middleFinger_3_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "middleFinger_3_ikJoint.rp" "middleFinger_3_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "middleFinger_3_ikJoint.rpt" "middleFinger_3_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "middleFinger_3_ikJoint.r" "middleFinger_3_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "middleFinger_3_ikJoint.ro" "middleFinger_3_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "middleFinger_3_ikJoint.s" "middleFinger_3_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "middleFinger_3_ikJoint.pm" "middleFinger_3_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "middleFinger_3_ikJoint.jo" "middleFinger_3_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "middleFinger_3_ikJoint.ssc" "middleFinger_3_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "middleFinger_3_ikJoint.is" "middleFinger_3_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.w1" "middleFinger_3_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "reverse1.oz" "middleFinger_3_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.middleIk" "middleFinger_3_outJoint_parentConstraint1.w1"
		;
connectAttr "middleFinger_2_outJoint.ro" "middleFinger_2_outJoint_parentConstraint1.cro"
		;
connectAttr "middleFinger_2_outJoint.pim" "middleFinger_2_outJoint_parentConstraint1.cpim"
		;
connectAttr "middleFinger_2_outJoint.rp" "middleFinger_2_outJoint_parentConstraint1.crp"
		;
connectAttr "middleFinger_2_outJoint.rpt" "middleFinger_2_outJoint_parentConstraint1.crt"
		;
connectAttr "middleFinger_2_outJoint.jo" "middleFinger_2_outJoint_parentConstraint1.cjo"
		;
connectAttr "middleFinger_2.t" "middleFinger_2_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "middleFinger_2.rp" "middleFinger_2_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "middleFinger_2.rpt" "middleFinger_2_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "middleFinger_2.r" "middleFinger_2_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "middleFinger_2.ro" "middleFinger_2_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "middleFinger_2.s" "middleFinger_2_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "middleFinger_2.pm" "middleFinger_2_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.w0" "middleFinger_2_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "middleFinger_2_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "middleFinger_2_ikJoint.t" "middleFinger_2_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "middleFinger_2_ikJoint.rp" "middleFinger_2_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "middleFinger_2_ikJoint.rpt" "middleFinger_2_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "middleFinger_2_ikJoint.r" "middleFinger_2_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "middleFinger_2_ikJoint.ro" "middleFinger_2_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "middleFinger_2_ikJoint.s" "middleFinger_2_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "middleFinger_2_ikJoint.pm" "middleFinger_2_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "middleFinger_2_ikJoint.jo" "middleFinger_2_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "middleFinger_2_ikJoint.ssc" "middleFinger_2_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "middleFinger_2_ikJoint.is" "middleFinger_2_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "middleFinger_2_outJoint_parentConstraint1.w1" "middleFinger_2_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "middleFinger_2_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse1.oz" "middleFinger_2_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.middleIk" "middleFinger_2_outJoint_parentConstraint1.w1"
		;
connectAttr "middleFinger_1_outJoint.ro" "middleFinger_1_outJoint_parentConstraint1.cro"
		;
connectAttr "middleFinger_1_outJoint.pim" "middleFinger_1_outJoint_parentConstraint1.cpim"
		;
connectAttr "middleFinger_1_outJoint.rp" "middleFinger_1_outJoint_parentConstraint1.crp"
		;
connectAttr "middleFinger_1_outJoint.rpt" "middleFinger_1_outJoint_parentConstraint1.crt"
		;
connectAttr "middleFinger_1_outJoint.jo" "middleFinger_1_outJoint_parentConstraint1.cjo"
		;
connectAttr "middleFinger_1.t" "middleFinger_1_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "middleFinger_1.rp" "middleFinger_1_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "middleFinger_1.rpt" "middleFinger_1_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "middleFinger_1.r" "middleFinger_1_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "middleFinger_1.ro" "middleFinger_1_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "middleFinger_1.s" "middleFinger_1_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "middleFinger_1.pm" "middleFinger_1_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.w0" "middleFinger_1_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "middleFinger_1_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "middleFinger_1_ikJoint.t" "middleFinger_1_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "middleFinger_1_ikJoint.rp" "middleFinger_1_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "middleFinger_1_ikJoint.rpt" "middleFinger_1_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "middleFinger_1_ikJoint.r" "middleFinger_1_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "middleFinger_1_ikJoint.ro" "middleFinger_1_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "middleFinger_1_ikJoint.s" "middleFinger_1_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "middleFinger_1_ikJoint.pm" "middleFinger_1_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "middleFinger_1_ikJoint.jo" "middleFinger_1_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "middleFinger_1_ikJoint.ssc" "middleFinger_1_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "middleFinger_1_ikJoint.is" "middleFinger_1_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "middleFinger_1_outJoint_parentConstraint1.w1" "middleFinger_1_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "middleFinger_1_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse1.oz" "middleFinger_1_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.middleIk" "middleFinger_1_outJoint_parentConstraint1.w1"
		;
connectAttr "middleFingerRoot_outJoint.ro" "middleFingerRoot_outJoint_parentConstraint1.cro"
		;
connectAttr "middleFingerRoot_outJoint.pim" "middleFingerRoot_outJoint_parentConstraint1.cpim"
		;
connectAttr "middleFingerRoot_outJoint.rp" "middleFingerRoot_outJoint_parentConstraint1.crp"
		;
connectAttr "middleFingerRoot_outJoint.rpt" "middleFingerRoot_outJoint_parentConstraint1.crt"
		;
connectAttr "middleFingerRoot_outJoint.jo" "middleFingerRoot_outJoint_parentConstraint1.cjo"
		;
connectAttr "middleFingerRoot.t" "middleFingerRoot_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "middleFingerRoot.rp" "middleFingerRoot_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "middleFingerRoot.rpt" "middleFingerRoot_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "middleFingerRoot.r" "middleFingerRoot_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "middleFingerRoot.ro" "middleFingerRoot_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "middleFingerRoot.s" "middleFingerRoot_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "middleFingerRoot.pm" "middleFingerRoot_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "middleFingerRoot_outJoint_parentConstraint1.w0" "middleFingerRoot_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "middleFingerRoot_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.crx" "ringFingerRoot_outJoint.rx"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.cry" "ringFingerRoot_outJoint.ry"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.crz" "ringFingerRoot_outJoint.rz"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.ctx" "ringFingerRoot_outJoint.tx"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.cty" "ringFingerRoot_outJoint.ty"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.ctz" "ringFingerRoot_outJoint.tz"
		;
connectAttr "root_outJoint.s" "ringFingerRoot_outJoint.is";
connectAttr "ringFinger_1_outJoint_parentConstraint1.crx" "ringFinger_1_outJoint.rx"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.cry" "ringFinger_1_outJoint.ry"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.crz" "ringFinger_1_outJoint.rz"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.ctx" "ringFinger_1_outJoint.tx"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.cty" "ringFinger_1_outJoint.ty"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.ctz" "ringFinger_1_outJoint.tz"
		;
connectAttr "ringFingerRoot_outJoint.s" "ringFinger_1_outJoint.is";
connectAttr "ringFinger_1_outJoint.s" "ringFinger_2_outJoint.is";
connectAttr "ringFinger_2_outJoint_parentConstraint1.ctx" "ringFinger_2_outJoint.tx"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.cty" "ringFinger_2_outJoint.ty"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.ctz" "ringFinger_2_outJoint.tz"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.crx" "ringFinger_2_outJoint.rx"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.cry" "ringFinger_2_outJoint.ry"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.crz" "ringFinger_2_outJoint.rz"
		;
connectAttr "multDoubleLinear36.o" "ringFinger_2_outJoint.sz";
connectAttr "ringFinger_2_outJoint.s" "ringFinger_3_outJoint.is";
connectAttr "ringFinger_3_outJoint_parentConstraint1.ctx" "ringFinger_3_outJoint.tx"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.cty" "ringFinger_3_outJoint.ty"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.ctz" "ringFinger_3_outJoint.tz"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.crx" "ringFinger_3_outJoint.rx"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.cry" "ringFinger_3_outJoint.ry"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.crz" "ringFinger_3_outJoint.rz"
		;
connectAttr "multDoubleLinear41.o" "ringFinger_3_outJoint.sz";
connectAttr "ringFinger_3_outJoint.s" "ringFinger_end_outJoint.is";
connectAttr "ringFinger_end_outJoint_decMat.otx" "ringFinger_end_outJoint.tx";
connectAttr "ringFinger_end_outJoint_decMat.oty" "ringFinger_end_outJoint.ty";
connectAttr "ringFinger_end_outJoint_decMat.otz" "ringFinger_end_outJoint.tz";
connectAttr "ringFinger_3_outJoint.ro" "ringFinger_3_outJoint_parentConstraint1.cro"
		;
connectAttr "ringFinger_3_outJoint.pim" "ringFinger_3_outJoint_parentConstraint1.cpim"
		;
connectAttr "ringFinger_3_outJoint.rp" "ringFinger_3_outJoint_parentConstraint1.crp"
		;
connectAttr "ringFinger_3_outJoint.rpt" "ringFinger_3_outJoint_parentConstraint1.crt"
		;
connectAttr "ringFinger_3_outJoint.jo" "ringFinger_3_outJoint_parentConstraint1.cjo"
		;
connectAttr "ringFinger_3.t" "ringFinger_3_outJoint_parentConstraint1.tg[0].tt";
connectAttr "ringFinger_3.rp" "ringFinger_3_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "ringFinger_3.rpt" "ringFinger_3_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "ringFinger_3.r" "ringFinger_3_outJoint_parentConstraint1.tg[0].tr";
connectAttr "ringFinger_3.ro" "ringFinger_3_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "ringFinger_3.s" "ringFinger_3_outJoint_parentConstraint1.tg[0].ts";
connectAttr "ringFinger_3.pm" "ringFinger_3_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.w0" "ringFinger_3_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "ringFinger_3_ikJoint.t" "ringFinger_3_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "ringFinger_3_ikJoint.rp" "ringFinger_3_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "ringFinger_3_ikJoint.rpt" "ringFinger_3_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "ringFinger_3_ikJoint.r" "ringFinger_3_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "ringFinger_3_ikJoint.ro" "ringFinger_3_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "ringFinger_3_ikJoint.s" "ringFinger_3_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "ringFinger_3_ikJoint.pm" "ringFinger_3_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "ringFinger_3_ikJoint.jo" "ringFinger_3_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "ringFinger_3_ikJoint.ssc" "ringFinger_3_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "ringFinger_3_ikJoint.is" "ringFinger_3_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "ringFinger_3_outJoint_parentConstraint1.w1" "ringFinger_3_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "reverse1.oy" "ringFinger_3_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.ringIk" "ringFinger_3_outJoint_parentConstraint1.w1";
connectAttr "ringFinger_2_outJoint.ro" "ringFinger_2_outJoint_parentConstraint1.cro"
		;
connectAttr "ringFinger_2_outJoint.pim" "ringFinger_2_outJoint_parentConstraint1.cpim"
		;
connectAttr "ringFinger_2_outJoint.rp" "ringFinger_2_outJoint_parentConstraint1.crp"
		;
connectAttr "ringFinger_2_outJoint.rpt" "ringFinger_2_outJoint_parentConstraint1.crt"
		;
connectAttr "ringFinger_2_outJoint.jo" "ringFinger_2_outJoint_parentConstraint1.cjo"
		;
connectAttr "ringFinger_2.t" "ringFinger_2_outJoint_parentConstraint1.tg[0].tt";
connectAttr "ringFinger_2.rp" "ringFinger_2_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "ringFinger_2.rpt" "ringFinger_2_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "ringFinger_2.r" "ringFinger_2_outJoint_parentConstraint1.tg[0].tr";
connectAttr "ringFinger_2.ro" "ringFinger_2_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "ringFinger_2.s" "ringFinger_2_outJoint_parentConstraint1.tg[0].ts";
connectAttr "ringFinger_2.pm" "ringFinger_2_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.w0" "ringFinger_2_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "ringFinger_2_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "ringFinger_2_ikJoint.t" "ringFinger_2_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "ringFinger_2_ikJoint.rp" "ringFinger_2_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "ringFinger_2_ikJoint.rpt" "ringFinger_2_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "ringFinger_2_ikJoint.r" "ringFinger_2_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "ringFinger_2_ikJoint.ro" "ringFinger_2_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "ringFinger_2_ikJoint.s" "ringFinger_2_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "ringFinger_2_ikJoint.pm" "ringFinger_2_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "ringFinger_2_ikJoint.jo" "ringFinger_2_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "ringFinger_2_ikJoint.ssc" "ringFinger_2_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "ringFinger_2_ikJoint.is" "ringFinger_2_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "ringFinger_2_outJoint_parentConstraint1.w1" "ringFinger_2_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "ringFinger_2_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse1.oy" "ringFinger_2_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.ringIk" "ringFinger_2_outJoint_parentConstraint1.w1";
connectAttr "ringFinger_1_outJoint.ro" "ringFinger_1_outJoint_parentConstraint1.cro"
		;
connectAttr "ringFinger_1_outJoint.pim" "ringFinger_1_outJoint_parentConstraint1.cpim"
		;
connectAttr "ringFinger_1_outJoint.rp" "ringFinger_1_outJoint_parentConstraint1.crp"
		;
connectAttr "ringFinger_1_outJoint.rpt" "ringFinger_1_outJoint_parentConstraint1.crt"
		;
connectAttr "ringFinger_1_outJoint.jo" "ringFinger_1_outJoint_parentConstraint1.cjo"
		;
connectAttr "ringFinger_1.t" "ringFinger_1_outJoint_parentConstraint1.tg[0].tt";
connectAttr "ringFinger_1.rp" "ringFinger_1_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "ringFinger_1.rpt" "ringFinger_1_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "ringFinger_1.r" "ringFinger_1_outJoint_parentConstraint1.tg[0].tr";
connectAttr "ringFinger_1.ro" "ringFinger_1_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "ringFinger_1.s" "ringFinger_1_outJoint_parentConstraint1.tg[0].ts";
connectAttr "ringFinger_1.pm" "ringFinger_1_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.w0" "ringFinger_1_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "ringFinger_1_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "ringFinger_1_ikJoint.t" "ringFinger_1_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "ringFinger_1_ikJoint.rp" "ringFinger_1_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "ringFinger_1_ikJoint.rpt" "ringFinger_1_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "ringFinger_1_ikJoint.r" "ringFinger_1_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "ringFinger_1_ikJoint.ro" "ringFinger_1_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "ringFinger_1_ikJoint.s" "ringFinger_1_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "ringFinger_1_ikJoint.pm" "ringFinger_1_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "ringFinger_1_ikJoint.jo" "ringFinger_1_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "ringFinger_1_ikJoint.ssc" "ringFinger_1_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "ringFinger_1_ikJoint.is" "ringFinger_1_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "ringFinger_1_outJoint_parentConstraint1.w1" "ringFinger_1_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "ringFinger_1_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse1.oy" "ringFinger_1_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.ringIk" "ringFinger_1_outJoint_parentConstraint1.w1";
connectAttr "ringFingerRoot_outJoint.ro" "ringFingerRoot_outJoint_parentConstraint1.cro"
		;
connectAttr "ringFingerRoot_outJoint.pim" "ringFingerRoot_outJoint_parentConstraint1.cpim"
		;
connectAttr "ringFingerRoot_outJoint.rp" "ringFingerRoot_outJoint_parentConstraint1.crp"
		;
connectAttr "ringFingerRoot_outJoint.rpt" "ringFingerRoot_outJoint_parentConstraint1.crt"
		;
connectAttr "ringFingerRoot_outJoint.jo" "ringFingerRoot_outJoint_parentConstraint1.cjo"
		;
connectAttr "ringFingerRoot.t" "ringFingerRoot_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "ringFingerRoot.rp" "ringFingerRoot_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "ringFingerRoot.rpt" "ringFingerRoot_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "ringFingerRoot.r" "ringFingerRoot_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "ringFingerRoot.ro" "ringFingerRoot_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "ringFingerRoot.s" "ringFingerRoot_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "ringFingerRoot.pm" "ringFingerRoot_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "ringFingerRoot_outJoint_parentConstraint1.w0" "ringFingerRoot_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "ringFingerRoot_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.crx" "pinkyFingerRoot_outJoint.rx"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.cry" "pinkyFingerRoot_outJoint.ry"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.crz" "pinkyFingerRoot_outJoint.rz"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.ctx" "pinkyFingerRoot_outJoint.tx"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.cty" "pinkyFingerRoot_outJoint.ty"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.ctz" "pinkyFingerRoot_outJoint.tz"
		;
connectAttr "root_outJoint.s" "pinkyFingerRoot_outJoint.is";
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.crx" "pinkyFinger_1_outJoint.rx"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.cry" "pinkyFinger_1_outJoint.ry"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.crz" "pinkyFinger_1_outJoint.rz"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.ctx" "pinkyFinger_1_outJoint.tx"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.cty" "pinkyFinger_1_outJoint.ty"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.ctz" "pinkyFinger_1_outJoint.tz"
		;
connectAttr "pinkyFingerRoot_outJoint.s" "pinkyFinger_1_outJoint.is";
connectAttr "pinkyFinger_1_outJoint.s" "pinkyFinger_2_outJoint.is";
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.ctx" "pinkyFinger_2_outJoint.tx"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.cty" "pinkyFinger_2_outJoint.ty"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.ctz" "pinkyFinger_2_outJoint.tz"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.crx" "pinkyFinger_2_outJoint.rx"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.cry" "pinkyFinger_2_outJoint.ry"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.crz" "pinkyFinger_2_outJoint.rz"
		;
connectAttr "multDoubleLinear37.o" "pinkyFinger_2_outJoint.sz";
connectAttr "pinkyFinger_2_outJoint.s" "pinkyFinger_3_outJoint.is";
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.ctx" "pinkyFinger_3_outJoint.tx"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.cty" "pinkyFinger_3_outJoint.ty"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.ctz" "pinkyFinger_3_outJoint.tz"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.crx" "pinkyFinger_3_outJoint.rx"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.cry" "pinkyFinger_3_outJoint.ry"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.crz" "pinkyFinger_3_outJoint.rz"
		;
connectAttr "multDoubleLinear38.o" "pinkyFinger_3_outJoint.sz";
connectAttr "pinkyFinger_3_outJoint.s" "pinkyFinger_end_outJoint.is";
connectAttr "pinkyFinger_end_outJoint_decMat.otx" "pinkyFinger_end_outJoint.tx";
connectAttr "pinkyFinger_end_outJoint_decMat.oty" "pinkyFinger_end_outJoint.ty";
connectAttr "pinkyFinger_end_outJoint_decMat.otz" "pinkyFinger_end_outJoint.tz";
connectAttr "pinkyFinger_3_outJoint.ro" "pinkyFinger_3_outJoint_parentConstraint1.cro"
		;
connectAttr "pinkyFinger_3_outJoint.pim" "pinkyFinger_3_outJoint_parentConstraint1.cpim"
		;
connectAttr "pinkyFinger_3_outJoint.rp" "pinkyFinger_3_outJoint_parentConstraint1.crp"
		;
connectAttr "pinkyFinger_3_outJoint.rpt" "pinkyFinger_3_outJoint_parentConstraint1.crt"
		;
connectAttr "pinkyFinger_3_outJoint.jo" "pinkyFinger_3_outJoint_parentConstraint1.cjo"
		;
connectAttr "pinkyFinger_3.t" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "pinkyFinger_3.rp" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "pinkyFinger_3.rpt" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "pinkyFinger_3.r" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "pinkyFinger_3.ro" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "pinkyFinger_3.s" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "pinkyFinger_3.pm" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.w0" "pinkyFinger_3_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "pinkyFinger_3_ikJoint.t" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "pinkyFinger_3_ikJoint.rp" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "pinkyFinger_3_ikJoint.rpt" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "pinkyFinger_3_ikJoint.r" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "pinkyFinger_3_ikJoint.ro" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "pinkyFinger_3_ikJoint.s" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "pinkyFinger_3_ikJoint.pm" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "pinkyFinger_3_ikJoint.jo" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "pinkyFinger_3_ikJoint.ssc" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "pinkyFinger_3_ikJoint.is" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "pinkyFinger_3_outJoint_parentConstraint1.w1" "pinkyFinger_3_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "reverse1.ox" "pinkyFinger_3_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.pinkyIk" "pinkyFinger_3_outJoint_parentConstraint1.w1";
connectAttr "pinkyFinger_2_outJoint.ro" "pinkyFinger_2_outJoint_parentConstraint1.cro"
		;
connectAttr "pinkyFinger_2_outJoint.pim" "pinkyFinger_2_outJoint_parentConstraint1.cpim"
		;
connectAttr "pinkyFinger_2_outJoint.rp" "pinkyFinger_2_outJoint_parentConstraint1.crp"
		;
connectAttr "pinkyFinger_2_outJoint.rpt" "pinkyFinger_2_outJoint_parentConstraint1.crt"
		;
connectAttr "pinkyFinger_2_outJoint.jo" "pinkyFinger_2_outJoint_parentConstraint1.cjo"
		;
connectAttr "pinkyFinger_2.t" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "pinkyFinger_2.rp" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "pinkyFinger_2.rpt" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "pinkyFinger_2.r" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "pinkyFinger_2.ro" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "pinkyFinger_2.s" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "pinkyFinger_2.pm" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.w0" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "pinkyFinger_2_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "pinkyFinger_2_ikJoint.t" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "pinkyFinger_2_ikJoint.rp" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "pinkyFinger_2_ikJoint.rpt" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "pinkyFinger_2_ikJoint.r" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "pinkyFinger_2_ikJoint.ro" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "pinkyFinger_2_ikJoint.s" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "pinkyFinger_2_ikJoint.pm" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "pinkyFinger_2_ikJoint.jo" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "pinkyFinger_2_ikJoint.ssc" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "pinkyFinger_2_ikJoint.is" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "pinkyFinger_2_outJoint_parentConstraint1.w1" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "pinkyFinger_2_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse1.ox" "pinkyFinger_2_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.pinkyIk" "pinkyFinger_2_outJoint_parentConstraint1.w1";
connectAttr "pinkyFinger_1_outJoint.ro" "pinkyFinger_1_outJoint_parentConstraint1.cro"
		;
connectAttr "pinkyFinger_1_outJoint.pim" "pinkyFinger_1_outJoint_parentConstraint1.cpim"
		;
connectAttr "pinkyFinger_1_outJoint.rp" "pinkyFinger_1_outJoint_parentConstraint1.crp"
		;
connectAttr "pinkyFinger_1_outJoint.rpt" "pinkyFinger_1_outJoint_parentConstraint1.crt"
		;
connectAttr "pinkyFinger_1_outJoint.jo" "pinkyFinger_1_outJoint_parentConstraint1.cjo"
		;
connectAttr "pinkyFinger_1.t" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "pinkyFinger_1.rp" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "pinkyFinger_1.rpt" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "pinkyFinger_1.r" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "pinkyFinger_1.ro" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "pinkyFinger_1.s" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "pinkyFinger_1.pm" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.w0" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "pinkyFinger_1_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "pinkyFinger_1_ikJoint.t" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tt"
		;
connectAttr "pinkyFinger_1_ikJoint.rp" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].trp"
		;
connectAttr "pinkyFinger_1_ikJoint.rpt" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].trt"
		;
connectAttr "pinkyFinger_1_ikJoint.r" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tr"
		;
connectAttr "pinkyFinger_1_ikJoint.ro" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tro"
		;
connectAttr "pinkyFinger_1_ikJoint.s" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].ts"
		;
connectAttr "pinkyFinger_1_ikJoint.pm" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tpm"
		;
connectAttr "pinkyFinger_1_ikJoint.jo" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tjo"
		;
connectAttr "pinkyFinger_1_ikJoint.ssc" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tsc"
		;
connectAttr "pinkyFinger_1_ikJoint.is" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tis"
		;
connectAttr "pinkyFinger_1_outJoint_parentConstraint1.w1" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].tw"
		;
connectAttr "unitConversion1458.o" "pinkyFinger_1_outJoint_parentConstraint1.tg[1].torz"
		;
connectAttr "reverse1.ox" "pinkyFinger_1_outJoint_parentConstraint1.w0";
connectAttr "fingers_ik.pinkyIk" "pinkyFinger_1_outJoint_parentConstraint1.w1";
connectAttr "pinkyFingerRoot_outJoint.ro" "pinkyFingerRoot_outJoint_parentConstraint1.cro"
		;
connectAttr "pinkyFingerRoot_outJoint.pim" "pinkyFingerRoot_outJoint_parentConstraint1.cpim"
		;
connectAttr "pinkyFingerRoot_outJoint.rp" "pinkyFingerRoot_outJoint_parentConstraint1.crp"
		;
connectAttr "pinkyFingerRoot_outJoint.rpt" "pinkyFingerRoot_outJoint_parentConstraint1.crt"
		;
connectAttr "pinkyFingerRoot_outJoint.jo" "pinkyFingerRoot_outJoint_parentConstraint1.cjo"
		;
connectAttr "pinkyFingerRoot.t" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].tt"
		;
connectAttr "pinkyFingerRoot.rp" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].trp"
		;
connectAttr "pinkyFingerRoot.rpt" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].trt"
		;
connectAttr "pinkyFingerRoot.r" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].tr"
		;
connectAttr "pinkyFingerRoot.ro" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].tro"
		;
connectAttr "pinkyFingerRoot.s" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].ts"
		;
connectAttr "pinkyFingerRoot.pm" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].tpm"
		;
connectAttr "pinkyFingerRoot_outJoint_parentConstraint1.w0" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "pinkyFingerRoot_outJoint_parentConstraint1.tg[0].torz"
		;
connectAttr "root_outJoint.ro" "root_outJoint_parentConstraint1.cro";
connectAttr "root_outJoint.pim" "root_outJoint_parentConstraint1.cpim";
connectAttr "root_outJoint.rp" "root_outJoint_parentConstraint1.crp";
connectAttr "root_outJoint.rpt" "root_outJoint_parentConstraint1.crt";
connectAttr "root_outJoint.jo" "root_outJoint_parentConstraint1.cjo";
connectAttr "root_pos_loc.t" "root_outJoint_parentConstraint1.tg[0].tt";
connectAttr "root_pos_loc.rp" "root_outJoint_parentConstraint1.tg[0].trp";
connectAttr "root_pos_loc.rpt" "root_outJoint_parentConstraint1.tg[0].trt";
connectAttr "root_pos_loc.r" "root_outJoint_parentConstraint1.tg[0].tr";
connectAttr "root_pos_loc.ro" "root_outJoint_parentConstraint1.tg[0].tro";
connectAttr "root_pos_loc.s" "root_outJoint_parentConstraint1.tg[0].ts";
connectAttr "root_pos_loc.pm" "root_outJoint_parentConstraint1.tg[0].tpm";
connectAttr "root_outJoint_parentConstraint1.w0" "root_outJoint_parentConstraint1.tg[0].tw"
		;
connectAttr "unitConversion1458.o" "root_outJoint_parentConstraint1.tg[0].torz";
connectAttr "root_ik_out_pointConstraint1.ctx" "ik_out.tx";
connectAttr "root_ik_out_pointConstraint1.ctz" "ik_out.tz";
connectAttr "root_ik_out_pointConstraint1.cty" "ik_out.ty";
connectAttr "ik_out.pim" "root_ik_out_pointConstraint1.cpim";
connectAttr "ik_out.rp" "root_ik_out_pointConstraint1.crp";
connectAttr "ik_out.rpt" "root_ik_out_pointConstraint1.crt";
connectAttr "root_pos_loc.t" "root_ik_out_pointConstraint1.tg[0].tt";
connectAttr "root_pos_loc.rp" "root_ik_out_pointConstraint1.tg[0].trp";
connectAttr "root_pos_loc.rpt" "root_ik_out_pointConstraint1.tg[0].trt";
connectAttr "root_pos_loc.pm" "root_ik_out_pointConstraint1.tg[0].tpm";
connectAttr "root_ik_out_pointConstraint1.w0" "root_ik_out_pointConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "root_connector.wm" "root_connector_decomposeMatrix.imat";
connectAttr "ringFinger_1_skinJoint_multMat.o" "ringFinger_1_skinJoint_decMat.imat"
		;
connectAttr "ringFinger_1_outJoint.pim" "ringFinger_1_skinJoint_multMat.i[1]";
connectAttr "pinkyFinger_1_skinJoint_multMat.o" "pinkyFinger_1_skinJoint_decMat.imat"
		;
connectAttr "pinkyFinger_1_outJoint.pim" "pinkyFinger_1_skinJoint_multMat.i[1]";
connectAttr "thumbFinger_1.iog" "thumb_moduleControlSet.dsm" -na;
connectAttr "thumbFinger_2.iog" "thumb_moduleControlSet.dsm" -na;
connectAttr "thumbFinger_3.iog" "thumb_moduleControlSet.dsm" -na;
connectAttr "thumb_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "pinky_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ring_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "middle_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "index_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "fingers_ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "b_bend.iog" "moduleControlSet.dsm" -na;
connectAttr "fingersBend.iog" "moduleControlSet.dsm" -na;
connectAttr "f_bend.iog" "moduleControlSet.dsm" -na;
connectAttr "fingers_ik.iog" "moduleControlSet.dsm" -na;
connectAttr "fingersRoot.iog" "moduleControlSet.dsm" -na;
connectAttr "palmBend.iog" "moduleControlSet.dsm" -na;
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
connectAttr "thumbFinger_cluster4GroupId.msg" "thumbFinger_cluster4Set.gn" -na;
connectAttr "thumbFinger_mainPoserShape.iog.og[1]" "thumbFinger_cluster4Set.dsm"
		 -na;
connectAttr "thumbFinger_mainPoser_clusterHandleCluster.msg" "thumbFinger_cluster4Set.ub[0]"
		;
connectAttr "thumbFinger_cluster4GroupParts.og" "thumbFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "thumbFinger_cluster4GroupId.id" "thumbFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "thumbFinger_mainPoser_clusterHandle.wm" "thumbFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "thumbFinger_mainPoser_clusterHandleShape.x" "thumbFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "thumbFinger_tweak24.og[0]" "thumbFinger_cluster4GroupParts.ig";
connectAttr "thumbFinger_cluster4GroupId.id" "thumbFinger_cluster4GroupParts.gi"
		;
connectAttr "thumbFinger_groupParts42.og" "thumbFinger_tweak24.ip[0].ig";
connectAttr "thumbFinger_groupId42.id" "thumbFinger_tweak24.ip[0].gi";
connectAttr "thumbFinger_groupId42.msg" "thumbFinger_tweakSet24.gn" -na;
connectAttr "thumbFinger_mainPoserShape.iog.og[2]" "thumbFinger_tweakSet24.dsm" 
		-na;
connectAttr "thumbFinger_tweak24.msg" "thumbFinger_tweakSet24.ub[0]";
connectAttr "thumbFinger_mainPoserShapeOrig.ws" "thumbFinger_groupParts42.ig";
connectAttr "thumbFinger_groupId42.id" "thumbFinger_groupParts42.gi";
connectAttr "indexFinger_cluster4GroupId.msg" "indexFinger_cluster4Set.gn" -na;
connectAttr "indexFinger_mainPoserShape.iog.og[1]" "indexFinger_cluster4Set.dsm"
		 -na;
connectAttr "indexFinger_mainPoser_clusterHandleCluster.msg" "indexFinger_cluster4Set.ub[0]"
		;
connectAttr "indexFinger_cluster4GroupParts.og" "indexFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "indexFinger_cluster4GroupId.id" "indexFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "indexFinger_mainPoser_clusterHandle.wm" "indexFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "indexFinger_mainPoser_clusterHandleShape.x" "indexFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "indexFinger_tweak24.og[0]" "indexFinger_cluster4GroupParts.ig";
connectAttr "indexFinger_cluster4GroupId.id" "indexFinger_cluster4GroupParts.gi"
		;
connectAttr "indexFinger_groupParts42.og" "indexFinger_tweak24.ip[0].ig";
connectAttr "indexFinger_groupId42.id" "indexFinger_tweak24.ip[0].gi";
connectAttr "indexFinger_groupId42.msg" "indexFinger_tweakSet24.gn" -na;
connectAttr "indexFinger_mainPoserShape.iog.og[2]" "indexFinger_tweakSet24.dsm" 
		-na;
connectAttr "indexFinger_tweak24.msg" "indexFinger_tweakSet24.ub[0]";
connectAttr "indexFinger_mainPoserShapeOrig.ws" "indexFinger_groupParts42.ig";
connectAttr "indexFinger_groupId42.id" "indexFinger_groupParts42.gi";
connectAttr "middleFinger_cluster4GroupId.msg" "middleFinger_cluster4Set.gn" -na
		;
connectAttr "middleFinger_mainPoserShape.iog.og[1]" "middleFinger_cluster4Set.dsm"
		 -na;
connectAttr "middleFinger_mainPoser_clusterHandleCluster.msg" "middleFinger_cluster4Set.ub[0]"
		;
connectAttr "middleFinger_cluster4GroupParts.og" "middleFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "middleFinger_cluster4GroupId.id" "middleFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "middleFinger_mainPoser_clusterHandle.wm" "middleFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "middleFinger_mainPoser_clusterHandleShape.x" "middleFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "middleFinger_tweak24.og[0]" "middleFinger_cluster4GroupParts.ig";
connectAttr "middleFinger_cluster4GroupId.id" "middleFinger_cluster4GroupParts.gi"
		;
connectAttr "middleFinger_groupParts42.og" "middleFinger_tweak24.ip[0].ig";
connectAttr "middleFinger_groupId42.id" "middleFinger_tweak24.ip[0].gi";
connectAttr "middleFinger_groupId42.msg" "middleFinger_tweakSet24.gn" -na;
connectAttr "middleFinger_mainPoserShape.iog.og[2]" "middleFinger_tweakSet24.dsm"
		 -na;
connectAttr "middleFinger_tweak24.msg" "middleFinger_tweakSet24.ub[0]";
connectAttr "middleFinger_mainPoserShapeOrig.ws" "middleFinger_groupParts42.ig";
connectAttr "middleFinger_groupId42.id" "middleFinger_groupParts42.gi";
connectAttr "ringFinger_cluster4GroupId.msg" "ringFinger_cluster4Set.gn" -na;
connectAttr "ringFinger_mainPoserShape.iog.og[1]" "ringFinger_cluster4Set.dsm" -na
		;
connectAttr "ringFinger_mainPoser_clusterHandleCluster.msg" "ringFinger_cluster4Set.ub[0]"
		;
connectAttr "ringFinger_cluster4GroupParts.og" "ringFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "ringFinger_cluster4GroupId.id" "ringFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "ringFinger_mainPoser_clusterHandle.wm" "ringFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "ringFinger_mainPoser_clusterHandleShape.x" "ringFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "ringFinger_tweak24.og[0]" "ringFinger_cluster4GroupParts.ig";
connectAttr "ringFinger_cluster4GroupId.id" "ringFinger_cluster4GroupParts.gi";
connectAttr "ringFinger_groupParts42.og" "ringFinger_tweak24.ip[0].ig";
connectAttr "ringFinger_groupId42.id" "ringFinger_tweak24.ip[0].gi";
connectAttr "ringFinger_groupId42.msg" "ringFinger_tweakSet24.gn" -na;
connectAttr "ringFinger_mainPoserShape.iog.og[2]" "ringFinger_tweakSet24.dsm" -na
		;
connectAttr "ringFinger_tweak24.msg" "ringFinger_tweakSet24.ub[0]";
connectAttr "ringFinger_mainPoserShapeOrig.ws" "ringFinger_groupParts42.ig";
connectAttr "ringFinger_groupId42.id" "ringFinger_groupParts42.gi";
connectAttr "pinkyFinger_cluster4GroupId.msg" "pinkyFinger_cluster4Set.gn" -na;
connectAttr "pinkyFinger_mainPoserShape.iog.og[1]" "pinkyFinger_cluster4Set.dsm"
		 -na;
connectAttr "pinkyFinger_mainPoser_clusterHandleCluster.msg" "pinkyFinger_cluster4Set.ub[0]"
		;
connectAttr "pinkyFinger_cluster4GroupParts.og" "pinkyFinger_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "pinkyFinger_cluster4GroupId.id" "pinkyFinger_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "pinkyFinger_mainPoser_clusterHandle.wm" "pinkyFinger_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "pinkyFinger_mainPoser_clusterHandleShape.x" "pinkyFinger_mainPoser_clusterHandleCluster.x"
		;
connectAttr "pinkyFinger_tweak24.og[0]" "pinkyFinger_cluster4GroupParts.ig";
connectAttr "pinkyFinger_cluster4GroupId.id" "pinkyFinger_cluster4GroupParts.gi"
		;
connectAttr "pinkyFinger_groupParts42.og" "pinkyFinger_tweak24.ip[0].ig";
connectAttr "pinkyFinger_groupId42.id" "pinkyFinger_tweak24.ip[0].gi";
connectAttr "pinkyFinger_groupId42.msg" "pinkyFinger_tweakSet24.gn" -na;
connectAttr "pinkyFinger_mainPoserShape.iog.og[2]" "pinkyFinger_tweakSet24.dsm" 
		-na;
connectAttr "pinkyFinger_tweak24.msg" "pinkyFinger_tweakSet24.ub[0]";
connectAttr "pinkyFinger_mainPoserShapeOrig.ws" "pinkyFinger_groupParts42.ig";
connectAttr "pinkyFinger_groupId42.id" "pinkyFinger_groupParts42.gi";
connectAttr "thumbFinger_2_offset_multMat.o" "thumbFinger_2_offset_decMat.imat";
connectAttr "thumbFingerB_poserOrient.wm" "thumbFinger_2_offset_multMat.i[0]";
connectAttr "thumbFingerA_poserOrient.wim" "thumbFinger_2_offset_multMat.i[1]";
connectAttr "thumbFinger_3_offset_multMat.o" "thumbFinger_3_offset_decMat.imat";
connectAttr "thumbFingerC_poserOrient.wm" "thumbFinger_3_offset_multMat.i[0]";
connectAttr "thumbFingerB_poserOrient.wim" "thumbFinger_3_offset_multMat.i[1]";
connectAttr "indexFingerRoot_group_multMat.o" "indexFingerRoot_group_decMat.imat"
		;
connectAttr "indexFingerRoot_poserOrient.wm" "indexFingerRoot_group_multMat.i[0]"
		;
connectAttr "center_palm_loc.wim" "indexFingerRoot_group_multMat.i[1]";
connectAttr "indexFingerA_poserOrient.wm" "indexFinger_1_group_multMat.i[0]";
connectAttr "indexFingerRoot_poserOrient.wim" "indexFinger_1_group_multMat.i[1]"
		;
connectAttr "indexFinger_2_group_multMat.o" "indexFinger_2_group_decMat.imat";
connectAttr "indexFingerB_poserOrient.wm" "indexFinger_2_group_multMat.i[0]";
connectAttr "indexFingerA_poserOrient.wim" "indexFinger_2_group_multMat.i[1]";
connectAttr "indexFinger_3_group_multMat.o" "indexFinger_3_group_decMat.imat";
connectAttr "indexFingerC_poserOrient.wm" "indexFinger_3_group_multMat.i[0]";
connectAttr "indexFingerB_poserOrient.wim" "indexFinger_3_group_multMat.i[1]";
connectAttr "middleFingerRoot_group_multMat.o" "middleFingerRoot_group_decMat.imat"
		;
connectAttr "middleFingerRoot_poserOrient.wm" "middleFingerRoot_group_multMat.i[0]"
		;
connectAttr "root_poser.wim" "middleFingerRoot_group_multMat.i[1]";
connectAttr "middleFingerA_poserOrient.wm" "middleFinger_1_group_multMat.i[0]";
connectAttr "middleFingerRoot_poserOrient.wim" "middleFinger_1_group_multMat.i[1]"
		;
connectAttr "middleFinger_2_group_multMat.o" "middleFinger_2_group_decMat.imat";
connectAttr "middleFingerB_poserOrient.wm" "middleFinger_2_group_multMat.i[0]";
connectAttr "middleFingerA_poserOrient.wim" "middleFinger_2_group_multMat.i[1]";
connectAttr "middleFinger_3_group_multMat.o" "middleFinger_3_group_decMat.imat";
connectAttr "middleFingerC_poserOrient.wm" "middleFinger_3_group_multMat.i[0]";
connectAttr "middleFingerB_poserOrient.wim" "middleFinger_3_group_multMat.i[1]";
connectAttr "ringFingerRoot_group_multMat.o" "ringFingerRoot_group_decMat.imat";
connectAttr "ringFingerRoot_poserOrient.wm" "ringFingerRoot_group_multMat.i[0]";
connectAttr "center_palm_loc.wim" "ringFingerRoot_group_multMat.i[1]";
connectAttr "ringFingerA_poserOrient.wm" "ringFinger_1_group_multMat.i[0]";
connectAttr "ringFingerRoot_poserOrient.wim" "ringFinger_1_group_multMat.i[1]";
connectAttr "ringFinger_2_group_multMat.o" "ringFinger_2_group_decMat.imat";
connectAttr "ringFingerB_poserOrient.wm" "ringFinger_2_group_multMat.i[0]";
connectAttr "ringFingerA_poserOrient.wim" "ringFinger_2_group_multMat.i[1]";
connectAttr "ringFinger_3_group_multMat.o" "ringFinger_3_group_decMat.imat";
connectAttr "ringFingerC_poserOrient.wm" "ringFinger_3_group_multMat.i[0]";
connectAttr "ringFingerB_poserOrient.wim" "ringFinger_3_group_multMat.i[1]";
connectAttr "pinkyFingerA_poserOrient.wm" "pinkyFinger_1_group_multMat.i[0]";
connectAttr "pinkyFingerRoot_poserOrient.wim" "pinkyFinger_1_group_multMat.i[1]"
		;
connectAttr "pinkyFinger_2_group_multMat.o" "pinkyFinger_2_group_decMat.imat";
connectAttr "pinkyFingerB_poserOrient.wm" "pinkyFinger_2_group_multMat.i[0]";
connectAttr "pinkyFingerA_poserOrient.wim" "pinkyFinger_2_group_multMat.i[1]";
connectAttr "pinkyFinger_3_group_multMat.o" "pinkyFinger_3_group_decMat.imat";
connectAttr "pinkyFingerC_poserOrient.wm" "pinkyFinger_3_group_multMat.i[0]";
connectAttr "pinkyFingerB_poserOrient.wim" "pinkyFinger_3_group_multMat.i[1]";
connectAttr "thumbFinger_end_outJoint_multMat.o" "thumbFinger_end_outJoint_decMat.imat"
		;
connectAttr "thumbFingerD_poser.wm" "thumbFinger_end_outJoint_multMat.i[0]";
connectAttr "thumbFingerC_poserOrient.wim" "thumbFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "indexFinger_end_outJoint_multMat.o" "indexFinger_end_outJoint_decMat.imat"
		;
connectAttr "indexFingerD_poser.wm" "indexFinger_end_outJoint_multMat.i[0]";
connectAttr "indexFingerC_poserOrient.wim" "indexFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "middleFinger_end_outJoint_multMat.o" "middleFinger_end_outJoint_decMat.imat"
		;
connectAttr "middleFingerD_poser.wm" "middleFinger_end_outJoint_multMat.i[0]";
connectAttr "middleFingerC_poserOrient.wim" "middleFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "ringFinger_end_outJoint_multMat.o" "ringFinger_end_outJoint_decMat.imat"
		;
connectAttr "ringFingerD_poser.wm" "ringFinger_end_outJoint_multMat.i[0]";
connectAttr "ringFingerC_poserOrient.wim" "ringFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "pinkyFinger_end_outJoint_multMat.o" "pinkyFinger_end_outJoint_decMat.imat"
		;
connectAttr "pinkyFingerD_poser.wm" "pinkyFinger_end_outJoint_multMat.i[0]";
connectAttr "pinkyFingerC_poserOrient.wim" "pinkyFinger_end_outJoint_multMat.i[1]"
		;
connectAttr "indexFinger_1.iog" "index_moduleControlSet.dsm" -na;
connectAttr "indexFinger_2.iog" "index_moduleControlSet.dsm" -na;
connectAttr "indexFinger_3.iog" "index_moduleControlSet.dsm" -na;
connectAttr "middleFinger_1.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "middleFinger_2.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "middleFinger_3.iog" "middle_moduleControlSet.dsm" -na;
connectAttr "ringFinger_1.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "ringFinger_2.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "ringFinger_3.iog" "ring_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_1.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_2.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_3.iog" "pinky_moduleControlSet.dsm" -na;
connectAttr "b_bend.r" "pairBlend1.ir2";
connectAttr "b_bend.t" "pairBlend1.it2";
connectAttr "b_bend.r" "pairBlend2.ir2";
connectAttr "b_bend.t" "pairBlend2.it2";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "root_connector_decomposeMatrix.osz" "multDoubleLinear1.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear1.i2";
connectAttr "mirror_condition.ocr" "composeMatrix1.isy";
connectAttr "multiplyDivide1.ox" "makeNurbSphere1.r";
connectAttr "pinkyFingerRoot_poser.size" "multiplyDivide1.i1x";
connectAttr "thumbFingerA_poser.size" "multiplyDivide1.i1y";
connectAttr "thumbFingerB_poser.size" "multiplyDivide1.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide1.i2x";
connectAttr "mainPoser.globalSize" "multiplyDivide1.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide1.i2z";
connectAttr "multiplyDivide1.oy" "makeNurbSphere2.r";
connectAttr "multiplyDivide2.ox" "makeNurbSphere3.r";
connectAttr "multiplyDivide1.oz" "makeNurbSphere4.r";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide2.i1z";
connectAttr "thumbFingerC_poser.size" "multiplyDivide2.i2x";
connectAttr "thumbFingerD_poser.size" "multiplyDivide2.i2y";
connectAttr "mainPoser.size" "multiplyDivide2.i2z";
connectAttr "multiplyDivide2.oy" "makeNurbSphere5.r";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide3.i1z";
connectAttr "indexFingerRoot_poser.size" "multiplyDivide3.i2x";
connectAttr "middleFingerRoot_poser.size" "multiplyDivide3.i2y";
connectAttr "ringFingerRoot_poser.size" "multiplyDivide3.i2z";
connectAttr "multiplyDivide3.ox" "makeNurbSphere6.r";
connectAttr "multiplyDivide3.oy" "makeNurbSphere7.r";
connectAttr "multiplyDivide3.oz" "makeNurbSphere8.r";
connectAttr "multiplyDivide4.ox" "makeNurbSphere9.r";
connectAttr "multiplyDivide5.ox" "makeNurbSphere10.r";
connectAttr "multiplyDivide4.oz" "makeNurbSphere11.r";
connectAttr "multiplyDivide4.oy" "makeNurbSphere12.r";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide4.i1z";
connectAttr "indexFingerA_poser.size" "multiplyDivide4.i2x";
connectAttr "indexFingerB_poser.size" "multiplyDivide4.i2y";
connectAttr "indexFingerC_poser.size" "multiplyDivide4.i2z";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide5.i1z";
connectAttr "indexFingerD_poser.size" "multiplyDivide5.i2x";
connectAttr "middleFingerA_poser.size" "multiplyDivide5.i2y";
connectAttr "middleFingerB_poser.size" "multiplyDivide5.i2z";
connectAttr "multiplyDivide5.oy" "makeNurbSphere13.r";
connectAttr "multiplyDivide5.oz" "makeNurbSphere14.r";
connectAttr "multiplyDivide6.ox" "makeNurbSphere15.r";
connectAttr "multiplyDivide6.oy" "makeNurbSphere16.r";
connectAttr "mainPoser.globalSize" "multiplyDivide6.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide6.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide6.i1z";
connectAttr "middleFingerC_poser.size" "multiplyDivide6.i2x";
connectAttr "middleFingerD_poser.size" "multiplyDivide6.i2y";
connectAttr "ringFingerA_poser.size" "multiplyDivide6.i2z";
connectAttr "multiplyDivide6.oz" "makeNurbSphere17.r";
connectAttr "multiplyDivide7.oz" "makeNurbSphere18.r";
connectAttr "multiplyDivide7.oy" "makeNurbSphere19.r";
connectAttr "multiplyDivide7.ox" "makeNurbSphere20.r";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide7.i1z";
connectAttr "ringFingerB_poser.size" "multiplyDivide7.i2x";
connectAttr "ringFingerC_poser.size" "multiplyDivide7.i2y";
connectAttr "ringFingerD_poser.size" "multiplyDivide7.i2z";
connectAttr "multiplyDivide8.ox" "makeNurbSphere21.r";
connectAttr "multiplyDivide9.oz" "makeNurbSphere22.r";
connectAttr "multiplyDivide9.ox" "makeNurbSphere23.r";
connectAttr "multiplyDivide9.oy" "makeNurbSphere24.r";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide8.i1z";
connectAttr "pinkyFingerD_poser.size" "multiplyDivide8.i2x";
connectAttr "root_poser.size" "multiplyDivide8.i2y";
connectAttr "multDoubleLinear26.o" "multiplyDivide8.i2z";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide9.i1z";
connectAttr "pinkyFingerA_poser.size" "multiplyDivide9.i2x";
connectAttr "pinkyFingerB_poser.size" "multiplyDivide9.i2y";
connectAttr "pinkyFingerC_poser.size" "multiplyDivide9.i2z";
connectAttr "multiplyDivide8.oy" "makeNurbSphere25.r";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "mainPoser_decomposeMatrix.osx" "multDoubleLinear26.i1";
connectAttr "mainPoser.lineSize" "multDoubleLinear26.i2";
connectAttr "thumbFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[0]"
		;
connectAttr "indexFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[1]"
		;
connectAttr "middleFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[2]"
		;
connectAttr "ringFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[3]"
		;
connectAttr "pinkyFinger_posers_curveShape.ws" "sweepMeshCreator2.inCurveArray[4]"
		;
connectAttr "multiplyDivide8.oz" "sweepMeshCreator2.scaleProfileX";
connectAttr "thumbFingerA_poserOrient.wm" "thumbFinger_1_group_multMat.i[0]";
connectAttr "center_palm_loc.wim" "thumbFinger_1_group_multMat.i[1]";
connectAttr "thumbFinger_1_group_multMat.o" "thumbFinger_1_group_decMat.imat";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "thumbFinger_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "thumbFinger_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "thumbFinger_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "indexFingerRoot_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "indexFinger_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "indexFinger_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "indexFinger_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "middleFingerRoot_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "middleFinger_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "middleFinger_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "middleFinger_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "ringFingerRoot_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "ringFinger_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "ringFinger_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "ringFinger_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "pinkyFingerRoot_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "pinkyFinger_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "pinkyFinger_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "pinkyFinger_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "mirror_condition.ocr" "multDoubleLinear28.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear29.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear34.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear35.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear36.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear37.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear38.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear39.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear40.i2";
connectAttr "mirror_condition.ocr" "multDoubleLinear41.i2";
connectAttr "setRange1.oy" "blendMatrix1.env";
connectAttr "indexFinger_2_closed.m" "blendMatrix1.tgt[0].tmat";
connectAttr "index_addDoubleLinear.o" "setRange1.vx";
connectAttr "index_addDoubleLinear.o" "setRange1.vy";
connectAttr "index_addDoubleLinear.o" "setRange1.vz";
connectAttr "multMatrix13.o" "decomposeMatrix1.imat";
connectAttr "setRange1.ox" "blendMatrix2.env";
connectAttr "indexFinger_1_closed.m" "blendMatrix2.tgt[0].tmat";
connectAttr "setRange1.oz" "blendMatrix3.env";
connectAttr "indexFinger_3_closed.m" "blendMatrix3.tgt[0].tmat";
connectAttr "multMatrix11.o" "decomposeMatrix3.imat";
connectAttr "multMatrix16.o" "decomposeMatrix4.imat";
connectAttr "multMatrix15.o" "decomposeMatrix5.imat";
connectAttr "setRange2.oz" "blendMatrix4.env";
connectAttr "middleFinger_3_closed.m" "blendMatrix4.tgt[0].tmat";
connectAttr "setRange2.ox" "blendMatrix5.env";
connectAttr "middleFinger_1_closed.m" "blendMatrix5.tgt[0].tmat";
connectAttr "setRange2.oy" "blendMatrix6.env";
connectAttr "middleFinger_2_closed.m" "blendMatrix6.tgt[0].tmat";
connectAttr "addDoubleLinear1.o" "setRange2.vx";
connectAttr "addDoubleLinear1.o" "setRange2.vy";
connectAttr "addDoubleLinear1.o" "setRange2.vz";
connectAttr "multMatrix10.o" "decomposeMatrix7.imat";
connectAttr "multMatrix9.o" "decomposeMatrix9.imat";
connectAttr "setRange3.oy" "blendMatrix7.env";
connectAttr "ringFinger_2_closed.m" "blendMatrix7.tgt[0].tmat";
connectAttr "setRange3.oz" "blendMatrix8.env";
connectAttr "ringFinger_3_closed.m" "blendMatrix8.tgt[0].tmat";
connectAttr "setRange3.ox" "blendMatrix9.env";
connectAttr "ringFinger_1_closed.m" "blendMatrix9.tgt[0].tmat";
connectAttr "addDoubleLinear2.o" "setRange3.vx";
connectAttr "addDoubleLinear2.o" "setRange3.vy";
connectAttr "addDoubleLinear2.o" "setRange3.vz";
connectAttr "multMatrix6.o" "decomposeMatrix10.imat";
connectAttr "multMatrix5.o" "decomposeMatrix11.imat";
connectAttr "setRange4.oz" "blendMatrix10.env";
connectAttr "pinkyFinger_3_closed.m" "blendMatrix10.tgt[0].tmat";
connectAttr "setRange4.oy" "blendMatrix11.env";
connectAttr "pinkyFinger_2_closed.m" "blendMatrix11.tgt[0].tmat";
connectAttr "setRange4.ox" "blendMatrix12.env";
connectAttr "pinkyFinger_1_closed.m" "blendMatrix12.tgt[0].tmat";
connectAttr "index_addDoubleLinear1.o" "setRange4.vx";
connectAttr "index_addDoubleLinear1.o" "setRange4.vy";
connectAttr "index_addDoubleLinear1.o" "setRange4.vz";
connectAttr "multMatrix2.o" "decomposeMatrix13.imat";
connectAttr "multMatrix1.o" "decomposeMatrix14.imat";
connectAttr "setRange5.oz" "blendMatrix13.env";
connectAttr "thumbFinger_3_closed.m" "blendMatrix13.tgt[0].tmat";
connectAttr "setRange5.ox" "blendMatrix14.env";
connectAttr "thumbFinger_1_closed.m" "blendMatrix14.tgt[0].tmat";
connectAttr "setRange5.oy" "blendMatrix15.env";
connectAttr "thumbFinger_2_closed.m" "blendMatrix15.tgt[0].tmat";
connectAttr "multMatrix4.o" "decomposeMatrix15.imat";
connectAttr "fingersBend.thumbBend" "setRange5.vx";
connectAttr "fingersBend.thumbBend" "setRange5.vy";
connectAttr "fingersBend.thumbBend" "setRange5.vz";
connectAttr "blendMatrix14.omat" "multMatrix1.i[0]";
connectAttr "blendMatrix19.omat" "multMatrix1.i[1]";
connectAttr "composeMatrix3.omat" "multMatrix1.i[2]";
connectAttr "unitConversion1450.o" "composeMatrix3.irz";
connectAttr "blendMatrix15.omat" "multMatrix2.i[0]";
connectAttr "composeMatrix3.omat" "multMatrix2.i[1]";
connectAttr "blendMatrix13.omat" "multMatrix4.i[0]";
connectAttr "composeMatrix3.omat" "multMatrix4.i[1]";
connectAttr "fingersBend.thumbBend" "clamp1.ipr";
connectAttr "index_addDoubleLinear1.o" "clamp1.ipg";
connectAttr "addDoubleLinear2.o" "clamp1.ipb";
connectAttr "clamp1.opr" "unitConversion1450.i";
connectAttr "blendMatrix11.omat" "multMatrix5.i[0]";
connectAttr "composeMatrix4.omat" "multMatrix5.i[1]";
connectAttr "blendMatrix10.omat" "multMatrix6.i[0]";
connectAttr "composeMatrix4.omat" "multMatrix6.i[1]";
connectAttr "blendMatrix12.omat" "multMatrix7.i[0]";
connectAttr "blendMatrix21.omat" "multMatrix7.i[1]";
connectAttr "composeMatrix4.omat" "multMatrix7.i[2]";
connectAttr "multMatrix32.o" "multMatrix7.i[3]";
connectAttr "unitConversion1451.o" "composeMatrix4.irz";
connectAttr "clamp1.opg" "unitConversion1451.i";
connectAttr "blendMatrix9.omat" "multMatrix8.i[0]";
connectAttr "blendMatrix22.omat" "multMatrix8.i[1]";
connectAttr "composeMatrix5.omat" "multMatrix8.i[2]";
connectAttr "multMatrix33.o" "multMatrix8.i[3]";
connectAttr "blendMatrix7.omat" "multMatrix9.i[0]";
connectAttr "composeMatrix5.omat" "multMatrix9.i[1]";
connectAttr "blendMatrix8.omat" "multMatrix10.i[0]";
connectAttr "composeMatrix5.omat" "multMatrix10.i[1]";
connectAttr "clamp1.opb" "unitConversion1452.i";
connectAttr "unitConversion1452.o" "composeMatrix5.irz";
connectAttr "blendMatrix3.omat" "multMatrix11.i[0]";
connectAttr "composeMatrix6.omat" "multMatrix11.i[1]";
connectAttr "blendMatrix2.omat" "multMatrix12.i[0]";
connectAttr "blendMatrix20.omat" "multMatrix12.i[1]";
connectAttr "composeMatrix6.omat" "multMatrix12.i[2]";
connectAttr "multMatrix35.o" "multMatrix12.i[3]";
connectAttr "blendMatrix1.omat" "multMatrix13.i[0]";
connectAttr "composeMatrix6.omat" "multMatrix13.i[1]";
connectAttr "unitConversion1453.o" "composeMatrix6.irz";
connectAttr "clamp2.opr" "unitConversion1453.i";
connectAttr "index_addDoubleLinear.o" "clamp2.ipr";
connectAttr "addDoubleLinear1.o" "clamp2.ipg";
connectAttr "blendMatrix5.omat" "multMatrix14.i[0]";
connectAttr "blendMatrix23.omat" "multMatrix14.i[1]";
connectAttr "composeMatrix7.omat" "multMatrix14.i[2]";
connectAttr "multMatrix34.o" "multMatrix14.i[3]";
connectAttr "blendMatrix4.omat" "multMatrix15.i[0]";
connectAttr "composeMatrix7.omat" "multMatrix15.i[1]";
connectAttr "blendMatrix6.omat" "multMatrix16.i[0]";
connectAttr "composeMatrix7.omat" "multMatrix16.i[1]";
connectAttr "unitConversion1454.o" "composeMatrix7.irz";
connectAttr "clamp2.opg" "unitConversion1454.i";
connectAttr "center_palm_loc.wm" "multMatrix17.i[0]";
connectAttr "root_poser.wim" "multMatrix17.i[1]";
connectAttr "pinkyFingerRoot_poserOrient.wm" "pinkyFingerRoot_group_multMat.i[0]"
		;
connectAttr "center_palm_loc.wim" "pinkyFingerRoot_group_multMat.i[1]";
connectAttr "pinkyFingerRoot_group_multMat.o" "decomposeMatrix16.imat";
connectAttr "multMatrix18.o" "decomposeMatrix17.imat";
connectAttr "b_bend.m" "multMatrix18.i[0]";
connectAttr "multMatrix17.o" "multMatrix18.i[1]";
connectAttr "blendMatrix16.omat" "multMatrix20.i[0]";
connectAttr "multMatrix17.o" "multMatrix20.i[1]";
connectAttr "multMatrix20.o" "decomposeMatrix18.imat";
connectAttr "b_bend.m" "blendMatrix16.tgt[0].tmat";
connectAttr "multMatrix21.o" "decomposeMatrix19.imat";
connectAttr "composeMatrix8.omat" "multMatrix21.i[0]";
connectAttr "blendMatrix17.omat" "multMatrix21.i[1]";
connectAttr "f_bend_group.m" "multMatrix21.i[2]";
connectAttr "multMatrix17.o" "multMatrix21.i[3]";
connectAttr "f_bend.m" "blendMatrix17.tgt[0].tmat";
connectAttr "f_bend_group.s" "composeMatrix8.is";
connectAttr "center_loc.wm" "multMatrix23.i[0]";
connectAttr "root_poser.wim" "multMatrix23.i[1]";
connectAttr "fingersBend.rz" "unitConversion1455.i";
connectAttr "multDoubleLinear42.o" "index_addDoubleLinear.i1";
connectAttr "fingersBend.indexBend" "index_addDoubleLinear.i2";
connectAttr "multDoubleLinear43.o" "addDoubleLinear1.i1";
connectAttr "fingersBend.middleBend" "addDoubleLinear1.i2";
connectAttr "multDoubleLinear44.o" "addDoubleLinear2.i1";
connectAttr "fingersBend.ringBend" "addDoubleLinear2.i2";
connectAttr "multDoubleLinear45.o" "index_addDoubleLinear1.i1";
connectAttr "fingersBend.pinkyBend" "index_addDoubleLinear1.i2";
connectAttr "unitConversion1457.o" "setRange6.vx";
connectAttr "unitConversion1457.o" "setRange6.vy";
connectAttr "fingersBend.rx" "unitConversion1457.i";
connectAttr "unitConversion1455.o" "multDoubleLinear42.i1";
connectAttr "setRange6.ox" "multDoubleLinear42.i2";
connectAttr "unitConversion1455.o" "multDoubleLinear43.i1";
connectAttr "setRange6.oy" "multDoubleLinear43.i2";
connectAttr "unitConversion1455.o" "multDoubleLinear44.i1";
connectAttr "setRange7.ox" "multDoubleLinear44.i2";
connectAttr "unitConversion1455.o" "multDoubleLinear45.i1";
connectAttr "setRange7.oy" "multDoubleLinear45.i2";
connectAttr "unitConversion1457.o" "setRange7.vx";
connectAttr "unitConversion1457.o" "setRange7.vy";
connectAttr "inverseMatrix1.omat" "multMatrix24.i[0]";
connectAttr "middleFinger_1_group_multMat.o" "multMatrix24.i[1]";
connectAttr "middleFinger_init.wm" "multMatrix25.i[0]";
connectAttr "multMatrix25.o" "inverseMatrix1.imat";
connectAttr "middleFinger_1.wm" "middleFinger_1_outJoint_multMat1.i[0]";
connectAttr "middleFingerRoot_outJoint.wim" "middleFinger_1_outJoint_multMat1.i[1]"
		;
connectAttr "inverseMatrix2.omat" "multMatrix26.i[0]";
connectAttr "indexFinger_1_group_multMat.o" "multMatrix26.i[1]";
connectAttr "multMatrix27.o" "inverseMatrix2.imat";
connectAttr "indexFinger_init.wm" "multMatrix27.i[0]";
connectAttr "indexFinger_1_loc.wim" "multMatrix27.i[1]";
connectAttr "multMatrix29.o" "multMatrix28.i[0]";
connectAttr "ringFinger_1_group_multMat.o" "multMatrix28.i[1]";
connectAttr "ringFinger_1_loc.wm" "multMatrix29.i[0]";
connectAttr "ringFinger_init.wim" "multMatrix29.i[1]";
connectAttr "pinkyFinger_1_loc.wm" "multMatrix30.i[0]";
connectAttr "pinkyFinger_bend_target.wim" "multMatrix30.i[1]";
connectAttr "multMatrix30.o" "multMatrix31.i[0]";
connectAttr "pinkyFinger_1_group_multMat.o" "multMatrix31.i[1]";
connectAttr "composeMatrix8.omat" "multMatrix22.i[0]";
connectAttr "f_bend.m" "multMatrix22.i[1]";
connectAttr "f_bend_group.m" "multMatrix22.i[2]";
connectAttr "multMatrix17.o" "multMatrix22.i[3]";
connectAttr "multMatrix22.o" "decomposeMatrix20.imat";
connectAttr "pinkyFingerRootIk_loc.wm" "multMatrix32.i[0]";
connectAttr "pinkyFingerRootIk_init.wim" "multMatrix32.i[1]";
connectAttr "ringFingerRootIk_loc.wm" "multMatrix33.i[0]";
connectAttr "ringFingerRootIk_init.wim" "multMatrix33.i[1]";
connectAttr "middleFingerRootIk_loc.wm" "multMatrix34.i[0]";
connectAttr "middleFingerRootIk_init.wim" "multMatrix34.i[1]";
connectAttr "indexFingerRootIk_loc.wm" "multMatrix35.i[0]";
connectAttr "indexFingerRootIk_init.wim" "multMatrix35.i[1]";
connectAttr "root_poser.ty" "composeMatrix9.ity";
connectAttr "root_poser.tz" "composeMatrix9.itz";
connectAttr "middleFinger_mainPoser.tx" "composeMatrix9.itx";
connectAttr "root_poser.r" "composeMatrix9.ir";
connectAttr "root_poser.s" "composeMatrix9.is";
connectAttr "root_poser.wm" "multMatrix36.i[0]";
connectAttr "center_loc.wim" "multMatrix36.i[1]";
connectAttr "root_poser.wm" "blendMatrix18.imat";
connectAttr "center_loc.wm" "blendMatrix18.tgt[0].tmat";
connectAttr "middleFingerA_poser.wm" "multMatrix37.i[0]";
connectAttr "root_poser.wim" "multMatrix37.i[1]";
connectAttr "indexFingerA_poserOrient.wm" "multMatrix38.i[0]";
connectAttr "root_poser.wim" "multMatrix38.i[1]";
connectAttr "middleFingerA_poserOrient.wm" "multMatrix39.i[0]";
connectAttr "root_poser.wim" "multMatrix39.i[1]";
connectAttr "pinkyFingerA_poser.wm" "multMatrix40.i[0]";
connectAttr "root_poser.wim" "multMatrix40.i[1]";
connectAttr "ringFingerA_poserOrient.wm" "multMatrix41.i[0]";
connectAttr "root_poser.wim" "multMatrix41.i[1]";
connectAttr "center_palm_loc.wm" "multMatrix42.i[0]";
connectAttr "root_poser.wim" "multMatrix42.i[1]";
connectAttr "ringFingerA_poser.wm" "multMatrix43.i[0]";
connectAttr "center_loc.wim" "multMatrix43.i[1]";
connectAttr "middleFingerA_poser.wm" "multMatrix44.i[0]";
connectAttr "center_loc.wim" "multMatrix44.i[1]";
connectAttr "indexFingerA_poser.wm" "multMatrix45.i[0]";
connectAttr "center_loc.wim" "multMatrix45.i[1]";
connectAttr "pinkyFingerA_poser.wm" "multMatrix46.i[0]";
connectAttr "center_loc.wim" "multMatrix46.i[1]";
connectAttr "indexFingerA_poserOrient.wm" "multMatrix48.i[0]";
connectAttr "center_palm_loc.wim" "multMatrix48.i[1]";
connectAttr "composeMatrix10.omat" "multMatrix48.i[2]";
connectAttr "ringFingerA_poserOrient.wm" "multMatrix49.i[0]";
connectAttr "center_palm_loc.wim" "multMatrix49.i[1]";
connectAttr "pinkyFingerA_poserOrient.wm" "multMatrix50.i[0]";
connectAttr "center_palm_loc.wim" "multMatrix50.i[1]";
connectAttr "multMatrix50.o" "multMatrix51.i[0]";
connectAttr "pinkyFinger_bend_target.m" "multMatrix51.i[1]";
connectAttr "b_bend.m" "multMatrix51.i[2]";
connectAttr "multMatrix17.o" "multMatrix51.i[3]";
connectAttr "indexFinger_ik.parent" "indexFinger_ik_parentSwitcher_group_parentConstraint1_indexFinger_3__indexFinger_ik__parentSwitcherTargetW0.i"
		;
connectAttr "indexFinger_ik.parent" "indexFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__indexFinger_ik__parentSwitcherTargetW1.i"
		;
connectAttr "indexFinger_ik.parent" "indexFinger_ik_parentSwitcher_group_parentConstraint1_mod__indexFinger_ik__parentSwitcherTargetW2.i"
		;
connectAttr "middleFinger_ik.parent" "middleFinger_ik_parentSwitcher_group_parentConstraint1_middleFinger_3__middleFinger_ik__parentSwitcherTargetW0.i"
		;
connectAttr "middleFinger_ik.parent" "middleFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__middleFinger_ik__parentSwitcherTargetW1.i"
		;
connectAttr "middleFinger_ik.parent" "middleFinger_ik_parentSwitcher_group_parentConstraint1_mod__middleFinger_ik__parentSwitcherTargetW2.i"
		;
connectAttr "ringFinger_ik.parent" "ringFinger_ik_parentSwitcher_group_parentConstraint1_ringFinger_3__ringFinger_ik__parentSwitcherTargetW0.i"
		;
connectAttr "ringFinger_ik.parent" "ringFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__ringFinger_ik__parentSwitcherTargetW1.i"
		;
connectAttr "ringFinger_ik.parent" "ringFinger_ik_parentSwitcher_group_parentConstraint1_mod__ringFinger_ik__parentSwitcherTargetW2.i"
		;
connectAttr "pinkyFinger_ik.parent" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_pinkyFinger_3__pinkyFinger_ik__parentSwitcherTargetW0.i"
		;
connectAttr "pinkyFinger_ik.parent" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__pinkyFinger_ik__parentSwitcherTargetW1.i"
		;
connectAttr "pinkyFinger_ik.parent" "pinkyFinger_ik_parentSwitcher_group_parentConstraint1_mod__pinkyFinger_ik__parentSwitcherTargetW2.i"
		;
connectAttr "thumbFinger_ik.parent" "thumbFinger_ik_parentSwitcher_group_parentConstraint1_thumbFinger_3__thumbFinger_ik__parentSwitcherTargetW0.i"
		;
connectAttr "thumbFinger_ik.parent" "thumbFinger_ik_parentSwitcher_group_parentConstraint1_root_connector__thumbFinger_ik__parentSwitcherTargetW1.i"
		;
connectAttr "thumbFinger_ik.parent" "thumbFinger_ik_parentSwitcher_group_parentConstraint1_mod__thumbFinger_ik__parentSwitcherTargetW2.i"
		;
connectAttr "fingers_ik.pinkyIk" "reverse1.ix";
connectAttr "fingers_ik.ringIk" "reverse1.iy";
connectAttr "fingers_ik.middleIk" "reverse1.iz";
connectAttr "fingers_ik.IndexIk" "reverse2.ix";
connectAttr "fingers_ik.thumbIk" "reverse2.iy";
connectAttr "root_poser.wm" "multMatrix52.i[0]";
connectAttr "center_palm_loc.wim" "multMatrix52.i[1]";
connectAttr "indexFinger_ik.iog" "fingers_ik_moduleControlSet.dsm" -na;
connectAttr "middleFinger_ik.iog" "fingers_ik_moduleControlSet.dsm" -na;
connectAttr "ringFinger_ik.iog" "fingers_ik_moduleControlSet.dsm" -na;
connectAttr "pinkyFinger_ik.iog" "fingers_ik_moduleControlSet.dsm" -na;
connectAttr "thumbFinger_ik.iog" "fingers_ik_moduleControlSet.dsm" -na;
connectAttr "blendMatrix18.omat" "multMatrix53.i[0]";
connectAttr "root_poser.wim" "multMatrix53.i[1]";
connectAttr "thumbFingerA_poser.wm" "multMatrix54.i[0]";
connectAttr "center_palm_loc.wim" "multMatrix54.i[1]";
connectAttr "composeMatrix10.omat" "multMatrix54.i[2]";
connectAttr "multMatrix54.o" "multMatrix55.i[0]";
connectAttr "thumbFingerA_poserOrient.wm" "multMatrix56.i[0]";
connectAttr "center_palm_loc.wim" "multMatrix56.i[1]";
connectAttr "mod.ikFk" "reverse3.ix";
connectAttr "fingersBend.IndexIk" "reverse4.ix";
connectAttr "fingersBend.thumbIk" "reverse4.iy";
connectAttr "fingersBend.middleIk" "reverse4.iz";
connectAttr "fingersBend.ringIk" "reverse5.ix";
connectAttr "fingersBend.pinkyIk" "reverse5.iy";
connectAttr "root_poser.wm" "multMatrix57.i[0]";
connectAttr "center_loc.wim" "multMatrix57.i[1]";
connectAttr "mirror_condition.ocg" "unitConversion1458.i";
connectAttr "fingersBend.spread" "blendMatrix19.env";
connectAttr "thumbFinger_1_spread.m" "blendMatrix19.tgt[0].tmat";
connectAttr "fingersBend.spread" "blendMatrix20.env";
connectAttr "indexFinger_1_spread.m" "blendMatrix20.tgt[0].tmat";
connectAttr "fingersBend.spread" "blendMatrix21.env";
connectAttr "pinkyFinger_1_spread.m" "blendMatrix21.tgt[0].tmat";
connectAttr "fingersBend.spread" "blendMatrix22.env";
connectAttr "ringFinger_1_spread.m" "blendMatrix22.tgt[0].tmat";
connectAttr "fingersBend.spread" "blendMatrix23.env";
connectAttr "middleFinger_1_spread.m" "blendMatrix23.tgt[0].tmat";
connectAttr "indexFingerD_poser.wm" "multMatrix58.i[0]";
connectAttr "indexFingerC_poser.wim" "multMatrix58.i[1]";
connectAttr "multMatrix58.o" "decomposeMatrix21.imat";
connectAttr "indexFingerC_poser.wm" "multMatrix59.i[0]";
connectAttr "root_poser.wim" "multMatrix59.i[1]";
connectAttr "middleFingerD_poser.wm" "multMatrix60.i[0]";
connectAttr "middleFingerC_poser.wim" "multMatrix60.i[1]";
connectAttr "multMatrix60.o" "decomposeMatrix22.imat";
connectAttr "multMatrix62.o" "decomposeMatrix23.imat";
connectAttr "pinkyFingerD_poser.wm" "multMatrix61.i[0]";
connectAttr "pinkyFingerC_poser.wim" "multMatrix61.i[1]";
connectAttr "multMatrix61.o" "decomposeMatrix24.imat";
connectAttr "ringFingerD_poser.wm" "multMatrix62.i[0]";
connectAttr "ringFingerC_poser.wim" "multMatrix62.i[1]";
connectAttr "thumbFingerD_poser.wm" "multMatrix63.i[0]";
connectAttr "thumbFingerC_poser.wim" "multMatrix63.i[1]";
connectAttr "multMatrix63.o" "decomposeMatrix25.imat";
connectAttr "middleFingerC_poser.wm" "multMatrix64.i[0]";
connectAttr "root_poser.wim" "multMatrix64.i[1]";
connectAttr "ringFingerC_poser.wm" "multMatrix65.i[0]";
connectAttr "root_poser.wim" "multMatrix65.i[1]";
connectAttr "pinkyFingerC_poser.wm" "multMatrix66.i[0]";
connectAttr "root_poser.wim" "multMatrix66.i[1]";
connectAttr "thumbFingerC_poser.wm" "multMatrix67.i[0]";
connectAttr "root_poser.wim" "multMatrix67.i[1]";
connectAttr "fk_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "root_connector_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "root_connector_group_scaleConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "ik_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "reverse3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "thumbFinger_spread_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "setRange4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "blendMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "thumbFinger_2_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "clamp2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "thumbFinger_3_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "multMatrix11.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "setRange2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "index_addDoubleLinear.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "decomposeMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "blendMatrix13.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn";
connectAttr "blendMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn";
connectAttr "middleFinger_1_group_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "multMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn";
connectAttr "composeMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn";
connectAttr "setRange7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn";
connectAttr "indexFinger_1_group_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "ringFinger_3_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn"
		;
connectAttr "blendMatrix10.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn";
connectAttr "setRange3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn";
connectAttr "multDoubleLinear45.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "multDoubleLinear44.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn"
		;
connectAttr "decomposeMatrix10.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "multMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn";
connectAttr "fingersBend.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn";
connectAttr "unitConversion1454.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn"
		;
connectAttr "multMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn";
connectAttr "unitConversion1452.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn"
		;
connectAttr "decomposeMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn"
		;
connectAttr "blendMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn";
connectAttr "multMatrix13.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[30].dn";
connectAttr "pinkyFinger_3_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[31].dn"
		;
connectAttr "multMatrix16.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[32].dn";
connectAttr "ringFinger_1_group_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[33].dn"
		;
connectAttr "decomposeMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[34].dn"
		;
connectAttr "decomposeMatrix15.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[35].dn"
		;
connectAttr "blendMatrix5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[36].dn";
connectAttr "unitConversion1450.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[37].dn"
		;
connectAttr "blendMatrix15.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[38].dn";
connectAttr "multMatrix9.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[39].dn";
connectAttr "blendMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[40].dn";
connectAttr "multMatrix15.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[41].dn";
connectAttr "decomposeMatrix13.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[42].dn"
		;
connectAttr "addDoubleLinear2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[43].dn"
		;
connectAttr "multDoubleLinear42.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[44].dn"
		;
connectAttr "indexFinger_2_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[45].dn"
		;
connectAttr "unitConversion1455.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[46].dn"
		;
connectAttr "blendMatrix9.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[47].dn";
connectAttr "decomposeMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[48].dn"
		;
connectAttr "decomposeMatrix9.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[49].dn"
		;
connectAttr "blendMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[50].dn";
connectAttr "setRange1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[51].dn";
connectAttr "pinkyFinger_1_group_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[52].dn"
		;
connectAttr "composeMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[53].dn";
connectAttr "clamp1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[54].dn";
connectAttr "composeMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[55].dn";
connectAttr "blendMatrix11.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[56].dn";
connectAttr "multMatrix10.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[57].dn";
connectAttr "middleFinger_3_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[58].dn"
		;
connectAttr "unitConversion1453.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[59].dn"
		;
connectAttr "middleFinger_2_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[60].dn"
		;
connectAttr "unitConversion1457.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[61].dn"
		;
connectAttr "setRange5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[62].dn";
connectAttr "blendMatrix8.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[63].dn";
connectAttr "addDoubleLinear1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[64].dn"
		;
connectAttr "blendMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[65].dn";
connectAttr "multMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[66].dn";
connectAttr "fingersBendShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[67].dn"
		;
connectAttr "decomposeMatrix5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[68].dn"
		;
connectAttr "pinkyFinger_2_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[69].dn"
		;
connectAttr "blendMatrix12.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[70].dn";
connectAttr "composeMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[71].dn";
connectAttr "multMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[72].dn";
connectAttr "multMatrix8.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[73].dn";
connectAttr "moduleControlSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[74].dn"
		;
connectAttr "blendMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[75].dn";
connectAttr "index_addDoubleLinear1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[76].dn"
		;
connectAttr "setRange6.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[77].dn";
connectAttr "decomposeMatrix11.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[78].dn"
		;
connectAttr "unitConversion1451.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[79].dn"
		;
connectAttr "thumbFinger_1_group_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[80].dn"
		;
connectAttr "multMatrix5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[81].dn";
connectAttr "multMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[82].dn";
connectAttr "indexFinger_3_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[83].dn"
		;
connectAttr "decomposeMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[84].dn"
		;
connectAttr "multMatrix12.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[85].dn";
connectAttr "multDoubleLinear43.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[86].dn"
		;
connectAttr "composeMatrix5.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[87].dn";
connectAttr "ringFinger_2_group_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[88].dn"
		;
connectAttr "fingersBend.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "mod_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "multDoubleLinear39.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "multDoubleLinear34.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "fingers_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn";
connectAttr "middleFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn";
connectAttr "middleFinger_2_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn"
		;
connectAttr "middleFinger_3_outJoint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "middleFinger_3.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn";
connectAttr "middleFinger_2_ikJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "unitConversion1458.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn"
		;
connectAttr "middleFinger_3_ikJoint_orientConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn"
		;
connectAttr "middleFinger_3_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[13].dn"
		;
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[14].dn";
connectAttr "reverse1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[15].dn";
connectAttr "middleFinger_3_ikJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[16].dn"
		;
connectAttr "thumbFinger_2_outJoint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[0].dn"
		;
connectAttr "unitConversion1458.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[1].dn"
		;
connectAttr "thumbFinger_3_outJoint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[2].dn"
		;
connectAttr "thumbFinger_1_outJoint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[3].dn"
		;
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[4].dn"
		;
connectAttr "root_outJoint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[3].ni[5].dn"
		;
connectAttr "fingersBend.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[0].dn";
connectAttr "thumbFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[4].ni[1].dn";
connectAttr "decomposeMatrix25.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[0].dn"
		;
connectAttr "thumbFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[1].dn"
		;
connectAttr "thumbFinger_ikShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[2].dn"
		;
connectAttr "multMatrix63.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[3].dn";
connectAttr "thumbFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[4].dn";
connectAttr "fingersBend.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[5].dn";
connectAttr "thumbFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[6].dn"
		;
connectAttr "pinkyFinger_ikShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[7].dn"
		;
connectAttr "middleFinger_ikShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[8].dn"
		;
connectAttr "ringFinger_ikShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[9].dn"
		;
connectAttr "indexFinger_ikShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[5].ni[10].dn"
		;
connectAttr "pinkyFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[0].dn";
connectAttr "middleFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[1].dn";
connectAttr "pinkyFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[2].dn"
		;
connectAttr "middleFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[3].dn"
		;
connectAttr "middleFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[4].dn"
		;
connectAttr "pinkyFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[5].dn"
		;
connectAttr "multMatrix60.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[6].dn";
connectAttr "decomposeMatrix22.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[7].dn"
		;
connectAttr "multMatrix61.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[8].dn";
connectAttr "multMatrix62.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[9].dn";
connectAttr "ringFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[10].dn"
		;
connectAttr "ringFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[11].dn";
connectAttr "decomposeMatrix24.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[12].dn"
		;
connectAttr "decomposeMatrix23.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[13].dn"
		;
connectAttr "ringFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[14].dn"
		;
connectAttr "thumbFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[15].dn";
connectAttr "thumbFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[16].dn"
		;
connectAttr "decomposeMatrix25.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[17].dn"
		;
connectAttr "thumbFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[18].dn"
		;
connectAttr "multMatrix63.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[19].dn";
connectAttr "indexFinger_ik.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[20].dn";
connectAttr "multMatrix58.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[21].dn";
connectAttr "indexFingerD_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[22].dn"
		;
connectAttr "indexFingerC_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[23].dn"
		;
connectAttr "decomposeMatrix21.msg" "MayaNodeEditorSavedTabsInfo.tgi[6].ni[24].dn"
		;
connectAttr "root_connector_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear28.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear29.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear34.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear35.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear36.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear37.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear38.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear39.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear40.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear41.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "index_addDoubleLinear.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "index_addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear43.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear44.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear45.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix27.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix28.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix29.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix32.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix33.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix34.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix35.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix36.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix37.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix38.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix39.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix40.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix41.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix43.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix44.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix45.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix46.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix48.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix49.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix50.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix51.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix52.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix53.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix54.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix55.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix56.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix57.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix58.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix59.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix60.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix61.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix62.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix63.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix64.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix65.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix66.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix67.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikSCsolver.msg" ":ikSystem.sol" -na;
// End of fingersIK.ma
