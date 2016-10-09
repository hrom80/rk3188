USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/haier/rk3188/BoardConfigVendor.mk

TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := rk3188
TARGET_BOARD_HARDWARE := rk30board
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_ARMV7A := true

TARGET_BOOTLOADER_BOARD_NAME := rk3188

BOARD_CUSTOM_BOOTIMG_MK := device/haier/rk3188/bootimg.mk

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12639535104
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

TARGET_KERNEL_CONFIG := haier_1043_defconfig
TARGET_USES_UNCOMPRESSED_KERNEL := true

TARGET_PREBUILT_KERNEL := device/haier/rk3188/kernel

# Use the CM PowerHAL
TARGET_USES_CM_POWERHAL := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_PROVIDES_INIT_RC := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_USE_LCDC_COMPOSER := true

PRODUCT_CHARACTERISTICS := tablet

#Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

#GPS
BOARD_HAS_GPS := false

#Video
BOARD_EGL_CFG := vendor/haier/rk3188/proprietary/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_FNW := true

#Touch screen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/haier/rk3188/bluetooth/vnd_rk3188.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/haier/rk3188/bluetooth

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4330.bin nvram_path=/system/etc/firmware/nvram_4330.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/firmware/fw_bcm4330_apsta.bin nvram_path=/system/etc/firmware/nvram_4330.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4330.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4330_apsta.bin"

# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BUILD_WITHOUT_BATTERY := false

#TWRP
TARGET_RECOVERY_FSTAB := device/haier/rk3188/recovery/recovery.fstab
DEVICE_RESOLUTION := 1920x1200
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_NO_SCREEN_BLANK := true
TW_NO_SCREEN_TIMEOUT := true
TW_DISABLE_DOUBLE_BUFFERING := true

