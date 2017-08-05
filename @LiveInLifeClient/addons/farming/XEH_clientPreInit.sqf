
{
    private _areas = getArray(_x >> "areas");
    {
        if ((markerColor _x) != "") then {
            _x setMarkerAlphaLocal 0;
        };
    } forEach _areas;
} forEach ("true" configClasses (missionConfigFile >> "CfgFarmAreas"));

lilc_farming_trees = ["t_ficus_small_f.p3d", "t_leucaena_f.p3d", "t_ficus_medium_f.p3d", "t_albizia_f.p3d", "b_cycas_f.p3d", "t_inocarpus_f.p3d", "d_lianatangle_wide_f.p3d", "t_palaquium_f.p3d", "d_lianatangle_narrow_f.p3d", "t_cyathea_f.p3d", "t_ficus_big_f.p3d", "t_millettia_f.p3d", "t_banana_f.p3d", "t_pritchardia_f.p3d", "t_agathis_wide_f.p3d", "t_agathis_tall_f.p3d", "t_ficusb1s_f.p3d", "t_phoenixc3s_f.p3d", "t_phoenixc1s_f.p3d", "t_ficusb2s_f.p3d", "t_oleae1s_f.p3d", "t_pinuss2s_b_f.p3d", "t_broussonetiap1s_f.p3d", "t_oleae2s_f.p3d", "t_quercusir2s_f.p3d", "t_fraxinusav2s_f.p3d", "t_pinuss2s_f.p3d", "t_pinuss1s_f.p3d", "t_populusn3s_f.p3d", "t_poplar2f_dead_f.p3d", "t_pinusp3s_f.p3d"];

["Live In Life", "lilck_farmingKey", "Farming Key", { [] spawn lilc_farming_fnc_gatherZoneItems; }, {}, [157, [false, false, false]]] call CBA_fnc_addKeybind;
