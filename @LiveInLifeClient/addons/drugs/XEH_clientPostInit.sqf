
[lilc_drugs_fnc_drugsLoop, [], 1] call CBA_fnc_waitAndExecute;

//ACE3 ppEffect create function
private _fnc_createEffect = {
    params ["_type", "_layer", "_default"];

    private _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect;
};

lilc_drugs_effectAlcoholizedTunnel = [
    "ColorCorrections",
    33361,
    [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 0], [1, 1, 1, 1], [5, 5, 0, 0, 0, 0.1, 0.3]]
] call _fnc_createEffect;

lilc_drugs_effectAlcoholizedBlindness = [
    "ColorCorrections",
    33362,
    [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 0], [0.4, 0.4, 0.4, 0]]
] call _fnc_createEffect;

[{
    private _bac = (player getVariable ["lilc_drugs_bac", 0]) min 5;

    if (_bac > 0) then {
        lilc_drugs_effectAlcoholizedBlindness ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1 - ((_bac/3.6) min 1)], [0.4, 0.4, 0.4, 0]];
        lilc_drugs_effectAlcoholizedBlindness ppEffectCommit 0;
        lilc_drugs_effectAlcoholizedTunnel ppEffectAdjust [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 0], [1, 1, 1, 1], [1.4/_bac, 1.4/_bac, 0, 0, 0, 0.1, 0.3]];
        lilc_drugs_effectAlcoholizedTunnel ppEffectCommit 0;
    };

    lilc_drugs_effectAlcoholizedBlindness ppEffectEnable (_bac > 0);
    lilc_drugs_effectAlcoholizedTunnel ppEffectEnable (_bac > 0);
}, 0.5, []] call CBA_fnc_addPerFrameHandler;
