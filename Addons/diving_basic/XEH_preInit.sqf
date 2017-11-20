#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;
diag_log str(_recomp);

ADDON = true;

GVAR(Tank) = ["B_GRAD_Diving_Tank"];
GVAR(Double) = [""];
GVAR(Vest) = ["V_GRAD_DivingVest_Rgr"];
GVAR(VestAir) = [""];
GVAR(Rebreather) = [""];


[QGVAR(METRIC), "CHECKBOX", "View Distance", "Divo Meter Settings", [], 2, {}] call CBA_Settings_fnc_init;
