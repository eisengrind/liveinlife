
disableSerialization;
try {
    if !(dialog) throw false;
    if (lilc_interaction_type == "") throw false;
    _ui = (findDisplay 1228);
    if (isNull _ui) throw false;

    private _uiBackgroundButtons = (_ui displayCtrl 1240);
    private _uiBackgroundFooter = (_ui displayCtrl 1241);
    private _uiButtonClose = (_ui displayCtrl 1242);
    private _uiButton1 = (_ui displayCtrl 1229);
    private _uiButton2 = (_ui displayCtrl 1230);
    private _uiButton3 = (_ui displayCtrl 1231);
    private _uiButton4 = (_ui displayCtrl 1232);
    private _uiButton5 = (_ui displayCtrl 1233);
    private _uiButton6 = (_ui displayCtrl 1234);
    private _uiButton7 = (_ui displayCtrl 1235);
    private _uiButton8 = (_ui displayCtrl 1236);
    private _buttonControls = [_uiButton1, _uiButton2, _uiButton3, _uiButton4, _uiButton5, _uiButton6, _uiButton7, _uiButton8];

    private _buttonClasses = ("true" configClasses (missionConfigFile >> "CfgInteractions" >> lilc_interaction_type));
    if ((count _buttonClasses) <= 0) throw false;

    private _buttonsOff = 0;
    {
        private _button = _x;
        if !((_forEachIndex + 1) > (count _buttonClasses)) then {
            private _config = _buttonClasses select _forEachIndex;
            if !(isNull _config) then {
                private _actionConfig = configNull;
                
                private _actionClasses = ("true" configClasses _config);
                
                if ((count _actionClasses) > 0) then {
                    try {
                        {
                            private _result = nil;
                            _result = call compile getText(_x >> "condition");
                            if !(isNil "_result") then {
                                if (_result) then {
                                    throw _x;
                                } else {
                                    if ((getNumber(_x >> "replaceable")) <= 0) then {
                                        throw configNull;
                                    };
                                };
                            };
                        } forEach _actionClasses;
                    } catch {
                        _actionConfig = _exception;
                    };

                    if (isNull _actionConfig) then {
                        _actionConfig = (_actionClasses select 0);
                    };

                    private _result = nil;
                    _result = call compile getText(_actionConfig >> "condition");
                    
                    _button ctrlShow true;
                    _button ctrlSetText getText(_actionConfig >> "displayName");
                    if !(isNil "_result") then {
                        if (_result) then {
                            if ((getNumber(_actionConfig >> "noAutoClose")) >= 1) then {
                                _button buttonSetAction getText(_actionConfig >> "action");
                            } else {
                                _button buttonSetAction format["%1 call lilc_interaction_fnc_closeMenu;", getText(_actionConfig >> "action")];
                            };
                        } else {
                            _button ctrlEnable false;
                        };
                    };
                };
            };
        } else {
            _buttonsOff = _buttonsOff + 1;
            _button ctrlShow false;
        };
    } forEach _buttonControls;
    if (_buttonsOff == 0) throw true;

    private _backgroundButtonsPos = ctrlPosition _uiBackgroundButtons; 
    private _backgroundFooterPos = ctrlPosition _uiBackgroundFooter; 
    private _closeButtonPos = ctrlPosition _uiButtonClose;

    private _buttonHeight = ((ctrlPosition _uiButton2) select 1) - ((ctrlPosition _uiButton1) select 1);

    _uiBackgroundButtons ctrlSetPosition [(_backgroundButtonsPos select 0), (_backgroundButtonsPos select 1), (_backgroundButtonsPos select 2), ((_backgroundButtonsPos select 3) - (_buttonsOff * _buttonHeight))];
    _uiBackgroundFooter ctrlSetPosition [(_backgroundFooterPos select 0), ((_backgroundFooterPos select 1) - (_buttonsOff * _buttonHeight))];
    _uiButtonClose ctrlSetPosition [(_closeButtonPos select 0), ((_closeButtonPos select 1) - (_buttonsOff * _buttonHeight))];

    _uiBackgroundButtons ctrlCommit 0;
    _uiBackgroundFooter ctrlCommit 0;
    _uiButtonClose ctrlCommit 0;

    throw true;
} catch {
    _exception;
};
