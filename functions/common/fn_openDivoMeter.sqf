params ["_bool"];

disableSerialization;
if (_bool) then {
	DIVOMETEROPEN = true;
	disableSerialization;
	2 cutRsc ["slb_disp","PLAIN"];
}else {
	DIVOMETEROPEN = false;
	disableSerialization;
	2 cutText ["","PLAIN"];
};
