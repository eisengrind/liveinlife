/*
class House_Small_F;

class lilc_atm_01_F : House_Small_F {
    author = "Vincent Heins";
    model = "\x\lilc\addons\atm\lilc_atm_01.p3d";
    displayName = "ATM - Test 01";
    dustBackLeftPos = "";
    dustBackRightPos = "";
    dustFrontLeftPos = "";
    dustFrontRightPos = "";
    editorCategory = "lilco";
    editorSubcategory = "lilco_small";
};
*/

class Land_Atm_02_F;
class lilc_atm_01_F : Land_Atm_02_F {
	hiddenSelections[] = {"Camo"};
	hiddenSelectionsTextures[] = {"\x\lilc\addons\atm\atm_01_co_tanBank.paa"};
};
