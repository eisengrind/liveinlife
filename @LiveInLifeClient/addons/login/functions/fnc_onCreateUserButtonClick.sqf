#include "..\script_component.hpp"

#define FILL_DATE(var1) (if (var1 < 10) then { format["0%1", var1]; } else { str var1; })

params ["_name", "_args"];

_args params ["_ctrl"];

switch (_name) do {
    case "CompleteButton": {
        private _display = ctrlParent _ctrl;

        private _steamID64 = getPlayerUID player;
        private _username = ctrlText (_display displayCtrl 1401);
        private _password = ctrlText (_display displayCtrl 1402);
        private _repaeatedPassword = ctrlText (_display displayCtrl 1403);

        if (_username == "") exitWith {
            ["username is empty", "ERROR"] call EFUNC(ui,hint);
        };

        if (count _username < 3) exitWith {
            ["username is too short", "ERROR"] call EFUNC(ui,hint);
        };

        private _allowedChars = toArray "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_0123456789";
        private _usernameUnicodes = toArray _username;

        if (({ (_x in _allowedChars); } count _usernameUnicodes) != count _usernameUnicodes) exitWith {
            ["username contains invalid characters", "ERROR"] call EFUNC(ui,hint);
        };

        if (count _password < 6) exitWith {
            ["password is too short", "ERROR"] call EFUNC(ui,hint);
        };

        if (_repaeatedPassword != _password) exitWith {
            ["invalid repeated password", "ERROR"] call EFUNC(ui,hint);
        };

        closeDialog 2003;
        QGVAR(loading_screen) cutRsc [QGVAR(loading_screen), "PLAIN", 1, true];

        [{
            params ["_username", "_password"];

            [QGVAR(createUser), [player, _username, _password]] spawn CBA_fnc_serverEvent; //TODO: change again to "call"
        }, [_username, _password], 1] call CBA_fnc_waitAndExecute;
    };
};