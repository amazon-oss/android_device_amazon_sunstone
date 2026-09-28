#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Kernel Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel/modules.load.recovery:$(TARGET_COPY_OUT_RECOVERY)/root/lib/modules/modules.load.recovery

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt8188.rc

# Rootdir
PRODUCT_PACKAGES += \
    fstab.emmc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Verified Boot
PRODUCT_PACKAGES += \
    android.software.verified_boot.prebuilt.xml

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/sunstone/sunstone-vendor.mk)
