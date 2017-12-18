
params [
	["_accountID", 0, [0]],
	["_name", "", [""]],
	["_message", "", [""]]
];

lilc_messages_messages pushBack _this;
[(["STR_lilc_messages_StringText_messageReceived"] call BIS_fnc_localize)] call lilc_ui_fnc_hint;
