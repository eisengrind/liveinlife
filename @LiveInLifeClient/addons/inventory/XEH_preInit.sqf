#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(contextMenu_buttonAmount) = 0;
GVAR(contextMenu_currentContainer) = objNull;
GVAR(contextMenu_movingActive) = false;
GVAR(contextMenu_inventoryAccessWhenOpened) = false;

FUNC(unitInventoryMagazinesArray) = {
    private _mC = [[], []];
    {
        private _foundIndex = ARG_1(_mC,0) find _x;
        if (_foundIndex > -1) then {
            ARG_1(_mC,1) set [_foundIndex, ARG_2(_mC,1,_foundIndex) + 1];
        } else {
            ARG_1(_mC,0) pushBack _x;
            ARG_1(_mC,1) pushBack 1;
        };
    } forEach _this;
    private _magazines = [];
    {
        _magazines pushBack ["object", [
            ["classname", ARG_1(_x,0)],
            ["ammo", ARG_1(_x,1)],
            ["amount", ARG_2(_mC,1,_forEachIndex)]
        ]];
    } forEach ARG_1(_mC,0);
    ["array", _magazines];
};

FUNC(unitInventoryItemsArray) = {
    private _items = [];
    {
        _items pushBack ["object", [
            ["classname", _x],
            ["amount", ARG_2(_this,1,_forEachIndex)]
        ]];
    } forEach ARG_1(_this,0);
    ["array", _items];
};

ADDON = true;
