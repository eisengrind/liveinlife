
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	systemChat str _this;
	private _ui = (ctrlParent _control);
	private _uiListItems = (_ui displayCtrl 1500);

	private _butcherName = (_ui getVariable ["lilc_butcher_butcherName", ""]);
	private _butcherConfig = ([_butcherName] call lilc_butcher_fnc_getButcherConfig);
	systemChat str _butcherConfig;
	if (isNull _butcherConfig) throw false;

	private _data = (_control lbData _index);
	if (_data == "") throw false;
	systemChat str _data;
	_data = (_data call BIS_fnc_objectFromNetId);

	systemChat str _data;
	if (isNull _data) throw false;
	systemChat str 1;
	if !(alive _data) then
	{
		["Das Fahrzeug ist nicht mehr vorhanden.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};
	systemChat str 2;
	private _classname = (typeOf _data);

	private _availableVehicles = ("true" configClasses (_butcherConfig >> "vehicles"));
	if (({ (_classname == (configName _x)) } count _availableVehicles) != 1) throw false;
	systemChat str 3;

	lbClear _uiListItems;
	{
		systemChat str _this;
		private _classname = (_x select 0);
		private _amount = (_x select 1);
		private _chance = (_x select 2);

		private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
		private _index = (_uiListItems lbAdd format["~%1x %2", ((round (_amount * (0 max _chance min 1))) max 1), getText(_itemConfig >> "displayname")]);
		_uiListItems lbSetPicture [_index, getText(_itemConfig >> "picture")];
	} forEach getArray(_butcherConfig >> "vehicles" >> _classname >> "results");

	throw true;
}
catch
{
	_exception;
};
