
_this displayAddEventHandler [
    "KeyDown",
    {
        params [
            ["_display", displayNull, [displayNull]],
            ["_keyCode", 0, [0]],
            ["_shift", false, [false]],
            ["_ctrl", false, [false]],
            ["_alt", false, [false]]
        ];

        if (_keyCode == 1) then
        {
            lilc_action_interrupted = true;
        };

        if (_keyCode in (actionKeys "PersonView")) then
        {
            if (cameraView == "INTERNAL") then
            {
                player switchCamera "EXTERNAL";
                titleText["", "BLACK IN", 0.2];
            }
            else
            {
                player switchCamera "INTERNAL";
                titleText["", "BLACK IN", 0.2];
            };
        };

        false;
    }
];
