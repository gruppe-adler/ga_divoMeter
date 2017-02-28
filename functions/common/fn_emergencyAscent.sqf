[{
	params ["", "_handel"];
	_veloPlayer = ((velocity player) select 2);
	if ((_veloPlayer) <= 12) then {
		_veloPlayer = _veloPlayer +1;
		player setVelocity [0, 0, _veloPlayer];
	}else {
		player setVelocity [0, 0, 12];
	};
	if (((eyePos player) select 2) < 0) then {[_handle] call CBA_fnc_removePerFrameHandler;};
}, 0, []] call CBA_fnc_addPerFrameHandler;

[{(((eyePos player) select 2) < 0)},{if (((getPosASL player) select 2) >= 30) then {[true, true, (1-(1.25 *1.25))]call ga_divoMeter_fnc_DCSEffects.sqf;}}, []] call CBA_fnc_waitAndExecute;