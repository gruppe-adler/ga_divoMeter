params ["_veh"];
[
  {
    ((getPosASL (this select 0))select 2) <= -205
    },
    {
      params ["_veh"];
      _veh setHit ["motor", 1];
    },
    [_veh]
] call CBA_fnc_waitUntilAndExecute;
