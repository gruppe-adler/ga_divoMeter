params ["_dispNumber", "_dispText", "_interval"];
_displayUI = uiNamespace getVariable "slb_disp";
diag_log format ["Blinking on %1 number %2 for %3 in interval %4", _displayUI, _dispNumber, _dispText, _interval];

[{
	params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
	(_displayUI displayCtrl _dispNumber) ctrlSetText _dispText;
	
	[{
		params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
		(_displayUI displayCtrl _dispNumber) ctrlSetText "";
		
		[{
			params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
			(_displayUI displayCtrl _dispNumber) ctrlSetText _dispText;
			
			[{
				params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
				(_displayUI displayCtrl _dispNumber) ctrlSetText "";
				
				[{
					params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
					(_displayUI displayCtrl _dispNumber) ctrlSetText _dispText;
					
					[{
						params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
						(_displayUI displayCtrl _dispNumber) ctrlSetText "";
						
						[{
							params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
							(_displayUI displayCtrl _dispNumber) ctrlSetText _dispText;
							
							[{
								params ["_displayUI", "_dispNumber", "_dispText", "_interval"];
								(_displayUI displayCtrl _dispNumber) ctrlSetText "";
				
				
											} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
						} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
					} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
				} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
			} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
		} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
	} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
} , [_displayUI, _dispNumber, _dispText, _interval], _interval] call CBA_fnc_waitAndExecute;
