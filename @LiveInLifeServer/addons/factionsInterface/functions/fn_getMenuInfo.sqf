
params [
    ["_unit", objNull, [objNull]],
    ["_factionPlayerID", 0, [0]]
];

[["player", (_this call lils_factionsInterface_fnc_getPlayerInfo)], "lilc_factionsInterface_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
