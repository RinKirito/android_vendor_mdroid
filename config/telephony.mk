# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/elixir/prebuilt/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/elixir/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_GENERIC_PROPERTIES += \
    net.tethering.noprovisioning=true

