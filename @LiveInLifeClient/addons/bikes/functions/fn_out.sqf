
_position = param [0, [], [[]]];

try {
    if ((count _position) != 3) throw false;
    if !([50] call lilc_cash_fnc_have) then {
        hint "Du besitzt nicht genügend Bargeld.";
        throw false;
    };
    if (lilc_bikes_bikeRented) then {
        hint "Du hast bereits ein Fahrrad gemietet.";
        throw false;
    };

    private _handle = ["Du bist dabei ein Fahrrad für 10$ zu mieten.<br />Dabei zahlst du 40$ Kaution.<br />Du erhälst die Kaution wieder, sobald du das Fahrrad an dieser oder einer anderen Fahrradvermietung zurückgibst.<br /><br />Willst du das Fahrrad wirklich mieten?", "Fahrradvermietung", "Ja", "Nein"] call BIS_fnc_guiMessage;
    
    if (_handle) then {
        lilc_player_cash = lilc_player_cash - 50;
        _vehicle = "dbo_CIV_ol_bike" createVehicle _position;
        _vehicle setVariable ["lilc_bikes_isRented", true, true];
        _vehicle setVariable ["lilc_bikes_owner", (getPlayerUID player), true];
        lilc_bikes_bikeRented = true;

        hint "Fahrrad erfolgreich gemietet.";
        throw true;
    };

    throw false;
} catch {
    _exception;
};
