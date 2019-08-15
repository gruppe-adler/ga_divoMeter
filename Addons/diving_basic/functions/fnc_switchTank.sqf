#include "script_component.hpp"

switch (GVAR(selectedTank)) do {
    case 1 : {GVAR(selectedTank) = 2;};
    case 2 : {GVAR(selectedTank) = 1;};
};
GVAR(switchTank) = true;
