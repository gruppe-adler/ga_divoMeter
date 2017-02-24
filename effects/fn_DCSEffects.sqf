params ["_DCSRunScript", "_DCSRunEffect", "_DCSAffDiver", "_DCSAffDiverDam"];
_DCSRunTimes = 0;

_handle = [{
	params ["_args","_handle"];  
	_args params ["_DCSRunEffectt", "_DCSAffDiverDam", "_DCSRunTimes"];
	
	if (!_DCSRunScript) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

	if (_DCSRunEffect == "true") then {
		_DCSRunTimes = _DCSRunTimes + 1;
		_DCSColor = ppEffectCreate ["colorCorrections", 1001];
		_DCSBlur = ppEffectCreate ["radialBlur", 1002];
		_DCSDynBlur = ppEffectCreate ["DynamicBlur", 1003];
		_DCSChroma = ppEffectCreate ["chromAberration", 1004];
		titleText ["","BLACK OUT",1];
		[{
			params ["_DCSColor", "_DCSBlur", "_DCSDynBlur", "_DCSChroma"];
			titleText ["","BLACK IN",1];
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
			player setDamage ((getDammage player) + _DCSAffDiverDam);
			[{
				titleText ["","BLACK OUT",1];
				[{
					params ["_DCSColor", "_DCSBlur", "_DCSDynBlur", "_DCSChroma"];
					titleText ["","BLACK IN",1];
					ppEffectDestroy _DCSBlur;
					ppEffectDestroy _DCSDynBlur;
					ppEffectDestroy _DCSChroma;
					ppEffectDestroy _DCSColor;
	
				}, _this, 1] call CBA_fnc_waitAndExecute;            
			}, _this, 1] call CBA_fnc_waitAndExecute;        
		}, [_DCSColor, _DCSBlur, _DCSDynBlur, _DCSChroma], 1] call CBA_fnc_waitAndExecute;
	};
	if (_DCSRunTimes > 0) then {	
		_DCSRunEffect = "false";
		_DCSRunTimes = 0;		
	};
}, 0, [_DCSRunEffect, _DCSAffDiverDam, _DCSRunTimes]] call CBA_fnc_addPerFrameHandler;	
