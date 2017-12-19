
if ((lbCurSel 2100) <= -1) exitWith
{
	[("STR_lilc_messages_StringText_noReceiverSelected" call BIS_fnc_localize), "ERROR"] call lilc_ui_fnc_hint;
};

private _d = (lbData [2100, (lbCurSel 2100)]);
_d = (call compile _d);

if ((count _d) <= 0) exitWith {};

private _t = (_d select 0);
private _id = (_d select 1);

if (_id <= 0 && !(_t in [0, 1, 2])) exitWith {};
if (_id <= -1 && !(_t in [0, 1, 2])) exitWith {};

private _m = (ctrlText 1400);
if ((count _m) <= 0) exitWith
{
	[
		("STR_lilc_messages_StringText_noMessageText" call BIS_fnc_localize),
		"ERROR"
	] call lilc_ui_fnc_hint;
};

_m = (_m splitString toString [10]);
_m = (_m joinString "<br />");

switch (_t) do
{
	case 0:
	{
		[
			[
				(format[
					("STR_lilc_messages_StringText_messageFormatFaction" call BIS_fnc_localize),
					([player] call lilc_login_fnc_formatName),
					_m
				])
			],
			"lilc_ui_fnc_hint",
			(playableUnits select { ((_x getVariable ["lilc_factionID", -1]) isEqualTo _id); })
		] call lilc_common_fnc_send;
	};

	case 1:
	{
		[
			[(player getVariable ["lilc_accountID", 0]), ([player] call lilc_login_fnc_formatName), _m],
			"lilc_messages_fnc_receiveMessage",
			((playableUnits - [player]) select { ((_x getVariable ["lilc_accountID", 0]) isEqualTo _id); })
		] call lilc_common_fnc_send;
	};
	
	case 2:
	{
		private _fCfg = ([_id] call lilc_factions_fnc_getFactionConfig);
		[
			[
				(format[
					("STR_lilc_messages_StringText_messageFormatGlobal" call BIS_fnc_localize),
					getText(_fCfg >> "displayName"),
					_m
				])
			],
			"lilc_ui_fnc_hint",
			-2
		] call lilc_common_fnc_send;
	};
};

[("STR_lilc_messages_StringText_messageSent" call BIS_fnc_localize)] call lilc_ui_fnc_hint;

closeDialog 1306;
