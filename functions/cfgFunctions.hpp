class CfgFunctions {
	class grad_divoMeter {
		tag = "grad_divoMeter";
		class common {
			file = "\grad_divoMeter\functions\common";
			class addRefillMenu {};
			class checkAir {};
			class checkGear {};
			class divoMeter {};
			class emergencyAscent {};
			class gasCalc {};
			class init {preInit = 1;};
			class initTissues {};
			class openDivoMeter {};
			class refillTank {};
			class setModuleSetting {};
			class switchTank {};
		};
		
		class effects {
			file = "\grad_divoMeter\functions\effects";
			class DCSEffects {};
			class HeToxEffects {};
			class narcEffects {};
			class O2ToxEffects {};			
		};
	};
};
