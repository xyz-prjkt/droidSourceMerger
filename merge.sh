#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

CAF_TAG=LA.QSSI.11.0.r1-12400.02-qssi.0

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/build_make" $(pwd)/build/make
cd $(pwd)/build/make
git remote add caf https://source.codeaurora.org/quic/la/platform/build && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/build/make

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/build_blueprint" $(pwd)/build/blueprint
cd $(pwd)/build/blueprint
git remote add caf https://source.codeaurora.org/quic/la/platform/build/blueprint && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/build/blueprint

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/build_soong" $(pwd)/build/soong
cd $(pwd)/build/soong
git remote add caf https://source.codeaurora.org/quic/la/platform/build/soong && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/build/soong

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/frameworks_av" $(pwd)/frameworks/av
cd $(pwd)/frameworks/av
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/av && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/frameworks/av

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/frameworks_base" $(pwd)/frameworks/base
cd $(pwd)/frameworks/base
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/base && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/frameworks/base

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/frameworks_native" $(pwd)/frameworks/native
cd $(pwd)/frameworks/native
git remote add caf https://source.codeaurora.org/quic/la/platform/frameworks/native && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/frameworks/native

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/hardware_interfaces" $(pwd)/hardware/interfaces
cd $(pwd)/hardware/interfaces
git remote add caf https://source.codeaurora.org/quic/la/platform/hardware/interfaces && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/hardware/interfaces

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/packages_apps_Bluetooth" $(pwd)/packages/apps/Bluetooth
cd $(pwd)/packages/apps/Bluetooth
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/apps/Bluetooth && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/packages/apps/Bluetooth

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/packages_apps_Settings" $(pwd)/packages/apps/Settings
cd $(pwd)/packages/apps/Settings
git remote add caf https://source.codeaurora.org/quic/la/platform/packages/apps/Settings && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/packages/apps/Settings

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/system_core" $(pwd)/system/core
cd $(pwd)/system/core
git remote add caf https://source.codeaurora.org/quic/la/platform/system/core && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/system/core

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/vendor_qcom_opensource_commonsys_system_bt" $(pwd)/vendor/qcom/opensource/commonsys/system/bt
cd $(pwd)/vendor/qcom/opensource/commonsys/system/bt
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/system/bt && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/vendor/qcom/opensource/commonsys/system/bt

git clone "https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-CAF/vendor_qcom_opensource_commonsys_packages_apps_Bluetooth" $(pwd)/vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
cd $(pwd)/vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
git remote add caf https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/packages/apps/Bluetooth && git fetch caf ${CAF_TAG} && git merge FETCH_HEAD
git push
rm -rf $(pwd)/vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
