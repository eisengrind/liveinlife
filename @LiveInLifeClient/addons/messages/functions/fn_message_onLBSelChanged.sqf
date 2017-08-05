
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [-1]]
];

private _mI = (_control lbValue _index);
private _m = (lilc_messages_messages select _mI);

private _ui = (ctrlParent _control);
private _uiTextMessage = (_ui displayCtrl 1100);

_uiTextMessage ctrlSetStructuredText parseText format[
	"<t size='1'>Nachricht von %1:</t><br /><t size='0.9'>%2</t>",
	(_m select 1),
	(_m select 2)
];
