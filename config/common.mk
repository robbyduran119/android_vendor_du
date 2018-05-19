PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.build.selinux=1

PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/du/prebuilt/common/bin/sysinit:system/bin/sysinit

# Init file
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/init.local.rc:root/init.du.rc

# LatinIME gesture typing
ifneq ($(filter tenderloin,$(TARGET_PRODUCT)),)
ifneq ($(filter shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/du/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/du/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
endif
endif

# Fix Google dialer
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/du/google/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/du/google/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/extras/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/extras/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/extras/tools/50-du.sh:system/addon.d/50-du.sh

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/extras/tools/clean_cache.sh:system/bin/clean_cache.sh

# Packages
include vendor/du/config/packages.mk

# Branding
include vendor/du/config/branding.mk

# Fonts Stuff - Copy to System fonts
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/fonts/gobold/Gobold.ttf:system/fonts/Gobold.ttf \
    vendor/du/prebuilt/fonts/gobold/Gobold-Italic.ttf:system/fonts/Gobold-Italic.ttf \
    vendor/du/prebuilt/fonts/gobold/GoboldBold.ttf:system/fonts/GoboldBold.ttf \
    vendor/du/prebuilt/fonts/gobold/GoboldBold-Italic.ttf:system/fonts/GoboldBold-Italic.ttf \
    vendor/du/prebuilt/fonts/gobold/GoboldThinLight.ttf:system/fonts/GoboldThinLight.ttf \
    vendor/du/prebuilt/fonts/gobold/GoboldThinLight-Italic.ttf:system/fonts/GoboldThinLight-Italic.ttf \
    vendor/du/prebuilt/fonts/roadrage/road_rage.ttf:system/fonts/RoadRage-Regular.ttf \
    vendor/du/prebuilt/fonts/snowstorm/snowstorm.ttf:system/fonts/Snowstorm-Regular.ttf \
    vendor/du/prebuilt/fonts/vcrosd/vcr_osd_mono.ttf:system/fonts/ThemeableClock-vcrosd.ttf \
    vendor/du/prebuilt/fonts/googlesans/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/du/prebuilt/fonts/fontage/AdamCGPro-Regular.ttf:system/fonts/AdamCGPro-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/AlexanaNeue-Regular.ttf:system/fonts/AlexanaNeue-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/AlienLeague-Regular.ttf:system/fonts/AlienLeague-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Azedo-Light.ttf:system/fonts/Azedo-Light.ttf \
    vendor/du/prebuilt/fonts/fontage/BigNoodleTilting-Italic.ttf:system/fonts/BigNoodleTilting-Italic.ttf \
    vendor/du/prebuilt/fonts/fontage/BigNoodleTilting-Regular.ttf:system/fonts/BigNoodleTilting-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Biko-Regular.ttf:system/fonts/Biko-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Blern-Regular.ttf:system/fonts/Blern-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/CoCoBiker-Regular.ttf:system/fonts/CoCoBiker-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Fester-Medium.ttf:system/fonts/Fester-Medium.ttf \
    vendor/du/prebuilt/fonts/fontage/GinoraSans-Regular.ttf:system/fonts/GinoraSans-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Inkferno-Regular.ttf:system/fonts/Inkferno-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Instruction-Regular.ttf:system/fonts/Instruction-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/JackLane-Regular.ttf:system/fonts/JackLane-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Metropolis1920-Regular.ttf:system/fonts/Metropolis1920-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Monad-Regular.ttf:system/fonts/Monad-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Neoneon-Regular.ttf:system/fonts/Neoneon-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Noir-Regular.ttf:system/fonts/Noir-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/North-Regular.ttf:system/fonts/North-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/OutrunFuture-Regular.ttf:system/fonts/OutrunFuture-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Qontra-Regular.ttf:system/fonts/Qontra-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Riviera-Regular.ttf:system/fonts/Riviera-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/FoxAndCat-Regular.ttf:system/fonts/ThemeableDate-fc.ttf \
    vendor/du/prebuilt/fonts/fontage/FoxAndCat-Regular.ttf:system/fonts/ThemeableOwner-fc.ttf \
    vendor/du/prebuilt/fonts/fontage/TheOutbox-Regular.ttf:system/fonts/TheOutbox-Regular.ttf \
    vendor/du/prebuilt/fonts/fontage/Union-Regular.ttf:system/fonts/Union-Regular.ttf

# Bootanimation
ifneq ($(filter taimen shamu angler dumpling hammerhead cheeseburger oneplus3 potter tenderloin dragon,$(TARGET_PRODUCT)),)
include vendor/du/config/bootanimation.mk
else
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip
endif

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/du/overlay/common

# Google sounds
include vendor/du/google/GoogleAudio.mk
