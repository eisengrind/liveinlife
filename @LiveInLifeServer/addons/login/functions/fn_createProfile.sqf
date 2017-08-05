
params [
    ["_unit", objNull, [objNull]],
    ["_firstname", "", [""]],
    ["_lastname", "", [""]],
    ["_gender", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_firstname == "") throw false;
    if (_lastname == "") throw false;
    if (_gender < 0 || _gender > 1) throw false;
    
    if ((count _firstname) < 2) throw false;
    if ((count _lastname) < 2) throw false;

    private _signBlacklist = '!""§$%&/()=?}][{^*+~#_.:,;<>|1234567890';
    _signBlacklist = (toArray _signBlacklist);
    if (({ _x in _signBlacklist } count (toArray _firstname)) > 0 || ({ _x in _signBlacklist } count (toArray _firstname)) > 0) throw false;
    
    [(format["INSERT INTO (ID, STEAM64ID, THIRST, HUNGER, CASH, ENDURANCE, GEAR, NPCS, NEW, LASTPOSITION, GENDER, GROUP, CHARISMA, FIRSTNAME, LASTNAME, COVERED_DISTANCE, STATUS, BANNED, RESPAWNING, VIRTUALINVENTORY) VALUES (NULL, '%1', '100', '100', '0', '0', '""[]""', '""[]""', '1', '""[]""', '%2', '-1', '0', '""%3""', '""%4""', '""[0, 0, 0, 0, 0, 0, 0]""', '0', '0', '0', '""[]""')", (getPlayerUID _unit), _gender, _firstname, _lastname])] call lils_database_fnc_query;

    [player] call lils_login_fnc_getProfiles;
} catch {
    _exception;
};
