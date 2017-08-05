
call lilc_ui_fnc_disableHud;
0 fadeSound 0;
[0.01] call lilc_ui_fnc_fadeInBlack;

[""] call lilc_ui_fnc_setLoadingText;

sleep 2;
player allowDamage false;

call lilc_ui_fnc_disableUserInput;

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
call lilc_ui_fnc_enableUserInput;
playSound "pilot_speech_1";
call lilc_ui_fnc_disableLoadingIcon;

[4] call lilc_ui_fnc_fadeOutBlack;
4 fadeSound 1;
sleep 4;

lilc_firstspawn_atAirport = false;
private _trigger = createTrigger ["EmptyDetector", [6981.7,7369.36,0]];
_trigger setTriggerArea [200, 100, 67.413, false, -1];
_trigger setTriggerActivation ["CIV", "PRESENT", false];
_trigger setTriggerStatements ["true", "lilc_firstspawn_atAirport = true;", ""];

waitUntil { (isTouchingGround vehicle player) };
sleep 40;
waitUntil { lilc_firstspawn_atAirport };

[4] call lilc_ui_fnc_fadeInBlack;
4 fadeSound 0;
sleep 5;

player enableSimulation false;
moveOut player;
sleep (random [0.3, 0.8, 1]);
[player, "default"] call lilc_common_fnc_setDynamicPosition;
sleep 1;

lilc_player_cash = 100;
player enableSimulation true;
player allowDamage true;
[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;

call lilc_ui_fnc_enableHud;
lilc_player_isNew = 0;
[0] call lilc_login_fnc_updatePlayerDataPartial;
sleep 4;

2 fadeSound 1;
