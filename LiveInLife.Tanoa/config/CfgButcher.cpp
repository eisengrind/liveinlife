
/*class CfgButcher
{
    class butcher1
    {
        displayName = "Ausschlachter Nummer 1!";

        class vehicles
        {
            class <vehicleClassnameUno>
            {
                position = "";
                timeout = 0;
                results[] = {
                    {"<itemClassname>", <amount>, <chancePerItem>}
                };
            };
        };
    };
};*/

class CfgButcher
{
    class butcher1
    {
        displayName = "Verwertungsanlage";

        class vehicles
        {
            class egcv_Urbanized_LP700_yellow
            {
                position = "Butcher1";
                timeout = 153;

                results[] = {
                    {"egci_WheelSport_F", 4, 1},
                    {"egci_MotorPart_F", 15, 0.66},
                    {"egci_BodyPart_F", 6, 0.66},
                    {"egci_UndercarriagePart_F", 8, 0.66},
                    {"egci_TransmissionPart_F", 10, 0.66},
                    {"egci_Diamond_F", 1, 0.66},
                    {"egci_GoldBar_F", 2, 0.66},
                    {"egci_TitanIngot_F", 4, 0.66},
                    {"egci_Leather_F", 6, 0.66},
                    {"lilci_woodpile_F", 4, 0.66},
                    {"egci_Plastic_F", 10, 0.66},
                    {"egci_Glas_F", 4, 0.66},
                    {"egci_Microchip_F", 2, 0.66},
                    {"egci_ElectronicPart_F", 5, 0.66},
                    {"egci_Cable_F", 4, 0.66}
                };
            };
        };
    };
};
