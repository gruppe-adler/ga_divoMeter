#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

#define GVAR(Gear)                                ["V_GRAD_DivingVest_Rgr"]
#define GVAR(Double)                              [""]
#define GVAR(Vest)			                          [""]
#define GVAR(VestAir)			                        [""]
#define GVAR(Rebreather)		                      [""]

["GVAR(METRIC)", "CHECKBOX", "View Distance", "Divo Meter Settings", [], 2, {}] call CBA_Settings_fnc_init;