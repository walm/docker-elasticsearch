FROM walm/java
MAINTAINER Andreas Wålm "andreas@walm.net"

RUN mkdir /setup
ADD . /setup
RUN /setup/install.sh
ADD elasticsearch.sh /etc/service/elasticsearch/run
CMD ["/sbin/my_init"]

VOLUME ["/opt/elasticsearch"]

EXPOSE 9200
EXPOSE 9300
