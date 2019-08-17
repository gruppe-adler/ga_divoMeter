#include "script_component.hpp"

ace_player setMass 1;

[{eyePos ace_player select 2 > 0},{ace_player setMass 0;},[]] call CBA_fnc_waitUntilAndExecute;
