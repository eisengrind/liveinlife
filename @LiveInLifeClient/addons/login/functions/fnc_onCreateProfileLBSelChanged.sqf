#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl", "_index"];

switch (_name) do {
    case "FacesList": {
        private _display = ctrlParent _ctrl;
        private _face = _ctrl lbData _index;
        _display setVariable [QGVAR(face), _face];
        (_display getVariable [QGVAR(face_model), objNull]) setFace _face;
    };

    case "MonthCombo": {
        private _display = ctrlParent _ctrl;
        private _birthdayYearCtrl = (_display displayCtrl 2302) controlsGroupCtrl 2102;
        private _birthdayDayCtrl = (_display displayCtrl 2302) controlsGroupCtrl 2100;
        lbClear _birthdayDayCtrl;
        for "_i" from 1 to ([
            _birthdayYearCtrl lbValue (lbCurSel _birthdayYearCtrl),
            _ctrl lbValue (lbCurSel _ctrl)
        ] call BIS_fnc_monthDays) do {
            _birthdayDayCtrl lbSetValue [
                _birthdayDayCtrl lbAdd str _i,
                _i
            ];
        };
    };

    case "YearCombo": {
        private _display = ctrlParent _ctrl;
        private _birthdayMonthCtrl = (_display displayCtrl 2302) controlsGroupCtrl 2101;
        private _birthdayDayCtrl = (_display displayCtrl 2302) controlsGroupCtrl 2100;
        lbClear _birthdayDayCtrl;
        for "_i" from 1 to ([
            _ctrl lbValue (lbCurSel _ctrl),
            _birthdayMonthCtrl lbValue (lbCurSel _birthdayMonthCtrl)
        ] call BIS_fnc_monthDays) do {
            _birthdayDayCtrl lbSetValue [
                _birthdayDayCtrl lbAdd str _i,
                _i
            ];
        };
    };
};
