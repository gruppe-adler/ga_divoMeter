#include "script_component.hpp"

GVAR(narcActive) = true;
private _narcColor = ppEffectCreate ["colorCorrections", 1001];
private _narcBlur = ppEffectCreate ["radialBlur", 1002];
private _narcDynBlur = ppEffectCreate ["DynamicBlur", 1003];
private _narcChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",2];

[{
	params ["_args","_handle"];
	_args params ["_narcColor", "_narcBlur", "_narcDynBlur", "_narcChroma"];
	if (GVAR(narcFactor) < 8) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		titleText ["","BLACK IN",4];
		ppEffectDestroy _narcBlur;
		ppEffectDestroy _narcDynBlur;
		ppEffectDestroy _narcChroma;
		ppEffectDestroy _narcColor;
		GVAR(narcActive) = false;
	};

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
		_damageVar = player getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]];
		_bodyPart = selectRandom ["head", "body", "arm_r", "arm_l", "leg_r", "leg_l"];
		[player, _bodyPart, (_damageVar select ([_bodyPart] call ace_medical_fnc_selectionNameToNumber)) + (GVAR(narcFactor)/50), player, "explosive", -1] call ace_medical_fnc_handleDamage;

		[{titleText ["","BLACK OUT",4];}, _this, 4] call CBA_fnc_waitAndExecute;

	}, [_narcColor, _narcBlur, _narcDynBlur, _narcChroma], 4] call CBA_fnc_waitAndExecute;
}, 8, [_narcColor, _narcBlur, _narcDynBlur, _narcChroma]] call CBA_fnc_addPerFrameHandler;
