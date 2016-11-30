
_type = param [0, "", [""]];
if (_type == "") exitWith { ""; };

_return = switch (_type) do {
    case "weapons": { "Waffen"; };
    case "magazines": { "Magazine"; };
    case "goggles": { "Brillen"; };
    case "headgear": { "Kopfbedeckungen"; };
    case "items": { "Items"; };
    case "backpacks": { "Rucksäcke"; };
    case "vests": { "Schutzwesten"; };
    case "uniforms": { "Kleidung"; };
};

_return;
