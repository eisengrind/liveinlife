
params [
    ["_object", objNull, [objNull]],
    ["_damage", [], [[]]]
];

try {
    if (isNull _object) throw false;
    if ((count _damage) <= 0) throw false;
    
    {
        _object setHitPointDamage [_x, ((_damage select 2) select _forEachIndex)];
    } forEach (_damage select 0);
    
    throw false;
} catch {
    _exception;
};
