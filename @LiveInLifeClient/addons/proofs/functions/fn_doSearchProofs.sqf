
params [
    ["_object", objNull, [objNull]]
];

if !(createDialog "lilc_progressBar") exitWith {};

disableSerialization;
private _ui = (findDisplay 1320);
private _uiProgressBar = (_ui displayCtrl 1321);
private _uiProgressBarText = (_ui displayCtrl 1322);

private _time = time;
private _timeout = (random [20, 40, 80]);
lilc_action_interrupted = false;

while {
    (_time + _timeout) > time
} do {
    if ((_object distance player) > 10) exitWith {};
    if (lilc_action_interrupted) exitWith {};
    if ((vehicle player) != player) exitWith {};
    if ((animationState player) != "Acts_carFixingWheel") then {
        player playMoveNow "Acts_carFixingWheel";
    };

    private _t = ((time - _time) / _timeout);
    _uiProgressBar progressSetPosition _t;
    _uiProgressBarText ctrlSetStructuredText parseText format[
        (if (_object isKindOf "Man") then {
            "STR_lilc_proofs_Config_manSearching" call BIS_fnc_localize;
        } else {
            "STR_lilc_proofs_Config_vehicleSearching" call BIS_fnc_localize;
        }),
        (round (_t * 100)),
        "%"
    ];
};

if ((_object distance player) > 10) exitWith {
    ["Das zu untersuchende Subjekt ist nicht mehr in der Nähe.", "ERROR"] call lilc_ui_fnc_hint;
    player switchMove "";
    lilc_action_interrupted = "";
};

if (lilc_action_interrupted || (vehicle player) != player) exitWith {
    ["Die Durchsuchung wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
    player switchMove "";
    lilc_action_interrupted = false;
};

player switchMove "";
lilc_action_interrupted = false;
["Das Fahrzeug wurde erfolgreich durchsucht."] call lilc_ui_fnc_hint;
_object setDamage 0;
closeDialog 1320;

private _founds = [];

private _proofs = (_object getVariable ["lilc_proofs_proofs", ([[], []] call CBA_fnc_hashCreate)]);
{
    private _k = _x;
    private _v = ([_proofs, _k] call CBA_fnc_hashGet);

    private _kCfg = ([_k] call lilc_proofs_fnc_getProofConfig);

    private _a = getNumber(_kCfg >> "amount");
    private _c = 0;
    {
        if ([player, (_x select 0)] call lilc_inventory_fnc_haveItem) then {
            _c = _c + (_x select 1);
        };
    } forEach getArray(_kCfg >> "neededItems");

    if (_c <= 0) then {
        _c = getNumber(_kCfg >> "chance");
    };

    _c = (_c min 1);

    {
        for "_i" from 0 to (_a - 1) do {
            if ((random 1) <= _c) then {
                _founds pushBack [_k, (_x select 0), (_x select 1)];
            };
        };
    } forEach _v;
} forEach ([_proofs] call CBA_fnc_hashKeys);

if !(createDialog "lilcm_proofs_takeEvidence") exitWith {};

(findDisplay 2305) setVariable ["lilc_proofs_object", _object];

lbClear 1500;
if ((count _founds) <= 0) exitWith {
    lbAdd [1500, "Keine Beweise gefunden"];
};

{
    private _cfg = ([(_x select 0)] call lilc_proofs_fnc_getProofConfig);
    private _i = (lbAdd [1500, getText(_cfg >> "displayName")]);
    lbSetData [1500, _i, (str _x)];
    lbSetPicture [1500, _i, getText(_cfg >> "picture")];
} forEach _founds;
