
createDialog "lilcm_messageCreate";

lbClear 2100;
private _pF = (player getVariable ["lilc_factionID", -1]);
private _pFCfg = ([_pF] call lilc_factions_fnc_getFactionConfig);
if (getNumber(_pFCfg >> "messages_enableGlobalMessage") == 1) then
{
	private _index = (lbAdd [2100, "All"]);
	lbSetData [2100, _index, (str [2, _pF])];
};

{
	if (getNumber(_x >> "enableGlobalPhone") == 1) then
	{
		private _cfg = _x;
		private _n = (configName _x);
		private _id = getNumber(_x >> "id");
		private _uC = ({ (!(isNull _x) && ((_x getVariable ["lilc_factionID", -1]) isEqualTo _id)); } count playableUnits);
		private _index = (lbAdd [2100, (format[
			"%1%2",
			getText(_x >> "displayName"),
			(format[" (%1 Online)", _uC])
		])]);
		lbSetData [2100, _index, (str [0, _id])];
	};
} forEach ([("true" configClasses (missionConfigFile >> "CfgFactions")), [], { (configName _x); }, "DESCEND"] call BIS_fnc_sortBy);

{
	if !(isNull _x) then
	{
		private _fID = (_x getVariable ["lilc_factionID", -1]);
		private _fCfg = ([_fID] call lilc_factions_fnc_getFactionConfig);
		private _index = (lbAdd [
			2100,
			(format[
				"%1%2",
				([_x] call lilc_login_fnc_formatName),
				(if (_fID > 0 && getNumber(_fCfg >> "messages_displayFaction") == 1) then
				{
					format[" (%1)", getText(_fCfg >> "displayName")];
				}
				else
				{
					"";
				})
			])
		]);
		lbSetData [2100, _index, (str [1, (_x getVariable ["lilc_accountID", 0])])];
	};
} forEach ([(playableUnits - [player]), [], { ([_x] call lilc_login_fnc_formatName); }, "ASCEND"] call BIS_fnc_sortBy);
