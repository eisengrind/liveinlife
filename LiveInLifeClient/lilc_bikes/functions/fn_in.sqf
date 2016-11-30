
_position = param [0, [], [[]]];

try {
    if ((count _position) != 3) throw false;

    private _bike = ObjNull;
    {
        if ((typeOf _x) == "dbo_CIV_ol_bike" && alive _x && !isNull _x && (_x getVariable ["lilc_bikes_isRented", false])) exitWith { _bike = _x; };
    } forEach nearestObjects [_position, [], 10];

    if (isNull _bike) then {
        hint "Es sind keine Mietfahrräder in der Nähe.";
        throw false;
    };
    
    deleteVehicle _bike;
    lilc_player_cash = lilc_player_cash + 90;
    lilc_bikes_bikeRented = false;
    hint "Dein Fahrrad wurde zurückgenommen und du erhälst deine 90$ Kaution zurück.";
} catch {
    _exception;
};
