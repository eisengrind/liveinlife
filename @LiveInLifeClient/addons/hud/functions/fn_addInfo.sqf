
params [
    ["_name", "", [""]],
    ["_stmt", {}, [{}]],
    ["_cond", {}, [{}]]
];

if (isNil "_name" || _name == "" || isNil "_stmt") exitWith { ""; };

if (isNil "_cond") then
{
    _cond = { true; };
};

lilc_hud_infos = ([lilc_hud_infos, (tolower _name), [_stmt, _cond]] call CBA_fnc_hashSet);

_name;
