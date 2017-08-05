class CfgFactions {
    class authority {
        id = 0;
        forumGroups[] = {27, 14, 28, 9, 26, 15};
        displayName = "Polizei";
        enableGlobalPhone = 1;
        title = "Beamter";
        description = "";
        respawn[] = {"authority_1_respawn", "authority_2_respawn"}; //or array - selects the nearest
        color[] = {0, (56/255), (120/255), 1};
		init = "factions\authority\init.sqf";
        respawnInit = "factions\authority\respawnInit.sqf";
        globalVehicleLock = 1;
        havePDA = 1;
        nameVisible = 1; //0 = no name without "pcard-showed" visible, 1 = firstname without "pcard-showed" visible, 2 = fullname without "pcard-showed" visible
        selectablePermissions[] = {
            "pda.open",
            "pda.search.*",
            "pda.strafakte.read",
            "pda.strafakte.write",
            "pda.ermittlungen.read",
            "pda.ermittlungen.write",
            "pda.ermittlungen.remove",
            "pda.zeugnis.read",
            "punishments.custody.set",
            "punishments.custody.edit",
            "punishments.custody.remove"
        };
        defaultVehicles[] = {
            {"C_Boat_Civil_01_police_F",""},
            {"EC635_Unarmed",""},
            {"EC635",""},
            {"B_Heli_Transport_01_F",""},
            {"B_Heli_Light_01_F",""},
            {"Urbanized_67Mustang_P",""},
            {"Urbanized_LP700_P",""},
            {"Urbanized_CTSV_UC1",""},
            {"77FuryShr",""},
            {"77FuryCop",""},
            {"dbo_CIV_new_bike",""},
            {"Jonzie_Highway",""},
            {"RDS_Lada_Civ_05",""},
            {"Urbanized_G65_UC1",""},
            {"B_GEN_Offroad_01_gen_F",""},
            {"Urbanized_67Mustang_UC3",""},
            {"Urbanized_67Mustang_UC2",""},
            {"ivory_rs4_marked",""},
            {"ivory_rs4_unmarked",""},
            {"ivory_m3_marked",""},
            {"ivory_m3_unmarked",""},
            {"ivory_suburban_marked",""},
            {"ivory_suburban_unmarked",""},
            {"ivory_isf_marked",""},
            {"ivory_isf_unmarked",""},
            {"ivory_evox_marked",""},
            {"ivory_evox_unmarked",""},
            {"ivory_wrx_marked",""},
            {"ivory_wrx_unmarked",""},
            {"B_LSV_01_unarmed_black_F",""},
            {"burnes_foxhound_w",""},
            {"AMG_TahoePolice",""},
            {"FaisalAlYahya_CVPI_police",""},
            {"Faisal_Youkun2015_PD",""}

        };
        defaultEquipment[] = {
            {"hgun_P07_F",""},
            {"16Rnd_9x21_green_Mag",""},
            {"hlc_smg_mp5a4",""},
            {"hlc_30Rnd_9x19_GD_MP5",""},
            {"prpl_benelli_rail",""},
            {"prpl_8Rnd_12Gauge_Slug",""},
            {"prpl_8Rnd_12Gauge_Pellets",""},
            {"hlc_rifle_G36KA1KSK",""},
            {"HLC_Rifle_G36KSKAG36",""},
            {"hlc_30rnd_556x45_TDIM_G36",""},
            {"hlc_100rnd_556x45_EPR_G36",""},
            {"hlc_rifle_G36KMLIC",""},
            {"hlc_rifle_G36MLIAG36",""},
            {"30Rnd_65x39_caseless_mag",""},
            {"100Rnd_65x39_caseless_mag",""},
            {"UGL_FlareGreen_F",""},
            {"1Rnd_SmokeGreen_Grenade_shell",""},
            {"hlc_rifle_g3sg1ris",""},
            {"hlc_20rnd_762x51_IRDim_G3",""},
            {"hlc_rifle_FAL5000Rail",""},
            {"hlc_20Rnd_762x51_TDim_fal",""},
            {"srifle_GM6_F",""},
            {"5Rnd_127x108_APDS_Mag",""},
            {"launch_RPG32_ghex_F",""},
            {"RPG32_F",""},
            {"NVGoggles_OPFOR",""},
            {"Rangefinder",""},
            {"ToolKit",""},
            {"SmokeShellGreen",""},
            {"ACE_quikclot",""},
            {"ACE_morphine",""},
            {"G_Balaclava_TI_blk_F",""},
            {"G_Tactical_Clear",""},
            {"G_Tactical_Black",""},
            {"G_Spectacles_Tinted",""},
            {"G_Squares_Tinted",""},
            {"G_Sport_Blackred",""},
            {"G_Aviator",""},
            {"tf_anprc152",""},
            {"tf_anarc210","#transparent"},
            {"HAP_FAT_dea",""},
            {"HAP_BTN_hp1",""},
            {"U_B_GEN_Soldier_F",""},
            {"U_B_GEN_Commander_F",""},
            {"U_Rangemaster",""},
            {"H_Watchcap_khk",""},
            {"H_Watchcap_blk",""},
            {"H_Watchcap_cbr",""},
            {"H_Helmet_Skate",""},
            {"H_MilCap_blue",""},
            {"H_Beret_gen_F",""},
            {"H_PilotHelmetHeli_B",""},
            {"H_Cap_police",""},
            {"H_HelmetB_light_black",""},
            {"rds_police_cap",""},
            {"H_HelmetB_black",""},
            {"H_Beret_02",""},
            {"H_Beret_Colonel",""},
            {"H_Beret_blk",""},
            {"H_Watchcap_sgg",""},
            {"V_TacVest_blk_POLICE",""},
            {"HAP_press_vest_swat",""},
            {"G_B_Diving",""},
            {"U_B_Wetsuit",""},
            {"ItemGPS",""},
            {"optic_Aco_smg",""},
            {"optic_Holosight_blk_F",""},
            {"optic_Hamr",""},
            {"optic_Arco_blk_F",""},
            {"optic_ERCO_blk_F",""},
            {"optic_SOS",""},
            {"optic_KHS_blk",""},
            {"V_RebreatherB",""},
            {"lilci_bebsi_F", ""},
            {"lilci_bonsterMenergy_F", ""},
            {"lilci_tacticalBacon_F", ""},
            {"lilci_foodCan_F", ""},
            {"ACE_CableTie", ""},
            {"H_PilotHelmetHeli_B_white", ""},
            {"CSW_Taser_Probe_Mag", ""},
            {"CSW_M26C", ""},
            {"CSW_FN57", ""},
            {"CSW_FN57_flashlight_glare_1", ""},
            {"optic_Yorris", ""},
            {"CSW_20Rnd_57x28_SS190", ""},
            {"CSW_FN57_Ballistic_Shield", ""},
            {"CSW_FN57_Shield_P", ""},
            {"CPE_SWAT_Uniform_1", ""},
            {"CPE_SWAT_Uniform_2", ""},
            {"CPE_SWAT_FAST_2", ""},
            {"CPE_MK50", ""},
            {"SAN_Headlamp_v1", ""},
            {"CPE_SWAT_Vest_1", ""},
            {"CPE_SWAT_Vest_2", ""},
            {"CPE_SWAT_Vest_3", ""},
            {"CPE_SWAT_Vest_2", ""},
            {"CPE_SWAT_AssaultPack_6", ""},
            {"NVGoggles_OPFOR", ""},
            {"acc_flashlight", ""},
            {"optic_AMS", ""},
            {"bipod_01_F_blk", ""},
            {"optic_LRPS", ""},
            {"ItemCompass", ""},
            {"ItemMap", ""}
  
        };
        garages[] = {"myAuthorityGarage"};
        garage_useCivilCars = 0;
        haveInterface = 1;
        globalGroup = 1;
        markers = 1; //faction map markers: 0 - nobody; 1 - everybody; 2 - only leader
        markerColorUnit = "colorBlue"; // default - "colorBLUFOR"
        markerTypeUnit = "mil_triangle"; // default - "mil_triangle"
        markerColorGroup = "colorBlue"; // default - "colorBLUFOR"
        markerTypeGroup = "mil_dot"; // default - "mil_dot"
        markerColorGroupUnit = "colorBLUFOR";
        markerTypeGroupUnit = "mil_triangle";
        defaultPaycheck = 200;
        paychecks[] = {
            200, //0
            220, //1
            240, //2
            280, //3
            300, //4
            320, //5
            350, //6
            370, //7
            400, //8
            450 //9
        };
        plate_special = "P";
        plate_region = "T";
    };

    class lawyers {
        id = 1;
        displayName = "Juristen";
        punishments_canSetPunishment = true;
        forumGroups[] = {18, 17, 24};
        selectablePermissions[] = {
            "strafakte.read",
            "strafakte.write",
            "strafakte.remove",
            "vollstreckungsheft.read",
            "vollstreckungsheft.remove",
            "ermittlungen.read",
            "ermittlungen.write",
            "gerichtsakte.read",
            "gerichtsakte.write",
            "gerichtsakte.remove",
            "zeugnis.read",
            "zeugnis.write",
            "zeugnis.remove"
        };
        garage_useCivilCars = 1;
        title = "Jurist";
        description = "";
        havePDA = 1;
        respawn = "hospital";
        color[] = {(214/255), 0, (139/255), 1};
        init = "";
        haveInterface = 1;
        defaultPaycheck = 100;
        plate_special = "";
        plate_region = "";
    };

    class ambulance {
        id = 2;
        forumGroups[] = {11, 25, 10, 29};
        title = "Ambulanz";
        enableGlobalPhone = 1;
        displayName = "Sanitäter";
        description = "";
        respawn[] = {"hospital_1_respawn"};
        color[] = {(232/255), (23/255), 0, 1};
        init = "";
        nameVisible = 1; //0 = no name without "pcard-showed" visible, 1 = firstname without "pcard-showed" visible, 2 = fullname without "pcard-showed" visible
        globalVehicleLock = 1;
        canRevive = 1;
        canStabilize = 1;
        reviveLocations[] = {
            {{5690.54, 10635.3, 9.49}, 5} //{<positionASL>, <radius>}
        };
        garage_useCivilCars = 0;
        haveInterface = 1;
        havePDA = 1;
        defaultPaycheck = 300;
        defaultVehicles[] = {
            {"C_Boat_Civil_01_rescue_F", ""},
            {"C_Rubberboat", ""},
            {"sab_piper6", ""},
            {"C_Heli_Light_01_civil_F", ""},
            {"I_Heli_Transport_02_F", ""},
            {"O_Heli_Light_02_unarmed_F", ""},
            {"O_Heli_Transport_04_medevac_F", ""},
            {"Jonzie_Ambulance", ""},
            {"C_Offroad_02_unarmed_F", ""},
            {"C_Quadbike_01_F", ""},
            {"ivory_gti", ""},
            {"Jonzie_Raptor", ""},
            {"ivory_suburban_ems", ""},
            {"Urbanized_67Mustang_EMS", ""},
            {"sab_stampe3", ""},
            {"EC635_SAR", ""}
        };
        defaultEquipment[] = {
            {"rds_doctor", ""},
            {"rds_uniform_assistant", ""},
            {"V_HarnessOGL_gry", ""},
            {"H_PilotHelmetHeli_B", ""},
            {"H_Cap_marshal", ""},
            {"H_MilCap_gry", ""},
            {"H_Cap_red", ""},
            {"H_Helmet_Skate", ""},
            {"NVGoggles_OPFOR", ""},
            {"ACE_plasmaIV", ""},
            {"ACE_plasmaIV_500", ""},
            {"ACE_plasmaIV_250", ""},
            {"ACE_personalAidKit", ""},
            {"ACE_surgicalKit", ""},
            {"ACE_EarPlugs", ""},
            {"ACE_packingBandage", ""},
            {"ACE_bodyBag", ""},
            {"ACE_epinephrine", ""},
            {"rds_car_FirstAidKit", ""},
            {"ACE_bloodIV", ""},
            {"ACE_bloodIV_250", ""},
            {"ACE_bloodIV_500", ""},
            {"ACE_fieldDressing", ""},
            {"ACE_elasticBandage", ""},
            {"ACE_Banana", ""},
            {"ACE_atropine", ""},
            {"ACE_adenosine", ""},
            {"lilci_cervicalCollar_F", ""},
            {"U_U_C_Scientist_ambulance1", ""},
            {"U_U_Marshal_ambulance1", ""},
            {"U_U_Marshal_ambulance2", ""},
            {"U_U_Marshal_ambulance3", ""},
            {"U_U_Marshal_ambulance4", ""},
            {"U_U_Marshal_ambulance5", ""},
            {"B_B_Kitbag_rgr_ambulance_1", ""},
            {"H_PilotHelmetHeli_B_white", ""},
            {"lilci_bebsi_F", ""},
            {"lilci_bonsterMenergy_F", ""},
            {"lilci_tacticalBacon_F", ""},
            {"lilci_foodCan_F", ""}
        };
        paychecks[] = {
            200, //0
            220, //1
            260, //2
            300, //3
            400 //4
        };
        applicableLicenses[] = {
            "lilcvi_medicalDisabilityLicense_F" //gibt permissions dazu: lilcvi_medicalDisabilityLicense_F.add, lilcvi_medicalDisabilityLicense_F.remove
        };
        plate_special = "M";
        plate_region = "T";
    };

    class advocate {
        id = 3;
        displayName = "Anwälte";
        forumGroups[] = {16};
        title = "Anwalt";
        description = "Die Gruppe der ausgebildeten privat-Anwälte.";
        respawn = "advocate";
        color = "";
        init = "";
        garage_useCivilCars = 1;
        haveInterface = 0;
        globalGroup = 0;
        defaultPaycheck = 100;
        applicableLicenses[] = {};
        plate_special = "";
        plate_region = "";
    };

    class prisonCrew {
        id = 4;
        displayName = "Justizvollzug";
        forumGroups[] = {14, 27};
        title = "Justizvollzugsbeamter";
        description = "Hier werden wohl Gefangene geknechtet^^.";
        nameVisible = 1; //0 = no name without "pcard-showed" visible, 1 = firstname without "pcard-showed" visible, 2 = fullname without "pcard-showed" visible
        globalVehicleLock = 1;
        garage_useCivilCars = 0;
        respawn = "prisonCrew";
        havePDA = 1;
        color = "";
        init = "";
        haveInterface = 1;
        globalGroup = 1;
        defaultPaycheck = 250;
        paychecks[] = {
            250, //0
            400 //1
        };
        applicableLicenses[] = {};
        plate_special = "P";
        plate_region = "T";
    };

    class IHK {
        id = 5;
        forumGroups[] = {};
        enableGlobalPhone = 1;
        displayName = "Industrie- und Handelskammer";
        title = "IHK-Mitarbeiter";
        description = "Hier werden Lizenzen der Industrie und Handelskammer Tanoas ausgegeben.";
        globalVehicleLock = 1;
        respawn = "IHK";
        color = "";
        init = "";
        haveInterface = 1;
        havePDA = 1;
        globalGroup = 1;
        defaultPaycheck = 250;
        garage_useCivilCars = 1;
        paychecks[] = {
            250, //0
            400 //1
        };
        applicableLicenses[] = {
            "lilcvi_drivingLicenseB_F",
            "lilcvi_drivingLicenseC1_F",
            "lilcvi_drivingLicenseC_F",
            "lilcvi_drivingLicenseCE_F",
            "lilcvi_drivingLicenseD",
            "lilcvi_boatLicense_F",
            "lilcvi_dangerousGoodsLicense_F"
        };
        plate_special = "";
        plate_region = "";
    };

    class journalist {
        id = 6;
        forumGroups[] = {43};
        title = "Reporter";
        displayName = "Journalisten";
        description = "Journalisten sollten eigentlich immer Objektiv geschehnissen berichten.";
        respawn = "journalist";
        color = "";
        init = "";
        garage_useCivilCars = 1;
        haveInterface = 0;
        globalGroup = 1;
        defaultPaycheck = 250;
        plate_special = "";
        plate_region = "";
    };

    class tester {
        id = 7;
        displayName = "Tester";
        forumGroups[] = {46};
        title = "Tester";
        description = "Testaccount";
        respawn = "hospital";
        globalVehicleLock = 1;
        color = "";
        init = "";
        garage_useCivilCars = 0;
        haveInterface = 0;
        globalGroup = 1;
        plate_special = "XX";
        plate_region = "T";
    };

    class admin {
        id = 8;
        nameVisible = 2;
        forumGroups[] = {22, 39, 21};
        displayName = "Techniker";
        enableGlobalPhone = 1;
        title = "Techniker";
        description = "";
        respawn = "hospital";
        color = "";
        havePDA = 1;
        init = "";
        garage_useCivilCars = 0; //0=just use the vehicles from this id, 1=use vehicles from civ id, 2=use both ids, 3=use all cars from every account id
        haveInterface = 0;
        globalGroup = 1;
        plate_special = "XX";
        plate_region = "T";
    };

    class atcControl {
        id = 9;
        forumGroups[] = {50, 51};
        globalVehicleLock = 1;
        displayName = "Flugüberwachung";
        nameVisible = 1; //0 = no name without "pcard-showed" visible, 1 = firstname without "pcard-showed" visible, 2 = fullname without "pcard-showed" visible
        title = "Flugüberwachung";
        description = "";
        respawn[] = {"atcControl_respawn"};
        color = "";
        init = "";
        havePDA = 1;
        defaultVehicles[] = {
            {"sab_C130_JT", ""},
            {"JS_JC_FA18E", ""},
            {"JS_JC_FA18F", ""},
            {"B_T_VTOL_01_vehicle_F",""},
            {"C_Heli_Light_01_civil_F",""},
            {"C_Offroad_01_repair_F",""},
            {"C_Plane_Civil_01_F",""},
            {"EC635_Unarmed",""},
            {"I_Heli_light_03_unarmed_F",""},
            {"I_Heli_Transport_02_F",""},
            {"Jonzie_Escalade",""},
            {"Jonzie_Tanker_Truck",""},
            {"O_G_Van_01_fuel_F",""},
            {"O_Heli_Light_02_unarmed_F",""},
            {"O_Heli_Transport_04_fuel_black_F",""},
            {"O_T_VTOL_02_vehicle_grey_F",""},
            {"O_UAV_02_F",""},
            {"sab_737_14",""},
            {"Sab_737_9",""},
            {"sab_aeroc",""},
            {"sab_aircrane_2",""},
            {"sab_C130_FP",""},
            {"sab_C130_H",""},
            {"sab_grob115",""},
            {"sab_katana",""},
            {"sab_RobinDR400",""},
            {"sab_tow_ugv_b",""},
            {"B_Plane_Fighter_01_F", ""}
        };
        defaultEquipment[] = {
            {"B_UavTerminal",""},
            {"Binocular",""},
            {"bv_FlashLight",""},
            {"G_Aviator",""},
            {"G_Balaclava_TI_G_blk_F",""},
            {"ItemGPS",""},
            {"H_Beret_02",""},
            {"H_Beret_Colonel",""},
            {"H_Cap_marshal",""},
            {"H_MilCap_gry",""},
            {"H_MilCap_gry",""},
            {"H_PilotHelmetFighter_B",""},
            {"HAP_BTN_pld_red1",""},
            {"HAP_TEE_yellowNgrn",""},
            {"ItemMap",""},
            {"NVGoggles_OPFOR",""},
            {"O_UavTerminal",""},
            {"sab_wwii_blue_pilot_cloth",""},
            {"sab_wwii_green_pilot_cloth",""},
            {"sab_wwii_red_pilot_cloth",""},
            {"sab_wwiplanes_ger_cap",""},
            {"U_B_HeliPilotCoveralls",""},
            {"U_C_Scientist",""},
            {"U_C_WorkerCoveralls",""},
            {"U_B_CTRG_Soldier_3_F", ""},
            {"V_TacVest_oli", ""},
            {"H_PilotHelmetHeli_B", ""},
            {"ItemCompass", ""},
            {"ItemMap", ""},
            {"NVGoggles", ""},
            {"U_B_CTRG_Soldier_2_F", ""},
            {"ACE_fieldDressing", ""},
            {"ACE_morphine", ""},
            {"V_BandollierB_oli", ""},
            {"B_AssaultPack_rgr", ""},
            {"H_Cap_marshal", ""},
            {"U_B_PilotCoveralls", ""},
            {"B_Parachute", ""},
            {"H_PilotHelmetFighter_B", ""},
            {"TFAR_anarc210", "#transparent"},
            {"TFAR_anprc152", ""},
            {"G_Tactical_Clear", ""},
            {"G_Tactical_Black", ""},
            {"G_Squares_Tinted", ""},
            {"G_Sport_Blackred", ""},
            {"H_Cap_headphones", ""},
            {"H_HelmetCrew_I", ""},
            {"lilci_bebsi_F", ""},
            {"lilci_bonsterMenergy_F", ""},
            {"lilci_tacticalBacon_F", ""},
            {"lilci_foodCan_F", ""}
        };
        haveInterface = 1;
        globalGroup = 1;
        garage_useCivilCars = 0;
        applicableLicenses[] = {
            "lilcvi_flightLicenseCPLA_F",
            "lilcvi_flightLicenseATPLA_F",
            "lilcvi_flightLicenseIRA_F",
            "lilcvi_flightLicenseIFR_F",
            "lilcvi_flightLicensePPLH_F",
            "lilcvi_flightLicenseCPLH_F",
            "lilcvi_outbackLandingLicense_F",
            "lilcvi_waterFlightLicense_F",
            "lilcvi_flightRadioLicense_F",
            "lilcvi_nightFlightLicense_F",
            "lilcvi_verticalStartFlightLicense_F",
            "lilcvi_flightDropLicense_F",
            "lilcvi_flightSchoolLicense_F"
        };
        plate_special = "X";
        plate_region = "T";
    };

    class order {
        id = 10;
        forumGroups[] = {28, 9};
        nameVisible = 1; //0 = no name without "pcard-showed" visible, 1 = firstname without "pcard-showed" visible, 2 = fullname without "pcard-showed" visible
        title = "Ordnungsbeamter";
        description = "";
        respawn = "order";
        color[] = {0, (56/255), (120/255), 1};
		init = "";
        enableGlobalPhone = 1;
        displayName = "Ordnungsamt";
        //garages[] = {"myAuthorityGarage"};
        haveInterface = 1;
        globalGroup = 1;
        defaultPaycheck = 200;
        paychecks[] = {
            200, //0
            220, //1
            240, //2
            280, //3
            300, //4
            320, //5
            350, //6
            370, //7
            400, //8
            450 //9
        };
        applicableLicenses[] = {
            "lilcvi_commercialClothing_F",
            "lilcvi_smallWeaponsLicense_F",
            "lilcvi_middleWeaponsLicense_F",
            "lilcvi_medicalCard_F",
            "lilcvi_fishingLicense_F",
            "lilcvi_specialParkingLicense_F",
            "lilcvi_heavyWeaponsLicense_F"
        };
        plate_special = "";
        plate_region = "";
    };
};
