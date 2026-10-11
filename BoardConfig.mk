#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lenovo/kirby

# Inherit from sm8650-common
include device/lenovo/sm8650-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 440

# Inherit from the proprietary version
include vendor/lenovo/kirby/BoardConfigVendor.mk
