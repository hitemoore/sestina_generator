include set_env.mk

build-image: Dockerfile
	docker build -t sestina_gen . \
	&& touch $@


.PHONY: run-notebook
run-notebook: build-image stop-notebook
	./jupyter-lab.sh


.PHONY: stop-notebook
stop-notebook:
	docker stop sestina_gen_$(HOSTNAME)_$(UID) || echo "already stopped"
	sleep 1


.PHONY: get-url
get-url:
	@docker exec --user jovyan -it sestina_gen_$(HOSTNAME)_$(UID) jupyter lab list \
	| sed -E "s/(0.0.0.0|localhost)/$(HOSTNAME)/"
