
disableSerialization;
params [
	"_ctrl",
	"_index"
];

if (_index <= -1) exitWith {};

private _cfg = ([lilc_exchange_currentExchange] call lilc_exchange_fnc_getExchangeConfig);

private _container = ((_ctrl lbData _index) call BIS_fnc_objectFromNetId);

private _items = (if (_container isKindOf "Man") then {
	([_container, false] call lilc_inventory_fnc_getAllUnitItems);
} else {
	([_container] call lilc_inventory_fnc_getAllVehicleItems);
});

private _exchangeItems = getArray(_cfg >> "items");
_items = (_items select { _x in _exchangeItems; });

private _countItems = [[], []];

{
	private _fI = ((_countItems select 0) find _x);
	if (_fI > -1) then {
		(_countItems select 1) set [_fI, ((_countItems select 1) select _fI) + 1];
	} else {
		(_countItems select 0) pushBack _x;
		(_countItems select 1) pushBack 1;
	};
} forEach _items;

lbClear 1500;
{
	private _itemCfg = ([_x] call lilc_common_fnc_getClassnameConfig);
	private _v = ((_countItems select 1) select _forEachIndex);
	private _i = (lbAdd [1500, (format["%1x %2", _v, getText(_itemCfg >> "displayName")])]);
	lbSetData [1500, _i, _x];
	lbSetValue [1500, _i, _v];
	lbSetPicture [1500, _i, getText(_itemCfg >> "picture")];
} forEach (_countItems select 0);
