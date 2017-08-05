
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _control) throw false;

	private _ui = (ctrlParent _control);
	if (isNull _ui) throw false;

	private _data = (_control lbData _index);
	private _punishmentConfig = ([_data] call lilc_prison_fnc_getPunishmentConfig);
	if (isNull _punishmentConfig) throw false;

	private _uiComboPunishmentTimes = (_ui displayCtrl 2101);
	lbClear _uiComboPunishmentTimes;

	{
		if !(_x == 0 && _x < -1) then
		{
			private _index = -1;
			
			if (_x <= -1) then
			{
				_index = (_uiComboPunishmentTimes lbAdd "Unbegrenzt"); //TODO: Localize
			}
			else
			{
				_index = (_uiComboPunishmentTimes lbAdd (format["%1", ([_x, "HH:MM:SS"] call BIS_fnc_secondsToString)]));
			};

			_uiComboPunishmentTimes lbSetValue [_index, _x];
		};
	} forEach getArray(_punishmentConfig >> "timeouts");

	throw true;
}
catch
{
	_exception;
};
