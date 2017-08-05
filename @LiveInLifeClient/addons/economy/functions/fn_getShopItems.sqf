
//ITEMS - [<classname>, <sellprice>, <buyprice>, <color>]
params [
    ["_shopName", "", [""]]
];

(missionNamespace getVariable [(format["lils_economy_tmp_%1", _shopName]), []]);
