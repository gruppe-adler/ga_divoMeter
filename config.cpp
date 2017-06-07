class CfgPatches {
	class grad_enhancedDiving {

		name = "GRAD Enhanced Diving";
		author = "Gruppe Adler";

		requiredVersion = 1.0;
		requiredAddons[] = {"ace_main"};

		units[] = {"grad_enhancedDiving_params"};
		weapons[] = {};
	};
};

#include "functions\common\defines.hpp"
#include "functions\cfgFunctions.hpp"
#include "dialog\define.hpp"
#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"

class RscTitles {
	#include "dialog\display.hpp"
};

class CfgSFX
{
	class grad_diverBreathingSource
	{
		sound0[] = {"sound\grad_diverBreathing.ogg", db+0, 1.0, 10, 1, 1.5, 1.5, 1.5};  // path to addon sound
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
};
 