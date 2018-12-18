#include "..\script_component.hpp"

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

    case "CompleteButton": {};

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
