
disableSerialization;
_ui = uiNamespace getVariable ['lilc_ui_loading', displayNull];;
if (isNull _ui) exitWith {};
lilc_ui_isLoading = true;
_uiLoadingPicture = _ui displayCtrl 1502;

/*
while { lilc_ui_isLoading } do {
    for [{_i = 0}, {_i < 90}, {_i = _i + 1}] do {
        _uiLoadingPicture ctrlSetAngle [((_i + 1) * 4), 0.5, 0.5];
        _uiLoadingPicture ctrlCommit 0;
        sleep 0.01;
        if (!lilc_ui_isLoading) exitWith {};
    };
};
*/

lilc_ui_isLoading = false;
