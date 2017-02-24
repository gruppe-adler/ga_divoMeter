player addEventHandler ["TAKE", {if (_this select 2 in DIVINGGEAR) then {[] call dm_fnc_checkAir}];
player addEventHandler ["PUT", {if (_this select 2 in DIVINGGEAR) then {[] call dm_fnc_checkAir}}];