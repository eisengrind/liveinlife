
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !(createDialog "lilcm_atcInterface") throw false;

	if (isNil "lilc_atcInterface_currentPlaneControl") then
	{
		lilc_atcInterface_currentPlaneControl = -1;
	};

	lilc_atcInterface_onEachFrameIndex = (["lilce_atcInterface_update", "onEachFrame", {
		call lilc_atcInterface_fnc_onEachFrame;
	}] call BIS_fnc_addStackedEventHandler);
	[] spawn lilc_atcInterface_fnc_iterateMapUpdate;
}
catch
{
	_exception;
};
