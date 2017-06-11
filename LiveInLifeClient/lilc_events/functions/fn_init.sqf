
player addEventHandler ["Killed", { _this spawn lilc_events_fnc_onPlayerKilled; }];
player addEventHandler ["InventoryOpened", { [(_this select 1)] call lilc_inventory_fnc_onInventoryOpen; }];
player addEventHandler ["InventoryOpened", { [(_this select 1)] call lilc_events_fnc_onInventoryOpened; }];

player addEventHandler ["GetInMan", {
    if ([(_this select 2), ["Air", "Aircraft", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) then {
        call lilc_ui_fnc_enableAircraftInfo;
    };
}];

player addEventHandler ["GetOutMan", {
    if ([(_this select 2), ["Air", "Aircraft", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) then {
        call lilc_ui_fnc_disableAircraftInfo;
    };
}];

lilc_player_tagsIndex = ["lilc_playerTags", "onEachFrame", "lilc_tags_fnc_onEachFrame"] call BIS_fnc_addStackedEventHandler;

["Live In Life", "lilck_farmingKey", "Farming Key", { [] spawn lilc_farming_fnc_gatherZoneItems; }, {}, [157, [false, false, false]]] call CBA_fnc_addKeybind;
["Live In Life", "lilck_holsterKey", "Holster Weapon", { [player] call lilc_actions_fnc_holsterWeapon; }, {}, [68, [false, false, false]]] call CBA_fnc_addKeybind;
//["Live In Life", "lilck_placementUp", "Move object up", { /* TODO: add placement up function */ }, {}, [200, [false, false, false]]] call CBA_fnc_addKeybind;
//["Live In Life", "lilck_placementDown", "Move object down", { /* TODO: add placement down function */ }, {}, [208, [false, false, false]]] call CBA_fnc_addKeybind;
//["Live In Life", "lilck_placementPlace", "Place object", { /* TODO: add placement place function */ }, {}, [57, [false, false, false]]] call CBA_fnc_addKeybind;
["Live In Life", "lilck_useKey", "Use vehicle key", { if ((vehicle player) == player) then { [cursorObject] call lilc_keys_fnc_use; } else { [(vehicle player)] call lilc_keys_fnc_use; }; }, {}, [22, [false, false, false]]] call CBA_fnc_addKeybind;
["Live In Life", "lilck_openFactionDashboard", "Open faction dashboard", { call lilc_factionsInterface_fnc_openMenu; }, {}, [62, [false, false, false]]] call CBA_fnc_addKeybind;
["Live In Life", "lilck_useEarPlugs", "Use earplugs", { call lilc_actions_fnc_earPlugs; }, {}, [60, [false, false, false]]] call CBA_fnc_addKeybind;
//["Live In Life", "lilck_openSettingsMenu", "Open settings menu", { call lilc_settings_fnc_openMenu; }, {}, [59, [false, false, false]]] call CBA_fnc_addKeybind;
//["Live In Life", "lilck_openActionsMenu", "Open actions menu", { call lilc_interaction_fnc_openMenu; }, {}, [220, [false, false, false]]] call CBA_fnc_addKeybind;
