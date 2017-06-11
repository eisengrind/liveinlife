
params [
	["_selectionName", "", [""]],
	["_data", nil]
];

try
{
	if (isNil "lilc_exchange_loadItems") then
	{
		lilc_exchange_loadItems = false;
	};

	disableSerialization;
	private _ui = (findDisplay 1630);
	private _exchangeConfig = ([lilc_exchange_currentExchange] call lilc_exchange_fnc_getExchangeConfig);
	if (isNull _exchangeConfig) throw false;

	switch (_selectionName) do
	{
		case "dashboard":
		{
			private _uiGroupDashboard = (_ui displayCtrl 25);
			private _uiGroupBuys = (_uiGroupDashboard controlsGroupCtrl 1500);
			private _uiGroupSells = (_uiGroupDashboard controlsGroupCtrl 1501);

			lnbClear _uiGroupBuys;
			lnbClear _uiGroupSells;

			//[_uiGroupBuys] call lilc_ui_fnc_controlGroupClear;
			//[_uiGroupSells] call lilc_ui_fnc_controlGroupClear;

			/*
				0 id, 1 type, 2 amount, 3 price, 4 accountid, 5 firstname, 6 lastname
			*/

			{
				private _type = (_x select 1);
				
				private _control = controlNull;
				//_control = ([(if (_type == 0) then { _uiGroupBuys; } else { _uiGroupSells; }), "lilc_entry_exchange_DashboardGroupEntry"] call lilc_ui_fnc_controlGroupAdd);
				private _control = (if (_type == 0) then { _uiGroupBuys; } else { _uiGroupSells; });
				private _index = (_control lnbAddRow [(format["%1 %2", (_x select 5), (_x select 6)]), (format["%1", (_x select 2)]), (format["$%1", (_x select 3)])]);
				_control lnbSetValue [[_index, 2], (_x select 3)];
				_control lnbSetValue [[_index, 1], (_x select 2)];
				_control lnbSetValue [[_index, 0], (_x select 0)];

				/*
				private _uiGroupName = (_control controlsGroupCtrl 1003);
				private _uiGroupPrice = (_control controlsGroupCtrl 1001);
				private _uiGroupAmount = (_control controlsGroupCtrl 1002);

				_uiGroupName ctrlSetText format["%1 %2", (_x select 5), (_x select 6)];
				_uiGroupPrice ctrlSetText format["%1 $", (_x select 3)];
				_uiGroupAmount ctrlSetText format["%1", (_x select 2)];

				_control setVariable ["lilc_ui_data", (_x select 0)];
				_uiGroupPrice setVariable ["lilc_ui_data", (_x select 3)];*/
			} forEach _data;
		};

		case "addOffer":
		{
			_data params [
				["_classname", "", [""]]
			];

			if (_classname == "") throw false;

			["Das Angebot wurde erfolgreich hinzugefügt."] call lilc_ui_fnc_hint;
			["dashboard"] call lilc_exchange_fnc_selectMenu;
		};

		case "account":
		{
			_data params [
				["_balance", 0, [0]],
				["_lastActions", [], [[]]] /* classname, type, date */
			];

			private _uiGroup = (_ui displayCtrl 27);
			private _uiListLastTransactions = (_uiGroup controlsGroupCtrl 1500);

			(_uiGroup controlsGroupCtrl 1001) ctrlSetText format["$%1", _balance];
			
			lbClear _uiListLastTransactions;
			{
				private _itemConfig = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);
				private _index = (_uiListLastTransactions lbAdd format[
					"%1 - %2",
					(_x select 2),
					(switch (_x select 1) do
					{
						case 0:
						{
							format["%1 wurde gekauft", getText(_itemConfig >> "displayName")];
						};

						case 1:
						{
							format["%1 wurde verkauft", getText(_itemConfig >> "displayName")];
						};

						case 2:
						{
							format["%1 Angebot wurde entfernt", getText(_itemConfig >> "displayName")];
						};

						case 3:
						{
							format["%1 Angebot wurde hinzugefügt", getText(_itemConfig >> "displayName")];
						};
					})
				]);
			} forEach _lastActions;
		};

		case "storage":
		{
			private _uiGroup = (_ui displayCtrl 28);
			private _uiListThings = (_uiGroup controlsGroupCtrl 1500);

			lbClear _uiListThings;
			{
				private _itemConfig = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);

				private _index = (_uiListThings lbAdd format["%1x %2", (_x select 1), getText(_itemConfig >> "displayName")]);
				_uiListThings lbSetData [_index, (_x select 0)];
				_uiListThings lbSetValue [_index, (_x select 1)];
				_uiListThings lbSetPicture [_index, getText(_itemConfig >> "picture")];
			} forEach _data;

			if ((lbSize _uiListThings) <= 0) then
			{
				(_uiListThings lbAdd "Es sind keine Einträge verfügbar.");
			};
		};

		case "myOffers":
		{
			private _uiGroup = (_ui displayCtrl 29);
			private _uiGroupList = (_uiGroup controlsGroupCtrl 2301);

			/*
			0 - classname
			1 - amount
			2 - price
			3 - category
			4 - date
			5 - id
			*/

			[_uiGroupList] call lilc_ui_fnc_controlGroupClear;
			{
				private _control = ([_uiGroupList, "lilc_entry_exchange_MyOffersGroupEntry"] call lilc_ui_fnc_controlGroupAdd);
				
				private _controlTextClassname = (_control controlsGroupCtrl 1010);
				private _controlTextCategory = (_control controlsGroupCtrl 1011);
				private _controlTextAmount = (_control controlsGroupCtrl 1012);
				private _controlTextPrice = (_control controlsGroupCtrl 1013);
				private _controlTextDate = (_control controlsGroupCtrl 1014);
				private _controlButtonDelete = (_control controlsGroupCtrl 1200);

				private _itemConfig = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);
				_controlTextClassname ctrlSetText getText(_itemConfig >> "displayName");
				_controlTextCategory ctrlSetText getText(_exchangeConfig >> "categories" >> (_x select 3) >> "displayName");
				_controlTextAmount ctrlSetText (str (_x select 1));
				_controlTextPrice ctrlSetText (format["$%1", (_x select 2)]);
				_controlTextDate ctrlSetText (_x select 4);
				
				_controlButtonDelete ctrlAddEventHandler ["ButtonClick", (format["[%1] call lilc_exchange_fnc_myOffers_onButtonClick;", (_x select 5)])];
			} forEach _data;
		};

		case "myOffers_deleted":
		{

		};
	};
}
catch
{
	lilc_exchange_loadItems = false;
	_exception;
};
