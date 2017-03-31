params ["_bool"];

disableSerialization;
if (_bool) then {
	DIVOMETEROPEN = true;
	
}else {
	DIVOMETEROPEN = false;
	
};
