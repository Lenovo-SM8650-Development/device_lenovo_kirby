# Lenovo Legion Y700 3rd gen (TB321FU, kirby)

Standalone device tree for Infinity-X, based on CN firmware
TB321FU_CN_OPEN_USER_Q00002.0_W_DF_17.5.10.298_ST_260511.
No common tree and no build-system patches are needed.

## Repositories

| Path | Repository | Branch |
| --- | --- | --- |
| device/lenovo/kirby | Lenovo-SM8650-Development/android_device_lenovo_kirby | standalone |
| vendor/lenovo/kirby | Lenovo-SM8650-Development/proprietary_vendor_lenovo_kirby | standalone |
| kernel/lenovo/sm8650 | Lenovo-SM8650-Development/kernel_lenovo_sm8650 | kirby |
| kernel/lenovo/sm8650-modules | Lenovo-SM8650-Development/kernel_lenovo_sm8650-modules | kirby |

## Build

```sh
. build/envsetup.sh
lunch infinity_kirby-cp2a-userdebug
m bacon
```

## Notes

- Flash on top of CN .298 firmware. DTB, DTBO and pvmfw in `prebuilts/`
  are from that firmware; pvmfw is included in vbmeta.
- The touch module is the stock .298 binary, installed by
  `kernel/lenovo/sm8650-modules/lenovo/nvt-stock`.
- Blobs: `./extract-files.py <dump>` against a .298 dump, then commit
  `vendor/lenovo/kirby`.
