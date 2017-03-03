DIVOMETEROPEN = false;
DIVIOMETERHEAD = false;
DIVOMETERGEARON = false;

player addEventHandler ["TAKE", 
	{
		if (_this select 2 in DIVOMETERGEAR) then {
			[true, (_this select 2)] call dm_fnc_checkAir;
		}else {
			if (_this select 2 in DIVIOMETERHEADGEAR) then {DIVIOMETERHEAD = true;};
		};
	}
];
player addEventHandler ["PUT", 
	{
		if (_this select 2 in DIVOMETERGEAR) then {
			[false, (_this select 2)] call dm_fnc_checkAir;
		}else {
			if (_this select 2 in DIVIOMETERHEADGEAR) then {DIVIOMETERHEAD = false;};
		};
	}
];

[] call ga_divoMeter_fnc_divometer;