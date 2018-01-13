
params [
    ["_unit", objNull, [objNull]],
    ["_pcardData", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if ((count _pcardData) != 5) throw false;

    private _birthdate = (_pcardData select 0);
    if ((_pcardData select 1) <= 0) throw false;
    if ((_pcardData select 2) == "") throw false;
    if ((_pcardData select 3) == "") throw false;
    if ((_pcardData select 4) <= 0) throw false;

    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    _personalcardID = (format["%1%2%3",
        ([6, true, false, true] call lilc_common_fnc_randomString),
        ([6, true, false, false] call lilc_common_fnc_randomString),
        ([([(str _accountID), 4] call KRON_StrRight), 4, "0"] call lilc_common_fnc_fillString)
    ]);

    [(format["INSERT INTO PERSONALCARD_DATA (ID, ZIPCODE, STREET, STREETNUMBER, CITY, AUTHORITY, PARISH, BIRTHDATE, PID, ACCOUNTID) VALUES (NULL, '%1', '%2', '%3', '%4', '""Stadt Georgetown""', '""ST Georgetown""', '%5', '%6', '%7')", (_pcardData select 1), (_pcardData select 3), (_pcardData select 4), (_pcardData select 2), _birthdate, _personalcardID, _accountID])] call lils_database_fnc_query;
    sleep 0.1;
    
    [[[_personalcardID, _birthdate, "Stadt Georgetown", (_pcardData select 2), "ST Georgetown", (_pcardData select 3), (_pcardData select 4)]], "lilc_pcard_fnc_appendNewPersonalcard", _unit] call lilc_common_fnc_send;

    throw true;
} catch {
    _exception;
};

