DIVOMETEROPEN = false;
DIVIOMETERHEAD = false;
DIVOMETERGEARON = true;

waitUntil {!isNull player};
diag_log format ["DivoMeter: Activ: %1", _diveActiv];
if (!(_activ) || isNil "_diveActiv") exitWith {};

player addEventHandler ["TAKE", 
	{
		diag_log format ["Gear: %1",(_this select 2)];
		if (_this select 2 in DIVOMETERGEAR) then {
			[true, (_this select 2)] call ga_divoMeter_fnc_checkAir;
		}else {
			if (_this select 2 in DIVIOMETERHEADGEAR) then {DIVIOMETERHEAD = true;};
		};
	}
];

player addEventHandler ["PUT", 
	{
		diag_log format ["Gear: %1",(_this select 2)];
		if (_this select 2 in DIVOMETERGEAR) then {
			[false, (_this select 2)] call ga_divoMeter_fnc_checkAir;
		}else {
			if (_this select 2 in DIVIOMETERHEADGEAR) then {DIVIOMETERHEAD = false;};
		};
	}
];

[] call ga_divoMeter_fnc_divometer;
