LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),kirby)

# Stock recovery (chained in vbmeta) must be present in target-files so
# add_img_to_target_files can compute the vbmeta digest.
$(call add-radio-file,prebuilts/recovery.img)
endif
