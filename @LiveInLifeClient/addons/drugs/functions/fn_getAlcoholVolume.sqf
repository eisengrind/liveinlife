
params [
    ["_volume", 0, [0]], //solution volume (ml)
    ["_pFactor", 0, [0]] //percentage factor of alcohol in the solution from 0-1
];

(_volume * 0.8 * _pFactor);
