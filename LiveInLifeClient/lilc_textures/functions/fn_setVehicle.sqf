
params [
    ["_textureName", "", [""]],
    ["_object", ObjNull, [ObjNull]],
    ["_textureIndex", -1, [-1]]
];

try {
    if (_textureName == "") throw false;
    if (isNull _object) throw false;
    if (_textureIndex == -1) throw false;

    private _texture = "";
    _texture = ([_textureName, (typeOf _object), _textureIndex] call lilc_textures_fnc_checkObject);

    if ([_texture, _object, _textureIndex] call lilc_textures_fnc_setObject) then {
        if ((_object getVariable ["lilc_vehicleColor", ""]) != _textureName) then {
            if (local _object) then {
                _object setVariable ["lilc_vehicleColor", _textureName];
            } else {
                _object setVariable ["lilc_vehicleColor", _textureName, true];
            };
        };
        
        throw true;
    } else {
        throw false;
    };
} catch {
    _exception;
};
