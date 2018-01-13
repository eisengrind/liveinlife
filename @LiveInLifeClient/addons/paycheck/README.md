
# lilc_paycheck
This package allows you to enable or disable a single money paycheck.

## Usage
You can enable the paycheck in the game with this:
```sqf
this addAction [
    "Request paycheck",
    {
        call lilc_paycheck_fnc_enable;
    },
    false,
    0,
    false,
    false,
    "",
    "!(call lilc_paycheck_fnc_have)"
];
```

Thus, you can disable it too!
```sqf
this addAction [
    "Refuse paycheck",
    {
        call lilc_paycheck_fnc_disable;
    },
    false,
    0,
    false,
    false,
    "",
    "(call lilc_paycheck_fnc_have)"
];
```
