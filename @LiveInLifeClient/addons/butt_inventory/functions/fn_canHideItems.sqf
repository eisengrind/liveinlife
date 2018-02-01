
params [
    ["_unit", objNull, [objNull]]
];

(!isPlayer _unit && (_unit isEqualTo player || (!(_unit isEqualTo player) && (player getVariable ["lilc_factionID", -1]) in lilc_butt_inventory_allowedFactions)));
