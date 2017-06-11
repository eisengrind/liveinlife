
class Man;
class CAManBase : Man
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_licenses_openLicensesMenu
            {
                displayName = "Lizenz vergeben";
                condition = "([_target] call lilc_licenses_fnc_canOpenLicensesMenu)";
                statement = "[_target] call lilc_licenses_fnc_doOpenLicensesMenu;";
            };
        };
    };
};
