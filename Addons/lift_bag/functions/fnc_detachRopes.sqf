#include "script_component.hpp"

params ["_obj"];
_ropeArray = _obj getVariable "Grad_Liftbag_Ropes";

{
	ropeDestroy _x;
}forEach _ropeArray;
