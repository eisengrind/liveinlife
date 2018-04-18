
//hide buttons
ctrlShow [1603, false];
ctrlShow [1601, !((group player) getVariable ["lilc_factionMainGroup", false])];
ctrlShow [1600, false];
ctrlShow [1602, ["patrols.create"] call lilc_permissions_fnc_have];

//hide edits
ctrlShow [1400, false];
ctrlShow [1401, false];
ctrlShow [1402, false];
ctrlSetText [1400, ""];
ctrlSetText [1401, ""];
ctrlSetText [1402, ""];

//hide titles
ctrlShow [1005, false];
ctrlShow [1006, false];
ctrlShow [1007, false];
ctrlShow [1008, false];

//hide texts
ctrlShow [1009, false];
ctrlShow [1010, false];
ctrlShow [1011, false];
ctrlSetText [1009, ""];
ctrlSetText [1010, ""];
ctrlSetText [1011, ""];

lbClear 2100;
ctrlShow [2100, false];
