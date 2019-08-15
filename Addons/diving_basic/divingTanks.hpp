class B_GRAD_DivingTank {
    scope = 2;
    mass = 11.7;
    
    author = "Salbei";
    displayName = "Diving Tank 10L (Air)";
    vehicleClass = Backpacks;
    model = "\grad_enhancedDiving\models\tank_10l";
    picture = "\grad_enhancedDiving\textures\tank_10l.paa";
    icon = "\grad_enhancedDiving\textures\tank_10l_icon.paa";
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
    GVAR(gasClass1) = 0;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Ean32:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (EAN32)";
    GVAR(gasClass1) = 1;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Heliox21:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Heliox 21)";
    GVAR(gasClass1) = 2;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Heliox28:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Heliox 28)";
    GVAR(gasClass1) = 3;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Helitrox:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Helitrox)";
    GVAR(gasClass1) = 4;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Hypoxic:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Hypoxic)";
    GVAR(gasClass1) = 5;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_NitroxI:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Nitrox I)";
    GVAR(gasClass1) = 6;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_NitroxII:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Nitrox II)";
    GVAR(gasClass1) = 7;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Normoxic:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Normoxic)";
    GVAR(gasClass1) = 8;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Oxygen:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Oxygen)";
    GVAR(gasClass1) = 9;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};

class B_GRAD_DivingTank_Trimax:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Trimax)";
    GVAR(gasClass1) = 10;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};
    
class B_GRAD_DivingTank_Trimax15:B_GRAD_DivingTank {
    displayName = "Diving Tank 10L (Trimax 15/55)";
    GVAR(gasClass1) = 11;
    GVAR(tankSize1) = 10;
    GVAR(maxBar1) = 200;
};