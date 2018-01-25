
private _name = _this;

disableSerialization;
private _ui = (findDisplay 2306);
if (isNull _ui) exitWith {};

//[vIClassname, displayName, [pName, aID, additional, grid, curTime]]
private _data = (_ui getVariable ["lilc_proofs_data_tmp", []]);
_ui setVariable ["lilc_proofs_data_tmp", (_data + [_name])];

private _pCfg = ([((_data select 2) select 0)] call lilc_proofs_fnc_getProofConfig);

private _timeFound = ((_data select 2) select 4);

(_ui displayCtrl 1004) ctrlSetStructuredText parseText format[
    "<t size='0.9'>Beweis %1 von %2</t><br /><t size='0.8'>Beweisfund-Zeitpunkt:<br />    %3<br />DNA-Vergleich:<br />    %4</t>",
    getText(_pCfg >> "displayName"),
    ((_data select 2) select 3),
    (format["%1-%2-%3 %4:%5:%6", (_timeFound select 5), (_timeFound select 4), (_timeFound select 3), (_timeFound select 3), (_timeFound select 2), (_timeFound select 0)]),
    _name
];

ctrlEnable [1500, true];
ctrlEnable [2100, true];
ctrlEnable [1600, true];
ctrlEnable [1601, true];
