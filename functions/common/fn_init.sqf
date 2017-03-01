DIVOMETEROPEN = false;
player addEventHandler ["TAKE", {if (_this select 2 in DIVINGGEAR) then {[true, (_this select 2)] call dm_fnc_checkAir}];
player addEventHandler ["PUT", {if (_this select 2 in DIVINGGEAR) then {[false, (_this select 2)] call dm_fnc_checkAir}}];