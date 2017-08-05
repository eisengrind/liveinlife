
try {
    disableSerialization;
    if (isNull (findDisplay 1024)) throw -1;

    private _firstname = (ctrlText 1038);
    private _lastname = (ctrlText 1039);

    if (_firstname == "") throw 0;
    if (_lastname == "") throw 1;

    if ((count _firstname) < 2) throw 2;
    if ((count _lastname) < 2) throw 3;

    private _index = (lbCurSel 1040);
    if (_index <= -1) throw 4;
    private _gender = (lbValue [1040, _index]);

    private _signBlacklist = '!""§$%&/()=?}][{^*+~#_.:,;<>|1234567890';
    _signBlacklist = (toArray _signBlacklist);
    if (({ _x in _signBlacklist } count (toArray _firstname)) > 0 || ({ _x in _signBlacklist } count (toArray _firstname)) > 0) throw 5;
    
    if !(call lilc_login_fnc_getProfiles) throw false;
    if ((count lilc_login_profiles) <= 0) then { endMission "END6"; };
    
    ["login"] call lilc_login_fnc_selectMenu;    
    throw true;
} catch {
    switch (_exception) do {
        case 0: { systemChat "Du musst einen Vornamen angeben."; };
        case 1: { systemChat "Du musst einen Nachnamen angeben."; };
        case 2: { systemChat "Du musst mindenstens 2 Buchstaben in deinem Vornamen haben."; };
        case 3: { systemChat "Du musst mindenstens 2 Buchstaben in deinem Nachnamen haben."; };
        case 4: { systemChat "Du hast kein Geschlecht ausgewählt."; };
        case 5: { systemChat "Du darfst folgende Zeichen nicht nutzen: ""!""§$%&/()=?}][{^*+~#_.:,;<>|1234567890."; };
        case 6: { systemChat "Es wurden keine Accounts gefunden!"; };
    };
};
