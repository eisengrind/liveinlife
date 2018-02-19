
params [
    ["_name", lilc_exchange_currentExchange, [""]],
    ["_type", "offers", [""]],
    ["_data", nil]
];

if (_name == "" || isNil "_name") exitWith {};
lilc_exchange_currentExchange = _name;

disableSerialization;

private _cfg = ([_name] call lilc_exchange_fnc_getExchangeConfig);
if (isNull _cfg) exitWith {};

private _ui = (findDisplay 2302);
if (isNull _ui) then
{
    createDialog "lilcm_exchange";
};

ctrlSetText [1000, getText(_cfg >> "displayName")];

private _uiFrameButtonOffersBackground = (_ui displayCtrl 998);
private _uiFrameButtonAccountBackground = (_ui displayCtrl 999);

switch (_type) do
{
    case "offers": {
        ctrlShow [2300, true];
        ctrlShow [2301, false];

        _uiFrameButtonOffersBackground ctrlSetBackgroundColor [0, 0, 0, 0.6];
        _uiFrameButtonAccountBackground ctrlSetBackgroundColor [0, 0, 0, 0.2];
        _uiFrameButtonOffersBackground ctrlCommit 0;
        _uiFrameButtonAccountBackground ctrlCommit 0;

        lbClear 2100;
        {
            private _itemCfg = ([_x] call lilc_common_fnc_getClassnameConfig);
            private _i = (lbAdd [2100, getText(_itemCfg >> "displayName")]);
            lbSetData [2100, _i, _x];
            lbSetPicture [2100, _i, getText(_itemCfg >> "picture")];
        } count getArray(_cfg >> "items");
        
        lbSort [2100, "ASC"];
        [((_ui displayCtrl 2300) controlsGroupCtrl 2100), (lbCurSel 2100)] call lilc_exchange_fnc_offers_handleOnLBSelChanged;
    };

    case "offers_setOffers": {
        lnbClear 1500;
        lnbClear 1501;
        // 0 id, 1 type, 2 amount, 3 price, 4 accountid, 5 firstname, 6 lastname

        {
            private _idc = (if ((_x select 1) == 0) then { 1500; } else { 1501; });
            private _index = (lnbAddRow [_idc, [(format["%1 %2", (_x select 5), (_x select 6)]), (format["%1", (_x select 2)]), (format["$%1", (_x select 3)])]]);
            lnbSetValue [_idc, [_index, 2], (_x select 3)];
            lnbSetValue [_idc, [_index, 1], (_x select 2)];
            lnbSetValue [_idc, [_index, 0], (_x select 0)];
        } forEach _data;

        if (((lnbSize ((_ui displayCtrl 2300) controlsGroupCtrl 1500)) select 0) <= 0) then {
            lnbAddRow [1500, ["Keine Angebote gefunden"]];
        };

        if (((lnbSize ((_ui displayCtrl 2300) controlsGroupCtrl 1501)) select 0) <= 0) then {
            lnbAddRow [1501, ["Keine Angebote gefunden"]];
        };
    };

    case "account":
    {
        ctrlShow [2300, false];
        ctrlShow [2301, true];

        _uiFrameButtonOffersBackground ctrlSetBackgroundColor [0, 0, 0, 0.2];
        _uiFrameButtonAccountBackground ctrlSetBackgroundColor [0, 0, 0, 0.6];
        _uiFrameButtonOffersBackground ctrlCommit 0;
        _uiFrameButtonAccountBackground ctrlCommit 0;

        lbClear 2101;
        private _i = (lbAdd [2101, "Mein Inventar"]);
        lbSetData [2101, _i, (player call BIS_fnc_netId)];

        {
            if ([_x] call lilc_keys_fnc_have) then
            {
                private _vCfg = ([(typeOf _x)] call lilc_common_fnc_getClassnameConfig);
                private _i = (lbAdd [2101, getText(_vCfg >> "displayName")]);
                lbSetPicture [2101, _i, getText(_vCfg >> "picture")];
                lbSetData [2101, _i, (_x call BIS_fnc_netId)];
            };
        } forEach nearestObjects [(position player), ["Bicycle", "Air", "Ship", "Boat", "Truck", "LandVehicle"], 50, true];

        [[player, _name], "lils_exchange_fnc_getAccount"] call lilc_common_fnc_sendToServer;
    };

    case "account_setAccount":
    {
        ctrlSetText [1013, (format["$ %1", (_data select 0)])];

        lbClear 1502;
        {
            private _cfg = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);
            private _i = (lbAdd [1502, format["%1x %2", (_x select 1), getText(_cfg >> "displayName")]]);
            lbSetPicture [1502, _i, getText(_cfg >> "picture")];
            lbSetData [1502, _i, (_x select 0)];
            lbSetValue [1502, _i, (_x select 1)];
        } forEach (_data select 1);

        //`classname`, `amount`, `price`, time, `id`, `type`
        lnbClear 1503;
        {
            private _cfg = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);
            private _name = getText(_cfg >> "displayName");
            private _i = (lnbAddRow [1503, [
                (if ((count _name) > 15) then { (format["%1...", ([_name, 14] call lilc_common_fnc_trimString)]); } else { _name; }),
                (if ((_x select 5) == 0) then { "K"; } else { "V"; }),
                (str (_x select 1)),
                (str (_x select 2)),
                (_x select 3)
            ]]);
            lnbSetValue [1503, [_i, 0], (_x select 4)];
        } forEach (_data select 2);
    };
};
