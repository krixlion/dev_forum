.PHONY: deploy

deploy: # params: overlay
	kubectl -k k8s/overlays/${overlay} apply

add-module: # params: url
	git submodule add ${url}
	$(MAKE) update

update:
	git pull
	git submodule update --recursive --init --remote
