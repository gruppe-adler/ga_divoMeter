#include "script_component.hpp"
params ["_bool", "_obj", "_container"];

if (_bool) then {
	if ((vest player) in GVAR(DIVINGVEST)) exitWith {GVAR(ON) = false; systemChat "Please put on a Diving Vest!"; removeBackpack player};
	_value = _container getVariable "GVAR(DIVE_GAS1";
	_upperClass = "CfgWeapons";

	if (isNil "_value")then {
		_bar = 0;
		_class = getNumber (configFile >> _upperClass >> _obj >> "GVAR(gasClass1)");
		_bar = getNumber (configFile >> _upperClass >> _obj >> "GVAR(maxBar1)");
		_o2 = -1;
		_n2 = -1;
		_he = -1;

		switch (_class) do {
			case 0 	: { _o2 = 0.21; 	_n2 = 0.79; 	_he = 0;};		//Air
			case 1 	: { _o2 = 0.32;		_n2 = 0.68; 	_he = 0;};		//EAN32
			case 2 	: { _o2 = 0.21; 	_n2 = 0; 		_he = 0.79;};	//Heliox 21
			case 3 	: { _o2 = 0.28; 	_n2 = 0; 		_he = 0.72;};	//Heliox 28
			case 4 	: { _o2 = 0.26; 	_n2 = 0.57; 	_he = 0.17;};	//Helitrox
			case 5	: { _o2 = 0.10; 	_n2 = 0.50; 	_he = 0.40;};	//Hypoxic
			case 6 	: { _o2 = 0.32; 	_n2 = 0.68; 	_he = 0;};		//Nitrox I
			case 7 	: { _o2 = 0.36; 	_n2 = 0.64; 	_he = 0;};		//Nitrox II
			case 8	: { _o2 = 0.19; 	_n2 = 0.30; 	_he = 0.51;};	//Normoxic
			case 9 	: { _o2 = 1; 		_n2 = 0; 		_he = 0;};		//Oxygen
			case 10	: { _o2 = 0.10; 	_n2 = 0.40; 	_he = 0.50;};	//Trimax
			case 11	: { _o2 = 0.15; 	_n2 = 0.30; 	_he = 0.55;};	//Trimax 15/55
		};

		diag_log format ["ED: Class: %1, Bar: %2, O2: %3, N2: %4, HE:%5", _class, _bar, _o2, _n2, _he];

	  _container setVariable ["GVAR(DIVE_GAS1)", [_bar, _o2, _n2, _he]];
	};

	GVAR(ON) = true;

	if ((_obj in GVAR(DIVINGDOUBLE)) && GVAR(ON)) then {
		_value = _obj getVariable "GVAR(DIVE_GAS2)";
		if (isNil "_value")then {
			_bar = 0;
			_class = getNumber (configFile >> _upperClass >> _obj >> "GVAR(gasClass2)");
			_bar = getNumber (configFile >> _upperClass >> _obj >> "GVAR(maxBar2)");
			_o2 = -1;
			_n2 = -1;
			_he = -1;

			switch (_class) do {
				case 0 	: {_o2 = 0.21; 	_n2 = 0.79; 	_he = 0;};		//Air
				case 1 	: {_o2 = 0.32;	_n2 = 0.68; 	_he = 0;};		//EAN32
				case 2 	: {_o2 = 0.21; 	_n2 = 0; 		_he = 0.79;};	//Heliox 21
				case 3 	: {_o2 = 0.28; 	_n2 = 0; 		_he = 0.72;};	//Heliox 28
				case 4 	: {_o2 = 0.26; 	_n2 = 0.57; 	_he = 0.17;};	//Helitrox
				case 5	: {_o2 = 0.10; 	_n2 = 0.50; 	_he = 0.40;};	//Hypoxic
				case 6 	: {_o2 = 0.32; 	_n2 = 0.68; 	_he = 0;};		//Nitrox I
				case 7 	: {_o2 = 0.36; 	_n2 = 0.64; 	_he = 0;};		//Nitrox II
				case 8	: {_o2 = 0.19; 	_n2 = 0.30; 	_he = 0.51;};	//Normoxic
				case 9 	: {_o2 = 1; 	_n2 = 0; 		_he = 0;};		//Oxygen
				case 10	: {_o2 = 0.10; 	_n2 = 0.40; 	_he = 0.50;};	//Trimax
				case 11	: {_o2 = 0.15; 	_n2 = 0.30; 	_he = 0.55;};	//Trimax 15/55
			};

		  _obj setVariable ["GVAR(DIVE_GAS2)", [_bar, _o2, _n2, _he]];
		};
	};

}else{
	GVAR(ON) = false;
};
