ARG ELASTICSEARCH_VERSION=8.17.0
FROM elasticsearch:${ELASTICSEARCH_VERSION}

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY roles.yml /usr/share/elasticsearch/config/roles.yml
COPY entrypoint-new.sh /usr/share/elasticsearch/entrypoint-new.sh
RUN chmod +x /usr/share/elasticsearch/entrypoint-new.sh

USER root
RUN apt-get update && apt-get install -y sudo && \
    echo "elasticsearch ALL=(root) NOPASSWD: /usr/bin/chown" >> /etc/sudoers

USER elasticsearch
ENTRYPOINT ["/usr/share/elasticsearch/entrypoint-new.sh"]
