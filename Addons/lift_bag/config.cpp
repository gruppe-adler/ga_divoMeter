#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Structures_F_Items", "grad_enhancedDiving_main"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
    authors[] = {"Salbei"};
	};
};

#include "CfgEventHandlers.hpp"
