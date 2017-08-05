
/*[accountid, personalcardid, firstname, lastname, birthdate, authority, city, parish, street, streetnumber]*/
private _pcardData = param [0, [], [[]]];

try {
    if ((count _pcardData) != 7) throw false;

    private _accountID = (player getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    private _firstname = ((player getVariable ["lilc_identity", ["", "", ""]]) select 1);
    private _lastname = ((player getVariable ["lilc_identity", ["", "", ""]]) select 2);

    ["Personalausweis erfolgreich erstellt."] call lilc_ui_fnc_hint;
    [
        player,
        "lilcvi_personalcard_F",
        "testss Pcard",
        [
            _accountID,
            (_pcardData select 0),
            _firstname,
            _lastname,
            (_pcardData select 1),
            (_pcardData select 2),
            (_pcardData select 3),
            (_pcardData select 4),
            (_pcardData select 5),
            (_pcardData select 6)
        ]
    ] call lilc_virtualInventory_fnc_add;

    throw true;
} catch {
    _exception;
};
