FILESEXTRAPATHS_prepend := "${THISDIR}:"

SRC_URI += "file://debug_boot.cmd \
           "

do_compile_append() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/debug_boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
