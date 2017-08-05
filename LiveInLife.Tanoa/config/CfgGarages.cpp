class CfgGarages {
    class garage_authority_1 {
        displayName = "Polizeigarage (Fahrzeuge)";
        haveCars = 1; // normal street-vehicles (Offroader, SUV, e.g.)
        havePlanes = 0; // planes like the cessna
        haveHelicopters = 0; // helicopters...
        haveTrucks = 1; // trucks...
        haveBoats = 0; // boats...
        haveSmallCars = 1; // vehicles like quads...
        haveBikes = 1; // motorcycles and bikes
        isLocal = 0; // vehicle only in this garage available?
        parkPosition[] = {5592.01,11019.3,2.66144}; // position @ which the vehicle will be "parked" - lilc position arr [x,y,z]
        parkRadius = 15;
        revealPosition[] = {{5592.01,11019.3,2.66144}, 46.2611}; // position @ which the vehicle will "arrive" - lilc position arr [pos, dir]
        viewPosition[] = {{5592.01,11019.3,2.66144}, 46.2611}; // [pos, dir] of vehicle view
        viewCamera = "garage_authority_1_camera"; // static camera name -> CfgStaticCameras
        //additionalTypes[] = {}; // like "Man" or "Truck" or "Tank" - see https://community.bistudio.com/wiki/isKindOf for understanding
    };

    class garage_authority_2 {
        displayName = "Polizeigarage (Helikopter)";
        haveCars = 0; // normal street-vehicles (Offroader, SUV, e.g.)
        havePlanes = 0; // planes like the cessna
        haveHelicopters = 1; // helicopters...
        haveTrucks = 0; // trucks...
        haveBoats = 0; // boats...
        haveSmallCars = 0; // vehicles like quads...
        haveBikes = 0; // motorcycles and bikes
        isLocal = 0; // vehicle only in this garage available?
        parkPosition[] = {5579, 11000.4, 11.6404}; // position @ which the vehicle will be "parked" - lilc position arr [x,y,z]
        parkRadius = 6;
        revealPosition[] = {{5579, 11000.4, 11.6404}, 359.285}; // position @ which the vehicle will "arrive" - lilc position arr [pos, dir]
        viewPosition[] = {{5579, 11000.4, 11.6404}, 359.285}; // [pos, dir] of vehicle view
        viewCamera = "garage_authority_1_camera"; // static camera name -> CfgStaticCameras
        //additionalTypes[] = {}; // like "Man" or "Truck" or "Tank" - see https://community.bistudio.com/wiki/isKindOf for understanding
    };

    class garage_atcControl_1 {
        displayName = "Flugsicherheitsgarage";
        haveCars = 1;
        havePlanes = 1;
        haveHelicopters = 1;
        haveTrucks = 1;
        haveBoats = 1;
        haveSmallCars = 1;
        haveBikes = 1;
        isLocal = 0;
        parkPosition[] = {6956.89, 7171.84, 2.46349};
        parkRadius = 30;
        revealPosition[] = {{6956.89, 7171.84, 2.46349}, 359.992};
        viewPosition[] = {{6956.89, 7171.84, 2.46349}, 359.992};
        viewCamera = "";
    };

    class garage_civ_1 {
        displayName = "Garage";
        haveCars = 1;
        havePlanes = 0;
        haveHelicopters = 0;
        haveTrucks = 1;
        haveBoats = 0;
        haveSmallCars = 1;
        haveBikes = 1;
        isLocal = 1;
        parkPosition[] = {5793.83,10297,7.74368}; // position @ which the vehicle will be "parked" - lilc position arr [x,y,z]
        parkRadius = 15;
        revealPosition[] = {{5793.83, 10297, 7.74368}, 105.301}; // position @ which the vehicle will "arrive" - lilc position arr [pos, dir]
        viewPosition[] = {{5793.83, 10297, 7.74368}, 105.301}; // [pos, dir] of vehicle view
        viewCamera = "garage_civ_1_camera";
        //additionalTypes[] = {}; // like "Man" or "Truck" or "Tank" - see https://community.bistudio.com/wiki/isKindOf for understanding
    };
};
