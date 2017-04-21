_logic = param [0,objNull,[objNull]];

_activ		 	= 	_logic getVariable ["activ", false];
_maxppO 		= 	_logic getVariable ["maxppO",1.1];
_tempC			= 	_logic getVariable ["tempC",20];
_units			= 	_logic getVariable "Units";

diag_log format ["DOM Activ: %1, MaxPPO: %2, Temp: %3, Units: %4", _activ, _maxppO, _tempC, _units];

if (_activ) then {
	//if !(isNil "_units" ||  in _units) exitWith {diag_log format ["DOM: Player %1 is no Diver.", player];};
	DIVOMETEROPEN = false;
	DIVIOMETERHEAD = false;
	DIVOMETERGEARON = false;
	DIVOMETERMETRIC = true;
	
	[] call ga_divoMeter_fnc_init;
	[_maxppO, _tempC] call ga_divoMeter_fnc_divometer;
};