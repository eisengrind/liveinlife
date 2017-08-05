
closeDialog 1420;
[lilc_atcInterface_onEachFrameIndex, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
lilc_atcInterface_onEachFrameIndex = "";

{
	_x setMarkerAlphaLocal 1;
} forEach allMapMarkers;
