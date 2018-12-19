
#define IDD_create_profile 2000
#define IDD_loading_screen 2001
#define IDD_disabled_controls 2002

class RscButton;
class RscPicture;
class RscControlsGroup;
class RscListBox;
class RscCombo;

class GVAR(input) {
    type = 2;
    style = 512;
    colorText[] = {0,0,0,0.87};
    colorDisabled[] = {0,0,0,0.2};
    colorSelection[] = {0,0,0,0.4};
    colorBackground[] = {0,0,0,0};
    text = "";
    font = "RobotoCondensedLight";
    autocomplete = "";
    sizeEx = 0.045;
    canModify = 1;
    forceDrawCaret = 0;
};

class GVAR(input_line) {
    type = 0;
    style = 0;
    font = "PuristaLight";
    colorBackground[] = {RGBA_PRIMARY_COLOR_TEXT};
    colorText[] = {0,0,0,0};
    text = "";
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
    colorBackground[] = {0,0,0,0};
    colorText[] = {RGBA_PRIMARY_COLOR_TEXT};
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0.05;
    shadow = 0;
    size = 0.045;
    class Attributes {
        font = "PuristaMedium";
        align = "left";
        valign = "middle";
        shadow = 0;
        shadowColor = "#000000";
        size = "1";
    };
};

class GVAR(next_button) {
    type = 1;
    style = 2;
    borderSize = 0;
    colorBackground[] = {RGBA_PRIMARY_COLOR};
    colorBackgroundActive[] = {RGBA_PRIMARY_COLOR_DARK};
    colorBackgroundDisabled[] = {RGBA_PRIMARY_COLOR_DISABLED};
    colorBorder[] = {0,0,0,0};
    colorDisabled[] = {RGBA_PRIMARY_COLOR_DARK_DISABLED};
    colorFocused[] = {RGBA_PRIMARY_COLOR_TEXT};
    colorShadow[] = {0,0,0,0};
    colorText[] = {RGBA_PRIMARY_COLOR_TEXT};
    text = "";
    fade = 0;
    font = "RobotoCondensed";
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 0;
    sizeEx = 0.04;
    soundClick[] = {"", 0.1, 1};
    soundEnter[] = {"", 0.1, 1};
    soundEscape[] = {"", 0.1, 1};
    soundPush[] = {"", 0.1, 1};
    url = "";
};

class GVAR(checkbox) {
    type = 77;
    style = 0;
    checked = 0;
    color[] = {RGBA_PRIMARY_COLOR_TEXT};
    colorText[] = {RGBA_PRIMARY_COLOR_TEXT};
    colorBackground[] = {RGBA_VOID_COLOR_EMPTY};
    colorBackgroundDisabled[] = {RGBA_VOID_COLOR_EMPTY};
    colorBackgroundFocused[] = {RGBA_VOID_COLOR_EMPTY};
    colorBackgroundHover[] = {RGBA_VOID_COLOR_EMPTY};
    colorBackgroundPressed[] = {RGBA_VOID_COLOR_EMPTY};
    colorDisabled[] = {RGBA_PRIMARY_COLOR_DISABLED_TEXT};
    colorFocused[] = {RGBA_PRIMARY_COLOR_DARK_TEXT};
    colorHover[] = {RGBA_PRIMARY_COLOR_DARK_TEXT};
    colorPressed[] = {RGBA_PRIMARY_COLOR_DARK_TEXT};
    text = "";
    soundClick[] = {"", 0.1, 1};
    soundEnter[] = {"", 0.1, 1};
    soundEscape[] = {"", 0.1, 1};
    soundPush[] = {"", 0.1, 1};
    textureChecked = PATHTOF(data\ui\checkbox-checked.paa);
    textureDisabledChecked = PATHTOF(data\ui\checkbox-checked.paa);
    textureDisabledUnchecked = PATHTOF(data\ui\checkbox-unchecked.paa);
    textureFocusedChecked = PATHTOF(data\ui\checkbox-checked.paa);
    textureFocusedUnchecked = PATHTOF(data\ui\checkbox-unchecked.paa);
    textureHoverChecked = PATHTOF(data\ui\checkbox-checked.paa);
    textureHoverUnchecked = PATHTOF(data\ui\checkbox-unchecked.paa);
    texturePressedChecked = PATHTOF(data\ui\checkbox-checked.paa);
    texturePressedUnchecked = PATHTOF(data\ui\checkbox-unchecked.paa);
    textureUnchecked = PATHTOF(data\ui\checkbox-unchecked.paa);
};

class GVAR(title_center) {
    type = 0;
    style = 2;
    font = "RobotoCondensed";
    colorBackground[] = {RGBA_VOID_COLOR_EMPTY};
    colorText[] = {RGBA_PRIMARY_COLOR_TEXT};
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
};

class GVAR(title) : GVAR(title_center) {
    style = 0;
};

class GVAR(list) : RscListBox {
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
    colorBackground[] = {0,0,0,0};
    period = 0;
    rowHeight = 0.02;

    class ListScrollBar {
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
        border = "#(argb,8,8,3)color(1,1,1,0)";
        color[] = {1,1,1,1};
        colorActive[] = {0,0,0,0.87};
        colorDisabled[] = {0,0,0,0.2};
        thumb = PATHTOF(data\ui\thumb.paa);
    };
};

class GVAR(combo) : RscCombo {
    type = 4;
    style = 16;
    h = 0.05;
    wholeHeight = 0.5;
    color[] = {0,0,0,0};
    colorActive[] = {0,0,0,1};
    colorBackground[] = {1,1,1,0.87};
    colorDisabled[] = {0.2,0.2,0.2,0.87};
    colorScrollbar[] = {1,1,1,1};
    colorSelect[] = {0,0,0,0.87};
    colorSelect2Right[] = {0,0,0,1};
    colorSelectBackground[] = {1,1,1,0.87};
    colorSelectRight[] = {0,0,0,1};
    colorText[] = {0,0,0,0.87};
    colorTextRight[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0.033;
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1.0;
    rowHeight = 0.06;
    shadow = 0;
    arrowEmpty = PATHTOF(data\ui\arrow-down.paa);
    arrowFull = PATHTOF(data\ui\arrow-up.paa);
    border = "#(argb,8,8,3)color(1,1,1,0)";
    class ComboScrollBar {
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
        border = "#(argb,8,8,3)color(1,1,1,0)";
        color[] = {1, 1, 1, 1};
        colorDisabled[] = {0, 0, 0, 0};
        thumb = PATHTOF(data\ui\thumb.paa);
    };
};
