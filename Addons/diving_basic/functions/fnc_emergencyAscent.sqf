#include "script_component.hpp"

player setMass 1;

[{eyePos player select 2 > 0},{player setMass 0;},[]] call CBA_fnc_waitUntilAndExecute;
