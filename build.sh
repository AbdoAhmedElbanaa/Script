#!/bin/bash

# Remove old local_manifests
rm -rf .repo/local_manifests/

# ROM source repo
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs

# Clone repository
git clone https://github.com/AbdoAhmedElbanaa/device_xiaomi_miatoll.git -b 16 device/xiaomi/miatoll
git clone https://github.com/AbdoAhmedElbanaa/vendor_xiaomi_miatoll.git -b 16 vendor/xiaomi/miatoll
git clone https://github.com/AbdoAhmedElbanaa/hardware_xiaomi.git -b 16 hardware/xiaomi
git clone https://github.com/AbdoAhmedElbanaa/kernel_xiaomi_sm6250.git -b 16.0 kernel/xiaomi/sm6250
git clone https://github.com/LineageOS/android_hardware_sony_timekeep.git -b lineage-22.2 hardware/sony/timekeep
Git clone https://github.com/AbdoAhmedElbanaa/vendor_xiaomi_miuicamera.git -b 16 vendor/xiaomi/miuicamera
# Updates
git clone https://github.com/AbdoAhmedElbanaa/android_packages_apps_Updater.git -b sixteen packages/apps/Updater

# Sync
/opt/crave/resync.sh

# Set up build environment
source build/envsetup.sh

# Lunch
riseup miatoll user

# Rom Build 
rise b

#Sign Rom
gk -s 

#Rom Build Signded 
rise sb


echo "Rom Signed Builded "
