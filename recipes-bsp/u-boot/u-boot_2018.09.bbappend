FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://u-boot_device_tree.diff \
            file://hs-bsp-tree.dts;subdir=build/source/git/arch/arm/dts \
            file://debug_boot.cmd \
            "

do_compile_append() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/debug_boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
