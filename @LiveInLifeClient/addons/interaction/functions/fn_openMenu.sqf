
try {
    if (dialog) throw false;
    lilc_interaction_object = cursorTarget;
    if (isNull lilc_interaction_object) then {
        lilc_interaction_object = cursorObject;
    };
    
    if (isNull lilc_interaction_object) then {
        lilc_interaction_object = player;
    };
    if !(isClass(missionConfigFile >> "CfgInteractions")) throw false;

    lilc_interaction_type = "";
    try {
        {
            if (isText(_x >> "condition")) then {
                private _codeString = getText(_x >> "condition");
                
                if (_codeString == "") then { _codeString = "true;"; };

                private _result = nil;
                private _result = call compile _codeString;
                if (_result) then {
                    if (_result) throw (configName _x);
                };
            };
        } forEach ("true" configClasses (missionConfigFile >> "CfgInteractions"));
    } catch {
        lilc_interaction_type = _exception;
    };
    if (lilc_interaction_type == "") throw false;
    
    if (dialog) throw false;
    createDialog "interactionMenu";

    disableSerialization;
    
    if (isText(missionConfigFile >> "CfgInteractions" >> lilc_interaction_type >> "displayName")) then {
        _ui = (findDisplay 1228);
        if (isNull _ui) throw false;
        _uiTitle = _ui displayCtrl 1239;
        _uiTitle ctrlSetText getText(missionConfigFile >> "CfgInteractions" >> lilc_interaction_type >> "displayName");
    };

    call lilc_interaction_fnc_updateMenu;
} catch {
    _exception;
};

//if (isNull LiveInLifeClient_interaction_object) throw false;
