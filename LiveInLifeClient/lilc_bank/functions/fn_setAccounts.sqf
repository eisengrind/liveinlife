
//= TRANSID<string>, BANK<string>, AMOUNT<int>, STATUS<bool>, ID<int>
private _bankAccounts = param [0, [], [[]]];

private _accounts = [];
{
    private _account = _x;

    try {
        {
            if ((_account select 1) == (_x select 1)) throw false;
        } forEach _accounts;
        throw true;
    } catch {
        if (_exception) then {
            _accounts pushBack _account;
        };
    };
} forEach _bankAccounts;

lilc_bank_accounts = _accounts;
