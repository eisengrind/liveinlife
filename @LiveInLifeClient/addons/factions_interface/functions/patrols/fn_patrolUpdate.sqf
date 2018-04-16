
//lilc_groupFrequency = "";
//lilc_groupDescription = "";
//lilc_groupIcon = "";

private _factionID = player getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

tvClear 1002;
{
    if (_factionID == (_x getVariable ["lilc_factionID", -1])) then {
        private _i = -1;
        if (_x getVariable ["lilc_factionMainGroup", false]) then {
            _i = tvAdd [1002, [], "Main Faction Group"];
            tvSetData [1002, [_i], ""];
        } else {
            _i = tvAdd [1002, [], groupId _x];
            tvSetData [1002, [_i], str _x];
            tvSetPicture [1002, [_i], _x getVariable ["lilc_groupIcon", ""]];
            tvSetValue [1002, [_i], 1];
        };

        {
            private _rank = [_x getVariable ["lilc_factionRankID", 0]] call lilc_factions_interface_fnc_getRank;
            private _name = [_x] call lilc_login_fnc_formatName;
            private _j = tvAdd [1002, [], format[
                "%1%2",
                (if (isNil { _rank select 2; }) then {
                    "";
                } else {
                    format["%1. ", _rank select 2];
                }),
                _name
            ]];
            tvSetData [1002, [_i, _j], str _x];

            if (isNil { _rank select 4; }) then {
                tvSetPicture [1002, [_i, _j], _rank select 4];
            };
        } forEach units _x;
    };
} forEach allGroups;
