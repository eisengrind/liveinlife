
#define GARAGE_CONFIG(var1) (missionConfigFile >> QUOTE(CfgGarages) >> (var1))

#define DISPLAY_GARAGE (findDisplay 2020)
#define DISPLAY_GARAGE_LIST_VEHICLES (DISPLAY_GARAGE displayCtrl 1500)
#define DISPLAY_GARAGE_TITLE (DISPLAY_GARAGE displayCtrl 1001)
#define DISPLAY_GARAGE_COMBO_PLAYERS (DISPLAY_GARAGE displayCtrl 2401);
#define DISPLAY_GARAGE_BUTTON_REVEAL (DISPLAY_GARAGE displayCtrl 2400);
#define DISPLAY_GARAGE_BUTTON_TRANSFER (DISPLAY_GARAGE displayCtrl 2402);