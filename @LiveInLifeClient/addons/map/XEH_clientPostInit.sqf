
[
	{
		!isNull (findDisplay 12);
	},
	{
		(findDisplay 12) ctrlCreate ["lilc_map_GroupMarkerCategories", 663301];
		(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) ctrlAddEventHandler [
			"TreeSelChanged",
			{
				_this call lilc_map_fnc_handleTreeSelChanged;
			}
		];

		private _subConfigs = ("true" configClasses (missionConfigFile >> "CfgMarkerFilters"));
		{
			private _c = (configName _x);
			private _i = ((((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvAdd [[], getText(_x >> "displayName")]);
			(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvSetData [[_i], _c];
			(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvSetValue [[_i], 1];

			
			if ((count getArray(_x >> "markers")) > 0 || (count ("true" configClasses _x)) > 0) then
			{
				(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvSetPicture [
					[_i],
					"a3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"
				];
			};

			{
				private _cS = (configName _x);
				private _j = ((((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvAdd [[_i], getText(_x >> "displayName")]);
				(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvSetData [[_i, _j], _cS];
				(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvSetValue [[_i, _j], 1];
				(((findDisplay 12) displayCtrl 663301) controlsGroupCtrl 1500) tvSetPicture [
					[_i, _j],
					"a3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"
				];
			} forEach ("true" configClasses _x);
		} forEach _subConfigs;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
