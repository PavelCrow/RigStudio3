//Maya ASCII 2022 scene
//Name: point.ma
//Last modified: Wed, Jan 24, 2024 07:24:16 PM
//Codeset: 1251
requires maya "2022";
requires -nodeType "bifrostGraphShape" -dataType "bifData" "bifrostGraph" "2.6.0.0-202212071624-fbc8dae";
requires "stereoCamera" "10.0";
requires "AT_MPView" "RC 1";
requires "chevelureMaya" "0.0.100 made in Khimki";
requires "BluePencil" "1.0";
requires "anzovinRigNodes" "1.0";
requires "Mayatomr" "2013.0 - 3.10.1.11 ";
requires "eyeNode" "2011";
requires "RoadkillPro2012_amd64" "Version 1.044a";
requires "SLFxShader" "1.0";
requires "basicPerlinDeformer.py" "Unknown";
requires "dmm_cinematic" "1.2.0";
requires "hairNode" "1.000.000022 parent rev:197:e9baa3f74496";
requires "maxwell" "2.7.6";
requires "mtorsubdiv" "1.1";
requires "mtoa" "4.0.3";
requires "mtor" "4.0";
requires "ngSkinTools" "1.0.960";
requires "sampleData" "1.0";
requires "shaveNode" "1.1";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "28C4C3BC-4EC8-85F6-D1EE-8B97D1A98786";
createNode transform -n "mod";
	rename -uid "796B45B9-43DB-82CA-C93B-1A91B6023A77";
	addAttr -ci true -sn "version" -ln "version" -dt "string";
	addAttr -ci true -sn "mirror" -ln "mirror" -min 0 -max 1 -at "bool";
	setAttr -l on ".version" -type "string" "1.0";
createNode transform -n "posers" -p "mod";
	rename -uid "4295F9C2-4F7B-E34F-ECAD-1FB25E9C5061";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
createNode transform -n "mainPoser" -p "posers";
	rename -uid "079BBC3E-46A2-E93B-5E9D-58814DF8C9A7";
	addAttr -ci true -sn "size" -ln "size" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	addAttr -ci true -sn "moduleType" -ln "moduleType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 10;
	setAttr -k on ".s";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".size";
	setAttr -l on ".moduleName" -type "string" "";
	setAttr -l on ".moduleType" -type "string" "foot";
createNode nurbsCurve -n "mainPoserShape" -p "mainPoser";
	rename -uid "C85FD3BD-4B15-B4FD-5AE1-EF966DC407CB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.99476797966170438 0.99476788212242262 0.99476706456077602
		-0.99476797966170438 0.99476788212242262 -0.99476716167824697
		0.99476630445633485 0.99476788212242262 -0.99476716167824697
		0.99476630445633485 0.99476788212242262 0.99476706456077602
		-0.99476797966170438 0.99476788212242262 0.99476706456077602
		0.99476630445633485 0.99476788212242262 0.99476706456077602
		0.99476630445633485 -0.99476640199561894 0.99476706456077602
		-0.99476797966170438 -0.99476640199561894 0.99476706456077602
		-0.99476797966170438 0.99476788212242262 0.99476706456077602
		-0.99476797966170438 -0.99476640199561894 0.99476706456077602
		-0.99476797966170438 -0.99476640199561894 -0.99476716167824697
		-0.99476797966170438 0.99476788212242262 -0.99476716167824697
		-0.99476797966170438 -0.99476640199561894 -0.99476716167824697
		0.99476630445633485 -0.99476640199561894 -0.99476716167824697
		0.99476630445633485 0.99476788212242262 -0.99476716167824697
		0.99476630445633485 -0.99476640199561894 -0.99476716167824697
		0.99476630445633485 -0.99476640199561894 0.99476706456077602
		;
createNode transform -n "root_poser" -p "mainPoser";
	rename -uid "0D783FD7-47BA-DD87-4D4A-89BDDC058C88";
	addAttr -ci true -sn "radius" -ln "radius" -at "double";
	setAttr -k on ".s";
	setAttr ".dh" yes;
	setAttr -k on ".radius" 0.5;
createNode locator -n "root_poserShape" -p "root_poser";
	rename -uid "96E445A7-4256-0364-73A4-B8955EA80835";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "posers_bifrostGraph" -p "posers";
	rename -uid "D62B0F5F-40FC-D37C-CB4B-2DB81B1E9275";
	addAttr -ci true -sn "moduleName" -ln "moduleName" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".it" no;
	setAttr -l on ".moduleName" -type "string" "l_f_leg";
createNode bifrostGraphShape -n "posers_bifrostGraphShape" -p "posers_bifrostGraph";
	rename -uid "D96FF1A8-4610-6E91-34D7-799B41712C80";
	addAttr -r false -ci true -k true -m -sn "posers" -ln "posers" -at "fltMatrix";
	addAttr -r false -ci true -k true -sn "global_scale" -ln "global_scale" -at "float";
	addAttr -r false -ci true -k true -m -sn "radius" -ln "radius" -at "float";
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
	setAttr -k off ".v";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\n    \"header\": {\n        \"metadata\": [\n            {\n                \"metaName\": \"adskFileFormatVersion\",\n                \"metaValue\": \"100L\"\n            }\n        ]\n    },\n    \"namespaces\": [],\n    \"types\": [],\n    \"compounds\": [\n        {\n            \"name\": \"posers_bifrostGraphShape\",\n            \"metadata\": [\n                {\n                    \"metaName\": \"io_nodes\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_inodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"input\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1295.43 -241.6\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"posers\"\n                                                },\n                                                {\n                                                    \"metaName\": \"global_scale\"\n                                                },\n                                                {\n                                                    \"metaName\": \"radius\"\n                                                },\n                                                {\n                                                    \"metaName\": \"lines\"\n                                                },\n"
		+ "                                                {\n                                                    \"metaName\": \"width\"\n                                                },\n                                                {\n                                                    \"metaName\": \"poser_color\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"io_onodes\"\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Math,matrix_to_SRT\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Array,get_from_array\"\n"
		+ "                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,User::Compounds,print\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Array,slice_array\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Math,subtract\"\n                },\n                {\n                    \"metaName\": \"ViewportRect\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"-1253.84 -577.171 949.263 1349.66\"\n                },\n                {\n                    \"metaName\": \"internal\",\n                    \"metaValue\": \"true\"\n                }\n            ],\n            \"ports\": [\n                {\n                    \"portName\": \"posers\",\n                    \"portDirection\": \"input\",\n"
		+ "                    \"portType\": \"array<Math::float4x4>\"\n                },\n                {\n                    \"portName\": \"global_scale\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"radius\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"array<float>\"\n                },\n                {\n                    \"portName\": \"lines\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"array<array<Math::float4x4>>\"\n                },\n                {\n                    \"portName\": \"width\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"float\"\n                },\n                {\n                    \"portName\": \"poser_color\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Math::float3\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"UIWidget\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"ColorPicker\"\n                        }\n                    ]\n                }\n            ],\n            \"compounds\": [\n                {\n                    \"name\": \"for_each_spheres\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"icon\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"<NATIVE>../icons/LoopForEach.svg\"\n                        },\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n"
		+ "                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-1482.4 -501.737\"\n                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"max_iterations\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"current_index\"\n"
		+ "                                                        },\n                                                        {\n                                                            \"metaName\": \"posers\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"global_radius\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"radius\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"color\"\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        }\n"
		+ "                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\"\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Graph,terminal\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,multiply\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,add\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Geometry::Properties,get_point_position\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Array,get_from_array\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1742.66 -1147.49 1168.68 1661.62\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"max_iterations\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationLimit\": \"true\"\n                        },\n                        {\n                            \"portName\": \"current_index\",\n"
		+ "                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationCounter\": \"true\"\n                        },\n                        {\n                            \"portName\": \"posers\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"array<Math::float4x4>\"\n                        },\n                        {\n                            \"portName\": \"global_radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        },\n                        {\n                            \"portName\": \"radius\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"array<float>\"\n                        },\n                        {\n                            \"portName\": \"color\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"Math::float3\",\n                            \"metadata\": [\n"
		+ "                                {\n                                    \"metaName\": \"UIWidget\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"ColorPicker\"\n                                }\n                            ]\n                        }\n                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"matrix_to_SRT\",\n                            \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-453.496 -51.8009\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"set_point_position\",\n                            \"nodeType\": \"Geometry::Properties::set_point_position\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"529.5 -498\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"create_mesh_sphere\",\n                            \"nodeType\": \"Modeling::Primitive::create_mesh_sphere\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"PortExpandedState\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"Dimensions\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-404.149 -667.731\"\n                                }\n"
		+ "                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-870.891 -33.043\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_point_position\",\n                            \"nodeType\": \"Geometry::Properties::get_point_position\",\n                            \"metadata\": [\n                                {\n"
		+ "                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-30.5 -452\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"add\",\n                            \"nodeType\": \"Core::Math::add\",\n                            \"multiInPortNames\": [\n                                \"point_position\",\n                                \"translation\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n"
		+ "                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"271.5 -308\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array1\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1058.77 -616.974\"\n                                }\n"
		+ "                            ]\n                        },\n                        {\n                            \"nodeName\": \"multiply\",\n                            \"nodeType\": \"Core::Math::multiply\",\n                            \"multiInPortNames\": [\n                                \"value\",\n                                \"global_radius\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-736.856 -493.716\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"assign_material\",\n"
		+ "                            \"nodeType\": \"Rendering::Materials::assign_material\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"169.5 -868\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"constant_surface_mat\",\n                            \"nodeType\": \"Rendering::Materials::constant_surface_mat\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-389.5 -983\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"terminal\",\n                            \"nodeType\": \"Core::Graph::terminal\",\n                            \"fanInPortNames\": {\n                                \"final\": [],\n                                \"proxy\": [],\n                                \"diagnostic\": [\n                                    \"out_geometry\"\n                                ]\n                            },\n                            \"terminalStates\": [\n                                {\n                                    \"name\": \"Core::Graph::terminal::diagnostic\",\n                                    \"enabled\": \"true\"\n"
		+ "                                }\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"850.5 -714\"\n                                },\n                                {\n                                    \"metaName\": \"PortExpandedState\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"diagnostic\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1\"\n                                        }\n"
		+ "                                    ]\n                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \".posers\",\n                            \"target\": \"get_from_array.array\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array.index\"\n                        },\n                        {\n                            \"source\": \"create_mesh_sphere.sphere_mesh\",\n                            \"target\": \"get_point_position.geometry\"\n                        },\n                        {\n                            \"source\": \"get_point_position.point_position\",\n                            \"target\": \"add.first.point_position\"\n                        },\n                        {\n                            \"source\": \"matrix_to_SRT.translation\",\n                            \"target\": \"add.first.translation\"\n"
		+ "                        },\n                        {\n                            \"source\": \"add.output\",\n                            \"target\": \"set_point_position.positions\"\n                        },\n                        {\n                            \"source\": \"get_from_array.value\",\n                            \"target\": \"matrix_to_SRT.transform\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array1.index\"\n                        },\n                        {\n                            \"source\": \".radius\",\n                            \"target\": \"get_from_array1.array\"\n                        },\n                        {\n                            \"source\": \"get_from_array1.value\",\n                            \"target\": \"multiply.first.value\"\n                        },\n                        {\n                            \"source\": \".global_radius\",\n                            \"target\": \"multiply.first.global_radius\"\n"
		+ "                        },\n                        {\n                            \"source\": \"multiply.output\",\n                            \"target\": \"create_mesh_sphere.radius\"\n                        },\n                        {\n                            \"source\": \"constant_surface_mat.material_definition\",\n                            \"target\": \"assign_material.surface_material\"\n                        },\n                        {\n                            \"source\": \"create_mesh_sphere.sphere_mesh\",\n                            \"target\": \"assign_material.geometry\"\n                        },\n                        {\n                            \"source\": \"assign_material.out_geometry\",\n                            \"target\": \"set_point_position.geometry\"\n                        },\n                        {\n                            \"source\": \"set_point_position.out_geometry\",\n                            \"target\": \"terminal.diagnostic.out_geometry\"\n                        },\n                        {\n                            \"source\": \".color\",\n"
		+ "                            \"target\": \"constant_surface_mat.color\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n                            \"valueName\": \"create_mesh_sphere.radius\",\n                            \"valueType\": \"float\",\n                            \"value\": \"1f\"\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.height_segments\",\n                            \"valueType\": \"int\",\n                            \"value\": \"14L\"\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.axis_segments\",\n                            \"valueType\": \"int\",\n                            \"value\": \"20L\"\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.position\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n"
		+ "                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.up_axis\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"1f\",\n                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"create_mesh_sphere.base_to_pivot\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"false\"\n                        },\n                        {\n                            \"valueName\": \"assign_material.geometry\",\n                            \"valueType\": \"Object\",\n                            \"value\": {}\n                        },\n                        {\n                            \"valueName\": \"assign_material.set_surface\",\n"
		+ "                            \"valueType\": \"bool\",\n                            \"value\": \"true\"\n                        },\n                        {\n                            \"valueName\": \"assign_material.set_displacement\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"true\"\n                        },\n                        {\n                            \"valueName\": \"assign_material.set_volume\",\n                            \"valueType\": \"bool\",\n                            \"value\": \"true\"\n                        },\n                        {\n                            \"valueName\": \"constant_surface_mat.name\",\n                            \"valueType\": \"string\",\n                            \"value\": \"\"\n                        },\n                        {\n                            \"valueName\": \"constant_surface_mat.color\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"1f\",\n"
		+ "                                \"z\": \"0f\"\n                            }\n                        },\n                        {\n                            \"valueName\": \"constant_surface_mat.transparency\",\n                            \"valueType\": \"Math::float3\",\n                            \"value\": {\n                                \"x\": \"0f\",\n                                \"y\": \"0f\",\n                                \"z\": \"0f\"\n                            }\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        }\n                    ],\n                    \"forEachCompound\": {\n                        \"ports\": []\n                    }\n                },\n                {\n                    \"name\": \"for_each_lines\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"icon\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"<NATIVE>../icons/LoopForEach.svg\"\n"
		+ "                        },\n                        {\n                            \"metaName\": \"io_nodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"io_inodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"input\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"DisplayMode\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"2\"\n                                                },\n                                                {\n                                                    \"metaName\": \"LayoutPos\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"-537.464 -123.034\"\n"
		+ "                                                },\n                                                {\n                                                    \"metaName\": \"io_ports\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"max_iterations\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"current_index\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"lines\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"width\"\n                                                        }\n"
		+ "                                                    ]\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"io_onodes\"\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"output\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Math,subtract\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"BifrostGraph,Core::Array,array_size\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Array,get_from_array\"\n                        },\n                        {\n                            \"metaName\": \"_recentNode_\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"BifrostGraph,Core::Iterators,for_each\"\n                        },\n                        {\n                            \"metaName\": \"ViewportRect\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-433.443 -950.509 1338.59 1903.2\"\n                        }\n                    ],\n                    \"ports\": [\n                        {\n                            \"portName\": \"max_iterations\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n"
		+ "                            \"portIterationLimit\": \"true\"\n                        },\n                        {\n                            \"portName\": \"current_index\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"long\",\n                            \"portIterationCounter\": \"true\"\n                        },\n                        {\n                            \"portName\": \"lines\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"array<array<Math::float4x4>>\"\n                        },\n                        {\n                            \"portName\": \"width\",\n                            \"portDirection\": \"input\",\n                            \"portType\": \"float\"\n                        }\n                    ],\n                    \"compounds\": [\n                        {\n                            \"name\": \"for_each1\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"icon\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"<NATIVE>../icons/LoopForEach.svg\"\n                                },\n                                {\n                                    \"metaName\": \"io_nodes\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"io_inodes\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"input\",\n                                                    \"metadata\": [\n                                                        {\n                                                            \"metaName\": \"DisplayMode\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"2\"\n                                                        },\n"
		+ "                                                        {\n                                                            \"metaName\": \"LayoutPos\",\n                                                            \"metaType\": \"string\",\n                                                            \"metaValue\": \"-1513.15 -146.055\"\n                                                        },\n                                                        {\n                                                            \"metaName\": \"io_ports\",\n                                                            \"metadata\": [\n                                                                {\n                                                                    \"metaName\": \"max_iterations\"\n                                                                },\n                                                                {\n                                                                    \"metaName\": \"current_index\"\n                                                                },\n"
		+ "                                                                {\n                                                                    \"metaName\": \"lines\"\n                                                                },\n                                                                {\n                                                                    \"metaName\": \"width\"\n                                                                }\n                                                            ]\n                                                        }\n                                                    ]\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"io_onodes\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"output\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Logic,equal\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Logic,if\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Math,add\"\n                                },\n                                {\n                                    \"metaName\": \"_recentNode_\",\n"
		+ "                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"BifrostGraph,Core::Math,subtract\"\n                                },\n                                {\n                                    \"metaName\": \"ViewportRect\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-1721.11 -1861.15 4044.02 3977.09\"\n                                }\n                            ],\n                            \"ports\": [\n                                {\n                                    \"portName\": \"max_iterations\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"long\",\n                                    \"portIterationLimit\": \"true\"\n                                },\n                                {\n                                    \"portName\": \"current_index\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"long\",\n"
		+ "                                    \"portIterationCounter\": \"true\"\n                                },\n                                {\n                                    \"portName\": \"lines\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"array<Math::float4x4>\"\n                                },\n                                {\n                                    \"portName\": \"width\",\n                                    \"portDirection\": \"input\",\n                                    \"portType\": \"float\"\n                                }\n                            ],\n                            \"compoundNodes\": [\n                                {\n                                    \"nodeName\": \"matrix_to_SRT\",\n                                    \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n"
		+ "                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-106.902 -269.444\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"get_from_array\",\n                                    \"nodeType\": \"Core::Array::get_from_array\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n"
		+ "                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-415.492 -224.3\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"get_from_array1\",\n                                    \"nodeType\": \"Core::Array::get_from_array\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-519.19 199.71\"\n"
		+ "                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"matrix_to_SRT1\",\n                                    \"nodeType\": \"Core::Math::matrix_to_SRT\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-137.167 126.444\"\n                                        }\n                                    ]\n                                },\n                                {\n"
		+ "                                    \"nodeName\": \"construct_strands\",\n                                    \"nodeType\": \"Geometry::Strands::construct_strands\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"781.262 -266.167\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"build_array\",\n                                    \"nodeType\": \"Core::Array::build_array\",\n"
		+ "                                    \"multiInPortNames\": [\n                                        \"translation\",\n                                        \"translation1\"\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"475.582 -244.595\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"terminal\",\n                                    \"nodeType\": \"Core::Graph::terminal\",\n"
		+ "                                    \"fanInPortNames\": {\n                                        \"final\": [],\n                                        \"proxy\": [],\n                                        \"diagnostic\": [\n                                            \"strands\"\n                                        ]\n                                    },\n                                    \"terminalStates\": [\n                                        {\n                                            \"name\": \"Core::Graph::terminal::final\",\n                                            \"enabled\": \"true\"\n                                        },\n                                        {\n                                            \"name\": \"Core::Graph::terminal::proxy\",\n                                            \"enabled\": \"true\"\n                                        },\n                                        {\n                                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                                            \"enabled\": \"true\"\n"
		+ "                                        }\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1705.02 -352.893\"\n                                        },\n                                        {\n                                            \"metaName\": \"PortExpandedState\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"diagnostic\",\n                                                    \"metaType\": \"string\",\n"
		+ "                                                    \"metaValue\": \"1\"\n                                                },\n                                                {\n                                                    \"metaName\": \"proxy\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"0\"\n                                                },\n                                                {\n                                                    \"metaName\": \"final\",\n                                                    \"metaType\": \"string\",\n                                                    \"metaValue\": \"1\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"set_strands_shape\",\n                                    \"nodeType\": \"Geometry::Strands::set_strands_shape\",\n"
		+ "                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1160.08 -156.428\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"assign_material1\",\n                                    \"nodeType\": \"Rendering::Materials::assign_material\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n"
		+ "                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"1409.5 -458\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"constant_surface_mat1\",\n                                    \"nodeType\": \"Rendering::Materials::constant_surface_mat\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n"
		+ "                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"949.5 -621\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"value\",\n                                    \"valueType\": \"long\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1400.86 -601.446\"\n"
		+ "                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"add\",\n                                    \"nodeType\": \"Core::Math::add\",\n                                    \"multiInPortNames\": [\n                                        \"current_index\",\n                                        \"output1\"\n                                    ],\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1054.25 -602.655\"\n"
		+ "                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"if\",\n                                    \"nodeType\": \"Core::Logic::if\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-725.206 -528.358\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"nodeName\": \"equal\",\n"
		+ "                                    \"nodeType\": \"Core::Logic::equal\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1027.56 -333.247\"\n                                        }\n                                    ]\n                                }\n                            ],\n                            \"connections\": [\n                                {\n                                    \"source\": \"matrix_to_SRT.translation\",\n                                    \"target\": \"build_array.first.translation\"\n"
		+ "                                },\n                                {\n                                    \"source\": \"get_from_array.value\",\n                                    \"target\": \"matrix_to_SRT.transform\"\n                                },\n                                {\n                                    \"source\": \"get_from_array1.value\",\n                                    \"target\": \"matrix_to_SRT1.transform\"\n                                },\n                                {\n                                    \"source\": \"matrix_to_SRT1.translation\",\n                                    \"target\": \"build_array.first.translation1\"\n                                },\n                                {\n                                    \"source\": \"construct_strands.strands\",\n                                    \"target\": \"set_strands_shape.strands\"\n                                },\n                                {\n                                    \"source\": \"build_array.array\",\n                                    \"target\": \"construct_strands.point_position\"\n"
		+ "                                },\n                                {\n                                    \"source\": \"set_strands_shape.out_strands\",\n                                    \"target\": \"assign_material1.geometry\"\n                                },\n                                {\n                                    \"source\": \"assign_material1.out_geometry\",\n                                    \"target\": \"terminal.diagnostic.strands\"\n                                },\n                                {\n                                    \"source\": \"constant_surface_mat1.material_definition\",\n                                    \"target\": \"assign_material1.surface_material\"\n                                },\n                                {\n                                    \"source\": \"value.output\",\n                                    \"target\": \"add.first.output1\"\n                                },\n                                {\n                                    \"source\": \".current_index\",\n                                    \"target\": \"add.first.current_index\"\n"
		+ "                                },\n                                {\n                                    \"source\": \".lines\",\n                                    \"target\": \"get_from_array.array\"\n                                },\n                                {\n                                    \"source\": \".lines\",\n                                    \"target\": \"get_from_array1.array\"\n                                },\n                                {\n                                    \"source\": \".current_index\",\n                                    \"target\": \"get_from_array1.index\"\n                                },\n                                {\n                                    \"source\": \"equal.output\",\n                                    \"target\": \"if.condition\"\n                                },\n                                {\n                                    \"source\": \"if.output\",\n                                    \"target\": \"get_from_array.index\"\n                                },\n                                {\n"
		+ "                                    \"source\": \".max_iterations\",\n                                    \"target\": \"equal.first\"\n                                },\n                                {\n                                    \"source\": \".current_index\",\n                                    \"target\": \"equal.second\"\n                                },\n                                {\n                                    \"source\": \"add.output\",\n                                    \"target\": \"if.false_case\"\n                                },\n                                {\n                                    \"source\": \".width\",\n                                    \"target\": \"set_strands_shape.default_size\"\n                                }\n                            ],\n                            \"values\": [\n                                {\n                                    \"valueName\": \"get_from_array.index\",\n                                    \"valueType\": \"long\",\n                                    \"value\": \"2\"\n"
		+ "                                },\n                                {\n                                    \"valueName\": \"get_from_array1.index\",\n                                    \"valueType\": \"long\",\n                                    \"value\": \"1\"\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.strands\",\n                                    \"valueType\": \"Object\",\n                                    \"value\": {}\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.shape\",\n                                    \"valueType\": \"Geometry::StrandShapes\",\n                                    \"value\": \"Ribbon\"\n                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.screen_aligned\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n"
		+ "                                },\n                                {\n                                    \"valueName\": \"set_strands_shape.default_size\",\n                                    \"valueType\": \"float\",\n                                    \"value\": \"0.0513599999f\"\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.geometry\",\n                                    \"valueType\": \"Object\",\n                                    \"value\": {}\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.set_surface\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n                                },\n                                {\n                                    \"valueName\": \"assign_material1.set_displacement\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n"
		+ "                                },\n                                {\n                                    \"valueName\": \"assign_material1.set_volume\",\n                                    \"valueType\": \"bool\",\n                                    \"value\": \"true\"\n                                },\n                                {\n                                    \"valueName\": \"constant_surface_mat1.name\",\n                                    \"valueType\": \"string\",\n                                    \"value\": \"\"\n                                },\n                                {\n                                    \"valueName\": \"constant_surface_mat1.color\",\n                                    \"valueType\": \"Math::float3\",\n                                    \"value\": {\n                                        \"x\": \"0f\",\n                                        \"y\": \"0f\",\n                                        \"z\": \"0f\"\n                                    }\n                                },\n                                {\n"
		+ "                                    \"valueName\": \"constant_surface_mat1.transparency\",\n                                    \"valueType\": \"Math::float3\",\n                                    \"value\": {\n                                        \"x\": \"0f\",\n                                        \"y\": \"0f\",\n                                        \"z\": \"0f\"\n                                    }\n                                },\n                                {\n                                    \"valueName\": \"value.value\",\n                                    \"valueType\": \"long\",\n                                    \"value\": \"1\"\n                                }\n                            ],\n                            \"reservedNodeNames\": [\n                                {\n                                    \"name\": \"input\"\n                                }\n                            ],\n                            \"forEachCompound\": {\n                                \"ports\": []\n                            }\n                        }\n"
		+ "                    ],\n                    \"compoundNodes\": [\n                        {\n                            \"nodeName\": \"for_each1\",\n                            \"nodeType\": \"for_each1\",\n                            \"terminalStates\": [\n                                {\n                                    \"name\": \"Core::Graph::terminal::final\",\n                                    \"enabled\": \"true\"\n                                },\n                                {\n                                    \"name\": \"Core::Graph::terminal::proxy\",\n                                    \"enabled\": \"true\"\n                                },\n                                {\n                                    \"name\": \"Core::Graph::terminal::diagnostic\",\n                                    \"enabled\": \"true\"\n                                }\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"744.984 39.2217\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-11.3225 106.339\"\n"
		+ "                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"array_size\",\n                            \"nodeType\": \"Core::Array::array_size\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"120.155 -157.583\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"subtract\",\n                            \"nodeType\": \"Core::Math::subtract\",\n                            \"multiInPortNames\": [\n"
		+ "                                \"size\",\n                                \"output1\"\n                            ],\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"431.506 -419.527\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"value\",\n                            \"valueType\": \"long\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"99 -530\"\n                                }\n                            ]\n                        },\n                        {\n                            \"nodeName\": \"get_from_array1\",\n                            \"nodeType\": \"Core::Array::get_from_array\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"DisplayMode\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"2\"\n                                },\n                                {\n                                    \"metaName\": \"LayoutPos\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"-171.047 -237.573\"\n"
		+ "                                }\n                            ]\n                        }\n                    ],\n                    \"connections\": [\n                        {\n                            \"source\": \".lines\",\n                            \"target\": \"get_from_array.array\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array.index\"\n                        },\n                        {\n                            \"source\": \"get_from_array.value\",\n                            \"target\": \"for_each1.lines\"\n                        },\n                        {\n                            \"source\": \"array_size.size\",\n                            \"target\": \"subtract.first.size\"\n                        },\n                        {\n                            \"source\": \"value.output\",\n                            \"target\": \"subtract.first.output1\"\n                        },\n                        {\n                            \"source\": \"subtract.output\",\n"
		+ "                            \"target\": \"for_each1.max_iterations\"\n                        },\n                        {\n                            \"source\": \".current_index\",\n                            \"target\": \"get_from_array1.index\"\n                        },\n                        {\n                            \"source\": \".lines\",\n                            \"target\": \"get_from_array1.array\"\n                        },\n                        {\n                            \"source\": \"get_from_array1.value\",\n                            \"target\": \"array_size.array\"\n                        },\n                        {\n                            \"source\": \".width\",\n                            \"target\": \"for_each1.width\"\n                        }\n                    ],\n                    \"values\": [\n                        {\n                            \"valueName\": \"for_each1.max_iterations\",\n                            \"valueType\": \"long\",\n                            \"value\": \"10\"\n                        },\n                        {\n"
		+ "                            \"valueName\": \"for_each1.width\",\n                            \"valueType\": \"float\",\n                            \"value\": \"0.0513599999f\"\n                        },\n                        {\n                            \"valueName\": \"value.value\",\n                            \"valueType\": \"long\",\n                            \"value\": \"1\"\n                        }\n                    ],\n                    \"reservedNodeNames\": [\n                        {\n                            \"name\": \"input\"\n                        }\n                    ],\n                    \"forEachCompound\": {\n                        \"ports\": []\n                    }\n                }\n            ],\n            \"compoundNodes\": [\n                {\n                    \"nodeName\": \"for_each_spheres\",\n                    \"nodeType\": \"for_each_spheres\",\n                    \"terminalStates\": [\n                        {\n                            \"name\": \"Core::Graph::terminal::diagnostic\",\n                            \"enabled\": \"true\"\n"
		+ "                        }\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-435.73 -467.727\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"array_size\",\n                    \"nodeType\": \"Core::Array::array_size\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"-863.669 -530.265\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"array_size1\",\n                    \"nodeType\": \"Core::Array::array_size\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-889.462 158.508\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"for_each_lines\",\n                    \"nodeType\": \"for_each_lines\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-454.137 -13.3945\"\n                        }\n                    ]\n                }\n            ],\n            \"connections\": [\n                {\n                    \"source\": \".posers\",\n                    \"target\": \"for_each_spheres.posers\"\n                },\n                {\n                    \"source\": \".posers\",\n                    \"target\": \"array_size.array\"\n                },\n                {\n                    \"source\": \"array_size.size\",\n                    \"target\": \"for_each_spheres.max_iterations\"\n                },\n                {\n                    \"source\": \".global_scale\",\n                    \"target\": \"for_each_spheres.global_radius\"\n                },\n                {\n                    \"source\": \".radius\",\n                    \"target\": \"for_each_spheres.radius\"\n"
		+ "                },\n                {\n                    \"source\": \".lines\",\n                    \"target\": \"array_size1.array\"\n                },\n                {\n                    \"source\": \".lines\",\n                    \"target\": \"for_each_lines.lines\"\n                },\n                {\n                    \"source\": \"array_size1.size\",\n                    \"target\": \"for_each_lines.max_iterations\"\n                },\n                {\n                    \"source\": \".width\",\n                    \"target\": \"for_each_lines.width\"\n                },\n                {\n                    \"source\": \".poser_color\",\n                    \"target\": \"for_each_spheres.color\"\n                }\n            ],\n            \"values\": [\n                {\n                    \"valueName\": \"for_each_spheres.max_iterations\",\n                    \"valueType\": \"long\",\n                    \"value\": \"0\"\n                },\n                {\n                    \"valueName\": \"for_each_spheres.global_radius\",\n                    \"valueType\": \"float\",\n"
		+ "                    \"value\": \"1f\"\n                },\n                {\n                    \"valueName\": \"for_each_spheres.radius\",\n                    \"valueType\": \"array<float>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"for_each_spheres.color\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"0f\",\n                        \"y\": \"1f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"for_each_lines.max_iterations\",\n                    \"valueType\": \"long\",\n                    \"value\": \"10\"\n                },\n                {\n                    \"valueName\": \"for_each_lines.lines\",\n                    \"valueType\": \"array<array<Math::float4x4>>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"for_each_lines.width\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0513599999f\"\n"
		+ "                }\n            ],\n            \"reservedNodeNames\": [\n                {\n                    \"name\": \"input\"\n                }\n            ]\n        }\n    ]\n}\n");
	setAttr -s 4 ".posers";
	setAttr -k on ".posers[0]";
	setAttr -k on ".posers[1]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 64.63433837890625 139.39503479003906 69.114952087402344 1;
	setAttr -k on ".posers[2]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 70.796012878417969 69.776649475097656 62.32794189453125 1;
	setAttr -k on ".posers[3]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 75.710792541503906 18.818241119384766 66.308158874511719 1;
	setAttr -k on ".posers";
	setAttr -k on ".global_scale";
	setAttr -s 7 -k on ".radius[1:6]"  1 1 1 1 1 1;
	setAttr -k on ".radius";
	setAttr -k on ".radius[0]";
	setAttr -s 4 ".lines[0].lines_A";
	setAttr -k on ".lines[0].lines_A[0]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 53.665699005126953 260.49209594726562 68.523757934570312 1;
	setAttr -k on ".lines[0].lines_A[1]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 64.63433837890625 139.39503479003906 69.114952087402344 1;
	setAttr -k on ".lines[0].lines_A[2]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 70.796012878417969 69.776649475097656 62.32794189453125 1;
	setAttr -k on ".lines[0].lines_A[3]" -type "matrix" 39.347908020019531 0 0 0 0 39.347908020019531 0 0
		 0 0 39.347908020019531 0 75.710792541503906 18.818241119384766 66.308158874511719 1;
	setAttr -k on ".lines[0].lines_A";
	setAttr -k on ".lines";
	setAttr -k on ".width" 0.10000000149011612;
	setAttr -k on ".poser_color" -type "float3" 0 1 0 ;
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
createNode transform -n "root_group" -p "controls";
	rename -uid "73C2A4AD-4CCD-CA3D-9682-EEAF0312A343";
createNode transform -n "root" -p "root_group";
	rename -uid "F26C6DA9-4748-7D8A-3D92-7ABE72C6C83B";
	addAttr -ci true -sn "internalName" -ln "internalName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ro" 3;
	setAttr -k on ".s";
	setAttr -l on ".internalName" -type "string" "root";
createNode nurbsCurve -n "rootShape" -p "root";
	rename -uid "61D0D67D-4C64-160B-F65D-9AA3E9F58A22";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 20;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.921799952071384 1.859225682820734e-16 -3.921799952071384
		5.5462626811335385 2.2395880029841052e-17 4.9120546013548636e-15
		3.921799952071384 -2.4305044437536419e-15 3.921799952071416
		2.320164919469746e-15 -2.1034510672491676e-15 5.5462626811335527
		-3.9217999520713942 1.859225682820734e-16 3.9217999520714173
		-5.5462626811335385 -3.0465749647462263e-16 8.4135249453492628e-15
		-3.921799952071384 2.6388228920655514e-15 -3.92179995207136
		-4.7289471659941976e-15 1.8211894508043995e-15 -5.5462626811335216
		3.921799952071384 1.859225682820734e-16 -3.921799952071384
		5.5462626811335385 2.2395880029841052e-17 4.9120546013548636e-15
		3.921799952071384 -2.4305044437536419e-15 3.921799952071416
		;
createNode joint -n "root_ctrJoint" -p "root";
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
createNode transform -n "system" -p "mod";
	rename -uid "E33BEB84-4823-1A88-CA87-4EADCFD8F828";
createNode transform -n "output" -p "mod";
	rename -uid "6F030D73-420A-1DA9-DB36-3AB8C9C07059";
createNode transform -n "outJoints" -p "output";
	rename -uid "C606F955-4361-424E-A57C-129E07CFCFD5";
createNode joint -n "root_outJoint" -p "outJoints";
	rename -uid "E7BBDE73-43F0-56F2-D706-6EBCB2CEEDD8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
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
	setAttr ".t" -type "double3" 9.1892205413276784 14.330114284150351 16.834586695118844 ;
	setAttr ".r" -type "double3" -39.000000000002025 27.200000000000024 -1.788000972870463e-15 ;
	setAttr ".rp" -type "double3" -6.9388939039072284e-18 1.1102230246251563e-16 2.2204460492503131e-16 ;
	setAttr ".rpt" -type "double3" -2.0710120022049341e-16 1.3723218949214615e-17 -2.394600998630024e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "FA06188C-40FD-4EF2-A7A8-2DBD9ED48E1A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 23.228576841340981;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "3DE8336C-402E-ED89-1A73-7CB6566A0C09";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.029661536709074898 11.399424121169664 -0.2203729731466364 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "C13A0A32-480E-FAB4-7DDB-61860D3B1DFF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 15.829103229946185;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "F8E080BB-4C63-C9FB-C0BB-C192650A2817";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.029661592439767404 0.47032002014478458 8.8978640957318689 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "6248469F-456A-6944-C2F4-05B8C7F589E8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.2481752880577295;
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
	rename -uid "54F25B2B-4D9C-12E0-A5FB-0D93747BC4D3";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "F8C4A8A3-48DF-F85D-C6EB-B0A7D208141C";
createNode displayLayer -n "defaultLayer";
	rename -uid "6684CFD7-4C9D-D20C-7922-43B1C9C96070";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "6C18F98E-4EED-2FBA-92B6-D1838559FC82";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "C8562179-48C0-C6E6-EC2D-C98541679724";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "4C5E7509-458B-154B-AD29-DE9121A23BC7";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 120 -ast 0 -aet 140 ";
	setAttr ".st" 6;
createNode objectSet -n "sets";
	rename -uid "C81ADCD3-4BF1-7A81-A8D9-B59FF0130DB8";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dnsm";
createNode objectSet -n "moduleControlSet";
	rename -uid "3C698155-41CE-4B09-5C32-868CCF93B68F";
	setAttr ".ihi" 0;
	setAttr ".an" -type "string" "gControlSet";
createNode decomposeMatrix -n "root_decomposeMatrix";
	rename -uid "0A52AEE4-40D1-DEF0-8BB4-DD854B606741";
createNode objectSet -n "outJointsSet";
	rename -uid "03B5856D-4344-0BD3-3744-BC888A14956F";
	setAttr ".ihi" 0;
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
	rename -uid "7B2D8A8F-4A92-0E3D-A1B8-AEA29584AA2D";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "8FA966E1-4A9E-4587-922D-0FA270B5A972";
createNode decomposeMatrix -n "root_poser_decomposeMatrix";
	rename -uid "BA1C7B19-435C-8DDD-2F57-B38B20EB0DB8";
createNode objectSet -n "controlJointsSet";
	rename -uid "0DD2C7D4-42D4-5B17-9A99-048670486878";
	setAttr ".ihi" 0;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "9C1C2D4F-4B38-2489-25E7-AF8F4F9821B0";
	setAttr -s 2 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -162.59392874871139 -1132.0138651235964 ;
	setAttr ".tgi[0].vh" -type "double2" 746.64974322668229 -213.52649592848999 ;
	setAttr -s 6 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 315.71429443359375;
	setAttr ".tgi[0].ni[0].y" -812.85711669921875;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 150.8514404296875;
	setAttr ".tgi[0].ni[1].y" -323.61053466796875;
	setAttr ".tgi[0].ni[1].nvs" 18305;
	setAttr ".tgi[0].ni[2].x" 340.92437744140625;
	setAttr ".tgi[0].ni[2].y" -652.85711669921875;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -151.93276977539062;
	setAttr ".tgi[0].ni[3].y" -538.1512451171875;
	setAttr ".tgi[0].ni[3].nvs" 18305;
	setAttr ".tgi[0].ni[4].x" 499.74789428710938;
	setAttr ".tgi[0].ni[4].y" -352.60504150390625;
	setAttr ".tgi[0].ni[4].nvs" 18305;
	setAttr ".tgi[0].ni[5].x" -333.18215942382812;
	setAttr ".tgi[0].ni[5].y" -283.27438354492188;
	setAttr ".tgi[0].ni[5].nvs" 18305;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -664.63726983444906 -443.98616930336618 ;
	setAttr ".tgi[1].vh" -type "double2" 788.23260556217326 1023.654102238693 ;
	setAttr -s 14 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" 214.28572082519531;
	setAttr ".tgi[1].ni[0].y" 385.71429443359375;
	setAttr ".tgi[1].ni[0].nvs" 18304;
	setAttr ".tgi[1].ni[1].x" -1582.93505859375;
	setAttr ".tgi[1].ni[1].y" 592.20416259765625;
	setAttr ".tgi[1].ni[1].nvs" 18305;
	setAttr ".tgi[1].ni[2].x" -1043.1009521484375;
	setAttr ".tgi[1].ni[2].y" 592.447998046875;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" -1337.9774169921875;
	setAttr ".tgi[1].ni[3].y" 102.02803802490234;
	setAttr ".tgi[1].ni[3].nvs" 18305;
	setAttr ".tgi[1].ni[4].x" -423.05221557617188;
	setAttr ".tgi[1].ni[4].y" 172.11067199707031;
	setAttr ".tgi[1].ni[4].nvs" 18305;
	setAttr ".tgi[1].ni[5].x" 828.5714111328125;
	setAttr ".tgi[1].ni[5].y" 428.57144165039062;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" -1338.225341796875;
	setAttr ".tgi[1].ni[6].y" 401.08242797851562;
	setAttr ".tgi[1].ni[6].nvs" 18305;
	setAttr ".tgi[1].ni[7].x" -787.82562255859375;
	setAttr ".tgi[1].ni[7].y" 152.17434692382812;
	setAttr ".tgi[1].ni[7].nvs" 18305;
	setAttr ".tgi[1].ni[8].x" 828.5714111328125;
	setAttr ".tgi[1].ni[8].y" -60;
	setAttr ".tgi[1].ni[8].nvs" 18304;
	setAttr ".tgi[1].ni[9].x" -76.528480529785156;
	setAttr ".tgi[1].ni[9].y" 238.41021728515625;
	setAttr ".tgi[1].ni[9].nvs" 18305;
	setAttr ".tgi[1].ni[10].x" 521.4285888671875;
	setAttr ".tgi[1].ni[10].y" 398.57144165039062;
	setAttr ".tgi[1].ni[10].nvs" 18304;
	setAttr ".tgi[1].ni[11].x" 828.5714111328125;
	setAttr ".tgi[1].ni[11].y" 70;
	setAttr ".tgi[1].ni[11].nvs" 18304;
	setAttr ".tgi[1].ni[12].x" -407.68408203125;
	setAttr ".tgi[1].ni[12].y" 331.940673828125;
	setAttr ".tgi[1].ni[12].nvs" 18304;
	setAttr ".tgi[1].ni[13].x" -723.47149658203125;
	setAttr ".tgi[1].ni[13].y" 545.110107421875;
	setAttr ".tgi[1].ni[13].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av ".unw";
	setAttr -k on ".etw";
	setAttr -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr ".etmr" no;
	setAttr ".tmr" 4096;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
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
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :initialShadingGroup;
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
	setAttr ".mcfr" 25;
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
	setAttr ".fs" 1;
	setAttr ".ef" 10;
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
	setAttr -av ".pa" 1;
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
	setAttr ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off ".eeaa";
	setAttr -k off ".engm";
	setAttr -k off ".mes";
	setAttr -k off ".emb";
	setAttr -av -k off ".mbbf";
	setAttr -k off ".mbs";
	setAttr -k off ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off ".twa";
	setAttr -k off ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr" 25;
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
connectAttr "mainPoser.sx" "mainPoser.sy" -l on;
connectAttr "mainPoser.sx" "mainPoser.sz" -l on;
connectAttr "root_poser.wm" "posers_bifrostGraphShape.posers[0]";
connectAttr "root_poser.radius" "posers_bifrostGraphShape.radius[0]";
connectAttr "root_poser_decomposeMatrix.osx" "posers_bifrostGraphShape.global_scale"
		;
connectAttr "root_poser.wm" "input.opm";
connectAttr "root_connector.wm" "root_group.opm";
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
connectAttr "outJointsSet.msg" "sets.dnsm" -na;
connectAttr "controlJointsSet.msg" "sets.dnsm" -na;
connectAttr "root.iog" "moduleControlSet.dsm" -na;
connectAttr "root_multMatrix.o" "root_decomposeMatrix.imat";
connectAttr "root_outJoint.iog" "outJointsSet.dsm" -na;
connectAttr "mod.mirror" "mirror_condition.ft";
connectAttr "mirror_composeMatrix.omat" "root_multMatrix.i[0]";
connectAttr "root_ctrJoint.wm" "root_multMatrix.i[1]";
connectAttr "outJoints.wim" "root_multMatrix.i[2]";
connectAttr "mirror_condition.ocr" "mirror_composeMatrix.isx";
connectAttr "root_ctrJoint.wm" "root_ctrJoint_decomposeMatrix.imat";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "mirror_condition_2.ft";
connectAttr "negate.o" "mirror_condition_2.cfr";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "mirror_condition_2.ctr";
connectAttr "root_ctrJoint_decomposeMatrix.osz" "negate.i1";
connectAttr "root_poser.wm" "root_poser_decomposeMatrix.imat";
connectAttr "root_ctrJoint.iog" "controlJointsSet.dsm" -na;
connectAttr "root_poserShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "root_poser_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "input.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "root_poser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "posers_bifrostGraphShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "mainPoser.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "root_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "root_ctrJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn";
connectAttr "negate.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn";
connectAttr "mod.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn";
connectAttr "outJoints.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn";
connectAttr "outJointsSet.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "root_ctrJoint_decomposeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "mirror_condition.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "output.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn";
connectAttr "root_multMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn";
connectAttr "root_outJoint.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn";
connectAttr "system.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn";
connectAttr "mirror_composeMatrix.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "mirror_condition_2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn"
		;
connectAttr "root_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_condition.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mirror_composeMatrix.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "root_ctrJoint_decomposeMatrix.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "mirror_condition_2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "negate.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "posers_bifrostGraphShape.iog" ":initialShadingGroup.dsm" -na;
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=NodeProfileStruct:string=NodeProfileTag:int32=NodeProfileTagColor";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
// End of point.ma
