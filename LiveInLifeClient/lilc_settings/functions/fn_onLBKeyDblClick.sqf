
disableSerialization;
params [
    ["_uiListKeys", controlNull, [controlNull]],
    ["_index", -1, [-1]]
];

try {
    if !(dialog) throw false;
    if (isNull _uiListKeys) throw false;
    if (_index <= -1) throw false;

    _ui = (findDisplay 1330);
    if (isNull _ui) throw false;

    _uiListKeys lnbSetText [[_index, 1], "Press a key or Esc to exit"];
    _uiListKeys lnbSetColor [[_index, 1], [0, 1, 0, 1]];

    lilc_setting_keyUpIndex = _ui displayAddEventHandler ["KeyUp", {
        _this call lilc_settings_fnc_setKey;
        true;
    }];
} catch {
    _exception;
};
