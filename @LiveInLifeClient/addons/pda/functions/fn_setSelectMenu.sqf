
disableSerialization;
params [
	["_dialogName", "", [""]],
	["_data", nil]
];

try
{
	if (isNil "_data") throw false;

	private _ui = (findDisplay 1642);
	if (isNull _ui) throw false;

	switch (_dialogName) do
	{
		case "search":
		{
			//_data -> [[AccountID, Firstname, Lastname], ...]

			lbClear 1500;
			{
				private _index = lbAdd [1500, (format["%1 %2", (_x select 1), (_x select 2)])];
				lbSetData [1500, _index, (str _x)];
			} forEach _data;

			if ((lbSize 1500) <= 0) then
			{
				lbAdd [1500, "Keine Einträge gefunden."];
			};
		};

		case "categories_entries":
		{
			//_data -> [[EntryID, Title], ...]
			ctrlSetText [1008, ""];

			private _ui_categories_TextDescription = (_ui displayCtrl 2300);
			_ui_categories_TextDescription ctrlSetStructuredText parseText "";

			lbClear 1501;
			{
				private _index = (lbAdd [1501, ([(_x select 1), 24] call lilc_common_fnc_trimString)]);
				lbSetValue [1501, _index, (_x select 0)];
			} forEach _data;
		};

		case "entries_entry":
		{
			private _uiTitle = (_ui displayCtrl 1008);
			private _uiGroup = (_ui displayCtrl 2300);
			private _uiGroupDescription = (_uiGroup controlsGroupCtrl 1100);
			
			_uiTitle ctrlSetText (_data select 0);
			_uiGroupDescription ctrlSetStructuredText parseText (_data select 1);
			private _groupPosition = (ctrlPosition _uiGroupDescription);
			_uiGroupDescription ctrlSetPosition [
				(_groupPosition select 0),
				(_groupPosition select 1),
				(_groupPosition select 2),
				(ctrlTextHeight _uiGroupDescription)
			];
			_uiGroupDescription ctrlCommit 0;
		};

		case "created":
		{
			//data -> true/false

			if (_data) then
			{
				["Eintrag erfolgreich hinzugefügt."] call lilc_ui_fnc_hint;
			}
			else
			{
				["Eintrag wurde nicht eingefügt.", "ERROR"] call lilc_ui_fnc_hint;
			};

			ctrlEnable [1606, true];
			["categories"] call lilc_pda_fnc_selectMenu;
		};

		case "categories_removed":
		{
			//data -> true or false (on completion)

			if (_data) then
			{
				["Eintrag erfolgreich entfernt."] call lilc_ui_fnc_hint;
			}
			else
			{
				["Eintrag konnte nicht entfernt werden."] call lilc_ui_fnc_hint;
			};

			ctrlEnable [1604, true];

			private _currentSelectionData = (lbData [2100, (lbCurSel 2100)]);
			[
				[player, (lilc_pda_currentAccountData select 0), _currentSelectionData],
				"lils_pda_fnc_getEntries"
			] call lilc_common_fnc_sendToServer;
		};
	};
}
catch
{
	_exception;
};
