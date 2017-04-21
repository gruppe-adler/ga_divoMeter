params ["_bool"];

if (_bool) then {
	DIVOMETEROPEN = true;
	disableSerialization;
	2 cutRsc ["slb_disp","PLAIN"];	
	_displayUI = uiNamespace getVariable "slb_disp";	
	(_displayUI displayCtrl 1125) ctrlSetText "DEEP STOP";
	(_displayUI displayCtrl 1126) ctrlSetText "99";
	(_displayUI displayCtrl 1127) ctrlSetText "8:88";
	(_displayUI displayCtrl 1128) ctrlSetText "ga_divoMeter\images\left_06.paa";
	(_displayUI displayCtrl 1129) ctrlSetText "ga_divoMeter\images\right_09.paa";
	(_displayUI displayCtrl 1130) ctrlSetText "ga_divoMeter\images\triangle_up_divider.paa";
	(_displayUI displayCtrl 1131) ctrlSetText "ga_divoMeter\images\triangle_down_divider.paa";
	
}else {
	DIVOMETEROPEN = false;
	disableSerialization;
	2 cutText ["","PLAIN"];
};
