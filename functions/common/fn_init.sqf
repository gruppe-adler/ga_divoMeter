["EDMETRIC", "CHECKBOX", "View Distance", "Divo Meter Settings", [], 2, {}] call CBA_Settings_fnc_init;

["GRAD Enhanced Diving","show_inflate_key", "Inflate Air", {[true] call grad_enhancedDiving_fnc_buoyancy;}, "", [DIK_Q, [true, true, false]]] call CBA_fnc_addKeybind;
["GRAD Enhanced Diving","show_deflate_key", "Deflate Air", {[false] call grad_enhancedDiving_fnc_buoyancy;}, "", [DIK_Y, [true, true, false]]] call CBA_fnc_addKeybind;
["GRAD Enhanced Diving","show_asending_key", "Emergency Asent", {[] call grad_enhancedDiving_fnc_emergencyAsent;}, "", [DIK_T, [true, true, false]]] call CBA_fnc_addKeybind;
