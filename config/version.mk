ELIXIR_REVISION := 1.0

ifndef ELIXIR_BUILDTYPE
  ELIXIR_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst elixir_,,$(TARGET_PRODUCT_SHORT))

ELIXIR_VERSION := $(ELIXIR_REVISION)-$(ELIXIR_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(shell date +"%Y%m%d")
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID="$(BUILD_ID)-$(shell whoami)@$(shell hostname)"

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.elixir.version=$(ELIXIR_VERSION) \
    ro.modversion=ElixirROM-$(ELIXIR_VERSION) \
    ro.elixir.buildtype=$(ELIXIR_BUILDTYPE)

ifeq ($(ELIXIR_BUILDTYPE), Official)
	    ELIXIR_TAG := Official
	else ifeq ($(ELIXIR_BUILDTYPE), Alpha)
	    ELIXIR_TAG := Alpha
	else ifeq ($(ELIXIR_BUILDTYPE), Beta)
	    ELIXIR_TAG := Beta
	else ifeq ($(ELIXIR_BUILDTYPE), Snapshot)
	    ELIXIR_TAG := Test
	else
	    ELIXIR_TAG := Unofficial
endif



