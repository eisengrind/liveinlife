
params [
	["_groupControl", controlNull, [controlNull]],
	["_classRessource", "", [""]],
	["_data", [], [[]]],
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
	if (isNull _groupControl) throw controlNull;
	private _classRessourceConfig = (configFile >> _classRessource);
	if (isNull _classRessourceConfig) throw controlNull;

	private _idcs = (_groupControl getVariable ["lilc_ui_controls", []]);
	private _idc = 10000;

	while
	{
		true
	}
	do
	{
		if !(_idc in _idcs) exitWith {};
		_idc = _idc + 1;
	};

	private _ui = (ctrlParent _groupControl);

	private _totalHeight = 0;
	{
		private _control = (_groupControl controlsGroupCtrl _x);
		_totalHeight = _totalHeight + ((ctrlPosition _control) select 3);
	} forEach _idcs;

	_totalHeight = _totalHeight + ((_seperatorAmount * safeZoneH) * (count _idcs));

	private _posX = getNumber (_classRessourceConfig >> "x");

	private _newControl = (_ui ctrlCreate [_classRessource, _idc, _groupControl]);
	
	_newControl ctrlSetPosition [
		_posX,
		((_seperatorAmount * safeZoneH) + _totalHeight)
	];
	_newControl ctrlCommit 0;

	_idcs pushBack _idc;
	_groupControl setVariable ["lilc_ui_controls", _idcs];

	lilc_ui_controlGroupActive = false;
	throw _newControl;
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
