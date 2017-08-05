params [
    ["_unit", objNull, [objNull]],
    ["_name", "", [""]],
    ["_icon", "", [""]],
    ["_color", [], [[]]],
    ["_hOff", 0, [0]]
];

//drawIcon3D [<texture/string>, <color/array>, <positionAGL/array>, <width/float>, <height/float>, <angle/float>, <text/string>, <shadow/int(0, 1, 2)>, <textSize/float>, <textAlign/string(left, center, right)>, <drawSideArrows/bool>];

private _position = ((_unit modelToWorld (_unit selectionPosition "pilot")) vectorAdd [0, 0, _hOff]);
private _text = _name;
private _textSize = 0.05;

private _scale = lilc_setting_tags_scale;

if (lilc_setting_tags_drawSoundwave) then
{
    if (_unit call tfar_fnc_isSpeaking) then
    {
        _icon = format["\x\lilc\addons\tags\ui\speaking_%1.paa", (floor random [0, 5, 10])];
    };
};

drawIcon3D [
    _icon, //<texture/string>
    _color, //<color/array>
    _position, //<positionAGL/array>
    (1 * _scale), //<width/float>
    (1 * _scale), //<height/float>
    0, //<angle/float>
    _text, //<text/string>
    2, //<shadow/int(0, 1, 2)>
    _textSize * _scale, //<textSize/float>
    "RobotoCondensed" //<font/strin>
];

/*
if (_unit isEqualTo player) exitWith {};
if (isNull _unit) exitWith {};
if (lineIntersects [(position player), (position _unit), player, _unit] && !((vehicle _unit) isEqualTo (vehicle player))) exitWith {};
if ((headgear _unit) in lilc_tags_unknownHeadgears) exitWith {};

private _factionData = ([(_unit getVariable ["lilc_factionID", 0])] call lilc_factions_fnc_getFactionArray);
private _fC = [1, 1, 1, 1];
private _text = "Unbekannte Person";
private _icon = "";

if ((count _factionData) > 0) then
{
    _fC = (_factionData select 4);
    private _fVN = (_factionData select 6);
    switch (_fVN) do
    {
        case 0:
        {
            if ([_unit] call lilc_login_fnc_unitIsKnown) then
            {
                _text = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
            };
        };

        case 1:
        {
            if ([_unit] call lilc_login_fnc_unitIsKnown) then
            {
                _text = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
            }
            else
            {
                _text = ([_unit, "<ADDRESS> <LASTNAME>"] call lilc_login_fnc_formatName);
            };
        };
        case 2:
        {
            _text = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
        };
    };
}
else
{
    if ([_unit] call lilc_login_fnc_unitIsKnown) then
    {
        _text = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
    };
};

if (_unit call tfar_fnc_isSpeaking) then
{
    _icon = format["\x\lilc\addons\tags\ui\speaking_%1.paa", (floor random 10)];
};

private _d = (6 min (player distance _unit) max 1);
private _fact = (20 / _d);
_fC set [3, (1 - (_d / 7))];

drawIcon3D [
	_icon,
	_fC,
	(_unit modelToWorldVisual ((_unit selectionPosition "pilot") vectorAdd [0, 0, 0.45])),
	_fact * 0.1,
	_fact * 0.1,
	0,
	_text,
	1,
	_fact * 0.005,
	"PuristaLight",
	"center",
	false
];*/
