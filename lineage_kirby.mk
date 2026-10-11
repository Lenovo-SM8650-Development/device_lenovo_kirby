#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from kirby device.
$(call inherit-product, device/lenovo/kirby/device.mk)

## Device identifier
PRODUCT_DEVICE := kirby
PRODUCT_NAME := lineage_kirby
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := TB321FU
PRODUCT_MANUFACTURER := lenovo

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc=$(call normalize-path-list, "Lenovo TB321FU TB321FU 15 AQ3A.240912.001 ZUXOS_1.1.10.032_250422_PRC user release-keys")

BUILD_FINGERPRINT := Lenovo/TB321FU/TB321FU:15/AQ3A.240912.001/ZUXOS_1.1.10.032_250422_PRC:user/release-keys

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-lenovo