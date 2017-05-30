params ["_bool"];

if (_bool) then {
	EDOPEN = true;
	disableSerialization;
	2 cutRsc ["slb_disp","PLAIN"];	
}else {
	EDOPEN = false;
	disableSerialization;
	2 cutText ["","PLAIN"];
};
