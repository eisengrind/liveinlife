
params [
    ["_category", "", [""]],
    ["_direction", 0, [0]]
];

try {
    if !(_category in ["Glasses", "Headgear", "Uniform", "Vest", "Backpack"]) throw false;

    private _AGLASL = (ASLToAGL getPosASL player);
    private _AGL = (getPos player);
    switch (_category) do {
        case "Glasses": {
            private _relPos = (player getRelPos [0.6, _direction]);
            lilc_shops_uniformCamera camSetPos [(_relPos select 0), (_relPos select 1), ((_AGLASL select 2) + 1.65)];
            lilc_shops_uniformCamera camSetTarget [_AGL select 0, _AGL select 1, ((_AGLASL select 2) + 1.65)];
        };

        case "Headgear": {
            private _relPos = (player getRelPos [0.8, _direction]);
            lilc_shops_uniformCamera camSetPos [(_relPos select 0), (_relPos select 1), ((_AGLASL select 2) + 1.75)];
            lilc_shops_uniformCamera camSetTarget [(position player) select 0, (position player) select 1, ((_AGLASL select 2) + 1.75)];
        };

        case "Uniform": {
            private _relPos = (player getRelPos [2.4, _direction]);
            lilc_shops_uniformCamera camSetPos [(_relPos select 0), (_relPos select 1), ((_AGLASL select 2) + 1.3)];
            lilc_shops_uniformCamera camSetTarget [(position player) select 0, (position player) select 1, ((_AGLASL select 2) + 1.1)];
        };

        case "Vest": {
            private _relPos = (player getRelPos [1.6, _direction]);
            lilc_shops_uniformCamera camSetPos [(_relPos select 0), (_relPos select 1), ((_AGLASL select 2) + 1.2)];
            lilc_shops_uniformCamera camSetTarget [(position player) select 0, (position player) select 1, ((_AGLASL select 2) + 1.2)];
        };

        case "Backpack": {
            private _relPos = (player getRelPos [1.2, _direction]);
            lilc_shops_uniformCamera camSetPos [(_relPos select 0), (_relPos select 1), ((_AGLASL select 2) + 2)];
            lilc_shops_uniformCamera camSetTarget [(position player) select 0, (position player) select 1, ((_AGLASL select 2) + 1.4)];
        };
    };
    
    lilc_shops_uniformCamera camCommit 1;
} catch {
    _exception;
};
