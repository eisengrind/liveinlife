
class GVAR(input) {
    type = 2;
    style = 512;
    colorText[] = {0,0,0,0.87};
	colorDisabled[] = {0,0,0,0.2};
	colorSelection[] = {0,0,0,0.4};
	colorBackground[] = {0,0,0,0};
	font = "RobotoCondensedLight";
	autocomplete = "";
	sizeEx = 0.045;
	canModify = 1;
	forceDrawCaret = 0;
    onLoad = QUOTE([ARR_2(QQGVAR(input), _this)] call FUNC(onLoad));
    onSetFocus = QUOTE([ARR_2(QQGVAR(input), _this)] call FUNC(onSetFocus));
    onKillFocus = QUOTE([ARR_2(QQGVAR(input), _this)] call FUNC(onKillFocus));
};

class GVAR(input_underline) {
    type = 0;
    style = 0;
    font = "PuristaLight";
	colorBackground[] = {0.5490, 0.5490, 0.5490, 1};
	colorText[] = {1, 1, 1, 1};
	fixedWidth = 0;
	x = 0;
	y = 0;
	w = 0;
	h = "pixelH * 1";
	sizeEx = "pixelH * 1";
};

class GVAR(input_title) {
	type = 13;
	style = 0;
	font = "PuristaMedium";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	fixedWidth = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0.05;
	shadow = 0;
	size = 0.045;
	class Attributes {
		font = "PuristaMedium";
		color = "#FFFFFF";
		align = "left";
		valign = "middle";
		shadow = 0;
		shadowColor = "#000000";
		size = "1";
	};
};
