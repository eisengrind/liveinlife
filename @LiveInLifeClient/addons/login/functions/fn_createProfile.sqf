
disableSerialization;
private _ui = (findDisplay 1024);
if (isNull _ui) exitWith {};

private _uiGroupCreateProfile = (_ui displayCtrl 2302);

try {
    (_uiGroupCreateProfile controlsGroupCtrl 1003) ctrlEnable false;
    (_uiGroupCreateProfile controlsGroupCtrl 1004) ctrlEnable false;

    private _uiEditFirstname = (_uiGroupCreateProfile controlsGroupCtrl 1400);
    private _uiEditLastname = (_uiGroupCreateProfile controlsGroupCtrl 1401);

    private _firstname = (ctrlText _uiEditFirstname);
    private _lastname = (ctrlText _uiEditLastname);

    if (_firstname == "") throw 0;
    if (_lastname == "") throw 1;

    if ((count _firstname) < 2) throw 2;
    if ((count _lastname) < 2) throw 3;

    private _uiComboSex = (_uiGroupCreateProfile controlsGroupCtrl 1500);
    private _index = (lbCurSel _uiComboSex);
    if (_index <= -1) throw 4;

    private _gender = (_uiComboSex lbValue _index);

    private _signBlacklist = '!""§$%&/()=?}][{^*+~#_.:,;<>|1234567890';
    _signBlacklist = (toArray _signBlacklist);
    if (({ _x in _signBlacklist } count (toArray _firstname)) > 0 || ({ _x in _signBlacklist } count (toArray _firstname)) > 0) throw 5;

    lilc_login_createProfile = true;
    [[player, _firstname, _lastname, _gender], "lils_login_fnc_createProfile"] call lilc_common_fnc_sendToServer;
} catch {
    lilc_login_createProfile = false;
    switch (_exception) do {
        case 0: { systemChat "Du musst einen Vornamen angeben."; };
        case 1: { systemChat "Du musst einen Nachnamen angeben."; };
        case 2: { systemChat "Du musst mindenstens 2 Buchstaben in deinem Vornamen haben."; };
        case 3: { systemChat "Du musst mindenstens 2 Buchstaben in deinem Nachnamen haben."; };
        case 4: { systemChat "Du hast kein Geschlecht ausgewählt."; };
        case 5: { systemChat "Du darfst folgende Zeichen nicht nutzen: ""!""§$%&/()=?}][{^*+~#_.:,;<>|1234567890."; };
        case 6: { systemChat "Es wurden keine Accounts gefunden!"; };
    };

    (_uiGroupCreateProfile controlsGroupCtrl 1003) ctrlEnable true;
    (_uiGroupCreateProfile controlsGroupCtrl 1004) ctrlEnable true;
};
