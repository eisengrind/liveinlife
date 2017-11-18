
In LiveInLife packages there are differences:
First of all LiveInLife differentiates between a client and a server extension/modification.
Therefore LiveInLife uses prefixes for indicating if a mod is a client or server sided package.
The client is indicated by `lilc_` while server packages are indicated by `lils_`.

There exists "library" and "module" packages.
A **library** package is signed with `lilc_lib_` or `lils_lib_`.
Furthermore a **module** package is signed by either `lilc_` or `lils_`.
Most of the server sided packages are librarys because they dont perform any "modular action".
Actually it is possible that a *lilc_lib_&lt;y&gt;* package can also exists as an module *lilc_&lt;y&gt;* - but this is more irritating than other names.

For example a client module is the package *lilc_atm* because it uses library function from "banks".
But "banks" does not perform any visible action for the end user.

Thats why LiveInLife tries to differentiate between librarys and modules.
