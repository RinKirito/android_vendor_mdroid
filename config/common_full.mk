# Inherit common MDroid stuff
$(call inherit-product, vendor/mdroid/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
