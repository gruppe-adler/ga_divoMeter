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

class grad_enhancedDiving_emergencyAsent 
{
	displayName = $STR_grad_enhancedDiving_emergencyAsent;
	condition = "(((eyePos player select 2) < 0) && EDGEARON)";
	statement = "[] call grad_enhancedDiving_fnc_emergencyAscent";
	exceptions[] = {"isNotSwimming"};
	priority = 2.5;
	icon = "";
};
/*	
class grad_enhancedDiving_switchTank
{
     displayName = $STR_grad_enhancedDiving_switchTank;
     condition = "((backpack player) in EDDOUBLE)";
     statement = "[] call grad_enhancedDiving_fnc_switchTank";
     priority = 2.5;
     icon = "";
};
*/