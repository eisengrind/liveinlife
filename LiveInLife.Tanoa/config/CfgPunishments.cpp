
class CfgPunishments {
    //creates the needed permissions like punishments.custody.set, .remove
    class custody {
        displayName = "Gewahrsam";
        timeouts[] = { //in seconds
            600,
            (20*60),
            (30*60),
            (40*60),
            (50*60),
            (60*60)
        };
        position = ""; //gef�ngnis
        prisons[] = {"prison1"};
        escapeTimeUntilFree = (12 * 60 * 10 * 60); //10 minutesdw
        neededFactionsForRelease[] = {};
    };
};
