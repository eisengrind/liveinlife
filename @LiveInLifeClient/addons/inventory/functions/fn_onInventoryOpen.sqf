
params [
    ["_unit", objNull, [objNull]],
    ["_targetContainer", objNull, [objNull]]
];

lilc_inventory_currentContainer = (_this select 0);
lilc_inventory_primaryContainer = (_this select 1);
lilc_inventory_secondaryContainer = (_this select 2);

private _allowAccessToBackpack = (["inventory_backpackAccess", "BOOL", true] call lilc_common_fnc_getSetting);

if (_targetContainer isEqualTo player) exitWith { false; };
if (isNull _unit) exitWith { false; };
if (isNull _targetContainer) exitWith { false; };

private _result = false;
switch (true) do
{

    case (
        (
            ((locked _targetContainer) in [2, 3]) &&
            !([_targetContainer] call lilc_keys_fnc_have) &&
            ([_targetContainer, ["LandVehicle", "Air", "Ship"]] call lilc_common_fnc_isKindOf) &&
            !lilc_inventory_inventoryAccessWhenOpened
        ) ||
        (
            ((locked _targetContainer) in [2, 3]) &&
            ([_targetContainer, ["LandVehicle", "Air", "Ship"]] call lilc_common_fnc_isKindOf) &&
            lilc_inventory_inventoryAccessWhenOpened
        )
    ):
    {
        _result = true;
        ["Dieses Fahrzeug ist abgeschlossen.", "ERROR"] call lilc_ui_fnc_hint;
    };
    
    case (!_allowAccessToBackpack && (_targetContainer isKindOf "Bag_Base")):
    {
        _result = true;
        ["Du kannst nicht auf diesen Rucksack zugreifen", "ERROR"] call lilc_ui_fnc_hint;
    };
};


_result;
