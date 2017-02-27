dm_run = !dm_run;

if (dm_run) then {
    if (GVAR(menuRun) && dialog) then {
        GVAR(menuRun) = false;
        closeDialog 0;
    };
    _dmhidden = true;
    [{
        params ["_args", "_idPFH"];
        _args params ["_vehicle"];
        if (!dm_run || (!alive ACE_player) || (vehicle ACE_player != _vehicle)) exitWith {
            dm_run = false;
            135471 cutText ["", "PLAIN"];
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
        if (cameraView == "GUNNER") then {
            if (!_dmhidden) then {
                _dmhidden = true;
                135471 cutText ["", "PLAIN"];
            };
        } else {
            if (_dmhidden) then {
                _dmhidden = false;
               
            };
        };
    }, 0.1, [vehicle ACE_player]] call CBA_fnc_addPerFrameHandler;
};