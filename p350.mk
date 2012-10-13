# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/lge/p350/p350-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p350/overlay

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.pecan.rc:root/init.pecan.rc \
    $(LOCAL_PATH)/root/ueventd.pecan.rc:root/ueventd.pecan.rc \
    $(LOCAL_PATH)/root/init.pecan.usb.rc:root/init.pecan.usb.rc \

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/configs/touch_mcs7000.kl:system/usr/keylayout/touch_mcs7000.kl \
    $(LOCAL_PATH)/configs/keychars/touch_mcs7000.kcm.bin:system/usr/keychars/touch_mcs7000.kcm.bin \
    $(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/configs/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/configs/idc/synaptics.idc:system/usr/idc/synaptics.idc \
    $(LOCAL_PATH)/configs/idc/touch_mcs7000.idc:system/usr/idc/touch_mcs7000.idc 

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab


# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml


$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_LOCALES := en_GB

# Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# Display 
PRODUCT_PACKAGES += \
   libgenlock \
   libmemalloc \
   libstagefrighthw \
   libtilerenderer \
   libopencorehw \
   hwcomposer.default \
   libQcomUI \
   libgralloc \
   copybit.p350 \

# Audio
PRODUCT_PACKAGES += \
    audio_policy.p350 \
    audio.primary.p350 \
    audio.a2dp.default

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libdivxdrmdecrypt

# Apps
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    FM \
    Gallery2

# Other
PRODUCT_PACKAGES += \
    librs_jni \
    libcamera \
    lights.p350 \
    gps.p350 \
    camera.p350 \
    lgapversion

PRODUCT_PACKAGES += \
    hcitool \
    hciconfig \
    hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=p350 \
    debug.camcorder.disablemeta=1

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := p350
PRODUCT_DEVICE := p350
PRODUCT_MODEL := LG-P350
