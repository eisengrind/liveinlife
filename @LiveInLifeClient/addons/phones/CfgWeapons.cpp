
#include "tfar\radio_ids.cpp"

class lilci_item;
class lilci_itemInfo;

class ItemRadio;
class lilci_cellphone_F : ItemRadio {
    displayName = "Generic® Cellphone";
	model = "\A3\weapons_F\ammo\mag_univ.p3d";
    picture = "\x\lilc\addons\phones\icons\cellphone.paa";
    tf_prototype = 1;
    tf_range = 500000;
    tf_dialog = "";
    tf_encryptionCode = "lilc_phones_encryption";
    tf_dialogUpdate = "";
    tf_subtype = "digital";
    tf_parent = "lilci_cellphone_F";
    tf_additional_channel = 4;
};
TF_RADIO_IDS(lilci_cellphone_F, Generic® Cellphone)

class lilci_smartphone_F : ItemRadio {
    displayName = "Generic® Smartphone";
	model = "\A3\weapons_F\ammo\mag_univ.p3d";
    picture = "\x\lilc\addons\phones\icons\smartphone.paa";
    tf_prototype = 1;
    tf_range = 500000;
    tf_dialog = "";
    tf_encryptionCode = "lilc_phones_encryption";
    tf_dialogUpdate = "";
    tf_subtype = "digital";
    tf_parent = "lilci_smartphone_F";
    tf_additional_channel = 1;
};
TF_RADIO_IDS(lilci_smartphone_F, Generic® Smartphone)

class lilci_fatPad_F : ItemRadio {
    displayName = "Fat TouchPad Sense";
	model = "\A3\weapons_F\ammo\mag_univ.p3d";
    picture = "\x\lilc\addons\phones\icons\fatPad.paa";
};
