#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private _actionKey = (actionKeys "Watch");
private _key = if (count _actionKey == 0) then {DIK_O} else {_actionKey select 0};

["GRAD Enhanced Diving", QGVAR(diveComputer), "Diving Computer Toggle", {
    // Conditions: canInteract
    if !([ACE_ace_player, objNull, ["isNotEscorting", "isNotInside"]] call ace_common_canInteractWith) exitWith {false};

    if !("GRAD_DivingComputer" in assignedItems ace_player) exitWith {false};
    if !(GVAR(Open)) then {
        [] call FUNC(watchDisplay);
    } else {
        [] call FUNC(closeWatch);
    };
    true
}, {false}, [_key, [false, false, false]], false] call CBA_fnc_addKeybind;

/*
["GRAD Enhanced Diving", QGVAR(asending), "Emergency Asent", {
  if (eyePos ace_player select 2 < 0) then {
      [] call FUNC(emergencyAsent);
  };
}, {false}, [DIK_T, [true, true, false]], false] call CBA_fnc_addKeybind;
*/
