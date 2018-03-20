
ARMAKE=.build/bin/armake

all: build_armake \
	client \
	server

deps:
	sudo apt-get install -y git bison flex libssl-dev python3

build_armake: prepare
	git clone https://github.com/jonpas/armake.git .build/armake
	cd .build/armake && git checkout headerExtensions
	cd .build/armake && make
	cp -f .build/armake/bin/armake .build/bin/

prepare:
	mkdir -p .build/
	mkdir -p .build/bin/
	mkdir -p .build/@LiveInLifeClient/addons
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
	lilc_factionInterface \
	lilc_farming \
	lilc_ferrys \
	lilc_food \
	lilc_garage \
	lilc_housing \
	lilc_hud \
	lilc_interaction \
	lilc_inventory \
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
	lilc_placement \
	lilc_prison \
	lilc_proofs \
	lilc_repair \
	lilc_respawn \
	lilc_shops \
	lilc_sitting \
	lilc_tags \
	lilc_tazer \
	lilc_textures \
	lilc_tickets \
	lilc_time \
	lilc_trade \
	lilc_transponder \
	lilc_ui \
	lilc_vehicles \
	lilc_viewDistance \
	lilc_virtualInventory

lilc_actions: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\actions .build/@LiveInLifeClient/addons/$@.pbo

lilc_animals: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\animals .build/@LiveInLifeClient/addons/$@.pbo

lilc_atcInterface: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\atcInterface .build/@LiveInLifeClient/addons/$@.pbo

lilc_atm: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\atm .build/@LiveInLifeClient/addons/$@.pbo

lilc_bank: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\bank .build/@LiveInLifeClient/addons/$@.pbo

lilc_bikes: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\bikes .build/@LiveInLifeClient/addons/$@.pbo

lilc_butcher: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\butcher .build/@LiveInLifeClient/addons/$@.pbo

lilc_butt_inventory: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\butt_inventory .build/@LiveInLifeClient/addons/$@.pbo

lilc_cash: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\cash .build/@LiveInLifeClient/addons/$@.pbo

lilc_common: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\common .build/@LiveInLifeClient/addons/$@.pbo

lilc_courthouse: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\courthouse .build/@LiveInLifeClient/addons/$@.pbo

lilc_crafting: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\crafting .build/@LiveInLifeClient/addons/$@.pbo

lilc_economy: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\economy .build/@LiveInLifeClient/addons/$@.pbo

lilc_events: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\events .build/@LiveInLifeClient/addons/$@.pbo

lilc_exchange: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\exchange .build/@LiveInLifeClient/addons/$@.pbo

lilc_factions: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\factions .build/@LiveInLifeClient/addons/$@.pbo

lilc_factionsInterface: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\factionsInterface .build/@LiveInLifeClient/addons/$@.pbo

lilc_farming: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\farming .build/@LiveInLifeClient/addons/$@.pbo

lilc_ferrys: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\ferrys .build/@LiveInLifeClient/addons/$@.pbo

lilc_food: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\food .build/@LiveInLifeClient/addons/$@.pbo

lilc_garage: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\garage .build/@LiveInLifeClient/addons/$@.pbo

lilc_housing: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\housing .build/@LiveInLifeClient/addons/$@.pbo

lilc_hud: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\hud .build/@LiveInLifeClient/addons/$@.pbo

lilc_interaction: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\interaction .build/@LiveInLifeClient/addons/$@.pbo

lilc_inventory: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\inventory .build/@LiveInLifeClient/addons/$@.pbo

lilc_job_agent: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\job_agent .build/@LiveInLifeClient/addons/$@.pbo

lilc_keys: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\keys .build/@LiveInLifeClient/addons/$@.pbo

lilc_licenses: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\licenses .build/@LiveInLifeClient/addons/$@.pbo

lilc_locker: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\locker .build/@LiveInLifeClient/addons/$@.pbo

lilc_log: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\log .build/@LiveInLifeClient/addons/$@.pbo

lilc_login: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\login .build/@LiveInLifeClient/addons/$@.pbo

lilc_marker_filter: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\marker_filter .build/@LiveInLifeClient/addons/$@.pbo

lilc_medical: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\medical .build/@LiveInLifeClient/addons/$@.pbo

lilc_messages: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\messages .build/@LiveInLifeClient/addons/$@.pbo

lilc_meteorology: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\meteorology .build/@LiveInLifeClient/addons/$@.pbo

lilc_modules: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\modules .build/@LiveInLifeClient/addons/$@.pbo

lilc_packages: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\packages .build/@LiveInLifeClient/addons/$@.pbo

lilc_paycheck: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\paycheck .build/@LiveInLifeClient/addons/$@.pbo

lilc_pcard: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\pcard .build/@LiveInLifeClient/addons/$@.pbo

lilc_pda: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\pda .build/@LiveInLifeClient/addons/$@.pbo

lilc_permissions: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\permissions .build/@LiveInLifeClient/addons/$@.pbo

lilc_phones: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\phones .build/@LiveInLifeClient/addons/$@.pbo

lilc_picklock: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\picklock .build/@LiveInLifeClient/addons/$@.pbo

lilc_placement: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\placement .build/@LiveInLifeClient/addons/$@.pbo

lilc_prison: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\prison .build/@LiveInLifeClient/addons/$@.pbo

lilc_proofs: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\proofs .build/@LiveInLifeClient/addons/$@.pbo

lilc_repair: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\repair .build/@LiveInLifeClient/addons/$@.pbo

lilc_respawn: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\respawn .build/@LiveInLifeClient/addons/$@.pbo

lilc_shops: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\shops .build/@LiveInLifeClient/addons/$@.pbo

lilc_sitting: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\sitting .build/@LiveInLifeClient/addons/$@.pbo

lilc_tags: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\tags .build/@LiveInLifeClient/addons/$@.pbo

lilc_tazer: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\tazer .build/@LiveInLifeClient/addons/$@.pbo

lilc_textures: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\textures .build/@LiveInLifeClient/addons/$@.pbo

lilc_tickets: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\tickets .build/@LiveInLifeClient/addons/$@.pbo

lilc_time: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\time .build/@LiveInLifeClient/addons/$@.pbo

lilc_trade: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\trade .build/@LiveInLifeClient/addons/$@.pbo

lilc_transponder: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\transponder .build/@LiveInLifeClient/addons/$@.pbo

lilc_ui: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\ui .build/@LiveInLifeClient/addons/$@.pbo

lilc_vehicles: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\vehicles .build/@LiveInLifeClient/addons/$@.pbo

lilc_viewDistance: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\viewDistance .build/@LiveInLifeClient/addons/$@.pbo

lilc_virtualInventory: build_armake
	$(ARMAKE) build --force -e prefix=x\lilc\addons\virtualInventory  .build/@LiveInLifeClient/addons/$@.pbo


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
	$(ARMAKE) build --force -e prefix=x\lils\addons\animals  .build/@LiveInLifeServer/addons/$@.pbo

lils_atm: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\atm  .build/@LiveInLifeServer/addons/$@.pbo

lils_bank: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\bank  .build/@LiveInLifeServer/addons/$@.pbo

lils_butt_inventory: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\butt_inventory  .build/@LiveInLifeServer/addons/$@.pbo

lils_cleanup: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\cleanup  .build/@LiveInLifeServer/addons/$@.pbo

lils_common: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\common  .build/@LiveInLifeServer/addons/$@.pbo

lils_database: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\database  .build/@LiveInLifeServer/addons/$@.pbo

lils_economy: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\economy  .build/@LiveInLifeServer/addons/$@.pbo

lils_events: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\events  .build/@LiveInLifeServer/addons/$@.pbo

lils_exchange: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\exchange  .build/@LiveInLifeServer/addons/$@.pbo

lils_factions: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\factions  .build/@LiveInLifeServer/addons/$@.pbo

lils_factionsInterface: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\factionsInterface  .build/@LiveInLifeServer/addons/$@.pbo

lils_garage: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\garage  .build/@LiveInLifeServer/addons/$@.pbo

lils_inventory: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\inventory  .build/@LiveInLifeServer/addons/$@.pbo

lils_job_agent: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\job_agent  .build/@LiveInLifeServer/addons/$@.pbo

lils_keys: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\keys  .build/@LiveInLifeServer/addons/$@.pbo

lils_licenses: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\licenses  .build/@LiveInLifeServer/addons/$@.pbo

lils_locker: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\locker  .build/@LiveInLifeServer/addons/$@.pbo

lils_login: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\login  .build/@LiveInLifeServer/addons/$@.pbo

lils_logs: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\logs  .build/@LiveInLifeServer/addons/$@.pbo

lils_meteorology: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\meteorology  .build/@LiveInLifeServer/addons/$@.pbo

lils_paycheck: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\paycheck  .build/@LiveInLifeServer/addons/$@.pbo

lils_pcard: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\pcard  .build/@LiveInLifeServer/addons/$@.pbo

lils_pda: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\pda  .build/@LiveInLifeServer/addons/$@.pbo

lils_permissions: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\permissions  .build/@LiveInLifeServer/addons/$@.pbo

lils_prison: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\prison  .build/@LiveInLifeServer/addons/$@.pbo

lils_proofs: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\proofs  .build/@LiveInLifeServer/addons/$@.pbo

lils_shops: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\shops  .build/@LiveInLifeServer/addons/$@.pbo

lils_vehicles: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\vehicles  .build/@LiveInLifeServer/addons/$@.pbo

lils_virtualInventory: build_armake
	$(ARMAKE) build --force -e prefix=x\lils\addons\virtualInventory  .build/@LiveInLifeServer/addons/$@.pbo
