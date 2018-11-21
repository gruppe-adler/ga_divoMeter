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
     class QGVAR(params): Module_F
     {
          scope = 2;
          displayName = $STR_Enhanced_Diving_Settings;
  //        icon = QPATHTOEF(assets,data\images\modul_logo.paa);
          category = "enhancedDiving";
          function = QUOTE(DFUNC(setModuleSetting));
          functionPriority = 0;
          isGlobal = 1;
          isTriggerActivated = 0;
          isDisposable = 0;
          is3DEN = 0;
          author = "Salbei";
          class Arguments : ArgumentsBaseUnits {
             class enabled {
               displayName = $STR_grad_enhancedDiving_enabled;
               description = $STR_grad_enhancedDiving_enabled_desc;
               typeName = "BOOL";
               defaultValue = "1";
             };
             class maxppO {
               displayName = $STR_grad_enhancedDiving_maxppO;
               description = $STR_grad_enhancedDiving_maxppO_desc;
               typeName = "NUMBER";
               defaultValue = "1.1";
             };
             class tempC {
               displayName = $STR_grad_enhancedDiving_tempC;
               description = $STR_grad_enhancedDiving_tempC_desc;
               typeName = "NUMBER";
               defaultValue = "20";
             };
             class rate {
               displayName = $STR_grad_enhancedDiving_rate;
               description = $STR_grad_enhancedDiving_rate_desc;
               typeName = "NUMBER";
               defaultValue = "25";
             };
           };
          class ModuleDescription : ModuleDescription
          {
               description = $STR_grad_enhancedDiving_description;
          };
    };
};

class CfgFactionClasses
{
  	class NO_CATEGORY;
  	class enhancedDiving: NO_CATEGORY	{
  		displayName = "Enhanced Diving";
      priority = 2;
      side = 7;
  	};
};
