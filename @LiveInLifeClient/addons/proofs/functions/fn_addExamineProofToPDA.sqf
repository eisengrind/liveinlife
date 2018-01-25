
disableSerialization;
private _ui = (findDisplay 2306);
if (isNull _ui) exitWith {};

private _cI = (lbCurSel 2100);
if (_cI <= -1) exitWith {};

private _category = (lbData [2100, _cI]);

//[vIClassname, displayName, [pName, aID, additional, grid, curTime]]
private _data = (_ui getVariable ["lilc_proofs_data_tmp", []]);
if ((count _data) <= 0) exitWith {};

private _pCfg = ([((_data select 2) select 0)] call lilc_proofs_fnc_getProofConfig);
private _timeFound = ((_data select 2) select 4);

private _title = (format["Beweis %1 von %2", getText(_pCfg >> "displayName"), ((_data select 2) select 3)]);
private _description = (format[
    "<t size=""0.8"">Beweisfund-Zeitpunkt:<br />    %1</t><br /><t size=""0.6"">Dieser Text wurde automatisch generiert.</t>",
    (format["%1-%2-%3 %4:%5:%6", (_timeFound select 5), (_timeFound select 4), (_timeFound select 3), (_timeFound select 3), (_timeFound select 2), (_timeFound select 0)])
]);

[
    [player, ((_data select 2) select 1), _category, _title, _description],
    "lils_pda_fnc_addEntry"
] call lilc_common_fnc_sendToServer;
