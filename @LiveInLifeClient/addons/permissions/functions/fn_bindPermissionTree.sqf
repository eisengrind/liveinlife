
[_this] params [
	["_permissionSubtypes", [], [[]]]
];

try
{
	if ((count _permissionSubtypes) <= 0) throw "";
	if ((count _permissionSubtypes) == 1) throw (_permissionSubtypes select 0);

	private _permission = (_permissionSubtypes select 0);
	for "_i" from 1 to ((count _permissionSubtypes) - 1) do
	{
		_permission = ([_permission, (_permissionSubtypes select _i)] call lilc_permissions_fnc_bindPermission);
	};
	
	throw _permission;
}
catch
{
	_exception;
};
