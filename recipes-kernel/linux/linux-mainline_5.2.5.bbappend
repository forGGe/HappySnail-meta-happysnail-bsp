# Add more configuration values to kernel config.

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://fragment.cfg"
SRC_URI += "file://hs-bsp-tree.dts;subdir=linux-5.2.5/arch/${ARCH}/boot/dts"

