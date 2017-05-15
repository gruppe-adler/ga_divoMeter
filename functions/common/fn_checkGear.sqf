diag_log "Called CheckGear";

_container = (format ["SLB_DIVE_Gas%1", slb_selectedTank]; 
_value = (backpackContainer player) getVariable _container;
if (isNil "_value") then {_value = (vestContainer player) getVariable _container;};
if (isNil "_value") exitWith {};

_value params [ "_tankSize", "_bar", "_percentO2", "_percentN2", "_percentHe"];

//Check if gear has valid percentages for breathing gas
if ((_percentO2 +_percentN2 +_percentHe) != 1) exitWith {
	systemChat "Error in init argument: Sum of breathing gasses should equal 1"; 
	systemChat format ["O2 percentage: %1, N2 percentage: %2, HE percentage: %3", _percentO2, _percentN2, _percentHe];
};

if (_percentO2 < 0.09) exitWith {systemChat format ["Error in init argument: You need at least 9% O2 in your tank. O2 percentage = %1", _percentO2];};

diag_log format ["CHECKGEAR: %1", _value];
_value;