
disableSerialization;

private _ui = (uiNamespace getVariable ["lilc_hud", displayNull]);
if (isNull _ui) exitWith {};

private _uiPictureBackground = (_ui displayCtrl 1200);
private _uiStructuredText = (_ui displayCtrl 1100);

private _text = "";
{
    private _info = ([lilc_hud_infos, _x] call CBA_fnc_hashGet);

    if (call (_info select 1)) then
    {
        _text = format[
            "%1%2%3",
            _text,
            (if (_forEachIndex <= 0) then { ""; } else { "<br />"; }),
            (call (_info select 0))
        ];
    };
} forEach ([lilc_hud_infos] call CBA_fnc_hashKeys);

_text = format["<t align='right'>%1</t>", _text];
_uiStructuredText ctrlSetStructuredText parseText _text;

private _tH = (ctrlTextHeight _uiStructuredText);
private _pos1 = (ctrlPosition _uiPictureBackground);
_uiPictureBackground ctrlSetPosition [
    (_pos1 select 0),
    (_pos1 select 1),
    (_pos1 select 2),
    _tH + lilc_hud_borderHeight
];
_uiPictureBackground ctrlCommit 0.6;

private _pos2 = (ctrlPosition _uiStructuredText);
_uiStructuredText ctrlSetPosition [
    (_pos2 select 0),
    (_pos2 select 1),
    (_pos2 select 2),
    _tH
];
_uiStructuredText ctrlCommit 0.5;
