
if !(isNull (uiNamespace getVariable ["lilc_ui_hint", displayNull])) exitWith {};
["lilc_ui_hint", "lilc_ui_hint", 0, true] call lilc_ui_fnc_fadeInTitles;

disableSerialization;
private _ui = (uiNamespace getVariable ["lilc_ui_hint", displayNull]);
{
    private _control = (_ui displayCtrl _x);
    _control ctrlSetFade 1;
    _control ctrlCommit 0;
} forEach [1611, 1614, 1617, 1620, 1623];
