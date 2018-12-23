#include "..\script_component.hpp"

#define FILL_DATE(var1) (if (var1 < 10) then { format["0%1", var1]; } else { str var1; })

params ["_name", "_args"];

_args params ["_ctrl"];

switch (_name) do {
    case "SexContinueButton": {
        private _display = ctrlParent _ctrl;
        private _facesCtrl = (_display displayCtrl 2301) controlsGroupCtrl 1500;

        lbClear _facesCtrl;
        {
            private _index = _facesCtrl lbAdd getText(configFile >> "CfgFaces" >> "Man_A3" >> _x >> "displayName");
            _facesCtrl lbSetData [_index, _x];
        } forEach ([GVAR(male_faces), GVAR(female_faces)] select (_display getVariable [QGVAR(sex), 0]));

        _facesCtrl lbSetCurSel 0;

        (_display getVariable [QGVAR(face_model), objNull]) setFace (_facesCtrl lbData lbCurSel _facesCtrl);

        (_display displayCtrl 2300) ctrlShow false;
        (_display displayCtrl 2301) ctrlShow true;
        (_display displayCtrl 1600) ctrlEnable true;

        (_display displayCtrl 1200) ctrlSetTextColor [1, 1, 1, 0.2];
        (_display displayCtrl 1201) ctrlSetTextColor [1, 1, 1, 1];
    };

    case "FaceContinueButton": {
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 2301) ctrlShow false;
        (_display displayCtrl 2302) ctrlShow true;
        (_display displayCtrl 1601) ctrlEnable true;

        (_display displayCtrl 1201) ctrlSetTextColor [1, 1, 1, 0.2];
        (_display displayCtrl 1202) ctrlSetTextColor [1, 1, 1, 1];
    };

    case "CompleteButton": {
        private _display = ctrlParent _ctrl;
        private _groupCtrl = ctrlParentControlsGroup _ctrl;

        private _firstname = ctrlText (_groupCtrl controlsGroupCtrl 1400);
        private _middlename = ctrlText (_groupCtrl controlsGroupCtrl 1401);
        private _lastname = ctrlText (_groupCtrl controlsGroupCtrl 1402);
        private _birthdayDay = (_groupCtrl controlsGroupCtrl 2100) lbValue lbCurSel (_groupCtrl controlsGroupCtrl 2100);
        private _birthdayMonth = (_groupCtrl controlsGroupCtrl 2101) lbValue lbCurSel (_groupCtrl controlsGroupCtrl 2101);
        private _birthdayYear = (_groupCtrl controlsGroupCtrl 2102) lbValue lbCurSel (_groupCtrl controlsGroupCtrl 2102);
        private _originLocode = (_groupCtrl controlsGroupCtrl 2103) lbData lbCurSel (_groupCtrl controlsGroupCtrl 2103);
        private _entryReason = (_groupCtrl controlsGroupCtrl 1403);

        if (_firstname == "") exitWith {
            hint "firstname empty";
        };

        if (_lastname == "") exitWith {
            hint "lastname empty";
        };

        if (_birthdayDay <= 0) exitWith {
            hint "invalid day";
        };

        if (_birthdayMonth <= 0) exitWith {
            hint "invalid month";
        };

        if (_birthdayYear <= 0) exitWith {
            hint "invalid year";
        };

        if !(_originLocode in EGVAR(countries,locodes)) exitWith {
            hint "invalid origin locode";
        };

        if (_display getVariable [QGVAR(face_model), ""] == "") exitWith {
            hint "invalid face model";
        };

        private _birthday = format [
            "%1-%2-%3T00:00:00Z",
            _birthdayYear,
            FILL_DATE(_birthdayMonth),
            FILL_DATE(_birthdayDay)
        ];

        closeDialog 2000;
        1000 cutRsc [QGVAR(loading_screen), "PLAIN", 0.5];

        [QGVAR(createProfile), [
            player,
            GVAR(userID),
            _firstname,
            _middlename,
            _lastname,
            _birthday,
            _originLocode,
            _entryReason,
            _display getVariable [QGVAR(face_model), ""],
            _display getVariable [QGVAR(sex), 0]
        ]] call CBA_fnc_serverEvent;
    };

    case "SelectSexButton": {
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 2301) ctrlShow false;
        (_display displayCtrl 2302) ctrlShow false;
        (_display displayCtrl 2300) ctrlShow true;

        (_display displayCtrl 1600) ctrlEnable false;
        (_display displayCtrl 1601) ctrlEnable false;

        (_display displayCtrl 1200) ctrlSetTextColor [1, 1, 1, 1];
        (_display displayCtrl 1201) ctrlSetTextColor [1, 1, 1, 0.2];
        (_display displayCtrl 1202) ctrlSetTextColor [1, 1, 1, 0.2];
    };

    case "SelectFaceButton": {
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 2300) ctrlShow false;
        (_display displayCtrl 2301) ctrlShow true;
        (_display displayCtrl 2302) ctrlShow false;

        (_display displayCtrl 1600) ctrlEnable true;
        (_display displayCtrl 1601) ctrlEnable false;

        (_display displayCtrl 1200) ctrlSetTextColor [1, 1, 1, 0.2];
        (_display displayCtrl 1201) ctrlSetTextColor [1, 1, 1, 1];
        (_display displayCtrl 1202) ctrlSetTextColor [1, 1, 1, 0.2];
    };
};
