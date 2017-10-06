class grad_enhancedDiving_open
{
     displayName = $STR_grad_enhancedDiving_watch_open;
     condition = "(EDGEARON && !(EDOPEN))";
     statement = "[true] call grad_enhancedDiving_fnc_openWatch";
	 exceptions[] = {"isNotSwimming"};
     priority = 2.5;
     icon = "";
};

class grad_enhancedDiving_close
{
     displayName = $STR_grad_enhancedDiving_watch_close;
     condition = "(EDGEARON && EDOPEN)";
     statement = "[false] call grad_enhancedDiving_fnc_openWatch";
	 exceptions[] = {"isNotSwimming"};
     priority = 2.5;
     icon = "";
};
