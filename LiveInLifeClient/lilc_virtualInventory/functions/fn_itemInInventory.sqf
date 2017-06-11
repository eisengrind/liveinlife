
params [
    ["_viClassname", "", [""]],
    ["_viNames", [], [[], ""]],
    ["_viData", nil]
];

try {
    private _itemConfig = ([_viClassname] call lilc_virtualInventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;
    if (_viClassname == "") throw false;

    if (_viNames isEqualType "") then
    {
        _viNames = [_viNames];
    };

    private _viNamesCount = (count _viNames);
    if (_viNamesCount > 2) throw false;

    {
        if (_viClassname == (_x select 0)) then
        {
            try
            {
                private _currentViNames = (_x select 1);
                private _currentViNamesCount = (count _currentViNames);

                if (_viNamesCount >= 1 && _currentViNamesCount >= 1) then
                {
                    if !((_viNames select 0) == (_currentViNames select 0)) throw false;
                };

                if (_viNamesCount == 2 && _currentViNamesCount == 2) then
                {
                    if !((_viNames select 1) == (_currentViNames select 1)) throw false;
                };

                if !(_viData isEqualTo (_x select 2)) throw false;

                throw true;
            }
            catch
            {
                if (_exception) then
                {
                    throw true;
                };
            };
        };
    } forEach lilc_virtualInventory_inventory;

    throw false;
} catch {
    _exception;
};