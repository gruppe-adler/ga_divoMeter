params ["_displayUI", "_dispNumber", "_text", ["_interval", 0,25]];

[{
	params ["_displayUI", "_dispNumber", "_text", "_interval"];
	(_displayUI displayCtrl _dispNumber) ctrlSetText _text;
	
	{
		params ["_displayUI", "_dispNumber", "_text", "_interval"];
		(_displayUI displayCtrl _dispNumber) ctrlSetText "";
		
		{
			params ["_displayUI", "_dispNumber", "_text", "_interval"];
			(_displayUI displayCtrl _dispNumber) ctrlSetText _text;
			
			{
				params ["_displayUI", "_dispNumber", "_text", "_interval"];
				(_displayUI displayCtrl _dispNumber) ctrlSetText "";
				
			} , _interval, [_displayUI, _dispNumber, _text, _interval] call CBA_fnc_waitAndExecute;
		} , _interval, [_displayUI, _dispNumber, _text, _interval] call CBA_fnc_waitAndExecute;
	} , _interval, [_displayUI, _dispNumber, _text, _interval] call CBA_fnc_waitAndExecute;
} , _interval, [_displayUI, _dispNumber, _text, _interval] call CBA_fnc_waitAndExecute;
