
private _unit = param [0, objNull, [objNull]];

try
{
    lilc_pcard_currentUnit = _unit;
    if (isNull lilc_pcard_currentUnit) throw false;
    if !(isPlayer lilc_pcard_currentUnit && isMultiplayer) throw false;
    if !(call lilc_pcard_fnc_havePersonalcard) throw false;

    createDialog "lilcm_pcard_personalCardList";

    lbClear 1572;
    {
        //id, itemname, [names], <data> - [accountid, personalcardid, firstname, lastname, birthdate, authority, city, parish, street, streetnumber]
        private _index = lbAdd [1572, (_x select 1)];
        lbSetData [1572, _index, (str _x)];
    } forEach (call lilc_pcard_fnc_getPersonalcards);
}
catch
{
    _exception;
};
