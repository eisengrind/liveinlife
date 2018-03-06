
class CfgPatches {
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_job_agent {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\job_agent\XEH_serverPreInit.sqf';";
    };
};
