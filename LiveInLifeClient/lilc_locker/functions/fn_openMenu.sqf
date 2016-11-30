
private _lockerName = param [0, "", [""]];

try {
    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw false;

    disableSerialization;
    createDialog "lilc_lockerMenu";
    private _ui = (findDisplay 1440);
    if (isNull _ui) throw false;

    lilc_locker_onKeyDownIndex = _ui displayAddEventHandler ["KeyDown", { if ((_this select 1) == 1) then { true; } else { false; }; }];

    _uiTitle = (_ui displayCtrl 1444);
    _uiTitle ctrlSetText getText(_lockerConfig >> "displayName");

    call lilc_locker_fnc_updateMenu;
    throw true;
} catch {
    _exception;
};
