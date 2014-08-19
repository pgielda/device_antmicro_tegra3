# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, build/target/product/full.mk)

#PRODUCT_PACKAGES += gralloc.antmicro
#PRODUCT_PACKAGES += drm_lights.antmicro
#PRODUCT_PACKAGES += v4l2_camera.antmicro
## PRODUCT_PACKAGES += busybox

PRODUCT_NAME := tegra3
TARGET_BOOTLOADER_BOARD_NAME := tegra
TARGET_BOARD_PLATFORM := tegra

# no kernel, no bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

PRODUCT_DEVICE := tegra3
PRODUCT_BRAND := Android
PRODUCT_MODEL := Tegra3 Generic

# set density to 120 (ldpi) - needed for "tablet" mode
PRODUCT_PROPERTY_OVERRIDES += \
        ro.sf.lcd_density=120

# set number of gralloc framebuffers to 2
PRODUCT_PROPERTY_OVERRIDES += \
        debug.gr.numframebuffers=2


# set ethernet as eth0
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ethernet.interface=eth0

# set sleep mode to 3 --> "wait for interrupt and ramp clock"
PRODUCT_PROPERTY_OVERRIDES += \
        pm.sleep_mode=3

# set heap size to 32 megs
PRODUCT_PROPERTY_OVERRIDES += \
        dalvik.vm.heapsize=32m

# turn off power collapse
PRODUCT_PROPERTY_OVERRIDES += \
        ro.ril.disable.power.collapse=0
        
# OpenGL settings
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	ro.zygote.disable_gl_preload=true

# prevent screen flickering
PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.render_dirty_regions=false

# GPU producer to CPU consumer not supported
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bq.gpu_to_cpu_unsupported=1

# Render UI with GPU
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 \
	debug.composition.type=gpu

# Faster boot.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.hw_quickpoweron=true

# Enable Low Ram Device flag
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true

DEVICE_PACKAGE_OVERLAYS := \
        device/generic/armv7-a-neon/overlay \
        device/antmicro/tegra3/overlay

# tablet, no sd card
PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_COPY_FILES := \
	device/antmicro/tegra3/files/init.usb.rc:root/init.usb.rc \
        device/antmicro/tegra3/files/fstab.usb:root/fstab.usb \
        device/antmicro/tegra3/files/uevent.rc:root/uevent.rc \
	device/antmicro/tegra3/files/vold.fstab:system/etc/vold.fstab \
	device/antmicro/tegra3/files/hide_cursor.sh:root/hide_cursor.sh \
	device/antmicro/tegra3/files/init:root/sbin/init \
	device/antmicro/tegra3/files/uinput:root/sbin/uinput \
	device/antmicro/tegra3/files/EP0700M06.idc:system/usr/idc/EP0700M06.idc \
        frameworks/base/data/fonts/fallback_fonts.xml:system/etc/fallback_fonts.xml \
	frameworks/base/data/fonts/system_fonts.xml:system/etc/system_fonts.xml


