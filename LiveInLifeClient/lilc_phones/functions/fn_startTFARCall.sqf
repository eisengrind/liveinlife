
params [
	["_target", objNull, [objNull]]
];

try
{
	if (lilc_phones_calling) throw false;
	lilc_phones_calling = true;
	player setVariable ["lilc_phones_calling", true, true];

	if (isNull _target) throw false;
	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !([_target] call lilc_phones_fnc_isPhoneEquipped) throw false;
	if ([_target] call lilc_phones_fnc_isCalling) throw false;

	private _randomCode = ([16, true, true, true] call lilc_common_fnc_randomString);
	private _randomFrequency = ((round ((random [32, 50, 70]) * 10)) * 0.1);

	[(call TFAR_fnc_ActiveSWRadio), (str _randomFrequency)] call TFAR_fnc_setSwFrequency;
	[(call TFAR_fnc_ActiveSWRadio)] call TFAR_fnc_setSwSpeakers;
	lilc_phones_encryption = _randomCode;

	[[player, _randomCode, _randomFrequency], "lilc_phones_fnc_startRemoteTFARCall", _target] call lilc_common_fnc_send;

	call TFAR_fnc_onSwTangentPressed;
	while
	{
		true
	}
	do
	{
		if (!([player] call lilc_common_fnc_isAlive) || !([_target] call lilc_common_fnc_isAlive)) exitWith {};
	};
	call TFAR_fnc_onSwTangentReleased;

	throw true;
}
catch
{
	lilc_phones_calling = false;
	player setVariable ["lilc_phones_calling", false, true];
	_exception;
};
