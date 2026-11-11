#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Infinity-X stuff.
$(call inherit-product, vendor/infinity/config/common_full_tablet_wifionly.mk)

# Inherit from kirby device.
$(call inherit-product, device/lenovo/kirby/device.mk)

# Keep userdebug builds debuggable.
PRODUCT_NOT_DEBUGGABLE_IN_USERDEBUG :=

INFINITY_MAINTAINER := Nero

## Device identifier
PRODUCT_DEVICE := kirby
PRODUCT_NAME := infinity_kirby
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := TB321FU
PRODUCT_MANUFACTURER := Lenovo

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-lenovo
