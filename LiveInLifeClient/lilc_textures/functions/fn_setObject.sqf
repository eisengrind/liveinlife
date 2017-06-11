
params [
    ["_texturePath", "", [""]],
    ["_object", ObjNull, [ObjNull]],
    ["_textureIndex", -1, [-1]]
];

try {
    if (isNull _object) throw false;
    if (_textureIndex <= - 1) throw false;

    if (_texturePath == "#notDefined") throw false;
    _object setObjectTexture [_textureIndex, _texturePath];
    throw true;
} catch {
    _exception;
};
