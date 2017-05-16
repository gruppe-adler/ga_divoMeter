_logic = param [0,objNull,[objNull]];

_activ		 	= 	_logic getVariable ["activ", false];
_maxppO 		= 	_logic getVariable ["maxppO",1.1];
_tempC			= 	_logic getVariable ["tempC",20];
grad_refillRate =	_logic getVariable ["rate", 25];
_units			= 	_logic getVariable "Units";

diag_log format ["DM Activ: %1, MaxPPO: %2, Temp: %3, Rate: %4, Units: %5", _activ, _maxppO, _tempC, grad_refillRate, _units];

if (_activ) then {
	if !(isNil "_units" ||(typeOf player) in _units) exitWith {diag_log format ["DM: Player %1 is no Diver.", player];};
	DIVOMETEROPEN = false;
	DIVIOMETERHEAD = false;
	DIVOMETERGEARON = false;
	DIVOMETERMETRIC = true;
	
	waitUntil {!isNull player};

	player addEventHandler ["TAKE", 
		{
			diag_log format ["DM Take Gear: %1",(_this select 2)];
			if (_this select 2 in DIVOMETERGEAR) then {
				[true, (_this select 2)] call grad_divoMeter_fnc_checkAir;
			};
		}
	];

	player addEventHandler ["PUT", 
		{
			diag_log format ["DM Put Gear: %1",(_this select 2)];
			if (_this select 2 in DIVOMETERGEAR) then {
				[false, (_this select 2)] call grad_divoMeter_fnc_checkAir;
			};
		}
	];
	[_maxppO, _tempC] call ga_divoMeter_fnc_divometer;
};