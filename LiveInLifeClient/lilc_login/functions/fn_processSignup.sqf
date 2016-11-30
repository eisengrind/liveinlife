
private [];
disableSerialization;

if (!dialog) exitWith {};
if (lilc_account_isRequesting) exitWith {};
lilc_account_isRequesting = true;

_ui = (findDisplay 1029);
_ctrlFirstname = (_ui displayCtrl 1030);
_ctrlLastname = (_ui displayCtrl 1031);
_ctrlGender = (_ui displayCtrl 1032);
_ctrlErrorfield = (_ui displayCtrl 1035);
_ctrlButtonSignup = (_ui displayCtrl 1033);
_ctrlButtonLogin = (_ui displayCtrl 1034);

try {
    _firstname = "";
    _lastname = "";
    _gender = -1;
    
    _ctrlErrorfield ctrlSetText "";
    _ctrlButtonLogin ctrlEnable false;
    _ctrlButtonSignup ctrlEnable false;
    _firstname = ctrlText _ctrlFirstname;
    _lastname = ctrlText _ctrlLastname;
    _genderCurSel = (lbCurSel _ctrlGender);
    _gender = (parseNumber (_ctrlGender lbData _genderCurSel));
    
    
    if (_firstname == "") then { throw 0; };
    if (_lastname == "") then { throw 1; };
    if (_gender == -1) then { throw 2; };
    
    lilc_account_requestError = -1;
    [[player, [_firstname, _lastname, _gender]], "lils_login_fnc_createAccountData"] call lilc_common_fnc_sendToServer;
    waitUntil { lilc_account_requestError != -1 };
    throw lilc_account_requestError;
} catch {
    lilc_account_requestError = -1;
    if (_exception == 8) then {
        lilc_accountInformation = nil;
        call lilc_login_fnc_getAccountData;
        waitUntil { (!isNil "lilc_accountInformation") };
        closeDialog 1029;
        sleep 0.02;
        call lilc_login_fnc_openLoginMenu;
    } else {
        _message = "";
        _message = switch (_exception) do {
            case 0: {"Du hast keinen Vornamen angegeben."};
            case 1: {"Du hast keinen Nachnamen angegeben."};
            case 2: {"Du hast kein Geschlecht ausgewählt."};
            case 3: {"Es wurde ein Fehlerhaftes Packet verschickt."};
            case 4: {"Du hast keinen Vornamen angegeben."};
            case 5: {"Du hast keinen Nachnamen angegeben."};
            case 6: {"Es wurde kein Geschlecht ausgewählt."};
            case 7: {"Du hast die maximale Anzahl an Benutzern erreicht."};
            default {""};
        };
        _ctrlErrorfield ctrlSetText _message;
        _ctrlButtonLogin ctrlEnable true;
        _ctrlButtonSignup ctrlEnable true;
    };
    
    sleep 1;
    lilc_account_isRequesting = false;
    lilc_account_requestError = -1;
};



