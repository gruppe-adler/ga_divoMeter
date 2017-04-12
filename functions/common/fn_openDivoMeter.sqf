params ["_bool"];

disableSerialization;
if (_bool) then {
	DIVOMETEROPEN = true;
	disableSerialization;
	2 cutRsc ["slb_disp","PLAIN"];
	//Main display elements				
	disableSerialization;
	_displayUI = uiNamespace getVariable "slb_disp";
	(_displayUI displayCtrl 1111) ctrlSetText "M";
	(_displayUI displayCtrl 1112) ctrlSetText "NO DECCO";
	(_displayUI displayCtrl 1113) ctrlSetText "255.9";
	(_displayUI displayCtrl 1114) ctrlSetText "99";
	(_displayUI displayCtrl 1115) ctrlSetText "TTS";
	/*
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
}else {
	DIVOMETEROPEN = false;
	disableSerialization;
	2 cutText ["","PLAIN"];
};
