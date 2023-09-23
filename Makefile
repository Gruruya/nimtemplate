## Makefile which delegates to Nimble - for nimtemplate.
# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

NIMBLE       := nimble
NIMBLE_FLAGS := -y

.PHONY: all build run doc clean install uninstall test
all: build

build:
	@$(NIMBLE) $(NIMBLE_FLAGS) build

run:
	@$(NIMBLE) $(NIMBLE_FLAGS) run

doc:
	@$(NIMBLE) $(NIMBLE_FLAGS) docs

clean:
	@$(NIMBLE) $(NIMBLE_FLAGS) clean

install:
	@$(NIMBLE) $(NIMBLE_FLAGS) install

uninstall:
	@$(NIMBLE) $(NIMBLE_FLAGS) uninstall nimtemplate

test:
	@$(NIMBLE) $(NIMBLE_FLAGS) test
