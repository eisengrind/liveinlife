#include "script_component.hpp"

ADDON = false;

GVAR(token) = "";
GVAR(refresh_token) = "";
GVAR(token_user_id) = 0;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;
