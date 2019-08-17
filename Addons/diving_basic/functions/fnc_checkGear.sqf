#include "script_component.hpp"

private _typeOf = objNull;
private _container = objNull;

if (backpack ace_player in GVAR(Tank) || backpack ace_player in GVAR(Double)) then {
    _typeOf = backpack ace_player;
    _container = backpackContainer ace_player;
};

if (vest ace_player in GVAR(Rebreather)) then {
    _typeOf = vest ace_player;
    _container = vestContainer ace_player;
};

if (isNull _typeOf ||{isNull _container}) exitWith {};

private _value = _container getVariable (format [QGVAR(Dive_Gas%1), GVAR(selectedTank)]);
if (isNil "_value") exitWith {diag_log "ED: No values found";};
_value params ["_bar", "_percentO2", "_percentN2", "_percentHe"];

//Check if gear has valid percentages for breathing gas
if ((_percentO2 +_percentN2 +_percentHe) != 1) exitWith {
    systemChat "ED: Error in init argument: Sum of breathing gasses should equal 1";
    systemChat format ["ED: O2 percentage: %1, N2 percentage: %2, HE percentage: %3", _percentO2, _percentN2, _percentHe];
};

if (_percentO2 < 0.09) exitWith {systemChat format ["ED: Error in init argument: You need at least 9% O2 in your tank. O2 percentage = %1", _percentO2];};

//Setting the global Variables
GVAR(bar) = _bar;
GVAR(percentO2) = _percentO2;
GVAR(percentN2) = _percentN2;
GVAR(percentHe) = _percentHe;

GVAR(maxBar) = getNumber (configFile >> "CfgVehicles" >> _typeOf >> (format [QGVAR(maxBar%1), GVAR(selectedTank)]));
GVAR(filling) = (getNumber (configFile >> "CfgVehicles" >> _typeOf >> (format [QGVAR(tankSize%1), GVAR(selectedTank)]))) * GVAR(bar);

diag_log format ["Bar: %1, MaxBar: %2, O2: %3, N2: %4, He: %5, Filling: %6", GVAR(bar), GVAR(maxBar), GVAR(percentO2), GVAR(percentN2), GVAR(percentHe), GVAR(filling)];
