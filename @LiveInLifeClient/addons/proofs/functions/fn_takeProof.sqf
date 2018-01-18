
private _cI = (lbCurSel 1500);
if (_cI <= -1) exitWith {};

private _data = (call compile (lbData [1500, _cI])); //proofName, aID, additional

if !([player, "lilci_evidenceBag_F"] call lilc_inventory_fnc_remove) exitWith {
    ["Du besitzt keine Beweistüte", "ERROR"] call lilc_ui_fnc_hint;
};

private _pCfg = ([(_data select 0)] call lilc_proofs_fnc_getProofConfig);
private _vI = getText(_pCfg >> "virtualItem");
private _vICfg = ([_vI] call lilc_virtualInventory_fnc_getVirtualItemConfig);

lbDelete [1500, _cI];

[
    player,
    _vI,
    format["%1 (%2)", getText(_vICfg >> "displayName"), (mapGridPosition player)],
    _data
] call lilc_virtualInventory_fnc_add;
[
    ((findDisplay 2305) getVariable ["lilc_proofs_object", objNull]),
    (_data select 0),
    (_data select 1),
    (_data select 2)
] call lilc_proofs_fnc_removeProof;

["Beweis eingesammelt."] call lilc_ui_fnc_hint;
