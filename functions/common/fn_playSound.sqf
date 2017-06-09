if (((eyePos player select 2) < 0) then {
	grad_breathingSound = createSoundSource ["grad_diverBreathing", position player, [], 0];

	[{
		params ["_args","_handle"];
		if ((eyePos player select 2) >= 0) then {[_handle] call CBA_fnc_removePerFrameHandler;};
		grad_breathingSound setPosATL (getPosATL player);
	}, 0, []] call CBA_fnc_addPerFrameHandler;
}else{
	deleteVehicle grad_breathingSound;
};