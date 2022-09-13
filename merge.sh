#!/usr/bin/env bash
#
# Copyright (C) 2021-2022 a xyzprjkt property
#

AOSP_TAG=android-13.0.0_r6
XD_VERSION=r6
XD_BRANCH=thirteen
XD_BRANCH_NEW=thirteen_${AOSP_TAG}
XD_REPO_LIST=(bootable_recovery
			  art
			  bionic
			  build
			  build_soong
			  libcore
			  external_e2fsprogs
			  external_gptfdisk
			  external_exfatprogs
			  external_mksh
			  external_selinux
			  external_tinycompress
			  external_sqlite
			  frameworks_av
			  frameworks_base
			  frameworks_native
			  hardware_libhardware
			  packages_apps_Nfc
			  packages_apps_ThemePicker
			  packages_apps_Settings
			  packages_apps_WallpaperPicker2
			  packages_modules_adb
			  packages_modules_Connectivity
			  system_update_engine
			  system_core
			  system_sepolicy
			  system_vold)

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
tg_post_msg() {
	curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHAT_ID" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"
}

# Send Upstream Source Information
tg_post_msg "<b>xdroid Source Updater</b>%0A<b>xdroid Revision</b>: <code>${XD_VERSION}</code>%0A<b>AOSP Revision</b>: <code>${AOSP_TAG}</code>%0A<b>xdroid Version</b>: <code>${XD_VERSION}</code>"


for str in ${XD_REPO_LIST[@]}; do
  git clone https://$GH_USERNAME:$GH_TOKEN@github.com/xdroid-oss/xd_${str} xd_${str} -b ${XD_BRANCH}
  cd xd_${str}
  git remote add aosp https://android.googlesource.com/platform/${str//_//}
  git fetch aosp ${AOSP_TAG} && git merge FETCH_HEAD
  git checkout -b ${XD_BRANCH_NEW}
  git push origin ${XD_BRANCH_NEW}
  tg_post_msg "<b>xdroid Source Updater</b>%0A<code>${str} was pushed in ${XD_BRANCH_NEW}</code>"
  cd ../
done

tg_post_msg "<b>xdroid Source Updater</b>%0A<code>Source successfull upstreamed</code>"
