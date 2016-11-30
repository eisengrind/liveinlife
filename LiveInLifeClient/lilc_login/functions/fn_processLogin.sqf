
private ["_ui", "_firstname", "_lastname", "_buttonLogin", "_errorType", "_id", "_firstnameCurSel", "_textLastname", "_textFirstname"];

disableSerialization;
if (!dialog) exitWith {};
if (lilc_account_isRequesting) exitWith {};
lilc_account_isRequesting = true;

_ui = (findDisplay 1024);
_firstname = _ui displayCtrl 1025;
_buttonLogin = _ui displayCtrl 1027;
_errorField = _ui displayCtrl 1029;
_errorField ctrlSetText "";
_errorType = -1;

_buttonLogin ctrlEnable false;
_id = nil;

_firstnameCurSel = (lbCurSel _firstname);
_textFirstname = (_firstname lbText _firstnameCurSel);
lilc_player_ID = (_firstname lbData _firstnameCurSel);

try {
    if (isNil "_textFirstname" || (_textFirstname == "")) then { throw 0; };
    if ((parseNumber lilc_player_ID) <= -1) then { throw 1; };
} catch {
    _errorType = _exception;
    switch (_errorType) do {
        case 0: { _errorField ctrlSetText "<t size='0.7' color='#DB0000'>Das Benutzerkonto konnte nicht geladen werden.</t>"; };
        case 1: { _errorField ctrlSetText "<t size='0.7' color='#DB0000'>Die ID des Benutzer konnte nicht geladen werden.</t>"; };
    };
};

if (_errorType != -1) exitWith {
    sleep 2;
    _buttonLogin ctrlEnable true;
    lilc_account_isRequesting = false;
    lilc_account_requestError = -1;
};

lilc_player_ID = parseNumber lilc_player_ID;
lilc_account_isFinished = true;
closeDialog 1024;

///////////////////////////
//[] call lilc_account_fnc_cameraDestroy;
100 cutText ["", "BLACK", 0.5];
sleep 1;
lilc_login_camera cameraEffect ["terminate", "back"];
camDestroy lilc_login_camera;
100 cutText ["", "BLACK IN", 3];
///////////////////////////

lilc_account_isRequesting = false;
