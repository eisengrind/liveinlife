
private _cI = lbCurSel 2100;
if (_cI <= -1) exitWith {};

private _job = lbData [2100, _cI];
private _cfg = missionConfigFile >> "CfgJobAgents" >> ((findDisplay 2049) getVariable ["lilc_job_agent_agent", ""]) >> "jobs" >> _job;
if (isNull _cfg) exitWith {};

private _items = getArray(_cfg >> "items");
private _vehs = (nearestObjects [
    player,
    [],
    20
]) select { ([_x] call lilc_keys_fnc_have) || (_x isEqualTo player); };

try {
    {
        private _count = 0;
        private _item = _x select 0;
        private _amount = _x select 1;

        {
            private _veh = _x;
            _count = _count + ([_item, _veh] call lilc_inventory_fnc_itemCount);
        } forEach _vehs;

        if (_count < _amount) throw false;
    } forEach _items;

    throw true;
} catch {
    if (_exception) then {
        try {
            {
                private _item = _x select 0;
                private _amount = _x select 1;
                private _count = 0;
                {
                    for "_i" from 0 to (_amount - 1) do {
                        if !([_x, _item] call lilc_inventory_fnc_remove) exitWith {};
                        _count = _count + 1;
                        if (_count >= _amount) throw true;
                    };
                } forEach _vehs;
                if (_count < _amount) throw false;
            } forEach _items;
            throw true;
        } catch {
            if (_exception) then {
                closeDialog 0;
                [getNumber(_cfg >> "price")] call lilc_cash_fnc_add;
                lilc_job_agent_stage = lilc_job_agent_stage + 1;
                lilc_job_agent_activeTasks deleteAt (lilc_job_agent_activeTasks find _job);
                ["Du hast den Auftrag erledigt."] call lilc_ui_fnc_hint;
            } else {
                ["Du hast nicht genügend Items dabei.", "ERROR"] call lilc_ui_fnc_hint;
            };
        };
    } else {
        ["Du hast nicht genügend Items dabei.", "ERROR"] call lilc_ui_fnc_hint;
    };
};
