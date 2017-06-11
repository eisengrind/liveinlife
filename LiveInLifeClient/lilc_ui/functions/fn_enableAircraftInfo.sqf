
if !(isNil "lilc_ui_aircraftInfo") then {
    terminate lilc_ui_aircraftInfo;
};

lilc_ui_aircraftInfo = ([] spawn {
    if (isNil "lilc_ui_aircraftInfo_disabled") then { lilc_ui_aircraftInfo_disabled = false; };
    [300, "lilc_ui_aircraftInfo", 0.01] call lilc_ui_fnc_fadeInTitles;
    private _ui = (uiNamespace getVariable ["lilc_ui_aircraftInfo", displayNull]);
    if (isNull _ui) exitWith {};

    private _uiFrameBackground = (_ui displayCtrl 1504);
    private _uiTextInformation = (_ui displayCtrl 1505);

    while { true } do {
        if (
            (
                ((driver vehicle player) isEqualTo player) ||
                ((gunner vehicle player) isEqualTo player)
            ) &&
            ((vehicle player) != player) &&
            ([(vehicle player), ["Air", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) && !lilc_ui_aircraftInfo_disabled
        ) then {
            if !(ctrlShown _uiFrameBackground && lilc_ui_aircraftInfo_disabled) then { _uiFrameBackground ctrlShow true; };
            if !(ctrlShown _uiTextInformation && lilc_ui_aircraftInfo_disabled) then { _uiTextInformation ctrlShow true; };
            _uiTextInformation ctrlSetStructuredText parseText format["<t size='0.88' font='PuristaMedium'><t>Height (ASL/m): </t><t>%1 m</t><br /><t>Height (feet): </t><t>%2 ft</t><br /><t>Knots: </t><t>%3 kt</t><br /><t>Callsign: </t><t>%4</t></t>", (round ((getPosASL vehicle player) select 2)), (round (3.28 * ((getPosASL vehicle player) select 2))), (round (0.51 * (speed vehicle player))), ((vehicle player) getVariable ["lilc_garage_callsign", "No Callsign"])];
        } else {
            _uiFrameBackground ctrlShow false;
            _uiTextInformation ctrlShow false;
        };
        
        if !(alive player) exitWith {};
        sleep 0.02;
    };
    
    [] spawn lilc_ui_fnc_disableAircraftInfo;
});
