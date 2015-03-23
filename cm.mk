## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := a400cg

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/a400cg/device_a400cg.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a400cg
PRODUCT_NAME := cm_a400cg
PRODUCT_BRAND := asus
PRODUCT_MODEL := a400cg
PRODUCT_MANUFACTURER := ASUS
