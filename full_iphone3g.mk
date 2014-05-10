# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/apple/iphone3g/iphone3g.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.moz.ril.callstate_extra_int=true \
  ro.moz.ril.callstate_down_is_up=true \
  ro.moz.ril.dial_emergency_call=true

PRODUCT_NAME := full_iphone3g
PRODUCT_DEVICE := iphone3g
PRODUCT_BRAND := apple
PRODUCT_MANUFACTURER := apple
PRODUCT_MODEL := iphone3g
