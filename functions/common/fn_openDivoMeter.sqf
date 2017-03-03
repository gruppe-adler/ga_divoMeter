params ["_bool"];

disableSerialization;
if (_bool) then {
	DIVOMETEROPEN = true;
	2 cutRsc ["disp","PLAIN"];
}else {
	DIVOMETEROPEN = false;
	2 cutText ["","PLAIN"];
};
