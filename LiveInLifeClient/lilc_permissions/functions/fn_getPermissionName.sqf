
private _permission = param [0, "", [""]];

try
{
    if (_permission == "") throw "";

    private _stringtableName = (format["STR_permission_displayName_%1", _permission]);

    if (isLocalized _stringtableName) throw (localize _stringtableName);

    throw _permission;
}
catch
{
    _exception;
};
