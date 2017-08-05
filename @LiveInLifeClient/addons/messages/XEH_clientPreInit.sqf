
/*
lilc_messages_messages = [
	[<accountID/int>, <senderName/string>, <message/string>],
	... n,
	[<accountID/int>, <senderName/string>, <message/string>]
];
*/
lilc_messages_messages = [];

[
	"Live In Life",
	"lilck_messages_openPhoneMenu",
	"Telefonmenu öffnen",
	{
		call lilc_messages_fnc_openMenu;
	},
	{

	},
	[61, [false, false, false]]
] call CBA_fnc_addKeybind;
