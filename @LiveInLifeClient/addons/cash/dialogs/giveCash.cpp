
class lilc_giveCash {
    name = "lilc_giveCash";
    idd = 1360;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class FrameTitleBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBodyBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.0863, 0.1451, 0.2118, 1};
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.143 * safezoneH;
        };

        class FrameFooterBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Geld geben";
            sizeEx = 0.045;
            font = "PuristaMedium";
            colorText[] = {0.0863, 0.1451, 0.2118, 1};
            shadow = 0;
            x = 0.420573 * safezoneW + safezoneX;
            y = 0.406556 * safezoneH + safezoneY;
            w = 0.159374 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class ButtonClose : lilc_RscButtonMenu {
            idc = -1;
            text = "Close";
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
            onButtonClick = "closeDialog 1360;";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextDescription : lilc_RscStructuredText {
            idc = 1361;
            text = "Hier sollte ihre Beschreibung stehen!";
            sizeEx = 0.028;
            font = "PuristaLight";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.439444 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.055 * safezoneH;
        };

        class EditValue : lilc_RscEdit {
            idc = 1362;
            text = "0";
            sizeEx = 0.035;
            font = "PuristaMedium";
            onKeyUp = "_this call lilc_cash_fnc_onCharEdit;";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ButtonGive : lilc_RscButtonMenu {
            idc = 1363;
            text = "Geben";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            onButtonClick = "closeDialog 1360; [lilc_cash_receivingUnit, (parseNumber (ctrlText 1362))] call lilc_cash_fnc_give;";
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
