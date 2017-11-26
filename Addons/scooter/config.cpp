#include "script_component.hpp"

class CfgPatches
{
	class Test_boat_F
	{
		units[]=
		{
			"GA_Underwater_Scooter"
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Boat_F",
			"A3_Boat_F_Civilian_Boat"
		};
	};
};

#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"
#include "CfgEventHandlers.hpp"
