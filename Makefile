#!make

ifeq (,$(wildcard ./.env))
$(error No se encuentra el fichero .env)
endif

ifeq (,$(wildcard ./regsync.yml))
$(error No se encuentra el fichero regsync.yml)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ---------------
	@echo check
	@echo sync
	@echo ---------------

_header:
	@echo -------
	@echo regsync
	@echo -------

check:
	@docker compose run --rm regsync check -c /home/appuser/regsync.yml -v debug

sync:
	@docker compose run --rm regsync once -c /home/appuser/regsync.yml
