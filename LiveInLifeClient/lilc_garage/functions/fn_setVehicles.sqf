
//vehicles = [[id, classname, skin, nickname], ...]
private _vehicles = param [0, [], [[]]];

try {
    if ((count _vehicles) <= 0) throw false;

    disableSerialization;
    private _ui = (findDisplay 1265);
    if (isNull _ui) throw false;
    
    private _uiListVehicles = (_ui displayCtrl 1266);

    lbClear _uiListVehicles;
    {
        private _index = -1;
        private _vehicleConfig = ([(_x select 1)] call lilc_common_fnc_getClassnameConfig);

        if ((_x select 3) == "") then {
            _index = _uiListVehicles lbAdd format["%1", getText(_vehicleConfig >> "displayName")];
        } else {
            _index = _uiListVehicles lbAdd format["%1", (_x select 3)];
        };

        _uiListVehicles lbSetPicture [_index, getText(_vehicleConfig >> "picture")];
        _uiListVehicles lbSetData [_index, (str [(_x select 0), (_x select 1), (_x select 2)])];
    } forEach _vehicles;

    if ((lbSize _uiListVehicles) <= 0) then {
        private _uiButtonReveal = (_ui displayCtrl 1268);
        _uiListVehicles lbAdd "Keine Fahrzeuge vorhanden.";
        _uiButtonReveal ctrlEnable false;
        _uiListVehicles ctrlEnable false;
    } else {
        _uiListVehicles ctrlEnable true;
    };
} catch {
    _exception;
};
