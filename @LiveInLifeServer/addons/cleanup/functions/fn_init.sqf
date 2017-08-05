
scriptName "lils_cleanup_cleanup";

while { true } do {
    waitUntil { ((count allDead) > 0) };
    call lils_cleanup_fnc_deathBodies;
    sleep 10;
};
