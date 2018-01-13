
//"UnconsciousReviveMedic_B",  []
private _corpse = param [0, objNull, [objNull]];

try {
    if (isNil "lilc_medical_active") then { lilc_medical_active = false; };
    if (lilc_medical_active) throw false;
    if !(call lilc_medical_fnc_canReviveDeadUnit) throw false;

    lilc_action_interrupted = false;
    lilc_medical_active = true;
    lilc_medical_animationActive = false;
    [player, "UnconsciousReviveMedic_B"] call lilc_common_fnc_switchMove;
    player setPosASL AGLToASL (_corpse modelToWorld [-0.763184,0.0966797,0]);
    player setDir ((position player) getDir (position _corpse));

    createDialog "lilc_progressBar";
    
    disableSerialization;
    private _ui = (findDisplay 1320);
    private _uiProgressBar = (_ui displayCtrl 1321);
    private _uiProgressBarText = (_ui displayCtrl 1322);
    _uiProgressBar progressSetPosition 0;

    [[player], "lilc_medical_fnc_enableReviveOptions", _corpse] call lilc_common_fnc_send;

    private _timeout = (time + 30);
    while { _timeout >= time } do {
        if !(_corpse getVariable ["lilc_isDead", false]) exitWith {};
        if (lilc_action_interrupted) exitWith {};
        if !(alive player) exitWith {};
        _uiProgressBar progressSetPosition (1 - ((_timeout - time) / 30));
        _uiProgressBarText ctrlSetStructuredText parseText format["<t align='center' font='PuristaSemibold'>Belebe wieder (%1%2)</t>", (round (100 * (1 - ((_timeout - time) / 30)))), "%"];

        if ((animationState player) != "UnconsciousReviveMedic_B") then {
            [player, "UnconsciousReviveMedic_B"] call lilc_common_fnc_switchMove;
        };

        sleep 0.01;
    };

    closeDialog 1320;
    [player, ""] call lilc_common_fnc_switchMove;
    [[player], "lilc_medical_fnc_disableReviveOptions", _corpse] call lilc_common_fnc_send;

    throw false;
} catch {
    lilc_medical_active = false;
    _exception;
};
