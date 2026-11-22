# Inherit some common Lineage stuff.
# Wi-Fi only: no calls, texts, or mobile data. This uses the Lineage and AOSP
# product layers without telephony (common_full_phone.mk and
# full_base_telephony.mk add the phone stack). tablet.mk is left out on
# purpose so the UI stays in phone mode.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/lineage/config/common_mobile_full.mk)
$(call inherit-product, vendor/lineage/config/wifionly.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# From common_full_phone.mk and full_base_telephony.mk, minus telephony.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := river
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g(7)
PRODUCT_NAME := lineage_river

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="river_retail-user 10 QPUS30.52-33-11 df129 release-keys" \
    BuildFingerprint=motorola/river_retail/river:10/QPUS30.52-33-11/df129:user/release-keys
