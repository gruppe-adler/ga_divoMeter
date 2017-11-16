diag_log "Called CheckGear";

_container = format ["GVAR(DIVE_GAS%1)", GVAR(selectedTank)]; 
_value = (backpackContainer player) getVariable _container;
if (isNil "_value") then {
	diag_log "ED: No diving backpack found, falling back to vest.";
	_value = (vestContainer player) getVariable _container;
};
if (isNil "_value") exitWith {diag_log "ED: No values found";};

_value params ["_bar", "_percentO2", "_percentN2", "_percentHe"];

//Check if gear has valid percentages for breathing gas
if ((_percentO2 +_percentN2 +_percentHe) != 1) exitWith {
	systemChat "DM: Error in init argument: Sum of breathing gasses should equal 1"; 
	systemChat format ["DM: O2 percentage: %1, N2 percentage: %2, HE percentage: %3", _percentO2, _percentN2, _percentHe];
};

if (_percentO2 < 0.09) exitWith {systemChat format ["DM: Error in init argument: You need at least 9% O2 in your tank. O2 percentage = %1", _percentO2];};

diag_log format ["CHECKGEAR: %1", _value];
_value;