class CfgWeapons {
	class Default;
	class ItemCore;
	class InventoryItem_Base_F;
	class VestItem;
	class Vest_Camo_Base;
	class V_RebreatherB: Vest_Camo_Base {
		class ItemInfo;
	};

	class V_GRAD_DivingTank_Blk: V_RebreatherB {
		author = "Salbei";
		displayName = "Diving Tank (Black)";
		hiddenSelections[] = {"camo","hide","unhide","unhide2"};
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa"};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			containerClass = "Supply5";
			hiddenSelections[] = {"camo","hide","unhide","unhide2"};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa"};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
	class V_GRAD_DivingTank_Oli: V_GRAD_DivingTank_Blk {
		displayName = "Diving Tank (Olive)";
		picture = "\A3\characters_f\Data\UI\icon_V_RebreatherRU_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_rus_co.paa"};
	};

	class V_GRAD_DivingTank_Rgr: V_GRAD_DivingTank_Blk {
		displayName = "Diving Tank (Green)";
		picture = "\A3\characters_f\Data\UI\icon_V_RebreatherIR_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_iran_co.paa"};
	};
/*
	class ItemDivingWatch: ItemWatch {
		author = "Salbei";
		displayName = "Diving Watch";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};
	};

	class B_GRAD_DivingTank {
		author = "Salbei";
		displayName = "Diving Tank (Black)";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			containerClass = "Supply5";
			hiddenSelections[] = {};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
	
	class B_GRAD_DivingTank_Air: B_GRAD_DivingTank {
		displayName = "Diving Tank (Air)";
	};
	
	class B_GRAD_DivingTank_Ean32: B_GRAD_DivingTank {
		displayName = "Diving Tank (EAN32)";
	};
	
	class B_GRAD_DivingTank_Heliox21: B_GRAD_DivingTank {
		displayName = "Diving Tank (Heliox 21)";
	};
	
	class B_GRAD_DivingTank_Heliox28: B_GRAD_DivingTank {
		displayName = "Diving Tank (Heliox 28)";
	};
	
	class B_GRAD_DivingTank_NitroxI: B_GRAD_DivingTank {
		displayName = "Diving Tank (Nitrox I)";
	};
	
	class B_GRAD_DivingTank_NitroxII: B_GRAD_DivingTank {
		displayName = "Diving Tank (Nitrox II)";
	};
	
	class B_GRAD_DivingTank_Oxygen: B_GRAD_DivingTank {
		displayName = "Diving Tank (Oxygen)";
	};
	
	class B_GRAD_DivingTank_Trimax: B_GRAD_DivingTank {
		displayName = "Diving Tank (Trimax)";
	};
	
	class B_GRAD_DivingTank_Trimax15: B_GRAD_DivingTank {
		displayName = "Diving Tank (Trimax 15/55)";
	};
	
	class H_GRAD_DivingMask {
	author = "Salbei";
		displayName = "Diving Mask";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			containerClass = "Supply5";
			hiddenSelections[] = {};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
	
	class V_GRAD_BuoyancyCompensator {
	author = "Salbei";
		displayName = "Diving Buoyancy Compensator";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			containerClass = "Supply5";
			hiddenSelections[] = {};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
*/
};
