
disableSerialization;
params [
	["_groupControl", controlNull, [controlNull]],
	["_index", -1, [0]],
	["_seperatorAmount", 0.002, [0]]
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
	if (_index <= -1) throw false;

	private _idcs = (_groupControl getVariable ["lilc_ui_controls", []]);
	if ((count _idcs) <= 0) throw false;
	if (_index >= (count _idcs)) throw false;

	private _selectedIDC = (_idcs select _index);
	ctrlDelete (_groupControl controlsGroupCtrl _selectedIDC);

	private _totalHeight = 0;
	for
	[
		{
			private _i = 0
		},
		{
			_i < _index
		},
		{
			_i = _i + 1;
		}
	]
	do
	{
		private _control = (_groupControl controlsGroupCtrl (_idcs select _i));
		_totalHeight = _totalHeight + ((ctrlPosition _control) select 3) + ((_seperatorAmount * safeZoneH) * ((0 max _i) min 1));
	};

	for "_i" from (_index + 1) to ((count _idcs) - 1) do
	{
		private _control = (_groupControl controlsGroupCtrl (_idcs select _i));
		private _position = (ctrlPosition _control);
		_control ctrlSetPosition [
			(_position select 0),
			(_seperatorAmount * safeZoneH) + _totalHeight
		];
		_control ctrlCommit 0;

		_totalHeight = _totalHeight + (_position select 3) + (_seperatorAmount * safeZoneH);
	};

	_idcs deleteAt _index;
	_groupControl setVariable ["lilc_ui_controls", _idcs];

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
