private ["_gTisTot", "_pgAlv", "_rGAmb", "_gtisConst"];
params ["_percG", "_gtisK", "_gPressure", "_gdPressure", "_gdiveTime"];

_pgAlv = _percG *(_gPressure - 0.0567);
_rGAmb = ((_gdPressure /60) *_percG);
_gtisConst = (-_gtisK *(_gdiveTime/60));
_gTisTot = _pgAlv + _rGAmb *((_gdiveTime/60) -(1/_gtisK)) - (_pgAlv -0.736 - (_rGAmb/_gtisK)) *exp (_gtisConst);

_gTisTot

