
/*
    Filename:
        fn_selectMenu.sqf
    Author:
        Vincent Heins
    Description:
        A file with many dialogs in it.%
    Param(s):
        (_this select 0) : the name of the dialog : <STRING>
    Result(s):
        true = success; false != true : <BOOL>
*/

private _name = param [0, "", [""]];

try {
    disableSerialization;

    private _ui = (findDisplay 1510);
    if (isNull _ui) throw false;

    private _bankConfig = ([lilc_atm_currentBankName] call lilc_bank_fnc_getBankConfig);
    if (isNull _bankConfig) throw false;

    private _uiTitle = (_ui displayCtrl 1512);
    private _uiDescription = (_ui displayCtrl 1513);

    private _uiButton1 = (_ui displayCtrl 1522);
    private _uiButton2 = (_ui displayCtrl 1523);
    private _uiButton3 = (_ui displayCtrl 1524);
    private _uiButton4 = (_ui displayCtrl 1525);
    private _uiButton5 = (_ui displayCtrl 1526);
    private _uiButton6 = (_ui displayCtrl 1527);
    private _uiButton7 = (_ui displayCtrl 1528);
    private _uiButton8 = (_ui displayCtrl 1529);

    private _uiButton1Text = (_ui displayCtrl 1530);
    private _uiButton2Text = (_ui displayCtrl 1531);
    private _uiButton3Text = (_ui displayCtrl 1532);
    private _uiButton4Text = (_ui displayCtrl 1533);
    private _uiButton5Text = (_ui displayCtrl 1534);
    private _uiButton6Text = (_ui displayCtrl 1535);
    private _uiButton7Text = (_ui displayCtrl 1536);
    private _uiButton8Text = (_ui displayCtrl 1537);

    private _uiEditValue = (_ui displayCtrl 1538);
    private _uiEditValueBackground = (_ui displayCtrl 1539);
    private _uiListAccounts = (_ui displayCtrl 1540);
    private _uiSubTitle = (_ui displayCtrl 1541);

    if (isNil "lilc_atm_currentBankAccount") then {
        lilc_atm_currentBankAccount = [];
    };

    if ((count lilc_atm_currentBankAccount) > 0) then {
        _uiSubTitle ctrlSetStructuredText parseText format["<t shadow='0' font='PuristaLight' size='0.95'>$ %1</t>", (lilc_atm_currentBankAccount select 2)];
        if !(ctrlShown _uiSubTitle) then {
            _uiSubTitle ctrlShow true;
        };
    } else {
        _uiSubTitle ctrlSetStructuredText parseText "";
    };

    { _x ctrlEnable true; } forEach [_uiButton1, _uiButton2, _uiButton3, _uiButton4, _uiButton5, _uiButton6, _uiButton7, _uiButton8];

    _uiEditValue ctrlShow false;
    _uiEditValueBackground ctrlShow false;
    _uiListAccounts ctrlShow false;

    switch (_name) do {
        case "main": {
            _uiTitle ctrlSetStructuredText parseText format["<t shadow='0' align='left' size='1.2'>Übersicht - %1</t>", (lilc_atm_currentBankAccount select 0)];
            _uiDescription ctrlSetStructuredText parseText "";

            private _recruitment = getNumber(_bankConfig >> "playerRecruitPlayer") > 0 && lilc_atm_recruiter == 0;
            private _buts = [1, 5];

            if (_recruitment) then {
                _buts pushBack 7;
            };
            _buts call lilc_atm_fnc_showButtons;

            _uiButton1Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>Geld einzahlen</t>";
            _uiButton5Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Geld auszahlen</t>";
            _uiButton1 buttonSetAction '["deposit"] call lilc_atm_fnc_selectMenu;';
            _uiButton5 buttonSetAction '["disburse"] call lilc_atm_fnc_selectMenu;';

            if (_recruitment) then {
                _uiButton7Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Anwerber Prämie</t>";
                _uiButton7 buttonSetAction '["playerRecruitPlayer"] call lilc_atm_fnc_selectMenu;';
            };
        };

        case "main_wait": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Lade Informationen...</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Bitte warten Sie...</t>";

            [] call lilc_atm_fnc_showButtons;
        };

        case "main_failed": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Laden fehlgeschlagen</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Ihr Bankkonto konnte nicht geladen werden.</t>";

            [8] call lilc_atm_fnc_showButtons;

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Erneut versuchen</t>";
            _uiButton8 buttonSetAction 'call lilc_atm_fnc_getAccount;';
        };

        case "create": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Konto erstellen</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Wählen Sie eine der folgendenden Optionen aus:</t>";

            [1] call lilc_atm_fnc_showButtons;

            _uiButton1 buttonSetAction '[] call lilc_atm_fnc_createAccount;';
            _uiButton1Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>Konto erstellen</t>";

            _uiButton1 ctrlEnable true;
        };

        case "create_complete": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Konto erstellen</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Ihr Konto wurde erfolgreich erstellt.</t>";

            [8] call lilc_atm_fnc_showButtons;

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Hauptmenü</t>";
            _uiButton8 buttonSetAction '["main"] call lilc_atm_fnc_selectMenu;';
        };

        case "accounts": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Konten</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Bitte wählen Sie ihr gewünschtes Konto aus.</t>";

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Bankkonto erstellen</t>";
            _uiButton8 buttonSetAction 'call lilc_atm_fnc_createAccount;';
            [8] call lilc_atm_fnc_showButtons;
        };

        case "account_locked": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Konto gesperrt</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Ihr Konto ist gesperrt.</t>";

            _uiSubTitle ctrlShow false;
        };

        case "deposit": {
            _uiTitle ctrlSetStructuredText parseText format["<t shadow='0' align='left' size='1.2'>Geld einzahlen - %1</t>", (lilc_atm_currentBankAccount select 0)];
            _uiDescription ctrlSetStructuredText parseText "";

            [4, 7, 8] call lilc_atm_fnc_showButtons;

            _uiButton4Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>Alles Einzahlen</t>";
            _uiButton7Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Anderer Betrag</t>";
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";
            _uiButton7 buttonSetAction '["deposit_other"] call lilc_atm_fnc_selectMenu;';
            _uiButton4 buttonSetAction '[(player getVariable ["lilc_cash_balance", 0])] call lilc_atm_fnc_deposit;';
            _uiButton8 buttonSetAction '["main"] call lilc_atm_fnc_selectMenu;';
        };

        case "deposit_other":
        {
            _uiTitle ctrlSetStructuredText parseText format["<t shadow='0' align='left' size='1.2'>Geld einzahlen - %1</t>", (lilc_atm_currentBankAccount select 0)];
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Bitte geben Sie ihren gewünschten Betrag ein:</t>";

            [4, 8] call lilc_atm_fnc_showButtons;

            _uiButton4Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>Einzahlen</t>";
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";

            _uiButton4 buttonSetAction '[(parseNumber ctrlText 1538)] call lilc_atm_fnc_deposit;';
            _uiButton8 buttonSetAction '["deposit"] call lilc_atm_fnc_selectMenu;';

            _uiEditValue ctrlShow true;
            _uiEditValueBackground ctrlShow true;
            _uiEditValue ctrlSetText "";
        };

        case "deposit_completed": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Einzahlung erfolgreich!</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Sie haben erfolgreich ihren gewünschten Betrag eingezahlt!</t>";

            [8] call lilc_atm_fnc_showButtons;

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";
            _uiButton8 buttonSetAction '["deposit"] call lilc_atm_fnc_selectMenu;';
        };

        case "deposit_failed": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Einzahlung fehlgeschlagen</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Ihre Einzahlung war nicht erfolgreich.</t>";

            [8] call lilc_atm_fnc_showButtons;

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";
            _uiButton8 buttonSetAction '["deposit"] call lilc_atm_fnc_selectMenu;';
        };

        case "deposit_wait": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Zahle ein...</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Bitte warten Sie...</t>";

            [] call lilc_atm_fnc_showButtons;
        };

        case "disburse": {
            _uiTitle ctrlSetStructuredText parseText format["<t shadow='0' align='left' size='1.2'>Geld auszahlen - %1</t>", (lilc_atm_currentBankAccount select 0)];
            _uiDescription ctrlSetStructuredText parseText "";

            [1, 2, 3, 4, 5, 7, 8] call lilc_atm_fnc_showButtons;

            _uiButton1Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>10 $</t>";
            _uiButton2Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>50 $</t>";
            _uiButton3Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>100 $</t>";
            _uiButton4Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>1000 $</t>";
            _uiButton5Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>5000 $</t>";
            _uiButton7Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Anderer Betrag</t>";
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";

            _uiButton1 buttonSetAction '[10] call lilc_atm_fnc_disburse;';
            _uiButton2 buttonSetAction '[50] call lilc_atm_fnc_disburse;';
            _uiButton3 buttonSetAction '[100] call lilc_atm_fnc_disburse;';
            _uiButton4 buttonSetAction '[1000] call lilc_atm_fnc_disburse;';
            _uiButton5 buttonSetAction '[5000] call lilc_atm_fnc_disburse;';

            _uiButton7 buttonSetAction '["disburse_other"] call lilc_atm_fnc_selectMenu;';
            _uiButton8 buttonSetAction '["main"] call lilc_atm_fnc_selectMenu;';
        };

        case "disburse_other": {
            _uiTitle ctrlSetStructuredText parseText format["<t shadow='0' align='left' size='1.2'>Geld auszahlen - %1</t>", (lilc_atm_currentBankAccount select 0)];
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Bitte geben Sie ihren gewünschten Betrag ein:</t>";

            [4, 8] call lilc_atm_fnc_showButtons;
            _uiEditValue ctrlShow true;
            _uiEditValueBackground ctrlShow true;
            _uiEditValue ctrlSetText "";

            _uiButton4Text ctrlSetStructuredText parseText "<t align='right' shadow='0' color='#176a37' font='PuristaSemibold'>Auszahlen</t>";
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";
            _uiButton4 buttonSetAction '[(parseNumber ctrlText 1538)] call lilc_atm_fnc_disburse;';
            _uiButton8 buttonSetAction '["disburse"] call lilc_atm_fnc_selectMenu;';
        };

        case "disburse_failed": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Auszahlung fehlgeschlagen</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Ihre Auszahlung war nicht erfolgreich.</t>";

            [8] call lilc_atm_fnc_showButtons;

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";
            _uiButton8 buttonSetAction '["disburse"] call lilc_atm_fnc_selectMenu;';
        };

        case "disburse_completed": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Auszahlung erfolgreich</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Sie haben erfolgreich ihren gewünschten Betrag ausgezahlt!</t>";

            [8] call lilc_atm_fnc_showButtons;

            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Zurück</t>";
            _uiButton8 buttonSetAction '["disburse"] call lilc_atm_fnc_selectMenu;';
        };

        case "disburse_wait": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Zahle aus...</t>";
            _uiDescription ctrlSetStructuredText parseText "<t shadow='0' align='center' size='1.1'>Bitte warten Sie...</t>";

            [] call lilc_atm_fnc_showButtons;
        };

        case "playerRecruitPlayer": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Anwerber Prämie</t>";
            _uiDescription ctrlSetStructuredText parseText "";

            lbClear _uiListAccounts;
            _uiListAccounts ctrlShow true;
            {
                if (!isNull _x && isPlayer _x && ([_x] call lilc_common_fnc_isAlive)) then {
                    private _index = _uiListAccounts lbAdd (if ([_x] call lilc_login_fnc_unitIsKnown) then { ([_x, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName); } else { "Unbekannte Person"; });
                    _uiListAccounts lbSetValue [_index, _x getVariable ["lilc_accountID", 0]];
                };
            } forEach /*(*/(player nearEntities ["Man", 6])/* - [player])*/;

            [4, 8] call lilc_atm_fnc_showButtons;

            _uiButton4Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Abschicken</t>";
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Hauptmenü</t>";
            _uiButton4 buttonSetAction 'call lilc_atm_fnc_recruitment;';
            _uiButton8 buttonSetAction '["main"] call lilc_atm_fnc_selectMenu;';
        };

        case "playerRecruitPlayer_failed": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Anwerber Prämie</t>";
            _uiDescription ctrlSetStructuredText parseText "Anwerber Prämie fehlgeschlagen.";
            [8] call lilc_atm_fnc_showButtons;
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Hauptmenü</t>";
            _uiButton8 buttonSetAction '["main"] call lilc_atm_fnc_selectMenu;';
        };

        case "playerRecruitPlayer_complete": {
            _uiTitle ctrlSetStructuredText parseText "<t shadow='0' align='left' size='1.2'>Anwerber Prämie</t>";
            _uiDescription ctrlSetStructuredText parseText "Anwerber Prämie abgeschickt!";
            [8] call lilc_atm_fnc_showButtons;
            _uiButton8Text ctrlSetStructuredText parseText "<t align='left' shadow='0' color='#176a37' font='PuristaSemibold'>Hauptmenü</t>";
            _uiButton8 buttonSetAction '["main"] call lilc_atm_fnc_selectMenu;';
        };

        default { throw false; };
    };

    throw true;
} catch {
    _exception;
};
