//if (!hasInterface) exitWith {};

//Starting vars
_airConsumption = 0;
_ascTime = 0;
_maxDepth = 0;
_timeleft = 0;
_diveTime = 0;
_O2toxPercent = 0;

//Animated Bar//Animated Bar
_ObarX = safeZoneX+(safeZoneW*0.845);
_ObarY = safeZoneY+(safeZoneH*0.645);
_ObarW = safeZoneW* 0.0001;
_ObarH = safeZoneH* 0.005;
_ObarPerc = 0;
_HbarX = safeZoneX+(safeZoneW*0.9178);
_HbarY = safeZoneY+(safeZoneH*0.645);
_HbarW = safeZoneW* 0.0001;
_HbarH = safeZoneH* 0.005;
_HbarPerc = 0;
_NbarX = safeZoneX+(safeZoneW*0.8455);
_NbarY = safeZoneY+(safeZoneH*0.46);
_NbarW = safeZoneW* 0.005;
_NbarH = safeZoneH* 0.0001;
_NbarPerc = 0;

//Toxicity Variables
_narcCntdn = 1;
_O2ToxCntdn = 1;
_HeToxCntdn = 1;
_fAscCntdn = 1;

//Narcosis Variables
_narcFactor = 0;
_narcEffectNeg = 0;

//Deco Variables
_decoTime = 0;
_depth2deco = 0;
_depth2deepStop = 0;
_deepStopTime = 0;
_diveCnt = 0;
_doDeco = 0;
_doDeepStop = 0;
_deepStopCeil = 0;
_tisAval = 0;
_tisBval = 0;
_AscCeil = 0;
_AscCeilA = 0;
_AscCeilB = 0;
_totalTis = 0;

//Depth Variables
_depth = 0;
_depthA = 0;
_depthB = 0;
_dDepth = 0;

//Pressure Variables
_pressure = 0;
_pressureA = 0;
_pressureB = 0;

//Gas Variables
//O2
_oTot = 0;
_oPercent = 0;
_O2TisTot = 0;
_pOAlv = 0;
//N2
_nTot = 0;
_nPercent = 0;
_nTisTot = 0;
_pNAlv = 0;
//He
_HeTot = 0;
_HeTisTot = 0; 
_pHeAlv = 0;


[{
	params ["_args","_handle"];
	if !(alive player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};
	diag_log format ["Diving Gar: %1, Underwater: %2", DIVOMETERGEARON, (underwater player)];
	if ((underwater player) && DIVOMETERGEARON) then {	
		if (isNil "_bar") then {
			_value = [] call ga_divoMeter_fnc_checkGear;
			if (isNil "_value") exitWith {};
			diag_log format ["DiavoMeter Value: %1", _value];
			_value params [ "_tankSize", "_bar", "_percentO2", "_percentN2", "_percentHe"];
		};
		_diveTime = _diveTime + 1;
		_depth = (abs ((getPosASL player) select 2)); //in meter
		_pressure = ((_depth / 10) + 1);			
		_depth2deco = _depth - _AscCeil;
		_airConsumption = (_pressure * _sacRT);
		_psi = (_psi - (_airConsumption /60));
		_timeleft = ((_psi / _airConsumption) *60);
		_depthA = (abs ((getPosASL player) select 2));
		_pressureA = ((_depthA / 10) + 1);
		_depth2deepStop = _depth - _deepStopCeil;
		_ObarPercent = (_pOAlv/_maxppO) *0.065;
		_HbarPercent = (_pHeAlv/8) *0.065;
		_NbarPercent = (_nTisTot/2.38) * 0.24;			
		_nTot = [_pressure, _percentN2, 1600, _tempC, 28, _pNAlv] call ga_divoMeter_fnc_gasCalc;
		_oTot = [_pressure, _percentO2, 756.7, _tempC, 32, _pOAlv] call ga_divoMeter_fnc_gasCalc;
		_HeTot = [_pressure, _percentHe, 2865, _tempC, 8, _pHeAlv] call ga_divoMeter_fnc_gasCalc;
		_totalTis = _nTisTot + _HeTisTot + _O2TisTot;
		_pNAlv = _percentN2 *(_pressure - 0.0567);
		_pHeAlv = _percentHe *(_pressure - 0.0567);
		_pOAlv = _percentO2 *(_pressure - 0.0567);		
		_nPercent = ((_nTot /1000)/5) *100;
		_oPercent = ((_oTot /1000)/5) *100;
		_HePercent = ((_HeTot /1000)/5) *100;			
		_narcFactor = _pOAlv +_pNAlv +(0.23 *_pHeAlv);
		_eNdepth = ((_narcFactor -1) *10);		
		_narcEffectNeg = 1 -(_narcFactor /10);			
		diag_log format ["DivoMeterOpen: %1", DIVOMETEROPEN];
		if (DIVOMETEROPEN) then {
			//Main display elements				
			disableSerialization;
			_displayUI = uiNamespace getVariable "slb_disp";
			/*
			(_displayUI displayCtrl 1111) ctrlSetText "1111";
			(_displayUI displayCtrl 1112) ctrlSetText "1112";
			(_displayUI displayCtrl 1113) ctrlSetText "1113";
			(_displayUI displayCtrl 1114) ctrlSetText "1114";
			(_displayUI displayCtrl 1115) ctrlSetText "1115";
			(_displayUI displayCtrl 1116) ctrlSetText "1116";
			(_displayUI displayCtrl 1117) ctrlSetText "1117";
			(_displayUI displayCtrl 1118) ctrlSetText "1118";
			(_displayUI displayCtrl 1119) ctrlSetText "1119";
			(_displayUI displayCtrl 1120) ctrlSetText "1120";
			(_displayUI displayCtrl 1121) ctrlSetText "1121";
			(_displayUI displayCtrl 1122) ctrlSetText "1122";
			(_displayUI displayCtrl 1123) ctrlSetText "1123";
			(_displayUI displayCtrl 1124) ctrlSetText "1124";
			(_displayUI displayCtrl 1125) ctrlSetText "1125";
			(_displayUI displayCtrl 1126) ctrlSetText "1126";
			*/
			(_displayUI displayCtrl 1127) ctrlSetText "ga_divoMeter\images\left_06.paa";
			(_displayUI displayCtrl 1128) ctrlSetText "ga_divoMeter\images\right_09.paa";
			
			
			//if (DIVOMETERMETRIC) then {
			/*(_displayUI displayCtrl 1111) ctrlSetText "M";
			(_displayUI displayCtrl 1113) ctrlSetText format["%1",(round(_depth *10))/10];
			(_displayUI displayCtrl 1120) ctrlSetText "BAR";
			(_displayUI displayCtrl 1121) ctrlSetText format["%1", _psi];
			}else {
				(_displayUI displayCtrl 1111) ctrlSetText "FT";
				(_displayUI displayCtrl 1113) ctrlSetText format["%1",((round((_depth * 3.28) *10))/10)];
				(_displayUI displayCtrl 1120) ctrlSetText "PSI";
				(_displayUI displayCtrl 1121) ctrlSetText format["%1", _psi];
			};
			(_displayUI displayCtrl 1118) ctrlSetText format["%1",((_diveTime)+.01)/60];
			(_displayUI displayCtrl 1122) ctrlSetText format["%1",((_timeleft)+.01)/60];
				
			//Display elements for tissue saturation	
			if (_nTisTot <= 2.38) then {
				_getDivoMeterTexture = {
					_tisIndex = { 
						if (_this <= _x)  exitWith(_x);
					}forEach [0.44, 0.66, 0.88, 1.1, 1.32, 1.54, 1.96, 2.15, 2.38];   
					format[ "ga_divoMeter\images\tis_%1.paa", _tisIndex]; 
				}; 
				(_displayUI displayCtrl 1124) ctrlSetText (_nTisTot call _getDivoMeterTexture);
			}else {	
				(_displayUI displayCtrl 1124) ctrlSetText "ga_divoMeter\images\tis_9.paa";	
			};
				
			//Display for PPO2			
			switch (true)do {
				case ((_Obarpercent > 0.059) && (_ObarPercent < 0.079)): {(_displayUI displayCtrl 1134) ctrlSetBackgroundColor [1, 1, 0, 0.5];};	
				case ((_ObarPercent > 0.079) && (_ObarPercent < 0.119)): {(_displayUI displayCtrl 1134) ctrlSetBackgroundColor [1, 0.4, 0, 0.5];};	
				case (_ObarPercent > 0.119): {				
					_ObarPercent = 0.119;
					(_displayUI displayCtrl 1134) ctrlSetBackgroundColor [1, 0, 0, 0.5];
				};
			};
			
			//Display for He			
			switch (true)do {
				case ((_HbarPercent > 0.059) && (_HbarPercent < 0.079)): {(_displayUI displayCtrl 1135) ctrlSetBackgroundColor [1, 1, 0, 0.5];};		
				case ((_HbarPercent > 0.079) && (_HbarPercent < 0.118)): {(_displayUI displayCtrl 1135) ctrlSetBackgroundColor [1, 0.4, 0, 0.5];};			
				case (_HbarPercent > 0.118): {				
					_HbarPercent = 0.118;
					(_displayUI displayCtrl 1135) ctrlSetBackgroundColor [1, 0, 0, 0.5];
				};
			};
			*/
		};
			
		//Display element for ascent warning and init DCS effects
		if (_dDepth > 8) then {						
			_fAscCntdn = _fAscCntdn - 1;					
			if (_fAscCntdn == 0) then {
				[true, true, (1-(_nTisTot *1.25))]call ga_divoMeter_fnc_DCSEffects;					
				_fAscCntdn = 5;
			};					
		}else {
			_fAscCntdn = 1;
		};			
			
		//Ceiling Calculation based on % of gasses present
		switch (true) do {
			case (_PercentN2 < 0.1): {
				_tisAval = ((0.0346 *_HeTisTot) +(1.382 *_O2TisTot))/ ((_HeAmt *0.0346) + (_O2Amt *1.382));
				_tisBval = ((0.02380 *_HeTisTot) +(0.03186 *_O2TisTot))/ ((_HeAmt *0.02380) +(0.03186 *_O2Amt));
				_AscCeilA = (((_HeTisTot +_O2TisTot) -_tisAval) *_tisBval) *3.28;
				_AscCeilB = (_AscCeilA + _nTisTot + _HeTisTot) *2.6;
			};					
			case (_PercentHe < 0.1): {
				_tisAval = ((1.37 *_nTisTot) +(1.382 *_O2TisTot))/ ((_N2Amt *1.37) + (_O2Amt *1.382));
				_tisBval = ((0.03870 *_nTisTot) +(0.03186 *_O2TisTot))/ ((_N2Amt *0.03870) +(0.03186 *_O2Amt));
				_AscCeilA = (((_nTisTot +_O2TisTot) -_tisAval) *_tisBval) *3.28;
				_AscCeilB = (_AscCeilA + _nTisTot + _HeTisTot) *2.6;
			};			
			case ((_PercentO2 > 0.09) &&(_PercentHe >= 0.1) &&(_PercentN2 >= 0.1)): {
				_tisAval = ((1.37 *_nTisTot) +(0.0346 *_HeTisTot))/ ((_N2Amt *1.37) + (_HeAmt *0.0346));
				_tisBval = ((0.03870 *_nTisTot) +(0.02380 *_HeTisTot))/ ((_N2Amt *0.03870) + (_HeAmt *0.02380));
				_AscCeilA = (((_nTisTot +_HeTisTot) -_tisAval) *_tisBval) *3.28;
				_AscCeilB = _AscCeilA  +0.00001;
			};
		};			
			
		//Controls for Ascent Ceiling Calculation.
		if (_percentHe > 0) then {_HeAmt = 1;}else {_HeAmt = 0;};
		if (_percentN2 > 0) then {_N2Amt = 1;}else {_N2Amt = 0;};			
			
		_depthB = (abs ((getPosASL player) select 2));
		_pressureB = ((_depthB / 10) + 1);		
		_dDepth = _depthA - _depthB;			
		
		//Simulate Tissue Saturation
		switch (true) do {
			case (_depthA < _depthB): {_tempC = _tempC + (_dDepth *0.0004);};
			case (_depthA > _depthB): {_tempC = _tempC - (_dDepth *0.0004);};
		};	
		
		_nTisTot = [_percentN2, ((ln 2)/4), _pressure, ((_pressureB - _pressureA)/60), _diveTime] call ga_divoMeter_fnc_initTissues;
		_HeTisTot = [_percentHe, ((ln 2)/4), _pressure, ((_pressureB - _pressureA)/60), _diveTime] call ga_divoMeter_fnc_initTissues;
		_O2TisTot = [_percentO2, ((ln 2)/4), _pressure, ((_pressureB - _pressureA)/60), _diveTime] call ga_divoMeter_fnc_initTissues;
					
		//Calculate Max Depth so far
		if ((_depthB > _depthA) && (_maxDepth < _depthB)) then {_maxDepth = _depthB;};			
			
		//Set Ascent Ceiling			
		if ((_AscCeil < _AscCeilB) && (_doDeco == 0))then {_AscCeil = (round(_AscCeilB /10)) *10;};			
			
		//Init Deco Profile
		if((_AscCeil == 10) && (_doDeco == 0)) then {				
			_decoTime = _AscCeil *(round(_totalTis *4));				
			_doDeco = 1;
			_diveCnt = _diveCnt - 1;
		};
			
		if((_AscCeilB > 10) && (_doDeepStop < 1)) then {				
			_deepStopCeil = _depth /2;				
			_deepStopTime = _AscCeil *(round(_totalTis *3.5));				
			_doDeepStop = 1;
		};
			
		// Start deco countdown once unit is with range
		if ((_doDeco == 1) && !(_depth2deco > 3) && !(_depth2deco < -3)) then {
			_decoTime = _decoTime - 1;
		};			
			
		//Stop deco countdown and reset timer
		if(_decoTime < 0) then {
			_decoTime = 0;
			_AscCeil = 0;
			_doDeco = 0;
		};
			
		// Start deep stop countdown once unit is with range
		if ((_doDeepStop == 1) && !(_depth2deepStop > 3) && !(_depth2deepStop < -3)) then {
			_deepStopTime = _deepStopTime - 1;
		};
			
		//Stop deep stop countdown and reset timer
		if(_deepStopTime < 0) then {
			_deepStopTime = 0;
			_deepStopCeil = 0;
			_doDeepStop = 0;	
		};
			
		//Narcotic Effects kick in if toxicity threshold passed.
		if (_narcFactor > 8) then {
			_narcCntdn = _narcCntdn - 1;					
			if (_narcCntdn == 0) then {
				[true, true, (_narcFactor/50)] call ga_divoMeter_fnc_narcEffects;					
			_narcCntdn = 33;
			};					
		}else {
			_narcCntdn = 1;
		};				
			
		//Check ppHe and init tox effects if surpassed
		if (_pHeAlv > 8) then {	
			_HeToxCntdn = _HeToxCntdn - 1;				
			if (_HeToxCntdn == 0) then {
				[true, true] call ga_divoMeter_fnc_HeToxEffects;					
				_HeToxCntdn = 33;
			};				
		}else {
			_HeToxCntdn = 1;
		};
			
		//Calculate ascending time and temperature change at depth					
		if ((_depthA > _depthB) && (_dDepth > 1)) then {
			_ascTime = _depth / _dDepth;
			_tempC = _tempC + (_dDepth *0.0004);
		}else {
			_ascTime = 0;
		};
		
		//Check if player surpasses Maximum Operating Depth and init O2 Tox effects			
		if (_depth > ((_maxppO/_percentO2) -1) *10) then {	
			_O2DamMult = _O2TisTot/6;
			_O2ToxCntdn = _O2ToxCntdn - 1;
			if (_O2ToxCntdn == 0) then {
				[true, true, _O2DamMult] call ga_divoMeter_fnc_O2ToxEffects;					
				_O2ToxCntdn = 33;
			};
		}else {
			_O2ToxCntdn = 1;
		};				
		
		//Prevent huge numbers from clogging diaplay
		if(_ascTime > 6000) then { _ascTime = 0;};
			
		//Running out of air results in big Problems
		if (_psi <= 0) then {
			PSI = 0;
			player setStamina 0; 
			player setOxygenRemaining 0;
		}else{
			PSI = _psi;
		};		
	}else{
		if (DIVOMETEROPEN) then {
			//Main display elements				
			disableSerialization;
			_displayUI = uiNamespace getVariable "slb_disp";
		};
	};
	_diveCnt = 0;			
}, 1, []] call CBA_fnc_addPerFrameHandler;
