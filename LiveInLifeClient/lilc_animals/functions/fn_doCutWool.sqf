
private _sheep = param [0, objNull, [objNull]];

try {
    if !([_sheep] call lilc_animals_fnc_canCutWool) throw false;

    private _animDone = (call lilc_common_fnc_takeAnimation);
    if !(_animDone) throw false;

    _sheep setVariable ["lilc_animals_sheepCutted", (time + 60), true];
    for [{private _i = 0}, {_i < (round (random 3))}, {_i = _i + 1}] do { [player, "egci_Cotton_F", 0, false, true] call lilc_inventory_fnc_add; };
    hint "Du hast die Wolle erfolgreich entfernt.";

    throw true;
} catch {
    _exception;
};
