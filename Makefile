## Makefile which delegates to Nimble - for nimtemplate.
# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

NIMBLE       := nimble
NIMBLE_FLAGS :=

.PHONY: all build run doc clean install uninstall test
all: build

build:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) build

run:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) run

doc:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) docs

clean:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) clean

install:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) install

uninstall:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) uninstall nimtemplate

test:
	@$(NIMBLE) -y $(NIMBLE_FLAGS) test
