
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class RscCombo;
class RscText;
class RscListbox;
class RscButton;
class RscControlsGroup;
class lilc_RscActiveText;
class RscStructuredText;

#include "gui\job_agent.cpp"
#include "gui\job_select.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_job_agent {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\job_agent\XEH_clientPreInit.sqf';";
    };
};
