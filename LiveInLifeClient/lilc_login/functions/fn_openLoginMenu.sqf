disableSerialization;
if (dialog) exitWith {};

createDialog "login";

_ui = (findDisplay 1024);
//account_escapeEventHandler = _ui displaySetEventHandler ['KeyDown','if ((_this select 1) == 1) then { true; }'];
_profileList = _ui displayCtrl 1025;

if ((count lilc_login_accountInformation) <= 0) exitWith {};

lbClear _profileList;
{
    _groupInfo = ([(_x select 3)] call lilc_common_fnc_getFactionConfig);
    _profileList lbAdd format["%1 %2 (%3)", (_x select 1), (_x select 2), if ((_x select 3) <= -1) then { "Zivilist"; } else { (_groupInfo select 1); }];
    _profileList lbSetData [((lbSize _profileList) - 1), (str (_x select 0))];
} forEach lilc_login_accountInformation;
