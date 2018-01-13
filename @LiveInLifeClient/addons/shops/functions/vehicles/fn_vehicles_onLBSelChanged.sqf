
disableSerialization;
params [
    ["_control", controlNull, [controlNull]],
    ["_index", -1, [-1]]
];

if (isNull _control) exitWith {};
if (_index <= -1) exitWith {};

private _data = (_control lbData _index);
if (_data == "") exitWith {};

private _ui = (ctrlParent _control);
private _shopName = (_ui getVariable ["lilc_shopName", ""]);

if (_shopName == "") exitWith {};

private _config = (missionConfigFile >> "CfgVehicleShops" >> _shopName);
if (isNull _config) exitWith {};

private _iConfig = (_config >> "vehicles" >> _data);
if (isNull _iConfig) exitWith {};

private _vehCfg = ([_data] call lilc_common_fnc_getClassnameConfig);
if (isNull _vehCfg) exitWith {};

private _rentBuyPrice = getNumber(_iConfig >> "rentBuyPrice");
private _buyPrice = getNumber(_iConfig >> "buyPrice");

ctrlShow [2400, (if (_rentBuyPrice >= 0) then { true; } else { false; })];
ctrlShow [2401, (if (_buyPrice >= 0) then { true; } else { false; })];

ctrlShow [2300, true];

private _uiGroupInformation = (_ui displayCtrl 2300);
private _uiInformationText = ((_uiGroupInformation controlsGroupCtrl 2301) controlsGroupCtrl 1100);

private _text = "";

if (_buyPrice >= 0) then
{
    _text = format[
        "<t color='#FFB917'>Kaufpreis:</t> $%1<br />",
        _buyPrice
    ];
};

if (_rentBuyPrice >= 0) then
{
    _text = format[
        "%1<t color='#FFB917'>Mietpreis:</t> $%2<br /><t color='#FFB917'>Mietverkaufspreis:</t> $%3<br />",
        _text,
        _rentBuyPrice,
        getNumber(_iConfig >> "rentSellPrice")
    ];
};

_text = format[
    "%1<t color='#FFB917'>Beschreibung:</t> %2<br /><t color='#FFB917'>Inventargröße:</t> %3<br /><t color='#FFB917'>Sitzplätze:</t> %4<br /><t color='#FFB917'>Max. Geschw.:</t> %5 km/h<br /><t color='#FFB917'>Tankgröße:</t> %6 l<br />",
    _text,
    getText(_vehCfg >> "description"),
    getNumber(_vehCfg >> "maximumLoad"),
    ([_data, true] call BIS_fnc_crewCount),
    getNumber(_vehCfg >> "maxSpeed"),
    getNumber(_vehCfg >> "fuelCapacity")
];
_text = format["<t size='0.8'>%1</t>", _text];

_uiInformationText ctrlSetStructuredText parseText _text;

private _pos = (ctrlPosition _uiInformationText);
_uiInformationText ctrlSetPosition [
    (_pos select 0),
    (_pos select 1),
    (_pos select 2),
    (ctrlTextHeight _uiInformationText)
];
_uiInformationText ctrlCommit 0;
