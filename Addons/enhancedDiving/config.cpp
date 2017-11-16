#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_enhancedDiving_main"};
		units[] = {
			QGVAR(params)
		};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"Salbei"};
	};
};

#include "functions\common\defines.hpp"
#include "functions\cfgFunctions.hpp"
#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"
#include "dialog\display.hpp"
