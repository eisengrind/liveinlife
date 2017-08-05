
_palms = (nearestTerrainObjects [position player, ["TREE", "SMALL TREE"], 10]);
if ((count _palms) <= 0) exitWith { false; };
_palm = (_palms select 0);
if !(((getModelInfo _palm) select 0) in ["t_cocosnucifera3s_tall_f.p3d", "t_cocosnucifera2s_small_f.p3d"]) exitWith { false; };
true;
