
_type = param [0, -1, [-1]];
if (_type == -1) exitWith { false; };

_data = nil;
switch (_type) do {
    case 0: {
        _data = lilc_player_ID;
    };
};

[[_type, _data], "lils_login_fnc_updatePlayerDataPartial"] call lilc_common_fnc_sendToServer;
