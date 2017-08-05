
private _hunger = param [0, 0, [0]];

try {
    if (_hunger == 0) throw true;

    if (isNil "lilc_hunger_maxAmount") then { lilc_hunger_maxAmount = 100; };
    if (isNil "lilc_hunger_saturationAmount") then { lilc_hunger_saturationAmount = 0; };

    private _maxHunger = (lilc_hunger_maxAmount + lilc_hunger_saturationAmount);
    if ((lilc_player_hunger + _hunger) <= _maxHunger && (lilc_player_hunger + _hunger) >= 0) then {
        lilc_player_hunger = lilc_player_hunger + _hunger;
    } else { if ((lilc_player_hunger + _hunger) < 0) then { lilc_player_hunger = 0; } else { lilc_player_hunger = _maxHunger; }; };
    
    throw true;
} catch {
    _exception;
};
