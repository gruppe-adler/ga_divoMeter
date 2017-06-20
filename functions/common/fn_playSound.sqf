[{
	params ["_args","_handle"];
	if !(alive player) then {[_handle] call CBA_fnc_removePerFrameHandler;};
	if (((eyePos player select 2) < 0) && EDGEARON) then {
		_audio = selectRandom ["sounds\grad_diverBreathing.ogg"];
		playSound3D [_audio, player, false, getPos player, 1, 1, 5];
		diag_log format ["ED: Playing Audio %1", _audio];
	};
}, 1, []] call CBA_fnc_addPerFrameHandler;