
private _category = param [0, "", [""]];

try {
    if (isNil "_category") throw "";
    //TODO: replace with stringtables.xml string
    switch (_category) do {
        case "Glasses": { throw (["Brillen"] call lilc_common_fnc_localize); };
        case "Headgear": { throw (["Kopfbedeckungen"] call lilc_common_fnc_localize); };
        case "Vest": { throw (["Westen"] call lilc_common_fnc_localize); };
        case "Uniform": { throw (["Kleidung"] call lilc_common_fnc_localize); };
        case "Backpack": { throw (["Rucksäcke"] call lilc_common_fnc_localize); };
        case "Weapon": { throw (["Waffen"] call lilc_common_fnc_localize); };
        case "WeaponAccessory": { throw (["Aufsätze"] call lilc_common_fnc_localize); };
        case "Item": { throw (["Items"] call lilc_common_fnc_localize); };
        case "Mine": { throw (["Minen"] call lilc_common_fnc_localize); };
        case "Magazine": { throw (["Magazine"] call lilc_common_fnc_localize); };
    };
} catch {
    _exception;
};
