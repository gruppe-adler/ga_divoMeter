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
          icon = QPATHTOF(data\images\modul_logo.paa);
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

  class Bag_Base;
  class B_GA_Diving_Tank: Bag_Base
  {
      author = "Salbei";
      scope = 2;
      model = QPATHTOF(data\models\taucherflasche.p3d);
      displayName = "Diving Tank";
      picture = "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_dgtl_ca.paa";
      hiddenSelections[] = {"camo"};
      hiddenSelectionsTextures[] = {"\x\grad_enhancedDiving\Addons\diving_basic\data\images\taucherflasche_ca.paa"};
      maximumLoad = 0;
      mass = 20;
      GVAR(gasClass1) = 7;
  		GVAR(tankSize1) = 10;
  		GVAR(maxBar1) = 200;
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
