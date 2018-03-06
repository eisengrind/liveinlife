
params [
    ["_jobAgent", "", [""]],
    ["_jobName", "", [""]]
];

if (isNull (findDisplay 2048)) exitWith {};

private _jobAgentCfg = missionConfigFile >> "CfgJobAgents" >> _jobAgent;
if (isNull _jobAgentCfg) exitWith {};

private _jobCfg = _jobAgentCfg >> "jobs" >> _jobName;
if (isNull _jobCfg) exitWith {};

disableSerialization;

private _locText = "";
{
    if (_forEachIndex > 0) then {
        _locText = format["%1, ", _locText];
    };
    _locText = format["%1%2", _locText, format["STR_lilc_job_agent_job_%1", _x] call BIS_fnc_localize];
} forEach getArray(_jobCfg >> "locations");
systemChat _locText;

private _itemsText = "";
{
    if (_forEachIndex > 0) then {
        _itemsText = format["%1, ", _itemsText];
    };

    private _amount = 0;
    if ((_x select 1) isEqualType []) then {
        _amount = round random (_x select 1);
    };
    if ((_x select 1) isEqualType 0) then {
        _amount = _x select 1;
    };

    if (_amount > 0) then {
        private _itemCfg = [_x select 0] call lilc_common_fnc_getClassnameConfig;
        _itemsText = format["%1%2x %3", _itemsText, _amount, getText(_itemCfg >> "displayName")];
    };
} forEach getArray(_jobCfg >> "items");
systemChat _itemsText;

private _price = 0;
if (isArray(_jobCfg >> "price")) then {
    _price = round random getArray(_jobCfg >> "price");
};
if (isNumber(_jobCfg >> "price")) then {
    _price = getNumber(_jobCfg >> "price");
};

private _uiGroupJobDescription = (((findDisplay 2048) displayCtrl 2300) controlsGroupCtrl 1100);
_uiGroupJobDescription ctrlSetStructuredText parseText format[
    "<t>Titel: %1</t><br /><t>Beschreibung:<br />%2</t><br /><br /><t>Lieferort(e): %3<t><br /><br /><t>Gegenstände:<br />%4</t><br /><br /><t>Verdienst: $%5</t>",
    getText(_jobCfg >> "displayName"),
    getText(_jobCfg >> "description"),
    _locText,
    _itemsText,
    _price
];
private _pos = ctrlPosition _uiGroupJobDescription;
_pos set [3, ctrlTextHeight _uiGroupJobDescription];
_uiGroupJobDescription ctrlSetPosition _pos;
_uiGroupJobDescription ctrlCommit 0;
