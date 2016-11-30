
private ["_uiHospital", "_ctrlProgress", "_timeout"];
disableSerialization;
_uiHospital = uiNamespace getVariable ["lilc_hospital", displayNull];
_ctrlProgress = _uiHospital displayCtrl 1041;
_timeout = (lilc_player_defaultRespawnTimeout * lilc_player_currentDeaths);

lilc_tmpReviveMe = nil;
for [{_i = 1}, {_i < (_timeout + 1)}, {_i = _i + 1;}] do {
    if (!isNil "tmpReviveMe") exitWith {};
    _ctrlProgress progressSetPosition (_i / _timeout);
    sleep 1;
};
lilc_tmpReviveMe = nil;

_ctrlProgress progressSetPosition 1;
