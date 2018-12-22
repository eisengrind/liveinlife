#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(uri_scheme) = "https";
GVAR(uri_authority) = "api.example.com:80";

ADDON = true;
