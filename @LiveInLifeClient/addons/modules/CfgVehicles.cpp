
class Module_F : Logic {
    class AttributesBase {
        class Default;
        class Edit;
        class Combo;
        class Checkbox;
        class CheckboxNumber;
        class ModuleDescription;
        class Units;
    };

    class ModuleDescription {
        class AnyBrain;
    };
};

class module_lilc_modules_position : Module_F {
    author = "Vincent Heins";
    scope = 2;
    displayName = "Module (static|dynamic) position";
    icon = "\x\lilc\addons\modules\icons\position.paa";
    category = "category_lilc_modules";
    function = "lilc_modules_fnc_module_position";
    isGlobal = 1;
    isSingular = 1;

    class Arguments {
        class positionName {
            displayName = "Positionsname";
            description = "Name of the (deprecated) static positions config.";
            typeName = "STRING";
            defaultValue = "";
        };
    };

    class ModuleDescription : ModuleDescription {
        description = "Testbeschreibung?";
    };
};

class module_lilc_modules_headlessClientOptions : Module_F {
    author = "Vincent Heins";
    scope = 2;
    displayName = "$STR_lilc_modules_Config_moduleHeadlessClientOptions";
    icon = "\x\lilc\addons\modules\icons\modulesHeadlessClientOptions.paa";
    category = "cateogry_lilc_modules";
    function = "lilc_modules_fnc_modulesHeadlessClientOptions";
    isGlobal = 0;
    isTriggerActivated = 0;
    isDisposable = 1;
    is3DEN = 1;

    class Arguments {
        class handleUsersAPI {
            displayName = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleUsersAPI";
            description = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleUsersAPI_description";
            typeName = "NUMBER";
            class values {
                class disabled {
                    default = 1;
                    name = "$STR_lilc_modules_Config_moduleValue_disabled";
                    value = 0;
                };

                class enabled {
                    name = "$STR_lilc_modules_Config_moduleValue_enabled";
                    value = 1;
                };
            };
        };

        class handleExchangeAPI {
            displayName = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleExchangeAPI";
            description = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleExchangeAPI_description";
            typeName = "NUMBER";
            class values {
                class disabled {
                    default = 1;
                    name = "$STR_lilc_modules_Config_moduleValue_disabled";
                    value = 0;
                };

                class enabled {
                    name = "$STR_lilc_modules_Config_moduleValue_enabled";
                    value = 1;
                };
            };
        };

        class handleBankAPI {
            displayName = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleBankAPI";
            description = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleBankAPI_description";
            typeName = "NUMBER";
            class values {
                class disabled {
                    default = 1;
                    name = "$STR_lilc_modules_Config_moduleValue_disabled";
                    value = 0;
                };

                class enabled {
                    name = "$STR_lilc_modules_Config_moduleValue_enabled";
                    value = 1;
                };
            };
        };

        class handleOptionalFilter {
            displayName = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleOptionalFilter";
            description = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_argument_handleOptionalFilter_description";
            typeName = "STRING";
            defaultValue = "[\"example_prefix\", \"another_example_prefix\"]";
        };
    };

    class ModulesDescription : ModuleDescription {
        description = "$STR_lilc_modules_Config_moduleHeadlessClientOptions_description";
    };
};
