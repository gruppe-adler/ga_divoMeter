#include "defines.hpp"

_logic = param [0,objNull,[objNull]];

_activ		 	= 	_logic getVariable ["activ", false];
_maxppO 		= 	_logic getVariable ["maxppO",1.11];
_tempC			= 	_logic getVariable ["tempC",29];
grad_refillRate 	=	_logic getVariable ["rate", 24];
//_units			= 	_logic getVariable ["Units", "NONE"];

waitUntil {!isnil "bis_fnc_init"};
diag_log format ["ED Activ: %1, MaxPPO: %2, Temp: %3, Rate: %4", _activ, _maxppO, _tempC, grad_refillRate];

if (_activ) then {
	waitUntil {!isNull player};
	
	//if (_units == "NONE" ||!((typeOf player) in _units)) exitWith {diag_log format ["ED: Player %1 is no Diver.", player];};
	EDGEARON = false;
	EDMETRIC = true;
	EDOPEN = false;
	EDWATCHON = false;

	player addEventHandler ["TAKE", 
		{
			diag_log format ["ED Take Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in EDDIVINGGEAR) : {[true, (_this select 2)] call grad_enhancedDiving_fnc_checkAir;};
			};
		}
	];

	player addEventHandler ["PUT", 
		{
			diag_log format ["ED Put Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in EDDIVINGGEAR) : {[false, (_this select 2)] call grad_enhancedDiving_fnc_checkAir;};
			};
		}
	];
	
	if ((vest player) in EDDIVINGGEAR) then {
		EDGEARON = true;
		[true, (vest player)] call grad_enhancedDiving_fnc_checkAir;
	};
	if ((backpack player) in EDDIVINGGEAR) then {
		EDGEARON = true;
		[true, (backpackContainer player)] call grad_enhancedDiving_fnc_checkAir;
	};
		
	[_maxppO, _tempC] call grad_enhancedDiving_fnc_calcWatch;
};
