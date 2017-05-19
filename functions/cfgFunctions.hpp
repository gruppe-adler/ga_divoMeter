class CfgFunctions {
	class grad_enhancedDiving {
		tag = "grad_enhancedDiving";
		class common {
			file = "\grad_enhancedDiving\functions\common";
			class addRefillMenu {};
			class checkAir {};
			class checkGear {};
			class calcWatch {};
			class emergencyAscent {};
			class gasCalc {};
			class init {preInit = 1;};
			class initTissues {};
			class openWatch {};
			class refillTank {};
			class setModuleSetting {};
			class switchTank {};
		};
		
		class effects {
			file = "\grad_enhancedDiving\functions\effects";
			class DCSEffects {};
			class HeToxEffects {};
			class narcEffects {};
			class O2ToxEffects {};			
		};
	};
};
