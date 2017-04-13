class CfgFunctions {
	class ga_divoMeter {
		tag = "ga_divoMeter";
		class common {
			file = "\ga_divoMeter\functions\common";
			class addRefillMenu {};
			class blink {};
			class checkAir {};
			class checkGear {};
			class divingAirSetup {};
			class divoMeter {};
			class emergencyAscent {};
			class gasCalc {};
			class init {postInit = 1;};
			class initTissues {};
			class openDivoMeter {};
			class refillTank {};
			class setModuleSetting {};
		};
		
		class effects {
			file = "\ga_divoMeter\functions\effects";
			class DCSEffects {};
			class HeToxEffects {};
			class narcEffects {};
			class O2ToxEffects {};			
		};
	};
};
