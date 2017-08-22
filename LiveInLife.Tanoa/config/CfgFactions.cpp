class CfgFactions {
    class authority {
        id = 0;
        respawn_type = 0; // 0: respawn in remotest base; 1: respawn in nearby base; 2: spawn at last position; 3: spawn at defined base (default it is respawn[0])
        displayName = "Polizei";
        enableGlobalPhone = 1;
        title = "Beamter";
        description = "";
        respawn[] = {"authority_1_respawn"}; //or array - selects the nearest
        color[] = {0, (56/255), (120/255), 1};
		init = "factions\authority\init.sqf";
        respawnInit = "factions\authority\respawnInit.sqf";
        prison_canRelease = 1;
        globalVehicleLock = 1;
        havePDA = 1;
        nameVisible = 1; //0 = no name without "pcard-showed" visible, 1 = firstname without "pcard-showed" visible, 2 = fullname without "pcard-showed" visible
        selectablePermissions[] = {
            /*"pda.open",
            "pda.search.*",
            "pda.strafakte.read",
            "pda.strafakte.write",
            "pda.ermittlungen.read",
            "pda.ermittlungen.write",
            "pda.ermittlungen.remove",
            "pda.zeugnis.read",*/
            "punishments.custody.set",
            "punishments.custody.edit",
            "punishments.custody.remove"
        };
        defaultVehicles[] = {
            {"C_Boat_Civil_01_police_F",""}

        };
        defaultEquipment[] = {
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
};
