#include "defines.hpp"
if (isServer) exitWith {};
_logic = param [0,objNull,[objNull]];

_activ		 	= 	_logic getVariable ["activ", false];
grad_maxppO 		= 	_logic getVariable ["maxppO",1.11];
grad_tempC			= 	_logic getVariable ["tempC",29];
grad_refillRate 	=	_logic getVariable ["rate", 24];
//_units			= 	_logic getVariable ["Units", "NONE"];

waitUntil {!isnil "bis_fnc_init"};
diag_log format ["ED Activ: %1, MaxPPO: %2, Temp: %3, Rate: %4", _activ, grad_maxppO, grad_tempC, grad_refillRate];

if (_activ) then {
	waitUntil {!isNull player};
	
	//if (_units == "NONE" ||!((typeOf player) in _units)) exitWith {diag_log format ["ED: Player %1 is no Diver.", player];};
	EDGEARON = false;
	EDMETRIC = true;
	EDOPEN = false;
	EDWATCHON = false;
	
	player addEventHandler ["HITPART", 
		{
			if ((eyePos player) < 0)then {
				{
					diag_log format ["EDHIT: %1", _x];
					if (_x select 10) then {
						//_handle = [_x select 3, _x select 4, _x select 6, _x select 7] call grad_enhancedDiving_fnc_bloodEffects;
						//[{deleteVehicle _this;}, _handle, 10] call 
					};
				}forEach _this;
			};
		}
	];

	player addEventHandler ["TAKE", 
		{
			diag_log format ["ED Take Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in EDDIVINGGEAR) : {
					_value = (backpackContainer player) getVariable _container;
					if (isNil "_value") then {
						_value = (vestContainer player) getVariable _container;
						if (isNil "_value") then {_obj = (vestContainer player);};
					}else {
						_obj = (backpackContainer player);
					};
					[true, (_this select 2), _obj] call grad_enhancedDiving_fnc_addGasVariables;
				};
			};
		}
	];

	player addEventHandler ["PUT", 
		{
			diag_log format ["ED Put Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in EDDIVINGGEAR) : {
					_value = (backpackContainer player) getVariable _container;
					if (isNil "_value") then {
						_value = (vestContainer player) getVariable _container;
						if (isNil "_value") then {_obj = (vestContainer player);};
					}else {
						_obj = (backpackContainer player);
					};
					[false, (_this select 2), _obj] call grad_enhancedDiving_fnc_addGasVariables;
				};
			};
		}
	];
	
	if ((vest player) in EDDIVINGGEAR) then {
		EDGEARON = true;
		[true, (vest player), (vestcontainer player)] call grad_enhancedDiving_fnc_addGasVariables;
	};
	if ((backpack player) in EDDIVINGGEAR) then {
		EDGEARON = true;
		[true, (backpack player), (backpackContainer player)] call grad_enhancedDiving_fnc_addGasVariables;
	};
	
	diag_log format ["ED Gear: %1, Vest: %2, Backpack: %3", EDGEARON, (vest player), (backpack player)];
	
	[] call grad_enhancedDiving_fnc_divingCalc;
};
