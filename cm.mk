## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := ASUS_T00I

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/a400cg/device_ASUS_T00I.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ASUS_T00I
PRODUCT_NAME := cm_ASUS_T00I
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_T00I
PRODUCT_MANUFACTURER := ASUS
