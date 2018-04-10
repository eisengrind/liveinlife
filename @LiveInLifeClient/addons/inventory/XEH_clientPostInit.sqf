
lilc_inventory_contextMenu_buttonAmount = 0;
lilc_inventory_currentContainer = objNull;
lilc_inventory_movingActive = false;
lilc_inventory_inventoryAccessWhenOpened = false;

player addEventHandler [ "InventoryOpened", {
    (_this call lilc_inventory_fnc_onInventoryOpen);
}];
