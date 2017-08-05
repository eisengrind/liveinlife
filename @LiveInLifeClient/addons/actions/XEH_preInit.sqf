
[
	"Live In Life",
	"lilck_punchPersonWW",
	"Punching (w/out weapon)",
	{
		if ((currentWeapon player) == "" && (vehicle player) isEqualTo player) then
		{
			[cursorTarget] spawn lilc_actions_fnc_doPunchPerson;
		};
	},
	{},
	[240, [false, false, false]]
] call CBA_fnc_addKeybind; //on prim. mouse button!

[
	"Live In Life",
	"lilck_punchPersonW",
	"Punching (w/ weapon)",
	{
		if ((currentWeapon player) != "" && (vehicle player) isEqualTo player) then
		{
			[cursorTarget] spawn lilc_actions_fnc_doPunchPerson;
		};
	},
	{},
	[240, [false, false, false]]
] call CBA_fnc_addKeybind; //on prim. mouse button!

[
	"Live In Life",
	"lilck_holsterKey",
	"Holster Weapon",
	{
		[player] call lilc_actions_fnc_holsterWeapon;
	},
	{},
	[68, [false, false, false]]
] call CBA_fnc_addKeybind;

[
	"Live In Life",
	"lilck_useEarPlugs",
	"Use earplugs",
	{
		call lilc_actions_fnc_earPlugs;
	},
	{},
	[60, [false, false, false]]
] call CBA_fnc_addKeybind;
