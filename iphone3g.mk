# include common makefile for platform
$(call inherit-product-if-exists, device/apple/common/common.mk)

# apns config file
PRODUCT_COPY_FILES += \
    device/apple/iphone3G/prebuilt/apns-conf.xml:system/etc/apns-conf.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=20 \
    ro.telephony.ril_class=apple \
    ro.telephony.sends_barcount=1 \
    mobiledata.interfaces=/dev/omap_csmi_tty1,pdp0,eth0,gprs,ppp0 \
    dalvik.vm.heapsize=64m \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
#PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including
# this file must pay attention to the fact that the first entry in the final
# PRODUCT_LOCALES expansion must not be a density.
PRODUCT_LOCALES := hdpi

#kernel modules
#PRODUCT_COPY_FILES += \
#    device/apple/iphone3G/prebuilt/cifs.ko:system/lib/modules/cifs.ko

# kernel modules for ramdisk
PRODUCT_COPY_FILES += \
    device/apple/iphone3g/prebuilt/sd8686.bin:system/etc/firmware/sd8686.bin \
    device/apple/iphone3g/prebuilt/sd8686_helper.bin:system/etc/firmware/sd8686_helper.bin \
    device/apple/iphone3g/prebuilt/zephyr2.bin:system/etc/firmware/zephyr2.bin \
    device/apple/iphone3g/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/apple/iphone3g/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/apple/iphone3g/prebuilt/init.rc:root/init.rc \
    device/apple/iphone3g/prebuilt/initDroid.sh:root/initDroid.sh

#GPIO and ALSA
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_DIR)asound.conf:system/etc/asound.conf \
    $(LOCAL_DIR)asound.state:system/etc/asound.state

# kernel modules for recovery ramdisk
#PRODUCT_COPY_FILES += \
#    device/apple/iphone3G/j4fs.ko:recovery/root/lib/modules/j4fs.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/apple/iphone3g/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/apple/iphone3g/iphone3g-vendor.mk)
