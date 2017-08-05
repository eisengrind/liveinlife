
private _unit = param [0, objNull, [objNull]];

try
{
	if (isNull _unit) throw false;
	if !(isPlayer _unit) throw false;
	if (_unit getVariable ["lilc_trade_isTrading", false]) then
	{
		["Dieser Spieler handelt bereits!", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	[[player], "lilc_trade_fnc_receiveBeginTrade", _unit] call lilc_common_fnc_send;
	lilc_trade_tradePartner = _unit;
	player setVariable ["lilc_trade_isTrading", true, true];

	if !(createDialog "lilcm_trade") then
	{
		call lilc_trade_fnc_cancelTrade;
		throw false;
	};
	
	(findDisplay 1640) displayAddEventHandler ["KeyDown", {
		if ((_this select 1) == 1) then
		{
			true;
		}
		else
		{
			false;
		};
	}];

	lilc_trade_offeredMoney = 0;
	lilc_trade_accepted = false;
	lilc_trade_availableMoney = lilc_player_cash;
	lilc_trade_tradePartner_offeredMoney = 0;

	call lilc_trade_fnc_updateMyInventory;
	call lilc_trade_fnc_updateOfferTradePartner;
}
catch
{
	_exception;
};
/*[]spawn { sleep 2; [eg_slot_2] call lilc_trade_fnc_test_doBeginTrade};*/