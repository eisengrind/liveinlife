
#define REQ_IS_OK(var1) (if (isNil {var1}) then {false} else {((var1) select (1))==200})
