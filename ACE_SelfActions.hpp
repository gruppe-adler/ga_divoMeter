class ga_divoMeter_emergencyAsent
{
     displayName = $STR_ga_divoMeter_emergencyAsent;
     condition = "(underwater player)";
     exceptions[] = {"isNotInside"};
     statement = "[] call ga_divoMeter_fnc_emergencyAscent";
     showDisabled = 0;
     priority = 2.5;
     icon = "";
};

/*
class ga_divoMeter_open
{
     displayName = $STR_ga_divoMeter_emergencyAsent;
     condition = "";
     exceptions[] = {};
     statement = "[] call ga_divoMeter_fnc_openDivoMeter";
     showDisabled = 0;
     priority = 2.5;
     icon = "";
};
*/