SKELETON_CEC_YAMAHA_POWER_ADD_TOOLCHAIN_DEPENDENCY = NO
SKELETON_CEC_YAMAHA_POWER_ADD_SKELETON_DEPENDENCY = NO
SKELETON_CEC_YAMAHA_POWER_PROVIDES = skeleton
SKELETON_CEC_YAMAHA_POWER_INSTALL_STAGING = YES

SKELETON_CEC_YAMAHA_POWER_PATH = $(BR2_EXTERNAL_CEC_YAMAHA_POWER_PATH)/system/skeleton

define SKELETON_CEC_YAMAHA_POWER_INSTALL_TARGET_CMDS
	$(call SYSTEM_RSYNC,$(SKELETON_CEC_YAMAHA_POWER_PATH),$(TARGET_DIR))
	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
endef

# We don't care much about what goes in staging, as long as it is
# correctly setup for merged/non-merged /usr. The simplest is to
# fill it in with the content of the skeleton.
define SKELETON_CEC_YAMAHA_POWER_INSTALL_STAGING_CMDS
	$(call SYSTEM_RSYNC,$(SKELETON_CEC_YAMAHA_POWER_PATH),$(STAGING_DIR))
	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))
