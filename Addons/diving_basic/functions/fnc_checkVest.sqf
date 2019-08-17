#include "script_component.hpp"

private _ace_playerVest = vest ace_player;
private _ace_playerBackpack = backpack ace_player;
switch (true) do {
    case ((_ace_playerVest in GVAR(Vest)) && ((_ace_playerBackpack in GVAR(Tank)) || (_ace_playerBackpack in GVAR(Double)))) : {
            //removeVest ace_player;
            //_place = GVAR(Vest) find _ace_playerVest;
            //ace_player addVest (GVAR(Vestair) select _place);
    };
    case ((_ace_playerVest in GVAR(Vestair)) && ((_ace_playerBackpack in GVAR(Tank)) || (_ace_playerBackpack in GVAR(Double)))) : {};
    case ((_ace_playerVest in GVAR(Vestair)) && !((_ace_playerBackpack in GVAR(Tank)) || (_ace_playerBackpack in GVAR(Double)))) : {
        //removeVest ace_player;
        //_place = GVAR(Vestair) find _ace_playerVest;
        //ace_player addVest (GVAR(Vest) select _place);
    };
};
