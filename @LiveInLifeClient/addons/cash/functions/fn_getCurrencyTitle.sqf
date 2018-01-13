
params [
    ["_value", 0, [0]]
];

if (_value == 1 || _value == 0) then
{
    lilc_cash_currencyTitle;
}
else
{
    lilc_cash_currencyTitlePlural;
};
