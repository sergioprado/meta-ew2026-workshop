do_install:append() {
    install -d ${D}/etc/
    touch ${D}/etc/usb-debugging-enabled
}

FILES:${PN}-adbd += "/etc/usb-debugging-enabled"
