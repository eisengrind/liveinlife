#include "script_component.hpp"

player addEventHandler [ "InventoryOpened", { _this call FUNC(onInventoryOpen); }];
