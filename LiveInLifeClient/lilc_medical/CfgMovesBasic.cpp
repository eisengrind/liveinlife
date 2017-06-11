
class Actions {
    class NoActions;
    class lilcaa_AinjPpneMstpSnonWnonDnon : NoActions {
        stop = "lilcas_AinjPpneMstpSnonWnonDnon";
        stopRelaxed = "lilcas_AinjPpneMstpSnonWnonDnon";
        default = "lilcas_AinjPpneMstpSnonWnonDnon";
    };

    class lilcaa_driver_lsv01_kia : NoActions {
        stop = "lilcas_driver_lsv01_kia";
        stopRelaxed = "lilcas_driver_lsv01_kia";
        default = "lilcas_driver_lsv01_kia";
    };

    class lilcaa_KIA_passenger_mantisrear : lilcaa_driver_lsv01_kia {
        stop = "lilcas_KIA_passenger_mantisrear";
        stopRelaxed = "lilcas_KIA_passenger_mantisrear";
        default = "lilcas_KIA_passenger_mantisrear";
    };

    class lilcaa_KIA_passenger_quadbike : lilcaa_KIA_passenger_mantisrear {
        stop = "lilcas_KIA_passenger_quadbike";
        stopRelaxed = "lilcas_KIA_passenger_quadbike";
        default = "lilcas_KIA_passenger_quadbike";
    };

    class lilcaa_KIA_passenger_VAN_codriver01 : lilcaa_KIA_passenger_quadbike {
        stop = "lilcas_KIA_passenger_VAN_codriver01";
        stopRelaxed = "lilcas_KIA_passenger_VAN_codriver01";
        default = "lilcas_KIA_passenger_VAN_codriver01";
    };

    class lilcaa_KIA_pilot_Heli_Transport_03 : lilcaa_KIA_passenger_VAN_codriver01 {
        stop = "lilcas_KIA_pilot_Heli_Transport_03";
        stopRelaxed = "lilcas_KIA_pilot_Heli_Transport_03";
        default = "lilcas_KIA_pilot_Heli_Transport_03";
    };

    class lilcaa_KIA_Truck_Cargo02 : lilcaa_KIA_pilot_Heli_Transport_03 {
        stop = "lilcas_KIA_Truck_Cargo02";
        stopRelaxed = "lilcas_KIA_Truck_Cargo02";
        default = "lilcas_KIA_Truck_Cargo02";
    };

    class lilcaa_KIA_Truck_Cargo03 : lilcaa_KIA_Truck_Cargo02 {
        stop = "lilcas_KIA_passenger_mantisrear";
        stopRelaxed = "lilcas_KIA_passenger_mantisrear";
        default = "lilcas_KIA_passenger_mantisrear";
    };
};
