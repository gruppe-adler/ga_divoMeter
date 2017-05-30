_can = "Land_CanOpener_F" createVehicle [0,0,0];
_can disableCollisionWith player;
_can setMass 10;
_can setVelocity [0,0,0];
_can setVectorDirAndUp [vectorDir player, vectorUp player];
_can setPos (getPos player);
player attachTo [_can, [0,0,0]];
player enableStamina false;

[{
	params ["_args", "_handle"];
	_args params ["_can"];
	[player, 0, 0] call BIS_fnc_setPitchBank;
	
	if ((eyePos player select 2) > 0.1) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler; 
		_can setVelocity [0,0,0];
		deletevehicle _can;
		player enableStamina true;
	};

	if (((velocity player) select 2) < 10) then {
		_can setVelocity [0, 0, (((velocity player) select 2) + 0.25)];
	}else {
		_can setVelocity [0, 0, 10];
	};
	
}, 0, [_can]] call CBA_fnc_addPerFrameHandler;
