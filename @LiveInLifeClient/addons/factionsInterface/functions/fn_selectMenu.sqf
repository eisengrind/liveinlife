
private _pageName = param [0, "", [""]];

try {
    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;

    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);

    switch (_pageName) do {
        case "dashboard": {
            for "_i" from 1379 to 1390 do { ctrlShow [_i, false]; };

            for "_i" from 1391 to 1406 do { ctrlShow [_i, false]; };

            for "_i" from 1421 to 1430 do { ctrlShow [_i, false]; };

            for "_i" from 1371 to 1378 do { ctrlShow [_i, true]; };
            
            // [[ID, NAME, TAG, FACTIONID, PRIORITY]]
            lbClear 1372;
            {
                if (_factionID == (_x select 3)) then {
                    private _index = lbAdd [1372, (format["%1. %2", (_x select 2), (_x select 1)])];
                    lbSetValue [1372, _index, (_x select 0)];
                };
            } forEach lilc_factionsInterface_ranks;

            [[player], "lils_factionsInterface_fnc_getPlayers"] call lilc_common_fnc_sendToServer;
            
            ctrlSetText [1408, "Dashboard"];
        };

        case "player": {
            for "_i" from 1371 to 1378 do { ctrlShow [_i, false]; };

            for "_i" from 1391 to 1406 do { ctrlShow [_i, false]; };

            for "_i" from 1421 to 1430 do { ctrlShow [_i, false]; };

            for "_i" from 1379 to 1390 do { ctrlShow [_i, true]; };
            
            ctrlSetText [1408, "Spieler"];
        };

        case "rank": {
            for "_i" from 1371 to 1378 do { ctrlShow [_i, false]; };

            for "_i" from 1379 to 1390 do { ctrlShow [_i, false]; };

            for "_i" from 1421 to 1430 do { ctrlShow [_i, false]; };

            for "_i" from 1391 to 1406 do { ctrlShow [_i, true]; };
            
            ctrlSetText [1408, "Rang"];

            lbClear 1406;
            {
                private _index = lbAdd [1406, (getText(_x >> "displayName"))];
                lbSetPicture [1406, _index, (getText(_x >> "texture"))];
                lbSetData [1406, _index, (configName _x)];
            } forEach (("true" configClasses (missionConfigFile >> "CfgUnitInsignia")) + ("true" configClasses (configFile >> "CfgUnitInsignia")));

            lbClear 1404;
            {
                private _index = lbAdd [1404, (format["Paycheck %1", (_forEachIndex + 1)])];
                lbSetValue [1404, _index, _forEachIndex];
            } forEach getArray(_factionConfig >> "paychecks");
        };

        case "rankadd": {
            for "_i" from 1371 to 1378 do { ctrlShow [_i, false]; };

            for "_i" from 1379 to 1390 do { ctrlShow [_i, false]; };

            for "_i" from 1391 to 1406 do { ctrlShow [_i, false]; };

            for "_i" from 1421 to 1430 do { ctrlShow [_i, true]; };

            ctrlSetText [1408, "Rang hinzufügen"];

            lbClear 1426;
            private _index = lbAdd [1426, "<Kein Insignia>"];
            lbSetData [1426, _index, ""];
            {
                private _index = lbAdd [1426, (getText(_x >> "displayName"))];
                lbSetPicture [1426, _index, (getText(_x >> "texture"))];
                lbSetData [1426, _index, (configName _x)];
            } forEach (("true" configClasses (missionConfigFile >> "CfgUnitInsignia")) + ("true" configClasses (configFile >> "CfgUnitInsignia")));

            lbClear 1428;
            private _index = lbAdd [1428, "<Kein Paycheck>"];
            lbSetValue [1428, _index, -1];
            {
                private _index = lbAdd [1428, (format["Paycheck %1", (_forEachIndex + 1)])];
                lbSetValue [1428, _index, _forEachIndex];
            } forEach getArray(_factionConfig >> "paychecks");
        };
    };
} catch {
    _exception;
};
