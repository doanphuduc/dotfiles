DOT_SCRIPTS = ./scripts
STOW = $(shell command -v stow 2> /dev/null)

check_stow:
ifndef STOW
	$(error No 'stow' in $$PATH, consider installing GNU stow from https://github.com/aspiers/stow)
endif

install: check_stow
	@echo "~>> [[ Installing ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/install
