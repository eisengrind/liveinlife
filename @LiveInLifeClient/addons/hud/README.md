
# lilc_hud

```hpp
class CfgHud
{
    class health
    {
        statement = "format['%1 %2', (round ((damage player) * 100)), '%'];"; //used code to get result to display
        condition = "true;"; //condition to show an info
    };

    class hunger
    {
        statement = "format['%1 %2', (round lilc_player_hunger), '%'];"; //used code to get result to display
        condition = "true;"; //condition to show an info
    };

    class thirst
    {
        statement = "format['%1 %2', (round lilc_player_thirst), '%'];"; //used code to get result to display
        condition = "true;"; //condition to show an info
    };

    class cash
    {
        statement = "format['%1 %2', (round (player getVariable ['lilc_cash_balance', 0])), '$'];"; //used code to get result to display
        condition = "true;"; //condition to show an info
    };
};
```
