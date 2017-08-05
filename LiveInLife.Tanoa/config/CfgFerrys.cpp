class CfgFerrys
{
    class leqa
    {
        displayName = "Leqa"; //display name
        position = "ferryPoint_1"; //position for players to arrive
        positionVehicle = "ferryPoint_1"; //position for vehicles to arrive
        ticketPrice = 40; //...
        rides[] = {
            //{<locationToMove/string>, <daytime|0-23.9's>},
            {"belfort", 12.25},
            {"belfort", 12.5},
            {"belfort", 12.75},
            {"belfort", 13},
            {"belfort", 13.25},
            {"belfort", 13.5},
            {"belfort", 13.75},
            {"belfort", 14},
            {"belfort", 14.25},
            {"belfort", 14.5},
            {"belfort", 14.75},
            {"belfort", 15},
            {"belfort", 15.5}, //move to belfort at 15:30
            {"belfort", 15.75},
            {"belfort", 16},
            {"belfort", 16.25},
            {"belfort", 16.5},
            {"belfort", 16.75},
            {"belfort", 17},
            {"belfort", 17.25},
            {"belfort", 17.5},
            {"belfort", 17.75},
            {"belfort", 18},
            {"belfort", 20},
            {"belfort", 0},
            {"belfort", 3},
            {"belfort", 6}
        };
    };
    
    class belfort
    {
        displayName = "Belfort"; //display name
        position = "ferryPoint_2"; //position for players to arrive
        positionVehicle = "ferryPoint_2"; //position for vehicles to arrive
        ticketPrice = 40; //...
        rides[] = {
            {"leqa", 0}
        };
    };
};