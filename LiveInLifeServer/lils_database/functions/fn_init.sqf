/*
    Modified:
        Vincent H.
    Description:
        Initialize the mysql connection of this server :)
    Parameters:
        -
*/
private ["_extDB2ConfigTitle"];
params [
    ["_extDB2_ID_name", "", [""]],
    ["_extDB2ConfigTitle", "", [""]]
];

if (_extDB2_ID_name == "") exitWith {};
if (_extDB2ConfigTitle == "") exitWith {};
if (isNil "lils_database_firstDB") then {
    lils_database_firstDB = _extDB2_ID_name;
};

_extDB2_ID = round(random(9999));
uiNamespace setVariable [_extDB2_ID_name, _extDB2_ID];
//_extDB2ConfigTitle = getText(configFile >> "CfgMaster" >> "extDB2" >> "extDB2ConfigTitle");
//diag_log str _extDB2ConfigTitle;
call compile format["lils_%1 = 0;", _extDB2_ID_name];
publicVariable format["lils_%1", _extDB2_ID_name];

try {
    _result = "extDB2" callExtension format["9:ADD_DATABASE:%1", _extDB2ConfigTitle];
    if(!(_result == "[1]")) then {
        throw "Error with Database Connection";
    };
    _result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES", _extDB2_ID, _extDB2ConfigTitle];

    if(!(_result == "[1]")) then {
        throw "Error with Database Connection";
    };
} catch {
    [(format["extDB2 has aborted setup: %1 (NAME: %2)", _exception, _extDB2_ID_name]), "lils_database"] call lilc_common_fnc_diag_log;
    call compile format["lils_%1 = 2;", _extDB2_ID_name, _exception];
    publicVariable format["lils_%1", _extDB2_ID_name];
};

if ((call compile format["lils_%1;", _extDB2_ID_name]) == 2) exitWith {};
[(format[" * extDB2 was loaded successful with ID %1 and NAME (%2)", _extDB2_ID, _extDB2_ID_name]), "lils_database"] call lilc_common_fnc_diag_log;

call compile format["lils_%1 = 1;", _extDB2_ID_name];
publicVariable format["lils_%1", _extDB2_ID_name];
