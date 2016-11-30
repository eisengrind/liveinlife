
try {
    if (lilc_garage_currentGarage == "") throw false;
    
    disableSerialization;
    private _ui = (findDisplay 1265);
    if (isNull _ui) throw false;

    private _garageConfig = ([lilc_garage_currentGarage] call lilc_garage_fnc_getGarageConfig);
    private _uiListVehicles = (_ui displayCtrl 1266);
    private _uiTextDescription = (_ui displayCtrl 1267);
    private _uiButtonReveal = (_ui displayCtrl 1268);
    private _uiButtonClose = (_ui displayCtrl 1269);
    
    _uiButtonReveal ctrlEnable false;
    _uiButtonClose ctrlEnable true;

    private _index = (lbCurSel _uiListVehicles);
    if (_index <= -1) throw false;

    private _data = (call compile format["%1;", (_uiListVehicles lbData _index)]);
    private _vehicleConfig = ([(_data select 1)] call lilc_common_fnc_getClassnameConfig);

    _uiTextDescription ctrlSetStructuredText parseText format["Informationen:<br /><t size='0.8'><t align='left'><t>Fahrzeugname: </t><t>%1</t></t><br /><t align='left'><t>Beschreibung: </t><t>%2</t></t><br /><t align='left'><t>Höchstgeschwindigkeit: </t><t>%3</t> km/h</t><br /><t align='left'><t>Gewicht: </t><t>%4</t> kg</t><br /><t align='left'><t>Tankfüllung: </t><t>%5</t> L</t><t align='left'><br /><t>Speicher: </t><t>%6</t></t></t>", getText(_vehicleConfig >> "displayName"), getText(_vehicleConfig >> "description"), getNumber(_vehicleConfig >> "maxSpeed"), getNumber(_vehicleConfig >> "mass"), getNumber(_vehicleConfig >> "fuelCapacity"), getNumber(_vehicleConfig >> "maximumLoad")];

    if !(isNull lilc_garage_currentCamera) then {
        if !(isNull lilc_garage_currentVehicle) then { deleteVehicle lilc_garage_currentVehicle; };
        
        private _position = getArray(_garageConfig >> "viewPosition");
        lilc_garage_currentVehicle = (_data select 1) createVehicleLocal [0, 0, 0];
        lilc_garage_currentVehicle allowDamage false;
        [lilc_garage_currentVehicle, _position] call lilc_common_fnc_setPosition;
        [(_data select 2), lilc_garage_currentVehicle] call lilc_textures_fnc_setVehicle;
    };

    _uiButtonReveal ctrlEnable true;
} catch {
    _exception;
};

/*
disableSerialization;
_vehicles = param [0, [], [[]]];

_ui = (findDisplay 1265);
_uiList = _ui displayCtrl 1266;
_uiDescription = _ui displayCtrl 1267;
_uiButtonRequest = _ui displayCtrl 1268;
_uiButtonRequest ctrlEnable false;

lbClear _uiList;
_uiDescription ctrlSetStructuredText parseText "";
_uiDescription ctrlCommit 0;

if ((count _vehicles) <= 0) then {
    _uiList lbAdd "Es sind keine Fahrzeuge in der Garage.";
    _uiList lbSetData [0, "-1"];
} else {
    {
        private ["_index"];
        _vehicleConfig = (configFile >> "CfgVehicles" >> (_x select 1));
        if !(isNull _vehicleConfig) then {
            _index = _uiList lbAdd format["%1", getText (_vehicleConfig >> "displayName")];
            _uiList lbSetPicture [_index, getText (_vehicleConfig >> "picture")];
            _uiList lbSetData [_index, format["%1", _x]];
        };
    } forEach _vehicles;

    _uiButtonRequest ctrlEnable true;
};
*/