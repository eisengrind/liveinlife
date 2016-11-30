
private ["_xCoord", "_yCoord", "_ui", "_background", "_button1", "_button2", "_button3", "_button4", "_xDiff", "_yDiff"];

try {
	disableSerialization;
	params [
		["_list", controlNull],
		["_index", -1, [-1]]
	];
	
	if (isNull _list) then { throw true; };
	if (_index == -1) then { throw true; };
	_ui = (findDisplay 602);
	
	_data = _list lbData _index;
	if (_data == "" || isNil "_data") then { throw true; };
	//_config = [_data] call LiveInLifeClient_inventory_fnc_getItemInfo;
	_options = [(configFile >> "CfgWeapons" >> _data), "menuOptions", []] call BIS_fnc_returnConfigEntry;
	if ((count _options) <= 0 || (count _options) > 4) exitWith { throw true; };
	
	_mPos = getMousePosition;
	_xCoord = _mPos select 0;
	_yCoord = _mPos select 1;

	_background1 = _ui displayCtrl 1350;
	_background2 = _ui displayCtrl 1355;
	_button1 = _ui displayCtrl 1351;
	_button2 = _ui displayCtrl 1352;
	_button3 = _ui displayCtrl 1353;
	_button4 = _ui displayCtrl 1354;
	
	_background1 ctrlShow true;
	_background2 ctrlShow true;
	
	{ _x ctrlEnable false; _x ctrlShow false; } forEach [_button1, _button2, _button3, _button4];

	_background1Position = ctrlPosition _background1;
	_background2Position = ctrlPosition _background2;
	
	switch (count _options) do {
		case 1: {
			private ["_lastPos"];
			_button1 ctrlSetText ((_options select 0) select 0);
			_button1 buttonSetAction ((_options select 0) select 1);
			_button1 ctrlEnable true;
			_button1 ctrlShow true;
						
			_lastPos = ctrlPosition _button1;
			_background1 ctrlSetPosition [(_background1Position select 0), (_background1Position select 1), (_background1Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3) + 0.004)];
			_background2 ctrlSetPosition [(_background2Position select 0), (_background2Position select 1), (_background2Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3))];
		};
		case 2: {
			private ["_lastPos"];
			{
				private ["_option"];
				_option = _options select _forEachIndex;
				_x ctrlSetText (_option select 0);
				_x buttonSetAction (_option select 1);
				_x ctrlEnable true;
				_x ctrlShow true;
			} forEach [_button1, _button2];
			
			_lastPos = ctrlPosition _button2;
			_background1 ctrlSetPosition [(_background1Position select 0), (_background1Position select 1), (_background1Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3) + 0.004)];
			_background2 ctrlSetPosition [(_background2Position select 0), (_background2Position select 1), (_background2Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3))];
		};
		case 3: {
			private ["_lastPos"];
			{
				private ["_option"];
				_option = _options select _forEachIndex;
				_x ctrlSetText (_option select 0);
				_x buttonSetAction (_option select 1);
				_x ctrlEnable true;
				_x ctrlShow true;
			} forEach [_button1, _button2, _button3];
			
			_lastPos = ctrlPosition _button3;
			_background1 ctrlSetPosition [(_background1Position select 0), (_background1Position select 1), (_background1Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3) + 0.004)];
			_background2 ctrlSetPosition [(_background2Position select 0), (_background2Position select 1), (_background2Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3))];
		};
		case 4: {
			private ["_lastPos"];
			{
				private ["_option"];
				_option = _options select _forEachIndex;
				_x ctrlSetText (_option select 0);
				_x buttonSetAction (_option select 1);
				_x ctrlEnable true;
				_x ctrlShow true;
			} forEach [_button1, _button2, _button3, _button4];
			
			_lastPos = ctrlPosition _button4;
			_background1 ctrlSetPosition [(_background1Position select 0), (_background1Position select 1), (_background1Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3) + 0.004)];
			_background2 ctrlSetPosition [(_background2Position select 0), (_background2Position select 1), (_background2Position select 2), (((_lastPos select 1) - (_background2Position select 1)) + (_lastPos select 3))];
		};
	};
	_background1 ctrlCommit 0;
	_background2 ctrlCommit 0;

	_xOld = ((ctrlPosition _background1) select 0);
	_yOld = ((ctrlPosition _background1) select 1);
	_xDiff = _xCoord - _xOld;
	_yDiff = _yCoord - _yOld;

	_background1 ctrlSetPosition [_xCoord, _yCoord];
	_background2 ctrlSetPosition [((ctrlPosition _background2) select 0) + _xDiff, ((ctrlPosition _background2) select 1) + _yDiff];
	_button1 ctrlSetPosition [((ctrlPosition _button1) select 0) + _xDiff, ((ctrlPosition _button1) select 1) + _yDiff];
	_button2 ctrlSetPosition [((ctrlPosition _button2) select 0) + _xDiff, ((ctrlPosition _button2) select 1) + _yDiff];
	_button3 ctrlSetPosition [((ctrlPosition _button3) select 0) + _xDiff, ((ctrlPosition _button3) select 1) + _yDiff];
	_button4 ctrlSetPosition [((ctrlPosition _button4) select 0) + _xDiff, ((ctrlPosition _button4) select 1) + _yDiff];

	_background1 ctrlCommit 0;
	_background2 ctrlCommit 0;
	_button1 ctrlCommit 0;
	_button2 ctrlCommit 0;
	_button3 ctrlCommit 0;
	_button4 ctrlCommit 0;

	ctrlSetFocus _background1;
	ctrlSetFocus _background2;
	ctrlSetFocus _button1;
	ctrlSetFocus _button2;
	ctrlSetFocus _button3;
	ctrlSetFocus _button4;
} catch {
	if (_exception) then {
		call lilc_inventory_fnc_contextMenuDisable;
	};
};
