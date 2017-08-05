
disableSerialization;
private _ui = (findDisplay 1302);
if (isNull _ui) exitWith {};

private _uiButtonOK = (_ui displayCtrl 2400);
private _uiButtonRight = (_ui displayCtrl 2402);
private _uiButtonLeft = (_ui displayCtrl 2403);

private _uiGroup = (_ui ctrlCreate ["lilc_phones_groupMainMenu", 2301]);

_uiButtonRight ctrlSetTooltip "Select right";
_uiButtonLeft ctrlSetTooltip "Select left";

_uiButtonRight ctrlSetText "Settings";
_uiButtonLeft ctrlSetText "Contacts";

_uiButtonRight ctrlAddEventHandler [
	"ButtonClick",
	{
		disableSerialization;
		private _ui = (findDisplay 1302);
		private _uiGroup = (_ui displayCtrl 2301);
		private _uiButtonRight = (_ui displayCtrl 2402);
		private _uiButtonLeft = (_ui displayCtrl 2403);

		private _currentState = (_uiGroup getVariable ["lilc_phones_cellphone_position", false]); //false = left, true = right

		if !(_currentState) then
		{
			_uiButtonLeft ctrlSetBackgroundColor [0, 0, 0, 0];
			_uiButtonRight ctrlSetBackgroundColor [1, 1, 1, 0.5];

			_uiGroup setVariable ["lilc_phones_cellphone_position", true];
		};
	}
];

_uiButtonLeft ctrlAddEventHandler [
	"ButtonClick",
	{
		disableSerialization;
		private _ui = (findDisplay 1302);
		private _uiGroup = (_ui displayCtrl 2301);
		private _uiButtonRight = (_ui displayCtrl 2402);
		private _uiButtonLeft = (_ui displayCtrl 2403);

		private _currentState = (_uiGroup getVariable ["lilc_phones_cellphone_position", false]); //false = left, true = right

		if (_currentState) then
		{
			_uiButtonRight ctrlSetBackgroundColor [0, 0, 0, 0];
			_uiButtonLeft ctrlSetBackgroundColor [1, 1, 1, 0.5];

			_uiGroup setVariable ["lilc_phones_cellphone_position", false];
		};
	}
];

_uiButtonOK ctrlAddEventHandler [
	"ButtonClick",
	{
		disableSerialization;
		private _ui = (findDisplay 1302);
		private _uiGroup = (_ui displayCtrl 2301);

		private _selection = (_uiGroup getVariable ["lilc_phones_cellphone_position", false]);
		[
			"cellphone",
			(if (_selection) then
			{
				"settings";
			}
			else
			{
				"contacts";
			})
		] call lilc_phones_fnc_selectMenu;
	}
];
