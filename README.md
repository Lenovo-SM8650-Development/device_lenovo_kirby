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

## CN .298 boot prerequisites

- Keep the original composer executable and its Android composer V2 / QTI
  composer V1 interface libraries. Rewriting their SONAME requirements to V4/V3
  caused a repeated composer crash in the cleaned tree. The `-kirby` module
  names select the matching binary interfaces using private
  installed SONAMEs to avoid collisions with current-source AIDL modules. Do not disable the composer's dependency/ELF checks.
- Graphics-common V4 in `prebuilts/lib64/` comes from
  `prebuilts/vndk/v34/arm64/arch-arm64-armv8-a/shared/vndk-sp/`.
  Only its SONAME is renamed; its executable code is retained.
  It supplies the parcelable ABI required by the original composer V2 library;
  it is independent of current-source graphics-common V7.
- Package `pd-mapper`, its `libjson` provider, and the hearing-aid audio policy
  XML. The existing mapper service supplies the DSP locator information needed
  before GPR/APM can create the sound card. Preserve its filesystem capability.
- Explicitly select the GKI modules listed in `configs/modules/modules.system_dlkm`.
  The kernel build then installs/signs them in system_dlkm. Leaving that image
  empty moves unsigned GKI modules into vendor_dlkm and causes protected-export
  rejection (observed for rfkill). Keep kernel module signature protection on.

The isolated composer test stopped composer/SurfaceFlinger/zygote restarts;
trusted GKI signatures allowed rfkill and Bluetooth-FM modules to load. With
the mapper restored the sound card registers, AudioFlinger/AudioPolicy come up
and boot completes (confirmed on device 2026-11-12 with a patched test vendor
image). Temporary boot log collectors and modified init binaries are
investigation artifacts and are not part of these trees.
