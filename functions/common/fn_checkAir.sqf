params ["_bool", "_obj"];

if (_bool) then {
	_value = _obj getVariable "Air";
	if (isNil "_value")then {
		_class = 1;
		_size = 3000;
		
		switch (_class) do {		
			case 0 : { _air = 0.32; _n2 = 0.68; _he = 0;};			//EAN32
			case 1 : { _air = 0.15; _n2 = 0.30; _he = 0.55;};		//TRIMIX 15/55
			default : {_air = 0.21; _n2 = 0.79; _he = 0;};			//O2
	  };
	  _psi = _size;
	  _obj setVariable ["Air", [_size, _psi, _air, _n2, _he]];
	};

	_sacRT = 25;
	_maxppO = 1.1;
	_tempC = 20;

	[_sacRT, _maxppO, _tempC] call ga_divoMeter_fnc_divometer;
}else{
	_value = _obj getVariable "Air";
	_value params ["_size", "_psi", "_air", "_n2", "_he"];
	_psi = PSI;
	_obj setVariable ["Air", [_size, _psi, _air, _n2, _he]];
};