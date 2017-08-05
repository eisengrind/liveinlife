
class CfgPatches
{
    class lilc_messages
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "lilc_common"
        };
        author[] = {
            "Vincent Heins"
        };
    };
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class lilc_RscText;
class lilc_RscStructuredText;
class lilc_RscEdit;
class lilc_RscButtonMenu;
class lilc_RscListbox;
class lilc_RscCombo;

#include "dialogs\messageCreate.cpp"
#include "dialogs\messageMenu.cpp"

class Extended_PreInit_EventHandlers
{
    class lilc_messages_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\messages\XEH_clientPreInit.sqf';";
    };
};
