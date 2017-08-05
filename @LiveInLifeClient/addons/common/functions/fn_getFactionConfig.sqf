
/*
    Filename:
        fn_getFactionConfig.sqf
    Author:
        Vincent Heins
    Description:
        Description is not important - this file will be replaced by function lilc_factions_fnc_getFactionConfig
    Param(s):
        (_this select 0) : the faction ID : <SCALAR/INT>
    Result(s):
        the faction information : <ARRAY>
*/

private ["_factionID"];
_factionID = param [0, -1, [0]];
if (_factionID == -1) exitWith { ["", "", "", "", "", "", [], [], 0, 0, []]; };

_factions = [];

_factions = ((format["getNumber(_x >> 'id') == %1", _factionID]) configClasses (missionConfigFile >> "CfgFactions"));
if ((count _factions) <= 0) exitWith { ["", "", "", "", "", "", [], [], 0, 0, []]; };

_faction = _factions select 0;

_name = "";
_title = "";
_description = "";
_respawnName = "";
_color = "";
_defaultEquipment = [];
_defaultVehicles = [];
_initPath = "";
_globalGroup = 0;
_haveInterface = 0;

_name = configName(_faction);
_title = getText(_faction >> "title");
_description = getText(_faction >> "description");

private _respawnNames = [];
if (isArray(_faction >> "respawn")) then {
    _respawnNames = getArray(_faction >> "respawn");
} else {
    _respawnNames = [getText(_faction >> "respawn")];
};

_color = getArray(_faction >> "color");
_defaultEquipment = getArray(_faction >> "defaultEquipment");
_defaultVehicles = getArray(_faction >> "defaultVehicles");
_initPath = getText(_faction >> "init");
_globalGroup = getNumber(_faction >> "globalGroup");
_haveInterface = getNumber(_faction >> "haveInterface");
_paychecks = getArray(_faction >> "paychecks");

[_name, _title, _description, _respawnNames, _color, _initPath, _defaultEquipment, _defaultVehicles, _globalGroup, _haveInterface, _paychecks];

//Return: [0 - Name, 1 - Titel, 2 - Beschreibung, 3 - Respawnpunkt(static-pos), 4 - Farbe, 5 - Custom-Init, 6 - Standardausrüstung, 7 - Standardfahrzeuge, 8 - globale Gruppe?, 9 - besitzt Interface?, 10 - paychecks]
