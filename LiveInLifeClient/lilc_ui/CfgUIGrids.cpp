
class IGUI
{
    class Presets
    {
        class Arma3
        {
            class Variables
            {
                grid_lilc_hint[] = {
                    {
                        "0.399782 * safezoneW + safezoneX",
                        "0.01226 * safezoneH + safezoneY",
                        "0.210885 * safezoneW",
                        "0.338333 * safezoneH"
                    },
	                "(((safezoneW / safezoneH) min 1.2) / 40)",
	                "((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"
                };
            };
        };
    };

    class Variables
    {
        class grid_lilc_hint
        {
            displayName = "LiveInLife Hints";
            description = "Notifications of LiveInLife";
            preview = "\x\lilc\addons\ui\images\iguiGrid_hints.paa";
            saveToProfile[] = {0, 1};
        };
    };
};
