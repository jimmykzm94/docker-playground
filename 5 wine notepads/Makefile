create_volume:
	docker volume create notepad_file

build:
	docker build -t wine_test . 

HOST_IP=$(shell ifconfig en0 | awk '{if ($$1=="inet") print $$2}')
before_run:
	open -a XQuartz
	xhost + ${HOST_IP}

run:
	docker run --rm -e DISPLAY=${HOST_IP}:0 -v notepad_file:/app wine_test

remove:
	docker image rm wine_test