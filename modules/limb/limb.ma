//Maya ASCII 2022 scene
//Name: limb.ma
//Last modified: Fri, Nov 15, 2024 12:24:55 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 22631)";
fileInfo "UUID" "F0293646-441D-C456-F80F-74AAFD34E2F1";
createNode transform -s -n "persp";
	rename -uid "3C7E0AEC-41A5-B981-7A2B-32A67D2BBAA3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 12.672180685776231 14.147104159680129 16.250200674460608 ;
	setAttr ".r" -type "double3" -30.600000000000303 16.800000000000232 -8.3058860956631209e-16 ;
	setAttr ".rp" -type "double3" 1.1102230246251563e-16 0 8.8817841970012523e-16 ;
	setAttr ".rpt" -type "double3" 5.7589012943859782e-16 4.8375017868310666e-16 -2.7025092621108523e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "6E01164D-4F2E-036C-75B6-C6AD97679A37";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 19.124559678303413;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 21.869096818679282 0 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9E494C2A-4B0A-0D39-9443-79927F4E6226";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 7.9143380223196118 30.17930800406555 0.49146549006877649 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "913AD3A3-4140-0101-A283-578D2A27E312";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 25.767396778631287;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "7D89B8A1-4CD4-D6AD-A436-6AA336F15DBF";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2075136626255003 -0.063745514021394389 2.4073022366348158 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "F8FCD352-40B4-E03A-9A7A-B28F44A7F1DE";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.6533373742254844;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "5A4763FA-4E5F-0F6C-1AA9-A5A3B2847ED8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.239566721390831 -0.52472590419222498 -0.10140933508647255 ;
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".rpt" -type "double3" 4.9303806576313238e-32 0 4.4408920985006262e-16 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8F9440C2-4318-0A9E-6E24-B9ADD6F09543";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.0464307009741836;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "mod";
	rename -uid "796B45B9-43DB-82CA-C93B-1A91B6023A77";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "aim_offset" -ln "aim_offset" -at "double";
	setAttr ".aim_offset" 3.12;
createNode transform -n "posers" -p "mod";
	rename -uid "4295F9C2-4F7B-E34F-ECAD-1FB25E9C5061";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "079BBC3E-46A2-E93B-5E9D-58814DF8C9A7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 0.1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineSize" 0.2;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "C85FD3BD-4B15-B4FD-5AE1-EF966DC407CB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "07E5E7A8-424A-D812-4CD5-828825C1FF46";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".r";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -l on -k off ".sx";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.8;
	setAttr -k on ".twist";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "F302DA9A-496E-99CA-7D7C-8898CAEE0A31";
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
	rename -uid "1EE2F773-49A4-1633-03F6-BD860303F969";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "root_poserOrient_locShape" -p "root_poserOrient";
	rename -uid "886240D1-4D94-4300-9E4B-EFB653987320";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "rootMiddle_orient_locator_aimConstraint1" -p "root_poserOrient";
	rename -uid "666F95B9-489B-6965-52E8-AF8D8F1438CD";
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
createNode nurbsCurve -n "root_poserOrientShapeOrig" -p "root_poserOrient";
	rename -uid "35EA2A36-436C-0E0F-9214-7E8B0977479C";
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
	rename -uid "4E836DB2-4849-E606-C113-EAA8308148F9";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "04C426DF-4240-C359-3171-2B952BA75886";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_initLoc_aimConstraint1" -p "root_initLoc";
	rename -uid "2B981516-4F88-880E-07A4-7DB6AF35FCFB";
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
	rename -uid "37676F59-4A50-0F90-3B3A-6088FCC7CF8A";
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode locator -n "ik_aim_initLocShape" -p "ik_aim_initLoc";
	rename -uid "1802F3C4-49D6-848F-454E-50AC15052D0F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_end_initLoc" -p "root_poserOrient";
	rename -uid "87C7868E-4CBC-C4D0-E609-82821C7EAEAF";
createNode locator -n "ik_end_initLocShape" -p "ik_end_initLoc";
	rename -uid "D7E59582-4743-1C20-57F0-D2A16066D4C5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_root_initLoc" -p "root_poserOrient";
	rename -uid "912A0E60-4CAC-BFED-9D55-D7889D28AA7B";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "ik_root_initLocShape" -p "ik_root_initLoc";
	rename -uid "22D6BE2B-4159-5F8F-0789-059EB86C6BE0";
	setAttr -k off ".v";
createNode transform -n "fk_a_initLoc" -p "root_poserOrient";
	rename -uid "BC6A5751-4255-1AAB-ABFF-3B803450F5F9";
	setAttr ".v" no;
createNode locator -n "fk_a_initLocShape" -p "fk_a_initLoc";
	rename -uid "2F87C4E3-457F-ADEF-C1DE-598D0A8D188E";
	setAttr -k off ".v";
createNode aimConstraint -n "root_poser_aimConstraint1" -p "root_poser";
	rename -uid "FA26961C-4DF0-B0BB-99EB-64BCE974F26C";
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
createNode joint -n "root_initJoint" -p "root_poser";
	rename -uid "83A65B7C-4E84-0CAA-DB66-C0A7CB4F266B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode transform -n "middle_poser" -p "mainPoser";
	rename -uid "3D67BC04-42A9-BED1-F557-FD8869DCE918";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 7.497239472509575 0 -1.7258639806364389 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.8;
	setAttr -l on ".twist";
createNode nurbsSurface -n "middle_poserShape" -p "middle_poser";
	rename -uid "B201F6D4-4698-02A4-ED9A-468712A41911";
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
createNode locator -n "middle_poser_locShape" -p "middle_poser";
	rename -uid "C3311901-49CA-FCC0-484A-898DA2B566DF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middle_poserOrient" -p "middle_poser";
	rename -uid "F49D1E03-421D-0F19-4532-DB92DFDD4EF4";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "middle_poserOrient_locShape" -p "middle_poserOrient";
	rename -uid "4193C546-4CEA-B16B-3E9C-AD9240600CEE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "middleEnd_orient_locator_aimConstraint1" -p "middle_poserOrient";
	rename -uid "D2447FE4-47A7-2F85-F88B-B19DA02E7C69";
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
	rename -uid "C4719145-4A0C-372D-1E6E-4B8E7A0C2CFB";
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
	rename -uid "BD10E021-4B4E-9171-5991-06A30D4B739E";
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
	rename -uid "BF685954-4486-A601-058A-7BB260A54101";
createNode locator -n "middle_initLocShape" -p "middle_initLoc";
	rename -uid "6FEA90A4-4421-5B04-75C2-359516761A78";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middle_up_loc" -p "middle_poserOrient";
	rename -uid "79C592D9-4B27-3184-4EC2-6E8F3A54410E";
	setAttr ".t" -type "double3" 2.2204460492503114e-16 0.67310697141714793 -1.1102230246251557e-16 ;
createNode locator -n "middle_up_locShape" -p "middle_up_loc";
	rename -uid "3DAC376F-4DE1-E1CE-F24A-54ADCA97623F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_b_initLoc" -p "middle_poserOrient";
	rename -uid "BEBDF44F-40E3-9D23-32D0-00BA67C738CC";
createNode locator -n "fk_b_initLocShape" -p "fk_b_initLoc";
	rename -uid "712DA925-44BA-1B39-B561-AD8C17667739";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middleOffset_initLoc" -p "middle_poser";
	rename -uid "A0F0B9A3-4CD9-7CE8-0976-1D9BF9A7C2E6";
	setAttr ".v" no;
createNode locator -n "middleOffset_initLocShape" -p "middleOffset_initLoc";
	rename -uid "4594FB3D-4AA0-1F0B-52DD-CCAFC3EECD33";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode orientConstraint -n "middleRoot_orient_locator_orientConstraint1" -p "middleOffset_initLoc";
	rename -uid "58B1F23C-4C4E-4B9D-3FC5-9BA6319BC4C6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "middle_poserOrientW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "root_twist_angleLoc_1W1" -dv 1 -min 
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
	setAttr ".lr" -type "double3" 0 0.060034664955658269 0 ;
	setAttr ".rsrr" -type "double3" -4.7584079804708083e-15 -1.987846675914698e-15 -1.2424041724466863e-15 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "root_twist_angleLoc_1" -p "middle_poser";
	rename -uid "53A303B1-440E-81F1-8B4C-408013838E08";
	setAttr ".v" no;
createNode locator -n "root_twist_angleLoc_1Shape" -p "root_twist_angleLoc_1";
	rename -uid "755B220D-419A-5D32-E0C4-079E886B1365";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_twist_angleLoc_2" -p "root_twist_angleLoc_1";
	rename -uid "DAE9BA89-4771-8487-5884-7784536372F1";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 -2.7755575615628914e-17 0 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode locator -n "root_twist_angleLoc_2Shape" -p "root_twist_angleLoc_2";
	rename -uid "5EBD04D6-4330-0B57-7B94-8E90C17A6FA9";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_twist_angleLoc_2_aimConstraint1" -p "root_twist_angleLoc_2";
	rename -uid "046CCAB1-44E5-CD4F-E233-58ADCDF901D3";
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
	rename -uid "E2CCB16B-4DB3-9386-439F-D28BB432BE12";
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
createNode transform -n "end_poser" -p "mainPoser";
	rename -uid "6956FBBC-4859-47D6-047E-8994C46C3388";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 14.94732449638445 0 0.057799056853583997 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.8;
	setAttr -l on -k on ".worldOrient";
createNode nurbsSurface -n "end_poserShape" -p "end_poser";
	rename -uid "9649C485-4DDA-EDDD-A2EF-D28D66467D84";
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
	rename -uid "6328C8B2-49F7-CA03-463F-1C95E99439A0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middle_line_endOrient_locator" -p "end_poser";
	rename -uid "43BE0161-411D-BF3B-47A6-F6A6149854A1";
createNode locator -n "middle_line_endOrient_locatorShape" -p "middle_line_endOrient_locator";
	rename -uid "38B34AF8-4531-C879-9BBE-F792B25FDFB0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode orientConstraint -n "middle_line_endOrient_locator_orientConstraint1" 
		-p "middle_line_endOrient_locator";
	rename -uid "57723DAD-4777-850F-215E-BAAC124CE9FF";
	addAttr -ci true -k true -sn "w0" -ln "middle_line_startOrient_locatorW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0 -13.464043310946138 0 ;
	setAttr ".rsrr" -type "double3" 0 3.1805546814635168e-15 0 ;
	setAttr -k on ".w0";
createNode transform -n "end_initLoc" -p "end_poser";
	rename -uid "49A6AEB7-4B91-9F54-F641-ECBA88DD0D99";
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "4B7A641F-4431-5F84-DC07-84B29C826F7F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_initLoc" -p "end_initLoc";
	rename -uid "045DAFEC-4A2C-567F-5D00-AFA2A29BDF33";
createNode locator -n "fk_end_initLocShape" -p "fk_end_initLoc";
	rename -uid "604A7002-4AF5-976A-A34D-06B1DFCD81FF";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "35994FEB-499E-5A20-FECF-6BA205B21680";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "231731D1-4283-95A7-F504-91BC6A49450F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "end_initJoint" -p "end_poserOrient";
	rename -uid "8AF2C5BC-41A8-DAC3-DBB7-9697E19B966C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "control_initLoc" -p "mainPoser";
	rename -uid "4CFACB0A-4562-CD2C-14A8-F7BA2219AA61";
createNode locator -n "control_initLocShape" -p "control_initLoc";
	rename -uid "A0859077-408A-8F7D-344F-A9B84EDD7337";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "B5F83A2F-40CD-5F08-F8D9-A18EA4F72D72";
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
createNode transform -n "mainPoser_clusterHandle" -p "posers";
	rename -uid "BB329618-4D08-14B7-34BA-7780F70C0321";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "06A3BFBE-4AD2-CA23-803F-D2ABE421239D";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "51033414-4C59-F88C-4C71-549EED3D0E95";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "9ECFD7C9-4422-70C9-965F-5FAF8EF9BDC7";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 0
		7.497239472509575 0 -1.7258639806364389
		14.94732449638445 0 0.057799056853583997
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "B5D7377B-43B7-C3B0-A039-F88C96E93ABE";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "B6D427CA-4F50-B94B-61CB-5D8C2E42494E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "B3EAAA1D-4341-4BF3-DD9D-038012C172E3";
	setAttr ".v" no;
createNode transform -n "ik_connector_main" -p "input";
	rename -uid "1D540B98-4FF2-7732-80B5-FABDB0338319";
createNode transform -n "ik_connector" -p "ik_connector_main";
	rename -uid "D8EB3018-44DC-6A05-C2D9-F6AC4232DCE8";
createNode locator -n "ik_connectorShape" -p "ik_connector";
	rename -uid "219153D7-455D-7C67-64C8-34B9190DE6DE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "root_connector_init" -p "input";
	rename -uid "CCEDD870-4F3B-24A9-8E7C-CB8E8D143C19";
createNode transform -n "root_connector" -p "root_connector_init";
	rename -uid "3C1B1311-468B-DDCC-06E1-CABFE2261620";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "5C0AA95D-4A6A-CFD4-9498-A7B04C271AF8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "controls" -p "mod";
	rename -uid "D1748AF8-470F-8D5B-61B8-D891ABA5517D";
createNode transform -n "control_group" -p "controls";
	rename -uid "DE0A7971-4AEC-2486-35E4-1EB252147885";
createNode transform -n "control" -p "control_group";
	rename -uid "AB75AECE-40E5-1E1B-B97C-BEB910A81609";
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
	setAttr -k on ".stretchVolume";
	setAttr -k on ".length1" 1;
	setAttr -k on ".length2" 1;
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
createNode nurbsCurve -n "controlShape" -p "control";
	rename -uid "CD4B4EF4-4478-0D3E-4242-84952250A552";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		0.58185912156990793 1.1068268678884885 0
		0.58185912156990793 2.0658246068668 0
		1.2211909475554523 1.746158693874035 0
		0.58185912156990793 1.4264927808812633 0
		;
createNode transform -n "fk_controls" -p "controls";
	rename -uid "B7645A1A-4CCA-E681-578D-43A714E1CBAD";
createNode transform -n "fk_a_group" -p "fk_controls";
	rename -uid "400C4204-4F09-675A-731A-DB9B1433E83F";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 0 -5.5511151231257827e-17 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999967 ;
createNode transform -n "fk_a" -p "fk_a_group";
	rename -uid "FBD40BF5-458B-C9A8-A89B-DF93CCC001D4";
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
	rename -uid "3982A30A-4255-0487-3860-09A616A26EBB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-7.2509916052142206e-17 0.51178557711437878 -0.51178557711437767
		-1.740280630679319e-16 -1.0123927783628311e-16 -0.72377410418209487
		-7.2509916052142206e-17 -0.51178557711437844 -0.51178557711437844
		-1.4501983210428441e-16 -0.72377410418209487 -6.1356640180601126e-17
		-7.2509916052142206e-17 -0.51178557711437844 0.51178557711437833
		-8.5391299068697568e-17 -2.3675256959578928e-16 0.72377410418209487
		-7.2509916052142206e-17 0.51178557711437833 0.51178557711437844
		1.4501983210428441e-16 0.72377410418209487 5.3711547106025959e-16
		-7.2509916052142206e-17 0.51178557711437878 -0.51178557711437767
		-1.740280630679319e-16 -1.0123927783628311e-16 -0.72377410418209487
		-7.2509916052142206e-17 -0.51178557711437844 -0.51178557711437844
		;
createNode joint -n "a_fkJoint" -p "fk_a";
	rename -uid "B673D9CE-4705-FEC9-E5E4-FBA67C7C3CE8";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_b_group" -p "fk_a";
	rename -uid "B4134CB6-45BF-8E20-8BFA-67A60CDE617D";
	setAttr ".t" -type "double3" 7.6933221814645139 0 1.6653345369377348e-16 ;
createNode transform -n "fk_b" -p "fk_b_group";
	rename -uid "43BC03EE-4B26-256F-766B-0C936DF1BD07";
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
	rename -uid "0AE8B514-4CB6-D36C-DDB4-9094A43E930C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-2.5843297762501556e-15 0.51727572212448647 -0.51727572212448558
		-2.4779675731025276e-15 -4.8332623316982456e-17 -0.73153834171478349
		-2.4377542537489591e-15 -0.51727572212448536 -0.51727572212448603
		-2.7309052987513504e-15 -0.73153834171478349 -1.4887849440199249e-15
		-2.3644664924983645e-15 -0.51727572212448558 0.51727572212448547
		-2.3883799642390703e-15 -1.8529962470768117e-16 0.73153834171478349
		-2.6576175375007506e-15 0.51727572212448558 0.51727572212448558
		-2.4377542537489591e-15 0.73153834171478349 -8.8389276386320523e-16
		-2.5843297762501556e-15 0.51727572212448647 -0.51727572212448558
		-2.4779675731025276e-15 -4.8332623316982456e-17 -0.73153834171478349
		-2.4377542537489591e-15 -0.51727572212448536 -0.51727572212448603
		;
createNode joint -n "b_fkJoint" -p "fk_b";
	rename -uid "D8F6C0DD-41EE-B547-E134-04956BCE0606";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".is" -type "double3" 1.0000303983688354 1 1 ;
createNode transform -n "fk_end_group" -p "fk_b";
	rename -uid "4A52867A-42AF-4162-9FB0-E084A0C97076";
	setAttr ".s" -type "double3" 0.99999191367389451 1.0000000000000009 1.0000179037244814 ;
	setAttr ".sh" -type "double3" 0 1.5136983945333165e-05 0 ;
createNode transform -n "fk_end" -p "fk_end_group";
	rename -uid "A1966EB9-4076-4A93-CAE3-21BD68B6BF41";
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
	rename -uid "33737CBF-4B1A-898C-B1E5-8D991F0BD12B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.0317302211702216e-06 0.41446704401428652 -0.41446249787423212
		3.0718669302493375e-07 0.58614491480169206 -1.4486799719582477e-05
		-3.5973026345556048e-06 0.4144670440142873 0.41444201044559326
		-5.3945408676320432e-06 5.6607318813440289e-16 0.58612399878904664
		-4.0317302242810381e-06 -0.41446704401428713 0.41446249787423184
		-3.0718669607702083e-07 -0.58614491480169206 1.4486799719825938e-05
		3.5973026313420342e-06 -0.4144670440142873 -0.41444201044559276
		5.3945408644625153e-06 8.1340102576255042e-17 -0.58612399878904664
		4.0317302211702216e-06 0.41446704401428652 -0.41446249787423212
		3.0718669302493375e-07 0.58614491480169206 -1.4486799719582477e-05
		-3.5973026345556048e-06 0.4144670440142873 0.41444201044559326
		;
createNode joint -n "end_fkJoint" -p "fk_end";
	rename -uid "E62931F6-450C-8277-5FE2-0194B26695E0";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0 0 -4.4406888105932846e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "ik_controls" -p "controls";
	rename -uid "79D44184-4CD0-2B34-6ACD-DB83F69D3CD3";
createNode transform -n "ik_aim_init" -p "ik_controls";
	rename -uid "77AA6A27-4772-D6D2-10DD-DEAC8237495C";
createNode transform -n "ik_aim_mirror" -p "ik_aim_init";
	rename -uid "FC1CD595-4B04-7DDD-380D-369B79FD7269";
createNode transform -n "ik_aim" -p "ik_aim_mirror";
	rename -uid "F5A1C1E7-4F65-D66E-0830-D9A7A7D011B5";
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
	rename -uid "28CD8DBA-4935-BF70-607C-7F8B35569322";
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
	rename -uid "267583FB-474F-AD47-C978-21926C03E87C";
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
	rename -uid "BE5769DB-4AC0-4D20-F0D1-46AA7F4A5076";
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
	rename -uid "EEBE75F5-4784-BC45-5643-08808309B77D";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687562 0 ;
createNode locator -n "curveEnd_locatorShape" -p "curveEnd_locator";
	rename -uid "930CDB57-4FD3-84DC-C37E-88BB64A5864C";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_end_init" -p "ik_controls";
	rename -uid "D7936AC9-413C-C55D-069E-3790EBEE6ECD";
createNode transform -n "ik_end_mirror" -p "ik_end_init";
	rename -uid "83F612D8-4E80-ECC3-0012-AF9A8130F260";
createNode transform -n "ik_end" -p "ik_end_mirror";
	rename -uid "5DF27C6E-4BAC-B695-4F3B-BD97DE04C301";
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
	rename -uid "407ACA4F-49B2-A7F7-E1F3-969F01D68DCB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.59476577945494469 0.59501077837289618 0.59501014241363392
		-0.59476577945494469 0.59500996066536016 -0.59501014241363392
		0.59476577945494047 0.59500996066536016 -0.59501014241363392
		0.59476577945494047 0.59500996066536016 0.59501014241363392
		-0.59476577945494469 0.59500996066536016 0.59501014241363392
		0.59476577945494047 0.59500996066536016 0.59501014241363392
		0.59476577945494047 -0.59501032416190702 0.59501014241363392
		-0.59476577945494469 -0.59501032416190702 0.59501014241363392
		-0.59476577945494469 0.59500996066536016 0.59501014241363392
		-0.59476577945494469 -0.59501032416190702 0.59501014241363392
		-0.59476577945494469 -0.59501032416190702 -0.59501014241363392
		-0.59476577945494469 0.59500996066536016 -0.59501014241363392
		-0.59476577945494469 -0.59501032416190702 -0.59501014241363392
		0.59476577945494047 -0.59501032416190702 -0.59501014241363392
		0.59476577945494047 0.59500996066536016 -0.59501014241363392
		0.59476577945494047 -0.59501032416190702 -0.59501014241363392
		0.59476577945494047 -0.59501032416190702 0.59501014241363392
		;
createNode transform -n "ik_end_out_rot" -p "ik_end";
	rename -uid "5C51FB95-4F2A-7504-2F26-CFBC46DDCCEE";
	setAttr ".v" no;
createNode transform -n "ik_end_out_init" -p "ik_end";
	rename -uid "6657A1AC-4CEF-0DED-A493-758F35AA3999";
	setAttr ".r" -type "double3" 0 -3.1528956873981994e-07 0 ;
createNode transform -n "ik_end_out" -p "ik_end_out_init";
	rename -uid "A5B0D885-4F0F-A0A5-D543-8DA7F02BB5C8";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 0 -3.4346083563738136e-26 ;
createNode locator -n "ik_end_outShape" -p "ik_end_out";
	rename -uid "A434D19E-46D2-B81D-9F7E-90B79A337A4B";
	setAttr -k off ".v";
createNode transform -n "ik_root_group" -p "ik_controls";
	rename -uid "6B1A0B4E-420E-D8F7-CEC6-2599EF05A0C1";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode transform -n "ik_root" -p "ik_root_group";
	rename -uid "134C7970-4DB5-ED61-27C1-8EA5329109B0";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_root";
	setAttr -l on ".mirrorShape" yes;
createNode nurbsCurve -n "ik_rootShape" -p "ik_root";
	rename -uid "DC149C2F-4BA7-9C95-A0B8-288243B38A8A";
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
	rename -uid "2F23386F-459F-234B-F999-438A4AF06797";
	setAttr ".v" no;
	setAttr ".sh" -type "double3" 0.0019699791094384997 -0.0050284108131751857 0.00029646444186807758 ;
createNode locator -n "snap_root_locShape" -p "snap_root_loc";
	rename -uid "47683E65-4C48-3E22-11DC-DB91655F80D8";
	setAttr -k off ".v";
createNode transform -n "aim_curve" -p "ik_controls";
	rename -uid "53A58836-4823-05EB-07F5-98B654EC138D";
	setAttr ".tmp" yes;
	setAttr ".it" no;
createNode nurbsCurve -n "aim_curveShape" -p "aim_curve";
	rename -uid "14C32AE4-4ADF-ABDB-DA4F-6CB3E165B141";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.4972394727406773 0 -1.7258639806896392
		7.5093045234680176 0 -4.8458404541015625
		;
createNode transform -n "middleOffset_group" -p "controls";
	rename -uid "861D05DC-47AF-949C-1010-FA93EB6BE000";
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
createNode transform -n "middleOffset" -p "middleOffset_group";
	rename -uid "E3EC098C-4A1F-43AA-39F9-73A64F36C618";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleOffset";
createNode nurbsCurve -n "middleOffsetShape" -p "middleOffset";
	rename -uid "F8954D95-4513-99E2-B3E7-16A67139EC1A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30895563622188771 -4.4308376043332798e-17 -0.30895563622188704
		3.4559881379528989e-16 -3.6472252162772914e-17 -0.43692925091660184
		-0.30895563622188721 -4.4308376043332798e-17 -0.30895563622188721
		-0.43692925091660184 -6.3226452592216217e-17 -3.2347149625321277e-16
		-0.30895563622188726 -8.2144529141099648e-17 0.30895563622188721
		2.6379190648042538e-16 -8.9980653021659557e-17 0.43692925091660184
		0.30895563622188704 -8.2144529141099648e-17 0.30895563622188726
		0.43692925091660184 -6.3226452592216242e-17 3.7815222555889126e-17
		0.30895563622188771 -4.4308376043332798e-17 -0.30895563622188704
		3.4559881379528989e-16 -3.6472252162772914e-17 -0.43692925091660184
		-0.30895563622188721 -4.4308376043332798e-17 -0.30895563622188721
		;
createNode nurbsCurve -n "middleOffsetShape1" -p "middleOffset";
	rename -uid "A5601D56-4004-C376-D9AA-0F90081A3F82";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.30895563622188771 0.30895563622188721 -2.4740746410765063e-16
		3.4559881379528989e-16 0.43692925091660184 -2.6798719094280702e-16
		-0.30895563622188721 0.30895563622188726 -2.4740746410765082e-16
		-0.43692925091660184 6.3816352230588863e-17 -1.9772360847228354e-16
		-0.30895563622188726 -0.30895563622188721 -1.4803975283691629e-16
		2.6379190648042538e-16 -0.43692925091660184 -1.2746002600176029e-16
		0.30895563622188704 -0.30895563622188726 -1.4803975283691629e-16
		0.43692925091660184 -2.9747036657851315e-16 -1.9772360847228349e-16
		0.30895563622188771 0.30895563622188721 -2.4740746410765063e-16
		3.4559881379528989e-16 0.43692925091660184 -2.6798719094280702e-16
		-0.30895563622188721 0.30895563622188726 -2.4740746410765082e-16
		;
createNode nurbsCurve -n "middleOffsetShape2" -p "middleOffset";
	rename -uid "6A4EF5A9-4580-44D7-40EB-DEBAD409E36A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.4513107257993449e-16 0.30895563622188771 -0.30895563622188704
		3.6869301651512415e-16 -1.1264321672753456e-16 -0.43692925091660184
		3.0792720821143299e-16 -0.30895563622188726 -0.30895563622188721
		2.984294340446005e-16 -0.43692925091660184 -3.2433477428112995e-16
		3.4576336130920007e-16 -0.30895563622188726 0.30895563622188721
		4.2220141737401076e-16 -1.9445012404239929e-16 0.43692925091660184
		4.8296722567770167e-16 0.30895563622188721 0.30895563622188726
		4.9246499984453396e-16 0.43692925091660184 3.6951944527971916e-17
		4.4513107257993449e-16 0.30895563622188771 -0.30895563622188704
		3.6869301651512415e-16 -1.1264321672753456e-16 -0.43692925091660184
		3.0792720821143299e-16 -0.30895563622188726 -0.30895563622188721
		;
createNode pointConstraint -n "middle_control_pointConstraint1" -p "middleOffset_group";
	rename -uid "921D8C86-4330-5424-DF21-68820B48A49B";
	addAttr -ci true -k true -sn "w0" -ln "limbB_jointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 2.2360680103302011 0 -1.7763568394002505e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "middle_control_orientConstraint1" -p "middleOffset_group";
	rename -uid "E4A01ABE-4BF9-353A-A117-6FAE6C0E695A";
	addAttr -ci true -k true -sn "w0" -ln "limbA_jointW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "limbB_jointW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr ".lr" -type "double3" 0 -13.213841672887241 0 ;
	setAttr ".o" -type "double3" 0 2.8824484474179729e-06 0 ;
	setAttr ".rsrr" -type "double3" 0 -26.56505117707799 0 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "system" -p "mod";
	rename -uid "7102D168-4D4B-BE49-8B7E-BAB38F77CF68";
	setAttr ".v" no;
createNode transform -n "ik_joints" -p "system";
	rename -uid "938B8457-4864-F585-B28C-AE93DB6ED24B";
createNode joint -n "a_ikJoint" -p "ik_joints";
	rename -uid "4F308A4D-4D96-99C3-4172-EE832B95A1E7";
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "b_ikJoint" -p "a_ikJoint";
	rename -uid "36C349D0-4D4F-1ABF-EC19-7189F801D31E";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 7.6933221817016602 0 -1.6653345369377336e-15 ;
	setAttr ".r" -type "double3" 0 -21.427683345774476 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -5 0 ;
createNode joint -n "end_ikJoint" -p "b_ikJoint";
	rename -uid "B8641350-4E57-A5D4-4E4C-2A9C6B889942";
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode ikEffector -n "effector" -p "b_ikJoint";
	rename -uid "27D3923F-4FA1-F907-9230-BE97B5A5547D";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".hd" yes;
createNode transform -n "joints" -p "system";
	rename -uid "D15FC1FB-4AA5-26A8-6618-54870C8134E7";
createNode joint -n "a_finalJoint" -p "joints";
	rename -uid "3987E971-4C76-93AD-01CC-B88960FEA6A2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.09961607666187984 0.0055378625360235382 -0.0067800699868501638 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 0.0070934636314600244 -0.0056734465564594666 0.099586619472096516 0
		 0.32123309041702086 2.3902817968656178 -0.054956858176564261 1;
createNode joint -n "b_finalJoint" -p "a_finalJoint";
	rename -uid "382DB888-4AD2-937F-121E-02832ECCBD5B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.099691102795354883 0.0047514142680777855 0.0062536458085739538 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 -0.005946762080523681 -0.0063466510657197535 0.099621062235892885 0
		 0.8016236508328034 2.4169876959165881 -0.087653203282550218 1;
createNode joint -n "end_finalJoint" -p "b_finalJoint";
	rename -uid "B09E4CAF-48D3-D1FE-A749-4CB772F6DC2B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "end_joint_parentConstraint1" -p "end_finalJoint";
	rename -uid "B295A4DE-432C-ECD8-0A6D-D3A0DD4F752A";
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
	setAttr ".lr" -type "double3" 0 13.464040650150926 0 ;
	setAttr ".rst" -type "double3" 2.161307049502966 0.029976148749351963 -0.079060712407660994 ;
	setAttr ".rsrr" -type "double3" 1.8436269137598027 29.243973811402793 1.6517385454817457 ;
	setAttr ".int" 2;
	setAttr -k on ".w1";
	setAttr -k on ".w0";
createNode transform -n "ik_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "63B284AF-43E8-B39E-BC7A-4D9BF10E2AF1";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "ik_end_ikFkSwitchHelperShape" -p "ik_end_ikFkSwitchHelper";
	rename -uid "54F2D90E-4557-D89E-353A-339C4B094EC4";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "5FC46C23-4226-EC07-D3E4-358C660F617A";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "fk_end_ikFkSwitchHelperShape" -p "fk_end_ikFkSwitchHelper";
	rename -uid "5C44F8CE-48E3-8013-02B9-5CB1E14F651E";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "curveStart_locator" -p "b_finalJoint";
	rename -uid "937B834C-4B7B-D046-2EDE-C89CEA419C0F";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "curveStart_locatorShape" -p "curveStart_locator";
	rename -uid "5340D127-4F13-2942-372A-EF8A37326124";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode parentConstraint -n "b_joint_parentConstraint1" -p "b_finalJoint";
	rename -uid "DDDB10E6-40AA-7A03-3A3B-4CBDEF57DA11";
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
	setAttr ".lr" -type "double3" 0 -26.427683345774476 0 ;
	setAttr ".rst" -type "double3" 2.2681055008005182 0.036040713028121597 -0.1204070915889166 ;
	setAttr ".rsrr" -type "double3" -0.10474226879154834 -52.816060736806094 -0.3565215501189829 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "fk_b_ikFkSwitchHelper" -p "b_finalJoint";
	rename -uid "E06141BA-41FC-34C5-31CA-E8B44B8D9B3B";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687512 0 ;
createNode locator -n "fk_b_ikFkSwitchHelperShape" -p "fk_b_ikFkSwitchHelper";
	rename -uid "C87E0B7C-4C49-4B1D-D58C-97AF188EE187";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode parentConstraint -n "a_joint_parentConstraint1" -p "a_finalJoint";
	rename -uid "616F650F-4B71-74AC-14FD-8C9073EF3344";
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
	setAttr ".lr" -type "double3" 0 12.963643498407313 0 ;
	setAttr ".rst" -type "double3" -8.1139024314801804e-17 2.0284756078700451e-17 2.4341707294440544e-16 ;
	setAttr ".rsrr" -type "double3" -2.7624631311983412e-16 -7.3523463271148621e-34 
		-3.0498753761064987e-16 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "ik_root_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "DB88161E-4AEC-43C8-C442-578D41C4EC52";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "ik_root_ikFkSwitchHelperShape" -p "ik_root_ikFkSwitchHelper";
	rename -uid "881A0187-4DFE-7ED4-F506-208AE120676C";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_a_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "4B170FC9-498E-F8B3-85DB-3C9BD826DB5B";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "fk_a_ikFkSwitchHelperShape" -p "fk_a_ikFkSwitchHelper";
	rename -uid "5BD0C659-4EF2-51FE-9E78-DEA1DF7ABF36";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode ikHandle -n "ikHandle" -p "system";
	rename -uid "24584E3B-43E7-647B-643A-14B80A901F23";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle_poleVectorConstraint1" -p "ikHandle";
	rename -uid "9D065F9D-4530-3014-05A0-B09F8F47316A";
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
	rename -uid "8D4A6653-4385-2783-05FE-A88AB7E138C9";
createNode transform -n "outJoints" -p "output";
	rename -uid "85A8B367-427A-EAAD-493C-3D99FA8BA516";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "DD90E844-4A57-9059-88E6-20AFA0DB58D5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode joint -n "middle_outJoint" -p "root_outJoint";
	rename -uid "BEE4FFFA-4842-722D-3548-2FA24B32722E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000259339796214 0 -0.0029881482422647126 0 0 1 0 0
		 0.0029880574101934557 0 0.9999955357464918 0 2.236129877159025 0 0.005211601042381415 1;
createNode joint -n "end_outJoint" -p "middle_outJoint";
	rename -uid "D6C5D6F5-4D49-F494-2339-2A90DB7E7849";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "middle_volume_outJoint" -p "middle_outJoint";
	rename -uid "3634A8B6-452C-5521-8BA2-06A47313671A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "root_volume_outJoint" -p "root_outJoint";
	rename -uid "37F35170-42F2-A276-7266-3C82785B7C8E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_out_grp" -p "output";
	rename -uid "D4CC7BB6-4962-759D-8F07-B3B35FCB535A";
	setAttr ".v" no;
createNode transform -n "fk_out" -p "fk_out_grp";
	rename -uid "F55C4805-4B82-41BD-4269-C8B067EE7EDE";
createNode locator -n "fk_outShape" -p "fk_out";
	rename -uid "B11EBBF1-4400-BD91-6320-CDBD4C83B5B2";
	setAttr -k off ".v";
createNode transform -n "ik_out_grp" -p "output";
	rename -uid "7BE5EB8F-44A0-972A-BBFA-A1BCC02C22A0";
	setAttr ".v" no;
createNode transform -n "ik_out" -p "ik_out_grp";
	rename -uid "43E5C87D-4528-B999-2B1B-968D8C51E5E4";
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "A588B02D-4E81-34A8-75B4-CB97FC56B9B8";
	setAttr -k off ".v";
createNode transform -n "ik_out_initLoc" -p "ik_out";
	rename -uid "1736C1F2-4661-E7A4-65CF-DA8CCB2DB2D3";
createNode locator -n "ik_out_initLocShape" -p "ik_out_initLoc";
	rename -uid "D88E16CE-4A1D-2825-3F02-78AA30C595D3";
	setAttr -k off ".v";
createNode transform -n "ikRev_out" -p "ik_out_grp";
	rename -uid "05B60155-4500-4DA3-E3A0-BE8CB211D1DC";
createNode locator -n "ikRev_outShape" -p "ikRev_out";
	rename -uid "7B10537C-44FB-2DA7-2B92-2EB687D505BD";
	setAttr -k off ".v";
createNode transform -n "end_out" -p "output";
	rename -uid "735A4D25-439D-54D9-EA16-62BA972F20B3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.81999877030424 0 2.3314683517128287e-15 ;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
createNode locator -n "end_outShape" -p "end_out";
	rename -uid "A667F088-4F2F-56AB-2427-53BD02FA9C0F";
	setAttr -k off ".v";
createNode reverse -n "ikFk_reverse";
	rename -uid "3EFF38C1-41ED-FE07-9AFC-3D8C2D28607D";
createNode ikRPsolver -n "ikRPsolver1";
	rename -uid "C8E02A8C-4202-BEA8-2F8D-9290A57AA09B";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "B006B0D8-48F6-5D15-DC8A-59BEC6AC6F25";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "17C1D7B4-4573-35D7-1164-A487CD5342B7";
	setAttr ".cdl" 5;
	setAttr -s 5 ".dli[1:4]"  5 3 2 4;
createNode displayLayer -n "defaultLayer";
	rename -uid "B15E876D-47C6-71D4-FBBA-048077D00CDF";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "EA938840-4EB3-3F02-0D8C-198C6C9A1D70";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "5C2832CF-4FC3-2DB8-D683-F7B50E309797";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "44ADB294-49A8-B8B3-D84E-CBAAA5106C29";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 200 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode partition -n "mtorPartition";
	rename -uid "8CC7BF48-4A86-882D-E2DB-028431EC97F8";
	addAttr -s false -ci true -sn "inmsg" -ln "inmessage" -at "message";
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "EBF28316-419F-274E-76E9-D1A77342611D";
createNode multMatrix -n "multMatrix22";
	rename -uid "90F85673-47DB-4B04-D63E-7A86A1F2F404";
	setAttr -s 3 ".i";
createNode multMatrix -n "fk_b_group_multMatrix";
	rename -uid "92FB0ACE-49D6-3B44-1C8E-9B850827D60F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "fk_b_group_decomposeMatrix";
	rename -uid "E1D230EF-4097-909B-977D-E5A8D0E8F87E";
createNode decomposeMatrix -n "decomposeMatrix31";
	rename -uid "38542C6A-4CB6-44A8-3510-B0A0D03EB7FA";
createNode multMatrix -n "multMatrix29";
	rename -uid "634A3683-4EC1-9B2B-3D32-BA9C079484F0";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix33";
	rename -uid "7B3DD7BD-4834-17AA-5B41-A7B2A663FC5C";
createNode objectSet -n "moduleControlSet";
	rename -uid "D7BC7D81-4F26-88A6-9FC5-6E9986D00672";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr -s 2 ".dnsm";
createNode condition -n "mirror_condition";
	rename -uid "EEF9BA96-4EAB-717C-397E-9F856CB0C724";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 180 -90 ;
	setAttr ".cf" -type "float3" 1 0 0 ;
createNode decomposeMatrix -n "root_connector_decomposeMatrix";
	rename -uid "404568ED-4EA6-FE8F-F7DE-E0A7EDDBCFBF";
createNode multMatrix -n "fk_end_group_multMatrix";
	rename -uid "72D1AF69-446E-23DA-29C7-E0891700EFCA";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "fk_end_group_decomposeMatrix";
	rename -uid "A21637F4-426B-B612-23CE-19A06AB5AB12";
createNode decomposeMatrix -n "decomposeMatrix41";
	rename -uid "9BF48627-4A07-CC74-3B6C-71B5D5F6662B";
createNode decomposeMatrix -n "decomposeMatrix43";
	rename -uid "980DCD70-4025-1265-C981-87AC95A851BD";
createNode decomposeMatrix -n "decomposeMatrix44";
	rename -uid "28A94D56-4CD8-AEF0-18B8-2BB54D65EB2A";
createNode decomposeMatrix -n "decomposeMatrix45";
	rename -uid "E3C0C7D3-4AE4-1036-FFD6-8D9547D1AC4C";
createNode multMatrix -n "multMatrix34";
	rename -uid "21FB4BF7-4ED0-83FB-A2CC-378605F43EEC";
createNode objectSet -n "sets";
	rename -uid "6ADA74BA-4FDE-4A7E-4FF7-FE9C390A24C9";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode unitConversion -n "unitConversion431";
	rename -uid "C2A2499F-4E80-FAF7-6B31-B2BC55E61199";
	setAttr ".cf" 0.017453292519943295;
createNode hyperView -n "hyperView3";
	rename -uid "AF710D50-4501-D6D1-DA8E-8DB031F658FD";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout3";
	rename -uid "F27C25A4-4172-DD3C-0D5F-8D9F5B6C4E6C";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView4";
	rename -uid "069233FA-4FB5-0160-991D-F78982969664";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout4";
	rename -uid "F1D46644-40FB-969C-7910-45871D558160";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView5";
	rename -uid "DADAE701-4F99-17B9-CD33-78A677FB420C";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout5";
	rename -uid "33A33EDF-4E32-9E81-4225-619A9B165F4E";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView6";
	rename -uid "8B639513-4907-01C1-9269-F4845327E3D4";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout6";
	rename -uid "2E6A7DE9-4BA1-69AD-46E6-0690636CA96B";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode multDoubleLinear -n "multDoubleLinear435";
	rename -uid "D9522FF2-477E-9E2C-0E7D-0BB93F51CC8B";
createNode multMatrix -n "multMatrix38";
	rename -uid "5D4E317E-4219-CFBC-9690-77ABFFDB4802";
	setAttr -s 2 ".i";
createNode objectSet -n "ikFkSwitchSet";
	rename -uid "6C87E4BD-49B4-5431-9F52-FD94F6EAFCEC";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "decomposeMatrix42";
	rename -uid "8E7D60C5-4504-3F32-F6FD-D89B9392F035";
createNode unitConversion -n "unitConversion1";
	rename -uid "C4D3E66C-4646-D860-454C-10BF3C370B7C";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion432";
	rename -uid "3AACE47D-47FA-7AC1-3323-158B289D4AA5";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "rootMiddle_vector";
	rename -uid "77C94AB7-47B5-80D0-CF7D-67B6A54FC439";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "rootEnd_vector";
	rename -uid "5E4FF626-4076-AD44-E39C-5DABC0E64F67";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "cosAngle_bewtweenVectors";
	rename -uid "D61FCF87-4C72-76AB-569B-F287964D0A80";
	setAttr ".no" yes;
createNode multiplyDivide -n "rootEnd_vectorNormalized_projected";
	rename -uid "5B7EA4BC-449B-8BF3-F717-6B8CB134D977";
createNode distanceBetween -n "rootMiddle_distance";
	rename -uid "35D50ED0-4253-4BE7-D427-1E87CE990A95";
createNode vectorProduct -n "rootEnd_vectorNormalized";
	rename -uid "3FB7B668-49AC-7159-915B-66A6D8D1C146";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode multiplyDivide -n "rootMiddle_projected";
	rename -uid "4749C16C-49E4-5042-AB94-75A9D2A13FEB";
createNode plusMinusAverage -n "rootMiddle_betweenPoint";
	rename -uid "CF7A1C5E-4FB0-950B-E5CC-20834BE2F369";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "frombetweenToMiddle_vector";
	rename -uid "7FF97759-406D-2FCB-909F-76ABAF00C1C5";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "middleOut_vector";
	rename -uid "10336808-4507-6C6E-B9C3-6399C09F4DB4";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "middleOut_vectorNormalized";
	rename -uid "C20A8355-4CB4-C85E-D11B-14AE27C7C9F2";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode multiplyDivide -n "multiplyDivide352";
	rename -uid "CE4DAFFA-4931-A2F6-C261-C29EA1197EBB";
createNode composeMatrix -n "middleOut_matrix";
	rename -uid "6DFEF1FE-4E3B-80F9-5C68-D5A21D415769";
createNode multMatrix -n "ik_aim_multMatrix";
	rename -uid "396F38CC-422F-339B-FE12-56B723099509";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "aimOffset_scaled";
	rename -uid "958D9974-4B71-3AAA-79B9-28974A894F40";
	setAttr ".i2" 1;
createNode multiplyDivide -n "final_length";
	rename -uid "86783661-4165-EA87-8D4B-FB98514CDBF9";
createNode blendColors -n "stretch_blend";
	rename -uid "4C6EAABA-4FC6-41B0-9B8D-479143357217";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "final_length_factor";
	rename -uid "7349214D-44E6-40AE-6F1D-428EC016459B";
	setAttr ".op" 2;
createNode multiplyDivide -n "current_length_scaled";
	rename -uid "51AAFAEC-47A2-5FE3-AC4D-0AA68701F6B5";
	setAttr ".op" 2;
createNode condition -n "stretch_condition";
	rename -uid "EEB42DFA-4427-1FEF-D5B4-2688CD639A6D";
	setAttr ".op" 5;
createNode plusMinusAverage -n "init_lenth_minus_softIk";
	rename -uid "801251F2-414F-8010-BD51-81B6764FA59A";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode addDoubleLinear -n "init_length";
	rename -uid "88653D92-40D7-E231-A67F-FBB4651FEA21";
	setAttr ".ihi" 2;
createNode multiplyDivide -n "init_length_a";
	rename -uid "3C920FC3-4CF6-C10E-E5F9-87BACC1F72A2";
createNode multiplyDivide -n "init_length_b";
	rename -uid "4AF75291-4246-5788-07AA-DEA32F46990E";
createNode addDoubleLinear -n "return_softIk";
	rename -uid "0B163F3C-49E4-F128-E4D9-4DB6C39028E1";
	setAttr ".ihi" 2;
createNode multDoubleLinear -n "one_minus_by_softIk";
	rename -uid "098E73D0-4559-B081-A3D1-529E1A530850";
createNode plusMinusAverage -n "one_minus";
	rename -uid "B9B284E2-4900-47E1-D202-AE9F49ADC019";
	setAttr ".op" 2;
	setAttr -s 2 ".i1[0:1]"  1 3.060258389;
createNode multiplyDivide -n "power";
	rename -uid "F451BD52-4432-522F-D9BF-A584EA5E989D";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 2.7182817 0 0 ;
createNode multiplyDivide -n "length_difference_by_softIk";
	rename -uid "077634C3-4AF3-4979-FDDB-94876A21C720";
	setAttr ".op" 2;
createNode multDoubleLinear -n "length_difference_minus";
	rename -uid "A71F99C1-45CE-08D5-5BA3-7DACF285E107";
	setAttr ".i2" -1;
createNode plusMinusAverage -n "length_difference";
	rename -uid "4F7F4B83-44D8-1943-5537-A8B9526EC271";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode distanceBetween -n "current_length";
	rename -uid "F68C1E31-4AF2-D5D6-CAD8-CFB7E59EE7AE";
createNode multiplyDivide -n "scale_to_translate_converter";
	rename -uid "5E12787B-4506-4DD4-48A2-3D9A225749FD";
createNode remapValue -n "softIk_value";
	rename -uid "BB97FDF4-49A7-F309-0A55-09AA81D1E3B5";
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
	rename -uid "2AAB589E-499B-5B90-BD80-63BDF12CA77B";
	setAttr ".op" 2;
createNode blendColors -n "snap_blend";
	rename -uid "02088822-49CD-C4E2-9FBE-FE9031046F3D";
createNode distanceBetween -n "current_rootToSnapPoint_length";
	rename -uid "38747F14-4274-167B-CA3D-EBAD69180752";
createNode multiplyDivide -n "current_toSnapPoint_length_scaled";
	rename -uid "4010073F-4223-33D5-F286-47BF1A2F6180";
	setAttr ".op" 2;
createNode distanceBetween -n "current_endToSnapPoint_length";
	rename -uid "BF2249E9-4D42-A65E-79E4-689DFF08756B";
createNode decomposeMatrix -n "decomposeMatrix46";
	rename -uid "74CBB588-479E-DA67-392D-CD8AEA2DBEED";
createNode multMatrix -n "multMatrix39";
	rename -uid "A530E3E5-492D-BFED-24D5-91A8C135A9F9";
	setAttr -s 2 ".i";
createNode composeMatrix -n "world_composeMatrix";
	rename -uid "BB7424FA-4966-465F-840E-A6BD29B91FFB";
createNode blendColors -n "blendColors1";
	rename -uid "171C32C0-47E6-009A-0C86-6BB46C4AB4B1";
createNode unitConversion -n "unitConversion433";
	rename -uid "EBF8F902-43DE-7467-BDC2-EA996876ECA2";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion434";
	rename -uid "5AD8038C-44D4-74E6-A810-6A8BD5907D48";
	setAttr ".cf" 0.017453292519943295;
createNode blendColors -n "blendColors2";
	rename -uid "7896149E-44FF-2740-0AD5-B997915B1B9C";
createNode unitConversion -n "unitConversion435";
	rename -uid "A8982C80-495E-0F3A-7F64-A7B69F468419";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion436";
	rename -uid "BE7EFB62-41D5-0493-9B31-5881FCE2A10A";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion437";
	rename -uid "094F8691-4B19-771D-5ECD-0584A3458353";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "control_group_decomposeMatrix";
	rename -uid "F6D409E3-4028-FCEC-C5EA-298EEADA68F0";
createNode multMatrix -n "control_group_multMatrix";
	rename -uid "FCD22171-4189-5C54-FD60-D0A7B5A1F4D3";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "multDoubleLinear437";
	rename -uid "3961928D-4E65-ED4C-D945-85B67A0823EB";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion440";
	rename -uid "9EC7A070-44E1-9C12-6B13-1B9213BE2765";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion443";
	rename -uid "D4377EB4-4E35-F4EE-2563-D19B87E04BF5";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion444";
	rename -uid "BAF07175-48C1-322A-57D7-C68BD7A752C3";
	setAttr ".cf" 0.017453292519943295;
createNode multiplyDivide -n "volume_mult";
	rename -uid "3C424366-4D61-E40D-9DE5-A983304FC1C4";
	setAttr ".op" 2;
createNode blendColors -n "volume_blendColors";
	rename -uid "F0D2CE12-4699-2595-CE19-E8959792C2C2";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode unitConversion -n "unitConversion445";
	rename -uid "AC3CEAD9-4993-E9F0-38CA-43A0D32E0733";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "ik_aim_decomposeMatrix";
	rename -uid "190A3109-43A7-1B5F-45CD-0499FE2D0026";
createNode multDoubleLinear -n "initScale1_mult";
	rename -uid "067E67A3-4B1E-EB2D-3DF2-C1B60D9B2EC8";
createNode multDoubleLinear -n "initScaleEnd_mult";
	rename -uid "32D1D150-40D1-36E7-77DF-21BDEE54B38B";
createNode decomposeMatrix -n "decomposeMatrix49";
	rename -uid "D7908C79-4AE1-227F-1FC2-2B9F3972153E";
createNode multiplyDivide -n "multiplyDivide353";
	rename -uid "9861FF2F-43CE-66E9-AC6C-228591622BF9";
	setAttr ".i2" -type "float3" -1 1 1 ;
createNode unitConversion -n "unitConversion446";
	rename -uid "7C8E5293-4B54-9D26-ABD7-F589EB3D158A";
	setAttr ".cf" 57.295779513082323;
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "164F4A7D-4B13-C83B-4F1D-35B939F52131";
	setAttr ".ihi" 2;
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "1484F8B9-436C-0FB5-9E1B-F79AAD84A6C5";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "DFA2E33A-453D-0DED-A14D-E6BD6FEBD43C";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode blendColors -n "ikfk_blend";
	rename -uid "4377AEB8-448E-A4E5-E0D9-FCA36318D1C6";
	setAttr ".c2" -type "float3" 1 1 1 ;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "EEFF6DA6-4DCD-8F4C-6764-1E8E61931AAD";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "4BF885E6-4EEC-799F-6BE8-62BBC84FE52E";
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "E06E584E-4F44-08F7-202C-62A9DF3268E5";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "C8562179-48C0-C6E6-EC2D-C98541679724";
	setAttr ".g" yes;
createNode decomposeMatrix -n "root_decomposeMatrix";
	rename -uid "0A52AEE4-40D1-DEF0-8BB4-DD854B606741";
createNode multMatrix -n "root_multMatrix";
	rename -uid "23740F9F-4543-F65A-C842-1983E844881B";
createNode composeMatrix -n "mirror_composeMatrix";
	rename -uid "8601AEBA-4FFA-F757-28D1-89B9B30A9E2B";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "1B275863-440D-ACE7-2228-B4AA3286DE91";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "4CBD4363-44A7-072F-449B-C19F3BB5A2E0";
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "6E7D770B-40F8-7736-8F57-758A20381435";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "4DB49BAA-4AFF-D2AA-7FEB-42B04108499D";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "96D17248-4392-5B22-1222-C1BBF0D4D123";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 3162.0788522829125 -742.01506923738589 ;
	setAttr ".tgi[0].vh" -type "double2" 8207.4232123874026 829.26825973076689 ;
	setAttr ".tgi[0].ni[0].x" 1441.4285888671875;
	setAttr ".tgi[0].ni[0].y" 120;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode decomposeMatrix -n "decomposeMatrix50";
	rename -uid "90064B21-454B-40AD-7BDD-EFB807FF7188";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "4A6112DB-428E-A404-2966-85933440BAAC";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide1";
	rename -uid "60024AD8-47DA-7D5F-3A2A-3EAF656A3CF7";
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "D96870A2-48F9-6970-D322-74963E84F4DB";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "79019F22-4A65-E21A-3B79-BFA4D74A5144";
createNode multDoubleLinear -n "multDoubleLinear438";
	rename -uid "1FFAF73E-4227-BF3A-CF27-CBA0BC011FA0";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "BE6682D6-4391-9D75-23BA-B5B03ABF5DC9";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "A74D0140-4538-D72B-7315-5AB20DF40D25";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode objectSet -n "skinJointsSet";
	rename -uid "3259AE12-474E-705D-6FFA-F9BFCC6D8114";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
createNode composeMatrix -n "composeMatrix1";
	rename -uid "5626973F-43C9-130F-050D-C6B4324AEEBE";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "E7F16CC5-4EC5-2B90-B2C3-2B90DB8E9775";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -8676.1901314296538 -8014.5339633934254 ;
	setAttr ".tgi[0].vh" -type "double2" 5040.4759901856733 7310.9625627794121 ;
	setAttr -s 7 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -2115.71435546875;
	setAttr ".tgi[0].ni[0].y" -298.57144165039062;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -1808.5714111328125;
	setAttr ".tgi[0].ni[1].y" -234.28572082519531;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -2422.857177734375;
	setAttr ".tgi[0].ni[2].y" -147.14285278320312;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" -1501.4285888671875;
	setAttr ".tgi[0].ni[3].y" -198.57142639160156;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -1617.0753173828125;
	setAttr ".tgi[0].ni[4].y" -690.0511474609375;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -2421.86865234375;
	setAttr ".tgi[0].ni[5].y" -457.77679443359375;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" -1501.4285888671875;
	setAttr ".tgi[0].ni[6].y" -502.85714721679688;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -6610.1263264343561 80.952377735622392 ;
	setAttr ".tgi[1].vh" -type "double2" -5777.9684194022238 1010.71424555211 ;
	setAttr -s 53 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -3938.571533203125;
	setAttr ".tgi[1].ni[0].y" -548.5714111328125;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" -6435.71435546875;
	setAttr ".tgi[1].ni[1].y" 634.28570556640625;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" -4592.85693359375;
	setAttr ".tgi[1].ni[2].y" 185.71427917480469;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" -4592.85693359375;
	setAttr ".tgi[1].ni[3].y" -30;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" -3938.571533203125;
	setAttr ".tgi[1].ni[4].y" 635.71429443359375;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" -3938.571533203125;
	setAttr ".tgi[1].ni[5].y" 1174.2857666015625;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" -4592.85693359375;
	setAttr ".tgi[1].ni[6].y" -762.85711669921875;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" -4900;
	setAttr ".tgi[1].ni[7].y" 527.14288330078125;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[1].ni[8].x" -3938.571533203125;
	setAttr ".tgi[1].ni[8].y" 432.85714721679688;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" -4592.85693359375;
	setAttr ".tgi[1].ni[9].y" 508.57144165039062;
	setAttr ".tgi[1].ni[9].nvs" 18304;
	setAttr ".tgi[1].ni[10].x" -3938.571533203125;
	setAttr ".tgi[1].ni[10].y" 230;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" -5821.4287109375;
	setAttr ".tgi[1].ni[11].y" 1138.5714111328125;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" -4282.85693359375;
	setAttr ".tgi[1].ni[12].y" -971.4285888671875;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" -5514.28564453125;
	setAttr ".tgi[1].ni[13].y" 1038.5714111328125;
	setAttr ".tgi[1].ni[13].nvs" 18304;
	setAttr ".tgi[1].ni[14].x" -3938.571533203125;
	setAttr ".tgi[1].ni[14].y" -447.14285278320312;
	setAttr ".tgi[1].ni[14].nvs" 18304;
	setAttr ".tgi[1].ni[15].x" -4900;
	setAttr ".tgi[1].ni[15].y" 857.14288330078125;
	setAttr ".tgi[1].ni[15].nvs" 18304;
	setAttr ".tgi[1].ni[16].x" -4282.85693359375;
	setAttr ".tgi[1].ni[16].y" 45.714286804199219;
	setAttr ".tgi[1].ni[16].nvs" 18304;
	setAttr ".tgi[1].ni[17].x" -3938.571533203125;
	setAttr ".tgi[1].ni[17].y" -1055.7142333984375;
	setAttr ".tgi[1].ni[17].nvs" 18304;
	setAttr ".tgi[1].ni[18].x" -3938.571533203125;
	setAttr ".tgi[1].ni[18].y" -751.4285888671875;
	setAttr ".tgi[1].ni[18].nvs" 18304;
	setAttr ".tgi[1].ni[19].x" -4900;
	setAttr ".tgi[1].ni[19].y" -5.7142858505249023;
	setAttr ".tgi[1].ni[19].nvs" 18304;
	setAttr ".tgi[1].ni[20].x" -3938.571533203125;
	setAttr ".tgi[1].ni[20].y" 534.28570556640625;
	setAttr ".tgi[1].ni[20].nvs" 18304;
	setAttr ".tgi[1].ni[21].x" -5514.28564453125;
	setAttr ".tgi[1].ni[21].y" 314.28570556640625;
	setAttr ".tgi[1].ni[21].nvs" 18304;
	setAttr ".tgi[1].ni[22].x" -4900;
	setAttr ".tgi[1].ni[22].y" 425.71429443359375;
	setAttr ".tgi[1].ni[22].nvs" 18304;
	setAttr ".tgi[1].ni[23].x" -4282.85693359375;
	setAttr ".tgi[1].ni[23].y" 605.71429443359375;
	setAttr ".tgi[1].ni[23].nvs" 18304;
	setAttr ".tgi[1].ni[24].x" -4282.85693359375;
	setAttr ".tgi[1].ni[24].y" 288.57144165039062;
	setAttr ".tgi[1].ni[24].nvs" 18304;
	setAttr ".tgi[1].ni[25].x" -3938.571533203125;
	setAttr ".tgi[1].ni[25].y" -41.428569793701172;
	setAttr ".tgi[1].ni[25].nvs" 18304;
	setAttr ".tgi[1].ni[26].x" -4282.85693359375;
	setAttr ".tgi[1].ni[26].y" -214.28572082519531;
	setAttr ".tgi[1].ni[26].nvs" 18304;
	setAttr ".tgi[1].ni[27].x" -4592.85693359375;
	setAttr ".tgi[1].ni[27].y" -131.42857360839844;
	setAttr ".tgi[1].ni[27].nvs" 18304;
	setAttr ".tgi[1].ni[28].x" -6128.5712890625;
	setAttr ".tgi[1].ni[28].y" 611.4285888671875;
	setAttr ".tgi[1].ni[28].nvs" 18304;
	setAttr ".tgi[1].ni[29].x" -4592.85693359375;
	setAttr ".tgi[1].ni[29].y" 1174.2857666015625;
	setAttr ".tgi[1].ni[29].nvs" 18304;
	setAttr ".tgi[1].ni[30].x" -4282.85693359375;
	setAttr ".tgi[1].ni[30].y" -55.714286804199219;
	setAttr ".tgi[1].ni[30].nvs" 18304;
	setAttr ".tgi[1].ni[31].x" -3938.571533203125;
	setAttr ".tgi[1].ni[31].y" -244.28572082519531;
	setAttr ".tgi[1].ni[31].nvs" 18304;
	setAttr ".tgi[1].ni[32].x" -3938.571533203125;
	setAttr ".tgi[1].ni[32].y" 1275.7142333984375;
	setAttr ".tgi[1].ni[32].nvs" 18304;
	setAttr ".tgi[1].ni[33].x" -4282.85693359375;
	setAttr ".tgi[1].ni[33].y" -870;
	setAttr ".tgi[1].ni[33].nvs" 18304;
	setAttr ".tgi[1].ni[34].x" -5821.4287109375;
	setAttr ".tgi[1].ni[34].y" 465.71429443359375;
	setAttr ".tgi[1].ni[34].nvs" 18304;
	setAttr ".tgi[1].ni[35].x" -3938.571533203125;
	setAttr ".tgi[1].ni[35].y" -142.85714721679688;
	setAttr ".tgi[1].ni[35].nvs" 18304;
	setAttr ".tgi[1].ni[36].x" -3938.571533203125;
	setAttr ".tgi[1].ni[36].y" -650;
	setAttr ".tgi[1].ni[36].nvs" 18304;
	setAttr ".tgi[1].ni[37].x" -3938.571533203125;
	setAttr ".tgi[1].ni[37].y" -1157.142822265625;
	setAttr ".tgi[1].ni[37].nvs" 18304;
	setAttr ".tgi[1].ni[38].x" -5207.14306640625;
	setAttr ".tgi[1].ni[38].y" 951.4285888671875;
	setAttr ".tgi[1].ni[38].nvs" 18304;
	setAttr ".tgi[1].ni[39].x" -3938.571533203125;
	setAttr ".tgi[1].ni[39].y" -852.85711669921875;
	setAttr ".tgi[1].ni[39].nvs" 18304;
	setAttr ".tgi[1].ni[40].x" -4592.85693359375;
	setAttr ".tgi[1].ni[40].y" 407.14285278320312;
	setAttr ".tgi[1].ni[40].nvs" 18304;
	setAttr ".tgi[1].ni[41].x" -5207.14306640625;
	setAttr ".tgi[1].ni[41].y" 138.57142639160156;
	setAttr ".tgi[1].ni[41].nvs" 18304;
	setAttr ".tgi[1].ni[42].x" -4900;
	setAttr ".tgi[1].ni[42].y" 95.714286804199219;
	setAttr ".tgi[1].ni[42].nvs" 18304;
	setAttr ".tgi[1].ni[43].x" -3938.571533203125;
	setAttr ".tgi[1].ni[43].y" -345.71429443359375;
	setAttr ".tgi[1].ni[43].nvs" 18304;
	setAttr ".tgi[1].ni[44].x" -3938.571533203125;
	setAttr ".tgi[1].ni[44].y" 331.42855834960938;
	setAttr ".tgi[1].ni[44].nvs" 18304;
	setAttr ".tgi[1].ni[45].x" -5207.14306640625;
	setAttr ".tgi[1].ni[45].y" 240;
	setAttr ".tgi[1].ni[45].nvs" 18304;
	setAttr ".tgi[1].ni[46].x" -4282.85693359375;
	setAttr ".tgi[1].ni[46].y" 390;
	setAttr ".tgi[1].ni[46].nvs" 18304;
	setAttr ".tgi[1].ni[47].x" -3938.571533203125;
	setAttr ".tgi[1].ni[47].y" 737.14288330078125;
	setAttr ".tgi[1].ni[47].nvs" 18304;
	setAttr ".tgi[1].ni[48].x" -3938.571533203125;
	setAttr ".tgi[1].ni[48].y" -954.28570556640625;
	setAttr ".tgi[1].ni[48].nvs" 18304;
	setAttr ".tgi[1].ni[49].x" -4592.85693359375;
	setAttr ".tgi[1].ni[49].y" 724.28570556640625;
	setAttr ".tgi[1].ni[49].nvs" 18304;
	setAttr ".tgi[1].ni[50].x" -4282.85693359375;
	setAttr ".tgi[1].ni[50].y" 1174.2857666015625;
	setAttr ".tgi[1].ni[50].nvs" 18304;
	setAttr ".tgi[1].ni[51].x" -4900;
	setAttr ".tgi[1].ni[51].y" -507.14285278320312;
	setAttr ".tgi[1].ni[51].nvs" 18304;
	setAttr ".tgi[1].ni[52].x" -4592.85693359375;
	setAttr ".tgi[1].ni[52].y" -661.4285888671875;
	setAttr ".tgi[1].ni[52].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -6440.721037769722 -941.84170302093571 ;
	setAttr ".tgi[2].vh" -type "double2" -5609.6286241064463 -13.270300495233464 ;
	setAttr -s 6 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" -5934.28564453125;
	setAttr ".tgi[2].ni[0].y" -641.4285888671875;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" -5934.28564453125;
	setAttr ".tgi[2].ni[1].y" -511.42855834960938;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" -5940;
	setAttr ".tgi[2].ni[2].y" -418.57144165039062;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" -6313.109375;
	setAttr ".tgi[2].ni[3].y" -70.084037780761719;
	setAttr ".tgi[2].ni[3].nvs" 18305;
	setAttr ".tgi[2].ni[4].x" -6310.3359375;
	setAttr ".tgi[2].ni[4].y" -442.52099609375;
	setAttr ".tgi[2].ni[4].nvs" 18305;
	setAttr ".tgi[2].ni[5].x" -5940;
	setAttr ".tgi[2].ni[5].y" -158.57142639160156;
	setAttr ".tgi[2].ni[5].nvs" 18304;
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
	setAttr -s 71 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".r";
select -ne :standardSurface1;
	setAttr ".b" 0.80000001192092896;
	setAttr ".bc" -type "float3" 1 1 1 ;
	setAttr ".s" 0.20000000298023224;
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
	setAttr -av -k on ".pa";
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
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "root_poser_aimConstraint1.crx" "root_poser.rx" -l on;
connectAttr "root_poser_aimConstraint1.cry" "root_poser.ry" -l on;
connectAttr "root_poser_aimConstraint1.crz" "root_poser.rz" -l on;
connectAttr "root_poser.sx" "root_poser.sy" -l on;
connectAttr "root_poser.sx" "root_poser.sz" -l on;
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
connectAttr "unitConversion1.o" "rootMiddle_orient_locator_aimConstraint1.ox";
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
connectAttr "end_poser.wm" "root_poser_aimConstraint1.wum";
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
connectAttr "middleRoot_orient_locator_orientConstraint1.crx" "middleOffset_initLoc.rx"
		;
connectAttr "middleRoot_orient_locator_orientConstraint1.cry" "middleOffset_initLoc.ry"
		;
connectAttr "middleRoot_orient_locator_orientConstraint1.crz" "middleOffset_initLoc.rz"
		;
connectAttr "middleOffset_initLoc.ro" "middleRoot_orient_locator_orientConstraint1.cro"
		;
connectAttr "middleOffset_initLoc.pim" "middleRoot_orient_locator_orientConstraint1.cpim"
		;
connectAttr "middle_poserOrient.r" "middleRoot_orient_locator_orientConstraint1.tg[0].tr"
		;
connectAttr "middle_poserOrient.ro" "middleRoot_orient_locator_orientConstraint1.tg[0].tro"
		;
connectAttr "middle_poserOrient.pm" "middleRoot_orient_locator_orientConstraint1.tg[0].tpm"
		;
connectAttr "middleRoot_orient_locator_orientConstraint1.w0" "middleRoot_orient_locator_orientConstraint1.tg[0].tw"
		;
connectAttr "root_twist_angleLoc_1.r" "middleRoot_orient_locator_orientConstraint1.tg[1].tr"
		;
connectAttr "root_twist_angleLoc_1.ro" "middleRoot_orient_locator_orientConstraint1.tg[1].tro"
		;
connectAttr "root_twist_angleLoc_1.pm" "middleRoot_orient_locator_orientConstraint1.tg[1].tpm"
		;
connectAttr "middleRoot_orient_locator_orientConstraint1.w1" "middleRoot_orient_locator_orientConstraint1.tg[1].tw"
		;
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
connectAttr "root_poser.t" "root_twist_angleLoc_2_aimConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "root_twist_angleLoc_2_aimConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "root_twist_angleLoc_2_aimConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "root_twist_angleLoc_2_aimConstraint1.tg[0].tpm";
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
connectAttr "root_poser.t" "root_twist_angleLoc_1_aimConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "root_twist_angleLoc_1_aimConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "root_twist_angleLoc_1_aimConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "root_twist_angleLoc_1_aimConstraint1.tg[0].tpm";
connectAttr "root_twist_angleLoc_1_aimConstraint1.w0" "root_twist_angleLoc_1_aimConstraint1.tg[0].tw"
		;
connectAttr "end_poser.wm" "root_twist_angleLoc_1_aimConstraint1.wum";
connectAttr "makeNurbSphere3.os" "end_poserShape.cr";
connectAttr "middle_line_endOrient_locator_orientConstraint1.crx" "middle_line_endOrient_locator.rx"
		;
connectAttr "middle_line_endOrient_locator_orientConstraint1.cry" "middle_line_endOrient_locator.ry"
		;
connectAttr "middle_line_endOrient_locator_orientConstraint1.crz" "middle_line_endOrient_locator.rz"
		;
connectAttr "middle_line_endOrient_locator.ro" "middle_line_endOrient_locator_orientConstraint1.cro"
		;
connectAttr "middle_line_endOrient_locator.pim" "middle_line_endOrient_locator_orientConstraint1.cpim"
		;
connectAttr "middle_poserOrient.r" "middle_line_endOrient_locator_orientConstraint1.tg[0].tr"
		;
connectAttr "middle_poserOrient.ro" "middle_line_endOrient_locator_orientConstraint1.tg[0].tro"
		;
connectAttr "middle_poserOrient.pm" "middle_line_endOrient_locator_orientConstraint1.tg[0].tpm"
		;
connectAttr "middle_line_endOrient_locator_orientConstraint1.w0" "middle_line_endOrient_locator_orientConstraint1.tg[0].tw"
		;
connectAttr "mirror_condition.ocr" "end_initLoc.sx";
connectAttr "unitConversion434.o" "end_poserOrient.r";
connectAttr "root_poser.t" "control_initLoc.t";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sz";
connectAttr "root_initLocShape.wp" "posers_curveShape.cp[0]";
connectAttr "middle_initLocShape.wp" "posers_curveShape.cp[1]";
connectAttr "end_initLocShape.wp" "posers_curveShape.cp[2]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "decomposeMatrix31.otx" "ik_connector_main.tx";
connectAttr "decomposeMatrix31.oty" "ik_connector_main.ty";
connectAttr "decomposeMatrix31.otz" "ik_connector_main.tz";
connectAttr "decomposeMatrix31.orx" "ik_connector_main.rx";
connectAttr "decomposeMatrix31.ory" "ik_connector_main.ry";
connectAttr "decomposeMatrix31.orz" "ik_connector_main.rz";
connectAttr "decomposeMatrix31.osx" "ik_connector_main.sx";
connectAttr "decomposeMatrix31.osy" "ik_connector_main.sy";
connectAttr "decomposeMatrix31.osz" "ik_connector_main.sz";
connectAttr "root_poserOrient.wm" "root_connector_init.opm";
connectAttr "root_connector.wm" "controls.opm";
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
connectAttr "ik_aim_decomposeMatrix.ot" "ik_aim_init.t";
connectAttr "decomposeMatrix45.orx" "ik_aim_init.rx";
connectAttr "decomposeMatrix45.ory" "ik_aim_init.ry";
connectAttr "decomposeMatrix45.orz" "ik_aim_init.rz";
connectAttr "mirror_condition.ocr" "ik_aim_mirror.sz";
connectAttr "decomposeMatrix25.ot" "ik_end_init.t";
connectAttr "unitConversion437.o" "ik_end_init.r";
connectAttr "mirror_condition.ocr" "ik_end_mirror.sz";
connectAttr "ik_connector.t" "ik_end_out_init.t";
connectAttr "mirror_condition.ocr" "ik_end_out.sy";
connectAttr "unitConversion431.o" "ik_end_out.rx";
connectAttr "unitConversion440.o" "ik_end_out.ry";
connectAttr "curveStart_locatorShape.wp" "aim_curveShape.cp[0]";
connectAttr "curveEnd_locatorShape.wp" "aim_curveShape.cp[1]";
connectAttr "middle_control_orientConstraint1.crx" "middleOffset_group.rx";
connectAttr "middle_control_orientConstraint1.cry" "middleOffset_group.ry";
connectAttr "middle_control_orientConstraint1.crz" "middleOffset_group.rz";
connectAttr "middle_control_pointConstraint1.ctx" "middleOffset_group.tx";
connectAttr "middle_control_pointConstraint1.cty" "middleOffset_group.ty";
connectAttr "middle_control_pointConstraint1.ctz" "middleOffset_group.tz";
connectAttr "middleOffset_group.pim" "middle_control_pointConstraint1.cpim";
connectAttr "middleOffset_group.rp" "middle_control_pointConstraint1.crp";
connectAttr "middleOffset_group.rpt" "middle_control_pointConstraint1.crt";
connectAttr "b_finalJoint.t" "middle_control_pointConstraint1.tg[0].tt";
connectAttr "b_finalJoint.rp" "middle_control_pointConstraint1.tg[0].trp";
connectAttr "b_finalJoint.rpt" "middle_control_pointConstraint1.tg[0].trt";
connectAttr "b_finalJoint.pm" "middle_control_pointConstraint1.tg[0].tpm";
connectAttr "middle_control_pointConstraint1.w0" "middle_control_pointConstraint1.tg[0].tw"
		;
connectAttr "middleOffset_group.ro" "middle_control_orientConstraint1.cro";
connectAttr "middleOffset_group.pim" "middle_control_orientConstraint1.cpim";
connectAttr "a_finalJoint.r" "middle_control_orientConstraint1.tg[0].tr";
connectAttr "a_finalJoint.ro" "middle_control_orientConstraint1.tg[0].tro";
connectAttr "a_finalJoint.pm" "middle_control_orientConstraint1.tg[0].tpm";
connectAttr "a_finalJoint.jo" "middle_control_orientConstraint1.tg[0].tjo";
connectAttr "middle_control_orientConstraint1.w0" "middle_control_orientConstraint1.tg[0].tw"
		;
connectAttr "b_finalJoint.r" "middle_control_orientConstraint1.tg[1].tr";
connectAttr "b_finalJoint.ro" "middle_control_orientConstraint1.tg[1].tro";
connectAttr "b_finalJoint.pm" "middle_control_orientConstraint1.tg[1].tpm";
connectAttr "b_finalJoint.jo" "middle_control_orientConstraint1.tg[1].tjo";
connectAttr "middle_control_orientConstraint1.w1" "middle_control_orientConstraint1.tg[1].tw"
		;
connectAttr "unitConversion445.o" "middle_control_orientConstraint1.ox";
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
connectAttr "a_ikJoint.s" "b_ikJoint.is";
connectAttr "snap_blend.opr" "b_ikJoint.tx";
connectAttr "b_ikJoint.s" "end_ikJoint.is";
connectAttr "decomposeMatrix33.orx" "end_ikJoint.rx";
connectAttr "decomposeMatrix33.ory" "end_ikJoint.ry";
connectAttr "decomposeMatrix33.orz" "end_ikJoint.rz";
connectAttr "snap_blend.opg" "end_ikJoint.tx";
connectAttr "end_ikJoint.tx" "effector.tx";
connectAttr "end_ikJoint.ty" "effector.ty";
connectAttr "end_ikJoint.tz" "effector.tz";
connectAttr "root_connector_decomposeMatrix.osx" "joints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "joints.sy";
connectAttr "multDoubleLinear435.o" "joints.sz";
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
connectAttr "ikFk_reverse.ox" "end_joint_parentConstraint1.w0";
connectAttr "control.ikFk" "end_joint_parentConstraint1.w1";
connectAttr "mirror_condition.ocr" "fk_end_ikFkSwitchHelper.sx";
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
connectAttr "joints.s" "outJoints.s";
connectAttr "a_finalJoint.ty" "root_outJoint.ty";
connectAttr "a_finalJoint.tz" "root_outJoint.tz";
connectAttr "a_finalJoint.tx" "root_outJoint.tx";
connectAttr "a_finalJoint.ry" "root_outJoint.ry";
connectAttr "a_finalJoint.rz" "root_outJoint.rz";
connectAttr "a_finalJoint.rx" "root_outJoint.rx";
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
connectAttr "middle_outJoint.s" "middle_volume_outJoint.is";
connectAttr "volume_blendColors.opg" "middle_volume_outJoint.sy";
connectAttr "volume_blendColors.opg" "middle_volume_outJoint.sz";
connectAttr "volume_blendColors.opr" "root_volume_outJoint.sy";
connectAttr "volume_blendColors.opr" "root_volume_outJoint.sz";
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
connectAttr "control.ikFk" "ikFk_reverse.ix";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultRenderGlobals.msg" "mtorPartition.inmsg";
connectAttr "multMatrix22.o" "decomposeMatrix25.imat";
connectAttr "composeMatrix1.omat" "multMatrix22.i[0]";
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
connectAttr "middleOffset.iog" "moduleControlSet.dsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "root_connector.wm" "root_connector_decomposeMatrix.imat";
connectAttr "middle_poserOrient.wm" "fk_end_group_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "fk_end_group_multMatrix.i[1]";
connectAttr "fk_end_group_multMatrix.o" "fk_end_group_decomposeMatrix.imat";
connectAttr "ik_connector.wm" "decomposeMatrix41.imat";
connectAttr "ik_end.wm" "decomposeMatrix43.imat";
connectAttr "multMatrix38.o" "decomposeMatrix44.imat";
connectAttr "multMatrix34.o" "decomposeMatrix45.imat";
connectAttr "root_poserOrient.wim" "multMatrix34.i[1]";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "ikFkSwitchSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "mirror_condition.ocg" "unitConversion431.i";
connectAttr "hyperLayout3.msg" "hyperView3.hl";
connectAttr "hyperLayout4.msg" "hyperView4.hl";
connectAttr "hyperLayout5.msg" "hyperView5.hl";
connectAttr "hyperLayout6.msg" "hyperView6.hl";
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
connectAttr "middleOffset.iog" "ikFkSwitchSet.dsm" -na;
connectAttr "end_fkJoint.wm" "decomposeMatrix42.imat";
connectAttr "addDoubleLinear1.o" "unitConversion1.i";
connectAttr "middle_poser.twist" "unitConversion432.i";
connectAttr "middle_poser_locShape.wp" "rootMiddle_vector.i3[0]";
connectAttr "decomposeMatrix50.ot" "rootMiddle_vector.i3[1]";
connectAttr "end_poser_locShape.wp" "rootEnd_vector.i3[0]";
connectAttr "decomposeMatrix50.ot" "rootEnd_vector.i3[1]";
connectAttr "rootMiddle_vector.o3" "cosAngle_bewtweenVectors.i1";
connectAttr "rootEnd_vector.o3" "cosAngle_bewtweenVectors.i2";
connectAttr "rootEnd_vectorNormalized.o" "rootEnd_vectorNormalized_projected.i1"
		;
connectAttr "cosAngle_bewtweenVectors.o" "rootEnd_vectorNormalized_projected.i2"
		;
connectAttr "middle_poser_locShape.wp" "rootMiddle_distance.p1";
connectAttr "decomposeMatrix50.ot" "rootMiddle_distance.p2";
connectAttr "rootEnd_vector.o3" "rootEnd_vectorNormalized.i1";
connectAttr "rootEnd_vectorNormalized_projected.o" "rootMiddle_projected.i1";
connectAttr "rootMiddle_distance.d" "rootMiddle_projected.i2x";
connectAttr "rootMiddle_distance.d" "rootMiddle_projected.i2y";
connectAttr "rootMiddle_distance.d" "rootMiddle_projected.i2z";
connectAttr "rootMiddle_projected.o" "rootMiddle_betweenPoint.i3[0]";
connectAttr "decomposeMatrix50.ot" "rootMiddle_betweenPoint.i3[1]";
connectAttr "middle_poser_locShape.wp" "frombetweenToMiddle_vector.i3[0]";
connectAttr "rootMiddle_betweenPoint.o3" "frombetweenToMiddle_vector.i3[1]";
connectAttr "multiplyDivide352.o" "middleOut_vector.i3[0]";
connectAttr "middle_poser_locShape.wp" "middleOut_vector.i3[1]";
connectAttr "frombetweenToMiddle_vector.o3" "middleOut_vectorNormalized.i1";
connectAttr "aimOffset_scaled.o" "multiplyDivide352.i1x";
connectAttr "aimOffset_scaled.o" "multiplyDivide352.i1y";
connectAttr "aimOffset_scaled.o" "multiplyDivide352.i1z";
connectAttr "middleOut_vectorNormalized.o" "multiplyDivide352.i2";
connectAttr "middleOut_vector.o3" "middleOut_matrix.it";
connectAttr "middleOut_matrix.omat" "ik_aim_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "ik_aim_multMatrix.i[1]";
connectAttr "mod.aim_offset" "aimOffset_scaled.i1";
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
connectAttr "decomposeMatrix45.or" "unitConversion435.i";
connectAttr "decomposeMatrix25.or" "unitConversion436.i";
connectAttr "blendColors2.op" "unitConversion437.i";
connectAttr "control_group_multMatrix.o" "control_group_decomposeMatrix.imat";
connectAttr "control_initLoc.wm" "control_group_multMatrix.i[0]";
connectAttr "root_poserOrient.wim" "control_group_multMatrix.i[1]";
connectAttr "mirror_condition.ocb" "multDoubleLinear437.i1";
connectAttr "multDoubleLinear437.o" "unitConversion440.i";
connectAttr "mirror_condition.ocg" "unitConversion443.i";
connectAttr "mirror_condition.ocb" "unitConversion444.i";
connectAttr "fk_end_group_decomposeMatrix.otx" "volume_mult.i1x";
connectAttr "fk_b_group_decomposeMatrix.otx" "volume_mult.i1y";
connectAttr "scale_to_translate_converter.ox" "volume_mult.i2x";
connectAttr "scale_to_translate_converter.oy" "volume_mult.i2y";
connectAttr "volume_mult.o" "volume_blendColors.c1";
connectAttr "control.stretchVolume" "volume_blendColors.b";
connectAttr "mirror_condition.ocg" "unitConversion445.i";
connectAttr "ik_aim_multMatrix.o" "ik_aim_decomposeMatrix.imat";
connectAttr "fk_end_group_decomposeMatrix.otx" "initScale1_mult.i1";
connectAttr "control.length1" "initScale1_mult.i2";
connectAttr "fk_b_group_decomposeMatrix.otx" "initScaleEnd_mult.i1";
connectAttr "control.length2" "initScaleEnd_mult.i2";
connectAttr "root_twist_angleLoc_2.m" "decomposeMatrix49.imat";
connectAttr "unitConversion446.o" "multiplyDivide353.i1";
connectAttr "decomposeMatrix49.or" "unitConversion446.i";
connectAttr "root_poser.twist" "addDoubleLinear1.i1";
connectAttr "multiplyDivide353.ox" "addDoubleLinear1.i2";
connectAttr "fk_b.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_end.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_a.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "ik_aim.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_root.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "ik_end.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "stretch_blend.opr" "ikfk_blend.c1r";
connectAttr "control.ikFk" "ikfk_blend.b";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "root_multMatrix.o" "root_decomposeMatrix.imat";
connectAttr "mirror_composeMatrix.omat" "root_multMatrix.i[0]";
connectAttr "mirror_condition.ocr" "mirror_composeMatrix.isx";
connectAttr "root_poser.size" "size_multiplyDivide.i1x";
connectAttr "mainPoser.size" "size_multiplyDivide.i1y";
connectAttr "multDoubleLinear438.o" "size_multiplyDivide.i1z";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2z";
connectAttr "size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "size_multiplyDivide.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "root_poser.wm" "decomposeMatrix50.imat";
connectAttr "size_multiplyDivide1.ox" "makeNurbSphere2.r";
connectAttr "middle_poser.size" "size_multiplyDivide1.i1x";
connectAttr "end_poser.size" "size_multiplyDivide1.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide1.i2y";
connectAttr "size_multiplyDivide1.oy" "makeNurbSphere3.r";
connectAttr "mainPoser.wm" "mainPoser_decomposeMatrix.imat";
connectAttr "mainPoser_decomposeMatrix.osx" "multDoubleLinear438.i1";
connectAttr "mainPoser.lineSize" "multDoubleLinear438.i2";
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "size_multiplyDivide.oz" "sweepMeshCreator1.scaleProfileX";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "middle_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "end_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "mirror_condition.ocr" "composeMatrix1.isx";
connectAttr "size_multiplyDivide.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "makeNurbSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "input.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "mainPoserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "ik_aim_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "multDoubleLinear437.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "a_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "end_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "unitConversion445.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "end_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "fk_b_ikFkSwitchHelper.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "mirror_composeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "end_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn";
connectAttr "world_composeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "middle_control_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "multMatrix39.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn";
connectAttr "ik_aim_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn";
connectAttr "unitConversion433.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn"
		;
connectAttr "unitConversion440.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "fk_end_ikFkSwitchHelper.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn"
		;
connectAttr "middle_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn";
connectAttr "middleOut_matrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn"
		;
connectAttr "root_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn";
connectAttr "multiplyDivide352.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn"
		;
connectAttr "unitConversion444.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "unitConversion434.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn"
		;
connectAttr "end_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn";
connectAttr "ik_aim_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn";
connectAttr "ik_aim_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn"
		;
connectAttr "ik_aim_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn"
		;
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn"
		;
connectAttr "multDoubleLinear435.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn"
		;
connectAttr "unitConversion431.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[30].dn"
		;
connectAttr "ik_end_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[31].dn";
connectAttr "ik_end_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[32].dn";
connectAttr "middle_control_orientConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[33].dn"
		;
connectAttr "aimOffset_scaled.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[34].dn"
		;
connectAttr "ik_end_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[35].dn";
connectAttr "ik_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[36].dn";
connectAttr "middleOffset_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[37].dn"
		;
connectAttr "decomposeMatrix46.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[38].dn"
		;
connectAttr "end_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[39].dn";
connectAttr "end_joint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[40].dn"
		;
connectAttr "middleOut_vector.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[41].dn"
		;
connectAttr "a_joint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[42].dn"
		;
connectAttr "fk_a_ikFkSwitchHelper.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[43].dn"
		;
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[44].dn"
		;
connectAttr "unitConversion443.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[45].dn"
		;
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[46].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[47].dn";
connectAttr "middle_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[48].dn"
		;
connectAttr "blendColors1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[49].dn";
connectAttr "joints.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[50].dn";
connectAttr "b_joint_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[51].dn"
		;
connectAttr "b_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[52].dn";
connectAttr "control_initLocShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "control_initLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "end_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn";
connectAttr "end_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn";
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
connectAttr "volume_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "volume_blendColors.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ik_aim_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "initScale1_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "initScaleEnd_mult.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix49.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide353.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_composeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear438.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
connectAttr "ikRPsolver1.msg" ":ikSystem.sol" -na;
// End of limb.ma
