#define false 0
#define true 1

class CfgRecipes
{
	class player //deklariertes Schlüsselwort; für eigenen Spielerfigurbezug
	{
		displayName = "Spieler"; //Name der Klasse
		picture = ""; //Bild
		
		class recipes
		{
			class recipe_1
			{
				displayName = "Rezept 1"; //Name
				description = "";
				picture = ""; //Bild
				time = 0; //in Sekunden
				hideMissing = false; //if just one item is missing, the crafting recipe will not be displayed;
				//showWhileOutsidePosition = false - removed because of "nosense?".
				vars[] = {""}; //optional variable name(s) for value check - !!not implemented yet!!
				varsValues[] = {}; //optional variable values(s) to check; multiple values are available in an array[<any>, ...n]; equal indexes to vars[] - !!not implemented yet!!
				varsNames[] = {}; //optional var displayNames to display in crafting menu - !!not implemented yet!!
				
				tools[] = { //Werkzeuge, welche abgenutzt werden (oder nicht)
					{"ItemGPS", 1, 1, false}, //{<classname/string>, <wear/integer>, <chance/float>, <hideMissing/bool>}
					{"ItemMap", 2, 1, true}
				};
				requirements[] = {
					{"srifle_GM6_F", 1, 1, false} //{<classname/string>, <amount/integer>, <chance/float>, <hideMissing/bool>}; <hideMissing> = same as above but in this case only this item is controlled to be missing;
				};
				results[] = {
					{"srifle_GM6_LRPS_F", 1, 1} //{<classname/string>, <amount/integer>, <chance/float>}
				};
			};
		};
	};
	
	class egcv_B_MRAP_01_F
	{
		displayName = "";
		picture = "";
		radius = 5;
		
		class recipes
		{
			class recipe_1
			{
				displayName = "Recipe 2"; //Name
				description = "";
				picture = ""; //Bild
				time = 0; //in Sekunden
				hideMissing = false; //if just one item is missing, the crafting recipe will not be displayed;
				//showWhileOutsidePosition = false - removed because of "nosense?".
				vars[] = {""}; //optional variable name(s) for value check - !!not implemented yet!!
				varsValues[] = {}; //optional variable values(s) to check; multiple values are available in an array[<any>, ...n]; equal indexes to vars[] - !!not implemented yet!!
				varsNames[] = {}; //optional var displayNames to display in crafting menu - !!not implemented yet!!
				
				tools[] = { //Werkzeuge, welche abgenutzt werden (oder nicht)
					{"ItemGPS", 1, 1}, //{<classname/string>, <wear/integer>, <chance/float>}
					{"ItemMap", 2, 1}
				};
				requirements[] = {
					{"srifle_GM6_F", 1, 1, false} //{<classname/string>, <amount/integer>, <chance/float>, <hideMissing/bool>}; <hideMissing> = same as above but in this case only this item is controlled to be missing;
				};
				results[] = {
					{"srifle_GM6_LRPS_F", 1, 1} //{<classname/string>, <amount/integer>, <chance/float>}
				};
			};
		};
	};
	
	class smithy
	{
		displayName = "";
		picture = "";
		radius = 30;
		
		class recipes
		{
			class recipe_1
			{
				displayName = "Recipe 2"; //Name
				description = "";
				picture = ""; //Bild
				time = 0; //in Sekunden
				hideMissing = false; //if just one item is missing, the crafting recipe will not be displayed;
				//showWhileOutsidePosition = false - removed because of "nosense?".
				vars[] = {""}; //optional variable name(s) for value check - !!not implemented yet!!
				varsValues[] = {}; //optional variable values(s) to check; multiple values are available in an array[<any>, ...n]; equal indexes to vars[] - !!not implemented yet!!
				varsNames[] = {}; //optional var displayNames to display in crafting menu - !!not implemented yet!!
				
				tools[] = { //Werkzeuge, welche abgenutzt werden (oder nicht)
					{"ItemGPS", 1, 1}, //{<classname/string>, <wear/integer>, <chance/float>}
					{"ItemMap", 2, 1}
				};
				requirements[] = {
					{"srifle_GM6_F", 1, 1, false} //{<classname/string>, <amount/integer>, <chance/float>, <hideMissing/bool>}; <hideMissing> = same as above but in this case only this item is controlled to be missing;
				};
				results[] = {
					{"srifle_GM6_LRPS_F", 1, 1} //{<classname/string>, <amount/integer>, <chance/float>}
				};
			};
		};
	};
};
