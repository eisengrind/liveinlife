
if (call lilc_factions_fnc_add) then {
    _groupID = (lilc_player_faction select 0);
    _groupName = (lilc_player_faction select 1);
    _groupConfig = ([_groupID] call lilc_common_fnc_getFactionConfig);
    lilc_player_respawnName = (_groupConfig select 3);

    if ((_groupConfig select 5) != "") then {
        call compile preProcessFileLineNumbers (_groupConfig select 5);
    };
} else {
    lilc_player_respawnName = ["hospital_1"];
};
