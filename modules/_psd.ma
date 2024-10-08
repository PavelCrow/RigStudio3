//Maya ASCII 2022 scene
//Name: _psd.ma
//Last modified: Wed, Aug 07, 2024 03:16:40 PM
//Codeset: 1251
requires maya "2022";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 22631)";
fileInfo "UUID" "1BFCBA07-4F2D-49B6-B528-7EBE40400B70";
createNode transform -s -n "persp";
	rename -uid "12625692-4388-0DE0-526F-648BA60293AC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 13.4090611110945 10.965239604141846 17.425519882531944 ;
	setAttr ".r" -type "double3" -24.000000000003968 36.400000000000077 -9.8788023088004943e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "88863B48-4A38-68D5-AA0E-F382CF10485A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 22.737035002045637;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 3 0.034370303153991699 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "A498A8E7-47B0-B4B1-5D0F-B3AD507D7EA7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "0B73139C-40CD-3805-D8BA-BD9D0B1A8962";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 27.672855313700357;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "D9C3856F-4C06-D3F0-E4B5-A69502227BAC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.97976684726914731 3.1336075815804558 17.128340202596998 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "B6854F27-4629-6B05-D304-498AF2B9470B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 23.295897772019497;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "4317ECFD-4A5A-2724-5941-F5BA765B4161";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -10.90964761693928 0.36360939453495522 -0.0096789550681979364 ;
	setAttr ".r" -type "double3" 0 -90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "42D59360-43EC-9A20-967B-009F6A7B57B0";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 10.531787686782165;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "root";
	rename -uid "B66DF808-4B42-120A-B96A-B89910D92B1F";
createNode locator -n "rootShape" -p "root";
	rename -uid "543B3D5D-4104-2F0E-CE55-EBB4CDDEE0CB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
createNode transform -n "target" -p "root";
	rename -uid "24B304C3-4561-FAA5-187C-5386F8577AC4";
createNode locator -n "targetShape" -p "target";
	rename -uid "E9D320A5-471C-F48D-F73A-8B93EF02DEEB";
	setAttr -k off ".v" no;
createNode transform -n "aim" -p "target";
	rename -uid "5663CCE7-4477-355D-F1FA-48A92AE2AC8D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3 0 0 ;
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "aimShape" -p "aim";
	rename -uid "C2AB87CC-49A5-875E-AABA-24AE375EF355";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
createNode transform -n "target_y" -p "root";
	rename -uid "6029C53E-4A0C-F9E4-19C1-30B9FF6376EE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 3 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "target_yShape" -p "target_y";
	rename -uid "08530CAD-4352-72FD-D59F-E19328B64D0C";
	setAttr -k off ".v";
createNode transform -n "target_z" -p "root";
	rename -uid "0E3BB1D1-4D72-0C80-8560-28ACE19F3CE7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.1086244689504383e-15 0 3 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "target_zShape" -p "target_z";
	rename -uid "8B2CBBB2-4388-FC51-D54B-349C92141168";
	setAttr -k off ".v";
createNode transform -n "joints_group" -p "root";
	rename -uid "46505017-4FE0-77E9-0DC4-3F9DA661F076";
createNode joint -n "outJoint_y_1" -p "joints_group";
	rename -uid "FEFA7FBA-4005-007F-6D65-D783AE424071";
	addAttr -ci true -sn "driverAngle" -ln "driverAngle" -at "double";
	addAttr -ci true -sn "angleMin" -ln "angleMin" -at "double";
	addAttr -ci true -sn "angleMax" -ln "angleMax" -at "double";
	addAttr -ci true -sn "posMin" -ln "posMin" -at "double";
	addAttr -ci true -sn "posMax" -ln "posMax" -at "double";
	addAttr -ci true -sn "slideMin" -ln "slideMin" -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "slideMax" -ln "slideMax" -at "double";
	setAttr ".t" -type "double3" 0 1 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0 1.6154459791819042 0.062188599127851796 0 -1.6166425497049333 0 0 0
		 0 -0.062188607665072122 1.6154459788532534 0 -2.6189607455119384 119.76641395551142 -3.2474566685559192 1;
	setAttr -cb on ".driverAngle";
	setAttr -k on ".angleMin" 90;
	setAttr -k on ".angleMax" 45;
	setAttr -k on ".posMin" 1;
	setAttr -k on ".posMax" 5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode joint -n "outJoint_y_2" -p "joints_group";
	rename -uid "0E82DCFF-4C8D-97AB-6A1B-F1A1EE91F6A8";
	addAttr -ci true -sn "driverAngle" -ln "driverAngle" -at "double";
	addAttr -ci true -sn "angleMin" -ln "angleMin" -at "double";
	addAttr -ci true -sn "angleMax" -ln "angleMax" -at "double";
	addAttr -ci true -sn "posMin" -ln "posMin" -at "double";
	addAttr -ci true -sn "posMax" -ln "posMax" -at "double";
	addAttr -ci true -sn "slideMin" -ln "slideMin" -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "slideMax" -ln "slideMax" -at "double";
	setAttr ".t" -type "double3" 0 -1 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0 1.6154459791819042 0.062188599127851796 0 -1.6166425497049333 0 0 0
		 0 -0.062188607665072122 1.6154459788532534 0 2.6189609382307402 119.76641395551142 -3.2474566685559192 1;
	setAttr -cb on ".driverAngle";
	setAttr -k on ".angleMin" 90;
	setAttr -k on ".angleMax" 135;
	setAttr -k on ".posMin" -1;
	setAttr -k on ".posMax" -5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode joint -n "outJoint_z_1" -p "joints_group";
	rename -uid "BD4FFADC-4C97-41DE-5DCE-5593F9ADFD82";
	addAttr -ci true -sn "driverAngle" -ln "driverAngle" -at "double";
	addAttr -ci true -sn "angleMin" -ln "angleMin" -at "double";
	addAttr -ci true -sn "angleMax" -ln "angleMax" -at "double";
	addAttr -ci true -sn "posMin" -ln "posMin" -at "double";
	addAttr -ci true -sn "posMax" -ln "posMax" -at "double";
	addAttr -ci true -sn "slideMin" -ln "slideMin" -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "slideMax" -ln "slideMax" -at "double";
	setAttr ".t" -type "double3" 0 -3.9443045261050599e-31 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0 1.6154459791819042 0.062188599127851796 0 -1.6166425497049333 0 0 0
		 0 -0.062188607665072122 1.6154459788532534 0 -4.1543205011278486e-15 117.52395189195144 -0.47020547836348792 1;
	setAttr -cb on ".driverAngle";
	setAttr -k on ".angleMin" 90;
	setAttr -k on ".angleMax" 45;
	setAttr -k on ".posMin" 1;
	setAttr -k on ".posMax" 5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode joint -n "outJoint_z_2" -p "joints_group";
	rename -uid "624DE9B0-4ECD-E82D-5EB9-76AAD50710D9";
	addAttr -ci true -sn "driverAngle" -ln "driverAngle" -at "double";
	addAttr -ci true -sn "angleMin" -ln "angleMin" -at "double";
	addAttr -ci true -sn "angleMax" -ln "angleMax" -at "double";
	addAttr -ci true -sn "posMin" -ln "posMin" -at "double";
	addAttr -ci true -sn "posMax" -ln "posMax" -at "double";
	addAttr -ci true -sn "slideMin" -ln "slideMin" -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "slideMax" -ln "slideMax" -at "double";
	setAttr ".t" -type "double3" 0 -3.9443045261050599e-31 -1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0 1.6154459791819042 0.062188599127851796 0 -1.6166425497049333 0 0 0
		 0 -0.062188607665072122 1.6154459788532534 0 -4.1543205011278486e-15 119.85498328551924 -5.5481830135068027 1;
	setAttr -cb on ".driverAngle";
	setAttr -k on ".angleMin" 90;
	setAttr -k on ".angleMax" 135;
	setAttr -k on ".posMin" -1;
	setAttr -k on ".posMax" -5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode unitConversion -n "y_unitConversion";
	rename -uid "97BD4A63-4C63-A7B7-B5C5-4BA4DC776822";
	setAttr ".cf" 57.295779513082323;
createNode angleBetween -n "y_angleBetween";
	rename -uid "055F8D3B-48ED-248E-4F4D-759ACDEBD6A9";
createNode plusMinusAverage -n "y_plusMinusAverage";
	rename -uid "B722FF8C-4841-DB5C-0F02-44BC2D9B8BD1";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "aim_plusMinusAverage";
	rename -uid "6BBAF1B1-49FA-9C11-82BE-28AC67763EE4";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "y_1_setRange";
	rename -uid "B6C76F31-44DF-143B-AB94-7E84F9825E95";
createNode condition -n "y_1_angles_condition";
	rename -uid "E5B401F3-47C9-043E-C7DF-62B07D95D839";
	setAttr ".op" 2;
createNode condition -n "y_1_slide_condition";
	rename -uid "689F5793-48EC-5325-5BA6-968DFCAB36AB";
	setAttr ".op" 3;
createNode condition -n "y_1_pos_condition";
	rename -uid "8D107387-469B-5D2D-724D-8FA14570320E";
	setAttr ".op" 3;
createNode setRange -n "y_2_setRange";
	rename -uid "ADC6A565-46D4-1A32-B3FB-40AB289507AC";
createNode condition -n "y_2_angles_condition";
	rename -uid "273A16B4-4CCC-3E8F-E1A3-A6859065E96C";
	setAttr ".op" 2;
createNode condition -n "y_2_slide_condition";
	rename -uid "FA4B5669-477A-2C97-74A9-B5B3F41FF8A3";
	setAttr ".op" 3;
createNode condition -n "y_2_pos_condition";
	rename -uid "67FDB1C9-4C1C-530A-8E67-29B1A61CB060";
	setAttr ".op" 3;
createNode unitConversion -n "z_unitConversion";
	rename -uid "0210923E-4EED-0189-379E-91AB392A35F4";
	setAttr ".cf" 57.295779513082323;
createNode angleBetween -n "z_angleBetween";
	rename -uid "A0383DFD-40EC-B54D-8866-AB8E1D63ED42";
createNode plusMinusAverage -n "z_plusMinusAverage";
	rename -uid "C10F57B3-4747-F9E4-1158-08AC4E66359B";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode setRange -n "z_1_setRange";
	rename -uid "686ACA0B-4CF0-36B3-4C62-E6A1450BDFFA";
createNode condition -n "z_1_angles_condition";
	rename -uid "FA8E0740-4B84-6C66-96FF-15AE3860F186";
	setAttr ".op" 2;
createNode condition -n "z_1_slide_condition";
	rename -uid "D25221E5-4C90-FB6D-C4C5-6198E4C21F86";
	setAttr ".op" 3;
createNode condition -n "z_1_pos_condition";
	rename -uid "665D2B0B-4FE3-6CE4-A720-37B2D28E1A97";
	setAttr ".op" 3;
createNode setRange -n "z_2_setRange";
	rename -uid "EC6E7176-451A-71CD-5252-A18DE062B18D";
createNode condition -n "z_2_angles_condition";
	rename -uid "EE098825-48C5-30FD-F930-E3A3547B780E";
	setAttr ".op" 2;
createNode condition -n "z_2_slide_condition";
	rename -uid "ECCB36FB-4214-C345-D34B-2CAA28CF2887";
	setAttr ".op" 3;
createNode condition -n "z_2_pos_condition";
	rename -uid "2BEF2420-4C6E-3682-CF68-A7BCEBCE23D7";
	setAttr ".op" 3;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "0C45D840-497F-AB26-4A93-6E9C4DBC1AED";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "DCAA55E0-4A71-A382-05AF-83A7AC7A9160";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "7BF2C68C-47FA-4BAC-8F9E-81A96B263745";
createNode displayLayerManager -n "layerManager";
	rename -uid "A058BF0B-456A-6D7D-9DEE-F4855CBA7A95";
createNode displayLayer -n "defaultLayer";
	rename -uid "CD17A982-4CB0-BAB9-8D95-94B73D6225C9";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "75CD9141-4D58-F085-3F0D-1C9324A433AF";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "00408454-4693-FD3D-F3DB-9D87DABC095E";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "F9F773B3-41A9-571E-65DC-5F891CFB8EC5";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 50 -ast 0 -aet 100 ";
	setAttr ".st" 6;
createNode pairBlend -n "pairBlend";
	rename -uid "81FC3B54-4A38-F8FC-ABC3-1C9BC2FE923E";
	setAttr ".w" 0.5;
	setAttr ".ri" 1;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "4E079AD9-4E5C-5577-8D4D-D6894482B3D4";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1089.2856710013907 -15536.308906452077 ;
	setAttr ".tgi[0].vh" -type "double2" 211.90475348442357 -14220.832768248212 ;
	setAttr -s 12 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -895.3564453125;
	setAttr ".tgi[0].ni[0].y" -14538.216796875;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -197.14285278320312;
	setAttr ".tgi[0].ni[1].y" -14505.7138671875;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -867.66937255859375;
	setAttr ".tgi[0].ni[2].y" -14728.7255859375;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 422.31289672851562;
	setAttr ".tgi[0].ni[3].y" -14762.576171875;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 422.31289672851562;
	setAttr ".tgi[0].ni[4].y" -14661.1474609375;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 107.59243011474609;
	setAttr ".tgi[0].ni[5].y" -14582.7568359375;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -873.68829345703125;
	setAttr ".tgi[0].ni[6].y" -14335.669921875;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 417.14285278320312;
	setAttr ".tgi[0].ni[7].y" -14534.2861328125;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -529.56524658203125;
	setAttr ".tgi[0].ni[8].y" -14429.005859375;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" 422.31289672851562;
	setAttr ".tgi[0].ni[9].y" -14864.0048828125;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" -540.3992919921875;
	setAttr ".tgi[0].ni[10].y" -14641.1826171875;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 778.4560546875;
	setAttr ".tgi[0].ni[11].y" -14257.57421875;
	setAttr ".tgi[0].ni[11].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
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
	setAttr -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -k on ".hwi";
	setAttr -k on ".csvd";
	setAttr -av ".ta";
	setAttr -av ".tq";
	setAttr -k on ".ts";
	setAttr -av ".etmr";
	setAttr -av ".tmr";
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -k on ".aofr";
	setAttr -av ".aosm";
	setAttr -k on ".hff";
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
	setAttr -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -k on ".blat";
	setAttr -av ".msaa";
	setAttr -av ".aasc";
	setAttr -k on ".aasq";
	setAttr -k on ".laa";
	setAttr ".fprt" yes;
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
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 21 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
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
lockNode -l 0 -lu 1;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -av -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
lockNode -l 0 -lu 1;
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
	setAttr -k on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -av -k on ".me";
	setAttr -k on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -k on ".oft";
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
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
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
	setAttr -cb on ".ihi";
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
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
connectAttr "pairBlend.or" "joints_group.r";
connectAttr "y_unitConversion.o" "outJoint_y_1.driverAngle" -l on;
connectAttr "y_1_setRange.oy" "outJoint_y_1.ty";
connectAttr "y_1_setRange.ox" "outJoint_y_1.tx";
connectAttr "y_unitConversion.o" "outJoint_y_2.driverAngle";
connectAttr "y_2_setRange.oy" "outJoint_y_2.ty";
connectAttr "y_2_setRange.ox" "outJoint_y_2.tx";
connectAttr "z_unitConversion.o" "outJoint_z_1.driverAngle" -l on;
connectAttr "z_1_setRange.ox" "outJoint_z_1.tx";
connectAttr "z_1_setRange.oy" "outJoint_z_1.tz";
connectAttr "z_unitConversion.o" "outJoint_z_2.driverAngle";
connectAttr "z_2_setRange.ox" "outJoint_z_2.tx";
connectAttr "z_2_setRange.oy" "outJoint_z_2.tz";
connectAttr "y_angleBetween.a" "y_unitConversion.i";
connectAttr "y_plusMinusAverage.o3" "y_angleBetween.v1";
connectAttr "aim_plusMinusAverage.o3" "y_angleBetween.v2";
connectAttr "target_yShape.wp" "y_plusMinusAverage.i3[0]";
connectAttr "targetShape.wp" "y_plusMinusAverage.i3[1]";
connectAttr "aimShape.wp" "aim_plusMinusAverage.i3[0]";
connectAttr "targetShape.wp" "aim_plusMinusAverage.i3[1]";
connectAttr "y_unitConversion.o" "y_1_setRange.vx";
connectAttr "y_unitConversion.o" "y_1_setRange.vy";
connectAttr "y_unitConversion.o" "y_1_setRange.vz";
connectAttr "y_1_angles_condition.ocr" "y_1_setRange.omx";
connectAttr "y_1_angles_condition.ocr" "y_1_setRange.omy";
connectAttr "y_1_angles_condition.ocg" "y_1_setRange.onx";
connectAttr "y_1_angles_condition.ocg" "y_1_setRange.ony";
connectAttr "y_1_slide_condition.ocg" "y_1_setRange.nx";
connectAttr "y_1_pos_condition.ocg" "y_1_setRange.ny";
connectAttr "y_1_slide_condition.ocr" "y_1_setRange.mx";
connectAttr "y_1_pos_condition.ocr" "y_1_setRange.my";
connectAttr "outJoint_y_1.angleMax" "y_1_angles_condition.ft";
connectAttr "outJoint_y_1.angleMin" "y_1_angles_condition.st";
connectAttr "outJoint_y_1.angleMax" "y_1_angles_condition.ctr";
connectAttr "outJoint_y_1.angleMin" "y_1_angles_condition.ctg";
connectAttr "outJoint_y_1.angleMin" "y_1_angles_condition.cfr";
connectAttr "outJoint_y_1.angleMax" "y_1_angles_condition.cfg";
connectAttr "outJoint_y_1.angleMax" "y_1_slide_condition.ft";
connectAttr "outJoint_y_1.angleMin" "y_1_slide_condition.st";
connectAttr "outJoint_y_1.slideMax" "y_1_slide_condition.ctr";
connectAttr "outJoint_y_1.slideMin" "y_1_slide_condition.ctg";
connectAttr "outJoint_y_1.slideMin" "y_1_slide_condition.cfr";
connectAttr "outJoint_y_1.slideMax" "y_1_slide_condition.cfg";
connectAttr "outJoint_y_1.angleMax" "y_1_pos_condition.ft";
connectAttr "outJoint_y_1.angleMin" "y_1_pos_condition.st";
connectAttr "outJoint_y_1.posMax" "y_1_pos_condition.ctr";
connectAttr "outJoint_y_1.posMin" "y_1_pos_condition.ctg";
connectAttr "outJoint_y_1.posMin" "y_1_pos_condition.cfr";
connectAttr "outJoint_y_1.posMax" "y_1_pos_condition.cfg";
connectAttr "y_unitConversion.o" "y_2_setRange.vx";
connectAttr "y_unitConversion.o" "y_2_setRange.vy";
connectAttr "y_unitConversion.o" "y_2_setRange.vz";
connectAttr "y_2_angles_condition.ocr" "y_2_setRange.omx";
connectAttr "y_2_angles_condition.ocr" "y_2_setRange.omy";
connectAttr "y_2_angles_condition.ocg" "y_2_setRange.onx";
connectAttr "y_2_angles_condition.ocg" "y_2_setRange.ony";
connectAttr "y_2_slide_condition.ocg" "y_2_setRange.nx";
connectAttr "y_2_pos_condition.ocg" "y_2_setRange.ny";
connectAttr "y_2_slide_condition.ocr" "y_2_setRange.mx";
connectAttr "y_2_pos_condition.ocr" "y_2_setRange.my";
connectAttr "outJoint_y_2.angleMax" "y_2_angles_condition.ft";
connectAttr "outJoint_y_2.angleMin" "y_2_angles_condition.st";
connectAttr "outJoint_y_2.angleMax" "y_2_angles_condition.ctr";
connectAttr "outJoint_y_2.angleMin" "y_2_angles_condition.ctg";
connectAttr "outJoint_y_2.angleMin" "y_2_angles_condition.cfr";
connectAttr "outJoint_y_2.angleMax" "y_2_angles_condition.cfg";
connectAttr "outJoint_y_2.angleMax" "y_2_slide_condition.ft";
connectAttr "outJoint_y_2.angleMin" "y_2_slide_condition.st";
connectAttr "outJoint_y_2.slideMax" "y_2_slide_condition.ctr";
connectAttr "outJoint_y_2.slideMin" "y_2_slide_condition.ctg";
connectAttr "outJoint_y_2.slideMin" "y_2_slide_condition.cfr";
connectAttr "outJoint_y_2.slideMax" "y_2_slide_condition.cfg";
connectAttr "outJoint_y_2.angleMax" "y_2_pos_condition.ft";
connectAttr "outJoint_y_2.angleMin" "y_2_pos_condition.st";
connectAttr "outJoint_y_2.posMax" "y_2_pos_condition.ctr";
connectAttr "outJoint_y_2.posMin" "y_2_pos_condition.ctg";
connectAttr "outJoint_y_2.posMin" "y_2_pos_condition.cfr";
connectAttr "outJoint_y_2.posMax" "y_2_pos_condition.cfg";
connectAttr "z_angleBetween.a" "z_unitConversion.i";
connectAttr "z_plusMinusAverage.o3" "z_angleBetween.v1";
connectAttr "aim_plusMinusAverage.o3" "z_angleBetween.v2";
connectAttr "target_zShape.wp" "z_plusMinusAverage.i3[0]";
connectAttr "targetShape.wp" "z_plusMinusAverage.i3[1]";
connectAttr "z_unitConversion.o" "z_1_setRange.vx";
connectAttr "z_unitConversion.o" "z_1_setRange.vy";
connectAttr "z_unitConversion.o" "z_1_setRange.vz";
connectAttr "z_1_angles_condition.ocr" "z_1_setRange.omx";
connectAttr "z_1_angles_condition.ocr" "z_1_setRange.omy";
connectAttr "z_1_angles_condition.ocg" "z_1_setRange.onx";
connectAttr "z_1_angles_condition.ocg" "z_1_setRange.ony";
connectAttr "z_1_slide_condition.ocg" "z_1_setRange.nx";
connectAttr "z_1_pos_condition.ocg" "z_1_setRange.ny";
connectAttr "z_1_slide_condition.ocr" "z_1_setRange.mx";
connectAttr "z_1_pos_condition.ocr" "z_1_setRange.my";
connectAttr "outJoint_z_1.angleMax" "z_1_angles_condition.ft";
connectAttr "outJoint_z_1.angleMin" "z_1_angles_condition.st";
connectAttr "outJoint_z_1.angleMax" "z_1_angles_condition.ctr";
connectAttr "outJoint_z_1.angleMin" "z_1_angles_condition.ctg";
connectAttr "outJoint_z_1.angleMin" "z_1_angles_condition.cfr";
connectAttr "outJoint_z_1.angleMax" "z_1_angles_condition.cfg";
connectAttr "outJoint_z_1.angleMax" "z_1_slide_condition.ft";
connectAttr "outJoint_z_1.angleMin" "z_1_slide_condition.st";
connectAttr "outJoint_z_1.slideMax" "z_1_slide_condition.ctr";
connectAttr "outJoint_z_1.slideMin" "z_1_slide_condition.ctg";
connectAttr "outJoint_z_1.slideMin" "z_1_slide_condition.cfr";
connectAttr "outJoint_z_1.slideMax" "z_1_slide_condition.cfg";
connectAttr "outJoint_z_1.angleMax" "z_1_pos_condition.ft";
connectAttr "outJoint_z_1.angleMin" "z_1_pos_condition.st";
connectAttr "outJoint_z_1.posMax" "z_1_pos_condition.ctr";
connectAttr "outJoint_z_1.posMin" "z_1_pos_condition.ctg";
connectAttr "outJoint_z_1.posMin" "z_1_pos_condition.cfr";
connectAttr "outJoint_z_1.posMax" "z_1_pos_condition.cfg";
connectAttr "z_unitConversion.o" "z_2_setRange.vx";
connectAttr "z_unitConversion.o" "z_2_setRange.vy";
connectAttr "z_unitConversion.o" "z_2_setRange.vz";
connectAttr "z_2_angles_condition.ocr" "z_2_setRange.omx";
connectAttr "z_2_angles_condition.ocr" "z_2_setRange.omy";
connectAttr "z_2_angles_condition.ocg" "z_2_setRange.onx";
connectAttr "z_2_angles_condition.ocg" "z_2_setRange.ony";
connectAttr "z_2_slide_condition.ocg" "z_2_setRange.nx";
connectAttr "z_2_pos_condition.ocg" "z_2_setRange.ny";
connectAttr "z_2_slide_condition.ocr" "z_2_setRange.mx";
connectAttr "z_2_pos_condition.ocr" "z_2_setRange.my";
connectAttr "outJoint_z_2.angleMax" "z_2_angles_condition.ft";
connectAttr "outJoint_z_2.angleMin" "z_2_angles_condition.st";
connectAttr "outJoint_z_2.angleMax" "z_2_angles_condition.ctr";
connectAttr "outJoint_z_2.angleMin" "z_2_angles_condition.ctg";
connectAttr "outJoint_z_2.angleMin" "z_2_angles_condition.cfr";
connectAttr "outJoint_z_2.angleMax" "z_2_angles_condition.cfg";
connectAttr "outJoint_z_2.angleMax" "z_2_slide_condition.ft";
connectAttr "outJoint_z_2.angleMin" "z_2_slide_condition.st";
connectAttr "outJoint_z_2.slideMax" "z_2_slide_condition.ctr";
connectAttr "outJoint_z_2.slideMin" "z_2_slide_condition.ctg";
connectAttr "outJoint_z_2.slideMin" "z_2_slide_condition.cfr";
connectAttr "outJoint_z_2.slideMax" "z_2_slide_condition.cfg";
connectAttr "outJoint_z_2.angleMax" "z_2_pos_condition.ft";
connectAttr "outJoint_z_2.angleMin" "z_2_pos_condition.st";
connectAttr "outJoint_z_2.posMax" "z_2_pos_condition.ctr";
connectAttr "outJoint_z_2.posMin" "z_2_pos_condition.ctg";
connectAttr "outJoint_z_2.posMin" "z_2_pos_condition.cfr";
connectAttr "outJoint_z_2.posMax" "z_2_pos_condition.cfg";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "target.r" "pairBlend.ir1";
connectAttr "targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "y_angleBetween.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "target_yShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "y_1_pos_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "y_1_slide_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "y_unitConversion.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "aimShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "y_1_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "aim_plusMinusAverage.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "y_1_angles_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "y_plusMinusAverage.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "outJoint_y_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn";
connectAttr "y_angleBetween.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_plusMinusAverage.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aim_plusMinusAverage.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_angleBetween.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_plusMinusAverage.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of _psd.ma
