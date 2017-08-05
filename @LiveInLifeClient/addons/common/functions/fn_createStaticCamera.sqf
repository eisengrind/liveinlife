
/*
    Filename:
        fn_createStaticCamera.sqf
    Author:
        Vincent Heins
    Description:
        Creates a (static) camera for whatever purpose. The camera is created with a predefined position / predefined coordinates in config CfgStaticCameras
    Param(s):
        (_this select 0) : the name, which is set in config CfgStaticCameras : <STRING>
		(_this select 1) : amount of time to commit the new position of the camera : <SCALAR/INT>
		(optional)(_this select 2): a camera object which is used to commit new coordinates. A new camera is not created with this parameter : <OBJNULL>
    Result(s):
        <objNull> : the newly or already used camera object : <OBJNULL>
*/

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
        _cameraTarget = [(_cameraPosition select 0) + (sin _cameraDir), (_cameraPosition select 1) + (cos _cameraDir), (_cameraPosition select 2) + (sin _cameraPitch)];
    };

    _camera camSetPos /*ASLToAGL*/ _cameraPosition;
    _camera camSetTarget /*ASLToAGL*/ _cameraTarget;
    _camera camSetBank _cameraBank;
    _camera camCommit _committing;

    throw _camera;
} catch {
    _exception;
};
