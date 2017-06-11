
params [
	["_licenses", [], [[]]]
];

try
{
	if (isNull (findDisplay 1301)) throw false;
	if ((count _licenses) <= 0) then
	{
		lbClear 1501;
		lbAdd [1501, "Keine Lizenzen vorhanden."];
		throw false;
	}
	else
	{
		{
			private _itemName = (_x select 0);
			private _itemData = (_x select 1);
			private _itemConfig = ([_itemName] call lilc_virtualInventory_fnc_getVirtualItemConfig);
			if !(isNull _itemConfig) then
			{
				private _index = (lbAdd [1501, getText(_itemConfig >> "displayName")]);
				lbSetData [1501, _index, _itemName];
				lbSetValue [1501, _index, _itemData];
				lbSetPicture [1501, _index, getText(_itemConfig >> "picture")];
			};
		} forEach _licenses;
		throw true;
	};
}
catch
{
	_exception;
};
