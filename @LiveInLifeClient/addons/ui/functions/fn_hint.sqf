
/*
IDC space = 18000+
Variables:
*/

disableSerialization;
scriptName "\x\lilc\addons\ui\hint";

params [
    ["_message", "", [""]],
    ["_type", "NORMAL", [""]]
];

try
{
    if !(lilc_setting_ui_enableHints) throw false;
    if (_message == "") throw false;

    private _hintTypes = (("true" configClasses (missionConfigFile >> "CfgHints")) + ("true" configClasses (configFile >> "CfgHints")));
    private _typeIndex = ((_hintTypes apply { (configName _x); }) find _type);
    if (_typeIndex <= -1) throw false;
    private _typeConfig = _hintTypes select _typeIndex;
    private _typeColor = (getArray(_typeConfig >> "color"));
    private _typeBackgroundColor = (getArray(_typeConfig >> "colorBackground"));
    private _typeSound = getText(_typeConfig >> "sound");

    private _ui = (uiNamespace getVariable ["lilc_ui_hint", displayNull]);
    if (isNull _ui) throw false;

    private _defaultSpacing = 0.015;
    private _defaultHintAmount = 10;

    private _defaultHintPosition = [
        (profileNamespace getVariable ["igui_grid_lilc_hint_x", 0]),
        (profileNamespace getVariable ["igui_grid_lilc_hint_y", 0]),
        (getNumber(configFile >> "lilc_groupHint" >> "w")),
        (getNumber(configFile >> "lilc_groupHint" >> "h"))
    ];

    private _lastElement = (_ui getVariable ["lilc_ui_lastElement", controlNull]);

    private _uiGroup = (_ui ctrlCreate ["lilc_groupHint", -1]);

    if !(isNull _lastElement) then
    {
        _uiGroup setVariable ["lilc_ui_nextElement", _lastElement];
    };
    _ui setVariable ["lilc_ui_lastElement", _uiGroup];

    private _uiGroupTextMessage = (_uiGroup controlsGroupCtrl 1614);
    private _uiGroupFrameBackground = (_uiGroup controlsGroupCtrl 1613);
    private _groupTextMessagePosition = (ctrlPosition _uiGroupTextMessage);
    private _groupFrameBackgroundPosition = (ctrlPosition _uiGroupFrameBackground);

    _uiGroupTextMessage ctrlSetBackgroundColor [0, 0, 0, 0];
    _uiGroupTextMessage ctrlSetStructuredText parseText _message;
    _uiGroupFrameBackground ctrlSetBackgroundColor _typeBackgroundColor;

    private _groupTextHeight = (ctrlTextHeight _uiGroupTextMessage);
    private _uiGroupPictureColor = (_uiGroup controlsGroupCtrl 1612);

    private _defDif = 2 * ((_groupTextMessagePosition select 1) - (_groupFrameBackgroundPosition select 1));

    _uiGroupPictureColor ctrlSetBackgroundColor [
        (_typeColor select 0),
        (_typeColor select 1),
        (_typeColor select 2),
        (_typeColor select 3)
    ];
    private _groupPictureColorPosition = (ctrlPosition _uiGroupPictureColor);

    _uiGroup ctrlSetFade 1;
    _uiGroup ctrlSetPosition [
        (_defaultHintPosition select 0),
        (_defaultHintPosition select 1) - _groupTextHeight - _defaultSpacing,
        (_defaultHintPosition select 2),
        _groupTextHeight + _defDif
    ];
    _uiGroup ctrlCommit 0;
    _groupPosition = (ctrlPosition _uiGroup);

    _uiGroupTextMessage ctrlSetPosition [
        (_groupTextMessagePosition select 0),
        (_groupTextMessagePosition select 1),
        (_groupTextMessagePosition select 2),
        _groupTextHeight
    ];
    _uiGroupTextMessage ctrlCommit 0;

    _uiGroupFrameBackground ctrlSetPosition [
        (_groupFrameBackgroundPosition select 0),
        (_groupFrameBackgroundPosition select 1),
        (_groupFrameBackgroundPosition select 2),
        _groupTextHeight + _defDif
    ];
    _uiGroupFrameBackground ctrlCommit 0;

    _uiGroupPictureColor ctrlSetPosition [
        (_groupPictureColorPosition select 0),
        (_groupPictureColorPosition select 1),
        (_groupPictureColorPosition select 2),
        _groupTextHeight + _defDif
    ];
    _uiGroupPictureColor ctrlCommit 0;

    _uiGroup ctrlSetPosition [
        (_groupPosition select 0),
        (_defaultHintPosition select 1)
    ];
    _uiGroup ctrlSetFade 0;
    _uiGroup ctrlCommit 0.3;

    playSound _typeSound; 

    private _handle = ([_uiGroup] spawn
    {
        disableSerialization;
        scriptName "\x\lilc\addons\ui\hint_control_fadeOut";

        private _currentControl = (_this select 0);
        _currentControl ctrlCommit (profileNamespace getVariable ["lilc_ui_hintDisplayTime", 6]);
        waitUntil { (ctrlCommitted _currentControl) };
        lilc_ui_hint_lastControls deleteAt (lilc_ui_hint_lastControls find ctrlIDC _currentControl);
        _currentControlPosition = (ctrlPosition _currentControl);
        _currentControl ctrlSetPosition [
            (_currentControlPosition select 0),
            ((_currentControlPosition select 1) + 0.12)
        ];
        _currentControl ctrlSetFade 1;
        _currentControl ctrlCommit 0.5;
        waitUntil { (ctrlCommitted _currentControl) };
        ctrlDelete _currentControl;
    });
    _uiGroup setVariable ["lilc_ui_fadeScript", _handle];

    private _nextControl = _lastElement;
    private _currentHeight = (_groupTextHeight + _defaultSpacing);
    private _i = 0;

    while
    {
        !isNull _nextControl
    }
    do
    {
        private _controlPosition = (ctrlPosition _nextControl);
        _nextControl ctrlSetPosition [
            (_controlPosition select 0),
            ((_defaultHintPosition select 1) + _currentHeight + _defDif)
        ];
        _currentHeight = (_currentHeight + (_controlPosition select 3) + _defaultSpacing);
        _nextControl ctrlCommit 0.3;
        if (_i > (_defaultHintAmount - 1) && !(_nextControl getVariable ["lilc_ui_disabled", false])) then
        {
            _nextControl setVariable ["lilc_ui_disabled", true];
            terminate (_nextControl getVariable ["lilc_ui_fadeScript", scriptNull]);
            _nextControl ctrlSetFade 1;
            private _currentControlPosition = (ctrlPosition _nextControl);
            _nextControl ctrlSetPosition [
                (_currentControlPosition select 0),
                ((_currentControlPosition select 1) + 0.3)
            ];
            _nextControl ctrlCommit 0.3;
            [_nextControl] spawn
            {
                disableSerialization;
                scriptName "\x\lilc\addons\ui\hint_control_fadeOut_lastElement";
                private _control = (_this select 0);
                waitUntil { (ctrlCommitted _control) };
                ctrlDelete _control;
            };
        };
        _nextControl = (_nextControl getVariable ["lilc_ui_nextElement", controlNull]);
        _i = _i + 1;
    };
}
catch
{
    _exception;
};
