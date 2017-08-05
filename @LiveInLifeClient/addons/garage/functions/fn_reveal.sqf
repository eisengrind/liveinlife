
try
{
    disableSerialization;
    private _ui = (findDisplay 1265);
    if (isNull _ui) throw false;

    private _uiListVehicles = (_ui displayCtrl 1500);
    private _index = (lbCurSel _uiListVehicles);
    if (_index <= -1) throw false;

    call lilc_garage_fnc_closeMenu;
    private _garageConfig = ([lilc_garage_currentGarage] call lilc_garage_fnc_getGarageConfig);
    private _data = (call compile format["%1", (_uiListVehicles lbData _index)]);
    if ((count _data) <= 0) throw false;

    private _position = ([getText(_garageConfig >> "revealPosition")] call lilc_common_fnc_getDynamicPosition);
    if ([(_position select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) throw false;

    if ((_data select 0) <= 0) then
    {
        [[player, [(_data select 1), (_data select 2)], lilc_garage_currentGarage], "lils_garage_fnc_reveal"] call lilc_common_fnc_sendToServer;
    }
    else
    {
        //ID, CLASSNAME, COLOR, NICKNAME, FUEL, QUOTE(PLATE)
        [[player, (_data select 0), lilc_garage_currentGarage], "lils_garage_fnc_reveal"] call lilc_common_fnc_sendToServer;
    };

    throw true;
}
catch
{
    if !(_exception) then
    {
        hint "Dein Fahrzeug konnte nicht ausgeparkt werden!";
    };
};
