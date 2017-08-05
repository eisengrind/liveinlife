
showCinemaBorder false;
[0.01] call lilc_ui_fnc_fadeInBlack;
0 fadeMusic 0;
0 fadeSound 0;
playMusic ["AmbientTrack02_F_EXP", 58];
3 fadeMusic 1;
1 fadeSound 0.5;

call lilc_ui_fnc_disableHud;
sleep 4;
private _camera = "camera" camCreate [5138.71,10576.51,72.14];
_camera cameraEffect ["internal","back"];
_camera camPrepareTarget [-62086.80,-55613.23,-549.98];
_camera camPreparePos [11329.71,12280.05,27.99];
_camera camPrepareFOV 0.7;
_camera camCommitPrepared 0;
sleep 1;

_camera camPrepareTarget [52575.86,-78791.63,-549.48];
_camera camPreparePos [11296.54,12287.79,34.25];
_camera camPrepareFOV 0.7;
_camera camCommitPrepared 40;
[6] call lilc_ui_fnc_fadeOutBlack;

sleep 2;
["lilc_ui_logo", 2, 50, false] call lilc_ui_fnc_fadeInTitles;
sleep 9;
[2, 50] call lilc_ui_fnc_fadeOutTitles;
[4] call lilc_ui_fnc_fadeInBlack;
sleep 4;
_camera camPrepareTarget [-26729.50,83464.15,54498.11];
_camera camPreparePos [11071.52,8460.90,7.92];
_camera camPrepareFOV 0.680;
_camera camCommitPrepared 0;

_camera camPrepareTarget [-53297.04,47967.79,65759.21];
_camera camPreparePos [11079.10,8470.14,1.52];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 60;

sleep 0.5;
[1] call lilc_ui_fnc_fadeOutBlack;
sleep 1;

/*["Eisengrind_Logo", 2, 50, false] call lilc_ui_fnc_fadeInTitles;
sleep (4 + 10);
[2, 50] call lilc_ui_fnc_fadeOutTitles;*/

sleep (6 + 2);
["<t font='PuristaLight' shadow='1' size='1.4' align='center'>created by<br />Vincent Heins</t>", 0, 0.4, 4, 2] spawn BIS_fnc_dynamicText;
/*sleep 8;
["<t font='PuristaLight' shadow='1' size='1.4' align='center'>and<br />Eisengrind Team</t>", 0, 0.4, 4, 2] spawn BIS_fnc_dynamicText;*/
sleep 8;
["<t font='PuristaLight' shadow='1' size='1.4' align='center'>Have fun!</t>", 0, 0.4, 4, 2] spawn BIS_fnc_dynamicText;
sleep 8;

[4] call lilc_ui_fnc_fadeInBlack;
sleep 4;
3 fadeSound 0;
3 fadeMusic 0;
sleep 3;
playMusic "";
0 fadeMusic 1;
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
