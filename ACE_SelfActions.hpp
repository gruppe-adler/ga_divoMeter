class ga_divoMeter_emergencyAsent
{
     displayName = $STR_ga_divoMeter_emergencyAsent;
     condition = "";
     exceptions[] = {"isNotSwimming"};
     statement = "[] call ga_divoMeter_fnc_emergencyAscent";
     showDisabled = 0;
     priority = 2.5;
     icon = "";
};

class ga_divoMeter_open
{
     displayName = $STR_ga_divoMeter_divoMeter_open;
     condition = "";
     exceptions[] = {};
     statement = "[true] call ga_divoMeter_fnc_openDivoMeter";
     showDisabled = 0;
     priority = 2.5;
     icon = "";
};

class ga_divoMeter_close
{
     displayName = $STR_ga_divoMeter_divoMeter_close;
     condition = "";
     exceptions[] = {};
     statement = "[false] call ga_divoMeter_fnc_openDivoMeter";
     showDisabled = 0;
     priority = 2.5;
     icon = "";
};
