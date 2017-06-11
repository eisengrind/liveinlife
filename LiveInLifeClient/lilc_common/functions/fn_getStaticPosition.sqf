
/*
    Filename:
        fn_getStaticPosition.sqf
    Author:
        Vincent Heins
    Description:
        Returns a static position defined in CfgStaticPositions.
    Param(s):
        (_this select 0) : the config name of the static position : <STRING>
    Result(s):
        the posDir format : <ARRAY(2)>
*/

private _name = param [0, "", [""]];

try {
	if (_name == "") throw [];
	
	private _config = (missionConfigFile >> "CfgStaticPositions" >> _name);
	if (isNull _config) throw [];
	
	throw [(getArray(_config >> "position")), (getNumber(_config >> "direction"))];
} catch {
	_exception;
};
