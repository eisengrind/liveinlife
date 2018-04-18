
/*
lilc_messages_messages = [
    [<accountID/int>, <senderName/string>, <message/string>],
    ... n,
    [<accountID/int>, <senderName/string>, <message/string>]
];
*/
lilc_messages_messages = [];

[
    "LiveInLife",
    "lilck_messages_openPhoneMenu",
    ("STR_lilc_messages_ActionTitle_openMenu" call BIS_fnc_localize),
    {
        call lilc_messages_fnc_openMenu;
    },
    {

    },
    [61, [false, false, false]]
] call CBA_fnc_addKeybind;
