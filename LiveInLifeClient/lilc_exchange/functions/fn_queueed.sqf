
params [
	["_type", "", [""]],
	["_data", nil]
];

try
{
	disableSerialization;
	private _ui = (findDisplay 1630);

	switch (_type) do
	{
		case "buy_customer": //derjenige, welcher kauft
		{
			if (isNil "_data" || ((count _data) != 3)) then
			{
				[(format[
					"Der Ankauf konnte nicht abgeschlossen werden."
				]), "ERROR"] call lilc_ui_fnc_hint;

				throw false;
			};
			
			_data params [
				["_classname", "", [""]],
				["_amount", 0, [0]],
				["_price", 0, [0]]
			];

			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

			if ([player, _price] call lilc_cash_fnc_remove) then
			{
				[(format["Du hast erfolgreich %1 %2 für $%3 von der Börse gekauft.", _amount, getText(_itemConfig >> "displayName"), _price])] call lilc_ui_fnc_hint;
			}
			else
			{
				[(format["Du hast nicht genügend Geld - revidiere Angebot..."]), "ERROR"] call lilc_ui_fnc_hint;
				throw false;
			};
		};

		case "buy_seller": //derjenige, welcher items verkauft (angebotersteller)
		{
			_data params [
				["_classname", "", [""]],
				["_amount", 0, [0]],
				["_price", 0, [0]],
				["_unit", objNull, [objNull]]
			];

			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

			[(format[
				"Sie haben %1x %2 für $%3 an %4 auf der Börse verkauft.",
				_amount,
				getText(_itemConfig >> "displayName"),
				(_price * _amount),
				([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName)
			])] call lilc_ui_fnc_hint;
		};

		case "sell_customer": //derjenige, der etwas kaufen will (angebotersteller)
		{
			_data params [
				["_classname", "", [""]],
				["_amount", 0, [0]],
				["_price", 0, [0]],
				["_unit", objNull, [objNull]]
			];

			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

			[(format[
				"Sie haben für $%1 %2x %3 von %4 an der Börse erhalten.",
				(_price * _amount),
				_amount,
				getText(_itemConfig >> "displayName"),
				([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName)
			])] call lilc_ui_fnc_hint;
		};

		case "sell_seller": //derjenige, der verkauft
		{
			if (isNil "_data" || ((count _data) != 3)) then
			{
				[(format[
					"Der Verkauf konnte nicht abgeschlossen werden."
				]), "ERROR"] call lilc_ui_fnc_hint;
			};

			_data params [
				["_classname", "", [""]],
				["_amount", 0, [0]],
				["_price", 0, [0]]
			];

			for "_i" from 1 to _amount do
			{
				[player, _classname] call lilc_inventory_fnc_remove;
			};

			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

			[(format["Du hast %1 %2 erfolgreich für $%3 an der Börse verkauft.", _amount, getText(_itemConfig >> "displayName"), (_amount * _price)])] call lilc_ui_fnc_hint;
		};

		case "remove":
		{
			if ((count _data) == 1) then
			{
				["Der Eintrag wurde erfolgreich entfernt."] call lilc_ui_fnc_hint;
			}
			else
			{
				["Der Eintrag wurde nicht entfernt.", "ERROR"] call lilc_ui_fnc_hint;
			};
		};

		case "account_draw":
		{
			/*if (isNil "_data" || ((count _data) != 1)) then
			{
				[(format[
					"Das Geld konnte nicht abgehoben werden."
				]), "ERROR"] call lilc_ui_fnc_hint;
			};*/

			_data params [
				["_balance", 0, [0]]
			];

			[player, _balance] call lilc_cash_fnc_add;

			private _uiGroup = (_ui displayCtrl 27);
			(_uiGroup controlsGroupCtrl 1001) ctrlSetText "$0";
			["Du hast das Geld abgehoben."] call lilc_ui_fnc_hint;
		};

		case "remove_ware":
		{
			["wares"] call lilc_exchange_fnc_selectMenu;
			/*["Ware erfolgreich entfernt."] call lilc_ui_fnc_hint;
			["wares"] call lilc_exchange_fnc_selectMenu;*/
		};
	};
}
catch
{
	_exception;
};
