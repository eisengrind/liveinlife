
if !([player] call lilc_common_fnc_isAlive) exitWith { false; };
if !(createDialog "lilcm_atcInterface") exitWith { false; };

if (isNil "lilc_atcInterface_currentPlaneControl") then
{
	lilc_atcInterface_currentPlaneControl = -1;
};

{
	_x setMarkerAlphaLocal 0;
} forEach allMapMarkers;

lilc_atcInterface_onEachFrameIndex = (["lilce_atcInterface_update", "onEachFrame", {
	call lilc_atcInterface_fnc_onEachFrame;
}] call BIS_fnc_addStackedEventHandler);
[] spawn lilc_atcInterface_fnc_iterateMapUpdate;
