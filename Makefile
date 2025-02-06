.PHONY: deploy

deploy: # params: overlay
	kubectl kustomize k8s/overlays/${overlay} --enable-helm | kubectl create -f -

add-module: # params: url
	git submodule add ${url}
	$(MAKE) update

update:
	git pull
	git submodule update --recursive --init --remote
