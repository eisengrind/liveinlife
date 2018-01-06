
params [
	["_type", "", [""]],
	["_data", nil]
];

disableSerialization;
private _ui = (findDisplay 2302);

if (isNull _ui) then
{
	createDialog "lilcm_exchange";
};

ctrlShow [2300, false];
ctrlShow [2301, false];

switch (_type) do
{
	case "offers":
	{
		ctrlShow [2300, true];
	};

	case "account":
	{
		ctrlShow [2301, true];
	};
};
