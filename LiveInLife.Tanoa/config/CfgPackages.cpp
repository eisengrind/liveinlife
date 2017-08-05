
class CfgPackages {
    class packageSpot1 {
        objectVariable = ""; //variable, which (can be) attached to every object in editor (contains 'this' object-info); empty - spot will not be created

        class types {
            class packageType1 {
                moneyCoef = 1;
                chance = 0.4;
                basicMoney[] = {1000, 2000, 3000}; //min, mid, max    /    static amount
                //basicMoney = 2500;
            };
        };
    };
};
