
lilc_common_dynamicPositions = [];
{
    private _positionName = (_x getVariable ["positionName", ""]);
    if (_positionName != "") then
    {
        if !(_positionName in lilc_common_dynamicPositions) then
        {
            lilc_common_dynamicPositions pushBack _positionName;
        };
    };
} forEach entities "Logic";

if (!isServer && !is3DEN && !is3DENMultiplayer && !isDedicated) then
{
    [] spawn lilc_common_fnc_initMission;
};

player addAction ["", {
    playSound3D ["a3\sounds_f\weapons\Other\dry9.wss", (_this select 0)];
}, false, 0, false, true, "DefaultAction", "(currentWeapon player) in lilc_common_disabledWeapons && (currentWeapon player) != ''"];
