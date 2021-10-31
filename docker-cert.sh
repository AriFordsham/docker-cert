# docker run \
#   --mount type=bind,source=$CERTFILE,target=/certs/ssl/cert.pem \
#   --mount type=bind,source=$CERTDIR,target=/certs/ssl/certs \
#   -e "SSL_CERT_DIR=/certs/ssl/certs" \
#   -e "SSL_CERT_FILE=/certs/ssl/cert.pem" \
#   docker-cert

docker run -ti --mount type=bind,source=/usr/local/share/ca-certificates/netfree-ca.crt,target=/usr/lib/ssl/certs/netfree-ca.pem docker-cert bash