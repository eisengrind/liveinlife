
params [
	["_toAlterPermission", "", [""]],
	["_toBindPermission", "", [""]]
];

try
{
	if (_toAlterPermission == "") throw _toAlterPermission;
	if (_toBindPermission == "") throw _toAlterPermission;

	if ((_toBindPermission select [((count _toBindPermission) - 1), 1]) == ".") then
	{
		throw format["%1%2", _toAlterPermission, _toBindPermission];
	}
	else
	{
		throw format["%1.%2", _toAlterPermission, _toBindPermission];
	};

	throw _toAlterPermission; //doesnt happen? :)
}
catch
{
	_exception;
};
