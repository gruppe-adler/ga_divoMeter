class CfgWeapons {
	class Default;
	class ItemCore;
	class InventoryItem_Base_F;
	class VestItem;
	class Vest_Camo_Base;
	class V_RebreatherB: Vest_Camo_Base {
		class ItemInfo;
	};
/*
	class V_GRAD_DivingTank_Blk: V_RebreatherB {
		author = "Salbei";
		displayName = "Diving Tank (Black)";
		hiddenSelections[] = {"camo","hide","unhide","unhide2"};
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa"};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};
		grad_enhancedDiving_gasClass1 = 7;
		grad_enhancedDiving_tankSize1 = 10;
		grad_enhancedDiving_maxBar1 = 200;

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
		grad_enhancedDiving_gasClass1 = 1;
		grad_enhancedDiving_gasClass2 = 2;
		grad_enhancedDiving_tankSize1 = 10;
		grad_enhancedDiving_tankSize2 = 10;
		grad_enhancedDiving_maxBar1 = 200;
		grad_enhancedDiving_maxBar2 = 200;
	};


	class V_GRAD_DivingTank_Rgr: V_RebreatherB {
		displayName = "Diving Tank (Green)";
		picture = "\A3\characters_f\Data\UI\icon_V_RebreatherIR_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_iran_co.paa"};
		model = "\A3\characters_f_epc\civil\equip_press_vest_01.p3d";
	};
	*/

	class V_GRAD_DivingVest_Rgr: Vest_Camo_Base
	{
		scope=2;
		displayName="VIKINGS Plate Carrier Multi-Camo";
		picture="\A3\characters_f\Data\UI\icon_v_tacvest_blk_ca.paa";
		model="A3\Characters_F\BLUFOR\equip_b_vest02.p3d";
		descriptionShort="$STR_A3_SP_AL_IV";
		hiddenSelections[]=	{};
		hiddenSelectionsTextures[]= {};
		class ItemInfo: VestItem
		{
			uniformModel="A3\Characters_F\BLUFOR\equip_b_Vest02";
			containerClass="Supply0";
			mass=100;
			hiddenSelections[]=	{"camo"};
			class HitpointsProtectionInfo
			{
				class Chest
				{
					HitpointName="HitChest";
					armor=20;
					PassThrough=0.2;
				};
				class Diaphragm
				{
					HitpointName="HitDiaphragm";
					armor=20;
					PassThrough=0.2;
				};
				class Abdomen
				{
					hitpointName="HitAbdomen";
					armor=20;
					passThrough=0.2;
				};
				class Body
				{
					hitpointName="HitBody";
					passThrough=0.2;
				};
			};
		};
	};
};
