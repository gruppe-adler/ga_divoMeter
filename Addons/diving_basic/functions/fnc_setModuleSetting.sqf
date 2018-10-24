#include "script_component.hpp"

if (isDedicated) exitWith {diag_log "ED: Exiting Module, it is Clientside"};
private _logic = param [0,objNull,[objNull]];

private _enabled		 	= 	_logic getVariable ["enabled", false];
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
					};
				case ((_this select 2) in GVAR(Tank)) : {
					[true, (_this select 2), (backpackContainer player)] call FUNC(addGasVariables);
				};
			};
		}
	];

	player addEventHandler ["PUT",
		{
			diag_log format ["ED Put Gear: %1",(_this select 2)];
			switch (true) do {
				case ((_this select 2) in GVAR(Vest)) : {
					 [] call FUNC(checkVest);
				};
				case ((_this select 2) in GVAR(Tank)) : {
					[false, (_this select 2), objectParent (_this select 2)] call FUNC(addGasVariables);
				};
			};
		}
	];

	if ((vest player) in GVAR(Vest)) then {
		[] call FUNC(checkVest);
	};
	if ((backpack player) in GVAR(Tank)) then {
		[true, (backpack player), (backpackContainer player)] call FUNC(addGasVariables);
	};
	[] call FUNC(divingCalc);
};
