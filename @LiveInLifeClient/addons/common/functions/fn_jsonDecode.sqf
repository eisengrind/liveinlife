
/*
{
"test1":2,
"test2":"asd",
"test3":false,
"test":
{
"innerTestScope":2,
"innerTestScope3":false
},
"test4":2,
"testasd":
[
0,
2,
{
"test2":false,
"test":2
}
]
}
*/

_string = '{"test1":2,"test2":"asd","test3":false,"test":{"innerTestScope":2,"innerTestScope3":false},"test4":2}';

compileHash = {
    params [
        ["_string", "", [""]]
    ];
}; // "xx": array/number/bool/object

compileArray = {
    params [
        ["_string", "", [""]]
    ];

    if ((count _string) < 2) exitWith { []; };
    if ((count _string) == 2 && _string != "[]") exitWith { []; };
    if !((_string select 0) == "[" && (_string select ((count _string) - 1)) == "]") exitWith { []; };

    _string = (_string select [1, ((count _string) - 2)]);

    
}; // "yy"

compileNumber = {
    params [
        ["_string", "", [""]]
    ];

    parseNumber _string;
}; // 2

compileBool = {
    params [
        ["_string", "", [""]]
    ];

    switch (_string) do
    {
        case "false":
        {
            false;
        };

        case "true":
        {
            true;
        };
        
        default
        {
            nil;
        };
    };
}; // false

compileObject = {
    params [
        ["_string", "", [""]]
    ];
}; // {}

_string = ((_string splitString " ") joinString ""); // trim string
_result = nil;

switch (_string select 0) do
{
    case "{":
    {
        _result = ([_string] call compileObject);
    };

    case "[":
    {
        _result = ([_string] call compileArray);
    };
};
