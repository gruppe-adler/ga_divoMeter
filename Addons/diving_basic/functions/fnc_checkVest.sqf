#include "script_component.hpp"
if (isServer) exitWith {};

[{
	_playerVest = vest player;
	_playerBackpack = backpack player;
	if ((_playerVest in GVAR(divingVest)) && ((_playerBackpack in GVAR(divingVest)) || (_playerBackpack in GVAR(DIVINGDOUBLE)))) then {
		removeVest player;
		_place = GVAR(divingVest) find _playerVest;
		player addVest (GVAR(DIVINGVESTAIR) select _place);
	};
},0,[]] call CBA_fnc_addPerFrameHandler;