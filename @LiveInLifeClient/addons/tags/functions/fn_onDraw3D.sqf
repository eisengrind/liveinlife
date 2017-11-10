
private _units = [];
if ((vehicle player) isEqualTo player) then
{
    _units = (position player nearEntities ["Man", lilc_tags_maximumRadius]) select { !isNull _x && !(_x isEqualTo player) };
}
else
{
    _units = (crew vehicle player) select { !(_x isEqualTo player); };
};

{
    private _unit = _x;

    if (
        !(isNull _unit) &&
        (alive _unit) &&
        !((headgear _unit) in lilc_tags_unknownHeadgears) &&
        !((goggles _unit) in lilc_tags_unknownHeadgears) &&
        (({ !(_unit isKindOf "Man"); } count (lineIntersectsObjs [(eyePos player), (getPosASL _unit), player, _unit])) <= 0)
    ) then
    {
        private _color = [(lilc_tags_defaultColor select 0), (lilc_tags_defaultColor select 1), (lilc_tags_defaultColor select 2), (lilc_setting_tags_defaultAlpha min (lilc_tags_maximumFadeRadius - (_unit distance player)) max 0)];
        private _name = (_unit getVariable ["lilc_tags_name", ""]);
        private _icon = (_unit getVariable ["lilc_factions_rank_icon", ""]);

        if (_name == "") then
        {
            private _fID = (_unit getVariable ["lilc_factionID", -1]);
            _fInfo = ([_fID] call lilc_factions_fnc_getFactionArray);

            if ((count _fInfo) > 0) then
            {
                private _c = (_fInfo select 4);
                if ((count _c) >= 3) then
                {
                    _color = [(_c select 0), (_c select 1), (_c select 2), (_color select 3)];
                };

                switch (_fInfo select 6) do
                {
                    case 0:
                    {
                        if ([_unit] call lilc_login_fnc_unitIsKnown) then
                        {
                            _name = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
                        };
                    };

                    case 1:
                    {
                        if ([_unit] call lilc_login_fnc_unitIsKnown) then
                        {
                            _name = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
                        }
                        else
                        {
                            _name = ([_unit, "<ADDRESS> <LASTNAME>"] call lilc_login_fnc_formatName);
                        };
                    };

                    case 2:
                    {
                        _name = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
                    };
                };
            }
            else
            {
                if ([_unit] call lilc_login_fnc_unitIsKnown) then
                {
                    _name = ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName);
                };
            };
        };

        ([
            _unit,
            _name,
            _icon,
            _color,
            0.11 * (vectorMagnitude (visiblePosition _x vectorDiff (positionCameraToWorld [0, 0, 0])))
        ] call lilc_tags_fnc_drawTag);
    };
    true;
} count _units;
