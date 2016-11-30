
if !(dialog) exitWith {};

[0.5] call lilc_ui_fnc_fadeInBlack;
sleep 0.5;
[player, lilc_shops_playerInventory] call lilc_inventory_fnc_setInventory;
lilc_shops_playerInventory = [];
closeDialog 1201;
lilc_shops_uniformCamera cameraEffect ["terminate", "back"];
camDestroy lilc_shops_uniformCamera;
[1] call lilc_ui_fnc_fadeOutBlack;
