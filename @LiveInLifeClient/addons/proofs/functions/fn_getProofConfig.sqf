
params [
    ["_name", "", [""]]
];

private _cfg = (campaignConfigFile >> "CfgProofs" >> _name);
if (isNull _cfg) then {
    _cfg = (missionConfigFile >> "CfgProofs" >> _name);
};
if (isNull _cfg) then {
    _cfg = (configFile >> "CfgProofs" >> _name);
};
_cfg;
