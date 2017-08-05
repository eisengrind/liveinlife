
params [
    ["_target", objNull, [objNull]]
];

if !([_target] call lilc_actions_fnc_canRobPerson) exitWith {};

//get targets money
[[player], "lilc_actions_fnc_robbed", _target] call lilc_common_fnc_send;

if ((["lilci_disposableGloves_F", player] call lilc_inventory_fnc_itemCount) > 0 && (random 1) < 0.05) then
{
    [_target, "lilcp_fingerprint", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
};

if ((headgear player) != "" && (random 1) < 0.1) then
{
    [_target, "lilcp_hair", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
};

if ((random 1) < 0.2) then
{
    [_target, "lilcp_scale", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
};

if ((damage player) > 0.4 && (random 1) < 0.5) then
{
    [_target, "lilcp_blood", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
};

if ((damage _target) > 0.4 && (random 1 < 0.5)) then
{
    [player, "lilcp_blood", (_target getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
};

[
    (format[
        "Du hast %1 ausgeraubt.",
        ([_target] call lilc_login_fnc_formatName)
    ])
] call lilc_ui_fnc_hint;

if ([_target] call lilc_pcard_fnc_havePersonalcard) then
{
    [_target] call lilc_login_fnc_addKnow;
};
