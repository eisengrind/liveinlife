/*
_classname = (["rds_uniform_Woodlander4","rds_uniform_Worker1","rds_uniform_Worker4","rds_uniform_Worker3","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_4_F","rds_uniform_Woodlander3","rds_uniform_Woodlander2","rds_uniform_Woodlander1"] call BIS_fnc_selectRandom);
player forceAddUniform _classname;

lilc_flight_inTriggerArea = false;
_trigger = createTrigger ["EmptyDetector", [6947.12,7409.36,0]];
_trigger setTriggerArea [200, 100, 260.238, true, -1];
_trigger setTriggerActivation ["CIV", "PRESENT", false];
_trigger setTriggerStatements ["true", "lilc_flight_inTriggerArea = true;", ""];

lilc_flight_sleeping = true;
[] spawn {
    0 fadeSound 0;
    200 cutText ["", "BLACK", 0.01];

    while {lilc_flight_sleeping} do {
        201 cutText ["Du bist im Flugzeug, aber schläfst noch. Vermutlich wirst du bald von der durchsage des Piloten geweckt.", "BLACK", 6];
        sleep 8;
        201 cutText ["Du bist im Flugzeug, aber schläfst noch. Vermutlich wirst du bald von der durchsage des Piloten geweckt.", "BLACK IN", 6];
        sleep 8;
    };

    201 cutText ["", "BLACK IN", 0.01];
    200 cutText ["", "BLACK IN", 3];
    3 fadeSound 1;
};

waitUntil { lilc_flight_waitingForPlayers };

[[player], "LiveInLifeServer_flight_fnc_addToFlight"] call lilc_common_fnc_sendToServer;

waitUntil { !lilc_flight_waitingForPlayers };

lilc_flight_isReady = false;
waitUntil { lilc_flight_isReady };

lilc_flight_sleeping = false;

diag_log str vehicle player;
waitUntil { (isTouchingGround (vehicle player)) };

diag_log str lilc_flight_inTriggerArea;
waitUntil { (lilc_flight_inTriggerArea) };

200 cutText ["", "BLACK", 3];
3 fadeSound 0;
sleep 3;

["default"] call lilc_common_fnc_setStaticPosition;
sleep 1;

200 cutText ["", "BLACK IN", 2];
2 fadeSound 0;
*/

lilc_player_HUDEnabled = false;
disableUserInput true;
0 fadeSound 0;
[0.01] call lilc_ui_fnc_fadeInBlack;
["lilc_ui_loading", 0.01, 502, true] call lilc_ui_fnc_fadeInTitles;

sleep 2;
_classname = selectRandom ["rds_uniform_Woodlander4","rds_uniform_Worker1","rds_uniform_Worker4","rds_uniform_Worker3","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_4_F","rds_uniform_Woodlander3","rds_uniform_Woodlander2","rds_uniform_Woodlander1"];
player forceAddUniform _classname;
player allowDamage false;

lilc_firstspawn_queueFinished = false;
private _handle = [] spawn {
    private _messages = [
        "Du bist auf deiner Reise in eine neue Zukunft im Flugzeug eingeschlafen...",
        "... du träumst von einem Inselparadies, einer neue Heimat in der du dein Glück finden wirst...",
        "... eine Heimat in der es keine Armut gibt und keine Gewalt...",
        "... in der Gerechtigkeit herrscht und jeder Mensch respektiert wird...",
        "... einer Heimat in der die Starken die Schwachen stützen und beschützen...",
        "... ohne Neid, Egoismus, Schmerz und Missgunst...",
        "... eine Heimat in der jeder Teil eines Ganzen ist, egal ob jung oder alt, Mann oder Frau, schwarz oder weiß...",
        "... doch dann hörst du einen Signalton, eine Durchsage des Piloten reißt dich aus deinen Träumen."
    ];

    private _count = 0;
    while { (_count < (count _messages)) && !lilc_firstspawn_queueFinished } do {
        [(format["<t font='PuristaLight' shadow='1' size='0.8' align='center'>%1</t>", (_messages select _count)]), 0, 0.4, 10, 4, 0, 501] spawn BIS_fnc_dynamicText;
        sleep 16;
        _count = _count + 1;
    };
};

waitUntil { lils_firstspawn_queueOpen };
[[player], "lils_firstspawn_fnc_addToFlight"] call lilc_common_fnc_sendToServer;


waitUntil { !lils_firstspawn_queueOpen };
lilc_firstspawn_queueFinished = true;
waitUntil { scriptDone _handle; };
disableUserInput false;
[1, 502] call lilc_ui_fnc_fadeOutTitles;

[4] call lilc_ui_fnc_fadeOutBlack;
4 fadeSound 1;
sleep 4;
disableUserInput true;

lilc_firstspawn_atAirport = false;
private _trigger = createTrigger ["EmptyDetector", [6981.7,7369.36,0]];
_trigger setTriggerArea [200, 100, 67.413, false, -1];
_trigger setTriggerActivation ["CIV", "PRESENT", false];
_trigger setTriggerStatements ["true", "lilc_firstspawn_atAirport = true;", ""];

waitUntil { (isTouchingGround vehicle player) };
sleep 40;
waitUntil { lilc_firstspawn_atAirport };

disableUserInput false;
[4] call lilc_ui_fnc_fadeInBlack;
4 fadeSound 0;
sleep 5;

player enableSimulation false;
moveOut player;
sleep (random [0.3, 0.8, 1]);
["default"] call lilc_common_fnc_setStaticPosition;
sleep 1;
player enableSimulation true;
player setvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]];
player allowDamage true;

lilc_player_HUDEnabled = true;
lilc_player_isNew = 0;
[0] call lilc_login_fnc_savePlayerDataPartial;
sleep 4;

2 fadeSound 1;
