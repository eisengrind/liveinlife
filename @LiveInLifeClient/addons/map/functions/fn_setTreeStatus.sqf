
disableSerialization;
params [
	"_ctrl",
	"_path",
	"_status"
];

_ctrl tvSetPicture [
	_path,
	(if (_status == 1) then
	{
		"a3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	}
	else
	{
		"a3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	})
];
_ctrl tvSetValue [_path, _status];
