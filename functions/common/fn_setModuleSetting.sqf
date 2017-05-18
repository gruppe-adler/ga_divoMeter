
_activ		 	= 	_logic getVariable ["activ", true];
_maxppO 		= 	_logic getVariable ["maxppO",1.1];
_tempC			= 	_logic getVariable ["tempC",20];
grad_refillRate 	=	_logic getVariable ["rate", 25];
_units			= 	_logic getVariable ["Units", "NONE"];


diag_log format ["DM Activ: %1, MaxPPO: %2, Temp: %3, Rate: %4", _activ, _maxppO, _tempC, grad_refillRate];

if (_activ) then {
	waitUntil {!isNull player};
	
	if (_units == "NONE" ||!((typeOf player) in _units)) exitWith {diag_log format ["DM: Player %1 is no Diver.", player];};
	DIVOMETERGEARON = false;
	DIVOMETERMETRIC = true;
	DIVOMETEROPEN = false;
	DIVOMETERWATCHON = false;

	player addEventHandler ["TAKE", 
		{
			diag_log format ["DM Take Gear: %1",(_this select 2)];
			switch (true) do {
				case (_this select 2 in DIVOMETERGEAR) : {[true, (_this select 2)] call grad_divoMeter_fnc_checkAir;};
			};
		}
	];

	player addEventHandler ["PUT", 
		{
			diag_log format ["DM Put Gear: %1",(_this select 2)];
			switch (true) do {
				case (_this select 2 in DIVOMETERGEAR) : {[false, (_this select 2)] call grad_divoMeter_fnc_checkAir;};
			};
		}
	];
	
	[_maxppO, _tempC] call ga_divoMeter_fnc_divometer;
};
