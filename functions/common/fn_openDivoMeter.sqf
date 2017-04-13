params ["_bool"];

disableSerialization;
if (_bool) then {
	DIVOMETEROPEN = true;
	disableSerialization;
	2 cutRsc ["slb_disp","PLAIN"];			
	disableSerialization;
	_displayUI = uiNamespace getVariable "slb_disp";
	(_displayUI displayCtrl 1111) ctrlSetText "M";
	(_displayUI displayCtrl 1112) ctrlSetText "NO DECO";
	(_displayUI displayCtrl 1113) ctrlSetText "255.9";
	(_displayUI displayCtrl 1114) ctrlSetText "99";
	(_displayUI displayCtrl 1115) ctrlSetText "TTS";
	(_displayUI displayCtrl 1116) ctrlSetText "DIVE-T";
	/*
	(_displayUI displayCtrl 1117) ctrlSetText "99";
	(_displayUI displayCtrl 1118) ctrlSetText "99";
	(_displayUI displayCtrl 1119) ctrlSetText "TRIMAX 15/55";
	(_displayUI displayCtrl 1120) ctrlSetText "BAR";
	(_displayUI displayCtrl 1121) ctrlSetText "GTK";
	(_displayUI displayCtrl 1122) ctrlSetText "999";
	(_displayUI displayCtrl 1123) ctrlSetText "99";
	/*
	(_displayUI displayCtrl 1124) ctrlSetText "1124";
	(_displayUI displayCtrl 1125) ctrlSetText "1125";
	(_displayUI displayCtrl 1126) ctrlSetText "1126";
	(_displayUI displayCtrl 1127) ctrlSetText "1127";
	(_displayUI displayCtrl 1130) ctrlSetText "ga_divoMeter\images\triangle_down_divider.paa";
	(_displayUI displayCtrl 1131) ctrlSetText "ga_divoMeter\images\triangle_up_divider.paa";
	*/
	(_displayUI displayCtrl 1128) ctrlSetText "ga_divoMeter\images\left_06.paa";
	(_displayUI displayCtrl 1129) ctrlSetText "ga_divoMeter\images\right_09.paa";
}else {
	DIVOMETEROPEN = false;
	disableSerialization;
	2 cutText ["","PLAIN"];
};
