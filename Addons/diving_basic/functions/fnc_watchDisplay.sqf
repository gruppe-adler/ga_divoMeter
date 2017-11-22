#include "script_component.hpp"

(["GRAD_DivingComputer"] call BIS_fnc_rscLayer) cutRsc ["slb_divingComputer", "PLAIN", 0, true];
if (isNull (uiNamespace getVariable ["slb_divingComputerUI", displayNull])) exitWith {};

GVAR(open) = true;

[{
	params ["_args","_handle"];

	if !(GVAR(open)) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};

	disableSerialization;
	private _displayUI = uiNamespace getVariable "slb_divingComputerUI";

	(_displayUI displayCtrl DISPLAY_DIVING_TIME_NUMBER_IDC) ctrlSetText format ["%1:%2", ([(date select 3), 2] call CBA_fnc_formatNumber), ([(date select 4), 2] call CBA_fnc_formatNumber)];
	(_displayUI displayCtrl DISPLAY_DIVING_SHOW_CHOOSEN_TANK_IDC) ctrlSetText format ["%1", GVAR(selectedTank)];

	if (((eyePos player select 2) < 0) && GVAR(on)) then {
		_bar = 0;

		if (GVAR(metric)) then {
			(_displayUI displayCtrl DISPLAY_DIVING_DISTANCE_UNIT_IDC) ctrlSetText "M";
			(_displayUI displayCtrl DISPLAY_DIVING_HEIGHT_IDC) ctrlSetText format ["%1",(round(GVAR(depth) *10))/10];
			(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_UNIT_IDC ) ctrlSetText "BAR";
			_bar = round(GVAR(filling)/10);
		}else {
			(_displayUI displayCtrl DISPLAY_DIVING_DISTANCE_UNIT_IDC) ctrlSetText "FT";
			(_displayUI displayCtrl DISPLAY_DIVING_HEIGHT_IDC) ctrlSetText format ["%1",((round((GVAR(depth) * 3.28) *10))/10)];
			(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_UNIT_IDC ) ctrlSetText "PSI";
			_bar = round((GVAR(filling)/10) * 14.5038);
		};
		if (GVAR(filling) > 50) then {
			if ((ctrlText DISPLAY_DIVING_PRESSURE_VALUE_IDC) == "") then {
				(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_VALUE_IDC) ctrlSetTextColor [0, 0, 1, 1];
				(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_VALUE_IDC) ctrlSetText format ["%1", _bar];
			}else{
				(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_VALUE_IDC) ctrlSetText "";
			};
		}else{
			(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_VALUE_IDC) ctrlSetTextColor [0, 1, 0, 1];
			(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_VALUE_IDC) ctrlSetText format ["%1", _bar];
		};

		if (GVAR(doDeco)) then {
			(_displayUI displayCtrl DISPLAY_DIVING_DECO_TAG_IDC) ctrlSetText "DECO";
			if (!(GVAR(depth2deco) > 3) && !(GVAR(depth2deco) < -3)) then {
				(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_UNIT_IDC ) ctrlSetText format ["%1", GVAR(decoTime)];
			};
		}else{
			(_displayUI displayCtrl DISPLAY_DIVING_DECO_TAG_IDC) ctrlSetText "NO DECO";
		};

		(_displayUI displayCtrl DISPLAY_DIVING_TIME_TEXT_IDC) ctrlSetText "TIME";
		(_displayUI displayCtrl DISPLAY_DIVING_DECO_FREE_TIME_IDC) ctrlSetText format ["%1", round (((GVAR(timeleft)) + .01)/60)];
		(_displayUI displayCtrl DISPLAY_DIVING_O2_PERCENTAGE_IDC) ctrlSetText format ["%1%", round (GVAR(percentO2) * 100)];

		switch (true) do {
			case (!GVAR(doDeco)): {
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_TEXT_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_DEPTH_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_TIME_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_TIME_TO_SURFACE_TEXT_IDC) ctrlSetText "TTS";
				(_displayUI displayCtrl DISPLAY_DIVING_DIVE_TIME_IDC) ctrlSetText "DIVE-T";
				(_displayUI displayCtrl DISPLAY_DIVING_TIME_TO_SURFACE_IDC) ctrlSetText format ["%1", round (GVAR(ascTime))];
				(_displayUI displayCtrl DISPLAY_DIVING_DIVING_TIME_IDC ) ctrlSetText format ["%1", round (((GVAR(diveTime))+.01)/60)];
			};
			case (GVAR(doDeco) && !(GVAR(depth2deco) < -6) && !(GVAR(depth2deco) > 6)): {
				(_displayUI displayCtrl DISPLAY_DIVING_TIME_TO_SURFACE_TEXT_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_DIVE_TIME_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_TIME_TO_SURFACE_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_DIVING_TIME_IDC ) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_TEXT_IDC) ctrlSetText "DECO STOP";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_DEPTH_IDC) ctrlSetText format ["%1M", GVAR(depth2deco)];
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_TIME_IDC) ctrlSetText format ["%1", GVAR(deepStopTime)];
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText QPATHTOF(data\images\triangle_down_divider.paa);
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText QPATHTOF(data\images\triangle_up_divider.paa);
			};
			case (GVAR(doDeepStop) && !(GVAR(depth2deepStop) < -6) && !(GVAR(depth2deepStop) > 6)): {
				(_displayUI displayCtrl DISPLAY_DIVING_DEEP_STOP_IDC) ctrlSetText "";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_TEXT_IDC) ctrlSetText "DEEP STOP";
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_DEPTH_IDC) ctrlSetText format ["%1M", GVAR(depth2deepStop)];
				(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_TIME_IDC) ctrlSetText format ["%1", GVAR(deepStopTime)];

				switch (true) do {
					case (GVAR(depth2deepStop) > 1.5) : {
						if ((ctrlText DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) == QPATHTOF(data\images\triangle_down_divider.paa)) then {
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText "";
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText "";
						}else{
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText "";
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText QPATHTOF(data\images\triangle_down_divider.paa);
						};
					};
					case (GVAR(depth2deepStop) < -1.5) : {
						if ((ctrlText DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) == QPATHTOF(data\images\triangle_up_divider.paa)) then {
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText "";
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText "";
						}else{
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText QPATHTOF(data\images\triangle_up_divider.paa);
							(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText "";
						};
					};
					case (GVAR(depth2deepStop) < 1.5 && GVAR(depth2deepStop) > -1.5) : {
						(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_UP_IDC) ctrlSetText QPATHTOF(data\images\triangle_up_divider.paa);
						(_displayUI displayCtrl DISPLAY_DIVING_EMERGENCY_ARROW_DOWN_IDC) ctrlSetText QPATHTOF(data\images\triangle_down_divider.paa);
					};
				};
			};
		};

		if (GVAR(upDepth) <= 0.3) then {
				(_displayUI displayCtrl DISPLAY_DIVING_ASENDBAR_IDC) ctrlSetText "";
		}else{
			if (GVAR(upDepth) >= 9) then {
				if ((ctrlText DISPLAY_DIVING_ASENDBAR_IDC) == QPATHTOF(data\images\left_06.paa))then {
					(_displayUI displayCtrl DISPLAY_DIVING_ASENDBAR_IDC) ctrlSetText "";
				}else{
					(_displayUI displayCtrl DISPLAY_DIVING_ASENDBAR_IDC) ctrlSetText QPATHTOF(data\images\left_06.paa);
				};
			}else{
				_getenhancedDivingRiseTexture = {
					_riseIndex = {
						if (_this < _x)  exitWith{_forEachIndex};
					}forEach [1.5, 3, 4.6, 6.1, 7.6, 9];
					format[QPATHTOF(data\images\left_0%1.paa), _riseIndex];
				};
				(_displayUI displayCtrl DISPLAY_DIVING_ASENDBAR_IDC) ctrlSetText (GVAR(upDepth) call _getenhancedDivingRiseTexture);
			};
		};

		if (GVAR(narcFactor) >= 9.1) then {
				if ((ctrlText DISPLAY_DIVING_N2_BAR_IDC) == QPATHTOF(data\images\right_09.paa)) then {
					(_displayUI displayCtrl DISPLAY_DIVING_N2_BAR_IDC) ctrlSetText "";
				} else {
					(_displayUI displayCtrl DISPLAY_DIVING_N2_BAR_IDC) ctrlSetText QPATHTOF(data\images\right_09.paa);
				};
			} else {
				for "_i" from 1 to 9 do {
					if(GVAR(narcFactor) < _i) exitWith {
						(_displayUI displayCtrl DISPLAY_DIVING_N2_BAR_IDC) ctrlSetText format [ QPATHTOF(data\images\right_0%1.paa), _i];
					};
				};
		};
		(_displayUI displayCtrl DISPLAY_DIVING_SHOW_CHOOSEN_TANK_IDC) ctrlSetText format ["%1", GVAR(selectedTank)];
	}else{
		if (GVAR(metric)) then {
			(_displayUI displayCtrl DISPLAY_DIVING_DISTANCE_UNIT_IDC) ctrlSetText "M";
			(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_UNIT_IDC) ctrlSetText "BAR";
			(_displayUI displayCtrl DISPLAY_DIVING_HEIGHT_IDC) ctrlSetText format ["%1",(round(((getPosASL player) select 2) *10))/10];
		}else{
			(_displayUI displayCtrl DISPLAY_DIVING_DISTANCE_UNIT_IDC) ctrlSetText "FT";
			(_displayUI displayCtrl DISPLAY_DIVING_PRESSURE_UNIT_IDC) ctrlSetText "PSI";
			(_displayUI displayCtrl DISPLAY_DIVING_HEIGHT_IDC) ctrlSetText format ["%1",(round((((getPosASL player) select 2)*3.28) *10))/10];
		};
	};
}, 1, []] call CBA_fnc_addPerFrameHandler;
