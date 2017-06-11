
private _factionID = (player getVariable ["lilc_factionID", -1]);

{
    private _object = _x;
    private _data = (_object getVariable ["lilc_disabled_door", []]);

    {
        private _currentFactionID = (_x select 0);
        private _availableIndexes = (_x select 1);

        {
            _object setVariable [
                (format["bis_disabled_Door_%1", _x]),
                (if (_currentFactionID == _factionID) then
                {
                    0;
                }
                else
                {
                    1;
                })
            ];
        } forEach _availableIndexes;
    } forEach _data;
} forEach allMissionObjects "All";

/*
Please enter the factionID to whitelist (whitelist means that whitelisted people CAN open a door).
If you do not insert this code below, the door will stay opened.

this setVariable [
    "lilc_disabled_door",
    [
        [<factionID>, [<index/es>, ...]]
    ]
];
*/
