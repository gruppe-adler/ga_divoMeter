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
     class grad_enhancedDiving_params: Module_F
     {
          scope = 2;
          displayName = $STR_Enhanced_Diving_Settings;
          icon ="\grad_enhancedDiving\images\modul_logo.paa";
          category = "enhancedDiving";
          function = "grad_enhancedDiving_fnc_setModuleSetting";
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

    class Man;
      class CAManBase: Man {
    class ACE_SelfActions {
        class GRAD_EnhancedDving {
    showDisabled = 1;
    displayName = "Enhanced Diving";
    condition = "(EDGEARON)";
    exceptions[] = {"isNotSwimming"};
    priority = 2.5;
    icon = "";
            #include "ACE_SelfActions.hpp"
        };
    };
  };

  class Bag_Base;
  class grad_diving_tank: Bag_Base
  {
      author = "Salbei";
      scope = 2;
      model = "\grad_enhancedDiving\models\taucherflasche.p3d";
      displayName = "Diving Tank";
      picture = "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_dgtl_ca.paa";
      hiddenSelectionsTextures[]={};
      maximumLoad = 0;
      mass = 20;
  };
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class enhancedDiving: NO_CATEGORY
	{
		displayName = "Enhanced Diving";
          priority = 2;
          side = 7;
	};
};
