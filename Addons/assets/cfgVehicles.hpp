class CfgVehicles
{
	class Items_base_F;
	class GRAD_Lift_Bag : Items_base_F
	{
    author = "Salbei";
		scope = 2;
		model = QPATHTOF(data\models\liftballon.p3d);
		displayName = "Lift Bag";
		vehicleClass = "small_items";
    /*
		slingLoadCargoMemoryPoints[] =
		{
			"SlingLoadCargo1",
			"SlingLoadCargo2",
			"SlingLoadCargo3",
			"SlingLoadCargo4"
		};
		*/
	};

  class Bag_Base;
  class B_GRAD_Diving_Tank: Bag_Base
  {
      author = "Salbei";
      scope = 2;
      model = QPATHTOF(data\models\taucherflasche.p3d);
      displayName = "Diving Tank";
      picture = "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_dgtl_ca.paa";
      hiddenSelections[] = {"camo"};
      hiddenSelectionsTextures[] = {QPATHTOF(data\images\taucherflasche_ca.paa)};
      maximumLoad = 0;
      mass = 20;
      GVAR(gasClass1) = 7;
  		GVAR(tankSize1) = 10;
  		GVAR(maxBar1) = 200;
  };
};
