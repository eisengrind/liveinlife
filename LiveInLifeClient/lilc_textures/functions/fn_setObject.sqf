
params [
    ["_texturePath", "-1", [""]],
    ["_object", ObjNull, [ObjNull]],
    ["_textureIndex", -1, [-1]]
];
if (_texturePath == "-1") exitWith { false; };
if (isNull _object) exitWith { false; };
if (_textureIndex == -1) exitWith { false; };

_object setObjectTexture [_textureIndex, _texturePath];
true;
