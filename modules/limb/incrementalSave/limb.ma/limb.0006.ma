//Maya ASCII 2022 scene
//Name: limb.ma
//Last modified: Sat, Mar 23, 2024 04:09:17 PM
//Codeset: 1251
requires maya "2022";
requires "stereoCamera" "10.0";
requires -nodeType "bifrostGraphShape" -dataType "bifData" "bifrostGraph" "2.6.0.0-202212071624-fbc8dae";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 22631)";
fileInfo "UUID" "52378A22-4628-01DA-B932-D09FA71AF053";
createNode transform -s -n "persp";
	rename -uid "3C7E0AEC-41A5-B981-7A2B-32A67D2BBAA3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 10.464577064033673 4.907500993784188 9.8427821319237818 ;
	setAttr ".r" -type "double3" -28.199999999993526 31.199999999994688 0 ;
	setAttr ".rp" -type "double3" 1.1102230246251563e-16 0 8.8817841970012523e-16 ;
	setAttr ".rpt" -type "double3" 5.7589012943859782e-16 4.8375017868310666e-16 -2.7025092621108523e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "6E01164D-4F2E-036C-75B6-C6AD97679A37";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 50000;
	setAttr ".coi" 13.568716850893779;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 2 0 -1.0519936084747314 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9E494C2A-4B0A-0D39-9443-79927F4E6226";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.9654701295353694 13.124345422138328 -0.67466250311622566 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "913AD3A3-4140-0101-A283-578D2A27E312";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 12.77739002646361;
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
	setAttr ".ove" yes;
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
	setAttr ".ovc" 12;
	setAttr -s 16 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 15 0 no 3
		16 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		16
		-0.5 0.5 0.5
		-0.5 0.5 -0.5
		0.5 0.5 -0.5
		0.5 0.5 0.5
		-0.5 0.5 0.5
		-0.5 -0.5 0.5
		-0.5 -0.5 -0.5
		0.5 -0.5 -0.5
		0.5 -0.5 0.5
		-0.5 -0.5 0.5
		0.5 -0.5 0.5
		0.5 0.5 0.5
		0.5 0.5 -0.5
		0.5 -0.5 -0.5
		-0.5 -0.5 -0.5
		-0.5 0.5 -0.5
		;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "07E5E7A8-424A-D812-4CD5-828825C1FF46";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -l on -k off ".v";
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
	rename -uid "F302DA9A-496E-99CA-7D7C-8898CAEE0A31";
	setAttr -k off ".v";
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
createNode transform -n "ik_aim_controlInitLoc" -p "root_poserOrient";
	rename -uid "37676F59-4A50-0F90-3B3A-6088FCC7CF8A";
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode locator -n "ik_aim_controlInitLocShape" -p "ik_aim_controlInitLoc";
	rename -uid "1802F3C4-49D6-848F-454E-50AC15052D0F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_end_controlInitLoc" -p "root_poserOrient";
	rename -uid "87C7868E-4CBC-C4D0-E609-82821C7EAEAF";
createNode locator -n "ik_end_controlInitLocShape" -p "ik_end_controlInitLoc";
	rename -uid "D7E59582-4743-1C20-57F0-D2A16066D4C5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_a_controlInitLoc" -p "root_poserOrient";
	rename -uid "EB186E5C-4F99-6D51-FDE0-85AFFBD529F0";
	setAttr ".v" no;
createNode locator -n "fk_a_controlInitLocShape" -p "fk_a_controlInitLoc";
	rename -uid "ECF7B6EA-4F03-5C35-826E-D5AD0A7BBE73";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "ik_root_controlInitLoc" -p "root_poserOrient";
	rename -uid "912A0E60-4CAC-BFED-9D55-D7889D28AA7B";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
createNode locator -n "ik_root_controlInitLocShape" -p "ik_root_controlInitLoc";
	rename -uid "22D6BE2B-4159-5F8F-0789-059EB86C6BE0";
	setAttr -k off ".v";
createNode transform -n "top_pin_initLoc" -p "root_poserOrient";
	rename -uid "BC6A5751-4255-1AAB-ABFF-3B803450F5F9";
	setAttr ".v" no;
createNode locator -n "top_pin_initLocShape" -p "top_pin_initLoc";
	rename -uid "2F87C4E3-457F-ADEF-C1DE-598D0A8D188E";
	setAttr -k off ".v";
createNode transform -n "middle_poser" -p "mainPoser";
	rename -uid "3D67BC04-42A9-BED1-F557-FD8869DCE918";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 5.3472764720209511 0.10690376369707089 -1.4312505737814152 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on ".twist";
createNode nurbsSurface -n "middle_poserNurbsShape" -p "middle_poser";
	rename -uid "B201F6D4-4698-02A4-ED9A-468712A41911";
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
createNode locator -n "middle_poser_locShape" -p "middle_poser";
	rename -uid "C3311901-49CA-FCC0-484A-898DA2B566DF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".los" -type "double3" 0.01 0.01 0.01 ;
createNode transform -n "middle_poserOrient" -p "middle_poser";
	rename -uid "F49D1E03-421D-0F19-4532-DB92DFDD4EF4";
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
createNode transform -n "fk_b_controlInitLoc" -p "middle_poserOrient";
	rename -uid "BEBDF44F-40E3-9D23-32D0-00BA67C738CC";
createNode locator -n "fk_b_controlInitLocShape" -p "fk_b_controlInitLoc";
	rename -uid "712DA925-44BA-1B39-B561-AD8C17667739";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "bottom_pin_initLoc" -p "middle_poserOrient";
	rename -uid "517110DE-4BC6-B66E-C32D-0797E083E510";
	setAttr ".v" no;
createNode locator -n "bottom_pin_initLocShape" -p "bottom_pin_initLoc";
	rename -uid "EEE7C4AB-43F8-D73C-4EE1-A5BF92FDC184";
	setAttr -k off ".v";
createNode transform -n "middleRoot_orient_locator" -p "middle_poser";
	rename -uid "A0F0B9A3-4CD9-7CE8-0976-1D9BF9A7C2E6";
	setAttr ".r" -type "double3" 6.3611093629270335e-15 -1.0151984485515377e-30 1.8288189418415221e-14 ;
createNode locator -n "middleRoot_orient_locatorShape" -p "middleRoot_orient_locator";
	rename -uid "4594FB3D-4AA0-1F0B-52DD-CCAFC3EECD33";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_twist_angleLoc_1" -p "middle_poser";
	rename -uid "53A303B1-440E-81F1-8B4C-408013838E08";
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
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 10.598785833774784 0.047235730117476393 -0.42692147825165705 ;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".size" 0.5;
	setAttr -l on -k on ".worldOrient" yes;
createNode nurbsSurface -n "end_poserNurbsShape" -p "end_poser";
	rename -uid "9649C485-4DDA-EDDD-A2EF-D28D66467D84";
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
	setAttr ".lr" -type "double3" -37.45957240066344 -10.826160982789535 -0.65097082694039921 ;
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
createNode transform -n "fk_end_controlInitLoc" -p "end_initLoc";
	rename -uid "045DAFEC-4A2C-567F-5D00-AFA2A29BDF33";
createNode locator -n "fk_end_controlInitLocShape" -p "fk_end_controlInitLoc";
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
createNode transform -n "end_pose_loc" -p "mainPoser";
	rename -uid "E2E30138-4137-A981-678C-59A8BAFF2453";
	setAttr ".v" no;
createNode locator -n "end_pose_locShape" -p "end_pose_loc";
	rename -uid "D6A22795-47AC-7DE2-55F8-2C9171081A1D";
	setAttr -k off ".v";
createNode transform -n "posers_bifrostGraph" -p "posers";
	rename -uid "D62B0F5F-40FC-D37C-CB4B-2DB81B1E9275";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 0 0.019101227463072856 ;
	setAttr ".it" no;
createNode bifrostGraphShape -n "posers_bifrostGraphShape" -p "posers_bifrostGraph";
	rename -uid "AC27A958-4B2B-0748-F286-AC8E0AE232BE";
	addAttr -r false -ci true -k true -m -sn "posers" -ln "posers" -at "fltMatrix";
	addAttr -r false -ci true -k true -sn "global_scale" -ln "global_scale" -at "float";
	addAttr -r false -ci true -k true -m -sn "lines" -ln "lines" -at "compound" -nc 
		1;
	addAttr -r false -ci true -k true -m -sn "lines_A" -ln "lines_A" -at "fltMatrix" 
		-p "lines";
	addAttr -w false -ci true -sn "Core__Graph__terminal__final" -ln "Core__Graph__terminal__final" 
		-ct "terminal_node_output_attribute" -dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__proxy" -ln "Core__Graph__terminal__proxy" 
		-ct "terminal_node_output_attribute" -dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__diagnostic" -ln "Core__Graph__terminal__diagnostic" 
		-ct "terminal_node_output_attribute" -dt "bifData";
	addAttr -r false -ci true -k true -sn "width" -ln "width" -at "float";
	addAttr -r false -ci true -k true -sn "poser_color" -ln "poser_color" -at "float3" 
		-nc 3;
	addAttr -r false -ci true -k true -sn "poser_colorx" -ln "poser_colorx" -at "float" 
		-p "poser_color";
	addAttr -r false -ci true -k true -sn "poser_colory" -ln "poser_colory" -at "float" 
		-p "poser_color";
	addAttr -r false -ci true -k true -sn "poser_colorz" -ln "poser_colorz" -at "float" 
		-p "poser_color";
	addAttr -w false -ci true -m -sn "out_cubeShape_vectors" -ln "out_cubeShape_vectors" 
		-at "float3" -nc 3;
	addAttr -w false -ci true -sn "out_cubeShape_vectorsx" -ln "out_cubeShape_vectorsx" 
		-at "float" -p "out_cubeShape_vectors";
	addAttr -w false -ci true -sn "out_cubeShape_vectorsy" -ln "out_cubeShape_vectorsy" 
		-at "float" -p "out_cubeShape_vectors";
	addAttr -w false -ci true -sn "out_cubeShape_vectorsz" -ln "out_cubeShape_vectorsz" 
		-at "float" -p "out_cubeShape_vectors";
	addAttr -r false -ci true -k true -sn "mainPoser_size" -ln "mainPoser_size" -at "float";
	addAttr -r false -ci true -k true -m -sn "radius" -ln "radius" -at "float";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\n    \"header\": {\n        \"metadata\": [\n            {\n                \"metaName\": \"adskFileFormatVersion\",\n                \"metaValue\": \"100L\"\n            }\n        ]\n    },\n    \"namespaces\": [],\n    \"types\": [],\n    \"compounds\": [\n        {\n            \"name\": \"posers_bifrostGraphShape\",\n            \"metadata\": [\n                {\n                    \"metaName\": \"io_nodes\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_inodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"input\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1394.78 -690.939\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"posers\"\n                                                },\n                                                {\n                                                    \"metaName\": \"global_scale\"\n                                                },\n                                                {\n                                                    \"metaName\": \"lines\"\n                                                },\n                                                {\n                                                    \"metaName\": \"width\"\n                                                },\n"
		+ "                                                {\n                                                    \"metaName\": \"poser_color\"\n                                                },\n                                                {\n                                                    \"metaName\": \"mainPoser_size\"\n                                                },\n                                                {\n                                                    \"metaName\": \"radius\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"io_onodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"output\",\n                                    \"metadata\": [\n                                        {\n"
		+ "                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-396.725 -1392.24\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"out_cubeShape_vectors\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n"
		+ "                            ]\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Math,multiply\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"output\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Geometry::Properties,set_geo_property\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Hyuu::Utility,color_constant\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,MJCG::Geometry::Strands,update_strands_orientations\"\n"
		+ "                },\n                {\n                    \"metaName\": \"ViewportRect\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"-1494.42 -1398.07 1412.4 1588.07\"\n                },\n                {\n                    \"metaName\": \"internal\",\n                    \"metaValue\": \"true\"\n                }\n            ],\n            \"ports\": [\n                {\n                    \"portName\": \"posers\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"array<Math::float4x4>\"\n                },\n                {\n                    \"portName\": \"global_scale\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"lines\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"array<array<Math::float4x4>>\"\n                },\n                {\n                    \"portName\": \"width\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n"
		+ "                },\n                {\n                    \"portName\": \"poser_color\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"UIWidget\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"ColorPicker\"\n                        }\n                    ]\n                },\n                {\n                    \"portName\": \"out_cubeShape_vectors\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"array<Math::float3>\"\n                },\n                {\n                    \"portName\": \"mainPoser_size\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"radius\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"array<float>\"\n                }\n            ],\n            \"compounds\": [\n"
		+ "                {\n                    \"name\": \"for_each_spheres\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"icon\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"<NATIVE>../icons/LoopForEach.svg\"\n                        },\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n"
		+ "                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-1482.4 -501.737\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"max_iterations\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"current_index\"\n                                                        },\n                                                        {\n"
		+ "                                                            \"metaName\": \"posers\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"global_radius\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"radius\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"color\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n"
		+ "                                    \"metaName\": \"io_onodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"output\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"708.247 468.451\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Array,build_array\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Geometry::Points,construct_points\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Graph,terminal\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,multiply\"\n                        },\n"
		+ "                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,add\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-212.962 -791.996 1702.63 1364.58\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"max_iterations\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationLimit\": \"true\"\n                        },\n                        {\n                            \"portName\": \"current_index\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationCounter\": \"true\"\n"
		+ "                        },\n                        {\n                            \"portName\": \"posers\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"array<Math::float4x4>\"\n                        },\n                        {\n                            \"portName\": \"global_radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"array<float>\"\n                        },\n                        {\n                            \"portName\": \"color\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float3\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"UIWidget\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"ColorPicker\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"matrix_to_SRT\",\n                            \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-459.612 -145.064\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"set_point_position\",\n"
		+ "                            \"nodeType\": \"Geometry::Properties::set_point_position\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"535.616 -520.934\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"create_mesh_sphere\",\n                            \"nodeType\": \"Modeling::Primitive::create_mesh_sphere\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"PortExpandedState\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"Dimensions\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-404.149 -667.731\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-959.858 -96.8663\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_point_position\",\n                            \"nodeType\": \"Geometry::Properties::get_point_position\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n"
		+ "                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-30.5 -452\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"add\",\n                            \"nodeType\": \"Core::Math::add\",\n                            \"multiInPortNames\": [\n                                \"point_position\",\n                                \"translation\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"227.162 -295.769\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array1\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1058.77 -616.974\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply\",\n                            \"nodeType\": \"Core::Math::multiply\",\n"
		+ "                            \"multiInPortNames\": [\n                                \"value\",\n                                \"global_radius\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-736.856 -493.716\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"assign_material\",\n                            \"nodeType\": \"Rendering::Materials::assign_material\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"169.5 -868\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"constant_surface_mat\",\n                            \"nodeType\": \"Rendering::Materials::constant_surface_mat\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"-389.5 -983\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"terminal\",\n                            \"nodeType\": \"Core::Graph::terminal\",\n                            \"fanInPortNames\": {\n                                \"final\": [],\n                                \"proxy\": [],\n                                \"diagnostic\": [\n                                    \"out_geometry\",\n                                    \"diagnostic_geo\"\n                                ]\n                            },\n                            \"terminalStates\": [\n                                {\n                                    \"name\": \"Core::Graph::terminal::diagnostic\",\n                                    \"enabled\": \"true\"\n                                }\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"PortExpandedState\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"diagnostic\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"1121.12 -663.546\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"construct_points\",\n"
		+ "                            \"nodeType\": \"Geometry::Points::construct_points\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"128.727 98.6737\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"point_scope\",\n                            \"nodeType\": \"Diagnostic::Display::point_scope\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"468.865 74.2421\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"build_array\",\n                            \"nodeType\": \"Core::Array::build_array\",\n                            \"multiInPortNames\": [\n                                \"translation\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-172.204 114.993\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \".posers\",\n                            \"target\": \"get_from_array.array\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array.index\"\n                        },\n                        {\n                            \"source\": \"create_mesh_sphere.sphere_mesh\",\n                            \"target\": \"get_point_position.geometry\"\n                        },\n                        {\n                            \"source\": \"get_point_position.point_position\",\n                            \"target\": \"add.first.point_position\"\n                        },\n                        {\n                            \"source\": \"matrix_to_SRT.translation\",\n"
		+ "                            \"target\": \"add.first.translation\"\n                        },\n                        {\n                            \"source\": \"add.output\",\n                            \"target\": \"set_point_position.positions\"\n                        },\n                        {\n                            \"source\": \"get_from_array.value\",\n                            \"target\": \"matrix_to_SRT.transform\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array1.index\"\n                        },\n                        {\n                            \"source\": \".radius\",\n                            \"target\": \"get_from_array1.array\"\n                        },\n                        {\n                            \"source\": \"get_from_array1.value\",\n                            \"target\": \"multiply.first.value\"\n                        },\n                        {\n                            \"source\": \".global_radius\",\n"
		+ "                            \"target\": \"multiply.first.global_radius\"\n                        },\n                        {\n                            \"source\": \"multiply.output\",\n                            \"target\": \"create_mesh_sphere.radius\"\n                        },\n                        {\n                            \"source\": \"constant_surface_mat.material_definition\",\n                            \"target\": \"assign_material.surface_material\"\n                        },\n                        {\n                            \"source\": \"create_mesh_sphere.sphere_mesh\",\n                            \"target\": \"assign_material.geometry\"\n                        },\n                        {\n                            \"source\": \"assign_material.out_geometry\",\n                            \"target\": \"set_point_position.geometry\"\n                        },\n                        {\n                            \"source\": \"set_point_position.out_geometry\",\n                            \"target\": \"terminal.diagnostic.out_geometry\"\n"
		+ "                        },\n                        {\n                            \"source\": \".color\",\n                            \"target\": \"constant_surface_mat.color\"\n                        },\n                        {\n                            \"source\": \"point_scope.diagnostic_geo\",\n                            \"target\": \"terminal.diagnostic.diagnostic_geo\"\n                        },\n                        {\n                            \"source\": \"construct_points.points\",\n                            \"target\": \"point_scope.point_geo\"\n                        },\n                        {\n                            \"source\": \"matrix_to_SRT.translation\",\n                            \"target\": \"build_array.first.translation\"\n                        },\n                        {\n                            \"source\": \"build_array.array\",\n                            \"target\": \"construct_points.point_position\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n"
		+ "                            \"valueName\": \"create_mesh_sphere.radius\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1f\"\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.height_segments\",\n                            \"valueType\": \"int\",\n                            \"value\": \"14L\"\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.axis_segments\",\n                            \"valueType\": \"int\",\n                            \"value\": \"20L\"\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.position\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n"
		+ "                            \"valueName\": \"create_mesh_sphere.up_axis\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"1f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.base_to_pivot\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"false\"\n                        },\n                        {\n                            \"valueName\": \"assign_material.geometry\",\n                            \"valueType\": \"Object\",\n                            \"value\": {}\n                        },\n                        {\n                            \"valueName\": \"assign_material.set_surface\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"true\"\n                        },\n                        {\n"
		+ "                            \"valueName\": \"assign_material.set_displacement\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"true\"\n                        },\n                        {\n                            \"valueName\": \"assign_material.set_volume\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"true\"\n                        },\n                        {\n                            \"valueName\": \"constant_surface_mat.name\",\n                            \"valueType\": \"string\",\n                            \"value\": \"\"\n                        },\n                        {\n                            \"valueName\": \"constant_surface_mat.color\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"1f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n"
		+ "                            \"valueName\": \"constant_surface_mat.transparency\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"point_scope.shape\",\n                            \"valueType\": \"Geometry::PointShapes\",\n                            \"value\": \"Disk\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.default_size\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.605300009f\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.cull_by_scalar_property\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"false\"\n                        },\n"
		+ "                        {\n                            \"valueName\": \"point_scope.cull_property\",\n                            \"valueType\": \"string\",\n                            \"value\": \"point_age\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.keep_max_value\",\n                            \"valueType\": \"float\",\n                            \"value\": \"3f\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.invert_range\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"false\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.coloring_property\",\n                            \"valueType\": \"string\",\n                            \"value\": \"point_normal\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.coloring_mode\",\n                            \"valueType\": \"Diagnostic::ColoringMode\",\n"
		+ "                            \"value\": \"ColoredProperty\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.color\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"1f\",\n                                \"y\": \"1f\",\n                                \"z\": \"1f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"point_scope.heatmap_R\",\n                            \"valueType\": \"Math::FCurve\",\n                            \"value\": {\n                                \"version\": \"1\",\n                                \"preExtrapolation\": \"0\",\n                                \"postExtrapolation\": \"0\",\n                                \"points\": [\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n"
		+ "                                            \"pcn\": {\n                                                \"xp\": \"-0.40000000000000002\",\n                                                \"yp\": \"0.10000000000000001\",\n                                                \"x\": \"0\",\n                                                \"y\": \"0.10000000000000001\",\n                                                \"xn\": \"0.40000000000000002\",\n                                                \"yn\": \"0.10000000000000001\"\n                                            }\n                                        }\n                                    },\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"9.5999999999999996\",\n                                                \"yp\": \"1\",\n                                                \"x\": \"10\",\n"
		+ "                                                \"y\": \"1\",\n                                                \"xn\": \"10.4\",\n                                                \"yn\": \"1\"\n                                            }\n                                        }\n                                    }\n                                ]\n                            }\n                        },\n                        {\n                            \"valueName\": \"point_scope.heatmap_G\",\n                            \"valueType\": \"Math::FCurve\",\n                            \"value\": {\n                                \"version\": \"1\",\n                                \"preExtrapolation\": \"0\",\n                                \"postExtrapolation\": \"0\",\n                                \"points\": [\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n"
		+ "                                                \"xp\": \"-1.3999999999999999\",\n                                                \"yp\": \"0\",\n                                                \"x\": \"-1\",\n                                                \"y\": \"0\",\n                                                \"xn\": \"-0.59999999999999998\",\n                                                \"yn\": \"0\"\n                                            }\n                                        }\n                                    },\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"4.7000000000000002\",\n                                                \"yp\": \"1\",\n                                                \"x\": \"5\",\n                                                \"y\": \"1\",\n"
		+ "                                                \"xn\": \"5.2999999999999998\",\n                                                \"yn\": \"1\"\n                                            }\n                                        }\n                                    },\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"9.5999999999999996\",\n                                                \"yp\": \"0\",\n                                                \"x\": \"10\",\n                                                \"y\": \"0\",\n                                                \"xn\": \"10.4\",\n                                                \"yn\": \"0\"\n                                            }\n                                        }\n                                    }\n"
		+ "                                ]\n                            }\n                        },\n                        {\n                            \"valueName\": \"point_scope.heatmap_B\",\n                            \"valueType\": \"Math::FCurve\",\n                            \"value\": {\n                                \"version\": \"1\",\n                                \"preExtrapolation\": \"0\",\n                                \"postExtrapolation\": \"0\",\n                                \"points\": [\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"-0.40000000000000002\",\n                                                \"yp\": \"1\",\n                                                \"x\": \"0\",\n                                                \"y\": \"1\",\n                                                \"xn\": \"0.40000000000000002\",\n"
		+ "                                                \"yn\": \"1\"\n                                            }\n                                        }\n                                    },\n                                    {\n                                        \"point\": {\n                                            \"locked\": \"1\",\n                                            \"interpolation\": \"2\",\n                                            \"pcn\": {\n                                                \"xp\": \"9.5999999999999996\",\n                                                \"yp\": \"0.10000000000000001\",\n                                                \"x\": \"10\",\n                                                \"y\": \"0.10000000000000001\",\n                                                \"xn\": \"10.4\",\n                                                \"yn\": \"0.10000000000000001\"\n                                            }\n                                        }\n                                    }\n                                ]\n"
		+ "                            }\n                        },\n                        {\n                            \"valueName\": \"point_scope.arrow_property\",\n                            \"valueType\": \"string\",\n                            \"value\": \"point_velocity\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.normalize_arrow\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"false\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.enable_arrows\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"false\"\n                        },\n                        {\n                            \"valueName\": \"point_scope.length_scale\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1f\"\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n"
		+ "                            \"name\": \"input\"\n                        },\n                        {\n                            \"name\": \"output\"\n                        }\n                    ],\n                    \"forEachCompound\": {\n                        \"ports\": []\n                    }\n                },\n                {\n                    \"name\": \"for_each_lines\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"icon\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"<NATIVE>../icons/LoopForEach.svg\"\n                        },\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n"
		+ "                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-537.464 -123.034\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"max_iterations\"\n                                                        },\n"
		+ "                                                        {\n                                                            \"metaName\": \"current_index\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lines\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"width\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\"\n                                }\n                            ]\n                        },\n"
		+ "                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"output\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,subtract\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Array,array_size\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Array,get_from_array\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"BifrostGraph,Core::Iterators,for_each\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-433.443 -950.509 1338.59 1903.2\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"max_iterations\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationLimit\": \"true\"\n                        },\n                        {\n                            \"portName\": \"current_index\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationCounter\": \"true\"\n                        },\n                        {\n                            \"portName\": \"lines\",\n                            \"portDirection\": \"input\",\n"
		+ "                            \"portType\": \"array<array<Math::float4x4>>\"\n                        },\n                        {\n                            \"portName\": \"width\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        }\n                    ],\n                    \"compounds\": [\n                        {\n                            \"name\": \"for_each1\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"icon\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"<NATIVE>../icons/LoopForEach.svg\"\n                                },\n                                {\n                                    \"metaName\": \"io_nodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"io_inodes\",\n                                            \"metadata\": [\n"
		+ "                                                {\n                                                    \"metaName\": \"input\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"DisplayMode\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"2\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"LayoutPos\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"-1513.15 -146.055\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"io_ports\",\n"
		+ "                                                            \"metadata\": [\n                                                                {\n                                                                    \"metaName\": \"max_iterations\"\n                                                                },\n                                                                {\n                                                                    \"metaName\": \"current_index\"\n                                                                },\n                                                                {\n                                                                    \"metaName\": \"lines\"\n                                                                },\n                                                                {\n                                                                    \"metaName\": \"width\"\n                                                                }\n                                                            ]\n"
		+ "                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"io_onodes\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"output\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Logic,equal\"\n                                },\n                                {\n"
		+ "                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Logic,if\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Math,add\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Math,subtract\"\n                                },\n                                {\n                                    \"metaName\": \"ViewportRect\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1721.11 -1861.15 4044.02 3977.09\"\n                                }\n"
		+ "                            ],\n                            \"ports\": [\n                                {\n                                    \"portName\": \"max_iterations\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"long\",\n                                    \"portIterationLimit\": \"true\"\n                                },\n                                {\n                                    \"portName\": \"current_index\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"long\",\n                                    \"portIterationCounter\": \"true\"\n                                },\n                                {\n                                    \"portName\": \"lines\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"array<Math::float4x4>\"\n                                },\n                                {\n                                    \"portName\": \"width\",\n"
		+ "                                    \"portDirection\": \"input\",\n                                    \"portType\": \"float\"\n                                }\n                            ],\n                            \"compoundNodes\": [\n                                {\n                                    \"nodeName\": \"matrix_to_SRT\",\n                                    \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-106.902 -269.444\"\n                                        }\n"
		+ "                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"get_from_array\",\n                                    \"nodeType\": \"Core::Array::get_from_array\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-415.492 -224.3\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"get_from_array1\",\n"
		+ "                                    \"nodeType\": \"Core::Array::get_from_array\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-519.19 199.71\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"matrix_to_SRT1\",\n                                    \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                                    \"metadata\": [\n                                        {\n"
		+ "                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-137.167 126.444\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"construct_strands\",\n                                    \"nodeType\": \"Geometry::Strands::construct_strands\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n"
		+ "                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"781.262 -266.167\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"build_array\",\n                                    \"nodeType\": \"Core::Array::build_array\",\n                                    \"multiInPortNames\": [\n                                        \"translation\",\n                                        \"translation1\"\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n"
		+ "                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"475.582 -244.595\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"terminal\",\n                                    \"nodeType\": \"Core::Graph::terminal\",\n                                    \"fanInPortNames\": {\n                                        \"final\": [],\n                                        \"proxy\": [],\n                                        \"diagnostic\": [\n                                            \"strands\"\n                                        ]\n                                    },\n                                    \"terminalStates\": [\n"
		+ "                                        {\n                                            \"name\": \"Core::Graph::terminal::final\",\n                                            \"enabled\": \"true\"\n                                        },\n                                        {\n                                            \"name\": \"Core::Graph::terminal::proxy\",\n                                            \"enabled\": \"true\"\n                                        },\n                                        {\n                                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                                            \"enabled\": \"true\"\n                                        }\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n"
		+ "                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1705.02 -352.893\"\n                                        },\n                                        {\n                                            \"metaName\": \"PortExpandedState\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"diagnostic\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1\"\n                                                },\n                                                {\n                                                    \"metaName\": \"proxy\",\n                                                    \"metaType\": \"string\",\n"
		+ "                                                    \"metaValue\": \"0\"\n                                                },\n                                                {\n                                                    \"metaName\": \"final\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"set_strands_shape\",\n                                    \"nodeType\": \"Geometry::Strands::set_strands_shape\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n"
		+ "                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1160.08 -156.428\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"assign_material1\",\n                                    \"nodeType\": \"Rendering::Materials::assign_material\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1409.5 -458\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"constant_surface_mat1\",\n                                    \"nodeType\": \"Rendering::Materials::constant_surface_mat\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"949.5 -621\"\n"
		+ "                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"value\",\n                                    \"valueType\": \"long\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1400.86 -601.446\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"add\",\n"
		+ "                                    \"nodeType\": \"Core::Math::add\",\n                                    \"multiInPortNames\": [\n                                        \"current_index\",\n                                        \"output1\"\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1054.25 -602.655\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"if\",\n"
		+ "                                    \"nodeType\": \"Core::Logic::if\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-725.206 -528.358\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"equal\",\n                                    \"nodeType\": \"Core::Logic::equal\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1027.56 -333.247\"\n                                        }\n                                    ]\n                                }\n                            ],\n                            \"connections\": [\n                                {\n                                    \"source\": \"matrix_to_SRT.translation\",\n                                    \"target\": \"build_array.first.translation\"\n                                },\n                                {\n                                    \"source\": \"get_from_array.value\",\n                                    \"target\": \"matrix_to_SRT.transform\"\n                                },\n"
		+ "                                {\n                                    \"source\": \"get_from_array1.value\",\n                                    \"target\": \"matrix_to_SRT1.transform\"\n                                },\n                                {\n                                    \"source\": \"matrix_to_SRT1.translation\",\n                                    \"target\": \"build_array.first.translation1\"\n                                },\n                                {\n                                    \"source\": \"construct_strands.strands\",\n                                    \"target\": \"set_strands_shape.strands\"\n                                },\n                                {\n                                    \"source\": \"build_array.array\",\n                                    \"target\": \"construct_strands.point_position\"\n                                },\n                                {\n                                    \"source\": \"set_strands_shape.out_strands\",\n                                    \"target\": \"assign_material1.geometry\"\n"
		+ "                                },\n                                {\n                                    \"source\": \"assign_material1.out_geometry\",\n                                    \"target\": \"terminal.diagnostic.strands\"\n                                },\n                                {\n                                    \"source\": \"constant_surface_mat1.material_definition\",\n                                    \"target\": \"assign_material1.surface_material\"\n                                },\n                                {\n                                    \"source\": \"value.output\",\n                                    \"target\": \"add.first.output1\"\n                                },\n                                {\n                                    \"source\": \".current_index\",\n                                    \"target\": \"add.first.current_index\"\n                                },\n                                {\n                                    \"source\": \".lines\",\n                                    \"target\": \"get_from_array.array\"\n"
		+ "                                },\n                                {\n                                    \"source\": \".lines\",\n                                    \"target\": \"get_from_array1.array\"\n                                },\n                                {\n                                    \"source\": \".current_index\",\n                                    \"target\": \"get_from_array1.index\"\n                                },\n                                {\n                                    \"source\": \"equal.output\",\n                                    \"target\": \"if.condition\"\n                                },\n                                {\n                                    \"source\": \"if.output\",\n                                    \"target\": \"get_from_array.index\"\n                                },\n                                {\n                                    \"source\": \".max_iterations\",\n                                    \"target\": \"equal.first\"\n                                },\n                                {\n"
		+ "                                    \"source\": \".current_index\",\n                                    \"target\": \"equal.second\"\n                                },\n                                {\n                                    \"source\": \"add.output\",\n                                    \"target\": \"if.false_case\"\n                                },\n                                {\n                                    \"source\": \".width\",\n                                    \"target\": \"set_strands_shape.default_size\"\n                                }\n                            ],\n                            \"values\": [\n                                {\n                                    \"valueName\": \"get_from_array.index\",\n                                    \"valueType\": \"long\",\n                                    \"value\": \"2\"\n                                },\n                                {\n                                    \"valueName\": \"get_from_array1.index\",\n                                    \"valueType\": \"long\",\n"
		+ "                                    \"value\": \"1\"\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.strands\",\n                                    \"valueType\": \"Object\",\n                                    \"value\": {}\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.shape\",\n                                    \"valueType\": \"Geometry::StrandShapes\",\n                                    \"value\": \"Ribbon\"\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.screen_aligned\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.default_size\",\n                                    \"valueType\": \"float\",\n"
		+ "                                    \"value\": \"0.0513599999f\"\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.geometry\",\n                                    \"valueType\": \"Object\",\n                                    \"value\": {}\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.set_surface\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.set_displacement\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.set_volume\",\n                                    \"valueType\": \"bool\",\n"
		+ "                                    \"value\": \"true\"\n                                },\n                                {\n                                    \"valueName\": \"constant_surface_mat1.name\",\n                                    \"valueType\": \"string\",\n                                    \"value\": \"\"\n                                },\n                                {\n                                    \"valueName\": \"constant_surface_mat1.color\",\n                                    \"valueType\": \"Math::float3\",\n                                    \"value\": {\n                                        \"x\": \"0f\",\n                                        \"y\": \"0f\",\n                                        \"z\": \"0f\"\n                                    }\n                                },\n                                {\n                                    \"valueName\": \"constant_surface_mat1.transparency\",\n                                    \"valueType\": \"Math::float3\",\n                                    \"value\": {\n"
		+ "                                        \"x\": \"0f\",\n                                        \"y\": \"0f\",\n                                        \"z\": \"0f\"\n                                    }\n                                },\n                                {\n                                    \"valueName\": \"value.value\",\n                                    \"valueType\": \"long\",\n                                    \"value\": \"1\"\n                                }\n                            ],\n                            \"reservedNodeNames\": [\n                                {\n                                    \"name\": \"input\"\n                                }\n                            ],\n                            \"forEachCompound\": {\n                                \"ports\": []\n                            }\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"for_each1\",\n                            \"nodeType\": \"for_each1\",\n"
		+ "                            \"terminalStates\": [\n                                {\n                                    \"name\": \"Core::Graph::terminal::final\",\n                                    \"enabled\": \"true\"\n                                },\n                                {\n                                    \"name\": \"Core::Graph::terminal::proxy\",\n                                    \"enabled\": \"true\"\n                                },\n                                {\n                                    \"name\": \"Core::Graph::terminal::diagnostic\",\n                                    \"enabled\": \"true\"\n                                }\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"744.984 39.2217\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-11.3225 106.339\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"array_size\",\n"
		+ "                            \"nodeType\": \"Core::Array::array_size\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"120.155 -157.583\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"subtract\",\n                            \"nodeType\": \"Core::Math::subtract\",\n                            \"multiInPortNames\": [\n                                \"size\",\n                                \"output1\"\n                            ],\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"431.506 -419.527\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value\",\n                            \"valueType\": \"long\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"99 -530\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array1\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-171.047 -237.573\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n"
		+ "                            \"source\": \".lines\",\n                            \"target\": \"get_from_array.array\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array.index\"\n                        },\n                        {\n                            \"source\": \"get_from_array.value\",\n                            \"target\": \"for_each1.lines\"\n                        },\n                        {\n                            \"source\": \"array_size.size\",\n                            \"target\": \"subtract.first.size\"\n                        },\n                        {\n                            \"source\": \"value.output\",\n                            \"target\": \"subtract.first.output1\"\n                        },\n                        {\n                            \"source\": \"subtract.output\",\n                            \"target\": \"for_each1.max_iterations\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n"
		+ "                            \"target\": \"get_from_array1.index\"\n                        },\n                        {\n                            \"source\": \".lines\",\n                            \"target\": \"get_from_array1.array\"\n                        },\n                        {\n                            \"source\": \"get_from_array1.value\",\n                            \"target\": \"array_size.array\"\n                        },\n                        {\n                            \"source\": \".width\",\n                            \"target\": \"for_each1.width\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n                            \"valueName\": \"for_each1.max_iterations\",\n                            \"valueType\": \"long\",\n                            \"value\": \"10\"\n                        },\n                        {\n                            \"valueName\": \"for_each1.width\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.0513599999f\"\n"
		+ "                        },\n                        {\n                            \"valueName\": \"value.value\",\n                            \"valueType\": \"long\",\n                            \"value\": \"1\"\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        }\n                    ],\n                    \"forEachCompound\": {\n                        \"ports\": []\n                    }\n                }\n            ],\n            \"compoundNodes\": [\n                {\n                    \"nodeName\": \"for_each_spheres\",\n                    \"nodeType\": \"for_each_spheres\",\n                    \"terminalStates\": [\n                        {\n                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                            \"enabled\": \"true\"\n                        }\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-420.702 -873.544\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"array_size\",\n                    \"nodeType\": \"Core::Array::array_size\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-863.669 -530.265\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"array_size1\",\n"
		+ "                    \"nodeType\": \"Core::Array::array_size\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-889.462 158.508\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"for_each_lines\",\n                    \"nodeType\": \"for_each_lines\",\n                    \"terminalStates\": [\n                        {\n                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                            \"enabled\": \"true\"\n                        }\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-454.137 -13.3945\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1552.35 -2526\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value1\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1514.85 -2733.26\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"build_array\",\n                    \"nodeType\": \"Core::Array::build_array\",\n                    \"multiInPortNames\": [\n                        \"output\",\n                        \"output1\",\n                        \"output3\",\n"
		+ "                        \"output5\",\n                        \"output7\",\n                        \"output9\",\n                        \"output11\",\n                        \"output14\",\n                        \"output15\",\n                        \"output17\",\n                        \"output20\",\n                        \"output21\",\n                        \"output23\",\n                        \"output26\",\n                        \"output28\",\n                        \"output29\"\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"1\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1126.85 -2063.34\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"construct_strands\",\n"
		+ "                    \"nodeType\": \"Geometry::Strands::construct_strands\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-621.046 -2324.55\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"terminal\",\n                    \"nodeType\": \"Core::Graph::terminal\",\n                    \"fanInPortNames\": {\n                        \"final\": [],\n                        \"proxy\": [],\n                        \"diagnostic\": [\n                            \"diagnostic_geo\",\n                            \"out_strands\"\n                        ]\n                    },\n                    \"terminalStates\": [\n                        {\n"
		+ "                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                            \"enabled\": \"false\"\n                        }\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"PortExpandedState\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"diagnostic\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"1\"\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"480.829 -2212.33\"\n                        }\n"
		+ "                    ]\n                },\n                {\n                    \"nodeName\": \"construct_points\",\n                    \"nodeType\": \"Geometry::Points::construct_points\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-615.888 -1979.58\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"point_scope\",\n                    \"nodeType\": \"Diagnostic::Display::point_scope\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n"
		+ "                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-321.002 -2005.18\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"set_strands_shape\",\n                    \"nodeType\": \"Geometry::Strands::set_strands_shape\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-25.4666 -2404.51\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"set_geo_property\",\n                    \"nodeType\": \"Geometry::Properties::set_geo_property\",\n"
		+ "                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-316.175 -2376.76\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value2\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1568.72 -2350.42\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value3\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1552.36 -2213\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value4\",\n                    \"valueType\": \"Math::float3\",\n"
		+ "                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1555.18 -2031.33\"\n"
		+ "                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value5\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1534.78 -1838.68\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value6\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1577.95 -1618.86\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value7\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1583.58 -1435.43\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"value8\",\n                    \"valueType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"valuenode_defaultvalue\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"0\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1561.94 -1240.57\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"multiply\",\n                    \"nodeType\": \"Core::Math::multiply\",\n"
		+ "                    \"multiInPortNames\": [\n                        \"array\",\n                        \"port\"\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-779.393 -1522.57\"\n                        }\n                    ]\n                }\n            ],\n            \"connections\": [\n                {\n                    \"source\": \".posers\",\n                    \"target\": \"for_each_spheres.posers\"\n                },\n                {\n                    \"source\": \".posers\",\n                    \"target\": \"array_size.array\"\n                },\n                {\n                    \"source\": \"array_size.size\",\n                    \"target\": \"for_each_spheres.max_iterations\"\n"
		+ "                },\n                {\n                    \"source\": \".global_scale\",\n                    \"target\": \"for_each_spheres.global_radius\"\n                },\n                {\n                    \"source\": \".lines\",\n                    \"target\": \"array_size1.array\"\n                },\n                {\n                    \"source\": \".lines\",\n                    \"target\": \"for_each_lines.lines\"\n                },\n                {\n                    \"source\": \"array_size1.size\",\n                    \"target\": \"for_each_lines.max_iterations\"\n                },\n                {\n                    \"source\": \".width\",\n                    \"target\": \"for_each_lines.width\"\n                },\n                {\n                    \"source\": \".poser_color\",\n                    \"target\": \"for_each_spheres.color\"\n                },\n                {\n                    \"source\": \"build_array.array\",\n                    \"target\": \"construct_strands.point_position\"\n                },\n                {\n                    \"source\": \"build_array.array\",\n"
		+ "                    \"target\": \"construct_points.point_position\"\n                },\n                {\n                    \"source\": \"construct_points.points\",\n                    \"target\": \"point_scope.point_geo\"\n                },\n                {\n                    \"source\": \"point_scope.diagnostic_geo\",\n                    \"target\": \"terminal.diagnostic.diagnostic_geo\"\n                },\n                {\n                    \"source\": \"set_strands_shape.out_strands\",\n                    \"target\": \"terminal.diagnostic.out_strands\"\n                },\n                {\n                    \"source\": \"construct_strands.strands\",\n                    \"target\": \"set_geo_property.geometry\"\n                },\n                {\n                    \"source\": \"set_geo_property.out_geometry\",\n                    \"target\": \"set_strands_shape.strands\"\n                },\n                {\n                    \"source\": \"value1.output\",\n                    \"target\": \"build_array.first.output\"\n                },\n                {\n"
		+ "                    \"source\": \"value.output\",\n                    \"target\": \"build_array.first.output1\"\n                },\n                {\n                    \"source\": \"value2.output\",\n                    \"target\": \"build_array.first.output3\"\n                },\n                {\n                    \"source\": \"value3.output\",\n                    \"target\": \"build_array.first.output5\"\n                },\n                {\n                    \"source\": \"value1.output\",\n                    \"target\": \"build_array.first.output7\"\n                },\n                {\n                    \"source\": \"value4.output\",\n                    \"target\": \"build_array.first.output9\"\n                },\n                {\n                    \"source\": \"value5.output\",\n                    \"target\": \"build_array.first.output11\"\n                },\n                {\n                    \"source\": \"value6.output\",\n                    \"target\": \"build_array.first.output14\"\n                },\n                {\n                    \"source\": \"value7.output\",\n"
		+ "                    \"target\": \"build_array.first.output15\"\n                },\n                {\n                    \"source\": \"value8.output\",\n                    \"target\": \"build_array.first.output17\"\n                },\n                {\n                    \"source\": \"value7.output\",\n                    \"target\": \"build_array.first.output20\"\n                },\n                {\n                    \"source\": \"value3.output\",\n                    \"target\": \"build_array.first.output21\"\n                },\n                {\n                    \"source\": \"value2.output\",\n                    \"target\": \"build_array.first.output23\"\n                },\n                {\n                    \"source\": \"value6.output\",\n                    \"target\": \"build_array.first.output26\"\n                },\n                {\n                    \"source\": \"value5.output\",\n                    \"target\": \"build_array.first.output28\"\n                },\n                {\n                    \"source\": \"value.output\",\n                    \"target\": \"build_array.first.output29\"\n"
		+ "                },\n                {\n                    \"source\": \"build_array.array\",\n                    \"target\": \"multiply.first.array\"\n                },\n                {\n                    \"source\": \"multiply.output\",\n                    \"target\": \".out_cubeShape_vectors\"\n                },\n                {\n                    \"source\": \".mainPoser_size\",\n                    \"target\": \"multiply.first.port\"\n                },\n                {\n                    \"source\": \".radius\",\n                    \"target\": \"for_each_spheres.radius\"\n                }\n            ],\n            \"values\": [\n                {\n                    \"valueName\": \"for_each_spheres.max_iterations\",\n                    \"valueType\": \"long\",\n                    \"value\": \"0\"\n                },\n                {\n                    \"valueName\": \"for_each_spheres.global_radius\",\n                    \"valueType\": \"float\",\n                    \"value\": \"1f\"\n                },\n                {\n                    \"valueName\": \"for_each_spheres.radius\",\n"
		+ "                    \"valueType\": \"array<float>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"for_each_spheres.color\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"0f\",\n                        \"y\": \"1f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"for_each_lines.max_iterations\",\n                    \"valueType\": \"long\",\n                    \"value\": \"10\"\n                },\n                {\n                    \"valueName\": \"for_each_lines.lines\",\n                    \"valueType\": \"array<array<Math::float4x4>>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"for_each_lines.width\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0513599999f\"\n                },\n                {\n                    \"valueName\": \"value.value\",\n                    \"valueType\": \"Math::float3\",\n"
		+ "                    \"value\": {\n                        \"x\": \"-1f\",\n                        \"y\": \"1f\",\n                        \"z\": \"-1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value1.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"-1f\",\n                        \"y\": \"1f\",\n                        \"z\": \"1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"point_scope.default_size\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0469999984f\"\n                },\n                {\n                    \"valueName\": \"set_strands_shape.shape\",\n                    \"valueType\": \"Geometry::StrandShapes\",\n                    \"value\": \"Ribbon\"\n                },\n                {\n                    \"valueName\": \"set_strands_shape.screen_aligned\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"true\"\n                },\n"
		+ "                {\n                    \"valueName\": \"set_strands_shape.default_size\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0188200008f\"\n                },\n                {\n                    \"valueName\": \"set_geo_property.property\",\n                    \"valueType\": \"string\",\n                    \"value\": \"color\"\n                },\n                {\n                    \"valueName\": \"set_geo_property.default\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"0f\",\n                        \"y\": \"0f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"set_geo_property.data\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"0f\",\n                        \"y\": \"0f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value2.value\",\n"
		+ "                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"1f\",\n                        \"y\": \"1f\",\n                        \"z\": \"-1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value3.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"1f\",\n                        \"y\": \"1f\",\n                        \"z\": \"1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value4.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"-1f\",\n                        \"y\": \"-1f\",\n                        \"z\": \"1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value5.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"-1f\",\n                        \"y\": \"-1f\",\n"
		+ "                        \"z\": \"-1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value6.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"1f\",\n                        \"y\": \"-1f\",\n                        \"z\": \"-1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value7.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"1f\",\n                        \"y\": \"-1f\",\n                        \"z\": \"1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"value8.value\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"-1f\",\n                        \"y\": \"-1f\",\n                        \"z\": \"1f\"\n                    }\n                }\n            ],\n            \"reservedNodeNames\": [\n                {\n                    \"name\": \"input\"\n"
		+ "                },\n                {\n                    \"name\": \"output\"\n                }\n            ]\n        }\n    ]\n}\n");
	setAttr -k on ".global_scale" 1;
	setAttr -s 2 ".lines";
	setAttr -s 3 ".lines[0].lines_A";
	setAttr -k on ".lines[0].lines_A[0]";
	setAttr -k on ".lines[0].lines_A[1]";
	setAttr -k on ".lines[0].lines_A[2]";
	setAttr -k on ".lines[0].lines_A";
	setAttr -k on ".lines";
	setAttr -k on ".width";
	setAttr -k on ".poser_color" -type "float3" 0 1 0 ;
	setAttr -s 16 ".out_cubeShape_vectors";
	setAttr -k on ".mainPoser_size";
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
		-3.1034317370559914e-17 0.2190447443687745 -0.21904474436877405
		-7.4484186917969207e-17 2.0174131519489299e-17 -0.30977604825286809
		-3.1034317370559914e-17 -0.21904474436877427 -0.21904474436877427
		-6.2068634741119827e-17 -0.30977604825286809 -8.9765348798859531e-17
		-3.1034317370559914e-17 -0.21904474436877427 0.21904474436877419
		-3.6547562323430174e-17 -3.7825694343907875e-17 0.30977604825286809
		-3.1034317370559914e-17 0.21904474436877419 0.21904474436877427
		6.2068634741119827e-17 0.30977604825286809 1.6638131980742933e-16
		-3.1034317370559914e-17 0.2190447443687745 -0.21904474436877405
		-7.4484186917969207e-17 2.0174131519489299e-17 -0.30977604825286809
		-3.1034317370559914e-17 -0.21904474436877427 -0.21904474436877427
		;
createNode joint -n "a_fkJoint" -p "fk_a";
	rename -uid "B673D9CE-4705-FEC9-E5E4-FBA67C7C3CE8";
	setAttr ".v" no;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "fk_b_group" -p "fk_a";
	rename -uid "B4134CB6-45BF-8E20-8BFA-67A60CDE617D";
	setAttr ".t" -type "double3" 5.5365397395729996 0 1.6653345369377348e-16 ;
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
		-2.547451261345112e-16 0.21904474436877464 -0.21904474436877405
		-2.0970515885500088e-16 2.9241467139708479e-17 -0.30977604825286809
		-1.9267649139339124e-16 -0.21904474436877405 -0.21904474436877427
		-3.1681376087563124e-16 -0.30977604825286809 -8.9765348798859531e-17
		-1.6164217402283144e-16 -0.21904474436877419 0.21904474436877419
		-1.7176853426046168e-16 -2.8758358723688627e-17 0.30977604825286809
		-2.857794435050709e-16 0.21904474436877419 0.21904474436877427
		-1.9267649139339124e-16 0.30977604825286809 1.6638131980742933e-16
		-2.547451261345112e-16 0.21904474436877464 -0.21904474436877405
		-2.0970515885500088e-16 2.9241467139708479e-17 -0.30977604825286809
		-1.9267649139339124e-16 -0.21904474436877405 -0.21904474436877427
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
		2.1307738587875893e-06 0.21904628879437713 -0.2190438861543561
		1.6234850609484628e-07 0.30977823240050245 -7.6562895914411465e-06
		-1.9011783995915047e-06 0.21904628879437743 0.21903305852577848
		-2.8510207832508149e-06 8.9782728953588917e-17 0.30976717826480565
		-2.1307738587565582e-06 -0.21904628879437735 0.21904388615435599
		-1.6234850603277674e-07 -0.30977823240050245 7.6562895915698159e-06
		1.9011783995682297e-06 -0.21904628879437743 -0.21903305852577823
		2.8510207832508149e-06 -1.6639924010955204e-16 -0.30976717826480565
		2.1307738587875893e-06 0.21904628879437713 -0.2190438861543561
		1.6234850609484628e-07 0.30977823240050245 -7.6562895914411465e-06
		-1.9011783995915047e-06 0.21904628879437743 0.21903305852577848
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
		5.3472762933672291 0.10690376012539186 -1.4312505259630082
		5.2210507392883301 0.31919053196907038 -4.5414595603942871
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
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090820729553665269 -1.3637300684592056e-17 -0.090820729553665103
		1.0159237353814604e-16 -1.1333790392926006e-17 -0.12843990747941253
		-0.090820729553665172 -1.3637300684592056e-17 -0.090820729553665172
		-0.12843990747941253 -1.9198466471798223e-17 -9.5087817910639122e-17
		-0.090820729553665186 -2.475963225900441e-17 0.090820729553665158
		7.7544380448519612e-17 -2.706314255067045e-17 0.12843990747941253
		0.090820729553665103 -2.475963225900441e-17 0.090820729553665186
		0.12843990747941253 -1.9198466471798232e-17 1.1116178823465539e-17
		0.090820729553665269 -1.3637300684592056e-17 -0.090820729553665103
		1.0159237353814604e-16 -1.1333790392926006e-17 -0.12843990747941253
		-0.090820729553665172 -1.3637300684592056e-17 -0.090820729553665172
		;
createNode nurbsCurve -n "middleOffsetShape1" -p "middleOffset";
	rename -uid "A5601D56-4004-C376-D9AA-0F90081A3F82";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.090820729553665269 0.090820729553665158 -7.2728002835791145e-17
		1.0159237353814604e-16 0.12843990747941253 -7.8777628044252078e-17
		-0.090820729553665172 0.090820729553665186 -7.272800283579117e-17
		-0.12843990747941253 1.8147090190144484e-17 -5.8122915610250644e-17
		-0.090820729553665186 -0.090820729553665172 -4.3517828384710111e-17
		7.7544380448519612e-17 -0.12843990747941253 -3.7468203176249173e-17
		0.090820729553665103 -0.090820729553665186 -4.3517828384710111e-17
		0.12843990747941253 -8.8056906543960188e-17 -5.8122915610250632e-17
		0.090820729553665269 0.090820729553665158 -7.2728002835791145e-17
		1.0159237353814604e-16 0.12843990747941253 -7.8777628044252078e-17
		-0.090820729553665172 0.090820729553665186 -7.272800283579117e-17
		;
createNode nurbsCurve -n "middleOffsetShape2" -p "middleOffset";
	rename -uid "6A4EF5A9-4580-44D7-40EB-DEBAD409E36A";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.3085091844604184e-16 0.090820729553665269 -0.090820729553665103
		1.0838115514162905e-16 -3.3725039366968688e-17 -0.12843990747941253
		9.0518412420548362e-17 -0.090820729553665186 -0.090820729553665172
		8.7726442707627571e-17 -0.12843990747941253 -9.5341587485008571e-17
		1.0164074399496077e-16 -0.090820729553665186 0.090820729553665158
		1.2411050729937351e-16 -5.7773032456595119e-17 0.12843990747941253
		1.419732500204542e-16 0.090820729553665158 0.090820729553665186
		1.44765219733375e-16 0.12843990747941253 1.0862409249096034e-17
		1.3085091844604184e-16 0.090820729553665269 -0.090820729553665103
		1.0838115514162905e-16 -3.3725039366968688e-17 -0.12843990747941253
		9.0518412420548362e-17 -0.090820729553665186 -0.090820729553665172
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
	setAttr ".lr" -type "double3" 0 -9.6786242701566927 0 ;
	setAttr ".o" -type "double3" 0 2.8824484474179729e-06 0 ;
	setAttr ".rsrr" -type "double3" 0 -26.56505117707799 0 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "pins_group" -p "controls";
	rename -uid "FD643339-443D-E98C-9FCE-2592AABECC84";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 0 -15.42933456495283 0 ;
createNode transform -n "top_pin" -p "pins_group";
	rename -uid "EA59F9CB-4141-EC93-E886-41AC19EAA107";
	setAttr -l on -k off ".v";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode nurbsCurve -n "top_pinShape" -p "top_pin";
	rename -uid "BE57283E-4D81-B70E-3EDF-1788B8D4D9CC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		0.41345716811855698 0 0
		-0.41345716811855698 0 0
		0 0 0
		0 0.41345716811855698 0
		0 -0.41345716811855698 0
		0 0 0
		0 0 -0.41345716811855698
		0 0 0.41345716811855698
		;
createNode parentConstraint -n "top_pin_parentConstraint1" -p "top_pin";
	rename -uid "A63517F2-4BA5-3E53-0016-C88834E321B1";
	addAttr -ci true -k true -sn "w0" -ln "root_outJointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0 15.436469741390326 0 ;
	setAttr ".rsrr" -type "double3" 0 15.436469741390326 0 ;
	setAttr -k on ".w0";
createNode transform -n "bottom_pin" -p "pins_group";
	rename -uid "A7329955-4CAC-0B0D-B9AF-F0881A56541E";
	setAttr -l on -k off ".v";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode nurbsCurve -n "bottom_pinShape" -p "bottom_pin";
	rename -uid "A747EA22-4950-D417-0A89-66B7BA6D5FFC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 1 2 3 4 5 6 7
		8
		0.41345716811855698 0 0
		-0.41345716811855698 0 0
		0 0 0
		0 0.41345716811855698 0
		0 -0.41345716811855698 0
		0 0 0
		0 0 -0.41345716811855698
		0 0 0.41345716811855698
		;
createNode parentConstraint -n "bottom_pin_parentConstraint1" -p "bottom_pin";
	rename -uid "84C78425-4E93-D178-AFDA-E0A409BA37F7";
	addAttr -ci true -k true -sn "w0" -ln "middle_outJointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0 -15.436469741473811 0 ;
	setAttr ".rst" -type "double3" 1.9999921977391637 0 -0.55225948740616859 ;
	setAttr ".rsrr" -type "double3" 0 -15.436469741473811 0 ;
	setAttr -k on ".w0";
createNode transform -n "system" -p "mod";
	rename -uid "7102D168-4D4B-BE49-8B7E-BAB38F77CF68";
	setAttr ".v" no;
createNode transform -n "ik_joints" -p "system";
	rename -uid "938B8457-4864-F585-B28C-AE93DB6ED24B";
createNode joint -n "a_ikJoint" -p "ik_joints";
	rename -uid "4F308A4D-4D96-99C3-4172-EE832B95A1E7";
	setAttr ".oc" 6;
	setAttr ".r" -type "double3" 8.3286793922127514e-07 -1.3647947662750073e-15 1.8777762074072653e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "b_ikJoint" -p "a_ikJoint";
	rename -uid "36C349D0-4D4F-1ABF-EC19-7189F801D31E";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 5.5365395545959473 0 -1.6653345369377336e-15 ;
	setAttr ".r" -type "double3" 0 -20.869117343537592 0 ;
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
	setAttr ".lr" -type "double3" -3.9272695019075341 10.845029719023875 -0.099211388797217498 ;
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
	setAttr ".lr" -type "double3" 0 -25.869117343537585 0 ;
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
	setAttr ".lr" -type "double3" 4.0463556754037988 14.981665803736288 1.1453154993493551 ;
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
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "root_volume_outJoint" -p "root_outJoint";
	rename -uid "37F35170-42F2-A276-7266-3C82785B7C8E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
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
	rename -uid "A38AD6A6-47D2-3019-17BE-8690EACC9D75";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "EED6ACB1-47B1-0643-E672-D0B8676477BF";
	setAttr ".cdl" 5;
	setAttr -s 5 ".dli[1:4]"  5 3 2 4;
createNode displayLayer -n "defaultLayer";
	rename -uid "B15E876D-47C6-71D4-FBBA-048077D00CDF";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "C6190A91-4291-4997-9671-2D97C58A361E";
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
	setAttr -s 2 ".i";
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
	setAttr -s 4 ".dsm";
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
createNode objectSet -n "outJointsSet";
	rename -uid "912A1DF4-4B95-53A7-B6C0-3EBE2DE7AFF1";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
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
	setAttr -s 2 ".i1[0:1]"  1 1.55070281;
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
	rename -uid "6D517175-4640-02DA-6D3F-F2A9ECA2B4B3";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "EE55C626-4BBB-8513-118C-208B2EEEC5AC";
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
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "5E4E3357-4CB3-8EF4-BD3E-B38F70A78922";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -2385.0343805558418 -870.23806065794133 ;
	setAttr ".tgi[0].vh" -type "double2" -1272.1083312652206 188.09523062100516 ;
	setAttr -s 8 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1808.5714111328125;
	setAttr ".tgi[0].ni[0].y" -335.71429443359375;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -2422.857177734375;
	setAttr ".tgi[0].ni[1].y" -147.14285278320312;
	setAttr ".tgi[0].ni[1].nvs" 18305;
	setAttr ".tgi[0].ni[2].x" -1501.4285888671875;
	setAttr ".tgi[0].ni[2].y" -502.85714721679688;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -2421.86865234375;
	setAttr ".tgi[0].ni[3].y" -457.77679443359375;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" -1808.5714111328125;
	setAttr ".tgi[0].ni[4].y" -234.28572082519531;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -1617.0753173828125;
	setAttr ".tgi[0].ni[5].y" -690.0511474609375;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -2115.71435546875;
	setAttr ".tgi[0].ni[6].y" -298.57144165039062;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -1501.4285888671875;
	setAttr ".tgi[0].ni[7].y" -198.57142639160156;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -3103.2903839459773 -51.193732442654571 ;
	setAttr ".tgi[1].vh" -type "double2" -2126.8198230999451 877.37767008304775 ;
	setAttr -s 6 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -2831.428466796875;
	setAttr ".tgi[1].ni[0].y" 250;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" -2757.4921875;
	setAttr ".tgi[1].ni[1].y" 511.83145141601562;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" -2831.428466796875;
	setAttr ".tgi[1].ni[2].y" 380;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" -2978.920654296875;
	setAttr ".tgi[1].ni[3].y" 511.83145141601562;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" -3069.677001953125;
	setAttr ".tgi[1].ni[4].y" 674.856689453125;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" -2620.67236328125;
	setAttr ".tgi[1].ni[5].y" 679.49578857421875;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -11138.690033578701 -499.99998013178589 ;
	setAttr ".tgi[2].vh" -type "double2" -9755.3567552140939 815.47615807207944 ;
	setAttr -s 16 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" -9810.75390625;
	setAttr ".tgi[2].ni[0].y" 157.79374694824219;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[2].ni[1].x" -10883.251953125;
	setAttr ".tgi[2].ni[1].y" -1.9770444631576538;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" -10162.5869140625;
	setAttr ".tgi[2].ni[2].y" 170.27017211914062;
	setAttr ".tgi[2].ni[2].nvs" 18305;
	setAttr ".tgi[2].ni[3].x" -10444.90625;
	setAttr ".tgi[2].ni[3].y" 463.21133422851562;
	setAttr ".tgi[2].ni[3].nvs" 18769;
	setAttr ".tgi[2].ni[4].x" -9787.5517578125;
	setAttr ".tgi[2].ni[4].y" -445.85208129882812;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" -11025.0205078125;
	setAttr ".tgi[2].ni[5].y" 902.7591552734375;
	setAttr ".tgi[2].ni[5].nvs" 18305;
	setAttr ".tgi[2].ni[6].x" -11176.9580078125;
	setAttr ".tgi[2].ni[6].y" -178.30081176757812;
	setAttr ".tgi[2].ni[6].nvs" 18305;
	setAttr ".tgi[2].ni[7].x" -11099.359375;
	setAttr ".tgi[2].ni[7].y" 552.63897705078125;
	setAttr ".tgi[2].ni[7].nvs" 18305;
	setAttr ".tgi[2].ni[8].x" -10147.142578125;
	setAttr ".tgi[2].ni[8].y" -871.4285888671875;
	setAttr ".tgi[2].ni[8].nvs" 18304;
	setAttr ".tgi[2].ni[9].x" -10146.142578125;
	setAttr ".tgi[2].ni[9].y" -412.97683715820312;
	setAttr ".tgi[2].ni[9].nvs" 18305;
	setAttr ".tgi[2].ni[10].x" -9941.4208984375;
	setAttr ".tgi[2].ni[10].y" 812.82220458984375;
	setAttr ".tgi[2].ni[10].nvs" 18769;
	setAttr ".tgi[2].ni[11].x" -11187.3203125;
	setAttr ".tgi[2].ni[11].y" 252.31036376953125;
	setAttr ".tgi[2].ni[11].nvs" 18305;
	setAttr ".tgi[2].ni[12].x" -9779.7763671875;
	setAttr ".tgi[2].ni[12].y" -199.97523498535156;
	setAttr ".tgi[2].ni[12].nvs" 18304;
	setAttr ".tgi[2].ni[13].x" -10600.4150390625;
	setAttr ".tgi[2].ni[13].y" 9.822174072265625;
	setAttr ".tgi[2].ni[13].nvs" 18304;
	setAttr ".tgi[2].ni[14].x" -10516.3681640625;
	setAttr ".tgi[2].ni[14].y" -111.57782745361328;
	setAttr ".tgi[2].ni[14].nvs" 18305;
	setAttr ".tgi[2].ni[15].x" -10156.0185546875;
	setAttr ".tgi[2].ni[15].y" -178.22796630859375;
	setAttr ".tgi[2].ni[15].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr -av ".unw" 1;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr ".etmr" no;
	setAttr ".tmr" 4096;
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
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 71 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
	setAttr -s 2 ".r";
select -ne :standardSurface1;
	setAttr ".b" 0.80000001192092896;
	setAttr ".bc" -type "float3" 1 1 1 ;
	setAttr ".s" 0.20000000298023224;
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -cb on ".imfkey";
	setAttr -k on ".gama";
	setAttr -k on ".an";
	setAttr -cb on ".ar";
	setAttr ".fs" 0.96;
	setAttr ".ef" 9.6;
	setAttr -av -k on ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep" 1;
	setAttr -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".pff";
	setAttr -cb on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -cb on ".sosl";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w" 640;
	setAttr -av ".h" 480;
	setAttr -av ".pa";
	setAttr -av -k on ".al";
	setAttr -av ".dar" 1.3333332538604736;
	setAttr -av -k on ".ldar";
	setAttr -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -k on ".isu";
	setAttr -k on ".pdu";
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
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -av -k off ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off ".eeaa";
	setAttr -av -k off ".engm";
	setAttr -av -k off ".mes";
	setAttr -av -k off ".emb";
	setAttr -av -k off ".mbbf";
	setAttr -av -k off ".mbs";
	setAttr -av -k off ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off ".enpt";
	setAttr -av -k off ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off ".twa";
	setAttr -av -k off ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".gsn";
	setAttr -k on ".gsv";
	setAttr -s 4 ".sol";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[0]" "mainPoserShape.cp[0]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[1]" "mainPoserShape.cp[1]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[2]" "mainPoserShape.cp[2]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[3]" "mainPoserShape.cp[3]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[4]" "mainPoserShape.cp[4]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[5]" "mainPoserShape.cp[5]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[6]" "mainPoserShape.cp[6]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[7]" "mainPoserShape.cp[7]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[8]" "mainPoserShape.cp[8]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[9]" "mainPoserShape.cp[9]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[10]" "mainPoserShape.cp[10]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[11]" "mainPoserShape.cp[11]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[12]" "mainPoserShape.cp[12]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[13]" "mainPoserShape.cp[13]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[14]" "mainPoserShape.cp[14]"
		;
connectAttr "posers_bifrostGraphShape.out_cubeShape_vectors[15]" "mainPoserShape.cp[15]"
		;
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
connectAttr "ik_aim_decomposeMatrix.ot" "ik_aim_controlInitLoc.t";
connectAttr "decomposeMatrix45.or" "ik_aim_controlInitLoc.r";
connectAttr "mirror_condition.ocr" "ik_aim_controlInitLoc.sz";
connectAttr "decomposeMatrix25.ot" "ik_end_controlInitLoc.t";
connectAttr "unitConversion437.o" "ik_end_controlInitLoc.r";
connectAttr "mirror_condition.ocr" "ik_end_controlInitLoc.sz";
connectAttr "makeNurbSphere2.os" "middle_poserNurbsShape.cr";
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
connectAttr "makeNurbSphere3.os" "end_poserNurbsShape.cr";
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
connectAttr "end_poser.tx" "end_pose_loc.tx";
connectAttr "end_poser.ty" "end_pose_loc.ty";
connectAttr "end_poser.tz" "end_pose_loc.tz";
connectAttr "size_multiplyDivide.oy" "posers_bifrostGraphShape.mainPoser_size";
connectAttr "root_poser.wm" "posers_bifrostGraphShape.lines[0].lines_A[0]";
connectAttr "middle_poser.wm" "posers_bifrostGraphShape.lines[0].lines_A[1]";
connectAttr "end_poser.wm" "posers_bifrostGraphShape.lines[0].lines_A[2]";
connectAttr "size_multiplyDivide.oz" "posers_bifrostGraphShape.width";
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
connectAttr "root_connector_decomposeMatrix.ory" "controls.ry";
connectAttr "root_connector_decomposeMatrix.orz" "controls.rz";
connectAttr "root_connector_decomposeMatrix.orx" "controls.rx";
connectAttr "root_connector_decomposeMatrix.osy" "controls.sy";
connectAttr "root_connector_decomposeMatrix.osz" "controls.sz";
connectAttr "root_connector_decomposeMatrix.osx" "controls.sx";
connectAttr "root_connector_decomposeMatrix.oty" "controls.ty";
connectAttr "root_connector_decomposeMatrix.otz" "controls.tz";
connectAttr "root_connector_decomposeMatrix.otx" "controls.tx";
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
connectAttr "top_pin_parentConstraint1.ctx" "top_pin.tx" -l on;
connectAttr "top_pin_parentConstraint1.cty" "top_pin.ty" -l on;
connectAttr "top_pin_parentConstraint1.ctz" "top_pin.tz" -l on;
connectAttr "top_pin_parentConstraint1.crx" "top_pin.rx" -l on;
connectAttr "top_pin_parentConstraint1.cry" "top_pin.ry" -l on;
connectAttr "top_pin_parentConstraint1.crz" "top_pin.rz" -l on;
connectAttr "top_pin.ro" "top_pin_parentConstraint1.cro";
connectAttr "top_pin.pim" "top_pin_parentConstraint1.cpim";
connectAttr "top_pin.rp" "top_pin_parentConstraint1.crp";
connectAttr "top_pin.rpt" "top_pin_parentConstraint1.crt";
connectAttr "root_outJoint.t" "top_pin_parentConstraint1.tg[0].tt";
connectAttr "root_outJoint.rp" "top_pin_parentConstraint1.tg[0].trp";
connectAttr "root_outJoint.rpt" "top_pin_parentConstraint1.tg[0].trt";
connectAttr "root_outJoint.r" "top_pin_parentConstraint1.tg[0].tr";
connectAttr "root_outJoint.ro" "top_pin_parentConstraint1.tg[0].tro";
connectAttr "root_outJoint.s" "top_pin_parentConstraint1.tg[0].ts";
connectAttr "root_outJoint.pm" "top_pin_parentConstraint1.tg[0].tpm";
connectAttr "root_outJoint.jo" "top_pin_parentConstraint1.tg[0].tjo";
connectAttr "top_pin_parentConstraint1.w0" "top_pin_parentConstraint1.tg[0].tw";
connectAttr "bottom_pin_parentConstraint1.ctx" "bottom_pin.tx" -l on;
connectAttr "bottom_pin_parentConstraint1.cty" "bottom_pin.ty" -l on;
connectAttr "bottom_pin_parentConstraint1.ctz" "bottom_pin.tz" -l on;
connectAttr "bottom_pin_parentConstraint1.crx" "bottom_pin.rx" -l on;
connectAttr "bottom_pin_parentConstraint1.cry" "bottom_pin.ry" -l on;
connectAttr "bottom_pin_parentConstraint1.crz" "bottom_pin.rz" -l on;
connectAttr "bottom_pin.ro" "bottom_pin_parentConstraint1.cro";
connectAttr "bottom_pin.pim" "bottom_pin_parentConstraint1.cpim";
connectAttr "bottom_pin.rp" "bottom_pin_parentConstraint1.crp";
connectAttr "bottom_pin.rpt" "bottom_pin_parentConstraint1.crt";
connectAttr "middle_outJoint.t" "bottom_pin_parentConstraint1.tg[0].tt";
connectAttr "middle_outJoint.rp" "bottom_pin_parentConstraint1.tg[0].trp";
connectAttr "middle_outJoint.rpt" "bottom_pin_parentConstraint1.tg[0].trt";
connectAttr "middle_outJoint.r" "bottom_pin_parentConstraint1.tg[0].tr";
connectAttr "middle_outJoint.ro" "bottom_pin_parentConstraint1.tg[0].tro";
connectAttr "middle_outJoint.s" "bottom_pin_parentConstraint1.tg[0].ts";
connectAttr "middle_outJoint.pm" "bottom_pin_parentConstraint1.tg[0].tpm";
connectAttr "middle_outJoint.jo" "bottom_pin_parentConstraint1.tg[0].tjo";
connectAttr "bottom_pin_parentConstraint1.w0" "bottom_pin_parentConstraint1.tg[0].tw"
		;
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
connectAttr "end_poser.wm" "multMatrix22.i[0]";
connectAttr "root_poserOrient.wim" "multMatrix22.i[1]";
connectAttr "end_poser.wm" "fk_b_group_multMatrix.i[0]";
connectAttr "middle_poserOrient.wim" "fk_b_group_multMatrix.i[1]";
connectAttr "fk_b_group_multMatrix.o" "fk_b_group_decomposeMatrix.imat";
connectAttr "ik_end_out_rot.wm" "decomposeMatrix31.imat";
connectAttr "ik_end_out.wm" "multMatrix29.i[0]";
connectAttr "end_ikJoint.pim" "multMatrix29.i[1]";
connectAttr "multMatrix29.o" "decomposeMatrix33.imat";
connectAttr "control.iog" "moduleControlSet.dsm" -na;
connectAttr "middleOffset.iog" "moduleControlSet.dsm" -na;
connectAttr "top_pin.iog" "moduleControlSet.dsm" -na;
connectAttr "bottom_pin.iog" "moduleControlSet.dsm" -na;
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
connectAttr "outJointsSet.msg" "sets.dnsm" -na;
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
connectAttr "root_outJoint.iog" "outJointsSet.dsm" -na;
connectAttr "middle_outJoint.iog" "outJointsSet.dsm" -na;
connectAttr "end_outJoint.iog" "outJointsSet.dsm" -na;
connectAttr "middle_volume_outJoint.iog" "outJointsSet.dsm" -na;
connectAttr "root_volume_outJoint.iog" "outJointsSet.dsm" -na;
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
connectAttr "mainPoser.wm" "control_group_multMatrix.i[0]";
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
connectAttr "posers_bifrostGraphShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "mainPoserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "makeNurbSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "input.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "size_multiplyDivide.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "root_connector.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "root_poserOrientShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "root_connectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "root_poserOrient_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "root_poserOrient.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "root_connector_init.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "mainPoser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "makeNurbSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn";
connectAttr "size_multiplyDivide.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "end_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn";
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn";
connectAttr "middle_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn";
connectAttr "end_poser_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "makeNurbSphere3.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn";
connectAttr "posers_bifrostGraphShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn";
connectAttr "middle_poserNurbsShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn"
		;
connectAttr "multDoubleLinear438.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[13].dn"
		;
connectAttr "size_multiplyDivide1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[14].dn"
		;
connectAttr "makeNurbSphere2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[15].dn"
		;
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
connectAttr "posers_bifrostGraphShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
connectAttr "ikRPsolver1.msg" ":ikSystem.sol" -na;
// End of limb.ma
