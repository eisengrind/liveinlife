
/*
CfgSeats >>
	class someSeatClassname >>
		class someSeatPosition >>
			displayName = "" >
			actionPosition[] = {} >
			position[] = {} >
			direction[] = {} >
			disableCollision = 1
			animations[] = {}
*/

private _seatConfig = (call lilc_sitting_fnc_getSeatsConfig);

{
	private _classname = (configName _x);

	{
		private _positionName = (configName _x);
		private _displayName = getText(_x >> "displayName");

		private _aceAction = ([
			(format["lilc_sitting_action_%1_%2", _classname, _positionName]),
			(["STR_lilc_sitting_ActionTitle_sitDown"] call lilc_common_fnc_localize),
			"",
			{
				[_target, (_this select 2)] call lilc_sitting_fnc_doSitDown;
			},
			{
				[_target, (_this select 2)] call lilc_sitting_fnc_canSitDown;
			},
			{},
			_positionName,
			(getArray(_x >> "actionPosition"))
		] call ace_interact_menu_fnc_createAction);

		[_classname, 0, ["ACE_MainActions"], _aceAction] call ace_interact_menu_fnc_addActionToClass;
	} forEach ("true" configClasses _x);
} forEach ("true" configClasses _seatConfig);
