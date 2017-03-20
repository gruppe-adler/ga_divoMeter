class CfgPatches {
	class ga_rebreatherOnLand {

		name = "GA Diving Mod";
		author = "Salbei";

		requiredVersion = 1.0;
		requiredAddons[] = {"ace_main"};

		units[] = {"ga_divoMeter_params"};
		weapons[] = {};
	};
};

#include "functions\cfgFunctions.hpp"
#include "dialog\define.hpp"
#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"
#include "defines.hpp"

class RscTitles {
	#include "dialog\display.hpp"
};

class CfgSounds
{
	sounds[] = {};
	class dispStart
	{
		name = "DivoMeter Display Start";
		sound[] = {"sounds\dispStart.ogg", 1, 1};
		titles[] = {};
	};
	class dispExit
	{
		name = "DivoMeter Display Exit";
		sound[] = {"sounds\dispExit.ogg", 1, 1};
		titles[] = {};
	};
	class dispWarn
	{
		name = "DivoMeter Display Warn";
		sound[] = {"sounds\dispWarn.ogg", 0.5, 1};
		titles[] = {};
	};
	class dispCount
	{
		name = "DivoMeter Display Count";
		sound[] = {"sounds\dispCount.ogg", 2, 1};
		titles[] = {};
	};
	class dispClear
	{
		name = "DivoMeter Display Clear";
		sound[] = {"sounds\dispClear.ogg", 1, 1};
		titles[] = {};
	};
	class dispSilence
	{
		name = "DivoMeter Display Silence";
		sound[] = {"sounds\dispSilence.ogg", 1, 1};
		titles[] = {};
	};
};
