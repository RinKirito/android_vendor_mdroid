MDROID_CODENAME := MW
MDROID_REVISION := 1.0

ifndef MDROID_BUILDTYPE
  MDROID_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst mdroid_,,$(TARGET_PRODUCT_SHORT))

MDROID_VERSION := $(MDROID_REVISION)-$(MDROID_CODENAME)-$(MDROID_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(shell date -u +%Y%m%d-%H%M)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID="$(BUILD_ID)-$(shell whoami)@$(shell hostname)"

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    mdroid.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.mdroid.version=$(MDROID_VERSION) \
    ro.modversion=MDROIDROM-$(MDROID_VERSION) \
    ro.mdroid.buildtype=$(MDROID_BUILDTYPE)

ifeq ($(MDROID_BUILDTYPE), Official)
	    MDROID_TAG := Official
	else ifeq ($(MDROID_BUILDTYPE), Alpha)
	    MDROID_TAG := Alpha
	else ifeq ($(MDROID_BUILDTYPE), Beta)
	    MDROID_TAG := Beta
	else ifeq ($(MDROID_BUILDTYPE), Snapshot)
	    MDROID_TAG := Test
	else
	    MDROID_TAG := Unofficial
endif




