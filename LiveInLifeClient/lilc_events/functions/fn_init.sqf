
player addEventHandler ["Killed", { _this spawn lilc_events_fnc_onPlayerKilled; }];
player addEventHandler ["InventoryOpened", { [(_this select 1)] call lilc_inventory_fnc_onInventoryOpened; }];
player addEventHandler ["InventoryOpened", { [(_this select 1)] call lilc_events_fnc_onInventoryOpened; }];

lilc_player_tagsIndex = ["lilc_playerTags","onEachFrame","lilc_tags_fnc_onEachFrame"] call BIS_fnc_addStackedEventHandler;

[] spawn {
    waitUntil {!(isNull (findDisplay 46))};
    (findDisplay 46) displayAddEventHandler ["KeyDown", { (_this call lilc_events_fnc_onKeyDown); }];
};
