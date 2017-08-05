
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

    class investigative {
        displayName = "Untersuchungshaft";
        timeouts[] = {
            (60*60),
            (60*60*2),
            (60*60*3),
            (60*60*4),
            (60*60*5),
            (60*60*6),
            (60*60*12),
            (60*60*24),
            (60*60*48),
            -1
        };
        position = ""; //gef�ngnis
        prisons[] = {"prison1"};
        neededFactionsForRelease[] = {};
    };

    class jail {
        displayName = "Gef�ngnishaft";
        timeouts[] = {
            (60*60),
            (60*60*2),
            (60*60*3),
            (60*60*4),
            (60*60*5),
            (60*60*6),
            (60*60*12),
            (60*60*24),
            (60*60*48),
            -1
        };
        escapedMapTimeout = (15*60); //default is (10*60) seconds
        position = ""; //gef�ngnis
        prisons[] = {"prison1"};
        neededFactionsForRelease[] = {};
    };
};
