
params [
    ["_textureName", "-1", [""]],
    ["_objectClassname", "", [""]],
    ["_textureIndex", -1, [-1]]
];
if (_textureName == "-1") exitWith { "-1"; };
if (_objectClassname == "") exitWith { "-1"; };
if (_textureIndex == -1) exitWith { "-1"; };

if !(isNull (missionConfigFile >> "CfgTextures" >> _objectClassname >> _textureName >> format["texture_%1", _textureIndex])) exitWith {
    getText (missionConfigFile >> "CfgTextures" >> _objectClassname >> _textureName >> format["texture_%1", _textureIndex]);
};

"-1";
