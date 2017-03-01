params ["_O2ToxRunScript", "_O2ToxRunEffect", "_O2ToxAffDiverDam"];

_O2ToxRunTimes = 0;

_handle = [{
	params ["_args","_handle"];  
	_args params ["_O2ToxRunEffectt", "_O2ToxAffDiverDam", "_O2ToxRunTimes"];
	
	if (!_O2ToxRunScript) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};;
	if (_O2ToxRunEffect == "true") then {
		_O2ToxRunTimes = _O2ToxRunTimes + 1;
		_O2ToxColor = ppEffectCreate ["colorCorrections", 1001];
		_O2ToxBlur = ppEffectCreate ["radialBlur", 1002];
		_O2ToxDynBlur = ppEffectCreate ["DynamicBlur", 1003];
		_O2ToxChroma = ppEffectCreate ["chromAberration", 1004];
		titleText ["","BLACK OUT",2];
		[{
			params ["_O2ToxColor", "_O2ToxBlur", "_O2ToxDynBlur", "_O2ToxChroma", "_O2ToxAffDiverDam"];
			titleText ["","BLACK IN",4];
			_O2ToxColor ppEffectEnable true;
			_O2ToxColor ppEffectAdjust [1, 1, 0, [1.0,0.0,0.0,0.2], [0,1,0,0.5], [0,0,0,0]]; 
			_O2ToxColor ppEffectCommit 4;
			_O2ToxBlur ppEffectEnable true;
			_O2ToxBlur ppEffectAdjust [0.001,0.001,0.15,0.15];
			_O2ToxDynBlur ppEffectEnable true;
			_O2ToxDynBlur ppEffectAdjust [0.5];
			_O2ToxChroma ppEffectEnable true;
			_O2ToxChroma ppEffectAdjust [0.09,0.09,true];
			_O2ToxChroma ppEffectCommit 4;
			_O2ToxBlur ppEffectCommit 4;
			_O2ToxDynBlur ppEffectCommit 4;
			_damageVar = player getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]]; 
			_bodyPart = random ["head", "body", "arm_r", "arm_l", "leg_r", "leg_l"];
			[player, _bodyPart, (_damageVar select ([_bodyPart] call ace_medical_fnc_selectionNameToNumber)) + _DCSAffDiverDam, player, "explosive", -1] call ace_medical_fnc_handleDamage;
				[{
				titleText ["","BLACK OUT",4];
				[{
					params ["_O2ToxColor", "_O2ToxBlur", "_O2ToxDynBlur", "_O2ToxChroma"];
					titleText ["","BLACK IN",4];
					ppEffectDestroy _O2ToxBlur;
					ppEffectDestroy _O2ToxDynBlur;
					ppEffectDestroy _O2ToxChroma;
					ppEffectDestroy _O2ToxColor;
				}, _this, 1] call CBA_fnc_waitAndExecute;            
			}, _this, 1] call CBA_fnc_waitAndExecute;        
		}, [_O2ToxColor, _O2ToxBlur, _O2ToxDynBlur, _O2ToxChroma, _O2ToxAffDiverDam], 1] call CBA_fnc_waitAndExecute;
	};

	if (_O2ToxRunTimes > 0) then {	
		_O2ToxRunEffect = "false";
		_O2ToxRunTimes = 0;		
	};
}, 0, [_O2ToxRunEffect, _O2ToxAffDiverDam, _O2ToxRunTimes]] call CBA_fnc_addPerFrameHandler;
