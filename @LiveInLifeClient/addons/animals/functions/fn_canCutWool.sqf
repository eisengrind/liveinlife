
private _sheep = param [0, objNull, [objNull]];

params [
    ["_sheep", objNull, [objNull]]
];

((_sheep getVariable ["lilc_animals_sheepCutted", _time]) <= _time)
