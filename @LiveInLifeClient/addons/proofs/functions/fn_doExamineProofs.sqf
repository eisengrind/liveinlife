
disableSerialization;
private _ui = (findDisplay 2306);
if (isNull _ui) then {
    createDialog "lilcm_proofs_examineEvidence";
};

private _availableProofVItems = ((
    ("true" configClasses (configFile >> "CfgProofs")) +
    ("true" configClasses (missionConfigFile >> "CfgProofs"))
) apply {
    (getText(_x >> "virtualItem"));
});

(_ui displayCtrl 1601) ctrlSetEventHandler ["ButtonClick", "0 spawn lilc_proofs_fnc_examineProof;"];

/*
_viClassname,
_viName,
_viData ([])
*/
lbClear 1500;
{
    private _cfg = ([(_x select 0)] call lilc_virtualInventory_fnc_getVirtualItemConfig);
    private _i = (lbAdd [1500, (_x select 1)]);
    lbSetPicture [1500, _i, getText(_cfg >> "picture")];
    lbSetData [1500, _i, (str _x)];
} forEach ((player getVariable ["lilc_virtualInventory_inventory", []]) select {
    ((_x select 0) in _availableProofVItems);
});

lbClear 2100;
{
    private _cN = (configName _x);
    if ([(format["%1.add", _cN])] call lilc_permissions_fnc_have) then {
        private _i = (lbAdd [2100, getText(_x >> "displayName")]);
        lbSetData [2100, _i, _cN];
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgPDA" >> "categories"));
