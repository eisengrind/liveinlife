
params [
	["_selectionName", "", [""]]
];

try
{
	disableSerialization;
	private _ui = (findDisplay 1630);
	private _exchangeConfig = ([lilc_exchange_currentExchange] call lilc_exchange_fnc_getExchangeConfig);
	if (isNull _exchangeConfig) throw false;

	switch (_selectionName) do
	{
		case "dashboard":
		{
			for "_i" from 25 to 29 do
			{
				ctrlShow [
					_i,
					(if (_i == 25) then
					{
						true;
					}
					else
					{
						false;
					})
				];
			};
			ctrlSetFocus (_ui displayCtrl 25);

			private _uiGroup = (_ui displayCtrl 25);
			private _uiGroupComboCategory = (_uiGroup controlsGroupCtrl 2100);
			private _uiGroupComboItemSelection = (_uiGroup controlsGroupCtrl 2101);
			private _uiGroupListNBoxBuys = (_uiGroup controlsGroupCtrl 1500);
			private _uiGroupListNBoxSells = (_uiGroup controlsGroupCtrl 1501);

			if (((lnbSize _uiGroupListNBoxBuys) select 1) != 3) then
			{
				_uiGroupListNBoxBuys lnbAddColumn 0.46;
				_uiGroupListNBoxBuys lnbAddColumn 0.7;
			};
			
			if (((lnbSize _uiGroupListNBoxSells) select 1) != 3) then
			{
				_uiGroupListNBoxSells lnbAddColumn 0.46;
				_uiGroupListNBoxSells lnbAddColumn 0.7;
			};

			lnbClear _uiGroupListNBoxBuys;
			lnbClear _uiGroupListNBoxSells;

			lbClear _uiGroupComboCategory;
			lbClear _uiGroupComboItemSelection;
			{
				private _index = (_uiGroupComboCategory lbAdd (getText(_x >> "displayName")));
				_uiGroupComboCategory lbSetData [_index, (configName _x)];
				_uiGroupComboCategory lbSetPicture [_index, getText(_x >> "picture")];
			} forEach ("true" configClasses (_exchangeConfig >> "categories"));
		};

		case "addOffer":
		{
			for "_i" from 25 to 29 do
			{
				ctrlShow [
					_i,
					(if (_i == 26) then
					{
						true;
					}
					else
					{
						false;
					})
				];
			};
			ctrlSetFocus (_ui displayCtrl 26);

			private _uiGroup = (_ui displayCtrl 26);
			private _uiComboType = (_uiGroup controlsGroupCtrl 2100);
			private _uiComboCategory = (_uiGroup controlsGroupCtrl 2101);
			
			(_uiGroup controlsGroupCtrl 1400) ctrlSetText "";
			(_uiGroup controlsGroupCtrl 1401) ctrlSetText "";
			lbClear (_uiGroup controlsGroupCtrl 1014);
			lbClear _uiComboType;
			private _index = (_uiComboType lbAdd "verkaufen"); //außenstehend: kaufen/buy
			_uiComboType lbSetValue [_index, 0];
			_index = (_uiComboType lbAdd "kaufen"); //außenstehend: verkaufen/sell
			_uiComboType lbSetValue [_index, 1];

			lbClear _uiComboCategory;
			{
				private _index = (_uiComboCategory lbAdd getText(_x >> "displayName"));
				_uiComboCategory lbSetData [_index, (configName _x)];
			} forEach ("true" configClasses (_exchangeConfig >> "categories"));
		};

		case "myOffers":
		{
			for "_i" from 25 to 29 do
			{
				ctrlShow [
					_i,
					(if (_i == 29) then
					{
						true;
					}
					else
					{
						false;
					})
				];
			};
			ctrlSetFocus (_ui displayCtrl 29);

			[[player, lilc_exchange_currentExchange], "lils_exchange_fnc_getMyOffers"] call lilc_common_fnc_sendToServer;
		};

		case "account":
		{
			for "_i" from 25 to 29 do
			{
				ctrlShow [
					_i,
					(if (_i == 27) then
					{
						true;
					}
					else
					{
						false;
					})
				];
			};
			ctrlSetFocus (_ui displayCtrl 27);

			[[player, lilc_exchange_currentExchange], "lils_exchange_fnc_getMyAccount"] call lilc_common_fnc_sendToServer;
		};

		case "wares":
		{
			for "_i" from 25 to 29 do
			{
				ctrlShow [
					_i,
					(if (_i == 28) then
					{
						true;
					}
					else
					{
						false;
					})
				];
			};
			ctrlSetFocus (_ui displayCtrl 28);

			[[player, lilc_exchange_currentExchange], "lils_exchange_fnc_getStorage"] call lilc_common_fnc_sendToServer;
		};
	};
}
catch
{
	_exception;
};
