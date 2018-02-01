
try
{
    player setVariable ["lilc_prison_isJailed", false, true];
    player setVariable ["lilc_prison_currentPunishment", "", true];
    player setVariable ["lilc_prison_escapeTime", 0, true];
    player setVariable ["lilc_prison_waitingTime", 0, true];

    ["lilc_prison_status"] call lilc_ui_fnc_fadeOutTitles;
    ["prison_status"] call lilc_login_fnc_updatePlayerDataPartial;
}
catch
{
    _exception;
};
