
class lilci_roadCone_F : lilci_item {
    displayName = "";
    
    lilc_dropDownOptions[] = {
        {"Platzieren", "['RoadCone_F'] call lilc_placement_fnc_canPlaceObject", "['RoadCone_F'] call lilc_placement_fnc_doPlaceObject;"}
    };
};

class lilci_bigFireplace_F : lilci_item {
    displayName = "";

    lilc_dropDownOptions[] = {
        {"Platzieren", "['Land_Campfire_F'] call lilc_placement_fnc_canPlaceObject", "['Land_Campfire_F'] call lilc_placement_fnc_doPlaceObject;"}
    };
};

class lilci_smallFireplace_F : lilci_item {
    displayName = "";
    
    lilc_dropDownOptions[] = {
        {"Platzieren", "['Land_FirePlace_F'] call lilc_placement_fnc_canPlaceObject", "['Land_FirePlace_F'] call lilc_placement_fnc_doPlaceObject;"}
    };
};
