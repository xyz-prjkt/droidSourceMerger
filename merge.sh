#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

XDROID_VERSION=r1
XDROID_SOURCE=github.com/xdroid-oss
AOSP_TAG=android-13.0.0_r3
XDROID_BRANCH_NEW=thirteen
XDROID_REVISION=${XDROID_BRANCH_NEW}

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
tg_post_msg() {
	curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHAT_ID" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"
}

# Send Upstream Source Information
tg_post_msg "<b>xdroid Source Updater</b>%0A<b>xdroid Revision</b>: <code>${XDROID_REVISION}</code>%0A<b>AOSP Revision</b>: <code>${AOSP_TAG}</code>%0A<b>xdroid Version</b>: <code>${XDROID_VERSION}</code>"

##### Bootable #####

git clone https://android.googlesource.com/platform/bootable/recovery $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_bootable_recovery"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### Root #####

git clone https://android.googlesource.com/platform/art $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_art"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/bionic $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_bionic"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/build $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_build"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/build/soong $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_build_soong"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/build/libcore $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_libcore"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### External #####

git clone https://android.googlesource.com/platform/external/e2fsprogs $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_e2fsprogs"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/gptfdisk $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_gptfdisk"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/exfatprogs $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_exfatprogs"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/mksh $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_mksh"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/ntfs-3g $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_ntfs-3g"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/json-c $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_json-c"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/selinux $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_selinux"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/tinycompress $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_tinycompress"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/sqlite $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_sqlite"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/external/tinyxml $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_tinyxml"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### Frameworks #####

git clone https://android.googlesource.com/platform/frameworks/av $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_frameworks_av"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/frameworks/base $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_frameworks_base"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/frameworks/native $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_frameworks_native"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### Hardware #####

git clone https://android.googlesource.com/platform/hardware/libhardware $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_hardware_libhardware"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### Packages #####

git clone https://android.googlesource.com/platform/packages/apps/Bluetooth $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_Bluetooth"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/packages/apps/Nfc $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_Nfc"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/packages/apps/ThemePicker $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_ThemePicker"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/packages/apps/Settings $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_Settings"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/packages/apps/WallpaperPicker2 $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_WallpaperPicker2"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### Modules #####

git clone https://android.googlesource.com/platform/packages/modules/adb $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_modules_adb"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/packages/modules/Connectivity $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_modules_Connectivity"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

##### System #####

git clone https://android.googlesource.com/platform/system/update_engine $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_update-engine"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/system/bt $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_bt"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/system/core $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_core"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/system/sepolicy $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_sepolicy"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

git clone https://android.googlesource.com/platform/system/vold $(pwd)/temp -b ${AOSP_TAG}
cd $(pwd)/temp
git remote add xd "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_vold"
git checkout -b ${XDROID_BRANCH_NEW}
git push -f xd ${XDROID_BRANCH_NEW}
cd $(pwd)
rm -rf $(pwd)/temp

tg_post_msg "<b>xdroid Source Updater</b>%0A<code>Source successfull upstreamed</code>"
