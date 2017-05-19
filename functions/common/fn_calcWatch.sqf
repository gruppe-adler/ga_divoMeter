params ["_maxpp0", "_tempC"];

//Starting vars
grad_selectedTank = 1;
grad_switchTank = false; 
grad_airConsumption = 0;
grad_ascTime = 0;
grad_maxDepth = 0;
grad_timeleft = 0;
grad_diveTime = 0;
grad_O2toxPercent = 0;
grad_maxpp0 = _maxpp0;
grad_tempC = _tempC;

//Toxicity Variables
grad_narcCntdn = 1;
grad_O2ToxCntdn = 1;
grad_HeToxCntdn = 1;
grad_fAscCntdn = 1;

//Narcosis Variables
grad_narcFactor = 0;

//Deco Variables
grad_decoTime = 0;
grad_depth2deco = 0;
grad_depth2deepStop = 0;
grad_deepStopTime = 0;
grad_doDeco = 0;
grad_deepStopCeil = 0;
grad_tisAval = 0;
grad_tisBval = 0;
grad_AscCeil = 0;
grad_AscCeilA = 0;
grad_AscCeilB = 0;
grad_totalTis = 0;

//Depth Variables
grad_depth = 0;
grad_depthA = 0;
grad_depthB = 0;
grad_dDepth = 0;

//Pressure Variables
grad_pressure = 0;
grad_pressureA = 0;
grad_pressureB = 0;

//Gas Variables
//O2
grad_oTot = 0;
grad_oPercent = 0;
grad_O2TisTot = 0;
grad_pOAlv = 0;
//N2
grad_nTot = 0;
grad_nPercent = 0;
grad_nTisTot = 0;
grad_pNAlv = 0;
//He
grad_HeTot = 0;
grad_HeTisTot = 0; 
grad_pHeAlv = 0;

grad_sacRT = round (25 * (random [0.8,1,1.2]));	

[{
	params ["_args","_handle"];
	if !(alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};
	
	if (grad_switchTank) then {
		if !(isNil "grad_maxBar") then {
			_value = [] call grad_enhancedDiving_fnc_checkGear;
			_value params ["grad_bar", "grad_percentO2", "grad_percentN2", "grad_percentHe"];
			_class = format ["grad_enhancedDiving_gasClass1", grad_selectedTank];
			_maxBar = format ["grad_enhancedDiving_maxBar1", grad_selectedTank];
			
			_tankSize = getNumber (configFile >> "CfgVehicles" >> _obj >> _class);
			grad_maxBar = getNumber (configFile >> "CfgVehicles" >> _obj >> _maxBar);
			grad_filling = _tankSize * grad_bar;
		};
		grad_switchTank = false;
	};
	
	if ((underwater player) && EDGEARON) then {	
		if (isNil "grad_maxBar") then {
			_value = [] call grad_enhancedDiving_fnc_checkGear;
			if (isNil "_value") exitWith {};
			diag_log format ["enhancedDiving Value: %1", _value];
			_value params ["grad_bar", "grad_percentO2", "grad_percentN2", "grad_percentHe"];
			_class = format ["grad_enhancedDiving_gasClass1", grad_selectedTank];
			_maxBar = format ["grad_enhancedDiving_maxBar1", grad_selectedTank];
			
			_tankSize = getNumber (configFile >> "CfgVehicles" >> _obj >> _class);
			grad_maxBar = getNumber (configFile >> "CfgVehicles" >> _obj >> _maxBar);
			grad_filling = _tankSize * grad_bar
		};
		
		if (isNil "grad_maxBar") exitWith {};
		
		grad_diveTime = grad_diveTime + 1;
		grad_depth = (abs ((getPosASL player) select 2)); //in meter
		grad_pressure = ((grad_depth / 10) + 1);			
		grad_depth2deco = grad_depth - grad_AscCeil;
		grad_airConsumption = (grad_pressure * grad_sacRT);
		grad_filling = (grad_filling - (grad_airConsumption /60));
		grad_timeleft = ((grad_filling / grad_airConsumption) *60);
		grad_depthB = grad_depthA;
		grad_depthA = (abs ((getPosASL player) select 2));
		grad_pressureA = ((grad_depthA / 10) + 1);
		grad_pressureB = ((grad_depthB / 10) + 1);
		grad_dDepth = grad_depthA - grad_depthB;
		grad_depth2deepStop = grad_depth - grad_deepStopCeil;
		grad_ObarPercent = (grad_pOAlv/grad_maxppO) *0.065;
		grad_HbarPercent = (grad_pHeAlv/8) *0.065;
		grad_NbarPercent = (grad_nTisTot/2.38) * 0.24;			
		grad_nTot = [grad_pressure, grad_percentN2, 1600, grad_tempC, 28, grad_pNAlv] call grad_enhancedDiving_fnc_gasCalc;
		grad_oTot = [grad_pressure, grad_percentO2, 756.7, grad_tempC, 32, grad_pOAlv] call grad_enhancedDiving_fnc_gasCalc;
		grad_HeTot = [grad_pressure, grad_percentHe, 2865, grad_tempC, 8, grad_pHeAlv] call grad_enhancedDiving_fnc_gasCalc;
		grad_totalTis = grad_nTisTot + grad_HeTisTot + grad_O2TisTot;
		grad_pNAlv = grad_percentN2 *(grad_pressure - 0.0567);
		grad_pHeAlv = grad_percentHe *(grad_pressure - 0.0567);
		grad_pOAlv = grad_percentO2 *(grad_pressure - 0.0567);		
		grad_nPercent = ((grad_nTot /1000)/5) *100;
		grad_oPercent = ((grad_oTot /1000)/5) *100;
		grad_HePercent = ((grad_HeTot /1000)/5) *100;			
		grad_narcFactor = grad_pOAlv +grad_pNAlv +(0.23 *grad_pHeAlv);
		grad_eNdepth = ((grad_narcFactor -1) *10);

		if (grad_depthA < grad_depthB) then {
			grad_upDepth = grad_depthA - grad_depthB;
		}else{
			grad_upDepth = 0;
		};

		if (EDOPEN) then {
		// if (visibleWatch && EDWATCHON) then {
			disableSerialization;
			_displayUI = uiNamespace getVariable "grad_disp";
			
			if (EDMETRIC) then {
			(_displayUI displayCtrl 1111) ctrlSetText "M";
			(_displayUI displayCtrl 1113) ctrlSetText format["%1",(round(grad_depth *10))/10];
			(_displayUI displayCtrl 1120) ctrlSetText "BAR";
			(_displayUI displayCtrl 1122) ctrlSetText format["%1", round (grad_filling)];
			}else {
				(_displayUI displayCtrl 1111) ctrlSetText "FT";
				(_displayUI displayCtrl 1113) ctrlSetText format["%1",((round((grad_depth * 3.28) *10))/10)];
				(_displayUI displayCtrl 1120) ctrlSetText "PSI";
				(_displayUI displayCtrl 1122) ctrlSetText format["%1", grad_filling];
			};
			
			if (grad_doDeco == 1) then {
				(_displayUI displayCtrl 1112) ctrlSetText "DECO";
				if ((grad_doDeco == 1) && !(grad_depth2deco > 3) && !(grad_depth2deco < -3)) then {
					(_displayUI displayCtrl 1120) ctrlSetText format["%1", grad_decoTime];
				};
			}else{
				(_displayUI displayCtrl 1112) ctrlSetText "NO DECO";
			};
			(_displayUI displayCtrl 1121) ctrlSetText "GTK";
			(_displayUI displayCtrl 1114) ctrlSetText format["%1", round (((grad_timeleft) + .01)/60)];
			(_displayUI displayCtrl 1119) ctrlSetText format["%1", (round (grad_percentO2 * 100))/100];
			
			switch (true) do {
				case (!grad_doDeco): {
					(_displayUI displayCtrl 1125) ctrlSetText "";
					(_displayUI displayCtrl 1126) ctrlSetText "";
					(_displayUI displayCtrl 1127) ctrlSetText "";
					(_displayUI displayCtrl 1130) ctrlSetText "";
					(_displayUI displayCtrl 1131) ctrlSetText "";
					(_displayUI displayCtrl 1115) ctrlSetText "TTS";
					(_displayUI displayCtrl 1116) ctrlSetText "DIVE-T";
					(_displayUI displayCtrl 1117) ctrlSetText format["%1", round (grad_ascTime)];
					(_displayUI displayCtrl 1118) ctrlSetText format["%1", round (((grad_diveTime)+.01)/60)];
				};
				case (grad_doDeco && !(grad_depth2deco < - 6) && !(grad_depth2deco > 6)): {
					(_displayUI displayCtrl 1115) ctrlSetText "";
					(_displayUI displayCtrl 1116) ctrlSetText "";
					(_displayUI displayCtrl 1117) ctrlSetText "";
					(_displayUI displayCtrl 1118) ctrlSetText "";
					(_displayUI displayCtrl 1125) ctrlSetText "DECO STOP";
					(_displayUI displayCtrl 1126) ctrlSetText format ["%1M", grad_depth2deco];
					(_displayUI displayCtrl 1127) ctrlSetText format ["%1", grad_deepStopTime];
					(_displayUI displayCtrl 1130) ctrlSetText "grad_enhancedDiving\images\triangle_down_divider.paa";
					(_displayUI displayCtrl 1131) ctrlSetText "grad_enhancedDiving\images\triangle_up_divider.paa";
				};
				case (grad_doDeepStop && !(grad_depth2deepStop < - 6) && !(grad_depth2deepStop > 6)): {
					(_displayUI displayCtrl 1124) ctrlSetText "";
					(_displayUI displayCtrl 1125) ctrlSetText "DEEP STOP";
					(_displayUI displayCtrl 1126) ctrlSetText format ["%1M", grad_depth2deepStop];
					(_displayUI displayCtrl 1127) ctrlSetText format ["%1", grad_deepStopTime];
					
					switch (true) do {
						case (grad_depth2deepStop > 1.5) : {
									if ((ctrlText 1131) == "grad_enhancedDiving\images\triangle_down_divider.paa") then {
										(_displayUI displayCtrl 1130) ctrlSetText "";
										(_displayUI displayCtrl 1131) ctrlSetText "";
									}else{
										(_displayUI displayCtrl 1130) ctrlSetText "";
										(_displayUI displayCtrl 1131) ctrlSetText "grad_enhancedDiving\images\triangle_down_divider.paa";
									};
								};
						case (grad_depth2deepStop < -1.5) : {
									if ((ctrlText 1131) == "grad_enhancedDiving\images\triangle_up_divider.paa") then {
										(_displayUI displayCtrl 1130) ctrlSetText "";
										(_displayUI displayCtrl 1131) ctrlSetText "";
									}else{
										(_displayUI displayCtrl 1130) ctrlSetText "grad_enhancedDiving\images\triangle_up_divider.paa";
										(_displayUI displayCtrl 1131) ctrlSetText "";
									};
								};
						case (grad_depth2deepStop < 1.5 && grad_depth2deepStop > -1.5) : {
									(_displayUI displayCtrl 1130) ctrlSetText "grad_enhancedDiving\images\triangle_up_divider.paa";
									(_displayUI displayCtrl 1131) ctrlSetText "grad_enhancedDiving\images\triangle_down_divider.paa";
								};
					};
					
				};
			};
			
			if (grad_upDepth <= 0.3) then {
				(_displayUI displayCtrl 1128) ctrlSetText "";
			}else {
				if (grad_upDepth >= 9) then {
					if ((ctrlText 1128) == "grad_enhancedDiving\images\left_06.paa")then {
						(_displayUI displayCtrl 1128) ctrlSetText "";
					}else{
						(_displayUI displayCtrl 1128) ctrlSetText "grad_enhancedDiving\images\left_06.paa";
					};
				}else{
					_getenhancedDivingRiseTexture = {
						_riseIndex = { 
							if (_this < _x)  exitWith{_forEachIndex};
						}forEach [1.5, 3, 4.6, 6.1, 7.6, 9];   
						format[ "grad_enhancedDiving\images\left_0%1.paa", _riseIndex]; 
					}; 
					(_displayUI displayCtrl 1128) ctrlSetText (grad_upDepth call _getenhancedDivingRiseTexture);
				};
			};
			
			if (grad_narcFactor >= 0.91) then {
				if ((ctrlText 1129) == "grad_enhancedDiving\images\right_09.paa")then {
					(_displayUI displayCtrl 1129) ctrlSetText "";
				}else{
					(_displayUI displayCtrl 1129) ctrlSetText "grad_enhancedDiving\images\right_09.paa";
				};
			}else {
				_getenhancedDivingN2Texture = {
					_n2Index = { 
						if (_this < _x)  exitWith{_forEachIndex};
					}forEach [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];   
					format[ "grad_enhancedDiving\images\right_0%1.paa", _n2Index]; 
				}; 
				(_displayUI displayCtrl 1129) ctrlSetText (grad_narcFactor call _getenhancedDivingN2Texture);
			};
			
			(_displayUI displayCtrl 1132) ctrlSetText format ["%1", grad_selectedTank];
		};
		
		diag_log format ["DM TisTot: %1, Perc: %2, Tot: %3, narcCnt: %4, narcFac: %5", grad_nTisTot, grad_nPercent, grad_nTot, grad_narcCntdn, grad_narcFactor];
		
		//DCS effects
		if (grad_dDepth > 9.1 && grad_maxDepth >= 20) then {						
			grad_fAscCntdn = grad_fAscCntdn - 1;					
			if (grad_fAscCntdn == 0) then {
				[(1-(grad_nTisTot *1.25))]call grad_enhancedDiving_fnc_DCSEffects;					
				grad_fAscCntdn = 5;
			};					
		}else {
			grad_fAscCntdn = 1;
		};			
			
		//Ceiling Calculation based on % of gasses present
		switch (true) do {
			case (grad_PercentN2 < 0.1): {
				grad_tisAval = ((0.0346 *grad_HeTisTot) +(1.382 *grad_O2TisTot))/ ((grad_HeAmt *0.0346) + (grad_O2Amt *1.382));
				grad_tisBval = ((0.02380 *grad_HeTisTot) +(0.03186 *grad_O2TisTot))/ ((grad_HeAmt *0.02380) +(0.03186 *grad_O2Amt));
				grad_AscCeilA = (((grad_HeTisTot +grad_O2TisTot) -grad_tisAval) *grad_tisBval) *3.28;
				grad_AscCeilB = (grad_AscCeilA + grad_nTisTot + grad_HeTisTot) *2.6;
			};					
			case (grad_PercentHe < 0.1): {
				grad_tisAval = ((1.37 *grad_nTisTot) +(1.382 *grad_O2TisTot))/ ((grad_N2Amt *1.37) + (grad_O2Amt *1.382));
				grad_tisBval = ((0.03870 *grad_nTisTot) +(0.03186 *grad_O2TisTot))/ ((grad_N2Amt *0.03870) +(0.03186 *grad_O2Amt));
				grad_AscCeilA = (((grad_nTisTot +grad_O2TisTot) -grad_tisAval) *grad_tisBval) *3.28;
				grad_AscCeilB = (grad_AscCeilA + grad_nTisTot + grad_HeTisTot) *2.6;
			};			
			case ((grad_PercentO2 > 0.09) &&(grad_PercentHe >= 0.1) &&(grad_PercentN2 >= 0.1)): {
				grad_tisAval = ((1.37 *grad_nTisTot) +(0.0346 *grad_HeTisTot))/ ((grad_N2Amt *1.37) + (grad_HeAmt *0.0346));
				grad_tisBval = ((0.03870 *grad_nTisTot) +(0.02380 *grad_HeTisTot))/ ((grad_N2Amt *0.03870) + (grad_HeAmt *0.02380));
				grad_AscCeilA = (((grad_nTisTot +grad_HeTisTot) -grad_tisAval) *grad_tisBval) *3.28;
				grad_AscCeilB = grad_AscCeilA  +0.00001;
			};
		};			
			
		//Controls for Ascent Ceiling Calculation.
		if (grad_percentHe > 0) then {grad_HeAmt = 1;}else {grad_HeAmt = 0;};
		if (grad_percentN2 > 0) then {grad_N2Amt = 1;}else {grad_N2Amt = 0;};			
		
		//Simulate Tissue Saturation
		switch (true) do {
			case (grad_depthA < grad_depthB): {grad_tempC = grad_tempC + (grad_dDepth *0.0004);};
			case (grad_depthA > grad_depthB): {grad_tempC = grad_tempC - (grad_dDepth *0.0004);};
		};	
		
		grad_nTisTot = [grad_percentN2, ((ln 2)/4), grad_pressure, ((grad_pressureB - grad_pressureA)/60), grad_diveTime] call grad_enhancedDiving_fnc_initTissues;
		grad_HeTisTot = [grad_percentHe, ((ln 2)/4), grad_pressure, ((grad_pressureB - grad_pressureA)/60), grad_diveTime] call grad_enhancedDiving_fnc_initTissues;
		grad_O2TisTot = [grad_percentO2, ((ln 2)/4), grad_pressure, ((grad_pressureB - grad_pressureA)/60), grad_diveTime] call grad_enhancedDiving_fnc_initTissues;
					
		//Calculate Max Depth so far
		if ((grad_depthB > grad_depthA) && (grad_maxDepth < grad_depthB)) then {grad_maxDepth = grad_depthB;};			
			
		//Set Ascent Ceiling			
		if ((grad_AscCeil < grad_AscCeilB) && !grad_doDeco)then {grad_AscCeil = (round(grad_AscCeilB /10)) *10;};			
			
		//Init Deco Profile
		if((grad_AscCeil == 10) && (grad_doDeco == 0)) then {				
			grad_decoTime = grad_AscCeil *(round(grad_totalTis *4));				
			grad_doDeco = true;
		};
			
		if((grad_AscCeilB > 10)) then {				
			grad_deepStopCeil = grad_depth /2;				
			grad_deepStopTime = grad_AscCeil *(round(grad_totalTis *3.5));				
			grad_doDeepStop = true;
		};
			
		// Start deco countdown once unit is with range
		if (grad_doDeco && !(grad_depth2deco > 3) && !(grad_depth2deco < -3)) then {
			grad_decoTime = grad_decoTime - 1;
		};			
			
		//Stop deco countdown and reset timer
		if(grad_decoTime < 0) then {
			grad_decoTime = 0;
			grad_AscCeil = 0;
			grad_doDeco = false;
		};
			
		// Start deep stop countdown once unit is with range
		if (grad_doDeepStop && !(grad_depth2deepStop > 3) && !(grad_depth2deepStop < -3)) then {
			grad_deepStopTime = grad_deepStopTime - 1;
		};
			
		//Stop deep stop countdown and reset timer
		if(grad_deepStopTime < 0) then {
			grad_deepStopTime = 0;
			grad_deepStopCeil = 0;
			grad_doDeepStop = false;			
		};
			
		//Narcotic Effects kick in if toxicity threshold passed.
		if (grad_narcFactor > 8) then {
			grad_narcCntdn = grad_narcCntdn - 1;					
			if (grad_narcCntdn == 0) then {
				[(grad_narcFactor/50)] call grad_enhancedDiving_fnc_narcEffects;					
			grad_narcCntdn = 33;
			};					
		}else {
			grad_narcCntdn = 1;
		};				
			
		//Check ppHe and init tox effects if surpassed
		if (grad_pHeAlv > 8) then {	
			grad_HeToxCntdn = grad_HeToxCntdn - 1;				
			if (grad_HeToxCntdn == 0) then {
				[] call grad_enhancedDiving_fnc_HeToxEffects;					
				grad_HeToxCntdn = 33;
			};				
		}else {
			grad_HeToxCntdn = 1;
		};
			
		//Calculate temperature change at depth					
		if ((grad_depthA > grad_depthB) && (grad_dDepth > 1)) then {
			grad_tempC = grad_tempC + (grad_dDepth *0.0004);
		};
		
		//Calculate Asending Time
		if (grad_depth >= 1) then {
			grad_ascTime = ((grad_depth/4) + grad_decoTime) /60;
		};
		
		//if the asend time is greater than 99, set it to 99
		if (round (grad_ascTime >= 99)) then {
			grad_ascTime = 99;
		};
		
		//Check if player surpasses Maximum Operating Depth and init O2 Tox effects			
		if (grad_depth > ((grad_maxppO/grad_percentO2) -1) *10) then {	
			grad_O2DamMult = grad_O2TisTot/6;
			grad_O2ToxCntdn = grad_O2ToxCntdn - 1;
			if (grad_O2ToxCntdn == 0) then {
				[grad_O2DamMult] call grad_enhancedDiving_fnc_O2ToxEffects;					
				grad_O2ToxCntdn = 33;
			};
		}else {
			grad_O2ToxCntdn = 1;
		};				
			
		//Running out of air results in big Problems
		if (grad_filling <= 0) then {
			player setStamina 0; 
			player setOxygenRemaining 0;
		}else{
			_container = format ["GRAD_DIVE_GAS%1", grad_selectedTank];
			if (isNil "_obj") then {
				_value = (backpackContainer player) getVariable _container;
				if (isNil "_value") then {
					_value = (vestContainer player) getVariable _container;
				}else{
					_obj = (backpackContainer player);
				};
				if !(isNil "_value") exitWith {_obj = (vestContainer player);};
			};
			grad_bar = grad_filling / grad_tankSize;
			_obj setVariable [_container, [grad_bar, grad_percentO2, grad_percentN2, grad_percentHe]];
		};			
	}else{
		if (EDOPEN) then {				
			disableSerialization;
			_displayUI = uiNamespace getVariable "grad_disp";
			(_displayUI displayCtrl 1111) ctrlSetText "M";
			(_displayUI displayCtrl 1112) ctrlSetText "NO DECO";
			(_displayUI displayCtrl 1113) ctrlSetText format["%1",(round(((getPosASL player) select 2) *10))/10];
			(_displayUI displayCtrl 1114) ctrlSetText "--";
			(_displayUI displayCtrl 1115) ctrlSetText "TTS";
			(_displayUI displayCtrl 1116) ctrlSetText "DIVE-T";
			(_displayUI displayCtrl 1117) ctrlSetText "--";
			(_displayUI displayCtrl 1118) ctrlSetText "--";
			(_displayUI displayCtrl 1119) ctrlSetText "";
			(_displayUI displayCtrl 1120) ctrlSetText "BAR";
			(_displayUI displayCtrl 1121) ctrlSetText "GTK";
			if (!isNil "grad_filling" && grad_filling != 0) then {
				(_displayUI displayCtrl 1122) ctrlSetText format["%1", round (grad_filling)];
			}else {
				(_displayUI displayCtrl 1122) ctrlSetText "---";
			};
			(_displayUI displayCtrl 1123) ctrlSetText "--";
		};
	};	
}, 1, []] call CBA_fnc_addPerFrameHandler;
