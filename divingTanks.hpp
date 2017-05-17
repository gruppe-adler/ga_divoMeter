class B_GRAD_DivingTank {
	scope = 2;
	mass = 11.7;
	
	author = "Salbei";
	displayName = "Diving Tank 10L (Air)";
	vehicleClass = Backpacks;
	model = "\grad_divoMeter\models\tank_10l";
	picture = "\grad_divoMeter\images\tank_10l.paa";
	icon = "\grad_divoMeter\images\tank_10l_icon.paa";
	hiddenSelections[] = {};
	hiddenSelectionsTextures[] = {};
	hiddenUnderwaterSelections[] = {};
	shownUnderwaterSelections[] = {};
	hiddenUnderwaterSelectionsTextures[] = {};
	
	class ItemInfo: ItemInfo {
		author = "Salbei";
		containerClass = 0;
		hiddenSelections[] = {};
		hiddenUnderwaterSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};
		shownUnderwaterSelections[] = {};
	};
	
};

class B_GRAD_DivingTank_Air:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Air)";
	grad_divoMeter_gasClass1 = 0;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Ean32:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (EAN32)";
	grad_divoMeter_gasClass1 = 1;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Heliox21:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Heliox 21)";
	grad_divoMeter_gasClass1 = 2;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Heliox28:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Heliox 28)";
	grad_divoMeter_gasClass1 = 3;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Helitrox:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Helitrox)";
	grad_divoMeter_gasClass1 = 4;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Hypoxic:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Hypoxic)";
	grad_divoMeter_gasClass1 = 5;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_NitroxI:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Nitrox I)";
	grad_divoMeter_gasClass1 = 6;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_NitroxII:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Nitrox II)";
	grad_divoMeter_gasClass1 = 7;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Normoxic:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Normoxic)";
	grad_divoMeter_gasClass1 = 8;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Oxygen:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Oxygen)";
	grad_divoMeter_gasClass1 = 9;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};

class B_GRAD_DivingTank_Trimax:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Trimax)";
	grad_divoMeter_gasClass1 = 10;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};
	
class B_GRAD_DivingTank_Trimax15:B_GRAD_DivingTank {
	displayName = "Diving Tank 10L (Trimax 15/55)";
	grad_divoMeter_gasClass1 = 11;
	grad_divoMeter_tankSize1 = 10;
	grad_divometer_maxBar1 = 200;
};