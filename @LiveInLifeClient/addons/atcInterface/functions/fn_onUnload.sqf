
/* ----------------------------------------------------------------------------
Function: <function name>
Scope: <private or public>

Description:
    Is the eventhandler function of the event onEachFrame.

Parameters:
    -

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

closeDialog 1420;
[lilc_atcInterface_onEachFrameIndex, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
lilc_atcInterface_onEachFrameIndex = "";

{
    _x setMarkerAlphaLocal 1;
} forEach allMapMarkers;
