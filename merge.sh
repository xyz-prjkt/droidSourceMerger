#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

XDROID_VERSION=rev2.0
XDROID_CODENAME=mnmlistyou
XDROID_REVISION=xd_${XDROID_VERSION}.${XDROID_CODENAME}
CAF_TAG=LA.QSSI.12.0.r1-05000.01-qssi.0
SOURCE=https://github.com/xdroid-CAF

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
tg_post_msg() {
	curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHAT_ID" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"
}

# Send Upstream Source Information
tg_post_msg "<b>xdroid Source Updater</b>%0A<b>xdroid Revision</b>: <code>${XDROID_REVISION}</code>%0A<b>CAF Revision</b>: <code>${CAF_TAG}</code>%0A<b>xdroid Version</b>: <code>${XDROID_VERSION}</code>%0A<b>xdroid Codename</b>: <code>${XDROID_CODENAME}</code>"

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/libcore" $(pwd)/libcore -b twelve
cd $(pwd)/libcore
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/libcore && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../
rm -rf $(pwd)/libcore

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_bootable_recovery" $(pwd)/bootable/recovery -b twelve
cd $(pwd)/bootable/recovery
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/bootable/recovery && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../
rm -rf $(pwd)/bootable/recovery

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_build_make" $(pwd)/build/make -b twelve
cd $(pwd)/build/make
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/build && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/build/make

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_build_soong" $(pwd)/build/soong -b twelve
cd $(pwd)/build/soong
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/build/soong && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/build/soong

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_base" $(pwd)/frameworks/base -b twelve
cd $(pwd)/frameworks/base
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/base && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/frameworks/base

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_packages_apps_Settings" $(pwd)/packages/apps/Settings -b twelve
cd $(pwd)/packages/apps/Settings
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/apps/Settings && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/packages/apps/Settings

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_packages_modules_Permission" $(pwd)/packages/modules/Permission -b twelve
cd $(pwd)/packages/modules/Permission
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/modules/Permission && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/packages/modules/Permission

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_packages_modules_Wifi" $(pwd)/packages/modules/Wifi -b twelve
cd $(pwd)/packages/modules/Wifi
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/modules/Wifi && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/packages/modules/Wifi

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_packages_modules_Connectivity" $(pwd)/packages/modules/Connectivity -b twelve
cd $(pwd)/packages/modules/Connectivity
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/modules/Connectivity && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/packages/modules/Connectivity

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_core" $(pwd)/system/core -b twelve
cd $(pwd)/system/core
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/core && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/core

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_tools_hidl" $(pwd)/system/tools/hidl -b twelve
cd $(pwd)/system/tools/hidl
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/tools/hidl && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/system/tools/hidl

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_power" $(pwd)/vendor/qcom/opensource/power -b twelve
cd $(pwd)/vendor/qcom/opensource/power
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/power && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/power

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_interfaces" $(pwd)/vendor/qcom/opensource/interfaces -b twelve
cd $(pwd)/vendor/qcom/opensource/interfaces
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/interfaces && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/interfaces

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_commonsys_fm" $(pwd)/vendor/qcom/opensource/fm -b twelve
cd $(pwd)/vendor/qcom/opensource/fm
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/fm-commonsys && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/fm

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_vibrator" $(pwd)/vendor/qcom/opensource/vibrator -b twelve
cd $(pwd)/vendor/qcom/opensource/vibrator
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/vibrator && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/vibrator

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_usb" $(pwd)/vendor/qcom/opensource/usb -b twelve
cd $(pwd)/vendor/qcom/opensource/usb
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/usb && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/usb

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_display-commonsys" $(pwd)/vendor/qcom/opensource/display -b twelve
cd $(pwd)/vendor/qcom/opensource/display
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/display-commonsys && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/display

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_commonsys-intf_display" $(pwd)/vendor/qcom/opensource/intfdisplay -b twelve
cd $(pwd)/vendor/qcom/opensource/intfdisplay
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/display-commonsys-intf && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/qcom/opensource/intfdisplay

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_codeaurora_telephony" $(pwd)/vendor/codeaurora/commonsys/telephony -b twelve
cd $(pwd)/vendor/codeaurora/commonsys/telephony
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/codeaurora/telephony && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../../..
rm -rf $(pwd)/vendor/codeaurora/commonsys/telephony

tg_post_msg "<b>xdroid Source Updater</b>%0A<code>Source successfull upstreamed</code>"
