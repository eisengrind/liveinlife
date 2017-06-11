
params [
	["_phoneType", "", [""]],
	["_phoneMenu", "", [""]]
];

try
{
	private _phoneConfig = ([_phoneType] call lilc_phones_fnc_getPhoneConfig);
	if (isNull _phoneConfig) throw false;

	private _menuConfig = (_phoneConfig >> "menus" >> _phoneMenu);
	if (isNull _menuConfig) throw false;

	private _lastMenu = (profileNamespace getVariable [(format["lilc_phones_%1_lastMenu", _phoneType]), ""]);
	
	private _lastMenuConfig = (_phoneConfig >> "menus" >> _lastMenu);
	if (!isNull _lastMenuConfig && _lastMenu != _phoneMenu) then
	{
		private _onUnload = (["onUnload", "STRING", "", _lastMenuConfig] call lilc_common_fnc_getSetting);
		call compile _onUnload;
	};

	private _onLoad = (["onLoad", "STRING", "", _menuConfig] call lilc_common_fnc_getSetting);
	/*private _result = nil;
	_result = */(call compile _onLoad);

	profileNamespace setVariable [(format["lilc_phones_%1_lastMenu", _phoneType]), _phoneMenu];
	saveProfileNamespace;

	throw true;
}
catch
{
	_exception;
};
