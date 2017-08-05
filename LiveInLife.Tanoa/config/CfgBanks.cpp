
class CfgBanks {
    class tanBank {
        displayName = "Tanoa Bank";
        picture = "";
        newAccountAmountPersonal = 0;
        newAccountAmountBusiness = 1000;

        startAmountBusiness = 0;
        startAmountPersonal = 10000;
        isIllegal = 0;

        hashPrefix = "TANX"; //maximum 4 chars

        maxBusinessAccounts = 1;
        maxPersonalAccounts = 1;

        transferPercentage = 0.025;
        disbursePercentage = 0;
        depositPercenatage = 0;
        maxPersonalMinus = 0;
        maxBusinessMinus = 0;
    };

    /*class lehmannBrothers {
        displayName = "Lehmann Brothers";
        picture = "";
        newAccountAmount = 0;
        startAmount = 0;
        isIllegal = 0;
        transferPercentage = 0.01;
        disbursePercentage = 0.01;
        depositPercenatage = 0.01;
    };*/

    class gnBank {
        displayName = "Goliath National Bank";
        picture = "";
        newAccountAmount = 5000;
        
        startAmountBusiness = 0;
        startAmountPersonal = 10000;
        isIllegal = 0;

        hashPrefix = "GNXX"; //maximum 4 chars

        maxBusinessAccounts = 0;
        maxPersonalAccounts = 1;

        transferPercentage = 0.05;
        disbursePercentage = 0.12;
        depositPercenatage = 0;

        maxPersonalMinus = -5000;
        maxBusinessMinus = -10000;
    };
};
