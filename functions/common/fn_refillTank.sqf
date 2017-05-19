private ["_obj", "_container"];
params ["_bool", "_class", "_tank"];

_container = format ["GRAD_DIVE_GAS%1", _tank];
_barName = format ["grad_enhancedDiving_maxBar%1", _tank];

_value = (backpackContainer player) getVariable _container;
if (isNil "_value") then {
	_value = (vestContainer player) getVariable _container;
	if (isNil "_value") then {_obj = (vestContainer player);};
}else {
	_obj = (backpackContainer player);
};
_value params ["grad_refill_barTank", "grad_refill_o2Perc", "grad_refill_n2Perc", "grad_refill_hePerc"];

_maxBar = getNumber (configFile >> "CfgVehicles" >> _obj >> _barName);

if (_bool) then {
	[{
		params ["_args","_handle"]; 
		_args params ["_obj", "_container", "_maxBar"];
		if (grad_refill_barTank == _maxBar) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_obj setVariable [_container, [grad_refill_barTank, grad_refill_o2Perc, grad_refill_n2Perc, grad_refill_hePerc]];
		}else {
			if(grad_refill_barTank > _maxBar) then {
				grad_refill_barTank = _maxBar;
			}else {
				grad_refill_barTank = grad_refill_barTank + grad_refillRate;
			};
		};		
	}, 1, [_obj, _container, _maxBar]] call CBA_fnc_addPerFrameHandler;	
	
}else {	
	if (grad_refill_barTank > 0) then {
		[{
			params ["_args","_handle"]; 
			_args params ["_obj", "_container", "_maxBar"];
			if (grad_refill_barTank == 0) exitWith {
				[_handle] call CBA_fnc_removePerFrameHandler;
				_obj setVariable [_container, [grad_refill_barTank, grad_refill_o2Perc, grad_refill_n2Perc, grad_refill_hePerc]];
			}else {
				if(grad_refill_barTank < 0) then {
					grad_refill_barTank = 0;
				}else {
					grad_refill_barTank = grad_refill_barTank - grad_refillRate;
				};
			};
		}, 1, [_obj, _container, _maxBar]] call CBA_fnc_addPerFrameHandler;
	};
	
	switch (_class) do {		
		case 0 	: {grad_refill_o2 = 0.21; 	grad_refill_n2 = 0.79; 	grad_refill_he = 0;};		//Air
		case 1 	: {grad_refill_o2 = 0.32;	grad_refill_n2 = 0.68; 	grad_refill_he = 0;};		//EAN32
		case 2 	: {grad_refill_o2 = 0.21; 	grad_refill_n2 = 0; 	grad_refill_he = 0.79;};	//Heliox 21
		case 3 	: {grad_refill_o2 = 0.28; 	grad_refill_n2 = 0; 	grad_refill_he = 0.72;};	//Heliox 28
		case 4 	: {grad_refill_o2 = 0.26; 	grad_refill_n2 = 0.57; 	grad_refill_he = 0.17;};	//Helitrox
		case 5	: {grad_refill_o2 = 0.10; 	grad_refill_n2 = 0.50; 	grad_refill_he = 0.40;};	//Hypoxic
		case 6 	: {grad_refill_o2 = 0.32; 	grad_refill_n2 = 0.68; 	grad_refill_he = 0;};		//Nitrox I
		case 7 	: {grad_refill_o2 = 0.36; 	grad_refill_n2 = 0.64; 	grad_refill_he = 0;};		//Nitrox II 
		case 8	: {grad_refill_o2 = 0.19; 	grad_refill_n2 = 0.30; 	grad_refill_he = 0.51;};	//Normoxic
		case 9 	: {grad_refill_o2 = 1; 		grad_refill_n2 = 0; 	grad_refill_he = 0;};		//Oxygen
		case 10	: {grad_refill_o2 = 0.10; 	grad_refill_n2 = 0.40; 	grad_refill_he = 0.50;};	//Trimax
		case 11	: {grad_refill_o2 = 0.15; 	grad_refill_n2 = 0.30; 	grad_refill_he = 0.55;};	//Trimax 15/55
	};  
	  
	[{
		params ["_args","_handle"]; 
		_args params ["_obj", "_container", "_maxBar"];
		if (grad_refill_barTank == _maxBar) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_obj setVariable [_container, [grad_refill_barTank, grad_refill_o2Perc, grad_refill_n2Perc, grad_refill_hePerc]];
		}else {
			if(grad_refill_barTank > _maxBar) then {
				grad_refill_barTank = _maxBar;
			}else {
				grad_refill_barTank = grad_refill_barTank + grad_refillRate;
			};
		};		
	}, 1, [_obj, _container, _maxBar]] call CBA_fnc_addPerFrameHandler;
};