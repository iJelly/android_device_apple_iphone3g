BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

BOARD_USES_LIBSECRIL_STUB := true

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := arm1176jz-s
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=arm1176jz-s -mfpu=vfp -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=arm1176jz-s -mfpu=vfp -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_RC := true
TARGET_PROVIDES_INIT_TARGET_RC := true
#TODO: implement of recovery image
#TARGET_BOARD_PLATFORM := s5l8900
#TARGET_BOOTLOADER_BOARD_NAME := IPHONE3G
#TARGET_RECOVERY_INITRC := device/apple/iphone3G/common/recovery.rc
TARGET_PROVIDES_MEDIASERVER := true

BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"

#TODO:
# Releasetools
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/apple/common/releasetools/iphone3g_ota_from_target_files
#TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/apple/common/releasetools/iphone3g_img_from_target_files

# Camera
USE_CAMERA_STUB := true
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
TARGET_GLOBAL_CPPFLAGS += -DUSE_GS2_LIBCAMERA
endif

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# gps
BOARD_USES_GPSWRAPPER := true

#TODO: if We reprogram chip and enable functions...
# FM Radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := ?

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := device/apple/iphone3g/vibrator/vibrator.c

#TODO: fix this for Kernel build inside B2G
#BOARD_NAND_PAGE_SIZE := 4096 -s 128
#BOARD_NAND_PAGE_SIZE := 4096
#BOARD_KERNEL_PAGESIZE := 4096
#BOARD_KERNEL_BASE := 0x40000000
#BOARD_KERNEL_CMDLINE := console=ttySAC2,115200 consoleblank=0
#TARGET_PREBUILT_KERNEL := device/apple/iphone3g/prebuilt/kernel

TARGET_BOOTIMAGE_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

#TODO: boot (openiboot) partition size for complete removing iBoot
#BOARD_BOOTIMAGE_PARTITION_SIZE := ?
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 104857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 104857600
BOARD_FLASH_BLOCK_SIZE := 4096

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
#TODO: implement this
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_?
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_?
#BOARD_WLAN_DEVICE := libertas_sdio
#WIFI_DRIVER_MODULE_PATH := "/lib/modules/libertas_sdio.ko"
#WIFI_DRIVER_MODULE_NAME := "libertas_sdio"

# Vold
BOARD_VOLD_MAX_PARTITIONS := 12
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
#TODO: when (one day) recovery stuff will be added, use custom mappings
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := device/apple/iphone3G/recovery/recovery_ui.c
#BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true

#TODO
#BOARD_CUSTOM_BOOTIMG_MK := device/apple/iphone3G/common/shbootimg.mk

# assert
#TARGET_OTA_ASSERT_DEVICE := IPHONE3G
