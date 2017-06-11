
//tcode town street streetnumber age eyecolor haircolor
// gender, firstname, lastname, plz, town, street, streetnumber, age, eyecolor, haircolor

private _pcardInfo = param [0, [], [[]]];

if ((count _pcardInfo) != 7) exitWith {};
_identity = player getVariable ["lilc_identity", []];

_identity set [3, (_pcardInfo select 0)];
_identity set [4, (_pcardInfo select 1)];
_identity set [5, (_pcardInfo select 2)];
_identity set [6, (_pcardInfo select 3)];
_identity set [7, (_pcardInfo select 4)];
_identity set [8, (_pcardInfo select 5)];
_identity set [9, (_pcardInfo select 6)];

player setVariable ["lilc_identity", _identity, true];
