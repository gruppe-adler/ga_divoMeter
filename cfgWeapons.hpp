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
		grad_divoMeter_gasClass1 = 7;
		grad_divoMeter_tankSize1 = 10;
		grad_divometer_maxBar1 = 200;

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
		grad_divoMeter_gasClass1 = 1;
		grad_divoMeter_gasClass2 = 2;
		grad_divoMeter_tankSize1 = 10;
		grad_divoMeter_tankSize2 = 10;
		grad_divometer_maxBar1 = 200;
		grad_divometer_maxBar2 = 200;
	};

	class V_GRAD_DivingTank_Rgr: V_GRAD_DivingTank_Blk {
		displayName = "Diving Tank (Green)";
		picture = "\A3\characters_f\Data\UI\icon_V_RebreatherIR_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_iran_co.paa"};
		grad_divoMeter_gasClass1 = 5;
		grad_divoMeter_tankSize1 = 10;
		grad_divometer_maxBar1 = 200;
	};

	/*	
	class ItemDivingWatch: ItemWatch {
		author = "Salbei";
		displayName = "Diving Watch";
	};
*/
};
