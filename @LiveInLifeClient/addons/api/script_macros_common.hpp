
#define REQ_GET_BODY(var1) ((var1) select 0)
#define REQ_GET_STATUS(var1) ((var1) select 1)
#define REQ_IS_OK(var1) (if (isNil {var1}) then {false} else {REQ_GET_STATUS(var1)==200})
