
try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if !(["factionsInterface.rank.add"] call lilc_permissions_fnc_have) throw false;

    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;

    private _name = (ctrlText 1422);
    private _tag = (ctrlText 1424);
    private _insignia = (lbData [1426, (lbCurSel 1426)]);
    private _paycheck = (lbValue [1428, (lbCurSel 1428)]);

    if (_name == "") then {
        hint "Du musst einen Namen angeben.";
        throw false;
    };

    if (_tag == "") then {
        hint "Du musst einen Tag angeben.";
        throw false;
    };

    [[player, _name, _tag, _insignia, _paycheck], "lils_factionsInterface_fnc_addRank"] call lilc_common_fnc_sendToServer;
    throw true;
} catch {
    if (_exception) then {
        ctrlEnable [1429, false];
        ctrlEnable [1430, false];
        sleep 1;
        ctrlEnable [1429, true];
        ctrlEnable [1430, true];
        ["dashboard"] call lilc_factionsInterface_fnc_selectMenu;
    };
};
