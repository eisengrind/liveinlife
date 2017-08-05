
disableSerialization;
private _ui = uiNamespace getVariable ["lilc_playerTags", displayNull];
if (isNull _ui) exitWith {};

private _objects = ((nearestObjects [player, ["Man"], 10]) - [player]);

{
    private _ctrlTag = _ui displayCtrl (1055 + _forEachIndex);

    try
    {
        if (
            ((_x distance player) > 6) &&
            !((isPlayer _x && alive _x) || (!isPlayer _x && alive _x && (_x getVariable ["lilc_aiName", ""]) != "" && (_x isKindOf "Man"))) &&
            (lineIntersects [(eyePos player), (eyePos _x), player, _x]) &&
            (vehicle _x != _x)
        ) throw false;

        private _selPos = (_x selectionPosition "head");
        private _position = [((visiblePosition _x) select 0), ((visiblePosition _x) select 1), (((_x modelToWorld _selPos) select 2) + 0.45)];
        
        private _screenPosition = worldToScreen _position;
        if ((count (_screenPosition)) <= 0) throw false;

        _fade = (((_position distance player) - 0.5) / 8);

        private _text = "";
        if ((_x getVariable ["lilc_aiName", ""]) != "" && !isPlayer _x) then
        {
            _text = (_x getVariable ["lilc_aiName", ""]);
        }
        else
        {
            _text = format["%1", ([_x] call lilc_tags_fnc_getPlayerTag)];
        };

        private _isSpeaking = (
            if !(isNil "tfar_fnc_isSpeaking") then
            {
                (_x call tfar_fnc_isSpeaking)
            }
            else
            {
                false; //ask for arma3-ingame voip chat is speaking...
            }
        );

        _ctrlTag ctrlSetPosition [(_screenPosition select 0) - 0.25, (_screenPosition select 1), 0.5, 0.6];
        _ctrlTag ctrlSetStructuredText parseText format[
            "<t shadow='1' font='PuristaLight' align='center' size='1'>%1%2</t>",
            (if (_isSpeaking) then
            {
                "<img image='\lilc_common\icons\BIS_microphone_ca.paa'>";
            }
            else
            {
                "";
            }),
            _text
        ];
        _ctrlTag ctrlSetFade _fade;
        _ctrlTag ctrlSetScale 1;
        _ctrlTag ctrlCommit 0;
        _ctrlTag ctrlShow true;
    }
    catch
    {
        if !(_exception) then
        {
            _ctrlTag ctrlShow false;
        };
    };
} forEach _objects;

ctrlShow [(1055 + (count _objects)), false];
