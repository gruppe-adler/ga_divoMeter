if (isServer) exitWith {};

[{
	_playerVest = vest player;
	_playerBackpack = backpack player;
	if ((_playerVest in EDDIVINGVEST) && ((_playerBackpack in EDDIVINGGEAR) || (_playerBackpack in EDDIVINGDOUBLE))) then {
		removeVest player;
		_place = EDDIVINGVEST find _playerVest;
		player addVest (EDDIVINGVESTAIR select _place);
	};
},0,[]] call CBA_fnc_addPerFrameHandler;