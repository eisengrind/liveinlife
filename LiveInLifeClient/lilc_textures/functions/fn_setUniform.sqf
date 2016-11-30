
params [
    ["_textureName", "-1", [""]],
    ["_object", ObjNull, [ObjNull]],
    ["_textureIndex", -1, [-1]]
];
if (_textureName == "-1") exitWith { false; };
if (isNull _object) exitWith { false; };
if (_textureIndex == -1) exitWith { false; };

_texture = "";
if (_textureName != "" && _textureName != "-1") then { 
    _texture = ([_textureName, (uniform _object), _textureIndex] call lilc_textures_fnc_checkObject);
};

[_texture, _object, _textureIndex] call lilc_textures_fnc_setObject;
if ((_object getVariable ["lilc_clothingColor", "-1"]) != _textureName) then { _object setVariable ["lilc_clothingColor", _textureName, true]; };

true;
