PRODUCT_BRAND ?= MiracleDROID
MDROID_BUILD := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/mdroid/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/mdroid/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/mdroid/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/mdroid/prebuilt/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/mdroid/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/mdroid/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/mdroid/prebuilt/bin/sysinit:system/bin/sysinit \
    vendor/mdroid/prebuilt/etc/init.d.rc:root/init.d.rc

# adb over network
PRODUCT_COPY_FILES += \
    vendor/mdroid/prebuilt/etc/init/mdroid-adb.rc:system/etc/init/mdroid-adb.rc

# i/o scheduler
PRODUCT_COPY_FILES += \
    vendor/mdroid/prebuilt/etc/init/mdroid-iosched.rc:system/etc/init/mdroid-iosched.rc

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Include MiracleDROID audio files
include vendor/mdroid/config/mdroid_audio.mk

# Bootanimation
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/mdroid/prebuilt/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += \
    vendor/mdroid/prebuilt/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Via \
    Gallery2 \
    Eleven \
    ExactCalculator \
    Substratum \
    Recorder \
    GoogleWallpapers \
    MusicFX \
    DeskClock \
    OmniJaws \
    WallpaperPicker

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Charger font
PRODUCT_PACKAGES += \
    charger_font.png

# Berry styles
PRODUCT_PACKAGES += \
    MDroidSystemBlackTheme \
    MDroidSystemDarkTheme \
    MDroidSystemUIBlackTheme \
    MDroidSystemUIDarkTheme \
    MDroidNotificationBlackTheme \
    MDroidNotificationDarkTheme \
    MDroidSettingsBlackTheme \
    MDroidSettingsDarkTheme \
    MDroidDialerBlackTheme \
    MDroidDialerDarkTheme \
    MDroidEbayBlackTheme \
    MDroidEbayDarkTheme \
    MDroidContactsBlackTheme \
    MDroidContactsDarkTheme \
    MDroidFilesBlackTheme \
    MDroidFilesDarkTheme \
    MDroidMessagingBlackTheme \
    MDroidMessagingDarkTheme \
    MDroidPhoneBlackTheme \
    MDroidPhoneDarkTheme \
    MDroidTelecomBlackTheme \
    MDroidTelecomDarkTheme \
    MDroidCalculatorBlackTheme \
    MDroidCalculatorDarkTheme \
    MDroidGboardBlackTheme \
    MDroidGboardDarkTheme \
    MDroidGboardLightTheme \
    MDroidCalendarBlackTheme \
    MDroidCalendarDarkTheme \
    MDroidGooglePackageInstallerBlackTheme \
    MDroidGooglePackageInstallerDarkTheme \
    MDroidEmailBlackTheme \
    MDroidEmailDarkTheme \
    MDroidFMRadioBlackTheme \
    MDroidFMRadioDarkTheme \
    MDroidElevenBlackTheme \
    MDroidElevenDarkTheme \
    MDroidRecorderBlackTheme \
    MDroidRecorderDarkTheme \
    MDroidXiaomiPartsBlackTheme \
    MDroidXiaomiPartsDarkTheme \
    MDroidBlackAccent \
    MDroidBlueAccent \
    MDroidBlueLightAccent \
    MDroidBrownAccent \
    MDroidCyanAccent \
    MDroidGreenAccent \
    MDroidGreenLightAccent \
    MDroidLimeAccent \
    MDroidGreyAccent \
    MDroidGreyBlueAccent \
    MDroidAmberAccent \
    MDroidOrangeAccent \
    MDroidOrangeDeepAccent \
    MDroidPinkAccent \
    MDroidBubblegumPinkAccent \
    MDroidPixelAccent \
    MDroidNetflixAccent \
    MDroidPurpleAccent \
    MDroidPurpleDeepAccent \
    MDroidIndigoAccent \
    MDroidRedAccent \
    MDroidTealAccent \
    MDroidWhiteAccent \
    MDroidYellowAccent

# Fonts
PRODUCT_PACKAGES += \
    MDroid-Fonts

# Turbo
PRODUCT_PACKAGES += \
    Turbo \
    turbo.xml

# Extra tools in Lineage
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_CM_CHARGER),true)
PRODUCT_PACKAGES += \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Needs for MTP Dirty Hack
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1

DEVICE_PACKAGE_OVERLAYS += vendor/mdroid/overlay/common

# Versioning
include vendor/mdroid/config/version.mk

# MDROID OTA
include vendor/mdroid/config/ota.mk

# Permissions
PRODUCT_PACKAGES += \
    privapp-permissions-google.xml

PRODUCT_COPY_FILES += \
    vendor/mdroid/config/permissions/privapp-permissions-mdroid.xml:system/etc/permissions/privapp-permissions-mdroid.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=log

# Clean up packages cache to avoid wrong strings and resources
PRODUCT_COPY_FILES += \
    vendor/mdroid/prebuilt/bin/clean_cache.sh:system/bin/clean_cache.sh

$(call prepend-product-if-exists, vendor/extra/product.mk)
