#include "script_component.hpp"

if (!hasInterface) exitWith {};

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["GRAD Enhanced Diving", QGVAR(diveComputer), "Diving Computer Toggle", {
    // Conditions: canInteract
    //if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (!('GVAR(DivingComputer)' in assignedItems player)) exitWith {false};
    if !(GVAR(Open)) then {
        [] call FUNC(watchDisplay);
    } else {
      [] call FUNC(closeWatch);
    };
    true
}, {false}, [DIK_O, [false, false, false]], false] call CBA_fnc_addKeybind;


["GRAD Enhanced Diving", QGVAR(asending), "Emergency Asent", {
  if (eyePos player select 2 < 0) then {
      [] call FUNC(emergencyAsent);
  };
}, {false}, [DIK_T, [true, true, false]], false] call CBA_fnc_addKeybind;
