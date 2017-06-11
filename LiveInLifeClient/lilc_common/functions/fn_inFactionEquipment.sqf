
/*
    Filename:
        fn_inFactionEquipment.sqf
    Author:
        Vincent Heins
    Description:
        Checks if an classname with optional color is in the declarations of the faction items/equipment.
    Param(s):
        (_this select 0) : the ID of the faction : <SCALAR/INT>
		(_this select 1) : the classname of the item : <STRING>
		(optional)(_this select 2) : the color of eg. weapons : <STRING>
    Result(s):
		the array index of the faction equipment array : <SCALAR/INT>
*/

params [
    ["_factionID", -1, [-1]],
    ["_classname", "", [""]],
    ["_skin", "", [""]]
];

try {
    if (_factionID <= -1) throw -1;
    if (_classname == "") throw -1;
    private _factionConfig = [_factionID] call lilc_factions_fnc_getFactionConfig;
    private _factionItems = getArray(_factionConfig >> "defaultEquipment");

    {
        if (_classname == (_x select 0) && _skin == (_x select 1)) throw _forEachIndex;
    } forEach _factionItems;

    throw -1;
} catch {
    _exception;
};
