## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := rk3188

# Boot animation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/haier/rk3188/device_rk3188.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rk3188
PRODUCT_NAME := cm_rk3188
PRODUCT_BRAND := haier
PRODUCT_MODEL := rk3188
PRODUCT_MANUFACTURER := haier
