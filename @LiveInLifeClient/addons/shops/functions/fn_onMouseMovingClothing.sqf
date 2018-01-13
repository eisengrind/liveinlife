
params [
    ["_display", displayNull, [displayNull]],
    ["_xDiff", 0, [0]],
    ["_yDiff", 0, [0]]
];

if (isNull lilc_shops_clothing_camera) exitWith {};
if (isNil "lilc_shops_clothing_isMouseDown") then { lilc_shops_clothing_isMouseDown = false; };
if (lilc_shops_clothing_isMouseDown) then {
    if (isNil "lilc_shops_clothing_defaultMousePosition") then { lilc_shops_clothing_defaultMousePosition = (position player); };
    
    private _mousePositionLast = (if (isNil "lilc_shops_clothing_mousePosition") then { getMousePosition; } else { lilc_shops_clothing_mousePosition; });
    
    lilc_shops_clothing_mousePosition = [((_mousePositionLast select 0) + (_xDiff * 0.009))];
    private _relPos = [0, 0, 0.4];
    _relPos set [0, (sin ((lilc_shops_clothing_mousePosition select 0) * 360)) * 2];
    _relPos set [1, (cos ((lilc_shops_clothing_mousePosition select 0) * 360)) * 2];
    
    private _lastPositionHeight = (lilc_shops_clothing_lastPosition select 2);
    if ((_lastPositionHeight + (_yDiff * 0.009)) > 2) then {
        lilc_shops_clothing_lastPosition set [2, 2];
    } else {
        if ((_lastPositionHeight + (_yDiff * 0.009)) < 0.5) then {
            lilc_shops_clothing_lastPosition set [2, 0.5];
        } else {
            lilc_shops_clothing_lastPosition set [2, (_lastPositionHeight + (_yDiff * 0.009))];
        };
    };
    
    lilc_shops_clothing_camera camSetTarget (lilc_shops_clothing_lastPosition vectorAdd lilc_shops_clothing_defaultPosition);
    lilc_shops_clothing_camera camSetRelPos _relPos;
    lilc_shops_clothing_camera camCommit 0.01;
};
false;
