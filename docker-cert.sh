DEFAULT_CERT_DIR=$(openssl version -d | sed -e "s/^OPENSSLDIR: \"//" -e "s/\"$//")

CAFILE=${SSL_CERT_FILE:-$DEFAULT_CERT_DIR/cert.pem}
CAPATH=${SSL_CERT_DIR:-$DEFAULT_CERT_DIR/certs}

CONT_CAFILE=/ssl/cert.pem
CONT_CAPATH=/ssl/certs

# Can't just mount CAPATH, because typically many certificates are symbolic
# links and symlinks don't work through bindmounts.
# Instead we iterate the directory and build a list of mount flags to mount each 
# file individually - bind mount resolves symlinks before mount.
CERT_MOUNT_FLAGS=$(ls $CAPATH | sed "s|.*|-v $CAPATH/&:$CONT_CAPATH/&|")

case $1 in
  run)
    shift
    docker run \
      -v $CAFILE:$CONT_CAFILE \
      -e SSL_CERT_FILE=$CONT_CAFILE \
      $CERT_MOUNT_FLAGS \
      -e SSL_CERT_DIR=$CONT_CAPATH \
        $@
    ;;
  *)
    docker $@
    ;;
esac