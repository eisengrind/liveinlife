/*
playerInformation = {
    0 -> accountid,
    1 -> cash,
    2 -> bankmoney,
    hunger,
    thirst,
    endurancePoints,
    enduranceLevel
}
*/

// PLAYER BLAH BLAH
lilc_player_ID = -1;
lilc_player_steam64ID = "";
lilc_player_cash = 0;
lilc_player_hunger = 0;
lilc_player_thirst = 0;
lilc_player_endurance = 0;
lilc_player_realGear = [];
lilc_player_virtualGear = [];
lilc_player_jobs = [];
lilc_player_lastPosition = [];
lilc_player_isNew = 0;
lilc_player_gender = -1;
lilc_player_faction = [-1, ""];
lilc_player_corpse = ObjNull;
lilc_player_charisma = 0;
lilc_player_charismaMaximum = 100;
lilc_player_npcs = [];

lilc_player_tagsIndex = "";
lilc_player_enduranceMaximum = 100;
lilc_player_respawnName = "";
lilc_player_earPlugsStatus = false;

(group player) setVariable ["lilc_factionID", -1, true];

lilc_player_currentDeaths = 0;
lilc_player_defaultRespawnTimeout = 120;
lilc_player_statsEnabled = false;
lilc_player_isRespawning = false;
lilc_player_tmpWeapon = "";

lilc_playersHided = false;

// ACCOUNT things
lilc_account_loginCamera = ObjNull;
lilc_account_isRequesting = false;
lilc_account_requestError = -1;
lilc_account_isFinished = false;
lilc_account_escapeEventHandler = -1;
lilc_accountInformation = nil;

lilc_player_statsTimeout = 10;

// Actions
lilc_action_active = false;
lilc_action_interrupted = false;
lilc_action_animDone = false;

// JOBS things
lilc_action_isActive = "";
lilc_action_timeout = -1;
lilc_action_finished = false;
lilc_action_lastPosition = [];
lilc_action_gatheredPalms = [];

// SETTINGS
lilc_setting_tagsEnabled = true;
lilc_setting_viewDistance = 4000;

// SITTING
lilc_action_isSitting = "";
lilc_action_actionIndex = -1;
lilc_action_lastPosition = [];
lilc_action_availableChairs = [];

// SHOPS
lilc_shop_items_amount = -1;
lilc_shop_items_currentShop = "";
lilc_shop_sell_amount = -1;
lilc_shop_sell_currentShop = "";

lilc_shop_vehicles_escapeEventHandler = -1;
lilc_shop_vehicles_currentShop = "";
lilc_shop_vehicles_camera = ObjNull;
lilc_shop_vehicles_vehicleIndex = -1;
lilc_shop_vehicles_vehicleClassname = "";

// GARAGE
lilc_garage_currentStaticPosition = "";

//JOBS
//lilc_job_isActive = false;

//Faction's Interface
lilc_groupInterface_state_temporaryInfo = nil;
lilc_crafting_currentType = "";
lilc_crafting_currentAmount = 0;

//placement / housing system
lilc_placement_active = false;
lilc_placement_inHouse = false;
lilc_placement_finished = false;
lilc_placement_objectMoving = false;
lilc_placement_displacement = 0;
lilc_placement_object = ObjNull;
lilc_placement_origin = [0,0,0];

//housing
lilc_housing_houses = ["Land_Hotel_02_F", "Land_House_Small_02_F", "Land_Shed_02_F", "Land_Shed_05_F", "Land_Shed_07_F", "Land_Slum_02_F", "Land_Addon_04_F", "Land_School_01_F", "Land_House_Big_02_F", "Land_House_Small_01_F", "Land_House_Small_05_F", "Land_House_Small_03_F", "Land_Slum_03_F", "Land_House_Small_04_F", "Land_House_Small_06_F", "Land_Shed_01_F", "Land_Shed_04_F", "Land_House_Big_04_F", "Land_GarageShelter_01_F", "Land_Slum_01_F", "Land_House_Big_01_F"];
lilc_housing_active = false;

lilc_flight_waitingForPlayers = nil;
lilc_flight_inTriggerArea = false;
lilc_flight_sleeping = false;

factionRanks = [];

lilc_virtualInventory_inventory = [];
