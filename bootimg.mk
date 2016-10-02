LOCAL_PATH := $(call my-dir)

RKCRC := $(HOST_OUT_EXECUTABLES)/rkcrc$(HOST_EXECUTABLE_SUFFIX)

# Make boot image
$(INSTALLED_BOOTIMAGE_TARGET): $(RKCRC) $(INSTALLED_RAMDISK_TARGET) $(INSTALLED_KERNEL_TARGET)
	$(call pretty,"Target boot image: $@")
	# Add signature to ramdisk
	$(hide) $(RKCRC) -k $(INSTALLED_RAMDISK_TARGET) $@
	# Add signature to kernel as well
	$(hide) $(RKCRC) -k $(INSTALLED_KERNEL_TARGET) $(INSTALLED_KERNEL_TARGET)_signed
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

.PHONY: bootimage-nodeps
bootimage-nodeps: $(RKCRC)
	@echo "make $@: ignoring dependencies"
	$(hide) $(RKCRC) -k $(INSTALLED_RAMDISK_TARGET) $(INSTALLED_BOOTIMAGE_TARGET)
	# Add signature to kernel as well
	$(hide) $(RKCRC) -k $(INSTALLED_KERNEL_TARGET) $(INSTALLED_KERNEL_TARGET)_signed
	$(hide) $(call assert-max-image-size,$(INSTALLED_BOOTIMAGE_TARGET),$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_INS}"Made boot image: $@"${CL_RST}


# Make recovery image
$(INSTALLED_RECOVERYIMAGE_TARGET): $(RKCRC) $(recovery_ramdisk)
	# Add signature to recovery ramdisk
	$(RKCRC) -k $(recovery_ramdisk) $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
