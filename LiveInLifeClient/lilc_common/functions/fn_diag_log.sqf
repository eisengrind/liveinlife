
params [
    ["_message", "", [""]],
    ["_modName", "", [""]],
    ["_type", 0, [0]]
];

_typeMessage = "";
switch (_type) do {
    case 1: { _typeMessage = "WARNING"; };
    case 2: { _typeMessage = "ERROR"; };
    default { _typeMessage = "NORMAL"; };
};

if !(_modName == "") then { _modName = format["[%1]", _modName]; };

[(format["[LiveInLifeClient]%1[%2s][%3]: %4", _modName, missionStart, _typeMessage, _message]), "diag_log"] call lilc_common_fnc_message;
true;
