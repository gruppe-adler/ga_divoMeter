class CfgVehicles
{
     class Logic;
     class Module_F: Logic
     {
          class ArgumentsBaseUnits
          {
               class Units;
          };
          class ModuleDescription
          {
               class AnyBrain;
          };
     };
     
     class ga_divoMeter_params:Module_F
     {
          scope = 2;
          displayName = "Divo Meter Settings";
          icon ="";
          category = "divoMeter";
          function = "ga_divoMeter_fnc_setModuleSettings";
          functionPriority = 0;
          isGlobal = 1;
          isTriggerActivated = 0;
          isDisposable = 0;
          is3DEN = 0;
          author = "Salbei";
          class Arguments : ArgumentsBaseUnits
          {
               class Units: Units {};
               
                        class sacRT: Edit {
				displayName = $STR_ga_divoMeter_sacRT;
				description = $STR_ga_divoMeter_sacRT_desc;
				typeName = "NUMBER"; 
				defaultValue = "25";
			};
			class maxppO: Edit {
				displayName = $STR_ga_divoMeter_maxppO;
				description = $STR_ga_divoMeter_maxppO_desc;
				typeName = "NUMBER";
				defaultValue = "1.1";
			};
			class tempC: Edit {
				
				displayName = $STR_ga_divoMeter_tempC;
				description = $STR_ga_divoMeter_tempC_desc;
				typeName = "NUMBER";
				defaultValue = "20";
			};
			class ModuleDescription : ModuleDescription {
               description = $STR_ga_divoMeter_description;
			};
 };
 };

     class Man;
     class CAManBase: Man
     {
          class ACE_SelfActions
          {
               class ACE_Equipment {
                    #include "ACE_SelfActions.hpp"
               };
          };
     };

class CfgFactionClasses
{
	class NO_CATEGORY;
	class divoMeter: NO_CATEGORY
	{
		displayName = "Divo Meter";
          priority = 2;
          side = 7;
	};
};
