params ["_bool"];

if (_bool) then {
	EDOPEN = true;
	disableSerialization;
	2 cutRsc ["slb_disp","PLAIN"];	
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
}else {
	EDOPEN = false;
	disableSerialization;
	2 cutText ["","PLAIN"];
};
