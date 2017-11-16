#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"enhanced_diving_main"};
		units[] = {
			QGVAR(params)
		};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"Salbei"};
	};
};

#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"
#include "data\dialog\display.hpp"
#include "CfgEventHandlers.hpp"
