
try {
    if ((vehicle player) == player) throw false;
    if ((driver vehicle player) != player) throw false;

    ["lilc_ui_planeHUD", 0.01] call lilc_ui_fnc_fadeInTitles;
    
    disableSerialization;
    private _ui = (uiNamespace getVariable ["lilc_ui_planeHUD", displayNull]);
    if (isNull _ui) throw false;

    private _uiTextInformation = (_ui displayCtrl 1504);

    while { true } do {
        waitUntil { ((vehicle player) != player) };

        if ((vehicle player) isKindOf "Air" || (vehicle player) isKindOf "Plane" || (vehicle player) isKindOf "Helicopter") then {
            if (isNull _ui) then {
                ["lilc_ui_planeHUD", 0.01] call lilc_ui_fnc_fadeInTitles;
                _ui = (uiNamespace getVariable ["lilc_ui_planeHUD", displayNull]);
                _uiTextInformation = (_ui displayCtrl 1504);
            };

            if ((driver vehicle player) == player && ((vehicle player) != player)) then {
                _uiTextInformation ctrlSetStructuredText parseText format["<t size='0.88' font='PuristaMedium'><t>Height (ASL/m): </t><t>%1 m</t><br /><t>Height (feet): </t><t>%2 ft</t><br /><t>Heading: </t><t>%3°</t><br /><t>Knots: </t><t>%4 kt</t></t>", (round ((getPosASL vehicle player) select 2)), (round (3.28 * ((getPosASL vehicle player) select 2))), (round (getDir vehicle player)), (round (0.51 * (speed vehicle player)))];
            } else {
                [0.01, 99] call lilc_ui_fnc_fadeOutTitles;
            };
        } else {
            if !(isNull _ui) then {
                [0.01, 99] call lilc_ui_fnc_fadeOutTitles;
            };
        };
        
        sleep 0.05;
    };

    [0.01, 99] call lilc_ui_fnc_fadeOutTitles;
    throw true;
} catch {
    _exception;
};
