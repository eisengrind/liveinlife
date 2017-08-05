
private _vehicle = param [0, objNull, [objNull]];

if (!alive _vehicle || isNull _vehicle) then {
    hint "Dein Fahrzeug konnte nicht ausgeparkt werden!";
} else {
    _vehicle lock true;
    player setDir (player getDir _vehicle);
    hint "Dein Fahrzeug wurde erfolgreich ausgeparkt.";
};
