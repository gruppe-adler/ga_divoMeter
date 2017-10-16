params ["_level"];

_mass = getMass player;

if (_level) then {
	if (_mass >= 10) then {
		player setMass [(_mass + 0.1),0.5];
	}else{
		hint "Maximum Air in Vest";
	};
}else{
	if (_mass <= -10) then {
		player setMass [(_mass - 0.1),0.5];
	}else{
		hint "Minimum Air in Vest";
	};
};