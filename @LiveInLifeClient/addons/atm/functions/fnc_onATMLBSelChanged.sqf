#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl", "_index"];

switch (_name) do {
    case "ListBankAccounts": {
        INFO(_ctrl lbValue _index);
        (ctrlParent _ctrl) setVariable [QGVAR(bankAccountID), _ctrl lbValue _index];
    };
};
