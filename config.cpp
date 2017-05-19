class CfgPatches {
	class grad_rebreatherOnLand {

		name = "GRAD Enhanced Diving";
		author = "Gruppe Adler";

		requiredVersion = 1.0;
		requiredAddons[] = {"ace_main"};

		units[] = {"grad_enhancedDiving_params"};
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
