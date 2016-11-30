disableSerialization;
_ui = uiNamespace getVariable ["lilc_playerTags", displayNull]; 
if (isNull _ui) exitWith {};

for [{_i = 0}, {_i < 64}, {_i = _i + 1}] do {
    _ctrlTag = _ui displayCtrl (1055 + _i);
    if (ctrlShown _ctrlTag) then {
        _ctrlTag ctrlShow false;
    };
};
    
_objects = []; 
_objects = nearestObjects [player, ["Man"], 50]; 
_objects = _objects - [player]; 
    
if !((count _objects) <= 0) then { 
    { 
        private ["_position"]; 
        _ctrlTag = _ui displayCtrl (1055 + _forEachIndex);

        try {
            if (((_x distance player) < 14 && isPlayer _x && alive _x) || (!isPlayer _x && alive _x && (_x getVariable ["lilc_aiName", ""]) != "" && (_x isKindOf "Man"))) then {
                if !(lineIntersects [(eyePos player), (eyePos _x), player, _x]) then { 
                    if (vehicle _x == _x ) then {
                        _position = [((visiblePosition _x) select 0), ((visiblePosition _x) select 1), (((_x modelToWorld (_x selectionPosition "head")) select 2) + 0.43)]; 
                        
                        _screenPosition = worldToScreen _position; 
                        if ((count(_screenPosition)) <= 0) then { throw false; };

                        _scale = (1 - ((_position distance player) / 15)); 
                        if (_scale <= 0.5) then { _scale = 0.5; }; 
                        _screenPosition set [0, ((_screenPosition select 0) - (0.35 * _scale))];                    
                        
                        _text = "";
                        if ((_x getVariable ["lilc_aiName", ""]) != "" && !isPlayer _x) then {
                            _text = (_x getVariable ["lilc_aiName", ""]);
                        } else {
                            _text = format["%1", ([_x] call lilc_tags_fnc_getPlayerTag)];
                        };

                        _ctrlTag ctrlSetPosition [_screenPosition select 0, _screenPosition select 1, 0.7, 0.6]; 
                        _ctrlTag ctrlSetStructuredText parseText format["<t align='center'>%1</t>", _text]; 
                        _ctrlTag ctrlSetScale _scale; 
                        _ctrlTag ctrlSetFade 0; 
                        _ctrlTag ctrlCommit 0; 
                        _ctrlTag ctrlShow true; 
                    } else { throw false; }; 
                } else { throw false; };
            } else { throw false; };
        } catch { 
            if !(_exception) then { 
                _ctrlTag ctrlShow false; 
            }; 
        };
    } forEach _objects; 
};


//&& ([_x] call lilc_login_fnc_unitIsKnown)
