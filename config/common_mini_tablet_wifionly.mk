# Inherit mini common Elixir stuff
$(call inherit-product, vendor/elixir/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
