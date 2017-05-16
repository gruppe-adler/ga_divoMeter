class grad_divoMeter_open
{
     displayName = $STR_grad_divoMeter_divoMeter_open;
     condition = "";
     statement = "[true] call grad_divoMeter_fnc_openDivoMeter";
     priority = 2.5;
     icon = "";
};

class grad_divoMeter_close
{
     displayName = $STR_grad_divoMeter_divoMeter_close;
     condition = "";
     statement = "[false] call grad_divoMeter_fnc_openDivoMeter";
     priority = 2.5;
     icon = "";
};

class grad_divoMeter_switchTank
{
     displayName = $STR_grad_divoMeter_divoMeter_switchTank;
     condition = "((backpackContainer player) in DIVOMETERDOUBLE)";
     statement = "[] call grad_divoMeter_fnc_switchTank";
     priority = 2.5;
     icon = "";
};
