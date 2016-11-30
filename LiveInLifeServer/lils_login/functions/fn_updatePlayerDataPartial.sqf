
params [
    ["_type", -1, [-1]],
    ["_data", nil]
];
if (_type == -1) exitWith {};
if (isNil "_data") exitWith {};

_query = "";
switch (_type) do {
    case 0: {
        _query = format["UPDATE ACCOUNT_DATA SET NEW = '0' WHERE ID = '%1'", _data];
    };
};

[_query] spawn lils_database_fnc_query;
