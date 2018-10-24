#include "script_component.hpp"

params ["_bool", "_class", "_tank"];

private _obj = Nil;
private _objTank = "";

private _container = (QGVAR(DIVE_GAS) + (format ["%1", _tank]));
private _barName = (QGVAR(maxBar) + (format ["%1", _tank]));

private _value = (backpackContainer player) getVariable _container;
if (isNil "_value") then {
	_value = (vestContainer player) getVariable _container;
	if (isNil "_value") then {
		_obj = (vestContainer player);
		_objTank = (vest player);
	};
}else {
	_obj = (backpackContainer player);
	_objTank = (backpack player);
};

_value params ["_barTank", "_o2Perc", "_n2Perc", "_hePerc"];
GVAR(refill_barTank) = _barTank;
GVAR(refill_o2Perc) = _o2Perc;
GVAR(refill_n2Perc) = _n2Perc;
GVAR(refill_hePerc) = _hePerc;

private _maxBar = getNumber (configFile >> "CfgVehicles" >> _objTank >> _barName);

if (_bool) then {
	[{
		params ["_args","_handle"];
		_args params ["_obj", "_container", "_maxBar"];
		if (GVAR(refill_barTank) == _maxBar) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_obj setVariable [_container, [GVAR(refill_barTank), GVAR(refill_o2Perc), GVAR(refill_n2Perc), GVAR(refill_hePerc)]];
		}else {
			if(GVAR(refill_barTank) > _maxBar) then {
				GVAR(refill_barTank) = _maxBar;
			}else {
				GVAR(refill_barTank) = GVAR(refill_barTank) + GVAR(refillRate);
			};
		};
	}, 1, [_obj, _container, _maxBar]] call CBA_fnc_addPerFrameHandler;

}else {
	if (GVAR(refill_barTank) > 0) then {
		[{
			params ["_args","_handle"];
			_args params ["_obj", "_container", "_maxBar"];
			if (GVAR(refill_barTank) == 0) exitWith {
				[_handle] call CBA_fnc_removePerFrameHandler;
				_obj setVariable [_container, [GVAR(refill_barTank), GVAR(refill_o2Perc), GVAR(refill_n2Perc), GVAR(refill_hePerc)]];
			}else {
				if(GVAR(refill_barTank) < 0) then {
					GVAR(refill_barTank) = 0;
				}else {
					GVAR(refill_barTank) = GVAR(refill_barTank) - GVAR(refillRate);
				};
			};
		}, 1, [_obj, _container, _maxBar]] call CBA_fnc_addPerFrameHandler;
	};

	switch (_class) do {
		case 0 	: {GVAR(refill_o2) = 0.21; 	GVAR(refill_n2) = 0.79; 	GVAR(refill_he) = 0;};		//Air
		case 1 	: {GVAR(refill_o2) = 0.32;	GVAR(refill_n2) = 0.68; 	GVAR(refill_he) = 0;};		//EAN32
		case 2 	: {GVAR(refill_o2) = 0.21; 	GVAR(refill_n2) = 0; 		GVAR(refill_he) = 0.79;};	//Heliox 21
		case 3 	: {GVAR(refill_o2) = 0.28; 	GVAR(refill_n2) = 0; 		GVAR(refill_he) = 0.72;};	//Heliox 28
		case 4 	: {GVAR(refill_o2) = 0.26; 	GVAR(refill_n2) = 0.57; 	GVAR(refill_he) = 0.17;};	//Helitrox
		case 5	: {GVAR(refill_o2) = 0.10; 	GVAR(refill_n2) = 0.50; 	GVAR(refill_he) = 0.40;};	//Hypoxic
		case 6 	: {GVAR(refill_o2) = 0.32; 	GVAR(refill_n2) = 0.68; 	GVAR(refill_he) = 0;};		//Nitrox I
		case 7 	: {GVAR(refill_o2) = 0.36; 	GVAR(refill_n2) = 0.64; 	GVAR(refill_he) = 0;};		//Nitrox II
		case 8	: {GVAR(refill_o2) = 0.19; 	GVAR(refill_n2) = 0.30; 	GVAR(refill_he) = 0.51;};	//Normoxic
		case 9 	: {GVAR(refill_o2) = 1; 	GVAR(refill_n2) = 0; 		GVAR(refill_he) = 0;};		//Oxygen
		case 10	: {GVAR(refill_o2) = 0.10; 	GVAR(refill_n2) = 0.40; 	GVAR(refill_he) = 0.50;};	//Trimax
		case 11	: {GVAR(refill_o2) = 0.15; 	GVAR(refill_n2) = 0.30; 	GVAR(refill_he) = 0.55;};	//Trimax 15/55
	};

	[{
		params ["_args","_handle"];
		_args params ["_obj", "_container", "_maxBar"];
		if (GVAR(refill_barTank) == _maxBar) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_obj setVariable [_container, [GVAR(refill_barTank), GVAR(refill_o2Perc), GVAR(refill_n2Perc), GVAR(refill_hePerc)]];
		}else {
			if(GVAR(refill_barTank) > _maxBar) then {
				GVAR(refill_barTank) = _maxBar;
			}else {
				GVAR(refill_barTank) = GVAR(refill_barTank) + GVAR(refillRate);
			};
		};
	}, 1, [_obj, _container, _maxBar]] call CBA_fnc_addPerFrameHandler;
};
