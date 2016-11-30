
lilc_player_HUDEnabled = false;
showCinemaBorder false;
camUseNVG false;
lilc_login_camera = (["login"] call lilc_common_fnc_createStaticCamera);
100 cutText ["", "BLACK IN", 3];
sleep 2;

if ((count lilc_login_accountInformation) <= 0) then {
    call lilc_login_fnc_openSignupMenu;
} else {
    call lilc_login_fnc_openLoginMenu;
};
