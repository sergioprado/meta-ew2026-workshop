FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
    file://99-torq.rules \
"

do_install:append() {
    install -d ${D}/etc/udev/rules.d/
    install -m 644 ${WORKDIR}/99-torq.rules ${D}/etc/udev/rules.d/
}
