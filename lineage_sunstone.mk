#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device makefile.
$(call inherit-product, device/amazon/sunstone/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_sunstone
PRODUCT_DEVICE := sunstone
PRODUCT_MANUFACTURER := Amazon
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := Fire Max 11
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_GMS_CLIENTID_BASE := android-amazon

PRODUCT_SYSTEM_PROPERTIES += \
    ro.product.manufacturer=Amzn

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="full_p11-user 11 RP1A.200720.011 60 release-keys" \
    BuildFingerprint=Lenovo/TB-J616F/TB-J616F:11/RP1A.200720.011/TB-J616F_S000031_210723_ROW:user/release-keys \
    DeviceProduct=sunstone
