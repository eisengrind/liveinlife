
params [
    ["_object", objNull, [objNull]]
];

(alive _object && !isNull _object && (locked _object) <= 1);
