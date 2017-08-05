
params [
	["_punishmentName", "", [""]],
	["_punishmentTimeout", -1, [0]],
	["_punishmentEscapeTimeout", -1, [0]]
];

try
{
	private _punishmentConfig = ([_punishmentName] call lilc_prison_fnc_getPunishmentConfig);
	if (isNull _punishmentConfig) throw false;
	if (player getVariable ["lilc_prison_isJailed", false]) throw false;

	disableSerialization;
	["lilc_prison_status", "lilc_prison_status", 1, false] call lilc_ui_fnc_fadeInTitles;
	private _ui = (uiNamespace getVariable ["lilc_prison_status", displayNull]);
	if (isNull _ui) throw false;

	private _uiPictureBattery = (_ui displayCtrl 1200);
	private _uiProgressBattery = (_ui displayCtrl 1201);
	private _uiTextJailInfo = (_ui displayCtrl 1621);

	_uiPictureBattery ctrlShow false;
	_uiProgressBattery ctrlShow false;

	player setVariable ["lilc_prison_isJailed", true, true];

	[
		"lilce_prison_punishment_started",
		[
			player,
			_punishmentName,
			_punishmentTimeout,
			_punishmentEscapeTimeout
		]
	] call CBA_fnc_localEvent;

	private _punishmentEscapeTimeUntilFree = (["escapeTimeUntilFree", "NUMBER", (10 * 60)] call lilc_common_fnc_getSetting);
	private _escapedMapUpdateTimeout = (["prison_escapeMapUpdateTimeout", "NUMBER", (10 * 60)] call lilc_common_fnc_getSetting);

	private _jailStartTime = (round time);
	player setVariable ["lilc_prison_currentPunishment", _punishmentName, true];
	lilc_prison_escapeTime = _punishmentEscapeTimeout;
	lilc_prison_waitingTime = _punishmentTimeout;

	_uiTextJailInfo ctrlSetStructuredText parseText format[
		"<t size='0.7'>Verbleibende Zeit:</t><br /><t size='2.5'>%1</t><br /><br /><t size='0.7'>Derzeitiger Status:</t><br /><t size='1.4'>%2</t><br /><br /><t size='0.7'>Gefängnis:</t><br /><t size='1.4'>%3</t>",
		(if (lilc_prison_waitingTime != -1) then
		{
			([lilc_prison_waitingTime, "HH:MM:SS"] call BIS_fnc_secondsToString);
		}
		else
		{
			"Unbegrenzt";
		}),
		(["displayName", "STRING", "Kein Name angegeben.", _punishmentConfig] call lilc_common_fnc_getSetting),
		(getText(([(call lilc_prison_fnc_getCurrentPrison)] call lilc_prison_fnc_getPrisonConfig) >> "displayName"))
	];

	waitUntil
	{
		([_punishmentName] call lilc_prison_fnc_isInPunishmentPrison) ||
		((lilc_prison_escapeTime < _punishmentEscapeTimeUntilFree) && !(lilc_prison_escapeTime <= 0)) ||
		lilc_prison_waitingTime == -2 ||
		!(player getVariable ["lilc_prison_isJailed", false])
	};

	while
	{
		(lilc_prison_waitingTime > 0) &&
		(lilc_prison_escapeTime < _punishmentEscapeTimeUntilFree) &&
		(player getVariable ["lilc_prison_isJailed", false])
	}
	do
	{
		if ([_punishmentName] call lilc_prison_fnc_isInPunishmentPrison) then
		{
			if (lilc_prison_escapeTime != 0) then
			{
				lilc_prison_escapeTime = 0;
				player setVariable ["lilc_prison_escapeLastPosition", [], true];
				
				_uiTextJailInfo ctrlShow true;
				_uiPictureBattery ctrlShow false;
				_uiProgressBattery ctrlShow false;
			};

			if ((_jailStartTime + 1) < time && lilc_prison_waitingTime != -1) then
			{
				lilc_prison_waitingTime = (lilc_prison_waitingTime - 1);
				_jailStartTime = time;
			};

			_uiTextJailInfo ctrlSetStructuredText parseText format[
				"<t size='0.7'>Verbleibende Zeit:</t><br /><t size='2.5'>%1</t><br /><br /><t size='0.7'>Derzeitiger Status:</t><br /><t size='1.4'>%2</t><br /><br /><t size='0.7'>Gefängnis:</t><br /><t size='1.4'>%3</t>",
				(if (lilc_prison_waitingTime != -1) then
				{
					([lilc_prison_waitingTime, "HH:MM:SS"] call BIS_fnc_secondsToString);
				}
				else
				{
					"Unbegrenzt";
				}),
				(["displayName", "STRING", "Kein Name angegeben.", _punishmentConfig] call lilc_common_fnc_getSetting),
				(getText(([(call lilc_prison_fnc_getCurrentPrison)] call lilc_prison_fnc_getPrisonConfig) >> "displayName"))
			];
		}
		else
		{
			if (lilc_prison_escapeTime <= 0) then
			{
				lilc_prison_escapeTime = 0;

				_uiTextJailInfo ctrlShow false;
				_uiPictureBattery ctrlShow true;
				_uiProgressBattery ctrlShow true;
			};

			if ((lilc_prison_escapeTime % _escapedMapUpdateTimeout) == 0) then
			{
				player setVariable ["lilc_prison_escapeLastPosition", (getPos player), true];
			};

			if ((_jailStartTime + 1) < time) then
			{
				lilc_prison_escapeTime = (lilc_prison_escapeTime + 1);
				_jailStartTime = time;
			};

			_uiProgressBattery progressSetPosition ((_punishmentEscapeTimeUntilFree - lilc_prison_escapeTime) / _punishmentEscapeTimeUntilFree);
		};

		sleep 0.1;
	};

	private _availableReleaseFactions = ((("true" configClasses (missionConfigFile >> "CfgFactions")) select { ((getNumber(_x >> "jail_canReleasePrisoner")) == 1) }) apply { (getNumber(_x >> "id")) });
	private _availableReleaseUnits = (playableUnits select { ((_x getVariable ["lilc_factionID", -1]) in _availableReleaseFactions) });

	if ((count _availableReleaseUnits) <= 0) then
	{
		lilc_prison_waitingTime = 0;
		lilc_prison_escapeTime = 0;
		player setVariable ["lilc_prison_isJailed", false, true];
		["lilc_prison_status"] call lilc_ui_fnc_fadeOutTitles;

		[1] call lilc_ui_fnc_fadeInBlack;
		sleep 1;

		private _releasePosition = ([(getText(_punishmentConfig >> "releasePosition"))] call lilc_common_fnc_getDynamicPosition);
		if ((count _releasePosition) != 2) then
		{
			_releasePosition = [(getPosASL player), (getDir player)];
		};
		[player, _releasePosition] call lilc_common_fnc_setPosition;

		sleep 1;
		[1] call lilc_ui_fnc_fadeOutBlack;
	}
	else
	{
		_uiTextJailInfo ctrlSetStructuredText parseText format[
			"<t size='0.7'>Derzeitiger Status:</t><br/><t size='1.4'>Warte auf Entlassung</t>"
		];

		lilc_prison_waitingTime = -2;
		lilc_prison_escapeTime = 0;
	};

	player setVariable ["lilc_prison_escapeLastPosition", [], true];
	["prison_status"] call lilc_login_fnc_updatePlayerDataPartial;
	["lilce_prison_punishment_ended", [player, _punishmentName, _punishmentTimeout, _punishmentEscapeTimeout]] call CBA_fnc_localEvent;

	throw true;
}
catch
{
	_exception;
};
