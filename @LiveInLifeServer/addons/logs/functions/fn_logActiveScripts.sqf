
scriptName "lils_logs_logActiveScripts";

while
{
	true
}
do
{
	private _activeScripts = diag_activeScripts;
	private _activeSQFScripts = diag_activeSQFScripts;
	private _activeFSMScripts = diag_activeMissionFSMs;

	[
		(format[
			"There are currently %1 running:",
			(
				(_activeScripts select 0) +
				(_activeScripts select 1) +
				(_activeScripts select 2) +
				(_activeScripts select 3)
			)
		]),
		"lils_logs",
		"INFO"
	] call lilc_common_fnc_diag_log;

	[
		" Current SQF scripts:",
		"lils_logs",
		"INFO"
	] call lilc_common_fnc_diag_log;

	[
		"  <scriptName>, <fileName>, <isRunning>, <currentLine>",
		"lils_logs",
		"INFO"
	] call lilc_common_fnc_diag_log;

	{
		[
			(format[
				"  %1, %2, %3, %4",
				(_x select 0),
				(_x select 1),
				(_x select 2),
				(_x select 3)
			]),
			"lils_logs",
			"INFO"
		] call lilc_common_fnc_diag_log;
	} forEach _activeSQFScripts;

	[
		" Current mission FSMs:",
		"lils_logs",
		"INFO"
	] call lilc_common_fnc_diag_log;

	[
		"  <FSMName>, <status>, <timeout>",
		"lils_logs",
		"INFO"
	] call lilc_common_fnc_diag_log;

	{
		[
			(format[
				"  %1, %2, %3",
				(_x select 0),
				(_x select 1),
				(_x select 2)
			]),
			"lils_logs",
			"INFO"
		] call lilc_common_fnc_diag_log;
	} forEach _activeFSMScripts;

	sleep (60 * 10);
};
