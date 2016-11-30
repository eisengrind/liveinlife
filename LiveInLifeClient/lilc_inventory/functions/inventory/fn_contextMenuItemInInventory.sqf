
_classname = param [0, "", [""]];
if (_classname == "") exitWith { false; };
if !(_classname in ((items player) + (assignedItems player) + (weapons player) + (magazineCargo player) + (
    if ((backpack player) == "") then {
        [];
    } else {
        [(backpack player)];
    }) + (
    if ((vest player) == "") then {
        [];
    } else {
        [(vest player)]
    }) + (
    if ((uniform player) == "") then {
        [];
    } else {
        [(uniform player)];
    }))) exitWith { false; };
true;
