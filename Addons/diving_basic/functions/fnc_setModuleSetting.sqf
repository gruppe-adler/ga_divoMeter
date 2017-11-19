#include "script_component.hpp"

if (isDedicated) exitWith {diag_log "ED: Exiting Module, it is Clientside"};
_logic = param [0,objNull,[objNull]];

_enabled		 	= 	_logic getVariable ["enabled", false];
GVAR(maxppO) 		= 	_logic getVariable ["maxppO",1.11];
GVAR(tempC)			= 	_logic getVariable ["tempC",29];
GVAR(refillRate) 	=	_logic getVariable ["rate", 24];

diag_log format ["ED Activ: %1, MaxPPO: %2, Temp: %3, Rate: %4", _enabled, GVAR(maxppO), GVAR(tempC), GVAR(refillRate)];

if (_enabled) then {

	GVAR(on) = false;
	GVAR(metric) = true;
	GVAR(open) = false;
	GVAR(on) = false;

/*
	player addEventHandler ["HITPART",
		{
			if ((eyePos player) < 0)then {
				{
					diag_log format ["EDHIT: %1", _x];
					if (_x select 10) then {
						//_handle = [_x select 3, _x select 4, _x select 6, _x select 7] call FUNC(bloodEffects);
						//[{deleteVehicle _this;}, _handle, 10]  call CBA_fnc_waitAndExecute;
					};
				}forEach _this;
			};
		}
	];
*/

	player addEventHandler ["TAKE",
		{
			diag_log format ["ED Take Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in GVAR(Vest)) : {
						[] call FUNC(checkVest);
				case ((_this select 2) in GVAR(Tank)) : {
					[true, (_this select 2), v] call FUNC(addGasVariables);
				};
			};
		}
	];

	player addEventHandler ["PUT",
		{
			diag_log format ["ED Put Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in GVAR(Vest)) : {
					_value = (backpackContainer player) getVariable QGVAR(DIVE_GAS1);
					if (isNil "_value") then {
						_value = (vestContainer player) getVariable QGVAR(DIVE_GAS1);
						if (isNil "_value") then {_obj = (vestContainer player);};
					}else {
						_obj = (backpackContainer player);
					};
					[false, (_this select 2), _obj] call FUNC(addGasVariables);
				};
			};
		}
	];

	if ((vest player) in GVAR(Vest)) then {
		GVAR(on) = true;
		[true, (vest player), (vestcontainer player)] call FUNC(addGasVariables);
	};
	if ((backpack player) in GVAR(Tank)) then {
		GVAR(on) = true;
		[true, (backpack player), (backpackContainer player)] call FUNC(addGasVariables);
	};

	diag_log format ["ED Gear: %1, Vest: %2, Backpack: %3", GVAR(on), (vest player), (backpack player)];

	[] call FUNC(divingCalc);
};
