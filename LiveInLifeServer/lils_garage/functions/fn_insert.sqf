
params [
    ["_unit", objNull, [objNull]],
    ["_classname", "", [""]],
    ["_isGarage", false, [false]]
];

try
{
    if (isNull _unit) throw [];
    if !(isPlayer _unit) throw [];
    if (_classname == "") throw [];

    private _unitUID = (getPlayerUID _unit);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw [];

    private _plate = ([_unit, _classname] call lils_garage_fnc_generatePlate);

    private _type = -1;
    _type = (switch (true) do {
        case (_classname isKindOf "Car"): {
            0;
        };
        
        case (_classname isKindOf "Plane"): {
            1;
        };
        
        case (_classname isKindOf "Helicopter"): {
            2;
        };

        case (_classname isKindOf "Truck"): {
            3;
        };
        
        case (_classname isKindOf "Boat"): {
            4;
        };
        //case (_classname isKindOf "Car"): {};
        
        case (_classname isKindOf "Bike"): {
            6;
        };
    });
    if (_type <= -1) throw [];

    [(format["INSERT INTO VEHICLES_DATA (ID, ACCOUNTID, STEAM64ID, CLASSNAME, ACTIVE, DEAD, POSITION, GEAR, DAMAGE, FUEL, `LOCK`, COLOR, TYPE, GARAGE, NICKNAME, PLATE) VALUES
    (NULL, '%1', '%2', '""%3""', '1', '0', '""[0, 0, 0]""', '""[]""', '""[]""', '1', '1', '""""', '%4', '""""', '""""', '%5')", _accountID, _unitUID, _classname, _type, _plate])] call lils_database_fnc_query;
    
    sleep 0.3;
    private _id = ([(format["SELECT ID, QUOTE(PLATE) FROM VEHICLES_DATA WHERE PLATE = '%1' AND ACCOUNTID = '%2' AND STEAM64ID = '%3' LIMIT 1", _plate, _accountID, _unitUID])] call lils_database_fnc_fetchObjects);
    
    if ((count _id) <= 0) throw [];
    if ((count (_id select 0)) <= 0) throw [];
    _id = (_id select 0);

    throw [(_id select 0), _accountID, _unitUID, (_id select 1)];
}
catch
{
    _exception;
};
