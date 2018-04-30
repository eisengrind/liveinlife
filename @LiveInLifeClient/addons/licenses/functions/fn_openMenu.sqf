
params [
    ["_target", objNull, [objNull]]
];

try
{
    if !([_target] call lilc_common_fnc_isAlive) throw false;

    private _targetFactionID = (_target getVariable ["lilc_factionID", -1]);
    private _unitFactionConfig = ([(player getVariable ["lilc_factionID", -1])] call lilc_factions_fnc_getFactionConfig);
    if (isNull _unitFactionConfig) throw false;

    private _applicableLicenses = getArray(_unitFactionConfig >> "applicableLicenses");
    if ((count _applicableLicenses) <= 0) then
    {
        ["Du besitzt derzeit keine Lizenzen zum verteilen."] call lilc_ui_fnc_hint;
        throw false;
    };

    if (({
        ([(["licenses", _x, "add"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have) ||
        ([(["licenses", _x, "remove"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have)
    } count _applicableLicenses) <= 0) then
    {
        ["Du besitzt zwar Lizenzen, darfst sie aber nicht verteilen."] call lilc_ui_fnc_hint;
        throw false;
    };

    if !(createDialog "lilcm_licenses") throw false;

    disableSerialization;
    private _ui = (findDisplay 1301);
    if (isNull _ui) throw false;
    _ui setVariable ["lilc_licenses_target", _target];

    private _uiListLicenses = (_ui displayCtrl 1500);
    private _uiListAvailableLicenses = (_ui displayCtrl 1501);

    lbClear _uiListLicenses;
    {
        private _itemConfig = ([_x] call lilc_virtualInventory_fnc_getVirtualItemConfig);
        if !(isNull _itemConfig) then
        {
            private _index = (_uiListLicenses lbAdd getText(_itemConfig >> "displayName"));
            _uiListLicenses lbSetData [_index, _x];
            _uiListLicenses lbSetPicture [_index, getText(_itemConfig >> "picture")];
        };
    } forEach _applicableLicenses select {
        ([(["licenses", _x, "add"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have)
    };

    lbClear _uiListAvailableLicenses;
    {
        private _itemConfig = ([_x select 0] call lilc_virtualInventory_fnc_getVirtualItemConfig);
        if !(isNull _itemConfig) then
        {
            private _index = (_uiListAvailableLicenses lbAdd getText(_itemConfig >> "displayName"));
            _uiListAvailableLicenses lbSetData [_index, _x select 0)];
            _uiListAvailableLicenses lbSetPicture [_index, getText(_itemConfig >> "picture")];
            _uiListAvailableLicenses lbSetValue [_index, _x select 2];
        };
    } forEach ((_target getVariable ["lilc_virtualInventory_inventory", []]) select {
        ([(["licenses", _x select 0, "remove"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have) && (_x select 0) in _applicableLicenses;
    });

    throw true;
}
catch
{
    _exception;
};
