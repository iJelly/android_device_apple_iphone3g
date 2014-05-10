LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := gpio-keys.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the open-source counterpart to this file
-include libsensor/Android.mk
-include pmb8878/Android.mk
-include liblights/Android.mk
