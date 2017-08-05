
private _thirst = param [0, 0, [0]];

try
{
    if (_thirst == 0) throw true;

    if (isNil "lilc_thirst_maxAmount") then
    {
        lilc_thirst_maxAmount = 100;
    };
    
    if (isNil "lilc_thirst_saturationAmount") then
    {
        lilc_thirst_saturationAmount = 0;
    };

    private _maxthirst = (lilc_thirst_maxAmount + lilc_thirst_saturationAmount);
    if ((lilc_player_thirst + _thirst) <= _maxthirst && (lilc_player_thirst + _thirst) >= 0) then
    {
        lilc_player_thirst = lilc_player_thirst + _thirst;
    }
    else
    {
        if ((lilc_player_thirst + _thirst) < 0) then
        {
            lilc_player_thirst = 0;
        }
        else
        {
            lilc_player_thirst = _maxthirst;
        };
    };
    
    throw true;
}
catch
{
    _exception;
};
