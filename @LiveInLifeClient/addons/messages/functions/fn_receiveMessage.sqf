
params [
	["_accountID", 0, [0]],
	["_name", "", [""]],
	["_message", "", [""]]
];

lilc_messages_messages pushBack _this;
["Du hast eine neue Nachricht!"] call lilc_ui_fnc_hint;
