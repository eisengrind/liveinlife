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

        //create face view
        private _model = "C_scientist_F" createVehicleLocal [0, 0, 0];
        _model setPosASL [
            random 1000,
            random 1000,
            random [3000, 4000, 5000]
        ];
        _model allowDamage false;
        _model enableSimulation false;
        removeUniform _model;
        removeVest _model;
        removeBackpack _model;
        removeGoggles _model;
        _model switchMove "AmovPercMstpSnonWnonDnon";
        _displayOrCtrl setVariable [QGVAR(face_model), _model];

        private _light = "#lightpoint" createVehicleLocal [0, 0, 0];
        _light setLightBrightness 0.5;
        _light setLightAmbient [1, 1, 1];
        _light setLightColor [1, 1, 1];
        _light lightAttachObject [_model, [0, 1, 4]];
        _displayOrCtrl setVariable [QGVAR(face_light), _light];

        private _background = "UserTexture10m_F" createVehicleLocal [0, 0, 0];
        _background setObjectTexture [0, "#(rgb,8,8,3)color(0.5,0.5,0.5,1)"];
        _background attachTo [_model, [0, -1, 0]];
        _background setVectorDir [
            sin 180,
            cos 180,
            0
        ];
        _displayOrCtrl setVariable [QGVAR(face_background), _background];

        private _camera = "camera" camCreate [0, 0, 0];
        _camera cameraEffect ["Internal", "Back", QGVAR(create_profile_camera)];
        _camera camSetPos (_model modelToWorld [0, 20, 1.68]);
        _camera camSetFov 0.01;
        _camera camSetDir [0, -1, 0];
        _camera camCommit 0;
        _displayOrCtrl setVariable [QGVAR(face_camera), _camera];
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


