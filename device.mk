#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mediatek \
    android.hardware.health-service.mediatek-recovery

# Kernel Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel/modules.load.recovery:$(TARGET_COPY_OUT_RECOVERY)/root/lib/modules/modules.load.recovery

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt8188.rc

# Rootdir
PRODUCT_PACKAGES += \
    fstab.emmc \
    fstab.emmc.vendor_ramdisk

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek

# Verified Boot
PRODUCT_PACKAGES += \
    android.software.verified_boot.prebuilt.xml

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/sunstone/sunstone-vendor.mk)
