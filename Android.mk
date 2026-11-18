LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),kirby)

# Include the recovery prebuilt in target-files for AVB descriptor generation.
$(call add-radio-file,prebuilts/recovery.img)
endif
