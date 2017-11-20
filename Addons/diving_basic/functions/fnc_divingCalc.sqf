#include "script_component.hpp"

//Starting vars
GVAR(selectedTank) = 1;
GVAR(switchTank) = true;
GVAR(airConsumption) = 0;
GVAR(ascTime) = 0;
GVAR(maxDepth) = 0;
GVAR(timeleft) = 0;
GVAR(diveTime) = 0;
GVAR(O2toxPercent) = 0;

//Narcosis Variables
GVAR(narcFactor) = 0;

//Decompresions Variables
GVAR(decoTime) = 0;
GVAR(depth2deco) = 0;
GVAR(depth2deepStop) = 0;
GVAR(deepStopTime) = 0;
GVAR(doDeco) = false;
GVAR(doDeepStop) = false;
GVAR(deepStopCeil) = 0;
GVAR(tisAval) = 0;
GVAR(tisBval) = 0;
GVAR(AscCeil) = 0;
GVAR(AscCeilA) = 0;
GVAR(AscCeilB) = 0;
GVAR(totalTis) = 0;

//Depth Variables
GVAR(depth) = 0;
GVAR(depthA) = 0;
GVAR(depthB) = 0;
GVAR(dDepth) = 0;
GVAR(upDepth) = 0;

//Pressure Variables
GVAR(pressure) = 0;
GVAR(pressureA) = 0;
GVAR(pressureB) = 0;

//Gas Variables
//O2
GVAR(oTot) = 0;
GVAR(oPercent) = 0;
GVAR(O2TisTot) = 0;
GVAR(pOAlv) = 0;
//N2
GVAR(nTot) = 0;
GVAR(nPercent) = 0;
GVAR(nTisTot) = 0;
GVAR(pNAlv) = 0;
//He
GVAR(HeTot) = 0;
GVAR(HeTisTot) = 0;
GVAR(pHeAlv) = 0;

GVAR(sacRT) = round (25 * (random [0.8,1,1.2]));


[{
	params ["_args","_handle"];
	if !(alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};

	diag_log format ["ED: Gear: %1, Metric: %2, Open: %3, Underwater: %4, Breathe: %5", GVAR(on), GVAR(metric), GVAR(open), ((eyePos player select 2) < 0), isAbleToBreathe player];
	if (GVAR(switchTank)) then {
		if !(isNil QGVAR(maxBar)) then {
			[] call FUNC(checkGear);
		};
		GVAR(switchTank) = false;
	};

	if (((eyePos player select 2) < 0) && GVAR(on)) then {
		if (isNil QGVAR(maxBar)) then {
			[] call FUNC(checkGear);
		};

		if (isNil QGVAR(maxBar)) exitWith {systemchat "The object you are wearing is not properly set up!";};

		GVAR(diveTime) = GVAR(diveTime) +1;
		GVAR(depth) = (abs ((getPosASL player) select 2)); //in meter
		GVAR(pressure) = ((GVAR(depth) /10) +1);
		GVAR(depth2deco) = GVAR(depth) - GVAR(AscCeil);
		GVAR(airConsumption) = (GVAR(pressure) * GVAR(sacRT));
		GVAR(filling) = (GVAR(filling) - (GVAR(airConsumption) /60));
		GVAR(timeleft) = (GVAR(filling) /(GVAR(airConsumption) /60));
		GVAR(depthB) = GVAR(depthA);
		GVAR(depthA) = (abs ((getPosASL player) select 2));
		GVAR(pressureA) = ((GVAR(depthA) /10) +1);
		GVAR(pressureB) = ((GVAR(depthB) /10) +1);
		GVAR(dDepth) = GVAR(depthA) - GVAR(depthB);
		GVAR(depth2deepStop) = GVAR(depth) - GVAR(deepStopCeil);
		GVAR(ObarPercent) = (GVAR(pOAlv)/ GVAR(maxppO)) *0.065;
		GVAR(HbarPercent) = (GVAR(pHeAlv) /8) *0.065;
		GVAR(NbarPercent) = (GVAR(nTisTot)/2.38) *0.24;
		GVAR(nTot) = [GVAR(pressure), GVAR(percentN2), 1600, GVAR(tempC), 28, GVAR(pNAlv)] call FUNC(gasCalc);
		GVAR(oTot) = [GVAR(pressure), GVAR(percentO2), 756.7, GVAR(tempC), 32, GVAR(pOAlv)] call FUNC(gasCalc);
		GVAR(HeTot) = [GVAR(pressure), GVAR(percentHe), 2865, GVAR(tempC), 8, GVAR(pHeAlv)] call FUNC(gasCalc);
		GVAR(totalTis) = GVAR(nTisTot) + GVAR(HeTisTot) + GVAR(O2TisTot);
		GVAR(pNAlv) = GVAR(percentN2) *(GVAR(pressure) - 0.0567);
		GVAR(pHeAlv) = GVAR(percentHe) *(GVAR(pressure) - 0.0567);
		GVAR(pOAlv) = GVAR(percentO2) *(GVAR(pressure) - 0.0567);
		GVAR(nPercent) = ((GVAR(nTot) /1000)/5) *100;
		GVAR(oPercent) = ((GVAR(oTot) /1000)/5) *100;
		GVAR(HePercent) = ((GVAR(HeTot) /1000)/5) *100;
		GVAR(narcFactor) = GVAR(pOAlv) + GVAR(pNAlv) +(0.23 *GVAR(pHeAlv));
		GVAR(eNdepth) = ((GVAR(narcFactor) -1) *10);

		//Risingrate
		if (GVAR(depthA) < GVAR(depthB)) then {
			GVAR(upDepth) = GVAR(depthA) - GVAR(depthB);
		}else{
			GVAR(upDepth) = 0;
		};

		//DCS effects
		if ((GVAR(dDepth) > 9.1) && (GVAR(maxDepth) > 20) && !(GVAR(dcsActive))) then {
			[]call FUNC(DCSEffects);
		};

		//Ceiling Calculation based on % of gasses present
		switch (true) do {
			case (GVAR(PercentN2) < 0.1): {
				GVAR(tisAval) = ((0.0346 *GVAR(HeTisTot)) +(1.382 * GVAR(O2TisTot))/ ((GVAR(HeAmt) *0.0346) + (GVAR(O2Amt) *1.382)));
				GVAR(tisBval) = ((0.02380 *GVAR(HeTisTot)) +(0.03186 * GVAR(O2TisTot)))/ ((GVAR(HeAmt) *0.02380) +(0.03186 * GVAR(O2Amt)));
				GVAR(AscCeilA) = (((GVAR(HeTisTot) + GVAR(O2TisTot)) - GVAR(tisAval)) * GVAR(tisBval)) *3.28;
				GVAR(AscCeilB) = (GVAR(AscCeilA) + GVAR(nTisTot) + GVAR(HeTisTot)) *2.6;
			};
			case (GVAR(PercentHe) < 0.1): {
				GVAR(tisAval) = ((1.37 *GVAR(nTisTot)) +(1.382 *GVAR(O2TisTot)))/ ((GVAR(N2Amt) *1.37) + (GVAR(O2Amt) *1.382));
				GVAR(tisBval) = ((0.03870 *GVAR(nTisTot)) +(0.03186 *GVAR(O2TisTot)))/ ((GVAR(N2Amt) *0.03870) +(0.03186 *GVAR(O2Amt)));
				GVAR(AscCeilA) = (((GVAR(nTisTot) +GVAR(O2TisTot)) -GVAR(tisAval)) *GVAR(tisBval)) *3.28;
				GVAR(AscCeilB) = (GVAR(AscCeilA) + GVAR(nTisTot) + GVAR(HeTisTot)) *2.6;
			};
			case ((GVAR(PercentO2) > 0.09) &&(GVAR(PercentHe) >= 0.1) && (GVAR(PercentN2) >= 0.1)): {
				GVAR(tisAval) = ((1.37 * GVAR(nTisTot)) +(0.0346 * GVAR(HeTisTot)))/ ((GVAR(N2Amt) *1.37) + (GVAR(HeAmt) * 0.0346));
				GVAR(tisBval) = ((0.03870 * GVAR(nTisTot)) +(0.02380 * GVAR(HeTisTot)))/ ((GVAR(N2Amt) * 0.03870) + (GVAR(HeAmt) * 0.02380));
				GVAR(AscCeilA) = (((GVAR(nTisTot) + GVAR(HeTisTot)) - GVAR(tisAval)) * GVAR(tisBval)) * 3.28;
				GVAR(AscCeilB) = GVAR(AscCeilA)  + 0.00001;
			};
		};


		//Controls for Ascent Ceiling Calculation.
		if (GVAR(percentHe) > 0) then {GVAR(HeAmt) = 1;}else {GVAR(HeAmt) = 0;};
		if (GVAR(percentN2) > 0) then {GVAR(N2Amt) = 1;}else {GVAR(N2Amt) = 0;};

		//Simulate Tissue Saturation
		switch (true) do {
			case (GVAR(depthA) < GVAR(depthB)): {GVAR(tempC) = GVAR(tempC) + (GVAR(dDepth) *0.0004);};
			case (GVAR(depthA) > GVAR(depthB)): {GVAR(tempC) = GVAR(tempC) - (GVAR(dDepth) *0.0004);};
		};

		GVAR(nTisTot) = [GVAR(percentN2), ((ln 2)/4), GVAR(pressure), ((GVAR(pressureB) - GVAR(pressureA))/60), GVAR(diveTime)] call FUNC(initTissues);
		GVAR(HeTisTot) = [GVAR(percentHe), ((ln 2)/4), GVAR(pressure), ((GVAR(pressureB) - GVAR(pressureA))/60), GVAR(diveTime)] call FUNC(initTissues);
		GVAR(O2TisTot) = [GVAR(percentO2), ((ln 2)/4), GVAR(pressure), ((GVAR(pressureB) - GVAR(pressureA))/60), GVAR(diveTime)] call FUNC(initTissues);

		//Calculate Max Depth so far
		if ((GVAR(depthB) > GVAR(depthA)) && (GVAR(maxDepth) < GVAR(depthB))) then {GVAR(maxDepth) = GVAR(depthB);};

		//Set Ascent Ceiling
		if ((GVAR(AscCeil) < GVAR(AscCeilB)) && !GVAR(doDeco)) then {GVAR(AscCeil) = (round(GVAR(AscCeilB) /10)) *10;};

		//Init Deco Profile
		if ((GVAR(AscCeil) == 10) && !GVAR(doDeco)) then {
			GVAR(decoTime) = GVAR(AscCeil) *(round(GVAR(totalTis) *4));
			GVAR(doDeco) = true;
		};

		if (GVAR(AscCeilB) > 10) then {
			GVAR(deepStopCeil) = GVAR(depth) /2;
			GVAR(deepStopTime) = GVAR(AscCeil) *(round(GVAR(totalTis) *3.5));
			GVAR(doDeepStop) = true;
		};

		// Start deco countdown once unit is with range
		if (GVAR(doDeco) && !(GVAR(depth2deco) > 3) && !(GVAR(depth2deco) < -3)) then {
			GVAR(decoTime) = GVAR(decoTime) - 1;
		};

		//Stop deco countdown and reset timer
		if(GVAR(decoTime) < 0) then {
			GVAR(decoTime) = 0;
			GVAR(AscCeil) = 0;
			GVAR(doDeco) = false;
		};

		// Start deep stop countdown once unit is with range
		if (GVAR(doDeepStop) && !(GVAR(depth2deepStop) > 3) && !(GVAR(depth2deepStop) < -3)) then {
			GVAR(deepStopTime) = GVAR(deepStopTime) - 1;
		};

		//Stop deep stop countdown and reset timer
		if(GVAR(deepStopTime) < 0) then {
			GVAR(deepStopTime) = 0;
			GVAR(deepStopCeil) = 0;
			GVAR(doDeepStop) = false;
		};

		//Narcotic Effects kick in if toxicity threshold passed.
		if (GVAR(narcFactor) > 8 && !(GVAR(narcActiv))) then {
			[] call FUNC(narcEffects);
		};

		//Check ppHe and init tox effects if surpassed
		if (GVAR(pHeAlv) > 8 && !(GVAR(heActive))) then {
			[] call FUNC(HeToxEffects);
		};

		//Calculate temperature change at depth
		if ((GVAR(depthA) > GVAR(depthB)) && (GVAR(dDepth) > 1)) then {
			GVAR(tempC) = GVAR(tempC) + (GVAR(dDepth) *0.0004);
		};

		//Calculate Asending Time
		if (GVAR(depth) >= 1) then {
			GVAR(ascTime) = ((GVAR(depth)/4) + GVAR(decoTime)) /60;
		};

		//if the asend time is greater than 99, set it to 99
		if ((round GVAR(ascTime)) >= 99) then {
			GVAR(ascTime) = 99;
		};

		//Check if player surpasses Maximum Operating Depth and init O2 Tox effects
		if (GVAR(depth) > (((GVAR(maxppO)/GVAR(percentO2)) -1) *10) && !(GVAR(o2Active))) then {
			[] call FUNC(O2ToxEffects);
		};

		//Running out of air results in big Problems
		if (GVAR(filling) <= 0) then {
			//player setStamina 0;
			//player setOxygenRemaining 0;
		}else{
			_container = format [QGVAR(DIVE_GAS%1), GVAR(selectedTank)];
			if (isNil "_obj") then {
				_value = (backpackContainer player) getVariable _container;
				if (isNil "_value") then {
					_value = (vestContainer player) getVariable _container;
				}else{
					_obj = (backpackContainer player);
				};
				if !(isNil "_value") exitWith {_obj = (vestContainer player);};
			};
			GVAR(bar) = GVAR(filling) / GVAR(tankSize);
			_obj setVariable [_container, [GVAR(bar), GVAR(percentO2), GVAR(percentN2), GVAR(percentHe)]];
		};
	};
}, 1, []] call CBA_fnc_addPerFrameHandler;
