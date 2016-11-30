
params [
    ["_cameraName", "", [""]],
    ["_committing", 0, [0]],
    ["_camera", objNull, [objNull]]
];

try {
    private _cameraConfig = ([_cameraName] call lilc_common_fnc_getCameraConfig);
    if (isNull _cameraConfig) throw objNull;
    if (_committing < 0) throw objNull;

    if (isNull _camera) then {
        _camera = "camera" camCreate [0, 0, 0];
        _camera cameraEffect ["internal", "back"];
    };

    private _cameraPosition = getArray(_cameraConfig >> "position");
    if !((count _cameraPosition) in [2, 3]) throw objNull;

    private _cameraTarget = getArray(_cameraConfig >> "target");
    private _cameraFov = getNumber(_cameraConfig >> "fov");
    private _cameraBank = getNumber(_cameraConfig >> "bank");

    if !((count _cameraTarget) in [2, 3]) then {
    private _cameraDir = getNumber(_cameraConfig >> "dir");
        private _cameraPitch = getNumber(_cameraConfig >> "pitch");
        _cameraTarget = [(_cameraPosition select 0) + (sin _cameraDir), (_cameraPosition select 1) + (cos _cameraDir), (_cameraPosition select 2) + (sin _cameraPitch)];;
    };

    _camera camSetPos ASLToAGL _cameraPosition;
    _camera camSetTarget ASLToAGL _cameraTarget;
    _camera camSetBank _cameraBank;
    _camera camCommit _committing;

    throw _camera;
} catch {
    _exception;
};
