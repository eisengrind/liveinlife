
params [
    ["_insignia", "", [""]]
];

if (_insignia == "") exitWith { ""; };

private _path = getText(missionConfigFile >> "CfgUnitInsignia" >> _insignia >> "texture");
if (_path != "") exitWith { _path; };

getText(configFile >> "CfgUnitInsignia" >> _insignia >> "texture");
