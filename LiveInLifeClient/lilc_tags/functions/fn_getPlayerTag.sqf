
//[ID, NAME, TAG, FACTIONID, PRIORITY, INSIGNIA]
 //0 = no name, 1 = firstname, 2 = all

_unit = param [0, objNull, [objNull]];

try
{
    if (isNull _unit) throw "";
    //if !(isPlayer _unit) throw "";
    if ((vehicle _unit) != _unit) throw "";

    private _unitIdentity = (_unit getVariable ["lilc_identity", []]);
    if ((count _unitIdentity) <= 0) throw "";

    private _unitFactionID = (_unit getVariable ["lilc_factionID", -1]);
    private _unitFactionColor = (_unit getVariable ["lilc_factionColor", ""]);
    private _unitRankInfo = ([(_unit getVariable ["lilc_factionRankID", 0])] call lilc_factionsInterface_fnc_getRankInfo);
    
    private _unitFactionRankTag = "";
    if ((count _unitRankInfo) == 6) then {
        _unitFactionRankTag = (_unitRankInfo select 2); 
    };

    private _visibility = 0;
    if (_unitFactionID > -1) then
    {
        {
            if ((_x select 0) == _unitFactionID) exitWith
            {
                
                _visibility = (_x select 1);
            };
        } forEach lilc_tags_visibleFactionNames;

        if (_visibility == 0) then
        {
            if ([_unit] call lilc_login_fnc_unitIsKnown) then
            {
                _visibility = 2;
            };
        };
    }
    else
    {
        if ([_unit] call lilc_login_fnc_unitIsKnown) then
        {
            _visibility = 2;
        };
    };

    if (_visibility == 0) throw "";

    private _unitFirstname = (_unitIdentity select 1);
    private _unitLastname = (_unitIdentity select 2);

    throw (format["<t%1>%2%3%4</t>",
        (if (_unitFactionColor != "") then { format[" color='%1'", _unitFactionColor]; } else { ""; }),
        (if (_unitFactionRankTag != "") then { format["%1.", _unitFactionRankTag]; } else { if ((_unitIdentity select 0) <= 0) then { "Herr"; } else { "Frau" }; }),
        (if (_visibility == 2 && (_unitFirstname != "")) then { format[" %1", _unitFirstname]; } else { ""; }),
        (if ((_visibility == 1 || _visibility == 2) && (_unitLastname != "")) then { format[" %1", _unitLastname]; } else { ""; })
    ]);
}
catch
{
    _exception;
};
