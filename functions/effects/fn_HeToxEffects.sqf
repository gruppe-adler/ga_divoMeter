_HeToxRunTimes = _HeToxRunTimes + 1;
_HeToxColor = ppEffectCreate ["colorCorrections", 1001];
_HeToxBlur = ppEffectCreate ["radialBlur", 1002];
_HeToxDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_HeToxChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",2];
[{
	params ["_HeToxColor", "_HeToxBlur", "_HeToxDynBlur", "_HeToxChroma"];
	titleText ["","BLACK IN",4];
	_HeToxColor ppEffectEnable true;
	_HeToxColor ppEffectAdjust [1, 1, 0, [0.6,0.4,1.0,0.2], [0,1,0,0.5], [0,0,0,0]]; 
	_HeToxColor ppEffectCommit 4;
	_HeToxBlur ppEffectEnable true;
	_HeToxBlur ppEffectAdjust [0.1,0.001,0.15,0.15];
	_HeToxDynBlur ppEffectEnable true;
	_HeToxDynBlur ppEffectAdjust [0.1];
	_HeToxChroma ppEffectEnable true;
	_HeToxChroma ppEffectAdjust [0.09,0.4,true];
	_HeToxChroma ppEffectCommit 4;
	_HeToxBlur ppEffectCommit 4;
	_HeToxDynBlur ppEffectCommit 4;
	[{
		titleText ["","BLACK OUT",4];
		[{
			params ["_HeToxColor", "_HeToxBlur", "_HeToxDynBlur", "_HeToxChroma"];
			titleText ["","BLACK IN",4];
			ppEffectDestroy _HeToxBlur;
			ppEffectDestroy _HeToxDynBlur;
			ppEffectDestroy _HeToxChroma;
			ppEffectDestroy _HeToxColor;
		}, _this, 1] call CBA_fnc_waitAndExecute;            
	}, _this, 1] call CBA_fnc_waitAndExecute;        
}, [_HeToxColor, _HeToxBlur, _HeToxDynBlur, _HeToxChroma], 1] call CBA_fnc_waitAndExecute;
