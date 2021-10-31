FROM ubuntu

RUN apt update
RUN apt install -y openssl

CMD openssl s_client -connect www.google.com:443