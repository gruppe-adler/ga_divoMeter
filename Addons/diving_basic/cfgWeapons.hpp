class CfgWeapons {
	class Default;
	class ItemCore;
	class InventoryItem_Base_F;
	class VestItem;
	class Vest_Camo_Base;
	class V_RebreatherB: Vest_Camo_Base {
		class ItemInfo;
	};

	class V_GA_DivingVest_Rgr: V_RebreatherB {
		scope = 2;
		author = "Salbei";
		displayName = "Diving Vest";
		model = QPATHTOF(data\models\diving_vest_belt.p3d);
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			containerClass = "Supply5";
			hiddenSelections[] = {"camo"};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
/*
	class V_GRAD_DivingVest_Rgr: V_RebreatherB {
		scope=1;
		displayName="Diving Vest Air";
		descriptionShort="Diving Vest Air";
		hiddenSelections[] = {"camo","hide","unhide","unhide2"};
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\data\visors_ca.paa"};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			containerClass = "Supply5";
			hiddenSelections[] = {"camo","hide","unhide","unhide2"};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\data\visors_ca.paa"};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
	*/

	class ItemWatch;
	class GA_DivingComputer: ItemWatch {
			 ACE_hideItemType = "Watch";

			 author = "Salbei";
			 descriptionShort = $STR_grad_enhancedDiving_computer_desc;
			 displayName = $STR_grad_enhancedDiving_computer;
			 picture = QPATHTOF(data\images\dive_computer_preview.paa);
	 };
};
