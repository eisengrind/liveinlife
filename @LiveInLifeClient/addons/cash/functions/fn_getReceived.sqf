
params [
    ["_target", objNull, [objNull]]
];

lilc_tmpMoneyResult = lilc_player_cash;
(owner _target) publicVariableClient "lilc_tmpMoneyResult";
lilc_tmpMoneyResult = nil;
