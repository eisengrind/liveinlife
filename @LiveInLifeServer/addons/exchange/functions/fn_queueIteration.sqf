
scriptName "lils_exchange_queueIteration";

if (isNil "lils_exchange_queue") then
{
	lils_exchange_queue = [];
};

while
{
	true
}
do
{
	waitUntil
	{
		((count lils_exchange_queue) > 0)
	};

	private _currentQueue = lils_exchange_queue;

	{
		private _unit = (_x select 0);
		private _type = (_x select 1);
		private _data = (_x select 2);
		private _unitAccountID = (_unit getVariable ["lilc_accountID", 0]);

		try
		{
			switch (_type) do
			{
				case "buy":
				{
					/*
					data = {
						0:exchangeName
						1:offerID
						2:amountToBuy
					}
					*/
					private _exchangeName = (_data select 0);
					private _offerID = (_data select 1);
					private _amountToBuy = (_data select 2);

					private _offer = ([([
						"EXCHANGE_OFFERS",
						[
							["classname"],
							["amount"],
							["accountid"],
							["price"]
						],
						[
							["exchangeName", (str _exchangeName)],
							["id", _offerID],
							["type", 0]
						]
					] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

					if ((count _offer) <= 0) throw ["buy_customer", []];
					_offer = (_offer select 0);

					if ((count _offer) != 4) throw ["buy_customer", []];
					private _classname = (_offer select 0);
					private _amount = (_offer select 1);
					private _accountID = (_offer select 2);
					private _price = (_offer select 3);

					if (_amountToBuy > _amount) throw ["buy_customer", []];

					if (_amountToBuy <= _amount) then
					{
						if (_amountToBuy == _amount) then
						{
							[(format["DELETE FROM EXCHANGE_OFFERS WHERE ID = '%1'", _offerID])] call lils_database_fnc_query;
						}
						else
						{
							[(format["UPDATE EXCHANGE_OFFERS SET amount = '%1' WHERE ID = '%2' AND `type` = '0'", (_amount - _amountToBuy), _offerID])] call lils_database_fnc_query;
						};
					};

					private _storageItem = ([(format["SELECT id, amount FROM exchange_storages WHERE accountID = '%1' AND exchangeName = '%2' AND classname = '%3'", _unitAccountID, (str _exchangeName), (str _classname)])] call lils_database_fnc_fetchObjects);

					if (_storageItem isEqualType false) then {
						[(format["INSERT INTO exchange_storages (ID, accountID, exchangeName, classname, amount, timestampAdd) VALUES (NULL, '%1', '%2', '%3', '%4', UNIX_TIMESTAMP(NOW()))", _unitAccountID, (str _exchangeName), (str _classname), _amountToBuy])] call lils_database_fnc_query;
					}
					else
					{
						if ((count _storageItem) <= 0) then
						{
							[(format["INSERT INTO exchange_storages (ID, accountID, exchangeName, classname, amount, timestampAdd) VALUES (NULL, '%1', '%2', '%3', '%4', UNIX_TIMESTAMP(NOW()))", _unitAccountID, (str _exchangeName), (str _classname), _amountToBuy])] call lils_database_fnc_query;
						}
						else
						{
							_storageItem = (_storageItem select 0);

							if ((count _storageItem) == 2) then
							{
								private _storageID = (_storageItem select 0);
								private _storageAmount = (_storageItem select 1);

								[(format["UPDATE exchange_storages SET amount = '%1' WHERE ID = '%2'", (_amountToBuy + _storageAmount), _storageID])] call lils_database_fnc_query;
							};
						};
					};

					private _price = (_amountToBuy * _price);
					[(format[
						"INSERT INTO exchange_accounts (ID, accountID, balance, timestampedited, exchangeName) SELECT * FROM (SELECT NULL, '%1', '0', UNIX_TIMESTAMP(NOW()), '%2') AS tmp WHERE NOT EXISTS (SELECT ID FROM exchange_accounts WHERE accountID = '%1' AND exchangeName = '%2')",
						_accountID,
						(str _exchangeName)
					])] call lils_database_fnc_query;
					sleep 0.005;
					[(format[
						"UPDATE exchange_accounts SET balance = balance + %2 WHERE accountID = '%1' AND exchangeName = '%3'",
						_accountID,
						_price,
						(str _exchangeName)
					])] call lils_database_fnc_query;

					[(format[
						"INSERT INTO exchange_logs (classname, exchangeName, `type`, timestampadded, active, accountID) VALUES ('%1', '%2', '0', UNIX_TIMESTAMP(NOW()), 1, '%3')",
						(str _classname),
						(str _exchangeName),
						_unitAccountID
					])] call lils_database_fnc_query;

					[(format[
						"INSERT INTO exchange_logs (classname, exchangeName, `type`, timestampadded, active, accountID) VALUES ('%1', '%2', '1', UNIX_TIMESTAMP(NOW()), 1, '%3')",
						(str _classname),
						(str _exchangeName),
						_accountID
					])] call lils_database_fnc_query;

					[["buy_customer", [_classname, _amountToBuy, _price]], "lilc_exchange_fnc_queueed", _unit] call lilc_common_fnc_send;

					private _offerUnit = (playableUnits select { (_accountID == (_x getVariable ["lilc_accountID", 0])) });
					if ((count _offerUnit) == 1) then
					{
						_offerUnit = (_offerUnit select 0);
						[["buy_seller", [_classname, _amountToBuy, (_offer select 3), _unit]], "lilc_exchange_fnc_queued", _offerUnit] call lilc_common_fnc_send;
					};
				};

				case "sell":
				{
					/*
					data = {
						0:exchangeName
						1:offerID
						2:amountToSell
					}
					*/
					private _exchangeName = (_data select 0);
					private _offerID = (_data select 1);
					private _amountToBuy = (_data select 2);

					private _offer = ([([
						"EXCHANGE_OFFERS",
						[
							["classname"],
							["amount"],
							["accountid"],
							["price"]
						],
						[
							["exchangeName", (str _exchangeName)],
							["id", _offerID],
							["type", 1]
						]
					] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

					if ((count _offer) <= 0) throw ["sell_seller", []];
					_offer = (_offer select 0);

					if ((count _offer) != 4) throw ["sell_seller", []];
					private _classname = (_offer select 0);
					private _amount = (_offer select 1);
					private _accountID = (_offer select 2);
					private _price = (_offer select 3);

					if (_amountToBuy > _amount) throw ["sell_seller", []];

					if (_amountToBuy <= _amount) then
					{
						if (_amountToBuy == _amount) then
						{
							[(format["DELETE FROM EXCHANGE_OFFERS WHERE ID = '%1'", _offerID])] call lils_database_fnc_query;
						}
						else
						{
							[(format["UPDATE EXCHANGE_OFFERS SET amount = '%1' WHERE ID = '%2' AND `type` = '1'", (_amount - _amountToBuy), _offerID])] call lils_database_fnc_query;
						};
					};

					private _storageItem = ([(format["SELECT id, amount FROM exchange_storages WHERE accountID = '%1' AND exchangeName = '%2' AND classname = '%3'", _accountID, (str _exchangeName), (str _classname)])] call lils_database_fnc_fetchObjects);

					if (_storageItem isEqualType false) then {
						[(format["INSERT INTO exchange_storages (ID, accountID, exchangeName, classname, amount, timestampAdd) VALUES (NULL, '%1', '%2', '%3', '%4', UNIX_TIMESTAMP(NOW()))", _accountID, (str _exchangeName), (str _classname), _amountToBuy])] call lils_database_fnc_query;
					}
					else
					{
						if ((count _storageItem) <= 0) then
						{
							[(format["INSERT INTO exchange_storages (ID, accountID, exchangeName, classname, amount, timestampAdd) VALUES (NULL, '%1', '%2', '%3', '%4', UNIX_TIMESTAMP(NOW()))", _accountID, (str _exchangeName), (str _classname), _amountToBuy])] call lils_database_fnc_query;
						}
						else
						{
							_storageItem = (_storageItem select 0);

							if ((count _storageItem) == 2) then
							{
								private _storageID = (_storageItem select 0);
								private _storageAmount = (_storageItem select 1);

								[(format["UPDATE exchange_storages SET amount = '%1' WHERE ID = '%2'", (_amountToBuy + _storageAmount), _storageID])] call lils_database_fnc_query;
							};
						};
					};

					[(format["INSERT INTO exchange_accounts (ID, accountID, balance, timestampedited, exchangeName) SELECT * FROM (SELECT NULL, '%1', '0', UNIX_TIMESTAMP(NOW()), '%2') AS tmp WHERE NOT EXISTS (SELECT ID FROM exchange_accounts WHERE accountID = '%1' AND exchangeName = '%2')", _unitAccountID, (str _exchangeName)])] call lils_database_fnc_query;
					sleep 0.005;
					[(format["UPDATE exchange_accounts SET balance = balance + %2 WHERE accountID = '%1' AND exchangeName = '%3'", _unitAccountID, (_price * _amount), (str _exchangeName)])] call lils_database_fnc_query;

					[(format[
						"INSERT INTO exchange_logs (classname, exchangeName, `type`, timestampadded, active, accountID) VALUES ('%1', '%2', '1', UNIX_TIMESTAMP(NOW()), 1, '%3')",
						(str _classname),
						(str _exchangeName),
						_unitAccountID
					])] call lils_database_fnc_query;

					[(format[
						"INSERT INTO exchange_logs (classname, exchangeName, `type`, timestampadded, active, accountID) VALUES ('%1', '%2', '0', UNIX_TIMESTAMP(NOW()), 1, '%3')",
						(str _classname),
						(str _exchangeName),
						_accountID
					])] call lils_database_fnc_query;

					[["sell_seller", [_classname, _amountToBuy, _price]], "lilc_exchange_fnc_queueed", _unit] call lilc_common_fnc_send;
					
					private _offerUnit = (playableUnits select { (_accountID == (_x getVariable ["lilc_accountID", 0])) });
					if ((count _offerUnit) == 1) then
					{
						_offerUnit = (_offerUnit select 0);
						[["sell_customer", [_classname, _amountToBuy, _price, _unit]], "lilc_exchange_fnc_queued", _offerUnit] call lilc_common_fnc_send;
					};
				};

				case "remove":
				{
					/*
					data = {
						0:exchangeName
						1:offerID
						2:index
					}
					*/
					private _exchangeName = (_data select 0);
					private _offerID = (_data select 1);

					private _offer = ([(format["SELECT classname, amount, price, `type` FROM EXCHANGE_OFFERS WHERE ID = '%1'", _offerID])] call lils_database_fnc_fetchObjects);
					
					if ((count _offer) != 1) throw ["remove", []];
					_offer = (_offer select 0);

					if ((count _offer) != 4) throw ["remove", []];
					private _classname = (_offer select 0);
					private _amount = (_offer select 1);
					private _price = (_offer select 2);
					private _type = (_offer select 3);

					private _storageItem = ([(format["SELECT id, amount FROM exchange_storages WHERE accountID = '%1' AND exchangeName = '%2' AND classname = '%3'", _unitAccountID, (str _exchangeName), (str _classname)])] call lils_database_fnc_fetchObjects);

					private _storageAmount = 0;
					if (_storageItem isEqualType false) then {
						[(format["INSERT INTO exchange_storages (ID, accountID, exchangeName, classname, amount, timestampAdd) VALUES (NULL, '%1', '%2', '%3', '%4', UNIX_TIMESTAMP(NOW()))", _unitAccountID, (str _exchangeName), (str _classname), _amountToBuy])] call lils_database_fnc_query;
					}
					else
					{
						if ((count _storageItem) <= 0) then
						{
							[(format["INSERT INTO exchange_storages (ID, accountID, exchangeName, classname, amount, timestampAdd) VALUES (NULL, '%1', '%2', '%3', '%4', UNIX_TIMESTAMP(NOW()))", _unitAccountID, (str _exchangeName), (str _classname), _amountToBuy])] call lils_database_fnc_query;
						}
						else
						{
							_storageItem = (_storageItem select 0);

							if ((count _storageItem) == 2) then
							{
								private _storageID = (_storageItem select 0);
								_storageAmount = (_storageItem select 1);
								[(format["UPDATE exchange_storages SET amount = amount + '%1' WHERE ID = '%2'", _amount, _storageID])] call lils_database_fnc_query;
							};
						};
					};

					[(format["INSERT INTO exchange_logs (classname, exchangeName, `type`, timestampadded, active, accountID) VALUES ('%1', '%2', '2', UNIX_TIMESTAMP(NOW()), 1, '%3')", (str _classname), (str _exchangeName), _unitAccountID])] call lils_database_fnc_query;

					if (_type == 1) then
					{ 
						private _price = ((_amount + _storageAmount) * _price);
						[(format["INSERT INTO exchange_accounts (ID, accountID, balance, timestampedited) SELECT * FROM (SELECT NULL, '%1', '0', UNIX_TIMESTAMP(NOW())) AS tmp WHERE NOT EXISTS (SELECT ID FROM exchange_accounts WHERE accountID = '%1')", _unitAccountID])] call lils_database_fnc_query;
						sleep 0.005;
						[(format["UPDATE exchange_accounts SET balance = balance + %2 WHERE accountID = '%1'", _unitAccountID, _price])] call lils_database_fnc_query;
					};

					[(format["DELETE FROM EXCHANGE_OFFERS WHERE ID = '%1'", _offerID])] call lils_database_fnc_query;

					[["remove", [_offerID]], "lilc_exchange_fnc_queueed", _unit] call lilc_common_fnc_send;
					[_unit, _exchangeName] call lils_exchange_fnc_getmyOffers;
				};

				case "account_draw":
				{
					_data params [
						["_exchangeName", "", [""]]
					];

					private _balance = ([(format[
						"SELECT balance FROM exchange_accounts WHERE accountID = '%1' AND exchangeName = '%2' LIMIT 1",
						_unitAccountID,
						(str _exchangeName)
					])] call lils_database_fnc_fetchObjects);

					if ((count _balance) <= 0) throw ["account_draw", []];
					_balance = (_balance select 0);

					if ((count _balance) != 1) throw ["account_draw", []];
					_balance = (_balance select 0);

					[(format["UPDATE exchange_accounts SET balance = '0' WHERE accountID = '%1' AND exchangeName = '%2' LIMIT 1", _unitAccountID, (str _exchangeName)])] call lils_database_fnc_query;
					[["account_draw", [_balance]], "lilc_exchange_fnc_queueed", _unit] call lilc_common_fnc_send;
				};

				case "remove_ware":
				{
					_data params [
						["_exchangeName", "", [""]],
						["_classname", "", [""]],
						["_amount", 0, [0]]
					];

					private _exchangeConfig = ([_exchangeName] call lilc_exchange_fnc_getExchangeConfig);
					if (isNull _exchangeConfig) throw ["remove_ware", []];
					if (_amount <= 0) throw ["remove_ware", []];

					[(format[
						"UPDATE exchange_storages SET amount = amount - %1 WHERE accountID = '%2' AND exchangeName = '%3' AND classname = '%4' LIMIT 1",
						_amount,
						_unitAccountID,
						(str _exchangeName),
						(str _classname)
					])] call lils_database_fnc_query;

					throw ["remove_ware", [true]]
				};
			};
		}
		catch
		{
			[_exception, "lilc_exchange_fnc_queueed", _unit] call lilc_common_fnc_send;
		};

		sleep 0.005;
	} forEach _currentQueue;
	lils_exchange_queue deleteRange [0, (count _currentQueue)];
};
