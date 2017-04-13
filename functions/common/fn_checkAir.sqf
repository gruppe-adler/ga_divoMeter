params ["_bool", "_obj"];

if (_bool) then {
	_value = _obj getVariable "Air";
	if (isNil "_value")then {
		_class = 7;
		_size = 3000;
		
		switch (_class) do {		
			case 0 : {	_o2 = 0.21; 	_n2 = 0.79; 	_he = 0;};			//Air
			case 1 : { 	_o2 = 0.32;		_n2 = 0.68; 	_he = 0;};			//EAN32
			case 2 : { 	_o2 = 0.21; 	_n2 = 0.79; 	_he = 0;};			//Heliox 21
			case 3 : { 	_o2 = 0.28; 	_n2 = 0.72; 	_he = 0;};			//Heliox 28
			case 4 : { 	_o2 = 0.32; 	_n2 = 0.68; 	_he = 0;};			//Nitrox I
			case 5 : { 	_o2 = 0.36; 	_n2 = 0.64; 	_he = 0;};			//Nitrox II
			case 6 : { 	_o2 = 1; 		_n2 = 0; 		_he = 0;};			//Oxygen
			case 7 : { 	_o2 = 0.10; 	_n2 = 0.40; 	_he = 0.50;};		//Trimax
			case 8 : {	_o2 = 0.15; 	_n2 = 0.30; 	_he = 0.55;};		//Trimax 15/55
		};
	  _psi = _size;
	  _obj setVariable ["Air", [_size, _psi, _o2, _n2, _he]];
	  DIVOMETERGEARON = true;
	};
}else{
	DIVOMETERGEARON = false;
};
