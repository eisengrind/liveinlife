
private _message = param [0, "", [""]];

try {
    disableSerialization;
    private _ui = (uiNamespace getVariable ["lilc_ui_loading", displayNull]);
    if (isNull _ui) throw false;

    private _uiTextInfo = (_ui displayCtrl 1510);
    _uiTextInfo ctrlSetStructuredText parseText format["<t font='PuristaLight' size='1.4' align='center'>%1</t>", _message];
    throw true;
} catch {
    _exception;
};
