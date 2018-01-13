
params [
    ["_types", "", ["", []]]
];

if (_types isEqualType "") then
{
    _types = [_types];
};

[_types] call lilc_login_fnc_executeUpdatePackages;

/*
private _data = nil;

try
{
    switch (_type) do
    {
        case "deathInfo":
        {
            _data = [
                lilc_respawn_isRespawning,
                lilc_respawn_currentTimeout
            ];
        };

        case "statusInfo":
        {
            _data = [
                lilc_player_status,
                lilc_player_statusTimeout
            ];
        };
        
        case "health":
        {
            _data = [];
            if !(isNull (configFile >> "CfgPatches" >> "ace_medical")) then
            {
                _data = [
                    [
                        ((getAllHitPointsDamage player) select 0),
                        ((getAllHitPointsDamage player) select 2)
                    ],
                    (player getVariable ["ace_medical_morphine", 0]),
                    (player getVariable ["ace_medical_openwounds", []]),
                    (player getVariable ["ace_medical_bloodpressure", 0]),
                    (player getVariable ["ace_medical_incardiacarrest", false]),
                    (player getVariable ["ace_medical_internalwounds", []]),
                    (player getVariable ["ace_medical_heartrate", 0]),
                    (player getVariable ["ace_medical_pain", 0]),
                    (player getVariable ["ace_medical_isbleeding", false]),
                    (player getVariable ["ace_medical_bloodvolume", 100]),
                    (player getVariable ["ace_medical_fractures", []]),
                    (player getVariable ["ace_medical_triagelevel", 0]),
                    (player getVariable ["ace_medical_haspain", false]),
                    (player getVariable ["ace_medical_occludedmedications", []]),
                    (player getVariable ["ace_medical_triagecard", []]),
                    (player getVariable ["ace_medical_bodypartstatus", []]),
                    (player getVariable ["ace_medical_allusedmedication", []]),
                    (player getVariable ["ace_medical_bandagedwounds", []]),
                    (player getVariable ["ace_medical_peripheralresistance", 100]),
                    (player getVariable ["ace_medical_painsupress", 0]),
                    (player getVariable ["ace_isunconsious", false]),
                    (player getVariable ["ace_dragging_cancarry", false]),
                    (player getVariable ["ace_dragging_candrag", false])
                ];
            }
            else
            {
                _data = [(damage player)];
                //following soon
            };
        };

        case "lastPosition":
        {
            _data = ([player] call lilc_common_fnc_getPosition);
        };

        case "gearInfo":
        {
            _data = ([player] call lilc_inventory_fnc_getInventory);
        };

        case "cashInfo":
        {
            _data = lilc_player_cash;
        };

        case "lockers":
        {
            _data = lilc_locker_lockers;
        };

        case "locker_info":
        {
            _data = _args;
        };

        case "nutritionInfo":
        {
            _data = [
                lilc_player_thirst,
                lilc_player_hunger
            ];
        };

        case "newOff":
        {
        };

        case "permissionInfo":
        {
            _data = lilc_permissions_permissions;
        };

        case "virtualInventoryInfo":
        {
            _data = (player getVariable ["lilc_virtualInventory_inventory", []]);
        };

        case "prison_status":
        {
            _data = [(player getVariable ["lilc_prison_currentPunishment", ""]), lilc_prison_waitingTime, lilc_prison_escapeTimeout];
        };

        default
        {
            throw false;
        };
    };

    [[player, _type, _data], "lils_login_fnc_updatePlayerDataPartial"] call lilc_common_fnc_sendToServer;
    throw true;
}
catch
{
    _exception;
};






/*
_type = param [0, -1, [-1]];
if (_type == -1) exitWith { false; };

_data = nil;
switch (_type) do {
    case 0: {
        _data = lilc_player_ID;
    };
};
*/


