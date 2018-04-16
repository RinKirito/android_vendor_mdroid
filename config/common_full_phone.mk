# Inherit full common MDroid stuff
$(call inherit-product, vendor/mdroid/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include MDroid LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/mdroid/overlay/dictionaries

$(call inherit-product, vendor/mdroid/config/telephony.mk)
