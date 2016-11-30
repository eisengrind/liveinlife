
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw ["", "", "", ""];
    // gender, firstname, lastname, plz, town, street, streetnumber, age, eyecolor, haircolor
    private _identity = _unit getVariable ["lilc_identity", []];
    if ((count _identity) <= 0) throw ["", "", "", ""];

    private _genderPrefix = "";
    _genderPrefix = if ((_identity select 0) == 1) then { "Frau"; } else { "Herr"; };

    private _rankPrefix = "";
    if ((_unit getVariable ["lilc_factionID", -1]) != -1) then {
        _rankPrefix = (([(_unit getVariable ["lilc_factionRankID", 0])] call lilc_factionsInterface_fnc_getRankInfo) select 2);
    };

    if (([_unit] call lilc_login_fnc_unitIsKnown) || _unit == player) then {
        throw [(_identity select 1), (_identity select 2), _genderPrefix, _rankPrefix];
    } else {
        throw ["Unbekannter Vorname", "Unbekannter Nachname", _genderPrefix, _rankPrefix];
    };
} catch {
    _exception;
};
