/*
    Modified:
        Vincent H.
    Description:
        Initialize the mysql connection of this server :)
    Parameters:
        -
*/

try
{
    private _checkResult = ("extDB3" callExtension "9:VERSION");
    
    if (_checkResult == "") then
    {
        ["extDB3: Failed to load extension!", "extDB3", "ERROR"] call lilc_common_fnc_diag_log;
    }
    else
    {
        if ((parseNumber _checkResult) < 1.026) then
        {
            ["extDB3:  a higher extDB3 version is required!", "extDB3", "ERROR"] call lilc_common_fnc_diag_log;
        };

        [(format["extDB3: Version: %1", _checkResult]), "extDB3"] call lilc_common_fnc_diag_log;

        throw true;
    };

    throw false;
}
catch
{
    _exception;
};
