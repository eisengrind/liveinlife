
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

	private _randomEncryption = ([16, true, true, true] call lilc_common_fnc_randomString);
	private _randomFrequency = (str ((round ((random [32, 50, 70]) * 10)) * 0.1));

	[(call TFAR_fnc_ActiveSWRadio), _randomFrequency] call TFAR_fnc_setSwFrequency;
	[(call TFAR_fnc_ActiveSWRadio)] call TFAR_fnc_setSwSpeakers;
	lilc_phones_encryption = _randomEncryption;

	[[player, _randomEncryption, _randomFrequency], "lilc_phones_fnc_startRemoteTFARCall", _target] call lilc_common_fnc_send;

	call TFAR_fnc_onSwTangentPressed;

	[
		"lilce_phones_channelLock",
		"OnSWchannelSet",
		{
			[(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setSwChannel;
		},
		player
	] call TFAR_fnc_addEventHandler;

	[
		"lilce_phones_radioSwitched",
		"OnSWChange",
		{
			player setVariable ["lilc_phones_calling", false, true];
		},
		player
	] call TFAR_fnc_addEventHandler;

	//private _timeElapsed = time;
	while
	{
		true
	}
	do
	{
		if (!([player] call lilc_common_fnc_isAlive) || !([_target] call lilc_common_fnc_isAlive)) exitWith {};
		if !(player getVariable ["lilc_phones_calling", false]) exitWith {};
		if !(_target getVariable ["lilc_phones_calling", false]) exitWith {};

		/*if ((_timeElapsed + 1) > time) then
		{
			_timeElapsed = _timeElapsed + 1;
			["lilce_phones_oneSecondElapsed", [_timeElapsed]] call CBA_fnc_localEvent;
		};*/
	};
	call TFAR_fnc_onSwTangentReleased;

	[
		"lilce_phones_oneSecondElapsed",
		"OnSWchannelSet",
		player
	] call TFAR_fnc_removeEventHandler;

	[
		"lilce_phones_radioSwitched",
		"OnSWChange",
		player
	] call TFAR_fnc_removeEventHandler;

	throw true;
}
catch
{
	lilc_phones_calling = false;
	player setVariable ["lilc_phones_calling", false, true];
	_exception;
};
