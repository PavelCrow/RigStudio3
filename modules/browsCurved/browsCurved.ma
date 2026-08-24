//Maya ASCII 2025ff03 scene
//Name: browsCurved.ma
//Last modified: Tue, Aug 18, 2026 05:30:04 AM
//Codeset: 1251
requires maya "2025ff03";
requires -nodeType "sweepMeshCreator" -dataType "sweepMeshData" -dataType "sweepProfileData"
		 "sweep" "1.0";
requires -nodeType "ngst2SkinLayerData" -dataType "ngst2SkinLayerDataStorage" "ngSkinTools2" "2.4.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2025";
fileInfo "version" "2025";
fileInfo "cutIdentifier" "202505300603-a12e894a3d";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "5025893E-4D51-12D0-2BFD-F492139DD18C";
createNode transform -n "mod";
	rename -uid "A8281E66-4053-4FC7-AA21-27BF6ABE5693";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "5398EABE-47D0-16C1-DA73-F0819DD934A9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 14.11026115562764 6.6996021718382446 ;
createNode transform -n "mainPoser" -p "posers";
	rename -uid "51616D80-472B-390A-B2E9-3AB55B869EED";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineSize" -ln "lineSize" -dv 0.1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0 3.941971540721589 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 2.1;
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.2;
	setAttr -k on ".lineSize";
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
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
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
createNode transform -n "mid_poser" -p "mainPoser";
	rename -uid "B091D11C-4E24-0F92-F931-05A6C1EC2EF8";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.30999999999999994;
createNode nurbsSurface -n "mid_poserNurbsShape" -p "mid_poser";
	rename -uid "00C5A728-4FDB-8CB5-2089-218F39A9BEBD";
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
createNode transform -n "mid_poserOrient" -p "mid_poser";
	rename -uid "515E3940-4EFB-65C0-13BB-BCAB9460B8E1";
createNode locator -n "mid_poserOrientShape" -p "mid_poserOrient";
	rename -uid "7CCE5CBE-4C42-46DC-6507-0D99B9B3CC01";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "mid_initLoc" -p "mid_poserOrient";
	rename -uid "79A90BFA-47C3-8748-1C2D-E5969034CF53";
	setAttr ".v" no;
createNode locator -n "mid_initLocShape" -p "mid_initLoc";
	rename -uid "16D4EC90-4FF1-B665-C188-8D8E10455EB7";
	setAttr -k off ".v";
createNode transform -n "full_mainPoser" -p "mainPoser";
	rename -uid "29D28744-4771-9E9F-98AC-2C99D7E7F5FF";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 2.8286085959132121 0.099952977070245197 0.36819863219810289 ;
	setAttr ".r" -type "double3" 0 21.272777163099956 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.33999999999999986;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "full_mainPoserShape" -p "full_mainPoser";
	rename -uid "789B178F-4E5C-4513-D879-37ABC17A4C81";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "full_mainPoserShapeOrig" -p "full_mainPoser";
	rename -uid "89695C9B-4FDD-ADE8-6F16-879A1FD260D7";
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
createNode transform -n "full_mainPoser_clusterHandle" -p "full_mainPoser";
	rename -uid "E93B8BEC-4A29-1DF4-4BE3-EDBF1C133C3F";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "full_mainPoser_clusterHandleShape" -p "full_mainPoser_clusterHandle";
	rename -uid "EA50F7BD-4964-4A49-43B9-B2BC9686ECD3";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "in_mainPoser" -p "full_mainPoser";
	rename -uid "E89309D6-426D-2AD5-F8AD-4A98B2CD697C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" -1.3354253250093344 -0.24199101945904999 -0.28370001952927204 ;
	setAttr ".r" -type "double3" 0 -27.690386205130419 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "in_mainPoserShape" -p "in_mainPoser";
	rename -uid "B352A9B1-4E62-93C9-0BDE-729A4CC95E2C";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "in_mainPoserShapeOrig" -p "in_mainPoser";
	rename -uid "27701078-45A7-AF24-EA8B-B2940BE34F3B";
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
createNode transform -n "in_mainPoser_clusterHandle" -p "in_mainPoser";
	rename -uid "F7CFB84C-45D5-79A1-EA79-D1B7216B854E";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "in_mainPoser_clusterHandleShape" -p "in_mainPoser_clusterHandle";
	rename -uid "CA4E5EF6-4D51-BB3C-0A0C-0A9701673EEB";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "local_1_poser" -p "in_mainPoser";
	rename -uid "59AF5662-4A86-8E0E-CB03-67A02A767590";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" -0.32340101815338468 -0.068755770089033177 0.025853861556962038 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_1_poserNurbsShape" -p "local_1_poser";
	rename -uid "6B519E91-43D1-C063-ADF7-56AB3C5BE636";
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
createNode transform -n "local_1_poserOrient" -p "local_1_poser";
	rename -uid "ECA22652-4FCF-7EF4-F9E1-E5BFEB03689C";
createNode locator -n "local_1_poserOrientShape" -p "local_1_poserOrient";
	rename -uid "C756770A-47D8-10E3-BA10-C88E94A99566";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_1_initLoc" -p "local_1_poserOrient";
	rename -uid "BE00A170-4398-7BD7-C1B2-9AAD84597A84";
	setAttr ".v" no;
createNode locator -n "local_1_initLocShape" -p "local_1_initLoc";
	rename -uid "CA3C43A0-4E1F-55B3-D36F-41ABD0B8CC77";
	setAttr -k off ".v";
createNode transform -n "local_2_poser" -p "in_mainPoser";
	rename -uid "EF9587CC-4E97-C1A3-35F1-4F8D50CFE504";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0.30550207852017885 0.042652179486060343 0.039254584339433456 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_2_poserNurbsShape" -p "local_2_poser";
	rename -uid "EBFC360D-4370-5E5F-84AF-83ABD194B699";
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
createNode transform -n "local_2_poserOrient" -p "local_2_poser";
	rename -uid "B79E60B0-4F36-7338-9200-FBA0EFB94775";
createNode locator -n "local_2_poserOrientShape" -p "local_2_poserOrient";
	rename -uid "BD9C173D-45F4-59C0-3324-FDAE056F7FBB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_2_initLoc" -p "local_2_poserOrient";
	rename -uid "2A410706-46CF-A731-51B4-ACAF29C1B322";
	setAttr ".v" no;
createNode locator -n "local_2_initLocShape" -p "local_2_initLoc";
	rename -uid "67D1EEA4-4A6F-BEF4-4C58-BB838D69BBEF";
	setAttr -k off ".v";
createNode transform -n "mid_mainPoser" -p "full_mainPoser";
	rename -uid "11ED35E5-4DB9-D97D-E042-23851F937FC3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "mid_mainPoserShape" -p "mid_mainPoser";
	rename -uid "AC920FE0-43D5-2860-7FA2-BA8D0FC93290";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "mid_mainPoserShapeOrig" -p "mid_mainPoser";
	rename -uid "1B27ECE1-455D-6CB2-7AB8-46B77CA34B3E";
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
createNode transform -n "mid_mainPoser_clusterHandle" -p "mid_mainPoser";
	rename -uid "C375C8A0-4E1A-F7F2-8DFA-21BF162CBFAF";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "mid_mainPoser_clusterHandleShape" -p "mid_mainPoser_clusterHandle";
	rename -uid "31102DA1-484A-42A5-BDE2-BFB7F2979683";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "local_3_poser" -p "mid_mainPoser";
	rename -uid "5456FED1-4A87-7679-8AD4-C6BFCFA9488F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" -0.35367729058687003 -0.069297383039630372 0.024634639591384268 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_3_poserNurbsShape" -p "local_3_poser";
	rename -uid "4E7D3976-441C-5B67-3568-92B1166FB0F1";
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
createNode transform -n "local_3_poserOrient" -p "local_3_poser";
	rename -uid "7A881FFA-4984-4F42-24DB-4A991E38D887";
createNode locator -n "local_3_poserOrientShape" -p "local_3_poserOrient";
	rename -uid "80819229-41E3-D2B4-C517-27909CE4390F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_3_initLoc" -p "local_3_poserOrient";
	rename -uid "439F0AE8-41C4-A001-AB43-A7ABF07DCBB9";
	setAttr ".v" no;
createNode locator -n "local_3_initLocShape" -p "local_3_initLoc";
	rename -uid "C6B37C5A-4681-E78A-41C4-7893137D1015";
	setAttr -k off ".v";
createNode transform -n "local_4_poser" -p "mid_mainPoser";
	rename -uid "06ED0EA9-434F-543B-122A-3ABCF9749045";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0.35418494147943946 0.010655383456325161 0.023994538411697887 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_4_poserNurbsShape" -p "local_4_poser";
	rename -uid "826CED22-4DD6-4338-0FDC-0C98D3569E83";
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
createNode transform -n "local_4_poserOrient" -p "local_4_poser";
	rename -uid "43327A22-463E-B73F-9F88-91BB0D6AD1BF";
createNode locator -n "local_4_poserOrientShape" -p "local_4_poserOrient";
	rename -uid "1B0CF241-45CF-8638-F248-05BF0F6007B8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_4_initLoc" -p "local_4_poserOrient";
	rename -uid "D0D127CA-4338-F821-B93E-8DA6084DC708";
	setAttr ".v" no;
createNode locator -n "local_4_initLocShape" -p "local_4_initLoc";
	rename -uid "61345B9D-412D-AD42-CDF9-E1B9BD88884F";
	setAttr -k off ".v";
createNode transform -n "out_mainPoser" -p "full_mainPoser";
	rename -uid "DF99E05E-4D4A-1A2B-2653-689A4F693F16";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 1.5327920118854714 -0.055402970508477978 -0.33473951882795649 ;
	setAttr ".r" -type "double3" 0 30.455838850784282 0 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "out_mainPoserShape" -p "out_mainPoser";
	rename -uid "6E50D6F9-4D07-B8AD-40C5-0084BF75DE34";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "out_mainPoserShapeOrig" -p "out_mainPoser";
	rename -uid "928EA9E6-4C57-BFFC-1188-3CA918CFFD54";
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
createNode transform -n "out_mainPoser_clusterHandle" -p "out_mainPoser";
	rename -uid "9487B22D-4F5F-408D-AB11-83B2AE4128C9";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "out_mainPoser_clusterHandleShape" -p "out_mainPoser_clusterHandle";
	rename -uid "C10AB356-459D-FE84-050C-99A480246B8B";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "local_5_poser" -p "out_mainPoser";
	rename -uid "5EBC09F8-4BEE-394D-A872-C480D8998CB3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_size" -ln "default_size" -dt "string";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" -0.33314651439603138 0.051139455775621484 -0.0043371526288383897 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_size" -type "string" "0.3";
createNode nurbsSurface -n "local_5_poserNurbsShape" -p "local_5_poser";
	rename -uid "A6445AFF-40B7-2895-E40C-449DF71ADF9F";
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
createNode transform -n "local_5_poserOrient" -p "local_5_poser";
	rename -uid "1A8EA930-4F5E-857B-A211-F989BA4FC720";
createNode locator -n "local_5_poserOrientShape" -p "local_5_poserOrient";
	rename -uid "01E038A4-42F1-80C1-725C-8293D4CD9B7C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_5_initLoc" -p "local_5_poserOrient";
	rename -uid "28B075CC-44A5-64F3-CCD2-38A90761455B";
	setAttr ".v" no;
createNode locator -n "local_5_initLocShape" -p "local_5_initLoc";
	rename -uid "166E2812-4A28-D772-1619-C4875FC9D144";
	setAttr -k off ".v";
createNode transform -n "local_6_poser" -p "out_mainPoser";
	rename -uid "1AF985C3-4831-4D31-E21D-6CB9DC719A0F";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 0.3560155006506176 -0.12876779840491531 0.00085028640346302103 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_6_poserNurbsShape" -p "local_6_poser";
	rename -uid "C8E7DA83-4F04-35AF-8570-54AEA7E5DA01";
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
createNode transform -n "local_6_poserOrient" -p "local_6_poser";
	rename -uid "DFF05B8A-4C85-DE28-9DE0-799F216871A9";
createNode locator -n "local_6_poserOrientShape" -p "local_6_poserOrient";
	rename -uid "46BFA3CF-495B-13FA-B31A-868845299DAA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_6_initLoc" -p "local_6_poserOrient";
	rename -uid "AD835D57-4B16-90F9-6A55-8ABD03C31839";
	setAttr ".v" no;
createNode locator -n "local_6_initLocShape" -p "local_6_initLoc";
	rename -uid "DFD6576B-45AB-2BD7-4288-D386DFB687F5";
	setAttr -k off ".v";
createNode transform -n "local_7_poser" -p "full_mainPoser";
	rename -uid "715CEE10-42EE-0FCE-EDAF-2B85A7033B70";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.1723726118980453 -0.40783987673871636 -0.83292724280841401 ;
	setAttr -k on ".t";
	setAttr ".r" -type "double3" 0.8959341931917103 35.565792945904661 -13.591866780695449 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_7_poserNurbsShape" -p "local_7_poser";
	rename -uid "105E9945-4A52-3C0B-03C2-9DB37EE30E66";
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
createNode transform -n "local_7_poserOrient" -p "local_7_poser";
	rename -uid "2616156C-4F3B-A1AF-AB89-94AA5E44C3D5";
createNode locator -n "local_7_poserOrientShape" -p "local_7_poserOrient";
	rename -uid "D24262F2-4183-3771-F8EB-7ABB3D70B7B3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_7_initLoc" -p "local_7_poserOrient";
	rename -uid "24DEE1CA-4F02-91E1-28B1-1BBAC7A760C2";
	setAttr ".v" no;
createNode locator -n "local_7_initLocShape" -p "local_7_initLoc";
	rename -uid "A3D302A5-4B65-340F-5650-37979807E78D";
	setAttr -k off ".v";
createNode transform -n "local_8_poser" -p "full_mainPoser";
	rename -uid "9D97AE51-499A-3037-58B7-2D8A1A80A2E0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.8481724164576381 -1.0613209193289741 -1.685575367550987 ;
	setAttr -k on ".t";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
createNode nurbsSurface -n "local_8_poserNurbsShape" -p "local_8_poser";
	rename -uid "0B01151F-4EBF-7C47-0860-A3A0BFB71B66";
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
createNode transform -n "local_8_poserOrient" -p "local_8_poser";
	rename -uid "640862EC-4730-2FDF-A92A-3D866F8C8704";
createNode locator -n "local_8_poserOrientShape" -p "local_8_poserOrient";
	rename -uid "168ACB25-402C-DBDA-AF46-86B59F185ED7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_8_initLoc" -p "local_8_poserOrient";
	rename -uid "F1953A7C-4DFA-92EC-21D9-11B2F581C983";
	setAttr ".v" no;
createNode locator -n "local_8_initLocShape" -p "local_8_initLoc";
	rename -uid "928D08C8-48FF-3705-9814-7BA248086CF3";
	setAttr -k off ".v";
createNode orientConstraint -n "local_8_poser_orientConstraint1" -p "local_8_poser";
	rename -uid "D80C614B-4880-A7A4-BF63-3B84A7BD8088";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "local_7_poserW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.8959341931917103 35.565792945904661 -13.591866780695447 ;
	setAttr ".rsrr" -type "double3" 5.2227035537901498 28.398362138685979 -14.136969875597696 ;
	setAttr -k on ".w0";
createNode transform -n "center_poser_group" -p "posers";
	rename -uid "5CE4D464-44AC-AF68-F262-30809EACC221";
	setAttr ".t" -type "double3" 0.046722914327709475 3.941971540721589 0 ;
createNode transform -n "center_poser" -p "center_poser_group";
	rename -uid "40A8424C-44A6-3BEF-0FBB-94BB562EFC8C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" -2.2204460492503131e-16 -0.36498286983563372 
		0.34798930314699367 ;
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
createNode nurbsSurface -n "center_poserNurbsShape" -p "center_poser";
	rename -uid "9AE282BC-4A2F-B803-8779-34BF146CBE56";
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
createNode transform -n "center_poserOrient" -p "center_poser";
	rename -uid "A5A06A9A-451D-0601-5A17-F5A275E72E51";
createNode locator -n "center_poserOrientShape" -p "center_poserOrient";
	rename -uid "7FF9DFDE-4284-F66A-3C6A-889E8CCCD58E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "center_initLoc" -p "center_poserOrient";
	rename -uid "302EE5EA-4F3F-0F2C-3A15-F98AE0678067";
	setAttr ".v" no;
createNode locator -n "center_initLocShape" -p "center_initLoc";
	rename -uid "96F50F04-41CC-D7EA-8489-749E5CF6192E";
	setAttr -k off ".v";
createNode scaleConstraint -n "center_poser_group_scaleConstraint1" -p "center_poser_group";
	rename -uid "DC159498-4C99-0CD3-CD15-A9970ECCD0E6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mainPoserW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 1 0.99999999999999989 1 ;
	setAttr -k on ".w0";
createNode transform -n "lines_group" -p "posers";
	rename -uid "FC84B6B2-40C7-37E3-1F11-9A862D25B3A5";
	setAttr ".t" -type "double3" 0 -14.11026115562764 -6.6996021718382446 ;
createNode transform -n "posers_curve_1" -p "lines_group";
	rename -uid "34C62721-4E1B-8485-92CF-69A8E5638BA5";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape1" -p "posers_curve_1";
	rename -uid "DF9BA5EB-432D-3115-5489-868935B5C679";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 3 0 no 3
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		6
		1.1569811494361784 17.84143888387139 7.2774786453403779
		1.7804454394047942 17.952846833446486 7.3610906272007552
		2.5079672196498932 18.082888290379845 7.219074063975544
		3.1673661135654925 18.162841056875799 6.9616591304182567
		3.9257638453837869 18.147922158686619 6.4586214242658002
		4.3566944252278006 17.968014904506081 5.9207831327113833
		;
createNode transform -n "posers_curve_1_sweepMesh" -p "lines_group";
	rename -uid "94C5FAB1-4426-043D-5318-70B10DA7DC39";
createNode mesh -n "posers_curve_1_sweepMeshShape" -p "posers_curve_1_sweepMesh";
	rename -uid "A8180905-4500-6FC3-3A0F-54AC22AD6EDB";
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
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
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
	setAttr ".v" no;
createNode transform -n "l_curve" -p "system";
	rename -uid "E29C962A-4744-8C32-5F03-F1A09DD6C3AA";
createNode nurbsCurve -n "l_curveShape" -p "l_curve";
	rename -uid "7141B694-4F8C-5991-1E65-3B813BF949EE";
	setAttr -k off ".v";
	setAttr -s 12 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 9 0 no 3
		14 0 0 0 0.11111111111111109 0.22222222222222218 0.33333333333333331 0.44444444444444436
		 0.55555555555555558 0.66666666666666663 0.77777777777777779 0.88888888888888873 1
		 1 1
		12
		0.046722914327709253 17.687249826513597 7.0475914749852384
		1.1042108758047291 17.841438883871387 7.2890982343599688
		1.153917071401046 17.84143888387139 7.2945497016214107
		1.2065625770592059 17.841438883871387 7.2830555239287937
		1.7803928128703417 17.871066609187245 7.3610847078110311
		2.5079672196498937 18.082888290379845 7.2190740639755431
		3.2002664508399108 18.162841056875799 7.0141754281404225
		3.8971245307105824 18.147439041420384 6.4356131974421436
		4.3349056047339278 17.967180677708335 5.9219045042791345
		4.5319295494895346 17.749515832713325 5.5327024882940821
		4.5637367386229029 17.737951138985615 5.4825590769256864
		4.8711760210111033 17.0908647540905 4.4637330730635609
		;
createNode transform -n "r_curve" -p "system";
	rename -uid "C9B5768C-4587-A258-68F0-51B295A9AF2F";
createNode nurbsCurve -n "r_curveShape" -p "r_curve";
	rename -uid "4373F378-43B6-7D1A-33FC-13B92495A289";
	setAttr -k off ".v";
	setAttr -s 12 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 9 0 no 3
		14 0 0 0 0.11111111111111109 0.22222222222222218 0.33333333333333331 0.44444444444444436
		 0.55555555555555558 0.66666666666666663 0.77777777777777779 0.88888888888888873 1
		 1 1
		12
		0.046722914327709253 17.687249826513597 7.0475914749852384
		-1.1042108758047289 17.84143888387139 7.2890982343599724
		-1.153917071401046 17.84143888387139 7.2945497016214107
		-1.2065625770592057 17.841438883871387 7.2830555239287955
		-1.7803928128703415 17.952846833446486 7.3610847078110311
		-2.5079672196498937 18.082888290379845 7.2190740639755431
		-3.2002664508399108 18.162841056875799 7.0141754281404225
		-3.8971245307105824 18.147439041420384 6.4356131974421436
		-4.3349056047339278 17.967180677708335 5.9219045042791345
		-4.5197949139406814 17.753903980904767 5.5518122349885974
		-4.572372004271406 17.73478761245676 5.4689254807409196
		-4.8711760210111033 17.0908647540905 4.4637330730635609
		;
createNode transform -n "controls" -p "mod";
	rename -uid "FCAA7EB7-4CB0-AB78-DB1E-ABB14D792469";
createNode transform -n "l_brow_group" -p "controls";
	rename -uid "DF17890E-4BD5-9E26-140E-E8BE470EB472";
createNode transform -n "l_brow" -p "l_brow_group";
	rename -uid "A56BA658-4B79-AEA1-2AB4-79B3AE833EB2";
	addAttr -ci true -sn "limits" -ln "limits" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_limits" -ln "default_limits" -dt "string";
	addAttr -ci true -sn "upLimit" -ln "upLimit" -at "double";
	addAttr -ci true -sn "downLimit" -ln "downLimit" -at "double";
	addAttr -ci true -sn "upRotateJoints" -ln "upRotateJoints" -at "double";
	addAttr -ci true -sn "downRotateJoints" -ln "downRotateJoints" -at "double";
	addAttr -ci true -sn "limitPositions" -ln "limitPositions" -min 0 -max 2 -en "None:Top:Bottom" 
		-at "enum";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -cb on ".limits" yes;
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_limits" -type "string" "True";
	setAttr ".upLimit" 1.3;
	setAttr ".downLimit" -0.8;
	setAttr ".upRotateJoints" -17.989;
createNode nurbsCurve -n "l_browShape" -p "l_brow";
	rename -uid "661E125E-4268-1599-BCAE-E3A1EB198144";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-0.57704111374401301 0.32149004962247585 0.73921323294834762
		0.57704111374401301 0.32149004962247585 0.73921323294834762
		0.57704111374401301 -0.32149004962247585 0.73921323294834762
		-0.57704111374401301 -0.32149004962247585 0.73921323294834762
		-0.57704111374401301 0.32149004962247585 0.73921323294834762
		;
createNode transform -n "l_brow_in_group" -p "l_brow";
	rename -uid "71A32C72-4FF6-44F2-3DD0-2EAA18CF017E";
	setAttr ".rp" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".rpt" -type "double3" 1.9737686423141927e-17 0 -9.1518945047367793e-17 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode transform -n "l_brow_in_group_1" -p "l_brow_in_group";
	rename -uid "90CA929D-4961-E8A8-1707-22AE116DBDEB";
	setAttr ".rp" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode transform -n "l_brow_in" -p "l_brow_in_group_1";
	rename -uid "FE11A664-45E0-3F35-AB68-4B8F7590F99C";
	addAttr -ci true -sn "rotateToLength" -ln "rotateToLength" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove1" -ln "rotateToMove1" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove2" -ln "rotateToMove2" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove3" -ln "rotateToMove3" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove4" -ln "rotateToMove4" -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".rotateToLength" 0.35384615390346602;
	setAttr ".rotateToMove1" 1;
	setAttr ".rotateToMove2" 0.53030303033125215;
	setAttr ".rotateToMove3" 0.1616161617666784;
	setAttr ".rotateToMove4" 0.076142132424082853;
createNode nurbsCurve -n "l_brow_in_1Shape" -p "l_brow_in";
	rename -uid "A2174BD3-4D15-D7D1-B512-589573F0B6B8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.26173958088278698 0.26173958088278659 0.24600004032846876
		-1.4969281253863699e-16 0.37015566509428743 0.24600004032846876
		-0.26173958088278654 0.2617395808827867 0.24600004032846876
		-0.37015566509428721 3.7768447602452791e-16 0.24600004032846876
		-0.26173958088278676 -0.26173958088278615 0.24600004032846876
		-2.1899760301195837e-16 -0.37015566509428688 0.24600004032846876
		0.26173958088278632 -0.26173958088278626 0.24600004032846876
		0.37015566509428721 6.7376763049622086e-17 0.24600004032846876
		0.26173958088278698 0.26173958088278659 0.24600004032846876
		-1.4969281253863699e-16 0.37015566509428743 0.24600004032846876
		-0.26173958088278654 0.2617395808827867 0.24600004032846876
		;
createNode transform -n "l_brow_local_2_rotateOffset" -p "l_brow_in";
	rename -uid "956FE6AD-47EB-BC06-DE84-229479FAE790";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
createNode transform -n "l_curve9_2_loc_moveOffset" -p "l_brow_local_2_rotateOffset";
	rename -uid "A5A7E5F1-41B8-79E6-0B60-17A7AD2B1106";
createNode transform -n "l_brow_local_2_group" -p "l_curve9_2_loc_moveOffset";
	rename -uid "2D2E332B-44D5-BAB4-D480-6286B7A76BA4";
createNode transform -n "l_brow_local_2_group_1" -p "l_brow_local_2_group";
	rename -uid "20CA00C1-4AA4-42E0-0512-7E93AA9365B7";
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode transform -n "l_brow_local_2" -p "l_brow_local_2_group_1";
	rename -uid "7537F918-4B96-980F-0D4E-5BBC2A85F79E";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 5.1006291204580556e-16 -0.081780224259241516 2.6541269182445149e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_brow_local_2Shape" -p "l_brow_local_2";
	rename -uid "05792709-4A7C-D4AA-2930-C9A8EAD5AD0D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328389338584727 0.061328372464537345 0.12249364956903555
		1.6874047159554095e-08 0.086731416097617836 0.12249364956903555
		-0.061328355590490248 0.061328372464537345 0.12249364956903555
		-0.086731399223570746 -4.1355873594643409e-18 0.12249364956903555
		-0.061328355590490304 -0.061328372464537415 0.12249364956903555
		1.6874047104042944e-08 -0.086731416097617892 0.12249364956903555
		0.061328389338584505 -0.061328372464537456 0.12249364956903555
		0.086731432971665107 -7.6843990634803227e-17 0.12249364956903555
		0.061328389338584727 0.061328372464537345 0.12249364956903555
		1.6874047159554095e-08 0.086731416097617836 0.12249364956903555
		-0.061328355590490248 0.061328372464537345 0.12249364956903555
		;
createNode transform -n "l_curve_loc_05" -p "l_brow_local_2";
	rename -uid "158B9E29-4DF5-9FDC-983B-AF9C9672F5E4";
	setAttr ".v" no;
	setAttr ".spt" -type "double3" 0 1.4791141972893969e-31 0 ;
createNode locator -n "l_curve_loc_05Shape" -p "l_curve_loc_05";
	rename -uid "6D1DDD1B-4778-6DBF-6526-A5B34076ACEC";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" 0 -2.970714914637658e-17 -5.5511151231257827e-17 ;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_2_top" -p "l_brow_local_2_group";
	rename -uid "C5495359-4E5F-2C1F-91D8-238085B6039B";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 -1.3322676295501878e-15 -1.6653345369377348e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_brow_local_2_topShape" -p "l_brow_local_2_top";
	rename -uid "756E240D-466C-7120-4974-CBA11285D37E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328389338584699 0.061328372464537352 0.12249364956903551
		1.6874047215065247e-08 0.086731416097617836 0.12249364956903554
		-0.061328355590490186 0.061328372464537366 0.12249364956903551
		-0.086731399223570677 -4.1355873594643409e-18 0.12249364956903551
		-0.061328355590490241 -0.061328372464537394 0.12249364956903551
		1.6874047159554095e-08 -0.086731416097617892 0.12249364956903551
		0.061328389338584532 -0.061328372464537435 0.12249364956903551
		0.086731432971665107 -7.6843990634803227e-17 0.12249364956903551
		0.061328389338584699 0.061328372464537352 0.12249364956903551
		1.6874047215065247e-08 0.086731416097617836 0.12249364956903554
		-0.061328355590490186 0.061328372464537366 0.12249364956903551
		;
createNode transform -n "l_brow_local_2_bot" -p "l_brow_local_2_group";
	rename -uid "F0928C32-43E8-6085-411F-87BD7E93A034";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 -1.3322676295501878e-15 -1.6653345369377348e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_brow_local_2_botShape" -p "l_brow_local_2_bot";
	rename -uid "EEF2C9B5-47A1-6AE6-A3F3-E4A1E3169020";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328389338584699 0.061328372464537352 0.12249364956903551
		1.6874047215065247e-08 0.086731416097617836 0.12249364956903554
		-0.061328355590490186 0.061328372464537366 0.12249364956903551
		-0.086731399223570677 -4.1355873594643409e-18 0.12249364956903551
		-0.061328355590490241 -0.061328372464537394 0.12249364956903551
		1.6874047159554095e-08 -0.086731416097617892 0.12249364956903551
		0.061328389338584532 -0.061328372464537435 0.12249364956903551
		0.086731432971665107 -7.6843990634803227e-17 0.12249364956903551
		0.061328389338584699 0.061328372464537352 0.12249364956903551
		1.6874047215065247e-08 0.086731416097617836 0.12249364956903554
		-0.061328355590490186 0.061328372464537366 0.12249364956903551
		;
createNode transform -n "l_brow_local_1_moveOffset" -p "l_brow_in";
	rename -uid "622720E3-4916-4600-5B78-4EBF1FE0499E";
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
createNode transform -n "l_brow_local_1_rotateOffset" -p "l_brow_local_1_moveOffset";
	rename -uid "D175FCD6-4487-5AD4-B521-D89303E1AEBE";
createNode transform -n "l_brow_local_1_group" -p "l_brow_local_1_rotateOffset";
	rename -uid "0ADAA1E0-423D-5EE3-FCBF-FE9D16AB1DC7";
	addAttr -ci true -k true -sn "test" -ln "test" -at "double";
	addAttr -ci true -k true -sn "test1" -ln "test1" -at "double";
	addAttr -ci true -k true -sn "test2" -ln "test2" -at "double";
	setAttr ".spt" -type "double3" 0 -4.3790577010150533e-47 0 ;
createNode transform -n "l_brow_local_1_group_1" -p "l_brow_local_1_group";
	rename -uid "B92F308B-4E45-0E14-B0B6-2EBC4CC23631";
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode transform -n "l_brow_local_1" -p "l_brow_local_1_group_1";
	rename -uid "DD8B40DA-479E-726B-073B-C99A2BC27175";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".spt" -type "double3" 0 9.8607613152626465e-32 -6.1629758220391534e-33 ;
createNode nurbsCurve -n "l_brow_local_1Shape" -p "l_brow_local_1";
	rename -uid "9B4EDA57-42F2-BD72-170E-178DE15382EB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328355941495327 0.061328372464537345 0.09213678394836311
		-1.652304218446865e-08 0.086731416097617836 0.09213678394836311
		-0.061328388987579613 0.061328372464537352 0.09213678394836311
		-0.086731432620660104 -2.3245953851651257e-19 0.092136783948363082
		-0.061328388987579668 -0.061328372464537408 0.092136783948363082
		-1.652304218446865e-08 -0.086731416097617892 0.092136783948363082
		0.061328355941495161 -0.061328372464537449 0.092136783948363082
		0.086731399574575652 -7.2940862813855387e-17 0.092136783948363082
		0.061328355941495327 0.061328372464537345 0.09213678394836311
		-1.652304218446865e-08 0.086731416097617836 0.09213678394836311
		-0.061328388987579613 0.061328372464537352 0.09213678394836311
		;
createNode transform -n "l_curve_loc_04" -p "l_brow_local_1";
	rename -uid "19429323-45CE-3517-04F7-6CBF827D6D17";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.05 -2.4033238506943055e-15 -2.2993759674072578e-15 ;
	setAttr ".spt" -type "double3" 0 9.8607613152626432e-32 0 ;
createNode locator -n "l_curve_loc_04Shape" -p "l_curve_loc_04";
	rename -uid "D03AEDF9-4872-10EF-F767-259C33FEAB2E";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" 0 -2.5827136025855158e-17 -4.6462861788322438e-17 ;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_curve_loc_03" -p "l_brow_local_1";
	rename -uid "B287B7DD-45AE-0429-0B19-E1A6B1D74D6B";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" -0.0010308543800449099 0 0.017306567772824237 ;
	setAttr ".spt" -type "double3" -5.5511151231257802e-17 0 -1.7347234759768063e-18 ;
createNode locator -n "l_curve_loc_03Shape" -p "l_curve_loc_03";
	rename -uid "F8F6CC57-4C1C-C005-6CD6-E4BF71BF3E69";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_curve_loc_02" -p "l_brow_local_1";
	rename -uid "9A7BBA56-44A5-F1DA-9063-CA921077CA6A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.05 -3.5527136788005009e-15 2.6020852139652106e-17 ;
	setAttr ".rpt" -type "double3" -0.0010349059554317641 0 0.017445139082783202 ;
	setAttr ".spt" -type "double3" -5.5511151231257802e-17 0 -1.7347234759768063e-18 ;
createNode locator -n "l_curve_loc_02Shape" -p "l_curve_loc_02";
	rename -uid "B41B7AFE-4EF6-A7E6-9D71-A8BDEF4AA0E8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_1_top" -p "l_brow_local_1_group";
	rename -uid "5B23F89C-4FE5-B9F4-646E-5C9D264A0B94";
	setAttr -l on -k off ".v" no;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0.16306873825661372 -4.4408920985006271e-16 2.7755575615628914e-17 ;
	setAttr ".sp" -type "double3" 0.16306873825661372 -4.4408920985006262e-16 2.7755575615628914e-17 ;
	setAttr ".spt" -type "double3" 0 -9.8607613152626498e-32 0 ;
createNode nurbsCurve -n "l_brow_local_1_topShape" -p "l_brow_local_1_top";
	rename -uid "149E2174-4512-F09F-EAD6-E5B97E6A109C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.22439711072115093 0.061328372464537345 0.092136783948363624
		0.16306873825661339 0.086731416097617836 0.092136783948363624
		0.10174036579207596 0.061328372464537352 0.092136783948363624
		0.076337322158995483 -2.3245953851651257e-19 0.09213678394836361
		0.1017403657920759 -0.061328372464537408 0.09213678394836361
		0.16306873825661339 -0.086731416097617892 0.09213678394836361
		0.22439711072115076 -0.061328372464537449 0.09213678394836361
		0.24980015435423125 -7.2940862813855387e-17 0.09213678394836361
		0.22439711072115093 0.061328372464537345 0.092136783948363624
		0.16306873825661339 0.086731416097617836 0.092136783948363624
		0.10174036579207596 0.061328372464537352 0.092136783948363624
		;
createNode transform -n "l_brow_local_1_bot" -p "l_brow_local_1_group";
	rename -uid "A102A27C-42C5-6C7E-9E7E-6DA1AC991267";
	setAttr -l on -k off ".v" no;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0.16306873825661372 -4.4408920985006271e-16 2.7755575615628914e-17 ;
	setAttr ".sp" -type "double3" 0.16306873825661372 -4.4408920985006262e-16 2.7755575615628914e-17 ;
	setAttr ".spt" -type "double3" 0 -9.8607613152626498e-32 0 ;
createNode nurbsCurve -n "l_brow_local_1_botShape" -p "l_brow_local_1_bot";
	rename -uid "4ABEEC38-4123-0E1F-ABCE-0CB680FF0CF3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.22439711072115093 0.061328372464537345 0.092136783948363624
		0.16306873825661339 0.086731416097617836 0.092136783948363624
		0.10174036579207596 0.061328372464537352 0.092136783948363624
		0.076337322158995483 -2.3245953851651257e-19 0.09213678394836361
		0.1017403657920759 -0.061328372464537408 0.09213678394836361
		0.16306873825661339 -0.086731416097617892 0.09213678394836361
		0.22439711072115076 -0.061328372464537449 0.09213678394836361
		0.24980015435423125 -7.2940862813855387e-17 0.09213678394836361
		0.22439711072115093 0.061328372464537345 0.092136783948363624
		0.16306873825661339 0.086731416097617836 0.092136783948363624
		0.10174036579207596 0.061328372464537352 0.092136783948363624
		;
createNode transform -n "l_brow_in_top" -p "l_brow_in_group";
	rename -uid "95AA7EFB-4E22-7B69-BB64-ED9AC4638BC8";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -9.5756735873919752e-16 -0.02159476321303937 -0.25952546289679307 ;
	setAttr ".r" -type "double3" -12.062319512985223 0 0 ;
	setAttr ".rp" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode nurbsCurve -n "l_brow_in_topShape" -p "l_brow_in_top";
	rename -uid "77C86752-49F1-B3DF-DD89-8CA1974F9DD0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.18500216650655912 0.1850021665065589 0.18500216650655885
		-0.18500216650655912 0.1850021665065589 -0.18500216650655901
		0.18500216650655868 0.1850021665065589 -0.18500216650655896
		0.18500216650655868 0.1850021665065589 0.1850021665065589
		-0.18500216650655912 0.1850021665065589 0.18500216650655885
		-0.18500216650655912 -0.18500216650655896 0.18500216650655885
		-0.18500216650655912 -0.18500216650655896 -0.18500216650655901
		-0.18500216650655912 0.1850021665065589 -0.18500216650655901
		-0.18500216650655912 0.1850021665065589 0.18500216650655885
		-0.18500216650655912 -0.18500216650655896 0.18500216650655885
		0.18500216650655868 -0.18500216650655896 0.1850021665065589
		0.18500216650655868 0.1850021665065589 0.1850021665065589
		0.18500216650655868 0.1850021665065589 -0.18500216650655896
		0.18500216650655868 -0.18500216650655896 -0.18500216650655896
		0.18500216650655868 -0.18500216650655896 0.1850021665065589
		0.18500216650655868 -0.18500216650655896 -0.18500216650655896
		-0.18500216650655912 -0.18500216650655896 -0.18500216650655901
		;
createNode transform -n "l_brow_in_bot" -p "l_brow_in_group";
	rename -uid "9BE64466-45B3-0DAD-6688-D5BAB2EE27F4";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -0.010247129554331658 0.23619254254334851 0.01110213485792411 ;
	setAttr ".r" -type "double3" 0 0 -13.169699284806368 ;
	setAttr ".rp" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode nurbsCurve -n "l_brow_in_botShape" -p "l_brow_in_bot";
	rename -uid "56D5E6A4-4CDC-81EE-8F05-61BE56C324FC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.18500216650655912 0.1850021665065589 0.18500216650655885
		-0.18500216650655912 0.1850021665065589 -0.18500216650655901
		0.18500216650655868 0.1850021665065589 -0.18500216650655896
		0.18500216650655868 0.1850021665065589 0.1850021665065589
		-0.18500216650655912 0.1850021665065589 0.18500216650655885
		-0.18500216650655912 -0.18500216650655896 0.18500216650655885
		-0.18500216650655912 -0.18500216650655896 -0.18500216650655901
		-0.18500216650655912 0.1850021665065589 -0.18500216650655901
		-0.18500216650655912 0.1850021665065589 0.18500216650655885
		-0.18500216650655912 -0.18500216650655896 0.18500216650655885
		0.18500216650655868 -0.18500216650655896 0.1850021665065589
		0.18500216650655868 0.1850021665065589 0.1850021665065589
		0.18500216650655868 0.1850021665065589 -0.18500216650655896
		0.18500216650655868 -0.18500216650655896 -0.18500216650655896
		0.18500216650655868 -0.18500216650655896 0.1850021665065589
		0.18500216650655868 -0.18500216650655896 -0.18500216650655896
		-0.18500216650655912 -0.18500216650655896 -0.18500216650655901
		;
createNode transform -n "l_brow_mid_group" -p "l_brow";
	rename -uid "D9BCCC20-40C9-4B5F-5F16-B7B8C187DDF0";
	setAttr ".rp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".rpt" -type "double3" -5.1287669052061909e-19 0 2.1336892135172019e-17 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
createNode transform -n "l_brow_mid_group_1" -p "l_brow_mid_group";
	rename -uid "FBEB13AD-4AD2-79FD-8CF5-CDAD8EF0024D";
	setAttr ".t" -type "double3" 4.4408920985006262e-16 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
createNode transform -n "l_brow_mid" -p "l_brow_mid_group_1";
	rename -uid "B59FAE95-4562-97C4-D973-8BB699B72421";
	addAttr -ci true -sn "rotateToMove" -ln "rotateToMove" -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".rp" -type "double3" 4.4408920985006281e-16 0 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".spt" -type "double3" 9.8607613152626519e-32 0 0 ;
	setAttr ".rotateToMove" 0.6218905469810414;
createNode nurbsCurve -n "l_brow_midShape" -p "l_brow_mid";
	rename -uid "A8CD0CCE-4E8F-863D-07AC-35886E1FA7CD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.2617395808827872 0.2617395808827867 0.24600004032846876
		7.2351792386394334e-17 0.37015566509428749 0.24600004032846876
		-0.26173958088278632 0.26173958088278676 0.24600004032846876
		-0.37015566509428699 4.06433255023748e-16 0.24600004032846876
		-0.26173958088278654 -0.2617395808827862 0.24600004032846876
		3.0470019130729245e-18 -0.37015566509428688 0.24600004032846876
		0.26173958088278654 -0.26173958088278632 0.24600004032846876
		0.37015566509428743 1.0036007404543408e-16 0.24600004032846876
		0.2617395808827872 0.2617395808827867 0.24600004032846876
		7.2351792386394334e-17 0.37015566509428749 0.24600004032846876
		-0.26173958088278632 0.26173958088278676 0.24600004032846876
		;
createNode transform -n "l_brow_local_3_rotateOffset" -p "l_brow_mid";
	rename -uid "E1152CB3-463A-46D4-4609-38A79C74486F";
	setAttr ".rp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
createNode transform -n "l_curve9_3_loc_moveOffset" -p "l_brow_local_3_rotateOffset";
	rename -uid "A947DF12-4830-1443-C979-8DB6CFEDF5AD";
createNode transform -n "l_brow_local_3_group" -p "l_curve9_3_loc_moveOffset";
	rename -uid "6DE80D6C-4A5C-E104-8309-5CAAEC6AAC11";
createNode transform -n "l_brow_local_3_group_1" -p "l_brow_local_3_group";
	rename -uid "72CBDA20-47D9-6031-1F38-96ADE5DF2E09";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999978 ;
createNode transform -n "l_brow_local_3" -p "l_brow_local_3_group_1";
	rename -uid "1678DC15-4635-C849-E923-80AC81CF91E5";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -3.3306690738754696e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
createNode nurbsCurve -n "l_brow_local_3Shape" -p "l_brow_local_3";
	rename -uid "06D51602-4CBA-D349-237B-EF9440C3D1F6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		-0.086731394715270901 -3.7840217730146047e-16 0.10273604085023856
		-0.061328351082190508 -0.061328372464537768 0.10273604085023856
		2.1382346858389578e-08 -0.086731416097618308 0.10273604085023856
		0.061328393846884245 -0.06132837246453781 0.10273604085023856
		0.086731437479964729 -4.5111058057679936e-16 0.10273604085023856
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		;
createNode transform -n "l_curve_loc_06" -p "l_brow_local_3";
	rename -uid "C1CF12D0-4F7B-EA5C-C058-17B4EBE6D879";
	setAttr ".v" no;
	setAttr ".spt" -type "double3" -2.7755575615628901e-17 0 2.4651903288156597e-32 ;
createNode locator -n "l_curve_loc_06Shape" -p "l_curve_loc_06";
	rename -uid "159FC85E-414C-49BE-8DF6-DF98D354E4E4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_3_top" -p "l_brow_local_3_group";
	rename -uid "304FCB9D-423B-AF3A-AF0E-7A8E2C6DE72C";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 0 -5.5511151231257827e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
createNode nurbsCurve -n "l_brow_local_3_topShape" -p "l_brow_local_3_top";
	rename -uid "154E86E7-4B6B-2003-B07F-26820116F150";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		-0.086731394715270901 -3.7840217730146047e-16 0.10273604085023856
		-0.061328351082190508 -0.061328372464537768 0.10273604085023856
		2.1382346858389578e-08 -0.086731416097618308 0.10273604085023856
		0.061328393846884245 -0.06132837246453781 0.10273604085023856
		0.086731437479964729 -4.5111058057679936e-16 0.10273604085023856
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		;
createNode transform -n "l_brow_local_3_bot" -p "l_brow_local_3_group";
	rename -uid "5788B988-45FC-6500-DF0A-85ADD2D5D5A3";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 4.9563531621167177e-16 -0.0036896680511477307 -5.2570630520019297e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
createNode nurbsCurve -n "l_brow_local_3_botShape" -p "l_brow_local_3_bot";
	rename -uid "BD56ADD7-4C50-3950-F076-AE8746FFEDCB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		-0.086731394715270901 -3.7840217730146047e-16 0.10273604085023856
		-0.061328351082190508 -0.061328372464537768 0.10273604085023856
		2.1382346858389578e-08 -0.086731416097618308 0.10273604085023856
		0.061328393846884245 -0.06132837246453781 0.10273604085023856
		0.086731437479964729 -4.5111058057679936e-16 0.10273604085023856
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		;
createNode transform -n "l_brow_local_4_moveOffset" -p "l_brow_local_3_rotateOffset";
	rename -uid "F2E44A07-4787-EAEA-CB33-41812398F8E3";
createNode transform -n "l_brow_local_4_group" -p "l_brow_local_4_moveOffset";
	rename -uid "1E8DDA0D-47B5-1DD8-851F-D3ACA78A109B";
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
createNode transform -n "l_brow_local_4" -p "l_brow_local_4_group";
	rename -uid "EAEA6C0B-46E2-F544-1B8F-E5A0A57D9B63";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 0 1.1102230246251565e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_brow_local_4Shape" -p "l_brow_local_4";
	rename -uid "C56B0642-4E16-4415-C2CB-E8AA9A1971EF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328408185214525 0.061328372464537345 0.11333539462545711
		3.5720676971884302e-08 0.086731416097617836 0.11333539462545711
		-0.061328336743860457 0.061328372464537352 0.11333539462545711
		-0.086731380376940906 -2.3245953851651257e-19 0.11333539462545711
		-0.061328336743860512 -0.061328372464537408 0.11333539462545711
		3.5720676971884302e-08 -0.086731416097617892 0.11333539462545711
		0.061328408185214414 -0.061328372464537449 0.11333539462545711
		0.08673145181829485 -7.2940862813855387e-17 0.11333539462545711
		0.061328408185214525 0.061328372464537345 0.11333539462545711
		3.5720676971884302e-08 0.086731416097617836 0.11333539462545711
		-0.061328336743860457 0.061328372464537352 0.11333539462545711
		;
createNode transform -n "l_curve_loc_07" -p "l_brow_local_4";
	rename -uid "AC20B25B-49D4-4111-A7F4-0BA7EE71BF4D";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" 0.011605270378272942 0 0.060874554771765892 ;
createNode locator -n "l_curve_loc_07Shape" -p "l_curve_loc_07";
	rename -uid "10D114A7-4437-1CAC-AACC-A4818325DF82";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_4_top" -p "l_brow_local_4_moveOffset";
	rename -uid "28AA7525-45BB-1F40-19D8-CAABEF43E1E2";
	setAttr -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" 2.441012111283216e-34 0 -4.8360394615553485e-36 ;
createNode nurbsCurve -n "l_brow_local_4_topShape" -p "l_brow_local_4_top";
	rename -uid "E866D8E9-4780-4994-8E76-2BA94151F590";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		-0.086731394715270901 -3.7840217730146047e-16 0.10273604085023856
		-0.061328351082190508 -0.061328372464537768 0.10273604085023856
		2.1382346858389578e-08 -0.086731416097618308 0.10273604085023856
		0.061328393846884245 -0.06132837246453781 0.10273604085023856
		0.086731437479964729 -4.5111058057679936e-16 0.10273604085023856
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		;
createNode transform -n "l_brow_local_4_bot" -p "l_brow_local_4_moveOffset";
	rename -uid "60388E3D-4E1F-54CC-2895-328E6EEF2652";
	setAttr -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" 2.441012111283216e-34 0 -4.8360394615553485e-36 ;
createNode nurbsCurve -n "l_brow_local_4_botShape" -p "l_brow_local_4_bot";
	rename -uid "8E8F706F-4B0B-80E3-1251-95A4287B7975";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		-0.086731394715270901 -3.7840217730146047e-16 0.10273604085023856
		-0.061328351082190508 -0.061328372464537768 0.10273604085023856
		2.1382346858389578e-08 -0.086731416097618308 0.10273604085023856
		0.061328393846884245 -0.06132837246453781 0.10273604085023856
		0.086731437479964729 -4.5111058057679936e-16 0.10273604085023856
		0.061328393846884412 0.061328372464536977 0.10273604085023856
		2.1382346858389578e-08 0.08673141609761742 0.10273604085023856
		-0.061328351082190452 0.061328372464536991 0.10273604085023856
		;
createNode transform -n "l_brow_mid_top" -p "l_brow_mid_group";
	rename -uid "67EF66ED-460C-39AC-3538-49A947C859A4";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -1.7191109646930158e-15 -0.14055456882702816 -0.2341045081380082 ;
	setAttr ".r" -type "double3" -12.062319512985223 0 0 ;
	setAttr ".rp" -type "double3" 4.4408920985006262e-16 0 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".spt" -type "double3" -9.8607613152626432e-32 0 0 ;
createNode nurbsCurve -n "l_brow_mid_topShape" -p "l_brow_mid_top";
	rename -uid "66575EFC-4395-40DB-B02E-7D9D893FB292";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 0.18500216650655893 -0.18500216650655893
		0.18500216650655893 0.18500216650655893 -0.18500216650655893
		0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		-0.18500216650655893 0.18500216650655893 -0.18500216650655893
		-0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 0.18500216650655893
		0.18500216650655893 -0.18500216650655893 0.18500216650655893
		0.18500216650655893 0.18500216650655893 0.18500216650655893
		0.18500216650655893 0.18500216650655893 -0.18500216650655893
		0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		0.18500216650655893 -0.18500216650655893 0.18500216650655893
		0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		;
createNode transform -n "l_brow_mid_bot" -p "l_brow_mid_group";
	rename -uid "6EC42655-40A6-4E5C-E6A0-ADB216979E57";
	setAttr -k off ".v";
	setAttr ".rp" -type "double3" 4.4408920985006262e-16 0 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".spt" -type "double3" -9.8607613152626432e-32 0 0 ;
createNode nurbsCurve -n "l_brow_mid_botShape" -p "l_brow_mid_bot";
	rename -uid "EE9DA469-4EFA-4586-7990-AB8F7909D892";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 0.18500216650655893 -0.18500216650655893
		0.18500216650655893 0.18500216650655893 -0.18500216650655893
		0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		-0.18500216650655893 0.18500216650655893 -0.18500216650655893
		-0.18500216650655893 0.18500216650655893 0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 0.18500216650655893
		0.18500216650655893 -0.18500216650655893 0.18500216650655893
		0.18500216650655893 0.18500216650655893 0.18500216650655893
		0.18500216650655893 0.18500216650655893 -0.18500216650655893
		0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		0.18500216650655893 -0.18500216650655893 0.18500216650655893
		0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		-0.18500216650655893 -0.18500216650655893 -0.18500216650655893
		;
createNode transform -n "l_brow_out_group" -p "l_brow";
	rename -uid "132782B5-462A-7807-2512-A18146439BC2";
	setAttr ".rp" -type "double3" 0 0 4.4408920985006271e-16 ;
	setAttr ".rpt" -type "double3" 1.7602731723223264e-16 -5.1391756989458877e-18 -3.6408944487105364e-17 ;
	setAttr ".sp" -type "double3" 0 0 4.4408920985006271e-16 ;
createNode transform -n "l_brow_out_group_1" -p "l_brow_out_group";
	rename -uid "14226017-4EF8-725B-E64F-F49DE02711D3";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".rpt" -type "double3" -0.0083187522378925759 1.0396143581420381e-16 0.00059264727034413116 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode transform -n "l_brow_out" -p "l_brow_out_group_1";
	rename -uid "B5A8F586-46A4-911B-EB2C-C39D5F5544B0";
	addAttr -ci true -sn "rotateToLength" -ln "rotateToLength" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove1" -ln "rotateToMove1" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove2" -ln "rotateToMove2" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove3" -ln "rotateToMove3" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "rotateToMove4" -ln "rotateToMove4" -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".rotateToLength" 0.49230769275186154;
	setAttr ".rotateToMove1" 0.67692307695173304;
createNode nurbsCurve -n "l_brow_out_1Shape" -p "l_brow_out";
	rename -uid "3ED7DBEC-4E76-9703-9F5F-8F90345CC94C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.27005833312067951 0.26173958088278665 0.30408721245735482
		0.0083187522378923556 0.37015566509428743 0.30408721245735482
		-0.25342082864489412 0.2617395808827867 0.30408721245735476
		-0.3618369128563948 3.4878972196155583e-16 0.30408721245735471
		-0.25342082864489435 -0.26173958088278626 0.30408721245735471
		0.008318752237892281 -0.37015566509428693 0.30408721245735476
		0.27005833312067884 -0.26173958088278637 0.30408721245735482
		0.37847441733217974 4.3422447273662952e-17 0.30408721245735482
		0.27005833312067951 0.26173958088278665 0.30408721245735482
		0.0083187522378923556 0.37015566509428743 0.30408721245735482
		-0.25342082864489412 0.2617395808827867 0.30408721245735476
		;
createNode transform -n "l_brow_local_out_rotateOffset" -p "l_brow_out";
	rename -uid "00644BB7-4DC2-3B0A-9FC3-BC90CA9B3746";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode transform -n "l_curve9_5_loc_moveOffset" -p "l_brow_local_out_rotateOffset";
	rename -uid "F854BFEF-476F-582D-4B26-C7AF5AC7AA40";
	setAttr ".rp" -type "double3" 0 0 0.0581 ;
	setAttr ".sp" -type "double3" 0 0 0.0581 ;
createNode transform -n "l_brow_local_5_group" -p "l_curve9_5_loc_moveOffset";
	rename -uid "97839686-4E42-4FAC-E4AE-C3997A7A58E2";
createNode transform -n "l_brow_local_5_group_1" -p "l_brow_local_5_group";
	rename -uid "3989DE35-47B6-4358-7003-91BB41CA7487";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
createNode transform -n "l_brow_local_5" -p "l_brow_local_5_group_1";
	rename -uid "DB1609B3-4E8C-5A8F-A02F-BD8ABB00F1AD";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 8.8817841970012523e-16 0 -2.2204460492503131e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 4.3790577010150533e-47 0 ;
createNode nurbsCurve -n "l_brow_local_5Shape" -p "l_brow_local_5";
	rename -uid "AA25AE90-4DE0-422E-4274-16B9E46D21D7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.06132837246453729 0.061328372464537359 0.16806907454159573
		-2.7755575615628914e-16 0.086731416097617864 0.16806907454159573
		-0.061328372464537623 0.061328372464537373 0.16806907454159573
		-0.086731416097618114 2.7523116077112389e-17 0.16806907454159573
		-0.061328372464537678 -0.061328372464537387 0.16806907454159573
		-3.3306690738754696e-16 -0.086731416097617864 0.16806907454159573
		0.061328372464537123 -0.061328372464537428 0.16806907454159573
		0.086731416097617614 -4.5185287198226695e-17 0.16806907454159573
		0.06132837246453729 0.061328372464537359 0.16806907454159573
		-2.7755575615628914e-16 0.086731416097617864 0.16806907454159573
		-0.061328372464537623 0.061328372464537373 0.16806907454159573
		;
createNode transform -n "l_curve_loc_08" -p "l_brow_local_5";
	rename -uid "0163D68E-416B-8313-A1CB-DC857118D9B4";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" 0.0086433655181775426 -0.00048311726623692999 -0.037327963693888473 ;
	setAttr ".spt" -type "double3" -2.7755575615628901e-17 -6.9388939039072315e-18 2.7755575615628938e-17 ;
createNode locator -n "l_curve_loc_08Shape" -p "l_curve_loc_08";
	rename -uid "4927A584-4877-F146-6309-9A944F6D2D02";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_5_top" -p "l_brow_local_5_group";
	rename -uid "C65E47C9-4909-D058-9BF1-67B3A11245A6";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 1.0798653637955624e-15 0.016566719817571081 6.0064800355696946e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" 1.1979449782889128e-33 -6.4653414173826202e-35 -1.2852323847137852e-33 ;
createNode nurbsCurve -n "l_brow_local_5_topShape" -p "l_brow_local_5_top";
	rename -uid "A65EBE24-4723-0364-FBE9-58950E2604C5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846885557 0.061328372464536637 0.16728831474681899
		2.138234801718486e-08 0.08673141609761699 0.16728831474681899
		-0.0613283510821893 0.061328372464536651 0.16728831474681899
		-0.086731394715269722 -7.4095938378061315e-16 0.16728831474681899
		-0.061328351082189356 -0.061328372464538108 0.16728831474681899
		2.138234801718486e-08 -0.086731416097618738 0.16728831474681899
		0.06132839384688539 -0.06132837246453815 0.16728831474681899
		0.086731437479965923 -8.1366778705595204e-16 0.16728831474681899
		0.061328393846885557 0.061328372464536637 0.16728831474681899
		2.138234801718486e-08 0.08673141609761699 0.16728831474681899
		-0.0613283510821893 0.061328372464536651 0.16728831474681899
		;
createNode transform -n "l_brow_local_5_bot" -p "l_brow_local_5_group";
	rename -uid "521DB183-4F19-59FA-9FBF-C8AA08804AA8";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 1.6132928326584306e-16 0.036124582186072465 1.1293049828609014e-15 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" 1.1979449782889128e-33 -6.4653414173826202e-35 -1.2852323847137852e-33 ;
createNode nurbsCurve -n "l_brow_local_5_botShape" -p "l_brow_local_5_bot";
	rename -uid "A34B063B-49B1-4011-2F4F-B6AC2AC0A4D8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.06132839384688462 0.061328372464537047 0.16757058166715699
		2.1382347066556395e-08 0.086731416097617489 0.16757058166715699
		-0.061328351082190244 0.061328372464537061 0.16757058166715699
		-0.086731394715270693 -3.0901323826238819e-16 0.16757058166715699
		-0.061328351082190299 -0.061328372464537699 0.16757058166715699
		2.1382347066556395e-08 -0.086731416097618239 0.16757058166715699
		0.061328393846884453 -0.061328372464537741 0.16757058166715699
		0.086731437479964937 -3.8172164153772707e-16 0.16757058166715699
		0.06132839384688462 0.061328372464537047 0.16757058166715699
		2.1382347066556395e-08 0.086731416097617489 0.16757058166715699
		-0.061328351082190244 0.061328372464537061 0.16757058166715699
		;
createNode transform -n "l_curve9_6_loc_moveOffset" -p "l_brow_local_out_rotateOffset";
	rename -uid "4C252C15-485D-4B50-433D-4FB5D8BEDA7A";
createNode transform -n "l_brow_local_6_group" -p "l_curve9_6_loc_moveOffset";
	rename -uid "41786743-486A-7F46-6164-5DAA0CE2517A";
createNode transform -n "l_brow_local_6_group_1" -p "l_brow_local_6_group";
	rename -uid "686BE014-4323-1ACF-4B2D-FAAAF68ECD49";
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
createNode transform -n "l_brow_local_6" -p "l_brow_local_6_group_1";
	rename -uid "3EAE4035-42E9-30CC-087A-9AAF4B709061";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 0 6.6613381477509392e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1.0000000000000002 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 2.7755575615628901e-17 4.3790577010150533e-47 6.1629758220391534e-33 ;
createNode nurbsCurve -n "l_brow_local_6Shape" -p "l_brow_local_6";
	rename -uid "2B921E2E-4F1F-EEFE-DA2D-D68AF74ACC83";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328372464537997 0.061328372464537415 0.14786423441070157
		3.0531133177191805e-16 0.086731416097617947 0.14786423441070157
		-0.061328372464536887 0.061328372464537415 0.14786423441070157
		-0.086731416097617434 6.9156479500555759e-17 0.14786423441070157
		-0.061328372464536943 -0.061328372464537345 0.14786423441070151
		3.0531133177191805e-16 -0.086731416097617781 0.14786423441070151
		0.061328372464537775 -0.061328372464537387 0.14786423441070151
		0.086731416097618294 -3.5519237747831276e-18 0.14786423441070157
		0.061328372464537997 0.061328372464537415 0.14786423441070157
		3.0531133177191805e-16 0.086731416097617947 0.14786423441070157
		-0.061328372464536887 0.061328372464537415 0.14786423441070157
		;
createNode transform -n "l_curve_loc_09" -p "l_brow_local_6";
	rename -uid "4227A603-478C-A002-0829-EAA378CC448F";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" -0.0060573328989588782 -0.0008342267977492733 -0.017004178242352515 ;
	setAttr ".spt" -type "double3" 5.551115123125779e-17 -2.0816681711721657e-17 -2.0816681711721682e-17 ;
createNode locator -n "l_curve_loc_09Shape" -p "l_curve_loc_09";
	rename -uid "5F592D59-4F09-CEB0-2D02-20A88FD1D8F7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_6_top" -p "l_brow_local_6_group";
	rename -uid "1BE16471-4EF6-BE61-C491-A98AE4531957";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 1.3530843112619095e-16 -0.062565330574229597 2.6367796834847468e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" -1.4479308087019426e-33 7.7813696054879767e-35 9.9424137894530092e-34 ;
createNode nurbsCurve -n "l_brow_local_6_topShape" -p "l_brow_local_6_top";
	rename -uid "8E65FD0C-4321-42DA-6F15-9E9FB071E9EF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846885987 0.061328372464536811 0.14841357136466518
		2.1382348445661559e-08 0.086731416097617114 0.14841357136466518
		-0.06132835108218887 0.061328372464536825 0.14841357136466518
		-0.086731394715269319 -5.8743635615666573e-16 0.14841357136466518
		-0.061328351082188926 -0.061328372464537935 0.14841357136466518
		2.1382348445661559e-08 -0.086731416097618613 0.14841357136466518
		0.06132839384688582 -0.061328372464537977 0.14841357136466518
		0.086731437479966325 -6.6014475943200461e-16 0.14841357136466518
		0.061328393846885987 0.061328372464536811 0.14841357136466518
		2.1382348445661559e-08 0.086731416097617114 0.14841357136466518
		-0.06132835108218887 0.061328372464536825 0.14841357136466518
		;
createNode transform -n "l_brow_local_6_bot" -p "l_brow_local_6_group";
	rename -uid "76FB9142-4B7F-2C60-EC97-888F476F7AD5";
	setAttr -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" -1.4479308087019426e-33 7.7813696054879767e-35 9.9424137894530092e-34 ;
createNode nurbsCurve -n "l_brow_local_6_botShape" -p "l_brow_local_6_bot";
	rename -uid "D60E746D-4515-7E48-77CE-CC99F310C6EE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846885043 0.061328372464537213 0.14869583828500318
		2.1382347495033094e-08 0.086731416097617614 0.14869583828500318
		-0.061328351082189814 0.061328372464537227 0.14869583828500318
		-0.086731394715270291 -1.5549021063844076e-16 0.14869583828500318
		-0.061328351082189869 -0.061328372464537532 0.14869583828500318
		2.1382347495033094e-08 -0.086731416097618114 0.14869583828500318
		0.061328393846884877 -0.061328372464537574 0.14869583828500318
		0.086731437479965354 -2.2819861391377965e-16 0.14869583828500318
		0.061328393846885043 0.061328372464537213 0.14869583828500318
		2.1382347495033094e-08 0.086731416097617614 0.14869583828500318
		-0.061328351082189814 0.061328372464537227 0.14869583828500318
		;
createNode transform -n "l_brow_local_7_rotateOffset" -p "l_brow_out";
	rename -uid "79130D5E-48B3-73F0-6B96-788E343402B5";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode transform -n "l_brow_local_7_group" -p "l_brow_local_7_rotateOffset";
	rename -uid "53BE29E0-4C4A-76F2-E6CC-BEA6C033334A";
createNode transform -n "l_brow_local_7_group_1" -p "l_brow_local_7_group";
	rename -uid "231390E2-414D-D357-6591-E7B5554F04F2";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode transform -n "l_brow_local_7" -p "l_brow_local_7_group_1";
	rename -uid "CBBA1EB1-4C3D-C73D-72F0-2BBF4A1DEBA5";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 1.3322676295501878e-15 -2.2204460492503131e-16 -8.8817841970012523e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 4.3790577010150533e-47 -2.7369110631344083e-48 ;
createNode nurbsCurve -n "l_brow_local_7Shape" -p "l_brow_local_7";
	rename -uid "11032B06-4306-F131-0301-FF9797560D28";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328372464536485 0.061328372464537317 0.11685676523725148
		-1.1102230246251565e-15 0.086731416097617822 0.11685676523725148
		-0.061328372464538483 0.061328372464537331 0.11685676523725148
		-0.086731416097619002 -2.7988035154145438e-17 0.11685676523725148
		-0.061328372464538539 -0.061328372464537428 0.11685676523725148
		-1.1657341758564144e-15 -0.086731416097617905 0.11685676523725148
		0.061328372464536263 -0.06132837246453747 0.11685676523725148
		0.086731416097616809 -1.0069643842948432e-16 0.11685676523725148
		0.061328372464536485 0.061328372464537317 0.11685676523725148
		-1.1102230246251565e-15 0.086731416097617822 0.11685676523725148
		-0.061328372464538483 0.061328372464537331 0.11685676523725148
		;
createNode transform -n "l_curve_loc_10" -p "l_brow_local_7";
	rename -uid "25861445-4BD6-629E-E55C-F9834AE6FCB7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.027045074207603541 -8.2339733989411634e-16 2.6367796834847468e-16 ;
createNode locator -n "l_curve_loc_Shape10" -p "l_curve_loc_10";
	rename -uid "75B736CD-44F7-C671-2D04-74A71EDD88C8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_curve_loc_11" -p "l_brow_local_7";
	rename -uid "3E41CD10-4BB8-9D61-A3D7-9FB2ED695636";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.033451215969907917 -1.2656976161595779e-15 -8.6389229103644993e-16 ;
createNode locator -n "l_curve_loc_Shape11" -p "l_curve_loc_11";
	rename -uid "2B2C7791-4321-0ED4-3D7B-ECB3D3435184";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_brow_local_7_top" -p "l_brow_local_7_group";
	rename -uid "A42A6E8C-4CDF-472B-2E09-B9BB74115CD6";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -2.1510571102112408e-16 -0.019418709264114035 -3.9497485143646927e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" -2.0664256483059866e-33 -6.4653414173826202e-35 -1.5850572719334969e-33 ;
createNode nurbsCurve -n "l_brow_local_7_topShape" -p "l_brow_local_7_top";
	rename -uid "591C90EB-4F01-5205-0DF6-0BB790D65691";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846883766 0.061328372464537324 0.11693261445036246
		2.1382346228684956e-08 0.086731416097617614 0.11693261445036246
		-0.06132835108219109 0.061328372464537338 0.11693261445036246
		-0.086731394715271554 -8.4366548123391669e-17 0.11693261445036246
		-0.061328351082191146 -0.061328372464537421 0.11693261445036246
		2.1382346228684956e-08 -0.086731416097618114 0.11693261445036246
		0.0613283938468836 -0.061328372464537463 0.11693261445036246
		0.086731437479964091 -1.5707495139873056e-16 0.11693261445036246
		0.061328393846883766 0.061328372464537324 0.11693261445036246
		2.1382346228684956e-08 0.086731416097617614 0.11693261445036246
		-0.06132835108219109 0.061328372464537338 0.11693261445036246
		;
createNode transform -n "l_brow_local_7_bot" -p "l_brow_local_7_group";
	rename -uid "C320D1D6-4412-4097-38E8-4AA8DB92A328";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0.047729763709386891 0.078047376950070926 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
	setAttr ".rpt" -type "double3" -2.0664256483059866e-33 -6.4653414173826202e-35 -1.5850572719334969e-33 ;
createNode nurbsCurve -n "l_brow_local_7_botShape" -p "l_brow_local_7_bot";
	rename -uid "84F93D95-4BB4-3167-19A2-A68D6CBF5B04";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.061328393846882823 0.061328372464537727 0.11721488137070046
		2.1382345278056492e-08 0.086731416097618114 0.11721488137070046
		-0.061328351082192034 0.061328372464537741 0.11721488137070046
		-0.086731394715272525 3.475795973948333e-16 0.11721488137070046
		-0.06132835108219209 -0.061328372464537019 0.11721488137070046
		2.1382345278056492e-08 -0.086731416097617614 0.11721488137070046
		0.061328393846882656 -0.061328372464537061 0.11721488137070046
		0.086731437479963119 2.7487119411949441e-16 0.11721488137070046
		0.061328393846882823 0.061328372464537727 0.11721488137070046
		2.1382345278056492e-08 0.086731416097618114 0.11721488137070046
		-0.061328351082192034 0.061328372464537741 0.11721488137070046
		;
createNode transform -n "l_brow_out_top" -p "l_brow_out_group";
	rename -uid "BB4F682D-4A8C-23B2-509D-3383C5DA010A";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -0.0047305100810699973 -0.42312916535977113 -0.17372011193489573 ;
	setAttr ".r" -type "double3" -12.008854663842166 -1.1428668401388893 -5.3566648827794268 ;
	setAttr ".rp" -type "double3" -8.8817841970012523e-16 0 -2.2204460492503131e-16 ;
	setAttr ".sp" -type "double3" -8.8817841970012543e-16 0 -2.2204460492503136e-16 ;
	setAttr ".spt" -type "double3" 1.9721522630525291e-31 0 4.9303806576313227e-32 ;
createNode nurbsCurve -n "l_brow_out_topShape" -p "l_brow_out_top";
	rename -uid "504DD8B4-4464-B0C2-634D-FDA4B4CF9123";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.18500216650655893 0.18500216650655893 0.18500216650655898
		-0.18500216650655898 0.18500216650655893 -0.18500216650655887
		0.18500216650655893 0.18500216650655893 -0.18500216650655882
		0.18500216650655898 0.18500216650655893 0.18500216650655904
		-0.18500216650655893 0.18500216650655893 0.18500216650655898
		-0.18500216650655893 -0.18500216650655893 0.18500216650655898
		-0.18500216650655898 -0.18500216650655893 -0.18500216650655887
		-0.18500216650655898 0.18500216650655893 -0.18500216650655887
		-0.18500216650655893 0.18500216650655893 0.18500216650655898
		-0.18500216650655893 -0.18500216650655893 0.18500216650655898
		0.18500216650655898 -0.18500216650655893 0.18500216650655904
		0.18500216650655898 0.18500216650655893 0.18500216650655904
		0.18500216650655893 0.18500216650655893 -0.18500216650655882
		0.18500216650655893 -0.18500216650655893 -0.18500216650655882
		0.18500216650655898 -0.18500216650655893 0.18500216650655904
		0.18500216650655893 -0.18500216650655893 -0.18500216650655882
		-0.18500216650655898 -0.18500216650655893 -0.18500216650655887
		;
createNode transform -n "l_brow_out_bot" -p "l_brow_out_group";
	rename -uid "64C7E314-498C-AD80-622D-B6B56986F7C4";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0.0036999412189725927 0.069483740397719235 0.0073467323615723935 ;
	setAttr ".r" -type "double3" 0 0 17.24290479800343 ;
	setAttr ".rp" -type "double3" -8.8817841970012523e-16 0 -2.2204460492503131e-16 ;
	setAttr ".sp" -type "double3" -8.8817841970012543e-16 0 -2.2204460492503136e-16 ;
	setAttr ".spt" -type "double3" 1.9721522630525291e-31 0 4.9303806576313227e-32 ;
createNode nurbsCurve -n "l_brow_out_botShape" -p "l_brow_out_bot";
	rename -uid "F6E42320-4EBF-AE4F-7F69-30B10929E4ED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.18500216650655893 0.18500216650655893 0.18500216650655898
		-0.18500216650655898 0.18500216650655893 -0.18500216650655887
		0.18500216650655893 0.18500216650655893 -0.18500216650655882
		0.18500216650655898 0.18500216650655893 0.18500216650655904
		-0.18500216650655893 0.18500216650655893 0.18500216650655898
		-0.18500216650655893 -0.18500216650655893 0.18500216650655898
		-0.18500216650655898 -0.18500216650655893 -0.18500216650655887
		-0.18500216650655898 0.18500216650655893 -0.18500216650655887
		-0.18500216650655893 0.18500216650655893 0.18500216650655898
		-0.18500216650655893 -0.18500216650655893 0.18500216650655898
		0.18500216650655898 -0.18500216650655893 0.18500216650655904
		0.18500216650655898 0.18500216650655893 0.18500216650655904
		0.18500216650655893 0.18500216650655893 -0.18500216650655882
		0.18500216650655893 -0.18500216650655893 -0.18500216650655882
		0.18500216650655898 -0.18500216650655893 0.18500216650655904
		0.18500216650655893 -0.18500216650655893 -0.18500216650655882
		-0.18500216650655898 -0.18500216650655893 -0.18500216650655887
		;
createNode transform -n "l_brow_last" -p "l_brow";
	rename -uid "30B03FD1-4024-18E4-E718-258634CE233A";
	setAttr -l on -k off ".v" no;
	setAttr ".rp" -type "double3" 0.0083187522378920225 -4.4408920985006271e-16 0.058087172128885568 ;
	setAttr ".rpt" -type "double3" 0.02829506273834876 0 -0.012231422678987577 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".spt" -type "double3" -3.4694469519536119e-18 0 -3.4694469519536123e-17 ;
createNode nurbsCurve -n "l_brow_last_1Shape" -p "l_brow_last";
	rename -uid "0E0A28D8-4DD4-3896-854C-9A809FB5747C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.27005833312067951 0.26173958088278665 0.30408721245735482
		0.0083187522378923556 0.37015566509428743 0.30408721245735482
		-0.25342082864489412 0.2617395808827867 0.30408721245735476
		-0.3618369128563948 3.4878972196155583e-16 0.30408721245735471
		-0.25342082864489435 -0.26173958088278626 0.30408721245735471
		0.008318752237892281 -0.37015566509428693 0.30408721245735476
		0.27005833312067884 -0.26173958088278637 0.30408721245735482
		0.37847441733217974 4.3422447273662952e-17 0.30408721245735482
		0.27005833312067951 0.26173958088278665 0.30408721245735482
		0.0083187522378923556 0.37015566509428743 0.30408721245735482
		-0.25342082864489412 0.2617395808827867 0.30408721245735476
		;
createNode transform -n "r_brow_group" -p "controls";
	rename -uid "744B1593-4F89-0AF3-F569-89A23C4409BB";
createNode transform -n "r_brow" -p "r_brow_group";
	rename -uid "0A5F4689-4081-4828-8921-6F83DCC36110";
	addAttr -ci true -sn "limits" -ln "limits" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_limits" -ln "default_limits" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mtye" yes;
	setAttr ".xtye" yes;
	setAttr -cb on ".limits" yes;
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_limits" -type "string" "True";
createNode nurbsCurve -n "r_browShape" -p "r_brow";
	rename -uid "5B2D459D-43A2-E205-0397-658047853CDA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".tw" yes;
createNode transform -n "r_brow_in_group" -p "r_brow";
	rename -uid "39FA7BD2-43D3-DC13-3D0F-A89B6A8E1279";
	setAttr ".rp" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".rpt" -type "double3" 1.9737686423141927e-17 0 -9.1518945047367793e-17 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode transform -n "r_brow_in_group_1" -p "r_brow_in_group";
	rename -uid "F57A0DAA-4517-934F-B2D7-BF84C3FCD929";
	setAttr ".rp" -type "double3" -2.2204460492503131e-16 0 0 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-16 0 0 ;
createNode transform -n "r_brow_in" -p "r_brow_in_group_1";
	rename -uid "9696246C-4FB6-BDDD-04C2-DC87BDB07999";
	setAttr -l on -k off ".v";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
createNode nurbsCurve -n "r_brow_in_1Shape" -p "r_brow_in";
	rename -uid "C71DEF90-4829-497F-2036-7C925B29462C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".tw" yes;
createNode transform -n "r_brow_local_2_rotateOffset" -p "r_brow_in";
	rename -uid "5FB1C080-4F37-D561-430F-D5B670B4933E";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-16 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-16 0 ;
createNode transform -n "r_curve9_2_loc_moveOffset" -p "r_brow_local_2_rotateOffset";
	rename -uid "7E027184-431B-BAD8-B021-4495A71E89DA";
	setAttr ".rp" -type "double3" -0.16502494294434356 -4.4408920985006262e-16 -2.7755575615628914e-17 ;
	setAttr ".sp" -type "double3" -0.16502494294434356 -4.4408920985006262e-16 -2.7755575615628914e-17 ;
createNode transform -n "r_brow_local_2_group" -p "r_curve9_2_loc_moveOffset";
	rename -uid "EAD3F184-4B0E-9181-1E7D-CFADA5C81D4C";
createNode transform -n "r_brow_local_2_group_1" -p "r_brow_local_2_group";
	rename -uid "2BC616E7-42CC-108F-0C3B-39A12F692B0E";
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode transform -n "r_brow_local_2" -p "r_brow_local_2_group_1";
	rename -uid "C5554C38-4EB3-02D1-23EA-9F9EFD26F043";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.2204460492503131e-16 4.4408920985006262e-16 1.3877787807814457e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_brow_local_2Shape" -p "r_brow_local_2";
	rename -uid "9DDD4181-4F18-78B0-7AB0-D081272C1455";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_05" -p "r_brow_local_2";
	rename -uid "A92B0658-466F-401E-3347-469BFB01F2AA";
	setAttr ".v" no;
	setAttr ".spt" -type "double3" 0 1.4791141972893969e-31 0 ;
createNode locator -n "r_curve_loc_05Shape" -p "r_curve_loc_05";
	rename -uid "530ACC6F-4706-A619-8E67-C0A94D2540DE";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" 0 -2.970714914637658e-17 -5.5511151231257827e-17 ;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_brow_local_1_moveOffset" -p "r_brow_in";
	rename -uid "1FD8B6DE-4F38-962C-CF3D-2B9404067E86";
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
createNode transform -n "r_brow_local_1_rotateOffset" -p "r_brow_local_1_moveOffset";
	rename -uid "1E36D7A1-45C1-72BF-2384-7696DAEC62E0";
createNode transform -n "r_brow_local_1_group" -p "r_brow_local_1_rotateOffset";
	rename -uid "06CBF1B6-4D61-D424-57C6-A181DD8A70F8";
	addAttr -ci true -k true -sn "test" -ln "test" -at "double";
	addAttr -ci true -k true -sn "test1" -ln "test1" -at "double";
	addAttr -ci true -k true -sn "test2" -ln "test2" -at "double";
	setAttr ".spt" -type "double3" 0 -4.3790577010150533e-47 0 ;
createNode transform -n "r_brow_local_1_group_1" -p "r_brow_local_1_group";
	rename -uid "4C8AAA2C-414D-F188-24F9-05B9A917B172";
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
createNode transform -n "r_brow_local_1" -p "r_brow_local_1_group_1";
	rename -uid "2C2F5AC0-4E7D-0955-C89B-BDB465ADD6E4";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 1.1102230246251565e-16 0 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".spt" -type "double3" 0 9.8607613152626465e-32 -6.1629758220391534e-33 ;
createNode nurbsCurve -n "r_brow_local_1Shape" -p "r_brow_local_1";
	rename -uid "AFBADD41-4C02-A069-3599-77A0F076DF3B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_04" -p "r_brow_local_1";
	rename -uid "A9D7C0D8-4E38-17BC-A535-92B6BB5FF6A4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.05 -3.5527136788005009e-15 -1.8301332671555315e-16 ;
	setAttr ".spt" -type "double3" 0 9.8607613152626432e-32 0 ;
createNode locator -n "r_curve_loc_04Shape" -p "r_curve_loc_04";
	rename -uid "03879659-4C43-5E59-74C5-5D9CEC6133DF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_curve_loc_03" -p "r_brow_local_1";
	rename -uid "B9CFC553-449B-105C-0E10-E5A11F760237";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" -0.0010308543800449099 0 0.017306567772824237 ;
	setAttr ".spt" -type "double3" -5.5511151231257802e-17 0 -1.7347234759768063e-18 ;
createNode locator -n "r_curve_loc_03Shape" -p "r_curve_loc_03";
	rename -uid "CBB75A66-4CD5-34AB-F904-13BF5BBF350E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_curve_loc_02" -p "r_brow_local_1";
	rename -uid "498D1519-479C-8990-47EE-A382FCCB1BED";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.05 0 3.3618940964430521e-15 ;
	setAttr ".rpt" -type "double3" -0.0010349059554317641 0 0.017445139082783202 ;
	setAttr ".spt" -type "double3" -5.5511151231257802e-17 0 -1.7347234759768063e-18 ;
createNode locator -n "r_curve_loc_02Shape" -p "r_curve_loc_02";
	rename -uid "264245EE-4129-9363-DF5C-5F8C95AE48B6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_brow_mid_group" -p "r_brow";
	rename -uid "FF30DD87-4670-C7D0-079D-A1883A952227";
	setAttr ".rp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".rpt" -type "double3" -5.1287669052061909e-19 0 2.1336892135172019e-17 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
createNode transform -n "r_brow_mid_group_1" -p "r_brow_mid_group";
	rename -uid "2F988269-4521-68E5-A816-EF9E80BDD53B";
	setAttr ".t" -type "double3" 4.4408920985006262e-16 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
createNode transform -n "r_brow_mid" -p "r_brow_mid_group_1";
	rename -uid "5F71C9F3-41CF-EE19-5AF7-D793EB32CC74";
	setAttr -l on -k off ".v";
	setAttr ".rp" -type "double3" 4.4408920985006281e-16 0 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".spt" -type "double3" 9.8607613152626519e-32 0 0 ;
createNode nurbsCurve -n "r_brow_midShape" -p "r_brow_mid";
	rename -uid "72FEA752-44F2-1F6A-48FF-4684870BD1D9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".tw" yes;
createNode transform -n "r_brow_local_3_rotateOffset" -p "r_brow_mid";
	rename -uid "0EF01166-4DC2-E5C8-9757-ED89F0528619";
	setAttr ".rp" -type "double3" 4.4408920985006271e-16 0 0 ;
	setAttr ".sp" -type "double3" 4.4408920985006271e-16 0 0 ;
createNode transform -n "r_curve9_3_loc_moveOffset" -p "r_brow_local_3_rotateOffset";
	rename -uid "D539B096-4EA1-7DCC-E17F-B39447D2B7FC";
createNode transform -n "r_brow_local_3_group" -p "r_curve9_3_loc_moveOffset";
	rename -uid "1E82EAF3-4F51-A3C7-7E4B-3293165CAAC5";
createNode transform -n "r_brow_local_3_group_1" -p "r_brow_local_3_group";
	rename -uid "96504FB4-4597-0B82-E0CD-F795B1C3CEE8";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999978 ;
createNode transform -n "r_brow_local_3" -p "r_brow_local_3_group_1";
	rename -uid "A39E0C02-4D6F-BA9A-0890-6B9FAA744D2A";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -3.3306690738754696e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -9.8607613152626454e-32 6.1629758220391534e-33 ;
createNode nurbsCurve -n "r_brow_local_3Shape" -p "r_brow_local_3";
	rename -uid "C9F3D6FF-4B82-4784-0003-4C89E1483235";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_06" -p "r_brow_local_3";
	rename -uid "080A6464-4754-442E-4E73-BB8B3D622311";
	setAttr ".v" no;
	setAttr ".spt" -type "double3" -2.7755575615628901e-17 0 2.4651903288156597e-32 ;
createNode locator -n "r_curve_loc_06Shape" -p "r_curve_loc_06";
	rename -uid "62230003-42B9-1121-28F5-99B3D84E20BA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_brow_local_4_moveOffset" -p "r_brow_local_3_rotateOffset";
	rename -uid "777F8EEF-4877-00AD-C0CF-80A2A4FDB734";
createNode transform -n "r_brow_local_4_group" -p "r_brow_local_4_moveOffset";
	rename -uid "E1A3D1C5-46CB-1254-A8CB-0C91F2028FF1";
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
createNode transform -n "r_brow_local_4" -p "r_brow_local_4_group";
	rename -uid "127CC114-4F7E-5477-EEB8-1A89BFBA7360";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 0 1.1102230246251565e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_brow_local_4Shape" -p "r_brow_local_4";
	rename -uid "B1427222-4F7B-DEDE-BC55-3DA90AC68F38";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_07" -p "r_brow_local_4";
	rename -uid "866D5E25-475A-82B6-DB76-EB89933DFA1D";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" 0.011605270378272942 0 0.060874554771765892 ;
createNode locator -n "r_curve_loc_07Shape" -p "r_curve_loc_07";
	rename -uid "5589890F-405A-49B4-1990-D6994F6857A1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_brow_out_group" -p "r_brow";
	rename -uid "C1427210-48ED-27D7-EE02-9982F67294AF";
	setAttr ".rp" -type "double3" 0 0 4.4408920985006271e-16 ;
	setAttr ".rpt" -type "double3" 1.7602731723223264e-16 -5.1391756989458877e-18 -3.6408944487105364e-17 ;
	setAttr ".sp" -type "double3" 0 0 4.4408920985006271e-16 ;
createNode transform -n "r_brow_out_group_1" -p "r_brow_out_group";
	rename -uid "E6107758-4A66-AABA-15E0-5BB95C3EC4A5";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".rpt" -type "double3" -0.0083187522378925759 1.0396143581420381e-16 0.00059264727034413116 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode transform -n "r_brow_out" -p "r_brow_out_group_1";
	rename -uid "FE1BB641-4F49-1DA3-ADC6-2DA9C56A0091";
	setAttr -l on -k off ".v";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode nurbsCurve -n "r_brow_out_1Shape" -p "r_brow_out";
	rename -uid "C55DFC88-4787-8747-DCF2-27B3CD4C988A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".tw" yes;
createNode transform -n "r_brow_local_out_rotateOffset" -p "r_brow_out";
	rename -uid "12EBDE1E-47CF-3316-E5BF-B183A0A172F7";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode transform -n "r_curve9_5_loc_moveOffset" -p "r_brow_local_out_rotateOffset";
	rename -uid "49B917B9-4E4E-EF2E-B89A-62B2F1170C68";
	setAttr ".rp" -type "double3" 0 0 0.0581 ;
	setAttr ".sp" -type "double3" 0 0 0.0581 ;
createNode transform -n "r_brow_local_5_group" -p "r_curve9_5_loc_moveOffset";
	rename -uid "A5BBD253-44B5-3418-74C8-70BB9DEAF6FE";
createNode transform -n "r_brow_local_5_group_1" -p "r_brow_local_5_group";
	rename -uid "D89DF7D1-4C73-7983-55B4-1AB1E92A9BA8";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
createNode transform -n "r_brow_local_5" -p "r_brow_local_5_group_1";
	rename -uid "4C9046A5-4658-B9F3-CC83-778A89E3C194";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 8.8817841970012523e-16 0 -2.2204460492503131e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 4.3790577010150533e-47 0 ;
createNode nurbsCurve -n "r_brow_local_5Shape" -p "r_brow_local_5";
	rename -uid "277CE660-4B49-A9BF-6CEE-DE9CCFD9D42D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_08" -p "r_brow_local_5";
	rename -uid "78D8E7DE-4950-04B6-B0E1-D5B755EC5E32";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" 0.0086433655181775426 -0.00048311726623692999 -0.037327963693888473 ;
	setAttr ".spt" -type "double3" -2.7755575615628901e-17 -6.9388939039072315e-18 2.7755575615628938e-17 ;
createNode locator -n "r_curve_loc_08Shape" -p "r_curve_loc_08";
	rename -uid "2200EF00-417E-0E65-418E-F9961CBBE858";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_curve9_6_loc_moveOffset" -p "r_brow_local_out_rotateOffset";
	rename -uid "D3DA6A68-4B5E-F77C-3542-1CA337B88328";
	setAttr ".rp" -type "double3" 0 0 0.0581 ;
	setAttr ".sp" -type "double3" 0 0 0.0581 ;
createNode transform -n "r_brow_local_6_group" -p "r_curve9_6_loc_moveOffset";
	rename -uid "AF699A37-4843-37FD-94AB-3A808265A920";
createNode transform -n "r_brow_local_6_group_1" -p "r_brow_local_6_group";
	rename -uid "907F8995-47E3-2439-113A-CCBEE02EDFF1";
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
createNode transform -n "r_brow_local_6" -p "r_brow_local_6_group_1";
	rename -uid "1F4978BF-4649-F6BB-66FC-6CA147E64082";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 0 6.6613381477509392e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1.0000000000000002 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 2.7755575615628901e-17 4.3790577010150533e-47 6.1629758220391534e-33 ;
createNode nurbsCurve -n "r_brow_local_6Shape" -p "r_brow_local_6";
	rename -uid "BF7123B5-4890-EBD5-B7E1-8BB351B9CAE6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_09" -p "r_brow_local_6";
	rename -uid "A20EE35D-4B69-03D9-6BF8-BABEE2A42585";
	setAttr ".v" no;
	setAttr ".rpt" -type "double3" -0.0060573328989588782 -0.0008342267977492733 -0.017004178242352515 ;
	setAttr ".spt" -type "double3" 5.551115123125779e-17 -2.0816681711721657e-17 -2.0816681711721682e-17 ;
createNode locator -n "r_curve_loc_09Shape" -p "r_curve_loc_09";
	rename -uid "2C11EAD4-474C-85E1-A7BA-D9B864B78657";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_brow_local_7_rotateOffset" -p "r_brow_out";
	rename -uid "DDF8EDB7-4083-7911-0928-86A5117736BD";
	setAttr ".rp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
createNode transform -n "r_brow_local_7_group" -p "r_brow_local_7_rotateOffset";
	rename -uid "01B2DED1-4D32-997F-BA1A-BAB507B0C5E4";
createNode transform -n "r_brow_local_7_group_1" -p "r_brow_local_7_group";
	rename -uid "81075915-4B4A-67EC-9A2C-D587BDC2CC58";
createNode transform -n "r_brow_local_7" -p "r_brow_local_7_group_1";
	rename -uid "E7A5BE7C-4007-9B47-8133-C983A26C0B63";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 1.3322676295501878e-15 -2.2204460492503131e-16 -8.8817841970012523e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 4.3790577010150533e-47 -2.7369110631344083e-48 ;
createNode nurbsCurve -n "r_brow_local_7Shape" -p "r_brow_local_7";
	rename -uid "B98D22FF-4BCC-E646-10C1-24811AD5B8E5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".tw" yes;
createNode transform -n "r_curve_loc_10" -p "r_brow_local_7";
	rename -uid "31DCB233-45AB-B137-C8D2-9A9593158A5E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.05 3.725860765746436e-16 1.3287981825982342e-15 ;
	setAttr ".rp" -type "double3" -5.551115123125779e-17 2.0816681711721657e-17 2.0816681711721673e-17 ;
	setAttr ".rpt" -type "double3" -2.8931106410549319e-18 -3.0299817608164079e-18 -5.9596333507377932e-18 ;
createNode locator -n "r_curve_loc_10Shape" -p "r_curve_loc_10";
	rename -uid "96AE044C-492B-1AC5-23B2-71BBA0DB3853";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_curve_loc_11" -p "r_brow_local_7";
	rename -uid "2CD8038B-44BA-D6A0-E327-FCBF73E2157F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.05 3.6041590718849381e-15 -1.4155343563970746e-15 ;
	setAttr ".rp" -type "double3" -5.551115123125779e-17 2.0816681711721657e-17 2.0816681711721673e-17 ;
	setAttr ".rpt" -type "double3" -2.8931106410549319e-18 -3.0299817608164079e-18 -5.9596333507377932e-18 ;
createNode locator -n "r_curve_loc_11Shape" -p "r_curve_loc_11";
	rename -uid "DBAB314A-405C-664C-253E-328BB962D2AF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_brow_last" -p "r_brow";
	rename -uid "743C9CD7-4C8C-C52F-825D-AD8A11AC1785";
	setAttr -l on -k off ".v" no;
	setAttr ".rp" -type "double3" 0.0083187522378920277 -4.4408920985006271e-16 -0.058087172128885603 ;
	setAttr ".rpt" -type "double3" -0.065185966986014449 -0.0059440557057102413 0.044892124069687206 ;
	setAttr ".sp" -type "double3" 0.008318752237892026 -4.4408920985006271e-16 0.058087172128885603 ;
	setAttr ".spt" -type "double3" 1.7347234759768079e-18 0 -0.11617434425777121 ;
createNode nurbsCurve -n "r_brow_last_1Shape" -p "r_brow_last";
	rename -uid "8145EBF2-4BC9-9268-44A3-90AB67F5F4FC";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.27005833312067951 0.26173958088278665 0.30408721245735482
		0.0083187522378923556 0.37015566509428743 0.30408721245735482
		-0.25342082864489412 0.2617395808827867 0.30408721245735476
		-0.3618369128563948 3.4878972196155583e-16 0.30408721245735471
		-0.25342082864489435 -0.26173958088278626 0.30408721245735471
		0.008318752237892281 -0.37015566509428693 0.30408721245735476
		0.27005833312067884 -0.26173958088278637 0.30408721245735482
		0.37847441733217974 4.3422447273662952e-17 0.30408721245735482
		0.27005833312067951 0.26173958088278665 0.30408721245735482
		0.0083187522378923556 0.37015566509428743 0.30408721245735482
		-0.25342082864489412 0.2617395808827867 0.30408721245735476
		;
createNode transform -n "brow_center_group" -p "controls";
	rename -uid "ADBBDD83-4352-6C11-E36F-13A5D1E72BBA";
createNode transform -n "brow_center_group_1" -p "brow_center_group";
	rename -uid "0A007B28-421B-D35C-AC09-4DB7876EB18F";
createNode transform -n "brow_center" -p "brow_center_group_1";
	rename -uid "94CEF185-4353-023E-DD0E-B5B60D2B0500";
	addAttr -ci true -sn "auto" -ln "auto" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".auto";
createNode nurbsCurve -n "brow_centerShape" -p "brow_center";
	rename -uid "0DFAF580-40CB-6B98-B940-82AC8CCE9141";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.13854366353029141 0.13851255689320272 0.20811658282990531
		-1.2975446028874219e-09 0.19589922184576541 0.20811658282990531
		-0.13854366612537994 0.13851255689320272 0.20811658282990531
		-0.19593033107794278 -3.1107934632728625e-05 0.20811658282990531
		-0.13854366612538047 -0.13857477276246841 0.20811658282990531
		-1.2975446028874219e-09 -0.19596143771503094 0.20811658282990531
		0.13854366353029088 -0.13857477276246849 0.20811658282990531
		0.1959303284828538 -3.1107934632892861e-05 0.20811658282990531
		0.13854366353029141 0.13851255689320272 0.20811658282990531
		-1.2975446028874219e-09 0.19589922184576541 0.20811658282990531
		-0.13854366612537994 0.13851255689320272 0.20811658282990531
		;
createNode transform -n "l_curve_loc_01" -p "brow_center";
	rename -uid "68991CB5-4159-D73A-B25F-738F000B8679";
	setAttr ".v" no;
createNode locator -n "l_curve_loc_01Shape" -p "l_curve_loc_01";
	rename -uid "7D571957-43C3-648A-77E4-14BD16102D29";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode joint -n "center_joint" -p "brow_center";
	rename -uid "7F78EB26-41C3-013B-8AA6-5898070CF102";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".jo" -type "double3" 0 0.020524929560431088 0.0015670630755830126 ;
	setAttr ".bps" -type "matrix" 0.99999993546247146 2.7350408496995549e-05 -0.00035822759190772338 0
		 -2.7350410251952839e-05 0.9999999996259773 0 0 0.00035822759177374375 9.79767157682776e-09 0.99999993583649416 0
		 0.07869584205023189 1.8144733465923859 -0.31882773645014717 1;
	setAttr ".liw" yes;
createNode transform -n "l_curve_loc_12" -p "controls";
	rename -uid "6567D327-44F4-77E8-D30E-9DB7F545D6AB";
	setAttr ".v" no;
createNode locator -n "l_curve_loc_12Shape" -p "l_curve_loc_12";
	rename -uid "9C9002E9-4157-7BDA-C1A4-B7B990D868ED";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "r_curve_loc_12" -p "controls";
	rename -uid "E96E6D88-417E-1FE1-5B90-31B79618CBC8";
	setAttr ".v" no;
createNode locator -n "r_curve_loc_12Shape" -p "r_curve_loc_12";
	rename -uid "E76F1E7E-410D-2F06-1986-6AB82E2C0F06";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "output" -p "mod";
	rename -uid "D65FD662-43FE-8FD0-2F2F-2A8EE067FB7F";
createNode transform -n "outJoints" -p "output";
	rename -uid "AB9FBA0E-4206-D046-3C9E-CF87ED2B65EB";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "B7185932-4DEB-5BCF-441D-1983F84E6457";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ds" 2;
createNode joint -n "center_outJoint" -p "root_outJoint";
	rename -uid "67426A94-4165-E105-5C99-07AD73FCD4F9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".jo" -type "double3" 0 0.020524929560431074 0.0015670630755830136 ;
	setAttr ".bps" -type "matrix" 0.99999993546247146 2.7350408496995549e-05 -0.00035822759190772338 0
		 -2.7350410251952839e-05 0.9999999996259773 0 0 0.00035822759177374375 9.79767157682776e-09 0.99999993583649416 0
		 0.07869584205023189 1.8144733465923859 -0.31882773645014717 1;
	setAttr ".liw" yes;
createNode transform -n "bs_weights" -p "output";
	rename -uid "37F78733-4234-0A17-A792-A88BA071DD14";
	addAttr -ci true -sn "l_brow_1_up" -ln "l_brow_1_up" -at "double";
	addAttr -ci true -sn "l_brow_2_up" -ln "l_brow_2_up" -at "double";
	addAttr -ci true -sn "l_brow_3_up" -ln "l_brow_3_up" -at "double";
	addAttr -ci true -sn "r_brow_1_up" -ln "r_brow_1_up" -at "double";
	addAttr -ci true -sn "r_brow_2_up" -ln "r_brow_2_up" -at "double";
	addAttr -ci true -sn "r_brow_3_up" -ln "r_brow_3_up" -at "double";
	addAttr -ci true -sn "l_brow_1_down" -ln "l_brow_1_down" -at "double";
	addAttr -ci true -sn "l_brow_2_down" -ln "l_brow_2_down" -at "double";
	addAttr -ci true -sn "l_brow_3_down" -ln "l_brow_3_down" -at "double";
	addAttr -ci true -sn "r_brow_1_down" -ln "r_brow_1_down" -at "double";
	addAttr -ci true -sn "r_brow_2_down" -ln "r_brow_2_down" -at "double";
	addAttr -ci true -sn "r_brow_3_down" -ln "r_brow_3_down" -at "double";
	setAttr -k on ".l_brow_1_up";
	setAttr -k on ".l_brow_2_up";
	setAttr -k on ".l_brow_3_up";
	setAttr -k on ".r_brow_1_up";
	setAttr -k on ".r_brow_2_up";
	setAttr -k on ".r_brow_3_up";
	setAttr -k on ".l_brow_1_down";
	setAttr -k on ".l_brow_2_down";
	setAttr -k on ".l_brow_3_down";
	setAttr -k on ".r_brow_1_down";
	setAttr -k on ".r_brow_2_down";
	setAttr -k on ".r_brow_3_down";
createNode transform -s -n "persp";
	rename -uid "6DD988D0-4F67-01C8-21B5-089512DF5F58";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5.4220420250924803 24.545028794342002 14.805167171116413 ;
	setAttr ".r" -type "double3" -25.800000000000026 19.999999999999943 8.4616889903941926e-16 ;
	setAttr ".rp" -type "double3" 0 0 2.2204460492503131e-16 ;
	setAttr ".rpt" -type "double3" 7.8318074438749568e-15 2.2130181764198789e-14 -1.4375173266478273e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C0598692-4A65-CD2F-2E76-769943D8CE56";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 11.86607086222687;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.097290821466243127 17.745574560362151 6.1984825378498254 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "76B76DF1-4C7C-BBEC-766D-F091444014EB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.35647063728825223 25.397502033327655 6.0653584509759995 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "701B895D-45BA-3625-AE2D-B0A37323752E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.7684532051616433;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "1D0857E7-4234-8209-D26A-799A73F29C99";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2436157504604979 18.70174073040052 16.090882128288385 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "2AF88D17-453B-6B4B-9254-A5A3D4235324";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 10.33324201498526;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "E93973ED-4010-B152-A86B-94A99AC68819";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 14.13070361222978 18.482450276873113 6.7826260727672967 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F62AEFB8-46AB-898B-C1BB-8AB607C09A1B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 10.371926471782734;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "435B9627-4402-6073-B21C-B793A2A8B64D";
	setAttr -s 24 ".lnk";
	setAttr -s 24 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "1448BEC6-42CA-B61C-752A-D19065A03B77";
	setAttr ".cdl" 1;
	setAttr -s 3 ".dli[1:2]"  3 1;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "47598A7F-4076-9A26-4738-16A1F08E3130";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "ED0EDACF-4ABE-4C6C-F083-55ABA0020B82";
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
	rename -uid "491C54D7-4DBA-4680-63BD-2A9037247FD4";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 1 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "11C64437-48D8-192E-A513-01BA5FC62DAF";
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "FC884255-462D-CC24-783E-69B68427DF01";
createNode makeNurbSphere -n "mid_makeNurbSphere";
	rename -uid "FD1BB90A-4C3A-ED6B-4C55-CCABCACC4616";
createNode multDoubleLinear -n "mid_size_multDoubleLinear";
	rename -uid "0006E96D-4478-5DD9-5D6E-F29E407DD0D5";
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "06988BE2-4E7D-8B2E-54AD-5480DE14B0BC";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "F5614323-46EE-239E-E51A-9B8E9BF531C9";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "1D699394-4F41-05C4-8C8F-9E92057F47F7";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "0CBCC52D-4D12-306C-596D-9BAE02F98D5C";
createNode shadingEngine -n "lambert1SG";
	rename -uid "A93CE716-44D4-19B8-679D-81B956648DE1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo47";
	rename -uid "DC68125D-4529-9029-6B71-1FBB740BDAA1";
createNode shadingEngine -n "center_surfaceShader1SG";
	rename -uid "DB5E266E-4604-7806-AB57-06AAD4F554B7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "center";
createNode materialInfo -n "center_materialInfo1";
	rename -uid "9CF2193A-43E8-9927-3DCD-48968AD69EB0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode shadingEngine -n "center_surfaceShader2SG";
	rename -uid "72B49097-4C66-6BD3-C63F-9FBE49B52E66";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "center";
createNode materialInfo -n "center_materialInfo2";
	rename -uid "82CB2294-4785-B410-A23E-2AA5F10D0CE4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode shadingEngine -n "center_surfaceShader3SG";
	rename -uid "6D453B4D-41A7-A8DA-4A7B-9CA36993A545";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "center";
createNode materialInfo -n "center_materialInfo3";
	rename -uid "0F515892-40AB-7006-5ED7-F9AAAC935E5D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "center";
createNode shadingEngine -n "side_1_surfaceShader1SG";
	rename -uid "F263089F-45E2-ED1D-A8A1-649C91D2DA2A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode materialInfo -n "side_1_materialInfo1";
	rename -uid "785CFC73-48CC-414C-D62B-5DB732CD9B74";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode shadingEngine -n "side_1_surfaceShader2SG";
	rename -uid "261290BF-4586-7C70-2240-B88FC65F1CB3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode materialInfo -n "side_1_materialInfo2";
	rename -uid "518DD925-479F-5DC4-45B9-EABA2F71966A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode shadingEngine -n "side_1_surfaceShader3SG";
	rename -uid "8E6ABE8E-40ED-2746-A95E-98B5F9D7331F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode materialInfo -n "side_1_materialInfo3";
	rename -uid "238233F3-4467-0B18-88DA-5D9310267F55";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_1";
createNode shadingEngine -n "side_2_surfaceShader1SG";
	rename -uid "5E63A6DC-402A-27E0-D2BF-F295183B312E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo1";
	rename -uid "64168018-4B49-8499-9C3A-FFAB96FB660D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_2_surfaceShader2SG";
	rename -uid "03B0B1F3-4091-5539-EFE0-588890BBE8AC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo2";
	rename -uid "1AB8D050-4510-5CB2-7F12-2C9BFA4998CB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_2_surfaceShader3SG";
	rename -uid "6AC95FFB-4745-B6CF-B246-A49BBD4B9C7F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode materialInfo -n "side_2_materialInfo3";
	rename -uid "7CFAB0CC-4A27-B92A-0CF1-918E3965713A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_2";
createNode shadingEngine -n "side_3_surfaceShader1SG";
	rename -uid "6E6DD18C-4808-A76C-B667-D784A2173382";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo1";
	rename -uid "246CB69A-4BCD-D3F0-01B2-2F8E63201F62";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode shadingEngine -n "side_3_surfaceShader2SG";
	rename -uid "0E7A9E50-41FE-EF95-7144-1D9E0C498D94";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo2";
	rename -uid "8611BE3C-4AF1-6F48-8212-35A0C9CF6EAF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode shadingEngine -n "side_3_surfaceShader3SG";
	rename -uid "4DDEED4B-4500-E7DC-3212-7DBBDA74DAB0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo3";
	rename -uid "A7B0B57A-4819-DE8B-08DA-20BB6C95657C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode shadingEngine -n "side_3_surfaceShader1SG1";
	rename -uid "1DBE4533-4F83-AFCD-68D1-19B1728F68E2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode materialInfo -n "side_3_materialInfo4";
	rename -uid "F8B0F585-4B4C-403B-753D-93A2DAD16B0B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "side_3";
createNode composeMatrix -n "composeMatrix2";
	rename -uid "12A9FBB7-4561-F930-F9C2-A092518FDAF5";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode multiplyDivide -n "multiplyDivide30";
	rename -uid "6100B4F9-42FE-8C5D-6444-89921899DEBB";
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "8B64DDFA-4AB0-7271-989F-1EBB18C93FDE";
createNode multiplyDivide -n "multiplyDivide31";
	rename -uid "15E6FFA0-42C3-3EE7-A251-099B47E7DEB2";
	setAttr ".i1" -type "float3" 0 0 0.1 ;
createNode multMatrix -n "multMatrix33";
	rename -uid "D2651FF6-4AED-741F-2243-4BAD60C73B20";
createNode composeMatrix -n "composeMatrix3";
	rename -uid "B7B2DA9B-453E-8135-D01A-97839A35CF9C";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode multiplyDivide -n "multiplyDivide32";
	rename -uid "5312E5E5-455C-8F67-D5FF-4E94415E3E74";
	setAttr ".op" 2;
	setAttr ".i1" -type "float3" 1 1 1 ;
createNode setRange -n "setRange1";
	rename -uid "B60BBD71-40B9-0F89-864E-D0BF9AA14D69";
	setAttr ".m" -type "float3" -21.370001 0 0 ;
	setAttr ".om" -type "float3" 0.69999999 0 0 ;
createNode uvPin -n "uvPin";
	rename -uid "2326A037-4848-94F4-25C2-F682A3E05050";
	setAttr -s 6 ".coord";
	setAttr -s 6 ".coord";
	setAttr ".msn" -type "string" "";
	setAttr ".nrm" 2;
	setAttr ".tng" 0;
	setAttr -s 9 ".omat";
createNode clamp -n "pasted__clamp1";
	rename -uid "C270B580-474B-A520-D5A1-11B198C4DA7D";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "pasted__multiplyDivide2";
	rename -uid "D88C2B01-4B19-6965-4464-419FB2B96319";
	setAttr ".i2" -type "float3" -1 -1 0 ;
createNode multiplyDivide -n "pasted__multiplyDivide1";
	rename -uid "57F4BBC4-4550-1482-1157-108052C0C390";
	setAttr ".i2" -type "float3" 1 1 -1 ;
createNode plusMinusAverage -n "plusMinusAverage3";
	rename -uid "2D20C085-4607-6035-18B8-E8B92A323419";
	setAttr -s 3 ".i3[0:2]" -type "float3"  0 0 0 0 0 0 0 0 0;
createNode plusMinusAverage -n "plusMinusAverage4";
	rename -uid "8A127AA1-4B51-44D8-0A23-228C71902D8E";
	setAttr -s 3 ".i3[0:2]" -type "float3"  0 0 0 0 0 0 0.75099999 0
		 0;
createNode plusMinusAverage -n "plusMinusAverage5";
	rename -uid "45B3AC09-4501-5B47-C4DA-01AF14290172";
	setAttr -s 4 ".i3[0:3]" -type "float3"  0 0 0 0.75119334 0 0 -0.75099999
		 0 0 0 0 0;
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "multiplyDivide2";
	rename -uid "FFF75E09-4523-6DAA-3819-D4A1FC7DB0AE";
createNode plusMinusAverage -n "plusMinusAverage6";
	rename -uid "B071C26A-421C-9EFF-A056-5B9DCFFD4B04";
	setAttr -s 2 ".i3[1]" -type "float3"  0.5 0.5 0;
createNode clamp -n "clamp1";
	rename -uid "2341D242-45FF-87CE-1C4D-1B9C0B9F4718";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "multiplyDivide4";
	rename -uid "4244E46E-4C22-5BF5-627B-7FB3CD9035A1";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode clamp -n "clamp2";
	rename -uid "E883437E-4AAB-7E6C-D353-5EA4A30DA6BA";
createNode multiplyDivide -n "multiplyDivide5";
	rename -uid "3EFA0A3E-4F88-5886-EB6E-F3830452FA70";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide6";
	rename -uid "D9F3288F-4346-CCF9-732E-039F250AE676";
	setAttr ".i2" -type "float3" -1 -1 0 ;
createNode plusMinusAverage -n "plusMinusAverage8";
	rename -uid "A8C23F42-43E8-0061-8715-FC8521AAB555";
	setAttr -s 2 ".i3[1]" -type "float3"  1 0.5 0;
createNode clamp -n "clamp3";
	rename -uid "9D35DE98-49D7-09D0-F7E9-18B69FE0C596";
createNode clamp -n "clamp4";
	rename -uid "3C6CCC77-4F6F-F209-DCF1-E28E79764B69";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "multiplyDivide8";
	rename -uid "1F2243D9-4340-8051-A370-83A88C027BD7";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide9";
	rename -uid "E4CCCE8D-401C-1E96-F2DF-879906798874";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode multiplyDivide -n "multiplyDivide10";
	rename -uid "232EEE03-4EAF-6F0C-3168-80A3091FC3F1";
	setAttr ".i2" -type "float3" -1 -1 0 ;
createNode multiplyDivide -n "multiplyDivide11";
	rename -uid "64DC2F3E-4127-A476-BC6B-31853924AA08";
	setAttr ".i2" -type "float3" 1 1 -1 ;
createNode multiplyDivide -n "multiplyDivide12";
	rename -uid "9DD63240-4AC1-E75B-42C7-78A5C54116C8";
	setAttr ".i2" -type "float3" -1 -1 0 ;
createNode clamp -n "clamp5";
	rename -uid "57BA0735-4B53-3B61-78E4-0E94346C7A84";
createNode plusMinusAverage -n "plusMinusAverage11";
	rename -uid "80F9ADDF-4EA6-D768-20FB-10989CA82744";
	setAttr ".i1[0]"  0;
	setAttr -s 2 ".i3[1]" -type "float3"  0 0.5 0;
createNode multiplyDivide -n "multiplyDivide13";
	rename -uid "0D8AF5FD-4843-AE63-30EF-72904358EA68";
	setAttr ".i2" -type "float3" 1 1 -1 ;
createNode multiplyDivide -n "multiplyDivide14";
	rename -uid "3DDED255-4F53-CCB5-1F69-AFA8019FF8B7";
	setAttr ".op" 2;
createNode clamp -n "clamp6";
	rename -uid "6F81D774-4CAD-C1F3-C26B-FA977A6C5B96";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "multiplyDivide15";
	rename -uid "4C5912B6-49CF-47E8-858E-4AAD46BA8364";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode multiplyDivide -n "multiplyDivide16";
	rename -uid "4A6AD7FB-4D5E-C425-4C77-DFB47A2DF451";
	setAttr ".op" 2;
	setAttr ".i1" -type "float3" 1 1 1 ;
createNode multMatrix -n "multMatrix10";
	rename -uid "F6E79121-41AF-48A4-A044-A585A4C39FF9";
createNode multMatrix -n "multMatrix11";
	rename -uid "FCA9F032-453B-7774-524D-1582A192C1F4";
createNode multMatrix -n "multMatrix12";
	rename -uid "BB15A446-4D1B-7C49-CA50-24B6323CC1B6";
createNode multiplyDivide -n "multiplyDivide17";
	rename -uid "B76A0BF8-46AE-7B5E-E78E-6A9937578D66";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode multMatrix -n "multMatrix13";
	rename -uid "99D8635A-4C27-72DE-4A3D-81834D91F419";
createNode multMatrix -n "multMatrix19";
	rename -uid "D9287A0F-4CDF-80BD-006C-52A26F7A9869";
createNode plusMinusAverage -n "plusMinusAverage12";
	rename -uid "4F30B4CB-415A-4CEB-A188-349DB9EA7F2D";
	setAttr -s 3 ".i3[0:2]" -type "float3"  0 0 0 0 0 0 0 0 0;
createNode multiplyDivide -n "multiplyDivide19";
	rename -uid "6F82FAD8-466D-5ADC-892E-5A899DE24804";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode multiplyDivide -n "multiplyDivide20";
	rename -uid "D32504AF-44CB-80CE-5280-F3A3397CE508";
createNode plusMinusAverage -n "plusMinusAverage13";
	rename -uid "2EEE14C1-4999-767D-6B28-8ABEABD50FA9";
	setAttr -s 3 ".i3[1:2]" -type "float3"  0 0.5 0 0 0 0;
createNode clamp -n "clamp7";
	rename -uid "8D9B20FE-4853-F328-9A1A-3DBFFEE00168";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multiplyDivide -n "multiplyDivide21";
	rename -uid "677614B6-4231-5525-4054-72B57D171452";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode clamp -n "clamp8";
	rename -uid "A1A2AFA8-415E-DAF6-7D51-3A8E06690ED7";
createNode multiplyDivide -n "multiplyDivide22";
	rename -uid "7EE6DBE7-4125-DFA2-E33F-F78C0016481D";
	setAttr ".i2" -type "float3" -1 -1 0 ;
createNode multiplyDivide -n "multiplyDivide23";
	rename -uid "A95CD16B-495D-C12D-1202-45BC891ED88E";
	setAttr ".op" 2;
createNode plusMinusAverage -n "plusMinusAverage15";
	rename -uid "8E1260F2-4D35-D3A7-FF5B-EF8C64D18A81";
	setAttr -s 3 ".i3[0:2]" -type "float3"  0 0 0 0 0 0 0.75099999 0
		 0;
createNode multiplyDivide -n "multiplyDivide24";
	rename -uid "DE6F8F7A-4A64-764C-F094-24BBDA7F2338";
createNode plusMinusAverage -n "plusMinusAverage17";
	rename -uid "DD5C16D3-4AF4-40B9-E119-12B87B4B4AA2";
	setAttr -s 2 ".i3[1]" -type "float3"  0.5 0.5 0;
createNode clamp -n "clamp9";
	rename -uid "F57A98BB-4BC1-6C91-FFCD-B39918CE1523";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multMatrix -n "multMatrix20";
	rename -uid "AB460C03-4EB4-51CD-563F-BA93206DBCC9";
createNode plusMinusAverage -n "plusMinusAverage18";
	rename -uid "2AB51C72-45C9-0229-D445-3EB23FE0F260";
	setAttr -s 3 ".i3[0:2]" -type "float3"  0 0 0 0 0 0 0 0 0;
createNode multiplyDivide -n "multiplyDivide25";
	rename -uid "C80CB896-4317-A3DE-8660-999A2A1559B6";
createNode plusMinusAverage -n "plusMinusAverage19";
	rename -uid "F178B36D-4A19-8180-6A29-FA89AD05FA53";
	setAttr -s 3 ".i3[1:2]" -type "float3"  1 0.5 0 0 0 0;
createNode clamp -n "clamp10";
	rename -uid "8525A57F-4C6B-5035-A397-2BA65A8811E8";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multMatrix -n "multMatrix21";
	rename -uid "232AE05F-4943-CF2D-31EE-C38582EA7B90";
createNode clamp -n "clamp11";
	rename -uid "F6F34F19-4277-5041-A6A1-CF9679E3AF74";
createNode multiplyDivide -n "multiplyDivide26";
	rename -uid "0EBF62D3-49A4-69AB-9CE2-C0AA4FE134D8";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide27";
	rename -uid "5BD7016B-4181-88C5-DAD1-1D9632F10E46";
	setAttr ".i2" -type "float3" -1 -1 0 ;
createNode clamp -n "clamp12";
	rename -uid "627EBFFA-4306-CA00-9ADA-8CAC2C9E6BFA";
createNode multiplyDivide -n "multiplyDivide28";
	rename -uid "171D8972-4BF1-246B-0789-D4ACAE4CD710";
	setAttr ".op" 2;
createNode multiplyDivide -n "multiplyDivide29";
	rename -uid "918F6E30-49F7-F550-79E8-6FB08E853689";
	setAttr ".i2" -type "float3" -1 -1 1 ;
createNode plusMinusAverage -n "plusMinusAverage21";
	rename -uid "CFCDA7FA-44FE-1BA2-C9A8-C3B66E746797";
	setAttr -s 4 ".i3[0:3]" -type "float3"  0 0 0 0.75119334 0 0 -0.75099999
		 0 0 0 0 0;
	setAttr -s 2 ".i3";
createNode multMatrix -n "multMatrix42";
	rename -uid "FBDE67FB-41C9-E6F7-4DFE-11A45CF57781";
createNode multMatrix -n "multMatrix44";
	rename -uid "77678F84-4681-13AE-E129-44AA8D8E6A98";
createNode multMatrix -n "multMatrix45";
	rename -uid "522B0904-42B9-067A-F759-F6864AB58243";
createNode setRange -n "setRange2";
	rename -uid "83D5366C-498B-31C5-97CD-D7B9191D48EF";
	setAttr ".m" -type "float3" 0 -0.15000001 0 ;
	setAttr ".on" -type "float3" -0.685 0 0 ;
	setAttr ".om" -type "float3" 0 0.54400003 0 ;
createNode setRange -n "setRange3";
	rename -uid "B02CFFB4-4BF8-F4CA-25C7-A09D4F9F6778";
	setAttr ".n" -type "float3" 0.14 0 0 ;
	setAttr ".m" -type "float3" 0 -0.15000001 0 ;
	setAttr ".on" -type "float3" -0.685 0 0 ;
	setAttr ".om" -type "float3" 0 0.54400003 0 ;
createNode multiplyDivide -n "multiplyDivide33";
	rename -uid "EA971066-4948-89BC-C6E1-86945E0BA0B9";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode multiplyDivide -n "multiplyDivide34";
	rename -uid "CCD003EC-4B63-28FE-4E16-8E9971327299";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode multiplyDivide -n "multiplyDivide35";
	rename -uid "97C6964F-4E44-8B3C-591F-25BC79775AE8";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode multiplyDivide -n "multiplyDivide36";
	rename -uid "F232281A-414A-70AB-C433-E8BC8AAA441E";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode setRange -n "setRange4";
	rename -uid "6E63E434-4411-6252-DDA3-85BD5D30BE75";
	setAttr ".n" -type "float3" 1 1 1 ;
createNode setRange -n "setRange5";
	rename -uid "5EA104E4-4C55-126D-5334-C7A47A633A71";
	setAttr ".m" -type "float3" 1 1 1 ;
createNode setRange -n "setRange6";
	rename -uid "9E3B5B16-429A-A868-FF8A-01AF530A11CA";
	setAttr ".n" -type "float3" 1 1 1 ;
createNode setRange -n "setRange7";
	rename -uid "F38C1E44-4D05-D1C8-BD4F-8FB5A854EF85";
	setAttr ".m" -type "float3" 1 1 1 ;
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "92FE8A0E-4A1B-AF3E-F2D6-75924C882E24";
	setAttr ".ihi" 2;
createNode setRange -n "setRange8";
	rename -uid "8A46CEDC-443D-9C3C-A001-41B70D3A7B3F";
	setAttr ".n" -type "float3" 1 0 0 ;
createNode multiplyDivide -n "multiplyDivide37";
	rename -uid "4F15B492-4832-785C-B934-B897D1849473";
	setAttr ".i2" -type "float3" 0.5 0.5 1 ;
createNode lambert -n "char_basic";
	rename -uid "9FFB464A-474C-A572-075C-E3AFF1AA8C09";
	setAttr ".c" -type "float3" 0.56300002 0.42095107 0.33217004 ;
createNode shadingEngine -n "char_basicSG";
	rename -uid "DFC8F5EA-446F-5806-7C3A-57A574FB6DFD";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo48";
	rename -uid "FE455B35-4085-7B8B-A8E0-80B196A8ACC4";
createNode setRange -n "setRange9";
	rename -uid "B6DE80E8-4672-B032-1B8C-92A8BF76B260";
	setAttr ".n" -type "float3" 0 1 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".on" -type "float3" 0 -40 0 ;
	setAttr ".om" -type "float3" 40 0 0 ;
createNode setRange -n "setRange10";
	rename -uid "74A51BE8-4CAB-FFE8-5D22-5D850622D5AA";
	setAttr ".n" -type "float3" 0 1 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".on" -type "float3" 0 -40 0 ;
	setAttr ".om" -type "float3" 40 0 0 ;
createNode setRange -n "setRange11";
	rename -uid "B9E61033-4584-807E-9F8D-E0A788103453";
	setAttr ".n" -type "float3" 0 1 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".on" -type "float3" 0 -30 0 ;
	setAttr ".om" -type "float3" 30 0 0 ;
createNode materialInfo -n "pasted__materialInfo47";
	rename -uid "30872601-4F74-7EED-CD80-219D1FC2217B";
createNode shadingEngine -n "pasted__lambert1SG";
	rename -uid "169E7A4E-44AE-27C5-DA27-CE946E1E7E95";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode setRange -n "setRange12";
	rename -uid "8EFC07AD-4DC0-91BD-690E-5D83A7CA8707";
	setAttr ".n" -type "float3" 0 1 0 ;
	setAttr ".m" -type "float3" 1 0 0 ;
	setAttr ".on" -type "float3" 0 -30 0 ;
	setAttr ".om" -type "float3" 30 0 0 ;
createNode multiplyDivide -n "multiplyDivide38";
	rename -uid "7C7E0DD1-443E-B04E-5AE0-CB953C448D48";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode multiplyDivide -n "multiplyDivide39";
	rename -uid "CCD7AA5E-425C-5ABB-3B07-FF954839B9F8";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode multiplyDivide -n "multiplyDivide40";
	rename -uid "9CBD3414-4EF5-FCBF-C447-81AD87DD2D3A";
	setAttr ".i2" -type "float3" 0.5 0.5 0.5 ;
createNode setRange -n "setRange13";
	rename -uid "A22657D1-46DB-1F36-A286-829278E93028";
	setAttr ".on" -type "float3" -1 -1 -1 ;
createNode network -n "hyperNode_sessionData";
	rename -uid "A440C21C-4FD4-9E89-AF99-1BB2A3CDB7F6";
	addAttr -ci true -sn "hyperNodeSessionJSON" -ln "hyperNodeSessionJSON" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".hyperNodeSessionJSON" -type "string" (
		"{\"tabs\": [{\"name\": \"Up Offset\", \"nodes\": {\"blendMatrix11\": {\"x\": -2230.8345825163337, \"y\": -1346.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix12\": {\"x\": -2230.8345825163337, \"y\": -1190.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix13\": {\"x\": -2230.8345825163337, \"y\": -1034.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix14\": {\"x\": -2230.8345825163337, \"y\": -878.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix15\": {\"x\": -2230.8345825163337, \"y\": -722.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix16\": {\"x\": -2230.8345825163337, \"y\": -566.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix52\": {\"x\": -1880.8345825163337, \"y\": -1246.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix53\": {\"x\": -1880.8345825163337, \"y\": -934.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix54\": {\"x\": -1880.8345825163337, \"y\": -1090.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"up_down_setRange1\": {\"x\": -2580.8345825163337, \"y\": -1056.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors3\": {\"x\": -2230.8345825163337, \"y\": -1658.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage37\": {\"x\": -1880.8345825163337, \"y\": -1402.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors4\": {\"x\": -2230.8345825163337, \"y\": -1502.2394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow\": {\"x\": -2930.8345825163337, \"y\": -1079.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_bot\": {\"x\": -2930.8345825163337, \"y\": -1703.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_bot\": {\"x\": -2930.8345825163337, \"y\": -611.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_top\": {\"x\": -2930.8345825163337, \"y\": -1391.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_top\": {\"x\": -2930.8345825163337, \"y\": -1859.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_top\": {\"x\": -2930.8345825163337, \"y\": -923.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_bot\": {\"x\": -2930.8345825163337, \"y\": -455.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_bot\": {\"x\": -2930.8345825163337, \"y\": -767.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_top\": {\"x\": -2930.8345825163337, \"y\": -1547.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow\": {\"x\": -2930.8345825163337, \"y\": -1235.0394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"up_vis_condition\": {\"x\": -3280.8345825163337, \"y\": -1154.5394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"down_vis_condition\": {\"x\": -3280.8345825163337, \"y\": -998.5394360544567, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": -2462.211432506887, \"cy\": -1141.3099173553717, \"scale\": 0.9410239792611795}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Limits Positions\", \"nodes\": {\"up_vis_condition\": {\"x\": -2166.6568703927096, \"y\": 874.1147865853516, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"colorIfFalse\", \"outColor\"]}, \"down_vis_condition\": {\"x\": -2189.562862399022, \"y\": 2630.4536162250015, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"colorIfTrue\", \"outColor\"]}, \"multDoubleLinear6\": {\"x\": -490.84109558006315, \"y\": 2777.707056746256, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_1_group_1\": {\"x\": 739.580257279335, \"y\": 731.973061854147, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow\": {\"x\": -2494.931235842602, \"y\": 363.32108307228737, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_brow\": {\"x\": -910.3714456407814, \"y\": 845.1024105177219, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_in_group_1\": {\"x\": 283.43579711559767, \"y\": 345.7943039171994, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_group_1\": {\"x\": 259.76156139464166, \"y\": 86.3084541293361, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_group_1\": {\"x\": 287.6704399282422, \"y\": -179.49899178341397, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_in_group_1\": {\"x\": 766.0758577850279, \"y\": 396.4457630312555, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_mid_group_1\": {\"x\": 720.0655778401981, \"y\": 116.70134708316337, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_out_group_1\": {\"x\": 717.3590907846199, \"y\": -148.15739005924854, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_3_top\": {\"x\": -654.3660599517458, \"y\": 1755.0770391535198, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4_top\": {\"x\": -654.3660599517458, \"y\": 1911.0770391535189, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5_top\": {\"x\": -654.3660599517458, \"y\": 2067.0770391535193, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6_top\": {\"x\": -654.3660599517458, \"y\": 2223.0770391535193, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7_top\": {\"x\": -654.3660599517458, \"y\": 2379.0770391535193, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_3_bot\": {\"x\": -1001.0039742674024, \"y\": 2974.3497959718966, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4_bot\": {\"x\": -1001.0039742674024, \"y\": 3130.3497959718966, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5_bot\": {\"x\": -1001.0039742674024, \"y\": 3286.3497959718966, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6_bot\": {\"x\": -1001.0039742674024, \"y\": 3442.3497959718966, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7_bot\": {\"x\": -1001.0039742674024, \"y\": 3598.3497959718966, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_bot\": {\"x\": -1589.5823838428544, \"y\": 884.8684080840438, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_bot\": {\"x\": -1589.5823838428544, \"y\": 572.8684080840438, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_bot\": {\"x\": -1589.5823838428544, \"y\": 728.8684080840438, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_top\": {\"x\": -1605.7733050593943, \"y\": 1377.240307037215, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_top\": {\"x\": -1590.7236369844452, \"y\": 1039.419853873925, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_top\": {\"x\": -1605.7733050593943, \"y\": 1221.240307037215, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_midShape\": {\"x\": -103.11179961164635, \"y\": 2814.3503646322097, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_1Shape\": {\"x\": -103.11179961164635, \"y\": 2970.3503646322097, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_3Shape\": {\"x\": 386.8111748537466, \"y\": 2894.1079570728803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4Shape\": {\"x\": 386.8111748537466, \"y\": 3050.1079570728803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5Shape\": {\"x\": 386.8111748537466, \"y\": 3206.1079570728803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6Shape\": {\"x\": 386.8111748537466, \"y\": 3362.1079570728803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7Shape\": {\"x\": 386.8111748537466, \"y\": 3518.1079570728803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_bot\": {\"x\": -1144.4963303125119, \"y\": 181.2747320270655, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_top\": {\"x\": -1227.1018650322728, \"y\": -43.72759313175617, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1Shape\": {\"x\": 421.1196816708501, \"y\": 2444.873929804466, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_group_1\": {\"x\": 329.0846799346817, \"y\": 752.1165622477623, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_bot\": {\"x\": -1002.0342895341465, \"y\": 2673.075343360965, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_top\": {\"x\": -664.1307711498106, \"y\": 1522.354308311582, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2Shape\": {\"x\": 386.8111748537466, \"y\": 2738.1079570728803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_1Shape\": {\"x\": -117.4179670236613, \"y\": 2685.2506906095537, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix1\": {\"x\": -433.61451964038184, \"y\": 665.4855477561346, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix2\": {\"x\": -370.52806451546786, \"y\": -80.09452180473676, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix3\": {\"x\": -464.5974067875403, \"y\": -911.8456175171914, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix4\": {\"x\": -488.4757895478527, \"y\": -484.7400042825338, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix5\": {\"x\": -441.01491688021133, \"y\": 975.6382545269321, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix6\": {\"x\": -356.172747406989, \"y\": 197.72021908446703, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix48\": {\"x\": 109.14225508886341, \"y\": 889.0675413540507, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix49\": {\"x\": 26.712769433348967, \"y\": 21.084556778611102, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix50\": {\"x\": 11.171940233934833, \"y\": -658.7616593783745, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"up_down_setRange\": {\"x\": -1296.9309682841053, \"y\": -1275.1683229363343, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors1\": {\"x\": -517.8859719336522, \"y\": -1796.650372677354, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage30\": {\"x\": -73.78699932658458, \"y\": -1753.1690196359257, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors2\": {\"x\": -513.8310672428833, \"y\": -1601.7844781982085, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"up_down_setRange1\": {\"x\": -1388.8126452034303, \"y\": -288.53821624040074, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix11\": {\"x\": -322.71840508090384, \"y\": 1431.4243997807512, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix12\": {\"x\": -259.63194995598985, \"y\": 685.84433021988, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix13\": {\"x\": -353.7012922280623, \"y\": -145.90676549257455, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix14\": {\"x\": -377.5796749883747, \"y\": 281.198847742083, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix15\": {\"x\": -330.1188023207333, \"y\": 1741.5771065515487, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendMatrix16\": {\"x\": -245.276632847511, \"y\": 963.6590711090838, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix52\": {\"x\": 220.03836964834136, \"y\": 1655.0063933786673, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix53\": {\"x\": 137.60888399282692, \"y\": 787.0234088032279, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix54\": {\"x\": 122.06805479341284, \"y\": 107.17719264624236, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors3\": {\"x\": -402.2975230202385, \"y\": -1087.0195328999666, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage37\": {\"x\": 43.53242688217881, \"y\": -1031.3904352001464, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors4\": {\"x\": -402.9349526834053, \"y\": -835.8456261735918, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": -2147.804078550653, \"cy\": 1700.5900786332568, \"scale\": 0.16994101261149644}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Local Controls\", \"nodes\": {\"l_curve9_5_loc_moveOffset\": {\"x\": 1429.234514928237, \"y\": 1076.0109511657433, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_local_4_moveOffset\": {\"x\": 1438.0651915864876, \"y\": 775.1131621721725, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_local_7_rotateOffset\": {\"x\": 1490.8491645270976, \"y\": 1586.4956355805161, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"l_curve9_3_loc_moveOffset\": {\"x\": 1437.8507537297994, \"y\": 527.0551049994947, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow\": {\"x\": -1739.378953487646, \"y\": 137.3582187643736, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"minTransLimitEnable\", \"rotate\", \"translate\"]}, \"r_brow_local_2_rotateOffset\": {\"x\": -630.2311870407996, \"y\": -27.432186803719844, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\"]}, \"r_brow_in\": {\"x\": -1745.427055503622, \"y\": 2620.3880802635827, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"unitConversion59\": {\"x\": -1073.5190718009053, \"y\": 47.324359257401454, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow\": {\"x\": -1755.6593343750458, \"y\": 2230.357333894182, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_mid\": {\"x\": -1734.2663701107542, \"y\": 1219.6641350509706, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"r_brow_mid\": {\"x\": -1739.571056147512, \"y\": 3102.653994878301, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"l_brow_out\": {\"x\": -1703.852813382678, \"y\": 1724.1765822733835, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"r_brow_out\": {\"x\": -1689.0018459518478, \"y\": 3482.208085942973, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"r_brow_local_1_moveOffset\": {\"x\": 1512.0907572016654, \"y\": 2012.81123502651, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_curve9_5_loc_moveOffset\": {\"x\": 1575.1589401218994, \"y\": 3415.2578859666005, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_brow_local_4_moveOffset\": {\"x\": 1582.4262086829349, \"y\": 3061.10587777533, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_brow_local_7_rotateOffset\": {\"x\": 1612.845253694074, \"y\": 4063.193504678843, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"r_curve9_2_loc_moveOffset\": {\"x\": 1512.3589515567824, \"y\": 2359.05979166998, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_curve9_3_loc_moveOffset\": {\"x\": 1530.2836675818512, \"y\": 2747.1840200994898, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_curve9_6_loc_moveOffset\": {\"x\": 1463.228035201765, \"y\": 1326.0289661584961, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_curve9_6_loc_moveOffset\": {\"x\": 1615.8431315318644, \"y\": 3705.435167356371, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"multDoubleLinear64\": {\"x\": -1068.6977208355947, \"y\": 2520.352348138507, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear65\": {\"x\": -1154.6373648747235, \"y\": 1781.7116627119099, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion87\": {\"x\": 96.74710315806637, \"y\": 2857.84695731484, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage53\": {\"x\": -1634.8174828385586, \"y\": 2873.256285418064, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage54\": {\"x\": -1674.2236025194027, \"y\": 1271.3956969659007, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear48\": {\"x\": -2210.671506792376, \"y\": 1543.3947047202132, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear49\": {\"x\": -2204.605530791863, \"y\": 3127.3698456958937, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear51\": {\"x\": -2209.4543891902604, \"y\": 1051.499838778564, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage55\": {\"x\": 2146.665023713691, \"y\": 2060.8664082288738, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage56\": {\"x\": 2137.2786732568547, \"y\": 2827.8250078369756, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear67\": {\"x\": -1154.5220580907555, \"y\": 974.1480101703723, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear68\": {\"x\": -347.6046702713435, \"y\": 840.1849306401605, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion88\": {\"x\": -739.0547055381572, \"y\": 1876.1115624071695, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear69\": {\"x\": -340.99820939120093, \"y\": 2267.4886512127628, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear70\": {\"x\": -333.4583766983511, \"y\": 3133.7851497348393, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear71\": {\"x\": -345.46269299507514, \"y\": 1441.8105479141154, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear72\": {\"x\": -1095.4422251795627, \"y\": 3500.562451047821, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion89\": {\"x\": 1091.8351278447349, \"y\": 3598.947957734646, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear73\": {\"x\": 523.1000818415463, \"y\": 2068.060133928398, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear74\": {\"x\": 504.2234756067777, \"y\": 2439.549293539281, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear75\": {\"x\": 463.61805057808067, \"y\": 1059.4013230499572, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear76\": {\"x\": 499.7023756826069, \"y\": 3220.191390408489, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage57\": {\"x\": 2168.1646481338757, \"y\": 1304.5420009948698, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage58\": {\"x\": 2157.2043070261316, \"y\": 3290.892832057253, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion90\": {\"x\": 121.09644437527312, \"y\": 1497.3228031671965, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear77\": {\"x\": 1509.105586196707, \"y\": 3630.570979338425, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear78\": {\"x\": 1486.458364803993, \"y\": 3453.3487528397686, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear79\": {\"x\": 1463.4574725058524, \"y\": 3172.4957521466804, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear80\": {\"x\": -374.70815937325335, \"y\": 570.1341476433568, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion91\": {\"x\": -728.5490280277414, \"y\": 418.67143694170363, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear81\": {\"x\": 715.2708653488725, \"y\": 698.823690017412, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear82\": {\"x\": 1531.486627428786, \"y\": 3851.3919704469167, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"clamp18\": {\"x\": 2161.4979543218997, \"y\": 3905.5231972876236, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear83\": {\"x\": -1302.8513656189955, \"y\": 3820.6566058213607, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear84\": {\"x\": 583.2736396327249, \"y\": 2683.0426249992083, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_moveOffset\": {\"x\": 1429.2074050921362, \"y\": -75.16161677367381, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve9_2_loc_moveOffset\": {\"x\": 1444.2380514399285, \"y\": 223.76090673751605, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion57\": {\"x\": -1066.7750606323048, \"y\": -321.34825129275345, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_rotateOffset\": {\"x\": -649.9376013229803, \"y\": -386.8824012562231, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in\": {\"x\": -1736.6328496490178, \"y\": 741.9721598559564, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear3\": {\"x\": -1084.8284477220034, \"y\": 1241.2315230982206, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear4\": {\"x\": -1170.7680917611322, \"y\": 502.59083767162383, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion24\": {\"x\": 80.61637627165783, \"y\": 1578.7261322745537, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage24\": {\"x\": -1650.9482097249672, \"y\": 1594.1354603777781, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage25\": {\"x\": -1690.3543294058113, \"y\": -7.7251280743853386, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear5\": {\"x\": -1698.272401677079, \"y\": 822.9417392430896, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear9\": {\"x\": -2226.8022336787844, \"y\": 264.2738796799272, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear10\": {\"x\": -2220.736257678271, \"y\": 1848.2490206556076, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear2\": {\"x\": -2154.3142249885364, \"y\": 630.4425095087945, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear8\": {\"x\": -2225.5851160766683, \"y\": -227.620986261722, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage26\": {\"x\": 2130.534296827283, \"y\": 781.7455831885877, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage27\": {\"x\": 2121.147946370446, \"y\": 1548.7041827966893, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear2\": {\"x\": -1170.6527849771642, \"y\": -304.9728148699137, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear7\": {\"x\": -363.735397157752, \"y\": -438.93589440012556, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion54\": {\"x\": -535.066708281329, \"y\": 389.8712660638016, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear11\": {\"x\": -357.12893627760945, \"y\": 988.3678261724767, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear12\": {\"x\": -349.58910358475964, \"y\": 1854.6643246945532, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear9\": {\"x\": -140.57627748882146, \"y\": -49.820257925806345, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear1\": {\"x\": -1111.5729520659713, \"y\": 2221.441626007535, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion26\": {\"x\": 1075.7044009583262, \"y\": 2319.82713269436, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear13\": {\"x\": 658.4364718246309, \"y\": 809.1349244707112, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear14\": {\"x\": 488.0927487203692, \"y\": 1160.4284684989948, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear15\": {\"x\": 678.2744844897359, \"y\": -453.72352328184706, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear16\": {\"x\": 483.57164879619836, \"y\": 1941.070565368203, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage28\": {\"x\": 1963.232998613357, \"y\": 634.2050356671671, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage29\": {\"x\": 2141.0735801397236, \"y\": 2011.772007016967, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion56\": {\"x\": 317.66540041282565, \"y\": 341.8494656588814, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear17\": {\"x\": 1492.9748593102984, \"y\": 2351.450154298139, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear18\": {\"x\": 1470.3276379175843, \"y\": 2174.2279277994826, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear19\": {\"x\": 1447.3267456194437, \"y\": 1893.3749271063944, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear20\": {\"x\": -169.82174386699967, \"y\": -921.496658196565, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion58\": {\"x\": -523.6626125214877, \"y\": -1072.9593688982186, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear21\": {\"x\": 929.9272992605281, \"y\": -814.3011563143914, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear22\": {\"x\": 1515.3559005423774, \"y\": 2572.2711454066307, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear42\": {\"x\": -1318.9820925054041, \"y\": 2541.5357807810747, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear63\": {\"x\": 567.1429127463164, \"y\": 1403.9217999589223, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": 4, \"notes\": [], \"view\": {\"cx\": 862.7919939863498, \"cy\": 2329.9763492423253, \"scale\": 0.2283284979150105}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Tab 3\", \"nodes\": {\"l_brow_local_3_group_1\": {\"x\": -3344.5706504287286, \"y\": -1642.2152273153836, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\"]}, \"l_brow_local_3_top\": {\"x\": -4567.663228225373, \"y\": -1722.5031462899315, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_3_bot\": {\"x\": -4578.1329164802255, \"y\": -1504.0234655443223, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4_group\": {\"x\": -3417.618423470978, \"y\": -951.0464661833422, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4_top\": {\"x\": -4625.970940172138, \"y\": -1080.108694358415, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4_bot\": {\"x\": -4606.512767600461, \"y\": -820.0074710999415, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5_group_1\": {\"x\": -3356.559534173694, \"y\": -366.92476215960886, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5_top\": {\"x\": -4597.580373641829, \"y\": -495.35398556092275, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5_bot\": {\"x\": -4600.1535657163995, \"y\": -216.6984966731013, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6_group_1\": {\"x\": -3435.472031710467, \"y\": 353.12024554882015, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6_top\": {\"x\": -4585.88064544554, \"y\": 230.15744155559213, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6_bot\": {\"x\": -4594.22370635609, \"y\": 514.3371955449311, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7_group_1\": {\"x\": -3425.089002895046, \"y\": 990.5103701763926, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7_top\": {\"x\": -4570.363727888548, \"y\": 846.9186374794167, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7_bot\": {\"x\": -4568.846807722995, \"y\": 1124.2722507237618, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"up_down_setRange1\": {\"x\": -5188.476101808852, \"y\": 900.3821552628244, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"outValue\"]}, \"up_down_setRange\": {\"x\": -5141.426450141917, \"y\": -589.9464601692215, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"outValue\"]}, \"r_brow_local_2_group_1\": {\"x\": -3074.8262851081518, \"y\": -1867.4320223921638, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_3_group_1\": {\"x\": -3111.033373024211, \"y\": -1332.2474422307703, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_4_group\": {\"x\": -3081.4907290456563, \"y\": -749.6439762226261, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_5_group_1\": {\"x\": -3020.742717199687, \"y\": -147.5961385009074, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_6_group_1\": {\"x\": -3109.323705977312, \"y\": 544.2763114254969, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_7_group_1\": {\"x\": -3120.3151978185024, \"y\": 1172.3391939210214, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_bot\": {\"x\": -4614.325026808659, \"y\": -1989.2501833151512, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_top\": {\"x\": -4586.892796880182, \"y\": -2303.9678436193226, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_group_1\": {\"x\": -3357.690204260645, \"y\": -2188.1175765262287, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors6\": {\"x\": -4128.791022783066, \"y\": -2458.4883874569528, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors7\": {\"x\": -4123.505158276117, \"y\": -2151.4968981599886, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage38\": {\"x\": -3669.421629675811, \"y\": -2323.9393326288064, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors18\": {\"x\": -4092.2873137950605, \"y\": -2041.2834013279237, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors19\": {\"x\": -4087.001449288112, \"y\": -1734.2919120309596, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage44\": {\"x\": -3632.9179206878052, \"y\": -1906.734346499777, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors8\": {\"x\": -4084.6352113253724, \"y\": -1803.5604979550706, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors9\": {\"x\": -4090.0160134850903, \"y\": -1530.5690086581064, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage39\": {\"x\": -3623.265818218117, \"y\": -1705.6781097935907, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors20\": {\"x\": -4094.9048415854504, \"y\": -1490.1248049415271, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors21\": {\"x\": -4100.285643745168, \"y\": -1217.133315644563, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage45\": {\"x\": -3633.535448478195, \"y\": -1392.2424167800473, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors10\": {\"x\": -4130.725943863675, \"y\": -1116.567311955927, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors11\": {\"x\": -4136.106746023393, \"y\": -843.5758226589629, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage40\": {\"x\": -3669.3565507564194, \"y\": -1018.6849237944472, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors22\": {\"x\": -4085.699777248221, \"y\": -786.7870549244457, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors23\": {\"x\": -4091.080579407939, \"y\": -513.7955656274816, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage46\": {\"x\": -3624.3303841409656, \"y\": -688.9046667629658, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors12\": {\"x\": -4105.250583533041, \"y\": -506.45533262968723, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors13\": {\"x\": -4110.631385692759, \"y\": -233.46384333272312, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage41\": {\"x\": -3643.8811904257864, \"y\": -408.57294446820737, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors24\": {\"x\": -4099.666206941716, \"y\": -258.5090119748444, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors25\": {\"x\": -4105.047009101434, \"y\": 14.482477322119735, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage47\": {\"x\": -3638.296813834461, \"y\": -160.62662381336452, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors14\": {\"x\": -4154.630767433449, \"y\": 165.75161272625598, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors15\": {\"x\": -4160.011569593167, \"y\": 438.7431020232201, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage42\": {\"x\": -3693.261374326194, \"y\": 263.63400088773585, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors26\": {\"x\": -4143.62829532274, \"y\": 406.70575195077845, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors27\": {\"x\": -4149.009097482458, \"y\": 679.6972412477426, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage48\": {\"x\": -3682.2589022154853, \"y\": 504.5881401122583, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors16\": {\"x\": -4141.831035494188, \"y\": 832.1903278270308, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"blendColors17\": {\"x\": -4147.211837653906, \"y\": 1105.181817123995, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage43\": {\"x\": -3680.4616423869325, \"y\": 930.0727159885107, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": -3927.581668102743, \"cy\": 1275.7676624050046, \"scale\": 0.7179990738072236}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Tab 5\", \"nodes\": {\"l_curve_loc_01Shape\": {\"x\": -2576.473661788548, \"y\": -1810.4533830982177, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_06Shape\": {\"x\": -2334.6666666666665, \"y\": -862.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_07Shape\": {\"x\": -2334.6666666666665, \"y\": -706.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_08Shape\": {\"x\": -2334.6666666666665, \"y\": -550.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_09Shape\": {\"x\": -2334.6666666666665, \"y\": -394.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_12Shape\": {\"x\": -2315.6971112205542, \"y\": 80.73461968851441, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_02Shape\": {\"x\": -2334.6666666666665, \"y\": -1486.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_03Shape\": {\"x\": -2334.6666666666665, \"y\": -1330.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_04Shape\": {\"x\": -2334.6666666666665, \"y\": -1174.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve_loc_05Shape\": {\"x\": -2334.6666666666665, \"y\": -1018.3333333333335, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": -2926.2821586034956, \"cy\": -1310.1216244746554, \"scale\": 0.5816253894027233}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Tab 6\", \"nodes\": {\"l_brow_mid\": {\"x\": -3279.592385711044, \"y\": -1072.245475887653, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out\": {\"x\": -3247.0048378997517, \"y\": -823.4864292284245, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"l_brow\": {\"x\": -3250.49355694966, \"y\": -1783.2273491605335, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_curve9_2_loc_moveOffset\": {\"x\": -2271.602612211118, \"y\": -1237.0570565523803, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in\": {\"x\": -3264.6497042659466, \"y\": -1395.870794556709, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": 3177.14641895579, \"cy\": -3598.855286420283, \"scale\": 0.24424433050052582}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Local Init Position\", \"nodes\": {\"mid_mainPoser\": {\"x\": 625.828107567229, \"y\": -4912.367590250758, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"local_1_poser\": {\"x\": 579.7643754469279, \"y\": -6262.364361997303, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix59\": {\"x\": 989.588693214276, \"y\": -6136.408366914609, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"in_mainPoser\": {\"x\": 588.3372870076138, \"y\": -5962.082067359466, \"width\": 234.232137161958, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"local_2_poser\": {\"x\": 588.8320062734404, \"y\": -5571.016450258607, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix60\": {\"x\": 971.2593109796278, \"y\": -5664.323815999474, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"l_brow_local_3_group\": {\"x\": 1432.8748761575484, \"y\": -5129.637786698762, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix61\": {\"x\": 1026.1959632938767, \"y\": -5118.857981827443, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"local_3_poser\": {\"x\": 608.9129175822877, \"y\": -5187.5282218056145, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_4_group\": {\"x\": 1463.1026844756236, \"y\": -4665.251729790567, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix62\": {\"x\": 1069.5645342645628, \"y\": -4706.352271896964, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"local_4_poser\": {\"x\": 660.9428469328705, \"y\": -4541.054760418152, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_5_group\": {\"x\": 1470.041463436909, \"y\": -4185.1888229419255, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix63\": {\"x\": 1048.6515178954537, \"y\": -4300.4848431038845, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"local_5_poser\": {\"x\": 609.4934442260718, \"y\": -4193.083156041814, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"out_mainPoser\": {\"x\": 618.6887330257752, \"y\": -3932.0979650688732, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_6_group\": {\"x\": 1475.6833335828833, \"y\": -3771.695047283213, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix64\": {\"x\": 1057.3812551267677, \"y\": -3876.3705993576737, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"local_6_poser\": {\"x\": 610.2680003878909, \"y\": -3646.2465057977015, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_7_group\": {\"x\": 1533.5370167418955, \"y\": -3432.4817894643797, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"local_7_poser\": {\"x\": 610.2680003878905, \"y\": -3372.0536245138273, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multMatrix65\": {\"x\": 1112.9396793264182, \"y\": -3456.9931828831504, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"r_brow_local_1_group\": {\"x\": 1436.7922418548765, \"y\": -6067.299722022102, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_2_group\": {\"x\": 1427.2225061262827, \"y\": -5499.585963715228, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_3_group\": {\"x\": 1435.1530883894227, \"y\": -5234.675028054771, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_4_group\": {\"x\": 1480.9566359675355, \"y\": -4795.691368274052, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_5_group\": {\"x\": 1467.166004600157, \"y\": -4342.065250827147, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_6_group\": {\"x\": 1471.8277749792733, \"y\": -3913.390089461798, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"r_brow_local_7_group\": {\"x\": 1540.7357761897167, \"y\": -3537.6601460195916, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_1_group\": {\"x\": 1437.2505827883774, \"y\": -6195.780626198113, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_local_2_group\": {\"x\": 1435.7979697024327, \"y\": -5795.5369041821, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": 5, \"notes\": [], \"view\": {\"cx\": 904.7462453076042, \"cy\": -5175.598086511202, \"scale\": 1.0677026901300597}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Tab 8\", \"nodes\": {}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": 161.9962607495239, \"cy\": 1650.5279397121305, \"scale\": 0.3271680454522822}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Limits Positions\", \"nodes\": {\"blendMatrix1\": {\"x\": -141.56959874763538, \"y\": 1767.0604867519587, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix2\": {\"x\": -78.48314362272141, \"y\": 1021.4804171910872, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix3\": {\"x\": -187.4227873745779, \"y\": 320.36825012212046, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix4\": {\"x\": -182.88215131229754, \"y\": 628.2237784730197, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix5\": {\"x\": -148.96999598746487, \"y\": 2077.2131935227562, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix6\": {\"x\": -64.12782651424254, \"y\": 1299.295158080291, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"multMatrix48\": {\"x\": 390.5017926751634, \"y\": 1938.1304703556586, \"width\": 58, \"attr_display_mode\": \"compact\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"multMatrix49\": {\"x\": 441.7429996902672, \"y\": 1193.5241228774244, \"width\": 58, \"attr_display_mode\": \"compact\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"multMatrix50\": {\"x\": 422.8450079591119, \"y\": 513.327898111087, \"width\": 58, \"attr_display_mode\": \"compact\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"l_brow_in_group_1\": {\"x\": 729.4716456990075, \"y\": 425.9544872116985, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_bot\": {\"x\": -651.0868360892679, \"y\": 714.8530803061245, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_group_1\": {\"x\": 751.2939526130042, \"y\": 1115.7180774517633, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_group\": {\"x\": 626.4062081722725, \"y\": -851.3106580164614, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_mid_bot\": {\"x\": -615.9755427150907, \"y\": 1365.8780424840943, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_group_1\": {\"x\": 772.6345377753617, \"y\": 1741.942711307439, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"l_brow_out_bot\": {\"x\": -603.0514818382629, \"y\": 2182.4095646903797, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_top\": {\"x\": -653.8637953447529, \"y\": 338.10545203479035, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_top\": {\"x\": -618.2454104053027, \"y\": 1085.5475589866642, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_top\": {\"x\": -609.5024522886177, \"y\": 1808.790155325404, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"worldInverseMatrix\"]}}, \"basket_entry_id\": 2, \"notes\": [], \"view\": {\"cx\": 455.9251903965554, \"cy\": 1960.2207338518567, \"scale\": 0.38822158487459013}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Joints\", \"nodes\": {\"l_brow_out\": {\"x\": -2982.1556813391408, \"y\": 1519.738927074029, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": 3, \"notes\": [], \"view\": {\"cx\": -2537.1548153199683, \"cy\": 1627.7148344268828, \"scale\": 0.7114268270509011}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Tab 10\", \"nodes\": {\"l_curve9_2_loc_moveOffset\": {\"x\": -11053.9824265778, \"y\": -9586.424686618291, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow\": {\"x\": -12149.582141494906, \"y\": -9721.848820268959, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in\": {\"x\": -12192.151790648146, \"y\": -9585.121586038378, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_mid\": {\"x\": -12185.28535117666, \"y\": -9346.724312380562, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out\": {\"x\": -12185.28535117666, \"y\": -9190.724312380562, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_last\": {\"x\": -11568.157373544846, \"y\": -8788.040205139572, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"local_8_poser\": {\"x\": -12423.221209337353, \"y\": -8922.996063559833, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"worldMatrix\"]}, \"multMatrix68\": {\"x\": -12023.504621039168, \"y\": -8779.798625999405, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"full_mainPoser\": {\"x\": -12422.466274524324, \"y\": -8514.500138120997, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"worldInverseMatrix\"]}, \"r_brow_last\": {\"x\": -11567.127176152318, \"y\": -8432.622104719794, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear3\": {\"x\": -12733.05216823083, \"y\": -9336.155886724058, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear4\": {\"x\": -12818.99181226996, \"y\": -10074.796572150655, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion24\": {\"x\": -11567.607344237169, \"y\": -8998.661277547726, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage24\": {\"x\": -13299.171930233795, \"y\": -8983.2519494445, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage25\": {\"x\": -13338.578049914639, \"y\": -10585.112537896664, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear5\": {\"x\": -13346.496122185907, \"y\": -9754.445670579189, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear9\": {\"x\": -13875.025954187611, \"y\": -10313.113530142353, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear10\": {\"x\": -13868.959978187098, \"y\": -8729.138389166672, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear2\": {\"x\": -13802.537945497363, \"y\": -9946.944900313485, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear8\": {\"x\": -13873.808836585496, \"y\": -10805.008396084002, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage26\": {\"x\": -9517.689423681544, \"y\": -9795.641826633691, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage27\": {\"x\": -9527.075774138382, \"y\": -9028.683227025589, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear2\": {\"x\": -12818.87650548599, \"y\": -10882.360224692193, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear7\": {\"x\": -12011.95911766658, \"y\": -11016.323304222406, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion54\": {\"x\": -12183.290428790157, \"y\": -10187.516143758477, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear11\": {\"x\": -12005.352656786437, \"y\": -9589.019583649802, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear12\": {\"x\": -11997.812824093588, \"y\": -8722.723085127725, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear9\": {\"x\": -11788.799997997648, \"y\": -10627.207667748085, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear1\": {\"x\": -12759.7966725748, \"y\": -8355.945783814745, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion26\": {\"x\": -10572.519319550502, \"y\": -8257.56027712792, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear13\": {\"x\": -10989.787248684197, \"y\": -9768.252485351568, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear14\": {\"x\": -11160.130971788458, \"y\": -9416.958941323284, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear15\": {\"x\": -10969.94923601909, \"y\": -11031.110933104126, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear16\": {\"x\": -11164.65207171263, \"y\": -8636.316844454075, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage28\": {\"x\": -9684.99072189547, \"y\": -9943.182374155112, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"plusMinusAverage29\": {\"x\": -9507.150140369104, \"y\": -8565.615402805312, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion56\": {\"x\": -11330.558320096, \"y\": -10235.537944163398, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear17\": {\"x\": -10155.248861198528, \"y\": -8225.93725552414, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear18\": {\"x\": -10177.896082591244, \"y\": -8403.159482022797, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear19\": {\"x\": -10200.896974889383, \"y\": -8684.012482715885, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear20\": {\"x\": -11818.045464375828, \"y\": -11498.884068018844, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"unitConversion58\": {\"x\": -12171.886333030316, \"y\": -11650.346778720497, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear21\": {\"x\": -10718.296421248298, \"y\": -11391.68856613667, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear22\": {\"x\": -10132.86781996645, \"y\": -8005.116264415648, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear42\": {\"x\": -12967.205813014232, \"y\": -8035.851629041204, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"multDoubleLinear63\": {\"x\": -11081.080807762512, \"y\": -9173.465609863357, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": -11667.990757841138, \"cy\": -8878.694511280024, \"scale\": 0.4718035962019016}, \"group_path\": [], \"group_history\": []}, {\"name\": \"Tab 11\", \"nodes\": {\"l_brow\": {\"x\": -797.3292612043762, \"y\": -774.6461032768063, \"width\": 250, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"maxTransLimitEnable\", \"translate\"]}, \"bs_weights\": {\"x\": 570.8865178411223, \"y\": 219.90507991822722, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": false, \"expanded_attrs\": []}, \"setRange16\": {\"x\": -45.65841628159234, \"y\": -273.7451342875384, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"oldMax\", \"outValue\", \"value\"]}, \"l_brow_in\": {\"x\": -766.6837207468366, \"y\": -275.62472812652277, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"plusMinusAverage59\": {\"x\": -416.4303094979894, \"y\": -92.89962662407834, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"input3D\", \"input3D[0]\", \"input3D[1]\", \"output3D\"]}, \"l_brow_mid\": {\"x\": -760.9685541434476, \"y\": 36.70230096365272, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_out\": {\"x\": -756.0780899180165, \"y\": 332.08053138843644, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"setRange17\": {\"x\": -42.8939380447826, \"y\": 64.09089744588698, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"oldMin\", \"outValue\", \"value\"]}, \"setRange18\": {\"x\": -16.799944813862112, \"y\": 608.1697537662981, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"oldMax\", \"outValue\", \"value\"]}, \"plusMinusAverage60\": {\"x\": -412.7141149536742, \"y\": 783.483960506607, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"input3D\", \"input3D[0]\", \"input3D[1]\", \"output3D\"]}, \"setRange19\": {\"x\": -14.035466577052375, \"y\": 946.0057854997235, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"oldMin\", \"outValue\", \"value\"]}, \"r_brow_out\": {\"x\": -799.1355257311144, \"y\": 1304.2640850816365, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_brow_mid\": {\"x\": -806.6782088081387, \"y\": 1127.3803386156214, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_brow\": {\"x\": -835.7816201851157, \"y\": 777.920488809367, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"r_brow_in\": {\"x\": -806.6782088081388, \"y\": 1023.9120407659777, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}}, \"basket_entry_id\": null, \"notes\": [], \"view\": {\"cx\": -301.5167932724984, \"cy\": 296.8055933776156, \"scale\": 0.636780452312911}, \"group_path\": [], \"group_history\": []}], \"active_tab\": 6, \"basket\": [{\"name\": \"Limits Positions\", \"nodes\": {\"main\": {\"x\": -1825.5607163550967, \"y\": 950.7685322270993, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"setRange18\": {\"x\": -1319.763812799787, \"y\": 1011.2544182582883, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"oldMax\", \"outValue\", \"value\"]}, \"blendMatrix1\": {\"x\": -141.56959874763538, \"y\": 1767.0604867519587, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix2\": {\"x\": -78.48314362272141, \"y\": 1021.4804171910872, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix3\": {\"x\": -187.4227873745779, \"y\": 320.36825012212046, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix4\": {\"x\": -182.88215131229754, \"y\": 628.2237784730197, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix5\": {\"x\": -148.96999598746487, \"y\": 2077.2131935227562, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"blendMatrix6\": {\"x\": -64.12782651424254, \"y\": 1299.295158080291, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"target\"]}, \"multMatrix48\": {\"x\": 390.5017926751634, \"y\": 1938.1304703556586, \"attr_display_mode\": \"compact\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"multMatrix49\": {\"x\": 441.7429996902672, \"y\": 1193.5241228774244, \"attr_display_mode\": \"compact\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"multMatrix50\": {\"x\": 422.8450079591119, \"y\": 513.327898111087, \"attr_display_mode\": \"compact\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"matrixIn\"]}, \"condition1\": {\"x\": -1331.6973432035552, \"y\": 1331.140654551796, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"outColor\"]}, \"condition2\": {\"x\": -1317.6003841987715, \"y\": 1735.922080887228, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"colorIfTrue\", \"outColor\"]}, \"l_brow_in_group_1\": {\"x\": 729.4716456990075, \"y\": 425.9544872116985, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_bot\": {\"x\": -651.0868360892679, \"y\": 714.8530803061245, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_group_1\": {\"x\": 751.2939526130042, \"y\": 1115.7180774517633, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_group\": {\"x\": 626.4062081722725, \"y\": -851.3106580164614, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"translate\"]}, \"l_brow_mid_bot\": {\"x\": -615.9755427150907, \"y\": 1365.8780424840943, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_group_1\": {\"x\": 772.6345377753617, \"y\": 1741.942711307439, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"rotate\", \"translate\"]}, \"l_brow_out_bot\": {\"x\": -603.0514818382629, \"y\": 2182.4095646903797, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_in_top\": {\"x\": -653.8637953447529, \"y\": 338.10545203479035, \"attr_display_mode\": \"essential\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_mid_top\": {\"x\": -618.2454104053027, \"y\": 1085.5475589866642, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out_top\": {\"x\": -609.5024522886177, \"y\": 1808.790155325404, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [\"worldInverseMatrix\"]}}, \"view\": {\"cx\": -1470.0649377902198, \"cy\": 1245.3230445873469, \"scale\": 1.027845750998805}, \"group_path\": [], \"group_history\": [], \"id\": 2}, {\"name\": \"Joints\", \"nodes\": {\"wide_joint_01\": {\"x\": -924.4861322306755, \"y\": 419.1768768918133, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_02\": {\"x\": -958.2211547058437, \"y\": 698.035454756437, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_03\": {\"x\": -958.2211547058437, \"y\": 854.035454756437, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_04\": {\"x\": -958.2211547058437, \"y\": 1010.035454756437, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_05\": {\"x\": -958.2211547058437, \"y\": 1166.035454756437, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_06\": {\"x\": -922.5073771486836, \"y\": 1320.5473806915552, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_07\": {\"x\": -958.2211547058437, \"y\": 1478.035454756437, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_08\": {\"x\": -958.2211547058437, \"y\": 1634.035454756437, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_09\": {\"x\": -958.2211547058437, \"y\": 1790.0354547564375, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_10\": {\"x\": -958.2211547058437, \"y\": 1946.0354547564375, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_11\": {\"x\": -958.2211547058437, \"y\": 2102.0354547564375, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_12\": {\"x\": -958.2211547058437, \"y\": 2258.0354547564375, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"wide_joint_13\": {\"x\": -958.2211547058437, \"y\": 2414.0354547564375, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_1_mpath\": {\"x\": -2169.273776889795, \"y\": 935.1550532592105, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_7_mpath5\": {\"x\": -2158.3661041477494, \"y\": 367.2995127969548, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_7_mpath\": {\"x\": -2271.0498077863385, \"y\": 1914.214404827273, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_7_mpath2\": {\"x\": -2307.535554711515, \"y\": 2182.958447924242, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_2_mpath\": {\"x\": -2178.8752892385255, \"y\": 1128.096300134952, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_4_mpath\": {\"x\": -2190.3971040570023, \"y\": 1394.9200407621765, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_6_mpath\": {\"x\": -2236.484363330909, \"y\": 1750.0776949977226, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_0_mpath\": {\"x\": -2169.273776889795, \"y\": 776.7792508388984, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_7_mpath4\": {\"x\": -2184.97353139744, \"y\": 582.216098122861, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_7_mpath1\": {\"x\": -2299.85434483253, \"y\": 2061.068392429108, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_7_mpath3\": {\"x\": -2336.3400917577064, \"y\": 2352.8560651630323, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_5_mpath\": {\"x\": -2215.361036163701, \"y\": 1589.7815901076647, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curveShape\": {\"x\": -2982.1556813391408, \"y\": 1363.738927074029, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"l_brow_out\": {\"x\": -2982.1556813391408, \"y\": 1519.738927074029, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear18\": {\"x\": -1308.2211547058437, \"y\": 2113.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear17\": {\"x\": -1308.2211547058437, \"y\": 1957.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear21\": {\"x\": -1306.7330806409618, \"y\": 459.4998904923532, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear11\": {\"x\": -1308.2211547058432, \"y\": 783.4044830114067, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear13\": {\"x\": -1315.661525030252, \"y\": 1310.9274456066732, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear19\": {\"x\": -1308.2211547058437, \"y\": 2425.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear20\": {\"x\": -1312.6853769004883, \"y\": 627.4044830114067, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear22\": {\"x\": -1308.2211547058437, \"y\": 2269.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear15\": {\"x\": -1308.2211547058437, \"y\": 1645.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear14\": {\"x\": -1308.2211547058437, \"y\": 1489.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"curve9_3_mpath\": {\"x\": -2228.815480223774, \"y\": 1269.0660371775443, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear23\": {\"x\": -1311.197302835607, \"y\": 1105.8210014655788, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear16\": {\"x\": -1308.2211547058437, \"y\": 1801.0007797673234, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"addDoubleLinear12\": {\"x\": -1315.6615250302516, \"y\": 928.987964557235, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange29\": {\"x\": -1774.4566750629067, \"y\": 2029.1072901700882, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange31\": {\"x\": -1774.4566750629067, \"y\": 625.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange30\": {\"x\": -1774.4566750629067, \"y\": 2341.107290170088, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange21\": {\"x\": -1774.4566750629067, \"y\": 1093.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange23\": {\"x\": -1774.4566750629067, \"y\": 937.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange22\": {\"x\": -1774.4566750629067, \"y\": 781.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange33\": {\"x\": -1774.4566750629067, \"y\": 2185.107290170088, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange28\": {\"x\": -1774.4566750629067, \"y\": 1873.1072901700882, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange24\": {\"x\": -1774.4566750629067, \"y\": 1249.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange32\": {\"x\": -1774.4566750629067, \"y\": 469.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange25\": {\"x\": -1774.4566750629067, \"y\": 1405.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange26\": {\"x\": -1774.4566750629067, \"y\": 1561.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}, \"setRange27\": {\"x\": -1774.4566750629067, \"y\": 1717.1072901700886, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": []}}, \"basket_entry_id\": 3, \"notes\": [], \"view\": {\"cx\": -1501.2085001450007, \"cy\": 985.3437814622149, \"scale\": 0.7114268270509011}, \"group_path\": [], \"group_history\": [], \"id\": 3}, {\"id\": 4, \"basket_entry_id\": 4, \"name\": \"Local Controls\", \"nodes\": {}, \"notes\": [], \"view\": {}, \"group_path\": [], \"group_history\": []}, {\"id\": 5, \"basket_entry_id\": 5, \"name\": \"Local Init Position\", \"nodes\": {}, \"notes\": [], \"view\": {}, \"group_path\": [], \"group_history\": []}]}");
createNode setRange -n "setRange14";
	rename -uid "2055E302-4275-EEC3-263B-5B9F6046C041";
	setAttr ".om" -type "float3" 1 1 1 ;
createNode setRange -n "setRange_top_up";
	rename -uid "F770905F-45C1-1A93-30CD-79BB5D3CD6F1";
	setAttr ".om" -type "float3" 1 1 1 ;
createNode setRange -n "setRange15";
	rename -uid "90A1841D-4766-9373-EB0B-D9B061FAB513";
	setAttr ".on" -type "float3" -1 -1 -1 ;
createNode plusMinusAverage -n "plusMinusAverage24";
	rename -uid "D7EE8A4E-47BD-A12A-8C6B-F3AC7A008553";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multDoubleLinear -n "multDoubleLinear1";
	rename -uid "B75E060A-4AAF-2C41-D6CC-939567A4FD3D";
createNode plusMinusAverage -n "plusMinusAverage25";
	rename -uid "E6506988-4878-D437-AC71-33A6DAEB2C66";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multDoubleLinear -n "multDoubleLinear3";
	rename -uid "17F82072-43B9-D144-7CD2-E1BA8EBAA707";
createNode multDoubleLinear -n "multDoubleLinear4";
	rename -uid "0572723B-49C0-25DA-6B51-C38234DADB10";
createNode unitConversion -n "unitConversion20";
	rename -uid "FC5DEA4E-4845-77B3-D236-7994433D8808";
	setAttr ".cf" -1;
createNode unitConversion -n "unitConversion22";
	rename -uid "723E36AA-4E86-0F47-5DCB-EFB7F24C5A90";
	setAttr ".cf" -1;
createNode unitConversion -n "unitConversion24";
	rename -uid "0E3D02E1-4893-208E-A1B0-4A8615FB051B";
createNode unitConversion -n "unitConversion26";
	rename -uid "B20D43B0-46C9-8431-C2FF-0D9019151D65";
createNode ngst2SkinLayerData -n "ngSkinToolsData_skinCluster1";
	rename -uid "F36BCF30-4F2C-96A3-8AA6-B7B9357BCD1F";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 16 135140 {
"lLGoAWSgFwAABAAAAAwAAABCYXNlIHdlaWdodHMBABEBBPA/EQoBLBkYAQERHP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAP4IAA==",
"/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/g==",
"CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CAD+CADSCAAuC70kBgAAAGNlbnRlchkWHhW9AAAiOb0ANw40vf4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BADoBABjFkporCHDVGmXAeTT+AQD+AQD+AQD+AQD+AQA+AQBYHadj5pOF7T+g6Co+Dv7OP23o2O7CJeAteP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAO4BAAkBOO3dV82BKcM/9t4A8KCF0EJYHBheNpuc7sTlQhgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD6AQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BABw4Ka7q3M3cP36gBvBGJZ85eEBvYz8QNh97xSiKP2VNSQfzOpw/VVV+fVgN1z+1vX3VPOGxP5ZC0F/Bq8o/SPNCMkMT4j91kwLQMcvFPyFQntWFS9qCaAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC2AQBg8D+egPYBs0bnP5yzfH3EMto/bmbqHU8chP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEP6oEDqoEP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAGYBADhgiMmRdAvJP5mO32PT5NFC+B4YUVAtzU0v6EIYAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAOK4CHHZ4WkM/u+d4uNJh36IwKBidfqcrcxcwFTC4BMW4pWur1T8tT0Vu3HCSP8TurVVlrsE/vpZ3KxS94T9lBToNa1PEP4JrNmdUcNcVOP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BADQlUGYt2ZboP+w8Wp1VEKb4EP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIoBAAABKmQKHAQAAAB3aWRlGRQM8D+gFx0h/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEADQGg5vS/gRno4j+ov6o+SD3lP/Tz1HRovNI/OMk3bQ363T8yRS+ig/gWPgD+MAP+MAP+MAP+MAP6MANYN51hLEO64j+s6RU7qyzEP88NOO0OV9f+zx9Czx84zvkIl221mj+NA0+nwfLB/mAAQmAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCWAQAA8Br4FV4IAP4BAP4BABkBuPhoo7Uw0Og/L90eYJa04T/YaqO/yfbiP7RCWi+luuk/HHvWGvWl6j/qoReusv/vYtgAGFjcP4kfZupiIADwT6ygPyNFU+o/DeradcvD5D+YFz6DkQrlP4nltUZQTeU/fS7OxUn1zT+jqDt1QM3KPxG16KYCMa4/lFcWjgVMxj/EF7iJ/jG9P11SxHHpcro/3kIBGAjv/htArqwNqGYBABiExOr8ZqCxFSgYqhCodL9OtxUQngEANGMncbOJ/YU/24OvPmfw/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8n/q8nJq8n2FF9V7DAOts/3wdvhsT41D+rCLtsEWznP+8z5lwAo+M/bjNbRmcG4D95FOnTHHTiPwl4CVlOCufCQAR2AQDZYHQggqIWgJTpP42xpHAwm+I/66RTzzPL1z+QfUa/rcn+iBz+iBzuiBwWiBx08rzaYMHIxD8trxSdTLXPP18skc2nftk/wVq6FZfrRkdm/gEAPgEAmOPaL2EcDdw/9V82gPoh4T8lZq5bNufdPzMsacPnN+I/7XVRl5HU4YLgAXgxo3Qd9E3WP7NMpFnaQtw/zZba/8izyD/LZQBRLjzSgkAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAvgEA2HKrXBJ2rto/xYFG55GE5D+F7UW9zDrmPxS7rvO72dQ/mZ83+Gkh0z813Ahys+vnP43/mKtwoehVyPA+hvIw39KBvj8c/pF/Om/MP4TzgSdt7Og/F1XCg42D5z9Ishmh6PrWP5d2IA6bgNI/dFXCTmQz5D8tgSNikf3sFUj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQB4pNJeczshyD+aIf0VotLTPw454OZcrOU/Wy1dqQn92ULIA5hEePvIQBjiPyRm5CQSCtM/rntTLdtByD+gzFQmYGpQP2U2bjO4fbhCOAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAFS6O9Vs7zW2P9rVWQYahcY/X7lzagEMJuAUOBrxkZn66eE/o2Jfsa1uu/4gDf4gDf4gDaIgDXhKDtJIyfW/PzdaLABZDbM/5Gxb7w5J0j8ilqhk1m1k/ggB/ggB/ggBoggB/gEA/gEA/gEAXgEAOETW3GwtMTA/vMoR0Ws36S3QJuAY/vgA/vgAnvgAGEBJm4tcesv+sAD+sACisAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAVSwKBXnlEvnPyNk8z4i4+Q/1dGg+TJoXggPQPA/uT70WDZO3j/qJXFCR9jOGnAO4PA/HF0IgvwO3z8L/R+XoJbvP7HkbkdKQM4/HFDgHzJH4D+PyyTNbYvmP9Mb1ROtssk/qcmPltpy2Q1A/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEApgEAONzRPYgPRjQ/6Vw4+dtCbmKAAxhm1qNiSI+jYiAAfgEA2J0vq9z4VZE/4sfYf0AksT83n43v0wHEP3oDJh7cxsA/ozbLdh4QFT8/mwuRQ3OvP8HI/f7h6sZicAAYWDaXDSKGwBUgGIcJ3rPXoLIVEP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BABisxPNMJnm9/uAB/uAB/uAB/uAB/uAB/uAB/uABYuAB/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQE4fpAM14L3Sj4p55wEaF56QrADWL47p5/33Yo/e+uHnK/a6j8hkK9eUtzjFSiYeDFeWxrkZz8u0gVPCAqwPzH4tSk4occ//nnV/l7K1D/8V15tj1vdFTARAfBeOCJg3Qz3oz/RT7+2sdrEP+L9t6SCkdI/NkRBqJUb2z+Fv4Ei+WHgP8mNHFd+IMo/mw61klVovj9U+ul8oQeyP6U1wqhh4Zk/IMxzLRP5sz4WSfSg0jn+PgqqOg8UzsD++FD++FD++FDi+FBYAgCfrGiH2T+srwnwikXgP76O9ISiQ+YtgHzwP32yr7WLEM0/881xZA==",
"VCLWPwZy5Nslqd0/idPPHr4sESj+AQD+AQCGAQAYRJe7v5jmuA3Y/gEApgEA8FibC3i9WPTVPwmbfYzp39c/bVzn6zJE2D8SK+nXDKfOP2VGMYv4+rE/28m8NHYruz8AhquWjmHDP4e6ljFTB8k/XfdRMlCtzz+9xSbZ1UrQP0bbSUASWNM/AP7DAA3D8F5iv5jg8afDP/J6sus31tM/VNF7IC5N3T+LJCvNfUPgPyn4i5eQ494/PVcWQDuD3T/r4ea3UgXbP27FnNKsQtk/GPm8M2GI1j/HJyl2OkrTPwS3+Y/Zu80/p6NB7C/gxf5wAcJwAf4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAFhhWnidTqblP/cbe/xfeec/A9JsU81L7U2wPhAg5hAAOJdmaKUivuw//SLnXxoM1g1g/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEAfugY/gEA/gEAGQH+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFgU8dTB2cqJJlBYOFsCOfKoKeQ/acprnC8O4CJQWBQrEgESofv+6CM+6CPZaP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWP5QWAAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEADQFcujvVbO81tj/a1VkGGoXGP1+5c2oBDA==",
"0T8eHwo4GvGRmfrp4T+jYl+xrW67FRj+AQD+AQD+AQB+AQB4//tQjnbxvz83WiwAWQ2zP+RsW+8OSdI/IpaoZNZtZP4IAf4IAf4IAaIIAf4BAP4BAP4BAF4BADhE1txsLTEwP7zKEdFrN+kt0ADwOggA/gEA/gEAhgEAGJ1nj+VuQ8sNuP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAKYBAFSwKBXnlEvnPyNk8z4i4+Q/1dGg+TJoXggPQPA/uT70WDZO3j9qkHr5WajNGnAO4PA/HF0IgvwO3z8L/R+XoJbvP9qcVPFWQc0/HFDgHzJH4D8Zul6x907mP9crlLZuvMk/xPPRTkg92w1A/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEApgEAONzRPYgPRjQ/6Vw4+dtCbmKAAxhm1qNiSI+jYiAAfgEA2J0vq9z4VZE/4sfYf0AksT83n43v0wHEP3oDJh7cxsA/ozbLdh4QFT8/mwuRQ3OvP8HI/f7h6sZicAAYWDaXDSKGwBUgGIcJ3rPXoLIVEP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BABisxPNMJnm9/uAB/uAB/uAB/uAB/uAB/uAB/uABYuAB/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQE4fpAM14L3Sj4p55wEaF56QrADWL47p5/33Yo/e+uHnK/a6j8hkK9eUtzjFSiYeDFeWxrkZz8u0gVPCAqwPzH4tSk4occ//nnV/l7K1D/8V15tj1vdFTARAfBhOCJg3Qz3oz/RT7+2sdrEP+L9t6SCkdI/NkRBqJUb2z+Fv4Ei+WHgP8mNHFd+IMo/mw61klVovj9U+ul8oQeyP6U1wqhh4Zk/IMxzLRP5sz4WSfSg0jn+Pv1pex68zcA+AAARav4BAP4BAP4BALYBAFgCAJ+saIfZP6yvCfCKReA/vo70hKJD5i2AfPA/fbKvtYsQzT/zzXFkVCLWPwZy5Nslqd0/idPPHr4sESj+AQD+AQCGAQAYRJe7v5jmuA3Y/gEApgEA8FibC3i9WPTVPwmbfYzp39c/bVzn6zJE2D8SK+nXDKfOP2VGMYv4+rE/28m8NHYruz8AhquWjmHDP4e6ljFTB8k/XfdRMlCtzz+9xSbZ1UrQP0bbSUASWNM/AA==",
"/sMADcPwXmK/mODxp8M/8nqy6zfW0z9U0XsgLk3dP4skK819Q+A/KfiLl5Dj3j89VxZAO4PdP+vh5rdSBds/bsWc0qxC2T8Y+bwzYYjWP8cnKXY6StM/BLf5j9m7zT8Z+KWFEMXG/nABwnAB/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAfgEAODyXr8rZt+c/A9JsU81L7U2gPgAg5hAAOJdmaKUivuw//SLnXxoM1g1g/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEARgEAOCoCuXzYerc+HvnNQZ+lLf7ADf7ADe7ADRLADf7QAP7QAP7QAD7QAP4BAP4BAP4BAP4BAM4BACCgFwAAGgAAAAT+PQH+PQH+PQH+PQHOPQH+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAHIBAD6Qgv4BAP4BAP4BAP4BADEQ/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBr+GBo+QA4+EAARAREYXggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQEeYA3+AQD+AQD+AQD+yAD+yAD+yAARyP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAP6wAv6wAv6wAv6wAv6wAv6wAv6wAv6wAv6wAv6wAr6wAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAEYBAAAH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMH/tMHRtMH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEABQEAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAogEABPA/FutpPggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAZ+IAZR4P4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBHlARPggA/gEA/gEA/gEAXgEAPugAfhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEAHtgQXgEAESARCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEB/pAE/pAE/pAE/pAE/pAE/pAEvpAE/rAB/rAB/rAB/rAB/rAB/rABvrAB/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA/ogG/ogGvogG/rAA/rAAvrAAEQH+uAD+uADeuAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAOYBAAAB/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH5rsH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBiAQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAsgEABPA/Fu8kEQj+AQD+AQBeAQARoBEI/gEA/gEAEQF+kAB+IAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQDRuBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEAPvACPhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEA/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/rgn/gAJ/gAJngAJ/qgA/qgAnqgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEA/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tACPtAC/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCGAQAAA/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB/6jB4ajB/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAWgEAXqx9XhgA/gEA/gEAPgEAEagRCP4BAP4BAD4BAD6YABEQEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQD+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAmeqAn+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA2AQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAggEABPA/FuMaXggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAUej+AQD+AQA+AQD+mAD+mABemAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAn7gAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABkBAAj+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf+iwf5i/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAOgEAHoR+EQj+AQCeAQD+cAA+QAA+EAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+UAb+UAb+UAb+UAb+UAb+UAb+UAb+UAb+UAb+UAb+UAb+UAbRUP4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA3EI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQAeoC0RCF4BABEgPggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAcSD+AQD+AQD+iAD+iAARiP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAP7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAr7wAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAMYBAAAC/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMHxnMH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAUgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAO4BAAUBBPA/FsNcEQg+AQBeGABeAQD+MAB+MAB+AQ==",
"AF6AAF4YAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BANEwEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC+AQA++AI+EAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQD+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCf+yCfeyCf+OAneOAn+eADeeAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAGYBAAAF/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsH/lsHZlsH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCiAQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAsgEABPA/Fu8ZPggAXgEAESg+AQBeGAD+AQC+AQARiBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA0QgRCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAD4AAz4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAP6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJx6wJ/4ICf4ICf4ICf7AAP7AAP7AAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAA==",
"/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hADPhAD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA7gEACQEABv5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB/5DB+5DB+lD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQANAR6cfhEIPgEAERgRCP4BAP4BAF4BAD6gAD4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BAP5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGtZoGgAA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCCAQAE8D/+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owj+owh2owjxoF4IAP4BAP4BAP4BAP4BAP4BABEBMWARAT4QAP4BAP4BAD4BAP6gAP6gAH6gAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA34gA/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAKYBAAAJ/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isH/isHpisH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC6AQD+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH/+ZH8eZH+RiH4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAHmAu/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAsZheCAD+AQD+AQCeAQA+wAD+AQDeAQARiP4BAN4BABGAfggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEAcUj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDmAQAADf47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47Cv47CuY7Cv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA8gEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAEIBAATwPxaTVj4IAP4BAP4BAP4BAP7QAP7QAP7QAD7QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAHFw/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQGRUBEI/gEA/gEA/gEA/gEA/gEAngEA/nAB/nAB/nAB/nAB/nABvnAB/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEA/qgL/qgL/qgL/qgL/qgL/qgL/qgL/qgL/qgL/qgL/qgLnqgLUeh+CAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQAeYBP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC+AQD++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Az++Azm+AwADP4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rF/4rFw==",
"/isX/isX/isX/isX/isX/isX/isX/isX/isX/isX/isXvisX/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDuAQANAQAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAcgEABPA/Fl8UEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQD+cAN+cAMRYF4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAF7AAxEYfgEAESheCAA+AQBeKAARGP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAP5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFh5QFtGIfggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQA+eAb+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCGAQAACv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCv4jCoYjCv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAOgEAHmSDPgEAXhgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQD+OCgRQD4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAFYBAAAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAFQEE8D/+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+Swn+SwkiSwn+AQD+AQD+AQD+AQD6AQAAC/5AAf5AAf5AAf5AAfpAAf4BAP4BAP4BAP4BAK4BAAAGJS0I4D/hDQgFB/4BAP4BAEoBABhOuK3////fDaAI4D9kBaQZuBz10y7zYyohPgUX/gEA/gEA/gEA/gEA7gEABQEU4D8bU6TDIXAM9OHt7gEI/lMBPlMBDFYWAPABWAwl5TPfAQj+YAA+YAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQAYTWl4ryEebP64Hf64Hf64Hf64Hf64HRq4Hf4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEApgEAADsSuVcA4P44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44Vf44VeI4Vf4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAHYBAB5MgxEI/gEAXgEAPmAAERARCBEBPhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQAeiCg+CAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQAeIA3+AQD+AQD+AQA+AQD+2AD+2AD+2ABe2AD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+mAL+mAL+mAL+mAL+mAL+mAL+mAL+mAL+mAL+mAJemAL+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDmAQAAKf77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B/77B+b7B/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA2gEAHoQlEQj+AQD+AQBeAQARoBEI/gEA/gEAEQF+kAB+IAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQDRuBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEAPvACPhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEACQEAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIIBAATwP/6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHv6jHvajHv4ACf4ACZ4ACf6oAP6oAJ6oAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAn7gAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEARgEAACf+01/+01/+01/+0w==",
"X/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX/7TX+LTXx5sfhEIPgEAXhgAXgEA/jAAfjAAfgEAXoAAXhgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA0TARCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAL4BAD74Aj4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJw==",
"/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn3sgn/jgJ3jgJ/ngA3ngA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hADPhAD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEApgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAHoBAAAh/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBK/uBKouBKBPA/VusaXhgA/gEA/gEAPgEAEagRCP4BAP4BAD4BAD6YABEQEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQD+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAn+qAmeqAn+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAL4BAB7YLV4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAFHo/gEA/gEAPgEA/pgA/pgAXpgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA/vAC/vAC/vAC/vAC/vAC/vAC/vAC/vAC/vAC/vAC/vACvvAC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBWAQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIoBAAAe/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQH/uQHiuQH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAdgEABPA/FuAXEQj+AQD+AQD+AQD+AQD+CAH+CAH+CAH+CAExCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEA/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hgaPkAOPhAAEQERGF4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBHmAN/gEA/gEA/gEA/sgA/sgA/sgAEcj+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQD+wAL+wAL+wAL+wAL+wAL+wAL+wAL+wAL+wAL+wAL+wAL+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAO4BAAkBACb+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+A2D+Aw==",
"YP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYP4DYIIDYB6kfj4IAF4BABEoPgEAXhgA/gEAvgEAEYgRCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BANEIEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQA+AAM+EAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC2AQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAMIBAATwP/5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEv5zEhZzEv4ICf4ICf4ICf7AAP7AAP7AAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAP4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA/4gA34gA/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQDGAQAAH/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX/5zX+JzXx6MfhEIPgEAERgRCP4BAP4BAF4BAD6gAD4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BAP5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGv5oGl5oGv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFv5YFg==",
"/lgW/lgW/lgW/lgW/lgW/lgW/lgW/lgWflgW8aBeCAD+AQD+AQD+AQD+AQD+AQARATFgEQE+EAD+AQD+AQA+AQD+oAD+oAB+oAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAO+MAP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCmAQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAugEAACj+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7+8D7C8D4E8D8W8xw+CAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAb+IAZ+IAZR4P4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBHlARPggA/gEA/gEA/gEAXgEAPugAfhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQAe2BBeAQARIBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQH+kAT+kAT+kAT+kAT+kAT+kAS+kAT+sAH+sAH+sAH+sAH+sAH+sAG+sAH+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQD+iAb+iAa+iAb+sAD+sAC+sAARAf64AP64AN64AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BAP7QAv7QAv7QAv7QAv7QAv7QAv7QAv7QAv7QAv7QAv7QAj7QAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEApgEAAB3+61/+61/+61/+61/+61/+61/+61/+61/+61/+61/+61/+61/+61/+61/+61/+618q618AAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAPIBAATwPxa/FxEI/gEAngEA/nAAPkAAPhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/lAG/lAG/lAG/lAG/lAG/lAG/lAG/lAG/lAG/lAG/lAG/lAG0VD+CAP+CAP+CA==",
"A/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA3EI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEAHqAtEQheAQARID4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAHEg/gEA/gEA/ogA/ogAEYj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQD+AAP+AAP+AAP+AAP+AAP+AAP+AAP+AAP+AAP+AAP+AAP+AAP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIYBAAAj/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/qNf/g==",
"o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o1/+o18io1/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH/+bH8ebH+RiH4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BADYBAAAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAwgEABPA//rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMI/rMIVrMIsZheCAD+AQD+AQCeAQA+wAD+AQDeAQARiP4BAN4BABGAfggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEAcVj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA5gEAACD+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2L+e2KCe2Ik8D8D3q+/OtiGPjbrIP58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g/58g958g/44KBFAPggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC+AQAewBD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDuAQAJAQAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD6AQAAIv4AM/4AM/4AM/4AM/4AM/4AM/4AM/4AM/4AM6oAMwT0/wEBDN8/Pv4JCP57Av57Al57AhjZIykAAADgDaAI4D84Aa8duBzxjUkElb85Pv7AAP7AAF7AAP4BAP4BALYBABTgP3PWLR4hcAwHD4kIAQj+wAA+wAAM1fT/BwFYDG0NZhABCP5gAD5gAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BALYBAADwGoAbEQj+AQBeAQAdYCgVn6T//+8/UN7h4wEINnIAHSj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAPIBAB6IKD4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAB4gDf4BAP4BAP4BAD4BAP7YAP7YAP7YAF7YAP4BAP4BAP4BAP4BAP4BAP4BAO4BAAkBBIvzDgFXAN8aODn+qAL+qAL+qAL+qAL+qAL+qAL+qAL+qAL+qAL+qAJmqAL+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAAAk/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg/jlg6jlgAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAAUBBPA/FkcSEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQD+cAN+cAMRYF4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAF7AAxEYfgEAESheCAA+AQBeKAARGP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP7ADP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAP5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFv5QFh5QFtGIfggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEAPogG/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCGAQAAJf5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYg==",
"/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi/mNi4mNiPuyDERD+AQD+AQD+AQARyBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAfgEA/mgD/mgD/mgD/mgD/mgD/mgD/mgD/mgD/mgD/mgD/mgD/mgD/mgDnmgD/gEA/gEA/gEAngEAkVARCP4BAP4BAP4BAP4BAP4BAJ4BAP5wAf5wAf5wAf5wAf5wAb5wAf4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP6oC/6oC/6oC/6oC/6oC/6oC/6oC/6oC/6oC/6oC/6oC56oC1HofggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAHmAT/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAtgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBCAQAE8D/+kwf+kwf+kwf+kwf+kwf+kwf+kwf+kwf+kw==",
"B/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB/6TB0KTB/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEApgEAAAEq61pADQAAAE5ldyBMYXllciAoMikZHQzwP6AXHSr+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDaAQA8x5Pf/7q3UjzBiptJD7wCPv6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBP6HBNqHBP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAHoBAB6QfV4IAP4BAP4BAKYBABio9P5rDA+kGmB+XtAAIPA/OM/opmSmnGIoABiH8/+fjI6uDSD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAbmQGLADYgv04LT+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAX+YAVCYAVYSUznSsmGwj8J/BuOnw3aP7NoJM7qZdtCaAQ4P03ZGzP92T+wpRQ5l/vdQiAAEQE4eYamX23I3j/Kw27Tf2TeQigAOHUWL5HfutM/m5imYAA21UIgAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BABgJU576HYe4YsADGG3yYdiIEJliIAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQAYoO2VwsLp1v44Df44Df44Df44Df44DQ==",
"/jgN/jgN/jgN/jgN/jgN/jgNYjgNGP4VKSa05LBN4CbgGP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEP4QEF4QEP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBONq9PDmFlrM/Zgpx8fXcvCLwDhgxp+28q4bUDRBmEA8YTtNRbPqt3A0oZgEAGIb83l0rHCUVKBg87EXdvmCDFRD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQAUIFtBPeJ+HngvHggMRgEAFMM74R/Kp4YIDP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAL4BABhI6i7VQUnfGqgQsQDmCAAUlRUMr/VY/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA0/mA05mA0/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAtgEAfugY/gEA/gEApgEA/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/lBY/g==",
"UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFj+UFgOUFgAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIoBADzavTw5hZazP2YKcfH13Lw/HrMLGDGn7byrhtQNEADwOggAGQEYTtNRbPqt3A0gZgEAGIb83l0rHCUVKBg87EXdvmCDFRD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQAYIFtBPeJ+2xqoCx4IDEYBABTDO+EfyqeGCAz+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQAYSOou1UFJ3zrwBJH4xggAGJUVDK/1WNUNUP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BALYBACCgFwAAGwAAABn+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwr+Nwq2Nwr+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA7gEADQEeqIM+AQBeGAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQD+OCgRQD4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAB6wEP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA7gEACQEAGv6DCv6DCv6DCv6DCv6DCv6DCv6DCv6DCv6DCv6DCv6DCv6DCsqDChy8F10CYyohPv47A/47A/47A/47A/47A/47A/47A/47A/47A/47A/47A/47A8o7A/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAAUBAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAAUBBPA/FoddEQgRAT4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAB6IKD4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAHpAQ/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAGQEADv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCv6LCiaLCv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAkgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDCAQAE8D/+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cxr+cw==",
"Gv5zGv5zGv5zGv5zGv5zGv5zGv5zGlZzGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGv4YGj5ADj4QABEBERheCAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAR5gDf4BAP4BAP4BAP7IAP7IAP7IABHI/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEA/rAC/rAC/rAC/rAC/rAC/rAC/rAC/rAC/rAC/rACvrAC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEARgEAAA/+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wf+0wdG0wf+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BANoBAB7MfxEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEA0RgRCP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEA/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgCXtgC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEAHlARPggA/gEA/gEA/gEAXgEAPugAXhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAHtgQXgEAESARCCQAAAAAAAAAAAAAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCSAQAE8D/+Zw3+Zw3WZw3+uAD+uADeuAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv7AAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAOYBAAAT/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH/rsH5rsH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA0BHrx9EQj+AQD+AQBeAQARoBEI/gEA/gEAEQH+kAD+kAA+kAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAdHYEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQA+8AI+EAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQD+uDD+uDCeuDD+qAD+qACeqAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQD+0AL+0AL+0AL+0AL+0AL+0AL+0AL+0AL+0AL+0AL+0AI+0AL+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIYBAAAU/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMH/qMHhqMH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA7gEABQEAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAUgEABPA/VpdLXhgA/gEA/gEAPgEAEagRCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAP5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCl5YCv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQEe4C0+CAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQBR4P4BAP4BAD4BAP6YAP6YAF6YAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEB/uAC/uAC/uAC/uAC/uAC/uAC/uAC/uAC/uAC/uAC/uACfuAC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAGQEAFf6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/6LB/mL/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBSAQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAOIBAATwPxZ7CREI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQH+EAf+EAf+EAf+EAf+EAf+EAf+EAf+EAf+EAf+EAf+EAf+EAfxEP4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA/4IA3EI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQAeoC0RCF4BABEgPggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAcSD+AQD+AQD+iAD+iAARiP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAP7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAv7wAr7wAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAMYBAAAX/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMH/nMHxnMH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD6AQAelH4+CABeAQARKP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEAngEA0bARCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAD4AAz4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAP6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ/6wJ+6wJxawJwAA/gEA/gEA/gEA/gEA/gEABQEE8D/+RwH+RwH2RwH+wAD+wAD+wAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+EAP+EAP+EAP+EAP+EAP+EAP+EAP+EAP+EAP+EAP+EAP+EAM+EAP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDuAQAJAQAS/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH/kMH7kMH6UP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEADQEenH4RCD4BAF4YAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEB/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAb/iAbviAb/vAVnvAV/mgAnmgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEA8aBeCAD+AQD+AQD+AQD+AQD+AQARATFg/gEA/gEAngEA/rAA/rAAvrAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAvgEA/iAD/iAD/iAD/iAD/iAD/iAD/iAD/iAD/iAD/iAD/iAD/iADfiAD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCmAQAAEf4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB/4rB6YrB/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAKIBAAAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQAyAQAE8D8WD0ZeCAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBHmAu/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/sgD/sgD/sgD/sgD/sgD/sgD/sgDPsgDMdBeCAD+AQD+AQD+AQD+AQC+AQA+SAH+AQD+AQARAf6YAP6YAF6YAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAHE4/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA5gEAABD+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+Owr+OwrmOwr+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAFIBAAAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAwgEABPA/aTMRCP4BAP4BAP4BAD4BABHYEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQD+aAP+aAP+aAP+aAP+aAP+aAP+aAP+aAP+aAP+aAP+aAP+aAP+aAOeaAP+AQD+AQD+AQCeAQCRUBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3eGA1R+D4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAB5QE/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BALHgEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QBz4QB/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAKYBAAAb/isD/isD/isD/isD/isD/isD/isD/isD/isD/isD/isD/isDpisD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB6AQAeRH4RCD4BAF4YAF4BAL4wAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA0cgRCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAL4BAD74Aj4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ/7IJ97IJ/44Cd44Cf54AN54AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEB/gAD/gAD/gAD/gAD/gAD/gAD/gAD/gAD/gAD/gAD/gAD/gAD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAhgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDaAQAAHP54A/54A/54A/54A/54A/54A/54A/54A/54A/54A/54A/54A/54A9p4A/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBmAQAE8D8WHHcRCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAP5wA35wAxFgXggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEAXsADERh+AQARKF4IAF4BABEw/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAEQH+0Az+0Az+0Az+0Az+0Az+0Az+0Az+0Az+0Az+0Az+0Ay+0AxR8BEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEAHvASEQj+AQBeAQD+YAB+YAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQDRiL4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBPngG/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQD+aAf+aAf+aAf+aAf+aAf+aAf+aAf+aAf+aAf+aAf+aAf5aAAs/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMK/iMKXiMK/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA4gEAHpwj/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEA/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hga/hgaZhgaAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCSAQAE8D82pwk+EAARAREYXggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAR5gDf4BAP4BAP4BAP7IAP7IAP7IABHI/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEA/sAC/sAC/sAC/sAC/sAC/sAC/sAC/sAC/sAC/sAC/sAC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDuAQAJAQAt/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg/gNg4gNgHrx/EQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQDRGBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEA/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgC/tgCXtgC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3g==",
"AQAeUBE+CAD+AQD+AQD+AQBeAQA+6ABeEAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQAe2BBeAQARIBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAvgEA/ngN/ngN3ngN/rgA/rgA3rgA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tAC/tACPtAC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAlgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAO4BAA0BADX+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDr+hDrChDoE8D8WcyERCA==",
"/gEA/gEA/gEAPgEAEdgRCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAP5oA/5oA/5oA/5oA/5oA/5oA/5oA/5oA/5oA/5oA/5oA/5oA/5oA55oA/4BAP4BAP4BAJ4BAJFQEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQA+AQD+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3+GA3eGA1R+D4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAB5QE/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BALHgEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQD+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAf+IAd+IAf+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAGYBAAA0/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb/ltb2ltbAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAGIBAATwPxbbGF4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBHmAu/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/sgD/sgD/sgD/sgD/sgD/sgD/sgDPsgDMdBeCAD+AQD+AQD+AQD+AQC+AQA+SAH+AQD+AQARAf6YAP6YAF6YAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAL4BAHFI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAOYBAAAz/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti/nti4ntiHnx+EQg+AQBeGAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG/4gG+YgGwAA/g==",
"AQD+AQD+AQD+AQD+AQD+AQDSAQAE8D/+twGWtwH+aACeaAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDeAQDxoF4IAP4BAP4BAP4BAP4BAP4BABEBMWD+AQD+AQCeAQD+sAD+sAC+sAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAP+MAO+MAP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAGYBAAAu/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltf/ltfwltfHnx9EQj+AQD+AQBeAQARoBEI/gEA/gEAEQH+kAD+kAA+kAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAdHYEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQA+8AI+EAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAP64MP64MJ64MP6oAP6oAJ6oAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAv7gAn7gAv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA9gEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBKAQAAL/6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULv6ULqKULgTwP1brGl4YAP4BAP4BAD4BABGoEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAP5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCv5YCl5YCv4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBHuAtPggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAUeD+AQD+AQA+AQD+mAD+mABemAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQD+8AL+8AL+8AL+8AL+8AL+8AL+8AL+8AL+8AL+8AL+8AK+8AL+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAOYBAAAw/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/rtf/g==",
"u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1/+u1+au18AAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAIIBAATwP+ljEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQARAf4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/4QB/EQ/ggD/ggD/ggD/ggD/ggD/ggD/ggD/ggD/ggD/ggD/ggD/ggDcQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQAeoC0RCF4BABEgPggA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAcSD+AQD+AQD+iAD+iAARiP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAP4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4AA/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCGAQAAMv6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX/6jX4KjXx6Efj4IAF4BABEo/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEA0bARCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAD4AAz4QAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAfgEA/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAn/rAnHrAn/ggJ/ggJ/ggJRsAAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQAyAQAE8D/+DwP+DwP+DwP+DwP+DwP+DwP+DwP+DwP+DwP+DwP+DwP+DwMyDwP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQ==",
"AP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAO4BAA0BACr+hF/+hF/+hF/+hF/+hF/+hF/+hF/+hF/+hF/+hF/+hF/+hF/KhF8cDWyyfJW/OT7+OwP+OwP+OwP+OwP+OwP+OwP+OwP+OwP+OwP+OwP+OwP+OwPKOwP+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQDSAQAsOzh8u///7z/V4cXJAQg2hRr+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lIP+lA==",
"g/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ug/6Ugx6Ugx6IKD4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAD4BAB6gEP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAlgEAAAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCKAQAAMf6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIv6kIuKkIgTwPxa7GxEIPgEAXhgAXgEAvjAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBeAQDRyBEI/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAvgEAPvgCPhAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEA/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn/sgn3sgn/jgJ3jgJ/ngA3ngA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAXgEA/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hAD/hADPhAD/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQAZAQA2/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/otf/g==",
"i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i1/+i19ai18AAP4BAP4BAP4BAP4BAP4BAP4BAP4BAKIBAATwPynrEQj+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQD+cAN+cAMRYF4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAF7AAxEYfgEAESheCABeAQARMP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEB/tAM/tAM/tAM/tAM/tAM/tAM/tAM/tAM/tAM/tAM/tAMvtAMUfARCP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAB7wEhEI/gEAXgEA/mAAfmAA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAngEA0YiGCAAY1k7LYFX/7xrwMf4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BAD6IBv4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQCeAQD+eGD+eGD+eGD+eGD+eGD+eGD+eGDmeGAAK/5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYv5jYoJjYh7cIj4BAF4YAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEAfgEA/jgoEUA+CAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC+AQAewBD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQBGAQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAugEAADf+sFn+sFn+sFn+sFn+sFn+sFn+sFn+sFn+sFn+sFn+sFn+sFlisFkE8D9pGxEIEQE+EAD+AQD+AQD+AQD+AQD+AQAxUD4IAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAA==",
"/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAHqBV/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/g==",
"AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB2AQAAAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BANYBAAABarcWBJqZAQEEuT8BJER4DAAAAGNsb3Nlc3RQb2ludDQdOQEh8MIpAAAAAgAAACcAAAADAAAAIQAAAAQAAAAeAAAABQAAACYAAAAGAAAAHwAAAAcAAAAoAAAACAAAAB0AAAAJAAAAIwAAAAoAAAAgAAAACwAAACIAAAAMAAAAJAAAAA0AAAAlAAAADgAAACwAAAAPAAAALQAAABAAAAA1AAAAEQAAADQAAAASAAAAMwAAABMAAAAuAAAAFAAAAC8AAAAVAAAAMAAAABcAAAAyAAAAGgAAACoAAAAbAAAAMQAAABwAAAA2AAAFjAAIDbQBvAAfDbQAIA2cAdQB3AGcAAsNtAQJAAmkISAAJQ2sAewB9CEMIRQAKA30ISQhLAgqAAAFhAgrAAAFBAQsAAncBC0ACdwMLgAAAAHEAC8NxAG8CBUAAAWsABsNxAgXAAAF7AQSAAn8BBEAKQwsEAAAADYAAAAcAAAA"};
	setAttr ".imo" -type "string" "{\"_InfluenceMappingConfig__mirror_axis\": 0, \"dg_destination_attribute\": \"oppositeInfluence\", \"globs\": [[\"L_*\", \"R_*\"], [\"l_*\", \"r_*\"], [\"lf_*\", \"rt_*\"], [\"*_lf\", \"*_rt\"], [\"Left*\", \"Right*\"]]}";
createNode materialInfo -n "pasted__materialInfo48";
	rename -uid "93BE0A9B-4BBB-29C2-F3CD-16BBC62FA6D9";
createNode shadingEngine -n "pasted__lambert1SG1";
	rename -uid "32AF0550-4C10-237D-8309-2EA3235F608A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode unitConversion -n "unitConversion32";
	rename -uid "9509B91A-457F-5E9F-4E6D-EA860BCCCAA4";
	setAttr ".i" 0;
createNode addDoubleLinear -n "addDoubleLinear7";
	rename -uid "0251D4F8-431F-8393-7C30-6FA37DC6DC92";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear9";
	rename -uid "291F83E7-483F-6F65-DE36-92BA66DA1D90";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear10";
	rename -uid "83EE276C-4E27-741A-2D2F-43A69B98BF94";
	setAttr ".ihi" 2;
createNode setRange -n "up_down_setRange";
	rename -uid "F3C3DE21-4C49-266C-C553-D8BF9CEB17CD";
	setAttr ".n" -type "float3" 1 0 1 ;
	setAttr ".m" -type "float3" 0 1 0 ;
	setAttr ".on" -type "float3" -0.80000001 0 -1 ;
createNode ngst2SkinLayerData -n "ngSkinToolsData_skinCluster2";
	rename -uid "08756AB6-4049-E7B1-CD07-928E80DCF971";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 16 5262 {
"tKwDXEQBAAABAAAADAAAAEJhc2Ugd2VpZ2h0cwEUCQEE8D8BCAEo/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAfgEADiQKABT+JQr+JQqaJQqYWsChQyJlYj+S8rHA+QJqP5xWhki4VoA/jBBb0DSOdD82ScGNcx9pEvwKLgEAODs+acdeBms/KBnqxKYUekIgAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BABgcvTM91d9KYlACWNsp9eMxLmU/qmBr7pzxcz9HHH2PpOtsYjAAEQEYgoCgz4ztUYIoAP4BAP4BAP4BAP4BAP4BAJYBABZMDwAA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA/ggA7ggADQgmYBT+AQD+AQD+AQBGAQAYQUeKTOkuh/50B/50B/50B/50B/50B/50B+10/gEA/gEA/gEAGQEcdfp0Tklc+z7+0gA+0gAYwSr4HEHy6v5YAEJYAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAAAC/kEG/kEGqkEGOJixYYBW9o8/JROU+03DSP78Cf78Cf78Cf78Cf78Cf78Cf78Cf78Cf78CUL8Cf4BAF4BABjBbKwLErcH/rAC/rAC/rAC/rAC/rAC/rAC/rAC/rAC/rAC/rACorAC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAPgEAAAP+EQT+EQSKEQQYMsl8y5K8F/5kB/5kB/5kB/5kB/5kB/5kB/5kB/5kB/5kB/5kB/VkGM6D813VT2v+kAL+kAL+kAL+kAL+kAL+kAL+kAL+kAL+kAL+kAJVkP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAAAE/mEE/mEESmEEOM3k1Rj4+ts/76nP5zlI4P6MB/WMWAsG5gf/2ds/b8XnFgbB3T/DOtyuml43/mAAFWD+AQBYLIuAEri42T9NHzOwiyuNP1FqXdrYG9j+oAD+oAAVoDgzo6j+BOHZP1mA9vBTf9z+mAAVmPA+nEvrGwqy1T80EmSuUx/VP2JpLNZ6g8k/d44adoyp0j8UAl4LHzbSP3+3aQ==",
"ARSCzz9OY4DmoebUP+7kc/EuLNb+iAAViP4BAP4BABEBeD9sY5iFSdY/pd2UZLDR3D+AqaE4QHPgP5JuKNVultP+8AD+8ACi8ADwPmAgcHMWNaI/RLTPwwZ01D/+CZQ4HvjZP9k0dLuwuNw/mfZdqRib3T8qhVnLEbDcPzDAduTTGdo/6TBIwgos0/7oAP7oAKLoAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAAAF/uEE/uEEyuEEOLmvY1m54qI/VOY3Y9C9Qv5MBv5MBv5MBv5MBv5MBv5MBv5MBv5MBv5MBv5MBmJMBjjdJE1WIfJBP6OJPdWd/pD+qAL+qAL+qAL+qAL+qAL+qAL+qAL+qAL+qAL+qAJiqAL+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQB+AQAABv4hBP4hBOohBDhNfp0xUkOXP0Xa2oOPDzr+hAf+hAf+hAf+hAf+hAf+hAf+hAf+hAf+hAf+hAf1hDgvx9JX9ZFCPyfGRuH5k5b+mAL+mAL+mAL+mAL+mAL+mAL+mAL+mAL+mAL+mAJVmP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAN4BAAAH/jkE/jkE/jkEajkEOMAgmIwregw/bqe8PO5ykf6sB/6sB/6sB/6sB/6sB/6sB/6sB/6sB/6sB/6sB4KsBxj/HUcvR+hn/qgC/qgC/qgC/qgC/qgC/qgC/qgC/qgC/qgC/qgCgqgC/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAvgEAAAj+8QP+8QOK8QM4mMvR2YXDhz+0cIx2cgws/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQH/kQHQkQH/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEAfgEAAAn+4QL+4QLu4QJN4RjBHOw2cFOI/jwK/jwK/jwK/jwK/jwK/jwK/jwK/jwK/jwK/jwKIjwKGMPsCiL3GYT+kAL+kAL+kAL+kAL+kAL+kAL+kAL+kAL+kAL+kAJVkP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAAAO/kEE/kEESkEEOMELeQnwi88/FwgPjur42/5sB/VsWHU39LtVPNA/JigHfhcg2T+HqOhmhFk2/g==",
"YAAVYP4BAFjEgIAQJErPP7Bc1MaPM4g/cbbh+QqH1P6gAP6gABWgNMoP8gBquM4/+iuU5yLn/nA9JnA98D7j1h6iQ3PGP7EeEEt3lcY/EEYFseB8xj8K/st2BH7PPze7Rq8sL84/zYgAF8xuyj/DZTv9pWfHP+RFWdF8FMf+IAH+IAE1IP4BABEBeBO+BmOVqcY/yb0AyPcv0D+EzuD5iebbP8WlEdDQQdD+8AD+8ACi8ADwPtfAW8LP76A/hZ0O1pJ90z836c/hzqPYP2KCMVr7Zts/H7mTWrgE3D8RIZcASKLaP90icvIJFtg/OJbL1JFU0f7oAP7oAKLoAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAH4BAAAP/uEE/uEEleFg8D+WKLA9CUXvP1GVbeIPP9Q/ZCCNEg21q+IsBrisWSoZR390P5JGkEA/QO8/f8IlPKvp0z/eJCLWxD3CP2RHHfxI+u8/0Yp8Un42SOJoAN4BAJjdiC51fvR3P20fHRcI1O8/czQ/5TWi1j8Q4iOSgyrvPz/fwCscXdP+mADCmABWAQBg8D/oVN4AxsLWP1yn6k4SM8U/XcPrfj6P7+6gAAWg8D7ySAUTVBTfP3TeE6zwld8/I5QzHun/4z+Ecn9OcZfdP1Cg/pxKst4/7W/l+ceD4T/Q6eEai2XfPyB436WSSd7ugAAFgP4BAP4BABEBuPjw1D9ive8/uTQZtq9h3j+SZGrTV/7SP+Pz3qasl6k/p+vFWsAn3D9UWDwEdIDv/vgA/vgAgvgA8D7tQaOcsc3tPziuIWZmDtg/mRk4yyXIyj8NI2mpT4G/Px1BOfC7gLk/hrMeaExbwT/pOS5SRKDLP+A47Ghjf9sN4B4Ub/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAOYBAAAQ/nsFYnsFsdxeCAD+AQBeAQA+cAD+AQBeAQDeaADeOAC+AQDeaADeOAC+AQD+aAA+aAA+UAC+EAD+AQA+cAD+AQD+AQB+AQA+sAB+EAD+AQD+AQDeAQB+2ABeIAD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQAZAQAR7gsFrQs4BWS36Mdj7z8GvzixuoftGgAQ/gEApgEAGMvodfsUhu7+eACCeAAUd7Z6YF2bxjgTFBzy3jcP7v6gAIagABQjxuze6kbGoAAU/TlJFteI/rgBhrgBFDMHih1iM8agAP4BAP4BAL4BAA==",
"FG9zTt936/5QAYZQAb4BABSe6RHiS6rGgAEUD/HzBUsqxjgA/gEA3gEAFK547UmVdf5wA4ZwA/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAJ4BAAASyukEeDRdnroxzu4/GNw3QC427z9kfxPpAoeTP9IHOnYqwrP+rAmCrAkRATjpf0IIi1TuP51DBcZ7h5/+eABieAA4WwNtCBQ17z9FYlLhpyiJomgAODM4xiX5B+8/Qd4QggwfoaI4AL4BADidfRgzH/buP6w7ZyKkIpeiaAA0nOIJbrhw7z8XMLZNR7n+uAFmuAE4kNSl858d7z+gGb9OvJOZoqAA/gEA/gEA3gEANCBw907ZpKo/A00C1tVd/qwI7qwIFqwIODuhoq30Ae8/l5iFewdthcKAATQa3oFBn7aaP47unD0C1f7QAO7QAAnQXgEAOBaONHlJWu8/JXUoYaumqMLoAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BAAAT/hkF4hkFHPA/jNpOcr/H2XQUPu36SdhepuQIfgEAFJHmJYXNXoYAERTdYGtg8vmGKAD+AQA+AQA47qIVAxfQ7z+DSXBx9Pt1YtQGFAQ9nAwD8P6gAMagAAkBHowbRgEANL0oD0VgMIw/ZtKD2wqMOcj+AQD+AQC+AQDwPtMTVFxuk14/FsMhkFWOgD/qvJ2vH4OBP7jTo5e7EI8/Uax29I8jfT89Z4yIwmSXPxlrtxHaaIA/gTSC3jLfgWK4AX4BABgwf1WTf+RoDUAg8D8WWW0p4NFwDRBmAQBYHuvp8P7ijz/k/rN+5IrvP6ngl8pAPZSCOAD+AQCeAQAU6cEcvv6k/hACWRAUgqfI1VOh/lAAGVD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQD+AQC+AQAORKIY8s1zmr4Egv5kBsJkBhg9VxLbCISjgngAGJfWzzDvUICCKAD+AQAYEhlbqgBPYv5oAIJoAL4BADg394XH5vlfP5XgK7+uVHf+oAD+oABCoAA4ptnCR1I/pz+9urb5d2Rp/qAA/qAAQqAAfgEA8D721dFItvDvP/R4v6nGve8/DIlBgfO57z+xcKERvYPvP6cSF+C4xe8/xpy769lE7z/3RHkUHpzvPy73hTSDuO/C8AA0jHZHjL9pUT+BqmyAG+fm/AtU50YAU+BGjT/7QKv5FV7vP2um5YF0I/4gAuYgAjjmG8ISvjDvP3PhMx4UsA==",
"pcIYAV4BABTkh3WjwuoRUGa0DP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAF4BACQVAAAAyDCWBe230axA8D9k/ZlTXxxQP9xBFczSLYv+7AW17N4BADTRe/ski0zvPyJVzdkmCP6QAGaQADjnpFX/sO3vP7Al/SA/2Uyi+AA05uE3l3jG7z/SQC6cZN7+GE9mGE8UP6iBolbRMai+AQAg8D9IAnJhW0GKotgAvgEAFEVJBoib5t6gAP4BAP4BAP4BAIYBADRBoF7pr2mDP0XcOSBL9/4oAUYoATizNPwWudHvP7YXLDC/Lnb+6AFi6AE+AQA0vRZupUmM7z86g7ynPej+TCCeTCAg8D+jgwVinyE4/ugAougA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA3gEAABaK+QQUgm33hILI0dQ88D/BLBpW5ByjPwF9BPk3Ov4UBp4UBhkBOKYjUGKv7u0/TgHiDtFxmP4kBmIkBjQWmUH73zHvP6GUX/J+XaboADS7ZeKx+h7vP5z5OEfbAP4oKUYoKViqEcLvG2mBP26NxqnvP+8/NSZ4zgyeoLoIARzwP4qswz7y6P6kcH6kcCDwP/NtRYsBTJy6oAD+AQD+AQDuAQAJATQRWCIYUyWYP5aiUKcgRXFA/gEApgEANAwUknujXu8/lNirS2rB7ogCSYhYJBcxJtyvoj9KEy5lkiHvP1aFYRtMHnL+2AH+2AEt2BzwP0I9btnQtv50H/50HyZ0H/4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BAP4BABEBABlKyQRYATNW0PH37z/5qs+0SJPvPyg/SYS9vnv+DAbuDAbFDDgrKa9JQvjuP95fFG8qc5P+kABikAA0t8A3sMn47z813cyXAMSGHApU/QwPZLTDfD/9Ro9thqzvP5dIs8OpIP4UCWYUCTS590CQW7rvP05SLscKAqYkCxT3N3qS+pb+rAierAj+FBz+FBz+FBz+FBwmFBw07k7FLemfZT9/hVpAWbL+gAGGgAE00aefgaLT7z+Mfr2NkCv+NAlGNAlYwpY9WrPNmz/1PMlnw9vvP91QeqSW7Yz+kANikANeAQAUUL8TzPv8/lABhlAB/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA/gEA7gEADQFur8AEmpkBAQC5EtPAAHgOSNUwY2xvc2VzdA==",
"UG9pbnQavT0BRQEEDti2AQQOvKwBBA6gogEEDoSYAQQOaI4BBA5MhAEEDjB6AQQOFHABBAgKAAAFBAgLAAAFBAF0AQQIDQAABQQOGGYBBA78WwEEDuBRAQQOxEcBBA6oPQEEDowzAQQOcCkBBA5UHwEEDjgVAQQIFwAABQQ8GAAAABgAAAAZAAAAGQAAAA=="};
	setAttr ".imo" -type "string" "{\"_InfluenceMappingConfig__mirror_axis\": 0, \"dg_destination_attribute\": \"oppositeInfluence\", \"globs\": [[\"L_*\", \"R_*\"], [\"l_*\", \"r_*\"], [\"lf_*\", \"rt_*\"], [\"*_lf\", \"*_rt\"], [\"Left*\", \"Right*\"]]}";
createNode blendMatrix -n "blendMatrix1";
	rename -uid "B7AC0CDF-4B18-6A34-6AC3-CC8A905D270F";
createNode blendMatrix -n "blendMatrix2";
	rename -uid "464EC052-4716-1456-0BBC-7292D3CB5A85";
createNode blendMatrix -n "blendMatrix3";
	rename -uid "90568242-4A36-CB54-469E-0A9F79E394C7";
createNode blendMatrix -n "blendMatrix4";
	rename -uid "72E94B05-4BA6-EF53-300A-2284EBBC094E";
createNode blendMatrix -n "blendMatrix5";
	rename -uid "4F1B9314-4E7C-8A97-5719-BC924BC10ABA";
createNode blendMatrix -n "blendMatrix6";
	rename -uid "7EA5AFAD-451A-53F6-C2A3-FBBEE3D9D492";
createNode multMatrix -n "multMatrix48";
	rename -uid "6414FFC6-4164-1BAC-635B-269DD78AFA2F";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix49";
	rename -uid "D6710101-4CFD-858D-C57E-12A54E38000D";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix50";
	rename -uid "02DE48AA-4E98-88AC-E19F-91962C840A28";
	setAttr -s 2 ".i";
createNode displayLayer -n "geometry";
	rename -uid "ABBA4E54-401F-3401-46F7-5694E89968E5";
	setAttr ".dt" 2;
	setAttr ".v" no;
	setAttr ".ufem" -type "stringArray" 0  ;
	setAttr ".do" 1;
createNode condition -n "up_vis_condition";
	rename -uid "CA45FF8C-46BF-6FD8-BA8A-348A28B9035D";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode condition -n "down_vis_condition";
	rename -uid "4D405318-4A1B-38EE-9338-31958C6FABBB";
	setAttr ".st" 2;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode multDoubleLinear -n "multDoubleLinear6";
	rename -uid "F788C240-4C1E-7E5D-8A8C-60902955F3EE";
createNode plusMinusAverage -n "plusMinusAverage26";
	rename -uid "86E59FBC-4C15-DDA4-A225-7B888D1C584B";
	setAttr -s 4 ".i1[3]"  0;
	setAttr -s 3 ".i1";
createNode plusMinusAverage -n "plusMinusAverage27";
	rename -uid "A1ADF02F-4399-E8F6-AFB0-319573AD88F2";
	setAttr -s 4 ".i1";
	setAttr -s 4 ".i1";
createNode multDoubleLinear -n "multDoubleLinear13";
	rename -uid "8548A0AA-4CBB-E204-A6D6-C08B2C88A60C";
	setAttr ".i2" 0.5;
createNode multDoubleLinear -n "multDoubleLinear14";
	rename -uid "3865364E-406A-9DE5-0CCB-BC96BBEB75E4";
createNode multDoubleLinear -n "multDoubleLinear16";
	rename -uid "2C6E24E3-4C93-66E0-FBFB-F7BE48F59736";
	setAttr ".i2" 0.5;
createNode plusMinusAverage -n "plusMinusAverage29";
	rename -uid "9D1EBF6A-4CC2-F4C6-CD2F-33B95D229237";
	setAttr -s 3 ".i1";
	setAttr -s 3 ".i1";
createNode unitConversion -n "unitConversion56";
	rename -uid "954EFDBE-44FF-FB63-A41A-20961278A91B";
	setAttr ".cf" -1;
createNode multDoubleLinear -n "multDoubleLinear17";
	rename -uid "DE5E8BFF-444B-8AB5-7DC1-3B878CEE8CBA";
createNode multDoubleLinear -n "multDoubleLinear18";
	rename -uid "C72D01B0-4809-E481-391D-C4A4521932C8";
createNode multDoubleLinear -n "multDoubleLinear19";
	rename -uid "ABA087D0-4678-A179-EACB-84A644CDAA4F";
createNode multDoubleLinear -n "multDoubleLinear22";
	rename -uid "4E2D699A-4489-9F22-3C53-5195FADD5963";
createNode network -n "hyperNode_snapshotData";
	rename -uid "FF5C2188-4658-2EA1-1859-EEB1A6D60606";
	addAttr -ci true -sn "hyperNodeSnapshotJSON" -ln "hyperNodeSnapshotJSON" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".hyperNodeSnapshotJSON" -type "string" (
		"{\"l_brow\": [{\"translate\": [0.0, 1.3, 0.0], \"rotate\": [0.0, 0.0, -2.882382287039687], \"scale\": [1.0, 1.0, 1.0], \"shear\": [0.0, 0.0, 0.0], \"visibility\": true, \"caching\": false, \"frozen\": false, \"isHistoricallyInteresting\": 2, \"nodeState\": 0, \"isCollapsed\": false, \"blackBox\": false, \"viewMode\": 2, \"templateVersion\": 0, \"uiTreatment\": 0, \"center\": [0.16677941924680129, 1.0605602805716445, -0.24484976934265235], \"intermediateObject\": false, \"template\": false, \"objectColorRGB\": [0.0, 0.0, 0.0], \"wireColorRGB\": [0.0, 0.0, 0.0], \"useObjectColor\": 0, \"objectColor\": 0, \"lodVisibility\": true, \"selectionChildHighlighting\": true, \"ghosting\": false, \"ghostingMode\": 0, \"ghostColorPre\": [0.44699999690055847, 1.0, 1.0], \"ghostColorPost\": [0.878000020980835, 0.6779999732971191, 0.6629999876022339], \"ghostUseDriver\": false, \"hiddenInOutliner\": false, \"useOutlinerColor\": false, \"outlinerColor\": [0.0, 0.0, 0.0], \"rotateOrder\": 0, \"rotatePivot\": [0.0, 0.0, 0.0], \"rotatePivotTranslate\": [0.0, 0.0, 0.0], \"scalePivot\": [0.0, 0.0, 0.0], \"scalePivotTranslate\": [0.0, 0.0, 0.0], \"rotateAxis\": [0.0, -0.0, 0.0], \"transMinusRotatePivot\": [-0.0, -0.0, -0.0], \"minTransLimit\": [-1.0, -0.8, -1.0], \"maxTransLimit\": [1.0, 1.3, 1.0], \"minRotLimit\": [-45.0, -45.0, -45.0], \"maxRotLimit\": [45.0, 45.0, 45.0], \"minScaleLimit\": [-1.0, -1.0, -1.0], \"maxScaleLimit\": [1.0, 1.0, 1.0], \"selectHandle\": [0.0, 0.0, 0.0], \"inheritsTransform\": true, \"displayHandle\": false, \"displayScalePivot\": false, \"displayRotatePivot\": false, \"displayLocalAxis\": false, \"dynamics\": false, \"showManipDefault\": 0, \"rotationInterpolation\": 1, \"limits\": true, \"upLimit\": 1.3, \"downLimit\": -0.8, \"upRotateJoints\": -17.989, \"downRotateJoints\": 0.0, \"limitPositions\": 1}, {\"translate\": [-0.049514535878771825, 0.8515434353315219, 0.0211356309210477], \"rotate\": [0.0, 0.0, -18.025634250411105], \"scale\": [1.0, 1.0, 1.0], \"shear\": [0.0, 0.0, 0.0], \"visibility\": true, \"caching\": false, \"frozen\": false, \"isHistoricallyInteresting\": 2, \"nodeState\": 0, \"isCollapsed\": false, \"blackBox\": false, \"viewMode\": 2, \"templateVersion\": 0, \"uiTreatment\": 0, \"center\": [0.048923967126446755, 0.5768497603946544, -0.2237141384216046], \"intermediateObject\": false, \"template\": false, \"objectColorRGB\": [0.0, 0.0, 0.0], \"wireColorRGB\": [0.0, 0.0, 0.0], \"useObjectColor\": 0, \"objectColor\": 0, \"lodVisibility\": true, \"selectionChildHighlighting\": true, \"ghosting\": false, \"ghostingMode\": 0, \"ghostColorPre\": [0.44699999690055847, 1.0, 1.0], \"ghostColorPost\": [0.878000020980835, 0.6779999732971191, 0.6629999876022339], \"ghostUseDriver\": false, \"hiddenInOutliner\": false, \"useOutlinerColor\": false, \"outlinerColor\": [0.0, 0.0, 0.0], \"rotateOrder\": 0, \"rotatePivot\": [0.0, 0.0, 0.0], \"rotatePivotTranslate\": [0.0, 0.0, 0.0], \"scalePivot\": [0.0, 0.0, 0.0], \"scalePivotTranslate\": [0.0, 0.0, 0.0], \"rotateAxis\": [0.0, -0.0, 0.0], \"transMinusRotatePivot\": [-0.0, -0.0, -0.0], \"minTransLimit\": [-1.0, -0.8, -1.0], \"maxTransLimit\": [1.0, 1.3, 1.0], \"minRotLimit\": [-45.0, -45.0, -45.0], \"maxRotLimit\": [45.0, 45.0, 45.0], \"minScaleLimit\": [-1.0, -1.0, -1.0], \"maxScaleLimit\": [1.0, 1.0, 1.0], \"selectHandle\": [0.0, 0.0, 0.0], \"inheritsTransform\": true, \"displayHandle\": false, \"displayScalePivot\": false, \"displayRotatePivot\": false, \"displayLocalAxis\": false, \"dynamics\": false, \"showManipDefault\": 0, \"rotationInterpolation\": 1, \"limits\": true, \"upLimit\": 1.3, \"downLimit\": -0.8, \"upRotateJoints\": -17.989, \"downRotateJoints\": 0.0, \"limitPositions\": 1}, null, null, {\"translate\": [0.0, 0.0, 0.0], \"rotate\": [0.0, 0.0, 0.0], \"scale\": [1.0, 1.0, 1.0], \"shear\": [0.0, 0.0, 0.0], \"visibility\": true, \"caching\": false, \"frozen\": false, \"isHistoricallyInteresting\": 2, \"nodeState\": 0, \"isCollapsed\": false, \"blackBox\": false, \"viewMode\": 2, \"templateVersion\": 0, \"uiTreatment\": 0, \"center\": [0.17860884950877787, -0.23075015233230206, -0.24484976934265235], \"intermediateObject\": false, \"template\": false, \"objectColorRGB\": [0.0, 0.0, 0.0], \"wireColorRGB\": [0.0, 0.0, 0.0], \"useObjectColor\": 0, \"objectColor\": 0, \"lodVisibility\": true, \"selectionChildHighlighting\": true, \"ghosting\": false, \"ghostingMode\": 0, \"ghostColorPre\": [0.44699999690055847, 1.0, 1.0], \"ghostColorPost\": [0.878000020980835, 0.6779999732971191, 0.6629999876022339], \"ghostUseDriver\": false, \"hiddenInOutliner\": false, \"useOutlinerColor\": false, \"outlinerColor\": [0.0, 0.0, 0.0], \"rotateOrder\": 0, \"rotatePivot\": [0.0, 0.0, 0.0], \"rotatePivotTranslate\": [0.0, 0.0, 0.0], \"scalePivot\": [0.0, 0.0, 0.0], \"scalePivotTranslate\": [0.0, 0.0, 0.0], \"rotateAxis\": [0.0, -0.0, 0.0], \"transMinusRotatePivot\": [-0.0, -0.0, -0.0], \"minTransLimit\": [-1.0, -0.8, -1.0], \"maxTransLimit\": [1.0, 1.3, 1.0], \"minRotLimit\": [-45.0, -45.0, -45.0], \"maxRotLimit\": [45.0, 45.0, 45.0], \"minScaleLimit\": [-1.0, -1.0, -1.0], \"maxScaleLimit\": [1.0, 1.0, 1.0], \"selectHandle\": [0.0, 0.0, 0.0], \"inheritsTransform\": true, \"displayHandle\": false, \"displayScalePivot\": false, \"displayRotatePivot\": false, \"displayLocalAxis\": false, \"dynamics\": false, \"showManipDefault\": 0, \"rotationInterpolation\": 1, \"limits\": true, \"upLimit\": 1.3, \"downLimit\": -0.8, \"upRotateJoints\": -17.989, \"downRotateJoints\": 0.0, \"limitPositions\": 1}, null, null, null]}");
createNode multMatrix -n "multMatrix51";
	rename -uid "78DDA86D-4DF6-527A-87AF-C8B5EF5AC718";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix4";
	rename -uid "78562193-4200-0D5E-B87F-A28DF7FA6897";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode unitConversion -n "unitConversion59";
	rename -uid "7B9AE23D-4203-1948-B3EF-7795C3AAD253";
	setAttr ".cf" -0.5;
createNode blendMatrix -n "blendMatrix11";
	rename -uid "CD47265A-45BA-62B1-5FEC-F69ECE32C477";
createNode blendMatrix -n "blendMatrix12";
	rename -uid "02830488-4781-6D0F-9132-528246959B6F";
createNode blendMatrix -n "blendMatrix13";
	rename -uid "BC0725B2-45A3-B610-77D0-54B7E87B43C1";
createNode blendMatrix -n "blendMatrix14";
	rename -uid "8DCC8D9C-46AF-2BC9-2020-5A810F3703C9";
createNode blendMatrix -n "blendMatrix15";
	rename -uid "CF01F19B-4F59-B203-E130-0CA1A11C2A7B";
createNode blendMatrix -n "blendMatrix16";
	rename -uid "AE094DEA-45EA-02AD-69BB-06A5C82A3D69";
createNode multMatrix -n "multMatrix52";
	rename -uid "D5B7DE88-451D-035E-9997-6AB5B3DEC08E";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix53";
	rename -uid "F3F313BA-47EC-ABB2-FC8D-54AEE3FB467D";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix54";
	rename -uid "545C5888-4A56-8A3E-40BE-D2854E386385";
	setAttr -s 2 ".i";
createNode setRange -n "up_down_setRange1";
	rename -uid "D49AD675-46C0-49B9-C84D-9CAD60CD4896";
	setAttr ".n" -type "float3" 1 0 1 ;
	setAttr ".m" -type "float3" 0 1 0 ;
	setAttr ".on" -type "float3" -0.80000001 0 -1 ;
createNode blendColors -n "blendColors3";
	rename -uid "24F1E26F-494A-20D5-FB12-C7BD6D4F6005";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage37";
	rename -uid "9D8D9E46-460C-677C-F033-70B0031728F3";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors4";
	rename -uid "1CDE56F6-4408-7ECB-BC2C-7BA123199881";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors8";
	rename -uid "16C3986F-4CFC-CCD4-04F9-1A9E57959964";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors9";
	rename -uid "9EDCE857-4F56-891F-0E03-B6A9CE68065C";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage39";
	rename -uid "5CDFAF33-46FD-0015-C881-7299DA5CD8AE";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors10";
	rename -uid "E7F74723-46F2-DE9F-A66C-BB9393411D57";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors11";
	rename -uid "4332834E-4415-DE2B-C395-9CB33354595E";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage40";
	rename -uid "163EFAC1-4AFE-C398-7E07-EAB39769DBE8";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors12";
	rename -uid "FC3C5C05-4EEC-C40D-61AE-43BA623D7816";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors13";
	rename -uid "81521D8C-4800-F816-52AF-8D9A269A184C";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage41";
	rename -uid "2711C7B0-4174-179C-9D8E-5896F4920D0E";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors14";
	rename -uid "508E7E49-497B-DFF1-C277-D2880170ECE6";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors15";
	rename -uid "9F62960E-4C49-B3F9-4E70-58ABAED5B6BB";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage42";
	rename -uid "B9B83834-455D-6819-7FDA-F795744D9C28";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors16";
	rename -uid "683923A7-48BC-7314-E81B-3E9CE39B2ABD";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors17";
	rename -uid "59B5629A-4FFA-3922-C146-BFBD427DD99B";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage43";
	rename -uid "3C7005F4-4633-3F77-8E87-E8BEFA6882C1";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors18";
	rename -uid "3E411DAC-4608-DE2E-D04C-B5A289276593";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors19";
	rename -uid "CDABF95A-4644-7972-AB6D-4CAA592328AC";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage44";
	rename -uid "4F6C2B56-4941-D7C2-343F-EB9A308D741B";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors20";
	rename -uid "9A9210BB-41BB-3466-1DD9-4AB73BA098A5";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors21";
	rename -uid "B394CEC4-4C86-9A6C-D905-F5AC37DECA35";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage45";
	rename -uid "D2BFC6F0-41FA-18ED-1698-17A1C4103475";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors22";
	rename -uid "542DFB81-4D8B-FB35-81BC-0BA5F59D2041";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors23";
	rename -uid "A1AEB7B7-47AB-BF1C-B824-BA89E1792B98";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage46";
	rename -uid "C71D9A6D-445A-19DD-F5AB-D1901F8D0B5C";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors24";
	rename -uid "DC76607B-45E2-2ACE-740A-818D77396864";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors25";
	rename -uid "EBDA0F26-4D14-93C5-43DA-4FB01BF53C2C";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage47";
	rename -uid "6EB25703-4985-64EE-095D-1490E4BFE7ED";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors26";
	rename -uid "B1C619BD-406D-4364-444C-0D91BA927EC4";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors27";
	rename -uid "646DEEE7-4A3C-4039-1E06-32BB0E575F34";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode plusMinusAverage -n "plusMinusAverage48";
	rename -uid "3C7F15CD-4106-2ABC-DB44-69BE212CA1F5";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "size_multiplyDivide1";
	rename -uid "B1BFABE3-4CFF-24CA-F7E0-DD905084B899";
createNode plusMinusAverage -n "plusMinusAverage50";
	rename -uid "39378ECD-46C4-A96B-A206-579B7AC3AA21";
	setAttr ".op" 3;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "plusMinusAverage51";
	rename -uid "41A09A48-46FD-F690-F15A-48A562C3D165";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "plusMinusAverage52";
	rename -uid "A6926EBB-43EF-B2F4-CC07-DA9322573509";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multiplyDivide -n "multiplyDivide41";
	rename -uid "869DC424-4E62-08EA-982E-E98D85F77D39";
	setAttr ".i2" -type "float3" -1 1 1 ;
createNode groupId -n "in_cluster4GroupId";
	rename -uid "5F5236E1-42BD-74F0-9F7E-BFB7E66A662C";
	setAttr ".ihi" 0;
createNode objectSet -n "in_cluster4Set";
	rename -uid "1DD30CAC-42FD-8A91-B992-46AB7C09BCE8";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "in_mainPoser_clusterHandleCluster";
	rename -uid "46ACD0C2-4323-4D66-8DEF-3E98F58A5D64";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "in_cluster4GroupParts";
	rename -uid "02F177C0-4294-538D-527A-E28540A36756";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "in_tweak24";
	rename -uid "61591C97-47E3-0E95-5107-F3A6B60B5E31";
createNode objectSet -n "in_tweakSet24";
	rename -uid "4E786A82-4FBA-BA3B-CCE3-D4AF564143FF";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "in_groupId42";
	rename -uid "3A7DEBCA-4B2B-814A-7157-1598321A94C4";
	setAttr ".ihi" 0;
createNode groupParts -n "in_groupParts42";
	rename -uid "487A8D31-48B4-DAD8-6715-5897A6220439";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "in_mainPoser_size_multiplyDivide";
	rename -uid "77318742-462D-3D6C-B163-6183C9282EA2";
createNode makeNurbSphere -n "local_1_makeNurbSphere";
	rename -uid "753ADCCE-4EF8-0B6D-6307-E1A146A1C8B2";
createNode multDoubleLinear -n "local_1_size_multDoubleLinear";
	rename -uid "120F4A25-4768-FCC5-A5E2-A7B3412E6CA5";
createNode makeNurbSphere -n "local_2_makeNurbSphere";
	rename -uid "B9687B15-468B-A3A1-3BA9-BEBD3FEE7CB3";
createNode multDoubleLinear -n "local_2_size_multDoubleLinear";
	rename -uid "27F4C9C9-41E4-0EC1-8C8C-CFB751398AC7";
createNode groupId -n "mid_cluster4GroupId";
	rename -uid "9EF22582-49F4-34AA-0DB8-0A9DB39DA8EC";
	setAttr ".ihi" 0;
createNode objectSet -n "mid_cluster4Set";
	rename -uid "89175855-43EA-3AA7-FC6B-319EC9BA8BA0";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "mid_mainPoser_clusterHandleCluster";
	rename -uid "2A2A6C5D-4F5A-A171-47EC-75A94D416C92";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "mid_cluster4GroupParts";
	rename -uid "72EB5306-421B-B430-C1DC-3A91DB5DBBEA";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "mid_tweak24";
	rename -uid "F2708B83-47D6-EE41-A608-659BDD9024A5";
createNode objectSet -n "mid_tweakSet24";
	rename -uid "D2A1C846-4FC2-851B-D952-35BEAA5EFAE0";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "mid_groupId42";
	rename -uid "4A674388-46E5-4A8C-39A6-9B88C96BA1C8";
	setAttr ".ihi" 0;
createNode groupParts -n "mid_groupParts42";
	rename -uid "5437AE35-4246-8A83-01AB-30840247E01A";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "mid_mainPoser_size_multiplyDivide";
	rename -uid "9DAE89DC-4AC9-597A-7AB4-1792C40BEB7B";
createNode makeNurbSphere -n "local_3_makeNurbSphere";
	rename -uid "A4FFC76C-4E75-18C0-A230-3393BC75B339";
createNode multDoubleLinear -n "local_3_size_multDoubleLinear";
	rename -uid "0632A67C-44C8-2DB4-BFCD-72AEFC802AEB";
createNode makeNurbSphere -n "local_4_makeNurbSphere";
	rename -uid "96E1A675-469C-E33C-106B-C6B35EF81C3A";
createNode multDoubleLinear -n "local_4_size_multDoubleLinear";
	rename -uid "4AECB056-4FB1-36A1-EB69-1BB35D9A0863";
createNode makeNurbSphere -n "makeNurbSphere";
	rename -uid "6F0AFE32-49C2-5870-2EB7-E6BDECAF7D76";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode groupId -n "out_cluster4GroupId";
	rename -uid "0D0D8C15-48EA-1DD9-4174-C08864AD8161";
	setAttr ".ihi" 0;
createNode objectSet -n "out_cluster4Set";
	rename -uid "CBF608DA-4E76-454C-7B8C-868D5BFC877C";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "out_mainPoser_clusterHandleCluster";
	rename -uid "ABEB58AD-4856-EE7C-4164-7A9154340BBB";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "out_cluster4GroupParts";
	rename -uid "1ECEF767-423F-5BC3-0172-8EAE55DC75A6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "out_tweak24";
	rename -uid "EEAD2CB5-4159-E09F-E24F-8BA18043B819";
createNode objectSet -n "out_tweakSet24";
	rename -uid "DAFE566A-4041-BD31-14B2-02B14E417505";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "out_groupId42";
	rename -uid "9AFEB3D9-4843-E3D3-E3A5-64BC2D90F302";
	setAttr ".ihi" 0;
createNode groupParts -n "out_groupParts42";
	rename -uid "0A750A5E-4897-CDDD-F91A-3B8A07488AAD";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "out_mainPoser_size_multiplyDivide";
	rename -uid "ED75E2ED-4223-B937-D3E1-EE803D244848";
createNode makeNurbSphere -n "local_5_makeNurbSphere";
	rename -uid "3E19EAD4-4ACA-72B0-37D2-B094E128DAB4";
createNode multDoubleLinear -n "local_5_size_multDoubleLinear";
	rename -uid "C8036C40-460A-FB79-38B9-3D82E287C557";
createNode makeNurbSphere -n "local_6_makeNurbSphere";
	rename -uid "D5DCEC81-4576-B9C2-3A43-BEB7D4086A38";
createNode multDoubleLinear -n "local_6_size_multDoubleLinear";
	rename -uid "78D4421F-40D5-CE23-A733-F4BAB5A29282";
createNode makeNurbSphere -n "local_7_makeNurbSphere";
	rename -uid "A3644FA9-4D5B-6641-2565-19A29E4D28FC";
createNode multDoubleLinear -n "local_7_size_multDoubleLinear";
	rename -uid "7B1D59A6-4AC5-AF78-CF38-93BFBDF3DBEE";
createNode makeNurbSphere -n "center_makeNurbSphere";
	rename -uid "A8414828-4283-44AC-49EA-F9ACDB97AA41";
createNode multDoubleLinear -n "center_size_multDoubleLinear";
	rename -uid "3E0A1DE0-4C01-5FA5-BF89-FF956A685CAC";
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "6049D528-4EAB-CAA5-C1E7-309A56AC4CF1";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr ".scaleProfileX" 0.051813472062349319;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationMode" 1;
	setAttr ".interpolationPrecision" 86.082473754882812;
	setAttr ".interpolationSteps" 50;
	setAttr ".interpolationDistance" 3;
	setAttr -s 2 ".inCurveArray";
createNode blinn -n "blinn1";
	rename -uid "1FC82F88-4DBA-CDA6-EA25-9B8D4ADD7881";
createNode shadingEngine -n "blinn1SG";
	rename -uid "D78519D0-4F72-846B-0443-DFA2BFE18F8B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo49";
	rename -uid "48880EA3-46C5-D8EA-6496-7E972EA170FA";
createNode makeNurbSphere -n "local_8_makeNurbSphere";
	rename -uid "F6403E2A-4209-3256-E644-5B8DBBECDB29";
createNode multDoubleLinear -n "local_8_size_multDoubleLinear";
	rename -uid "C02EAD14-4304-3402-E73F-5387513ADFDA";
createNode multMatrix -n "multMatrix55";
	rename -uid "5101B940-4219-A2D4-A282-738E76EAD961";
	setAttr -s 2 ".i";
createNode groupId -n "full_cluster4GroupId";
	rename -uid "D2DAF389-4D19-9D08-061A-99A9A2E818F1";
	setAttr ".ihi" 0;
createNode objectSet -n "full_cluster4Set";
	rename -uid "BF00429A-443E-C43D-8F3A-F8863E22E10D";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "full_mainPoser_clusterHandleCluster";
	rename -uid "388C739F-4C1F-BA0C-5488-FCA06E1C430C";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "full_cluster4GroupParts";
	rename -uid "EB167EB5-4697-9941-6224-FD85B9E14642";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "full_tweak24";
	rename -uid "F1E15429-45A7-B2AE-D352-BA8A456A0AE6";
createNode objectSet -n "full_tweakSet24";
	rename -uid "0A9558D4-4114-C6DD-2784-CB95C594BE93";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "full_groupId42";
	rename -uid "CACF6A23-4C33-F511-3812-EEA043021798";
	setAttr ".ihi" 0;
createNode groupParts -n "full_groupParts42";
	rename -uid "6D2D79DB-4EB6-B9F7-9ED6-229F74EEB97D";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "full_mainPoser_size_multiplyDivide";
	rename -uid "535C0F71-479C-4290-7CD6-AEA9BFFF6E5C";
createNode multMatrix -n "multMatrix56";
	rename -uid "0F54D458-4E54-A6AB-F185-ADA41BD239F9";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix57";
	rename -uid "50051407-4145-CF27-BDA9-43BD1C011990";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix58";
	rename -uid "AB624183-4461-BBA7-729E-9A99B8199A34";
	setAttr -s 2 ".i";
createNode objectSet -n "l_local_moduleControlSet";
	rename -uid "E2D9F2D3-4972-8871-3D2C-B2A86976143A";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "r_local_moduleControlSet";
	rename -uid "D20667B8-43DE-A946-71B2-CEA0842C5EBC";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "l_main_moduleControlSet";
	rename -uid "EB2B6425-48A2-F7ED-92AC-51850660C52A";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "r_main_moduleControlSet";
	rename -uid "161F23E2-4E77-E9B9-9539-0B8D7DB37BE4";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "l_moduleControlSet";
	rename -uid "78C327B0-41E1-B4F6-C2AA-299EC8FFC133";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode objectSet -n "r_moduleControlSet";
	rename -uid "5AF20867-4597-2A55-F50E-1482051175C7";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
createNode multMatrix -n "multMatrix59";
	rename -uid "99F98075-4B19-492F-8E39-BCAA90E0AC6D";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix60";
	rename -uid "ADB39F7C-427F-9FD0-5730-47B6593B722F";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "multDoubleLinear42";
	rename -uid "14E9D170-416D-9EE6-59CA-01A334983125";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion86";
	rename -uid "2FF18AC9-4D52-593A-330B-709996707090";
	setAttr ".cf" -1;
createNode multMatrix -n "multMatrix61";
	rename -uid "CDFB2951-4727-0C3C-BD0F-C68E6E41856A";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix62";
	rename -uid "2736DA92-4AE9-F023-E9F3-1AA2715151BD";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "multDoubleLinear63";
	rename -uid "8E346623-4E01-5CDE-58BD-16931672D8F6";
	setAttr ".i2" -1;
createNode multMatrix -n "multMatrix63";
	rename -uid "F98702D8-4632-FF53-E4CD-D5806A18A1D7";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix64";
	rename -uid "B4F671BC-4DF5-1D1C-E694-828300F89AE5";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix65";
	rename -uid "020643E2-4A7E-FCEC-2F80-B5B4F2F59489";
	setAttr -s 2 ".i";
createNode multDoubleLinear -n "multDoubleLinear64";
	rename -uid "D4DAE834-48C5-E8E7-E039-03BF09355FBA";
	setAttr ".i2" -0.25;
createNode multDoubleLinear -n "multDoubleLinear65";
	rename -uid "83FAF35F-426A-7BE1-7FF4-41853AAC47F4";
	setAttr ".i2" -0.25;
createNode unitConversion -n "unitConversion87";
	rename -uid "41BCC7E4-4BBB-23E4-3A87-4099071BB3B3";
createNode plusMinusAverage -n "plusMinusAverage53";
	rename -uid "362E64B2-4A68-CAFA-CB0B-C0B1F846972C";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode plusMinusAverage -n "plusMinusAverage54";
	rename -uid "74B970F0-4B96-259C-7914-0C89A2CAFFFB";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode addDoubleLinear -n "addDoubleLinear48";
	rename -uid "2656F217-48CF-002E-74F6-C6B36FF9F376";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear49";
	rename -uid "2A967FC5-4E5E-8D22-CD5F-928710B8638E";
	setAttr ".ihi" 2;
createNode addDoubleLinear -n "addDoubleLinear51";
	rename -uid "33207690-43B1-03F0-6A8C-14AEABC14463";
	setAttr ".ihi" 2;
createNode plusMinusAverage -n "plusMinusAverage55";
	rename -uid "2D613EAB-4452-02D4-B342-01BD8527A7EF";
	setAttr -s 4 ".i1[3]"  0;
	setAttr -s 3 ".i1";
createNode plusMinusAverage -n "plusMinusAverage56";
	rename -uid "10B9D53C-4EC9-E950-3DB0-DD8F145C9E15";
	setAttr -s 4 ".i1";
	setAttr -s 4 ".i1";
createNode multDoubleLinear -n "multDoubleLinear67";
	rename -uid "2E443F92-4F8A-113C-12F4-5682926490F0";
	setAttr ".i2" 0.25;
createNode multDoubleLinear -n "multDoubleLinear68";
	rename -uid "11F16236-482E-7B18-9492-9CA54BB8A715";
createNode unitConversion -n "unitConversion88";
	rename -uid "CB869634-41D6-A160-49F9-5699700C1CD0";
	setAttr ".cf" -1;
createNode multDoubleLinear -n "multDoubleLinear69";
	rename -uid "5B1DBB5B-449F-9D42-F45B-A98F87C62186";
createNode multDoubleLinear -n "multDoubleLinear70";
	rename -uid "DF7BE349-4D83-10DA-F4FF-2690EC0B5BD4";
createNode multDoubleLinear -n "multDoubleLinear71";
	rename -uid "891D9358-4B55-9206-0FDC-288CE50F7DB9";
createNode multDoubleLinear -n "multDoubleLinear72";
	rename -uid "C1859E9C-4ECC-911E-F00A-3DBF37CA39EE";
	setAttr ".i2" 0.25;
createNode unitConversion -n "unitConversion89";
	rename -uid "C1B2A0C7-4845-1B35-F799-7A82D20BFB95";
createNode multDoubleLinear -n "multDoubleLinear73";
	rename -uid "576EC74C-44E8-9B0D-B400-B592E87FD0FE";
	setAttr ".i2" 0.5;
createNode multDoubleLinear -n "multDoubleLinear74";
	rename -uid "AD56F5A5-4079-0A94-5579-1AB74AE7EF98";
createNode multDoubleLinear -n "multDoubleLinear75";
	rename -uid "C21E50D9-4E45-2823-7B7A-F59CFFD84A85";
createNode multDoubleLinear -n "multDoubleLinear76";
	rename -uid "90DF82BA-4093-1050-F708-D8B7102B609A";
	setAttr ".i2" 0.5;
createNode plusMinusAverage -n "plusMinusAverage57";
	rename -uid "9F926821-46BC-5F70-0908-34B0F8E100F1";
	setAttr -s 4 ".i1[3]"  0;
	setAttr -s 3 ".i1";
createNode plusMinusAverage -n "plusMinusAverage58";
	rename -uid "14EAC57A-46FD-E6EF-8BF6-FFAA3808A492";
	setAttr -s 3 ".i1";
	setAttr -s 3 ".i1";
createNode unitConversion -n "unitConversion90";
	rename -uid "0B59699E-4A6C-009A-152F-9EBB71EB8D7D";
	setAttr ".cf" -1;
createNode multDoubleLinear -n "multDoubleLinear77";
	rename -uid "6AC2ED90-40FC-E8CD-85C9-CBAF35FA1087";
createNode multDoubleLinear -n "multDoubleLinear78";
	rename -uid "0A90B8A9-4050-1A4D-45DD-DE88BADA35B2";
createNode multDoubleLinear -n "multDoubleLinear79";
	rename -uid "3625CF06-4547-FB82-9609-0E957B08F723";
createNode multDoubleLinear -n "multDoubleLinear80";
	rename -uid "E41AEC27-4FD2-5379-5F03-458E74682A09";
createNode unitConversion -n "unitConversion91";
	rename -uid "B06B37C2-478F-B8D4-81E1-D2A88F647407";
createNode multDoubleLinear -n "multDoubleLinear81";
	rename -uid "CA485587-4B30-E948-4093-41929C04CDAF";
	setAttr ".i2" 0.5;
createNode multDoubleLinear -n "multDoubleLinear82";
	rename -uid "637D57F5-409B-0A0B-8E06-B896362AE9BD";
createNode clamp -n "clamp18";
	rename -uid "260C83AE-41CE-9AEF-F74A-6EBB5B00B61D";
	setAttr ".mx" -type "float3" 10 0 0 ;
createNode multDoubleLinear -n "multDoubleLinear83";
	rename -uid "CC9E1654-477D-8A18-9E4B-799A284BE5D1";
	setAttr ".i2" -1;
createNode multDoubleLinear -n "multDoubleLinear84";
	rename -uid "5F2D158A-4B56-00BA-E4FF-1BA57AA091D9";
	setAttr ".i2" -1;
createNode multMatrix -n "multMatrix66";
	rename -uid "F3DA42B1-4D64-6EAC-D5D1-D8AAEC488872";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix67";
	rename -uid "3D9511AB-4536-F12C-1153-2EB9D8691591";
	setAttr -s 2 ".i";
createNode composeMatrix -n "composeMatrix5";
	rename -uid "1203B723-4498-CEBD-5B6B-8390CE2A4467";
	setAttr ".is" -type "double3" -1 1 1 ;
createNode multiplyDivide -n "multiplyDivide42";
	rename -uid "D4B154AA-4209-D2AB-6C9C-399590BFD09F";
createNode addDoubleLinear -n "addDoubleLinear8";
	rename -uid "1C4ED870-4008-FE5D-9806-7682943147B5";
	setAttr ".ihi" 2;
createNode unitConversion -n "unitConversion54";
	rename -uid "8AECF7C0-4B1C-E906-FCA1-BA851370F83D";
	setAttr ".cf" -1;
createNode multDoubleLinear -n "multDoubleLinear12";
	rename -uid "2250C787-460A-61EF-D6B9-B79222FF03E5";
createNode multDoubleLinear -n "multDoubleLinear11";
	rename -uid "06788486-4B2C-16E7-916D-449D4C010361";
createNode unitConversion -n "unitConversion57";
	rename -uid "5FE72649-4A14-4385-9531-B099159720B9";
	setAttr ".cf" -0.5;
createNode multDoubleLinear -n "multDoubleLinear21";
	rename -uid "2166CEB6-464C-8682-029E-54A98FD29219";
	setAttr ".i2" 0.5;
createNode multDoubleLinear -n "multDoubleLinear20";
	rename -uid "0C79B5D1-4B94-5A8F-1646-C5BA872D210D";
createNode unitConversion -n "unitConversion58";
	rename -uid "47FCC8DF-460E-0890-A5C9-D09DE3DD41FB";
createNode plusMinusAverage -n "plusMinusAverage28";
	rename -uid "CEBA28C4-4AA6-A612-48E9-AF88A4441C6E";
	setAttr -s 4 ".i1[3]"  0;
	setAttr -s 3 ".i1";
createNode multDoubleLinear -n "multDoubleLinear2";
	rename -uid "C709053F-4BC2-E6A3-C054-D9855AFE613B";
createNode addDoubleLinear -n "addDoubleLinear2";
	rename -uid "4732AA98-4223-721D-9C6B-7ABAB99BBE23";
	setAttr ".ihi" 2;
	setAttr ".i1" 0.25;
createNode multDoubleLinear -n "multDoubleLinear5";
	rename -uid "EC988A1B-4F1A-A636-428C-769B166B6012";
	setAttr ".i2" -1;
createNode multDoubleLinear -n "multDoubleLinear9";
	rename -uid "73CF2B8B-44A0-22C4-EDB3-A9B9FF14C044";
createNode multDoubleLinear -n "multDoubleLinear15";
	rename -uid "61963180-4E14-D97C-5B32-0A9A322FBA21";
createNode plusMinusAverage -n "plusMinusAverage38";
	rename -uid "E9D84FAB-4BAE-23A8-F2FA-09A543B0C3C6";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors6";
	rename -uid "DB7180D6-4853-2BF0-5BCD-00A570D5A0F2";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors7";
	rename -uid "4A034282-4212-11D3-85A7-678BCF1A1D7B";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode multDoubleLinear -n "multDoubleLinear7";
	rename -uid "E8244693-4437-99AC-8F91-A19468366FE1";
createNode plusMinusAverage -n "plusMinusAverage30";
	rename -uid "8B2FA21F-47B8-46AE-F0C0-9F8F605613CE";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode blendColors -n "blendColors1";
	rename -uid "D9C9C377-4424-6F3C-9960-B984693C61BE";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode blendColors -n "blendColors2";
	rename -uid "7591854E-4A99-D152-6AC4-1CA1E3618BBB";
	setAttr ".c2" -type "float3" 0 0 0 ;
createNode remapValue -n "remapValue1";
	rename -uid "E4201E31-4160-031C-389F-92B219A74F71";
	setAttr ".imn" -1;
	setAttr ".omx" -1;
	setAttr -s 3 ".vl[0:2]"  0 1 3 1 1 1 0.49671772 0 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "remapValue2";
	rename -uid "2732A5E2-428D-3424-C61F-7F959B689342";
	setAttr ".imn" -1;
	setAttr ".omx" -1;
	setAttr -s 3 ".vl[0:2]"  0 1 3 1 1 1 0.49671772 0 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "remapValue3";
	rename -uid "B14D9A45-48B1-700F-40F2-B3BDD38C47BE";
	setAttr ".imn" -1;
	setAttr -s 3 ".vl[0:2]"  0 1 3 1 1 1 0.49671772 0 3;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode objectSet -n "skinJointsSet";
	rename -uid "2EAF73D2-4150-ADEA-CB79-24B8399E98E5";
	setAttr ".ihi" 0;
createNode multMatrix -n "multMatrix68";
	rename -uid "C70498D3-40B3-03BA-9E34-ADA4AC72CE0C";
	setAttr -s 2 ".i";
createNode multMatrix -n "multMatrix69";
	rename -uid "34C995EA-408B-AA4C-6832-DFAE50D9C6DB";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "decomposeMatrix1";
	rename -uid "6628195E-418D-02C1-2745-6DBED91F1B7D";
createNode setRange -n "setRange16";
	rename -uid "1B3899D5-4124-B1FE-DA26-FB94AA47DCAC";
	setAttr ".m" -type "float3" 1 1 1 ;
createNode plusMinusAverage -n "plusMinusAverage59";
	rename -uid "C3845223-4506-27C4-9C05-DFA26BB0F7D1";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "setRange17";
	rename -uid "6DFB983F-4905-F7ED-8CF0-C0AEB23D1B1B";
	setAttr ".n" -type "float3" 1 1 1 ;
createNode setRange -n "setRange18";
	rename -uid "8F0ACC2F-4F56-B30F-0140-D7A3948A80B1";
	setAttr ".m" -type "float3" 1 1 1 ;
createNode plusMinusAverage -n "plusMinusAverage60";
	rename -uid "18953D40-45B7-B7B0-230C-D59B6AF83904";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "setRange19";
	rename -uid "BCFEAF44-4AF5-F15E-9055-EAA301330EF9";
	setAttr ".n" -type "float3" 1 1 1 ;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "7EECCBB9-4567-596C-66C6-6C92ED3BE6F0";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -6652.9763518581358 -655.35723212219318 ;
	setAttr ".tgi[0].vh" -type "double2" 7061.3096689657596 3058.9285651842783 ;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -7856.4099442245451 -3786.904611426693 ;
	setAttr ".tgi[1].vh" -type "double2" -1724.5420560149523 -2126.190391703261 ;
	setAttr -s 6 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -4516.869140625;
	setAttr ".tgi[1].ni[0].y" -2611.53515625;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" -4860.162109375;
	setAttr ".tgi[1].ni[1].y" -2901.93603515625;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" -5740.50146484375;
	setAttr ".tgi[1].ni[2].y" -2830.6240234375;
	setAttr ".tgi[1].ni[2].nvs" 18305;
	setAttr ".tgi[1].ni[3].x" -5195.109375;
	setAttr ".tgi[1].ni[3].y" -2605.524658203125;
	setAttr ".tgi[1].ni[3].nvs" 18305;
	setAttr ".tgi[1].ni[4].x" -4885.71435546875;
	setAttr ".tgi[1].ni[4].y" -3392.857177734375;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" -5491.64111328125;
	setAttr ".tgi[1].ni[5].y" -2499.787109375;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -25769.882802208587 -804.70142028168152 ;
	setAttr ".tgi[2].vh" -type "double2" -24425.562100055187 1349.2803895777986 ;
	setAttr -s 162 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" -24422.857421875;
	setAttr ".tgi[2].ni[0].y" 328.57144165039062;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" -24115.71484375;
	setAttr ".tgi[2].ni[1].y" 388.57144165039062;
	setAttr ".tgi[2].ni[1].nvs" 18304;
	setAttr ".tgi[2].ni[2].x" -24115.71484375;
	setAttr ".tgi[2].ni[2].y" 84.285713195800781;
	setAttr ".tgi[2].ni[2].nvs" 18304;
	setAttr ".tgi[2].ni[3].x" -24115.71484375;
	setAttr ".tgi[2].ni[3].y" -17.142856597900391;
	setAttr ".tgi[2].ni[3].nvs" 18304;
	setAttr ".tgi[2].ni[4].x" -24422.857421875;
	setAttr ".tgi[2].ni[4].y" -724.28570556640625;
	setAttr ".tgi[2].ni[4].nvs" 18304;
	setAttr ".tgi[2].ni[5].x" -24422.857421875;
	setAttr ".tgi[2].ni[5].y" -305.71429443359375;
	setAttr ".tgi[2].ni[5].nvs" 18304;
	setAttr ".tgi[2].ni[6].x" -24730;
	setAttr ".tgi[2].ni[6].y" 1132.857177734375;
	setAttr ".tgi[2].ni[6].nvs" 18304;
	setAttr ".tgi[2].ni[7].x" -25651.427734375;
	setAttr ".tgi[2].ni[7].y" 1732.857177734375;
	setAttr ".tgi[2].ni[7].nvs" 18304;
	setAttr ".tgi[2].ni[8].x" -25344.28515625;
	setAttr ".tgi[2].ni[8].y" 1571.4285888671875;
	setAttr ".tgi[2].ni[8].nvs" 18304;
	setAttr ".tgi[2].ni[9].x" -24115.71484375;
	setAttr ".tgi[2].ni[9].y" 3618.571533203125;
	setAttr ".tgi[2].ni[9].nvs" 18304;
	setAttr ".tgi[2].ni[10].x" -24422.857421875;
	setAttr ".tgi[2].ni[10].y" 112.85713958740234;
	setAttr ".tgi[2].ni[10].nvs" 18304;
	setAttr ".tgi[2].ni[11].x" -24115.71484375;
	setAttr ".tgi[2].ni[11].y" 3415.71435546875;
	setAttr ".tgi[2].ni[11].nvs" 18304;
	setAttr ".tgi[2].ni[12].x" -24115.71484375;
	setAttr ".tgi[2].ni[12].y" 3284.28564453125;
	setAttr ".tgi[2].ni[12].nvs" 18304;
	setAttr ".tgi[2].ni[13].x" -24730;
	setAttr ".tgi[2].ni[13].y" 3465.71435546875;
	setAttr ".tgi[2].ni[13].nvs" 18304;
	setAttr ".tgi[2].ni[14].x" -24115.71484375;
	setAttr ".tgi[2].ni[14].y" 3182.857177734375;
	setAttr ".tgi[2].ni[14].nvs" 18304;
	setAttr ".tgi[2].ni[15].x" -24422.857421875;
	setAttr ".tgi[2].ni[15].y" 658.5714111328125;
	setAttr ".tgi[2].ni[15].nvs" 18304;
	setAttr ".tgi[2].ni[16].x" -25037.142578125;
	setAttr ".tgi[2].ni[16].y" 2450;
	setAttr ".tgi[2].ni[16].nvs" 18304;
	setAttr ".tgi[2].ni[17].x" -24730;
	setAttr ".tgi[2].ni[17].y" 2248.571533203125;
	setAttr ".tgi[2].ni[17].nvs" 18304;
	setAttr ".tgi[2].ni[18].x" -25037.142578125;
	setAttr ".tgi[2].ni[18].y" 2247.142822265625;
	setAttr ".tgi[2].ni[18].nvs" 18304;
	setAttr ".tgi[2].ni[19].x" -24422.857421875;
	setAttr ".tgi[2].ni[19].y" -825.71429443359375;
	setAttr ".tgi[2].ni[19].nvs" 18304;
	setAttr ".tgi[2].ni[20].x" -24422.857421875;
	setAttr ".tgi[2].ni[20].y" 1091.4285888671875;
	setAttr ".tgi[2].ni[20].nvs" 18304;
	setAttr ".tgi[2].ni[21].x" -24115.71484375;
	setAttr ".tgi[2].ni[21].y" 3081.428466796875;
	setAttr ".tgi[2].ni[21].nvs" 18304;
	setAttr ".tgi[2].ni[22].x" -24730;
	setAttr ".tgi[2].ni[22].y" 1335.7142333984375;
	setAttr ".tgi[2].ni[22].nvs" 18304;
	setAttr ".tgi[2].ni[23].x" -24115.71484375;
	setAttr ".tgi[2].ni[23].y" 2980;
	setAttr ".tgi[2].ni[23].nvs" 18304;
	setAttr ".tgi[2].ni[24].x" -24115.71484375;
	setAttr ".tgi[2].ni[24].y" 2807.142822265625;
	setAttr ".tgi[2].ni[24].nvs" 18304;
	setAttr ".tgi[2].ni[25].x" -24115.71484375;
	setAttr ".tgi[2].ni[25].y" 2705.71435546875;
	setAttr ".tgi[2].ni[25].nvs" 18304;
	setAttr ".tgi[2].ni[26].x" -24422.857421875;
	setAttr ".tgi[2].ni[26].y" -1557.142822265625;
	setAttr ".tgi[2].ni[26].nvs" 18304;
	setAttr ".tgi[2].ni[27].x" -24422.857421875;
	setAttr ".tgi[2].ni[27].y" 1380;
	setAttr ".tgi[2].ni[27].nvs" 18304;
	setAttr ".tgi[2].ni[28].x" -25344.28515625;
	setAttr ".tgi[2].ni[28].y" 2382.857177734375;
	setAttr ".tgi[2].ni[28].nvs" 18304;
	setAttr ".tgi[2].ni[29].x" -24730;
	setAttr ".tgi[2].ni[29].y" -1657.142822265625;
	setAttr ".tgi[2].ni[29].nvs" 18304;
	setAttr ".tgi[2].ni[30].x" -24115.71484375;
	setAttr ".tgi[2].ni[30].y" 2604.28564453125;
	setAttr ".tgi[2].ni[30].nvs" 18304;
	setAttr ".tgi[2].ni[31].x" -24730;
	setAttr ".tgi[2].ni[31].y" -224.28572082519531;
	setAttr ".tgi[2].ni[31].nvs" 18304;
	setAttr ".tgi[2].ni[32].x" -24730;
	setAttr ".tgi[2].ni[32].y" 727.14288330078125;
	setAttr ".tgi[2].ni[32].nvs" 18304;
	setAttr ".tgi[2].ni[33].x" -24115.71484375;
	setAttr ".tgi[2].ni[33].y" 2370;
	setAttr ".tgi[2].ni[33].nvs" 18304;
	setAttr ".tgi[2].ni[34].x" -24115.71484375;
	setAttr ".tgi[2].ni[34].y" 2268.571533203125;
	setAttr ".tgi[2].ni[34].nvs" 18304;
	setAttr ".tgi[2].ni[35].x" -24115.71484375;
	setAttr ".tgi[2].ni[35].y" 2167.142822265625;
	setAttr ".tgi[2].ni[35].nvs" 18304;
	setAttr ".tgi[2].ni[36].x" -24730;
	setAttr ".tgi[2].ni[36].y" -1555.7142333984375;
	setAttr ".tgi[2].ni[36].nvs" 18304;
	setAttr ".tgi[2].ni[37].x" -24115.71484375;
	setAttr ".tgi[2].ni[37].y" 2065.71435546875;
	setAttr ".tgi[2].ni[37].nvs" 18304;
	setAttr ".tgi[2].ni[38].x" -25037.142578125;
	setAttr ".tgi[2].ni[38].y" 285.71429443359375;
	setAttr ".tgi[2].ni[38].nvs" 18304;
	setAttr ".tgi[2].ni[39].x" -24115.71484375;
	setAttr ".tgi[2].ni[39].y" 1964.2857666015625;
	setAttr ".tgi[2].ni[39].nvs" 18304;
	setAttr ".tgi[2].ni[40].x" -24730;
	setAttr ".tgi[2].ni[40].y" 1944.2857666015625;
	setAttr ".tgi[2].ni[40].nvs" 18304;
	setAttr ".tgi[2].ni[41].x" -24115.71484375;
	setAttr ".tgi[2].ni[41].y" 1862.857177734375;
	setAttr ".tgi[2].ni[41].nvs" 18304;
	setAttr ".tgi[2].ni[42].x" -24730;
	setAttr ".tgi[2].ni[42].y" -1194.2857666015625;
	setAttr ".tgi[2].ni[42].nvs" 18304;
	setAttr ".tgi[2].ni[43].x" -24115.71484375;
	setAttr ".tgi[2].ni[43].y" 1761.4285888671875;
	setAttr ".tgi[2].ni[43].nvs" 18304;
	setAttr ".tgi[2].ni[44].x" -24730;
	setAttr ".tgi[2].ni[44].y" 397.14285278320312;
	setAttr ".tgi[2].ni[44].nvs" 18304;
	setAttr ".tgi[2].ni[45].x" -24115.71484375;
	setAttr ".tgi[2].ni[45].y" 1660;
	setAttr ".tgi[2].ni[45].nvs" 18304;
	setAttr ".tgi[2].ni[46].x" -24730;
	setAttr ".tgi[2].ni[46].y" 2755.71435546875;
	setAttr ".tgi[2].ni[46].nvs" 18304;
	setAttr ".tgi[2].ni[47].x" -24115.71484375;
	setAttr ".tgi[2].ni[47].y" 1558.5714111328125;
	setAttr ".tgi[2].ni[47].nvs" 18304;
	setAttr ".tgi[2].ni[48].x" -25037.142578125;
	setAttr ".tgi[2].ni[48].y" 2145.71435546875;
	setAttr ".tgi[2].ni[48].nvs" 18304;
	setAttr ".tgi[2].ni[49].x" -24115.71484375;
	setAttr ".tgi[2].ni[49].y" 1200;
	setAttr ".tgi[2].ni[49].nvs" 18304;
	setAttr ".tgi[2].ni[50].x" -24422.857421875;
	setAttr ".tgi[2].ni[50].y" -2062.857177734375;
	setAttr ".tgi[2].ni[50].nvs" 18304;
	setAttr ".tgi[2].ni[51].x" -24422.857421875;
	setAttr ".tgi[2].ni[51].y" 3618.571533203125;
	setAttr ".tgi[2].ni[51].nvs" 18304;
	setAttr ".tgi[2].ni[52].x" -24422.857421875;
	setAttr ".tgi[2].ni[52].y" -927.14288330078125;
	setAttr ".tgi[2].ni[52].nvs" 18304;
	setAttr ".tgi[2].ni[53].x" -24115.71484375;
	setAttr ".tgi[2].ni[53].y" 1098.5714111328125;
	setAttr ".tgi[2].ni[53].nvs" 18304;
	setAttr ".tgi[2].ni[54].x" -25037.142578125;
	setAttr ".tgi[2].ni[54].y" 1415.7142333984375;
	setAttr ".tgi[2].ni[54].nvs" 18304;
	setAttr ".tgi[2].ni[55].x" -24730;
	setAttr ".tgi[2].ni[55].y" -585.71429443359375;
	setAttr ".tgi[2].ni[55].nvs" 18304;
	setAttr ".tgi[2].ni[56].x" -24115.71484375;
	setAttr ".tgi[2].ni[56].y" 997.14288330078125;
	setAttr ".tgi[2].ni[56].nvs" 18304;
	setAttr ".tgi[2].ni[57].x" -24422.857421875;
	setAttr ".tgi[2].ni[57].y" 2995.71435546875;
	setAttr ".tgi[2].ni[57].nvs" 18304;
	setAttr ".tgi[2].ni[58].x" -24115.71484375;
	setAttr ".tgi[2].ni[58].y" 895.71429443359375;
	setAttr ".tgi[2].ni[58].nvs" 18304;
	setAttr ".tgi[2].ni[59].x" -24730;
	setAttr ".tgi[2].ni[59].y" 80;
	setAttr ".tgi[2].ni[59].nvs" 18304;
	setAttr ".tgi[2].ni[60].x" -24730;
	setAttr ".tgi[2].ni[60].y" 828.5714111328125;
	setAttr ".tgi[2].ni[60].nvs" 18304;
	setAttr ".tgi[2].ni[61].x" -24115.71484375;
	setAttr ".tgi[2].ni[61].y" 794.28570556640625;
	setAttr ".tgi[2].ni[61].nvs" 18304;
	setAttr ".tgi[2].ni[62].x" -24938.572265625;
	setAttr ".tgi[2].ni[62].y" -3312.857177734375;
	setAttr ".tgi[2].ni[62].nvs" 18304;
	setAttr ".tgi[2].ni[63].x" -24730;
	setAttr ".tgi[2].ni[63].y" 1437.142822265625;
	setAttr ".tgi[2].ni[63].nvs" 18304;
	setAttr ".tgi[2].ni[64].x" -24115.71484375;
	setAttr ".tgi[2].ni[64].y" 692.85711669921875;
	setAttr ".tgi[2].ni[64].nvs" 18304;
	setAttr ".tgi[2].ni[65].x" -24422.857421875;
	setAttr ".tgi[2].ni[65].y" 1998.5714111328125;
	setAttr ".tgi[2].ni[65].nvs" 18304;
	setAttr ".tgi[2].ni[66].x" -24730;
	setAttr ".tgi[2].ni[66].y" 2857.142822265625;
	setAttr ".tgi[2].ni[66].nvs" 18304;
	setAttr ".tgi[2].ni[67].x" -25344.28515625;
	setAttr ".tgi[2].ni[67].y" 2484.28564453125;
	setAttr ".tgi[2].ni[67].nvs" 18304;
	setAttr ".tgi[2].ni[68].x" -24730;
	setAttr ".tgi[2].ni[68].y" 1031.4285888671875;
	setAttr ".tgi[2].ni[68].nvs" 18304;
	setAttr ".tgi[2].ni[69].x" -24115.71484375;
	setAttr ".tgi[2].ni[69].y" 591.4285888671875;
	setAttr ".tgi[2].ni[69].nvs" 18304;
	setAttr ".tgi[2].ni[70].x" -26265.71484375;
	setAttr ".tgi[2].ni[70].y" 2337.142822265625;
	setAttr ".tgi[2].ni[70].nvs" 18305;
	setAttr ".tgi[2].ni[71].x" -24730;
	setAttr ".tgi[2].ni[71].y" -1397.142822265625;
	setAttr ".tgi[2].ni[71].nvs" 18304;
	setAttr ".tgi[2].ni[72].x" -25037.142578125;
	setAttr ".tgi[2].ni[72].y" 1998.5714111328125;
	setAttr ".tgi[2].ni[72].nvs" 18304;
	setAttr ".tgi[2].ni[73].x" -24730;
	setAttr ".tgi[2].ni[73].y" -122.85713958740234;
	setAttr ".tgi[2].ni[73].nvs" 18304;
	setAttr ".tgi[2].ni[74].x" -24730;
	setAttr ".tgi[2].ni[74].y" 2552.857177734375;
	setAttr ".tgi[2].ni[74].nvs" 18304;
	setAttr ".tgi[2].ni[75].x" -24730;
	setAttr ".tgi[2].ni[75].y" 3364.28564453125;
	setAttr ".tgi[2].ni[75].nvs" 18304;
	setAttr ".tgi[2].ni[76].x" -24730;
	setAttr ".tgi[2].ni[76].y" -890;
	setAttr ".tgi[2].ni[76].nvs" 18304;
	setAttr ".tgi[2].ni[77].x" -24422.857421875;
	setAttr ".tgi[2].ni[77].y" 3415.71435546875;
	setAttr ".tgi[2].ni[77].nvs" 18304;
	setAttr ".tgi[2].ni[78].x" -24115.71484375;
	setAttr ".tgi[2].ni[78].y" 490;
	setAttr ".tgi[2].ni[78].nvs" 18304;
	setAttr ".tgi[2].ni[79].x" -24730;
	setAttr ".tgi[2].ni[79].y" 1741.4285888671875;
	setAttr ".tgi[2].ni[79].nvs" 18304;
	setAttr ".tgi[2].ni[80].x" -24730;
	setAttr ".tgi[2].ni[80].y" 3161.428466796875;
	setAttr ".tgi[2].ni[80].nvs" 18304;
	setAttr ".tgi[2].ni[81].x" -24730;
	setAttr ".tgi[2].ni[81].y" 1842.857177734375;
	setAttr ".tgi[2].ni[81].nvs" 18304;
	setAttr ".tgi[2].ni[82].x" -24115.71484375;
	setAttr ".tgi[2].ni[82].y" 287.14285278320312;
	setAttr ".tgi[2].ni[82].nvs" 18304;
	setAttr ".tgi[2].ni[83].x" -24422.857421875;
	setAttr ".tgi[2].ni[83].y" 3264.28564453125;
	setAttr ".tgi[2].ni[83].nvs" 18304;
	setAttr ".tgi[2].ni[84].x" -25037.142578125;
	setAttr ".tgi[2].ni[84].y" 2348.571533203125;
	setAttr ".tgi[2].ni[84].nvs" 18304;
	setAttr ".tgi[2].ni[85].x" -24422.857421875;
	setAttr ".tgi[2].ni[85].y" 1655.7142333984375;
	setAttr ".tgi[2].ni[85].nvs" 18304;
	setAttr ".tgi[2].ni[86].x" -24115.71484375;
	setAttr ".tgi[2].ni[86].y" 185.71427917480469;
	setAttr ".tgi[2].ni[86].nvs" 18304;
	setAttr ".tgi[2].ni[87].x" -24422.857421875;
	setAttr ".tgi[2].ni[87].y" 3097.142822265625;
	setAttr ".tgi[2].ni[87].nvs" 18304;
	setAttr ".tgi[2].ni[88].x" -25651.427734375;
	setAttr ".tgi[2].ni[88].y" 1948.5714111328125;
	setAttr ".tgi[2].ni[88].nvs" 18304;
	setAttr ".tgi[2].ni[89].x" -24730;
	setAttr ".tgi[2].ni[89].y" -1092.857177734375;
	setAttr ".tgi[2].ni[89].nvs" 18304;
	setAttr ".tgi[2].ni[90].x" -24115.71484375;
	setAttr ".tgi[2].ni[90].y" -118.57142639160156;
	setAttr ".tgi[2].ni[90].nvs" 18304;
	setAttr ".tgi[2].ni[91].x" -24730;
	setAttr ".tgi[2].ni[91].y" 2350;
	setAttr ".tgi[2].ni[91].nvs" 18304;
	setAttr ".tgi[2].ni[92].x" -24730;
	setAttr ".tgi[2].ni[92].y" 1640;
	setAttr ".tgi[2].ni[92].nvs" 18304;
	setAttr ".tgi[2].ni[93].x" -24115.71484375;
	setAttr ".tgi[2].ni[93].y" -220;
	setAttr ".tgi[2].ni[93].nvs" 18304;
	setAttr ".tgi[2].ni[94].x" -24115.71484375;
	setAttr ".tgi[2].ni[94].y" -321.42855834960938;
	setAttr ".tgi[2].ni[94].nvs" 18304;
	setAttr ".tgi[2].ni[95].x" -24730;
	setAttr ".tgi[2].ni[95].y" -788.5714111328125;
	setAttr ".tgi[2].ni[95].nvs" 18304;
	setAttr ".tgi[2].ni[96].x" -24422.857421875;
	setAttr ".tgi[2].ni[96].y" 1757.142822265625;
	setAttr ".tgi[2].ni[96].nvs" 18304;
	setAttr ".tgi[2].ni[97].x" -24730;
	setAttr ".tgi[2].ni[97].y" -325.71429443359375;
	setAttr ".tgi[2].ni[97].nvs" 18304;
	setAttr ".tgi[2].ni[98].x" -25651.427734375;
	setAttr ".tgi[2].ni[98].y" 2494.28564453125;
	setAttr ".tgi[2].ni[98].nvs" 18304;
	setAttr ".tgi[2].ni[99].x" -25037.142578125;
	setAttr ".tgi[2].ni[99].y" 501.42855834960938;
	setAttr ".tgi[2].ni[99].nvs" 18304;
	setAttr ".tgi[2].ni[100].x" -24115.71484375;
	setAttr ".tgi[2].ni[100].y" -524.28570556640625;
	setAttr ".tgi[2].ni[100].nvs" 18304;
	setAttr ".tgi[2].ni[101].x" -24422.857421875;
	setAttr ".tgi[2].ni[101].y" 947.14288330078125;
	setAttr ".tgi[2].ni[101].nvs" 18304;
	setAttr ".tgi[2].ni[102].x" -24422.857421875;
	setAttr ".tgi[2].ni[102].y" -1455.7142333984375;
	setAttr ".tgi[2].ni[102].nvs" 18304;
	setAttr ".tgi[2].ni[103].x" -24115.71484375;
	setAttr ".tgi[2].ni[103].y" -625.71429443359375;
	setAttr ".tgi[2].ni[103].nvs" 18304;
	setAttr ".tgi[2].ni[104].x" -24422.857421875;
	setAttr ".tgi[2].ni[104].y" 2764.28564453125;
	setAttr ".tgi[2].ni[104].nvs" 18304;
	setAttr ".tgi[2].ni[105].x" -24115.71484375;
	setAttr ".tgi[2].ni[105].y" -727.14288330078125;
	setAttr ".tgi[2].ni[105].nvs" 18304;
	setAttr ".tgi[2].ni[106].x" -24115.71484375;
	setAttr ".tgi[2].ni[106].y" -828.5714111328125;
	setAttr ".tgi[2].ni[106].nvs" 18304;
	setAttr ".tgi[2].ni[107].x" -24422.857421875;
	setAttr ".tgi[2].ni[107].y" 761.4285888671875;
	setAttr ".tgi[2].ni[107].nvs" 18304;
	setAttr ".tgi[2].ni[108].x" -24730;
	setAttr ".tgi[2].ni[108].y" -21.428571701049805;
	setAttr ".tgi[2].ni[108].nvs" 18304;
	setAttr ".tgi[2].ni[109].x" -24115.71484375;
	setAttr ".tgi[2].ni[109].y" -930;
	setAttr ".tgi[2].ni[109].nvs" 18304;
	setAttr ".tgi[2].ni[110].x" -24115.71484375;
	setAttr ".tgi[2].ni[110].y" -1031.4285888671875;
	setAttr ".tgi[2].ni[110].nvs" 18304;
	setAttr ".tgi[2].ni[111].x" -24730;
	setAttr ".tgi[2].ni[111].y" 930;
	setAttr ".tgi[2].ni[111].nvs" 18304;
	setAttr ".tgi[2].ni[112].x" -24730;
	setAttr ".tgi[2].ni[112].y" 3567.142822265625;
	setAttr ".tgi[2].ni[112].nvs" 18304;
	setAttr ".tgi[2].ni[113].x" -24115.71484375;
	setAttr ".tgi[2].ni[113].y" -1132.857177734375;
	setAttr ".tgi[2].ni[113].nvs" 18304;
	setAttr ".tgi[2].ni[114].x" -24115.71484375;
	setAttr ".tgi[2].ni[114].y" -1234.2857666015625;
	setAttr ".tgi[2].ni[114].nvs" 18304;
	setAttr ".tgi[2].ni[115].x" -24730;
	setAttr ".tgi[2].ni[115].y" 1538.5714111328125;
	setAttr ".tgi[2].ni[115].nvs" 18304;
	setAttr ".tgi[2].ni[116].x" -24115.71484375;
	setAttr ".tgi[2].ni[116].y" -1335.7142333984375;
	setAttr ".tgi[2].ni[116].nvs" 18304;
	setAttr ".tgi[2].ni[117].x" -24115.71484375;
	setAttr ".tgi[2].ni[117].y" -1437.142822265625;
	setAttr ".tgi[2].ni[117].nvs" 18304;
	setAttr ".tgi[2].ni[118].x" -24730;
	setAttr ".tgi[2].ni[118].y" 3668.571533203125;
	setAttr ".tgi[2].ni[118].nvs" 18304;
	setAttr ".tgi[2].ni[119].x" -24115.71484375;
	setAttr ".tgi[2].ni[119].y" -1538.5714111328125;
	setAttr ".tgi[2].ni[119].nvs" 18304;
	setAttr ".tgi[2].ni[120].x" -24730;
	setAttr ".tgi[2].ni[120].y" -1295.7142333984375;
	setAttr ".tgi[2].ni[120].nvs" 18304;
	setAttr ".tgi[2].ni[121].x" -25037.142578125;
	setAttr ".tgi[2].ni[121].y" 2551.428466796875;
	setAttr ".tgi[2].ni[121].nvs" 18304;
	setAttr ".tgi[2].ni[122].x" -24422.857421875;
	setAttr ".tgi[2].ni[122].y" 2121.428466796875;
	setAttr ".tgi[2].ni[122].nvs" 18304;
	setAttr ".tgi[2].ni[123].x" -24115.71484375;
	setAttr ".tgi[2].ni[123].y" -1640;
	setAttr ".tgi[2].ni[123].nvs" 18304;
	setAttr ".tgi[2].ni[124].x" -25958.572265625;
	setAttr ".tgi[2].ni[124].y" 2251.428466796875;
	setAttr ".tgi[2].ni[124].nvs" 18304;
	setAttr ".tgi[2].ni[125].x" -24422.857421875;
	setAttr ".tgi[2].ni[125].y" -565.71429443359375;
	setAttr ".tgi[2].ni[125].nvs" 18304;
	setAttr ".tgi[2].ni[126].x" -24730;
	setAttr ".tgi[2].ni[126].y" 2958.571533203125;
	setAttr ".tgi[2].ni[126].nvs" 18304;
	setAttr ".tgi[2].ni[127].x" -24115.71484375;
	setAttr ".tgi[2].ni[127].y" -1741.4285888671875;
	setAttr ".tgi[2].ni[127].nvs" 18304;
	setAttr ".tgi[2].ni[128].x" -24730;
	setAttr ".tgi[2].ni[128].y" 181.42857360839844;
	setAttr ".tgi[2].ni[128].nvs" 18304;
	setAttr ".tgi[2].ni[129].x" -24422.857421875;
	setAttr ".tgi[2].ni[129].y" -1085.7142333984375;
	setAttr ".tgi[2].ni[129].nvs" 18304;
	setAttr ".tgi[2].ni[130].x" -24115.71484375;
	setAttr ".tgi[2].ni[130].y" -1842.857177734375;
	setAttr ".tgi[2].ni[130].nvs" 18304;
	setAttr ".tgi[2].ni[131].x" -24422.857421875;
	setAttr ".tgi[2].ni[131].y" 1235.7142333984375;
	setAttr ".tgi[2].ni[131].nvs" 18304;
	setAttr ".tgi[2].ni[132].x" -25344.28515625;
	setAttr ".tgi[2].ni[132].y" 2281.428466796875;
	setAttr ".tgi[2].ni[132].nvs" 18304;
	setAttr ".tgi[2].ni[133].x" -24115.71484375;
	setAttr ".tgi[2].ni[133].y" -1944.2857666015625;
	setAttr ".tgi[2].ni[133].nvs" 18304;
	setAttr ".tgi[2].ni[134].x" -24730;
	setAttr ".tgi[2].ni[134].y" 2654.28564453125;
	setAttr ".tgi[2].ni[134].nvs" 18304;
	setAttr ".tgi[2].ni[135].x" -24730;
	setAttr ".tgi[2].ni[135].y" -687.14288330078125;
	setAttr ".tgi[2].ni[135].nvs" 18304;
	setAttr ".tgi[2].ni[136].x" -24115.71484375;
	setAttr ".tgi[2].ni[136].y" -2045.7142333984375;
	setAttr ".tgi[2].ni[136].nvs" 18304;
	setAttr ".tgi[2].ni[137].x" -25037.142578125;
	setAttr ".tgi[2].ni[137].y" 1314.2857666015625;
	setAttr ".tgi[2].ni[137].nvs" 18304;
	setAttr ".tgi[2].ni[138].x" -24730;
	setAttr ".tgi[2].ni[138].y" -991.4285888671875;
	setAttr ".tgi[2].ni[138].nvs" 18304;
	setAttr ".tgi[2].ni[139].x" -24115.71484375;
	setAttr ".tgi[2].ni[139].y" -2147.142822265625;
	setAttr ".tgi[2].ni[139].nvs" 18304;
	setAttr ".tgi[2].ni[140].x" -24730;
	setAttr ".tgi[2].ni[140].y" 3262.857177734375;
	setAttr ".tgi[2].ni[140].nvs" 18304;
	setAttr ".tgi[2].ni[141].x" -24422.857421875;
	setAttr ".tgi[2].ni[141].y" 2222.857177734375;
	setAttr ".tgi[2].ni[141].nvs" 18304;
	setAttr ".tgi[2].ni[142].x" -24730;
	setAttr ".tgi[2].ni[142].y" 2147.142822265625;
	setAttr ".tgi[2].ni[142].nvs" 18304;
	setAttr ".tgi[2].ni[143].x" -24730;
	setAttr ".tgi[2].ni[143].y" 2451.428466796875;
	setAttr ".tgi[2].ni[143].nvs" 18304;
	setAttr ".tgi[2].ni[144].x" -24422.857421875;
	setAttr ".tgi[2].ni[144].y" -1658.5714111328125;
	setAttr ".tgi[2].ni[144].nvs" 18304;
	setAttr ".tgi[2].ni[145].x" -25651.427734375;
	setAttr ".tgi[2].ni[145].y" 2392.857177734375;
	setAttr ".tgi[2].ni[145].nvs" 18304;
	setAttr ".tgi[2].ni[146].x" -24115.71484375;
	setAttr ".tgi[2].ni[146].y" -2248.571533203125;
	setAttr ".tgi[2].ni[146].nvs" 18304;
	setAttr ".tgi[2].ni[147].x" -24115.71484375;
	setAttr ".tgi[2].ni[147].y" -2350;
	setAttr ".tgi[2].ni[147].nvs" 18304;
	setAttr ".tgi[2].ni[148].x" -24730;
	setAttr ".tgi[2].ni[148].y" 3060;
	setAttr ".tgi[2].ni[148].nvs" 18304;
	setAttr ".tgi[2].ni[149].x" -24422.857421875;
	setAttr ".tgi[2].ni[149].y" 2604.28564453125;
	setAttr ".tgi[2].ni[149].nvs" 18304;
	setAttr ".tgi[2].ni[150].x" -24115.71484375;
	setAttr ".tgi[2].ni[150].y" -2451.428466796875;
	setAttr ".tgi[2].ni[150].nvs" 18304;
	setAttr ".tgi[2].ni[151].x" -25344.28515625;
	setAttr ".tgi[2].ni[151].y" 987.14288330078125;
	setAttr ".tgi[2].ni[151].nvs" 18304;
	setAttr ".tgi[2].ni[152].x" -24115.71484375;
	setAttr ".tgi[2].ni[152].y" -2552.857177734375;
	setAttr ".tgi[2].ni[152].nvs" 18304;
	setAttr ".tgi[2].ni[153].x" -24115.71484375;
	setAttr ".tgi[2].ni[153].y" -2654.28564453125;
	setAttr ".tgi[2].ni[153].nvs" 18304;
	setAttr ".tgi[2].ni[154].x" -24115.71484375;
	setAttr ".tgi[2].ni[154].y" -2755.71435546875;
	setAttr ".tgi[2].ni[154].nvs" 18304;
	setAttr ".tgi[2].ni[155].x" -24115.71484375;
	setAttr ".tgi[2].ni[155].y" -2857.142822265625;
	setAttr ".tgi[2].ni[155].nvs" 18304;
	setAttr ".tgi[2].ni[156].x" -24422.857421875;
	setAttr ".tgi[2].ni[156].y" -407.14285278320312;
	setAttr ".tgi[2].ni[156].nvs" 18304;
	setAttr ".tgi[2].ni[157].x" -24730;
	setAttr ".tgi[2].ni[157].y" 2045.7142333984375;
	setAttr ".tgi[2].ni[157].nvs" 18304;
	setAttr ".tgi[2].ni[158].x" -24115.71484375;
	setAttr ".tgi[2].ni[158].y" -2958.571533203125;
	setAttr ".tgi[2].ni[158].nvs" 18304;
	setAttr ".tgi[2].ni[159].x" -24730;
	setAttr ".tgi[2].ni[159].y" -484.28570556640625;
	setAttr ".tgi[2].ni[159].nvs" 18304;
	setAttr ".tgi[2].ni[160].x" -24115.71484375;
	setAttr ".tgi[2].ni[160].y" -3060;
	setAttr ".tgi[2].ni[160].nvs" 18304;
	setAttr ".tgi[2].ni[161].x" -24730;
	setAttr ".tgi[2].ni[161].y" 1234.2857666015625;
	setAttr ".tgi[2].ni[161].nvs" 18304;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "B603714D-4D80-E976-5371-87B8A2642021";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n"
		+ "            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n"
		+ "            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n"
		+ "            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n"
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1212\n            -height 1662\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n"
		+ "            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            -ufeFilter \"MaterialX\" \"Hidden\" -ufeFilterValue 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n"
		+ "            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -ufeFilter \"MaterialX\" \"Hidden\" -ufeFilterValue 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n"
		+ "                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.041667\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -tangentScale 1\n                -tangentLineThickness 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -limitToSelectedCurves 0\n                -constrainDrag 0\n                -valueLinesToggle 0\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n"
		+ "                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -hierarchyBelow 0\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n"
		+ "                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -enableOpenGL 0\n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n"
		+ "                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -enableOpenGL 0\n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n"
		+ "                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n"
		+ "                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -bluePencil 1\n                -greasePencils 0\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n"
		+ "                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap true\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1212\\n    -height 1662\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1212\\n    -height 1662\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
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
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 1 1 1 1 1 1
		 1 1 1 0 1 1 1 1 1 1 1 0
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
	setAttr ".dli" 1;
	setAttr -k on ".rtfm" 1;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 24 ".st";
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
	setAttr -s 7 ".s";
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
	setAttr -s 105 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".r";
select -ne :standardSurface1;
	setAttr ".sr" 0.40000000596046448;
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
connectAttr "mid_makeNurbSphere.os" "mid_poserNurbsShape.cr";
connectAttr "full_mainPoser.sx" "full_mainPoser.sy" -l on;
connectAttr "full_mainPoser.sx" "full_mainPoser.sz" -l on;
connectAttr "full_cluster4GroupId.id" "full_mainPoserShape.iog.og[1].gid";
connectAttr "full_cluster4Set.mwc" "full_mainPoserShape.iog.og[1].gco";
connectAttr "full_groupId42.id" "full_mainPoserShape.iog.og[2].gid";
connectAttr "full_tweakSet24.mwc" "full_mainPoserShape.iog.og[2].gco";
connectAttr "full_mainPoser_clusterHandleCluster.og[0]" "full_mainPoserShape.cr"
		;
connectAttr "full_tweak24.pl[0].cp[0]" "full_mainPoserShape.twl";
connectAttr "full_mainPoser_size_multiplyDivide.ox" "full_mainPoser_clusterHandle.sx"
		;
connectAttr "full_mainPoser_size_multiplyDivide.ox" "full_mainPoser_clusterHandle.sy"
		;
connectAttr "full_mainPoser_size_multiplyDivide.ox" "full_mainPoser_clusterHandle.sz"
		;
connectAttr "in_mainPoser.sx" "in_mainPoser.sy" -l on;
connectAttr "in_mainPoser.sx" "in_mainPoser.sz" -l on;
connectAttr "in_cluster4GroupId.id" "in_mainPoserShape.iog.og[1].gid";
connectAttr "in_cluster4Set.mwc" "in_mainPoserShape.iog.og[1].gco";
connectAttr "in_groupId42.id" "in_mainPoserShape.iog.og[2].gid";
connectAttr "in_tweakSet24.mwc" "in_mainPoserShape.iog.og[2].gco";
connectAttr "in_mainPoser_clusterHandleCluster.og[0]" "in_mainPoserShape.cr";
connectAttr "in_tweak24.pl[0].cp[0]" "in_mainPoserShape.twl";
connectAttr "in_mainPoser_size_multiplyDivide.ox" "in_mainPoser_clusterHandle.sx"
		;
connectAttr "in_mainPoser_size_multiplyDivide.ox" "in_mainPoser_clusterHandle.sy"
		;
connectAttr "in_mainPoser_size_multiplyDivide.ox" "in_mainPoser_clusterHandle.sz"
		;
connectAttr "local_1_makeNurbSphere.os" "local_1_poserNurbsShape.cr";
connectAttr "local_2_makeNurbSphere.os" "local_2_poserNurbsShape.cr";
connectAttr "mid_mainPoser.sx" "mid_mainPoser.sy" -l on;
connectAttr "mid_mainPoser.sx" "mid_mainPoser.sz" -l on;
connectAttr "mid_cluster4GroupId.id" "mid_mainPoserShape.iog.og[1].gid";
connectAttr "mid_cluster4Set.mwc" "mid_mainPoserShape.iog.og[1].gco";
connectAttr "mid_groupId42.id" "mid_mainPoserShape.iog.og[2].gid";
connectAttr "mid_tweakSet24.mwc" "mid_mainPoserShape.iog.og[2].gco";
connectAttr "mid_mainPoser_clusterHandleCluster.og[0]" "mid_mainPoserShape.cr";
connectAttr "mid_tweak24.pl[0].cp[0]" "mid_mainPoserShape.twl";
connectAttr "mid_mainPoser_size_multiplyDivide.ox" "mid_mainPoser_clusterHandle.sx"
		;
connectAttr "mid_mainPoser_size_multiplyDivide.ox" "mid_mainPoser_clusterHandle.sy"
		;
connectAttr "mid_mainPoser_size_multiplyDivide.ox" "mid_mainPoser_clusterHandle.sz"
		;
connectAttr "local_3_makeNurbSphere.os" "local_3_poserNurbsShape.cr";
connectAttr "local_4_makeNurbSphere.os" "local_4_poserNurbsShape.cr";
connectAttr "out_mainPoser.sx" "out_mainPoser.sy" -l on;
connectAttr "out_mainPoser.sx" "out_mainPoser.sz" -l on;
connectAttr "out_cluster4GroupId.id" "out_mainPoserShape.iog.og[1].gid";
connectAttr "out_cluster4Set.mwc" "out_mainPoserShape.iog.og[1].gco";
connectAttr "out_groupId42.id" "out_mainPoserShape.iog.og[2].gid";
connectAttr "out_tweakSet24.mwc" "out_mainPoserShape.iog.og[2].gco";
connectAttr "out_mainPoser_clusterHandleCluster.og[0]" "out_mainPoserShape.cr";
connectAttr "out_tweak24.pl[0].cp[0]" "out_mainPoserShape.twl";
connectAttr "out_mainPoser_size_multiplyDivide.ox" "out_mainPoser_clusterHandle.sx"
		;
connectAttr "out_mainPoser_size_multiplyDivide.ox" "out_mainPoser_clusterHandle.sy"
		;
connectAttr "out_mainPoser_size_multiplyDivide.ox" "out_mainPoser_clusterHandle.sz"
		;
connectAttr "local_5_makeNurbSphere.os" "local_5_poserNurbsShape.cr";
connectAttr "local_6_makeNurbSphere.os" "local_6_poserNurbsShape.cr";
connectAttr "local_7_makeNurbSphere.os" "local_7_poserNurbsShape.cr";
connectAttr "local_8_poser_orientConstraint1.crx" "local_8_poser.rx" -l on;
connectAttr "local_8_poser_orientConstraint1.cry" "local_8_poser.ry" -l on;
connectAttr "local_8_poser_orientConstraint1.crz" "local_8_poser.rz" -l on;
connectAttr "local_8_makeNurbSphere.os" "local_8_poserNurbsShape.cr";
connectAttr "local_8_poser.ro" "local_8_poser_orientConstraint1.cro";
connectAttr "local_8_poser.pim" "local_8_poser_orientConstraint1.cpim";
connectAttr "local_7_poser.r" "local_8_poser_orientConstraint1.tg[0].tr";
connectAttr "local_7_poser.ro" "local_8_poser_orientConstraint1.tg[0].tro";
connectAttr "local_7_poser.pm" "local_8_poser_orientConstraint1.tg[0].tpm";
connectAttr "local_8_poser_orientConstraint1.w0" "local_8_poser_orientConstraint1.tg[0].tw"
		;
connectAttr "center_poser_group_scaleConstraint1.csx" "center_poser_group.sx";
connectAttr "center_poser_group_scaleConstraint1.csy" "center_poser_group.sy";
connectAttr "center_poser_group_scaleConstraint1.csz" "center_poser_group.sz";
connectAttr "mainPoser.ty" "center_poser_group.ty";
connectAttr "mainPoser.tz" "center_poser_group.tz";
connectAttr "center_makeNurbSphere.os" "center_poserNurbsShape.cr";
connectAttr "center_poser_group.pim" "center_poser_group_scaleConstraint1.cpim";
connectAttr "mainPoser.s" "center_poser_group_scaleConstraint1.tg[0].ts";
connectAttr "mainPoser.pm" "center_poser_group_scaleConstraint1.tg[0].tpm";
connectAttr "center_poser_group_scaleConstraint1.w0" "center_poser_group_scaleConstraint1.tg[0].tw"
		;
connectAttr "local_1_poserOrientShape.wp" "posers_curve_Shape1.cp[0]";
connectAttr "local_2_poserOrientShape.wp" "posers_curve_Shape1.cp[1]";
connectAttr "local_3_poserOrientShape.wp" "posers_curve_Shape1.cp[2]";
connectAttr "local_4_poserOrientShape.wp" "posers_curve_Shape1.cp[3]";
connectAttr "local_5_poserOrientShape.wp" "posers_curve_Shape1.cp[4]";
connectAttr "local_6_poserOrientShape.wp" "posers_curve_Shape1.cp[5]";
connectAttr "local_7_poserOrientShape.wp" "posers_curve_Shape1.cp[6]";
connectAttr "sweepMeshCreator1.outMeshArray[1]" "posers_curve_1_sweepMeshShape.i"
		;
connectAttr "mainPoser.wm" "input.opm";
connectAttr "l_curve_loc_01Shape.wp" "l_curveShape.cp[0]";
connectAttr "l_curve_loc_02Shape.wp" "l_curveShape.cp[1]";
connectAttr "l_curve_loc_03Shape.wp" "l_curveShape.cp[2]";
connectAttr "l_curve_loc_04Shape.wp" "l_curveShape.cp[3]";
connectAttr "l_curve_loc_05Shape.wp" "l_curveShape.cp[4]";
connectAttr "l_curve_loc_06Shape.wp" "l_curveShape.cp[5]";
connectAttr "l_curve_loc_07Shape.wp" "l_curveShape.cp[6]";
connectAttr "l_curve_loc_08Shape.wp" "l_curveShape.cp[7]";
connectAttr "l_curve_loc_09Shape.wp" "l_curveShape.cp[8]";
connectAttr "l_curve_loc_Shape10.wp" "l_curveShape.cp[9]";
connectAttr "l_curve_loc_Shape11.wp" "l_curveShape.cp[10]";
connectAttr "l_curve_loc_12Shape.wp" "l_curveShape.cp[11]";
connectAttr "l_curve_loc_01Shape.wp" "r_curveShape.cp[0]";
connectAttr "r_curve_loc_02Shape.wp" "r_curveShape.cp[1]";
connectAttr "r_curve_loc_03Shape.wp" "r_curveShape.cp[2]";
connectAttr "r_curve_loc_04Shape.wp" "r_curveShape.cp[3]";
connectAttr "r_curve_loc_05Shape.wp" "r_curveShape.cp[4]";
connectAttr "r_curve_loc_06Shape.wp" "r_curveShape.cp[5]";
connectAttr "r_curve_loc_07Shape.wp" "r_curveShape.cp[6]";
connectAttr "r_curve_loc_08Shape.wp" "r_curveShape.cp[7]";
connectAttr "r_curve_loc_09Shape.wp" "r_curveShape.cp[8]";
connectAttr "r_curve_loc_10Shape.wp" "r_curveShape.cp[9]";
connectAttr "r_curve_loc_11Shape.wp" "r_curveShape.cp[10]";
connectAttr "r_curve_loc_12Shape.wp" "r_curveShape.cp[11]";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "multMatrix58.o" "l_brow_group.opm";
connectAttr "l_brow.limits" "l_brow.mtye";
connectAttr "l_brow.limits" "l_brow.xtye";
connectAttr "l_brow.upLimit" "l_brow.xtyl";
connectAttr "l_brow.downLimit" "l_brow.mtyl";
connectAttr "in_mainPoser.m" "l_brow_in_group.opm";
connectAttr "multMatrix50.o" "l_brow_in_group_1.opm";
connectAttr "multDoubleLinear6.o" "l_brow_in_1Shape.v";
connectAttr "unitConversion57.o" "l_brow_local_2_rotateOffset.rz";
connectAttr "plusMinusAverage28.o1" "l_curve9_2_loc_moveOffset.ty";
connectAttr "multDoubleLinear21.o" "l_curve9_2_loc_moveOffset.tx";
connectAttr "multMatrix60.o" "l_brow_local_2_group.opm";
connectAttr "plusMinusAverage38.o3" "l_brow_local_2_group_1.t";
connectAttr "multDoubleLinear6.o" "l_brow_local_2Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_local_2_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_local_2_bot.v";
connectAttr "multDoubleLinear7.o" "l_brow_local_1_moveOffset.ty";
connectAttr "remapValue1.ov" "l_brow_local_1_moveOffset.tx";
connectAttr "multMatrix59.o" "l_brow_local_1_group.opm";
connectAttr "plusMinusAverage30.o3" "l_brow_local_1_group_1.t";
connectAttr "multDoubleLinear6.o" "l_brow_local_1Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_in_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_in_bot.v";
connectAttr "multMatrix56.o" "l_brow_mid_group.opm";
connectAttr "multMatrix49.o" "l_brow_mid_group_1.opm";
connectAttr "multDoubleLinear6.o" "l_brow_midShape.v";
connectAttr "unitConversion20.o" "l_brow_local_3_rotateOffset.rz";
connectAttr "plusMinusAverage26.o1" "l_curve9_3_loc_moveOffset.ty";
connectAttr "multMatrix61.o" "l_brow_local_3_group.opm";
connectAttr "plusMinusAverage39.o3" "l_brow_local_3_group_1.t";
connectAttr "multDoubleLinear6.o" "l_brow_local_3Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_local_3_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_local_3_bot.v";
connectAttr "plusMinusAverage29.o1" "l_brow_local_4_moveOffset.ty";
connectAttr "plusMinusAverage40.o3" "l_brow_local_4_group.t";
connectAttr "multMatrix62.o" "l_brow_local_4_group.opm";
connectAttr "multDoubleLinear6.o" "l_brow_local_4Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_local_4_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_local_4_bot.v";
connectAttr "up_vis_condition.ocr" "l_brow_mid_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_mid_bot.v";
connectAttr "out_mainPoser.m" "l_brow_out_group.opm";
connectAttr "multMatrix48.o" "l_brow_out_group_1.opm";
connectAttr "multDoubleLinear6.o" "l_brow_out_1Shape.v";
connectAttr "unitConversion22.o" "l_brow_local_out_rotateOffset.rz";
connectAttr "plusMinusAverage27.o1" "l_curve9_5_loc_moveOffset.ty";
connectAttr "multMatrix63.o" "l_brow_local_5_group.opm";
connectAttr "plusMinusAverage41.o3" "l_brow_local_5_group_1.t";
connectAttr "multDoubleLinear6.o" "l_brow_local_5Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_local_5_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_local_5_bot.v";
connectAttr "multDoubleLinear17.o" "l_curve9_6_loc_moveOffset.ty";
connectAttr "multMatrix64.o" "l_brow_local_6_group.opm";
connectAttr "plusMinusAverage42.o3" "l_brow_local_6_group_1.t";
connectAttr "multDoubleLinear6.o" "l_brow_local_6Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_local_6_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_local_6_bot.v";
connectAttr "l_brow_out.rz" "l_brow_local_7_rotateOffset.rz";
connectAttr "remapValue3.ov" "l_brow_local_7_rotateOffset.tx";
connectAttr "multMatrix65.o" "l_brow_local_7_group.opm";
connectAttr "plusMinusAverage43.o3" "l_brow_local_7_group_1.t";
connectAttr "multDoubleLinear6.o" "l_brow_local_7Shape.v";
connectAttr "up_vis_condition.ocr" "l_brow_local_7_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_local_7_bot.v";
connectAttr "up_vis_condition.ocr" "l_brow_out_top.v";
connectAttr "down_vis_condition.ocr" "l_brow_out_bot.v";
connectAttr "multMatrix68.o" "l_brow_last.opm";
connectAttr "multMatrix51.o" "r_brow_group.opm";
connectAttr "l_brow.upLimit" "r_brow.xtyl";
connectAttr "l_brow.downLimit" "r_brow.mtyl";
connectAttr "l_browShape.ws" "r_browShape.cr";
connectAttr "in_mainPoser.m" "r_brow_in_group.opm";
connectAttr "multMatrix54.o" "r_brow_in_group_1.opm";
connectAttr "l_brow_in_1Shape.ws" "r_brow_in_1Shape.cr";
connectAttr "unitConversion59.o" "r_brow_local_2_rotateOffset.rz";
connectAttr "multDoubleLinear81.o" "r_curve9_2_loc_moveOffset.tx";
connectAttr "plusMinusAverage57.o1" "r_curve9_2_loc_moveOffset.ty";
connectAttr "multMatrix60.o" "r_brow_local_2_group.opm";
connectAttr "plusMinusAverage44.o3" "r_brow_local_2_group_1.t";
connectAttr "l_brow_local_2Shape.ws" "r_brow_local_2Shape.cr";
connectAttr "remapValue2.ov" "r_brow_local_1_moveOffset.tx";
connectAttr "multDoubleLinear68.o" "r_brow_local_1_moveOffset.ty";
connectAttr "multMatrix59.o" "r_brow_local_1_group.opm";
connectAttr "plusMinusAverage37.o3" "r_brow_local_1_group_1.t";
connectAttr "l_brow_local_1Shape.ws" "r_brow_local_1Shape.cr";
connectAttr "multMatrix56.o" "r_brow_mid_group.opm";
connectAttr "multMatrix53.o" "r_brow_mid_group_1.opm";
connectAttr "l_brow_midShape.ws" "r_brow_midShape.cr";
connectAttr "plusMinusAverage55.o1" "r_curve9_3_loc_moveOffset.ty";
connectAttr "multMatrix61.o" "r_brow_local_3_group.opm";
connectAttr "plusMinusAverage45.o3" "r_brow_local_3_group_1.t";
connectAttr "l_brow_local_3Shape.ws" "r_brow_local_3Shape.cr";
connectAttr "plusMinusAverage58.o1" "r_brow_local_4_moveOffset.ty";
connectAttr "plusMinusAverage46.o3" "r_brow_local_4_group.t";
connectAttr "multMatrix62.o" "r_brow_local_4_group.opm";
connectAttr "l_brow_local_4Shape.ws" "r_brow_local_4Shape.cr";
connectAttr "out_mainPoser.m" "r_brow_out_group.opm";
connectAttr "multMatrix52.o" "r_brow_out_group_1.opm";
connectAttr "l_brow_out_1Shape.ws" "r_brow_out_1Shape.cr";
connectAttr "unitConversion86.o" "r_brow_local_out_rotateOffset.rz";
connectAttr "plusMinusAverage56.o1" "r_curve9_5_loc_moveOffset.ty";
connectAttr "multMatrix63.o" "r_brow_local_5_group.opm";
connectAttr "plusMinusAverage47.o3" "r_brow_local_5_group_1.t";
connectAttr "l_brow_local_5Shape.ws" "r_brow_local_5Shape.cr";
connectAttr "multDoubleLinear77.o" "r_curve9_6_loc_moveOffset.ty";
connectAttr "multMatrix64.o" "r_brow_local_6_group.opm";
connectAttr "plusMinusAverage48.o3" "r_brow_local_6_group_1.t";
connectAttr "l_brow_local_6Shape.ws" "r_brow_local_6Shape.cr";
connectAttr "clamp18.opr" "r_brow_local_7_rotateOffset.tx";
connectAttr "r_brow_out.rz" "r_brow_local_7_rotateOffset.rz";
connectAttr "multMatrix65.o" "r_brow_local_7_group.opm";
connectAttr "l_brow_local_7Shape.ws" "r_brow_local_7Shape.cr";
connectAttr "multMatrix68.o" "r_brow_last.opm";
connectAttr "multMatrix55.o" "brow_center_group.opm";
connectAttr "multiplyDivide42.o" "brow_center_group_1.t";
connectAttr "multMatrix66.o" "l_curve_loc_12.opm";
connectAttr "multMatrix67.o" "r_curve_loc_12.opm";
connectAttr "root_connector.wm" "root_outJoint.opm";
connectAttr "root_outJoint.s" "center_outJoint.is";
connectAttr "decomposeMatrix1.ot" "center_outJoint.t";
connectAttr "decomposeMatrix1.or" "center_outJoint.r";
connectAttr "decomposeMatrix1.os" "center_outJoint.s";
connectAttr "setRange16.ox" "bs_weights.l_brow_1_up";
connectAttr "setRange16.oy" "bs_weights.l_brow_2_up";
connectAttr "setRange16.oz" "bs_weights.l_brow_3_up";
connectAttr "setRange18.ox" "bs_weights.r_brow_1_up";
connectAttr "setRange18.oy" "bs_weights.r_brow_2_up";
connectAttr "setRange18.oz" "bs_weights.r_brow_3_up";
connectAttr "setRange17.ox" "bs_weights.l_brow_1_down";
connectAttr "setRange17.oy" "bs_weights.l_brow_2_down";
connectAttr "setRange17.oz" "bs_weights.l_brow_3_down";
connectAttr "setRange19.ox" "bs_weights.r_brow_1_down";
connectAttr "setRange19.oy" "bs_weights.r_brow_2_down";
connectAttr "setRange19.oz" "bs_weights.r_brow_3_down";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "center_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "center_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "center_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_1_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_1_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_1_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_2_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_2_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_2_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "side_3_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "char_basicSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__lambert1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__lambert1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "green_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blue_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "red_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "black_rsSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "center_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "center_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "center_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_1_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_1_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_1_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_2_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_2_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_2_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "side_3_surfaceShader1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "char_basicSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__lambert1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__lambert1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "green_rsSG.msg" "materialInfo2.sg";
connectAttr "blue_rsSG.msg" "materialInfo3.sg";
connectAttr "red_rsSG.msg" "materialInfo4.sg";
connectAttr "l_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "r_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "brow_center.iog" "moduleControlSet.dsm" -na;
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
connectAttr "mainPoser.size" "size_multiplyDivide.i1x";
connectAttr "root_poser.size" "size_multiplyDivide.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "mid_size_multDoubleLinear.o" "mid_makeNurbSphere.r";
connectAttr "mid_poser.size" "mid_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "mid_size_multDoubleLinear.i2";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "shapeEditorManager.obsv[0]" "shapeEditorManager1.bsdt[0].bdpv";
connectAttr ":lambert1.oc" "lambert1SG.ss";
connectAttr "lambert1SG.msg" "materialInfo47.sg";
connectAttr ":lambert1.msg" "materialInfo47.m";
connectAttr "center_surfaceShader1SG.msg" "center_materialInfo1.sg";
connectAttr "center_surfaceShader2SG.msg" "center_materialInfo2.sg";
connectAttr "center_surfaceShader3SG.msg" "center_materialInfo3.sg";
connectAttr "side_1_surfaceShader1SG.msg" "side_1_materialInfo1.sg";
connectAttr "side_1_surfaceShader2SG.msg" "side_1_materialInfo2.sg";
connectAttr "side_1_surfaceShader3SG.msg" "side_1_materialInfo3.sg";
connectAttr "side_2_surfaceShader1SG.msg" "side_2_materialInfo1.sg";
connectAttr "side_2_surfaceShader2SG.msg" "side_2_materialInfo2.sg";
connectAttr "side_2_surfaceShader3SG.msg" "side_2_materialInfo3.sg";
connectAttr "side_3_surfaceShader1SG.msg" "side_3_materialInfo1.sg";
connectAttr "side_3_surfaceShader2SG.msg" "side_3_materialInfo2.sg";
connectAttr "side_3_surfaceShader3SG.msg" "side_3_materialInfo3.sg";
connectAttr "side_3_surfaceShader1SG1.msg" "side_3_materialInfo4.sg";
connectAttr "composeMatrix3.omat" "multMatrix33.i[1]";
connectAttr "clamp1.opr" "uvPin.coord[1].cu";
connectAttr "clamp1.opg" "uvPin.coord[1].cv";
connectAttr "clamp4.opr" "uvPin.coord[2].cu";
connectAttr "clamp4.opg" "uvPin.coord[2].cv";
connectAttr "clamp6.opr" "uvPin.coord[3].cu";
connectAttr "clamp6.opg" "uvPin.coord[3].cv";
connectAttr "clamp7.opr" "uvPin.coord[4].cu";
connectAttr "clamp7.opg" "uvPin.coord[4].cv";
connectAttr "clamp9.opr" "uvPin.coord[5].cu";
connectAttr "clamp9.opg" "uvPin.coord[5].cv";
connectAttr "clamp10.opr" "uvPin.coord[6].cu";
connectAttr "clamp10.opg" "uvPin.coord[6].cv";
connectAttr "pasted__clamp1.op" "pasted__multiplyDivide1.i1";
connectAttr "multiplyDivide17.ox" "plusMinusAverage3.i3[2].i3y";
connectAttr "multiplyDivide17.ox" "plusMinusAverage4.i3[1].i3y";
connectAttr "multiplyDivide17.oy" "plusMinusAverage4.i3[1].i3x";
connectAttr "setRange2.ox" "plusMinusAverage5.i3[2].i3y";
connectAttr "setRange2.oy" "plusMinusAverage5.i3[3].i3y";
connectAttr "multiplyDivide16.ox" "multiplyDivide2.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide2.i2y";
connectAttr "multiplyDivide2.o" "plusMinusAverage6.i3[0]";
connectAttr "plusMinusAverage6.o3" "clamp1.ip";
connectAttr "multiplyDivide4.o" "clamp2.mn";
connectAttr "multiplyDivide2.o" "clamp2.ip";
connectAttr "clamp2.op" "multiplyDivide5.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide5.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide5.i2y";
connectAttr "multiplyDivide5.o" "multiplyDivide6.i1";
connectAttr "multiplyDivide11.o" "plusMinusAverage8.i3[0]";
connectAttr "multiplyDivide10.o" "clamp3.mn";
connectAttr "multiplyDivide11.o" "clamp3.ip";
connectAttr "plusMinusAverage8.o3" "clamp4.ip";
connectAttr "clamp3.op" "multiplyDivide8.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide8.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide8.i2y";
connectAttr "multiplyDivide8.o" "multiplyDivide9.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide11.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide11.i2y";
connectAttr "multiplyDivide14.o" "multiplyDivide12.i1";
connectAttr "multiplyDivide15.o" "clamp5.mn";
connectAttr "multiplyDivide13.o" "clamp5.ip";
connectAttr "multiplyDivide13.o" "plusMinusAverage11.i3[0]";
connectAttr "plusMinusAverage3.o3" "multiplyDivide13.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide13.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide13.i2y";
connectAttr "clamp5.op" "multiplyDivide14.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide14.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide14.i2y";
connectAttr "plusMinusAverage11.o3" "clamp6.ip";
connectAttr "uvPin.omat[2]" "multMatrix10.i[1]";
connectAttr "uvPin.omat[1]" "multMatrix11.i[1]";
connectAttr "uvPin.omat[3]" "multMatrix12.i[1]";
connectAttr "uvPin.omat[4]" "multMatrix19.i[1]";
connectAttr "multiplyDivide19.ox" "plusMinusAverage12.i3[2].i3y";
connectAttr "plusMinusAverage12.o3" "multiplyDivide20.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide20.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide20.i2y";
connectAttr "multiplyDivide20.o" "plusMinusAverage13.i3[0]";
connectAttr "plusMinusAverage13.o3" "clamp7.ip";
connectAttr "multiplyDivide21.o" "clamp8.mn";
connectAttr "multiplyDivide20.o" "clamp8.ip";
connectAttr "multiplyDivide23.o" "multiplyDivide22.i1";
connectAttr "clamp8.op" "multiplyDivide23.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide23.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide23.i2y";
connectAttr "multiplyDivide19.ox" "plusMinusAverage15.i3[1].i3y";
connectAttr "multiplyDivide19.oy" "plusMinusAverage15.i3[1].i3x";
connectAttr "multiplyDivide16.ox" "multiplyDivide24.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide24.i2y";
connectAttr "multiplyDivide24.o" "plusMinusAverage17.i3[0]";
connectAttr "plusMinusAverage17.o3" "clamp9.ip";
connectAttr "uvPin.omat[5]" "multMatrix20.i[1]";
connectAttr "multiplyDivide19.ox" "plusMinusAverage18.i3[2].i3y";
connectAttr "plusMinusAverage18.o3" "multiplyDivide25.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide25.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide25.i2y";
connectAttr "multiplyDivide25.o" "plusMinusAverage19.i3[0]";
connectAttr "plusMinusAverage19.o3" "clamp10.ip";
connectAttr "uvPin.omat[6]" "multMatrix21.i[1]";
connectAttr "multiplyDivide4.o" "clamp11.mn";
connectAttr "multiplyDivide24.o" "clamp11.ip";
connectAttr "clamp11.op" "multiplyDivide26.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide26.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide26.i2y";
connectAttr "multiplyDivide26.o" "multiplyDivide27.i1";
connectAttr "multiplyDivide10.o" "clamp12.mn";
connectAttr "multiplyDivide25.o" "clamp12.ip";
connectAttr "clamp12.op" "multiplyDivide28.i1";
connectAttr "multiplyDivide16.ox" "multiplyDivide28.i2x";
connectAttr "multiplyDivide16.oy" "multiplyDivide28.i2y";
connectAttr "multiplyDivide28.o" "multiplyDivide29.i1";
connectAttr "setRange3.ox" "plusMinusAverage21.i3[2].i3y";
connectAttr "setRange3.oy" "plusMinusAverage21.i3[3].i3y";
connectAttr "uvPin.omat[7]" "multMatrix42.i[1]";
connectAttr "uvPin.omat[8]" "multMatrix44.i[1]";
connectAttr "uvPin.omat[9]" "multMatrix45.i[1]";
connectAttr "plusMinusAverage3.o3y" "setRange4.vx";
connectAttr "plusMinusAverage3.o3y" "setRange5.vx";
connectAttr "plusMinusAverage12.o3y" "setRange6.vx";
connectAttr "plusMinusAverage18.o3y" "setRange6.vz";
connectAttr "plusMinusAverage12.o3y" "setRange7.vx";
connectAttr "plusMinusAverage18.o3y" "setRange7.vz";
connectAttr "plusMinusAverage3.o3x" "addDoubleLinear1.i1";
connectAttr "plusMinusAverage12.o3x" "addDoubleLinear1.i2";
connectAttr "addDoubleLinear1.o" "setRange8.vx";
connectAttr "char_basic.oc" "char_basicSG.ss";
connectAttr "char_basicSG.msg" "materialInfo48.sg";
connectAttr "char_basic.msg" "materialInfo48.m";
connectAttr "pasted__lambert1SG.msg" "pasted__materialInfo47.sg";
connectAttr ":lambert1.msg" "pasted__materialInfo47.m";
connectAttr ":lambert1.oc" "pasted__lambert1SG.ss";
connectAttr "addDoubleLinear9.o" "plusMinusAverage24.i1[0]";
connectAttr "addDoubleLinear10.o" "plusMinusAverage24.i1[1]";
connectAttr "multDoubleLinear42.o" "multDoubleLinear1.i1";
connectAttr "addDoubleLinear2.o" "multDoubleLinear1.i2";
connectAttr "addDoubleLinear9.o" "plusMinusAverage25.i1[0]";
connectAttr "addDoubleLinear8.o" "plusMinusAverage25.i1[1]";
connectAttr "plusMinusAverage24.o1" "multDoubleLinear3.i1";
connectAttr "multDoubleLinear5.o" "multDoubleLinear3.i2";
connectAttr "plusMinusAverage25.o1" "multDoubleLinear4.i1";
connectAttr "multDoubleLinear5.o" "multDoubleLinear4.i2";
connectAttr "l_brow_mid.rz" "unitConversion20.i";
connectAttr "l_brow_out.rz" "unitConversion22.i";
connectAttr "l_brow_mid.rz" "unitConversion24.i";
connectAttr "l_brow_out.rz" "unitConversion26.i";
connectAttr "pasted__lambert1SG1.msg" "pasted__materialInfo48.sg";
connectAttr ":lambert1.msg" "pasted__materialInfo48.m";
connectAttr ":lambert1.oc" "pasted__lambert1SG1.ss";
connectAttr "l_brow_mid.ty" "addDoubleLinear9.i1";
connectAttr "l_brow.ty" "addDoubleLinear9.i2";
connectAttr "l_brow_out.ty" "addDoubleLinear10.i1";
connectAttr "l_brow.ty" "addDoubleLinear10.i2";
connectAttr "l_brow.ty" "up_down_setRange.vx";
connectAttr "l_brow.ty" "up_down_setRange.vy";
connectAttr "l_brow.upLimit" "up_down_setRange.omy";
connectAttr "l_brow.downLimit" "up_down_setRange.onx";
connectAttr "up_down_setRange.oy" "blendMatrix1.env";
connectAttr "l_brow_out_top.m" "blendMatrix1.tgt[0].tmat";
connectAttr "up_down_setRange.oy" "blendMatrix2.env";
connectAttr "l_brow_mid_top.m" "blendMatrix2.tgt[0].tmat";
connectAttr "up_down_setRange.oy" "blendMatrix3.env";
connectAttr "l_brow_in_top.m" "blendMatrix3.tgt[0].tmat";
connectAttr "up_down_setRange.ox" "blendMatrix4.env";
connectAttr "l_brow_in_bot.m" "blendMatrix4.tgt[0].tmat";
connectAttr "up_down_setRange.ox" "blendMatrix5.env";
connectAttr "l_brow_out_bot.m" "blendMatrix5.tgt[0].tmat";
connectAttr "up_down_setRange.ox" "blendMatrix6.env";
connectAttr "l_brow_mid_bot.m" "blendMatrix6.tgt[0].tmat";
connectAttr "blendMatrix1.omat" "multMatrix48.i[0]";
connectAttr "blendMatrix5.omat" "multMatrix48.i[1]";
connectAttr "blendMatrix2.omat" "multMatrix49.i[0]";
connectAttr "blendMatrix6.omat" "multMatrix49.i[1]";
connectAttr "blendMatrix3.omat" "multMatrix50.i[0]";
connectAttr "blendMatrix4.omat" "multMatrix50.i[1]";
connectAttr "layerManager.dli[2]" "geometry.id";
connectAttr "l_brow.limitPositions" "up_vis_condition.ft";
connectAttr "l_brow.limitPositions" "down_vis_condition.ft";
connectAttr "up_vis_condition.ocg" "multDoubleLinear6.i1";
connectAttr "down_vis_condition.ocg" "multDoubleLinear6.i2";
connectAttr "multDoubleLinear4.o" "plusMinusAverage26.i1[0]";
connectAttr "multDoubleLinear13.o" "plusMinusAverage26.i1[1]";
connectAttr "multDoubleLinear11.o" "plusMinusAverage26.i1[2]";
connectAttr "multDoubleLinear63.o" "plusMinusAverage27.i1[0]";
connectAttr "multDoubleLinear14.o" "plusMinusAverage27.i1[1]";
connectAttr "multDoubleLinear12.o" "plusMinusAverage27.i1[2]";
connectAttr "multDoubleLinear19.o" "plusMinusAverage27.i1[3]";
connectAttr "unitConversion56.o" "multDoubleLinear13.i1";
connectAttr "unitConversion24.o" "multDoubleLinear14.i1";
connectAttr "l_brow_mid.rotateToMove" "multDoubleLinear14.i2";
connectAttr "unitConversion24.o" "multDoubleLinear16.i1";
connectAttr "multDoubleLinear1.o" "plusMinusAverage29.i1[0]";
connectAttr "multDoubleLinear18.o" "plusMinusAverage29.i1[1]";
connectAttr "multDoubleLinear16.o" "plusMinusAverage29.i1[2]";
connectAttr "l_brow_mid.rz" "unitConversion56.i";
connectAttr "unitConversion26.o" "multDoubleLinear17.i1";
connectAttr "l_brow_out.rotateToMove1" "multDoubleLinear17.i2";
connectAttr "unitConversion26.o" "multDoubleLinear18.i1";
connectAttr "l_brow_out.rotateToMove3" "multDoubleLinear18.i2";
connectAttr "unitConversion26.o" "multDoubleLinear19.i1";
connectAttr "l_brow_out.rotateToMove2" "multDoubleLinear19.i2";
connectAttr "unitConversion26.o" "multDoubleLinear22.i1";
connectAttr "l_brow_out.rotateToLength" "multDoubleLinear22.i2";
connectAttr "multMatrix58.o" "multMatrix51.i[0]";
connectAttr "composeMatrix4.omat" "multMatrix51.i[1]";
connectAttr "r_brow_in.rz" "unitConversion59.i";
connectAttr "up_down_setRange1.oy" "blendMatrix11.env";
connectAttr "l_brow_out_top.m" "blendMatrix11.tgt[0].tmat";
connectAttr "up_down_setRange1.oy" "blendMatrix12.env";
connectAttr "l_brow_mid_top.m" "blendMatrix12.tgt[0].tmat";
connectAttr "up_down_setRange1.oy" "blendMatrix13.env";
connectAttr "l_brow_in_top.m" "blendMatrix13.tgt[0].tmat";
connectAttr "up_down_setRange1.ox" "blendMatrix14.env";
connectAttr "l_brow_in_bot.m" "blendMatrix14.tgt[0].tmat";
connectAttr "up_down_setRange1.ox" "blendMatrix15.env";
connectAttr "l_brow_out_bot.m" "blendMatrix15.tgt[0].tmat";
connectAttr "up_down_setRange1.ox" "blendMatrix16.env";
connectAttr "l_brow_mid_bot.m" "blendMatrix16.tgt[0].tmat";
connectAttr "blendMatrix11.omat" "multMatrix52.i[0]";
connectAttr "blendMatrix15.omat" "multMatrix52.i[1]";
connectAttr "blendMatrix12.omat" "multMatrix53.i[0]";
connectAttr "blendMatrix16.omat" "multMatrix53.i[1]";
connectAttr "blendMatrix13.omat" "multMatrix54.i[0]";
connectAttr "blendMatrix14.omat" "multMatrix54.i[1]";
connectAttr "r_brow.ty" "up_down_setRange1.vx";
connectAttr "r_brow.ty" "up_down_setRange1.vy";
connectAttr "l_brow.upLimit" "up_down_setRange1.omy";
connectAttr "l_brow.downLimit" "up_down_setRange1.onx";
connectAttr "up_down_setRange1.oy" "blendColors3.b";
connectAttr "l_brow_local_1_top.t" "blendColors3.c1";
connectAttr "blendColors3.op" "plusMinusAverage37.i3[0]";
connectAttr "blendColors4.op" "plusMinusAverage37.i3[1]";
connectAttr "up_down_setRange1.ox" "blendColors4.b";
connectAttr "l_brow_local_1_bot.t" "blendColors4.c1";
connectAttr "up_down_setRange.oy" "blendColors8.b";
connectAttr "l_brow_local_3_top.t" "blendColors8.c1";
connectAttr "up_down_setRange.ox" "blendColors9.b";
connectAttr "l_brow_local_3_bot.t" "blendColors9.c1";
connectAttr "blendColors8.op" "plusMinusAverage39.i3[0]";
connectAttr "blendColors9.op" "plusMinusAverage39.i3[1]";
connectAttr "up_down_setRange.oy" "blendColors10.b";
connectAttr "l_brow_local_4_top.t" "blendColors10.c1";
connectAttr "up_down_setRange.ox" "blendColors11.b";
connectAttr "l_brow_local_4_bot.t" "blendColors11.c1";
connectAttr "blendColors10.op" "plusMinusAverage40.i3[0]";
connectAttr "blendColors11.op" "plusMinusAverage40.i3[1]";
connectAttr "up_down_setRange.oy" "blendColors12.b";
connectAttr "l_brow_local_5_top.t" "blendColors12.c1";
connectAttr "up_down_setRange.ox" "blendColors13.b";
connectAttr "l_brow_local_5_bot.t" "blendColors13.c1";
connectAttr "blendColors12.op" "plusMinusAverage41.i3[0]";
connectAttr "blendColors13.op" "plusMinusAverage41.i3[1]";
connectAttr "up_down_setRange.oy" "blendColors14.b";
connectAttr "l_brow_local_6_top.t" "blendColors14.c1";
connectAttr "up_down_setRange.ox" "blendColors15.b";
connectAttr "l_brow_local_6_bot.t" "blendColors15.c1";
connectAttr "blendColors14.op" "plusMinusAverage42.i3[0]";
connectAttr "blendColors15.op" "plusMinusAverage42.i3[1]";
connectAttr "up_down_setRange.oy" "blendColors16.b";
connectAttr "l_brow_local_7_top.t" "blendColors16.c1";
connectAttr "up_down_setRange.ox" "blendColors17.b";
connectAttr "l_brow_local_7_bot.t" "blendColors17.c1";
connectAttr "blendColors16.op" "plusMinusAverage43.i3[0]";
connectAttr "blendColors17.op" "plusMinusAverage43.i3[1]";
connectAttr "up_down_setRange1.oy" "blendColors18.b";
connectAttr "l_brow_local_2_top.t" "blendColors18.c1";
connectAttr "up_down_setRange1.ox" "blendColors19.b";
connectAttr "l_brow_local_2_bot.t" "blendColors19.c1";
connectAttr "blendColors18.op" "plusMinusAverage44.i3[0]";
connectAttr "blendColors19.op" "plusMinusAverage44.i3[1]";
connectAttr "up_down_setRange1.oy" "blendColors20.b";
connectAttr "l_brow_local_3_top.t" "blendColors20.c1";
connectAttr "up_down_setRange1.ox" "blendColors21.b";
connectAttr "l_brow_local_3_bot.t" "blendColors21.c1";
connectAttr "blendColors20.op" "plusMinusAverage45.i3[0]";
connectAttr "blendColors21.op" "plusMinusAverage45.i3[1]";
connectAttr "up_down_setRange1.oy" "blendColors22.b";
connectAttr "l_brow_local_4_top.t" "blendColors22.c1";
connectAttr "up_down_setRange1.ox" "blendColors23.b";
connectAttr "l_brow_local_4_bot.t" "blendColors23.c1";
connectAttr "blendColors22.op" "plusMinusAverage46.i3[0]";
connectAttr "blendColors23.op" "plusMinusAverage46.i3[1]";
connectAttr "up_down_setRange1.oy" "blendColors24.b";
connectAttr "l_brow_local_5_top.t" "blendColors24.c1";
connectAttr "up_down_setRange1.ox" "blendColors25.b";
connectAttr "l_brow_local_5_bot.t" "blendColors25.c1";
connectAttr "blendColors24.op" "plusMinusAverage47.i3[0]";
connectAttr "blendColors25.op" "plusMinusAverage47.i3[1]";
connectAttr "up_down_setRange1.oy" "blendColors26.b";
connectAttr "l_brow_local_6_top.t" "blendColors26.c1";
connectAttr "up_down_setRange1.ox" "blendColors27.b";
connectAttr "l_brow_local_6_bot.t" "blendColors27.c1";
connectAttr "blendColors26.op" "plusMinusAverage48.i3[0]";
connectAttr "blendColors27.op" "plusMinusAverage48.i3[1]";
connectAttr "plusMinusAverage51.o3" "plusMinusAverage50.i3[0]";
connectAttr "multiplyDivide41.o" "plusMinusAverage50.i3[1]";
connectAttr "l_brow.t" "plusMinusAverage51.i3[0]";
connectAttr "l_brow_in.t" "plusMinusAverage51.i3[1]";
connectAttr "r_brow_in.t" "plusMinusAverage52.i3[0]";
connectAttr "r_brow.t" "plusMinusAverage52.i3[1]";
connectAttr "plusMinusAverage52.o3" "multiplyDivide41.i1";
connectAttr "in_cluster4GroupId.msg" "in_cluster4Set.gn" -na;
connectAttr "in_mainPoserShape.iog.og[1]" "in_cluster4Set.dsm" -na;
connectAttr "in_mainPoser_clusterHandleCluster.msg" "in_cluster4Set.ub[0]";
connectAttr "in_cluster4GroupParts.og" "in_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "in_cluster4GroupId.id" "in_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "in_mainPoser_clusterHandle.wm" "in_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "in_mainPoser_clusterHandleShape.x" "in_mainPoser_clusterHandleCluster.x"
		;
connectAttr "in_tweak24.og[0]" "in_cluster4GroupParts.ig";
connectAttr "in_cluster4GroupId.id" "in_cluster4GroupParts.gi";
connectAttr "in_groupParts42.og" "in_tweak24.ip[0].ig";
connectAttr "in_groupId42.id" "in_tweak24.ip[0].gi";
connectAttr "in_groupId42.msg" "in_tweakSet24.gn" -na;
connectAttr "in_mainPoserShape.iog.og[2]" "in_tweakSet24.dsm" -na;
connectAttr "in_tweak24.msg" "in_tweakSet24.ub[0]";
connectAttr "in_mainPoserShapeOrig.ws" "in_groupParts42.ig";
connectAttr "in_groupId42.id" "in_groupParts42.gi";
connectAttr "in_mainPoser.globalSize" "in_mainPoser_size_multiplyDivide.i1x";
connectAttr "in_mainPoser.globalSize" "in_mainPoser_size_multiplyDivide.i1y";
connectAttr "in_mainPoser.globalSize" "in_mainPoser_size_multiplyDivide.i1z";
connectAttr "in_mainPoser.size" "in_mainPoser_size_multiplyDivide.i2x";
connectAttr "in_mainPoser.lineWidth" "in_mainPoser_size_multiplyDivide.i2y";
connectAttr "local_1_size_multDoubleLinear.o" "local_1_makeNurbSphere.r";
connectAttr "local_1_poser.size" "local_1_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_1_size_multDoubleLinear.i2";
connectAttr "local_2_size_multDoubleLinear.o" "local_2_makeNurbSphere.r";
connectAttr "local_2_poser.size" "local_2_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_2_size_multDoubleLinear.i2";
connectAttr "mid_cluster4GroupId.msg" "mid_cluster4Set.gn" -na;
connectAttr "mid_mainPoserShape.iog.og[1]" "mid_cluster4Set.dsm" -na;
connectAttr "mid_mainPoser_clusterHandleCluster.msg" "mid_cluster4Set.ub[0]";
connectAttr "mid_cluster4GroupParts.og" "mid_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "mid_cluster4GroupId.id" "mid_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "mid_mainPoser_clusterHandle.wm" "mid_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "mid_mainPoser_clusterHandleShape.x" "mid_mainPoser_clusterHandleCluster.x"
		;
connectAttr "mid_tweak24.og[0]" "mid_cluster4GroupParts.ig";
connectAttr "mid_cluster4GroupId.id" "mid_cluster4GroupParts.gi";
connectAttr "mid_groupParts42.og" "mid_tweak24.ip[0].ig";
connectAttr "mid_groupId42.id" "mid_tweak24.ip[0].gi";
connectAttr "mid_groupId42.msg" "mid_tweakSet24.gn" -na;
connectAttr "mid_mainPoserShape.iog.og[2]" "mid_tweakSet24.dsm" -na;
connectAttr "mid_tweak24.msg" "mid_tweakSet24.ub[0]";
connectAttr "mid_mainPoserShapeOrig.ws" "mid_groupParts42.ig";
connectAttr "mid_groupId42.id" "mid_groupParts42.gi";
connectAttr "mid_mainPoser.globalSize" "mid_mainPoser_size_multiplyDivide.i1x";
connectAttr "mid_mainPoser.globalSize" "mid_mainPoser_size_multiplyDivide.i1y";
connectAttr "mid_mainPoser.globalSize" "mid_mainPoser_size_multiplyDivide.i1z";
connectAttr "mid_mainPoser.size" "mid_mainPoser_size_multiplyDivide.i2x";
connectAttr "mid_mainPoser.lineWidth" "mid_mainPoser_size_multiplyDivide.i2y";
connectAttr "local_3_size_multDoubleLinear.o" "local_3_makeNurbSphere.r";
connectAttr "local_3_poser.size" "local_3_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_3_size_multDoubleLinear.i2";
connectAttr "local_4_size_multDoubleLinear.o" "local_4_makeNurbSphere.r";
connectAttr "local_4_poser.size" "local_4_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_4_size_multDoubleLinear.i2";
connectAttr "size_multiplyDivide.oy" "makeNurbSphere.r";
connectAttr "out_cluster4GroupId.msg" "out_cluster4Set.gn" -na;
connectAttr "out_mainPoserShape.iog.og[1]" "out_cluster4Set.dsm" -na;
connectAttr "out_mainPoser_clusterHandleCluster.msg" "out_cluster4Set.ub[0]";
connectAttr "out_cluster4GroupParts.og" "out_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "out_cluster4GroupId.id" "out_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "out_mainPoser_clusterHandle.wm" "out_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "out_mainPoser_clusterHandleShape.x" "out_mainPoser_clusterHandleCluster.x"
		;
connectAttr "out_tweak24.og[0]" "out_cluster4GroupParts.ig";
connectAttr "out_cluster4GroupId.id" "out_cluster4GroupParts.gi";
connectAttr "out_groupParts42.og" "out_tweak24.ip[0].ig";
connectAttr "out_groupId42.id" "out_tweak24.ip[0].gi";
connectAttr "out_groupId42.msg" "out_tweakSet24.gn" -na;
connectAttr "out_mainPoserShape.iog.og[2]" "out_tweakSet24.dsm" -na;
connectAttr "out_tweak24.msg" "out_tweakSet24.ub[0]";
connectAttr "out_mainPoserShapeOrig.ws" "out_groupParts42.ig";
connectAttr "out_groupId42.id" "out_groupParts42.gi";
connectAttr "out_mainPoser.globalSize" "out_mainPoser_size_multiplyDivide.i1x";
connectAttr "out_mainPoser.globalSize" "out_mainPoser_size_multiplyDivide.i1y";
connectAttr "out_mainPoser.globalSize" "out_mainPoser_size_multiplyDivide.i1z";
connectAttr "out_mainPoser.size" "out_mainPoser_size_multiplyDivide.i2x";
connectAttr "out_mainPoser.lineWidth" "out_mainPoser_size_multiplyDivide.i2y";
connectAttr "local_5_size_multDoubleLinear.o" "local_5_makeNurbSphere.r";
connectAttr "local_5_poser.size" "local_5_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_5_size_multDoubleLinear.i2";
connectAttr "local_6_size_multDoubleLinear.o" "local_6_makeNurbSphere.r";
connectAttr "local_6_poser.size" "local_6_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_6_size_multDoubleLinear.i2";
connectAttr "local_7_size_multDoubleLinear.o" "local_7_makeNurbSphere.r";
connectAttr "local_7_poser.size" "local_7_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_7_size_multDoubleLinear.i2";
connectAttr "center_size_multDoubleLinear.o" "center_makeNurbSphere.r";
connectAttr "center_poser.size" "center_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "center_size_multDoubleLinear.i2";
connectAttr "posers_curve_Shape1.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "posers_curve_Shape1.ws" "sweepMeshCreator1.inCurveArray[1]";
connectAttr "blinn1.oc" "blinn1SG.ss";
connectAttr "blinn1SG.msg" "materialInfo49.sg";
connectAttr "blinn1.msg" "materialInfo49.m";
connectAttr "local_8_size_multDoubleLinear.o" "local_8_makeNurbSphere.r";
connectAttr "local_8_poser.size" "local_8_size_multDoubleLinear.i1";
connectAttr "mainPoser.globalSize" "local_8_size_multDoubleLinear.i2";
connectAttr "center_poser.wm" "multMatrix55.i[0]";
connectAttr "mainPoser.wim" "multMatrix55.i[1]";
connectAttr "full_cluster4GroupId.msg" "full_cluster4Set.gn" -na;
connectAttr "full_mainPoserShape.iog.og[1]" "full_cluster4Set.dsm" -na;
connectAttr "full_mainPoser_clusterHandleCluster.msg" "full_cluster4Set.ub[0]";
connectAttr "full_cluster4GroupParts.og" "full_mainPoser_clusterHandleCluster.ip[0].ig"
		;
connectAttr "full_cluster4GroupId.id" "full_mainPoser_clusterHandleCluster.ip[0].gi"
		;
connectAttr "full_mainPoser_clusterHandle.wm" "full_mainPoser_clusterHandleCluster.ma"
		;
connectAttr "full_mainPoser_clusterHandleShape.x" "full_mainPoser_clusterHandleCluster.x"
		;
connectAttr "full_tweak24.og[0]" "full_cluster4GroupParts.ig";
connectAttr "full_cluster4GroupId.id" "full_cluster4GroupParts.gi";
connectAttr "full_groupParts42.og" "full_tweak24.ip[0].ig";
connectAttr "full_groupId42.id" "full_tweak24.ip[0].gi";
connectAttr "full_groupId42.msg" "full_tweakSet24.gn" -na;
connectAttr "full_mainPoserShape.iog.og[2]" "full_tweakSet24.dsm" -na;
connectAttr "full_tweak24.msg" "full_tweakSet24.ub[0]";
connectAttr "full_mainPoserShapeOrig.ws" "full_groupParts42.ig";
connectAttr "full_groupId42.id" "full_groupParts42.gi";
connectAttr "full_mainPoser.globalSize" "full_mainPoser_size_multiplyDivide.i1x"
		;
connectAttr "full_mainPoser.globalSize" "full_mainPoser_size_multiplyDivide.i1y"
		;
connectAttr "full_mainPoser.globalSize" "full_mainPoser_size_multiplyDivide.i1z"
		;
connectAttr "full_mainPoser.size" "full_mainPoser_size_multiplyDivide.i2x";
connectAttr "full_mainPoser.lineWidth" "full_mainPoser_size_multiplyDivide.i2y";
connectAttr "mid_mainPoser.wm" "multMatrix56.i[0]";
connectAttr "full_mainPoser.wim" "multMatrix56.i[1]";
connectAttr "full_mainPoser.wm" "multMatrix57.i[0]";
connectAttr "root_connector.wim" "multMatrix57.i[1]";
connectAttr "full_mainPoser.wm" "multMatrix58.i[0]";
connectAttr "mainPoser.wim" "multMatrix58.i[1]";
connectAttr "l_brow_local_1.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_local_2.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_local_3.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_local_4.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_local_5.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_local_6.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_local_7.iog" "l_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_1.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_2.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_3.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_4.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_5.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_6.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "r_brow_local_7.iog" "r_local_moduleControlSet.dsm" -na;
connectAttr "l_brow_in.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "l_brow_mid.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "l_brow_out.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "l_brow_last.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_last.iog" "l_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_in.iog" "r_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_mid.iog" "r_main_moduleControlSet.dsm" -na;
connectAttr "r_brow_out.iog" "r_main_moduleControlSet.dsm" -na;
connectAttr "l_main_moduleControlSet.msg" "l_moduleControlSet.dnsm" -na;
connectAttr "l_local_moduleControlSet.msg" "l_moduleControlSet.dnsm" -na;
connectAttr "r_local_moduleControlSet.msg" "r_moduleControlSet.dnsm" -na;
connectAttr "r_main_moduleControlSet.msg" "r_moduleControlSet.dnsm" -na;
connectAttr "local_1_poser.wm" "multMatrix59.i[0]";
connectAttr "in_mainPoser.wim" "multMatrix59.i[1]";
connectAttr "local_2_poser.wm" "multMatrix60.i[0]";
connectAttr "in_mainPoser.wim" "multMatrix60.i[1]";
connectAttr "plusMinusAverage24.o1" "multDoubleLinear42.i1";
connectAttr "r_brow_out.rz" "unitConversion86.i";
connectAttr "local_3_poser.wm" "multMatrix61.i[0]";
connectAttr "mid_mainPoser.wim" "multMatrix61.i[1]";
connectAttr "local_4_poser.wm" "multMatrix62.i[0]";
connectAttr "mid_mainPoser.wim" "multMatrix62.i[1]";
connectAttr "multDoubleLinear3.o" "multDoubleLinear63.i1";
connectAttr "local_5_poser.wm" "multMatrix63.i[0]";
connectAttr "out_mainPoser.wim" "multMatrix63.i[1]";
connectAttr "local_6_poser.wm" "multMatrix64.i[0]";
connectAttr "out_mainPoser.wim" "multMatrix64.i[1]";
connectAttr "local_7_poser.wm" "multMatrix65.i[0]";
connectAttr "out_mainPoser.wim" "multMatrix65.i[1]";
connectAttr "plusMinusAverage53.o1" "multDoubleLinear64.i1";
connectAttr "plusMinusAverage54.o1" "multDoubleLinear65.i1";
connectAttr "r_brow_mid.rz" "unitConversion87.i";
connectAttr "addDoubleLinear48.o" "plusMinusAverage53.i1[0]";
connectAttr "addDoubleLinear49.o" "plusMinusAverage53.i1[1]";
connectAttr "addDoubleLinear48.o" "plusMinusAverage54.i1[0]";
connectAttr "addDoubleLinear51.o" "plusMinusAverage54.i1[1]";
connectAttr "r_brow_mid.ty" "addDoubleLinear48.i1";
connectAttr "r_brow.ty" "addDoubleLinear48.i2";
connectAttr "r_brow_out.ty" "addDoubleLinear49.i1";
connectAttr "r_brow.ty" "addDoubleLinear49.i2";
connectAttr "r_brow_in.ty" "addDoubleLinear51.i1";
connectAttr "r_brow.ty" "addDoubleLinear51.i2";
connectAttr "multDoubleLinear65.o" "plusMinusAverage55.i1[0]";
connectAttr "multDoubleLinear73.o" "plusMinusAverage55.i1[1]";
connectAttr "multDoubleLinear69.o" "plusMinusAverage55.i1[2]";
connectAttr "multDoubleLinear84.o" "plusMinusAverage56.i1[0]";
connectAttr "multDoubleLinear74.o" "plusMinusAverage56.i1[1]";
connectAttr "multDoubleLinear70.o" "plusMinusAverage56.i1[2]";
connectAttr "multDoubleLinear79.o" "plusMinusAverage56.i1[3]";
connectAttr "plusMinusAverage54.o1" "multDoubleLinear67.i1";
connectAttr "unitConversion88.o" "multDoubleLinear68.i1";
connectAttr "l_brow_in.rotateToMove1" "multDoubleLinear68.i2";
connectAttr "r_brow_in.rz" "unitConversion88.i";
connectAttr "unitConversion88.o" "multDoubleLinear69.i1";
connectAttr "l_brow_in.rotateToMove3" "multDoubleLinear69.i2";
connectAttr "unitConversion88.o" "multDoubleLinear70.i1";
connectAttr "l_brow_in.rotateToMove4" "multDoubleLinear70.i2";
connectAttr "unitConversion88.o" "multDoubleLinear71.i1";
connectAttr "l_brow_in.rotateToMove2" "multDoubleLinear71.i2";
connectAttr "multDoubleLinear83.o" "multDoubleLinear72.i1";
connectAttr "r_brow_out.rz" "unitConversion89.i";
connectAttr "unitConversion90.o" "multDoubleLinear73.i1";
connectAttr "unitConversion87.o" "multDoubleLinear74.i1";
connectAttr "l_brow_mid.rotateToMove" "multDoubleLinear74.i2";
connectAttr "unitConversion90.o" "multDoubleLinear75.i1";
connectAttr "l_brow_mid.rotateToMove" "multDoubleLinear75.i2";
connectAttr "unitConversion87.o" "multDoubleLinear76.i1";
connectAttr "multDoubleLinear67.o" "plusMinusAverage57.i1[0]";
connectAttr "multDoubleLinear71.o" "plusMinusAverage57.i1[1]";
connectAttr "multDoubleLinear75.o" "plusMinusAverage57.i1[2]";
connectAttr "multDoubleLinear72.o" "plusMinusAverage58.i1[0]";
connectAttr "multDoubleLinear78.o" "plusMinusAverage58.i1[1]";
connectAttr "multDoubleLinear76.o" "plusMinusAverage58.i1[2]";
connectAttr "r_brow_mid.rz" "unitConversion90.i";
connectAttr "unitConversion89.o" "multDoubleLinear77.i1";
connectAttr "l_brow_out.rotateToMove1" "multDoubleLinear77.i2";
connectAttr "unitConversion89.o" "multDoubleLinear78.i1";
connectAttr "l_brow_out.rotateToMove3" "multDoubleLinear78.i2";
connectAttr "unitConversion89.o" "multDoubleLinear79.i1";
connectAttr "l_brow_out.rotateToMove2" "multDoubleLinear79.i2";
connectAttr "l_brow_in.rotateToLength" "multDoubleLinear80.i1";
connectAttr "unitConversion91.o" "multDoubleLinear80.i2";
connectAttr "r_brow_in.rz" "unitConversion91.i";
connectAttr "remapValue2.ov" "multDoubleLinear81.i1";
connectAttr "unitConversion89.o" "multDoubleLinear82.i1";
connectAttr "l_brow_out.rotateToLength" "multDoubleLinear82.i2";
connectAttr "multDoubleLinear82.o" "clamp18.ipr";
connectAttr "plusMinusAverage53.o1" "multDoubleLinear83.i1";
connectAttr "multDoubleLinear64.o" "multDoubleLinear84.i1";
connectAttr "local_8_poser.wm" "multMatrix66.i[0]";
connectAttr "root_poser.wim" "multMatrix66.i[1]";
connectAttr "multMatrix66.o" "multMatrix67.i[0]";
connectAttr "composeMatrix5.omat" "multMatrix67.i[1]";
connectAttr "brow_center.auto" "multiplyDivide42.i2x";
connectAttr "brow_center.auto" "multiplyDivide42.i2y";
connectAttr "brow_center.auto" "multiplyDivide42.i2z";
connectAttr "plusMinusAverage50.o3" "multiplyDivide42.i1";
connectAttr "l_brow_in.ty" "addDoubleLinear8.i1";
connectAttr "l_brow.ty" "addDoubleLinear8.i2";
connectAttr "l_brow_in.rz" "unitConversion54.i";
connectAttr "unitConversion54.o" "multDoubleLinear12.i1";
connectAttr "l_brow_in.rotateToMove4" "multDoubleLinear12.i2";
connectAttr "unitConversion54.o" "multDoubleLinear11.i1";
connectAttr "l_brow_in.rotateToMove3" "multDoubleLinear11.i2";
connectAttr "l_brow_in.rz" "unitConversion57.i";
connectAttr "remapValue1.ov" "multDoubleLinear21.i1";
connectAttr "l_brow_in.rotateToLength" "multDoubleLinear20.i1";
connectAttr "unitConversion58.o" "multDoubleLinear20.i2";
connectAttr "l_brow_in.rz" "unitConversion58.i";
connectAttr "multDoubleLinear2.o" "plusMinusAverage28.i1[0]";
connectAttr "multDoubleLinear9.o" "plusMinusAverage28.i1[1]";
connectAttr "multDoubleLinear15.o" "plusMinusAverage28.i1[2]";
connectAttr "plusMinusAverage25.o1" "multDoubleLinear2.i1";
connectAttr "addDoubleLinear2.o" "multDoubleLinear2.i2";
connectAttr "addDoubleLinear2.o" "multDoubleLinear5.i1";
connectAttr "unitConversion54.o" "multDoubleLinear9.i1";
connectAttr "l_brow_in.rotateToMove2" "multDoubleLinear9.i2";
connectAttr "unitConversion56.o" "multDoubleLinear15.i1";
connectAttr "l_brow_mid.rotateToMove" "multDoubleLinear15.i2";
connectAttr "blendColors6.op" "plusMinusAverage38.i3[0]";
connectAttr "blendColors7.op" "plusMinusAverage38.i3[1]";
connectAttr "up_down_setRange.oy" "blendColors6.b";
connectAttr "l_brow_local_2_top.t" "blendColors6.c1";
connectAttr "up_down_setRange.ox" "blendColors7.b";
connectAttr "l_brow_local_2_bot.t" "blendColors7.c1";
connectAttr "unitConversion54.o" "multDoubleLinear7.i1";
connectAttr "l_brow_in.rotateToMove1" "multDoubleLinear7.i2";
connectAttr "blendColors1.op" "plusMinusAverage30.i3[0]";
connectAttr "blendColors2.op" "plusMinusAverage30.i3[1]";
connectAttr "up_down_setRange.oy" "blendColors1.b";
connectAttr "l_brow_local_1_top.t" "blendColors1.c1";
connectAttr "up_down_setRange.ox" "blendColors2.b";
connectAttr "l_brow_local_1_bot.t" "blendColors2.c1";
connectAttr "multDoubleLinear20.o" "remapValue1.i";
connectAttr "multDoubleLinear80.o" "remapValue2.i";
connectAttr "multDoubleLinear22.o" "remapValue3.i";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_8_poser.wm" "multMatrix68.i[0]";
connectAttr "full_mainPoser.wim" "multMatrix68.i[1]";
connectAttr "center_joint.wm" "multMatrix69.i[0]";
connectAttr "root_outJoint.wim" "multMatrix69.i[1]";
connectAttr "multMatrix69.o" "decomposeMatrix1.imat";
connectAttr "plusMinusAverage59.o3x" "setRange16.vx";
connectAttr "plusMinusAverage59.o3y" "setRange16.vy";
connectAttr "plusMinusAverage59.o3z" "setRange16.vz";
connectAttr "l_brow.upLimit" "setRange16.omx";
connectAttr "l_brow.upLimit" "setRange16.omy";
connectAttr "l_brow.upLimit" "setRange16.omz";
connectAttr "l_brow.ty" "plusMinusAverage59.i3[0].i3x";
connectAttr "l_brow.ty" "plusMinusAverage59.i3[0].i3y";
connectAttr "l_brow.ty" "plusMinusAverage59.i3[0].i3z";
connectAttr "l_brow_in.ty" "plusMinusAverage59.i3[1].i3x";
connectAttr "l_brow_mid.ty" "plusMinusAverage59.i3[1].i3y";
connectAttr "l_brow_out.ty" "plusMinusAverage59.i3[1].i3z";
connectAttr "plusMinusAverage59.o3x" "setRange17.vx";
connectAttr "plusMinusAverage59.o3y" "setRange17.vy";
connectAttr "plusMinusAverage59.o3z" "setRange17.vz";
connectAttr "l_brow.downLimit" "setRange17.onx";
connectAttr "l_brow.downLimit" "setRange17.ony";
connectAttr "l_brow.downLimit" "setRange17.onz";
connectAttr "plusMinusAverage60.o3x" "setRange18.vx";
connectAttr "plusMinusAverage60.o3y" "setRange18.vy";
connectAttr "plusMinusAverage60.o3z" "setRange18.vz";
connectAttr "l_brow.upLimit" "setRange18.omx";
connectAttr "l_brow.upLimit" "setRange18.omy";
connectAttr "l_brow.upLimit" "setRange18.omz";
connectAttr "r_brow.ty" "plusMinusAverage60.i3[0].i3x";
connectAttr "r_brow.ty" "plusMinusAverage60.i3[0].i3y";
connectAttr "r_brow.ty" "plusMinusAverage60.i3[0].i3z";
connectAttr "r_brow_in.ty" "plusMinusAverage60.i3[1].i3x";
connectAttr "r_brow_mid.ty" "plusMinusAverage60.i3[1].i3y";
connectAttr "r_brow_out.ty" "plusMinusAverage60.i3[1].i3z";
connectAttr "plusMinusAverage60.o3x" "setRange19.vx";
connectAttr "plusMinusAverage60.o3y" "setRange19.vy";
connectAttr "plusMinusAverage60.o3z" "setRange19.vz";
connectAttr "l_brow.downLimit" "setRange19.onx";
connectAttr "l_brow.downLimit" "setRange19.ony";
connectAttr "l_brow.downLimit" "setRange19.onz";
connectAttr "l_brow_local_7_rotateOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "remapValue3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "l_brow_out.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "multDoubleLinear22.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "skinJointsSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "unitConversion26.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "plusMinusAverage60.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "setRange17.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "setRange18.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn";
connectAttr "setRange19.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn";
connectAttr "plusMinusAverage59.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "plusMinusAverage48.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "blendColors1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn";
connectAttr "addDoubleLinear48.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[7].dn"
		;
connectAttr "plusMinusAverage53.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[8].dn"
		;
connectAttr "r_brow_mid_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[9].dn"
		;
connectAttr "multDoubleLinear6.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[10].dn"
		;
connectAttr "l_brow_local_5_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[11].dn"
		;
connectAttr "l_curve9_2_loc_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[12].dn"
		;
connectAttr "blendColors12.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[13].dn";
connectAttr "l_brow_out_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[14].dn";
connectAttr "multMatrix49.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[15].dn";
connectAttr "plusMinusAverage51.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[16].dn"
		;
connectAttr "blendMatrix13.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[17].dn";
connectAttr "multDoubleLinear3.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[18].dn"
		;
connectAttr "plusMinusAverage57.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[19].dn"
		;
connectAttr "plusMinusAverage43.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[20].dn"
		;
connectAttr "r_brow_local_4_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[21].dn"
		;
connectAttr "blendColors17.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[22].dn";
connectAttr "l_brow_local_6_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[23].dn"
		;
connectAttr "l_brow_local_6Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[24].dn"
		;
connectAttr "r_brow_local_2_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[25].dn"
		;
connectAttr "multMatrix50.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[26].dn";
connectAttr "plusMinusAverage29.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[27].dn"
		;
connectAttr "addDoubleLinear8.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[28].dn"
		;
connectAttr "blendColors22.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[29].dn";
connectAttr "l_brow_local_2_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[30].dn"
		;
connectAttr "blendColors25.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[31].dn";
connectAttr "blendMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[32].dn";
connectAttr "l_brow_local_2_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[33].dn"
		;
connectAttr "l_brow_local_5Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[34].dn"
		;
connectAttr "brow_center_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[35].dn"
		;
connectAttr "blendColors23.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[36].dn";
connectAttr "l_brow_in_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[37].dn"
		;
connectAttr "multDoubleLinear64.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[38].dn"
		;
connectAttr "r_brow_in_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[39].dn"
		;
connectAttr "blendMatrix11.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[40].dn";
connectAttr "l_curve9_5_loc_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[41].dn"
		;
connectAttr "blendMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[42].dn";
connectAttr "l_brow_local_5_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[43].dn"
		;
connectAttr "down_vis_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[44].dn"
		;
connectAttr "r_brow_out_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[45].dn"
		;
connectAttr "blendColors19.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[46].dn";
connectAttr "r_brow_local_3_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[47].dn"
		;
connectAttr "plusMinusAverage25.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[48].dn"
		;
connectAttr "l_brow_local_3Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[49].dn"
		;
connectAttr "plusMinusAverage46.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[50].dn"
		;
connectAttr "multMatrix53.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[51].dn";
connectAttr "plusMinusAverage56.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[52].dn"
		;
connectAttr "l_brow_local_4_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[53].dn"
		;
connectAttr "up_down_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[54].dn"
		;
connectAttr "multDoubleLinear84.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[55].dn"
		;
connectAttr "l_brow_local_4_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[56].dn"
		;
connectAttr "plusMinusAverage42.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[57].dn"
		;
connectAttr "l_brow_local_7_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[58].dn"
		;
connectAttr "blendColors27.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[59].dn";
connectAttr "blendMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[60].dn";
connectAttr "l_brow_local_1_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[61].dn"
		;
connectAttr "l_browShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[62].dn";
connectAttr "blendColors10.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[63].dn";
connectAttr "l_brow_local_2Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[64].dn"
		;
connectAttr "plusMinusAverage27.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[65].dn"
		;
connectAttr "blendColors18.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[66].dn";
connectAttr "plusMinusAverage52.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[67].dn"
		;
connectAttr "blendColors2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[68].dn";
connectAttr "l_curve9_3_loc_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[69].dn"
		;
connectAttr "l_brow.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[70].dn";
connectAttr "blendColors9.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[71].dn";
connectAttr "multDoubleLinear42.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[72].dn"
		;
connectAttr "blendColors24.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[73].dn";
connectAttr "blendColors7.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[74].dn";
connectAttr "blendColors13.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[75].dn";
connectAttr "blendColors4.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[76].dn";
connectAttr "plusMinusAverage41.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[77].dn"
		;
connectAttr "l_brow_mid_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[78].dn"
		;
connectAttr "blendColors21.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[79].dn";
connectAttr "multDoubleLinear72.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[80].dn"
		;
connectAttr "blendColors20.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[81].dn";
connectAttr "l_brow_local_2_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[82].dn"
		;
connectAttr "plusMinusAverage28.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[83].dn"
		;
connectAttr "multiplyDivide41.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[84].dn"
		;
connectAttr "plusMinusAverage45.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[85].dn"
		;
connectAttr "l_brow_mid_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[86].dn";
connectAttr "plusMinusAverage58.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[87].dn"
		;
connectAttr "addDoubleLinear49.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[88].dn"
		;
connectAttr "blendMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[89].dn";
connectAttr "l_brow_local_3_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[90].dn"
		;
connectAttr "blendMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[91].dn";
connectAttr "multDoubleLinear1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[92].dn"
		;
connectAttr "l_brow_local_6_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[93].dn"
		;
connectAttr "l_brow_midShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[94].dn"
		;
connectAttr "blendMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[95].dn";
connectAttr "multMatrix52.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[96].dn";
connectAttr "up_vis_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[97].dn"
		;
connectAttr "addDoubleLinear10.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[98].dn"
		;
connectAttr "plusMinusAverage54.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[99].dn"
		;
connectAttr "l_brow_local_4_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[100].dn"
		;
connectAttr "plusMinusAverage30.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[101].dn"
		;
connectAttr "plusMinusAverage37.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[102].dn"
		;
connectAttr "r_brow_local_6_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[103].dn"
		;
connectAttr "plusMinusAverage44.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[104].dn"
		;
connectAttr "r_curve9_3_loc_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[105].dn"
		;
connectAttr "l_brow_in_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[106].dn";
connectAttr "plusMinusAverage26.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[107].dn"
		;
connectAttr "multDoubleLinear65.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[108].dn"
		;
connectAttr "r_brow_local_5_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[109].dn"
		;
connectAttr "l_brow_local_3_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[110].dn"
		;
connectAttr "multDoubleLinear4.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[111].dn"
		;
connectAttr "blendMatrix12.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[112].dn";
connectAttr "r_curve9_2_loc_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[113].dn"
		;
connectAttr "l_brow_local_7Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[114].dn"
		;
connectAttr "blendColors11.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[115].dn";
connectAttr "r_curve9_5_loc_moveOffset.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[116].dn"
		;
connectAttr "l_brow_local_7_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[117].dn"
		;
connectAttr "blendMatrix16.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[118].dn";
connectAttr "l_brow_out_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[119].dn"
		;
connectAttr "blendColors8.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[120].dn";
connectAttr "multDoubleLinear83.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[121].dn"
		;
connectAttr "multMatrix54.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[122].dn";
connectAttr "l_brow_local_4_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[123].dn"
		;
connectAttr "r_brow.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[124].dn";
connectAttr "plusMinusAverage47.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[125].dn"
		;
connectAttr "blendColors15.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[126].dn";
connectAttr "l_brow_local_7_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[127].dn"
		;
connectAttr "blendColors26.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[128].dn";
connectAttr "multMatrix48.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[129].dn";
connectAttr "l_brow_in_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[130].dn";
connectAttr "plusMinusAverage40.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[131].dn"
		;
connectAttr "plusMinusAverage24.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[132].dn"
		;
connectAttr "r_brow_local_1_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[133].dn"
		;
connectAttr "blendColors6.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[134].dn";
connectAttr "blendMatrix5.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[135].dn";
connectAttr "l_brow_in_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[136].dn"
		;
connectAttr "up_down_setRange1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[137].dn"
		;
connectAttr "blendColors3.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[138].dn";
connectAttr "l_brow_local_4Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[139].dn"
		;
connectAttr "multDoubleLinear2.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[140].dn"
		;
connectAttr "multiplyDivide42.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[141].dn"
		;
connectAttr "multDoubleLinear63.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[142].dn"
		;
connectAttr "plusMinusAverage50.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[143].dn"
		;
connectAttr "plusMinusAverage39.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[144].dn"
		;
connectAttr "addDoubleLinear9.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[145].dn"
		;
connectAttr "l_brow_local_3_group_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[146].dn"
		;
connectAttr "l_brow_mid_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[147].dn"
		;
connectAttr "blendColors14.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[148].dn";
connectAttr "plusMinusAverage38.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[149].dn"
		;
connectAttr "l_brow_local_5_bot.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[150].dn"
		;
connectAttr "addDoubleLinear51.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[151].dn"
		;
connectAttr "l_brow_out_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[152].dn"
		;
connectAttr "setRange16.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[153].dn";
connectAttr "r_brow_local_4_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[154].dn"
		;
connectAttr "l_brow_out_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[155].dn"
		;
connectAttr "plusMinusAverage55.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[156].dn"
		;
connectAttr "blendMatrix15.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[157].dn";
connectAttr "l_brow_local_6_top.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[158].dn"
		;
connectAttr "multDoubleLinear67.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[159].dn"
		;
connectAttr "l_brow_local_1Shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[160].dn"
		;
connectAttr "blendColors16.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[161].dn";
connectAttr "black_rsSG.pa" ":renderPartition.st" -na;
connectAttr "green_rsSG.pa" ":renderPartition.st" -na;
connectAttr "blue_rsSG.pa" ":renderPartition.st" -na;
connectAttr "red_rsSG.pa" ":renderPartition.st" -na;
connectAttr "lambert1SG.pa" ":renderPartition.st" -na;
connectAttr "center_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "center_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "center_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_1_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "side_1_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "side_1_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_2_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "side_2_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "side_2_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader3SG.pa" ":renderPartition.st" -na;
connectAttr "side_3_surfaceShader1SG1.pa" ":renderPartition.st" -na;
connectAttr "char_basicSG.pa" ":renderPartition.st" -na;
connectAttr "pasted__lambert1SG.pa" ":renderPartition.st" -na;
connectAttr "pasted__lambert1SG1.pa" ":renderPartition.st" -na;
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "char_basic.msg" ":defaultShaderList1.s" -na;
connectAttr "blinn1.msg" ":defaultShaderList1.s" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "composeMatrix2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix33.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide32.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pasted__multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pasted__multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pasted__clamp1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix20.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide27.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide28.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide29.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage21.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix42.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix44.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix45.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide33.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide34.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide35.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide36.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide37.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide38.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide39.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide40.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange_top_up.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "setRange15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "in_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mid_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "out_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "full_mainPoser_size_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "remapValue1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix69.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=NodeProfileStruct:string=NodeProfileTag:int32=NodeProfileTagColor";
// End of browsCurved.ma
