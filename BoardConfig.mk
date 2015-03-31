USE_CAMERA_STUB := true
BOARD_CREATE_MODPROBE_SYMLINK := true
# inherit from the proprietary version
-include vendor/asus/a400cg/BoardConfigVendor.mk

REF_PRODUCT_NAME := a400cg
TARGET_ARCH := x86
#TARGET_ARCH_VARIANT := x86-atom
TARGET_ARCH_VARIANT := x86
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := x86

COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DARCH_IA32
BOARD_MALLOC_ALIGNMENT := 16


# Atom optimizations to improve memory benchmarks enable disable houdini
-include $(LOCAL_PATH)/OptAtom.mk

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail

TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true


# Use boot tools to make Intel-formatted images
DEVICE_BASE_BOOT_IMAGE := $(LOCAL_PATH)/blobs/boot.img
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/blobs/recovery.img


# Kernel config (reference only)
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
cmdline_extra := watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789012345678901
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger loglevel=0 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay $(cmdline_extra) ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=384M build_version=3
TARGET_PREBUILT_KERNEL := device/asus/a400cg/kernel

TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true


# Atom optimizations specified (source:oxavelar)
TARGET_GLOBAL_CFLAGS += \
                        -O2 \
                        -flto \
                        -march=atom \
                        -mmmx \
                        -msse \
                        -msse2 \
                        -msse3 \
                        -mssse3 \
                        -mpclmul \
                        -mcx16 \
                        -msahf \
                        -mmovbe \
                        -ftree-vectorize \
                        -fomit-frame-pointer \
                        -finline-functions \
                        -fpredictive-commoning \
                        -fgcse-after-reload \
                        -fforce-addr \
                        -ffast-math \
                        -fsingle-precision-constant \
                        -floop-block \
                        -floop-interchange \
                        -floop-strip-mine \
                        -floop-parallelize-all \
                        -ftree-parallelize-loops=2 \
                        -ftree-loop-if-convert \
                        -ftree-loop-if-convert-stores \
                        -ftree-loop-distribution \
                        -foptimize-register-move \
                        -fgraphite-identity \

# The following are very specific to our z2520/z2560/2580 Atom
TARGET_GLOBAL_CFLAGS += \
                        --param l1-cache-line-size=64 \
                        --param l1-cache-size=48 \
                        --param l2-cache-size=1024 \

TARGET_GLOBAL_CFLAGS += -DUSE_SSSE3 -DUSE_SSE2

TARGET_GLOBAL_CPPFLAGS += -march=atom -fno-exceptions

TARGET_GLOBAL_LDFLAGS += -Wl,-O1

# Insecure boot
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# Recovery
TARGET_RECOVERY_FSTAB := device/asus/a400cg/ramdisk/recovery.fstab
TARGET_RECOVERY_INITRC := device/asus/a400cg/ramdisk/recovery.init.redhookbay.rc
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_SCREEN_WIDTH := 480
TARGET_PREBUILT_RECOVERY_KERNEL := device/asus/a400cg/kernel
RECOVERY_SDCARD_ON_DATA := true
DEVICE_RESOLUTION := 480x800
TARGET_NO_SEPARATE_RECOVERY := true

# File system
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1363148800
BOARD_FLASH_BLOCK_SIZE := 131072

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcmdhd.bin"
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
#WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
#WIFI_FIRMWARE_LOADER             := ""
 COMMON_GLOBAL_CFLAGS             += -DUSES_TI_MAC80211
 
# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# HW_Renderer
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/asus/a400cg/configs/egl.cfg
BOARD_ALLOW_EGL_HIBERNATION := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# HWComposer
BOARD_USES_HWCOMPOSER := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

 # GPS
 BOARD_HAVE_GPS := true
 
 # skip doc from building
 BOARD_SKIP_ANDROID_DOC_BUILD := true
 
# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

 # Use dlmalloc
 MALLOC_IMPL := dlmalloc
 
 # Security
 BUILD_WITH_SECURITY_FRAMEWORK := chaabi_token
 BUILD_WITH_CHAABI_SUPPORT := true
 
# SELinux
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS += device/asus/a400cg/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    seapp_contexts \
    property_contexts \
    file.te \
    genfs_contexts \
    device.te \
    vold.te \
    ecryptfs.te \
    zygote.te \
    su.te \
    pvrsrvctl.te \
    bluetooth.te \
    mediaserver.te

# USE_INTEL_MDP := true
# BUILD_WITH_FULL_STAGEFRIGHT := true
# BOARD_USES_WRS_OMXIL_CORE := true
# BOARD_USE_LIBVA_INTEL_DRIVER := true
# BOARD_USE_LIBVA := true
# BOARD_USE_LIBMIX := true

