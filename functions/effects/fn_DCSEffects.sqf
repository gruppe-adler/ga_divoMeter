diag_log "DCS Effect fired";

grad_dcsActiv = true;
_DCSColor = ppEffectCreate ["colorCorrections", 1001];
_DCSBlur = ppEffectCreate ["radialBlur", 1002];
_DCSDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_DCSChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",1];

[{
	params ["_args","_handle"];
	_args params ["_HeToxColor", "_HeToxBlur", "_HeToxDynBlur", "_HeToxChroma"];
	if (grad_dDepth < 9.1) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		titleText ["","BLACK IN",4];
		ppEffectDestroy _HeToxBlur;
		ppEffectDestroy _HeToxDynBlur;
		ppEffectDestroy _HeToxChroma;
		ppEffectDestroy _HeToxColor;
		grad_dcsActiv = false;
	};

	[{
		params ["_DCSColor", "_DCSBlur", "_DCSDynBlur", "_DCSChroma"];
		titleText ["","BLACK IN",4];
		_DCSColor ppEffectEnable true;
		_DCSColor ppEffectAdjust [1, 1, 0, [1.0,0.0,0.0,0.2], [0,1,0,0.5], [0,0,0,0]];
		_DCSColor ppEffectCommit 1;
		_DCSBlur ppEffectEnable true;
		_DCSBlur ppEffectAdjust [0.001,0.001,0.15,0.15];
		_DCSDynBlur ppEffectEnable true;
		_DCSDynBlur ppEffectAdjust [0.5];
		_DCSChroma ppEffectEnable true;
		_DCSChroma ppEffectAdjust [0.09,0.09,true];
		_DCSChroma ppEffectCommit 1;
		_DCSBlur ppEffectCommit 1;
		_DCSDynBlur ppEffectCommit 1;
		_damageVar = player getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]];
		_bodyPart = selectRandom ["head", "body", "arm_r", "arm_l", "leg_r", "leg_l"];
		[player, _bodyPart, (_damageVar select ([_bodyPart] call ace_medical_fnc_selectionNameToNumber)) + (1-(grad_nTisTot *1.25)), player, "explosive", -1] call ace_medical_fnc_handleDamage;

		[{titleText ["","BLACK OUT",4];}, _this, 4] call CBA_fnc_waitAndExecute;

	}, [_DCSColor, _DCSBlur, _DCSDynBlur, _DCSChroma], 4] call CBA_fnc_waitAndExecute;
}, 8, [_O2ToxColor, _O2ToxBlur, _O2ToxDynBlur, _O2ToxChroma]] call CBA_fnc_addPerFrameHandler;
