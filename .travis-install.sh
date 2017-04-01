#! /bin/sh
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
set -e
SAGE_ARCHIVE="sage-$SAGE_VERSION-$SAGE_DISTRO_SUFFIX-$SAGE_ARCH.tar.bz2"
SAGE_IMAGE="$SAGE_OS_DIR/$SAGE_ARCHIVE"
SAGE_TORRENT="$SAGE_OS_DIR/meta/$SAGE_ARCHIVE.torrent"
if [ ! -x SageMath/sage ] ; then
    if [ ! -f $SAGE_ARCHIVE ] ; then 
        echo "### Downloading Sage binary distribution"
        rm -f SageMath.tar.bz2
        #aria2c $SAGE_SERVER$SAGE_TORRENT -o SageMath.tar.bz2 ||
        wget $SAGE_SERVER$SAGE_IMAGE -O $SAGE_ARCHIVE
    fi
    echo "### Unpacking Sage binary distribution"
    tar xf $SAGE_ARCHIVE
    ls -l
fi
