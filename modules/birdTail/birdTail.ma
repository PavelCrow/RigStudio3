//Maya ASCII 2022 scene
//Name: birdTail.ma
//Last modified: Tue, Sep 29, 2026 05:59:31 AM
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
fileInfo "UUID" "73BEE2E8-4B85-EA3D-4722-36BC70A301FB";
createNode transform -n "mod";
	rename -uid "A8281E66-4053-4FC7-AA21-27BF6ABE5693";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "5398EABE-47D0-16C1-DA73-F0819DD934A9";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "51616D80-472B-390A-B2E9-3AB55B869EED";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 0.1 -min 0 -at "double";
	addAttr -ci true -sn "spreadOpen" -ln "spreadOpen" -dv 75 -min 0 -at "double";
	addAttr -ci true -sn "spreadClose" -ln "spreadClose" -dv 40 -min 0 -at "double";
	addAttr -ci true -sn "spreadDip" -ln "spreadDip" -dv 13.5 -min 0 -at "double";
	addAttr -ci true -sn "bendUp" -ln "bendUp" -dv 160 -min 0 -at "double";
	addAttr -ci true -sn "bendUpEdge" -ln "bendUpEdge" -dv 104.64 -min 0 -at "double";
	addAttr -ci true -sn "bendDown" -ln "bendDown" -dv 84 -min 0 -at "double";
	addAttr -ci true -sn "spreadRootOpen" -ln "spreadRootOpen" -dv 30 -min 0 -at "double";
	addAttr -ci true -sn "spreadRootClose" -ln "spreadRootClose" -dv 15 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.28;
	setAttr -k on ".lineSize" 0.05;
	setAttr -cb on ".spreadOpen";
	setAttr -cb on ".spreadClose";
	setAttr -cb on ".spreadDip";
	setAttr -cb on ".bendUp";
	setAttr -cb on ".bendUpEdge";
	setAttr -cb on ".bendDown";
	setAttr -cb on ".spreadRootOpen";
	setAttr -cb on ".spreadRootClose";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "BAA9754C-478D-CD33-F76E-DCBCC0015F00";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "679B8E09-405B-E15A-4B50-7499D3F8522A";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.999969408382826 0.99996939565572474 0.99996928353915271
		-0.999969408382826 0.99996939565572474 -0.99996929584191807
		0.99996917099824745 0.99996939565572474 -0.99996929584191807
		0.99996917099824745 0.99996939565572474 0.99996928353915271
		-0.999969408382826 0.99996939565572474 0.99996928353915271
		0.99996917099824745 0.99996939565572474 0.99996928353915271
		0.99996917099824745 -0.9999691837253426 0.99996928353915271
		-0.999969408382826 -0.9999691837253426 0.99996928353915271
		-0.999969408382826 0.99996939565572474 0.99996928353915271
		-0.999969408382826 -0.9999691837253426 0.99996928353915271
		-0.999969408382826 -0.9999691837253426 -0.99996929584191807
		-0.999969408382826 0.99996939565572474 -0.99996929584191807
		-0.999969408382826 -0.9999691837253426 -0.99996929584191807
		0.99996917099824745 -0.9999691837253426 -0.99996929584191807
		0.99996917099824745 0.99996939565572474 -0.99996929584191807
		0.99996917099824745 -0.9999691837253426 -0.99996929584191807
		0.99996917099824745 -0.9999691837253426 0.99996928353915271
		;
createNode transform -n "mainPoser_clusterHandle" -p "mainPoser";
	rename -uid "762B38FB-4F8B-4A2B-FC90-419FB9790A3F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr -l on ".moduleName" -type "string" "";
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "FF066C3B-4713-4457-680A-67A210A671A8";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "85D0ECB0-4F27-CE72-CC5E-8FA394BCC264";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.4;
	setAttr -l on ".moduleName" -type "string" "root";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "A6C9FD9A-4833-078E-1654-41B887FCA3E1";
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
	rename -uid "C6FD4AE5-4781-A028-F4F7-FA9CD9E8AA03";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on ".moduleName" -type "string" "root";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "EB66DA30-4DB3-9B2D-5AF2-DC8F6E02B141";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_initLoc" -p "root_poserOrient";
	rename -uid "F1EEB7FF-4FE9-8F92-7389-35A9D7086A7E";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "563A816C-451E-A521-88F0-ACBEA84AE101";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_mainPoser" -p "mainPoser";
	rename -uid "1F2FA706-4FBF-BF6A-2CA8-C595FC9C567B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0 0.42332 0.11666 ;
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "m_feather_mainPoserShape" -p "m_feather_mainPoser";
	rename -uid "768673CA-4354-89D8-72CB-53AD5CE0CE80";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "m_feather_mainPoserShapeOrig" -p "m_feather_mainPoser";
	rename -uid "70278014-4F92-40AE-F433-1394DC555D69";
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
createNode transform -n "m_feather_mainPoser_clusterHandle" -p "m_feather_mainPoser";
	rename -uid "DB2A622E-4D61-D094-B5A7-AD98186183B4";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "m_feather_mainPoser_clusterHandleShape" -p "m_feather_mainPoser_clusterHandle";
	rename -uid "9FA5CB38-4F40-4338-C545-F38E243C2FF7";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "m_feather_1_poser" -p "m_feather_mainPoser";
	rename -uid "8614BA7C-4F56-0DEA-855D-B2964B3DF357";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.15;
createNode nurbsSurface -n "m_feather_1_poserNurbsShape" -p "m_feather_1_poser";
	rename -uid "1D35EC2E-4B62-8582-8301-E59A552CD4A0";
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
createNode transform -n "m_feather_1_poserOrient" -p "m_feather_1_poser";
	rename -uid "2290EB22-4D43-AC85-BAB4-568395868D42";
createNode locator -n "m_feather_1_poserOrientShape" -p "m_feather_1_poserOrient";
	rename -uid "1D55A20D-4AD5-B942-A10F-4D98FE211207";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_1_initLoc" -p "m_feather_1_poserOrient";
	rename -uid "0CF3BCDB-4E5D-2239-C0DE-0B98E13FD47A";
	setAttr ".v" no;
createNode locator -n "m_feather_1_initLocShape" -p "m_feather_1_initLoc";
	rename -uid "9B28F0CC-4A33-8009-3954-E3B91468A8B3";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_1_poserOrient_aimConstraint1" -p "m_feather_1_poserOrient";
	rename -uid "40DA6B93-4C1B-39B1-2972-36B9958A93F3";
	addAttr -dcb 0 -ci true -sn "w0" -ln "m_feather_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "m_feather_2_poser" -p "m_feather_mainPoser";
	rename -uid "4EFEEAF4-4076-5E24-07AE-CFB6AAAECDEE";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.30813 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.15;
createNode nurbsSurface -n "m_feather_2_poserNurbsShape" -p "m_feather_2_poser";
	rename -uid "BAB92AF2-42A0-1E8C-213A-A5B37BDECC26";
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
createNode transform -n "m_feather_2_poserOrient" -p "m_feather_2_poser";
	rename -uid "0C2FF9E3-4360-E86C-A5D1-87BFCC8040A2";
createNode locator -n "m_feather_2_poserOrientShape" -p "m_feather_2_poserOrient";
	rename -uid "DE7AC6C4-4300-7759-FAC2-88AD11BF43CB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_2_initLoc" -p "m_feather_2_poserOrient";
	rename -uid "29CBA781-41A3-7AE7-8365-D68CBFB57581";
	setAttr ".v" no;
createNode locator -n "m_feather_2_initLocShape" -p "m_feather_2_initLoc";
	rename -uid "AAB7B89E-4877-C9D8-C2A8-FDA23D07D8D0";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_2_poserOrient_aimConstraint1" -p "m_feather_2_poserOrient";
	rename -uid "D7A4EE4F-4973-2D9C-1264-6D8B01B261AD";
	addAttr -dcb 0 -ci true -sn "w0" -ln "m_feather_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "m_feather_3_poser" -p "m_feather_mainPoser";
	rename -uid "4909A76E-487B-A24A-3432-14875DB782D6";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.61626 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.15;
createNode nurbsSurface -n "m_feather_3_poserNurbsShape" -p "m_feather_3_poser";
	rename -uid "7BFEB7B3-4BEE-4685-1ED7-A19487B5C43F";
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
createNode transform -n "m_feather_3_poserOrient" -p "m_feather_3_poser";
	rename -uid "318471A1-4343-0AC3-EB66-E69BFF112672";
createNode locator -n "m_feather_3_poserOrientShape" -p "m_feather_3_poserOrient";
	rename -uid "03BB17B4-4430-250A-C1D7-D49A7E5A75C9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_3_initLoc" -p "m_feather_3_poserOrient";
	rename -uid "4AD0E118-416E-5B63-6BE5-8DAD656C1AF7";
	setAttr ".v" no;
createNode locator -n "m_feather_3_initLocShape" -p "m_feather_3_initLoc";
	rename -uid "40D2788E-4750-027B-12FE-BF8B0E8906C5";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_3_poserOrient_aimConstraint1" -p "m_feather_3_poserOrient";
	rename -uid "F1C24613-4A76-3E35-6FA6-108E59B0CB52";
	addAttr -dcb 0 -ci true -sn "w0" -ln "m_feather_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "m_feather_4_poser" -p "m_feather_mainPoser";
	rename -uid "223D7F97-43D0-B6D1-8B36-8AA7FFCD6F30";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.9244 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.15;
createNode nurbsSurface -n "m_feather_4_poserNurbsShape" -p "m_feather_4_poser";
	rename -uid "4A9ABC2C-45A8-F760-2FDC-FFA681F92FB0";
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
createNode transform -n "m_feather_4_poserOrient" -p "m_feather_4_poser";
	rename -uid "F538A01F-44F1-8F95-7CA0-5F8958E4BCDC";
createNode locator -n "m_feather_4_poserOrientShape" -p "m_feather_4_poserOrient";
	rename -uid "F4498B70-41F1-2D9D-6007-B39F62952307";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_4_initLoc" -p "m_feather_4_poserOrient";
	rename -uid "9CF26D5E-41CB-88E9-D09D-90823255B32C";
	setAttr ".v" no;
createNode locator -n "m_feather_4_initLocShape" -p "m_feather_4_initLoc";
	rename -uid "BF40D17A-4421-B020-9ABC-FD93E81CF1BD";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_4_poserOrient_aimConstraint1" -p "m_feather_4_poserOrient";
	rename -uid "3E4E87AC-45B0-8718-302F-A8A727F46D5B";
	addAttr -dcb 0 -ci true -sn "w0" -ln "m_feather_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "m_feather_5_poser" -p "m_feather_mainPoser";
	rename -uid "47D2F008-46B4-90A4-3B20-EB8BF162A558";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.23253 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.15;
createNode nurbsSurface -n "m_feather_5_poserNurbsShape" -p "m_feather_5_poser";
	rename -uid "33CFF8AF-4FAD-B848-614B-28A0A9D9F834";
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
createNode transform -n "m_feather_5_poserOrient" -p "m_feather_5_poser";
	rename -uid "D261365D-4320-51C7-AF5F-C0813EF3BA48";
createNode locator -n "m_feather_5_poserOrientShape" -p "m_feather_5_poserOrient";
	rename -uid "9459AB5E-4FEE-4FA5-488D-13A2A08D0F09";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_5_initLoc" -p "m_feather_5_poserOrient";
	rename -uid "E776BEED-4164-A3D0-BA5A-54AC753AF85F";
	setAttr ".v" no;
createNode locator -n "m_feather_5_initLocShape" -p "m_feather_5_initLoc";
	rename -uid "84B7E1F4-481A-D7FB-5E98-B6B6BFCB57B1";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_5_poserOrient_aimConstraint1" -p "m_feather_5_poserOrient";
	rename -uid "2598F0A7-4355-7500-FC70-7283E3D98AEC";
	addAttr -dcb 0 -ci true -sn "w0" -ln "m_feather_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "m_feather_end_poser" -p "m_feather_mainPoser";
	rename -uid "B8D0DC55-4DBE-4D8C-268B-FA9CB15BB2A0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 6.08278 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.15;
createNode nurbsSurface -n "m_feather_end_poserNurbsShape" -p "m_feather_end_poser";
	rename -uid "241ACD9B-40FA-49ED-6AC1-1A8529D1112E";
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
createNode transform -n "m_feather_end_poserOrient" -p "m_feather_end_poser";
	rename -uid "AD9090B5-43A6-C589-CF1E-7C941C33E1EC";
createNode locator -n "m_feather_end_poserOrientShape" -p "m_feather_end_poserOrient";
	rename -uid "722DB16A-4E00-3116-62C5-2F85DA84405C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_end_initLoc" -p "m_feather_end_poserOrient";
	rename -uid "ADEE375D-4CE9-70A9-4EDC-41A960FBC14E";
	setAttr ".v" no;
createNode locator -n "m_feather_end_initLocShape" -p "m_feather_end_initLoc";
	rename -uid "471CD61E-4058-3D37-4E66-3DBD707DB6C3";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_end_poserOrient_aimConstraint1" -p "m_feather_end_poserOrient";
	rename -uid "74CF82AC-4883-F1B9-9BFD-D19B902FAB3C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "m_feather_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "main_1_poser" -p "m_feather_mainPoser";
	rename -uid "10985704-405F-659B-34C4-27B091922CCC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.30813 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
createNode nurbsSurface -n "main_1_poserNurbsShape" -p "main_1_poser";
	rename -uid "E77C8FCC-4447-11D6-30F8-FC9C47760E7E";
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
createNode transform -n "main_1_poserOrient" -p "main_1_poser";
	rename -uid "B5CE6AD1-41C3-6E13-C373-D6B088C4F018";
createNode locator -n "main_1_poserOrientShape" -p "main_1_poserOrient";
	rename -uid "9FD1ACD8-486A-729B-797B-8EB7E0D3966D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_1_initLoc" -p "main_1_poserOrient";
	rename -uid "F873289E-4BF5-D9EC-6B26-888687B5FC7D";
	setAttr ".v" no;
createNode locator -n "main_1_initLocShape" -p "main_1_initLoc";
	rename -uid "7B499A69-44B3-CE38-49D6-30903F08DCD4";
	setAttr -k off ".v";
createNode orientConstraint -n "main_1_poserOrient_orientConstraint1" -p "main_1_poserOrient";
	rename -uid "102B328E-45DE-6DC2-C43B-82BAEF88587A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "m_feather_2_initLocW0" -dv 1 -min 
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
	setAttr -k on ".w0";
createNode transform -n "main_2_poser" -p "m_feather_mainPoser";
	rename -uid "C830D507-422B-8BE4-6253-D8B9AE762775";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.61626 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
createNode nurbsSurface -n "main_2_poserNurbsShape" -p "main_2_poser";
	rename -uid "7AEFEE2A-4DB0-784A-3563-B3945DF5886F";
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
createNode transform -n "main_2_poserOrient" -p "main_2_poser";
	rename -uid "FF791464-48D7-D8AD-09D5-3590C9ED268A";
createNode locator -n "main_2_poserOrientShape" -p "main_2_poserOrient";
	rename -uid "CA32C31D-41A0-757B-7CDF-60BF840457AE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_2_initLoc" -p "main_2_poserOrient";
	rename -uid "7F201CC9-47E4-64BF-4AD5-2199A1A2D267";
	setAttr ".v" no;
createNode locator -n "main_2_initLocShape" -p "main_2_initLoc";
	rename -uid "A456CC3E-4120-C313-A500-4087B1F08163";
	setAttr -k off ".v";
createNode orientConstraint -n "main_2_poserOrient_orientConstraint1" -p "main_2_poserOrient";
	rename -uid "B10896EC-4864-BD5B-9F56-70AD70CA402A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "m_feather_3_initLocW0" -dv 1 -min 
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
	setAttr -k on ".w0";
createNode transform -n "main_3_poser" -p "m_feather_mainPoser";
	rename -uid "4686F3F1-4C6D-3088-2C58-0A9F0EE92FB9";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.9244 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
createNode nurbsSurface -n "main_3_poserNurbsShape" -p "main_3_poser";
	rename -uid "19FB936F-4845-B3FE-2C22-C194F294BFDA";
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
createNode transform -n "main_3_poserOrient" -p "main_3_poser";
	rename -uid "68AED544-4F43-A550-F714-DE98F115ED2F";
createNode locator -n "main_3_poserOrientShape" -p "main_3_poserOrient";
	rename -uid "AD61D5E2-4A9C-4C1A-5A1F-8691322B8464";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_3_initLoc" -p "main_3_poserOrient";
	rename -uid "658908A7-4E59-295C-1EB3-81A5AC1C286D";
	setAttr ".v" no;
createNode locator -n "main_3_initLocShape" -p "main_3_initLoc";
	rename -uid "81784801-47E2-3D19-5D76-82B06223033E";
	setAttr -k off ".v";
createNode orientConstraint -n "main_3_poserOrient_orientConstraint1" -p "main_3_poserOrient";
	rename -uid "F0224BDE-4780-F966-0032-EDB004539BFC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "m_feather_4_initLocW0" -dv 1 -min 
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
	setAttr -k on ".w0";
createNode transform -n "main_4_poser" -p "m_feather_mainPoser";
	rename -uid "EC9A1D7D-42B4-D8AD-D542-8F8615947F4B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.23253 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.25;
createNode nurbsSurface -n "main_4_poserNurbsShape" -p "main_4_poser";
	rename -uid "6F9038A2-42CC-9167-320E-80A51DA05EAB";
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
createNode transform -n "main_4_poserOrient" -p "main_4_poser";
	rename -uid "AAC23BDC-4817-A447-2780-FDB22684B190";
createNode locator -n "main_4_poserOrientShape" -p "main_4_poserOrient";
	rename -uid "95BF5E58-4FD1-A6AE-FDD1-2BA8E914E5D2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_4_initLoc" -p "main_4_poserOrient";
	rename -uid "AD7168D2-4334-4F21-BE5E-679EC7CEE4A4";
	setAttr ".v" no;
createNode locator -n "main_4_initLocShape" -p "main_4_initLoc";
	rename -uid "FB944C6B-414B-2F0F-61E3-AA813F8B855B";
	setAttr -k off ".v";
createNode orientConstraint -n "main_4_poserOrient_orientConstraint1" -p "main_4_poserOrient";
	rename -uid "38A18F76-4671-5F4B-B94A-D4B1B9FD9E88";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "m_feather_5_initLocW0" -dv 1 -min 
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
	setAttr -k on ".w0";
createNode transform -n "l_feather_1_mainPoser" -p "mainPoser";
	rename -uid "F9F3CB81-4398-5302-F524-A19A851C44D7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.17682 0.40194 0.08633 ;
	setAttr ".r" -type "double3" 21.6428 83.3795 -6.34852 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_1_mainPoserShape" -p "l_feather_1_mainPoser";
	rename -uid "584DDD32-41AD-C06F-6804-B2AEEE9CE953";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_1_mainPoserShapeOrig" -p "l_feather_1_mainPoser";
	rename -uid "728B0421-453D-9BD3-7A40-37A60C22326B";
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
createNode transform -n "l_feather_1_mainPoser_clusterHandle" -p "l_feather_1_mainPoser";
	rename -uid "EA4F7F80-461F-8F9E-A9A4-0A9FE0C87B97";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_1_mainPoser_clusterHandleShape" -p "l_feather_1_mainPoser_clusterHandle";
	rename -uid "74C8FDCE-4358-9B85-8F3D-F0B70D8C1872";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_1_1_poser" -p "l_feather_1_mainPoser";
	rename -uid "0AA97D32-4C33-B04D-1C48-17930B2610CC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_1_1_poserNurbsShape" -p "l_feather_1_1_poser";
	rename -uid "D6157AF9-4F38-89E6-7C06-D1B1C51F0073";
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
createNode transform -n "l_feather_1_1_poserOrient" -p "l_feather_1_1_poser";
	rename -uid "456E4739-4E52-3EEE-B2C0-4A9315AB32E2";
createNode locator -n "l_feather_1_1_poserOrientShape" -p "l_feather_1_1_poserOrient";
	rename -uid "A3303119-4AD9-EB38-6235-6BAA7D7A98AA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_1_initLoc" -p "l_feather_1_1_poserOrient";
	rename -uid "3E146F22-4E92-203B-4290-25A22EDC1276";
	setAttr ".v" no;
createNode locator -n "l_feather_1_1_initLocShape" -p "l_feather_1_1_initLoc";
	rename -uid "85B29FC1-46DE-DCE4-A6DC-A39E0D55C1F6";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_1_poserOrient_aimConstraint1" -p "l_feather_1_1_poserOrient";
	rename -uid "12BF6D48-4AA3-E5EB-D0B0-0EBE5EA2A669";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_1_1_fanLoc" -p "l_feather_1_1_poser";
	rename -uid "226ACC3F-486B-1772-E5AA-879B574DBC06";
	setAttr ".v" no;
createNode locator -n "l_feather_1_1_fanLocShape" -p "l_feather_1_1_fanLoc";
	rename -uid "61C7A5E7-46E8-ADF8-0F16-FF88E9E35FC2";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_1_fanLoc_aimConstraint1" -p "l_feather_1_1_fanLoc";
	rename -uid "4E0A8C73-4F53-06E2-794A-2DB44BD9C921";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -21.082186929272641 -1.6385408708226023e-15 1.2394949849464825e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_1_2_poser" -p "l_feather_1_mainPoser";
	rename -uid "D6B5D951-4FAD-1A7B-734E-9B8A7399CA28";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.26652 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_1_2_poserNurbsShape" -p "l_feather_1_2_poser";
	rename -uid "5CD3627F-4205-42F0-B801-1580B9906D3C";
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
createNode transform -n "l_feather_1_2_poserOrient" -p "l_feather_1_2_poser";
	rename -uid "D483BBA1-42FB-4EDA-D39F-A794A1943825";
createNode locator -n "l_feather_1_2_poserOrientShape" -p "l_feather_1_2_poserOrient";
	rename -uid "8E1E5979-41D5-87E0-ED37-B89EA512D8F0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_2_initLoc" -p "l_feather_1_2_poserOrient";
	rename -uid "09F2BE25-45E8-0440-AFA5-47A5F7DB9E80";
	setAttr ".v" no;
createNode locator -n "l_feather_1_2_initLocShape" -p "l_feather_1_2_initLoc";
	rename -uid "253E56B6-470D-DBD7-0563-409B98B232A9";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_2_poserOrient_aimConstraint1" -p "l_feather_1_2_poserOrient";
	rename -uid "87A6D6AF-47AB-44B4-3A59-C38694ECB275";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_1_2_fanLoc" -p "l_feather_1_2_poser";
	rename -uid "B8D60528-4232-E2D2-975A-1E9BB7D6A35B";
	setAttr ".v" no;
createNode locator -n "l_feather_1_2_fanLocShape" -p "l_feather_1_2_fanLoc";
	rename -uid "F163E1D3-4B0C-7376-B7A8-CAA8079259B6";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_2_fanLoc_aimConstraint1" -p "l_feather_1_2_fanLoc";
	rename -uid "D3A2C258-41C5-55D2-E227-25A00B993F0E";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -21.342950454749545 1.9786373215305872e-15 4.5527340805054048e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_1_3_poser" -p "l_feather_1_mainPoser";
	rename -uid "F0BDB2F1-41B4-34B4-AE87-298B7B09192B";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.53304 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_1_3_poserNurbsShape" -p "l_feather_1_3_poser";
	rename -uid "E6178F2A-4580-A236-0EB6-E48393DEDE4B";
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
createNode transform -n "l_feather_1_3_poserOrient" -p "l_feather_1_3_poser";
	rename -uid "47D224F1-43E4-276A-8DBB-09BEE8D2E648";
createNode locator -n "l_feather_1_3_poserOrientShape" -p "l_feather_1_3_poserOrient";
	rename -uid "EB620F3E-431F-AAB9-8E1E-A8905ADCFF68";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_3_initLoc" -p "l_feather_1_3_poserOrient";
	rename -uid "E0716629-4312-E5E8-E638-649AA1189220";
	setAttr ".v" no;
createNode locator -n "l_feather_1_3_initLocShape" -p "l_feather_1_3_initLoc";
	rename -uid "2625929D-4FB5-0FA8-1AE5-43B8C4243003";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_3_poserOrient_aimConstraint1" -p "l_feather_1_3_poserOrient";
	rename -uid "617503CE-4926-CD2D-F2DF-EA8D36938D4A";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_1_3_fanLoc" -p "l_feather_1_3_poser";
	rename -uid "112D21E0-43D8-5711-6F0F-969CCCA9FB79";
	setAttr ".v" no;
createNode locator -n "l_feather_1_3_fanLocShape" -p "l_feather_1_3_fanLoc";
	rename -uid "9D57708F-440F-4ACD-D76B-F4972B30890E";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_3_fanLoc_aimConstraint1" -p "l_feather_1_3_fanLoc";
	rename -uid "714040FA-4970-1FEC-2668-BFAAA43F4CB8";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -21.438144794676298 -2.992467247793149e-15 -7.4080977899593285e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_1_4_poser" -p "l_feather_1_mainPoser";
	rename -uid "78841172-40AE-6238-F4F1-2F85C2EA5155";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.79956 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_1_4_poserNurbsShape" -p "l_feather_1_4_poser";
	rename -uid "EBAB6377-4FE3-3B4C-92C3-3FBF79424913";
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
createNode transform -n "l_feather_1_4_poserOrient" -p "l_feather_1_4_poser";
	rename -uid "42FEA373-4AE6-7D08-22A8-8A875FC75FED";
createNode locator -n "l_feather_1_4_poserOrientShape" -p "l_feather_1_4_poserOrient";
	rename -uid "3647CD60-4B79-9363-A5C1-C995727B70A8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_4_initLoc" -p "l_feather_1_4_poserOrient";
	rename -uid "9D790F88-477B-1C9A-BCD9-57BA8FE94402";
	setAttr ".v" no;
createNode locator -n "l_feather_1_4_initLocShape" -p "l_feather_1_4_initLoc";
	rename -uid "7904AAC3-4CC1-E5DB-1474-13A06440FA9D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_4_poserOrient_aimConstraint1" -p "l_feather_1_4_poserOrient";
	rename -uid "30EC8E0C-482F-75FB-4ECF-49ABB1C5AF30";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_1_4_fanLoc" -p "l_feather_1_4_poser";
	rename -uid "2CAA4734-4921-066B-F226-9FAFFB36159E";
	setAttr ".v" no;
createNode locator -n "l_feather_1_4_fanLocShape" -p "l_feather_1_4_fanLoc";
	rename -uid "391D27F6-4619-DB50-F94C-C3868373D5AF";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_4_fanLoc_aimConstraint1" -p "l_feather_1_4_fanLoc";
	rename -uid "EBCDC957-4008-1FE7-939D-D3B50AA8535D";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -21.487461276625439 2.1817233603698813e-17 1.1498333599418435e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_1_5_poser" -p "l_feather_1_mainPoser";
	rename -uid "37625359-4DDC-B08E-C482-7CBDBE5D6CBC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.06608 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_1_5_poserNurbsShape" -p "l_feather_1_5_poser";
	rename -uid "DE7EEFEF-4582-9EF9-7917-69BE9C32130D";
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
createNode transform -n "l_feather_1_5_poserOrient" -p "l_feather_1_5_poser";
	rename -uid "BAA2F835-45AD-5279-EAFB-49A103F311F2";
createNode locator -n "l_feather_1_5_poserOrientShape" -p "l_feather_1_5_poserOrient";
	rename -uid "EC477554-4770-2B85-84F8-94B152711535";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_5_initLoc" -p "l_feather_1_5_poserOrient";
	rename -uid "695F6A2A-4E69-FEEE-731C-6394067906F1";
	setAttr ".v" no;
createNode locator -n "l_feather_1_5_initLocShape" -p "l_feather_1_5_initLoc";
	rename -uid "2F52CE54-4187-B57B-0415-D1AAFCC9B3EA";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_5_poserOrient_aimConstraint1" -p "l_feather_1_5_poserOrient";
	rename -uid "2661A1B3-4AE3-6AB7-90C9-128ABEE8C3C7";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_1_5_fanLoc" -p "l_feather_1_5_poser";
	rename -uid "F0E43DD7-41B1-0789-90C9-4B80297E7260";
	setAttr ".v" no;
createNode locator -n "l_feather_1_5_fanLocShape" -p "l_feather_1_5_fanLoc";
	rename -uid "424BEB9E-4224-B3F8-5F7F-C9BB19018DEB";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_5_fanLoc_aimConstraint1" -p "l_feather_1_5_fanLoc";
	rename -uid "399BECC5-4B17-6BEF-8B9B-CE82A99E8108";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -21.517624953442535 5.825182736589667e-16 3.0656389878887156e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_1_end_poser" -p "l_feather_1_mainPoser";
	rename -uid "992D4A2C-425C-0637-BEBB-EBA54544E1A4";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.87472 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_1_end_poserNurbsShape" -p "l_feather_1_end_poser";
	rename -uid "420B32DD-4B9F-00F5-B9CF-2F8649F02076";
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
createNode transform -n "l_feather_1_end_poserOrient" -p "l_feather_1_end_poser";
	rename -uid "74757667-4564-FB39-8E42-C6A851930A53";
createNode locator -n "l_feather_1_end_poserOrientShape" -p "l_feather_1_end_poserOrient";
	rename -uid "6BE1F548-473C-6354-8177-EDBCF00FB5C1";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_end_initLoc" -p "l_feather_1_end_poserOrient";
	rename -uid "050EB617-4E55-EB1E-EDD7-02915184D53F";
	setAttr ".v" no;
createNode locator -n "l_feather_1_end_initLocShape" -p "l_feather_1_end_initLoc";
	rename -uid "B86C51B3-42D2-B6D9-54C7-19808734CDB9";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_end_poserOrient_aimConstraint1" -p "l_feather_1_end_poserOrient";
	rename -uid "4DD1B5D2-440C-AC1E-113E-0FA5FFF34869";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_1_end_fanLoc" -p "l_feather_1_end_poser";
	rename -uid "B0172267-40E9-1B2A-9C68-949C8F8DFE31";
	setAttr ".v" no;
createNode locator -n "l_feather_1_end_fanLocShape" -p "l_feather_1_end_fanLoc";
	rename -uid "5BC7A3AF-448D-7E03-B8F5-16868182E002";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_end_fanLoc_aimConstraint1" -p "l_feather_1_end_fanLoc";
	rename -uid "1078E112-4D56-E99F-B2FB-3A8F8BEDF9D0";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_1_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" -21.531653030764222 1.4092395289463196e-15 -4.5492325423736656e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_mainPoser" -p "mainPoser";
	rename -uid "2FF17CFC-4594-9ACB-93CF-A094159A5CD8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.27052 0.33467 0.28125 ;
	setAttr ".r" -type "double3" 33.12807 78.22911 -8.89706 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_2_mainPoserShape" -p "l_feather_2_mainPoser";
	rename -uid "E630B927-4B6B-DC0E-F153-9A8A7ADA85ED";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_2_mainPoserShapeOrig" -p "l_feather_2_mainPoser";
	rename -uid "A95A8C5B-4B06-3893-73E4-1BBDA8E0D9EF";
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
createNode transform -n "l_feather_2_mainPoser_clusterHandle" -p "l_feather_2_mainPoser";
	rename -uid "C660AB70-4806-5A0F-FC31-3994E0781B24";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_2_mainPoser_clusterHandleShape" -p "l_feather_2_mainPoser_clusterHandle";
	rename -uid "7222FBDF-43EC-98A2-448A-DF86C1C3C181";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_2_1_poser" -p "l_feather_2_mainPoser";
	rename -uid "C989C86E-49FB-33AE-44E3-BBA1CD53443F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_2_1_poserNurbsShape" -p "l_feather_2_1_poser";
	rename -uid "75FA2F73-4429-5C2E-1D71-26AB462983D9";
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
createNode transform -n "l_feather_2_1_poserOrient" -p "l_feather_2_1_poser";
	rename -uid "4D6E89B5-4007-73F7-EEBB-B389C1DA08D4";
createNode locator -n "l_feather_2_1_poserOrientShape" -p "l_feather_2_1_poserOrient";
	rename -uid "C9268BD1-4856-AF8A-5EEE-A687E6D40D66";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_1_initLoc" -p "l_feather_2_1_poserOrient";
	rename -uid "C6830795-46FD-92D9-15D4-C0AB643F9779";
	setAttr ".v" no;
createNode locator -n "l_feather_2_1_initLocShape" -p "l_feather_2_1_initLoc";
	rename -uid "8ACE4534-49BC-67BA-E383-759675498ACB";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_1_poserOrient_aimConstraint1" -p "l_feather_2_1_poserOrient";
	rename -uid "D01EBA49-45CF-3C3F-B874-6AA1242E0344";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_2_1_fanLoc" -p "l_feather_2_1_poser";
	rename -uid "E5221D1B-4053-5B00-4B5C-64B24B19757F";
	setAttr ".v" no;
createNode locator -n "l_feather_2_1_fanLocShape" -p "l_feather_2_1_fanLoc";
	rename -uid "8E7D16BD-41B0-C0A0-A780-869544FF06F5";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_1_fanLoc_aimConstraint1" -p "l_feather_2_1_fanLoc";
	rename -uid "40FDD19B-4E1A-3658-8816-05A45B6472BF";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -24.697488034927524 1.8231371051511422e-15 -1.702988393044994e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_2_poser" -p "l_feather_2_mainPoser";
	rename -uid "A29D81D3-4A65-43A6-B35C-6DA66344C2ED";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.26834 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_2_2_poserNurbsShape" -p "l_feather_2_2_poser";
	rename -uid "A7717104-4242-E8CE-0FDE-EA888FD57BC4";
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
createNode transform -n "l_feather_2_2_poserOrient" -p "l_feather_2_2_poser";
	rename -uid "D0A5986B-46B2-DFAD-13C9-C0A877BF1BE6";
createNode locator -n "l_feather_2_2_poserOrientShape" -p "l_feather_2_2_poserOrient";
	rename -uid "82C90D6A-4421-C004-6916-D798D2A07553";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_2_initLoc" -p "l_feather_2_2_poserOrient";
	rename -uid "84087239-4112-F3F3-AEFB-6AB6BAFA05C4";
	setAttr ".v" no;
createNode locator -n "l_feather_2_2_initLocShape" -p "l_feather_2_2_initLoc";
	rename -uid "C41CE3C3-4B90-39B8-C25D-96A3E9161BEE";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_2_poserOrient_aimConstraint1" -p "l_feather_2_2_poserOrient";
	rename -uid "55FB6224-4F5A-10BE-86A0-7F95502BB7F4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_2_2_fanLoc" -p "l_feather_2_2_poser";
	rename -uid "B3CCB78D-4164-FCF5-6466-B797F52D7F93";
	setAttr ".v" no;
createNode locator -n "l_feather_2_2_fanLocShape" -p "l_feather_2_2_fanLoc";
	rename -uid "89F1D57A-49B7-981C-2919-578B6DF05BB0";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_2_fanLoc_aimConstraint1" -p "l_feather_2_2_fanLoc";
	rename -uid "DED8079E-4D4D-6E62-5563-35BC2838BA20";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -28.583352036304944 -1.3371096713337027e-16 -5.2488761270789588e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_3_poser" -p "l_feather_2_mainPoser";
	rename -uid "302C621F-4E2B-7968-853C-48890E9CD7AA";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.53669 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_2_3_poserNurbsShape" -p "l_feather_2_3_poser";
	rename -uid "7852089B-4D35-6D20-F626-29933ECBE8BD";
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
createNode transform -n "l_feather_2_3_poserOrient" -p "l_feather_2_3_poser";
	rename -uid "D8455917-4547-F28F-D35D-8FBF2F6CF851";
createNode locator -n "l_feather_2_3_poserOrientShape" -p "l_feather_2_3_poserOrient";
	rename -uid "B492A62D-4CEE-9C08-99CF-E8A2EBE45F7D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_3_initLoc" -p "l_feather_2_3_poserOrient";
	rename -uid "7E95A7E3-4087-7A88-5537-E182E089F877";
	setAttr ".v" no;
createNode locator -n "l_feather_2_3_initLocShape" -p "l_feather_2_3_initLoc";
	rename -uid "A87B16DF-4A23-8C89-1D1C-31B4BC75ED0D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_3_poserOrient_aimConstraint1" -p "l_feather_2_3_poserOrient";
	rename -uid "D3E681F9-4ECF-D6CC-0F14-C8B46C04B46A";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_2_3_fanLoc" -p "l_feather_2_3_poser";
	rename -uid "A392F930-4D0D-6EAA-3ADC-AC93D7132A5B";
	setAttr ".v" no;
createNode locator -n "l_feather_2_3_fanLocShape" -p "l_feather_2_3_fanLoc";
	rename -uid "A133E6D5-4D7E-AE00-CA4E-788B427646E0";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_3_fanLoc_aimConstraint1" -p "l_feather_2_3_fanLoc";
	rename -uid "298983D4-4E02-67FC-2CDD-7F803672E720";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -30.019633889126251 8.2212263400399293e-15 5.6920205325740053e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_4_poser" -p "l_feather_2_mainPoser";
	rename -uid "2079E360-48D8-8A7A-FF67-1FA4461414F0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.80503 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_2_4_poserNurbsShape" -p "l_feather_2_4_poser";
	rename -uid "8B8827BD-410F-403E-7411-F6AD2593E4EE";
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
createNode transform -n "l_feather_2_4_poserOrient" -p "l_feather_2_4_poser";
	rename -uid "EA49FE3A-4718-AD3D-05C1-48A01238ACE3";
createNode locator -n "l_feather_2_4_poserOrientShape" -p "l_feather_2_4_poserOrient";
	rename -uid "FD16AF79-42F7-E060-3BA4-87B1978B4F9D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_4_initLoc" -p "l_feather_2_4_poserOrient";
	rename -uid "92BDD993-4392-240F-9905-50B9B488E94F";
	setAttr ".v" no;
createNode locator -n "l_feather_2_4_initLocShape" -p "l_feather_2_4_initLoc";
	rename -uid "647C79E9-4C0F-0D82-CE96-05BBFD6B9E12";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_4_poserOrient_aimConstraint1" -p "l_feather_2_4_poserOrient";
	rename -uid "21AA691D-4245-7133-7C66-36980A99C9E4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_2_4_fanLoc" -p "l_feather_2_4_poser";
	rename -uid "AE917148-4A77-5768-6123-F6B8EB3451AF";
	setAttr ".v" no;
createNode locator -n "l_feather_2_4_fanLocShape" -p "l_feather_2_4_fanLoc";
	rename -uid "7158906C-4B05-5697-87E0-F38BFA9D8BF5";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_4_fanLoc_aimConstraint1" -p "l_feather_2_4_fanLoc";
	rename -uid "BFFEEC3F-4036-AA8A-FE55-F888F33927D7";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -30.766491466188199 2.5875882793800486e-15 -6.2568488074748599e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_5_poser" -p "l_feather_2_mainPoser";
	rename -uid "296ED783-40BA-F09E-225F-FAAF796B38D2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.07337 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_2_5_poserNurbsShape" -p "l_feather_2_5_poser";
	rename -uid "FF5FC725-4B78-0006-E15A-5998EA8C9C68";
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
createNode transform -n "l_feather_2_5_poserOrient" -p "l_feather_2_5_poser";
	rename -uid "E33F5457-4314-4622-5D2A-9886E01F9A72";
createNode locator -n "l_feather_2_5_poserOrientShape" -p "l_feather_2_5_poserOrient";
	rename -uid "3C7FD12A-4812-3329-3293-AB95D2853A01";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_5_initLoc" -p "l_feather_2_5_poserOrient";
	rename -uid "A6D23FEC-440D-B34C-382B-0996303ED2B8";
	setAttr ".v" no;
createNode locator -n "l_feather_2_5_initLocShape" -p "l_feather_2_5_initLoc";
	rename -uid "7A2BF55A-4FE7-7E82-4C97-4C85E8D8FCDA";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_5_poserOrient_aimConstraint1" -p "l_feather_2_5_poserOrient";
	rename -uid "89352482-408F-6336-001F-32813B817051";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_2_5_fanLoc" -p "l_feather_2_5_poser";
	rename -uid "5F6E7DFB-4B43-ADA8-2D2C-91A456DE3FFA";
	setAttr ".v" no;
createNode locator -n "l_feather_2_5_fanLocShape" -p "l_feather_2_5_fanLoc";
	rename -uid "B3EB7276-48EF-D22B-CA12-C0B058EA7F5C";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_5_fanLoc_aimConstraint1" -p "l_feather_2_5_fanLoc";
	rename -uid "558AE719-41C0-6911-3CFB-D68FDC40D457";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -31.224086376129698 -7.4439298335142841e-15 -1.0942012871226052e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_end_poser" -p "l_feather_2_mainPoser";
	rename -uid "8DA4EDE1-4002-E4AA-50C6-B792AB42BDA4";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.88383 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_2_end_poserNurbsShape" -p "l_feather_2_end_poser";
	rename -uid "C7726760-452F-CC1A-8E76-52B9F8EA828A";
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
createNode transform -n "l_feather_2_end_poserOrient" -p "l_feather_2_end_poser";
	rename -uid "F926DDBC-4F4C-1585-B0CE-F2B59835E97C";
createNode locator -n "l_feather_2_end_poserOrientShape" -p "l_feather_2_end_poserOrient";
	rename -uid "D0E51141-4E03-A94E-FBDA-EBAAF2FA0F60";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_end_initLoc" -p "l_feather_2_end_poserOrient";
	rename -uid "A6159063-4524-B5F7-5D23-9FA6EAA29EEB";
	setAttr ".v" no;
createNode locator -n "l_feather_2_end_initLocShape" -p "l_feather_2_end_initLoc";
	rename -uid "C36E8A68-46FF-C5FA-4269-078D5CE08EE8";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_end_poserOrient_aimConstraint1" -p "l_feather_2_end_poserOrient";
	rename -uid "8E8CC382-4FFC-CEA3-C0A5-14B64B5885E4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_2_end_fanLoc" -p "l_feather_2_end_poser";
	rename -uid "D5A30402-4C84-EF9E-E457-D6AAB3AB77E4";
	setAttr ".v" no;
createNode locator -n "l_feather_2_end_fanLocShape" -p "l_feather_2_end_fanLoc";
	rename -uid "95A7DAB0-4E75-6430-7613-CAB27CE7586C";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_end_fanLoc_aimConstraint1" -p "l_feather_2_end_fanLoc";
	rename -uid "DB011094-47F1-901C-15F4-20893664508F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_2_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" -31.43708229679001 -1.6925226073277357e-14 -1.3046112515424617e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_mainPoser" -p "mainPoser";
	rename -uid "0BEE1B61-4D3A-86C4-0733-B6A9CE860C1F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.3665 0.2293 0.28732 ;
	setAttr ".r" -type "double3" 38.31301 72.2768 -11.70639 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_3_mainPoserShape" -p "l_feather_3_mainPoser";
	rename -uid "19BF184F-4CD4-C056-2AC3-24A24600B374";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_3_mainPoserShapeOrig" -p "l_feather_3_mainPoser";
	rename -uid "65A076DC-438B-F569-D9B7-169C402EA49E";
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
createNode transform -n "l_feather_3_mainPoser_clusterHandle" -p "l_feather_3_mainPoser";
	rename -uid "4E29F735-482D-C47E-A5B5-25B0D0435340";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_3_mainPoser_clusterHandleShape" -p "l_feather_3_mainPoser_clusterHandle";
	rename -uid "DEA9A229-4777-10C8-B862-DDA1A0F4AF09";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_3_1_poser" -p "l_feather_3_mainPoser";
	rename -uid "4ADDA855-4DFB-5A5F-08AB-6D85A72E9489";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_3_1_poserNurbsShape" -p "l_feather_3_1_poser";
	rename -uid "4ACE55D7-4F0F-DD90-F897-8FAE14924122";
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
createNode transform -n "l_feather_3_1_poserOrient" -p "l_feather_3_1_poser";
	rename -uid "A1E8A29B-4B4E-0FB8-BB94-60A3342205D8";
createNode locator -n "l_feather_3_1_poserOrientShape" -p "l_feather_3_1_poserOrient";
	rename -uid "82E59D50-4A7B-1AF8-6D33-28B67841E5D7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_1_initLoc" -p "l_feather_3_1_poserOrient";
	rename -uid "42565447-4F35-9916-4F5F-7B914B4E8972";
	setAttr ".v" no;
createNode locator -n "l_feather_3_1_initLocShape" -p "l_feather_3_1_initLoc";
	rename -uid "F265601A-45AD-EB18-B400-17B11AEF7E55";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_1_poserOrient_aimConstraint1" -p "l_feather_3_1_poserOrient";
	rename -uid "2276433D-47D9-7062-56CD-3AAC2E713659";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_3_1_fanLoc" -p "l_feather_3_1_poser";
	rename -uid "0E570BC3-4CD8-25BF-3816-EE8FD3AFFA7F";
	setAttr ".v" no;
createNode locator -n "l_feather_3_1_fanLocShape" -p "l_feather_3_1_fanLoc";
	rename -uid "77642BB7-4DEB-BE52-1748-6DB0AAE106E4";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_1_fanLoc_aimConstraint1" -p "l_feather_3_1_fanLoc";
	rename -uid "9DD71204-41B6-DB5C-98D6-C0A164A761EC";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -23.305813807052839 -2.1692944621800133e-15 -3.3982418292595457e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_2_poser" -p "l_feather_3_mainPoser";
	rename -uid "0DA8CE68-4EC3-BFC2-F9E7-7CB0B329761F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.24987 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_3_2_poserNurbsShape" -p "l_feather_3_2_poser";
	rename -uid "1F0785EC-4081-2B09-A37D-6A818FCFC026";
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
createNode transform -n "l_feather_3_2_poserOrient" -p "l_feather_3_2_poser";
	rename -uid "15F37950-452A-0242-718F-17A6DF37BA0E";
createNode locator -n "l_feather_3_2_poserOrientShape" -p "l_feather_3_2_poserOrient";
	rename -uid "1390D835-4694-B3C6-BE00-45B86B0E6555";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_2_initLoc" -p "l_feather_3_2_poserOrient";
	rename -uid "E44B7A22-459E-FBC7-6FDC-C8859B6B5AAA";
	setAttr ".v" no;
createNode locator -n "l_feather_3_2_initLocShape" -p "l_feather_3_2_initLoc";
	rename -uid "1BD5E62C-43C5-1924-A732-23B6020044AC";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_2_poserOrient_aimConstraint1" -p "l_feather_3_2_poserOrient";
	rename -uid "488A9AC2-4BDD-C646-F0E8-399312DD35A8";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_3_2_fanLoc" -p "l_feather_3_2_poser";
	rename -uid "3F75ABC4-403A-D9BD-C3B4-E983A9D55548";
	setAttr ".v" no;
createNode locator -n "l_feather_3_2_fanLocShape" -p "l_feather_3_2_fanLoc";
	rename -uid "DD912E0B-4861-1137-74E8-909001A42C37";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_2_fanLoc_aimConstraint1" -p "l_feather_3_2_fanLoc";
	rename -uid "1FA3A8CF-494E-A298-1745-37B4E46AA147";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -30.377882105016486 -4.7340350855898053e-15 -2.1690727738244038e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_3_poser" -p "l_feather_3_mainPoser";
	rename -uid "47B8A242-4FF3-05EF-335F-8A9A43432E50";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.49973 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_3_3_poserNurbsShape" -p "l_feather_3_3_poser";
	rename -uid "E9AB0B4F-44DF-2360-92FF-18BE0B462B7D";
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
createNode transform -n "l_feather_3_3_poserOrient" -p "l_feather_3_3_poser";
	rename -uid "7324FBE7-4A40-4D32-6952-17B6391EE8DB";
createNode locator -n "l_feather_3_3_poserOrientShape" -p "l_feather_3_3_poserOrient";
	rename -uid "86C75FE9-40FC-57B0-D071-EBB7D2C262D4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_3_initLoc" -p "l_feather_3_3_poserOrient";
	rename -uid "2CA6B617-44CA-B970-EC16-DF9D234E6372";
	setAttr ".v" no;
createNode locator -n "l_feather_3_3_initLocShape" -p "l_feather_3_3_initLoc";
	rename -uid "62199376-4445-61B5-1189-C0B06B9A7416";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_3_poserOrient_aimConstraint1" -p "l_feather_3_3_poserOrient";
	rename -uid "9498A676-4FC3-5FA9-C8E9-BCAAD0F3A20C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_3_3_fanLoc" -p "l_feather_3_3_poser";
	rename -uid "FF43EC88-4A7F-59A1-1095-56AF250E71CE";
	setAttr ".v" no;
createNode locator -n "l_feather_3_3_fanLocShape" -p "l_feather_3_3_fanLoc";
	rename -uid "FBE7E2B8-4A9E-983F-C4E4-5CA5145DA532";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_3_fanLoc_aimConstraint1" -p "l_feather_3_3_fanLoc";
	rename -uid "529A1181-44BD-FF21-6144-66A585855562";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -32.932993848809097 4.9681861002517759e-15 1.5401504660140074e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_4_poser" -p "l_feather_3_mainPoser";
	rename -uid "38E1BCF7-46A2-4799-612E-12803916B5D5";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.7496 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_3_4_poserNurbsShape" -p "l_feather_3_4_poser";
	rename -uid "58366A26-46C5-EE80-1CD1-C28C0CB5E56E";
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
createNode transform -n "l_feather_3_4_poserOrient" -p "l_feather_3_4_poser";
	rename -uid "1E1F11CF-4C6A-E78F-9A4B-6985B936BF78";
createNode locator -n "l_feather_3_4_poserOrientShape" -p "l_feather_3_4_poserOrient";
	rename -uid "3C097693-4505-533C-2D65-F1836FE533DF";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_4_initLoc" -p "l_feather_3_4_poserOrient";
	rename -uid "09844978-48DB-D27F-FD0B-6798129F4AAF";
	setAttr ".v" no;
createNode locator -n "l_feather_3_4_initLocShape" -p "l_feather_3_4_initLoc";
	rename -uid "7582505C-4221-9AF7-C992-9CA968B23F12";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_4_poserOrient_aimConstraint1" -p "l_feather_3_4_poserOrient";
	rename -uid "B06AE2B0-4343-3EC7-BF31-F5925581C964";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_3_4_fanLoc" -p "l_feather_3_4_poser";
	rename -uid "4FB484F8-4FB7-14B3-166F-93BE8D3283F0";
	setAttr ".v" no;
createNode locator -n "l_feather_3_4_fanLocShape" -p "l_feather_3_4_fanLoc";
	rename -uid "5335635E-4807-7B06-D54B-8FB6BE057AA2";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_4_fanLoc_aimConstraint1" -p "l_feather_3_4_fanLoc";
	rename -uid "B28DE96F-492F-13AE-FDF4-38A696E90223";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -34.245511361152481 2.8640421824456557e-15 -8.8233971719565224e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_5_poser" -p "l_feather_3_mainPoser";
	rename -uid "2C5D49E7-4F64-D410-004C-19BEAAC57CCC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 4.99946 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_3_5_poserNurbsShape" -p "l_feather_3_5_poser";
	rename -uid "E3AA99E5-483D-ADF6-54EF-FFB12E9F1C21";
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
createNode transform -n "l_feather_3_5_poserOrient" -p "l_feather_3_5_poser";
	rename -uid "F5661A15-4A0E-4425-D9FC-94AF5BADE4FE";
createNode locator -n "l_feather_3_5_poserOrientShape" -p "l_feather_3_5_poserOrient";
	rename -uid "4CFC5C69-42D5-3135-20AC-5A95B21DE0C5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_5_initLoc" -p "l_feather_3_5_poserOrient";
	rename -uid "1A69D59A-46D0-AEFF-D0E0-B5896B9B1452";
	setAttr ".v" no;
createNode locator -n "l_feather_3_5_initLocShape" -p "l_feather_3_5_initLoc";
	rename -uid "F83F6532-45FF-216A-CD83-D48833BD9C29";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_5_poserOrient_aimConstraint1" -p "l_feather_3_5_poserOrient";
	rename -uid "B5F6E77A-4A9D-73C7-565C-EEA33ED59A81";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_3_5_fanLoc" -p "l_feather_3_5_poser";
	rename -uid "D5365B33-46D0-FED3-76CE-BD82C8B1DFD1";
	setAttr ".v" no;
createNode locator -n "l_feather_3_5_fanLocShape" -p "l_feather_3_5_fanLoc";
	rename -uid "7BB07094-4D04-C50A-171A-7899C2E43985";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_5_fanLoc_aimConstraint1" -p "l_feather_3_5_fanLoc";
	rename -uid "C664CE53-4282-0B40-058F-9D9AD6BFC7B0";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -35.043770223880031 3.0583387374314875e-14 4.8741714504856934e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_end_poser" -p "l_feather_3_mainPoser";
	rename -uid "91576385-4170-8CF2-A83C-E09C05076C34";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.79145 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_3_end_poserNurbsShape" -p "l_feather_3_end_poser";
	rename -uid "6CCA021F-4175-6735-EB66-04AB43656352";
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
createNode transform -n "l_feather_3_end_poserOrient" -p "l_feather_3_end_poser";
	rename -uid "D6AE146A-4C67-724B-73A5-278F1EED09AF";
createNode locator -n "l_feather_3_end_poserOrientShape" -p "l_feather_3_end_poserOrient";
	rename -uid "D6E2F36D-47EF-0953-857E-168F070CA50B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_end_initLoc" -p "l_feather_3_end_poserOrient";
	rename -uid "BF0D6867-4FE9-896F-1031-4DACC35C8F0D";
	setAttr ".v" no;
createNode locator -n "l_feather_3_end_initLocShape" -p "l_feather_3_end_initLoc";
	rename -uid "3350F254-42A6-4B22-53FB-6FAF170D5BF6";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_end_poserOrient_aimConstraint1" -p "l_feather_3_end_poserOrient";
	rename -uid "E3FDF844-4C18-A0A3-08A7-0AAB9CAB8685";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_3_end_fanLoc" -p "l_feather_3_end_poser";
	rename -uid "E97D98A9-4EDE-6722-30CA-55892113DB5D";
	setAttr ".v" no;
createNode locator -n "l_feather_3_end_fanLocShape" -p "l_feather_3_end_fanLoc";
	rename -uid "B8A12064-4649-F59D-661E-D0B8D57E7047";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_end_fanLoc_aimConstraint1" -p "l_feather_3_end_fanLoc";
	rename -uid "D8AD3D13-45D7-0489-694A-5A808BB041E4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_3_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" -35.413742227074508 1.2280434557984367e-14 6.3365399921510835e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_mainPoser" -p "mainPoser";
	rename -uid "8EFA84BF-44C7-7CB8-D096-62ADD8BED3B6";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.45169 0.09972 0.33745 ;
	setAttr ".r" -type "double3" 43.90359 68.03587 -17.61052 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_4_mainPoserShape" -p "l_feather_4_mainPoser";
	rename -uid "BA06B330-4C18-71E5-98CE-3DA81868FE69";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_4_mainPoserShapeOrig" -p "l_feather_4_mainPoser";
	rename -uid "013841C7-43AA-8331-D22A-D08FBC43DF07";
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
createNode transform -n "l_feather_4_mainPoser_clusterHandle" -p "l_feather_4_mainPoser";
	rename -uid "63FD4A33-4DCD-3C85-FED1-F6887C254F90";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_4_mainPoser_clusterHandleShape" -p "l_feather_4_mainPoser_clusterHandle";
	rename -uid "67ED8487-4CF6-3B0C-0EF6-299972AF90CA";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_4_1_poser" -p "l_feather_4_mainPoser";
	rename -uid "62000ADC-4BFD-FBB0-BC3B-C587CD160206";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_4_1_poserNurbsShape" -p "l_feather_4_1_poser";
	rename -uid "8DB6228A-44C4-8526-42E0-C2A395917937";
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
createNode transform -n "l_feather_4_1_poserOrient" -p "l_feather_4_1_poser";
	rename -uid "C2C4B330-4122-419F-FFE0-6B84F3F91EF9";
createNode locator -n "l_feather_4_1_poserOrientShape" -p "l_feather_4_1_poserOrient";
	rename -uid "54E72613-44DB-544E-10E0-64A3A912433C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_1_initLoc" -p "l_feather_4_1_poserOrient";
	rename -uid "3F97149A-44D0-65CD-460B-4AA1F5992069";
	setAttr ".v" no;
createNode locator -n "l_feather_4_1_initLocShape" -p "l_feather_4_1_initLoc";
	rename -uid "5B642E5E-4418-1F2B-3EBD-0EA355002408";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_1_poserOrient_aimConstraint1" -p "l_feather_4_1_poserOrient";
	rename -uid "474F7BCB-4D4C-EF9B-5CA7-CC9151A44821";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_4_1_fanLoc" -p "l_feather_4_1_poser";
	rename -uid "396559B9-470A-0DE1-967B-AEBD30D71DDB";
	setAttr ".v" no;
createNode locator -n "l_feather_4_1_fanLocShape" -p "l_feather_4_1_fanLoc";
	rename -uid "E430A1FC-437D-F8E7-B255-43897E8E53B2";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_1_fanLoc_aimConstraint1" -p "l_feather_4_1_fanLoc";
	rename -uid "90CD0FDF-4F67-5CFC-19C8-12AAD0A59250";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -27.205967442842695 -2.9301343014368701e-15 -1.7883521807234757e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_2_poser" -p "l_feather_4_mainPoser";
	rename -uid "0D62B68F-4051-169E-27B1-3E9E214969D0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.2327 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_4_2_poserNurbsShape" -p "l_feather_4_2_poser";
	rename -uid "BCDE8CE3-4D09-32E5-C5B9-EDA6EA6ED632";
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
createNode transform -n "l_feather_4_2_poserOrient" -p "l_feather_4_2_poser";
	rename -uid "8B92585F-43A9-0075-30D9-C4BC0E43050F";
createNode locator -n "l_feather_4_2_poserOrientShape" -p "l_feather_4_2_poserOrient";
	rename -uid "43CB9C72-49A7-90CE-1E5B-E9B8703C421F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_2_initLoc" -p "l_feather_4_2_poserOrient";
	rename -uid "43952596-4FDA-4916-CDD9-E78CDEF8F789";
	setAttr ".v" no;
createNode locator -n "l_feather_4_2_initLocShape" -p "l_feather_4_2_initLoc";
	rename -uid "9BAEC584-49DF-B3F7-7FEE-0DA2320E6315";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_2_poserOrient_aimConstraint1" -p "l_feather_4_2_poserOrient";
	rename -uid "4A1A235C-44D6-A703-23A6-798929323ABE";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_4_2_fanLoc" -p "l_feather_4_2_poser";
	rename -uid "6D930F22-4CE4-2D7D-273F-DC8F24B17EC6";
	setAttr ".v" no;
createNode locator -n "l_feather_4_2_fanLocShape" -p "l_feather_4_2_fanLoc";
	rename -uid "2B2A41A1-4B8D-4B05-E982-5189C54E6EE4";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_2_fanLoc_aimConstraint1" -p "l_feather_4_2_fanLoc";
	rename -uid "B4805661-4A20-017B-3DE5-05B317AF26D2";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -34.714979292288277 5.2352065232754246e-15 6.4284069614729899e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_3_poser" -p "l_feather_4_mainPoser";
	rename -uid "9011CC43-427E-F936-16C2-B999A5E797D2";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.46539 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_4_3_poserNurbsShape" -p "l_feather_4_3_poser";
	rename -uid "CA917DC5-4650-3C8F-68D1-F09307B676E5";
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
createNode transform -n "l_feather_4_3_poserOrient" -p "l_feather_4_3_poser";
	rename -uid "C20513F1-4850-FDD7-6724-5B8A3137A959";
createNode locator -n "l_feather_4_3_poserOrientShape" -p "l_feather_4_3_poserOrient";
	rename -uid "61DBBD78-4665-0824-C1C3-64B0DAD67EF9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_3_initLoc" -p "l_feather_4_3_poserOrient";
	rename -uid "417EC2B9-4D8A-61C5-44B3-63AD58196CEC";
	setAttr ".v" no;
createNode locator -n "l_feather_4_3_initLocShape" -p "l_feather_4_3_initLoc";
	rename -uid "85E2D58E-41BF-91AA-9E8E-0C8155E13BAC";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_3_poserOrient_aimConstraint1" -p "l_feather_4_3_poserOrient";
	rename -uid "19BAA186-40FD-79C2-766B-878BED07426F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_4_3_fanLoc" -p "l_feather_4_3_poser";
	rename -uid "E754BCF6-4B91-83DB-71F2-3A8AB9A677F0";
	setAttr ".v" no;
createNode locator -n "l_feather_4_3_fanLocShape" -p "l_feather_4_3_fanLoc";
	rename -uid "8DCE0F1B-4049-F818-4D84-6C9F72D2CAF6";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_3_fanLoc_aimConstraint1" -p "l_feather_4_3_fanLoc";
	rename -uid "32C03256-48FB-DBFD-148E-0E8C9C217819";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -37.584477853440163 4.6883618983095499e-15 -6.8631345430863094e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_4_poser" -p "l_feather_4_mainPoser";
	rename -uid "6E088F71-434C-F4BC-7C8E-A4A88171EE66";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.69809 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_4_4_poserNurbsShape" -p "l_feather_4_4_poser";
	rename -uid "3E4C9FB5-4EF6-3910-5885-09B381F12FC6";
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
createNode transform -n "l_feather_4_4_poserOrient" -p "l_feather_4_4_poser";
	rename -uid "F82F0F4D-4BA7-053E-B360-ED9541803806";
createNode locator -n "l_feather_4_4_poserOrientShape" -p "l_feather_4_4_poserOrient";
	rename -uid "84519BC4-42FF-8643-5FBD-01A5091FA62F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_4_initLoc" -p "l_feather_4_4_poserOrient";
	rename -uid "1C575755-43CA-5ABB-DB29-3AA172D5F2FE";
	setAttr ".v" no;
createNode locator -n "l_feather_4_4_initLocShape" -p "l_feather_4_4_initLoc";
	rename -uid "F42799C4-46A9-ED88-7D4A-7D9DD08190E1";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_4_poserOrient_aimConstraint1" -p "l_feather_4_4_poserOrient";
	rename -uid "BD307FAE-4F89-E2DB-14A9-86A24C43C676";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_4_4_fanLoc" -p "l_feather_4_4_poser";
	rename -uid "EE97E4A7-4936-CA2B-4BCD-6996C9B8C81D";
	setAttr ".v" no;
createNode locator -n "l_feather_4_4_fanLocShape" -p "l_feather_4_4_fanLoc";
	rename -uid "DA765CB6-47D4-40AD-132A-EF887FAEA019";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_4_fanLoc_aimConstraint1" -p "l_feather_4_4_fanLoc";
	rename -uid "3B4D84B3-45F9-0308-B4C7-739A64C05969";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -39.091485744634944 -1.7327782806619196e-15 -4.8808276517510169e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_5_poser" -p "l_feather_4_mainPoser";
	rename -uid "4F09B12C-489C-E883-22FB-FC894D1B57F5";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 4.93079 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_4_5_poserNurbsShape" -p "l_feather_4_5_poser";
	rename -uid "628C5464-47C4-B76A-6B64-E6AED7EC39CB";
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
createNode transform -n "l_feather_4_5_poserOrient" -p "l_feather_4_5_poser";
	rename -uid "D0746EA8-4D9A-7271-D435-CE989364F69F";
createNode locator -n "l_feather_4_5_poserOrientShape" -p "l_feather_4_5_poserOrient";
	rename -uid "C2C12242-4390-B2A3-CFB9-F4A3BD2108CB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_5_initLoc" -p "l_feather_4_5_poserOrient";
	rename -uid "ABBA6550-49EB-E871-8D82-1EAF40A0AC09";
	setAttr ".v" no;
createNode locator -n "l_feather_4_5_initLocShape" -p "l_feather_4_5_initLoc";
	rename -uid "FB29AE60-48B2-0BBA-C4FD-42B3D67EE091";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_5_poserOrient_aimConstraint1" -p "l_feather_4_5_poserOrient";
	rename -uid "62577FF7-4624-BBD4-351B-9FAFDFD0B3AC";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_4_5_fanLoc" -p "l_feather_4_5_poser";
	rename -uid "E77A4030-49B6-7939-EAEC-3E8191A494E8";
	setAttr ".v" no;
createNode locator -n "l_feather_4_5_fanLocShape" -p "l_feather_4_5_fanLoc";
	rename -uid "9A78929D-4DC5-E0EE-637E-99A438857FB3";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_5_fanLoc_aimConstraint1" -p "l_feather_4_5_fanLoc";
	rename -uid "25EC27D3-4F8E-45EF-0C0B-B88C64773EE9";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -40.018995960662352 -2.6411666264218466e-14 -2.3268670541317146e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_end_poser" -p "l_feather_4_mainPoser";
	rename -uid "4A254E78-4689-31EF-08B2-87867645E90D";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.7056 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_4_end_poserNurbsShape" -p "l_feather_4_end_poser";
	rename -uid "3A39440B-48FC-93FC-A174-529077040977";
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
createNode transform -n "l_feather_4_end_poserOrient" -p "l_feather_4_end_poser";
	rename -uid "C5BD6EB4-4CE8-7DB0-B39E-0B9E7C358FA0";
createNode locator -n "l_feather_4_end_poserOrientShape" -p "l_feather_4_end_poserOrient";
	rename -uid "C327DC53-40F0-9FE3-22C4-7B845BE6D34C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_end_initLoc" -p "l_feather_4_end_poserOrient";
	rename -uid "BDED1F16-485E-808A-64CB-9D8BDEAD5162";
	setAttr ".v" no;
createNode locator -n "l_feather_4_end_initLocShape" -p "l_feather_4_end_initLoc";
	rename -uid "4B25131D-4532-8534-F370-5898178A1FED";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_end_poserOrient_aimConstraint1" -p "l_feather_4_end_poserOrient";
	rename -uid "372BECC6-4E7D-82C1-385C-AABD0AA1FC17";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_4_end_fanLoc" -p "l_feather_4_end_poser";
	rename -uid "194E6463-4741-ABFA-F1F7-5D972880AA45";
	setAttr ".v" no;
createNode locator -n "l_feather_4_end_fanLocShape" -p "l_feather_4_end_fanLoc";
	rename -uid "B66B287F-43F5-F90C-EF4F-3286C1B16B46";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_end_fanLoc_aimConstraint1" -p "l_feather_4_end_fanLoc";
	rename -uid "1E8C5356-45C5-E020-BE08-F4AACED76429";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_4_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" -40.451680965326673 -4.2192808376342952e-14 4.212488509044314e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_mainPoser" -p "mainPoser";
	rename -uid "14F377F9-45D6-DE33-7070-0FAAB5CDF14C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.49872 -0.01788 0.39374 ;
	setAttr ".r" -type "double3" 50.73323 64.59158 -19.71274 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_5_mainPoserShape" -p "l_feather_5_mainPoser";
	rename -uid "E8397BCF-4DCC-595D-1CBB-9E881EE30BDD";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_5_mainPoserShapeOrig" -p "l_feather_5_mainPoser";
	rename -uid "EDC42FF4-45BE-3424-6F28-0C803D93A5BA";
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
createNode transform -n "l_feather_5_mainPoser_clusterHandle" -p "l_feather_5_mainPoser";
	rename -uid "C31033E3-48AE-655F-13A8-BA95B66F0EC3";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_5_mainPoser_clusterHandleShape" -p "l_feather_5_mainPoser_clusterHandle";
	rename -uid "BF4E65AB-41FF-AF6E-4042-318833E99F9C";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_5_1_poser" -p "l_feather_5_mainPoser";
	rename -uid "B3C31D61-48FA-83A1-E47D-F08244B39459";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_5_1_poserNurbsShape" -p "l_feather_5_1_poser";
	rename -uid "1CA5D3CA-43EF-FDB2-BED4-5CB7F482CB37";
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
createNode transform -n "l_feather_5_1_poserOrient" -p "l_feather_5_1_poser";
	rename -uid "8B7037DF-4C5E-88BC-86FF-18BF3101DFBA";
createNode locator -n "l_feather_5_1_poserOrientShape" -p "l_feather_5_1_poserOrient";
	rename -uid "3C28322C-49C1-F274-5EB5-E88F76F6C811";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_1_initLoc" -p "l_feather_5_1_poserOrient";
	rename -uid "FFA221A7-4724-64F7-BC96-88A972A2DB6C";
	setAttr ".v" no;
createNode locator -n "l_feather_5_1_initLocShape" -p "l_feather_5_1_initLoc";
	rename -uid "A806C8EC-42CE-CD4E-F3C6-8FB4B9390282";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_1_poserOrient_aimConstraint1" -p "l_feather_5_1_poserOrient";
	rename -uid "DD367896-4336-7BC8-5135-888F7AF471FA";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_5_1_fanLoc" -p "l_feather_5_1_poser";
	rename -uid "A75396B9-4D58-9B2E-183E-C19C8ACB44A0";
	setAttr ".v" no;
createNode locator -n "l_feather_5_1_fanLocShape" -p "l_feather_5_1_fanLoc";
	rename -uid "D7609621-481E-C6DB-FF16-DFA2A279A0D4";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_1_fanLoc_aimConstraint1" -p "l_feather_5_1_fanLoc";
	rename -uid "26B3FEE9-4B96-E1CA-D039-1382315C4483";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_2_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -30.690411608875799 -2.6800148213870997e-15 7.3544233612496204e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_2_poser" -p "l_feather_5_mainPoser";
	rename -uid "6A289922-4C58-100C-1805-7CB6F789988C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.21145 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_5_2_poserNurbsShape" -p "l_feather_5_2_poser";
	rename -uid "56E6E661-496D-BE54-4295-DF973D337508";
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
createNode transform -n "l_feather_5_2_poserOrient" -p "l_feather_5_2_poser";
	rename -uid "C0C2C57E-4FB0-F9BC-C10B-CF9BDB8CBF56";
createNode locator -n "l_feather_5_2_poserOrientShape" -p "l_feather_5_2_poserOrient";
	rename -uid "264B33F6-4611-2FB4-CE64-91875F32032C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_2_initLoc" -p "l_feather_5_2_poserOrient";
	rename -uid "1A688D59-483D-FCA8-5613-9783BC27DB71";
	setAttr ".v" no;
createNode locator -n "l_feather_5_2_initLocShape" -p "l_feather_5_2_initLoc";
	rename -uid "DCAD034F-4B67-AA1A-68CD-2BBC50CD9A7F";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_2_poserOrient_aimConstraint1" -p "l_feather_5_2_poserOrient";
	rename -uid "4FAAEC46-472E-BF3B-0D6F-F680566A2A85";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_5_2_fanLoc" -p "l_feather_5_2_poser";
	rename -uid "83E3B7C3-4179-4329-7234-3AAD18CC119F";
	setAttr ".v" no;
createNode locator -n "l_feather_5_2_fanLocShape" -p "l_feather_5_2_fanLoc";
	rename -uid "B8B6787C-4605-5F06-0C10-E8A71DDCB586";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_2_fanLoc_aimConstraint1" -p "l_feather_5_2_fanLoc";
	rename -uid "9250F792-4395-2ECC-8082-B9AE707E990D";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_3_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -39.450435428102324 -3.9345309430342875e-15 -4.7193891937310519e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_3_poser" -p "l_feather_5_mainPoser";
	rename -uid "312D771B-4727-66E4-78BB-5AB6EC82F035";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.42291 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_5_3_poserNurbsShape" -p "l_feather_5_3_poser";
	rename -uid "2A0E48FE-4FDF-15AE-1444-C3AF736C2D28";
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
createNode transform -n "l_feather_5_3_poserOrient" -p "l_feather_5_3_poser";
	rename -uid "03A7E784-4BD3-1623-B62F-949A543807CF";
createNode locator -n "l_feather_5_3_poserOrientShape" -p "l_feather_5_3_poserOrient";
	rename -uid "2497D0CF-4CFD-684C-A0C9-BAA10506F365";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_3_initLoc" -p "l_feather_5_3_poserOrient";
	rename -uid "BA41E58F-4D76-3FD4-611B-00A4FD174BE2";
	setAttr ".v" no;
createNode locator -n "l_feather_5_3_initLocShape" -p "l_feather_5_3_initLoc";
	rename -uid "E4792C98-4BB4-E703-7F48-5A9D6E395402";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_3_poserOrient_aimConstraint1" -p "l_feather_5_3_poserOrient";
	rename -uid "70AF8196-40BB-1E4A-D31A-F99E79A41C86";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_5_3_fanLoc" -p "l_feather_5_3_poser";
	rename -uid "91CCDAAC-4DF0-E953-B671-928CFB3508A5";
	setAttr ".v" no;
createNode locator -n "l_feather_5_3_fanLocShape" -p "l_feather_5_3_fanLoc";
	rename -uid "40610930-499E-D3C3-B198-B1BEDDF925E4";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_3_fanLoc_aimConstraint1" -p "l_feather_5_3_fanLoc";
	rename -uid "24823EFC-485C-6B14-08BC-CC88F7343178";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_4_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -42.915681159822448 -8.5561428596037146e-15 -7.6470077485830425e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_4_poser" -p "l_feather_5_mainPoser";
	rename -uid "FAB0992B-42C2-7283-F503-1FA27884057F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.63436 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_5_4_poserNurbsShape" -p "l_feather_5_4_poser";
	rename -uid "947595A6-444F-DF2B-3B26-1F963129078B";
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
createNode transform -n "l_feather_5_4_poserOrient" -p "l_feather_5_4_poser";
	rename -uid "99C019A6-401B-2433-04FE-3EA181B4F33B";
createNode locator -n "l_feather_5_4_poserOrientShape" -p "l_feather_5_4_poserOrient";
	rename -uid "749C253B-433B-DF48-0147-58AB2AE86900";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_4_initLoc" -p "l_feather_5_4_poserOrient";
	rename -uid "B6F3B646-499F-5527-A53E-EAAE8F89A25D";
	setAttr ".v" no;
createNode locator -n "l_feather_5_4_initLocShape" -p "l_feather_5_4_initLoc";
	rename -uid "852DE43B-4A21-4D3F-ABE3-1FB5867E574B";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_4_poserOrient_aimConstraint1" -p "l_feather_5_4_poserOrient";
	rename -uid "F7D6C48B-4D02-9756-34EF-1889800CC03C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_5_4_fanLoc" -p "l_feather_5_4_poser";
	rename -uid "3C701CCE-4DAA-CDBE-B2B1-898EE571444C";
	setAttr ".v" no;
createNode locator -n "l_feather_5_4_fanLocShape" -p "l_feather_5_4_fanLoc";
	rename -uid "F02D83C1-4EAB-C10B-8015-70932A6AD5C1";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_4_fanLoc_aimConstraint1" -p "l_feather_5_4_fanLoc";
	rename -uid "1BA4F814-4AEC-6F8B-720B-5085EB8D86E5";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -44.758465998571758 8.2641421199749866e-15 9.5693112193458512e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_5_poser" -p "l_feather_5_mainPoser";
	rename -uid "F4F016B5-4A61-9F98-BAF3-F098BEA99768";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 4.84581 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_5_5_poserNurbsShape" -p "l_feather_5_5_poser";
	rename -uid "98611D23-4331-38A8-AB86-00B1573A72B9";
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
createNode transform -n "l_feather_5_5_poserOrient" -p "l_feather_5_5_poser";
	rename -uid "DC78CA0F-44A8-66E6-9CA7-5B804BC29CA4";
createNode locator -n "l_feather_5_5_poserOrientShape" -p "l_feather_5_5_poserOrient";
	rename -uid "A6C55562-4B63-EC1F-1972-7E84C23C24CF";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_5_initLoc" -p "l_feather_5_5_poserOrient";
	rename -uid "9BD8E659-417D-C82F-6C31-42B461A3345E";
	setAttr ".v" no;
createNode locator -n "l_feather_5_5_initLocShape" -p "l_feather_5_5_initLoc";
	rename -uid "64F4383E-4F88-1F16-C7BE-CC807A824DE3";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_5_poserOrient_aimConstraint1" -p "l_feather_5_5_poserOrient";
	rename -uid "C12107BD-45BD-49AD-E299-AE87AA28BC7A";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_5_5_fanLoc" -p "l_feather_5_5_poser";
	rename -uid "7CA95AD6-4EC3-D33D-5ED2-C386ACBF50FE";
	setAttr ".v" no;
createNode locator -n "l_feather_5_5_fanLocShape" -p "l_feather_5_5_fanLoc";
	rename -uid "D2A58B62-4F4F-D5B5-C4A7-FCB25F92A86D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_5_fanLoc_aimConstraint1" -p "l_feather_5_5_fanLoc";
	rename -uid "EB4FE198-43CF-F659-487F-89A02AB49118";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_end_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".rsrr" -type "double3" -45.899864534107465 -2.5668424803283989e-15 -6.0618241594900791e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_end_poser" -p "l_feather_5_mainPoser";
	rename -uid "5B841CB1-468D-EC10-DAF7-92BB855AAA5A";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 5.59939 0 0 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.12;
createNode nurbsSurface -n "l_feather_5_end_poserNurbsShape" -p "l_feather_5_end_poser";
	rename -uid "9712BED3-40BD-D95A-920C-EF95E033C7FB";
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
createNode transform -n "l_feather_5_end_poserOrient" -p "l_feather_5_end_poser";
	rename -uid "898E7287-49BF-0D1A-9979-B8830DA97135";
createNode locator -n "l_feather_5_end_poserOrientShape" -p "l_feather_5_end_poserOrient";
	rename -uid "FC32F7F9-426A-02E1-EEB5-D3A3FE29E3A3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_end_initLoc" -p "l_feather_5_end_poserOrient";
	rename -uid "03542D1E-432C-9003-E765-A9AFE6339E9B";
	setAttr ".v" no;
createNode locator -n "l_feather_5_end_initLocShape" -p "l_feather_5_end_initLoc";
	rename -uid "1DC65DAF-4746-3A01-780E-5CA3B3BFFE82";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_end_poserOrient_aimConstraint1" -p "l_feather_5_end_poserOrient";
	rename -uid "E3FBE2A6-49A9-205E-85AD-4EAB097BD763";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
createNode transform -n "l_feather_5_end_fanLoc" -p "l_feather_5_end_poser";
	rename -uid "FFAC743F-4860-959D-C203-46A5DF9DD02E";
	setAttr ".v" no;
createNode locator -n "l_feather_5_end_fanLocShape" -p "l_feather_5_end_fanLoc";
	rename -uid "7D7027B1-4367-BA7C-C942-D38F7D268D9E";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_end_fanLoc_aimConstraint1" -p "l_feather_5_end_fanLoc";
	rename -uid "510B78E6-4898-6F18-4379-6A8BCE475A2D";
	addAttr -dcb 0 -ci true -sn "w0" -ln "l_feather_5_5_poserW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" -46.434119160751685 -3.2336202289365773e-14 -7.8545234110689892e-15 ;
	setAttr -k on ".w0";
createNode transform -n "r_initLocs" -p "posers";
	rename -uid "CB2A4A12-4205-9583-1CAE-7A94D91974CB";
	setAttr ".v" no;
createNode transform -n "r_feather_1_1_initLoc" -p "r_initLocs";
	rename -uid "91BB9EDD-4594-25AA-3775-C989CD1F304F";
createNode locator -n "r_feather_1_1_initLocShape" -p "r_feather_1_1_initLoc";
	rename -uid "B483A5DA-43BE-D708-7FD8-62BAE8DA84E5";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_2_initLoc" -p "r_initLocs";
	rename -uid "0C3855B8-4187-BBE7-439D-B8BC1A19110E";
createNode locator -n "r_feather_1_2_initLocShape" -p "r_feather_1_2_initLoc";
	rename -uid "E7932928-4118-EF6E-5B78-7882938ADF96";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_3_initLoc" -p "r_initLocs";
	rename -uid "B0822DF1-4C00-A5A3-7FB8-2684A0125D95";
createNode locator -n "r_feather_1_3_initLocShape" -p "r_feather_1_3_initLoc";
	rename -uid "1D7D6934-4589-601E-53E4-BBB2E7D97059";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_4_initLoc" -p "r_initLocs";
	rename -uid "AB77BD27-4056-A2ED-3800-73B0BAAA2714";
createNode locator -n "r_feather_1_4_initLocShape" -p "r_feather_1_4_initLoc";
	rename -uid "1D02D496-4B8F-166A-09E8-D98BF7DB1704";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_5_initLoc" -p "r_initLocs";
	rename -uid "06CB1528-4681-BE15-80FC-1BB7F78538C5";
createNode locator -n "r_feather_1_5_initLocShape" -p "r_feather_1_5_initLoc";
	rename -uid "F5A6E4BA-47D4-36FD-2B5A-4E82ED87506F";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_end_initLoc" -p "r_initLocs";
	rename -uid "FA76ABDB-41EF-7E2E-6131-42827494C851";
createNode locator -n "r_feather_1_end_initLocShape" -p "r_feather_1_end_initLoc";
	rename -uid "96ECEAD0-409E-D3C4-DE71-E2B96FEC0D55";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_1_fanLoc" -p "r_initLocs";
	rename -uid "A76B9D47-471A-DEDE-CCA3-6398106F2687";
createNode locator -n "r_feather_1_1_fanLocShape" -p "r_feather_1_1_fanLoc";
	rename -uid "CD5C874C-4DEA-E3F2-817C-79A9200F8E8A";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_1_initLoc" -p "r_initLocs";
	rename -uid "1F7DE7CA-4A5A-4798-44C8-BC9B3BC18865";
createNode locator -n "r_feather_2_1_initLocShape" -p "r_feather_2_1_initLoc";
	rename -uid "6ED475A9-478F-5BA1-0B74-6C8DD8506EC0";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_2_initLoc" -p "r_initLocs";
	rename -uid "30A76089-442B-C646-EAC0-E981455283B6";
createNode locator -n "r_feather_2_2_initLocShape" -p "r_feather_2_2_initLoc";
	rename -uid "2D782E98-4DC4-4C2C-3582-0ABFF82C4F5F";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_3_initLoc" -p "r_initLocs";
	rename -uid "421D644A-45BC-A5F9-802D-C7B6929BAAAB";
createNode locator -n "r_feather_2_3_initLocShape" -p "r_feather_2_3_initLoc";
	rename -uid "5B0C5F72-4229-BF8E-B315-B7B96C903332";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_4_initLoc" -p "r_initLocs";
	rename -uid "9FE216E8-4369-913B-51CF-FBAEE3764555";
createNode locator -n "r_feather_2_4_initLocShape" -p "r_feather_2_4_initLoc";
	rename -uid "510904B9-46F0-707F-5CBF-26B835E666C8";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_5_initLoc" -p "r_initLocs";
	rename -uid "8374E4FF-49E6-4729-4063-518BD722FA26";
createNode locator -n "r_feather_2_5_initLocShape" -p "r_feather_2_5_initLoc";
	rename -uid "5FBD7443-4B04-D2BC-FF81-3FAF803223B8";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_end_initLoc" -p "r_initLocs";
	rename -uid "83CD35BC-43FB-B936-BFB6-C9913CA28B3E";
createNode locator -n "r_feather_2_end_initLocShape" -p "r_feather_2_end_initLoc";
	rename -uid "F33409AD-44FF-3337-5214-498D00E6B67D";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_1_fanLoc" -p "r_initLocs";
	rename -uid "30FC0BD0-48A1-67BB-05AE-189B9185D209";
createNode locator -n "r_feather_2_1_fanLocShape" -p "r_feather_2_1_fanLoc";
	rename -uid "3CA3FCB0-4699-859B-0FBE-D4A56CF29300";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_1_initLoc" -p "r_initLocs";
	rename -uid "54FF1A04-4240-F56F-10DF-CA90BB1FEC4F";
createNode locator -n "r_feather_3_1_initLocShape" -p "r_feather_3_1_initLoc";
	rename -uid "0DE459C1-4B6B-C66F-90FD-6BB6137B527D";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_2_initLoc" -p "r_initLocs";
	rename -uid "B8E8BF4E-4EB8-7E50-A809-53BB9359D9BE";
createNode locator -n "r_feather_3_2_initLocShape" -p "r_feather_3_2_initLoc";
	rename -uid "05A0D2ED-4568-9742-1CB8-2B99779B8AE1";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_3_initLoc" -p "r_initLocs";
	rename -uid "1E580E27-4698-1C88-6A44-E79B3A6DA7B3";
createNode locator -n "r_feather_3_3_initLocShape" -p "r_feather_3_3_initLoc";
	rename -uid "13D2BE11-4285-E51D-06EA-8D879CC28123";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_4_initLoc" -p "r_initLocs";
	rename -uid "2159A66C-40A0-97D8-9350-12840708FCD7";
createNode locator -n "r_feather_3_4_initLocShape" -p "r_feather_3_4_initLoc";
	rename -uid "6E1C6BF7-4AAA-1F1C-7836-839E9328919E";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_5_initLoc" -p "r_initLocs";
	rename -uid "18696B4A-4C23-6942-DBA3-37AFA8788EB2";
createNode locator -n "r_feather_3_5_initLocShape" -p "r_feather_3_5_initLoc";
	rename -uid "31D9C5D9-46D1-2227-F9C0-D3889359FA82";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_end_initLoc" -p "r_initLocs";
	rename -uid "7F2868F6-48AF-6A70-257C-8CA868230D10";
createNode locator -n "r_feather_3_end_initLocShape" -p "r_feather_3_end_initLoc";
	rename -uid "9893AAC2-445A-2CF5-B102-9AAC697D4059";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_1_fanLoc" -p "r_initLocs";
	rename -uid "E118658A-4587-3E2D-B81F-FBAD893A8C1F";
createNode locator -n "r_feather_3_1_fanLocShape" -p "r_feather_3_1_fanLoc";
	rename -uid "4F1AABA9-4BE6-6C2C-AD88-E490BF39C4F0";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_1_initLoc" -p "r_initLocs";
	rename -uid "2D0866A2-4EA2-29A5-9E2F-B5BE809321F4";
createNode locator -n "r_feather_4_1_initLocShape" -p "r_feather_4_1_initLoc";
	rename -uid "A2945BB8-4873-10AB-48DB-ED8A7F8D423D";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_2_initLoc" -p "r_initLocs";
	rename -uid "0B29508B-4572-564A-9576-D78536E5FD2E";
createNode locator -n "r_feather_4_2_initLocShape" -p "r_feather_4_2_initLoc";
	rename -uid "91CA50E2-4F3F-D588-23AB-08811B4A2B09";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_3_initLoc" -p "r_initLocs";
	rename -uid "739213E1-4A65-1A2A-9D19-2983E817E5CE";
createNode locator -n "r_feather_4_3_initLocShape" -p "r_feather_4_3_initLoc";
	rename -uid "19EFE433-4AE1-C0CC-6FFD-ED9B85932913";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_4_initLoc" -p "r_initLocs";
	rename -uid "C6679E54-48A7-913D-6F8E-EBB6C4CA0D26";
createNode locator -n "r_feather_4_4_initLocShape" -p "r_feather_4_4_initLoc";
	rename -uid "2CBCF290-4A53-F2F4-ADEF-4083A28F1562";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_5_initLoc" -p "r_initLocs";
	rename -uid "735AAF53-4366-4D64-0045-7EBE1DF60679";
createNode locator -n "r_feather_4_5_initLocShape" -p "r_feather_4_5_initLoc";
	rename -uid "574E8224-45FE-0EE3-382E-5B93507AA3F2";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_end_initLoc" -p "r_initLocs";
	rename -uid "ED5D2493-4EAA-E718-68C1-2C901E4BDB96";
createNode locator -n "r_feather_4_end_initLocShape" -p "r_feather_4_end_initLoc";
	rename -uid "50AFFC4B-4D7B-BC3F-E0FF-C9A6EB1A0C5D";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_1_fanLoc" -p "r_initLocs";
	rename -uid "6729D777-4D94-628A-1C59-14BEA9B4AD76";
createNode locator -n "r_feather_4_1_fanLocShape" -p "r_feather_4_1_fanLoc";
	rename -uid "973C61AC-4CC1-E758-F97D-93A96DAFF06F";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_1_initLoc" -p "r_initLocs";
	rename -uid "F0B39A4C-4F95-EE43-2DB1-65AC64E304F2";
createNode locator -n "r_feather_5_1_initLocShape" -p "r_feather_5_1_initLoc";
	rename -uid "76E1CBE2-4889-99DB-1BB2-1EA7693F9ABC";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_2_initLoc" -p "r_initLocs";
	rename -uid "FE04457F-49AA-288C-08E4-6D9D695F90BB";
createNode locator -n "r_feather_5_2_initLocShape" -p "r_feather_5_2_initLoc";
	rename -uid "7C67D2E3-4D10-1F2D-EE74-8C90097285E6";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_3_initLoc" -p "r_initLocs";
	rename -uid "F991F97A-4734-F093-7558-E18E0D2F4F96";
createNode locator -n "r_feather_5_3_initLocShape" -p "r_feather_5_3_initLoc";
	rename -uid "940FAB90-402E-3A84-3EDB-EF8899216A15";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_4_initLoc" -p "r_initLocs";
	rename -uid "A933B84B-4B5D-466B-4A0A-3099301E4794";
createNode locator -n "r_feather_5_4_initLocShape" -p "r_feather_5_4_initLoc";
	rename -uid "594EC427-497A-2545-CA9C-619D8DC9E93A";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_5_initLoc" -p "r_initLocs";
	rename -uid "5C4E6F5B-4AD5-64FE-5DEC-AFAC0A934B11";
createNode locator -n "r_feather_5_5_initLocShape" -p "r_feather_5_5_initLoc";
	rename -uid "F11443E3-41A6-7AA6-4833-309911F6E218";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_end_initLoc" -p "r_initLocs";
	rename -uid "6296DD7D-4164-53C5-72CC-A8B4C2844C98";
createNode locator -n "r_feather_5_end_initLocShape" -p "r_feather_5_end_initLoc";
	rename -uid "752AB621-40CE-9D5A-34A9-F0BCFACA6A21";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_1_fanLoc" -p "r_initLocs";
	rename -uid "A298487C-4BAF-030A-AC1E-6F9D9DDCF2C6";
createNode locator -n "r_feather_5_1_fanLocShape" -p "r_feather_5_1_fanLoc";
	rename -uid "FA5F0F37-4737-E273-0822-60B97836CB10";
	setAttr -k off ".v";
createNode transform -n "lines_group" -p "posers";
	rename -uid "38AEF7D9-4244-3A78-8794-AFAD6C339092";
	setAttr ".it" no;
createNode transform -n "posers_curve_1" -p "lines_group";
	rename -uid "717DF45A-40C5-FEED-9565-D6A52FC0FC62";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape1" -p "posers_curve_1";
	rename -uid "7B78CF0B-49F6-104F-E081-D5B74B7DE5AC";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0 0.42331999999999997 0.11666
		0 0.42331999999999997 -1.19147
		0 0.42331999999999997 -2.4996
		0 0.42331999999999997 -3.8077399999999999
		0 0.42331999999999997 -5.1158699999999993
		0 0.42331999999999997 -5.9661199999999992
		;
createNode transform -n "posers_curve_1_sweepMesh" -p "lines_group";
	rename -uid "57B985D0-401E-FD80-4DD1-2F8FEC4530E5";
createNode mesh -n "posers_curve_1_sweepMeshShape" -p "posers_curve_1_sweepMesh";
	rename -uid "8ACA72A9-458F-6CA5-2328-B6B61EE8A10D";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
createNode transform -n "posers_curve_2" -p "lines_group";
	rename -uid "06EE1B7A-4985-517F-065D-98925935E06C";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape2" -p "posers_curve_2";
	rename -uid "125B0B6F-4362-0034-ACA8-4DB2AD059B08";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.17682 0.40194000000000002 0.086330000000000004
		0.32194489416691985 0.38579365629084716 -1.1717443106342593
		0.46706978833383972 0.36964731258169425 -2.4298186212685189
		0.61219468250075959 0.3535009688725414 -3.6878929319027778
		0.75731957666767946 0.33735462516338849 -4.9459672425370371
		0.84997803797830862 0.32704560566352325 -5.7492148900682931
		;
createNode transform -n "posers_curve_2_sweepMesh" -p "lines_group";
	rename -uid "F27ECE4E-4C31-3CE4-7637-3C92164B3D91";
createNode mesh -n "posers_curve_2_sweepMeshShape" -p "posers_curve_2_sweepMesh";
	rename -uid "7516F856-4F27-E92F-EE3F-DAA46691FE57";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
createNode transform -n "posers_curve_3" -p "lines_group";
	rename -uid "5979A516-4636-ED50-5C25-379B8257E72B";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape3" -p "posers_curve_3";
	rename -uid "753858A7-449A-5A1A-AAED-A584CC95A665";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.27051999999999998 0.33467000000000002 0.28125
		0.52614650008099573 0.29465339677763258 -0.96041828079116365
		0.78177501560343521 0.25463647805151041 -2.2020963512939251
		1.0374015156844307 0.21461987482914294 -3.4437646320850885
		1.2930280157654264 0.17460327160677547 -4.6854329128762524
		1.456371483018406 0.14903295430415953 -5.478849879028866
		;
createNode transform -n "posers_curve_3_sweepMesh" -p "lines_group";
	rename -uid "A140CA76-4F16-5F8D-1BBE-778964672276";
createNode mesh -n "posers_curve_3_sweepMeshShape" -p "posers_curve_3_sweepMesh";
	rename -uid "5EE5074A-43E4-A5F4-115B-1C8DE44018E0";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
createNode transform -n "posers_curve_4" -p "lines_group";
	rename -uid "953BC3D1-4751-B803-79E2-8BA3ACB260E8";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape4" -p "posers_curve_4";
	rename -uid "C5DCF197-45FC-4F80-3843-8590BFCBBB5D";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.36649999999999999 0.2293 0.28732000000000002
		0.73906991228087793 0.15210114589262197 -0.90322903900995488
		1.1116368436924471 0.074902909440312943 -2.0937685526369574
		1.484206755973325 -0.0022959446670650641 -3.2843175916469125
		1.8567736873848941 -0.079494181119374119 -4.474857105273915
		2.0928555557610711 -0.12841184492801205 -5.2292579096819694
		;
createNode transform -n "posers_curve_4_sweepMesh" -p "lines_group";
	rename -uid "41C83857-4D77-A4BD-AC9B-01BFEBA489D0";
createNode mesh -n "posers_curve_4_sweepMeshShape" -p "posers_curve_4_sweepMesh";
	rename -uid "7C7B47C2-4AED-3545-47DB-0DB56DAFEE66";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
createNode transform -n "posers_curve_5" -p "lines_group";
	rename -uid "0A374173-4589-D0C9-4DDB-86A937B7989D";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape5" -p "posers_curve_5";
	rename -uid "EF7A44BD-476D-718E-E062-4BA1EC6FA58F";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.45168999999999998 0.099720000000000003 0.33745000000000003
		0.89114431529640648 -0.03977193246331151 -0.80577840917509436
		1.3305950656190537 -0.17926273332986417 -1.9489975441682379
		1.77004938091546 -0.31875466579317568 -3.0922259533433323
		2.2095036962118666 -0.45824659825648717 -4.2354543625184267
		2.4857214280483304 -0.54592384672886352 -4.9540272543112014
		;
createNode transform -n "posers_curve_5_sweepMesh" -p "lines_group";
	rename -uid "9306626F-4A62-179A-B181-CEA802EEE10D";
createNode mesh -n "posers_curve_5_sweepMeshShape" -p "posers_curve_5_sweepMesh";
	rename -uid "0C7E0901-4CF5-CC20-30B8-E9A46AD16326";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
createNode transform -n "posers_curve_6" -p "lines_group";
	rename -uid "33B51B86-4643-2A83-45D6-DDA16BCC7100";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape6" -p "posers_curve_6";
	rename -uid "97C0722C-4D63-30D8-1E8E-E386DD828290";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.49872 -0.01788 0.39373999999999998
		0.98805203380652962 -0.19320899794846111 -0.70052916509109142
		1.4773881068390595 -0.36853944316257869 -1.7948073629046648
		1.9667201406455894 -0.54386844111103982 -2.8890765279957566
		2.4560521744521191 -0.71919743905950095 -3.9833456930868483
		2.7604401673828423 -0.82826048439690758 -4.6640335938911273
		;
createNode transform -n "posers_curve_6_sweepMesh" -p "lines_group";
	rename -uid "FAC8ABF8-407A-795C-43DE-458E6DBBA485";
createNode mesh -n "posers_curve_6_sweepMeshShape" -p "posers_curve_6_sweepMesh";
	rename -uid "C73C552C-486E-DD5B-9A3A-E1BE764A9770";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 0;
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
createNode transform -n "controls" -p "mod";
	rename -uid "FCAA7EB7-4CB0-AB78-DB1E-ABB14D792469";
createNode transform -n "base_group" -p "controls";
	rename -uid "1B3E9753-48BA-1E99-333E-08A60F420BF4";
createNode transform -n "base" -p "base_group";
	rename -uid "43EA43DA-4FA5-8302-A624-3CA1FC16A138";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "baseShape" -p "base";
	rename -uid "EB2CA517-400F-09BB-42D6-E1AC5B219EA4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.72520675020470882 -0.73272204678544128
		-1.8169336880517397e-32 0.83739662489764555 4.154189052783976e-16
		-3.2047346759303054e-17 0.72520675020470937 0.73272204678543928
		-5.5507632834890728e-17 0.41869831244882294 1.2691118128582415
		-6.409469351860612e-17 2.7540202791108836e-16 1.4654440935708788
		-5.5507632834890747e-17 -0.41869831244882261 1.2691118128582419
		-3.2047346759303091e-17 -0.72520675020470915 0.73272204678544017
		-4.0457284485328865e-32 -0.83739662489764533 9.2500463511431245e-16
		3.2047346759303029e-17 -0.7252067502047097 -0.73272204678543884
		5.5507632834890703e-17 -0.41869831244882322 -1.269111812858241
		6.4094693518606133e-17 -7.8956813695998326e-16 -1.4654440935708792
		5.5507632834890747e-17 0.41869831244882216 -1.2691118128582419
		3.204734675930314e-17 0.72520675020470882 -0.73272204678544128
		-1.8169336880517397e-32 0.83739662489764555 4.154189052783976e-16
		-3.2047346759303054e-17 0.72520675020470937 0.73272204678543928
		;
createNode transform -n "main_controls" -p "base";
	rename -uid "595C0D59-462D-B0BE-BDDC-1C96A4AFA525";
createNode transform -n "main_1_group" -p "main_controls";
	rename -uid "311201E7-48CB-124A-EBB0-89A0BA9C39BA";
createNode transform -n "main_1" -p "main_1_group";
	rename -uid "9C3C6E31-495D-2CF1-B22C-3699CE2E9B80";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_1Shape" -p "main_1";
	rename -uid "D20E9454-439F-180E-98D0-FDB66F080147";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		-7.2130455227916638e-17 -0.078741098454140124 1.1779797289820479
		-6.4531255161581202e-17 0.10132407103750003 1.0538753738059066
		-5.0567441713436904e-17 0.33298209149034114 0.63313555710279479
		-2.0629502572069106e-32 0.377133701939316 3.3796973583211848e-16
		5.0567441713436874e-17 0.33298209149034153 -0.63313555710279479
		7.1513161885653419e-17 0.10132407103750003 -1.0557749579647413
		7.9934551229229249e-17 -0.078741098454140027 -1.1801030081554871
		;
createNode transform -n "main_2_group" -p "main_controls";
	rename -uid "1A05959B-4958-5803-C293-0B9886433B71";
createNode transform -n "main_2" -p "main_2_group";
	rename -uid "8B8E11F6-4DE7-F1AC-5F15-CDBBFA2EE373";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_2Shape" -p "main_2";
	rename -uid "065B4D8B-4EC7-4C0E-A510-97B6103ADF87";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		-9.5566432472472927e-17 -0.10432494629970837 1.5607182828389372
		-8.5498168828641352e-17 0.13424537474558493 1.3962910594004487
		-6.6997359001035901e-17 0.44117163076822558 0.83884825449386502
		-2.7332254569375384e-32 0.49966858445014095 4.4777981554508709e-16
		6.6997359001035877e-17 0.44117163076822652 -0.83884825449386502
		9.4748573742444151e-17 0.13424537474558493 -1.3988078393191039
		1.0590616499130338e-16 -0.1043249462997082 -1.5635314387396948
		;
createNode transform -n "main_3_group" -p "main_controls";
	rename -uid "63133DA2-4584-63C7-5666-DAB9DAC49475";
createNode transform -n "main_3" -p "main_3_group";
	rename -uid "223F93FE-4D2E-E15B-DB78-4388CBD9BA60";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_3Shape" -p "main_3";
	rename -uid "5BF4407E-4656-E00E-3A94-9F81184A5E3B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		-1.0728913934617985e-16 -0.11712202089427341 1.7521646146607934
		-9.5985846829026731e-17 0.15071265448574592 1.5675678390839822
		-7.521562540025384e-17 0.49528818168144345 0.9417460183272568
		-3.0684980000521008e-32 0.56096069505808122 5.0270696293137813e-16
		7.5215625400253803e-17 0.49528818168144434 -0.9417460183272568
		1.0637095754341319e-16 0.15071265448574592 -1.5703933411395705
		1.1889720061114931e-16 -0.11712202089427319 -1.7553228478147391
		;
createNode transform -n "main_4_group" -p "main_controls";
	rename -uid "054D35D1-4AFD-05D1-8EBB-4EA91A1E0878";
createNode transform -n "main_4" -p "main_4_group";
	rename -uid "1598EAE2-4A5B-7363-6FAD-66B191C56700";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_4Shape" -p "main_4";
	rename -uid "9D4DB6CC-45D7-970B-2A7C-1C9A15C098FF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		-1.2031167428056161e-16 -0.13133805075503835 1.9648387496595296
		-1.0763641137968473e-16 0.16900584632281812 1.7578359973606323
		-8.4345143218695048e-17 0.55540524187820461 1.0560532119324806
		-3.4409459723750488e-32 0.62904894977544001 5.6372449952851509e-16
		8.4345143218695011e-17 0.5554052418782055 -1.0560532119324806
		1.1928204546017963e-16 0.16900584632281812 -1.761004453040887
		1.3332869813265508e-16 -0.13133805075503813 -1.9683803226541043
		;
createNode transform -n "feathers_group" -p "main_4";
	rename -uid "9F554ED5-447F-FDF8-2924-D3B676DFD2F1";
createNode transform -n "feathers" -p "feathers_group";
	rename -uid "E75FD9B3-4E97-4565-4B6F-E7A3827196CD";
	addAttr -ci true -k true -sn "spreadRoot" -ln "spreadRoot" -min -10 -max 10 -at "double";
	addAttr -ci true -k true -sn "spreadTip" -ln "spreadTip" -min -10 -max 10 -at "double";
	addAttr -ci true -k true -sn "bend" -ln "bend" -min -10 -max 10 -at "double";
	addAttr -ci true -sn "featherControls" -ln "featherControls" -dv 1 -min 0 -max 1 
		-at "bool";
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
	setAttr -k on ".spreadRoot";
	setAttr -k on ".spreadTip";
	setAttr -k on ".bend";
	setAttr -cb on ".featherControls";
createNode nurbsCurve -n "feathersShape" -p "feathers";
	rename -uid "B2484656-4E5A-2E2F-AAFC-CB88B61D41BD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-5.9642835323961076 0.555495926213597 0
		-5.9642835323961076 0.8729221697642261 0.3174262435506276
		-5.9642835323961076 1.1903484133148519 0
		-5.9642835323961076 0.8729221697642261 -0.3174262435506276
		-5.9642835323961076 0.555495926213597 0
		;
createNode transform -n "feather_controls" -p "base";
	rename -uid "F117072C-4949-BABC-7008-D0BA79ECA856";
createNode transform -n "m_feather_1_group" -p "feather_controls";
	rename -uid "EEAA2471-4917-B3D6-E2E4-6F99333C7C71";
createNode transform -n "m_feather_1" -p "m_feather_1_group";
	rename -uid "80EA506A-41D6-D216-ADBD-15AC515C9281";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_1Shape" -p "m_feather_1";
	rename -uid "00A5C8F0-4095-0D3C-F667-87B64C6A4401";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "m_feather_2_group" -p "m_feather_1";
	rename -uid "B7EACBA3-48EF-C1DE-93C7-1BB52E26C435";
createNode transform -n "m_feather_2_bendGroup" -p "m_feather_2_group";
	rename -uid "4513CDEF-4C9B-651C-44CB-BEA526B3820A";
createNode transform -n "m_feather_2_mainGroup" -p "m_feather_2_bendGroup";
	rename -uid "461E7536-4263-BB5E-1D61-8287B81A92AA";
createNode transform -n "m_feather_2" -p "m_feather_2_mainGroup";
	rename -uid "8ECE5EF6-41E7-D556-8955-86A7F7CF57A8";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_2Shape" -p "m_feather_2";
	rename -uid "57006B63-4FAC-5BB0-E5B3-86937080A3DA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "m_feather_3_group" -p "m_feather_2";
	rename -uid "A313E92A-463A-B97D-C985-17AA7B97950D";
createNode transform -n "m_feather_3_bendGroup" -p "m_feather_3_group";
	rename -uid "2CE35343-4511-97CA-D47A-7FA4DC535F18";
createNode transform -n "m_feather_3_mainGroup" -p "m_feather_3_bendGroup";
	rename -uid "108A0B0A-4149-061B-B5CE-C7958137BFF8";
createNode transform -n "m_feather_3" -p "m_feather_3_mainGroup";
	rename -uid "EED32C5D-4A13-5C5F-ED54-538A5FC2D04B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_3Shape" -p "m_feather_3";
	rename -uid "A37949C2-41B0-126B-D083-BA87DC6E3795";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "m_feather_4_group" -p "m_feather_3";
	rename -uid "99373CF1-48F0-360A-9B19-B39F74B62CFD";
createNode transform -n "m_feather_4_bendGroup" -p "m_feather_4_group";
	rename -uid "6378CDAD-48E7-C13E-A090-92BAEE6FFA14";
createNode transform -n "m_feather_4_mainGroup" -p "m_feather_4_bendGroup";
	rename -uid "F055EDE6-4C3B-C472-258B-C0AE870900B0";
createNode transform -n "m_feather_4" -p "m_feather_4_mainGroup";
	rename -uid "BC802EBB-456B-1A04-9C52-ABB8BA38E08B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_4Shape" -p "m_feather_4";
	rename -uid "7C94139D-4BA0-A07D-94FF-6A87B25B52A2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "m_feather_5_group" -p "m_feather_4";
	rename -uid "C87A5CD1-4632-CE40-5326-C59918F649DD";
createNode transform -n "m_feather_5_bendGroup" -p "m_feather_5_group";
	rename -uid "06186880-4BCF-2421-B03A-2AB86509F768";
createNode transform -n "m_feather_5_mainGroup" -p "m_feather_5_bendGroup";
	rename -uid "A31AD51D-4F94-7686-B16E-8080C4007FD0";
createNode transform -n "m_feather_5" -p "m_feather_5_mainGroup";
	rename -uid "A1926CB6-4EEE-8A4A-DCFF-A896D047D1AE";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_5Shape" -p "m_feather_5";
	rename -uid "A0A5326F-4267-AC54-9540-558E299748D9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_1_1_group" -p "feather_controls";
	rename -uid "C8F73752-4672-8DFC-924C-A490342074A2";
createNode transform -n "l_feather_1_1_spreadRootGroup" -p "l_feather_1_1_group";
	rename -uid "78B1BA49-4D88-A00E-85F2-2599995942A4";
createNode transform -n "l_feather_1_1_spreadGroup" -p "l_feather_1_1_spreadRootGroup";
	rename -uid "2CB40DCC-45A9-D1F8-75E7-B1A1A8ED0949";
createNode transform -n "l_feather_1_1_rollGroup" -p "l_feather_1_1_spreadGroup";
	rename -uid "2F2FA0EF-47EF-149E-9D8D-8BB7A444ABC3";
createNode transform -n "l_feather_1_1" -p "l_feather_1_1_rollGroup";
	rename -uid "76A17D18-4AFF-E434-5CC9-59861235ED66";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_1Shape" -p "l_feather_1_1";
	rename -uid "B3E2BC8E-4863-BE06-F93F-638CE98690C4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_1_2_group" -p "l_feather_1_1";
	rename -uid "4AC6C4C0-4001-8B98-1B94-C1AF6A25340A";
createNode transform -n "l_feather_1_2_spreadGroup" -p "l_feather_1_2_group";
	rename -uid "FFC60B22-44F9-0D77-5970-7E8378779301";
createNode transform -n "l_feather_1_2_bendGroup" -p "l_feather_1_2_spreadGroup";
	rename -uid "CF4C767B-4951-4495-FF83-DCBFA4A4B33A";
createNode transform -n "l_feather_1_2_mainGroup" -p "l_feather_1_2_bendGroup";
	rename -uid "75B32C50-49C8-C822-2D4E-CFA93B850D4E";
createNode transform -n "l_feather_1_2_rollGroup" -p "l_feather_1_2_mainGroup";
	rename -uid "3985DD01-4687-AB8F-317A-7D88CBE124D3";
createNode transform -n "l_feather_1_2" -p "l_feather_1_2_rollGroup";
	rename -uid "30F87BD3-48EE-B9C6-F688-4D9B92D265F6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_2Shape" -p "l_feather_1_2";
	rename -uid "F56BE6DF-4B8D-E475-F799-9FB843832A62";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_1_3_group" -p "l_feather_1_2";
	rename -uid "4236B869-4DA2-C17F-6088-E2BB9E840619";
createNode transform -n "l_feather_1_3_spreadGroup" -p "l_feather_1_3_group";
	rename -uid "2F8ED2C9-4724-517A-4F7D-9C8ED9DF8803";
createNode transform -n "l_feather_1_3_bendGroup" -p "l_feather_1_3_spreadGroup";
	rename -uid "5CAC5B72-42D7-CA73-489A-1EAF0F677700";
createNode transform -n "l_feather_1_3_mainGroup" -p "l_feather_1_3_bendGroup";
	rename -uid "2EA76447-4FBD-7253-A326-91BFCE64F844";
createNode transform -n "l_feather_1_3_rollGroup" -p "l_feather_1_3_mainGroup";
	rename -uid "E1123710-4D5E-CAE3-8B79-90854666F12C";
createNode transform -n "l_feather_1_3" -p "l_feather_1_3_rollGroup";
	rename -uid "C2B4737F-45BB-DED2-1D30-D6BE1290E4CD";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_3Shape" -p "l_feather_1_3";
	rename -uid "C47A1B29-40A3-9674-23A9-DCBE4CA172EE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_1_4_group" -p "l_feather_1_3";
	rename -uid "FE703FA3-4CB4-5D93-AF57-ADB5F5BFB748";
createNode transform -n "l_feather_1_4_spreadGroup" -p "l_feather_1_4_group";
	rename -uid "1158BB6A-4AEE-9FAE-29F1-BAA569F020B4";
createNode transform -n "l_feather_1_4_bendGroup" -p "l_feather_1_4_spreadGroup";
	rename -uid "8A1B00A0-4CDF-F255-F404-7386FEB5BB0D";
createNode transform -n "l_feather_1_4_mainGroup" -p "l_feather_1_4_bendGroup";
	rename -uid "D6104760-42E7-2756-364E-13BDBF91EE9B";
createNode transform -n "l_feather_1_4_rollGroup" -p "l_feather_1_4_mainGroup";
	rename -uid "6971D85B-459F-FD06-5996-AEA165A13967";
createNode transform -n "l_feather_1_4" -p "l_feather_1_4_rollGroup";
	rename -uid "A18C2EC7-465B-9331-72C4-E083F4BA0DB6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_4Shape" -p "l_feather_1_4";
	rename -uid "4B9753DF-4568-32DC-9D49-FBB99CA40484";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_1_5_group" -p "l_feather_1_4";
	rename -uid "C910CA81-41EA-B0C7-F6DE-77B7677C1CD0";
createNode transform -n "l_feather_1_5_spreadGroup" -p "l_feather_1_5_group";
	rename -uid "2BAA6D6E-4919-13E5-D2D4-1CACE6B744BA";
createNode transform -n "l_feather_1_5_bendGroup" -p "l_feather_1_5_spreadGroup";
	rename -uid "913B02D6-4EC6-0F83-EE1F-86AD2628FC1E";
createNode transform -n "l_feather_1_5_mainGroup" -p "l_feather_1_5_bendGroup";
	rename -uid "8FBDA192-4313-FA1B-F3F9-6D8AC89BAA45";
createNode transform -n "l_feather_1_5_rollGroup" -p "l_feather_1_5_mainGroup";
	rename -uid "DC8C7AB5-4B04-38F3-6FD5-C58C6C17BF91";
createNode transform -n "l_feather_1_5" -p "l_feather_1_5_rollGroup";
	rename -uid "865D4356-46B4-3B55-CFDE-3EA8896E0CBE";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_5Shape" -p "l_feather_1_5";
	rename -uid "B9C6D5C0-4280-9D5C-0351-1F857827408E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_2_1_group" -p "feather_controls";
	rename -uid "FE7F3F78-4A8A-B25E-A2B7-2D9AA5BD2C26";
createNode transform -n "l_feather_2_1_spreadRootGroup" -p "l_feather_2_1_group";
	rename -uid "FAD88349-4D3C-A3BA-6DA1-379C6BB45EEF";
createNode transform -n "l_feather_2_1_spreadGroup" -p "l_feather_2_1_spreadRootGroup";
	rename -uid "04FFDEAA-4AF6-4EA7-4194-D69FBC1617E9";
createNode transform -n "l_feather_2_1_rollGroup" -p "l_feather_2_1_spreadGroup";
	rename -uid "3EDE5EE2-433B-6E14-A9EE-87BBB3027DF9";
createNode transform -n "l_feather_2_1" -p "l_feather_2_1_rollGroup";
	rename -uid "438C9A6E-4B4D-7B98-2AC3-13897A86490C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_1Shape" -p "l_feather_2_1";
	rename -uid "E7D63DC2-4D43-FA53-51D4-13ACD0428781";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_2_2_group" -p "l_feather_2_1";
	rename -uid "0EF20000-4B23-6D5F-A872-8C9E69EB67C2";
createNode transform -n "l_feather_2_2_spreadGroup" -p "l_feather_2_2_group";
	rename -uid "811B3775-495C-D919-0DA2-C1BCBC6FE1BF";
createNode transform -n "l_feather_2_2_bendGroup" -p "l_feather_2_2_spreadGroup";
	rename -uid "A35F1EB7-435B-6F3D-6CE1-3698D7877490";
createNode transform -n "l_feather_2_2_mainGroup" -p "l_feather_2_2_bendGroup";
	rename -uid "89EF25FF-4862-A360-0076-7C8FBF7727DD";
createNode transform -n "l_feather_2_2_rollGroup" -p "l_feather_2_2_mainGroup";
	rename -uid "EA3C7693-4C89-823A-4AC9-2FB22DDEA5DC";
createNode transform -n "l_feather_2_2" -p "l_feather_2_2_rollGroup";
	rename -uid "B7E9E1BE-4F16-B87F-0215-F4AC6A6CB649";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_2Shape" -p "l_feather_2_2";
	rename -uid "A10ED1AA-4C46-A431-751A-02961D1C933F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_2_3_group" -p "l_feather_2_2";
	rename -uid "0C52CC3F-47B0-3FC0-2379-43A1C98BE249";
createNode transform -n "l_feather_2_3_spreadGroup" -p "l_feather_2_3_group";
	rename -uid "396FEA7E-48EC-CB95-28EC-7EBD52D5826B";
createNode transform -n "l_feather_2_3_bendGroup" -p "l_feather_2_3_spreadGroup";
	rename -uid "5DBC41C5-4356-FEE5-CF02-44BB560C15FE";
createNode transform -n "l_feather_2_3_mainGroup" -p "l_feather_2_3_bendGroup";
	rename -uid "2CA81BE3-49A2-B492-C033-7B96E15D98CF";
createNode transform -n "l_feather_2_3_rollGroup" -p "l_feather_2_3_mainGroup";
	rename -uid "43ADBBE2-481E-491A-A9F0-B9B3BF49CAC1";
createNode transform -n "l_feather_2_3" -p "l_feather_2_3_rollGroup";
	rename -uid "AE56BED6-4A63-E90E-4C06-28B0BC2DDE19";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_3Shape" -p "l_feather_2_3";
	rename -uid "210897DB-4E97-EB15-0410-DAB7BE2391DB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_2_4_group" -p "l_feather_2_3";
	rename -uid "CFC81DB6-4217-BBE9-0E48-7C84A0133F93";
createNode transform -n "l_feather_2_4_spreadGroup" -p "l_feather_2_4_group";
	rename -uid "8BD3D651-4915-0A45-91C7-EF8F16CE433F";
createNode transform -n "l_feather_2_4_bendGroup" -p "l_feather_2_4_spreadGroup";
	rename -uid "CC45DCBC-4ECF-7A9A-1160-E79A40DB4515";
createNode transform -n "l_feather_2_4_mainGroup" -p "l_feather_2_4_bendGroup";
	rename -uid "304B99E5-4730-BB45-4AC8-4283787B865C";
createNode transform -n "l_feather_2_4_rollGroup" -p "l_feather_2_4_mainGroup";
	rename -uid "A0097193-45F9-70B7-9CF0-4B80D82CF411";
createNode transform -n "l_feather_2_4" -p "l_feather_2_4_rollGroup";
	rename -uid "2D3744A2-46B9-F6D5-7FA2-20AC76458F2B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_4Shape" -p "l_feather_2_4";
	rename -uid "E1605847-43A9-3B9C-DBA8-B8B96CF6F38E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_2_5_group" -p "l_feather_2_4";
	rename -uid "EDE429FC-43ED-8E6E-6E72-24B6EB0467D9";
createNode transform -n "l_feather_2_5_spreadGroup" -p "l_feather_2_5_group";
	rename -uid "0ACF71A5-41E9-BA65-40B9-6A95BF31ECC2";
createNode transform -n "l_feather_2_5_bendGroup" -p "l_feather_2_5_spreadGroup";
	rename -uid "3010277E-4946-2DBC-098B-1DAE5D7E1E75";
createNode transform -n "l_feather_2_5_mainGroup" -p "l_feather_2_5_bendGroup";
	rename -uid "ACFDC92E-4305-AF6D-97F7-7692ADDC145B";
createNode transform -n "l_feather_2_5_rollGroup" -p "l_feather_2_5_mainGroup";
	rename -uid "BC951737-4ECB-5D51-F884-B3AF1DBF78E4";
createNode transform -n "l_feather_2_5" -p "l_feather_2_5_rollGroup";
	rename -uid "14726FD7-497A-7B65-EDBF-D4864FF144B6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_5Shape" -p "l_feather_2_5";
	rename -uid "C2F6FAE5-4E43-01E4-1032-128D2B781251";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_3_1_group" -p "feather_controls";
	rename -uid "4449B8FF-4372-2100-9F60-61BE27099AA5";
createNode transform -n "l_feather_3_1_spreadRootGroup" -p "l_feather_3_1_group";
	rename -uid "48CCD75B-4DF7-08C9-B737-A4B27F9BAE0B";
createNode transform -n "l_feather_3_1_spreadGroup" -p "l_feather_3_1_spreadRootGroup";
	rename -uid "18BFED94-488B-5186-7C18-9D8F5C6AF4D8";
createNode transform -n "l_feather_3_1_rollGroup" -p "l_feather_3_1_spreadGroup";
	rename -uid "AF00CB58-4A51-9EF0-BC6F-C38586ED4AFA";
createNode transform -n "l_feather_3_1" -p "l_feather_3_1_rollGroup";
	rename -uid "9F5B5EC0-4A51-52E2-DE64-32ACFE088671";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_1Shape" -p "l_feather_3_1";
	rename -uid "4294DD17-40F5-223D-B42B-3183E1D71DC8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_3_2_group" -p "l_feather_3_1";
	rename -uid "74697905-4D74-D136-A7A3-A3888FFBDCD2";
createNode transform -n "l_feather_3_2_spreadGroup" -p "l_feather_3_2_group";
	rename -uid "B9729A7D-49DA-7097-3086-8A987EA05CED";
createNode transform -n "l_feather_3_2_bendGroup" -p "l_feather_3_2_spreadGroup";
	rename -uid "CB600AD6-4C2D-CAA3-0F5B-9BBE426A61E8";
createNode transform -n "l_feather_3_2_mainGroup" -p "l_feather_3_2_bendGroup";
	rename -uid "0A3E28E3-497C-CF82-9A55-5FA29D308F90";
createNode transform -n "l_feather_3_2_rollGroup" -p "l_feather_3_2_mainGroup";
	rename -uid "6F2740E5-4678-8EA0-BD1D-90834953ED80";
createNode transform -n "l_feather_3_2" -p "l_feather_3_2_rollGroup";
	rename -uid "91284057-48F5-E9C4-9FBA-3EA785D011A6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_2Shape" -p "l_feather_3_2";
	rename -uid "F522CD89-41BB-E904-6245-92A19A2CE37D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_3_3_group" -p "l_feather_3_2";
	rename -uid "52B39EDE-4DBF-4A82-C9DC-9CB9D8CAF94B";
createNode transform -n "l_feather_3_3_spreadGroup" -p "l_feather_3_3_group";
	rename -uid "F7DC9A28-452D-993E-D45B-35A5A01AC0FC";
createNode transform -n "l_feather_3_3_bendGroup" -p "l_feather_3_3_spreadGroup";
	rename -uid "CC11CBAB-466E-E130-C7FB-318935547E29";
createNode transform -n "l_feather_3_3_mainGroup" -p "l_feather_3_3_bendGroup";
	rename -uid "928E4DC4-4A2B-112F-8EAF-CE97847344FE";
createNode transform -n "l_feather_3_3_rollGroup" -p "l_feather_3_3_mainGroup";
	rename -uid "31491E3C-4A5E-827F-3B46-1EBFFF1FA84B";
createNode transform -n "l_feather_3_3" -p "l_feather_3_3_rollGroup";
	rename -uid "34D4852E-476A-3AFB-A8B7-8B84C43C67E6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_3Shape" -p "l_feather_3_3";
	rename -uid "2734152C-4C78-C24A-F0A4-58A52C86A2AC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_3_4_group" -p "l_feather_3_3";
	rename -uid "77A30978-4557-87E0-8E9B-218A9D1CFC2C";
createNode transform -n "l_feather_3_4_spreadGroup" -p "l_feather_3_4_group";
	rename -uid "96CA7B49-4E5C-1AA7-F833-3CA4F58865ED";
createNode transform -n "l_feather_3_4_bendGroup" -p "l_feather_3_4_spreadGroup";
	rename -uid "864F92C9-429C-990E-5CE1-6EB553CD9BB5";
createNode transform -n "l_feather_3_4_mainGroup" -p "l_feather_3_4_bendGroup";
	rename -uid "6F987EED-472C-6E57-2C14-ACA122DEEBD8";
createNode transform -n "l_feather_3_4_rollGroup" -p "l_feather_3_4_mainGroup";
	rename -uid "33B72B22-4F84-9DE3-241A-81AFF0ADE50D";
createNode transform -n "l_feather_3_4" -p "l_feather_3_4_rollGroup";
	rename -uid "0D96AFFF-4975-5C05-249D-A8A3EE6E5EC7";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_4Shape" -p "l_feather_3_4";
	rename -uid "263E65F7-45ED-8A50-CAAB-51962BDA3534";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_3_5_group" -p "l_feather_3_4";
	rename -uid "AD5B07F0-4C8D-E821-4022-2BA6E2BFD1E1";
createNode transform -n "l_feather_3_5_spreadGroup" -p "l_feather_3_5_group";
	rename -uid "9743CF43-4CA2-53B6-4466-7AABE9766802";
createNode transform -n "l_feather_3_5_bendGroup" -p "l_feather_3_5_spreadGroup";
	rename -uid "DD0948E5-4C3D-5D07-D11C-3EAB80CF4637";
createNode transform -n "l_feather_3_5_mainGroup" -p "l_feather_3_5_bendGroup";
	rename -uid "E58BD862-4633-24E9-0D1A-4A806C949948";
createNode transform -n "l_feather_3_5_rollGroup" -p "l_feather_3_5_mainGroup";
	rename -uid "063A797F-4276-C64E-042A-F0B902EE1E92";
createNode transform -n "l_feather_3_5" -p "l_feather_3_5_rollGroup";
	rename -uid "C6CEB930-4A2E-2436-6AFF-7E8F56FEC87C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_5Shape" -p "l_feather_3_5";
	rename -uid "E468C000-4A05-A25D-EB0B-6B9DF2A8A639";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_4_1_group" -p "feather_controls";
	rename -uid "BCA27387-4044-F1F1-6ACF-219C7C3C627F";
createNode transform -n "l_feather_4_1_spreadRootGroup" -p "l_feather_4_1_group";
	rename -uid "6C09C2F8-45C1-8EF5-BC87-CEAE7F56F1E3";
createNode transform -n "l_feather_4_1_spreadGroup" -p "l_feather_4_1_spreadRootGroup";
	rename -uid "6F06FDED-4773-C8DA-ABBE-1EB49DBB5F31";
createNode transform -n "l_feather_4_1_rollGroup" -p "l_feather_4_1_spreadGroup";
	rename -uid "15CD2D59-4B9D-02ED-98BB-C4B98CB1324F";
createNode transform -n "l_feather_4_1" -p "l_feather_4_1_rollGroup";
	rename -uid "3DA5FE09-4AE9-0249-118C-C7A750B4AB28";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_1Shape" -p "l_feather_4_1";
	rename -uid "10B09CC6-47E7-5992-3B15-A0A96DD25DCA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_4_2_group" -p "l_feather_4_1";
	rename -uid "76E29167-468F-F5D2-7390-7E87B615BBA4";
createNode transform -n "l_feather_4_2_spreadGroup" -p "l_feather_4_2_group";
	rename -uid "A3581732-49C0-6276-2455-3DB70C54D06F";
createNode transform -n "l_feather_4_2_bendGroup" -p "l_feather_4_2_spreadGroup";
	rename -uid "89CF52FF-4047-6FAE-B008-05950C717712";
createNode transform -n "l_feather_4_2_mainGroup" -p "l_feather_4_2_bendGroup";
	rename -uid "D78D52CB-42A6-783B-2F5B-3C95611C1FE5";
createNode transform -n "l_feather_4_2_rollGroup" -p "l_feather_4_2_mainGroup";
	rename -uid "E60D061F-47C7-FA81-7FE9-CCB8EE0365EF";
createNode transform -n "l_feather_4_2" -p "l_feather_4_2_rollGroup";
	rename -uid "6864E5AE-48B4-62DF-6FB0-FAA04037B4DA";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_2Shape" -p "l_feather_4_2";
	rename -uid "1001F37E-4F2D-0CC2-E046-E88E0E4EBD2F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_4_3_group" -p "l_feather_4_2";
	rename -uid "8C9A8EE9-4BC8-5768-E5AE-5E8A6CBDB3D2";
createNode transform -n "l_feather_4_3_spreadGroup" -p "l_feather_4_3_group";
	rename -uid "361A96D0-4BE6-FED6-2AF2-63BB156D61D0";
createNode transform -n "l_feather_4_3_bendGroup" -p "l_feather_4_3_spreadGroup";
	rename -uid "C26C7464-4A12-08FF-CB13-2C813C0413DD";
createNode transform -n "l_feather_4_3_mainGroup" -p "l_feather_4_3_bendGroup";
	rename -uid "7543CD9E-47E7-F462-6A44-D287DE4348DC";
createNode transform -n "l_feather_4_3_rollGroup" -p "l_feather_4_3_mainGroup";
	rename -uid "9E412B90-4C29-4958-83FD-A596CD675B7F";
createNode transform -n "l_feather_4_3" -p "l_feather_4_3_rollGroup";
	rename -uid "4E72BBC6-4238-2314-2CEA-8E9F4CE5D1DA";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_3Shape" -p "l_feather_4_3";
	rename -uid "704A9ED7-43FC-2982-8E99-7284BB9640D8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_4_4_group" -p "l_feather_4_3";
	rename -uid "453A47C4-43B8-E7A7-9D29-B681B99B1C4F";
createNode transform -n "l_feather_4_4_spreadGroup" -p "l_feather_4_4_group";
	rename -uid "A40DC247-45EB-14C4-DFD5-E293403906E0";
createNode transform -n "l_feather_4_4_bendGroup" -p "l_feather_4_4_spreadGroup";
	rename -uid "6F9BD1A3-4FAA-D213-FB54-389DB8BB1E06";
createNode transform -n "l_feather_4_4_mainGroup" -p "l_feather_4_4_bendGroup";
	rename -uid "50D47C8A-41B4-232B-60A9-0CA1552BAFFE";
createNode transform -n "l_feather_4_4_rollGroup" -p "l_feather_4_4_mainGroup";
	rename -uid "E821A5D0-4F86-F132-5CCD-4186DD5D4FC6";
createNode transform -n "l_feather_4_4" -p "l_feather_4_4_rollGroup";
	rename -uid "D5830391-433D-DEAD-000B-2FAC6825DBE0";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_4Shape" -p "l_feather_4_4";
	rename -uid "F025A6EA-4A54-2505-6B59-B5918C5CC987";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_4_5_group" -p "l_feather_4_4";
	rename -uid "9A162305-47F6-CA8F-294F-D0A79B336A09";
createNode transform -n "l_feather_4_5_spreadGroup" -p "l_feather_4_5_group";
	rename -uid "DF736E71-4B55-8EF5-7369-AA953102808F";
createNode transform -n "l_feather_4_5_bendGroup" -p "l_feather_4_5_spreadGroup";
	rename -uid "C16EAA29-47CD-2E6C-D312-06BCBFB134E4";
createNode transform -n "l_feather_4_5_mainGroup" -p "l_feather_4_5_bendGroup";
	rename -uid "20ECFCDB-4EA5-E10F-F5D4-DD8B7BB432D0";
createNode transform -n "l_feather_4_5_rollGroup" -p "l_feather_4_5_mainGroup";
	rename -uid "232F6157-48BF-A99D-FA5B-F1BB1DF18FC2";
createNode transform -n "l_feather_4_5" -p "l_feather_4_5_rollGroup";
	rename -uid "0FE26DB2-44D1-305D-022E-FA88AA9159D5";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_5Shape" -p "l_feather_4_5";
	rename -uid "7980F500-4691-90C8-9155-F89A4EF72CFC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_5_1_group" -p "feather_controls";
	rename -uid "D4FED831-4DE4-2208-F060-C18F036A5CA5";
createNode transform -n "l_feather_5_1_spreadRootGroup" -p "l_feather_5_1_group";
	rename -uid "52EA9ECE-403B-E8FD-8FBD-CFB610F8F3BC";
createNode transform -n "l_feather_5_1_spreadGroup" -p "l_feather_5_1_spreadRootGroup";
	rename -uid "6225A5C6-4127-A9E4-64C9-1B86D0A45761";
createNode transform -n "l_feather_5_1_rollGroup" -p "l_feather_5_1_spreadGroup";
	rename -uid "086BD95F-4B25-78A8-E444-C3A0D5ED3026";
createNode transform -n "l_feather_5_1" -p "l_feather_5_1_rollGroup";
	rename -uid "C1B37E68-448A-BBB4-8723-F5B4346D2960";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_1Shape" -p "l_feather_5_1";
	rename -uid "D7C37500-41B9-CA0E-E130-25AD9998D78A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_5_2_group" -p "l_feather_5_1";
	rename -uid "906024F7-41B0-D9B6-9427-E2B56641FC9A";
createNode transform -n "l_feather_5_2_spreadGroup" -p "l_feather_5_2_group";
	rename -uid "D67733CF-4379-65F7-4758-4DBA94860D1B";
createNode transform -n "l_feather_5_2_bendGroup" -p "l_feather_5_2_spreadGroup";
	rename -uid "45EFE233-4B98-F959-89C0-D28E3D1FCBEE";
createNode transform -n "l_feather_5_2_mainGroup" -p "l_feather_5_2_bendGroup";
	rename -uid "7FCF38FC-4DA5-5FEF-B19C-0AACA5E2475B";
createNode transform -n "l_feather_5_2_rollGroup" -p "l_feather_5_2_mainGroup";
	rename -uid "311BE4C3-471B-73A6-C52D-19B5535288E0";
createNode transform -n "l_feather_5_2" -p "l_feather_5_2_rollGroup";
	rename -uid "76685C51-4331-482D-96A7-05B8A21BE1D9";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_2Shape" -p "l_feather_5_2";
	rename -uid "1C7A848D-4AB7-4035-73C4-76B80A8A97C3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_5_3_group" -p "l_feather_5_2";
	rename -uid "23573249-44A3-8915-B5F0-13BC5100A6A2";
createNode transform -n "l_feather_5_3_spreadGroup" -p "l_feather_5_3_group";
	rename -uid "5EE59B6C-4E0D-A0BB-9797-5998F654A900";
createNode transform -n "l_feather_5_3_bendGroup" -p "l_feather_5_3_spreadGroup";
	rename -uid "8AD1D9B8-4391-695C-2B56-E48D220D95C8";
createNode transform -n "l_feather_5_3_mainGroup" -p "l_feather_5_3_bendGroup";
	rename -uid "EA8D72E4-4F07-C421-B303-50805BC75DC3";
createNode transform -n "l_feather_5_3_rollGroup" -p "l_feather_5_3_mainGroup";
	rename -uid "528FE9B4-4020-81EF-AFE2-F3847DB12AA8";
createNode transform -n "l_feather_5_3" -p "l_feather_5_3_rollGroup";
	rename -uid "CC8F301A-49CF-8869-C7BE-19998435E76B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_3Shape" -p "l_feather_5_3";
	rename -uid "E405E731-43EC-7711-3FFE-7987C9898506";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_5_4_group" -p "l_feather_5_3";
	rename -uid "2F5CFF35-441B-C6BF-ADB3-B2BD42BF8FC8";
createNode transform -n "l_feather_5_4_spreadGroup" -p "l_feather_5_4_group";
	rename -uid "A5A30118-4BDB-BC63-9421-008BCAD5D7F0";
createNode transform -n "l_feather_5_4_bendGroup" -p "l_feather_5_4_spreadGroup";
	rename -uid "5312E1D1-43B6-4DDD-E51D-E6911B293552";
createNode transform -n "l_feather_5_4_mainGroup" -p "l_feather_5_4_bendGroup";
	rename -uid "F30CB1A4-4426-0E6D-E86D-51A9FCF89AFE";
createNode transform -n "l_feather_5_4_rollGroup" -p "l_feather_5_4_mainGroup";
	rename -uid "03AF75A5-4BB8-6329-5E01-79A5CE12D32A";
createNode transform -n "l_feather_5_4" -p "l_feather_5_4_rollGroup";
	rename -uid "28E4B389-4321-89B0-B664-5A8F7AB9D247";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_4Shape" -p "l_feather_5_4";
	rename -uid "C6AEE3BF-4E34-EB44-C527-E4B6F3A8FA8F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "l_feather_5_5_group" -p "l_feather_5_4";
	rename -uid "9182160C-4A3C-8049-5ACE-FFB88D25374C";
createNode transform -n "l_feather_5_5_spreadGroup" -p "l_feather_5_5_group";
	rename -uid "1505E615-4416-67B9-6AC9-54BF2D2A0ED5";
createNode transform -n "l_feather_5_5_bendGroup" -p "l_feather_5_5_spreadGroup";
	rename -uid "4EA61A1D-46F8-4BBF-CE50-2996B0FD8D37";
createNode transform -n "l_feather_5_5_mainGroup" -p "l_feather_5_5_bendGroup";
	rename -uid "057D5DCE-451F-FDDE-BF8A-B5ACD2B4E9EE";
createNode transform -n "l_feather_5_5_rollGroup" -p "l_feather_5_5_mainGroup";
	rename -uid "4D8747D6-43A9-C470-3DFE-6592D530DE42";
createNode transform -n "l_feather_5_5" -p "l_feather_5_5_rollGroup";
	rename -uid "C4C50993-44EE-E96B-2B23-109AD88CDDC1";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_5Shape" -p "l_feather_5_5";
	rename -uid "AAF06C4F-45EC-C771-70D8-F4978F3E3EAB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_1_1_group" -p "feather_controls";
	rename -uid "81E9CD3A-4D03-81A8-64AE-4D83CA0E0539";
createNode transform -n "r_feather_1_1_spreadRootGroup" -p "r_feather_1_1_group";
	rename -uid "DD731B69-452F-CFB1-FE32-68B2A74B077C";
createNode transform -n "r_feather_1_1_spreadGroup" -p "r_feather_1_1_spreadRootGroup";
	rename -uid "CC083F2A-4465-836E-45A5-BDB7E27301E1";
createNode transform -n "r_feather_1_1_rollGroup" -p "r_feather_1_1_spreadGroup";
	rename -uid "31596A2F-4F3E-86FE-04CF-6095E8D11961";
createNode transform -n "r_feather_1_1" -p "r_feather_1_1_rollGroup";
	rename -uid "51E465DF-4E8A-4A4F-108C-F6B2F47FC59B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_1Shape" -p "r_feather_1_1";
	rename -uid "44D727CC-4817-8D67-B6A0-5A85072A9B73";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_1_2_group" -p "r_feather_1_1";
	rename -uid "EDFF3287-43CF-4F49-8DD9-78BF5C1431F2";
createNode transform -n "r_feather_1_2_spreadGroup" -p "r_feather_1_2_group";
	rename -uid "4D9B732B-4881-6639-AEF5-2691792F76F5";
createNode transform -n "r_feather_1_2_bendGroup" -p "r_feather_1_2_spreadGroup";
	rename -uid "A7819F50-4468-0589-BF20-88A0E8AA29D4";
createNode transform -n "r_feather_1_2_mainGroup" -p "r_feather_1_2_bendGroup";
	rename -uid "F2E067ED-4ED6-65B1-9425-B581F859A567";
createNode transform -n "r_feather_1_2_rollGroup" -p "r_feather_1_2_mainGroup";
	rename -uid "85649057-4936-9226-A662-B78972089192";
createNode transform -n "r_feather_1_2" -p "r_feather_1_2_rollGroup";
	rename -uid "CF3AFCA5-4512-3551-8CD8-DC81E007B835";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_2Shape" -p "r_feather_1_2";
	rename -uid "52E0403D-47C1-3FDF-D07C-D9BEEF1DCADD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_1_3_group" -p "r_feather_1_2";
	rename -uid "83B53BBC-4C95-C65D-1688-14A5363E5444";
createNode transform -n "r_feather_1_3_spreadGroup" -p "r_feather_1_3_group";
	rename -uid "31BF0AA4-4208-9729-2515-81B8B9AB14E8";
createNode transform -n "r_feather_1_3_bendGroup" -p "r_feather_1_3_spreadGroup";
	rename -uid "58BDA2AF-4DE7-EA21-5E31-3DB31AF3036F";
createNode transform -n "r_feather_1_3_mainGroup" -p "r_feather_1_3_bendGroup";
	rename -uid "7DAAE49C-4475-8B39-C622-FB874C7107CB";
createNode transform -n "r_feather_1_3_rollGroup" -p "r_feather_1_3_mainGroup";
	rename -uid "1887C7F6-4103-BFCF-3414-9980F8683C24";
createNode transform -n "r_feather_1_3" -p "r_feather_1_3_rollGroup";
	rename -uid "B6651C34-4DFD-052D-742D-928837FBC67C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_3Shape" -p "r_feather_1_3";
	rename -uid "F02B4AC5-44DE-A3CD-15F6-B5978A4235E2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_1_4_group" -p "r_feather_1_3";
	rename -uid "D7B4D118-4882-7862-2CFA-8C82F70A8351";
createNode transform -n "r_feather_1_4_spreadGroup" -p "r_feather_1_4_group";
	rename -uid "E9246CA9-4B5F-45DE-2BA2-CBBBA9588662";
createNode transform -n "r_feather_1_4_bendGroup" -p "r_feather_1_4_spreadGroup";
	rename -uid "0207676B-4F9C-FF84-0DC1-B0805512F3E5";
createNode transform -n "r_feather_1_4_mainGroup" -p "r_feather_1_4_bendGroup";
	rename -uid "E8072CD0-4B89-DE5B-B26D-D3B2E00123B6";
createNode transform -n "r_feather_1_4_rollGroup" -p "r_feather_1_4_mainGroup";
	rename -uid "18807C48-4F91-A62A-58FA-B0857D946726";
createNode transform -n "r_feather_1_4" -p "r_feather_1_4_rollGroup";
	rename -uid "AB1A485F-4446-C70C-7327-A2968858AD9E";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_4Shape" -p "r_feather_1_4";
	rename -uid "536F5B26-489E-43FF-D483-DB9316A7269D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_1_5_group" -p "r_feather_1_4";
	rename -uid "C120C16E-4474-815A-629D-989869F41803";
createNode transform -n "r_feather_1_5_spreadGroup" -p "r_feather_1_5_group";
	rename -uid "E42D97F2-473C-38AA-1ED5-4E8A1C1F79DE";
createNode transform -n "r_feather_1_5_bendGroup" -p "r_feather_1_5_spreadGroup";
	rename -uid "6AE78569-4622-BEA9-C6B4-4BB3167567D4";
createNode transform -n "r_feather_1_5_mainGroup" -p "r_feather_1_5_bendGroup";
	rename -uid "D76CA5D1-4571-4B20-0208-C29B59017341";
createNode transform -n "r_feather_1_5_rollGroup" -p "r_feather_1_5_mainGroup";
	rename -uid "28E5AA4C-4956-F42A-0EB3-048D1FEF36D9";
createNode transform -n "r_feather_1_5" -p "r_feather_1_5_rollGroup";
	rename -uid "4AFCEA25-4688-ED46-1359-83AD4CA0FF59";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_5Shape" -p "r_feather_1_5";
	rename -uid "FA77EE7A-4949-E0CF-D94E-3EB6E939C007";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_2_1_group" -p "feather_controls";
	rename -uid "701BF64B-4127-068D-6A3C-CCA747382758";
createNode transform -n "r_feather_2_1_spreadRootGroup" -p "r_feather_2_1_group";
	rename -uid "11DD1C87-4C04-E0DE-B5E9-AF99F0AF91DD";
createNode transform -n "r_feather_2_1_spreadGroup" -p "r_feather_2_1_spreadRootGroup";
	rename -uid "1C99AE91-4A9C-B333-4F09-2E9303D0A562";
createNode transform -n "r_feather_2_1_rollGroup" -p "r_feather_2_1_spreadGroup";
	rename -uid "AA559295-4D4F-83B5-BC46-44B83C47A1C6";
createNode transform -n "r_feather_2_1" -p "r_feather_2_1_rollGroup";
	rename -uid "EF6B6CBA-4CC8-D127-FC5F-1F86C9907221";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_1Shape" -p "r_feather_2_1";
	rename -uid "1C96EF5A-4BDD-F141-C680-448D146A9C7E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_2_2_group" -p "r_feather_2_1";
	rename -uid "C04D2D84-40E6-B790-D6F2-90ADD3E28F75";
createNode transform -n "r_feather_2_2_spreadGroup" -p "r_feather_2_2_group";
	rename -uid "C13150F5-42BD-53B6-CD42-4E93EDA6CBE3";
createNode transform -n "r_feather_2_2_bendGroup" -p "r_feather_2_2_spreadGroup";
	rename -uid "EFB016BC-48AB-D978-60ED-D5ABF25650F6";
createNode transform -n "r_feather_2_2_mainGroup" -p "r_feather_2_2_bendGroup";
	rename -uid "0F9949A1-49A6-1336-BEE4-4CA43F7C4968";
createNode transform -n "r_feather_2_2_rollGroup" -p "r_feather_2_2_mainGroup";
	rename -uid "D79640FD-42CB-2D20-F753-1BB81260B562";
createNode transform -n "r_feather_2_2" -p "r_feather_2_2_rollGroup";
	rename -uid "0127036A-437C-4306-29BE-AB8A997D4385";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_2Shape" -p "r_feather_2_2";
	rename -uid "238E5662-4D4F-D4FF-EB16-82895A84AC74";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_2_3_group" -p "r_feather_2_2";
	rename -uid "B117382C-4F7B-1C35-4739-5AB17080002F";
createNode transform -n "r_feather_2_3_spreadGroup" -p "r_feather_2_3_group";
	rename -uid "D6BA04F0-4795-5709-6559-6ABC4344AA6D";
createNode transform -n "r_feather_2_3_bendGroup" -p "r_feather_2_3_spreadGroup";
	rename -uid "6E06F7DC-4B5A-F8FA-1A7D-9993017AF508";
createNode transform -n "r_feather_2_3_mainGroup" -p "r_feather_2_3_bendGroup";
	rename -uid "ABC1D209-4F60-5768-AA76-8393AA07BC80";
createNode transform -n "r_feather_2_3_rollGroup" -p "r_feather_2_3_mainGroup";
	rename -uid "C2730AD8-4AE0-E7A6-784B-42BAA7B44B2C";
createNode transform -n "r_feather_2_3" -p "r_feather_2_3_rollGroup";
	rename -uid "49081242-4796-204B-D608-42A936234E19";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_3Shape" -p "r_feather_2_3";
	rename -uid "AE160295-4642-9D6B-3209-E68399A1F814";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_2_4_group" -p "r_feather_2_3";
	rename -uid "966764AB-4B8B-CE53-B979-80BB2664CA53";
createNode transform -n "r_feather_2_4_spreadGroup" -p "r_feather_2_4_group";
	rename -uid "BAF9E5B3-4FB0-875B-0E1D-14AFC294FAC6";
createNode transform -n "r_feather_2_4_bendGroup" -p "r_feather_2_4_spreadGroup";
	rename -uid "CD9E3359-4BEE-E73C-98AB-A7BD838C9112";
createNode transform -n "r_feather_2_4_mainGroup" -p "r_feather_2_4_bendGroup";
	rename -uid "FA6F00F8-4DEB-3CF5-8A6D-A88D9DD669C4";
createNode transform -n "r_feather_2_4_rollGroup" -p "r_feather_2_4_mainGroup";
	rename -uid "D2464A71-4A3E-9F16-8E33-56AB0D604C91";
createNode transform -n "r_feather_2_4" -p "r_feather_2_4_rollGroup";
	rename -uid "AAF9ECA9-4AF6-74B1-D2B0-39B767565B38";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_4Shape" -p "r_feather_2_4";
	rename -uid "7869F865-4F52-D460-B294-DC8D32D77C7B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_2_5_group" -p "r_feather_2_4";
	rename -uid "CFCCA288-4661-C2DE-191F-4BB951718C0B";
createNode transform -n "r_feather_2_5_spreadGroup" -p "r_feather_2_5_group";
	rename -uid "D77F4C82-4F81-37F9-AECA-419CA715672A";
createNode transform -n "r_feather_2_5_bendGroup" -p "r_feather_2_5_spreadGroup";
	rename -uid "BDDD65E9-4CF0-7933-9F08-C08827FA53EF";
createNode transform -n "r_feather_2_5_mainGroup" -p "r_feather_2_5_bendGroup";
	rename -uid "51BAECA1-4078-C919-EF0D-6992651C7B1C";
createNode transform -n "r_feather_2_5_rollGroup" -p "r_feather_2_5_mainGroup";
	rename -uid "BCCDAE26-48AF-FC6C-6CBE-E59AD4690959";
createNode transform -n "r_feather_2_5" -p "r_feather_2_5_rollGroup";
	rename -uid "B537780D-46AF-3C48-4E8A-5CA33EE714FD";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_5Shape" -p "r_feather_2_5";
	rename -uid "DC5EBA0C-4EED-67BF-7297-7B92321152E3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_3_1_group" -p "feather_controls";
	rename -uid "AD4D4FDC-4AF9-564E-2CA2-16901ADDAB14";
createNode transform -n "r_feather_3_1_spreadRootGroup" -p "r_feather_3_1_group";
	rename -uid "6DA5C12C-4C4D-64E3-8710-CDBA470107DE";
createNode transform -n "r_feather_3_1_spreadGroup" -p "r_feather_3_1_spreadRootGroup";
	rename -uid "B63DFDFF-41E6-6231-2C89-A69141EEE149";
createNode transform -n "r_feather_3_1_rollGroup" -p "r_feather_3_1_spreadGroup";
	rename -uid "119814C3-401E-8FC2-5518-23A7D582625E";
createNode transform -n "r_feather_3_1" -p "r_feather_3_1_rollGroup";
	rename -uid "692EA21C-4F87-B262-903B-91A9A83370DC";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_1Shape" -p "r_feather_3_1";
	rename -uid "173E85B9-4EA3-7E63-D81D-6AB9470D072A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_3_2_group" -p "r_feather_3_1";
	rename -uid "9E738D03-419B-1253-4C93-328DE42F1B4A";
createNode transform -n "r_feather_3_2_spreadGroup" -p "r_feather_3_2_group";
	rename -uid "D59836CE-4DA7-D335-A8C3-CF8A2971EB32";
createNode transform -n "r_feather_3_2_bendGroup" -p "r_feather_3_2_spreadGroup";
	rename -uid "9D43592D-4B7E-B699-F896-16B37D153921";
createNode transform -n "r_feather_3_2_mainGroup" -p "r_feather_3_2_bendGroup";
	rename -uid "C56A805C-45ED-5C7E-275B-988AB0BC2568";
createNode transform -n "r_feather_3_2_rollGroup" -p "r_feather_3_2_mainGroup";
	rename -uid "AEA1F025-4638-DE9A-A921-ECBF0A314C9F";
createNode transform -n "r_feather_3_2" -p "r_feather_3_2_rollGroup";
	rename -uid "BAF96DEF-46A5-C388-955C-EEA610ACEFF0";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_2Shape" -p "r_feather_3_2";
	rename -uid "3EFCA06A-43EE-B96B-F66F-9C93F60B1E11";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_3_3_group" -p "r_feather_3_2";
	rename -uid "0A2FE1D3-4D90-EBC8-061E-1F9318C2465E";
createNode transform -n "r_feather_3_3_spreadGroup" -p "r_feather_3_3_group";
	rename -uid "6E208014-465A-0FC1-40FC-5388B79CE459";
createNode transform -n "r_feather_3_3_bendGroup" -p "r_feather_3_3_spreadGroup";
	rename -uid "43A0F976-4BB4-8449-9799-729511274DCF";
createNode transform -n "r_feather_3_3_mainGroup" -p "r_feather_3_3_bendGroup";
	rename -uid "C53BD72D-43D1-24F0-BF54-8A911B590E9C";
createNode transform -n "r_feather_3_3_rollGroup" -p "r_feather_3_3_mainGroup";
	rename -uid "2E03C7D5-41AB-3384-5929-EA991E08A84D";
createNode transform -n "r_feather_3_3" -p "r_feather_3_3_rollGroup";
	rename -uid "059F7933-4D74-CC55-B096-71BA4A50C20C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_3Shape" -p "r_feather_3_3";
	rename -uid "11FE4DD2-4315-7940-3078-D3915703A2F0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_3_4_group" -p "r_feather_3_3";
	rename -uid "F57CFC7F-483A-9C8C-9685-E49818A33FC0";
createNode transform -n "r_feather_3_4_spreadGroup" -p "r_feather_3_4_group";
	rename -uid "FD32C996-464E-6053-792B-7D8682CFE977";
createNode transform -n "r_feather_3_4_bendGroup" -p "r_feather_3_4_spreadGroup";
	rename -uid "F2D84471-4DA3-70C7-AAC2-A09F01498D7F";
createNode transform -n "r_feather_3_4_mainGroup" -p "r_feather_3_4_bendGroup";
	rename -uid "642ACA3F-4111-D049-2FEE-129CAA721D1F";
createNode transform -n "r_feather_3_4_rollGroup" -p "r_feather_3_4_mainGroup";
	rename -uid "A3FF5A33-4627-F4BC-12A8-6AB21E1F24B7";
createNode transform -n "r_feather_3_4" -p "r_feather_3_4_rollGroup";
	rename -uid "A1C30F4D-4701-B102-07B9-BCA09BF2D2A8";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_4Shape" -p "r_feather_3_4";
	rename -uid "6A0C4F18-439D-6CFA-B575-709E7914E182";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_3_5_group" -p "r_feather_3_4";
	rename -uid "C9AC18CE-4049-488F-63DA-52B73C1451A2";
createNode transform -n "r_feather_3_5_spreadGroup" -p "r_feather_3_5_group";
	rename -uid "EC2758B4-4389-9581-86CD-E1992FDE05E3";
createNode transform -n "r_feather_3_5_bendGroup" -p "r_feather_3_5_spreadGroup";
	rename -uid "3A3033BD-4A50-5C13-2AB0-14B5088139D9";
createNode transform -n "r_feather_3_5_mainGroup" -p "r_feather_3_5_bendGroup";
	rename -uid "59CBB252-4217-BA3A-1792-028C1F3CC250";
createNode transform -n "r_feather_3_5_rollGroup" -p "r_feather_3_5_mainGroup";
	rename -uid "CA9B4421-445E-ED66-73ED-9E8437EDD0C4";
createNode transform -n "r_feather_3_5" -p "r_feather_3_5_rollGroup";
	rename -uid "A41BE877-4878-1DAA-F8C3-8E9F1AA177D4";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_5Shape" -p "r_feather_3_5";
	rename -uid "652D4D44-42FB-8844-FE2B-FD8F67BC4792";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_4_1_group" -p "feather_controls";
	rename -uid "4FADE681-419D-E5C8-BEBE-63864E583DF6";
createNode transform -n "r_feather_4_1_spreadRootGroup" -p "r_feather_4_1_group";
	rename -uid "6AF99FA5-457A-70DD-5CBF-3586CD5F3225";
createNode transform -n "r_feather_4_1_spreadGroup" -p "r_feather_4_1_spreadRootGroup";
	rename -uid "5C504477-4D7B-58BA-AF77-D093971F59BC";
createNode transform -n "r_feather_4_1_rollGroup" -p "r_feather_4_1_spreadGroup";
	rename -uid "D218D6C5-4762-133C-FBA6-BD91E3E238FF";
createNode transform -n "r_feather_4_1" -p "r_feather_4_1_rollGroup";
	rename -uid "618823E4-4A6D-2B9F-66BA-88955530028A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_1Shape" -p "r_feather_4_1";
	rename -uid "72104965-4AD6-7D76-AAA1-27987A9FD480";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_4_2_group" -p "r_feather_4_1";
	rename -uid "5BE25D5E-4FC8-D3F9-211A-D18AE5C97DF7";
createNode transform -n "r_feather_4_2_spreadGroup" -p "r_feather_4_2_group";
	rename -uid "D9C2E0C4-4264-92D5-E60B-A8BAB206B537";
createNode transform -n "r_feather_4_2_bendGroup" -p "r_feather_4_2_spreadGroup";
	rename -uid "57705BDB-4925-1F6C-5C51-1EB515B555FF";
createNode transform -n "r_feather_4_2_mainGroup" -p "r_feather_4_2_bendGroup";
	rename -uid "C285DBC8-4A20-2ACF-3CF3-BD9FE4F59508";
createNode transform -n "r_feather_4_2_rollGroup" -p "r_feather_4_2_mainGroup";
	rename -uid "6A8D331A-49F6-47B7-FB16-FF9AE75F3C8C";
createNode transform -n "r_feather_4_2" -p "r_feather_4_2_rollGroup";
	rename -uid "96557046-48E1-6061-61FA-959CD1D76545";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_2Shape" -p "r_feather_4_2";
	rename -uid "B84B885C-415D-AFC0-96B5-88808F3A25B5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_4_3_group" -p "r_feather_4_2";
	rename -uid "CDC75BEB-49D2-0FE9-7221-428BFB0EBFB4";
createNode transform -n "r_feather_4_3_spreadGroup" -p "r_feather_4_3_group";
	rename -uid "D5828601-4F0D-3695-AAAD-D5A5B2C9C25B";
createNode transform -n "r_feather_4_3_bendGroup" -p "r_feather_4_3_spreadGroup";
	rename -uid "C2DB312B-4ADE-C708-0990-9D866A629C85";
createNode transform -n "r_feather_4_3_mainGroup" -p "r_feather_4_3_bendGroup";
	rename -uid "363D46F3-4D4C-D596-C586-599E59B4680C";
createNode transform -n "r_feather_4_3_rollGroup" -p "r_feather_4_3_mainGroup";
	rename -uid "62DCECAD-4546-06F5-79D7-2C9AE0AA7B1E";
createNode transform -n "r_feather_4_3" -p "r_feather_4_3_rollGroup";
	rename -uid "8989CF69-453C-5EC6-AA4F-1392222468CD";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_3Shape" -p "r_feather_4_3";
	rename -uid "7FAA941F-42E6-6318-9382-D5863E0F49DA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_4_4_group" -p "r_feather_4_3";
	rename -uid "E7EE7942-4FFA-631A-0B25-37B3C4F2FB60";
createNode transform -n "r_feather_4_4_spreadGroup" -p "r_feather_4_4_group";
	rename -uid "556B26D7-4BA1-CB4E-762D-F6AD05BE995D";
createNode transform -n "r_feather_4_4_bendGroup" -p "r_feather_4_4_spreadGroup";
	rename -uid "434AFB79-460F-ECEC-777E-538B8C411132";
createNode transform -n "r_feather_4_4_mainGroup" -p "r_feather_4_4_bendGroup";
	rename -uid "CCD84E4E-4442-8BD2-D260-6BA51E50AB80";
createNode transform -n "r_feather_4_4_rollGroup" -p "r_feather_4_4_mainGroup";
	rename -uid "79597499-48BF-948A-68F4-D3A044D7D076";
createNode transform -n "r_feather_4_4" -p "r_feather_4_4_rollGroup";
	rename -uid "32920AAD-4BAC-56FD-34FF-F48AFC770B5E";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_4Shape" -p "r_feather_4_4";
	rename -uid "FE79934A-4D84-FCBB-3EB4-12B30A9EB2D5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_4_5_group" -p "r_feather_4_4";
	rename -uid "C8618474-437E-9023-6092-919378A0F791";
createNode transform -n "r_feather_4_5_spreadGroup" -p "r_feather_4_5_group";
	rename -uid "DDBF6422-4876-236C-7D87-FA9FC6A6970A";
createNode transform -n "r_feather_4_5_bendGroup" -p "r_feather_4_5_spreadGroup";
	rename -uid "28C6F50D-4255-EC36-668F-CEA5E6716752";
createNode transform -n "r_feather_4_5_mainGroup" -p "r_feather_4_5_bendGroup";
	rename -uid "8DE879B2-49E5-1F00-8A91-B4A4360C0BFF";
createNode transform -n "r_feather_4_5_rollGroup" -p "r_feather_4_5_mainGroup";
	rename -uid "93BF4838-4B12-9F73-5238-DDB2AFAA588D";
createNode transform -n "r_feather_4_5" -p "r_feather_4_5_rollGroup";
	rename -uid "01834F89-43BC-7C87-4015-C6A51C1DA93F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_5Shape" -p "r_feather_4_5";
	rename -uid "2C775620-41AF-B938-AC16-5E8EBBD92373";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_5_1_group" -p "feather_controls";
	rename -uid "8295F6EA-4B61-FF26-DFB6-889042B7B788";
createNode transform -n "r_feather_5_1_spreadRootGroup" -p "r_feather_5_1_group";
	rename -uid "571CBE69-45C3-63BA-1714-90A7EDE864CB";
createNode transform -n "r_feather_5_1_spreadGroup" -p "r_feather_5_1_spreadRootGroup";
	rename -uid "B856919E-4F0B-1074-2D17-CC91B7C62D2A";
createNode transform -n "r_feather_5_1_rollGroup" -p "r_feather_5_1_spreadGroup";
	rename -uid "2149730D-473C-B037-5852-4EADD8CC1319";
createNode transform -n "r_feather_5_1" -p "r_feather_5_1_rollGroup";
	rename -uid "1FA9323A-4EA2-E611-8E37-D4AA96CF6F98";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_1Shape" -p "r_feather_5_1";
	rename -uid "23784A60-4102-466A-C40D-F99F5C79F2B1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_5_2_group" -p "r_feather_5_1";
	rename -uid "80DB7C8A-4CF5-B4A4-27E7-85B7EDD28A1D";
createNode transform -n "r_feather_5_2_spreadGroup" -p "r_feather_5_2_group";
	rename -uid "A12101DA-4734-30D7-54DE-D0A17D629F7B";
createNode transform -n "r_feather_5_2_bendGroup" -p "r_feather_5_2_spreadGroup";
	rename -uid "99C481B4-40D4-D413-3321-B3AA26698E5F";
createNode transform -n "r_feather_5_2_mainGroup" -p "r_feather_5_2_bendGroup";
	rename -uid "F4B7C6E2-473E-4244-E2C5-6BA8378DA970";
createNode transform -n "r_feather_5_2_rollGroup" -p "r_feather_5_2_mainGroup";
	rename -uid "A1D015F5-4810-72AB-2A44-BDB83DF98E79";
createNode transform -n "r_feather_5_2" -p "r_feather_5_2_rollGroup";
	rename -uid "B12303E9-473E-305C-EBCA-7B9255959D4A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_2Shape" -p "r_feather_5_2";
	rename -uid "DF98AA15-413B-0323-2D20-84A4186304C1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_5_3_group" -p "r_feather_5_2";
	rename -uid "7E7C65E6-415E-0306-72DC-60A24FA7F071";
createNode transform -n "r_feather_5_3_spreadGroup" -p "r_feather_5_3_group";
	rename -uid "E90D786F-4270-B3DE-76DF-76AC9A913FA9";
createNode transform -n "r_feather_5_3_bendGroup" -p "r_feather_5_3_spreadGroup";
	rename -uid "070C7684-41B9-01B6-85D9-C3991300E3C2";
createNode transform -n "r_feather_5_3_mainGroup" -p "r_feather_5_3_bendGroup";
	rename -uid "F6A8BEA4-4FF5-5491-4A49-15A2C1E4CE82";
createNode transform -n "r_feather_5_3_rollGroup" -p "r_feather_5_3_mainGroup";
	rename -uid "B08E6B40-4ECA-F1AE-CD32-719C3EA22136";
createNode transform -n "r_feather_5_3" -p "r_feather_5_3_rollGroup";
	rename -uid "9E68EA5E-4D55-EB1C-0CDC-EFB886D5561A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_3Shape" -p "r_feather_5_3";
	rename -uid "DF82AE9B-4D64-9FC1-37B0-6FA1AC5C4ECA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_5_4_group" -p "r_feather_5_3";
	rename -uid "49F20612-47B9-0C1B-461F-EDB4693A59EE";
createNode transform -n "r_feather_5_4_spreadGroup" -p "r_feather_5_4_group";
	rename -uid "E84B82D7-4A97-6566-27AC-BA80E0541916";
createNode transform -n "r_feather_5_4_bendGroup" -p "r_feather_5_4_spreadGroup";
	rename -uid "F163A1A8-4408-C694-5580-22AA058A0A6E";
createNode transform -n "r_feather_5_4_mainGroup" -p "r_feather_5_4_bendGroup";
	rename -uid "9EFC3FFA-491F-C8F9-54BF-4689608D457C";
createNode transform -n "r_feather_5_4_rollGroup" -p "r_feather_5_4_mainGroup";
	rename -uid "0E673222-439A-3DC7-C6FB-73A6927B2833";
createNode transform -n "r_feather_5_4" -p "r_feather_5_4_rollGroup";
	rename -uid "E1B316F1-40AC-8441-BE15-0CA657ABD19F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_4Shape" -p "r_feather_5_4";
	rename -uid "1BEB9141-4FF3-9732-0920-71A9F28A8E26";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "r_feather_5_5_group" -p "r_feather_5_4";
	rename -uid "25A075A4-42A5-74DF-F947-45BDA5881570";
createNode transform -n "r_feather_5_5_spreadGroup" -p "r_feather_5_5_group";
	rename -uid "DC58B014-4F91-BB70-CE66-0AACA4DDA35A";
createNode transform -n "r_feather_5_5_bendGroup" -p "r_feather_5_5_spreadGroup";
	rename -uid "8FE61E5E-460F-D4E2-4E47-9680ACB6AF24";
createNode transform -n "r_feather_5_5_mainGroup" -p "r_feather_5_5_bendGroup";
	rename -uid "1CCA0ED5-497B-DD49-F02A-BDA5E1775A17";
createNode transform -n "r_feather_5_5_rollGroup" -p "r_feather_5_5_mainGroup";
	rename -uid "AE1F8185-4FA4-2683-213C-398BEF1C7BAB";
createNode transform -n "r_feather_5_5" -p "r_feather_5_5_rollGroup";
	rename -uid "743404A8-4BEF-8752-1217-76BEE77771F6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_5Shape" -p "r_feather_5_5";
	rename -uid "8610352D-46FF-A0CC-A5A6-BA80CC27353C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		-5.5507632834890728e-17 0.06280474686732343 0.10878101253070642
		-6.409469351860612e-17 4.1310304186663256e-17 0.12560949373464678
		-5.5507632834890747e-17 -0.062804746867323388 0.10878101253070646
		-3.2047346759303091e-17 -0.10878101253070636 0.062804746867323444
		-4.0457284485328865e-32 -0.1256094937346468 7.9286111581226781e-17
		3.2047346759303029e-17 -0.10878101253070645 -0.062804746867323333
		5.5507632834890703e-17 -0.062804746867323472 -0.10878101253070638
		6.4094693518606133e-17 -1.1843522054399747e-16 -0.1256094937346468
		5.5507632834890747e-17 0.062804746867323319 -0.10878101253070646
		3.204734675930314e-17 0.10878101253070631 -0.062804746867323541
		-1.8169336880517397e-32 0.1256094937346468 3.5607334738148364e-17
		-3.2047346759303054e-17 0.10878101253070639 0.062804746867323374
		;
createNode transform -n "output" -p "mod";
	rename -uid "D65FD662-43FE-8FD0-2F2F-2A8EE067FB7F";
createNode transform -n "outJoints" -p "output";
	rename -uid "AB9FBA0E-4206-D046-3C9E-CF87ED2B65EB";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "B7185932-4DEB-5BCF-441D-1983F84E6457";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode joint -n "m_feather_1_outJoint" -p "root_outJoint";
	rename -uid "8C499B22-470A-9963-FC37-E6840DAC16E1";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_2_outJoint" -p "m_feather_1_outJoint";
	rename -uid "477EAFB0-429F-9027-F842-37AFB846E2E3";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_3_outJoint" -p "m_feather_2_outJoint";
	rename -uid "2DCD565B-4863-51A1-6F89-EF9DF6C8E1A3";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_4_outJoint" -p "m_feather_3_outJoint";
	rename -uid "B54BBCEC-4ADA-2AD6-D6EB-89883D648CDC";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_5_outJoint" -p "m_feather_4_outJoint";
	rename -uid "8E12CFFE-4B1D-5A60-4D9C-FD8F5296C460";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_end_outJoint" -p "m_feather_5_outJoint";
	rename -uid "F97776FE-49FB-EA84-B984-7C82C136E212";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_1_outJoint" -p "root_outJoint";
	rename -uid "C95A248E-459C-ACB4-9FAE-F2AE166C52FA";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_2_outJoint" -p "l_feather_1_1_outJoint";
	rename -uid "E5773C95-428A-A8DA-103B-308FF9B3C74B";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_3_outJoint" -p "l_feather_1_2_outJoint";
	rename -uid "4B30351B-4D28-7285-1EFA-CB9886441B21";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_4_outJoint" -p "l_feather_1_3_outJoint";
	rename -uid "F0D23CF5-4C16-C71B-4DA4-919C6A4B997D";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_5_outJoint" -p "l_feather_1_4_outJoint";
	rename -uid "9F8479DA-432C-A86B-6C48-BC9E7CB0E258";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_end_outJoint" -p "l_feather_1_5_outJoint";
	rename -uid "09F1AC4B-4006-A865-99BA-53A07FF349F1";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_1_outJoint" -p "root_outJoint";
	rename -uid "309AEE52-4940-EADB-F7FB-36A405DFA19F";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_2_outJoint" -p "l_feather_2_1_outJoint";
	rename -uid "5F0313C3-44FC-2095-7192-6CBC55E25544";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_3_outJoint" -p "l_feather_2_2_outJoint";
	rename -uid "04ECAABF-41ED-8972-FBC1-80A0BE2C5D78";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_4_outJoint" -p "l_feather_2_3_outJoint";
	rename -uid "5579586B-4663-6E3E-7281-75868ADAF7A5";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_5_outJoint" -p "l_feather_2_4_outJoint";
	rename -uid "CC1894D9-459C-355D-4D72-7A99BB23601D";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_end_outJoint" -p "l_feather_2_5_outJoint";
	rename -uid "6479EA3B-4A5D-020C-1796-18ADD9B6BC87";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_1_outJoint" -p "root_outJoint";
	rename -uid "0EEC59C7-41D2-2140-6CBD-3A922A77A973";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_2_outJoint" -p "l_feather_3_1_outJoint";
	rename -uid "B8744570-47A5-4A5F-3BEE-54BAAE4CFBB0";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_3_outJoint" -p "l_feather_3_2_outJoint";
	rename -uid "3D7F190A-477B-760D-B6EA-02A648C8E01D";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_4_outJoint" -p "l_feather_3_3_outJoint";
	rename -uid "850665B3-4A33-EEBC-1C13-248ED074DC59";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_5_outJoint" -p "l_feather_3_4_outJoint";
	rename -uid "10227B3F-444A-0E10-6D03-CF94422CDC74";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_end_outJoint" -p "l_feather_3_5_outJoint";
	rename -uid "75417FA3-4381-9BEF-CA22-4EB736C123F5";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_1_outJoint" -p "root_outJoint";
	rename -uid "A3EAD7AD-4CF6-B04E-7E3C-2A8C40272E05";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_2_outJoint" -p "l_feather_4_1_outJoint";
	rename -uid "32408097-4439-1929-ECCB-73B1B9CEA307";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_3_outJoint" -p "l_feather_4_2_outJoint";
	rename -uid "406320FE-4CE4-E46D-12FB-4B8207B22199";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_4_outJoint" -p "l_feather_4_3_outJoint";
	rename -uid "861D645C-4A10-21C6-B916-0BBA470E012F";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_5_outJoint" -p "l_feather_4_4_outJoint";
	rename -uid "BC93F20A-4477-0203-B180-F88B543F4543";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_end_outJoint" -p "l_feather_4_5_outJoint";
	rename -uid "FFC51F14-4CE9-290B-FAC6-828448AB2180";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_1_outJoint" -p "root_outJoint";
	rename -uid "359CDDE2-442A-2F5F-E00C-F5A35229EF15";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_2_outJoint" -p "l_feather_5_1_outJoint";
	rename -uid "2AD713D7-45C9-0380-C456-87A4FD54C641";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_3_outJoint" -p "l_feather_5_2_outJoint";
	rename -uid "CFBD8B82-4A09-8698-C3D3-9D84B83E6712";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_4_outJoint" -p "l_feather_5_3_outJoint";
	rename -uid "7AAA2151-40D2-D185-1E1A-68822279D062";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_5_outJoint" -p "l_feather_5_4_outJoint";
	rename -uid "CFF81B2B-4C11-FDAE-260C-A6800A3FC017";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_end_outJoint" -p "l_feather_5_5_outJoint";
	rename -uid "193F1DCD-4978-0F50-138D-AA9348571C88";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_1_outJoint" -p "root_outJoint";
	rename -uid "2B5C8BA3-453F-F4B6-311F-B08FCE8704F3";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_2_outJoint" -p "r_feather_1_1_outJoint";
	rename -uid "535DD005-4CD1-BDD6-44EB-4D872E3F9EA8";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_3_outJoint" -p "r_feather_1_2_outJoint";
	rename -uid "2682BCD1-4BE1-2EC6-9C08-5D9F2DB78953";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_4_outJoint" -p "r_feather_1_3_outJoint";
	rename -uid "45F5F91A-4B30-7F8E-4EBF-2FA4CF2A2926";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_5_outJoint" -p "r_feather_1_4_outJoint";
	rename -uid "0ED641EA-4561-8017-FFB4-5E83CE0D7F75";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_end_outJoint" -p "r_feather_1_5_outJoint";
	rename -uid "F1B62238-45B3-F291-561C-46A07B5F0C22";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_1_outJoint" -p "root_outJoint";
	rename -uid "42E30CC2-48B4-1663-93A1-3B989956142B";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_2_outJoint" -p "r_feather_2_1_outJoint";
	rename -uid "C5C05D09-4E32-0BA0-EF59-2A80430EC4A4";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_3_outJoint" -p "r_feather_2_2_outJoint";
	rename -uid "80249400-4557-F684-489D-95A610C9C88A";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_4_outJoint" -p "r_feather_2_3_outJoint";
	rename -uid "8D7B1F21-473B-EEFC-C3B3-09B8D5F567DC";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_5_outJoint" -p "r_feather_2_4_outJoint";
	rename -uid "E6B13EB9-4754-5207-08D9-42B124EBD838";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_end_outJoint" -p "r_feather_2_5_outJoint";
	rename -uid "5BE1E021-47BA-473F-482C-4391AF2DE32E";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_1_outJoint" -p "root_outJoint";
	rename -uid "31DBC36B-452B-D5E7-EA0E-289D92FB2F0B";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_2_outJoint" -p "r_feather_3_1_outJoint";
	rename -uid "AA8F6DAD-48C7-28C7-D93B-B6B3219DFF6C";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_3_outJoint" -p "r_feather_3_2_outJoint";
	rename -uid "72BD42EC-416F-AF5E-2A6D-209EC6EAA677";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_4_outJoint" -p "r_feather_3_3_outJoint";
	rename -uid "D788658D-4ADE-1183-3A90-2EAA46CE767F";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_5_outJoint" -p "r_feather_3_4_outJoint";
	rename -uid "1C84B072-4B85-1BB4-3355-A3A11CB40787";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_end_outJoint" -p "r_feather_3_5_outJoint";
	rename -uid "8BA2A57A-4521-9703-D043-81B09E5D6D86";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_1_outJoint" -p "root_outJoint";
	rename -uid "30572AEC-4F2D-F861-6501-688C7DE6DB26";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_2_outJoint" -p "r_feather_4_1_outJoint";
	rename -uid "9313D227-4244-439B-A0DE-9DA68128843D";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_3_outJoint" -p "r_feather_4_2_outJoint";
	rename -uid "BCB3567F-4857-B530-597F-858B148E175B";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_4_outJoint" -p "r_feather_4_3_outJoint";
	rename -uid "E5886184-44EF-5D8D-897B-06B4C9AE5B2B";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_5_outJoint" -p "r_feather_4_4_outJoint";
	rename -uid "083A03C2-43CB-3451-2AE9-9E933A440134";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_end_outJoint" -p "r_feather_4_5_outJoint";
	rename -uid "CCCB2022-427D-0CBC-1112-C2BCC0C583CB";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_1_outJoint" -p "root_outJoint";
	rename -uid "700A273E-42F8-85CE-1F7D-079AF1A9522D";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_2_outJoint" -p "r_feather_5_1_outJoint";
	rename -uid "0A54283B-4DAF-FA4A-6E23-7A98000390EE";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_3_outJoint" -p "r_feather_5_2_outJoint";
	rename -uid "CC59DD39-44FA-2136-251C-E38D48D4DBE8";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_4_outJoint" -p "r_feather_5_3_outJoint";
	rename -uid "E22B02B5-44E0-4D32-D2E8-F6B19A0DE2CF";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_5_outJoint" -p "r_feather_5_4_outJoint";
	rename -uid "884FA718-4B06-5938-879E-C8B97013369C";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_end_outJoint" -p "r_feather_5_5_outJoint";
	rename -uid "D4DA34FF-4B5F-FBCB-8BD7-94BA45F4EE0D";
	setAttr ".radi" 0.2;
createNode transform -s -n "persp";
	rename -uid "6DD988D0-4F67-01C8-21B5-089512DF5F58";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 8.6663130578479421 4.2392256934619628 0.82022837572026175 ;
	setAttr ".r" -type "double3" -25.800000000000487 76.400000000000404 -6.7630477575830151e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C0598692-4A65-CD2F-2E76-769943D8CE56";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 10.071389459684369;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.00089961603299254511 0.97642014451840109 -5.1158699999999993 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "76B76DF1-4C7C-BBEC-766D-F091444014EB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "701B895D-45BA-3625-AE2D-B0A37323752E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "1D0857E7-4234-8209-D26A-799A73F29C99";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.00090367933738733086 0.97642038105578832 -13.963905245007087 ;
	setAttr ".r" -type "double3" 0 180 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "2AF88D17-453B-6B4B-9254-A5A3D4235324";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 8.1982593787092206;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "E93973ED-4010-B152-A86B-94A99AC68819";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 9.2260052030801916 -0.1441562132834262 -1.3119135606872434 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F62AEFB8-46AB-898B-C1BB-8AB607C09A1B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 9.3729105965854043;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "9BF15107-4FC3-ECE8-6314-1FA935C4B205";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "9CB50D09-46D0-F879-4BF9-59871F6E6F74";
createNode displayLayer -n "defaultLayer";
	rename -uid "47598A7F-4076-9A26-4738-16A1F08E3130";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "429596CE-4520-2BBF-A619-33888BAC2113";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "50669F66-46C9-894E-CDC6-858734AB76F8";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5F96966C-48A2-AE39-3811-DC8B33C3CBE4";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 100 -ast 1 -aet 100 ";
	setAttr ".st" 6;
createNode shadingEngine -n "green_rsSG";
	rename -uid "584E1691-42EC-C945-946A-23B55ADF898F";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "FE945EE3-4D7C-15B7-BF42-E4A5FE304AAA";
createNode shadingEngine -n "blue_rsSG";
	rename -uid "E6775E61-42B8-E291-00C8-2BB1C5E7E434";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "A9F9D283-4108-A439-D26A-3B89A50BE82B";
createNode shadingEngine -n "red_rsSG";
	rename -uid "85A42B19-443A-212F-81CF-E8955253D1D1";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "C0A64FBA-4025-30AA-52D1-B886D5856059";
createNode objectSet -n "moduleControlSet";
	rename -uid "86848271-443B-CB76-8AA6-2DB6CA556FFB";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "sets";
	rename -uid "A46F51A1-4817-F3B2-E213-B1A26CD977FD";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode groupId -n "cluster4GroupId";
	rename -uid "9F50CFF8-4C26-1AC4-AB3B-709E643A9AA8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "cluster4Set";
	rename -uid "9DE28F8F-4F7F-19A0-02BC-7CAE54C3A9B3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode cluster -n "mainPoser_clusterHandleCluster1";
	rename -uid "87ADA15C-4627-FC69-9C25-A9B5CF9664B6";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "cluster4GroupParts";
	rename -uid "5D3A6EB3-4DF0-C2C5-1E00-55BC384BE6EB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
	setAttr -l on ".moduleName" -type "string" "";
createNode tweak -n "tweak24";
	rename -uid "806C912D-4200-D392-33D3-B09FE8837479";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -l on ".moduleName" -type "string" "";
createNode objectSet -n "tweakSet24";
	rename -uid "3DC6C349-4699-53D8-AA94-84A1CF24ADEB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupId -n "groupId42";
	rename -uid "F9A925A2-4D3F-927C-C2CF-7C906FF7FA81";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "";
createNode groupParts -n "groupParts42";
	rename -uid "A5C87547-455E-3DE7-1927-E8AE4980C5DF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
	setAttr -l on ".moduleName" -type "string" "";
createNode condition -n "mirror_condition";
	rename -uid "52EC44F8-4A68-7FA5-8F68-7C9FE638DA42";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
createNode shadingEngine -n "black_rsSG";
	rename -uid "91D89170-4953-5A04-819C-93ACA19E924B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "8DB900E0-43C7-80AF-0ADC-A7AE8603C4D0";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "227208B3-4C4D-0483-DDE4-92B943867E47";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "00D86A2C-4C03-32F4-951C-9EA5C1E00F81";
createNode makeNurbSphere -n "makeNurbSphere";
	rename -uid "6F0AFE32-49C2-5870-2EB7-E6BDECAF7D76";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "FC884255-462D-CC24-783E-69B68427DF01";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "2A340E10-471B-9AA0-D751-1CA0AD29E561";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 870.23806065794167 -2288.181502956912 ;
	setAttr ".tgi[0].vh" -type "double2" 1790.4761193290617 -1234.4374046858366 ;
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "70D97328-4BC2-D0F6-65F6-80BE58D6D2B8";
createNode multiplyDivide -n "lines_scale_multiplyDivide";
	rename -uid "22E391A9-4847-96D5-4564-229116D43AA4";
createNode composeMatrix -n "r_mirror_composeMatrix";
	rename -uid "C64389EC-4A80-715F-84A4-A3A11C118140";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode multMatrix -n "base_group_multMat";
	rename -uid "7E4A4575-4AB8-CEFB-8A65-728AF9B2BCAB";
	setAttr -s 2 ".i";
createNode multiplyDivide -n "feathers_u_multiplyDivide";
	rename -uid "365599BE-46BE-6422-A1DE-B8A283AE02E5";
	setAttr ".i2" -type "float3" 0.1 0.1 0.1 ;
createNode clamp -n "feathers_negU_clamp";
	rename -uid "FF7FB453-480E-32A6-5555-7D8A07EEB1DF";
	setAttr ".mn" -type "float3" -1 -1000000 0 ;
createNode plusMinusAverage -n "feathers_p_plusMinusAverage";
	rename -uid "16F63F77-4934-20B6-9843-149441210AEC";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "feathers_q_plusMinusAverage";
	rename -uid "7061DFE3-4233-7510-90C0-00BC0F65CAA4";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "feathers_spreadCoef_multiplyDivide";
	rename -uid "CC00F258-470B-0C73-9783-C0B813F73424";
	setAttr ".i2" -type "float3" -0.1 0.1 -0.2 ;
createNode multiplyDivide -n "feathers_bendCoef_multiplyDivide";
	rename -uid "E97DC98C-4024-8034-9D8C-1FAE870F6EF2";
	setAttr ".i2" -type "float3" 0.125 0.125 -0.125 ;
createNode multiplyDivide -n "feathers_spread_multiplyDivide";
	rename -uid "8F9860C7-4FAE-5287-41E5-51A4B971282C";
createNode multiplyDivide -n "feathers_bend_multiplyDivide";
	rename -uid "2EC354D1-457D-38D9-8B5E-988BA8046ED1";
createNode plusMinusAverage -n "feathers_edge_plusMinusAverage";
	rename -uid "BA179C58-40D9-AD67-365D-43A7C8117956";
	setAttr -s 2 ".i3[1]" -type "float3"  0 0 0;
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "feathers_mid_plusMinusAverage";
	rename -uid "8833B560-4FC2-8646-A3AE-73ACA63510CB";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode animBlendNodeAdditiveRotation -n "feathers_edge_rotation";
	rename -uid "5ABC6A82-4685-291A-A999-FE923D9D93B2";
	setAttr ".wb" 0;
createNode unitConversion -n "unitConversion1";
	rename -uid "F4F1C8AB-4F62-F93E-F37B-A683EEE4860A";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion2";
	rename -uid "1E7FC50A-452A-5B61-AE38-CFB9CBE86430";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion3";
	rename -uid "701C6A55-4D62-9DA1-C6B1-159EF3AAD002";
	setAttr ".cf" 0.017453292519943295;
createNode animBlendNodeAdditiveRotation -n "feathers_mid_rotation";
	rename -uid "D7261C5D-40F2-CC0D-50D2-7EA3FA92DD12";
	setAttr ".wb" 0;
createNode unitConversion -n "unitConversion4";
	rename -uid "8E7A3DAF-45B4-9784-6BD7-D1BE520A7FFD";
	setAttr ".cf" 0.017453292519943295;
createNode multMatrix -n "root_outJoint_multMat";
	rename -uid "BB17CC79-4888-6F85-FDEA-A4BAB9E37D01";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "root_outJoint_decMat";
	rename -uid "0AEA3B15-47B6-41B5-2C8B-F2990248B221";
createNode decomposeMatrix -n "root_connector_decomposeMatrix";
	rename -uid "C9B5E81D-4680-CC5A-F79D-90A90FD71E9C";
createNode multiplyDivide -n "outJoints_mirror_multiplyDivide";
	rename -uid "41246444-47FB-C07D-6639-2BB5DCEE852F";
createNode objectSet -n "main_moduleControlSet";
	rename -uid "1BFDD188-4D37-AE69-37EE-27A9B4C0D207";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode objectSet -n "skinJointsSet";
	rename -uid "DD8BE0EF-4357-A094-80AD-1489E9F516D6";
	setAttr ".ihi" 0;
	setAttr -s 56 ".dsm";
createNode network -n "hyperNode_sessionData";
	rename -uid "B1D18A6A-4BB8-6296-2640-F6B5BA52A7B3";
	addAttr -ci true -sn "hyperNodeSessionJSON" -ln "hyperNodeSessionJSON" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".hyperNodeSessionJSON" -type "string" (
		"{\"tabs\": [{\"name\": \"Tab 0\", \"nodes\": {\"root_poserOrient\": {\"x\": -2027.2321649484538, \"y\": -1511.5525455987313, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}, \"root_poserOrientShape\": {\"x\": -2027.2321649484538, \"y\": -1355.5525455987313, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}, \"mainPoser\": {\"x\": -2925.232164948454, \"y\": -1431.0525455987313, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}, \"m_feather_1_poser\": {\"x\": -2925.232164948454, \"y\": -1592.0525455987313, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}}, \"basket_entry_id\": null, \"notes\": [], \"hyper_sets\": [], \"view\": {\"cx\": -2331.2200449996344, \"cy\": -1233.599864349366, \"scale\": 1.0222115261540545}, \"group_path\": [], \"group_history\": []}], \"active_tab\": 0, \"basket\": []}");
createNode multiplyDivide -n "feathers_rootCoef_multiplyDivide";
	rename -uid "9244E374-4EB8-1345-8E76-CF926711DF44";
	setAttr ".i2" -type "float3" -0.5 0.5 1 ;
createNode multiplyDivide -n "feathers_root_multiplyDivide";
	rename -uid "9A85F28F-4580-B80E-5BF1-37AA10FC9A2C";
createNode plusMinusAverage -n "feathers_root_plusMinusAverage";
	rename -uid "E50B59B1-4609-0553-4FC3-70884153500A";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode animBlendNodeAdditiveRotation -n "feathers_rootEdge_rotation";
	rename -uid "B443C133-450A-113B-11DF-8BB574C554F7";
	setAttr ".wb" 0;
createNode unitConversion -n "unitConversion5";
	rename -uid "35356C98-41F4-EE26-FF7E-1494FFA63576";
	setAttr ".cf" 0.017453292519943295;
createNode objectSet -n "generated_nodesSet";
	rename -uid "20E6BBCA-4ED2-E5AA-82A2-B79D5B7AF952";
	setAttr ".ihi" 0;
	setAttr -s 936 ".dsm";
	setAttr -s 423 ".dnsm";
createNode objectSet -n "feathers_moduleControlSet";
	rename -uid "4C38BAEE-4918-8DD9-A4FB-CCA92B94A617";
	setAttr ".ihi" 0;
	setAttr -s 11 ".dnsm";
createNode groupId -n "m_feather_cluster4GroupId";
	rename -uid "90BA6122-42FC-C05C-A567-28A331ABCEB9";
	setAttr ".ihi" 0;
createNode objectSet -n "m_feather_cluster4Set";
	rename -uid "A009E39D-4407-CA0D-C441-948A57EAB33E";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "m_feather_mainPoser_clusterHandleCluster";
	rename -uid "F8CF11C5-480A-7D44-3274-F1BE707B3D05";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "m_feather_cluster4GroupParts";
	rename -uid "14E0EF34-4AF4-772B-7615-24B4D4B7FE8E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "m_feather_tweak24";
	rename -uid "D9681043-42C8-90FE-923F-F6A0CA0D641E";
createNode objectSet -n "m_feather_tweakSet24";
	rename -uid "B9012346-4AD3-8745-3FCC-2EA2C6815558";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "m_feather_groupId42";
	rename -uid "97E790F1-4CDF-B1BC-550C-3A90B5914414";
	setAttr ".ihi" 0;
createNode groupParts -n "m_feather_groupParts42";
	rename -uid "2AEFB9C4-462F-F49E-64BC-649B024CB2BA";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "m_feather_mainPoser_size_multiplyDivide";
	rename -uid "9C6D6EAC-4041-8E71-439B-BC985351AA3F";
createNode makeNurbSphere -n "m_feather_1_makeNurbSphere";
	rename -uid "F100784D-467B-4294-015A-A39ACAA2A929";
createNode multDoubleLinear -n "m_feather_1_size_multDoubleLinear";
	rename -uid "9F176A46-4921-8164-EBE5-0785E3B9AA3B";
createNode makeNurbSphere -n "m_feather_2_makeNurbSphere";
	rename -uid "A68EAFC9-4D1A-932B-0158-3E8DEF8E14A9";
createNode multDoubleLinear -n "m_feather_2_size_multDoubleLinear";
	rename -uid "5F45DF1F-41B0-86CD-A34A-D483693EBCA2";
createNode makeNurbSphere -n "m_feather_3_makeNurbSphere";
	rename -uid "96A3B30D-448A-DAFC-1678-3F8F6887A6CD";
createNode multDoubleLinear -n "m_feather_3_size_multDoubleLinear";
	rename -uid "15A95EB6-4789-FF75-DA0F-8D9ABBEF2B20";
createNode makeNurbSphere -n "m_feather_4_makeNurbSphere";
	rename -uid "5BFF4F3B-471B-A256-D457-D693191B2094";
createNode multDoubleLinear -n "m_feather_4_size_multDoubleLinear";
	rename -uid "20BC0640-43D9-D0CF-7EFC-58A174B52AF3";
createNode makeNurbSphere -n "m_feather_5_makeNurbSphere";
	rename -uid "D2DDB557-4865-A095-B6FC-2984DA91AC87";
createNode multDoubleLinear -n "m_feather_5_size_multDoubleLinear";
	rename -uid "CE4B48E4-446C-642E-5DBE-AAAEB823591B";
createNode makeNurbSphere -n "m_feather_end_makeNurbSphere";
	rename -uid "CBCAD344-4E9B-79C3-0F54-CDAA13D387B0";
createNode multDoubleLinear -n "m_feather_end_size_multDoubleLinear";
	rename -uid "6BCBDBFD-47ED-5E6D-E196-EF9FCF62F2DB";
createNode groupId -n "l_feather_1_cluster4GroupId";
	rename -uid "F6EB61FA-4053-3D3C-FF8E-C4B40C9275D3";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_1_cluster4Set";
	rename -uid "61899473-4032-B805-D365-4C8700F8C461";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_1_mainPoser_clusterHandleCluster";
	rename -uid "3ED91054-4FD4-427D-084C-F29F56A839A4";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_1_cluster4GroupParts";
	rename -uid "D8D79177-43EB-8CC4-273F-9BBDE077FC54";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_1_tweak24";
	rename -uid "037AA0B9-4A6C-7B4D-F53F-65A558DC3E33";
createNode objectSet -n "l_feather_1_tweakSet24";
	rename -uid "EF0E87DB-44CC-4D1A-5F5F-C6A5D6C3BF07";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_1_groupId42";
	rename -uid "8F4DDA50-4532-7C98-01A6-7A9E6B3FCCA5";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_1_groupParts42";
	rename -uid "E0D0B226-43AE-0F50-45C4-768DE4B342BC";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_1_mainPoser_size_multiplyDivide";
	rename -uid "FC1C4F04-4C60-4BA4-1A9D-83B04F297970";
createNode makeNurbSphere -n "l_feather_1_1_makeNurbSphere";
	rename -uid "1DF0F738-493B-1D42-B4E8-71895DC796D0";
createNode multDoubleLinear -n "l_feather_1_1_size_multDoubleLinear";
	rename -uid "78F3B144-476E-6848-EFB0-E3BAF3E41715";
createNode makeNurbSphere -n "l_feather_1_2_makeNurbSphere";
	rename -uid "5EE2D095-48CD-2B94-D3CD-DEA2E9ECDEA2";
createNode multDoubleLinear -n "l_feather_1_2_size_multDoubleLinear";
	rename -uid "0BF40686-4638-15E9-12DE-2BA8F436C330";
createNode makeNurbSphere -n "l_feather_1_3_makeNurbSphere";
	rename -uid "F5802BC8-4640-66D9-4316-A894291676DD";
createNode multDoubleLinear -n "l_feather_1_3_size_multDoubleLinear";
	rename -uid "B0E6F90B-4733-5FAD-6A4B-DD927EBE0048";
createNode makeNurbSphere -n "l_feather_1_4_makeNurbSphere";
	rename -uid "6C1CA8DB-4C28-5A7F-19D6-56B83F7802BD";
createNode multDoubleLinear -n "l_feather_1_4_size_multDoubleLinear";
	rename -uid "CC46B4DF-4B24-F7B2-F540-DA94426C3BBF";
createNode makeNurbSphere -n "l_feather_1_5_makeNurbSphere";
	rename -uid "7BF1923E-48BD-B3E5-BEEE-A496EB1884E0";
createNode multDoubleLinear -n "l_feather_1_5_size_multDoubleLinear";
	rename -uid "713DE7E7-4635-9FB9-A9B0-7EA30FAF9B35";
createNode makeNurbSphere -n "l_feather_1_end_makeNurbSphere";
	rename -uid "D7BA7088-477F-38E1-7C19-34BF0887A17D";
createNode multDoubleLinear -n "l_feather_1_end_size_multDoubleLinear";
	rename -uid "F4217481-4082-AF17-4A78-56B10DC6C5D3";
createNode groupId -n "l_feather_2_cluster4GroupId";
	rename -uid "00ECD61F-4C32-1F39-A2D7-66BBF1B8B147";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_2_cluster4Set";
	rename -uid "7BD1D13C-4CFF-6222-99FF-20A66F3A0612";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_2_mainPoser_clusterHandleCluster";
	rename -uid "F9DF933D-4ACF-00DB-AC3B-8EB6C1056A73";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_2_cluster4GroupParts";
	rename -uid "B8764520-4ED4-10E5-921C-4CAF73F2A79E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_2_tweak24";
	rename -uid "51955A37-46A4-CBE9-AA46-10B1477F0BA6";
createNode objectSet -n "l_feather_2_tweakSet24";
	rename -uid "1F18D425-4FB0-2047-12B9-628508CFAF82";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_2_groupId42";
	rename -uid "453145CB-4EE1-D20E-DF22-22A15A22CFC9";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_2_groupParts42";
	rename -uid "9466B898-4692-900B-004D-519CD45BBEFE";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_2_mainPoser_size_multiplyDivide";
	rename -uid "D333C9B6-414F-DA03-A848-688D8459BE83";
createNode makeNurbSphere -n "l_feather_2_1_makeNurbSphere";
	rename -uid "C7CB277C-455C-D318-76FC-A3AA0B13CB18";
createNode multDoubleLinear -n "l_feather_2_1_size_multDoubleLinear";
	rename -uid "EDB93D50-4C04-6FE5-6126-9489B7FD737A";
createNode makeNurbSphere -n "l_feather_2_2_makeNurbSphere";
	rename -uid "E1FA6191-4E6F-0B5D-1057-16B848021DBB";
createNode multDoubleLinear -n "l_feather_2_2_size_multDoubleLinear";
	rename -uid "73B3ED63-4ADD-DE4C-6C56-90B353A89F33";
createNode makeNurbSphere -n "l_feather_2_3_makeNurbSphere";
	rename -uid "9CFFE4BA-4AF3-3ECB-43A1-3B97D0327C61";
createNode multDoubleLinear -n "l_feather_2_3_size_multDoubleLinear";
	rename -uid "FB6100A1-40E2-6996-FB2A-FA95CBAD21BD";
createNode makeNurbSphere -n "l_feather_2_4_makeNurbSphere";
	rename -uid "4D17BEE5-4DAB-B3AF-6D2B-A69E842898CD";
createNode multDoubleLinear -n "l_feather_2_4_size_multDoubleLinear";
	rename -uid "77A740BC-4DC8-296E-3B43-508895453B7A";
createNode makeNurbSphere -n "l_feather_2_5_makeNurbSphere";
	rename -uid "4510CBCA-40B3-4748-7ECC-7BBE725A691C";
createNode multDoubleLinear -n "l_feather_2_5_size_multDoubleLinear";
	rename -uid "CFE022B8-41A6-E2B7-8DB0-C0A483EB8D3F";
createNode makeNurbSphere -n "l_feather_2_end_makeNurbSphere";
	rename -uid "A4FC1955-499B-F290-9FF5-DE8AA6C53B88";
createNode multDoubleLinear -n "l_feather_2_end_size_multDoubleLinear";
	rename -uid "EBAE667B-4ADE-BC95-8B4E-F5802C7F9CD4";
createNode groupId -n "l_feather_3_cluster4GroupId";
	rename -uid "97A719B7-4675-8B51-ED7A-1B83E0E4BAA1";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_3_cluster4Set";
	rename -uid "7000C025-44B1-0025-AC05-AFB92657F723";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_3_mainPoser_clusterHandleCluster";
	rename -uid "90F80F93-4321-5B97-1B95-2AA57585FC79";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_3_cluster4GroupParts";
	rename -uid "5CD60170-4486-49D9-52E1-BDBC083A789B";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_3_tweak24";
	rename -uid "28B65FDE-4935-E61E-FD55-80A4601F1AF2";
createNode objectSet -n "l_feather_3_tweakSet24";
	rename -uid "8EBE6E77-409F-A40D-E630-2CAF51F70063";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_3_groupId42";
	rename -uid "96DA028E-4918-791D-E8BE-50817AF7361B";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_3_groupParts42";
	rename -uid "222688FC-43D4-B333-DD28-ED87BB02C840";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_3_mainPoser_size_multiplyDivide";
	rename -uid "93F80BDC-4B0D-AD96-8BA0-83A09AAE0FCA";
createNode makeNurbSphere -n "l_feather_3_1_makeNurbSphere";
	rename -uid "9CCD06A2-4E42-DF1F-9A12-08A697CACC1F";
createNode multDoubleLinear -n "l_feather_3_1_size_multDoubleLinear";
	rename -uid "E1F64AE1-4684-F03F-5499-EF9DD855B40E";
createNode makeNurbSphere -n "l_feather_3_2_makeNurbSphere";
	rename -uid "EEDD1F5D-43A0-3F4C-08F4-FF89B12016C0";
createNode multDoubleLinear -n "l_feather_3_2_size_multDoubleLinear";
	rename -uid "7BA6B4EB-4198-394A-BAC3-2CA711F8C95A";
createNode makeNurbSphere -n "l_feather_3_3_makeNurbSphere";
	rename -uid "1C9DDC93-4891-225C-ED49-79BF3E0C6B53";
createNode multDoubleLinear -n "l_feather_3_3_size_multDoubleLinear";
	rename -uid "65DBD648-4023-A5CC-C146-B7BB961E54F9";
createNode makeNurbSphere -n "l_feather_3_4_makeNurbSphere";
	rename -uid "DE8A1C67-49AB-79AA-7781-8ABFB0BAD871";
createNode multDoubleLinear -n "l_feather_3_4_size_multDoubleLinear";
	rename -uid "F0AF3ABB-4EE1-213A-E27C-209EA4174501";
createNode makeNurbSphere -n "l_feather_3_5_makeNurbSphere";
	rename -uid "3DB7F9B8-41EE-1F7A-8976-F786AEEE48DE";
createNode multDoubleLinear -n "l_feather_3_5_size_multDoubleLinear";
	rename -uid "5EF00FA3-4410-1F87-E41F-80A2264C6361";
createNode makeNurbSphere -n "l_feather_3_end_makeNurbSphere";
	rename -uid "E427C91F-402E-79F3-68E8-43A5F275DCC1";
createNode multDoubleLinear -n "l_feather_3_end_size_multDoubleLinear";
	rename -uid "F7DC35FF-4FE7-DC41-3450-99A1749690C4";
createNode groupId -n "l_feather_4_cluster4GroupId";
	rename -uid "FFA913B3-432A-C66E-B180-B4B9C4E8DFF9";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_4_cluster4Set";
	rename -uid "0CDC14B5-40C7-56C4-E483-AF8BAFCF3068";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_4_mainPoser_clusterHandleCluster";
	rename -uid "9AD71B65-4591-DDC1-9F57-C5BC57A0A8FE";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_4_cluster4GroupParts";
	rename -uid "B0FB0E82-4241-D518-3046-BCB053CA22B4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_4_tweak24";
	rename -uid "DC6EC8FE-4C22-662B-48EA-0180B01E5C79";
createNode objectSet -n "l_feather_4_tweakSet24";
	rename -uid "212E25FF-4B40-F6C5-2D13-CBBC723E41D7";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_4_groupId42";
	rename -uid "616EDBE9-44C6-77A1-AEE3-1DBE35E6A433";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_4_groupParts42";
	rename -uid "C2C79E63-4D87-AB36-D0DA-C4AD26515F32";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_4_mainPoser_size_multiplyDivide";
	rename -uid "65DD6331-429F-8EA9-6057-8C93B85086A2";
createNode makeNurbSphere -n "l_feather_4_1_makeNurbSphere";
	rename -uid "BAD157CD-4D10-6EA0-37EB-1C8AEBDD7D31";
createNode multDoubleLinear -n "l_feather_4_1_size_multDoubleLinear";
	rename -uid "5D579F50-4804-4A0C-49C1-A1B93683B679";
createNode makeNurbSphere -n "l_feather_4_2_makeNurbSphere";
	rename -uid "384CD6D4-4440-5AE9-637B-3C8AE9341F95";
createNode multDoubleLinear -n "l_feather_4_2_size_multDoubleLinear";
	rename -uid "7D4513C2-41F7-6067-D98F-1EB919A84F83";
createNode makeNurbSphere -n "l_feather_4_3_makeNurbSphere";
	rename -uid "55DFF403-4299-19B7-035A-10A368B30AED";
createNode multDoubleLinear -n "l_feather_4_3_size_multDoubleLinear";
	rename -uid "2F79588B-4A40-323D-23DA-15B7D362FC41";
createNode makeNurbSphere -n "l_feather_4_4_makeNurbSphere";
	rename -uid "2CE15B7F-4686-F32B-F6DB-A0AAD3432BED";
createNode multDoubleLinear -n "l_feather_4_4_size_multDoubleLinear";
	rename -uid "8062E8C7-4C26-69C1-694E-6C84C697083A";
createNode makeNurbSphere -n "l_feather_4_5_makeNurbSphere";
	rename -uid "D8314E53-427A-960A-4B99-52BE8BBFEC1E";
createNode multDoubleLinear -n "l_feather_4_5_size_multDoubleLinear";
	rename -uid "F231DA5D-4139-80B0-E9EB-45BEECCD889A";
createNode makeNurbSphere -n "l_feather_4_end_makeNurbSphere";
	rename -uid "1C1416E1-4496-5AA6-524E-F6A34EFE6BBA";
createNode multDoubleLinear -n "l_feather_4_end_size_multDoubleLinear";
	rename -uid "CBD06895-4B42-9A25-CCF8-A99B860C1B89";
createNode groupId -n "l_feather_5_cluster4GroupId";
	rename -uid "F77EFDDE-42A0-0DE2-FE4E-C982F0D98AED";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_5_cluster4Set";
	rename -uid "0C6D4610-4D0F-1536-BE41-25B46F5D0168";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_5_mainPoser_clusterHandleCluster";
	rename -uid "90C86012-4352-5E1E-EA8C-BEB88D46E870";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_5_cluster4GroupParts";
	rename -uid "B698FB6A-48F9-6622-CED0-8F8FD45F4DE9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_5_tweak24";
	rename -uid "DD70B1BE-4B9A-9645-5D68-DF9F914B25BA";
createNode objectSet -n "l_feather_5_tweakSet24";
	rename -uid "1913262C-4F47-F505-B554-D6BF2E0120E2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_5_groupId42";
	rename -uid "453EF90F-4A96-97F8-D4AC-9C8DA81614A3";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_5_groupParts42";
	rename -uid "A8610194-4D01-2151-E862-018A8A5488E4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_5_mainPoser_size_multiplyDivide";
	rename -uid "AFD76019-4FB2-C9B6-2403-00B171BD72CE";
createNode makeNurbSphere -n "l_feather_5_1_makeNurbSphere";
	rename -uid "C97C1C8F-4CEB-AD11-7C4A-62B8CFFE3DD5";
createNode multDoubleLinear -n "l_feather_5_1_size_multDoubleLinear";
	rename -uid "76D2E66F-483E-A89C-82B0-4685B5297469";
createNode makeNurbSphere -n "l_feather_5_2_makeNurbSphere";
	rename -uid "5FDC55E3-4D08-2430-6FEB-819C658E26AD";
createNode multDoubleLinear -n "l_feather_5_2_size_multDoubleLinear";
	rename -uid "40249B63-4ACE-0534-C623-1685B3F451A5";
createNode makeNurbSphere -n "l_feather_5_3_makeNurbSphere";
	rename -uid "BD20EE42-4B9E-C50E-C2EF-B694B94ADBEC";
createNode multDoubleLinear -n "l_feather_5_3_size_multDoubleLinear";
	rename -uid "1BDEEAAE-47CC-9BE4-0790-0D92738A0235";
createNode makeNurbSphere -n "l_feather_5_4_makeNurbSphere";
	rename -uid "74541EE1-4098-14D0-458D-DA880F2B13EF";
createNode multDoubleLinear -n "l_feather_5_4_size_multDoubleLinear";
	rename -uid "EE23890C-4795-D20C-0BEC-C3A356AA1852";
createNode makeNurbSphere -n "l_feather_5_5_makeNurbSphere";
	rename -uid "69E82331-4AB7-501F-B6D2-628F4852A56A";
createNode multDoubleLinear -n "l_feather_5_5_size_multDoubleLinear";
	rename -uid "777AF910-4BE8-4316-73F8-AABA352BAD52";
createNode makeNurbSphere -n "l_feather_5_end_makeNurbSphere";
	rename -uid "E09C4C04-4F30-7811-4DC3-FBB9D80E7FF7";
createNode multDoubleLinear -n "l_feather_5_end_size_multDoubleLinear";
	rename -uid "7C95381A-4B53-619E-A4F9-1B9BA7930376";
createNode makeNurbSphere -n "main_1_makeNurbSphere";
	rename -uid "7C36216B-4A3A-D718-68E7-53851E181CAF";
createNode multDoubleLinear -n "main_1_size_multDoubleLinear";
	rename -uid "25595580-434E-D5E1-3F56-60AFFFC01B5C";
createNode makeNurbSphere -n "main_2_makeNurbSphere";
	rename -uid "544290D8-4F29-1571-C40C-0B80DCADBF10";
createNode multDoubleLinear -n "main_2_size_multDoubleLinear";
	rename -uid "7E6B5C5D-4476-AF56-4A4A-3DB4395F02D8";
createNode makeNurbSphere -n "main_3_makeNurbSphere";
	rename -uid "44410E7E-4D14-9BB9-9565-F98EDDAFC229";
createNode multDoubleLinear -n "main_3_size_multDoubleLinear";
	rename -uid "7DF83221-4C04-CBDD-CC56-15995E94DB3A";
createNode makeNurbSphere -n "main_4_makeNurbSphere";
	rename -uid "A3F408EC-4381-1FC2-6A1A-19BEDD841DA1";
createNode multDoubleLinear -n "main_4_size_multDoubleLinear";
	rename -uid "7515C1C3-4206-5742-EC93-FD91CB39943F";
createNode sweepMeshCreator -n "lines_sweepMeshCreator";
	rename -uid "23257D5F-4796-3C79-ACA4-10BD87412B9F";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
	setAttr -s 6 ".inCurveArray";
	setAttr -s 6 ".outMeshArray";
createNode multDoubleLinear -n "lines_size_multDoubleLinear";
	rename -uid "59B6E313-4B5A-B8B4-905E-F9A1461A80E8";
createNode multMatrix -n "r_feather_1_1_initLoc_multMat";
	rename -uid "96AFFDA5-4E13-C051-8FB5-1588D68E7015";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_2_initLoc_multMat";
	rename -uid "49E90B23-4AD9-04EA-6E83-A0AE096F4C5C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_3_initLoc_multMat";
	rename -uid "238EFF56-4F4D-2F00-6404-3CAAD0601358";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_4_initLoc_multMat";
	rename -uid "562132E6-45D5-8321-C461-9CB33675078C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_5_initLoc_multMat";
	rename -uid "323475B9-46C5-18FC-7E87-8580D4BF8E45";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_end_initLoc_multMat";
	rename -uid "A73A4D1A-471C-E6F8-C7BB-BEBD7CCCDE76";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_1_fanLoc_multMat";
	rename -uid "B0C1DB39-4108-841A-92DA-8FB3A2BDFFBF";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_1_initLoc_multMat";
	rename -uid "3774A3CC-4E57-7F14-B781-758DACD5E990";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_2_initLoc_multMat";
	rename -uid "7E431903-4E62-30FE-22B0-F9B82DB8DA82";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_3_initLoc_multMat";
	rename -uid "96247693-4A25-5946-AC0A-36A22207CCEE";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_4_initLoc_multMat";
	rename -uid "3899C5CF-4579-AA69-E910-C498426D6EEF";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_5_initLoc_multMat";
	rename -uid "9A9A5B0F-49B6-B32A-7DAE-D5B16BDB6380";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_end_initLoc_multMat";
	rename -uid "582DF27B-499C-2F1C-90C5-0896554E6853";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_1_fanLoc_multMat";
	rename -uid "11554693-45FE-BE1E-49F0-6DBC6D298CB3";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_1_initLoc_multMat";
	rename -uid "C02DC503-486A-2EA8-414F-83918B3932D1";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_2_initLoc_multMat";
	rename -uid "18447522-4B73-04D9-27C4-5687318BA181";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_3_initLoc_multMat";
	rename -uid "9C0BEFFF-46DF-4A3E-2894-E99CEC2E7151";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_4_initLoc_multMat";
	rename -uid "C467B249-4AB1-BCCD-9A89-33BEBB73A18E";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_5_initLoc_multMat";
	rename -uid "F235E5EB-4714-2815-1CFA-C68FA326486F";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_end_initLoc_multMat";
	rename -uid "BD862567-4638-EE97-8C12-BBBC3A6A98A3";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_1_fanLoc_multMat";
	rename -uid "9C0B7CC5-4AC3-FC50-C0ED-F09036DA2C8F";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_1_initLoc_multMat";
	rename -uid "EF4C985B-4553-E693-F804-32AA5E72D795";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_2_initLoc_multMat";
	rename -uid "642B5721-419C-14B3-104B-CD88E20CC272";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_3_initLoc_multMat";
	rename -uid "448BEEDF-40D1-1C3A-EB3E-DA9432D75C3D";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_4_initLoc_multMat";
	rename -uid "E7EB7876-45BE-481B-5541-2E94D9300286";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_5_initLoc_multMat";
	rename -uid "CDB62720-4FD7-551F-C72A-2C9DBA0B16FD";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_end_initLoc_multMat";
	rename -uid "7851B741-4AC3-CCED-1703-8097AB484E27";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_1_fanLoc_multMat";
	rename -uid "8614C828-4252-A7C0-0BA1-7587A80540CC";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_1_initLoc_multMat";
	rename -uid "98310349-4990-597D-50F6-2C8E7A136018";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_2_initLoc_multMat";
	rename -uid "B7543F85-4AA0-B893-EACF-97B48E8E2D73";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_3_initLoc_multMat";
	rename -uid "895DC52A-4DD1-6773-3493-C8A5DA682025";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_4_initLoc_multMat";
	rename -uid "69305EFD-4454-EC8A-D6FB-D486EF3BA32C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_5_initLoc_multMat";
	rename -uid "B7DC5CA4-4678-117D-6756-1FA1EB8D6868";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_end_initLoc_multMat";
	rename -uid "CC39BFE9-4950-2D1E-AFF3-EB95104A2021";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_1_fanLoc_multMat";
	rename -uid "D8FE2613-47F6-FE41-0F23-89B3D1776867";
	setAttr -s 5 ".i";
createNode animBlendNodeAdditiveRotation -n "feather_1_rotation";
	rename -uid "B1918A96-423F-86C6-D350-1A9BE9D57F28";
	setAttr ".wa" 0.8;
	setAttr ".wb" 0.2;
createNode animBlendNodeAdditiveRotation -n "feather_2_rotation";
	rename -uid "69458326-4966-5C03-2277-779C3C5EB26C";
	setAttr ".wa" 0.6;
	setAttr ".wb" 0.4;
createNode animBlendNodeAdditiveRotation -n "feather_3_rotation";
	rename -uid "0EB32B63-4E63-B5E6-2F3F-2B9BDB11A8C1";
	setAttr ".wa" 0.4;
	setAttr ".wb" 0.6;
createNode animBlendNodeAdditiveRotation -n "feather_4_rotation";
	rename -uid "3234ACED-4D4B-A7ED-5CE5-4CAE08651088";
	setAttr ".wa" 0.19999999999999996;
	setAttr ".wb" 0.8;
createNode animBlendNodeAdditiveRotation -n "feather_5_rotation";
	rename -uid "4927B2D6-4A18-E9EB-534C-03A2C134ED2A";
	setAttr ".wa" 0;
createNode animBlendNodeAdditiveRotation -n "feather_1_rootRotation";
	rename -uid "19F2CBD0-4B63-6151-42B6-C5B62DF92273";
	setAttr ".wa" 0;
	setAttr ".wb" 0.2;
createNode animBlendNodeAdditiveRotation -n "feather_2_rootRotation";
	rename -uid "FE50D985-4AA2-1EE7-47B6-84BA44CEA208";
	setAttr ".wa" 0;
	setAttr ".wb" 0.4;
createNode animBlendNodeAdditiveRotation -n "feather_3_rootRotation";
	rename -uid "D153CF0E-4A95-494A-9A81-25A2A5868ED3";
	setAttr ".wa" 0;
	setAttr ".wb" 0.6;
createNode animBlendNodeAdditiveRotation -n "feather_4_rootRotation";
	rename -uid "70DD6288-41D3-43AC-B40E-3A9B6A072652";
	setAttr ".wa" 0;
	setAttr ".wb" 0.8;
createNode animBlendNodeAdditiveRotation -n "feather_5_rootRotation";
	rename -uid "D83B9862-4ECB-06FB-5798-258FEE3E19CD";
	setAttr ".wa" 0;
createNode multMatrix -n "m_feather_1_group_multMat";
	rename -uid "6275CF14-4314-AAF6-D383-DFAFA44C82DA";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_1_outJoint_multMat";
	rename -uid "7B16F129-4D04-2646-248B-6BA5EBDF2462";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "m_feather_1_outJoint_decMat";
	rename -uid "B3AB8744-43FF-4AF3-F03A-B88390FFBDF8";
createNode multMatrix -n "m_feather_2_group_multMat";
	rename -uid "ECB451AA-469D-F94B-630E-9B8FB7DC9F29";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_2_mainGroup_multMat";
	rename -uid "3C8FC7E8-4CA8-8A14-14C4-E4806A34FF82";
	setAttr -s 5 ".i";
createNode multMatrix -n "m_feather_2_outJoint_multMat";
	rename -uid "4C724755-446C-C8D0-8757-A29BE3DEF98C";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_2_outJoint_decMat";
	rename -uid "24F64EB1-4769-C4BA-9394-79AB654A48D4";
createNode multMatrix -n "m_feather_3_group_multMat";
	rename -uid "A9CDCB63-4B4F-F174-5CF7-F2B140FB8ABD";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_3_mainGroup_multMat";
	rename -uid "C1D42333-4880-9842-6629-20BEFCA04C96";
	setAttr -s 5 ".i";
createNode multMatrix -n "m_feather_3_outJoint_multMat";
	rename -uid "35722C61-449B-12C2-83D2-11A5C18DE38B";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_3_outJoint_decMat";
	rename -uid "77B9F2E7-4B7E-644F-5BEC-02977142D0EE";
createNode multMatrix -n "m_feather_4_group_multMat";
	rename -uid "484DDB23-40B4-1C17-A8F3-EB87D0FC15EF";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_4_mainGroup_multMat";
	rename -uid "D147ADB2-49EC-FEBC-EB71-5FA9BCB6D4FD";
	setAttr -s 5 ".i";
createNode multMatrix -n "m_feather_4_outJoint_multMat";
	rename -uid "B3D62360-4B45-9AE5-43F6-92B12D55B6E7";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_4_outJoint_decMat";
	rename -uid "2441F6B8-4585-E31F-0D18-1C8EC4701BAB";
createNode multMatrix -n "m_feather_5_group_multMat";
	rename -uid "49A8DA75-44FA-2FAD-7DA3-86A34E8ED0BA";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_5_mainGroup_multMat";
	rename -uid "65DC35FF-4B18-0B9B-1563-52819C316658";
	setAttr -s 5 ".i";
createNode multMatrix -n "m_feather_5_outJoint_multMat";
	rename -uid "8F3F12C5-49A0-9C6F-171D-EC999C71986A";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_5_outJoint_decMat";
	rename -uid "6D9BC14D-43DE-7C72-4DB6-06A466B7C9BB";
createNode multMatrix -n "m_feather_end_multMat";
	rename -uid "505261FA-4F82-98C2-BF3D-C8ADDB9DC1B2";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "m_feather_end_decMat";
	rename -uid "288450D3-4D11-9479-3472-658173D39C56";
createNode objectSet -n "m_feather_moduleControlSet";
	rename -uid "D8501D6A-4B7D-411A-D2EC-DC907242EA88";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_1_1_group_multMat";
	rename -uid "880AB484-495E-9549-263B-E1BD107643C5";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_1_rollGroup_multMat";
	rename -uid "70D57F29-42BD-8DC0-D52F-4FB0BADCC59E";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_1_outJoint_multMat";
	rename -uid "F09E5601-4B41-78A3-5B31-598C873CF5B1";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_1_1_outJoint_decMat";
	rename -uid "F0F77AD8-437D-CFBA-1371-E5AEEECA49B4";
createNode multMatrix -n "l_feather_1_2_group_multMat";
	rename -uid "957074CC-4790-F5EA-4FE0-B4809C3258E7";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_2_mainGroup_multMat";
	rename -uid "1A578175-4112-1BF3-A510-27885791832B";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_1_2_rollGroup_multMat";
	rename -uid "4BC4114C-4ECB-A80C-98BD-C8BF355A6074";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_2_outJoint_multMat";
	rename -uid "B3F580FA-4852-721B-DE3E-D38004E3F47D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_2_outJoint_decMat";
	rename -uid "75D4EF1F-4976-4626-4A49-AB95B55F44AC";
createNode multMatrix -n "l_feather_1_3_group_multMat";
	rename -uid "884F5CEA-4D2D-C26A-F1F5-F89B48844872";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_3_mainGroup_multMat";
	rename -uid "50C9B9F5-41A4-6203-7421-D7B41EB90BC6";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_1_3_rollGroup_multMat";
	rename -uid "F44593EA-4D79-8959-AD73-14A53006BA78";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_3_outJoint_multMat";
	rename -uid "51D65D2B-4887-8761-CEE9-BEAD02DC9E81";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_3_outJoint_decMat";
	rename -uid "EF7DB8B7-4954-4122-E377-6AA008158328";
createNode multMatrix -n "l_feather_1_4_group_multMat";
	rename -uid "A6BDB8E6-426F-AC14-B6E1-44BAE5C33223";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_4_mainGroup_multMat";
	rename -uid "B66CA665-4EDF-FDE1-28B7-088835BB76B5";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_1_4_rollGroup_multMat";
	rename -uid "ADBD89AC-4B52-7B31-C0E2-01AA01989712";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_4_outJoint_multMat";
	rename -uid "A6DB26B6-4361-52FC-3E15-8FBCF3A96372";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_4_outJoint_decMat";
	rename -uid "A24872D4-46E6-19F5-9D46-A18FAB6FC8A7";
createNode multMatrix -n "l_feather_1_5_group_multMat";
	rename -uid "8793B3DA-4329-719A-C962-3CA5FA7B7D89";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_5_mainGroup_multMat";
	rename -uid "A69054B4-44EE-EDB4-C41A-F197EF5C9D41";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_1_5_rollGroup_multMat";
	rename -uid "3DE35287-4ACF-C37E-5842-DDADA669C765";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_5_outJoint_multMat";
	rename -uid "7DDC400B-4BF1-D452-42FB-5683F3559DA3";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_5_outJoint_decMat";
	rename -uid "DAC07900-41C1-9E9C-B23E-5B8117824DD4";
createNode multMatrix -n "l_feather_1_end_multMat";
	rename -uid "BE9D3562-4A82-DAA2-314B-BC8FFB5D02A8";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_1_end_decMat";
	rename -uid "E3A2ACC3-46F4-7FD6-D6DF-7AB0B522EF52";
createNode objectSet -n "l_feather_1_moduleControlSet";
	rename -uid "4A0DEC68-49CB-8331-EC00-17908E2657DE";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_2_1_group_multMat";
	rename -uid "ECC4917D-4B0F-1F70-128C-DFBB256645D0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_1_rollGroup_multMat";
	rename -uid "A6573F70-4860-2D44-9FEE-5CB4A53D4BB7";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_1_outJoint_multMat";
	rename -uid "FB56BD81-4901-9656-182B-82859A82AAC0";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_2_1_outJoint_decMat";
	rename -uid "55E23755-439F-CD1A-9094-3DA00CA4C479";
createNode multMatrix -n "l_feather_2_2_group_multMat";
	rename -uid "1F558AC4-48BC-0BFF-8565-C1B395A82E9E";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_2_mainGroup_multMat";
	rename -uid "D91D7BDD-4F2B-EF93-6B98-978C45A0E7FC";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_2_2_rollGroup_multMat";
	rename -uid "AB6FE6FB-48FD-2C44-DB01-B29F8DF2AF88";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_2_outJoint_multMat";
	rename -uid "575EDCFB-46B0-8F98-21C7-5BB3FA9F745F";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_2_outJoint_decMat";
	rename -uid "723A8DBB-4DCA-97CD-D730-6F82025984D6";
createNode multMatrix -n "l_feather_2_3_group_multMat";
	rename -uid "A9A582ED-4906-A8B7-F160-0195A64118B2";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_3_mainGroup_multMat";
	rename -uid "B78C8596-45AC-BEAE-7CC1-5CA7A405A9D9";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_2_3_rollGroup_multMat";
	rename -uid "E7810B2C-49A1-0FD3-A4AA-EF8E8AD0D50B";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_3_outJoint_multMat";
	rename -uid "D8166EB2-4732-443E-4C25-069CFA3526E3";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_3_outJoint_decMat";
	rename -uid "C643E3BB-40F9-7047-5FC5-7D9A3B80BDAA";
createNode multMatrix -n "l_feather_2_4_group_multMat";
	rename -uid "8A4CF424-4D8D-D55A-21FC-FB9B86921230";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_4_mainGroup_multMat";
	rename -uid "AF42E3B6-43D3-D73A-26AF-478F781BFF28";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_2_4_rollGroup_multMat";
	rename -uid "7C082E35-4A6C-63E6-45D0-45AFEC2D9A90";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_4_outJoint_multMat";
	rename -uid "0A12156D-469F-3D6F-2972-08836CABCA58";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_4_outJoint_decMat";
	rename -uid "4F48559A-4378-6890-09B0-EDA6470B551A";
createNode multMatrix -n "l_feather_2_5_group_multMat";
	rename -uid "886DAFD0-48A6-0FE3-F5E6-188E08F9D2E5";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_5_mainGroup_multMat";
	rename -uid "9D42C4ED-426C-9D36-B402-5C951554E642";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_2_5_rollGroup_multMat";
	rename -uid "B84628DC-46CF-7840-AE06-6A96641E0843";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_5_outJoint_multMat";
	rename -uid "1043FDB3-4C99-C749-E2A1-B783C54E07A5";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_5_outJoint_decMat";
	rename -uid "2F3BDD75-4CC2-D06C-D970-5DA456E07665";
createNode multMatrix -n "l_feather_2_end_multMat";
	rename -uid "29F47587-41BA-4397-7CDE-908141BB0A3F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_2_end_decMat";
	rename -uid "636E3672-4819-13BE-5FE6-34B55E9BDA78";
createNode objectSet -n "l_feather_2_moduleControlSet";
	rename -uid "001693DC-42A8-DDB4-9E44-4CAE7272D31A";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_3_1_group_multMat";
	rename -uid "08A87639-4838-04B2-4B7D-4B93E81F57F9";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_1_rollGroup_multMat";
	rename -uid "796BD8CC-4F53-EF41-1E70-39AAAC4910F0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_1_outJoint_multMat";
	rename -uid "F084C631-47D9-C534-8610-E6BE84D1DF05";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_3_1_outJoint_decMat";
	rename -uid "AB909655-4142-6BB2-E20C-68AEC1EBE716";
createNode multMatrix -n "l_feather_3_2_group_multMat";
	rename -uid "97F3026D-4444-EAFE-E115-FCA9EA7EF6DB";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_2_mainGroup_multMat";
	rename -uid "B1C6BFC0-4C30-B17C-9460-A9B091CD2670";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_3_2_rollGroup_multMat";
	rename -uid "3849A066-43BF-79FF-A5B7-449FE38D878C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_2_outJoint_multMat";
	rename -uid "1EC4879D-4DF9-3848-C377-A899E5452C62";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_2_outJoint_decMat";
	rename -uid "85461C18-4774-1EC5-0DD3-7FB64B59CDAC";
createNode multMatrix -n "l_feather_3_3_group_multMat";
	rename -uid "D56C8523-4490-6ABC-A4E1-D895B951FE5A";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_3_mainGroup_multMat";
	rename -uid "6EA58574-4011-B679-A89C-8083178670EB";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_3_3_rollGroup_multMat";
	rename -uid "B170816F-4C94-4CCF-1906-278C93D6F6B9";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_3_outJoint_multMat";
	rename -uid "92C991DA-4956-E9B4-2184-06B1A6DE28D0";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_3_outJoint_decMat";
	rename -uid "A94D6E64-4DB6-C97D-D597-6DA40E8BA5C2";
createNode multMatrix -n "l_feather_3_4_group_multMat";
	rename -uid "337CBE92-458D-0FCC-FC88-BCB46A771B78";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_4_mainGroup_multMat";
	rename -uid "790E3654-4074-22AF-DD28-39AE24F8A44F";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_3_4_rollGroup_multMat";
	rename -uid "7604C82B-4262-831B-907D-FB93D2A95C05";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_4_outJoint_multMat";
	rename -uid "6313C961-48F6-51B9-2C06-62976A1530DA";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_4_outJoint_decMat";
	rename -uid "5685C5B6-4F47-F735-7042-56AB03D665C1";
createNode multMatrix -n "l_feather_3_5_group_multMat";
	rename -uid "8D92ED60-4677-668C-D74B-239B6B422E22";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_5_mainGroup_multMat";
	rename -uid "A2AA5D86-4321-6822-AB84-47A59167E839";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_3_5_rollGroup_multMat";
	rename -uid "3B77ED3E-4492-1189-A009-EABBB55CA7CD";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_5_outJoint_multMat";
	rename -uid "F58E70CC-40A1-3699-E434-C08629DBD927";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_5_outJoint_decMat";
	rename -uid "775481EB-46E3-EDD2-BE37-2FB4AE36FA9B";
createNode multMatrix -n "l_feather_3_end_multMat";
	rename -uid "2AC1C940-40E8-B42F-4D8B-21A98AEB5E0C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_3_end_decMat";
	rename -uid "E0C57A90-443D-6B95-7775-0A84A4F37464";
createNode objectSet -n "l_feather_3_moduleControlSet";
	rename -uid "AA446F3D-49D5-87E9-D689-43934A8FD099";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_4_1_group_multMat";
	rename -uid "B1076566-4748-BF6A-0492-DA9B90D4344C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_1_rollGroup_multMat";
	rename -uid "16BA536B-44E7-9035-3BB2-19BF2DEDC7BD";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_1_outJoint_multMat";
	rename -uid "A2C5AF12-47E9-E869-55B0-1F8D7A5BBEE8";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_4_1_outJoint_decMat";
	rename -uid "CAAA0EA7-4F23-2A47-C494-EF923B998E2F";
createNode multMatrix -n "l_feather_4_2_group_multMat";
	rename -uid "C949C736-4A9B-CAE5-31E6-DEBEDBE7E52E";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_2_mainGroup_multMat";
	rename -uid "51F92DFC-4EC6-05B8-7477-5689210D35BE";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_4_2_rollGroup_multMat";
	rename -uid "3A9DC2AD-4C71-8899-A9B4-9DBDC39D25B0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_2_outJoint_multMat";
	rename -uid "FB2B5DB2-4119-4985-F12C-3B97087906E0";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_2_outJoint_decMat";
	rename -uid "EE3D21E8-4E8A-4349-8BEC-A7A8F0642C6B";
createNode multMatrix -n "l_feather_4_3_group_multMat";
	rename -uid "88683707-47AF-817F-BE9E-6B8561A7BBAE";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_3_mainGroup_multMat";
	rename -uid "163B2793-4BF7-98FB-5A22-D49549125001";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_4_3_rollGroup_multMat";
	rename -uid "ADB62F6B-4737-7A23-CD08-0FB04B9B8392";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_3_outJoint_multMat";
	rename -uid "4B865EA5-43AF-EF78-F428-D1A887261BC6";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_3_outJoint_decMat";
	rename -uid "A246B935-46AD-7F71-F4E6-FCA1CBAB79BC";
createNode multMatrix -n "l_feather_4_4_group_multMat";
	rename -uid "F9F03F58-4DA0-8D27-F951-5E8C8BFDE6D0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_4_mainGroup_multMat";
	rename -uid "69F3F037-4366-A127-C5B2-D686924A5DB9";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_4_4_rollGroup_multMat";
	rename -uid "B5DDB0A8-414D-CB02-5DEE-C194215139B2";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_4_outJoint_multMat";
	rename -uid "E25EA2CA-49C6-4930-C094-7FA8EA47C2B4";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_4_outJoint_decMat";
	rename -uid "A8231474-40C7-D32C-AF4A-82B1C270AD66";
createNode multMatrix -n "l_feather_4_5_group_multMat";
	rename -uid "24D131BD-42E6-C698-FD21-FC8B305AD462";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_5_mainGroup_multMat";
	rename -uid "B593DA76-40B2-2B9E-5D0D-6AB79C923D80";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_4_5_rollGroup_multMat";
	rename -uid "F99510AB-4744-40EE-B844-A69B196105C4";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_5_outJoint_multMat";
	rename -uid "5147F756-48C1-E4F1-2FCB-349FB340317D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_5_outJoint_decMat";
	rename -uid "525A5D27-4A02-E25D-92EF-C5A3D702771C";
createNode multMatrix -n "l_feather_4_end_multMat";
	rename -uid "AF198C49-48FF-42A6-B42B-6BBA9DDDC670";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_4_end_decMat";
	rename -uid "603ECF32-4E58-A8E3-2343-D8834C5331A4";
createNode objectSet -n "l_feather_4_moduleControlSet";
	rename -uid "E839E00F-42B0-4987-ED57-788B76F5DDC8";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_5_1_group_multMat";
	rename -uid "2A7BB0E2-4715-4FBE-40D1-6980C4D6AC75";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_1_rollGroup_multMat";
	rename -uid "DA3B4C0B-472E-8C6A-A58F-488259109B21";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_1_outJoint_multMat";
	rename -uid "D731DA56-41E4-F594-9D3A-9EB01D8727DD";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_5_1_outJoint_decMat";
	rename -uid "194075CC-402F-C8C3-07F3-00A5DDB35BA4";
createNode multMatrix -n "l_feather_5_2_group_multMat";
	rename -uid "D4F059A0-411D-1818-40F3-3AAFE2A2FFD3";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_2_mainGroup_multMat";
	rename -uid "49D9EAF0-47C9-2052-D37C-EDB68A1C8F8C";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_5_2_rollGroup_multMat";
	rename -uid "8B333D5D-48EF-7B6C-0BB0-4EB5AEEACA14";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_2_outJoint_multMat";
	rename -uid "9E922504-4D7F-F389-F568-56B1ED24CC28";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_2_outJoint_decMat";
	rename -uid "525EA9A0-477B-57C2-C882-C980DD67F186";
createNode multMatrix -n "l_feather_5_3_group_multMat";
	rename -uid "7A4C3D37-4443-C68C-B23D-D1B84B96CFD9";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_3_mainGroup_multMat";
	rename -uid "0EC82ECD-4771-4DF8-E7F0-0FBB50890756";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_5_3_rollGroup_multMat";
	rename -uid "3E38D338-442F-0115-20AF-C59CD52D6645";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_3_outJoint_multMat";
	rename -uid "CC8C623D-4465-8CD5-E481-DB99C1721F1F";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_3_outJoint_decMat";
	rename -uid "30D5DD14-4E5A-F333-13CF-C7B512D1450F";
createNode multMatrix -n "l_feather_5_4_group_multMat";
	rename -uid "3F9B9D98-46DA-F9AC-365B-38B88C28260C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_4_mainGroup_multMat";
	rename -uid "3FAD9CA4-41F7-1B8C-C74D-BDA4B6DCE6FC";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_5_4_rollGroup_multMat";
	rename -uid "D64EFE46-49A4-8E06-E3E4-67BBB0CA8782";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_4_outJoint_multMat";
	rename -uid "8E3D4989-43A1-AAD5-ACCB-5CA29E4272D0";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_4_outJoint_decMat";
	rename -uid "AD4DEE46-40F1-4C73-F4A4-1DB81CBF9801";
createNode multMatrix -n "l_feather_5_5_group_multMat";
	rename -uid "2F0FB27D-422D-F2B2-B50F-0FAC6E88E2B0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_5_mainGroup_multMat";
	rename -uid "834E52CA-4794-CC15-792F-52AABA6E10C4";
	setAttr -s 5 ".i";
createNode multMatrix -n "l_feather_5_5_rollGroup_multMat";
	rename -uid "A7F61391-4908-FB73-F7EA-4E80F7092E33";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_5_outJoint_multMat";
	rename -uid "3DDCF22E-46F9-900C-2486-639A0925B5CB";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_5_outJoint_decMat";
	rename -uid "290033A5-4E5B-4A83-5135-61A922A07E85";
createNode multMatrix -n "l_feather_5_end_multMat";
	rename -uid "3C40FE17-4108-28FC-8011-ABBC9740912E";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_5_end_decMat";
	rename -uid "92DCDCCB-4B65-E87B-1801-5791C56F228B";
createNode objectSet -n "l_feather_5_moduleControlSet";
	rename -uid "825C0237-4C56-2E12-A2D5-08B632F205B6";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_1_1_group_multMat";
	rename -uid "34BFEC9E-45DF-E47C-42E5-D1901505092C";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_1_1_outJoint_multMat";
	rename -uid "265E8267-4A7C-5DE9-0E60-678A362D1BF2";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_1_1_outJoint_decMat";
	rename -uid "C00D9EFC-4F2B-9978-0CC8-FE9BA9D904DE";
createNode multMatrix -n "r_feather_1_2_mainGroup_multMat";
	rename -uid "254C4E8D-4A6A-2195-ABF6-10BA6737802C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_2_outJoint_multMat";
	rename -uid "5C7A0CC0-4559-0B54-DBB6-C1A44E2E5E7D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_2_outJoint_decMat";
	rename -uid "40F3601F-43EF-B197-5A2D-0EA87413C6B4";
createNode multMatrix -n "r_feather_1_3_mainGroup_multMat";
	rename -uid "244D517A-441B-AE04-28FC-89840E8B7E70";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_3_outJoint_multMat";
	rename -uid "0C6D9719-45F0-58BE-342A-27B8B22A2BC6";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_3_outJoint_decMat";
	rename -uid "54E4E925-445C-4352-6945-B8ABE86B5D68";
createNode multMatrix -n "r_feather_1_4_mainGroup_multMat";
	rename -uid "D11BD1C4-4BEB-F54B-A28F-5FB0128430D3";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_4_outJoint_multMat";
	rename -uid "73D6183A-43A8-F037-0628-418BE4E7266A";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_4_outJoint_decMat";
	rename -uid "493E0599-4C1B-7620-84A7-5EB5A29BF93D";
createNode multMatrix -n "r_feather_1_5_mainGroup_multMat";
	rename -uid "C9FEFF8A-441A-C065-276F-20A13C4672DE";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_5_outJoint_multMat";
	rename -uid "8691A607-40F1-77EA-F710-6B87F11CC1DB";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_5_outJoint_decMat";
	rename -uid "4F177120-4B41-7DCB-F437-8AA00352A8E1";
createNode objectSet -n "r_feather_1_moduleControlSet";
	rename -uid "E6A6BF0F-496B-8B1B-B0C2-6FB20220C219";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_2_1_group_multMat";
	rename -uid "AA841ABF-4D5F-8336-5B24-AB81D77B82F4";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_2_1_outJoint_multMat";
	rename -uid "7F9C0BB0-47FE-A582-78AD-AEAD1B856CA5";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_2_1_outJoint_decMat";
	rename -uid "C68A000D-4A6A-EF12-9337-39941E84B98A";
createNode multMatrix -n "r_feather_2_2_mainGroup_multMat";
	rename -uid "A71EFBAE-4148-AA27-B6D3-F4A46F3325FD";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_2_outJoint_multMat";
	rename -uid "C6701056-4964-72E4-5E04-3798FB91DBFA";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_2_outJoint_decMat";
	rename -uid "EC964FD5-46C1-3EA2-D753-D4A563513275";
createNode multMatrix -n "r_feather_2_3_mainGroup_multMat";
	rename -uid "0F8713B5-4DBA-60CC-434F-22BBA442A344";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_3_outJoint_multMat";
	rename -uid "8966FE78-46D6-B828-63ED-2AB23D216AAD";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_3_outJoint_decMat";
	rename -uid "D2E34197-4C13-E052-3BC3-F6BA6EC02693";
createNode multMatrix -n "r_feather_2_4_mainGroup_multMat";
	rename -uid "D07937F1-41FA-BBAB-99AD-8FB875670C86";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_4_outJoint_multMat";
	rename -uid "D202A3C6-483C-7E2F-149B-7E9EEA80DA75";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_4_outJoint_decMat";
	rename -uid "015CFE5C-4C04-CBA9-477D-C7BB071BCB83";
createNode multMatrix -n "r_feather_2_5_mainGroup_multMat";
	rename -uid "3F45F52B-4285-9153-69B3-EE9CAE57DC03";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_5_outJoint_multMat";
	rename -uid "BE2ED3C8-4190-FF8F-DCC6-98984CAEAB8D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_5_outJoint_decMat";
	rename -uid "725975A3-4E99-4508-63E6-868B9ADAEB9D";
createNode objectSet -n "r_feather_2_moduleControlSet";
	rename -uid "BB32A705-4807-DD96-CF3D-EBB5FAFCCA31";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_3_1_group_multMat";
	rename -uid "3E8338A6-4A21-3ACC-D71D-31BDC7B4FCF3";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_3_1_outJoint_multMat";
	rename -uid "C9102F3B-41D4-AC24-62FE-DBB3BF25634A";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_3_1_outJoint_decMat";
	rename -uid "CD33676D-46C9-EE6B-858D-CE93C24AEA0B";
createNode multMatrix -n "r_feather_3_2_mainGroup_multMat";
	rename -uid "C2132E0D-4378-9F83-2872-428231419858";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_2_outJoint_multMat";
	rename -uid "0FE22FEB-468A-41D6-CFEE-D9A3BBBDD173";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_2_outJoint_decMat";
	rename -uid "AB6A3750-4C30-DFCA-69AF-2E9039648957";
createNode multMatrix -n "r_feather_3_3_mainGroup_multMat";
	rename -uid "EF4C8DEC-4941-72C2-D084-BBAB4A02FF4F";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_3_outJoint_multMat";
	rename -uid "83566BD4-4CA9-6816-E808-AEB5A38D744B";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_3_outJoint_decMat";
	rename -uid "8DE708C3-4C71-F363-239D-72B9FD922215";
createNode multMatrix -n "r_feather_3_4_mainGroup_multMat";
	rename -uid "5B83F370-403F-A0E8-67AB-B0B6F957BADC";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_4_outJoint_multMat";
	rename -uid "34F7DCFD-4329-12C1-5FCC-83BD865C138A";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_4_outJoint_decMat";
	rename -uid "C46BAE74-4831-FBD0-C536-DC8FA2405DFE";
createNode multMatrix -n "r_feather_3_5_mainGroup_multMat";
	rename -uid "0A92D9DB-4C3E-4A05-EF9F-0D8705307126";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_5_outJoint_multMat";
	rename -uid "0AE3B553-4854-32D4-2048-22B820FD84CE";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_5_outJoint_decMat";
	rename -uid "CAA28FB9-4AF9-2479-0183-038CBD62913E";
createNode objectSet -n "r_feather_3_moduleControlSet";
	rename -uid "6C3667F1-4E5F-3A16-23CE-0DA07A70658A";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_4_1_group_multMat";
	rename -uid "F841420B-4E86-96C0-8B66-32A3DA45E2DF";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_4_1_outJoint_multMat";
	rename -uid "4FDD8F53-4168-3582-EC1B-47BF7394D9F5";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_4_1_outJoint_decMat";
	rename -uid "876156E0-4ECC-697C-001E-7080CD21F394";
createNode multMatrix -n "r_feather_4_2_mainGroup_multMat";
	rename -uid "C9CD6F93-4AD3-636B-46FD-5787E49805E1";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_2_outJoint_multMat";
	rename -uid "3FC4810E-4665-97C1-EBFB-42846984BF77";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_2_outJoint_decMat";
	rename -uid "7D083E8A-4E2A-39AA-3201-7B8DAD8CCA73";
createNode multMatrix -n "r_feather_4_3_mainGroup_multMat";
	rename -uid "34BB0D16-4CD7-E987-F402-4FBB5BF7758E";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_3_outJoint_multMat";
	rename -uid "EF4EF828-42B8-94BD-5854-3DB7ABC9E9DC";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_3_outJoint_decMat";
	rename -uid "571ED8BA-41F4-0BEE-53C4-868302214186";
createNode multMatrix -n "r_feather_4_4_mainGroup_multMat";
	rename -uid "4C678488-46ED-9703-E0A0-81A96B7709FF";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_4_outJoint_multMat";
	rename -uid "5C6F7199-4351-D844-74D9-D196E4AB16D7";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_4_outJoint_decMat";
	rename -uid "691F866E-46E5-F974-E484-2BB1B6C428C3";
createNode multMatrix -n "r_feather_4_5_mainGroup_multMat";
	rename -uid "349EA26B-4DBA-7C7C-949F-B2B2DC9490F6";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_5_outJoint_multMat";
	rename -uid "F7E15F63-4FD0-920C-3FE6-A495622B8DE2";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_5_outJoint_decMat";
	rename -uid "739ED238-4718-2084-7237-ED97D3EA6782";
createNode objectSet -n "r_feather_4_moduleControlSet";
	rename -uid "38B3A80C-45C3-5E4C-5461-EBAA61376749";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_5_1_group_multMat";
	rename -uid "73800110-424A-F1C4-B829-3181F01F2924";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_5_1_outJoint_multMat";
	rename -uid "74AA14F7-46A9-D911-AAB4-569FD96C80C4";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_5_1_outJoint_decMat";
	rename -uid "5C9A2FA3-4858-B165-1E7A-6D8FA4542F27";
createNode multMatrix -n "r_feather_5_2_mainGroup_multMat";
	rename -uid "BFA035C2-4CD0-0BD0-FFD2-A0936515AC2C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_2_outJoint_multMat";
	rename -uid "2C4DA351-4D02-4D46-8999-689399EFA6CE";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_2_outJoint_decMat";
	rename -uid "F4529012-4B35-8463-CF2B-FFA4FC9A3490";
createNode multMatrix -n "r_feather_5_3_mainGroup_multMat";
	rename -uid "B48B663D-4C9B-915B-A551-74AEAAB9CFA7";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_3_outJoint_multMat";
	rename -uid "3309F7CF-436A-3DED-7FF8-43BFD6A9A297";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_3_outJoint_decMat";
	rename -uid "59683138-4B75-E5BA-96DA-B5A914C9B4BE";
createNode multMatrix -n "r_feather_5_4_mainGroup_multMat";
	rename -uid "5296E13A-4C83-977A-2031-D697099A9B70";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_4_outJoint_multMat";
	rename -uid "4B5D9A32-410E-7CBA-2513-FCBA5362DEF2";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_4_outJoint_decMat";
	rename -uid "CE1D7480-46FA-A066-6694-6B8DE2233A63";
createNode multMatrix -n "r_feather_5_5_mainGroup_multMat";
	rename -uid "CC720283-4049-B7FF-3611-7AB1A57E6E6D";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_5_outJoint_multMat";
	rename -uid "D734F1AE-43E4-5E57-C61F-81902EC7A73C";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_5_outJoint_decMat";
	rename -uid "CBF6EBF1-4E12-BDE0-B54F-2EA0A1E240C2";
createNode objectSet -n "r_feather_5_moduleControlSet";
	rename -uid "FBAEE987-45EC-2C82-6CB3-D9831EAF9C75";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "main_1_group_multMat";
	rename -uid "969C23F4-40A4-7A33-7130-B882DDACE034";
	setAttr -s 5 ".i";
createNode multMatrix -n "main_2_group_multMat";
	rename -uid "95EADD0F-4B0F-CD43-BD72-019593D4890D";
	setAttr -s 8 ".i";
createNode multMatrix -n "main_3_group_multMat";
	rename -uid "901AFBEE-4CF4-AB75-1C6D-119A350AC578";
	setAttr -s 11 ".i";
createNode multMatrix -n "main_4_group_multMat";
	rename -uid "8B6C1AF1-49A9-E97E-0969-8DAD0D7745CA";
	setAttr -s 14 ".i";
createNode multMatrix -n "feathers_group_multMat";
	rename -uid "EC918001-4396-2948-731E-C4A0C43352C1";
	setAttr -s 2 ".i";
createNode clamp -n "feathers_uc_clamp";
	rename -uid "604CFB7E-4E2E-EA5C-2152-0197E1CAD29D";
	setAttr ".mn" -type "float3" -1 -1 -1 ;
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "feathers_2u_multiplyDivide";
	rename -uid "43A52DCB-48C8-3AC8-CE4A-669BF2403229";
	setAttr ".i2" -type "float3" 2 2 2 ;
createNode plusMinusAverage -n "feathers_w_plusMinusAverage";
	rename -uid "40319CC0-4F06-492B-7B0D-B9A36A42E7B8";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "feathers_s_multiplyDivide";
	rename -uid "752EADBB-4A27-D5D3-321F-A4874327D8A6";
createNode multiplyDivide -n "feathers_dip2m_multiplyDivide";
	rename -uid "3773CF5D-4BF6-E63F-F2E7-82BDB9888B57";
	setAttr ".i2" -type "float3" 2 1 1 ;
createNode plusMinusAverage -n "feathers_dipW_plusMinusAverage";
	rename -uid "66423AE9-4079-D82B-992B-D2A9564D9F3A";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "feathers_dipS_multiplyDivide";
	rename -uid "1ECDADA8-4734-87BD-211F-4EAA01741DA1";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
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
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 8 ".u";
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
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "cluster4GroupId.id" "mainPoserShape.iog.og[1].gid";
connectAttr "cluster4Set.mwc" "mainPoserShape.iog.og[1].gco";
connectAttr "groupId42.id" "mainPoserShape.iog.og[2].gid";
connectAttr "tweakSet24.mwc" "mainPoserShape.iog.og[2].gco";
connectAttr "mainPoser_clusterHandleCluster1.og[0]" "mainPoserShape.cr";
connectAttr "tweak24.pl[0].cp[0]" "mainPoserShape.twl";
connectAttr "size_multiplyDivide.ox" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide.ox" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide.ox" "mainPoser_clusterHandle.sz";
connectAttr "makeNurbSphere.os" "root_poserShape.cr";
connectAttr "m_feather_mainPoser.sx" "m_feather_mainPoser.sy" -l on;
connectAttr "m_feather_mainPoser.sx" "m_feather_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "m_feather_mainPoser.globalSize";
connectAttr "m_feather_cluster4GroupId.id" "m_feather_mainPoserShape.iog.og[1].gid"
		;
connectAttr "m_feather_cluster4Set.mwc" "m_feather_mainPoserShape.iog.og[1].gco"
		;
connectAttr "m_feather_groupId42.id" "m_feather_mainPoserShape.iog.og[2].gid";
connectAttr "m_feather_tweakSet24.mwc" "m_feather_mainPoserShape.iog.og[2].gco";
connectAttr "m_feather_mainPoser_clusterHandleCluster.og[0]" "m_feather_mainPoserShape.cr"
		;
connectAttr "m_feather_tweak24.pl[0].cp[0]" "m_feather_mainPoserShape.twl";
connectAttr "m_feather_mainPoser_size_multiplyDivide.ox" "m_feather_mainPoser_clusterHandle.sx"
		;
connectAttr "m_feather_mainPoser_size_multiplyDivide.ox" "m_feather_mainPoser_clusterHandle.sy"
		;
connectAttr "m_feather_mainPoser_size_multiplyDivide.ox" "m_feather_mainPoser_clusterHandle.sz"
		;
connectAttr "m_feather_1_makeNurbSphere.os" "m_feather_1_poserNurbsShape.cr";
connectAttr "m_feather_1_poserOrient_aimConstraint1.crx" "m_feather_1_poserOrient.rx"
		;
connectAttr "m_feather_1_poserOrient_aimConstraint1.cry" "m_feather_1_poserOrient.ry"
		;
connectAttr "m_feather_1_poserOrient_aimConstraint1.crz" "m_feather_1_poserOrient.rz"
		;
connectAttr "m_feather_1_poserOrient.pim" "m_feather_1_poserOrient_aimConstraint1.cpim"
		;
connectAttr "m_feather_1_poserOrient.t" "m_feather_1_poserOrient_aimConstraint1.ct"
		;
connectAttr "m_feather_1_poserOrient.rp" "m_feather_1_poserOrient_aimConstraint1.crp"
		;
connectAttr "m_feather_1_poserOrient.rpt" "m_feather_1_poserOrient_aimConstraint1.crt"
		;
connectAttr "m_feather_1_poserOrient.ro" "m_feather_1_poserOrient_aimConstraint1.cro"
		;
connectAttr "m_feather_2_poser.t" "m_feather_1_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "m_feather_2_poser.rp" "m_feather_1_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "m_feather_2_poser.rpt" "m_feather_1_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "m_feather_2_poser.pm" "m_feather_1_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "m_feather_1_poserOrient_aimConstraint1.w0" "m_feather_1_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_mainPoser.wm" "m_feather_1_poserOrient_aimConstraint1.wum"
		;
connectAttr "m_feather_2_makeNurbSphere.os" "m_feather_2_poserNurbsShape.cr";
connectAttr "m_feather_2_poserOrient_aimConstraint1.crx" "m_feather_2_poserOrient.rx"
		;
connectAttr "m_feather_2_poserOrient_aimConstraint1.cry" "m_feather_2_poserOrient.ry"
		;
connectAttr "m_feather_2_poserOrient_aimConstraint1.crz" "m_feather_2_poserOrient.rz"
		;
connectAttr "m_feather_2_poserOrient.pim" "m_feather_2_poserOrient_aimConstraint1.cpim"
		;
connectAttr "m_feather_2_poserOrient.t" "m_feather_2_poserOrient_aimConstraint1.ct"
		;
connectAttr "m_feather_2_poserOrient.rp" "m_feather_2_poserOrient_aimConstraint1.crp"
		;
connectAttr "m_feather_2_poserOrient.rpt" "m_feather_2_poserOrient_aimConstraint1.crt"
		;
connectAttr "m_feather_2_poserOrient.ro" "m_feather_2_poserOrient_aimConstraint1.cro"
		;
connectAttr "m_feather_3_poser.t" "m_feather_2_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "m_feather_3_poser.rp" "m_feather_2_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "m_feather_3_poser.rpt" "m_feather_2_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "m_feather_3_poser.pm" "m_feather_2_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "m_feather_2_poserOrient_aimConstraint1.w0" "m_feather_2_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_mainPoser.wm" "m_feather_2_poserOrient_aimConstraint1.wum"
		;
connectAttr "m_feather_3_makeNurbSphere.os" "m_feather_3_poserNurbsShape.cr";
connectAttr "m_feather_3_poserOrient_aimConstraint1.crx" "m_feather_3_poserOrient.rx"
		;
connectAttr "m_feather_3_poserOrient_aimConstraint1.cry" "m_feather_3_poserOrient.ry"
		;
connectAttr "m_feather_3_poserOrient_aimConstraint1.crz" "m_feather_3_poserOrient.rz"
		;
connectAttr "m_feather_3_poserOrient.pim" "m_feather_3_poserOrient_aimConstraint1.cpim"
		;
connectAttr "m_feather_3_poserOrient.t" "m_feather_3_poserOrient_aimConstraint1.ct"
		;
connectAttr "m_feather_3_poserOrient.rp" "m_feather_3_poserOrient_aimConstraint1.crp"
		;
connectAttr "m_feather_3_poserOrient.rpt" "m_feather_3_poserOrient_aimConstraint1.crt"
		;
connectAttr "m_feather_3_poserOrient.ro" "m_feather_3_poserOrient_aimConstraint1.cro"
		;
connectAttr "m_feather_4_poser.t" "m_feather_3_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "m_feather_4_poser.rp" "m_feather_3_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "m_feather_4_poser.rpt" "m_feather_3_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "m_feather_4_poser.pm" "m_feather_3_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "m_feather_3_poserOrient_aimConstraint1.w0" "m_feather_3_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_mainPoser.wm" "m_feather_3_poserOrient_aimConstraint1.wum"
		;
connectAttr "m_feather_4_makeNurbSphere.os" "m_feather_4_poserNurbsShape.cr";
connectAttr "m_feather_4_poserOrient_aimConstraint1.crx" "m_feather_4_poserOrient.rx"
		;
connectAttr "m_feather_4_poserOrient_aimConstraint1.cry" "m_feather_4_poserOrient.ry"
		;
connectAttr "m_feather_4_poserOrient_aimConstraint1.crz" "m_feather_4_poserOrient.rz"
		;
connectAttr "m_feather_4_poserOrient.pim" "m_feather_4_poserOrient_aimConstraint1.cpim"
		;
connectAttr "m_feather_4_poserOrient.t" "m_feather_4_poserOrient_aimConstraint1.ct"
		;
connectAttr "m_feather_4_poserOrient.rp" "m_feather_4_poserOrient_aimConstraint1.crp"
		;
connectAttr "m_feather_4_poserOrient.rpt" "m_feather_4_poserOrient_aimConstraint1.crt"
		;
connectAttr "m_feather_4_poserOrient.ro" "m_feather_4_poserOrient_aimConstraint1.cro"
		;
connectAttr "m_feather_5_poser.t" "m_feather_4_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "m_feather_5_poser.rp" "m_feather_4_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "m_feather_5_poser.rpt" "m_feather_4_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "m_feather_5_poser.pm" "m_feather_4_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "m_feather_4_poserOrient_aimConstraint1.w0" "m_feather_4_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_mainPoser.wm" "m_feather_4_poserOrient_aimConstraint1.wum"
		;
connectAttr "m_feather_5_makeNurbSphere.os" "m_feather_5_poserNurbsShape.cr";
connectAttr "m_feather_5_poserOrient_aimConstraint1.crx" "m_feather_5_poserOrient.rx"
		;
connectAttr "m_feather_5_poserOrient_aimConstraint1.cry" "m_feather_5_poserOrient.ry"
		;
connectAttr "m_feather_5_poserOrient_aimConstraint1.crz" "m_feather_5_poserOrient.rz"
		;
connectAttr "m_feather_5_poserOrient.pim" "m_feather_5_poserOrient_aimConstraint1.cpim"
		;
connectAttr "m_feather_5_poserOrient.t" "m_feather_5_poserOrient_aimConstraint1.ct"
		;
connectAttr "m_feather_5_poserOrient.rp" "m_feather_5_poserOrient_aimConstraint1.crp"
		;
connectAttr "m_feather_5_poserOrient.rpt" "m_feather_5_poserOrient_aimConstraint1.crt"
		;
connectAttr "m_feather_5_poserOrient.ro" "m_feather_5_poserOrient_aimConstraint1.cro"
		;
connectAttr "m_feather_end_poser.t" "m_feather_5_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "m_feather_end_poser.rp" "m_feather_5_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "m_feather_end_poser.rpt" "m_feather_5_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "m_feather_end_poser.pm" "m_feather_5_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "m_feather_5_poserOrient_aimConstraint1.w0" "m_feather_5_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_mainPoser.wm" "m_feather_5_poserOrient_aimConstraint1.wum"
		;
connectAttr "m_feather_end_makeNurbSphere.os" "m_feather_end_poserNurbsShape.cr"
		;
connectAttr "m_feather_end_poserOrient_aimConstraint1.crx" "m_feather_end_poserOrient.rx"
		;
connectAttr "m_feather_end_poserOrient_aimConstraint1.cry" "m_feather_end_poserOrient.ry"
		;
connectAttr "m_feather_end_poserOrient_aimConstraint1.crz" "m_feather_end_poserOrient.rz"
		;
connectAttr "m_feather_end_poserOrient.pim" "m_feather_end_poserOrient_aimConstraint1.cpim"
		;
connectAttr "m_feather_end_poserOrient.t" "m_feather_end_poserOrient_aimConstraint1.ct"
		;
connectAttr "m_feather_end_poserOrient.rp" "m_feather_end_poserOrient_aimConstraint1.crp"
		;
connectAttr "m_feather_end_poserOrient.rpt" "m_feather_end_poserOrient_aimConstraint1.crt"
		;
connectAttr "m_feather_end_poserOrient.ro" "m_feather_end_poserOrient_aimConstraint1.cro"
		;
connectAttr "m_feather_5_poser.t" "m_feather_end_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "m_feather_5_poser.rp" "m_feather_end_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "m_feather_5_poser.rpt" "m_feather_end_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "m_feather_5_poser.pm" "m_feather_end_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "m_feather_end_poserOrient_aimConstraint1.w0" "m_feather_end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_mainPoser.wm" "m_feather_end_poserOrient_aimConstraint1.wum"
		;
connectAttr "main_1_makeNurbSphere.os" "main_1_poserNurbsShape.cr";
connectAttr "main_1_poserOrient_orientConstraint1.crx" "main_1_poserOrient.rx";
connectAttr "main_1_poserOrient_orientConstraint1.cry" "main_1_poserOrient.ry";
connectAttr "main_1_poserOrient_orientConstraint1.crz" "main_1_poserOrient.rz";
connectAttr "main_1_poserOrient.ro" "main_1_poserOrient_orientConstraint1.cro";
connectAttr "main_1_poserOrient.pim" "main_1_poserOrient_orientConstraint1.cpim"
		;
connectAttr "m_feather_2_initLoc.r" "main_1_poserOrient_orientConstraint1.tg[0].tr"
		;
connectAttr "m_feather_2_initLoc.ro" "main_1_poserOrient_orientConstraint1.tg[0].tro"
		;
connectAttr "m_feather_2_initLoc.pm" "main_1_poserOrient_orientConstraint1.tg[0].tpm"
		;
connectAttr "main_1_poserOrient_orientConstraint1.w0" "main_1_poserOrient_orientConstraint1.tg[0].tw"
		;
connectAttr "main_2_makeNurbSphere.os" "main_2_poserNurbsShape.cr";
connectAttr "main_2_poserOrient_orientConstraint1.crx" "main_2_poserOrient.rx";
connectAttr "main_2_poserOrient_orientConstraint1.cry" "main_2_poserOrient.ry";
connectAttr "main_2_poserOrient_orientConstraint1.crz" "main_2_poserOrient.rz";
connectAttr "main_2_poserOrient.ro" "main_2_poserOrient_orientConstraint1.cro";
connectAttr "main_2_poserOrient.pim" "main_2_poserOrient_orientConstraint1.cpim"
		;
connectAttr "m_feather_3_initLoc.r" "main_2_poserOrient_orientConstraint1.tg[0].tr"
		;
connectAttr "m_feather_3_initLoc.ro" "main_2_poserOrient_orientConstraint1.tg[0].tro"
		;
connectAttr "m_feather_3_initLoc.pm" "main_2_poserOrient_orientConstraint1.tg[0].tpm"
		;
connectAttr "main_2_poserOrient_orientConstraint1.w0" "main_2_poserOrient_orientConstraint1.tg[0].tw"
		;
connectAttr "main_3_makeNurbSphere.os" "main_3_poserNurbsShape.cr";
connectAttr "main_3_poserOrient_orientConstraint1.crx" "main_3_poserOrient.rx";
connectAttr "main_3_poserOrient_orientConstraint1.cry" "main_3_poserOrient.ry";
connectAttr "main_3_poserOrient_orientConstraint1.crz" "main_3_poserOrient.rz";
connectAttr "main_3_poserOrient.ro" "main_3_poserOrient_orientConstraint1.cro";
connectAttr "main_3_poserOrient.pim" "main_3_poserOrient_orientConstraint1.cpim"
		;
connectAttr "m_feather_4_initLoc.r" "main_3_poserOrient_orientConstraint1.tg[0].tr"
		;
connectAttr "m_feather_4_initLoc.ro" "main_3_poserOrient_orientConstraint1.tg[0].tro"
		;
connectAttr "m_feather_4_initLoc.pm" "main_3_poserOrient_orientConstraint1.tg[0].tpm"
		;
connectAttr "main_3_poserOrient_orientConstraint1.w0" "main_3_poserOrient_orientConstraint1.tg[0].tw"
		;
connectAttr "main_4_makeNurbSphere.os" "main_4_poserNurbsShape.cr";
connectAttr "main_4_poserOrient_orientConstraint1.crx" "main_4_poserOrient.rx";
connectAttr "main_4_poserOrient_orientConstraint1.cry" "main_4_poserOrient.ry";
connectAttr "main_4_poserOrient_orientConstraint1.crz" "main_4_poserOrient.rz";
connectAttr "main_4_poserOrient.ro" "main_4_poserOrient_orientConstraint1.cro";
connectAttr "main_4_poserOrient.pim" "main_4_poserOrient_orientConstraint1.cpim"
		;
connectAttr "m_feather_5_initLoc.r" "main_4_poserOrient_orientConstraint1.tg[0].tr"
		;
connectAttr "m_feather_5_initLoc.ro" "main_4_poserOrient_orientConstraint1.tg[0].tro"
		;
connectAttr "m_feather_5_initLoc.pm" "main_4_poserOrient_orientConstraint1.tg[0].tpm"
		;
connectAttr "main_4_poserOrient_orientConstraint1.w0" "main_4_poserOrient_orientConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.sx" "l_feather_1_mainPoser.sy" -l on;
connectAttr "l_feather_1_mainPoser.sx" "l_feather_1_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_feather_1_mainPoser.globalSize";
connectAttr "l_feather_1_cluster4GroupId.id" "l_feather_1_mainPoserShape.iog.og[1].gid"
		;
connectAttr "l_feather_1_cluster4Set.mwc" "l_feather_1_mainPoserShape.iog.og[1].gco"
		;
connectAttr "l_feather_1_groupId42.id" "l_feather_1_mainPoserShape.iog.og[2].gid"
		;
connectAttr "l_feather_1_tweakSet24.mwc" "l_feather_1_mainPoserShape.iog.og[2].gco"
		;
connectAttr "l_feather_1_mainPoser_clusterHandleCluster.og[0]" "l_feather_1_mainPoserShape.cr"
		;
connectAttr "l_feather_1_tweak24.pl[0].cp[0]" "l_feather_1_mainPoserShape.twl";
connectAttr "l_feather_1_mainPoser_size_multiplyDivide.ox" "l_feather_1_mainPoser_clusterHandle.sx"
		;
connectAttr "l_feather_1_mainPoser_size_multiplyDivide.ox" "l_feather_1_mainPoser_clusterHandle.sy"
		;
connectAttr "l_feather_1_mainPoser_size_multiplyDivide.ox" "l_feather_1_mainPoser_clusterHandle.sz"
		;
connectAttr "l_feather_1_1_makeNurbSphere.os" "l_feather_1_1_poserNurbsShape.cr"
		;
connectAttr "l_feather_1_1_poserOrient_aimConstraint1.crx" "l_feather_1_1_poserOrient.rx"
		;
connectAttr "l_feather_1_1_poserOrient_aimConstraint1.cry" "l_feather_1_1_poserOrient.ry"
		;
connectAttr "l_feather_1_1_poserOrient_aimConstraint1.crz" "l_feather_1_1_poserOrient.rz"
		;
connectAttr "l_feather_1_1_poserOrient.pim" "l_feather_1_1_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_1_poserOrient.t" "l_feather_1_1_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_1_1_poserOrient.rp" "l_feather_1_1_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_1_1_poserOrient.rpt" "l_feather_1_1_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_1_1_poserOrient.ro" "l_feather_1_1_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_1_2_poser.t" "l_feather_1_1_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_2_poser.rp" "l_feather_1_1_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_2_poser.rpt" "l_feather_1_1_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_2_poser.pm" "l_feather_1_1_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_1_poserOrient_aimConstraint1.w0" "l_feather_1_1_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.wm" "l_feather_1_1_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_1_1_fanLoc_aimConstraint1.crx" "l_feather_1_1_fanLoc.rx";
connectAttr "l_feather_1_1_fanLoc_aimConstraint1.cry" "l_feather_1_1_fanLoc.ry";
connectAttr "l_feather_1_1_fanLoc_aimConstraint1.crz" "l_feather_1_1_fanLoc.rz";
connectAttr "l_feather_1_1_fanLoc.pim" "l_feather_1_1_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_1_fanLoc.t" "l_feather_1_1_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_1_1_fanLoc.rp" "l_feather_1_1_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_1_1_fanLoc.rpt" "l_feather_1_1_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_1_1_fanLoc.ro" "l_feather_1_1_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_1_2_poser.t" "l_feather_1_1_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_2_poser.rp" "l_feather_1_1_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_2_poser.rpt" "l_feather_1_1_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_2_poser.pm" "l_feather_1_1_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_1_fanLoc_aimConstraint1.w0" "l_feather_1_1_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_1_poser.wm" "l_feather_1_1_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_1_2_makeNurbSphere.os" "l_feather_1_2_poserNurbsShape.cr"
		;
connectAttr "l_feather_1_2_poserOrient_aimConstraint1.crx" "l_feather_1_2_poserOrient.rx"
		;
connectAttr "l_feather_1_2_poserOrient_aimConstraint1.cry" "l_feather_1_2_poserOrient.ry"
		;
connectAttr "l_feather_1_2_poserOrient_aimConstraint1.crz" "l_feather_1_2_poserOrient.rz"
		;
connectAttr "l_feather_1_2_poserOrient.pim" "l_feather_1_2_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_2_poserOrient.t" "l_feather_1_2_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_1_2_poserOrient.rp" "l_feather_1_2_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_1_2_poserOrient.rpt" "l_feather_1_2_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_1_2_poserOrient.ro" "l_feather_1_2_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_1_3_poser.t" "l_feather_1_2_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_3_poser.rp" "l_feather_1_2_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_3_poser.rpt" "l_feather_1_2_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_3_poser.pm" "l_feather_1_2_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_2_poserOrient_aimConstraint1.w0" "l_feather_1_2_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.wm" "l_feather_1_2_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_1_2_fanLoc_aimConstraint1.crx" "l_feather_1_2_fanLoc.rx";
connectAttr "l_feather_1_2_fanLoc_aimConstraint1.cry" "l_feather_1_2_fanLoc.ry";
connectAttr "l_feather_1_2_fanLoc_aimConstraint1.crz" "l_feather_1_2_fanLoc.rz";
connectAttr "l_feather_1_2_fanLoc.pim" "l_feather_1_2_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_2_fanLoc.t" "l_feather_1_2_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_1_2_fanLoc.rp" "l_feather_1_2_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_1_2_fanLoc.rpt" "l_feather_1_2_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_1_2_fanLoc.ro" "l_feather_1_2_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_1_3_poser.t" "l_feather_1_2_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_3_poser.rp" "l_feather_1_2_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_3_poser.rpt" "l_feather_1_2_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_3_poser.pm" "l_feather_1_2_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_2_fanLoc_aimConstraint1.w0" "l_feather_1_2_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_2_poser.wm" "l_feather_1_2_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_1_3_makeNurbSphere.os" "l_feather_1_3_poserNurbsShape.cr"
		;
connectAttr "l_feather_1_3_poserOrient_aimConstraint1.crx" "l_feather_1_3_poserOrient.rx"
		;
connectAttr "l_feather_1_3_poserOrient_aimConstraint1.cry" "l_feather_1_3_poserOrient.ry"
		;
connectAttr "l_feather_1_3_poserOrient_aimConstraint1.crz" "l_feather_1_3_poserOrient.rz"
		;
connectAttr "l_feather_1_3_poserOrient.pim" "l_feather_1_3_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_3_poserOrient.t" "l_feather_1_3_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_1_3_poserOrient.rp" "l_feather_1_3_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_1_3_poserOrient.rpt" "l_feather_1_3_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_1_3_poserOrient.ro" "l_feather_1_3_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_1_4_poser.t" "l_feather_1_3_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_4_poser.rp" "l_feather_1_3_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_4_poser.rpt" "l_feather_1_3_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_4_poser.pm" "l_feather_1_3_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_3_poserOrient_aimConstraint1.w0" "l_feather_1_3_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.wm" "l_feather_1_3_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_1_3_fanLoc_aimConstraint1.crx" "l_feather_1_3_fanLoc.rx";
connectAttr "l_feather_1_3_fanLoc_aimConstraint1.cry" "l_feather_1_3_fanLoc.ry";
connectAttr "l_feather_1_3_fanLoc_aimConstraint1.crz" "l_feather_1_3_fanLoc.rz";
connectAttr "l_feather_1_3_fanLoc.pim" "l_feather_1_3_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_3_fanLoc.t" "l_feather_1_3_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_1_3_fanLoc.rp" "l_feather_1_3_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_1_3_fanLoc.rpt" "l_feather_1_3_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_1_3_fanLoc.ro" "l_feather_1_3_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_1_4_poser.t" "l_feather_1_3_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_4_poser.rp" "l_feather_1_3_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_4_poser.rpt" "l_feather_1_3_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_4_poser.pm" "l_feather_1_3_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_3_fanLoc_aimConstraint1.w0" "l_feather_1_3_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_3_poser.wm" "l_feather_1_3_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_1_4_makeNurbSphere.os" "l_feather_1_4_poserNurbsShape.cr"
		;
connectAttr "l_feather_1_4_poserOrient_aimConstraint1.crx" "l_feather_1_4_poserOrient.rx"
		;
connectAttr "l_feather_1_4_poserOrient_aimConstraint1.cry" "l_feather_1_4_poserOrient.ry"
		;
connectAttr "l_feather_1_4_poserOrient_aimConstraint1.crz" "l_feather_1_4_poserOrient.rz"
		;
connectAttr "l_feather_1_4_poserOrient.pim" "l_feather_1_4_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_4_poserOrient.t" "l_feather_1_4_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_1_4_poserOrient.rp" "l_feather_1_4_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_1_4_poserOrient.rpt" "l_feather_1_4_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_1_4_poserOrient.ro" "l_feather_1_4_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_1_5_poser.t" "l_feather_1_4_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_5_poser.rp" "l_feather_1_4_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_5_poser.rpt" "l_feather_1_4_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_5_poser.pm" "l_feather_1_4_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_4_poserOrient_aimConstraint1.w0" "l_feather_1_4_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.wm" "l_feather_1_4_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_1_4_fanLoc_aimConstraint1.crx" "l_feather_1_4_fanLoc.rx";
connectAttr "l_feather_1_4_fanLoc_aimConstraint1.cry" "l_feather_1_4_fanLoc.ry";
connectAttr "l_feather_1_4_fanLoc_aimConstraint1.crz" "l_feather_1_4_fanLoc.rz";
connectAttr "l_feather_1_4_fanLoc.pim" "l_feather_1_4_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_4_fanLoc.t" "l_feather_1_4_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_1_4_fanLoc.rp" "l_feather_1_4_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_1_4_fanLoc.rpt" "l_feather_1_4_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_1_4_fanLoc.ro" "l_feather_1_4_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_1_5_poser.t" "l_feather_1_4_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_5_poser.rp" "l_feather_1_4_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_5_poser.rpt" "l_feather_1_4_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_5_poser.pm" "l_feather_1_4_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_4_fanLoc_aimConstraint1.w0" "l_feather_1_4_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_4_poser.wm" "l_feather_1_4_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_1_5_makeNurbSphere.os" "l_feather_1_5_poserNurbsShape.cr"
		;
connectAttr "l_feather_1_5_poserOrient_aimConstraint1.crx" "l_feather_1_5_poserOrient.rx"
		;
connectAttr "l_feather_1_5_poserOrient_aimConstraint1.cry" "l_feather_1_5_poserOrient.ry"
		;
connectAttr "l_feather_1_5_poserOrient_aimConstraint1.crz" "l_feather_1_5_poserOrient.rz"
		;
connectAttr "l_feather_1_5_poserOrient.pim" "l_feather_1_5_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_5_poserOrient.t" "l_feather_1_5_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_1_5_poserOrient.rp" "l_feather_1_5_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_1_5_poserOrient.rpt" "l_feather_1_5_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_1_5_poserOrient.ro" "l_feather_1_5_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_1_end_poser.t" "l_feather_1_5_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_end_poser.rp" "l_feather_1_5_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_end_poser.rpt" "l_feather_1_5_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_end_poser.pm" "l_feather_1_5_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_5_poserOrient_aimConstraint1.w0" "l_feather_1_5_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.wm" "l_feather_1_5_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_1_5_fanLoc_aimConstraint1.crx" "l_feather_1_5_fanLoc.rx";
connectAttr "l_feather_1_5_fanLoc_aimConstraint1.cry" "l_feather_1_5_fanLoc.ry";
connectAttr "l_feather_1_5_fanLoc_aimConstraint1.crz" "l_feather_1_5_fanLoc.rz";
connectAttr "l_feather_1_5_fanLoc.pim" "l_feather_1_5_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_5_fanLoc.t" "l_feather_1_5_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_1_5_fanLoc.rp" "l_feather_1_5_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_1_5_fanLoc.rpt" "l_feather_1_5_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_1_5_fanLoc.ro" "l_feather_1_5_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_1_end_poser.t" "l_feather_1_5_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_end_poser.rp" "l_feather_1_5_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_end_poser.rpt" "l_feather_1_5_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_end_poser.pm" "l_feather_1_5_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_5_fanLoc_aimConstraint1.w0" "l_feather_1_5_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_5_poser.wm" "l_feather_1_5_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_1_end_makeNurbSphere.os" "l_feather_1_end_poserNurbsShape.cr"
		;
connectAttr "l_feather_1_end_poserOrient_aimConstraint1.crx" "l_feather_1_end_poserOrient.rx"
		;
connectAttr "l_feather_1_end_poserOrient_aimConstraint1.cry" "l_feather_1_end_poserOrient.ry"
		;
connectAttr "l_feather_1_end_poserOrient_aimConstraint1.crz" "l_feather_1_end_poserOrient.rz"
		;
connectAttr "l_feather_1_end_poserOrient.pim" "l_feather_1_end_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_end_poserOrient.t" "l_feather_1_end_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_1_end_poserOrient.rp" "l_feather_1_end_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_1_end_poserOrient.rpt" "l_feather_1_end_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_1_end_poserOrient.ro" "l_feather_1_end_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_1_5_poser.t" "l_feather_1_end_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_5_poser.rp" "l_feather_1_end_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_5_poser.rpt" "l_feather_1_end_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_5_poser.pm" "l_feather_1_end_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_end_poserOrient_aimConstraint1.w0" "l_feather_1_end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_1_mainPoser.wm" "l_feather_1_end_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_1_end_fanLoc_aimConstraint1.crx" "l_feather_1_end_fanLoc.rx"
		;
connectAttr "l_feather_1_end_fanLoc_aimConstraint1.cry" "l_feather_1_end_fanLoc.ry"
		;
connectAttr "l_feather_1_end_fanLoc_aimConstraint1.crz" "l_feather_1_end_fanLoc.rz"
		;
connectAttr "l_feather_1_end_fanLoc.pim" "l_feather_1_end_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_1_end_fanLoc.t" "l_feather_1_end_fanLoc_aimConstraint1.ct"
		;
connectAttr "l_feather_1_end_fanLoc.rp" "l_feather_1_end_fanLoc_aimConstraint1.crp"
		;
connectAttr "l_feather_1_end_fanLoc.rpt" "l_feather_1_end_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_1_end_fanLoc.ro" "l_feather_1_end_fanLoc_aimConstraint1.cro"
		;
connectAttr "l_feather_1_5_poser.t" "l_feather_1_end_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_1_5_poser.rp" "l_feather_1_end_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_1_5_poser.rpt" "l_feather_1_end_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_1_5_poser.pm" "l_feather_1_end_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_1_end_fanLoc_aimConstraint1.w0" "l_feather_1_end_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_end_poser.wm" "l_feather_1_end_fanLoc_aimConstraint1.wum"
		;
connectAttr "l_feather_2_mainPoser.sx" "l_feather_2_mainPoser.sy" -l on;
connectAttr "l_feather_2_mainPoser.sx" "l_feather_2_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_feather_2_mainPoser.globalSize";
connectAttr "l_feather_2_cluster4GroupId.id" "l_feather_2_mainPoserShape.iog.og[1].gid"
		;
connectAttr "l_feather_2_cluster4Set.mwc" "l_feather_2_mainPoserShape.iog.og[1].gco"
		;
connectAttr "l_feather_2_groupId42.id" "l_feather_2_mainPoserShape.iog.og[2].gid"
		;
connectAttr "l_feather_2_tweakSet24.mwc" "l_feather_2_mainPoserShape.iog.og[2].gco"
		;
connectAttr "l_feather_2_mainPoser_clusterHandleCluster.og[0]" "l_feather_2_mainPoserShape.cr"
		;
connectAttr "l_feather_2_tweak24.pl[0].cp[0]" "l_feather_2_mainPoserShape.twl";
connectAttr "l_feather_2_mainPoser_size_multiplyDivide.ox" "l_feather_2_mainPoser_clusterHandle.sx"
		;
connectAttr "l_feather_2_mainPoser_size_multiplyDivide.ox" "l_feather_2_mainPoser_clusterHandle.sy"
		;
connectAttr "l_feather_2_mainPoser_size_multiplyDivide.ox" "l_feather_2_mainPoser_clusterHandle.sz"
		;
connectAttr "l_feather_2_1_makeNurbSphere.os" "l_feather_2_1_poserNurbsShape.cr"
		;
connectAttr "l_feather_2_1_poserOrient_aimConstraint1.crx" "l_feather_2_1_poserOrient.rx"
		;
connectAttr "l_feather_2_1_poserOrient_aimConstraint1.cry" "l_feather_2_1_poserOrient.ry"
		;
connectAttr "l_feather_2_1_poserOrient_aimConstraint1.crz" "l_feather_2_1_poserOrient.rz"
		;
connectAttr "l_feather_2_1_poserOrient.pim" "l_feather_2_1_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_1_poserOrient.t" "l_feather_2_1_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_2_1_poserOrient.rp" "l_feather_2_1_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_2_1_poserOrient.rpt" "l_feather_2_1_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_2_1_poserOrient.ro" "l_feather_2_1_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_2_2_poser.t" "l_feather_2_1_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_2_poser.rp" "l_feather_2_1_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_2_poser.rpt" "l_feather_2_1_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_2_poser.pm" "l_feather_2_1_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_1_poserOrient_aimConstraint1.w0" "l_feather_2_1_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_2_mainPoser.wm" "l_feather_2_1_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_2_1_fanLoc_aimConstraint1.crx" "l_feather_2_1_fanLoc.rx";
connectAttr "l_feather_2_1_fanLoc_aimConstraint1.cry" "l_feather_2_1_fanLoc.ry";
connectAttr "l_feather_2_1_fanLoc_aimConstraint1.crz" "l_feather_2_1_fanLoc.rz";
connectAttr "l_feather_2_1_fanLoc.pim" "l_feather_2_1_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_1_fanLoc.t" "l_feather_2_1_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_2_1_fanLoc.rp" "l_feather_2_1_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_2_1_fanLoc.rpt" "l_feather_2_1_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_2_1_fanLoc.ro" "l_feather_2_1_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_2_2_poser.t" "l_feather_2_1_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_2_poser.rp" "l_feather_2_1_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_2_poser.rpt" "l_feather_2_1_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_2_poser.pm" "l_feather_2_1_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_1_fanLoc_aimConstraint1.w0" "l_feather_2_1_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_1_poser.wm" "l_feather_2_1_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_2_2_makeNurbSphere.os" "l_feather_2_2_poserNurbsShape.cr"
		;
connectAttr "l_feather_2_2_poserOrient_aimConstraint1.crx" "l_feather_2_2_poserOrient.rx"
		;
connectAttr "l_feather_2_2_poserOrient_aimConstraint1.cry" "l_feather_2_2_poserOrient.ry"
		;
connectAttr "l_feather_2_2_poserOrient_aimConstraint1.crz" "l_feather_2_2_poserOrient.rz"
		;
connectAttr "l_feather_2_2_poserOrient.pim" "l_feather_2_2_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_2_poserOrient.t" "l_feather_2_2_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_2_2_poserOrient.rp" "l_feather_2_2_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_2_2_poserOrient.rpt" "l_feather_2_2_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_2_2_poserOrient.ro" "l_feather_2_2_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_2_3_poser.t" "l_feather_2_2_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_3_poser.rp" "l_feather_2_2_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_3_poser.rpt" "l_feather_2_2_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_3_poser.pm" "l_feather_2_2_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_2_poserOrient_aimConstraint1.w0" "l_feather_2_2_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_2_mainPoser.wm" "l_feather_2_2_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_2_2_fanLoc_aimConstraint1.crx" "l_feather_2_2_fanLoc.rx";
connectAttr "l_feather_2_2_fanLoc_aimConstraint1.cry" "l_feather_2_2_fanLoc.ry";
connectAttr "l_feather_2_2_fanLoc_aimConstraint1.crz" "l_feather_2_2_fanLoc.rz";
connectAttr "l_feather_2_2_fanLoc.pim" "l_feather_2_2_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_2_fanLoc.t" "l_feather_2_2_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_2_2_fanLoc.rp" "l_feather_2_2_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_2_2_fanLoc.rpt" "l_feather_2_2_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_2_2_fanLoc.ro" "l_feather_2_2_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_2_3_poser.t" "l_feather_2_2_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_3_poser.rp" "l_feather_2_2_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_3_poser.rpt" "l_feather_2_2_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_3_poser.pm" "l_feather_2_2_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_2_fanLoc_aimConstraint1.w0" "l_feather_2_2_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_2_poser.wm" "l_feather_2_2_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_2_3_makeNurbSphere.os" "l_feather_2_3_poserNurbsShape.cr"
		;
connectAttr "l_feather_2_3_poserOrient_aimConstraint1.crx" "l_feather_2_3_poserOrient.rx"
		;
connectAttr "l_feather_2_3_poserOrient_aimConstraint1.cry" "l_feather_2_3_poserOrient.ry"
		;
connectAttr "l_feather_2_3_poserOrient_aimConstraint1.crz" "l_feather_2_3_poserOrient.rz"
		;
connectAttr "l_feather_2_3_poserOrient.pim" "l_feather_2_3_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_3_poserOrient.t" "l_feather_2_3_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_2_3_poserOrient.rp" "l_feather_2_3_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_2_3_poserOrient.rpt" "l_feather_2_3_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_2_3_poserOrient.ro" "l_feather_2_3_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_2_4_poser.t" "l_feather_2_3_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_4_poser.rp" "l_feather_2_3_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_4_poser.rpt" "l_feather_2_3_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_4_poser.pm" "l_feather_2_3_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_3_poserOrient_aimConstraint1.w0" "l_feather_2_3_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_2_mainPoser.wm" "l_feather_2_3_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_2_3_fanLoc_aimConstraint1.crx" "l_feather_2_3_fanLoc.rx";
connectAttr "l_feather_2_3_fanLoc_aimConstraint1.cry" "l_feather_2_3_fanLoc.ry";
connectAttr "l_feather_2_3_fanLoc_aimConstraint1.crz" "l_feather_2_3_fanLoc.rz";
connectAttr "l_feather_2_3_fanLoc.pim" "l_feather_2_3_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_3_fanLoc.t" "l_feather_2_3_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_2_3_fanLoc.rp" "l_feather_2_3_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_2_3_fanLoc.rpt" "l_feather_2_3_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_2_3_fanLoc.ro" "l_feather_2_3_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_2_4_poser.t" "l_feather_2_3_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_4_poser.rp" "l_feather_2_3_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_4_poser.rpt" "l_feather_2_3_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_4_poser.pm" "l_feather_2_3_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_3_fanLoc_aimConstraint1.w0" "l_feather_2_3_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_3_poser.wm" "l_feather_2_3_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_2_4_makeNurbSphere.os" "l_feather_2_4_poserNurbsShape.cr"
		;
connectAttr "l_feather_2_4_poserOrient_aimConstraint1.crx" "l_feather_2_4_poserOrient.rx"
		;
connectAttr "l_feather_2_4_poserOrient_aimConstraint1.cry" "l_feather_2_4_poserOrient.ry"
		;
connectAttr "l_feather_2_4_poserOrient_aimConstraint1.crz" "l_feather_2_4_poserOrient.rz"
		;
connectAttr "l_feather_2_4_poserOrient.pim" "l_feather_2_4_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_4_poserOrient.t" "l_feather_2_4_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_2_4_poserOrient.rp" "l_feather_2_4_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_2_4_poserOrient.rpt" "l_feather_2_4_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_2_4_poserOrient.ro" "l_feather_2_4_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_2_5_poser.t" "l_feather_2_4_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_5_poser.rp" "l_feather_2_4_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_5_poser.rpt" "l_feather_2_4_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_5_poser.pm" "l_feather_2_4_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_4_poserOrient_aimConstraint1.w0" "l_feather_2_4_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_2_mainPoser.wm" "l_feather_2_4_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_2_4_fanLoc_aimConstraint1.crx" "l_feather_2_4_fanLoc.rx";
connectAttr "l_feather_2_4_fanLoc_aimConstraint1.cry" "l_feather_2_4_fanLoc.ry";
connectAttr "l_feather_2_4_fanLoc_aimConstraint1.crz" "l_feather_2_4_fanLoc.rz";
connectAttr "l_feather_2_4_fanLoc.pim" "l_feather_2_4_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_4_fanLoc.t" "l_feather_2_4_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_2_4_fanLoc.rp" "l_feather_2_4_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_2_4_fanLoc.rpt" "l_feather_2_4_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_2_4_fanLoc.ro" "l_feather_2_4_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_2_5_poser.t" "l_feather_2_4_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_5_poser.rp" "l_feather_2_4_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_5_poser.rpt" "l_feather_2_4_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_5_poser.pm" "l_feather_2_4_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_4_fanLoc_aimConstraint1.w0" "l_feather_2_4_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_4_poser.wm" "l_feather_2_4_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_2_5_makeNurbSphere.os" "l_feather_2_5_poserNurbsShape.cr"
		;
connectAttr "l_feather_2_5_poserOrient_aimConstraint1.crx" "l_feather_2_5_poserOrient.rx"
		;
connectAttr "l_feather_2_5_poserOrient_aimConstraint1.cry" "l_feather_2_5_poserOrient.ry"
		;
connectAttr "l_feather_2_5_poserOrient_aimConstraint1.crz" "l_feather_2_5_poserOrient.rz"
		;
connectAttr "l_feather_2_5_poserOrient.pim" "l_feather_2_5_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_5_poserOrient.t" "l_feather_2_5_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_2_5_poserOrient.rp" "l_feather_2_5_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_2_5_poserOrient.rpt" "l_feather_2_5_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_2_5_poserOrient.ro" "l_feather_2_5_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_2_end_poser.t" "l_feather_2_5_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_end_poser.rp" "l_feather_2_5_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_end_poser.rpt" "l_feather_2_5_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_end_poser.pm" "l_feather_2_5_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_5_poserOrient_aimConstraint1.w0" "l_feather_2_5_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_2_mainPoser.wm" "l_feather_2_5_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_2_5_fanLoc_aimConstraint1.crx" "l_feather_2_5_fanLoc.rx";
connectAttr "l_feather_2_5_fanLoc_aimConstraint1.cry" "l_feather_2_5_fanLoc.ry";
connectAttr "l_feather_2_5_fanLoc_aimConstraint1.crz" "l_feather_2_5_fanLoc.rz";
connectAttr "l_feather_2_5_fanLoc.pim" "l_feather_2_5_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_5_fanLoc.t" "l_feather_2_5_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_2_5_fanLoc.rp" "l_feather_2_5_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_2_5_fanLoc.rpt" "l_feather_2_5_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_2_5_fanLoc.ro" "l_feather_2_5_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_2_end_poser.t" "l_feather_2_5_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_end_poser.rp" "l_feather_2_5_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_end_poser.rpt" "l_feather_2_5_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_end_poser.pm" "l_feather_2_5_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_5_fanLoc_aimConstraint1.w0" "l_feather_2_5_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_5_poser.wm" "l_feather_2_5_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_2_end_makeNurbSphere.os" "l_feather_2_end_poserNurbsShape.cr"
		;
connectAttr "l_feather_2_end_poserOrient_aimConstraint1.crx" "l_feather_2_end_poserOrient.rx"
		;
connectAttr "l_feather_2_end_poserOrient_aimConstraint1.cry" "l_feather_2_end_poserOrient.ry"
		;
connectAttr "l_feather_2_end_poserOrient_aimConstraint1.crz" "l_feather_2_end_poserOrient.rz"
		;
connectAttr "l_feather_2_end_poserOrient.pim" "l_feather_2_end_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_end_poserOrient.t" "l_feather_2_end_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_2_end_poserOrient.rp" "l_feather_2_end_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_2_end_poserOrient.rpt" "l_feather_2_end_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_2_end_poserOrient.ro" "l_feather_2_end_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_2_5_poser.t" "l_feather_2_end_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_5_poser.rp" "l_feather_2_end_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_5_poser.rpt" "l_feather_2_end_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_5_poser.pm" "l_feather_2_end_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_end_poserOrient_aimConstraint1.w0" "l_feather_2_end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_2_mainPoser.wm" "l_feather_2_end_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_2_end_fanLoc_aimConstraint1.crx" "l_feather_2_end_fanLoc.rx"
		;
connectAttr "l_feather_2_end_fanLoc_aimConstraint1.cry" "l_feather_2_end_fanLoc.ry"
		;
connectAttr "l_feather_2_end_fanLoc_aimConstraint1.crz" "l_feather_2_end_fanLoc.rz"
		;
connectAttr "l_feather_2_end_fanLoc.pim" "l_feather_2_end_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_2_end_fanLoc.t" "l_feather_2_end_fanLoc_aimConstraint1.ct"
		;
connectAttr "l_feather_2_end_fanLoc.rp" "l_feather_2_end_fanLoc_aimConstraint1.crp"
		;
connectAttr "l_feather_2_end_fanLoc.rpt" "l_feather_2_end_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_2_end_fanLoc.ro" "l_feather_2_end_fanLoc_aimConstraint1.cro"
		;
connectAttr "l_feather_2_5_poser.t" "l_feather_2_end_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_2_5_poser.rp" "l_feather_2_end_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_2_5_poser.rpt" "l_feather_2_end_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_2_5_poser.pm" "l_feather_2_end_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_2_end_fanLoc_aimConstraint1.w0" "l_feather_2_end_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_end_poser.wm" "l_feather_2_end_fanLoc_aimConstraint1.wum"
		;
connectAttr "l_feather_3_mainPoser.sx" "l_feather_3_mainPoser.sy" -l on;
connectAttr "l_feather_3_mainPoser.sx" "l_feather_3_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_feather_3_mainPoser.globalSize";
connectAttr "l_feather_3_cluster4GroupId.id" "l_feather_3_mainPoserShape.iog.og[1].gid"
		;
connectAttr "l_feather_3_cluster4Set.mwc" "l_feather_3_mainPoserShape.iog.og[1].gco"
		;
connectAttr "l_feather_3_groupId42.id" "l_feather_3_mainPoserShape.iog.og[2].gid"
		;
connectAttr "l_feather_3_tweakSet24.mwc" "l_feather_3_mainPoserShape.iog.og[2].gco"
		;
connectAttr "l_feather_3_mainPoser_clusterHandleCluster.og[0]" "l_feather_3_mainPoserShape.cr"
		;
connectAttr "l_feather_3_tweak24.pl[0].cp[0]" "l_feather_3_mainPoserShape.twl";
connectAttr "l_feather_3_mainPoser_size_multiplyDivide.ox" "l_feather_3_mainPoser_clusterHandle.sx"
		;
connectAttr "l_feather_3_mainPoser_size_multiplyDivide.ox" "l_feather_3_mainPoser_clusterHandle.sy"
		;
connectAttr "l_feather_3_mainPoser_size_multiplyDivide.ox" "l_feather_3_mainPoser_clusterHandle.sz"
		;
connectAttr "l_feather_3_1_makeNurbSphere.os" "l_feather_3_1_poserNurbsShape.cr"
		;
connectAttr "l_feather_3_1_poserOrient_aimConstraint1.crx" "l_feather_3_1_poserOrient.rx"
		;
connectAttr "l_feather_3_1_poserOrient_aimConstraint1.cry" "l_feather_3_1_poserOrient.ry"
		;
connectAttr "l_feather_3_1_poserOrient_aimConstraint1.crz" "l_feather_3_1_poserOrient.rz"
		;
connectAttr "l_feather_3_1_poserOrient.pim" "l_feather_3_1_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_1_poserOrient.t" "l_feather_3_1_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_3_1_poserOrient.rp" "l_feather_3_1_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_3_1_poserOrient.rpt" "l_feather_3_1_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_3_1_poserOrient.ro" "l_feather_3_1_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_3_2_poser.t" "l_feather_3_1_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_2_poser.rp" "l_feather_3_1_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_2_poser.rpt" "l_feather_3_1_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_2_poser.pm" "l_feather_3_1_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_1_poserOrient_aimConstraint1.w0" "l_feather_3_1_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_3_mainPoser.wm" "l_feather_3_1_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_3_1_fanLoc_aimConstraint1.crx" "l_feather_3_1_fanLoc.rx";
connectAttr "l_feather_3_1_fanLoc_aimConstraint1.cry" "l_feather_3_1_fanLoc.ry";
connectAttr "l_feather_3_1_fanLoc_aimConstraint1.crz" "l_feather_3_1_fanLoc.rz";
connectAttr "l_feather_3_1_fanLoc.pim" "l_feather_3_1_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_1_fanLoc.t" "l_feather_3_1_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_3_1_fanLoc.rp" "l_feather_3_1_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_3_1_fanLoc.rpt" "l_feather_3_1_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_3_1_fanLoc.ro" "l_feather_3_1_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_3_2_poser.t" "l_feather_3_1_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_2_poser.rp" "l_feather_3_1_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_2_poser.rpt" "l_feather_3_1_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_2_poser.pm" "l_feather_3_1_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_1_fanLoc_aimConstraint1.w0" "l_feather_3_1_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_1_poser.wm" "l_feather_3_1_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_3_2_makeNurbSphere.os" "l_feather_3_2_poserNurbsShape.cr"
		;
connectAttr "l_feather_3_2_poserOrient_aimConstraint1.crx" "l_feather_3_2_poserOrient.rx"
		;
connectAttr "l_feather_3_2_poserOrient_aimConstraint1.cry" "l_feather_3_2_poserOrient.ry"
		;
connectAttr "l_feather_3_2_poserOrient_aimConstraint1.crz" "l_feather_3_2_poserOrient.rz"
		;
connectAttr "l_feather_3_2_poserOrient.pim" "l_feather_3_2_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_2_poserOrient.t" "l_feather_3_2_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_3_2_poserOrient.rp" "l_feather_3_2_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_3_2_poserOrient.rpt" "l_feather_3_2_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_3_2_poserOrient.ro" "l_feather_3_2_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_3_3_poser.t" "l_feather_3_2_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_3_poser.rp" "l_feather_3_2_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_3_poser.rpt" "l_feather_3_2_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_3_poser.pm" "l_feather_3_2_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_2_poserOrient_aimConstraint1.w0" "l_feather_3_2_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_3_mainPoser.wm" "l_feather_3_2_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_3_2_fanLoc_aimConstraint1.crx" "l_feather_3_2_fanLoc.rx";
connectAttr "l_feather_3_2_fanLoc_aimConstraint1.cry" "l_feather_3_2_fanLoc.ry";
connectAttr "l_feather_3_2_fanLoc_aimConstraint1.crz" "l_feather_3_2_fanLoc.rz";
connectAttr "l_feather_3_2_fanLoc.pim" "l_feather_3_2_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_2_fanLoc.t" "l_feather_3_2_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_3_2_fanLoc.rp" "l_feather_3_2_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_3_2_fanLoc.rpt" "l_feather_3_2_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_3_2_fanLoc.ro" "l_feather_3_2_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_3_3_poser.t" "l_feather_3_2_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_3_poser.rp" "l_feather_3_2_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_3_poser.rpt" "l_feather_3_2_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_3_poser.pm" "l_feather_3_2_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_2_fanLoc_aimConstraint1.w0" "l_feather_3_2_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_2_poser.wm" "l_feather_3_2_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_3_3_makeNurbSphere.os" "l_feather_3_3_poserNurbsShape.cr"
		;
connectAttr "l_feather_3_3_poserOrient_aimConstraint1.crx" "l_feather_3_3_poserOrient.rx"
		;
connectAttr "l_feather_3_3_poserOrient_aimConstraint1.cry" "l_feather_3_3_poserOrient.ry"
		;
connectAttr "l_feather_3_3_poserOrient_aimConstraint1.crz" "l_feather_3_3_poserOrient.rz"
		;
connectAttr "l_feather_3_3_poserOrient.pim" "l_feather_3_3_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_3_poserOrient.t" "l_feather_3_3_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_3_3_poserOrient.rp" "l_feather_3_3_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_3_3_poserOrient.rpt" "l_feather_3_3_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_3_3_poserOrient.ro" "l_feather_3_3_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_3_4_poser.t" "l_feather_3_3_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_4_poser.rp" "l_feather_3_3_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_4_poser.rpt" "l_feather_3_3_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_4_poser.pm" "l_feather_3_3_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_3_poserOrient_aimConstraint1.w0" "l_feather_3_3_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_3_mainPoser.wm" "l_feather_3_3_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_3_3_fanLoc_aimConstraint1.crx" "l_feather_3_3_fanLoc.rx";
connectAttr "l_feather_3_3_fanLoc_aimConstraint1.cry" "l_feather_3_3_fanLoc.ry";
connectAttr "l_feather_3_3_fanLoc_aimConstraint1.crz" "l_feather_3_3_fanLoc.rz";
connectAttr "l_feather_3_3_fanLoc.pim" "l_feather_3_3_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_3_fanLoc.t" "l_feather_3_3_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_3_3_fanLoc.rp" "l_feather_3_3_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_3_3_fanLoc.rpt" "l_feather_3_3_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_3_3_fanLoc.ro" "l_feather_3_3_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_3_4_poser.t" "l_feather_3_3_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_4_poser.rp" "l_feather_3_3_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_4_poser.rpt" "l_feather_3_3_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_4_poser.pm" "l_feather_3_3_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_3_fanLoc_aimConstraint1.w0" "l_feather_3_3_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_3_poser.wm" "l_feather_3_3_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_3_4_makeNurbSphere.os" "l_feather_3_4_poserNurbsShape.cr"
		;
connectAttr "l_feather_3_4_poserOrient_aimConstraint1.crx" "l_feather_3_4_poserOrient.rx"
		;
connectAttr "l_feather_3_4_poserOrient_aimConstraint1.cry" "l_feather_3_4_poserOrient.ry"
		;
connectAttr "l_feather_3_4_poserOrient_aimConstraint1.crz" "l_feather_3_4_poserOrient.rz"
		;
connectAttr "l_feather_3_4_poserOrient.pim" "l_feather_3_4_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_4_poserOrient.t" "l_feather_3_4_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_3_4_poserOrient.rp" "l_feather_3_4_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_3_4_poserOrient.rpt" "l_feather_3_4_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_3_4_poserOrient.ro" "l_feather_3_4_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_3_5_poser.t" "l_feather_3_4_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_5_poser.rp" "l_feather_3_4_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_5_poser.rpt" "l_feather_3_4_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_5_poser.pm" "l_feather_3_4_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_4_poserOrient_aimConstraint1.w0" "l_feather_3_4_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_3_mainPoser.wm" "l_feather_3_4_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_3_4_fanLoc_aimConstraint1.crx" "l_feather_3_4_fanLoc.rx";
connectAttr "l_feather_3_4_fanLoc_aimConstraint1.cry" "l_feather_3_4_fanLoc.ry";
connectAttr "l_feather_3_4_fanLoc_aimConstraint1.crz" "l_feather_3_4_fanLoc.rz";
connectAttr "l_feather_3_4_fanLoc.pim" "l_feather_3_4_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_4_fanLoc.t" "l_feather_3_4_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_3_4_fanLoc.rp" "l_feather_3_4_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_3_4_fanLoc.rpt" "l_feather_3_4_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_3_4_fanLoc.ro" "l_feather_3_4_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_3_5_poser.t" "l_feather_3_4_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_5_poser.rp" "l_feather_3_4_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_5_poser.rpt" "l_feather_3_4_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_5_poser.pm" "l_feather_3_4_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_4_fanLoc_aimConstraint1.w0" "l_feather_3_4_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_4_poser.wm" "l_feather_3_4_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_3_5_makeNurbSphere.os" "l_feather_3_5_poserNurbsShape.cr"
		;
connectAttr "l_feather_3_5_poserOrient_aimConstraint1.crx" "l_feather_3_5_poserOrient.rx"
		;
connectAttr "l_feather_3_5_poserOrient_aimConstraint1.cry" "l_feather_3_5_poserOrient.ry"
		;
connectAttr "l_feather_3_5_poserOrient_aimConstraint1.crz" "l_feather_3_5_poserOrient.rz"
		;
connectAttr "l_feather_3_5_poserOrient.pim" "l_feather_3_5_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_5_poserOrient.t" "l_feather_3_5_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_3_5_poserOrient.rp" "l_feather_3_5_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_3_5_poserOrient.rpt" "l_feather_3_5_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_3_5_poserOrient.ro" "l_feather_3_5_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_3_end_poser.t" "l_feather_3_5_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_end_poser.rp" "l_feather_3_5_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_end_poser.rpt" "l_feather_3_5_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_end_poser.pm" "l_feather_3_5_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_5_poserOrient_aimConstraint1.w0" "l_feather_3_5_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_3_mainPoser.wm" "l_feather_3_5_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_3_5_fanLoc_aimConstraint1.crx" "l_feather_3_5_fanLoc.rx";
connectAttr "l_feather_3_5_fanLoc_aimConstraint1.cry" "l_feather_3_5_fanLoc.ry";
connectAttr "l_feather_3_5_fanLoc_aimConstraint1.crz" "l_feather_3_5_fanLoc.rz";
connectAttr "l_feather_3_5_fanLoc.pim" "l_feather_3_5_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_5_fanLoc.t" "l_feather_3_5_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_3_5_fanLoc.rp" "l_feather_3_5_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_3_5_fanLoc.rpt" "l_feather_3_5_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_3_5_fanLoc.ro" "l_feather_3_5_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_3_end_poser.t" "l_feather_3_5_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_end_poser.rp" "l_feather_3_5_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_end_poser.rpt" "l_feather_3_5_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_end_poser.pm" "l_feather_3_5_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_5_fanLoc_aimConstraint1.w0" "l_feather_3_5_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_5_poser.wm" "l_feather_3_5_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_3_end_makeNurbSphere.os" "l_feather_3_end_poserNurbsShape.cr"
		;
connectAttr "l_feather_3_end_poserOrient_aimConstraint1.crx" "l_feather_3_end_poserOrient.rx"
		;
connectAttr "l_feather_3_end_poserOrient_aimConstraint1.cry" "l_feather_3_end_poserOrient.ry"
		;
connectAttr "l_feather_3_end_poserOrient_aimConstraint1.crz" "l_feather_3_end_poserOrient.rz"
		;
connectAttr "l_feather_3_end_poserOrient.pim" "l_feather_3_end_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_end_poserOrient.t" "l_feather_3_end_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_3_end_poserOrient.rp" "l_feather_3_end_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_3_end_poserOrient.rpt" "l_feather_3_end_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_3_end_poserOrient.ro" "l_feather_3_end_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_3_5_poser.t" "l_feather_3_end_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_5_poser.rp" "l_feather_3_end_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_5_poser.rpt" "l_feather_3_end_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_5_poser.pm" "l_feather_3_end_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_end_poserOrient_aimConstraint1.w0" "l_feather_3_end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_3_mainPoser.wm" "l_feather_3_end_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_3_end_fanLoc_aimConstraint1.crx" "l_feather_3_end_fanLoc.rx"
		;
connectAttr "l_feather_3_end_fanLoc_aimConstraint1.cry" "l_feather_3_end_fanLoc.ry"
		;
connectAttr "l_feather_3_end_fanLoc_aimConstraint1.crz" "l_feather_3_end_fanLoc.rz"
		;
connectAttr "l_feather_3_end_fanLoc.pim" "l_feather_3_end_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_3_end_fanLoc.t" "l_feather_3_end_fanLoc_aimConstraint1.ct"
		;
connectAttr "l_feather_3_end_fanLoc.rp" "l_feather_3_end_fanLoc_aimConstraint1.crp"
		;
connectAttr "l_feather_3_end_fanLoc.rpt" "l_feather_3_end_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_3_end_fanLoc.ro" "l_feather_3_end_fanLoc_aimConstraint1.cro"
		;
connectAttr "l_feather_3_5_poser.t" "l_feather_3_end_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_3_5_poser.rp" "l_feather_3_end_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_3_5_poser.rpt" "l_feather_3_end_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_3_5_poser.pm" "l_feather_3_end_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_3_end_fanLoc_aimConstraint1.w0" "l_feather_3_end_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_end_poser.wm" "l_feather_3_end_fanLoc_aimConstraint1.wum"
		;
connectAttr "l_feather_4_mainPoser.sx" "l_feather_4_mainPoser.sy" -l on;
connectAttr "l_feather_4_mainPoser.sx" "l_feather_4_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_feather_4_mainPoser.globalSize";
connectAttr "l_feather_4_cluster4GroupId.id" "l_feather_4_mainPoserShape.iog.og[1].gid"
		;
connectAttr "l_feather_4_cluster4Set.mwc" "l_feather_4_mainPoserShape.iog.og[1].gco"
		;
connectAttr "l_feather_4_groupId42.id" "l_feather_4_mainPoserShape.iog.og[2].gid"
		;
connectAttr "l_feather_4_tweakSet24.mwc" "l_feather_4_mainPoserShape.iog.og[2].gco"
		;
connectAttr "l_feather_4_mainPoser_clusterHandleCluster.og[0]" "l_feather_4_mainPoserShape.cr"
		;
connectAttr "l_feather_4_tweak24.pl[0].cp[0]" "l_feather_4_mainPoserShape.twl";
connectAttr "l_feather_4_mainPoser_size_multiplyDivide.ox" "l_feather_4_mainPoser_clusterHandle.sx"
		;
connectAttr "l_feather_4_mainPoser_size_multiplyDivide.ox" "l_feather_4_mainPoser_clusterHandle.sy"
		;
connectAttr "l_feather_4_mainPoser_size_multiplyDivide.ox" "l_feather_4_mainPoser_clusterHandle.sz"
		;
connectAttr "l_feather_4_1_makeNurbSphere.os" "l_feather_4_1_poserNurbsShape.cr"
		;
connectAttr "l_feather_4_1_poserOrient_aimConstraint1.crx" "l_feather_4_1_poserOrient.rx"
		;
connectAttr "l_feather_4_1_poserOrient_aimConstraint1.cry" "l_feather_4_1_poserOrient.ry"
		;
connectAttr "l_feather_4_1_poserOrient_aimConstraint1.crz" "l_feather_4_1_poserOrient.rz"
		;
connectAttr "l_feather_4_1_poserOrient.pim" "l_feather_4_1_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_1_poserOrient.t" "l_feather_4_1_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_4_1_poserOrient.rp" "l_feather_4_1_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_4_1_poserOrient.rpt" "l_feather_4_1_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_4_1_poserOrient.ro" "l_feather_4_1_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_4_2_poser.t" "l_feather_4_1_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_2_poser.rp" "l_feather_4_1_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_2_poser.rpt" "l_feather_4_1_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_2_poser.pm" "l_feather_4_1_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_1_poserOrient_aimConstraint1.w0" "l_feather_4_1_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_4_mainPoser.wm" "l_feather_4_1_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_4_1_fanLoc_aimConstraint1.crx" "l_feather_4_1_fanLoc.rx";
connectAttr "l_feather_4_1_fanLoc_aimConstraint1.cry" "l_feather_4_1_fanLoc.ry";
connectAttr "l_feather_4_1_fanLoc_aimConstraint1.crz" "l_feather_4_1_fanLoc.rz";
connectAttr "l_feather_4_1_fanLoc.pim" "l_feather_4_1_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_1_fanLoc.t" "l_feather_4_1_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_4_1_fanLoc.rp" "l_feather_4_1_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_4_1_fanLoc.rpt" "l_feather_4_1_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_4_1_fanLoc.ro" "l_feather_4_1_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_4_2_poser.t" "l_feather_4_1_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_2_poser.rp" "l_feather_4_1_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_2_poser.rpt" "l_feather_4_1_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_2_poser.pm" "l_feather_4_1_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_1_fanLoc_aimConstraint1.w0" "l_feather_4_1_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_1_poser.wm" "l_feather_4_1_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_4_2_makeNurbSphere.os" "l_feather_4_2_poserNurbsShape.cr"
		;
connectAttr "l_feather_4_2_poserOrient_aimConstraint1.crx" "l_feather_4_2_poserOrient.rx"
		;
connectAttr "l_feather_4_2_poserOrient_aimConstraint1.cry" "l_feather_4_2_poserOrient.ry"
		;
connectAttr "l_feather_4_2_poserOrient_aimConstraint1.crz" "l_feather_4_2_poserOrient.rz"
		;
connectAttr "l_feather_4_2_poserOrient.pim" "l_feather_4_2_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_2_poserOrient.t" "l_feather_4_2_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_4_2_poserOrient.rp" "l_feather_4_2_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_4_2_poserOrient.rpt" "l_feather_4_2_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_4_2_poserOrient.ro" "l_feather_4_2_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_4_3_poser.t" "l_feather_4_2_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_3_poser.rp" "l_feather_4_2_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_3_poser.rpt" "l_feather_4_2_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_3_poser.pm" "l_feather_4_2_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_2_poserOrient_aimConstraint1.w0" "l_feather_4_2_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_4_mainPoser.wm" "l_feather_4_2_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_4_2_fanLoc_aimConstraint1.crx" "l_feather_4_2_fanLoc.rx";
connectAttr "l_feather_4_2_fanLoc_aimConstraint1.cry" "l_feather_4_2_fanLoc.ry";
connectAttr "l_feather_4_2_fanLoc_aimConstraint1.crz" "l_feather_4_2_fanLoc.rz";
connectAttr "l_feather_4_2_fanLoc.pim" "l_feather_4_2_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_2_fanLoc.t" "l_feather_4_2_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_4_2_fanLoc.rp" "l_feather_4_2_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_4_2_fanLoc.rpt" "l_feather_4_2_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_4_2_fanLoc.ro" "l_feather_4_2_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_4_3_poser.t" "l_feather_4_2_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_3_poser.rp" "l_feather_4_2_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_3_poser.rpt" "l_feather_4_2_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_3_poser.pm" "l_feather_4_2_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_2_fanLoc_aimConstraint1.w0" "l_feather_4_2_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_2_poser.wm" "l_feather_4_2_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_4_3_makeNurbSphere.os" "l_feather_4_3_poserNurbsShape.cr"
		;
connectAttr "l_feather_4_3_poserOrient_aimConstraint1.crx" "l_feather_4_3_poserOrient.rx"
		;
connectAttr "l_feather_4_3_poserOrient_aimConstraint1.cry" "l_feather_4_3_poserOrient.ry"
		;
connectAttr "l_feather_4_3_poserOrient_aimConstraint1.crz" "l_feather_4_3_poserOrient.rz"
		;
connectAttr "l_feather_4_3_poserOrient.pim" "l_feather_4_3_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_3_poserOrient.t" "l_feather_4_3_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_4_3_poserOrient.rp" "l_feather_4_3_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_4_3_poserOrient.rpt" "l_feather_4_3_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_4_3_poserOrient.ro" "l_feather_4_3_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_4_4_poser.t" "l_feather_4_3_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_4_poser.rp" "l_feather_4_3_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_4_poser.rpt" "l_feather_4_3_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_4_poser.pm" "l_feather_4_3_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_3_poserOrient_aimConstraint1.w0" "l_feather_4_3_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_4_mainPoser.wm" "l_feather_4_3_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_4_3_fanLoc_aimConstraint1.crx" "l_feather_4_3_fanLoc.rx";
connectAttr "l_feather_4_3_fanLoc_aimConstraint1.cry" "l_feather_4_3_fanLoc.ry";
connectAttr "l_feather_4_3_fanLoc_aimConstraint1.crz" "l_feather_4_3_fanLoc.rz";
connectAttr "l_feather_4_3_fanLoc.pim" "l_feather_4_3_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_3_fanLoc.t" "l_feather_4_3_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_4_3_fanLoc.rp" "l_feather_4_3_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_4_3_fanLoc.rpt" "l_feather_4_3_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_4_3_fanLoc.ro" "l_feather_4_3_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_4_4_poser.t" "l_feather_4_3_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_4_poser.rp" "l_feather_4_3_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_4_poser.rpt" "l_feather_4_3_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_4_poser.pm" "l_feather_4_3_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_3_fanLoc_aimConstraint1.w0" "l_feather_4_3_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_3_poser.wm" "l_feather_4_3_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_4_4_makeNurbSphere.os" "l_feather_4_4_poserNurbsShape.cr"
		;
connectAttr "l_feather_4_4_poserOrient_aimConstraint1.crx" "l_feather_4_4_poserOrient.rx"
		;
connectAttr "l_feather_4_4_poserOrient_aimConstraint1.cry" "l_feather_4_4_poserOrient.ry"
		;
connectAttr "l_feather_4_4_poserOrient_aimConstraint1.crz" "l_feather_4_4_poserOrient.rz"
		;
connectAttr "l_feather_4_4_poserOrient.pim" "l_feather_4_4_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_4_poserOrient.t" "l_feather_4_4_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_4_4_poserOrient.rp" "l_feather_4_4_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_4_4_poserOrient.rpt" "l_feather_4_4_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_4_4_poserOrient.ro" "l_feather_4_4_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_4_5_poser.t" "l_feather_4_4_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_5_poser.rp" "l_feather_4_4_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_5_poser.rpt" "l_feather_4_4_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_5_poser.pm" "l_feather_4_4_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_4_poserOrient_aimConstraint1.w0" "l_feather_4_4_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_4_mainPoser.wm" "l_feather_4_4_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_4_4_fanLoc_aimConstraint1.crx" "l_feather_4_4_fanLoc.rx";
connectAttr "l_feather_4_4_fanLoc_aimConstraint1.cry" "l_feather_4_4_fanLoc.ry";
connectAttr "l_feather_4_4_fanLoc_aimConstraint1.crz" "l_feather_4_4_fanLoc.rz";
connectAttr "l_feather_4_4_fanLoc.pim" "l_feather_4_4_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_4_fanLoc.t" "l_feather_4_4_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_4_4_fanLoc.rp" "l_feather_4_4_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_4_4_fanLoc.rpt" "l_feather_4_4_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_4_4_fanLoc.ro" "l_feather_4_4_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_4_5_poser.t" "l_feather_4_4_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_5_poser.rp" "l_feather_4_4_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_5_poser.rpt" "l_feather_4_4_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_5_poser.pm" "l_feather_4_4_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_4_fanLoc_aimConstraint1.w0" "l_feather_4_4_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_4_poser.wm" "l_feather_4_4_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_4_5_makeNurbSphere.os" "l_feather_4_5_poserNurbsShape.cr"
		;
connectAttr "l_feather_4_5_poserOrient_aimConstraint1.crx" "l_feather_4_5_poserOrient.rx"
		;
connectAttr "l_feather_4_5_poserOrient_aimConstraint1.cry" "l_feather_4_5_poserOrient.ry"
		;
connectAttr "l_feather_4_5_poserOrient_aimConstraint1.crz" "l_feather_4_5_poserOrient.rz"
		;
connectAttr "l_feather_4_5_poserOrient.pim" "l_feather_4_5_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_5_poserOrient.t" "l_feather_4_5_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_4_5_poserOrient.rp" "l_feather_4_5_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_4_5_poserOrient.rpt" "l_feather_4_5_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_4_5_poserOrient.ro" "l_feather_4_5_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_4_end_poser.t" "l_feather_4_5_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_end_poser.rp" "l_feather_4_5_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_end_poser.rpt" "l_feather_4_5_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_end_poser.pm" "l_feather_4_5_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_5_poserOrient_aimConstraint1.w0" "l_feather_4_5_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_4_mainPoser.wm" "l_feather_4_5_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_4_5_fanLoc_aimConstraint1.crx" "l_feather_4_5_fanLoc.rx";
connectAttr "l_feather_4_5_fanLoc_aimConstraint1.cry" "l_feather_4_5_fanLoc.ry";
connectAttr "l_feather_4_5_fanLoc_aimConstraint1.crz" "l_feather_4_5_fanLoc.rz";
connectAttr "l_feather_4_5_fanLoc.pim" "l_feather_4_5_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_5_fanLoc.t" "l_feather_4_5_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_4_5_fanLoc.rp" "l_feather_4_5_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_4_5_fanLoc.rpt" "l_feather_4_5_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_4_5_fanLoc.ro" "l_feather_4_5_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_4_end_poser.t" "l_feather_4_5_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_end_poser.rp" "l_feather_4_5_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_end_poser.rpt" "l_feather_4_5_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_end_poser.pm" "l_feather_4_5_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_5_fanLoc_aimConstraint1.w0" "l_feather_4_5_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_5_poser.wm" "l_feather_4_5_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_4_end_makeNurbSphere.os" "l_feather_4_end_poserNurbsShape.cr"
		;
connectAttr "l_feather_4_end_poserOrient_aimConstraint1.crx" "l_feather_4_end_poserOrient.rx"
		;
connectAttr "l_feather_4_end_poserOrient_aimConstraint1.cry" "l_feather_4_end_poserOrient.ry"
		;
connectAttr "l_feather_4_end_poserOrient_aimConstraint1.crz" "l_feather_4_end_poserOrient.rz"
		;
connectAttr "l_feather_4_end_poserOrient.pim" "l_feather_4_end_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_end_poserOrient.t" "l_feather_4_end_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_4_end_poserOrient.rp" "l_feather_4_end_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_4_end_poserOrient.rpt" "l_feather_4_end_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_4_end_poserOrient.ro" "l_feather_4_end_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_4_5_poser.t" "l_feather_4_end_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_5_poser.rp" "l_feather_4_end_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_5_poser.rpt" "l_feather_4_end_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_5_poser.pm" "l_feather_4_end_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_end_poserOrient_aimConstraint1.w0" "l_feather_4_end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_4_mainPoser.wm" "l_feather_4_end_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_4_end_fanLoc_aimConstraint1.crx" "l_feather_4_end_fanLoc.rx"
		;
connectAttr "l_feather_4_end_fanLoc_aimConstraint1.cry" "l_feather_4_end_fanLoc.ry"
		;
connectAttr "l_feather_4_end_fanLoc_aimConstraint1.crz" "l_feather_4_end_fanLoc.rz"
		;
connectAttr "l_feather_4_end_fanLoc.pim" "l_feather_4_end_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_4_end_fanLoc.t" "l_feather_4_end_fanLoc_aimConstraint1.ct"
		;
connectAttr "l_feather_4_end_fanLoc.rp" "l_feather_4_end_fanLoc_aimConstraint1.crp"
		;
connectAttr "l_feather_4_end_fanLoc.rpt" "l_feather_4_end_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_4_end_fanLoc.ro" "l_feather_4_end_fanLoc_aimConstraint1.cro"
		;
connectAttr "l_feather_4_5_poser.t" "l_feather_4_end_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_4_5_poser.rp" "l_feather_4_end_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_4_5_poser.rpt" "l_feather_4_end_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_4_5_poser.pm" "l_feather_4_end_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_4_end_fanLoc_aimConstraint1.w0" "l_feather_4_end_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_end_poser.wm" "l_feather_4_end_fanLoc_aimConstraint1.wum"
		;
connectAttr "l_feather_5_mainPoser.sx" "l_feather_5_mainPoser.sy" -l on;
connectAttr "l_feather_5_mainPoser.sx" "l_feather_5_mainPoser.sz" -l on;
connectAttr "mainPoser.globalSize" "l_feather_5_mainPoser.globalSize";
connectAttr "l_feather_5_cluster4GroupId.id" "l_feather_5_mainPoserShape.iog.og[1].gid"
		;
connectAttr "l_feather_5_cluster4Set.mwc" "l_feather_5_mainPoserShape.iog.og[1].gco"
		;
connectAttr "l_feather_5_groupId42.id" "l_feather_5_mainPoserShape.iog.og[2].gid"
		;
connectAttr "l_feather_5_tweakSet24.mwc" "l_feather_5_mainPoserShape.iog.og[2].gco"
		;
connectAttr "l_feather_5_mainPoser_clusterHandleCluster.og[0]" "l_feather_5_mainPoserShape.cr"
		;
connectAttr "l_feather_5_tweak24.pl[0].cp[0]" "l_feather_5_mainPoserShape.twl";
connectAttr "l_feather_5_mainPoser_size_multiplyDivide.ox" "l_feather_5_mainPoser_clusterHandle.sx"
		;
connectAttr "l_feather_5_mainPoser_size_multiplyDivide.ox" "l_feather_5_mainPoser_clusterHandle.sy"
		;
connectAttr "l_feather_5_mainPoser_size_multiplyDivide.ox" "l_feather_5_mainPoser_clusterHandle.sz"
		;
connectAttr "l_feather_5_1_makeNurbSphere.os" "l_feather_5_1_poserNurbsShape.cr"
		;
connectAttr "l_feather_5_1_poserOrient_aimConstraint1.crx" "l_feather_5_1_poserOrient.rx"
		;
connectAttr "l_feather_5_1_poserOrient_aimConstraint1.cry" "l_feather_5_1_poserOrient.ry"
		;
connectAttr "l_feather_5_1_poserOrient_aimConstraint1.crz" "l_feather_5_1_poserOrient.rz"
		;
connectAttr "l_feather_5_1_poserOrient.pim" "l_feather_5_1_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_1_poserOrient.t" "l_feather_5_1_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_5_1_poserOrient.rp" "l_feather_5_1_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_5_1_poserOrient.rpt" "l_feather_5_1_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_5_1_poserOrient.ro" "l_feather_5_1_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_5_2_poser.t" "l_feather_5_1_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_2_poser.rp" "l_feather_5_1_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_2_poser.rpt" "l_feather_5_1_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_2_poser.pm" "l_feather_5_1_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_1_poserOrient_aimConstraint1.w0" "l_feather_5_1_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_5_mainPoser.wm" "l_feather_5_1_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_5_1_fanLoc_aimConstraint1.crx" "l_feather_5_1_fanLoc.rx";
connectAttr "l_feather_5_1_fanLoc_aimConstraint1.cry" "l_feather_5_1_fanLoc.ry";
connectAttr "l_feather_5_1_fanLoc_aimConstraint1.crz" "l_feather_5_1_fanLoc.rz";
connectAttr "l_feather_5_1_fanLoc.pim" "l_feather_5_1_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_1_fanLoc.t" "l_feather_5_1_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_5_1_fanLoc.rp" "l_feather_5_1_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_5_1_fanLoc.rpt" "l_feather_5_1_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_5_1_fanLoc.ro" "l_feather_5_1_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_5_2_poser.t" "l_feather_5_1_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_2_poser.rp" "l_feather_5_1_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_2_poser.rpt" "l_feather_5_1_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_2_poser.pm" "l_feather_5_1_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_1_fanLoc_aimConstraint1.w0" "l_feather_5_1_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_1_poser.wm" "l_feather_5_1_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_5_2_makeNurbSphere.os" "l_feather_5_2_poserNurbsShape.cr"
		;
connectAttr "l_feather_5_2_poserOrient_aimConstraint1.crx" "l_feather_5_2_poserOrient.rx"
		;
connectAttr "l_feather_5_2_poserOrient_aimConstraint1.cry" "l_feather_5_2_poserOrient.ry"
		;
connectAttr "l_feather_5_2_poserOrient_aimConstraint1.crz" "l_feather_5_2_poserOrient.rz"
		;
connectAttr "l_feather_5_2_poserOrient.pim" "l_feather_5_2_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_2_poserOrient.t" "l_feather_5_2_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_5_2_poserOrient.rp" "l_feather_5_2_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_5_2_poserOrient.rpt" "l_feather_5_2_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_5_2_poserOrient.ro" "l_feather_5_2_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_5_3_poser.t" "l_feather_5_2_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_3_poser.rp" "l_feather_5_2_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_3_poser.rpt" "l_feather_5_2_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_3_poser.pm" "l_feather_5_2_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_2_poserOrient_aimConstraint1.w0" "l_feather_5_2_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_5_mainPoser.wm" "l_feather_5_2_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_5_2_fanLoc_aimConstraint1.crx" "l_feather_5_2_fanLoc.rx";
connectAttr "l_feather_5_2_fanLoc_aimConstraint1.cry" "l_feather_5_2_fanLoc.ry";
connectAttr "l_feather_5_2_fanLoc_aimConstraint1.crz" "l_feather_5_2_fanLoc.rz";
connectAttr "l_feather_5_2_fanLoc.pim" "l_feather_5_2_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_2_fanLoc.t" "l_feather_5_2_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_5_2_fanLoc.rp" "l_feather_5_2_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_5_2_fanLoc.rpt" "l_feather_5_2_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_5_2_fanLoc.ro" "l_feather_5_2_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_5_3_poser.t" "l_feather_5_2_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_3_poser.rp" "l_feather_5_2_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_3_poser.rpt" "l_feather_5_2_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_3_poser.pm" "l_feather_5_2_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_2_fanLoc_aimConstraint1.w0" "l_feather_5_2_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_2_poser.wm" "l_feather_5_2_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_5_3_makeNurbSphere.os" "l_feather_5_3_poserNurbsShape.cr"
		;
connectAttr "l_feather_5_3_poserOrient_aimConstraint1.crx" "l_feather_5_3_poserOrient.rx"
		;
connectAttr "l_feather_5_3_poserOrient_aimConstraint1.cry" "l_feather_5_3_poserOrient.ry"
		;
connectAttr "l_feather_5_3_poserOrient_aimConstraint1.crz" "l_feather_5_3_poserOrient.rz"
		;
connectAttr "l_feather_5_3_poserOrient.pim" "l_feather_5_3_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_3_poserOrient.t" "l_feather_5_3_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_5_3_poserOrient.rp" "l_feather_5_3_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_5_3_poserOrient.rpt" "l_feather_5_3_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_5_3_poserOrient.ro" "l_feather_5_3_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_5_4_poser.t" "l_feather_5_3_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_4_poser.rp" "l_feather_5_3_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_4_poser.rpt" "l_feather_5_3_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_4_poser.pm" "l_feather_5_3_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_3_poserOrient_aimConstraint1.w0" "l_feather_5_3_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_5_mainPoser.wm" "l_feather_5_3_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_5_3_fanLoc_aimConstraint1.crx" "l_feather_5_3_fanLoc.rx";
connectAttr "l_feather_5_3_fanLoc_aimConstraint1.cry" "l_feather_5_3_fanLoc.ry";
connectAttr "l_feather_5_3_fanLoc_aimConstraint1.crz" "l_feather_5_3_fanLoc.rz";
connectAttr "l_feather_5_3_fanLoc.pim" "l_feather_5_3_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_3_fanLoc.t" "l_feather_5_3_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_5_3_fanLoc.rp" "l_feather_5_3_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_5_3_fanLoc.rpt" "l_feather_5_3_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_5_3_fanLoc.ro" "l_feather_5_3_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_5_4_poser.t" "l_feather_5_3_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_4_poser.rp" "l_feather_5_3_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_4_poser.rpt" "l_feather_5_3_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_4_poser.pm" "l_feather_5_3_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_3_fanLoc_aimConstraint1.w0" "l_feather_5_3_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_3_poser.wm" "l_feather_5_3_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_5_4_makeNurbSphere.os" "l_feather_5_4_poserNurbsShape.cr"
		;
connectAttr "l_feather_5_4_poserOrient_aimConstraint1.crx" "l_feather_5_4_poserOrient.rx"
		;
connectAttr "l_feather_5_4_poserOrient_aimConstraint1.cry" "l_feather_5_4_poserOrient.ry"
		;
connectAttr "l_feather_5_4_poserOrient_aimConstraint1.crz" "l_feather_5_4_poserOrient.rz"
		;
connectAttr "l_feather_5_4_poserOrient.pim" "l_feather_5_4_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_4_poserOrient.t" "l_feather_5_4_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_5_4_poserOrient.rp" "l_feather_5_4_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_5_4_poserOrient.rpt" "l_feather_5_4_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_5_4_poserOrient.ro" "l_feather_5_4_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_5_5_poser.t" "l_feather_5_4_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_5_poser.rp" "l_feather_5_4_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_5_poser.rpt" "l_feather_5_4_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_5_poser.pm" "l_feather_5_4_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_4_poserOrient_aimConstraint1.w0" "l_feather_5_4_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_5_mainPoser.wm" "l_feather_5_4_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_5_4_fanLoc_aimConstraint1.crx" "l_feather_5_4_fanLoc.rx";
connectAttr "l_feather_5_4_fanLoc_aimConstraint1.cry" "l_feather_5_4_fanLoc.ry";
connectAttr "l_feather_5_4_fanLoc_aimConstraint1.crz" "l_feather_5_4_fanLoc.rz";
connectAttr "l_feather_5_4_fanLoc.pim" "l_feather_5_4_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_4_fanLoc.t" "l_feather_5_4_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_5_4_fanLoc.rp" "l_feather_5_4_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_5_4_fanLoc.rpt" "l_feather_5_4_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_5_4_fanLoc.ro" "l_feather_5_4_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_5_5_poser.t" "l_feather_5_4_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_5_poser.rp" "l_feather_5_4_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_5_poser.rpt" "l_feather_5_4_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_5_poser.pm" "l_feather_5_4_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_4_fanLoc_aimConstraint1.w0" "l_feather_5_4_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_4_poser.wm" "l_feather_5_4_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_5_5_makeNurbSphere.os" "l_feather_5_5_poserNurbsShape.cr"
		;
connectAttr "l_feather_5_5_poserOrient_aimConstraint1.crx" "l_feather_5_5_poserOrient.rx"
		;
connectAttr "l_feather_5_5_poserOrient_aimConstraint1.cry" "l_feather_5_5_poserOrient.ry"
		;
connectAttr "l_feather_5_5_poserOrient_aimConstraint1.crz" "l_feather_5_5_poserOrient.rz"
		;
connectAttr "l_feather_5_5_poserOrient.pim" "l_feather_5_5_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_5_poserOrient.t" "l_feather_5_5_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_5_5_poserOrient.rp" "l_feather_5_5_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_5_5_poserOrient.rpt" "l_feather_5_5_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_5_5_poserOrient.ro" "l_feather_5_5_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_5_end_poser.t" "l_feather_5_5_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_end_poser.rp" "l_feather_5_5_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_end_poser.rpt" "l_feather_5_5_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_end_poser.pm" "l_feather_5_5_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_5_poserOrient_aimConstraint1.w0" "l_feather_5_5_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_5_mainPoser.wm" "l_feather_5_5_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_5_5_fanLoc_aimConstraint1.crx" "l_feather_5_5_fanLoc.rx";
connectAttr "l_feather_5_5_fanLoc_aimConstraint1.cry" "l_feather_5_5_fanLoc.ry";
connectAttr "l_feather_5_5_fanLoc_aimConstraint1.crz" "l_feather_5_5_fanLoc.rz";
connectAttr "l_feather_5_5_fanLoc.pim" "l_feather_5_5_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_5_fanLoc.t" "l_feather_5_5_fanLoc_aimConstraint1.ct";
connectAttr "l_feather_5_5_fanLoc.rp" "l_feather_5_5_fanLoc_aimConstraint1.crp";
connectAttr "l_feather_5_5_fanLoc.rpt" "l_feather_5_5_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_5_5_fanLoc.ro" "l_feather_5_5_fanLoc_aimConstraint1.cro";
connectAttr "l_feather_5_end_poser.t" "l_feather_5_5_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_end_poser.rp" "l_feather_5_5_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_end_poser.rpt" "l_feather_5_5_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_end_poser.pm" "l_feather_5_5_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_5_fanLoc_aimConstraint1.w0" "l_feather_5_5_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_5_poser.wm" "l_feather_5_5_fanLoc_aimConstraint1.wum";
connectAttr "l_feather_5_end_makeNurbSphere.os" "l_feather_5_end_poserNurbsShape.cr"
		;
connectAttr "l_feather_5_end_poserOrient_aimConstraint1.crx" "l_feather_5_end_poserOrient.rx"
		;
connectAttr "l_feather_5_end_poserOrient_aimConstraint1.cry" "l_feather_5_end_poserOrient.ry"
		;
connectAttr "l_feather_5_end_poserOrient_aimConstraint1.crz" "l_feather_5_end_poserOrient.rz"
		;
connectAttr "l_feather_5_end_poserOrient.pim" "l_feather_5_end_poserOrient_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_end_poserOrient.t" "l_feather_5_end_poserOrient_aimConstraint1.ct"
		;
connectAttr "l_feather_5_end_poserOrient.rp" "l_feather_5_end_poserOrient_aimConstraint1.crp"
		;
connectAttr "l_feather_5_end_poserOrient.rpt" "l_feather_5_end_poserOrient_aimConstraint1.crt"
		;
connectAttr "l_feather_5_end_poserOrient.ro" "l_feather_5_end_poserOrient_aimConstraint1.cro"
		;
connectAttr "l_feather_5_5_poser.t" "l_feather_5_end_poserOrient_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_5_poser.rp" "l_feather_5_end_poserOrient_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_5_poser.rpt" "l_feather_5_end_poserOrient_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_5_poser.pm" "l_feather_5_end_poserOrient_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_end_poserOrient_aimConstraint1.w0" "l_feather_5_end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "l_feather_5_mainPoser.wm" "l_feather_5_end_poserOrient_aimConstraint1.wum"
		;
connectAttr "l_feather_5_end_fanLoc_aimConstraint1.crx" "l_feather_5_end_fanLoc.rx"
		;
connectAttr "l_feather_5_end_fanLoc_aimConstraint1.cry" "l_feather_5_end_fanLoc.ry"
		;
connectAttr "l_feather_5_end_fanLoc_aimConstraint1.crz" "l_feather_5_end_fanLoc.rz"
		;
connectAttr "l_feather_5_end_fanLoc.pim" "l_feather_5_end_fanLoc_aimConstraint1.cpim"
		;
connectAttr "l_feather_5_end_fanLoc.t" "l_feather_5_end_fanLoc_aimConstraint1.ct"
		;
connectAttr "l_feather_5_end_fanLoc.rp" "l_feather_5_end_fanLoc_aimConstraint1.crp"
		;
connectAttr "l_feather_5_end_fanLoc.rpt" "l_feather_5_end_fanLoc_aimConstraint1.crt"
		;
connectAttr "l_feather_5_end_fanLoc.ro" "l_feather_5_end_fanLoc_aimConstraint1.cro"
		;
connectAttr "l_feather_5_5_poser.t" "l_feather_5_end_fanLoc_aimConstraint1.tg[0].tt"
		;
connectAttr "l_feather_5_5_poser.rp" "l_feather_5_end_fanLoc_aimConstraint1.tg[0].trp"
		;
connectAttr "l_feather_5_5_poser.rpt" "l_feather_5_end_fanLoc_aimConstraint1.tg[0].trt"
		;
connectAttr "l_feather_5_5_poser.pm" "l_feather_5_end_fanLoc_aimConstraint1.tg[0].tpm"
		;
connectAttr "l_feather_5_end_fanLoc_aimConstraint1.w0" "l_feather_5_end_fanLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "m_feather_end_poser.wm" "l_feather_5_end_fanLoc_aimConstraint1.wum"
		;
connectAttr "r_feather_1_1_initLoc_multMat.o" "r_feather_1_1_initLoc.opm";
connectAttr "r_feather_1_2_initLoc_multMat.o" "r_feather_1_2_initLoc.opm";
connectAttr "r_feather_1_3_initLoc_multMat.o" "r_feather_1_3_initLoc.opm";
connectAttr "r_feather_1_4_initLoc_multMat.o" "r_feather_1_4_initLoc.opm";
connectAttr "r_feather_1_5_initLoc_multMat.o" "r_feather_1_5_initLoc.opm";
connectAttr "r_feather_1_end_initLoc_multMat.o" "r_feather_1_end_initLoc.opm";
connectAttr "r_feather_1_1_fanLoc_multMat.o" "r_feather_1_1_fanLoc.opm";
connectAttr "r_feather_2_1_initLoc_multMat.o" "r_feather_2_1_initLoc.opm";
connectAttr "r_feather_2_2_initLoc_multMat.o" "r_feather_2_2_initLoc.opm";
connectAttr "r_feather_2_3_initLoc_multMat.o" "r_feather_2_3_initLoc.opm";
connectAttr "r_feather_2_4_initLoc_multMat.o" "r_feather_2_4_initLoc.opm";
connectAttr "r_feather_2_5_initLoc_multMat.o" "r_feather_2_5_initLoc.opm";
connectAttr "r_feather_2_end_initLoc_multMat.o" "r_feather_2_end_initLoc.opm";
connectAttr "r_feather_2_1_fanLoc_multMat.o" "r_feather_2_1_fanLoc.opm";
connectAttr "r_feather_3_1_initLoc_multMat.o" "r_feather_3_1_initLoc.opm";
connectAttr "r_feather_3_2_initLoc_multMat.o" "r_feather_3_2_initLoc.opm";
connectAttr "r_feather_3_3_initLoc_multMat.o" "r_feather_3_3_initLoc.opm";
connectAttr "r_feather_3_4_initLoc_multMat.o" "r_feather_3_4_initLoc.opm";
connectAttr "r_feather_3_5_initLoc_multMat.o" "r_feather_3_5_initLoc.opm";
connectAttr "r_feather_3_end_initLoc_multMat.o" "r_feather_3_end_initLoc.opm";
connectAttr "r_feather_3_1_fanLoc_multMat.o" "r_feather_3_1_fanLoc.opm";
connectAttr "r_feather_4_1_initLoc_multMat.o" "r_feather_4_1_initLoc.opm";
connectAttr "r_feather_4_2_initLoc_multMat.o" "r_feather_4_2_initLoc.opm";
connectAttr "r_feather_4_3_initLoc_multMat.o" "r_feather_4_3_initLoc.opm";
connectAttr "r_feather_4_4_initLoc_multMat.o" "r_feather_4_4_initLoc.opm";
connectAttr "r_feather_4_5_initLoc_multMat.o" "r_feather_4_5_initLoc.opm";
connectAttr "r_feather_4_end_initLoc_multMat.o" "r_feather_4_end_initLoc.opm";
connectAttr "r_feather_4_1_fanLoc_multMat.o" "r_feather_4_1_fanLoc.opm";
connectAttr "r_feather_5_1_initLoc_multMat.o" "r_feather_5_1_initLoc.opm";
connectAttr "r_feather_5_2_initLoc_multMat.o" "r_feather_5_2_initLoc.opm";
connectAttr "r_feather_5_3_initLoc_multMat.o" "r_feather_5_3_initLoc.opm";
connectAttr "r_feather_5_4_initLoc_multMat.o" "r_feather_5_4_initLoc.opm";
connectAttr "r_feather_5_5_initLoc_multMat.o" "r_feather_5_5_initLoc.opm";
connectAttr "r_feather_5_end_initLoc_multMat.o" "r_feather_5_end_initLoc.opm";
connectAttr "r_feather_5_1_fanLoc_multMat.o" "r_feather_5_1_fanLoc.opm";
connectAttr "m_feather_1_poserOrientShape.wp" "posers_curve_Shape1.cp[0]";
connectAttr "m_feather_2_poserOrientShape.wp" "posers_curve_Shape1.cp[1]";
connectAttr "m_feather_3_poserOrientShape.wp" "posers_curve_Shape1.cp[2]";
connectAttr "m_feather_4_poserOrientShape.wp" "posers_curve_Shape1.cp[3]";
connectAttr "m_feather_5_poserOrientShape.wp" "posers_curve_Shape1.cp[4]";
connectAttr "m_feather_end_poserOrientShape.wp" "posers_curve_Shape1.cp[5]";
connectAttr "lines_sweepMeshCreator.outMeshArray[0]" "posers_curve_1_sweepMeshShape.i"
		;
connectAttr "l_feather_1_1_poserOrientShape.wp" "posers_curve_Shape2.cp[0]";
connectAttr "l_feather_1_2_poserOrientShape.wp" "posers_curve_Shape2.cp[1]";
connectAttr "l_feather_1_3_poserOrientShape.wp" "posers_curve_Shape2.cp[2]";
connectAttr "l_feather_1_4_poserOrientShape.wp" "posers_curve_Shape2.cp[3]";
connectAttr "l_feather_1_5_poserOrientShape.wp" "posers_curve_Shape2.cp[4]";
connectAttr "l_feather_1_end_poserOrientShape.wp" "posers_curve_Shape2.cp[5]";
connectAttr "lines_sweepMeshCreator.outMeshArray[1]" "posers_curve_2_sweepMeshShape.i"
		;
connectAttr "l_feather_2_1_poserOrientShape.wp" "posers_curve_Shape3.cp[0]";
connectAttr "l_feather_2_2_poserOrientShape.wp" "posers_curve_Shape3.cp[1]";
connectAttr "l_feather_2_3_poserOrientShape.wp" "posers_curve_Shape3.cp[2]";
connectAttr "l_feather_2_4_poserOrientShape.wp" "posers_curve_Shape3.cp[3]";
connectAttr "l_feather_2_5_poserOrientShape.wp" "posers_curve_Shape3.cp[4]";
connectAttr "l_feather_2_end_poserOrientShape.wp" "posers_curve_Shape3.cp[5]";
connectAttr "lines_sweepMeshCreator.outMeshArray[2]" "posers_curve_3_sweepMeshShape.i"
		;
connectAttr "l_feather_3_1_poserOrientShape.wp" "posers_curve_Shape4.cp[0]";
connectAttr "l_feather_3_2_poserOrientShape.wp" "posers_curve_Shape4.cp[1]";
connectAttr "l_feather_3_3_poserOrientShape.wp" "posers_curve_Shape4.cp[2]";
connectAttr "l_feather_3_4_poserOrientShape.wp" "posers_curve_Shape4.cp[3]";
connectAttr "l_feather_3_5_poserOrientShape.wp" "posers_curve_Shape4.cp[4]";
connectAttr "l_feather_3_end_poserOrientShape.wp" "posers_curve_Shape4.cp[5]";
connectAttr "lines_sweepMeshCreator.outMeshArray[3]" "posers_curve_4_sweepMeshShape.i"
		;
connectAttr "l_feather_4_1_poserOrientShape.wp" "posers_curve_Shape5.cp[0]";
connectAttr "l_feather_4_2_poserOrientShape.wp" "posers_curve_Shape5.cp[1]";
connectAttr "l_feather_4_3_poserOrientShape.wp" "posers_curve_Shape5.cp[2]";
connectAttr "l_feather_4_4_poserOrientShape.wp" "posers_curve_Shape5.cp[3]";
connectAttr "l_feather_4_5_poserOrientShape.wp" "posers_curve_Shape5.cp[4]";
connectAttr "l_feather_4_end_poserOrientShape.wp" "posers_curve_Shape5.cp[5]";
connectAttr "lines_sweepMeshCreator.outMeshArray[4]" "posers_curve_5_sweepMeshShape.i"
		;
connectAttr "l_feather_5_1_poserOrientShape.wp" "posers_curve_Shape6.cp[0]";
connectAttr "l_feather_5_2_poserOrientShape.wp" "posers_curve_Shape6.cp[1]";
connectAttr "l_feather_5_3_poserOrientShape.wp" "posers_curve_Shape6.cp[2]";
connectAttr "l_feather_5_4_poserOrientShape.wp" "posers_curve_Shape6.cp[3]";
connectAttr "l_feather_5_5_poserOrientShape.wp" "posers_curve_Shape6.cp[4]";
connectAttr "l_feather_5_end_poserOrientShape.wp" "posers_curve_Shape6.cp[5]";
connectAttr "lines_sweepMeshCreator.outMeshArray[5]" "posers_curve_6_sweepMeshShape.i"
		;
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "base_group_multMat.o" "base_group.opm";
connectAttr "main_1_group_multMat.o" "main_1_group.opm";
connectAttr "main_2_group_multMat.o" "main_2_group.opm";
connectAttr "main_3_group_multMat.o" "main_3_group.opm";
connectAttr "main_4_group_multMat.o" "main_4_group.opm";
connectAttr "feathers_group_multMat.o" "feathers_group.opm";
connectAttr "feathers.featherControls" "feather_controls.v";
connectAttr "m_feather_1_group_multMat.o" "m_feather_1_group.opm";
connectAttr "m_feather_2_group_multMat.o" "m_feather_2_group.opm";
connectAttr "feathers_mid_rotation.oz" "m_feather_2_bendGroup.rz";
connectAttr "m_feather_2_mainGroup_multMat.o" "m_feather_2_mainGroup.opm";
connectAttr "m_feather_3_group_multMat.o" "m_feather_3_group.opm";
connectAttr "feathers_mid_rotation.oz" "m_feather_3_bendGroup.rz";
connectAttr "m_feather_3_mainGroup_multMat.o" "m_feather_3_mainGroup.opm";
connectAttr "m_feather_4_group_multMat.o" "m_feather_4_group.opm";
connectAttr "feathers_mid_rotation.oz" "m_feather_4_bendGroup.rz";
connectAttr "m_feather_4_mainGroup_multMat.o" "m_feather_4_mainGroup.opm";
connectAttr "m_feather_5_group_multMat.o" "m_feather_5_group.opm";
connectAttr "feathers_mid_rotation.oz" "m_feather_5_bendGroup.rz";
connectAttr "m_feather_5_mainGroup_multMat.o" "m_feather_5_mainGroup.opm";
connectAttr "l_feather_1_1_group_multMat.o" "l_feather_1_1_group.opm";
connectAttr "feather_1_rootRotation.oy" "l_feather_1_1_spreadRootGroup.ry";
connectAttr "feather_1_rotation.ox" "l_feather_1_1_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "l_feather_1_1_spreadGroup.rz";
connectAttr "l_feather_1_1_rollGroup_multMat.o" "l_feather_1_1_rollGroup.opm";
connectAttr "l_feather_1_2_group_multMat.o" "l_feather_1_2_group.opm";
connectAttr "feather_1_rotation.ox" "l_feather_1_2_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "l_feather_1_2_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "l_feather_1_2_bendGroup.rz";
connectAttr "l_feather_1_2_mainGroup_multMat.o" "l_feather_1_2_mainGroup.opm";
connectAttr "l_feather_1_2_rollGroup_multMat.o" "l_feather_1_2_rollGroup.opm";
connectAttr "l_feather_1_3_group_multMat.o" "l_feather_1_3_group.opm";
connectAttr "feather_1_rotation.ox" "l_feather_1_3_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "l_feather_1_3_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "l_feather_1_3_bendGroup.rz";
connectAttr "l_feather_1_3_mainGroup_multMat.o" "l_feather_1_3_mainGroup.opm";
connectAttr "l_feather_1_3_rollGroup_multMat.o" "l_feather_1_3_rollGroup.opm";
connectAttr "l_feather_1_4_group_multMat.o" "l_feather_1_4_group.opm";
connectAttr "feather_1_rotation.ox" "l_feather_1_4_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "l_feather_1_4_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "l_feather_1_4_bendGroup.rz";
connectAttr "l_feather_1_4_mainGroup_multMat.o" "l_feather_1_4_mainGroup.opm";
connectAttr "l_feather_1_4_rollGroup_multMat.o" "l_feather_1_4_rollGroup.opm";
connectAttr "l_feather_1_5_group_multMat.o" "l_feather_1_5_group.opm";
connectAttr "feather_1_rotation.ox" "l_feather_1_5_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "l_feather_1_5_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "l_feather_1_5_bendGroup.rz";
connectAttr "l_feather_1_5_mainGroup_multMat.o" "l_feather_1_5_mainGroup.opm";
connectAttr "l_feather_1_5_rollGroup_multMat.o" "l_feather_1_5_rollGroup.opm";
connectAttr "l_feather_2_1_group_multMat.o" "l_feather_2_1_group.opm";
connectAttr "feather_2_rootRotation.oy" "l_feather_2_1_spreadRootGroup.ry";
connectAttr "feather_2_rotation.ox" "l_feather_2_1_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "l_feather_2_1_spreadGroup.rz";
connectAttr "l_feather_2_1_rollGroup_multMat.o" "l_feather_2_1_rollGroup.opm";
connectAttr "l_feather_2_2_group_multMat.o" "l_feather_2_2_group.opm";
connectAttr "feather_2_rotation.ox" "l_feather_2_2_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "l_feather_2_2_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "l_feather_2_2_bendGroup.rz";
connectAttr "l_feather_2_2_mainGroup_multMat.o" "l_feather_2_2_mainGroup.opm";
connectAttr "l_feather_2_2_rollGroup_multMat.o" "l_feather_2_2_rollGroup.opm";
connectAttr "l_feather_2_3_group_multMat.o" "l_feather_2_3_group.opm";
connectAttr "feather_2_rotation.ox" "l_feather_2_3_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "l_feather_2_3_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "l_feather_2_3_bendGroup.rz";
connectAttr "l_feather_2_3_mainGroup_multMat.o" "l_feather_2_3_mainGroup.opm";
connectAttr "l_feather_2_3_rollGroup_multMat.o" "l_feather_2_3_rollGroup.opm";
connectAttr "l_feather_2_4_group_multMat.o" "l_feather_2_4_group.opm";
connectAttr "feather_2_rotation.ox" "l_feather_2_4_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "l_feather_2_4_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "l_feather_2_4_bendGroup.rz";
connectAttr "l_feather_2_4_mainGroup_multMat.o" "l_feather_2_4_mainGroup.opm";
connectAttr "l_feather_2_4_rollGroup_multMat.o" "l_feather_2_4_rollGroup.opm";
connectAttr "l_feather_2_5_group_multMat.o" "l_feather_2_5_group.opm";
connectAttr "feather_2_rotation.ox" "l_feather_2_5_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "l_feather_2_5_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "l_feather_2_5_bendGroup.rz";
connectAttr "l_feather_2_5_mainGroup_multMat.o" "l_feather_2_5_mainGroup.opm";
connectAttr "l_feather_2_5_rollGroup_multMat.o" "l_feather_2_5_rollGroup.opm";
connectAttr "l_feather_3_1_group_multMat.o" "l_feather_3_1_group.opm";
connectAttr "feather_3_rootRotation.oy" "l_feather_3_1_spreadRootGroup.ry";
connectAttr "feather_3_rotation.ox" "l_feather_3_1_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "l_feather_3_1_spreadGroup.rz";
connectAttr "l_feather_3_1_rollGroup_multMat.o" "l_feather_3_1_rollGroup.opm";
connectAttr "l_feather_3_2_group_multMat.o" "l_feather_3_2_group.opm";
connectAttr "feather_3_rotation.ox" "l_feather_3_2_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "l_feather_3_2_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "l_feather_3_2_bendGroup.rz";
connectAttr "l_feather_3_2_mainGroup_multMat.o" "l_feather_3_2_mainGroup.opm";
connectAttr "l_feather_3_2_rollGroup_multMat.o" "l_feather_3_2_rollGroup.opm";
connectAttr "l_feather_3_3_group_multMat.o" "l_feather_3_3_group.opm";
connectAttr "feather_3_rotation.ox" "l_feather_3_3_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "l_feather_3_3_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "l_feather_3_3_bendGroup.rz";
connectAttr "l_feather_3_3_mainGroup_multMat.o" "l_feather_3_3_mainGroup.opm";
connectAttr "l_feather_3_3_rollGroup_multMat.o" "l_feather_3_3_rollGroup.opm";
connectAttr "l_feather_3_4_group_multMat.o" "l_feather_3_4_group.opm";
connectAttr "feather_3_rotation.ox" "l_feather_3_4_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "l_feather_3_4_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "l_feather_3_4_bendGroup.rz";
connectAttr "l_feather_3_4_mainGroup_multMat.o" "l_feather_3_4_mainGroup.opm";
connectAttr "l_feather_3_4_rollGroup_multMat.o" "l_feather_3_4_rollGroup.opm";
connectAttr "l_feather_3_5_group_multMat.o" "l_feather_3_5_group.opm";
connectAttr "feather_3_rotation.ox" "l_feather_3_5_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "l_feather_3_5_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "l_feather_3_5_bendGroup.rz";
connectAttr "l_feather_3_5_mainGroup_multMat.o" "l_feather_3_5_mainGroup.opm";
connectAttr "l_feather_3_5_rollGroup_multMat.o" "l_feather_3_5_rollGroup.opm";
connectAttr "l_feather_4_1_group_multMat.o" "l_feather_4_1_group.opm";
connectAttr "feather_4_rootRotation.oy" "l_feather_4_1_spreadRootGroup.ry";
connectAttr "feather_4_rotation.ox" "l_feather_4_1_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "l_feather_4_1_spreadGroup.rz";
connectAttr "l_feather_4_1_rollGroup_multMat.o" "l_feather_4_1_rollGroup.opm";
connectAttr "l_feather_4_2_group_multMat.o" "l_feather_4_2_group.opm";
connectAttr "feather_4_rotation.ox" "l_feather_4_2_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "l_feather_4_2_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "l_feather_4_2_bendGroup.rz";
connectAttr "l_feather_4_2_mainGroup_multMat.o" "l_feather_4_2_mainGroup.opm";
connectAttr "l_feather_4_2_rollGroup_multMat.o" "l_feather_4_2_rollGroup.opm";
connectAttr "l_feather_4_3_group_multMat.o" "l_feather_4_3_group.opm";
connectAttr "feather_4_rotation.ox" "l_feather_4_3_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "l_feather_4_3_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "l_feather_4_3_bendGroup.rz";
connectAttr "l_feather_4_3_mainGroup_multMat.o" "l_feather_4_3_mainGroup.opm";
connectAttr "l_feather_4_3_rollGroup_multMat.o" "l_feather_4_3_rollGroup.opm";
connectAttr "l_feather_4_4_group_multMat.o" "l_feather_4_4_group.opm";
connectAttr "feather_4_rotation.ox" "l_feather_4_4_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "l_feather_4_4_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "l_feather_4_4_bendGroup.rz";
connectAttr "l_feather_4_4_mainGroup_multMat.o" "l_feather_4_4_mainGroup.opm";
connectAttr "l_feather_4_4_rollGroup_multMat.o" "l_feather_4_4_rollGroup.opm";
connectAttr "l_feather_4_5_group_multMat.o" "l_feather_4_5_group.opm";
connectAttr "feather_4_rotation.ox" "l_feather_4_5_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "l_feather_4_5_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "l_feather_4_5_bendGroup.rz";
connectAttr "l_feather_4_5_mainGroup_multMat.o" "l_feather_4_5_mainGroup.opm";
connectAttr "l_feather_4_5_rollGroup_multMat.o" "l_feather_4_5_rollGroup.opm";
connectAttr "l_feather_5_1_group_multMat.o" "l_feather_5_1_group.opm";
connectAttr "feather_5_rootRotation.oy" "l_feather_5_1_spreadRootGroup.ry";
connectAttr "feather_5_rotation.ox" "l_feather_5_1_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "l_feather_5_1_spreadGroup.rz";
connectAttr "l_feather_5_1_rollGroup_multMat.o" "l_feather_5_1_rollGroup.opm";
connectAttr "l_feather_5_2_group_multMat.o" "l_feather_5_2_group.opm";
connectAttr "feather_5_rotation.ox" "l_feather_5_2_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "l_feather_5_2_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "l_feather_5_2_bendGroup.rz";
connectAttr "l_feather_5_2_mainGroup_multMat.o" "l_feather_5_2_mainGroup.opm";
connectAttr "l_feather_5_2_rollGroup_multMat.o" "l_feather_5_2_rollGroup.opm";
connectAttr "l_feather_5_3_group_multMat.o" "l_feather_5_3_group.opm";
connectAttr "feather_5_rotation.ox" "l_feather_5_3_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "l_feather_5_3_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "l_feather_5_3_bendGroup.rz";
connectAttr "l_feather_5_3_mainGroup_multMat.o" "l_feather_5_3_mainGroup.opm";
connectAttr "l_feather_5_3_rollGroup_multMat.o" "l_feather_5_3_rollGroup.opm";
connectAttr "l_feather_5_4_group_multMat.o" "l_feather_5_4_group.opm";
connectAttr "feather_5_rotation.ox" "l_feather_5_4_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "l_feather_5_4_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "l_feather_5_4_bendGroup.rz";
connectAttr "l_feather_5_4_mainGroup_multMat.o" "l_feather_5_4_mainGroup.opm";
connectAttr "l_feather_5_4_rollGroup_multMat.o" "l_feather_5_4_rollGroup.opm";
connectAttr "l_feather_5_5_group_multMat.o" "l_feather_5_5_group.opm";
connectAttr "feather_5_rotation.ox" "l_feather_5_5_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "l_feather_5_5_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "l_feather_5_5_bendGroup.rz";
connectAttr "l_feather_5_5_mainGroup_multMat.o" "l_feather_5_5_mainGroup.opm";
connectAttr "l_feather_5_5_rollGroup_multMat.o" "l_feather_5_5_rollGroup.opm";
connectAttr "r_feather_1_1_group_multMat.o" "r_feather_1_1_group.opm";
connectAttr "feather_1_rootRotation.oy" "r_feather_1_1_spreadRootGroup.ry";
connectAttr "feather_1_rotation.ox" "r_feather_1_1_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "r_feather_1_1_spreadGroup.rz";
connectAttr "l_feather_1_1_rollGroup_multMat.o" "r_feather_1_1_rollGroup.opm";
connectAttr "l_feather_1_2_group_multMat.o" "r_feather_1_2_group.opm";
connectAttr "feather_1_rotation.ox" "r_feather_1_2_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "r_feather_1_2_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "r_feather_1_2_bendGroup.rz";
connectAttr "r_feather_1_2_mainGroup_multMat.o" "r_feather_1_2_mainGroup.opm";
connectAttr "l_feather_1_2_rollGroup_multMat.o" "r_feather_1_2_rollGroup.opm";
connectAttr "l_feather_1_3_group_multMat.o" "r_feather_1_3_group.opm";
connectAttr "feather_1_rotation.ox" "r_feather_1_3_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "r_feather_1_3_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "r_feather_1_3_bendGroup.rz";
connectAttr "r_feather_1_3_mainGroup_multMat.o" "r_feather_1_3_mainGroup.opm";
connectAttr "l_feather_1_3_rollGroup_multMat.o" "r_feather_1_3_rollGroup.opm";
connectAttr "l_feather_1_4_group_multMat.o" "r_feather_1_4_group.opm";
connectAttr "feather_1_rotation.ox" "r_feather_1_4_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "r_feather_1_4_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "r_feather_1_4_bendGroup.rz";
connectAttr "r_feather_1_4_mainGroup_multMat.o" "r_feather_1_4_mainGroup.opm";
connectAttr "l_feather_1_4_rollGroup_multMat.o" "r_feather_1_4_rollGroup.opm";
connectAttr "l_feather_1_5_group_multMat.o" "r_feather_1_5_group.opm";
connectAttr "feather_1_rotation.ox" "r_feather_1_5_spreadGroup.ry";
connectAttr "feather_1_rotation.oy" "r_feather_1_5_spreadGroup.rz";
connectAttr "feather_1_rotation.oz" "r_feather_1_5_bendGroup.rz";
connectAttr "r_feather_1_5_mainGroup_multMat.o" "r_feather_1_5_mainGroup.opm";
connectAttr "l_feather_1_5_rollGroup_multMat.o" "r_feather_1_5_rollGroup.opm";
connectAttr "r_feather_2_1_group_multMat.o" "r_feather_2_1_group.opm";
connectAttr "feather_2_rootRotation.oy" "r_feather_2_1_spreadRootGroup.ry";
connectAttr "feather_2_rotation.ox" "r_feather_2_1_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "r_feather_2_1_spreadGroup.rz";
connectAttr "l_feather_2_1_rollGroup_multMat.o" "r_feather_2_1_rollGroup.opm";
connectAttr "l_feather_2_2_group_multMat.o" "r_feather_2_2_group.opm";
connectAttr "feather_2_rotation.ox" "r_feather_2_2_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "r_feather_2_2_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "r_feather_2_2_bendGroup.rz";
connectAttr "r_feather_2_2_mainGroup_multMat.o" "r_feather_2_2_mainGroup.opm";
connectAttr "l_feather_2_2_rollGroup_multMat.o" "r_feather_2_2_rollGroup.opm";
connectAttr "l_feather_2_3_group_multMat.o" "r_feather_2_3_group.opm";
connectAttr "feather_2_rotation.ox" "r_feather_2_3_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "r_feather_2_3_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "r_feather_2_3_bendGroup.rz";
connectAttr "r_feather_2_3_mainGroup_multMat.o" "r_feather_2_3_mainGroup.opm";
connectAttr "l_feather_2_3_rollGroup_multMat.o" "r_feather_2_3_rollGroup.opm";
connectAttr "l_feather_2_4_group_multMat.o" "r_feather_2_4_group.opm";
connectAttr "feather_2_rotation.ox" "r_feather_2_4_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "r_feather_2_4_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "r_feather_2_4_bendGroup.rz";
connectAttr "r_feather_2_4_mainGroup_multMat.o" "r_feather_2_4_mainGroup.opm";
connectAttr "l_feather_2_4_rollGroup_multMat.o" "r_feather_2_4_rollGroup.opm";
connectAttr "l_feather_2_5_group_multMat.o" "r_feather_2_5_group.opm";
connectAttr "feather_2_rotation.ox" "r_feather_2_5_spreadGroup.ry";
connectAttr "feather_2_rotation.oy" "r_feather_2_5_spreadGroup.rz";
connectAttr "feather_2_rotation.oz" "r_feather_2_5_bendGroup.rz";
connectAttr "r_feather_2_5_mainGroup_multMat.o" "r_feather_2_5_mainGroup.opm";
connectAttr "l_feather_2_5_rollGroup_multMat.o" "r_feather_2_5_rollGroup.opm";
connectAttr "r_feather_3_1_group_multMat.o" "r_feather_3_1_group.opm";
connectAttr "feather_3_rootRotation.oy" "r_feather_3_1_spreadRootGroup.ry";
connectAttr "feather_3_rotation.ox" "r_feather_3_1_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "r_feather_3_1_spreadGroup.rz";
connectAttr "l_feather_3_1_rollGroup_multMat.o" "r_feather_3_1_rollGroup.opm";
connectAttr "l_feather_3_2_group_multMat.o" "r_feather_3_2_group.opm";
connectAttr "feather_3_rotation.ox" "r_feather_3_2_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "r_feather_3_2_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "r_feather_3_2_bendGroup.rz";
connectAttr "r_feather_3_2_mainGroup_multMat.o" "r_feather_3_2_mainGroup.opm";
connectAttr "l_feather_3_2_rollGroup_multMat.o" "r_feather_3_2_rollGroup.opm";
connectAttr "l_feather_3_3_group_multMat.o" "r_feather_3_3_group.opm";
connectAttr "feather_3_rotation.ox" "r_feather_3_3_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "r_feather_3_3_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "r_feather_3_3_bendGroup.rz";
connectAttr "r_feather_3_3_mainGroup_multMat.o" "r_feather_3_3_mainGroup.opm";
connectAttr "l_feather_3_3_rollGroup_multMat.o" "r_feather_3_3_rollGroup.opm";
connectAttr "l_feather_3_4_group_multMat.o" "r_feather_3_4_group.opm";
connectAttr "feather_3_rotation.ox" "r_feather_3_4_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "r_feather_3_4_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "r_feather_3_4_bendGroup.rz";
connectAttr "r_feather_3_4_mainGroup_multMat.o" "r_feather_3_4_mainGroup.opm";
connectAttr "l_feather_3_4_rollGroup_multMat.o" "r_feather_3_4_rollGroup.opm";
connectAttr "l_feather_3_5_group_multMat.o" "r_feather_3_5_group.opm";
connectAttr "feather_3_rotation.ox" "r_feather_3_5_spreadGroup.ry";
connectAttr "feather_3_rotation.oy" "r_feather_3_5_spreadGroup.rz";
connectAttr "feather_3_rotation.oz" "r_feather_3_5_bendGroup.rz";
connectAttr "r_feather_3_5_mainGroup_multMat.o" "r_feather_3_5_mainGroup.opm";
connectAttr "l_feather_3_5_rollGroup_multMat.o" "r_feather_3_5_rollGroup.opm";
connectAttr "r_feather_4_1_group_multMat.o" "r_feather_4_1_group.opm";
connectAttr "feather_4_rootRotation.oy" "r_feather_4_1_spreadRootGroup.ry";
connectAttr "feather_4_rotation.ox" "r_feather_4_1_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "r_feather_4_1_spreadGroup.rz";
connectAttr "l_feather_4_1_rollGroup_multMat.o" "r_feather_4_1_rollGroup.opm";
connectAttr "l_feather_4_2_group_multMat.o" "r_feather_4_2_group.opm";
connectAttr "feather_4_rotation.ox" "r_feather_4_2_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "r_feather_4_2_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "r_feather_4_2_bendGroup.rz";
connectAttr "r_feather_4_2_mainGroup_multMat.o" "r_feather_4_2_mainGroup.opm";
connectAttr "l_feather_4_2_rollGroup_multMat.o" "r_feather_4_2_rollGroup.opm";
connectAttr "l_feather_4_3_group_multMat.o" "r_feather_4_3_group.opm";
connectAttr "feather_4_rotation.ox" "r_feather_4_3_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "r_feather_4_3_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "r_feather_4_3_bendGroup.rz";
connectAttr "r_feather_4_3_mainGroup_multMat.o" "r_feather_4_3_mainGroup.opm";
connectAttr "l_feather_4_3_rollGroup_multMat.o" "r_feather_4_3_rollGroup.opm";
connectAttr "l_feather_4_4_group_multMat.o" "r_feather_4_4_group.opm";
connectAttr "feather_4_rotation.ox" "r_feather_4_4_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "r_feather_4_4_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "r_feather_4_4_bendGroup.rz";
connectAttr "r_feather_4_4_mainGroup_multMat.o" "r_feather_4_4_mainGroup.opm";
connectAttr "l_feather_4_4_rollGroup_multMat.o" "r_feather_4_4_rollGroup.opm";
connectAttr "l_feather_4_5_group_multMat.o" "r_feather_4_5_group.opm";
connectAttr "feather_4_rotation.ox" "r_feather_4_5_spreadGroup.ry";
connectAttr "feather_4_rotation.oy" "r_feather_4_5_spreadGroup.rz";
connectAttr "feather_4_rotation.oz" "r_feather_4_5_bendGroup.rz";
connectAttr "r_feather_4_5_mainGroup_multMat.o" "r_feather_4_5_mainGroup.opm";
connectAttr "l_feather_4_5_rollGroup_multMat.o" "r_feather_4_5_rollGroup.opm";
connectAttr "r_feather_5_1_group_multMat.o" "r_feather_5_1_group.opm";
connectAttr "feather_5_rootRotation.oy" "r_feather_5_1_spreadRootGroup.ry";
connectAttr "feather_5_rotation.ox" "r_feather_5_1_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "r_feather_5_1_spreadGroup.rz";
connectAttr "l_feather_5_1_rollGroup_multMat.o" "r_feather_5_1_rollGroup.opm";
connectAttr "l_feather_5_2_group_multMat.o" "r_feather_5_2_group.opm";
connectAttr "feather_5_rotation.ox" "r_feather_5_2_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "r_feather_5_2_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "r_feather_5_2_bendGroup.rz";
connectAttr "r_feather_5_2_mainGroup_multMat.o" "r_feather_5_2_mainGroup.opm";
connectAttr "l_feather_5_2_rollGroup_multMat.o" "r_feather_5_2_rollGroup.opm";
connectAttr "l_feather_5_3_group_multMat.o" "r_feather_5_3_group.opm";
connectAttr "feather_5_rotation.ox" "r_feather_5_3_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "r_feather_5_3_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "r_feather_5_3_bendGroup.rz";
connectAttr "r_feather_5_3_mainGroup_multMat.o" "r_feather_5_3_mainGroup.opm";
connectAttr "l_feather_5_3_rollGroup_multMat.o" "r_feather_5_3_rollGroup.opm";
connectAttr "l_feather_5_4_group_multMat.o" "r_feather_5_4_group.opm";
connectAttr "feather_5_rotation.ox" "r_feather_5_4_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "r_feather_5_4_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "r_feather_5_4_bendGroup.rz";
connectAttr "r_feather_5_4_mainGroup_multMat.o" "r_feather_5_4_mainGroup.opm";
connectAttr "l_feather_5_4_rollGroup_multMat.o" "r_feather_5_4_rollGroup.opm";
connectAttr "l_feather_5_5_group_multMat.o" "r_feather_5_5_group.opm";
connectAttr "feather_5_rotation.ox" "r_feather_5_5_spreadGroup.ry";
connectAttr "feather_5_rotation.oy" "r_feather_5_5_spreadGroup.rz";
connectAttr "feather_5_rotation.oz" "r_feather_5_5_bendGroup.rz";
connectAttr "r_feather_5_5_mainGroup_multMat.o" "r_feather_5_5_mainGroup.opm";
connectAttr "l_feather_5_5_rollGroup_multMat.o" "r_feather_5_5_rollGroup.opm";
connectAttr "outJoints_mirror_multiplyDivide.o" "outJoints.s";
connectAttr "root_outJoint_decMat.ot" "root_outJoint.t";
connectAttr "root_outJoint_decMat.or" "root_outJoint.r";
connectAttr "root_outJoint_decMat.os" "root_outJoint.s";
connectAttr "m_feather_1_outJoint_decMat.ot" "m_feather_1_outJoint.t";
connectAttr "m_feather_1_outJoint_decMat.or" "m_feather_1_outJoint.r";
connectAttr "m_feather_1_outJoint_decMat.os" "m_feather_1_outJoint.s";
connectAttr "m_feather_2_outJoint_decMat.ot" "m_feather_2_outJoint.t";
connectAttr "m_feather_2_outJoint_decMat.or" "m_feather_2_outJoint.r";
connectAttr "m_feather_2_outJoint_decMat.os" "m_feather_2_outJoint.s";
connectAttr "m_feather_3_outJoint_decMat.ot" "m_feather_3_outJoint.t";
connectAttr "m_feather_3_outJoint_decMat.or" "m_feather_3_outJoint.r";
connectAttr "m_feather_3_outJoint_decMat.os" "m_feather_3_outJoint.s";
connectAttr "m_feather_4_outJoint_decMat.ot" "m_feather_4_outJoint.t";
connectAttr "m_feather_4_outJoint_decMat.or" "m_feather_4_outJoint.r";
connectAttr "m_feather_4_outJoint_decMat.os" "m_feather_4_outJoint.s";
connectAttr "m_feather_5_outJoint_decMat.ot" "m_feather_5_outJoint.t";
connectAttr "m_feather_5_outJoint_decMat.or" "m_feather_5_outJoint.r";
connectAttr "m_feather_5_outJoint_decMat.os" "m_feather_5_outJoint.s";
connectAttr "m_feather_end_decMat.ot" "m_feather_end_outJoint.t";
connectAttr "l_feather_1_1_outJoint_decMat.ot" "l_feather_1_1_outJoint.t";
connectAttr "l_feather_1_1_outJoint_decMat.or" "l_feather_1_1_outJoint.r";
connectAttr "l_feather_1_1_outJoint_decMat.os" "l_feather_1_1_outJoint.s";
connectAttr "l_feather_1_2_outJoint_decMat.ot" "l_feather_1_2_outJoint.t";
connectAttr "l_feather_1_2_outJoint_decMat.or" "l_feather_1_2_outJoint.r";
connectAttr "l_feather_1_2_outJoint_decMat.os" "l_feather_1_2_outJoint.s";
connectAttr "l_feather_1_3_outJoint_decMat.ot" "l_feather_1_3_outJoint.t";
connectAttr "l_feather_1_3_outJoint_decMat.or" "l_feather_1_3_outJoint.r";
connectAttr "l_feather_1_3_outJoint_decMat.os" "l_feather_1_3_outJoint.s";
connectAttr "l_feather_1_4_outJoint_decMat.ot" "l_feather_1_4_outJoint.t";
connectAttr "l_feather_1_4_outJoint_decMat.or" "l_feather_1_4_outJoint.r";
connectAttr "l_feather_1_4_outJoint_decMat.os" "l_feather_1_4_outJoint.s";
connectAttr "l_feather_1_5_outJoint_decMat.ot" "l_feather_1_5_outJoint.t";
connectAttr "l_feather_1_5_outJoint_decMat.or" "l_feather_1_5_outJoint.r";
connectAttr "l_feather_1_5_outJoint_decMat.os" "l_feather_1_5_outJoint.s";
connectAttr "l_feather_1_end_decMat.ot" "l_feather_1_end_outJoint.t";
connectAttr "l_feather_2_1_outJoint_decMat.ot" "l_feather_2_1_outJoint.t";
connectAttr "l_feather_2_1_outJoint_decMat.or" "l_feather_2_1_outJoint.r";
connectAttr "l_feather_2_1_outJoint_decMat.os" "l_feather_2_1_outJoint.s";
connectAttr "l_feather_2_2_outJoint_decMat.ot" "l_feather_2_2_outJoint.t";
connectAttr "l_feather_2_2_outJoint_decMat.or" "l_feather_2_2_outJoint.r";
connectAttr "l_feather_2_2_outJoint_decMat.os" "l_feather_2_2_outJoint.s";
connectAttr "l_feather_2_3_outJoint_decMat.ot" "l_feather_2_3_outJoint.t";
connectAttr "l_feather_2_3_outJoint_decMat.or" "l_feather_2_3_outJoint.r";
connectAttr "l_feather_2_3_outJoint_decMat.os" "l_feather_2_3_outJoint.s";
connectAttr "l_feather_2_4_outJoint_decMat.ot" "l_feather_2_4_outJoint.t";
connectAttr "l_feather_2_4_outJoint_decMat.or" "l_feather_2_4_outJoint.r";
connectAttr "l_feather_2_4_outJoint_decMat.os" "l_feather_2_4_outJoint.s";
connectAttr "l_feather_2_5_outJoint_decMat.ot" "l_feather_2_5_outJoint.t";
connectAttr "l_feather_2_5_outJoint_decMat.or" "l_feather_2_5_outJoint.r";
connectAttr "l_feather_2_5_outJoint_decMat.os" "l_feather_2_5_outJoint.s";
connectAttr "l_feather_2_end_decMat.ot" "l_feather_2_end_outJoint.t";
connectAttr "l_feather_3_1_outJoint_decMat.ot" "l_feather_3_1_outJoint.t";
connectAttr "l_feather_3_1_outJoint_decMat.or" "l_feather_3_1_outJoint.r";
connectAttr "l_feather_3_1_outJoint_decMat.os" "l_feather_3_1_outJoint.s";
connectAttr "l_feather_3_2_outJoint_decMat.ot" "l_feather_3_2_outJoint.t";
connectAttr "l_feather_3_2_outJoint_decMat.or" "l_feather_3_2_outJoint.r";
connectAttr "l_feather_3_2_outJoint_decMat.os" "l_feather_3_2_outJoint.s";
connectAttr "l_feather_3_3_outJoint_decMat.ot" "l_feather_3_3_outJoint.t";
connectAttr "l_feather_3_3_outJoint_decMat.or" "l_feather_3_3_outJoint.r";
connectAttr "l_feather_3_3_outJoint_decMat.os" "l_feather_3_3_outJoint.s";
connectAttr "l_feather_3_4_outJoint_decMat.ot" "l_feather_3_4_outJoint.t";
connectAttr "l_feather_3_4_outJoint_decMat.or" "l_feather_3_4_outJoint.r";
connectAttr "l_feather_3_4_outJoint_decMat.os" "l_feather_3_4_outJoint.s";
connectAttr "l_feather_3_5_outJoint_decMat.ot" "l_feather_3_5_outJoint.t";
connectAttr "l_feather_3_5_outJoint_decMat.or" "l_feather_3_5_outJoint.r";
connectAttr "l_feather_3_5_outJoint_decMat.os" "l_feather_3_5_outJoint.s";
connectAttr "l_feather_3_end_decMat.ot" "l_feather_3_end_outJoint.t";
connectAttr "l_feather_4_1_outJoint_decMat.ot" "l_feather_4_1_outJoint.t";
connectAttr "l_feather_4_1_outJoint_decMat.or" "l_feather_4_1_outJoint.r";
connectAttr "l_feather_4_1_outJoint_decMat.os" "l_feather_4_1_outJoint.s";
connectAttr "l_feather_4_2_outJoint_decMat.ot" "l_feather_4_2_outJoint.t";
connectAttr "l_feather_4_2_outJoint_decMat.or" "l_feather_4_2_outJoint.r";
connectAttr "l_feather_4_2_outJoint_decMat.os" "l_feather_4_2_outJoint.s";
connectAttr "l_feather_4_3_outJoint_decMat.ot" "l_feather_4_3_outJoint.t";
connectAttr "l_feather_4_3_outJoint_decMat.or" "l_feather_4_3_outJoint.r";
connectAttr "l_feather_4_3_outJoint_decMat.os" "l_feather_4_3_outJoint.s";
connectAttr "l_feather_4_4_outJoint_decMat.ot" "l_feather_4_4_outJoint.t";
connectAttr "l_feather_4_4_outJoint_decMat.or" "l_feather_4_4_outJoint.r";
connectAttr "l_feather_4_4_outJoint_decMat.os" "l_feather_4_4_outJoint.s";
connectAttr "l_feather_4_5_outJoint_decMat.ot" "l_feather_4_5_outJoint.t";
connectAttr "l_feather_4_5_outJoint_decMat.or" "l_feather_4_5_outJoint.r";
connectAttr "l_feather_4_5_outJoint_decMat.os" "l_feather_4_5_outJoint.s";
connectAttr "l_feather_4_end_decMat.ot" "l_feather_4_end_outJoint.t";
connectAttr "l_feather_5_1_outJoint_decMat.ot" "l_feather_5_1_outJoint.t";
connectAttr "l_feather_5_1_outJoint_decMat.or" "l_feather_5_1_outJoint.r";
connectAttr "l_feather_5_1_outJoint_decMat.os" "l_feather_5_1_outJoint.s";
connectAttr "l_feather_5_2_outJoint_decMat.ot" "l_feather_5_2_outJoint.t";
connectAttr "l_feather_5_2_outJoint_decMat.or" "l_feather_5_2_outJoint.r";
connectAttr "l_feather_5_2_outJoint_decMat.os" "l_feather_5_2_outJoint.s";
connectAttr "l_feather_5_3_outJoint_decMat.ot" "l_feather_5_3_outJoint.t";
connectAttr "l_feather_5_3_outJoint_decMat.or" "l_feather_5_3_outJoint.r";
connectAttr "l_feather_5_3_outJoint_decMat.os" "l_feather_5_3_outJoint.s";
connectAttr "l_feather_5_4_outJoint_decMat.ot" "l_feather_5_4_outJoint.t";
connectAttr "l_feather_5_4_outJoint_decMat.or" "l_feather_5_4_outJoint.r";
connectAttr "l_feather_5_4_outJoint_decMat.os" "l_feather_5_4_outJoint.s";
connectAttr "l_feather_5_5_outJoint_decMat.ot" "l_feather_5_5_outJoint.t";
connectAttr "l_feather_5_5_outJoint_decMat.or" "l_feather_5_5_outJoint.r";
connectAttr "l_feather_5_5_outJoint_decMat.os" "l_feather_5_5_outJoint.s";
connectAttr "l_feather_5_end_decMat.ot" "l_feather_5_end_outJoint.t";
connectAttr "r_feather_1_1_outJoint_decMat.ot" "r_feather_1_1_outJoint.t";
connectAttr "r_feather_1_1_outJoint_decMat.or" "r_feather_1_1_outJoint.r";
connectAttr "r_feather_1_1_outJoint_decMat.os" "r_feather_1_1_outJoint.s";
connectAttr "r_feather_1_2_outJoint_decMat.ot" "r_feather_1_2_outJoint.t";
connectAttr "r_feather_1_2_outJoint_decMat.or" "r_feather_1_2_outJoint.r";
connectAttr "r_feather_1_2_outJoint_decMat.os" "r_feather_1_2_outJoint.s";
connectAttr "r_feather_1_3_outJoint_decMat.ot" "r_feather_1_3_outJoint.t";
connectAttr "r_feather_1_3_outJoint_decMat.or" "r_feather_1_3_outJoint.r";
connectAttr "r_feather_1_3_outJoint_decMat.os" "r_feather_1_3_outJoint.s";
connectAttr "r_feather_1_4_outJoint_decMat.ot" "r_feather_1_4_outJoint.t";
connectAttr "r_feather_1_4_outJoint_decMat.or" "r_feather_1_4_outJoint.r";
connectAttr "r_feather_1_4_outJoint_decMat.os" "r_feather_1_4_outJoint.s";
connectAttr "r_feather_1_5_outJoint_decMat.ot" "r_feather_1_5_outJoint.t";
connectAttr "r_feather_1_5_outJoint_decMat.or" "r_feather_1_5_outJoint.r";
connectAttr "r_feather_1_5_outJoint_decMat.os" "r_feather_1_5_outJoint.s";
connectAttr "l_feather_1_end_decMat.ot" "r_feather_1_end_outJoint.t";
connectAttr "r_feather_2_1_outJoint_decMat.ot" "r_feather_2_1_outJoint.t";
connectAttr "r_feather_2_1_outJoint_decMat.or" "r_feather_2_1_outJoint.r";
connectAttr "r_feather_2_1_outJoint_decMat.os" "r_feather_2_1_outJoint.s";
connectAttr "r_feather_2_2_outJoint_decMat.ot" "r_feather_2_2_outJoint.t";
connectAttr "r_feather_2_2_outJoint_decMat.or" "r_feather_2_2_outJoint.r";
connectAttr "r_feather_2_2_outJoint_decMat.os" "r_feather_2_2_outJoint.s";
connectAttr "r_feather_2_3_outJoint_decMat.ot" "r_feather_2_3_outJoint.t";
connectAttr "r_feather_2_3_outJoint_decMat.or" "r_feather_2_3_outJoint.r";
connectAttr "r_feather_2_3_outJoint_decMat.os" "r_feather_2_3_outJoint.s";
connectAttr "r_feather_2_4_outJoint_decMat.ot" "r_feather_2_4_outJoint.t";
connectAttr "r_feather_2_4_outJoint_decMat.or" "r_feather_2_4_outJoint.r";
connectAttr "r_feather_2_4_outJoint_decMat.os" "r_feather_2_4_outJoint.s";
connectAttr "r_feather_2_5_outJoint_decMat.ot" "r_feather_2_5_outJoint.t";
connectAttr "r_feather_2_5_outJoint_decMat.or" "r_feather_2_5_outJoint.r";
connectAttr "r_feather_2_5_outJoint_decMat.os" "r_feather_2_5_outJoint.s";
connectAttr "l_feather_2_end_decMat.ot" "r_feather_2_end_outJoint.t";
connectAttr "r_feather_3_1_outJoint_decMat.ot" "r_feather_3_1_outJoint.t";
connectAttr "r_feather_3_1_outJoint_decMat.or" "r_feather_3_1_outJoint.r";
connectAttr "r_feather_3_1_outJoint_decMat.os" "r_feather_3_1_outJoint.s";
connectAttr "r_feather_3_2_outJoint_decMat.ot" "r_feather_3_2_outJoint.t";
connectAttr "r_feather_3_2_outJoint_decMat.or" "r_feather_3_2_outJoint.r";
connectAttr "r_feather_3_2_outJoint_decMat.os" "r_feather_3_2_outJoint.s";
connectAttr "r_feather_3_3_outJoint_decMat.ot" "r_feather_3_3_outJoint.t";
connectAttr "r_feather_3_3_outJoint_decMat.or" "r_feather_3_3_outJoint.r";
connectAttr "r_feather_3_3_outJoint_decMat.os" "r_feather_3_3_outJoint.s";
connectAttr "r_feather_3_4_outJoint_decMat.ot" "r_feather_3_4_outJoint.t";
connectAttr "r_feather_3_4_outJoint_decMat.or" "r_feather_3_4_outJoint.r";
connectAttr "r_feather_3_4_outJoint_decMat.os" "r_feather_3_4_outJoint.s";
connectAttr "r_feather_3_5_outJoint_decMat.ot" "r_feather_3_5_outJoint.t";
connectAttr "r_feather_3_5_outJoint_decMat.or" "r_feather_3_5_outJoint.r";
connectAttr "r_feather_3_5_outJoint_decMat.os" "r_feather_3_5_outJoint.s";
connectAttr "l_feather_3_end_decMat.ot" "r_feather_3_end_outJoint.t";
connectAttr "r_feather_4_1_outJoint_decMat.ot" "r_feather_4_1_outJoint.t";
connectAttr "r_feather_4_1_outJoint_decMat.or" "r_feather_4_1_outJoint.r";
connectAttr "r_feather_4_1_outJoint_decMat.os" "r_feather_4_1_outJoint.s";
connectAttr "r_feather_4_2_outJoint_decMat.ot" "r_feather_4_2_outJoint.t";
connectAttr "r_feather_4_2_outJoint_decMat.or" "r_feather_4_2_outJoint.r";
connectAttr "r_feather_4_2_outJoint_decMat.os" "r_feather_4_2_outJoint.s";
connectAttr "r_feather_4_3_outJoint_decMat.ot" "r_feather_4_3_outJoint.t";
connectAttr "r_feather_4_3_outJoint_decMat.or" "r_feather_4_3_outJoint.r";
connectAttr "r_feather_4_3_outJoint_decMat.os" "r_feather_4_3_outJoint.s";
connectAttr "r_feather_4_4_outJoint_decMat.ot" "r_feather_4_4_outJoint.t";
connectAttr "r_feather_4_4_outJoint_decMat.or" "r_feather_4_4_outJoint.r";
connectAttr "r_feather_4_4_outJoint_decMat.os" "r_feather_4_4_outJoint.s";
connectAttr "r_feather_4_5_outJoint_decMat.ot" "r_feather_4_5_outJoint.t";
connectAttr "r_feather_4_5_outJoint_decMat.or" "r_feather_4_5_outJoint.r";
connectAttr "r_feather_4_5_outJoint_decMat.os" "r_feather_4_5_outJoint.s";
connectAttr "l_feather_4_end_decMat.ot" "r_feather_4_end_outJoint.t";
connectAttr "r_feather_5_1_outJoint_decMat.ot" "r_feather_5_1_outJoint.t";
connectAttr "r_feather_5_1_outJoint_decMat.or" "r_feather_5_1_outJoint.r";
connectAttr "r_feather_5_1_outJoint_decMat.os" "r_feather_5_1_outJoint.s";
connectAttr "r_feather_5_2_outJoint_decMat.ot" "r_feather_5_2_outJoint.t";
connectAttr "r_feather_5_2_outJoint_decMat.or" "r_feather_5_2_outJoint.r";
connectAttr "r_feather_5_2_outJoint_decMat.os" "r_feather_5_2_outJoint.s";
connectAttr "r_feather_5_3_outJoint_decMat.ot" "r_feather_5_3_outJoint.t";
connectAttr "r_feather_5_3_outJoint_decMat.or" "r_feather_5_3_outJoint.r";
connectAttr "r_feather_5_3_outJoint_decMat.os" "r_feather_5_3_outJoint.s";
connectAttr "r_feather_5_4_outJoint_decMat.ot" "r_feather_5_4_outJoint.t";
connectAttr "r_feather_5_4_outJoint_decMat.or" "r_feather_5_4_outJoint.r";
connectAttr "r_feather_5_4_outJoint_decMat.os" "r_feather_5_4_outJoint.s";
connectAttr "r_feather_5_5_outJoint_decMat.ot" "r_feather_5_5_outJoint.t";
connectAttr "r_feather_5_5_outJoint_decMat.or" "r_feather_5_5_outJoint.r";
connectAttr "r_feather_5_5_outJoint_decMat.os" "r_feather_5_5_outJoint.s";
connectAttr "l_feather_5_end_decMat.ot" "r_feather_5_end_outJoint.t";
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
connectAttr "green_rsSG.msg" "materialInfo2.sg";
connectAttr "blue_rsSG.msg" "materialInfo3.sg";
connectAttr "red_rsSG.msg" "materialInfo4.sg";
connectAttr "main_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "feathers_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "base.iog" "moduleControlSet.dsm" -na;
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
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
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "black_rsSG.msg" "materialInfo1.sg";
connectAttr "size_multiplyDivide.oy" "makeNurbSphere.r";
connectAttr "mainPoser.size" "size_multiplyDivide.i1x";
connectAttr "root_poser.size" "size_multiplyDivide.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "mainPoser_decomposeMatrix.osx" "lines_scale_multiplyDivide.i1x";
connectAttr "lines_size_multDoubleLinear.o" "lines_scale_multiplyDivide.i2x";
connectAttr "root_initLoc.wm" "base_group_multMat.i[0]";
connectAttr "root_poser.wim" "base_group_multMat.i[1]";
connectAttr "feathers.spreadTip" "feathers_u_multiplyDivide.i1x";
connectAttr "feathers.bend" "feathers_u_multiplyDivide.i1y";
connectAttr "feathers.spreadRoot" "feathers_u_multiplyDivide.i1z";
connectAttr "feathers_u_multiplyDivide.ox" "feathers_negU_clamp.ipr";
connectAttr "feathers_u_multiplyDivide.ox" "feathers_negU_clamp.ipg";
connectAttr "feathers_s_multiplyDivide.ox" "feathers_p_plusMinusAverage.i3[0].i3x"
		;
connectAttr "feathers_s_multiplyDivide.oy" "feathers_p_plusMinusAverage.i3[0].i3y"
		;
connectAttr "feathers_s_multiplyDivide.oz" "feathers_p_plusMinusAverage.i3[0].i3z"
		;
connectAttr "feathers_u_multiplyDivide.ox" "feathers_p_plusMinusAverage.i3[1].i3x"
		;
connectAttr "feathers_u_multiplyDivide.oy" "feathers_p_plusMinusAverage.i3[1].i3y"
		;
connectAttr "feathers_u_multiplyDivide.oz" "feathers_p_plusMinusAverage.i3[1].i3z"
		;
connectAttr "feathers_s_multiplyDivide.ox" "feathers_q_plusMinusAverage.i3[0].i3x"
		;
connectAttr "feathers_s_multiplyDivide.oy" "feathers_q_plusMinusAverage.i3[0].i3y"
		;
connectAttr "feathers_s_multiplyDivide.oz" "feathers_q_plusMinusAverage.i3[0].i3z"
		;
connectAttr "feathers_u_multiplyDivide.ox" "feathers_q_plusMinusAverage.i3[1].i3x"
		;
connectAttr "feathers_u_multiplyDivide.oy" "feathers_q_plusMinusAverage.i3[1].i3y"
		;
connectAttr "feathers_u_multiplyDivide.oz" "feathers_q_plusMinusAverage.i3[1].i3z"
		;
connectAttr "mainPoser.spreadOpen" "feathers_spreadCoef_multiplyDivide.i1x";
connectAttr "mainPoser.spreadClose" "feathers_spreadCoef_multiplyDivide.i1y";
connectAttr "mainPoser.spreadDip" "feathers_spreadCoef_multiplyDivide.i1z";
connectAttr "mainPoser.bendUp" "feathers_bendCoef_multiplyDivide.i1x";
connectAttr "mainPoser.bendUpEdge" "feathers_bendCoef_multiplyDivide.i1y";
connectAttr "mainPoser.bendDown" "feathers_bendCoef_multiplyDivide.i1z";
connectAttr "feathers_p_plusMinusAverage.o3x" "feathers_spread_multiplyDivide.i1x"
		;
connectAttr "feathers_q_plusMinusAverage.o3x" "feathers_spread_multiplyDivide.i1y"
		;
connectAttr "feathers_dipS_multiplyDivide.ox" "feathers_spread_multiplyDivide.i1z"
		;
connectAttr "feathers_spreadCoef_multiplyDivide.ox" "feathers_spread_multiplyDivide.i2x"
		;
connectAttr "feathers_spreadCoef_multiplyDivide.oy" "feathers_spread_multiplyDivide.i2y"
		;
connectAttr "feathers_spreadCoef_multiplyDivide.oz" "feathers_spread_multiplyDivide.i2z"
		;
connectAttr "feathers_p_plusMinusAverage.o3y" "feathers_bend_multiplyDivide.i1x"
		;
connectAttr "feathers_p_plusMinusAverage.o3y" "feathers_bend_multiplyDivide.i1y"
		;
connectAttr "feathers_q_plusMinusAverage.o3y" "feathers_bend_multiplyDivide.i1z"
		;
connectAttr "feathers_bendCoef_multiplyDivide.ox" "feathers_bend_multiplyDivide.i2x"
		;
connectAttr "feathers_bendCoef_multiplyDivide.oy" "feathers_bend_multiplyDivide.i2y"
		;
connectAttr "feathers_bendCoef_multiplyDivide.oz" "feathers_bend_multiplyDivide.i2z"
		;
connectAttr "feathers_spread_multiplyDivide.ox" "feathers_edge_plusMinusAverage.i3[0].i3x"
		;
connectAttr "feathers_spread_multiplyDivide.oz" "feathers_edge_plusMinusAverage.i3[0].i3y"
		;
connectAttr "feathers_bend_multiplyDivide.oy" "feathers_edge_plusMinusAverage.i3[0].i3z"
		;
connectAttr "feathers_spread_multiplyDivide.oy" "feathers_edge_plusMinusAverage.i3[1].i3x"
		;
connectAttr "feathers_bend_multiplyDivide.oz" "feathers_edge_plusMinusAverage.i3[1].i3z"
		;
connectAttr "feathers_bend_multiplyDivide.ox" "feathers_mid_plusMinusAverage.i1[0]"
		;
connectAttr "feathers_bend_multiplyDivide.oz" "feathers_mid_plusMinusAverage.i1[1]"
		;
connectAttr "unitConversion1.o" "feathers_edge_rotation.iax";
connectAttr "unitConversion2.o" "feathers_edge_rotation.iay";
connectAttr "unitConversion3.o" "feathers_edge_rotation.iaz";
connectAttr "feathers_edge_plusMinusAverage.o3x" "unitConversion1.i";
connectAttr "feathers_edge_plusMinusAverage.o3y" "unitConversion2.i";
connectAttr "feathers_edge_plusMinusAverage.o3z" "unitConversion3.i";
connectAttr "unitConversion4.o" "feathers_mid_rotation.iaz";
connectAttr "feathers_mid_plusMinusAverage.o1" "unitConversion4.i";
connectAttr "base.wm" "root_outJoint_multMat.i[0]";
connectAttr "outJoints.wim" "root_outJoint_multMat.i[1]";
connectAttr "root_outJoint_multMat.o" "root_outJoint_decMat.imat";
connectAttr "root_connector.wm" "root_connector_decomposeMatrix.imat";
connectAttr "root_connector_decomposeMatrix.os" "outJoints_mirror_multiplyDivide.i1"
		;
connectAttr "mirror_condition.ocr" "outJoints_mirror_multiplyDivide.i2z";
connectAttr "feathers.iog" "main_moduleControlSet.dsm" -na;
connectAttr "main_4.iog" "main_moduleControlSet.dsm" -na;
connectAttr "main_3.iog" "main_moduleControlSet.dsm" -na;
connectAttr "main_2.iog" "main_moduleControlSet.dsm" -na;
connectAttr "main_1.iog" "main_moduleControlSet.dsm" -na;
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_5_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_5_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_5_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_5_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_5_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_4_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_4_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_4_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_4_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_4_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_3_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_3_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_3_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_3_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_3_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_2_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_2_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_2_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_2_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_2_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_1_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_1_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_1_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_1_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "r_feather_1_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_5_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_5_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_5_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_5_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_5_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_4_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_4_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_4_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_4_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_4_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_3_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_3_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_3_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_3_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_3_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_2_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_2_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_2_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_2_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_2_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_1_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_1_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_1_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_1_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "l_feather_1_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "m_feather_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "m_feather_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "m_feather_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "m_feather_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "m_feather_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "mainPoser.spreadRootOpen" "feathers_rootCoef_multiplyDivide.i1x";
connectAttr "mainPoser.spreadRootClose" "feathers_rootCoef_multiplyDivide.i1y";
connectAttr "feathers_p_plusMinusAverage.o3z" "feathers_root_multiplyDivide.i1x"
		;
connectAttr "feathers_q_plusMinusAverage.o3z" "feathers_root_multiplyDivide.i1y"
		;
connectAttr "feathers_rootCoef_multiplyDivide.ox" "feathers_root_multiplyDivide.i2x"
		;
connectAttr "feathers_rootCoef_multiplyDivide.oy" "feathers_root_multiplyDivide.i2y"
		;
connectAttr "feathers_root_multiplyDivide.ox" "feathers_root_plusMinusAverage.i1[0]"
		;
connectAttr "feathers_root_multiplyDivide.oy" "feathers_root_plusMinusAverage.i1[1]"
		;
connectAttr "unitConversion5.o" "feathers_rootEdge_rotation.iay";
connectAttr "feathers_root_plusMinusAverage.o1" "unitConversion5.i";
connectAttr "r_feather_1_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_5_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_2_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_5_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_4_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "posers_curve_2_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_3_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_4_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_6_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_2_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_5_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_1_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "r_feather_2_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_4_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_2_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_5_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_5_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_1_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "r_feather_2_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_6_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape6.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_2_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_1_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_3_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_5_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_1_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_2_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_2_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_3_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "main_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "posers_curve_Shape3.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_2_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_1_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_3_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_1_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_6.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_5_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_5_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "r_feather_1_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_5_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_2_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_3_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "lines_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "main_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_3_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_4_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "m_feather_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_2_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_5_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_1_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_1_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_4_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feathers_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_4_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_2_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_2_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_2_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_3_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_2_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_1_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_4_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_3_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_3_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_5_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_5_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_3_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_3_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "main_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_3_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_1_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_4_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_5_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "lines_sweepMeshCreator.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_4_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_3_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_4_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_4_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_2_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_4_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_1_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "lines_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_1_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_5_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_2_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_3_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_2_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_1_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_4_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "r_feather_4_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "r_feather_3_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "r_feather_2_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "r_feather_1_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "l_feather_5_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "l_feather_4_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "l_feather_3_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "l_feather_2_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "l_feather_1_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" 
		-na;
connectAttr "m_feather_moduleControlSet.msg" "feathers_moduleControlSet.dnsm" -na
		;
connectAttr "m_feather_cluster4GroupId.msg" "m_feather_cluster4Set.gn" -na;
connectAttr "m_feather_mainPoserShape.iog.og[1]" "m_feather_cluster4Set.dsm" -na
		;
connectAttr "m_feather_mainPoser_clusterHandleCluster.msg" "m_feather_cluster4Set.ub[0]"
		;
connectAttr "m_feather_cluster4GroupParts.og" "m_feather_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "m_feather_cluster4GroupId.id" "m_feather_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "m_feather_mainPoser_clusterHandle.wm" "m_feather_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "m_feather_mainPoser_clusterHandleShape.x" "m_feather_mainPoser_clusterHandleCluster.x"
		;
connectAttr "m_feather_tweak24.og[0]" "m_feather_cluster4GroupParts.ig";
connectAttr "m_feather_cluster4GroupId.id" "m_feather_cluster4GroupParts.gi";
connectAttr "m_feather_groupParts42.og" "m_feather_tweak24.ip[0].ig";
connectAttr "m_feather_groupId42.id" "m_feather_tweak24.ip[0].gi";
connectAttr "m_feather_groupId42.msg" "m_feather_tweakSet24.gn" -na;
connectAttr "m_feather_mainPoserShape.iog.og[2]" "m_feather_tweakSet24.dsm" -na;
connectAttr "m_feather_tweak24.msg" "m_feather_tweakSet24.ub[0]";
connectAttr "m_feather_mainPoserShapeOrig.ws" "m_feather_groupParts42.ig";
connectAttr "m_feather_groupId42.id" "m_feather_groupParts42.gi";
connectAttr "m_feather_mainPoser.globalSize" "m_feather_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "m_feather_mainPoser.globalSize" "m_feather_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "m_feather_mainPoser.globalSize" "m_feather_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "m_feather_mainPoser.size" "m_feather_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "m_feather_mainPoser.lineWidth" "m_feather_mainPoser_size_multiplyDivide.i2y"
		;
connectAttr "m_feather_1_size_multDoubleLinear.o" "m_feather_1_makeNurbSphere.r"
		;
connectAttr "m_feather_1_poser.size" "m_feather_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "m_feather_1_size_multDoubleLinear.i2";
connectAttr "m_feather_2_size_multDoubleLinear.o" "m_feather_2_makeNurbSphere.r"
		;
connectAttr "m_feather_2_poser.size" "m_feather_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "m_feather_2_size_multDoubleLinear.i2";
connectAttr "m_feather_3_size_multDoubleLinear.o" "m_feather_3_makeNurbSphere.r"
		;
connectAttr "m_feather_3_poser.size" "m_feather_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "m_feather_3_size_multDoubleLinear.i2";
connectAttr "m_feather_4_size_multDoubleLinear.o" "m_feather_4_makeNurbSphere.r"
		;
connectAttr "m_feather_4_poser.size" "m_feather_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "m_feather_4_size_multDoubleLinear.i2";
connectAttr "m_feather_5_size_multDoubleLinear.o" "m_feather_5_makeNurbSphere.r"
		;
connectAttr "m_feather_5_poser.size" "m_feather_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "m_feather_5_size_multDoubleLinear.i2";
connectAttr "m_feather_end_size_multDoubleLinear.o" "m_feather_end_makeNurbSphere.r"
		;
connectAttr "m_feather_end_poser.size" "m_feather_end_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "m_feather_end_size_multDoubleLinear.i2";
connectAttr "l_feather_1_cluster4GroupId.msg" "l_feather_1_cluster4Set.gn" -na;
connectAttr "l_feather_1_mainPoserShape.iog.og[1]" "l_feather_1_cluster4Set.dsm"
		 -na;
connectAttr "l_feather_1_mainPoser_clusterHandleCluster.msg" "l_feather_1_cluster4Set.ub[0]"
		;
connectAttr "l_feather_1_cluster4GroupParts.og" "l_feather_1_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "l_feather_1_cluster4GroupId.id" "l_feather_1_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_feather_1_mainPoser_clusterHandle.wm" "l_feather_1_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_feather_1_mainPoser_clusterHandleShape.x" "l_feather_1_mainPoser_clusterHandleCluster.x"
		;
connectAttr "l_feather_1_tweak24.og[0]" "l_feather_1_cluster4GroupParts.ig";
connectAttr "l_feather_1_cluster4GroupId.id" "l_feather_1_cluster4GroupParts.gi"
		;
connectAttr "l_feather_1_groupParts42.og" "l_feather_1_tweak24.ip[0].ig";
connectAttr "l_feather_1_groupId42.id" "l_feather_1_tweak24.ip[0].gi";
connectAttr "l_feather_1_groupId42.msg" "l_feather_1_tweakSet24.gn" -na;
connectAttr "l_feather_1_mainPoserShape.iog.og[2]" "l_feather_1_tweakSet24.dsm" 
		-na;
connectAttr "l_feather_1_tweak24.msg" "l_feather_1_tweakSet24.ub[0]";
connectAttr "l_feather_1_mainPoserShapeOrig.ws" "l_feather_1_groupParts42.ig";
connectAttr "l_feather_1_groupId42.id" "l_feather_1_groupParts42.gi";
connectAttr "l_feather_1_mainPoser.globalSize" "l_feather_1_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_feather_1_mainPoser.globalSize" "l_feather_1_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_feather_1_mainPoser.globalSize" "l_feather_1_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_feather_1_mainPoser.size" "l_feather_1_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "l_feather_1_mainPoser.lineWidth" "l_feather_1_mainPoser_size_multiplyDivide.i2y"
		;
connectAttr "l_feather_1_1_size_multDoubleLinear.o" "l_feather_1_1_makeNurbSphere.r"
		;
connectAttr "l_feather_1_1_poser.size" "l_feather_1_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_1_1_size_multDoubleLinear.i2";
connectAttr "l_feather_1_2_size_multDoubleLinear.o" "l_feather_1_2_makeNurbSphere.r"
		;
connectAttr "l_feather_1_2_poser.size" "l_feather_1_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_1_2_size_multDoubleLinear.i2";
connectAttr "l_feather_1_3_size_multDoubleLinear.o" "l_feather_1_3_makeNurbSphere.r"
		;
connectAttr "l_feather_1_3_poser.size" "l_feather_1_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_1_3_size_multDoubleLinear.i2";
connectAttr "l_feather_1_4_size_multDoubleLinear.o" "l_feather_1_4_makeNurbSphere.r"
		;
connectAttr "l_feather_1_4_poser.size" "l_feather_1_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_1_4_size_multDoubleLinear.i2";
connectAttr "l_feather_1_5_size_multDoubleLinear.o" "l_feather_1_5_makeNurbSphere.r"
		;
connectAttr "l_feather_1_5_poser.size" "l_feather_1_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_1_5_size_multDoubleLinear.i2";
connectAttr "l_feather_1_end_size_multDoubleLinear.o" "l_feather_1_end_makeNurbSphere.r"
		;
connectAttr "l_feather_1_end_poser.size" "l_feather_1_end_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "l_feather_1_end_size_multDoubleLinear.i2";
connectAttr "l_feather_2_cluster4GroupId.msg" "l_feather_2_cluster4Set.gn" -na;
connectAttr "l_feather_2_mainPoserShape.iog.og[1]" "l_feather_2_cluster4Set.dsm"
		 -na;
connectAttr "l_feather_2_mainPoser_clusterHandleCluster.msg" "l_feather_2_cluster4Set.ub[0]"
		;
connectAttr "l_feather_2_cluster4GroupParts.og" "l_feather_2_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "l_feather_2_cluster4GroupId.id" "l_feather_2_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_feather_2_mainPoser_clusterHandle.wm" "l_feather_2_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_feather_2_mainPoser_clusterHandleShape.x" "l_feather_2_mainPoser_clusterHandleCluster.x"
		;
connectAttr "l_feather_2_tweak24.og[0]" "l_feather_2_cluster4GroupParts.ig";
connectAttr "l_feather_2_cluster4GroupId.id" "l_feather_2_cluster4GroupParts.gi"
		;
connectAttr "l_feather_2_groupParts42.og" "l_feather_2_tweak24.ip[0].ig";
connectAttr "l_feather_2_groupId42.id" "l_feather_2_tweak24.ip[0].gi";
connectAttr "l_feather_2_groupId42.msg" "l_feather_2_tweakSet24.gn" -na;
connectAttr "l_feather_2_mainPoserShape.iog.og[2]" "l_feather_2_tweakSet24.dsm" 
		-na;
connectAttr "l_feather_2_tweak24.msg" "l_feather_2_tweakSet24.ub[0]";
connectAttr "l_feather_2_mainPoserShapeOrig.ws" "l_feather_2_groupParts42.ig";
connectAttr "l_feather_2_groupId42.id" "l_feather_2_groupParts42.gi";
connectAttr "l_feather_2_mainPoser.globalSize" "l_feather_2_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_feather_2_mainPoser.globalSize" "l_feather_2_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_feather_2_mainPoser.globalSize" "l_feather_2_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_feather_2_mainPoser.size" "l_feather_2_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "l_feather_2_mainPoser.lineWidth" "l_feather_2_mainPoser_size_multiplyDivide.i2y"
		;
connectAttr "l_feather_2_1_size_multDoubleLinear.o" "l_feather_2_1_makeNurbSphere.r"
		;
connectAttr "l_feather_2_1_poser.size" "l_feather_2_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_2_1_size_multDoubleLinear.i2";
connectAttr "l_feather_2_2_size_multDoubleLinear.o" "l_feather_2_2_makeNurbSphere.r"
		;
connectAttr "l_feather_2_2_poser.size" "l_feather_2_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_2_2_size_multDoubleLinear.i2";
connectAttr "l_feather_2_3_size_multDoubleLinear.o" "l_feather_2_3_makeNurbSphere.r"
		;
connectAttr "l_feather_2_3_poser.size" "l_feather_2_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_2_3_size_multDoubleLinear.i2";
connectAttr "l_feather_2_4_size_multDoubleLinear.o" "l_feather_2_4_makeNurbSphere.r"
		;
connectAttr "l_feather_2_4_poser.size" "l_feather_2_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_2_4_size_multDoubleLinear.i2";
connectAttr "l_feather_2_5_size_multDoubleLinear.o" "l_feather_2_5_makeNurbSphere.r"
		;
connectAttr "l_feather_2_5_poser.size" "l_feather_2_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_2_5_size_multDoubleLinear.i2";
connectAttr "l_feather_2_end_size_multDoubleLinear.o" "l_feather_2_end_makeNurbSphere.r"
		;
connectAttr "l_feather_2_end_poser.size" "l_feather_2_end_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "l_feather_2_end_size_multDoubleLinear.i2";
connectAttr "l_feather_3_cluster4GroupId.msg" "l_feather_3_cluster4Set.gn" -na;
connectAttr "l_feather_3_mainPoserShape.iog.og[1]" "l_feather_3_cluster4Set.dsm"
		 -na;
connectAttr "l_feather_3_mainPoser_clusterHandleCluster.msg" "l_feather_3_cluster4Set.ub[0]"
		;
connectAttr "l_feather_3_cluster4GroupParts.og" "l_feather_3_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "l_feather_3_cluster4GroupId.id" "l_feather_3_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_feather_3_mainPoser_clusterHandle.wm" "l_feather_3_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_feather_3_mainPoser_clusterHandleShape.x" "l_feather_3_mainPoser_clusterHandleCluster.x"
		;
connectAttr "l_feather_3_tweak24.og[0]" "l_feather_3_cluster4GroupParts.ig";
connectAttr "l_feather_3_cluster4GroupId.id" "l_feather_3_cluster4GroupParts.gi"
		;
connectAttr "l_feather_3_groupParts42.og" "l_feather_3_tweak24.ip[0].ig";
connectAttr "l_feather_3_groupId42.id" "l_feather_3_tweak24.ip[0].gi";
connectAttr "l_feather_3_groupId42.msg" "l_feather_3_tweakSet24.gn" -na;
connectAttr "l_feather_3_mainPoserShape.iog.og[2]" "l_feather_3_tweakSet24.dsm" 
		-na;
connectAttr "l_feather_3_tweak24.msg" "l_feather_3_tweakSet24.ub[0]";
connectAttr "l_feather_3_mainPoserShapeOrig.ws" "l_feather_3_groupParts42.ig";
connectAttr "l_feather_3_groupId42.id" "l_feather_3_groupParts42.gi";
connectAttr "l_feather_3_mainPoser.globalSize" "l_feather_3_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_feather_3_mainPoser.globalSize" "l_feather_3_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_feather_3_mainPoser.globalSize" "l_feather_3_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_feather_3_mainPoser.size" "l_feather_3_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "l_feather_3_mainPoser.lineWidth" "l_feather_3_mainPoser_size_multiplyDivide.i2y"
		;
connectAttr "l_feather_3_1_size_multDoubleLinear.o" "l_feather_3_1_makeNurbSphere.r"
		;
connectAttr "l_feather_3_1_poser.size" "l_feather_3_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_3_1_size_multDoubleLinear.i2";
connectAttr "l_feather_3_2_size_multDoubleLinear.o" "l_feather_3_2_makeNurbSphere.r"
		;
connectAttr "l_feather_3_2_poser.size" "l_feather_3_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_3_2_size_multDoubleLinear.i2";
connectAttr "l_feather_3_3_size_multDoubleLinear.o" "l_feather_3_3_makeNurbSphere.r"
		;
connectAttr "l_feather_3_3_poser.size" "l_feather_3_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_3_3_size_multDoubleLinear.i2";
connectAttr "l_feather_3_4_size_multDoubleLinear.o" "l_feather_3_4_makeNurbSphere.r"
		;
connectAttr "l_feather_3_4_poser.size" "l_feather_3_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_3_4_size_multDoubleLinear.i2";
connectAttr "l_feather_3_5_size_multDoubleLinear.o" "l_feather_3_5_makeNurbSphere.r"
		;
connectAttr "l_feather_3_5_poser.size" "l_feather_3_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_3_5_size_multDoubleLinear.i2";
connectAttr "l_feather_3_end_size_multDoubleLinear.o" "l_feather_3_end_makeNurbSphere.r"
		;
connectAttr "l_feather_3_end_poser.size" "l_feather_3_end_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "l_feather_3_end_size_multDoubleLinear.i2";
connectAttr "l_feather_4_cluster4GroupId.msg" "l_feather_4_cluster4Set.gn" -na;
connectAttr "l_feather_4_mainPoserShape.iog.og[1]" "l_feather_4_cluster4Set.dsm"
		 -na;
connectAttr "l_feather_4_mainPoser_clusterHandleCluster.msg" "l_feather_4_cluster4Set.ub[0]"
		;
connectAttr "l_feather_4_cluster4GroupParts.og" "l_feather_4_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "l_feather_4_cluster4GroupId.id" "l_feather_4_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_feather_4_mainPoser_clusterHandle.wm" "l_feather_4_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_feather_4_mainPoser_clusterHandleShape.x" "l_feather_4_mainPoser_clusterHandleCluster.x"
		;
connectAttr "l_feather_4_tweak24.og[0]" "l_feather_4_cluster4GroupParts.ig";
connectAttr "l_feather_4_cluster4GroupId.id" "l_feather_4_cluster4GroupParts.gi"
		;
connectAttr "l_feather_4_groupParts42.og" "l_feather_4_tweak24.ip[0].ig";
connectAttr "l_feather_4_groupId42.id" "l_feather_4_tweak24.ip[0].gi";
connectAttr "l_feather_4_groupId42.msg" "l_feather_4_tweakSet24.gn" -na;
connectAttr "l_feather_4_mainPoserShape.iog.og[2]" "l_feather_4_tweakSet24.dsm" 
		-na;
connectAttr "l_feather_4_tweak24.msg" "l_feather_4_tweakSet24.ub[0]";
connectAttr "l_feather_4_mainPoserShapeOrig.ws" "l_feather_4_groupParts42.ig";
connectAttr "l_feather_4_groupId42.id" "l_feather_4_groupParts42.gi";
connectAttr "l_feather_4_mainPoser.globalSize" "l_feather_4_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_feather_4_mainPoser.globalSize" "l_feather_4_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_feather_4_mainPoser.globalSize" "l_feather_4_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_feather_4_mainPoser.size" "l_feather_4_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "l_feather_4_mainPoser.lineWidth" "l_feather_4_mainPoser_size_multiplyDivide.i2y"
		;
connectAttr "l_feather_4_1_size_multDoubleLinear.o" "l_feather_4_1_makeNurbSphere.r"
		;
connectAttr "l_feather_4_1_poser.size" "l_feather_4_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_4_1_size_multDoubleLinear.i2";
connectAttr "l_feather_4_2_size_multDoubleLinear.o" "l_feather_4_2_makeNurbSphere.r"
		;
connectAttr "l_feather_4_2_poser.size" "l_feather_4_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_4_2_size_multDoubleLinear.i2";
connectAttr "l_feather_4_3_size_multDoubleLinear.o" "l_feather_4_3_makeNurbSphere.r"
		;
connectAttr "l_feather_4_3_poser.size" "l_feather_4_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_4_3_size_multDoubleLinear.i2";
connectAttr "l_feather_4_4_size_multDoubleLinear.o" "l_feather_4_4_makeNurbSphere.r"
		;
connectAttr "l_feather_4_4_poser.size" "l_feather_4_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_4_4_size_multDoubleLinear.i2";
connectAttr "l_feather_4_5_size_multDoubleLinear.o" "l_feather_4_5_makeNurbSphere.r"
		;
connectAttr "l_feather_4_5_poser.size" "l_feather_4_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_4_5_size_multDoubleLinear.i2";
connectAttr "l_feather_4_end_size_multDoubleLinear.o" "l_feather_4_end_makeNurbSphere.r"
		;
connectAttr "l_feather_4_end_poser.size" "l_feather_4_end_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "l_feather_4_end_size_multDoubleLinear.i2";
connectAttr "l_feather_5_cluster4GroupId.msg" "l_feather_5_cluster4Set.gn" -na;
connectAttr "l_feather_5_mainPoserShape.iog.og[1]" "l_feather_5_cluster4Set.dsm"
		 -na;
connectAttr "l_feather_5_mainPoser_clusterHandleCluster.msg" "l_feather_5_cluster4Set.ub[0]"
		;
connectAttr "l_feather_5_cluster4GroupParts.og" "l_feather_5_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "l_feather_5_cluster4GroupId.id" "l_feather_5_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "l_feather_5_mainPoser_clusterHandle.wm" "l_feather_5_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "l_feather_5_mainPoser_clusterHandleShape.x" "l_feather_5_mainPoser_clusterHandleCluster.x"
		;
connectAttr "l_feather_5_tweak24.og[0]" "l_feather_5_cluster4GroupParts.ig";
connectAttr "l_feather_5_cluster4GroupId.id" "l_feather_5_cluster4GroupParts.gi"
		;
connectAttr "l_feather_5_groupParts42.og" "l_feather_5_tweak24.ip[0].ig";
connectAttr "l_feather_5_groupId42.id" "l_feather_5_tweak24.ip[0].gi";
connectAttr "l_feather_5_groupId42.msg" "l_feather_5_tweakSet24.gn" -na;
connectAttr "l_feather_5_mainPoserShape.iog.og[2]" "l_feather_5_tweakSet24.dsm" 
		-na;
connectAttr "l_feather_5_tweak24.msg" "l_feather_5_tweakSet24.ub[0]";
connectAttr "l_feather_5_mainPoserShapeOrig.ws" "l_feather_5_groupParts42.ig";
connectAttr "l_feather_5_groupId42.id" "l_feather_5_groupParts42.gi";
connectAttr "l_feather_5_mainPoser.globalSize" "l_feather_5_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "l_feather_5_mainPoser.globalSize" "l_feather_5_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "l_feather_5_mainPoser.globalSize" "l_feather_5_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "l_feather_5_mainPoser.size" "l_feather_5_mainPoser_size_multiplyDivide.i2x"
		;
connectAttr "l_feather_5_mainPoser.lineWidth" "l_feather_5_mainPoser_size_multiplyDivide.i2y"
		;
connectAttr "l_feather_5_1_size_multDoubleLinear.o" "l_feather_5_1_makeNurbSphere.r"
		;
connectAttr "l_feather_5_1_poser.size" "l_feather_5_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_5_1_size_multDoubleLinear.i2";
connectAttr "l_feather_5_2_size_multDoubleLinear.o" "l_feather_5_2_makeNurbSphere.r"
		;
connectAttr "l_feather_5_2_poser.size" "l_feather_5_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_5_2_size_multDoubleLinear.i2";
connectAttr "l_feather_5_3_size_multDoubleLinear.o" "l_feather_5_3_makeNurbSphere.r"
		;
connectAttr "l_feather_5_3_poser.size" "l_feather_5_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_5_3_size_multDoubleLinear.i2";
connectAttr "l_feather_5_4_size_multDoubleLinear.o" "l_feather_5_4_makeNurbSphere.r"
		;
connectAttr "l_feather_5_4_poser.size" "l_feather_5_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_5_4_size_multDoubleLinear.i2";
connectAttr "l_feather_5_5_size_multDoubleLinear.o" "l_feather_5_5_makeNurbSphere.r"
		;
connectAttr "l_feather_5_5_poser.size" "l_feather_5_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "l_feather_5_5_size_multDoubleLinear.i2";
connectAttr "l_feather_5_end_size_multDoubleLinear.o" "l_feather_5_end_makeNurbSphere.r"
		;
connectAttr "l_feather_5_end_poser.size" "l_feather_5_end_size_multDoubleLinear.i1"
		;
connectAttr "mainPoser.globalSize" "l_feather_5_end_size_multDoubleLinear.i2";
connectAttr "main_1_size_multDoubleLinear.o" "main_1_makeNurbSphere.r";
connectAttr "main_1_poser.size" "main_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "main_1_size_multDoubleLinear.i2";
connectAttr "main_2_size_multDoubleLinear.o" "main_2_makeNurbSphere.r";
connectAttr "main_2_poser.size" "main_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "main_2_size_multDoubleLinear.i2";
connectAttr "main_3_size_multDoubleLinear.o" "main_3_makeNurbSphere.r";
connectAttr "main_3_poser.size" "main_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "main_3_size_multDoubleLinear.i2";
connectAttr "main_4_size_multDoubleLinear.o" "main_4_makeNurbSphere.r";
connectAttr "main_4_poser.size" "main_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "main_4_size_multDoubleLinear.i2";
connectAttr "posers_curve_Shape1.ws" "lines_sweepMeshCreator.inCurveArray[0]";
connectAttr "posers_curve_Shape2.ws" "lines_sweepMeshCreator.inCurveArray[1]";
connectAttr "posers_curve_Shape3.ws" "lines_sweepMeshCreator.inCurveArray[2]";
connectAttr "posers_curve_Shape4.ws" "lines_sweepMeshCreator.inCurveArray[3]";
connectAttr "posers_curve_Shape5.ws" "lines_sweepMeshCreator.inCurveArray[4]";
connectAttr "posers_curve_Shape6.ws" "lines_sweepMeshCreator.inCurveArray[5]";
connectAttr "lines_scale_multiplyDivide.ox" "lines_sweepMeshCreator.scaleProfileX"
		;
connectAttr "mainPoser.lineSize" "lines_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "lines_size_multDoubleLinear.i2";
connectAttr "l_feather_1_1_initLoc.wm" "r_feather_1_1_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_1_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_1_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_1_1_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_1_initLoc_multMat.i[4]";
connectAttr "l_feather_1_2_initLoc.wm" "r_feather_1_2_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_2_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_2_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_1_2_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_2_initLoc_multMat.i[4]";
connectAttr "l_feather_1_3_initLoc.wm" "r_feather_1_3_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_3_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_3_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_1_3_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_3_initLoc_multMat.i[4]";
connectAttr "l_feather_1_4_initLoc.wm" "r_feather_1_4_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_4_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_4_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_1_4_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_4_initLoc_multMat.i[4]";
connectAttr "l_feather_1_5_initLoc.wm" "r_feather_1_5_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_5_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_5_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_1_5_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_5_initLoc_multMat.i[4]";
connectAttr "l_feather_1_end_initLoc.wm" "r_feather_1_end_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_end_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_end_initLoc_multMat.i[2]"
		;
connectAttr "root_poser.wm" "r_feather_1_end_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_end_initLoc_multMat.i[4]";
connectAttr "l_feather_1_1_fanLoc.wm" "r_feather_1_1_fanLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_1_1_fanLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_1_1_fanLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_1_1_fanLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_1_1_fanLoc_multMat.i[4]";
connectAttr "l_feather_2_1_initLoc.wm" "r_feather_2_1_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_1_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_1_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_2_1_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_1_initLoc_multMat.i[4]";
connectAttr "l_feather_2_2_initLoc.wm" "r_feather_2_2_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_2_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_2_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_2_2_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_2_initLoc_multMat.i[4]";
connectAttr "l_feather_2_3_initLoc.wm" "r_feather_2_3_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_3_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_3_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_2_3_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_3_initLoc_multMat.i[4]";
connectAttr "l_feather_2_4_initLoc.wm" "r_feather_2_4_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_4_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_4_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_2_4_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_4_initLoc_multMat.i[4]";
connectAttr "l_feather_2_5_initLoc.wm" "r_feather_2_5_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_5_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_5_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_2_5_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_5_initLoc_multMat.i[4]";
connectAttr "l_feather_2_end_initLoc.wm" "r_feather_2_end_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_end_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_end_initLoc_multMat.i[2]"
		;
connectAttr "root_poser.wm" "r_feather_2_end_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_end_initLoc_multMat.i[4]";
connectAttr "l_feather_2_1_fanLoc.wm" "r_feather_2_1_fanLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_2_1_fanLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_2_1_fanLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_2_1_fanLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_2_1_fanLoc_multMat.i[4]";
connectAttr "l_feather_3_1_initLoc.wm" "r_feather_3_1_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_1_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_1_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_3_1_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_1_initLoc_multMat.i[4]";
connectAttr "l_feather_3_2_initLoc.wm" "r_feather_3_2_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_2_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_2_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_3_2_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_2_initLoc_multMat.i[4]";
connectAttr "l_feather_3_3_initLoc.wm" "r_feather_3_3_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_3_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_3_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_3_3_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_3_initLoc_multMat.i[4]";
connectAttr "l_feather_3_4_initLoc.wm" "r_feather_3_4_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_4_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_4_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_3_4_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_4_initLoc_multMat.i[4]";
connectAttr "l_feather_3_5_initLoc.wm" "r_feather_3_5_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_5_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_5_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_3_5_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_5_initLoc_multMat.i[4]";
connectAttr "l_feather_3_end_initLoc.wm" "r_feather_3_end_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_end_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_end_initLoc_multMat.i[2]"
		;
connectAttr "root_poser.wm" "r_feather_3_end_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_end_initLoc_multMat.i[4]";
connectAttr "l_feather_3_1_fanLoc.wm" "r_feather_3_1_fanLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_3_1_fanLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_3_1_fanLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_3_1_fanLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_3_1_fanLoc_multMat.i[4]";
connectAttr "l_feather_4_1_initLoc.wm" "r_feather_4_1_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_1_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_1_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_4_1_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_1_initLoc_multMat.i[4]";
connectAttr "l_feather_4_2_initLoc.wm" "r_feather_4_2_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_2_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_2_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_4_2_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_2_initLoc_multMat.i[4]";
connectAttr "l_feather_4_3_initLoc.wm" "r_feather_4_3_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_3_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_3_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_4_3_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_3_initLoc_multMat.i[4]";
connectAttr "l_feather_4_4_initLoc.wm" "r_feather_4_4_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_4_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_4_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_4_4_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_4_initLoc_multMat.i[4]";
connectAttr "l_feather_4_5_initLoc.wm" "r_feather_4_5_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_5_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_5_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_4_5_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_5_initLoc_multMat.i[4]";
connectAttr "l_feather_4_end_initLoc.wm" "r_feather_4_end_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_end_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_end_initLoc_multMat.i[2]"
		;
connectAttr "root_poser.wm" "r_feather_4_end_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_end_initLoc_multMat.i[4]";
connectAttr "l_feather_4_1_fanLoc.wm" "r_feather_4_1_fanLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_4_1_fanLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_4_1_fanLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_4_1_fanLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_4_1_fanLoc_multMat.i[4]";
connectAttr "l_feather_5_1_initLoc.wm" "r_feather_5_1_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_1_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_1_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_5_1_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_1_initLoc_multMat.i[4]";
connectAttr "l_feather_5_2_initLoc.wm" "r_feather_5_2_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_2_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_2_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_5_2_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_2_initLoc_multMat.i[4]";
connectAttr "l_feather_5_3_initLoc.wm" "r_feather_5_3_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_3_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_3_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_5_3_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_3_initLoc_multMat.i[4]";
connectAttr "l_feather_5_4_initLoc.wm" "r_feather_5_4_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_4_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_4_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_5_4_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_4_initLoc_multMat.i[4]";
connectAttr "l_feather_5_5_initLoc.wm" "r_feather_5_5_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_5_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_5_initLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_5_5_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_5_initLoc_multMat.i[4]";
connectAttr "l_feather_5_end_initLoc.wm" "r_feather_5_end_initLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_end_initLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_end_initLoc_multMat.i[2]"
		;
connectAttr "root_poser.wm" "r_feather_5_end_initLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_end_initLoc_multMat.i[4]";
connectAttr "l_feather_5_1_fanLoc.wm" "r_feather_5_1_fanLoc_multMat.i[0]";
connectAttr "root_poser.wim" "r_feather_5_1_fanLoc_multMat.i[1]";
connectAttr "r_mirror_composeMatrix.omat" "r_feather_5_1_fanLoc_multMat.i[2]";
connectAttr "root_poser.wm" "r_feather_5_1_fanLoc_multMat.i[3]";
connectAttr "r_initLocs.wim" "r_feather_5_1_fanLoc_multMat.i[4]";
connectAttr "feathers_mid_rotation.o" "feather_1_rotation.ia";
connectAttr "feathers_edge_rotation.o" "feather_1_rotation.ib";
connectAttr "feathers_mid_rotation.o" "feather_2_rotation.ia";
connectAttr "feathers_edge_rotation.o" "feather_2_rotation.ib";
connectAttr "feathers_mid_rotation.o" "feather_3_rotation.ia";
connectAttr "feathers_edge_rotation.o" "feather_3_rotation.ib";
connectAttr "feathers_mid_rotation.o" "feather_4_rotation.ia";
connectAttr "feathers_edge_rotation.o" "feather_4_rotation.ib";
connectAttr "feathers_mid_rotation.o" "feather_5_rotation.ia";
connectAttr "feathers_edge_rotation.o" "feather_5_rotation.ib";
connectAttr "feathers_rootEdge_rotation.o" "feather_1_rootRotation.ib";
connectAttr "feathers_rootEdge_rotation.o" "feather_2_rootRotation.ib";
connectAttr "feathers_rootEdge_rotation.o" "feather_3_rootRotation.ib";
connectAttr "feathers_rootEdge_rotation.o" "feather_4_rootRotation.ib";
connectAttr "feathers_rootEdge_rotation.o" "feather_5_rootRotation.ib";
connectAttr "m_feather_1_initLoc.wm" "m_feather_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "m_feather_1_group_multMat.i[1]";
connectAttr "m_feather_1.m" "m_feather_1_outJoint_multMat.i[0]";
connectAttr "m_feather_1_group.opm" "m_feather_1_outJoint_multMat.i[1]";
connectAttr "m_feather_1_outJoint_multMat.o" "m_feather_1_outJoint_decMat.imat";
connectAttr "m_feather_2_initLoc.wm" "m_feather_2_group_multMat.i[0]";
connectAttr "m_feather_1_initLoc.wim" "m_feather_2_group_multMat.i[1]";
connectAttr "m_feather_2_bendGroup.wm" "m_feather_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "m_feather_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "m_feather_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "m_feather_2_mainGroup_multMat.i[3]";
connectAttr "m_feather_2_bendGroup.wim" "m_feather_2_mainGroup_multMat.i[4]";
connectAttr "m_feather_2.m" "m_feather_2_outJoint_multMat.i[0]";
connectAttr "m_feather_2_mainGroup.opm" "m_feather_2_outJoint_multMat.i[1]";
connectAttr "m_feather_2_bendGroup.m" "m_feather_2_outJoint_multMat.i[2]";
connectAttr "m_feather_2_group.opm" "m_feather_2_outJoint_multMat.i[3]";
connectAttr "m_feather_2_outJoint_multMat.o" "m_feather_2_outJoint_decMat.imat";
connectAttr "m_feather_3_initLoc.wm" "m_feather_3_group_multMat.i[0]";
connectAttr "m_feather_2_initLoc.wim" "m_feather_3_group_multMat.i[1]";
connectAttr "m_feather_3_bendGroup.wm" "m_feather_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "m_feather_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "m_feather_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "m_feather_3_mainGroup_multMat.i[3]";
connectAttr "m_feather_3_bendGroup.wim" "m_feather_3_mainGroup_multMat.i[4]";
connectAttr "m_feather_3.m" "m_feather_3_outJoint_multMat.i[0]";
connectAttr "m_feather_3_mainGroup.opm" "m_feather_3_outJoint_multMat.i[1]";
connectAttr "m_feather_3_bendGroup.m" "m_feather_3_outJoint_multMat.i[2]";
connectAttr "m_feather_3_group.opm" "m_feather_3_outJoint_multMat.i[3]";
connectAttr "m_feather_3_outJoint_multMat.o" "m_feather_3_outJoint_decMat.imat";
connectAttr "m_feather_4_initLoc.wm" "m_feather_4_group_multMat.i[0]";
connectAttr "m_feather_3_initLoc.wim" "m_feather_4_group_multMat.i[1]";
connectAttr "m_feather_4_bendGroup.wm" "m_feather_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "m_feather_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "m_feather_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "m_feather_4_mainGroup_multMat.i[3]";
connectAttr "m_feather_4_bendGroup.wim" "m_feather_4_mainGroup_multMat.i[4]";
connectAttr "m_feather_4.m" "m_feather_4_outJoint_multMat.i[0]";
connectAttr "m_feather_4_mainGroup.opm" "m_feather_4_outJoint_multMat.i[1]";
connectAttr "m_feather_4_bendGroup.m" "m_feather_4_outJoint_multMat.i[2]";
connectAttr "m_feather_4_group.opm" "m_feather_4_outJoint_multMat.i[3]";
connectAttr "m_feather_4_outJoint_multMat.o" "m_feather_4_outJoint_decMat.imat";
connectAttr "m_feather_5_initLoc.wm" "m_feather_5_group_multMat.i[0]";
connectAttr "m_feather_4_initLoc.wim" "m_feather_5_group_multMat.i[1]";
connectAttr "m_feather_5_bendGroup.wm" "m_feather_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "m_feather_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "m_feather_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "m_feather_5_mainGroup_multMat.i[3]";
connectAttr "m_feather_5_bendGroup.wim" "m_feather_5_mainGroup_multMat.i[4]";
connectAttr "m_feather_5.m" "m_feather_5_outJoint_multMat.i[0]";
connectAttr "m_feather_5_mainGroup.opm" "m_feather_5_outJoint_multMat.i[1]";
connectAttr "m_feather_5_bendGroup.m" "m_feather_5_outJoint_multMat.i[2]";
connectAttr "m_feather_5_group.opm" "m_feather_5_outJoint_multMat.i[3]";
connectAttr "m_feather_5_outJoint_multMat.o" "m_feather_5_outJoint_decMat.imat";
connectAttr "m_feather_end_initLoc.wm" "m_feather_end_multMat.i[0]";
connectAttr "m_feather_5_initLoc.wim" "m_feather_end_multMat.i[1]";
connectAttr "m_feather_end_multMat.o" "m_feather_end_decMat.imat";
connectAttr "m_feather_1.iog" "m_feather_moduleControlSet.dsm" -na;
connectAttr "m_feather_2.iog" "m_feather_moduleControlSet.dsm" -na;
connectAttr "m_feather_3.iog" "m_feather_moduleControlSet.dsm" -na;
connectAttr "m_feather_4.iog" "m_feather_moduleControlSet.dsm" -na;
connectAttr "m_feather_5.iog" "m_feather_moduleControlSet.dsm" -na;
connectAttr "l_feather_1_1_fanLoc.wm" "l_feather_1_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "l_feather_1_1_group_multMat.i[1]";
connectAttr "l_feather_1_1_initLoc.wm" "l_feather_1_1_rollGroup_multMat.i[0]";
connectAttr "l_feather_1_1_fanLoc.wim" "l_feather_1_1_rollGroup_multMat.i[1]";
connectAttr "l_feather_1_1.m" "l_feather_1_1_outJoint_multMat.i[0]";
connectAttr "l_feather_1_1_rollGroup.opm" "l_feather_1_1_outJoint_multMat.i[1]";
connectAttr "l_feather_1_1_spreadGroup.m" "l_feather_1_1_outJoint_multMat.i[2]";
connectAttr "l_feather_1_1_spreadRootGroup.m" "l_feather_1_1_outJoint_multMat.i[3]"
		;
connectAttr "l_feather_1_1_group.opm" "l_feather_1_1_outJoint_multMat.i[4]";
connectAttr "l_feather_1_1_outJoint_multMat.o" "l_feather_1_1_outJoint_decMat.imat"
		;
connectAttr "l_feather_1_2_fanLoc.wm" "l_feather_1_2_group_multMat.i[0]";
connectAttr "l_feather_1_1_initLoc.wim" "l_feather_1_2_group_multMat.i[1]";
connectAttr "l_feather_1_2_bendGroup.wm" "l_feather_1_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_1_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "l_feather_1_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "l_feather_1_2_mainGroup_multMat.i[3]";
connectAttr "l_feather_1_2_bendGroup.wim" "l_feather_1_2_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_1_2_initLoc.wm" "l_feather_1_2_rollGroup_multMat.i[0]";
connectAttr "l_feather_1_2_fanLoc.wim" "l_feather_1_2_rollGroup_multMat.i[1]";
connectAttr "l_feather_1_2.m" "l_feather_1_2_outJoint_multMat.i[0]";
connectAttr "l_feather_1_2_rollGroup.opm" "l_feather_1_2_outJoint_multMat.i[1]";
connectAttr "l_feather_1_2_mainGroup.opm" "l_feather_1_2_outJoint_multMat.i[2]";
connectAttr "l_feather_1_2_bendGroup.m" "l_feather_1_2_outJoint_multMat.i[3]";
connectAttr "l_feather_1_2_spreadGroup.m" "l_feather_1_2_outJoint_multMat.i[4]";
connectAttr "l_feather_1_2_group.opm" "l_feather_1_2_outJoint_multMat.i[5]";
connectAttr "l_feather_1_2_outJoint_multMat.o" "l_feather_1_2_outJoint_decMat.imat"
		;
connectAttr "l_feather_1_3_fanLoc.wm" "l_feather_1_3_group_multMat.i[0]";
connectAttr "l_feather_1_2_initLoc.wim" "l_feather_1_3_group_multMat.i[1]";
connectAttr "l_feather_1_3_bendGroup.wm" "l_feather_1_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_1_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "l_feather_1_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "l_feather_1_3_mainGroup_multMat.i[3]";
connectAttr "l_feather_1_3_bendGroup.wim" "l_feather_1_3_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_1_3_initLoc.wm" "l_feather_1_3_rollGroup_multMat.i[0]";
connectAttr "l_feather_1_3_fanLoc.wim" "l_feather_1_3_rollGroup_multMat.i[1]";
connectAttr "l_feather_1_3.m" "l_feather_1_3_outJoint_multMat.i[0]";
connectAttr "l_feather_1_3_rollGroup.opm" "l_feather_1_3_outJoint_multMat.i[1]";
connectAttr "l_feather_1_3_mainGroup.opm" "l_feather_1_3_outJoint_multMat.i[2]";
connectAttr "l_feather_1_3_bendGroup.m" "l_feather_1_3_outJoint_multMat.i[3]";
connectAttr "l_feather_1_3_spreadGroup.m" "l_feather_1_3_outJoint_multMat.i[4]";
connectAttr "l_feather_1_3_group.opm" "l_feather_1_3_outJoint_multMat.i[5]";
connectAttr "l_feather_1_3_outJoint_multMat.o" "l_feather_1_3_outJoint_decMat.imat"
		;
connectAttr "l_feather_1_4_fanLoc.wm" "l_feather_1_4_group_multMat.i[0]";
connectAttr "l_feather_1_3_initLoc.wim" "l_feather_1_4_group_multMat.i[1]";
connectAttr "l_feather_1_4_bendGroup.wm" "l_feather_1_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_1_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "l_feather_1_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "l_feather_1_4_mainGroup_multMat.i[3]";
connectAttr "l_feather_1_4_bendGroup.wim" "l_feather_1_4_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_1_4_initLoc.wm" "l_feather_1_4_rollGroup_multMat.i[0]";
connectAttr "l_feather_1_4_fanLoc.wim" "l_feather_1_4_rollGroup_multMat.i[1]";
connectAttr "l_feather_1_4.m" "l_feather_1_4_outJoint_multMat.i[0]";
connectAttr "l_feather_1_4_rollGroup.opm" "l_feather_1_4_outJoint_multMat.i[1]";
connectAttr "l_feather_1_4_mainGroup.opm" "l_feather_1_4_outJoint_multMat.i[2]";
connectAttr "l_feather_1_4_bendGroup.m" "l_feather_1_4_outJoint_multMat.i[3]";
connectAttr "l_feather_1_4_spreadGroup.m" "l_feather_1_4_outJoint_multMat.i[4]";
connectAttr "l_feather_1_4_group.opm" "l_feather_1_4_outJoint_multMat.i[5]";
connectAttr "l_feather_1_4_outJoint_multMat.o" "l_feather_1_4_outJoint_decMat.imat"
		;
connectAttr "l_feather_1_5_fanLoc.wm" "l_feather_1_5_group_multMat.i[0]";
connectAttr "l_feather_1_4_initLoc.wim" "l_feather_1_5_group_multMat.i[1]";
connectAttr "l_feather_1_5_bendGroup.wm" "l_feather_1_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_1_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "l_feather_1_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "l_feather_1_5_mainGroup_multMat.i[3]";
connectAttr "l_feather_1_5_bendGroup.wim" "l_feather_1_5_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_1_5_initLoc.wm" "l_feather_1_5_rollGroup_multMat.i[0]";
connectAttr "l_feather_1_5_fanLoc.wim" "l_feather_1_5_rollGroup_multMat.i[1]";
connectAttr "l_feather_1_5.m" "l_feather_1_5_outJoint_multMat.i[0]";
connectAttr "l_feather_1_5_rollGroup.opm" "l_feather_1_5_outJoint_multMat.i[1]";
connectAttr "l_feather_1_5_mainGroup.opm" "l_feather_1_5_outJoint_multMat.i[2]";
connectAttr "l_feather_1_5_bendGroup.m" "l_feather_1_5_outJoint_multMat.i[3]";
connectAttr "l_feather_1_5_spreadGroup.m" "l_feather_1_5_outJoint_multMat.i[4]";
connectAttr "l_feather_1_5_group.opm" "l_feather_1_5_outJoint_multMat.i[5]";
connectAttr "l_feather_1_5_outJoint_multMat.o" "l_feather_1_5_outJoint_decMat.imat"
		;
connectAttr "l_feather_1_end_initLoc.wm" "l_feather_1_end_multMat.i[0]";
connectAttr "l_feather_1_5_initLoc.wim" "l_feather_1_end_multMat.i[1]";
connectAttr "l_feather_1_end_multMat.o" "l_feather_1_end_decMat.imat";
connectAttr "l_feather_1_1.iog" "l_feather_1_moduleControlSet.dsm" -na;
connectAttr "l_feather_1_2.iog" "l_feather_1_moduleControlSet.dsm" -na;
connectAttr "l_feather_1_3.iog" "l_feather_1_moduleControlSet.dsm" -na;
connectAttr "l_feather_1_4.iog" "l_feather_1_moduleControlSet.dsm" -na;
connectAttr "l_feather_1_5.iog" "l_feather_1_moduleControlSet.dsm" -na;
connectAttr "l_feather_2_1_fanLoc.wm" "l_feather_2_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "l_feather_2_1_group_multMat.i[1]";
connectAttr "l_feather_2_1_initLoc.wm" "l_feather_2_1_rollGroup_multMat.i[0]";
connectAttr "l_feather_2_1_fanLoc.wim" "l_feather_2_1_rollGroup_multMat.i[1]";
connectAttr "l_feather_2_1.m" "l_feather_2_1_outJoint_multMat.i[0]";
connectAttr "l_feather_2_1_rollGroup.opm" "l_feather_2_1_outJoint_multMat.i[1]";
connectAttr "l_feather_2_1_spreadGroup.m" "l_feather_2_1_outJoint_multMat.i[2]";
connectAttr "l_feather_2_1_spreadRootGroup.m" "l_feather_2_1_outJoint_multMat.i[3]"
		;
connectAttr "l_feather_2_1_group.opm" "l_feather_2_1_outJoint_multMat.i[4]";
connectAttr "l_feather_2_1_outJoint_multMat.o" "l_feather_2_1_outJoint_decMat.imat"
		;
connectAttr "l_feather_2_2_fanLoc.wm" "l_feather_2_2_group_multMat.i[0]";
connectAttr "l_feather_2_1_initLoc.wim" "l_feather_2_2_group_multMat.i[1]";
connectAttr "l_feather_2_2_bendGroup.wm" "l_feather_2_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_2_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "l_feather_2_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "l_feather_2_2_mainGroup_multMat.i[3]";
connectAttr "l_feather_2_2_bendGroup.wim" "l_feather_2_2_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_2_2_initLoc.wm" "l_feather_2_2_rollGroup_multMat.i[0]";
connectAttr "l_feather_2_2_fanLoc.wim" "l_feather_2_2_rollGroup_multMat.i[1]";
connectAttr "l_feather_2_2.m" "l_feather_2_2_outJoint_multMat.i[0]";
connectAttr "l_feather_2_2_rollGroup.opm" "l_feather_2_2_outJoint_multMat.i[1]";
connectAttr "l_feather_2_2_mainGroup.opm" "l_feather_2_2_outJoint_multMat.i[2]";
connectAttr "l_feather_2_2_bendGroup.m" "l_feather_2_2_outJoint_multMat.i[3]";
connectAttr "l_feather_2_2_spreadGroup.m" "l_feather_2_2_outJoint_multMat.i[4]";
connectAttr "l_feather_2_2_group.opm" "l_feather_2_2_outJoint_multMat.i[5]";
connectAttr "l_feather_2_2_outJoint_multMat.o" "l_feather_2_2_outJoint_decMat.imat"
		;
connectAttr "l_feather_2_3_fanLoc.wm" "l_feather_2_3_group_multMat.i[0]";
connectAttr "l_feather_2_2_initLoc.wim" "l_feather_2_3_group_multMat.i[1]";
connectAttr "l_feather_2_3_bendGroup.wm" "l_feather_2_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_2_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "l_feather_2_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "l_feather_2_3_mainGroup_multMat.i[3]";
connectAttr "l_feather_2_3_bendGroup.wim" "l_feather_2_3_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_2_3_initLoc.wm" "l_feather_2_3_rollGroup_multMat.i[0]";
connectAttr "l_feather_2_3_fanLoc.wim" "l_feather_2_3_rollGroup_multMat.i[1]";
connectAttr "l_feather_2_3.m" "l_feather_2_3_outJoint_multMat.i[0]";
connectAttr "l_feather_2_3_rollGroup.opm" "l_feather_2_3_outJoint_multMat.i[1]";
connectAttr "l_feather_2_3_mainGroup.opm" "l_feather_2_3_outJoint_multMat.i[2]";
connectAttr "l_feather_2_3_bendGroup.m" "l_feather_2_3_outJoint_multMat.i[3]";
connectAttr "l_feather_2_3_spreadGroup.m" "l_feather_2_3_outJoint_multMat.i[4]";
connectAttr "l_feather_2_3_group.opm" "l_feather_2_3_outJoint_multMat.i[5]";
connectAttr "l_feather_2_3_outJoint_multMat.o" "l_feather_2_3_outJoint_decMat.imat"
		;
connectAttr "l_feather_2_4_fanLoc.wm" "l_feather_2_4_group_multMat.i[0]";
connectAttr "l_feather_2_3_initLoc.wim" "l_feather_2_4_group_multMat.i[1]";
connectAttr "l_feather_2_4_bendGroup.wm" "l_feather_2_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_2_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "l_feather_2_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "l_feather_2_4_mainGroup_multMat.i[3]";
connectAttr "l_feather_2_4_bendGroup.wim" "l_feather_2_4_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_2_4_initLoc.wm" "l_feather_2_4_rollGroup_multMat.i[0]";
connectAttr "l_feather_2_4_fanLoc.wim" "l_feather_2_4_rollGroup_multMat.i[1]";
connectAttr "l_feather_2_4.m" "l_feather_2_4_outJoint_multMat.i[0]";
connectAttr "l_feather_2_4_rollGroup.opm" "l_feather_2_4_outJoint_multMat.i[1]";
connectAttr "l_feather_2_4_mainGroup.opm" "l_feather_2_4_outJoint_multMat.i[2]";
connectAttr "l_feather_2_4_bendGroup.m" "l_feather_2_4_outJoint_multMat.i[3]";
connectAttr "l_feather_2_4_spreadGroup.m" "l_feather_2_4_outJoint_multMat.i[4]";
connectAttr "l_feather_2_4_group.opm" "l_feather_2_4_outJoint_multMat.i[5]";
connectAttr "l_feather_2_4_outJoint_multMat.o" "l_feather_2_4_outJoint_decMat.imat"
		;
connectAttr "l_feather_2_5_fanLoc.wm" "l_feather_2_5_group_multMat.i[0]";
connectAttr "l_feather_2_4_initLoc.wim" "l_feather_2_5_group_multMat.i[1]";
connectAttr "l_feather_2_5_bendGroup.wm" "l_feather_2_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_2_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "l_feather_2_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "l_feather_2_5_mainGroup_multMat.i[3]";
connectAttr "l_feather_2_5_bendGroup.wim" "l_feather_2_5_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_2_5_initLoc.wm" "l_feather_2_5_rollGroup_multMat.i[0]";
connectAttr "l_feather_2_5_fanLoc.wim" "l_feather_2_5_rollGroup_multMat.i[1]";
connectAttr "l_feather_2_5.m" "l_feather_2_5_outJoint_multMat.i[0]";
connectAttr "l_feather_2_5_rollGroup.opm" "l_feather_2_5_outJoint_multMat.i[1]";
connectAttr "l_feather_2_5_mainGroup.opm" "l_feather_2_5_outJoint_multMat.i[2]";
connectAttr "l_feather_2_5_bendGroup.m" "l_feather_2_5_outJoint_multMat.i[3]";
connectAttr "l_feather_2_5_spreadGroup.m" "l_feather_2_5_outJoint_multMat.i[4]";
connectAttr "l_feather_2_5_group.opm" "l_feather_2_5_outJoint_multMat.i[5]";
connectAttr "l_feather_2_5_outJoint_multMat.o" "l_feather_2_5_outJoint_decMat.imat"
		;
connectAttr "l_feather_2_end_initLoc.wm" "l_feather_2_end_multMat.i[0]";
connectAttr "l_feather_2_5_initLoc.wim" "l_feather_2_end_multMat.i[1]";
connectAttr "l_feather_2_end_multMat.o" "l_feather_2_end_decMat.imat";
connectAttr "l_feather_2_1.iog" "l_feather_2_moduleControlSet.dsm" -na;
connectAttr "l_feather_2_2.iog" "l_feather_2_moduleControlSet.dsm" -na;
connectAttr "l_feather_2_3.iog" "l_feather_2_moduleControlSet.dsm" -na;
connectAttr "l_feather_2_4.iog" "l_feather_2_moduleControlSet.dsm" -na;
connectAttr "l_feather_2_5.iog" "l_feather_2_moduleControlSet.dsm" -na;
connectAttr "l_feather_3_1_fanLoc.wm" "l_feather_3_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "l_feather_3_1_group_multMat.i[1]";
connectAttr "l_feather_3_1_initLoc.wm" "l_feather_3_1_rollGroup_multMat.i[0]";
connectAttr "l_feather_3_1_fanLoc.wim" "l_feather_3_1_rollGroup_multMat.i[1]";
connectAttr "l_feather_3_1.m" "l_feather_3_1_outJoint_multMat.i[0]";
connectAttr "l_feather_3_1_rollGroup.opm" "l_feather_3_1_outJoint_multMat.i[1]";
connectAttr "l_feather_3_1_spreadGroup.m" "l_feather_3_1_outJoint_multMat.i[2]";
connectAttr "l_feather_3_1_spreadRootGroup.m" "l_feather_3_1_outJoint_multMat.i[3]"
		;
connectAttr "l_feather_3_1_group.opm" "l_feather_3_1_outJoint_multMat.i[4]";
connectAttr "l_feather_3_1_outJoint_multMat.o" "l_feather_3_1_outJoint_decMat.imat"
		;
connectAttr "l_feather_3_2_fanLoc.wm" "l_feather_3_2_group_multMat.i[0]";
connectAttr "l_feather_3_1_initLoc.wim" "l_feather_3_2_group_multMat.i[1]";
connectAttr "l_feather_3_2_bendGroup.wm" "l_feather_3_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_3_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "l_feather_3_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "l_feather_3_2_mainGroup_multMat.i[3]";
connectAttr "l_feather_3_2_bendGroup.wim" "l_feather_3_2_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_3_2_initLoc.wm" "l_feather_3_2_rollGroup_multMat.i[0]";
connectAttr "l_feather_3_2_fanLoc.wim" "l_feather_3_2_rollGroup_multMat.i[1]";
connectAttr "l_feather_3_2.m" "l_feather_3_2_outJoint_multMat.i[0]";
connectAttr "l_feather_3_2_rollGroup.opm" "l_feather_3_2_outJoint_multMat.i[1]";
connectAttr "l_feather_3_2_mainGroup.opm" "l_feather_3_2_outJoint_multMat.i[2]";
connectAttr "l_feather_3_2_bendGroup.m" "l_feather_3_2_outJoint_multMat.i[3]";
connectAttr "l_feather_3_2_spreadGroup.m" "l_feather_3_2_outJoint_multMat.i[4]";
connectAttr "l_feather_3_2_group.opm" "l_feather_3_2_outJoint_multMat.i[5]";
connectAttr "l_feather_3_2_outJoint_multMat.o" "l_feather_3_2_outJoint_decMat.imat"
		;
connectAttr "l_feather_3_3_fanLoc.wm" "l_feather_3_3_group_multMat.i[0]";
connectAttr "l_feather_3_2_initLoc.wim" "l_feather_3_3_group_multMat.i[1]";
connectAttr "l_feather_3_3_bendGroup.wm" "l_feather_3_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_3_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "l_feather_3_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "l_feather_3_3_mainGroup_multMat.i[3]";
connectAttr "l_feather_3_3_bendGroup.wim" "l_feather_3_3_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_3_3_initLoc.wm" "l_feather_3_3_rollGroup_multMat.i[0]";
connectAttr "l_feather_3_3_fanLoc.wim" "l_feather_3_3_rollGroup_multMat.i[1]";
connectAttr "l_feather_3_3.m" "l_feather_3_3_outJoint_multMat.i[0]";
connectAttr "l_feather_3_3_rollGroup.opm" "l_feather_3_3_outJoint_multMat.i[1]";
connectAttr "l_feather_3_3_mainGroup.opm" "l_feather_3_3_outJoint_multMat.i[2]";
connectAttr "l_feather_3_3_bendGroup.m" "l_feather_3_3_outJoint_multMat.i[3]";
connectAttr "l_feather_3_3_spreadGroup.m" "l_feather_3_3_outJoint_multMat.i[4]";
connectAttr "l_feather_3_3_group.opm" "l_feather_3_3_outJoint_multMat.i[5]";
connectAttr "l_feather_3_3_outJoint_multMat.o" "l_feather_3_3_outJoint_decMat.imat"
		;
connectAttr "l_feather_3_4_fanLoc.wm" "l_feather_3_4_group_multMat.i[0]";
connectAttr "l_feather_3_3_initLoc.wim" "l_feather_3_4_group_multMat.i[1]";
connectAttr "l_feather_3_4_bendGroup.wm" "l_feather_3_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_3_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "l_feather_3_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "l_feather_3_4_mainGroup_multMat.i[3]";
connectAttr "l_feather_3_4_bendGroup.wim" "l_feather_3_4_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_3_4_initLoc.wm" "l_feather_3_4_rollGroup_multMat.i[0]";
connectAttr "l_feather_3_4_fanLoc.wim" "l_feather_3_4_rollGroup_multMat.i[1]";
connectAttr "l_feather_3_4.m" "l_feather_3_4_outJoint_multMat.i[0]";
connectAttr "l_feather_3_4_rollGroup.opm" "l_feather_3_4_outJoint_multMat.i[1]";
connectAttr "l_feather_3_4_mainGroup.opm" "l_feather_3_4_outJoint_multMat.i[2]";
connectAttr "l_feather_3_4_bendGroup.m" "l_feather_3_4_outJoint_multMat.i[3]";
connectAttr "l_feather_3_4_spreadGroup.m" "l_feather_3_4_outJoint_multMat.i[4]";
connectAttr "l_feather_3_4_group.opm" "l_feather_3_4_outJoint_multMat.i[5]";
connectAttr "l_feather_3_4_outJoint_multMat.o" "l_feather_3_4_outJoint_decMat.imat"
		;
connectAttr "l_feather_3_5_fanLoc.wm" "l_feather_3_5_group_multMat.i[0]";
connectAttr "l_feather_3_4_initLoc.wim" "l_feather_3_5_group_multMat.i[1]";
connectAttr "l_feather_3_5_bendGroup.wm" "l_feather_3_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_3_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "l_feather_3_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "l_feather_3_5_mainGroup_multMat.i[3]";
connectAttr "l_feather_3_5_bendGroup.wim" "l_feather_3_5_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_3_5_initLoc.wm" "l_feather_3_5_rollGroup_multMat.i[0]";
connectAttr "l_feather_3_5_fanLoc.wim" "l_feather_3_5_rollGroup_multMat.i[1]";
connectAttr "l_feather_3_5.m" "l_feather_3_5_outJoint_multMat.i[0]";
connectAttr "l_feather_3_5_rollGroup.opm" "l_feather_3_5_outJoint_multMat.i[1]";
connectAttr "l_feather_3_5_mainGroup.opm" "l_feather_3_5_outJoint_multMat.i[2]";
connectAttr "l_feather_3_5_bendGroup.m" "l_feather_3_5_outJoint_multMat.i[3]";
connectAttr "l_feather_3_5_spreadGroup.m" "l_feather_3_5_outJoint_multMat.i[4]";
connectAttr "l_feather_3_5_group.opm" "l_feather_3_5_outJoint_multMat.i[5]";
connectAttr "l_feather_3_5_outJoint_multMat.o" "l_feather_3_5_outJoint_decMat.imat"
		;
connectAttr "l_feather_3_end_initLoc.wm" "l_feather_3_end_multMat.i[0]";
connectAttr "l_feather_3_5_initLoc.wim" "l_feather_3_end_multMat.i[1]";
connectAttr "l_feather_3_end_multMat.o" "l_feather_3_end_decMat.imat";
connectAttr "l_feather_3_1.iog" "l_feather_3_moduleControlSet.dsm" -na;
connectAttr "l_feather_3_2.iog" "l_feather_3_moduleControlSet.dsm" -na;
connectAttr "l_feather_3_3.iog" "l_feather_3_moduleControlSet.dsm" -na;
connectAttr "l_feather_3_4.iog" "l_feather_3_moduleControlSet.dsm" -na;
connectAttr "l_feather_3_5.iog" "l_feather_3_moduleControlSet.dsm" -na;
connectAttr "l_feather_4_1_fanLoc.wm" "l_feather_4_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "l_feather_4_1_group_multMat.i[1]";
connectAttr "l_feather_4_1_initLoc.wm" "l_feather_4_1_rollGroup_multMat.i[0]";
connectAttr "l_feather_4_1_fanLoc.wim" "l_feather_4_1_rollGroup_multMat.i[1]";
connectAttr "l_feather_4_1.m" "l_feather_4_1_outJoint_multMat.i[0]";
connectAttr "l_feather_4_1_rollGroup.opm" "l_feather_4_1_outJoint_multMat.i[1]";
connectAttr "l_feather_4_1_spreadGroup.m" "l_feather_4_1_outJoint_multMat.i[2]";
connectAttr "l_feather_4_1_spreadRootGroup.m" "l_feather_4_1_outJoint_multMat.i[3]"
		;
connectAttr "l_feather_4_1_group.opm" "l_feather_4_1_outJoint_multMat.i[4]";
connectAttr "l_feather_4_1_outJoint_multMat.o" "l_feather_4_1_outJoint_decMat.imat"
		;
connectAttr "l_feather_4_2_fanLoc.wm" "l_feather_4_2_group_multMat.i[0]";
connectAttr "l_feather_4_1_initLoc.wim" "l_feather_4_2_group_multMat.i[1]";
connectAttr "l_feather_4_2_bendGroup.wm" "l_feather_4_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_4_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "l_feather_4_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "l_feather_4_2_mainGroup_multMat.i[3]";
connectAttr "l_feather_4_2_bendGroup.wim" "l_feather_4_2_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_4_2_initLoc.wm" "l_feather_4_2_rollGroup_multMat.i[0]";
connectAttr "l_feather_4_2_fanLoc.wim" "l_feather_4_2_rollGroup_multMat.i[1]";
connectAttr "l_feather_4_2.m" "l_feather_4_2_outJoint_multMat.i[0]";
connectAttr "l_feather_4_2_rollGroup.opm" "l_feather_4_2_outJoint_multMat.i[1]";
connectAttr "l_feather_4_2_mainGroup.opm" "l_feather_4_2_outJoint_multMat.i[2]";
connectAttr "l_feather_4_2_bendGroup.m" "l_feather_4_2_outJoint_multMat.i[3]";
connectAttr "l_feather_4_2_spreadGroup.m" "l_feather_4_2_outJoint_multMat.i[4]";
connectAttr "l_feather_4_2_group.opm" "l_feather_4_2_outJoint_multMat.i[5]";
connectAttr "l_feather_4_2_outJoint_multMat.o" "l_feather_4_2_outJoint_decMat.imat"
		;
connectAttr "l_feather_4_3_fanLoc.wm" "l_feather_4_3_group_multMat.i[0]";
connectAttr "l_feather_4_2_initLoc.wim" "l_feather_4_3_group_multMat.i[1]";
connectAttr "l_feather_4_3_bendGroup.wm" "l_feather_4_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_4_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "l_feather_4_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "l_feather_4_3_mainGroup_multMat.i[3]";
connectAttr "l_feather_4_3_bendGroup.wim" "l_feather_4_3_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_4_3_initLoc.wm" "l_feather_4_3_rollGroup_multMat.i[0]";
connectAttr "l_feather_4_3_fanLoc.wim" "l_feather_4_3_rollGroup_multMat.i[1]";
connectAttr "l_feather_4_3.m" "l_feather_4_3_outJoint_multMat.i[0]";
connectAttr "l_feather_4_3_rollGroup.opm" "l_feather_4_3_outJoint_multMat.i[1]";
connectAttr "l_feather_4_3_mainGroup.opm" "l_feather_4_3_outJoint_multMat.i[2]";
connectAttr "l_feather_4_3_bendGroup.m" "l_feather_4_3_outJoint_multMat.i[3]";
connectAttr "l_feather_4_3_spreadGroup.m" "l_feather_4_3_outJoint_multMat.i[4]";
connectAttr "l_feather_4_3_group.opm" "l_feather_4_3_outJoint_multMat.i[5]";
connectAttr "l_feather_4_3_outJoint_multMat.o" "l_feather_4_3_outJoint_decMat.imat"
		;
connectAttr "l_feather_4_4_fanLoc.wm" "l_feather_4_4_group_multMat.i[0]";
connectAttr "l_feather_4_3_initLoc.wim" "l_feather_4_4_group_multMat.i[1]";
connectAttr "l_feather_4_4_bendGroup.wm" "l_feather_4_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_4_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "l_feather_4_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "l_feather_4_4_mainGroup_multMat.i[3]";
connectAttr "l_feather_4_4_bendGroup.wim" "l_feather_4_4_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_4_4_initLoc.wm" "l_feather_4_4_rollGroup_multMat.i[0]";
connectAttr "l_feather_4_4_fanLoc.wim" "l_feather_4_4_rollGroup_multMat.i[1]";
connectAttr "l_feather_4_4.m" "l_feather_4_4_outJoint_multMat.i[0]";
connectAttr "l_feather_4_4_rollGroup.opm" "l_feather_4_4_outJoint_multMat.i[1]";
connectAttr "l_feather_4_4_mainGroup.opm" "l_feather_4_4_outJoint_multMat.i[2]";
connectAttr "l_feather_4_4_bendGroup.m" "l_feather_4_4_outJoint_multMat.i[3]";
connectAttr "l_feather_4_4_spreadGroup.m" "l_feather_4_4_outJoint_multMat.i[4]";
connectAttr "l_feather_4_4_group.opm" "l_feather_4_4_outJoint_multMat.i[5]";
connectAttr "l_feather_4_4_outJoint_multMat.o" "l_feather_4_4_outJoint_decMat.imat"
		;
connectAttr "l_feather_4_5_fanLoc.wm" "l_feather_4_5_group_multMat.i[0]";
connectAttr "l_feather_4_4_initLoc.wim" "l_feather_4_5_group_multMat.i[1]";
connectAttr "l_feather_4_5_bendGroup.wm" "l_feather_4_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_4_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "l_feather_4_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "l_feather_4_5_mainGroup_multMat.i[3]";
connectAttr "l_feather_4_5_bendGroup.wim" "l_feather_4_5_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_4_5_initLoc.wm" "l_feather_4_5_rollGroup_multMat.i[0]";
connectAttr "l_feather_4_5_fanLoc.wim" "l_feather_4_5_rollGroup_multMat.i[1]";
connectAttr "l_feather_4_5.m" "l_feather_4_5_outJoint_multMat.i[0]";
connectAttr "l_feather_4_5_rollGroup.opm" "l_feather_4_5_outJoint_multMat.i[1]";
connectAttr "l_feather_4_5_mainGroup.opm" "l_feather_4_5_outJoint_multMat.i[2]";
connectAttr "l_feather_4_5_bendGroup.m" "l_feather_4_5_outJoint_multMat.i[3]";
connectAttr "l_feather_4_5_spreadGroup.m" "l_feather_4_5_outJoint_multMat.i[4]";
connectAttr "l_feather_4_5_group.opm" "l_feather_4_5_outJoint_multMat.i[5]";
connectAttr "l_feather_4_5_outJoint_multMat.o" "l_feather_4_5_outJoint_decMat.imat"
		;
connectAttr "l_feather_4_end_initLoc.wm" "l_feather_4_end_multMat.i[0]";
connectAttr "l_feather_4_5_initLoc.wim" "l_feather_4_end_multMat.i[1]";
connectAttr "l_feather_4_end_multMat.o" "l_feather_4_end_decMat.imat";
connectAttr "l_feather_4_1.iog" "l_feather_4_moduleControlSet.dsm" -na;
connectAttr "l_feather_4_2.iog" "l_feather_4_moduleControlSet.dsm" -na;
connectAttr "l_feather_4_3.iog" "l_feather_4_moduleControlSet.dsm" -na;
connectAttr "l_feather_4_4.iog" "l_feather_4_moduleControlSet.dsm" -na;
connectAttr "l_feather_4_5.iog" "l_feather_4_moduleControlSet.dsm" -na;
connectAttr "l_feather_5_1_fanLoc.wm" "l_feather_5_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "l_feather_5_1_group_multMat.i[1]";
connectAttr "l_feather_5_1_initLoc.wm" "l_feather_5_1_rollGroup_multMat.i[0]";
connectAttr "l_feather_5_1_fanLoc.wim" "l_feather_5_1_rollGroup_multMat.i[1]";
connectAttr "l_feather_5_1.m" "l_feather_5_1_outJoint_multMat.i[0]";
connectAttr "l_feather_5_1_rollGroup.opm" "l_feather_5_1_outJoint_multMat.i[1]";
connectAttr "l_feather_5_1_spreadGroup.m" "l_feather_5_1_outJoint_multMat.i[2]";
connectAttr "l_feather_5_1_spreadRootGroup.m" "l_feather_5_1_outJoint_multMat.i[3]"
		;
connectAttr "l_feather_5_1_group.opm" "l_feather_5_1_outJoint_multMat.i[4]";
connectAttr "l_feather_5_1_outJoint_multMat.o" "l_feather_5_1_outJoint_decMat.imat"
		;
connectAttr "l_feather_5_2_fanLoc.wm" "l_feather_5_2_group_multMat.i[0]";
connectAttr "l_feather_5_1_initLoc.wim" "l_feather_5_2_group_multMat.i[1]";
connectAttr "l_feather_5_2_bendGroup.wm" "l_feather_5_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_5_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "l_feather_5_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "l_feather_5_2_mainGroup_multMat.i[3]";
connectAttr "l_feather_5_2_bendGroup.wim" "l_feather_5_2_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_5_2_initLoc.wm" "l_feather_5_2_rollGroup_multMat.i[0]";
connectAttr "l_feather_5_2_fanLoc.wim" "l_feather_5_2_rollGroup_multMat.i[1]";
connectAttr "l_feather_5_2.m" "l_feather_5_2_outJoint_multMat.i[0]";
connectAttr "l_feather_5_2_rollGroup.opm" "l_feather_5_2_outJoint_multMat.i[1]";
connectAttr "l_feather_5_2_mainGroup.opm" "l_feather_5_2_outJoint_multMat.i[2]";
connectAttr "l_feather_5_2_bendGroup.m" "l_feather_5_2_outJoint_multMat.i[3]";
connectAttr "l_feather_5_2_spreadGroup.m" "l_feather_5_2_outJoint_multMat.i[4]";
connectAttr "l_feather_5_2_group.opm" "l_feather_5_2_outJoint_multMat.i[5]";
connectAttr "l_feather_5_2_outJoint_multMat.o" "l_feather_5_2_outJoint_decMat.imat"
		;
connectAttr "l_feather_5_3_fanLoc.wm" "l_feather_5_3_group_multMat.i[0]";
connectAttr "l_feather_5_2_initLoc.wim" "l_feather_5_3_group_multMat.i[1]";
connectAttr "l_feather_5_3_bendGroup.wm" "l_feather_5_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_5_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "l_feather_5_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "l_feather_5_3_mainGroup_multMat.i[3]";
connectAttr "l_feather_5_3_bendGroup.wim" "l_feather_5_3_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_5_3_initLoc.wm" "l_feather_5_3_rollGroup_multMat.i[0]";
connectAttr "l_feather_5_3_fanLoc.wim" "l_feather_5_3_rollGroup_multMat.i[1]";
connectAttr "l_feather_5_3.m" "l_feather_5_3_outJoint_multMat.i[0]";
connectAttr "l_feather_5_3_rollGroup.opm" "l_feather_5_3_outJoint_multMat.i[1]";
connectAttr "l_feather_5_3_mainGroup.opm" "l_feather_5_3_outJoint_multMat.i[2]";
connectAttr "l_feather_5_3_bendGroup.m" "l_feather_5_3_outJoint_multMat.i[3]";
connectAttr "l_feather_5_3_spreadGroup.m" "l_feather_5_3_outJoint_multMat.i[4]";
connectAttr "l_feather_5_3_group.opm" "l_feather_5_3_outJoint_multMat.i[5]";
connectAttr "l_feather_5_3_outJoint_multMat.o" "l_feather_5_3_outJoint_decMat.imat"
		;
connectAttr "l_feather_5_4_fanLoc.wm" "l_feather_5_4_group_multMat.i[0]";
connectAttr "l_feather_5_3_initLoc.wim" "l_feather_5_4_group_multMat.i[1]";
connectAttr "l_feather_5_4_bendGroup.wm" "l_feather_5_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_5_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "l_feather_5_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "l_feather_5_4_mainGroup_multMat.i[3]";
connectAttr "l_feather_5_4_bendGroup.wim" "l_feather_5_4_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_5_4_initLoc.wm" "l_feather_5_4_rollGroup_multMat.i[0]";
connectAttr "l_feather_5_4_fanLoc.wim" "l_feather_5_4_rollGroup_multMat.i[1]";
connectAttr "l_feather_5_4.m" "l_feather_5_4_outJoint_multMat.i[0]";
connectAttr "l_feather_5_4_rollGroup.opm" "l_feather_5_4_outJoint_multMat.i[1]";
connectAttr "l_feather_5_4_mainGroup.opm" "l_feather_5_4_outJoint_multMat.i[2]";
connectAttr "l_feather_5_4_bendGroup.m" "l_feather_5_4_outJoint_multMat.i[3]";
connectAttr "l_feather_5_4_spreadGroup.m" "l_feather_5_4_outJoint_multMat.i[4]";
connectAttr "l_feather_5_4_group.opm" "l_feather_5_4_outJoint_multMat.i[5]";
connectAttr "l_feather_5_4_outJoint_multMat.o" "l_feather_5_4_outJoint_decMat.imat"
		;
connectAttr "l_feather_5_5_fanLoc.wm" "l_feather_5_5_group_multMat.i[0]";
connectAttr "l_feather_5_4_initLoc.wim" "l_feather_5_5_group_multMat.i[1]";
connectAttr "l_feather_5_5_bendGroup.wm" "l_feather_5_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_5_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "l_feather_5_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "l_feather_5_5_mainGroup_multMat.i[3]";
connectAttr "l_feather_5_5_bendGroup.wim" "l_feather_5_5_mainGroup_multMat.i[4]"
		;
connectAttr "l_feather_5_5_initLoc.wm" "l_feather_5_5_rollGroup_multMat.i[0]";
connectAttr "l_feather_5_5_fanLoc.wim" "l_feather_5_5_rollGroup_multMat.i[1]";
connectAttr "l_feather_5_5.m" "l_feather_5_5_outJoint_multMat.i[0]";
connectAttr "l_feather_5_5_rollGroup.opm" "l_feather_5_5_outJoint_multMat.i[1]";
connectAttr "l_feather_5_5_mainGroup.opm" "l_feather_5_5_outJoint_multMat.i[2]";
connectAttr "l_feather_5_5_bendGroup.m" "l_feather_5_5_outJoint_multMat.i[3]";
connectAttr "l_feather_5_5_spreadGroup.m" "l_feather_5_5_outJoint_multMat.i[4]";
connectAttr "l_feather_5_5_group.opm" "l_feather_5_5_outJoint_multMat.i[5]";
connectAttr "l_feather_5_5_outJoint_multMat.o" "l_feather_5_5_outJoint_decMat.imat"
		;
connectAttr "l_feather_5_end_initLoc.wm" "l_feather_5_end_multMat.i[0]";
connectAttr "l_feather_5_5_initLoc.wim" "l_feather_5_end_multMat.i[1]";
connectAttr "l_feather_5_end_multMat.o" "l_feather_5_end_decMat.imat";
connectAttr "l_feather_5_1.iog" "l_feather_5_moduleControlSet.dsm" -na;
connectAttr "l_feather_5_2.iog" "l_feather_5_moduleControlSet.dsm" -na;
connectAttr "l_feather_5_3.iog" "l_feather_5_moduleControlSet.dsm" -na;
connectAttr "l_feather_5_4.iog" "l_feather_5_moduleControlSet.dsm" -na;
connectAttr "l_feather_5_5.iog" "l_feather_5_moduleControlSet.dsm" -na;
connectAttr "r_feather_1_1_fanLoc.wm" "r_feather_1_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "r_feather_1_1_group_multMat.i[1]";
connectAttr "r_feather_1_1.m" "r_feather_1_1_outJoint_multMat.i[0]";
connectAttr "r_feather_1_1_rollGroup.opm" "r_feather_1_1_outJoint_multMat.i[1]";
connectAttr "r_feather_1_1_spreadGroup.m" "r_feather_1_1_outJoint_multMat.i[2]";
connectAttr "r_feather_1_1_spreadRootGroup.m" "r_feather_1_1_outJoint_multMat.i[3]"
		;
connectAttr "r_feather_1_1_group.opm" "r_feather_1_1_outJoint_multMat.i[4]";
connectAttr "r_feather_1_1_outJoint_multMat.o" "r_feather_1_1_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_2_bendGroup.wm" "r_feather_1_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_1_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "r_feather_1_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "r_feather_1_2_mainGroup_multMat.i[3]";
connectAttr "r_feather_1_2_bendGroup.wim" "r_feather_1_2_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_1_2.m" "r_feather_1_2_outJoint_multMat.i[0]";
connectAttr "r_feather_1_2_rollGroup.opm" "r_feather_1_2_outJoint_multMat.i[1]";
connectAttr "r_feather_1_2_mainGroup.opm" "r_feather_1_2_outJoint_multMat.i[2]";
connectAttr "r_feather_1_2_bendGroup.m" "r_feather_1_2_outJoint_multMat.i[3]";
connectAttr "r_feather_1_2_spreadGroup.m" "r_feather_1_2_outJoint_multMat.i[4]";
connectAttr "r_feather_1_2_group.opm" "r_feather_1_2_outJoint_multMat.i[5]";
connectAttr "r_feather_1_2_outJoint_multMat.o" "r_feather_1_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_3_bendGroup.wm" "r_feather_1_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_1_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "r_feather_1_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "r_feather_1_3_mainGroup_multMat.i[3]";
connectAttr "r_feather_1_3_bendGroup.wim" "r_feather_1_3_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_1_3.m" "r_feather_1_3_outJoint_multMat.i[0]";
connectAttr "r_feather_1_3_rollGroup.opm" "r_feather_1_3_outJoint_multMat.i[1]";
connectAttr "r_feather_1_3_mainGroup.opm" "r_feather_1_3_outJoint_multMat.i[2]";
connectAttr "r_feather_1_3_bendGroup.m" "r_feather_1_3_outJoint_multMat.i[3]";
connectAttr "r_feather_1_3_spreadGroup.m" "r_feather_1_3_outJoint_multMat.i[4]";
connectAttr "r_feather_1_3_group.opm" "r_feather_1_3_outJoint_multMat.i[5]";
connectAttr "r_feather_1_3_outJoint_multMat.o" "r_feather_1_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_4_bendGroup.wm" "r_feather_1_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_1_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "r_feather_1_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "r_feather_1_4_mainGroup_multMat.i[3]";
connectAttr "r_feather_1_4_bendGroup.wim" "r_feather_1_4_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_1_4.m" "r_feather_1_4_outJoint_multMat.i[0]";
connectAttr "r_feather_1_4_rollGroup.opm" "r_feather_1_4_outJoint_multMat.i[1]";
connectAttr "r_feather_1_4_mainGroup.opm" "r_feather_1_4_outJoint_multMat.i[2]";
connectAttr "r_feather_1_4_bendGroup.m" "r_feather_1_4_outJoint_multMat.i[3]";
connectAttr "r_feather_1_4_spreadGroup.m" "r_feather_1_4_outJoint_multMat.i[4]";
connectAttr "r_feather_1_4_group.opm" "r_feather_1_4_outJoint_multMat.i[5]";
connectAttr "r_feather_1_4_outJoint_multMat.o" "r_feather_1_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_5_bendGroup.wm" "r_feather_1_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_1_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "r_feather_1_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "r_feather_1_5_mainGroup_multMat.i[3]";
connectAttr "r_feather_1_5_bendGroup.wim" "r_feather_1_5_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_1_5.m" "r_feather_1_5_outJoint_multMat.i[0]";
connectAttr "r_feather_1_5_rollGroup.opm" "r_feather_1_5_outJoint_multMat.i[1]";
connectAttr "r_feather_1_5_mainGroup.opm" "r_feather_1_5_outJoint_multMat.i[2]";
connectAttr "r_feather_1_5_bendGroup.m" "r_feather_1_5_outJoint_multMat.i[3]";
connectAttr "r_feather_1_5_spreadGroup.m" "r_feather_1_5_outJoint_multMat.i[4]";
connectAttr "r_feather_1_5_group.opm" "r_feather_1_5_outJoint_multMat.i[5]";
connectAttr "r_feather_1_5_outJoint_multMat.o" "r_feather_1_5_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_1.iog" "r_feather_1_moduleControlSet.dsm" -na;
connectAttr "r_feather_1_2.iog" "r_feather_1_moduleControlSet.dsm" -na;
connectAttr "r_feather_1_3.iog" "r_feather_1_moduleControlSet.dsm" -na;
connectAttr "r_feather_1_4.iog" "r_feather_1_moduleControlSet.dsm" -na;
connectAttr "r_feather_1_5.iog" "r_feather_1_moduleControlSet.dsm" -na;
connectAttr "r_feather_2_1_fanLoc.wm" "r_feather_2_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "r_feather_2_1_group_multMat.i[1]";
connectAttr "r_feather_2_1.m" "r_feather_2_1_outJoint_multMat.i[0]";
connectAttr "r_feather_2_1_rollGroup.opm" "r_feather_2_1_outJoint_multMat.i[1]";
connectAttr "r_feather_2_1_spreadGroup.m" "r_feather_2_1_outJoint_multMat.i[2]";
connectAttr "r_feather_2_1_spreadRootGroup.m" "r_feather_2_1_outJoint_multMat.i[3]"
		;
connectAttr "r_feather_2_1_group.opm" "r_feather_2_1_outJoint_multMat.i[4]";
connectAttr "r_feather_2_1_outJoint_multMat.o" "r_feather_2_1_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_2_bendGroup.wm" "r_feather_2_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_2_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "r_feather_2_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "r_feather_2_2_mainGroup_multMat.i[3]";
connectAttr "r_feather_2_2_bendGroup.wim" "r_feather_2_2_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_2_2.m" "r_feather_2_2_outJoint_multMat.i[0]";
connectAttr "r_feather_2_2_rollGroup.opm" "r_feather_2_2_outJoint_multMat.i[1]";
connectAttr "r_feather_2_2_mainGroup.opm" "r_feather_2_2_outJoint_multMat.i[2]";
connectAttr "r_feather_2_2_bendGroup.m" "r_feather_2_2_outJoint_multMat.i[3]";
connectAttr "r_feather_2_2_spreadGroup.m" "r_feather_2_2_outJoint_multMat.i[4]";
connectAttr "r_feather_2_2_group.opm" "r_feather_2_2_outJoint_multMat.i[5]";
connectAttr "r_feather_2_2_outJoint_multMat.o" "r_feather_2_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_3_bendGroup.wm" "r_feather_2_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_2_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "r_feather_2_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "r_feather_2_3_mainGroup_multMat.i[3]";
connectAttr "r_feather_2_3_bendGroup.wim" "r_feather_2_3_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_2_3.m" "r_feather_2_3_outJoint_multMat.i[0]";
connectAttr "r_feather_2_3_rollGroup.opm" "r_feather_2_3_outJoint_multMat.i[1]";
connectAttr "r_feather_2_3_mainGroup.opm" "r_feather_2_3_outJoint_multMat.i[2]";
connectAttr "r_feather_2_3_bendGroup.m" "r_feather_2_3_outJoint_multMat.i[3]";
connectAttr "r_feather_2_3_spreadGroup.m" "r_feather_2_3_outJoint_multMat.i[4]";
connectAttr "r_feather_2_3_group.opm" "r_feather_2_3_outJoint_multMat.i[5]";
connectAttr "r_feather_2_3_outJoint_multMat.o" "r_feather_2_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_4_bendGroup.wm" "r_feather_2_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_2_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "r_feather_2_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "r_feather_2_4_mainGroup_multMat.i[3]";
connectAttr "r_feather_2_4_bendGroup.wim" "r_feather_2_4_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_2_4.m" "r_feather_2_4_outJoint_multMat.i[0]";
connectAttr "r_feather_2_4_rollGroup.opm" "r_feather_2_4_outJoint_multMat.i[1]";
connectAttr "r_feather_2_4_mainGroup.opm" "r_feather_2_4_outJoint_multMat.i[2]";
connectAttr "r_feather_2_4_bendGroup.m" "r_feather_2_4_outJoint_multMat.i[3]";
connectAttr "r_feather_2_4_spreadGroup.m" "r_feather_2_4_outJoint_multMat.i[4]";
connectAttr "r_feather_2_4_group.opm" "r_feather_2_4_outJoint_multMat.i[5]";
connectAttr "r_feather_2_4_outJoint_multMat.o" "r_feather_2_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_5_bendGroup.wm" "r_feather_2_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_2_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "r_feather_2_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "r_feather_2_5_mainGroup_multMat.i[3]";
connectAttr "r_feather_2_5_bendGroup.wim" "r_feather_2_5_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_2_5.m" "r_feather_2_5_outJoint_multMat.i[0]";
connectAttr "r_feather_2_5_rollGroup.opm" "r_feather_2_5_outJoint_multMat.i[1]";
connectAttr "r_feather_2_5_mainGroup.opm" "r_feather_2_5_outJoint_multMat.i[2]";
connectAttr "r_feather_2_5_bendGroup.m" "r_feather_2_5_outJoint_multMat.i[3]";
connectAttr "r_feather_2_5_spreadGroup.m" "r_feather_2_5_outJoint_multMat.i[4]";
connectAttr "r_feather_2_5_group.opm" "r_feather_2_5_outJoint_multMat.i[5]";
connectAttr "r_feather_2_5_outJoint_multMat.o" "r_feather_2_5_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_1.iog" "r_feather_2_moduleControlSet.dsm" -na;
connectAttr "r_feather_2_2.iog" "r_feather_2_moduleControlSet.dsm" -na;
connectAttr "r_feather_2_3.iog" "r_feather_2_moduleControlSet.dsm" -na;
connectAttr "r_feather_2_4.iog" "r_feather_2_moduleControlSet.dsm" -na;
connectAttr "r_feather_2_5.iog" "r_feather_2_moduleControlSet.dsm" -na;
connectAttr "r_feather_3_1_fanLoc.wm" "r_feather_3_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "r_feather_3_1_group_multMat.i[1]";
connectAttr "r_feather_3_1.m" "r_feather_3_1_outJoint_multMat.i[0]";
connectAttr "r_feather_3_1_rollGroup.opm" "r_feather_3_1_outJoint_multMat.i[1]";
connectAttr "r_feather_3_1_spreadGroup.m" "r_feather_3_1_outJoint_multMat.i[2]";
connectAttr "r_feather_3_1_spreadRootGroup.m" "r_feather_3_1_outJoint_multMat.i[3]"
		;
connectAttr "r_feather_3_1_group.opm" "r_feather_3_1_outJoint_multMat.i[4]";
connectAttr "r_feather_3_1_outJoint_multMat.o" "r_feather_3_1_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_2_bendGroup.wm" "r_feather_3_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_3_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "r_feather_3_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "r_feather_3_2_mainGroup_multMat.i[3]";
connectAttr "r_feather_3_2_bendGroup.wim" "r_feather_3_2_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_3_2.m" "r_feather_3_2_outJoint_multMat.i[0]";
connectAttr "r_feather_3_2_rollGroup.opm" "r_feather_3_2_outJoint_multMat.i[1]";
connectAttr "r_feather_3_2_mainGroup.opm" "r_feather_3_2_outJoint_multMat.i[2]";
connectAttr "r_feather_3_2_bendGroup.m" "r_feather_3_2_outJoint_multMat.i[3]";
connectAttr "r_feather_3_2_spreadGroup.m" "r_feather_3_2_outJoint_multMat.i[4]";
connectAttr "r_feather_3_2_group.opm" "r_feather_3_2_outJoint_multMat.i[5]";
connectAttr "r_feather_3_2_outJoint_multMat.o" "r_feather_3_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_3_bendGroup.wm" "r_feather_3_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_3_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "r_feather_3_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "r_feather_3_3_mainGroup_multMat.i[3]";
connectAttr "r_feather_3_3_bendGroup.wim" "r_feather_3_3_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_3_3.m" "r_feather_3_3_outJoint_multMat.i[0]";
connectAttr "r_feather_3_3_rollGroup.opm" "r_feather_3_3_outJoint_multMat.i[1]";
connectAttr "r_feather_3_3_mainGroup.opm" "r_feather_3_3_outJoint_multMat.i[2]";
connectAttr "r_feather_3_3_bendGroup.m" "r_feather_3_3_outJoint_multMat.i[3]";
connectAttr "r_feather_3_3_spreadGroup.m" "r_feather_3_3_outJoint_multMat.i[4]";
connectAttr "r_feather_3_3_group.opm" "r_feather_3_3_outJoint_multMat.i[5]";
connectAttr "r_feather_3_3_outJoint_multMat.o" "r_feather_3_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_4_bendGroup.wm" "r_feather_3_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_3_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "r_feather_3_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "r_feather_3_4_mainGroup_multMat.i[3]";
connectAttr "r_feather_3_4_bendGroup.wim" "r_feather_3_4_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_3_4.m" "r_feather_3_4_outJoint_multMat.i[0]";
connectAttr "r_feather_3_4_rollGroup.opm" "r_feather_3_4_outJoint_multMat.i[1]";
connectAttr "r_feather_3_4_mainGroup.opm" "r_feather_3_4_outJoint_multMat.i[2]";
connectAttr "r_feather_3_4_bendGroup.m" "r_feather_3_4_outJoint_multMat.i[3]";
connectAttr "r_feather_3_4_spreadGroup.m" "r_feather_3_4_outJoint_multMat.i[4]";
connectAttr "r_feather_3_4_group.opm" "r_feather_3_4_outJoint_multMat.i[5]";
connectAttr "r_feather_3_4_outJoint_multMat.o" "r_feather_3_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_5_bendGroup.wm" "r_feather_3_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_3_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "r_feather_3_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "r_feather_3_5_mainGroup_multMat.i[3]";
connectAttr "r_feather_3_5_bendGroup.wim" "r_feather_3_5_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_3_5.m" "r_feather_3_5_outJoint_multMat.i[0]";
connectAttr "r_feather_3_5_rollGroup.opm" "r_feather_3_5_outJoint_multMat.i[1]";
connectAttr "r_feather_3_5_mainGroup.opm" "r_feather_3_5_outJoint_multMat.i[2]";
connectAttr "r_feather_3_5_bendGroup.m" "r_feather_3_5_outJoint_multMat.i[3]";
connectAttr "r_feather_3_5_spreadGroup.m" "r_feather_3_5_outJoint_multMat.i[4]";
connectAttr "r_feather_3_5_group.opm" "r_feather_3_5_outJoint_multMat.i[5]";
connectAttr "r_feather_3_5_outJoint_multMat.o" "r_feather_3_5_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_1.iog" "r_feather_3_moduleControlSet.dsm" -na;
connectAttr "r_feather_3_2.iog" "r_feather_3_moduleControlSet.dsm" -na;
connectAttr "r_feather_3_3.iog" "r_feather_3_moduleControlSet.dsm" -na;
connectAttr "r_feather_3_4.iog" "r_feather_3_moduleControlSet.dsm" -na;
connectAttr "r_feather_3_5.iog" "r_feather_3_moduleControlSet.dsm" -na;
connectAttr "r_feather_4_1_fanLoc.wm" "r_feather_4_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "r_feather_4_1_group_multMat.i[1]";
connectAttr "r_feather_4_1.m" "r_feather_4_1_outJoint_multMat.i[0]";
connectAttr "r_feather_4_1_rollGroup.opm" "r_feather_4_1_outJoint_multMat.i[1]";
connectAttr "r_feather_4_1_spreadGroup.m" "r_feather_4_1_outJoint_multMat.i[2]";
connectAttr "r_feather_4_1_spreadRootGroup.m" "r_feather_4_1_outJoint_multMat.i[3]"
		;
connectAttr "r_feather_4_1_group.opm" "r_feather_4_1_outJoint_multMat.i[4]";
connectAttr "r_feather_4_1_outJoint_multMat.o" "r_feather_4_1_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_2_bendGroup.wm" "r_feather_4_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_4_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "r_feather_4_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "r_feather_4_2_mainGroup_multMat.i[3]";
connectAttr "r_feather_4_2_bendGroup.wim" "r_feather_4_2_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_4_2.m" "r_feather_4_2_outJoint_multMat.i[0]";
connectAttr "r_feather_4_2_rollGroup.opm" "r_feather_4_2_outJoint_multMat.i[1]";
connectAttr "r_feather_4_2_mainGroup.opm" "r_feather_4_2_outJoint_multMat.i[2]";
connectAttr "r_feather_4_2_bendGroup.m" "r_feather_4_2_outJoint_multMat.i[3]";
connectAttr "r_feather_4_2_spreadGroup.m" "r_feather_4_2_outJoint_multMat.i[4]";
connectAttr "r_feather_4_2_group.opm" "r_feather_4_2_outJoint_multMat.i[5]";
connectAttr "r_feather_4_2_outJoint_multMat.o" "r_feather_4_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_3_bendGroup.wm" "r_feather_4_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_4_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "r_feather_4_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "r_feather_4_3_mainGroup_multMat.i[3]";
connectAttr "r_feather_4_3_bendGroup.wim" "r_feather_4_3_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_4_3.m" "r_feather_4_3_outJoint_multMat.i[0]";
connectAttr "r_feather_4_3_rollGroup.opm" "r_feather_4_3_outJoint_multMat.i[1]";
connectAttr "r_feather_4_3_mainGroup.opm" "r_feather_4_3_outJoint_multMat.i[2]";
connectAttr "r_feather_4_3_bendGroup.m" "r_feather_4_3_outJoint_multMat.i[3]";
connectAttr "r_feather_4_3_spreadGroup.m" "r_feather_4_3_outJoint_multMat.i[4]";
connectAttr "r_feather_4_3_group.opm" "r_feather_4_3_outJoint_multMat.i[5]";
connectAttr "r_feather_4_3_outJoint_multMat.o" "r_feather_4_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_4_bendGroup.wm" "r_feather_4_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_4_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "r_feather_4_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "r_feather_4_4_mainGroup_multMat.i[3]";
connectAttr "r_feather_4_4_bendGroup.wim" "r_feather_4_4_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_4_4.m" "r_feather_4_4_outJoint_multMat.i[0]";
connectAttr "r_feather_4_4_rollGroup.opm" "r_feather_4_4_outJoint_multMat.i[1]";
connectAttr "r_feather_4_4_mainGroup.opm" "r_feather_4_4_outJoint_multMat.i[2]";
connectAttr "r_feather_4_4_bendGroup.m" "r_feather_4_4_outJoint_multMat.i[3]";
connectAttr "r_feather_4_4_spreadGroup.m" "r_feather_4_4_outJoint_multMat.i[4]";
connectAttr "r_feather_4_4_group.opm" "r_feather_4_4_outJoint_multMat.i[5]";
connectAttr "r_feather_4_4_outJoint_multMat.o" "r_feather_4_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_5_bendGroup.wm" "r_feather_4_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_4_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "r_feather_4_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "r_feather_4_5_mainGroup_multMat.i[3]";
connectAttr "r_feather_4_5_bendGroup.wim" "r_feather_4_5_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_4_5.m" "r_feather_4_5_outJoint_multMat.i[0]";
connectAttr "r_feather_4_5_rollGroup.opm" "r_feather_4_5_outJoint_multMat.i[1]";
connectAttr "r_feather_4_5_mainGroup.opm" "r_feather_4_5_outJoint_multMat.i[2]";
connectAttr "r_feather_4_5_bendGroup.m" "r_feather_4_5_outJoint_multMat.i[3]";
connectAttr "r_feather_4_5_spreadGroup.m" "r_feather_4_5_outJoint_multMat.i[4]";
connectAttr "r_feather_4_5_group.opm" "r_feather_4_5_outJoint_multMat.i[5]";
connectAttr "r_feather_4_5_outJoint_multMat.o" "r_feather_4_5_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_1.iog" "r_feather_4_moduleControlSet.dsm" -na;
connectAttr "r_feather_4_2.iog" "r_feather_4_moduleControlSet.dsm" -na;
connectAttr "r_feather_4_3.iog" "r_feather_4_moduleControlSet.dsm" -na;
connectAttr "r_feather_4_4.iog" "r_feather_4_moduleControlSet.dsm" -na;
connectAttr "r_feather_4_5.iog" "r_feather_4_moduleControlSet.dsm" -na;
connectAttr "r_feather_5_1_fanLoc.wm" "r_feather_5_1_group_multMat.i[0]";
connectAttr "root_initLoc.wim" "r_feather_5_1_group_multMat.i[1]";
connectAttr "r_feather_5_1.m" "r_feather_5_1_outJoint_multMat.i[0]";
connectAttr "r_feather_5_1_rollGroup.opm" "r_feather_5_1_outJoint_multMat.i[1]";
connectAttr "r_feather_5_1_spreadGroup.m" "r_feather_5_1_outJoint_multMat.i[2]";
connectAttr "r_feather_5_1_spreadRootGroup.m" "r_feather_5_1_outJoint_multMat.i[3]"
		;
connectAttr "r_feather_5_1_group.opm" "r_feather_5_1_outJoint_multMat.i[4]";
connectAttr "r_feather_5_1_outJoint_multMat.o" "r_feather_5_1_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_2_bendGroup.wm" "r_feather_5_2_mainGroup_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_5_2_mainGroup_multMat.i[1]";
connectAttr "main_1.m" "r_feather_5_2_mainGroup_multMat.i[2]";
connectAttr "main_1_group.wm" "r_feather_5_2_mainGroup_multMat.i[3]";
connectAttr "r_feather_5_2_bendGroup.wim" "r_feather_5_2_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_5_2.m" "r_feather_5_2_outJoint_multMat.i[0]";
connectAttr "r_feather_5_2_rollGroup.opm" "r_feather_5_2_outJoint_multMat.i[1]";
connectAttr "r_feather_5_2_mainGroup.opm" "r_feather_5_2_outJoint_multMat.i[2]";
connectAttr "r_feather_5_2_bendGroup.m" "r_feather_5_2_outJoint_multMat.i[3]";
connectAttr "r_feather_5_2_spreadGroup.m" "r_feather_5_2_outJoint_multMat.i[4]";
connectAttr "r_feather_5_2_group.opm" "r_feather_5_2_outJoint_multMat.i[5]";
connectAttr "r_feather_5_2_outJoint_multMat.o" "r_feather_5_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_3_bendGroup.wm" "r_feather_5_3_mainGroup_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_5_3_mainGroup_multMat.i[1]";
connectAttr "main_2.m" "r_feather_5_3_mainGroup_multMat.i[2]";
connectAttr "main_2_group.wm" "r_feather_5_3_mainGroup_multMat.i[3]";
connectAttr "r_feather_5_3_bendGroup.wim" "r_feather_5_3_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_5_3.m" "r_feather_5_3_outJoint_multMat.i[0]";
connectAttr "r_feather_5_3_rollGroup.opm" "r_feather_5_3_outJoint_multMat.i[1]";
connectAttr "r_feather_5_3_mainGroup.opm" "r_feather_5_3_outJoint_multMat.i[2]";
connectAttr "r_feather_5_3_bendGroup.m" "r_feather_5_3_outJoint_multMat.i[3]";
connectAttr "r_feather_5_3_spreadGroup.m" "r_feather_5_3_outJoint_multMat.i[4]";
connectAttr "r_feather_5_3_group.opm" "r_feather_5_3_outJoint_multMat.i[5]";
connectAttr "r_feather_5_3_outJoint_multMat.o" "r_feather_5_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_4_bendGroup.wm" "r_feather_5_4_mainGroup_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_5_4_mainGroup_multMat.i[1]";
connectAttr "main_3.m" "r_feather_5_4_mainGroup_multMat.i[2]";
connectAttr "main_3_group.wm" "r_feather_5_4_mainGroup_multMat.i[3]";
connectAttr "r_feather_5_4_bendGroup.wim" "r_feather_5_4_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_5_4.m" "r_feather_5_4_outJoint_multMat.i[0]";
connectAttr "r_feather_5_4_rollGroup.opm" "r_feather_5_4_outJoint_multMat.i[1]";
connectAttr "r_feather_5_4_mainGroup.opm" "r_feather_5_4_outJoint_multMat.i[2]";
connectAttr "r_feather_5_4_bendGroup.m" "r_feather_5_4_outJoint_multMat.i[3]";
connectAttr "r_feather_5_4_spreadGroup.m" "r_feather_5_4_outJoint_multMat.i[4]";
connectAttr "r_feather_5_4_group.opm" "r_feather_5_4_outJoint_multMat.i[5]";
connectAttr "r_feather_5_4_outJoint_multMat.o" "r_feather_5_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_5_bendGroup.wm" "r_feather_5_5_mainGroup_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_5_5_mainGroup_multMat.i[1]";
connectAttr "main_4.m" "r_feather_5_5_mainGroup_multMat.i[2]";
connectAttr "main_4_group.wm" "r_feather_5_5_mainGroup_multMat.i[3]";
connectAttr "r_feather_5_5_bendGroup.wim" "r_feather_5_5_mainGroup_multMat.i[4]"
		;
connectAttr "r_feather_5_5.m" "r_feather_5_5_outJoint_multMat.i[0]";
connectAttr "r_feather_5_5_rollGroup.opm" "r_feather_5_5_outJoint_multMat.i[1]";
connectAttr "r_feather_5_5_mainGroup.opm" "r_feather_5_5_outJoint_multMat.i[2]";
connectAttr "r_feather_5_5_bendGroup.m" "r_feather_5_5_outJoint_multMat.i[3]";
connectAttr "r_feather_5_5_spreadGroup.m" "r_feather_5_5_outJoint_multMat.i[4]";
connectAttr "r_feather_5_5_group.opm" "r_feather_5_5_outJoint_multMat.i[5]";
connectAttr "r_feather_5_5_outJoint_multMat.o" "r_feather_5_5_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_1.iog" "r_feather_5_moduleControlSet.dsm" -na;
connectAttr "r_feather_5_2.iog" "r_feather_5_moduleControlSet.dsm" -na;
connectAttr "r_feather_5_3.iog" "r_feather_5_moduleControlSet.dsm" -na;
connectAttr "r_feather_5_4.iog" "r_feather_5_moduleControlSet.dsm" -na;
connectAttr "r_feather_5_5.iog" "r_feather_5_moduleControlSet.dsm" -na;
connectAttr "main_1_initLoc.wm" "main_1_group_multMat.i[0]";
connectAttr "m_feather_2_initLoc.wim" "main_1_group_multMat.i[1]";
connectAttr "m_feather_2_bendGroup.m" "main_1_group_multMat.i[2]";
connectAttr "m_feather_2_group.opm" "main_1_group_multMat.i[3]";
connectAttr "m_feather_1_group.opm" "main_1_group_multMat.i[4]";
connectAttr "main_2_initLoc.wm" "main_2_group_multMat.i[0]";
connectAttr "m_feather_3_initLoc.wim" "main_2_group_multMat.i[1]";
connectAttr "m_feather_3_bendGroup.m" "main_2_group_multMat.i[2]";
connectAttr "m_feather_3_group.opm" "main_2_group_multMat.i[3]";
connectAttr "m_feather_2_mainGroup.opm" "main_2_group_multMat.i[4]";
connectAttr "m_feather_2_bendGroup.m" "main_2_group_multMat.i[5]";
connectAttr "m_feather_2_group.opm" "main_2_group_multMat.i[6]";
connectAttr "m_feather_1_group.opm" "main_2_group_multMat.i[7]";
connectAttr "main_3_initLoc.wm" "main_3_group_multMat.i[0]";
connectAttr "m_feather_4_initLoc.wim" "main_3_group_multMat.i[1]";
connectAttr "m_feather_4_bendGroup.m" "main_3_group_multMat.i[2]";
connectAttr "m_feather_4_group.opm" "main_3_group_multMat.i[3]";
connectAttr "m_feather_3_mainGroup.opm" "main_3_group_multMat.i[4]";
connectAttr "m_feather_3_bendGroup.m" "main_3_group_multMat.i[5]";
connectAttr "m_feather_3_group.opm" "main_3_group_multMat.i[6]";
connectAttr "m_feather_2_mainGroup.opm" "main_3_group_multMat.i[7]";
connectAttr "m_feather_2_bendGroup.m" "main_3_group_multMat.i[8]";
connectAttr "m_feather_2_group.opm" "main_3_group_multMat.i[9]";
connectAttr "m_feather_1_group.opm" "main_3_group_multMat.i[10]";
connectAttr "main_4_initLoc.wm" "main_4_group_multMat.i[0]";
connectAttr "m_feather_5_initLoc.wim" "main_4_group_multMat.i[1]";
connectAttr "m_feather_5_bendGroup.m" "main_4_group_multMat.i[2]";
connectAttr "m_feather_5_group.opm" "main_4_group_multMat.i[3]";
connectAttr "m_feather_4_mainGroup.opm" "main_4_group_multMat.i[4]";
connectAttr "m_feather_4_bendGroup.m" "main_4_group_multMat.i[5]";
connectAttr "m_feather_4_group.opm" "main_4_group_multMat.i[6]";
connectAttr "m_feather_3_mainGroup.opm" "main_4_group_multMat.i[7]";
connectAttr "m_feather_3_bendGroup.m" "main_4_group_multMat.i[8]";
connectAttr "m_feather_3_group.opm" "main_4_group_multMat.i[9]";
connectAttr "m_feather_2_mainGroup.opm" "main_4_group_multMat.i[10]";
connectAttr "m_feather_2_bendGroup.m" "main_4_group_multMat.i[11]";
connectAttr "m_feather_2_group.opm" "main_4_group_multMat.i[12]";
connectAttr "m_feather_1_group.opm" "main_4_group_multMat.i[13]";
connectAttr "m_feather_end_initLoc.wm" "feathers_group_multMat.i[0]";
connectAttr "main_4_initLoc.wim" "feathers_group_multMat.i[1]";
connectAttr "feathers_u_multiplyDivide.ox" "feathers_uc_clamp.ipr";
connectAttr "feathers_u_multiplyDivide.oy" "feathers_uc_clamp.ipg";
connectAttr "feathers_u_multiplyDivide.oz" "feathers_uc_clamp.ipb";
connectAttr "feathers_u_multiplyDivide.o" "feathers_2u_multiplyDivide.i1";
connectAttr "feathers_2u_multiplyDivide.o" "feathers_w_plusMinusAverage.i3[0]";
connectAttr "feathers_uc_clamp.opr" "feathers_w_plusMinusAverage.i3[1].i3x";
connectAttr "feathers_uc_clamp.opg" "feathers_w_plusMinusAverage.i3[1].i3y";
connectAttr "feathers_uc_clamp.opb" "feathers_w_plusMinusAverage.i3[1].i3z";
connectAttr "feathers_uc_clamp.opr" "feathers_s_multiplyDivide.i1x";
connectAttr "feathers_uc_clamp.opg" "feathers_s_multiplyDivide.i1y";
connectAttr "feathers_uc_clamp.opb" "feathers_s_multiplyDivide.i1z";
connectAttr "feathers_w_plusMinusAverage.o3" "feathers_s_multiplyDivide.i2";
connectAttr "feathers_negU_clamp.opg" "feathers_dip2m_multiplyDivide.i1x";
connectAttr "feathers_dip2m_multiplyDivide.ox" "feathers_dipW_plusMinusAverage.i1[0]"
		;
connectAttr "feathers_negU_clamp.opr" "feathers_dipW_plusMinusAverage.i1[1]";
connectAttr "feathers_negU_clamp.opr" "feathers_dipS_multiplyDivide.i1x";
connectAttr "feathers_dipW_plusMinusAverage.o1" "feathers_dipS_multiplyDivide.i2x"
		;
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "m_feather_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_feather_1_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_feather_2_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_feather_3_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_feather_4_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "l_feather_5_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of birdTail.ma
