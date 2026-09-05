//Maya ASCII 2026 scene
//Name: limbMll.ma
//Last modified: Sat, Sep 05, 2026 03:40:35 PM
//Codeset: 1251
requires maya "2026";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "pk_limbIk" "pk_rigNodes" "0.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2026";
fileInfo "version" "2026";
fileInfo "cutIdentifier" "202507081222-4d6919b75c";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "6D66532B-43A3-4FEB-8255-4792DE2B91B9";
createNode transform -s -n "persp";
	rename -uid "132DB877-4603-3BAA-DAE2-AC84DCF3F9D3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 11.240804063311598 8.215923395945314 21.371437481042427 ;
	setAttr ".r" -type "double3" -17.138352729607739 20.200000000001648 4.2362524338638789e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "1ED24824-4920-CF69-61C4-13AEFF1B91BF";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 25.779960346461301;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "E91AE6D9-4345-9398-8DC2-9DB78E7943D6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "647B7D48-41EB-F77B-137C-A4A22AE274E2";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "06A55C13-4E1C-ED69-F8D3-39BC5789C4C3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "66A9E976-4BCA-889A-0E2D-E38821E15B7A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "4BF1899C-49E6-74F1-CD32-BFBADE0AB2E1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "83C77238-4B15-8C54-810F-C798CC121F56";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "mod";
	rename -uid "AE4A88B5-4260-E2B6-CBE4-AAB87A8AA2E0";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "aim_offset" -ln "aim_offset" -at "double";
	addAttr -ci true -sn "ikSymmetryBehaviour" -ln "ikSymmetryBehaviour" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr ".aim_offset" 3.12;
	setAttr -l on ".moduleType" -type "string" "limb";
createNode transform -n "posers" -p "mod";
	rename -uid "B363BF37-4F11-5639-7C9F-49B22F349487";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "2855DB10-4B1F-60E9-28E0-C594DD197799";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 0.1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineSize";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "92B52F3F-46DD-80D7-31BD-F68D965C2300";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "9D940BDD-494A-D1EE-7DCD-16B3FAF4A7A4";
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
	setAttr -k on ".size" 0.5;
	setAttr -k on ".twist";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "A571FFE6-441C-7E12-9B3D-1490CD86F206";
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
	rename -uid "0BF74514-4579-24BE-CBE1-7B8C3E4D27FB";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "root_poserOrient_locShape" -p "root_poserOrient";
	rename -uid "B99C03CF-42C0-C523-E53E-F38296A36CA3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "rootMiddle_orient_locator_aimConstraint1" -p "root_poserOrient";
	rename -uid "0A22D321-4E3B-995E-C0EC-02A6916A2F45";
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
	rename -uid "A69A4C19-4DD6-1E90-CB07-32B1AC35C8BB";
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
	rename -uid "A904C926-4616-FAC3-D2BC-2CB1A5B0BC4E";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "2074094D-4EA1-6029-EB3E-E4953305A00B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_initLoc_aimConstraint1" -p "root_initLoc";
	rename -uid "3C612EEE-46F2-D53D-4070-5890EDC0FBC9";
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
	rename -uid "CA8851B3-488A-AC63-74B4-D69C16C8D1EC";
createNode locator -n "ik_aim_initLocShape" -p "ik_aim_initLoc";
	rename -uid "17A859B1-4782-A75D-C1FF-56A4563B56CB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_end_initLoc" -p "root_poserOrient";
	rename -uid "A06BD2FA-4677-18FB-A9BC-E1A3F505F194";
createNode locator -n "ik_end_initLocShape" -p "ik_end_initLoc";
	rename -uid "DAE8D898-491B-8310-F392-97AC6ED5C453";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_root_initLoc" -p "root_poserOrient";
	rename -uid "00DE0FC9-4368-0F0E-473E-BAAD0BCC87A3";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "ik_root_initLocShape" -p "ik_root_initLoc";
	rename -uid "55ED229E-469F-1597-CA88-BF9D18BCF9BA";
	setAttr -k off ".v";
createNode transform -n "fk_a_initLoc" -p "root_poserOrient";
	rename -uid "33B7A3F8-4250-30E2-1FFF-5E8E1B5980B0";
	setAttr ".v" no;
createNode locator -n "fk_a_initLocShape" -p "fk_a_initLoc";
	rename -uid "2625A001-482D-3AB6-DEFA-7AAC2E12CC2E";
	setAttr -k off ".v";
createNode aimConstraint -n "root_poser_aimConstraint1" -p "root_poser";
	rename -uid "E57CBA54-4A21-55D9-1313-5F9B303D2912";
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
	rename -uid "44A83BDD-4AF7-EC94-3D16-D583345D9ED4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode transform -n "middle_poser" -p "mainPoser";
	rename -uid "63A9C48B-4E69-9FC1-65C0-E18FB4491F55";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 5 0 -1 ;
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
	rename -uid "E9745872-4C72-B049-6A12-118214D8DE3D";
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
	rename -uid "9818C290-4AF3-E1B9-D595-AABA7E992B35";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middle_poserOrient" -p "middle_poser";
	rename -uid "66B0451D-4151-0AD0-722B-F7A0B50ABA10";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".t";
	setAttr -k on ".r";
createNode locator -n "middle_poserOrient_locShape" -p "middle_poserOrient";
	rename -uid "0DBC302D-4D6C-03B5-1391-0BA599835BE3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode aimConstraint -n "middleEnd_orient_locator_aimConstraint1" -p "middle_poserOrient";
	rename -uid "C7597683-4AF0-DE7E-A3D3-2182DA99A301";
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
	rename -uid "ACAD69F0-4C06-5322-C34B-869D91EBC6FB";
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
	rename -uid "712B29C4-4434-E4D0-7B12-49A1B9A5DA0F";
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
	rename -uid "971ED129-4B97-FD6F-6D75-9B898890243E";
createNode locator -n "middle_initLocShape" -p "middle_initLoc";
	rename -uid "5C2F6E1A-4AC0-C0F9-3C65-FB9F06E3C7C8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middle_up_loc" -p "middle_poserOrient";
	rename -uid "50B4FBFF-414E-CBCE-D8BA-F4B614224B21";
	setAttr ".t" -type "double3" 2.2204460492503114e-16 0.67310697141714793 -1.1102230246251557e-16 ;
createNode locator -n "middle_up_locShape" -p "middle_up_loc";
	rename -uid "B6D23F0F-45AF-801A-4FFA-42B062AC11D0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_b_initLoc" -p "middle_poserOrient";
	rename -uid "A069AF26-46B9-3104-9223-F5910943E779";
createNode locator -n "fk_b_initLocShape" -p "fk_b_initLoc";
	rename -uid "9D14918A-4A90-BC95-FE72-AD8D0AF6A99D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "middleOffset_initLoc" -p "middle_poser";
	rename -uid "260E9915-4AF5-8D74-7B0D-77AB91D62CE4";
	setAttr ".v" no;
createNode locator -n "middleOffset_initLocShape" -p "middleOffset_initLoc";
	rename -uid "618169F1-4B19-6710-D616-6496886063CD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode orientConstraint -n "middleRoot_orient_locator_orientConstraint1" -p "middleOffset_initLoc";
	rename -uid "6A57FB9B-47B8-526C-17A6-1EB7FDAB41A2";
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
	rename -uid "7C833DF9-4545-0CAF-AB00-33A57E3A03DF";
	setAttr ".v" no;
createNode locator -n "root_twist_angleLoc_1Shape" -p "root_twist_angleLoc_1";
	rename -uid "7C0344CE-4FD0-0566-25B8-D8AEA9C8CE60";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_twist_angleLoc_2" -p "root_twist_angleLoc_1";
	rename -uid "44C6D99F-4D15-03DF-0519-D09CF0B5DF4D";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 -2.7755575615628914e-17 0 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
createNode locator -n "root_twist_angleLoc_2Shape" -p "root_twist_angleLoc_2";
	rename -uid "7CFCEF80-4851-9ED1-4CD4-EE8E5EC4E8F5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "root_twist_angleLoc_2_aimConstraint1" -p "root_twist_angleLoc_2";
	rename -uid "E3110BB3-4728-9611-8177-62914040014D";
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
	rename -uid "323D6B12-429A-8812-066A-2DA60839713E";
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
	rename -uid "74B0649F-467E-3D50-D303-75A8C0A4AEC8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "worldOrient" -ln "worldOrient" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 10 0 0 ;
	setAttr -k on ".t";
	setAttr -k on ".r" -type "double3" 5.8093972367073725 -1.2470080327445749 -1.4097312499502175 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on -k on ".worldOrient";
createNode nurbsSurface -n "end_poserShape" -p "end_poser";
	rename -uid "12E70E67-4295-F8FE-B1D6-788FD481C5E4";
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
	rename -uid "CA35EC44-40BD-8A92-559C-FA8F1CB8A97A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middle_line_endOrient_locator" -p "end_poser";
	rename -uid "A2AC03DC-434F-7475-25F3-7FADC01BA053";
createNode locator -n "middle_line_endOrient_locatorShape" -p "middle_line_endOrient_locator";
	rename -uid "4CD6086F-4BED-B9D1-0F80-8BA1B30BB658";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode orientConstraint -n "middle_line_endOrient_locator_orientConstraint1" 
		-p "middle_line_endOrient_locator";
	rename -uid "4B3D32A2-485E-04CC-BD0D-298DCD2CE1DF";
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
	setAttr ".lr" -type "double3" -5.8640303099820628 -9.8690431729930648 2.4250893574893908 ;
	setAttr ".rsrr" -type "double3" 0 3.1805546814635168e-15 0 ;
	setAttr -k on ".w0";
createNode transform -n "end_initLoc" -p "end_poser";
	rename -uid "1BCA45F1-4147-2CCC-B426-4FB77A530940";
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "B5E53AFB-4708-708C-8E85-6597209A3A04";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_initLoc" -p "end_initLoc";
	rename -uid "A501CE23-41AE-F3D1-B04A-388A5F95F4DC";
createNode locator -n "fk_end_initLocShape" -p "fk_end_initLoc";
	rename -uid "DBE6C180-4446-EEE6-D44C-748B694C529D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "0106F621-4A72-837C-E601-E8B5D2111E53";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "CEF8BFD5-4405-5317-029A-BDB3FB98FD8B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "end_initJoint" -p "end_poserOrient";
	rename -uid "045AADE7-445E-DD54-E941-2B86E8253AC2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "control_initLoc" -p "mainPoser";
	rename -uid "50C3375F-4830-05E5-00C0-BF9CA74D9280";
createNode locator -n "control_initLocShape" -p "control_initLoc";
	rename -uid "1226D7CD-40E7-8D2B-C570-88AB14FBD9A0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "B2212CDA-4109-9419-157D-79894D9288FF";
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
	rename -uid "EB1DE19C-4C4C-E64D-F80A-79A63A92FD98";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "AB463DE0-4063-DFE6-3801-DD9E02058A54";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "posers_curve" -p "posers";
	rename -uid "858D65F8-4E5C-AC05-7A3B-9F8FF2637303";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "049FE9EE-4BC8-B719-F4CC-B1BEADF161CE";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		0 0 0
		5 0 -1
		10 0 0
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "642EB932-4F46-2E13-1A35-A189B15010F8";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "22C13C97-4414-78D6-F345-9593AA27B68A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "input" -p "mod";
	rename -uid "1C291EB3-41D8-8F3D-9FF3-09878161D50E";
	setAttr ".v" no;
createNode transform -n "ik_connector_main" -p "input";
	rename -uid "D590F231-4C51-19AA-9BF3-A4A0F8213F06";
createNode transform -n "ik_connector" -p "ik_connector_main";
	rename -uid "B0B184D0-48A8-C4DF-BC4E-7CB268AA7ED9";
createNode locator -n "ik_connectorShape" -p "ik_connector";
	rename -uid "8553089B-46A7-1947-90F8-3C98F4C3E21B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "root_connector_init" -p "input";
	rename -uid "F77D4832-4B24-CA11-9B6D-FFACB0AC2D64";
createNode transform -n "root_connector" -p "root_connector_init";
	rename -uid "60604536-496C-3714-393A-58841844A7D8";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "043DFB39-4A3A-C23D-6C18-4DAAAA9BF2AD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "controls" -p "mod";
	rename -uid "E52C01CE-4468-2B8D-E38B-B5A6FBBC9BAC";
createNode transform -n "control_group" -p "controls";
	rename -uid "BB44FFC4-491D-7D34-FF8D-7BA37108AC95";
createNode transform -n "control" -p "control_group";
	rename -uid "6035519F-4C86-7D8A-36D2-3B8FEA3B2244";
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
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
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
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"limb_control\", d= 1,p= [[0.5818591215699079, 1.1068268678884885, 0.0], [0.5818591215699079, 2.0658246068668, 0.0], [1.2211909475554523, 1.746158693874035, 0.0], [0.5818591215699079, 1.4264927808812633, 0.0]])']";
createNode nurbsCurve -n "controlShape" -p "control";
	rename -uid "29D6588E-4DD5-FC6D-9CE5-60AA2496A8B4";
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
	rename -uid "9780EABA-4938-0608-BD05-6B95E00C5A62";
createNode transform -n "fk_a_group" -p "fk_controls";
	rename -uid "B3AAF294-4ACB-1683-715E-CDBBF5056BF9";
	setAttr ".t" -type "double3" 1.1102230246251563e-16 0 -5.5511151231257827e-17 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999967 ;
createNode transform -n "fk_a" -p "fk_a_group";
	rename -uid "0831C03A-4448-B41B-29DC-97BE46C5EF5B";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 1;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_a";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"limb_fk_a\", per = True, d= 3,p= [[-7.250991605214221e-17, 0.5117855771143788, -0.5117855771143777], [-1.740280630679319e-16, -1.0123927783628311e-16, -0.7237741041820949], [-7.250991605214221e-17, -0.5117855771143784, -0.5117855771143784], [-1.4501983210428441e-16, -0.7237741041820949, -6.135664018060113e-17], [-7.250991605214221e-17, -0.5117855771143784, 0.5117855771143783], [-8.539129906869757e-17, -2.367525695957893e-16, 0.7237741041820949], [-7.250991605214221e-17, 0.5117855771143783, 0.5117855771143784], [1.4501983210428441e-16, 0.7237741041820949, 5.371154710602596e-16], [-7.250991605214221e-17, 0.5117855771143788, -0.5117855771143777], [-1.740280630679319e-16, -1.0123927783628311e-16, -0.7237741041820949], [-7.250991605214221e-17, -0.5117855771143784, -0.5117855771143784]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
createNode joint -n "a_fkJoint" -p "fk_a";
	rename -uid "4C4952E2-4324-EFBF-94F5-1BBEDDF34361";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_b_group" -p "fk_a";
	rename -uid "573074AC-40D7-5AD2-FFB9-5D9A4C2127D3";
	setAttr ".t" -type "double3" 5.0990195135927854 0 1.6653345369377348e-16 ;
createNode transform -n "fk_b" -p "fk_b_group";
	rename -uid "C1D7AB23-49C9-F1F2-9F04-7F872782F33E";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "autoTwist" -ln "autoTwist" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k on ".r";
	setAttr ".ro" 1;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mirrored" yes;
	setAttr -l on ".internalName" -type "string" "fk_b";
	setAttr -k on ".autoTwist";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"limb_fk_b\", per = True, d= 3,p= [[-2.5843297762501556e-15, 0.5172757221244865, -0.5172757221244856], [-2.4779675731025276e-15, -4.8332623316982456e-17, -0.7315383417147835], [-2.437754253748959e-15, -0.5172757221244854, -0.517275722124486], [-2.7309052987513504e-15, -0.7315383417147835, -1.488784944019925e-15], [-2.3644664924983645e-15, -0.5172757221244856, 0.5172757221244855], [-2.3883799642390703e-15, -1.8529962470768117e-16, 0.7315383417147835], [-2.6576175375007506e-15, 0.5172757221244856, 0.5172757221244856], [-2.437754253748959e-15, 0.7315383417147835, -8.838927638632052e-16], [-2.5843297762501556e-15, 0.5172757221244865, -0.5172757221244856], [-2.4779675731025276e-15, -4.8332623316982456e-17, -0.7315383417147835], [-2.437754253748959e-15, -0.5172757221244854, -0.517275722124486]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
createNode joint -n "b_fkJoint" -p "fk_b";
	rename -uid "D26C55F3-411E-A2B6-EFF6-0BBC128B2AE0";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".is" -type "double3" 1.0000303983688354 1 1 ;
createNode transform -n "fk_end_group" -p "fk_b";
	rename -uid "74CD5D8F-4B96-545A-18CD-A796520F2DA6";
	setAttr ".s" -type "double3" 0.99999191367389451 1.0000000000000009 1.0000179037244814 ;
	setAttr ".sh" -type "double3" 0 1.5136983945333165e-05 0 ;
createNode transform -n "fk_end" -p "fk_end_group";
	rename -uid "512B1EC4-49A5-1444-FEBB-D98051417C7B";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
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
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"limb_fk_end\", per = True, d= 3,p= [[4.0317302211702216e-06, 0.4144670440142865, -0.4144624978742321], [3.0718669302493375e-07, 0.5861449148016921, -1.4486799719582477e-05], [-3.5973026345556048e-06, 0.4144670440142873, 0.41444201044559326], [-5.394540867632043e-06, 5.660731881344029e-16, 0.5861239987890466], [-4.031730224281038e-06, -0.41446704401428713, 0.41446249787423184], [-3.0718669607702083e-07, -0.5861449148016921, 1.4486799719825938e-05], [3.597302631342034e-06, -0.4144670440142873, -0.41444201044559276], [5.394540864462515e-06, 8.134010257625504e-17, -0.5861239987890466], [4.0317302211702216e-06, 0.4144670440142865, -0.4144624978742321], [3.0718669302493375e-07, 0.5861449148016921, -1.4486799719582477e-05], [-3.5973026345556048e-06, 0.4144670440142873, 0.41444201044559326]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
createNode joint -n "end_fkJoint" -p "fk_end";
	rename -uid "EB45AABD-4F82-45A4-0D21-698A16472385";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0 0 -4.4406888105932846e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode nurbsCurve -n "fk_endShape" -p "fk_end";
	rename -uid "CD1B7954-41C5-484B-85E9-B7A22398DC31";
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
createNode nurbsCurve -n "fk_bShape" -p "fk_b";
	rename -uid "3514664D-4682-AB2D-0586-23BA3336F39C";
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
createNode nurbsCurve -n "fk_aShape" -p "fk_a";
	rename -uid "061A21B7-4BAC-C7D7-E7E2-E79350A919EA";
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
createNode transform -n "ik_controls" -p "controls";
	rename -uid "F702EE54-412C-8637-1A61-1990066A6DEA";
createNode transform -n "ik_aim_init" -p "ik_controls";
	rename -uid "02A9C76C-4CE0-16B0-A613-0C9E873E18E5";
createNode transform -n "ik_aim_mirror" -p "ik_aim_init";
	rename -uid "66A97B86-463A-D4C6-9E76-22B05E4204CB";
createNode transform -n "ik_aim_PH" -p "ik_aim_mirror";
	rename -uid "77DF6192-4EE1-72B2-0477-509C892C2863";
	setAttr -l on ".rz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
createNode transform -n "ik_aim_SN" -p "ik_aim_PH";
	rename -uid "CF631C8E-45BF-36DE-AC99-27B2DD69A6C4";
createNode transform -n "ik_aim" -p "ik_aim_SN";
	rename -uid "82CFA343-42F5-8587-E78A-C18C503788DD";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_aim";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"limb_ik_aim\", per = True, d= 3,p= [[0.3026806543549422, -1.3367368059906392e-16, -0.30268065435494107], [-4.883596709313957e-17, -1.2599671075064575e-16, -0.4280550864567219], [-0.3026806543549411, -1.3367368059906392e-16, -0.3026806543549411], [-0.4280550864567219, -1.5220752532504428e-16, -2.6289969388227922e-17], [-0.3026806543549419, -1.707413700510245e-16, 0.3026806543549411], [-1.2898135152313614e-16, -1.7841833989944245e-16, 0.4280550864567219], [0.30268065435494107, -1.707413700510245e-16, 0.3026806543549411], [0.4280550864567219, -1.5220752532504428e-16, 3.276589075319272e-16], [0.3026806543549422, -1.3367368059906392e-16, -0.30268065435494107], [-4.883596709313957e-17, -1.2599671075064575e-16, -0.4280550864567219], [-0.3026806543549411, -1.3367368059906392e-16, -0.3026806543549411]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', 'cmds.curve(name = \"limb_ik_aim\", per = True, d= 3,p= [[0.3026806543549422, 0.3026806543549411, 4.9074923985498636e-17], [-4.883596709313957e-17, 0.4280550864567219, 2.891317759017665e-17], [-0.3026806543549411, 0.3026806543549419, 4.90749239854985e-17], [-0.4280550864567219, -2.816787036260502e-17, 9.77496855742111e-17], [-0.3026806543549419, -0.3026806543549411, 1.4642444716292376e-16], [-1.2898135152313614e-16, -0.4280550864567219, 1.6658619355824584e-16], [0.30268065435494107, -0.3026806543549419, 1.4642444716292384e-16], [0.4280550864567219, -3.821167472827596e-16, 9.774968557421117e-17], [0.3026806543549422, 0.3026806543549411, 4.9074923985498636e-17], [-4.883596709313957e-17, 0.4280550864567219, 2.891317759017665e-17], [-0.3026806543549411, 0.3026806543549419, 4.90749239854985e-17]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])', 'cmds.curve(name = \"limb_ik_aim\", per = True, d= 3,p= [[4.867476158871274e-17, 0.30268065435494246, -0.30268065435494107], [-2.6210814574398448e-17, -2.0104349241818378e-16, -0.4280550864567219], [-8.574245104067332e-17, -0.3026806543549419, -0.3026806543549411], [-9.504732255843294e-17, -0.4280550864567219, -2.6289969388227922e-17], [-4.867476158871271e-17, -0.3026806543549419, 0.3026806543549411], [2.6210814574398383e-17, -2.8118887684818065e-16, 0.4280550864567219], [8.574245104067332e-17, 0.3026806543549411, 0.3026806543549411], [9.504732255843294e-17, 0.4280550864567219, 3.276589075319272e-16], [4.867476158871274e-17, 0.30268065435494246, -0.30268065435494107], [-2.6210814574398448e-17, -2.0104349241818378e-16, -0.4280550864567219], [-8.574245104067332e-17, -0.3026806543549419, -0.3026806543549411]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']");
createNode transform -n "curveEnd_locator" -p "ik_aim";
	rename -uid "80EFEDD7-41CD-A6C5-A8CF-DBB63901BA1E";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687562 0 ;
createNode locator -n "curveEnd_locatorShape" -p "curveEnd_locator";
	rename -uid "AF3E26FA-4936-D028-9C97-E9851190A214";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode nurbsCurve -n "ik_aimShape" -p "ik_aim";
	rename -uid "37005758-43E3-CC3C-1CAA-01BCB50725BF";
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
	rename -uid "7FDC6A35-4903-E8B4-0A55-22B475E0BBE5";
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
	rename -uid "E105FFDF-439B-984F-5262-2DB505A30C2A";
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
createNode transform -n "ik_end_init" -p "ik_controls";
	rename -uid "5605B3EF-4FAC-126E-40C6-74A4750AEE18";
createNode transform -n "ik_end_mirror" -p "ik_end_init";
	rename -uid "D3029BD7-4428-01BE-2990-08A20B2AD494";
createNode transform -n "ik_end_PH" -p "ik_end_mirror";
	rename -uid "2654DA26-4BC4-08ED-A14E-98984C3C44F7";
createNode transform -n "ik_end_SN" -p "ik_end_PH";
	rename -uid "2B51FCF8-4878-79AB-83CD-C9BC86FF60C8";
createNode transform -n "ik_end" -p "ik_end_SN";
	rename -uid "FCE8DEC2-4400-B7CB-67A9-D2882FF5AB2B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "dynamicParentRevMultMatrixX" -ln "dynamicParentRevMultMatrixX" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_end";
	setAttr -l on ".mirrorShape" yes;
	setAttr ".dynamicParentRevMultMatrixX" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"limb_ik_end\", d= 1,p= [[-0.5947657794549447, 0.5950107783728962, 0.5950101424136339], [-0.5947657794549447, 0.5950099606653602, -0.5950101424136339], [0.5947657794549405, 0.5950099606653602, -0.5950101424136339], [0.5947657794549405, 0.5950099606653602, 0.5950101424136339], [-0.5947657794549447, 0.5950099606653602, 0.5950101424136339], [0.5947657794549405, 0.5950099606653602, 0.5950101424136339], [0.5947657794549405, -0.595010324161907, 0.5950101424136339], [-0.5947657794549447, -0.595010324161907, 0.5950101424136339], [-0.5947657794549447, 0.5950099606653602, 0.5950101424136339], [-0.5947657794549447, -0.595010324161907, 0.5950101424136339], [-0.5947657794549447, -0.595010324161907, -0.5950101424136339], [-0.5947657794549447, 0.5950099606653602, -0.5950101424136339], [-0.5947657794549447, -0.595010324161907, -0.5950101424136339], [0.5947657794549405, -0.595010324161907, -0.5950101424136339], [0.5947657794549405, 0.5950099606653602, -0.5950101424136339], [0.5947657794549405, -0.595010324161907, -0.5950101424136339], [0.5947657794549405, -0.595010324161907, 0.5950101424136339]])']");
createNode transform -n "ik_end_out_rot" -p "ik_end";
	rename -uid "27F0BDFC-4808-3D9E-F4C5-AD969A7EC26A";
	setAttr ".v" no;
createNode transform -n "ik_end_out_init" -p "ik_end";
	rename -uid "2AF71C03-4A7D-3E17-AE1E-F697696444E7";
	setAttr ".r" -type "double3" 0 -3.1528956873981994e-07 0 ;
createNode transform -n "ik_end_out" -p "ik_end_out_init";
	rename -uid "54A40557-4417-B0B5-33DF-2DB6807DE407";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 0 -3.4346083563738136e-26 ;
createNode locator -n "ik_end_outShape" -p "ik_end_out";
	rename -uid "9721E49B-4F1D-3D1C-CDF6-55BCBD431307";
	setAttr -k off ".v";
createNode nurbsCurve -n "ik_endShape" -p "ik_end";
	rename -uid "551E410A-44B5-C7E5-B2CD-23AC8CCB0B5D";
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
createNode transform -n "ik_root_group" -p "ik_controls";
	rename -uid "5E01CFF9-4433-22A2-4802-868A57675D8B";
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode transform -n "ik_root" -p "ik_root_group";
	rename -uid "BF605700-465B-5B39-31CE-2BA2CE918B5D";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "mirrorShape" -ln "mirrorShape" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "ik_root";
	setAttr -l on ".mirrorShape" yes;
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"limb_ik_root\", d= 1,p= [[-0.6249111593863255, 0.6249111593863237, 0.6249111593863237], [-0.6249111593863255, 0.6249111593863237, -0.6249111593863237], [0.6249111593863236, 0.6249111593863237, -0.6249111593863237], [0.6249111593863236, 0.6249111593863237, 0.6249111593863237], [-0.6249111593863255, 0.6249111593863237, 0.6249111593863237], [0.6249111593863236, 0.6249111593863237, 0.6249111593863237], [0.6249111593863236, -0.6249111593863237, 0.6249111593863237], [-0.6249111593863255, -0.6249111593863237, 0.6249111593863237], [-0.6249111593863255, 0.6249111593863237, 0.6249111593863237], [-0.6249111593863255, -0.6249111593863237, 0.6249111593863237], [-0.6249111593863255, -0.6249111593863237, -0.6249111593863237], [-0.6249111593863255, 0.6249111593863237, -0.6249111593863237], [-0.6249111593863255, -0.6249111593863237, -0.6249111593863237], [0.6249111593863236, -0.6249111593863237, -0.6249111593863237], [0.6249111593863236, 0.6249111593863237, -0.6249111593863237], [0.6249111593863236, -0.6249111593863237, -0.6249111593863237], [0.6249111593863236, -0.6249111593863237, 0.6249111593863237]])']");
createNode transform -n "snap_root_loc" -p "ik_root";
	rename -uid "BA7A39BC-4744-D6B6-1484-D1BC167EB75B";
	setAttr ".v" no;
	setAttr ".sh" -type "double3" 0.0019699791094384997 -0.0050284108131751857 0.00029646444186807758 ;
createNode locator -n "snap_root_locShape" -p "snap_root_loc";
	rename -uid "5F234521-4F42-940E-4F69-9F89770551FA";
	setAttr -k off ".v";
createNode nurbsCurve -n "ik_rootShape" -p "ik_root";
	rename -uid "4E4E0488-42FC-47FC-5ECE-D0BF09309929";
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
createNode transform -n "aim_curve" -p "ik_controls";
	rename -uid "6685B7B3-41D4-BE8F-E12A-66823969DCD5";
	setAttr ".tmp" yes;
	setAttr ".it" no;
createNode nurbsCurve -n "aim_curveShape" -p "aim_curve";
	rename -uid "FDADF2A8-4E1E-782E-EAE2-62B739B8C64E";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		5 0 -1.0000000000000044
		5.0000000000000009 0 -4.119999885559082
		;
createNode transform -n "middleOffset_group" -p "controls";
	rename -uid "CDAEBD2C-4CCD-EDCA-7E0B-809E6692B220";
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
createNode transform -n "middleOffset" -p "middleOffset_group";
	rename -uid "45AE02A1-4E1C-A9EF-3334-8F9CE5E72482";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "middleOffset";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"limb_middleOffset\", d= 1,p= [[-4.512478597197408e-16, 0.4932924329692415, 0.0], [-4.512478597197408e-16, 0.45574301297162356, 0.18877462812596854], [-4.512478597197408e-16, 0.3488105323995812, 0.3488105323995812], [-4.512478597197408e-16, 0.18877462812596854, 0.45574301297162356], [-4.512478597197408e-16, 0.0, 0.4932924329692415], [-4.512478597197408e-16, -0.18877462812596854, 0.45574301297162356], [-4.512478597197408e-16, -0.3488105323995812, 0.3488105323995812], [-4.512478597197408e-16, -0.45574301297162356, 0.18877462812596854], [-4.512478597197408e-16, -0.4932924329692415, 0.0], [-4.512478597197408e-16, -0.45574301297162356, -0.18877462812596854], [-4.512478597197408e-16, -0.3488105323995812, -0.3488105323995812], [-4.512478597197408e-16, -0.18877462812596854, -0.45574301297162356], [-4.512478597197408e-16, 0.0, -0.4932924329692415], [-4.512478597197408e-16, 0.18877462812596854, -0.45574301297162356], [-4.512478597197408e-16, 0.3488105323995812, -0.3488105323995812], [-4.512478597197408e-16, 0.45574301297162356, -0.18877462812596854], [-4.512478597197408e-16, 0.4932924329692415, 0.0], [0.18877462812596854, 0.45574301297162356, 0.0], [0.3488105323995812, 0.3488105323995812, 0.0], [0.45574301297162356, 0.18877462812596854, 0.0], [0.4932924329692415, 0.0, 0.0], [0.45574301297162356, -0.18877462812596854, 0.0], [0.3488105323995812, -0.3488105323995812, 0.0], [0.18877462812596854, -0.45574301297162356, 0.0], [-4.512478597197408e-16, -0.4932924329692415, 0.0], [-0.18877462812596854, -0.45574301297162356, 0.0], [-0.3488105323995812, -0.3488105323995812, 0.0], [-0.45574301297162356, -0.18877462812596854, 0.0], [-0.4932924329692415, 0.0, 0.0], [-0.45574301297162356, 0.18877462812596854, 0.0], [-0.3488105323995812, 0.3488105323995812, 0.0], [-0.18877462812596854, 0.45574301297162356, 0.0], [-4.512478597197408e-16, 0.4932924329692415, 0.0], [-4.512478597197408e-16, 0.45574301297162356, -0.18877462812596854], [-4.512478597197408e-16, 0.3488105323995812, -0.3488105323995812], [-4.512478597197408e-16, 0.18877462812596854, -0.45574301297162356], [-4.512478597197408e-16, 0.0, -0.4932924329692415], [-0.18877462812596854, 0.0, -0.45574301297162356], [-0.3488105323995812, 0.0, -0.3488105323995812], [-0.45574301297162356, 0.0, -0.18877462812596854], [-0.4932924329692415, 0.0, 0.0], [-0.45574301297162356, 0.0, 0.18877462812596854], [-0.3488105323995812, 0.0, 0.3488105323995812], [-0.18877462812596854, 0.0, 0.45574301297162356], [-4.512478597197408e-16, 0.0, 0.4932924329692415], [0.18877462812596854, 0.0, 0.45574301297162356], [0.3488105323995812, 0.0, 0.3488105323995812], [0.45574301297162356, 0.0, 0.18877462812596854], [0.4932924329692415, 0.0, 0.0], [0.45574301297162356, 0.0, -0.18877462812596854], [0.3488105323995812, 0.0, -0.3488105323995812], [0.18877462812596854, 0.0, -0.45574301297162356], [-4.512478597197408e-16, 0.0, -0.4932924329692415]])']");
createNode nurbsCurve -n "middleOffsetShape" -p "middleOffset";
	rename -uid "198972FD-4F54-822A-6517-549DAC8A7736";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 52 0 no 3
		53 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
		53
		-4.5124785971974077e-16 0.49329243296924152 0
		-4.5124785971974077e-16 0.45574301297162356 0.18877462812596854
		-4.5124785971974077e-16 0.34881053239958121 0.34881053239958121
		-4.5124785971974077e-16 0.18877462812596854 0.45574301297162356
		-4.5124785971974077e-16 0 0.49329243296924152
		-4.5124785971974077e-16 -0.18877462812596854 0.45574301297162356
		-4.5124785971974077e-16 -0.34881053239958121 0.34881053239958121
		-4.5124785971974077e-16 -0.45574301297162356 0.18877462812596854
		-4.5124785971974077e-16 -0.49329243296924152 0
		-4.5124785971974077e-16 -0.45574301297162356 -0.18877462812596854
		-4.5124785971974077e-16 -0.34881053239958121 -0.34881053239958121
		-4.5124785971974077e-16 -0.18877462812596854 -0.45574301297162356
		-4.5124785971974077e-16 0 -0.49329243296924152
		-4.5124785971974077e-16 0.18877462812596854 -0.45574301297162356
		-4.5124785971974077e-16 0.34881053239958121 -0.34881053239958121
		-4.5124785971974077e-16 0.45574301297162356 -0.18877462812596854
		-4.5124785971974077e-16 0.49329243296924152 0
		0.18877462812596854 0.45574301297162356 0
		0.34881053239958121 0.34881053239958121 0
		0.45574301297162356 0.18877462812596854 0
		0.49329243296924152 0 0
		0.45574301297162356 -0.18877462812596854 0
		0.34881053239958121 -0.34881053239958121 0
		0.18877462812596854 -0.45574301297162356 0
		-4.5124785971974077e-16 -0.49329243296924152 0
		-0.18877462812596854 -0.45574301297162356 0
		-0.34881053239958121 -0.34881053239958121 0
		-0.45574301297162356 -0.18877462812596854 0
		-0.49329243296924152 0 0
		-0.45574301297162356 0.18877462812596854 0
		-0.34881053239958121 0.34881053239958121 0
		-0.18877462812596854 0.45574301297162356 0
		-4.5124785971974077e-16 0.49329243296924152 0
		-4.5124785971974077e-16 0.45574301297162356 -0.18877462812596854
		-4.5124785971974077e-16 0.34881053239958121 -0.34881053239958121
		-4.5124785971974077e-16 0.18877462812596854 -0.45574301297162356
		-4.5124785971974077e-16 0 -0.49329243296924152
		-0.18877462812596854 0 -0.45574301297162356
		-0.34881053239958121 0 -0.34881053239958121
		-0.45574301297162356 0 -0.18877462812596854
		-0.49329243296924152 0 0
		-0.45574301297162356 0 0.18877462812596854
		-0.34881053239958121 0 0.34881053239958121
		-0.18877462812596854 0 0.45574301297162356
		-4.5124785971974077e-16 0 0.49329243296924152
		0.18877462812596854 0 0.45574301297162356
		0.34881053239958121 0 0.34881053239958121
		0.45574301297162356 0 0.18877462812596854
		0.49329243296924152 0 0
		0.45574301297162356 0 -0.18877462812596854
		0.34881053239958121 0 -0.34881053239958121
		0.18877462812596854 0 -0.45574301297162356
		-4.5124785971974077e-16 0 -0.49329243296924152
		;
createNode transform -n "system" -p "mod";
	rename -uid "CECF9521-4C87-387B-DF87-8C8021520EE1";
	setAttr ".v" no;
createNode transform -n "ik_joints" -p "system";
	rename -uid "399A0895-40E5-96AE-8954-F49E351C73EC";
createNode transform -n "joints" -p "system";
	rename -uid "FCA22C5B-4403-FCCF-2EFD-37B2A34746DD";
createNode joint -n "a_finalJoint" -p "joints";
	rename -uid "EDA916D5-4908-BD39-D8EB-0BAA42E945DC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.09961607666187984 0.0055378625360235382 -0.0067800699868501638 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 0.0070934636314600244 -0.0056734465564594666 0.099586619472096516 0
		 0.32123309041702086 2.3902817968656178 -0.054956858176564261 1;
createNode joint -n "b_finalJoint" -p "a_finalJoint";
	rename -uid "B11113C6-4D28-C0A4-2EE1-B2BEAB1D63E1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.099691102795354883 0.0047514142680777855 0.0062536458085739538 0
		 -0.0051303064434430621 0.099685224997002969 0.0060444911360065237 0 -0.005946762080523681 -0.0063466510657197535 0.099621062235892885 0
		 0.8016236508328034 2.4169876959165881 -0.087653203282550218 1;
createNode joint -n "end_finalJoint" -p "b_finalJoint";
	rename -uid "596358E8-4D2F-5B36-23BD-4DB11897E807";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "ik_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "27AFB428-4EA6-5FED-1732-A8BE84A143DF";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "ik_end_ikFkSwitchHelperShape" -p "ik_end_ikFkSwitchHelper";
	rename -uid "DDBD6740-4E14-7D5F-BEE2-5DB247071EBF";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_end_ikFkSwitchHelper" -p "end_finalJoint";
	rename -uid "FEC55A24-4BBA-A7AC-6DD6-7E8B46282325";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687518 0 ;
createNode locator -n "fk_end_ikFkSwitchHelperShape" -p "fk_end_ikFkSwitchHelper";
	rename -uid "BB5AC22B-4DA4-38DD-95F6-738DC4E30F46";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "curveStart_locator" -p "b_finalJoint";
	rename -uid "CB32E723-4094-2CCA-EEA1-749BB34D128B";
	setAttr ".v" no;
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "curveStart_locatorShape" -p "curveStart_locator";
	rename -uid "86A626A7-498E-ED3F-4DC7-B3BA7CDF9F96";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_b_ikFkSwitchHelper" -p "b_finalJoint";
	rename -uid "E7BCD2DE-4911-6EE4-6027-3E92F85E117E";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687512 0 ;
createNode locator -n "fk_b_ikFkSwitchHelperShape" -p "fk_b_ikFkSwitchHelper";
	rename -uid "C2F02728-489F-068A-6A16-68AE8CF538A0";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "middle_volume_outJoint" -p "b_finalJoint";
	rename -uid "88751295-4BA3-9DF2-6AC7-1A975396C16A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "ik_root_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "3BA6D48A-47AA-9290-79FE-3185F685FEB1";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "ik_root_ikFkSwitchHelperShape" -p "ik_root_ikFkSwitchHelper";
	rename -uid "0CD75D83-4EC7-1806-5A2E-478D1C3C8750";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_a_ikFkSwitchHelper" -p "a_finalJoint";
	rename -uid "04F1F995-47E9-F479-79A4-78A1F2AD1504";
	setAttr ".oc" 6;
	setAttr ".sh" -type "double3" 0 -0.34273005807687501 0 ;
createNode locator -n "fk_a_ikFkSwitchHelperShape" -p "fk_a_ikFkSwitchHelper";
	rename -uid "317F1612-4327-AC81-BB40-E5802360606E";
	setAttr -k off ".v";
	setAttr ".oc" 6;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "root_volume_outJoint" -p "a_finalJoint";
	rename -uid "BE895BE3-4FEA-C093-3515-54B7EFF86880";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "output" -p "mod";
	rename -uid "E47ECCB1-482C-2055-9CCB-E399EEF79DE1";
createNode transform -n "outJoints" -p "output";
	rename -uid "A732D3AD-44CB-A85D-61FF-EAB2C4F33F05";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "F691F1FE-4FF5-11F3-A810-F681B7F9FCEA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000276823691665 0 0.0023306988404748073 0 0 1 0 0
		 -0.0023306279931854523 0 0.99999728408289057 0 0 0 0 1;
createNode joint -n "middle_outJoint" -p "root_outJoint";
	rename -uid "0724AB0E-4123-5422-D8B4-1B87CE43571D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0000259339796214 0 -0.0029881482422647126 0 0 1 0 0
		 0.0029880574101934557 0 0.9999955357464918 0 2.236129877159025 0 0.005211601042381415 1;
createNode joint -n "end_outJoint" -p "middle_outJoint";
	rename -uid "7D567170-4154-784C-036B-418CE4DA24F6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
createNode transform -n "fk_out_grp" -p "output";
	rename -uid "83BF9137-4F9D-1BBF-12CD-A9808CF4C327";
	setAttr ".v" no;
createNode transform -n "fk_out" -p "fk_out_grp";
	rename -uid "4807AD24-4BFB-9CC9-9772-70991C6F74E9";
createNode locator -n "fk_outShape" -p "fk_out";
	rename -uid "C0E6B2CE-46BF-B979-D3C3-5E9E5B64A37B";
	setAttr -k off ".v";
createNode transform -n "ik_out_grp" -p "output";
	rename -uid "E0D2CFDB-450A-3365-F54F-D4853B309EF7";
	setAttr ".v" no;
createNode transform -n "ik_out" -p "ik_out_grp";
	rename -uid "0BD525FC-4B57-A6B8-57A9-34B9BD636C1F";
createNode locator -n "ik_outShape" -p "ik_out";
	rename -uid "AF10E0E2-445D-71FA-BF28-29BCCDD92CFA";
	setAttr -k off ".v";
createNode transform -n "ik_out_initLoc" -p "ik_out";
	rename -uid "03E56031-4441-CC5F-A5A9-C2870E758366";
createNode locator -n "ik_out_initLocShape" -p "ik_out_initLoc";
	rename -uid "56FCC591-4F9B-5F2B-6F2B-E3BF09BCDB4C";
	setAttr -k off ".v";
createNode transform -n "ikRev_out" -p "ik_out_grp";
	rename -uid "E71AE3FA-4A92-5A5E-20C7-B69C851D9B2F";
createNode locator -n "ikRev_outShape" -p "ikRev_out";
	rename -uid "B2851782-46BF-CD1A-338C-BCBE73580955";
	setAttr -k off ".v";
createNode transform -n "end_out" -p "output";
	rename -uid "B13CFC5B-41E6-8499-8E59-C9844685D0BE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.81999877030424 0 2.3314683517128287e-15 ;
	setAttr ".r" -type "double3" 0 3.1805546814635168e-15 0 ;
createNode locator -n "end_outShape" -p "end_out";
	rename -uid "28205BA4-4A7D-9F9F-1864-ABAF2C945721";
	setAttr -k off ".v";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "8132230F-4F4C-9422-AD12-6F8236C8E4E0";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "05577822-4439-C90A-12CF-9AA13A48D39A";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "3B2E04A5-4FF5-26B4-C916-339404D964D0";
createNode displayLayerManager -n "layerManager";
	rename -uid "D29394CC-4DBC-4293-C5EC-668925AA7CF8";
createNode displayLayer -n "defaultLayer";
	rename -uid "525D43DE-4288-373A-1D71-9E82C82C8915";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "A7071DBF-4FD9-B87F-8290-B194FAEF7CA7";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "4CCDD0A3-44A2-AA93-8ECB-1BB3F6A69BCB";
	setAttr ".g" yes;
createNode reverse -n "ikFk_reverse";
	rename -uid "6200CDF7-478F-FC26-257D-23B781EFF406";
createNode partition -n "mtorPartition";
	rename -uid "3FCF9160-42ED-324A-9B5A-06A24280C9BE";
	addAttr -s false -ci true -sn "inmsg" -ln "inmessage" -at "message";
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "4568AC32-4150-047E-68BA-D0AFD95E9333";
createNode multMatrix -n "multMatrix22";
	rename -uid "DD769CC6-49E0-9BB2-C3D2-F6B8DA36DB82";
	setAttr -s 3 ".i";
createNode multMatrix -n "fk_b_group_multMatrix";
	rename -uid "9B22C77F-40D8-94FD-0876-5CB81AEB68C0";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "fk_b_group_decomposeMatrix";
	rename -uid "91863F59-4548-35FC-AC25-4A8BD4ACA53A";
createNode decomposeMatrix -n "decomposeMatrix31";
	rename -uid "EBD7D439-4320-165D-002A-D6B853B85770";
createNode multMatrix -n "multMatrix29";
	rename -uid "1E2E227C-4933-A616-A05E-0EACEE77EF9F";
createNode decomposeMatrix -n "decomposeMatrix33";
	rename -uid "32C71B25-4D30-2AC2-DEEB-C88E1FF5673F";
createNode objectSet -n "moduleControlSet";
	rename -uid "D776821A-48B4-151C-EB35-83BE5BE07078";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr -s 2 ".dnsm";
createNode condition -n "mirror_condition";
	rename -uid "A5104CB8-4132-B18D-A65C-0FBD0432C09A";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 180 -90 ;
	setAttr ".cf" -type "float3" 1 0 0 ;
createNode decomposeMatrix -n "root_connector_decomposeMatrix";
	rename -uid "3425494B-4B2D-7793-E7C9-928EF19C3853";
createNode multMatrix -n "fk_end_group_multMatrix";
	rename -uid "90DA8040-4498-B6C1-FD02-E7873AB896F3";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "fk_end_group_decomposeMatrix";
	rename -uid "564505E5-4CC5-BCEC-23F6-EFB56E61532E";
createNode decomposeMatrix -n "decomposeMatrix41";
	rename -uid "E5391987-419D-A63E-1A65-829318DA3990";
createNode decomposeMatrix -n "decomposeMatrix43";
	rename -uid "8EF0160E-4BE2-37E4-C90C-138D5652F3F7";
createNode decomposeMatrix -n "decomposeMatrix44";
	rename -uid "6C68E9BD-4D77-13CD-7419-DA9388A2E51F";
createNode decomposeMatrix -n "decomposeMatrix45";
	rename -uid "E5738DCC-4963-7078-001B-FA9C11704491";
createNode multMatrix -n "multMatrix34";
	rename -uid "E716E374-43FA-3720-C605-BBBFC72E0D8B";
createNode objectSet -n "sets";
	rename -uid "E268C843-4E46-62A7-5A57-5DBEA7DD9324";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode unitConversion -n "unitConversion431";
	rename -uid "B1C1EFD7-4B64-B69E-90BE-8BAF45385175";
	setAttr ".cf" 0.017453292519943295;
createNode hyperView -n "hyperView3";
	rename -uid "4252F6E2-490A-C989-F321-649B3855216E";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout3";
	rename -uid "56B593EB-4E61-0F6E-A498-53A2FD5389FB";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView4";
	rename -uid "F55DACCF-4695-096F-A721-F793447B3573";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout4";
	rename -uid "B0665FAB-42AE-755A-A525-A48BAEFC5565";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView5";
	rename -uid "968D7483-415F-D332-E6A4-66885A6408B9";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout5";
	rename -uid "18710132-4A2A-BC75-6CC8-E08155B0E0DC";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode hyperView -n "hyperView6";
	rename -uid "2B122EA9-4537-9A05-C155-769B6773CFBA";
	setAttr ".vl" -type "double2" -114.28571428571428 -522.61904761904771 ;
	setAttr ".vh" -type "double2" 1027.3809523809523 30.952380952380956 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout6";
	rename -uid "FD28785E-4BC0-E4AE-E83C-E4B74AC29742";
	setAttr ".ihi" 0;
	setAttr ".anf" yes;
createNode multDL -n "multDoubleLinear435";
	rename -uid "4BF8E726-4C1F-46B1-38E7-A7B422ECEF23";
createNode multMatrix -n "multMatrix38";
	rename -uid "093C9C88-47F1-DCDC-503D-E7B99EAC653C";
createNode objectSet -n "ikFkSwitchSet";
	rename -uid "6561811E-4158-FC0C-3329-EBB51B742140";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "decomposeMatrix42";
	rename -uid "9F81833F-4A0A-4A5D-1CA3-9FAA4F13A51A";
createNode unitConversion -n "unitConversion1";
	rename -uid "83298904-4386-C2C1-0B0A-B39E5D03B237";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion432";
	rename -uid "957E1011-4731-D2EF-51E8-8E80EB0FE296";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "rootMiddle_vector";
	rename -uid "2EC933B6-4CCE-6E4A-19D4-2EA88B80A7A5";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "rootEnd_vector";
	rename -uid "0E758E7E-440D-EB7E-9D53-4ABE1CA4D3C7";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "cosAngle_bewtweenVectors";
	rename -uid "72682394-4AFF-493A-10B6-1C83DA949FE4";
	setAttr ".no" yes;
createNode multiplyDivide -n "rootEnd_vectorNormalized_projected";
	rename -uid "B9A41DF6-41F8-E02B-780D-0D867BA9D6D1";
createNode distanceBetweenDL -n "rootMiddle_distance";
	rename -uid "07CF1C6A-4F22-45F6-C314-BD9E0C30536A";
createNode vectorProduct -n "rootEnd_vectorNormalized";
	rename -uid "48FC284E-4AF9-0169-17A3-EA996349D1A8";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode multiplyDivide -n "rootMiddle_projected";
	rename -uid "304EBB9C-4E24-EBA7-E92E-7CBF01FAA429";
createNode plusMinusAverage -n "rootMiddle_betweenPoint";
	rename -uid "F0D9A0DA-47C7-C7E0-7609-8698C77C7DA6";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "frombetweenToMiddle_vector";
	rename -uid "6531E0BD-4261-9861-63A8-718BA1B1CAC4";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "middleOut_vector";
	rename -uid "785E8ECB-433F-A2D0-7B91-91B665774234";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode vectorProduct -n "middleOut_vectorNormalized";
	rename -uid "039F8595-440D-160F-6F68-E4958517896F";
	setAttr ".op" 0;
	setAttr ".no" yes;
createNode multiplyDivide -n "multiplyDivide352";
	rename -uid "AE243E6A-4B80-3922-6D6F-28A7F70F69E0";
createNode composeMatrix -n "middleOut_matrix";
	rename -uid "7A3881FE-4E6C-477B-EBEB-7EA776555B93";
createNode multMatrix -n "ik_aim_multMatrix";
	rename -uid "4B691C96-4A52-0CFC-9DF8-738F021E7C9B";
	setAttr -s 2 ".i";
createNode multDL -n "aimOffset_scaled";
	rename -uid "72FC32D4-4DF9-971E-C13E-74A1F55288EA";
	setAttr ".i2" 1;
createNode decomposeMatrix -n "decomposeMatrix46";
	rename -uid "AF17E8D3-4968-765B-E544-F6AE74948404";
createNode multMatrix -n "multMatrix39";
	rename -uid "4CE79B58-4248-9F66-DAC9-AAA122C217D3";
	setAttr -s 2 ".i";
createNode composeMatrix -n "world_composeMatrix";
	rename -uid "5E7955FC-4BC6-6950-7D34-2A8154830284";
createNode blendColors -n "blendColors1";
	rename -uid "9FA5B5A1-4038-081F-C30A-70BAD22A50AF";
createNode unitConversion -n "unitConversion433";
	rename -uid "9FCCF159-4F10-19E1-8A0F-D18D2382B24E";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion434";
	rename -uid "64F54175-48D6-332B-010A-F0B0C0FEA6BC";
	setAttr ".cf" 0.017453292519943295;
createNode blendColors -n "blendColors2";
	rename -uid "697BC901-4A36-26B6-174C-5688C651CCB3";
createNode unitConversion -n "unitConversion435";
	rename -uid "49CCC0BB-464C-12FA-1A17-77ABF828A3F3";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion436";
	rename -uid "042AA95C-446E-D301-22E6-EE88C2303CD7";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion437";
	rename -uid "33865A8A-40D4-5FA7-3DAB-E697795A224B";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "control_group_decomposeMatrix";
	rename -uid "E5B73661-4DA1-918B-5C4E-F2B4E8183A2B";
createNode multMatrix -n "control_group_multMatrix";
	rename -uid "85C628BC-49E6-2D42-537D-7DA08A7B0775";
	setAttr -s 2 ".i";
createNode multDL -n "multDoubleLinear437";
	rename -uid "AAD1990A-48D4-99D4-652A-FEA4D9269D03";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion440";
	rename -uid "B01185ED-4BAC-AA27-5DAC-CB88B87F10A2";
	setAttr ".cf" 0.017453292519943295;
createNode decomposeMatrix -n "ik_aim_decomposeMatrix";
	rename -uid "E85C587B-4271-99E3-C46E-F9ACE4728C8D";
createNode multDL -n "initScale1_mult";
	rename -uid "BABCBE97-40CA-B6D3-DC4F-CDBCE188E643";
createNode multDL -n "initScaleEnd_mult";
	rename -uid "BE4BE2D9-432C-7AEC-B4D3-CCBFC9783021";
createNode decomposeMatrix -n "decomposeMatrix49";
	rename -uid "77A92E94-410B-CF07-5F7A-8C91791C878C";
createNode multiplyDivide -n "multiplyDivide353";
	rename -uid "036C8CB6-4195-3F92-9EC1-07BC43684823";
	setAttr ".i2" -type "float3" -1 1 1 ;
createNode unitConversion -n "unitConversion446";
	rename -uid "698ABB06-4541-5CB4-2ED2-9C8CB4D2265A";
	setAttr ".cf" 57.295779513082323;
createNode addDL -n "addDoubleLinear1";
	rename -uid "14645DC5-4180-CEB2-9FBA-D9B6BE03713D";
	setAttr ".ihi" 2;
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "2641B9AD-4958-9640-B97A-F2A6A47B9311";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "88DE7A22-4A5B-0E08-51E9-BA9107116563";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "root_decomposeMatrix";
	rename -uid "045FB8C5-48EC-953A-BCAE-1FBBD381C352";
createNode multMatrix -n "root_multMatrix";
	rename -uid "45669536-4C5B-A734-8D96-D68EC74AEA9C";
createNode composeMatrix -n "mirror_composeMatrix";
	rename -uid "815E0126-4546-6D76-017E-E89938A6BA8D";
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "7F897D9F-4F00-F8B2-A289-08A87C257C84";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "EEDA535B-40D5-6402-0269-4494F24D1514";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode decomposeMatrix -n "decomposeMatrix50";
	rename -uid "5DEA04A7-48A8-9C1B-3A1F-6D8AAE44A9CD";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "4F9990A1-4660-1967-38A5-E1B3AAA4D562";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide1";
	rename -uid "0F5BC149-4AAC-9A7B-107B-D2A3764FEADA";
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "6A097555-4CC7-BA72-F5F9-E3B3ED040764";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode decomposeMatrix -n "mainPoser_decomposeMatrix";
	rename -uid "96603B26-4BE7-12EF-CA45-A696A0D6834C";
createNode multDL -n "multDoubleLinear438";
	rename -uid "4E7C2FE1-461F-F92F-0538-AEB2A7C3FB36";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "60184304-4821-683D-A1BF-4E86F221422B";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "2F5C5970-4957-CCF0-2627-9C9C831787AB";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode objectSet -n "skinJointsSet";
	rename -uid "EADED37A-422C-4283-6380-13B618E2B024";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
createNode composeMatrix -n "composeMatrix1";
	rename -uid "C8CFE285-49EC-0C61-9F12-2D994F2DFB7E";
createNode multDL -n "multDoubleLinear439";
	rename -uid "62B24554-48D1-A0C0-F66B-CA894E3B9E49";
createNode multDL -n "ikSymmetryBehaviour_multDoubleLinear";
	rename -uid "984CEEEE-4265-00D9-A6A5-328549945009";
createNode condition -n "ikSymmetryBehaviour_condition";
	rename -uid "7845AF34-428E-525F-DB91-32B932F314E2";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 1 ;
	setAttr ".cf" -type "float3" 1 1 -1 ;
createNode controller -n "control_tag";
	rename -uid "098690B5-4293-1DAE-0D61-188AE40D178C";
createNode controller -n "middleOffset_tag";
	rename -uid "3B7AF20E-41BD-DE3E-0F2B-0A8F23824E6E";
createNode controller -n "ik_end_tag";
	rename -uid "07C52497-4C7C-1BEF-4AA3-88A6B47B4AF2";
createNode controller -n "ik_root_tag";
	rename -uid "56F3DDD7-42D6-2975-DE14-72B61A5E9880";
createNode controller -n "ik_aim_tag";
	rename -uid "1230C289-435D-4AE1-707E-10B69AB04FD9";
createNode controller -n "fk_a_tag";
	rename -uid "B6A34B71-4A23-1B2B-0DFF-2E8971FE9FB8";
createNode controller -n "fk_b_tag";
	rename -uid "BED5B391-49A2-073B-3F62-F1AC33CC4C32";
createNode controller -n "fk_end_tag";
	rename -uid "2DFC95CB-4382-31DF-6C76-3C90044ACE81";
createNode pk_limbIk -n "pkIk_solver";
	rename -uid "7446E18A-489A-D6B8-CB94-56863F7538C2";
	setAttr ".ro" -type "matrix" 0.99999999999999989 -1.0269562977782698e-15 0 0 0 0 1 0
		 -1.0269562977782698e-15 -0.99999999999999989 0 0 0 0 0 1;
	setAttr ".mor" -type "matrix" 0.99999999999999922 -3.5087288463575561e-08 0 0 0 0 1 0
		 -3.5087288435819985e-08 -0.99999999999999933 0 0 0 0 0 1;
	setAttr ".eor" -type "matrix" 1.0000000000000002 0 3.2757297985241962e-09 0 0 1 0 0
		 -3.2757297985241962e-09 0 1.0000000000000002 0 0 0 0 1;
	setAttr -s 3 ".ot";
	setAttr -s 3 ".oro";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "1B58B822-4475-C68D-E4E3-919E6324540F";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 24 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "72D60AF0-4927-DDE4-7387-EEB428D62BFE";
	setAttr -s 2 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1849.9999264876076 -4802.6348137795703 ;
	setAttr ".tgi[0].vh" -type "double2" -797.61901592451557 -3116.4124905933818 ;
	setAttr -s 21 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1608.5714111328125;
	setAttr ".tgi[0].ni[0].y" -4305.71435546875;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -2235.447509765625;
	setAttr ".tgi[0].ni[1].y" -3212.2216796875;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -2253.971435546875;
	setAttr ".tgi[0].ni[2].y" -3391.500244140625;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -1477.052490234375;
	setAttr ".tgi[0].ni[3].y" -3430.8525390625;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -1608.5714111328125;
	setAttr ".tgi[0].ni[4].y" -4204.28564453125;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -2110.76416015625;
	setAttr ".tgi[0].ni[5].y" -4386.7666015625;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -1775.2855224609375;
	setAttr ".tgi[0].ni[6].y" -3613.33349609375;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -1608.5714111328125;
	setAttr ".tgi[0].ni[7].y" -4508.5712890625;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -914.28570556640625;
	setAttr ".tgi[0].ni[8].y" -3871.428466796875;
	setAttr ".tgi[0].ni[8].nvs" 18305;
	setAttr ".tgi[0].ni[9].x" -1807.7021484375;
	setAttr ".tgi[0].ni[9].y" -4412.7001953125;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" -1136.2191162109375;
	setAttr ".tgi[0].ni[10].y" -3253.300537109375;
	setAttr ".tgi[0].ni[10].nvs" 18305;
	setAttr ".tgi[0].ni[11].x" -2008.88330078125;
	setAttr ".tgi[0].ni[11].y" -3244.638427734375;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" -1643.7666015625;
	setAttr ".tgi[0].ni[12].y" -3986.609619140625;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" -1890.3310546875;
	setAttr ".tgi[0].ni[13].y" -3985.20947265625;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" -1565.04052734375;
	setAttr ".tgi[0].ni[14].y" -3813.821044921875;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" -1608.5714111328125;
	setAttr ".tgi[0].ni[15].y" -4102.85693359375;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" -1473.3477783203125;
	setAttr ".tgi[0].ni[16].y" -3335.0244140625;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" -1720.640380859375;
	setAttr ".tgi[0].ni[17].y" -3730.485595703125;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" -1838.2664794921875;
	setAttr ".tgi[0].ni[18].y" -3371.5546875;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" -2242.857177734375;
	setAttr ".tgi[0].ni[19].y" -3900;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" -1608.5714111328125;
	setAttr ".tgi[0].ni[20].y" -4610;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" 334.44624806442175 -1857.4895196977793 ;
	setAttr ".tgi[1].vh" -type "double2" 1370.0151647697328 -198.20493270170363 ;
	setAttr -s 9 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 912.53173828125;
	setAttr ".tgi[1].ni[0].y" -521.69989013671875;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 671.4285888671875;
	setAttr ".tgi[1].ni[1].y" -692.85711669921875;
	setAttr ".tgi[1].ni[1].nvs" 19345;
	setAttr ".tgi[1].ni[2].x" 1071.4285888671875;
	setAttr ".tgi[1].ni[2].y" -707.14288330078125;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 1071.4285888671875;
	setAttr ".tgi[1].ni[3].y" -808.5714111328125;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 1071.4285888671875;
	setAttr ".tgi[1].ni[4].y" -910;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 1071.4285888671875;
	setAttr ".tgi[1].ni[5].y" -1011.4285888671875;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 286.6636962890625;
	setAttr ".tgi[1].ni[6].y" -933.7159423828125;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" 275.70529174804688;
	setAttr ".tgi[1].ni[7].y" -821.4556884765625;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[1].ni[8].x" 1071.4285888671875;
	setAttr ".tgi[1].ni[8].y" -1112.857177734375;
	setAttr ".tgi[1].ni[8].nvs" 18304;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
	setAttr ".rtfm" 1;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 6 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 48 ".u";
select -ne :defaultRenderingList1;
select -ne :standardSurface1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :openPBR_shader1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".dss" -type "string" "openPBR_shader1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "Un-tone-mapped (sRGB)";
	setAttr ".vn" -type "string" "Un-tone-mapped";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "scene-linear Rec.709-sRGB";
	setAttr ".otc" yes;
	setAttr ".otn" -type "string" "sRGB";
	setAttr ".potn" -type "string" "Un-tone-mapped (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
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
connectAttr "ikSymmetryBehaviour_condition.ocr" "ik_aim_initLoc.sx";
connectAttr "decomposeMatrix25.ot" "ik_end_initLoc.t";
connectAttr "unitConversion437.o" "ik_end_initLoc.r";
connectAttr "mirror_condition.ocr" "ik_end_initLoc.sz";
connectAttr "ikSymmetryBehaviour_condition.ocr" "ik_end_initLoc.sx";
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
connectAttr "ikSymmetryBehaviour_condition.ocr" "ik_aim_mirror.sx";
connectAttr "decomposeMatrix25.ot" "ik_end_init.t";
connectAttr "unitConversion437.o" "ik_end_init.r";
connectAttr "mirror_condition.ocr" "ik_end_mirror.sz";
connectAttr "ikSymmetryBehaviour_condition.ocr" "ik_end_mirror.sx";
connectAttr "ik_connector.t" "ik_end_out_init.t";
connectAttr "mirror_condition.ocr" "ik_end_out.sy";
connectAttr "unitConversion431.o" "ik_end_out.rx";
connectAttr "unitConversion440.o" "ik_end_out.ry";
connectAttr "curveStart_locatorShape.wp" "aim_curveShape.cp[0]";
connectAttr "curveEnd_locatorShape.wp" "aim_curveShape.cp[1]";
connectAttr "pkIk_solver.ombr" "middleOffset_group.r";
connectAttr "pkIk_solver.omb" "middleOffset_group.t";
connectAttr "root_connector_decomposeMatrix.osx" "ik_joints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "ik_joints.sy";
connectAttr "root_connector_decomposeMatrix.osz" "ik_joints.sz";
connectAttr "root_connector_decomposeMatrix.otx" "ik_joints.tx";
connectAttr "root_connector_decomposeMatrix.oty" "ik_joints.ty";
connectAttr "root_connector_decomposeMatrix.otz" "ik_joints.tz";
connectAttr "root_connector_decomposeMatrix.orx" "ik_joints.rx";
connectAttr "root_connector_decomposeMatrix.ory" "ik_joints.ry";
connectAttr "root_connector_decomposeMatrix.orz" "ik_joints.rz";
connectAttr "root_connector_decomposeMatrix.osx" "joints.sx";
connectAttr "root_connector_decomposeMatrix.osy" "joints.sy";
connectAttr "multDoubleLinear435.o" "joints.sz";
connectAttr "pkIk_solver.oro[0]" "a_finalJoint.r";
connectAttr "pkIk_solver.ot[0]" "a_finalJoint.t";
connectAttr "pkIk_solver.ot[1]" "b_finalJoint.t";
connectAttr "pkIk_solver.oro[1]" "b_finalJoint.r";
connectAttr "a_finalJoint.s" "b_finalJoint.is";
connectAttr "pkIk_solver.ot[2]" "end_finalJoint.t";
connectAttr "b_finalJoint.s" "end_finalJoint.is";
connectAttr "pkIk_solver.oro[2]" "end_finalJoint.r";
connectAttr "mirror_condition.ocr" "fk_end_ikFkSwitchHelper.sx";
connectAttr "mirror_condition.ocr" "fk_b_ikFkSwitchHelper.sx";
connectAttr "b_finalJoint.s" "middle_volume_outJoint.is";
connectAttr "pkIk_solver.ovb" "middle_volume_outJoint.sy";
connectAttr "pkIk_solver.ovb" "middle_volume_outJoint.sz";
connectAttr "mirror_condition.ocr" "fk_a_ikFkSwitchHelper.sx";
connectAttr "pkIk_solver.ova" "root_volume_outJoint.sy";
connectAttr "pkIk_solver.ova" "root_volume_outJoint.sz";
connectAttr "a_finalJoint.s" "root_volume_outJoint.is";
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
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "control.ikFk" "ikFk_reverse.ix";
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
connectAttr "pkIk_solver.oiem" "multMatrix38.i[0]";
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
connectAttr "multDoubleLinear439.o" "aimOffset_scaled.i1";
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
connectAttr "mod.aim_offset" "multDoubleLinear439.i1";
connectAttr "mainPoser_decomposeMatrix.osy" "multDoubleLinear439.i2";
connectAttr "mod.mirror" "ikSymmetryBehaviour_multDoubleLinear.i1";
connectAttr "mod.ikSymmetryBehaviour" "ikSymmetryBehaviour_multDoubleLinear.i2";
connectAttr "ikSymmetryBehaviour_multDoubleLinear.o" "ikSymmetryBehaviour_condition.ft"
		;
connectAttr "control.msg" "control_tag.act";
connectAttr "middleOffset.msg" "middleOffset_tag.act";
connectAttr "ik_end.msg" "ik_end_tag.act";
connectAttr "ik_root.msg" "ik_root_tag.act";
connectAttr "ik_aim.msg" "ik_aim_tag.act";
connectAttr "fk_a.msg" "fk_a_tag.act";
connectAttr "fk_b.msg" "fk_b_tag.act";
connectAttr "fk_end.msg" "fk_end_tag.act";
connectAttr "snap_root_loc.wm" "pkIk_solver.rm";
connectAttr "ik_connector.wm" "pkIk_solver.gm";
connectAttr "ik_aim.wm" "pkIk_solver.pm";
connectAttr "a_fkJoint.wm" "pkIk_solver.frm";
connectAttr "b_fkJoint.wm" "pkIk_solver.fmm";
connectAttr "fk_end.wm" "pkIk_solver.fem";
connectAttr "fk_end_group_decomposeMatrix.otx" "pkIk_solver.la";
connectAttr "fk_b_group_decomposeMatrix.otx" "pkIk_solver.lb";
connectAttr "control.ikFk" "pkIk_solver.ifk";
connectAttr "control.autoStretch" "pkIk_solver.ast";
connectAttr "control.softIk" "pkIk_solver.sik";
connectAttr "control.snap" "pkIk_solver.snp";
connectAttr "control.length1" "pkIk_solver.l1";
connectAttr "control.length2" "pkIk_solver.l2";
connectAttr "control.stretchVolume" "pkIk_solver.svl";
connectAttr "root_connector_decomposeMatrix.osx" "pkIk_solver.scl";
connectAttr "middleOffset.t" "pkIk_solver.mo";
connectAttr "middleOffset_group.pim" "pkIk_solver.mpim";
connectAttr "a_finalJoint.pim" "pkIk_solver.pim";
connectAttr "fk_b.autoTwist" "pkIk_solver.fkat";
connectAttr "middleOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "root_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "middle_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "b_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "ik_aim.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "root_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "ik_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "a_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "b_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "root_connector_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "pkIk_solver.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "fk_end_group_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "fk_b_group_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "fk_b_group_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "middleOffset_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "a_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn";
connectAttr "end_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn";
connectAttr "snap_root_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn";
connectAttr "fk_end_group_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn";
connectAttr "control.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "middleOffset_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "pkIk_solver.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "b_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "a_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "root_volume_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "middle_volume_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "a_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "b_fkJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn";
connectAttr "end_finalJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn";
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
connectAttr "decomposeMatrix46.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "world_composeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "control_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "multDoubleLinear437.msg" ":defaultRenderUtilityList1.u" -na;
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
connectAttr "multDoubleLinear439.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ikSymmetryBehaviour_multDoubleLinear.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "ikSymmetryBehaviour_condition.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
// End of limbMll.ma
