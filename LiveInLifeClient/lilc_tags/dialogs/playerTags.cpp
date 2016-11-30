
//reserved space 1054 - 1200

class lilc_playerTags {
    name = "lilc_playerTags";
	idd = 1054;
	duration = 999999999999999999999999999;
	movingEnable = false;
    fadein = 1;
    fadeout = 1;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_playerTags', (_this select 0)];";
	objects[] = {};
    
    class controls {
        class RscStructuredPlayerTag
		{
			idc = -1;
			type = 13;
			style = 0;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			font = "RobotoCondensed";
			text = "";
			size = 0.04;
			shadow = 1.5;
			w = 0; h = 0;
			x = 0.1; y = 0.1;
		};

        class rl_slot_1 : RscStructuredPlayerTag { idc = 1055; }; 
        class rl_slot_2 : RscStructuredPlayerTag { idc = 1056; }; 
        class rl_slot_3 : RscStructuredPlayerTag { idc = 1057; }; 
        class rl_slot_4 : RscStructuredPlayerTag { idc = 1058; }; 
        class rl_slot_5 : RscStructuredPlayerTag { idc = 1059; }; 
        class rl_slot_6 : RscStructuredPlayerTag { idc = 1060; }; 
        class rl_slot_7 : RscStructuredPlayerTag { idc = 1061; }; 
        class rl_slot_8 : RscStructuredPlayerTag { idc = 1062; }; 
        class rl_slot_9 : RscStructuredPlayerTag { idc = 1063; }; 
        class rl_slot_10 : RscStructuredPlayerTag { idc = 1064; }; 
        class rl_slot_11 : RscStructuredPlayerTag { idc = 1065; }; 
        class rl_slot_12 : RscStructuredPlayerTag { idc = 1066; }; 
        class rl_slot_13 : RscStructuredPlayerTag { idc = 1067; }; 
        class rl_slot_14 : RscStructuredPlayerTag { idc = 1068; }; 
        class rl_slot_15 : RscStructuredPlayerTag { idc = 1069; }; 
        class rl_slot_16 : RscStructuredPlayerTag { idc = 1070; }; 
        class rl_slot_17 : RscStructuredPlayerTag { idc = 1071; }; 
        class rl_slot_18 : RscStructuredPlayerTag { idc = 1072; }; 
        class rl_slot_19 : RscStructuredPlayerTag { idc = 1073; }; 
        class rl_slot_20 : RscStructuredPlayerTag { idc = 1074; }; 
        class rl_slot_21 : RscStructuredPlayerTag { idc = 1075; }; 
        class rl_slot_22 : RscStructuredPlayerTag { idc = 1076; }; 
        class rl_slot_23 : RscStructuredPlayerTag { idc = 1077; }; 
        class rl_slot_24 : RscStructuredPlayerTag { idc = 1078; }; 
        class rl_slot_25 : RscStructuredPlayerTag { idc = 1079; }; 
        class rl_slot_26 : RscStructuredPlayerTag { idc = 1080; }; 
        class rl_slot_27 : RscStructuredPlayerTag { idc = 1081; }; 
        class rl_slot_28 : RscStructuredPlayerTag { idc = 1082; }; 
        class rl_slot_29 : RscStructuredPlayerTag { idc = 1083; }; 
        class rl_slot_30 : RscStructuredPlayerTag { idc = 1084; }; 
        class rl_slot_31 : RscStructuredPlayerTag { idc = 1085; }; 
        class rl_slot_32 : RscStructuredPlayerTag { idc = 1086; }; 
        class rl_slot_33 : RscStructuredPlayerTag { idc = 1087; }; 
        class rl_slot_34 : RscStructuredPlayerTag { idc = 1088; }; 
        class rl_slot_35 : RscStructuredPlayerTag { idc = 1089; }; 
        class rl_slot_36 : RscStructuredPlayerTag { idc = 1090; }; 
        class rl_slot_37 : RscStructuredPlayerTag { idc = 1091; }; 
        class rl_slot_38 : RscStructuredPlayerTag { idc = 1092; }; 
        class rl_slot_39 : RscStructuredPlayerTag { idc = 1093; }; 
        class rl_slot_40 : RscStructuredPlayerTag { idc = 1094; }; 
        class rl_slot_41 : RscStructuredPlayerTag { idc = 1095; }; 
        class rl_slot_42 : RscStructuredPlayerTag { idc = 1096; }; 
        class rl_slot_43 : RscStructuredPlayerTag { idc = 1097; }; 
        class rl_slot_44 : RscStructuredPlayerTag { idc = 1098; }; 
        class rl_slot_45 : RscStructuredPlayerTag { idc = 1099; }; 
        class rl_slot_46 : RscStructuredPlayerTag { idc = 1100; }; 
        class rl_slot_47 : RscStructuredPlayerTag { idc = 1101; }; 
        class rl_slot_48 : RscStructuredPlayerTag { idc = 1102; }; 
        class rl_slot_49 : RscStructuredPlayerTag { idc = 1103; }; 
        class rl_slot_50 : RscStructuredPlayerTag { idc = 1104; }; 
        class rl_slot_51 : RscStructuredPlayerTag { idc = 1105; }; 
        class rl_slot_52 : RscStructuredPlayerTag { idc = 1106; }; 
        class rl_slot_53 : RscStructuredPlayerTag { idc = 1107; }; 
        class rl_slot_54 : RscStructuredPlayerTag { idc = 1108; }; 
        class rl_slot_55 : RscStructuredPlayerTag { idc = 1109; }; 
        class rl_slot_56 : RscStructuredPlayerTag { idc = 1110; }; 
        class rl_slot_57 : RscStructuredPlayerTag { idc = 1111; }; 
        class rl_slot_58 : RscStructuredPlayerTag { idc = 1112; }; 
        class rl_slot_59 : RscStructuredPlayerTag { idc = 1113; }; 
        class rl_slot_60 : RscStructuredPlayerTag { idc = 1114; }; 
        class rl_slot_61 : RscStructuredPlayerTag { idc = 1115; }; 
        class rl_slot_62 : RscStructuredPlayerTag { idc = 1116; }; 
        class rl_slot_63 : RscStructuredPlayerTag { idc = 1117; }; 
        class rl_slot_64 : RscStructuredPlayerTag { idc = 1118; }; 
    };
};

//reserved space 1054 - 1200
