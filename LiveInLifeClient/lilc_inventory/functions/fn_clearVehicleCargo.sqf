
private _vehicle = param [0, ObjNull, [ObjNull]];
if (isNull _vehicle || !alive _vehicle) exitWith {};

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
