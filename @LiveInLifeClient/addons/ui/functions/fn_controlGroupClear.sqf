
disableSerialization;
params [
	["_groupControl", controlNull, [controlNull]]
];

try
{
	if (isNil "lilc_ui_controlGroupActive") then
	{
		lilc_ui_controlGroupActive = false;
	};
	if (lilc_ui_controlGroupActive) throw 0;
	lilc_ui_controlGroupActive = true;
	if (isNull _groupControl) throw false;
	private _idcs = (_groupControl getVariable ["lilc_ui_controls", []]);
	if ((count _idcs) <= 0) throw true;

	{
		ctrlDelete (_groupControl controlsGroupCtrl _x);
	} forEach _idcs;

	(_groupControl setVariable ["lilc_ui_controls", []]);

	lilc_ui_controlGroupActive = false;
	throw true;
}
catch
{
	if !(_exception isEqualType 0) then
	{
		lilc_ui_controlGroupActive = false;
		_exception;
	}
	else
	{
		false;
	};
};
