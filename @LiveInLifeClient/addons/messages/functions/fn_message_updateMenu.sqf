
private _cM = ([] + lilc_messages_messages);
reverse _cM;

lbClear 1500;
{
	//max 48 chars
	private _index = (lbAdd [1500, 
		([(format[
			"%1 - %2",
			(_x select 1),
			(_x select 2)
		]), 48] call lilc_common_fnc_trimString)
	]);

	lbSetValue [1500, _index, (((count _cM) - 1) - _forEachIndex)];
} forEach _cM;
