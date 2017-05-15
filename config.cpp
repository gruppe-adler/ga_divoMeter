class CfgPatches {
	class grad_rebreatherOnLand {

		name = "GRAD Diving Mod";
		author = "Salbei";

		requiredVersion = 1.0;
		requiredAddons[] = {"ace_main"};

		units[] = {"grad_divoMeter_params"};
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
