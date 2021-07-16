#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

XDROID_VERSION=rev1.0
XDROID_CODENAME=Redstone
XDROID_REVISION=xd_${XDROID_VERSION}.${XDROID_CODENAME}
CAF_TAG=LA.QSSI.11.0.r1-12600-qssi.0
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

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_build_make" $(pwd)/build/make
cd $(pwd)/build/make
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/build && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/build/make

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_build_blueprint" $(pwd)/build/blueprint
cd $(pwd)/build/blueprint
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/build/blueprint && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/build/blueprint

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_build_soong" $(pwd)/build/soong
cd $(pwd)/build/soong
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/build/soong && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/build/soong

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_av" $(pwd)/frameworks/av
cd $(pwd)/frameworks/av
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/av && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/frameworks/av

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_base" $(pwd)/frameworks/base
cd $(pwd)/frameworks/base
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/base && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/frameworks/base

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_native" $(pwd)/frameworks/native
cd $(pwd)/frameworks/native
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/native && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/frameworks/native

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_opt_net_ims" $(pwd)/frameworks/opt/net_ims
cd $(pwd)/frameworks/opt/net_ims
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/opt/net/ims && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/frameworks/opt/net_ims

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_opt_net_wifi" $(pwd)/frameworks/opt/net_wifi
cd $(pwd)/frameworks/opt/net_wifi
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/opt/net/wifi && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/frameworks/opt/net_wifi

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_opt_timezonepicker" $(pwd)/frameworks/opt/timezonepicker
cd $(pwd)/frameworks/opt/timezonepicker
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/opt/timezonepicker && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/frameworks/opt/timezonepicker

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_frameworks_opt_telephony" $(pwd)/frameworks/opt/telephony
cd $(pwd)/frameworks/opt/telephony
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/opt/telephony && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/frameworks/opt/telephony

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_scudo" $(pwd)/external/scudo
cd $(pwd)/external/scudo
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/scudo && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/scudo

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_iptables" $(pwd)/external/iptables
cd $(pwd)/external/iptables
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/iptables && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/iptables

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_libcxx" $(pwd)/external/libcxx
cd $(pwd)/external/libcxx
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/libcxx && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/libcxx

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_scudo" $(pwd)/external/libpng
cd $(pwd)/external/libpng
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/libpng && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/libpng

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_nos_host_generic" $(pwd)/external/nos_host_generic
cd $(pwd)/external/nos_host_generic
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/nos/host/generic && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/nos_host_generic

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_tinycompress" $(pwd)/external/tinycompress
cd $(pwd)/external/tinycompress
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/tinycompress && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/tinycompress

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_external_zlib" $(pwd)/external/zlib
cd $(pwd)/external/zlib
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/external/zlib && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/external/zlib

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_hardware_interfaces" $(pwd)/hardware/interfaces
cd $(pwd)/hardware/interfaces
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/hardware/interfaces && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/hardware/interfaces

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_packages_apps_Bluetooth" $(pwd)/packages/apps/Bluetooth
cd $(pwd)/packages/apps/Bluetooth
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/apps/Bluetooth && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/packages/apps/Bluetooth

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_packages_apps_Settings" $(pwd)/packages/apps/Settings
cd $(pwd)/packages/apps/Settings
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/apps/Settings && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/packages/apps/Settings

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_art" $(pwd)/art
cd $(pwd)/art
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/art && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../
rm -rf $(pwd)/art

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_bionic" $(pwd)/bionic
cd $(pwd)/bionic
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/bionic && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../
rm -rf $(pwd)/bionic

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_core" $(pwd)/system/core
cd $(pwd)/system/core
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/core && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/core

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_libufdt" $(pwd)/system/libufdt
cd $(pwd)/system/libufdt
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/libufdt && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/libufdt

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_extras" $(pwd)/system/extras
cd $(pwd)/system/extras
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/extras && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/extras

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_sepolicy" $(pwd)/system/sepolicy
cd $(pwd)/system/sepolicy
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/sepolicy && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/sepolicy

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_vold" $(pwd)/system/vold
cd $(pwd)/system/vold
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/vold && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/vold

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_update_engine" $(pwd)/system/update_engine
cd $(pwd)/system/update_engine
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/update_engine && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/update_engine

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_timezone" $(pwd)/system/timezone
cd $(pwd)/system/timezone
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/timezone && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/timezone

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_system_bt" $(pwd)/system/bt
cd $(pwd)/system/bt
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/system/bt && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../..
rm -rf $(pwd)/system/bt

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_commonsys_system_bt" $(pwd)/vendor/qcom/system/bt
cd $(pwd)/vendor/qcom/system/bt
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/system/bt && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/vendor/qcom/system/bt

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/xd_vendor_qcom_opensource_commonsys_packages_apps_Bluetooth" $(pwd)/vendor/qcom/apps/Bluetooth
cd $(pwd)/vendor/qcom/apps/Bluetooth
git checkout -b staging-${CAF_TAG}
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/packages/apps/Bluetooth && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push -f origin staging-${CAF_TAG}
cd ../../..
rm -rf $(pwd)/vendor/qcom/apps/Bluetooth

tg_post_msg "<b>xdroid Source Updater</b>%0A<code>Source successfull upstreamed</code>"
