# lilc_tickets

## What it does
`lilc_tickets` implements a simple ticket system for e.g. police faction and others. Thus, a much more complicated roleplay is guaranteed for sure.

To create a ticket, you will need both items `s` and `s`, so that also civilian players can create a ticket, if they have these ressources.

Currently there is no way to disable the usage of items and neither it is possible to disable the ticket creation for a single faction at all.

## Ticket templates
Ticket templates are available for those, who are lazy: It is just a predefined value to select from within the ticket creation. This is useful as many servers have big catalogue to select a single fee from.
So it is not necessary to memorize this catalogue.

To create a template catalogue you have to add or edit the following config in `missionConfigFile`:
```cpp
class CfgTicketTemplates {
    class template1 {
        displayName = "Parking ticket";
        condition = "(player getVariable ['lilc_factionID', -1]) == 0"; //only apply this kind of ticket to the authority.
        amount = 100;
    };
};
```
