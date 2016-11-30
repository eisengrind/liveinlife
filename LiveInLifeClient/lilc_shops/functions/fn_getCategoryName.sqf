
private _category = param [0, "", [""]];

try {
    if (isNil "_category") throw "";

    //TODO: replace with stringtables.xml string
    switch (_category) do {
        case "Glasses": { (["Brillen"] call lilc_common_fnc_localize); };
        case "Headgear": { (["Kopfbedeckungen"] call lilc_common_fnc_localize); };
        case "Vest": { (["Westen"] call lilc_common_fnc_localize); };
        case "Uniform": { (["Kleidung"] call lilc_common_fnc_localize); };
        case "Backpack": { (["Rucksäcke"] call lilc_common_fnc_localize); };
        case "Weapon": { (["Waffen"] call lilc_common_fnc_localize); };
        case "WeaponAccessory": { (["Aufsätze"] call lilc_common_fnc_localize); };
        case "Item": { (["Items"] call lilc_common_fnc_localize); };
        case "Mine": { (["Minen"] call lilc_common_fnc_localize); };
    };
} catch {
    _exception;
};
