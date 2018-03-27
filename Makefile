
ARMAKE=$(abspath .build/bin/armake)
TAG=$(shell git describe --tag | sed "s/-.*-/-/")

all: removeAll \
	build_armake \
	client \
	server

deps:
	sudo apt-get install -y git bison flex libssl-dev python3

build_armake: prepare
	if [ ! -d .build/armake ]; then git clone https://github.com/jonpas/armake.git .build/armake ; \
		cd .build/armake \
		&& git checkout headerExtensions \
		&& make \
		&& cd ../../ \
		&& cp -f .build/armake/bin/armake .build/bin/ ; \
	fi

prepare:
	mkdir -p .build/keys
	mkdir -p .build/bin/
	mkdir -p .build/@LiveInLifeClient/addons
	mkdir -p .build/@LiveInLifeClient/keys
	mkdir -p .build/@LiveInLifeServer/addons
	mkdir -p .build/LiveInLife.Tanoa

test: prepare
	git clone https://github.com/TheMysteriousVincent/sqf.git .build/sqf
	python3 .build/sqf/sqflint.py -d @LiveInLifeClient/addons
	python3 .build/sqf/sqflint.py -d @LiveInLifeServer/addons
	python3 .build/sqf/sqflint.py -d LiveInLife.Tanoa
	python3 tools/config_style_checker.py

remove:
	rm -Rf .build/armake
	rm -Rf .build/bin
	rm -Rf .build/sqf

removeAll:
	rm -Rf .build/

createKey:
ifndef PRVKEYFILE
	cd .build/keys/ && $(ARMAKE) keygen -f lil_$(TAG)
	$(eval KEY := lil_$(TAG))
	$(eval PRVKEYFILE := .build/keys/$(KEY).biprivatekey)
endif

# LiveInLifeClient

client:	lilc_actions \
	lilc_animals \
	lilc_atcInterface \
	lilc_atm \
	lilc_bank \
	lilc_bikes \
	lilc_butcher \
	lilc_butt_inventory \
	lilc_cash \
	lilc_common \
	lilc_courthouse \
	lilc_crafting \
	lilc_economy \
	lilc_events \
	lilc_exchange \
	lilc_factions \
	lilc_factionsInterface \
	lilc_farming \
	lilc_ferrys \
	lilc_food \
	lilc_garage \
	lilc_hud \
	lilc_interaction \
	lilc_inventory \
	lilc_invoices \
	lilc_job_agent \
	lilc_keys \
	lilc_licenses \
	lilc_locker \
	lilc_log \
	lilc_login \
	lilc_marker_filter \
	lilc_medical \
	lilc_messages \
	lilc_meteorology \
	lilc_modules \
	lilc_packages \
	lilc_paycheck \
	lilc_pcard \
	lilc_pda \
	lilc_permissions \
	lilc_phones \
	lilc_picklock \
	lilc_prison \
	lilc_proofs \
	lilc_repair \
	lilc_respawn \
	lilc_shops \
	lilc_sitting \
	lilc_tags \
	lilc_tazer \
	lilc_textures \
	lilc_time \
	lilc_trade \
	lilc_transponder \
	lilc_ui \
	lilc_vehicles \
	lilc_viewDistance \
	lilc_virtualInventory \
	cpClientKey

lilc_actions: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\actions @LiveInLifeClient/addons/actions .build/@LiveInLifeClient/addons/$@.pbo

lilc_animals: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\animals @LiveInLifeClient/addons/animals .build/@LiveInLifeClient/addons/$@.pbo

lilc_atcInterface: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\atcInterface @LiveInLifeClient/addons/atcInterface .build/@LiveInLifeClient/addons/$@.pbo

lilc_atm: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\atm @LiveInLifeClient/addons/atm .build/@LiveInLifeClient/addons/$@.pbo

lilc_bank: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\bank @LiveInLifeClient/addons/bank .build/@LiveInLifeClient/addons/$@.pbo

lilc_bikes: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\bikes @LiveInLifeClient/addons/bikes .build/@LiveInLifeClient/addons/$@.pbo

lilc_butcher: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\butcher @LiveInLifeClient/addons/butcher .build/@LiveInLifeClient/addons/$@.pbo

lilc_butt_inventory: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\butt_inventory @LiveInLifeClient/addons/butt_inventory .build/@LiveInLifeClient/addons/$@.pbo

lilc_cash: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\cash @LiveInLifeClient/addons/cash .build/@LiveInLifeClient/addons/$@.pbo

lilc_common: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\common @LiveInLifeClient/addons/common .build/@LiveInLifeClient/addons/$@.pbo

lilc_courthouse: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\courthouse @LiveInLifeClient/addons/courthouse .build/@LiveInLifeClient/addons/$@.pbo

lilc_crafting: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\crafting @LiveInLifeClient/addons/crafting .build/@LiveInLifeClient/addons/$@.pbo

lilc_economy: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\economy @LiveInLifeClient/addons/economy .build/@LiveInLifeClient/addons/$@.pbo

lilc_events: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\events @LiveInLifeClient/addons/events .build/@LiveInLifeClient/addons/$@.pbo

lilc_exchange: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\exchange @LiveInLifeClient/addons/exchange .build/@LiveInLifeClient/addons/$@.pbo

lilc_factions: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\factions @LiveInLifeClient/addons/factions .build/@LiveInLifeClient/addons/$@.pbo

lilc_factionsInterface: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\factionsInterface @LiveInLifeClient/addons/factionsInterface .build/@LiveInLifeClient/addons/$@.pbo

lilc_farming: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\farming @LiveInLifeClient/addons/farming .build/@LiveInLifeClient/addons/$@.pbo

lilc_ferrys: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\ferrys @LiveInLifeClient/addons/ferrys .build/@LiveInLifeClient/addons/$@.pbo

lilc_food: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\food @LiveInLifeClient/addons/food .build/@LiveInLifeClient/addons/$@.pbo

lilc_garage: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\garage @LiveInLifeClient/addons/garage .build/@LiveInLifeClient/addons/$@.pbo

lilc_housing: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\housing @LiveInLifeClient/addons/housing .build/@LiveInLifeClient/addons/$@.pbo

lilc_hud: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\hud @LiveInLifeClient/addons/hud .build/@LiveInLifeClient/addons/$@.pbo

lilc_interaction: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\interaction @LiveInLifeClient/addons/interaction .build/@LiveInLifeClient/addons/$@.pbo

lilc_inventory: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\inventory @LiveInLifeClient/addons/inventory .build/@LiveInLifeClient/addons/$@.pbo

lilc_invoices: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\invoices @LiveInLifeClient/addons/invoices .build/@LiveInLifeClient/addons/$@.pbo

lilc_job_agent: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\job_agent @LiveInLifeClient/addons/job_agent .build/@LiveInLifeClient/addons/$@.pbo

lilc_keys: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\keys @LiveInLifeClient/addons/keys .build/@LiveInLifeClient/addons/$@.pbo

lilc_licenses: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\licenses @LiveInLifeClient/addons/licenses .build/@LiveInLifeClient/addons/$@.pbo

lilc_locker: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\locker @LiveInLifeClient/addons/locker .build/@LiveInLifeClient/addons/$@.pbo

lilc_log: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\log @LiveInLifeClient/addons/log .build/@LiveInLifeClient/addons/$@.pbo

lilc_login: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\login @LiveInLifeClient/addons/login .build/@LiveInLifeClient/addons/$@.pbo

lilc_marker_filter: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\marker_filter @LiveInLifeClient/addons/marker_filter .build/@LiveInLifeClient/addons/$@.pbo

lilc_medical: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\medical @LiveInLifeClient/addons/medical .build/@LiveInLifeClient/addons/$@.pbo

lilc_messages: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\messages @LiveInLifeClient/addons/messages .build/@LiveInLifeClient/addons/$@.pbo

lilc_meteorology: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\meteorology @LiveInLifeClient/addons/meteorology .build/@LiveInLifeClient/addons/$@.pbo

lilc_modules: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\modules @LiveInLifeClient/addons/modules .build/@LiveInLifeClient/addons/$@.pbo

lilc_packages: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\packages @LiveInLifeClient/addons/packages .build/@LiveInLifeClient/addons/$@.pbo

lilc_paycheck: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\paycheck @LiveInLifeClient/addons/paycheck .build/@LiveInLifeClient/addons/$@.pbo

lilc_pcard: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\pcard @LiveInLifeClient/addons/pcard .build/@LiveInLifeClient/addons/$@.pbo

lilc_pda: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\pda @LiveInLifeClient/addons/pda .build/@LiveInLifeClient/addons/$@.pbo

lilc_permissions: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\permissions @LiveInLifeClient/addons/permissions .build/@LiveInLifeClient/addons/$@.pbo

lilc_phones: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\phones @LiveInLifeClient/addons/phones .build/@LiveInLifeClient/addons/$@.pbo

lilc_picklock: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\picklock @LiveInLifeClient/addons/picklock .build/@LiveInLifeClient/addons/$@.pbo

lilc_placement: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\placement @LiveInLifeClient/addons/placement .build/@LiveInLifeClient/addons/$@.pbo

lilc_prison: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\prison @LiveInLifeClient/addons/prison .build/@LiveInLifeClient/addons/$@.pbo

lilc_proofs: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\proofs @LiveInLifeClient/addons/proofs .build/@LiveInLifeClient/addons/$@.pbo

lilc_repair: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\repair @LiveInLifeClient/addons/repair .build/@LiveInLifeClient/addons/$@.pbo

lilc_respawn: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\respawn @LiveInLifeClient/addons/respawn .build/@LiveInLifeClient/addons/$@.pbo

lilc_shops: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\shops @LiveInLifeClient/addons/shops .build/@LiveInLifeClient/addons/$@.pbo

lilc_sitting: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\sitting @LiveInLifeClient/addons/sitting .build/@LiveInLifeClient/addons/$@.pbo

lilc_tags: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\tags @LiveInLifeClient/addons/tags .build/@LiveInLifeClient/addons/$@.pbo

lilc_tazer: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\tazer @LiveInLifeClient/addons/tazer .build/@LiveInLifeClient/addons/$@.pbo

lilc_textures: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\textures @LiveInLifeClient/addons/textures .build/@LiveInLifeClient/addons/$@.pbo

lilc_time: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\time @LiveInLifeClient/addons/time .build/@LiveInLifeClient/addons/$@.pbo

lilc_trade: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\trade @LiveInLifeClient/addons/trade .build/@LiveInLifeClient/addons/$@.pbo

lilc_transponder: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\transponder @LiveInLifeClient/addons/transponder .build/@LiveInLifeClient/addons/$@.pbo

lilc_ui: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\ui @LiveInLifeClient/addons/ui .build/@LiveInLifeClient/addons/$@.pbo

lilc_vehicles: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\vehicles @LiveInLifeClient/addons/vehicles .build/@LiveInLifeClient/addons/$@.pbo

lilc_viewDistance: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\viewDistance @LiveInLifeClient/addons/viewDistance .build/@LiveInLifeClient/addons/$@.pbo

lilc_virtualInventory: build_armake createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\virtualInventory @LiveInLifeClient/addons/virtualInventory .build/@LiveInLifeClient/addons/$@.pbo

cpClientKey:
	cp .build/keys/$(KEY).bikey .build/@LiveInLifeClient/keys

# LiveInLifeServer

server: lils_animals \
	lils_atm \
	lils_bank \
	lils_butt_inventory \
	lils_cleanup \
	lils_common \
	lils_database \
	lils_economy \
	lils_events \
	lils_exchange \
	lils_factions \
	lils_factionsInterface \
	lils_garage \
	lils_inventory \
	lils_job_agent \
	lils_keys \
	lils_licenses \
	lils_locker \
	lils_login \
	lils_logs \
	lils_meteorology \
	lils_paycheck \
	lils_pcard \
	lils_pda \
	lils_permissions \
	lils_prison \
	lils_proofs \
	lils_shops \
	lils_vehicles \
	lils_virtualInventory

lils_animals: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\animals @LiveInLifeServer/addons/animals .build/@LiveInLifeServer/addons/$@.pbo

lils_atm: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\atm @LiveInLifeServer/addons/atm .build/@LiveInLifeServer/addons/$@.pbo

lils_bank: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\bank @LiveInLifeServer/addons/bank .build/@LiveInLifeServer/addons/$@.pbo

lils_butt_inventory: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\butt_inventory @LiveInLifeServer/addons/butt_inventory .build/@LiveInLifeServer/addons/$@.pbo

lils_cleanup: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\cleanup @LiveInLifeServer/addons/cleanup .build/@LiveInLifeServer/addons/$@.pbo

lils_common: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\common @LiveInLifeServer/addons/common .build/@LiveInLifeServer/addons/$@.pbo

lils_database: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\database @LiveInLifeServer/addons/database .build/@LiveInLifeServer/addons/$@.pbo

lils_economy: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\economy @LiveInLifeServer/addons/economy .build/@LiveInLifeServer/addons/$@.pbo

lils_events: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\events @LiveInLifeServer/addons/events .build/@LiveInLifeServer/addons/$@.pbo

lils_exchange: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\exchange @LiveInLifeServer/addons/exchange .build/@LiveInLifeServer/addons/$@.pbo

lils_factions: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\factions @LiveInLifeServer/addons/factions .build/@LiveInLifeServer/addons/$@.pbo

lils_factionsInterface: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\factionsInterface @LiveInLifeServer/addons/factionsInterface .build/@LiveInLifeServer/addons/$@.pbo

lils_garage: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\garage @LiveInLifeServer/addons/garage .build/@LiveInLifeServer/addons/$@.pbo

lils_inventory: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\inventory @LiveInLifeServer/addons/inventory .build/@LiveInLifeServer/addons/$@.pbo

lils_job_agent: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\job_agent @LiveInLifeServer/addons/job_agent .build/@LiveInLifeServer/addons/$@.pbo

lils_keys: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\keys @LiveInLifeServer/addons/keys .build/@LiveInLifeServer/addons/$@.pbo

lils_licenses: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\licenses @LiveInLifeServer/addons/licenses .build/@LiveInLifeServer/addons/$@.pbo

lils_locker: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\locker @LiveInLifeServer/addons/locker .build/@LiveInLifeServer/addons/$@.pbo

lils_login: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\login @LiveInLifeServer/addons/login .build/@LiveInLifeServer/addons/$@.pbo

lils_logs: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\logs @LiveInLifeServer/addons/logs .build/@LiveInLifeServer/addons/$@.pbo

lils_meteorology: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\meteorology @LiveInLifeServer/addons/meteorology .build/@LiveInLifeServer/addons/$@.pbo

lils_paycheck: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\paycheck @LiveInLifeServer/addons/paycheck .build/@LiveInLifeServer/addons/$@.pbo

lils_pcard: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\pcard @LiveInLifeServer/addons/pcard .build/@LiveInLifeServer/addons/$@.pbo

lils_pda: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\pda @LiveInLifeServer/addons/pda .build/@LiveInLifeServer/addons/$@.pbo

lils_permissions: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\permissions @LiveInLifeServer/addons/permissions .build/@LiveInLifeServer/addons/$@.pbo

lils_prison: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\prison @LiveInLifeServer/addons/prison .build/@LiveInLifeServer/addons/$@.pbo

lils_proofs: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\proofs @LiveInLifeServer/addons/proofs .build/@LiveInLifeServer/addons/$@.pbo

lils_shops: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\shops @LiveInLifeServer/addons/shops .build/@LiveInLifeServer/addons/$@.pbo

lils_vehicles: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\vehicles @LiveInLifeServer/addons/vehicles .build/@LiveInLifeServer/addons/$@.pbo

lils_virtualInventory: build_armake
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\virtualInventory @LiveInLifeServer/addons/virtualInventory .build/@LiveInLifeServer/addons/$@.pbo
