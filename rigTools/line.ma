//Maya ASCII 2013 scene
//Name: line.ma
//Last modified: Mon, Mar 04, 2019 10:42:15 AM
//Codeset: 1251
requires maya "2013";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201209210409-845513";
fileInfo "osv" "Microsoft , 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2014156648505361 1.3879815967974984 2.6456118975726031 ;
	setAttr ".r" -type "double3" -16.199999999999008 25.60000000000171 -4.4084608122057521e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 2.8456747974425767;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2957232838894941e-006 4.2630397588342266 0.0093799548261495336 ;
	setAttr ".r" -type "double3" -90 90 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 3.9437286892582062;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.9437300094474455 0.31931106361357875 0.0093790766983312401 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 4.7437286892582042;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "line";
	setAttr ".it" no;
createNode nurbsSurface -n "lineShape" -p "line";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
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
createNode nurbsSurface -n "lineShapeOrig" -p "line";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		1 3 0 2 no 
		3 0 0.5 1
		13 -0.25 -0.125 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1.125 1.25
		
		33
		0.039180582291033009 1.8153606794759783e-023 -0.039180581279618341
		0.055409708854483493 -9.0768033935379879e-024 -7.8689626964161542e-017
		0.039180582291033023 1.8153606791423262e-023 0.039180581279618563
		-5.4824981419926088e-010 -2.2497731214790534e-023 0.055409710804570377
		-0.039180580936968003 3.4375584575921169e-023 0.039180581279618543
		-0.055409711088984376 -4.8839375296749955e-023 -1.2736003328766266e-016
		-0.039180580936967982 2.9660622775938732e-023 -0.03918058127961821
		-5.48249876368676e-010 5.5511083640532906e-017 -0.055409710804570661
		0.039180582291033009 1.8153606794759783e-023 -0.039180581279618341
		0.055409708854483493 -9.0768033935379879e-024 -7.8689626964161542e-017
		0.039180582291033023 1.8153606791423262e-023 0.039180581279618563
		0.039179773409735871 -3.1641356201816961e-015 -0.039179668258660989
		0.055410199570875202 3.7747582837255314e-015 5.9135241337396332e-008
		0.039179691678180389 -3.0531133177191805e-015 0.039179538731827085
		-6.2871358919006749e-008 -7.7715611723760958e-016 0.055410467716909863
		-0.039179535809471699 1.6653345369377348e-015 0.039179562957482233
		-0.055410481618168979 -3.7192471324942744e-015 1.0729797622014562e-008
		-0.039179530313321879 2.2204460492503131e-016 -0.039179589451780475
		-8.1728339888603168e-008 -5.5511151231257827e-016 -0.055410419818623741
		0.039179773409735871 -3.1641356201816961e-015 -0.039179668258660989
		0.055410199570875202 3.7747582837255314e-015 5.9135241337396332e-008
		0.039179691678180389 -3.0531133177191805e-015 0.039179538731827085
		0.039180582291033016 1.000000000000004 -0.039180581279618272
		0.055409708854483486 0.99999999999999811 -7.413082817554288e-017
		0.039180582291033023 1.000000000000004 0.039180581279618536
		-5.4824981265769659e-010 0.999999999999999 0.055409710804570425
		-0.039180580936968003 1.0000000000000016 0.039180581279618543
		-0.055409711088984376 1 -1.2747378272236624e-016
		-0.039180580936967982 1.0000000000000018 -0.039180581279618168
		-5.4824987854331119e-010 0.99999999999999822 -0.05540971080457073
		0.039180582291033016 1.000000000000004 -0.039180581279618272
		0.055409708854483486 0.99999999999999811 -7.413082817554288e-017
		0.039180582291033023 1.000000000000004 0.039180581279618536
		
		;
createNode transform -n "line_start_cluster_group";
createNode transform -n "line_start_cluster" -p "line_start_cluster_group";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -1.4102364688864388e-007 2.7755575615628914e-017 2.3949143057588884e-008 ;
	setAttr ".sp" -type "double3" -1.4102364688864388e-007 2.7755575615628914e-017 2.3949143057588884e-008 ;
createNode clusterHandle -n "line_start_clusterShape" -p "line_start_cluster";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -1.4102364688864388e-007 2.7755575615628914e-017 2.3949143057588884e-008 ;
createNode aimConstraint -n "line_start_cluster_aimConstraint1" -p "line_start_cluster";
	addAttr -ci true -sn "w0" -ln "line_end_cluster_groupW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "line_end_cluster_group";
	setAttr ".t" -type "double3" 0 1 0 ;
createNode transform -n "line_end_cluster" -p "line_end_cluster_group";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -1.1172504449374898e-009 -1.1657341758564144e-015 
		-1.5265566588595902e-016 ;
	setAttr ".sp" -type "double3" -1.1172504449374898e-009 -1.1657341758564144e-015 
		-1.5265566588595902e-016 ;
createNode clusterHandle -n "line_end_clusterShape" -p "line_end_cluster";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -1.1172504449374898e-009 -1.1657341758564144e-015 
		-1.5265566588595902e-016 ;
createNode aimConstraint -n "line_end_cluster_aimConstraint1" -p "line_end_cluster";
	addAttr -ci true -sn "w0" -ln "line_start_cluster_groupW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 8.7465253642526133e-015 -8.7465253740246814e-015 
		-89.99999993598621 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode cluster -n "line_start_clusterCluster";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode tweak -n "tweak1";
	setAttr -s 9 ".pl[0].cp";
	setAttr ".pl[0].cp[22]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[23]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[24]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[25]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[26]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[27]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[28]" -type "double3" 0 -1.0000000000000022 0 ;
	setAttr ".pl[0].cp[29]" -type "double3" 0 -1.0000000000000022 0 ;
createNode objectSet -n "cluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:1][0:7]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
createNode cluster -n "line_end_clusterCluster";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode objectSet -n "cluster2Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster2GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster2GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2][0:7]";
createNode surfaceShader -n "line_rsMat";
createNode shadingEngine -n "surfaceShader1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "cluster1GroupId.id" "lineShape.iog.og[0].gid";
connectAttr "cluster1Set.mwc" "lineShape.iog.og[0].gco";
connectAttr "groupId2.id" "lineShape.iog.og[1].gid";
connectAttr "tweakSet1.mwc" "lineShape.iog.og[1].gco";
connectAttr "cluster2GroupId.id" "lineShape.iog.og[2].gid";
connectAttr "cluster2Set.mwc" "lineShape.iog.og[2].gco";
connectAttr "line_end_clusterCluster.og[0]" "lineShape.cr";
connectAttr "tweak1.pl[0].cp[0]" "lineShape.twl";
connectAttr "line_start_cluster_aimConstraint1.crx" "line_start_cluster.rx";
connectAttr "line_start_cluster_aimConstraint1.cry" "line_start_cluster.ry";
connectAttr "line_start_cluster_aimConstraint1.crz" "line_start_cluster.rz";
connectAttr "line_start_cluster.pim" "line_start_cluster_aimConstraint1.cpim";
connectAttr "line_start_cluster.t" "line_start_cluster_aimConstraint1.ct";
connectAttr "line_start_cluster.rp" "line_start_cluster_aimConstraint1.crp";
connectAttr "line_start_cluster.rpt" "line_start_cluster_aimConstraint1.crt";
connectAttr "line_start_cluster.ro" "line_start_cluster_aimConstraint1.cro";
connectAttr "line_end_cluster_group.t" "line_start_cluster_aimConstraint1.tg[0].tt"
		;
connectAttr "line_end_cluster_group.rp" "line_start_cluster_aimConstraint1.tg[0].trp"
		;
connectAttr "line_end_cluster_group.rpt" "line_start_cluster_aimConstraint1.tg[0].trt"
		;
connectAttr "line_end_cluster_group.pm" "line_start_cluster_aimConstraint1.tg[0].tpm"
		;
connectAttr "line_start_cluster_aimConstraint1.w0" "line_start_cluster_aimConstraint1.tg[0].tw"
		;
connectAttr "line.wm" "line_start_cluster_aimConstraint1.wum";
connectAttr "line_end_cluster_aimConstraint1.crx" "line_end_cluster.rx";
connectAttr "line_end_cluster_aimConstraint1.cry" "line_end_cluster.ry";
connectAttr "line_end_cluster_aimConstraint1.crz" "line_end_cluster.rz";
connectAttr "line_end_cluster.pim" "line_end_cluster_aimConstraint1.cpim";
connectAttr "line_end_cluster.t" "line_end_cluster_aimConstraint1.ct";
connectAttr "line_end_cluster.rp" "line_end_cluster_aimConstraint1.crp";
connectAttr "line_end_cluster.rpt" "line_end_cluster_aimConstraint1.crt";
connectAttr "line_end_cluster.ro" "line_end_cluster_aimConstraint1.cro";
connectAttr "line_start_cluster_group.t" "line_end_cluster_aimConstraint1.tg[0].tt"
		;
connectAttr "line_start_cluster_group.rp" "line_end_cluster_aimConstraint1.tg[0].trp"
		;
connectAttr "line_start_cluster_group.rpt" "line_end_cluster_aimConstraint1.tg[0].trt"
		;
connectAttr "line_start_cluster_group.pm" "line_end_cluster_aimConstraint1.tg[0].tpm"
		;
connectAttr "line_end_cluster_aimConstraint1.w0" "line_end_cluster_aimConstraint1.tg[0].tw"
		;
connectAttr "line.wm" "line_end_cluster_aimConstraint1.wum";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "cluster1GroupParts.og" "line_start_clusterCluster.ip[0].ig";
connectAttr "cluster1GroupId.id" "line_start_clusterCluster.ip[0].gi";
connectAttr "line_start_cluster.wm" "line_start_clusterCluster.ma";
connectAttr "line_start_clusterShape.x" "line_start_clusterCluster.x";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId2.id" "tweak1.ip[0].gi";
connectAttr "cluster1GroupId.msg" "cluster1Set.gn" -na;
connectAttr "lineShape.iog.og[0]" "cluster1Set.dsm" -na;
connectAttr "line_start_clusterCluster.msg" "cluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "cluster1GroupParts.ig";
connectAttr "cluster1GroupId.id" "cluster1GroupParts.gi";
connectAttr "groupId2.msg" "tweakSet1.gn" -na;
connectAttr "lineShape.iog.og[1]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "lineShapeOrig.ws" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "cluster2GroupParts.og" "line_end_clusterCluster.ip[0].ig";
connectAttr "cluster2GroupId.id" "line_end_clusterCluster.ip[0].gi";
connectAttr "line_end_cluster.wm" "line_end_clusterCluster.ma";
connectAttr "line_end_clusterShape.x" "line_end_clusterCluster.x";
connectAttr "cluster2GroupId.msg" "cluster2Set.gn" -na;
connectAttr "lineShape.iog.og[2]" "cluster2Set.dsm" -na;
connectAttr "line_end_clusterCluster.msg" "cluster2Set.ub[0]";
connectAttr "line_start_clusterCluster.og[0]" "cluster2GroupParts.ig";
connectAttr "cluster2GroupId.id" "cluster2GroupParts.gi";
connectAttr "line_rsMat.oc" "surfaceShader1SG.ss";
connectAttr "lineShape.iog" "surfaceShader1SG.dsm" -na;
connectAttr "surfaceShader1SG.msg" "materialInfo1.sg";
connectAttr "line_rsMat.msg" "materialInfo1.m";
connectAttr "line_rsMat.msg" "materialInfo1.t" -na;
connectAttr "surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "line_rsMat.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of line.ma
