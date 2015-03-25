$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/a400cg/a400cg-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/a400cg/overlay

$(call inherit-product, build/target/product/full.mk)

LOCAL_PATH := device/asus/a400cg

## During Development we will turn off all security etc.
ADDITIONAL_DEFAULT_PROPERTIES := \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debugabble=1 

# Intel blobs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/charger:root/charger \
    $(LOCAL_PATH)/ramdisk/upi_ug31xx:root/upi_ug31xx \
    $(LOCAL_PATH)/ramdisk/ia_watchdogd:root/usr/bin/ia_watchdogd \
    $(LOCAL_PATH)/ramdisk/sbin/partlink:root/sbin/partlink

# Binary to be replaced with source code ..
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/ramdisk/sepolicy:root/sepolicy

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(LOCAL_PATH)/ramdisk/busybox:root/system/bin/busybox \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/watchdogd:recovery/root/sbin/watchdogd \
	$(LOCAL_PATH)/blobs/watchdogd:recovery/root/watchdogd \
	$(LOCAL_PATH)/blobs/watchdogd:root/watchdogd \
	$(LOCAL_PATH)/ramdisk/ia_watchdogd:system/bin/ia_watchdogd \
	$(LOCAL_PATH)/ramdisk/init:root/init

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_redhookbay
PRODUCT_DEVICE := redhookbay

DEVICE_BASE_BOOT_IMAGE := $(LOCAL_PATH)/blobs/boot.img
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/blobs/recovery.img

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Ramdisk fstab / rc files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.watchdog.rc:root/init.watchdog.rc \
    $(LOCAL_PATH)/ramdisk/fstab.charger.redhookbay:root/fstab.charger.redhookbay \
    $(LOCAL_PATH)/ramdisk/fstab.ramconsole.redhookbay:root/fstab.ramconsole.redhookbay \
    $(LOCAL_PATH)/ramdisk/fstab.redhookbay:root/fstab.redhookbay \
    $(LOCAL_PATH)/ramdisk/init.avc.rc:root/init.avc.rc \
    $(LOCAL_PATH)/ramdisk/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/ramdisk/init.debug.rc:root/init.debug.rc \
    $(LOCAL_PATH)/ramdisk/init.diag.rc:root/init.diag.rc \
    $(LOCAL_PATH)/ramdisk/init.logtool.rc:root/init.logtool.rc \
    $(LOCAL_PATH)/ramdisk/init.partlink.rc:root/init.partlink.rc \
    $(LOCAL_PATH)/ramdisk/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/ramdisk/init.bt.vendor.rc:root/init.bt.vendor.rc \
    $(LOCAL_PATH)/ramdisk/init.common.rc:root/init.common.rc \
    $(LOCAL_PATH)/ramdisk/init.gps.rc:root/init.gps.rc \
    $(LOCAL_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/ramdisk/init.platform.usb.rc:root/init.platform.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.redhookbay.rc:root/init.redhookbay.rc \
    $(LOCAL_PATH)/ramdisk/init.wifi.rc:root/init.wifi.rc \
    $(LOCAL_PATH)/ramdisk/init.wifi.vendor.rc:root/init.wifi.vendor.rc \
    $(LOCAL_PATH)/ramdisk/init.wireless.rc:root/init.wireless.rc \
    $(LOCAL_PATH)/ramdisk/props.minios.rc:root/props.minios.rc \
    $(LOCAL_PATH)/ramdisk/props.board.rc:root/props.board.rc \
    $(LOCAL_PATH)/ramdisk/props.platform.rc:root/props.platform.rc \
    $(LOCAL_PATH)/ramdisk/props.rc:root/props.rc \
    $(LOCAL_PATH)/ramdisk/rfkill_bt.sh:root/rfkill_bt.sh \
    $(LOCAL_PATH)/ramdisk/ueventd.modules.blacklist:root/ueventd.modules.blacklist \
    $(LOCAL_PATH)/ramdisk/ueventd.redhookbay.rc:root/ueventd.redhookbay.rc

# Intel blobs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/charger:root/charger \
    $(LOCAL_PATH)/ramdisk/upi_ug31xx:root/upi_ug31xx \
    $(LOCAL_PATH)/ramdisk/ia_watchdogd:root/usr/bin/ia_watchdogd \
    $(LOCAL_PATH)/ramdisk/sbin/partlink:root/sbin/partlink

# Binary to be replaced with source code ..
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/ramdisk/sepolicy:root/sepolicy

# Modules (currently from ASUS)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/lib/modules/apwr3_1.ko:root/lib/modules/apwr3_1.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/ar0543.ko:root/lib/modules/ar0543.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/ar0543_raw.ko:root/lib/modules/ar0543_raw.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/atomisp-css2300.ko:root/lib/modules/atomisp-css2300.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/atomisp-css2400b0_v2.ko:root/lib/modules/atomisp-css2400b0_v2.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/atomisp-css2400b0_v21.ko:root/lib/modules/atomisp-css2400b0_v21.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/atomisp-css2401a0_legacy_v21.ko:root/lib/modules/atomisp-css2401a0_legacy_v21.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/atomisp-css2401a0_v21.ko:root/lib/modules/atomisp-css2401a0_v21.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/bcm_bt_lpm.ko:root/lib/modules/bcm_bt_lpm.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/cfg80211.ko:root/lib/modules/cfg80211.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/gc0339_raw.ko:root/lib/modules/gc0339_raw.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/gspca_main.ko:root/lib/modules/gspca_main.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/hm2056_raw.ko:root/lib/modules/hm2056_raw.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/imx111_raw.ko:root/lib/modules/imx111_raw.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/imx1x5.ko:root/lib/modules/imx1x5.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/imx219.ko:root/lib/modules/imx219.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/mac80211.ko:root/lib/modules/mac80211.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.alias:root/lib/modules/modules.alias \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.alias.bin:root/lib/modules/modules.alias.bin \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.ccwmap:root/lib/modules/modules.ccwmap \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.dep:root/lib/modules/modules.dep \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.dep.bin:root/lib/modules/modules.dep.bin \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.devname:root/lib/modules/modules.devname \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.ieee1394map:root/lib/modules/modules.ieee1394map \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.inputmap:root/lib/modules/modules.inputmap \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.isapnpmap:root/lib/modules/modules.isapnpmap \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.ofmap:root/lib/modules/modules.ofmap \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.pcimap:root/lib/modules/modules.pcimap \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.seriomap:root/lib/modules/modules.seriomap \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.softdep:root/lib/modules/modules.softdep \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.symbols:root/lib/modules/modules.symbols \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.symbols.bin:root/lib/modules/modules.symbols.bin \
    $(LOCAL_PATH)/ramdisk/lib/modules/modules.usbmap:root/lib/modules/modules.usbmap \
    $(LOCAL_PATH)/ramdisk/lib/modules/mt9m114.ko:root/lib/modules/mt9m114.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/mt9m114_raw.ko:root/lib/modules/mt9m114_raw.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/ov5693.ko:root/lib/modules/ov5693.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/pax.ko:root/lib/modules/pax.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/pnwdisp.ko:root/lib/modules/pnwdisp.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/pvrsgx.ko:root/lib/modules/pvrsgx.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/rmi4.ko:root/lib/modules/rmi4.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/sep3_10.ko:root/lib/modules/sep3_10.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/spca700xa.ko:root/lib/modules/spca700xa.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/st_drv.ko:root/lib/modules/st_drv.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/test_nx.ko:root/lib/modules/test_nx.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/texfat.ko:root/modules/texfat.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/tntfs.ko:root/lib/modules/tntfs.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/uvcvideo.ko:root/lib/modules/uvcvideo.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/videobuf-core.ko:root/lib/modules/videobuf-core.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/videobuf-vmalloc.ko:root/lib/modules/videobuf-vmalloc.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/videobuf2-core.ko:root/lib/modules/videobuf2-core.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/videobuf2-memops.ko:root/lib/modules/videobuf2-memops.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/videobuf2-vmalloc.ko:root/lib/modules/videobuf2-vmalloc.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/vtsspp.ko:root/lib/modules/vtsspp.ko \


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# for external SD card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/platform.xml:system/etc/permissions/platform.xml

# media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# usb
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    tune2fs \
    resize2fs

PRODUCT_PACKAGES += \
    Stk

# library
PRODUCT_PACKAGES += \
    libtinycompress \
    dbus-daemon \
    libdbus \
    minizip \
    openssl \
    pack_intel \
    unpack_intel

PRODUCT_PACKAGES += \
    link_modprobe

DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay

############################### property ##########################

PRODUCT_PROPERTY_OVERRIDES += \
    ro.streaming.video.drs=true \
    widi.media.extmode.enable=false \
    widi.uibc.enable=false \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.jit.code_cache_size=1048576

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-asus \
    ro.com.google.clientidbase.ms=android-asus \
    ro.com.google.clientidbase.am=android-asus \
    ro.com.google.clientidbase.gmm=android-asus \
    ro.com.google.clientidbase.yt=android-asus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=20.0f \
	ro.hwui.texture_cache_flushrate=0.75f \
	ro.hwui.text_small_cache_width=1024 \
	ro.hwui.text_small_cache_height=256 \
	ro.hwui.text_large_cache_width=2048 \
	ro.hwui.text_large_cache_height=256
	
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tel.hot_swap.support=true

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.blankphone_id=1 \
    ro.system.simtype=2 \
    panel.physicalWidthmm=62 \
    panel.physicalHeightmm=110 \
    persist.sys.dalvik.vm.lib=libdvm.so \
    ro.ril.status.polling.enable=0 \
    ro.config.personality=compat_layout \
    rs.gpu.renderscript=0 \
    rs.gpu.filterscript=0 \
    rs.gpu.rsIntrinsic=0

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.kernel.android.checkjni=0 \
#    dalvik.vm.checkjni=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.tcs.config_name=XMM6360_CONF_FLASHLESS

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
	panel.physicalWidthmm=52 \
	panel.physicalHeightmm=86 \
	ro.opengles.version=131072 \
    gsm.net.interface=rmnet0 \
    persist.system.at-proxy.mode=0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp,adb
#    ro.secure=0 \
#    ro.adb.secure=0 \

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
+
+PRODUCT_CHARACTERISTICS := phone
