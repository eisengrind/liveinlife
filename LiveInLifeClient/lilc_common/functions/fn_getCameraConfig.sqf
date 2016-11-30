
private _cameraName = param [0, "", [""]];

try {
    if (_cameraName == "") throw configNull;
    
    private _camera = (missionConfigFile >> "CfgStaticCameras" >> _cameraName);
    if (isNull _camera) throw configNull;
    
    throw _camera;
} catch {
    _exception;
};
