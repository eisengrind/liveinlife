params [
    ["_unit", objNull, [objNull]],
    ["_name", "", [""]],
    ["_icon", "", [""]],
    ["_color", [], [[]]],
    ["_hOff", 0, [0]]
];

//drawIcon3D [<texture/string>, <color/array>, <positionAGL/array>, <width/float>, <height/float>, <angle/float>, <text/string>, <shadow/int(0, 1, 2)>, <textSize/float>, <textAlign/string(left, center, right)>, <drawSideArrows/bool>];

private _position = ((_unit modelToWorldVisual (_unit selectionPosition "pilot")) vectorAdd [0, 0, _hOff]);
private _text = _name;
private _textSize = 0.05;

private _scale = lilc_setting_tags_scale;

if (lilc_setting_tags_drawSoundwave && { _unit call tfar_fnc_isSpeaking; }) then {
    _icon = format["\x\lilc\addons\tags\ui\speaking_%1.paa", (floor random [0, 5, 10])];
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
