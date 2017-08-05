
lilc_inventory_contextMenu_buttonAmount = 0;
lilc_inventory_currentContainer = objNull;
lilc_inventory_movingActive = false;
lilc_inventory_inventoryAccessWhenOpened = false;

player addEventHandler [
	"InventoryOpened",
	{
		params [
			["_unit", objNull, [objNull]],
			["_targetContainer", objNull, [objNull]]
		];

		if (_targetContainer isKindOf "Man" && _targetContainer isEqualTo player) exitWith { false; };
		if (isNull _unit) exitWith { false; };
		if (isNull _targetContainer) exitWith { false; };

		private _result = false;
		if (
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
		) then
		{
			["Dieses Fahrzeug ist abgeschlossen.", "ERROR"] call lilc_ui_fnc_hint;
			_result = true;
		}
		else
		{
			_result = false;
		};

		_result;
	}
];

player addEventHandler [
	"InventoryOpened",
	{
		_this call lilc_inventory_fnc_onInventoryOpen;
	}
];
