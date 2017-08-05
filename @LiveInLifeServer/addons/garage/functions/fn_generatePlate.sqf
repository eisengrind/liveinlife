
params [
	["_unit", objNull, [objNull]],
	["_vehicle", "", ["", objNull]]
];

try
{
	if (isNull _unit) throw "";
	if (_vehicle isEqualType objNull) then
	{
		_vehicle = (typeOf _vehicle);
	};
	if (_vehicle == "") throw "";

	private _accountID = (_unit getVariable ["lilc_accountID", 0]);
	private _factionID = (_unit getVariable ["lilc_factionID", -1]);

    if (_vehicle isKindOf "Air") then
    {
        private _factionID = (_unit getVariable ["lilc_factionID", -1]);
        private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
        private _factionPlateRegion = (getText(_factionConfig >> "plate_region"));
        private _factionPlateSpecial = (getText(_factionConfig >> "plate_special"));
        private _defaultPlateType = (["plate_defaultType", "STRING", ""] call lilc_common_fnc_getSetting);
        private _defaultPlateSpecial = (["plate_defaultSpecial", "STRING", ""] call lilc_common_fnc_getSetting);
        private _defaultPlateRegion = (["plate_defaultPlateRegion", "STRING", ""] call lilc_common_fnc_getSetting);

        private _plateRegion = (if (_factionPlateRegion != "") then
        {
            _factionPlateRegion;
        }
        else
        {
            _defaultPlateRegion;
        });

        private _plateType = (if (_factionPlateSpecial != "") then
        {
            _factionPlateSpecial;
        }
        else
        {
            if (_defaultPlateSpecial != "") then
            {
                _defaultPlateSpecial;
            }
            else
            {
                try
                {
                    {
                        if (_vehicle in getArray(_x >> "classnames")) throw getText(_x >> "tag");
                    } forEach ("true" configClasses (missionConfigFile >> "CfgPlanePlates" >> "types"));

                    throw "";
                }
                catch
                {
                    if (_exception != "") then
                    {
                        _exception;
                    }
                    else
                    {
                        _defaultPlateType;
                    };
                };
            };
        });

        _plate = (format [
            "%1-%2%3",
            _plateRegion,
            _plateType,
            (format [
                "%1%2",
                ([5, true, false, true] call lilc_common_fnc_randomString)
            ])
        ]);
    }
    else
    {
        _plate = format[
            "%1%2",
            ([4, false, false, true] call lilc_common_fnc_randomString),
            ([([(str _accountID), 3] call KRON_StrRight), 3, "0"] call lilc_common_fnc_fillString)
        ];
    };

	throw _plate;
}
catch
{
	_exception;
};
