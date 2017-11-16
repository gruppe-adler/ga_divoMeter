if (!hasInterface) exitWith {};

["GRAD Enhanced Diving", "ed_diveComputer_key", "Diving Computer Toggle", {
    // Conditions: canInteract
    //if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (!('GVAR(DivingComputer)' in assignedItems player)) exitWith {false};
    if !(GVAR(OPEN)) then {
        [] call FUNC(watchDisplay);
    } else {
      [] call FUNC(closeWatch);
    };
    true
}, {false}, [24, [false, false, false]], false] call CBA_fnc_addKeybind;

/*
["GRAD Enhanced Diving", "ed_asending_key", "Emergency Asent", {
  if (eyePos player select 2 < 0) then {
      [] call FUNC(emergencyAsent);
  };
}, {false}, [DIK_T, [true, true, false]], false] call CBA_fnc_addKeybind;
*/
