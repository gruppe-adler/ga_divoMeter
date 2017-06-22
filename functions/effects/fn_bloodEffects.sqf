
/*
	Function: TAG_fnc_BLOOD
	Author: BIS, HallyG
	SPAWNS BLOODY BLOOD
	
	Arguments(s):
	0: Emitter Position <OBJECT, POSITION>
	1: Damage, 0 -1. Large numbers produce lots of particles   (default: 0.2) <NUMBER>
	2: Bullet speed (default: 10) <NUMBER>
	2: Surface Normal (default: [0,0,0]) <ARRAY>
	3: Bullet Direction (default: [0,0,5]) <ARRAY>
	
	Return Value:
	Emitter <OBJECT>
		
	Example:
	[
		player,
		0.1, 10,
		[0,0,0],
		[0,0,10]
	] call TAG_fnc_BLOOD
__________________________________________________________________*/
params [ 
	["_position", [0,0,0], [[], objNull]],
	["_damage", 0.2, [0]],
	["_bulletSpeed", 10, [0]],
	["_surfaceNormal", [0,0,0], [[]], [3]],
	["_bulletDirection", [0,0,5], [[]], [3]]
]; 
_bulletDirection params ["_bulletDirectionX", "_bulletDirectionY", "_bulletDirectionZ"]; 
_surfaceNormal params ["_surfaceNormalX", "_surfaceNormalY", "_surfaceNormalZ"]; 
	
_position = _position call {
	if (_this isEqualType objNull) exitWith {getPosATL _this};
	_this
};

_damage = (_damage min 1) max 0;
_source = "#particlesource" createVehicleLocal _position;
_source setPosATL _position;

_source setParticleParams [
	[
		"\A3\data_f\ParticleEffects\Universal\Universal",
		16,
		13,
		1,
		0
	],
	"",
	"Billboard",
	1,
	3,
	[0,0,0],
	[
		(- (_bulletDirectionX * 2 - _surfaceNormalX / 4) * _bulletSpeed / 200) * (_damage + 0.2),
		(- (_bulletDirectionY * 2 - _surfaceNormalY / 4) * _bulletSpeed / 200) * (_damage + 0.2),
		(- (_bulletDirectionZ * 2 - _surfaceNormalZ / 4) * _bulletSpeed / 200) * (_damage + 0.2)
	],
	1,
	1.275,
	1,
	10,
	[0.02 + (0.06 * _damage),0.17 + (0.51 * _damage),0.23 + (0.69 * _damage), 0.27 + (0.8 * _damage),0.31 + (0.93 * _damage),0.34 + (1.01 * _damage)],
	[[1,0.8,0.8,0.5],[1,0.8,0.8,0.4],[1,0.8,0.8,0.3],[1,0.8,0.8,0.22],[1,0.8,0.8,0.16],[1,0.8,0.8,0.08],[1,0.8,0.8,0.01]],
	[0.1],
	0,
	0,
	"",
	"",
	"",
	0
];


_source setParticleRandom [ 
	4,
	[0.01, 0.01, 0.01],
	[0.5 * _damage, 0.5 * _damage, 0.5 * _damage],
	1,		
	0.02, 		
	[0,0,0,0.2], 
	0,				
	0, 
	360
];

_source setDropInterval (0.09 * (1.1 - _damage));	
_source
