
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

if (isNull _control) exitWith {};
if (_index <= -1) exitWith {};

private _ui = (ctrlParent _control);
if (isNull _ui) exitWith {};

private _d = [];
_d = (call compile (_control lbData _index));
private _rCfg = (missionConfigFile >> "CfgRecipes" >> (_d select 0) >> "recipes" >> (_d select 1));

ctrlEnable [1601, false];
if !([(_d select 0), _rCfg] call lilc_crafting_fnc_isRecipeVisible) exitWith {};
ctrlEnable [1601, true];

ctrlShow [1003, true];
ctrlShow [1200, true];
ctrlShow [1100, true];

ctrlSetText [1003, getText(_rCfg >> "displayName")];

private _uiTextDescription = (_ui displayCtrl 1100);
_uiTextDescription ctrlSetStructuredText parseText format[
	"<t size='0.9'>Zeit: %1 Sekunde/n</t><br /><t size='0.9'>Beschreibung:<br /><t size='0.7'>%2</t>",
	getNumber(_rCfg >> "time"),
	getText(_rCfg >> "description")
];

private _picture = getText(_rCfg >> "picture");
ctrlSetText [1200, (
	if (_picture == "") then
	{
		"\x\lilc\addons\common\icons\lilci_default.paa";
	}
	else
	{
		_picture;
	}
)];

[(_d select 0), _rCfg] call lilc_crafting_fnc_updateMenuNeeded;

if (_d call lilc_crafting_fnc_isRecipeCraftable) then
{
	ctrlEnable [1601, true];
}
else
{
	ctrlEnable [1601, false];
};
