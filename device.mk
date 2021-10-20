#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/lge/alphalm
# A/B

AB_OTA_PARTITIONS += \
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
		product \
    system \
    vendor \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service \
		bootctrl.$(PRODUCT_PLATFORM).recovery

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
		

PRODUCT_PACKAGES += \
		qcom_decrypt \
		qcom_decrypt_fbe
				
PRODUCT_BUILD_PROP_OVERRIDES += \
		PRODUCT_NAME=alphalm_lao_com \
		BUILD_PRODUCT=alphalm \
		TARGET_DEVICE=alphalm
		
PRODUCT_PROPERTY_OVERRIDES += \
		ro.build.product=alphalm
				
#Soong namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_EXTRA_RECOVERY_KEYS += $(LOCAL_PATH)/security/private