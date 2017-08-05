
ctrlEnable [1581, false];
try {
    if ((lbCurSel 1574) <= -1 || (lbCurSel 1575) <= -1 || (lbCurSel 1576) <= -1) then {
        hint "Du hast nicht dein komplettes Geburtsdatum angegeben.";
        throw false;
    };
    private _birthdate = [(lbText[1574, (lbCurSel 1574)]), (lbData[1575, (lbCurSel 1575)]), (lbText[1576, (lbCurSel 1576)])];

    private _zipcode = (ctrlText 1577);
    private _city = (ctrlText 1578);
    private _street = (ctrlText 1579);
    private _streetnumber = (ctrlText 1580);

    if (_zipcode == "") then {
        ["Du hast keine Hausnummer angegeben.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    private _zipcode_int = ([_zipcode] call lilc_common_fnc_textToNumber);
    if (_zipcode_int <= 0) then {
        ["Du hast keine gültige Hausnummer angegeben.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };
    
    if ((count _zipcode) > 6) then {
        ["Die Postleitzahl kann maximal über 6 Stellen verfügen.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    if (_city == "") then {
        ["Du hast keine Stadt angegeben.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    if (_street == "") then {
        ["Du hast keine Straße angegeben.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    if (_streetnumber == "") then {
        ["Du hast keine Hausnummer angegeben.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    private _streetnumber_int = ([_streetnumber] call lilc_common_fnc_textToNumber);
    if (_streetnumber_int <= 0) then {
        ["Du hast keine gültige Hausnummer angegeben.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    if ((count _city) > 32) then {
        ["Du kannst für einen Stadtnamen maximal 32 Zeichen verwenden.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    if ((count _street) > 32) then {
        ["Du kannst für einen Straßennamen maximal 32 Zeichen verwenden.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    if ((count _streetnumber) > 6) then {
        ["Die Hausnummer kann nur maxmimal über 6 Stellen verfügen.", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };

    [[player, [(format["%1.%2.%3", (_birthdate select 0), (_birthdate select 1), (_birthdate select 2)]), _zipcode_int, _city, _street, _streetnumber_int]], "lils_pcard_fnc_createPersonalcard"] call lilc_common_fnc_sendToServer;

    closeDialog 1573;
    throw true;
} catch {
    _exception;
};
ctrlEnable [1581, true];
