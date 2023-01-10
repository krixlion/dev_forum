add-module: #params: url
	git submodule add ${url}
	git submodule update --recursive --init
