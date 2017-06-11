
params [
    ["_name", "", [""]]
];

try
{
    disableSerialization;
    private _ui = (findDisplay 1024);
    if (isNull _ui) throw false;
    private _uiGroupMainMenu = (_ui displayCtrl 2300);
    private _uiGroupProfileMenu = (_ui displayCtrl 2301);

    private _config = (configFile >> "lilcm_login" >> "controls");
    private _groupMainMenuPosition = [
        getNumber(_config >> "GroupMainMenu" >> "x"),
        getNumber(_config >> "GroupMainMenu" >> "y"),
        getNumber(_config >> "GroupMainMenu" >> "w")
    ];
    private _groupProfileMenuPosition = [
        getNumber(_config >> "GroupSelectProfileMenu" >> "x"),
        getNumber(_config >> "GroupSelectProfileMenu" >> "y"),
        getNumber(_config >> "GroupSelectProfileMenu" >> "w")
    ];
    _config = configNull;

    private _currentProfileID = 0;

    private _lastProfileID = (profileNamespace getVariable ["lilc_login_lastProfile", 0]);
    if (_lastProfileID > 0) then
    {
        if (({ ((_x select 0) == _lastProfileID) } count lilc_login_profiles) == 1) then
        {
            _currentProfileID = _lastProfileID;
        };
    };

    if ((count lilc_login_profiles) == 1) then
    {
        _currentProfileID = ((lilc_login_profiles select 0) select 0);
        (_uiGroupMainMenu controlsGroupCtrl 1001) ctrlEnable false;
    }
    else
    {
        if (_currentProfileID <= 0) then
        {
            _currentProfileID = ((lilc_login_profiles select 0) select 0);
            profileNamespace setVariable ["lilc_login_lastProfile", _currentProfileID];
            saveProfileNamespace;
        };
    };

    private _currentProfileID = (_ui getVariable ["lilc_ui_data_currentProfile", _currentProfileID]);
    _ui setVariable ["lilc_ui_data_currentProfile", _currentProfileID];

    if (_currentProfileID <= 0 || (({ ((_x select 0) == _currentProfileID) } count lilc_login_profiles) == 0)) then
    {
        endMission "lilc_login_noProfiles";
        throw false;
    };

    switch (_name) do
    {
        case "mainMenu":
        {
            private _uiGroupTextName = ((_uiGroupMainMenu controlsGroupCtrl 2300) controlsGroupCtrl 1004);
            private _uiGroupTextFaction = ((_uiGroupMainMenu controlsGroupCtrl 2300) controlsGroupCtrl 1005);

            (_uiGroupMainMenu controlsGroupCtrl 1201) ctrlSetText (["login_modIcon", "STRING", ""] call lilc_common_fnc_getSetting);

            private _currentProfileData = [];
            {
                if (_currentProfileID == (_x select 0)) exitWith
                {
                    if ((_x select 0) > 0 && (_x select 3) >= -1) then
                    {
                        _uiGroupTextName ctrlSetText format[
                            "Name: %1 %2",
                            (_x select 1),
                            (_x select 2)
                        ];
                        _uiGroupTextFaction ctrlSetText format[
                            "Fraktion: %1",
                            (if ((_x select 3) > -1) then
                            {
                                (getText(([(_x select 3)] call lilc_factions_fnc_getFactionConfig) >> "title"));
                            }
                            else
                            {
                                "Zivilist";
                            })
                        ];
                    };
                };
            } forEach lilc_login_profiles;

            if ((ctrlFade _uiGroupProfileMenu) < 1) then
            {
                _uiGroupProfileMenu ctrlSetFade 1;
                _uiGroupProfileMenu ctrlCommit 0;
            };

            _uiGroupMainMenu ctrlSetPosition [
                (_groupMainMenuPosition select 0),
                (_groupMainMenuPosition select 1)
            ];
            _uiGroupMainMenu ctrlSetFade 0;
            _uiGroupMainMenu ctrlCommit 0.5;

            _uiGroupProfileMenu ctrlSetPosition [
                (_groupProfileMenuPosition select 0) - (_groupProfileMenuPosition select 2),
                (_groupProfileMenuPosition select 1)
            ];
            _uiGroupProfileMenu ctrlSetFade 1;
            _uiGroupProfileMenu ctrlCommit 0.5;
        };

        case "profileMenu":
        {
            private _uiGroupList = (_uiGroupProfileMenu controlsGroupCtrl 1500);
            lbClear _uiGroupList;
            {
                //ID, FIRSTNAME, LASTNAME, `GROUP`
                private _index = (_uiGroupList lbAdd format[
                    "%1 %2 (%3)",
                    (_x select 1),
                    (_x select 2),
                    (if ((_x select 3) > -1) then
                    {
                        (getText(([(_x select 3)] call lilc_factions_fnc_getFactionConfig) >> "title"));
                    }
                    else
                    {
                        "Zivilist";
                    })
                ]);
                _uiGroupList lbSetValue [_index, (_x select 0)];
            } forEach lilc_login_profiles;

            _uiGroupProfileMenu ctrlSetPosition [
                (_groupProfileMenuPosition select 0),
                (_groupProfileMenuPosition select 1)
            ];
            _uiGroupProfileMenu ctrlSetFade 0;
            _uiGroupProfileMenu ctrlCommit 0.5;

            _uiGroupMainMenu ctrlSetPosition [
                (_groupMainMenuPosition select 0) - (_groupMainMenuPosition select 2),
                (_groupMainMenuPosition select 1)
            ];
            _uiGroupMainMenu ctrlSetFade 1;
            _uiGroupMainMenu ctrlCommit 0.5;
        };

        case "selectProfile":
        {
            private _uiGroupList = (_uiGroupProfileMenu controlsGroupCtrl 1500);
            private _currentIndex = (lbCurSel _uiGroupList);
            if (_currentIndex <= -1) then
            {
                ["Du hast kein Profil ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
                throw false;
            };

            private _value = (_uiGroupList lbValue _currentIndex);
            _ui setVariable ["lilc_ui_data_currentProfile", _value];
            profileNamespace setVariable ["lilc_login_lastProfile", _value];
            saveProfileNamespace;
            ["mainMenu"] call lilc_login_fnc_selectMenu;
        };
    };
}
catch
{
    _exception;
};
