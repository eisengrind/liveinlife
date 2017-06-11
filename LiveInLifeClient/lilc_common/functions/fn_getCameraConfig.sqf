
/*
    Filename:
        fn_getCameraConfig.sqf
    Author:
        Vincent Heins
    Description:
        Gets the static camera coordinates from CfgStaticCameras.
    Param(s):
        (_this select 0) : the configName of the static camera : <STRING>
    Result(s):
        the produced config entry - <CONFIG>
*/

private _cameraName = param [0, "", [""]];

try {
    if (_cameraName == "") throw configNull;
    
    private _camera = (missionConfigFile >> "CfgStaticCameras" >> _cameraName);
    if (isNull _camera) throw configNull;
    
    throw _camera;
} catch {
    _exception;
};
