class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit; // Default edit box (i.e., text input field)
			class Combo; // Default combo box (i.e., drop-down menu)
			class Checkbox; // Default checkbox (returned value is Bool)
			class CheckboxNumber; // Default checkbox (returned value is Number)
			class ModuleDescription; // Module description
			class Units; // Selection of units on which the module is applied
		};
		// Description base classes, for more information see below
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	class ga_divoMeter_params: Module_F
	{
		// Standard object definitions
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Divo Meter"; // Name displayed in the menu
		icon = ""; // Map icon. Delete this entry to use the default icon
		category = "DivoMeter";

		
		function = "";				// Name of function triggered once conditions are met
		functionPriority = 0.1;		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 1; 				// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 0;		// 1 for module waiting until all synced triggers are activated
		isDisposable = 0;			// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		is3DEN = 1;					// 1 to run init function in Eden Editor as well

		// Module attributes, uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific
		class Attributes: AttributesBase
		{
			// Module specific arguments
			class sacRT: Edit
  			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "sacRT";
				displayName = $STR_ga_divoMeter_sacRT; // Argument label
				description = $STR_ga_divoMeter_sacRT_desc; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "25"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (25 in this case)
			};
			class maxppO: Edit
  			{
				displayName = $STR_ga_divoMeter_maxppO;
				description = $STR_ga_divoMeter_maxppO_desc;
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "1.1"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (25 in this case)
			};
			class tempC: Edit
  			{
				displayName = $STR_ga_divoMeter_tempC;
				description = $STR_ga_divoMeter_tempC_desc;
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "20"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (25 in this case)
			};
			class ModuleDescription : ModuleDescription
          {
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
};