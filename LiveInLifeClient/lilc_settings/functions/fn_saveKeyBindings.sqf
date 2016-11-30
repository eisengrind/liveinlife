
try {
    disableSerialization;
    _ui = (findDisplay 1330);
    if (isNull _ui) throw false;

    _uiButtonSave = _ui displayCtrl 1332;
    _uiButtonSave ctrlEnable false;
    
    saveProfileNamespace;
    sleep 3;

    if (isNull _ui) throw false;    
    _uiButtonSave ctrlEnable true;

    throw true;
} catch {
    _exception;
};
