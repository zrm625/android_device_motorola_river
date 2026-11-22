# Modules that other makefiles add but this minimal build does not ship. A
# module that overrides a package keeps it from being installed. Use this for
# modules added from projects we do not fork; for build/make, edit the fork.
# Browser2, Music and MusicFX come back when Jelly, Twelve and AudioFX (which
# override them) are removed, so they are listed too.
# The CJK fonts come from external/noto-fonts/fonts.mk (river is English only).
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RiverRemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    BasicDreams \
    Browser2 \
    Contacts \
    DeviceAsWebcam \
    EasterEgg \
    Gallery2 \
    LiveWallpapersPicker \
    Music \
    MusicFX \
    NotoSansCJK-Regular.ttc \
    NotoSerifCJK-Regular.ttc \
    PhotoTable
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
