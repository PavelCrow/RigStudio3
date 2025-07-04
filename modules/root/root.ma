//Maya ASCII 2022 scene
//Name: root.ma
//Last modified: Fri, Apr 25, 2025 05:41:06 AM
//Codeset: 1251
requires maya "2022";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "85D517D5-4D8D-2500-429F-21905D741D89";
createNode transform -n "mod";
	rename -uid "796B45B9-43DB-82CA-C93B-1A91B6023A77";
createNode transform -n "posers" -p "mod";
	rename -uid "4295F9C2-4F7B-E34F-ECAD-1FB25E9C5061";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "079BBC3E-46A2-E93B-5E9D-58814DF8C9A7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -k on ".globalSize" 0.5;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "C85FD3BD-4B15-B4FD-5AE1-EF966DC407CB";
	setAttr -k off ".v";
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "07E5E7A8-424A-D812-4CD5-828825C1FF46";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "F302DA9A-496E-99CA-7D7C-8898CAEE0A31";
	setAttr -k off ".v";
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
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "D42C93A6-4720-DDFD-210D-80844B464A42";
	setAttr ".v" no;
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "DD5A073D-42A9-193F-7CFB-BDAB95E24301";
	setAttr -k off ".v";
createNode transform -n "main_initLoc" -p "root_poser";
	rename -uid "FBB28FEC-452E-F460-A5F5-0EBE0B7700F0";
	setAttr ".v" no;
createNode locator -n "main_initLocShape" -p "main_initLoc";
	rename -uid "2A22777D-4C95-5898-DB81-C292A3DA57D6";
	setAttr -k off ".v";
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "2F641722-415B-5F16-F4A3-BBB55E60E337";
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
	rename -uid "F1C1A08E-474D-D9B6-0595-B8B115E421AF";
	setAttr ".v" no;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "5A09486A-40B0-2F1E-DAF7-76A29B2D11D1";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "input" -p "mod";
	rename -uid "B3EAAA1D-4341-4BF3-DD9D-038012C172E3";
	setAttr ".v" no;
createNode transform -n "root_connector" -p "input";
	rename -uid "53A087BF-4AEA-ADFA-346D-888D9621DCFC";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "51A6D925-4273-74C5-6072-B4AD63BD808A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "controls" -p "mod";
	rename -uid "7A32981C-491F-A0A0-AB59-0291C69C1B40";
	setAttr ".ove" yes;
createNode transform -n "main_group" -p "controls";
	rename -uid "6F396B91-4842-341B-CED5-D097F2681FD4";
createNode transform -n "main" -p "main_group";
	rename -uid "58B207EC-4F15-FFEB-989A-BF8B5341D3BA";
	setAttr -l on -k off ".v";
	setAttr ".ro" 3;
	setAttr -k on ".s";
createNode nurbsCurve -n "mainShape" -p "main";
	rename -uid "E314EC1C-4BF3-46CD-72CB-73B003706BCA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 2;
	setAttr ".cc" -type "nurbsCurve" 
		3 14 2 no 3
		19 -2 -1 0 1 2 3 3.5706374099999998 3.7794248079999999 3.8825758719999999 4
		 4.0834058190000002 4.2257475839999996 4.3545802140000003 5 6 7 8 9 10
		17
		5.4450295448450108 0.0099117386068619771 -5.5439429010541055
		-8.7852751686401467e-16 0.0099117386068621246 -7.7993479860510426
		-5.4450295448449957 0.0099117386068619771 -5.5439429010541055
		-7.7004346298419524 0.009911738606861618 -0.098913356209118508
		-5.7678250677761795 0.0099117386068613422 4.5668188593021348
		-2.9443068365842349 0.0099117386068612329 6.3388382409793582
		-1.3868575315361322 0.0099117386068611948 6.7606909619264108
		-0.37336725584029634 0.0099117386068611948 7.2666236286474435
		-0.03042554342138469 0.0099117386068611948 8.0771270292623587
		0.38364767727358545 0.0099117386068611948 7.2407646468872864
		1.2011339185849073 0.0099117386068611948 6.7924433890317495
		2.8257579354416418 0.0099117386068612329 6.4002169302036336
		5.7116035507433036 0.0099117386068613388 4.7025496082200293
		7.7004346298419524 0.009911738606861618 -0.098913356209111417
		5.4450295448450108 0.0099117386068619771 -5.5439429010541055
		-8.7852751686401467e-16 0.0099117386068621246 -7.7993479860510426
		-5.4450295448449957 0.0099117386068619771 -5.5439429010541055
		;
createNode joint -n "main_outJoint" -p "main";
	rename -uid "1726AB17-4251-26E3-6B2B-13993A52004A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr -k on -cb off ".radi";
createNode transform -n "root_group" -p "main";
	rename -uid "73C2A4AD-4CCD-CA3D-9682-EEAF0312A343";
createNode transform -n "root" -p "root_group";
	rename -uid "F26C6DA9-4748-7D8A-3D92-7ABE72C6C83B";
	setAttr -l on -k off ".v";
	setAttr ".ro" 3;
	setAttr -k on ".s";
createNode nurbsCurve -n "rootShape" -p "root";
	rename -uid "61D0D67D-4C64-160B-F65D-9AA3E9F58A22";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".cc" -type "nurbsCurve" 
		3 14 2 no 3
		19 -2 -1 0 1 2 3 3.5706374099999998 3.7794248079999999 3.8825758719999999 4
		 4.0834058190000002 4.2257475839999996 4.3545802140000003 5 6 7 8 9 10
		17
		4.1622906851364174 0.0099117386068618887 -4.2051824918184018
		-6.7156419813021589e-16 0.0099117386068620205 -5.9292597441411043
		-4.1622906851364077 0.0099117386068618887 -4.2051824918184018
		-5.8863679374591715 0.0099117386068616337 -0.042891806681939197
		-4.4090421099422592 0.0099117386068614515 3.5236882421534821
		-2.2506876811532326 0.009911738606861337 4.8782556885724233
		-1.0601419400174159 0.0099117386068613023 5.200728438524588
		-0.2854094800257399 0.0099117386068613023 5.5874735991625029
		-0.023257900610096464 0.0099117386068613023 6.2070387873522979
		0.29326804204430224 0.0099117386068613023 5.5677064706243122
		0.91817105485874706 0.0099117386068613023 5.2250006358529619
		2.1600665040053504 0.009911738606861337 4.9251747997214217
		4.3660652454968325 0.0099117386068614446 3.6274435711658519
		5.8863679374591715 0.0099117386068616337 -0.042891806681933264
		4.1622906851364174 0.0099117386068618887 -4.2051824918184018
		-6.7156419813021589e-16 0.0099117386068620205 -5.9292597441411043
		-4.1622906851364077 0.0099117386068618887 -4.2051824918184018
		;
createNode joint -n "root_ctrlJoint" -p "root";
	rename -uid "586C4655-4DE2-150C-7B24-2D9F93AF9000";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr -l on -k off ".v" no;
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr -k on -cb off ".radi";
createNode transform -n "mirror_loc" -p "root";
	rename -uid "88566AEA-43C0-0FEE-5EC1-0FBE8E0C6DA9";
	setAttr ".v" no;
createNode locator -n "mirror_locShape" -p "mirror_loc";
	rename -uid "95C63BF1-41FC-148C-2AAF-DD89937FD62D";
	setAttr -k off ".v";
createNode transform -n "system" -p "mod";
	rename -uid "E33BEB84-4823-1A88-CA87-4EADCFD8F828";
createNode transform -n "output" -p "mod";
	rename -uid "6F030D73-420A-1DA9-DB36-3AB8C9C07059";
createNode transform -n "outJoints" -p "output";
	rename -uid "C606F955-4361-424E-A57C-129E07CFCFD5";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "E7BBDE73-43F0-56F2-D706-6EBCB2CEEDD8";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr -k on -cb off ".radi";
createNode transform -s -n "persp";
	rename -uid "5D24B4F0-48F4-0BBF-2883-0FB107072B31";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 13.108504060185028 18.697073409806656 25.934736231950872 ;
	setAttr ".r" -type "double3" -37.200000000000308 -330.79999999999848 -1.821786138925029e-15 ;
	setAttr ".rp" -type "double3" -6.9388939039072284e-18 1.1102230246251563e-16 2.2204460492503131e-16 ;
	setAttr ".rpt" -type "double3" -2.0710120022049341e-16 1.3723218949214615e-17 -2.394600998630024e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "FA06188C-40FD-4EF2-A7A8-2DBD9ED48E1A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 33.463712569850323;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 1.0415922415595477e-16 1.5543122344752192e-14 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "3DE8336C-402E-ED89-1A73-7CB6566A0C09";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.10467888827845367 46.623169178462668 2.667130745665756 ;
	setAttr ".r" -type "double3" -90 -360 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "C13A0A32-480E-FAB4-7DDB-61860D3B1DFF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 48.158226768396339;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F8E080BB-4C63-C9FB-C0BB-C192650A2817";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.9450453772457408 2.8406349788063636 334.01348314480049 ;
	setAttr ".r" -type "double3" 0 -360 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "6248469F-456A-6944-C2F4-05B8C7F589E8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 333.78439972524205;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "440099C0-42D1-A499-B20D-69A0F18CA0CA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.0699600043254431 -0.18480748037566552 -0.24181561130914625 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F5BCB2FD-493B-2B40-AFE4-FDB54C16EA4A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.6409172568145158;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "FE0B7A72-490A-8201-883F-DE8618D0D442";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "4840B9B4-4080-7330-A80F-7DA819B1B80A";
createNode displayLayer -n "defaultLayer";
	rename -uid "6684CFD7-4C9D-D20C-7922-43B1C9C96070";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "044C03FB-4AD0-7D09-4C04-3B96AB964588";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "C8562179-48C0-C6E6-EC2D-C98541679724";
	setAttr ".g" yes;
createNode objectSet -n "sets";
	rename -uid "C81ADCD3-4BF1-7A81-A8D9-B59FF0130DB8";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
createNode objectSet -n "moduleControlSet";
	rename -uid "3C698155-41CE-4B09-5C32-868CCF93B68F";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "root_decomposeMatrix";
	rename -uid "0A52AEE4-40D1-DEF0-8BB4-DD854B606741";
createNode condition -n "mirror_condition";
	rename -uid "046D833C-46E8-6A1C-3AFC-6DA814814DD6";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
createNode multMatrix -n "root_multMatrix";
	rename -uid "23740F9F-4543-F65A-C842-1983E844881B";
	setAttr -s 3 ".i";
createNode composeMatrix -n "mirror_composeMatrix";
	rename -uid "8601AEBA-4FFA-F757-28D1-89B9B30A9E2B";
createNode decomposeMatrix -n "root_ctrJoint_decomposeMatrix";
	rename -uid "B23DF042-4920-972E-B34E-3495D2664628";
createNode condition -n "mirror_condition_2";
	rename -uid "C14BE3DD-4E3F-73D0-B072-C09B20E45DCB";
	setAttr ".op" 2;
createNode multDoubleLinear -n "negate";
	rename -uid "7FC27DA1-4067-DA67-BBB0-2E9270F8A353";
	setAttr ".i2" -1;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "C1D12813-499E-247F-DB1F-65B8BF6E9490";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C5EE427A-4B2A-E58E-F518-6AB6405FDF6E";
createNode multiplyDivide -n "size_multiplyDivide";
	rename -uid "6E7D770B-40F8-7736-8F57-758A20381435";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "4DB49BAA-4AFF-D2AA-7FEB-42B04108499D";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "96D17248-4392-5B22-1222-C1BBF0D4D123";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 3162.0788522829125 -742.01506923738589 ;
	setAttr ".tgi[0].vh" -type "double2" 8207.4232123874026 829.26825973076689 ;
	setAttr ".tgi[0].ni[0].x" 1441.4285888671875;
	setAttr ".tgi[0].ni[0].y" 120;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "96EB0403-4507-2F95-D609-7EBE26F40E1C";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 120 -ast 0 -aet 140 ";
	setAttr ".st" 6;
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "AE4CAE16-454B-3885-E019-E5B16B2D83D3";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode objectSet -n "skinJointsSet";
	rename -uid "09D0240C-4CC7-3B06-C27A-EBB3A244B268";
	setAttr ".ihi" 0;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "8E398D3B-4573-B4D1-ADD1-5EAD478C46A1";
	setAttr -s 2 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -7095.2836008426457 -7851.1901642122129 ;
	setAttr ".tgi[0].vh" -type "double2" 9679.8073076667097 9472.6186712110029 ;
	setAttr -s 7 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 817.76416015625;
	setAttr ".tgi[0].ni[0].y" 764.36651611328125;
	setAttr ".tgi[0].ni[0].nvs" 18305;
	setAttr ".tgi[0].ni[1].x" 1487.5869140625;
	setAttr ".tgi[0].ni[1].y" 943.16876220703125;
	setAttr ".tgi[0].ni[1].nvs" 18305;
	setAttr ".tgi[0].ni[2].x" 881.4285888671875;
	setAttr ".tgi[0].ni[2].y" 945.71429443359375;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 1823.175537109375;
	setAttr ".tgi[0].ni[3].y" 922.850341796875;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" 819.11871337890625;
	setAttr ".tgi[0].ni[4].y" 497.68133544921875;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 1188.5714111328125;
	setAttr ".tgi[0].ni[5].y" 842.93115234375;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" 574.28570556640625;
	setAttr ".tgi[0].ni[6].y" 945.71429443359375;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -3384.178921762692 -5633.3331094847881 ;
	setAttr ".tgi[1].vh" -type "double2" 3879.4169973217936 1867.8570686351716 ;
	setAttr -s 7 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -223.85758972167969;
	setAttr ".tgi[1].ni[0].y" -1549.5794677734375;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" 392.99984741210938;
	setAttr ".tgi[1].ni[1].y" -1402.9998779296875;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" -235.43038940429688;
	setAttr ".tgi[1].ni[2].y" -1345.138916015625;
	setAttr ".tgi[1].ni[2].nvs" 18305;
	setAttr ".tgi[1].ni[3].x" 701.4285888671875;
	setAttr ".tgi[1].ni[3].y" -1345.2861328125;
	setAttr ".tgi[1].ni[3].nvs" 18305;
	setAttr ".tgi[1].ni[4].x" -220;
	setAttr ".tgi[1].ni[4].y" -1225.708251953125;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 87.142860412597656;
	setAttr ".tgi[1].ni[5].y" -1404.2857666015625;
	setAttr ".tgi[1].ni[5].nvs" 18305;
	setAttr ".tgi[1].ni[6].x" -527.14288330078125;
	setAttr ".tgi[1].ni[6].y" -1378.5714111328125;
	setAttr ".tgi[1].ni[6].nvs" 18304;
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
	setAttr -k on ".laa" yes;
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
	setAttr -s 7 ".u";
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
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "root_poser.sx" "root_poser.sy" -l on;
connectAttr "root_poser.sx" "root_poser.sz" -l on;
connectAttr "makeNurbSphere1.os" "root_poserShape.cr";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sx";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sy";
connectAttr "size_multiplyDivide.oy" "mainPoser_clusterHandle.sz";
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector.wm" "controls.opm";
connectAttr "root_ctrJoint_decomposeMatrix.osx" "outJoints.sx";
connectAttr "root_ctrJoint_decomposeMatrix.osy" "outJoints.sy";
connectAttr "mirror_condition_2.ocr" "outJoints.sz";
connectAttr "root_decomposeMatrix.or" "root_outJoint.r";
connectAttr "root_decomposeMatrix.ot" "root_outJoint.t";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "root.iog" "moduleControlSet.dsm" -na;
connectAttr "main.iog" "moduleControlSet.dsm" -na;
connectAttr "root_multMatrix.o" "root_decomposeMatrix.imat";
connectAttr "mirror_composeMatrix.omat" "root_multMatrix.i[0]";
connectAttr "root_ctrlJoint.wm" "root_multMatrix.i[1]";
connectAttr "outJoints.wim" "root_multMatrix.i[2]";
connectAttr "mirror_condition.ocr" "mirror_composeMatrix.isx";
connectAttr "root_ctrlJoint.wm" "root_ctrJoint_decomposeMatrix.imat";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "mirror_condition_2.ft";
connectAttr "negate.o" "mirror_condition_2.cfr";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "mirror_condition_2.ctr";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "negate.i1";
connectAttr "root_poser.size" "size_multiplyDivide.i1x";
connectAttr "mainPoser.size" "size_multiplyDivide.i1y";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2x";
connectAttr "mainPoser.globalSize" "size_multiplyDivide.i2y";
connectAttr "size_multiplyDivide.ox" "makeNurbSphere1.r";
connectAttr "size_multiplyDivide.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "root_ctrlJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "mirror_composeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "root_ctrlJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn";
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "mirror_composeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "root_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_composeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_ctrJoint_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "mirror_condition_2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "negate.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "size_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of root.ma
