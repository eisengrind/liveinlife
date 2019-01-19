/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Function for receiving and displaying messages.
    Params:
        (_this select 0) : Localized Text : <STRING>
    Returns:
        the localized text; otherwise it return the input text - <STRING>
    License:
        @LiveInLifeClient\license.txt
*/

private _text = param [0, "", [""]];

try {
    if (isNil "_text") throw "";
    if (isLocalized _text) then {
        throw (localize _text);
    };

    throw _text;
} catch {
    _exception;
};
