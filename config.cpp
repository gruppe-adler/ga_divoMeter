class CfgPatches {
	class ga_rebreatherOnLand {

		name = "GA Diving Mod";
		author = "Salbei";

		requiredVersion = 1.0;
		requiredAddons[] = {"ace_main"};

		units[] = {"ga_divoMeter_params"};
		weapons[] = {};
	};
};

#include "functions\cfgFunctions.hpp"
#include "dialog\define.hpp"
#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"
#include "defines.hpp"

class RscTitles {
	#include "dialog\display.hpp"
};
