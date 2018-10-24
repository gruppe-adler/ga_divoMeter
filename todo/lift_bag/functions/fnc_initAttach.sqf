#include "script_component.hpp"

params ["_hookedObj"];

_ballonTyp = "";
_attachedLifter = [];

{
	if (!(_x == _balloon) && ((typeOf _x) == (typeOf _balloon))) then {
		diag_log format ["ED: Objekt %1, TypObj: %2, Attached: %3, TypAt %4", _hookedObj, typeOf _hookedObj, _x, typeOf _x];
		_attachedLifter pushBack _x;
	};
} forEach attachedObjects _hookedObj;

if ((count _attachedLifter) > 3) exitWith{
	diag_log format ["ED: To many attached Objekts(%1), for %2!", count _attachedLifter, _hookedObj];
	 hint "To many attached Objekts!";
 };

switch (count _attachedLifter) do {
	case 0 : {_ballonTyp = "GA_Lift_Bag";};
	case 1 : {_ballonTyp = "grad_liftbag_D";};
	case 2 : {_ballonTyp = "grad_liftbag_T";};
	case 3 : {_ballonTyp = "grad_liftbag_Q";};
};

_balloon = _ballonTyp createVehicle [_pos select 0, _pos select 1, ((_pos select 2) +2)];
_balloon setDir (getDir _hookedObj);
_balloon setPos [_pos select 0, _pos select 1, ((_pos select 2) +2)];

_balloon addEventHandler ["Hit",
	{
		diag_log format ["ED: Objekt hit: %1 from %2, causing %3DMG, done by %4", _this select 0, _this select 1, _this select 2, _this select 3];
		[_balloon, _this select 2];
	}
];

_slingMemPoints = getArray (configFile >> "CfgVehicles" >> _hookedObj >> "slingLoadCargoMemoryPoints");
_slingMemPoints params ["_attachPoint1", "_attachPoint2", "_attachPoint3", "_attachPoint4"];

_myRope1 = ropeCreate [_balloon, "Attach_Point_D_1", _hookedObj, _attachPoint1];
_myRope2 = ropeCreate [_balloon, "Attach_Point_D_1", _hookedObj, _attachPoint2];
_myRope3 = ropeCreate [_balloon, "Attach_Point_D_2", _hookedObj, _attachPoint3];
_myRope4 = ropeCreate [_balloon, "Attach_Point_D_2", _hookedObj, _attachPoint4];
_hookedObj setVariable ["Grad_Liftbag_Ropes", [_myRope1, _myRope2, _myRope3, _myRope4]];

_massB = getMass _balloon;
_massO = getMass _hookedObj;

if (_massO >= (1000*(1+(count _attachedLifter)))) exitWith{};

_balloon setMass [0,2];

[{((getPosASLW _balloon select 2) >= 0.1)},{
	params ["_balloon", "_mass"];
	_balloon setMass [_mass, 0];
},[_balloon, _massB]] call CBA_fnc_waitUntilAndExecute;
