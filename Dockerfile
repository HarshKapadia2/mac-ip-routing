FROM httpd
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN echo "ServerName localhost" | tee -a /usr/local/apache2/conf/httpd.conf
RUN apt-get update
RUN apt-get install -y iputils-ping inetutils-traceroute iproute2 dnsutils net-tools tcpdump wireshark curl vim man git
