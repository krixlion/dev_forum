deploy:
	- rm ./deploy
	go build deploy.go
	./deploy

add-module: #params: url
	git submodule add ${url}
	$(MAKE) update

update:
	git pull
	git submodule update --recursive --init --remote
