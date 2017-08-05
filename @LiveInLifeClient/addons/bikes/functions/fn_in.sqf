
_position = param [0, [], [[]]];

try {
    if ((count _position) != 3) throw false;

    private _bike = ObjNull;
    {
        if ((typeOf _x) == "dbo_CIV_ol_bike" && alive _x && !isNull _x && (_x getVariable ["lilc_bikes_isRented", false]) && (getPlayerUID player) == (_x getVariable ["lilc_bikes_owner", ""])) exitWith { _bike = _x; };
    } forEach nearestObjects [_position, [], 10];

    if (isNull _bike) then {
        hint "Von dir steht kein Mietfahrrad in der nähe.";
        throw false;
    };
    
    deleteVehicle _bike;
    lilc_player_cash = lilc_player_cash + 40;
    lilc_bikes_bikeRented = false;
    hint "Dein Fahrrad wurde zurückgenommen und du erhälst deine 40$ Kaution zurück.";
} catch {
    _exception;
};
