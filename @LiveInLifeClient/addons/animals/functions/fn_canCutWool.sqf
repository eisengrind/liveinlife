
private _sheep = param [0, objNull, [objNull]];

try {
    //if (isNull _sheep) throw false;
    //if ((typeOf _sheep) != "Sheep_random_F") throw false;
    
    private _time = time;
    if ((_sheep getVariable ["lilc_animals_sheepCutted", _time]) > _time) throw false;

    throw true;
} catch {
    _exception;
};
