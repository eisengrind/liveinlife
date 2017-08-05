
if ((lbCurSel 2100) <= -1) exitWith
{
	["Du hast keinen Empfänger ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
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
		"Du musst eine Nachricht eingeben.",
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
			[(format["<t size='1.2' align='left'>Absender</t><br /><t align='left'>    %1</t><br /><t size='1.2'>Nachricht:</t><br />%2", ([player] call lilc_login_fnc_formatName), _m]), "hint"],
			"lilc_common_fnc_message",
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
					"<t size='1.2' align='left'>Absender</t><br /><t align='left'>    %1</t><br /><t size='1.2'>Nachricht:</t><br />%2",
					getText(_fCfg >> "displayName"),
					_m
				]),
				"hint"
			],
			"lilc_common_fnc_message",
			-2
		] call lilc_common_fnc_send;
	};
};

["Nachricht erfolgreich verschickt."] call lilc_ui_fnc_hint; //TODO: localize

closeDialog 1306;
