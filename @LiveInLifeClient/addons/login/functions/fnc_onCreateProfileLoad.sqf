#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_displayOrCtrl"];

switch (_name) do {
    case QGVAR(create_profile): {
        (_displayOrCtrl displayCtrl 2301) ctrlShow false;
        (_displayOrCtrl displayCtrl 2302) ctrlShow false;
        (_displayOrCtrl displayCtrl 1600) ctrlEnable false;
        (_displayOrCtrl displayCtrl 1601) ctrlEnable false;

        (_displayOrCtrl displayCtrl 1201) ctrlSetTextColor [1, 1, 1, 0.2];
        (_displayOrCtrl displayCtrl 1202) ctrlSetTextColor [1, 1, 1, 0.2];

        ((_displayOrCtrl displayCtrl 2300) controlsGroupCtrl 2800) cbSetChecked true;

        private _birthdayYearCtrl = (_displayOrCtrl displayCtrl 2302) controlsGroupCtrl 2102;
        lbClear _birthdayYearCtrl;
        for "_i" from 1930 to 1999 do {
            _birthdayYearCtrl lbSetValue [
                _birthdayYearCtrl lbAdd str _i,
                _i
            ];
        };
        _birthdayYearCtrl lbSetCurSel 0;

        private _birthdayMonthCtrl = (_displayOrCtrl displayCtrl 2302) controlsGroupCtrl 2101;
        lbClear _birthdayMonthCtrl;
        {
            _birthdayMonthCtrl lbSetValue [
                _birthdayMonthCtrl lbAdd _x,
                _forEachIndex + 1
            ];
        } forEach ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"];
        _birthdayMonthCtrl lbSetCurSel 0;

        private _countriesCtrl = (_displayOrCtrl displayCtrl 2302) controlsGroupCtrl 2103;
        {
            _countriesCtrl lbSetData [
                _countriesCtrl lbAdd ([_x] call EFUNC(countries,getCountryName)),
                _x
            ];
        } forEach EGVAR(countries,locodes);
        lbSort _countriesCtrl;
    };

    case "FirstnameEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1011];
    };

    case "MiddleNameEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1010];
    };

    case "LastnameEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1013];
    };

    case "YearCombo": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1017];
    };

    case "MonthCombo": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1016];
    };

    case "DayCombo": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1015];
    };

    case "EntryReasonEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1020];
    };

    case "OriginCountryCombo": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1021];
    };
};


