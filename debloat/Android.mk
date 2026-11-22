# Apps from AOSP product makefiles (build/make, not forked) that this minimal
# build does not ship. A module that overrides a package keeps it from being
# installed. Add names here to drop more AOSP apps without forking build/make.
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RiverRemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    BasicDreams \
    Contacts \
    DeviceAsWebcam \
    EasterEgg \
    Gallery2 \
    LiveWallpapersPicker \
    PhotoTable
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
