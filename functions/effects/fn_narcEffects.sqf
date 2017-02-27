params ["_narcRunScript", "_narcRunEffect", "_narcAffDiverDam"];
_narcRunTimes = 0;

_handle = [{
	params ["_args","_handle"];    
	_args params ["_narcRunEffect", "_narcAffDiverDam", "_narcRunTimes", "_narcRunScript"];
	
	if (!_narcRunScript) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
	
	if (_narcRunEffect) then {
		_narcRunTimes = _narcRunTimes + 1;
		_narcColor = ppEffectCreate ["colorCorrections", 1001];
		_narcBlur = ppEffectCreate ["radialBlur", 1002];
		_narcDynBlur = ppEffectCreate ["DynamicBlur", 1003];
		_narcChroma = ppEffectCreate ["chromAberration", 1004];
		titleText ["","BLACK OUT",2];
		[{
			params ["_narcColor", "_narcBlur", "_narcDynBlur", "_narcChroma"];
			titleText ["","BLACK IN",4];
			_narcColor ppEffectEnable true;
			_narcColor ppEffectAdjust [1, 1, 0, [0.6,0.3,0.3,0.2], [0,1,0,0.5], [0,0,0,0]]; 
			_narcColor ppEffectCommit 4;
			_narcBlur ppEffectEnable true;
			_narcBlur ppEffectAdjust [0.01,0.01,0.03,0.03];
			_narcDynBlur ppEffectEnable true;
			_narcDynBlur ppEffectAdjust [0.5];
			_narcChroma ppEffectEnable true;
			_narcChroma ppEffectAdjust [0.15,0.15,true];
			_narcChroma ppEffectCommit 4;
			_narcBlur ppEffectCommit 4;
			_narcDynBlur ppEffectCommit 4;
			player setDamage ((getDammage player) + _narcAffDiverDam);
			[{
				titleText ["","BLACK OUT",4];
				[{
					params ["_narcColor", "_narcBlur", "_narcDynBlur", "_narcChroma"];
					titleText ["","BLACK IN",4];
					ppEffectDestroy _narcBlur;
					ppEffectDestroy _narcDynBlur;
					ppEffectDestroy _narcChroma;
					ppEffectDestroy _narcColor;
					
				}, _this, 4] call CBA_fnc_waitAndExecute;            
			}, _this, 4] call CBA_fnc_waitAndExecute;        
		}, [_narcColor, _narcBlur, _narcDynBlur, _narcChroma], 4] call CBA_fnc_waitAndExecute;
	};
	if (_narcRunTimes > 0) then {	
		_narcRunEffect = "false";
		_narcRunTimes = 0;	
	};
}, 0, [_narcRunEffect,  _narcAffDiverDam, _narcRunTimes, _narcRunScript]] call CBA_fnc_addPerFrameHandler;	

