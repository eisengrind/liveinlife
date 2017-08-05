
terminate lilc_ui_aircraftInfo;
if (isNull (uiNamespace getVariable ["lilc_ui_aircraftInfo", displayNull])) exitWith {};
[300, 0.01] call lilc_ui_fnc_fadeOutTitles;
