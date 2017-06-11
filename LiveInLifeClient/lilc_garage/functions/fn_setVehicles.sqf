
//vehicles = [[ID, CLASSNAME, COLOR, NICKNAME, FUEL, QUOTE(PLATE)], ...]
private _vehicles = param [0, [], [[]]];

try {
    if ((count _vehicles) <= 0) throw false;

    disableSerialization;
    private _ui = (findDisplay 1265);
    if (isNull _ui) throw false;
    
    private _uiListVehicles = (_ui displayCtrl 1500);

    lbClear _uiListVehicles;
    if ((count _vehicles) <= 0) then {
        _uiListVehicles lbAdd "Keine Fahrzeuge vorhanden.";
    } else {
        {
            private _vehicleConfig = ([(_x select 1)] call lilc_common_fnc_getClassnameConfig);
            private _index = -1;
            if ((_x select 3) == "") then {
                _index = _uiListVehicles lbAdd format["%1", getText(_vehicleConfig >> "displayName")];
            } else {
                _index = _uiListVehicles lbAdd format["%1", (_x select 3)];
            };

            _uiListVehicles lbSetPicture [_index, getText(_vehicleConfig >> "picture")];
            _uiListVehicles lbSetData [_index, (str _x)];
        } forEach _vehicles;
    };
} catch {
    _exception;
};
