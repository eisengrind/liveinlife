
class StandBase;
class States {
    class AinjPpneMstpSnonWrflDnon;
    class lilcas_AinjPpneMstpSnonWrflDnon : AinjPpneMstpSnonWrflDnon
    {
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 300;
        forceAim = 1;
    };

    /*class AinjPpneMstpSnonWnonDnon;
    class lilcas_AinjPpneMstpSnonWnonDnon : AinjPpneMstpSnonWnonDnon {
        ConnectTo[] = {};
        InterpolateTo[] = {};
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 300;
        //forceAim = 0;
        //static = 0;
    };*/

    class driver_lsv01_kia;
    class lilcas_driver_lsv01_kia : driver_lsv01_kia {
        actions = "lilcaa_driver_lsv01_kia";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };

    class KIA_passenger_mantisrear;
    class lilcas_KIA_passenger_mantisrear : KIA_passenger_mantisrear {
        actions = "lilcaa_KIA_passenger_mantisrear";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };

    class KIA_passenger_quadbike;
    class lilcas_KIA_passenger_quadbike : KIA_passenger_quadbike {
        actions = "lilcaa_KIA_passenger_quadbike";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };

    class KIA_passenger_VAN_codriver01;
    class lilcas_KIA_passenger_VAN_codriver01 : KIA_passenger_VAN_codriver01 {
        actions = "lilcaa_KIA_passenger_VAN_codriver01";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };

    class KIA_pilot_Heli_Transport_03;
    class lilcas_KIA_pilot_Heli_Transport_03 : KIA_pilot_Heli_Transport_03 {
        actions = "lilcaa_KIA_pilot_Heli_Transport_03";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };

    class KIA_Truck_Cargo02;
    class lilcas_KIA_Truck_Cargo02 : KIA_Truck_Cargo02 {
        actions = "lilcaa_KIA_Truck_Cargo02";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };

    class KIA_Truck_Cargo03;
    class lilcas_KIA_passenger_mantisrear : KIA_Truck_Cargo03 {
        actions = "lilcaa_KIA_passenger_mantisrear";
        head = "headNo";
        aimingBody = "aimingNo";
        aimPrecision = 5;
        forceAim = 1;
        static = 1;
    };
};
