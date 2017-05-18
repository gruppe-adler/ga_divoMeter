_can = "Land_CanOpener_F" createVehicle [0,0,0];
_can disableCollisionWith player;
_can setMass 10;
_can setVelocity [0,0,0];
_can setdir (direction player);
_can setpos getpos player;
sleep .1;
player attachTo [_can, [0,0,0]];


[{
	params ["_args", "_handle"];
	_args params ["_can"];
	
	if !(underwater player) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler; 
		_can setVelocity [0,0,0];
		player setVelocity [0,0,0]; 
		sleep .3; 
		deletevehicle _can;
	};
	
	diag_log format ["Asending: %1, VeloP: %2, VeloC", underwater player, velocity player, velocity _can];
	if (((velocity player) select 2) < 30) then {
		_can setVelocity [0, 0, (((velocity player) select 2) +1)];
	}else {
		_can setVelocity [0, 0, 30];
	};
	
}, 0, [_can]] call CBA_fnc_addPerFrameHandler;

