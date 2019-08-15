#include "script_component.hpp"

params ["_ballon", "_damage"];

if (isNil "_ballon") exitWith {};

_source = "#particlesource" createVehicle (getPos _ballon);
_source setParticleParams [
["\A3\data_f\ParticleEffects\Universal\Universal",16,13,7,0] ,"",
"Billboard",
1,
50,
[0,0,0],
[0,0,1],
0, 1, 1, 15,
[0.05 * 1],
[[1,1,1,-2]],
[1000],
0.12,
0.045,
"",
"",
""
                    ];

// RANDOM / TOLERANCE PARAMS
_source setParticleRandom [
    10,                            //LifeTime
    [0,0,0],                    //Position
    [0,0,0],                    //MoveVelocity
    0,                            //rotationVel
    0.005,                        //Scale
    [0,0,0,1],                    //Color
    0.003,                        //randDirPeriod
    0                        //randDirIntesity
];

_source setDropInterval (0.01 * (1.1 - _damage));
[
    {
        deleteVehicle _this;
    },
    _source,
    10
] call CBA_fnc_waitAndExecute;
