# Default Header
A header is an important thing such as that they use the same format (for example for generating docs, e.g.).

The default header format is the following:
```cpp
/* ----------------------------------------------------------------------------
Function: <function name>
Scope: <private or public>

Description:
    <description>

Parameters:
    <variable name(optional)> - <description> <datatype>

Returns:
    <description of the returned result(s) <datatype>

Examples:
    (begin example)
    (end)

Author:
    <username>
---------------------------------------------------------------------------- */
```
*This header format was originally created by the CBA_A3 team.*

An example of the header of the function `lil_actions_fnc_canGiveMoney`:
```cpp
/* ----------------------------------------------------------------------------
Function: lil_actions_fnc_canGiveMoney
Scope: public

Description:
    Can give money checks if the user executed this function is able to give money to another player.

Paramters:
    _unit - The unit to interact with <OBJECT>

Returns:
    true or false whether the user can interact or not with _unit <BOOL>

Examples:
    -

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */
```
