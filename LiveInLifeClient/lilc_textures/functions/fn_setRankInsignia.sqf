
params [
    ["_rankInsignia", "", [""]],
    ["_unit", ObjNull, [ObjNull]]
];

try {
    if (isNull _unit) throw false;

    private _texture = "";
    private _config = (configFile >> "CfgUnitInsignia" >> _rankInsignia);
    
    private _index = -1;
    {
        if (_x == "insignia") exitwith { _index = _foreachindex; };
    } foreach getArray (configfile >> "CfgVehicles" >> gettext (configfile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

    if (_index <= -1) throw false;

    private _texture = "";
    if (_rankInsignia == "") then {
        _texture = getText(_config >> "texture");
    } else {
        _texture = "#(argb,8,8,3)color(0,0,0,0)";
    };

    [_texture, _unit, _index] call lilc_textures_fnc_setObject;
} catch {
    _exception;
};
