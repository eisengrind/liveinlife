
_shopName = param [0, "", [""]];
if (_shopName == "") exitWith { []; };

_availableClasses = [];
{
    if (isClass (missionConfigFile >> "CfgItemShops" >> _shopName >> _x)) then {
        _class = (missionConfigFile >> "CfgItemShops" >> _shopName >> _x);
        if ((count _class) > 0) then { _availableClasses pushBack [(configName _class), _class]; };
    };
} forEach ["weapons", "magazines", "goggles", "headgear", "items", "backpacks", "vests", "uniforms"];

if ((count _availableClasses) <= 0) exitWith { []; };

_availableClasses sort true;
_availableClasses;
