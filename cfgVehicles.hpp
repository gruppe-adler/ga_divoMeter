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
     
    class grad_divoMeter_params:Module_F {
        scope = 2;
        displayName = "Divo Meter Settings";
        icon ="";
        category = "divoMeter";
        function = "grad_divoMeter_fnc_setModuleSetting";
        functionPriority = 0;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 1;
        is3DEN = 1;
        author = "Salbei";
        class Arguments : ArgumentsBaseUnits {   
			class activ {
				displayName = $STR_grad_divoMeter_activ;
				description = $STR_grad_divoMeter_activ_desc;
				typeName = "BOOL"; 
				defaultValue = "0";				
			}
			class maxppO {
				displayName = $STR_grad_divoMeter_maxppO;
				description = $STR_grad_divoMeter_maxppO_desc;
				typeName = "NUMBER";
				defaultValue = "1.1";
			};
			class tempC {
				displayName = $STR_grad_divoMeter_tempC;
				description = $STR_grad_divoMeter_tempC_desc;
				typeName = "NUMBER";
				defaultValue = "20";
			};
			class rate {
				displayName = $STR_grad_divoMeter_rate;
				description = $STR_grad_divoMeter_rate_desc;
				typeName = "NUMBER";
				defaultValue = "25";
			};
			 class Units {
				displayName = $STR_grad_divoMeter_unit;
				description = $STR_grad_divoMeter_unit_desc;
				typeName = "STRING";
				defaultValue = "B_diver_F, B_diver_TL_F, B_diver_exp_F";
			 };
		};
		class ModuleDescription : ModuleDescription {
			description = $STR_grad_divoMeter_description;
		};
	};

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                #include "ACE_SelfActions.hpp"
            };
			class grad_divoMeter_emergencyAsent {
				displayName = $STR_grad_divoMeter_emergencyAsent;
				condition = "(DIVOMETERGEARON)";
				statement = "[] call grad_divoMeter_fnc_emergencyAscent";
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
