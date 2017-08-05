
try
{
	if (isNull lilc_trade_tradePartner) throw false;
	if !(isPlayer lilc_trade_tradePartner) throw false;

	disableSerialization;
	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	private _uiButtonAccept = (_ui displayCtrl 2403);
	private _uiButtonCancel = (_ui displayCtrl 2404);

	if (lilc_trade_tradePartner getVariable ["lilc_trade_accepted", false]) then
	{
		[] spawn {
			disableSerialization;
			private _ui = (findDisplay 1640);
			if (isNull _ui) exitWith {};

			private _uiListMyOffers = (_ui displayCtrl 1502);
			private _uiListOfferTradePartner = (_ui displayCtrl 1501);

			call lilc_trade_fnc_disableMostControls;
			[[], "lilc_trade_fnc_disableMostControls", lilc_trade_tradePartner] call lilc_common_fnc_send;

			/*for [{_i = 3}, {_i > 1}, {_i = _i - 1}] do
			{
				[(format["Der Handel wird in %1 Sekunde/n ausgeführt.", _i])] call lilc_ui_fnc_hint;
				[[(format["Der Handel wird in %1 Sekunde/n ausgeführt.", _i])], "lilc_ui_fnc_hint", lilc_trade_tradePartner] call lilc_common_fnc_send;
				sleep 1;
			};*/

			if !(lilc_trade_tradePartner getVariable ["lilc_trade_isTrading", false]) exitWith
			{
				["Der Handel wurde abgebrochen!", "ERROR"] call lilc_ui_fnc_hint;
			};

			private _myOfferedItems = [];
			for "_i" from 0 to ((lbSize _uiListMyOffers) - 1) do
			{
				_myOfferedItems pushBack (_uiListMyOffers lbData _i);
			};

			private _tradePartnerOfferedItems = [];
			for "_i" from 0 to ((lbSize _uiListOfferTradePartner) - 1) do
			{
				_tradePartnerOfferedItems pushBack (_uiListOfferTradePartner lbData _i);
			};

			[player, lilc_trade_tradePartner_offeredMoney] call lilc_cash_fnc_add;
			[player, lilc_trade_offeredMoney] call lilc_cash_fnc_remove;
			
			[lilc_trade_tradePartner, lilc_trade_offeredMoney] call lilc_cash_fnc_add;
			[lilc_trade_tradePartner, lilc_trade_tradePartner_offeredMoney] call lilc_cash_fnc_remove;

			[_myOfferedItems, _tradePartnerOfferedItems] call lilc_trade_fnc_tradeItems;
			[[_tradePartnerOfferedItems, _myOfferedItems], "lilc_trade_fnc_tradeItems", lilc_trade_tradePartner] call lilc_common_fnc_send;

			call lilc_trade_fnc_cancelTrade;
		};

		throw true;
	}
	else
	{
		lilc_trade_accepted = true;
		call lilc_trade_fnc_disableMostControls;
		["Du hast das Angebot bestätigt!"] call lilc_ui_fnc_hint;
		[["Das Angebot wurde bestätigt!"], "lilc_ui_fnc_hint", lilc_trade_tradePartner] call lilc_common_fnc_send;
		
		player setVariable ["lilc_trade_accepted", true, true];
		throw true;
	};
}
catch
{
	_exception;
};
