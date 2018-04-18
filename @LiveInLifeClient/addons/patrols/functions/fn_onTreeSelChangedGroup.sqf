
disableSerialization;
params [
    "_control",
    "_index"
];

private _value = tvValue [1002, _index];
private _data = tvData [1002, _index];

try {
    if (_value != 1) throw false;

    private _group = groupFromNetId _data;
    if (isNull _group || (count units _group) <= 0) throw false;

    ctrlShow [1601, !((group player) getVariable ["lilc_factionMainGroup", false])];
    ctrlShow [1602, ["patrols.create"] call lilc_permissions_fnc_have];

    ctrlShow [1005, true];
    ctrlShow [1006, true];
    ctrlShow [1007, true];
    ctrlShow [1008, true];
    ctrlShow [2100, true];
    ctrlEnable [2100, false];

    lbClear 2100;
    {
        private _i = lbAdd [2100, getText(_x >> "displayName")];
        lbSetPicture [2100, _i, getText(_x >> "texture")];
        lbSetData [2100, _i, configName _x];
        if ((_group getVariable ["lilc_groupIcon", ""]) == configName _x) then {
            lbSetCurSel [2100, (lbSize 2100) - 1];
        };
    } forEach ("true" configClasses (missionConfigFile >> "CfgUnitInsignia")) + ("true" configClasses (configFile >> "CfgUnitInsignia"));

    private _hasPermission = ["patrols.edit"] call lilc_permissions_fnc_have;

    ctrlShow [1603, _hasPermission];
    ctrlShow [1400, _hasPermission];
    ctrlShow [1401, _hasPermission];
    ctrlShow [1402, _hasPermission];
    ctrlEnable [2100, _hasPermission];
    ctrlShow [1009, !_hasPermission];
    ctrlShow [1010, !_hasPermission];
    ctrlShow [1011, !_hasPermission];

    if (_hasPermission) then {
        ctrlSetText [1400, _group getVariable ["lilc_groupDescription", ""]];
    } else {
        ctrlSetText [1009, toString (((_group getVariable ["lilc_groupDescription", ""]) splitString toString [10]) joinString "<br />")];
    };
    ctrlSetText [[1010, 1401] select _hasPermission, _group getVariable ["lilc_groupFrequency", ""]];
    ctrlSetText [[1011, 1402] select _hasPermission, groupId _group];

    ctrlShow [1600, !(player in units _group) && ["patrols.join"] call lilc_permissions_fnc_have];
} catch {
    if !(_exception) then {
        call lilc_patrols_fnc_patrolHideInfo;
    };
};
