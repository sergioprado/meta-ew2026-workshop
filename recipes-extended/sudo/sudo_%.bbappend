FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#PV = "1.9.17p1"
#SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
#SRC_URI:remove = "file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
#SRC_URI:append = "file://0001-new-sudo.conf.in-fix-conflict-with-multilib.patch"
#LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa"

SRC_URI:append = "\
    file://woot1337.c \
"

do_compile:append() {
    cp ${WORKDIR}/woot1337.c ${B}
    ${CC} ${CFLAGS} ${LDFLAGS} -fPIC -shared -Wl,-soname,woot1337.so.2 -o ${B}/woot1337.so.2 ${B}/woot1337.c 
}

do_install:append() {
    install -m 755 ${B}/woot1337.so.2 ${D}/usr/lib/
}
