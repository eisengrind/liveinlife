
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

    throw configNull;
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

    _generatedItems = [];
    {
        if ((random 1) <= getNumber(_x >> "chance")) then
        {
            _generatedItems pushBack (configName _x);
        };
    } forEach ("true" configClasses _areaConfig);
    
    if ((count _generatedItems) <= 0) then
    {
        hint "";
        throw false;
    };

    private _stringItems = "";
    {
        private _classname = (configName _x);
        if (_classname in _generatedItems) then
        {
            private _items = [];
            for [{_i = 0}, {_i < getNumber(_x >> "amount")}, {_i = _i + 1}] do
            {
                [player, _classname, -1, false, true] call lilc_inventory_fnc_add;
            };

            private _itemConfig = ([_classname] call lilc_inventory_fnc_getItemInfo);
            _stringItems = format[
                "%1<br /><t align='left'> - %2x %3</t>",
                _stringItems,
                getNumber(_x >> "amount"),
                getText(_itemConfig >> "displayName")
            ];
        };
    } forEach ("true" configClasses _areaConfig);
    
    hint parseText format["Du hast folgende Items erhalten:<br />%1", _stringItems];
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
