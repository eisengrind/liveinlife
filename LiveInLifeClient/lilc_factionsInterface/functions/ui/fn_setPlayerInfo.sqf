
params [
    ["_permissionList", [], [[]]],
    ["_equipmentList", [], [[]]],
    ["_vehicleList", [], [[]]]
];

try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
        
    disableSerialization;
    private _ui = (findDisplay 1385);
    if (isNull _ui) throw false;

    private _uiListPlayerEquipment = (_ui displayCtrl 1388);
    private _uiListPlayerVehicles = (_ui displayCtrl 1389);
    private _uiListPlayerPermissions = (_ui displayCtrl 1397);

    private _factionInfo = ([_factionID] call lilc_common_fnc_getFactionConfig);
    
    if ("*" in _permissionList) then { lilc_factionsInterface_allPermissions = true; };
    lnbClear _uiListPlayerPermissions;
    {
        private _config = _x;
        private _status = false;

        {
            if ((configName _config) == _x) exitWith { _status = true; };
        } forEach _permissionList;

        private _index = _uiListPlayerPermissions lnbAddRow [(getText(_config >> "displayName")), (if (_status) then { "Ja"; } else { "Nein"; })];
        _uiListPlayerPermissions lnbSetData [[_index, 0], (configName _config)];
        _uiListPlayerPermissions lnbSetData [[_index, 1], (parseNumber _status)];
    } forEach ("true" configClasses (configFile >> "CfgFactionsInterfacePermissions"));

    lnbClear _uiListPlayerEquipment;
    {
        private _classname = (_x select 0);
        private _skin = (_x select 2);
        private _config = ([_classname] call lilc_common_fnc_getClassnameConfig);

        if !(isNull _config) then {
            try {
                {
                    if ((_x select 0) == _classname && (_x select 2) == _skin) then {
                        private _index = _uiListPlayerEquipment lnbAddRow ["", getText(_config >> "displayName"), (str (_x select 1))];
                        _uiListPlayerEquipment lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                        _uiListPlayerEquipment lnbSetData [[_index, 0], _skin];
                        _uiListPlayerEquipment lnbSetData [[_index, 1], _classname];
                        _uiListPlayerEquipment lnbSetData [[_index, 2], (str (_x select 1))];
                        throw false;
                    };
                } forEach _equipmentList;

                throw true;
            } catch {
                if (_exception) then {
                    private _index = _uiListPlayerEquipment lnbAddRow ["", getText(_config >> "displayName"), (str 0)];
                    _uiListPlayerEquipment lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                    _uiListPlayerEquipment lnbSetData [[_index, 0], _skin];
                    _uiListPlayerEquipment lnbSetData [[_index, 1], _classname];
                    _uiListPlayerEquipment lnbSetData [[_index, 2], (str 0)];
                };
            };
        };
    } forEach (_factionInfo select 6);

    lnbClear _uiListPlayerVehicles;
    {
        private _classname = (_x select 0);
        private _skin = (_x select 2);
        private _config = ([_classname] call lilc_common_fnc_getClassnameConfig);

        if !(isNull _config) then {
            try {
                {
                    if ((_x select 0) == _classname && (_x select 2) == _skin) then {
                        private _index = _uiListPlayerVehicles lnbAddRow ["", getText(_config >> "displayName"), (str (_x select 1))];
                        _uiListPlayerVehicles lnbSetData [[_index, 0], _skin];
                        _uiListPlayerVehicles lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                        _uiListPlayerVehicles lnbSetData [[_index, 1], _classname];
                        _uiListPlayerVehicles lnbSetData [[_index, 2], (str (_x select 1))];
                        throw false;
                    };
                } forEach _vehicleList;

                throw true;
            } catch {
                if (_exception) then {
                    private _index = _uiListPlayerVehicles lnbAddRow ["", getText(_config >> "displayName"), (str 0)];
                    _uiListPlayerVehicles lnbSetPicture [[_index, 0], getText(_config >> "picture")];
                    _uiListPlayerVehicles lnbSetData [[_index, 0], _skin];
                    _uiListPlayerVehicles lnbSetData [[_index, 1], _classname];
                    _uiListPlayerVehicles lnbSetData [[_index, 2], (str 0)];
                };
            };
        };
    } forEach (_factionInfo select 7);

    throw true;
} catch {
    _exception;
};
