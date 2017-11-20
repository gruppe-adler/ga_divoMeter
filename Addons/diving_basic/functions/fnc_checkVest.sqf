#include "script_component.hpp"

_playerVest = vest player;
_playerBackpack = backpack player;
switch (true) do {
	case ((_playerVest in GVAR(Vest)) && ((_playerBackpack in GVAR(Tank)) || (_playerBackpack in GVAR(Double)))) : {
			//removeVest player;
			//_place = GVAR(Vest) find _playerVest;
			//player addVest (GVAR(Vestair) select _place);
	};
	case ((_playerVest in GVAR(Vestair)) && ((_playerBackpack in GVAR(Tank)) || (_playerBackpack in GVAR(Double)))) : {};
	case ((_playerVest in GVAR(Vestair)) && !((_playerBackpack in GVAR(Tank)) || (_playerBackpack in GVAR(Double)))) : {
		//removeVest player;
		//_place = GVAR(Vestair) find _playerVest;
		//player addVest (GVAR(Vest) select _place);
	};
};
