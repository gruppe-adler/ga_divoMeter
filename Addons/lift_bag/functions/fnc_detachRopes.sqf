#include "script_component.hpp"

params ["_obj"];
_ropeArry = _obj getVariable "Grad_Liftbag_Ropes";

{
	ropeDestroy _x;
}forEach _ropeArry;
