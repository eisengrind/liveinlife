
lilc_food_hunger_factor = 0.9999;
lilc_food_thirst_factor = 0.9996;
lilc_food_needs_index = -1;

[
	"lilce_common_postFinished",
	{
		lilc_food_needs_index = ([
			{
				lilc_player_hunger = lilc_player_hunger * lilc_food_hunger_factor;
				lilc_player_thirst = lilc_player_thirst * lilc_food_thirst_factor;
			},
			30
		] call CBA_fnc_addPerFrameHandler);
	}
] call CBA_fnc_addEventHandler;
