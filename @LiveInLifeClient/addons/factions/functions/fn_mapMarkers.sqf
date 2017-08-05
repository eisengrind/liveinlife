
try {
    if !(player getVariable ["lilc_factionLeader", false]) throw false;
    
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;

    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
    if (isNull _factionConfig) throw false;
  
    private _markerColorUnit = (if (getText(_factionConfig >> "markerColorUnit") != "") then { getText(_factionConfig >> "markerColorUnit"); } else { "colorBlue"; });
    private _markerTypeUnit = (if (getText(_factionConfig >> "markerTypeUnit") != "") then { getText(_factionConfig >> "markerTypeUnit"); } else { "mil_triangle"; });
    private _markerColorGroup = (if (getText(_factionConfig >> "markerColorGroup") != "") then { getText(_factionConfig >> "markerColorGroup"); } else { "colorBLUFOR"; });
    private _markerTypeGroup = (if (getText(_factionConfig >> "markerTypeGroup") != "") then { getText(_factionConfig >> "markerTypeGroup"); } else { "mil_dot"; });
    private _markerColorGroupUnit = (if (getText(_factionConfig >> "markerColorGroupUnit") != "") then { getText(_factionConfig >> "markerColorGroupUnit"); } else { "colorBLUFOR"; });
    private _markerTypeGroupUnit = (if (getText(_factionConfig >> "markerTypeGroupUnit") != "") then { getText(_factionConfig >> "markerTypeGroupUnit"); } else { "mil_triangle"; });

    private _friendlyUnitMarkers = [];

    while { true } do {
        waitUntil { visibleMap };

        {
            if (!isNull _x && isPlayer _x) then {
                private _owner = (str (owner _x));
                private _unitFactionID = (_x getVariable ["lilc_factionID", -1]);

                if (_unitFactionID == _factionID) then {
                    if !(_owner in _friendlyUnitMarkers) then {
                        private _identity = (_x getVariable ["lilc_identity", []]);

                        if ((count _identity) > 0) then {
                            private _tag = ([_unitFactionID] call lilc_factionsInterface_fnc_getRankInfo);
                            private _name = format["%1%2%3", format["%1. ", (_tag select 2)], (_identity select 1), (_identity select 2)];

                            private _unitMarker = createMarkerLocal [_owner, (position _x)];
                            _unitMarker setMarkerTextLocal format["%1 %2", (groupID group _x), _name];
                            
                            if ((group _x) getVariable ["lilc_factionMainGroup", false]) then {
                                _unitMarker setMarkerTypeLocal _markerTypeUnit;
                                _unitMarker setMarkerColorLocal _markerColorUnit;
                            } else {
                                _unitMarker setMarkerTypeLocal _markerTypeGroupUnit;
                                _unitMarker setMarkerColorLocal _markerColorGroupUnit;
                            };

                            _friendlyUnitMarkers pushBack _unitMarker;
                        };
                    } else {
                        _owner setMarkerPosLocal (position _x);
                    };
                };
            };
        } forEach playableUnits;

        sleep 0.5;        
    };
} catch {
    _exception;
};
