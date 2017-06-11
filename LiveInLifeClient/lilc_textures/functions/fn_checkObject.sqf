
params [
    ["_textureName", "", [""]],
    ["_objectClassname", "", [""]],
    ["_textureIndex", -1, [-1]]
];

try {
    if (_textureName == "") exitWith { ""; };
    if (_objectClassname == "") exitWith { ""; };
    if (_textureIndex == -1) exitWith { ""; };

    switch (_textureName) do {
        case "#transparent": { throw ""; };
        default {
            if !(isNull (missionConfigFile >> "CfgTextures" >> _objectClassname >> _textureName >> format["texture_%1", _textureIndex])) throw getText (missionConfigFile >> "CfgTextures" >> _objectClassname >> _textureName >> format["texture_%1", _textureIndex]);
            throw "#notDefined";
        };
    };

    throw "#notDefined";
} catch {
    _exception;
};
