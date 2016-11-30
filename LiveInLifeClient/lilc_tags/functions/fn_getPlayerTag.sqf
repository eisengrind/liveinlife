
private [];
params [
    ["_object", ObjNull, [ObjNull]]
];
if (isNull _object) exitWith { "Null!"; };

_identity = _object getVariable ["lilc_identity", []];
if ((count _identity) < 0) exitWith { "Null?"; };

_factionID = -1;
_factionColor = "";

_factionID = (group _object) getVariable ["lilc_factionID", -1];
_factionColor = (group _object) getVariable ["lilc_factionColor", ""];

_rank = ""; //_rank = (([(_object getVariable ["factionRankID", 0])] call factionsInterface_fnc_getRankInfo) select 2);
_prefix = "";
if (_rank == "") then {
    _prefix = if ((_identity select 0) <= 0) then { "Herr "; } else { "Frau "; };
} else {
    _rank = format["%1.", _rank];
};
if (isNil "_prefix") then { _prefix = ""; };

private _firstname = _identity select 1;
private _lastname = _identity select 2;

_name = format["%1 %2", _firstname, _lastname];

if (_factionID != -1) then {
    switch (_factionID) do {
        case 0: {
            _name = _lastname;
        };

        default {
            _name = _lastname;
        };
    };
};

format["<t color='%1' align='center' size='1.2'>%2%3%4</t>", _factionColor, _prefix, _rank, _name];
