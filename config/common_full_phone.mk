# Inherit full common Elixir stuff
$(call inherit-product, vendor/elixir/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Elixir LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/elixir/overlay/dictionaries

$(call inherit-product, vendor/elixir/config/telephony.mk)
