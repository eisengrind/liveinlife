
private ["_unit"];
_unit = param [0, ObjNull, [ObjNull]];
if (isNull _unit) exitWith { false; };

removeHeadgear _unit;
removeGoggles _unit;
_unit removeItem (hmd _unit);
_unit removeItem (binocular _unit);

removeBackpack _unit;
removeVest _unit;
removeUniform _unit;

{
    _unit unlinkItem _x;
} forEach (assignedItems _unit);

{
    _unit removeWeapon _x;
} forEach (weapons _unit);
