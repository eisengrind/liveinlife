
lilc_farming_currentGatherTimeout = 0;
lilc_farming_trees = ["t_cocosnucifera2s_small_f.p3d", "t_cocosnucifera3s_tall_f.p3d", "b_cestrum_f.p3d", "b_pipermeth_f.p3d", "b_calochlaena_f.p3d", "t_ficus_small_f.p3d", "t_leucaena_f.p3d", "t_ficus_medium_f.p3d", "t_albizia_f.p3d", "b_cycas_f.p3d", "t_inocarpus_f.p3d", "d_lianatangle_wide_f.p3d", "t_palaquium_f.p3d", "d_lianatangle_narrow_f.p3d", "t_cyathea_f.p3d", "t_ficus_big_f.p3d", "t_millettia_f.p3d", "t_banana_f.p3d", "t_pritchardia_f.p3d", "t_agathis_wide_f.p3d", "t_agathis_tall_f.p3d", "t_ficusb1s_f.p3d", "t_phoenixc3s_f.p3d", "t_phoenixc1s_f.p3d", "t_ficusb2s_f.p3d", "t_oleae1s_f.p3d", "t_pinuss2s_b_f.p3d", "t_broussonetiap1s_f.p3d", "t_oleae2s_f.p3d", "t_quercusir2s_f.p3d", "t_fraxinusav2s_f.p3d", "t_pinuss2s_f.p3d", "t_pinuss1s_f.p3d", "t_populusn3s_f.p3d", "t_poplar2f_dead_f.p3d", "t_pinusp3s_f.p3d"];

[
    "Live In Life",
    "lilck_farmingKey",
    "Farming Key",
    {
        private _nO = ((nearestTerrainObjects [player, ["TREE", "SMALL TREE"], 20]) select {
            ((((getModelInfo _x) select 0) in lilc_farming_trees) && ((player distance2D (position _x)) <= 3) && ((damage _x) < 1));
        });

        if ((count _nO) > 0) then
        {
            private _o = (([
                _nO,
                [],
                {
                    (player distance2D (position _x));
                },
                "ASCEND"
            ] call BIS_fnc_sortBy) select 0);

            [_o] spawn lilc_farming_fnc_wood;
        }
        else
        {
            [] spawn lilc_farming_fnc_gatherZoneItems;
        };
    },
    {},
    [157, [false, false, false]]
] call CBA_fnc_addKeybind;

[
    "lilc_farming_gatherTimeout",
    "SLIDER",
    "Farming timeout", //TODO: localize
    "Live In Life",
    [0, 30, 3, 2],
    1,
    {}
] call CBA_Settings_fnc_init;
