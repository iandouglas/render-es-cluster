# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:8.13.1
ENV NODE_TYPE $NODE_TYPE

#USER 0
#RUN mkdir -p /etc/elasticsearch/certs
#RUN bin/elasticsearch-certutil ca --pem --out elastic-stack-ca.zip
#RUN cp /usr/share/elasticsearch/elastic-stack-ca.zip /etc/elasticsearch/certs
#RUN unzip /etc/elasticsearch/certs/elastic-stack-ca.zip -d /etc/elasticsearch/certs/

#COPY --chown=1000:0 config/instances.yml /tmp/instances.yml
#RUN bin/elasticsearch-certutil cert --silent --pem --ca-key /etc/elasticsearch/certs/ca/ca.key --ca-cert /etc/elasticsearch/certs/ca/ca.crt --in /tmp/instances.yml --out nodes.zip

#RUN cp /usr/share/elasticsearch/nodes.zip /etc/elasticsearch/certs/
#RUN unzip /etc/elasticsearch/certs/nodes.zip -d /etc/elasticsearch/certs/

# Copy our config file over
COPY --chown=1000:0 config/${NODE_TYPE}-elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
