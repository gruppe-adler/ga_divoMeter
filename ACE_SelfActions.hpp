class grad_enhancedDiving_open
{
     displayName = $STR_grad_enhancedDiving_watch_open;
     condition = "(EDGEARON)";
     statement = "[true] call grad_enhancedDiving_fnc_openWatch";
     priority = 2.5;
     icon = "";
};

class grad_enhancedDiving_close
{
     displayName = $STR_grad_enhancedDiving_watch_close;
     condition = "(EDGEARON)";
     statement = "[false] call grad_enhancedDiving_fnc_openWatch";
     priority = 2.5;
     icon = "";
};

/*
class grad_enhancedDiving_switchTank
{
     displayName = $STR_grad_enhancedDiving_switchTank;
     condition = "((backpackContainer player) in EDDOUBLE)";
     statement = "[] call grad_enhancedDiving_fnc_switchTank";
     priority = 2.5;
     icon = "";
};
*/