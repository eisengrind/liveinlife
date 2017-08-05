
params [
    ["_pageName", "", [""]],
    ["_data", nil]
];

try {
    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);

    switch (_pageName) do {
        case "dashboard": {
            private _list = (_ui displayCtrl 1371);

            lbClear _list;
            private _onlinePlayers = playableUnits apply { (_x getVariable ["lilc_accountID", -1]) };
            {
                //ID, STEAM64ID, ACCOUNTID, RANKID, FIRSTNAME, LASTNAME
                private _factionPlayerID = (_x select 0);
                private _steam64ID = (_x select 1);
                private _accountID = (_x select 2);
                private _index = -1;
                private _firstname = (_x select 4);
                private _lastname = (_x select 5);

                private _tag = ([(_x select 3)] call lilc_factionsInterface_fnc_getRankTag);

                _index = _list lbAdd (format["%1%2 %3 (%4)", (if (_tag != "") then { (_tag + " "); } else { ""; }), _firstname, _lastname, (if (_accountID in _onlinePlayers) then { "Online"; } else { "Offline"; })]);
                _list lbSetValue [_index, _factionPlayerID];
            } forEach _data;

            lbSort [_list, "ASC"];
        };

        case "player": {
            /*
            [["<classname>", ""]],
            [["<classname>", ""]],
            ["<permission>"] -> localization of STR_permission_displayName_<permission>
            */
            /*
            declaration of equipment:
                {<classname>, <color/not every item>}
            declaration of equipment:
                {<classname>, <color>}
            declaration of permissions:
                general permissions - every permissions of players -> <permission>
            */
            //EQUIPMENT, VEHICLES, PERMISSIONS, RANKID, FIRSTNAME, LASTNAME, ACCOUNTID, RANKID
            //private _index = _uiListPlayerPermissions lnbAddRow [(getText(_config >> "displayName")), (if (_status) then { "Ja"; } else { "Nein"; })];
            
            lilc_factionsInterface_currentAccountID = (_data select 6);

            ctrlSetText [1380, (format["%1 %2", (_data select 4), (_data select 5)])];

            for [{private _i = 0}, {_i < (lbSize 1382)}, {_i = _i + 1}] do { if ((lbValue [1382, _i]) == (_data select 7)) exitWith { lbSetCurSel [1382, _i]; }; };

            private _uiListRanks = (_ui displayCtrl 1382);
            private _uiListEquipment = (_ui displayCtrl 1386);
            private _uiListVehicles = (_ui displayCtrl 1387);
            private _uiListPermissions = (_ui displayCtrl 1384);

            lbClear _uiListRanks;
            {
                // [ID, NAME, TAG, FACTIONID, PRIORITY, INSIGNIA]
                if ((_x select 3) == _factionID) then {
                    private _index = (_uiListRanks lbAdd (_x select 1));
                    _uiListRanks lbSetValue [_index, (_x select 0)];
                };
            } forEach lilc_factionsInterface_ranks;
            if ((lbSize _uiListRanks) <= 0) then { _uiListRanks ctrlEnable false; };

            lnbClear _uiListEquipment;
            {
                private _classname = (_x select 0);
                private _color = (_x select 1);
                
                try {
                    {
                        if (_classname == (_x select 0) && _color == (_x select 1)) throw true;
                    } forEach (_data select 0);
                    throw false;
                } catch {
                    private _classnameConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
                    private _index = _uiListEquipment lnbAddRow ["", (getText(_classnameConfig >> "displayName")), (if (_exception) then { "Ja"; } else { "Nein"; })];
                    _uiListEquipment lnbSetPicture [[_index, 0], (getText(_classnameConfig >> "picture"))];
                    _uiListEquipment lnbSetData [[_index, 0], _classname];
                    _uiListEquipment lnbSetData [[_index, 1], _color];
                    _uiListEquipment lnbSetData [[_index, 2], (str (parseNumber _exception))];
                };
            } forEach getArray(_factionConfig >> "defaultEquipment");

            lnbClear _uiListVehicles;
            {
                private _classname = (_x select 0);
                private _color = (_x select 1);
                
                try {
                    {
                        if (_classname == (_x select 0) && _color == (_x select 1)) throw true;
                    } forEach (_data select 1);
                    throw false;
                } catch {
                    private _classnameConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
                    private _index = _uiListVehicles lnbAddRow ["", (getText(_classnameConfig >> "displayName")), (if (_exception) then { "Ja"; } else { "Nein"; })];
                    _uiListVehicles lnbSetPicture [[_index, 0], (getText(_classnameConfig >> "picture"))];
                    _uiListVehicles lnbSetData [[_index, 0], _classname];
                    _uiListVehicles lnbSetData [[_index, 1], _color];
                    _uiListVehicles lnbSetData [[_index, 2], (str (parseNumber _exception))];
                };
            } forEach getArray(_factionConfig >> "defaultVehicles");

            lnbClear _uiListPermissions;
            {
                private _permission = _x;

                try {
                    if ([_permission, (_data select 2)] call lilc_permissions_fnc_have) throw true;
                    throw false;
                } catch {
                    private _permissionName = ([_permission] call lilc_permissions_fnc_getPermissionName);
                    private _index = _uiListPermissions lnbAddRow [_permissionName, (if (_exception) then { "Ja"; } else { "Nein"; })];
                    _uiListPermissions lnbSetData [[_index, 0], _permission];
                    _uiListPermissions lnbSetData [[_index, 1], (str (parseNumber _exception))];
                };
            } forEach (["factionsInterface.dashboard", "factionsInterface.player.edit", "factionsInterface.rank.edit", "factionsInterface.rank.add", "factionsInterface.rank.remove"] + getArray(_factionConfig >> "selectablePermissions"));
        };

        case "rank": {
            //NAME, TAG, VEHICLES, EQUIPMENT, PERMISSIONS, PRIORITY, INSIGNIA, RANKID
            lilc_factionsInterface_currentRankID = (_data select 7);

            private _uiListEquipment = (_ui displayCtrl 1398);
            private _uiListVehicles = (_ui displayCtrl 1399);
            private _uiListPermissions = (_ui displayCtrl 1396);

            ctrlSetText [1394, (_data select 0)];
            ctrlSetText [1392, (_data select 1)];

            for [{private _i = 0}, {_i < (lbSize 1403)}, {_i = _i + 1}] do { if ((lbValue [1403, _i]) == (_data select 5)) exitWith { lbSetCurSel [1403, _i]; }; };
            for [{private _i = 0}, {_i < (lbSize 1406)}, {_i = _i + 1}] do { if ((lbData [1403, _i]) == (_data select 6)) exitWith { lbSetCurSel [1406, _i]; }; };

            lnbClear _uiListEquipment;
            {
                private _classname = (_x select 0);
                private _color = (_x select 1);
                
                try {
                    {
                        if (_classname == (_x select 0) && _color == (_x select 1)) throw true;
                    } forEach (_data select 3);
                    throw false;
                } catch {
                    private _classnameConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
                    private _index = _uiListEquipment lnbAddRow ["", (getText(_classnameConfig >> "displayName")), (if (_exception) then { "Ja"; } else { "Nein"; })];
                    _uiListEquipment lnbSetPicture [[_index, 0], (getText(_classnameConfig >> "picture"))];
                    _uiListEquipment lnbSetData [[_index, 0], _classname];
                    _uiListEquipment lnbSetData [[_index, 1], _color];
                    _uiListEquipment lnbSetData [[_index, 2], (str (parseNumber _exception))];
                };
            } forEach getArray(_factionConfig >> "defaultEquipment");

            lnbClear _uiListVehicles;
            {
                private _classname = (_x select 0);
                private _color = (_x select 1);
                
                try {
                    {
                        if (_classname == (_x select 0) && _color == (_x select 1)) throw true;
                    } forEach (_data select 2);
                    throw false;
                } catch {
                    private _classnameConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
                    private _index = _uiListVehicles lnbAddRow ["", (getText(_classnameConfig >> "displayName")), (if (_exception) then { "Ja"; } else { "Nein"; })];
                    _uiListVehicles lnbSetPicture [[_index, 0], (getText(_classnameConfig >> "picture"))];
                    _uiListVehicles lnbSetData [[_index, 0], _classname];
                    _uiListVehicles lnbSetData [[_index, 1], _color];
                    _uiListVehicles lnbSetData [[_index, 2], (str (parseNumber _exception))];
                };
            } forEach getArray(_factionConfig >> "defaultVehicles");

            lnbClear _uiListPermissions;
            {
                private _permission = _x;

                try {
                    if ([_permission, (_data select 4)] call lilc_permissions_fnc_have) throw true;
                    throw false;
                } catch {
                    private _permissionName = ([_permission] call lilc_permissions_fnc_getPermissionName);
                    private _index = _uiListPermissions lnbAddRow [_permissionName, (if (_exception) then { "Ja"; } else { "Nein"; })];
                    _uiListPermissions lnbSetData [[_index, 0], _permission];
                    _uiListPermissions lnbSetData [[_index, 1], (str (parseNumber _exception))];
                };
            } forEach (["factionsInterface.dashboard", "factionsInterface.player.edit", "factionsInterface.rank.edit", "factionsInterface.rank.add", "factionsInterface.rank.remove"] + getArray(_factionConfig >> "selectablePermissions"));
        };
    };
} catch {
    _exception;
};
