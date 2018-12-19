BIN_CLIENT=@LiveInLifeClient
BIN_SERVER=@LiveInLifeServer
PREFIX_CLIENT=lilc
PREFIX_SERVER=lils
BUILD_PATH=.build
BUILDS_PATH=.builds
GIT_HASH=$(shell git describe --tag | sed "s/-.*-/-/")
FLAGS=-w unquoted-string -w redefinition-wo-undef

ifeq ($(OS), Windows_NT)
	ARMAKE = ./tools/armake_w64.exe
else
	ARMAKE = ./tools/armake
endif

all: $(patsubst $(BIN_CLIENT)/addons/%, $(BUILD_PATH)/$(BIN_CLIENT)/addons/$(PREFIX_CLIENT)_%.pbo, $(wildcard $(BIN_CLIENT)/addons/*)) \
	$(patsubst $(BIN_SERVER)/addons/%, $(BUILD_PATH)/$(BIN_SERVER)/addons/$(PREFIX_SERVER)_%.pbo, $(wildcard $(BIN_SERVER)/addons/*))

test_scripts:
	@echo "    TEST   @LiveInLifeClient/addons/"
	@sqflint -d @LiveInLifeClient/addons
	@echo "    TEST   @LiveInLifeServer/addons/"
	@sqflint -d @LiveInLifeServer/addons
	@echo "    TEST   LiveInLife.Tanoa/"
	@sqflint -d LiveInLife.Tanoa

test_configs:
	@echo "    TEST   Configs"
	@python3 tools/config_style_checker.py

$(BUILD_PATH)/$(BIN_CLIENT)/addons/$(PREFIX_CLIENT)_%.pbo: $(BIN_CLIENT)/addons/%
	@mkdir -p $(BUILD_PATH)/$(BIN_CLIENT)/addons
	@echo "    PBO   $@"
	@${ARMAKE} build $(FLAGS) -p -f -e "version=$(GIT_HASH)" $< $@

$(BUILD_PATH)/$(BIN_SERVER)/addons/$(PREFIX_SERVER)_%.pbo: $(BIN_SERVER)/addons/%
	@mkdir -p $(BUILD_PATH)/$(BIN_SERVER)/addons
	@echo "    PBO   $@"
	@${ARMAKE} build $(FLAGS) -p -f -e "version=$(GIT_HASH)" $< $@

$(BUILD_PATH)/keys/%.biprivatekey:
	@mkdir -p $(BUILD_PATH)/keys
	@echo "    KEY   $@"
	@${ARMAKE} keygen -f $(patsubst $(BUILD_PATH)/keys/%.biprivatekey, $(BUILD_PATH)/keys/%, $@)

$(BUILD_PATH)/$(BIN_CLIENT)/addons/$(PREFIX_CLIENT)_%.pbo.lil_$(GIT_HASH).bisign: $(BUILD_PATH)/$(BIN_CLIENT)/addons/$(PREFIX_CLIENT)_%.pbo $(BUILD_PATH)/keys/lil_$(GIT_HASH).biprivatekey
	@echo "    SIG   $@"
	@${ARMAKE} sign -f -s $@ $(BUILD_PATH)/keys/lil_$(GIT_HASH).biprivatekey $<

signatures: $(patsubst $(BIN_CLIENT)/addons/%, $(BUILD_PATH)/$(BIN_CLIENT)/addons/$(PREFIX_CLIENT)_%.pbo.lil_$(GIT_HASH).bisign, $(wildcard $(BIN_CLIENT)/addons/*))

clean:
	@echo "    CLEAN"
	@rm -Rf $(BUILD_PATH)
	@rm -Rf $(BUILDS_PATH)/$(GIT_HASH)

release: clean $(patsubst $(BIN_SERVER)/addons/%, $(BUILD_PATH)/$(BIN_SERVER)/addons/$(PREFIX_SERVER)_%.pbo, $(wildcard $(BIN_SERVER)/addons/*))
	@"$(MAKE)" $(MAKEFLAGS) signatures
	@mkdir -p $(BUILDS_PATH)/$(GIT_HASH)
	@echo "    CP   $(BUILD_PATH)/* to $(BUILDS_PATH)/$(GIT_HASH)"
	@cp -Rf $(BUILD_PATH)/$(BIN_CLIENT) $(BUILD_PATH)/$(BIN_SERVER) $(BUILD_PATH)/keys $(BUILDS_PATH)/$(GIT_HASH)/
