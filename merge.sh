#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

XDROID_VERSION=r5
XDROID_BRANCH_OLD=twelve-android-12.1.0_r1
XDROID_SOURCE=github.com/xdroid-oss
AOSP_TAG=android-12.1.0_r1
XDROID_BRANCH_NEW=twelve-dev
# XDROID_BRANCH_NEW=INA.XD.12.0-${XDROID_VERSION}.${AOSP_TAG} // Migration Purpose
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

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_bootable_recovery" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/bootable/recovery && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### Root #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_art" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/art && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_bionic" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/bionic && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_build" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/build && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_build_soong" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/build/soong && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_libcore" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/libcore && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### External #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_e2fsprogs" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/e2fsprogs && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_gptfdisk" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/gptfdisk && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_exfatprogs" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/exfatprogs && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_mksh" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/mksh && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_ntfs-3g" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/ntfs-3g && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_json-c" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/json-c && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_selinux" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/selinux && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_tinycompress" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/tinycompress && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_sqlite" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/sqlite && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_external_tinyxml" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/external/tinyxml && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### Frameworks #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_frameworks_av" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/frameworks/av && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_frameworks_base" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/frameworks/base && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_frameworks_native" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/frameworks/native && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### Hardware #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_hardware_libhardware" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/hardware/libhardware && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### Packages #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_Bluetooth" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/apps/Bluetooth && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_Nfc" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/apps/Nfc && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_ThemePicker" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/apps/ThemePicker && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_Settings" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/apps/Settings && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_apps_WallpaperPicker2" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/apps/WallpaperPicker2 && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### Modules #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_modules_adb" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/modules/adb && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_packages_modules_Connectivity" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/packages/modules/Connectivity && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

##### System #####

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_update-engine" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/system/update_engine && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_bt" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/system/bt && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_core" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/system/core && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_sepolicy" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/system/sepolicy && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@$XDROID_SOURCE/xd_system_vold" $(pwd)/temp -b ${XDROID_BRANCH_OLD}
cd $(pwd)/temp
git checkout -b ${XDROID_BRANCH_NEW}
git remote add aosp https://android.googlesource.com/platform/system/vold && git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
git push -f origin ${XDROID_BRANCH_NEW}
cd ../
rm -rf $(pwd)/temp

tg_post_msg "<b>xdroid Source Updater</b>%0A<code>Source successfull upstreamed</code>"
