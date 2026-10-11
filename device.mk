#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8650-common
$(call inherit-product, device/lenovo/sm8650-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/lenovo/kirby/kirby-vendor.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
