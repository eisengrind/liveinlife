
disableSerialization;
params [
	"_ctrl",
	"_path"
];

private _cfg = (missionConfigFile >> "CfgMarkerFilters");
for "_i" from 0 to ((count _path) - 1) do
{
	_cfg = (_cfg >> (_ctrl tvData (_path select [0, (_i + 1)])));
};

if (isNull _cfg) exitWith {};

private _cV = (_ctrl tvValue _path);
_cV = (if (_cV > 0) then { 0; } else { 1; });
private _childCount = (_ctrl tvCount _path);

if (_childCount > 0) then
{
	for "_i" from 0 to (_childCount - 1) do
	{
		private _p = (_path + [_i]);
		private _pCfg = (_cfg >> (_ctrl tvData _p));
		private _markers = (getArray(_pCfg >> "markers"));

		[_markers, _cV] call lilc_map_fnc_setMarkerStatus;
		[_ctrl, _p, _cV] call lilc_map_fnc_setTreeStatus;
	};
};

[(getArray(_cfg >> "markers")), _cV] call lilc_map_fnc_setMarkerStatus;
[_ctrl, _path, _cV] call lilc_map_fnc_setTreeStatus;
