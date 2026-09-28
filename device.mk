#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Non_ab_device
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.2-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_PACKAGES += \
    android.hardware.vulkan.compute-0.prebuilt.xml \
    android.hardware.vulkan.level-1.prebuilt.xml

TARGET_SCREEN_HEIGHT := 2000
TARGET_SCREEN_WIDTH := 1200

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl:64

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mediatek \
    android.hardware.health-service.mediatek-recovery

# ION
$(call soong_config_set_bool,libion,legacy_impl,true)

# Kernel Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel/modules.load.recovery:$(TARGET_COPY_OUT_RECOVERY)/root/lib/modules/modules.load.recovery

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek

# Overlay
PRODUCT_ENFORCE_RRO_TARGETS := *

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# Properties
include hardware/mediatek/configs/properties/vendor_logtag.mk

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt8188.rc

# Rootdir
PRODUCT_PACKAGES += \
    fstab.emmc \
    fstab.emmc.vendor_ramdisk \
    fstab.enableswap \
    init.insmod.sh \
    init.mt8188.rc \
    ueventd.mt8188.rc

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek \
    hardware/mediatek/libmtkperf_client

# SPL
VENDOR_SECURITY_PATCH := 2021-08-05

# Touch
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml

PRODUCT_PACKAGES += \
    android.hardware.faketouch.prebuilt.xml

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek \
    android.hardware.usb.gadget-service.mediatek \
    init.mt8188.usb.rc

PRODUCT_PACKAGES += \
    android.hardware.usb.accessory.prebuilt.xml \
    android.hardware.usb.host.prebuilt.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Verified Boot
PRODUCT_PACKAGES += \
    android.software.verified_boot.prebuilt.xml

# VNDK
PRODUCT_PACKAGES += \
    vndservicemanager

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/sunstone/sunstone-vendor.mk)
