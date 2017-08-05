
params [
    ["_side", false, [false]],
    ["_data", [], [[]]]
];

try {
    if ((count _data) != 10) throw false;

    disableSerialization;
    private _ui = (findDisplay 1554);
    if (isNull _ui) then { createDialog "lilcm_pcard_personalcard"; _ui = (findDisplay 1554); };
    if (isNull _ui) throw false;

    private _uiButtonChange = (_ui displayCtrl 1570);
    private _uiBackground = (_ui displayCtrl 1555);

    private _uiLastname = (_ui displayCtrl 1556);
    private _uiForename = (_ui displayCtrl 1557);
    private _uiBirthdate = (_ui displayCtrl 1558);
    private _uiNationality = (_ui displayCtrl 1559);
    private _uiExpirationDate = (_ui displayCtrl 1560);
    private _uiSignature = (_ui displayCtrl 1561);
    private _uiPID = (_ui displayCtrl 1562);
    private _uiCity = (_ui displayCtrl 1564);
    private _uiCreationCity = (_ui displayCtrl 1563);
    private _uiParish = (_ui displayCtrl 1565);
    private _uiStreet = (_ui displayCtrl 1566);
    private _uiID1 = (_ui displayCtrl 1567);
    private _uiID2 = (_ui displayCtrl 1568);
    private _uiID3 = (_ui displayCtrl 1569);

    //Birthdate solution: DATE_FORMAT(NOW(), '%d.%m.%Y')
    if (_side) then { //Front
        _uiBackground ctrlSetText "\x\lilc\addons\pcard\ui\pcard_backgroundFront.paa";
        _uiButtonChange buttonSetAction format['[false, %1] call lilc_pcard_fnc_watchPersonalcard;', _data];
        
        _uiLastname ctrlShow true;
        _uiForename ctrlShow true;
        _uiBirthdate ctrlShow true;
        _uiNationality ctrlShow true;
        _uiExpirationDate ctrlShow true;
        _uiSignature ctrlShow true;
        _uiPID ctrlShow true;

        _uiCity ctrlShow false;
        _uiCreationCity ctrlShow false;
        _uiParish ctrlShow false;
        _uiStreet ctrlShow false;
        _uiID1 ctrlShow false;
        _uiID2 ctrlShow false;
        _uiID3 ctrlShow false;
        //[accountid, personalcardid, firstname, lastname, birthdate, authority, city, parish, street, streetnumber]
        _uiLastname ctrlSetStructuredText parseText format["<t shadow='0' color='#000000' size='1' font='TahomaB'>%1</t>", (_data select 3)];
        _uiForename ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.7'>%1</t>", (_data select 2)];
        _uiBirthdate ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.7'>%1</t>", (_data select 4)];
        _uiNationality ctrlSetStructuredText parseText "<t shadow='0' font='TahomaB' color='#000000' size='0.7'>TANOAN</t>";
        _uiExpirationDate ctrlSetStructuredText parseText "<t shadow='0' font='TahomaB' color='#000000' size='0.7'>12.12.2212</t>";
        _uiSignature ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.9' align='center'>%1 %2</t>", (_data select 2), (_data select 3)];
        _uiPID ctrlSetStructuredText parseText format["<t shadow='0' font='PuristaLight' size='0.8'>%1</t>", (_data select 1)];
    } else { //Back
        _uiBackground ctrlSetText "\x\lilc\addons\pcard\ui\pcard_backgroundBack.paa";
        _uiButtonChange buttonSetAction format['[true, %1] call lilc_pcard_fnc_watchPersonalcard;', _data];
        
        _uiLastname ctrlShow false;
        _uiForename ctrlShow false;
        _uiBirthdate ctrlShow false;
        _uiNationality ctrlShow false;
        _uiExpirationDate ctrlShow false;
        _uiSignature ctrlShow false;
        _uiPID ctrlShow false;

        _uiCity ctrlShow true;
        _uiCreationCity ctrlShow true;
        _uiParish ctrlShow true;
        _uiStreet ctrlShow true;
        _uiID1 ctrlShow true;
        _uiID2 ctrlShow true;
        _uiID3 ctrlShow true;

        _uiCity ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.7'>%1</t>", (_data select 6)];
        _uiCreationCity ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.7'>%1</t>", (_data select 5)];
        _uiParish ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.7'>%1</t>", (_data select 7)];
        _uiStreet ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.7'>%1 %2</t>", (_data select 8), (_data select 9)];
        _uiID1 ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.9'>IDD&lt;&lt;%1&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</t>", (_data select 1)];
        _uiID2 ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.9'>ABCDEFG&lt;%1&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<4</t>", (_data select 1)];
        _uiID3 ctrlSetStructuredText parseText format["<t shadow='0' font='TahomaB' color='#000000' size='0.9'>%1</t>", ([([(format["%1&lt;&lt;%2", (_data select 2), (_data select 3)]), 36, "<", true] call lilc_common_fnc_fillString), "<", "&lt;"] call KRON_Replace)];
    };
} catch {
    _exception;
};
