
params [
    ["_unit", objNull, [objNull]],
    ["_rankID", 0, [0]]
];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_rankID <= 0) throw false;
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;

    private _rankInfo = ([(format["SELECT NAME, TAG, VEHICLES, EQUIPMENT, PERMISSIONS, PRIORITY, INSIGNIA, ID FROM FACTION_RANK_DATA WHERE FACTIONID = '%1' AND ID = '%2'", _factionID, _rankID])] call lils_database_fnc_fetchObjects);
    if ((count _rankInfo) <= 0) throw false;
    _rankInfo = (_rankInfo select 0);
    
    _rankInfo set [2, ([(_rankInfo select 2)] call lils_common_fnc_arrayDecode)];
    _rankInfo set [3, ([(_rankInfo select 3)] call lils_common_fnc_arrayDecode)];
    _rankInfo set [4, ([(_rankInfo select 4)] call lils_common_fnc_arrayDecode)];
    
    [["rank", _rankInfo], "lilc_factionsInterface_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
}
catch
{
    _exception;
};
