
[
	"Live In Life", //STR_lilc_common_ScriptText_liveInLife
	"lilck_punchPersonWW",
	"Punching (w/out weapon)", //STR_lilc_actions_SettingsTitle_punchWithoutWeapon
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
	"Live In Life", //"
	"lilck_punchPersonW",
	"Punching (w/ weapon)", //STR_lilc_actions_SettingsTitle_punchWithWeapon
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
	"Live In Life", //"
	"lilck_holsterKey",
	"Holster Weapon", //STR_lilc_actions_SettingsTitle_holsterWeapon
	{
		[player] call lilc_actions_fnc_holsterWeapon;
	},
	{},
	[68, [false, false, false]]
] call CBA_fnc_addKeybind;

[
	"Live In Life", //"
	"lilck_useEarPlugs",
	"Use earplugs", //STR_lilc_actions_SettingsTitle_useEarplugs
	{
		call lilc_actions_fnc_earPlugs;
	},
	{},
	[60, [false, false, false]]
] call CBA_fnc_addKeybind;
