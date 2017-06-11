
params [
    ["_textureName", "-1", [""]],
    ["_object", ObjNull, [ObjNull]],
    ["_textureIndex", -1, [-1]]
];

try {
    if (_textureName == "") throw false;
    if (isNull _object) throw false;
    if (_textureIndex == -1) throw false;

    private _texture = "";
    _texture = ([_textureName, (uniform _object), _textureIndex] call lilc_textures_fnc_checkObject);

    if ([_texture, _object, _textureIndex] call lilc_textures_fnc_setObject) then {
        if (local _object) then {
            _object setVariable ["lilc_color", _textureName];
        } else {
            _object setVariable ["lilc_color", _textureName, true];
        };
    };

} catch {
    _exception;
};

true;
