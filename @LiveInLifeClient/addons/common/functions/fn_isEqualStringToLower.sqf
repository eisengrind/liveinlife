
/*
    Filename:
        fn_isEqualStringToLower.sqf
    Author:
        Vincent Heins
    Description:
        Checks if the characters of two string are equal under the following rules: toLower xy .
    Param(s):
        (_this select 0) : string A : <STRING>
		(_this select 1) : string B : <STRING>
    Result(s):
        true = string A equals characters of string B; false != true : <BOOL>
*/

params [
    ["_stringA", "", [""]],
    ["_stringB", "", [""]]
];

try {
    if ((toLower _stringA) isEqualTo (toLower _stringB)) throw true;
    
    throw false;
} catch {
    _exception;
};
