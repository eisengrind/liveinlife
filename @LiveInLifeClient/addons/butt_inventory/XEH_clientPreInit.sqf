
lilc_butt_inventory_maximum = 10;
lilc_butt_inventory_openingTime = 10;
lilc_butt_inventory_maxMass = 50;
lilc_butt_inventory_maxMassPain = 0.8;
lilc_butt_inventory_allowedFactions = [];

[{
    private _mM = player getVariable ["lilc_butt_inventory_maxMass", lilc_butt_inventory_maxMass];
    private _mMP = player getVariable ["lilc_butt_inventory_maxMassPain", lilc_butt_inventory_maxMassPain];

    private _pain = 0;
    {
        _pain = _pain + ((_mMP / _mM^2)*([_x] call lilc_inventory_fnc_getItemWeight)^2);
        true;
    } count (player getVariable ["lilc_butt_inventory", []]);

    [player, _pain] call ace_medical_fnc_adjustPainLevel;

    if (_pain > 0.4) then {
        [player, 0.05 * _pain, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
    };

    if (_pain > 2) then {
        [player, true, (random [10, 20, 30])*_pain] call ace_medical_fnc_setUnconscious;
    };
}, 30] call CBA_fnc_addPerFrameHandler;

[
    "set_lil_butt_inventory",
    {
        player setVariable  ["lilc_butt_inventory", _this, true];
    }
] call lilc_login_fnc_addPackage;

lilc_login_update_defPackages pushBack "update_lil_butt_inventory"
[
    "update_lil_butt_inventory",
    {
        (player getVariable ["lilc_butt_inventory", []]);
    }
] call lilc_login_fnc_addPackage;
