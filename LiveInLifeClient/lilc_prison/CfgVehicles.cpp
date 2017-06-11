
class Man;
class CAManBase : Man
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_prison_addPunishment
            {
                displayName = "$STR_lilc_prison_ActionTitle_addPunishment";
                condition = "[_target] call lilc_prison_fnc_canAddPunishment";
                statement = "[_target] call lilc_prison_fnc_doAddPunishment;";
            };

            class lilc_prison_endPunishment
            {
                displayName = "$STR_lilc_prison_ActionTitle_addPunishment";
                condition = "[_target] call lilc_prison_fnc_canEndPunishment";
                statement = "[_target] call lilc_prison_fnc_doEndPunishment;";
            };
        };
    };
};
