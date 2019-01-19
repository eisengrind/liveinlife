
params [
    ["_speed", 1, [1]],
    ["_background", false, [false]],
    ["_xCoord", -200, [0]],
    ["_yCoord", -200, [0]],
    ["_scale", 0, [0]]
];

try
{
    disableSerialization;

    private _ui = (uiNamespace getVariable ["lilc_ui_loading", displayNull]);
    if (isNull _ui) throw false;

    private _uiPictureBackground = (_ui displayCtrl 1501);
    private _uiPictureLoading1 = (_ui displayCtrl 1502);
    private _uiPictureLoading2 = (_ui displayCtrl 1503);
    private _uiPictureLoading3 = (_ui displayCtrl 1504);
    private _uiPictureLoading4 = (_ui displayCtrl 1505);
    private _uiPictureLoading5 = (_ui displayCtrl 1506);
    private _uiPictureLoading6 = (_ui displayCtrl 1507);
    private _uiPictureLoading7 = (_ui displayCtrl 1508);
    private _uiPictureLoading8 = (_ui displayCtrl 1509);

    private _loadingControls = [
        _uiPictureLoading1,
        _uiPictureLoading2,
        _uiPictureLoading3,
        _uiPictureLoading4,
        _uiPictureLoading5,
        _uiPictureLoading6,
        _uiPictureLoading7,
        _uiPictureLoading8
    ];

    if !(_xCoord <= -200 && _yCoord <= -200 && _scale <= 0) then
    {
        private _backgroundPosition = (ctrlPosition _uiPictureBackground);
        private _heightNew = ((_backgroundPosition select 3) * _scale);
        private _widthNew = ((_backgroundPosition select 2) * _scale);
        private _xCoordNew = (_xCoord - (_widthNew * 0.5));
        private _yCoordNew = (_yCoord - (_heightNew * 0.5));

        {
            _x ctrlSetPosition [_xCoordNew, _yCoordNew, _widthNew, _heightNew];
            _x ctrlCommit 0;
        } forEach _loadingControls + [_uiPictureBackground];
    };
    
    if !(_background) then
    {
        _uiPictureBackground ctrlShow false;
    };

    {
        _x ctrlShow true;
        _x ctrlSetFade 1;
        _x ctrlCommit 0;
    } forEach _loadingControls;

    while
    {
        true
    }
    do
    {
        {
            private _currentControl = _x;
            private _lastControl = controlNull;

            if ((_forEachIndex - 1) < 0) then
            {
                _lastControl = (_loadingControls select ((count _loadingControls) - 1));
            }
            else
            {
                _lastControl = (_loadingControls select (_forEachIndex - 1));
            };

            if !(isNull _lastControl) then
            {
                _lastControl ctrlSetFade 1;
                _lastControl ctrlCommit _speed;
            };

            _currentControl ctrlSetFade 0;
            _currentControl ctrlCommit _speed;

            sleep _speed;
        } forEach _loadingControls;
    };
}
catch
{
    _exception;
};
