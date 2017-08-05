
/* ----------------------------------------------------------------------------
Function: CBA_fnc_localEventReturn
Description:
    Raises a CBA event on the local machine.
Parameters:
    _eventName - Type of event to publish. <STRING>
    _params    - Parameters to pass to the event handlers. <ANY>
Returns:
    _return - return every event return value. <ARRAY[<ANY>]>
Examples:
    (begin example)
        _return = ["test", ["local"]] call CBA_fnc_localEventReturn;
    (end)
Author:
    Spooner, commy2
Modified Author:
	Vincent Heins
---------------------------------------------------------------------------- */

scriptName "cba\events\localEventReturn";

params [["_eventName", "", [""]], ["_params", []]];

//CALL_EVENT(args, event)
private _return = [];
{
	_return pushBack (_params call _x);
} forEach +([cba_events_eventNamespace getVariable _eventName] param [0, []]);

_return;
