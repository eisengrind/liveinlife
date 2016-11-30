/*
    Date:
        16.10.2016
    Author:
        Vincent Heins
    Description:
        Remove a key of a vehicle from player.
    Params:
        0 - Vehicle for the key ID - <OBJECT>
    Returns:
        true / false - Returns true if the key was removed; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/

try {
    private _vehicle = param [0, ObjNull, [ObjNull]];

    if (isNull _vehicle) throw false;
    if !([] call lilc_keys_fnc_have) throw false;

    private _vehicleID = _vehicle getVariable ["lilc_vehicleID", 0];
    if (_vehicleID <= 0) throw false;

    private _vehicleKeyClassname = format["lilci_key_%1_F", (typeOf _vehicle)];
    private _playerMagazinesAfter = (magazinesAmmo player);
    private _playerMagazinesBefore = _playerMagazinesAfter;

    {
        player removeMagazine (_x select 0);
    } forEach _playerMagazines;

    {
        if (((_x select 0) == (format["lilci_key_%1_F", _vehicleKeyClassname])) && ((_x select 1) == _vehicleID)) then {
            _playerMagazinesAfter deleteAt _forEachIndex;
        };
    } forEach _playerMagazinesBefore;

    { player addMagazine [(_x select 0), (_x select 1)]; } forEach _playerMagazinesAfter;
    if ((count (_playerMagazinesBefore - _playerMagazinesAfter)) <= 0) throw false;

    throw true;
} catch {
    _exception;
};
