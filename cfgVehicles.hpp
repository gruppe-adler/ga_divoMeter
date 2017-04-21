class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
            class Units;
        };
        class ModuleDescription {
            class AnyBrain;
        };
    };
     
    class ga_divoMeter_params:Module_F {
        scope = 2;
        displayName = "Divo Meter Settings";
        icon ="";
        category = "divoMeter";
        function = "ga_divoMeter_fnc_setModuleSetting";
        functionPriority = 0;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 1;
        is3DEN = 1;
        author = "Salbei";
        class Arguments : ArgumentsBaseUnits {   
			class activ {
				displayName = $STR_ga_divoMeter_activ;
				description = $STR_ga_divoMeter_activ_desc;
				typeName = "BOOL"; 
				defaultValue = "0";				
			}
			class maxppO {
				displayName = $STR_ga_divoMeter_maxppO;
				description = $STR_ga_divoMeter_maxppO_desc;
				typeName = "NUMBER";
				defaultValue = "1.1";
			};
			class tempC {
				displayName = $STR_ga_divoMeter_tempC;
				description = $STR_ga_divoMeter_tempC_desc;
				typeName = "NUMBER";
				defaultValue = "20";
			};
			 class Units {
				displayName = $STR_ga_divoMeter_unit;
				description = $STR_ga_divoMeter_unit_desc;
				typeName = "STRING";
				defaultValue = "";
			 };
		};
		class ModuleDescription : ModuleDescription {
			description = $STR_ga_divoMeter_description;
		};
	};

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                #include "ACE_SelfActions.hpp"
            };
			class ga_divoMeter_emergencyAsent {
				displayName = $STR_ga_divoMeter_emergencyAsent;
				condition = "true";
				statement = "[] call ga_divoMeter_fnc_emergencyAscent";
				showDisabled = 1;
				exceptions[] = {"isNotSwimming"};
				priority = 2.5;
				icon = "";
			};
        };
    };
};

class CfgFactionClasses {
	class NO_CATEGORY;
	class divoMeter: NO_CATEGORY {
	displayName = "Divo Meter";
        priority = 2;
        side = 7;
	};
};
