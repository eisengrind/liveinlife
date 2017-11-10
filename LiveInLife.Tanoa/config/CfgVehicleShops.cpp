
class CfgVehicleShops {
    class vehicles_shop_1 {
        displayName = "Gebrauchtwagenhändler"; //display name
        groups[] = {-1, 3, 4, 5}; //groups/factions allowed to see vehicle
        
        class businessHours {
            start[] = {10, 0};
            end[] = {19, 0};
        };

        class vehicles {
            class <vehicle> {
                groups[] = {-1, 3, 4, 5}; //groups available to buy vehicles
            };
        };
    };
};
