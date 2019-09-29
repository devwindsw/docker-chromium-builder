FROM ubuntu:18.04

# Add the path to depot_tools to PATH.
ENV DEPOT_TOOLS /chromium/depot_tools
ENV PATH $PATH:$DEPOT_TOOLS
RUN echo -e "\n# Add Chromium's depot_tools to the PATH." >> .bashrc
RUN echo "export PATH=\"\$PATH:$DEPOT_TOOLS\"" >> .bashrc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && perl -pi -e 's/archive.ubuntu.com/us.archive.ubuntu.com/' /etc/apt/sources.list \
    && apt-get update -y

RUN apt-get install -y apt-utils build-essential curl git lsb-base lsb-release sudo

RUN apt-get install -y python

RUN dpkg --add-architecture i386
RUN apt-get update -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -qq --assume-yes \
    adwaita-icon-theme apache2 apache2-bin apache2-data apache2-utils \
    at at-spi2-core autoconf automake autopoint autotools-dev \
    binutils-aarch64-linux-gnu binutils-arm-linux-gnueabihf \
    binutils-mips64el-linux-gnuabi64 binutils-mipsel-linux-gnu \
    bison bsdmainutils bzip2-doc cdbs comerr-dev dbus dbus-x11 \
    dconf-gsettings-backend dconf-service dctrl-tools debhelper debugedit devscripts dh-autoreconf dh-strip-nondeterminism \
    dh-translations diffstat dput elfutils flex fontconfig fontconfig-config fonts-dejavu-core fonts-lato gcc-8-base:i386 \
    gdal-data gettext gettext-base giblib1 gir1.2-appindicator3-0.1 gir1.2-atk-1.0 gir1.2-atspi-2.0 gir1.2-dbusmenu-glib-0.4 \
    gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 gir1.2-gnomekeyring-1.0 gir1.2-gtk-3.0 gir1.2-harfbuzz-0.0 \
    gir1.2-pango-1.0 git-svn glib-networking glib-networking-common glib-networking-services gnome-icon-theme gperf groff-base \
    gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme i965-va-driver ibverbs-providers \
    icu-devtools intltool intltool-debian iso-codes javascript-common jq krb5-multidev libaacs0 libaec0 libapache2-mod-php7.2 \
    libapparmor1 libappindicator3-1 libappindicator3-dev libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap \
    libapt-pkg-perl libarchive-cpio-perl libarchive-zip-perl libarchive13 libargon2-0 libarmadillo8 libarpack2 libasm1 libasound2 \
    libasound2-data libasound2-dev libasyncns0 libatk-bridge2.0-0 libatk-bridge2.0-dev libatk1.0-0 libatk1.0-data libatk1.0-dev \
    libatspi2.0-0 libatspi2.0-dev libauthen-sasl-perl libavahi-client3 libavahi-common-data libavahi-common3 libavcodec57 \
    libavformat57 libavutil55 libb-hooks-endofscope-perl libb-hooks-op-check-perl libbdplus0 libbison-dev libblas3 libbluetooth-dev \
    libbluetooth3 libbluray2 libbrlapi-dev libbrlapi0.6 libbz2-dev libc6:i386 libcairo-gobject2 libcairo-script-interpreter2 \
    libcairo2 libcairo2-dev libcap-dev libcap2 libcgi-fast-perl libcgi-pm-perl libcharls1 libchromaprint1 libclass-accessor-perl \
    libclass-method-modifiers-perl libclass-xsaccessor-perl libclone-perl libcolord2 libcroco3 libcrystalhd3 libcups2 libcups2-dev \
    libcupsfilters-dev libcupsfilters1 libcupsimage2 libcupsimage2-dev \
    libcurl4-gnutls-dev libdap25 libdapclient6v5 libdata-dump-perl \
    libdata-optlist-perl libdatrie1 libdbus-1-3 libdbus-1-dev libdbus-glib-1-2 libdbus-glib-1-dev libdbusmenu-glib-dev \
    libdbusmenu-glib4 libdbusmenu-gtk3-4 libdc1394-22 libdconf1 libdevel-callchecker-perl libdevel-globaldestruction-perl \
    libdigest-hmac-perl libdistro-info-perl libdrm-amdgpu1 libdrm-common libdrm-dev libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 \
    libdrm2 libdw1 libdynaloader-functions-perl libegl-mesa0 libegl1 libegl1-mesa-dev libelf-dev libelf1 libemail-valid-perl \
    libencode-locale-perl libepoxy-dev libepoxy0 libepsilon1 libexif12 libexpat1-dev libexporter-tiny-perl libfabric1 libfcgi-perl \
    libffi-dev libfile-basedir-perl libfile-chdir-perl libfile-homedir-perl libfile-listing-perl libfile-stripnondeterminism-perl libfile-which-perl libfl-dev libfl2 libflac8 libfm-extra4 libfont-afm-perl libfontconfig1 libfontconfig1-dev libfontenc1 libfreetype6 libfreetype6-dev libfreexl1 libfyba0 libgail-common libgail18 libgbm-dev libgbm1 libgcc1:i386 libgd3 libgdal20 libgdcm2.8 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgdk-pixbuf2.0-dev libgeos-3.6.2 libgeos-c1v5 \
    libgeotiff2 libgetopt-long-descriptive-perl libgfortran4 libgif7 libgirepository-1.0-1 libgit-wrapper-perl libgl1 libgl1-mesa-dev libgl1-mesa-dri libgl2ps1.4 libglapi-mesa libgles1 libgles2 libglib2.0-0 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglu1-mesa libglu1-mesa-dev libglvnd-core-dev libglvnd-dev libglvnd0 libglx-mesa0 libglx0 libgme0 libgnome-keyring-common libgnome-keyring-dev libgnome-keyring0 libgpgme11 libgphoto2-6 libgphoto2-l10n libgphoto2-port12 libgraphite2-3 libgraphite2-dev libgsm1 libgssrpc4 \
    libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk-3-dev libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 libharfbuzz0b libhdf4-0-alt libhdf5-100 libhdf5-openmpi-100 libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libhwloc-plugins libhwloc5 libibverbs1 libice-dev libice6 libicu-dev libicu-le-hb-dev \
    libicu-le-hb0 libicu60 libiculx60 libid3tag0 libilmbase12 libimlib2 libimport-into-perl libindicator3-7 libio-html-perl libio-pty-perl libio-socket-inet6-perl libio-socket-ssl-perl libio-string-perl libio-stringy-perl libipc-run-perl libipc-system-simple-perl libjbig-dev libjbig0 libjpeg-dev libjpeg-turbo8 libjpeg-turbo8-dev libjpeg8 libjpeg8-dev libjq1 libjs-jquery libjs-sphinxdoc libjs-underscore libjson-c3 libjson-glib-1.0-0 libjson-glib-1.0-common libjsoncpp1 libkadm5clnt-mit11 libkadm5srv-mit11 \
    libkdb5-9 libkmlbase1 libkmldom1 libkmlengine1 libkrb5-dev liblapack3 liblcms2-2 liblept5 liblist-compare-perl liblist-moreutils-perl libllvm8 libltdl-dev libltdl7 liblua5.2-0 liblwp-mediatypes-perl liblwp-protocol-https-perl liblzma-dev liblzo2-2 libmail-sendmail-perl libmailtools-perl libmenu-cache-bin libmenu-cache3 libminizip1 libmodule-implementation-perl libmodule-runtime-perl libmoo-perl libmp3lame0 libmpg123-0 libmysqlclient20 libnamespace-clean-perl libnet-dns-perl libnet-domain-tld-perl \
    libnet-http-perl libnet-ip-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnetcdf-c++4 libnetcdf13 libnl-3-200 libnl-route-3-200 libnspr4 libnspr4-dev libnss3 libnss3-dev libnuma1 libnumber-compare-perl libnumber-range-perl libobrender32v5 libobt2v5 libodbc1 libogdi3.2 libogg0 libonig4 libopencv-calib3d3.2 libopencv-contrib3.2 libopencv-core3.2 libopencv-features2d3.2 libopencv-flann3.2 libopencv-highgui3.2 libopencv-imgcodecs3.2 libopencv-imgproc3.2 libopencv-ml3.2 libopencv-objdetect3.2 \
    libopencv-photo3.2 libopencv-shape3.2 libopencv-stitching3.2 libopencv-superres3.2 libopencv-video3.2 libopencv-videoio3.2 libopencv-videostab3.2 libopencv-viz3.2 libopenexr22 libopengl0 libopenjp2-7 libopenmpi2 libopenmpt0 libopus0 libpackage-stash-perl libpackage-stash-xs-perl libpam0g-dev libpango-1.0-0 libpango1.0-0 libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0 libpangox-1.0-0 libpangoxft-1.0-0 libparams-classify-perl libparams-util-perl libparams-validate-perl libparse-debianchangelog-perl \
    libpath-iterator-rule-perl libpath-tiny-perl libpci-dev libpci3 libpci3:i386 libpciaccess0 libpcre16-3 libpcre3-dev libpcre32-3 libpcrecpp0v5 libperlio-gzip-perl libpipeline1 libpixman-1-0 libpixman-1-dev libpng-dev libpng-tools libpng16-16 libpod-constants-perl libpoppler73 libpopt0 libpq5 libproj12 libproxy1v5 libpsm-infinipath1 libpthread-stubs0-dev libpulse-dev libpulse-mainloop-glib0 libpulse0 libpython-dev libpython2.7 libpython2.7-dev libqhull7 libraw1394-11 librdmacm1 libregexp-pattern-license-perl \
    librest-0.7-0 librole-tiny-perl librpm8 librpmbuild8 librpmio8 librpmsign8 librsvg2-2 librsvg2-common libruby2.5 libsctp-dev libsctp1 libsensors4 libserf-1-1 libshine3 libsigsegv2 libsm-dev libsm6 libsnappy1v5 libsndfile1 libsocket++1 libsocket6-perl libsodium23 libsort-key-perl libsort-versions-perl libsoup-gnome2.4-1 libsoup2.4-1 libsoxr0 libspatialite7 libspeechd-dev libspeechd2 libspeex1 libsqlite3-dev libssh-gcrypt-4 libssl-dev libstartup-notification0 libstrictures-perl libstring-copyright-perl \
    libstring-escape-perl libsub-exporter-perl libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl libsub-name-perl libsub-quote-perl libsuperlu5 libsvn-perl libsvn1 libswresample2 libswscale4 libsys-hostname-long-perl libsz2 libtbb2 libtcl8.6 libterm-readkey-perl libtesseract4 libtext-glob-perl libtext-levenshtein-perl libthai-data libthai0 libtheora0 libtiff-dev libtiff5 libtiff5-dev libtiffxx5 libtimedate-perl libtk8.6 libtool libtry-tiny-perl libtwolame0 libudev-dev \
    libudev1:i386 libunicode-utf8-perl libunwind8 liburi-perl liburiparser1 libusb-1.0-0 libva-drm2 libva-x11-2 libva2 libvariable-magic-perl libvdpau1 libvorbis0a libvorbisenc2 libvorbisfile3 libvpx5 libvtk6.3 libwavpack1 libwayland-bin libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl1 libwayland-egl1-mesa libwayland-server0 libwebp6 libwebpmux3 libwrap0 libwww-perl libwww-robotrules-perl libx11-dev libx11-doc libx11-xcb-dev libx11-xcb1 libx11-xcb1:i386 libx264-152 libx265-146 \
    libxau-dev libxaw7 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xfixes0-dev libxcb1-dev libxcomposite-dev libxcomposite1 libxcursor-dev libxcursor1 libxdamage-dev libxdamage1 libxdmcp-dev libxerces-c3.2 libxext-dev libxfixes-dev libxfixes3 \
    libxft-dev libxft2 libxi-dev libxi6 libxinerama-dev libxinerama1 libxkbcommon-dev libxkbcommon0 libxml-libxml-perl libxml-namespacesupport-perl libxml-parser-perl libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl libxml-simple-perl libxml2 libxml2-dev libxmu6 libxpm4 libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence-dev libxshmfence1 libxslt1-dev libxslt1.1 libxss-dev libxss1 libxt-dev libxt6 libxtst-dev libxtst6 libxv1 libxvidcore4 libxxf86dga1 libxxf86vm-dev libxxf86vm1 \
    libyaml-0-2 libyaml-libyaml-perl libyaml-perl libzvbi-common libzvbi0 licensecheck lintian linux-libc-dev:i386 locales lxmenu-data m4 man-db mesa-common-dev mesa-va-drivers mesa-vdpau-drivers mysql-common obconf obsession ocl-icd-libopencl1 odbcinst odbcinst1debian2 openbox openbox-menu openmpi-bin openmpi-common p7zip patchutils perl-openssl-defaults php-common php7.2-cgi php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline pkg-config po-debconf poppler-data proj-bin proj-data \
    psmisc python-apt-common python-asn1crypto python-cffi-backend python-cherrypy3 python-crypto python-cryptography python-dev python-enum34 python-idna python-ipaddress python-numpy python-opencv python-openssl python-pkg-resources python-psutil python-repoze.lru python-routes python-simplejson python-six python-webob python-yaml python2.7-dev python3-apt python3-certifi python3-chardet python3-debian python3-distutils python3-gpg python3-idna python3-lib2to3 python3-magic python3-pkg-resources \
    python3-requests python3-scour python3-six python3-unidiff python3-urllib3 python3-xdg rake rpm rpm-common rpm2cpio ruby ruby-did-you-mean ruby-minitest ruby-net-telnet ruby-power-assert ruby-test-unit ruby2.5 rubygems-integration scour scrot shared-mime-info ssl-cert strace subversion t1utils ubuntu-mono ucf unzip uuid-dev va-driver-all vdpau-driver-all wayland-protocols wdiff x11-common x11-utils x11proto-composite-dev x11proto-core-dev x11proto-damage-dev x11proto-dev x11proto-fixes-dev \
    x11proto-input-dev x11proto-randr-dev x11proto-record-dev x11proto-scrnsaver-dev x11proto-xext-dev x11proto-xf86vidmode-dev x11proto-xinerama-dev xcompmgr xdg-user-dirs xkb-data xorg-sgml-doctools xtrans-dev zip zlib1g:i386 zlib1g-dev bzip2 libbz2-1.0 libudev1 bzip2 libbz2-1.0 libudev1

RUN apt-get install -qq --assume-yes tzdata

RUN locale-gen da_DK.UTF-8
RUN locale-gen fr_FR.UTF-8
RUN locale-gen he_IL.UTF-8
RUN locale-gen zh_TW.UTF-8

RUN apt-get -f install
RUN apt-get -y install lib32z1 lighttpd python-pexpect xvfb x11-utils
RUN apt-get -y install libncurses5:i386 libstdc++6:i386 zlib1g:i386
RUN apt-get -y install bsdiff
RUN apt-get -y install openjdk-8-jre openjdk-8-jdk

RUN apt-get -y install vim
