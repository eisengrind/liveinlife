
/*

inventory {
    headgear {
        "", "", "", ""
    }

    equippedItems {
        "", "", "", "", ""
    }

    uniform {
        "",
        "", <- textureName
        containerWeapons {

        }
        containerItems {

        }
        containerMagazines {

        }
    }

    vest {
        "",
        containerWeapons {

        }
        containerItems {
            
        }
        containerMagazines {

        }
    }

    backpack {
        "",
        containerWeapons {

        }
        containerItems {
            
        }
        containerMagazines {

        }
    }

    weapons {
        prim {
            "", <- curWpn
            attachments {
                ""
            }
        }

        lnch {
            "", <- curWpn
            attachments {
                ""
            }
        }

        scnd {
            "", <- curWpn
            attachments {
                ""
            }
        }
    }
}

*/

_unit = param [0, ObjNull, [ObjNull]];
if (isNull _unit) exitWith { []; };

_inventory = [
    //HEADGEAR
    [(headgear _unit), (goggles _unit), (hmd _unit), (binocular _unit)],
    //TOOLBAR
    (assignedItems _unit),
    //UNIFORM
    if ((uniform _unit) == "") then {
        [];
    } else {
        [
            (uniform _unit),
            ((uniformContainer _unit) getVariable ["lilc_color", "-1"]), 
            (getItemCargo uniformContainer _unit),
            if (isNil {(magazinesAmmo uniformContainer _unit)}) then { [[]]; } else { (magazinesAmmo uniformContainer _unit); },
            (getWeaponCargo uniformContainer _unit)
        ];
    },
    //VEST
    if ((vest _unit) == "") then { 
        []; 
    } else {
        [
            (vest _unit),
            (getItemCargo vestContainer _unit),
            if (isNil {(magazinesAmmo vestContainer _unit)}) then { [[]]; } else { (magazinesAmmo vestContainer _unit); },
            (getWeaponCargo vestContainer _unit)
        ];
    },
    //BACKPACK
    if ((backpack _unit) == "") then { 
        []; 
    } else {
        [
            (backpack _unit),
            ((backpackContainer _unit) getVariable ["lilc_color", "-1"]), 
            (getItemCargo backpackContainer _unit),
            if (isNil {(magazinesAmmo backpackContainer _unit)}) then { [[]]; } else { (magazinesAmmo backpackContainer _unit); },
            (getWeaponCargo backpackContainer _unit)
        ];
    },
    //EQUIPPED WEAPONS
    [
        if ((primaryWeapon _unit) == "") then {
            [];
        } else {
            [
                primaryWeapon _unit,
                primaryWeaponMagazine _unit,
                primaryWeaponItems _unit
            ];
        },
        if ((secondaryWeapon _unit) == "") then {
            [];
        } else {
            [
                secondaryWeapon _unit,
                secondaryWeaponMagazine _unit,
                secondaryWeaponItems _unit
            ];
        },
        if ((handgunWeapon _unit) == "") then {
            [];
        } else {
            [
                handgunWeapon _unit,
                handgunMagazine _unit,
                handgunItems _unit
            ];
        }
    ],
    (_unit getVariable ["rankInsignia", ""])
];

_inventory;
