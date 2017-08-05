
private _corpse = param [0, objNull, [objNull]];

try {
    if !(alive player) throw false;
    if (isNull _corpse) throw false;
    if !(_corpse getVariable ["lilc_isDead", false]) throw false;
    if !(_corpse getVariable ["lilc_isStabilized", false]) throw false;
    if ((_corpse distance player) > 3) throw false;
    if (lilc_medical_active) throw false;

    private _factionID = (player getVariable ["lilc_factionID", -1]);
    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
    if (isNull _factionConfig) throw false;
    
    private _canRevive = ([(getNumber(_factionConfig >> "canRevive"))] call lilc_common_fnc_toBool);
    if !(_canRevive) throw false;
    
    private _reviveLocations = getArray(_factionConfig >> "reviveLocations");
    { if (((ASLToAGL (_x select 0)) distance player) <= (_x select 1)) throw true; } forEach _reviveLocations;

    /*Acts_TreatingWounded_in - \a3\Anims_F_EPA\data\Anim\sdr\cts\Custom\A_m01\PercMstpSlowWrlfDnon_TreatingWounded
    Acts_TreatingWounded01 - \a3\Anims_F_EPA\data\Anim\sdr\cts\Custom\A_m01\Acts_TreatingWounded01
    Acts_TreatingWounded_Out - \a3\Anims_F_EPA\data\Anim\sdr\cts\Custom\A_m01\TreatingWounded_PercMstpSlowWrlfDnon
    HubSittingChairUA_idle1 - \A3\Anims_F_EPA\data\Anim\sdr\cts\HubCleaned\SittingChair\HubSittingChairUA_idle1
    HubSittingChairUB_idle1 - \A3\Anims_F_EPA\data\Anim\sdr\cts\HubCleaned\SittingChair\HubSittingChairUB_idle1
    HubSittingChairUC_idle1 - \A3\Anims_F_EPA\data\Anim\sdr\cts\HubCleaned\SittingChair\HubSittingChairUC_idle1*/
    /*AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic
    AinvPknlMstpSnonWnonDr_medic4
    AinvPknlMstpSnonWnonDnon_medic1
    AinvPknlMstpSnonWnonDr_medic0
    AinvPknlMstpSnonWnonDnon_medicEnd

    player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic";
    player addEventHandler ["AnimDone", {
        player playMoveNow "AinvPknlMstpSnonWnonDr_medic4";
        player addEventHandler ["AnimDone", {
            player playMoveNow "AinvPknlMstpSnonWnonDnon_medic1";
            player addEventHandler ["AnimDone", {
                player playMoveNow "AinvPknlMstpSnonWnonDr_medic0";
                player addEventHandler ["AnimDone", {
                    player playMoveNow "AinvPknlMstpSnonWnonDnon_medicEnd";
                }];
            }];
        }];
    }];*/

    throw false;
} catch {
    _exception;
};
