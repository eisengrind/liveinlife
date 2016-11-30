
private _ranks = ["SELECT ID, NAME, TAG, FACTIONID, PRIORITY, INSIGNIA FROM FACTION_RANK_DATA"] call lils_database_fnc_fetchObjects;

private _rankNames = "";
{ _rankNames = _rankNames + (_x select 1); } forEach _ranks;
[(format["Currently, there are this ranks in the game: %1", _rankNames]), "lils_database"] call lilc_common_fnc_diag_log;

lilc_factionsInterface_ranks = _ranks;
publicVariable "lilc_factionsInterface_ranks";