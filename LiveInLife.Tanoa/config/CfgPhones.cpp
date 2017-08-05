
class CfgPhones
{
    class cellphone
    {
        onLoad[] = {
            ""
        };
        defaultMenu = "main";
        saveLastMenu = true;

        class menus
        {
            class main
            {
                onLoad = "call compile preProcessFileLineNumbers 'scripts\main_onLoad.sqf';"; //\x\lilc\addons\phones
                onUnload = "call compile preProcessFileLineNumbers 'scripts\main_onUnload.sqf';";
            };

            class contacts
            {
                onLoad = "call compile preProcessFileLineNumbers 'scripts\contacts_onLoad.sqf';";
                onUnload = "call compile preProcessFileLineNumbers 'scripts\contacts_onUnload.sqf';";
            };
            
            class settings
            {
                onLoad = "call compile preProcessFileLineNumbers 'scripts\settings_onLoad.sqf';";
                onUnload = "call compile preProcessFileLineNumbers 'scripts\settings_onUnload.sqf';";
            };

            class typeNumber
            {
                onLoad = "call compile preProcessFileLineNumbers 'scripts\typeNumber_onLoad.sqf';";
                onUnload = "call compile preProcessFileLineNumbers 'scripts\typeNumber_onUnload.sqf';";
            };

            class dialNumber
            {
                onLoad = "call compile preProcessFileLineNumbers 'scripts\dialNumber_onLoad.sqf';";
                onUnload = "call compile preProcessFileLineNumbers 'scripts\dialNumber_onUnload.sqf';";
            };
        };
    };

    class smartphone{};
    class fatPad {};
};
