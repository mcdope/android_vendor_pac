# Check for target product
ifeq (pac_p720,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pac/overlay/aokp/device/p720

# PAC device overlay
$(shell cp -f vendor/pac/overlay/pac/lge/hdpi/frameworks/base/core/res/assets/images/android-logo-mask.png frameworks/base/core/res/assets/images/android-logo-mask.png)

# LGE ICS Bootanimation
PRODUCT_COPY_FILES += \
        vendor/pac/overlay/pac/lge/hdpi/system/media/bootanimation.zip:system/media/bootanimation.zip

# ParanoidAndroid packages [Upstream PACman doesn't include them]
PRODUCT_PACKAGES += \
    ParanoidWallpapers

# include ParanoidAndroid common configuration
include vendor/pac/config/pac_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/p720/cm.mk)

PRODUCT_NAME := pac_p720
GET_VENDOR_PROPS := $(shell vendor/pa/tools/getvendorprops.py $(PRODUCT_NAME))
endif
