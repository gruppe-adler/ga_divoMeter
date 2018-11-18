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
		model = "\A3\Characters_F_Jets\Vests\V_DeckCrew_F.p3d";
		picture = "\A3\characters_f\Data\UI\icon_V_TacVest_blk_CA.paa"; /// this icon fits the vest surprisingly well
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\A3\Characters_F_Jets\Vests\Data\V_DeckCrew_blue_CO.paa"};

		class ItemInfo: ItemInfo {
			author = "Salbei";
			uniformModel = "\A3\Characters_F_Jets\Vests\V_DeckCrew_F.p3d";
			containerClass = "Supply5";
			//hiddenSelections[] = {"camo"};
			//overlaySelectionsInfo[] = {"ghillie_hide"};
		};
	};

	class ItemWatch;
	class GA_DivingComputer: ItemWatch {
			 ACE_hideItemType = "Watch";

			 author = "Salbei";
			 descriptionShort = $STR_grad_enhancedDiving_computer_desc;
			 displayName = $STR_grad_enhancedDiving_computer;
			 picture = QPATHTOF(data\images\dive_computer_preview.paa);
	 };
};
