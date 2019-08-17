#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(Tank) = ["B_GRAD_Diving_Tank"];
GVAR(Double) = [];
GVAR(Rebreather) = ["V_GRAD_Rebreather"];

[QGVAR(METRIC), "CHECKBOX", "Use Metric Units", "Divo Meter Settings", true, 2, {}] call CBA_Settings_fnc_init;
