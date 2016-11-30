
private ["_rankID"];
_rankID = param [0, 0, [0]];
if (_rankID <= 0) exitWith { [0, "", "", ""]; };
_info = [0, "", "", 0];

{
    if ((_x select 0) == _rankID) exitWith { _info = _x; };
} forEach lilc_factionsInterface_ranks;

_info; // [ID, NAME, TAG, FACTIONID, PRIORITY, INSIGNIA]
