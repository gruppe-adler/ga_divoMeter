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

#include "defines.hpp"
#include "functions\cfgFunctions.hpp"
#include "dialog\define.hpp"
#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"

class RscTitles {
	#include "dialog\display.hpp"
};
