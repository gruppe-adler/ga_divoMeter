["EDMETRIC", "CHECKBOX", "View Distance", "Divo Meter Settings", [], 2, {}] call CBA_Settings_fnc_init;

["GRAD Enhanced Diving","show_asending_key", "Emergency Asent", {[] call grad_enhancedDiving_fnc_emergencyAsent;}, "", [DIK_T, [true, true, false]]] call CBA_fnc_addKeybind;
