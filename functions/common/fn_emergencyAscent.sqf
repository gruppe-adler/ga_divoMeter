[{
	params ["", "_handel"];
	if (((eyePos player) select 2) < 0) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;player setVelocity [0, 0, 0];};
	_veloPlayer = ((velocity player) select 2);
	if ((_veloPlayer) <= 12) then {
		_veloPlayer = _veloPlayer +1;
		player setVelocity [0, 0, _veloPlayer];
	}else {
		player setVelocity [0, 0, 12];
	};
}, 0, []] call CBA_fnc_addPerFrameHandler;

