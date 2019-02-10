
try {
    if (lilc_garage_currentGarage == "") throw false;
    
    disableSerialization;
    private _ui = (findDisplay 1265);
    if (isNull _ui) throw false;

    private _garageConfig = ([lilc_garage_currentGarage] call lilc_garage_fnc_getGarageConfig);
    private _uiListVehicles = (_ui displayCtrl 1500);
    private _uiTextDescription = (_ui displayCtrl 1100);
    private _uiButtonReveal = (_ui displayCtrl 2400);
    
    _uiButtonReveal ctrlEnable false;

    private _index = (lbCurSel _uiListVehicles);
    if (_index <= -1) throw false;

    private _data = (call compile format["%1;", (_uiListVehicles lbData _index)]);
    private _vehicleConfig = ([(_data select 1)] call lilc_common_fnc_getClassnameConfig);
    
    // ID, CLASSNAME, COLOR, NICKNAME, FUEL, QUOTE(PLATE)
    _uiTextDescription ctrlSetStructuredText parseText format[
        "<t align='left'>Informationen:<t size='0.8'><br /><t>Fahrzeugname: </t><t>%1</t><br /><t>Kennzeichen: </t><t>%2</t><br /><t>Farbe: </t><t>%3</t><br /><t>Beschreibung: </t><t>%4</t><br /><t>Höchstgeschwindigkeit: </t><t>%5</t> km/h<br /><t>Gewicht: </t><t>%6</t> kg<br /><t>Tankfüllung: </t><t>%7 / %8</t> L<br /><t>Speicher: </t><t>%9</t></t></t></t>",
        getText(_vehicleConfig >> "displayName"),
        (_data select 5),
        (_data select 2),
        getText(_vehicleConfig >> "description"),
        getNumber(_vehicleConfig >> "maxSpeed"),
        getNumber(_vehicleConfig >> "mass"),
        (round ((getNumber(_vehicleConfig >> "fuelCapacity")) * (_data select 4))),
        getNumber(_vehicleConfig >> "fuelCapacity"),
        getNumber(_vehicleConfig >> "maximumLoad")
    ];

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
