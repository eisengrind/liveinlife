
private _factionID = player getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

if !(createDialog "lilc_factions_interface_patrols") exitWith {};

//clear tree view
tvClear 1002;

//hide buttons
ctrlShow [1600, false];
ctrlShow [1601, false];
ctrlShow [1602, false];
ctrlShow [1603, false];

//hide edits
ctrlShow [1400 ,false];
ctrlShow [1401 ,false];
ctrlShow [1402 ,false];
ctrlShow [2100 ,false];

//hide titles
ctrlShow [1005 ,false];
ctrlShow [1006 ,false];
ctrlShow [1007 ,false];
ctrlShow [1008 ,false];

//hide texts
ctrlShow [1009 ,false];
ctrlShow [1010 ,false];
ctrlShow [1011 ,false];

call lilc_factions_interface_fnc_patrolUpdate;
