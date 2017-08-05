
params [
	["_target", objNull, [objNull]]
];

private _allPhoneClassnames = (["phones_additionals", "ARRAY", []] call lilc_common_fnc_getSetting);
_allPhoneClassnames pushBack "lilci_cellphone_F";
_allPhoneClassnames pushBack "lilci_smartphone_F";
(({ (_x in _allPhoneClassnames) } count (assignedItems _target)) == 1);
