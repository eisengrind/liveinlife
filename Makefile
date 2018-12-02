ARMAKE=$(abspath tools/armake)
TAG=$(shell git describe --tag | sed "s/-.*-/-/")
PUBLISHER=$(abspath .build/bin/go-swp)

deploy: all
	rm -Rf .builds/$(TAG)/
	mkdir -p .builds/$(TAG)/
	cp -Rf .build/@LiveInLifeClient/ .builds/$(TAG)/
	cp -Rf .build/@LiveInLifeServer/ .builds/$(TAG)/
	cp -Rf .build/keys/ .builds/$(TAG)/

all: removeAll \
	prepare \
	client \
	server \
	removeAll

pack: pack_client pack_server

pack_client:
	tar -czf lil-client.tar.gz .builds/$(TAG)/@LiveInLifeClient
	zip -r lil-client.zip .builds/$(TAG)/@LiveInLifeClient

pack_server:
	tar -czf lil-server.tar.gz .builds/$(TAG)/@LiveInLifeServer
	zip -r lil-server.zip .builds/$(TAG)/@LiveInLifeServer

prepare_publish:
	mkdir -p .build/swp/
	wget -P .build/ https://github.com/playnet-public/go-swp/releases/download/v1.0/go-swp-linux-amd64.tar.gz
	tar -xzf .build/go-swp-linux-amd64.tar.gz -C .build/bin/
	rm -f .build/go-swp-linux-amd64.tar.gz

publish_test: publish_client_test publish_server_test

publish_client_test: deploy prepare_publish
	$(PUBLISHER) --steamuser $(STEAM_USER) \
		--steampass $(STEAM_PASS) \
		--appID 107410 \
		--changenote "" \
		--contentFolder ".builds/$(TAG)/@LiveInLifeClient/" \
		--descriptionBBCodeFile ".steam/LiveInLifeTestClient/description.bbcode" \
		--previewFile ".steam/LiveInLifeTestClient/preview.jpg" \
		--publishedFileID 1346078494 \
		--title "LiveInLife Test (Client)" \
		--visibility 1

publish_server_test: deploy prepare_publish
	$(PUBLISHER) --steamuser $(STEAM_USER) \
		--steampass $(STEAM_PASS) \
		--appID 107410 \
		--changenote "" \
		--contentFolder ".builds/$(TAG)/@LiveInLifeServer/" \
		--descriptionBBCodeFile ".steam/LiveInLifeTestServer/description.bbcode" \
		--previewFile ".steam/LiveInLifeTestServer/preview.jpg" \
		--publishedFileID 1346079654 \
		--title "LiveInLife Test (Server)" \
		--visibility 1

publish: publish_client publish_server

publish_client: deploy prepare_publish
	$(PUBLISHER) --steamuser $(STEAM_USER) \
		--steampass $(STEAM_PASS) \
		--appID 107410 \
		--changenote "" \
		--contentFolder ".builds/$(TAG)/@LiveInLifeClient/" \
		--descriptionBBCodeFile ".steam/LiveInLifeClient/description.bbcode" \
		--previewFile ".steam/LiveInLifeClient/preview.jpg" \
		--publishedFileID 788872094 \
		--title "LiveInLife (Client)" \
		--visibility 0

publish_server: deploy prepare_publish
	$(PUBLISHER) --steamuser $(STEAM_USER) \
		--steampass $(STEAM_PASS) \
		--appID 107410 \
		--changenote "" \
		--contentFolder ".builds/$(TAG)/@LiveInLifeServer/" \
		--descriptionBBCodeFile ".steam/LiveInLifeServer/description.bbcode" \
		--previewFile ".steam/LiveInLifeServer/preview.jpg" \
		--publishedFileID 788872454 \
		--title "LiveInLife (Server)" \
		--visibility 0

deps:
	sudo apt-get install -y git bison flex libssl-dev python3

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
	rm -Rf .build/bin
	rm -Rf .build/sqf

removeAll:
	rm -Rf .build/

createKey: prepare
ifndef PRVKEYFILE
	cd .build/keys/ && $(ARMAKE) keygen -f lil_$(TAG)
	$(eval KEY := lil_$(TAG))
	$(eval PRVKEYFILE := .build/keys/$(KEY).biprivatekey)
endif

# LiveInLifeClient

client:	lilc_actions \
	lilc_animals \
	lilc_api \
	lilc_api_banks \
	lilc_api_profiles \
	lilc_api_users \
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
	lilc_drugs \
	lilc_economy \
	lilc_events \
	lilc_exchange \
	lilc_factions \
	lilc_factions_interface \
	lilc_farming \
	lilc_ferrys \
	lilc_food \
	lilc_garage \
	lilc_hud \
	lilc_interaction \
	lilc_inventory \
	lilc_inventory_menu \
	lilc_invoices \
	lilc_job_agent \
	lilc_keys \
	lilc_licenses \
	lilc_locker \
	lilc_log \
	lilc_login \
	lilc_main \
	lilc_marker_filter \
	lilc_medical \
	lilc_messages \
	lilc_meteorology \
	lilc_modules \
	lilc_packages \
	lilc_patrols \
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
	lilc_virtual_inventory \
	dbo_old_bike \
	cpClientKey
	cp -f @LiveInLifeClient/mod.cpp .build/@LiveInLifeClient/

dbo_old_bike: createKey
	cp -f deps/$@.pbo .build/@LiveInLifeClient/addons/
	$(ARMAKE) sign -f $(PRVKEYFILE) .build/@LiveInLifeClient/addons/$@.pbo

lilc_actions: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\actions @LiveInLifeClient/addons/actions .build/@LiveInLifeClient/addons/$@.pbo

lilc_animals: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\animals @LiveInLifeClient/addons/animals .build/@LiveInLifeClient/addons/$@.pbo

lilc_api: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\api @LiveInLifeClient/addons/api .build/@LiveInLifeClient/addons/$@.pbo

lilc_api_banks: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\api_banks @LiveInLifeClient/addons/api_banks .build/@LiveInLifeClient/addons/$@.pbo

lilc_api_profiles: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\api_profiles @LiveInLifeClient/addons/api_profiles .build/@LiveInLifeClient/addons/$@.pbo

lilc_api_users: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\api_users @LiveInLifeClient/addons/api_users .build/@LiveInLifeClient/addons/$@.pbo

lilc_atcInterface: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\atcInterface @LiveInLifeClient/addons/atcInterface .build/@LiveInLifeClient/addons/$@.pbo

lilc_atm: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\atm @LiveInLifeClient/addons/atm .build/@LiveInLifeClient/addons/$@.pbo

lilc_bank: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\bank @LiveInLifeClient/addons/bank .build/@LiveInLifeClient/addons/$@.pbo

lilc_bikes: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\bikes @LiveInLifeClient/addons/bikes .build/@LiveInLifeClient/addons/$@.pbo

lilc_butcher: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\butcher @LiveInLifeClient/addons/butcher .build/@LiveInLifeClient/addons/$@.pbo

lilc_butt_inventory: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\butt_inventory @LiveInLifeClient/addons/butt_inventory .build/@LiveInLifeClient/addons/$@.pbo

lilc_cash: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\cash @LiveInLifeClient/addons/cash .build/@LiveInLifeClient/addons/$@.pbo

lilc_common: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\common @LiveInLifeClient/addons/common .build/@LiveInLifeClient/addons/$@.pbo

lilc_courthouse: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\courthouse @LiveInLifeClient/addons/courthouse .build/@LiveInLifeClient/addons/$@.pbo

lilc_crafting: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\crafting @LiveInLifeClient/addons/crafting .build/@LiveInLifeClient/addons/$@.pbo

lilc_drugs: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\drugs @LiveInLifeClient/addons/drugs .build/@LiveInLifeClient/addons/$@.pbo

lilc_economy: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\economy @LiveInLifeClient/addons/economy .build/@LiveInLifeClient/addons/$@.pbo

lilc_events: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\events @LiveInLifeClient/addons/events .build/@LiveInLifeClient/addons/$@.pbo

lilc_exchange: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\exchange @LiveInLifeClient/addons/exchange .build/@LiveInLifeClient/addons/$@.pbo

lilc_factions: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\factions @LiveInLifeClient/addons/factions .build/@LiveInLifeClient/addons/$@.pbo

lilc_factions_interface: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\factions_interface @LiveInLifeClient/addons/factions_interface .build/@LiveInLifeClient/addons/$@.pbo

lilc_farming: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\farming @LiveInLifeClient/addons/farming .build/@LiveInLifeClient/addons/$@.pbo

lilc_ferrys: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\ferrys @LiveInLifeClient/addons/ferrys .build/@LiveInLifeClient/addons/$@.pbo

lilc_food: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\food @LiveInLifeClient/addons/food .build/@LiveInLifeClient/addons/$@.pbo

lilc_garage: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\garage @LiveInLifeClient/addons/garage .build/@LiveInLifeClient/addons/$@.pbo

lilc_housing: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\housing @LiveInLifeClient/addons/housing .build/@LiveInLifeClient/addons/$@.pbo

lilc_hud: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\hud @LiveInLifeClient/addons/hud .build/@LiveInLifeClient/addons/$@.pbo

lilc_interaction: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\interaction @LiveInLifeClient/addons/interaction .build/@LiveInLifeClient/addons/$@.pbo

lilc_inventory: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\inventory @LiveInLifeClient/addons/inventory .build/@LiveInLifeClient/addons/$@.pbo

lilc_inventory_menu: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\inventory_menu @LiveInLifeClient/addons/inventory_menu .build/@LiveInLifeClient/addons/$@.pbo

lilc_invoices: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\invoices @LiveInLifeClient/addons/invoices .build/@LiveInLifeClient/addons/$@.pbo

lilc_job_agent: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\job_agent @LiveInLifeClient/addons/job_agent .build/@LiveInLifeClient/addons/$@.pbo

lilc_keys: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\keys @LiveInLifeClient/addons/keys .build/@LiveInLifeClient/addons/$@.pbo

lilc_licenses: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\licenses @LiveInLifeClient/addons/licenses .build/@LiveInLifeClient/addons/$@.pbo

lilc_locker: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\locker @LiveInLifeClient/addons/locker .build/@LiveInLifeClient/addons/$@.pbo

lilc_log: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\log @LiveInLifeClient/addons/log .build/@LiveInLifeClient/addons/$@.pbo

lilc_login: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\login @LiveInLifeClient/addons/login .build/@LiveInLifeClient/addons/$@.pbo

lilc_main: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\main @LiveInLifeClient/addons/main .build/@LiveInLifeClient/addons/$@.pbo

lilc_marker_filter: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\marker_filter @LiveInLifeClient/addons/marker_filter .build/@LiveInLifeClient/addons/$@.pbo

lilc_medical: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\medical @LiveInLifeClient/addons/medical .build/@LiveInLifeClient/addons/$@.pbo

lilc_messages: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\messages @LiveInLifeClient/addons/messages .build/@LiveInLifeClient/addons/$@.pbo

lilc_meteorology: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\meteorology @LiveInLifeClient/addons/meteorology .build/@LiveInLifeClient/addons/$@.pbo

lilc_modules: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\modules @LiveInLifeClient/addons/modules .build/@LiveInLifeClient/addons/$@.pbo

lilc_packages: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\packages @LiveInLifeClient/addons/packages .build/@LiveInLifeClient/addons/$@.pbo

lilc_patrols: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\patrols @LiveInLifeClient/addons/patrols .build/@LiveInLifeClient/addons/$@.pbo

lilc_paycheck: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\paycheck @LiveInLifeClient/addons/paycheck .build/@LiveInLifeClient/addons/$@.pbo

lilc_pcard: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\pcard @LiveInLifeClient/addons/pcard .build/@LiveInLifeClient/addons/$@.pbo

lilc_pda: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\pda @LiveInLifeClient/addons/pda .build/@LiveInLifeClient/addons/$@.pbo

lilc_permissions: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\permissions @LiveInLifeClient/addons/permissions .build/@LiveInLifeClient/addons/$@.pbo

lilc_phones: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\phones @LiveInLifeClient/addons/phones .build/@LiveInLifeClient/addons/$@.pbo

lilc_picklock: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\picklock @LiveInLifeClient/addons/picklock .build/@LiveInLifeClient/addons/$@.pbo

lilc_placement: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\placement @LiveInLifeClient/addons/placement .build/@LiveInLifeClient/addons/$@.pbo

lilc_prison: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\prison @LiveInLifeClient/addons/prison .build/@LiveInLifeClient/addons/$@.pbo

lilc_proofs: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\proofs @LiveInLifeClient/addons/proofs .build/@LiveInLifeClient/addons/$@.pbo

lilc_repair: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\repair @LiveInLifeClient/addons/repair .build/@LiveInLifeClient/addons/$@.pbo

lilc_respawn: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\respawn @LiveInLifeClient/addons/respawn .build/@LiveInLifeClient/addons/$@.pbo

lilc_shops: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\shops @LiveInLifeClient/addons/shops .build/@LiveInLifeClient/addons/$@.pbo

lilc_sitting: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\sitting @LiveInLifeClient/addons/sitting .build/@LiveInLifeClient/addons/$@.pbo

lilc_tags: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\tags @LiveInLifeClient/addons/tags .build/@LiveInLifeClient/addons/$@.pbo

lilc_tazer: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\tazer @LiveInLifeClient/addons/tazer .build/@LiveInLifeClient/addons/$@.pbo

lilc_textures: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\textures @LiveInLifeClient/addons/textures .build/@LiveInLifeClient/addons/$@.pbo

lilc_time: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\time @LiveInLifeClient/addons/time .build/@LiveInLifeClient/addons/$@.pbo

lilc_trade: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\trade @LiveInLifeClient/addons/trade .build/@LiveInLifeClient/addons/$@.pbo

lilc_transponder: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\transponder @LiveInLifeClient/addons/transponder .build/@LiveInLifeClient/addons/$@.pbo

lilc_ui: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\ui @LiveInLifeClient/addons/ui .build/@LiveInLifeClient/addons/$@.pbo

lilc_vehicles: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\vehicles @LiveInLifeClient/addons/vehicles .build/@LiveInLifeClient/addons/$@.pbo

lilc_viewDistance: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\viewDistance @LiveInLifeClient/addons/viewDistance .build/@LiveInLifeClient/addons/$@.pbo

lilc_virtual_inventory: createKey
	$(ARMAKE) build -p --force -k $(PRVKEYFILE) -e prefix=x\\lilc\\addons\\virtual_inventory @LiveInLifeClient/addons/virtual_inventory .build/@LiveInLifeClient/addons/$@.pbo

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
	lils_factions_interface \
	lils_garage \
	lils_inventory \
	lils_job_agent \
	lils_keys \
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
	lils_virtual_inventory
	cp -f @LiveInLifeServer/mod.cpp .build/@LiveInLifeServer/

lils_animals:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\animals @LiveInLifeServer/addons/animals .build/@LiveInLifeServer/addons/$@.pbo

lils_atm:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\atm @LiveInLifeServer/addons/atm .build/@LiveInLifeServer/addons/$@.pbo

lils_bank:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\bank @LiveInLifeServer/addons/bank .build/@LiveInLifeServer/addons/$@.pbo

lils_butt_inventory:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\butt_inventory @LiveInLifeServer/addons/butt_inventory .build/@LiveInLifeServer/addons/$@.pbo

lils_cleanup:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\cleanup @LiveInLifeServer/addons/cleanup .build/@LiveInLifeServer/addons/$@.pbo

lils_common:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\common @LiveInLifeServer/addons/common .build/@LiveInLifeServer/addons/$@.pbo

lils_database:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\database @LiveInLifeServer/addons/database .build/@LiveInLifeServer/addons/$@.pbo

lils_economy:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\economy @LiveInLifeServer/addons/economy .build/@LiveInLifeServer/addons/$@.pbo

lils_events:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\events @LiveInLifeServer/addons/events .build/@LiveInLifeServer/addons/$@.pbo

lils_exchange:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\exchange @LiveInLifeServer/addons/exchange .build/@LiveInLifeServer/addons/$@.pbo

lils_factions:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\factions @LiveInLifeServer/addons/factions .build/@LiveInLifeServer/addons/$@.pbo

lils_factions_interface:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\factions_interface @LiveInLifeServer/addons/factions_interface .build/@LiveInLifeServer/addons/$@.pbo

lils_garage:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\garage @LiveInLifeServer/addons/garage .build/@LiveInLifeServer/addons/$@.pbo

lils_inventory:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\inventory @LiveInLifeServer/addons/inventory .build/@LiveInLifeServer/addons/$@.pbo

lils_job_agent:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\job_agent @LiveInLifeServer/addons/job_agent .build/@LiveInLifeServer/addons/$@.pbo

lils_keys:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\keys @LiveInLifeServer/addons/keys .build/@LiveInLifeServer/addons/$@.pbo

lils_locker:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\locker @LiveInLifeServer/addons/locker .build/@LiveInLifeServer/addons/$@.pbo

lils_login:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\login @LiveInLifeServer/addons/login .build/@LiveInLifeServer/addons/$@.pbo

lils_logs:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\logs @LiveInLifeServer/addons/logs .build/@LiveInLifeServer/addons/$@.pbo

lils_meteorology:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\meteorology @LiveInLifeServer/addons/meteorology .build/@LiveInLifeServer/addons/$@.pbo

lils_paycheck:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\paycheck @LiveInLifeServer/addons/paycheck .build/@LiveInLifeServer/addons/$@.pbo

lils_pcard:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\pcard @LiveInLifeServer/addons/pcard .build/@LiveInLifeServer/addons/$@.pbo

lils_pda:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\pda @LiveInLifeServer/addons/pda .build/@LiveInLifeServer/addons/$@.pbo

lils_permissions:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\permissions @LiveInLifeServer/addons/permissions .build/@LiveInLifeServer/addons/$@.pbo

lils_prison:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\prison @LiveInLifeServer/addons/prison .build/@LiveInLifeServer/addons/$@.pbo

lils_proofs:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\proofs @LiveInLifeServer/addons/proofs .build/@LiveInLifeServer/addons/$@.pbo

lils_shops:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\shops @LiveInLifeServer/addons/shops .build/@LiveInLifeServer/addons/$@.pbo

lils_vehicles:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\vehicles @LiveInLifeServer/addons/vehicles .build/@LiveInLifeServer/addons/$@.pbo

lils_virtual_inventory:
	$(ARMAKE) build -p --force -e prefix=x\\lils\\addons\\virtual_inventory @LiveInLifeServer/addons/virtual_inventory .build/@LiveInLifeServer/addons/$@.pbo
