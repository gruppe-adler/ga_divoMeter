waitUntil {!isNull player};

player addEventHandler ["TAKE", 
	{
		diag_log format ["DM Take Gear: %1",(_this select 2)];
		if (_this select 2 in DIVOMETERGEAR) then {
			[true, (_this select 2)] call grad_divoMeter_fnc_checkAir;
		};
	}
];

player addEventHandler ["PUT", 
	{
		diag_log format ["DM Put Gear: %1",(_this select 2)];
		if (_this select 2 in DIVOMETERGEAR) then {
			[false, (_this select 2)] call grad_divoMeter_fnc_checkAir;
		};
	}
];
