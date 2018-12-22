#include "..\script_component.hpp"

try {
    if (isNull (findDisplay 602)) throw false;
    throw true;
} catch {
    _exception;
};
