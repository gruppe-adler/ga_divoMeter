#include "script_component.hpp"

_actionAttach = ["Attach Liftbag", "Attach Liftbag", "", {[(_this select 0)] call FUNC(initAttach);}, {"GA_Lift_Bag_f" in (items player)}] call ace_interact_menu_fnc_createAction;
_actionDetach = ["Detach Liftbag", "Detach Liftbag", "", {[(_this select 0)] call FUNC(detachRopes);}, {"GA_Lift_Bag" in (attachedObjects (_this select 0))}] call ace_interact_menu_fnc_createAction;

_slingList = "isClass (_x >> 'slingLoadCargoMemoryPoints')" configClasses (configFile >> "CfgVehicles");

{
	[_x , 0, ["ACE_MainActions"], _actionAttach, true] call ace_interact_menu_fnc_addActionToClass;
	[_x , 0, ["ACE_MainActions"], _actionDetach, true] call ace_interact_menu_fnc_addActionToClass;
}forEach _slingList;
