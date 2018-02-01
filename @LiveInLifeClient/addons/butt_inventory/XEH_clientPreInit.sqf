
lilc_butt_inventory_maximum = 10;
lilc_butt_inventory_openingTime = 10;
lilc_butt_inventory_maxMass = 50;
lilc_butt_inventory_maxMassPain = 0.8;

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
}, 30] call CBA_fnc_addPerFrameHandler;
