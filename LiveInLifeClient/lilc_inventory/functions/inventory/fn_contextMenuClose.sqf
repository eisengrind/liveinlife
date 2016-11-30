
_xCoord = param [2, 0, [0]];
_yCoord = param [3, 0, [0]];

_xMenu = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "TextMenuBackground1" >> "x");
_yMenu = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "TextMenuBackground1" >> "y");
_wMenu = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "TextMenuBackground1" >> "w");
_hMenu = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "TextMenuBackground1" >> "h");
if (_xCoord <= (_xMenu + _wMenu) && _xCoord >= _xMenu && _yCoord <= (_yMenu + _hMenu) && _yCoord >= _yMenu) exitWith {};

_xList = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "UniformContainer" >> "x");
_yList = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "UniformContainer" >> "y");
_wList = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "UniformContainer" >> "w");
_hList = getNumber(configFile >> "RscDisplayInventory" >> "controls" >> "UniformContainer" >> "h");
if (_xCoord <= (_xList + _wList) && _xCoord >= _xList && _yCoord <= (_yList + _hList) && _yCoord >= _yList) exitWith {};
call lilc_inventory_fnc_contextMenuDisable;
