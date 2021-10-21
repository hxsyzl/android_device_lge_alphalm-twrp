#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Define hardware platform
PRODUCT_PLATFORM := msmnile

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from common omni config
$(call inherit-product, vendor/omni/config/common.mk)

# Release name (automatically taken from this file's suffix)
PRODUCT_RELEASE_NAME := $(lastword $(subst /, ,$(lastword $(subst _, ,$(firstword $(subst ., ,$(MAKEFILE_LIST)))))))

# OEM Info (automatically taken from device tree path)
BOARD_VENDOR := $(or $(word 2,$(subst /, ,$(firstword $(MAKEFILE_LIST)))),$(value 2))
# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := alphalm
PRODUCT_NAME := omni_alphalm
PRODUCT_BRAND := lge
PRODUCT_MODEL := LM-G820
PRODUCT_MANUFACTURER := lge
		
# Inherit from alphalm configuration
$(call inherit-product, device/lge/alphalm/device.mk)
		