 # Enhanced Diving
 ## Work In Progress!
 
 ## Features
 - Diving Computer
 - Fast Asend in case of Emergency
 - Rebreather for Diving
 - Effects for Decompression Illness, Nitrogen Narcosis, 02/Helium Toxicity
 - Refill or replacement of gases in tanks
 - Support for 12 different [gas mixtures](https://en.wikipedia.org/wiki/Breathing_gas#Common_diving_breathing_gases) :
 
*Gas*				| *O2*			| *N2*			| *HE*   	| *Depth (m)*     
--------------------------------|-----------------------|-----------------------|---------------|--------------------
Air 				| 21% 			| 79%			| 0%		| 0 - 40		
EAN32 				| 32% 			| 68% 			| 0%		| 0 - 40		
Heliox 21 			| 21% 			| 0% 			| 79%		| 100 - 500		
Heliox 28 			| 28% 			| 0% 			| 72%		| 100 - 500		
Helitrox			| 26% 			| 57% 			| 17%		| 10 - 100		
Hypoxic				| 10% 			| 50% 			| 44%		| 10 - 100		
Nitrox I 			| 32% 			| 68% 			| 0%		| 0 - 40		
Nitrox II 			| 36% 			| 64% 			| 0% 		| 0 - 40		
Normoxic			| 19% 			| 30% 			| 51%		| 30 - 60		
Oxygen 				| 100%			| 0% 			| 0%		| 0 - 4
Trimax 				| 10% 			| 40% 			| 50%		| 30 - 60		
Trimax 15/55 			| 15% 			| 30% 			| 55%		| 30 - 60		
 	
 ## Usage	
 The mod will be activ when you put on one of these vests: V_GRAD_DivingTank_Blk, V_GRAD_DivingTank_Oli, V_GRAD_DivingTank_Rgr
 The diving computer can be opend using the Ace Selfinteraction.
 To add the RefillMenu to an Objekt, add this in the init: `[_this] call grad_enhancedDiving_addRefillMenu;`
 
 ## Dependencies
 These addons are required to run this mod:
 
    - [CBA](https://github.com/CBATeam/CBA_A3/releases)
    - [ACE](https://github.com/acemod/ACE3/releases)
 	
 ## Credits
 
 This mod is based on Divier Stats from trin scourge.
 
 - Coding: Salbei
 - 2D: Nomisum
 - 3D: Salbei
 
Spezial thanks go to Gruppe Adler for helping me create this mod
