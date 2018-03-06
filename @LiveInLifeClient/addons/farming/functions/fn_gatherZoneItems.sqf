

if (lilc_farming_currentGatherTimeout >= time) exitWith {};
if (call lilc_inventory_fnc_inventoryOpen) exitWith{};
if ((vehicle player) != player) exitWith {};
if (lilc_action_active) exitWith {};
lilc_action_active = true;

private _areaConfig = configNull;
try {
    {
        private _config = _x;
        {
            if (player inArea _x) throw _config;
        } forEach getArray(_x >> "areas");
    } forEach ("true" configClasses (missionConfigFile >> "CfgFarmAreas"));
} catch {
    _areaConfig = _exception;
};

private _currentStamina = getStamina player;
if (_currentStamina < getNumber(_areaConfig >> "timeout")) exitWith {
    lilc_action_active = false;
};

player setStamina (_currentStamina - getNumber(_areaConfig >> "timeout"));

try {
    if (isNull _areaConfig) throw 0;

    player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {
        animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"
    };
    sleep 0.5;
    if (call lilc_inventory_fnc_inventoryOpen) throw 0;

    private _coef = 1;
    if (getNumber(_areaConfig >> "lessChanceByDistance") == 1) then {
        _coef = ((getMarkerSize (configName _areaConfig)) select 0) / (player distance2D (configName _areaConfig));
    };

    private _gI = [[], []];
    {
        private _c = 0;
        for "_i" from 1 to getNumber(_x >> "amount") do {
            private _r = ((random 1) * _coef);
            if (_r <= getNumber(_x >> "chance")) then {
                _c = _c + 1;
            };
        };

        if (_c > 0) then {
            (_gI select 0) pushBack (configName _x);
            (_gI select 1) pushBack _c;
        };
    } forEach ("true" configClasses _areaConfig);

    {
        for "_i" from 1 to ((_gI select 1) select _forEachIndex) do {
            if !([player, _x, -1, false, false] call lilc_inventory_fnc_add) throw 2;
        };
    } forEach (_gI select 0);

    if ((count (_gI select 0)) > 0) then {
        if (getNumber(_areaConfig >> "hint") == 1) then {
            private _str = "Du hast folgende Items erhalten:<br />";

            {
                private _c = ((_gI select 1) select _forEachIndex);
                _str = format["%1%2x %3<br />", _str, _c, getText(([_x] call lilc_common_fnc_getClassnameConfig) >> "displayName")];
            } forEach (_gI select 0);
            [_str] call lilc_ui_fnc_hint;
        };
    } else {
        if (getNumber(_areaConfig >> "hintFailed") == 1) then {
            ["Du hast keine Items erhalten.", "ERROR"] call lilc_ui_fnc_hint;
        };
    };

    throw 1;
} catch {
    lilc_action_active = false;
    lilc_farming_currentGatherTimeout = time + lilc_farming_gatherTimeout - 0.1;
    switch (_exception) do {
        case 2: {
            ["Dein Inventar ist voll.", "ERROR"] call lilc_ui_fnc_hint;
        };

        case 1: {
            ([{
                if ((((_this select 0) select 1) distance2D player) < 0.1) exitWith {
                    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
                };
                if (lilc_action_active || ((_this select 0) select 0) < time) then {
                    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
                    if (!lilc_action_active) then {
                        false spawn lilc_farming_fnc_gatherZoneItems;
                    };
                };
            }, 0 , [time + lilc_farming_gatherTimeout, position player]] call CBA_fnc_addPerFrameHandler);
        };
    };
    (_exception == 1);
};
