/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Function for receiving and displaying messages.
    Params:
        0 - The message to be displayed - <STRING>
        1 - The type to display the message - <STRING> - hint|hintSilent|hintC|systemChat|diag_log
    Returns:
        true / false - Returns true if message was displayed; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/

params [
    ["_message", "", [""]],
    ["_type", "", [""]]
];

try {
    if (isNil "_message") throw false;
    if (isNil "_type") throw false;

    _message = ([_message] call lilc_common_fnc_localize);

    switch (_type) do {
        case "hint": { hint parseText _message; };
        case "hintSilent": { hint parseText _message; };
        case "hintC": { hint parseText _message; };
        case "systemChat": { systemChat _message; };
        case "diag_log": { diag_log _message; };
        default {
            throw false;
        };
    };

    throw true;
} catch {
    _exception;
};
