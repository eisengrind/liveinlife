/*
    Date:
        16.10.2016
    Author:
        Vincent Heins
    Description:
        Checks if the player have the requested key.
    Params:
        0 - Vehicle where to get the key data - <OBJECT>
    Returns:
        true / false - Return true if player have the key; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/

try {
    private _vehicle = param [0, ObjNull, [ObjNull]];

    if (isNull _vehicle) throw false;

    _vehicleClassname = typeOf _vehicle;
    if (_vehicleClassname == "") throw false;

    private _vehicleID = _vehicle getVariable ["lilc_vehicleID", 0];
    if (_vehicleID <= 0) throw false;

    {
        if ((_x select 0) == format["lilci_key_%1_F", _vehicleClassname] && (_x select 1) == _vehicleID) throw true;
    } forEach (magazinesAmmo player);

    throw false;
} catch {
    _exception;
};
