$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/haier/rk3188/rk3188-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/haier/rk3188/overlay

LOCAL_PATH := device/haier/rk3188
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Files needed for boot and recovery image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/default.prop:root/default.prop \
    $(LOCAL_PATH)/ramdisk/charger:root/charger \
    $(LOCAL_PATH)/ramdisk/drmboot.ko:root/drmboot.ko \
    $(LOCAL_PATH)/ramdisk/fstab.rk30board:root/fstab.rk30board \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.rk30board.environment.rc:root/init.rk30board.environment.rc \
    $(LOCAL_PATH)/ramdisk/init.rk30board.rc:root/init.rk30board.rc \
    $(LOCAL_PATH)/ramdisk/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.connectivity.rc:root/init.connectivity.rc \
    $(LOCAL_PATH)/ramdisk/rk30xxnand_ko.ko.3.0.8+:root/rk30xxnand_ko.ko.3.0.8+ \
    $(LOCAL_PATH)/ramdisk/rk30xxnand_ko.ko.3.0.36+:root/rk30xxnand_ko.ko.3.0.36+ \
    $(LOCAL_PATH)/ramdisk/ueventd.rk30board.rc:root/ueventd.rk30board.rc \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_0.png:root/res/images/charger/battery_0.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_1.png:root/res/images/charger/battery_1.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_2.png:root/res/images/charger/battery_2.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_3.png:root/res/images/charger/battery_3.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_4.png:root/res/images/charger/battery_4.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_5.png:root/res/images/charger/battery_5.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_charge.png:root/res/images/charger/battery_charge.png \
    $(LOCAL_PATH)/ramdisk/res/images/charger/battery_fail.png:root/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/recovery/init.recovery.rk30board.rc:root/init.recovery.rk30board.rc 

# Modified shared objects
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/sensors.rk30board.so:system/lib/hw/sensors.rk30board.so

# init.d
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.d/80ipconfig:system/lib/etc/init.d/80ipconfig

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# bt config files
PRODUCT_COPY_FILES += \
    device/haier/rk3188/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# camera HAL
PRODUCT_COPY_FILES += \
    device/haier/rk3188/camera/camera.rk30board.so:system/lib/hw/camera.rk30board.so

# lights HAL
PRODUCT_PACKAGES += \
    lights.rk30board

# media files
PRODUCT_COPY_FILES += \
    device/haier/rk3188/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/haier/rk3188/media/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# wifi packages
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# audio packages
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.a2dp.default \
    audio.r_submix.default

# camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

$(call inherit-product, build/target/product/full_base.mk)

# This device has enough room for precise davick
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_rk3188
PRODUCT_DEVICE := rk3188

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
