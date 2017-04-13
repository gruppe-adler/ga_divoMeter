class ga_divoMeter_open
{
     displayName = $STR_ga_divoMeter_divoMeter_open;
     condition = "";
     statement = "[true] call ga_divoMeter_fnc_openDivoMeter";
     priority = 2.5;
     icon = "";
};

class ga_divoMeter_close
{
     displayName = $STR_ga_divoMeter_divoMeter_close;
     condition = "";
     statement = "[false] call ga_divoMeter_fnc_openDivoMeter";
     priority = 2.5;
     icon = "";
};
