## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := ZENFONE 4

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/a400cg/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ASUS_T00I
PRODUCT_NAME := cm_a400cg
PRODUCT_BRAND := asus
PRODUCT_MODEL := a400cg
PRODUCT_MANUFACTURER := ASUS


