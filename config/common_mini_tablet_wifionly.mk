# Inherit mini common <Droid stuff
$(call inherit-product, vendor/mdroid/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
