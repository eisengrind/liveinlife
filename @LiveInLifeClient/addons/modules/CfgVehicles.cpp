
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
