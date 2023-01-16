add-module: #params: url
	git submodule add ${url}
	git submodule update --recursive --init --remote

update:
	git pull
	git submodule update --recursive --init --remote