
class lilcm_pcard_personalcard {
    idd = 1554;
    name = "lilcm_pcard_personalcard";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscPicture {
            idc = 1555;
            text = "";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.407 * safezoneH;
        };
    };

    class controls {
        class TextLastname : lilc_RscStructuredText {
            idc = 1556;
            text = "";
            x = 0.473497 * safezoneW + safezoneX;
            y = 0.45512 * safezoneH + safezoneY;
            w = 0.145938 * safezoneW;
            h = 0.0300001 * safezoneH;
           /*x = 0.473542 * safezoneW + safezoneX;
            y = 0.45137 * safezoneH + safezoneY;
            w = 0.145938 * safezoneW;
            h = 0.03 * safezoneH;*/
        };

        class TextForename : lilc_RscStructuredText {
            idc = 1557;
            text = "";
            x = 0.473394 * safezoneW + safezoneX;
            y = 0.49164 * safezoneH + safezoneY;
            w = 0.145938 * safezoneW;
            h = 0.0216667 * safezoneH;
            /*x = 0.473437 * safezoneW + safezoneX;
            y = 0.487963 * safezoneH + safezoneY;
            w = 0.145938 * safezoneW;
            h = 0.0216667 * safezoneH;*/
        };

        class TextBirthdate : lilc_RscStructuredText {
            idc = 1558;
            text = "";
            x = 0.473394 * safezoneW + safezoneX;
            y = 0.52662 * safezoneH + safezoneY;
            w = 0.0685937 * safezoneW;
            h = 0.022 * safezoneH;
            /*x = 0.473437 * safezoneW + safezoneX;
            y = 0.523741 * safezoneH + safezoneY;
            w = 0.0685937 * safezoneW;
            h = 0.022 * safezoneH;*/
        };
        
        class TextNationality : lilc_RscStructuredText {
            idc = 1559;
            text = "";
            x = 0.545891 * safezoneW + safezoneX;
            y = 0.5264 * safezoneH + safezoneY;
            w = 0.0732812 * safezoneW;
            h = 0.0210741 * safezoneH;
            /*x = 0.545885 * safezoneW + safezoneX;
            y = 0.523852 * safezoneH + safezoneY;
            w = 0.0732812 * safezoneW;
            h = 0.0210741 * safezoneH;*/
        };

        class TextExpirationDate : lilc_RscStructuredText {
            idc = 1560;
            text = "";
            x = 0.472878 * safezoneW + safezoneX;
            y = 0.56116 * safezoneH + safezoneY;
            w = 0.146406 * safezoneW;
            h = 0.0210741 * safezoneH;
            /*x = 0.472917 * safezoneW + safezoneX;
            y = 0.560186 * safezoneH + safezoneY;
            w = 0.146406 * safezoneW;
            h = 0.0210741 * safezoneH;*/
        };

        class TextSignature : lilc_RscStructuredText {
            idc = 1561;
            text = "";
            x = 0.472878 * safezoneW + safezoneX;
            y = 0.60098 * safezoneH + safezoneY;
            w = 0.146406 * safezoneW;
            h = 0.0275557 * safezoneH;
            /*
            x = 0.472917 * safezoneW + safezoneX;
            y = 0.598148 * safezoneH + safezoneY;
            w = 0.146406 * safezoneW;
            h = 0.0275556 * safezoneH;*/
        };

        class TextPersonalcardID : lilc_RscStructuredText {
            idc = 1562;
            text = "";
            x = 0.390625 * safezoneW + safezoneX;
            y = 0.611112 * safezoneH + safezoneY;
            w = 0.0792185 * safezoneW;
            h = 0.0164444 * safezoneH;
        };
        
        class TextCreationCity : lilc_RscStructuredText {
            idc = 1563;
            text = "";
            x = 0.386041 * safezoneW + safezoneX;
            y = 0.485296 * safezoneH + safezoneY;
            w = 0.109792 * safezoneW;
            h = 0.0229259 * safezoneH;
        };

        class TextCity : lilc_RscStructuredText {
            idc = 1564;
            text = "";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.395444 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextParish : lilc_RscStructuredText {
            idc = 1565;
            text = "";
            x = 0.505208 * safezoneW + safezoneX;
            y = 0.418519 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextStreet : lilc_RscStructuredText {
            idc = 1566;
            text = "";
            x = 0.505209 * safezoneW + safezoneX;
            y = 0.441667 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextID1 : lilc_RscStructuredText {
            idc = 1567;
            text = "";
            x = 0.381928 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.236666 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextID2 : lilc_RscStructuredText {
            idc = 1568;
            text = "";
            x = 0.381927 * safezoneW + safezoneX;
            y = 0.558593 * safezoneH + safezoneY;
            w = 0.236666 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextID3 : lilc_RscStructuredText {
            idc = 1569;
            text = "";
            x = 0.38177 * safezoneW + safezoneX;
            y = 0.583333 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonPersonalCard : lilc_RscButtonMenu {
            idc = 1570;
            text = "Wechseln";
            x = 0.536093 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class lilcm_pcard_personalCardList {
    idd = 1571;
    name = "lilcm_pcard_personalCardList";
    enableSimulation = 1;
    movingEnable = 0;

    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscPicture {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.242 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Personalausweise";
            colorBackground[] = {0, 0, 0, 1};
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class ListPersonalcards : lilc_RscListbox {
            idc = 1572;
            text = "";
			sizeEx = 0.032;
            x = 0.453593 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.165 * safezoneH;
        };

        class ButtonSelect : lilc_RscButtonMenu {
            idc = -1;
            text = "Zeigen";
            onButtonClick = "[lilc_pcard_currentUnit, (call compile (lbData [1572, (lbCurSel 1572)]))] call lilc_pcard_fnc_sendPersonalcard;";
            x = 0.453593 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class lilcm_pcard_createPersonalcard {
	idd = 1573;
	name = "lilcm_pcard_createPersonalcard";
	enableSimulation = 1;
	movingEnable = 0;
	
	class controlsBackground {
		class FrameBackgroundBackground : lilc_RscText {
			idc = -1;
			text = "";
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.385 * safezoneH;
		};
		
		class TitleTitle : lilc_RscTitle {
			idc = -1;
			text = "Personalausweis erstellen";
			colorBackground[] = {0, 0, 0, 1};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextBirthdate : lilc_RscText {
			idc = -1;
			text = "Geburtsdatum:";
			colorBackground[] = {0, 0, 0, 1};
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextZipcode : TextBirthdate {
			idc = -1;
			text = "Postleitzahl:";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextCity : TextBirthdate {
			idc = -1;
			text = "Stadt:";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextStreet : TextBirthdate {
			idc = -1;
			text = "Straße:";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextStreetnumber : TextBirthdate {
			idc = -1;
			text = "Hausnummer:";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextDay : lilc_RscText {
			idc = -1;
			text = "Tag";
			sizeEx = 0.02;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.383519 * safezoneH + safezoneY;
			w = 0.0360417 * safezoneW;
			h = 0.00685183 * safezoneH;
		};
		
		class TextMonth : TextDay {
			idc = -1;
			text = "Monat";
			sizeEx = 0.02;
			x = 0.450521 * safezoneW + safezoneX;
			y = 0.383333 * safezoneH + safezoneY;
			w = 0.0808334 * safezoneW;
			h = 0.00777775 * safezoneH;
		};
		
		class TextYear : TextDay {
			idc = -1;
			text = "Jahr";
			sizeEx = 0.02;
			x = 0.533333 * safezoneW + safezoneX;
			y = 0.383333 * safezoneH + safezoneY;
			w = 0.0542709 * safezoneW;
			h = 0.00777775 * safezoneH;
		};
	};
	
	class controls {
		class ComboBirthdateDay : lilc_RscCombo {
			idc = 1574;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.349704 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class ComboBirthdateMonth : ComboBirthdateDay {
			idc = 1575;
			x = 0.450521 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0808854 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		
		class ComboBirthdateYear : ComboBirthdateDay {
			idc = 1576;
			x = 0.533334 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0543229 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		
		class EditZipcode : lilc_RscEdit {
			idc = 1577;
			text = "";
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.426852 * safezoneH + safezoneY;
			w = 0.175156 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		
		class EditCity : EditZipcode {
			idc = 1578;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.175156 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		
		class EditStreet : EditCity {
			idc = 1579;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.558704 * safezoneH + safezoneY;
			w = 0.175156 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		
		class EditStreetnumber : EditCity {
			idc = 1580;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.62474 * safezoneH + safezoneY;
			w = 0.175156 * safezoneW;
			h = 0.032074 * safezoneH;
		};
		
		class ButtonComplete : lilc_RscButtonMenu {
			idc = 1581;
			text = "Erstellen";
			onButtonClick = "[] spawn lilc_pcard_fnc_createPersonalcard;";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
