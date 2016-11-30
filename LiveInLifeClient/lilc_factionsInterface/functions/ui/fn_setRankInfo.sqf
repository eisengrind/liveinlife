
params [
    ["_permissionList", [], [[]]],
    ["_equipmentList", [], [[]]],
    ["_vehicleList", [], [[]]]
];

try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
        
    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    private _uiListRankPermissions = (_ui displayCtrl 1408);
    private _uiListRankEquipment = (_ui displayCtrl 1406);
    private _uiListRankVehicles = (_ui displayCtrl 1407);

    private _factionInfo = ([_factionID] call lilc_common_fnc_getFactionConfig);
    
    if ("*" in _permissionList) then { lilc_factionsInterface_allPermissions = true; };
    lnbClear _uiListRankPermissions;
    {
        private _config = _x;
        private _status = false;

        {
            if ((configName _config) == _x) exitWith { _status = true; };
        } forEach _permissionList;

        private _index = _uiListRankPermissions lnbAddRow [(getText(_config >> "displayName")), (if (_status) then { "Ja"; } else { "Nein"; })];
        _uiListRankPermissions lnbSetData [[_index, 0], (configName _config)];
        _uiListRankPermissions lnbSetData [[_index, 1], (str (parseNumber _status))];
    } forEach ("true" configClasses (configFile >> "CfgFactionsInterfacePermissions"));

    lnbClear _uiListRankEquipment;
    {
        private _classname = (_x select 0);
        private _skin = (_x select 2);
        private _config = ([_classname] call lilc_common_fnc_getClassnameConfig);

        if !(isNull _config) then {
            try {
                {
                    if ((_x select 0) == _classname && (_x select 2) == _skin) then {
                        private _index = _uiListRankEquipment lnbAddRow ["", getText(_config >> "displayName"), (str (_x select 1))];
                        _uiListRankEquipment lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                        _uiListRankEquipment lnbSetData [[_index, 0], _skin];
                        _uiListRankEquipment lnbSetData [[_index, 1], _classname];
                        _uiListRankEquipment lnbSetData [[_index, 2], (str (_x select 1))];
                        throw false;
                    };
                } forEach _equipmentList;

                throw true;
            } catch {
                if (_exception) then {
                    private _index = _uiListRankEquipment lnbAddRow ["", getText(_config >> "displayName"), (str 0)];
                    _uiListRankEquipment lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                    _uiListRankEquipment lnbSetData [[_index, 0], _skin];
                    _uiListRankEquipment lnbSetData [[_index, 1], _classname];
                    _uiListRankEquipment lnbSetData [[_index, 2], (str 0)];
                };
            };
        };
    } forEach (_factionInfo select 6);

    lnbClear _uiListRankVehicles;
    {
        private _classname = (_x select 0);
        private _skin = (_x select 2);
        private _config = ([_classname] call lilc_common_fnc_getClassnameConfig);

        if !(isNull _config) then {
            try {
                {
                    if ((_x select 0) == _classname && (_x select 2) == _skin) then {
                        private _index = _uiListRankVehicles lnbAddRow ["", getText(_config >> "displayName"), (str (_x select 1))];
                        _uiListRankVehicles lnbSetData [[_index, 0], _skin];
                        _uiListRankVehicles lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                        _uiListRankVehicles lnbSetData [[_index, 1], _classname];
                        _uiListRankVehicles lnbSetData [[_index, 2], (str (_x select 1))];
                        throw false;
                    };
                } forEach _vehicleList;

                throw true;
            } catch {
                if (_exception) then {
                    private _index = _uiListRankVehicles lnbAddRow ["", getText(_config >> "displayName"), (str 0)];
                    _uiListRankVehicles lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                    _uiListRankVehicles lnbSetData [[_index, 0], _skin];
                    _uiListRankVehicles lnbSetData [[_index, 1], _classname];
                    _uiListRankVehicles lnbSetData [[_index, 2], (str 0)];
                };
            };
        };
    } forEach (_factionInfo select 7);

    throw true;
} catch {
    _exception;
};
