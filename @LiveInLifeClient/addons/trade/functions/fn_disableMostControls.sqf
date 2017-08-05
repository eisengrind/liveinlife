
try
{
	disableSerialization;
	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	private _uiButtonAcceptTrade = (_ui displayCtrl 2403);
	private _uiListMyInventory = (_ui displayCtrl 1500);
	private _uiListMyOffers = (_ui displayCtrl 1502);
	private _uiEditMyMoney = (_ui displayCtrl 1400);
	private _uiButtonAddMoney = (_ui displayCtrl 2401);
	private _uiButtonRemoveMoney = (_ui displayCtrl 2400);

	_uiButtonAcceptTrade ctrlEnable false;
	_uiListMyInventory ctrlEnable false;
	_uiListMyOffers ctrlEnable false;
	_uiEditMyMoney ctrlEnable false;
	_uiButtonAddMoney ctrlEnable false;
	_uiButtonRemoveMoney ctrlEnable false;

	throw true;
}
catch
{
	_exception;
};
