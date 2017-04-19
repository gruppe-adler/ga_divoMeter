//Starting vars
slb_airConsumption = 0;
slb_ascTime = 0;
slb_maxDepth = 0;
slb_timeleft = 0;
slb_diveTime = 0;
slb_O2toxPercent = 0;

//Toxicity Variables
slb_narcCntdn = 1;
slb_O2ToxCntdn = 1;
slb_HeToxCntdn = 1;
slb_fAscCntdn = 1;

//Narcosis Variables
slb_narcFactor = 0;

//Deco Variables
slb_decoTime = 0;
slb_depth2deco = 0;
slb_depth2deepStop = 0;
slb_deepStopTime = 0;
slb_doDeco = 0;
slb_doDeepStop = 0;
slb_deepStopCeil = 0;
slb_tisAval = 0;
slb_tisBval = 0;
slb_AscCeil = 0;
slb_AscCeilA = 0;
slb_AscCeilB = 0;
slb_totalTis = 0;

//Depth Variables
slb_depth = 0;
slb_depthA = 0;
slb_depthB = 0;
slb_dDepth = 0;

//Pressure Variables
slb_pressure = 0;
slb_pressureA = 0;
slb_pressureB = 0;

//Gas Variables
//O2
slb_oTot = 0;
slb_oPercent = 0;
slb_O2TisTot = 0;
slb_pOAlv = 0;
//N2
slb_nTot = 0;
slb_nPercent = 0;
slb_nTisTot = 0;
slb_pNAlv = 0;
//He
slb_HeTot = 0;
slb_HeTisTot = 0; 
slb_pHeAlv = 0;

slb_sacRT = round (25 * (random [0.8,1,1.2]));	
//if (isNil "MAXPPO") then {
	slb_maxpp0 = 1.1; 		
	slb_tempC = 25;
	/*
}else{
	slb_maxpp0 = MAXPPO; 		
	slb_tempC = TEMPC;
};
*/

[{
	params ["_args","_handle"];
	if !(alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};
	if ((underwater player) && DIVOMETERGEARON) then {	
		if (isNil "slb_bar") then {
			_value = [] call ga_divoMeter_fnc_checkGear;
			slb_tankSize = 10;
			slb_bar = 200;
			slb_percentO2 = 0.21;
			slb_percentN2 = 0.79;
			slb_percentHe = 0;
			//if (isNil "_value") exitWith {};
			diag_log format ["DivoMeter Value: %1", _value];
			_value params [ "tslb_ankSize", "slb_bar", "slb_percentO2", "slb_percentN2", "slb_percentHe"];
			slb_filling = slb_tankSize * slb_bar;
		};
		slb_diveTime = slb_diveTime + 1;
		slb_depth = (abs ((getPosASL player) select 2)); //in meter
		slb_pressure = ((slb_depth / 10) + 1);			
		slb_depth2deco = slb_depth - slb_AscCeil;
		slb_airConsumption = (slb_pressure * slb_sacRT);
		slb_filling = (slb_filling - (slb_airConsumption /60));
		slb_timeleft = ((slb_filling / slb_airConsumption) *60);
		slb_depthB = slb_depthA;
		slb_depthA = (abs ((getPosASL player) select 2));
		slb_pressureA = ((slb_depthA / 10) + 1);
		slb_pressureB = ((slb_depthB / 10) + 1);
		slb_dDepth = slb_depthA - slb_depthB;
		slb_depth2deepStop = slb_depth - slb_deepStopCeil;
		slb_ObarPercent = (slb_pOAlv/slb_maxppO) *0.065;
		slb_HbarPercent = (slb_pHeAlv/8) *0.065;
		slb_NbarPercent = (slb_nTisTot/2.38) * 0.24;			
		slb_nTot = [slb_pressure, slb_percentN2, 1600, slb_tempC, 28, slb_pNAlv] call ga_divoMeter_fnc_gasCalc;
		slb_oTot = [slb_pressure, slb_percentO2, 756.7, slb_tempC, 32, slb_pOAlv] call ga_divoMeter_fnc_gasCalc;
		slb_HeTot = [slb_pressure, slb_percentHe, 2865, slb_tempC, 8, slb_pHeAlv] call ga_divoMeter_fnc_gasCalc;
		slb_totalTis = slb_nTisTot + slb_HeTisTot + slb_O2TisTot;
		slb_pNAlv = slb_percentN2 *(slb_pressure - 0.0567);
		slb_pHeAlv = slb_percentHe *(slb_pressure - 0.0567);
		slb_pOAlv = slb_percentO2 *(slb_pressure - 0.0567);		
		slb_nPercent = ((slb_nTot /1000)/5) *100;
		slb_oPercent = ((slb_oTot /1000)/5) *100;
		slb_HePercent = ((slb_HeTot /1000)/5) *100;			
		slb_narcFactor = slb_pOAlv +slb_pNAlv +(0.23 *slb_pHeAlv);
		slb_eNdepth = ((slb_narcFactor -1) *10);

		if (slb_depthA < slb_depthB) then {
			slb_upDepth = slb_depthA - slb_depthB;
		}else{
			slb_upDepth = 0;
		};

		if (DIVOMETEROPEN) then {			
			disableSerialization;
			_displayUI = uiNamespace getVariable "slb_disp";
			//if (DIVOMETERMETRIC) then {
			(_displayUI displayCtrl 1111) ctrlSetText "M";
			(_displayUI displayCtrl 1113) ctrlSetText format["%1",(round(slb_depth *10))/10];
			(_displayUI displayCtrl 1120) ctrlSetText "BAR";
			(_displayUI displayCtrl 1122) ctrlSetText format["%1", round (slb_filling)];
			/*
			}else {
				(_displayUI displayCtrl 1111) ctrlSetText "FT";
				(_displayUI displayCtrl 1113) ctrlSetText format["%1",((round((slb_depth * 3.28) *10))/10)];
				(_displayUI displayCtrl 1120) ctrlSetText "PSI";
				(_displayUI displayCtrl 1122) ctrlSetText format["%1", slb_filling];
			};
			*/
			if (slb_doDeco == 1) then {
				(_displayUI displayCtrl 1112) ctrlSetText "DECO";
				if ((slb_doDeco == 1) && !(slb_depth2deco > 3) && !(slb_depth2deco < -3)) then {
					//(_displayUI displayCtrl 1120) ctrlSetText format["%1", slb_decoTime];
				};
			}else{
				(_displayUI displayCtrl 1112) ctrlSetText "NO DECO";
			};
			(_displayUI displayCtrl 1121) ctrlSetText "GTK";
			(_displayUI displayCtrl 1114) ctrlSetText format["%1",round (((slb_timeleft)+.01)/60)];
			(_displayUI displayCtrl 1119) ctrlSetText format["%1", (round(slb_percentO2 * 100))/100];
			
			switch (true) do {
				case (slb_doDeco == 1): {
				/*
					(_displayUI displayCtrl 1115) ctrlSetText "";
					(_displayUI displayCtrl 1116) ctrlSetText "";
					(_displayUI displayCtrl 1117) ctrlSetText "";
					(_displayUI displayCtrl 1118) ctrlSetText "";
					(_displayUI displayCtrl 1125) ctrlSetText "1125";
					(_displayUI displayCtrl 1126) ctrlSetText "1126";
					(_displayUI displayCtrl 1127) ctrlSetText "1127";
					(_displayUI displayCtrl 1130) ctrlSetText "ga_divoMeter\images\triangle_down_divider.paa";
					(_displayUI displayCtrl 1131) ctrlSetText "ga_divoMeter\images\triangle_up_divider.paa";
					*/
				};
				
				case (slb_doDeco == 0): {
				/*
					(_displayUI displayCtrl 1125) ctrlSetText "";
					(_displayUI displayCtrl 1126) ctrlSetText "";
					(_displayUI displayCtrl 1127) ctrlSetText "";
					(_displayUI displayCtrl 1130) ctrlSetText "";
					(_displayUI displayCtrl 1131) ctrlSetText "";
					*/
					(_displayUI displayCtrl 1115) ctrlSetText "TTS";
					(_displayUI displayCtrl 1116) ctrlSetText "DIVE-T";
					(_displayUI displayCtrl 1117) ctrlSetText format["%1", round (slb_ascTime)];
					(_displayUI displayCtrl 1118) ctrlSetText format["%1", round (((slb_diveTime)+.01)/60)];
				};
			};
			
			if (slb_upDepth <= 0.3) then {
				(_displayUI displayCtrl 1128) ctrlSetText "";
			}else {
				if (slb_upDepth >= 9) then {
					if ((ctrlText 1128) == "ga_divoMeter\images\left_06.paa")then {
						(_displayUI displayCtrl 1128) ctrlSetText "";
					}else{
						(_displayUI displayCtrl 1128) ctrlSetText "ga_divoMeter\images\left_06.paa";
					};
				}else{
					_getDivoMeterRiseTexture = {
						_riseIndex = { 
							if (_this < _x)  exitWith{_forEachIndex};
						}forEach [1.5, 3, 4.6, 6.1, 7.6, 9];   
						format[ "ga_divoMeter\images\left_0%1.paa", _riseIndex]; 
					}; 
					(_displayUI displayCtrl 1128) ctrlSetText (slb_upDepth call _getDivoMeterRiseTexture);
				};
			};
			
			if (slb_narcFactor >= 0.91) then {
				if ((ctrlText 1129) == "ga_divoMeter\images\right_09.paa")then {
					(_displayUI displayCtrl 1129) ctrlSetText "";
				}else{
					(_displayUI displayCtrl 1129) ctrlSetText "ga_divoMeter\images\right_09.paa";
				};
			}else {
				_getDivoMeterN2Texture = {
					_n2Index = { 
						if (_this < _x)  exitWith{_forEachIndex};
					}forEach [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];   
					format[ "ga_divoMeter\images\right_0%1.paa", _n2Index]; 
				}; 
				(_displayUI displayCtrl 1129) ctrlSetText (slb_narcFactor call _getDivoMeterN2Texture);
			};
			
			/*
			(_displayUI displayCtrl 1124) ctrlSetText "1124";
			(_displayUI displayCtrl 1125) ctrlSetText "1125";
			(_displayUI displayCtrl 1126) ctrlSetText "1126";
			(_displayUI displayCtrl 1127) ctrlSetText "1127";
			(_displayUI displayCtrl 1130) ctrlSetText "ga_divoMeter\images\triangle_down_divider.paa";
			(_displayUI displayCtrl 1131) ctrlSetText "ga_divoMeter\images\triangle_up_divider.paa";
			*/
		};
		
		diag_log format ["DM TisTot: %1, Perc: %2, Tot: %3, narcCnt: %4, narcFac: %5", slb_nTisTot, slb_nPercent, slb_nTot, slb_narcCntdn, slb_narcFactor];
		
		//DCS effects
		if (slb_dDepth > 9.1 && slb_maxDepth >= 20) then {						
			slb_fAscCntdn = slb_fAscCntdn - 1;					
			if (slb_fAscCntdn == 0) then {
				[(1-(slb_nTisTot *1.25))]call ga_divoMeter_fnc_DCSEffects;					
				slb_fAscCntdn = 5;
			};					
		}else {
			slb_fAscCntdn = 1;
		};			
			
		//Ceiling Calculation based on % of gasses present
		switch (true) do {
			case (slb_PercentN2 < 0.1): {
				slb_tisAval = ((0.0346 *slb_HeTisTot) +(1.382 *slb_O2TisTot))/ ((slb_HeAmt *0.0346) + (slb_O2Amt *1.382));
				slb_tisBval = ((0.02380 *slb_HeTisTot) +(0.03186 *slb_O2TisTot))/ ((slb_HeAmt *0.02380) +(0.03186 *slb_O2Amt));
				slb_AscCeilA = (((slb_HeTisTot +slb_O2TisTot) -slb_tisAval) *slb_tisBval) *3.28;
				slb_AscCeilB = (slb_AscCeilA + slb_nTisTot + slb_HeTisTot) *2.6;
			};					
			case (slb_PercentHe < 0.1): {
				slb_tisAval = ((1.37 *slb_nTisTot) +(1.382 *slb_O2TisTot))/ ((slb_N2Amt *1.37) + (slb_O2Amt *1.382));
				slb_tisBval = ((0.03870 *slb_nTisTot) +(0.03186 *slb_O2TisTot))/ ((slb_N2Amt *0.03870) +(0.03186 *slb_O2Amt));
				slb_AscCeilA = (((slb_nTisTot +slb_O2TisTot) -slb_tisAval) *slb_tisBval) *3.28;
				slb_AscCeilB = (slb_AscCeilA + slb_nTisTot + slb_HeTisTot) *2.6;
			};			
			case ((slb_PercentO2 > 0.09) &&(slb_PercentHe >= 0.1) &&(slb_PercentN2 >= 0.1)): {
				slb_tisAval = ((1.37 *slb_nTisTot) +(0.0346 *slb_HeTisTot))/ ((slb_N2Amt *1.37) + (slb_HeAmt *0.0346));
				slb_tisBval = ((0.03870 *slb_nTisTot) +(0.02380 *slb_HeTisTot))/ ((slb_N2Amt *0.03870) + (slb_HeAmt *0.02380));
				slb_AscCeilA = (((slb_nTisTot +slb_HeTisTot) -slb_tisAval) *slb_tisBval) *3.28;
				slb_AscCeilB = slb_AscCeilA  +0.00001;
			};
		};			
			
		//Controls for Ascent Ceiling Calculation.
		if (slb_percentHe > 0) then {slb_HeAmt = 1;}else {slb_HeAmt = 0;};
		if (slb_percentN2 > 0) then {slb_N2Amt = 1;}else {slb_N2Amt = 0;};			
		
		//Simulate Tissue Saturation
		switch (true) do {
			case (slb_depthA < slb_depthB): {slb_tempC = slb_tempC + (slb_dDepth *0.0004);};
			case (slb_depthA > slb_depthB): {slb_tempC = slb_tempC - (slb_dDepth *0.0004);};
		};	
		
		slb_nTisTot = [slb_percentN2, ((ln 2)/4), slb_pressure, ((slb_pressureB - slb_pressureA)/60), slb_diveTime] call ga_divoMeter_fnc_initTissues;
		slb_HeTisTot = [slb_percentHe, ((ln 2)/4), slb_pressure, ((slb_pressureB - slb_pressureA)/60), slb_diveTime] call ga_divoMeter_fnc_initTissues;
		slb_O2TisTot = [slb_percentO2, ((ln 2)/4), slb_pressure, ((slb_pressureB - slb_pressureA)/60), slb_diveTime] call ga_divoMeter_fnc_initTissues;
					
		//Calculate Max Depth so far
		if ((slb_depthB > slb_depthA) && (slb_maxDepth < slb_depthB)) then {slb_maxDepth = slb_depthB;};			
			
		//Set Ascent Ceiling			
		if ((slb_AscCeil < slb_AscCeilB) && (slb_doDeco == 0))then {slb_AscCeil = (round(slb_AscCeilB /10)) *10;};			
			
		//Init Deco Profile
		if((slb_AscCeil == 10) && (slb_doDeco == 0)) then {				
			slb_decoTime = slb_AscCeil *(round(slb_totalTis *4));				
			slb_doDeco = 1;
		};
			
		if((slb_AscCeilB > 10) && (slb_doDeepStop < 1)) then {				
			slb_deepStopCeil = slb_depth /2;				
			slb_deepStopTime = slb_AscCeil *(round(slb_totalTis *3.5));				
			slb_doDeepStop = 1;
		};
			
		// Start deco countdown once unit is with range
		if ((slb_doDeco == 1) && !(slb_depth2deco > 3) && !(slb_depth2deco < -3)) then {
			slb_decoTime = slb_decoTime - 1;
		};			
			
		//Stop deco countdown and reset timer
		if(slb_decoTime < 0) then {
			slb_decoTime = 0;
			slb_AscCeil = 0;
			slb_doDeco = 0;
		};
			
		// Start deep stop countdown once unit is with range
		if ((slb_doDeepStop == 1) && !(slb_depth2deepStop > 3) && !(slb_depth2deepStop < -3)) then {
			slb_deepStopTime = slb_deepStopTime - 1;
		};
			
		//Stop deep stop countdown and reset timer
		if(slb_deepStopTime < 0) then {
			slb_deepStopTime = 0;
			slb_deepStopCeil = 0;
			slb_doDeepStop = 0;	
		};
			
		//Narcotic Effects kick in if toxicity threshold passed.
		if (slb_narcFactor > 8) then {
			slb_narcCntdn = slb_narcCntdn - 1;					
			if (slb_narcCntdn == 0) then {
				[(slb_narcFactor/50)] call ga_divoMeter_fnc_narcEffects;					
			slb_narcCntdn = 33;
			};					
		}else {
			slb_narcCntdn = 1;
		};				
			
		//Check ppHe and init tox effects if surpassed
		if (slb_pHeAlv > 8) then {	
			slb_HeToxCntdn = slb_HeToxCntdn - 1;				
			if (slb_HeToxCntdn == 0) then {
				[] call ga_divoMeter_fnc_HeToxEffects;					
				slb_HeToxCntdn = 33;
			};				
		}else {
			slb_HeToxCntdn = 1;
		};
			
		//Calculate temperature change at depth					
		if ((slb_depthA > slb_depthB) && (slb_dDepth > 1)) then {
			slb_tempC = slb_tempC + (slb_dDepth *0.0004);
		};
		
		//Calculate Asending Time
		if (slb_depth >= 1) then {
			slb_ascTime = ((slb_depth/4) + slb_decoTime) /60;
		};
		
		//if the asend time is greater than 99, set it to 99
		if (round (slb_ascTime >= 99)) then {
			slb_ascTime = 99;
		};
		
		//Check if player surpasses Maximum Operating Depth and init O2 Tox effects			
		if (slb_depth > ((slb_maxppO/slb_percentO2) -1) *10) then {	
			slb_O2DamMult = slb_O2TisTot/6;
			slb_O2ToxCntdn = slb_O2ToxCntdn - 1;
			if (slb_O2ToxCntdn == 0) then {
				[slb_O2DamMult] call ga_divoMeter_fnc_O2ToxEffects;					
				slb_O2ToxCntdn = 33;
			};
		}else {
			slb_O2ToxCntdn = 1;
		};				
			
		//Running out of air results in big Problems
		if (slb_filling <= 0) then {
			player setStamina 0; 
			player setOxygenRemaining 0;
		}else{
			if (isNil "_obj") then {
				_value = (backpackContainer player) getVariable "Air";
				if (isNil "_value") then {
					_value = (vestContainer player) getVariable "Air";
				}else{
					_obj = (backpackContainer player);
				};
				if !(isNil "_value") exitWith {_obj = (vestContainer player);};
			};
			slb_bar = slb_filling / slb_tankSize;
			_obj setVariable ["Air", [slb_tankSize, slb_bar, slb_percentO2, slb_percentN2, slb_percentHe]];
		};		
	}else{
		if (DIVOMETEROPEN) then {				
			disableSerialization;
			_displayUI = uiNamespace getVariable "slb_disp";
			(_displayUI displayCtrl 1111) ctrlSetText "M";
			(_displayUI displayCtrl 1112) ctrlSetText "NO DECO";
			(_displayUI displayCtrl 1113) ctrlSetText format["%1",(round(((getPosASL player) select 2) *10))/10];
			(_displayUI displayCtrl 1114) ctrlSetText "--";
			/*
			(_displayUI displayCtrl 1115) ctrlSetText "TTS";
			(_displayUI displayCtrl 1116) ctrlSetText "DIVE-T";
			(_displayUI displayCtrl 1117) ctrlSetText "--";
			(_displayUI displayCtrl 1118) ctrlSetText "--";
			(_displayUI displayCtrl 1119) ctrlSetText "";
			*/
			(_displayUI displayCtrl 1120) ctrlSetText "BAR";
			(_displayUI displayCtrl 1121) ctrlSetText "GTK";
			if (!isNil "slb_filling" && slb_filling != 0) then {
				(_displayUI displayCtrl 1122) ctrlSetText format["%1", round (slb_filling)];
			}else {
				(_displayUI displayCtrl 1122) ctrlSetText "---";
			};
			(_displayUI displayCtrl 1123) ctrlSetText "--";
		};
	};			
}, 1, []] call CBA_fnc_addPerFrameHandler;
