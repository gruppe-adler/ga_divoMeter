class CfgFunctions {
	class grad_enhancedDiving {
		tag = "grad_enhancedDiving";
		class common {
			file = "\grad_enhancedDiving\functions\common";
			class addRefillMenu {};
			class addGasVariables {};
			class checkGear {};
			class divingCalc {};
			class emergencyAscent {};
			class gasCalc {};
			class init {preInit = 1;};
			class initTissues {};
			class openWatch {};
			class playSound {};
			class refillTank {};
			class setModuleSetting {};
			class switchTank {};
			class watchDisplay {};
		};
		
		class effects {
			file = "\grad_enhancedDiving\functions\effects";
			class bloodEffects {};
			class DCSEffects {};
			class HeToxEffects {};
			class narcEffects {};
			class O2ToxEffects {};			
		};
	};
};
