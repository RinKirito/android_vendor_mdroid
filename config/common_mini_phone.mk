# Inherit mini common MDroid stuff
$(call inherit-product, vendor/mdroid/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/mdroid/config/telephony.mk)
