//Maya ASCII 2022 scene
//Name: spineQuadrupped.ma
//Last modified: Fri, Apr 25, 2025 07:43:09 AM
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
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26100)";
fileInfo "UUID" "98B68723-45E5-B347-EFBF-0885EBF5BAB7";
createNode transform -n "mod";
	rename -uid "21028BB9-40DB-EA4B-6EA3-8AAFB5E35F08";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "slidingJoints" -ln "slidingJoints" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "parent" -ln "parent" -dt "string";
	addAttr -ci true -sn "useClosestInitLocs" -ln "useClosestInitLocs" -min 0 -max 1 
		-at "bool";
	setAttr -l on ".version" -type "string" "1.0";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".moduleType" -type "string" "spine";
	setAttr -l on ".parent" -type "string" "root_root_joint";
	setAttr ".useClosestInitLocs" yes;
createNode transform -n "posers" -p "mod";
	rename -uid "46463B72-4CB1-1274-FBD6-D8B6112578A1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "DC5E3836-42DC-DE2D-A636-A5A29ECE903E";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	addAttr -ci true -sn "globalSize" -ln "globalSize" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 0 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".moduleType" -type "string" "foot";
	setAttr -k on ".globalSize" 0.5;
	setAttr -k on ".lineWidth" 0.1;
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "9F1F867E-45FC-05D2-78EA-CBB22552D0DA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr ".tw" yes;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "DD28802A-4E37-34C6-3B73-4EA9D4DE3547";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0 -5 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "root_poserShape" -p "root_poser";
	rename -uid "EA3C773C-492A-E7FD-43E7-52B23F65713F";
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
createNode transform -n "root_poserOrient" -p "root_poser";
	rename -uid "6C652873-44BA-2E11-C718-30BB356B6C34";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "root_poserOrientShape" -p "root_poserOrient";
	rename -uid "C30AFC27-4705-0521-39F6-4580CC938ED4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "pelvis_initLoc" -p "root_poser";
	rename -uid "DF80A298-4A4A-09E3-010C-31981CD9FF37";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "pelvis_initLocShape" -p "pelvis_initLoc";
	rename -uid "E656B569-4E0F-4EA2-7764-278592E99BF4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "hips_initLoc" -p "root_poser";
	rename -uid "4573D6A1-47E9-3C27-F099-3B91E545DAAD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "hips_initLocShape" -p "hips_initLoc";
	rename -uid "C37B19AF-4890-9E6C-AFD1-6595D0B4C9F4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "spineRoot_initLoc" -p "root_poser";
	rename -uid "2340122A-4FFE-7822-4D9A-EF8B703F972F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "spineRoot_initLocShape" -p "spineRoot_initLoc";
	rename -uid "27C79F85-4CFA-9CC4-7A39-14B412B70C9C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_1_initLoc" -p "root_poser";
	rename -uid "A50177F0-466C-32F6-BFDC-E1A379FDCD82";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_1_initLocShape" -p "fk_1_initLoc";
	rename -uid "08533F6A-4065-479E-8AA1-03B5E186B9FC";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_2_initLoc" -p "fk_1_initLoc";
	rename -uid "F3AF6A6D-4BF3-CE44-D6A6-C28815F40B78";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_2_initLocShape" -p "fk_2_initLoc";
	rename -uid "8CF6E873-4592-4688-3298-B093F1CE1B00";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_3_initLoc" -p "fk_2_initLoc";
	rename -uid "8F9298B4-4C76-DE81-132B-78B4C44DED1A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_3_initLocShape" -p "fk_3_initLoc";
	rename -uid "B883B451-456D-590C-F4A6-858406E4B98D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "stomach_initLoc" -p "fk_2_initLoc";
	rename -uid "16F5C55A-4353-84C7-A4E1-0D86A0B06133";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "stomach_initLocShape" -p "stomach_initLoc";
	rename -uid "C630C1CB-4218-5038-B825-6CAB687B15EA";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "fk_hips_initLoc" -p "root_poser";
	rename -uid "B731ABE9-40AC-C02A-7CDC-A28572E6A793";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_hips_initLocShape" -p "fk_hips_initLoc";
	rename -uid "569BE3F5-4786-FB2C-B703-72948B832C9B";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_initLoc" -p "root_poser";
	rename -uid "B6E63209-4906-C2EC-CFBE-5C9CF3E101CC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" -9.3074452277290208e-16 0 2.3268613069322532e-16 ;
	setAttr ".r" -type "double3" 90 -6.3611093629270335e-15 89.999999999999986 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "root_initLocShape" -p "root_initLoc";
	rename -uid "54FA7FC0-4C40-8E73-685C-3C95E324EAC4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "root_poserOrient_offset" -p "root_poser";
	rename -uid "77648742-4C02-B901-163B-5385F15F3EFA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "root_poserOrient_offsetShape" -p "root_poserOrient_offset";
	rename -uid "5952671E-46E2-0DAF-5BF2-4C979B050029";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "end_poser" -p "mainPoser";
	rename -uid "BD2C343E-4374-FABD-2E36-D8A92DCB2ADC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t" -type "double3" 0 0 5 ;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "end_poserShape" -p "end_poser";
	rename -uid "CC791F48-45D6-76B1-B7CA-3693AB15B937";
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
createNode transform -n "end_poserOrient" -p "end_poser";
	rename -uid "EC8F4224-4AC4-E2D0-79F6-65A00BFA4B96";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "end_poserOrientShape" -p "end_poserOrient";
	rename -uid "C56DF181-45A8-E0E3-A328-EAB8ADFD8AC4";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "end_poserOrient_aimConstraint1" -p "end_poserOrient";
	rename -uid "4166BE2B-4678-BC5C-0DF2-01BA80CF6139";
	addAttr -ci true -sn "w0" -ln "root_poserW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 0 22.86844571111962 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "end_initLoc" -p "end_poser";
	rename -uid "DE857096-452E-B362-1B35-2FB92A05B8E0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 89.999999999999972 -6.3611093629270304e-15 89.999999999999972 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "end_initLocShape" -p "end_initLoc";
	rename -uid "59543535-4F91-2280-DA03-5BB6B337EE13";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "chest_initLoc" -p "end_poser";
	rename -uid "B0217340-415F-AA27-B8FC-BF9155DAF3E5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "chest_initLocShape" -p "chest_initLoc";
	rename -uid "DA05DC64-417B-C84E-A3BA-8D8D8D90118F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "local_1_poser_group" -p "mainPoser";
	rename -uid "B4560324-40D4-BADE-6CC1-C0AD756DFEBC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_1_poser" -p "local_1_poser_group";
	rename -uid "D4E6B8CC-4794-2F80-ADEE-DFBE5C254EEC";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "local_1_poserShape" -p "local_1_poser";
	rename -uid "96958AE2-406F-9BC5-1519-368A65FF7F12";
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
createNode transform -n "local_1_poserOrient" -p "local_1_poser";
	rename -uid "482C9E04-4D8B-E274-B0F6-1888B27F05D2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_1_poserOrientShape" -p "local_1_poserOrient";
	rename -uid "4424E79B-498E-A1EA-466D-7BB240A88D3D";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "local_1_poser_group_pointConstraint1" -p "local_1_poser_group";
	rename -uid "A137D719-481F-120E-D00D-2AAE5CE72475";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "end_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.20483;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_2_poser_group" -p "mainPoser";
	rename -uid "830DD752-4B98-1B15-9090-F085EF2C90E0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_2_poser" -p "local_2_poser_group";
	rename -uid "9989854F-4200-97C5-A806-79BC1616E804";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "local_2_poserShape" -p "local_2_poser";
	rename -uid "82B5D036-4719-1DAB-301A-8EB6B49DE9EC";
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
createNode transform -n "local_2_poserOrient" -p "local_2_poser";
	rename -uid "E275FD74-4F6C-D2FC-8B7C-FCB8DA1AB9B3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_2_poserOrientShape" -p "local_2_poserOrient";
	rename -uid "9AFA34EC-428E-B93E-292C-6597DF635AA8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "local_2_poser_group_pointConstraint1" -p "local_2_poser_group";
	rename -uid "D2115825-4377-1710-CC8E-7AA3FAAC8C54";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "end_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.4925;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_3_poser_group" -p "mainPoser";
	rename -uid "1ED122AA-41F0-48CF-FE50-88A29301E82C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_3_poser" -p "local_3_poser_group";
	rename -uid "4E466497-47A7-47D2-0CE5-4FB020514CF7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "local_3_poserShape" -p "local_3_poser";
	rename -uid "741943A0-4515-58DA-8134-26A47E10E404";
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
createNode transform -n "local_3_poserOrient" -p "local_3_poser";
	rename -uid "73741BFF-4C86-6435-9AC5-17B7C4699ADC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_3_poserOrientShape" -p "local_3_poserOrient";
	rename -uid "4D749E87-43D1-DE27-D411-B588215B9E83";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "local_3_poser_group_pointConstraint1" -p "local_3_poser_group";
	rename -uid "B238D2E9-4137-A68F-0F98-1C8D5CEF5F33";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "end_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_4_poser_group" -p "mainPoser";
	rename -uid "8B388379-42F8-7801-4C99-5EB3BD9D63BF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_4_poser" -p "local_4_poser_group";
	rename -uid "0F100840-44A2-0214-6FB2-D8BB0E2BA780";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "local_4_poserShape" -p "local_4_poser";
	rename -uid "06D65459-4B24-FA28-AEA1-33852BBA5E63";
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
createNode transform -n "local_4_poserOrient" -p "local_4_poser";
	rename -uid "F4B2907D-43D0-84A8-F70B-3F8FB2EEBF83";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_4_poserOrientShape" -p "local_4_poserOrient";
	rename -uid "F9318F5B-448B-73F1-3FCC-60A120CEDC4F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "local_4_poser_group_pointConstraint1" -p "local_4_poser_group";
	rename -uid "0FD3DB56-4F3F-EFDF-CFB6-5CBD85D790C0";
	addAttr -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "root_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 4.1266343000499823 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.4925;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_5_poser_group" -p "mainPoser";
	rename -uid "03071403-4AA8-00BB-4279-0192B1AE3BAF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_5_poser" -p "local_5_poser_group";
	rename -uid "D9896E3E-4933-7BFF-5C15-A4BC510D0302";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovc" 4;
	setAttr -k on ".t";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dh" yes;
	setAttr -k on ".size" 0.3;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "local_5_poserShape" -p "local_5_poser";
	rename -uid "AAB999D9-488C-F960-9F06-44AD4F09FE8A";
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
createNode transform -n "local_5_poserOrient" -p "local_5_poser";
	rename -uid "E3A05B7A-4F47-2228-4EE0-09BD9BC32E1C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_5_poserOrientShape" -p "local_5_poserOrient";
	rename -uid "8771D7A7-40CF-08DF-B92F-3A9BA4DF2A9F";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "local_5_poser_group_pointConstraint1" -p "local_5_poser_group";
	rename -uid "F237F4C7-4934-1C46-4FDB-B98C3E107184";
	addAttr -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "root_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 4.5616252556883001 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1" 0.20482;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_3_pivot_loc" -p "mainPoser";
	rename -uid "D8155D8F-4F1C-AC45-0B7E-5286D4B7E1A9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_3_pivot_locShape" -p "fk_3_pivot_loc";
	rename -uid "D9ABECD4-4CAA-3732-3D83-ADAA080993E6";
	setAttr -k off ".v";
createNode pointConstraint -n "fk_bone_3_pivot_loc_pointConstraint1" -p "fk_3_pivot_loc";
	rename -uid "B004C6D2-4FD9-A64F-6FB6-9494E4999460";
	addAttr -ci true -k true -sn "w0" -ln "spine_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "spine_4_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" -1.0630563755019979 3.7469295993560832 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_2_pivot_loc" -p "mainPoser";
	rename -uid "B07A3697-4AAB-FE4E-44B3-3CB067D9D480";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_2_pivot_locShape" -p "fk_2_pivot_loc";
	rename -uid "61B41353-4759-8AAC-F159-AEBB84A67955";
	setAttr -k off ".v";
createNode pointConstraint -n "fk_bone_2_pivot_loc_pointConstraint1" -p "fk_2_pivot_loc";
	rename -uid "0647E984-4BA9-8B12-8CD5-F1BCAE46C541";
	addAttr -ci true -k true -sn "w0" -ln "spine_3_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" -0.24791713074799823 2.4190361422505613 -0.47774230836951315 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_1_pivot_loc" -p "mainPoser";
	rename -uid "597B9D3A-42AC-FFF7-DFBB-9CA4A064EDE7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "fk_1_pivot_locShape" -p "fk_1_pivot_loc";
	rename -uid "B452A55C-4446-D5CF-1B47-B7A95933BEAD";
	setAttr -k off ".v";
createNode pointConstraint -n "fk_bone_1_pivot_loc_pointConstraint1" -p "fk_1_pivot_loc";
	rename -uid "4634B2D4-4C0D-7410-EFA1-DA94E73D18E1";
	addAttr -ci true -k true -sn "w0" -ln "spine_1_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "spine_2_poserW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" -0.12455673472268948 1.2153546717236443 -0.24002384099012977 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_controls_positions" -p "mainPoser";
	rename -uid "25E34A20-47E9-964E-7CF2-A98A56120BFC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k off ".v" no;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 2;
	setAttr -k on ".s" -type "double3" 0.99999999999999989 0.99999999999999967 0.99999999999999967 ;
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 8.8817841970012484e-16 2.2204460492503121e-16 ;
	setAttr ".sp" -type "double3" 0 8.8817841970012523e-16 2.2204460492503131e-16 ;
	setAttr ".spt" -type "double3" 0 -3.9443045261050617e-31 -9.8607613152626443e-32 ;
	setAttr ".hdl" -type "double3" 0 8.8817841970012523e-16 2.2204460492503131e-16 ;
	setAttr ".dh" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_bone_1_group_pos" -p "fk_controls_positions";
	rename -uid "36A6B16A-49E7-29E8-F920-249A6B800AEF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006281e-16 ;
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".hdl" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".dh" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_bone_2_group_pos" -p "fk_bone_1_group_pos";
	rename -uid "81C8930B-477A-49B5-81E5-AF824DD079D8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".hdl" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".dh" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_bone_3_group_pos" -p "fk_bone_2_group_pos";
	rename -uid "2A97C748-4C5E-C0AB-5EF4-589996C29EE8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".hdl" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".dh" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "init_locators_group" -p "mainPoser";
	rename -uid "5FECF195-45EE-2968-895F-08B86122331D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_5_jnt" -p "init_locators_group";
	rename -uid "914736DC-4DC5-7B20-5A76-B58C0E0C231C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2.7755575615628909e-16 4.1500000000000012 0 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_6_posJoint_pointConstraint1" -p "local_5_jnt";
	rename -uid "76C93AED-459F-63AC-B2D1-7FA2076238D0";
	addAttr -ci true -k true -sn "w0" -ln "spine_5_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 4.1493775933609944 0 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_4_jnt" -p "init_locators_group";
	rename -uid "549C4C89-4CE8-372C-F2A5-49A56DB65627";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -2.8275992658421951e-16 3.3499999999999965 1.0673970388119805e-16 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_5_posJoint_pointConstraint1" -p "local_4_jnt";
	rename -uid "D4E55D50-41BE-7285-F77F-A7821E524523";
	addAttr -ci true -k true -sn "w0" -ln "spine_4_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 3.3444816053511706 0 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_3_jnt" -p "init_locators_group";
	rename -uid "3C343AD4-46C5-5E7D-2C90-079ED6A6AD0F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -5.5511151231257827e-17 2.4999999999999991 4.4286948240601633e-16 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_4_posJoint_pointConstraint1" -p "local_3_jnt";
	rename -uid "8636A9AB-4705-06F8-2BE5-818B96A74F1C";
	addAttr -ci true -k true -sn "w0" -ln "spine_3_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 2.5 0 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_2_jnt" -p "init_locators_group";
	rename -uid "85354B69-4251-E960-B4E0-3B889D02320C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.6429192995512955e-17 1.6499999999999979 5.5410862530302947e-16 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_3_posJoint_pointConstraint1" -p "local_2_jnt";
	rename -uid "1A5D6DBC-418D-FEEA-3002-889F66E8D66D";
	addAttr -ci true -k true -sn "w0" -ln "spine_2_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 1.644295302013423 0 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_1_jnt" -p "init_locators_group";
	rename -uid "A80FB8C1-410D-34E0-6014-8C937C4AC84B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2.1770017293856416e-17 0.84999999999999931 4.6680095993436e-20 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_2_posJoint_pointConstraint1" -p "local_1_jnt";
	rename -uid "E99DD90F-4927-EC2F-C57F-B48A97BA091D";
	addAttr -ci true -k true -sn "w0" -ln "spine_1_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 0.85062240663900401 0 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "root_jnt" -p "init_locators_group";
	rename -uid "72131C6F-4697-3E29-1A27-FE998E2C1BA2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_1_posJoint_pointConstraint1" -p "root_jnt";
	rename -uid "5422D31C-42EE-5E3E-1BB5-589B0535280F";
	addAttr -ci true -k true -sn "w0" -ln "root_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "end_jnt" -p "init_locators_group";
	rename -uid "234759DD-4C69-5855-B6D0-38BC66A4D689";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 5 0 1;
	setAttr ".radi" 2.5200000000000005;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "bend_7_posJoint_pointConstraint1" -p "end_jnt";
	rename -uid "57356FAE-4265-B32A-14A7-41826562A118";
	addAttr -ci true -k true -sn "w0" -ln "end_poserW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 5 0 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "init_surf" -p "init_locators_group";
	rename -uid "136C2649-4D45-7DF0-E6E3-B9BD3C15C661";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".sp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".it" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "init_surfShape" -p "init_surf";
	rename -uid "DE6FD1B4-4291-1AEA-9A4E-C3B902779BF6";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode nurbsSurface -n "init_surfShapeOrig" -p "init_surf";
	rename -uid "D8BD9CC9-4A1B-0582-5AAB-0597B53FECE9";
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
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		2 0 1
		
		14
		0.0043710247026231396 0.0041268610836935025 0.22639549533562153
		0.0043710333730571935 0.0041464825218745652 -0.22639549533562059
		-1.2924452225679728e-17 0.86776859504132242 0.22639694415353209
		5.6464486813392554e-17 0.86776859504132253 -0.2263969441535312
		3.5988163824243052e-05 1.644295477543809 0.22639984178935385
		-3.5988163824089529e-05 1.6442951264830361 -0.22639984178935185
		8.2112349705906556e-05 2.5000000300930232 0.22640418824308492
		-8.2112349706017686e-05 2.4999999699069781 -0.22640418824308328
		0.00012811312433879031 3.3444816134180777 0.2264085346968161
		-0.00012811312433919965 3.3444815972842616 -0.22640853469681485
		9.1191646965979259e-05 4.150000003186876 0.22641143233263689
		-0.00022634935980384217 4.1499999968131283 -0.22641143233263575
		0.00013901251779507764 5.0003361092131327 0.22641288115054736
		-0.00020918445288213775 5.0003361063042799 -0.22641288115054639
		
		;
createNode transform -n "joints_initLocs" -p "mainPoser";
	rename -uid "D199DF19-4205-3766-4B7F-29BF83D7019F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".it" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_1_initFollicle" -p "joints_initLocs";
	rename -uid "A5EEE513-4D02-CF0C-E075-BF92E1D764A2";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "local_1_initFollicleShape" -p "local_1_initFollicle";
	rename -uid "52FBC830-4705-6B70-7BD3-66A238FC0C66";
	setAttr -k off ".v";
	setAttr ".pu" 0.10700000077486038;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_1_initLoc" -p "local_1_initFollicle";
	rename -uid "7B617C52-4449-00F4-7E53-FFB2CD1620F9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_1_initLocShape" -p "local_1_initLoc";
	rename -uid "654ADAD7-467C-13E5-A03A-2E84AC20074C";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_1_initLoc_aimConstraint1" -p "local_1_initLoc";
	rename -uid "399C0F80-45DA-8D96-EFCD-6AA9EBC71C19";
	addAttr -ci true -sn "w0" -ln "bone_2_initLocW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -7.3446196579761231e-09 0.15091419056838509 -5.5768839716817475e-06 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_2_initFollicle" -p "joints_initLocs";
	rename -uid "7001F6EC-4528-99A1-C912-579BB605236F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "local_2_initFollicleShape" -p "local_2_initFollicle";
	rename -uid "EDD1D6C2-49AA-9D1B-EDE0-06A516346AF7";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.25999999046325684;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_2_initLoc" -p "local_2_initFollicle";
	rename -uid "67818841-499B-C25A-5A33-C183D2D26D88";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_2_initLocShape" -p "local_2_initLoc";
	rename -uid "491A4533-4CB4-558F-E6B0-FD98C8BF1514";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_2_initLoc_aimConstraint1" -p "local_2_initLoc";
	rename -uid "CC60FB93-4AC0-C9D3-2152-2885D6F44786";
	addAttr -ci true -sn "w0" -ln "bone_3_initLocW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_3_initFollicle" -p "joints_initLocs";
	rename -uid "86978715-45DA-5B2E-6A45-3A9625C82336";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "local_3_initFollicleShape" -p "local_3_initFollicle";
	rename -uid "224B608C-4892-819D-33A2-54ADB0E7619D";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.49900001287460327;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_3_initLoc" -p "local_3_initFollicle";
	rename -uid "ED092EFD-4B5E-C685-1E5E-989DA792E82E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_3_initLocShape" -p "local_3_initLoc";
	rename -uid "205EB847-43F0-8483-097B-C8BE50E339C8";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_3_initLoc_aimConstraint1" -p "local_3_initLoc";
	rename -uid "0D367A38-4C1C-6C63-B76C-E5A5FF7B3115";
	addAttr -ci true -sn "w0" -ln "bone_4_initLocW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.37007425499515606 1.7915828138069128 11.673034855584673 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_4_initFollicle" -p "joints_initLocs";
	rename -uid "99EF4961-435A-9155-4653-8CA2D9525614";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "local_4_initFollicleShape" -p "local_4_initFollicle";
	rename -uid "781D67D7-4EFE-E0FC-034A-40B02E79CEAC";
	setAttr -k off ".v" no;
	setAttr ".pu" 0.74000000953674316;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_4_initLoc" -p "local_4_initFollicle";
	rename -uid "F3A6225E-4867-C591-FE52-5EB0D016693B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_4_initLocShape" -p "local_4_initLoc";
	rename -uid "7F8BB73B-4FB2-6546-2234-99850BD11778";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_4_initLoc_aimConstraint1" -p "local_4_initLoc";
	rename -uid "92270F4D-4944-E249-081E-C99D339D56C0";
	addAttr -ci true -sn "w0" -ln "bone_5_initLocW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.1506356851445603 -1.231863356510176 -6.9722235420386589 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_5_initFollicle" -p "joints_initLocs";
	rename -uid "C0CCF10F-43E2-3FFB-296E-AE990B8B978D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "local_5_initFollicleShape" -p "local_5_initFollicle";
	rename -uid "A8EBBDC4-466D-0154-DFF9-7AA57FA10819";
	setAttr -k off ".v";
	setAttr ".pu" 0.89300000667572021;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "local_5_initLoc" -p "local_5_initFollicle";
	rename -uid "777177A5-43D3-6A08-4379-B29EA535390E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "local_5_initLocShape" -p "local_5_initLoc";
	rename -uid "C819D18E-4C92-EC24-34B0-3DAB026AA861";
	setAttr -k off ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode aimConstraint -n "local_5_initLoc_aimConstraint1" -p "local_5_initLoc";
	rename -uid "BA553FA2-4081-8D5E-6E22-07B7DB156795";
	addAttr -ci true -sn "w0" -ln "end_poserW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".u" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.9334351690129172 -3.9243230074390856 -26.254938523023672 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "mainPoserShapeOrig" -p "mainPoser";
	rename -uid "3413F7BB-45E0-D248-C5E4-8B818A79E05E";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.99991715933887182 0.99991706848356132 0.99991626811369627
		-0.99991715933887182 0.99991706848356132 -0.99991635593979067
		0.99991546471461712 0.99991706848356132 -0.99991635593979067
		0.99991546471461712 0.99991706848356132 0.99991626811369627
		-0.99991715933887182 0.99991706848356132 0.99991626811369627
		0.99991546471461712 0.99991706848356132 0.99991626811369627
		0.99991546471461712 -0.99991555556992029 0.99991626811369627
		-0.99991715933887182 -0.99991555556992029 0.99991626811369627
		-0.99991715933887182 0.99991706848356132 0.99991626811369627
		-0.99991715933887182 -0.99991555556992029 0.99991626811369627
		-0.99991715933887182 -0.99991555556992029 -0.99991635593979067
		-0.99991715933887182 0.99991706848356132 -0.99991635593979067
		-0.99991715933887182 -0.99991555556992029 -0.99991635593979067
		0.99991546471461712 -0.99991555556992029 -0.99991635593979067
		0.99991546471461712 0.99991706848356132 -0.99991635593979067
		0.99991546471461712 -0.99991555556992029 -0.99991635593979067
		0.99991546471461712 -0.99991555556992029 0.99991626811369627
		;
createNode transform -n "posers_curve" -p "posers";
	rename -uid "ACA0A195-4B58-465B-098A-A9A6FEC1AAEF";
	setAttr ".v" no;
	setAttr ".it" no;
createNode nurbsCurve -n "posers_curveShape" -p "posers_curve";
	rename -uid "C34B2FB6-4376-31D1-EC67-10B1C9E393CC";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 0.16666666666666666 0.33333333333333331 0.5 0.66666666666666663 0.83333333333333337
		 1
		7
		0 0 -5
		0 0 -3.299926130657437
		0 0 -1.700167504187605
		0 0 0
		0 0 1.700167504187605
		0 0 3.2999950200029882
		0 0 5
		;
createNode transform -n "posers_sweep" -p "posers";
	rename -uid "8D823880-43B6-A955-2866-B79A7C4E4E42";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 1;
	setAttr ".it" no;
createNode mesh -n "posers_sweepShape" -p "posers_sweep";
	rename -uid "910DC8B9-4253-F0E1-1273-E0BE6AC2BCD6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "mainPoser_clusterHandle" -p "posers";
	rename -uid "106D8E93-473E-B11B-8EBD-A8A96D4878E9";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -8.3446502685546875e-07 7.7486038208007812e-07 -5.9604644775390625e-08 ;
	setAttr ".sp" -type "double3" -8.3446502685546875e-07 7.7486038208007812e-07 -5.9604644775390625e-08 ;
	setAttr ".it" no;
createNode clusterHandle -n "mainPoser_clusterHandleShape" -p "mainPoser_clusterHandle";
	rename -uid "8B76C1D3-4481-DF52-0A3A-10942453E872";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -8.3446502685546875e-07 7.7486038208007812e-07 -5.9604644775390625e-08 ;
createNode transform -n "input" -p "mod";
	rename -uid "6A781B97-439F-CB55-BF3B-1B8BEDBDC015";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "root_connector" -p "input";
	rename -uid "F069625D-42AB-989C-39AF-33A024492CC0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 -4.4408920985006262e-16 -4.4408920985006262e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1.0000000000000002 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "root_connectorShape" -p "root_connector";
	rename -uid "B321BD83-4873-638A-AEF4-139D0288551F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "controls" -p "mod";
	rename -uid "C24570C1-4A85-AB22-7412-E5BB3D2D3A5D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ove" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "pelvis_group" -p "controls";
	rename -uid "859136D5-466C-EB0F-0D8E-C9920A51C404";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "pelvis" -p "pelvis_group";
	rename -uid "F560808C-42BC-4584-9F0F-078B99142A75";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "controls" -ln "controls" -min 0 -max 2 -en "Fk:Ik:Both" -at "enum";
	addAttr -ci true -sn "squash" -ln "squash" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "localControls" -ln "localControls" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_squash" -ln "default_squash" -dt "string";
	addAttr -ci true -sn "default_controls" -ln "default_controls" -dt "string";
	addAttr -ci true -sn "default_localControls" -ln "default_localControls" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "pelvis";
	setAttr -cb on ".controls" 2;
	setAttr -k on ".squash";
	setAttr -cb on ".localControls";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"pelvis\", per = True, d= 3,p= [[-1.3811067189874509, 5.146049249314179e-06, 3.595595275680183], [-1.3811067189874509, 1.6332093672558736e-05, 1.9999999999999927], [-1.3811067189874509, 5.146049249314179e-06, 0.40440472431980257], [-1.0678227525471138, -2.592800745584357e-06, -0.5660850393165613], [-0.0035950245348178363, -3.719115212816097e-06, -1.0475081853351293], [1.0433679021758722, 2.5601515886829697e-06, -0.5661473426238091], [1.381106718987451, 5.360693245261269e-06, 0.4099362453146643], [1.381106718987451, 7.620719757417794e-06, 1.9999999999999927], [1.381106718987451, 5.360693245261269e-06, 3.5900637546853194], [1.0433679021758722, 2.5601515886829697e-06, 4.5661473426238], [-0.003595024534817831, -3.719115212816097e-06, 5.047508185335129], [-1.0678227525471138, -2.592800745584358e-06, 4.56608503931656], [-1.3811067189874509, 5.146049249314179e-06, 3.595595275680183], [-1.3811067189874509, 1.6332093672558736e-05, 1.9999999999999927], [-1.3811067189874509, 5.146049249314179e-06, 0.40440472431980257]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
	setAttr ".default_squash" -type "string" "1.0";
	setAttr ".default_controls" -type "string" "2";
	setAttr ".default_localControls" -type "string" "False";
createNode transform -n "spineRoot" -p "pelvis";
	rename -uid "19070BBF-4707-942E-5AD0-41B110477603";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -8.8817841970012523e-16 4.4408920985006262e-16 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999956 0.99999999999999956 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "spineRoot";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"spineRoot\", per = True, d= 3,p= [[0.7426657855509671, 0.74266578555094, 1.0516265033442408e-14], [-1.1982530545819625e-16, 1.0502880262366192, 1.0466795604163316e-14], [-0.7426657855509661, 0.7426657855509401, 1.0516265033442408e-14], [-1.0502880262366452, -2.0568257591671303e-14, 1.0635694800530848e-14], [-0.7426657855509665, -0.7426657855509818, 1.0755124567619284e-14], [-3.1647227985051887e-16, -1.050288026236661, 1.0804593996898377e-14], [0.742665785550966, -0.7426657855509821, 1.0755124567619284e-14], [1.0502880262366452, -2.1436716533267668e-14, 1.0635694800530848e-14], [0.7426657855509671, 0.74266578555094, 1.0516265033442408e-14], [-1.1982530545819625e-16, 1.0502880262366192, 1.0466795604163316e-14], [-0.7426657855509661, 0.7426657855509401, 1.0516265033442408e-14]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "spineRootShape" -p "spineRoot";
	rename -uid "BA1FA370-4F4B-047F-2A0E-4B9A11E65666";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.5991254359495741e-14 1.8355200515549057 -1.8355200515549672
		2.5868989228736742e-14 2.5958173509167426 2.9615172144903501e-16
		2.5991254359495741e-14 1.8355200515549066 1.8355200515549654
		2.6286428496379851e-14 -5.083504581680984e-14 2.5958173509167959
		2.6581602633264012e-14 -1.8355200515550087 1.8355200515549672
		2.6703867764023241e-14 -2.5958173509168394 7.8217042810985847e-16
		2.6581602633264012e-14 -1.8355200515550094 -1.8355200515549654
		2.6286428496379851e-14 -5.2981467305810544e-14 -2.5958173509167959
		2.5991254359495741e-14 1.8355200515549057 -1.8355200515549672
		2.5868989228736742e-14 2.5958173509167426 2.9615172144903501e-16
		2.5991254359495741e-14 1.8355200515549066 1.8355200515549654
		;
createNode transform -n "chestRoot_group" -p "spineRoot";
	rename -uid "2EB91F03-4774-54AC-FF64-39A607EFECDE";
createNode transform -n "chestRoot" -p "chestRoot_group";
	rename -uid "A50F2F81-49CF-7068-B9F9-9F97FC06203B";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -8.8817841970012543e-16 8.8817841970012523e-16 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999956 0.99999999999999956 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "spineRoot";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"spineRoot\", per = True, d= 3,p= [[0.7426657855509671, 0.74266578555094, 1.0516265033442408e-14], [-1.1982530545819625e-16, 1.0502880262366192, 1.0466795604163316e-14], [-0.7426657855509661, 0.7426657855509401, 1.0516265033442408e-14], [-1.0502880262366452, -2.0568257591671303e-14, 1.0635694800530848e-14], [-0.7426657855509665, -0.7426657855509818, 1.0755124567619284e-14], [-3.1647227985051887e-16, -1.050288026236661, 1.0804593996898377e-14], [0.742665785550966, -0.7426657855509821, 1.0755124567619284e-14], [1.0502880262366452, -2.1436716533267668e-14, 1.0635694800530848e-14], [0.7426657855509671, 0.74266578555094, 1.0516265033442408e-14], [-1.1982530545819625e-16, 1.0502880262366192, 1.0466795604163316e-14], [-0.7426657855509661, 0.7426657855509401, 1.0516265033442408e-14]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode nurbsCurve -n "chestRootShape" -p "chestRoot";
	rename -uid "6743C2BE-424D-A36F-A964-8E80BCB2B779";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.463198023822041e-14 1.7395271890846411 -1.739527189084705
		2.4516109251655883e-14 2.4600629429202829 2.8066376671745577e-16
		2.463198023822041e-14 1.7395271890846415 1.7395271890847035
		2.4911717545470016e-14 -4.8176506860709145e-14 2.4600629429203389
		2.5191454852719481e-14 -1.7395271890847417 1.7395271890847042
		2.5307325839284068e-14 -2.4600629429203695 7.4126497558142966e-16
		2.5191454852719481e-14 -1.7395271890847432 -1.7395271890847015
		2.4911717545470016e-14 -5.0210676161224476e-14 -2.4600629429203389
		2.463198023822041e-14 1.7395271890846411 -1.739527189084705
		2.4516109251655883e-14 2.4600629429202829 2.8066376671745577e-16
		2.463198023822041e-14 1.7395271890846415 1.7395271890847035
		;
createNode transform -n "ref_offse_tgroup" -p "chestRoot";
	rename -uid "D1C0A6D2-42E3-6DB6-37E1-8BA3E8D6B5EB";
createNode transform -n "fk_controls" -p "ref_offse_tgroup";
	rename -uid "BFF7E081-4EA7-EE5D-59B0-E58404591A18";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 8.8817841970012523e-16 -4.4408920985006262e-16 ;
	setAttr -k on ".s";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_bone_1_group" -p "fk_controls";
	rename -uid "38B8DC83-4C68-E9E1-4531-92A57C3CFFBC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_1" -p "fk_bone_1_group";
	rename -uid "7D1D0F06-44CC-F175-4A3E-3A8493FF2D00";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 2.2204460492503131e-16 2.4999531825774794 ;
	setAttr ".sp" -type "double3" 0 2.2204460492503131e-16 0 ;
	setAttr -l on ".internalName" -type "string" "fk_1";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"fk_1\", per = True, d= 3,p= [[0.783427092319416, 0.7834269703422075, 1.0], [-1.2640193269676133e-16, 1.1079330971114287, 1.0], [-0.7834270923194129, 0.7834269703422075, 1.0], [-1.1079332190886344, -1.2197720523078038e-07, 1.0000000000000004], [-0.7834270923194137, -0.7834272142966192, 1.0000000000000004], [-3.338419014672295e-16, -1.1079333410658398, 1.0000000000000004], [0.7834270923194123, -0.783427214296621, 1.0000000000000004], [1.1079332190886344, -1.2197720619246625e-07, 1.0000000000000004], [0.783427092319416, 0.7834269703422075, 1.0], [-1.2640193269676133e-16, 1.1079330971114287, 1.0], [-0.7834270923194129, 0.7834269703422075, 1.0]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
createNode transform -n "fk_bone_2_group" -p "fk_1";
	rename -uid "3DB85BA1-4719-A6B6-484E-04A3AD5B4A0D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_2" -p "fk_bone_2_group";
	rename -uid "1C7156C2-42A5-BB84-DFB9-3DA6675A31BF";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-16 5.0000000000000018 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-16 0 ;
	setAttr -l on ".internalName" -type "string" "fk_2";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"fk_2\", per = True, d= 3,p= [[0.7848391846548137, 0.7848390323561573, 2.000000000000001], [-1.2662976653361762e-16, 1.109930066922025, 2.000000000000001], [-0.784839184654813, 0.7848390323561587, 2.000000000000001], [-1.1099302192206804, -1.5229865459011101e-07, 2.000000000000001], [-0.7848391846548131, -0.7848393369534684, 2.000000000000001], [-3.344436365807051e-16, -1.1099303715193365, 2.000000000000001], [0.784839184654813, -0.7848393369534684, 2.000000000000001], [1.1099302192206804, -1.5229865539060734e-07, 2.000000000000001], [0.7848391846548137, 0.7848390323561573, 2.000000000000001], [-1.2662976653361762e-16, 1.109930066922025, 2.000000000000001], [-0.784839184654813, 0.7848390323561587, 2.000000000000001]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
createNode transform -n "fk_bone_3_group" -p "fk_2";
	rename -uid "DB3D5A81-4ED6-C986-4E38-4FB4A36CEC95";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "fk_3" -p "fk_bone_3_group";
	rename -uid "341CC64E-40A2-6625-3320-16AA72A53D45";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 7.5000812620952999 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr -l on ".internalName" -type "string" "fk_3";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" "['cmds.curve(name = \"fk_3\", per = True, d= 3,p= [[0.7822017257284412, 0.7822016412381347, 3.0002610515383674], [-1.262042260985599e-16, 1.106200204546497, 3.0002610515383674], [-0.7822017257284402, 0.7822016412381347, 3.0002610515383674], [-1.1062002890368023, -8.449030497459376e-08, 3.0002610515383674], [-0.7822017257284406, -0.7822018102187456, 3.0002610515383674], [-3.3331973582254345e-16, -1.1062003735271078, 3.0002610515383674], [0.78220172572844, -0.7822018102187456, 3.0002610515383674], [1.1062002890368023, -8.449030586277217e-08, 3.0002610515383674], [0.7822017257284412, 0.7822016412381347, 3.0002610515383674], [-1.262042260985599e-16, 1.106200204546497, 3.0002610515383674], [-0.7822017257284402, 0.7822016412381347, 3.0002610515383674]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])']";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
createNode transform -n "fk_bone_3_out" -p "fk_3";
	rename -uid "7C2AE257-418E-ED2A-88A8-308BE203CC85";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "fk_3Shape" -p "fk_3";
	rename -uid "D162FF2E-4353-8C07-1E59-3CAC788AAE5C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9332342755904774 1.9332340667702281 7.4152322984860897
		-3.1191740901733734e-16 2.734005922964315 7.4152322984860897
		-1.9332342755904743 1.9332340667702281 7.4152322984860897
		-2.734006131784585 -2.0882024053007672e-07 7.4152322984860897
		-1.933234275590477 -1.9332344844107097 7.4152322984860897
		-8.2380940469391603e-16 -2.7340063406048096 7.4152322984860897
		1.9332342755904743 -1.9332344844107097 7.4152322984860897
		2.734006131784585 -2.0882024272523569e-07 7.4152322984860897
		1.9332342755904774 1.9332340667702281 7.4152322984860897
		-3.1191740901733734e-16 2.734005922964315 7.4152322984860897
		-1.9332342755904743 1.9332340667702281 7.4152322984860897
		;
createNode transform -n "fk_bone_2_out" -p "fk_2";
	rename -uid "2ECF60B2-4D71-F88D-5230-918FDFB26CAF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 0.84036461383370387 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "fk_2Shape" -p "fk_2";
	rename -uid "3D37B78B-4F68-5DEE-343C-78A240EA2288";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9397528319030084 1.939752455492451 4.9430580680197602
		-3.1296914455772572e-16 2.743224386118293 4.9430580680197602
		-1.9397528319030066 1.9397524554924543 4.9430580680197602
		-2.7432247625288535 -3.7641054633335573e-07 4.9430580680197602
		-1.9397528319030071 -1.9397532083135556 4.9430580680197602
		-8.2658715804905883e-16 -2.7432251389394025 4.9430580680197602
		1.9397528319030066 -1.9397532083135556 4.9430580680197602
		2.7432247625288535 -3.7641054831180585e-07 4.9430580680197602
		1.9397528319030084 1.939752455492451 4.9430580680197602
		-3.1296914455772572e-16 2.743224386118293 4.9430580680197602
		-1.9397528319030066 1.9397524554924543 4.9430580680197602
		;
createNode nurbsCurve -n "fk_1Shape" -p "fk_1";
	rename -uid "B1BE164F-4716-E196-2087-E19D45731C7F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9362628046973651 1.9362625032271601 2.4715290340098801
		-3.1240604661500846e-16 2.738288817251378 2.4715290340098801
		-1.9362628046973607 1.9362625032271601 2.4715290340098801
		-2.7382891187215739 -3.0147020454199898e-07 2.4715290340098801
		-1.9362628046973611 -1.9362631061675717 2.4715290340098801
		-8.2509995224531975e-16 -2.7382894201918053 2.4715290340098801
		1.9362628046973598 -1.936263106167573 2.4715290340098801
		2.7382891187215739 -3.0147020691883478e-07 2.4715290340098801
		1.9362628046973651 1.9362625032271601 2.4715290340098801
		-3.1240604661500846e-16 2.738288817251378 2.4715290340098801
		-1.9362628046973607 1.9362625032271601 2.4715290340098801
		;
createNode transform -n "hips_fk_group_2" -p "fk_controls";
	rename -uid "92C30F4A-4F43-0954-283F-AEA8FDB535FD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999967 0.99999999999999967 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "hips_fk_group" -p "hips_fk_group_2";
	rename -uid "06D21445-47DE-7F6C-674E-BFB8B53F0220";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -k on ".s";
	setAttr ".rp" -type "double3" 0 -1.1102230246251563e-16 0 ;
	setAttr ".sp" -type "double3" 0 -1.1102230246251563e-16 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "hips_fk" -p "hips_fk_group";
	rename -uid "78911BC9-477E-14D2-40EB-58BDFF25EC04";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -1.1102230246251563e-16 2.4999531825774794 ;
	setAttr -l on ".rptx";
	setAttr -l on ".rpty";
	setAttr -l on ".rptz";
	setAttr ".sp" -type "double3" 0 -1.1102230246251563e-16 0 ;
	setAttr -l on ".sptx";
	setAttr -l on ".spty";
	setAttr -l on ".sptz";
	setAttr -l on ".internalName" -type "string" "fk_hips";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"fk_hips\", d= 1,p= [[-0.034509955836598986, 0.40348213263789656, -0.3444296766965148], [-0.4545375792618642, 0.5714849670735331, 0.3444296766965135], [0.6996298520203481, 0.5714849670735331, 0.3444296766965135], [0.2797240057171402, 0.40348213263789656, -0.3444296766965148], [0.2797240057171402, -0.35284840826401465, -0.3444296766965139], [0.6996298520203481, -0.5714851360541449, 0.3444296766965148], [-0.4545375792618642, -0.5714851360541449, 0.3444296766965148], [-0.034509955836598986, -0.35284840826401465, -0.3444296766965139], [-0.034737661605841234, 0.40348213263789656, -0.3444296766965148], [-0.4545375792618642, 0.5714849670735331, 0.3444296766965135], [-0.4545375792618642, -0.5714851360541449, 0.3444296766965148], [-0.034509955836598986, -0.35284840826401465, -0.3444296766965139], [0.2797240057171402, -0.35284840826401465, -0.3444296766965139], [0.6996298520203481, -0.5714851360541449, 0.3444296766965148], [0.6996298520203481, 0.5714849670735331, 0.3444296766965135], [0.2797240057171402, 0.40348213263789656, -0.3444296766965148], [-0.034509955836598986, 0.40348213263789656, -0.3444296766965148]])']");
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
createNode joint -n "bendJoint_1" -p "hips_fk";
	rename -uid "EE0BA93B-4E58-FBA8-CF68-55B038DE531D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 0 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bendJoint_1_aimConstraint1" -p "bendJoint_1";
	rename -uid "CF4B7027-47F1-E1D9-AA07-0DAAE8958E2B";
	addAttr -ci true -sn "w0" -ln "stomachHipsMid_locW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "hipsStomachMid_locW1" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 71.753329621503212 22.601825310479917 82.778731309028785 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "hipsStomachMid_loc1" -p "bendJoint_1";
	rename -uid "946B1524-4EA9-F2DA-DC3C-30B5E64BC782";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 3.3000000000000003 4.4408920985006262e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "hipsStomachMid_loc1Shape" -p "hipsStomachMid_loc1";
	rename -uid "C147B1C5-4E4B-0D1F-3282-A1968DC2D0DF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_1_group" -p "bendJoint_1";
	rename -uid "E015EC52-4DED-BF34-A321-25ADE7876F6D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_1_group_2" -p "local_1_group";
	rename -uid "4F410DCD-4E39-8E5A-E74F-CEA816C95078";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_1" -p "local_1_group_2";
	rename -uid "AC0D7196-4008-271A-B548-228F7C96B99C";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scaleX" -ln "default_scaleX" -dt "string";
	addAttr -ci true -sn "default_scaleY" -ln "default_scaleY" -dt "string";
	addAttr -ci true -sn "default_scaleZ" -ln "default_scaleZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.1770017293856419e-17 0 4.668009599343603e-20 ;
	setAttr -k on ".r" -type "double3" 0 0 3.0152566888325239e-16 ;
	setAttr -k on ".r";
	setAttr -l on ".internalName" -type "string" "local_1";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"local_1\", d= 1,p= [[0.0, -1.4083743179299383e-15, -0.7809180178091489], [-0.028667751146122952, -1.4109558017560682e-15, -0.7847933410082891], [-0.05539327372303181, -1.418329972463026e-15, -0.7958634451576302], [-0.07840466026470103, -1.4300078774110434e-15, -0.8133943146150828], [-0.09593552972215307, -1.4453365401113098e-15, -0.8364057011567521], [-0.10700563387149357, -1.4631393144173228e-15, -0.8631312237336595], [-0.1108809570706341, -1.482235872849313e-15, -0.891798974879783], [-0.10700563387149357, -1.5013324312813032e-15, -0.9204667260259057], [-0.09593552972215307, -1.5191351544576885e-15, -0.9471921718470224], [-0.07840466026470103, -1.5344638682875833e-15, -0.9702036351444833], [-0.05539327372303181, -1.5461417221059715e-15, -0.9877344278461434], [-0.028667751146122952, -1.5535159950721875e-15, -0.9988046855070694], [0.0, -1.5560968142131432e-15, -1.0026790108809092], [0.028667751146122952, -1.5535159950721875e-15, -0.9988046855070694], [0.05539327372303181, -1.5461417221059715e-15, -0.9877344278461434], [0.07840466026470103, -1.5344638682875833e-15, -0.9702036351444833], [0.09593552972215307, -1.5191351544576885e-15, -0.9471921718470224], [0.10700563387149357, -1.5013324312813032e-15, -0.9204667260259057], [0.1108809570706341, -1.482235872849313e-15, -0.891798974879783], [0.10700563387149357, -1.4631393144173228e-15, -0.8631312237336595], [0.09593552972215307, -1.4453365401113098e-15, -0.8364057011567521], [0.07840466026470103, -1.4300078774110434e-15, -0.8133943146150828], [0.05539327372303181, -1.418329972463026e-15, -0.7958634451576302], [0.028667751146122952, -1.4109558017560682e-15, -0.7847933410082891], [0.0, -1.4083743179299383e-15, -0.7809180178091489], [0.0, -8.91348035160902e-16, -0.004758226336020557]])']");
	setAttr ".default_translateX" -type "string" "2.177001729385642e-17";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "4.668009599343603e-20";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 3.015256688832524e-16)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "3.015256688832524e-16";
	setAttr ".default_scaleX" -type "string" "1.0";
	setAttr ".default_scaleY" -type "string" "1.0";
	setAttr ".default_scaleZ" -type "string" "1.0";
createNode joint -n "bendJoint_2" -p "local_1";
	rename -uid "C5023DEA-4449-96E2-D3D3-B3956F52E18A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 0.84999999999999931 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "local_1Shape" -p "local_1";
	rename -uid "C55A0456-498C-0D56-AFCC-7B8D6306AF45";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 8 0 no 3
		9 0 1 2 3 4 5 6 7 8
		9
		-0.27537956845309397 0 3.2179613770292365e-16
		-0.12206133478753174 0 -0.12206129343048844
		-5.5103928877108399e-08 0 -0.27537947964623805
		0.12206124787192811 0 -0.12206129716516965
		0.27537942664873916 0 4.2692833002609396e-16
		0.12206124787192749 0 0.12206129716516968
		-5.5103929012569025e-08 0 0.27537947964623827
		-0.12206133478753185 0 0.12206129343048723
		-0.27537956845309397 0 3.2179613770292365e-16
		;
createNode transform -n "bendJoint_1_out" -p "hips_fk";
	rename -uid "541F50CF-4616-FD74-7988-A792D88B3B7B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 90 -6.3611093629270335e-15 89.999999999999986 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "bendJoint_1_outShape" -p "bendJoint_1_out";
	rename -uid "AC2FC9F8-41AD-1AA9-B27E-8EB117CDBB84";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode nurbsCurve -n "hips_fkShape" -p "hips_fk";
	rename -uid "64D46490-4E9E-0F1E-D2ED-2D9E3ABFDA99";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.08529235781255308 0.99721780551878336 -0.85126794613007373
		-1.1234028241942624 1.4124416886224158 0.8512679461300684
		1.7291554923283223 1.4124416886224158 0.8512679461300684
		0.69134600163945581 0.99721780551878336 -0.85126794613007373
		0.69134600163945581 -0.87207508562868363 -0.85126794613006929
		1.7291554923283223 -1.4124421062629005 0.85126794613007373
		-1.1234028241942624 -1.4124421062629005 0.85126794613007373
		-0.08529235781255308 -0.87207508562868363 -0.85126794613006929
		-0.085855139232446698 0.99721780551878336 -0.85126794613007373
		-1.1234028241942624 1.4124416886224158 0.8512679461300684
		-1.1234028241942624 -1.4124421062629005 0.85126794613007373
		-0.08529235781255308 -0.87207508562868363 -0.85126794613006929
		0.69134600163945581 -0.87207508562868363 -0.85126794613006929
		1.7291554923283223 -1.4124421062629005 0.85126794613007373
		1.7291554923283223 1.4124416886224158 0.8512679461300684
		0.69134600163945581 0.99721780551878336 -0.85126794613007373
		-0.08529235781255308 0.99721780551878336 -0.85126794613007373
		;
createNode transform -n "locator2" -p "hips_fk";
	rename -uid "C55FC677-454C-61AF-A878-F8BA0DB5D535";
	setAttr ".v" no;
createNode locator -n "locatorShape2" -p "locator2";
	rename -uid "C40C14E5-49A5-59D3-F060-84A391E8474E";
	setAttr -k off ".v";
createNode transform -n "group1" -p "hips_fk";
	rename -uid "43699D8A-4F46-7C83-B596-E0920EA8F710";
	setAttr ".v" no;
	setAttr ".s" -type "double3" -1 1 1 ;
createNode transform -n "locator3" -p "group1";
	rename -uid "5AF42EB1-4DF8-2C6F-815C-4FBF903AD862";
	setAttr ".t" -type "double3" 6.6613381477509392e-16 2.2204460492503131e-16 1.6653345369377348e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
createNode locator -n "locatorShape3" -p "locator3";
	rename -uid "FBEC56C1-4868-A113-12D8-D0B34A79960D";
	setAttr -k off ".v";
createNode transform -n "ik_controls" -p "ref_offse_tgroup";
	rename -uid "C872569E-41D2-BF97-2309-3E98A129E260";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "hips_ik" -p "ik_controls";
	rename -uid "A83B1847-4D11-1FB7-C917-37B691C847BF";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translate" -ln "default_translate" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_scale" -ln "default_scale" -dt "string";
	addAttr -ci true -sn "default_weight" -ln "default_weight" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr -k on ".t";
	setAttr -k on ".r";
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "hips";
	setAttr -k on ".weight";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"hips\", d= 1,p= [[-0.6769312729193383, -0.6769312729193386, 0.3022567845709428], [-0.6769312729193383, 0.676931272919338, 0.30225678457094246], [0.6769312729193383, 0.676931272919338, 0.30225678457094246], [0.6769312729193383, -0.6769312729193386, 0.3022567845709428], [-0.6769312729193383, -0.6769312729193386, 0.3022567845709428], [-0.5402058845643026, -0.5402058845643032, -0.30225678457094163], [-0.5402058845643026, 0.5402058845643021, -0.30225678457094185], [-0.6769312729193383, 0.676931272919338, 0.30225678457094246], [-0.6769312729193383, -0.6769312729193386, 0.3022567845709428], [-0.5402058845643026, -0.5402058845643032, -0.30225678457094163], [0.5402058845643026, -0.5402058845643032, -0.30225678457094163], [0.6769312729193383, -0.6769312729193386, 0.3022567845709428], [0.6769312729193383, 0.676931272919338, 0.30225678457094246], [0.5402058845643026, 0.5402058845643021, -0.30225678457094185], [0.5402058845643026, -0.5402058845643032, -0.30225678457094163], [0.5402058845643026, 0.5402058845643021, -0.30225678457094185], [-0.5402058845643026, 0.5402058845643021, -0.30225678457094185]])']");
	setAttr ".default_translate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_scale" -type "string" "[(1.0, 1.0, 1.0)]";
	setAttr ".default_weight" -type "string" "1.0";
createNode transform -n "hips_out" -p "hips_ik";
	rename -uid "4D6941D5-40E1-A79E-EA34-4EB75C123F70";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" -3.4694469519536142e-18 1.110223024625161e-16 -2.3592239273284576e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000004 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "hipsStomachMid_aim" -p "hips_ik";
	rename -uid "3551250F-48FF-3A26-494E-7698EC0A849E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "hipsStomachMid_aimShape" -p "hipsStomachMid_aim";
	rename -uid "95614204-4D6E-86CC-FCB9-E192CEE039B4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "hipsStomachMid_loc_group" -p "hips_ik";
	rename -uid "21C0B93F-4950-5E5A-02C6-5191D448DD41";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "hipsStomachMid_loc" -p "hipsStomachMid_loc_group";
	rename -uid "BD2A0F16-4058-62C7-7B87-34949B2249C5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "hipsStomachMid_locShape" -p "hipsStomachMid_loc";
	rename -uid "0790F166-4D53-E2C3-F6D6-4E904A923ED3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode aimConstraint -n "hipsStomachMid_loc_group_aimConstraint1" -p "hipsStomachMid_loc_group";
	rename -uid "6E3668C0-4A83-6C06-E0FA-008CBCDE6DB9";
	addAttr -ci true -sn "w0" -ln "hipsStomachMid_aimW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "chest_outW1" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" -88.764352952975159 -28.260198395450949 89.414879840509116 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "hips_ikShape" -p "hips_ik";
	rename -uid "55B21DCD-45EC-85D0-5B3B-9593FC9E1AD7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.2619507517383837 2.2619507517383814 1.6915604343823086e-15
		-3.8732027598132137e-16 3.1988814305284539 1.7489308922224663e-15
		-2.2619507517383814 2.2619507517383814 1.6915604343823086e-15
		-3.1988814305284565 4.7022468756391826e-16 1.553055896985047e-15
		-2.2619507517383832 -2.2619507517383823 1.4145513595877737e-15
		-9.8625155867640215e-16 -3.1988814305284565 1.3571809017476142e-15
		2.2619507517383814 -2.2619507517383832 1.4145513595877737e-15
		3.1988814305284565 -2.1748565778137338e-15 1.553055896985047e-15
		2.2619507517383837 2.2619507517383814 1.6915604343823086e-15
		-3.8732027598132137e-16 3.1988814305284539 1.7489308922224663e-15
		-2.2619507517383814 2.2619507517383814 1.6915604343823086e-15
		;
createNode transform -n "stomach_group_2" -p "ik_controls";
	rename -uid "D53A2ED9-45C5-0B51-7B5D-30BC5E4E4C39";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000009 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "stomach_group" -p "stomach_group_2";
	rename -uid "2A12B342-460A-E44B-6054-EF9A3E7EE269";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode orientConstraint -n "stomach_group_orientConstraint1" -p "stomach_group";
	rename -uid "37A55926-4664-6535-6D2F-13B2BECE289C";
	addAttr -ci true -k true -sn "w0" -ln "chest_outW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "hips_outW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".lr" -type "double3" -90 0 0 ;
	setAttr ".int" 2;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "stomach" -p "stomach_group";
	rename -uid "C40F4128-4657-5FC0-F452-718125C2973F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k on ".r";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "stomach";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"stomach\", d= 1,p= [[-0.5402599192770731, 0.30228701815225695, 0.5402599192770731], [-0.5402599192770731, 0.30228701815225695, -0.5402599192770731], [0.5402599192770731, 0.30228701815225695, -0.5402599192770731], [0.5402599192770731, 0.30228701815225695, 0.5402599192770731], [-0.5402599192770731, 0.30228701815225695, 0.5402599192770731], [-0.5402599192770731, -0.30228701815225717, 0.5402599192770731], [-0.5402599192770731, -0.30228701815225717, -0.5402599192770731], [-0.5402599192770731, 0.30228701815225695, -0.5402599192770731], [-0.5402599192770731, 0.30228701815225695, 0.5402599192770731], [-0.5402599192770731, -0.30228701815225717, 0.5402599192770731], [0.5402599192770731, -0.30228701815225717, 0.5402599192770731], [0.5402599192770731, 0.30228701815225695, 0.5402599192770731], [0.5402599192770731, 0.30228701815225695, -0.5402599192770731], [0.5402599192770731, -0.30228701815225717, -0.5402599192770731], [0.5402599192770731, -0.30228701815225717, 0.5402599192770731], [0.5402599192770731, -0.30228701815225717, -0.5402599192770731], [-0.5402599192770731, -0.30228701815225717, -0.5402599192770731]])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
createNode transform -n "stomachChestMid_loc" -p "stomach";
	rename -uid "6FE0C9CB-4D44-5204-BB9E-368F27FC6D65";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 3.2959746043559347e-17 1.7000000000000002 -3.3653635433950018e-16 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "stomachChestMid_locShape" -p "stomachChestMid_loc";
	rename -uid "8204E281-45C0-881F-24FB-0495D666DD8D";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_4_group" -p "stomachChestMid_loc";
	rename -uid "5B7055BE-4B8C-5F3D-C951-0CAD72087D77";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_4_group_2" -p "local_4_group";
	rename -uid "566A8D16-4169-9EFC-3919-F4BA2CA104A7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_4" -p "local_4_group_2";
	rename -uid "7CA6075D-4179-7AEF-8FD9-1980BB33DB5F";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.0469737016526324e-16 -4.4408920985006262e-16 -7.0473141211557788e-19 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_4";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"local_4\", d= 1,p= [[0.0, -5.201958982298125e-16, -0.780918017809148], [-0.028667751146122952, -5.227773820559422e-16, -0.7847933410082882], [-0.05539327372303181, -5.301515527629003e-16, -0.7958634451576293], [-0.07840466026470103, -5.418294577109174e-16, -0.8133943146150819], [-0.09593552972215307, -5.571581204111838e-16, -0.8364057011567512], [-0.10700563387149357, -5.749608947171971e-16, -0.8631312237336586], [-0.1108809570706341, -5.940574531491875e-16, -0.8917989748797821], [-0.10700563387149357, -6.131540115811772e-16, -0.9204667260259048], [-0.09593552972215307, -6.309567347575628e-16, -0.9471921718470215], [-0.07840466026470103, -6.462854485874574e-16, -0.9702036351444824], [-0.05539327372303181, -6.579633024058456e-16, -0.9877344278461425], [-0.028667751146122952, -6.653375753720614e-16, -0.9988046855070685], [0.0, -6.679183945130173e-16, -1.0026790108809083], [0.028667751146122952, -6.653375753720614e-16, -0.9988046855070685], [0.05539327372303181, -6.579633024058456e-16, -0.9877344278461425], [0.07840466026470103, -6.462854485874574e-16, -0.9702036351444824], [0.09593552972215307, -6.309567347575628e-16, -0.9471921718470215], [0.10700563387149357, -6.131540115811772e-16, -0.9204667260259048], [0.1108809570706341, -5.940574531491875e-16, -0.8917989748797821], [0.10700563387149357, -5.749608947171971e-16, -0.8631312237336586], [0.09593552972215307, -5.571581204111838e-16, -0.8364057011567512], [0.07840466026470103, -5.418294577109174e-16, -0.8133943146150819], [0.05539327372303181, -5.301515527629003e-16, -0.7958634451576293], [0.028667751146122952, -5.227773820559422e-16, -0.7847933410082882], [0.0, -5.201958982298125e-16, -0.780918017809148], [0.0, -3.1696154607760876e-18, -0.004758226336019669]])']");
	setAttr ".default_translateX" -type "string" "-2.0469737016526324e-16";
	setAttr ".default_translateY" -type "string" "-4.440892098500626e-16";
	setAttr ".default_translateZ" -type "string" "-7.047314121155779e-19";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
createNode joint -n "bendJoint_5" -p "local_4";
	rename -uid "34CD6C6B-42C8-B37E-1B85-AFBAB8C8AB0B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 -1.3322676295501878e-15 -1.0842021724856277e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 -7.8062556418956282e-17 3.3499999999999974 1.0744443529331365e-16 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "local_4Shape" -p "local_4";
	rename -uid "14FD2990-4FA4-EC5B-590F-60ACDCDEE935";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 8 0 no 3
		9 0 1 2 3 4 5 6 7 8
		9
		-0.27537956845309397 0 3.2179613770292365e-16
		-0.12206133478753174 0 -0.12206129343048844
		-5.5103928877108399e-08 0 -0.27537947964623805
		0.12206124787192811 0 -0.12206129716516965
		0.27537942664873916 0 4.2692833002609396e-16
		0.12206124787192749 0 0.12206129716516968
		-5.5103929012569025e-08 0 0.27537947964623827
		-0.12206133478753185 0 0.12206129343048723
		-0.27537956845309397 0 3.2179613770292365e-16
		;
createNode transform -n "local_3_group" -p "stomach";
	rename -uid "ED0E336F-4C4E-212A-4306-DDA23F673530";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_3_group_2" -p "local_3_group";
	rename -uid "1CF7A525-41D0-7376-9935-19A891E30F0E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_3" -p "local_3_group_2";
	rename -uid "DFA8BF37-4D7B-3D0D-0956-85878A0CCC3E";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -5.5511151231257827e-17 4.4408920985006262e-16 -1.2197274440461925e-18 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_3";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"local_3\", d= 1,p= [[0.0, -9.642851080798753e-16, -0.7809180178091485], [-0.028667751146122952, -9.66866591906005e-16, -0.7847933410082887], [-0.05539327372303181, -9.742407626129632e-16, -0.7958634451576297], [-0.07840466026470103, -9.859186675609804e-16, -0.8133943146150824], [-0.09593552972215307, -1.0012473302612468e-15, -0.8364057011567516], [-0.10700563387149357, -1.01905010456726e-15, -0.863131223733659], [-0.1108809570706341, -1.0381466629992503e-15, -0.8917989748797825], [-0.10700563387149357, -1.05724322143124e-15, -0.9204667260259053], [-0.09593552972215307, -1.0750459446076256e-15, -0.947192171847022], [-0.07840466026470103, -1.0903746584375203e-15, -0.9702036351444828], [-0.05539327372303181, -1.1020525122559085e-15, -0.987734427846143], [-0.028667751146122952, -1.1094267852221244e-15, -0.9988046855070689], [0.0, -1.1120076043630802e-15, -1.0026790108809087], [0.028667751146122952, -1.1094267852221244e-15, -0.9988046855070689], [0.05539327372303181, -1.1020525122559085e-15, -0.987734427846143], [0.07840466026470103, -1.0903746584375203e-15, -0.9702036351444828], [0.09593552972215307, -1.0750459446076256e-15, -0.947192171847022], [0.10700563387149357, -1.05724322143124e-15, -0.9204667260259053], [0.1108809570706341, -1.0381466629992503e-15, -0.8917989748797825], [0.10700563387149357, -1.01905010456726e-15, -0.863131223733659], [0.09593552972215307, -1.0012473302612468e-15, -0.8364057011567516], [0.07840466026470103, -9.859186675609804e-16, -0.8133943146150824], [0.05539327372303181, -9.742407626129632e-16, -0.7958634451576297], [0.028667751146122952, -9.66866591906005e-16, -0.7847933410082887], [0.0, -9.642851080798753e-16, -0.7809180178091485], [0.0, -4.47258825310839e-16, -0.004758226336020113]])']");
	setAttr ".default_translateX" -type "string" "-5.551115123125783e-17";
	setAttr ".default_translateY" -type "string" "4.440892098500626e-16";
	setAttr ".default_translateZ" -type "string" "-1.2197274440461925e-18";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
createNode joint -n "bendJoint_4" -p "local_3";
	rename -uid "493AAC8C-4C21-30E5-4511-00BE83F87FC4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 4.4408920985006262e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "local_3Shape" -p "local_3";
	rename -uid "01387FB2-480D-CC9E-561E-F58C1E79A328";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 8 0 no 3
		9 0 1 2 3 4 5 6 7 8
		9
		-0.27537956845309397 0 3.2179613770292365e-16
		-0.12206133478753174 0 -0.12206129343048844
		-5.5103928877108399e-08 0 -0.27537947964623805
		0.12206124787192811 0 -0.12206129716516965
		0.27537942664873916 0 4.2692833002609396e-16
		0.12206124787192749 0 0.12206129716516968
		-5.5103929012569025e-08 0 0.27537947964623827
		-0.12206133478753185 0 0.12206129343048723
		-0.27537956845309397 0 3.2179613770292365e-16
		;
createNode transform -n "stomachHipsMid_loc" -p "stomach";
	rename -uid "365C340E-4A9A-4E73-0DDF-1C9A2C89CC3C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" -1.7347234759768071e-18 -1.7000000000000002 1.11022302462516e-16 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "stomachHipsMid_locShape" -p "stomachHipsMid_loc";
	rename -uid "03BB0871-48B9-FB11-19D8-E8AC28BE1710";
	setAttr -k off ".v" no;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "local_2_group" -p "stomachHipsMid_loc";
	rename -uid "BBEB2D73-4CD1-8C10-C793-BB910F1ECCBC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_2_group_2" -p "local_2_group";
	rename -uid "38D52CF7-43D2-D157-9664-3E96A295444F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_2" -p "local_2_group_2";
	rename -uid "0B048E78-467F-96A5-7F47-F4AFAE267531";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 7.6327832942979512e-17 0 -8.9446679230054116e-19 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_2";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"local_2\", d= 1,p= [[0.0, -5.201958982298126e-16, -0.780918017809148], [-0.028667751146122952, -5.227773820559423e-16, -0.7847933410082882], [-0.05539327372303181, -5.301515527629005e-16, -0.7958634451576293], [-0.07840466026470103, -5.418294577109175e-16, -0.8133943146150819], [-0.09593552972215307, -5.571581204111839e-16, -0.8364057011567512], [-0.10700563387149357, -5.749608947171972e-16, -0.8631312237336586], [-0.1108809570706341, -5.940574531491876e-16, -0.8917989748797821], [-0.10700563387149357, -6.131540115811773e-16, -0.9204667260259048], [-0.09593552972215307, -6.309567347575629e-16, -0.9471921718470215], [-0.07840466026470103, -6.462854485874575e-16, -0.9702036351444824], [-0.05539327372303181, -6.579633024058457e-16, -0.9877344278461425], [-0.028667751146122952, -6.653375753720615e-16, -0.9988046855070685], [0.0, -6.679183945130174e-16, -1.0026790108809083], [0.028667751146122952, -6.653375753720615e-16, -0.9988046855070685], [0.05539327372303181, -6.579633024058457e-16, -0.9877344278461425], [0.07840466026470103, -6.462854485874575e-16, -0.9702036351444824], [0.09593552972215307, -6.309567347575629e-16, -0.9471921718470215], [0.10700563387149357, -6.131540115811773e-16, -0.9204667260259048], [0.1108809570706341, -5.940574531491876e-16, -0.8917989748797821], [0.10700563387149357, -5.749608947171972e-16, -0.8631312237336586], [0.09593552972215307, -5.571581204111839e-16, -0.8364057011567512], [0.07840466026470103, -5.418294577109175e-16, -0.8133943146150819], [0.05539327372303181, -5.301515527629005e-16, -0.7958634451576293], [0.028667751146122952, -5.227773820559423e-16, -0.7847933410082882], [0.0, -5.201958982298126e-16, -0.780918017809148], [0.0, -3.1696154607761986e-18, -0.004758226336019669]])']");
	setAttr ".default_translateX" -type "string" "7.632783294297951e-17";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "-8.944667923005412e-19";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
createNode joint -n "bendJoint_3" -p "local_2";
	rename -uid "CB5DB37F-42BA-B45D-4D27-AF98A5618807";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.1102230246251563e-16 -2.2204460492503131e-16 -1.0842021724855044e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 -1.1275702593849244e-16 1.6499999999999984 5.5500309209533002e-16 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "local_2Shape" -p "local_2";
	rename -uid "E0E82DD6-42EB-D106-FDDE-D1B6DCFCF592";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 8 0 no 3
		9 0 1 2 3 4 5 6 7 8
		9
		-0.27537956845309397 0 3.2179613770292365e-16
		-0.12206133478753174 0 -0.12206129343048844
		-5.5103928877108399e-08 0 -0.27537947964623805
		0.12206124787192811 0 -0.12206129716516965
		0.27537942664873916 0 4.2692833002609396e-16
		0.12206124787192749 0 0.12206129716516968
		-5.5103929012569025e-08 0 0.27537947964623827
		-0.12206133478753185 0 0.12206129343048723
		-0.27537956845309397 0 3.2179613770292365e-16
		;
createNode nurbsCurve -n "stomachShape" -p "stomach";
	rename -uid "3AEAE307-41CE-095E-CA7D-CAB947522982";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.2656854966507272 1.4642532508695153e-16 -2.2656854966507232
		-3.6352631493306233e-16 2.0389050825451948e-16 -3.2041631574354841
		-2.2656854966507232 1.4642532508695158e-16 -2.2656854966507232
		-3.2041631574354841 7.6921005195572545e-18 -1.1733768661677274e-15
		-2.2656854966507245 -1.31041124047837e-16 2.2656854966507232
		-9.6344650313776677e-16 -1.8850630721540423e-16 3.2041631574354841
		2.2656854966507232 -1.3104112404783729e-16 2.2656854966507232
		3.2041631574354841 7.6921005195570896e-18 1.4760717373542104e-15
		2.2656854966507272 1.4642532508695153e-16 -2.2656854966507232
		-3.6352631493306233e-16 2.0389050825451948e-16 -3.2041631574354841
		-2.2656854966507232 1.4642532508695158e-16 -2.2656854966507232
		;
createNode pointConstraint -n "stomach_group_2_pointConstraint1" -p "stomach_group_2";
	rename -uid "6B662D73-4D71-3FC8-406C-C0B383DE8697";
	addAttr -ci true -k true -sn "w0" -ln "hipsMid_locW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "hipsMid_locW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" 0 2.2381574280128778 9.8607613152626476e-32 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "chest_group" -p "ik_controls";
	rename -uid "AC22F380-46F9-33D1-A1C7-0A96548E1E91";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "chest" -p "chest_group";
	rename -uid "C4078C16-4B69-FED4-F66C-BC809AEA9C0D";
	addAttr -ci true -sn "mirrored" -ln "mirrored" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateXMirror" -ln "translateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateYMirror" -ln "translateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "translateZMirror" -ln "translateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateXMirror" -ln "rotateXMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateYMirror" -ln "rotateYMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "rotateZMirror" -ln "rotateZMirror" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "weight" -ln "weight" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotateX" -ln "default_rotateX" -dt "string";
	addAttr -ci true -sn "default_rotateY" -ln "default_rotateY" -dt "string";
	addAttr -ci true -sn "default_rotateZ" -ln "default_rotateZ" -dt "string";
	addAttr -ci true -sn "default_weight" -ln "default_weight" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".ro" 3;
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sz";
	setAttr ".translateXMirror" yes;
	setAttr ".rotateYMirror" yes;
	setAttr ".rotateZMirror" yes;
	setAttr -l on ".internalName" -type "string" "chest";
	setAttr -k on ".weight";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"chest\", d= 1,p= [[-0.5402058845643026, -0.5402058845643032, 0.3022567845709426], [-0.5402058845643026, 0.5402058845643021, 0.3022567845709424], [0.5402058845643026, 0.5402058845643021, 0.3022567845709424], [0.5402058845643026, -0.5402058845643032, 0.3022567845709426], [-0.5402058845643026, -0.5402058845643032, 0.3022567845709426], [-0.680914966250058, -0.6809149662500588, -0.3022567845709416], [-0.680914966250058, 0.6809149662500572, -0.3022567845709419], [-0.5402058845643026, 0.5402058845643021, 0.3022567845709424], [-0.5402058845643026, -0.5402058845643032, 0.3022567845709426], [-0.680914966250058, -0.6809149662500588, -0.3022567845709416], [0.680914966250058, -0.6809149662500588, -0.3022567845709416], [0.5402058845643026, -0.5402058845643032, 0.3022567845709426], [0.5402058845643026, 0.5402058845643021, 0.3022567845709424], [0.680914966250058, 0.6809149662500572, -0.3022567845709419], [0.680914966250058, -0.6809149662500588, -0.3022567845709416], [0.680914966250058, 0.6809149662500572, -0.3022567845709419], [-0.680914966250058, 0.6809149662500572, -0.3022567845709419]])']");
	setAttr ".default_translateX" -type "string" "0.0";
	setAttr ".default_translateY" -type "string" "0.0";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotateX" -type "string" "0.0";
	setAttr ".default_rotateY" -type "string" "0.0";
	setAttr ".default_rotateZ" -type "string" "0.0";
	setAttr ".default_weight" -type "string" "1.0";
createNode transform -n "chest_out" -p "chest";
	rename -uid "B6272732-4A21-3F97-7A81-ABBD9230D2AA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_joint_7" -p "chest";
	rename -uid "E984FADE-4EFA-30CF-B79D-5DA6574AA00A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 5 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bend_joint_7_aimConstraint1" -p "bend_joint_7";
	rename -uid "73541310-48CC-DFB6-3B9A-8094B229D1E1";
	addAttr -ci true -sn "w0" -ln "stomachChestMid_locW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "chestStomachMid_locW1" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wum" -type "matrix" -0.99999999999999989 1.224646799147353e-16 0 0 1.224646799147353e-16 0.99999999999999967 1.224646799147353e-16 0
		 1.4997597826618571e-32 1.224646799147353e-16 -0.99999999999999967 0 -0.038593063568717056 4.2459453344188356 -2.2194822940039787 1;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 1.3655785759077037 20.956279240587151 90.381565819649907 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_5_group" -p "bend_joint_7";
	rename -uid "2FC5800E-455D-9B57-157D-82A2B1253B8E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_5_group_2" -p "local_5_group";
	rename -uid "5CD944A7-4B6C-6595-8E38-28879A195611";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "local_5" -p "local_5_group_2";
	rename -uid "CD84879B-400E-BAFA-EF94-4291E0BA41F4";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "type" -ln "type" -dt "string";
	addAttr -ci true -sn "customShapeCommand" -ln "customShapeCommand" -dt "string";
	addAttr -ci true -sn "default_translateX" -ln "default_translateX" -dt "string";
	addAttr -ci true -sn "default_translateY" -ln "default_translateY" -dt "string";
	addAttr -ci true -sn "default_translateZ" -ln "default_translateZ" -dt "string";
	addAttr -ci true -sn "default_rotate" -ln "default_rotate" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.7755575615628914e-16 8.8817841970012523e-16 0 ;
	setAttr -k on ".r";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".internalName" -type "string" "local_5";
	setAttr -l on ".moduleName" -type "string" "spine";
	setAttr -l on ".type" -type "string" "control";
	setAttr -l on ".customShapeCommand" -type "string" (
		"['cmds.curve(name = \"local_5\", d= 1,p= [[0.0, -1.4083743179299383e-15, -0.7809180178091489], [-0.028667751146122952, -1.4109558017560682e-15, -0.7847933410082891], [-0.05539327372303181, -1.418329972463026e-15, -0.7958634451576302], [-0.07840466026470103, -1.4300078774110434e-15, -0.8133943146150828], [-0.09593552972215307, -1.4453365401113098e-15, -0.8364057011567521], [-0.10700563387149357, -1.4631393144173228e-15, -0.8631312237336595], [-0.1108809570706341, -1.482235872849313e-15, -0.891798974879783], [-0.10700563387149357, -1.5013324312813032e-15, -0.9204667260259057], [-0.09593552972215307, -1.5191351544576885e-15, -0.9471921718470224], [-0.07840466026470103, -1.5344638682875833e-15, -0.9702036351444833], [-0.05539327372303181, -1.5461417221059715e-15, -0.9877344278461434], [-0.028667751146122952, -1.5535159950721875e-15, -0.9988046855070694], [0.0, -1.5560968142131432e-15, -1.0026790108809092], [0.028667751146122952, -1.5535159950721875e-15, -0.9988046855070694], [0.05539327372303181, -1.5461417221059715e-15, -0.9877344278461434], [0.07840466026470103, -1.5344638682875833e-15, -0.9702036351444833], [0.09593552972215307, -1.5191351544576885e-15, -0.9471921718470224], [0.10700563387149357, -1.5013324312813032e-15, -0.9204667260259057], [0.1108809570706341, -1.482235872849313e-15, -0.891798974879783], [0.10700563387149357, -1.4631393144173228e-15, -0.8631312237336595], [0.09593552972215307, -1.4453365401113098e-15, -0.8364057011567521], [0.07840466026470103, -1.4300078774110434e-15, -0.8133943146150828], [0.05539327372303181, -1.418329972463026e-15, -0.7958634451576302], [0.028667751146122952, -1.4109558017560682e-15, -0.7847933410082891], [0.0, -1.4083743179299383e-15, -0.7809180178091489], [0.0, -8.91348035160902e-16, -0.004758226336020557]])']");
	setAttr ".default_translateX" -type "string" "2.7755575615628914e-16";
	setAttr ".default_translateY" -type "string" "8.881784197001252e-16";
	setAttr ".default_translateZ" -type "string" "0.0";
	setAttr ".default_rotate" -type "string" "[(0.0, 0.0, 0.0)]";
createNode joint -n "bend_joint_6" -p "local_5";
	rename -uid "DEF12449-497A-A09A-595A-7C9B8B3A98F7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 8.8817841970012523e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.1500000000000012 0 1;
	setAttr ".ds" 2;
	setAttr ".radi" 3.620000000000001;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "local_5Shape" -p "local_5";
	rename -uid "FF47AD95-4342-805E-ED46-7D99A5EC3D4E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 8 0 no 3
		9 0 1 2 3 4 5 6 7 8
		9
		-0.27537956845309397 0 3.2179613770292365e-16
		-0.12206133478753174 0 -0.12206129343048844
		-5.5103928877108399e-08 0 -0.27537947964623805
		0.12206124787192811 0 -0.12206129716516965
		0.27537942664873916 0 4.2692833002609396e-16
		0.12206124787192749 0 0.12206129716516968
		-5.5103929012569025e-08 0 0.27537947964623827
		-0.12206133478753185 0 0.12206129343048723
		-0.27537956845309397 0 3.2179613770292365e-16
		;
createNode transform -n "bend_joint_7_out" -p "bend_joint_7";
	rename -uid "7F7C2944-49DD-38F9-8CEC-4FB48999DA72";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 90 179.99999999999986 -90 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "bend_joint_7_outShape" -p "bend_joint_7_out";
	rename -uid "2C124AAA-4597-5FEA-12E7-7B82AE8836AD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "chestStomachMid_loc_group" -p "chest";
	rename -uid "FF1CDD87-4870-0711-6F03-35B5BB818678";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "chestStomachMid_loc" -p "chestStomachMid_loc_group";
	rename -uid "6C96084D-4CDF-6E04-10D8-0784BE68142B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".t" -type "double3" 0 -3.3000000000000003 4.4408920985006262e-16 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "chestStomachMid_locShape" -p "chestStomachMid_loc";
	rename -uid "BC8A85B7-462B-71DE-C13D-EF9C250738BB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode aimConstraint -n "chestStomachMid_loc_group_aimConstraint1" -p "chestStomachMid_loc_group";
	rename -uid "2230F4D6-4FD2-7BB9-A30A-24B9B047068D";
	addAttr -ci true -sn "w0" -ln "chestStomachMid_aimW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "hips_outW1" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 90.000000000000071 -30.76383429044937 -90.000000000000071 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "chestStomachMid_aim" -p "chest";
	rename -uid "82D74D73-4068-0B34-64D3-7D9168542C61";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode locator -n "chestStomachMid_aimShape" -p "chestStomachMid_aim";
	rename -uid "0715C141-4D5D-34B2-26EF-37AA3E864AB4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "end_out" -p "chest";
	rename -uid "A252A145-43CB-7DD0-086D-A1A3D2C05114";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "chestShape" -p "chest";
	rename -uid "7F7489ED-4A93-CA29-21BE-BCB1397CD27C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.222224626184107 2.2222246261841061 1.3607201377213969e-16
		-3.2834850970750361e-16 3.1427002049890547 1.9243488733597897e-16
		-2.2222246261841065 2.2222246261841065 1.3607201377214004e-16
		-3.1427002049890547 9.0944332935265841e-16 5.5511963092905997e-32
		-2.222224626184107 -2.2222246261841065 -1.3607201377213994e-16
		-9.1676089878103395e-16 -3.1427002049890547 -1.9243488733597897e-16
		2.2222246261841061 -2.222224626184107 -1.3607201377214006e-16
		3.1427002049890547 -1.689182976575101e-15 -1.0360800629382109e-31
		2.222224626184107 2.2222246261841061 1.3607201377213969e-16
		-3.2834850970750361e-16 3.1427002049890547 1.9243488733597897e-16
		-2.2222246261841065 2.2222246261841065 1.3607201377214004e-16
		;
createNode transform -n "stomach_orient" -p "ik_controls";
	rename -uid "2861B6E8-4090-4C03-CDF9-5888FD082847";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ro" 2;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000009 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "stomach_orient_aimConstraint1" -p "stomach_orient";
	rename -uid "5DC8F48B-45B2-3698-2163-6181AC67FDE6";
	addAttr -ci true -sn "w0" -ln "chestStomachMid_locW0" -dv 1 -at "double";
	addAttr -ci true -sn "w1" -ln "chest_outW1" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".wut" 4;
	setAttr ".rsrr" -type "double3" 6.3611093629270335e-15 -84.763990726118976 55.615120457814577 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointConstraint -n "stomach_orient_pointConstraint1" -p "stomach_orient";
	rename -uid "CA4D3573-4DCC-C0F5-6E44-8A91D5375152";
	addAttr -ci true -k true -sn "w0" -ln "hipsStomachMid_locW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "hips_outW1" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".rst" -type "double3" -0.24204660357233371 0.74856771957123669 -2.1288789287552148 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "pelvisShape" -p "pelvis";
	rename -uid "1FBA21B3-48EC-AF8B-068C-B4BFE194C222";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		-3.4101591471382076 1.270636561093434e-05 8.8780627522811244
		-3.4101591471382076 4.0326383083725088e-05 4.9382992642861572
		-3.4101591471382076 1.270636561093434e-05 0.9985357762911713
		-2.636614156645734 -6.4020130071799353e-06 -1.3977486665901968
		-0.0088766535076908373 -9.1830519596226617e-06 -2.5864544504871012
		2.576231471847453 6.3213973534271005e-06 -1.3979025027783647
		3.4101591471382076 1.3236353754568841e-05 1.0121939293208237
		3.4101591471382076 1.881669738569378e-05 4.9382992642861572
		3.4101591471382076 1.3236353754568841e-05 8.8644045992515021
		2.576231471847453 6.3213973534271005e-06 11.274501031350677
		-0.0088766535076908321 -9.1830519596226617e-06 12.463052979059448
		-2.636614156645734 -6.4020130071799353e-06 11.274347195162523
		-3.4101591471382076 1.270636561093434e-05 8.8780627522811244
		-3.4101591471382076 4.0326383083725088e-05 4.9382992642861572
		-3.4101591471382076 1.270636561093434e-05 0.9985357762911713
		;
createNode transform -n "l_b_leg__pelvis__ik_aim_group" -p "pelvis";
	rename -uid "D990432A-4376-9EFE-AD86-D19DFBA1F23A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_b_leg";
createNode transform -n "l_b_leg__pelvis__ik_aim" -p "l_b_leg__pelvis__ik_aim_group";
	rename -uid "191290D5-4267-9F22-AD67-ADA2FB42A6D5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_b_leg";
createNode locator -n "l_b_leg__pelvis__ik_aimShape" -p "l_b_leg__pelvis__ik_aim";
	rename -uid "0E9C4213-44A4-B342-75CB-5EA845CAEA45";
	setAttr -k off ".v";
createNode transform -n "r_b_leg__pelvis__ik_aim_group" -p "pelvis";
	rename -uid "680BCE63-4F25-DF2F-2796-69855ACA500B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "r_b_leg";
createNode transform -n "r_b_leg__pelvis__ik_aim" -p "r_b_leg__pelvis__ik_aim_group";
	rename -uid "EADC6311-491E-FB4C-B995-D08FED5F9BC4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "r_b_leg";
createNode locator -n "r_b_leg__pelvis__ik_aimShape" -p "r_b_leg__pelvis__ik_aim";
	rename -uid "D8911AE2-44A4-508A-1C9A-89BEE27E1879";
	setAttr -k off ".v";
createNode transform -n "l_f_leg__pelvis__ik_aim_group" -p "pelvis";
	rename -uid "FD233F3C-48EF-5F49-21C8-0D91D78841ED";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "l_f_leg";
createNode transform -n "l_f_leg__pelvis__ik_aim" -p "l_f_leg__pelvis__ik_aim_group";
	rename -uid "A700CE89-4520-D438-AB85-A88AC032CB5D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_f_leg";
createNode locator -n "l_f_leg__pelvis__ik_aimShape" -p "l_f_leg__pelvis__ik_aim";
	rename -uid "1F48481D-4CA7-DB3C-79A7-5E911A30A4F5";
	setAttr -k off ".v";
createNode transform -n "r_f_leg__pelvis__ik_aim_group" -p "pelvis";
	rename -uid "C79E50BF-47D1-C2A0-BA44-6DADE86F2EB1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "r_f_leg";
createNode transform -n "r_f_leg__pelvis__ik_aim" -p "r_f_leg__pelvis__ik_aim_group";
	rename -uid "75C9B2E7-4EF3-B655-C6E8-9781C03BD415";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "r_f_leg";
createNode locator -n "r_f_leg__pelvis__ik_aimShape" -p "r_f_leg__pelvis__ik_aim";
	rename -uid "18F63D02-41BA-A9ED-4FF9-37A8FA622CD0";
	setAttr -k off ".v";
createNode transform -n "system" -p "mod";
	rename -uid "EAE44848-4B43-0145-A476-9385E1A0B085";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_crv" -p "system";
	rename -uid "9D019FFD-40E3-8CE6-E085-01946C2189AD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsCurve -n "bend_crvShape" -p "bend_crv";
	rename -uid "6FDE65BF-4FCA-F1FA-CFCE-328D2120E28C";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "joints" -p "system";
	rename -uid "18067B38-4095-AAC5-DE94-56A3C1A6C7E0";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ovdt" 1;
	setAttr ".ovc" 15;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bendJoints" -p "joints";
	rename -uid "63A1BE64-4221-2A58-24DA-1BBEACD2C5A5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_1_foll" -p "bendJoints";
	rename -uid "5B46A96C-4628-7384-636A-61A685F98A43";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "bend_1_follShape" -p "bend_1_foll";
	rename -uid "910BA0D6-4455-1F44-58F6-F1BD62DFEA6C";
	setAttr -k off ".v";
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_1_jnt" -p "bend_1_foll";
	rename -uid "7D53F083-413C-860C-C96F-2FA9932164AF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 2.6309568817224859e-17 0.99999999999999989 1.3877787807814457e-17 1;
	setAttr ".radi" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bend_1_jnt_aimConstraint1" -p "bend_1_jnt";
	rename -uid "C5BCF39B-41D9-0D5D-A4EE-80A5F21D83C8";
	addAttr -ci true -sn "w0" -ln "bend_2_follW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".u" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.75877229095216381 8.5250916504991121 5.1051982124773394 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_2_foll" -p "bendJoints";
	rename -uid "251C1885-4432-10E3-F06F-D49C52F084EF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "bend_2_follShape" -p "bend_2_foll";
	rename -uid "F7ED3973-4195-8793-E8F9-F5AA2DBF6B10";
	setAttr -k off ".v" no;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_2_jnt" -p "bend_2_foll";
	rename -uid "4B2D5D49-41A9-B14A-F597-A590E0CAAA40";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 1;
	setAttr ".radi" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bend_2_jnt_aimConstraint1" -p "bend_2_jnt";
	rename -uid "531E01B7-49CA-F6EC-485A-D489C85878D7";
	addAttr -ci true -sn "w0" -ln "bend_3_follW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 5.4376959362203374 -16.767404951221064 -18.261262495520448 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_3_foll" -p "bendJoints";
	rename -uid "34C2A5E7-41A7-CE68-18A8-20845C768C0B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "bend_3_follShape" -p "bend_3_foll";
	rename -uid "E343DCDA-4D09-3811-EB4C-C6973CB597CD";
	setAttr -k off ".v" no;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_3_jnt" -p "bend_3_foll";
	rename -uid "02B76CAF-40C0-6D0C-9C8F-5481BC23E3C3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.2779255513307275e-17 0.49999999999999994 3.4694469519536142e-17 1;
	setAttr ".radi" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bend_3_jnt_aimConstraint1" -p "bend_3_jnt";
	rename -uid "F61ED6DA-411F-3EFF-B7CC-62AEF34EF96F";
	addAttr -ci true -sn "w0" -ln "bend_4_follW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.9559454439317359 -9.0611884171284114 -12.234957279608279 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_4_foll" -p "bendJoints";
	rename -uid "F01B2561-4B54-D2AF-3119-B9BEBC639B62";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "bend_4_follShape" -p "bend_4_foll";
	rename -uid "9F6BDA80-48A4-535A-9C58-0F8C91DE3466";
	setAttr -k off ".v" no;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_4_jnt" -p "bend_4_foll";
	rename -uid "C8449D0D-465C-39B4-CBD6-ADAB411591EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 1;
	setAttr ".radi" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bend_4_jnt_aimConstraint1" -p "bend_4_jnt";
	rename -uid "E1330873-45B5-0A9A-E81A-04BAE686FF73";
	addAttr -ci true -sn "w0" -ln "bend_5_follW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0.0040711943580534083 0.71956960984821505 0.324174168691167 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_5_foll" -p "bendJoints";
	rename -uid "3AE8D518-4256-F026-39E4-A3BA27709F76";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode follicle -n "bend_5_follShape" -p "bend_5_foll";
	rename -uid "A28AFCC7-4EE0-081E-2D0B-E59D5CB4AF10";
	setAttr -k off ".v";
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode joint -n "bend_5_jnt" -p "bend_5_foll";
	rename -uid "66DD9CEF-4EAE-217C-5071-BC934200D273";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 1.1102230246251563e-16 -1.1102230246251563e-16 0
		 1.1102230246251563e-16 1 1.1102230246251563e-16 0 -1.1102230246251563e-16 1.1102230246251563e-16 1 0
		 1.2893798948612516e-17 0 2.0816681711721685e-17 1;
	setAttr ".radi" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode aimConstraint -n "bend_5_jnt_aimConstraint1" -p "bend_5_jnt";
	rename -uid "A204109B-46D8-7B32-3D8B-7DB0C0B0FBCC";
	addAttr -ci true -sn "w0" -ln "chest_outW0" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
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
	setAttr ".wu" -type "double3" 0 -1 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 1.108761237545985 7.4297795338068511 8.5122613076307605 ;
	setAttr -k on ".w0";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_crv_gr" -p "joints";
	rename -uid "764D60CF-40EB-C339-CD3B-289CC8E94C49";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".v" no;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_0_jnt" -p "bend_crv_gr";
	rename -uid "78DBE192-4D73-0246-D5B6-468A077AE5EF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_1_jnt" -p "bend_crv_gr";
	rename -uid "69C483B9-4E59-58EE-01FF-8DA0CFE12FEE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_2_jnt" -p "bend_crv_gr";
	rename -uid "6C780BB8-456B-7123-CE7D-EA8D418A4A19";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_3_jnt" -p "bend_crv_gr";
	rename -uid "E724A61C-4D28-58F9-B46B-0295D89FEEC8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_4_jnt" -p "bend_crv_gr";
	rename -uid "5E3A1ACA-4F08-96CA-D195-B28748BDE274";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_5_jnt" -p "bend_crv_gr";
	rename -uid "00ADE6D3-4257-9D98-52D5-FABD0E447B69";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "bend_crv_6_jnt" -p "bend_crv_gr";
	rename -uid "72D95A41-4C5A-2B2B-0FDB-46A63C7A0805";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "bend_surf" -p "system";
	rename -uid "8930400C-4864-88BE-1734-42806DF42C51";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr ".sp" -type "double3" 9.8150543076945245e-06 0 -0.22639549533562073 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode nurbsSurface -n "bend_surfShape" -p "bend_surf";
	rename -uid "9E1FBDB3-418F-AC2E-8109-5F8F19077A84";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode nurbsSurface -n "bend_surfShapeOrig" -p "bend_surf";
	rename -uid "28E70910-4F9D-E62F-6253-FBBFD473D571";
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
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 0.25 0.5 0.75 1 1 1
		2 0 1
		
		14
		0.0043710247026231396 -9.8107190905308977e-06 0.22639549533562153
		0.0043710333730571935 9.8107190905317634e-06 -0.22639549533562059
		-3.4694469519536142e-17 0.86776859504132242 0.22639694415353209
		3.4694469519536142e-17 0.86776859504132253 -0.2263969441535312
		3.5988163824166725e-05 1.6442954775438094 0.22639984178935385
		-3.5988163824165857e-05 1.6442951264830366 -0.22639984178935185
		8.2112349705962067e-05 2.5000000300930223 0.22640418824308492
		-8.2112349705962175e-05 2.4999999699069773 -0.22640418824308328
		0.000128113124338995 3.3444816134180786 0.2264085346968161
		-0.00012811312433899495 3.3444815972842625 -0.22640853469681485
		9.1191646965701716e-05 4.1500000031868751 0.22641143233263689
		-0.00022634935980411972 4.1499999968131274 -0.22641143233263575
		0.00013901251779507764 5.0003361092131327 0.22641288115054736
		-0.00020918445288213775 5.0003361063042799 -0.22641288115054639
		
		;
createNode transform -n "output" -p "mod";
	rename -uid "7A1154E2-484B-A847-A0EB-DE977294AB37";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -n "outJoints" -p "output";
	rename -uid "00D62505-4455-DCEC-9124-28A2EEE51C8D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ovdt" 1;
	setAttr ".ovc" 15;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "CF700D66-4DFB-7204-0E48-87BCE45F4A70";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".s" -type "double3" 0.99999999999999933 0.99999999999999933 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.8116296351744994e-16 1.3086626529693604 1.4529074087936241e-16 0
		 -4.3587222263808726e-16 0 1.3086626529693604 0 1.3086626529693604 -4.3587222263808726e-16 5.8116296351744994e-16 0
		 0 1.4381153442047454 -0.053282215027789577 1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_1_outJoint" -p "root_outJoint";
	rename -uid "0220C22C-41B9-14E1-0EED-B89535466BA9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.801911150559539e-17 0.20000000000000001 1.3877787807814457e-17 1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_2_outJoint" -p "local_1_outJoint";
	rename -uid "D658F84B-4654-F172-4828-709E62DE8788";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 0 1.1102230246251563e-16 0 1.110223024625156e-16 1 2.2204460492503141e-16 0
		 -2.2204460492503126e-16 -1.1102230246251563e-16 1 0 -1.2779255513307275e-17 0.49999999999999994 3.4694469519536142e-17 1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_3_outJoint" -p "local_2_outJoint";
	rename -uid "80DC03C0-4FCB-F7DC-F890-4D84CDFA71FF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".smd" 7;
	setAttr ".bps" -type "matrix" 1 -4.4408920985006262e-16 1.1102230246251563e-16 0
		 5.5511151231257827e-16 1 2.2204460492503141e-16 0 -2.2204460492503131e-16 -1.1102230246251563e-16 1 0
		 -3.9814767661208665e-18 0.80000000000000004 2.0816681711721685e-17 1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_4_outJoint" -p "local_3_outJoint";
	rename -uid "D0B33FDD-45DE-A572-CBBE-C3B6A1489F42";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_5_outJoint" -p "local_4_outJoint";
	rename -uid "86A246A5-4A16-7B31-3E34-1EA9D02D1042";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "local_end_outJoint" -p "local_5_outJoint";
	rename -uid "16CADB90-40DE-C3A1-5F40-46B48619B6EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.0071222513539054297 0.010420800732546852 -7.6380969223760837e-06 ;
	setAttr ".is" -type "double3" 1 1.0015161037445068 1.0015161037445068 ;
	setAttr ".bps" -type "matrix" 5.0083313344102273e-16 1.3086626529693606 0 0 -5.0083313344102253e-16 0 1.3086626529693604 0
		 1.1277759565698935 -5.8116296351744994e-16 5.8116296351744994e-16 0 1.28255683619515e-15 2.4287496299346061 0.065118794613545639 1;
	setAttr ".ds" 2;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode joint -n "end_outJoint" -p "outJoints";
	rename -uid "98CF7E4F-479D-91AC-FB62-909545DBE9AF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode transform -s -n "persp";
	rename -uid "AC13B68F-495E-A899-A7A5-3E8FBC763B4B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 12.791393157655987 6.227347627587438 7.6926978752344857 ;
	setAttr ".r" -type "double3" -22.80000000000307 -298.39999999999958 3.3435584446812893e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "EF8C7253-4B05-53CE-F867-FB99F288CF17";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 15.823976638138166;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "FB97886E-487B-1BAA-E2B9-098BF07A01C8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.1220108330006529 46.395166304728242 3.5856149697752011 ;
	setAttr ".r" -type "double3" -90 -270 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "01440723-459C-C592-D553-A8885EF63645";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 24.389243541199818;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "BAA31F18-460A-075C-9A77-5E96A68851B9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.92631375510956682 -1.2754275892323594 -40.491966573921701 ;
	setAttr ".r" -type "double3" 0 -180 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "0E963C49-4A96-A01B-51E1-26B674CB1A23";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 43.144381395376321;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "CFBE4291-49E5-49EF-3F1E-B6819FF28C6E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 26.511251369074447 -1.3797256478127118 2.1323159952380397 ;
	setAttr ".r" -type "double3" 0 -270 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "FBF1BC09-46DC-B6D5-C49A-04AED675C293";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".fcp" 50000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 22.32818070673223;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode objectSet -n "sets";
	rename -uid "9B8AF8DE-40BB-707B-9D6C-49916FC28F58";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "parts_multiplyDivide";
	rename -uid "7F7A954E-42A5-2C6E-8CD4-A69C7D5CCC6D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4 -4 8 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "end_decomposeMatrix";
	rename -uid "8726335B-47E5-D418-F71F-7DB16A1D26DB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "end_multMatrix";
	rename -uid "C0DAC838-4CE0-6E0F-F9D4-D48BFB7FA769";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupId -n "skinCluster2GroupId";
	rename -uid "672EE49C-434F-0330-3328-56926226D8CB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "skinCluster2Set";
	rename -uid "E999F0A5-4D7C-1E78-7985-FB85FCD097E8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode skinCluster -n "skinCluster2";
	rename -uid "8EB51B70-4290-F87E-D633-8684644DDA42";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 2 1
		1 2 1
		1 1 1
		1 1 1
		1 5 1
		1 5 1
		1 6 1
		1 6 1
		1 0 1
		1 0 1
		1 3 1
		1 3 1
		1 4 1
		1 4 1;
	setAttr -s 7 ".pm";
	setAttr ".pm[0]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -3.3500837520938025 -1.6517188132768261e-31 7.438680231994349e-16 1;
	setAttr ".pm[1]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -0.8500369346712815 -4.1910056609755058e-32 1.8874611533076937e-16 1;
	setAttr ".pm[2]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 0 0 0 1;
	setAttr ".pm[3]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -4.1499975100014934 -2.0461067452529524e-31 9.2148455754814527e-16 1;
	setAttr ".pm[4]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -5 -2.4651903288156641e-31 1.1102230246251563e-15 1;
	setAttr ".pm[5]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -1.6499162479061975 -8.1347151553883643e-32 3.6635500142572164e-16 1;
	setAttr ".pm[6]" -type "matrix" 2.2204460492503131e-16 -2.2204460492503131e-16 1 0
		 1 4.9303806576313238e-32 -2.2204460492503131e-16 0 4.9303806576313238e-32 1 2.2204460492503131e-16 0
		 -2.5 -1.2325951644078309e-31 5.5511151231257827e-16 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 7 ".ma";
	setAttr -s 7 ".dpf[0:6]"  4 4 4 4 4 4 4;
	setAttr -s 7 ".lw";
	setAttr -s 7 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 6;
	setAttr ".ucm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode dagPose -n "bindPose7";
	rename -uid "857C4CCD-47A9-7E2D-ED7E-49AB41A17836";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 11 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[4]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 3.3500837520938025 0 1;
	setAttr ".wm[5]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 0.8500369346712815 0 1;
	setAttr ".wm[6]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 0 0 1;
	setAttr ".wm[7]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 4.1499975100014934 0 1;
	setAttr ".wm[8]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 5 0 1;
	setAttr ".wm[9]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 1.6499162479061975 0 1;
	setAttr ".wm[10]" -type "matrix" 2.2204460492503131e-16 1 0 0 -2.2204460492503131e-16 0 1 0
		 1 -2.2204460492503131e-16 2.2204460492503131e-16 0 0 2.5 0 1;
	setAttr -s 11 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 3.3500837520938025 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 0.8500369346712815 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 4.1499975100014934 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 1.6499162479061975 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 1.5707963267948966 0 1.5707963267948966 0 0
		 2.5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 11 ".m";
	setAttr -s 11 ".p";
	setAttr -s 11 ".g[0:10]" yes yes yes yes no no no no no no no;
	setAttr ".bp" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupParts -n "skinCluster2GroupParts";
	rename -uid "0887490C-4FA0-F19B-DF7B-C5B944C15DD6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode tweak -n "tweak27";
	rename -uid "8AD1F57E-48D6-5E37-D792-FCB18E513344";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "tweakSet27";
	rename -uid "CCD827AB-47C5-C4D3-2109-5FA2850B9F31";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupId -n "groupId47";
	rename -uid "2A7E544E-4CDE-936C-83F1-0C8F19F5058F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupParts -n "groupParts47";
	rename -uid "D8A05616-47FE-AAFE-14C4-C2B4F9AABA3A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "root_poser_decMat";
	rename -uid "B98C7263-4F94-D013-0BCF-D59DC80FA454";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "root_connector_decMat";
	rename -uid "384551FF-4C9A-E8C5-9410-3CB0A892865D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "end_decomposeMatrix1";
	rename -uid "4F545A96-4A18-1786-AB45-36B4B347C154";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "end_multMatrix1";
	rename -uid "8DDAC676-4D05-1CF3-CA20-448018CF5DDD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode inverseMatrix -n "inverseMatrix1";
	rename -uid "30D38275-468C-BC71-0FC1-968818696ED6";
createNode condition -n "condition2";
	rename -uid "79DD7529-41CD-8051-E78A-3990287B0C45";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 2;
	setAttr ".ct" -type "float3" 1 1 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition1";
	rename -uid "E4423D59-44B6-1601-C110-C6BCC82B4D4C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ct" -type "float3" 1 1 0 ;
	setAttr ".cf" -type "float3" 0 0 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition3";
	rename -uid "D6D1B4FD-47BD-5DBF-3589-15814DC6E6A4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "decomposeMatrix91";
	rename -uid "54550FB3-4FE7-F64E-0E7B-DA8B0A89395E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix71";
	rename -uid "663203A7-4747-F329-D145-FC9AE7B44D67";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "decomposeMatrix92";
	rename -uid "A69E2EEE-48D1-B85E-5DB2-21B80A550B30";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix72";
	rename -uid "7A37301C-4D28-400B-2372-9DB8F4D7B7C6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "decomposeMatrix93";
	rename -uid "6BF81F93-499E-2641-A717-D38A32165E0B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix73";
	rename -uid "4AA94D79-419E-B931-837F-B98E2A06C45C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode reverse -n "reverse8";
	rename -uid "A718306B-4926-9554-2556-DCA8F2AD55F3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multDoubleLinear -n "curDistance_part";
	rename -uid "ACB4526D-42F3-2208-7D22-51A50F20F02A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" 0.33;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "curDistance_scaled_multiplyDivide";
	rename -uid "DEBF882D-4CC6-23D6-25A8-85BA5C57D721";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".op" 2;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode distanceBetween -n "current_distance";
	rename -uid "A6CD6DBD-4ABC-DF00-8AD7-EE9C6E48662E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointMatrixMult -n "pointMatrixMult5";
	rename -uid "C2CD706C-4EFB-8070-EB9A-93B3024E8BA7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode pointMatrixMult -n "pointMatrixMult6";
	rename -uid "0DD3B21F-46DF-D5BF-4E4E-E1ABB278440B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multDoubleLinear -n "curDistance_part_2";
	rename -uid "2B216556-4E29-D55C-F1B1-7BA309DE768A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" 0.17;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode unitConversion -n "unitConversion31";
	rename -uid "85FA5578-439D-2BCA-322A-F0ACDDB8A1CA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".cf" 0.333;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "decomposeMatrix87";
	rename -uid "7F39A10E-4C42-A4F3-D0E7-F7A889F05E1F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix67";
	rename -uid "DA86CC37-4A62-0639-741F-05902FF155B7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix3";
	rename -uid "51444B4A-482B-38E6-3FD9-759364B13D5D";
createNode multiplyDivide -n "multiplyDivide1855";
	rename -uid "1378D4DB-4F88-E303-B7A5-F1926F639F92";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "multiplyDivide1856";
	rename -uid "F3BA9D11-4814-EA0B-9882-50B54FB12D8B";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -type "float3" -0.20999999 -0.20999999 -0.20999999 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "3038CF82-42A3-4320-51DF-FBB6D3EB07AA";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode addDoubleLinear -n "stomachChestMid_loc_offset";
	rename -uid "0CBB9DAE-4B3A-B83E-F16D-6682664B4021";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 2;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "stomach_offset_multiplyDivide";
	rename -uid "F3C8203A-4A88-05BC-0F05-A0A46E46334D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -type "float3" 0.15000001 -0.15000001 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode distanceBetween -n "stomach_offset_distance";
	rename -uid "50BF49AD-4BE3-0875-BF02-E4A9104835BB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode unitConversion -n "unitConversion29";
	rename -uid "23E8F086-4750-E6F8-1168-CD9F9C291AFC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".cf" -0.333;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "decomposeMatrix86";
	rename -uid "ACAE699A-42B5-9D86-91F4-30B7047ED148";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix66";
	rename -uid "54C836C4-445C-C5E9-C4DD-97A5000A5485";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "bendJoint_4_multiply_position";
	rename -uid "3F256370-4210-DCE3-FFB6-AFB2357A8124";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -type "float3" 0.2 0 0.2 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode addDoubleLinear -n "stomachHipsMid_loc_offset";
	rename -uid "E21D58D5-4D37-B7C9-1984-46969F9528B5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 2;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multDoubleLinear -n "curDistance_part_2_rev";
	rename -uid "2333E57E-4A6C-1535-55D3-68B86CC648F1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode unitConversion -n "unitConversion30";
	rename -uid "C50CC5AF-40DE-6339-13FD-27B669B6232C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".cf" -0.333;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "chest_group_decomposeMatrix";
	rename -uid "196F9421-4DA4-4A6C-EF33-3EA3AB62289C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "chest_group_multMatrix";
	rename -uid "7CD3196B-4DC3-7B6C-7518-989267411B6C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode reverse -n "reverse6";
	rename -uid "056C79B8-4E14-B92C-1E08-7DB5EC77767F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multDoubleLinear -n "multDoubleLinear13";
	rename -uid "A879950F-4F73-9A6A-9DAE-7C9FB665B380";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode unitConversion -n "unitConversion27";
	rename -uid "D53F9B60-4F8C-001C-401D-34ABEF0030FE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".cf" 0.333;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multDoubleLinear -n "curDistance_part_rev";
	rename -uid "1FB4D90B-4BD4-4387-5998-38AD1A269860";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".i2" -1;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "l_b_leg__pelvis__ik_aim_group_decMat";
	rename -uid "A875DFEF-4F89-B8E0-1310-709028F27847";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_b_leg";
createNode multMatrix -n "l_b_leg__pelvis__ik_aim_group_multMat";
	rename -uid "113C3F60-4A9E-EE1C-4C83-D09609B31F18";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_b_leg";
createNode decomposeMatrix -n "r_b_leg__pelvis__ik_aim_group_decMat";
	rename -uid "A520D3E4-4875-501E-0434-76B459873C8E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "r_b_leg";
createNode multMatrix -n "r_b_leg__pelvis__ik_aim_group_multMat";
	rename -uid "A92899F1-4BEE-C3E4-6726-89BDCEF3EC92";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "r_b_leg";
createNode decomposeMatrix -n "l_f_leg__pelvis__ik_aim_group_decMat";
	rename -uid "955894B5-4D1D-0475-0793-B6B6F91EE47F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_f_leg";
createNode multMatrix -n "l_f_leg__pelvis__ik_aim_group_multMat";
	rename -uid "3E996953-47F1-B0AF-A650-1986F057675D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "l_f_leg";
createNode decomposeMatrix -n "r_f_leg__pelvis__ik_aim_group_decMat";
	rename -uid "2AC73554-4D85-E803-17C2-BEAB841201C9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "r_f_leg";
createNode multMatrix -n "r_f_leg__pelvis__ik_aim_group_multMat";
	rename -uid "79063553-4FF4-077C-0CC7-3D9AC40922B6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "r_f_leg";
createNode curveFromSurfaceIso -n "curveFromSurfaceIso1";
	rename -uid "5970F36C-47C1-C31B-F7AB-0BBB929404FF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 1;
	setAttr ".max" 0;
	setAttr ".iv" 0.5;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition7";
	rename -uid "7C0A8E0E-400E-E720-F0C1-B090D06E7C15";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.107 1 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode closestPointOnSurface -n "closestPointOnSurface1";
	rename -uid "F1CC060A-489A-336C-F3CA-8C90E192AFB6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode blendTwoAttr -n "squash_blendTwoAttr";
	rename -uid "5FC5A7C2-4176-17A4-DA18-E0BDFD2CA1C1";
	addAttr -ci true -sn "const" -ln "const" -dv 1 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -s 2 ".i";
	setAttr -k on ".const";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "multiplyDivide1849";
	rename -uid "CFE231B8-44D8-1357-96F0-029A6DFF8BA8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".op" 2;
	setAttr ".i1" -type "float3" 1 0 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "multiplyDivide1846";
	rename -uid "274C77C4-4CF5-BE96-170F-E9B707E33B78";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".op" 2;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multiplyDivide -n "multiplyDivide1853";
	rename -uid "767284FF-468B-4AD5-FC29-DF9CD147C12E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode distanceBetween -n "distanceBetween1";
	rename -uid "10E25065-4B84-9FFC-FA66-F287C6C4A384";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode curveInfo -n "curveInfo3";
	rename -uid "D9A3F053-4680-46FD-B361-D39CA9518B2C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition8";
	rename -uid "E98B3DAE-47A7-24D3-2843-4785EEEE4C7C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.25999999 1 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode closestPointOnSurface -n "closestPointOnSurface2";
	rename -uid "3F9A7ABF-4E8E-156F-36FF-CCAE483439E5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition10";
	rename -uid "B2640A19-4F7F-E469-EC80-1993D032B875";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.49900001 1 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode closestPointOnSurface -n "closestPointOnSurface4";
	rename -uid "36962E7A-4C14-89B2-FBD6-9FB05D732854";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition9";
	rename -uid "D375BEBF-420B-7922-E5BB-A59CDD82290E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.74000001 1 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode closestPointOnSurface -n "closestPointOnSurface3";
	rename -uid "23D7FA18-4387-563D-1B16-20A02D352BDF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "condition11";
	rename -uid "7E496DA5-47F5-EB38-3789-7D8724E12FA7";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".cf" -type "float3" 0.89300001 1 1 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode closestPointOnSurface -n "closestPointOnSurface5";
	rename -uid "5CE3B2FE-4042-AE61-93AC-EE9BD9663E13";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_0_mpath";
	rename -uid "3D8BB8D3-4C3C-0262-9AD5-EA807C92075E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_1_mpath";
	rename -uid "DD047BA2-42D8-D857-5579-A887CB4A341A";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".u" 0.16666666666666666;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_2_mpath";
	rename -uid "4A3149B4-4B62-5CFA-58F4-C3A68B9FB36D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".u" 0.33333333333333331;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_3_mpath";
	rename -uid "CC7F0074-4353-05D0-5A74-708C6291B1E8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".u" 0.5;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_4_mpath";
	rename -uid "0FD1E70C-48C8-4C81-0C1C-2E9AB078AFFC";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".u" 0.66666666666666663;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_5_mpath";
	rename -uid "761E369C-494A-2611-7811-E492D2D6B7EF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".u" 0.83333333333333326;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode motionPath -n "bend_crv_6_mpath";
	rename -uid "86B2D64E-4ABF-997A-6DDB-87AC6158A6BF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".u" 1;
	setAttr ".fa" 0;
	setAttr ".ua" 1;
	setAttr ".fm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupId -n "skinCluster1GroupId";
	rename -uid "00F18C35-49B5-D925-9C56-D28DECC43A5E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "skinCluster1Set";
	rename -uid "613C7D4D-4C62-279E-6B9E-F4AB99A3E234";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode skinCluster -n "skinCluster1";
	rename -uid "C0E18F87-4B2B-AF8D-962A-FFB4ECB5AC31";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ip[0].gtg" -type "string" "";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 2 1
		1 2 1
		1 3 1
		1 3 1
		1 4 1
		1 4 1
		1 5 1
		1 5 1
		1 6 1
		1 6 1;
	setAttr -s 7 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000009 0 0
		 0 0 1.0000000000000009 0 0 0 0 1;
	setAttr ".pm[1]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000009 0 0
		 0 0 1.0000000000000009 0 0 -0.84999999999999987 0 1;
	setAttr ".pm[2]" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 1.1275702593849246e-16 -1.6499999999999977 -5.5500309209532972e-16 1;
	setAttr ".pm[3]" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 0 -2.4999999999999973 -4.4408920985006242e-16 1;
	setAttr ".pm[4]" -type "matrix" 1.0000000000000002 0 0 0 0 0.99999999999999956 0 0
		 0 0 0.99999999999999956 0 7.8062556418956319e-17 -3.3499999999999961 -1.074444352933136e-16 1;
	setAttr ".pm[5]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 -4.1500000000000021 0 1;
	setAttr ".pm[6]" -type "matrix" 1.0000000000000002 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 -5.0000000000000018 0 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 7 ".ma";
	setAttr -s 7 ".dpf[0:6]"  4 4 4 4 4 4 4;
	setAttr -s 7 ".lw";
	setAttr -s 7 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 6;
	setAttr ".ucm" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode dagPose -n "bindPose6";
	rename -uid "4D0A953B-41CC-7DBB-A82A-0DAC819983B6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 26 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[4]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 -8.8817841970012523e-16 4.4408920985006262e-16 1;
	setAttr ".wm[5]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 1.1102230246251526e-16 0 1;
	setAttr ".wm[6]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 1.1102230246251526e-16 0 1;
	setAttr ".wm[7]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 1.2499999999999991 0 1;
	setAttr ".wm[8]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999933 0 0
		 0 0 0.99999999999999933 0 0 1.2499999999999991 0 1;
	setAttr ".wm[11]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 -8.8817841970012523e-16 4.4408920985006262e-16 1;
	setAttr ".wm[12]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".wm[13]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".wm[14]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 0 2.4999999999999987 4.4408920985006252e-16 1;
	setAttr ".wm[15]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 -1.7347234759768069e-18 1.6499999999999986 5.5511151231257857e-16 1;
	setAttr ".wm[18]" -type "matrix" 0.99999999999999989 0 0 0 0 1.0000000000000004 0 0
		 0 0 1.0000000000000004 0 3.2959746043559341e-17 3.3499999999999988 1.075528555105622e-16 1;
	setAttr ".wm[20]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.9999999999999982 0 1;
	setAttr ".wm[21]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.9999999999999982 0 1;
	setAttr ".wm[23]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.1500000000000004 0 1;
	setAttr ".wm[24]" -type "matrix" 0.99999999999999989 0 0 0 0 0.99999999999999967 0 0
		 0 0 0.99999999999999967 0 0 4.1500000000000004 0 1;
	setAttr -s 26 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999967 0.99999999999999967 0
		 0 0 2 0 -8.8817841970012523e-16 4.4408920985006262e-16 0 0 0 0 8.8817841970012523e-16
		 2.2204460492503131e-16 0 -3.9443045261050617e-31 -9.8607613152626443e-32 0 8.8817841970012484e-16
		 2.2204460492503121e-16 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 9.9920072216264089e-16
		 -4.4408920985006281e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999967 0.99999999999999967 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 1.25 0 0 0 0 0 -1.1102230246251563e-16
		 0 0 0 0 0 -1.1102230246251563e-16 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0 0 0 3 0 0 0 0 0 0 0 -1.1102230246251563e-16
		 0 0 0 0 0 -1.1102230246251563e-16 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.25 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0.84999999999999987
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1.0000000000000009 1.0000000000000009 0
		 0 0 2 0 2.5000000000000004 -9.8607613152626476e-32 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.7347234759768071e-18
		 -0.84999999999999987 1.11022302462516e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251563e-16
		 -2.2204460492503131e-16 -1.0842021724855044e-19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.2959746043559347e-17
		 0.84999999999999987 -3.3653635433950018e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251563e-16
		 -1.3322676295501878e-15 -1.0842021724855044e-19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.0000000000000009
		 -4.4408920985006281e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 1.7763568394002505e-15
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -0.84999999999999987
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 8.8817841970012523e-16
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 26 ".m";
	setAttr -s 26 ".p";
	setAttr -s 26 ".g[0:25]" yes yes yes yes yes yes yes yes yes no no 
		yes yes yes yes yes no no yes no yes yes no yes yes no;
	setAttr ".bp" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupParts -n "skinCluster1GroupParts";
	rename -uid "27628069-46A1-6209-36C0-6EA63063E94D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode tweak -n "tweak26";
	rename -uid "C9FCF107-4D0E-300D-EE8F-81B8E0BB0132";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "tweakSet26";
	rename -uid "F2E9A5AB-4C07-22AD-6E32-2FB07FD274A9";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupId -n "groupId45";
	rename -uid "80FF62C6-46E3-060E-7C95-478EAF5BDDA4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode groupParts -n "groupParts45";
	rename -uid "8E46CB63-48E6-81BA-20C8-34BB2E5DABA3";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*][*]";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multDoubleLinear -n "multDoubleLinear14";
	rename -uid "05B2B506-4AAB-3779-7161-3A9F7E52E53E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode condition -n "mirror_condition";
	rename -uid "80EECFC1-450B-E19D-8D5A-0DBC93E0A4CD";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".st" 1;
	setAttr ".ct" -type "float3" -1 0 0 ;
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "decomposeMatrix90";
	rename -uid "22E3C769-48E3-D2D7-7D03-F6AA780A660C";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "multMatrix69";
	rename -uid "10BDF9E7-47F7-12C3-3913-E3BA2644E8ED";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "spine_2_skinJoint_decMat";
	rename -uid "A8455A26-4474-34BB-CC4C-149952BFD0D4";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "spine_2_skinJoint_multMat";
	rename -uid "BBA2A8E5-4BF9-C0A4-88C2-EEA61EFF75F1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "spine_3_skinJoint_decMat";
	rename -uid "E4802FC5-48A4-33D2-2348-3BA7C335C9E1";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "spine_3_skinJoint_multMat";
	rename -uid "F9FD7000-4CA4-14E3-DD34-4FBAFA57C9F6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "spine_4_skinJoint_decMat";
	rename -uid "68168D1D-4D2D-4BFC-FA2F-C5BEBB0D93FF";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "spine_4_skinJoint_multMat";
	rename -uid "63CB89B3-4EAD-4914-06B7-829D4F43BEC6";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "spine_4_skinJoint_decMat1";
	rename -uid "66DB85FB-46DE-8E12-65AB-3C8EA25EE863";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "spine_4_skinJoint_multMat1";
	rename -uid "5655BF52-4708-EBF2-96FC-ED8D6E3B8398";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "spine_5_skinJoint_decMat1";
	rename -uid "E069BA60-4839-A3D4-5F66-769D8F57C6EB";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "spine_5_skinJoint_multMat1";
	rename -uid "9FE084EA-4D50-B225-F1DC-F38373EC0F7E";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "local_end_outJoint_decMat";
	rename -uid "21396203-47DB-642A-7BA0-1496F317DBBE";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "local_end_outJoint_multMat";
	rename -uid "C6EEB655-48A1-B51F-D317-D28F6510CF00";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode decomposeMatrix -n "spine_5_skinJoint_decMat2";
	rename -uid "9A6D674E-4771-C2C7-5107-50B00CC8DA6D";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode multMatrix -n "spine_5_skinJoint_multMat2";
	rename -uid "0F59087B-487C-408F-DA82-4981EFD9041F";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr -s 2 ".i";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "moduleControlSet";
	rename -uid "CB9BCCCB-43DB-A6E7-324E-B4B67D62D0C8";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr -s 3 ".dnsm";
	setAttr ".an" -type "string" "gControlSet";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "fk_moduleControlSet";
	rename -uid "7CBAE711-4490-5043-4BB1-909B674D7A41";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "ik_moduleControlSet";
	rename -uid "528AD5C0-42BA-F42D-0C5D-0081BDF4DC87";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode objectSet -n "local_moduleControlSet";
	rename -uid "0DBCCCF6-45E1-0F47-933C-69AD4F8A99A5";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".an" -type "string" "gControlSet";
	setAttr -l on ".moduleName" -type "string" "spine";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "0465DFF9-4757-F4B9-74E9-8F83BC87169F";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "2755A5EC-46D1-155A-AF92-92B9BF651A73";
createNode displayLayer -n "defaultLayer";
	rename -uid "3DF757F5-495E-DB06-99B0-588B08501959";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "D6B5D431-4956-C3D4-E5A2-84A5A202B78F";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "04188ACD-4CDA-2407-8149-A4AA33729B45";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "AC14711C-4B2A-100F-E5FA-2DA8EC82C04C";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "4FE4D65A-4EB3-757F-44DA-55B18AC76D4A";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "44E9BD11-4311-193A-EB51-2C8A7D18E2D2";
	setAttr ".b" -type "string" "playbackOptions -min -10 -max 100 -ast -10 -aet 100 ";
	setAttr ".st" 6;
createNode objectSet -n "skinJointsSet";
	rename -uid "973C35EA-421D-6E3B-2A78-7D85E514E857";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
createNode cluster -n "mainPoser_clusterHandleCluster";
	rename -uid "496F5062-4709-713E-42BC-73AA52C6A6C9";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode multiplyDivide -n "multiplyDivide1857";
	rename -uid "83461F46-4493-F498-FC9B-79BC296343CF";
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "35ABAF48-42CD-139F-D7E2-B6BF1DD2E141";
createNode makeNurbSphere -n "makeNurbSphere2";
	rename -uid "B4BC5061-473A-9592-FE9A-79B59AFB8C2A";
createNode multiplyDivide -n "multiplyDivide1858";
	rename -uid "89F870E6-4E92-15C4-EA34-92BB3F73FBAD";
createNode makeNurbSphere -n "makeNurbSphere3";
	rename -uid "6795B0D8-4C61-677A-87DE-5F97D417FC62";
createNode makeNurbSphere -n "makeNurbSphere4";
	rename -uid "F67D6D40-4EE8-BD56-CC1F-D48EFCC40991";
createNode makeNurbSphere -n "makeNurbSphere5";
	rename -uid "880B3BD6-4A90-8F33-0A33-AD90343141B6";
createNode makeNurbSphere -n "makeNurbSphere6";
	rename -uid "0DD38629-455D-ADBF-77EC-73B8109F2E55";
createNode makeNurbSphere -n "makeNurbSphere7";
	rename -uid "BAE620DC-4130-74F1-7DDA-1B938CA36A38";
createNode multiplyDivide -n "multiplyDivide1859";
	rename -uid "FC4980DE-4EB3-FD30-B404-62A712FC6D8A";
createNode sweepMeshCreator -n "sweepMeshCreator1";
	rename -uid "E8DB30BD-4F03-6549-BF42-179783BAB2BC";
	setAttr ".profileRectWidth" 2;
	setAttr ".profileRectHeight" 2;
	setAttr ".profileRectCornerRadius" 0.4;
	setAttr ".profileWaveAmplitude" 0.25;
	setAttr -s 2 ".taperCurve[0:1]"  0 1 1 1 1 1;
	setAttr ".interpolationDistance" 3;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "1B6E6DB4-45EA-7131-9B13-0BA2944E6C94";
	setAttr -s 2 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -6066.6668513464738 -3995.8332898597919 ;
	setAttr ".tgi[0].vh" -type "double2" 7647.6191694774225 -281.54749255332007 ;
	setAttr -s 26 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 866.3858642578125;
	setAttr ".tgi[0].ni[0].y" -1272.8685302734375;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 868.5714111328125;
	setAttr ".tgi[0].ni[1].y" -1062.857177734375;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 540.6658935546875;
	setAttr ".tgi[0].ni[2].y" -1056.8753662109375;
	setAttr ".tgi[0].ni[2].nvs" 18305;
	setAttr ".tgi[0].ni[3].x" 514.938720703125;
	setAttr ".tgi[0].ni[3].y" -1842.728271484375;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" 1070.41748046875;
	setAttr ".tgi[0].ni[4].y" -2033.8170166015625;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 823.00128173828125;
	setAttr ".tgi[0].ni[5].y" -1463.3818359375;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" 98.855224609375;
	setAttr ".tgi[0].ni[6].y" -1698.865478515625;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 1066.955810546875;
	setAttr ".tgi[0].ni[7].y" -1703.38671875;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" 515.72796630859375;
	setAttr ".tgi[0].ni[8].y" -1441.288330078125;
	setAttr ".tgi[0].ni[8].nvs" 18305;
	setAttr ".tgi[0].ni[9].x" 809.50897216796875;
	setAttr ".tgi[0].ni[9].y" -1584.7791748046875;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" 787.0238037109375;
	setAttr ".tgi[0].ni[10].y" -1699.528076171875;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 112.21857452392578;
	setAttr ".tgi[0].ni[11].y" -1815.5250244140625;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" 93.33343505859375;
	setAttr ".tgi[0].ni[12].y" -2025.2164306640625;
	setAttr ".tgi[0].ni[12].nvs" 18305;
	setAttr ".tgi[0].ni[13].x" 109.22055053710938;
	setAttr ".tgi[0].ni[13].y" -1938.51904296875;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" 1175.7142333984375;
	setAttr ".tgi[0].ni[14].y" -1062.857177734375;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" 799.8516845703125;
	setAttr ".tgi[0].ni[15].y" -2036.1761474609375;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" 825.2952880859375;
	setAttr ".tgi[0].ni[16].y" -2196.951416015625;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" 1074.4713134765625;
	setAttr ".tgi[0].ni[17].y" -1478.1470947265625;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" 187.71450805664062;
	setAttr ".tgi[0].ni[18].y" -1281.7542724609375;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" 1079.83447265625;
	setAttr ".tgi[0].ni[19].y" -1925.4886474609375;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" 1175.7142333984375;
	setAttr ".tgi[0].ni[20].y" -1280;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" 1075.2315673828125;
	setAttr ".tgi[0].ni[21].y" -1590.32080078125;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" 107.88237762451172;
	setAttr ".tgi[0].ni[22].y" -1585.2283935546875;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" 118.32503509521484;
	setAttr ".tgi[0].ni[23].y" -1449.77587890625;
	setAttr ".tgi[0].ni[23].nvs" 18304;
	setAttr ".tgi[0].ni[24].x" 178.25918579101562;
	setAttr ".tgi[0].ni[24].y" -1220.3131103515625;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" 780.89495849609375;
	setAttr ".tgi[0].ni[25].y" -1913.9818115234375;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -996.84061972977202 -327.38093937200267 ;
	setAttr ".tgi[1].vh" -type "double2" 2436.1262768234128 602.38092844448488 ;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" -10;
	setAttr -av -k on ".unw" -10;
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
	setAttr -av -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -av -k on ".hwi";
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
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 52 ".u";
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
	setAttr -s 2 ".dsm";
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
	setAttr -k on ".ar";
	setAttr -av -k on ".fs" 1;
	setAttr -av -k on ".ef" 10;
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "mainPoser_clusterHandleCluster.og[0]" "mainPoserShape.cr";
connectAttr "makeNurbSphere1.os" "root_poserShape.cr";
connectAttr "parts_multiplyDivide.ox" "fk_1_initLoc.ty";
connectAttr "parts_multiplyDivide.ox" "fk_2_initLoc.ty";
connectAttr "parts_multiplyDivide.ox" "fk_3_initLoc.ty";
connectAttr "makeNurbSphere2.os" "end_poserShape.cr";
connectAttr "end_poserOrient_aimConstraint1.crx" "end_poserOrient.rx";
connectAttr "end_poserOrient_aimConstraint1.cry" "end_poserOrient.ry";
connectAttr "end_poserOrient_aimConstraint1.crz" "end_poserOrient.rz";
connectAttr "end_poserOrient.pim" "end_poserOrient_aimConstraint1.cpim";
connectAttr "end_poserOrient.t" "end_poserOrient_aimConstraint1.ct";
connectAttr "end_poserOrient.rp" "end_poserOrient_aimConstraint1.crp";
connectAttr "end_poserOrient.rpt" "end_poserOrient_aimConstraint1.crt";
connectAttr "end_poserOrient.ro" "end_poserOrient_aimConstraint1.cro";
connectAttr "root_poser.t" "end_poserOrient_aimConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "end_poserOrient_aimConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "end_poserOrient_aimConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "end_poserOrient_aimConstraint1.tg[0].tpm";
connectAttr "end_poserOrient_aimConstraint1.w0" "end_poserOrient_aimConstraint1.tg[0].tw"
		;
connectAttr "mainPoser.wm" "end_poserOrient_aimConstraint1.wum";
connectAttr "local_1_poser_group_pointConstraint1.ctx" "local_1_poser_group.tx";
connectAttr "local_1_poser_group_pointConstraint1.cty" "local_1_poser_group.ty";
connectAttr "local_1_poser_group_pointConstraint1.ctz" "local_1_poser_group.tz";
connectAttr "end_poserOrient.r" "local_1_poser_group.r";
connectAttr "makeNurbSphere3.os" "local_1_poserShape.cr";
connectAttr "local_1_poser_group.pim" "local_1_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_1_poser_group.rp" "local_1_poser_group_pointConstraint1.crp";
connectAttr "local_1_poser_group.rpt" "local_1_poser_group_pointConstraint1.crt"
		;
connectAttr "root_poser.t" "local_1_poser_group_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "local_1_poser_group_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "local_1_poser_group_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "local_1_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_1_poser_group_pointConstraint1.w0" "local_1_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_poser.t" "local_1_poser_group_pointConstraint1.tg[1].tt";
connectAttr "end_poser.rp" "local_1_poser_group_pointConstraint1.tg[1].trp";
connectAttr "end_poser.rpt" "local_1_poser_group_pointConstraint1.tg[1].trt";
connectAttr "end_poser.pm" "local_1_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_1_poser_group_pointConstraint1.w1" "local_1_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_2_poser_group_pointConstraint1.ctx" "local_2_poser_group.tx";
connectAttr "local_2_poser_group_pointConstraint1.cty" "local_2_poser_group.ty";
connectAttr "local_2_poser_group_pointConstraint1.ctz" "local_2_poser_group.tz";
connectAttr "end_poserOrient.r" "local_2_poser_group.r";
connectAttr "makeNurbSphere4.os" "local_2_poserShape.cr";
connectAttr "local_2_poser_group.pim" "local_2_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_2_poser_group.rp" "local_2_poser_group_pointConstraint1.crp";
connectAttr "local_2_poser_group.rpt" "local_2_poser_group_pointConstraint1.crt"
		;
connectAttr "root_poser.t" "local_2_poser_group_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "local_2_poser_group_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "local_2_poser_group_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "local_2_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_2_poser_group_pointConstraint1.w0" "local_2_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_poser.t" "local_2_poser_group_pointConstraint1.tg[1].tt";
connectAttr "end_poser.rp" "local_2_poser_group_pointConstraint1.tg[1].trp";
connectAttr "end_poser.rpt" "local_2_poser_group_pointConstraint1.tg[1].trt";
connectAttr "end_poser.pm" "local_2_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_2_poser_group_pointConstraint1.w1" "local_2_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_3_poser_group_pointConstraint1.ctx" "local_3_poser_group.tx";
connectAttr "local_3_poser_group_pointConstraint1.cty" "local_3_poser_group.ty";
connectAttr "local_3_poser_group_pointConstraint1.ctz" "local_3_poser_group.tz";
connectAttr "end_poserOrient.r" "local_3_poser_group.r";
connectAttr "makeNurbSphere5.os" "local_3_poserShape.cr";
connectAttr "local_3_poser_group.pim" "local_3_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_3_poser_group.rp" "local_3_poser_group_pointConstraint1.crp";
connectAttr "local_3_poser_group.rpt" "local_3_poser_group_pointConstraint1.crt"
		;
connectAttr "root_poser.t" "local_3_poser_group_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "local_3_poser_group_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "local_3_poser_group_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "local_3_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_3_poser_group_pointConstraint1.w0" "local_3_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "end_poser.t" "local_3_poser_group_pointConstraint1.tg[1].tt";
connectAttr "end_poser.rp" "local_3_poser_group_pointConstraint1.tg[1].trp";
connectAttr "end_poser.rpt" "local_3_poser_group_pointConstraint1.tg[1].trt";
connectAttr "end_poser.pm" "local_3_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_3_poser_group_pointConstraint1.w1" "local_3_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_4_poser_group_pointConstraint1.ctx" "local_4_poser_group.tx";
connectAttr "local_4_poser_group_pointConstraint1.cty" "local_4_poser_group.ty";
connectAttr "local_4_poser_group_pointConstraint1.ctz" "local_4_poser_group.tz";
connectAttr "end_poserOrient.r" "local_4_poser_group.r";
connectAttr "makeNurbSphere7.os" "local_4_poserShape.cr";
connectAttr "local_4_poser_group.pim" "local_4_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_4_poser_group.rp" "local_4_poser_group_pointConstraint1.crp";
connectAttr "local_4_poser_group.rpt" "local_4_poser_group_pointConstraint1.crt"
		;
connectAttr "end_poser.t" "local_4_poser_group_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "local_4_poser_group_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "local_4_poser_group_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "local_4_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_4_poser_group_pointConstraint1.w0" "local_4_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "root_poser.t" "local_4_poser_group_pointConstraint1.tg[1].tt";
connectAttr "root_poser.rp" "local_4_poser_group_pointConstraint1.tg[1].trp";
connectAttr "root_poser.rpt" "local_4_poser_group_pointConstraint1.tg[1].trt";
connectAttr "root_poser.pm" "local_4_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_4_poser_group_pointConstraint1.w1" "local_4_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "local_5_poser_group_pointConstraint1.ctx" "local_5_poser_group.tx";
connectAttr "local_5_poser_group_pointConstraint1.cty" "local_5_poser_group.ty";
connectAttr "local_5_poser_group_pointConstraint1.ctz" "local_5_poser_group.tz";
connectAttr "end_poserOrient.r" "local_5_poser_group.r";
connectAttr "makeNurbSphere6.os" "local_5_poserShape.cr";
connectAttr "local_5_poser_group.pim" "local_5_poser_group_pointConstraint1.cpim"
		;
connectAttr "local_5_poser_group.rp" "local_5_poser_group_pointConstraint1.crp";
connectAttr "local_5_poser_group.rpt" "local_5_poser_group_pointConstraint1.crt"
		;
connectAttr "end_poser.t" "local_5_poser_group_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "local_5_poser_group_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "local_5_poser_group_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "local_5_poser_group_pointConstraint1.tg[0].tpm";
connectAttr "local_5_poser_group_pointConstraint1.w0" "local_5_poser_group_pointConstraint1.tg[0].tw"
		;
connectAttr "root_poser.t" "local_5_poser_group_pointConstraint1.tg[1].tt";
connectAttr "root_poser.rp" "local_5_poser_group_pointConstraint1.tg[1].trp";
connectAttr "root_poser.rpt" "local_5_poser_group_pointConstraint1.tg[1].trt";
connectAttr "root_poser.pm" "local_5_poser_group_pointConstraint1.tg[1].tpm";
connectAttr "local_5_poser_group_pointConstraint1.w1" "local_5_poser_group_pointConstraint1.tg[1].tw"
		;
connectAttr "fk_bone_3_pivot_loc_pointConstraint1.ctx" "fk_3_pivot_loc.tx";
connectAttr "fk_bone_3_pivot_loc_pointConstraint1.cty" "fk_3_pivot_loc.ty";
connectAttr "fk_bone_3_pivot_loc_pointConstraint1.ctz" "fk_3_pivot_loc.tz";
connectAttr "fk_3_pivot_loc.pim" "fk_bone_3_pivot_loc_pointConstraint1.cpim";
connectAttr "fk_3_pivot_loc.rp" "fk_bone_3_pivot_loc_pointConstraint1.crp";
connectAttr "fk_3_pivot_loc.rpt" "fk_bone_3_pivot_loc_pointConstraint1.crt";
connectAttr "local_5_poser.t" "fk_bone_3_pivot_loc_pointConstraint1.tg[0].tt";
connectAttr "local_5_poser.rp" "fk_bone_3_pivot_loc_pointConstraint1.tg[0].trp";
connectAttr "local_5_poser.rpt" "fk_bone_3_pivot_loc_pointConstraint1.tg[0].trt"
		;
connectAttr "local_5_poser.pm" "fk_bone_3_pivot_loc_pointConstraint1.tg[0].tpm";
connectAttr "fk_bone_3_pivot_loc_pointConstraint1.w0" "fk_bone_3_pivot_loc_pointConstraint1.tg[0].tw"
		;
connectAttr "local_4_poser.t" "fk_bone_3_pivot_loc_pointConstraint1.tg[1].tt";
connectAttr "local_4_poser.rp" "fk_bone_3_pivot_loc_pointConstraint1.tg[1].trp";
connectAttr "local_4_poser.rpt" "fk_bone_3_pivot_loc_pointConstraint1.tg[1].trt"
		;
connectAttr "local_4_poser.pm" "fk_bone_3_pivot_loc_pointConstraint1.tg[1].tpm";
connectAttr "fk_bone_3_pivot_loc_pointConstraint1.w1" "fk_bone_3_pivot_loc_pointConstraint1.tg[1].tw"
		;
connectAttr "fk_bone_2_pivot_loc_pointConstraint1.ctx" "fk_2_pivot_loc.tx";
connectAttr "fk_bone_2_pivot_loc_pointConstraint1.cty" "fk_2_pivot_loc.ty";
connectAttr "fk_bone_2_pivot_loc_pointConstraint1.ctz" "fk_2_pivot_loc.tz";
connectAttr "fk_2_pivot_loc.pim" "fk_bone_2_pivot_loc_pointConstraint1.cpim";
connectAttr "fk_2_pivot_loc.rp" "fk_bone_2_pivot_loc_pointConstraint1.crp";
connectAttr "fk_2_pivot_loc.rpt" "fk_bone_2_pivot_loc_pointConstraint1.crt";
connectAttr "local_3_poser.t" "fk_bone_2_pivot_loc_pointConstraint1.tg[0].tt";
connectAttr "local_3_poser.rp" "fk_bone_2_pivot_loc_pointConstraint1.tg[0].trp";
connectAttr "local_3_poser.rpt" "fk_bone_2_pivot_loc_pointConstraint1.tg[0].trt"
		;
connectAttr "local_3_poser.pm" "fk_bone_2_pivot_loc_pointConstraint1.tg[0].tpm";
connectAttr "fk_bone_2_pivot_loc_pointConstraint1.w0" "fk_bone_2_pivot_loc_pointConstraint1.tg[0].tw"
		;
connectAttr "fk_bone_1_pivot_loc_pointConstraint1.ctx" "fk_1_pivot_loc.tx";
connectAttr "fk_bone_1_pivot_loc_pointConstraint1.cty" "fk_1_pivot_loc.ty";
connectAttr "fk_bone_1_pivot_loc_pointConstraint1.ctz" "fk_1_pivot_loc.tz";
connectAttr "fk_1_pivot_loc.pim" "fk_bone_1_pivot_loc_pointConstraint1.cpim";
connectAttr "fk_1_pivot_loc.rp" "fk_bone_1_pivot_loc_pointConstraint1.crp";
connectAttr "fk_1_pivot_loc.rpt" "fk_bone_1_pivot_loc_pointConstraint1.crt";
connectAttr "local_1_poser.t" "fk_bone_1_pivot_loc_pointConstraint1.tg[0].tt";
connectAttr "local_1_poser.rp" "fk_bone_1_pivot_loc_pointConstraint1.tg[0].trp";
connectAttr "local_1_poser.rpt" "fk_bone_1_pivot_loc_pointConstraint1.tg[0].trt"
		;
connectAttr "local_1_poser.pm" "fk_bone_1_pivot_loc_pointConstraint1.tg[0].tpm";
connectAttr "fk_bone_1_pivot_loc_pointConstraint1.w0" "fk_bone_1_pivot_loc_pointConstraint1.tg[0].tw"
		;
connectAttr "local_2_poser.t" "fk_bone_1_pivot_loc_pointConstraint1.tg[1].tt";
connectAttr "local_2_poser.rp" "fk_bone_1_pivot_loc_pointConstraint1.tg[1].trp";
connectAttr "local_2_poser.rpt" "fk_bone_1_pivot_loc_pointConstraint1.tg[1].trt"
		;
connectAttr "local_2_poser.pm" "fk_bone_1_pivot_loc_pointConstraint1.tg[1].tpm";
connectAttr "fk_bone_1_pivot_loc_pointConstraint1.w1" "fk_bone_1_pivot_loc_pointConstraint1.tg[1].tw"
		;
connectAttr "root_poser.t" "fk_controls_positions.t";
connectAttr "parts_multiplyDivide.ox" "fk_bone_1_group_pos.ty";
connectAttr "parts_multiplyDivide.ox" "fk_bone_2_group_pos.ty";
connectAttr "parts_multiplyDivide.ox" "fk_bone_3_group_pos.ty";
connectAttr "end_poserOrient.r" "init_locators_group.r";
connectAttr "bend_6_posJoint_pointConstraint1.ctx" "local_5_jnt.tx";
connectAttr "bend_6_posJoint_pointConstraint1.cty" "local_5_jnt.ty";
connectAttr "bend_6_posJoint_pointConstraint1.ctz" "local_5_jnt.tz";
connectAttr "local_5_jnt.pim" "bend_6_posJoint_pointConstraint1.cpim";
connectAttr "local_5_jnt.rp" "bend_6_posJoint_pointConstraint1.crp";
connectAttr "local_5_jnt.rpt" "bend_6_posJoint_pointConstraint1.crt";
connectAttr "local_5_poser.t" "bend_6_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_5_poser.rp" "bend_6_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_5_poser.rpt" "bend_6_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_5_poser.pm" "bend_6_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_6_posJoint_pointConstraint1.w0" "bend_6_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_5_posJoint_pointConstraint1.ctx" "local_4_jnt.tx";
connectAttr "bend_5_posJoint_pointConstraint1.cty" "local_4_jnt.ty";
connectAttr "bend_5_posJoint_pointConstraint1.ctz" "local_4_jnt.tz";
connectAttr "local_4_jnt.pim" "bend_5_posJoint_pointConstraint1.cpim";
connectAttr "local_4_jnt.rp" "bend_5_posJoint_pointConstraint1.crp";
connectAttr "local_4_jnt.rpt" "bend_5_posJoint_pointConstraint1.crt";
connectAttr "local_4_poser.t" "bend_5_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_4_poser.rp" "bend_5_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_4_poser.rpt" "bend_5_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_4_poser.pm" "bend_5_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_5_posJoint_pointConstraint1.w0" "bend_5_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_4_posJoint_pointConstraint1.ctx" "local_3_jnt.tx";
connectAttr "bend_4_posJoint_pointConstraint1.cty" "local_3_jnt.ty";
connectAttr "bend_4_posJoint_pointConstraint1.ctz" "local_3_jnt.tz";
connectAttr "local_3_jnt.pim" "bend_4_posJoint_pointConstraint1.cpim";
connectAttr "local_3_jnt.rp" "bend_4_posJoint_pointConstraint1.crp";
connectAttr "local_3_jnt.rpt" "bend_4_posJoint_pointConstraint1.crt";
connectAttr "local_3_poser.t" "bend_4_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_3_poser.rp" "bend_4_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_3_poser.rpt" "bend_4_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_3_poser.pm" "bend_4_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_4_posJoint_pointConstraint1.w0" "bend_4_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_3_posJoint_pointConstraint1.ctx" "local_2_jnt.tx";
connectAttr "bend_3_posJoint_pointConstraint1.cty" "local_2_jnt.ty";
connectAttr "bend_3_posJoint_pointConstraint1.ctz" "local_2_jnt.tz";
connectAttr "local_2_jnt.pim" "bend_3_posJoint_pointConstraint1.cpim";
connectAttr "local_2_jnt.rp" "bend_3_posJoint_pointConstraint1.crp";
connectAttr "local_2_jnt.rpt" "bend_3_posJoint_pointConstraint1.crt";
connectAttr "local_2_poser.t" "bend_3_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_2_poser.rp" "bend_3_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_2_poser.rpt" "bend_3_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_2_poser.pm" "bend_3_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_3_posJoint_pointConstraint1.w0" "bend_3_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_2_posJoint_pointConstraint1.ctx" "local_1_jnt.tx";
connectAttr "bend_2_posJoint_pointConstraint1.cty" "local_1_jnt.ty";
connectAttr "bend_2_posJoint_pointConstraint1.ctz" "local_1_jnt.tz";
connectAttr "local_1_jnt.pim" "bend_2_posJoint_pointConstraint1.cpim";
connectAttr "local_1_jnt.rp" "bend_2_posJoint_pointConstraint1.crp";
connectAttr "local_1_jnt.rpt" "bend_2_posJoint_pointConstraint1.crt";
connectAttr "local_1_poser.t" "bend_2_posJoint_pointConstraint1.tg[0].tt";
connectAttr "local_1_poser.rp" "bend_2_posJoint_pointConstraint1.tg[0].trp";
connectAttr "local_1_poser.rpt" "bend_2_posJoint_pointConstraint1.tg[0].trt";
connectAttr "local_1_poser.pm" "bend_2_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_2_posJoint_pointConstraint1.w0" "bend_2_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_1_posJoint_pointConstraint1.cty" "root_jnt.ty";
connectAttr "bend_1_posJoint_pointConstraint1.ctx" "root_jnt.tx";
connectAttr "bend_1_posJoint_pointConstraint1.ctz" "root_jnt.tz";
connectAttr "root_jnt.pim" "bend_1_posJoint_pointConstraint1.cpim";
connectAttr "root_jnt.rp" "bend_1_posJoint_pointConstraint1.crp";
connectAttr "root_jnt.rpt" "bend_1_posJoint_pointConstraint1.crt";
connectAttr "root_poser.t" "bend_1_posJoint_pointConstraint1.tg[0].tt";
connectAttr "root_poser.rp" "bend_1_posJoint_pointConstraint1.tg[0].trp";
connectAttr "root_poser.rpt" "bend_1_posJoint_pointConstraint1.tg[0].trt";
connectAttr "root_poser.pm" "bend_1_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_1_posJoint_pointConstraint1.w0" "bend_1_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "bend_7_posJoint_pointConstraint1.ctx" "end_jnt.tx";
connectAttr "bend_7_posJoint_pointConstraint1.cty" "end_jnt.ty";
connectAttr "bend_7_posJoint_pointConstraint1.ctz" "end_jnt.tz";
connectAttr "end_jnt.pim" "bend_7_posJoint_pointConstraint1.cpim";
connectAttr "end_jnt.rp" "bend_7_posJoint_pointConstraint1.crp";
connectAttr "end_jnt.rpt" "bend_7_posJoint_pointConstraint1.crt";
connectAttr "end_poser.t" "bend_7_posJoint_pointConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "bend_7_posJoint_pointConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "bend_7_posJoint_pointConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "bend_7_posJoint_pointConstraint1.tg[0].tpm";
connectAttr "bend_7_posJoint_pointConstraint1.w0" "bend_7_posJoint_pointConstraint1.tg[0].tw"
		;
connectAttr "skinCluster2GroupId.id" "init_surfShape.iog.og[23].gid";
connectAttr "skinCluster2Set.mwc" "init_surfShape.iog.og[23].gco";
connectAttr "groupId47.id" "init_surfShape.iog.og[24].gid";
connectAttr "tweakSet27.mwc" "init_surfShape.iog.og[24].gco";
connectAttr "skinCluster2.og[0]" "init_surfShape.cr";
connectAttr "tweak27.pl[0].cp[0]" "init_surfShape.twl";
connectAttr "local_1_initFollicleShape.ot" "local_1_initFollicle.t";
connectAttr "local_1_initFollicleShape.or" "local_1_initFollicle.r";
connectAttr "root_poser_decMat.osx" "local_1_initFollicle.sx";
connectAttr "root_poser_decMat.osy" "local_1_initFollicle.sy";
connectAttr "root_poser_decMat.osz" "local_1_initFollicle.sz";
connectAttr "init_surfShape.ws" "local_1_initFollicleShape.is";
connectAttr "local_1_initLoc_aimConstraint1.crx" "local_1_initLoc.rx";
connectAttr "local_1_initLoc_aimConstraint1.cry" "local_1_initLoc.ry";
connectAttr "local_1_initLoc_aimConstraint1.crz" "local_1_initLoc.rz";
connectAttr "local_1_initLoc.pim" "local_1_initLoc_aimConstraint1.cpim";
connectAttr "local_1_initLoc.t" "local_1_initLoc_aimConstraint1.ct";
connectAttr "local_1_initLoc.rp" "local_1_initLoc_aimConstraint1.crp";
connectAttr "local_1_initLoc.rpt" "local_1_initLoc_aimConstraint1.crt";
connectAttr "local_1_initLoc.ro" "local_1_initLoc_aimConstraint1.cro";
connectAttr "local_2_initLoc.t" "local_1_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_2_initLoc.rp" "local_1_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_2_initLoc.rpt" "local_1_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_2_initLoc.pm" "local_1_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_1_initLoc_aimConstraint1.w0" "local_1_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_1_initFollicle.wm" "local_1_initLoc_aimConstraint1.wum";
connectAttr "local_2_initFollicleShape.ot" "local_2_initFollicle.t";
connectAttr "local_2_initFollicleShape.or" "local_2_initFollicle.r";
connectAttr "root_poser_decMat.osx" "local_2_initFollicle.sx";
connectAttr "root_poser_decMat.osy" "local_2_initFollicle.sy";
connectAttr "root_poser_decMat.osz" "local_2_initFollicle.sz";
connectAttr "init_surfShape.ws" "local_2_initFollicleShape.is";
connectAttr "local_2_initLoc_aimConstraint1.crx" "local_2_initLoc.rx";
connectAttr "local_2_initLoc_aimConstraint1.cry" "local_2_initLoc.ry";
connectAttr "local_2_initLoc_aimConstraint1.crz" "local_2_initLoc.rz";
connectAttr "local_2_initLoc.pim" "local_2_initLoc_aimConstraint1.cpim";
connectAttr "local_2_initLoc.t" "local_2_initLoc_aimConstraint1.ct";
connectAttr "local_2_initLoc.rp" "local_2_initLoc_aimConstraint1.crp";
connectAttr "local_2_initLoc.rpt" "local_2_initLoc_aimConstraint1.crt";
connectAttr "local_2_initLoc.ro" "local_2_initLoc_aimConstraint1.cro";
connectAttr "local_3_initLoc.t" "local_2_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_3_initLoc.rp" "local_2_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_3_initLoc.rpt" "local_2_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_3_initLoc.pm" "local_2_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_2_initLoc_aimConstraint1.w0" "local_2_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_2_initFollicle.wm" "local_2_initLoc_aimConstraint1.wum";
connectAttr "local_3_initFollicleShape.ot" "local_3_initFollicle.t";
connectAttr "local_3_initFollicleShape.or" "local_3_initFollicle.r";
connectAttr "root_poser_decMat.osx" "local_3_initFollicle.sx";
connectAttr "root_poser_decMat.osy" "local_3_initFollicle.sy";
connectAttr "root_poser_decMat.osz" "local_3_initFollicle.sz";
connectAttr "init_surfShape.ws" "local_3_initFollicleShape.is";
connectAttr "local_3_initLoc_aimConstraint1.crx" "local_3_initLoc.rx";
connectAttr "local_3_initLoc_aimConstraint1.cry" "local_3_initLoc.ry";
connectAttr "local_3_initLoc_aimConstraint1.crz" "local_3_initLoc.rz";
connectAttr "local_3_initLoc.pim" "local_3_initLoc_aimConstraint1.cpim";
connectAttr "local_3_initLoc.t" "local_3_initLoc_aimConstraint1.ct";
connectAttr "local_3_initLoc.rp" "local_3_initLoc_aimConstraint1.crp";
connectAttr "local_3_initLoc.rpt" "local_3_initLoc_aimConstraint1.crt";
connectAttr "local_3_initLoc.ro" "local_3_initLoc_aimConstraint1.cro";
connectAttr "local_4_initLoc.t" "local_3_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_4_initLoc.rp" "local_3_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_4_initLoc.rpt" "local_3_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_4_initLoc.pm" "local_3_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_3_initLoc_aimConstraint1.w0" "local_3_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_3_initFollicle.wm" "local_3_initLoc_aimConstraint1.wum";
connectAttr "local_4_initFollicleShape.ot" "local_4_initFollicle.t";
connectAttr "local_4_initFollicleShape.or" "local_4_initFollicle.r";
connectAttr "root_poser_decMat.osx" "local_4_initFollicle.sx";
connectAttr "root_poser_decMat.osy" "local_4_initFollicle.sy";
connectAttr "root_poser_decMat.osz" "local_4_initFollicle.sz";
connectAttr "init_surfShape.ws" "local_4_initFollicleShape.is";
connectAttr "local_4_initLoc_aimConstraint1.crx" "local_4_initLoc.rx";
connectAttr "local_4_initLoc_aimConstraint1.cry" "local_4_initLoc.ry";
connectAttr "local_4_initLoc_aimConstraint1.crz" "local_4_initLoc.rz";
connectAttr "local_4_initLoc.pim" "local_4_initLoc_aimConstraint1.cpim";
connectAttr "local_4_initLoc.t" "local_4_initLoc_aimConstraint1.ct";
connectAttr "local_4_initLoc.rp" "local_4_initLoc_aimConstraint1.crp";
connectAttr "local_4_initLoc.rpt" "local_4_initLoc_aimConstraint1.crt";
connectAttr "local_4_initLoc.ro" "local_4_initLoc_aimConstraint1.cro";
connectAttr "local_5_initLoc.t" "local_4_initLoc_aimConstraint1.tg[0].tt";
connectAttr "local_5_initLoc.rp" "local_4_initLoc_aimConstraint1.tg[0].trp";
connectAttr "local_5_initLoc.rpt" "local_4_initLoc_aimConstraint1.tg[0].trt";
connectAttr "local_5_initLoc.pm" "local_4_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_4_initLoc_aimConstraint1.w0" "local_4_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_4_initFollicle.wm" "local_4_initLoc_aimConstraint1.wum";
connectAttr "local_5_initFollicleShape.ot" "local_5_initFollicle.t";
connectAttr "local_5_initFollicleShape.or" "local_5_initFollicle.r";
connectAttr "root_poser_decMat.osx" "local_5_initFollicle.sx";
connectAttr "root_poser_decMat.osy" "local_5_initFollicle.sy";
connectAttr "root_poser_decMat.osz" "local_5_initFollicle.sz";
connectAttr "init_surfShape.ws" "local_5_initFollicleShape.is";
connectAttr "local_5_initLoc_aimConstraint1.crx" "local_5_initLoc.rx";
connectAttr "local_5_initLoc_aimConstraint1.cry" "local_5_initLoc.ry";
connectAttr "local_5_initLoc_aimConstraint1.crz" "local_5_initLoc.rz";
connectAttr "local_5_initLoc.pim" "local_5_initLoc_aimConstraint1.cpim";
connectAttr "local_5_initLoc.t" "local_5_initLoc_aimConstraint1.ct";
connectAttr "local_5_initLoc.rp" "local_5_initLoc_aimConstraint1.crp";
connectAttr "local_5_initLoc.rpt" "local_5_initLoc_aimConstraint1.crt";
connectAttr "local_5_initLoc.ro" "local_5_initLoc_aimConstraint1.cro";
connectAttr "end_poser.t" "local_5_initLoc_aimConstraint1.tg[0].tt";
connectAttr "end_poser.rp" "local_5_initLoc_aimConstraint1.tg[0].trp";
connectAttr "end_poser.rpt" "local_5_initLoc_aimConstraint1.tg[0].trt";
connectAttr "end_poser.pm" "local_5_initLoc_aimConstraint1.tg[0].tpm";
connectAttr "local_5_initLoc_aimConstraint1.w0" "local_5_initLoc_aimConstraint1.tg[0].tw"
		;
connectAttr "local_5_initFollicle.wm" "local_5_initLoc_aimConstraint1.wum";
connectAttr "root_poserOrientShape.wp" "posers_curveShape.cp[0]";
connectAttr "local_1_poserOrientShape.wp" "posers_curveShape.cp[1]";
connectAttr "local_2_poserOrientShape.wp" "posers_curveShape.cp[2]";
connectAttr "local_3_poserOrientShape.wp" "posers_curveShape.cp[3]";
connectAttr "local_4_poserOrientShape.wp" "posers_curveShape.cp[4]";
connectAttr "local_5_poserOrientShape.wp" "posers_curveShape.cp[5]";
connectAttr "end_poserOrientShape.wp" "posers_curveShape.cp[6]";
connectAttr "sweepMeshCreator1.outMeshArray[0]" "posers_sweepShape.i";
connectAttr "multiplyDivide1857.ox" "mainPoser_clusterHandle.sx";
connectAttr "multiplyDivide1857.ox" "mainPoser_clusterHandle.sy";
connectAttr "multiplyDivide1857.ox" "mainPoser_clusterHandle.sz";
connectAttr "root_poser_decMat.otx" "input.tx";
connectAttr "root_poser_decMat.oty" "input.ty";
connectAttr "root_poser_decMat.otz" "input.tz";
connectAttr "root_poser_decMat.orx" "input.rx";
connectAttr "root_poser_decMat.ory" "input.ry";
connectAttr "root_poser_decMat.orz" "input.rz";
connectAttr "root_poser_decMat.osx" "input.sx";
connectAttr "root_poser_decMat.osy" "input.sy";
connectAttr "root_poser_decMat.osz" "input.sz";
connectAttr "root_connector_decMat.otx" "controls.tx";
connectAttr "root_connector_decMat.oty" "controls.ty";
connectAttr "root_connector_decMat.otz" "controls.tz";
connectAttr "root_connector_decMat.orx" "controls.rx";
connectAttr "root_connector_decMat.ory" "controls.ry";
connectAttr "root_connector_decMat.orz" "controls.rz";
connectAttr "root_connector_decMat.osx" "controls.sx";
connectAttr "root_connector_decMat.osy" "controls.sy";
connectAttr "root_connector_decMat.osz" "controls.sz";
connectAttr "end_decomposeMatrix1.ot" "pelvis.rp";
connectAttr "end_multMatrix.o" "chestRoot_group.opm";
connectAttr "inverseMatrix1.omat" "ref_offse_tgroup.opm";
connectAttr "parts_multiplyDivide.ox" "fk_bone_1_group.ty";
connectAttr "condition2.ocr" "fk_bone_1_group.v";
connectAttr "decomposeMatrix91.otx" "fk_1.rpx";
connectAttr "decomposeMatrix91.otz" "fk_1.rpz";
connectAttr "parts_multiplyDivide.ox" "fk_bone_2_group.ty";
connectAttr "decomposeMatrix92.otx" "fk_2.rpx";
connectAttr "decomposeMatrix92.otz" "fk_2.rpz";
connectAttr "parts_multiplyDivide.ox" "fk_bone_3_group.ty";
connectAttr "decomposeMatrix93.otx" "fk_3.rpx";
connectAttr "decomposeMatrix93.otz" "fk_3.rpz";
connectAttr "parts_multiplyDivide.ox" "fk_bone_3_out.ty";
connectAttr "end_decomposeMatrix.otx" "fk_bone_3_out.tx";
connectAttr "end_decomposeMatrix.otz" "fk_bone_3_out.tz";
connectAttr "hips_ik.t" "hips_fk_group_2.t";
connectAttr "hips_ik.r" "hips_fk_group_2.r";
connectAttr "parts_multiplyDivide.ox" "hips_fk_group.ty";
connectAttr "decomposeMatrix91.otz" "hips_fk.rpz";
connectAttr "decomposeMatrix91.otx" "hips_fk.rpx";
connectAttr "bendJoint_1_aimConstraint1.crx" "bendJoint_1.rx";
connectAttr "bendJoint_1_aimConstraint1.cry" "bendJoint_1.ry";
connectAttr "bendJoint_1_aimConstraint1.crz" "bendJoint_1.rz";
connectAttr "parts_multiplyDivide.oy" "bendJoint_1.ty";
connectAttr "reverse8.ox" "bendJoint_1_aimConstraint1.w0";
connectAttr "hips_ik.weight" "bendJoint_1_aimConstraint1.w1";
connectAttr "bendJoint_1.pim" "bendJoint_1_aimConstraint1.cpim";
connectAttr "bendJoint_1.t" "bendJoint_1_aimConstraint1.ct";
connectAttr "bendJoint_1.rp" "bendJoint_1_aimConstraint1.crp";
connectAttr "bendJoint_1.rpt" "bendJoint_1_aimConstraint1.crt";
connectAttr "bendJoint_1.ro" "bendJoint_1_aimConstraint1.cro";
connectAttr "bendJoint_1.jo" "bendJoint_1_aimConstraint1.cjo";
connectAttr "stomachHipsMid_loc.t" "bendJoint_1_aimConstraint1.tg[0].tt";
connectAttr "stomachHipsMid_loc.rp" "bendJoint_1_aimConstraint1.tg[0].trp";
connectAttr "stomachHipsMid_loc.rpt" "bendJoint_1_aimConstraint1.tg[0].trt";
connectAttr "stomachHipsMid_loc.pm" "bendJoint_1_aimConstraint1.tg[0].tpm";
connectAttr "bendJoint_1_aimConstraint1.w0" "bendJoint_1_aimConstraint1.tg[0].tw"
		;
connectAttr "hipsStomachMid_loc.t" "bendJoint_1_aimConstraint1.tg[1].tt";
connectAttr "hipsStomachMid_loc.rp" "bendJoint_1_aimConstraint1.tg[1].trp";
connectAttr "hipsStomachMid_loc.rpt" "bendJoint_1_aimConstraint1.tg[1].trt";
connectAttr "hipsStomachMid_loc.pm" "bendJoint_1_aimConstraint1.tg[1].tpm";
connectAttr "bendJoint_1_aimConstraint1.w1" "bendJoint_1_aimConstraint1.tg[1].tw"
		;
connectAttr "curDistance_part.o" "hipsStomachMid_loc1.ty";
connectAttr "curDistance_part_2.o" "local_1_group.ty";
connectAttr "unitConversion31.o" "local_1_group.ry";
connectAttr "pelvis.localControls" "local_1_group.v";
connectAttr "local_1_poser.t" "local_1_group_2.t";
connectAttr "parts_multiplyDivide.oy" "bendJoint_1_out.ty";
connectAttr "condition2.ocr" "hips_fkShape.lodv";
connectAttr "multMatrix3.o" "locator2.opm";
connectAttr "multMatrix3.o" "locator3.opm";
connectAttr "multiplyDivide1855.oy" "hipsStomachMid_aim.ty";
connectAttr "multiplyDivide1855.ox" "hipsStomachMid_aim.tx";
connectAttr "multiplyDivide1855.oz" "hipsStomachMid_aim.tz";
connectAttr "hipsStomachMid_loc_group_aimConstraint1.crx" "hipsStomachMid_loc_group.rx"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.cry" "hipsStomachMid_loc_group.ry"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.crz" "hipsStomachMid_loc_group.rz"
		;
connectAttr "curDistance_part.o" "hipsStomachMid_loc.ty";
connectAttr "hips_ik.weight" "hipsStomachMid_loc_group_aimConstraint1.w0";
connectAttr "reverse8.ox" "hipsStomachMid_loc_group_aimConstraint1.w1";
connectAttr "hipsStomachMid_loc_group.pim" "hipsStomachMid_loc_group_aimConstraint1.cpim"
		;
connectAttr "hipsStomachMid_loc_group.t" "hipsStomachMid_loc_group_aimConstraint1.ct"
		;
connectAttr "hipsStomachMid_loc_group.rp" "hipsStomachMid_loc_group_aimConstraint1.crp"
		;
connectAttr "hipsStomachMid_loc_group.rpt" "hipsStomachMid_loc_group_aimConstraint1.crt"
		;
connectAttr "hipsStomachMid_loc_group.ro" "hipsStomachMid_loc_group_aimConstraint1.cro"
		;
connectAttr "hipsStomachMid_aim.t" "hipsStomachMid_loc_group_aimConstraint1.tg[0].tt"
		;
connectAttr "hipsStomachMid_aim.rp" "hipsStomachMid_loc_group_aimConstraint1.tg[0].trp"
		;
connectAttr "hipsStomachMid_aim.rpt" "hipsStomachMid_loc_group_aimConstraint1.tg[0].trt"
		;
connectAttr "hipsStomachMid_aim.pm" "hipsStomachMid_loc_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "hipsStomachMid_loc_group_aimConstraint1.w0" "hipsStomachMid_loc_group_aimConstraint1.tg[0].tw"
		;
connectAttr "chest_out.t" "hipsStomachMid_loc_group_aimConstraint1.tg[1].tt";
connectAttr "chest_out.rp" "hipsStomachMid_loc_group_aimConstraint1.tg[1].trp";
connectAttr "chest_out.rpt" "hipsStomachMid_loc_group_aimConstraint1.tg[1].trt";
connectAttr "chest_out.pm" "hipsStomachMid_loc_group_aimConstraint1.tg[1].tpm";
connectAttr "hipsStomachMid_loc_group_aimConstraint1.w1" "hipsStomachMid_loc_group_aimConstraint1.tg[1].tw"
		;
connectAttr "condition2.ocg" "hips_ikShape.lodv";
connectAttr "stomach_group_2_pointConstraint1.cty" "stomach_group_2.ty";
connectAttr "stomach_group_2_pointConstraint1.ctx" "stomach_group_2.tx";
connectAttr "stomach_group_2_pointConstraint1.ctz" "stomach_group_2.tz";
connectAttr "stomach_orient.r" "stomach_group_2.r";
connectAttr "stomach_group_orientConstraint1.cry" "stomach_group.ry";
connectAttr "stomach_group.ro" "stomach_group_orientConstraint1.cro";
connectAttr "stomach_group.pim" "stomach_group_orientConstraint1.cpim";
connectAttr "chest_out.r" "stomach_group_orientConstraint1.tg[0].tr";
connectAttr "chest_out.ro" "stomach_group_orientConstraint1.tg[0].tro";
connectAttr "chest_out.pm" "stomach_group_orientConstraint1.tg[0].tpm";
connectAttr "stomach_group_orientConstraint1.w0" "stomach_group_orientConstraint1.tg[0].tw"
		;
connectAttr "hips_out.r" "stomach_group_orientConstraint1.tg[1].tr";
connectAttr "hips_out.ro" "stomach_group_orientConstraint1.tg[1].tro";
connectAttr "hips_out.pm" "stomach_group_orientConstraint1.tg[1].tpm";
connectAttr "stomach_group_orientConstraint1.w1" "stomach_group_orientConstraint1.tg[1].tw"
		;
connectAttr "local_3_poser.tz" "stomach.rpz";
connectAttr "local_3_poser.tx" "stomach.rpx";
connectAttr "stomachChestMid_loc_offset.o" "stomachChestMid_loc.ty";
connectAttr "unitConversion29.o" "local_4_group.ry";
connectAttr "pelvis.localControls" "local_4_group.v";
connectAttr "local_4_poser.t" "local_4_group_2.t";
connectAttr "bendJoint_4_multiply_position.o" "local_3_group.t";
connectAttr "pelvis.localControls" "local_3_group.v";
connectAttr "local_3_poser.t" "local_3_group_2.t";
connectAttr "stomachHipsMid_loc_offset.o" "stomachHipsMid_loc.ty";
connectAttr "unitConversion30.o" "local_2_group.ry";
connectAttr "pelvis.localControls" "local_2_group.v";
connectAttr "local_2_poser.t" "local_2_group_2.t";
connectAttr "condition2.ocg" "stomachShape.lodv";
connectAttr "stomach_group_2.pim" "stomach_group_2_pointConstraint1.cpim";
connectAttr "stomach_group_2.rp" "stomach_group_2_pointConstraint1.crp";
connectAttr "stomach_group_2.rpt" "stomach_group_2_pointConstraint1.crt";
connectAttr "chestStomachMid_loc.t" "stomach_group_2_pointConstraint1.tg[0].tt";
connectAttr "chestStomachMid_loc.rp" "stomach_group_2_pointConstraint1.tg[0].trp"
		;
connectAttr "chestStomachMid_loc.rpt" "stomach_group_2_pointConstraint1.tg[0].trt"
		;
connectAttr "chestStomachMid_loc.pm" "stomach_group_2_pointConstraint1.tg[0].tpm"
		;
connectAttr "stomach_group_2_pointConstraint1.w0" "stomach_group_2_pointConstraint1.tg[0].tw"
		;
connectAttr "hipsStomachMid_loc.t" "stomach_group_2_pointConstraint1.tg[1].tt";
connectAttr "hipsStomachMid_loc.rp" "stomach_group_2_pointConstraint1.tg[1].trp"
		;
connectAttr "hipsStomachMid_loc.rpt" "stomach_group_2_pointConstraint1.tg[1].trt"
		;
connectAttr "hipsStomachMid_loc.pm" "stomach_group_2_pointConstraint1.tg[1].tpm"
		;
connectAttr "stomach_group_2_pointConstraint1.w1" "stomach_group_2_pointConstraint1.tg[1].tw"
		;
connectAttr "chest_group_decomposeMatrix.otx" "chest_group.tx";
connectAttr "chest_group_decomposeMatrix.oty" "chest_group.ty";
connectAttr "chest_group_decomposeMatrix.otz" "chest_group.tz";
connectAttr "chest_group_decomposeMatrix.orx" "chest_group.rx";
connectAttr "chest_group_decomposeMatrix.ory" "chest_group.ry";
connectAttr "chest_group_decomposeMatrix.orz" "chest_group.rz";
connectAttr "chest_group_decomposeMatrix.osx" "chest_group.sx";
connectAttr "chest_group_decomposeMatrix.osy" "chest_group.sy";
connectAttr "chest_group_decomposeMatrix.osz" "chest_group.sz";
connectAttr "bend_joint_7_aimConstraint1.crx" "bend_joint_7.rx";
connectAttr "bend_joint_7_aimConstraint1.cry" "bend_joint_7.ry";
connectAttr "bend_joint_7_aimConstraint1.crz" "bend_joint_7.rz";
connectAttr "reverse6.ox" "bend_joint_7_aimConstraint1.w0";
connectAttr "chest.weight" "bend_joint_7_aimConstraint1.w1";
connectAttr "bend_joint_7.pim" "bend_joint_7_aimConstraint1.cpim";
connectAttr "bend_joint_7.t" "bend_joint_7_aimConstraint1.ct";
connectAttr "bend_joint_7.rp" "bend_joint_7_aimConstraint1.crp";
connectAttr "bend_joint_7.rpt" "bend_joint_7_aimConstraint1.crt";
connectAttr "bend_joint_7.ro" "bend_joint_7_aimConstraint1.cro";
connectAttr "bend_joint_7.jo" "bend_joint_7_aimConstraint1.cjo";
connectAttr "stomachChestMid_loc.t" "bend_joint_7_aimConstraint1.tg[0].tt";
connectAttr "stomachChestMid_loc.rp" "bend_joint_7_aimConstraint1.tg[0].trp";
connectAttr "stomachChestMid_loc.rpt" "bend_joint_7_aimConstraint1.tg[0].trt";
connectAttr "stomachChestMid_loc.pm" "bend_joint_7_aimConstraint1.tg[0].tpm";
connectAttr "bend_joint_7_aimConstraint1.w0" "bend_joint_7_aimConstraint1.tg[0].tw"
		;
connectAttr "chestStomachMid_aim.t" "bend_joint_7_aimConstraint1.tg[1].tt";
connectAttr "chestStomachMid_aim.rp" "bend_joint_7_aimConstraint1.tg[1].trp";
connectAttr "chestStomachMid_aim.rpt" "bend_joint_7_aimConstraint1.tg[1].trt";
connectAttr "chestStomachMid_aim.pm" "bend_joint_7_aimConstraint1.tg[1].tpm";
connectAttr "bend_joint_7_aimConstraint1.w1" "bend_joint_7_aimConstraint1.tg[1].tw"
		;
connectAttr "multDoubleLinear13.o" "local_5_group.ty";
connectAttr "unitConversion27.o" "local_5_group.ry";
connectAttr "pelvis.localControls" "local_5_group.v";
connectAttr "local_5_poser.t" "local_5_group_2.t";
connectAttr "chestStomachMid_loc_group_aimConstraint1.crx" "chestStomachMid_loc_group.rx"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.cry" "chestStomachMid_loc_group.ry"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.crz" "chestStomachMid_loc_group.rz"
		;
connectAttr "curDistance_part_rev.o" "chestStomachMid_loc.ty";
connectAttr "chest.weight" "chestStomachMid_loc_group_aimConstraint1.w0";
connectAttr "reverse6.ox" "chestStomachMid_loc_group_aimConstraint1.w1";
connectAttr "chestStomachMid_loc_group.pim" "chestStomachMid_loc_group_aimConstraint1.cpim"
		;
connectAttr "chestStomachMid_loc_group.t" "chestStomachMid_loc_group_aimConstraint1.ct"
		;
connectAttr "chestStomachMid_loc_group.rp" "chestStomachMid_loc_group_aimConstraint1.crp"
		;
connectAttr "chestStomachMid_loc_group.rpt" "chestStomachMid_loc_group_aimConstraint1.crt"
		;
connectAttr "chestStomachMid_loc_group.ro" "chestStomachMid_loc_group_aimConstraint1.cro"
		;
connectAttr "chestStomachMid_aim.t" "chestStomachMid_loc_group_aimConstraint1.tg[0].tt"
		;
connectAttr "chestStomachMid_aim.rp" "chestStomachMid_loc_group_aimConstraint1.tg[0].trp"
		;
connectAttr "chestStomachMid_aim.rpt" "chestStomachMid_loc_group_aimConstraint1.tg[0].trt"
		;
connectAttr "chestStomachMid_aim.pm" "chestStomachMid_loc_group_aimConstraint1.tg[0].tpm"
		;
connectAttr "chestStomachMid_loc_group_aimConstraint1.w0" "chestStomachMid_loc_group_aimConstraint1.tg[0].tw"
		;
connectAttr "hips_out.t" "chestStomachMid_loc_group_aimConstraint1.tg[1].tt";
connectAttr "hips_out.rp" "chestStomachMid_loc_group_aimConstraint1.tg[1].trp";
connectAttr "hips_out.rpt" "chestStomachMid_loc_group_aimConstraint1.tg[1].trt";
connectAttr "hips_out.pm" "chestStomachMid_loc_group_aimConstraint1.tg[1].tpm";
connectAttr "chestStomachMid_loc_group_aimConstraint1.w1" "chestStomachMid_loc_group_aimConstraint1.tg[1].tw"
		;
connectAttr "multiplyDivide1856.o" "chestStomachMid_aim.t";
connectAttr "condition2.ocg" "chestShape.lodv";
connectAttr "stomach_orient_aimConstraint1.crx" "stomach_orient.rx";
connectAttr "stomach_orient_aimConstraint1.cry" "stomach_orient.ry";
connectAttr "stomach_orient_aimConstraint1.crz" "stomach_orient.rz";
connectAttr "stomach_orient_pointConstraint1.cty" "stomach_orient.ty";
connectAttr "stomach_orient_pointConstraint1.ctx" "stomach_orient.tx";
connectAttr "stomach_orient_pointConstraint1.ctz" "stomach_orient.tz";
connectAttr "chest.weight" "stomach_orient_aimConstraint1.w0";
connectAttr "reverse6.ox" "stomach_orient_aimConstraint1.w1";
connectAttr "stomach_orient.pim" "stomach_orient_aimConstraint1.cpim";
connectAttr "stomach_orient.t" "stomach_orient_aimConstraint1.ct";
connectAttr "stomach_orient.rp" "stomach_orient_aimConstraint1.crp";
connectAttr "stomach_orient.rpt" "stomach_orient_aimConstraint1.crt";
connectAttr "stomach_orient.ro" "stomach_orient_aimConstraint1.cro";
connectAttr "chestStomachMid_loc.t" "stomach_orient_aimConstraint1.tg[0].tt";
connectAttr "chestStomachMid_loc.rp" "stomach_orient_aimConstraint1.tg[0].trp";
connectAttr "chestStomachMid_loc.rpt" "stomach_orient_aimConstraint1.tg[0].trt";
connectAttr "chestStomachMid_loc.pm" "stomach_orient_aimConstraint1.tg[0].tpm";
connectAttr "stomach_orient_aimConstraint1.w0" "stomach_orient_aimConstraint1.tg[0].tw"
		;
connectAttr "chest_out.t" "stomach_orient_aimConstraint1.tg[1].tt";
connectAttr "chest_out.rp" "stomach_orient_aimConstraint1.tg[1].trp";
connectAttr "chest_out.rpt" "stomach_orient_aimConstraint1.tg[1].trt";
connectAttr "chest_out.pm" "stomach_orient_aimConstraint1.tg[1].tpm";
connectAttr "stomach_orient_aimConstraint1.w1" "stomach_orient_aimConstraint1.tg[1].tw"
		;
connectAttr "stomach_orient.pim" "stomach_orient_pointConstraint1.cpim";
connectAttr "stomach_orient.rp" "stomach_orient_pointConstraint1.crp";
connectAttr "stomach_orient.rpt" "stomach_orient_pointConstraint1.crt";
connectAttr "hipsStomachMid_loc.t" "stomach_orient_pointConstraint1.tg[0].tt";
connectAttr "hipsStomachMid_loc.rp" "stomach_orient_pointConstraint1.tg[0].trp";
connectAttr "hipsStomachMid_loc.rpt" "stomach_orient_pointConstraint1.tg[0].trt"
		;
connectAttr "hipsStomachMid_loc.pm" "stomach_orient_pointConstraint1.tg[0].tpm";
connectAttr "stomach_orient_pointConstraint1.w0" "stomach_orient_pointConstraint1.tg[0].tw"
		;
connectAttr "hips_out.t" "stomach_orient_pointConstraint1.tg[1].tt";
connectAttr "hips_out.rp" "stomach_orient_pointConstraint1.tg[1].trp";
connectAttr "hips_out.rpt" "stomach_orient_pointConstraint1.tg[1].trt";
connectAttr "hips_out.pm" "stomach_orient_pointConstraint1.tg[1].tpm";
connectAttr "stomach_orient_pointConstraint1.w1" "stomach_orient_pointConstraint1.tg[1].tw"
		;
connectAttr "hips_ik.weight" "stomach_orient_pointConstraint1.w0";
connectAttr "reverse8.ox" "stomach_orient_pointConstraint1.w1";
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.otx" "l_b_leg__pelvis__ik_aim_group.tx"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.oty" "l_b_leg__pelvis__ik_aim_group.ty"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.otz" "l_b_leg__pelvis__ik_aim_group.tz"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.orx" "l_b_leg__pelvis__ik_aim_group.rx"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.ory" "l_b_leg__pelvis__ik_aim_group.ry"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.orz" "l_b_leg__pelvis__ik_aim_group.rz"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.osx" "l_b_leg__pelvis__ik_aim_group.sx"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.osy" "l_b_leg__pelvis__ik_aim_group.sy"
		;
connectAttr "l_b_leg__pelvis__ik_aim_group_decMat.osz" "l_b_leg__pelvis__ik_aim_group.sz"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.otx" "r_b_leg__pelvis__ik_aim_group.tx"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.oty" "r_b_leg__pelvis__ik_aim_group.ty"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.otz" "r_b_leg__pelvis__ik_aim_group.tz"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.orx" "r_b_leg__pelvis__ik_aim_group.rx"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.ory" "r_b_leg__pelvis__ik_aim_group.ry"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.orz" "r_b_leg__pelvis__ik_aim_group.rz"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.osx" "r_b_leg__pelvis__ik_aim_group.sx"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.osy" "r_b_leg__pelvis__ik_aim_group.sy"
		;
connectAttr "r_b_leg__pelvis__ik_aim_group_decMat.osz" "r_b_leg__pelvis__ik_aim_group.sz"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.otx" "l_f_leg__pelvis__ik_aim_group.tx"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.oty" "l_f_leg__pelvis__ik_aim_group.ty"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.otz" "l_f_leg__pelvis__ik_aim_group.tz"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.orx" "l_f_leg__pelvis__ik_aim_group.rx"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.ory" "l_f_leg__pelvis__ik_aim_group.ry"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.orz" "l_f_leg__pelvis__ik_aim_group.rz"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.osx" "l_f_leg__pelvis__ik_aim_group.sx"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.osy" "l_f_leg__pelvis__ik_aim_group.sy"
		;
connectAttr "l_f_leg__pelvis__ik_aim_group_decMat.osz" "l_f_leg__pelvis__ik_aim_group.sz"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.otx" "r_f_leg__pelvis__ik_aim_group.tx"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.oty" "r_f_leg__pelvis__ik_aim_group.ty"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.otz" "r_f_leg__pelvis__ik_aim_group.tz"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.orx" "r_f_leg__pelvis__ik_aim_group.rx"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.ory" "r_f_leg__pelvis__ik_aim_group.ry"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.orz" "r_f_leg__pelvis__ik_aim_group.rz"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.osx" "r_f_leg__pelvis__ik_aim_group.sx"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.osy" "r_f_leg__pelvis__ik_aim_group.sy"
		;
connectAttr "r_f_leg__pelvis__ik_aim_group_decMat.osz" "r_f_leg__pelvis__ik_aim_group.sz"
		;
connectAttr "curveFromSurfaceIso1.oc" "bend_crvShape.cr";
connectAttr "bend_1_follShape.ot" "bend_1_foll.t";
connectAttr "bend_1_follShape.or" "bend_1_foll.r";
connectAttr "bend_surfShape.ws" "bend_1_follShape.is";
connectAttr "condition7.ocr" "bend_1_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_1_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_1_jnt.sz";
connectAttr "bend_1_jnt_aimConstraint1.crx" "bend_1_jnt.rx";
connectAttr "bend_1_jnt_aimConstraint1.cry" "bend_1_jnt.ry";
connectAttr "bend_1_jnt_aimConstraint1.crz" "bend_1_jnt.rz";
connectAttr "bend_1_jnt.pim" "bend_1_jnt_aimConstraint1.cpim";
connectAttr "bend_1_jnt.t" "bend_1_jnt_aimConstraint1.ct";
connectAttr "bend_1_jnt.rp" "bend_1_jnt_aimConstraint1.crp";
connectAttr "bend_1_jnt.rpt" "bend_1_jnt_aimConstraint1.crt";
connectAttr "bend_1_jnt.ro" "bend_1_jnt_aimConstraint1.cro";
connectAttr "bend_1_jnt.jo" "bend_1_jnt_aimConstraint1.cjo";
connectAttr "bend_2_foll.t" "bend_1_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_2_foll.rp" "bend_1_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_2_foll.rpt" "bend_1_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_2_foll.pm" "bend_1_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_1_jnt_aimConstraint1.w0" "bend_1_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_1_foll.wm" "bend_1_jnt_aimConstraint1.wum";
connectAttr "bend_2_follShape.ot" "bend_2_foll.t";
connectAttr "bend_2_follShape.or" "bend_2_foll.r";
connectAttr "bend_surfShape.ws" "bend_2_follShape.is";
connectAttr "condition8.ocr" "bend_2_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_2_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_2_jnt.sz";
connectAttr "bend_2_jnt_aimConstraint1.crx" "bend_2_jnt.rx";
connectAttr "bend_2_jnt_aimConstraint1.cry" "bend_2_jnt.ry";
connectAttr "bend_2_jnt_aimConstraint1.crz" "bend_2_jnt.rz";
connectAttr "bend_2_jnt.pim" "bend_2_jnt_aimConstraint1.cpim";
connectAttr "bend_2_jnt.t" "bend_2_jnt_aimConstraint1.ct";
connectAttr "bend_2_jnt.rp" "bend_2_jnt_aimConstraint1.crp";
connectAttr "bend_2_jnt.rpt" "bend_2_jnt_aimConstraint1.crt";
connectAttr "bend_2_jnt.ro" "bend_2_jnt_aimConstraint1.cro";
connectAttr "bend_2_jnt.jo" "bend_2_jnt_aimConstraint1.cjo";
connectAttr "bend_3_foll.t" "bend_2_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_3_foll.rp" "bend_2_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_3_foll.rpt" "bend_2_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_3_foll.pm" "bend_2_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_2_jnt_aimConstraint1.w0" "bend_2_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_2_foll.wm" "bend_2_jnt_aimConstraint1.wum";
connectAttr "bend_3_follShape.ot" "bend_3_foll.t";
connectAttr "bend_3_follShape.or" "bend_3_foll.r";
connectAttr "bend_surfShape.ws" "bend_3_follShape.is";
connectAttr "condition10.ocr" "bend_3_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_3_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_3_jnt.sz";
connectAttr "bend_3_jnt_aimConstraint1.crx" "bend_3_jnt.rx";
connectAttr "bend_3_jnt_aimConstraint1.cry" "bend_3_jnt.ry";
connectAttr "bend_3_jnt_aimConstraint1.crz" "bend_3_jnt.rz";
connectAttr "bend_3_jnt.pim" "bend_3_jnt_aimConstraint1.cpim";
connectAttr "bend_3_jnt.t" "bend_3_jnt_aimConstraint1.ct";
connectAttr "bend_3_jnt.rp" "bend_3_jnt_aimConstraint1.crp";
connectAttr "bend_3_jnt.rpt" "bend_3_jnt_aimConstraint1.crt";
connectAttr "bend_3_jnt.ro" "bend_3_jnt_aimConstraint1.cro";
connectAttr "bend_3_jnt.jo" "bend_3_jnt_aimConstraint1.cjo";
connectAttr "bend_4_foll.t" "bend_3_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_4_foll.rp" "bend_3_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_4_foll.rpt" "bend_3_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_4_foll.pm" "bend_3_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_3_jnt_aimConstraint1.w0" "bend_3_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_3_foll.wm" "bend_3_jnt_aimConstraint1.wum";
connectAttr "bend_4_follShape.ot" "bend_4_foll.t";
connectAttr "bend_4_follShape.or" "bend_4_foll.r";
connectAttr "bend_surfShape.ws" "bend_4_follShape.is";
connectAttr "condition9.ocr" "bend_4_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_4_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_4_jnt.sz";
connectAttr "bend_4_jnt_aimConstraint1.crx" "bend_4_jnt.rx";
connectAttr "bend_4_jnt_aimConstraint1.cry" "bend_4_jnt.ry";
connectAttr "bend_4_jnt_aimConstraint1.crz" "bend_4_jnt.rz";
connectAttr "bend_4_jnt.pim" "bend_4_jnt_aimConstraint1.cpim";
connectAttr "bend_4_jnt.t" "bend_4_jnt_aimConstraint1.ct";
connectAttr "bend_4_jnt.rp" "bend_4_jnt_aimConstraint1.crp";
connectAttr "bend_4_jnt.rpt" "bend_4_jnt_aimConstraint1.crt";
connectAttr "bend_4_jnt.ro" "bend_4_jnt_aimConstraint1.cro";
connectAttr "bend_4_jnt.jo" "bend_4_jnt_aimConstraint1.cjo";
connectAttr "bend_5_foll.t" "bend_4_jnt_aimConstraint1.tg[0].tt";
connectAttr "bend_5_foll.rp" "bend_4_jnt_aimConstraint1.tg[0].trp";
connectAttr "bend_5_foll.rpt" "bend_4_jnt_aimConstraint1.tg[0].trt";
connectAttr "bend_5_foll.pm" "bend_4_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_4_jnt_aimConstraint1.w0" "bend_4_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_4_foll.wm" "bend_4_jnt_aimConstraint1.wum";
connectAttr "bend_5_follShape.ot" "bend_5_foll.t";
connectAttr "bend_5_follShape.or" "bend_5_foll.r";
connectAttr "bend_surfShape.ws" "bend_5_follShape.is";
connectAttr "condition11.ocr" "bend_5_follShape.pu";
connectAttr "squash_blendTwoAttr.o" "bend_5_jnt.sy";
connectAttr "squash_blendTwoAttr.o" "bend_5_jnt.sz";
connectAttr "bend_5_jnt_aimConstraint1.crx" "bend_5_jnt.rx";
connectAttr "bend_5_jnt_aimConstraint1.cry" "bend_5_jnt.ry";
connectAttr "bend_5_jnt_aimConstraint1.crz" "bend_5_jnt.rz";
connectAttr "bend_5_jnt.pim" "bend_5_jnt_aimConstraint1.cpim";
connectAttr "bend_5_jnt.t" "bend_5_jnt_aimConstraint1.ct";
connectAttr "bend_5_jnt.rp" "bend_5_jnt_aimConstraint1.crp";
connectAttr "bend_5_jnt.rpt" "bend_5_jnt_aimConstraint1.crt";
connectAttr "bend_5_jnt.ro" "bend_5_jnt_aimConstraint1.cro";
connectAttr "bend_5_jnt.jo" "bend_5_jnt_aimConstraint1.cjo";
connectAttr "chest_out.t" "bend_5_jnt_aimConstraint1.tg[0].tt";
connectAttr "chest_out.rp" "bend_5_jnt_aimConstraint1.tg[0].trp";
connectAttr "chest_out.rpt" "bend_5_jnt_aimConstraint1.tg[0].trt";
connectAttr "chest_out.pm" "bend_5_jnt_aimConstraint1.tg[0].tpm";
connectAttr "bend_5_jnt_aimConstraint1.w0" "bend_5_jnt_aimConstraint1.tg[0].tw";
connectAttr "bend_5_foll.wm" "bend_5_jnt_aimConstraint1.wum";
connectAttr "bend_crv_0_mpath.ac" "bend_crv_0_jnt.t";
connectAttr "bend_crv_0_mpath.msg" "bend_crv_0_jnt.sml";
connectAttr "bend_crv_0_mpath.ro" "bend_crv_0_jnt.ro";
connectAttr "bend_crv_1_mpath.ac" "bend_crv_1_jnt.t";
connectAttr "bend_crv_1_mpath.msg" "bend_crv_1_jnt.sml";
connectAttr "bend_crv_1_mpath.ro" "bend_crv_1_jnt.ro";
connectAttr "bend_crv_2_mpath.ac" "bend_crv_2_jnt.t";
connectAttr "bend_crv_2_mpath.msg" "bend_crv_2_jnt.sml";
connectAttr "bend_crv_2_mpath.ro" "bend_crv_2_jnt.ro";
connectAttr "bend_crv_3_mpath.ac" "bend_crv_3_jnt.t";
connectAttr "bend_crv_3_mpath.msg" "bend_crv_3_jnt.sml";
connectAttr "bend_crv_3_mpath.ro" "bend_crv_3_jnt.ro";
connectAttr "bend_crv_4_mpath.ac" "bend_crv_4_jnt.t";
connectAttr "bend_crv_4_mpath.msg" "bend_crv_4_jnt.sml";
connectAttr "bend_crv_4_mpath.ro" "bend_crv_4_jnt.ro";
connectAttr "bend_crv_5_mpath.ac" "bend_crv_5_jnt.t";
connectAttr "bend_crv_5_mpath.msg" "bend_crv_5_jnt.sml";
connectAttr "bend_crv_5_mpath.ro" "bend_crv_5_jnt.ro";
connectAttr "bend_crv_6_mpath.ac" "bend_crv_6_jnt.t";
connectAttr "bend_crv_6_mpath.msg" "bend_crv_6_jnt.sml";
connectAttr "bend_crv_6_mpath.ro" "bend_crv_6_jnt.ro";
connectAttr "skinCluster1GroupId.id" "bend_surfShape.iog.og[21].gid";
connectAttr "skinCluster1Set.mwc" "bend_surfShape.iog.og[21].gco";
connectAttr "groupId45.id" "bend_surfShape.iog.og[22].gid";
connectAttr "tweakSet26.mwc" "bend_surfShape.iog.og[22].gco";
connectAttr "skinCluster1.og[0]" "bend_surfShape.cr";
connectAttr "tweak26.pl[0].cp[0]" "bend_surfShape.twl";
connectAttr "root_connector_decMat.osx" "outJoints.sx";
connectAttr "root_connector_decMat.osy" "outJoints.sy";
connectAttr "multDoubleLinear14.o" "outJoints.sz";
connectAttr "decomposeMatrix90.otx" "root_outJoint.tx";
connectAttr "decomposeMatrix90.oty" "root_outJoint.ty";
connectAttr "decomposeMatrix90.otz" "root_outJoint.tz";
connectAttr "decomposeMatrix90.orx" "root_outJoint.rx";
connectAttr "decomposeMatrix90.ory" "root_outJoint.ry";
connectAttr "decomposeMatrix90.orz" "root_outJoint.rz";
connectAttr "spine_2_skinJoint_decMat.otx" "local_1_outJoint.tx";
connectAttr "spine_2_skinJoint_decMat.oty" "local_1_outJoint.ty";
connectAttr "spine_2_skinJoint_decMat.otz" "local_1_outJoint.tz";
connectAttr "spine_2_skinJoint_decMat.orx" "local_1_outJoint.rx";
connectAttr "spine_2_skinJoint_decMat.ory" "local_1_outJoint.ry";
connectAttr "spine_2_skinJoint_decMat.orz" "local_1_outJoint.rz";
connectAttr "root_outJoint.s" "local_1_outJoint.is";
connectAttr "squash_blendTwoAttr.o" "local_1_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_1_outJoint.sz";
connectAttr "local_1_outJoint.s" "local_2_outJoint.is";
connectAttr "spine_3_skinJoint_decMat.otx" "local_2_outJoint.tx";
connectAttr "spine_3_skinJoint_decMat.oty" "local_2_outJoint.ty";
connectAttr "spine_3_skinJoint_decMat.otz" "local_2_outJoint.tz";
connectAttr "spine_3_skinJoint_decMat.orx" "local_2_outJoint.rx";
connectAttr "spine_3_skinJoint_decMat.ory" "local_2_outJoint.ry";
connectAttr "spine_3_skinJoint_decMat.orz" "local_2_outJoint.rz";
connectAttr "squash_blendTwoAttr.o" "local_2_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_2_outJoint.sz";
connectAttr "local_2_outJoint.s" "local_3_outJoint.is";
connectAttr "spine_4_skinJoint_decMat.otx" "local_3_outJoint.tx";
connectAttr "spine_4_skinJoint_decMat.oty" "local_3_outJoint.ty";
connectAttr "spine_4_skinJoint_decMat.otz" "local_3_outJoint.tz";
connectAttr "spine_4_skinJoint_decMat.orx" "local_3_outJoint.rx";
connectAttr "spine_4_skinJoint_decMat.ory" "local_3_outJoint.ry";
connectAttr "spine_4_skinJoint_decMat.orz" "local_3_outJoint.rz";
connectAttr "squash_blendTwoAttr.o" "local_3_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_3_outJoint.sz";
connectAttr "spine_4_skinJoint_decMat1.otx" "local_4_outJoint.tx";
connectAttr "spine_4_skinJoint_decMat1.oty" "local_4_outJoint.ty";
connectAttr "spine_4_skinJoint_decMat1.otz" "local_4_outJoint.tz";
connectAttr "spine_4_skinJoint_decMat1.orx" "local_4_outJoint.rx";
connectAttr "spine_4_skinJoint_decMat1.ory" "local_4_outJoint.ry";
connectAttr "spine_4_skinJoint_decMat1.orz" "local_4_outJoint.rz";
connectAttr "local_3_outJoint.s" "local_4_outJoint.is";
connectAttr "squash_blendTwoAttr.o" "local_4_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_4_outJoint.sz";
connectAttr "spine_5_skinJoint_decMat1.otx" "local_5_outJoint.tx";
connectAttr "spine_5_skinJoint_decMat1.oty" "local_5_outJoint.ty";
connectAttr "spine_5_skinJoint_decMat1.otz" "local_5_outJoint.tz";
connectAttr "spine_5_skinJoint_decMat1.orx" "local_5_outJoint.rx";
connectAttr "spine_5_skinJoint_decMat1.ory" "local_5_outJoint.ry";
connectAttr "spine_5_skinJoint_decMat1.orz" "local_5_outJoint.rz";
connectAttr "local_4_outJoint.s" "local_5_outJoint.is";
connectAttr "squash_blendTwoAttr.o" "local_5_outJoint.sy";
connectAttr "squash_blendTwoAttr.o" "local_5_outJoint.sz";
connectAttr "local_end_outJoint_decMat.otx" "local_end_outJoint.tx";
connectAttr "local_end_outJoint_decMat.oty" "local_end_outJoint.ty";
connectAttr "local_end_outJoint_decMat.otz" "local_end_outJoint.tz";
connectAttr "local_end_outJoint_decMat.orx" "local_end_outJoint.rx";
connectAttr "local_end_outJoint_decMat.ory" "local_end_outJoint.ry";
connectAttr "local_end_outJoint_decMat.orz" "local_end_outJoint.rz";
connectAttr "spine_5_skinJoint_decMat2.otx" "end_outJoint.tx";
connectAttr "spine_5_skinJoint_decMat2.oty" "end_outJoint.ty";
connectAttr "spine_5_skinJoint_decMat2.otz" "end_outJoint.tz";
connectAttr "spine_5_skinJoint_decMat2.orx" "end_outJoint.rx";
connectAttr "spine_5_skinJoint_decMat2.ory" "end_outJoint.ry";
connectAttr "spine_5_skinJoint_decMat2.orz" "end_outJoint.rz";
connectAttr "moduleControlSet.msg" "sets.dnsm" -na;
connectAttr "skinJointsSet.msg" "sets.dnsm" -na;
connectAttr "end_decomposeMatrix.oty" "parts_multiplyDivide.i1x";
connectAttr "end_decomposeMatrix.oty" "parts_multiplyDivide.i1y";
connectAttr "end_decomposeMatrix.oty" "parts_multiplyDivide.i1z";
connectAttr "end_multMatrix.o" "end_decomposeMatrix.imat";
connectAttr "end_poser.wm" "end_multMatrix.i[0]";
connectAttr "root_poser.wim" "end_multMatrix.i[1]";
connectAttr "skinCluster2GroupId.msg" "skinCluster2Set.gn" -na;
connectAttr "init_surfShape.iog.og[23]" "skinCluster2Set.dsm" -na;
connectAttr "skinCluster2.msg" "skinCluster2Set.ub[0]";
connectAttr "skinCluster2GroupParts.og" "skinCluster2.ip[0].ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2.ip[0].gi";
connectAttr "bindPose7.msg" "skinCluster2.bp";
connectAttr "local_4_jnt.wm" "skinCluster2.ma[0]";
connectAttr "local_1_jnt.wm" "skinCluster2.ma[1]";
connectAttr "root_jnt.wm" "skinCluster2.ma[2]";
connectAttr "local_5_jnt.wm" "skinCluster2.ma[3]";
connectAttr "end_jnt.wm" "skinCluster2.ma[4]";
connectAttr "local_2_jnt.wm" "skinCluster2.ma[5]";
connectAttr "local_3_jnt.wm" "skinCluster2.ma[6]";
connectAttr "local_4_jnt.liw" "skinCluster2.lw[0]";
connectAttr "local_1_jnt.liw" "skinCluster2.lw[1]";
connectAttr "root_jnt.liw" "skinCluster2.lw[2]";
connectAttr "local_5_jnt.liw" "skinCluster2.lw[3]";
connectAttr "end_jnt.liw" "skinCluster2.lw[4]";
connectAttr "local_2_jnt.liw" "skinCluster2.lw[5]";
connectAttr "local_3_jnt.liw" "skinCluster2.lw[6]";
connectAttr "mod.msg" "bindPose7.m[0]";
connectAttr "posers.msg" "bindPose7.m[1]";
connectAttr "mainPoser.msg" "bindPose7.m[2]";
connectAttr "init_locators_group.msg" "bindPose7.m[3]";
connectAttr "local_4_jnt.msg" "bindPose7.m[4]";
connectAttr "local_1_jnt.msg" "bindPose7.m[5]";
connectAttr "root_jnt.msg" "bindPose7.m[6]";
connectAttr "local_5_jnt.msg" "bindPose7.m[7]";
connectAttr "end_jnt.msg" "bindPose7.m[8]";
connectAttr "local_2_jnt.msg" "bindPose7.m[9]";
connectAttr "local_3_jnt.msg" "bindPose7.m[10]";
connectAttr "bindPose7.w" "bindPose7.p[0]";
connectAttr "bindPose7.m[0]" "bindPose7.p[1]";
connectAttr "bindPose7.m[1]" "bindPose7.p[2]";
connectAttr "bindPose7.m[2]" "bindPose7.p[3]";
connectAttr "bindPose7.m[3]" "bindPose7.p[4]";
connectAttr "bindPose7.m[3]" "bindPose7.p[5]";
connectAttr "bindPose7.m[3]" "bindPose7.p[6]";
connectAttr "bindPose7.m[3]" "bindPose7.p[7]";
connectAttr "bindPose7.m[3]" "bindPose7.p[8]";
connectAttr "bindPose7.m[3]" "bindPose7.p[9]";
connectAttr "bindPose7.m[3]" "bindPose7.p[10]";
connectAttr "tweak27.og[0]" "skinCluster2GroupParts.ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2GroupParts.gi";
connectAttr "groupParts47.og" "tweak27.ip[0].ig";
connectAttr "groupId47.id" "tweak27.ip[0].gi";
connectAttr "groupId47.msg" "tweakSet27.gn" -na;
connectAttr "init_surfShape.iog.og[24]" "tweakSet27.dsm" -na;
connectAttr "tweak27.msg" "tweakSet27.ub[0]";
connectAttr "init_surfShapeOrig.ws" "groupParts47.ig";
connectAttr "groupId47.id" "groupParts47.gi";
connectAttr "root_poser.wm" "root_poser_decMat.imat";
connectAttr "root_connector.wm" "root_connector_decMat.imat";
connectAttr "end_multMatrix1.o" "end_decomposeMatrix1.imat";
connectAttr "mainPoser.wm" "end_multMatrix1.i[0]";
connectAttr "root_poser.wim" "end_multMatrix1.i[1]";
connectAttr "end_multMatrix.o" "inverseMatrix1.imat";
connectAttr "pelvis.controls" "condition2.ft";
connectAttr "condition1.ocr" "condition2.cfr";
connectAttr "condition3.ocr" "condition2.cfg";
connectAttr "pelvis.controls" "condition1.ft";
connectAttr "pelvis.controls" "condition3.ft";
connectAttr "multMatrix71.o" "decomposeMatrix91.imat";
connectAttr "fk_1_pivot_loc.wm" "multMatrix71.i[0]";
connectAttr "fk_bone_1_group_pos.wim" "multMatrix71.i[1]";
connectAttr "multMatrix72.o" "decomposeMatrix92.imat";
connectAttr "fk_2_pivot_loc.wm" "multMatrix72.i[0]";
connectAttr "fk_bone_2_group_pos.wim" "multMatrix72.i[1]";
connectAttr "multMatrix73.o" "decomposeMatrix93.imat";
connectAttr "fk_3_pivot_loc.wm" "multMatrix73.i[0]";
connectAttr "fk_bone_3_group_pos.wim" "multMatrix73.i[1]";
connectAttr "hips_ik.weight" "reverse8.ix";
connectAttr "curDistance_scaled_multiplyDivide.ox" "curDistance_part.i1";
connectAttr "current_distance.d" "curDistance_scaled_multiplyDivide.i1x";
connectAttr "root_connector_decMat.osx" "curDistance_scaled_multiplyDivide.i2x";
connectAttr "pointMatrixMult5.o" "current_distance.p1";
connectAttr "pointMatrixMult6.o" "current_distance.p2";
connectAttr "chest.wm" "pointMatrixMult5.im";
connectAttr "hips_ik.wm" "pointMatrixMult6.im";
connectAttr "curDistance_scaled_multiplyDivide.ox" "curDistance_part_2.i1";
connectAttr "decomposeMatrix87.ory" "unitConversion31.i";
connectAttr "multMatrix67.o" "decomposeMatrix87.imat";
connectAttr "local_3_group_2.wm" "multMatrix67.i[0]";
connectAttr "bendJoint_1.wim" "multMatrix67.i[1]";
connectAttr "root_poser.wim" "multMatrix3.i[1]";
connectAttr "multiplyDivide1856.o" "multiplyDivide1855.i1";
connectAttr "plusMinusAverage1.o3" "multiplyDivide1856.i1";
connectAttr "end_poser.t" "plusMinusAverage1.i3[0]";
connectAttr "root_poser.t" "plusMinusAverage1.i3[1]";
connectAttr "stomach_offset_multiplyDivide.ox" "stomachChestMid_loc_offset.i2";
connectAttr "curDistance_part_2.o" "stomachChestMid_loc_offset.i1";
connectAttr "stomach_offset_distance.d" "stomach_offset_multiplyDivide.i1x";
connectAttr "stomach_offset_distance.d" "stomach_offset_multiplyDivide.i1y";
connectAttr "stomach.tz" "stomach_offset_distance.p1z";
connectAttr "stomach.tx" "stomach_offset_distance.p1x";
connectAttr "stomach_group.tz" "stomach_offset_distance.p2z";
connectAttr "stomach_group.tx" "stomach_offset_distance.p2x";
connectAttr "decomposeMatrix86.ory" "unitConversion29.i";
connectAttr "multMatrix66.o" "decomposeMatrix86.imat";
connectAttr "local_3_group_2.wm" "multMatrix66.i[0]";
connectAttr "bend_joint_7.wim" "multMatrix66.i[1]";
connectAttr "stomach.t" "bendJoint_4_multiply_position.i1";
connectAttr "stomach_offset_multiplyDivide.oy" "stomachHipsMid_loc_offset.i2";
connectAttr "curDistance_part_2_rev.o" "stomachHipsMid_loc_offset.i1";
connectAttr "curDistance_part_2.o" "curDistance_part_2_rev.i1";
connectAttr "decomposeMatrix87.ory" "unitConversion30.i";
connectAttr "chest_group_multMatrix.o" "chest_group_decomposeMatrix.imat";
connectAttr "fk_bone_3_out.wm" "chest_group_multMatrix.i[0]";
connectAttr "chest_group.pim" "chest_group_multMatrix.i[1]";
connectAttr "chest.weight" "reverse6.ix";
connectAttr "curDistance_part_2.o" "multDoubleLinear13.i1";
connectAttr "decomposeMatrix86.ory" "unitConversion27.i";
connectAttr "curDistance_part.o" "curDistance_part_rev.i1";
connectAttr "l_b_leg__pelvis__ik_aim_group_multMat.o" "l_b_leg__pelvis__ik_aim_group_decMat.imat"
		;
connectAttr "pelvis_initLoc.wim" "l_b_leg__pelvis__ik_aim_group_multMat.i[1]";
connectAttr "r_b_leg__pelvis__ik_aim_group_multMat.o" "r_b_leg__pelvis__ik_aim_group_decMat.imat"
		;
connectAttr "pelvis_initLoc.wim" "r_b_leg__pelvis__ik_aim_group_multMat.i[1]";
connectAttr "l_f_leg__pelvis__ik_aim_group_multMat.o" "l_f_leg__pelvis__ik_aim_group_decMat.imat"
		;
connectAttr "pelvis_initLoc.wim" "l_f_leg__pelvis__ik_aim_group_multMat.i[1]";
connectAttr "r_f_leg__pelvis__ik_aim_group_multMat.o" "r_f_leg__pelvis__ik_aim_group_decMat.imat"
		;
connectAttr "pelvis_initLoc.wim" "r_f_leg__pelvis__ik_aim_group_multMat.i[1]";
connectAttr "bend_surfShape.ws" "curveFromSurfaceIso1.is";
connectAttr "mod.slidingJoints" "condition7.ft";
connectAttr "closestPointOnSurface1.u" "condition7.ctr";
connectAttr "bend_surfShape.ws" "closestPointOnSurface1.is";
connectAttr "bend_crv_1_jnt.t" "closestPointOnSurface1.ip";
connectAttr "squash_blendTwoAttr.const" "squash_blendTwoAttr.i[0]";
connectAttr "multiplyDivide1849.ox" "squash_blendTwoAttr.i[1]";
connectAttr "pelvis.squash" "squash_blendTwoAttr.ab";
connectAttr "multiplyDivide1846.ox" "multiplyDivide1849.i2x";
connectAttr "multiplyDivide1853.ox" "multiplyDivide1846.i2x";
connectAttr "curveInfo3.al" "multiplyDivide1846.i1x";
connectAttr "distanceBetween1.d" "multiplyDivide1853.i1x";
connectAttr "root_connector_decMat.osx" "multiplyDivide1853.i2x";
connectAttr "end_poser.t" "distanceBetween1.p2";
connectAttr "root_poser.t" "distanceBetween1.p1";
connectAttr "bend_crvShape.ws" "curveInfo3.ic";
connectAttr "mod.slidingJoints" "condition8.ft";
connectAttr "closestPointOnSurface2.u" "condition8.ctr";
connectAttr "bend_surfShape.ws" "closestPointOnSurface2.is";
connectAttr "bend_crv_2_jnt.t" "closestPointOnSurface2.ip";
connectAttr "mod.slidingJoints" "condition10.ft";
connectAttr "closestPointOnSurface4.u" "condition10.ctr";
connectAttr "bend_surfShape.ws" "closestPointOnSurface4.is";
connectAttr "bend_crv_3_jnt.t" "closestPointOnSurface4.ip";
connectAttr "mod.slidingJoints" "condition9.ft";
connectAttr "closestPointOnSurface3.u" "condition9.ctr";
connectAttr "bend_surfShape.ws" "closestPointOnSurface3.is";
connectAttr "bend_crv_4_jnt.t" "closestPointOnSurface3.ip";
connectAttr "mod.slidingJoints" "condition11.ft";
connectAttr "closestPointOnSurface5.u" "condition11.ctr";
connectAttr "bend_surfShape.ws" "closestPointOnSurface5.is";
connectAttr "bend_crv_5_jnt.t" "closestPointOnSurface5.ip";
connectAttr "bend_crvShape.ws" "bend_crv_0_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_1_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_2_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_3_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_4_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_5_mpath.gp";
connectAttr "bend_crvShape.ws" "bend_crv_6_mpath.gp";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "bend_surfShape.iog.og[21]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose6.msg" "skinCluster1.bp";
connectAttr "bendJoint_1.wm" "skinCluster1.ma[0]";
connectAttr "bendJoint_2.wm" "skinCluster1.ma[1]";
connectAttr "bendJoint_3.wm" "skinCluster1.ma[2]";
connectAttr "bendJoint_4.wm" "skinCluster1.ma[3]";
connectAttr "bendJoint_5.wm" "skinCluster1.ma[4]";
connectAttr "bend_joint_6.wm" "skinCluster1.ma[5]";
connectAttr "bend_joint_7.wm" "skinCluster1.ma[6]";
connectAttr "bendJoint_1.liw" "skinCluster1.lw[0]";
connectAttr "bendJoint_2.liw" "skinCluster1.lw[1]";
connectAttr "bendJoint_3.liw" "skinCluster1.lw[2]";
connectAttr "bendJoint_4.liw" "skinCluster1.lw[3]";
connectAttr "bendJoint_5.liw" "skinCluster1.lw[4]";
connectAttr "bend_joint_6.liw" "skinCluster1.lw[5]";
connectAttr "bend_joint_7.liw" "skinCluster1.lw[6]";
connectAttr "bendJoint_2.msg" "skinCluster1.ptt";
connectAttr "mod.msg" "bindPose6.m[0]";
connectAttr "controls.msg" "bindPose6.m[1]";
connectAttr "pelvis_group.msg" "bindPose6.m[2]";
connectAttr "fk_controls.msg" "bindPose6.m[5]";
connectAttr "hips_fk_group_2.msg" "bindPose6.m[6]";
connectAttr "hips_fk_group.msg" "bindPose6.m[7]";
connectAttr "hips_fk.msg" "bindPose6.m[8]";
connectAttr "bendJoint_1.msg" "bindPose6.m[9]";
connectAttr "bendJoint_2.msg" "bindPose6.m[10]";
connectAttr "ik_controls.msg" "bindPose6.m[11]";
connectAttr "stomach_group_2.msg" "bindPose6.m[12]";
connectAttr "stomach_group.msg" "bindPose6.m[13]";
connectAttr "stomach.msg" "bindPose6.m[14]";
connectAttr "stomachHipsMid_loc.msg" "bindPose6.m[15]";
connectAttr "bendJoint_3.msg" "bindPose6.m[16]";
connectAttr "bendJoint_4.msg" "bindPose6.m[17]";
connectAttr "stomachChestMid_loc.msg" "bindPose6.m[18]";
connectAttr "bendJoint_5.msg" "bindPose6.m[19]";
connectAttr "chest_group.msg" "bindPose6.m[20]";
connectAttr "chest.msg" "bindPose6.m[21]";
connectAttr "bend_joint_7.msg" "bindPose6.m[22]";
connectAttr "local_5_group.msg" "bindPose6.m[23]";
connectAttr "local_5.msg" "bindPose6.m[24]";
connectAttr "bend_joint_6.msg" "bindPose6.m[25]";
connectAttr "bindPose6.w" "bindPose6.p[0]";
connectAttr "bindPose6.m[0]" "bindPose6.p[1]";
connectAttr "bindPose6.m[1]" "bindPose6.p[2]";
connectAttr "bindPose6.m[2]" "bindPose6.p[3]";
connectAttr "bindPose6.m[3]" "bindPose6.p[4]";
connectAttr "bindPose6.m[4]" "bindPose6.p[5]";
connectAttr "bindPose6.m[5]" "bindPose6.p[6]";
connectAttr "bindPose6.m[6]" "bindPose6.p[7]";
connectAttr "bindPose6.m[7]" "bindPose6.p[8]";
connectAttr "bindPose6.m[8]" "bindPose6.p[9]";
connectAttr "bindPose6.m[9]" "bindPose6.p[10]";
connectAttr "bindPose6.m[4]" "bindPose6.p[11]";
connectAttr "bindPose6.m[11]" "bindPose6.p[12]";
connectAttr "bindPose6.m[12]" "bindPose6.p[13]";
connectAttr "bindPose6.m[13]" "bindPose6.p[14]";
connectAttr "bindPose6.m[14]" "bindPose6.p[15]";
connectAttr "bindPose6.m[15]" "bindPose6.p[16]";
connectAttr "bindPose6.m[14]" "bindPose6.p[17]";
connectAttr "bindPose6.m[14]" "bindPose6.p[18]";
connectAttr "bindPose6.m[18]" "bindPose6.p[19]";
connectAttr "bindPose6.m[11]" "bindPose6.p[20]";
connectAttr "bindPose6.m[20]" "bindPose6.p[21]";
connectAttr "bindPose6.m[21]" "bindPose6.p[22]";
connectAttr "bindPose6.m[22]" "bindPose6.p[23]";
connectAttr "bindPose6.m[23]" "bindPose6.p[24]";
connectAttr "bindPose6.m[24]" "bindPose6.p[25]";
connectAttr "bendJoint_1.bps" "bindPose6.wm[9]";
connectAttr "bendJoint_2.bps" "bindPose6.wm[10]";
connectAttr "bendJoint_3.bps" "bindPose6.wm[16]";
connectAttr "bendJoint_4.bps" "bindPose6.wm[17]";
connectAttr "bendJoint_5.bps" "bindPose6.wm[19]";
connectAttr "bend_joint_7.bps" "bindPose6.wm[22]";
connectAttr "bend_joint_6.bps" "bindPose6.wm[25]";
connectAttr "tweak26.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupParts45.og" "tweak26.ip[0].ig";
connectAttr "groupId45.id" "tweak26.ip[0].gi";
connectAttr "groupId45.msg" "tweakSet26.gn" -na;
connectAttr "bend_surfShape.iog.og[22]" "tweakSet26.dsm" -na;
connectAttr "tweak26.msg" "tweakSet26.ub[0]";
connectAttr "bend_surfShapeOrig.ws" "groupParts45.ig";
connectAttr "groupId45.id" "groupParts45.gi";
connectAttr "root_connector_decMat.osz" "multDoubleLinear14.i1";
connectAttr "mirror_condition.ocr" "multDoubleLinear14.i2";
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "multMatrix69.o" "decomposeMatrix90.imat";
connectAttr "bendJoint_1_out.wm" "multMatrix69.i[0]";
connectAttr "root_outJoint.pim" "multMatrix69.i[1]";
connectAttr "spine_2_skinJoint_multMat.o" "spine_2_skinJoint_decMat.imat";
connectAttr "bend_1_jnt.wm" "spine_2_skinJoint_multMat.i[0]";
connectAttr "local_1_outJoint.pim" "spine_2_skinJoint_multMat.i[1]";
connectAttr "spine_3_skinJoint_multMat.o" "spine_3_skinJoint_decMat.imat";
connectAttr "bend_2_jnt.wm" "spine_3_skinJoint_multMat.i[0]";
connectAttr "local_2_outJoint.pim" "spine_3_skinJoint_multMat.i[1]";
connectAttr "spine_4_skinJoint_multMat.o" "spine_4_skinJoint_decMat.imat";
connectAttr "bend_3_jnt.wm" "spine_4_skinJoint_multMat.i[0]";
connectAttr "local_3_outJoint.pim" "spine_4_skinJoint_multMat.i[1]";
connectAttr "spine_4_skinJoint_multMat1.o" "spine_4_skinJoint_decMat1.imat";
connectAttr "bend_4_jnt.wm" "spine_4_skinJoint_multMat1.i[0]";
connectAttr "local_4_outJoint.pim" "spine_4_skinJoint_multMat1.i[1]";
connectAttr "spine_5_skinJoint_multMat1.o" "spine_5_skinJoint_decMat1.imat";
connectAttr "bend_5_jnt.wm" "spine_5_skinJoint_multMat1.i[0]";
connectAttr "local_5_outJoint.pim" "spine_5_skinJoint_multMat1.i[1]";
connectAttr "local_end_outJoint_multMat.o" "local_end_outJoint_decMat.imat";
connectAttr "end_out.wm" "local_end_outJoint_multMat.i[0]";
connectAttr "local_end_outJoint.pim" "local_end_outJoint_multMat.i[1]";
connectAttr "spine_5_skinJoint_multMat2.o" "spine_5_skinJoint_decMat2.imat";
connectAttr "end_out.wm" "spine_5_skinJoint_multMat2.i[0]";
connectAttr "end_outJoint.pim" "spine_5_skinJoint_multMat2.i[1]";
connectAttr "spineRoot.iog" "moduleControlSet.dsm" -na;
connectAttr "pelvis.iog" "moduleControlSet.dsm" -na;
connectAttr "chestRoot.iog" "moduleControlSet.dsm" -na;
connectAttr "fk_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "ik_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "local_moduleControlSet.msg" "moduleControlSet.dnsm" -na;
connectAttr "fk_3.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_2.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "fk_1.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "hips_fk.iog" "fk_moduleControlSet.dsm" -na;
connectAttr "hips_ik.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "chest.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "stomach.iog" "ik_moduleControlSet.dsm" -na;
connectAttr "local_5.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_4.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_3.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_2.iog" "local_moduleControlSet.dsm" -na;
connectAttr "local_1.iog" "local_moduleControlSet.dsm" -na;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "root_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_1_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_2_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_3_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_4_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "local_5_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "end_outJoint.iog" "skinJointsSet.dsm" -na;
connectAttr "mainPoserShapeOrig.ws" "mainPoser_clusterHandleCluster.ip[0].ig";
connectAttr "mainPoserShapeOrig.l" "mainPoser_clusterHandleCluster.orggeom[0]";
connectAttr "mainPoser_clusterHandle.wm" "mainPoser_clusterHandleCluster.ma";
connectAttr "mainPoser_clusterHandleShape.x" "mainPoser_clusterHandleCluster.x";
connectAttr "mainPoser.globalSize" "multiplyDivide1857.i1x";
connectAttr "mainPoser.globalSize" "multiplyDivide1857.i1y";
connectAttr "mainPoser.globalSize" "multiplyDivide1857.i1z";
connectAttr "mainPoser.size" "multiplyDivide1857.i2x";
connectAttr "root_poser.size" "multiplyDivide1857.i2y";
connectAttr "end_poser.size" "multiplyDivide1857.i2z";
connectAttr "multiplyDivide1857.oy" "makeNurbSphere1.r";
connectAttr "multiplyDivide1857.oz" "makeNurbSphere2.r";
connectAttr "local_1_poser.size" "multiplyDivide1858.i1x";
connectAttr "local_2_poser.size" "multiplyDivide1858.i1y";
connectAttr "local_3_poser.size" "multiplyDivide1858.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide1858.i2x";
connectAttr "mainPoser.globalSize" "multiplyDivide1858.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide1858.i2z";
connectAttr "multiplyDivide1858.ox" "makeNurbSphere3.r";
connectAttr "multiplyDivide1858.oy" "makeNurbSphere4.r";
connectAttr "multiplyDivide1858.oz" "makeNurbSphere5.r";
connectAttr "multiplyDivide1859.oy" "makeNurbSphere6.r";
connectAttr "multiplyDivide1859.ox" "makeNurbSphere7.r";
connectAttr "local_4_poser.size" "multiplyDivide1859.i1x";
connectAttr "local_5_poser.size" "multiplyDivide1859.i1y";
connectAttr "mainPoser.lineWidth" "multiplyDivide1859.i1z";
connectAttr "mainPoser.globalSize" "multiplyDivide1859.i2x";
connectAttr "mainPoser.globalSize" "multiplyDivide1859.i2y";
connectAttr "mainPoser.globalSize" "multiplyDivide1859.i2z";
connectAttr "posers_curveShape.ws" "sweepMeshCreator1.inCurveArray[0]";
connectAttr "multiplyDivide1859.oz" "sweepMeshCreator1.scaleProfileX";
connectAttr "makeNurbSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "makeNurbSphere2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "multiplyDivide1857.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "multiplyDivide1859.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "local_5_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "makeNurbSphere3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "local_3_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "local_3_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "multiplyDivide1858.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "makeNurbSphere4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "makeNurbSphere5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "local_4_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn";
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn";
connectAttr "local_5_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn";
connectAttr "end_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn";
connectAttr "makeNurbSphere6.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "sweepMeshCreator1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "local_1_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "end_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn";
connectAttr "local_4_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "local_2_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "local_2_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn";
connectAttr "local_1_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn";
connectAttr "makeNurbSphere7.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "chest_group_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "parts_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "end_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "squash_blendTwoAttr.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1846.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curveInfo3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1849.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1853.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bendJoint_4_multiply_position.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "stomach_offset_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "stomach_offset_multiplyDivide.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "stomachChestMid_loc_offset.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "stomachHipsMid_loc_offset.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part_2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part_2_rev.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "current_distance.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_scaled_multiplyDivide.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "curDistance_part_rev.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "curDistance_part.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix86.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion27.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion29.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix87.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "unitConversion31.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix90.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1855.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix91.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix92.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "decomposeMatrix93.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "end_decomposeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1856.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multMatrix3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1857.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1858.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1859.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "bend_surfShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "init_surfShape.iog" ":initialShadingGroup.dsm" -na;
// End of spineQuadrupped.ma
