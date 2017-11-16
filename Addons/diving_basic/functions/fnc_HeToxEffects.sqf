#include "script_component.hpp"

GVAR(heActive) = true;
_HeToxColor = ppEffectCreate ["colorCorrections", 1001];
_HeToxBlur = ppEffectCreate ["radialBlur", 1002];
_HeToxDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_HeToxChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",2];

[{
	params ["_args","_handle"];
	_args params ["_HeToxColor", "_HeToxBlur", "_HeToxDynBlur", "_HeToxChroma"];
	if (GVAR(pHeAlv) < 8) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		titleText ["","BLACK IN",4];
		ppEffectDestroy _HeToxBlur;
		ppEffectDestroy _HeToxDynBlur;
		ppEffectDestroy _HeToxChroma;
		ppEffectDestroy _HeToxColor;
		GVAR(heActive) = false;
	};

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

		[{titleText ["","BLACK OUT",4];}, _this, 4] call CBA_fnc_waitAndExecute;

	}, [_HeToxColor, _HeToxBlur, _HeToxDynBlur, _HeToxChroma], 4] call CBA_fnc_waitAndExecute;
}, 8, [_HeToxColor, _HeToxBlur, _HeToxDynBlur, _HeToxChroma]] call CBA_fnc_addPerFrameHandler;
