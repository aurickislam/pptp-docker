FROM alpine

RUN apk add --no-cache iptables ppp pptpd

COPY ./data/pptpd.conf    /etc/
COPY ./data/chap-secrets  /etc/ppp/
COPY ./data/pptpd-options /etc/ppp/

EXPOSE 1723

CMD set -xe \
#    && echo -e 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf \
#    && iptables -I INPUT -p tcp --dport 1723 -m state --state NEW -j ACCEPT \
#    && iptables -I INPUT -p gre -j ACCEPT \
#    && iptables -t nat -I POSTROUTING -o eno1 -j MASQUERADE \
#    && iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -s 192.168.127.0/24 -j TCPMSS --clamp-mss-to-pmtu \
#    && iptables-save \
#    && iptables -P FORWARD ACCEPT \
#    && iptables -P OUTPUT ACCEPT \
#    && iptables-save \

#    && echo -e 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf \
#    && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
#    && iptables-save \
    && pptpd \
    && syslogd -n -O /dev/stdout
