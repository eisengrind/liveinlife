
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;
	
	disableSerialization;
	private _ui = (findDisplay 1302);
	if !(isNull _ui) throw true;

	if !(createDialog "lilcm_cellphone") throw false;

	_ui = (findDisplay 1302);
	if (isNull _ui) throw false;
	
	private _phoneConfig = (["cellphone"] call lilc_phones_fnc_getPhoneConfig);
	if (isNull _phoneConfig) throw false;

	ctrlShow [2300, true];

	private _onLoadScripts = (["onLoad", "ARRAY", [], _phoneConfig] call lilc_common_fnc_getSetting);
	{
		call compile _x;
	} forEach _onLoadScripts;

	ctrlShow [2300, false];

	private _menuConfigNames = (("true" configClasses (_phoneConfig >> "menus")) apply { (configName _x); });

	private _saveLastMenu = (["saveLastMenu", "BOOL", true, _phoneConfig] call lilc_common_fnc_getSetting);
	private _defaultMenu = (["defaultMenu", "STRING", "", _phoneConfig] call lilc_common_fnc_getSetting);
	if (_saveLastMenu) then {
		private _lastMenu = (profileNamespace getVariable ["lilc_phones_cellphone_lastMenu", ""]);
		
		if (_lastMenu == "" || !(_lastMenu in _menuConfigNames)) then
		{
			[_defaultMenu] call lilc_phones_fnc_selectMenu;
		}
		else
		{
			private _config = (_phoneConfig >> "menus" >> _lastMenu);
			["cellphone", (configName _config)] call lilc_phones_fnc_selectMenu;
		};
	}
	else
	{
		[_defaultMenu] call lilc_phones_fnc_selectMenu;
	};

	throw true;
}
catch
{
	_exception;
};
