
if (ctrlVisible 1350) then {
    disableSerialization;
    private _uiDropDownMenu = ((findDisplay 602) displayCtrl 1350);
    if !([getMousePosition, (ctrlPosition _uiDropDownMenu)] call lilc_common_fnc_inUIArea) then {
        call lilc_inventory_fnc_disableMenu;
    };
};
