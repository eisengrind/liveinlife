
private _dialogName = param [0, "", [""]];

try
{
	disableSerialization;

	private _ui = (findDisplay 1642);
	if (isNull _ui) throw false;

	private _allIDCs = [
		1400, 1600, 1500, 1601, 1002, // Search
		1003, 1004, 1005, 1602, 1603, 1604, 2100, 1006, 1501, 1007, 1008, 1009, 2300, 1605, //Categories
		1010, 1401, 2101, 1011, 1012, 1402, 1607, 1606 // Create
	];

	switch (_dialogName) do
	{
		case "search":
		{
			[
				[1400, 1600, 1500, 1601, 1002],
				_allIDCs
			] call lilc_ui_fnc_disableAndEnableControls;

			if (["pda.search.search"] call lilc_permissions_fnc_have) then
			{
				ctrlEnable [1600, true];
			}
			else
			{
				ctrlEnable [1600, false];
			};

			if (["pda.search.select"] call lilc_permissions_fnc_have) then
			{
				ctrlEnable [1601, true];
			}
			else
			{
				ctrlEnable [1601, false];
			};

			ctrlSetText [1400, ""];
			lbClear 1500;
		};

		case "categories":
		{
			[
				[1003, 1004, 1005, 1602, 1603, 1604, 2100, 1006, 1501, 1007, 1008, 1009, 2300, 1605],
				_allIDCs
			] call lilc_ui_fnc_disableAndEnableControls;

			ctrlSetText [1004, (format["%1 %2", (lilc_pda_currentAccountData select 1), (lilc_pda_currentAccountData select 2)])];
			ctrlSetText [1100, ""];
			ctrlSetText [1008, ""];

			lbClear 1501;
			lbClear 2100;
			{
				private _configName = (configName _x);
				private _displayName = getText(_x >> "displayName");
				if (_displayName != "") then
				{
					if ([(["pda", ([_configName, "read"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) then
					{
						private _index = lbAdd [2100, _displayName];
						lbSetData [2100, _index, _configName];
					};
				};
			} forEach ("true" configClasses (missionConfigFile >> "CfgPDA" >> "categories"));

			if ((lbSize 2100) > 0) then
			{
				lbSetCurSel [2100, 0];

				if ((lilc_pda_currentAccountData select 0) > 0) then
				{
					private _currentSelectionData = (lbData [2100, (lbCurSel 2100)]);
					lbClear 1501;
					private _index = lbAdd [1501, "lade Einträge..."];
					lbSetData [1501, ""];
					
					[[player, (lilc_pda_currentAccountData select 0), _currentSelectionData], "lils_pda_fnc_getEntries"] call lilc_common_fnc_sendToServer;
					
					if ([(["pda", ([_currentSelectionData, "write"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) then
					{
						ctrlShow [1602, true];
					}
					else
					{
						ctrlShow [1602, false];
					};

					if ([(["pda", ([_currentSelectionData, "remove"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) then
					{
						ctrlShow [1604, true];
					}
					else
					{
						ctrlShow [1604, false];
					};
				};
			};
		};

		case "create":
		{
			[
				[1010, 1401, 2101, 1011, 1012, 1402, 1607, 1606],
				_allIDCs
			] call lilc_ui_fnc_disableAndEnableControls;

			ctrlSetText [1401, ""];
			ctrlSetText [1402, ""];

			lbClear 2101;
			{
				private _configName = (configName _x);
				private _displayName = getText(_x >> "displayName");
				if (_displayName != "") then
				{
					if ([(["pda", ([_configName, "write"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) then
					{
						private _index = lbAdd [2101, _displayName];
						lbSetData [2101, _index, _configName];
					};
				};
			} forEach ("true" configClasses (missionConfigFile >> "CfgPDA" >> "categories"));
		};

		default
		{
			throw false;
		};
	};

	throw true;
}
catch
{
	_exception;
};
