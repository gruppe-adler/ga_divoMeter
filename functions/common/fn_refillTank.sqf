//Refill Gas
private ["_sizeTank", "_psiTank", "_o2Perc", "_n2Perc", "_hePerc"];
params ["_bool", "_class"];

_value = (backpackContainer player) getVariable "Air";
if (isNil "_value") then {
	_value = (vestContainer player) getVariable "Air";
	if (isNil "_value") then {_obj = (vestContainer player);};
}else {
	_obj = (backpackContainer player);
};
_value params ["_sizeTank", "_psiTank", "_o2Perc", "_n2Perc", "_hePerc"];


if (_bool) then {	
	[{
		params ["_args","_handle"]; 
		_args ["_sizeTank", "_psiTank", "_o2Perc", "_n2Perc", "_hePerc", "_obj"];
		if (_psiTank == _sizeTank) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_obj setVariable ["Air", [_sizeTank, _psiTank, _o2Perc, _n2Perc, _hePerc]];
		}else {
			if(_psiTank > _sizeTank) then {
				_psiTank = _sizeTank;
			}else {
				_psiTank = _psiTank +10;
			};
		};		
	}, 1, [_sizeTank, _psiTank, _o2Perc, _n2Perc, _hePerc, _obj]] call CBA_fnc_addPerFrameHandler;	
	
}else {	
	if (_psiTank > 0) then {
		[{
			params ["_args","_handle"]; 
			_args ["_sizeTank", "_psiTank", "_o2Perc", "_n2Perc", "_hePerc", "_obj"];
			if (_psiTank == 0) exitWith {
				[_handle] call CBA_fnc_removePerFrameHandler;
				_obj setVariable ["Air", [_sizeTank, _psi, _o2Perc, _n2Perc, _hePerc]];
			}else {
				if(_psiTank < 0) then {
					_psiTank = 0;
				}else {
					_psiTank = _psiTank -20;
				};
			};
		}, 1, [_sizeTank, _psiTank, _o2Perc, _n2Perc, _hePerc, _obj]] call CBA_fnc_addPerFrameHandler;
	};
	
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
	  
	[{
		params ["_args","_handle"]; 
		_args ["_sizeTank", "_psiTank", "_o2Perc", "_n2Perc", "_hePerc", "_obj"];
		if (_psiTank == _sizeTank) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_obj setVariable ["Air", [_sizeTank, _psiTank, _o2Perc, _n2Perc, _hePerc]];
		}else {
			if(_psiTank > _sizeTank) then {
				_psiTank = _sizeTank;
			}else {
				_psiTank = _psiTank +20;
			};
		};		
	}, 1, [_sizeTank, _psiTank, _o2Perc, _n2Perc, _hePerc, _obj]] call CBA_fnc_addPerFrameHandler;
};