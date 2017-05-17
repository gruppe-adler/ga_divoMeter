params ["_bool", "_obj"];

diag_log format ["DM Objekt: %1, Bool: %2", _obj, _bool];

if (_bool) then {
	_value = _obj getVariable "GRAD_DIVE_GAS1";
	if (isNil "_value")then {
		_class = getNumber (configFile >> "CfgVehicles" >> _obj >> "grad_divoMeter_gasClass1");
		_bar = getNumber (configFile >> "CfgVehicles" >> _obj >> "grad_divometer_maxBar1");
		
		diag_log format
		
		switch (_class) do {		
			case 0 	: {grad_refill_o2 = 0.21; 	grad_refill_n2 = 0.79; 	grad_refill_he = 0;};		//Air
			case 1 	: {grad_refill_o2 = 0.32;	grad_refill_n2 = 0.68; 	grad_refill_he = 0;};		//EAN32
			case 2 	: {grad_refill_o2 = 0.21; 	grad_refill_n2 = 0; 	grad_refill_he = 0.79;};	//Heliox 21
			case 3 	: {grad_refill_o2 = 0.28; 	grad_refill_n2 = 0; 	grad_refill_he = 0.72;};	//Heliox 28
			case 4 	: {grad_refill_o2 = 0.26; 	grad_refill_n2 = 0.57; 	grad_refill_he = 0.17;};	//Helitrox
			case 5	:{grad_refill_o2 = 0.10; 	grad_refill_n2 = 0.50; 	grad_refill_he = 0.40;};	//Hypoxic
			case 6 	: {grad_refill_o2 = 0.32; 	grad_refill_n2 = 0.68; 	grad_refill_he = 0;};		//Nitrox I
			case 7 	: {grad_refill_o2 = 0.36; 	grad_refill_n2 = 0.64; 	grad_refill_he = 0;};		//Nitrox II 
			case 8	: {grad_refill_o2 = 0.19; 	grad_refill_n2 = 0.30; 	grad_refill_he = 0.51;};	//Normoxic
			case 9 	: {grad_refill_o2 = 1; 		grad_refill_n2 = 0; 	grad_refill_he = 0;};		//Oxygen
			case 10	: {grad_refill_o2 = 0.10; 	grad_refill_n2 = 0.40; 	grad_refill_he = 0.50;};	//Trimax
			case 11	: {grad_refill_o2 = 0.15; 	grad_refill_n2 = 0.30; 	grad_refill_he = 0.55;};	//Trimax 15/55
		}; 
		
	  _obj setVariable ["GRAD_DIVE_GAS1", [_bar, _o2, _n2, _he]];
	  DIVOMETERGEARON = true;
	};
	
	if (_obj in DIVOMETERDOUBLE) then {
		_value = _obj getVariable "GRAD_DIVE_GAS2";
		if (isNil "_value")then {
			_class = getNumber (configFile >> "CfgVehicles" >> _obj >> "grad_divoMeter_gasClass2");
			_bar = getNumber (configFile >> "CfgVehicles" >> _obj >> "grad_divometer_maxBar2");
			
			switch (_class) do {		
				case 0 	: {grad_refill_o2 = 0.21; 	grad_refill_n2 = 0.79; 	grad_refill_he = 0;};		//Air
				case 1 	: {grad_refill_o2 = 0.32;	grad_refill_n2 = 0.68; 	grad_refill_he = 0;};		//EAN32
				case 2 	: {grad_refill_o2 = 0.21; 	grad_refill_n2 = 0; 	grad_refill_he = 0.79;};	//Heliox 21
				case 3 	: {grad_refill_o2 = 0.28; 	grad_refill_n2 = 0; 	grad_refill_he = 0.72;};	//Heliox 28
				case 4 	: {grad_refill_o2 = 0.26; 	grad_refill_n2 = 0.57; 	grad_refill_he = 0.17;};	//Helitrox
				case 5	:{grad_refill_o2 = 0.10; 	grad_refill_n2 = 0.50; 	grad_refill_he = 0.40;};	//Hypoxic
				case 6 	: {grad_refill_o2 = 0.32; 	grad_refill_n2 = 0.68; 	grad_refill_he = 0;};		//Nitrox I
				case 7 	: {grad_refill_o2 = 0.36; 	grad_refill_n2 = 0.64; 	grad_refill_he = 0;};		//Nitrox II 
				case 8	: {grad_refill_o2 = 0.19; 	grad_refill_n2 = 0.30; 	grad_refill_he = 0.51;};	//Normoxic
				case 9 	: {grad_refill_o2 = 1; 		grad_refill_n2 = 0; 	grad_refill_he = 0;};		//Oxygen
				case 10	: {grad_refill_o2 = 0.10; 	grad_refill_n2 = 0.40; 	grad_refill_he = 0.50;};	//Trimax
				case 11	: {grad_refill_o2 = 0.15; 	grad_refill_n2 = 0.30; 	grad_refill_he = 0.55;};	//Trimax 15/55
			}; 
		  _obj setVariable ["GRAD_DIVE_GAS2", [_bar, _o2, _n2, _he]];
		};
	};
}else{
	DIVOMETERGEARON = false;
};
