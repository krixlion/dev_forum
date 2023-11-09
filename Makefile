.PHONY: deploy

deploy:
	kubectl -k k8s/overlays/dev apply

add-module: #params: url
	git submodule add ${url}
	$(MAKE) update

update:
	git pull
	git submodule update --recursive --init --remote
