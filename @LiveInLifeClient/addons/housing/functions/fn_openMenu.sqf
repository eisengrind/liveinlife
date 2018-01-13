
private _houseObject = param [0, ObjNull, [ObjNull]];

try {
    if (dialog && (!isNull (findDisplay 1228))) throw false;
    if (!isNull (findDisplay 1228)) then { closeDialog 0; };
    if (isNull _houseObject) throw false;
    if !((typeOf _houseObject) in lilc_housing_houses) throw false;

    100 cutText ["", "BLACK", 0.2];
    createDialog "lilc_housingMenu";

    _ui = (findDisplay 1350);
    if (isNull _ui) throw false;

    lilc_housing_active = true;
    [_houseObject] spawn lilc_housing_fnc_cameraFocus;
} catch {
    if !(_exception) then {
        100 cutText ["", "BLACK IN", 0.01];
    };
    _exception;
};
