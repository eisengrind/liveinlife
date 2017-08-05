
disableSerialization;
private _ui = (findDisplay 1302);

private _uiButtonOK = (_ui displayCtrl 2400);
private _uiButtonRight = (_ui displayCtrl 2402);
private _uiButtonLeft = (_ui displayCtrl 2403);

_uiButtonOK ctrlRemoveAllEventHandlers "ButtonClick";
_uiButtonRight ctrlSetText "";
_uiButtonLeft ctrlSetText "";
_uiButtonRight ctrlRemoveAllEventHandlers "ButtonClick";
_uiButtonLeft ctrlRemoveAllEventHandlers "ButtonClick";


ctrlDelete (_ui displayCtrl 2301);
