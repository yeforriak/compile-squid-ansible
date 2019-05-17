-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: squid
Binary: squid3, squid, squid-common, squidclient, squid-cgi, squid-purge
Architecture: any all
Version: 4.4-1
Maintainer: Luigi Gangitano <luigi@debian.org>
Uploaders: Santiago Garcia Mantinan <manty@debian.org>
Homepage: http://www.squid-cache.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/squid-team/squid
Vcs-Git: https://salsa.debian.org/squid-team/squid.git
Testsuite: autopkgtest
Testsuite-Triggers: apache2, apparmor-utils, elinks, fakeroot, netcat, pygopherd, ssl-cert, vsftpd
Build-Depends: ed, libltdl-dev, pkg-config, g++ (>= 4.9) | clang (>= 3.7), gcc (>= 4.9) | clang (>= 3.7), cdbs, debhelper (>= 10), dpkg-dev (>= 1.17.11~), lsb-release, libcppunit-dev, libcap2-dev [linux-any], libdb-dev, libecap3-dev (>= 1.0.1-2), libexpat1-dev, libgnutls28-dev (>= 3.5), libkrb5-dev, comerr-dev, libldap2-dev, libnetfilter-conntrack-dev [linux-any], libpam0g-dev, libsasl2-dev, libxml2-dev, nettle-dev
Package-List:
 squid deb web optional arch=any
 squid-cgi deb web optional arch=any
 squid-common deb web optional arch=all
 squid-purge deb web optional arch=any
 squid3 deb oldlibs optional arch=all
 squidclient deb web optional arch=any
Checksums-Sha1:
 f8a45921c088db2add7bead74027596f45ebc571 5167256 squid_4.4.orig.tar.gz
 efe7c0d96ff9d5f27494b835d945d7c8d3322894 36596 squid_4.4-1.debian.tar.xz
Checksums-Sha256:
 7054b51a4814391094426c51644eed81588611999aeec4b4a500cd4a8aae5e85 5167256 squid_4.4.orig.tar.gz
 8a1bb30b93ffbf50ee9f81cf588cd07b52a29a1791b2a0236ec0ea35700ec556 36596 squid_4.4-1.debian.tar.xz
Files:
 b94eeae7e8b9778c3ecfe8488ddd25a1 5167256 squid_4.4.orig.tar.gz
 1ffc3aa1927c7fd8d67153f5c7635b7a 36596 squid_4.4-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEjUhaNf8ebreQ5Q9tAoTyDCupfO0FAlvYbI4ACgkQAoTyDCup
fO1DMw/+KFcd68zmyqkajiGf/EyLwHYg5v8jmB3MxTtgFya7Bqan06Cv7RJ4Lk4b
sjd116RkhfoZDxY4JvFFSVel7BE15yUB3ZACE0ys7LVSv6kYd8r2JrHqhf8TkP3Q
FkMJtZbfeZ/XnCsll2XOGczLpmoc5DzVOuTgYt2HJC/6zgna2kxLDaevxv7o6HA/
w1wz5F9kq/Wxwz9aQeB/nHzreMLFQFKFkl7xUQJf6hyvdotIiLqWvwsRa8eOSFcn
9LQe5aZr3i1vZ2b6Kuc5Jc/tmAPjoLX0trdKgaFWumk0vrocY2yl6lLrCA4JLObZ
IqLEFIyskhmNZ3nb4fuoRhw7f8J8T9Tgn7WPyhipaIblVxTAgcgajhNHvOgzgb+1
V2X1HgvkEUcf7XsH57aZdLrHdPiPyh91px50xynsfcfeo+rXSw+Lh41kWTkmLk+d
fyfrPOAhzzcvwu3do6QNGLaFhwItq6vagHP4XNdep/I1wZ0NDR9Pn9btEaihvCk6
+V5P5sml/JdaV6hM+Ss01yDODD8xOrdWqvrYRFl4aplev5U5BuPse7NgTlk94Ijc
jwA1KS9YX4P5Rs7qMm8QRfuEZtLB2hKhm5AkpNO2H50CmeXSZ9mlG2ISZJir3thT
80jIjVu9CMxrVmu4frslpDoBQV1Lg18xC9bUiwfXdExHahIYmww=
=PPia
-----END PGP SIGNATURE-----
