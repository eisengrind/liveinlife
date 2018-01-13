
try {
    private _item = call lilc_inventory_fnc_getContainerInventorySelectedItem;
    if ((count _item) <= 0) throw false;

    private _itemType = [(_item select 0)] call BIS_fnc_itemType;
    if ((count _itemType) <= 0 || (_itemType select 0) == "" || (_itemType select 1) == "") throw false;

    if ((_this select 1) > -1) throw true;
    throw false;
} catch {
    if (_exception) then {
        ctrlEnable [1355, true];
    } else {
        ctrlEnable [1355, false];
    };
};
