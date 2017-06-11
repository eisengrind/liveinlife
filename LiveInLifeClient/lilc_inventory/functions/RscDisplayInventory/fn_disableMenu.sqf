
for "_i" from 0 to 8 do
{
	ctrlShow [(1351 + _i), false];
};

disableSerialization;
private _uiDropDownMenu = ((findDisplay 602) displayCtrl 1350);
private _position = (ctrlPosition _uiDropDownMenu);
_position set [3, 0];
_uiDropDownMenu ctrlSetPosition _position;
_uiDropDownMenu ctrlCommit 0;
_uiDropDownMenu ctrlShow false;
