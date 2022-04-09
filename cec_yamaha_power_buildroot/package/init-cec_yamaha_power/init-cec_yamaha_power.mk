define INIT_CEC_YAMAHA_POWER_INSTALL_TARGET_CMDS
	ln -s /usr/bin/cec_yamaha_power $(TARGET_DIR)/sbin/init
endef

$(eval $(generic-package))
