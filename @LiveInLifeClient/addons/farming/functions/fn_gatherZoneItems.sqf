
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

    private _gI = [[], []];
    {
        private _c = 0;
        for "_i" from 1 to getNumber(_x >> "amount") do
        {
            private _r = ((random 1) * _coef);
            if (_r <= getNumber(_x >> "chance")) then
            {
                _c = _c + 1;
            };
        };

        if (_c > 0) then
        {
            (_gI select 0) pushBack (configName _x);
            (_gI select 1) pushBack _c;
        };
    } forEach ("true" configClasses _areaConfig);

    if (getNumber(_areaConfig >> "hint") == 1) then
    {
        if ((count (_gI select 0)) > 0) then
        {
            private _str = "Du hast folgende Items erhalten:<br />";

            {
                private _c = ((_gI select 1) select _forEachIndex);
                _str = format["%1%2x %3<br />", _str, _c, getText(([_x] call lilc_common_fnc_getClassnameConfig) >> "displayName")];
            } forEach (_gI select 0);
            [_str] call lilc_ui_fnc_hint;
        }
        else
        {
            ["Du hast keine Items erhalten.", "ERROR"] call lilc_ui_fnc_hint;
        };
    };

    {
        for "_i" from 1 to ((_gI select 1) select _forEachIndex) do
        {
            [player, _x, -1, false, true] call lilc_inventory_fnc_add;
        };
    } forEach (_gI select 0);

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