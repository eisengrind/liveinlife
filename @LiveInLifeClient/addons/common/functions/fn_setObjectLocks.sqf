
private _factionID = (player getVariable ["lilc_factionID", -1]);
private _t = "lilc_disabled_gates_";

{
    private _o = _x;

    {
        private _n = _x;
        
        if ((_n find _t) == 0) then
        {
            private _dV = (_n select [(count _t), ((count _n) - (count _t))]);
            private _oNV = (_o getVariable [_n, []]);

            if ((count _oNV) > 0) then
            {
                if (_factionID in _oNV) then
                {
                    _o setVariable [_dV, 1];
                }
                else
                {
                    _o setVariable [_dV, 0];
                };
            };
        };
    } forEach (allVariables _o);
} forEach (allMissionObjects "All");
