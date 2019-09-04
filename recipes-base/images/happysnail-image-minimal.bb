SUMMARY = "A small image just capable of allowing a device to boot. Added here for fun and for more installed packages"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
IMAGE_INSTALL += "dropbear opkg python3 wpa-supplicant iw python3-pip xradio"
EXTRA_IMAGE_FEATURES += "package-management"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
APPEND += "printk.time=y initcall_debug debug loglevel=7"
