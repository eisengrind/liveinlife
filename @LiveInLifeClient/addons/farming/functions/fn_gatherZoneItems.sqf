
if (call lilc_inventory_fnc_inventoryOpen) exitWith{};
if ((vehicle player ) != player) exitWith {};
if (lilc_action_active) exitWith {};
lilc_action_active = true;

private _areaConfig = configNull;
try
{
    {
        private _config = _x;
        {
            if (player inArea _x) throw _config;
        } forEach getArray(_x >> "areas");
    } forEach ("true" configClasses (missionConfigFile >> "CfgFarmAreas"));
}
catch
{
    _areaConfig = _exception;
};

try
{
    if (isNull _areaConfig) throw false;
    
    player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil
    {
        animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"
    };
    sleep 0.5;
    if (call lilc_inventory_fnc_inventoryOpen) throw false;

    private _coef = 1;
    if (getNumber(_areaConfig >> "lessChanceByDistance") == 1) then
    {
        _coef = ((getMarkerSize (configName _areaConfig)) select 0) / (player distance2D (configName _areaConfig));
    };

    private _gI = [];

    {
        if (((random 1) * _coef) <= getNumber(_x >> "chance")) then
        {
            _gI pushBack (configName _x);
        };
    } forEach ("true" configClasses _areaConfig);

    if (getNumber(_areaConfig >> "hint") == 1) then
    {
        private _str = "Du hast folgende Items erhalten:<br>";
        {
            private _cN = (configName _x);
            private _c = ({
                (_x == _cN);
            } count _gI);

            if (_c <= 0) then
            {
                _str = format["%1%2x %3<br>", _str, _c];
            };
        } forEach ("true" configClasses _areaConfig);

        if (_str == "") then
        {
            [_str] call lilc_ui_fnc_hint;
        };
    };

    {
        [player, _x, -1, false, true] call lilc_inventory_fnc_add;
    } forEach _gI;

    throw true;
}
catch
{
    private _currentStamina = (getStamina player);
    player setStamina (_currentStamina - (getNumber(_areaConfig >> "timeout")));
    waitUntil
    {
        ((getStamina player) > (getNumber(_areaConfig >> "timeout")))
    };
    
    sleep 1;
    lilc_action_active = false;
    _exception;
};