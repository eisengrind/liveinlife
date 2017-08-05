
private _house = param [0, ObjNull, [ObjNull]];
private _camera = ObjNull;

try {
    if (isNull _house) throw false;
    if !(lilc_housing_active) throw false;

    showCinemaBorder false;
    _camera = "camera" camCreate (position _house);
    _camera camSetRelPos [0, 40, 40];
    _camera camSetTarget _house;
    _camera camCommit 0;
    _camera cameraEffect ["internal","back"];
    100 cutText ["", "BLACK IN", 1];
} catch {
    _exception;
};

try {
    if (isNull _camera) throw false;
    while {true} do {
        if (isNull _camera) throw false;
        if !(lilc_housing_active) throw true;

        for [{_i = 0}, {_i < 361}, {_i = _i + 1}] do {
            if (isNull _camera) throw false;
            if !(lilc_housing_active) throw true;

            private _newCameraPos = (getPosASL _house);
            _newCameraPos set [0, ((_newCameraPos select 0) + (40 * cos(_i)))];
            _newCameraPos set [1, ((_newCameraPos select 1) + (40 * sin(_i)))];
            _newCameraPos set [2, 40];
            _newCameraPos = ASLToAGL _newCameraPos;
            _camera camSetPos _newCameraPos;
            _camera camCommit 0.05;
            sleep 0.05;
        };
    };
} catch {
    _camera cameraEffect ["terminate", "back"];
    camDestroy _camera;
    100 cutText ["", "BLACK IN", 0.01];
    _exception;
};
