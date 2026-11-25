# Inherit some common Lineage stuff.
# Wi-Fi only: no calls, texts, or mobile data. This uses the Lineage and AOSP
# product layers without telephony (common_full_phone.mk and
# full_base_telephony.mk add the phone stack). tablet.mk is left out on
# purpose so the UI stays in phone mode.
# Test phone: on debug builds, adb is on and authorized from first boot, so
# wipes and benchmarks need no setup on the phone. Must be set before
# vendor/lineage/config/common.mk is inherited.
ifneq ($(TARGET_BUILD_VARIANT),user)
WITH_ADB_INSECURE := true
endif

# No Dynamic System Updates (booting a GSI from /data). We flash with fastboot.
PRODUCT_NO_DYNAMIC_SYSTEM_UPDATE := true

# One zygote: 64-bit only. core_64_bit.mk otherwise also starts the 32-bit
# zygote_secondary, which stays resident although no app on this phone is
# 32-bit only. The 32-bit libraries stay for the vendor blobs.
ZYGOTE_FORCE_64 := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/lineage/config/common_mobile_full.mk)
$(call inherit-product, vendor/lineage/config/wifionly.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# From common_full_phone.mk and full_base_telephony.mk, minus telephony.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

# Bound the HWUI resource cache in app processes.
PRODUCT_SYSTEM_PROPERTIES += debug.hwui.app_memory_policy=extremelowram

# Gesture navigation by default, even if the setup wizard is skipped. Overlay
# Manager enables the overlays named here for every new user.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# Perch replaces Trebuchet (its module overrides TrebuchetQuickStep and
# TrebuchetOverlay). It is also the Recents provider, for swipe-up-to-home; see
# config_recentsComponentName in the framework overlay and perch/Android.bp.
PRODUCT_PACKAGES += \
    Perch

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    device/motorola/river/configs/river-unavailable-features.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/river-unavailable-features.xml \
    device/motorola/river/configs/river-disabled-components.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/river-disabled-components.xml

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
