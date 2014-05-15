echo "# Installing Elasticsearch"
wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz -O /tmp/es.tgz
tar -xzf /tmp/es.tgz -C /opt/
mv /opt/elasticsearch-1.1.1 /opt/elasticsearch
mkdir -p /etc/service/elasticsearch

echo "# Install kopf plugin"
/opt/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf

# make sure are service user has permissions to es
chown -R app:app /opt/elasticsearch

echo "# Cleaning up"
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /setup /build
