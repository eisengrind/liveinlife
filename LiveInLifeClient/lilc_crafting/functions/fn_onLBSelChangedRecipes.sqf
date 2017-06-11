
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _control) throw false;
	if (_index <= -1) throw false;

	private _ui = (ctrlParent _control);
	if (isNull _ui) throw false;

	private _recipeName = (_control lbData _index); //data -> <recipeName>

	private _recipeConfig = ([_recipeName] call lilc_crafting_fnc_getRecipeConfig);
	if (isNull _recipeConfig) throw false;

	try
	{
		{
			private _classname = (configName _x);
			private _amount = getNumber(_x >> "amount");
			if (isNull (configFile >> "CfgVehicles" >> _classname)) then
			{
				if (([_classname, [player, (vehicle player)]] call lilc_inventory_fnc_itemCount) < _amount) throw false;
			}
			else
			{
				private _nearestObjects = (nearestObjects [player, [_classname], 20, true]);

				if ((count _nearestObjects) <= 0) throw false;

				try
				{
					{
						if ([_x] call lilc_keys_fnc_have) throw true;
					} forEach _nearestObjects;

					throw false;
				}
				catch
				{
					if !(_exception) throw false;
				};
			};
		} forEach ("true" configClasses (_recipeConfig >> "require"));

		throw true;
	}
	catch
	{
		ctrlEnable [1601, _exception];
	};

	ctrlShow [1003, true];
	ctrlShow [1200, true];
	ctrlShow [1100, true];

	ctrlSetText [1003, getText(_recipeConfig >> "displayName")];

	private _uiTextDescription = (_ui displayCtrl 1100);
	_uiTextDescription ctrlSetStructuredText parseText format[
		"<t size='0.9'>Zeit: %1 Sekunde/n</t><br /><t size='0.9'>Beschreibung:<br /><t size='0.7'>%2</t>",
		getNumber(_recipeConfig >> "time"),
		getText(_recipeConfig >> "description")
	];

	private _picture = getText(_recipeConfig >> "picture");
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

	private _position = getArray(_recipeConfig >> "position");private _recipePosition = getArray(_recipeConfig >> "position");
	
	if ((count _position) >= 2) then
	{
		private _positionPicture = getText(_recipeConfig >> "positionPicture");
		private _positionName = "";

		try
		{
			private _radius = 5;
			if ((count _position) == 2) then
			{
				_radius = (_position select 2);
			};

			private _vehicleConfig = ([(_position select 0)] call lilc_common_fnc_getClassnameConfig);

			if !(isNull _vehicleConfig) then
			{
				_positionName = getText(_vehicleConfig >> "displayName");
				
				if (_positionPicture == "") then
				{
					_positionPicture = getText(_vehicleConfig >> "picture");
				};

				private _nearestObjects = (nearestObjects [player, [(_position select 0)], _radius, true]);
				if ((count _nearestObjects) <= 0) throw false;
			}
			else
			{
				_positionName = ([(_position select 0)] call lilc_common_fnc_getDynamicPositionDisplayName);

				if (((([(_position select 0)] call lilc_common_fnc_getDynamicPosition) select 0) distance (vehicle player)) > _radius) throw false;
			};

			throw true;
		}
		catch
		{
			if !(_exception) then
			{
				ctrlShow [1202, true];
			}
			else
			{
				ctrlShow [1202, false];
			};
		};

		ctrlSetText [1014, _positionName];
		ctrlSetText [1201, _positionPicture];

		ctrlShow [1014, true];
		ctrlShow [1201, true];
	}
	else
	{
		ctrlShow [1014, false];
		ctrlShow [1201, false];
		ctrlShow [1202, false];
	};
	
	[_recipeName] call lilc_crafting_fnc_updateMenuNeeded;
	throw true;
}
catch
{
	_exception;
};
