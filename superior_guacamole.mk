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

# Inherit some common SuperiorExtendedOS stuff.
$(call inherit-product, vendor/superior/config/common.mk)

# Superior Flags
TARGET_SHIPS_PREBUILT_GCAM := false
TARGET_INCLUDE_MATLOG := false
USE_MOTO_CALCULATOR := false
TARGET_SUPPORTS_BLUR := true
SUPERIOR_UDFPS_ANIMATIONS := true
USE_MOTO_CLOCK := false
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true
BUILD_WITH_GAPPS := true
USE_DUCKDUCKGO := false
USE_ViaBrowser := false
TARGET_BUILD_VIMUSIC := false

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := superior_guacamole
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
    TARGET_DEVICE=OnePlus7Pro \
    TARGET_NAME=OnePlus7Pro

PRODUCT_GMS_CLIENTID_BASE := android-oneplus
