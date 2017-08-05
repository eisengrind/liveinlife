
params [
	["_target", objNull, [objNull]],
	["_encryption", "", [""]],
	["_frequency", "", [""]]
];

try
{
	if (lilc_phones_calling) throw false;
	lilc_phones_calling = true;
	
	if (isNull _target) throw false;
	if !([_target] call lilc_common_fnc_isAlive) throw false;
	if !([_target] call lilc_phones_fnc_isPhoneEquipped) throw false;

	[
		(call TFAR_fnc_ActiveSWRadio),
		_frequency
	] call TFAR_fnc_setSwFrequency;

	[
		(call TFAR_fnc_ActiveSWRadio)
	] call TFAR_fnc_setSwSpeakers;

	call TFAR_fnc_onSwTangentPressed;

	[
		"lilce_phones_channelLock",
		"OnSWchannelSet",
		{
			[(call TFAR_fnc_ActiveSWRadio)] call TFAR_fnc_setSwChannel;
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

	while
	{
		true
	}
	do
	{
		if (!([player] call lilc_common_fnc_isAlive) || !([_target] call lilc_common_fnc_isAlive)) exitWith {};
		if !(player getVariable ["lilc_phones_calling", false]) exitWith {};
		if !(_target getVariable ["lilc_phones_calling", false]) exitWith {};
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
