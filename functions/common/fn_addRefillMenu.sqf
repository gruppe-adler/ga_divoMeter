//add refill menu to Objekt

if (!params [["_obj", objNull, [objNull]]])exitWith {diag_log "No Objekt given to add Refill!";};

//Define Actions
_changeGasMenu = 		["Change_Gas",			"Change Gas",	"",		{true},{true}										   ] call ace_interact_menu_fnc_createAction; 
_changeGasTank1 = 		["Tank1",				"Tank 1",		"",		{true},{true}										   ] call ace_interact_menu_fnc_createAction; 
_changeGasTank2 = 		["Tank2",				"Tank 2",		"",		{true},{true}										   ] call ace_interact_menu_fnc_createAction; 

_changeGasAir_1 = 		["Change_Gas_Air",		"Air",			"",		{[false, 0, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasEAN32_1 = 	["Change_Gas_EAN32",	"EAN32",		"",		{[false, 1, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHeliox21_1 = 	["Change_Gas_Heliox21",	"Heliox 21",	"",		{[false, 2, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHeliox28_1 = 	["Change_Gas_Heliox28",	"Heliox 28",	"",		{[false, 3, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHelitrox_1 = 	["Change_Gas_Helitrox",	"Helitrox",		"",		{[false, 4, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHypoxic_1 = 	["Change_Gas_Hypoxic",	"Hypoxic",		"",		{[false, 5, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNitroxI_1 = 	["Change_Gas_NitroxI",	"Nitrox I",		"",		{[false, 6, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNitroxII_1 = 	["Change_Gas_NitroxII",	"Nitrox II",	"",		{[false, 7, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNormoxic_1 = 	["Change_Gas_Normoxic",	"Normoxic",		"",		{[false, 8, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasOxygen_1 = 	["Change_Gas_Oxygen",	"Oxygen",		"",		{[false, 9, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasTrimax_1 = 	["Change_Gas_Trimax",	"Trimax",		"",		{[false, 10, 1] call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasTrimax15_1 = 	["Change_Gas_Trimax15",	"Trimax 15/55",	"",		{[false, 11, 1] call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_refill_1 = 			["Refill_Tank",			"Refill Tank",	"",		{[true, 1, 1]  	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;

_changeGasAir_2 = 		["Change_Gas_Air",		"Air",			"",		{[false, 0, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasEAN32_2 = 	["Change_Gas_EAN32",	"EAN32",		"",		{[false, 1, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHeliox21_2 = 	["Change_Gas_Heliox21",	"Heliox 21",	"",		{[false, 2, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHeliox28_2 = 	["Change_Gas_Heliox28",	"Heliox 28",	"",		{[false, 3, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHelitrox_2 = 	["Change_Gas_Helitrox",	"Helitrox",		"",		{[false, 4, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasHypoxic_2 = 	["Change_Gas_Hypoxic",	"Hypoxic",		"",		{[false, 5, 1] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNitroxI_2 = 	["Change_Gas_NitroxI",	"Nitrox I",		"",		{[false, 6, 2]	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNitroxII_2 = 	["Change_Gas_NitroxII",	"Nitrox II",	"",		{[false, 7, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasNormoxic_2 = 	["Change_Gas_Normoxic",	"Normoxic",		"",		{[false, 8, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasOxygen_2 = 	["Change_Gas_Oxygen",	"Oxygen",		"",		{[false, 9, 2] 	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasTrimax_2 = 	["Change_Gas_Trimax",	"Trimax",		"",		{[false, 10, 2] call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_changeGasTrimax15_2 = 	["Change_Gas_Trimax15",	"Trimax 15/55",	"",		{[false, 11, 2] call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;
_refill_2 = 			["Refill_Tank",			"Refill Tank",	"",		{[true, 2, 2]  	call grad_divoMeter_fnc_refillTank},{true},{}] call ace_interact_menu_fnc_createAction;

//Add to Objekt
[_obj, 0, ["ACE_MainActions"						],  _changeGasMenu		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"			],  _changeGasTank1		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas"			],  _changeGasTank2		] call ace_interact_menu_fnc_addActionToClass;

[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasAir_1		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasEAN32_1	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasHeliox21_1] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	],	_changeGasHeliox28_1] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	],	_changeGasHelitrox_1] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	],	_changeGasHypoxic_1 ] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasNitroxI_1	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasNitroxII_1] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasNormoxic_1] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasOxygen_1	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasTrimax_1	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasTrimax15_1] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_refill_1			] call ace_interact_menu_fnc_addActionToClass;


[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasAir_2		] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasEAN32_2	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasHeliox21_2] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	],	_changeGasHeliox28_2] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	],	_changeGasHelitrox_2] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	],	_changeGasHypoxic_2 ] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasNitroxI_2	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasNitroxII_2] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank1"	], 	_changeGasNormoxic_2] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasOxygen_2	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasTrimax_2	] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_changeGasTrimax15_2] call ace_interact_menu_fnc_addActionToClass;
[_obj, 0, ["ACE_MainActions", "Change_Gas", "Tank2"	], 	_refill_2			] call ace_interact_menu_fnc_addActionToClass;
