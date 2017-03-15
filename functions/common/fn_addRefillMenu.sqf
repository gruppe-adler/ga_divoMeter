//add refill menu to Objekt

if (!params [["_obj", objNull, [objNull]]])exitWith {diag_log "No Objekt given to add Refill!";};

//Define Actions
_changeGasMenu = 		["Change_Gas",			"Change Gas",	"",		{true},{true}										   ] call ace_interact_menu_fnc_createAction; 
_changeGasAir = 		["Change_Gas_Air",		"Air",			"",		{[false, 0] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasEAN32 = 		["Change_Gas_EAN32",	"EAN32",		"",		{[false, 1] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHeliox21 = 	["Change_Gas_Heliox21",	"Heliox 21",	"",		{[false, 2] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHeliox28 = 	["Change_Gas_Heliox28",	"Heliox 28",	"",		{[false, 3] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNitroxI = 	["Change_Gas_NitroxI",	"Nitrox I",		"",		{[false, 4] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNitroxII = 	["Change_Gas_NitroxII",	"Nitrox II",	"",		{[false, 5] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasOxygen = 		["Change_Gas_Oxygen",	"Oxygen",		"",		{[false, 6] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasTrimax = 		["Change_Gas_Trimax",	"Trimax",		"",		{[false, 7] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasTrimax15 = 	["Change_Gas_Trimax15",	"Trimax 15/55",	"",		{[false, 8] call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_refill = 				["Refill_Tank",			"Refill Tank",	"",		{[true] 	call ga_divoMeter_common_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;

//Add to Objekt
[_obj, 0, ["ACE_MainActions"				], 	_refill				] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions"				], _changeGasMenu		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasAir		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasEAN32		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasHeliox21	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	],	_changeGasHeliox28	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasNitroxI	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasNitroxII	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasOxygen	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasTrimax	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"	], 	_changeGasTrimax15	] call ace_interact_menu_fnc_addActionToClass;
