
_vehicle = ObjNull;
if (vehicle player != player) then { _vehicle = vehicle player; } else { _vehicle = cursorTarget; };
if (isNull _vehicle) exitWith { false; };
if ((_vehicle distance player) > 10) exitWith { false; };

if (_vehicle isKindOf "House") then {

} else {
    if ([_vehicle] call lilc_inventory_fnc_haveKey) then {
        if ((locked _vehicle) >= 2) then {
            _vehicle lock false;
            hintSilent parseText "<img align='center' size='2.5' image='src\paa\icons\unlocked.paa'/><br/><t align='center' color='#19E33E'>Fahrzeug aufgeschlossen</t>";
            playSound "vehicleLock";
        } else {
            _vehicle lock true;
            hintSilent parseText "<img align='center' size='2.5' image='src\paa\icons\locked.paa'/><br/><t align='center' color='#E31919'>Fahrzeug abgeschlossen</t>";
            playSound "vehicleLock";
        };
    };
};

true;
