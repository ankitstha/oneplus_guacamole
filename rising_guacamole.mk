#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from guacamole device
$(call inherit-product, device/oneplus/guacamole/device.mk)

# Inherit some common RisingOS stuff.
$$(call inherit-product, vendor/rising/config/rising.mk)

# RisingOS Flags
RISING_MAINTAINER := c00chiemilker
WITH_GMS := false
TARGET_HAS_UDFPS := true
RISING_RAM := 6GB
RISING_STORAGE := 128GB
RISING_BATTERY := 4000mAh
RISING_DISPLAY := 1440x3120
RISING_CHIPSET := Snapdragon 855

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := rising_guacamole
PRODUCT_DEVICE := guacamole
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := GM1917
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_SYSTEM_NAME := OnePlus7Pro
PRODUCT_SYSTEM_DEVICE := OnePlus7Pro

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_CHARACTERISTICS := nosdcard

# Boot animation
scr_resolution := 1440
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="OnePlus7Pro-user 12 SKQ1.211113.001 P.202303230244 release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := "OnePlus/OnePlus7Pro/OnePlus7Pro:12/SKQ1.211113.001/P.202303230244:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-oneplus
