//Maya ASCII 2022 scene
//Name: birdTail.ma
//Last modified: Tue, Sep 29, 2026 10:21:51 AM
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
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26200)";
fileInfo "UUID" "24C041C8-4725-C8A3-AA3A-48BA78BD589D";
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
	rename -uid "A8BA2DF8-4644-AC90-342E-A79E00D060D2";
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
	rename -uid "56B33753-40D8-0C77-D25F-3EB7AD02111C";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "m_feather_mainPoserShapeOrig" -p "m_feather_mainPoser";
	rename -uid "790F2DE3-43B4-BE94-99E4-39B01A539535";
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
	rename -uid "836B4CE4-43F2-B4CC-ADC6-28989A381A9B";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "m_feather_mainPoser_clusterHandleShape" -p "m_feather_mainPoser_clusterHandle";
	rename -uid "B93CCCED-4983-AD7C-4D5A-F0B39194472A";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "m_feather_1_poser" -p "m_feather_mainPoser";
	rename -uid "4538E99B-4609-ED9F-6AB3-6ABA4AF73BA8";
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
	rename -uid "3604E662-460B-060D-E293-5EBF44198A91";
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
	rename -uid "6368FD81-4FCF-2E3C-C14C-E4B9C375FC3C";
createNode locator -n "m_feather_1_poserOrientShape" -p "m_feather_1_poserOrient";
	rename -uid "59FD2A09-439E-124F-F6BE-03BFD99FB826";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_1_initLoc" -p "m_feather_1_poserOrient";
	rename -uid "692924B8-4AD5-1711-6692-ACB177390A21";
	setAttr ".v" no;
createNode locator -n "m_feather_1_initLocShape" -p "m_feather_1_initLoc";
	rename -uid "821DAB97-41C5-900B-EBC5-368CC7958F8C";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_1_poserOrient_aimConstraint1" -p "m_feather_1_poserOrient";
	rename -uid "47C4B527-436F-D62F-BF4E-AF9F83ACA554";
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
	rename -uid "70E9FC57-4285-A8CA-1EE8-A4B4ECB7F6D9";
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
	rename -uid "6E87524E-4C07-D607-9AAB-7F9A8CF80F7E";
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
	rename -uid "1A4A3626-4D16-75F2-B651-B99FF1EB3A7E";
createNode locator -n "m_feather_2_poserOrientShape" -p "m_feather_2_poserOrient";
	rename -uid "84E2AE4C-47C2-B4A0-1CEB-C6A64EE7740D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_2_initLoc" -p "m_feather_2_poserOrient";
	rename -uid "64883E4E-45D9-BFFF-1CB7-2FA709975331";
	setAttr ".v" no;
createNode locator -n "m_feather_2_initLocShape" -p "m_feather_2_initLoc";
	rename -uid "E027D729-4952-53A3-458E-8693A2F14244";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_2_poserOrient_aimConstraint1" -p "m_feather_2_poserOrient";
	rename -uid "17E57870-4290-04A0-DA1F-59B12357E47E";
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
	rename -uid "792E4CE8-42B8-48F2-3CB6-E9BD6C4EEBE8";
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
	rename -uid "AFEFFF01-4EC0-EDB4-BCE5-E3B08A87527B";
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
	rename -uid "9708B3C4-4A3C-9BD6-7534-7FABC407A2DB";
createNode locator -n "m_feather_3_poserOrientShape" -p "m_feather_3_poserOrient";
	rename -uid "9A6EF47F-4E16-85C2-4E1E-E2A82F2F3D44";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_3_initLoc" -p "m_feather_3_poserOrient";
	rename -uid "9997E4AA-4479-CB0F-EA29-EA9C3775D069";
	setAttr ".v" no;
createNode locator -n "m_feather_3_initLocShape" -p "m_feather_3_initLoc";
	rename -uid "320A5638-45C4-7727-521A-6D8F3E71C6C3";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_3_poserOrient_aimConstraint1" -p "m_feather_3_poserOrient";
	rename -uid "4045F3E6-4ADC-954F-905E-5D80484626D6";
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
	rename -uid "F867FE2D-46AD-2E5E-0846-8C8BBF3BAFD1";
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
	rename -uid "D4B184FC-4031-DB86-342B-ACAE161F63A6";
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
	rename -uid "C232616A-49B3-C979-BA08-DAB91CB4EB52";
createNode locator -n "m_feather_4_poserOrientShape" -p "m_feather_4_poserOrient";
	rename -uid "AB772180-4297-7517-C2A9-E2BC8292E2E3";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_4_initLoc" -p "m_feather_4_poserOrient";
	rename -uid "692EE9D8-49E2-01E0-B1F5-46AB6F91B44B";
	setAttr ".v" no;
createNode locator -n "m_feather_4_initLocShape" -p "m_feather_4_initLoc";
	rename -uid "76455FE2-4A2F-5B7F-6857-C0A4AEF403FC";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_4_poserOrient_aimConstraint1" -p "m_feather_4_poserOrient";
	rename -uid "FA3196F8-4A7C-3683-DAF1-D7B270DC88B3";
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
	rename -uid "DD1AD8DE-4AEC-DC4A-3006-73A0D20F2207";
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
	rename -uid "4A445512-49DF-7BF0-D8BA-439A18B98408";
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
	rename -uid "74363897-4F20-7221-C044-64ACB5F6828E";
createNode locator -n "m_feather_5_poserOrientShape" -p "m_feather_5_poserOrient";
	rename -uid "1ADEA49E-4284-1836-DE52-53BA2F1B7EC0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_5_initLoc" -p "m_feather_5_poserOrient";
	rename -uid "338C434C-4BF0-44C1-84CC-D4B52ED5B8FA";
	setAttr ".v" no;
createNode locator -n "m_feather_5_initLocShape" -p "m_feather_5_initLoc";
	rename -uid "1F3EAEA1-4E51-48BD-B45F-F590B1374A48";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_5_poserOrient_aimConstraint1" -p "m_feather_5_poserOrient";
	rename -uid "E587B792-49EA-614C-6B27-10BDB36F48B4";
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
	rename -uid "CD463EA5-4161-84A2-9667-D4A42F9B4971";
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
	rename -uid "2B13D708-4787-742E-76B3-CB9A13B1A1E0";
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
	rename -uid "A4CBDC67-4DE4-245D-48C9-C79CD70A1E2F";
createNode locator -n "m_feather_end_poserOrientShape" -p "m_feather_end_poserOrient";
	rename -uid "06E8C574-48A4-249C-DD91-9C9F8494AC74";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "m_feather_end_initLoc" -p "m_feather_end_poserOrient";
	rename -uid "2F507E33-4D71-AAC5-43F3-4283285F1EA7";
	setAttr ".v" no;
createNode locator -n "m_feather_end_initLocShape" -p "m_feather_end_initLoc";
	rename -uid "7594B56D-48FB-A2AD-AA30-B58C4FBEE3FA";
	setAttr -k off ".v";
createNode aimConstraint -n "m_feather_end_poserOrient_aimConstraint1" -p "m_feather_end_poserOrient";
	rename -uid "637F2450-483C-32AC-9F4C-B09D177A36C5";
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
	rename -uid "64130D5B-4609-0700-6E0C-0A9E86A56DD4";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 1.1148928283954327 -0.29112717557339224 0 ;
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
	rename -uid "754CB3DD-4F5A-59F3-A200-B6B54A9450C2";
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
	rename -uid "17759D00-42F9-910C-1DAC-47977DA44EB0";
createNode locator -n "main_1_poserOrientShape" -p "main_1_poserOrient";
	rename -uid "669DED68-4C6B-F574-206A-5CB732F1EBAB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_1_initLoc" -p "main_1_poserOrient";
	rename -uid "824C655C-41BA-A514-1127-1A85C9B9FD26";
	setAttr ".v" no;
createNode locator -n "main_1_initLocShape" -p "main_1_initLoc";
	rename -uid "081F0F23-4BC0-AD8D-09EC-C0BF26F6DA0F";
	setAttr -k off ".v";
createNode orientConstraint -n "main_1_poserOrient_orientConstraint1" -p "main_1_poserOrient";
	rename -uid "67B4E231-4BE0-70E0-4E5E-299F8C0685D0";
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
	rename -uid "6264CB3D-4853-5CCD-716C-EBA3A31A39B4";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 2.2310192549387975 -0.39596330649684341 0 ;
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
	rename -uid "587237AE-4A97-F44C-2DB6-3094D35595EE";
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
	rename -uid "84C6CDB8-4B59-2542-A07F-5ABB7D19959A";
createNode locator -n "main_2_poserOrientShape" -p "main_2_poserOrient";
	rename -uid "CB7CA602-4207-DB21-9DC1-3CBA615C08B4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_2_initLoc" -p "main_2_poserOrient";
	rename -uid "6778A6AB-4E4B-D03B-D604-1B89EDBE53D3";
	setAttr ".v" no;
createNode locator -n "main_2_initLocShape" -p "main_2_initLoc";
	rename -uid "4B3AB024-482D-F781-6CAB-7E896630976D";
	setAttr -k off ".v";
createNode orientConstraint -n "main_2_poserOrient_orientConstraint1" -p "main_2_poserOrient";
	rename -uid "397BA2C6-439D-2D72-5463-59BEC37B6A2B";
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
	rename -uid "65914DCE-418C-D8EB-600C-45A86DB070A3";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 3.4346740248298291 -0.51392973095722816 0 ;
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
	rename -uid "B371F254-4583-D664-D1FE-2DBBBE4660F6";
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
	rename -uid "21C9A388-4379-B2A2-993A-30BD72EEF7F6";
createNode locator -n "main_3_poserOrientShape" -p "main_3_poserOrient";
	rename -uid "0F57D9DF-4E1D-EBF5-7DAB-C4BF7F25F6D5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_3_initLoc" -p "main_3_poserOrient";
	rename -uid "3DE077D3-4488-9BE7-BD67-C7A8F92D9A33";
	setAttr ".v" no;
createNode locator -n "main_3_initLocShape" -p "main_3_initLoc";
	rename -uid "1EF6B219-45D5-A2E5-BF71-48913C7ABEA3";
	setAttr -k off ".v";
createNode orientConstraint -n "main_3_poserOrient_orientConstraint1" -p "main_3_poserOrient";
	rename -uid "968E9E8C-4040-B445-803A-9C9FABEB821B";
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
	rename -uid "A91F4D41-4F10-16B7-FD89-99BA37184DD0";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".t" -type "double3" 4.6304196199354655 -0.64396633613616983 0 ;
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
	rename -uid "A25AD786-42D8-0668-0AD7-43BCFC29E116";
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
	rename -uid "DF0DD625-4590-2D67-C50D-F79836DB68D5";
createNode locator -n "main_4_poserOrientShape" -p "main_4_poserOrient";
	rename -uid "4328E86C-45FE-0639-96AC-9D928A5B2E6E";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "main_4_initLoc" -p "main_4_poserOrient";
	rename -uid "65EBD4D9-485B-7C59-C6C2-2097C90630EF";
	setAttr ".v" no;
createNode locator -n "main_4_initLocShape" -p "main_4_initLoc";
	rename -uid "06B4CB92-4252-6FBE-27E6-A2BE65C8408C";
	setAttr -k off ".v";
createNode orientConstraint -n "main_4_poserOrient_orientConstraint1" -p "main_4_poserOrient";
	rename -uid "A049577A-4E56-ABFF-1387-3D89C4FAE17F";
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
	rename -uid "F03BECBB-4AB6-A4D1-EB40-7987FFC6377D";
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
	rename -uid "212A1F74-4141-9A47-0415-86966D37BCA6";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_1_mainPoserShapeOrig" -p "l_feather_1_mainPoser";
	rename -uid "19274DB3-42B7-E64D-9A6A-EC8F9D8F0805";
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
	rename -uid "34D26DE0-4677-4ECF-9BC1-E1947D355243";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_1_mainPoser_clusterHandleShape" -p "l_feather_1_mainPoser_clusterHandle";
	rename -uid "53B17D34-460E-722D-5C43-36BDCEB5F373";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_1_1_poser" -p "l_feather_1_mainPoser";
	rename -uid "FC87D37E-424E-6918-877A-35B2041515D6";
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
	rename -uid "96982470-4657-062A-9DD0-1899DD40F46B";
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
	rename -uid "6816B641-4E18-3BE0-23BF-1CA3D59F34B1";
createNode locator -n "l_feather_1_1_poserOrientShape" -p "l_feather_1_1_poserOrient";
	rename -uid "4F3E41F1-4C83-63CD-4BDD-3EACB6C422A0";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_1_initLoc" -p "l_feather_1_1_poserOrient";
	rename -uid "E4E6E95E-40A1-3ED0-DB0E-18B75394559D";
	setAttr ".v" no;
createNode locator -n "l_feather_1_1_initLocShape" -p "l_feather_1_1_initLoc";
	rename -uid "889B144A-4A46-64A2-4FCF-60A1DBEBAED0";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_1_poserOrient_aimConstraint1" -p "l_feather_1_1_poserOrient";
	rename -uid "1F943039-469A-4AA7-A3D7-3C8067D9821C";
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
	rename -uid "D3D1EA81-48F1-D264-FD6B-B48C21378AC4";
	setAttr ".v" no;
createNode locator -n "l_feather_1_1_fanLocShape" -p "l_feather_1_1_fanLoc";
	rename -uid "8E364494-4AA9-A6B9-0F6E-71B207E08A3B";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_1_fanLoc_aimConstraint1" -p "l_feather_1_1_fanLoc";
	rename -uid "5F3ADE73-42A2-D80F-7AE4-D9BC0D6B96AC";
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
	rename -uid "14CAF39C-437A-16A8-4525-CEB552BDCA5B";
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
	rename -uid "ECF46FEC-4A19-30DB-29F7-45927F7C027B";
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
	rename -uid "E38B0B1A-4312-0706-08D8-37A252D2879A";
createNode locator -n "l_feather_1_2_poserOrientShape" -p "l_feather_1_2_poserOrient";
	rename -uid "51514AA9-47C2-D0CC-2E97-D9B65ABEDBF5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_2_initLoc" -p "l_feather_1_2_poserOrient";
	rename -uid "765ACF55-46A2-DBAC-A515-87B47C801BBB";
	setAttr ".v" no;
createNode locator -n "l_feather_1_2_initLocShape" -p "l_feather_1_2_initLoc";
	rename -uid "5C00B898-41AE-631C-3494-A38797AF0FD0";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_2_poserOrient_aimConstraint1" -p "l_feather_1_2_poserOrient";
	rename -uid "C9A0496E-44AB-7E51-2FF2-75999145D20C";
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
	rename -uid "AC5A157B-459A-6828-E8A8-48AC24A98022";
	setAttr ".v" no;
createNode locator -n "l_feather_1_2_fanLocShape" -p "l_feather_1_2_fanLoc";
	rename -uid "845561D1-43A7-C295-F340-7B9C55404384";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_2_fanLoc_aimConstraint1" -p "l_feather_1_2_fanLoc";
	rename -uid "18E5B211-49FA-84D9-A3E8-6BB80F20A8D4";
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
	rename -uid "F6243197-475E-4D26-7699-7FA7ED14831A";
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
	rename -uid "2C82DF41-4F97-1F02-273C-D6B5B36D7F43";
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
	rename -uid "9F96BA46-4663-0B86-2D1A-31995F589286";
createNode locator -n "l_feather_1_3_poserOrientShape" -p "l_feather_1_3_poserOrient";
	rename -uid "F9096B50-4B00-1FCD-9541-2B976933CD64";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_3_initLoc" -p "l_feather_1_3_poserOrient";
	rename -uid "A773DCF2-49F3-14B0-5DBD-95BC322F7532";
	setAttr ".v" no;
createNode locator -n "l_feather_1_3_initLocShape" -p "l_feather_1_3_initLoc";
	rename -uid "891239FD-4070-CB85-8AC5-A3ABBFB4880D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_3_poserOrient_aimConstraint1" -p "l_feather_1_3_poserOrient";
	rename -uid "25FE3BC9-46B1-4D83-A022-BC9DF229F415";
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
	rename -uid "47B5FAB0-446B-77A3-FF00-E4A28F474FB1";
	setAttr ".v" no;
createNode locator -n "l_feather_1_3_fanLocShape" -p "l_feather_1_3_fanLoc";
	rename -uid "019F4C67-4528-1EDA-D1AF-1E8105C438A1";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_3_fanLoc_aimConstraint1" -p "l_feather_1_3_fanLoc";
	rename -uid "5C3E56F2-48F0-45C7-4DBB-6B869B5CAB2F";
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
	rename -uid "5D3B7D96-4203-F4D9-A265-09BFFE99A2DD";
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
	rename -uid "B475A26E-464E-C773-AE71-D791580AE837";
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
	rename -uid "BD988381-468D-17F0-62EA-B38BF3C3F815";
createNode locator -n "l_feather_1_4_poserOrientShape" -p "l_feather_1_4_poserOrient";
	rename -uid "9DAA52A1-4B40-C072-C71E-439F461B5526";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_4_initLoc" -p "l_feather_1_4_poserOrient";
	rename -uid "7DBDC34D-47F8-EFBE-A787-BDA6665F0074";
	setAttr ".v" no;
createNode locator -n "l_feather_1_4_initLocShape" -p "l_feather_1_4_initLoc";
	rename -uid "0EE477ED-4682-48C1-4C68-09848B57AFD2";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_4_poserOrient_aimConstraint1" -p "l_feather_1_4_poserOrient";
	rename -uid "4E7C6BAA-4615-9A8F-08A2-73999B895B59";
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
	rename -uid "4DAA7BBB-449C-BC6F-360D-EC9CFD7708FE";
	setAttr ".v" no;
createNode locator -n "l_feather_1_4_fanLocShape" -p "l_feather_1_4_fanLoc";
	rename -uid "16827BE4-4269-4A1F-706A-8CB08E7FEEBB";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_4_fanLoc_aimConstraint1" -p "l_feather_1_4_fanLoc";
	rename -uid "DE751C4F-448C-435A-D544-4F88B6D1882B";
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
	rename -uid "6F3EDE27-4487-4FDF-0650-A8B115A17972";
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
	rename -uid "4D164363-4BA6-4354-34CC-99B79864C910";
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
	rename -uid "9530374A-4376-660F-91F4-228BC99D0A4B";
createNode locator -n "l_feather_1_5_poserOrientShape" -p "l_feather_1_5_poserOrient";
	rename -uid "63022ECB-400A-0879-784C-69A2A77950B7";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_5_initLoc" -p "l_feather_1_5_poserOrient";
	rename -uid "A57D4F2F-4BDF-FEAA-D695-2AB138DD0616";
	setAttr ".v" no;
createNode locator -n "l_feather_1_5_initLocShape" -p "l_feather_1_5_initLoc";
	rename -uid "25AE4486-489D-66C7-B1BB-B39622CD6A1D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_5_poserOrient_aimConstraint1" -p "l_feather_1_5_poserOrient";
	rename -uid "C74CD355-4CDE-3F79-0B24-EEA96427999A";
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
	rename -uid "9CD5E8AD-472D-A648-7E99-869F9EF3B730";
	setAttr ".v" no;
createNode locator -n "l_feather_1_5_fanLocShape" -p "l_feather_1_5_fanLoc";
	rename -uid "1C95B083-4153-18D1-69B7-ECAE9011A2AD";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_5_fanLoc_aimConstraint1" -p "l_feather_1_5_fanLoc";
	rename -uid "D4D69F62-48AE-7256-6F15-E3B2FE02D6C1";
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
	rename -uid "CA85916F-4412-D9FA-3CA7-BBB22EEEA798";
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
	rename -uid "71B78436-4662-1AF1-7D33-6B8E285506BA";
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
	rename -uid "0E604660-4DDE-9FAE-2874-AFB7DBDD0EE0";
createNode locator -n "l_feather_1_end_poserOrientShape" -p "l_feather_1_end_poserOrient";
	rename -uid "BD4FA5B5-4001-CA69-92D1-DFB033E25897";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_1_end_initLoc" -p "l_feather_1_end_poserOrient";
	rename -uid "F0031945-406F-8644-15CF-FDB9AF55667B";
	setAttr ".v" no;
createNode locator -n "l_feather_1_end_initLocShape" -p "l_feather_1_end_initLoc";
	rename -uid "F881A876-489D-A2CC-AAA1-75854F79CF81";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_end_poserOrient_aimConstraint1" -p "l_feather_1_end_poserOrient";
	rename -uid "96B9681D-4D66-E997-A9B7-6CA91E5BD74E";
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
	rename -uid "7B88CDFD-4889-1374-EA11-86AC0E80F84B";
	setAttr ".v" no;
createNode locator -n "l_feather_1_end_fanLocShape" -p "l_feather_1_end_fanLoc";
	rename -uid "872D3006-45C4-6038-47DB-52806A2C8FED";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_1_end_fanLoc_aimConstraint1" -p "l_feather_1_end_fanLoc";
	rename -uid "71FBFC2C-416E-F788-CB8D-7DB5A0E7DBA1";
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
	rename -uid "579C7CCE-457D-5EBE-C07F-BB88929D940C";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.34734944941356488 0.33467 0.11822165612243596 ;
	setAttr ".r" -type "double3" 33.12807 78.22911 -8.89706 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_2_mainPoserShape" -p "l_feather_2_mainPoser";
	rename -uid "02BCA8CF-4851-B992-B3A8-E284D058B513";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_2_mainPoserShapeOrig" -p "l_feather_2_mainPoser";
	rename -uid "96D2805E-4D7F-3F21-399F-428EA334D1E0";
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
	rename -uid "519A766E-445A-E2EB-F6A9-C0B1CFADB19A";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_2_mainPoser_clusterHandleShape" -p "l_feather_2_mainPoser_clusterHandle";
	rename -uid "DF018B39-476E-84BB-40DC-D1B721ABE79F";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_2_1_poser" -p "l_feather_2_mainPoser";
	rename -uid "E7862413-4B58-470D-F266-BE84B8563530";
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
	rename -uid "48F9585A-42E3-E596-C5D1-E8A1359A222D";
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
	rename -uid "95B051D6-4017-C1C4-A600-0CA10CB20D22";
createNode locator -n "l_feather_2_1_poserOrientShape" -p "l_feather_2_1_poserOrient";
	rename -uid "BD56F920-4299-6055-25AD-3490AF2A6B62";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_1_initLoc" -p "l_feather_2_1_poserOrient";
	rename -uid "7E296CF6-449F-E359-422D-77B68634EBA0";
	setAttr ".v" no;
createNode locator -n "l_feather_2_1_initLocShape" -p "l_feather_2_1_initLoc";
	rename -uid "7DC3D81F-4FF9-3838-2BA7-5A8CCD9BF726";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_1_poserOrient_aimConstraint1" -p "l_feather_2_1_poserOrient";
	rename -uid "7A1565D7-4B26-3742-9713-8488080F0AF5";
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
	rename -uid "0B86D053-4977-6B52-43F1-95A4D245DE2C";
	setAttr ".v" no;
createNode locator -n "l_feather_2_1_fanLocShape" -p "l_feather_2_1_fanLoc";
	rename -uid "0A485DAF-4229-FDA4-84E6-9387FBF4232F";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_1_fanLoc_aimConstraint1" -p "l_feather_2_1_fanLoc";
	rename -uid "812F805E-41D1-9B70-8D6A-F7BF80CF687A";
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
	setAttr ".rsrr" -type "double3" -27.597122766038613 3.5920089563154326e-15 -4.2028275187252726e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_2_poser" -p "l_feather_2_mainPoser";
	rename -uid "94A79850-4776-CC84-D393-BF9F9DA621E7";
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
	rename -uid "99BE24FD-48B9-045A-0D7A-EBB37D088AA2";
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
	rename -uid "F6FB69CA-4C08-94A6-E049-FB87748D4091";
createNode locator -n "l_feather_2_2_poserOrientShape" -p "l_feather_2_2_poserOrient";
	rename -uid "D7B77FE2-43F4-DC53-BBB4-BAA92CB9EBCE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_2_initLoc" -p "l_feather_2_2_poserOrient";
	rename -uid "600F033B-49F8-B4F8-850F-37A8E7E2A570";
	setAttr ".v" no;
createNode locator -n "l_feather_2_2_initLocShape" -p "l_feather_2_2_initLoc";
	rename -uid "3CF8D0F6-421A-4DEF-D9DC-028215FFA5CF";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_2_poserOrient_aimConstraint1" -p "l_feather_2_2_poserOrient";
	rename -uid "CD7FA328-4C25-CC8E-3A29-7AA261478475";
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
	rename -uid "3D478E63-4647-4EAF-8FF9-6AA0FECE247E";
	setAttr ".v" no;
createNode locator -n "l_feather_2_2_fanLocShape" -p "l_feather_2_2_fanLoc";
	rename -uid "710206A0-4A62-976F-F85E-1B8B73B8E89F";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_2_fanLoc_aimConstraint1" -p "l_feather_2_2_fanLoc";
	rename -uid "0438E9E7-4195-A9F1-D0AA-34B89D76722B";
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
	setAttr ".rsrr" -type "double3" -29.984414789722983 6.6589363494661541e-16 -2.5287618718607727e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_3_poser" -p "l_feather_2_mainPoser";
	rename -uid "2AB07BF4-462E-1D30-B16C-A59587A129F7";
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
	rename -uid "41DAF63B-4034-B847-AB00-CB8462F0DEF1";
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
	rename -uid "F9151F7A-4BD6-F80B-1ACA-D485094A42A4";
createNode locator -n "l_feather_2_3_poserOrientShape" -p "l_feather_2_3_poserOrient";
	rename -uid "EECCFA88-419D-3DF9-600F-9AA5305E8051";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_3_initLoc" -p "l_feather_2_3_poserOrient";
	rename -uid "E67A9BB0-41C2-56F2-8295-87AF6D9402B6";
	setAttr ".v" no;
createNode locator -n "l_feather_2_3_initLocShape" -p "l_feather_2_3_initLoc";
	rename -uid "20F09144-4003-6DB9-C5C7-62987D536887";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_3_poserOrient_aimConstraint1" -p "l_feather_2_3_poserOrient";
	rename -uid "6E91A8EC-48C0-251A-CA50-A698AF5F475E";
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
	rename -uid "108A463B-4EBA-2AFA-FB42-7987324850FC";
	setAttr ".v" no;
createNode locator -n "l_feather_2_3_fanLocShape" -p "l_feather_2_3_fanLoc";
	rename -uid "0D770E31-4279-B543-5F42-1E91A2230D86";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_3_fanLoc_aimConstraint1" -p "l_feather_2_3_fanLoc";
	rename -uid "B158E8BC-4684-B65B-B7EE-4EA5DFBF0CA4";
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
	setAttr ".rsrr" -type "double3" -30.932909546601813 5.2452386607009434e-15 -1.104400578991314e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_4_poser" -p "l_feather_2_mainPoser";
	rename -uid "67DFF889-42AE-01AE-0CAF-2F94B8DC03C2";
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
	rename -uid "B3F6A92A-484B-77F4-C76F-99A8EA98D392";
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
	rename -uid "2088C193-4176-86DE-741A-FF8E43173317";
createNode locator -n "l_feather_2_4_poserOrientShape" -p "l_feather_2_4_poserOrient";
	rename -uid "024FDA7D-45F4-63A5-A172-04BD69653648";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_4_initLoc" -p "l_feather_2_4_poserOrient";
	rename -uid "7ADA4549-4A94-9362-0BDB-44AE9C6F43DE";
	setAttr ".v" no;
createNode locator -n "l_feather_2_4_initLocShape" -p "l_feather_2_4_initLoc";
	rename -uid "8A54D036-46A8-0096-CCB3-AF966D7908B0";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_4_poserOrient_aimConstraint1" -p "l_feather_2_4_poserOrient";
	rename -uid "E2347193-4357-F60E-6C1F-2492D9F804A7";
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
	rename -uid "03FA88C1-4169-7992-AD9C-07AC1BE016B3";
	setAttr ".v" no;
createNode locator -n "l_feather_2_4_fanLocShape" -p "l_feather_2_4_fanLoc";
	rename -uid "CCEACAF7-43C8-5B4C-60BA-90B153729083";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_4_fanLoc_aimConstraint1" -p "l_feather_2_4_fanLoc";
	rename -uid "0192E489-4D91-671B-098B-40B08405E3B2";
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
	setAttr ".rsrr" -type "double3" -31.441842539764121 8.6768861665337684e-15 7.3397545180948557e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_5_poser" -p "l_feather_2_mainPoser";
	rename -uid "A23A7E7A-4C23-871E-EFFF-8D96620F99B1";
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
	rename -uid "18057773-4A9B-0C87-328F-B091AF96D871";
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
	rename -uid "A0955E49-446F-D1E2-B694-08BA69615DE9";
createNode locator -n "l_feather_2_5_poserOrientShape" -p "l_feather_2_5_poserOrient";
	rename -uid "14E718C9-44EE-DBD4-5B07-78B120832C05";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_5_initLoc" -p "l_feather_2_5_poserOrient";
	rename -uid "F1397F89-412B-9B47-9003-ACAF086F0DDF";
	setAttr ".v" no;
createNode locator -n "l_feather_2_5_initLocShape" -p "l_feather_2_5_initLoc";
	rename -uid "B80ED62C-4CC0-FD52-D918-0FAB214C5577";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_5_poserOrient_aimConstraint1" -p "l_feather_2_5_poserOrient";
	rename -uid "3346BD0D-4D56-E28E-F191-4B8C52628674";
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
	rename -uid "4EF9E014-4A3A-3B72-4621-559784D2C459";
	setAttr ".v" no;
createNode locator -n "l_feather_2_5_fanLocShape" -p "l_feather_2_5_fanLoc";
	rename -uid "B778A994-44DE-70BA-AC3A-069FC3269AC7";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_5_fanLoc_aimConstraint1" -p "l_feather_2_5_fanLoc";
	rename -uid "E6D0FE5E-4153-7A91-9437-1ABEF20815BD";
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
	setAttr ".rsrr" -type "double3" -31.75923912984177 1.9276748268323925e-15 -8.9212258155151396e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_2_end_poser" -p "l_feather_2_mainPoser";
	rename -uid "86F3D6B7-486E-2DE9-6553-7D9E7A804254";
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
	rename -uid "BB7EC5B6-4262-8757-49F5-C489144D1189";
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
	rename -uid "B683546C-40B7-9748-2F71-059D43944AED";
createNode locator -n "l_feather_2_end_poserOrientShape" -p "l_feather_2_end_poserOrient";
	rename -uid "6691E000-4650-2404-0D0F-15BF98C6E1E2";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_2_end_initLoc" -p "l_feather_2_end_poserOrient";
	rename -uid "A817DC31-4D42-8635-8C7B-6BAF13D7E973";
	setAttr ".v" no;
createNode locator -n "l_feather_2_end_initLocShape" -p "l_feather_2_end_initLoc";
	rename -uid "83E41BB9-4542-048E-0E2F-81BF2B827BCC";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_end_poserOrient_aimConstraint1" -p "l_feather_2_end_poserOrient";
	rename -uid "42DC1217-4BC6-B687-837C-05A4DA51AA86";
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
	rename -uid "E40485EA-4F96-98FF-61A7-9F85D4AC04A5";
	setAttr ".v" no;
createNode locator -n "l_feather_2_end_fanLocShape" -p "l_feather_2_end_fanLoc";
	rename -uid "61DADED9-4E56-AB44-348A-39AAA67119F6";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_2_end_fanLoc_aimConstraint1" -p "l_feather_2_end_fanLoc";
	rename -uid "8CE9EEEC-41B7-67F2-E962-F99B43DDA868";
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
	setAttr ".rsrr" -type "double3" -31.908460431677607 -1.7337957386165377e-14 -1.3554864015153099e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_mainPoser" -p "mainPoser";
	rename -uid "1C5C77F2-4BA7-6CB1-6460-219857CFA242";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.44332944941356489 0.2293 0.12429165612243598 ;
	setAttr ".r" -type "double3" 38.31301 72.2768 -11.70639 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_3_mainPoserShape" -p "l_feather_3_mainPoser";
	rename -uid "D3376389-4278-D100-280A-D69E1211DDDF";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_3_mainPoserShapeOrig" -p "l_feather_3_mainPoser";
	rename -uid "C1B9F2D6-4321-E1B9-0B31-03AA8EE544D0";
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
	rename -uid "BAB29E03-4B00-7155-91E5-609ED0144721";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_3_mainPoser_clusterHandleShape" -p "l_feather_3_mainPoser_clusterHandle";
	rename -uid "EE3E66EF-4E99-C0CA-5F29-69BED5DCCB79";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_3_1_poser" -p "l_feather_3_mainPoser";
	rename -uid "2793D775-4486-8B83-DFCF-33BAF5EED76A";
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
	rename -uid "9D3D4DF7-455C-E72D-ED18-A2BCC3E35E38";
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
	rename -uid "B326A2D8-4BDC-632B-976B-C6A131FA5C75";
createNode locator -n "l_feather_3_1_poserOrientShape" -p "l_feather_3_1_poserOrient";
	rename -uid "D9368571-446A-B137-8880-F39C1B51E739";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_1_initLoc" -p "l_feather_3_1_poserOrient";
	rename -uid "AC4C1D1E-4A95-F350-2633-2EB9C49F8C3F";
	setAttr ".v" no;
createNode locator -n "l_feather_3_1_initLocShape" -p "l_feather_3_1_initLoc";
	rename -uid "2E5819EC-43C8-562C-68C4-B3988E8F04E8";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_1_poserOrient_aimConstraint1" -p "l_feather_3_1_poserOrient";
	rename -uid "5C74E9FE-4EA9-F9E5-0780-2D80D123E1E9";
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
	rename -uid "B59F9461-498F-9D7E-26EE-3B80FBE1BB4E";
	setAttr ".v" no;
createNode locator -n "l_feather_3_1_fanLocShape" -p "l_feather_3_1_fanLoc";
	rename -uid "AB7C12AF-4E0A-3CAC-66ED-2D8EA5F19D2D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_1_fanLoc_aimConstraint1" -p "l_feather_3_1_fanLoc";
	rename -uid "E6ECE8E3-41EE-948A-0E24-8A8D16A65182";
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
	setAttr ".rsrr" -type "double3" -25.869092894507663 -1.274984504943482e-16 -5.5514909927342452e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_2_poser" -p "l_feather_3_mainPoser";
	rename -uid "370B3A63-4251-DC9B-00B6-1A8632326A7E";
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
	rename -uid "A33C1E0D-4BC7-A304-EC58-4CB599FB82A4";
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
	rename -uid "ED8612F7-48DB-F24D-30D4-A1B2A0E07B74";
createNode locator -n "l_feather_3_2_poserOrientShape" -p "l_feather_3_2_poserOrient";
	rename -uid "7D9FF15B-4248-6ED3-19F6-DA96A29B2A95";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_2_initLoc" -p "l_feather_3_2_poserOrient";
	rename -uid "62D7D462-4F1D-3D22-EA90-64BA22D846DA";
	setAttr ".v" no;
createNode locator -n "l_feather_3_2_initLocShape" -p "l_feather_3_2_initLoc";
	rename -uid "9A73910C-4F25-724D-87C7-46BABCB18BCF";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_2_poserOrient_aimConstraint1" -p "l_feather_3_2_poserOrient";
	rename -uid "C30D9EB0-4A5B-B133-A418-10B795A68C4F";
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
	rename -uid "14E4B864-4689-DEF1-0198-B9AD80A3E7E7";
	setAttr ".v" no;
createNode locator -n "l_feather_3_2_fanLocShape" -p "l_feather_3_2_fanLoc";
	rename -uid "65A44390-49D0-5FD9-9A3C-F89810EF5AA4";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_2_fanLoc_aimConstraint1" -p "l_feather_3_2_fanLoc";
	rename -uid "672F67CD-46B0-5602-B071-41A35591D882";
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
	setAttr ".rsrr" -type "double3" -31.612951139867629 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_3_poser" -p "l_feather_3_mainPoser";
	rename -uid "9382D602-4707-CA0D-C1E9-F29E9BAD150A";
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
	rename -uid "01C01DE9-4B57-3A44-59A3-B2B91AA5031D";
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
	rename -uid "1E15718F-4172-EBA3-0DF4-05A0DA150E0D";
createNode locator -n "l_feather_3_3_poserOrientShape" -p "l_feather_3_3_poserOrient";
	rename -uid "836E1ADE-4F77-5228-735F-428E4E06B345";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_3_initLoc" -p "l_feather_3_3_poserOrient";
	rename -uid "65228E84-4B87-ACAE-4DD4-0DB75B5EBB56";
	setAttr ".v" no;
createNode locator -n "l_feather_3_3_initLocShape" -p "l_feather_3_3_initLoc";
	rename -uid "7A62D02C-4103-6440-1424-6AAF6374DD91";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_3_poserOrient_aimConstraint1" -p "l_feather_3_3_poserOrient";
	rename -uid "A39C2D0E-415C-8B06-6772-19BB3AB7F9DF";
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
	rename -uid "F95CED47-47E4-C723-BBF7-81BAFB91B4A8";
	setAttr ".v" no;
createNode locator -n "l_feather_3_3_fanLocShape" -p "l_feather_3_3_fanLoc";
	rename -uid "BDFC244D-419D-EC1A-5C49-A3926D56DEEE";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_3_fanLoc_aimConstraint1" -p "l_feather_3_3_fanLoc";
	rename -uid "EBFB8546-4AD0-AEE4-0FFD-AD81AD8F5D97";
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
	setAttr ".rsrr" -type "double3" -33.736661481452558 -2.8265432519675305e-15 8.5706324775480007e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_4_poser" -p "l_feather_3_mainPoser";
	rename -uid "DCAA09A2-48F0-7941-DB88-C19F6F62EE94";
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
	rename -uid "B16EDB09-4CB4-27E9-058D-42B43E922CC4";
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
	rename -uid "39F98625-4F04-3DB0-83F6-7BBAD87A518F";
createNode locator -n "l_feather_3_4_poserOrientShape" -p "l_feather_3_4_poserOrient";
	rename -uid "3FF3768E-4E4E-A696-893E-0684BE71C117";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_4_initLoc" -p "l_feather_3_4_poserOrient";
	rename -uid "709E7D37-4B34-A73F-B19A-95A59FC1A573";
	setAttr ".v" no;
createNode locator -n "l_feather_3_4_initLocShape" -p "l_feather_3_4_initLoc";
	rename -uid "DECDED44-4EAD-B13E-AEA9-878736E99BF5";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_4_poserOrient_aimConstraint1" -p "l_feather_3_4_poserOrient";
	rename -uid "BC0C29EE-4713-BA61-FC4E-0DB56E2A144B";
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
	rename -uid "8F8C287A-4E9E-FA24-0C89-52B32F5169A8";
	setAttr ".v" no;
createNode locator -n "l_feather_3_4_fanLocShape" -p "l_feather_3_4_fanLoc";
	rename -uid "19DE3091-46D3-5C1A-D2D2-AC8E7D78BF34";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_4_fanLoc_aimConstraint1" -p "l_feather_3_4_fanLoc";
	rename -uid "EE927DDC-49B9-23F5-90D1-EB8A40A04282";
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
	setAttr ".rsrr" -type "double3" -34.839361499527669 9.1224992679239965e-16 2.9074928292477274e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_5_poser" -p "l_feather_3_mainPoser";
	rename -uid "97AEC5CF-4584-1F5C-8868-D89EB7CE7769";
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
	rename -uid "D9B17DB3-4344-1DAB-E953-7AB4656A46DA";
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
	rename -uid "1584491D-424D-3703-4848-69A629F1F65C";
createNode locator -n "l_feather_3_5_poserOrientShape" -p "l_feather_3_5_poserOrient";
	rename -uid "5B9D5D81-4313-9939-C86B-499DD143F114";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_5_initLoc" -p "l_feather_3_5_poserOrient";
	rename -uid "853762CA-4C20-474E-EBB8-EFA4CE795A43";
	setAttr ".v" no;
createNode locator -n "l_feather_3_5_initLocShape" -p "l_feather_3_5_initLoc";
	rename -uid "2216C7BA-4F3C-2FEA-1DD1-218D07D05349";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_5_poserOrient_aimConstraint1" -p "l_feather_3_5_poserOrient";
	rename -uid "20B0AABE-4441-0882-EC86-A9A357BF6F1B";
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
	rename -uid "B60904AF-4FFE-F334-3B8A-98B382C81B64";
	setAttr ".v" no;
createNode locator -n "l_feather_3_5_fanLocShape" -p "l_feather_3_5_fanLoc";
	rename -uid "27EB7468-49E6-AAF0-89BD-C79B29930756";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_5_fanLoc_aimConstraint1" -p "l_feather_3_5_fanLoc";
	rename -uid "D06F60A7-4749-46DE-031E-6D98CCED79D7";
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
	setAttr ".rsrr" -type "double3" -35.51417608780384 4.6657106794001546e-15 -1.4941421247349521e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_3_end_poser" -p "l_feather_3_mainPoser";
	rename -uid "F234A0F2-40DC-AE8A-DD0D-F283911D71FD";
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
	rename -uid "641E080C-4A70-C460-737E-BC84734DF787";
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
	rename -uid "77958BAA-4397-64B2-F8B2-2DA4AE729D0D";
createNode locator -n "l_feather_3_end_poserOrientShape" -p "l_feather_3_end_poserOrient";
	rename -uid "F19D6042-4DB1-54FE-D101-85B4CBC2DF8A";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_3_end_initLoc" -p "l_feather_3_end_poserOrient";
	rename -uid "757B5C6A-426C-3D20-D06F-AC86DEB60404";
	setAttr ".v" no;
createNode locator -n "l_feather_3_end_initLocShape" -p "l_feather_3_end_initLoc";
	rename -uid "C8D62FAB-4DE6-DDCF-5C56-37B152F8BEFB";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_end_poserOrient_aimConstraint1" -p "l_feather_3_end_poserOrient";
	rename -uid "62417301-4144-7AEF-896A-86B2AFC828BA";
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
	rename -uid "6DFFDC1C-4566-2C12-E699-179ED8679A17";
	setAttr ".v" no;
createNode locator -n "l_feather_3_end_fanLocShape" -p "l_feather_3_end_fanLoc";
	rename -uid "6E8B63BF-40CE-3B13-E0D0-828D7E2515C7";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_3_end_fanLoc_aimConstraint1" -p "l_feather_3_end_fanLoc";
	rename -uid "62B55A66-4F04-1477-B8A1-859B33BE1A36";
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
	setAttr ".rsrr" -type "double3" -35.828037525152922 -9.4029065253157236e-15 3.0395969101157106e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_mainPoser" -p "mainPoser";
	rename -uid "76504793-459B-92E5-FC08-F0A478D05864";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.52851944941356488 0.09972 0.17442165612243599 ;
	setAttr ".r" -type "double3" 43.90359 68.03587 -17.61052 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_4_mainPoserShape" -p "l_feather_4_mainPoser";
	rename -uid "28DD3903-4BC8-C93B-1105-F8A477E9956F";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_4_mainPoserShapeOrig" -p "l_feather_4_mainPoser";
	rename -uid "CECC162B-4787-7BAA-1BDD-EC8DA72B3167";
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
	rename -uid "3D1F4D99-4AC1-1FBB-0288-FFACBB2CF3B6";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_4_mainPoser_clusterHandleShape" -p "l_feather_4_mainPoser_clusterHandle";
	rename -uid "5D8C5493-4A78-4955-F2A7-DA9752F8ECEC";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_4_1_poser" -p "l_feather_4_mainPoser";
	rename -uid "B6CAE6C6-4399-8264-1790-E39E875BA859";
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
	rename -uid "B94D980F-427F-067A-74B9-BA8FA56F0B2C";
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
	rename -uid "3B97BA09-4898-DCF4-4A1A-A2B85218C537";
createNode locator -n "l_feather_4_1_poserOrientShape" -p "l_feather_4_1_poserOrient";
	rename -uid "7AD41E31-4FE0-1632-EBC9-E582955C9869";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_1_initLoc" -p "l_feather_4_1_poserOrient";
	rename -uid "9AED8700-4012-6838-6D80-B795883005C4";
	setAttr ".v" no;
createNode locator -n "l_feather_4_1_initLocShape" -p "l_feather_4_1_initLoc";
	rename -uid "BBFF8734-4605-B9FC-A592-7787E49C3404";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_1_poserOrient_aimConstraint1" -p "l_feather_4_1_poserOrient";
	rename -uid "6012DA11-4766-ADB8-FCA7-B8BA8285B55E";
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
	rename -uid "CB02D2D6-40A0-DE1B-3F80-44BA83BBF9F1";
	setAttr ".v" no;
createNode locator -n "l_feather_4_1_fanLocShape" -p "l_feather_4_1_fanLoc";
	rename -uid "C8B15564-4183-F219-34DB-4FB3E545FCFE";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_1_fanLoc_aimConstraint1" -p "l_feather_4_1_fanLoc";
	rename -uid "6D4CB318-492A-24F3-37C2-349669F636B6";
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
	setAttr ".rsrr" -type "double3" -29.529519259447948 -2.8785269657690033e-15 -6.0137090057831342e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_2_poser" -p "l_feather_4_mainPoser";
	rename -uid "9A2D05DB-47B9-7B5D-AF91-5DAAF8F6981C";
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
	rename -uid "DCA87C12-4B5D-44E5-4A78-07B57C353A96";
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
	rename -uid "0EDEA4B0-43A6-3052-09E2-4C88A9AF0C18";
createNode locator -n "l_feather_4_2_poserOrientShape" -p "l_feather_4_2_poserOrient";
	rename -uid "AAB27655-413A-8696-F6DB-BCB819A50125";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_2_initLoc" -p "l_feather_4_2_poserOrient";
	rename -uid "C2045633-40EB-95D5-F569-C7816397319A";
	setAttr ".v" no;
createNode locator -n "l_feather_4_2_initLocShape" -p "l_feather_4_2_initLoc";
	rename -uid "AE27089D-47E9-48BC-2374-708198785AC5";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_2_poserOrient_aimConstraint1" -p "l_feather_4_2_poserOrient";
	rename -uid "F2162532-4A86-BFCF-C474-A99D147901E5";
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
	rename -uid "F6DA0612-4692-07C7-87D2-578B857737EB";
	setAttr ".v" no;
createNode locator -n "l_feather_4_2_fanLocShape" -p "l_feather_4_2_fanLoc";
	rename -uid "0A66621E-4906-2919-1ABE-E8A91D91584A";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_2_fanLoc_aimConstraint1" -p "l_feather_4_2_fanLoc";
	rename -uid "2014A893-4FFB-C988-0449-879418B0B789";
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
	setAttr ".rsrr" -type "double3" -35.992202121022927 -2.7863267316452213e-15 1.7432780541659125e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_3_poser" -p "l_feather_4_mainPoser";
	rename -uid "B1181B00-45DA-9224-799C-B899CE4273C1";
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
	rename -uid "8CB1C131-42ED-A5DD-8A58-07862D0C9777";
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
	rename -uid "39BE2E75-4BD4-847A-03CA-AB976180DCF0";
createNode locator -n "l_feather_4_3_poserOrientShape" -p "l_feather_4_3_poserOrient";
	rename -uid "D80FCC1C-4733-AC43-9589-2BBAC995BFF8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_3_initLoc" -p "l_feather_4_3_poserOrient";
	rename -uid "80097458-4B73-439B-0646-F1ADC2A95ECB";
	setAttr ".v" no;
createNode locator -n "l_feather_4_3_initLocShape" -p "l_feather_4_3_initLoc";
	rename -uid "83E9277E-493D-2FB1-2F6B-94AC12572C1D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_3_poserOrient_aimConstraint1" -p "l_feather_4_3_poserOrient";
	rename -uid "E01273EC-4E2D-F351-A058-7A9DF4BA30FD";
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
	rename -uid "BDDD9BA7-487D-A253-84FF-07888FAE11D2";
	setAttr ".v" no;
createNode locator -n "l_feather_4_3_fanLocShape" -p "l_feather_4_3_fanLoc";
	rename -uid "3DEA7558-4D1F-543B-6BAB-A8B11FA3030D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_3_fanLoc_aimConstraint1" -p "l_feather_4_3_fanLoc";
	rename -uid "276EB16D-407F-3BF2-8882-00B9F39B1913";
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
	setAttr ".rsrr" -type "double3" -38.458174059507144 3.3403068693840852e-15 -1.1064826132284735e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_4_poser" -p "l_feather_4_mainPoser";
	rename -uid "73D5711F-4CB5-57EA-82BF-1F9CDDD501CF";
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
	rename -uid "A6119690-4763-DF58-3DAB-569C0A66740A";
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
	rename -uid "5A1588F9-47AE-63EC-FA25-FE93CF4CEEB6";
createNode locator -n "l_feather_4_4_poserOrientShape" -p "l_feather_4_4_poserOrient";
	rename -uid "4902E8D2-44E6-9A18-F655-0A8BE6D326DE";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_4_initLoc" -p "l_feather_4_4_poserOrient";
	rename -uid "DEC57599-43D5-76F7-2D18-4087E3A9897A";
	setAttr ".v" no;
createNode locator -n "l_feather_4_4_initLocShape" -p "l_feather_4_4_initLoc";
	rename -uid "BA34CFD8-4DF1-20B3-942B-6ABEB766EB14";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_4_poserOrient_aimConstraint1" -p "l_feather_4_4_poserOrient";
	rename -uid "F69383C1-4E19-2285-A206-B387ECAF309E";
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
	rename -uid "454B59C5-4EF2-A2AA-26F4-66A8C359A641";
	setAttr ".v" no;
createNode locator -n "l_feather_4_4_fanLocShape" -p "l_feather_4_4_fanLoc";
	rename -uid "384E947D-4F9F-28E9-BAB4-E39D56BD112D";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_4_fanLoc_aimConstraint1" -p "l_feather_4_4_fanLoc";
	rename -uid "432EECC1-4DE7-927C-1FF2-08B002CEBEC0";
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
	setAttr ".rsrr" -type "double3" -39.754230742877283 -1.4374071495033558e-14 -8.7957055940465357e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_5_poser" -p "l_feather_4_mainPoser";
	rename -uid "D6A3EC29-4AA8-6189-7E34-4D91EF250948";
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
	rename -uid "8BE20A0C-4EED-83A0-4704-028A6823F0DB";
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
	rename -uid "163E8AC3-4F8F-0DAC-04CB-FABA6FDFC86E";
createNode locator -n "l_feather_4_5_poserOrientShape" -p "l_feather_4_5_poserOrient";
	rename -uid "C8E150F6-40D0-7B5D-F74C-4AA1DC6B98BC";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_5_initLoc" -p "l_feather_4_5_poserOrient";
	rename -uid "93245A3A-4394-682B-C6DF-DDB26B40BDF4";
	setAttr ".v" no;
createNode locator -n "l_feather_4_5_initLocShape" -p "l_feather_4_5_initLoc";
	rename -uid "C3183140-4543-9D41-499C-F58CA175925F";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_5_poserOrient_aimConstraint1" -p "l_feather_4_5_poserOrient";
	rename -uid "4505ED3B-4A53-A5F2-FE17-E38608DB3192";
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
	rename -uid "3F31E1A6-434D-4B1A-2065-E3A6DD9C73A1";
	setAttr ".v" no;
createNode locator -n "l_feather_4_5_fanLocShape" -p "l_feather_4_5_fanLoc";
	rename -uid "1CC790AB-4754-DA5F-FAC8-F099266444AB";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_5_fanLoc_aimConstraint1" -p "l_feather_4_5_fanLoc";
	rename -uid "4CAE58C3-450B-5097-78FB-FF9312739AAE";
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
	setAttr ".rsrr" -type "double3" -40.552514387126671 -9.0077428544770623e-16 1.3981577623610426e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_4_end_poser" -p "l_feather_4_mainPoser";
	rename -uid "F73475D8-435B-E8F6-3A76-619E17B32848";
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
	rename -uid "0EC68598-4B50-64FD-ECD4-0FB4C4BD01D7";
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
	rename -uid "F8698216-4ABC-E317-BAF5-6B98825C223C";
createNode locator -n "l_feather_4_end_poserOrientShape" -p "l_feather_4_end_poserOrient";
	rename -uid "65CAF221-434F-B86A-1790-76963105931D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_4_end_initLoc" -p "l_feather_4_end_poserOrient";
	rename -uid "BBBDA47B-4710-D471-FFD7-FB9AFCC48BEF";
	setAttr ".v" no;
createNode locator -n "l_feather_4_end_initLocShape" -p "l_feather_4_end_initLoc";
	rename -uid "26B4AE7B-416C-EDCD-A441-928782963E56";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_end_poserOrient_aimConstraint1" -p "l_feather_4_end_poserOrient";
	rename -uid "7F6D5D6B-417A-C5F6-583F-53882E4C7185";
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
	rename -uid "43BC8506-4C67-5010-9E67-A7913D4731B5";
	setAttr ".v" no;
createNode locator -n "l_feather_4_end_fanLocShape" -p "l_feather_4_end_fanLoc";
	rename -uid "4A4930B8-45A2-97D6-571C-4ABCFDFCF0D4";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_4_end_fanLoc_aimConstraint1" -p "l_feather_4_end_fanLoc";
	rename -uid "A957E1B1-4FC9-08BF-F87F-E5859E0428B4";
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
	setAttr ".rsrr" -type "double3" -40.925111490904484 -1.2622364564337493e-14 1.5431950084231011e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_mainPoser" -p "mainPoser";
	rename -uid "617AA6EC-472E-5190-FE28-A18B5BE14AC1";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".t" -type "double3" 0.5755494494135649 -0.01788 0.23071165612243594 ;
	setAttr ".r" -type "double3" 50.73323 64.59158 -19.71274 ;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size" 0.2;
	setAttr -k on ".globalSize";
	setAttr -k on ".lineWidth";
createNode nurbsCurve -n "l_feather_5_mainPoserShape" -p "l_feather_5_mainPoser";
	rename -uid "EB0968F0-47BE-DE14-171A-CBB9582077C4";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".ovc" 10;
	setAttr ".tw" yes;
createNode nurbsCurve -n "l_feather_5_mainPoserShapeOrig" -p "l_feather_5_mainPoser";
	rename -uid "E9CF4CC5-4319-40FA-D62A-409EA3138B5F";
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
	rename -uid "F472BD52-4778-6BE8-C444-129415DAF2F4";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
	setAttr ".sp" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode clusterHandle -n "l_feather_5_mainPoser_clusterHandleShape" -p "l_feather_5_mainPoser_clusterHandle";
	rename -uid "3B2C35E5-4EAE-0D48-863B-C1B820394A5F";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.5320657416091379e-08 4.9388752143553205e-08 -2.8670646134987265e-09 ;
createNode transform -n "l_feather_5_1_poser" -p "l_feather_5_mainPoser";
	rename -uid "3ACA91C0-4A93-9B8A-C1BD-2888AEA57195";
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
	rename -uid "1A80F45C-48C7-3143-443C-22899F5D33F5";
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
	rename -uid "2B06EE4C-4E99-ED3F-EA97-AEBE2F6E1E3F";
createNode locator -n "l_feather_5_1_poserOrientShape" -p "l_feather_5_1_poserOrient";
	rename -uid "BCAC9BC0-42C7-BD08-7B7F-2B8A65B6B8B5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_1_initLoc" -p "l_feather_5_1_poserOrient";
	rename -uid "DA567888-43CE-E83F-97C3-2593871AA04D";
	setAttr ".v" no;
createNode locator -n "l_feather_5_1_initLocShape" -p "l_feather_5_1_initLoc";
	rename -uid "D762D5EF-43C4-32EB-7536-61951F4FFD08";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_1_poserOrient_aimConstraint1" -p "l_feather_5_1_poserOrient";
	rename -uid "1E61FC18-402D-EA96-4BF0-DDA2B9619D46";
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
	rename -uid "860CC589-490D-9E11-994C-1F9F74DA5729";
	setAttr ".v" no;
createNode locator -n "l_feather_5_1_fanLocShape" -p "l_feather_5_1_fanLoc";
	rename -uid "DD8A87CE-4968-7A01-C33C-5A8E00F79D4F";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_1_fanLoc_aimConstraint1" -p "l_feather_5_1_fanLoc";
	rename -uid "B36A2CE3-4C49-67D2-8B9B-1FAD639789F3";
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
	setAttr ".rsrr" -type "double3" -32.532263654165966 -2.059782884270051e-16 -7.0593958540742049e-16 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_2_poser" -p "l_feather_5_mainPoser";
	rename -uid "77AF4E61-424A-4D19-65CF-DFA86295F882";
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
	rename -uid "3BE4E695-4E8E-A004-F0A3-52A2F05898CD";
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
	rename -uid "18BBA6C5-4965-877E-DA4A-A9846DDE07AF";
createNode locator -n "l_feather_5_2_poserOrientShape" -p "l_feather_5_2_poserOrient";
	rename -uid "63E56C87-446B-3BB8-C1A6-A59954392AF5";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_2_initLoc" -p "l_feather_5_2_poserOrient";
	rename -uid "D985E642-4D2A-8AD4-9823-A1B52FE1A3D4";
	setAttr ".v" no;
createNode locator -n "l_feather_5_2_initLocShape" -p "l_feather_5_2_initLoc";
	rename -uid "56515BB9-4E38-7343-EBB0-F7A971850CF2";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_2_poserOrient_aimConstraint1" -p "l_feather_5_2_poserOrient";
	rename -uid "E20BEA99-416E-C827-CF69-00881285B79F";
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
	rename -uid "C64831FA-40F0-95C7-C3CF-F1AABCCC515F";
	setAttr ".v" no;
createNode locator -n "l_feather_5_2_fanLocShape" -p "l_feather_5_2_fanLoc";
	rename -uid "6596B57B-4813-2A05-7FB8-EB88F01212DB";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_2_fanLoc_aimConstraint1" -p "l_feather_5_2_fanLoc";
	rename -uid "17BBD814-411E-B30B-8EB4-3EA5B469CEF5";
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
	setAttr ".rsrr" -type "double3" -40.570645658609322 -1.2622631455974755e-15 -3.4150289472421829e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_3_poser" -p "l_feather_5_mainPoser";
	rename -uid "F894EE70-48CC-E571-3949-84814DCB5A48";
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
	rename -uid "94E869C6-4649-5C6B-4C08-26AA1D2B5937";
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
	rename -uid "65C5AA18-4F1E-649A-480F-47B59A629CE2";
createNode locator -n "l_feather_5_3_poserOrientShape" -p "l_feather_5_3_poserOrient";
	rename -uid "A77E4226-4C45-DDFB-07EF-39AC4EECA16F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_3_initLoc" -p "l_feather_5_3_poserOrient";
	rename -uid "C96BF853-45D5-7A16-89E6-6AA0617D7A65";
	setAttr ".v" no;
createNode locator -n "l_feather_5_3_initLocShape" -p "l_feather_5_3_initLoc";
	rename -uid "37EB7C24-49B9-F5F4-25EB-7C97EA15421A";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_3_poserOrient_aimConstraint1" -p "l_feather_5_3_poserOrient";
	rename -uid "BD053FE4-46BA-49A9-E631-5FA23A5FCAFF";
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
	rename -uid "6135071B-4452-1586-17C5-DB80FD5C7339";
	setAttr ".v" no;
createNode locator -n "l_feather_5_3_fanLocShape" -p "l_feather_5_3_fanLoc";
	rename -uid "F6E85B3A-4816-E2AA-81AB-96A3256C1E07";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_3_fanLoc_aimConstraint1" -p "l_feather_5_3_fanLoc";
	rename -uid "44806558-4497-EF81-2496-07AE218B9020";
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
	setAttr ".rsrr" -type "double3" -43.70901525576172 5.0835197263393117e-15 2.1730771339232446e-15 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_4_poser" -p "l_feather_5_mainPoser";
	rename -uid "1A38B869-4CDF-2008-FA02-4681A1EA9C7C";
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
	rename -uid "010C60B6-470E-CE16-A904-C9A6F11B9009";
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
	rename -uid "D3F865F9-48A7-E0AD-3870-809A5556ABDF";
createNode locator -n "l_feather_5_4_poserOrientShape" -p "l_feather_5_4_poserOrient";
	rename -uid "5A956389-43A9-C92B-CD88-6E9082807B3B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_4_initLoc" -p "l_feather_5_4_poserOrient";
	rename -uid "2C95E7D1-4322-E5CD-9EDC-08B173A5AFC6";
	setAttr ".v" no;
createNode locator -n "l_feather_5_4_initLocShape" -p "l_feather_5_4_initLoc";
	rename -uid "3AB995E4-41FC-769C-D82F-A1BECD4E63F8";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_4_poserOrient_aimConstraint1" -p "l_feather_5_4_poserOrient";
	rename -uid "A5FE9451-47CD-27F3-81E4-7FAA54B49E85";
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
	rename -uid "EB3886DE-410B-38E9-525E-35A0ECA14433";
	setAttr ".v" no;
createNode locator -n "l_feather_5_4_fanLocShape" -p "l_feather_5_4_fanLoc";
	rename -uid "F8D412B4-4447-8EEB-41FD-0187AD36BF62";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_4_fanLoc_aimConstraint1" -p "l_feather_5_4_fanLoc";
	rename -uid "6BB3595E-4AE3-298E-4EB8-7E90E2B2BE24";
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
	setAttr ".rsrr" -type "double3" -45.370739078339852 -2.7875805046941209e-15 1.4334583162375893e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_5_poser" -p "l_feather_5_mainPoser";
	rename -uid "FE89B144-4AB2-F883-7C37-E1A69672F8B4";
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
	rename -uid "95308E7B-4BA2-81B4-4DE0-2F92E457C0F8";
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
	rename -uid "6584251D-4ACC-EE6A-C1D2-48AEE27565E8";
createNode locator -n "l_feather_5_5_poserOrientShape" -p "l_feather_5_5_poserOrient";
	rename -uid "148A9D1B-41D0-E120-2E27-C192F3FC015C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_5_initLoc" -p "l_feather_5_5_poserOrient";
	rename -uid "2ED817E6-44D4-5A66-8EDE-1EA3B849434F";
	setAttr ".v" no;
createNode locator -n "l_feather_5_5_initLocShape" -p "l_feather_5_5_initLoc";
	rename -uid "7250BE52-4DC6-FF89-1774-6EA3502E4ACD";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_5_poserOrient_aimConstraint1" -p "l_feather_5_5_poserOrient";
	rename -uid "67175C89-47D6-7EC8-FC9F-A5A0EC959961";
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
	rename -uid "0AAB9E84-405E-34E2-1AA8-15825876F1FC";
	setAttr ".v" no;
createNode locator -n "l_feather_5_5_fanLocShape" -p "l_feather_5_5_fanLoc";
	rename -uid "A0A30EC1-4B67-E0CC-686B-6081C53D3141";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_5_fanLoc_aimConstraint1" -p "l_feather_5_5_fanLoc";
	rename -uid "BBE68DA7-4C16-A4BD-C78C-B19006D5F36E";
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
	setAttr ".rsrr" -type "double3" -46.397857410730843 9.6055534331476089e-15 -1.1352153580867937e-14 ;
	setAttr -k on ".w0";
createNode transform -n "l_feather_5_end_poser" -p "l_feather_5_mainPoser";
	rename -uid "89116B92-4D92-882A-0F02-F4BC18FAEF91";
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
	rename -uid "D04D3DE1-42C8-0497-E09E-6C9C470972E1";
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
	rename -uid "26E325A5-4291-E5B3-86A1-C0BE99140CFC";
createNode locator -n "l_feather_5_end_poserOrientShape" -p "l_feather_5_end_poserOrient";
	rename -uid "9862243E-450D-72F5-9882-3FA2FD7825DD";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "l_feather_5_end_initLoc" -p "l_feather_5_end_poserOrient";
	rename -uid "ACFD8C07-421D-125A-63E0-8CBA7B02EB0D";
	setAttr ".v" no;
createNode locator -n "l_feather_5_end_initLocShape" -p "l_feather_5_end_initLoc";
	rename -uid "556F42DD-4582-9B6B-3CFF-02B7438EE30B";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_end_poserOrient_aimConstraint1" -p "l_feather_5_end_poserOrient";
	rename -uid "616D4E91-4422-7E19-ABA9-57828159EADA";
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
	rename -uid "B292E21B-4B8C-AA42-2F88-C2A01DD49642";
	setAttr ".v" no;
createNode locator -n "l_feather_5_end_fanLocShape" -p "l_feather_5_end_fanLoc";
	rename -uid "F8A5C35D-4D3B-2795-E52F-F88EDDCC4BF1";
	setAttr -k off ".v";
createNode aimConstraint -n "l_feather_5_end_fanLoc_aimConstraint1" -p "l_feather_5_end_fanLoc";
	rename -uid "AF8470B1-4BCB-A8FC-036F-55879454F74C";
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
	setAttr ".rsrr" -type "double3" -46.878116046290017 -8.0135744319392999e-15 -1.8483697824356397e-14 ;
	setAttr -k on ".w0";
createNode transform -n "r_initLocs" -p "posers";
	rename -uid "CB2A4A12-4205-9583-1CAE-7A94D91974CB";
	setAttr ".v" no;
createNode transform -n "r_feather_1_1_initLoc" -p "r_initLocs";
	rename -uid "7CCA557F-467E-E5C3-DFB7-FEBC471676BF";
createNode locator -n "r_feather_1_1_initLocShape" -p "r_feather_1_1_initLoc";
	rename -uid "924499BC-4AAF-73A1-D965-E5A9639059E9";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_2_initLoc" -p "r_initLocs";
	rename -uid "830CE7ED-4012-319F-E58D-E9BCB1B09F7A";
createNode locator -n "r_feather_1_2_initLocShape" -p "r_feather_1_2_initLoc";
	rename -uid "E56138C0-44F4-C4D1-5F29-E4856A364D21";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_3_initLoc" -p "r_initLocs";
	rename -uid "BA3FD945-4346-5510-41B7-2BAE7DBE2E3D";
createNode locator -n "r_feather_1_3_initLocShape" -p "r_feather_1_3_initLoc";
	rename -uid "C4B148C1-41E3-ED59-8F26-A3A03B240147";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_4_initLoc" -p "r_initLocs";
	rename -uid "BF9564C0-4641-4E42-F3CB-3B894478B994";
createNode locator -n "r_feather_1_4_initLocShape" -p "r_feather_1_4_initLoc";
	rename -uid "E70E6726-4843-1198-7333-93871C93F4AA";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_5_initLoc" -p "r_initLocs";
	rename -uid "FE3A11EB-4866-986F-BCBD-55A52F714798";
createNode locator -n "r_feather_1_5_initLocShape" -p "r_feather_1_5_initLoc";
	rename -uid "32BEE1B9-452B-5E9D-145F-DCA9B401D5C9";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_end_initLoc" -p "r_initLocs";
	rename -uid "651AEDD3-49B8-FE77-FEA3-B48C759713FD";
createNode locator -n "r_feather_1_end_initLocShape" -p "r_feather_1_end_initLoc";
	rename -uid "BCBE0AA2-410B-A47E-BDCD-00AA3ABB55B4";
	setAttr -k off ".v";
createNode transform -n "r_feather_1_1_fanLoc" -p "r_initLocs";
	rename -uid "83609148-4C72-A14A-EFDD-5B985D278DD6";
createNode locator -n "r_feather_1_1_fanLocShape" -p "r_feather_1_1_fanLoc";
	rename -uid "C31216D3-4DC5-D3BD-3C18-5BBB2EA4FD3B";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_1_initLoc" -p "r_initLocs";
	rename -uid "CF91790A-46BA-2089-321F-90A7297B287B";
createNode locator -n "r_feather_2_1_initLocShape" -p "r_feather_2_1_initLoc";
	rename -uid "489C0D2C-4936-2719-5D09-E5927E9FA513";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_2_initLoc" -p "r_initLocs";
	rename -uid "E90DFC7C-4DDF-0DCE-FE18-6592BCEE104B";
createNode locator -n "r_feather_2_2_initLocShape" -p "r_feather_2_2_initLoc";
	rename -uid "945D1F87-4E00-AA3F-1120-CD876F9EA4B5";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_3_initLoc" -p "r_initLocs";
	rename -uid "59730F77-419A-41E4-77E4-E48F6DC7DE34";
createNode locator -n "r_feather_2_3_initLocShape" -p "r_feather_2_3_initLoc";
	rename -uid "1EF1C149-42C3-92F2-2A44-BD989027F743";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_4_initLoc" -p "r_initLocs";
	rename -uid "FE58FF7E-44B7-D486-15FF-2CA22B6415A3";
createNode locator -n "r_feather_2_4_initLocShape" -p "r_feather_2_4_initLoc";
	rename -uid "11817424-4A31-A5F4-E406-E5A11510C541";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_5_initLoc" -p "r_initLocs";
	rename -uid "43734945-4797-FB5E-2781-D9A5C1377788";
createNode locator -n "r_feather_2_5_initLocShape" -p "r_feather_2_5_initLoc";
	rename -uid "04D3D35E-4E0D-9163-1B65-56AF18839875";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_end_initLoc" -p "r_initLocs";
	rename -uid "09552700-4A1E-345E-EF17-A191DF4C9E21";
createNode locator -n "r_feather_2_end_initLocShape" -p "r_feather_2_end_initLoc";
	rename -uid "757BABCB-410B-8F06-DBF2-75BFBD288250";
	setAttr -k off ".v";
createNode transform -n "r_feather_2_1_fanLoc" -p "r_initLocs";
	rename -uid "8628F314-4862-4605-F446-46A9899C723F";
createNode locator -n "r_feather_2_1_fanLocShape" -p "r_feather_2_1_fanLoc";
	rename -uid "58E4A36C-4F76-955C-35C4-7CABC770B32A";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_1_initLoc" -p "r_initLocs";
	rename -uid "A51AC7AE-45DD-BA51-2197-D489AA7CE417";
createNode locator -n "r_feather_3_1_initLocShape" -p "r_feather_3_1_initLoc";
	rename -uid "97E5D9A7-4EF4-EDC1-15A6-8C8EE8E321BA";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_2_initLoc" -p "r_initLocs";
	rename -uid "97D12D2E-4F48-5BC9-87F7-D4830BEB29F3";
createNode locator -n "r_feather_3_2_initLocShape" -p "r_feather_3_2_initLoc";
	rename -uid "D4499895-41CD-308E-C6A0-63AAA5B872F6";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_3_initLoc" -p "r_initLocs";
	rename -uid "02B96DD8-4E10-53D1-5969-D1BDE4F48445";
createNode locator -n "r_feather_3_3_initLocShape" -p "r_feather_3_3_initLoc";
	rename -uid "FF996217-454C-C63E-64F7-039FC6C6E704";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_4_initLoc" -p "r_initLocs";
	rename -uid "BA777F54-45F1-C1C0-D210-CDB3D8EF1B57";
createNode locator -n "r_feather_3_4_initLocShape" -p "r_feather_3_4_initLoc";
	rename -uid "2F94E307-4889-4E68-7254-D283895C28CB";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_5_initLoc" -p "r_initLocs";
	rename -uid "8ED6C0BD-465C-FCE0-5809-0D995842C96E";
createNode locator -n "r_feather_3_5_initLocShape" -p "r_feather_3_5_initLoc";
	rename -uid "CBC17E55-43CA-DF2E-4416-829CE6DED7FA";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_end_initLoc" -p "r_initLocs";
	rename -uid "571CF4B6-44B7-258F-A419-CCB4778E0728";
createNode locator -n "r_feather_3_end_initLocShape" -p "r_feather_3_end_initLoc";
	rename -uid "8F376E03-4481-0642-A708-899BCEC0BA2E";
	setAttr -k off ".v";
createNode transform -n "r_feather_3_1_fanLoc" -p "r_initLocs";
	rename -uid "4C49BF22-4B55-EBFA-562D-2EBA1B33873D";
createNode locator -n "r_feather_3_1_fanLocShape" -p "r_feather_3_1_fanLoc";
	rename -uid "08CCCF69-4223-66C6-94CD-96AB03C3C319";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_1_initLoc" -p "r_initLocs";
	rename -uid "F1B83147-43A4-7575-4936-F48CF9E90523";
createNode locator -n "r_feather_4_1_initLocShape" -p "r_feather_4_1_initLoc";
	rename -uid "978F56D6-499D-A70C-13F4-08867B47AADA";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_2_initLoc" -p "r_initLocs";
	rename -uid "6AB5956F-4799-CE41-4A71-E99514C0BD89";
createNode locator -n "r_feather_4_2_initLocShape" -p "r_feather_4_2_initLoc";
	rename -uid "6F64EA4D-411B-7D6F-2E34-D8882C5657C0";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_3_initLoc" -p "r_initLocs";
	rename -uid "911F0858-4080-7CC4-CB36-8EA5647434C7";
createNode locator -n "r_feather_4_3_initLocShape" -p "r_feather_4_3_initLoc";
	rename -uid "06E7DAB8-40C1-C529-62EE-1B94AE2C2F4B";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_4_initLoc" -p "r_initLocs";
	rename -uid "5A72BDF9-40E6-C04F-ACF6-809FB3880625";
createNode locator -n "r_feather_4_4_initLocShape" -p "r_feather_4_4_initLoc";
	rename -uid "BEB5A0AC-4E6E-83CE-A8B2-D7BC51BD0FD0";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_5_initLoc" -p "r_initLocs";
	rename -uid "13BD20E2-40DD-1C61-F2E0-69A705548F6F";
createNode locator -n "r_feather_4_5_initLocShape" -p "r_feather_4_5_initLoc";
	rename -uid "A2418267-4635-CE70-07DF-789F40497095";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_end_initLoc" -p "r_initLocs";
	rename -uid "B3C109E7-4A0B-8209-F38A-6B950FE03D42";
createNode locator -n "r_feather_4_end_initLocShape" -p "r_feather_4_end_initLoc";
	rename -uid "C23A85CC-4EE0-98F2-29B7-4386C5ECE771";
	setAttr -k off ".v";
createNode transform -n "r_feather_4_1_fanLoc" -p "r_initLocs";
	rename -uid "5E97EF70-4924-5542-BDCE-5CBFBC5AF4D3";
createNode locator -n "r_feather_4_1_fanLocShape" -p "r_feather_4_1_fanLoc";
	rename -uid "3202C226-47D0-A810-FA2E-549D4C9E84D1";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_1_initLoc" -p "r_initLocs";
	rename -uid "BDE73A57-4A33-4743-8FD0-07BC4A6280E3";
createNode locator -n "r_feather_5_1_initLocShape" -p "r_feather_5_1_initLoc";
	rename -uid "300BEEEE-49F4-EB0C-92A2-1A819D1B926F";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_2_initLoc" -p "r_initLocs";
	rename -uid "A53EE93F-4140-7C33-9E74-CFB2AD6B7F4D";
createNode locator -n "r_feather_5_2_initLocShape" -p "r_feather_5_2_initLoc";
	rename -uid "40015F39-455A-864B-BBE9-7DA4D64A74EA";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_3_initLoc" -p "r_initLocs";
	rename -uid "0D6F6E2D-41C8-7AB8-88E2-79B0949CE4B6";
createNode locator -n "r_feather_5_3_initLocShape" -p "r_feather_5_3_initLoc";
	rename -uid "9EFBA19A-45F8-EEFF-8850-118C66344741";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_4_initLoc" -p "r_initLocs";
	rename -uid "01F3822C-4CB5-3C90-295F-249012B3FF2C";
createNode locator -n "r_feather_5_4_initLocShape" -p "r_feather_5_4_initLoc";
	rename -uid "556CDAEB-4E62-92FA-FAAD-C4A332BB0A7F";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_5_initLoc" -p "r_initLocs";
	rename -uid "E6FF0A02-480F-FD52-D897-418BE9BA760A";
createNode locator -n "r_feather_5_5_initLocShape" -p "r_feather_5_5_initLoc";
	rename -uid "646E13B2-41D2-B833-F582-B4997AE78696";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_end_initLoc" -p "r_initLocs";
	rename -uid "D745D291-4663-9B2B-4CE6-5DAD13CB6E38";
createNode locator -n "r_feather_5_end_initLocShape" -p "r_feather_5_end_initLoc";
	rename -uid "83A2639D-4488-2867-A2EE-34BF02E2F1AE";
	setAttr -k off ".v";
createNode transform -n "r_feather_5_1_fanLoc" -p "r_initLocs";
	rename -uid "1B7AE994-44F4-C3B7-D968-F4AAAB3CA498";
createNode locator -n "r_feather_5_1_fanLocShape" -p "r_feather_5_1_fanLoc";
	rename -uid "B997F191-4B70-90D9-DA3E-9D950172A192";
	setAttr -k off ".v";
createNode transform -n "lines_group" -p "posers";
	rename -uid "E59E753A-40A2-1998-C157-359D4B5B46B4";
	setAttr ".it" no;
createNode transform -n "posers_curve_1" -p "lines_group";
	rename -uid "09AB2055-446B-61E7-3294-64AF2FBB0F2B";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape1" -p "posers_curve_1";
	rename -uid "A1413EB6-40B7-1BB9-C2BF-83BFC3C2E181";
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
	rename -uid "4CE8625C-4DF1-9E84-3A19-29BE4C16C079";
createNode mesh -n "posers_curve_1_sweepMeshShape" -p "posers_curve_1_sweepMesh";
	rename -uid "E92A175E-4F02-CD91-2BE3-11ADC647B6DF";
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
	rename -uid "A63515D1-486A-B82A-EE84-8ABA794D4611";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape2" -p "posers_curve_2";
	rename -uid "5511AB7C-4F42-EDBD-2623-E6AE800D2D58";
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
	rename -uid "5709771C-4FF8-A2D4-7258-3CBD1D4B54C3";
createNode mesh -n "posers_curve_2_sweepMeshShape" -p "posers_curve_2_sweepMesh";
	rename -uid "B09064BA-418B-3907-D86F-4F9747A458F1";
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
	rename -uid "7414C6DC-4ED4-5E30-DC53-10A99B0DD5AA";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape3" -p "posers_curve_3";
	rename -uid "8B75C272-42D8-833D-F99D-2BA671F9FF69";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.34734944941356488 0.33467000000000002 0.11822165612243596
		0.60297594949456057 0.29465339677763258 -1.1234466246687278
		0.85860446501700016 0.25463647805151041 -2.365124695171489
		1.1142309650979958 0.21461987482914294 -3.6067929759626525
		1.3698574651789914 0.17460327160677547 -4.8484612567538168
		1.5332009324319709 0.14903295430415953 -5.6418782229064304
		;
createNode transform -n "posers_curve_3_sweepMesh" -p "lines_group";
	rename -uid "074691E3-47E8-BB22-8211-9AB00F3AC57B";
createNode mesh -n "posers_curve_3_sweepMeshShape" -p "posers_curve_3_sweepMesh";
	rename -uid "CDD94260-4AC7-27CA-4E4D-03A222805258";
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
	rename -uid "9B3EC085-49FC-A1E8-465F-E2B6972DB06B";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape4" -p "posers_curve_4";
	rename -uid "6D4478E8-4E8E-708F-3E8B-3592C98AE0F3";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.44332944941356489 0.2293 0.12429165612243598
		0.81589936169444277 0.15210114589262197 -1.0662573828875188
		1.1884662931060119 0.074902909440312943 -2.2567968965145218
		1.5610362053868898 -0.0022959446670650641 -3.4473459355244769
		1.933603136798459 -0.079494181119374119 -4.6378854491514794
		2.1696850051746361 -0.12841184492801205 -5.3922862535595337
		;
createNode transform -n "posers_curve_4_sweepMesh" -p "lines_group";
	rename -uid "8CD2B61A-40CD-C377-C645-DCAA7381612C";
createNode mesh -n "posers_curve_4_sweepMeshShape" -p "posers_curve_4_sweepMesh";
	rename -uid "21CF8EAE-495B-A674-D99D-66B97E558CA1";
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
	rename -uid "96CF54EC-44F5-6091-5354-78B45AAC44A1";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape5" -p "posers_curve_5";
	rename -uid "A81E6392-4F06-583B-D997-49B11198740C";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.52851944941356488 0.099720000000000003 0.17442165612243599
		0.96797376470997132 -0.03977193246331151 -0.9688067530526584
		1.4074245150326186 -0.17926273332986417 -2.1120258880458018
		1.8468788303290249 -0.31875466579317568 -3.2552542972208962
		2.2863331456254317 -0.45824659825648717 -4.3984827063959901
		2.562550877461895 -0.54592384672886352 -5.1170555981887658
		;
createNode transform -n "posers_curve_5_sweepMesh" -p "lines_group";
	rename -uid "6D634693-4E87-B320-211F-9CB0C42E364E";
createNode mesh -n "posers_curve_5_sweepMeshShape" -p "posers_curve_5_sweepMesh";
	rename -uid "4C7C7FC2-4669-F65A-0FD5-59B4C0E0E14B";
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
	rename -uid "667F4CF6-4707-3598-ABEE-82A7DA3DB79A";
	setAttr ".v" no;
createNode nurbsCurve -n "posers_curve_Shape6" -p "posers_curve_6";
	rename -uid "3B1D5A42-4D86-BE3F-440A-21B3126881F6";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0.5755494494135649 -0.01788 0.23071165612243594
		1.0648814832200946 -0.19320899794846111 -0.86355750896865546
		1.5542175562526244 -0.36853944316257869 -1.957835706782229
		2.043549590059154 -0.54386844111103982 -3.0521048718733206
		2.5328816238656842 -0.71919743905950095 -4.1463740369644126
		2.8372696167964069 -0.82826048439690758 -4.8270619377686916
		;
createNode transform -n "posers_curve_6_sweepMesh" -p "lines_group";
	rename -uid "F86AB5AE-45A1-C58D-C27D-2EAD8F353805";
createNode mesh -n "posers_curve_6_sweepMeshShape" -p "posers_curve_6_sweepMesh";
	rename -uid "8955A079-4909-4BAC-B675-1C8F1308619A";
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
	rename -uid "7B067A91-4485-7C1B-13C3-598E728746BD";
createNode transform -n "main_1" -p "main_1_group";
	rename -uid "E43F4CFB-4E65-F17C-D3FA-A79D99E0B235";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_1Shape" -p "main_1";
	rename -uid "7568EB01-4E8A-BACC-E29F-20A4A7A90D4F";
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
	rename -uid "BA6F8B6E-447E-1AA1-2AFB-85AB303EE582";
createNode transform -n "main_2" -p "main_2_group";
	rename -uid "47059DA4-4DD2-3A72-5222-759E7204C2ED";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_2Shape" -p "main_2";
	rename -uid "70E22F2C-4114-9DA2-F4E4-ED9D5B66DFDD";
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
	rename -uid "1C606198-4B52-ECF6-132C-8FBB35EEBC5A";
createNode transform -n "main_3" -p "main_3_group";
	rename -uid "B37A2936-4EA0-D689-F6CC-CEAD5CDC197D";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_3Shape" -p "main_3";
	rename -uid "02009902-45CE-8CE1-361F-E790246F6650";
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
	rename -uid "2168540A-4086-16E8-EC9A-09918E1FBCB8";
createNode transform -n "main_4" -p "main_4_group";
	rename -uid "399FA6D5-4550-6A99-BB48-4CADDF0F588C";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "main_4Shape" -p "main_4";
	rename -uid "4D2E0312-4E5D-902E-8C1C-3A8BDDFD2AB2";
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
	setAttr ".t" -type "double3" 0.85025 0 0 ;
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
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		1.7070273939764911 0.31802970729146851 0
		1.3896011504258621 0.31802970729146851 0.3174262435506276
		1.0721749068752362 0.31802970729146851 0
		1.3896011504258621 0.31802970729146851 -0.3174262435506276
		1.7070273939764911 0.31802970729146851 0
		;
createNode transform -n "feather_controls" -p "base";
	rename -uid "F117072C-4949-BABC-7008-D0BA79ECA856";
createNode transform -n "m_feather_1_group" -p "feather_controls";
	rename -uid "E788555C-4FFB-1431-B73C-2AB12C8C1040";
createNode transform -n "m_feather_1" -p "m_feather_1_group";
	rename -uid "FE8F8CC3-4326-DEDF-CBC5-638146005AB6";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_1Shape" -p "m_feather_1";
	rename -uid "CFB07CEF-4F2D-D8F4-4FBA-4CA50A0CE505";
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
	rename -uid "74DDA1E1-489A-0D85-9EE0-CC9BB61F7B3C";
createNode transform -n "m_feather_2_bendGroup" -p "m_feather_2_group";
	rename -uid "E9987694-468D-3ADB-F3F6-3188128FB6B1";
createNode transform -n "m_feather_2_mainGroup" -p "m_feather_2_bendGroup";
	rename -uid "24362BF6-46D9-EF49-8FC7-CA9BB4C50B03";
createNode transform -n "m_feather_2" -p "m_feather_2_mainGroup";
	rename -uid "BCDFA371-48DB-612D-5CF3-CC8D96C89B1F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_2Shape" -p "m_feather_2";
	rename -uid "3585DE45-4EE9-5E81-E55C-90AC3A86CD15";
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
	rename -uid "26B39767-446E-A168-C83F-08B8650956E5";
createNode transform -n "m_feather_3_bendGroup" -p "m_feather_3_group";
	rename -uid "C634CAC1-4FC7-149A-17EA-359AF2EB9842";
createNode transform -n "m_feather_3_mainGroup" -p "m_feather_3_bendGroup";
	rename -uid "A7948647-45F4-80C8-F056-13A6F434D0BD";
createNode transform -n "m_feather_3" -p "m_feather_3_mainGroup";
	rename -uid "59605BF1-47A6-DDD5-2B22-8CBD21AFD4D2";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_3Shape" -p "m_feather_3";
	rename -uid "A8E7671E-45F2-C027-4415-758536CD3EFE";
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
	rename -uid "933C6EE9-4ED9-F4DA-2360-E6B1214B7A20";
createNode transform -n "m_feather_4_bendGroup" -p "m_feather_4_group";
	rename -uid "67F47AAE-441F-A907-C583-A0B2E85B7B6F";
createNode transform -n "m_feather_4_mainGroup" -p "m_feather_4_bendGroup";
	rename -uid "A9D53EEB-4505-ED1A-259C-E582E5009433";
createNode transform -n "m_feather_4" -p "m_feather_4_mainGroup";
	rename -uid "B3B941AC-4312-D81C-ED5A-0B98C58B9574";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_4Shape" -p "m_feather_4";
	rename -uid "6FFB7426-47AD-2D21-98CE-4EAB8A964CAB";
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
	rename -uid "9B58E801-4791-192C-C52B-57B89C5A1C7A";
createNode transform -n "m_feather_5_bendGroup" -p "m_feather_5_group";
	rename -uid "2547DCD6-4400-67C3-0511-D9930446DC22";
createNode transform -n "m_feather_5_mainGroup" -p "m_feather_5_bendGroup";
	rename -uid "E4954C63-4841-4040-9B44-0FAA9B4BFFF2";
createNode transform -n "m_feather_5" -p "m_feather_5_mainGroup";
	rename -uid "5E4FF9DF-4815-113A-E7EE-5F8145FFBB13";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "m_feather_5Shape" -p "m_feather_5";
	rename -uid "4EBC9E9C-4A78-BF72-8E78-8684A9CF8971";
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
	rename -uid "C8F1E81D-41CF-14C1-37CE-4AB183F3775A";
createNode transform -n "l_feather_1_1_spreadRootGroup" -p "l_feather_1_1_group";
	rename -uid "2E8511B4-491B-C583-8EFA-E49184E4EC98";
createNode transform -n "l_feather_1_1_spreadGroup" -p "l_feather_1_1_spreadRootGroup";
	rename -uid "51482CAF-4E88-D3DB-1621-78BB50D17817";
createNode transform -n "l_feather_1_1_rollGroup" -p "l_feather_1_1_spreadGroup";
	rename -uid "4B7F8B1A-479A-09AC-36DF-198537808C38";
createNode transform -n "l_feather_1_1" -p "l_feather_1_1_rollGroup";
	rename -uid "77298D0A-4B0B-1FE5-4667-72A1461994B4";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_1Shape" -p "l_feather_1_1";
	rename -uid "32C4C497-40C4-1DF4-7FAF-5BB4B8ABA858";
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
	rename -uid "9AA115E3-434C-BD90-6481-AE8F534F4DBF";
createNode transform -n "l_feather_1_2_spreadGroup" -p "l_feather_1_2_group";
	rename -uid "F17012BE-4539-755B-3D0E-2393DD847C50";
createNode transform -n "l_feather_1_2_bendGroup" -p "l_feather_1_2_spreadGroup";
	rename -uid "8DC24DFE-49F0-8799-21A6-F08A3F02E670";
createNode transform -n "l_feather_1_2_mainGroup" -p "l_feather_1_2_bendGroup";
	rename -uid "6FE09073-49A5-B3F9-9A4F-C6ACD2E24C6F";
createNode transform -n "l_feather_1_2_rollGroup" -p "l_feather_1_2_mainGroup";
	rename -uid "1B9257FB-4930-D41D-B718-2B951E1A6033";
createNode transform -n "l_feather_1_2" -p "l_feather_1_2_rollGroup";
	rename -uid "582B9E4C-4BB6-715C-ABB7-2A9398C5DC86";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_2Shape" -p "l_feather_1_2";
	rename -uid "76DD6850-4917-969F-C8DF-5A83E591C536";
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
	rename -uid "71E1B147-4C99-1D16-4622-A3B6240E16CB";
createNode transform -n "l_feather_1_3_spreadGroup" -p "l_feather_1_3_group";
	rename -uid "625CACA6-4716-0DBE-204C-DEB1259C48A5";
createNode transform -n "l_feather_1_3_bendGroup" -p "l_feather_1_3_spreadGroup";
	rename -uid "0DA4104A-46EC-C62B-D41D-BC85824C0676";
createNode transform -n "l_feather_1_3_mainGroup" -p "l_feather_1_3_bendGroup";
	rename -uid "D9563D69-4ABC-4B62-25D4-198C24829DAF";
createNode transform -n "l_feather_1_3_rollGroup" -p "l_feather_1_3_mainGroup";
	rename -uid "FF219483-4D18-222B-22F7-0485C5AD67AD";
createNode transform -n "l_feather_1_3" -p "l_feather_1_3_rollGroup";
	rename -uid "3F33E8F1-47C9-D976-31B4-6FA3752ED411";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_3Shape" -p "l_feather_1_3";
	rename -uid "D2F86675-49F9-D67E-8F55-71A32AD24123";
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
	rename -uid "CBE32612-4868-A5A5-6D40-BF80133BFED1";
createNode transform -n "l_feather_1_4_spreadGroup" -p "l_feather_1_4_group";
	rename -uid "0C14C8B4-4916-9DB8-9EC6-4CA68C272F9D";
createNode transform -n "l_feather_1_4_bendGroup" -p "l_feather_1_4_spreadGroup";
	rename -uid "97C0F2E8-4082-35A1-F417-1D8AE7189EFF";
createNode transform -n "l_feather_1_4_mainGroup" -p "l_feather_1_4_bendGroup";
	rename -uid "48AC5F1B-4D05-40DA-94D3-738536CB5D04";
createNode transform -n "l_feather_1_4_rollGroup" -p "l_feather_1_4_mainGroup";
	rename -uid "08B5BC94-4D70-BC23-9670-30B9C759D1CE";
createNode transform -n "l_feather_1_4" -p "l_feather_1_4_rollGroup";
	rename -uid "2C3D0633-4532-33A4-3F5C-6F90ED859FC3";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_4Shape" -p "l_feather_1_4";
	rename -uid "1BD5D42E-4893-BEC8-C8B0-E9BD2E6B1FBD";
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
	rename -uid "7D8F2095-4B18-E306-198C-5FBC80A5847C";
createNode transform -n "l_feather_1_5_spreadGroup" -p "l_feather_1_5_group";
	rename -uid "F4109A57-4D00-C508-0F88-CD97AACCD1FB";
createNode transform -n "l_feather_1_5_bendGroup" -p "l_feather_1_5_spreadGroup";
	rename -uid "F3F454B1-4E3B-58BA-E9AB-9DBD8807FB13";
createNode transform -n "l_feather_1_5_mainGroup" -p "l_feather_1_5_bendGroup";
	rename -uid "4D1E98FB-444A-ADA4-DBE5-35AF60349223";
createNode transform -n "l_feather_1_5_rollGroup" -p "l_feather_1_5_mainGroup";
	rename -uid "CDB059A4-4BF4-9CF4-0BC6-1B93BB26E965";
createNode transform -n "l_feather_1_5" -p "l_feather_1_5_rollGroup";
	rename -uid "204B1205-4CFF-91D0-A948-04A67E422FB2";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_1_5Shape" -p "l_feather_1_5";
	rename -uid "F413F1C2-4CE0-5CAA-376A-A982ADF4BD2F";
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
	rename -uid "6EB65D89-4AE5-1AD6-6426-579EE9748EEA";
createNode transform -n "l_feather_2_1_spreadRootGroup" -p "l_feather_2_1_group";
	rename -uid "BD076BFD-4666-2C1B-2C20-2A98A5576DDD";
createNode transform -n "l_feather_2_1_spreadGroup" -p "l_feather_2_1_spreadRootGroup";
	rename -uid "EDFAB493-4004-1FD0-BDC6-08ADFECC581F";
createNode transform -n "l_feather_2_1_rollGroup" -p "l_feather_2_1_spreadGroup";
	rename -uid "1E160919-487B-F0B4-101F-9497326FF3FB";
createNode transform -n "l_feather_2_1" -p "l_feather_2_1_rollGroup";
	rename -uid "DB8A9D4E-48BA-5FF7-FD73-74AD6501244F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_1Shape" -p "l_feather_2_1";
	rename -uid "9611E7BA-4F2B-0F96-E69D-788EDACB612E";
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
	rename -uid "C342DCC0-4A54-5D0E-C5BF-4DBE1208D468";
createNode transform -n "l_feather_2_2_spreadGroup" -p "l_feather_2_2_group";
	rename -uid "1918EDCC-4607-350A-28B9-EEB318016AAE";
createNode transform -n "l_feather_2_2_bendGroup" -p "l_feather_2_2_spreadGroup";
	rename -uid "9D0B5C63-4ACC-E95A-A2BF-9DB839F0E881";
createNode transform -n "l_feather_2_2_mainGroup" -p "l_feather_2_2_bendGroup";
	rename -uid "B43CCCC7-459B-7FF9-E961-63AD4193910B";
createNode transform -n "l_feather_2_2_rollGroup" -p "l_feather_2_2_mainGroup";
	rename -uid "D6150F63-4816-65A5-DAF6-C19EADB53321";
createNode transform -n "l_feather_2_2" -p "l_feather_2_2_rollGroup";
	rename -uid "4B848ABB-4968-3391-931D-46A5EF23F44B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_2Shape" -p "l_feather_2_2";
	rename -uid "78259473-4CA0-FD7E-A8B3-F8BBFFBD6A77";
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
	rename -uid "582F9BCF-494C-2FCB-03AB-9493F475ED19";
createNode transform -n "l_feather_2_3_spreadGroup" -p "l_feather_2_3_group";
	rename -uid "52482201-46B8-F906-F981-3284EB343069";
createNode transform -n "l_feather_2_3_bendGroup" -p "l_feather_2_3_spreadGroup";
	rename -uid "381BF2C6-4600-2F48-7A97-CB8160CB39C4";
createNode transform -n "l_feather_2_3_mainGroup" -p "l_feather_2_3_bendGroup";
	rename -uid "F83132BC-4F08-A6E7-D1D4-8488F1409385";
createNode transform -n "l_feather_2_3_rollGroup" -p "l_feather_2_3_mainGroup";
	rename -uid "992B2F16-4832-4C49-3084-998C57DDB30E";
createNode transform -n "l_feather_2_3" -p "l_feather_2_3_rollGroup";
	rename -uid "8897F456-4F36-D65E-7FF5-BC99A0C23D8C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_3Shape" -p "l_feather_2_3";
	rename -uid "400E1F75-44AE-D48D-857C-998A13DFB446";
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
	rename -uid "36102FEB-49B5-7F62-02E7-08BB6491199E";
createNode transform -n "l_feather_2_4_spreadGroup" -p "l_feather_2_4_group";
	rename -uid "E65843AE-4DC2-919D-7053-66B668E422EB";
createNode transform -n "l_feather_2_4_bendGroup" -p "l_feather_2_4_spreadGroup";
	rename -uid "D82B07F8-4AD6-D87A-680E-9EA1B2081FF9";
createNode transform -n "l_feather_2_4_mainGroup" -p "l_feather_2_4_bendGroup";
	rename -uid "2A33BA4A-4207-DB4B-D437-36A05DAA3224";
createNode transform -n "l_feather_2_4_rollGroup" -p "l_feather_2_4_mainGroup";
	rename -uid "F0AEF123-462E-61AD-FB36-D6B5952917C9";
createNode transform -n "l_feather_2_4" -p "l_feather_2_4_rollGroup";
	rename -uid "C105BD59-4482-D08D-1B20-139C527B4F1F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_4Shape" -p "l_feather_2_4";
	rename -uid "ABF54FB4-4369-C00B-3476-908FE0C71986";
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
	rename -uid "240C73A0-4C25-2341-E918-8A8142CEBED8";
createNode transform -n "l_feather_2_5_spreadGroup" -p "l_feather_2_5_group";
	rename -uid "225E2D6E-4CC3-19E8-0B82-72BD163A2767";
createNode transform -n "l_feather_2_5_bendGroup" -p "l_feather_2_5_spreadGroup";
	rename -uid "B292E943-4B65-B5D7-1F91-ECB323B582A0";
createNode transform -n "l_feather_2_5_mainGroup" -p "l_feather_2_5_bendGroup";
	rename -uid "0152C066-4607-C541-6B32-70A82B0F2EA3";
createNode transform -n "l_feather_2_5_rollGroup" -p "l_feather_2_5_mainGroup";
	rename -uid "73B248BE-4B9D-6795-469B-09A69B5ED946";
createNode transform -n "l_feather_2_5" -p "l_feather_2_5_rollGroup";
	rename -uid "A76F39E4-4871-C643-CD57-63AAAF7BBE04";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_2_5Shape" -p "l_feather_2_5";
	rename -uid "7CEACEEC-4168-9299-8ABF-2AB14026A800";
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
	rename -uid "499F2193-4DA0-21E4-2A71-1A895AC6B9B5";
createNode transform -n "l_feather_3_1_spreadRootGroup" -p "l_feather_3_1_group";
	rename -uid "9E7BB5FB-4C6C-3281-F139-86934C762AFC";
createNode transform -n "l_feather_3_1_spreadGroup" -p "l_feather_3_1_spreadRootGroup";
	rename -uid "F88F8540-48F3-CDB8-9A67-23807EB8FB52";
createNode transform -n "l_feather_3_1_rollGroup" -p "l_feather_3_1_spreadGroup";
	rename -uid "DA92077B-4E9F-A67E-D807-BF9BCB33E61C";
createNode transform -n "l_feather_3_1" -p "l_feather_3_1_rollGroup";
	rename -uid "B3F8611E-4B8C-60A9-7F17-DBA5A302689D";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_1Shape" -p "l_feather_3_1";
	rename -uid "CB319753-4185-E377-9790-5A988A5B5279";
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
	rename -uid "A4ADF365-448D-1FCC-6396-07B1FFF15EA5";
createNode transform -n "l_feather_3_2_spreadGroup" -p "l_feather_3_2_group";
	rename -uid "0C680FF1-447B-7185-9D2E-2EA2227C70DE";
createNode transform -n "l_feather_3_2_bendGroup" -p "l_feather_3_2_spreadGroup";
	rename -uid "BE59678B-4324-0BAE-4975-A0B68B0DE092";
createNode transform -n "l_feather_3_2_mainGroup" -p "l_feather_3_2_bendGroup";
	rename -uid "77CEE16E-4E38-2DF8-C6F6-B68BF74F5070";
createNode transform -n "l_feather_3_2_rollGroup" -p "l_feather_3_2_mainGroup";
	rename -uid "639E394F-4B77-34CE-2E44-8084407F713B";
createNode transform -n "l_feather_3_2" -p "l_feather_3_2_rollGroup";
	rename -uid "34E70B41-4FCE-8264-2ACB-0F90BC0F49B9";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_2Shape" -p "l_feather_3_2";
	rename -uid "8A7AFAE4-47DC-1B97-10B6-59B807A93708";
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
	rename -uid "5AFC33EF-40A7-5D0C-A806-A5B73CEC0A48";
createNode transform -n "l_feather_3_3_spreadGroup" -p "l_feather_3_3_group";
	rename -uid "A621C5D4-41F8-73FB-8444-838D61E48470";
createNode transform -n "l_feather_3_3_bendGroup" -p "l_feather_3_3_spreadGroup";
	rename -uid "07E4A529-4E6C-2FA8-31FD-20A890AD460E";
createNode transform -n "l_feather_3_3_mainGroup" -p "l_feather_3_3_bendGroup";
	rename -uid "04A0054B-43B9-82B4-2588-80B6C0F2A17D";
createNode transform -n "l_feather_3_3_rollGroup" -p "l_feather_3_3_mainGroup";
	rename -uid "7AEBBA1F-427D-9FDE-75C5-59802D30D89D";
createNode transform -n "l_feather_3_3" -p "l_feather_3_3_rollGroup";
	rename -uid "11ACAC3D-4515-3520-19A0-228EC694B6E0";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_3Shape" -p "l_feather_3_3";
	rename -uid "C07C4423-43C6-1174-5656-E4929F105B58";
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
	rename -uid "0C4097EE-467A-5321-FCC8-25A331AB750A";
createNode transform -n "l_feather_3_4_spreadGroup" -p "l_feather_3_4_group";
	rename -uid "4AAA9324-410E-B2E8-7800-269088E2E440";
createNode transform -n "l_feather_3_4_bendGroup" -p "l_feather_3_4_spreadGroup";
	rename -uid "989B012B-466B-F9E3-3AE5-FA84AB69AEE5";
createNode transform -n "l_feather_3_4_mainGroup" -p "l_feather_3_4_bendGroup";
	rename -uid "971987C0-455D-C67F-8669-40AE418CF505";
createNode transform -n "l_feather_3_4_rollGroup" -p "l_feather_3_4_mainGroup";
	rename -uid "EE44FB01-4F14-D2CB-622D-2BB374E413B4";
createNode transform -n "l_feather_3_4" -p "l_feather_3_4_rollGroup";
	rename -uid "0BD48E4B-4195-0B2A-EE2D-5EB1F309C10D";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_4Shape" -p "l_feather_3_4";
	rename -uid "9C47BCEA-43C9-FD38-165E-33A3C1A81313";
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
	rename -uid "005662DB-4D62-CC41-F681-1F9EAA7E74A1";
createNode transform -n "l_feather_3_5_spreadGroup" -p "l_feather_3_5_group";
	rename -uid "B8C0CBF7-4631-B162-94D7-E8B06B926BDB";
createNode transform -n "l_feather_3_5_bendGroup" -p "l_feather_3_5_spreadGroup";
	rename -uid "780F5A3F-4197-F6EC-2E4D-18BF7EEBE0BA";
createNode transform -n "l_feather_3_5_mainGroup" -p "l_feather_3_5_bendGroup";
	rename -uid "5AA1CEDA-4F44-69F1-AD48-06A996422C00";
createNode transform -n "l_feather_3_5_rollGroup" -p "l_feather_3_5_mainGroup";
	rename -uid "73DC7EB8-481C-A19A-3B52-21B214F8E4C2";
createNode transform -n "l_feather_3_5" -p "l_feather_3_5_rollGroup";
	rename -uid "8AC2C41C-4025-EB7C-133D-86A79275EDCE";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_3_5Shape" -p "l_feather_3_5";
	rename -uid "21372E1A-4C9B-042E-556A-C0925BD647B2";
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
	rename -uid "1A98EAED-4931-9299-56B2-F0A8EC2F94F1";
createNode transform -n "l_feather_4_1_spreadRootGroup" -p "l_feather_4_1_group";
	rename -uid "346A8402-44B5-D4DD-A4CC-EEBD50830EB7";
createNode transform -n "l_feather_4_1_spreadGroup" -p "l_feather_4_1_spreadRootGroup";
	rename -uid "9CFAEACC-4E80-9D54-C3CD-DDBFDA4FF15F";
createNode transform -n "l_feather_4_1_rollGroup" -p "l_feather_4_1_spreadGroup";
	rename -uid "97EDAB92-4F9A-2538-314A-36A4F6AB84C1";
createNode transform -n "l_feather_4_1" -p "l_feather_4_1_rollGroup";
	rename -uid "886C6C4C-487C-10B2-104F-C4A25A15D26B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_1Shape" -p "l_feather_4_1";
	rename -uid "F6A3092A-42C4-2B96-7A1A-5D8B12659B3D";
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
	rename -uid "C35C57E9-4846-0C24-DF0C-1AAFB20F79C7";
createNode transform -n "l_feather_4_2_spreadGroup" -p "l_feather_4_2_group";
	rename -uid "853C7D2D-439F-A9AD-DEFE-2183CC7B4215";
createNode transform -n "l_feather_4_2_bendGroup" -p "l_feather_4_2_spreadGroup";
	rename -uid "5F2C6EFB-4E46-6E33-C051-8F8641CA38A8";
createNode transform -n "l_feather_4_2_mainGroup" -p "l_feather_4_2_bendGroup";
	rename -uid "09C06714-419C-6F2F-611E-6698AA6AEB30";
createNode transform -n "l_feather_4_2_rollGroup" -p "l_feather_4_2_mainGroup";
	rename -uid "1E151FA7-4207-42D7-A9C4-E6BA4AE93312";
createNode transform -n "l_feather_4_2" -p "l_feather_4_2_rollGroup";
	rename -uid "04ABCD01-46B2-5E1E-0FA5-7B8CF917F0D8";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_2Shape" -p "l_feather_4_2";
	rename -uid "10A0BE3E-4CA2-44E5-55AE-C88F81EE2AFE";
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
	rename -uid "2FCF3AEA-49CA-3626-A8A3-719CA136DEE2";
createNode transform -n "l_feather_4_3_spreadGroup" -p "l_feather_4_3_group";
	rename -uid "6BC810E4-4A93-D6AC-1E74-00B4EF6EEF11";
createNode transform -n "l_feather_4_3_bendGroup" -p "l_feather_4_3_spreadGroup";
	rename -uid "269EF992-4CC7-14CA-15BD-5685FE9B26E6";
createNode transform -n "l_feather_4_3_mainGroup" -p "l_feather_4_3_bendGroup";
	rename -uid "4BF176B9-4295-D21B-1051-958C6489D7DC";
createNode transform -n "l_feather_4_3_rollGroup" -p "l_feather_4_3_mainGroup";
	rename -uid "7003C6D6-4D4E-FB96-6F38-70B2B5A5C970";
createNode transform -n "l_feather_4_3" -p "l_feather_4_3_rollGroup";
	rename -uid "81C859E8-4C60-CAE6-D390-8F9D2ED76861";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_3Shape" -p "l_feather_4_3";
	rename -uid "B54DC4F3-4130-7E5D-6133-6AA46DBD9BFD";
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
	rename -uid "E057E912-4BF9-D7D1-AB28-C8BA6F3D2F45";
createNode transform -n "l_feather_4_4_spreadGroup" -p "l_feather_4_4_group";
	rename -uid "9003F783-4AC2-4568-6C2C-25A42B94044F";
createNode transform -n "l_feather_4_4_bendGroup" -p "l_feather_4_4_spreadGroup";
	rename -uid "F120E7D3-44F2-5C14-4BF7-419CAACC62F2";
createNode transform -n "l_feather_4_4_mainGroup" -p "l_feather_4_4_bendGroup";
	rename -uid "53EC6E8C-48A9-DFD8-CCBA-F685BB92E29A";
createNode transform -n "l_feather_4_4_rollGroup" -p "l_feather_4_4_mainGroup";
	rename -uid "C3FD41BE-4B95-0019-D544-E7AB9AAA306E";
createNode transform -n "l_feather_4_4" -p "l_feather_4_4_rollGroup";
	rename -uid "E4BF3997-4F90-81D8-A918-D8B185616668";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_4Shape" -p "l_feather_4_4";
	rename -uid "F42F55C9-4A93-ECA0-B29F-15BCCBB1FCE7";
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
	rename -uid "A1AC441D-4C73-1940-F8F4-BC9D8DEDAD60";
createNode transform -n "l_feather_4_5_spreadGroup" -p "l_feather_4_5_group";
	rename -uid "B362AD26-4030-D7D5-3C9A-8D9F43AE6A47";
createNode transform -n "l_feather_4_5_bendGroup" -p "l_feather_4_5_spreadGroup";
	rename -uid "6A87112F-4828-3182-F9FE-87BD44BA0EEF";
createNode transform -n "l_feather_4_5_mainGroup" -p "l_feather_4_5_bendGroup";
	rename -uid "0A7B9C5E-4E2D-7121-6252-BD9E6A9E89A4";
createNode transform -n "l_feather_4_5_rollGroup" -p "l_feather_4_5_mainGroup";
	rename -uid "BC4376B5-40FD-FDF3-9DB4-2185DC2C32D6";
createNode transform -n "l_feather_4_5" -p "l_feather_4_5_rollGroup";
	rename -uid "5B2C4F05-49F6-A154-4113-639CA2EB7440";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_4_5Shape" -p "l_feather_4_5";
	rename -uid "5B516457-4F50-DF84-3244-5A8BDB87DC4D";
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
	rename -uid "8227C468-4026-039C-DBEF-01B76824DBB4";
createNode transform -n "l_feather_5_1_spreadRootGroup" -p "l_feather_5_1_group";
	rename -uid "0BB22BC8-49C3-4F61-6664-F08570F3E6BE";
createNode transform -n "l_feather_5_1_spreadGroup" -p "l_feather_5_1_spreadRootGroup";
	rename -uid "F7E3174C-45E6-0989-7DA3-8AA3969C1FD3";
createNode transform -n "l_feather_5_1_rollGroup" -p "l_feather_5_1_spreadGroup";
	rename -uid "B2BF369C-436B-06EC-66A2-F68C8BF5761F";
createNode transform -n "l_feather_5_1" -p "l_feather_5_1_rollGroup";
	rename -uid "FB7D9102-4335-D5E3-AB19-A889797D6DA8";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_1Shape" -p "l_feather_5_1";
	rename -uid "27171E90-4534-F210-D4B0-6A803E43F958";
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
	rename -uid "E5F4B74B-4A97-9B64-9709-0FA7EC6DC064";
createNode transform -n "l_feather_5_2_spreadGroup" -p "l_feather_5_2_group";
	rename -uid "DBDB7620-4286-E5EF-4182-7DA47247E2C8";
createNode transform -n "l_feather_5_2_bendGroup" -p "l_feather_5_2_spreadGroup";
	rename -uid "CDE9C627-45E2-037B-A6F3-EBACD864EAFF";
createNode transform -n "l_feather_5_2_mainGroup" -p "l_feather_5_2_bendGroup";
	rename -uid "C32CE42E-412C-9448-87CA-C38A05FECFC8";
createNode transform -n "l_feather_5_2_rollGroup" -p "l_feather_5_2_mainGroup";
	rename -uid "3A825600-4EE9-88DA-1F02-2FBDF572D5CD";
createNode transform -n "l_feather_5_2" -p "l_feather_5_2_rollGroup";
	rename -uid "C78512A6-46A3-9AC8-4E23-C2A06060245C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_2Shape" -p "l_feather_5_2";
	rename -uid "AA16FBDC-4E80-202D-C28A-669CE60C1C6D";
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
	rename -uid "4D3E53A1-4481-613C-C727-D78009888CF1";
createNode transform -n "l_feather_5_3_spreadGroup" -p "l_feather_5_3_group";
	rename -uid "29E86F87-4AEC-3D63-14F7-28815568FE8A";
createNode transform -n "l_feather_5_3_bendGroup" -p "l_feather_5_3_spreadGroup";
	rename -uid "C49C9477-40FA-ADEF-FD6E-9484A30AC389";
createNode transform -n "l_feather_5_3_mainGroup" -p "l_feather_5_3_bendGroup";
	rename -uid "AEB8C249-4610-E168-0BC9-B8A8F73444DC";
createNode transform -n "l_feather_5_3_rollGroup" -p "l_feather_5_3_mainGroup";
	rename -uid "BE638531-4B7E-D75A-4CE6-258B96E01FB3";
createNode transform -n "l_feather_5_3" -p "l_feather_5_3_rollGroup";
	rename -uid "11D3F4B3-4ED3-33C2-56D9-A9BBA0911219";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_3Shape" -p "l_feather_5_3";
	rename -uid "34FC7B0B-4D86-E06D-FF06-59B342F73325";
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
	rename -uid "D483C714-46BA-FE59-144D-E89E47919596";
createNode transform -n "l_feather_5_4_spreadGroup" -p "l_feather_5_4_group";
	rename -uid "5C711716-4065-6E48-44EB-2BB13189F834";
createNode transform -n "l_feather_5_4_bendGroup" -p "l_feather_5_4_spreadGroup";
	rename -uid "B29CA335-4F7B-7A17-BFA5-9B842C5F87CA";
createNode transform -n "l_feather_5_4_mainGroup" -p "l_feather_5_4_bendGroup";
	rename -uid "2EE1F4EC-4F32-A420-36B4-C590E66C3F8B";
createNode transform -n "l_feather_5_4_rollGroup" -p "l_feather_5_4_mainGroup";
	rename -uid "DF8B768B-4114-B029-ED8C-D2AF67632790";
createNode transform -n "l_feather_5_4" -p "l_feather_5_4_rollGroup";
	rename -uid "393D6977-4275-AF8A-12D0-D0B0759077E4";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_4Shape" -p "l_feather_5_4";
	rename -uid "89A3D43B-4144-F79B-632C-E7BDE6665C7D";
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
	rename -uid "0AF84265-4393-C2E2-491C-A1B418047FF4";
createNode transform -n "l_feather_5_5_spreadGroup" -p "l_feather_5_5_group";
	rename -uid "9B419E59-401A-921D-DED0-C2B290F3851F";
createNode transform -n "l_feather_5_5_bendGroup" -p "l_feather_5_5_spreadGroup";
	rename -uid "AEDD49AF-4303-1372-D12C-E189A9F6A1BE";
createNode transform -n "l_feather_5_5_mainGroup" -p "l_feather_5_5_bendGroup";
	rename -uid "0935223F-4ABD-30A7-007B-24A29EEC2511";
createNode transform -n "l_feather_5_5_rollGroup" -p "l_feather_5_5_mainGroup";
	rename -uid "82979DC3-44F1-8793-F402-5E8C0798AF14";
createNode transform -n "l_feather_5_5" -p "l_feather_5_5_rollGroup";
	rename -uid "B6275D71-4D9B-EE08-5CA2-0FB4EE436F96";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "l_feather_5_5Shape" -p "l_feather_5_5";
	rename -uid "9A2FF884-4E86-9E17-5A3A-C7BC537F5C43";
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
	rename -uid "1EE67B22-4DE8-649C-8B71-5E802052F28B";
createNode transform -n "r_feather_1_1_spreadRootGroup" -p "r_feather_1_1_group";
	rename -uid "C5E446E6-43DD-5106-AA97-91846569A4C7";
createNode transform -n "r_feather_1_1_spreadGroup" -p "r_feather_1_1_spreadRootGroup";
	rename -uid "2CFB2CEC-4B9E-24A2-BC6C-11AE85987671";
createNode transform -n "r_feather_1_1_rollGroup" -p "r_feather_1_1_spreadGroup";
	rename -uid "89AE44E9-4E6F-1FF4-45A3-288E7D6122F8";
createNode transform -n "r_feather_1_1" -p "r_feather_1_1_rollGroup";
	rename -uid "387C2E61-448D-2F1A-825A-35AD222F5D8C";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_1Shape" -p "r_feather_1_1";
	rename -uid "E1F142CD-4681-AD76-904C-A5A0592F4E20";
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
	rename -uid "427F2313-4333-D0AF-C193-52AB562E8937";
createNode transform -n "r_feather_1_2_spreadGroup" -p "r_feather_1_2_group";
	rename -uid "D87A6D20-4D61-ECCF-C718-3A998DBD1AAE";
createNode transform -n "r_feather_1_2_bendGroup" -p "r_feather_1_2_spreadGroup";
	rename -uid "23AD8E66-49D2-A0E3-AE0B-8C8D3D0F7801";
createNode transform -n "r_feather_1_2_mainGroup" -p "r_feather_1_2_bendGroup";
	rename -uid "D7B57FF5-4F3E-166B-AE93-369EFA3047F9";
createNode transform -n "r_feather_1_2_rollGroup" -p "r_feather_1_2_mainGroup";
	rename -uid "B456EA53-4F44-06FE-22FF-78B66EC7AFDA";
createNode transform -n "r_feather_1_2" -p "r_feather_1_2_rollGroup";
	rename -uid "582E8AB0-43A7-0E1D-660A-A696AC0286E4";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_2Shape" -p "r_feather_1_2";
	rename -uid "ACAB47F3-494F-47BD-F18A-36BE5FCD46B3";
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
	rename -uid "05223A74-4D14-D985-94E6-98858CF63A67";
createNode transform -n "r_feather_1_3_spreadGroup" -p "r_feather_1_3_group";
	rename -uid "547CDBB0-41E0-B80C-00CC-F589FF0DB021";
createNode transform -n "r_feather_1_3_bendGroup" -p "r_feather_1_3_spreadGroup";
	rename -uid "FA8D7F77-4916-EA63-3C5A-938931C884D0";
createNode transform -n "r_feather_1_3_mainGroup" -p "r_feather_1_3_bendGroup";
	rename -uid "2601C0E7-4B90-B17E-C8CA-EEBBF973F1C7";
createNode transform -n "r_feather_1_3_rollGroup" -p "r_feather_1_3_mainGroup";
	rename -uid "1523DA5B-4DA3-942E-591F-DAB0788C0562";
createNode transform -n "r_feather_1_3" -p "r_feather_1_3_rollGroup";
	rename -uid "2FCF7955-431D-2790-3767-92B5ABCEF358";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_3Shape" -p "r_feather_1_3";
	rename -uid "BA30A83C-460A-B9BE-0EA2-6C841ED8589E";
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
	rename -uid "52062945-441C-F9C9-5B33-2084FA3B8A1D";
createNode transform -n "r_feather_1_4_spreadGroup" -p "r_feather_1_4_group";
	rename -uid "802A96BE-49C7-F412-CC47-0EA470C3077B";
createNode transform -n "r_feather_1_4_bendGroup" -p "r_feather_1_4_spreadGroup";
	rename -uid "0D1E9DC9-4E9A-95B3-D7EB-3497EDAFEFDA";
createNode transform -n "r_feather_1_4_mainGroup" -p "r_feather_1_4_bendGroup";
	rename -uid "E8746035-436E-CD54-808A-5798C4ED3F93";
createNode transform -n "r_feather_1_4_rollGroup" -p "r_feather_1_4_mainGroup";
	rename -uid "3775FFE8-432C-F648-1B3F-9499FF101D4C";
createNode transform -n "r_feather_1_4" -p "r_feather_1_4_rollGroup";
	rename -uid "45564929-4CE9-E082-E8F2-C4A1BE3CA877";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_4Shape" -p "r_feather_1_4";
	rename -uid "D60D8165-4947-18EB-9851-7F98A4B8D9B9";
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
	rename -uid "8C62CDA2-447B-F04C-3620-9D9FBEE641C4";
createNode transform -n "r_feather_1_5_spreadGroup" -p "r_feather_1_5_group";
	rename -uid "B0D029D2-4AD8-4265-3480-6BB32755BFBB";
createNode transform -n "r_feather_1_5_bendGroup" -p "r_feather_1_5_spreadGroup";
	rename -uid "38CA0420-4C08-2205-416B-A1B7715016D3";
createNode transform -n "r_feather_1_5_mainGroup" -p "r_feather_1_5_bendGroup";
	rename -uid "B7A77344-41C9-CB5E-9AF4-DCB43D1A9939";
createNode transform -n "r_feather_1_5_rollGroup" -p "r_feather_1_5_mainGroup";
	rename -uid "3A6318C7-483C-550D-6B6B-A89B65E0CD44";
createNode transform -n "r_feather_1_5" -p "r_feather_1_5_rollGroup";
	rename -uid "1A9B1A58-42E9-9CB2-668C-CC80AF4F25AD";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_1_5Shape" -p "r_feather_1_5";
	rename -uid "4397B265-4BEE-4199-530D-ABAF2D69D914";
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
	rename -uid "9D9A0BE8-411D-3524-915B-76AC8B5A3FD4";
createNode transform -n "r_feather_2_1_spreadRootGroup" -p "r_feather_2_1_group";
	rename -uid "C27CC5BC-4C95-019F-BFC9-2F9A7C9F44BD";
createNode transform -n "r_feather_2_1_spreadGroup" -p "r_feather_2_1_spreadRootGroup";
	rename -uid "BF6CE46D-49CD-8269-667F-F9AB511B02BA";
createNode transform -n "r_feather_2_1_rollGroup" -p "r_feather_2_1_spreadGroup";
	rename -uid "8468D810-4F09-BF8F-FEAB-2D96780FD567";
createNode transform -n "r_feather_2_1" -p "r_feather_2_1_rollGroup";
	rename -uid "17401A07-4D16-2B1E-FE68-BCA2A1A180C0";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_1Shape" -p "r_feather_2_1";
	rename -uid "5F97CE5B-4104-EBDA-EA11-189913F459C2";
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
	rename -uid "31F44918-4665-6520-9BA6-28950E2C2B68";
createNode transform -n "r_feather_2_2_spreadGroup" -p "r_feather_2_2_group";
	rename -uid "9C58FE3B-443E-6972-5277-72A37342D5CB";
createNode transform -n "r_feather_2_2_bendGroup" -p "r_feather_2_2_spreadGroup";
	rename -uid "B07828D1-4400-FA24-1319-D585D19DED18";
createNode transform -n "r_feather_2_2_mainGroup" -p "r_feather_2_2_bendGroup";
	rename -uid "9108445F-4A38-D82A-9C48-E5A8BD1A2C93";
createNode transform -n "r_feather_2_2_rollGroup" -p "r_feather_2_2_mainGroup";
	rename -uid "59279855-45AC-103C-99D4-B6B569376FF8";
createNode transform -n "r_feather_2_2" -p "r_feather_2_2_rollGroup";
	rename -uid "A7526303-4C88-921A-F566-949BC7A5C89A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_2Shape" -p "r_feather_2_2";
	rename -uid "28A496F2-4595-2EA8-EE9A-F285BA749908";
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
	rename -uid "B12DBB94-419B-8E19-48BB-DC90C9915DCB";
createNode transform -n "r_feather_2_3_spreadGroup" -p "r_feather_2_3_group";
	rename -uid "854285B0-415F-BAF7-2E22-85A71C84117F";
createNode transform -n "r_feather_2_3_bendGroup" -p "r_feather_2_3_spreadGroup";
	rename -uid "A192A864-477A-0D59-D4DC-BB87D85CB2DD";
createNode transform -n "r_feather_2_3_mainGroup" -p "r_feather_2_3_bendGroup";
	rename -uid "292C7787-4E0B-7120-7722-4D803A531DA0";
createNode transform -n "r_feather_2_3_rollGroup" -p "r_feather_2_3_mainGroup";
	rename -uid "9EA564E9-4BF4-5733-F34B-67AE7B1BDC7B";
createNode transform -n "r_feather_2_3" -p "r_feather_2_3_rollGroup";
	rename -uid "5B20EF6D-4B40-53D3-480E-DA9D572FF915";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_3Shape" -p "r_feather_2_3";
	rename -uid "864C2761-4555-2B13-48FA-D68673D35A71";
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
	rename -uid "35D2CBB1-49F3-D221-4A12-FEB5CB154671";
createNode transform -n "r_feather_2_4_spreadGroup" -p "r_feather_2_4_group";
	rename -uid "6AF76960-450A-AC7A-638E-61A1565EB5F2";
createNode transform -n "r_feather_2_4_bendGroup" -p "r_feather_2_4_spreadGroup";
	rename -uid "D645CE72-4F79-6240-C42D-7FA8B7A41F39";
createNode transform -n "r_feather_2_4_mainGroup" -p "r_feather_2_4_bendGroup";
	rename -uid "D654AD8F-468B-0671-0709-F48B785CCA28";
createNode transform -n "r_feather_2_4_rollGroup" -p "r_feather_2_4_mainGroup";
	rename -uid "90448F3B-4A4D-BDAC-E575-1D95061EA160";
createNode transform -n "r_feather_2_4" -p "r_feather_2_4_rollGroup";
	rename -uid "3EA357F8-4E22-20B3-ED29-D1840E787D8A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_4Shape" -p "r_feather_2_4";
	rename -uid "698848EC-432A-F6D1-6582-55BD6DA2F328";
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
	rename -uid "B99F3566-4CF3-0A4D-C482-14A2EEB12D13";
createNode transform -n "r_feather_2_5_spreadGroup" -p "r_feather_2_5_group";
	rename -uid "827A3F90-4115-66B6-56FD-05BC04C55445";
createNode transform -n "r_feather_2_5_bendGroup" -p "r_feather_2_5_spreadGroup";
	rename -uid "62644A05-494B-17D4-E4CB-129529686278";
createNode transform -n "r_feather_2_5_mainGroup" -p "r_feather_2_5_bendGroup";
	rename -uid "2B864574-4054-43AE-FB56-D8965E2AB59D";
createNode transform -n "r_feather_2_5_rollGroup" -p "r_feather_2_5_mainGroup";
	rename -uid "52F503AE-4DD8-FF30-EF4B-9D91659BF830";
createNode transform -n "r_feather_2_5" -p "r_feather_2_5_rollGroup";
	rename -uid "53BDA326-451A-03BB-4AAF-D08349630E46";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_2_5Shape" -p "r_feather_2_5";
	rename -uid "EFCA5BF7-4F9F-32CC-047E-2B911078DD3A";
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
	rename -uid "9758DF90-4877-64BB-330D-8884B7BB0CC0";
createNode transform -n "r_feather_3_1_spreadRootGroup" -p "r_feather_3_1_group";
	rename -uid "9973B283-4F09-96F7-EB83-6A8E557DE82B";
createNode transform -n "r_feather_3_1_spreadGroup" -p "r_feather_3_1_spreadRootGroup";
	rename -uid "3FB3E892-4F6A-E23D-9E05-F7B3382F75BF";
createNode transform -n "r_feather_3_1_rollGroup" -p "r_feather_3_1_spreadGroup";
	rename -uid "87C91412-4129-CCF4-0A45-D7A6EBEC00D4";
createNode transform -n "r_feather_3_1" -p "r_feather_3_1_rollGroup";
	rename -uid "ABAC6C8F-487D-671B-6DFF-60B0BE110273";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_1Shape" -p "r_feather_3_1";
	rename -uid "27B6426F-4F51-0C70-A12F-8993C9962D15";
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
	rename -uid "00BEC0AD-497C-1932-C6A2-F6A451A33ACF";
createNode transform -n "r_feather_3_2_spreadGroup" -p "r_feather_3_2_group";
	rename -uid "027CC0EB-4845-50D6-045D-53B8938955ED";
createNode transform -n "r_feather_3_2_bendGroup" -p "r_feather_3_2_spreadGroup";
	rename -uid "6CAD70C4-47C3-6E3F-B994-688AAA153EC3";
createNode transform -n "r_feather_3_2_mainGroup" -p "r_feather_3_2_bendGroup";
	rename -uid "349E8FAC-490C-B287-56DB-43A034EAA81F";
createNode transform -n "r_feather_3_2_rollGroup" -p "r_feather_3_2_mainGroup";
	rename -uid "EFB6CE3F-4429-1738-4A65-448E8FA296D1";
createNode transform -n "r_feather_3_2" -p "r_feather_3_2_rollGroup";
	rename -uid "09CD9DC1-434E-A222-2650-4EB80922C56B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_2Shape" -p "r_feather_3_2";
	rename -uid "0C8AE9F6-4B97-F319-2990-DCBDE67CFEF7";
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
	rename -uid "41579525-4CCB-4BF0-E1CF-40B2B62FE35B";
createNode transform -n "r_feather_3_3_spreadGroup" -p "r_feather_3_3_group";
	rename -uid "F1A07001-4465-618F-2C33-0599572DCFB0";
createNode transform -n "r_feather_3_3_bendGroup" -p "r_feather_3_3_spreadGroup";
	rename -uid "0767E86F-49FE-EBA7-F3BD-B3880ED5ACD4";
createNode transform -n "r_feather_3_3_mainGroup" -p "r_feather_3_3_bendGroup";
	rename -uid "6FEA8EF8-4C98-6A67-EFA9-078289FE33F5";
createNode transform -n "r_feather_3_3_rollGroup" -p "r_feather_3_3_mainGroup";
	rename -uid "16FC28F1-4556-2CF0-64B6-688B21DED968";
createNode transform -n "r_feather_3_3" -p "r_feather_3_3_rollGroup";
	rename -uid "0E1CED31-4E83-E4AE-72CD-BF9D6460F4FF";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_3Shape" -p "r_feather_3_3";
	rename -uid "F7BAD9D5-4069-3649-D6E8-55A89C588ABD";
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
	rename -uid "30EA0488-45FD-7626-59B6-D994A1770FB8";
createNode transform -n "r_feather_3_4_spreadGroup" -p "r_feather_3_4_group";
	rename -uid "86F12BED-4635-6AFF-CF17-8180F223C910";
createNode transform -n "r_feather_3_4_bendGroup" -p "r_feather_3_4_spreadGroup";
	rename -uid "A162EBE7-4E20-BC81-725C-CBA7210FB642";
createNode transform -n "r_feather_3_4_mainGroup" -p "r_feather_3_4_bendGroup";
	rename -uid "99AD165B-4A24-E03F-7E0F-D4B4208FB379";
createNode transform -n "r_feather_3_4_rollGroup" -p "r_feather_3_4_mainGroup";
	rename -uid "6B2D58A5-4095-ABAB-581A-228E51A21D11";
createNode transform -n "r_feather_3_4" -p "r_feather_3_4_rollGroup";
	rename -uid "1F0CB9FD-4663-884D-4B80-DC935629F6F9";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_4Shape" -p "r_feather_3_4";
	rename -uid "448BAD74-4C7B-E9DF-7E36-B0BDBCF89B62";
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
	rename -uid "04BB6F13-4F24-0059-E5BC-EFBBC256A44F";
createNode transform -n "r_feather_3_5_spreadGroup" -p "r_feather_3_5_group";
	rename -uid "7FAA71BC-4BF5-11FB-FF67-FD84130CD7D4";
createNode transform -n "r_feather_3_5_bendGroup" -p "r_feather_3_5_spreadGroup";
	rename -uid "04048216-4AB3-3423-98B9-078747BA4C0E";
createNode transform -n "r_feather_3_5_mainGroup" -p "r_feather_3_5_bendGroup";
	rename -uid "3CC508B2-4D98-7BAF-B812-19A47B24AD25";
createNode transform -n "r_feather_3_5_rollGroup" -p "r_feather_3_5_mainGroup";
	rename -uid "8BF75329-44DC-D8DB-DD92-BC8358FCCEBC";
createNode transform -n "r_feather_3_5" -p "r_feather_3_5_rollGroup";
	rename -uid "3E208EE5-405C-C558-0905-87B828328938";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_3_5Shape" -p "r_feather_3_5";
	rename -uid "82538165-4EAC-CE07-9B47-028DA7B93743";
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
	rename -uid "F9038123-4837-52EC-12A5-39860028EE54";
createNode transform -n "r_feather_4_1_spreadRootGroup" -p "r_feather_4_1_group";
	rename -uid "C8C7CEC3-4125-EB36-9E90-AAB94A63E2E2";
createNode transform -n "r_feather_4_1_spreadGroup" -p "r_feather_4_1_spreadRootGroup";
	rename -uid "45F13592-4199-678E-86F8-528A1E79BB4C";
createNode transform -n "r_feather_4_1_rollGroup" -p "r_feather_4_1_spreadGroup";
	rename -uid "1C26D31E-49F2-1409-7F5C-C78A3BCBC4F3";
createNode transform -n "r_feather_4_1" -p "r_feather_4_1_rollGroup";
	rename -uid "A2FAD03A-4D2E-CF2A-FAD3-209ABFF0822E";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_1Shape" -p "r_feather_4_1";
	rename -uid "BA9CA28D-4ED9-5434-2C46-928E8BDA7CCF";
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
	rename -uid "E7E13F8E-47D1-3865-0C6F-4CB8D85C8293";
createNode transform -n "r_feather_4_2_spreadGroup" -p "r_feather_4_2_group";
	rename -uid "BD6EF085-4B0E-971A-D4F3-D08C2D582119";
createNode transform -n "r_feather_4_2_bendGroup" -p "r_feather_4_2_spreadGroup";
	rename -uid "A638E242-4282-1F42-F7E8-EAB1EA58CEF1";
createNode transform -n "r_feather_4_2_mainGroup" -p "r_feather_4_2_bendGroup";
	rename -uid "567F8004-4855-EB6A-76DB-0AA3D863C549";
createNode transform -n "r_feather_4_2_rollGroup" -p "r_feather_4_2_mainGroup";
	rename -uid "B01600BB-41CE-EAC2-E767-93BB298BB940";
createNode transform -n "r_feather_4_2" -p "r_feather_4_2_rollGroup";
	rename -uid "5131ACCF-44B6-3C44-FEDD-64868E18A99F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_2Shape" -p "r_feather_4_2";
	rename -uid "DD694AE7-48F6-59A7-BA86-EB981035809F";
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
	rename -uid "8A0B689B-4F6B-35B8-D9D8-D1ABECA109BE";
createNode transform -n "r_feather_4_3_spreadGroup" -p "r_feather_4_3_group";
	rename -uid "E6A27474-4311-3DE1-1017-249507CB4CFC";
createNode transform -n "r_feather_4_3_bendGroup" -p "r_feather_4_3_spreadGroup";
	rename -uid "0007ADD0-4787-1A67-C48D-9B85C4B5B772";
createNode transform -n "r_feather_4_3_mainGroup" -p "r_feather_4_3_bendGroup";
	rename -uid "9591C69B-4149-6E5C-0CE4-F2B7ED40BACB";
createNode transform -n "r_feather_4_3_rollGroup" -p "r_feather_4_3_mainGroup";
	rename -uid "B71FE814-4856-2760-7429-479A1CE9E0CA";
createNode transform -n "r_feather_4_3" -p "r_feather_4_3_rollGroup";
	rename -uid "75B54BA1-495C-7F7E-F212-F2A955CC61CF";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_3Shape" -p "r_feather_4_3";
	rename -uid "A3742588-4820-8F55-794F-FCBED4897EF5";
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
	rename -uid "B52240E3-414B-5FDC-DB76-B8B8D8CB1DED";
createNode transform -n "r_feather_4_4_spreadGroup" -p "r_feather_4_4_group";
	rename -uid "824827BF-4DF0-7891-ED59-B8840C1617D8";
createNode transform -n "r_feather_4_4_bendGroup" -p "r_feather_4_4_spreadGroup";
	rename -uid "E354631D-4C9D-4834-132E-D3BEDE0D6836";
createNode transform -n "r_feather_4_4_mainGroup" -p "r_feather_4_4_bendGroup";
	rename -uid "39CAE327-43F3-367F-AF52-2AA3B40C3D93";
createNode transform -n "r_feather_4_4_rollGroup" -p "r_feather_4_4_mainGroup";
	rename -uid "342DAC30-472A-AA3A-31DB-7FA9EEB0D1CA";
createNode transform -n "r_feather_4_4" -p "r_feather_4_4_rollGroup";
	rename -uid "22AB8D96-4085-FFBA-5E13-70A64BAB6C66";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_4Shape" -p "r_feather_4_4";
	rename -uid "E18439DC-4201-2D8C-BB1F-E3A07656C431";
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
	rename -uid "2856F6B1-45AC-3C9B-907A-4FB3E7A5492C";
createNode transform -n "r_feather_4_5_spreadGroup" -p "r_feather_4_5_group";
	rename -uid "4BB1838B-4952-D106-67A9-CABCD457250A";
createNode transform -n "r_feather_4_5_bendGroup" -p "r_feather_4_5_spreadGroup";
	rename -uid "D8F0980A-4B67-C8D9-7B86-2C8B01DE5523";
createNode transform -n "r_feather_4_5_mainGroup" -p "r_feather_4_5_bendGroup";
	rename -uid "D7A443C2-42EC-3170-3607-3EAAFE70D29C";
createNode transform -n "r_feather_4_5_rollGroup" -p "r_feather_4_5_mainGroup";
	rename -uid "274264F8-449B-0A93-2EC5-25BB0E073B9B";
createNode transform -n "r_feather_4_5" -p "r_feather_4_5_rollGroup";
	rename -uid "0B370696-41D6-4D02-3779-599EE4608628";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_4_5Shape" -p "r_feather_4_5";
	rename -uid "B5E43470-4370-2527-9499-BE96F940CD13";
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
	rename -uid "61DEE1AA-4DD3-FCA8-5BB0-B38CF989BF6E";
createNode transform -n "r_feather_5_1_spreadRootGroup" -p "r_feather_5_1_group";
	rename -uid "A1D2FFD4-402C-46CA-313C-C1B3BE13F34E";
createNode transform -n "r_feather_5_1_spreadGroup" -p "r_feather_5_1_spreadRootGroup";
	rename -uid "69426518-4B11-D857-68EF-959AC4CDB166";
createNode transform -n "r_feather_5_1_rollGroup" -p "r_feather_5_1_spreadGroup";
	rename -uid "EDA71B44-485F-9440-F70C-C38815A0369F";
createNode transform -n "r_feather_5_1" -p "r_feather_5_1_rollGroup";
	rename -uid "FEB5803B-411E-F5CE-B8EE-D4A07FDBC5FB";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_1Shape" -p "r_feather_5_1";
	rename -uid "7955D4C4-4ADC-081C-7CD6-9589F074B015";
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
	rename -uid "C31E56AA-4205-E0DE-916B-429CED597348";
createNode transform -n "r_feather_5_2_spreadGroup" -p "r_feather_5_2_group";
	rename -uid "4CB59EAA-4C8D-FD49-25A6-2D8CAD196DF8";
createNode transform -n "r_feather_5_2_bendGroup" -p "r_feather_5_2_spreadGroup";
	rename -uid "4D33E52D-45AB-EBC9-367A-7BAD5E88F852";
createNode transform -n "r_feather_5_2_mainGroup" -p "r_feather_5_2_bendGroup";
	rename -uid "1A0CA10B-45C8-C3F0-7F80-9284639BF4D5";
createNode transform -n "r_feather_5_2_rollGroup" -p "r_feather_5_2_mainGroup";
	rename -uid "13BFE236-4033-1945-EECB-0BAB9170BDBE";
createNode transform -n "r_feather_5_2" -p "r_feather_5_2_rollGroup";
	rename -uid "5D5E1AEE-4688-120D-CE6E-24974C040F12";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_2Shape" -p "r_feather_5_2";
	rename -uid "A76F8238-4159-B04A-343A-37BE7BC7AF18";
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
	rename -uid "87919ED0-4C79-EAC3-6E53-9384EB273B74";
createNode transform -n "r_feather_5_3_spreadGroup" -p "r_feather_5_3_group";
	rename -uid "98BE5B55-48E5-DF84-FA80-37ACE079CCF7";
createNode transform -n "r_feather_5_3_bendGroup" -p "r_feather_5_3_spreadGroup";
	rename -uid "9474C204-46F4-268E-C916-A2ACBA7120E0";
createNode transform -n "r_feather_5_3_mainGroup" -p "r_feather_5_3_bendGroup";
	rename -uid "8C44C201-4349-D7E8-7E7C-EEBD7677DE0A";
createNode transform -n "r_feather_5_3_rollGroup" -p "r_feather_5_3_mainGroup";
	rename -uid "F889F3B0-467E-8437-7D8F-EEBAAD23580B";
createNode transform -n "r_feather_5_3" -p "r_feather_5_3_rollGroup";
	rename -uid "1A8D0782-425C-82F1-CE5C-64A416ED2D2A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_3Shape" -p "r_feather_5_3";
	rename -uid "5AC24905-4612-123B-95EE-9DB644345CB0";
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
	rename -uid "6344E454-4CA4-9C43-FAF2-49ADD7F014B6";
createNode transform -n "r_feather_5_4_spreadGroup" -p "r_feather_5_4_group";
	rename -uid "610D87BD-4245-6AA3-3F42-37A692A7DE5F";
createNode transform -n "r_feather_5_4_bendGroup" -p "r_feather_5_4_spreadGroup";
	rename -uid "D970325B-43EB-0EAA-DC55-7A85A75794DA";
createNode transform -n "r_feather_5_4_mainGroup" -p "r_feather_5_4_bendGroup";
	rename -uid "343FE289-4949-3622-5A57-A78508A4545D";
createNode transform -n "r_feather_5_4_rollGroup" -p "r_feather_5_4_mainGroup";
	rename -uid "57B1FB31-4103-7E62-E7A3-88B0E366944A";
createNode transform -n "r_feather_5_4" -p "r_feather_5_4_rollGroup";
	rename -uid "36D18452-437B-2121-1441-489A14F9BA5B";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_4Shape" -p "r_feather_5_4";
	rename -uid "91D8CAF0-4D65-6B53-3946-ECA3FD4B8A82";
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
	rename -uid "1F154408-4700-165C-0166-7AB95F3B7DDB";
createNode transform -n "r_feather_5_5_spreadGroup" -p "r_feather_5_5_group";
	rename -uid "018DBC3D-4639-9B75-72DF-78BA6355D5D3";
createNode transform -n "r_feather_5_5_bendGroup" -p "r_feather_5_5_spreadGroup";
	rename -uid "ABA362B5-4A3F-E272-B4D4-21B016D9CFF5";
createNode transform -n "r_feather_5_5_mainGroup" -p "r_feather_5_5_bendGroup";
	rename -uid "A573CAFA-47E4-1664-8917-6DAAAA871D73";
createNode transform -n "r_feather_5_5_rollGroup" -p "r_feather_5_5_mainGroup";
	rename -uid "C79A22A1-40B0-F7AE-1426-23901438BC06";
createNode transform -n "r_feather_5_5" -p "r_feather_5_5_rollGroup";
	rename -uid "6974D8CA-4877-9371-839B-20A5E319CE3A";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "r_feather_5_5Shape" -p "r_feather_5_5";
	rename -uid "82BBD086-4236-4F0A-93E6-7D877752DAF8";
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
	rename -uid "21617F40-4EF3-B3F0-DDC1-CE8FA5BC522E";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_2_outJoint" -p "m_feather_1_outJoint";
	rename -uid "17517EBC-4CD4-3B78-26C8-BF9667C177A3";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_3_outJoint" -p "m_feather_2_outJoint";
	rename -uid "13CF0E9A-45A8-D8D4-C166-369A236892A2";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_4_outJoint" -p "m_feather_3_outJoint";
	rename -uid "79149FEC-4CBD-7F76-8C46-95A4733BA697";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_5_outJoint" -p "m_feather_4_outJoint";
	rename -uid "3A8AC55A-4E51-B04F-BB67-CC8A656A081A";
	setAttr ".radi" 0.2;
createNode joint -n "m_feather_end_outJoint" -p "m_feather_5_outJoint";
	rename -uid "61B08546-40F4-0EE8-4A09-55804FDE9304";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_1_outJoint" -p "root_outJoint";
	rename -uid "A23F3F67-4602-1C58-7929-DE8B3FE66FA4";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_2_outJoint" -p "l_feather_1_1_outJoint";
	rename -uid "E8D3918B-4DE2-09C4-3031-3EBD2F30225D";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_3_outJoint" -p "l_feather_1_2_outJoint";
	rename -uid "0DC3E564-4CF5-30C1-26D9-149CC8DA6E4A";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_4_outJoint" -p "l_feather_1_3_outJoint";
	rename -uid "0520C111-4C4F-798B-6B19-EEB438A51091";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_5_outJoint" -p "l_feather_1_4_outJoint";
	rename -uid "9ED5C7F7-4EA7-AB04-BC98-2487C4F9D97C";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_1_end_outJoint" -p "l_feather_1_5_outJoint";
	rename -uid "104BDAF7-42C0-B027-C78C-D99AE7D28AAA";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_1_outJoint" -p "root_outJoint";
	rename -uid "BBE23F72-405F-84F3-083B-9AADC908769C";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_2_outJoint" -p "l_feather_2_1_outJoint";
	rename -uid "AC68AF21-4F54-47BC-96FD-52A02450BFA1";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_3_outJoint" -p "l_feather_2_2_outJoint";
	rename -uid "1D21D0CD-4DDD-BEAC-A637-CEA0FA338FC8";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_4_outJoint" -p "l_feather_2_3_outJoint";
	rename -uid "714824E4-4F89-334C-FE7B-27BCA145DFBC";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_5_outJoint" -p "l_feather_2_4_outJoint";
	rename -uid "3BD11799-46DB-10AF-B223-378EAF91E02A";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_2_end_outJoint" -p "l_feather_2_5_outJoint";
	rename -uid "68E8B04C-4743-A429-7EF4-56B65BB06829";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_1_outJoint" -p "root_outJoint";
	rename -uid "2BD096FA-4364-238A-AA0C-7DB4B26E036F";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_2_outJoint" -p "l_feather_3_1_outJoint";
	rename -uid "12D64E0E-4A4A-9967-39CF-4B9C4AAD1DCF";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_3_outJoint" -p "l_feather_3_2_outJoint";
	rename -uid "4BF8F931-48B2-B58A-85E9-BDAA86510B84";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_4_outJoint" -p "l_feather_3_3_outJoint";
	rename -uid "48384696-40B0-D816-6066-CDB36ED05C1D";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_5_outJoint" -p "l_feather_3_4_outJoint";
	rename -uid "7285D422-41F3-DF2E-F866-22A7AB95F2FC";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_3_end_outJoint" -p "l_feather_3_5_outJoint";
	rename -uid "2EEAD83E-46CA-B2EA-862E-2A8FD67CE653";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_1_outJoint" -p "root_outJoint";
	rename -uid "B1668FBC-4BC2-8063-31AD-7BB40C110D7B";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_2_outJoint" -p "l_feather_4_1_outJoint";
	rename -uid "9B5A2255-4F53-FBAC-D815-A4B27F686A95";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_3_outJoint" -p "l_feather_4_2_outJoint";
	rename -uid "29B999BF-49C5-AA5E-8053-A4A93AEE74B5";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_4_outJoint" -p "l_feather_4_3_outJoint";
	rename -uid "B0DFB5B1-48AC-8F01-5B9C-948E76D4DA30";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_5_outJoint" -p "l_feather_4_4_outJoint";
	rename -uid "88919522-4D06-DF73-645E-C69DE7128946";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_4_end_outJoint" -p "l_feather_4_5_outJoint";
	rename -uid "77268DD9-475F-C081-3C70-3587C864A239";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_1_outJoint" -p "root_outJoint";
	rename -uid "B7F7F715-4B51-7850-B573-0483C7210852";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_2_outJoint" -p "l_feather_5_1_outJoint";
	rename -uid "BA27AE0D-4D6A-09FD-6E92-1F8F0E5D89CD";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_3_outJoint" -p "l_feather_5_2_outJoint";
	rename -uid "60E902A4-4708-6A50-E24D-C8AC380CA565";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_4_outJoint" -p "l_feather_5_3_outJoint";
	rename -uid "46A3A187-45CA-1E37-3E54-45BB522003EB";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_5_outJoint" -p "l_feather_5_4_outJoint";
	rename -uid "9E3DB393-4394-56AF-E4C0-5BAB4324F6D6";
	setAttr ".radi" 0.2;
createNode joint -n "l_feather_5_end_outJoint" -p "l_feather_5_5_outJoint";
	rename -uid "28A73853-4D01-6D5B-FE44-14B2C2033E1B";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_1_outJoint" -p "root_outJoint";
	rename -uid "31A8465D-40BB-8705-D1B5-94A5B8DA68CC";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_2_outJoint" -p "r_feather_1_1_outJoint";
	rename -uid "C62A0688-45BE-DBB6-38E0-1F9FF176A1EC";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_3_outJoint" -p "r_feather_1_2_outJoint";
	rename -uid "B04319EF-421B-5816-6868-2B810274A697";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_4_outJoint" -p "r_feather_1_3_outJoint";
	rename -uid "2CF4B794-4064-FC73-99CD-1FB6264BC07E";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_5_outJoint" -p "r_feather_1_4_outJoint";
	rename -uid "1522AC3F-40F8-8D32-1639-5D9AF18862FD";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_1_end_outJoint" -p "r_feather_1_5_outJoint";
	rename -uid "DD41D39A-42D7-3050-0FEA-EFA7A12B57E5";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_1_outJoint" -p "root_outJoint";
	rename -uid "A975F68A-4CA1-5342-E04F-0388D6011F8F";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_2_outJoint" -p "r_feather_2_1_outJoint";
	rename -uid "B7401A83-427D-0859-D0A9-8D9E81902D98";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_3_outJoint" -p "r_feather_2_2_outJoint";
	rename -uid "CF3E85DB-4A38-0097-181B-41A24E8AF343";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_4_outJoint" -p "r_feather_2_3_outJoint";
	rename -uid "C2012B5E-42BB-1BD2-3A85-3AA84480AC2A";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_5_outJoint" -p "r_feather_2_4_outJoint";
	rename -uid "8347961D-41E4-4F4F-31C2-E49B39B749F1";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_2_end_outJoint" -p "r_feather_2_5_outJoint";
	rename -uid "92745136-4644-6510-422C-17B97C760187";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_1_outJoint" -p "root_outJoint";
	rename -uid "DF360CFC-4C0F-7AC9-D896-73A137A48002";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_2_outJoint" -p "r_feather_3_1_outJoint";
	rename -uid "3CC97EBC-4539-C143-DCD5-DF83F2852F3A";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_3_outJoint" -p "r_feather_3_2_outJoint";
	rename -uid "DD419593-4892-63FA-08D5-BEBB4466EAFA";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_4_outJoint" -p "r_feather_3_3_outJoint";
	rename -uid "2549FDAE-4EC3-9688-FA08-3AB5064438B6";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_5_outJoint" -p "r_feather_3_4_outJoint";
	rename -uid "B615FE97-49E9-8BDA-5351-C182D0F01D07";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_3_end_outJoint" -p "r_feather_3_5_outJoint";
	rename -uid "A2A895D9-49B1-8846-51DD-D5A0B143BD04";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_1_outJoint" -p "root_outJoint";
	rename -uid "04F7D2E5-460C-ED30-47D4-2C98FA22F526";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_2_outJoint" -p "r_feather_4_1_outJoint";
	rename -uid "AA973657-4789-152F-C683-8CBAF52194AB";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_3_outJoint" -p "r_feather_4_2_outJoint";
	rename -uid "6731AA92-46A3-2394-03CC-CBA712CB64D6";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_4_outJoint" -p "r_feather_4_3_outJoint";
	rename -uid "13FBCE27-4C43-9138-2EF0-83AE4252775C";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_5_outJoint" -p "r_feather_4_4_outJoint";
	rename -uid "705E6429-4F70-0DD1-DEBE-C1B20C88AFFB";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_4_end_outJoint" -p "r_feather_4_5_outJoint";
	rename -uid "5164BCCA-4256-2081-716E-019E405CFB71";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_1_outJoint" -p "root_outJoint";
	rename -uid "55BDBC37-4285-DA60-F8F1-69A31232B937";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_2_outJoint" -p "r_feather_5_1_outJoint";
	rename -uid "EC12068D-4BDB-6DD7-F66E-F099B9EC762D";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_3_outJoint" -p "r_feather_5_2_outJoint";
	rename -uid "8819089B-44EB-1DFF-CDD0-CB80914EC725";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_4_outJoint" -p "r_feather_5_3_outJoint";
	rename -uid "F92DD831-4CDB-AAD2-76F0-4FA6A03BE82A";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_5_outJoint" -p "r_feather_5_4_outJoint";
	rename -uid "59AE3443-4AFD-D0E3-2A67-09832B290C1D";
	setAttr ".radi" 0.2;
createNode joint -n "r_feather_5_end_outJoint" -p "r_feather_5_5_outJoint";
	rename -uid "6C335761-44F9-D56D-026E-8CA198F07DF6";
	setAttr ".radi" 0.2;
createNode transform -s -n "persp";
	rename -uid "6DD988D0-4F67-01C8-21B5-089512DF5F58";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.4311182466439369 8.010721947570449 -9.6759601950019167 ;
	setAttr ".r" -type "double3" -43.799999999986078 139.19999999999223 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C0598692-4A65-CD2F-2E76-769943D8CE56";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 10.772009118114646;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.00089961603299254511 0.97642014451840109 -5.1158699999999993 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "76B76DF1-4C7C-BBEC-766D-F091444014EB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.26970925026522302 3.6789655696561727 0.24206396897360705 ;
	setAttr ".r" -type "double3" -90 180 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "701B895D-45BA-3625-AE2D-B0A37323752E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.5541107207485019;
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
	setAttr ".t" -type "double3" 7.9027850784688383 0.28772083590265618 -5.1864558714440623 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F62AEFB8-46AB-898B-C1BB-8AB607C09A1B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 9.1663792781641398;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "B73500B5-4BD2-04A3-F434-C7A69AB80BB5";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "725C4D3C-4062-3568-14B7-A1913B4A912C";
createNode displayLayer -n "defaultLayer";
	rename -uid "47598A7F-4076-9A26-4738-16A1F08E3130";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "52EE762A-4A44-B3F1-DFBA-65AB067DE9D2";
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
	rename -uid "A8A106D7-45C7-3502-9A3A-88BCD5543872";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "64EB5DAB-4742-5268-7D6A-82882BFF12D3";
createNode makeNurbSphere -n "makeNurbSphere";
	rename -uid "6F0AFE32-49C2-5870-2EB7-E6BDECAF7D76";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "FC884255-462D-CC24-783E-69B68427DF01";
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
	setAttr ".hyperNodeSessionJSON" -type "string" "{\"tabs\": [{\"name\": \"Tab 0\", \"nodes\": {\"feathers_group\": {\"x\": -3232.938815645808, \"y\": -2237.8330141021283, \"width\": 250, \"attr_display_mode\": \"essential_only\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}, \"main_4_initLoc\": {\"x\": -3878.2649328930465, \"y\": -2065.173082071542, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}, \"m_feather_end_initLoc\": {\"x\": -3858.656436716326, \"y\": -2320.293863719801, \"width\": 250, \"attr_display_mode\": \"none\", \"attr_values\": false, \"value_shown_attrs\": [], \"show_pinned\": true, \"expanded_attrs\": [], \"filter_exempt\": false}}, \"basket_entry_id\": null, \"notes\": [], \"hyper_sets\": [], \"view\": {\"cx\": -3386.387289719626, \"cy\": -1969.6734409515718, \"scale\": 1.0199660300183715}, \"group_path\": [], \"group_history\": []}], \"active_tab\": 0, \"basket\": []}";
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
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "4954C6B6-4BDB-A16C-BFC2-C39B511C96CD";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1097.0237659320019 -2420.2379990664667 ;
	setAttr ".tgi[0].vh" -type "double2" 3760.1188982053473 -1104.7618608626017 ;
createNode objectSet -n "generated_nodesSet";
	rename -uid "4D856E63-44FA-7F16-9B04-C5846E0AFEC1";
	setAttr ".ihi" 0;
	setAttr -s 936 ".dsm";
	setAttr -s 554 ".dnsm";
createNode objectSet -n "feathers_moduleControlSet";
	rename -uid "84FFB402-4BF4-B675-440F-1C9217BAA30F";
	setAttr ".ihi" 0;
	setAttr -s 11 ".dnsm";
createNode groupId -n "m_feather_cluster4GroupId";
	rename -uid "2651828B-4F88-BA48-D005-9A9A3C02A2F6";
	setAttr ".ihi" 0;
createNode objectSet -n "m_feather_cluster4Set";
	rename -uid "2532FE6B-45E2-413E-397F-ABB86655B7E7";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "m_feather_mainPoser_clusterHandleCluster";
	rename -uid "62AF8DF2-44EE-6801-339D-6FA6369BDEEA";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "m_feather_cluster4GroupParts";
	rename -uid "E82E3D01-467C-7501-37C9-FAA358BECB1E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "m_feather_tweak24";
	rename -uid "42095A0A-4B06-15C1-A70B-6C88E9A9A2FE";
createNode objectSet -n "m_feather_tweakSet24";
	rename -uid "55B52F9F-4833-BE32-3109-3D970036965C";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "m_feather_groupId42";
	rename -uid "4DC83A12-4BE6-628B-9A5B-039875A76346";
	setAttr ".ihi" 0;
createNode groupParts -n "m_feather_groupParts42";
	rename -uid "2B3C2F9B-48DC-F441-A772-5F986EF3BE34";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "m_feather_mainPoser_size_multiplyDivide";
	rename -uid "C7860FCF-4E00-EC02-8322-9F8BD7230A0B";
createNode makeNurbSphere -n "m_feather_1_makeNurbSphere";
	rename -uid "933059FC-4083-DBEF-1718-76865D42A609";
createNode multDoubleLinear -n "m_feather_1_size_multDoubleLinear";
	rename -uid "094073DF-4DBA-191A-1CD4-EBB4D52E890F";
createNode makeNurbSphere -n "m_feather_2_makeNurbSphere";
	rename -uid "1140B8C5-4D9E-436F-076B-4081674D522D";
createNode multDoubleLinear -n "m_feather_2_size_multDoubleLinear";
	rename -uid "10E967A7-4FB3-9E06-C771-6495483C7AC1";
createNode makeNurbSphere -n "m_feather_3_makeNurbSphere";
	rename -uid "BDDA5385-4DAD-4BB2-94BD-569D1BAAB08A";
createNode multDoubleLinear -n "m_feather_3_size_multDoubleLinear";
	rename -uid "190E2863-4E52-911F-36AE-72AFF778BCB9";
createNode makeNurbSphere -n "m_feather_4_makeNurbSphere";
	rename -uid "1F5605C5-414A-3922-CA0D-B3A4683F7932";
createNode multDoubleLinear -n "m_feather_4_size_multDoubleLinear";
	rename -uid "D10A878C-4221-6852-133C-1AA77E832994";
createNode makeNurbSphere -n "m_feather_5_makeNurbSphere";
	rename -uid "9BC96A50-4C59-E34F-F477-2ABE95FD6A6C";
createNode multDoubleLinear -n "m_feather_5_size_multDoubleLinear";
	rename -uid "BF556C83-4B3E-4569-EC87-549CC6D9BD9E";
createNode makeNurbSphere -n "m_feather_end_makeNurbSphere";
	rename -uid "29C28709-4229-F85C-19A6-0B9D3BB479B1";
createNode multDoubleLinear -n "m_feather_end_size_multDoubleLinear";
	rename -uid "5BC1E1BF-4437-7A7C-CB20-448E12E3FB62";
createNode groupId -n "l_feather_1_cluster4GroupId";
	rename -uid "FB97CA38-4F74-2984-CE49-988BB58D8F3B";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_1_cluster4Set";
	rename -uid "C74674D6-4917-E4FC-CF7A-E3B7B2E369A2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_1_mainPoser_clusterHandleCluster";
	rename -uid "1FA483AC-4E71-2B77-0F22-AF8820543F5B";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_1_cluster4GroupParts";
	rename -uid "C8F11EFD-44DC-AF0C-D6EC-97B12EB8FD0F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_1_tweak24";
	rename -uid "ED1CFCB8-4974-B772-2E5A-19B4D4B295C9";
createNode objectSet -n "l_feather_1_tweakSet24";
	rename -uid "8E1BF886-4426-2FE0-EF63-279F41A7D4AB";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_1_groupId42";
	rename -uid "54B0EFF6-473F-D85D-56C5-3E888F5D3F1A";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_1_groupParts42";
	rename -uid "21423786-43CB-148C-F9D2-7991EC38181A";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_1_mainPoser_size_multiplyDivide";
	rename -uid "A49B4BA9-4A4D-E186-6E15-87A3DE11EF76";
createNode makeNurbSphere -n "l_feather_1_1_makeNurbSphere";
	rename -uid "1EAD7FC5-4FE7-DE12-E430-1C968E0BCAA1";
createNode multDoubleLinear -n "l_feather_1_1_size_multDoubleLinear";
	rename -uid "4BD07011-43F9-B1C1-52BE-C9A6E4DC1E94";
createNode makeNurbSphere -n "l_feather_1_2_makeNurbSphere";
	rename -uid "CC6B6AD8-4CC1-9CE8-749A-058EBAF5993A";
createNode multDoubleLinear -n "l_feather_1_2_size_multDoubleLinear";
	rename -uid "D3FCA0BB-4C2F-3F34-CEA9-5C8E65520904";
createNode makeNurbSphere -n "l_feather_1_3_makeNurbSphere";
	rename -uid "06886F6E-40F9-B1CF-2E63-5D9751D8B5DD";
createNode multDoubleLinear -n "l_feather_1_3_size_multDoubleLinear";
	rename -uid "49322709-4784-1017-D292-9BA4CCFF51E2";
createNode makeNurbSphere -n "l_feather_1_4_makeNurbSphere";
	rename -uid "AFD3BEFE-452C-02C3-E53D-26820AFE5460";
createNode multDoubleLinear -n "l_feather_1_4_size_multDoubleLinear";
	rename -uid "71DEC7F7-4804-A4CD-11BB-17BB67304961";
createNode makeNurbSphere -n "l_feather_1_5_makeNurbSphere";
	rename -uid "8C52036B-4DED-EC5E-764E-B89CF6A51B1B";
createNode multDoubleLinear -n "l_feather_1_5_size_multDoubleLinear";
	rename -uid "745EF52B-4195-CFF4-4318-EBAA67EC1C67";
createNode makeNurbSphere -n "l_feather_1_end_makeNurbSphere";
	rename -uid "AF6E2C75-4622-44D0-D770-78B43048BDF1";
createNode multDoubleLinear -n "l_feather_1_end_size_multDoubleLinear";
	rename -uid "DCE693D7-49E4-DFDE-F7CB-07B79659A23D";
createNode groupId -n "l_feather_2_cluster4GroupId";
	rename -uid "D334D4DA-4172-0319-7B27-45BE3F2A02C6";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_2_cluster4Set";
	rename -uid "B6A768C5-4321-DB44-FB23-25B3D70E31C9";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_2_mainPoser_clusterHandleCluster";
	rename -uid "D4C0B410-4321-7417-39BC-3EA285C469E4";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_2_cluster4GroupParts";
	rename -uid "75FADF38-413C-05D1-478D-9BB9B6868E15";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_2_tweak24";
	rename -uid "852216FD-4740-74BD-3D24-9B942CC83818";
createNode objectSet -n "l_feather_2_tweakSet24";
	rename -uid "4683B75A-4DA9-7065-015B-A0BD32EC2594";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_2_groupId42";
	rename -uid "600098ED-4EB8-32C2-A55C-D2B654AC7C63";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_2_groupParts42";
	rename -uid "9E1E856A-444B-C88F-D091-61BE69B59B8C";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_2_mainPoser_size_multiplyDivide";
	rename -uid "2425A4C0-419F-5F42-083F-A4AB515FE933";
createNode makeNurbSphere -n "l_feather_2_1_makeNurbSphere";
	rename -uid "C128440B-4352-07A7-CF95-E5BB3FAA7D4A";
createNode multDoubleLinear -n "l_feather_2_1_size_multDoubleLinear";
	rename -uid "5F927980-45E5-92D8-6807-CDBB74D00BBE";
createNode makeNurbSphere -n "l_feather_2_2_makeNurbSphere";
	rename -uid "58D9BA24-4490-73AB-2553-068BC5DEC59A";
createNode multDoubleLinear -n "l_feather_2_2_size_multDoubleLinear";
	rename -uid "DB48A346-4E83-5ED5-CDAB-1AB8C79F7B0E";
createNode makeNurbSphere -n "l_feather_2_3_makeNurbSphere";
	rename -uid "348B7BD3-4494-5852-CB97-448013261E4D";
createNode multDoubleLinear -n "l_feather_2_3_size_multDoubleLinear";
	rename -uid "AB980C89-4711-876B-56C7-9DAF2E751D92";
createNode makeNurbSphere -n "l_feather_2_4_makeNurbSphere";
	rename -uid "AF61D22D-4618-4DC7-A503-929E962EB263";
createNode multDoubleLinear -n "l_feather_2_4_size_multDoubleLinear";
	rename -uid "FC562187-4A01-F951-DFF3-3E878602D166";
createNode makeNurbSphere -n "l_feather_2_5_makeNurbSphere";
	rename -uid "31CAC2C2-4976-60D5-FE9C-42B6A59AE421";
createNode multDoubleLinear -n "l_feather_2_5_size_multDoubleLinear";
	rename -uid "5699A306-4842-E078-DA71-3A93725C1601";
createNode makeNurbSphere -n "l_feather_2_end_makeNurbSphere";
	rename -uid "04BD3EC5-4385-B20D-99CA-CAAED5534CFB";
createNode multDoubleLinear -n "l_feather_2_end_size_multDoubleLinear";
	rename -uid "76C8F477-4C97-7953-C6CF-C8880B73A11E";
createNode groupId -n "l_feather_3_cluster4GroupId";
	rename -uid "840ACF4B-4A17-E0D8-1CFE-C4BEE01ED3A7";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_3_cluster4Set";
	rename -uid "B00F3DBF-445A-2078-6BCE-67B8D835ADB6";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_3_mainPoser_clusterHandleCluster";
	rename -uid "3F65FB5F-4E4F-F5AC-2A43-ABAB1C8FA165";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_3_cluster4GroupParts";
	rename -uid "74721E97-4E48-1FEC-CF42-B2A5CCCF8C6E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_3_tweak24";
	rename -uid "E64273E4-46FE-6DFA-E53A-4D95F6726368";
createNode objectSet -n "l_feather_3_tweakSet24";
	rename -uid "CF078ABE-4D3B-C77E-7363-119530098027";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_3_groupId42";
	rename -uid "2A4975A6-4BC7-7315-479B-BFB20F049795";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_3_groupParts42";
	rename -uid "A96D7967-4714-4DD8-2893-76986738A82B";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_3_mainPoser_size_multiplyDivide";
	rename -uid "9F0E85F7-45A2-06FF-145A-8FB72CDADACF";
createNode makeNurbSphere -n "l_feather_3_1_makeNurbSphere";
	rename -uid "3A504C98-46BC-CF8F-9856-F7A13DDEF8E4";
createNode multDoubleLinear -n "l_feather_3_1_size_multDoubleLinear";
	rename -uid "7CA801FA-4116-5037-2F02-D088CDB5FF6D";
createNode makeNurbSphere -n "l_feather_3_2_makeNurbSphere";
	rename -uid "D982495B-498B-16C8-B85F-B9AA2F16FB9F";
createNode multDoubleLinear -n "l_feather_3_2_size_multDoubleLinear";
	rename -uid "DCA20140-47A0-B5FE-1291-11950FBF8C85";
createNode makeNurbSphere -n "l_feather_3_3_makeNurbSphere";
	rename -uid "0FEEEDF0-4C72-9BCC-6ADA-CE820F063EED";
createNode multDoubleLinear -n "l_feather_3_3_size_multDoubleLinear";
	rename -uid "24847B8D-4C8C-C663-5801-53A60642DC1A";
createNode makeNurbSphere -n "l_feather_3_4_makeNurbSphere";
	rename -uid "4B18C8DB-4AD4-4D4C-F9F7-6BB2B345188D";
createNode multDoubleLinear -n "l_feather_3_4_size_multDoubleLinear";
	rename -uid "6F3D742D-40B0-A94C-BE79-87AAD5FB86BA";
createNode makeNurbSphere -n "l_feather_3_5_makeNurbSphere";
	rename -uid "70A7E78A-4870-D50C-8118-308E286415BF";
createNode multDoubleLinear -n "l_feather_3_5_size_multDoubleLinear";
	rename -uid "5FD02A28-45C6-6B1E-6CB0-CFBF36354B23";
createNode makeNurbSphere -n "l_feather_3_end_makeNurbSphere";
	rename -uid "18D89E4C-4CD2-C61E-0EF8-F284FCE0D4E1";
createNode multDoubleLinear -n "l_feather_3_end_size_multDoubleLinear";
	rename -uid "8497CF08-456B-09ED-D367-B5A865A0F82F";
createNode groupId -n "l_feather_4_cluster4GroupId";
	rename -uid "93340672-42D2-8130-BE54-FFB3BD1EC15B";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_4_cluster4Set";
	rename -uid "70A539BB-498B-E329-DAFA-E7907CC96EF5";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_4_mainPoser_clusterHandleCluster";
	rename -uid "4A78FCE2-4962-39BD-7BB1-068A8682EB39";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_4_cluster4GroupParts";
	rename -uid "E4CF90C4-415C-C7CB-B917-168D3185CBDE";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_4_tweak24";
	rename -uid "02BE84E2-41F0-FD3C-889B-CAB3B2429DDE";
createNode objectSet -n "l_feather_4_tweakSet24";
	rename -uid "E1C047DC-4454-95F0-7246-268A1FF1C0C1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_4_groupId42";
	rename -uid "EDF1B5B4-49A6-1E4A-87CB-2DBCECB48130";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_4_groupParts42";
	rename -uid "37D0E9F4-4DD6-A0EB-F0F8-AAA185E87873";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_4_mainPoser_size_multiplyDivide";
	rename -uid "D441E980-4218-DFFF-6202-18A7F840B216";
createNode makeNurbSphere -n "l_feather_4_1_makeNurbSphere";
	rename -uid "8A4B96E8-426D-E005-D578-A4AA8D599C6D";
createNode multDoubleLinear -n "l_feather_4_1_size_multDoubleLinear";
	rename -uid "25F0EFC8-42F3-A5BA-E1F9-8B99FA7F715B";
createNode makeNurbSphere -n "l_feather_4_2_makeNurbSphere";
	rename -uid "5D5204AB-4FC8-4DE3-5B61-3F9501275016";
createNode multDoubleLinear -n "l_feather_4_2_size_multDoubleLinear";
	rename -uid "C8E57E3A-4F0F-3B5F-523B-4CB707C3E92B";
createNode makeNurbSphere -n "l_feather_4_3_makeNurbSphere";
	rename -uid "4A7D45F7-47E0-3079-79B3-9F86D072ED61";
createNode multDoubleLinear -n "l_feather_4_3_size_multDoubleLinear";
	rename -uid "514384D2-4F3E-D765-A4BC-BFB22AD449F4";
createNode makeNurbSphere -n "l_feather_4_4_makeNurbSphere";
	rename -uid "CF8CA2F8-4238-CDFD-F882-2CBF6B8A6F10";
createNode multDoubleLinear -n "l_feather_4_4_size_multDoubleLinear";
	rename -uid "E1C66766-4C70-D2DE-733A-BE863FE05DA7";
createNode makeNurbSphere -n "l_feather_4_5_makeNurbSphere";
	rename -uid "81D19A93-49F1-D784-AD80-2CA644191369";
createNode multDoubleLinear -n "l_feather_4_5_size_multDoubleLinear";
	rename -uid "2F14CE28-4666-63EA-9F79-FBA4F12E5AA8";
createNode makeNurbSphere -n "l_feather_4_end_makeNurbSphere";
	rename -uid "778343EB-494D-5AC0-5E01-E7A346981E96";
createNode multDoubleLinear -n "l_feather_4_end_size_multDoubleLinear";
	rename -uid "52C772F0-42AD-4E90-9B3F-3992443D8F63";
createNode groupId -n "l_feather_5_cluster4GroupId";
	rename -uid "927C0E81-4C8B-6E0B-4170-479683C552B1";
	setAttr ".ihi" 0;
createNode objectSet -n "l_feather_5_cluster4Set";
	rename -uid "02C70839-407C-6B5B-B6C7-FFB2F405A517";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode cluster -n "l_feather_5_mainPoser_clusterHandleCluster";
	rename -uid "0DA1AAF4-4EF8-2CF5-BB15-E9B56E14F955";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr ".rel" yes;
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ait" 0;
createNode groupParts -n "l_feather_5_cluster4GroupParts";
	rename -uid "DA541902-44F3-D997-4414-ECB1E94AEFF0";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:16]";
createNode tweak -n "l_feather_5_tweak24";
	rename -uid "11F8AE82-453D-95D8-C65A-ECB203B14E7B";
createNode objectSet -n "l_feather_5_tweakSet24";
	rename -uid "7776ED6D-4F05-1498-80D1-7385153C156B";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "l_feather_5_groupId42";
	rename -uid "25B09898-4C80-C527-2875-A097C6C803BB";
	setAttr ".ihi" 0;
createNode groupParts -n "l_feather_5_groupParts42";
	rename -uid "16378AA0-46F1-BAF5-D124-E589A8554597";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode multiplyDivide -n "l_feather_5_mainPoser_size_multiplyDivide";
	rename -uid "FC44A696-419E-DDD0-FAB3-C49558574CE7";
createNode makeNurbSphere -n "l_feather_5_1_makeNurbSphere";
	rename -uid "EBF05653-4597-8AC7-FB4B-04BF393F7D91";
createNode multDoubleLinear -n "l_feather_5_1_size_multDoubleLinear";
	rename -uid "924B7462-4CA7-CDD0-1FDF-7CB55AB43219";
createNode makeNurbSphere -n "l_feather_5_2_makeNurbSphere";
	rename -uid "A37EF727-4557-CC1B-FFF7-27AF8C8416BD";
createNode multDoubleLinear -n "l_feather_5_2_size_multDoubleLinear";
	rename -uid "3329BE8D-43CD-02FA-FBAA-D1B36F97AF4E";
createNode makeNurbSphere -n "l_feather_5_3_makeNurbSphere";
	rename -uid "338B136F-40FE-5FF5-2168-628A0D846181";
createNode multDoubleLinear -n "l_feather_5_3_size_multDoubleLinear";
	rename -uid "B89BFC34-48F5-DE53-D943-B4AFEEA0BC9A";
createNode makeNurbSphere -n "l_feather_5_4_makeNurbSphere";
	rename -uid "56D1C00F-44E7-6AD3-DE12-63BF3D47AFA8";
createNode multDoubleLinear -n "l_feather_5_4_size_multDoubleLinear";
	rename -uid "46581884-46A6-D6BC-D0F4-3298BE14EF28";
createNode makeNurbSphere -n "l_feather_5_5_makeNurbSphere";
	rename -uid "6C8C6B27-4051-81F6-4320-E1807D2A9AAB";
createNode multDoubleLinear -n "l_feather_5_5_size_multDoubleLinear";
	rename -uid "1554E96A-43D3-1860-53C2-FD9C7FBBDAD4";
createNode makeNurbSphere -n "l_feather_5_end_makeNurbSphere";
	rename -uid "DE781C1B-477F-20D3-4E55-AAB58C75A4DE";
createNode multDoubleLinear -n "l_feather_5_end_size_multDoubleLinear";
	rename -uid "21302307-40F1-2123-1DAD-F7B780BB0C3A";
createNode makeNurbSphere -n "main_1_makeNurbSphere";
	rename -uid "D004691F-43F4-416A-CE7A-868AF8379BF0";
createNode multDoubleLinear -n "main_1_size_multDoubleLinear";
	rename -uid "29AA9D02-4A79-DD5F-45E6-56B4D36F4194";
createNode makeNurbSphere -n "main_2_makeNurbSphere";
	rename -uid "1CBC2FFD-4E90-AD8B-3102-27BEDF708B7E";
createNode multDoubleLinear -n "main_2_size_multDoubleLinear";
	rename -uid "C5F5A01A-46BC-D883-84E1-71A19372CCEA";
createNode makeNurbSphere -n "main_3_makeNurbSphere";
	rename -uid "C7739E7D-4C74-952B-6D26-BCA0D6165F90";
createNode multDoubleLinear -n "main_3_size_multDoubleLinear";
	rename -uid "C7A44597-49F1-0A50-9042-8EB33D0A5336";
createNode makeNurbSphere -n "main_4_makeNurbSphere";
	rename -uid "47EFC743-4D49-8E00-744C-57B070C57FCB";
createNode multDoubleLinear -n "main_4_size_multDoubleLinear";
	rename -uid "5655112D-4A34-A534-C451-BCAF7C06400F";
createNode sweepMeshCreator -n "lines_sweepMeshCreator";
	rename -uid "167A607C-4539-26C6-FBC9-0DADF8072735";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
	setAttr -s 6 ".inCurveArray";
	setAttr -s 6 ".outMeshArray";
createNode multDoubleLinear -n "lines_size_multDoubleLinear";
	rename -uid "87499E79-45E5-6D2E-4E2D-978252A69EAF";
createNode multMatrix -n "r_feather_1_1_initLoc_multMat";
	rename -uid "AB5D3523-40CD-965C-5CF4-7DA12CB33392";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_2_initLoc_multMat";
	rename -uid "8CBBC9B5-45F7-2804-E73C-C6BB51648727";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_3_initLoc_multMat";
	rename -uid "E7D08B25-48DD-59BA-5428-3F98A05C2AB6";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_4_initLoc_multMat";
	rename -uid "2C957E90-4646-FF17-8FE2-43BA1E4AFCAB";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_5_initLoc_multMat";
	rename -uid "5C5FBB11-464E-416C-FDED-D3A2050C7961";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_end_initLoc_multMat";
	rename -uid "8C148A75-44E6-B2F9-EE1D-1EA3758E555E";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_1_1_fanLoc_multMat";
	rename -uid "E5D60981-4BC5-3689-AAB9-65BA8F27A033";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_1_initLoc_multMat";
	rename -uid "8746CD48-43A2-1671-FF51-DC9CC141A4A2";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_2_initLoc_multMat";
	rename -uid "7DB4D23D-4D75-A368-533E-95B883597095";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_3_initLoc_multMat";
	rename -uid "14E6CB18-4D5E-B611-2298-0F96D687A8E8";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_4_initLoc_multMat";
	rename -uid "3B54A89D-47C6-B8D6-F18B-CC8F5A7AD542";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_5_initLoc_multMat";
	rename -uid "1BF5E394-4DD0-D3B9-B824-2BA9DE04585C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_end_initLoc_multMat";
	rename -uid "917303C0-4513-D274-F22A-C481DFD801AD";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_2_1_fanLoc_multMat";
	rename -uid "81A446EF-48F3-A0A7-105C-CD903A0F0BC9";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_1_initLoc_multMat";
	rename -uid "BA3D93D1-47B6-F1F1-E1CD-86B2D5CB78A2";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_2_initLoc_multMat";
	rename -uid "E1D21597-4A9D-65DA-5A21-11A34F08B74D";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_3_initLoc_multMat";
	rename -uid "DA5F12C3-4139-36A0-3821-21B1D930A63B";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_4_initLoc_multMat";
	rename -uid "5D57EDBE-47AD-4D1E-5C63-99ABF569DCE1";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_5_initLoc_multMat";
	rename -uid "4CE7DA80-4EDA-BFF2-4CE3-4A8979332AF9";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_end_initLoc_multMat";
	rename -uid "6EA8893C-4B91-B10D-1F44-73BF70CA8800";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_3_1_fanLoc_multMat";
	rename -uid "D8E51168-4872-0FEB-1C7F-32B55ED2DF02";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_1_initLoc_multMat";
	rename -uid "D8CB4A66-431F-7CBC-6537-F1B161450786";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_2_initLoc_multMat";
	rename -uid "63DBB5BB-4FD4-AD1D-87EA-4BA2D9374A66";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_3_initLoc_multMat";
	rename -uid "42D4223E-435D-5F2D-8C5C-BFBCB6D456BC";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_4_initLoc_multMat";
	rename -uid "F4107015-4E5C-3037-B2F8-5092985F3263";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_5_initLoc_multMat";
	rename -uid "9DCBE343-4190-FD8E-2091-58B67B406212";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_end_initLoc_multMat";
	rename -uid "C5ED5E56-438A-EFAB-EDA6-1DB912BE2BA2";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_4_1_fanLoc_multMat";
	rename -uid "43C064B2-40D7-B89F-ECB7-0394B917C9B9";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_1_initLoc_multMat";
	rename -uid "7B1E7675-4F53-C0DA-22C4-B6B9980F098C";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_2_initLoc_multMat";
	rename -uid "7B311AFC-403E-C5B5-E6B6-C987AFD53AF2";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_3_initLoc_multMat";
	rename -uid "08D8AD4D-4F9C-2C6B-0B99-AFB34A2023F0";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_4_initLoc_multMat";
	rename -uid "01AE613A-49DE-935B-BE64-5D9B30A55816";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_5_initLoc_multMat";
	rename -uid "12E304D9-43E1-58A9-D4AA-1180397A9D45";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_end_initLoc_multMat";
	rename -uid "05A3BAF4-4831-FF0F-753E-D9A0580668D4";
	setAttr -s 5 ".i";
createNode multMatrix -n "r_feather_5_1_fanLoc_multMat";
	rename -uid "73C2A774-4F7D-D3B0-3FAF-5C9A83CA91AA";
	setAttr -s 5 ".i";
createNode animBlendNodeAdditiveRotation -n "feather_1_rotation";
	rename -uid "FCEC5F16-48CB-A7D0-A127-3FABA3F466F8";
	setAttr ".wa" 0.8;
	setAttr ".wb" 0.2;
createNode animBlendNodeAdditiveRotation -n "feather_2_rotation";
	rename -uid "909883BC-4393-5073-4493-0EBEBB85F687";
	setAttr ".wa" 0.6;
	setAttr ".wb" 0.4;
createNode animBlendNodeAdditiveRotation -n "feather_3_rotation";
	rename -uid "0E3792B1-4FE4-B9CC-58E5-C2B0CED9FA51";
	setAttr ".wa" 0.4;
	setAttr ".wb" 0.6;
createNode animBlendNodeAdditiveRotation -n "feather_4_rotation";
	rename -uid "CF74009E-42EE-A975-6036-CB8737942734";
	setAttr ".wa" 0.19999999999999996;
	setAttr ".wb" 0.8;
createNode animBlendNodeAdditiveRotation -n "feather_5_rotation";
	rename -uid "FBB3CEC2-47CE-830D-6206-44A732A515C0";
	setAttr ".wa" 0;
createNode animBlendNodeAdditiveRotation -n "feather_1_rootRotation";
	rename -uid "2AFF7B17-4EB2-C80F-A830-60AFE12C3097";
	setAttr ".wa" 0;
	setAttr ".wb" 0.2;
createNode animBlendNodeAdditiveRotation -n "feather_2_rootRotation";
	rename -uid "9661592A-4A4E-9E5C-621F-9B8CA603D2A8";
	setAttr ".wa" 0;
	setAttr ".wb" 0.4;
createNode animBlendNodeAdditiveRotation -n "feather_3_rootRotation";
	rename -uid "1A336AA5-4DC3-69C6-FBD4-4B9F0544DB4F";
	setAttr ".wa" 0;
	setAttr ".wb" 0.6;
createNode animBlendNodeAdditiveRotation -n "feather_4_rootRotation";
	rename -uid "EF2CCFCB-494F-B5A0-C404-38A3E2C32E27";
	setAttr ".wa" 0;
	setAttr ".wb" 0.8;
createNode animBlendNodeAdditiveRotation -n "feather_5_rootRotation";
	rename -uid "90636042-47DD-3E00-7677-BAA1E795AA2C";
	setAttr ".wa" 0;
createNode multMatrix -n "m_feather_1_group_multMat";
	rename -uid "451D40CC-41E3-63FA-2710-C8BA210AA869";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_1_outJoint_multMat";
	rename -uid "6CB36B77-48E0-BDED-F66A-F39CD7E3FDEF";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "m_feather_1_outJoint_decMat";
	rename -uid "D31110F6-45DE-EC8A-195D-93A51992DDCB";
createNode multMatrix -n "m_feather_2_group_multMat";
	rename -uid "81B58316-423C-3627-40AC-2EB997DA90AD";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_2_mainAxes_multMat";
	rename -uid "CF514407-40B4-1243-468D-C8902A7AB876";
	setAttr -s 2 ".i";
createNode pickMatrix -n "m_feather_2_mainAxes_pickMatrix";
	rename -uid "93FB31F4-4888-A272-2A7E-03B6268A5892";
	setAttr ".tra" no;
createNode inverseMatrix -n "m_feather_2_mainAxes_inverseMatrix";
	rename -uid "506E80D0-4126-FBB8-F4F0-27982371FAB5";
createNode multMatrix -n "m_feather_2_mainGroup_multMat";
	rename -uid "B0150ADD-4986-67DF-E5D0-B98B73175572";
	setAttr -s 3 ".i";
createNode multMatrix -n "m_feather_2_outJoint_multMat";
	rename -uid "6BBE360C-4F01-EA6F-2A55-F7B3DDE7800A";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_2_outJoint_decMat";
	rename -uid "5DC2F457-46FF-2803-70F6-DB8E28A2C89F";
createNode multMatrix -n "m_feather_3_group_multMat";
	rename -uid "6A13D15D-4249-C6ED-9D2A-0C8419A8F773";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_3_mainAxes_multMat";
	rename -uid "3C9841EA-428C-BEA7-C04C-54BB12161867";
	setAttr -s 2 ".i";
createNode pickMatrix -n "m_feather_3_mainAxes_pickMatrix";
	rename -uid "089D9F01-444E-D685-CCE7-F9B62B1ED63A";
	setAttr ".tra" no;
createNode inverseMatrix -n "m_feather_3_mainAxes_inverseMatrix";
	rename -uid "DE8EE8CA-42B0-CE2A-1878-8CB718E5C164";
createNode multMatrix -n "m_feather_3_mainGroup_multMat";
	rename -uid "427A7E8C-4C83-5F04-0D7D-5EA0D143E199";
	setAttr -s 3 ".i";
createNode multMatrix -n "m_feather_3_outJoint_multMat";
	rename -uid "B95838E0-4379-6B03-E461-31914454232B";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_3_outJoint_decMat";
	rename -uid "901BFD29-4D74-3D6E-49EB-8FBF5CB3CB16";
createNode multMatrix -n "m_feather_4_group_multMat";
	rename -uid "4CC40016-49CF-4765-A4DC-0B859B04D89B";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_4_mainAxes_multMat";
	rename -uid "2D6433D8-42B1-3801-8281-BE88601149A7";
	setAttr -s 2 ".i";
createNode pickMatrix -n "m_feather_4_mainAxes_pickMatrix";
	rename -uid "BE3603F4-4618-71CC-770E-AEA0FEB5C60B";
	setAttr ".tra" no;
createNode inverseMatrix -n "m_feather_4_mainAxes_inverseMatrix";
	rename -uid "CC54FE04-41DB-C31B-6116-F395B6CB9CE1";
createNode multMatrix -n "m_feather_4_mainGroup_multMat";
	rename -uid "2C0FC9B6-4EDB-584B-69FA-3A8A70C35CA5";
	setAttr -s 3 ".i";
createNode multMatrix -n "m_feather_4_outJoint_multMat";
	rename -uid "43C4842A-486C-AA25-CACD-C28C4554B837";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_4_outJoint_decMat";
	rename -uid "F8F126B3-4745-4176-5340-5491AA366B78";
createNode multMatrix -n "m_feather_5_group_multMat";
	rename -uid "CA6A4C46-42FB-B2A6-3E6C-DEB1508DFD78";
	setAttr -s 2 ".i";
createNode multMatrix -n "m_feather_5_mainAxes_multMat";
	rename -uid "1DAE581B-4783-463F-3503-2F999D2E18C9";
	setAttr -s 2 ".i";
createNode pickMatrix -n "m_feather_5_mainAxes_pickMatrix";
	rename -uid "AD997B4C-4596-FF06-C81E-7E9A7A954E4E";
	setAttr ".tra" no;
createNode inverseMatrix -n "m_feather_5_mainAxes_inverseMatrix";
	rename -uid "CA306D56-4E3F-A1E3-A6A3-6C9A507FB152";
createNode multMatrix -n "m_feather_5_mainGroup_multMat";
	rename -uid "15A473EA-4BEA-69F6-5F09-82BC2960D4C4";
	setAttr -s 3 ".i";
createNode multMatrix -n "m_feather_5_outJoint_multMat";
	rename -uid "D7EAC55D-4CBB-1A15-102F-E7BEA9734DD7";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "m_feather_5_outJoint_decMat";
	rename -uid "70FD89B5-4397-DF53-CEBB-048C8C76846E";
createNode multMatrix -n "m_feather_end_multMat";
	rename -uid "F8F1EB65-4FD0-0CD1-2C59-389760235996";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "m_feather_end_decMat";
	rename -uid "7E3C1D58-4509-F7CE-BF2F-20B3C2ECE945";
createNode objectSet -n "m_feather_moduleControlSet";
	rename -uid "AC4142EC-4695-0A04-FC27-56BA3F0B967D";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_1_1_group_multMat";
	rename -uid "B12739C8-48E3-D378-87C3-D2B0204B1854";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_1_rollGroup_multMat";
	rename -uid "F18DC49E-425B-1EF5-1778-A0ADAF6C6533";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_1_outJoint_multMat";
	rename -uid "991D249D-4B4C-27A9-9C6A-2089A8EB62EA";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_1_1_outJoint_decMat";
	rename -uid "057E2921-4BE3-A40D-90D9-E99706322C21";
createNode multMatrix -n "l_feather_1_2_group_multMat";
	rename -uid "235552DD-4726-31CB-1573-CFAB967CDF42";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_2_mainAxes_multMat";
	rename -uid "DD54527F-4353-DCEA-2F84-8F915D9B584E";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_1_2_mainAxes_pickMatrix";
	rename -uid "981A0485-4C85-FAA4-FAC7-E9A37A796D8C";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_1_2_mainAxes_inverseMatrix";
	rename -uid "4C53B281-4DD0-E7B0-BEFA-A08609AED507";
createNode multMatrix -n "l_feather_1_2_mainGroup_multMat";
	rename -uid "6F54F13C-4F5C-1EEC-CCF4-EA9EEE768B87";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_1_2_rollGroup_multMat";
	rename -uid "3DF8D8B2-4766-D949-4C51-C494C9468603";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_2_outJoint_multMat";
	rename -uid "92770F01-4A3C-A071-6B97-CC8B90792AEF";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_2_outJoint_decMat";
	rename -uid "C61CD73F-4EFC-0729-0A9A-8D92FA734581";
createNode multMatrix -n "l_feather_1_3_group_multMat";
	rename -uid "E74F4530-40FC-D367-C7E3-EA85596AFC89";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_3_mainAxes_multMat";
	rename -uid "BB392410-4275-3E3A-4B1C-95BA11706F2C";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_1_3_mainAxes_pickMatrix";
	rename -uid "01F5CCE5-4B03-63DE-8A17-FE90CDB3EE1A";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_1_3_mainAxes_inverseMatrix";
	rename -uid "09FCC183-4C57-969F-DBB3-CBAE75AD7CA4";
createNode multMatrix -n "l_feather_1_3_mainGroup_multMat";
	rename -uid "D6DF6D66-46DF-F4E7-B615-B49BE36911AD";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_1_3_rollGroup_multMat";
	rename -uid "633A2645-4BE2-32E4-CC10-1ABA70E48DF9";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_3_outJoint_multMat";
	rename -uid "B6394C96-40B0-C6C1-5B0D-D7B5D72E37B2";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_3_outJoint_decMat";
	rename -uid "BC84291D-44AF-9BA2-0AAB-95B9F61FB90E";
createNode multMatrix -n "l_feather_1_4_group_multMat";
	rename -uid "0E5F1483-4DD6-D02B-9421-D7AE80A212D4";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_4_mainAxes_multMat";
	rename -uid "2172E8B3-465D-89AC-B1A2-DCA07CBE97D2";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_1_4_mainAxes_pickMatrix";
	rename -uid "8907B934-464E-BE24-E830-649CD6208162";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_1_4_mainAxes_inverseMatrix";
	rename -uid "A69DA454-4571-1502-9E46-C697F2C98E31";
createNode multMatrix -n "l_feather_1_4_mainGroup_multMat";
	rename -uid "1C6E0807-4F8F-BE04-4F9D-EB8896E72624";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_1_4_rollGroup_multMat";
	rename -uid "CF526D6E-48DD-07A4-7664-A8AB9927E09A";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_4_outJoint_multMat";
	rename -uid "54D24A87-4A94-19EB-2662-3C84BE52DC4C";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_4_outJoint_decMat";
	rename -uid "8C53CE28-4380-FA54-3715-CA8A8C6AB7C0";
createNode multMatrix -n "l_feather_1_5_group_multMat";
	rename -uid "FA8C254D-494E-2298-1448-10B8CF734480";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_5_mainAxes_multMat";
	rename -uid "D3102BEC-4AB9-DA5B-EF17-B7B51686AB5E";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_1_5_mainAxes_pickMatrix";
	rename -uid "EA925215-4A2A-487C-9257-15999ACF3E1A";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_1_5_mainAxes_inverseMatrix";
	rename -uid "84AF8CC8-4E37-2A18-5E3E-8E8596B86925";
createNode multMatrix -n "l_feather_1_5_mainGroup_multMat";
	rename -uid "B7BE86F2-4C9F-EAD0-7592-8EA03613CAA2";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_1_5_rollGroup_multMat";
	rename -uid "84AF740C-4419-B496-F450-CEB0AE9BE363";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_1_5_outJoint_multMat";
	rename -uid "0FD9E701-4AFF-3EE7-CC02-E29482C7FDCB";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_1_5_outJoint_decMat";
	rename -uid "80F8ACD8-4EEB-6651-B0CE-0A8BD2B6F843";
createNode multMatrix -n "l_feather_1_end_multMat";
	rename -uid "CEF787B7-4FFD-54D4-27E5-DF95D8C9C255";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_1_end_decMat";
	rename -uid "B6A1C801-4D9E-08D8-1833-AC9C0C73770A";
createNode objectSet -n "l_feather_1_moduleControlSet";
	rename -uid "CBD0FD61-4267-3746-277B-B489B0D36C27";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_2_1_group_multMat";
	rename -uid "D707B31A-475C-7188-1C6B-98ABF6907710";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_1_rollGroup_multMat";
	rename -uid "D3465A80-4E37-3D48-AE0E-B0A6321BC27C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_1_outJoint_multMat";
	rename -uid "6366001D-4D83-7898-1BEB-508B50CE8136";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_2_1_outJoint_decMat";
	rename -uid "1CD13ABB-42B9-7637-C1FD-A48CB051E2F9";
createNode multMatrix -n "l_feather_2_2_group_multMat";
	rename -uid "2A35C799-457B-B8C2-2E93-C88ABAF4FBEA";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_2_mainAxes_multMat";
	rename -uid "4264E45B-4768-3BFE-B74D-079C45DE654D";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_2_2_mainAxes_pickMatrix";
	rename -uid "27957D48-419D-A8FE-CDAD-839F0C3253A0";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_2_2_mainAxes_inverseMatrix";
	rename -uid "F8AC527C-4F93-C5B3-6D26-33BD2F443FCD";
createNode multMatrix -n "l_feather_2_2_mainGroup_multMat";
	rename -uid "C0EE8827-4A81-1AD7-8EAD-4588271E6048";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_2_2_rollGroup_multMat";
	rename -uid "E5C4B94A-4938-2F5F-FBA4-3EA2044B30A2";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_2_outJoint_multMat";
	rename -uid "66A58797-466C-C7A7-CF93-4DB0B0D28082";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_2_outJoint_decMat";
	rename -uid "EC939289-4D2C-55FC-EA31-91869EEFAE50";
createNode multMatrix -n "l_feather_2_3_group_multMat";
	rename -uid "FDD47662-45F8-1BDB-9725-D6A04C21C598";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_3_mainAxes_multMat";
	rename -uid "C4CA1913-4A4D-C593-AA52-29B9EAC2258E";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_2_3_mainAxes_pickMatrix";
	rename -uid "B0465FFE-4803-63F2-473D-F8BD7AB45062";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_2_3_mainAxes_inverseMatrix";
	rename -uid "DFBAB39E-4389-E905-B61F-81B6ECA90809";
createNode multMatrix -n "l_feather_2_3_mainGroup_multMat";
	rename -uid "BE0DE72D-4874-9858-F48D-F28651BFEC71";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_2_3_rollGroup_multMat";
	rename -uid "9E34D17A-4AE2-5B79-5779-349CCFB6F5FC";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_3_outJoint_multMat";
	rename -uid "A793684A-4A66-1F7F-42DD-5F98D2DEB453";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_3_outJoint_decMat";
	rename -uid "413F2E2E-42E7-ADCB-8401-8CBFF5CB9DC6";
createNode multMatrix -n "l_feather_2_4_group_multMat";
	rename -uid "353D5B7F-4EF8-589C-8C97-93B63E8557E2";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_4_mainAxes_multMat";
	rename -uid "8E9F2CFD-4D09-30C6-CABF-C8A2093BF2C8";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_2_4_mainAxes_pickMatrix";
	rename -uid "EE283DEF-49E3-79E7-F3B7-4A93AC76FD66";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_2_4_mainAxes_inverseMatrix";
	rename -uid "CC33F1EE-4B72-BA6D-A9FE-DFAD46DA383C";
createNode multMatrix -n "l_feather_2_4_mainGroup_multMat";
	rename -uid "853C478E-4E5D-AA58-D3F5-FC8A2DF851A4";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_2_4_rollGroup_multMat";
	rename -uid "680D553E-4BFC-4995-14CE-C5829C14989A";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_4_outJoint_multMat";
	rename -uid "88D78FA9-4BDB-BD67-976D-CC9A7A971F68";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_4_outJoint_decMat";
	rename -uid "B72E00F6-4CBD-8FBA-7602-589E847E8E0E";
createNode multMatrix -n "l_feather_2_5_group_multMat";
	rename -uid "9DCB15FF-4C45-1E94-76AD-699D0FB38E5C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_5_mainAxes_multMat";
	rename -uid "215E925C-4BFB-83D3-9C3A-D6A4D2E817D5";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_2_5_mainAxes_pickMatrix";
	rename -uid "3D6142F6-40D7-12E0-28D3-B9AD928CC7F7";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_2_5_mainAxes_inverseMatrix";
	rename -uid "4A55CADF-4DFB-2B32-D28D-B6B0FA2089B6";
createNode multMatrix -n "l_feather_2_5_mainGroup_multMat";
	rename -uid "0EFCE328-482E-83C8-D190-3FA8B412BE99";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_2_5_rollGroup_multMat";
	rename -uid "459EF29D-49DA-EDCD-AA35-CFA83963B9ED";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_2_5_outJoint_multMat";
	rename -uid "9306CF41-43EF-F194-880D-3AB3D6C171D4";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_2_5_outJoint_decMat";
	rename -uid "277D1A2D-4449-1B1E-17B8-6BA46E6DEAA0";
createNode multMatrix -n "l_feather_2_end_multMat";
	rename -uid "9AECDEB2-49A3-5238-ED7F-89AA8F6E22A9";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_2_end_decMat";
	rename -uid "EF704CFA-4CE2-EF5B-C733-5C87654D5687";
createNode objectSet -n "l_feather_2_moduleControlSet";
	rename -uid "E5D4F690-422C-D88C-7622-6687ADA894B1";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_3_1_group_multMat";
	rename -uid "B1E315AF-48F1-5CF6-DC51-ADBF41C43D7B";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_1_rollGroup_multMat";
	rename -uid "E062942B-4D78-2665-7EE3-0DB956724E4C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_1_outJoint_multMat";
	rename -uid "8B46F68B-4B37-27EB-9D0E-F7BD473C0F80";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_3_1_outJoint_decMat";
	rename -uid "B06609BB-4CE0-708E-9660-84B70D45B9E8";
createNode multMatrix -n "l_feather_3_2_group_multMat";
	rename -uid "ACE2B194-43E1-546E-6054-B599668D71FE";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_2_mainAxes_multMat";
	rename -uid "8C88CBBB-4182-7747-0097-A3BCB189655E";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_3_2_mainAxes_pickMatrix";
	rename -uid "E41C62E9-47E4-F339-4795-2AAE199B5EFC";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_3_2_mainAxes_inverseMatrix";
	rename -uid "17457779-46C0-C357-77D6-81BC01EC7830";
createNode multMatrix -n "l_feather_3_2_mainGroup_multMat";
	rename -uid "4E66AB2F-4C44-DDEE-AEA0-27B70F24B85B";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_3_2_rollGroup_multMat";
	rename -uid "07F059C5-496D-5C3A-836B-DFADCC850950";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_2_outJoint_multMat";
	rename -uid "8A02DAA0-4E62-4EDC-E874-33A3B3BBEB2B";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_2_outJoint_decMat";
	rename -uid "DEDFAFD8-44CA-F63E-DE31-0B83EE0A3C2A";
createNode multMatrix -n "l_feather_3_3_group_multMat";
	rename -uid "F140CCF9-49FC-A8D3-52B8-EC9760A7887A";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_3_mainAxes_multMat";
	rename -uid "1EA8576E-4CB1-5646-5BA4-D89A6F95BED5";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_3_3_mainAxes_pickMatrix";
	rename -uid "E1AE20DB-47F5-587C-19B4-89A991F1F042";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_3_3_mainAxes_inverseMatrix";
	rename -uid "8E7EC8DE-4990-75D8-B46D-8BB17EC86B87";
createNode multMatrix -n "l_feather_3_3_mainGroup_multMat";
	rename -uid "62D7B021-47A3-5730-110C-4DBE14D67A6D";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_3_3_rollGroup_multMat";
	rename -uid "D248B9AE-4BA1-8DFC-ABA0-F6B1EC078EB0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_3_outJoint_multMat";
	rename -uid "F0798D7A-46E1-46F3-C614-CB8D845C3888";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_3_outJoint_decMat";
	rename -uid "D9C95BFC-4FE6-D240-82CA-93AA356D19E6";
createNode multMatrix -n "l_feather_3_4_group_multMat";
	rename -uid "0EF154BE-482F-4668-2012-5995DED03824";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_4_mainAxes_multMat";
	rename -uid "15D264D9-4FAC-B4D4-3F80-98BCE39EFC4C";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_3_4_mainAxes_pickMatrix";
	rename -uid "622CC526-469D-F5AE-8FA7-3180BACB9208";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_3_4_mainAxes_inverseMatrix";
	rename -uid "D3C1747C-47AA-71FD-3AC8-FB9A2E3A1ED5";
createNode multMatrix -n "l_feather_3_4_mainGroup_multMat";
	rename -uid "B5D8AC0C-4391-6DD7-E699-97B2BF51DB1D";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_3_4_rollGroup_multMat";
	rename -uid "A240BDD3-4443-6B08-9073-4392810A612A";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_4_outJoint_multMat";
	rename -uid "FD6871DA-46F1-7EF7-8BA8-6CA208140E24";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_4_outJoint_decMat";
	rename -uid "BEAF0000-4FF0-7550-D4BC-C79D721A68DB";
createNode multMatrix -n "l_feather_3_5_group_multMat";
	rename -uid "C1EF8443-40F6-82DC-3F57-1B853FD073EA";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_5_mainAxes_multMat";
	rename -uid "E12ED101-4243-AE52-0591-7A9379B5E846";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_3_5_mainAxes_pickMatrix";
	rename -uid "F070997B-475C-5D90-CF21-149C50A06DDD";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_3_5_mainAxes_inverseMatrix";
	rename -uid "DE3D091B-4409-41F4-EDC0-5088F2823BCA";
createNode multMatrix -n "l_feather_3_5_mainGroup_multMat";
	rename -uid "C30CCA4C-4D30-29CA-29B7-7CB6EB3FA646";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_3_5_rollGroup_multMat";
	rename -uid "F8A1C06E-4F7F-E8A8-8E70-239D5B9CE124";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_3_5_outJoint_multMat";
	rename -uid "FECA5713-412B-5DB8-3C5B-02B6D976A575";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_3_5_outJoint_decMat";
	rename -uid "07AC4AC0-49E0-BC40-DE10-729CC01546AE";
createNode multMatrix -n "l_feather_3_end_multMat";
	rename -uid "18C9EB61-4EDA-5F1D-F0FE-0BB9144563F1";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_3_end_decMat";
	rename -uid "D95FF46B-44CE-601B-BA05-92B17314767C";
createNode objectSet -n "l_feather_3_moduleControlSet";
	rename -uid "3898986B-488C-B493-FED6-C5890D15085D";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_4_1_group_multMat";
	rename -uid "98E053CB-45E1-8305-95D0-7B96C0627B17";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_1_rollGroup_multMat";
	rename -uid "887586CA-4E3B-C02A-52A5-D2BE57432893";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_1_outJoint_multMat";
	rename -uid "B9BF61D9-44F2-5895-6822-CCB2C540B7B6";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_4_1_outJoint_decMat";
	rename -uid "FD607C54-4B4C-B164-4F27-F3BC96CCEA09";
createNode multMatrix -n "l_feather_4_2_group_multMat";
	rename -uid "4CE30F30-41CA-2DDB-773B-198895F4CDCE";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_2_mainAxes_multMat";
	rename -uid "8BA5856E-4D65-AEDF-697F-6AB4EBD3F6A8";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_4_2_mainAxes_pickMatrix";
	rename -uid "542E9140-43F0-2228-EA2B-F6A4C7932A70";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_4_2_mainAxes_inverseMatrix";
	rename -uid "698D47AE-49B7-F482-2FF7-6480C6F1EBAF";
createNode multMatrix -n "l_feather_4_2_mainGroup_multMat";
	rename -uid "A916CAB7-4009-2B86-0130-82A10C20B73F";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_4_2_rollGroup_multMat";
	rename -uid "4F2C5AF5-426F-3603-3C16-38896E1DEED1";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_2_outJoint_multMat";
	rename -uid "C20CD5BA-4648-3BD1-4644-08961E77E066";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_2_outJoint_decMat";
	rename -uid "AF84E0FB-4EBD-A517-FDE7-46BFD5CDD3D9";
createNode multMatrix -n "l_feather_4_3_group_multMat";
	rename -uid "EDCC8EA2-4E71-CA17-76AD-ACA097610A1C";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_3_mainAxes_multMat";
	rename -uid "1F7A7CF4-4ABE-8A85-212E-C682AEFBF963";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_4_3_mainAxes_pickMatrix";
	rename -uid "DE61E17A-479D-740C-AC3D-56923BDF1984";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_4_3_mainAxes_inverseMatrix";
	rename -uid "3C890E9C-4279-BF08-918F-5986425E832D";
createNode multMatrix -n "l_feather_4_3_mainGroup_multMat";
	rename -uid "B2600101-497D-0268-C802-2184095E7ECC";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_4_3_rollGroup_multMat";
	rename -uid "37E4E11D-46E9-C356-E4AA-5ABA4922E9B6";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_3_outJoint_multMat";
	rename -uid "F0F9C2F0-43CC-81D4-52A4-5989B62DC44D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_3_outJoint_decMat";
	rename -uid "FA4C36A0-4154-159F-FE33-67B94826E1CC";
createNode multMatrix -n "l_feather_4_4_group_multMat";
	rename -uid "C1B27B0D-49DB-EDDD-C0E5-4599177347D0";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_4_mainAxes_multMat";
	rename -uid "C2EBEE27-4702-52F7-49B4-BC808E768ED2";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_4_4_mainAxes_pickMatrix";
	rename -uid "387ECC2A-4CA1-3A40-472E-768F071FE718";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_4_4_mainAxes_inverseMatrix";
	rename -uid "7AB4E4A5-4A43-C787-F583-188D5D947748";
createNode multMatrix -n "l_feather_4_4_mainGroup_multMat";
	rename -uid "782B2C28-43F5-F354-41F2-DE9694B50E0B";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_4_4_rollGroup_multMat";
	rename -uid "4BE36351-4E29-B32A-9F09-21A25D5B40F5";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_4_outJoint_multMat";
	rename -uid "651810CC-4AC4-79FA-74D5-1A8EF97F0B54";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_4_outJoint_decMat";
	rename -uid "1FBA37CF-4106-6469-E0F5-13A088DB64C3";
createNode multMatrix -n "l_feather_4_5_group_multMat";
	rename -uid "E47E9F97-4ED7-28DB-A810-71B8553DC100";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_5_mainAxes_multMat";
	rename -uid "8F62C9D0-4D08-BF06-269C-6898633A2A22";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_4_5_mainAxes_pickMatrix";
	rename -uid "79A29297-4B68-09A1-9FBC-219AA30E9AC9";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_4_5_mainAxes_inverseMatrix";
	rename -uid "3827E47C-494B-DDA4-34D6-C68A4AF16F4D";
createNode multMatrix -n "l_feather_4_5_mainGroup_multMat";
	rename -uid "2E38DDCD-436E-50C9-271C-A590020541BE";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_4_5_rollGroup_multMat";
	rename -uid "328705D6-4C6F-5B29-8B2D-BAB955102BAC";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_4_5_outJoint_multMat";
	rename -uid "AC5EDE83-4957-1008-5171-F994E662BD3E";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_4_5_outJoint_decMat";
	rename -uid "981333BA-477D-F75C-D10B-6FBACA63A099";
createNode multMatrix -n "l_feather_4_end_multMat";
	rename -uid "4BC6714D-4823-B387-E563-F29F0CF86C07";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_4_end_decMat";
	rename -uid "54E37ABF-426C-1E23-B680-22BEFB8F1650";
createNode objectSet -n "l_feather_4_moduleControlSet";
	rename -uid "D9AB8432-4321-86A1-ECF2-9F85826A1A15";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "l_feather_5_1_group_multMat";
	rename -uid "366E2013-4140-578C-DD9E-88BCB21E87BF";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_1_rollGroup_multMat";
	rename -uid "3092ED8A-450D-D501-B9A9-E68AAA9D8E21";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_1_outJoint_multMat";
	rename -uid "7F291140-4AFD-88C2-65FE-8AAFF5F1256D";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "l_feather_5_1_outJoint_decMat";
	rename -uid "C449DD4B-4E63-8F6D-EDCE-A79F5FF9BA09";
createNode multMatrix -n "l_feather_5_2_group_multMat";
	rename -uid "4806B12F-41F5-88FC-9609-1283099E714D";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_2_mainAxes_multMat";
	rename -uid "D13BB52F-4D31-33B1-67D8-E3BDA05CD425";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_5_2_mainAxes_pickMatrix";
	rename -uid "8F16285E-4CFB-4EFD-9018-BF95658EB02E";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_5_2_mainAxes_inverseMatrix";
	rename -uid "49081A96-4823-0696-2F28-FCBDDBC890C8";
createNode multMatrix -n "l_feather_5_2_mainGroup_multMat";
	rename -uid "B557823A-4D5C-5A58-4E1F-1AA883168AD8";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_5_2_rollGroup_multMat";
	rename -uid "A7E4929D-4C81-40B0-0CF6-F5BAFBDCC516";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_2_outJoint_multMat";
	rename -uid "F43E4C47-45FA-2B76-45AA-949630AEFB50";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_2_outJoint_decMat";
	rename -uid "37D750AE-4832-6DD3-72D3-94A93722ADA8";
createNode multMatrix -n "l_feather_5_3_group_multMat";
	rename -uid "F8D4426E-4AF2-1101-D07D-99853BD7391A";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_3_mainAxes_multMat";
	rename -uid "EF529BBF-4356-5219-B842-978C2D8DE337";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_5_3_mainAxes_pickMatrix";
	rename -uid "42D8BE97-4523-2869-207B-98B363C3719C";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_5_3_mainAxes_inverseMatrix";
	rename -uid "AD0C0350-4885-59A3-DD7F-698BDC4D2680";
createNode multMatrix -n "l_feather_5_3_mainGroup_multMat";
	rename -uid "082183AB-40D5-0DC3-7574-288A4E6F5EFA";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_5_3_rollGroup_multMat";
	rename -uid "0271D94A-40D1-96C5-0FAF-DF866DB16B57";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_3_outJoint_multMat";
	rename -uid "4F787559-47BD-1FDA-85DD-89A6B974CFF9";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_3_outJoint_decMat";
	rename -uid "220DE238-4F3B-C007-7D8E-4D8B233D7EAF";
createNode multMatrix -n "l_feather_5_4_group_multMat";
	rename -uid "C298E5BF-4691-B1DF-EC61-BB9E0C4884E4";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_4_mainAxes_multMat";
	rename -uid "96087660-4963-7959-344E-0F94C9BB3D91";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_5_4_mainAxes_pickMatrix";
	rename -uid "9B165049-4880-1CB1-819B-54B2640C09E2";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_5_4_mainAxes_inverseMatrix";
	rename -uid "B23AF0CE-4203-01B7-57C9-65B595A5D3EB";
createNode multMatrix -n "l_feather_5_4_mainGroup_multMat";
	rename -uid "E2B0B215-4A06-CEDB-D193-74B15A0C2F4A";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_5_4_rollGroup_multMat";
	rename -uid "4951375C-4764-2BE6-75CC-439A391EE1A8";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_4_outJoint_multMat";
	rename -uid "35F5C9D6-46C5-5AA7-91AD-65B05F3200B9";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_4_outJoint_decMat";
	rename -uid "41D32E5D-4F67-87AA-6B7B-5DAE70FD5E00";
createNode multMatrix -n "l_feather_5_5_group_multMat";
	rename -uid "8236B4DE-4854-33A2-E14F-E7ABC0D96CC5";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_5_mainAxes_multMat";
	rename -uid "6A768071-46CD-40F2-1FB4-65891A5B94A4";
	setAttr -s 2 ".i";
createNode pickMatrix -n "l_feather_5_5_mainAxes_pickMatrix";
	rename -uid "D185FABC-4EDA-0FE8-5BE2-90A1951B44E3";
	setAttr ".tra" no;
createNode inverseMatrix -n "l_feather_5_5_mainAxes_inverseMatrix";
	rename -uid "15AD7A72-4CFB-C648-1163-EFB6B4CBCEE4";
createNode multMatrix -n "l_feather_5_5_mainGroup_multMat";
	rename -uid "4550B981-4837-F678-CF58-6EA8849E39C3";
	setAttr -s 3 ".i";
createNode multMatrix -n "l_feather_5_5_rollGroup_multMat";
	rename -uid "81C68CA1-40DB-1D77-5E93-238E18F1BF24";
	setAttr -s 2 ".i";
createNode multMatrix -n "l_feather_5_5_outJoint_multMat";
	rename -uid "FA0863C1-4A13-0473-882A-ECB750ABFD30";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "l_feather_5_5_outJoint_decMat";
	rename -uid "20977BFD-409A-4D9A-0503-ED8B6D5EB586";
createNode multMatrix -n "l_feather_5_end_multMat";
	rename -uid "25FB04A3-40ED-42E1-9F9A-79994F477B23";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "l_feather_5_end_decMat";
	rename -uid "056F6E2D-4543-CAF0-165B-1D929AA0BCDD";
createNode objectSet -n "l_feather_5_moduleControlSet";
	rename -uid "2223AB35-4994-F67D-626C-6C9EE8B53D7D";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_1_1_group_multMat";
	rename -uid "4AEB9E78-4C55-ECCF-F48B-BEAC949514A5";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_1_1_outJoint_multMat";
	rename -uid "AA7AEFBE-473D-0054-6127-D6AD452E99C9";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_1_1_outJoint_decMat";
	rename -uid "47912EC6-4A76-91B1-9A72-A581CC6EB66C";
createNode multMatrix -n "r_feather_1_2_mainAxes_multMat";
	rename -uid "DBEAB2B6-4B99-7B5A-5138-51AA475B44B7";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_1_2_mainAxes_pickMatrix";
	rename -uid "B70E0B59-4D1B-A226-685D-0E8BF8D3B4D8";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_1_2_mainAxes_inverseMatrix";
	rename -uid "B1F780F9-4B1E-A8E7-1DD4-0CAEE7365958";
createNode multMatrix -n "r_feather_1_2_mainGroup_multMat";
	rename -uid "7526E915-48ED-EB16-FE61-BAB7B7EC01EB";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_1_2_outJoint_multMat";
	rename -uid "DE6DF640-4CFD-FB03-B90C-A491D04E4E70";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_2_outJoint_decMat";
	rename -uid "FEA9A68C-41F6-A7A3-2667-418ED5389884";
createNode multMatrix -n "r_feather_1_3_mainAxes_multMat";
	rename -uid "9ECE851F-4051-906D-6C7F-3CBF025BCC7A";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_1_3_mainAxes_pickMatrix";
	rename -uid "193227CD-4B8C-9869-66B7-6E8E0619A244";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_1_3_mainAxes_inverseMatrix";
	rename -uid "E6514ADE-4560-F92A-1FE6-F29B25C7CFB4";
createNode multMatrix -n "r_feather_1_3_mainGroup_multMat";
	rename -uid "C366CDAF-4F1E-3566-3D7A-49AC04551293";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_1_3_outJoint_multMat";
	rename -uid "D946D952-4466-F24D-3A4B-C5B834B50A46";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_3_outJoint_decMat";
	rename -uid "D4604E6A-4C4F-B965-5F8E-23A5746884DC";
createNode multMatrix -n "r_feather_1_4_mainAxes_multMat";
	rename -uid "7C33EF2A-47C9-1E4A-3A37-DAB7E4AD20D1";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_1_4_mainAxes_pickMatrix";
	rename -uid "D0EE3B62-45A6-8AAB-267D-6B829485AA45";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_1_4_mainAxes_inverseMatrix";
	rename -uid "1DAE596C-4540-8041-2779-CF9ACD18B7A8";
createNode multMatrix -n "r_feather_1_4_mainGroup_multMat";
	rename -uid "E883DAC2-4F09-D191-9B83-549C41475A20";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_1_4_outJoint_multMat";
	rename -uid "1AE48713-436A-5B8C-9DA3-64947E738F86";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_4_outJoint_decMat";
	rename -uid "2CEEFC81-445E-5B93-C20B-EEB1EA8968FD";
createNode multMatrix -n "r_feather_1_5_mainAxes_multMat";
	rename -uid "777A9103-440D-A274-A954-1EB5FB9C00C8";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_1_5_mainAxes_pickMatrix";
	rename -uid "70BC2A99-4C4E-FDE2-9FAE-11BB91CA39B7";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_1_5_mainAxes_inverseMatrix";
	rename -uid "4C007104-46C0-57CB-EA23-C795124C8F56";
createNode multMatrix -n "r_feather_1_5_mainGroup_multMat";
	rename -uid "87D9C3D0-47DB-0269-7FD2-59A29D035A7A";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_1_5_outJoint_multMat";
	rename -uid "C3F7A08D-40DB-3D7D-8D4B-FA9D22040754";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_1_5_outJoint_decMat";
	rename -uid "69097993-49CC-46B8-3BCF-B9AEDCB9C326";
createNode objectSet -n "r_feather_1_moduleControlSet";
	rename -uid "48803F2B-4626-B767-6436-FA9110258145";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_2_1_group_multMat";
	rename -uid "F0E09FEE-439E-EBF3-57FF-7F95BEBC321E";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_2_1_outJoint_multMat";
	rename -uid "5C2EED08-433D-A647-0F41-B7ABF61717B0";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_2_1_outJoint_decMat";
	rename -uid "BF24E88E-4661-988B-0CFE-DBB9CF86592F";
createNode multMatrix -n "r_feather_2_2_mainAxes_multMat";
	rename -uid "9D80903B-4C5C-263D-16E3-FDB1103F2221";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_2_2_mainAxes_pickMatrix";
	rename -uid "628A97C5-40C5-09C9-A6D8-FDA6A61E959A";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_2_2_mainAxes_inverseMatrix";
	rename -uid "A840E25A-4EBA-7B15-56A1-E29E20641949";
createNode multMatrix -n "r_feather_2_2_mainGroup_multMat";
	rename -uid "2096819B-4389-3FBF-5359-A3AE8E139FA5";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_2_2_outJoint_multMat";
	rename -uid "AA903EEB-47EF-9785-841F-8FAA7D88C6D1";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_2_outJoint_decMat";
	rename -uid "17FFE73B-4578-DBEC-93F0-B28D30B6AE3C";
createNode multMatrix -n "r_feather_2_3_mainAxes_multMat";
	rename -uid "251CE481-47A9-1BEC-5B2F-B19F97F01093";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_2_3_mainAxes_pickMatrix";
	rename -uid "93ED32EF-42DE-35EA-CA1E-1A8D39CEA5C1";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_2_3_mainAxes_inverseMatrix";
	rename -uid "1A1F885A-4C2B-9D02-A7E3-3F83CABCF594";
createNode multMatrix -n "r_feather_2_3_mainGroup_multMat";
	rename -uid "C0C64B2C-4F3D-0392-08A9-92BE31A12809";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_2_3_outJoint_multMat";
	rename -uid "782DD6BF-4578-A8F0-3BD0-17A8D58AC230";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_3_outJoint_decMat";
	rename -uid "CFB11633-4E1A-2C33-91E6-329CEA29CE6C";
createNode multMatrix -n "r_feather_2_4_mainAxes_multMat";
	rename -uid "0EC8FFFD-4D67-C9EB-4011-DF94738A9268";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_2_4_mainAxes_pickMatrix";
	rename -uid "64D54DDE-48F6-0DCA-820D-80A9D3067454";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_2_4_mainAxes_inverseMatrix";
	rename -uid "39A2694A-49B5-511A-EA92-328C37D1AA34";
createNode multMatrix -n "r_feather_2_4_mainGroup_multMat";
	rename -uid "726369BB-402D-A376-7F1B-89B1E53E6877";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_2_4_outJoint_multMat";
	rename -uid "EE23829F-4819-E1C0-DC45-4081467D683D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_4_outJoint_decMat";
	rename -uid "2A04A128-485D-89A0-B6D0-C0BABE2B39BE";
createNode multMatrix -n "r_feather_2_5_mainAxes_multMat";
	rename -uid "9F18AEC5-43D2-CCCF-8E3E-118DDB4A57AB";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_2_5_mainAxes_pickMatrix";
	rename -uid "D62CF1F3-4387-C5AB-BCC0-7783AE375E2C";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_2_5_mainAxes_inverseMatrix";
	rename -uid "FD92E012-49E8-B33D-EC2C-919E30A7D05A";
createNode multMatrix -n "r_feather_2_5_mainGroup_multMat";
	rename -uid "46FE744E-4459-D8FD-E78B-16BFDAACFCB5";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_2_5_outJoint_multMat";
	rename -uid "CB870D56-4755-DD62-9425-A6A187CBCB78";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_2_5_outJoint_decMat";
	rename -uid "CA257AC8-4117-3671-9285-C8A88AEB58C8";
createNode objectSet -n "r_feather_2_moduleControlSet";
	rename -uid "C5463360-4939-9EEC-975E-24A471F415B2";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_3_1_group_multMat";
	rename -uid "492E5573-444C-CD95-58AC-28A615B6D44B";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_3_1_outJoint_multMat";
	rename -uid "5F2B05C2-4B2A-4BCB-9A81-29AD04303F0B";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_3_1_outJoint_decMat";
	rename -uid "3F2EF69E-4EE6-475D-9259-95BADE3C7BBA";
createNode multMatrix -n "r_feather_3_2_mainAxes_multMat";
	rename -uid "339A8915-450D-D399-C082-32A307FFE241";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_3_2_mainAxes_pickMatrix";
	rename -uid "0123EE11-410F-CF9F-3A0C-D7839736DD93";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_3_2_mainAxes_inverseMatrix";
	rename -uid "BCA919B5-400A-18B6-FEF6-3EB61CD5CFD3";
createNode multMatrix -n "r_feather_3_2_mainGroup_multMat";
	rename -uid "14557B74-4032-6026-A20D-53B36F8ED3BE";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_3_2_outJoint_multMat";
	rename -uid "E692F5B1-409B-3A0B-FAA8-4D83865FD14D";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_2_outJoint_decMat";
	rename -uid "EC2B60E1-4CD8-A505-FECA-85B1A516F957";
createNode multMatrix -n "r_feather_3_3_mainAxes_multMat";
	rename -uid "FA09AE68-4024-2198-915A-0C9ACEADB029";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_3_3_mainAxes_pickMatrix";
	rename -uid "0552CEBB-453D-3EDC-2FF6-E6B9904539E4";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_3_3_mainAxes_inverseMatrix";
	rename -uid "DFA81C36-4E84-1298-594B-24A738266346";
createNode multMatrix -n "r_feather_3_3_mainGroup_multMat";
	rename -uid "B468FB91-4542-C57E-1E06-45B635D03B3A";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_3_3_outJoint_multMat";
	rename -uid "03FFA9FD-4B8B-B837-8328-8090E0313745";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_3_outJoint_decMat";
	rename -uid "9B419646-4E6D-4E63-9ACC-DC90C428CCBE";
createNode multMatrix -n "r_feather_3_4_mainAxes_multMat";
	rename -uid "01F98AD2-41C4-3DCF-ABA7-3881C9A5FE40";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_3_4_mainAxes_pickMatrix";
	rename -uid "5D70ED6D-414F-F17C-2415-FDB96F60AFB4";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_3_4_mainAxes_inverseMatrix";
	rename -uid "BB7B702F-4838-B6EC-E5C8-DEA45D90DA10";
createNode multMatrix -n "r_feather_3_4_mainGroup_multMat";
	rename -uid "ADB3190C-4DEE-EB06-F244-0EB8589691DE";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_3_4_outJoint_multMat";
	rename -uid "B133466C-4D4B-8215-6266-109591356706";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_4_outJoint_decMat";
	rename -uid "543CF4B8-44F2-2004-4CC6-D9A68AF18C30";
createNode multMatrix -n "r_feather_3_5_mainAxes_multMat";
	rename -uid "B8E6DBAB-45EB-4AA1-6CD9-DDBE8CB6B162";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_3_5_mainAxes_pickMatrix";
	rename -uid "C4D99E75-45E0-1D04-249F-2998BF5DCCE0";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_3_5_mainAxes_inverseMatrix";
	rename -uid "6A4D4434-4E1B-9672-5C8E-2C8D2B8B5F44";
createNode multMatrix -n "r_feather_3_5_mainGroup_multMat";
	rename -uid "0504E40E-450B-822A-55AF-48B34F3EDEDD";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_3_5_outJoint_multMat";
	rename -uid "3BD1E9B0-4D69-7FB5-4A1A-F8BE2D011030";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_3_5_outJoint_decMat";
	rename -uid "A8F0DB0C-4778-D8D4-0FE9-D1AB0B701042";
createNode objectSet -n "r_feather_3_moduleControlSet";
	rename -uid "5402B3DD-47ED-D216-ECA4-588CC0F8A2D8";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_4_1_group_multMat";
	rename -uid "949D08AB-4F82-E963-D7A3-DD96314CC15F";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_4_1_outJoint_multMat";
	rename -uid "4DE3EED3-4B7E-0FAF-2EF5-B8B88A56D960";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_4_1_outJoint_decMat";
	rename -uid "6A8DC748-4EAC-A582-CF0B-A3B05F881F58";
createNode multMatrix -n "r_feather_4_2_mainAxes_multMat";
	rename -uid "5939B7A2-45D7-F03F-3690-2C92763EB8E6";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_4_2_mainAxes_pickMatrix";
	rename -uid "3EBAC7AA-45EE-E593-799D-79BAB37BA1E1";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_4_2_mainAxes_inverseMatrix";
	rename -uid "E64078BA-48E2-F7ED-1457-A8BC120AFCCE";
createNode multMatrix -n "r_feather_4_2_mainGroup_multMat";
	rename -uid "0FC6C383-4ACE-ACED-5ADD-F7B38660528A";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_4_2_outJoint_multMat";
	rename -uid "E03EACE6-41EB-210C-EAA5-93A336CA45DE";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_2_outJoint_decMat";
	rename -uid "5D10B8C6-4DFA-5AFD-5C4E-EAA6BBAD86AE";
createNode multMatrix -n "r_feather_4_3_mainAxes_multMat";
	rename -uid "B200D187-4524-9686-A672-A9A226494D9B";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_4_3_mainAxes_pickMatrix";
	rename -uid "A1918DC4-4702-C481-D61C-C79FDEBD2E0B";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_4_3_mainAxes_inverseMatrix";
	rename -uid "14B636B7-4D17-B6A2-0999-8D8D31099F36";
createNode multMatrix -n "r_feather_4_3_mainGroup_multMat";
	rename -uid "97F32A79-40C2-F18C-B4C5-B09AE3E75B37";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_4_3_outJoint_multMat";
	rename -uid "9F29986E-4886-49ED-6E42-BC95F8DA8DB3";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_3_outJoint_decMat";
	rename -uid "BC420E40-4823-9A04-6AD6-3EB5A0D3F480";
createNode multMatrix -n "r_feather_4_4_mainAxes_multMat";
	rename -uid "31D2BDE2-4072-1326-8F53-A4B8E22CDAE5";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_4_4_mainAxes_pickMatrix";
	rename -uid "59D1D579-4681-9C1C-2A78-BD97A20D2B04";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_4_4_mainAxes_inverseMatrix";
	rename -uid "B9D00F08-4A9F-5C81-9523-C2A8A4201415";
createNode multMatrix -n "r_feather_4_4_mainGroup_multMat";
	rename -uid "715D855C-41F8-DA37-7286-5298BE402A09";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_4_4_outJoint_multMat";
	rename -uid "1E69AFC4-430B-5824-4887-BBA8C8AF9B20";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_4_outJoint_decMat";
	rename -uid "3F1C9CF8-4640-2F12-D2D5-57A67750353C";
createNode multMatrix -n "r_feather_4_5_mainAxes_multMat";
	rename -uid "03A5D972-4C71-635F-DD59-E885DBE694D0";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_4_5_mainAxes_pickMatrix";
	rename -uid "8FFEF95C-44AA-A696-D79C-08814AD8B45C";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_4_5_mainAxes_inverseMatrix";
	rename -uid "BA18AD85-4567-A123-BFDC-87AE0D18AEE2";
createNode multMatrix -n "r_feather_4_5_mainGroup_multMat";
	rename -uid "68A36180-4EEE-2639-C4AE-E6BB771F3EBB";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_4_5_outJoint_multMat";
	rename -uid "3C6CDEC0-482A-B8C2-E268-568D7C8444FD";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_4_5_outJoint_decMat";
	rename -uid "38236E1A-4911-990C-4BE7-82BA8E5A925D";
createNode objectSet -n "r_feather_4_moduleControlSet";
	rename -uid "9CC12290-478D-95CB-332B-F39B58ACA6DA";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "r_feather_5_1_group_multMat";
	rename -uid "3F6ECA21-42C5-B7D9-928A-18BC10392E98";
	setAttr -s 2 ".i";
createNode multMatrix -n "r_feather_5_1_outJoint_multMat";
	rename -uid "5FB95F45-48DF-AB9F-13CC-1EB14DB5F7F5";
	setAttr -s 5 ".i";
createNode decomposeMatrix -n "r_feather_5_1_outJoint_decMat";
	rename -uid "EE647CDD-4EBC-1926-646E-F38126AF0BEB";
createNode multMatrix -n "r_feather_5_2_mainAxes_multMat";
	rename -uid "E6F783FB-49B0-9F7A-9F1D-9F981F95481E";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_5_2_mainAxes_pickMatrix";
	rename -uid "F60C3426-482D-1F2E-1B7E-95BB7BD3C9AD";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_5_2_mainAxes_inverseMatrix";
	rename -uid "0EBF567F-497E-F590-F64F-B788BE68270C";
createNode multMatrix -n "r_feather_5_2_mainGroup_multMat";
	rename -uid "E9201699-40FD-881F-D015-2C90C852B4FA";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_5_2_outJoint_multMat";
	rename -uid "74001953-4EF8-3608-8B98-7C94B613A97A";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_2_outJoint_decMat";
	rename -uid "E4840919-4F9E-3C05-5F11-E7B42B54A327";
createNode multMatrix -n "r_feather_5_3_mainAxes_multMat";
	rename -uid "4D2BA00C-4C60-D56B-0764-619AB59285BB";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_5_3_mainAxes_pickMatrix";
	rename -uid "E3D098A1-479A-CFE4-1057-DEA80544CBE8";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_5_3_mainAxes_inverseMatrix";
	rename -uid "DAA6F6FE-4C23-F217-7C71-65B129F421C1";
createNode multMatrix -n "r_feather_5_3_mainGroup_multMat";
	rename -uid "D0C396DF-4B13-CC80-06B6-22887E4788C2";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_5_3_outJoint_multMat";
	rename -uid "455C2C20-440E-95B6-0B19-398ECB165284";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_3_outJoint_decMat";
	rename -uid "414EA27E-475B-F369-4198-55BF08974FF2";
createNode multMatrix -n "r_feather_5_4_mainAxes_multMat";
	rename -uid "70A33300-4A12-EF10-7F2F-50B479B80671";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_5_4_mainAxes_pickMatrix";
	rename -uid "2297B592-4A15-968B-3DBB-9BB45A8CA1B3";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_5_4_mainAxes_inverseMatrix";
	rename -uid "10CC7AAF-4855-EB99-261B-9698C0F51A3E";
createNode multMatrix -n "r_feather_5_4_mainGroup_multMat";
	rename -uid "7DEBA764-4F05-CAFF-517C-6C9D7470BAEE";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_5_4_outJoint_multMat";
	rename -uid "32615C03-4CFB-CFB7-BADB-4F87D4823D32";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_4_outJoint_decMat";
	rename -uid "1F9448C6-4AA3-A663-3F7C-7DAE4410F4EF";
createNode multMatrix -n "r_feather_5_5_mainAxes_multMat";
	rename -uid "9B9D332A-4C59-A695-CD5C-628F53F4A144";
	setAttr -s 2 ".i";
createNode pickMatrix -n "r_feather_5_5_mainAxes_pickMatrix";
	rename -uid "36082A78-4671-7000-B6AC-41BEB31F58A2";
	setAttr ".tra" no;
createNode inverseMatrix -n "r_feather_5_5_mainAxes_inverseMatrix";
	rename -uid "60760823-40FB-ECA0-E8E8-749F00607F5F";
createNode multMatrix -n "r_feather_5_5_mainGroup_multMat";
	rename -uid "F3EBF23A-4829-547F-5A4B-F2B7D5528A43";
	setAttr -s 3 ".i";
createNode multMatrix -n "r_feather_5_5_outJoint_multMat";
	rename -uid "0DFC3DE3-4DBF-06F6-6D78-D4A25821DE08";
	setAttr -s 6 ".i";
createNode decomposeMatrix -n "r_feather_5_5_outJoint_decMat";
	rename -uid "8848FFA9-41FF-148C-3596-8CA3771F3DF7";
createNode objectSet -n "r_feather_5_moduleControlSet";
	rename -uid "1FFC01FE-41B4-D742-F532-AEB3BB8EF752";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
createNode multMatrix -n "main_1_group_multMat";
	rename -uid "9F880496-4E7B-8216-E3E8-CE8F39CCA760";
	setAttr -s 5 ".i";
createNode multMatrix -n "main_2_group_multMat";
	rename -uid "797D05A8-4229-08FD-A0C8-C8AFFB1BAB75";
	setAttr -s 8 ".i";
createNode multMatrix -n "main_3_group_multMat";
	rename -uid "74AA6A8C-484D-4743-90F3-0DB96483237A";
	setAttr -s 11 ".i";
createNode multMatrix -n "main_4_group_multMat";
	rename -uid "0AD8135A-4DDF-34CB-57E2-1D8FE34F27A0";
	setAttr -s 14 ".i";
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
connectAttr "r_feather_4_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_2_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_4_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "m_feather_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_3_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "m_feather_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_2_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_1_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_1_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "main_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "lines_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "m_feather_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_1_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_1_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_5_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_5_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "main_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_5_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_1_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_2_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_5_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "m_feather_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "lines_sweepMeshCreator.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_4_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_4_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_5_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "m_feather_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_1_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_2_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_4_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_5_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_3_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_4_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_3_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_2_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_5_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "m_feather_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "feather_3_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_5_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_1_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_4_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_2_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_4_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_1_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_3_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_5_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_3_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_3_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "m_feather_cluster4Set.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_1_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_5_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_mainPoser_clusterHandleCluster.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_end_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_3_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_4_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_4_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_4_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_5_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_1_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_end_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_5_4_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "main_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_cluster4GroupParts.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_5_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_3_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_1_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_tweak24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_1_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_3_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_2_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_5_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_end_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_5_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "m_feather_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_1_mainPoser_size_multiplyDivide.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_3_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_3_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_end_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_4_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_2_5_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "feather_4_rotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_4_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_4_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_3_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_2_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "feather_5_rootRotation.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_5_3_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "r_feather_5_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_5_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_5_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_5_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_3_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_end_size_multDoubleLinear.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "r_feather_4_4_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_3_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_5_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "main_2_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_3_5_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "l_feather_1_2_mainAxes_pickMatrix.msg" "generated_nodesSet.dnsm" -na
		;
connectAttr "l_feather_2_tweakSet24.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_2_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_1_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_3_1_fanLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_1_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_groupId42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_1_cluster4GroupId.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_5_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_4_group_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_4_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_1_4_mainGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_2_2_size_multDoubleLinear.msg" "generated_nodesSet.dnsm" 
		-na;
connectAttr "r_feather_2_2_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_1_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_outJoint_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_1_5_initLoc_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_moduleControlSet.msg" "generated_nodesSet.dnsm" -na;
connectAttr "m_feather_5_mainAxes_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_2_rollGroup_multMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_2_makeNurbSphere.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_2_2_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_4_3_mainAxes_inverseMatrix.msg" "generated_nodesSet.dnsm"
		 -na;
connectAttr "l_feather_4_groupParts42.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_3_5_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "r_feather_4_3_outJoint_decMat.msg" "generated_nodesSet.dnsm" -na;
connectAttr "l_feather_5_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_1_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_1_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape5.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_6.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "m_feather_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "m_feather_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_1_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_2_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_3_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "posers_curve_5_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_2_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_1_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_5_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_2_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_3_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "r_feather_5_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_2_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "posers_curve_6_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "lines_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_1_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_5_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_2_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_5_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "r_feather_3_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_3_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_4_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoser_clusterHandleShape.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "m_feather_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape6.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_2_sweepMesh.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_4_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_4_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "m_feather_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_1_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "main_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_6_sweepMeshShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "m_feather_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "main_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_Shape1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_4_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "r_feather_4_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_3_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_mainPoser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_4_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_3_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_5_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_4Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_end_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_4_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_2Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_5_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_5_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_end_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_end_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_1_1_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_mainPoser_clusterHandle.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_1_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_5_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_4_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_spreadRootGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_2_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_5Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "main_1Shape.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserOrient_orientConstraint1.iog" "generated_nodesSet.dsm" 
		-na;
connectAttr "l_feather_3_3_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_end_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_2_fanLoc_aimConstraint1.iog" "generated_nodesSet.dsm" -na
		;
connectAttr "l_feather_5_1_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_1_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_2_end_fanLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_3_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_1_spreadGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "posers_curve_4.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_4_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_3_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_2_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_4_group.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_1_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_1.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_3_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_end_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_mainPoserShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_5_1_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_5_mainPoserShapeOrig.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_5_mainGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_3_3_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_2_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_4_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_1_4_initLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_2.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_1_poserOrient.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poser.iog" "generated_nodesSet.dsm" -na;
connectAttr "main_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_bendGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_2_poserNurbsShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_4_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_4_2_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_1_5_fanLocShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_1_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_3_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_3_3_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "r_feather_4_4_initLoc.iog" "generated_nodesSet.dsm" -na;
connectAttr "m_feather_end_poserOrientShape.iog" "generated_nodesSet.dsm" -na;
connectAttr "r_feather_2_3_outJoint.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_2_4_rollGroup.iog" "generated_nodesSet.dsm" -na;
connectAttr "l_feather_4_5_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
connectAttr "l_feather_5_end_poserOrient_aimConstraint1.iog" "generated_nodesSet.dsm"
		 -na;
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
connectAttr "m_feather_2_bendGroup.wm" "m_feather_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "m_feather_2_mainAxes_multMat.i[1]";
connectAttr "m_feather_2_mainAxes_multMat.o" "m_feather_2_mainAxes_pickMatrix.imat"
		;
connectAttr "m_feather_2_mainAxes_pickMatrix.tmat" "m_feather_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "m_feather_2_mainAxes_pickMatrix.tmat" "m_feather_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "m_feather_2_mainGroup_multMat.i[1]";
connectAttr "m_feather_2_mainAxes_inverseMatrix.omat" "m_feather_2_mainGroup_multMat.i[2]"
		;
connectAttr "m_feather_2.m" "m_feather_2_outJoint_multMat.i[0]";
connectAttr "m_feather_2_mainGroup.opm" "m_feather_2_outJoint_multMat.i[1]";
connectAttr "m_feather_2_bendGroup.m" "m_feather_2_outJoint_multMat.i[2]";
connectAttr "m_feather_2_group.opm" "m_feather_2_outJoint_multMat.i[3]";
connectAttr "m_feather_2_outJoint_multMat.o" "m_feather_2_outJoint_decMat.imat";
connectAttr "m_feather_3_initLoc.wm" "m_feather_3_group_multMat.i[0]";
connectAttr "m_feather_2_initLoc.wim" "m_feather_3_group_multMat.i[1]";
connectAttr "m_feather_3_bendGroup.wm" "m_feather_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "m_feather_3_mainAxes_multMat.i[1]";
connectAttr "m_feather_3_mainAxes_multMat.o" "m_feather_3_mainAxes_pickMatrix.imat"
		;
connectAttr "m_feather_3_mainAxes_pickMatrix.tmat" "m_feather_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "m_feather_3_mainAxes_pickMatrix.tmat" "m_feather_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "m_feather_3_mainGroup_multMat.i[1]";
connectAttr "m_feather_3_mainAxes_inverseMatrix.omat" "m_feather_3_mainGroup_multMat.i[2]"
		;
connectAttr "m_feather_3.m" "m_feather_3_outJoint_multMat.i[0]";
connectAttr "m_feather_3_mainGroup.opm" "m_feather_3_outJoint_multMat.i[1]";
connectAttr "m_feather_3_bendGroup.m" "m_feather_3_outJoint_multMat.i[2]";
connectAttr "m_feather_3_group.opm" "m_feather_3_outJoint_multMat.i[3]";
connectAttr "m_feather_3_outJoint_multMat.o" "m_feather_3_outJoint_decMat.imat";
connectAttr "m_feather_4_initLoc.wm" "m_feather_4_group_multMat.i[0]";
connectAttr "m_feather_3_initLoc.wim" "m_feather_4_group_multMat.i[1]";
connectAttr "m_feather_4_bendGroup.wm" "m_feather_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "m_feather_4_mainAxes_multMat.i[1]";
connectAttr "m_feather_4_mainAxes_multMat.o" "m_feather_4_mainAxes_pickMatrix.imat"
		;
connectAttr "m_feather_4_mainAxes_pickMatrix.tmat" "m_feather_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "m_feather_4_mainAxes_pickMatrix.tmat" "m_feather_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "m_feather_4_mainGroup_multMat.i[1]";
connectAttr "m_feather_4_mainAxes_inverseMatrix.omat" "m_feather_4_mainGroup_multMat.i[2]"
		;
connectAttr "m_feather_4.m" "m_feather_4_outJoint_multMat.i[0]";
connectAttr "m_feather_4_mainGroup.opm" "m_feather_4_outJoint_multMat.i[1]";
connectAttr "m_feather_4_bendGroup.m" "m_feather_4_outJoint_multMat.i[2]";
connectAttr "m_feather_4_group.opm" "m_feather_4_outJoint_multMat.i[3]";
connectAttr "m_feather_4_outJoint_multMat.o" "m_feather_4_outJoint_decMat.imat";
connectAttr "m_feather_5_initLoc.wm" "m_feather_5_group_multMat.i[0]";
connectAttr "m_feather_4_initLoc.wim" "m_feather_5_group_multMat.i[1]";
connectAttr "m_feather_5_bendGroup.wm" "m_feather_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "m_feather_5_mainAxes_multMat.i[1]";
connectAttr "m_feather_5_mainAxes_multMat.o" "m_feather_5_mainAxes_pickMatrix.imat"
		;
connectAttr "m_feather_5_mainAxes_pickMatrix.tmat" "m_feather_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "m_feather_5_mainAxes_pickMatrix.tmat" "m_feather_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "m_feather_5_mainGroup_multMat.i[1]";
connectAttr "m_feather_5_mainAxes_inverseMatrix.omat" "m_feather_5_mainGroup_multMat.i[2]"
		;
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
connectAttr "l_feather_1_2_bendGroup.wm" "l_feather_1_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_1_2_mainAxes_multMat.i[1]";
connectAttr "l_feather_1_2_mainAxes_multMat.o" "l_feather_1_2_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_1_2_mainAxes_pickMatrix.tmat" "l_feather_1_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_1_2_mainAxes_pickMatrix.tmat" "l_feather_1_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "l_feather_1_2_mainGroup_multMat.i[1]";
connectAttr "l_feather_1_2_mainAxes_inverseMatrix.omat" "l_feather_1_2_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_1_3_bendGroup.wm" "l_feather_1_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_1_3_mainAxes_multMat.i[1]";
connectAttr "l_feather_1_3_mainAxes_multMat.o" "l_feather_1_3_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_1_3_mainAxes_pickMatrix.tmat" "l_feather_1_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_1_3_mainAxes_pickMatrix.tmat" "l_feather_1_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "l_feather_1_3_mainGroup_multMat.i[1]";
connectAttr "l_feather_1_3_mainAxes_inverseMatrix.omat" "l_feather_1_3_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_1_4_bendGroup.wm" "l_feather_1_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_1_4_mainAxes_multMat.i[1]";
connectAttr "l_feather_1_4_mainAxes_multMat.o" "l_feather_1_4_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_1_4_mainAxes_pickMatrix.tmat" "l_feather_1_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_1_4_mainAxes_pickMatrix.tmat" "l_feather_1_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "l_feather_1_4_mainGroup_multMat.i[1]";
connectAttr "l_feather_1_4_mainAxes_inverseMatrix.omat" "l_feather_1_4_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_1_5_bendGroup.wm" "l_feather_1_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_1_5_mainAxes_multMat.i[1]";
connectAttr "l_feather_1_5_mainAxes_multMat.o" "l_feather_1_5_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_1_5_mainAxes_pickMatrix.tmat" "l_feather_1_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_1_5_mainAxes_pickMatrix.tmat" "l_feather_1_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "l_feather_1_5_mainGroup_multMat.i[1]";
connectAttr "l_feather_1_5_mainAxes_inverseMatrix.omat" "l_feather_1_5_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_2_2_bendGroup.wm" "l_feather_2_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_2_2_mainAxes_multMat.i[1]";
connectAttr "l_feather_2_2_mainAxes_multMat.o" "l_feather_2_2_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_2_2_mainAxes_pickMatrix.tmat" "l_feather_2_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_2_2_mainAxes_pickMatrix.tmat" "l_feather_2_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "l_feather_2_2_mainGroup_multMat.i[1]";
connectAttr "l_feather_2_2_mainAxes_inverseMatrix.omat" "l_feather_2_2_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_2_3_bendGroup.wm" "l_feather_2_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_2_3_mainAxes_multMat.i[1]";
connectAttr "l_feather_2_3_mainAxes_multMat.o" "l_feather_2_3_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_2_3_mainAxes_pickMatrix.tmat" "l_feather_2_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_2_3_mainAxes_pickMatrix.tmat" "l_feather_2_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "l_feather_2_3_mainGroup_multMat.i[1]";
connectAttr "l_feather_2_3_mainAxes_inverseMatrix.omat" "l_feather_2_3_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_2_4_bendGroup.wm" "l_feather_2_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_2_4_mainAxes_multMat.i[1]";
connectAttr "l_feather_2_4_mainAxes_multMat.o" "l_feather_2_4_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_2_4_mainAxes_pickMatrix.tmat" "l_feather_2_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_2_4_mainAxes_pickMatrix.tmat" "l_feather_2_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "l_feather_2_4_mainGroup_multMat.i[1]";
connectAttr "l_feather_2_4_mainAxes_inverseMatrix.omat" "l_feather_2_4_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_2_5_bendGroup.wm" "l_feather_2_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_2_5_mainAxes_multMat.i[1]";
connectAttr "l_feather_2_5_mainAxes_multMat.o" "l_feather_2_5_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_2_5_mainAxes_pickMatrix.tmat" "l_feather_2_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_2_5_mainAxes_pickMatrix.tmat" "l_feather_2_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "l_feather_2_5_mainGroup_multMat.i[1]";
connectAttr "l_feather_2_5_mainAxes_inverseMatrix.omat" "l_feather_2_5_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_3_2_bendGroup.wm" "l_feather_3_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_3_2_mainAxes_multMat.i[1]";
connectAttr "l_feather_3_2_mainAxes_multMat.o" "l_feather_3_2_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_3_2_mainAxes_pickMatrix.tmat" "l_feather_3_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_3_2_mainAxes_pickMatrix.tmat" "l_feather_3_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "l_feather_3_2_mainGroup_multMat.i[1]";
connectAttr "l_feather_3_2_mainAxes_inverseMatrix.omat" "l_feather_3_2_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_3_3_bendGroup.wm" "l_feather_3_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_3_3_mainAxes_multMat.i[1]";
connectAttr "l_feather_3_3_mainAxes_multMat.o" "l_feather_3_3_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_3_3_mainAxes_pickMatrix.tmat" "l_feather_3_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_3_3_mainAxes_pickMatrix.tmat" "l_feather_3_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "l_feather_3_3_mainGroup_multMat.i[1]";
connectAttr "l_feather_3_3_mainAxes_inverseMatrix.omat" "l_feather_3_3_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_3_4_bendGroup.wm" "l_feather_3_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_3_4_mainAxes_multMat.i[1]";
connectAttr "l_feather_3_4_mainAxes_multMat.o" "l_feather_3_4_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_3_4_mainAxes_pickMatrix.tmat" "l_feather_3_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_3_4_mainAxes_pickMatrix.tmat" "l_feather_3_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "l_feather_3_4_mainGroup_multMat.i[1]";
connectAttr "l_feather_3_4_mainAxes_inverseMatrix.omat" "l_feather_3_4_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_3_5_bendGroup.wm" "l_feather_3_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_3_5_mainAxes_multMat.i[1]";
connectAttr "l_feather_3_5_mainAxes_multMat.o" "l_feather_3_5_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_3_5_mainAxes_pickMatrix.tmat" "l_feather_3_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_3_5_mainAxes_pickMatrix.tmat" "l_feather_3_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "l_feather_3_5_mainGroup_multMat.i[1]";
connectAttr "l_feather_3_5_mainAxes_inverseMatrix.omat" "l_feather_3_5_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_4_2_bendGroup.wm" "l_feather_4_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_4_2_mainAxes_multMat.i[1]";
connectAttr "l_feather_4_2_mainAxes_multMat.o" "l_feather_4_2_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_4_2_mainAxes_pickMatrix.tmat" "l_feather_4_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_4_2_mainAxes_pickMatrix.tmat" "l_feather_4_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "l_feather_4_2_mainGroup_multMat.i[1]";
connectAttr "l_feather_4_2_mainAxes_inverseMatrix.omat" "l_feather_4_2_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_4_3_bendGroup.wm" "l_feather_4_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_4_3_mainAxes_multMat.i[1]";
connectAttr "l_feather_4_3_mainAxes_multMat.o" "l_feather_4_3_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_4_3_mainAxes_pickMatrix.tmat" "l_feather_4_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_4_3_mainAxes_pickMatrix.tmat" "l_feather_4_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "l_feather_4_3_mainGroup_multMat.i[1]";
connectAttr "l_feather_4_3_mainAxes_inverseMatrix.omat" "l_feather_4_3_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_4_4_bendGroup.wm" "l_feather_4_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_4_4_mainAxes_multMat.i[1]";
connectAttr "l_feather_4_4_mainAxes_multMat.o" "l_feather_4_4_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_4_4_mainAxes_pickMatrix.tmat" "l_feather_4_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_4_4_mainAxes_pickMatrix.tmat" "l_feather_4_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "l_feather_4_4_mainGroup_multMat.i[1]";
connectAttr "l_feather_4_4_mainAxes_inverseMatrix.omat" "l_feather_4_4_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_4_5_bendGroup.wm" "l_feather_4_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_4_5_mainAxes_multMat.i[1]";
connectAttr "l_feather_4_5_mainAxes_multMat.o" "l_feather_4_5_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_4_5_mainAxes_pickMatrix.tmat" "l_feather_4_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_4_5_mainAxes_pickMatrix.tmat" "l_feather_4_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "l_feather_4_5_mainGroup_multMat.i[1]";
connectAttr "l_feather_4_5_mainAxes_inverseMatrix.omat" "l_feather_4_5_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_5_2_bendGroup.wm" "l_feather_5_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "l_feather_5_2_mainAxes_multMat.i[1]";
connectAttr "l_feather_5_2_mainAxes_multMat.o" "l_feather_5_2_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_5_2_mainAxes_pickMatrix.tmat" "l_feather_5_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_5_2_mainAxes_pickMatrix.tmat" "l_feather_5_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "l_feather_5_2_mainGroup_multMat.i[1]";
connectAttr "l_feather_5_2_mainAxes_inverseMatrix.omat" "l_feather_5_2_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_5_3_bendGroup.wm" "l_feather_5_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "l_feather_5_3_mainAxes_multMat.i[1]";
connectAttr "l_feather_5_3_mainAxes_multMat.o" "l_feather_5_3_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_5_3_mainAxes_pickMatrix.tmat" "l_feather_5_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_5_3_mainAxes_pickMatrix.tmat" "l_feather_5_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "l_feather_5_3_mainGroup_multMat.i[1]";
connectAttr "l_feather_5_3_mainAxes_inverseMatrix.omat" "l_feather_5_3_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_5_4_bendGroup.wm" "l_feather_5_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "l_feather_5_4_mainAxes_multMat.i[1]";
connectAttr "l_feather_5_4_mainAxes_multMat.o" "l_feather_5_4_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_5_4_mainAxes_pickMatrix.tmat" "l_feather_5_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_5_4_mainAxes_pickMatrix.tmat" "l_feather_5_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "l_feather_5_4_mainGroup_multMat.i[1]";
connectAttr "l_feather_5_4_mainAxes_inverseMatrix.omat" "l_feather_5_4_mainGroup_multMat.i[2]"
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
connectAttr "l_feather_5_5_bendGroup.wm" "l_feather_5_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "l_feather_5_5_mainAxes_multMat.i[1]";
connectAttr "l_feather_5_5_mainAxes_multMat.o" "l_feather_5_5_mainAxes_pickMatrix.imat"
		;
connectAttr "l_feather_5_5_mainAxes_pickMatrix.tmat" "l_feather_5_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "l_feather_5_5_mainAxes_pickMatrix.tmat" "l_feather_5_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "l_feather_5_5_mainGroup_multMat.i[1]";
connectAttr "l_feather_5_5_mainAxes_inverseMatrix.omat" "l_feather_5_5_mainGroup_multMat.i[2]"
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
connectAttr "r_feather_1_2_bendGroup.wm" "r_feather_1_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_1_2_mainAxes_multMat.i[1]";
connectAttr "r_feather_1_2_mainAxes_multMat.o" "r_feather_1_2_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_1_2_mainAxes_pickMatrix.tmat" "r_feather_1_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_1_2_mainAxes_pickMatrix.tmat" "r_feather_1_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "r_feather_1_2_mainGroup_multMat.i[1]";
connectAttr "r_feather_1_2_mainAxes_inverseMatrix.omat" "r_feather_1_2_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_1_2.m" "r_feather_1_2_outJoint_multMat.i[0]";
connectAttr "r_feather_1_2_rollGroup.opm" "r_feather_1_2_outJoint_multMat.i[1]";
connectAttr "r_feather_1_2_mainGroup.opm" "r_feather_1_2_outJoint_multMat.i[2]";
connectAttr "r_feather_1_2_bendGroup.m" "r_feather_1_2_outJoint_multMat.i[3]";
connectAttr "r_feather_1_2_spreadGroup.m" "r_feather_1_2_outJoint_multMat.i[4]";
connectAttr "r_feather_1_2_group.opm" "r_feather_1_2_outJoint_multMat.i[5]";
connectAttr "r_feather_1_2_outJoint_multMat.o" "r_feather_1_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_3_bendGroup.wm" "r_feather_1_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_1_3_mainAxes_multMat.i[1]";
connectAttr "r_feather_1_3_mainAxes_multMat.o" "r_feather_1_3_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_1_3_mainAxes_pickMatrix.tmat" "r_feather_1_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_1_3_mainAxes_pickMatrix.tmat" "r_feather_1_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "r_feather_1_3_mainGroup_multMat.i[1]";
connectAttr "r_feather_1_3_mainAxes_inverseMatrix.omat" "r_feather_1_3_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_1_3.m" "r_feather_1_3_outJoint_multMat.i[0]";
connectAttr "r_feather_1_3_rollGroup.opm" "r_feather_1_3_outJoint_multMat.i[1]";
connectAttr "r_feather_1_3_mainGroup.opm" "r_feather_1_3_outJoint_multMat.i[2]";
connectAttr "r_feather_1_3_bendGroup.m" "r_feather_1_3_outJoint_multMat.i[3]";
connectAttr "r_feather_1_3_spreadGroup.m" "r_feather_1_3_outJoint_multMat.i[4]";
connectAttr "r_feather_1_3_group.opm" "r_feather_1_3_outJoint_multMat.i[5]";
connectAttr "r_feather_1_3_outJoint_multMat.o" "r_feather_1_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_4_bendGroup.wm" "r_feather_1_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_1_4_mainAxes_multMat.i[1]";
connectAttr "r_feather_1_4_mainAxes_multMat.o" "r_feather_1_4_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_1_4_mainAxes_pickMatrix.tmat" "r_feather_1_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_1_4_mainAxes_pickMatrix.tmat" "r_feather_1_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "r_feather_1_4_mainGroup_multMat.i[1]";
connectAttr "r_feather_1_4_mainAxes_inverseMatrix.omat" "r_feather_1_4_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_1_4.m" "r_feather_1_4_outJoint_multMat.i[0]";
connectAttr "r_feather_1_4_rollGroup.opm" "r_feather_1_4_outJoint_multMat.i[1]";
connectAttr "r_feather_1_4_mainGroup.opm" "r_feather_1_4_outJoint_multMat.i[2]";
connectAttr "r_feather_1_4_bendGroup.m" "r_feather_1_4_outJoint_multMat.i[3]";
connectAttr "r_feather_1_4_spreadGroup.m" "r_feather_1_4_outJoint_multMat.i[4]";
connectAttr "r_feather_1_4_group.opm" "r_feather_1_4_outJoint_multMat.i[5]";
connectAttr "r_feather_1_4_outJoint_multMat.o" "r_feather_1_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_1_5_bendGroup.wm" "r_feather_1_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_1_5_mainAxes_multMat.i[1]";
connectAttr "r_feather_1_5_mainAxes_multMat.o" "r_feather_1_5_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_1_5_mainAxes_pickMatrix.tmat" "r_feather_1_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_1_5_mainAxes_pickMatrix.tmat" "r_feather_1_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "r_feather_1_5_mainGroup_multMat.i[1]";
connectAttr "r_feather_1_5_mainAxes_inverseMatrix.omat" "r_feather_1_5_mainGroup_multMat.i[2]"
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
connectAttr "r_feather_2_2_bendGroup.wm" "r_feather_2_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_2_2_mainAxes_multMat.i[1]";
connectAttr "r_feather_2_2_mainAxes_multMat.o" "r_feather_2_2_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_2_2_mainAxes_pickMatrix.tmat" "r_feather_2_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_2_2_mainAxes_pickMatrix.tmat" "r_feather_2_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "r_feather_2_2_mainGroup_multMat.i[1]";
connectAttr "r_feather_2_2_mainAxes_inverseMatrix.omat" "r_feather_2_2_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_2_2.m" "r_feather_2_2_outJoint_multMat.i[0]";
connectAttr "r_feather_2_2_rollGroup.opm" "r_feather_2_2_outJoint_multMat.i[1]";
connectAttr "r_feather_2_2_mainGroup.opm" "r_feather_2_2_outJoint_multMat.i[2]";
connectAttr "r_feather_2_2_bendGroup.m" "r_feather_2_2_outJoint_multMat.i[3]";
connectAttr "r_feather_2_2_spreadGroup.m" "r_feather_2_2_outJoint_multMat.i[4]";
connectAttr "r_feather_2_2_group.opm" "r_feather_2_2_outJoint_multMat.i[5]";
connectAttr "r_feather_2_2_outJoint_multMat.o" "r_feather_2_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_3_bendGroup.wm" "r_feather_2_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_2_3_mainAxes_multMat.i[1]";
connectAttr "r_feather_2_3_mainAxes_multMat.o" "r_feather_2_3_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_2_3_mainAxes_pickMatrix.tmat" "r_feather_2_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_2_3_mainAxes_pickMatrix.tmat" "r_feather_2_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "r_feather_2_3_mainGroup_multMat.i[1]";
connectAttr "r_feather_2_3_mainAxes_inverseMatrix.omat" "r_feather_2_3_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_2_3.m" "r_feather_2_3_outJoint_multMat.i[0]";
connectAttr "r_feather_2_3_rollGroup.opm" "r_feather_2_3_outJoint_multMat.i[1]";
connectAttr "r_feather_2_3_mainGroup.opm" "r_feather_2_3_outJoint_multMat.i[2]";
connectAttr "r_feather_2_3_bendGroup.m" "r_feather_2_3_outJoint_multMat.i[3]";
connectAttr "r_feather_2_3_spreadGroup.m" "r_feather_2_3_outJoint_multMat.i[4]";
connectAttr "r_feather_2_3_group.opm" "r_feather_2_3_outJoint_multMat.i[5]";
connectAttr "r_feather_2_3_outJoint_multMat.o" "r_feather_2_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_4_bendGroup.wm" "r_feather_2_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_2_4_mainAxes_multMat.i[1]";
connectAttr "r_feather_2_4_mainAxes_multMat.o" "r_feather_2_4_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_2_4_mainAxes_pickMatrix.tmat" "r_feather_2_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_2_4_mainAxes_pickMatrix.tmat" "r_feather_2_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "r_feather_2_4_mainGroup_multMat.i[1]";
connectAttr "r_feather_2_4_mainAxes_inverseMatrix.omat" "r_feather_2_4_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_2_4.m" "r_feather_2_4_outJoint_multMat.i[0]";
connectAttr "r_feather_2_4_rollGroup.opm" "r_feather_2_4_outJoint_multMat.i[1]";
connectAttr "r_feather_2_4_mainGroup.opm" "r_feather_2_4_outJoint_multMat.i[2]";
connectAttr "r_feather_2_4_bendGroup.m" "r_feather_2_4_outJoint_multMat.i[3]";
connectAttr "r_feather_2_4_spreadGroup.m" "r_feather_2_4_outJoint_multMat.i[4]";
connectAttr "r_feather_2_4_group.opm" "r_feather_2_4_outJoint_multMat.i[5]";
connectAttr "r_feather_2_4_outJoint_multMat.o" "r_feather_2_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_2_5_bendGroup.wm" "r_feather_2_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_2_5_mainAxes_multMat.i[1]";
connectAttr "r_feather_2_5_mainAxes_multMat.o" "r_feather_2_5_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_2_5_mainAxes_pickMatrix.tmat" "r_feather_2_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_2_5_mainAxes_pickMatrix.tmat" "r_feather_2_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "r_feather_2_5_mainGroup_multMat.i[1]";
connectAttr "r_feather_2_5_mainAxes_inverseMatrix.omat" "r_feather_2_5_mainGroup_multMat.i[2]"
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
connectAttr "r_feather_3_2_bendGroup.wm" "r_feather_3_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_3_2_mainAxes_multMat.i[1]";
connectAttr "r_feather_3_2_mainAxes_multMat.o" "r_feather_3_2_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_3_2_mainAxes_pickMatrix.tmat" "r_feather_3_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_3_2_mainAxes_pickMatrix.tmat" "r_feather_3_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "r_feather_3_2_mainGroup_multMat.i[1]";
connectAttr "r_feather_3_2_mainAxes_inverseMatrix.omat" "r_feather_3_2_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_3_2.m" "r_feather_3_2_outJoint_multMat.i[0]";
connectAttr "r_feather_3_2_rollGroup.opm" "r_feather_3_2_outJoint_multMat.i[1]";
connectAttr "r_feather_3_2_mainGroup.opm" "r_feather_3_2_outJoint_multMat.i[2]";
connectAttr "r_feather_3_2_bendGroup.m" "r_feather_3_2_outJoint_multMat.i[3]";
connectAttr "r_feather_3_2_spreadGroup.m" "r_feather_3_2_outJoint_multMat.i[4]";
connectAttr "r_feather_3_2_group.opm" "r_feather_3_2_outJoint_multMat.i[5]";
connectAttr "r_feather_3_2_outJoint_multMat.o" "r_feather_3_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_3_bendGroup.wm" "r_feather_3_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_3_3_mainAxes_multMat.i[1]";
connectAttr "r_feather_3_3_mainAxes_multMat.o" "r_feather_3_3_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_3_3_mainAxes_pickMatrix.tmat" "r_feather_3_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_3_3_mainAxes_pickMatrix.tmat" "r_feather_3_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "r_feather_3_3_mainGroup_multMat.i[1]";
connectAttr "r_feather_3_3_mainAxes_inverseMatrix.omat" "r_feather_3_3_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_3_3.m" "r_feather_3_3_outJoint_multMat.i[0]";
connectAttr "r_feather_3_3_rollGroup.opm" "r_feather_3_3_outJoint_multMat.i[1]";
connectAttr "r_feather_3_3_mainGroup.opm" "r_feather_3_3_outJoint_multMat.i[2]";
connectAttr "r_feather_3_3_bendGroup.m" "r_feather_3_3_outJoint_multMat.i[3]";
connectAttr "r_feather_3_3_spreadGroup.m" "r_feather_3_3_outJoint_multMat.i[4]";
connectAttr "r_feather_3_3_group.opm" "r_feather_3_3_outJoint_multMat.i[5]";
connectAttr "r_feather_3_3_outJoint_multMat.o" "r_feather_3_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_4_bendGroup.wm" "r_feather_3_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_3_4_mainAxes_multMat.i[1]";
connectAttr "r_feather_3_4_mainAxes_multMat.o" "r_feather_3_4_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_3_4_mainAxes_pickMatrix.tmat" "r_feather_3_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_3_4_mainAxes_pickMatrix.tmat" "r_feather_3_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "r_feather_3_4_mainGroup_multMat.i[1]";
connectAttr "r_feather_3_4_mainAxes_inverseMatrix.omat" "r_feather_3_4_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_3_4.m" "r_feather_3_4_outJoint_multMat.i[0]";
connectAttr "r_feather_3_4_rollGroup.opm" "r_feather_3_4_outJoint_multMat.i[1]";
connectAttr "r_feather_3_4_mainGroup.opm" "r_feather_3_4_outJoint_multMat.i[2]";
connectAttr "r_feather_3_4_bendGroup.m" "r_feather_3_4_outJoint_multMat.i[3]";
connectAttr "r_feather_3_4_spreadGroup.m" "r_feather_3_4_outJoint_multMat.i[4]";
connectAttr "r_feather_3_4_group.opm" "r_feather_3_4_outJoint_multMat.i[5]";
connectAttr "r_feather_3_4_outJoint_multMat.o" "r_feather_3_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_3_5_bendGroup.wm" "r_feather_3_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_3_5_mainAxes_multMat.i[1]";
connectAttr "r_feather_3_5_mainAxes_multMat.o" "r_feather_3_5_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_3_5_mainAxes_pickMatrix.tmat" "r_feather_3_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_3_5_mainAxes_pickMatrix.tmat" "r_feather_3_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "r_feather_3_5_mainGroup_multMat.i[1]";
connectAttr "r_feather_3_5_mainAxes_inverseMatrix.omat" "r_feather_3_5_mainGroup_multMat.i[2]"
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
connectAttr "r_feather_4_2_bendGroup.wm" "r_feather_4_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_4_2_mainAxes_multMat.i[1]";
connectAttr "r_feather_4_2_mainAxes_multMat.o" "r_feather_4_2_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_4_2_mainAxes_pickMatrix.tmat" "r_feather_4_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_4_2_mainAxes_pickMatrix.tmat" "r_feather_4_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "r_feather_4_2_mainGroup_multMat.i[1]";
connectAttr "r_feather_4_2_mainAxes_inverseMatrix.omat" "r_feather_4_2_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_4_2.m" "r_feather_4_2_outJoint_multMat.i[0]";
connectAttr "r_feather_4_2_rollGroup.opm" "r_feather_4_2_outJoint_multMat.i[1]";
connectAttr "r_feather_4_2_mainGroup.opm" "r_feather_4_2_outJoint_multMat.i[2]";
connectAttr "r_feather_4_2_bendGroup.m" "r_feather_4_2_outJoint_multMat.i[3]";
connectAttr "r_feather_4_2_spreadGroup.m" "r_feather_4_2_outJoint_multMat.i[4]";
connectAttr "r_feather_4_2_group.opm" "r_feather_4_2_outJoint_multMat.i[5]";
connectAttr "r_feather_4_2_outJoint_multMat.o" "r_feather_4_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_3_bendGroup.wm" "r_feather_4_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_4_3_mainAxes_multMat.i[1]";
connectAttr "r_feather_4_3_mainAxes_multMat.o" "r_feather_4_3_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_4_3_mainAxes_pickMatrix.tmat" "r_feather_4_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_4_3_mainAxes_pickMatrix.tmat" "r_feather_4_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "r_feather_4_3_mainGroup_multMat.i[1]";
connectAttr "r_feather_4_3_mainAxes_inverseMatrix.omat" "r_feather_4_3_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_4_3.m" "r_feather_4_3_outJoint_multMat.i[0]";
connectAttr "r_feather_4_3_rollGroup.opm" "r_feather_4_3_outJoint_multMat.i[1]";
connectAttr "r_feather_4_3_mainGroup.opm" "r_feather_4_3_outJoint_multMat.i[2]";
connectAttr "r_feather_4_3_bendGroup.m" "r_feather_4_3_outJoint_multMat.i[3]";
connectAttr "r_feather_4_3_spreadGroup.m" "r_feather_4_3_outJoint_multMat.i[4]";
connectAttr "r_feather_4_3_group.opm" "r_feather_4_3_outJoint_multMat.i[5]";
connectAttr "r_feather_4_3_outJoint_multMat.o" "r_feather_4_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_4_bendGroup.wm" "r_feather_4_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_4_4_mainAxes_multMat.i[1]";
connectAttr "r_feather_4_4_mainAxes_multMat.o" "r_feather_4_4_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_4_4_mainAxes_pickMatrix.tmat" "r_feather_4_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_4_4_mainAxes_pickMatrix.tmat" "r_feather_4_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "r_feather_4_4_mainGroup_multMat.i[1]";
connectAttr "r_feather_4_4_mainAxes_inverseMatrix.omat" "r_feather_4_4_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_4_4.m" "r_feather_4_4_outJoint_multMat.i[0]";
connectAttr "r_feather_4_4_rollGroup.opm" "r_feather_4_4_outJoint_multMat.i[1]";
connectAttr "r_feather_4_4_mainGroup.opm" "r_feather_4_4_outJoint_multMat.i[2]";
connectAttr "r_feather_4_4_bendGroup.m" "r_feather_4_4_outJoint_multMat.i[3]";
connectAttr "r_feather_4_4_spreadGroup.m" "r_feather_4_4_outJoint_multMat.i[4]";
connectAttr "r_feather_4_4_group.opm" "r_feather_4_4_outJoint_multMat.i[5]";
connectAttr "r_feather_4_4_outJoint_multMat.o" "r_feather_4_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_4_5_bendGroup.wm" "r_feather_4_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_4_5_mainAxes_multMat.i[1]";
connectAttr "r_feather_4_5_mainAxes_multMat.o" "r_feather_4_5_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_4_5_mainAxes_pickMatrix.tmat" "r_feather_4_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_4_5_mainAxes_pickMatrix.tmat" "r_feather_4_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "r_feather_4_5_mainGroup_multMat.i[1]";
connectAttr "r_feather_4_5_mainAxes_inverseMatrix.omat" "r_feather_4_5_mainGroup_multMat.i[2]"
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
connectAttr "r_feather_5_2_bendGroup.wm" "r_feather_5_2_mainAxes_multMat.i[0]";
connectAttr "main_1_group.wim" "r_feather_5_2_mainAxes_multMat.i[1]";
connectAttr "r_feather_5_2_mainAxes_multMat.o" "r_feather_5_2_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_5_2_mainAxes_pickMatrix.tmat" "r_feather_5_2_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_5_2_mainAxes_pickMatrix.tmat" "r_feather_5_2_mainGroup_multMat.i[0]"
		;
connectAttr "main_1.m" "r_feather_5_2_mainGroup_multMat.i[1]";
connectAttr "r_feather_5_2_mainAxes_inverseMatrix.omat" "r_feather_5_2_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_5_2.m" "r_feather_5_2_outJoint_multMat.i[0]";
connectAttr "r_feather_5_2_rollGroup.opm" "r_feather_5_2_outJoint_multMat.i[1]";
connectAttr "r_feather_5_2_mainGroup.opm" "r_feather_5_2_outJoint_multMat.i[2]";
connectAttr "r_feather_5_2_bendGroup.m" "r_feather_5_2_outJoint_multMat.i[3]";
connectAttr "r_feather_5_2_spreadGroup.m" "r_feather_5_2_outJoint_multMat.i[4]";
connectAttr "r_feather_5_2_group.opm" "r_feather_5_2_outJoint_multMat.i[5]";
connectAttr "r_feather_5_2_outJoint_multMat.o" "r_feather_5_2_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_3_bendGroup.wm" "r_feather_5_3_mainAxes_multMat.i[0]";
connectAttr "main_2_group.wim" "r_feather_5_3_mainAxes_multMat.i[1]";
connectAttr "r_feather_5_3_mainAxes_multMat.o" "r_feather_5_3_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_5_3_mainAxes_pickMatrix.tmat" "r_feather_5_3_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_5_3_mainAxes_pickMatrix.tmat" "r_feather_5_3_mainGroup_multMat.i[0]"
		;
connectAttr "main_2.m" "r_feather_5_3_mainGroup_multMat.i[1]";
connectAttr "r_feather_5_3_mainAxes_inverseMatrix.omat" "r_feather_5_3_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_5_3.m" "r_feather_5_3_outJoint_multMat.i[0]";
connectAttr "r_feather_5_3_rollGroup.opm" "r_feather_5_3_outJoint_multMat.i[1]";
connectAttr "r_feather_5_3_mainGroup.opm" "r_feather_5_3_outJoint_multMat.i[2]";
connectAttr "r_feather_5_3_bendGroup.m" "r_feather_5_3_outJoint_multMat.i[3]";
connectAttr "r_feather_5_3_spreadGroup.m" "r_feather_5_3_outJoint_multMat.i[4]";
connectAttr "r_feather_5_3_group.opm" "r_feather_5_3_outJoint_multMat.i[5]";
connectAttr "r_feather_5_3_outJoint_multMat.o" "r_feather_5_3_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_4_bendGroup.wm" "r_feather_5_4_mainAxes_multMat.i[0]";
connectAttr "main_3_group.wim" "r_feather_5_4_mainAxes_multMat.i[1]";
connectAttr "r_feather_5_4_mainAxes_multMat.o" "r_feather_5_4_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_5_4_mainAxes_pickMatrix.tmat" "r_feather_5_4_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_5_4_mainAxes_pickMatrix.tmat" "r_feather_5_4_mainGroup_multMat.i[0]"
		;
connectAttr "main_3.m" "r_feather_5_4_mainGroup_multMat.i[1]";
connectAttr "r_feather_5_4_mainAxes_inverseMatrix.omat" "r_feather_5_4_mainGroup_multMat.i[2]"
		;
connectAttr "r_feather_5_4.m" "r_feather_5_4_outJoint_multMat.i[0]";
connectAttr "r_feather_5_4_rollGroup.opm" "r_feather_5_4_outJoint_multMat.i[1]";
connectAttr "r_feather_5_4_mainGroup.opm" "r_feather_5_4_outJoint_multMat.i[2]";
connectAttr "r_feather_5_4_bendGroup.m" "r_feather_5_4_outJoint_multMat.i[3]";
connectAttr "r_feather_5_4_spreadGroup.m" "r_feather_5_4_outJoint_multMat.i[4]";
connectAttr "r_feather_5_4_group.opm" "r_feather_5_4_outJoint_multMat.i[5]";
connectAttr "r_feather_5_4_outJoint_multMat.o" "r_feather_5_4_outJoint_decMat.imat"
		;
connectAttr "r_feather_5_5_bendGroup.wm" "r_feather_5_5_mainAxes_multMat.i[0]";
connectAttr "main_4_group.wim" "r_feather_5_5_mainAxes_multMat.i[1]";
connectAttr "r_feather_5_5_mainAxes_multMat.o" "r_feather_5_5_mainAxes_pickMatrix.imat"
		;
connectAttr "r_feather_5_5_mainAxes_pickMatrix.tmat" "r_feather_5_5_mainAxes_inverseMatrix.imat"
		;
connectAttr "r_feather_5_5_mainAxes_pickMatrix.tmat" "r_feather_5_5_mainGroup_multMat.i[0]"
		;
connectAttr "main_4.m" "r_feather_5_5_mainGroup_multMat.i[1]";
connectAttr "r_feather_5_5_mainAxes_inverseMatrix.omat" "r_feather_5_5_mainGroup_multMat.i[2]"
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
