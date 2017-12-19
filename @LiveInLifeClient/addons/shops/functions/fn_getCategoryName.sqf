
private _category = param [0, "", [""]];

try {
    if (isNil "_category") throw "";
    //TODO: replace with stringtables.xml string
    switch (_category) do {
        case "Glasses": { throw ("Brillen" call BIS_fnc_localize); };
        case "Headgear": { throw ("Kopfbedeckungen" call BIS_fnc_localize); };
        case "Vest": { throw ("Westen" call BIS_fnc_localize); };
        case "Uniform": { throw ("Kleidung" call BIS_fnc_localize); };
        case "Backpack": { throw ("Rucksäcke" call BIS_fnc_localize); };
        case "Weapon": { throw ("Waffen" call BIS_fnc_localize); };
        case "WeaponAccessory": { throw ("Aufsätze" call BIS_fnc_localize); };
        case "Item": { throw ("Items" call BIS_fnc_localize); };
        case "Mine": { throw ("Minen" call BIS_fnc_localize); };
        case "Magazine": { throw ("Magazine" call BIS_fnc_localize); };
    };
} catch {
    _exception;
};
