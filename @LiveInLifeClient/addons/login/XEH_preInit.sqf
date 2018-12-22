#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(male_faces) = [];
GVAR(female_faces) = [];
GVAR(unitID) = 0;
GVAR(profileID) = 0;
GVAR(camera) = objNull;

ADDON = true;
