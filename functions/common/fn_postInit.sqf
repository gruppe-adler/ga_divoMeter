if (!hasInterface) exitWith {};

["GRAD Enhanced Diving", "ed_diveComputer_key", "Diving Computer Toggle", {
    // Conditions: canInteract
    //if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (!('GRAD_DivingComputer' in assignedItems player)) exitWith {false};
    if !(EDOPEN) then {
        [] call grad_enhancedDiving_fnc_watchDisplay;
    } else {
      [] call grad_enhancedDiving_fnc_closeWatch;
    };
    true
}, {false}, [24, [false, false, false]], false] call CBA_fnc_addKeybind;

/*
["GRAD Enhanced Diving", "ed_asending_key", "Emergency Asent", {
  if (eyePos player select 2 < 0) then {
      [] call grad_enhancedDiving_fnc_emergencyAsent;
  };
}, {false}, [DIK_T, [true, true, false]], false] call CBA_fnc_addKeybind;
*/
