
params [
    ["_unit", objNull, [objNull]],
    ["_category", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(_unit isKindOf "Man") throw false;

    private _removedItem = "";
    switch (_category) do {
        case "Glasses": { _removedItem = (goggles _unit); removeGoggles _unit; };
        case "Headgear": { _removedItem = (headgear _unit); removeHeadgear _unit; };
        case "Vest": { _removedItem = (vest _unit); removeVest _unit; };
        case "Uniform": { _removedItem = (uniform _unit); removeUniform _unit; };
        case "Backpack": { _removedItem = (backpack _unit); removeBackpack _unit; };
    };

    throw _removedItem; //"" = no item was removed; "<xy>" = this item was removed
} catch {
    _exception;
};
