all: image

.submodule-init:
	git submodule update --init --force
	touch .submodule-init

.defconfig: .submodule-init
ifeq "$(CEC_YAMAHA_POWER_BUILDER_HOST)" ""
	./docker-make raspi-cec-yamaha-power_defconfig
else
	./remote-docker-make raspi-cec-yamaha-power_defconfig
endif
	touch .defconfig

clean:
ifeq "$(CEC_YAMAHA_POWER_BUILDER_HOST)" ""
	./docker-make clean
else
	./remote-docker-make clean
endif
	rm .submodule-init
	rm .defconfig

dist-clean: 
	git submodule deinit --all
	rm .submodule-init
	rm .defconfig


image: .defconfig
ifeq "$(CEC_YAMAHA_POWER_BUILDER_HOST)" ""
	./docker-make all
else
	./remote-docker-make all
endif

