#include "script_component.hpp"

private ["_gSol", "_gG", "_gMv", "_gMol", "_gTot"];
params ["_gPressure", "_gConc", "_boyleConst", "_gTemp", "_gMol", "_gAta"];

_gSol = (_gAta /_boyleConst) *_gMol;
_gG = (_gSol - 0.0137) /_gMol;
_gMv = (_gG *0.0821 *(_gTemp + 273.15)) *1000;
_gTot = _gMv *3.1248;

_gTot;
