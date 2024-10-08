//Maya ASCII 2022 scene
//Name: _psdLocal.ma
//Last modified: Sun, Aug 25, 2024 06:34:45 PM
//Codeset: 1251
requires maya "2022";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 22631)";
fileInfo "UUID" "A90D7583-422D-6057-8A99-53992B3E0967";
createNode transform -s -n "persp";
	rename -uid "12625692-4388-0DE0-526F-648BA60293AC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 8.665739220978697 5.9660313694311649 6.7427520913587911 ;
	setAttr ".r" -type "double3" -28.200000000003246 46.400000000002656 -2.3060212767713948e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "88863B48-4A38-68D5-AA0E-F382CF10485A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 9.9133905591767828;
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
	setAttr ".t" -type "double3" 2.4965204328116881 0.2239548332304111 7.6618712046105628 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "B6854F27-4629-6B05-D304-498AF2B9470B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 6.661633892869351;
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
createNode joint -n "joint_1";
	rename -uid "FD5CB9A0-4084-67B2-726B-E496529E107B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "joint_2" -p "joint_1";
	rename -uid "B162D04A-4D99-45E0-E42F-9387C3F1C5DA";
	setAttr ".t" -type "double3" 2 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "joint_end" -p "joint_2";
	rename -uid "EE4A8D88-4790-9042-579E-B8A03FAA93F1";
	setAttr ".t" -type "double3" 2.0097830737253162 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "root" -p "joint_2";
	rename -uid "B66DF808-4B42-120A-B96A-B89910D92B1F";
	setAttr ".t" -type "double3" 5.5237946661179649e-08 0 0 ;
createNode locator -n "rootShape" -p "root";
	rename -uid "543B3D5D-4104-2F0E-CE55-EBB4CDDEE0CB";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
createNode joint -n "outJoint_y_1" -p "root";
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
	setAttr -k on ".angleMin";
	setAttr -k on ".angleMax" -30;
	setAttr -k on ".posMin" 1;
	setAttr -k on ".posMax" 5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode joint -n "outJoint_y_2" -p "root";
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
	setAttr -k on ".angleMin";
	setAttr -k on ".angleMax" 30;
	setAttr -k on ".posMin" -1;
	setAttr -k on ".posMax" -5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode joint -n "outJoint_z_1" -p "root";
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
	setAttr -k on ".angleMin";
	setAttr -k on ".angleMax" 30;
	setAttr -k on ".posMin" 1;
	setAttr -k on ".posMax" 5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode joint -n "outJoint_z_2" -p "root";
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
	setAttr -k on ".angleMin";
	setAttr -k on ".angleMax" -30;
	setAttr -k on ".posMin" -1;
	setAttr -k on ".posMax" -5;
	setAttr -k on ".slideMin";
	setAttr -k on ".slideMax";
createNode transform -n "offsetLoc_group" -p "root";
	rename -uid "7AFAA565-4DB5-46F4-2C9D-B39222960834";
	setAttr ".v" no;
createNode transform -n "offsetLoc" -p "offsetLoc_group";
	rename -uid "1F22EC94-4340-4842-33D5-C2BC738AB40F";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "offsetLocShape" -p "offsetLoc";
	rename -uid "7D5A2403-4469-92DB-AE46-528E1BB43F2D";
	setAttr -k off ".v";
createNode unitConversion -n "y_unitConversion";
	rename -uid "97BD4A63-4C63-A7B7-B5C5-4BA4DC776822";
	setAttr ".cf" 57.295779513082323;
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
	rename -uid "F706BD65-4ADB-99D2-5EE6-DB83A17BB2FF";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "DEF34B30-473D-1FF3-7BCC-5E97CB8C4FBD";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C00575E9-4B1B-2A9B-19DC-0291B4E2D903";
createNode displayLayerManager -n "layerManager";
	rename -uid "A8E5AAA5-4477-1192-BB31-83B7266EC1F8";
createNode displayLayer -n "defaultLayer";
	rename -uid "CD17A982-4CB0-BAB9-8D95-94B73D6225C9";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "7EEB8D8B-4409-3A38-8C4A-B08D8B4749A4";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "00408454-4693-FD3D-F3DB-9D87DABC095E";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "F9F773B3-41A9-571E-65DC-5F891CFB8EC5";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 50 -ast 0 -aet 100 ";
	setAttr ".st" 6;
createNode pairBlend -n "input_pairBlend";
	rename -uid "81FC3B54-4A38-F8FC-ABC3-1C9BC2FE923E";
	setAttr ".w" 0.5;
	setAttr ".ri" 1;
createNode unitConversion -n "reverse_unitConversion";
	rename -uid "621E1204-4DBE-2D57-6310-F281503E4B14";
	setAttr ".cf" -1;
createNode unitConversion -n "ibtwOffset_unitConversion";
	rename -uid "C5ED2A19-4668-A302-39E5-2FAB05010405";
	setAttr ".cf" -1;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "DD01551E-48E8-49CE-2207-528E1E120951";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1782.1427863268655 -705.42849734412391 ;
	setAttr ".tgi[0].vh" -type "double2" -479.76188569788036 686.38087905338921 ;
	setAttr -s 16 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -101.42857360839844;
	setAttr ".tgi[0].ni[0].y" 307.14285278320312;
	setAttr ".tgi[0].ni[0].nvs" 18305;
	setAttr ".tgi[0].ni[1].x" -1314.4205322265625;
	setAttr ".tgi[0].ni[1].y" 17.627460479736328;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 205.71427917480469;
	setAttr ".tgi[0].ni[2].y" 747.14288330078125;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" -1944.2857666015625;
	setAttr ".tgi[0].ni[3].y" -294.28570556640625;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 205.71427917480469;
	setAttr ".tgi[0].ni[4].y" 1082.857177734375;
	setAttr ".tgi[0].ni[4].nvs" 18305;
	setAttr ".tgi[0].ni[5].x" 205.71427917480469;
	setAttr ".tgi[0].ni[5].y" -11.428571701049805;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[0].ni[6].x" -101.42857360839844;
	setAttr ".tgi[0].ni[6].y" 880;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 205.71427917480469;
	setAttr ".tgi[0].ni[7].y" -464.28570556640625;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -1637.142822265625;
	setAttr ".tgi[0].ni[8].y" -142.85714721679688;
	setAttr ".tgi[0].ni[8].nvs" 18305;
	setAttr ".tgi[0].ni[9].x" -715.71429443359375;
	setAttr ".tgi[0].ni[9].y" 60.130287170410156;
	setAttr ".tgi[0].ni[9].nvs" 18305;
	setAttr ".tgi[0].ni[10].x" -408.57144165039062;
	setAttr ".tgi[0].ni[10].y" 94.285713195800781;
	setAttr ".tgi[0].ni[10].nvs" 18305;
	setAttr ".tgi[0].ni[11].x" -101.42857360839844;
	setAttr ".tgi[0].ni[11].y" -107.14286041259766;
	setAttr ".tgi[0].ni[11].nvs" 18305;
	setAttr ".tgi[0].ni[12].x" -1035.8399658203125;
	setAttr ".tgi[0].ni[12].y" 13.099444389343262;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" 205.71427917480469;
	setAttr ".tgi[0].ni[13].y" 402.85714721679688;
	setAttr ".tgi[0].ni[13].nvs" 18305;
	setAttr ".tgi[0].ni[14].x" -408.57144165039062;
	setAttr ".tgi[0].ni[14].y" 294.28570556640625;
	setAttr ".tgi[0].ni[14].nvs" 18305;
	setAttr ".tgi[0].ni[15].x" -101.42857360839844;
	setAttr ".tgi[0].ni[15].y" 721.4285888671875;
	setAttr ".tgi[0].ni[15].nvs" 18305;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -521.42855070886242 -897.2908826464203 ;
	setAttr ".tgi[1].vh" -type "double2" 1254.7618549021483 1000.8623071022905 ;
	setAttr -s 7 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 275.71429443359375;
	setAttr ".tgi[1].ni[0].y" -335.71429443359375;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" 275.71429443359375;
	setAttr ".tgi[1].ni[1].y" -48.571430206298828;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" 582.85711669921875;
	setAttr ".tgi[1].ni[2].y" -454.28570556640625;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" 582.85711669921875;
	setAttr ".tgi[1].ni[3].y" -251.42857360839844;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 582.85711669921875;
	setAttr ".tgi[1].ni[4].y" -150;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 582.85711669921875;
	setAttr ".tgi[1].ni[5].y" -352.85714721679688;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 935.74896240234375;
	setAttr ".tgi[1].ni[6].y" -207.712890625;
	setAttr ".tgi[1].ni[6].nvs" 18305;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -897.61901195087296 -630.15045391374133 ;
	setAttr ".tgi[2].vh" -type "double2" 205.95237276856892 549.19807617811875 ;
	setAttr -s 4 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" -114.96809387207031;
	setAttr ".tgi[2].ni[0].y" 210.97085571289062;
	setAttr ".tgi[2].ni[0].nvs" 18305;
	setAttr ".tgi[2].ni[1].x" -837.99072265625;
	setAttr ".tgi[2].ni[1].y" 1.6721256971359253;
	setAttr ".tgi[2].ni[1].nvs" 18305;
	setAttr ".tgi[2].ni[2].x" -116.38304901123047;
	setAttr ".tgi[2].ni[2].y" 14.785496711730957;
	setAttr ".tgi[2].ni[2].nvs" 18305;
	setAttr ".tgi[2].ni[3].x" -499.41500854492188;
	setAttr ".tgi[2].ni[3].y" 2.7661402225494385;
	setAttr ".tgi[2].ni[3].nvs" 18305;
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
	setAttr -s 17 ".u";
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
connectAttr "joint_1.s" "joint_2.is";
connectAttr "joint_2.s" "joint_end.is";
connectAttr "reverse_unitConversion.o" "root.r";
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
connectAttr "ibtwOffset_unitConversion.o" "offsetLoc_group.r";
connectAttr "root.rz" "y_unitConversion.i";
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
connectAttr "root.ry" "z_unitConversion.i";
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
connectAttr "joint_2.r" "input_pairBlend.ir1";
connectAttr "ibtwOffset_unitConversion.o" "input_pairBlend.ir2";
connectAttr "input_pairBlend.or" "reverse_unitConversion.i";
connectAttr "offsetLoc.r" "ibtwOffset_unitConversion.i";
connectAttr "z_1_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "input_pairBlend.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "outJoint_y_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "joint_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "outJoint_z_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "outJoint_y_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "z_2_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "joint_end.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "joint_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "root.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "y_unitConversion.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "y_2_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn";
connectAttr "reverse_unitConversion.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "outJoint_z_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn";
connectAttr "z_unitConversion.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "y_1_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn";
connectAttr "outJoint_y_1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "root.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "y_1_angles_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "y_unitConversion.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "y_1_pos_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "y_1_slide_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "y_1_setRange.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "offsetLoc_group.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn";
connectAttr "offsetLoc.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn";
connectAttr "input_pairBlend.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn";
connectAttr "ibtwOffset_unitConversion.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "y_1_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_1_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "y_2_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_1_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_setRange.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_angles_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_slide_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "z_2_pos_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse_unitConversion.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of _psdLocal.ma
