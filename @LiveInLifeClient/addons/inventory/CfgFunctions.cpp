
class lilc_inventory
{
    class functions
    {
        file = "\x\lilc\addons\inventory\functions";
        class add {};
        class addMagazinesAmmoCargoStacked {};
        class addVehicle {};
        class canAdd {};
        class canRemoveMagCount {};
        class clearInventory {};
        class clearVehicleCargo {};
        class findItemByDisplayName {};
        class findOptionsItemByDisplayName {};
        class forceAdd {};
        class getBackpackInventory {};
        class getInventory {};
        class getItemInfo {};
        class getAllUnitItems {};
        class getItemWeight {};
        class getUniformInventory {};
        class getVehicleCargo {};
        class getVestInventory {};
        class groundItems {};
        class haveItem {};
        class haveSlot {};
        class inventoryOpen {};
        class itemCount {};
        class itemCountContainers {};
        class magazinesAmmoCargoStacked {};
        class onInventoryOpen {};
        class remove {};
        class removeMagCount {};
        class removeUniformCategory {};
        class setBackpackInventory {};
        class setInventory {};
        class setUniformInventory {};
        class setVehicleCargo {};
        class setVestInventory {};
        class updateVirtualInventory {};
    };
    
    class RscDisplayInventory
    {
        file = "\x\lilc\addons\inventory\functions\RscDisplayInventory";
        class disableMenu {};
        class getCurrentContainer {};
        class onInventoryOpened {};
        class onLBSelChanged {};
        class onMouseButtonDown {};
        class onMouseMoving {};
    };

    class itemMovement
    {
        file = "\x\lilc\addons\inventory\functions\itemMovement";
        class moveContainerItem {};
        class movePlayerItem {};
    };
};
