
class lilc_common {
    class functions {
        file = "\x\lilc\addons\common\functions";
        // C
        class createStaticCamera {};
        class creditsIntro {};

        // F
        class fillString {};

        // G
        class gameTimeDiff {};
        class gameTimeToFloat {};
        class getACEDamage {}; //TODO: move to seperate ace compatibility package
        class getCameraConfig {};
        class getClassnameConfig {};
        class getDynamicPosition {};
        class getDynamicPositionDisplayName {};
        class getPosition {};
        class getSetting {}; //TODO: try to create an auto identification of data type

        // I
        class inBusinessHours {};
        class initMission {};
        class isAlive {};
        class isEqualStringToLower {};
        class isKindOf {};

        // L
        class localize {};

        // N
        class numberToText {};

        // O
        class objectsNearby {};

        // R
        class randomString {};

        // S
        class send {};
        class sendToHeadless {};
        class sendToOtherPlayers {};
        class sendToPlayers {};
        class sendToServer {};
        class setACEDamage {};
        class setDir {};
        class setDynamicPosition {};
        class setObjectDamage {};
        class setObjectLocks {}; //TODO: move to single "object" library
        class setPosition {};
        class switchMove {};

        // T
        class takeAnimation {};
        class toBool {};
        class trimString {};
    };
};
