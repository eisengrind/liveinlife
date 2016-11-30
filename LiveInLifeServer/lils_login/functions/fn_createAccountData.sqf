
private ["_errorType", "_unit", "_information"];
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_information", [], [[]]]
];
if (isNull _unit) exitWith {};

_errorType = -1;
try {
    private ["_uid", "_firstname", "_lastname", "_gender", "_result", "_accountID"];
    if ((count _information) != 3) then { throw 3; };
    if ((_information select 0) == "") then { throw 4; };
    if ((_information select 1) == "") then { throw 5; };
    if (((_information select 2) > 1) && ((_information select 2) < 0)) then { throw 6; };
    
    _uid = (getPlayerUID _unit);
    _firstname = _information select 0;
    _lastname = _information select 1;
    _gender = _information select 2;
    _result = [];
    _accountID = -1;
    
    _result = [format["SELECT COUNT(*) FROM ACCOUNT_DATA WHERE STEAM64ID = '%1'", _uid]] call lils_database_fnc_fetchObjects;
    _result = ((_result select 0) select 0);
    if (_result >= 5) then { throw 7; };

    [format["INSERT INTO ACCOUNT_DATA (ID, STEAM64ID, THIRST, HUNGER, CASH, ENDURANCE, GEAR, JOBS, NPCS, TIMELASTUSED, TIMELASTSAVED, TIMECREATE, TIMELASTLOGIN, NEW, LASTPOSITION, GENDER, `GROUP`, CHARISMA, FIRSTNAME, LASTNAME) VALUES (NULL, '%1', 100, 100, 0, 0, '""[[``,``,``,``],[],[],[],[],[[],[],[]],``]""', '""[]""', '""[]""', UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()), 1, '""[]""', '%2', '-1', 0, '""%3""', '""%4""')", _uid, _gender, _firstname, _lastname]] call lils_database_fnc_query;
    
    throw 8;
} catch {
    _errorType = _exception;
    [[_exception], "lilc_login_fnc_processSignupRequest", _unit] call lilc_common_fnc_send;
};

