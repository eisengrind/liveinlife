
class Man;
class CAManBase : Man
{
    class ACE_SelfActions
    {
        class lilc_pcard_showSelfPersonalcard
        {
            displayName = "Personalausweise anschauen";
            condition = "([player] call lilc_pcard_fnc_canShowPersonalcard);";
            statement = "[player] call lilc_pcard_fnc_doShowPersonalcard;";
        };
    };
};
