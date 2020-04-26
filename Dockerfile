FROM alpine

RUN apk add --no-cache iptables ppp pptpd

COPY ./data/pptpd.conf    /etc/
COPY ./data/chap-secrets  /etc/ppp/
COPY ./data/pptpd-options /etc/ppp/

EXPOSE 1723

CMD set -xe \
#    && echo -e 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf \
#    && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
#    && iptables-save \
    && pptpd \
    && syslogd -n -O /dev/stdout
