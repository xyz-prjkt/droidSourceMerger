#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

XDROID_VERSION=rev2.0
XDROID_CODENAME=mnmlistyou
XDROID_REVISION=xd_${XDROID_VERSION}.${XDROID_CODENAME}
XDROID_BRANCH=xd.xii
AOSP_TAG=android-12.0.0_r15
SOURCE=https://github.com/xdroidsp

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
tg_post_msg() {
	curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHAT_ID" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"
}

# Send Upstream Source Information
tg_post_msg "<b>xdroid Source Updater</b>%0A<b>xdroid Revision</b>: <code>${XDROID_REVISION}</code>%0A<b>AOSP Revision</b>: <code>${AOSP_TAG}</code>%0A<b>xdroid Version</b>: <code>${XDROID_VERSION}</code>%0A<b>xdroid Codename</b>: <code>${XDROID_CODENAME}</code>"

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_bionic" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/bionic && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_build" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/build && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_build_soong" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/build/soong && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_external_tinycompress" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/external/tinycompress && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_external_tinyxml" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/external/tinyxml && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_external_selinux" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/external/selinux && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_external_themelib" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/external/themelib && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_external_colorkt" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/external/colorkt && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_frameworks_base" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/frameworks/base && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_hardware_libhardware" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/hardware/libhardware && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_frameworks_base" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/frameworks/base && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_packages_apps_Settings" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/packages/apps/Settings && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_packages_apps_ThemePicker" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/packages/apps/ThemePicker && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_packages_apps_Launcher3" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/packages/apps/Launcher3 && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_packages_modules_Connectivity" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/packages/modules/Connectivity && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_packages_modules_Permission" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/packages/modules/Permission && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_system_core" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/system/core && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroidsp/xd_libcore" $(pwd)/temp -b ${XDROID_BRANCH}
cd $(pwd)/temp
git checkout -b staging-${AOSP_TAG}
git remote add aosp https://android.googlesource.com/platform/libcore && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${AOSP_TAG}
cd ../
rm -rf $(pwd)/temp

tg_post_msg "<b>xdroid Source Updater</b>%0A<code>Source successfull upstreamed</code>"
